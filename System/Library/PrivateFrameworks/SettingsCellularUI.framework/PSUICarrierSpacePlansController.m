@interface PSUICarrierSpacePlansController
- (CTCarrierSpaceClient)carrierSpaceClient;
- (PSUICarrierSpacePlansController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)detailForPlanOption:(id)a3;
- (id)getLogger;
- (id)specifiers;
- (id)stringFromGroupCategory:(int64_t)a3;
- (void)carrierSpaceChanged;
- (void)dismissPlanDetail;
- (void)moreDetailsButtonTapped:(id)a3;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)setCarrierSpaceClient:(id)a3;
- (void)simStatusChanged;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSUICarrierSpacePlansController

- (void)simStatusChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpacePlansController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[PSUICarrierSpacePlansController simStatusChanged]";
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
  v3 = [(PSUICarrierSpacePlansController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[PSUICarrierSpacePlansController carrierSpaceChanged]";
    __int16 v6 = 2112;
    uint64_t v7 = 0x26D414D60;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@", (uint8_t *)&v4, 0x16u);
  }

  [(PSUICarrierSpacePlansController *)self reloadSpecifiers];
}

- (PSUICarrierSpacePlansController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSUICarrierSpacePlansController;
  uint64_t v8 = [(PSUICarrierSpacePlansController *)&v18 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.preferences.carrier_space_plans_queue", 0);
    carrierSpaceQueue = v8->_carrierSpaceQueue;
    v8->_carrierSpaceQueue = (OS_dispatch_queue *)v9;

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v11 = (void *)_MergedGlobals_1_4;
    uint64_t v23 = _MergedGlobals_1_4;
    if (!_MergedGlobals_1_4)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __getCTCarrierSpaceClientClass_block_invoke_0;
      v19[3] = &unk_2645E0D98;
      v19[4] = &v20;
      __getCTCarrierSpaceClientClass_block_invoke_0((uint64_t)v19);
      uint64_t v11 = (void *)v21[3];
    }
    uint64_t v12 = v11;
    _Block_object_dispose(&v20, 8);
    uint64_t v13 = [[v12 alloc] initWithQueue:v8->_carrierSpaceQueue];
    carrierSpaceClient = v8->_carrierSpaceClient;
    v8->_carrierSpaceClient = (CTCarrierSpaceClient *)v13;

    [(CTCarrierSpaceClient *)v8->_carrierSpaceClient setDelegate:v8];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v8 selector:sel_simStatusChanged name:0x26D414D80 object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v8 selector:sel_carrierSpaceChanged name:0x26D414D60 object:0];
  }
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = [(PSUICarrierSpacePlansController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PSUICarrierSpacePlansController viewDidAppear:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpacePlansController;
  [(PSUICarrierSpacePlansController *)&v8 viewDidAppear:v3];
  id v6 = @"com.apple.Preferences.CarrierSpacePlansEvent";
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v7 = (void (*)(__CFString *, void))off_26AC323C0;
  uint64_t v12 = off_26AC323C0;
  if (!off_26AC323C0)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v14 = __getAnalyticsSendEventSymbolLoc_block_invoke_3;
    v15 = &unk_2645E0D98;
    v16 = &v9;
    __getAnalyticsSendEventSymbolLoc_block_invoke_3((uint64_t)&buf);
    id v7 = (void (*)(__CFString *, void))v10[3];
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
  uint64_t v65 = *MEMORY[0x263EF8340];
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v45 = (int)*MEMORY[0x263F5FDB8];
    int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v5 = [v4 localizedStringForKey:@"PLANS" value:&stru_26D410CA0 table:@"CarrierSpacePlans"];
    [(PSUICarrierSpacePlansController *)self setTitle:v5];

    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    +[PSUICarrierSpaceManager sharedManager];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v44 = long long v60 = 0u;
    id v7 = [v44 plansInfo];
    objc_super v8 = [v7 planGroupsList];

    id obj = v8;
    uint64_t v48 = [v8 countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v58;
      uint64_t v52 = *MEMORY[0x263F5FFE0];
      uint64_t v51 = *MEMORY[0x263F5FEE8];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v58 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v9;
          __int16 v10 = *(void **)(*((void *)&v57 + 1) + 8 * v9);
          uint64_t v11 = (void *)MEMORY[0x263F5FC40];
          uint64_t v12 = -[PSUICarrierSpacePlansController stringFromGroupCategory:](self, "stringFromGroupCategory:", [v10 planCategory]);
          uint64_t v13 = [v11 groupSpecifierWithName:v12];
          [v6 addObject:v13];

          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v50 = [v10 groupOptionsList];
          uint64_t v14 = [v50 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v54;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                objc_super v18 = v6;
                if (*(void *)v54 != v16) {
                  objc_enumerationMutation(v50);
                }
                v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                uint64_t v20 = (void *)MEMORY[0x263F5FC40];
                v21 = [v19 planLabel];
                uint64_t v22 = [v20 preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:4 edit:0];

                [v22 setProperty:objc_opt_class() forKey:v52];
                uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "planPurchasable"));
                [v22 setProperty:v23 forKey:0x26D4135C0];

                v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "planStatus") == 1);
                [v22 setProperty:v24 forKey:0x26D4135E0];

                v25 = [v19 planLabel];
                [v22 setProperty:v25 forKey:0x26D413600];

                v26 = [(PSUICarrierSpacePlansController *)self detailForPlanOption:v19];
                [v22 setProperty:v26 forKey:0x26D413620];

                v27 = [v19 planId];
                [v22 setIdentifier:v27];

                v28 = [v19 planDetailsURL];
                uint64_t v29 = [v28 length];

                if (v29) {
                  [v22 setProperty:&unk_26D425F18 forKey:v51];
                }
                else {
                  [v22 removePropertyForKey:v51];
                }
                [v22 setProperty:v19 forKey:@"PSUICarrierSpacePlanKey"];
                id v6 = v18;
                [v18 addObject:v22];
                v30 = [(PSUICarrierSpacePlansController *)self getLogger];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138412290;
                  v62 = v19;
                  _os_log_impl(&dword_221B17000, v30, OS_LOG_TYPE_DEFAULT, "Creating specifier for plan: %@", buf, 0xCu);
                }
              }
              uint64_t v15 = [v50 countByEnumeratingWithState:&v53 objects:v63 count:16];
            }
            while (v15);
          }

          uint64_t v9 = v49 + 1;
        }
        while (v49 + 1 != v48);
        uint64_t v48 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v48);
    }

    v31 = [v44 plansInfo];
    v32 = [v31 morePlansURL];
    uint64_t v33 = [v32 length];

    if (v33)
    {
      v34 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
      v35 = [v34 activeDataCarrierName];

      v36 = NSString;
      v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:@"MORE_PLANS_FROM_CARRRIER%@" value:&stru_26D410CA0 table:@"CarrierSpacePlans"];
      v39 = objc_msgSend(v36, "stringWithFormat:", v38, v35);

      v40 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v6 addObject:v40];
      v41 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v39 target:self set:0 get:0 detail:0 cell:13 edit:0];
      [v41 setButtonAction:sel_moreDetailsButtonTapped_];
      [v6 addObject:v41];
    }
    [MEMORY[0x263F67F00] logSpecifiers:v6 origin:@"[PSUICarrierSpacePlansController specifiers] end"];
    v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v45);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v45) = (Class)v6;

    BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v45);
  }
  return v3;
}

