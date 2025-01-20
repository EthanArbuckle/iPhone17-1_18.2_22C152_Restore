@interface STIntroWelcomeViewController
- (BOOL)forceParentalControls;
- (NSString)childName;
- (STIntroWelcomeViewController)initWithChildName:(id)a3 forceParentalControls:(BOOL)a4 continueHandler:(id)a5 endHandler:(id)a6;
- (id)continueHandler;
- (id)endHandler;
- (void)_turnOnScreenTime:(id)a3;
- (void)loadView;
@end

@implementation STIntroWelcomeViewController

- (STIntroWelcomeViewController)initWithChildName:(id)a3 forceParentalControls:(BOOL)a4 continueHandler:(id)a5 endHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  v13 = +[STScreenTimeSettingsUIBundle bundle];
  v14 = v13;
  if (!v8)
  {
    v15 = [v13 localizedStringForKey:@"IntroWelcomeTitle" value:&stru_26D9391A8 table:0];
    v18 = @"AADC_IntroWelcomeDetail";
    v19 = v14;
LABEL_6:
    v17 = [v19 localizedStringForKey:v18 value:&stru_26D9391A8 table:0];
    goto LABEL_7;
  }
  v15 = [v13 localizedStringForKey:@"IntroWelcomeTitleChild" value:&stru_26D9391A8 table:0];
  if (![v10 length])
  {
    v18 = @"AADC_IntroWelcomeDetailGenericChild";
    v19 = v14;
    goto LABEL_6;
  }
  v16 = [v14 localizedStringForKey:@"AADC_IntroWelcomeDetailChild" value:&stru_26D9391A8 table:0];
  v17 = [NSString localizedStringWithValidatedFormat:v16, @"%@ %@", 0, v10, v10 validFormatSpecifiers error];

LABEL_7:
  v20 = (void *)MEMORY[0x263F82818];
  v21 = [MEMORY[0x263F825C8] tintColor];
  v22 = [v20 configurationWithHierarchicalColor:v21];

  v23 = [MEMORY[0x263F827E8] _systemImageNamed:@"hourglass" withConfiguration:v22];
  v32.receiver = self;
  v32.super_class = (Class)STIntroWelcomeViewController;
  v24 = [(STIntroWelcomeViewController *)&v32 initWithTitle:v15 detailText:v17 icon:v23 contentLayout:2];
  uint64_t v25 = [v10 copy];
  childName = v24->_childName;
  v24->_childName = (NSString *)v25;

  v24->_forceParentalControls = v8;
  uint64_t v27 = [v12 copy];

  id continueHandler = v24->_continueHandler;
  v24->_id continueHandler = (id)v27;

  uint64_t v29 = [v11 copy];
  id endHandler = v24->_endHandler;
  v24->_id endHandler = (id)v29;

  return v24;
}

- (void)loadView
{
  v27.receiver = self;
  v27.super_class = (Class)STIntroWelcomeViewController;
  [(OBBaseWelcomeController *)&v27 loadView];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v4 = [MEMORY[0x263F82818] configurationPreferringMonochrome];
  v5 = [MEMORY[0x263F827E8] _systemImageNamed:@"chart.bar.xaxis" withConfiguration:v4];
  uint64_t v6 = [MEMORY[0x263F827E8] _systemImageNamed:@"figure.and.child.holdinghands" withConfiguration:v4];
  uint64_t v25 = (void *)v4;
  v7 = [MEMORY[0x263F827E8] _systemImageNamed:@"downtime" withConfiguration:v4];
  uint64_t v8 = [v3 localizedStringForKey:@"IntroWelcomeContentPrivacyTitle" value:&stru_26D9391A8 table:0];
  v23 = [v3 localizedStringForKey:@"IntroWelcomeContentPrivacyDetail" value:&stru_26D9391A8 table:0];
  v24 = (void *)v8;
  v26 = (void *)v6;
  -[STIntroWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v8);
  v9 = [v3 localizedStringForKey:@"IntroWelcomeWeeklyReportsTitle" value:&stru_26D9391A8 table:0];
  if (![(STIntroWelcomeViewController *)self forceParentalControls])
  {
    v17 = @"IntroWelcomeWeeklyReportsDetail";
LABEL_6:
    v16 = [v3 localizedStringForKey:v17 value:&stru_26D9391A8 table:0];
    goto LABEL_7;
  }
  id v10 = [(STIntroWelcomeViewController *)self childName];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    v17 = @"IntroWelcomeWeeklyReportsDetailGenericChild";
    goto LABEL_6;
  }
  id v12 = [v3 localizedStringForKey:@"IntroWelcomeWeeklyReportsDetailChild" value:&stru_26D9391A8 table:0];
  id v13 = [NSString alloc];
  v14 = [MEMORY[0x263EFF960] currentLocale];
  v15 = [(STIntroWelcomeViewController *)self childName];
  v16 = objc_msgSend(v13, "initWithFormat:locale:", v12, v14, v15);

LABEL_7:
  [(STIntroWelcomeViewController *)self addBulletedListItemWithTitle:v9 description:v16 image:v5];
  v18 = [v3 localizedStringForKey:@"IntroWelcomeDowntimeTitle" value:&stru_26D9391A8 table:0];
  v19 = [v3 localizedStringForKey:@"IntroWelcomeDowntimeDetail" value:&stru_26D9391A8 table:0];
  [(STIntroWelcomeViewController *)self addBulletedListItemWithTitle:v18 description:v19 image:v7];
  v20 = [MEMORY[0x263F5B898] boldButton];
  v21 = [v3 localizedStringForKey:@"IntroButtonTurnOnScreenTime" value:&stru_26D9391A8 table:0];
  [v20 setAccessibilityIdentifier:@"IntroButtonTurnOnScreenTime"];
  [v20 setTitle:v21 forState:0];
  [v20 addTarget:self action:sel__turnOnScreenTime_ forControlEvents:0x2000];
  v22 = [(STIntroWelcomeViewController *)self buttonTray];
  [v22 addButton:v20];
}

- (void)_turnOnScreenTime:(id)a3
{
  v3 = [(STIntroWelcomeViewController *)self continueHandler];
  v3[2]();
}

- (NSString)childName
{
  return (NSString *)objc_getProperty(self, a2, 1192, 1);
}

- (BOOL)forceParentalControls
{
  return self->_forceParentalControls;
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1200, 1);
}

- (id)endHandler
{
  return objc_getProperty(self, a2, 1208, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endHandler, 0);
  objc_storeStrong(&self->_continueHandler, 0);

  objc_storeStrong((id *)&self->_childName, 0);
}

@end