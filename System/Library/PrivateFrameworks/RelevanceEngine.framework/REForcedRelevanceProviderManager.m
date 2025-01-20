@interface REForcedRelevanceProviderManager
+ (BOOL)_supportsHistoricProviders;
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (BOOL)_isHistoricProvider:(id)a3;
- (float)_relevanceForHistoricProvider:(id)a3;
- (float)_relevanceForProvider:(id)a3;
@end

@implementation REForcedRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature forcedFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (float)_relevanceForProvider:(id)a3
{
  [a3 relevance];
  return result;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  return [a3 isHistoric];
}

- (float)_relevanceForHistoricProvider:(id)a3
{
  [a3 relevance];
  return result;
}

@end