@interface PSPeopleSuggestionsMetricsModelClass
@end

@implementation PSPeopleSuggestionsMetricsModelClass

Class __get_PSPeopleSuggestionsMetricsModelClass_block_invoke(uint64_t a1)
{
  ReportingPluginLibraryCore();
  Class result = objc_getClass("_PSPeopleSuggestionsMetricsModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_PSPeopleSuggestionsMetricsModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end