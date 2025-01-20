@interface DKEventClass
@end

@implementation DKEventClass

Class __get_DKEventClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__55__TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke(v3);
  }
  return result;
}

@end