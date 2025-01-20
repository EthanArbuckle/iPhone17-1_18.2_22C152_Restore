@interface NDOSpecifierDataSource
- (BOOL)isDefaultDevice;
- (NDOACController)hostingController;
- (NDOManager)ndoManager;
- (NDOSpecifierDataSource)initWithDefaultDevice:(BOOL)a3;
- (NSMutableArray)ndoSpecifiers;
- (NSString)serialNumber;
- (PSSpecifier)warrantyGroupSpecifier;
- (id)acController;
- (id)deviceDescriptionSpecifierWithDeviceInfo:(id)a3;
- (id)warrantyDetailText:(id)a3;
- (id)warrantySpecifiersFromDeviceInfo:(id)a3;
- (void)_updateSpecifiers:(id)a3 specifierToInsertAfter:(id)a4 withUpdates:(id)a5;
- (void)ndoAppleCareCoveragePressed:(id)a3;
- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4;
- (void)setHostingController:(id)a3;
- (void)setIsDefaultDevice:(BOOL)a3;
- (void)setNdoManager:(id)a3;
- (void)setNdoSpecifiers:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setWarrantyGroupSpecifier:(id)a3;
- (void)specifiersWithPolicy:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateNDOSpecifiersWithPolicy:(unint64_t)a3 completion:(id)a4;
@end

@implementation NDOSpecifierDataSource

- (NDOSpecifierDataSource)initWithDefaultDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)NDOSpecifierDataSource;
  v4 = [(PSSpecifierDataSource *)&v14 init];
  if (v4)
  {
    v5 = objc_opt_new();
    [(NDOSpecifierDataSource *)v4 setNdoManager:v5];

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.newdeviceoutreach.policyqueue", v6);
    policyLookupQueue = v4->_policyLookupQueue;
    v4->_policyLookupQueue = (OS_dispatch_queue *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    group = v4->_group;
    v4->_group = (OS_dispatch_group *)v9;

    v11 = objc_opt_new();
    [(NDOSpecifierDataSource *)v4 setNdoSpecifiers:v11];

    v12 = _NDOLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[NDOSpecifierDataSource initWithDefaultDevice:]";
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_238845000, v12, OS_LOG_TYPE_DEFAULT, "%s: initWithDefaultDevice: %d", buf, 0x12u);
    }
  }
  return v4;
}

- (void)specifiersWithPolicy:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_queue_t v7 = objc_opt_new();
  v8 = objc_msgSend(v7, "aida_accountForPrimaryiCloudAccount");
  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    id v26 = 0;
    dispatch_group_enter((dispatch_group_t)self->_group);
    dispatch_group_t v9 = [(NDOSpecifierDataSource *)self serialNumber];

    [(NDOSpecifierDataSource *)self ndoManager];
    if (v9) {
      v10 = {;
    }
      v11 = [(NDOSpecifierDataSource *)self serialNumber];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke;
      v21[3] = &unk_264D49BF0;
      v21[4] = self;
      v21[5] = &buf;
      [v10 getDeviceInfoForSerialNumber:v11 usingPolicy:a3 withReply:v21];
    }
    else {
      v10 = {;
    }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_2;
      v20[3] = &unk_264D49BF0;
      v20[4] = self;
      v20[5] = &buf;
      [v10 getDefaultDeviceInfoUsingPolicy:a3 withReply:v20];
    }

    objc_initWeak(&location, self);
    group = self->_group;
    policyLookupQueue = self->_policyLookupQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_3;
    v15[3] = &unk_264D49C18;
    p_long long buf = &buf;
    v15[4] = self;
    id v16 = v6;
    v18[1] = (id)a3;
    objc_copyWeak(v18, &location);
    dispatch_group_notify(group, policyLookupQueue, v15);
    objc_destroyWeak(v18);

    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v12 = _NDOLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]";
      _os_log_impl(&dword_238845000, v12, OS_LOG_TYPE_DEFAULT, "%s: Skipping info fetch: not logged in.", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
}

void __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
}

void __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v10 = 136315394;
    v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke_3";
    __int16 v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_238845000, v2, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    WeakRetained = objc_msgSend(*(id *)(a1 + 32), "warrantySpecifiersFromDeviceInfo:");
    v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke";
      __int16 v12 = 2112;
      v13 = WeakRetained;
      _os_log_impl(&dword_238845000, v5, OS_LOG_TYPE_DEFAULT, "%s: specifiers: %@", (uint8_t *)&v10, 0x16u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  dispatch_queue_t v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    int v10 = 136315394;
    v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to load coverage. Policy:%@", (uint8_t *)&v10, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 64) != 2)
    {
      id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
      v6();
      goto LABEL_8;
    }
    dispatch_group_t v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke";
      _os_log_impl(&dword_238845000, v9, OS_LOG_TYPE_DEFAULT, "%s: Trying cache fallback", (uint8_t *)&v10, 0xCu);
    }

    [WeakRetained specifiersWithPolicy:1 completionHandler:*(void *)(a1 + 40)];
  }
