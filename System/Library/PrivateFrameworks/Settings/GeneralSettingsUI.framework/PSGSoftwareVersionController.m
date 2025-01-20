@interface PSGSoftwareVersionController
- (PSGSoftwareVersionController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)osUpdateDetailCellSpecifier;
- (id)osUpdateDetailGroup;
- (id)osUpdateLearnMoreButton;
- (id)specifiers;
- (id)splatRollbackButton;
- (id)splatUpdateDetailCellSpecifier;
- (id)splatUpdateDetailGroup;
- (id)splatUpdateLearnMoreButton;
- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 rollbackDidFinish:(id)a4;
- (void)client:(id)a3 rollbackDidStart:(id)a4;
- (void)osLearnMoreTapped;
- (void)presentLearnMoreSheetForDocumentationData:(id)a3;
- (void)releaseNotesDonePressed:(id)a3;
- (void)removeSecurityResponse;
- (void)setPreparingRollback:(BOOL)a3;
- (void)splatLearnMoreTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PSGSoftwareVersionController

- (PSGSoftwareVersionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSGSoftwareVersionController;
  v2 = [(PSGSoftwareVersionController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__PSGSoftwareVersionController_init__block_invoke;
    block[3] = &unk_264E8C8A0;
    v6 = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v3;
}

void __36__PSGSoftwareVersionController_init__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) table];
  [v1 reloadData];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PSGSoftwareVersionController;
  [(PSGSoftwareVersionController *)&v4 viewDidLoad];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSGSoftwareVersionController_viewDidLoad__block_invoke;
  block[3] = &unk_264E8C8A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__PSGSoftwareVersionController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) table];
  [v1 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)PSGSoftwareVersionController;
  [(PSGSoftwareVersionController *)&v13 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/About/SW_VERSION_SPECIFIER"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v7 = PSG_BundleForGeneralSettingsUIFramework();
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"OS Version" table:0 locale:v6 bundleURL:v8];

  v10 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v14[0] = v10;
  v11 = objc_msgSend(MEMORY[0x263F08DB0], "general_aboutPaneComponent");
  v14[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [(PSGSoftwareVersionController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.about-current-device" title:v9 localizedNavigationComponents:v12 deepLink:v4];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [(PSGSoftwareVersionController *)self specifier];
    v6 = [v5 propertyForKey:@"SUManagerClient"];
    suClient = self->_suClient;
    self->_suClient = v6;

    [(SUManagerClient *)self->_suClient setDelegate:self];
    v8 = [MEMORY[0x263F78250] documentationDataForInstalledUpdateType:0 error:0];
    osDocumentationData = self->_osDocumentationData;
    self->_osDocumentationData = v8;

    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    v11 = [(PSGSoftwareVersionController *)self osUpdateDetailGroup];
    [v10 addObject:v11];

    v12 = [(PSGSoftwareVersionController *)self osUpdateDetailCellSpecifier];
    [v10 addObject:v12];

    objc_super v13 = [(PSGSoftwareVersionController *)self osUpdateLearnMoreButton];
    if (v13) {
      [v10 addObject:v13];
    }
    if ([(SUManagerClient *)self->_suClient isSplatOnlyUpdateInstalled])
    {
      v14 = [MEMORY[0x263F78250] documentationDataForInstalledUpdateType:1 error:0];
      splatDocumentationData = self->_splatDocumentationData;
      self->_splatDocumentationData = v14;

      v16 = [(PSGSoftwareVersionController *)self splatUpdateDetailGroup];
      [v10 addObject:v16];

      v17 = [(PSGSoftwareVersionController *)self splatUpdateDetailCellSpecifier];
      [v10 addObject:v17];

      v18 = [(PSGSoftwareVersionController *)self splatUpdateLearnMoreButton];
      if (v18) {
        [v10 addObject:v18];
      }
      if ([(SUManagerClient *)self->_suClient isSplatOnlyUpdateRollbackAllowed:0])
      {
        v19 = [(PSGSoftwareVersionController *)self splatRollbackButton];
        if (v19) {
          [v10 addObject:v19];
        }
      }
    }
    else
    {
      v18 = _PSGLoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_23D28D000, v18, OS_LOG_TYPE_DEFAULT, "Cryptex-only content not installed", v22, 2u);
      }
    }

    v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v10;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)osUpdateDetailGroup
{
  v2 = (void *)MEMORY[0x263F5FC40];
  uint64_t v3 = PSG_LocalizedString(@"OS Version");
  objc_super v4 = [v2 groupSpecifierWithID:@"OS_VERSION_GROUP" name:v3];

  return v4;
}

