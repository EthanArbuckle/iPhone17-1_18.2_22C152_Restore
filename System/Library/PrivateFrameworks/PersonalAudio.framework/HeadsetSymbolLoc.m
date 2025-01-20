@interface HeadsetSymbolLoc
@end

@implementation HeadsetSymbolLoc

void *__getHURouteKeyAudioRouteName_HeadsetSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HearingUtilitiesLibrary_0();
  result = dlsym(v2, "HURouteKeyAudioRouteName_Headset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end