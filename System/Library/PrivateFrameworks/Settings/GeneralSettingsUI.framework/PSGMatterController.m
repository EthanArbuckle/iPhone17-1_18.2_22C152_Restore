@interface PSGMatterController
+ (BOOL)shouldShowTestSpecifiers;
+ (id)accessorySpecifierWithID:(id)a3 name:(id)a4 pairing:(id)a5 target:(id)a6;
+ (id)testSpecifiers;
+ (void)shouldShowMatterControllerWithCompletion:(id)a3;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (MTSSystemCommissionerPairingManager)pairingManager;
- (NSArray)accessorySpecifiers;
- (id)detailText:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)aboutLinkWasTapped;
- (void)deleteAccessory:(id)a3;
- (void)didBecomeActive:(id)a3;
- (void)reloadAccessoriesWithCompletion:(id)a3;
- (void)setAccessorySpecifiers:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)showDeleteAllConfirmation:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSGMatterController

+ (void)shouldShowMatterControllerWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke;
  v6[3] = &unk_264E8CEB0;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchPairingsWithCompletionHandler:v6];
}

void __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke_cold_1();
    }
  }
  if ([v5 count])
  {
    BOOL v8 = 1;
  }
  else if (+[PSGMatterController shouldShowTestSpecifiers])
  {
    v9 = +[PSGMatterController testSpecifiers];
    BOOL v8 = [v9 count] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v8);
  }
}

+ (BOOL)shouldShowTestSpecifiers
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isInternalInstall"))
  {
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
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
  id v3 = objc_opt_new();
  char v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [v4 UUIDString];
  id v6 = [a1 accessorySpecifierWithID:v5 name:@"Mock test device #1" pairing:0 target:0];
  [v3 addObject:v6];

  id v7 = [MEMORY[0x263F08C38] UUID];
  BOOL v8 = [v7 UUIDString];
  v9 = [a1 accessorySpecifierWithID:v8 name:@"Mock test device #2" pairing:0 target:0];
  [v3 addObject:v9];

  uint64_t v10 = [MEMORY[0x263F08C38] UUID];
  v11 = [v10 UUIDString];
  v12 = [a1 accessorySpecifierWithID:v11 name:@"Mock test device #3" pairing:0 target:0];
  [v3 addObject:v12];

  v13 = (void *)[v3 copy];
  return v13;
}

+ (id)accessorySpecifierWithID:(id)a3 name:(id)a4 pairing:(id)a5 target:(id)a6
{
  v9 = (void *)MEMORY[0x263F5FC40];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v9 preferenceSpecifierNamed:v12 target:v10 set:0 get:sel_detailText_ detail:objc_opt_class() cell:2 edit:0];

  [v14 setIdentifier:v13];
  [v14 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v14 setObject:v11 forKeyedSubscript:@"PSGDevicePairingKey"];

  return v14;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  char v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_opt_new();
    id v6 = PSG_LocalizedStringForMatter(@"MATTER_ACCESSORIES_GROUP_FOOTER");
    id v7 = PSG_LocalizedStringForMatter(@"MATTER_ACCESSORIES_GROUP_FOOTER_LINK");
    BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", v6, v7);
    v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MATTER_ACCESSORIES_GROUP"];
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600C0]];

    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F600E8]];
    v18.location = [v8 rangeOfString:v7];
    id v12 = NSStringFromRange(v18);
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600D0]];

    id v13 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600E0]];

    [v9 setObject:@"aboutLinkWasTapped" forKeyedSubscript:*MEMORY[0x263F600C8]];
    [v5 addObject:v9];
    v14 = (objc_class *)[v5 copy];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v14;

    char v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)detailText:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x263F60308]];
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 1;
}

