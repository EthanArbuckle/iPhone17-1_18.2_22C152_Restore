@interface COSTermsConditionsController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)skipControllerForExpressMode:(id)a3;
- (BOOL)appearingFromBackNavigation;
- (BOOL)didAgree;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)warrantySentinelExists;
- (BuddySimpleTCController)offlineLicenseVC;
- (BuddySimpleTCController)offlineWarrantyVC;
- (COSBuddyControllerDelegate)delegate;
- (COSTermsConditionsController)init;
- (NRTermsEvent)offlineLicense;
- (NRTermsEvent)offlineMultiterms;
- (NRTermsEvent)offlineWarranty;
- (NRTermsEvent)onlineTerms;
- (NSMutableArray)objectModels;
- (RUILoader)loader;
- (RUIPage)loadingPage;
- (UIViewController)viewController;
- (double)waitScreenPushGracePeriod;
- (id)_navigationController;
- (id)holdActivityIdentifier;
- (id)linkPressLoadCompletion;
- (id)localizedWaitScreenDescription;
- (id)offlineLicenseController;
- (id)offlineWarrantyController;
- (id)termsEventWithDocumentationID:(id)a3 data:(id)a4;
- (void)_cleanupLoader;
- (void)_popObjectModelAnimated:(BOOL)a3;
- (void)_presentDisagreeConfirmationAlert;
- (void)_showTermsFromRequest:(id)a3;
- (void)buddyTCSubController:(id)a3 didFinishWithAgree:(BOOL)a4;
- (void)dealloc;
- (void)endPerformancePhases;
- (void)enteredCompatibilityState:(id)a3;
- (void)handleOnlineTermsAndConditionsResponse:(id)a3 forRequest:(id)a4 error:(id)a5;
- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)markTermsAsAcceptedWithTermsEvent:(id)a3;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6;
- (void)offlineTermsResponse:(id)a3;
- (void)presentConfirmationAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 cancelButtonTitle:(id)a6 termsEvent:(id)a7;
- (void)queryGizmoForShowWarrantySentinel;
- (void)requestOnlineTermsAndConditions;
- (void)retrieveOfflineTerms;
- (void)setAppearingFromBackNavigation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAgree:(BOOL)a3;
- (void)setLinkPressLoadCompletion:(id)a3;
- (void)setLoader:(id)a3;
- (void)setLoadingPage:(id)a3;
- (void)setObjectModels:(id)a3;
- (void)setOfflineLicense:(id)a3;
- (void)setOfflineLicenseVC:(id)a3;
- (void)setOfflineMultiterms:(id)a3;
- (void)setOfflineWarranty:(id)a3;
- (void)setOfflineWarrantyVC:(id)a3;
- (void)setOnlineTerms:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWarrantySentinelExists:(BOOL)a3;
- (void)warrantySentinelResponse:(id)a3;
@end

@implementation COSTermsConditionsController

