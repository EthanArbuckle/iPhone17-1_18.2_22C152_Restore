@interface AVURLAsset(Private)
+ (id)smm_alternativeConfigurationMediaIdentifierKey;
+ (id)smm_alternativeConfigurationOptionsKey;
+ (id)smm_alternativeConfigurationServiceIdentifierKey;
+ (id)smm_alternativeConfigurationiTunesServiceMonitoringKey;
+ (id)smm_iTunesStoreContentHLSAssetURLStringKey;
+ (id)smm_iTunesStoreContentInfoKey;
@end

@implementation AVURLAsset(Private)

+ (id)smm_alternativeConfigurationMediaIdentifierKey
{
  return (id)*MEMORY[0x263EFA1F0];
}

+ (id)smm_alternativeConfigurationServiceIdentifierKey
{
  return (id)*MEMORY[0x263EFA200];
}

+ (id)smm_alternativeConfigurationiTunesServiceMonitoringKey
{
  return (id)*MEMORY[0x263EFA208];
}

+ (id)smm_alternativeConfigurationOptionsKey
{
  return (id)*MEMORY[0x263EFA1F8];
}

+ (id)smm_iTunesStoreContentInfoKey
{
  return (id)*MEMORY[0x263EFA2F0];
}

+ (id)smm_iTunesStoreContentHLSAssetURLStringKey
{
  return (id)*MEMORY[0x263EFA2E0];
}

@end