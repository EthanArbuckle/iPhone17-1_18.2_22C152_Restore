@interface CF
@end

@implementation CF

void *__gettcc_service_singleton_for_CF_nameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)TCCLibrary();
  result = dlsym(v2, "tcc_service_singleton_for_CF_name");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  gettcc_service_singleton_for_CF_nameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end