- (void)didBecomeActive:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x263EF8340];
  [(PSGMatterController *)self reloadAccessoriesWithCompletion:0];
  v13.receiver = self;
  v13.super_class = (Class)PSGMatterController;
  [(PSGMatterController *)&v13 viewDidAppear:v3];
  id v5 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/MATTER_ACCESSORIES"];
  id v6 = objc_alloc(MEMORY[0x263F08DB0]);
  id v7 = [MEMORY[0x263EFF960] currentLocale];
  BOOL v8 = PSG_BundleForGeneralSettingsUIFramework();
  v9 = [v8 bundleURL];
  id v10 = (void *)[v6 initWithKey:@"MATTER_ACCESSORIES" table:@"General" locale:v7 bundleURL:v9];

  id v11 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v14[0] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [(PSGMatterController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.matter-accessories" title:v10 localizedNavigationComponents:v12 deepLink:v5];
}

- (void)aboutLinkWasTapped
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  int v3 = objc_msgSend(v2, "sf_isiPad");

  if (v3) {
    char v4 = @"https://support.apple.com/ht213441?cid=mc-ols-iphone-article_ht213441-ipados_ui-09062022";
  }
  else {
    char v4 = @"https://support.apple.com/ht213441?cid=mc-ols-iphone-articl_ht213441-ios_ui-09062022";
  }
  id v6 = [NSURL URLWithString:v4];
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  [v5 openURL:v6 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)reloadAccessoriesWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSGMatterController *)self pairingManager];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(PSGMatterController *)self setPairingManager:v6];
  }
  id v7 = _PSGLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v13 = "-[PSGMatterController reloadAccessoriesWithCompletion:]";
    _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%s: querying for pairings.", buf, 0xCu);
  }

  BOOL v8 = [(PSGMatterController *)self pairingManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke;
  v10[3] = &unk_264E8CF50;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchPairingsWithCompletionHandler:v10];
}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_cold_1();
    }
  }
  v27 = v6;
  BOOL v8 = objc_opt_new();
  if (+[PSGMatterController shouldShowTestSpecifiers])
  {
    id v9 = +[PSGMatterController testSpecifiers];
    [v8 addObjectsFromArray:v9];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v15 = [v14 uuid];
        v16 = [v15 UUIDString];
        v17 = [v14 name];
        NSRange v18 = +[PSGMatterController accessorySpecifierWithID:v16 name:v17 pairing:v14 target:*(void *)(a1 + 32)];

        v19 = _PSGLoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [v14 name];
          v21 = [v14 uuid];
          v22 = [v21 UUIDString];
          *(_DWORD *)buf = 136315650;
          v39 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
          __int16 v40 = 2112;
          v41 = v20;
          __int16 v42 = 2112;
          v43 = v22;
          _os_log_impl(&dword_23D28D000, v19, OS_LOG_TYPE_DEFAULT, "%s: found pairing %@ with uuid: %@", buf, 0x20u);
        }
        [v8 addObject:v18];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v11);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_64;
  block[3] = &unk_264E8CF28;
  uint64_t v23 = *(void *)(a1 + 32);
  v24 = *(void **)(a1 + 40);
  id v30 = v8;
  uint64_t v31 = v23;
  id v32 = v27;
  id v33 = v24;
  id v25 = v27;
  id v26 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_64(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v56 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(a1 + 32) copy];
  int v3 = [*(id *)(v1 + 40) accessorySpecifiers];
  id v4 = *(char **)(v1 + 40);
  id v30 = v3;
  if (*(void *)&v4[*MEMORY[0x263F5FDB8]])
  {
    uint64_t v5 = objc_msgSend(v2, "count", v3);
    uint64_t v6 = [v3 count];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(v1 + 40) removeSpecifier:*(void *)(*((void *)&v44 + 1) + 8 * i) animated:0];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v9);
    }
    BOOL v12 = v5 != v6;

    objc_super v13 = *(void **)(v1 + 40);
    uint64_t v14 = [v13 specifierForID:@"MATTER_ACCESSORIES_GROUP"];
    [v13 insertContiguousSpecifiers:v2 afterSpecifier:v14 animated:v12];

    id v4 = *(char **)(v1 + 40);
  }
  id v32 = v2;
  objc_msgSend(v4, "setAccessorySpecifiers:", v2, v30);
  [*(id *)(v1 + 40) handlePendingURL];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [*(id *)(v1 + 40) accessorySpecifiers];
  uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    uint64_t v33 = v1;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        v20 = [v19 objectForKeyedSubscript:@"PSGDevicePairingKey"];
        v21 = (void *)[objc_alloc(MEMORY[0x263F11038]) initWithSystemCommissionerPairing:v20];
        v22 = _PSGLoggingFacility();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v20 name];
          v24 = [v20 uuid];
          [v24 UUIDString];
          uint64_t v25 = v16;
          v27 = uint64_t v26 = v17;
          *(_DWORD *)buf = 136315650;
          v49 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
          __int16 v50 = 2112;
          v51 = v23;
          __int16 v52 = 2112;
          v53 = v27;
          _os_log_impl(&dword_23D28D000, v22, OS_LOG_TYPE_DEFAULT, "%s: querying for device pairings pairings for pairing %@ with uuid %@.", buf, 0x20u);

          uint64_t v17 = v26;
          uint64_t v16 = v25;
          uint64_t v1 = v33;
        }
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_66;
        v35[3] = &unk_264E8CF00;
        id v36 = v20;
        id v37 = *(id *)(v1 + 48);
        v38 = v19;
        uint64_t v39 = *(void *)(v1 + 40);
        id v28 = v20;
        [v21 fetchPairingsWithCompletionHandler:v35];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v16);
  }

  uint64_t v29 = *(void *)(v1 + 56);
  if (v29) {
    (*(void (**)(void))(v29 + 16))();
  }
}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2;
  v9[3] = &unk_264E8CED8;
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = _PSGLoggingFacility();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2_cold_1(a1, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 40) name];
    id v6 = [*(id *)(a1 + 40) uuid];
    id v7 = [v6 UUIDString];
    *(_DWORD *)buf = 136315650;
    long long v42 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
    __int16 v43 = 2112;
    long long v44 = v5;
    __int16 v45 = 2112;
    long long v46 = v7;
    _os_log_impl(&dword_23D28D000, v4, OS_LOG_TYPE_DEFAULT, "%s: fetched device pairings for pairing %@ with uuid %@", buf, 0x20u);
  }
  if ([*(id *)(a1 + 56) count])
  {
    [MEMORY[0x263EFF9C0] set];
    v33 = uint64_t v32 = a1;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = *(id *)(a1 + 56);
    uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    uint64_t v35 = *(void *)v37;
    id v10 = (void *)*MEMORY[0x263F11010];
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v35) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v13 = _PSGLoggingFacility();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v42 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke";
          __int16 v43 = 2112;
          long long v44 = v12;
          _os_log_impl(&dword_23D28D000, v13, OS_LOG_TYPE_DEFAULT, "%s: found device pairing %@", buf, 0x16u);
        }

        long long v14 = [v12 fabric];
        uint64_t v15 = [v14 ecosystem];
        uint64_t v16 = [v15 vendor];
        uint64_t v17 = [v16 identifier];
        uint64_t v18 = [v17 integerValue];
        uint64_t v19 = [v10 integerValue];

        if (v18 != v19)
        {
          v20 = [v12 fabric];
          uint64_t v21 = [v20 displayName];
          if (!v21)
          {

LABEL_19:
            uint64_t v26 = objc_msgSend(v12, "fabric", v32);
            v27 = [v26 displayName];
            [v33 addObject:v27];

            continue;
          }
          v22 = (void *)v21;
          uint64_t v23 = [v12 fabric];
          v24 = [v23 displayName];
          uint64_t v25 = [v24 length];

          if (v25) {
            goto LABEL_19;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v9)
      {
LABEL_22:

        id v28 = (void *)MEMORY[0x263F08950];
        uint64_t v29 = [v33 allObjects];
        id v30 = [v29 sortedArrayUsingSelector:sel_localizedStandardCompare_];
        uint64_t v31 = [v28 localizedStringByJoiningStrings:v30];

        [*(id *)(v32 + 64) setObject:v31 forKeyedSubscript:*MEMORY[0x263F60308]];
        [*(id *)(v32 + 72) reloadSpecifier:*(void *)(v32 + 64)];

        return;
      }
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(PSGMatterController *)self indexForIndexPath:a4];
  id v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  id v7 = [v6 objectForKeyedSubscript:@"PSGDevicePairingKey"];
  int64_t v8 = v7 != 0;

  return v8;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return PSG_LocalizedStringForMatter(@"TABLEVIEW_SLIDE_TO_REMOVE_BUTTON");
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  -[PSGMatterController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(PSGMatterController *)self deleteAccessory:v6];
}

