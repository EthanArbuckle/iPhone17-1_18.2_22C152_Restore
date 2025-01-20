@interface LAMKBKeyBagKeyStashCommitSymbolLoc
@end

@implementation LAMKBKeyBagKeyStashCommitSymbolLoc

void *__get_LAMKBKeyBagKeyStashCommitSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBKeyBagKeyStashCommit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBKeyBagKeyStashCommitSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end