LABEL_8:
}

- (id)acController
{
  v2 = [(PSSpecifierDataSource *)self observersOfClass:objc_opt_class()];
  BOOL v3 = [v2 anyObject];

  return v3;
}

- (id)deviceDescriptionSpecifierWithDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 warranty];
  id v6 = v5;
  if (v5)
  {
    dispatch_queue_t v7 = (void *)MEMORY[0x263F5FC40];
    v8 = [v5 coverageLocalizedLabel];
    dispatch_group_t v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:sel_warrantyDetailText_ detail:objc_opt_class() cell:2 edit:0];

    [v9 setProperty:NSClassFromString(&cfstr_Psmultilinetab.isa) forKey:*MEMORY[0x263F5FFE0]];
    [v9 setProperty:@"WARRANTY_DESCRIPTION" forKey:*MEMORY[0x263F60138]];
    int v10 = [(NDOSpecifierDataSource *)self hostingController];
    [v9 setProperty:v10 forKey:@"NDOHostingController"];

    if ([v6 covered] && !objc_msgSend(v6, "isACServicesPartner"))
    {
      __int16 v12 = [v6 coverageEndDate];

      if (v12)
      {
        v13 = objc_opt_new();
        [v13 setTimeStyle:0];
        [v13 setDateStyle:1];
        uint64_t v14 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
        [v13 setTimeZone:v14];

        v15 = [v6 coverageEndDate];
        id v16 = [v13 stringFromDate:v15];

        __int16 v17 = [v6 localizedCoveredDeviceDateLabelFormat];

        if (v17)
        {
          BOOL v18 = NSString;
          uint64_t v19 = [v6 localizedCoveredDeviceDateLabelFormat];
          v20 = objc_msgSend(v18, "stringWithFormat:", v19, v16);
          [v9 setProperty:v20 forKey:*MEMORY[0x263F60308]];
        }
      }
    }
    else
    {
      [v9 setProperty:&stru_26EB85580 forKey:*MEMORY[0x263F60308]];
    }
    [v9 setProperty:v6 forKey:@"NDOWarranty"];
    [v9 setProperty:v4 forKey:@"NDODeviceInfo"];
  }
  else
  {
    dispatch_group_t v9 = 0;
  }

  return v9;
}

- (id)warrantySpecifiersFromDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 warranty];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  id v6 = objc_opt_new();
  dispatch_queue_t v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"WARRANTY_GROUP"];
  [(NDOSpecifierDataSource *)self setWarrantyGroupSpecifier:v7];

  v8 = [(NDOSpecifierDataSource *)self warrantyGroupSpecifier];
  [v6 addObject:v8];

  dispatch_group_t v9 = [(NDOSpecifierDataSource *)self deviceDescriptionSpecifierWithDeviceInfo:v4];
  [v6 addObject:v9];
  int v10 = [v4 warranty];
  v11 = [v10 acOfferDisplayDate];

  __int16 v12 = [v4 warranty];
  int v13 = [v12 acOfferEligible];
  if (v11)
  {
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = [v4 warranty];
    v15 = [v14 acOfferDisplayDate];
    [v15 timeIntervalSinceNow];
    if (v16 > 0.0)
    {
LABEL_12:

      goto LABEL_13;
    }
    __int16 v17 = [v4 warranty];
    BOOL v18 = [v17 acOfferEligibleUntil];
    [v18 timeIntervalSinceNow];
    double v20 = v19;
  }
  else
  {
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = [v4 warranty];
    v15 = [v14 acOfferEligibleUntil];
    [v15 timeIntervalSinceNow];
    double v20 = v21;
  }

  if (v20 > 0.0)
  {
    v22 = (void *)MEMORY[0x263F5FC40];
    uint64_t v23 = [v4 warranty];
    v24 = [v23 acLocalizedOfferCTA];
    __int16 v12 = [v22 preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v12 setProperty:@"WARRANTY_OFFER" forKey:*MEMORY[0x263F60138]];
    [v12 setButtonAction:sel_ndoAppleCareCoveragePressed_];
    [v12 setProperty:v4 forKey:@"NDODeviceInfo"];
    [v12 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [v6 addObject:v12];
    v25 = [v4 warranty];
    id v26 = [v25 acLocalizedOfferDesc];
    uint64_t v27 = [v26 length];

    if (v27)
    {
      uint64_t v14 = [v4 warranty];
      v15 = [v14 acLocalizedOfferDesc];
      v28 = [(NDOSpecifierDataSource *)self warrantyGroupSpecifier];
      [v28 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600F8]];

      goto LABEL_12;
    }
LABEL_13:
  }
