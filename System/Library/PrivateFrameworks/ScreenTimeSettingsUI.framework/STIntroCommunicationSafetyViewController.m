@interface STIntroCommunicationSafetyViewController
- (STIntroCommunicationSafetyViewController)initWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5;
- (STIntroductionViewModel)model;
- (id)continueHandler;
- (void)_openCommunicationSafetyLearnMoreLink;
- (void)_turnOnCommunicationSafety:(id)a3;
- (void)loadView;
@end

@implementation STIntroCommunicationSafetyViewController

- (STIntroCommunicationSafetyViewController)initWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  v7 = (STIntroductionViewModel *)a3;
  id v8 = a5;
  v9 = +[STScreenTimeSettingsUIBundle bundle];
  v10 = [v9 localizedStringForKey:@"IntroCommunicationSafetyTitle" value:&stru_26D9391A8 table:0];
  v11 = [v9 localizedStringForKey:@"CommunicationSafetyEDUFeatureDetails" value:&stru_26D9391A8 table:0];
  v12 = (void *)MEMORY[0x263F82818];
  v13 = [MEMORY[0x263F825C8] tintColor];
  v14 = [v12 configurationWithHierarchicalColor:v13];

  v15 = [MEMORY[0x263F827E8] _systemImageNamed:@"bubble.left.and.exclamationmark.bubble.right.fill" withConfiguration:v14];
  v22.receiver = self;
  v22.super_class = (Class)STIntroCommunicationSafetyViewController;
  v16 = [(STIntroCommunicationSafetyViewController *)&v22 initWithTitle:v10 detailText:v11 icon:v15 contentLayout:2];
  model = v16->_model;
  v16->_model = v7;
  v18 = v7;

  uint64_t v19 = [v8 copy];
  id continueHandler = v16->_continueHandler;
  v16->_id continueHandler = (id)v19;

  return v16;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)STIntroCommunicationSafetyViewController;
  [(OBBaseWelcomeController *)&v10 loadView];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [(STIntroCommunicationSafetyViewController *)self buttonTray];
  v5 = [MEMORY[0x263F5B898] boldButton];
  v6 = [v3 localizedStringForKey:@"IntroCommunicationSafetyTurnOnButton" value:&stru_26D9391A8 table:0];
  [v5 setAccessibilityIdentifier:@"IntroCommunicationSafetyTurnOnButton"];
  [v5 setTitle:v6 forState:0];
  [v5 addTarget:self action:sel__turnOnCommunicationSafety_ forControlEvents:0x2000];
  [v4 addButton:v5];
  v7 = [MEMORY[0x263F5B8B8] accessoryButton];
  id v8 = [v3 localizedStringForKey:@"IntroCommunicationSafetyLearnMoreButton" value:&stru_26D9391A8 table:0];
  [v7 setAccessibilityIdentifier:@"IntroCommunicationSafetyLearnMoreButton"];
  [v7 setTitle:v8 forState:0];
  [v7 addTarget:self action:sel__openCommunicationSafetyLearnMoreLink forControlEvents:64];
  v9 = [(STIntroCommunicationSafetyViewController *)self headerView];
  [v9 addAccessoryButton:v7];
}

- (void)_turnOnCommunicationSafety:(id)a3
{
  v4 = [(STIntroCommunicationSafetyViewController *)self model];
  [v4 setCommunicationSafetyEnabled:MEMORY[0x263EFFA88]];

  v5 = [(STIntroCommunicationSafetyViewController *)self continueHandler];
  v5[2]();
}

- (void)_openCommunicationSafetyLearnMoreLink
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"https://support.apple.com/kb/HT212850"];
  [v3 openURL:v2 withOptions:0];
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