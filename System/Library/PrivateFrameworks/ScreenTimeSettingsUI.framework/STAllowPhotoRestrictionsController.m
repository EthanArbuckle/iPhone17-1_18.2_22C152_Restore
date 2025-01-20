@interface STAllowPhotoRestrictionsController
- (STRootViewModelCoordinator)coordinator;
- (id)specifiers;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation STAllowPhotoRestrictionsController

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
    v23.super_class = (Class)STAllowPhotoRestrictionsController;
    v5 = [(PUIPhotosPrivacyController *)&v23 specifiers];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[STAllowPhotoRestrictionsController specifiers]();
    }
    v22 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) performGetter];
    int v21 = [v22 BOOLValue];
    v6 = self;
    id v7 = v5;
    v8 = +[STScreenTimeSettingsUIBundle bundle];
    v9 = [v8 localizedStringForKey:@"AllowChangesSpecifierName" value:&stru_26D9391A8 table:@"Restrictions"];
    v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:v6 set:0 get:0 detail:0 cell:3 edit:0];
    uint64_t v11 = *MEMORY[0x263F60138];
    [v10 setObject:@"ALLOW" forKeyedSubscript:*MEMORY[0x263F60138]];

    v12 = [v8 localizedStringForKey:@"DontAllowChangesSpecifierName" value:&stru_26D9391A8 table:@"Restrictions"];
    v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v12 target:v6 set:0 get:0 detail:0 cell:3 edit:0];
    [v13 setObject:@"DISALLOW" forKeyedSubscript:v11];

    v14 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v14 setObject:@"ALLOW_GROUP" forKeyedSubscript:v11];
    v15 = [v8 localizedStringForKey:@"PHOTOS_EXPLANATION" value:&stru_26D9391A8 table:@"Restrictions"];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600F8]];
    v16 = [NSNumber numberWithBool:1];
    [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x263F60168]];

    if (v21) {
      v17 = v10;
    }
    else {
      v17 = v13;
    }
    [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x263F60200]];
    [v7 insertObject:v14 atIndex:0];
    [v7 insertObject:v10 atIndex:1];
    [v7 insertObject:v13 atIndex:2];

    allowedGroup = v6->_allowedGroup;
    v6->_allowedGroup = (PSSpecifier *)v14;

    v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v7;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  v9 = [(STAllowPhotoRestrictionsController *)self indexPathForIndex:[(STAllowPhotoRestrictionsController *)self indexOfSpecifier:self->_allowedGroup]];
  uint64_t v10 = [v9 section];

  if (v8 == v10
    && [(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __72__STAllowPhotoRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke;
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
    v30.super_class = (Class)STAllowPhotoRestrictionsController;
    [(STAllowPhotoRestrictionsController *)&v30 tableView:v6 didSelectRowAtIndexPath:v7];
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE78]));
    allowedGroup = self->_allowedGroup;
    v15 = self;
    id v16 = v12;
    id v11 = WeakRetained;
    v17 = allowedGroup;
    id v18 = v7;
    v19 = [(STAllowPhotoRestrictionsController *)v15 indexPathForIndex:[(STAllowPhotoRestrictionsController *)v15 indexOfSpecifier:v17]];
    uint64_t v20 = [v19 section];

    if ([v18 section] == v20)
    {
      v29 = [v16 objectForKeyedSubscript:0x26D93CEC8];
      uint64_t v21 = [v29 restrictionType];
      [(STAllowPhotoRestrictionsController *)v15 specifierAtIndex:[(STAllowPhotoRestrictionsController *)v15 indexForIndexPath:v18]];
      objc_super v23 = v22 = v6;
      v24 = [v23 identifier];
      v25 = v24;
      if (v21 == 1) {
        v26 = @"DISALLOW";
      }
      else {
        v26 = @"ALLOW";
      }
      uint64_t v27 = [v24 isEqualToString:v26];

      id v6 = v22;
      v28 = [NSNumber numberWithBool:v27];
      [v16 performSetterWithValue:v28];

      [(PUIPhotosPrivacyController *)v15 updateSpecifiersForImposedSettings];
      [v11 reloadSpecifier:v16];
    }
  }
}

void __72__STAllowPhotoRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    v25.receiver = *(id *)(a1 + 48);
    v25.super_class = (Class)STAllowPhotoRestrictionsController;
    objc_msgSendSuper2(&v25, sel_tableView_didSelectRowAtIndexPath_, v4, v3);
    v5 = *(char **)(a1 + 48);
    id v6 = *(void **)&v5[*MEMORY[0x263F5FE98]];
    id WeakRetained = objc_loadWeakRetained((id *)&v5[*MEMORY[0x263F5FE78]]);
    uint64_t v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(void *)(a1 + 48) + 1472);
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