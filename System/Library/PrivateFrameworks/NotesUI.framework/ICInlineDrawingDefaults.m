@interface ICInlineDrawingDefaults
+ (void)updateTouchPredictionPointsFromOverride;
@end

@implementation ICInlineDrawingDefaults

+ (void)updateTouchPredictionPointsFromOverride
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F83840]];

  if (v3 < 0)
  {
    if (!MGGetBoolAnswer()) {
      return;
    }
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v5 = *MEMORY[0x1E4F83838];
    id v7 = v4;
    uint64_t v6 = 2;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v5 = *MEMORY[0x1E4F83838];
    id v7 = v4;
    uint64_t v6 = v3;
  }
  [v4 setInteger:v6 forKey:v5];
}

@end