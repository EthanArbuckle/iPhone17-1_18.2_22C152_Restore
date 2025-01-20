@interface PIParallaxBlackWhiteStudioStyle
+ (id)styleWithColorAnalysis:(id)a3;
- (BOOL)configureForCategory:(id)a3;
- (id)defaultDominantColorWithAnalysis:(id)a3;
- (id)kind;
- (id)recipeIdentifier;
@end

@implementation PIParallaxBlackWhiteStudioStyle

- (id)defaultDominantColorWithAnalysis:(id)a3
{
  [a3 luminance];
  double v5 = v4;
  int64_t v6 = [(PIParallaxStudioStyle *)self tonality];
  double v7 = 0.8;
  if (v5 >= 0.8) {
    double v7 = v5;
  }
  double v8 = fmin(v5, 0.4);
  if (v6 == 3) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CC78]) initWithRed:v9 green:v9 blue:v9];
  return v10;
}

- (BOOL)configureForCategory:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F8D0C0]];
}

- (id)recipeIdentifier
{
  if ([(PIParallaxStudioStyle *)self tonality] == 3) {
    v2 = @"BlackWhiteHighKey";
  }
  else {
    v2 = @"BlackWhiteStage";
  }
  return v2;
}

- (id)kind
{
  return (id)*MEMORY[0x1E4F8CFD8];
}

+ (id)styleWithColorAnalysis:(id)a3
{
  [a3 backgroundLuminance];
  if (v4 < 0.35)
  {
    double v5 = [MEMORY[0x1E4F8CC78] whiteColor];
    uint64_t v6 = 1;
  }
  else
  {
    double v5 = [MEMORY[0x1E4F8CC78] blackColor];
    uint64_t v6 = 3;
  }
  id v7 = objc_alloc((Class)a1);
  double v8 = (void *)[v7 initWithClockColor:v5 colorSuggestions:MEMORY[0x1E4F1CBF0]];
  [v8 setTonality:v6];

  return v8;
}

@end