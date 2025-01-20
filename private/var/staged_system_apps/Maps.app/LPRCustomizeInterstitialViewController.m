@interface LPRCustomizeInterstitialViewController
- (LPRCustomizeInterstitialViewController)initWithVehicle:(id)a3 delegate:(id)a4;
- (void)_didFinishCreatingVehicle;
- (void)continuePressed;
- (void)editVehicleViewController:(id)a3 didSelectColor:(id)a4 nickname:(id)a5 removedNetworks:(id)a6;
- (void)editVehicleViewControllerDidSelectDone:(id)a3;
- (void)setupLaterPressed;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LPRCustomizeInterstitialViewController

- (LPRCustomizeInterstitialViewController)initWithVehicle:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPRCustomizeInterstitialViewController;
  v9 = [(LPRCustomizeInterstitialViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)LPRCustomizeInterstitialViewController;
  [(LPRCustomizeInterstitialViewController *)&v30 viewDidLoad];
  [(LPRCustomizeInterstitialViewController *)self setAccessibilityIdentifier:@"LPRCustomizeInterstitialView"];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"[LPR Onboarding] Customize Your Vehicle" value:@"localized string not found" table:0];

  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"[LPR Onboarding] Customize subtitle" value:@"localized string not found" table:0];

  id v7 = sub_1004BE4A0((int)[(VGVehicle *)self->_vehicle isPureElectricVehicle]);
  id v8 = +[UIColor systemWhiteColor];
  v9 = [v7 _flatImageWithColor:v8];
  v10 = [v9 imageWithRenderingMode:1];

  id v11 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v4 detailText:v6 icon:v10];
  objc_super v12 = [v11 view];
  [v12 setAccessibilityIdentifier:@"OBWelcomeView"];

  [v11 setModalPresentationStyle:2];
  v13 = [v11 headerView];
  [v13 setIconInheritsTint:1];

  v14 = +[UIColor systemBlueColor];
  v15 = [v11 headerView];
  [v15 setTintColor:v14];

  v16 = +[OBBoldTrayButton boldButton];
  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"[LPR Onboarding] Customize" value:@"localized string not found" table:0];
  [v16 setTitle:v18 forState:0];

  [v16 addTarget:self action:"continuePressed" forControlEvents:64];
  [v16 setAccessibilityIdentifier:@"CustomizeButton"];
  v19 = [v11 buttonTray];
  [v19 addButton:v16];

  v20 = +[OBLinkTrayButton linkButton];
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"[LPR Onboarding] Set Up Later in Maps Settings" value:@"localized string not found" table:0];
  [v20 setTitle:v22 forState:0];

  [v20 addTarget:self action:"setupLaterPressed" forControlEvents:64];
  [v20 setAccessibilityIdentifier:@"SetupLaterButton"];
  v23 = [v11 buttonTray];
  [v23 addButton:v20];

  [(LPRCustomizeInterstitialViewController *)self addChildViewController:v11];
  v24 = [(LPRCustomizeInterstitialViewController *)self view];
  v25 = [v11 view];
  [v24 addSubview:v25];

  [v11 didMoveToParentViewController:self];
  v26 = [v11 view];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [v11 view];
  v28 = [(LPRCustomizeInterstitialViewController *)self view];
  v29 = [v27 _maps_constraintsForCenteringInView:v28];
  +[NSLayoutConstraint activateConstraints:v29];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPRCustomizeInterstitialViewController;
  -[LPRCustomizeInterstitialViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(LPRCustomizeInterstitialViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    id v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    id v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPRCustomizeInterstitialViewController;
  [(LPRCustomizeInterstitialViewController *)&v7 viewWillDisappear:a3];
  v4 = [(LPRCustomizeInterstitialViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)setupLaterPressed
{
}

- (void)_didFinishCreatingVehicle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didFinishConfiguringLPRForVehicle:self->_vehicle];

  v4 = +[VGVirtualGarageService sharedService];
  [v4 virtualGarageSaveVehicle:self->_vehicle];

  id v5 = +[VGVirtualGarageService sharedService];
  [v5 virtualGarageSelectVehicle:self->_vehicle];
}

- (void)continuePressed
{
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [(LPRCustomizeInterstitialViewController *)self traitCollection];
  v4 = [EditVehicleViewController alloc];
  id v5 = sub_1004BE53C(v8, v3);
  id v6 = [(EditVehicleViewController *)v4 initWithColors:v5 vehicle:self->_vehicle delegate:self];

  objc_super v7 = [(LPRCustomizeInterstitialViewController *)self navigationController];
  [v7 pushViewController:v6 animated:1];
}

- (void)editVehicleViewController:(id)a3 didSelectColor:(id)a4 nickname:(id)a5 removedNetworks:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([a6 count])
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      v17 = "-[LPRCustomizeInterstitialViewController editVehicleViewController:didSelectColor:nickname:removedNetworks:]";
      __int16 v18 = 2080;
      v19 = "LPRCustomizeInterstitialViewController.m";
      __int16 v20 = 1024;
      int v21 = 118;
      __int16 v22 = 2080;
      v23 = "removedNetworks.count == 0";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  id v11 = [v9 _maps_hexRepresentation];
  [(VGVehicle *)self->_vehicle setColorHex:v11];

  if ([v10 length]) {
    [(VGVehicle *)self->_vehicle setDisplayName:v10];
  }
  objc_super v12 = +[VGVirtualGarageService sharedService];
  [v12 virtualGarageSaveVehicle:self->_vehicle];
}

- (void)editVehicleViewControllerDidSelectDone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end