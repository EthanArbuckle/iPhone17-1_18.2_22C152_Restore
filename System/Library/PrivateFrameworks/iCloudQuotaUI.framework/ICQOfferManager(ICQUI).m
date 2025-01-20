@interface ICQOfferManager(ICQUI)
- (id)flowManager;
- (void)_getCachedLinkData:()ICQUI completion:;
- (void)fetchAndPresentUpsellForBundleIdentifier:()ICQUI event:completion:;
- (void)setFlowManager:()ICQUI;
- (void)upgradeFlowManagerDidCancel:()ICQUI;
- (void)upgradeFlowManagerDidComplete:()ICQUI;
@end

@implementation ICQOfferManager(ICQUI)

- (void)fetchAndPresentUpsellForBundleIdentifier:()ICQUI event:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICQOfferManager(ICQUI) fetchAndPresentUpsellForBundleIdentifier:event:completion:](v11);
  }

  id v12 = objc_alloc(MEMORY[0x263EFF910]);
  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 doubleForKey:@"lastiCloudAppLaunchCheck"];
  v14 = objc_msgSend(v12, "initWithTimeIntervalSince1970:");

  [v14 timeIntervalSinceNow];
  if (v15 <= -172800.0)
  {
    v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v18 = [MEMORY[0x263EFF910] now];
    [v18 timeIntervalSince1970];
    objc_msgSend(v17, "setDouble:forKey:", @"lastiCloudAppLaunchCheck");

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke;
    v19[3] = &unk_264923540;
    id v20 = v9;
    id v21 = v8;
    v22 = a1;
    id v23 = v10;
    [a1 getOfferForBundleIdentifier:v21 completion:v19];
  }
  else
  {
    v16 = _ICQGetLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "Last app launch link check was <48h ago, skipping check", buf, 2u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (id)flowManager
{
  return objc_getAssociatedObject(a1, &ICQUIUpsellTriggerEventFlowManagerKey);
}

- (void)setFlowManager:()ICQUI
{
}

- (void)upgradeFlowManagerDidCancel:()ICQUI
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 flowManager];

  v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [a1 flowManager];
    [v12 setDelegate:0];

    [a1 setFlowManager:0];
  }
  else
  {
    if (v7)
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [a1 flowManager];
      int v13 = 138543874;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel for manager %@ instead of %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)upgradeFlowManagerDidComplete:()ICQUI
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 flowManager];

  v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v11 = v13;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete", (uint8_t *)&v12, 0xCu);
    }
    [a1 setFlowManager:0];
  }
  else
  {
    if (v7)
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [a1 flowManager];
      int v12 = 138543874;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete for manager %@ instead of %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_getCachedLinkData:()ICQUI completion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2050000000;
  BOOL v7 = (void *)getINDaemonConnectionClass_softClass_4;
  uint64_t v14 = getINDaemonConnectionClass_softClass_4;
  if (!getINDaemonConnectionClass_softClass_4)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getINDaemonConnectionClass_block_invoke_4;
    v10[3] = &unk_264921E58;
    v10[4] = &v11;
    __getINDaemonConnectionClass_block_invoke_4((uint64_t)v10);
    BOOL v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  id v9 = objc_alloc_init(v8);
  [v9 getCacheDataForLink:v5 completion:v6];
}

- (void)fetchAndPresentUpsellForBundleIdentifier:()ICQUI event:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Checking for app launch link to present", v1, 2u);
}

@end