- (COSTermsConditionsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)COSTermsConditionsController;
  return [(COSTermsConditionsController *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSTermsConditionsController;
  [(COSTermsConditionsController *)&v4 dealloc];
}

- (void)warrantySentinelResponse:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6 = [(COSTermsConditionsController *)self delegate];
  v7 = [v6 nextControllerAfterHold];

  if (v7 == self)
  {
    v9 = [v4 userInfo];
    v10 = [v9 objectForKey:PBBridgeWarrantySentinelExistsKey];
    self->_warrantySentinelExists = [v10 BOOLValue];

    v11 = +[UIApplication sharedApplication];
    v8 = [v11 activeWatch];

    uint64_t v12 = [v8 valueForProperty:NRDevicePropertyPairingID];
    uint64_t v13 = [v8 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    v14 = [v4 userInfo];
    uint64_t v15 = [v14 objectForKey:PBBridgeGizmoAppleLanguagesKey];

    v16 = [v4 userInfo];
    v17 = [v16 objectForKey:PBBridgeGizmoAppleLocaleKey];

    if (!v17) {
      v17 = @"en_US";
    }
    v29 = (void *)v13;
    v30 = (void *)v12;
    id v18 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences" pairingID:v12 pairingDataStore:v13];
    v28 = (void *)v15;
    [v18 setObject:v15 forKey:@"AppleLanguages"];
    [v18 setObject:v17 forKey:@"AppleLocale"];
    v19 = +[NSLocale componentsFromLocaleIdentifier:v17];
    v20 = +[NSLocale currentLocale];
    v21 = [v20 localeIdentifier];
    v22 = +[NSLocale componentsFromLocaleIdentifier:v21];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001033F0;
    v33[3] = &unk_1002472A8;
    id v23 = v19;
    id v34 = v23;
    id v24 = v22;
    id v35 = v24;
    v25 = objc_retainBlock(v33);
    if (((unsigned int (*)(void *, const NSLocaleKey))v25[2])(v25, NSLocaleLanguageCode)
      && ((unsigned int (*)(void *, const NSLocaleKey))v25[2])(v25, NSLocaleScriptCode)
      && ((unsigned int (*)(void *, const NSLocaleKey))v25[2])(v25, NSLocaleCountryCode)
      && ((unsigned int (*)(void *, const NSLocaleKey))v25[2])(v25, NSLocaleVariantCode))
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10010347C;
      v31[3] = &unk_1002472D0;
      id v32 = v18;
      v26 = objc_retainBlock(v31);
      CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
      ((void (*)(void *, const __CFString *))v26[2])(v26, @"AppleICUForce12HourTime");
      ((void (*)(void *, const __CFString *))v26[2])(v26, @"AppleICUForce24HourTime");
    }
    id v27 = [v18 synchronize];
    [(COSTermsConditionsController *)self requestOnlineTermsAndConditions];
  }
  else
  {
    v8 = pbb_setupflow_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v37 = 84;
      __int16 v38 = 2080;
      v39 = "-[COSTermsConditionsController warrantySentinelResponse:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%d %s: Ignoring callback because no longer top controller", buf, 0x12u);
    }
  }
}

- (void)offlineTermsResponse:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6 = [(COSTermsConditionsController *)self delegate];
  v7 = [v6 nextControllerAfterHold];

  v8 = pbb_setupflow_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == self)
  {
    if (v9)
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling offline terms response", (uint8_t *)v30, 2u);
    }

    v8 = [v4 userInfo];
    uint64_t v10 = PBBridgeOfflineTermsLicenseKey;
    v11 = [v8 objectForKeyedSubscript:PBBridgeOfflineTermsLicenseKey];
    uint64_t v12 = [(COSTermsConditionsController *)self termsEventWithDocumentationID:v10 data:v11];
    offlineLicense = self->_offlineLicense;
    self->_offlineLicense = v12;

    v14 = [v8 objectForKeyedSubscript:PBBridgeOfflineTermsMultitermsKey];
    uint64_t v15 = [(COSTermsConditionsController *)self termsEventWithDocumentationID:v10 data:v14];
    offlineMultiterms = self->_offlineMultiterms;
    self->_offlineMultiterms = v15;

    v17 = [v8 objectForKeyedSubscript:PBBridgeOfflineTermsWarrantyKey];
    id v18 = [(COSTermsConditionsController *)self termsEventWithDocumentationID:v10 data:v17];
    offlineWarranty = self->_offlineWarranty;
    self->_offlineWarranty = v18;

    if (self->_offlineMultiterms)
    {
      v20 = (RUILoader *)objc_alloc_init((Class)RUILoader);
      loader = self->_loader;
      self->_loader = v20;

      v22 = self->_loader;
      id v23 = objc_opt_new();
      [(RUILoader *)v22 setStyle:v23];

      [(RUILoader *)self->_loader setDelegate:self];
      id v24 = self->_loader;
      WeakRetained = [(NRTermsEvent *)self->_offlineMultiterms termsText];
      v26 = +[NSBundle mainBundle];
      id v27 = [v26 resourceURL];
      [(RUILoader *)v24 loadXMLUIWithData:WeakRetained baseURL:v27];
    }
    else
    {
      v28 = [(COSTermsConditionsController *)self offlineLicenseController];
      viewController = self->_viewController;
      self->_viewController = v28;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained buddyControllerReleaseHold:self];
    }

    [(COSTermsConditionsController *)self endPerformancePhases];
  }
  else if (v9)
  {
    v30[0] = 67109378;
    v30[1] = 143;
    __int16 v31 = 2080;
    id v32 = "-[COSTermsConditionsController offlineTermsResponse:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%d %s: Ignoring callback because no longer top controller", (uint8_t *)v30, 0x12u);
  }
}

