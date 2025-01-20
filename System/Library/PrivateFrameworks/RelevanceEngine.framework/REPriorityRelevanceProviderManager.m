@interface REPriorityRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (float)_relevanceForProvider:(id)a3;
@end

@implementation REPriorityRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature priorityFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (float)_relevanceForProvider:(id)a3
{
  [a3 priority];
  return result;
}

@end