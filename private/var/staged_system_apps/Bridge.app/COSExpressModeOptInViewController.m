@interface COSExpressModeOptInViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)_walletExpressSetupEnabled;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)holdBeforeDisplaying;
- (BOOL)requiresActivationCheck;
- (COSExpressModeOptInViewController)init;
- (COSExpressSetupDetailSection)walletDetailSection;
- (COSExpressSetupDetailView)detailView;
- (COSSetupController)setupController;
- (NSArray)activeExpressModeControllerClasses;
- (NSMutableDictionary)walletDetailSectionItemsMap;
- (id)_makeAppsDetailSection;
- (id)_makeDetailSections;
- (id)_makeSettingsDetailSection;
- (id)_makeWalletDetailSection;
- (id)_paymentExpressSetupManager;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)learnMoreButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)_checkLocalPairingStorePathAndReleaseHold;
- (void)alternateButtonPressed:(id)a3;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)didEstablishHold;
- (void)learnMoreButtonPressed:(id)a3;
- (void)paymentExpressSetupManager:(id)a3 didUpdateCardArtForSetupAssistantCredential:(id)a4;
- (void)setActiveExpressModeControllerClasses:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setWalletDetailSection:(id)a3;
- (void)setWalletDetailSectionItemsMap:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSExpressModeOptInViewController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (BOOL)requiresActivationCheck
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (void)didEstablishHold
{
  v3 = [(COSExpressModeOptInViewController *)self _paymentExpressSetupManager];
  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10001BC38;
    v4[3] = &unk_1002439E0;
    objc_copyWeak(&v5, &location);
    [v3 configureExpressSetupProvisioningContextWithCompletion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    [(COSExpressModeOptInViewController *)self _checkLocalPairingStorePathAndReleaseHold];
  }
}

- (COSExpressModeOptInViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)COSExpressModeOptInViewController;
  v2 = [(COSOptinViewController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    [(COSExpressModeOptInViewController *)v2 setStyle:26];
    v4 = [UIApp setupController];
    objc_storeWeak((id *)&v3->_setupController, v4);

    id v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v3->_setupController);
      v7 = [WeakRetained expressModeControllers];
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Express mode controllers: %@", buf, 0xCu);
    }
    unsigned int v8 = [(COSExpressModeOptInViewController *)v3 _walletExpressSetupEnabled];
    pbb_setupflow_log();
    v9 = (COSPaymentExpressSetupManager *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v10) {
        sub_10017179C();
      }

      v9 = objc_alloc_init(COSPaymentExpressSetupManager);
      [(COSPaymentExpressSetupManager *)v9 setDelegate:v3];
      id v11 = objc_loadWeakRetained((id *)&v3->_setupController);
      [v11 setPaymentExpressSetupManager:v9];
    }
    else if (v10)
    {
      sub_1001717D0();
    }
  }
  return v3;
}

