@interface STEyeReliefIntroHowItWorksViewController
- (BOOL)forChecklistFlow;
- (id)completionHandler;
- (id)initForChecklistFlow:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_enable;
- (void)setCompletionHandler:(id)a3;
- (void)setForChecklistFlow:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation STEyeReliefIntroHowItWorksViewController

- (id)initForChecklistFlow:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = v7;
  if (v4) {
    v9 = @"ChecklistScreenDistanceTitle";
  }
  else {
    v9 = @"ScreenDistanceEDUFeatureHowItWorksTitle";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];
  v11 = [v8 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksDetailText" value:&stru_26D9391A8 table:0];
  v12 = (void *)MEMORY[0x263F82818];
  v13 = [MEMORY[0x263F825C8] tintColor];
  v14 = [v12 configurationWithHierarchicalColor:v13];

  v15 = [MEMORY[0x263F827E8] _systemImageNamed:@"chevron.3.up.perspective.and.rectangle" withConfiguration:v14];
  v20.receiver = self;
  v20.super_class = (Class)STEyeReliefIntroHowItWorksViewController;
  v16 = [(STEyeReliefIntroHowItWorksViewController *)&v20 initWithTitle:v10 detailText:v11 icon:v15 contentLayout:2];
  v17 = _Block_copy(v6);

  id completionHandler = v16->_completionHandler;
  v16->_id completionHandler = v17;

  v16->_forChecklistFlow = v4;
  return v16;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)STEyeReliefIntroHowItWorksViewController;
  [(OBBaseWelcomeController *)&v33 viewDidLoad];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksFirstListItemTitle" value:&stru_26D9391A8 table:0];
  v5 = [MEMORY[0x263EFF960] currentLocale];
  int v6 = [v5 usesMetricSystem];

  id v7 = objc_alloc(MEMORY[0x263F08980]);
  if (v6)
  {
    v8 = [MEMORY[0x263F08CE8] centimeters];
    double v9 = 30.0;
  }
  else
  {
    v8 = [MEMORY[0x263F08CE8] inches];
    double v9 = 12.0;
  }
  uint64_t v10 = [v7 initWithDoubleValue:v8 unit:v9];

  id v11 = objc_alloc_init(MEMORY[0x263F08988]);
  [v11 setUnitOptions:1];
  [v11 setUnitStyle:3];
  v30 = (void *)v10;
  uint64_t v12 = [v11 stringFromMeasurement:v10];
  v13 = NSString;
  v14 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksFirstListItemDetailText" value:&stru_26D9391A8 table:0];
  v29 = (void *)v12;
  uint64_t v15 = [v13 localizedStringWithValidatedFormat:v14, @"%@", 0, v12 validFormatSpecifiers error];

  [MEMORY[0x263F827E8] systemImageNamed:@"eye.fill"];
  v27 = v31 = (void *)v4;
  v28 = (void *)v15;
  -[STEyeReliefIntroHowItWorksViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v4, v15);
  uint64_t v16 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksSecondListItemTitle" value:&stru_26D9391A8 table:0];
  uint64_t v17 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksSecondListItemDetailText" value:&stru_26D9391A8 table:0];
  v18 = [MEMORY[0x263F827E8] systemImageNamed:@"lock.shield.fill"];
  v25 = (void *)v17;
  v26 = (void *)v16;
  [(STEyeReliefIntroHowItWorksViewController *)self addBulletedListItemWithTitle:v16 description:v17 image:v18];
  v19 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksThirdListItemTitle" value:&stru_26D9391A8 table:0];
  objc_super v20 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksThirdListItemDetailText" value:&stru_26D9391A8 table:0];
  v21 = [MEMORY[0x263F827E8] systemImageNamed:@"ruler.fill"];
  [(STEyeReliefIntroHowItWorksViewController *)self addBulletedListItemWithTitle:v19 description:v20 image:v21];
  v22 = [MEMORY[0x263F5B898] boldButton];
  v23 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureHowItWorksEnablementButton" value:&stru_26D9391A8 table:0];
  [v22 setAccessibilityIdentifier:@"ScreenDistanceEDUFeatureHowItWorksEnablementButton"];
  [v22 setTitle:v23 forState:0];
  [v22 addTarget:self action:sel__enable forControlEvents:64];
  v24 = [(STEyeReliefIntroHowItWorksViewController *)self buttonTray];
  [v24 addButton:v22];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STEyeReliefIntroHowItWorksViewController.viewDidLoad", buf, 2u);
  }
}

- (void)_enable
{
  v3 = [(STEyeReliefIntroHowItWorksViewController *)self completionHandler];

  if (v3)
  {
    uint64_t v4 = [(STEyeReliefIntroHowItWorksViewController *)self completionHandler];
    v4[2](v4, &unk_26D966E50);
  }
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 1192, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)forChecklistFlow
{
  return self->_forChecklistFlow;
}

- (void)setForChecklistFlow:(BOOL)a3
{
  self->_forChecklistFlow = a3;
}

- (void).cxx_destruct
{
}

@end