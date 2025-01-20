@interface DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc
@end

@implementation DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc

void *__get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreDuetLibrary();
  result = dlsym(v2, "_DKKnowledgeStorageDidTombstoneEventsNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

@end