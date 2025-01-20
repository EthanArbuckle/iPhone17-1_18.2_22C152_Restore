@interface PLBatteryUIResponseTypeChargingStateIntervals(Utilities)
@end

@implementation PLBatteryUIResponseTypeChargingStateIntervals(Utilities)

- (void)constructIntervalTuplesFromBattEntries:()Utilities lastBattEntry:startOfRange:endOfRange:.cold.4(void *a1, char a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 1024;
  int v8 = a2 & 1;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "Iterating through %lu entries, interval open: %d", (uint8_t *)&v5, 0x12u);
}

@end