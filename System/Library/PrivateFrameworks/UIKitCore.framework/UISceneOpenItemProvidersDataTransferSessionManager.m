@interface UISceneOpenItemProvidersDataTransferSessionManager
@end

@implementation UISceneOpenItemProvidersDataTransferSessionManager

void __69___UISceneOpenItemProvidersDataTransferSessionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_UISceneOpenItemProvidersDataTransferSessionManager);
  v1 = (void *)qword_1EB261DB0;
  qword_1EB261DB0 = (uint64_t)v0;
}

void __66___UISceneOpenItemProvidersDataTransferSessionManager_addSession___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) sessions];
  [v2 addObject:*(void *)(a1 + 32)];
}

void __92___UISceneOpenItemProvidersDataTransferSessionManager_dataTransferSessionFinishedTransfers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessions];
  [v2 removeObject:*(void *)(a1 + 40)];
}

@end