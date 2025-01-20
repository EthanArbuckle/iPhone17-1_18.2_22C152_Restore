@interface STIntroAppLimitsViewController
- (OBBoldTrayButton)setAppLimitButton;
- (STIntroAppLimitsTableViewController)tableViewController;
- (STIntroAppLimitsViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4;
- (STIntroductionViewModel)model;
- (id)continueHandler;
- (void)_allowanceSelectedCategoriesDidChange:(id)a3;
- (void)_allowanceTimeDidChange:(id)a3;
- (void)_notNow:(id)a3;
- (void)_setAppLimit:(id)a3;
- (void)_updateSetAppLimitButtonWithTime:(id)a3 selectedCategories:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSetAppLimitButton:(id)a3;
- (void)setTableViewController:(id)a3;
@end

@implementation STIntroAppLimitsViewController

- (STIntroAppLimitsViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  v6 = (STIntroductionViewModel *)a3;
  id v7 = a4;
  v8 = +[STScreenTimeSettingsUIBundle bundle];
  v9 = [v8 localizedStringForKey:@"IntroAppLimitsTitle" value:&stru_26D9391A8 table:0];
  v10 = [v8 localizedStringForKey:@"IntroAppLimitsDetail" value:&stru_26D9391A8 table:0];
  v11 = (void *)MEMORY[0x263F82818];
  v12 = [MEMORY[0x263F825C8] tintColor];
  v13 = [v11 configurationWithHierarchicalColor:v12];

  v14 = [MEMORY[0x263F827E8] _systemImageNamed:@"hourglass" withConfiguration:v13];
  v21.receiver = self;
  v21.super_class = (Class)STIntroAppLimitsViewController;
  v15 = [(OBTableWelcomeController *)&v21 initWithTitle:v9 detailText:v10 icon:v14];
  model = v15->_model;
  v15->_model = v6;
  v17 = v6;

  uint64_t v18 = [v7 copy];
  id continueHandler = v15->_continueHandler;
  v15->_id continueHandler = (id)v18;

  return v15;
}

- (void)dealloc
{
  v3 = [(STIntroAppLimitsViewController *)self tableViewController];
  [v3 removeObserver:self forKeyPath:@"allowance.time" context:"KVOContextIntroAppLimitsViewController"];
  [v3 removeObserver:self forKeyPath:@"allowance.categoryIdentifiers" context:"KVOContextIntroAppLimitsViewController"];

  v4.receiver = self;
  v4.super_class = (Class)STIntroAppLimitsViewController;
  [(STTableWelcomeController *)&v4 dealloc];
}

- (STIntroAppLimitsTableViewController)tableViewController
{
  v4.receiver = self;
  v4.super_class = (Class)STIntroAppLimitsViewController;
  v2 = [(STTableWelcomeController *)&v4 tableViewController];

  return (STIntroAppLimitsTableViewController *)v2;
}

- (void)setTableViewController:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"STIntroAppLimitsViewController.m", 57, @"Invalid parameter not satisfying: %@", @"(tableViewController == nil) || [tableViewController isKindOfClass:[STIntroAppLimitsTableViewController class]]" object file lineNumber description];
    }
  }
  v6 = [(STIntroAppLimitsViewController *)self tableViewController];
  [v6 removeObserver:self forKeyPath:@"allowance.time" context:"KVOContextIntroAppLimitsViewController"];
  [v6 removeObserver:self forKeyPath:@"allowance.categoryIdentifiers" context:"KVOContextIntroAppLimitsViewController"];
  v8.receiver = self;
  v8.super_class = (Class)STIntroAppLimitsViewController;
  [(STTableWelcomeController *)&v8 setTableViewController:v5];
  [v5 addObserver:self forKeyPath:@"allowance.time" options:1 context:"KVOContextIntroAppLimitsViewController"];
  [v5 addObserver:self forKeyPath:@"allowance.categoryIdentifiers" options:5 context:"KVOContextIntroAppLimitsViewController"];
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)STIntroAppLimitsViewController;
  [(OBTableWelcomeController *)&v13 loadView];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  objc_super v4 = [(STIntroAppLimitsViewController *)self buttonTray];
  id v5 = [MEMORY[0x263F5B898] boldButton];
  v6 = [v3 localizedStringForKey:@"IntroAppLimitsSetAppLimitButton" value:&stru_26D9391A8 table:0];
  [v5 setAccessibilityIdentifier:@"IntroAppLimitsSetAppLimitButton"];
  [v5 setTitle:v6 forState:0];
  [v5 addTarget:self action:sel__setAppLimit_ forControlEvents:0x2000];
  [v5 setEnabled:0];
  [v4 addButton:v5];
  [(STIntroAppLimitsViewController *)self setSetAppLimitButton:v5];
  id v7 = [MEMORY[0x263F5B8D0] linkButton];
  objc_super v8 = [v3 localizedStringForKey:@"IntroAppLimitsSetUpLaterButton" value:&stru_26D9391A8 table:0];
  [v7 setAccessibilityIdentifier:@"IntroAppLimitsSetUpLaterButton"];
  [v7 setTitle:v8 forState:0];
  [v7 addTarget:self action:sel__notNow_ forControlEvents:0x2000];
  [v4 addButton:v7];
  v9 = (void *)MEMORY[0x263F82C28];
  v10 = +[STScreenTimeSettingsUIBundle bundle];
  v11 = [v9 storyboardWithName:@"STIntroAppLimitsTableViewController" bundle:v10];

  v12 = [v11 instantiateInitialViewController];
  [(STIntroAppLimitsViewController *)self setTableViewController:v12];
}

