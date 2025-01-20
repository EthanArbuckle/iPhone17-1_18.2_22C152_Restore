@interface NSURL
@end

@implementation NSURL

uint64_t __43__NSURL_FCAdditions__fc_fileSystemFreeSize__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "failed to lookup file system free size with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __69__NSURL_FCAdditions__fc_volumeAvailableCapacityForOpportunisticUsage__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "failed to lookup volume available capacity for opportunistic usage with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end