- (void)_checkLocalPairingStorePathAndReleaseHold
{
  v3 = +[UIApplication sharedApplication];
  v4 = [v3 activeWatch];

  uint64_t v5 = NRDevicePropertyLocalPairingDataStorePath;
  v6 = [v4 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  if (v6)
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001BFC4;
    v9[3] = &unk_1002439E0;
    objc_copyWeak(&v10, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100171804();
    }

    uint64_t v12 = v5;
    unsigned int v8 = +[NSArray arrayWithObjects:&v12 count:1];
    [v4 addPropertyObserver:self forPropertyChanges:v8];
  }
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)COSExpressModeOptInViewController;
  [(COSExpressModeOptInViewController *)&v47 viewDidLoad];
  v3 = objc_opt_new();
  v41 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  uint64_t v5 = [WeakRetained expressModeDevice];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = objc_loadWeakRetained((id *)&self->_setupController);
  v7 = [v6 expressModeControllers];

  id v8 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(objc_class **)(*((void *)&v43 + 1) + 8 * i);
        if ([(objc_class *)v12 skipControllerForExpressMode:v5])
        {
          objc_super v13 = pbb_setupflow_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = NSStringFromClass(v12);
            *(_DWORD *)buf = 138412290;
            v50 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Express mode controller requesting skip: %@", buf, 0xCu);
          }
          [v3 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v9);
  }

  id v15 = [v3 copy];
  [(COSExpressModeOptInViewController *)v41 setActiveExpressModeControllerClasses:v15];

  v16 = [COSExpressSetupDetailView alloc];
  v17 = [(COSExpressModeOptInViewController *)v41 _makeDetailSections];
  v18 = [(COSExpressSetupDetailView *)v16 initWithSections:v17];

  detailView = v41->_detailView;
  v41->_detailView = v18;
  v20 = v18;

  v21 = [(COSExpressModeOptInViewController *)v41 contentView];
  [v21 addSubview:v20];

  [(COSExpressSetupDetailView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = [(COSExpressSetupDetailView *)v20 topAnchor];
  v42 = [(COSExpressModeOptInViewController *)v41 contentView];
  v39 = [v42 topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v48[0] = v38;
  v36 = [(COSExpressSetupDetailView *)v20 leadingAnchor];
  v37 = [(COSExpressModeOptInViewController *)v41 contentView];
  v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v48[1] = v34;
  v32 = [(COSExpressSetupDetailView *)v20 trailingAnchor];
  v33 = [(COSExpressModeOptInViewController *)v41 contentView];
  v31 = [v33 trailingAnchor];
  v22 = [v32 constraintEqualToAnchor:v31];
  v48[2] = v22;
  v23 = [(COSExpressSetupDetailView *)v20 bottomAnchor];
  v24 = [(COSExpressModeOptInViewController *)v41 contentView];
  v25 = [v24 bottomAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v48[3] = v26;
  v27 = +[NSArray arrayWithObjects:v48 count:4];
  +[NSLayoutConstraint activateConstraints:v27];

  id v28 = objc_alloc_init((Class)AAUIProfilePictureStore);
  v29 = [v28 profilePictureForAccountOwner];
  v30 = [(COSExpressModeOptInViewController *)v41 headerView];
  [v30 setIcon:v29 accessibilityLabel:0];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EXPRESS_MODE_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EXPRESS_MODE_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"CONTINUE_SETUP" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EXPRESS_MODE_CUSTOMIZE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)learnMoreButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EXPRESS_MODE_LEARN_MORE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = [UIApp setupController:a3];
  uint64_t v5 = +[COSBackupManager sharedBackupManager];
  id v6 = [v4 expressModeDevice];
  v7 = [v4 activePairingDevice];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C7E4;
  v8[3] = &unk_100243A08;
  v8[4] = self;
  [v5 restoreFromDevice:v6 toDevice:v7 completionHandler:v8];
}

- (void)alternateButtonPressed:(id)a3
{
  [UIApp setupController:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setExpressMode:0];
  v4 = [(COSExpressModeOptInViewController *)self delegate];
  [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

- (void)learnMoreButtonPressed:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:&off_10025BC08];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (id)_makeDetailSections
{
  v3 = objc_opt_new();
  id v4 = [(COSExpressModeOptInViewController *)self _makeAppsDetailSection];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(COSExpressModeOptInViewController *)self _makeSettingsDetailSection];
  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(COSExpressModeOptInViewController *)self _makeWalletDetailSection];
  if (v6) {
    [v3 addObject:v6];
  }
  walletDetailSection = self->_walletDetailSection;
  self->_walletDetailSection = v6;

  return v3;
}

- (id)_makeAppsDetailSection
{
  v3 = objc_opt_new();
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"EXPRESS_MODE_APPS_TITLE" value:&stru_100249230 table:@"Localizable"];
  [v3 setTitle:v5];

  id v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"EXPRESS_MODE_APPS_SUBTITLE" value:&stru_100249230 table:@"Localizable"];
  [v3 setSubtitle:v7];

  id v8 = +[UIImage _systemImageNamed:@"app.3.stack.3d"];
  [v3 setImage:v8];

  p_setupController = &self->_setupController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  id v11 = [WeakRetained expressModeDevice];

  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    id v13 = objc_loadWeakRetained((id *)p_setupController);
    v14 = [v13 expressModeDevice];
    id v15 = [v14 valueForProperty:NRDevicePropertyName];
    [v12 setTitle:v15];

    v16 = +[UIImage _systemImageNamed:@"apps.watch.applewatch.case"];
    [v12 setImage:v16];

    id v17 = objc_loadWeakRetained((id *)p_setupController);
    v18 = [v17 expressModeDevice];
    v34 = [v18 valueForProperty:NRDevicePropertyProductType];

    v19 = +[BPSScreenStringObj screenStringsWithArray:&off_10025BC20];
    v20 = BPSGetRelevantScreenStringForProduct();

    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:v20 value:&stru_100249230 table:@"Pairing"];

    id v23 = objc_loadWeakRetained((id *)p_setupController);
    v24 = [v23 expressModeDevice];
    +[PBBridgeWatchAttributeController materialFromDevice:v24];

    v25 = BPSUnlocalizedNameForMaterial();
    v26 = [v25 stringByAppendingString:@"_ACTIVE_DEVICE"];

    v27 = +[NSBundle mainBundle];
    id v28 = [v27 localizedStringForKey:v26 value:&stru_100249230 table:@"Pairing"];

    v29 = +[NSBundle mainBundle];
    v30 = [v29 localizedStringForKey:@"EXPRESS_WATCH_DETAILS_FORMAT_%@_%@" value:&stru_100249230 table:@"Localizable"];
    v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v28, v22);
    [v12 setDetail:v31];

    v35 = v12;
    v32 = +[NSArray arrayWithObjects:&v35 count:1];
    [v3 setItems:v32];
  }
  else
  {
    uint64_t v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100171838();
    }
  }

  return v3;
}

