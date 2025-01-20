@interface SBSFocusModesHomeScreenSettingsService
+ (id)activateConnection;
+ (void)addSuggestedHomeScreenPageWithRequest:(id)a3;
+ (void)homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a3 completion:(id)a4;
+ (void)homeScreenSnapshotsWithRequest:(id)a3 completion:(id)a4;
+ (void)updateFocusModeHomeScreenSettingsWithRequest:(id)a3;
@end

@implementation SBSFocusModesHomeScreenSettingsService

+ (void)homeScreenSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() activateConnection];
  v8 = [v7 remoteTarget];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsWithRequest_completion___block_invoke;
  v11[3] = &unk_1E566DC78;
  id v12 = v7;
  id v13 = v5;
  id v9 = v7;
  id v10 = v5;
  [v8 homeScreenSnapshotsWithRequest:v6 completion:v11];
}

void __84__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v10 = v7;
    id v8 = v5;
    id v9 = v6;
    BSDispatchMain();
  }
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __84__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsWithRequest_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() activateConnection];
  id v8 = [v7 remoteTarget];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke;
  v11[3] = &unk_1E566DC78;
  id v12 = v7;
  id v13 = v5;
  id v9 = v7;
  id v10 = v5;
  [v8 homeScreenSnapshotsForSuggestedPagesWithRequest:v6 completion:v11];
}

void __101__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v10 = v7;
    id v8 = v5;
    id v9 = v6;
    BSDispatchMain();
  }
  [*(id *)(a1 + 32) invalidate];
}

uint64_t __101__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)updateFocusModeHomeScreenSettingsWithRequest:(id)a3
{
  id v3 = a3;
  id v5 = [(id)objc_opt_class() activateConnection];
  v4 = [v5 remoteTarget];
  [v4 updateFocusModeHomeScreenSettingsWithRequest:v3];

  [v5 invalidate];
}

+ (void)addSuggestedHomeScreenPageWithRequest:(id)a3
{
  id v3 = a3;
  id v5 = [(id)objc_opt_class() activateConnection];
  v4 = [v5 remoteTarget];
  [v4 addSuggestedHomeScreenPageWithRequest:v3];

  [v5 invalidate];
}

+ (id)activateConnection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F50BB8];
  v4 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  id v5 = +[SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification identifier];
  id v6 = [v3 endpointForMachName:v4 service:v5 instance:0];

  id v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.springboard.focus-modes-home-screen-settings-service.connectionQueue", v8);

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke;
  v16 = &unk_1E566C6B8;
  dispatch_queue_t v17 = v9;
  id v18 = a1;
  id v10 = v9;
  [v7 configureConnection:&v13];
  v11 = SBLogFocusModes();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_18FBC5000, v11, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  [v7 activate:v13, v14, v15, v16];
  return v7;
}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification interface];
  [v5 setInterface:v3];

  v4 = +[SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification serviceQuality];
  [v5 setServiceQuality:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 40)];
  [v5 setTargetQueue:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_54];
  [v5 setInterruptionHandler:&__block_literal_global_8_0];
  [v5 setInvalidationHandler:&__block_literal_global_11_0];
}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogFocusModes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogFocusModes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SBLogFocusModes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1((uint64_t)v2, v3);
  }
}

@end