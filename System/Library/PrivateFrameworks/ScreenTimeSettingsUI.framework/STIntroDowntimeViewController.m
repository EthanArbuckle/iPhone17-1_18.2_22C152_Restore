@interface STIntroDowntimeViewController
- (STIntroDowntimeTableViewController)tableViewController;
- (STIntroDowntimeViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4;
- (STIntroductionViewModel)model;
- (id)continueHandler;
- (void)_notNow:(id)a3;
- (void)_setDowntime:(id)a3;
- (void)loadView;
- (void)setTableViewController:(id)a3;
@end

@implementation STIntroDowntimeViewController

- (STIntroDowntimeViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  v6 = (STIntroductionViewModel *)a3;
  id v7 = a4;
  v8 = +[STScreenTimeSettingsUIBundle bundle];
  v9 = [v8 localizedStringForKey:@"IntroDowntimeTitle" value:&stru_26D9391A8 table:0];
  v10 = [v8 localizedStringForKey:@"IntroDowntimeDetail" value:&stru_26D9391A8 table:0];
  v11 = (void *)MEMORY[0x263F82818];
  v12 = [MEMORY[0x263F825C8] tintColor];
  v13 = [v11 configurationWithHierarchicalColor:v12];

  v14 = [MEMORY[0x263F827E8] _systemImageNamed:@"downtime" withConfiguration:v13];
  v21.receiver = self;
  v21.super_class = (Class)STIntroDowntimeViewController;
  v15 = [(OBTableWelcomeController *)&v21 initWithTitle:v9 detailText:v10 icon:v14];
  model = v15->_model;
  v15->_model = v6;
  v17 = v6;

  uint64_t v18 = [v7 copy];
  id continueHandler = v15->_continueHandler;
  v15->_id continueHandler = (id)v18;

  return v15;
}

- (STIntroDowntimeTableViewController)tableViewController
{
  v4.receiver = self;
  v4.super_class = (Class)STIntroDowntimeViewController;
  v2 = [(STTableWelcomeController *)&v4 tableViewController];

  return (STIntroDowntimeTableViewController *)v2;
}

- (void)setTableViewController:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x263F08690] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"STIntroDowntimeViewController.m", 44, @"Invalid parameter not satisfying: %@", @"(tableViewController == nil) || [tableViewController isKindOfClass:[STIntroDowntimeTableViewController class]]" object file lineNumber description];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)STIntroDowntimeViewController;
  [(STTableWelcomeController *)&v7 setTableViewController:v5];
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)STIntroDowntimeViewController;
  [(OBTableWelcomeController *)&v13 loadView];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  objc_super v4 = [(STIntroDowntimeViewController *)self buttonTray];
  id v5 = [MEMORY[0x263F5B898] boldButton];
  v6 = [v3 localizedStringForKey:@"IntroDowntimeTurnOnDowntimeButton" value:&stru_26D9391A8 table:0];
  [v5 setAccessibilityIdentifier:@"IntroDowntimeTurnOnDowntimeButton"];
  [v5 setTitle:v6 forState:0];
  [v5 addTarget:self action:sel__setDowntime_ forControlEvents:0x2000];
  [v4 addButton:v5];
  objc_super v7 = [MEMORY[0x263F5B8D0] linkButton];
  v8 = [v3 localizedStringForKey:@"IntroDowntimeSetUpLaterButton" value:&stru_26D9391A8 table:0];
  [v7 setAccessibilityIdentifier:@"IntroDowntimeSetUpLaterButton"];
  [v7 setTitle:v8 forState:0];
  [v7 addTarget:self action:sel__notNow_ forControlEvents:0x2000];
  [v4 addButton:v7];
  v9 = (void *)MEMORY[0x263F82C28];
  v10 = +[STScreenTimeSettingsUIBundle bundle];
  v11 = [v9 storyboardWithName:@"STIntroDowntimeTableViewController" bundle:v10];

  v12 = [v11 instantiateInitialViewController];
  [(STIntroDowntimeViewController *)self setTableViewController:v12];
}

- (void)_setDowntime:(id)a3
{
  objc_super v4 = [(STIntroDowntimeViewController *)self tableViewController];
  id v7 = [v4 bedtime];

  [v7 setDeviceBedtimeEnabled:1];
  id v5 = [(STIntroDowntimeViewController *)self model];
  [v5 setBedtime:v7];

  v6 = [(STIntroDowntimeViewController *)self continueHandler];
  v6[2]();
}

- (void)_notNow:(id)a3
{
  v3 = [(STIntroDowntimeViewController *)self continueHandler];
  v3[2]();
}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 1248, 1);
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1256, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end