- (id)_makeSettingsDetailSection
{
  v3 = objc_opt_new();
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"EXPRESS_MODE_SETTINGS_TITLE" value:&stru_100249230 table:@"Localizable"];
  [v3 setTitle:v5];

  id v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"EXPRESS_MODE_SETTINGS_SUBTITLE" value:&stru_100249230 table:@"Localizable"];
  [v3 setSubtitle:v7];

  id v8 = +[UIImage _systemImageNamed:@"gear"];
  v84 = v3;
  [v3 setImage:v8];

  id v9 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  id v11 = [WeakRetained expressModeDevice];

  id location = (id *)&self->_setupController;
  if (v11)
  {
    v85 = self;
    id v12 = objc_loadWeakRetained((id *)&self->_setupController);
    id v13 = [v12 expressModeDevice];
    uint64_t v14 = [v13 valueForProperty:NRDevicePropertyPairingID];

    id v15 = objc_loadWeakRetained((id *)&self->_setupController);
    v16 = [v15 expressModeDevice];
    id v17 = [v16 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];

    v18 = objc_opt_new();
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"EXPRESS_ITEM_SIRI_TITLE" value:&stru_100249230 table:@"Localizable"];
    [v18 setTitle:v20];

    v21 = +[UIImage _systemImageNamed:@"siri"];
    [v18 setImage:v21];

    id v22 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.assistant.nano" pairingID:v14 pairingDataStore:v17];
    id v23 = [v22 synchronize];
    v92[0] = 0;
    v83 = v22;
    unsigned int v24 = [v22 BOOLForKey:@"Assistant Enabled" keyExistsAndHasValidFormat:v92];
    v25 = v9;
    int v26 = v92[0];
    v27 = +[NSBundle mainBundle];
    id v28 = v27;
    BOOL v29 = v26 == 0;
    id v9 = v25;
    if (v29) {
      int v30 = 1;
    }
    else {
      int v30 = v24;
    }
    if (v30) {
      CFStringRef v31 = @"EXPRESS_STATUS_ON";
    }
    else {
      CFStringRef v31 = @"EXPRESS_STATUS_OFF";
    }
    v32 = [v27 localizedStringForKey:v31 value:&stru_100249230 table:@"Localizable"];
    [v18 setStatus:v32];

    v33 = +[NSBundle mainBundle];
    v34 = [v33 localizedStringForKey:@"EXPRESS_ITEM_SIRI_DETAIL" value:&stru_100249230 table:@"Localizable"];
    [v18 setDetail:v34];

    [v25 addObject:v18];
    v35 = objc_opt_new();

    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"EXPRESS_ITEM_ORIENTATION_TITLE" value:&stru_100249230 table:@"Localizable"];
    [v35 setTitle:v37];

    v38 = +[UIImage _systemImageNamed:@"applewatch.side.right"];
    [v35 setImage:v38];

    v39 = +[NSBundle mainBundle];
    v40 = [v39 localizedStringForKey:@"EXPRESS_ITEM_ORIENTATION_DETAIL" value:&stru_100249230 table:@"Localizable"];
    [v35 setDetail:v40];

    id v41 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano" pairingID:v14 pairingDataStore:v17];
    id v42 = [v41 synchronize];
    v92[0] = 0;
    unsigned int v43 = [v41 BOOLForKey:@"wornOnRightArm" keyExistsAndHasValidFormat:v92];
    if (v92[0])
    {
      unsigned int v44 = v43;
      long long v45 = +[NSBundle mainBundle];
      long long v46 = v45;
      if (v44) {
        CFStringRef v47 = @"EXPRESS_STATUS_RIGHT_WRIST";
      }
      else {
        CFStringRef v47 = @"EXPRESS_STATUS_LEFT_WRIST";
      }
      v48 = [v45 localizedStringForKey:v47 value:&stru_100249230 table:@"Localizable"];
      [v35 setStatus:v48];
    }
    [v25 addObject:v35];
    v49 = objc_opt_new();

    v50 = +[NSBundle mainBundle];
    v51 = [v50 localizedStringForKey:@"EXPRESS_ITEM_LOCATION_TITLE" value:&stru_100249230 table:@"Localizable"];
    [v49 setTitle:v51];

    v52 = +[UIImage _systemImageNamed:@"location.fill"];
    [v49 setImage:v52];

    v53 = +[NSBundle mainBundle];
    v54 = [v53 localizedStringForKey:@"EXPRESS_ITEM_LOCATION_DETAIL" value:&stru_100249230 table:@"Localizable"];
    [v49 setDetail:v54];

    [v25 addObject:v49];
    v55 = objc_opt_new();

    v56 = +[NSBundle mainBundle];
    v57 = [v56 localizedStringForKey:@"EXPRESS_ITEM_WATCH_ANALYTICS_TITLE" value:&stru_100249230 table:@"Localizable"];
    [v55 setTitle:v57];

    v58 = +[UIImage _systemImageNamed:@"applewatch"];
    [v55 setImage:v58];

    v59 = +[NSBundle mainBundle];
    v60 = [v59 localizedStringForKey:@"EXPRESS_ITEM_WATCH_ANALYTICS_DETAIL" value:&stru_100249230 table:@"Localizable"];
    [v55 setDetail:v60];

    [v25 addObject:v55];
    v61 = objc_opt_new();

    v62 = +[NSBundle mainBundle];
    v63 = [v62 localizedStringForKey:@"EXPRESS_ITEM_APP_ANALYTICS_TITLE" value:&stru_100249230 table:@"Localizable"];
    [v61 setTitle:v63];

    v64 = +[UIImage _systemImageNamed:@"chart.bar.xaxis"];
    [v61 setImage:v64];

    v65 = +[NSBundle mainBundle];
    v66 = [v65 localizedStringForKey:@"EXPRESS_ITEM_APP_ANALYTICS_DETAIL" value:&stru_100249230 table:@"Localizable"];
    [v61 setDetail:v66];

    [v25 addObject:v61];
    self = v85;
    v67 = v14;
  }
  else
  {
    v67 = pbb_setupflow_log();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      sub_100171958();
    }
  }

  v68 = [(COSExpressModeOptInViewController *)self activeExpressModeControllerClasses];
  id v69 = [v68 count];

  if (v69)
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v70 = [(COSExpressModeOptInViewController *)self activeExpressModeControllerClasses];
    id v71 = [v70 countByEnumeratingWithState:&v87 objects:v93 count:16];
    if (v71)
    {
      id v72 = v71;
      v73 = v9;
      uint64_t v74 = *(void *)v88;
      do
      {
        for (i = 0; i != v72; i = (char *)i + 1)
        {
          if (*(void *)v88 != v74) {
            objc_enumerationMutation(v70);
          }
          v76 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v77 = objc_loadWeakRetained(location);
            v78 = [v77 expressModeDevice];
            v79 = [v76 expressModeSettingsItem:v78];

            if (v79)
            {
              [v73 addObject:v79];
            }
            else
            {
              v80 = pbb_setupflow_log();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
                sub_1001718A0((uint64_t)v92, (uint64_t)v76);
              }
            }
          }
          else
          {
            v79 = pbb_setupflow_log();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
              sub_1001718FC((uint64_t)v91, (uint64_t)v76);
            }
          }
        }
        id v72 = [v70 countByEnumeratingWithState:&v87 objects:v93 count:16];
      }
      while (v72);
      v81 = v84;
      id v9 = v73;
    }
    else
    {
      v81 = v84;
    }
  }
  else
  {
    v70 = pbb_setupflow_log();
    v81 = v84;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_10017186C();
    }
  }

  [v81 setItems:v9];

  return v81;
}