LABEL_15:

  return v6;
}

- (void)ndoAppleCareCoveragePressed:(id)a3
{
  id v19 = [a3 propertyForKey:@"NDODeviceInfo"];
  id v4 = [NDOAppleCareViewController alloc];
  v5 = [v19 device];
  id v6 = [v5 sourceFromDeviceType];
  dispatch_queue_t v7 = [v6 stringByAppendingString:@"_ABOUT"];
  v8 = [(NDOAppleCareViewController *)v4 initWithDeviceInfo:v19 presentationType:0 source:v7 deeplinkParams:0];

  [(NDOAppleCareViewController *)v8 setPresentor:self];
  dispatch_group_t v9 = [MEMORY[0x263F82670] currentDevice];
  if ([v9 userInterfaceIdiom] == 1)
  {

    uint64_t v10 = 2;
  }
  else
  {
    v11 = [MEMORY[0x263F82670] currentDevice];
    BOOL v12 = [v11 userInterfaceIdiom] == 6;

    uint64_t v10 = 2 * v12;
  }
  [(NDOAppleCareViewController *)v8 setModalPresentationStyle:v10];
  [(NDOAppleCareViewController *)v8 setModalInPresentation:1];
  int v13 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  uint64_t v14 = [MEMORY[0x263F82670] currentDevice];
  if ([v14 userInterfaceIdiom] == 1)
  {
  }
  else
  {
    v15 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 != 6) {
      goto LABEL_8;
    }
  }
  [v13 setModalPresentationStyle:2];
LABEL_8:
  [v13 setModalInPresentation:1];
  __int16 v17 = [(NDOSpecifierDataSource *)self hostingController];
  BOOL v18 = [v17 parentViewController];
  [v18 presentViewController:v13 animated:1 completion:0];
}

- (id)warrantyDetailText:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x263F60308]];
}

- (void)updateNDOSpecifiersWithPolicy:(unint64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_queue_t v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)long long buf = 136315394;
    uint64_t v14 = "-[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:]";
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%s: updateNDOSpecifiersWithPolicy: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke;
  v10[3] = &unk_264D49C90;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = (id)a3;
  id v9 = v6;
  id v11 = v9;
  [(NDOSpecifierDataSource *)self specifiersWithPolicy:a3 completionHandler:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

void __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_2;
  v6[3] = &unk_264D49C68;
  objc_copyWeak(v9, (id *)(a1 + 40));
  id v4 = *(void **)(a1 + 48);
  id v7 = v3;
  v9[1] = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(v9);
}

void __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) count];
  id v4 = [WeakRetained ndoSpecifiers];
  uint64_t v5 = [v4 count];

  id v6 = [WeakRetained hostingController];
  id v7 = [v6 parentViewController];
  id v8 = [v7 specifierDataSource];

  id v9 = [WeakRetained hostingController];
  uint64_t v10 = [v9 specifierIDToInsertAfter];

  if (v8)
  {
    uint64_t v11 = [v8 specifierForID:v10];
    if (v11)
    {
      BOOL v12 = (void *)v11;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_3;
      v28[3] = &unk_264D49C40;
      v28[4] = WeakRetained;
      id v29 = *(id *)(a1 + 32);
      id v30 = v12;
      uint64_t v32 = *(void *)(a1 + 56);
      id v31 = *(id *)(a1 + 40);
      id v13 = v12;
      [v8 performUpdatesAnimated:v3 != v5 usingBlock:v28];

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  uint64_t v14 = [WeakRetained hostingController];
  __int16 v15 = [v14 parentViewController];
  uint64_t v16 = [v15 specifierForID:v10];

  if (!v16)
  {
LABEL_10:
    uint64_t v27 = *(void *)(a1 + 40);
    if (v27) {
      (*(void (**)(void))(v27 + 16))();
    }
    goto LABEL_12;
  }
  uint64_t v17 = (void *)MEMORY[0x263F5FC50];
  BOOL v18 = [WeakRetained hostingController];
  id v19 = [v18 parentViewController];
  double v20 = [v19 specifiers];
  double v21 = [v17 updatesWithSpecifiers:v20];

  [WeakRetained _updateSpecifiers:*(void *)(a1 + 32) specifierToInsertAfter:v16 withUpdates:v21];
  v22 = [WeakRetained hostingController];
  uint64_t v23 = [v22 parentViewController];
  [v23 performSpecifierUpdates:v21];

  v24 = _NDOLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    *(_DWORD *)long long buf = 136315394;
    v34 = "-[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:]_block_invoke";
    __int16 v35 = 2112;
    v36 = v25;
    _os_log_impl(&dword_238845000, v24, OS_LOG_TYPE_DEFAULT, "%s: DONE updateNDOSpecifiersWithPolicy: %@ with no datasource", buf, 0x16u);
  }
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    (*(void (**)(void))(v26 + 16))();
  }

