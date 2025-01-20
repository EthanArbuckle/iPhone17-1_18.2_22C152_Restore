@interface LTTranslationRangeClass
@end

@implementation LTTranslationRangeClass

Class __get_LTTranslationRangeClass_block_invoke(uint64_t a1)
{
  TranslationLibraryCore();
  Class result = objc_getClass("_LTTranslationRange");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LTTranslationRangeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end