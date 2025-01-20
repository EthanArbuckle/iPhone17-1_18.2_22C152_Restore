@interface PSUICarrierSpaceServicesController
- (BOOL)shouldShowMoreApps;
- (NSArray)appsList;
- (PSUICarrierSpaceServicesController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)getLogger;
- (id)primaryAppSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)carrierSpaceChanged;
- (void)launchMyAccountInSafari:(id)a3;
- (void)launchMyAccountInWebView:(id)a3;
- (void)moreAppsTapped:(id)a3;
- (void)setAppsList:(id)a3;
- (void)simStatusChanged;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSUICarrierSpaceServicesController

- (void)simStatusChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpaceServicesController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[PSUICarrierSpaceServicesController simStatusChanged]";
    __int16 v10 = 2112;
    uint64_t v11 = 0x26D414D80;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v8, 0x16u);
  }

  v4 = [MEMORY[0x263F67EF0] sharedInstance];
  int v5 = [v4 isSIMMissing];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE88]));
    id v7 = (id)[WeakRetained popViewControllerAnimated:1];
  }
}

- (void)carrierSpaceChanged
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpaceServicesController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[PSUICarrierSpaceServicesController carrierSpaceChanged]";
    __int16 v6 = 2112;
    uint64_t v7 = 0x26D414D60;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@", (uint8_t *)&v4, 0x16u);
  }

  [(PSUICarrierSpaceServicesController *)self reloadSpecifiers];
}

- (PSUICarrierSpaceServicesController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceServicesController;
  int v4 = [(PSUICarrierSpaceServicesController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    int v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel_simStatusChanged name:0x26D414D80 object:0];

    __int16 v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel_carrierSpaceChanged name:0x26D414D60 object:0];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = [(PSUICarrierSpaceServicesController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PSUICarrierSpaceServicesController viewDidAppear:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceServicesController;
  [(PSUICarrierSpaceServicesController *)&v8 viewDidAppear:v3];
  __int16 v6 = @"com.apple.Preferences.CarrierSpaceServicesEvent";
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v7 = (void (*)(__CFString *, void))_MergedGlobals_1_5;
  uint64_t v12 = _MergedGlobals_1_5;
  if (!_MergedGlobals_1_5)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v14 = __getAnalyticsSendEventSymbolLoc_block_invoke_4;
    v15 = &unk_2645E0D98;
    v16 = &v9;
    __getAnalyticsSendEventSymbolLoc_block_invoke_4((uint64_t)&buf);
    uint64_t v7 = (void (*)(__CFString *, void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v7(v6, MEMORY[0x263EFFA78]);
}

- (id)specifiers
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  int v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    int v5 = [(PSUICarrierSpaceServicesController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      v47 = "-[PSUICarrierSpaceServicesController specifiers]";
      _os_log_debug_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEBUG, "%s: loading carrier services specifiers", buf, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CARRIER_APP_GROUP"];
    uint64_t v7 = NSString;
    objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"MORE_APPS_FROM_CARRIER_%@" value:&stru_26D410CA0 table:@"CarrierSpaceServices"];
    __int16 v10 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    uint64_t v11 = [v10 activeDataCarrierName];
    uint64_t v12 = objc_msgSend(v7, "stringWithFormat:", v9, v11);

    v44 = (void *)v12;
    v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v13 setButtonAction:sel_moreAppsTapped_];
    [v13 setIdentifier:@"MORE_APPS_FROM_CARRIER"];
    v43 = v13;
    v45 = (void *)v6;
    v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v6, v13, 0);
    v15 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:*MEMORY[0x263F60290]];
    v16 = +[PSUICarrierServicesSpecifierCache sharedInstance];
    uint64_t v17 = [v16 specifiers:v15];

    v18 = [(PSUICarrierSpaceServicesController *)self getLogger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v17 count];
      *(_DWORD *)long long buf = 136315394;
      v47 = "-[PSUICarrierSpaceServicesController specifiers]";
      __int16 v48 = 2048;
      uint64_t v49 = v19;
      _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "%s detected %lu service code specifiers", buf, 0x16u);
    }

    v20 = [v14 specifierForID:@"MORE_APPS_FROM_CARRIER"];
    objc_msgSend(v14, "ps_insertObjectsFromArray:afterObject:", v17, v20);

    v21 = [MEMORY[0x263F67EF0] sharedInstance];
    v22 = [v21 activeDataSubscriptionContext];

    uint64_t v23 = [v15 slotID];
    v42 = v22;
    if (v23 != [v22 slotID])
    {
      v31 = v17;
      v32 = [v14 specifierForID:@"CARRIER_APP_GROUP"];
      [v14 removeObject:v32];

      v25 = [v14 specifierForID:@"MORE_APPS_FROM_CARRIER"];
      [v14 removeObject:v25];
LABEL_21:

      v34 = NSString;
      v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v36 = [v35 localizedStringForKey:@"%@_CARRIER_SERVICES" value:&stru_26D410CA0 table:@"CarrierSpaceServices"];
      v37 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
      v38 = [v37 carrierName:v15];
      v39 = objc_msgSend(v34, "stringWithFormat:", v36, v38);
      [(PSUICarrierSpaceServicesController *)self setTitle:v39];

      [MEMORY[0x263F67F00] logSpecifiers:v14 origin:@"[PSUICarrierSpaceServicesController specifiers] end"];
      v40 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v14;

      int v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      goto LABEL_22;
    }
    v24 = [v14 specifierForID:@"MY_ACCOUNT"];
    v25 = v24;
    if (v24) {
      [v24 setHostController:self];
    }
    v26 = [(PSUICarrierSpaceServicesController *)self primaryAppSpecifier];
    v27 = [(PSUICarrierSpaceServicesController *)self getLogger];
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)long long buf = 136315138;
        v47 = "-[PSUICarrierSpaceServicesController specifiers]";
        _os_log_impl(&dword_221B17000, v27, OS_LOG_TYPE_DEFAULT, "%s carrier app provided: adding app install cell", buf, 0xCu);
      }

      v29 = [v14 specifierForID:@"CARRIER_APP_GROUP"];
      objc_msgSend(v14, "ps_insertObject:afterObject:", v26, v29);

      if ([(PSUICarrierSpaceServicesController *)self shouldShowMoreApps]) {
        goto LABEL_20;
      }
      v30 = [(PSUICarrierSpaceServicesController *)self getLogger];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v47 = "-[PSUICarrierSpaceServicesController specifiers]";
        _os_log_impl(&dword_221B17000, v30, OS_LOG_TYPE_DEFAULT, "%s carrier more apps URL not provided: hiding More Apps button", buf, 0xCu);
      }
    }
    else
    {
      if (v28)
      {
        *(_DWORD *)long long buf = 136315138;
        v47 = "-[PSUICarrierSpaceServicesController specifiers]";
        _os_log_impl(&dword_221B17000, v27, OS_LOG_TYPE_DEFAULT, "%s carrier app not provided: hiding app install cell and More Apps button", buf, 0xCu);
      }

      v30 = [v14 specifierForID:@"CARRIER_APP_GROUP"];
      [v14 removeObject:v30];
    }

    v33 = [v14 specifierForID:@"MORE_APPS_FROM_CARRIER"];
    [v14 removeObject:v33];