- (id)termsEventWithDocumentationID:(id)a3 data:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    v7 = +[UIApplication sharedApplication];
    v8 = [v7 activeWatch];

    BOOL v9 = [v8 valueForProperty:NRDevicePropertyPairingID];
    id v10 = [objc_alloc((Class)NRTermsEvent) initWithDeviceID:v9];
    [v10 setTermsText:v5];

    [v10 setDocumentationID:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)offlineLicenseController
{
  offlineLicenseVC = self->_offlineLicenseVC;
  if (!offlineLicenseVC)
  {
    id v4 = [BuddySimpleTCController alloc];
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"TERMS_AND_CONDITIONS" value:&stru_100249230 table:@"Localizable"];
    v7 = [(BuddySimpleTCController *)v4 initWithTitle:v6 content:self->_offlineLicense];
    v8 = self->_offlineLicenseVC;
    self->_offlineLicenseVC = v7;

    [(BuddySimpleTCController *)self->_offlineLicenseVC setDelegate:self];
    offlineLicenseVC = self->_offlineLicenseVC;
  }

  return offlineLicenseVC;
}

- (id)offlineWarrantyController
{
  offlineWarrantyVC = self->_offlineWarrantyVC;
  if (!offlineWarrantyVC)
  {
    id v4 = [BuddySimpleTCController alloc];
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"WARRANTY" value:&stru_100249230 table:@"Localizable"];
    v7 = [(BuddySimpleTCController *)v4 initWithTitle:v6 content:self->_offlineWarranty];
    v8 = self->_offlineWarrantyVC;
    self->_offlineWarrantyVC = v7;

    [(BuddySimpleTCController *)self->_offlineWarrantyVC setDelegate:self];
    offlineWarrantyVC = self->_offlineWarrantyVC;
  }

  return offlineWarrantyVC;
}

- (void)requestOnlineTermsAndConditions
{
  objc_super v3 = +[UIApplication sharedApplication];
  id v4 = [v3 activeWatch];

  id v5 = [[COSAAGenericTermsUIRequest alloc] initWithGizmoDevice:v4 showWarranty:self->_warrantySentinelExists];
  id v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 _bridgeConciseDebugDescription];
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting online T&Cs for device: (%@)", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100103C08;
  v8[3] = &unk_1002472F8;
  objc_copyWeak(&v9, (id *)buf);
  [(COSAAGenericTermsUIRequest *)v5 performRequestWithHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)handleOnlineTermsAndConditionsResponse:(id)a3 forRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = pbb_setupflow_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Online T&Cs request callback called with response (%@); error: (%@)",
      buf,
      0x16u);
  }

  id v12 = v8;
  uint64_t v13 = [v12 responseData];
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100103E64;
  block[3] = &unk_100245E48;
  objc_copyWeak(&v23, (id *)buf);
  id v19 = v10;
  id v20 = v12;
  id v21 = v13;
  id v22 = v9;
  id v14 = v9;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)_showTermsFromRequest:(id)a3
{
  id v4 = a3;
  id v5 = (RUILoader *)objc_alloc_init((Class)RUILoader);
  loader = self->_loader;
  self->_loader = v5;

  v7 = self->_loader;
  id v8 = objc_opt_new();
  [(RUILoader *)v7 setStyle:v8];

  [(RUILoader *)self->_loader setDelegate:self];
  id v9 = self->_loader;
  id v12 = [(NRTermsEvent *)self->_onlineTerms termsText];
  id v10 = [v4 urlRequest];

  v11 = [v10 URL];
  [(RUILoader *)v9 loadXMLUIWithData:v12 baseURL:v11];
}

- (void)retrieveOfflineTerms
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"offlineTermsResponse:" name:PBBridgeOfflineTermsNotification object:0];

  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting offline terms", v7, 2u);
  }

  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 bridgeController];
  [v6 queryGizmoForOfflineTerms];
}

- (id)_navigationController
{
  return [(UIViewController *)self->_viewController navigationController];
}

- (void)enteredCompatibilityState:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryCompatibilityStateKey];
  unsigned __int16 v6 = (unsigned __int16)[v5 unsignedIntValue];

  v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Terms Controller: Entered Compatibility State: %d", (uint8_t *)v9, 8u);
  }

  if (v6 >= 3u)
  {
    [(COSTermsConditionsController *)self queryGizmoForShowWarrantySentinel];
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
  }
}