- (id)osUpdateDetailCellSpecifier
{
  uint64_t v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:@"OS_VERSION_CELL" forKey:*MEMORY[0x263F60138]];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v3 setProperty:&unk_26F103B98 forKey:@"OSUpdateType"];
  [v3 setProperty:self->_suClient forKey:@"SUManagerClient"];
  [v3 setProperty:self->_osDocumentationData forKey:@"SUDocumentationData"];
  [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  return v3;
}

- (id)osUpdateLearnMoreButton
{
  uint64_t v3 = [(SUDocumentationData *)self->_osDocumentationData readme];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F5FC40];
    id v5 = PSG_LocalizedStringForGeneral(@"LEARN_MORE");
    v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v6 setButtonAction:sel_osLearnMoreTapped];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)splatUpdateDetailGroup
{
  v2 = (void *)MEMORY[0x263F5FC40];
  uint64_t v3 = PSG_LocalizedStringForGeneral(@"SECURITY");
  objc_super v4 = [v2 groupSpecifierWithID:@"SPLAT_VERSION_GROUP" name:v3];

  return v4;
}

- (id)splatUpdateDetailCellSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  id v5 = [v3 preferenceSpecifierNamed:0 target:WeakRetained set:0 get:0 detail:0 cell:-1 edit:0];

  [v5 setProperty:@"SPLAT_VERSION_CELL" forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v5 setProperty:&unk_26F103BB0 forKey:@"OSUpdateType"];
  [v5 setProperty:self->_suClient forKey:@"SUManagerClient"];
  [v5 setProperty:self->_splatDocumentationData forKey:@"SUDocumentationData"];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  return v5;
}

- (id)splatUpdateLearnMoreButton
{
  uint64_t v3 = [(SUDocumentationData *)self->_splatDocumentationData readme];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F5FC40];
    id v5 = PSG_LocalizedStringForGeneral(@"LEARN_MORE");
    v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v6 setButtonAction:sel_splatLearnMoreTapped];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)splatRollbackButton
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  suClient = self->_suClient;
  id v13 = 0;
  int v4 = [(SUManagerClient *)suClient isSplatOnlyUpdateRollbackAllowed:&v13];
  id v5 = v13;
  if (v4)
  {
    v6 = (void *)MEMORY[0x263F5FC40];
    objc_super v7 = PSG_LocalizedStringForGeneral(@"REMOVE_SECURITY_RESPONSE");
    v8 = [v6 deleteButtonSpecifierWithName:v7 target:self action:sel_removeSecurityResponse];

    [v8 setProperty:&unk_26F103BB0 forKey:*MEMORY[0x263F5FEF0]];
    [v8 setProperty:@"ROLLBACK_BUTTON" forKey:*MEMORY[0x263F60138]];
    v9 = self->_suClient;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke;
    v12[3] = &unk_264E8D000;
    v12[4] = self;
    [(SUManagerClient *)v9 isRollingBack:v12];
  }
  else
  {
    id v10 = _PSGLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "Rollback not allowed: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

void __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke_2;
    block[3] = &unk_264E8C8A0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __51__PSGSoftwareVersionController_splatRollbackButton__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreparingRollback:1];
}

- (void)setPreparingRollback:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PSGSoftwareVersionController *)self specifierForID:@"ROLLBACK_BUTTON"];
  if (!v5)
  {
    v6 = _PSGLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "No rollback button found", v10, 2u);
    }
  }
  if (v3) {
    objc_super v7 = @"PREPARING_REMOVAL";
  }
  else {
    objc_super v7 = @"REMOVE_SECURITY_RESPONSE";
  }
  v8 = PSG_LocalizedStringForGeneral(v7);
  [v5 setName:v8];

  v9 = [NSNumber numberWithInt:!v3];
  [v5 setProperty:v9 forKey:*MEMORY[0x263F600A8]];

  [(PSGSoftwareVersionController *)self reloadSpecifier:v5 animated:1];
}

