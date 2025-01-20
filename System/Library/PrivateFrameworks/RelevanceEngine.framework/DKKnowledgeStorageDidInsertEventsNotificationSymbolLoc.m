@interface DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc
@end

@implementation DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc

void *__get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreDuetLibrary();
  result = dlsym(v2, "_DKKnowledgeStorageDidInsertEventsNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

@end