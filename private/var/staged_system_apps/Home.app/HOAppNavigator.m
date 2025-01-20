@interface HOAppNavigator
+ (HOAppNavigator)navigatorWithRootViewController:(id)a3 baseController:(id)a4;
+ (void)addViewControllersToRegistry;
- (HOBaseController)baseController;
- (HOHomePodProfileInstaller)homePodProfileInstaller;
- (UIViewController)rootViewController;
- (id)_cameraProfileWithName:(id)a3 home:(id)a4 room:(id)a5;
- (id)_selectCurrentTabAnimated:(BOOL)a3;
- (id)_selectHome:(id)a3;
- (id)_selectTabWithIdentifier:(id)a3 animated:(BOOL)a4;
- (id)_serviceWithName:(id)a3 type:(id)a4 home:(id)a5 room:(id)a6;
- (id)_showDashboardForRoomContainedObject:(id)a3 animated:(BOOL)a4;
- (id)_showHomeTabForHome:(id)a3 animated:(BOOL)a4;
- (id)_showLocationListWithHome:(id)a3 customizationBlock:(id)a4;
- (id)_showRoom:(id)a3 animated:(BOOL)a4;
- (id)_showRoomContainedCamera:(id)a3 forCameraClip:(id)a4;
- (id)_showRoomContainedObject:(id)a3 secondaryDestination:(unint64_t)a4;
- (id)_showRoomSettingsWithRoom:(id)a3;
- (id)_showUser:(id)a3 customizationBlock:(id)a4;
- (id)addAccessoryWithURL:(id)a3;
- (id)createOrEditActionSetWithName:(id)a3 home:(id)a4 switchToHomeTab:(BOOL)a5;
- (id)createOrShowRoomWithName:(id)a3 home:(id)a4;
- (id)currentViewController;
- (id)dashboardContextTypeDescriptionForAnalytics;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)presentConfirmationAlertForExecutingTriggerWithIdentifier:(id)a3;
- (id)showAboutResidentDeviceView;
- (id)showAccessory:(id)a3 secondaryDestination:(unint64_t)a4;
- (id)showAccessoryTypeGroup:(id)a3 forHome:(id)a4 animated:(BOOL)a5;
- (id)showAddAutomationFlow;
- (id)showAddSceneFlowOnCurrentTab;
- (id)showAddSceneFlowOnHomeTab;
- (id)showAutomationTab;
- (id)showBridgeSettingsForAccessory:(id)a3;
- (id)showBridgeSettingsForHome:(id)a3;
- (id)showCameraProfile:(id)a3 clipID:(id)a4;
- (id)showCamerasSectionWithTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5;
- (id)showCardForHomeKitIdentifier:(id)a3 destination:(unint64_t)a4 secondaryDestination:(unint64_t)a5 inHome:(id)a6;
- (id)showDefaultAccountForHome:(id)a3;
- (id)showDiscoverTab;
- (id)showDropInUI:(id)a3 home:(id)a4;
- (id)showFaceRecognitionSettingsForHome:(id)a3;
- (id)showFaceRecognitionSettingsForPerson:(id)a3 personManager:(id)a4 inHome:(id)a5;
- (id)showFaceRecognitionSettingsForUnknownPersonEvent:(id)a3 inHome:(id)a4;
- (id)showFeedbackFlowForCameraClipID:(id)a3 cameraProfile:(id)a4;
- (id)showHH2OnboardingFlowForHome:(id)a3;
- (id)showHome:(id)a3;
- (id)showHomeEditor;
- (id)showHomeInvitation:(id)a3;
- (id)showHomePodProfileInstallationFlowWithSender:(id)a3;
- (id)showHomeSettingsForHome:(id)a3;
- (id)showHomeTab;
- (id)showLocksFirmwareSetupForHome:(id)a3;
- (id)showLocksOnboardingForHome:(id)a3 onboardingType:(unint64_t)a4;
- (id)showNetworkSettingsForAccessory:(id)a3 home:(id)a4;
- (id)showNetworkSettingsForHome:(id)a3;
- (id)showNetworkSettingsForNetworkConfigurationProfile:(id)a3 home:(id)a4;
- (id)showNotificationSettingsForHome:(id)a3;
- (id)showNotificationSettingsForHomeKitObject:(id)a3 inHome:(id)a4;
- (id)showRecognizeMyVoiceSettingsForHome:(id)a3 showEnablementSheet:(BOOL)a4;
- (id)showRoom:(id)a3;
- (id)showRoomContainedCamera:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)showRoomEditor;
- (id)showRoomSettingsForRoom:(id)a3;
- (id)showRoomWithName:(id)a3;
- (id)showScenesSectionWithDashboardTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5;
- (id)showSettingsForCameraProfile:(id)a3;
- (id)showSiriPersonalRequestsSettingsForHome:(id)a3 showEnablementSheet:(BOOL)a4;
- (id)showSoftwareUpdateForHome:(id)a3;
- (id)showSpeakersAndTVsSectionWithTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5;
- (id)showUserDetails:(id)a3;
- (id)showUserLockSettingsForHome:(id)a3;
- (void)_addPeopleToHome:(id)a3;
- (void)_configureCameraDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6;
- (void)_configureDashboardContextWithAccessoryTypeGroup:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6;
- (void)_configureDashboardContextWithHome:(id)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)_configureDashboardContextWithRoom:(id)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)_configureScenesDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6;
- (void)_configureSpeakersAndTVsDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6;
- (void)_createActionSetWithName:(id)a3 home:(id)a4;
- (void)_createHomeWithName:(id)a3;
- (void)_createRoomWithName:(id)a3 home:(id)a4;
- (void)_editActionSet:(id)a3 home:(id)a4;
- (void)_showCreateOrEditActionSetViewControllerWithActionSetName:(id)a3 home:(id)a4;
- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3;
- (void)addAccessoryToHome:(id)a3 room:(id)a4;
- (void)addAutomationToHome:(id)a3;
- (void)addHome;
- (void)addLocationViewController:(id)a3 didFinishWithHome:(id)a4;
- (void)addPeopleToHome:(id)a3;
- (void)addRoomToHome:(id)a3;
- (void)addSceneToHome:(id)a3;
- (void)configureDashboardContextWithDashboardContext:(id)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)createOrShowHomeWithName:(id)a3 home:(id)a4;
- (void)dismissViewController;
- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4;
- (void)locationListViewControllerDidFinish:(id)a3;
- (void)scrollToDefaultPositionInCurrentContextAnimated:(BOOL)a3;
- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3;
- (void)setBaseController:(id)a3;
- (void)setHomePodProfileInstaller:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)showAllHomesSettings;
- (void)showCameraWithName:(id)a3 homeName:(id)a4 startDate:(id)a5 endDate:(id)a6 roomName:(id)a7;
- (void)showDashboardSectionListViewController:(id)a3;
- (void)showHomeDashboardCellForActionSet:(id)a3 executeActionSetFuture:(id)a4;
- (void)showHomeForName:(id)a3;
- (void)showHomeSettings:(id)a3;
- (void)showHomeWithFuture:(id)a3;
- (void)showRoomSettings:(id)a3;
- (void)showServiceWithName:(id)a3 serviceType:(id)a4 homeName:(id)a5 roomName:(id)a6;
- (void)showStatusDetailsForStatusItemClass:(Class)a3;
@end

