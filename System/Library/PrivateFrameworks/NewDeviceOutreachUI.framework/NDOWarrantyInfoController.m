@interface NDOWarrantyInfoController
- (BOOL)_isValidSubscriptionPlan;
- (BOOL)hasLoaded;
- (BOOL)isSignedIn;
- (BOOL)isWarrantyValid;
- (BOOL)reloadInProgress;
- (BOOL)shouldRefreshOnAppear;
- (BOOL)shouldReloadSpecifiersOnResume;
- (NDOACController)acController;
- (NDOWarrantyInfoController)initWithSpecifier:(id)a3;
- (NSDictionary)appSupportDictionary;
- (NSString)deeplinkParams;
- (PSSpecifier)lastCoverageSpecifier;
- (PSSpecifier)lastDetailSpecifier;
- (id)_errorStateConfig;
- (id)_noAccountConfig;
- (id)coverageItemSubTitle:(id)a3;
- (id)noCoverageInternalSubtitle:(id)a3;
- (id)specifierForID:(id)a3 inSpecifiers:(id)a4;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (unint64_t)previousAppSupportAvailabilityType;
- (void)_addKey:(id)a3 isCopyable:(BOOL)a4 toSpecifiers:(id)a5;
- (void)_addKey:(id)a3 value:(id)a4 isCopyable:(BOOL)a5 toSpecifiers:(id)a6;
- (void)_refresh:(id)a3;
- (void)_refreshWithForcedNetworkPolicy:(BOOL)a3 forceUpdateFollowup:(BOOL)a4 withCompletion:(id)a5;
- (void)_setValue:(id)a3 forSpecifier:(id)a4;
- (void)_setValue:(id)a3 forSpecifierWithKey:(id)a4 inSpecifiers:(id)a5;
- (void)benefitsDescLinkTapped:(id)a3;
- (void)donePressed:(id)a3;
- (void)errorUI;
- (void)footer1Tapped:(id)a3;
- (void)footer2Tapped:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)hideUI;
- (void)loadView;
- (void)managePlanPressed:(id)a3;
- (void)ndoAppleCareCoveragePressed:(id)a3;
- (void)openURL:(id)a3;
- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4;
- (void)postCAEventWithDeviceInfo:(id)a3;
- (void)reloadSpecifiers;
- (void)setAcController:(id)a3;
- (void)setAppSupportDictionary:(id)a3;
- (void)setDeeplinkParams:(id)a3;
- (void)setHasLoaded:(BOOL)a3;
- (void)setIsSignedIn:(BOOL)a3;
- (void)setLastCoverageSpecifier:(id)a3;
- (void)setLastDetailSpecifier:(id)a3;
- (void)setPreviousAppSupportAvailabilityType:(unint64_t)a3;
- (void)setReloadInProgress:(BOOL)a3;
- (void)setShouldRefreshOnAppear:(BOOL)a3;
- (void)showUI;
- (void)updateAppStoreLookupWithSpecifiers:(id)a3;
- (void)updateAppSupportSpecifiersWithSpecifiers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation NDOWarrantyInfoController

- (NDOWarrantyInfoController)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NDOWarrantyInfoController;
  v5 = [(NDOWarrantyInfoController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NDOWarrantyInfoController *)v5 setSpecifier:v4];
  }

  return v6;
}

- (void)loadView
{
}

void __37__NDOWarrantyInfoController_loadView__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__NDOWarrantyInfoController_loadView__block_invoke_2;
  block[3] = &unk_264D49560;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __37__NDOWarrantyInfoController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    v6 = "-[NDOWarrantyInfoController loadView]_block_invoke_2";
    _os_log_impl(&dword_238845000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: finished updating warranty", (uint8_t *)&v5, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) specifier];
  id v4 = [v3 propertyForKey:@"NDODeviceInfo"];

  [*(id *)(a1 + 32) postCAEventWithDeviceInfo:v4];
  [*(id *)(a1 + 32) showUI];
}

- (void)postCAEventWithDeviceInfo:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 warranty];
  int v5 = [v4 coverageLocalizedLabel];

  if (!v5)
  {
    v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NDOWarrantyInfoController postCAEventWithDeviceInfo:]((uint64_t)v3, v6);
    }

    int v5 = @"NULL";
  }
  objc_super v8 = @"coverageType";
  v9[0] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.coverage.viewload" eventDict:v7];
}

- (BOOL)isWarrantyValid
{
  v2 = [(NDOWarrantyInfoController *)self specifier];
  id v3 = [v2 propertyForKey:@"NDODeviceInfo"];

  id v4 = [v3 warranty];
  int v5 = [v3 device];
  uint64_t v6 = [v5 deviceType];

  uint64_t v7 = objc_opt_new();
  objc_super v8 = v7;
  if (v6)
  {
    v9 = [v3 device];
    v10 = [v9 serialNumber];
    v11 = [v8 getDeviceInfoUsingForceCachedPolicyForSerialNumber:v10];
  }
  else
  {
    v11 = [v7 getDefaultDeviceInfoUsingForceCachedPolicy];
  }

  v12 = [v11 warranty];

  char v13 = 0;
  if (v4 && v12) {
    char v13 = [v4 isEqual:v12];
  }

  return v13;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NDOWarrantyInfoController;
  [(NDOWarrantyInfoController *)&v4 viewDidAppear:a3];
  [(NDOWarrantyInfoController *)self reloadSpecifiers];
}

