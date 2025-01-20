@interface NTPBExternalAnalyticsConfig(FCAdditions)
+ (id)externalAnalyticsConfigWithDictionary:()FCAdditions;
@end

@implementation NTPBExternalAnalyticsConfig(FCAdditions)

+ (id)externalAnalyticsConfigWithDictionary:()FCAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4F82A38];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = FCAppConfigurationStringValue(v4, @"analyticsBaseUrl", 0);
  [v5 setAnalyticsBaseUrl:v6];

  v7 = FCAppConfigurationStringValue(v4, @"analyticsId", 0);
  [v5 setAnalyticsId:v7];

  v8 = FCAppConfigurationStringValue(v4, @"eventQueryParameterName", 0);
  [v5 setEventQueryParameterName:v8];

  objc_opt_class();
  v9 = [v4 objectForKeyedSubscript:@"queryParameterConfig"];
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  v12 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", &__block_literal_global_179);
  v13 = (void *)[v12 mutableCopy];
  [v5 setQueryParameterConfigs:v13];

  [v5 setUsesProxyProfile:FCAppConfigurationBoolValue(v4, @"usesProxyProfile", 0)];
  v14 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"proxyHostNames", 0);
  v15 = (void *)[v14 mutableCopy];
  [v5 setProxyHostNames:v15];

  v16 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"vpnProfileNames", 0);

  v17 = (void *)[v16 mutableCopy];
  [v5 setVpnProfileNames:v17];

  v18 = [v5 analyticsBaseUrl];
  if (v18) {
    v19 = v5;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  return v20;
}

@end