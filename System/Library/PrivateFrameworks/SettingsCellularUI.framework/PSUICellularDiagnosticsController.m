@interface PSUICellularDiagnosticsController
- (BOOL)_appLockupViewNotAvailable;
- (NSNumber)_diagCode;
- (PSUICellularDiagnosticsController)init;
- (id)diagnosticsStatus;
- (id)getAppViewSpecifier:(id)a3;
- (id)getLogger;
- (id)initAppInstallViewSpecifier:(id)a3;
- (id)specifiers;
- (void)learnMoreLinkTapped;
- (void)set_appLockupViewNotAvailable:(BOOL)a3;
- (void)set_diagCode:(id)a3;
@end

@implementation PSUICellularDiagnosticsController

- (PSUICellularDiagnosticsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSUICellularDiagnosticsController;
  v2 = [(PSUICellularDiagnosticsController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(PSUICellularDiagnosticsController *)v2 set_appLockupViewNotAvailable:0];
    appViewSpecifier = v3->_appViewSpecifier;
    v3->_appViewSpecifier = 0;
  }
  return v3;
}

- (id)initAppInstallViewSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICellularDiagnosticsController;
  objc_super v6 = [(PSUICellularDiagnosticsController *)&v9 init];
  p_isa = (id *)&v6->super.super.super.super.super.isa;
  if (v6)
  {
    [(PSUICellularDiagnosticsController *)v6 set_appLockupViewNotAvailable:1];
    objc_storeStrong(p_isa + 173, a3);
  }

  return p_isa;
}

- (id)diagnosticsStatus
{
  return (id)[*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) getDiagnosticsStatusText];
}

- (id)getAppViewSpecifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularDiagnosticsController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[PSUICellularDiagnosticsController getAppViewSpecifier:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  appViewSpecifier = self->_appViewSpecifier;
  if (appViewSpecifier)
  {
    v7 = appViewSpecifier;
  }
  else
  {
    v8 = self;
    objc_sync_enter(v8);
    BOOL v9 = [(PSUICellularDiagnosticsController *)v8 _appLockupViewNotAvailable];
    objc_sync_exit(v8);

    if (v9)
    {
      v7 = 0;
    }
    else
    {
      v10 = [(PSUICellularDiagnosticsController *)v8 getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[PSUICellularDiagnosticsController getAppViewSpecifier:]";
        _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s create new app view", buf, 0xCu);
      }

      *(void *)buf = 0;
      objc_initWeak((id *)buf, v8);
      v11 = [PSUIAppInstallLockupViewSpecifier alloc];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke;
      v16[3] = &unk_2645E0D70;
      objc_copyWeak(&v17, (id *)buf);
      v16[4] = v8;
      uint64_t v12 = [(PSUIAppInstallLockupViewSpecifier *)v11 initWithFailureHandler:v16 diagCode:v4 OpenAppURL:@"applesupport://getsupport.apple.com/?caller=settings.cellular" appId:@"1130498044" AnalyticsEventForApp:0x26D416940];
      p_appViewSpecifier = (id *)&self->_appViewSpecifier;
      id v14 = *p_appViewSpecifier;
      id *p_appViewSpecifier = (id)v12;

      v7 = (PSSpecifier *)*p_appViewSpecifier;
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }

  return v7;
}

void __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke_2;
  block[3] = &unk_2645E0D48;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __57__PSUICellularDiagnosticsController_getAppViewSpecifier___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [a1[4] domain];
    char v4 = [v3 isEqualToString:*MEMORY[0x263F08570]];

    if ((v4 & 1) == 0)
    {
      id v5 = WeakRetained;
      objc_sync_enter(v5);
      objc_super v6 = [a1[5] getLogger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "LockupView is not available", v7, 2u);
      }

      objc_msgSend(v5, "set_appLockupViewNotAvailable:", 1);
      objc_sync_exit(v5);

      [v5 reloadSpecifiers];
    }
  }
}

- (id)specifiers
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  char v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_26;
  }
  id v5 = (void *)MEMORY[0x263EFF980];
  v63.receiver = self;
  v63.super_class = (Class)PSUICellularDiagnosticsController;
  objc_super v6 = [(PSUICellularDiagnosticsController *)&v63 specifiers];
  id v7 = [v5 arrayWithArray:v6];

  id v8 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
  uint64_t v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_DIAGNOSTICS_RESULT_GROUP"];
  [v7 addObject:v9];
  v10 = (void *)MEMORY[0x263F5FC40];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_STATUS" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v13 = [v10 preferenceSpecifierNamed:v12 target:self set:0 get:sel_diagnosticsStatus detail:0 cell:4 edit:0];

  v61 = (void *)v13;
  v62 = (void *)v9;
  objc_msgSend(v7, "ps_addSpecifier:toGroup:", v13, v9);
  id v14 = +[PSUIDeviceWiFiState sharedInstance];
  int v15 = [v14 isConnectedOverWiFi];

  v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "getDiagnosticsDetailsCode"));
  [(PSUICellularDiagnosticsController *)self set_diagCode:v16];

  if (v15)
  {
    id v17 = [(PSUICellularDiagnosticsController *)self _diagCode];
    uint64_t v18 = [(PSUICellularDiagnosticsController *)self getAppViewSpecifier:v17];

    if (v18)
    {
      uint64_t v19 = NSString;
      v20 = [v8 getDiagnosticsStatusRecommendation];
      v21 = (void *)v18;
      uint64_t v22 = v3;
      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_RECOMMEND_RUN_DIAGNOSTICS" value:&stru_26D410CA0 table:@"Cellular"];
      uint64_t v25 = [v19 stringWithFormat:@"%@ %@", v20, v24];

      uint64_t v3 = v22;
      v26 = v21;
      v27 = (void *)v25;

      goto LABEL_11;
    }
    v27 = [v8 getDiagnosticsStatusRecommendation];
  }
  else
  {
    v28 = [MEMORY[0x263F82670] currentDevice];
    int v29 = objc_msgSend(v28, "sf_isChinaRegionCellularDevice");

    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = v30;
    if (v29) {
      v32 = @"CELLULAR_DIAGNOSTICS_RECOMMEND_NO_WLAN";
    }
    else {
      v32 = @"CELLULAR_DIAGNOSTICS_RECOMMEND_NO_WIFI";
    }
    v27 = [v30 localizedStringForKey:v32 value:&stru_26D410CA0 table:@"Cellular"];
  }
  v26 = 0;
