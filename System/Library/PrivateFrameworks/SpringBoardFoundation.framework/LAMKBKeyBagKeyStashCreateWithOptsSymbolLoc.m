@interface LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc
@end

@implementation LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc

void *__get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBKeyBagKeyStashCreateWithOpts");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end