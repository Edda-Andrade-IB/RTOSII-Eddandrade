################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/lib/src/eboard.c \
../Src/lib/src/eringbuffer.c \
../Src/lib/src/euart.c 

OBJS += \
./Src/lib/src/eboard.o \
./Src/lib/src/eringbuffer.o \
./Src/lib/src/euart.o 

C_DEPS += \
./Src/lib/src/eboard.d \
./Src/lib/src/eringbuffer.d \
./Src/lib/src/euart.d 


# Each subdirectory must supply rules for building sources it contributes
Src/lib/src/%.o Src/lib/src/%.su Src/lib/src/%.cyclo: ../Src/lib/src/%.c Src/lib/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I"C:/Users/Compumax/Documents/GitHub/RTOSII-Eddandrade/RTOSII-Eddandrade-Template446RE/Src" -I"C:/Users/Compumax/Documents/GitHub/RTOSII-Eddandrade/RTOSII-Eddandrade-Template446RE/Src/app/inc" -I"C:/Users/Compumax/Documents/GitHub/RTOSII-Eddandrade/RTOSII-Eddandrade-Template446RE/Src/app/src" -I"C:/Users/Compumax/Documents/GitHub/RTOSII-Eddandrade/RTOSII-Eddandrade-Template446RE/Src/hal/inc" -I"C:/Users/Compumax/Documents/GitHub/RTOSII-Eddandrade/RTOSII-Eddandrade-Template446RE/Src/lib/inc" -I"C:/Users/Compumax/Documents/GitHub/RTOSII-Eddandrade/RTOSII-Eddandrade-Template446RE/Src/lib/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src-2f-lib-2f-src

clean-Src-2f-lib-2f-src:
	-$(RM) ./Src/lib/src/eboard.cyclo ./Src/lib/src/eboard.d ./Src/lib/src/eboard.o ./Src/lib/src/eboard.su ./Src/lib/src/eringbuffer.cyclo ./Src/lib/src/eringbuffer.d ./Src/lib/src/eringbuffer.o ./Src/lib/src/eringbuffer.su ./Src/lib/src/euart.cyclo ./Src/lib/src/euart.d ./Src/lib/src/euart.o ./Src/lib/src/euart.su

.PHONY: clean-Src-2f-lib-2f-src

