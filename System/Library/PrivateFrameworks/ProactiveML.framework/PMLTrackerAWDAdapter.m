@interface PMLTrackerAWDAdapter
- (void)postMetricId:(unsigned int)a3 message:(id)a4;
@end

@implementation PMLTrackerAWDAdapter

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = PML_LogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 1024;
    unsigned int v10 = a3;
    _os_log_debug_impl(&dword_2212A0000, v6, OS_LOG_TYPE_DEBUG, "Sending %@ (%d) to AWD.", (uint8_t *)&v7, 0x12u);
  }

  AWDPostMetric();
}

@end