- (void)moreDetailsButtonTapped:(id)a3
{
  int v4 = +[PSUICarrierSpaceManager sharedManager];
  int v5 = [v4 plansInfo];
  id v6 = [v5 morePlansURL];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    objc_super v8 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v9 = NSURL;
    __int16 v10 = [v4 plansInfo];
    uint64_t v11 = [v10 morePlansURL];
    uint64_t v12 = [v9 URLWithString:v11];
    [v8 openURL:v12 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
  else
  {
    objc_super v8 = [(PSUICarrierSpacePlansController *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "More plans button tapped, but no plans url present.", v13, 2u);
    }
  }
}

- (id)detailForPlanOption:(id)a3
{
  id v3 = a3;
  int v4 = [v3 planValue];
  if ([v3 planStatus] == 1)
  {
    if (v4 && [(__CFString *)v4 length])
    {
      int v5 = NSString;
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = v6;
      objc_super v8 = @"PLAN%@_CURRENT_SUBSCRIPTION";
LABEL_9:
      uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"CarrierSpacePlans"];
      objc_msgSend(v5, "stringWithFormat:", v9, v4);
LABEL_17:
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    __int16 v10 = NSString;
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = v11;
    uint64_t v12 = @"CURRENT_SUBSCRIPTION";
    goto LABEL_16;
  }
  if ([v3 planStatus] == 2)
  {
    if (v4 && [(__CFString *)v4 length])
    {
      int v5 = NSString;
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = v6;
      objc_super v8 = @"PLAN%@_IN_PROGRESS";
      goto LABEL_9;
    }
    __int16 v10 = NSString;
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = v11;
    uint64_t v12 = @"IN_PROGRESS";
LABEL_16:
    uint64_t v9 = [v11 localizedStringForKey:v12 value:&stru_26D410CA0 table:@"CarrierSpacePlans"];
    objc_msgSend(v10, "stringWithFormat:", v9, v16);
    goto LABEL_17;
  }
  uint64_t v13 = &stru_26D410CA0;
  if (v4 && [(__CFString *)v4 length]) {
    uint64_t v13 = v4;
  }
  uint64_t v14 = v13;
LABEL_18:

  return v14;
}

- (id)stringFromGroupCategory:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v9;
      __int16 v10 = @"INTERNATIONAL_ROAMING_PLANS";
LABEL_7:
      objc_super v8 = [v9 localizedStringForKey:v10 value:&stru_26D410CA0 table:@"CarrierSpacePlans"];
      goto LABEL_8;
    case 2:
      uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v4 = v9;
      __int16 v10 = @"ROAMING_PLANS";
      goto LABEL_7;
    case 1:
      id v3 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
      int v4 = [v3 activeDataCarrierName];

      int v5 = NSString;
      id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = [v6 localizedStringForKey:@"DOMESTIC_PLANS_FROM_%@CARRIER" value:&stru_26D410CA0 table:@"CarrierSpacePlans"];
      objc_msgSend(v5, "stringWithFormat:", v7, v4);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_10;
  }
  objc_super v8 = &stru_26D410CA0;
