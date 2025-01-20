@interface PSGMatterDeviceController
+ (BOOL)shouldShowTestSpecifiers;
+ (id)serviceSpecifierWithPairing:(id)a3 target:(id)a4;
+ (id)testSpecifiers;
- (BOOL)isServiceAtIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (MTSDevicePairingManager)pairingManager;
- (MTSSystemCommissionerPairing)pairing;
- (NSArray)serviceSpecifiers;
- (id)detailText:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)didBecomeActive:(id)a3;
- (void)reloadServicesWithCompletion:(id)a3;
- (void)setPairing:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setServiceSpecifiers:(id)a3;
- (void)showDeleteFromMatterLocker;
- (void)showDeleteService:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation PSGMatterDeviceController

+ (BOOL)shouldShowTestSpecifiers
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isInternalInstall"))
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"PSGMatterControllerShowTestDevices"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (id)testSpecifiers
{
  v2 = objc_opt_new();
  v3 = (void *)[v2 copy];

  return v3;
}

+ (id)serviceSpecifierWithPairing:(id)a3 target:(id)a4
{
  v5 = (void *)MEMORY[0x263F5FC40];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 fabric];
  v9 = [v8 ecosystem];
  v10 = [v9 vendor];
  v11 = [v10 displayName];
  v12 = [v5 preferenceSpecifierNamed:v11 target:v6 set:0 get:sel_detailText_ detail:0 cell:4 edit:0];

  v13 = [v7 uuid];
  v14 = [v13 UUIDString];
  [v12 setIdentifier:v14];

  [v12 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v12 setObject:v7 forKeyedSubscript:@"PSGDevicePairingKey"];
  v15 = [v7 fabric];

  v16 = [v15 displayName];
  [v12 setObject:v16 forKeyedSubscript:*MEMORY[0x263F60308]];

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PSGMatterDeviceController;
  [(PSGMatterDeviceController *)&v4 viewDidLoad];
  v3 = [(PSGMatterDeviceController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];
}

- (void)didBecomeActive:(id)a3
{
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v3))
  {
    uint64_t v30 = (int)*MEMORY[0x263F5FDB8];
    objc_super v4 = [(PSGMatterDeviceController *)self pairing];

    if (!v4)
    {
      v5 = [(PSGMatterDeviceController *)self specifier];
      id v6 = [v5 objectForKeyedSubscript:@"PSGDevicePairingKey"];
      [(PSGMatterDeviceController *)self setPairing:v6];
    }
    id v7 = objc_opt_new();
    v29 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MATTER_INFO_GROUP"];
    [v7 addObject:v29];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = PSG_LocalizedStringForMatter(@"MATTER_NAME");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:sel_detailText_ detail:0 cell:4 edit:0];

    [v10 setIdentifier:@"MATTER_INFO_NAME"];
    v11 = [(PSGMatterDeviceController *)self pairing];
    v12 = [v11 name];
    uint64_t v13 = *MEMORY[0x263F60308];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60308]];

    uint64_t v14 = *MEMORY[0x263F60050];
    uint64_t v15 = MEMORY[0x263EFFA88];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60050]];
    [v7 addObject:v10];
    v16 = (void *)MEMORY[0x263F5FC40];
    v17 = PSG_LocalizedStringForMatter(@"MATTER_SERIAL");
    v18 = [v16 preferenceSpecifierNamed:v17 target:self set:0 get:sel_detailText_ detail:0 cell:4 edit:0];

    [v18 setIdentifier:@"MATTER_INFO_SERIAL"];
    v19 = [(PSGMatterDeviceController *)self pairing];
    v20 = [v19 serialNumber];
    [v18 setObject:v20 forKeyedSubscript:v13];

    [v18 setObject:v15 forKeyedSubscript:v14];
    [v7 addObject:v18];
    v21 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MATTER_INFO_REMOVE_GROUP"];
    [v7 addObject:v21];
    v22 = (void *)MEMORY[0x263F5FC40];
    v23 = PSG_LocalizedStringForMatter(@"ACCESSORY_REMOVE_FROM_ALL_PROMPT");
    v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:sel_detailText_ detail:0 cell:13 edit:0];

    [v24 setIdentifier:@"MATTER_INFO_REMOVE"];
    [v24 setButtonAction:sel_showDeleteFromMatterLocker];
    [v24 setObject:&unk_26F103B68 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
    [v24 setObject:v15 forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    [v7 addObject:v24];
    v25 = (objc_class *)[v7 copy];
    uint64_t v3 = v30;
    v26 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30) = v25;
  }
  [(PSGMatterDeviceController *)self reloadServicesWithCompletion:0];
  v27 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  return v27;
}

