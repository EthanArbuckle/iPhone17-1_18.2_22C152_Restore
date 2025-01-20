@interface ICStartupNavigationController
+ (BOOL)shouldUseCompactLayoutForTraitCollection:(id)a3 viewSize:(CGSize)a4;
+ (double)introductionControlsBottomSpacingForViewSize:(CGSize)a3;
+ (double)introductionControlsButtonWidthForView:(id)a3 viewSize:(CGSize)a4;
+ (id)defaultLabelColor;
- (BOOL)shouldSwapChoices;
- (ICNAEventReporter)eventReporter;
- (ICStartupController)startupController;
- (ICStartupDeviceListViewController)deviceListViewController;
- (ICStartupNavigationController)initWithForceWelcomeScreen:(BOOL)a3 presentingWindow:(id)a4 dismissBlock:(id)a5;
- (ICStartupViewController)startupViewController;
- (ICStartupWhatsNewViewController)startupWhatsNewViewController;
- (NSArray)primaryAccountDevices;
- (UIWindow)presentingWindow;
- (id)dismissBlock;
- (unint64_t)getStartupMigrationType;
- (unint64_t)startupScreenType;
- (unint64_t)supportedInterfaceOrientations;
- (void)continueAction;
- (void)dismiss;
- (void)dismissWithCompletionBlock:(id)a3;
- (void)eventReporterLostSession:(id)a3;
- (void)noUpgradeAction;
- (void)noUpgradeActionAndDismiss;
- (void)setDeviceListViewController:(id)a3;
- (void)setDismissBlock:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setPresentingWindow:(id)a3;
- (void)setStartupController:(id)a3;
- (void)setStartupViewController:(id)a3;
- (void)setStartupWhatsNewViewController:(id)a3;
- (void)startupMigrationTypeMightHaveChanged;
- (void)submitOnboardingScreenViewEvent;
- (void)upgradeAction;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICStartupNavigationController

- (ICStartupNavigationController)initWithForceWelcomeScreen:(BOOL)a3 presentingWindow:(id)a4 dismissBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)ICStartupNavigationController;
  v10 = [(ICStartupNavigationController *)&v35 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    [(ICStartupNavigationController *)v10 setPresentingWindow:v8];
    [(ICStartupNavigationController *)v11 setDismissBlock:v9];
    if (+[UIDevice ic_isVision])
    {
      v12 = +[UIImage ic_applicationIconImageWithSize:](UIImage, "ic_applicationIconImageWithSize:", 84.0, 84.0);
    }
    else
    {
      v12 = 0;
    }
    id v13 = [v8 ic_behavior];
    if (!a3
      && +[ICStartupController shouldShowWhatsNewScreen])
    {
      v14 = +[NSBundle mainBundle];
      v15 = v14;
      if (v13 == (id)1) {
        CFStringRef v16 = @"What’s New in Math Notes";
      }
      else {
        CFStringRef v16 = @"What’s New in Notes";
      }
      v17 = [v14 localizedStringForKey:v16 value:&stru_10063F3D8 table:0];

      v18 = [[ICStartupWhatsNewViewController alloc] initWithTitle:v17 detailText:0 icon:v12];
      [(ICStartupNavigationController *)v11 setStartupWhatsNewViewController:v18];

      v19 = [(ICStartupNavigationController *)v11 startupWhatsNewViewController];
      v11->_startupScreenType = 1;
      goto LABEL_19;
    }
    v20 = [[ICStartupController alloc] initWithDelegate:v11];
    [(ICStartupNavigationController *)v11 setStartupController:v20];

    v21 = +[NSBundle mainBundle];
    v22 = v21;
    if (v13 == (id)1) {
      CFStringRef v23 = @"Welcome to Math Notes";
    }
    else {
      CFStringRef v23 = @"Welcome to Notes";
    }
    v17 = [v21 localizedStringForKey:v23 value:&stru_10063F3D8 table:0];

    v24 = [(ICStartupNavigationController *)v11 traitCollection];
    if ([v24 horizontalSizeClass] == (id)2
      && (+[UIDevice ic_isVision] & 1) == 0)
    {

      if (v13 == (id)1)
      {
        v25 = 0;
        goto LABEL_18;
      }
      int IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
      v33 = +[NSBundle mainBundle];
      v24 = v33;
      if (IsAppleAccountBrandingEnabled) {
        CFStringRef v34 = @"Great new tools for notes synced to your Apple Account.";
      }
      else {
        CFStringRef v34 = @"Great new tools for notes synced to your iCloud account.";
      }
      v25 = [v33 localizedStringForKey:v34 value:&stru_10063F3D8 table:0];
    }
    else
    {
      v25 = 0;
    }

LABEL_18:
    v26 = [[ICStartupViewController alloc] initWithTitle:v17 detailText:v25 icon:v12];
    [(ICStartupNavigationController *)v11 setStartupViewController:v26];

    v27 = [ICStartupDeviceListViewController alloc];
    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"Upgrade Notes" value:&stru_10063F3D8 table:0];
    v30 = [(ICStartupDeviceListViewController *)v27 initWithTitle:v29 detailText:0 icon:0];
    [(ICStartupNavigationController *)v11 setDeviceListViewController:v30];

    v19 = [(ICStartupNavigationController *)v11 startupViewController];
    v11->_startupScreenType = 2;