@implementation HOAppNavigator

+ (HOAppNavigator)navigatorWithRootViewController:(id)a3 baseController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setRootViewController:v6];

  [v7 setBaseController:v5];

  return (HOAppNavigator *)v7;
}

- (void)setRootViewController:(id)a3
{
}

- (void)setBaseController:(id)a3
{
}

+ (void)addViewControllersToRegistry
{
  if (qword_1000DE8E0 != -1) {
    dispatch_once(&qword_1000DE8E0, &stru_1000C30E8);
  }
}

- (HOHomePodProfileInstaller)homePodProfileInstaller
{
  homePodProfileInstaller = self->_homePodProfileInstaller;
  if (!homePodProfileInstaller)
  {
    v4 = objc_alloc_init(HOHomePodProfileInstaller);
    id v5 = self->_homePodProfileInstaller;
    self->_homePodProfileInstaller = v4;

    homePodProfileInstaller = self->_homePodProfileInstaller;
  }

  return homePodProfileInstaller;
}

- (void)createOrShowHomeWithName:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002FA94;
  v14[3] = &unk_1000C3138;
  objc_copyWeak(&v15, &location);
  v8 = [v7 flatMap:v14];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002FBC0;
  v11[3] = &unk_1000C3160;
  objc_copyWeak(&v13, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = [v8 recover:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)showHomeWithFuture:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FE00;
  v6[3] = &unk_1000C3138;
  objc_copyWeak(&v7, &location);
  id v5 = [v4 flatMap:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)showHomeForName:(id)a3
{
  id v4 = +[HMHomeManager hf_homeFutureForName:a3];
  [(HOAppNavigator *)self showHomeWithFuture:v4];
}

- (id)createOrShowRoomWithName:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000300BC;
  v12[3] = &unk_1000C3188;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v13 = v8;
  id v9 = [v7 flatMap:v12];
  id v10 = [v9 recover:&stru_1000C31A8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

- (id)createOrEditActionSetWithName:(id)a3 home:(id)a4 switchToHomeTab:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100030334;
  v13[3] = &unk_1000C31F8;
  objc_copyWeak(&v15, &location);
  BOOL v16 = a5;
  id v10 = v8;
  id v14 = v10;
  v11 = [v9 addSuccessBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_showCreateOrEditActionSetViewControllerWithActionSetName:(id)a3 home:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ((objc_msgSend(v6, "hf_shouldBlockCurrentUserFromHome") & 1) == 0)
  {
    id v7 = [v6 actionSets];
    id v8 = +[NSPredicate predicateWithFormat:@"name LIKE[cd] %@", v11];
    id v9 = [v7 filteredArrayUsingPredicate:v8];

    if ([v9 count])
    {
      id v10 = [v9 firstObject];
      [(HOAppNavigator *)self _editActionSet:v10 home:v6];
    }
    else
    {
      [(HOAppNavigator *)self _createActionSetWithName:v11 home:v6];
    }
  }
}

- (void)showServiceWithName:(id)a3 serviceType:(id)a4 homeName:(id)a5 roomName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Show service:%@, type:%@, home:%@, room:%@", buf, 0x2Au);
  }

  id v15 = +[HMHomeManager hf_homeFutureForName:v12];
  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100030764;
  v20[3] = &unk_1000C3220;
  objc_copyWeak(&v24, (id *)buf);
  id v16 = v13;
  id v21 = v16;
  id v17 = v10;
  id v22 = v17;
  id v18 = v11;
  id v23 = v18;
  id v19 = [v15 flatMap:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)showCameraWithName:(id)a3 homeName:(id)a4 startDate:(id)a5 endDate:(id)a6 roomName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    id v39 = v13;
    __int16 v40 = 2112;
    id v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Show camera:%@, startDate:%@, endDate:%@, home:%@, room:%@", buf, 0x34u);
  }

  id v18 = +[HMHomeManager hf_homeFutureForName:v13];
  objc_initWeak((id *)buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100030A80;
  v25[3] = &unk_1000C3298;
  objc_copyWeak(&v31, (id *)buf);
  id v19 = v16;
  id v26 = v19;
  id v20 = v12;
  id v27 = v20;
  id v21 = v13;
  id v28 = v21;
  id v22 = v14;
  id v29 = v22;
  id v23 = v15;
  id v30 = v23;
  id v24 = [v18 flatMap:v25];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

- (void)showHomeDashboardCellForActionSet:(id)a3 executeActionSetFuture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HFHomeKitDispatcher sharedDispatcher];
  objc_initWeak(&location, self);
  id v9 = [v8 homeFuture];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100030FB0;
  v11[3] = &unk_1000C1F08;
  objc_copyWeak(&v12, &location);
  id v10 = [v9 addSuccessBlock:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)presentConfirmationAlertForExecutingTriggerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOAppNavigator *)self baseController];
  id v6 = [v5 presentConfirmationAlertForExecutingTriggerWithIdentifier:v4];

  return v6;
}