- (void)reloadServicesWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSGMatterDeviceController *)self pairingManager];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F11038]);
    id v7 = [(PSGMatterDeviceController *)self pairing];
    v8 = (void *)[v6 initWithSystemCommissionerPairing:v7];
    [(PSGMatterDeviceController *)self setPairingManager:v8];
  }
  v9 = _PSGLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PSGMatterDeviceController reloadServicesWithCompletion:]";
    _os_log_impl(&dword_23D28D000, v9, OS_LOG_TYPE_DEFAULT, "%s: querying for pairings.", buf, 0xCu);
  }

  [(PSEditableListController *)self setEditingButtonHidden:1 animated:0];
  v10 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v10];
  v18 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  uint64_t v13 = [(PSGMatterDeviceController *)self navigationItem];
  [v13 setRightBarButtonItems:v12];

  [v10 startAnimating];
  uint64_t v14 = [(PSGMatterDeviceController *)self pairingManager];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke;
  v16[3] = &unk_264E8CF50;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v14 fetchPairingsWithCompletionHandler:v16];
}

void __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = _PSGLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_cold_1();
    }
  }
  v28 = v5;
  id v7 = objc_opt_new();
  if (+[PSGMatterDeviceController shouldShowTestSpecifiers])
  {
    v8 = +[PSGMatterDeviceController testSpecifiers];
    [v7 addObjectsFromArray:v8];
  }
  v29 = v7;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v32 = *(void *)v39;
    v11 = (void *)*MEMORY[0x263F11010];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v14 = _PSGLoggingFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "-[PSGMatterDeviceController reloadServicesWithCompletion:]_block_invoke";
          __int16 v44 = 2112;
          v45 = v13;
          _os_log_impl(&dword_23D28D000, v14, OS_LOG_TYPE_DEFAULT, "%s: found device pairing %@", buf, 0x16u);
        }

        id v15 = [v13 fabric];
        v16 = [v15 ecosystem];
        id v17 = [v16 vendor];
        v18 = [v17 identifier];
        uint64_t v19 = [v18 integerValue];
        uint64_t v20 = [v11 integerValue];

        if (v19 != v20)
        {
          uint64_t v21 = +[PSGMatterDeviceController serviceSpecifierWithPairing:v13 target:*(void *)(a1 + 32)];
          [v29 addObject:v21];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v10);
  }

  if ([v29 count])
  {
    v22 = (void *)MEMORY[0x263F5FC40];
    v23 = PSG_LocalizedStringForMatter(@"CONNECTED_SERVICES");
    v24 = [v22 groupSpecifierWithID:@"CONNECTED_SERVICES" name:v23];

    [v29 insertObject:v24 atIndex:0];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_47;
  block[3] = &unk_264E8CFA8;
  uint64_t v25 = *(void *)(a1 + 32);
  v26 = *(void **)(a1 + 40);
  id v34 = v29;
  uint64_t v35 = v25;
  BOOL v37 = v28 != 0;
  id v36 = v26;
  id v27 = v29;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_47(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v3 = [*(id *)(a1 + 40) serviceSpecifiers];
  id v4 = *(char **)(a1 + 40);
  if (*(void *)&v4[*MEMORY[0x263F5FDB8]])
  {
    id v5 = [v4 specifierForID:@"MATTER_INFO_GROUP"];
    id v6 = v5;
    if (*(unsigned char *)(a1 + 56))
    {
      id v7 = PSG_LocalizedStringForMatter(@"MATTER_NO_RESPONSE_FOOTER");
      [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }
    else
    {
      [v5 setObject:&stru_26F0FADC0 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }
    [*(id *)(a1 + 40) reloadSpecifier:v6];
    uint64_t v8 = [v2 count];
    uint64_t v9 = [v3 count];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(a1 + 40), "removeSpecifier:animated:", *(void *)(*((void *)&v19 + 1) + 8 * i), 0, (void)v19);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [*(id *)(a1 + 40) insertContiguousSpecifiers:v2 atIndex:0 animated:v8 != v9];
    id v4 = *(char **)(a1 + 40);
  }
  objc_msgSend(v4, "setServiceSpecifiers:", v2, (void)v19);
  id v15 = [*(id *)(a1 + 40) navigationItem];
  [v15 setRightBarButtonItems:0];

  v16 = *(void **)(a1 + 40);
  id v17 = [v16 serviceSpecifiers];
  objc_msgSend(v16, "setEditingButtonHidden:animated:", objc_msgSend(v17, "count") == 0, 0);

  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

- (id)detailText:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x263F60308]];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(PSGMatterDeviceController *)self isServiceAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return [(PSGMatterDeviceController *)self isServiceAtIndexPath:a4];
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return PSG_LocalizedStringForMatter(@"TABLEVIEW_SLIDE_TO_REMOVE_BUTTON");
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (a4 == 1)
  {
    id v10 = v7;
    id v7 = (id)[(PSGMatterDeviceController *)self isServiceAtIndexPath:v7];
    id v8 = v10;
    if (v7)
    {
      uint64_t v9 = [(PSGMatterDeviceController *)self specifierAtIndexPath:v10];
      [(PSGMatterDeviceController *)self showDeleteService:v9];

      id v8 = v10;
    }
  }
  MEMORY[0x270F9A758](v7, v8);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)PSGMatterDeviceController;
  id v6 = a4;
  id v7 = [(PSGMatterDeviceController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[PSGMatterDeviceController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60138]];
    int v10 = [v9 isEqualToString:@"MATTER_INFO_REMOVE"];

    if (v10)
    {
      id v11 = v7;
      if ([v11 type] == 13)
      {
        uint64_t v12 = [MEMORY[0x263F825C8] systemRedColor];
        uint64_t v13 = [v11 textLabel];
        [v13 setTextColor:v12];

        goto LABEL_7;
      }
    }
  }
  id v14 = v7;