- (void)deleteAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82418];
  id v6 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT");
  id v7 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_MULTIPLE_OPTIONS_DETAIL");
  int64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  uint64_t v9 = (void *)MEMORY[0x263F82400];
  id v10 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_REMOVE_FROM_MATTER");
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __39__PSGMatterController_deleteAccessory___block_invoke;
  v23[3] = &unk_264E8C850;
  id v11 = v4;
  id v24 = v11;
  uint64_t v25 = self;
  id v12 = [v9 actionWithTitle:v10 style:2 handler:v23];
  [v8 addAction:v12];

  id v13 = (void *)MEMORY[0x263F82400];
  long long v14 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_REMOVE_FROM_ALL");
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __39__PSGMatterController_deleteAccessory___block_invoke_92;
  v21[3] = &unk_264E8C850;
  v21[4] = self;
  id v22 = v11;
  id v15 = v11;
  uint64_t v16 = [v13 actionWithTitle:v14 style:2 handler:v21];
  [v8 addAction:v16];

  uint64_t v17 = (void *)MEMORY[0x263F82400];
  uint64_t v18 = PSG_LocalizedStringForMatter(@"ACCESSORY_DELETE_PROMPT_CANCEL");
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __39__PSGMatterController_deleteAccessory___block_invoke_2;
  v20[3] = &unk_264E8CD48;
  v20[4] = self;
  uint64_t v19 = [v17 actionWithTitle:v18 style:1 handler:v20];
  [v8 addAction:v19];

  [(PSGMatterController *)self presentViewController:v8 animated:1 completion:0];
}

