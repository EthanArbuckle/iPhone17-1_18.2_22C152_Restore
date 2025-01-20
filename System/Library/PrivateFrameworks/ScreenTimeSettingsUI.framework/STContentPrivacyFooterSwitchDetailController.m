@interface STContentPrivacyFooterSwitchDetailController
- (id)defaultSwitchSpecifierWithKey:(id)a3;
- (id)getItemSpecifierValue:(id)a3;
- (id)itemsFromParent;
- (void)didCancelEnteringPIN;
- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4;
@end

@implementation STContentPrivacyFooterSwitchDetailController

- (id)itemsFromParent
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  v12.receiver = self;
  v12.super_class = (Class)STContentPrivacyFooterSwitchDetailController;
  v4 = [(PSListItemsController *)&v12 itemsFromParent];
  v5 = (void *)[v3 initWithArray:v4];

  uint64_t v6 = (int)*MEMORY[0x263F5FE98];
  v7 = [*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v6) objectForKeyedSubscript:0x26D93E808];
  if (v7)
  {
    v8 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v13[0] = v8;
    v9 = [(STContentPrivacyFooterSwitchDetailController *)self defaultSwitchSpecifierWithKey:v7];
    v13[1] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

    [*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v6) setObject:v10 forKeyedSubscript:0x26D93E7E8];
    [v5 addObjectsFromArray:v10];
  }

  return v5;
}

- (id)getItemSpecifierValue:(id)a3
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained getItemSpecifierValue:v4];

  return v6;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__STContentPrivacyFooterSwitchDetailController_setItemSpecifierValue_specifier___block_invoke;
    v9[3] = &unk_264767278;
    id v10 = WeakRetained;
    id v11 = v6;
    id v12 = v7;
    [(PSListController *)self st_showPINSheetWithCompletion:v9];
  }
  else
  {
    [WeakRetained setItemSpecifierValue:v6 specifier:v7];
  }
}

uint64_t __80__STContentPrivacyFooterSwitchDetailController_setItemSpecifierValue_specifier___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setItemSpecifierValue:*(void *)(result + 40) specifier:*(void *)(result + 48)];
  }
  return result;
}

- (id)defaultSwitchSpecifierWithKey:(id)a3
{
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:0x26D93CEC8];
  uint64_t v8 = [v7 rmConfiguration];

  v9 = [(STPINListItemsController *)self coordinator];
  id v10 = [v9 contentPrivacyCoordinator];
  id v11 = [v10 viewModel];
  v25 = (void *)v8;
  id v12 = [v11 visibleRestrictionWithConfiguration:v8 key:v6];

  if (!v12)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"STContentPrivacyFooterSwitchDetailController.m", 55, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  v13 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  v14 = +[STScreenTimeSettingsUIBundle bundle];
  v15 = [v12 uiLabel];
  v16 = [v14 localizedStringForKey:v15 value:&stru_26D9391A8 table:v13];

  v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v16 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:0 cell:6 edit:0];
  v18 = NSNumber;
  v19 = [(STPINListItemsController *)self coordinator];
  v20 = [v19 contentPrivacyCoordinator];
  v21 = [v20 viewModel];
  v22 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v21, "restrictionsEnabled"));
  [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v17 setObject:v12 forKeyedSubscript:0x26D93CEC8];
  [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];

  return v17;
}

- (void)didCancelEnteringPIN
{
  v3.receiver = self;
  v3.super_class = (Class)STContentPrivacyFooterSwitchDetailController;
  [(STPINListItemsController *)&v3 didCancelEnteringPIN];
  [(STContentPrivacyFooterSwitchDetailController *)self reloadSpecifiers];
}

@end