LABEL_7:

  return v7;
}

- (BOOL)isServiceAtIndexPath:(id)a3
{
  uint64_t v3 = [(PSGMatterDeviceController *)self specifierAtIndexPath:a3];
  id v4 = [v3 objectForKeyedSubscript:@"PSGDevicePairingKey"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)showDeleteService:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSString;
  id v6 = PSG_LocalizedStringForMatter(@"SERVICE_DELETE_PROMPT_DETAIL");
  id v7 = [v4 name];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  uint64_t v9 = (void *)MEMORY[0x263F82418];
  int v10 = PSG_LocalizedStringForMatter(@"SERVICE_DELETE_PROMPT");
  id v11 = [v9 alertControllerWithTitle:v10 message:v8 preferredStyle:1];

  uint64_t v12 = NSString;
  uint64_t v13 = PSG_LocalizedStringForMatter(@"SERVICE_DELETE_PROMPT_DELETE");
  id v14 = [v4 name];
  id v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

  objc_super v16 = (void *)MEMORY[0x263F82400];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke;
  v23[3] = &unk_264E8C850;
  id v24 = v4;
  uint64_t v25 = self;
  id v17 = v4;
  uint64_t v18 = [v16 actionWithTitle:v15 style:2 handler:v23];
  [v11 addAction:v18];

  long long v19 = (void *)MEMORY[0x263F82400];
  long long v20 = PSG_LocalizedStringForMatter(@"SERVICE_DELETE_PROMPT_CANCEL");
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke_2;
  v22[3] = &unk_264E8CD48;
  v22[4] = self;
  long long v21 = [v19 actionWithTitle:v20 style:1 handler:v22];
  [v11 addAction:v21];

  [(PSGMatterDeviceController *)self presentViewController:v11 animated:1 completion:0];
}