LABEL_10:
  return v8;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(PSUICarrierSpacePlansController *)self specifierAtIndex:[(PSUICarrierSpacePlansController *)self indexForIndexPath:v7]];
  uint64_t v9 = [v8 propertyForKey:@"PSUICarrierSpacePlanKey"];
  __int16 v10 = [v9 planDetailsURL];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = NSURL;
    uint64_t v13 = [v9 planDetailsURL];
    uint64_t v14 = [v12 URLWithString:v13];

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    uint64_t v15 = (void *)qword_26AC323D0;
    uint64_t v30 = qword_26AC323D0;
    if (!qword_26AC323D0)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v32 = __getRemoteUIControllerClass_block_invoke_0;
      uint64_t v33 = &unk_2645E0D98;
      v34 = &v27;
      __getRemoteUIControllerClass_block_invoke_0((uint64_t)&buf);
      uint64_t v15 = (void *)v28[3];
    }
    uint64_t v16 = v15;
    _Block_object_dispose(&v27, 8);
    uint64_t v17 = (RemoteUIController *)objc_alloc_init(v16);
    remoteUIController = self->_remoteUIController;
    self->_remoteUIController = v17;

    [(RemoteUIController *)self->_remoteUIController setDelegate:self];
    [(RemoteUIController *)self->_remoteUIController setHostViewController:self];
    v19 = self->_remoteUIController;
    uint64_t v20 = +[PSUICarrierSpaceManager getNSURLSessionConfiguration];
    [(RemoteUIController *)v19 setSessionConfiguration:v20];

    v21 = [MEMORY[0x263F82670] currentDevice];
    LODWORD(v19) = objc_msgSend(v21, "sf_isInternalInstall");

    if (v19)
    {
      uint64_t v22 = [(RemoteUIController *)self->_remoteUIController loader];
      [v22 setAllowNonSecureHTTP:1];
    }
    uint64_t v23 = self->_remoteUIController;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__PSUICarrierSpacePlansController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke;
    v25[3] = &unk_2645E1128;
    v25[4] = self;
    id v26 = v14;
    v24 = v14;
    [(RemoteUIController *)v23 loadURL:v24 postBody:0 completion:v25];
  }
  else
  {
    v24 = [(PSUICarrierSpacePlansController *)self getLogger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_221B17000, v24, OS_LOG_TYPE_DEFAULT, "No plan detail url for plan: %@", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __86__PSUICarrierSpacePlansController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      objc_super v8 = [NSNumber numberWithBool:a2];
      int v9 = 138412802;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Could not load plan detail url: %@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PSUICarrierSpacePlansController;
  id v6 = a4;
  [(PSUICarrierSpacePlansController *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(PSUICarrierSpacePlansController *)self indexForIndexPath:v6];

  objc_super v8 = [(PSUICarrierSpacePlansController *)self specifierAtIndex:v7];
  int v9 = [v8 propertyForKey:@"PSUICarrierSpacePlanKey"];
  if ([v9 planPurchasable])
  {
    uint64_t v10 = [v8 identifier];
    [(PSUICarrierSpacePlansController *)self highlightSpecifierWithID:v10];

    carrierSpaceClient = self->_carrierSpaceClient;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke;
    v12[3] = &unk_2645E0C20;
    v12[4] = self;
    [(CTCarrierSpaceClient *)carrierSpaceClient purchasePlan:v9 completion:v12];
  }
}

void __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) getLogger];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v3;
      id v6 = "Plan purchase finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else if (v5)
  {
    *(_WORD *)long long buf = 0;
    id v6 = "Plan purchase finished";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke_64;
  block[3] = &unk_2645E0B88;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)dismissPlanDetail
{
  id v2 = [(PSUICarrierSpacePlansController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x263F824A8];
  id v6 = a4;
  id v9 = (id)[[v5 alloc] initWithBarButtonSystemItem:0 target:self action:sel_dismissPlanDetail];
  uint64_t v7 = [v6 topViewController];

  uint32_t v8 = [v7 navigationItem];
  [v8 setRightBarButtonItem:v9 animated:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierSpacePlansController"];
}

- (CTCarrierSpaceClient)carrierSpaceClient
{
  return self->_carrierSpaceClient;
}

- (void)setCarrierSpaceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_carrierSpaceQueue, 0);
}

@end