- (void)_refresh:(id)a3
{
  id v4 = a3;
  int v5 = [(NDOWarrantyInfoController *)self specifier];
  uint64_t v6 = [v5 propertyForKey:@"NDODeviceInfo"];

  objc_initWeak(&location, self);
  uint64_t v7 = objc_opt_new();
  objc_super v8 = [v6 device];
  v9 = [v8 serialNumber];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__NDOWarrantyInfoController__refresh___block_invoke;
  v11[3] = &unk_264D49748;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [v7 clearUserInitiatedFollowUpDismissalForSerialNumber:v9 withReply:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __38__NDOWarrantyInfoController__refresh___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__NDOWarrantyInfoController__refresh___block_invoke_2;
  v3[3] = &unk_264D49560;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _refreshWithForcedNetworkPolicy:1 forceUpdateFollowup:1 withCompletion:v3];
}

uint64_t __38__NDOWarrantyInfoController__refresh___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRefreshing];
}

- (void)_refreshWithForcedNetworkPolicy:(BOOL)a3 forceUpdateFollowup:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v45 = a4;
  BOOL v5 = a3;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a5;
  objc_super v8 = [(NDOWarrantyInfoController *)self specifier];
  uint64_t v46 = [v8 propertyForKey:@"NDODevice"];

  v9 = [(NDOWarrantyInfoController *)self specifier];
  uint64_t v10 = [v9 propertyForKey:@"NDODeviceInfo"];

  v11 = [(NDOWarrantyInfoController *)self specifier];
  id v12 = [v11 propertyForKey:@"isSettingsContainer"];

  id v13 = [(NDOWarrantyInfoController *)self specifier];
  uint64_t v14 = [v13 propertyForKey:@"NDOHostingController"];

  if (v12) {
    v15 = (void *)v14;
  }
  else {
    v15 = 0;
  }
  if (v12) {
    v16 = 0;
  }
  else {
    v16 = (void *)v14;
  }
  v17 = _NDOLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v58 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]";
    __int16 v59 = 1024;
    BOOL v60 = v12 != 0;
    _os_log_impl(&dword_238845000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: checking for warranty in settings: %d", buf, 0x12u);
  }

  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke;
  v53[3] = &unk_264D49798;
  v53[4] = self;
  BOOL v56 = v12 != 0;
  id v18 = v16;
  id v54 = v18;
  id v19 = v7;
  id v55 = v19;
  v20 = (void (**)(void, void))MEMORY[0x23EC93640](v53);
  v21 = v20;
  if (!v12)
  {
    if (v5)
    {
      if (v18)
      {
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_81;
        v49[3] = &unk_264D497E8;
        v50 = v20;
        [v18 forceUpdateSpecifiersAndForceUpdateFollowup:v45 withCompletionHandler:v49];
        v33 = v50;
LABEL_28:

LABEL_39:
        v23 = (void *)v46;
        goto LABEL_40;
      }
      v43 = _NDOLogSystem();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]";
        v44 = "%s: no achostingController, cannot call forceUpdateSpecifiersAndForceUpdateFollowup:withCompletionHandler:";
LABEL_37:
        _os_log_impl(&dword_238845000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_82;
        v47[3] = &unk_264D497E8;
        v48 = v20;
        [v18 updateSpecifiersWithCompletionHandler:v47];
        v33 = v48;
        goto LABEL_28;
      }
      v43 = _NDOLogSystem();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]";
        v44 = "%s: no achostingController, cannot call updateSpecifiersWithCompletionHandler:";
        goto LABEL_37;
      }
    }

    v21[2](v21, v10);
    goto LABEL_39;
  }
  if (v5) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 0;
  }
  v23 = (void *)v46;
  if (!(v10 | v46))
  {
    v24 = _NDOLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:](v24, v25, v26, v27, v28, v29, v30, v31);
    }

    [(NDOWarrantyInfoController *)self errorUI];
  }
  if (v15)
  {
    if (v10)
    {
      v32 = [(id)v10 device];
    }
    else
    {
      v32 = (void *)v46;
    }
    v42 = [(NDOWarrantyInfoController *)self deeplinkParams];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_80;
    v51[3] = &unk_264D497C0;
    v52 = v21;
    [v15 updateDeviceInfoForDevice:v32 usingPolicy:v22 params:v42 forceUpdateFollowup:v45 withReply:v51];

    if (v10) {
  }
    }
  else
  {
    v34 = _NDOLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:](v34, v35, v36, v37, v38, v39, v40, v41);
    }

    v21[2](v21, v10);
  }
LABEL_40:
}

void __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [*(id *)(a1 + 32) specifier];
    *(_DWORD *)buf = 136446722;
    id v19 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: refresh completion: specifier: %@, deviceInfo: %@", buf, 0x20u);
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v10 = [*(id *)(a1 + 40) specifiers];
    v9 = [v10 specifierForID:@"WARRANTY_DESCRIPTION"];

    if (v9)
    {
      v11 = _NDOLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v19 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]_block_invoke";
        __int16 v20 = 2112;
        id v21 = v3;
        _os_log_impl(&dword_238845000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: isHostSettings == NO, setting specifier deviceInfo: %@", buf, 0x16u);
      }

      [*(id *)(a1 + 32) setSpecifier:v9];
      id v12 = [v9 propertyForKey:@"NDOWarranty"];
      if (v12)
      {
        id v13 = [*(id *)(a1 + 32) specifier];
        [v13 setProperty:v12 forKey:@"NDOWarranty"];
      }
      uint64_t v14 = [v9 propertyForKey:@"NDODeviceInfo"];
      if (v14)
      {
        v15 = [*(id *)(a1 + 32) specifier];
        [v15 setProperty:v14 forKey:@"NDODeviceInfo"];
      }
    }
    goto LABEL_16;
  }
  if (v3)
  {
    uint64_t v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_238845000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: isHostSettings == YES, setting specifier deviceInfo: %@", buf, 0x16u);
    }

    id v7 = [*(id *)(a1 + 32) specifier];
    objc_super v8 = [v3 warranty];
    [v7 setProperty:v8 forKey:@"NDOWarranty"];

    v9 = [*(id *)(a1 + 32) specifier];
    [v9 setProperty:v3 forKey:@"NDODeviceInfo"];