void __47__PSGMatterDeviceController_showDeleteService___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PSGDevicePairingKey"];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) pairingManager];
    id v4 = [v2 uuid];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke_75;
    v6[3] = &unk_264E8CF78;
    v6[4] = *(void *)(a1 + 40);
    [v3 removePairingWithUUID:v4 completionHandler:v6];
  }
  else
  {
    uint64_t v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 136315394;
      id v8 = "-[PSGMatterDeviceController showDeleteService:]_block_invoke";
      __int16 v9 = 2112;
      int v10 = v5;
      _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.: %@", buf, 0x16u);
    }
  }
}

void __47__PSGMatterDeviceController_showDeleteService___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _PSGLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__PSGMatterDeviceController_showDeleteService___block_invoke_75_cold_1();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PSGMatterDeviceController_showDeleteService___block_invoke_76;
  block[3] = &unk_264E8C8A0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__PSGMatterDeviceController_showDeleteService___block_invoke_76(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadServicesWithCompletion:0];
}

uint64_t __47__PSGMatterDeviceController_showDeleteService___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadServicesWithCompletion:0];
}

- (void)showDeleteFromMatterLocker
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT");
  BOOL v5 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_DETAIL");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x263F82400];
  id v8 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_REMOVE_FROM_MATTER");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke;
  v14[3] = &unk_264E8CD48;
  v14[4] = self;
  __int16 v9 = [v7 actionWithTitle:v8 style:2 handler:v14];
  [v6 addAction:v9];

  int v10 = (void *)MEMORY[0x263F82400];
  uint64_t v11 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_CANCEL");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_96;
  v13[3] = &unk_264E8CD48;
  v13[4] = self;
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:v13];
  [v6 addAction:v12];

  [(PSGMatterDeviceController *)self presentViewController:v6 animated:1 completion:0];
}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) specifier];
  id v3 = [v2 objectForKeyedSubscript:@"PSGDevicePairingKey"];

  if (v3)
  {
    id v4 = objc_opt_new();
    BOOL v5 = [v3 uuid];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_92;
    v6[3] = &unk_264E8CF78;
    v6[4] = *(void *)(a1 + 32);
    [v4 removePairingWithUUID:v5 completionHandler:v6];
  }
  else
  {
    id v4 = _PSGLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[PSGMatterDeviceController showDeleteFromMatterLocker]_block_invoke";
      _os_log_impl(&dword_23D28D000, v4, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.", buf, 0xCu);
    }
  }
}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2;
  v6[3] = &unk_264E8C9C8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  int v10 = [*(id *)(a1 + 40) navigationController];
  id v11 = (id)[v10 popViewControllerAnimated:1];
}

uint64_t __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_96(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadServicesWithCompletion:0];
}

- (MTSSystemCommissionerPairing)pairing
{
  return self->_pairing;
}

- (void)setPairing:(id)a3
{
}

- (MTSDevicePairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (NSArray)serviceSpecifiers
{
  return self->_serviceSpecifiers;
}

- (void)setServiceSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
}

void __58__PSGMatterDeviceController_reloadServicesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23D28D000, v0, v1, "%s: error when fetching pairings: %@", v2, v3, v4, v5, 2u);
}

void __47__PSGMatterDeviceController_showDeleteService___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23D28D000, v0, v1, "%s: error when deleting pairing: %@", v2, v3, v4, v5, 2u);
}

void __55__PSGMatterDeviceController_showDeleteFromMatterLocker__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end