@interface LAMKBEventsRegisterSymbolLoc
@end

@implementation LAMKBEventsRegisterSymbolLoc

void *__get_LAMKBEventsRegisterSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBEventsRegister");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBEventsRegisterSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end