- (void)queryGizmoForShowWarrantySentinel
{
  objc_super v3 = +[COSBackupManager sharedBackupManager];
  id v7 = [v3 deviceNameToRestore];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"warrantySentinelResponse:" name:PBBridgeWarrantySentinelNotification object:0];

  id v5 = +[UIApplication sharedApplication];
  unsigned __int16 v6 = [v5 bridgeController];
  [v6 queryGizmoForShowWarrantySentinelAndRestoreDeviceName:v7];
}

- (id)holdActivityIdentifier
{
  return @"TermsHoldActivity";
}

- (void)endPerformancePhases
{
  if (PBLogPerformanceMetrics())
  {
    id v9 = [(COSTermsConditionsController *)self holdActivityIdentifier];
    objc_super v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v3 endMacroActivity:v9 beginTime:CFAbsoluteTimeGetCurrent()];
    double v5 = v4;

    +[PBBridgeCAReporter pushTimingForTypeNamed:v9 withValue:v5];
    unsigned __int16 v6 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v6 endMacroActivity:@"COSPostWristChoiceUserWaitPhase" beginTime:CFAbsoluteTimeGetCurrent()];
    double v8 = v7;

    +[PBBridgeCAReporter pushTimingForTypeNamed:@"COSPostWristChoiceUserWaitPhase" withValue:v8];
  }
}

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  return 0;
}

- (BOOL)holdBeforeDisplaying
{
  if (PBLogPerformanceMetrics())
  {
    objc_super v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    double v4 = [(COSTermsConditionsController *)self holdActivityIdentifier];
    [v3 beginMacroActivity:v4 beginTime:CFAbsoluteTimeGetCurrent()];
  }
  return 1;
}

- (UIViewController)viewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    double v4 = pbb_setupflow_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int16 v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Terms Controller has no viewController assigned yet", v6, 2u);
    }

    viewController = self->_viewController;
  }

  return viewController;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  double v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification;
  [v4 addObserver:self selector:"enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  unsigned __int16 v6 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v7 = [v6 compatibilityState];

  if (v7 < 3)
  {
    id v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Terms Controller has begun observing for Compatibility State Changes", v10, 2u);
    }
  }
  else
  {
    double v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:v5 object:0];

    [(COSTermsConditionsController *)self queryGizmoForShowWarrantySentinel];
  }
}

- (void)markTermsAsAcceptedWithTermsEvent:(id)a3
{
  id v4 = a3;
  if (self->_warrantySentinelExists)
  {
    uint64_t v5 = +[UIApplication sharedApplication];
    unsigned __int16 v6 = [v5 bridgeController];
    [v6 tellGizmoToDeleteWarrantySentinel];
  }
  if (v4)
  {
    unsigned int v7 = +[UIApplication sharedApplication];
    WeakRetained = [v7 activeWatch];

    id v9 = [WeakRetained valueForProperty:NRDevicePropertyPairingID];
    id v10 = objc_alloc_init((Class)NRTermsAcknowledgementRegistry);
    [v4 updateEventDate];
    [v4 setEventType:4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100104BB0;
    v11[3] = &unk_100243A08;
    v11[4] = self;
    [v10 add:v4 forDeviceID:v9 withCompletion:v11];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained buddyControllerDone:self];
  }
}

