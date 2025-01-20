@interface STContentPrivacySiriAndIntelligenceRestrictionsDetailController
- (STContentPrivacySiriAndIntelligenceRestrictionsDetailController)initWithRootViewModelCoordinator:(id)a3;
- (id)_defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4;
- (id)_defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4 uiLabelStringsTable:(id)a5;
- (id)_defaultLinkListSpecifierWithItem:(id)a3 titlesByValue:(id)a4 uiLabelStringsTable:(id)a5;
- (id)_defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5;
- (id)_getSiriImageGenerationLinkListSpecifierValue:(id)a3;
- (id)_getSpecifierValueForItem:(id)a3 viewModel:(id)a4 restrictionValues:(id)a5;
- (id)_radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5;
- (id)_siriImageGenerationSpecifier;
- (id)getItemSpecifierValue:(id)a3;
- (id)specifiers;
- (void)_setSiriImageGenerationLinkListSpecifierValue:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4;
@end

@implementation STContentPrivacySiriAndIntelligenceRestrictionsDetailController

- (STContentPrivacySiriAndIntelligenceRestrictionsDetailController)initWithRootViewModelCoordinator:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacySiriAndIntelligenceRestrictionsDetailController;
  return [(STPINListViewController *)&v4 initWithRootViewModelCoordinator:a3];
}

- (id)specifiers
{
  v3 = [(STPINListViewController *)self coordinator];
  objc_super v4 = [v3 contentPrivacyCoordinator];
  v5 = [v4 viewModel];
  int v6 = [v5 isLoaded];

  if (v6)
  {
    v7 = objc_opt_new();
    v8 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v9 = +[STScreenTimeSettingsUIBundle bundle];
    v31 = [v9 localizedStringForKey:@"AppleIntelligenceLabel" value:&stru_26D9391A8 table:v8];
    v10 = -[STContentPrivacySiriAndIntelligenceRestrictionsDetailController _radioGroupSpecifierWithName:footerText:item:](self, "_radioGroupSpecifierWithName:footerText:item:");
    [v7 addObject:v10];

    if (_os_feature_enabled_impl())
    {
      v11 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _siriImageGenerationSpecifier];
      [v7 addObject:v11];
    }
    v12 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithConfiguration:@"system.siri" key:@"allowWritingTools"];
    [v7 addObject:v12];

    v30 = [v9 localizedStringForKey:&stru_26D9391A8 value:&stru_26D9391A8 table:@"Restrictions-Montara"];
    v29 = [v9 localizedStringForKey:@"ChatGPTFooterText" value:&stru_26D9391A8 table:@"Restrictions-Montara"];
    v13 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _radioGroupSpecifierWithName:v30 footerText:v29 item:0];
    [v7 addObject:v13];

    v14 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithConfiguration:@"system.siri" key:@"allowExternalIntelligenceIntegrations" uiLabelStringsTable:@"Restrictions-Montara"];
    [v7 addObject:v14];
    v15 = [v9 localizedStringForKey:@"ChatGPTDetailFooterText" value:&stru_26D9391A8 table:@"Restrictions-Montara"];
    [v14 setObject:v15 forKeyedSubscript:0x26D93E828];

    v16 = [v9 localizedStringForKey:@"SiriLabel" value:&stru_26D9391A8 table:v8];
    v17 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _radioGroupSpecifierWithName:v16 footerText:0 item:0];
    [v7 addObject:v17];

    v18 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultSwitchSpecifierWithConfiguration:0x26D93CE68 key:0x26D93CF88 fallbackLabel:0];
    [v7 addObject:v18];

    v19 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithConfiguration:@"system.siri" key:@"allowAssistantUserGeneratedContent"];
    [v7 addObject:v19];

    v20 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithConfiguration:@"system.siri" key:@"forceAssistantProfanityFilter"];
    [v7 addObject:v20];

    v21 = [v9 localizedStringForKey:&stru_26D9391A8 value:&stru_26D9391A8 table:v8];
    v22 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _radioGroupSpecifierWithName:v21 footerText:0 item:0];
    [v7 addObject:v22];

    v23 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithConfiguration:0x26D93CE68 key:0x26D93CFA8];
    [v7 addObject:v23];

    v24 = (objc_class *)[v7 copy];
    uint64_t v25 = (int)*MEMORY[0x263F5FDB8];
    v26 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v25);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v25) = v24;

    id v27 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v25);
  }
  else
  {
    id v27 = (id)MEMORY[0x263EFFA68];
  }

  return v27;
}

- (id)getItemSpecifierValue:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:0x26D93CEC8];
  int v6 = [(STPINListViewController *)self coordinator];
  v7 = [v6 contentPrivacyCoordinator];
  v8 = [v7 viewModel];

  v9 = [v4 values];

  v10 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _getSpecifierValueForItem:v5 viewModel:v8 restrictionValues:v9];

  return v10;
}