LABEL_16:
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_78;
  v16[3] = &unk_264D49770;
  v16[4] = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_78(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadSpecifiers
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B88] callStackSymbols];
  int v3 = 136446466;
  id v4 = "-[NDOWarrantyInfoController reloadSpecifiers]";
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_238845000, a1, OS_LOG_TYPE_ERROR, "%{public}s: called off main thread with backtrace: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)updateAppSupportSpecifiersWithSpecifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t)a3;
  __int16 v5 = [(NDOWarrantyInfoController *)self specifier];
  uint64_t v6 = [v5 propertyForKey:@"NDOWarranty"];

  if ([v6 displayRepairAndSupport])
  {
    uint64_t v7 = [(NDOWarrantyInfoController *)self specifier];
    uint64_t v8 = [v7 propertyForKey:@"NDOSupportAppShown"];

    if (v4 | v8)
    {
      if (v4 && v8)
      {
        v11 = [(NDOWarrantyInfoController *)self specifier];
        id v12 = [v11 propertyForKey:@"NDOSupportAppDictionary"];
        [(NDOWarrantyInfoController *)self setAppSupportDictionary:v12];

        id v13 = _NDOLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [(NDOWarrantyInfoController *)self appSupportDictionary];
          *(_DWORD *)id location = 136446466;
          *(void *)&location[4] = "-[NDOWarrantyInfoController updateAppSupportSpecifiersWithSpecifiers:]";
          __int16 v18 = 2112;
          id v19 = v14;
          _os_log_impl(&dword_238845000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: appSupport added with appSupportDictionary: %@", location, 0x16u);
        }
        [(NDOWarrantyInfoController *)self updateAppStoreLookupWithSpecifiers:v4];
      }
      else
      {
        [(NDOWarrantyInfoController *)self setReloadInProgress:0];
      }
    }
    else
    {
      v9 = [(NDOWarrantyInfoController *)self specifier];
      [v9 setProperty:MEMORY[0x263EFFA88] forKey:@"NDOSupportAppShown"];

      objc_initWeak((id *)location, self);
      uint64_t v10 = objc_opt_new();
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke;
      v15[3] = &unk_264D49810;
      objc_copyWeak(&v16, (id *)location);
      [v10 appSupportDictionaryWithReply:v15];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
  }
}

void __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke_2;
  v5[3] = &unk_264D49748;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAppSupportDictionary:*(void *)(a1 + 32)];
  [WeakRetained updateAppStoreLookupWithSpecifiers:0];
  id v3 = [WeakRetained specifier];
  [v3 setProperty:*(void *)(a1 + 32) forKey:@"NDOSupportAppDictionary"];

  [WeakRetained setReloadInProgress:0];
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v5 = [WeakRetained appSupportDictionary];
    int v6 = 136446466;
    id v7 = "-[NDOWarrantyInfoController updateAppSupportSpecifiersWithSpecifiers:]_block_invoke_2";
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: appSupport reload completed with appSupportDictionary: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)updateAppStoreLookupWithSpecifiers:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = [(NDOWarrantyInfoController *)self appSupportDictionary];

  if (v5)
  {
    int v6 = [(NDOWarrantyInfoController *)self specifier];
    id v7 = [v6 propertyForKey:@"NDOWarranty"];

    __int16 v8 = [(NDOWarrantyInfoController *)self appSupportDictionary];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F58740]];

    if ([v9 intValue])
    {
      uint64_t v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26EB85580 target:self set:0 get:0 detail:0 cell:0 edit:0];
      uint64_t v11 = (int)[v9 intValue];
      unint64_t v12 = [(NDOWarrantyInfoController *)self previousAppSupportAvailabilityType];
      -[NDOWarrantyInfoController setPreviousAppSupportAvailabilityType:](self, "setPreviousAppSupportAvailabilityType:", (int)[v9 intValue]);
      unint64_t v29 = v12;
      if (v4)
      {
        [v4 addObject:v10];
      }
      else
      {
        v33[0] = v10;
        uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
        id v13 = [(NDOWarrantyInfoController *)self lastDetailSpecifier];
        if (v13) {
          [(NDOWarrantyInfoController *)self lastDetailSpecifier];
        }
        else {
        uint64_t v14 = [(NDOWarrantyInfoController *)self lastCoverageSpecifier];
        }
        uint64_t v15 = v11;
        BOOL v16 = v12 != v11;
        id v17 = [v14 identifier];
        BOOL v18 = v16;
        uint64_t v11 = v15;
        [(NDOWarrantyInfoController *)self insertContiguousSpecifiers:v28 afterSpecifierID:v17 animated:v18];
      }
      v31[0] = *MEMORY[0x263F5FFE0];
      v32[0] = objc_opt_class();
      v31[1] = *MEMORY[0x263F602A8];
      id v19 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
      v31[2] = *MEMORY[0x263F60138];
      v32[1] = v19;
      v32[2] = @"APPSUPPORT";
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

      id v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26EB85580 target:self set:0 get:0 detail:0 cell:4 edit:0];
      [v21 setProperties:v20];
      [v21 setProperty:v7 forKey:@"NDOWarranty"];
      if (v10)
      {
        __int16 v22 = [v7 localizedSupportAppFooter];
        uint64_t v23 = [v22 length];

        if (v23)
        {
          uint64_t v24 = [v7 localizedSupportAppFooter];
          [v10 setProperty:v24 forKey:*MEMORY[0x263F600F8]];
        }
        if (v4)
        {
          [v4 addObject:v21];
        }
        else
        {
          BOOL v25 = v29 != v11;
          uint64_t v30 = v21;
          uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
          uint64_t v27 = [v10 identifier];
          [(NDOWarrantyInfoController *)self insertContiguousSpecifiers:v26 afterSpecifierID:v27 animated:v25];
        }
      }
    }
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)noCoverageInternalSubtitle:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F58730], "isInternal", a3)) {
    id v3 = @"[internal] Expected for non-production devices";
  }
  else {
    id v3 = &stru_26EB85580;
  }
  return v3;
}

