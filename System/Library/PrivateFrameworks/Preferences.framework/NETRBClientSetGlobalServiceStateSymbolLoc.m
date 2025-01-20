@interface NETRBClientSetGlobalServiceStateSymbolLoc
@end

@implementation NETRBClientSetGlobalServiceStateSymbolLoc

void *__get_NETRBClientSetGlobalServiceStateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NetrbLibrary();
  result = dlsym(v2, "_NETRBClientSetGlobalServiceState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end