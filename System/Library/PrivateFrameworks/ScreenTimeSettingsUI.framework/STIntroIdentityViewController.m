@interface STIntroIdentityViewController
- (STIntroIdentityViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4;
- (STIntroductionViewModel)model;
- (id)continueHandler;
- (void)_myChildsDevice:(id)a3;
- (void)_myDevice:(id)a3;
- (void)loadView;
@end

@implementation STIntroIdentityViewController

- (STIntroIdentityViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  v6 = (STIntroductionViewModel *)a3;
  id v7 = a4;
  v8 = +[STScreenTimeSettingsUIBundle bundle];
  v9 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"IntroIdentityTitle"];
  v10 = [v8 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];

  v11 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"IntroIdentityDetail"];
  v12 = [v8 localizedStringForKey:v11 value:&stru_26D9391A8 table:0];

  v13 = (void *)MEMORY[0x263F82818];
  v14 = [MEMORY[0x263F825C8] tintColor];
  v15 = [v13 configurationWithHierarchicalColor:v14];

  v16 = [MEMORY[0x263F827E8] _systemImageNamed:@"person.2.fill" withConfiguration:v15];
  v23.receiver = self;
  v23.super_class = (Class)STIntroIdentityViewController;
  v17 = [(STIntroIdentityViewController *)&v23 initWithTitle:v10 detailText:v12 icon:v16 contentLayout:2];
  model = v17->_model;
  v17->_model = v6;
  v19 = v6;

  uint64_t v20 = [v7 copy];
  id continueHandler = v17->_continueHandler;
  v17->_id continueHandler = (id)v20;

  return v17;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)STIntroIdentityViewController;
  [(OBBaseWelcomeController *)&v11 loadView];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [(STIntroIdentityViewController *)self buttonTray];
  v5 = [MEMORY[0x263F5B898] boldButton];
  v6 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"IntroIdentityButtonMyDevice"];
  id v7 = [v3 localizedStringForKey:v6 value:&stru_26D9391A8 table:0];

  [v5 setTitle:v7 forState:0];
  [v5 addTarget:self action:sel__myDevice_ forControlEvents:0x2000];
  [v4 addButton:v5];
  v8 = [MEMORY[0x263F5B8D0] linkButton];
  v9 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"IntroIdentityButtonMyChildsDevice"];
  v10 = [v3 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];

  [v8 setTitle:v10 forState:0];
  [v8 addTarget:self action:sel__myChildsDevice_ forControlEvents:0x2000];
  [v4 addButton:v8];
}

- (void)_myDevice:(id)a3
{
  v4 = [(STIntroIdentityViewController *)self model];
  [v4 setDeviceForChild:0];

  v5 = [(STIntroIdentityViewController *)self continueHandler];
  v5[2]();
}

- (void)_myChildsDevice:(id)a3
{
  v4 = [(STIntroIdentityViewController *)self model];
  [v4 setDeviceForChild:1];

  v5 = [(STIntroIdentityViewController *)self continueHandler];
  v5[2]();
}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 1184, 1);
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end