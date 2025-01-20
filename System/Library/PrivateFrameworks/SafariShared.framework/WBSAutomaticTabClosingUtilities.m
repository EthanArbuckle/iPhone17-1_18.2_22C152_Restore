@interface WBSAutomaticTabClosingUtilities
+ (BOOL)shouldCloseTabsAutomaticallyWhenEnteringForeground;
+ (BOOL)userHasPreferenceForAutomaticTabClosingInterval;
+ (unint64_t)automaticTabClosingInterval;
+ (void)clearMostDistantLastViewedTime;
+ (void)resetAutomaticTabClosingIntervalPreference;
+ (void)setAutomaticTabClosingInterval:(unint64_t)a3;
+ (void)setMostDistantLastViewedTime:(double)a3;
@end

@implementation WBSAutomaticTabClosingUtilities

+ (BOOL)shouldCloseTabsAutomaticallyWhenEnteringForeground
{
  unint64_t v2 = [a1 automaticTabClosingInterval];
  uint64_t v3 = v2;
  if (v2 < 5 && ((0x1Du >> v2) & 1) != 0) {
    return 0;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v4 doubleForKey:@"mostDistantLastViewedTime"];
  double v6 = v5;

  if (v6 <= 0.0) {
    return 0;
  }
  WBSAutomaticTabClosingIntervalTimeInterval(v3);
  double v8 = v6 + v7;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v9 >= v8;
}

+ (unint64_t)automaticTabClosingInterval
{
  unint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  unint64_t v3 = [v2 integerForKey:@"CloseTabsAutomatically"];

  return v3;
}

+ (BOOL)userHasPreferenceForAutomaticTabClosingInterval
{
  unint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  unint64_t v3 = [v2 objectForKey:@"CloseTabsAutomatically"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)setAutomaticTabClosingInterval:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setInteger:a3 forKey:@"CloseTabsAutomatically"];
}

+ (void)resetAutomaticTabClosingIntervalPreference
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObjectForKey:@"CloseTabsAutomatically"];
}

+ (void)setMostDistantLastViewedTime:(double)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 floatForKey:@"mostDistantLastViewedTime"];
  double v5 = *(float *)&v4;
  if (*(float *)&v4 <= 0.0 || v5 > a3)
  {
    *(float *)&double v4 = a3;
    objc_msgSend(v7, "setFloat:forKey:", @"mostDistantLastViewedTime", v4, v5);
  }
}

+ (void)clearMostDistantLastViewedTime
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObjectForKey:@"mostDistantLastViewedTime"];
}

@end