LABEL_11:
  v33 = [(PSUICellularDiagnosticsController *)self getLogger];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = "No";
    v65 = "-[PSUICellularDiagnosticsController specifiers]";
    if (v15) {
      v35 = "Yes";
    }
    else {
      v35 = "No";
    }
    *(_DWORD *)buf = 136315650;
    v67 = v35;
    __int16 v66 = 2080;
    if (v26) {
      v34 = "Yes";
    }
    __int16 v68 = 2080;
    v69 = v34;
    _os_log_impl(&dword_221B17000, v33, OS_LOG_TYPE_DEFAULT, "%s Wifi: %s, AppView: %s", buf, 0x20u);
  }

  v60 = v27;
  if ([v8 needToShowHelpLink])
  {
    v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_LEARN_MORE" value:&stru_26D410CA0 table:@"Cellular"];

    v38 = [v27 stringByAppendingString:@" "];
    v39 = [v38 stringByAppendingString:v37];

    [v62 setProperty:v39 forKey:*MEMORY[0x263F600E8]];
    v72.location = [v39 rangeOfString:v37];
    v40 = NSStringFromRange(v72);
    [v62 setProperty:v40 forKey:*MEMORY[0x263F600D0]];

    v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    [v62 setProperty:v42 forKey:*MEMORY[0x263F600C0]];

    v43 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v62 setProperty:v43 forKey:*MEMORY[0x263F600E0]];

    [v62 setProperty:@"learnMoreLinkTapped" forKey:*MEMORY[0x263F600C8]];
    if (!v26) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  [v62 setProperty:v27 forKey:*MEMORY[0x263F600F8]];
  if (v26)
  {
LABEL_22:
    v44 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_DIAGNOSTICS_ACTION_GROUP"];
    [v7 addObject:v44];
    v45 = (void *)MEMORY[0x263F5FC40];
    [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v46 = v7;
    id v47 = v8;
    v49 = uint64_t v48 = v3;
    [v49 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_RUN" value:&stru_26D410CA0 table:@"Cellular"];
    v51 = v50 = v26;
    v52 = [v45 preferenceSpecifierNamed:v51 target:self set:0 get:0 detail:0 cell:4 edit:0];

    v26 = v50;
    uint64_t v3 = v48;
    id v8 = v47;
    id v7 = v46;
    objc_msgSend(v46, "ps_addSpecifier:toGroup:", v52, v44);
    v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v54 = [v53 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_APP_DESCRIPTION" value:&stru_26D410CA0 table:@"Cellular"];
    [v44 setProperty:v54 forKey:*MEMORY[0x263F600F8]];

    objc_msgSend(v7, "ps_addSpecifier:toGroup:", v50, v44);
  }
LABEL_23:
  if (v7)
  {
    v55 = (objc_class *)[v7 copy];
    v56 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v55;
  }
  v57 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v58 = [v57 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  [(PSUICellularDiagnosticsController *)self setTitle:v58];

  char v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_26:
  return v4;
}

- (void)learnMoreLinkTapped
{
  v18[2] = *MEMORY[0x263EF8340];
  v18[0] = @"OpenMoreLink";
  v17[0] = 0x26D416960;
  v17[1] = 0x26D416980;
  v2 = [(PSUICellularDiagnosticsController *)self _diagCode];
  v18[1] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  char v4 = @"com.apple.Preferences.TelephonyCellularDiagnostics";
  id v5 = v3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  objc_super v6 = (void (*)(__CFString *, id))_MergedGlobals_1;
  v16 = _MergedGlobals_1;
  if (!_MergedGlobals_1)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getAnalyticsSendEventSymbolLoc_block_invoke;
    v12[3] = &unk_2645E0D98;
    v12[4] = &v13;
    __getAnalyticsSendEventSymbolLoc_block_invoke((uint64_t)v12);
    objc_super v6 = (void (*)(__CFString *, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v6(v4, v5);

  id v7 = (void *)*MEMORY[0x263F83300];
  id v8 = NSURL;
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_LEARN_MORE_LINK" value:&stru_26D410CA0 table:@"Cellular"];
  v11 = [v8 URLWithString:v10];
  [v7 openURL:v11 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDiagnostics"];
}

- (BOOL)_appLockupViewNotAvailable
{
  return self->__appLockupViewNotAvailable;
}

- (void)set_appLockupViewNotAvailable:(BOOL)a3
{
  self->__appLockupViewNotAvailable = a3;
}

- (NSNumber)_diagCode
{
  return (NSNumber *)objc_getProperty(self, a2, 1400, 1);
}

- (void)set_diagCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__diagCode, 0);
  objc_storeStrong((id *)&self->_appViewSpecifier, 0);
}

@end