- (id)showHomeInvitation:(id)a3
{
  id v4 = a3;
  id v5 = [(HOAppNavigator *)self baseController];
  [v5 showOnboardingIfNeededForHomeInvitation:v4];

  return +[NAFuture futureWithNoResult];
}

- (id)showRoomWithName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 homeFuture];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031278;
  v10[3] = &unk_1000C3188;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = [v6 flatMap:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (id)showCardForHomeKitIdentifier:(id)a3 destination:(unint64_t)a4 secondaryDestination:(unint64_t)a5 inHome:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(HOAppNavigator *)self _selectHome:v11];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000316F8;
  v28[3] = &unk_1000C3368;
  v28[4] = self;
  id v13 = v11;
  id v29 = v13;
  id v14 = [v12 flatMap:v28];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003192C;
  v25[3] = &unk_1000C33D0;
  id v26 = v13;
  id v27 = &stru_1000C3340;
  void v25[4] = self;
  id v15 = v13;
  id v16 = [v14 flatMap:v25];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100031C34;
  v20[3] = &unk_1000C33F8;
  id v21 = v10;
  id v22 = &stru_1000C33A8;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v17 = v10;
  id v18 = [v16 flatMap:v20];

  return v18;
}

- (id)showAccessory:(id)a3 secondaryDestination:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 home];
  id v8 = [objc_alloc((Class)HFBridgeItemProvider) initWithHome:v7];
  id v9 = [v8 reloadItems];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100031ECC;
  v15[3] = &unk_1000C3448;
  id v16 = v8;
  id v17 = v6;
  id v18 = v7;
  id v19 = self;
  unint64_t v20 = a4;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  id v13 = [v9 flatMap:v15];

  return v13;
}

- (id)showHomePodProfileInstallationFlowWithSender:(id)a3
{
  id v4 = a3;
  id v5 = [(HOAppNavigator *)self homePodProfileInstaller];
  unsigned int v6 = [v5 isInstallNavigationControllerPresented];

  if (v6)
  {
    id v7 = [(HOAppNavigator *)self homePodProfileInstaller];
    [v7 dismissInstallProfileViewControllerWithAnimation:0];
  }
  [(HOAppNavigator *)self dismissViewController];
  id v8 = [(HOAppNavigator *)self showHomeTab];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032294;
  v12[3] = &unk_1000C3470;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  id v10 = [v8 addCompletionBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (id)showSoftwareUpdateForHome:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HOAppNavigator *)self showHome:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032474;
  v9[3] = &unk_1000C34D8;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 flatMap:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)showAboutResidentDeviceView
{
  id v3 = [objc_alloc((Class)HUAboutResidentDeviceViewController) initWithStyle:1];
  [v3 setDelegate:self];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];
  [v4 setModalPresentationStyle:2];
  id v5 = [(HOAppNavigator *)self rootViewController];
  [v5 presentViewController:v4 animated:1 completion:0];

  id v6 = +[NAFuture futureWithNoResult];

  return v6;
}

- (id)addAccessoryWithURL:(id)a3
{
  id v3 = a3;
  if (+[HFUtilities supportsAccessorySetup])
  {
    id v4 = [v3 absoluteString];
    if ((+[HMAccessorySetupCoordinator isSetupPayloadURL:v3] & 1) == 0)
    {
      id v5 = [objc_alloc((Class)NSURLComponents) initWithURL:v3 resolvingAgainstBaseURL:0];
      id v6 = [v5 queryItems];
      id v7 = [v6 na_firstObjectPassingTest:&stru_1000C3518];
      uint64_t v8 = [v7 value];

      id v4 = (void *)v8;
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100032814;
    v22[3] = &unk_1000C3568;
    id v9 = v4;
    id v23 = v9;
    id v10 = v3;
    id v24 = v10;
    id v11 = +[NAFuture futureWithBlock:v22];
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_100032A14;
    id v19 = &unk_1000C35F8;
    id v20 = v10;
    id v21 = v9;
    id v12 = v9;
    id v13 = [v11 flatMap:&v16];
    id v14 = [v13 recover:&stru_1000C3618 v16, v17, v18, v19];
  }
  else
  {
    id v14 = +[NAFuture futureWithNoResult];
  }

  return v14;
}

- (id)showSiriPersonalRequestsSettingsForHome:(id)a3 showEnablementSheet:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing Personal Requests enablement sheet", buf, 2u);
    }

    [(HOAppNavigator *)self dismissViewController];
    id v9 = [(HOAppNavigator *)self rootViewController];
    id v10 = +[HUHomeFeatureOnboardingUtilities home:v6 onboardPersonalRequestsFromPresentingViewController:v9];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing Personal Requests settings page", buf, 2u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003303C;
    v12[3] = &unk_1000C3640;
    id v13 = v6;
    id v10 = [(HOAppNavigator *)self _showLocationListWithHome:v13 customizationBlock:v12];
    id v9 = v13;
  }

  return v10;
}