- (void)presentConfirmationAlertWithTitle:(id)a3 message:(id)a4 okButtonTitle:(id)a5 cancelButtonTitle:(id)a6 termsEvent:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v16 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

  [v15 addAction:v16];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100104E3C;
  v22[3] = &unk_100247320;
  v22[4] = self;
  id v23 = v12;
  id v17 = v12;
  id v18 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v22];

  [v15 addAction:v18];
  id v19 = pbb_setupflow_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Presenting 'confirmation' alert", v21, 2u);
  }

  id v20 = [(COSTermsConditionsController *)self viewController];
  [v20 presentViewController:v15 animated:1 completion:&stru_100247340];
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [v8 defaultPages];
  id v10 = [v9 count];

  if (v10 && ([v8 setDelegate:self], !self->_viewController))
  {
    id v14 = [v8 defaultPages];
    id v15 = [v14 objectAtIndex:0];
    viewController = self->_viewController;
    self->_viewController = v15;

    objc_storeStrong((id *)&self->_rootObjectModel, a4);
    id v17 = pbb_setupflow_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v21[0] = 67109120;
      v21[1] = [WeakRetained buddyControllerIsBeingHeldOff:self];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Terms controller being held: %d", (uint8_t *)v21, 8u);
    }
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 buddyControllerReleaseHold:self];
  }
  else
  {
    if (!self->_objectModels)
    {
      v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      objectModels = self->_objectModels;
      self->_objectModels = v11;
    }
    if (a5 == 4)
    {
      [(COSTermsConditionsController *)self _popObjectModelAnimated:1];
    }
    else if (a5 == 2)
    {
      id v13 = [(COSTermsConditionsController *)self _navigationController];
      [v8 presentInParentViewController:v13 animated:1 completion:&stru_100247360];

      [(NSMutableArray *)self->_objectModels addObject:v8];
    }
  }
  [(COSTermsConditionsController *)self _cleanupLoader];
  [(RUIPage *)self->_loadingPage setLoading:0];
  loadingPage = self->_loadingPage;
  self->_loadingPage = 0;
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  linkPressLoadCompletion = (void (**)(id, BOOL, id))self->_linkPressLoadCompletion;
  if (linkPressLoadCompletion)
  {
    linkPressLoadCompletion[2](linkPressLoadCompletion, v9 == 0, v9);
    id v12 = self->_linkPressLoadCompletion;
    self->_linkPressLoadCompletion = 0;
  }
  if (v9)
  {
    id v13 = pbb_setupflow_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001750AC((uint64_t)v9, v13);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v15 = [WeakRetained buddyControllerIsBeingHeldOff:self];

    if (v15)
    {
      id v16 = pbb_setupflow_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100175068(v16);
      }

      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 buddyControllerReleaseHold:self];
    }
    [(RUIPage *)self->_loadingPage setLoading:0];
    loadingPage = self->_loadingPage;
    self->_loadingPage = 0;

    [(COSTermsConditionsController *)self _cleanupLoader];
  }
}

- (void)_cleanupLoader
{
  [(RUILoader *)self->_loader cancel];
  [(RUILoader *)self->_loader setDelegate:0];
  loader = self->_loader;
  self->_loader = 0;
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_objectModels count])
  {
    id v14 = [(NSMutableArray *)self->_objectModels lastObject];
    uint64_t v5 = [v14 displayedPages];
    id v6 = [v5 count];
    unsigned int v7 = [(COSTermsConditionsController *)self _navigationController];
    uint64_t v8 = (uint64_t)v6 - 1;
    if (v8 >= 0)
    {
      do
      {
        id v9 = [v5 objectAtIndexedSubscript:v8];
        id v10 = [v7 topViewController];

        if (v10 == v9)
        {
          if (v8) {
            BOOL v11 = 0;
          }
          else {
            BOOL v11 = v3;
          }
          id v12 = [v7 popViewControllerAnimated:v11];
        }
      }
      while (v8-- > 0);
    }
    [(NSMutableArray *)self->_objectModels removeLastObject];
  }
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:@"agree"])
  {
    if (self->_didAgree)
    {
      if (self->_appearingFromBackNavigation)
      {
        id v9 = pbb_setupflow_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User has already agreed to terms, advancing.", v19, 2u);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained buddyControllerDone:self];

        self->_appearingFromBackNavigation = 0;
      }
      goto LABEL_25;
    }
    self->_didAgree = 1;
    if (self->_onlineTerms)
    {
      id v12 = [v7 clientInfo];
      id v13 = [v12 objectForKey:@"agreeDialogTitle"];
      id v14 = [v12 objectForKey:@"agreeDialogText"];
      unsigned int v15 = [v12 objectForKey:@"agreeDialogOK"];
      uint64_t v16 = [v12 objectForKey:@"agreeDialogCancel"];
      id v17 = (void *)v16;
      if (v14 && v15 && v16)
      {
        [(COSTermsConditionsController *)self presentConfirmationAlertWithTitle:v13 message:v14 okButtonTitle:v15 cancelButtonTitle:v16 termsEvent:self->_onlineTerms];
      }
      else
      {
        id v18 = pbb_setupflow_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User agreed to terms with no confirmation", buf, 2u);
        }

        [(COSTermsConditionsController *)self markTermsAsAcceptedWithTermsEvent:self->_onlineTerms];
      }

      goto LABEL_24;
    }
    [(COSTermsConditionsController *)self buddyTCSubController:self->_viewController didFinishWithAgree:1];
