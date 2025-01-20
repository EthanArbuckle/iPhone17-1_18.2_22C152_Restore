@interface LTTranslationFeedbackClass
@end

@implementation LTTranslationFeedbackClass

Class __get_LTTranslationFeedbackClass_block_invoke(uint64_t a1)
{
  TranslationLibraryCore();
  Class result = objc_getClass("_LTTranslationFeedback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LTTranslationFeedbackClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end