@interface LAMKBGetDeviceLockStateInfoSymbolLoc
@end

@implementation LAMKBGetDeviceLockStateInfoSymbolLoc

void *__get_LAMKBGetDeviceLockStateInfoSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBGetDeviceLockStateInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBGetDeviceLockStateInfoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end