- (id)specifiers
{
  v105[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
LABEL_41:
    id v23 = v3;
    goto LABEL_42;
  }
  __int16 v5 = objc_opt_new();
  int v6 = [(NDOWarrantyInfoController *)self specifier];
  id v7 = [v6 propertyForKey:@"NDOWarranty"];

  __int16 v8 = [(NDOWarrantyInfoController *)self specifier];
  v9 = [v8 propertyForKey:@"NDODeviceInfo"];

  if (v7)
  {
    uint64_t v99 = v2;
    uint64_t v10 = [(NDOWarrantyInfoController *)self specifier];
    uint64_t v11 = [v10 propertyForKey:@"isCoverageCentralContainer"];
    unsigned int v98 = [v11 BOOLValue];

    unint64_t v12 = objc_opt_new();
    v100 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    objc_msgSend(v12, "addObject:");
    char v13 = [v7 coverageHasACLogo];
    uint64_t v14 = (void *)MEMORY[0x263F5FFE0];
    uint64_t v15 = (void *)MEMORY[0x263F60138];
    v101 = v12;
    if (v13)
    {
      v104[0] = *MEMORY[0x263F5FFE0];
      v105[0] = objc_opt_class();
      v104[1] = *MEMORY[0x263F602A8];
      BOOL v16 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
      v105[1] = v16;
      id v17 = [NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];

      BOOL v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26EB85580 target:self set:0 get:0 detail:0 cell:4 edit:0];
      [v18 setProperties:v17];
      [v18 setProperty:v7 forKey:@"NDOWarranty"];
      [v18 setProperty:@"COVERAGE_ITEM" forKey:*v15];
      id v19 = [(NDOWarrantyInfoController *)self coverageItemSubTitle:v18];
      [v18 setProperty:v19 forKey:@"NDOCoverageItemSubtitle"];
      [v12 addObject:v18];
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x263F5FC40];
      BOOL v25 = [v7 coverageLocalizedDesc];
      BOOL v18 = [v24 preferenceSpecifierNamed:v25 target:self set:0 get:sel_coverageItemSubTitle_ detail:0 cell:4 edit:0];

      [v18 setProperty:objc_opt_class() forKey:*v14];
      [v12 addObject:v18];
    }
    [(NDOWarrantyInfoController *)self setLastCoverageSpecifier:v18];
    uint64_t v26 = [v9 warranty];
    uint64_t v27 = [v26 acOfferDisplayDate];

    uint64_t v28 = [v9 warranty];
    int v29 = [v28 acOfferEligible];
    if (v27)
    {
      if (v29)
      {
        id v30 = [v9 warranty];
        uint64_t v31 = [v30 acOfferDisplayDate];
        [v31 timeIntervalSinceNow];
        if (v32 > 0.0)
        {
LABEL_21:

          goto LABEL_22;
        }
        v33 = [v9 warranty];
        v34 = [v33 acOfferEligibleUntil];
        [v34 timeIntervalSinceNow];
        double v36 = v35;

LABEL_15:
        uint64_t v40 = v101;
        if (v36 <= 0.0) {
          goto LABEL_23;
        }
        uint64_t v41 = (void *)MEMORY[0x263F5FC40];
        v42 = [v9 warranty];
        v43 = [v42 acLocalizedOfferCTA];
        uint64_t v28 = [v41 preferenceSpecifierNamed:v43 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v28 setProperty:@"WARRANTY_OFFER" forKey:*MEMORY[0x263F60138]];
        [v28 setButtonAction:sel_ndoAppleCareCoveragePressed_];
        [v28 setProperty:v9 forKey:@"NDODeviceInfo"];
        [v28 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
        v44 = [NSNumber numberWithBool:v98];
        [v28 setProperty:v44 forKey:@"isCoverageCentralContainer"];

        [v101 addObject:v28];
        BOOL v45 = [v9 warranty];
        uint64_t v31 = [v45 acLocalizedOfferDesc];

        if ([v31 length])
        {
          id v30 = v31;
          if (v30)
          {
            uint64_t v46 = [NSString stringWithFormat:@"%@", v30];
            [v100 setProperty:v46 forKey:*MEMORY[0x263F600F8]];
          }
        }
        else
        {
          id v30 = 0;
        }
        [(NDOWarrantyInfoController *)self setLastCoverageSpecifier:v28];
        goto LABEL_21;
      }
    }
    else if (v29)
    {
      uint64_t v37 = [v9 warranty];
      uint64_t v38 = [v37 acOfferEligibleUntil];
      [v38 timeIntervalSinceNow];
      double v36 = v39;

      goto LABEL_15;
    }
LABEL_22:
    uint64_t v40 = v101;

LABEL_23:
    [v5 addObjectsFromArray:v40];
    v47 = [v7 coverageDetailsDictionary];

    if (!v47)
    {
LABEL_31:
      [(NDOWarrantyInfoController *)self updateAppSupportSpecifiersWithSpecifiers:v5];
      if ([(NDOWarrantyInfoController *)self _isValidSubscriptionPlan])
      {
        v66 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        [v5 addObject:v66];
        v67 = [v7 acLocalizedUnlinkedPlanLabel];
        v68 = v67;
        if (v67)
        {
          id v69 = v67;
        }
        else
        {
          id v69 = [v7 localizedManagePlanLabel];
        }
        v70 = v69;

        v71 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v70 target:self set:0 get:0 detail:0 cell:13 edit:0];
        [v71 setProperty:@"SUBSCRIPTION_PLAN" forKey:*MEMORY[0x263F60138]];
        [v71 setButtonAction:sel_managePlanPressed_];
        [v71 setProperty:v7 forKey:@"NDOWarranty"];
        [v71 setProperty:v9 forKey:@"NDODeviceInfo"];
        [v5 addObject:v71];
      }
      v72 = [v7 footer1FormatString];
      uint64_t v73 = [v72 length];

      if (v73)
      {
        v74 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        v75 = NSString;
        v76 = [v7 footer1FormatString];
        v77 = [v7 footer1LinkLabel];
        v78 = objc_msgSend(v75, "stringWithFormat:", v76, v77);

        uint64_t v40 = v101;
        [v74 setProperty:v78 forKey:*MEMORY[0x263F600E8]];
        v79 = (objc_class *)objc_opt_class();
        v80 = NSStringFromClass(v79);
        [v74 setProperty:v80 forKey:*MEMORY[0x263F600C0]];

        v81 = [v7 footer1LinkLabel];
        v108.id location = [v78 rangeOfString:v81];
        v82 = NSStringFromRange(v108);
        [v74 setProperty:v82 forKey:*MEMORY[0x263F600D0]];

        v83 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
        [v74 setProperty:v83 forKey:*MEMORY[0x263F600E0]];

        [v74 setProperty:@"footer1Tapped:" forKey:*MEMORY[0x263F600C8]];
        [v5 addObject:v74];
      }
      v84 = [v7 footer2FormatString];
      uint64_t v85 = [v84 length];

      if (v85)
      {
        v86 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        v87 = NSString;
        v88 = [v7 footer2FormatString];
        v89 = [v7 footer2LinkLabel];
        v90 = objc_msgSend(v87, "stringWithFormat:", v88, v89);

        uint64_t v40 = v101;
        [v86 setProperty:v90 forKey:*MEMORY[0x263F600E8]];
        v91 = (objc_class *)objc_opt_class();
        v92 = NSStringFromClass(v91);
        [v86 setProperty:v92 forKey:*MEMORY[0x263F600C0]];

        v93 = [v7 footer2LinkLabel];
        v109.id location = [v90 rangeOfString:v93];
        v94 = NSStringFromRange(v109);
        [v86 setProperty:v94 forKey:*MEMORY[0x263F600D0]];

        v95 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
        [v86 setProperty:v95 forKey:*MEMORY[0x263F600E0]];

        [v86 setProperty:@"footer2Tapped:" forKey:*MEMORY[0x263F600C8]];
        [v5 addObject:v86];
      }
      v96 = *(Class *)((char *)&self->super.super.super.super.super.isa + v99);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v99) = (Class)v5;

      id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v99);
      goto LABEL_41;
    }
    v48 = (void *)MEMORY[0x263F5FC40];
    v49 = [v7 localizedCoverageDetailsTitle];
    v50 = [v48 preferenceSpecifierNamed:v49 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v5 addObject:v50];
    v51 = [v7 coverageDetailsDictionary];

    if (v51)
    {
      v52 = objc_opt_new();
      v53 = [v7 coverageDetailsArray];
      v102[0] = MEMORY[0x263EF8330];
      v102[1] = 3221225472;
      v102[2] = __39__NDOWarrantyInfoController_specifiers__block_invoke;
      v102[3] = &unk_264D49838;
      v102[4] = self;
      id v103 = v52;
      id v54 = v52;
      [v53 enumerateObjectsUsingBlock:v102];
      [v5 addObjectsFromArray:v54];
      id v55 = [v54 lastObject];
      [(NDOWarrantyInfoController *)self setLastDetailSpecifier:v55];
    }
    BOOL v56 = [v7 localizedCoverageFooterFormatString];
    if ([v56 length])
    {
      v57 = [v7 localizedCoverageFooterLinkLabel];
      uint64_t v58 = [v57 length];

      if (!v58)
      {
LABEL_30:

        goto LABEL_31;
      }
      BOOL v56 = [v7 localizedCoverageFooterLinkLabel];
      __int16 v59 = NSString;
      BOOL v60 = [v7 localizedCoverageFooterFormatString];
      uint64_t v61 = objc_msgSend(v59, "stringWithFormat:", v60, v56);

      uint64_t v40 = v101;
      [v50 setProperty:v61 forKey:*MEMORY[0x263F600F8]];
      [v50 setProperty:v61 forKey:*MEMORY[0x263F600E8]];
      v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      [v50 setProperty:v63 forKey:*MEMORY[0x263F600C0]];

      v107.id location = [v61 rangeOfString:v56];
      v64 = NSStringFromRange(v107);
      [v50 setProperty:v64 forKey:*MEMORY[0x263F600D0]];

      v65 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
      [v50 setProperty:v65 forKey:*MEMORY[0x263F600E0]];

      [v50 setProperty:@"benefitsDescLinkTapped:" forKey:*MEMORY[0x263F600C8]];
    }

    goto LABEL_30;
  }
  if ([MEMORY[0x263F58730] isInternal])
  {
    uint64_t v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"[internal] No coverage info" target:self set:0 get:sel_noCoverageInternalSubtitle_ detail:0 cell:4 edit:0];
    [v20 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v5 addObject:v20];
  }
  id v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v5;
  id v22 = v5;

  id v23 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