LABEL_19:
    [(ICStartupNavigationController *)v11 pushViewController:v19 animated:0];
    [(ICStartupNavigationController *)v11 setModalPresentationStyle:2];
    [(ICStartupNavigationController *)v11 setNavigationBarHidden:1];
  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICStartupNavigationController;
  [(ICStartupNavigationController *)&v7 viewWillAppear:a3];
  v4 = [(ICStartupNavigationController *)self startupController];
  v5 = [(ICStartupNavigationController *)self startupViewController];
  [v4 checkStatusIfNecessaryWithDeviceCheckIndicator:v5];

  v6 = [(ICStartupNavigationController *)self view];
  [v6 setAccessibilityIdentifier:@"Welcome Screen"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICStartupNavigationController;
  [(ICStartupNavigationController *)&v5 viewDidAppear:a3];
  v4 = [(ICStartupNavigationController *)self eventReporter];
  [v4 startOnboardingScreenViewEventDurationTracking];
}

- (BOOL)shouldSwapChoices
{
  return 0;
}

- (void)continueAction
{
  v3 = [(ICStartupNavigationController *)self startupController];
  [v3 didContinueFromStartupView];

  id v4 = [(ICStartupNavigationController *)self deviceListViewController];
  [(ICStartupNavigationController *)self pushViewController:v4 animated:1];
}

- (void)upgradeAction
{
  id v2 = [(ICStartupNavigationController *)self startupController];
  [v2 didUpgradeFromStartupView:1];
}

- (void)noUpgradeAction
{
  id v2 = [(ICStartupNavigationController *)self startupController];
  [v2 didUpgradeFromStartupView:0];
}

- (void)submitOnboardingScreenViewEvent
{
  unint64_t v3 = [(ICStartupNavigationController *)self startupScreenType];
  if (v3 == 2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (v3 == 1);
  }
  id v5 = [(ICStartupNavigationController *)self eventReporter];
  [v5 submitOnboardingScreenViewEventWithType:v4];
}

- (void)dismissWithCompletionBlock:(id)a3
{
  id v8 = a3;
  [(ICStartupNavigationController *)self submitOnboardingScreenViewEvent];
  uint64_t v4 = [(ICStartupNavigationController *)self startupController];
  [v4 didContinueFromStartupView];

  id v5 = [(ICStartupNavigationController *)self dismissBlock];

  if (v5)
  {
    v6 = [(ICStartupNavigationController *)self dismissBlock];
    ((void (**)(void, id))v6)[2](v6, v8);

    [(ICStartupNavigationController *)self setDismissBlock:0];
  }
  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"ICStartupNavigationControllerDidDismissNotification" object:self];
}