- (id)_getSpecifierValueForItem:(id)a3 viewModel:(id)a4 restrictionValues:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valuesByRestriction];
  v9 = [v8 objectForKeyedSubscript:v6];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 defaultValueForRestriction:v6];
  }
  v12 = v11;

  return v12;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 objectForKeyedSubscript:0x26D93CEC8];
  v9 = [(STPINListViewController *)self coordinator];
  v10 = [v9 contentPrivacyCoordinator];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__STContentPrivacySiriAndIntelligenceRestrictionsDetailController_setItemSpecifierValue_specifier___block_invoke;
  v19[3] = &unk_264767160;
  v19[4] = self;
  id v11 = v6;
  id v20 = v11;
  [v10 saveRestrictionValue:v7 forItem:v8 completionHandler:v19];

  if (_os_feature_enabled_impl())
  {
    v12 = [MEMORY[0x263F67088] sharedController];
    v13 = [MEMORY[0x263F67088] sharedController];
    v14 = [v13 viewContext];
    id v18 = 0;
    char v15 = [v12 saveContext:v14 error:&v18];
    id v16 = v18;

    if ((v15 & 1) == 0)
    {
      v17 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[STContentPrivacySiriAndIntelligenceRestrictionsDetailController setItemSpecifierValue:specifier:]((uint64_t)v16, v17);
      }
    }
  }
}

uint64_t __99__STContentPrivacySiriAndIntelligenceRestrictionsDetailController_setItemSpecifierValue_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifiers withObject:*(void *)(a1 + 40) waitUntilDone:0];
}

- (id)_getSiriImageGenerationLinkListSpecifierValue:(id)a3
{
  v3 = NSNumber;
  id v4 = [(STPINListViewController *)self coordinator];
  v5 = [v4 contentPrivacyCoordinator];
  id v6 = [v5 viewModel];
  id v7 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "isSiriImageGenerationAllowed"));

  return v7;
}

- (void)_setSiriImageGenerationLinkListSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  v8 = [(STPINListViewController *)self coordinator];
  v9 = [v8 contentPrivacyCoordinator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __123__STContentPrivacySiriAndIntelligenceRestrictionsDetailController__setSiriImageGenerationLinkListSpecifierValue_specifier___block_invoke;
  v11[3] = &unk_264767160;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 saveSiriImageGenerationIsAllowed:v7 completionHandler:v11];
}

uint64_t __123__STContentPrivacySiriAndIntelligenceRestrictionsDetailController__setSiriImageGenerationLinkListSpecifierValue_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifiers withObject:*(void *)(a1 + 40) waitUntilDone:0];
}

- (void)dealloc
{
  v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 contentPrivacyCoordinator];
  [v4 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"SiriAndIntelligenceRestrictionsViewModelLoadedContext"];

  v5.receiver = self;
  v5.super_class = (Class)STContentPrivacySiriAndIntelligenceRestrictionsDetailController;
  [(STListViewController *)&v5 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];

  if (v5 != v4)
  {
    id v6 = [(STPINListViewController *)self coordinator];
    uint64_t v7 = [v6 contentPrivacyCoordinator];
    [v7 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"SiriAndIntelligenceRestrictionsViewModelLoadedContext"];

    v10.receiver = self;
    v10.super_class = (Class)STContentPrivacySiriAndIntelligenceRestrictionsDetailController;
    [(STPINListViewController *)&v10 setCoordinator:v4];
    v8 = [(STPINListViewController *)self coordinator];
    v9 = [v8 contentPrivacyCoordinator];
    [v9 addObserver:self forKeyPath:@"viewModel.isLoaded" options:0 context:@"SiriAndIntelligenceRestrictionsViewModelLoadedContext"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"SiriAndIntelligenceRestrictionsViewModelLoadedContext")
  {
    uint64_t v7 = [(STPINListViewController *)self coordinator];
    v8 = [v7 contentPrivacyCoordinator];
    v9 = [v8 viewModel];
    int v10 = [v9 isLoaded];

    if (v10)
    {
      [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self reloadSpecifiers];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STContentPrivacySiriAndIntelligenceRestrictionsDetailController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)_defaultLinkListSpecifierWithItem:(id)a3 titlesByValue:(id)a4 uiLabelStringsTable:(id)a5
{
  v33[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  objc_super v11 = +[STScreenTimeSettingsUIBundle bundle];
  id v12 = [v8 uiLabel];
  uint64_t v13 = [v11 localizedStringForKey:v12 value:&stru_26D9391A8 table:v9];

  v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:objc_opt_class() cell:2 edit:0];
  char v15 = [(STPINListViewController *)self coordinator];
  [v14 setObject:v15 forKeyedSubscript:0x26D940528];

  uint64_t v16 = [v8 restrictionType];
  v31 = (void *)v13;
  if (v16 == 1)
  {
    v22 = [v11 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v10];
    v23 = [v11 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v10];
    v32[0] = v22;
    v32[1] = v23;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];

    v21 = &unk_26D9675B8;
  }
  else
  {
    uint64_t v17 = v16;
    if (v16)
    {
      v24 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STContentPrivacySiriAndIntelligenceRestrictionsDetailController.m", 178, @"Unimplemented type %d", v17);

      id v20 = 0;
      v21 = 0;
    }
    else
    {
      id v18 = [v11 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v10];
      v19 = [v11 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v10];
      v33[0] = v18;
      v33[1] = v19;
      id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];

      v21 = &unk_26D9675A0;
    }
  }
  uint64_t v25 = NSNumber;
  v26 = [(STPINListViewController *)self coordinator];
  id v27 = [v26 contentPrivacyCoordinator];
  v28 = [v27 viewModel];
  v29 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v28, "shouldEnableRestriction:", v8));
  [v14 setObject:v29 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v14 setObject:v8 forKeyedSubscript:0x26D93CEC8];
  [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v14 setValues:v21 titles:v20];

  return v14;
}

