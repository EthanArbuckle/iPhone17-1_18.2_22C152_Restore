@interface DKKnowledgeStoreClass
@end

@implementation DKKnowledgeStoreClass

void __get_DKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DKKnowledgeStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKKnowledgeStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (TPSDiscoverabilitySignal *)abort_report_np();
    [(TPSDiscoverabilitySignal *)v2 donateSignalWithCompletion:v4];
  }
}

@end