@interface PUIAllowLocationRestrictionsController
- (id)specifiers;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PUIAllowLocationRestrictionsController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)PUIAllowLocationRestrictionsController;
    v5 = [(PUILocationServicesListController *)&v24 specifiers];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[PUIAllowLocationRestrictionsController specifiers]();
    }
    v6 = (void *)MEMORY[0x1E4F92E70];
    v7 = PUI_LocalizedStringForRestrictions(@"ALLOW_CHANGES_VALUE");
    v8 = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v9 = *MEMORY[0x1E4F93188];
    [v8 setProperty:@"ALLOW" forKey:*MEMORY[0x1E4F93188]];
    v10 = (void *)MEMORY[0x1E4F92E70];
    v11 = PUI_LocalizedStringForRestrictions(@"DONT_ALLOW_CHANGES_VALUE");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setProperty:@"DISALLOW" forKey:v9];
    v13 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    [v13 setProperty:@"ALLOW_GROUP" forKey:v9];
    v14 = PUI_LocalizedStringForRestrictions(@"LOCATION_EXPLANATION");
    [v13 setProperty:v14 forKey:*MEMORY[0x1E4F93170]];

    v15 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v13 setProperty:v15 forKey:*MEMORY[0x1E4F931A8]];

    v16 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) performGetter];
    int v17 = [v16 BOOLValue];

    if (v17) {
      v18 = v8;
    }
    else {
      v18 = v12;
    }
    [v13 setProperty:v18 forKey:*MEMORY[0x1E4F931D8]];
    [v5 insertObject:v13 atIndex:0];
    [v5 insertObject:v8 atIndex:1];
    [v5 insertObject:v12 atIndex:2];
    allowedGroup = self->_allowedGroup;
    self->_allowedGroup = (PSSpecifier *)v13;
    id v20 = v13;

    v21 = self;
    objc_sync_enter(v21);
    v22 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_sync_exit(v21);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUIAllowLocationRestrictionsController;
  [(PUIAllowLocationRestrictionsController *)&v17 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [v6 section];
  v8 = [(PUIAllowLocationRestrictionsController *)self indexPathForIndex:[(PUIAllowLocationRestrictionsController *)self indexOfSpecifier:self->_allowedGroup]];
  uint64_t v9 = [v8 section];

  if (v7 == v9)
  {
    v10 = [(PUIAllowLocationRestrictionsController *)self specifierAtIndex:[(PUIAllowLocationRestrictionsController *)self indexForIndexPath:v6]];
    v11 = [v10 identifier];
    uint64_t v12 = [v11 isEqualToString:@"ALLOW"];

    uint64_t v13 = (int)*MEMORY[0x1E4F92FA0];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13);
    v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
    [v14 performSetterWithValue:v15];

    [(PUILocationServicesListController *)self updateSpecifiersForImposedSettings];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E4F92F90]));
    [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v13)];
  }
}

- (void).cxx_destruct
{
}

- (void)specifiers
{
}

@end