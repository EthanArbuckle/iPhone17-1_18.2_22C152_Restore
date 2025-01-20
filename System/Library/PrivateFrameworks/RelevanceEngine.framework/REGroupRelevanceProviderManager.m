@interface REGroupRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
@end

@implementation REGroupRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature groupFeature];
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

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  v4 = [a3 groupIdentifier];
  v5 = +[REFeatureValue featureValueWithString:v4];

  return v5;
}

@end