- (id)showRecognizeMyVoiceSettingsForHome:(id)a3 showEnablementSheet:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing Recognize My Voice enablement sheet", buf, 2u);
    }

    [(HOAppNavigator *)self dismissViewController];
    id v9 = [(HOAppNavigator *)self rootViewController];
    uint64_t v16 = OnboardingDisplayOption_OnboardingFromUserInput;
    uint64_t v17 = &__kCFBooleanTrue;
    id v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = +[HUHomeFeatureOnboardingUtilities home:v6 onboardIdentifyVoiceFromPresentingViewController:v9 usageOptions:v10];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing Personal Requests settings page", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003324C;
    v13[3] = &unk_1000C3640;
    id v14 = v6;
    id v11 = [(HOAppNavigator *)self _showLocationListWithHome:v14 customizationBlock:v13];
    id v9 = v14;
  }

  return v11;
}

- (id)showUserDetails:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2080;
    id v15 = "-[HOAppNavigator showUserDetails:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing deailts for user %@", buf, 0x20u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000333EC;
  v10[3] = &unk_1000C3640;
  id v11 = v4;
  id v7 = v4;
  BOOL v8 = [(HOAppNavigator *)self _showUser:v7 customizationBlock:v10];

  return v8;
}

- (id)showUserLockSettingsForHome:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing user lock settings page", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003351C;
  v9[3] = &unk_1000C3640;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(HOAppNavigator *)self _showLocationListWithHome:v6 customizationBlock:v9];

  return v7;
}

- (id)showLocksOnboardingForHome:(id)a3 onboardingType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Showing lock onboarding", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033650;
  v10[3] = &unk_1000C3688;
  id v11 = v5;
  unint64_t v12 = a4;
  id v7 = v5;
  BOOL v8 = +[NAFuture futureWithBlock:v10];

  return v8;
}

- (id)showLocksFirmwareSetupForHome:(id)a3
{
  id v3 = a3;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing lock firmware setup", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033834;
  v8[3] = &unk_1000C36D0;
  id v9 = v3;
  id v5 = v3;
  id v6 = +[NAFuture futureWithBlock:v8];

  return v6;
}

- (id)showHH2OnboardingFlowForHome:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing HH2 Upgrade Onboarding", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000339F0;
  v9[3] = &unk_1000C3568;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = +[NAFuture futureWithBlock:v9];

  return v7;
}

- (id)showDropInUI:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HOAppNavigator *)self dismissViewController];
  BOOL v8 = [(HOAppNavigator *)self _selectHome:v7];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100033E0C;
  v17[3] = &unk_1000C3368;
  v17[4] = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = [v8 flatMap:v17];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100033F4C;
  v14[3] = &unk_1000C2DC8;
  id v15 = v6;
  __int16 v16 = self;
  id v11 = v6;
  id v12 = [v10 addCompletionBlock:v14];

  return v10;
}

- (id)showDefaultAccountForHome:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing user default account page", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034140;
  v9[3] = &unk_1000C3640;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(HOAppNavigator *)self _showLocationListWithHome:v6 customizationBlock:v9];

  return v7;
}

- (id)showCameraProfile:(id)a3 clipID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init((Class)NAFuture);
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    id v10 = [v6 clipManager];
    id v11 = [v8 completionHandlerAdapter];
    [v10 fetchClipWithUUID:v9 completion:v11];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100034358;
    v15[3] = &unk_1000C3720;
    id v16 = v6;
    id v17 = self;
    id v18 = v7;
    id v12 = [v8 flatMap:v15];
  }
  else
  {
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Show camera profile:%@.", buf, 0xCu);
    }

    id v12 = [(HOAppNavigator *)self _showRoomContainedObject:v6 secondaryDestination:0];
  }

  return v12;
}

- (id)showFeedbackFlowForCameraClipID:(id)a3 cameraProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Show feedback flow for clip identifier:%@ and camera profile %@.", buf, 0x16u);
    }

    id v10 = objc_alloc_init((Class)NAFuture);
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
    id v12 = [v7 clipManager];
    id v13 = [v10 completionHandlerAdapter];
    [v12 fetchClipWithUUID:v11 completion:v13];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100034718;
    v16[3] = &unk_1000C3770;
    id v17 = v7;
    id v18 = self;
    __int16 v14 = [v10 flatMap:v16];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100083398(v9);
    }

    __int16 v14 = +[NAFuture futureWithNoResult];
  }

  return v14;
}

- (id)showSettingsForCameraProfile:(id)a3
{
  return [(HOAppNavigator *)self _showRoomContainedObject:a3 secondaryDestination:1];
}

- (id)showNetworkSettingsForHome:(id)a3
{
  return [(HOAppNavigator *)self _showLocationListWithHome:a3 customizationBlock:&stru_1000C3790];
}

