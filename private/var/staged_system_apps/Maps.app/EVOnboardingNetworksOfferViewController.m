@interface EVOnboardingNetworksOfferViewController
- (EVOnboardingNetworksOfferViewController)initWithDelegate:(id)a3 vehicleName:(id)a4;
- (id)obViewController;
- (void)_chooseNetworks;
- (void)_setUpLaterPressed;
@end

@implementation EVOnboardingNetworksOfferViewController

- (EVOnboardingNetworksOfferViewController)initWithDelegate:(id)a3 vehicleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EVOnboardingNetworksOfferViewController;
  v8 = [(EVOnboardingBaseViewController *)&v13 initWithDelegate:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (NSString *)[v7 copy];
    vehicleName = v9->_vehicleName;
    v9->_vehicleName = v10;
  }
  return v9;
}

- (id)obViewController
{
  if (self->_vehicleName)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"[EV Onboarding] Preferred Networks for Your vehicle title" value:@"localized string not found" table:0];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, self->_vehicleName);
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    v5 = [v3 localizedStringForKey:@"[EV Onboarding] Preferred Networks title" value:@"localized string not found" table:0];
  }

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"[EV Onboarding] Preferred Networks subtitle" value:@"localized string not found" table:0];

  v8 = +[UIImage imageNamed:@"PreferredNetworks"];
  id v9 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v5 detailText:v7 icon:v8];
  [v9 setModalPresentationStyle:2];
  v10 = [v9 headerView];
  [v10 setAllowFullWidthIcon:1];

  v11 = +[OBBoldTrayButton boldButton];
  v12 = +[NSBundle mainBundle];
  objc_super v13 = [v12 localizedStringForKey:@"[EV Onboarding] Choose Networks" value:@"localized string not found" table:0];
  [v11 setTitle:v13 forState:0];

  [v11 addTarget:self action:"_chooseNetworks" forControlEvents:64];
  [v11 setAccessibilityIdentifier:@"ConnectButton"];
  v14 = [v9 buttonTray];
  [v14 addButton:v11];

  v15 = +[OBLinkTrayButton linkButton];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"[EV Onboarding] Set Up Later" value:@"localized string not found" table:0];
  [v15 setTitle:v17 forState:0];

  [v15 addTarget:self action:"_setUpLaterPressed" forControlEvents:64];
  [v15 setAccessibilityIdentifier:@"SetUpLaterButton"];
  v18 = [v9 buttonTray];
  [v18 addButton:v15];

  return v9;
}

- (void)_chooseNetworks
{
  v3 = sub_1005761B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(EVOnboardingNetworksOfferViewController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    objc_super v13 = v9;
    __int16 v14 = 2080;
    v15 = "-[EVOnboardingNetworksOfferViewController _chooseNetworks]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);
  }
  v10 = +[MKMapService sharedService];
  [v10 captureUserAction:452 onTarget:123 eventValue:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained networksOfferViewControllerDidSelectSetupNow:self];
}

- (void)_setUpLaterPressed
{
  v3 = sub_1005761B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self;
    if (!v4)
    {
      id v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(EVOnboardingNetworksOfferViewController *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        id v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    id v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    objc_super v13 = v9;
    __int16 v14 = 2080;
    v15 = "-[EVOnboardingNetworksOfferViewController _setUpLaterPressed]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);
  }
  v10 = +[MKMapService sharedService];
  [v10 captureUserAction:440 onTarget:123 eventValue:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained networksOfferViewControllerDidSelectSetupLater:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end