LABEL_25:
    [(COSTermsConditionsController *)self _cleanupLoader];
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"disagree"])
  {
    [(COSTermsConditionsController *)self _presentDisagreeConfirmationAlert];
    goto LABEL_25;
  }
  if ([v8 isEqualToString:@"iOSTerms"])
  {
    uint64_t v11 = [(COSTermsConditionsController *)self offlineLicenseController];
LABEL_18:
    id v12 = (void *)v11;
    id v13 = [(UIViewController *)self->_viewController navigationController];
    [v13 pushViewController:v12 animated:1];
LABEL_24:

    goto LABEL_25;
  }
  if ([v8 isEqualToString:@"iOSWarranty"])
  {
    uint64_t v11 = [(COSTermsConditionsController *)self offlineWarrantyController];
    goto LABEL_18;
  }
LABEL_26:
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [v11 absoluteString];
    *(_DWORD *)buf = 138412290;
    v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tapped URl: %@", buf, 0xCu);
  }
  id v16 = objc_retainBlock(v13);

  id linkPressLoadCompletion = self->_linkPressLoadCompletion;
  self->_id linkPressLoadCompletion = v16;

  if (!v11) {
    goto LABEL_5;
  }
  id v18 = [(RUILoader *)self->_loader URL];
  id v19 = [v18 absoluteURL];
  id v20 = [v11 absoluteURL];
  unsigned __int8 v21 = [v19 isEqual:v20];

  if ((v21 & 1) == 0)
  {
LABEL_5:
    id v22 = [v10 visiblePage];
    loadingPage = self->_loadingPage;
    self->_loadingPage = v22;

    [(RUIPage *)self->_loadingPage setLoading:1];
    [(COSTermsConditionsController *)self _cleanupLoader];
    id v24 = [v12 lowercaseString];
    unsigned int v25 = [v24 isEqualToString:@"post"];

    if (v25)
    {
      __int16 v26 = [v10 postbackData];
    }
    else
    {
      __int16 v26 = 0;
    }
    id v27 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v11 cachePolicy:1 timeoutInterval:30.0];
    v28 = v27;
    if (v26)
    {
      [v27 setHTTPBody:v26];
      [v28 setHTTPMethod:@"POST"];
      [v28 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    }
    id v47 = v12;
    if (self->_warrantySentinelExists) {
      [v28 setValue:@"true" forHTTPHeaderField:@"X-MMe-Show-Warranty"];
    }
    v29 = +[AADeviceInfo clientInfoHeader];
    [v28 setValue:v29 forHTTPHeaderField:@"X-MMe-Client-Info"];

    v30 = +[NSLocale currentLocale];
    __int16 v31 = [v30 objectForKey:NSLocaleCountryCode];
    id v32 = [v31 uppercaseString];
    [v28 setValue:v32 forHTTPHeaderField:@"X-MMe-Country"];

    v33 = +[NSLocale preferredLanguages];
    uint64_t v34 = [v33 componentsJoinedByString:@","];
    id v35 = (void *)v34;
    if (v34) {
      CFStringRef v36 = (const __CFString *)v34;
    }
    else {
      CFStringRef v36 = @"en";
    }
    [v28 addValue:v36 forHTTPHeaderField:@"X-MMe-Language"];

    int v37 = +[UIApplication sharedApplication];
    __int16 v38 = [v37 activeWatch];

    v39 = +[COSAAGenericTermsUIRequest clientInfoHeaderForDevice:v38];
    v40 = +[COSAAGenericTermsUIRequest pairedClientInfoHeaderName];
    [v28 setValue:v39 forHTTPHeaderField:v40];

    v41 = [v38 valueForProperty:NRDevicePropertyModelNumber];
    v42 = +[COSAAGenericTermsUIRequest deviceModelHeaderName];
    [v28 setValue:v41 forHTTPHeaderField:v42];

    v43 = (RUILoader *)objc_alloc_init((Class)RUILoader);
    loader = self->_loader;
    self->_loader = v43;

    v45 = self->_loader;
    v46 = objc_opt_new();
    [(RUILoader *)v45 setStyle:v46];

    [(RUILoader *)self->_loader setDelegate:self];
    [(RUILoader *)self->_loader loadXMLUIWithRequest:v28];

    id v12 = v47;
  }
}

