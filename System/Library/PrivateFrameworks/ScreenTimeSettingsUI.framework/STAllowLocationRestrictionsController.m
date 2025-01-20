@interface STAllowLocationRestrictionsController
- (STRootViewModelCoordinator)coordinator;
- (id)specifiers;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation STAllowLocationRestrictionsController

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)[*(id *)((char *)&self->super.super.super.super.super.super.isa+ (int)*MEMORY[0x263F5FE98]) objectForKeyedSubscript:0x26D940528];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)STAllowLocationRestrictionsController;
    v5 = [(PUILocationServicesListController *)&v23 specifiers];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[STAllowLocationRestrictionsController specifiers]();
    }
    v6 = +[STScreenTimeSettingsUIBundle bundle];
    v22 = [v6 localizedStringForKey:@"AllowChangesSpecifierName" value:&stru_26D9391A8 table:@"Restrictions"];
    v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:3 edit:0];
    uint64_t v8 = *MEMORY[0x263F60138];
    [v7 setObject:@"ALLOW" forKeyedSubscript:*MEMORY[0x263F60138]];
    v21 = [v6 localizedStringForKey:@"DontAllowChangesSpecifierName" value:&stru_26D9391A8 table:@"Restrictions"];
    v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [v9 setObject:@"DISALLOW" forKeyedSubscript:v8];
    v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v10 setObject:@"ALLOW_GROUP" forKeyedSubscript:v8];
    v11 = [v6 localizedStringForKey:@"LOCATION_EXPLANATION" value:&stru_26D9391A8 table:@"Restrictions"];
    [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600F8]];
    v12 = [NSNumber numberWithBool:1];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60168]];

    v13 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) performGetter];
    int v14 = [v13 BOOLValue];

    if (v14) {
      v15 = v7;
    }
    else {
      v15 = v9;
    }
    [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F60200]];
    [v5 insertObject:v10 atIndex:0];
    [v5 insertObject:v7 atIndex:1];
    [v5 insertObject:v9 atIndex:2];
    allowedGroup = self->_allowedGroup;
    self->_allowedGroup = (PSSpecifier *)v10;
    id v17 = v10;

    v18 = self;
    objc_sync_enter(v18);
    v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_sync_exit(v18);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  v9 = [(STAllowLocationRestrictionsController *)self indexPathForIndex:[(STAllowLocationRestrictionsController *)self indexOfSpecifier:self->_allowedGroup]];
  uint64_t v10 = [v9 section];

  if (v8 == v10)
  {
    if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __75__STAllowLocationRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke;
      v20[3] = &unk_264767278;
      id v21 = v6;
      id v22 = v7;
      objc_super v23 = self;
      [(PSListController *)self st_showPINSheetWithCompletion:v20];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)STAllowLocationRestrictionsController;
      [(STAllowLocationRestrictionsController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
      v11 = [(STAllowLocationRestrictionsController *)self specifierAtIndex:[(STAllowLocationRestrictionsController *)self indexForIndexPath:v7]];
      v12 = [v11 identifier];
      uint64_t v13 = [v12 isEqualToString:@"ALLOW"];

      uint64_t v14 = (int)*MEMORY[0x263F5FE98];
      v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v14);
      v16 = [NSNumber numberWithBool:v13];
      [v15 performSetterWithValue:v16];

      [(PUILocationServicesListController *)self updateSpecifiersForImposedSettings];
      id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                                + (int)*MEMORY[0x263F5FE78]));
      [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v14)];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STAllowLocationRestrictionsController;
    [(STAllowLocationRestrictionsController *)&v18 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

void __75__STAllowLocationRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v12.receiver = *(id *)(a1 + 48);
    v12.super_class = (Class)STAllowLocationRestrictionsController;
    objc_msgSendSuper2(&v12, sel_tableView_didSelectRowAtIndexPath_, v4, v3);
    v5 = objc_msgSend(*(id *)(a1 + 48), "specifierAtIndex:", objc_msgSend(*(id *)(a1 + 48), "indexForIndexPath:", *(void *)(a1 + 40)));
    id v6 = [v5 identifier];
    uint64_t v7 = [v6 isEqualToString:@"ALLOW"];

    uint64_t v8 = (int)*MEMORY[0x263F5FE98];
    v9 = *(void **)(*(void *)(a1 + 48) + v8);
    uint64_t v10 = [NSNumber numberWithBool:v7];
    [v9 performSetterWithValue:v10];

    [*(id *)(a1 + 48) updateSpecifiersForImposedSettings];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + (int)*MEMORY[0x263F5FE78]));
    [WeakRetained reloadSpecifier:*(void *)(*(void *)(a1 + 48) + v8)];
  }
}

- (void).cxx_destruct
{
}

- (void)specifiers
{
}

@end