void __39__PSGMatterController_deleteAccessory___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PSGDevicePairingKey"];
  if (v2)
  {
    int v3 = [*(id *)(a1 + 40) pairingManager];
    id v4 = [v2 uuid];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__PSGMatterController_deleteAccessory___block_invoke_86;
    v6[3] = &unk_264E8CF78;
    void v6[4] = *(void *)(a1 + 40);
    [v3 removePairingWithUUID:v4 completionHandler:v6];
  }
  else
  {
    int v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 136315394;
      int64_t v8 = "-[PSGMatterController deleteAccessory:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.: %@", buf, 0x16u);
    }
  }
}

void __39__PSGMatterController_deleteAccessory___block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _PSGLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__PSGMatterController_deleteAccessory___block_invoke_86_cold_1();
    }
  }
  [*(id *)(a1 + 32) reloadAccessoriesWithCompletion:0];
}

uint64_t __39__PSGMatterController_deleteAccessory___block_invoke_92(uint64_t a1)
{
  return [*(id *)(a1 + 32) showDeleteAllConfirmation:*(void *)(a1 + 40)];
}

uint64_t __39__PSGMatterController_deleteAccessory___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAccessoriesWithCompletion:0];
}

- (void)showDeleteAllConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82418];
  id v6 = PSG_LocalizedStringForMatter(@"ACCESSORY_REMOVE_FROM_ALL_PROMPT");
  id v7 = PSG_LocalizedStringForMatter(@"ACCESSORY_REMOVE_FROM_ALL_DETAIL");
  int64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  __int16 v9 = (void *)MEMORY[0x263F82400];
  id v10 = PSG_LocalizedStringForMatter(@"ACCESSORY_REMOVE_FROM_ALL_CONFIRM");
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke;
  v17[3] = &unk_264E8C850;
  id v18 = v4;
  uint64_t v19 = self;
  id v11 = v4;
  id v12 = [v9 actionWithTitle:v10 style:2 handler:v17];
  [v8 addAction:v12];

  id v13 = (void *)MEMORY[0x263F82400];
  long long v14 = PSG_LocalizedStringForMatter(@"ACCESSORY_REMOVE_FROM_ALL_CANCEL");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_2;
  v16[3] = &unk_264E8CD48;
  v16[4] = self;
  id v15 = [v13 actionWithTitle:v14 style:1 handler:v16];
  [v8 addAction:v15];

  [(PSGMatterController *)self presentViewController:v8 animated:1 completion:0];
}

void __49__PSGMatterController_showDeleteAllConfirmation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PSGDevicePairingKey"];
  if (v2)
  {
    id v3 = [objc_alloc(MEMORY[0x263F11038]) initWithSystemCommissionerPairing:v2];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_105;
    v5[3] = &unk_264E8CF78;
    v5[4] = *(void *)(a1 + 40);
    [v3 removeAllPairingsWithCompletionHandler:v5];
  }
  else
  {
    id v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 136315394;
      id v7 = "-[PSGMatterController showDeleteAllConfirmation:]_block_invoke";
      __int16 v8 = 2112;
      __int16 v9 = v4;
      _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "%s: not deleting device because it has no pairing.: %@", buf, 0x16u);
    }
  }
}

void __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _PSGLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_105_cold_1();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_106;
  block[3] = &unk_264E8C8A0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAccessoriesWithCompletion:0];
}

uint64_t __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAccessoriesWithCompletion:0];
}

- (MTSSystemCommissionerPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (NSArray)accessorySpecifiers
{
  return self->_accessorySpecifiers;
}

- (void)setAccessorySpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySpecifiers, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
}

void __64__PSGMatterController_shouldShowMatterControllerWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23D28D000, v0, v1, "%s: error when fetching pairings: %@", v2, v3, v4, v5, 2u);
}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23D28D000, v0, v1, "%s: error when fetching pairings: %@", v2, v3, v4, v5, 2u);
}

void __55__PSGMatterController_reloadAccessoriesWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 40) name];
  uint64_t v5 = [*(id *)(a1 + 40) uuid];
  id v6 = [v5 UUIDString];
  uint64_t v7 = *(void *)(a1 + 48);
  int v8 = 136315906;
  __int16 v9 = "-[PSGMatterController reloadAccessoriesWithCompletion:]_block_invoke_2";
  __int16 v10 = 2112;
  id v11 = v4;
  __int16 v12 = 2112;
  id v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  _os_log_error_impl(&dword_23D28D000, a2, OS_LOG_TYPE_ERROR, "%s: error when fetching device pairings for pairing %@ with uuid %@: %@", (uint8_t *)&v8, 0x2Au);
}

void __39__PSGMatterController_deleteAccessory___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23D28D000, v0, v1, "%s: error when deleting pairing: %@", v2, v3, v4, v5, 2u);
}

void __49__PSGMatterController_showDeleteAllConfirmation___block_invoke_105_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_23D28D000, v0, v1, "%s: error when deleting pairing: %@", v2, v3, v4, v5, 2u);
}

@end