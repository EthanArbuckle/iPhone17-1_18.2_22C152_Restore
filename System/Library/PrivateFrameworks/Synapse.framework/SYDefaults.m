@interface SYDefaults
+ (BOOL)shouldDisableQuickNoteTemporarily;
+ (int64_t)indicatorCoverage;
+ (void)setIndicatorCoverage:(int64_t)a3;
@end

@implementation SYDefaults

+ (BOOL)shouldDisableQuickNoteTemporarily
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Synapse"];
  v3 = [v2 objectForKey:@"shouldDisableTemporarily"];

  if (v3) {
    LOBYTE(v3) = [v2 BOOLForKey:@"shouldDisableTemporarily"];
  }

  return (char)v3;
}

+ (int64_t)indicatorCoverage
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Synapse"];
  v3 = [v2 objectForKey:@"indicatorCoverage"];

  if (v3) {
    int64_t v4 = [v2 integerForKey:@"indicatorCoverage"];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

+ (void)setIndicatorCoverage:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Synapse"];
    [v5 setInteger:a3 forKey:@"indicatorCoverage"];
  }
}

@end