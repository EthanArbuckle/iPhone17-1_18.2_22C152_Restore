@interface LAMKBLockDeviceSymbolLoc
@end

@implementation LAMKBLockDeviceSymbolLoc

void *__get_LAMKBLockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBLockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBLockDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end