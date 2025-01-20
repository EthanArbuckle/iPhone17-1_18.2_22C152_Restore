@interface PSUIOtherOptionsGroup
- (PSListController)listController;
- (PSUIOtherOptionsGroup)init;
- (PSUIOtherOptionsGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getLogger;
- (id)specifiers;
- (void)otherOptionsPressed:(id)a3;
- (void)setListController:(id)a3;
@end

@implementation PSUIOtherOptionsGroup

- (PSUIOtherOptionsGroup)init
{
}

- (PSUIOtherOptionsGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSUIOtherOptionsGroup;
  v8 = [(PSUIOtherOptionsGroup *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeStrong((id *)&v9->_groupSpecifier, a4);
    groupSpecifier = v9->_groupSpecifier;
    v11 = NSString;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"OTHER_OPTIONS_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];
    v14 = [v11 stringWithFormat:v13];
    [(PSSpecifier *)groupSpecifier setProperty:v14 forKey:*MEMORY[0x263F600F8]];
  }
  return v9;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26D410CA0 table:@"Cellular"];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setButtonAction:sel_otherOptionsPressed_];
  [v3 addObject:v7];

  return v3;
}

- (void)otherOptionsPressed:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F829B8]);
  v5 = objc_alloc_init(PSUIAddNewPlanController);
  id v7 = (id)[v4 initWithRootViewController:v5];

  [v7 setModalPresentationStyle:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained presentViewController:v7 animated:1 completion:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"OtherOptions"];
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end