- (id)showNetworkSettingsForNetworkConfigurationProfile:(id)a3 home:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034ADC;
  v9[3] = &unk_1000C3640;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(HOAppNavigator *)self _showLocationListWithHome:a4 customizationBlock:v9];

  return v7;
}

- (id)showNetworkSettingsForAccessory:(id)a3 home:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034C58;
  v9[3] = &unk_1000C3640;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(HOAppNavigator *)self _showLocationListWithHome:a4 customizationBlock:v9];

  return v7;
}

- (id)showBridgeSettingsForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 home];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034DE4;
  v9[3] = &unk_1000C3640;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(HOAppNavigator *)self _showLocationListWithHome:v5 customizationBlock:v9];

  return v7;
}

- (id)showBridgeSettingsForHome:(id)a3
{
  return [(HOAppNavigator *)self _showLocationListWithHome:a3 customizationBlock:&stru_1000C3800];
}

- (id)showNotificationSettingsForHome:(id)a3
{
  return [(HOAppNavigator *)self _showLocationListWithHome:a3 customizationBlock:&stru_1000C3820];
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 inHome:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003500C;
  v9[3] = &unk_1000C3640;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(HOAppNavigator *)self _showLocationListWithHome:a4 customizationBlock:v9];

  return v7;
}

- (id)showFaceRecognitionSettingsForHome:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HOAppNavigator.m", 809, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  id v6 = [(HOAppNavigator *)self _showLocationListWithHome:v5 customizationBlock:&stru_1000C3840];

  return v6;
}

- (id)showFaceRecognitionSettingsForPerson:(id)a3 personManager:(id)a4 inHome:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HOAppNavigator.m", 818, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000352AC;
  v17[3] = &unk_1000C3890;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  __int16 v14 = [(HOAppNavigator *)self _showLocationListWithHome:v11 customizationBlock:v17];

  return v14;
}

- (id)showFaceRecognitionSettingsForUnknownPersonEvent:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HOAppNavigator.m", 828, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000354D8;
  v13[3] = &unk_1000C3640;
  id v14 = v7;
  id v9 = v7;
  id v10 = [(HOAppNavigator *)self _showLocationListWithHome:v8 customizationBlock:v13];

  return v10;
}

- (id)showAddAutomationFlow
{
  objc_initWeak(&location, self);
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeFuture];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000356D8;
  v6[3] = &unk_1000C1F08;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 addSuccessBlock:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

- (id)showAddSceneFlowOnHomeTab
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeFuture];
  id v5 = [(HOAppNavigator *)self createOrEditActionSetWithName:0 home:v4 switchToHomeTab:1];

  return v5;
}

- (id)showAddSceneFlowOnCurrentTab
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeFuture];
  id v5 = [(HOAppNavigator *)self createOrEditActionSetWithName:0 home:v4 switchToHomeTab:0];

  return v5;
}

- (id)showHomeEditor
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 home];
  id v5 = [(HOAppNavigator *)self showHomeSettingsForHome:v4];

  return v5;
}

- (id)showRoomEditor
{
  return [(HOAppNavigator *)self _showRoomSettingsWithRoom:0];
}

- (id)showHomeTab
{
  id v3 = [(HOAppNavigator *)self baseController];
  id v4 = [v3 selectTabWithIdentifier:HFHomeAppTabIdentifierHome];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035A44;
  v7[3] = &unk_1000C3900;
  v7[4] = self;
  id v5 = [v4 addCompletionBlock:v7];

  return v4;
}

- (id)showAutomationTab
{
  v2 = [(HOAppNavigator *)self baseController];
  id v3 = [v2 selectTabWithIdentifier:HFHomeAppTabIdentifierTriggers];

  return v3;
}

- (id)showDiscoverTab
{
  v2 = [(HOAppNavigator *)self baseController];
  id v3 = [v2 selectTabWithIdentifier:HFHomeAppTabIdentifierDiscover];

  return v3;
}

- (id)_selectTabWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HOAppNavigator *)self rootViewController];
  [v7 hu_dismissViewControllerAnimated:v4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100035C68;
  v12[3] = &unk_1000C3928;
  void v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 flatMap:v12];

  return v10;
}

- (id)_selectCurrentTabAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HOAppNavigator *)self rootViewController];
  [v5 hu_dismissViewControllerAnimated:v3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035D84;
  v9[3] = &unk_1000C2ED0;
  void v9[4] = self;
  id v7 = [v6 flatMap:v9];

  return v7;
}

- (void)_createHomeWithName:(id)a3
{
  id v4 = a3;
  id v8 = [[HOAddLocationViewController alloc] initWithName:v4 delegate:self];

  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [v5 setModalPresentationStyle:2];
  id v6 = [(HOAppNavigator *)self rootViewController];
  id v7 = [v6 hu_presentPreloadableViewController:v5 animated:1];
}

- (id)_selectHome:(id)a3
{
  id v3 = a3;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 homeFuture];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035F70;
  v9[3] = &unk_1000C3950;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v5 flatMap:v9];

  return v7;
}

- (void)_createRoomWithName:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [objc_alloc((Class)HFRoomBuilder) initWithHome:v6];

  [v12 setName:v7];
  id v8 = [objc_alloc((Class)HUEditRoomViewController) initWithRoomBuilder:v12 presentationDelegate:self addRoomDelegate:0];
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  id v10 = [(HOAppNavigator *)self rootViewController];
  id v11 = [v10 hu_presentPreloadableViewController:v9 animated:1];
}

