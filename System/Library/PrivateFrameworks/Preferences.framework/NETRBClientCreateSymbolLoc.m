@interface NETRBClientCreateSymbolLoc
@end

@implementation NETRBClientCreateSymbolLoc

void *__get_NETRBClientCreateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)NetrbLibrary();
  result = dlsym(v2, "_NETRBClientCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_NETRBClientCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end