LABEL_12:
}

uint64_t __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _updateSpecifiers:*(void *)(a1 + 40) specifierToInsertAfter:*(void *)(a1 + 48) withUpdates:a2];
  uint64_t v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    int v6 = 136315394;
    id v7 = "-[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:]_block_invoke_3";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_238845000, v3, OS_LOG_TYPE_DEFAULT, "%s: DONE updateNDOSpecifiersWithPolicy: %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateSpecifiers:(id)a3 specifierToInsertAfter:(id)a4 withUpdates:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  uint64_t v10 = (void *)[v11 mutableCopy];
  [(NDOSpecifierDataSource *)self setNdoSpecifiers:v10];

  [v8 removeSpecifierWithID:@"WARRANTY_GROUP"];
  [v8 removeSpecifierWithID:@"WARRANTY_DESCRIPTION"];
  [v8 removeSpecifierWithID:@"WARRANTY_OFFER"];
  [v8 insertContiguousSpecifiers:v11 afterSpecifier:v9];
}

- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  id v12[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke;
  v12[3] = &unk_264D498D8;
  v12[4] = self;
  v12[5] = a4;
  id v7 = (void (**)(void))MEMORY[0x23EC93640](v12);
  if (!a4) {
    goto LABEL_10;
  }
  id v8 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_87;
  v10[3] = &unk_264D49538;
  id v11 = v6;
  [v8 dismissFollowUpForSerialNumber:v11 completion:v10];
  if (a4 == 5 || a4 == 3)
  {
    uint64_t v9 = 2;
  }
  else
  {
    if (a4 == 2)
    {
      [(NDOSpecifierDataSource *)self updateNDOSpecifiersWithPolicy:2 completion:v7];

      goto LABEL_11;
    }
    uint64_t v9 = 0;
  }
  [(NDOSpecifierDataSource *)self updateNDOSpecifiersWithPolicy:v9 completion:&__block_literal_global_97];

  if (a4 != 3 && a4 != 5) {
LABEL_10:
  }
    v7[2](v7);
LABEL_11:
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2;
  block[3] = &unk_264D498B0;
  objc_copyWeak(v3, &location);
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v3);
  objc_destroyWeak(&location);
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (*(void *)(a1 + 40) == 2)
  {
    id v4 = [WeakRetained ndoSpecifiers];
    uint64_t v5 = [v4 specifierForID:@"WARRANTY_DESCRIPTION"];

    id v6 = [[NDOWarrantyInfoController alloc] initWithSpecifier:v5];
    id v7 = [v3 hostingController];
    id v8 = [v7 parentViewController];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_3;
    v13[3] = &unk_264D49690;
    id v14 = v8;
    __int16 v15 = v6;
    uint64_t v9 = v6;
    id v10 = v8;
    [v10 dismissViewControllerAnimated:1 completion:v13];
  }
  else
  {
    id v11 = [WeakRetained hostingController];
    BOOL v12 = [v11 parentViewController];
    [v12 dismissViewControllerAnimated:1 completion:0];
  }
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:0];

  uint64_t v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = "-[NDOSpecifierDataSource outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke_3";
    _os_log_impl(&dword_238845000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: New Device info refreshed after purchase done", (uint8_t *)&v4, 0xCu);
  }
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_87(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"Failed to dismiss";
    id v8 = "-[NDOSpecifierDataSource outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136446722;
    if (a2) {
      uint64_t v5 = @"Dismissed";
    }
    __int16 v9 = 2114;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@ followup up for %@", (uint8_t *)&v7, 0x20u);
  }
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_95()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _NDOLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    v2 = "-[NDOSpecifierDataSource outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    _os_log_impl(&dword_238845000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: Device info refreshed only.", (uint8_t *)&v1, 0xCu);
  }
}

- (NDOManager)ndoManager
{
  return self->_ndoManager;
}

- (void)setNdoManager:(id)a3
{
}

- (NDOACController)hostingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  return (NDOACController *)WeakRetained;
}

- (void)setHostingController:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSMutableArray)ndoSpecifiers
{
  return self->_ndoSpecifiers;
}

- (void)setNdoSpecifiers:(id)a3
{
}

- (PSSpecifier)warrantyGroupSpecifier
{
  return self->_warrantyGroupSpecifier;
}

- (void)setWarrantyGroupSpecifier:(id)a3
{
}

- (BOOL)isDefaultDevice
{
  return self->_isDefaultDevice;
}

- (void)setIsDefaultDevice:(BOOL)a3
{
  self->_isDefaultDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warrantyGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_ndoSpecifiers, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_destroyWeak((id *)&self->_hostingController);
  objc_storeStrong((id *)&self->_ndoManager, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_policyLookupQueue, 0);
}

@end