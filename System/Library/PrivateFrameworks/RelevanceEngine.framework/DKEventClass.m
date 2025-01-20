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
    __get_DKEventClass_block_invoke_cold_1();
    return (Class)CoreDuetLibrary();
  }
  return result;
}

Class __get_DKEventClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_2();
  Class result = objc_getClass("_DKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKEventClass_block_invoke_cold_1_0();
  }
  get_DKEventClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_DKEventClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_DKSystemEventStreamsClass_block_invoke_cold_1(v0);
}

void __get_DKEventClass_block_invoke_cold_1_0()
{
}

@end