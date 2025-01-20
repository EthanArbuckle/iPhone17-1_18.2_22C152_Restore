@interface TUCallProviderManager
@end

@implementation TUCallProviderManager

uint64_t __60__TUCallProviderManager_NanoPhone__nph_localProviderManager__block_invoke()
{
  nph_localProviderManager_localProviderManager = [objc_alloc(MEMORY[0x263F7E1B0]) initWithLocalProviders];
  return MEMORY[0x270F9A758]();
}

uint64_t __71__TUCallProviderManager_NanoPhone__nph_pairedHostDeviceProviderManager__block_invoke()
{
  nph_pairedHostDeviceProviderManager_pairedHostDeviceProviderManager = [objc_alloc(MEMORY[0x263F7E1B0]) initWithPairedHostDeviceProviders];
  return MEMORY[0x270F9A758]();
}

@end