- (void)buddyTCSubController:(id)a3 didFinishWithAgree:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  if (v4)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"AGREE_DIALOG_TITLE" value:&stru_100249230 table:@"Localizable"];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"AGREE_DIALOG_TEXT" value:&stru_100249230 table:@"Localizable"];

    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Localizable"];

    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"AGREE" value:&stru_100249230 table:@"Localizable"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v15 content];
    }
    else
    {
      id v14 = 0;
    }
    [(COSTermsConditionsController *)self presentConfirmationAlertWithTitle:v7 message:v9 okButtonTitle:v13 cancelButtonTitle:v11 termsEvent:v14];
  }
  else
  {
    [(COSTermsConditionsController *)self _presentDisagreeConfirmationAlert];
  }
}

- (void)_presentDisagreeConfirmationAlert
{
  BOOL v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"DISAGREE_DIALOG_TITLE" value:&stru_100249230 table:@"Localizable"];
  uint64_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"DISAGREE_DIALOG_TEXT" value:&stru_100249230 table:@"Localizable"];
  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"DISAGREE_CANCEL_SETUP" value:&stru_100249230 table:@"Localizable"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:&stru_100247380];
  [v7 addAction:v10];

  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"DISAGREE_CONTINUE" value:&stru_100249230 table:@"Localizable"];
  id v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:0];
  [v7 addAction:v13];

  id v14 = pbb_setupflow_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presenting disagree confirmation alert", v16, 2u);
  }

  id v15 = [(COSTermsConditionsController *)self viewController];
  [v15 presentViewController:v7 animated:1 completion:&stru_1002473A0];
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  unsigned int v2 = +[COSInitialPropertyExchangeViewController controllerNeedsToRun];
  double result = 5.0;
  if (v2) {
    return 3.0;
  }
  return result;
}

- (id)localizedWaitScreenDescription
{
  unsigned int v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"TERMS_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (BOOL)appearingFromBackNavigation
{
  return self->_appearingFromBackNavigation;
}

- (void)setAppearingFromBackNavigation:(BOOL)a3
{
  self->_appearingFromBackNavigation = a3;
}

- (BOOL)warrantySentinelExists
{
  return self->_warrantySentinelExists;
}

- (void)setWarrantySentinelExists:(BOOL)a3
{
  self->_warrantySentinelExists = a3;
}

- (BOOL)didAgree
{
  return self->_didAgree;
}

- (void)setDidAgree:(BOOL)a3
{
  self->_didAgree = a3;
}

- (NRTermsEvent)onlineTerms
{
  return self->_onlineTerms;
}

- (void)setOnlineTerms:(id)a3
{
}

- (RUILoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (RUIPage)loadingPage
{
  return self->_loadingPage;
}

- (void)setLoadingPage:(id)a3
{
}

- (NSMutableArray)objectModels
{
  return self->_objectModels;
}

- (void)setObjectModels:(id)a3
{
}

- (void)setViewController:(id)a3
{
}

- (NRTermsEvent)offlineLicense
{
  return self->_offlineLicense;
}

- (void)setOfflineLicense:(id)a3
{
}

- (NRTermsEvent)offlineMultiterms
{
  return self->_offlineMultiterms;
}

- (void)setOfflineMultiterms:(id)a3
{
}

- (NRTermsEvent)offlineWarranty
{
  return self->_offlineWarranty;
}

- (void)setOfflineWarranty:(id)a3
{
}

- (BuddySimpleTCController)offlineLicenseVC
{
  return self->_offlineLicenseVC;
}

- (void)setOfflineLicenseVC:(id)a3
{
}

- (BuddySimpleTCController)offlineWarrantyVC
{
  return self->_offlineWarrantyVC;
}

- (void)setOfflineWarrantyVC:(id)a3
{
}

- (id)linkPressLoadCompletion
{
  return self->_linkPressLoadCompletion;
}

- (void)setLinkPressLoadCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkPressLoadCompletion, 0);
  objc_storeStrong((id *)&self->_offlineWarrantyVC, 0);
  objc_storeStrong((id *)&self->_offlineLicenseVC, 0);
  objc_storeStrong((id *)&self->_offlineWarranty, 0);
  objc_storeStrong((id *)&self->_offlineMultiterms, 0);
  objc_storeStrong((id *)&self->_offlineLicense, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_loadingPage, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_onlineTerms, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_rootObjectModel, 0);
}

@end