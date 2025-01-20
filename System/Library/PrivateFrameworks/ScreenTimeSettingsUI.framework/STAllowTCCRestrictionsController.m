@interface STAllowTCCRestrictionsController
- (STRootViewModelCoordinator)coordinator;
- (id)specifiers;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation STAllowTCCRestrictionsController

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
    v31.receiver = self;
    v31.super_class = (Class)STAllowTCCRestrictionsController;
    v5 = [(PUITCCAccessController *)&v31 specifiers];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[STAllowTCCRestrictionsController specifiers]();
    }
    uint64_t v6 = (int)*MEMORY[0x263F5FE98];
    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6);
    v8 = [(PUITCCAccessController *)self explanation];
    v30 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) performGetter];
    int v9 = [v30 BOOLValue];
    v10 = self;
    id v11 = v7;
    id v28 = v5;
    id v29 = v8;
    v12 = +[STScreenTimeSettingsUIBundle bundle];
    v27 = v11;
    if (v11)
    {
      v13 = [v11 objectForKeyedSubscript:0x26D93CEC8];
      int v26 = v9 ^ ([v13 restrictionType] == 1);
    }
    else
    {
      int v26 = v9;
    }
    v14 = [v12 localizedStringForKey:@"AllowChangesSpecifierName" value:&stru_26D9391A8 table:@"Restrictions"];
    v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:v10 set:0 get:0 detail:0 cell:3 edit:0];
    uint64_t v16 = *MEMORY[0x263F60138];
    [v15 setObject:@"ALLOW" forKeyedSubscript:*MEMORY[0x263F60138]];

    v17 = [v12 localizedStringForKey:@"DontAllowChangesSpecifierName" value:&stru_26D9391A8 table:@"Restrictions"];
    v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v17 target:v10 set:0 get:0 detail:0 cell:3 edit:0];
    [v18 setObject:@"DISALLOW" forKeyedSubscript:v16];

    v19 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v19 setObject:@"ALLOW_GROUP" forKeyedSubscript:v16];
    v20 = [v12 localizedStringForKey:v29 value:&stru_26D9391A8 table:@"Restrictions"];

    [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x263F600F8]];
    v21 = [NSNumber numberWithBool:1];
    [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x263F60168]];

    if (v26) {
      v22 = v15;
    }
    else {
      v22 = v18;
    }
    [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x263F60200]];
    [v28 insertObject:v19 atIndex:0];
    [v28 insertObject:v15 atIndex:1];
    [v28 insertObject:v18 atIndex:2];

    allowedGroup = v10->_allowedGroup;
    v10->_allowedGroup = (PSSpecifier *)v19;

    v24 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v28;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  int v9 = [(STAllowTCCRestrictionsController *)self indexPathForIndex:[(STAllowTCCRestrictionsController *)self indexOfSpecifier:self->_allowedGroup]];
  uint64_t v10 = [v9 section];

  if (v8 == v10
    && [(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __70__STAllowTCCRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke;
    v31[3] = &unk_264767278;
    id v32 = v6;
    id v33 = v7;
    v34 = self;
    [(PSListController *)self st_showPINSheetWithCompletion:v31];

    id v11 = v32;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)STAllowTCCRestrictionsController;
    [(STAllowTCCRestrictionsController *)&v30 tableView:v6 didSelectRowAtIndexPath:v7];
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE78]));
    allowedGroup = self->_allowedGroup;
    v15 = self;
    id v16 = v12;
    id v11 = WeakRetained;
    v17 = allowedGroup;
    id v18 = v7;
    v19 = [(STAllowTCCRestrictionsController *)v15 indexPathForIndex:[(STAllowTCCRestrictionsController *)v15 indexOfSpecifier:v17]];
    uint64_t v20 = [v19 section];

    if ([v18 section] == v20)
    {
      id v29 = [v16 objectForKeyedSubscript:0x26D93CEC8];
      uint64_t v21 = [v29 restrictionType];
      [(STAllowTCCRestrictionsController *)v15 specifierAtIndex:[(STAllowTCCRestrictionsController *)v15 indexForIndexPath:v18]];
      v23 = id v22 = v6;
      v24 = [v23 identifier];
      v25 = v24;
      if (v21 == 1) {
        int v26 = @"DISALLOW";
      }
      else {
        int v26 = @"ALLOW";
      }
      uint64_t v27 = [v24 isEqualToString:v26];

      id v6 = v22;
      id v28 = [NSNumber numberWithBool:v27];
      [v16 performSetterWithValue:v28];

      [(PUITCCAccessController *)v15 updateSpecifiersForImposedSettings];
      [v11 reloadSpecifier:v16];
    }
  }
}

void __70__STAllowTCCRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v25.receiver = *(id *)(a1 + 48);
    v25.super_class = (Class)STAllowTCCRestrictionsController;
    objc_msgSendSuper2(&v25, sel_tableView_didSelectRowAtIndexPath_, v4, v3);
    v5 = *(char **)(a1 + 48);
    id v6 = *(void **)&v5[*MEMORY[0x263F5FE98]];
    id WeakRetained = objc_loadWeakRetained((id *)&v5[*MEMORY[0x263F5FE78]]);
    uint64_t v8 = *(void **)(a1 + 40);
    int v9 = *(void **)(*(void *)(a1 + 48) + 1464);
    uint64_t v10 = v5;
    id v11 = v6;
    id v12 = WeakRetained;
    id v13 = v9;
    id v14 = v8;
    v15 = objc_msgSend(v10, "indexPathForIndex:", objc_msgSend(v10, "indexOfSpecifier:", v13));
    uint64_t v16 = [v15 section];

    if ([v14 section] == v16)
    {
      v17 = [v11 objectForKeyedSubscript:0x26D93CEC8];
      uint64_t v18 = [v17 restrictionType];
      v19 = objc_msgSend(v10, "specifierAtIndex:", objc_msgSend(v10, "indexForIndexPath:", v14));
      uint64_t v20 = [v19 identifier];
      uint64_t v21 = v20;
      if (v18 == 1) {
        id v22 = @"DISALLOW";
      }
      else {
        id v22 = @"ALLOW";
      }
      uint64_t v23 = [v20 isEqualToString:v22];

      v24 = [NSNumber numberWithBool:v23];
      [v11 performSetterWithValue:v24];

      [v10 updateSpecifiersForImposedSettings];
      [v12 reloadSpecifier:v11];
    }
  }
}

- (void).cxx_destruct
{
}

- (void)specifiers
{
}

@end