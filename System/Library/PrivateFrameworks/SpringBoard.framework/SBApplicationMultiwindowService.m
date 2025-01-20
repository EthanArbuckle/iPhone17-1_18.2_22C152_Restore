@interface SBApplicationMultiwindowService
+ (SBApplicationMultiwindowService)sharedInstance;
- (SBApplicationMultiwindowService)init;
- (void)applicationServer:(id)a3 client:(id)a4 requestShelfPresentationForSceneWithIdentifier:(id)a5;
- (void)applicationServer:(id)a3 client:(id)a4 showAllWindowsForBundleIdentifier:(id)a5;
- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3;
- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3 displayConfiguration:(id)a4;
@end

@implementation SBApplicationMultiwindowService

+ (SBApplicationMultiwindowService)sharedInstance
{
  if (sharedInstance_onceToken_18 != -1) {
    dispatch_once(&sharedInstance_onceToken_18, &__block_literal_global_141);
  }
  v2 = (void *)sharedInstance___sharedInstance_11;
  return (SBApplicationMultiwindowService *)v2;
}

void __49__SBApplicationMultiwindowService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBApplicationMultiwindowService);
  v1 = (void *)sharedInstance___sharedInstance_11;
  sharedInstance___sharedInstance_11 = (uint64_t)v0;
}

- (SBApplicationMultiwindowService)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBApplicationMultiwindowService;
  v2 = [(SBApplicationMultiwindowService *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v4 = [v3 initWithEntitlement:*MEMORY[0x1E4FA6EB8]];
    triggerShowAllWindowsEntitlementAuthenticator = v2->_triggerShowAllWindowsEntitlementAuthenticator;
    v2->_triggerShowAllWindowsEntitlementAuthenticator = (FBServiceClientAuthenticator *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v7 = [v6 initWithEntitlement:*MEMORY[0x1E4FA6EB0]];
    requestShelfPresentationEntitlementAuthenticator = v2->_requestShelfPresentationEntitlementAuthenticator;
    v2->_requestShelfPresentationEntitlementAuthenticator = (FBServiceClientAuthenticator *)v7;

    v9 = +[SBApplicationServer sharedInstance];
    [v9 setMultiwindowDelegate:v2];
  }
  return v2;
}

- (void)applicationServer:(id)a3 client:(id)a4 showAllWindowsForBundleIdentifier:(id)a5
{
  id v7 = a5;
  if ([(FBServiceClientAuthenticator *)self->_triggerShowAllWindowsEntitlementAuthenticator authenticateClient:a4])[(SBApplicationMultiwindowService *)self triggerShowAllWindowsForApplicationBundleIdentifier:v7]; {
}
  }

- (void)applicationServer:(id)a3 client:(id)a4 requestShelfPresentationForSceneWithIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(FBServiceClientAuthenticator *)self->_requestShelfPresentationEntitlementAuthenticator authenticateClient:v7])
  {
    id v9 = v8;
    id v10 = v7;
    BSDispatchMain();
  }
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 windowSceneForSceneIdentifier:*(void *)(a1 + 32)];

  uint64_t v4 = +[SBMainWorkspace sharedInstance];
  v5 = [v3 _fbsDisplayConfiguration];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_2;
  v7[3] = &unk_1E6AF8300;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v6 = v3;
  [v4 requestTransitionWithOptions:0 displayConfiguration:v5 builder:0 validator:v7];
}

uint64_t __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:54];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3;
  v5[3] = &unk_1E6AFF2B0;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  [v3 modifyApplicationContext:v5];
  [v3 finalize];

  return 1;
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] processHandle];
  v5 = [v4 bundleIdentifier];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_4;
  v18 = &unk_1E6B00880;
  v22 = &v23;
  id v6 = v3;
  id v19 = v6;
  id v7 = v5;
  id v20 = v7;
  id v8 = (uint64_t *)(a1 + 5);
  id v21 = a1[5];
  SBLayoutRoleEnumerateValidRoles(&v15);
  id v9 = objc_msgSend(a1[6], "switcherController", v15, v16, v17, v18);
  char v10 = [v9 isChamoisWindowingUIEnabled];

  if (v10)
  {
LABEL_6:
    [v6 setRequestedAppExposeBundleID:v7];
    goto LABEL_7;
  }
  uint64_t v11 = v24[3];
  if (!v11)
  {
    v12 = SBLogAppSwitcher();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3_cold_1((uint64_t)v7, v8, v12);
    }

    goto LABEL_6;
  }
  if (v11 == 1)
  {
    v13 = [v6 previousLayoutState];
    v14 = [v13 elementWithRole:2];
    if (v14) {
      [v6 setRequestedWindowPickerRole:v24[3]];
    }
    else {
      [v6 setRequestedAppExposeBundleID:v7];
    }
  }
  else
  {
    objc_msgSend(v6, "setRequestedWindowPickerRole:");
  }
LABEL_7:

  _Block_object_dispose(&v23, 8);
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v12 = [*(id *)(a1 + 32) previousLayoutState];
    uint64_t v4 = [v12 elementWithRole:a2];
    v5 = [v4 workspaceEntity];
    id v6 = [v5 applicationSceneEntity];
    id v7 = [v6 application];
    id v8 = [v6 sceneHandle];
    id v9 = [v7 bundleIdentifier];
    if ([v9 isEqualToString:*(void *)(a1 + 40)])
    {
      char v10 = [v8 sceneIdentifier];
      int v11 = [v10 isEqualToString:*(void *)(a1 + 48)];

      if (v11) {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
      }
    }
    else
    {
    }
  }
}

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = +[SBMainWorkspace sharedInstance];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_2;
  v3[3] = &unk_1E6AF57E8;
  id v4 = *(id *)(a1 + 32);
  [v2 requestTransitionWithBuilder:v3];
}

void __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:33];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_3;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
  [v3 finalize];
}

void __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setRequestedAppExposeBundleID:v2];
  [v3 setWaitsForSceneUpdates:0];
}

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3 displayConfiguration:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v9 = v5;
  id v6 = v5;
  id v7 = v8;
  BSDispatchMain();
}

void __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SBMainWorkspace sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_2;
  v4[3] = &unk_1E6AF57E8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 requestTransitionWithOptions:0 displayConfiguration:v3 builder:v4 validator:0];
}

void __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:33];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_3;
  v4[3] = &unk_1E6AF57C0;
  id v5 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
  [v3 finalize];
}

void __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setRequestedAppExposeBundleID:v2];
  [v3 setWaitsForSceneUpdates:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestShelfPresentationEntitlementAuthenticator, 0);
  objc_storeStrong((id *)&self->_triggerShowAllWindowsEntitlementAuthenticator, 0);
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "%@ requested shelf presentation with an invalid scene identifier (%@); defaulting to App Expose shelf",
    (uint8_t *)&v4,
    0x16u);
}

@end