- (id)_makeWalletDetailSection
{
  v2 = [(COSExpressModeOptInViewController *)self _paymentExpressSetupManager];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 expressWalletPasses];
    if ([v4 count])
    {
      id v42 = v3;
      id v5 = objc_opt_new();
      id v6 = +[NSBundle mainBundle];
      v7 = [v6 localizedStringForKey:@"EXPRESS_MODE_WALLET_TITLE" value:&stru_100249230 table:@"Localizable"];
      [v5 setTitle:v7];

      id v8 = +[UIImage _systemImageNamed:@"wallet"];
      v40 = v5;
      [v5 setImage:v8];

      id v41 = objc_alloc_init((Class)NSMutableArray);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v39 = v4;
      id v9 = v4;
      id v10 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v49;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v49 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = [*(id *)(*((void *)&v48 + 1) + 8 * i) title];
            if (v14)
            {
              id v15 = +[NSBundle mainBundle];
              v16 = [v15 localizedStringForKey:@"EXPRESS_MODE_WALLET_ITEM_NAME" value:&stru_100249230 table:@"Localizable"];
              id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v14);
              [v41 addObject:v17];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v11);
      }

      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"EXPRESS_MODE_WALLET_SUBTITLE" value:&stru_100249230 table:@"Localizable"];
      v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, [v9 count]);
      [v40 setSubtitle:v20];

      v21 = objc_opt_new();
      id v22 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSObject count](v9, "count")];
      walletDetailSectionItemsMap = self->_walletDetailSectionItemsMap;
      self->_walletDetailSectionItemsMap = v22;

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      unsigned int v24 = v9;
      id v25 = [v24 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v45;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v45 != v27) {
              objc_enumerationMutation(v24);
            }
            BOOL v29 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
            int v30 = objc_opt_new();
            CFStringRef v31 = [v29 title];
            [v30 setTitle:v31];

            v32 = [v29 subtitle];
            [v30 setDetail:v32];

            v33 = [v42 passSnapshotForCredential:v29];
            [v30 setImage:v33];

            [v21 addObject:v30];
            v34 = self->_walletDetailSectionItemsMap;
            v35 = [v29 uniqueIdentifier];
            [(NSMutableDictionary *)v34 setObject:v30 forKey:v35];
          }
          id v26 = [v24 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v26);
      }

      v36 = v40;
      [v40 setItems:v21];

      v37 = v41;
      v3 = v42;
      id v4 = v39;
    }
    else
    {
      v37 = pbb_setupflow_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No Wallet credentials found; express mode opt in controller skipping Wallet detail section.",
          buf,
          2u);
      }
      v36 = 0;
    }
  }
  else
  {
    id v4 = pbb_setupflow_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10017198C();
    }
    v36 = 0;
  }

  return v36;
}

