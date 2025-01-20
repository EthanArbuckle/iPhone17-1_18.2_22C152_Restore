@interface SBLockScreenActionContextFactory
+ (id)sharedInstance;
- (id)lockScreenActionContextForAction:(id)a3 fromPlugin:(id)a4;
- (id)lockScreenActionContextForAlertItem:(id)a3;
- (id)lockScreenActionContextForPlugin:(id)a3;
@end

@implementation SBLockScreenActionContextFactory

+ (id)sharedInstance
{
  if (sharedInstance___once_4 != -1) {
    dispatch_once(&sharedInstance___once_4, &__block_literal_global_162);
  }
  v2 = (void *)sharedInstance___instance_5;
  return v2;
}

void __50__SBLockScreenActionContextFactory_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBLockScreenActionContextFactory);
  v1 = (void *)sharedInstance___instance_5;
  sharedInstance___instance_5 = (uint64_t)v0;
}

- (id)lockScreenActionContextForAlertItem:(id)a3
{
  id v3 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBLockScreenActionContextFactory_lockScreenActionContextForAlertItem___block_invoke;
  v10[3] = &unk_1E6AF4AC0;
  id v11 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1D948C7A0](v10);
  v6 = [v4 lockLabel];
  v7 = [v4 shortLockLabel];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA5FA0]) initWithLockLabel:v6 shortLockLabel:v7 action:v5 identifier:0];
  [v8 setCanBypassPinLock:0];
  [v8 setRequiresUIUnlock:1];
  [v8 setDeactivateAwayController:1];

  return v8;
}

uint64_t __72__SBLockScreenActionContextFactory_lockScreenActionContextForAlertItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUnlockAction];
}

- (id)lockScreenActionContextForPlugin:(id)a3
{
  id v4 = a3;
  v5 = [v4 unlockAction];
  v6 = [(SBLockScreenActionContextFactory *)self lockScreenActionContextForAction:v5 fromPlugin:v4];

  return v6;
}

- (id)lockScreenActionContextForAction:(id)a3 fromPlugin:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if ([v5 isApplicationAction])
    {
      v9 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      v10 = [v9 policyAggregator];
      int v11 = [v10 allowsCapability:3];

      if (!v11)
      {
        id v18 = 0;
LABEL_14:
        v8 = 0;
LABEL_17:

        goto LABEL_18;
      }
      id v12 = v5;
      v13 = [v7 name];
      uint64_t v14 = [v12 bundleID];
      uint64_t v15 = [v12 url];
      uint64_t v16 = [v12 transitionStyle];
      if (v14 | v15)
      {
        uint64_t v17 = v16;
        id v18 = objc_alloc_init(MEMORY[0x1E4FA5FA0]);
        v19 = [v12 label];
        [v18 setLockLabel:v19];

        [v18 setRequiresAuthentication:1];
        [v18 setCanBypassPinLock:0];
        [v18 setRequiresUIUnlock:1];
        [v18 setDeactivateAwayController:1];
        [v18 setIntent:3];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke;
        v25[3] = &unk_1E6AF6F98;
        id v26 = (id)v14;
        id v27 = (id)v15;
        id v28 = v13;
        uint64_t v29 = v17;
        [v18 setAction:v25];
      }
      else
      {
        id v18 = 0;
      }

      if (!(v14 | v15)) {
        goto LABEL_14;
      }
    }
    else if ([v5 isEmergencyDialerAction])
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4FA5FA0]);
      [v18 setRequiresAuthentication:0];
      [v18 setRequiresUIUnlock:0];
      [v18 setDeactivateAwayController:0];
      [v18 setAction:&__block_literal_global_11_2];
    }
    else if ([v5 isCallAction])
    {
      id v20 = v5;
      id v18 = objc_alloc_init(MEMORY[0x1E4FA5FA0]);
      [v18 setRequiresAuthentication:0];
      [v18 setRequiresUIUnlock:0];
      [v18 setDeactivateAwayController:0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_5;
      v23[3] = &unk_1E6AF4AC0;
      id v24 = v20;
      id v21 = v20;
      [v18 setAction:v23];
    }
    else
    {
      id v18 = 0;
    }
    [v18 setSource:8];
    id v18 = v18;
    v8 = v18;
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v3 = SBWorkspaceApplicationForURLWithError(*(void **)(a1 + 40), 0, 0);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v2 = +[SBApplicationController sharedInstance];
  id v3 = [v2 applicationWithBundleIdentifier:*(void *)(a1 + 32)];

  if (v3)
  {
LABEL_3:
    id v4 = +[SBWorkspace mainWorkspace];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_2;
    v7[3] = &unk_1E6B02108;
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = v5;
    uint64_t v11 = v6;
    [v4 requestTransitionWithBuilder:v7];
  }
LABEL_4:
}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 bundleIdentifier];
  v7 = [v3 stringWithFormat:@"Activate %@ from plugin %@", v6, *(void *)(a1 + 40)];
  [v5 setEventLabel:v7];

  [v5 setSource:7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_3;
  v10[3] = &unk_1E6B020E0;
  id v11 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v12 = v8;
  uint64_t v13 = v9;
  [v5 modifyApplicationContext:v10];
}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_3(void *a1, void *a2)
{
  id v4 = a2;
  id v3 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:a1[4]];
  [(SBWorkspaceEntity *)v3 setObject:a1[5] forActivationSetting:5];
  [v4 setActivatingEntity:v3];
  if (a1[6] == 2) {
    [v4 setAnimationDisabled:1];
  }
}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_4()
{
  id v2 = +[SBLockScreenManager sharedInstance];
  v0 = [v2 lockScreenEnvironment];
  v1 = [v0 callController];
  [v1 launchEmergencyDialer];
}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) url];
  SBWorkspaceActivateApplicationFromURL(v1, 0, 0);
}

@end