@interface NTPBBloomFilterInfo
@end

@implementation NTPBBloomFilterInfo

uint64_t __56__NTPBBloomFilterInfo_FCAdditions__fc_maybeContainsURL___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138477827;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "no domain for %{private}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

@end