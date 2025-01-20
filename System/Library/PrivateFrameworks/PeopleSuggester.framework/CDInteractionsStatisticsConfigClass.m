@interface CDInteractionsStatisticsConfigClass
@end

@implementation CDInteractionsStatisticsConfigClass

Class __get_CDInteractionsStatisticsConfigClass_block_invoke(uint64_t a1)
{
  if (!CoreDuetFrameworkLibraryCore_frameworkLibrary) {
    CoreDuetFrameworkLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("_CDInteractionsStatisticsConfig");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CDInteractionsStatisticsConfigClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end