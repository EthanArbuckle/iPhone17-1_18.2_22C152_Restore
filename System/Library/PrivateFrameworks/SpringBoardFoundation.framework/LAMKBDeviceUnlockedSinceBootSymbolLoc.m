@interface LAMKBDeviceUnlockedSinceBootSymbolLoc
@end

@implementation LAMKBDeviceUnlockedSinceBootSymbolLoc

void *__get_LAMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end