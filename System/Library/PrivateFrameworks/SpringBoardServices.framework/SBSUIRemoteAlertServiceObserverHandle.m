@interface SBSUIRemoteAlertServiceObserverHandle
@end

@implementation SBSUIRemoteAlertServiceObserverHandle

void __71___SBSUIRemoteAlertServiceObserverHandle_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x192FC0DF0](*(void *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    v4 = (void *)v5;
  }
}

void __73___SBSUIRemoteAlertServiceObserverHandle_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x192FC0DF0](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    v4 = (void *)v5;
  }
}

void __83___SBSUIRemoteAlertServiceObserverHandle_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  v7 = (void (**)(id, void))MEMORY[0x192FC0DF0](*(void *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  if (v7) {
    v7[2](v7, 0);
  }
  v4 = (void (**)(void, void))MEMORY[0x192FC0DF0](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0;

  if (v4) {
    v4[2](v4, 0);
  }
}

@end