LABEL_20:
    v31 = v17;

    goto LABEL_21;
  }
LABEL_22:
  return v4;
}

- (id)primaryAppSpecifier
{
  uint64_t v3 = +[PSUICarrierSpaceManager sharedManager];
  int v4 = [v3 carrierAppInstallController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke;
  v7[3] = &unk_2645E1188;
  v7[4] = self;
  int v5 = [v4 specifierWithDescriptionParameters:0 completion:v7];

  return v5;
}

void __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke_2;
  v2[3] = &unk_2645E17D8;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __57__PSUICarrierSpaceServicesController_primaryAppSpecifier__block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) reloadSpecifiers];
  }
  return result;
}

- (void)launchMyAccountInWebView:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a3 propertyForKey:@"MY_ACCOUNT_URL"];
  int v5 = [(PSUICarrierSpaceServicesController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Launch my account in web view pressed: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v6 = [[PSUICarrierSpaceMyAccountWebViewController alloc] initWithURLString:v4];
  myAccountWebViewController = self->_myAccountWebViewController;
  self->_myAccountWebViewController = v6;

  objc_super v8 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_myAccountWebViewController];
  navCon = self->_navCon;
  self->_navCon = v8;

  [(PSUICarrierSpaceServicesController *)self presentViewController:self->_navCon animated:1 completion:0];
}

- (void)launchMyAccountInSafari:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = NSURL;
  int v5 = [a3 propertyForKey:@"MY_ACCOUNT_URL"];
  uint64_t v6 = [v4 URLWithString:v5];

  uint64_t v7 = [(PSUICarrierSpaceServicesController *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Launch my account in safari pressed: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_super v8 = (void *)*MEMORY[0x263F83300];
  uint64_t v9 = objc_opt_new();
  [v8 openURL:v6 options:v9 completionHandler:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PSUICarrierSpaceServicesController;
  int v4 = [(PSUICarrierSpaceServicesController *)&v9 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = +[PSUICarrierSpaceManager sharedManager];
    id v6 = v4;
    uint64_t v7 = [v5 carrierAppInstallController];
    objc_msgSend(v6, "setInstallState:", objc_msgSend(v7, "installState"));
  }
  else if ([v4 tag])
  {
    [v4 setSelectionStyle:1];
  }
  return v4;
}

- (BOOL)shouldShowMoreApps
{
  v2 = +[PSUICarrierSpaceManager sharedManager];
  char v3 = [v2 carrierAppInstallController];
  char v4 = [v3 moreAppsAvailable];

  return v4;
}

- (void)moreAppsTapped:(id)a3
{
  id v3 = a3;
  id v5 = +[PSUICarrierSpaceManager sharedManager];
  char v4 = [v5 carrierAppInstallController];
  [v4 moreAppsButtonTapped:v3];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierSpaceServicesController"];
}

- (NSArray)appsList
{
  return self->_appsList;
}

- (void)setAppsList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsList, 0);
  objc_storeStrong((id *)&self->_myAccountWebViewController, 0);
  objc_storeStrong((id *)&self->_navCon, 0);
}

@end