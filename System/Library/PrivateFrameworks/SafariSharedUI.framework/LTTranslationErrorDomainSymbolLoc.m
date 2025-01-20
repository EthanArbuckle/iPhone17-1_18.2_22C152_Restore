@interface LTTranslationErrorDomainSymbolLoc
@end

@implementation LTTranslationErrorDomainSymbolLoc

void *__get_LTTranslationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)TranslationLibrary();
  result = dlsym(v2, "_LTTranslationErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LTTranslationErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end