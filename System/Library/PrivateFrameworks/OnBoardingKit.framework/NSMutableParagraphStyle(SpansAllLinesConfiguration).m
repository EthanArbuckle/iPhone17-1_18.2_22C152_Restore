@interface NSMutableParagraphStyle(SpansAllLinesConfiguration)
- (uint64_t)preferredSpansAllLinesForCurrentLanguageWithText:()SpansAllLinesConfiguration;
- (uint64_t)spansAllLinesForConfiguration:()SpansAllLinesConfiguration withText:;
@end

@implementation NSMutableParagraphStyle(SpansAllLinesConfiguration)

- (uint64_t)preferredSpansAllLinesForCurrentLanguageWithText:()SpansAllLinesConfiguration
{
  id v4 = a3;
  v5 = +[OBLanguageConfigurationProvider defaultConfiguration];
  uint64_t v6 = [v5 spansAllLines];

  uint64_t v7 = [a1 spansAllLinesForConfiguration:v6 withText:v4];
  return v7;
}

- (uint64_t)spansAllLinesForConfiguration:()SpansAllLinesConfiguration withText:
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 == 2)
  {
    uint64_t v7 = 0;
  }
  else if (a3)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = [v5 containsString:@"\n"] ^ 1;
  }

  return v7;
}

@end