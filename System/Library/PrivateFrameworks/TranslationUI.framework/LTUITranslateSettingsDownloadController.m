@interface LTUITranslateSettingsDownloadController
- (LTUITranslateSettingsDownloadController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)navigationItem;
- (unint64_t)usageContext;
- (void)loadBridge;
- (void)setUsageContext:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LTUITranslateSettingsDownloadController

- (LTUITranslateSettingsDownloadController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)LTUITranslateSettingsDownloadController;
  v4 = [(LTUITranslateSettingsDownloadController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(LTUITranslateSettingsDownloadController *)v4 setUsageContext:0];
    [(LTUITranslateSettingsDownloadController *)v5 loadBridge];
    v6 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)LTUITranslateSettingsDownloadController;
  [(LTUITranslateSettingsDownloadController *)&v16 viewDidLoad];
  [(LTUITranslateSettingsDownloadController *)self addChildViewController:self->_bridge];
  v3 = [(LTUITranslateSettingsDownloadController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(UIViewController *)self->_bridge view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(UIViewController *)self->_bridge view];
  [v13 setAutoresizingMask:18];

  v14 = [(LTUITranslateSettingsDownloadController *)self view];
  v15 = [(UIViewController *)self->_bridge view];
  [v14 addSubview:v15];

  [(UIViewController *)self->_bridge didMoveToParentViewController:self];
}

- (id)navigationItem
{
  return [(UIViewController *)self->_bridge navigationItem];
}

- (void)loadBridge
{
  if ([(LTUITranslateSettingsDownloadController *)self usageContext] == 1) {
    +[LTUIHostedDownloadViewBridge accessibilityViewController];
  }
  else {
  self->_bridge = +[LTUIHostedDownloadViewBridge viewController];
  }
  MEMORY[0x1F41817F8]();
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)LTUITranslateSettingsDownloadController;
  [(LTUITranslateSettingsDownloadController *)&v16 viewDidAppear:a3];
  double v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.Translate/DOWNLOADED_LANGUAGES_SPECIFIER"];
  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  double v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v8 = [v7 bundleURL];
  double v9 = (void *)[v5 initWithKey:@"ON_DEVICE_LANGUAGES_TITLE" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F292B8]);
  double v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"TRANSLATE" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v17[1] = v9;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [(LTUITranslateSettingsDownloadController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.Translation" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (unint64_t)usageContext
{
  return self->_usageContext;
}

- (void)setUsageContext:(unint64_t)a3
{
  self->_usageContext = a3;
}

- (void).cxx_destruct
{
}

@end