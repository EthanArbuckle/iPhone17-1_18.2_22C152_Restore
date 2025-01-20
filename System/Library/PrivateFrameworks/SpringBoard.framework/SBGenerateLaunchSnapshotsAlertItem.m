@interface SBGenerateLaunchSnapshotsAlertItem
- (BOOL)behavesSuperModally;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBGenerateLaunchSnapshotsAlertItem)initWithHandler:(id)a3;
- (id)handler;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)regenerateApplications:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation SBGenerateLaunchSnapshotsAlertItem

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)behavesSuperModally
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (SBGenerateLaunchSnapshotsAlertItem)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBGenerateLaunchSnapshotsAlertItem;
  v5 = [(SBAlertItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1D948C7A0](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  [v5 setPreferredStyle:0];
  [v5 setTitle:@"Select Application Type"];
  uint64_t v6 = +[SBApplicationController sharedInstance];
  v7 = [v6 _splashBoardController];
  v8 = [v7 applicationProvider];
  objc_super v9 = (void *)MEMORY[0x1E4F42720];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke;
  v25[3] = &unk_1E6AF48F0;
  v25[4] = self;
  id v10 = v8;
  id v26 = v10;
  v11 = [v9 actionWithTitle:@"System" style:0 handler:v25];
  [v5 addAction:v11];

  v12 = (void *)MEMORY[0x1E4F42720];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v22[3] = &unk_1E6AF48F0;
  id v13 = v10;
  id v23 = v13;
  v24 = self;
  v14 = [v12 actionWithTitle:@"User" style:0 handler:v22];
  [v5 addAction:v14];

  v15 = (void *)MEMORY[0x1E4F42720];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_4;
  v20[3] = &unk_1E6AF48F0;
  v20[4] = self;
  id v21 = v13;
  id v16 = v13;
  v17 = [v15 actionWithTitle:@"All" style:2 handler:v20];
  [v5 addAction:v17];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_5;
  v19[3] = &unk_1E6AF4918;
  v19[4] = self;
  v18 = [MEMORY[0x1E4F42720] actionWithTitle:@"Cancel" style:1 handler:v19];
  [v5 addAction:v18];
}

void __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) splashBoardSystemApplications];
  [v1 regenerateApplications:v2];
}

void __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allSplashBoardApplications];
  objc_msgSend(v2, "bs_filter:", &__block_literal_global_25);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) regenerateApplications:v3];
}

BOOL __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

void __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) allSplashBoardApplications];
  [v1 regenerateApplications:v2];
}

uint64_t __74__SBGenerateLaunchSnapshotsAlertItem_configure_requirePasscodeForActions___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivate];
  id v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 112) + 16);
  return v2();
}

- (void)regenerateApplications:(id)a3
{
  id v4 = a3;
  [(SBAlertItem *)self deactivate];
  v5 = objc_alloc_init(SBLaunchSnapshotWaitingAlertItem);
  [MEMORY[0x1E4FA7938] activateAlertItem:v5];
  uint64_t v6 = +[SBApplicationController sharedInstance];
  v7 = [v6 _splashBoardController];
  [v7 removeCachedLaunchImagesForApplications:v4 forgettingApps:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v10 = v5;
  v11 = self;
  v8 = v5;
  [v7 captureOrUpdateLaunchImagesForApplications:v4 firstImageIsReady:0 completion:v9];
}

void __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke_2;
  v4[3] = &unk_1E6AF5290;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __61__SBGenerateLaunchSnapshotsAlertItem_regenerateApplications___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivate];
  id v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 112) + 16);
  return v2();
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end