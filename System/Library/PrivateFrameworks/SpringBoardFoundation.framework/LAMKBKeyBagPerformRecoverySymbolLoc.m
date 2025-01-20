@interface LAMKBKeyBagPerformRecoverySymbolLoc
@end

@implementation LAMKBKeyBagPerformRecoverySymbolLoc

void *__get_LAMKBKeyBagPerformRecoverySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBKeyBagPerformRecovery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBKeyBagPerformRecoverySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end