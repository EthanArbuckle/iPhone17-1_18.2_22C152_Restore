@interface CDContextualKeyPathClass
@end

@implementation CDContextualKeyPathClass

Class __get_CDContextualKeyPathClass_block_invoke(uint64_t a1)
{
  CoreDuetContextLibrary();
  Class result = objc_getClass("_CDContextualKeyPath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_CDContextualKeyPathClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__get_CDClientContextClass_block_invoke(v3);
  }
  return result;
}

@end