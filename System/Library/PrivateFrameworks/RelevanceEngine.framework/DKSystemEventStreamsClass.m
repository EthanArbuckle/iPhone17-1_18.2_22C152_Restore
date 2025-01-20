@interface DKSystemEventStreamsClass
@end

@implementation DKSystemEventStreamsClass

Class __get_DKSystemEventStreamsClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKSystemEventStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_DKSystemEventStreamsClass_block_invoke_cold_1();
    return (Class)__get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_block_invoke(v3);
  }
  return result;
}

Class __get_DKSystemEventStreamsClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKSystemEventStreamsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_DKSystemEventStreamsClass_block_invoke_cold_1_0();
    return (Class)__get_DKPredictionTimelineClass_block_invoke(v3);
  }
  return result;
}

void __get_DKSystemEventStreamsClass_block_invoke_1(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DKSystemEventStreams");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKSystemEventStreamsClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_DKSystemEventStreamsClass_block_invoke_cold_1_0();
    CoreDuetLibrary_1();
  }
}

uint64_t __get_DKSystemEventStreamsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REHTTPDebugCoordinator generateDiagnosticsForPaths:completion:](v0);
}

uint64_t __get_DKSystemEventStreamsClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  return __get_DKPredictionTimelineClass_block_invoke_cold_1(v0);
}

@end