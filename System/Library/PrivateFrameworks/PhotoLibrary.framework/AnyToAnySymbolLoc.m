@interface AnyToAnySymbolLoc
@end

@implementation AnyToAnySymbolLoc

void *__getvImageConvert_AnyToAnySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = AccelerateLibrary();
  result = dlsym(v2, "vImageConvert_AnyToAny");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getvImageConvert_AnyToAnySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end