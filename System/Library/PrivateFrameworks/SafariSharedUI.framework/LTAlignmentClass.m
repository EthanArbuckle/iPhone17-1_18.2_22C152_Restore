@interface LTAlignmentClass
@end

@implementation LTAlignmentClass

Class __get_LTAlignmentClass_block_invoke(uint64_t a1)
{
  TranslationLibraryCore();
  Class result = objc_getClass("_LTAlignment");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LTAlignmentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end