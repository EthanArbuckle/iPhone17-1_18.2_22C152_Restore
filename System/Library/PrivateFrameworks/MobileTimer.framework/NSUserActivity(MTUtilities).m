@interface NSUserActivity(MTUtilities)
+ (id)mtUserActivityWithActivityType:()MTUtilities title:keywords:;
+ (uint64_t)mtUserActivityWithActivityType:()MTUtilities;
+ (uint64_t)mtUserActivityWithActivityType:()MTUtilities title:;
@end

@implementation NSUserActivity(MTUtilities)

+ (uint64_t)mtUserActivityWithActivityType:()MTUtilities title:
{
  return [a1 mtUserActivityWithActivityType:a3 title:a4 keywords:0];
}

+ (id)mtUserActivityWithActivityType:()MTUtilities title:keywords:
{
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E4F29230];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithActivityType:v10];

  [v11 setEligibleForHandoff:1];
  [v11 setEligibleForSearch:1];
  [v11 setEligibleForPublicIndexing:1];
  [v11 setTitle:v9];

  if (v7)
  {
    v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    [v11 setKeywords:v12];
  }
  else
  {
    [v11 setKeywords:0];
  }

  return v11;
}

+ (uint64_t)mtUserActivityWithActivityType:()MTUtilities
{
  return [a1 mtUserActivityWithActivityType:a3 title:0];
}

@end