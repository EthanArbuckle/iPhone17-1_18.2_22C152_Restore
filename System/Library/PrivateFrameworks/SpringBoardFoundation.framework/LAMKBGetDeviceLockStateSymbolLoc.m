@interface LAMKBGetDeviceLockStateSymbolLoc
@end

@implementation LAMKBGetDeviceLockStateSymbolLoc

void *__get_LAMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBGetDeviceLockStateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end