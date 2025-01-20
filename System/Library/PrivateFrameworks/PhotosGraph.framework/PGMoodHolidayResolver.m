@interface PGMoodHolidayResolver
+ (id)moodVectorForHolidayCategory:(unint64_t)a3;
+ (id)moodVectorForMoodIdentifier:(id)a3;
+ (void)initialize;
@end

@implementation PGMoodHolidayResolver

+ (id)moodVectorForMoodIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"Holiday."])
  {
    v4 = [v3 componentsSeparatedByString:@"."];
    v5 = [v4 lastObject];
    uint64_t v6 = [v5 integerValue];

    v7 = +[PGMoodHolidayResolver moodVectorForHolidayCategory:v6];
    if (v7 && ([v3 containsString:@"Celebrated"] & 1) == 0) {
      objc_msgSend(v7, "filterWithMoods:", objc_msgSend(v7, "moodsWithThreshold:", 1.0));
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)moodVectorForHolidayCategory:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 > 4)
  {
    uint64_t v6 = +[PGLogging sharedLogging];
    v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      unint64_t v10 = a3;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Unknown holiday category: %lu", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v4 = [(id)sPGHolidayMoodDictionary objectForKeyedSubscript:off_1E68E7658[a3]];
    if (v4) {
      v5 = [[PGMoodVector alloc] initWithArray:v4];
    }
    else {
      v5 = 0;
    }
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PGMoodHolidayResolver;
    objc_msgSendSuper2(&v4, sel_initialize);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PGMoodHolidayResolver_initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, block);
    }
  }
}

void __35__PGMoodHolidayResolver_initialize__block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  id v4 = [v1 URLForResource:@"MoodForHoliday" withExtension:@"plist"];

  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
  id v3 = (void *)sPGHolidayMoodDictionary;
  sPGHolidayMoodDictionary = v2;
}

@end