@interface PFPosterExtensionInstance
@end

@implementation PFPosterExtensionInstance

void __74__PFPosterExtensionInstance_PRAdditions__pr_acquireAssetUpdaterWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F4F6A8];
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    v8 = [v7 tokenFromAuditToken:v16];
    v9 = (void *)MEMORY[0x1E4F96478];
    v10 = [*(id *)(a1 + 32) processIdentity];
    v11 = [v9 targetWithProcessIdentity:v10];

    v12 = +[PRUpdatingService updatingServiceWithProcess:v5 auditToken:v8 target:v11];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained addInstanceObserver:v12];

    uint64_t v14 = *(void *)(a1 + 40);
    v15 = +[PRUpdatingService updatingServiceWithProcess:v5 auditToken:v8 target:v11];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
  }
}

@end