- (void)_setAppLimit:(id)a3
{
  objc_super v4 = [(STIntroAppLimitsViewController *)self tableViewController];
  id v5 = [v4 allowance];
  v6 = [(STIntroAppLimitsViewController *)self model];
  [v6 setAllowance:v5];

  id v7 = [(STIntroAppLimitsViewController *)self continueHandler];
  v7[2]();
}

- (void)_notNow:(id)a3
{
  v3 = [(STIntroAppLimitsViewController *)self continueHandler];
  v3[2]();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextIntroAppLimitsViewController")
  {
    if ([v10 isEqualToString:@"allowance.time"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      objc_super v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      [(STIntroAppLimitsViewController *)self _allowanceTimeDidChange:v12];
    }
    else
    {
      if (![v10 isEqualToString:@"allowance.categoryIdentifiers"]) {
        goto LABEL_12;
      }
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v14 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v14)
      {

        v12 = 0;
      }
      [(STIntroAppLimitsViewController *)self _allowanceSelectedCategoriesDidChange:v12];
    }

    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)STIntroAppLimitsViewController;
  [(STTableWelcomeController *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_12:
}

- (void)_allowanceTimeDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [(STIntroAppLimitsViewController *)self tableViewController];
  id v5 = [v7 allowance];
  v6 = [v5 categoryIdentifiers];
  [(STIntroAppLimitsViewController *)self _updateSetAppLimitButtonWithTime:v4 selectedCategories:v6];
}

- (void)_allowanceSelectedCategoriesDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [(STIntroAppLimitsViewController *)self tableViewController];
  id v5 = [v7 allowance];
  v6 = [v5 time];
  [(STIntroAppLimitsViewController *)self _updateSetAppLimitButtonWithTime:v6 selectedCategories:v4];
}

- (void)_updateSetAppLimitButtonWithTime:(id)a3 selectedCategories:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  BOOL v8 = v10
    && (+[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:"), v7 > 0.0)&& [v6 count] != 0;
  v9 = [(STIntroAppLimitsViewController *)self setAppLimitButton];
  [v9 setEnabled:v8];
}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 1248, 1);
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1256, 1);
}

- (OBBoldTrayButton)setAppLimitButton
{
  return (OBBoldTrayButton *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setSetAppLimitButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAppLimitButton, 0);
  objc_storeStrong(&self->_continueHandler, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end