- (id)_defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v9 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithConfiguration:v7 key:v6 uiLabelStringsTable:v8];

  return v9;
}

- (id)_defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4 uiLabelStringsTable:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(STPINListViewController *)self coordinator];
  uint64_t v13 = [v12 contentPrivacyCoordinator];
  v14 = [v13 viewModel];
  char v15 = [v14 visibleRestrictionWithConfiguration:v11 key:v10];

  if (!v15)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"STContentPrivacySiriAndIntelligenceRestrictionsDetailController.m", 197, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  uint64_t v16 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)self _defaultLinkListSpecifierWithItem:v15 titlesByValue:0 uiLabelStringsTable:v9];

  return v16;
}

- (id)_radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x263F5FC40] groupSpecifierWithName:a3];
  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:0x26D93CEC8];
  }

  return v9;
}

- (id)_defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STPINListViewController *)self coordinator];
  id v12 = [v11 contentPrivacyCoordinator];
  uint64_t v13 = [v12 viewModel];
  v14 = [v13 visibleRestrictionWithConfiguration:v10 key:v9];

  char v15 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  uint64_t v16 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v17 = [v14 uiLabel];
  id v27 = v8;
  if ([v17 length])
  {
    id v18 = [v16 localizedStringForKey:v17 value:&stru_26D9391A8 table:v15];
  }
  else
  {
    id v18 = v8;
  }
  v19 = v18;
  id v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v18 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:0 cell:6 edit:0];
  v21 = NSNumber;
  v22 = [(STPINListViewController *)self coordinator];
  v23 = [v22 contentPrivacyCoordinator];
  v24 = [v23 viewModel];
  uint64_t v25 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v24, "restrictionsEnabled"));
  [v20 setObject:v25 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v20 setObject:v14 forKeyedSubscript:0x26D93CEC8];

  return v20;
}

- (id)_siriImageGenerationSpecifier
{
  v22[2] = *MEMORY[0x263EF8340];
  v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v4 = +[STScreenTimeSettingsUIBundle bundle];
  id v5 = [v4 localizedStringForKey:@"SiriImageGenerationSpecifierName" value:&stru_26D9391A8 table:v3];
  id v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:sel__setSiriImageGenerationLinkListSpecifierValue_specifier_ get:sel__getSiriImageGenerationLinkListSpecifierValue_ detail:objc_opt_class() cell:2 edit:0];
  id v7 = [(STPINListViewController *)self coordinator];
  [v6 setObject:v7 forKeyedSubscript:0x26D940528];

  id v8 = NSNumber;
  id v9 = [(STPINListViewController *)self coordinator];
  id v10 = [v9 contentPrivacyCoordinator];
  id v11 = [v10 viewModel];
  id v12 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v11, "restrictionsEnabled"));
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v6 setObject:&unk_26D9675D0 forKeyedSubscript:@"STSiriAndIntelligenceRestrictionRanksSpecifierKey"];
  [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  uint64_t v13 = [v4 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v3];
  v14 = [v4 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v3];
  v22[0] = v13;
  v22[1] = v14;
  char v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  [v6 setValues:&unk_26D9675D0 titles:v15];

  uint64_t v16 = [v4 localizedStringForKey:@"SiriImageGenerationDetailFooterText" value:&stru_26D9391A8 table:v3];
  [v6 setObject:v16 forKeyedSubscript:0x26D93E828];

  uint64_t v17 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  id v18 = [v4 localizedStringForKey:@"SiriImageGenerationDetailExtendAppleIntelligenceFooterText" value:&stru_26D9391A8 table:@"Restrictions-Montara"];
  [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263F600F8]];

  v21 = v17;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  [v6 setObject:v19 forKeyedSubscript:0x26D93E7E8];

  return v6;
}

- (void)setItemSpecifierValue:(uint64_t)a1 specifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to save ContentPrivacySiriAndIntelligenceRestriction settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end