LABEL_42:
  return v23;
}

void __39__NDOWarrantyInfoController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"localizedCoverageLabel"];
  id v4 = [v3 objectForKeyedSubscript:@"localizedCoverageValue"];

  [*(id *)(a1 + 32) _addKey:v5 value:v4 isCopyable:1 toSpecifiers:*(void *)(a1 + 40)];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v11 = "-[NDOWarrantyInfoController handleURL:withCompletion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_238845000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Handle url %@", buf, 0x16u);
  }

  if ([(NDOWarrantyInfoController *)self hasLoaded]) {
    [(NDOWarrantyInfoController *)self reloadSpecifiers];
  }
  v9.receiver = self;
  v9.super_class = (Class)NDOWarrantyInfoController;
  [(NDOWarrantyInfoController *)&v9 handleURL:v6 withCompletion:v7];
}

- (id)coverageItemSubTitle:(id)a3
{
  id v3 = [(NDOWarrantyInfoController *)self specifier];
  id v4 = [v3 propertyForKey:@"NDOWarranty"];

  if ([v4 isACServicesPartner])
  {
    id v5 = [v4 localizedCoverageSubTitleForServicesPartnerString];
  }
  else
  {
    id v6 = [v4 coverageEndDate];

    if (v6)
    {
      id v7 = objc_opt_new();
      [v7 setTimeStyle:0];
      [v7 setDateStyle:3];
      __int16 v8 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
      [v7 setTimeZone:v8];

      objc_super v9 = [v4 coverageEndDate];
      uint64_t v10 = [v7 stringFromDate:v9];

      uint64_t v11 = NSString;
      __int16 v12 = [v4 coverageLocalizedExpirationLabel];
      id v5 = [v11 stringWithFormat:@"%@ %@", v12, v10];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)managePlanPressed:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[NDOWarrantyInfoController managePlanPressed:](v4);
  }

  id v5 = [v3 propertyForKey:@"NDODeviceInfo"];
  uint64_t v37 = @"devicetype";
  id v6 = [v5 device];
  id v7 = [v6 deviceTypeString];
  v38[0] = v7;
  __int16 v8 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];

  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.coverage.loadmanageplan" eventDict:v8];
  objc_super v9 = (void *)MEMORY[0x263F27B40];
  uint64_t v10 = [MEMORY[0x263F27ED8] bagKeySet];
  uint64_t v11 = [MEMORY[0x263F27ED8] bagSubProfile];
  __int16 v12 = [MEMORY[0x263F27ED8] bagSubProfileVersion];
  [v9 registerBagKeySet:v10 forProfile:v11 profileVersion:v12];

  id v13 = [MEMORY[0x263F27B28] bagForProfile:@"AppleCare" profileVersion:@"1"];
  uint64_t v14 = [v13 URLForKey:@"manageSubscriptionsV2Url"];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __47__NDOWarrantyInfoController_managePlanPressed___block_invoke;
  v35[3] = &unk_264D49860;
  id v15 = v3;
  id v36 = v15;
  BOOL v16 = [v14 transformWithBlock:v35];
  id v17 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  BOOL v18 = objc_msgSend(v17, "ams_activeiTunesAccount");

  if (!v18)
  {
    id v19 = _NDOLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NDOWarrantyInfoController managePlanPressed:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F28030]) initWithBag:v13 account:v18 clientInfo:0];
  id v28 = (id)[v27 loadBagValue:v16];
  int v29 = [[NDOAMSUIWebViewWrapperController alloc] initWithViewController:v27];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_179;
  v34[3] = &unk_264D49560;
  v34[4] = self;
  [(NDOAMSUIWebViewWrapperController *)v29 setDismissBlock:v34];
  id v30 = [(NDOAMSUIWebViewWrapperController *)v29 presentationController];
  [v30 setDelegate:v29];

  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v29];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  void v33[2] = __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_181;
  v33[3] = &unk_264D49560;
  v33[4] = self;
  [(NDOWarrantyInfoController *)self presentViewController:v31 animated:1 completion:v33];
}