- (void)_addPeopleToHome:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hf_canAddHomeMember];
  unsigned int v6 = [v4 hf_canAddAccessCode];
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  id v8 = [v7 pinCodeManagerForHome:v4];

  if (v5 && v6)
  {
    id v9 = [objc_alloc((Class)HUAddPersonRoleViewController) initWithHome:v4];
    [v9 setPinCodeManager:v8];
    id v10 = v9;
LABEL_6:
    [v10 setPresentationDelegate:self];
    id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v9];
    [v11 setModalPresentationStyle:2];
    goto LABEL_7;
  }
  if (v5)
  {
    id v10 = [objc_alloc((Class)HUAddPersonRoleViewController) initWithHome:v4];
    id v9 = v10;
    goto LABEL_6;
  }
  if (!v6)
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100083454(v11, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_9;
  }
  id v9 = [objc_alloc((Class)HUAddGuestViewController) initWithPinCodeManager:v8 home:v4];
  [v9 setPresentationDelegate:self];
  id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v9];
LABEL_7:

  if (v11)
  {
    [v11 setModalPresentationStyle:2];
    id v12 = [(HOAppNavigator *)self rootViewController];
    id v13 = [v12 hu_presentPreloadableViewController:v11 animated:1];

LABEL_9:
  }
}

- (id)_showDashboardForRoomContainedObject:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000363DC;
  v13[3] = &unk_1000C3978;
  id v14 = a3;
  id v6 = v14;
  int v7 = sub_1000363DC((uint64_t)v13);
  id v8 = [v6 hf_parentRoom];
  id v9 = v8;
  if (v7)
  {
    id v10 = [v8 home];
    id v11 = [(HOAppNavigator *)self _showHomeTabForHome:v10 animated:v4];
  }
  else
  {
    id v11 = [(HOAppNavigator *)self _showRoom:v8 animated:v4];
  }

  return v11;
}

- (id)_showHomeTabForHome:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(HOAppNavigator *)self _selectTabWithIdentifier:HFHomeAppTabIdentifierHome animated:v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003659C;
  v11[3] = &unk_1000C39A0;
  void v11[4] = self;
  id v12 = v6;
  BOOL v13 = v4;
  id v8 = v6;
  id v9 = [v7 flatMap:v11];

  return v9;
}

- (id)_showRoom:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  int v7 = [v6 home];
  id v8 = [(HOAppNavigator *)self _selectHome:v7];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003684C;
  v16[3] = &unk_1000C39C8;
  void v16[4] = self;
  BOOL v17 = a4;
  id v9 = [v8 flatMap:v16];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100036868;
  v13[3] = &unk_1000C39A0;
  void v13[4] = self;
  id v14 = v6;
  BOOL v15 = a4;
  id v10 = v6;
  id v11 = [v9 flatMap:v13];

  return v11;
}

- (id)_showRoomContainedCamera:(id)a3 forCameraClip:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HOAppNavigator *)self _showDashboardForRoomContainedObject:v6 animated:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100036AE4;
  v13[3] = &unk_1000C3748;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 flatMap:v13];

  return v11;
}

- (id)showRoomContainedCamera:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [(HOAppNavigator *)self _showDashboardForRoomContainedObject:v8 animated:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100036D4C;
    v14[3] = &unk_1000C3248;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    id v12 = [v11 flatMap:v14];
  }
  else
  {
    id v12 = [(HOAppNavigator *)self _showRoomContainedObject:v8 secondaryDestination:0];
  }

  return v12;
}

- (id)_showRoomContainedObject:(id)a3 secondaryDestination:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(HOAppNavigator *)self _showDashboardForRoomContainedObject:v6 animated:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100036F3C;
  v11[3] = &unk_1000C39F0;
  id v12 = v6;
  unint64_t v13 = a4;
  id v8 = v6;
  id v9 = [v7 flatMap:v11];

  return v9;
}

- (void)_editActionSet:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [objc_alloc((Class)HFActionSetBuilder) initWithExistingObject:v7 inHome:v6];

  id v8 = [objc_alloc((Class)HUSceneActionEditorViewController) initWithActionSetBuilder:v12 mode:0];
  [v8 setPresentationDelegate:self];
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  id v10 = [(HOAppNavigator *)self rootViewController];
  id v11 = [v10 hu_presentPreloadableViewController:v9 animated:1];
}

- (void)_createActionSetWithName:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [objc_alloc((Class)HFActionSetBuilder) initWithHome:v7];
    [v8 setName:v6];
    id v9 = [objc_alloc((Class)HUSceneActionEditorViewController) initWithActionSetBuilder:v8 mode:0];
    [v9 setPresentationDelegate:self];
    id v10 = +[NAFuture futureWithResult:v9];
  }
  else
  {
    id v10 = +[HUSceneUtilities initialViewControllerForAddingSceneWithPresentationDelegate:self home:v7];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100037184;
  v12[3] = &unk_1000C3A18;
  void v12[4] = self;
  id v11 = [v10 addSuccessBlock:v12];
}

- (id)_showUser:(id)a3 customizationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v9 = [v8 homeFutureWithUser:v6];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100037428;
  v20[3] = &unk_1000C3188;
  objc_copyWeak(&v22, &location);
  id v10 = v6;
  id v21 = v10;
  id v11 = [v9 flatMap:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100037524;
  v16[3] = &unk_1000C3A40;
  objc_copyWeak(&v19, &location);
  id v12 = v10;
  id v17 = v12;
  id v13 = v7;
  id v18 = v13;
  id v14 = [v11 recover:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);

  return v14;
}

