@interface WPHeySiri(Test)
@end

@implementation WPHeySiri(Test)

- (void)startScanningAndAdvertisingWithOptions:()Test .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "HeySiri zero advertising data", v1, 2u);
}

- (void)startScanningAndAdvertisingWithOptions:()Test .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 advertisingData];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEBUG, "HeySiri advertising data=%@", (uint8_t *)&v5, 0xCu);
}

- (void)startScanningAndAdvertisingWithOptions:()Test .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end