@interface USUsageQuerying(Biome)
@end

@implementation USUsageQuerying(Biome)

+ (void)_completion:()Biome options:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [a2 error];
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to query Biome for usage reports with options %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end