- (id)_showLocationListWithHome:(id)a3 customizationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HOAppNavigator *)self _selectTabWithIdentifier:HFHomeAppTabIdentifierHome animated:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100037794;
  v13[3] = &unk_1000C3A68;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 flatMap:v13];

  return v11;
}

- (id)_showRoomSettingsWithRoom:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HOAppNavigator *)self _selectTabWithIdentifier:HFHomeAppTabIdentifierHome animated:0];
  id v6 = [v5 flatMap:&stru_1000C3A88];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100037970;
  v10[3] = &unk_1000C37E0;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 flatMap:v10];

  return v8;
}

- (id)_serviceWithName:(id)a3 type:(id)a4 home:(id)a5 room:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v10 hf_allServices];
  id v14 = +[NSPredicate predicateWithFormat:@"name LIKE[cd] %@", v12];

  id v15 = [v13 filteredArrayUsingPredicate:v14];

  if (v11)
  {
    id v16 = [v11 hf_allServices];
    id v17 = +[NSPredicate predicateWithFormat:@"serviceType LIKE %@", v9];
    id v18 = [v16 filteredArrayUsingPredicate:v17];
  }
  else
  {
    id v18 = &__NSArray0__struct;
  }
  id v19 = [v10 hf_allServices];
  uint64_t v20 = +[NSPredicate predicateWithFormat:@"serviceType LIKE %@", v9];
  id v21 = [v19 filteredArrayUsingPredicate:v20];

  id v22 = [v18 arrayByAddingObjectsFromArray:v21];
  id v23 = [v15 arrayByAddingObjectsFromArray:v22];

  id v24 = [v23 firstObject];

  return v24;
}

- (id)_cameraProfileWithName:(id)a3 home:(id)a4 room:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 hf_allCameraProfiles];
  id v11 = +[NSPredicate predicateWithFormat:@"accessory.name LIKE[cd] %@", v9];

  id v12 = [v10 filteredArrayUsingPredicate:v11];

  if (v8)
  {
    id v13 = [v8 hf_allCameraProfiles];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }
  id v14 = [v7 hf_allCameraProfiles];
  id v15 = [v13 arrayByAddingObjectsFromArray:v14];
  id v16 = [v12 arrayByAddingObjectsFromArray:v15];

  id v17 = [v16 firstObject];

  return v17;
}

- (id)showHome:(id)a3
{
  return [(HOAppNavigator *)self _showHomeTabForHome:a3 animated:1];
}

- (id)showRoom:(id)a3
{
  return [(HOAppNavigator *)self _showRoom:a3 animated:1];
}

- (void)showAllHomesSettings
{
  id v2 = [(HOAppNavigator *)self showHomeSettingsForHome:0];
}

- (void)showHomeSettings:(id)a3
{
  id v3 = [(HOAppNavigator *)self showHomeSettingsForHome:a3];
}

- (void)showRoomSettings:(id)a3
{
  id v3 = [(HOAppNavigator *)self showRoomSettingsForRoom:a3];
}

- (void)showDashboardSectionListViewController:(id)a3
{
  id v4 = a3;
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];

  [v7 setModalPresentationStyle:2];
  unsigned int v5 = [(HOAppNavigator *)self rootViewController];
  id v6 = [v5 hu_presentPreloadableViewController:v7 animated:1];
}

- (void)showStatusDetailsForStatusItemClass:(Class)a3
{
  id v4 = [(HOAppNavigator *)self _selectTabWithIdentifier:HFHomeAppTabIdentifierHome animated:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100037F0C;
  v6[3] = &unk_1000C3AA8;
  void v6[4] = a3;
  id v5 = [v4 flatMap:v6];
}

- (id)showAccessoryTypeGroup:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HOAppNavigator *)self _selectHome:v9];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003812C;
  v20[3] = &unk_1000C39C8;
  void v20[4] = self;
  BOOL v21 = a5;
  id v11 = [v10 flatMap:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038148;
  v16[3] = &unk_1000C3AD0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a5;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 flatMap:v16];

  return v14;
}

- (id)showScenesSectionWithDashboardTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HOAppNavigator *)self _selectHome:v9];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100038404;
  v20[3] = &unk_1000C39C8;
  void v20[4] = self;
  BOOL v21 = a5;
  id v11 = [v10 flatMap:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038420;
  v16[3] = &unk_1000C3AD0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a5;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 flatMap:v16];

  return v14;
}

- (id)showSpeakersAndTVsSectionWithTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HOAppNavigator *)self _selectHome:v9];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000386DC;
  v20[3] = &unk_1000C39C8;
  void v20[4] = self;
  BOOL v21 = a5;
  id v11 = [v10 flatMap:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000386F8;
  v16[3] = &unk_1000C3AD0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a5;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 flatMap:v16];

  return v14;
}

- (id)showCamerasSectionWithTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HOAppNavigator *)self _selectHome:v9];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000389B4;
  v20[3] = &unk_1000C39C8;
  void v20[4] = self;
  BOOL v21 = a5;
  id v11 = [v10 flatMap:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000389D0;
  v16[3] = &unk_1000C3AD0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a5;
  id v12 = v9;
  id v13 = v8;
  id v14 = [v11 flatMap:v16];

  return v14;
}

- (id)showHomeSettingsForHome:(id)a3
{
  return [(HOAppNavigator *)self _showLocationListWithHome:a3 customizationBlock:0];
}

