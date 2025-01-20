@interface NTPBExternalAnalyticsQueryParameterConfig(FCAdditions)
+ (id)externalAnalyticsQueryParameterConfigWithDictionary:()FCAdditions;
@end

@implementation NTPBExternalAnalyticsQueryParameterConfig(FCAdditions)

+ (id)externalAnalyticsQueryParameterConfigWithDictionary:()FCAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4F82A40];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = FCAppConfigurationStringValue(v4, @"name", 0);
  [v5 setName:v6];

  v7 = FCAppConfigurationStringValue(v4, @"value", 0);

  [v5 setValue:v7];
  return v5;
}

@end