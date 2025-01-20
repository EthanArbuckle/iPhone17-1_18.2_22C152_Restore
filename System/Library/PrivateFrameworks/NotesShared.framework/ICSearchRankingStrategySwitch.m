@interface ICSearchRankingStrategySwitch
+ (id)ICSearchRankingStrategyDisplayNames;
+ (unint64_t)currentStrategy;
+ (unint64_t)defaultStrategy;
@end

@implementation ICSearchRankingStrategySwitch

+ (id)ICSearchRankingStrategyDisplayNames
{
  if (ICSearchRankingStrategyDisplayNames_onceToken != -1) {
    dispatch_once(&ICSearchRankingStrategyDisplayNames_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)ICSearchRankingStrategyDisplayNames_displayNames;
  return v2;
}

void __68__ICSearchRankingStrategySwitch_ICSearchRankingStrategyDisplayNames__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 setObject:@"0. Prefix/Substring ⮑ Modified Date" atIndexedSubscript:0];
  [v2 setObject:@"1. (PeaceGM) Prefix/Substring ⮑ Title/Body" atIndexedSubscript:1];
  [v2 setObject:@"2. Prefix/Substring ⮑ Bucketed Modified Date ⮑ Title/Body" atIndexedSubscript:2];
  uint64_t v0 = [v2 copy];
  v1 = (void *)ICSearchRankingStrategyDisplayNames_displayNames;
  ICSearchRankingStrategyDisplayNames_displayNames = v0;
}

+ (unint64_t)defaultStrategy
{
  return 0;
}

+ (unint64_t)currentStrategy
{
  unint64_t v2 = [a1 defaultStrategy];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v3 objectForKey:@"searchRankingCurrentStrategyKey"];

  if (v4) {
    unint64_t v2 = [v4 unsignedIntegerValue];
  }

  return v2;
}

@end