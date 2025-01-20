@interface LAMKBEventsUnregisterSymbolLoc
@end

@implementation LAMKBEventsUnregisterSymbolLoc

void *__get_LAMKBEventsUnregisterSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)LocalAuthenticationLibrary();
  result = dlsym(v2, "_LAMKBEventsUnregister");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LAMKBEventsUnregisterSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end