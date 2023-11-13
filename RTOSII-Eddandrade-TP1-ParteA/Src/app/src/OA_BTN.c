/*
 * OA_BTN.c
 *
 *  Created on: Nov 12, 2023
 *      Author: Compumax
 */

#include "OA_BTN.h"

volatile uint32_t RisingUp_Time = 0;
volatile uint32_t FallingDown_Time = 0;
volatile uint32_t BtnPressed_Time = 0;
bool flag = 0;
enum Btn_Status Btn_State;
BaseType_t sd;
QueueHandle_t QueueBtnStatus;
uint32_t aux;
const char *OABTN_WelcomeMsg    	= "OA_BTN se está ejecutando\r\n";
const char *debug1    				= "entre a la IRQ\r\n";
const char *debug2    				= "entre a la SET\r\n";
const char *debug3    				= "entre a la RESET\r\n";

const char *SHORTPRESSEDMsg    		= "SHORTPRESSED\r\n";
const char *LONGPRESSEDMsg 			= "LONGPRESSED\r\n";
const char *BLOCKEDMsg 				= "BLOCKED\r\n";
const char *UNBLOCKEDMsg  			= "UNBLOCKED\r\n";

// Interrupción

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	//vPrintString( debug1 );
	aux = HAL_GetTick()/portTICK_PERIOD_MS; //guardo el tiempo en el que se llama al callback
	if (!eboard_switch()) {
	//vPrintString( debug2 );
		RisingUp_Time = aux;
		FallingDown_Time = 0;
	}
	else{
		//vPrintString( debug2 );
		FallingDown_Time = aux;
	}
}

//Tarea objeto activo
void vTask_OA_BTN(void *pvParameters) {
	vPrintString(OABTN_WelcomeMsg);
	while (1) {

		BtnPressed_Time = FallingDown_Time - RisingUp_Time;

		if (0 < BtnPressed_Time && BtnPressed_Time < 2000) {
			RisingUp_Time = 0; //Reseteo el contador de tiempo del rising edge
			vPrintString(SHORTPRESSEDMsg);
			Btn_State = SHORTPRESSED;
		} else if (2000 < BtnPressed_Time && BtnPressed_Time < 8000) {
			RisingUp_Time = 0; //Reseteo el contador de tiempo del rising edge
			vPrintString(LONGPRESSEDMsg);
			Btn_State = LONGPRESSED;

		} else if (RisingUp_Time != 0
				&& (BtnPressed_Time >= 8000 || BtnPressed_Time < 0)) {
			vPrintString(BLOCKEDMsg);
			Btn_State = BLOCKED;
		} else if (RisingUp_Time == 0 && (BtnPressed_Time >= 8000)) {
			vPrintString(UNBLOCKEDMsg);
			Btn_State = UNBLOCKED;
		}

		sd = xQueueSend(QueueBtnStatus, &Btn_State, portMAX_DELAY);
		assert(sd != 0); // revisar que el mensaje se halla encolado correctamente.
	}
}

