@interface LAMKBPrewarmSPSSymbolLoc
@end

@implementation LAMKBPrewarmSPSSymbolLoc

void *__get_LAMKBPrewarmSPSSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBPrewarmSPS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBPrewarmSPSSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end