- (void)dismiss
{
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (!v4) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)ICStartupNavigationController;
  return [(ICStartupNavigationController *)&v6 supportedInterfaceOrientations];
}

+ (id)defaultLabelColor
{
  return +[UIColor secondaryLabelColor];
}

+ (double)introductionControlsButtonWidthForView:(id)a3 viewSize:(CGSize)a4
{
  double width = a4.width;
  id v5 = a3;
  objc_super v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7)
  {
    double v8 = fmin(width + -32.0, 360.0);
  }
  else
  {
    id v9 = [v5 traitCollection];
    if ([v9 horizontalSizeClass] == (id)1) {
      double v8 = 288.0;
    }
    else {
      double v8 = 480.0;
    }
  }
  return v8;
}

+ (double)introductionControlsBottomSpacingForViewSize:(CGSize)a3
{
  return 0.0;
}

+ (BOOL)shouldUseCompactLayoutForTraitCollection:(id)a3 viewSize:(CGSize)a4
{
  double width = a4.width;
  if (objc_msgSend(a3, "horizontalSizeClass", a4.width, a4.height) != (id)1) {
    return 0;
  }
  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];
  BOOL v8 = width < 639.0 || v6 == 0;

  return v8;
}

- (NSArray)primaryAccountDevices
{
  id v2 = [(ICStartupNavigationController *)self startupController];
  unint64_t v3 = [v2 primaryAccountDevices];

  return (NSArray *)v3;
}

- (unint64_t)getStartupMigrationType
{
  id v2 = [(ICStartupNavigationController *)self startupController];
  id v3 = [v2 getStartupMigrationType];

  return (unint64_t)v3;
}

- (void)startupMigrationTypeMightHaveChanged
{
  id v4 = [(ICStartupNavigationController *)self startupController];
  id v3 = [(ICStartupNavigationController *)self startupViewController];
  [v4 checkStatusIfNecessaryWithDeviceCheckIndicator:v3];
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAEventReporter);
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [(ICStartupNavigationController *)self view];
    id v7 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 view:v6];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
  }
  v10 = self->_eventReporter;

  return v10;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (void)noUpgradeActionAndDismiss
{
  id v3 = [(ICStartupNavigationController *)self viewControllers];
  id v8 = [v3 firstObject];

  id v4 = [(ICStartupNavigationController *)self deviceListViewController];

  if (v8 == v4)
  {
    id v7 = [(ICStartupNavigationController *)self deviceListViewController];
    [v7 noUpgrade:self];
  }
  else
  {
    id v5 = [(ICStartupNavigationController *)self startupViewController];

    uint64_t v6 = v8;
    if (v8 != v5) {
      goto LABEL_6;
    }
    id v7 = [(ICStartupNavigationController *)self startupViewController];
    [v7 continueAction:self];
  }

  uint64_t v6 = v8;
LABEL_6:
}

- (UIWindow)presentingWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setPresentingWindow:(id)a3
{
}

- (ICStartupViewController)startupViewController
{
  return self->_startupViewController;
}

- (void)setStartupViewController:(id)a3
{
}

- (ICStartupDeviceListViewController)deviceListViewController
{
  return self->_deviceListViewController;
}

- (void)setDeviceListViewController:(id)a3
{
}

- (ICStartupWhatsNewViewController)startupWhatsNewViewController
{
  return self->_startupWhatsNewViewController;
}

- (void)setStartupWhatsNewViewController:(id)a3
{
}

- (ICStartupController)startupController
{
  return self->_startupController;
}

- (void)setStartupController:(id)a3
{
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (unint64_t)startupScreenType
{
  return self->_startupScreenType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong((id *)&self->_startupController, 0);
  objc_storeStrong((id *)&self->_startupWhatsNewViewController, 0);
  objc_storeStrong((id *)&self->_deviceListViewController, 0);
  objc_storeStrong((id *)&self->_startupViewController, 0);

  objc_destroyWeak((id *)&self->_presentingWindow);
}

@end