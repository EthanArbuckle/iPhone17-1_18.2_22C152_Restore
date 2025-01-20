@interface NTPBTodaySectionConfig
@end

@implementation NTPBTodaySectionConfig

void __71__NTPBTodaySectionConfig_FCAdditions__sectionConfigWithJSONDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *MEMORY[0x263F590A8];
  id v7 = a2;
  id v11 = [v7 objectForKeyedSubscript:v6];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F590B0]];

  if (v11) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  else
  {
    v10 = objc_opt_new();
    [v10 setName:v11];
    [v10 setUrlString:v8];
    [*(id *)(a1 + 32) addObject:v10];
  }
}

@end