id __47__NDOWarrantyInfoController_managePlanPressed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 propertyForKey:@"NDODeviceInfo"];
  id v5 = [v4 device];
  id v6 = [v5 serialNumber];

  id v7 = [v3 absoluteString];

  __int16 v8 = [v7 stringByAppendingFormat:@"?context=linking&source=applecaresettings&serialNumbers=%@", v6];

  objc_super v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v15 = "-[NDOWarrantyInfoController managePlanPressed:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_238845000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: deviceInfo: %@ with url: %@", buf, 0x20u);
  }

  uint64_t v10 = (void *)MEMORY[0x263F27E10];
  uint64_t v11 = [NSURL URLWithString:v8];
  __int16 v12 = [v10 promiseWithResult:v11];

  return v12;
}

uint64_t __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_179(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[NDOWarrantyInfoController managePlanPressed:]_block_invoke";
    _os_log_impl(&dword_238845000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: refreshing warranty after dismiss", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) _refreshWithForcedNetworkPolicy:1 forceUpdateFollowup:0 withCompletion:0];
}

uint64_t __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_181(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldRefreshOnAppear:1];
}

- (void)footer1Tapped:(id)a3
{
  int v4 = [(NDOWarrantyInfoController *)self specifier];
  id v8 = [v4 propertyForKey:@"NDOWarranty"];

  id v5 = NSURL;
  uint64_t v6 = [v8 footer1LinkURL];
  id v7 = [v5 URLWithString:v6];
  [(NDOWarrantyInfoController *)self openURL:v7];
}

- (void)benefitsDescLinkTapped:(id)a3
{
  int v4 = [(NDOWarrantyInfoController *)self specifier];
  id v7 = [v4 propertyForKey:@"NDOWarranty"];

  id v5 = [[NDOWarrantyBenefitsViewController alloc] initWithWarranty:v7];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v5];
  [(NDOWarrantyInfoController *)self presentViewController:v6 animated:1 completion:&__block_literal_global_1];
}

- (void)donePressed:(id)a3
{
}

- (void)footer2Tapped:(id)a3
{
  int v4 = [(NDOWarrantyInfoController *)self specifier];
  id v8 = [v4 propertyForKey:@"NDOWarranty"];

  id v5 = NSURL;
  uint64_t v6 = [v8 footer2LinkURL];
  id v7 = [v5 URLWithString:v6];
  [(NDOWarrantyInfoController *)self openURL:v7];
}

