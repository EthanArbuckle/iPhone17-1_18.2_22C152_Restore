@interface PPSRecipeHandler
+ (id)eventRecipes;
+ (id)metricRecipes;
+ (id)timeSeriesRecipes;
@end

@implementation PPSRecipeHandler

+ (id)eventRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)metricRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)timeSeriesRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

@end