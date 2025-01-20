@interface LTLocalePairClass
@end

@implementation LTLocalePairClass

Class __get_LTLocalePairClass_block_invoke(uint64_t a1)
{
  TranslationLibraryCore();
  Class result = objc_getClass("_LTLocalePair");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_LTLocalePairClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end