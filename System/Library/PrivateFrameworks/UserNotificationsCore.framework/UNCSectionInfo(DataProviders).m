@interface UNCSectionInfo(DataProviders)
@end

@implementation UNCSectionInfo(DataProviders)

+ (void)defaultSectionInfoForSection:()DataProviders .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = a2;
  v6 = [a3 localizedDescription];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_2608DB000, v5, OS_LOG_TYPE_ERROR, "Encountered error obtaining application record for section %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end