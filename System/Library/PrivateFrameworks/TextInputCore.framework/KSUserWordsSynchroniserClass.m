@interface KSUserWordsSynchroniserClass
@end

@implementation KSUserWordsSynchroniserClass

Class __get_KSUserWordsSynchroniserClass_block_invoke(uint64_t a1)
{
  KeyboardServicesLibrary();
  Class result = objc_getClass("_KSUserWordsSynchroniser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_KSUserWordsSynchroniserClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)KeyboardServicesLibrary();
  }
  return result;
}

@end