- (void)openURL:(id)a3
{
}

- (void)_addKey:(id)a3 value:(id)a4 isCopyable:(BOOL)a5 toSpecifiers:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  [(NDOWarrantyInfoController *)self _addKey:a3 isCopyable:v6 toSpecifiers:v10];
  id v12 = [v10 lastObject];

  [(NDOWarrantyInfoController *)self _setValue:v11 forSpecifier:v12];
}

- (void)_addKey:(id)a3 isCopyable:(BOOL)a4 toSpecifiers:(id)a5
{
  BOOL v5 = a4;
  id v13 = a5;
  id v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a3;
  id v10 = [v8 mainBundle];
  id v11 = [v10 localizedStringForKey:v9 value:&stru_26EB85580 table:0];

  id v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
  [v12 setProperty:v9 forKey:*MEMORY[0x263F60138]];

  [v12 setProperty:NSClassFromString(&cfstr_Psmultilinetab.isa) forKey:*MEMORY[0x263F5FFE0]];
  if (v5) {
    [v12 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60050]];
  }
  [v13 addObject:v12];
}

- (void)_setValue:(id)a3 forSpecifierWithKey:(id)a4 inSpecifiers:(id)a5
{
  id v8 = a3;
  id v9 = [(NDOWarrantyInfoController *)self specifierForID:a4 inSpecifiers:a5];
  [(NDOWarrantyInfoController *)self _setValue:v8 forSpecifier:v9];
}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x263F60308];
    id v9 = a4;
    [v9 setProperty:a3 forKey:v5];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x263F086E0];
    id v7 = a4;
    id v9 = [v6 mainBundle];
    id v8 = [v9 localizedStringForKey:@"N/A" value:&stru_26EB85580 table:0];
    [v7 setProperty:v8 forKey:*MEMORY[0x263F60308]];
  }
}

- (id)specifierForID:(id)a3 inSpecifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__NDOWarrantyInfoController_specifierForID_inSpecifiers___block_invoke;
  v10[3] = &unk_264D49888;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __57__NDOWarrantyInfoController_specifierForID_inSpecifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 propertyForKey:*MEMORY[0x263F60138]];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x263F60308]];
}

- (BOOL)_isValidSubscriptionPlan
{
  uint64_t v2 = [(NDOWarrantyInfoController *)self specifier];
  id v3 = [v2 propertyForKey:@"NDOWarranty"];

  LOBYTE(v2) = [v3 isCoveragePlanSubscriptionType];
  return (char)v2;
}

- (void)ndoAppleCareCoveragePressed:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    uint64_t v26 = "-[NDOWarrantyInfoController ndoAppleCareCoveragePressed:]";
    _os_log_impl(&dword_238845000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v25, 0xCu);
  }

  id v6 = [v4 propertyForKey:@"NDODeviceInfo"];
  id v7 = [v4 propertyForKey:@"isCoverageCentralContainer"];

  int v8 = [v7 BOOLValue];
  id v9 = [v6 device];
  id v10 = [v9 sourceFromDeviceType];
  id v11 = v10;
  if (v8) {
    id v12 = @"_COVERAGE_CENTRAL";
  }
  else {
    id v12 = @"_COVERAGE";
  }
  uint64_t v13 = [v10 stringByAppendingString:v12];

  uint64_t v14 = [NDOAppleCareViewController alloc];
  uint64_t v15 = [(NDOWarrantyInfoController *)self deeplinkParams];
  __int16 v16 = [(NDOAppleCareViewController *)v14 initWithDeviceInfo:v6 presentationType:0 source:v13 deeplinkParams:v15];

  [(NDOAppleCareViewController *)v16 setPresentor:self];
  id v17 = [MEMORY[0x263F82670] currentDevice];
  if ([v17 userInterfaceIdiom] == 1)
  {

    uint64_t v18 = 2;
  }
  else
  {
    id v19 = [MEMORY[0x263F82670] currentDevice];
    BOOL v20 = [v19 userInterfaceIdiom] == 6;

    uint64_t v18 = 2 * v20;
  }
  [(NDOAppleCareViewController *)v16 setModalPresentationStyle:v18];
  [(NDOAppleCareViewController *)v16 setModalInPresentation:1];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v16];
  uint64_t v22 = [MEMORY[0x263F82670] currentDevice];
  if ([v22 userInterfaceIdiom] == 6)
  {

LABEL_12:
    [v21 setModalPresentationStyle:2];
    goto LABEL_13;
  }
  uint64_t v23 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  if (v24 == 1) {
    goto LABEL_12;
  }
LABEL_13:
  [v21 setModalInPresentation:1];
  [(NDOWarrantyInfoController *)self presentViewController:v21 animated:1 completion:0];
}

- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]";
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke;
  v13[3] = &unk_264D498D8;
  v13[4] = self;
  v13[5] = a4;
  int v8 = (void (**)(void))MEMORY[0x23EC93640](v13);
  if (!a4) {
    goto LABEL_8;
  }
  id v9 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_207;
  v11[3] = &unk_264D49538;
  id v12 = v6;
  [v9 dismissFollowUpForSerialNumber:v12 completion:v11];
  if (a4 == 2)
  {
    v8[2](v8);

    goto LABEL_9;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_215;
  v10[3] = &unk_264D49560;
  void v10[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  if (a4 != 3 && a4 != 5) {
LABEL_8:
  }
    v8[2](v8);
LABEL_9:
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2;
  block[3] = &unk_264D498B0;
  objc_copyWeak(v3, &location);
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v3);
  objc_destroyWeak(&location);
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 40) == 2)
  {
    id v4 = _NDOLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v7 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke_2";
      _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Refreshing device info after purchase done", buf, 0xCu);
    }

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_205;
    v5[3] = &unk_264D49560;
    void v5[4] = v3;
    [v3 _refreshWithForcedNetworkPolicy:1 forceUpdateFollowup:1 withCompletion:v5];
  }
  else
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_205(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    _os_log_impl(&dword_238845000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Device info refreshed after purchase done", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"NDOPurchaseCompletedNotification" object:0];
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_207(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"Failed to dismiss";
    uint64_t v8 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136446722;
    if (a2) {
      id v5 = @"Dismissed";
    }
    __int16 v9 = 2114;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@ followup up for %@", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_215(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshWithForcedNetworkPolicy:1 forceUpdateFollowup:1 withCompletion:&__block_literal_global_218];
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2_216()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _NDOLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    uint64_t v2 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke_2";
    _os_log_impl(&dword_238845000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: Device info refreshed only.", (uint8_t *)&v1, 0xCu);
  }
}

- (id)_noAccountConfig
{
  uint64_t v2 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  int v4 = [v3 localizedStringForKey:@"CC_NO_ACCOUNT_ERROR_TITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v2 setText:v4];

  id v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  uint64_t v6 = [v5 localizedStringForKey:@"CC_NO_ACCOUNT_ERROR_SUBTITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v2 setSecondaryText:v6];

  int v7 = [MEMORY[0x263F827E8] systemImageNamed:@"person.crop.circle"];
  [v2 setImage:v7];

  return v2;
}

- (id)_errorStateConfig
{
  uint64_t v3 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  int v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  id v5 = [v4 localizedStringForKey:@"CC_ISSUE_ERROR_TITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v3 setText:v5];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  int v7 = [v6 localizedStringForKey:@"CC_ISSUE_ERROR_SUBTITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v3 setSecondaryText:v7];

  uint64_t v8 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill"];
  [v3 setImage:v8];

  __int16 v9 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  id v10 = [v3 buttonProperties];
  [v10 setConfiguration:v9];

  __int16 v11 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  uint64_t v12 = [v11 localizedStringForKey:@"CC_RETRY" value:&stru_26EB85580 table:@"Localizable"];
  uint64_t v13 = [v3 buttonProperties];
  uint64_t v14 = [v13 configuration];
  [v14 setTitle:v12];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__NDOWarrantyInfoController__errorStateConfig__block_invoke;
  v18[3] = &unk_264D49900;
  v18[4] = self;
  uint64_t v15 = [MEMORY[0x263F823D0] actionWithHandler:v18];
  uint64_t v16 = [v3 buttonProperties];
  [v16 setPrimaryAction:v15];

  return v3;
}

uint64_t __46__NDOWarrantyInfoController__errorStateConfig__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refresh:0];
}

- (void)hideUI
{
  uint64_t v3 = [MEMORY[0x263F82600] loadingConfiguration];
  [(NDOWarrantyInfoController *)self _setContentUnavailableConfiguration:v3];

  id v4 = [(NDOWarrantyInfoController *)self table];
  [v4 setHidden:1];
}

- (void)errorUI
{
  uint64_t v3 = [(NDOWarrantyInfoController *)self _errorStateConfig];
  [(NDOWarrantyInfoController *)self _setContentUnavailableConfiguration:v3];

  id v4 = [(NDOWarrantyInfoController *)self table];
  [v4 setHidden:1];
}

- (void)showUI
{
  [(NDOWarrantyInfoController *)self _setContentUnavailableConfiguration:0];
  id v3 = [(NDOWarrantyInfoController *)self table];
  [v3 setHidden:0];
}

- (NDOACController)acController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_acController);
  return (NDOACController *)WeakRetained;
}

- (void)setAcController:(id)a3
{
}

- (NSDictionary)appSupportDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setAppSupportDictionary:(id)a3
{
}

- (PSSpecifier)lastDetailSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setLastDetailSpecifier:(id)a3
{
}

- (PSSpecifier)lastCoverageSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setLastCoverageSpecifier:(id)a3
{
}

- (BOOL)reloadInProgress
{
  return self->_reloadInProgress;
}

- (void)setReloadInProgress:(BOOL)a3
{
  self->_reloadInProgress = a3;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (BOOL)shouldRefreshOnAppear
{
  return self->_shouldRefreshOnAppear;
}

- (void)setShouldRefreshOnAppear:(BOOL)a3
{
  self->_shouldRefreshOnAppear = a3;
}

- (unint64_t)previousAppSupportAvailabilityType
{
  return self->_previousAppSupportAvailabilityType;
}

- (void)setPreviousAppSupportAvailabilityType:(unint64_t)a3
{
  self->_previousAppSupportAvailabilityType = a3;
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setDeeplinkParams:(id)a3
{
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (void)setIsSignedIn:(BOOL)a3
{
  self->_isSignedIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_storeStrong((id *)&self->_lastCoverageSpecifier, 0);
  objc_storeStrong((id *)&self->_lastDetailSpecifier, 0);
  objc_storeStrong((id *)&self->_appSupportDictionary, 0);
  objc_destroyWeak((id *)&self->_acController);
}

- (void)postCAEventWithDeviceInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446467;
  id v3 = "-[NDOWarrantyInfoController postCAEventWithDeviceInfo:]";
  __int16 v4 = 2113;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_238845000, a2, OS_LOG_TYPE_ERROR, "%{public}s: coverageLocalizedLabel nil with deviceInfo: %{private}@", (uint8_t *)&v2, 0x16u);
}

- (void)_refreshWithForcedNetworkPolicy:(uint64_t)a3 forceUpdateFollowup:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_refreshWithForcedNetworkPolicy:(uint64_t)a3 forceUpdateFollowup:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)managePlanPressed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)managePlanPressed:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "-[NDOWarrantyInfoController managePlanPressed:]";
  _os_log_debug_impl(&dword_238845000, log, OS_LOG_TYPE_DEBUG, "%{public}s:", (uint8_t *)&v1, 0xCu);
}

@end