- (id)showRoomSettingsForRoom:(id)a3
{
  return [(HOAppNavigator *)self _showRoomSettingsWithRoom:a3];
}

- (void)scrollToDefaultPositionInCurrentContextAnimated:(BOOL)a3
{
  id v5 = [(HOAppNavigator *)self _selectCurrentTabAnimated:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100038BD4;
  v7[3] = &unk_1000C3AF8;
  v7[4] = self;
  BOOL v8 = a3;
  id v6 = [v5 addCompletionBlock:v7];
}

- (void)dismissViewController
{
  id v2 = [(HOAppNavigator *)self rootViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)addAccessoryToHome:(id)a3 room:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (+[HFUtilities supportsAccessorySetup]) {
    id v6 = +[HFAddAndSetupNewAccessoriesHandler addAndSetupNewAccessoriesForHome:v7 room:v5];
  }
}

- (void)addSceneToHome:(id)a3
{
  id v3 = [(HOAppNavigator *)self showAddSceneFlowOnCurrentTab];
}

- (void)addAutomationToHome:(id)a3
{
  id v3 = [(HOAppNavigator *)self showAddAutomationFlow];
}

- (void)addRoomToHome:(id)a3
{
}

- (void)addPeopleToHome:(id)a3
{
}

- (void)addHome
{
  if ((+[HFUtilities isAMac] & 1) == 0)
  {
    [(HOAppNavigator *)self _createHomeWithName:0];
  }
}

- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3
{
  id v4 = a3;
  id v13 = +[NSMutableDictionary dictionary];
  id v5 = [(HOAppNavigator *)self currentViewController];
  [v13 na_safeSetObject:v5 forKey:HFAnalyticsDataSourceViewControllerKey];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [(HOAppNavigator *)self dashboardContextTypeDescriptionForAnalytics];
  id v10 = 0;
  if ([v9 length] && v8)
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v10 = +[NSString stringWithFormat:@"%@-%@", v12, v9];
  }
  [v13 na_safeSetObject:v10 forKey:HFAnalyticsDataSourceViewControllerOverrideClassNameKey];
  [v13 na_safeSetObject:v4 forKey:HFAnalyticsDataContextMenuTitleKey];

  +[HFAnalytics sendEvent:36 withData:v13];
}

- (id)currentViewController
{
  id v2 = [(HOAppNavigator *)self rootViewController];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [v5 selectedViewController];

    id v3 = (id)v6;
  }
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    uint64_t v10 = [v9 topViewController];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = v7;
    }
    id v13 = v12;

    id v7 = v13;
  }
  id v14 = v7;

  return v14;
}

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  id v9 = a4;
  id v5 = [(HOAppNavigator *)self rootViewController];
  [v5 hu_dismissViewControllerAnimated:1];

  id v7 = v9;
  if (v9)
  {
    id v8 = [(HOAppNavigator *)self showRoom:v9];
    id v7 = v9;
  }
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v4 = [(HOAppNavigator *)self rootViewController];
  [v4 hu_dismissViewControllerAnimated:1];

  return v5;
}

- (void)addLocationViewController:(id)a3 didFinishWithHome:(id)a4
{
  id v9 = a4;
  id v5 = [(HOAppNavigator *)self rootViewController];
  id v6 = [v5 hu_dismissViewControllerAnimated:1];

  id v7 = v9;
  if (v9)
  {
    id v8 = [(HOAppNavigator *)self showHome:v9];
    id v7 = v9;
  }
}

- (void)locationListViewControllerDidFinish:(id)a3
{
  id v3 = [(HOAppNavigator *)self rootViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
  id v3 = [(HOAppNavigator *)self rootViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (HOBaseController)baseController
{
  return self->_baseController;
}

- (void)setHomePodProfileInstaller:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePodProfileInstaller, 0);
  objc_storeStrong((id *)&self->_baseController, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

- (void)_configureDashboardContextWithHome:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = (HOAppNavigator *)a4;
  id v9 = self;
  id v10 = [(HOAppNavigator *)v8 viewControllers];
  sub_10000AE6C(0, &qword_1000DD750);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v12 >= 2)
  {
    id v13 = (HOAppNavigator *)[(HOAppNavigator *)v8 popToRootViewControllerAnimated:v5];

    id v8 = v9;
    id v9 = v13;
  }
}

- (void)_configureDashboardContextWithAccessoryTypeGroup:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  sub_100075490(v10, v11, v12, a6);
}

- (void)_configureSpeakersAndTVsDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
}

- (void)_configureScenesDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
}

- (void)_configureDashboardContextWithRoom:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_100075784(v8, v9, a5);
}

- (void)_configureCameraDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
}

- (void)configureDashboardContextWithDashboardContext:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  _sSo14HOAppNavigatorC7HomeAppE25configureDashboardContext4with20navigationController8animatedy0C2UI0fG0CSg_So012UINavigationJ0CSbtF_0(a3, v10, a5);
}

- (id)dashboardContextTypeDescriptionForAnalytics
{
  id v2 = self;
  id v3 = [(HOAppNavigator *)v2 currentViewController];
  self;
  id v4 = (void *)swift_dynamicCastObjCClass();
  if (v4)
  {
    id v5 = [v4 context];
    dispatch thunk of DashboardContext.typeDescriptionForAnalytics.getter();
    uint64_t v7 = v6;

    if (v7)
    {
      NSString v8 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
  }
  NSString v8 = 0;
LABEL_6:

  return v8;
}

@end