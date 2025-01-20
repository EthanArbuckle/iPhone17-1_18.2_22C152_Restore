@interface STIntroAppAndWebsiteActivityViewController
- (STIntroAppAndWebsiteActivityViewController)initWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5;
- (STIntroductionViewModel)model;
- (id)continueHandler;
- (void)_setUpLater:(id)a3;
- (void)_turnOnAppAndWebsiteActivity:(id)a3;
- (void)loadView;
@end

@implementation STIntroAppAndWebsiteActivityViewController

- (STIntroAppAndWebsiteActivityViewController)initWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  v8 = (STIntroductionViewModel *)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[STScreenTimeSettingsUIBundle bundle];
  if ([v9 length])
  {
    v12 = [v11 localizedStringForKey:@"IntroAppAndWebsiteActivityTitleChild" value:&stru_26D9391A8 table:0];
    id v13 = [NSString alloc];
    v14 = [MEMORY[0x263EFF960] currentLocale];
    v15 = objc_msgSend(v13, "initWithFormat:locale:", v12, v14, v9);

    v16 = [v11 localizedStringForKey:@"IntroAppAndWebsiteActivityDetailChild" value:&stru_26D9391A8 table:0];
    id v17 = [NSString alloc];
    v18 = [MEMORY[0x263EFF960] currentLocale];
    v19 = objc_msgSend(v17, "initWithFormat:locale:", v16, v18, v9);
  }
  else
  {
    v15 = [v11 localizedStringForKey:@"IntroAppAndWebsiteActivityTitleGenericChild" value:&stru_26D9391A8 table:0];
    v19 = [v11 localizedStringForKey:@"IntroAppAndWebsiteActivityDetailGenericChild" value:&stru_26D9391A8 table:0];
  }
  v20 = (void *)MEMORY[0x263F82818];
  v21 = [MEMORY[0x263F825C8] tintColor];
  v22 = [v20 configurationWithHierarchicalColor:v21];

  v23 = [MEMORY[0x263F827E8] _systemImageNamed:@"person.badge.hourglass.fill" withConfiguration:v22];
  v30.receiver = self;
  v30.super_class = (Class)STIntroAppAndWebsiteActivityViewController;
  v24 = [(STIntroAppAndWebsiteActivityViewController *)&v30 initWithTitle:v15 detailText:v19 icon:v23 contentLayout:2];
  model = v24->_model;
  v24->_model = v8;
  v26 = v8;

  uint64_t v27 = [v10 copy];
  id continueHandler = v24->_continueHandler;
  v24->_id continueHandler = (id)v27;

  return v24;
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)STIntroAppAndWebsiteActivityViewController;
  [(OBBaseWelcomeController *)&v19 loadView];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v18 = [MEMORY[0x263F82818] configurationPreferringMonochrome];
  id v17 = [MEMORY[0x263F827E8] _systemImageNamed:@"chart.line.uptrend.xyaxis" withConfiguration:v18];
  v14 = [MEMORY[0x263F827E8] _systemImageNamed:@"downtime" withConfiguration:v18];
  v11 = [MEMORY[0x263F827E8] _systemImageNamed:@"hourglass" withConfiguration:v18];
  v16 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityScreenTimeInsightsTitle" value:&stru_26D9391A8 table:0];
  v15 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityScreenTimeInsightsDetail" value:&stru_26D9391A8 table:0];
  [(STIntroAppAndWebsiteActivityViewController *)self addBulletedListItemWithTitle:v16 description:v15 image:v17];
  id v13 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityScheduledDowntimeTitle" value:&stru_26D9391A8 table:0];
  v12 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityScheduledDowntimeDetail" value:&stru_26D9391A8 table:0];
  [(STIntroAppAndWebsiteActivityViewController *)self addBulletedListItemWithTitle:v13 description:v12 image:v14];
  v4 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityAppLimitsTitle" value:&stru_26D9391A8 table:0];
  v5 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityAppLimitsDetail" value:&stru_26D9391A8 table:0];
  [(STIntroAppAndWebsiteActivityViewController *)self addBulletedListItemWithTitle:v4 description:v5 image:v11];
  v6 = [(STIntroAppAndWebsiteActivityViewController *)self buttonTray];
  v7 = [MEMORY[0x263F5B898] boldButton];
  v8 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivityTurnOnButton" value:&stru_26D9391A8 table:0];
  [v7 setAccessibilityIdentifier:@"IntroAppAndWebsiteActivityTurnOnButton"];
  [v7 setTitle:v8 forState:0];
  [v7 addTarget:self action:sel__turnOnAppAndWebsiteActivity_ forControlEvents:0x2000];
  [v6 addButton:v7];
  id v9 = [MEMORY[0x263F5B8D0] linkButton];
  id v10 = [v3 localizedStringForKey:@"IntroAppAndWebsiteActivitySetUpLaterButton" value:&stru_26D9391A8 table:0];
  [v9 setAccessibilityIdentifier:@"IntroAppAndWebsiteActivitySetUpLaterButton"];
  [v9 setTitle:v10 forState:0];
  [v9 addTarget:self action:sel__setUpLater_ forControlEvents:0x2000];
  [v6 addButton:v9];
}

- (void)_turnOnAppAndWebsiteActivity:(id)a3
{
  v4 = [(STIntroAppAndWebsiteActivityViewController *)self model];
  [v4 setAppAndWebsiteActivityEnabled:MEMORY[0x263EFFA88]];

  v5 = [(STIntroAppAndWebsiteActivityViewController *)self continueHandler];
  v5[2]();
}

- (void)_setUpLater:(id)a3
{
  v4 = [(STIntroAppAndWebsiteActivityViewController *)self model];
  [v4 setAppAndWebsiteActivityEnabled:MEMORY[0x263EFFA80]];

  v5 = [(STIntroAppAndWebsiteActivityViewController *)self continueHandler];
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