- (void)paymentExpressSetupManager:(id)a3 didUpdateCardArtForSetupAssistantCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E0B4;
  v10[3] = &unk_100243A30;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_paymentExpressSetupManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  v3 = [WeakRetained paymentExpressSetupManager];

  return v3;
}

- (BOOL)_walletExpressSetupEnabled
{
  return _os_feature_enabled_impl();
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7 = a3;
  uint64_t v8 = NRDevicePropertyLocalPairingDataStorePath;
  if ([a4 isEqualToString:NRDevicePropertyLocalPairingDataStorePath])
  {
    id v9 = [v7 valueForProperty:v8];

    if (v9)
    {
      uint64_t v11 = v8;
      id v10 = +[NSArray arrayWithObjects:&v11 count:1];
      [v7 removePropertyObserver:self forPropertyChanges:v10];

      [(COSExpressModeOptInViewController *)self _checkLocalPairingStorePathAndReleaseHold];
    }
  }
}

- (COSSetupController)setupController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);

  return (COSSetupController *)WeakRetained;
}

- (NSArray)activeExpressModeControllerClasses
{
  return self->_activeExpressModeControllerClasses;
}

- (void)setActiveExpressModeControllerClasses:(id)a3
{
}

- (COSExpressSetupDetailView)detailView
{
  return self->_detailView;
}

- (void)setDetailView:(id)a3
{
}

- (COSExpressSetupDetailSection)walletDetailSection
{
  return self->_walletDetailSection;
}

- (void)setWalletDetailSection:(id)a3
{
}

- (NSMutableDictionary)walletDetailSectionItemsMap
{
  return self->_walletDetailSectionItemsMap;
}

- (void)setWalletDetailSectionItemsMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletDetailSectionItemsMap, 0);
  objc_storeStrong((id *)&self->_walletDetailSection, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_activeExpressModeControllerClasses, 0);

  objc_destroyWeak((id *)&self->_setupController);
}

@end