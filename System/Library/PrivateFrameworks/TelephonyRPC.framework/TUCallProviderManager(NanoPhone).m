@interface TUCallProviderManager(NanoPhone)
+ (id)nph_localProviderManager;
+ (id)nph_pairedHostDeviceProviderManager;
@end

@implementation TUCallProviderManager(NanoPhone)

+ (id)nph_localProviderManager
{
  if (nph_localProviderManager_onceToken != -1) {
    dispatch_once(&nph_localProviderManager_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)nph_localProviderManager_localProviderManager;
  return v0;
}

+ (id)nph_pairedHostDeviceProviderManager
{
  if (nph_pairedHostDeviceProviderManager_onceToken != -1) {
    dispatch_once(&nph_pairedHostDeviceProviderManager_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)nph_pairedHostDeviceProviderManager_pairedHostDeviceProviderManager;
  return v0;
}

@end