- (void)osLearnMoreTapped
{
  BOOL v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "OS Learn More Tapped", v4, 2u);
  }

  [(PSGSoftwareVersionController *)self presentLearnMoreSheetForDocumentationData:self->_osDocumentationData];
}

- (void)splatLearnMoreTapped
{
  BOOL v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "Splat Learn More Tapped", v4, 2u);
  }

  [(PSGSoftwareVersionController *)self presentLearnMoreSheetForDocumentationData:self->_splatDocumentationData];
}

- (void)presentLearnMoreSheetForDocumentationData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [NSString alloc];
    v6 = [v4 readme];
    objc_super v7 = [v5 initWithData:v6 encoding:4];

    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F784D0]);
      [v8 setReleaseNotes:v7];
      v9 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
      [v9 setModalPresentationStyle:2];
      id v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_releaseNotesDonePressed_];
      v11 = [v8 navigationItem];
      [v11 setRightBarButtonItem:v10];

      [(PSGSoftwareVersionController *)self presentViewController:v9 animated:1 completion:0];
    }
    else
    {
      v12 = _PSGLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_23D28D000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create release notes string", v13, 2u);
      }
    }
  }
  else
  {
    objc_super v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "Unable to present learn more sheet with nil SUDocumentationData", buf, 2u);
    }
  }
}

- (void)releaseNotesDonePressed:(id)a3
{
}

- (void)removeSecurityResponse
{
  BOOL v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "Remove Security Reponse Tapped", buf, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F78230]);
  [v4 setCancelActiveUpdate:1];
  [v4 setPromptForConsent:1];
  [v4 setPromptForPasscode:1];
  suClient = self->_suClient;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__PSGSoftwareVersionController_removeSecurityResponse__block_invoke;
  v6[3] = &unk_264E8D000;
  v6[4] = self;
  [(SUManagerClient *)suClient rollbackUpdateWithOptions:v4 withResult:v6];
}

void __54__PSGSoftwareVersionController_removeSecurityResponse__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = objc_alloc(MEMORY[0x263F781C8]);
    id v10 = (void *)[v9 initWithEventName:*MEMORY[0x263F78398]];
    [v10 setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:@"PreferencesiOSVersionRemoveSecurityResponseTapped"];
    [*(id *)(*(void *)(a1 + 32) + 1384) submitSUAnalyticsEvent:v10];
  }
  v11 = _PSGLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
    {
      v12 = @"completed successfully";
    }
    else
    {
      v12 = [NSString stringWithFormat:@"failed. Error: %@", v8];
    }
    *(_DWORD *)buf = 138412290;
    v14 = v12;
    _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_DEFAULT, "rollback update %@", buf, 0xCu);
    if ((a2 & 1) == 0) {
  }
    }
}

- (void)client:(id)a3 rollbackDidStart:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__PSGSoftwareVersionController_client_rollbackDidStart___block_invoke;
  v7[3] = &unk_264E8C9C8;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __56__PSGSoftwareVersionController_client_rollbackDidStart___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "Prefereces: rollback started: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setPreparingRollback:1];
}

- (void)client:(id)a3 rollbackDidFinish:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PSGSoftwareVersionController_client_rollbackDidFinish___block_invoke;
  v7[3] = &unk_264E8C9C8;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __57__PSGSoftwareVersionController_client_rollbackDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "Prefereces: rollback finished: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setPreparingRollback:0];
}

- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__PSGSoftwareVersionController_client_rollbackDidFail_withError___block_invoke;
  v8[3] = &unk_264E8C9C8;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __65__PSGSoftwareVersionController_client_rollbackDidFail_withError___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "Prefereces: rollback failed: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setPreparingRollback:0];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PSGSoftwareVersionController *)self specifierAtIndex:[(PSGSoftwareVersionController *)self indexForIndexPath:v6]];
  id v9 = [v8 propertyForKey:*MEMORY[0x263F602B0]];
  [v9 layoutIfNeeded];
  id v10 = [(PSGSoftwareVersionController *)self specifierForID:@"OS_VERSION_CELL"];

  if (v8 == v10)
  {
    [v9 preferredHeightWithTable:v7];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PSGSoftwareVersionController;
    [(PSGSoftwareVersionController *)&v14 tableView:v7 heightForRowAtIndexPath:v6];
  }
  double v12 = v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splatDocumentationData, 0);
  objc_storeStrong((id *)&self->_osDocumentationData, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
}

@end