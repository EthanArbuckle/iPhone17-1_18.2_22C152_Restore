@interface PPSModelURLRecipeHandler
+ (id)eventRecipes;
+ (id)metricRecipes;
+ (id)modelURLRecipe;
+ (id)timeSeriesRecipes;
@end

@implementation PPSModelURLRecipeHandler

+ (id)eventRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)metricRecipes
{
  v12[6] = *MEMORY[0x263EF8340];
  v11[0] = @"ANE::modelCompilation::modelURL";
  v3 = [a1 modelURLRecipe];
  v12[0] = v3;
  v11[1] = @"ANE::modelLoad::modelURL";
  v4 = [a1 modelURLRecipe];
  v12[1] = v4;
  v11[2] = @"ANE::modelUnload::modelURL";
  v5 = [a1 modelURLRecipe];
  v12[2] = v5;
  v11[3] = @"ANE::modelInference::modelURL";
  v6 = [a1 modelURLRecipe];
  v12[3] = v6;
  v11[4] = @"ANE::newInstanceModelLoad::modelURL";
  v7 = [a1 modelURLRecipe];
  v12[4] = v7;
  v11[5] = @"ANE::newInstanceModelUnload::modelURL";
  v8 = [a1 modelURLRecipe];
  v12[5] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

+ (id)timeSeriesRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)modelURLRecipe
{
  return &__block_literal_global;
}

id __42__PPSModelURLRecipeHandler_modelURLRecipe__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[PPSModelURLDecoder decodeValue:v5 withMetric:0];

    *a4 = 0;
  }
  else
  {
    v7 = NSString;
    uint64_t v8 = objc_opt_class();

    v9 = [v7 stringWithFormat:@"Recipe supports NSString, value sent %@", v8];
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v9;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.PPSRecipeEngine" code:4 userInfo:v11];

    v6 = 0;
  }
  return v6;
}

@end