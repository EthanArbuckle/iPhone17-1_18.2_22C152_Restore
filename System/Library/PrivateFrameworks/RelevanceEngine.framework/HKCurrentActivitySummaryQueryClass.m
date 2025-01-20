@interface HKCurrentActivitySummaryQueryClass
@end

@implementation HKCurrentActivitySummaryQueryClass

void __get_HKCurrentActivitySummaryQueryClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_HKCurrentActivitySummaryQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_HKCurrentActivitySummaryQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_HKCurrentActivitySummaryQueryClass_block_invoke_cold_1();
    HealthKitLibrary();
  }
}

uint64_t __get_HKCurrentActivitySummaryQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

@end