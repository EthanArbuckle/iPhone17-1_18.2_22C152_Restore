@interface SPLocalBeaconManager(KeyGeneration)
@end

@implementation SPLocalBeaconManager(KeyGeneration)

- (void)bucketWithBaseTime:()KeyGeneration date:.cold.1()
{
}

- (void)dateIntervalForIndex:()KeyGeneration baseDate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2FD8000, v0, v1, "Caller attempted to calculate dateInterval for bucket 0!", v2, v3, v4, v5, v6);
}

- (void)generateBeaconingKeysOfType:()KeyGeneration now:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1B2FD8000, v0, v1, "baseIndex (%llu) > currentIndex (%llu)!", v2, v3);
}

- (void)generateOfflineAdvertisingKeysForReason:()KeyGeneration now:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "No configuration for reason: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)generateOfflineAdvertisingKeysForReason:()KeyGeneration now:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2FD8000, v0, v1, "Can't honor SPShutdownReasonUserAction reason because BA_Power_Off feature is off", v2, v3, v4, v5, v6);
}

- (void)generateOfflineAdvertisingKeysForReason:()KeyGeneration now:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2FD8000, v0, v1, "Can't honor SPShutdownReasonBattery reason because BA_PLEM feature is off", v2, v3, v4, v5, v6);
}

@end