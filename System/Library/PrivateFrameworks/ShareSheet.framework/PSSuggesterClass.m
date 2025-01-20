@interface PSSuggesterClass
@end

@implementation PSSuggesterClass

Class __get_PSSuggesterClass_block_invoke(uint64_t a1)
{
  PeopleSuggesterLibrary();
  Class result = objc_getClass("_PSSuggester");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_PSSuggesterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__get_PSSuggesterClass_block_invoke_cold_1();
    return (Class)+[_UIActivityContentNavigationBar _requiresModernVisualProvider];
  }
  return result;
}

uint64_t __get_PSSuggesterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SHSheetRouter activityPerformCleanUpPresentation:](v0);
}

@end