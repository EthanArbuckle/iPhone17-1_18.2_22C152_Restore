@interface LTParagraphTranslationRequestClass
@end

@implementation LTParagraphTranslationRequestClass

Class __get_LTParagraphTranslationRequestClass_block_invoke(uint64_t a1)
{
  TranslationLibraryCore();
  Class result = objc_getClass("_LTParagraphTranslationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LTParagraphTranslationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end