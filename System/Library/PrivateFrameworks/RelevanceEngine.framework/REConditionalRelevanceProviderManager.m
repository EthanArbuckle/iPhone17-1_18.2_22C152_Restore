@interface REConditionalRelevanceProviderManager
+ (BOOL)_wantsDelayedUpdate;
+ (Class)_relevanceProviderClass;
+ (id)_dependencyClasses;
+ (id)_features;
- (float)_relevanceForProvider:(id)a3;
@end

@implementation REConditionalRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature conditionalFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_dependencyClasses
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:7];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9, v10, v11);

  return v4;
}

+ (BOOL)_wantsDelayedUpdate
{
  return 1;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (float)_relevanceForProvider:(id)a3
{
  [a3 _evaluateCondition];
  return result;
}

@end