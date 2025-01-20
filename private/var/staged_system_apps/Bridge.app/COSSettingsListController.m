@interface COSSettingsListController
+ (id)installedWatchkitApps;
+ (id)sharedTopLevelIconsLazyLoadingQueue;
+ (id)unavailableWatchKitApps;
- (BOOL)hasRowsPendingInstallation;
- (BOOL)isBreatheAppInstalled;
- (BOOL)isEnrolledAndSupervised;
- (BOOL)isReloadingWatchkitApps;
- (BOOL)navigateWhenReceivingCellularPlanResult;
- (BOOL)receivedDiscoveryResult;
- (BOOL)reloadsWhenBecomingActive;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (BOOL)shouldRefreshRowsOnForegroundEvent;
- (BOOL)showAppSections;
- (BOOL)showPairingButton;
- (BOOL)wantsAnotherWatchkitAppsReload;
- (BOOL)wantsCustomControllerForRootSpecifierID:(id)a3;
- (BOOL)watchKitOneAppsEOL;
- (BPSNTKCustomization)customizationController;
- (BPSNTKFacesViewController)facesController;
- (COSSettingsListController)init;
- (COSSkippedMiniFlowController)skippedMiniFlowController;
- (COSTinkerAppStoreAuthHelper)storeAuthHelper;
- (CSSearchQuery)searchQuery;
- (FLPreferencesController)fuPrefsController;
- (NSDictionary)inheritedWhiteList;
- (NSMutableArray)stashedWatchKitApps;
- (NSMutableArray)stashedWatchKitAppsState;
- (NSMutableDictionary)sockPuppetAppMapping;
- (NSMutableDictionary)watchAppInstallStates;
- (NSMutableSet)searchCategoriesWithoutIcons;
- (NSString)enrolledOrganizationName;
- (OS_dispatch_queue)spotlightWorkQueue;
- (PSKeyboardNavigationSearchController)spotlightSearchController;
- (PSSpecifier)loadingSpecifier;
- (PSSpotlightSearchResultsController)spotlightResultsController;
- (UIViewController)nothingSelectedController;
- (id)_pptApps;
- (id)activeWatchOrFakeWatch;
- (id)additionalSpecifiers;
- (id)customControllerForBundlePath:(id)a3;
- (id)customControllerForRootSpecifierID:(id)a3;
- (id)fakeDevice;
- (id)filterForWatchInstalledApps:(id)a3;
- (id)filterSockPuppetApps:(id)a3;
- (id)freezeDryAppStates:(id)a3;
- (id)generalViewController;
- (id)hardcodedSpecifiers;
- (id)localizedPrefsStringForString:(id)a3;
- (id)searchResultsController:(id)a3 iconForCategory:(id)a4;
- (id)settingsFileName;
- (id)sockPuppetAppValue:(id)a3;
- (id)sockPuppetApps;
- (id)specialCaseVictoryRow;
- (id)specifiers;
- (id)specifiersForWKApps:(id)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)title;
- (id)wkAppSpinnerGroup;
- (int64_t)_groupIndexForGroup:(id)a3;
- (int64_t)indexOfGeneralController;
- (int64_t)preferredStatusBarStyle;
- (int64_t)searchResultsController:(id)a3 sortCategory1:(id)a4 sortCategory2:(id)a5;
- (void)_appStoreSpecifierTapped:(id)a3;
- (void)_hackToRemoveExtraSearchView;
- (void)_insertSpecifierIntoTableAndStash:(id)a3 atIndex:(unint64_t)a4 stashIndex:(unint64_t)a5 animated:(BOOL)a6;
- (void)_kickOffWatchKitAppReload;
- (void)_notifyNTKAboutActiveWatchSkipSetupCompletionCheck:(BOOL)a3;
- (void)_prepareDiscoveryIfNeeded;
- (void)_pushCustomControllerForPath:(id)a3 andTitle:(id)a4;
- (void)_refreshAppInstallationStatus;
- (void)_removeSpecifier:(id)a3 andInsertSpecifier:(id)a4 animated:(BOOL)a5;
- (void)_removeSpecifierFromTableAndStash:(id)a3 animated:(BOOL)a4;
- (void)_showDevicePicker:(id)a3;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopSpinnerInSpecifier:(id)a3;
- (void)_storeReauthStepForTinkerFamilyMember:(id)a3 withWatchAKDevice:(id)a4 completion:(id)a5;
- (void)_updateDeviceManagementInformation;
- (void)addUnavailableAppsSectionIfNeeded;
- (void)appInstallErrorReceived:(id)a3;
- (void)compatibilityStateChanged:(id)a3;
- (void)ctCellularPlanInfoDidChange:(id)a3;
- (void)dealloc;
- (void)decorateSpecifierWithWKDetails:(id)a3 byIdentifier:(id)a4 andApplication:(id)a5;
- (void)deviceBecameActive:(id)a3;
- (void)deviceBecameInActive:(id)a3;
- (void)deviceBecamePaired:(id)a3;
- (void)deviceIsSetup:(id)a3;
- (void)didEnterBackground:(id)a3;
- (void)discoveredAdvertisingWatch:(id)a3;
- (void)facesViewControllerDidUpdateContent:(id)a3;
- (void)gatherAllWatchAppsWithCompletion:(id)a3;
- (void)groupLocallyAvailableAppsWithWatchOnlyApps:(id)a3 withStates:(id)a4 withCompletion:(id)a5;
- (void)indexSpecifiersIfNeeded;
- (void)insertAndDeleteSpecifiersForChanges:(id)a3;
- (void)insertContiguousSpecifiersForIndexing:(id)a3;
- (void)jumpToAppStoreWatchSection:(id)a3;
- (void)loadSpolightSearchControllers;
- (void)loadView;
- (void)notifyNTKAboutActiveWatch;
- (void)presentPairingFlowIfPossible;
- (void)presentSkippedPanes:(id)a3;
- (void)proceedWithStoreRepairForAccount:(id)a3 withWatchAKDevice:(id)a4 completion:(id)a5;
- (void)pushCustomControllerForRootSpecifierID:(id)a3;
- (void)refreshAppleAppGroupFooterState:(BOOL)a3;
- (void)reindexIfNeeded;
- (void)reloadApplicationForGreenfieldInstall:(id)a3;
- (void)reloadWatchKitApps:(id)a3;
- (void)removeContiguousSpecifiersFromIndexing:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)searchResultsController:(id)a3 didSelectURL:(id)a4;
- (void)setCustomizationController:(id)a3;
- (void)setEnrolledOrganizationName:(id)a3;
- (void)setFacesController:(id)a3;
- (void)setFuPrefsController:(id)a3;
- (void)setHasRowsPendingInstallation:(BOOL)a3;
- (void)setInheritedWhiteList:(id)a3;
- (void)setIsBreatheAppInstalled:(BOOL)a3;
- (void)setIsEnrolledAndSupervised:(BOOL)a3;
- (void)setIsReloadingWatchkitApps:(BOOL)a3;
- (void)setLoadingSpecifier:(id)a3;
- (void)setNavigateWhenReceivingCellularPlanResult:(BOOL)a3;
- (void)setNothingSelectedController:(id)a3;
- (void)setReceivedDiscoveryResult:(BOOL)a3;
- (void)setSearchCategoriesWithoutIcons:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setShouldRefreshRowsOnForegroundEvent:(BOOL)a3;
- (void)setShowAppSections:(BOOL)a3;
- (void)setSkippedMiniFlowController:(id)a3;
- (void)setSockPuppetAppMapping:(id)a3;
- (void)setSpotlightResultsController:(id)a3;
- (void)setSpotlightSearchController:(id)a3;
- (void)setSpotlightWorkQueue:(id)a3;
- (void)setStashedWatchKitApps:(id)a3;
- (void)setStashedWatchKitAppsState:(id)a3;
- (void)setStoreAuthHelper:(id)a3;
- (void)setWantsAnotherWatchkitAppsReload:(BOOL)a3;
- (void)setWatchAppInstallStates:(id)a3;
- (void)showDeviceSupervisionInfo;
- (void)skippedMiniFlowDidFinish:(id)a3;
- (void)startSpinnerInCellForSpecifier:(id)a3;
- (void)stopSpinner;
- (void)systemAppSpecifierProcessing:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 installPhase:(int64_t)a5;
- (void)updateNavTitle;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEnterForeground:(id)a3;
@end

@implementation COSSettingsListController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)COSSettingsListController;
  [(COSSettingsListController *)&v3 loadView];
  if (([UIApp devicePickerPresented] & 1) == 0) {
    [(COSSettingsListController *)self loadSpolightSearchControllers];
  }
}

- (void)ctCellularPlanInfoDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015A74;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_refreshAppInstallationStatus
{
  objc_super v3 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  if (BPSDeviceHasStandaloneAppsCapability())
  {
    objc_initWeak(&location, self);
    v4 = [UIApp displayDevice];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10007AA0C;
    v5[3] = &unk_100243958;
    objc_copyWeak(&v6, &location);
    sub_100032DBC(v4, @"com.apple.DeepBreathing", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (id)additionalSpecifiers
{
  objc_super v3 = +[NSMutableArray array];
  v4 = [UIApp displayDevice];
  if (v4)
  {
    if ((BPSDeviceHasCapabilityForString() & 1) == 0)
    {
      v5 = +[PSSpecifier emptyGroupSpecifier];
      [v5 setIdentifier:@"VICTORY_GROUP_ID"];
      id v6 = [(COSSettingsListController *)self localizedPrefsStringForString:@"VICTORY_ROW_TITLE"];
      v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      [v7 setIdentifier:@"VICTORY_ROW_ID"];
      [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v3 addObject:v5];
      [v3 addObject:v7];
    }
    v8 = [v4 valueForProperty:@"isPaired"];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      v10 = [(COSSettingsListController *)self sockPuppetApps];
      [v3 addObjectsFromArray:v10];
    }
  }

  return v3;
}

- (void)indexSpecifiersIfNeeded
{
  objc_initWeak(&location, self);
  objc_super v3 = *(NSObject **)((char *)&self->_watchAppInstallStates + 6);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000074F0;
  v4[3] = &unk_1002439E0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSSettingsListController;
  [(COSPreferencesListController *)&v5 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"discoveredAdvertisingWatch:" name:PPDeviceWasDiscoveredNotification object:0];

  [(COSSettingsListController *)self _prepareDiscoveryIfNeeded];
}

- (BOOL)watchKitOneAppsEOL
{
  v2 = +[NSUserDefaults standardUserDefaults];
  if ([v2 BOOLForKey:@"COSTestUnavailableApps"])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    v4 = [UIApp displayDevice];
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A309A9D3-F806-4E30-909A-2D301780A8EB"];
    unsigned __int8 v3 = [v4 supportsCapability:v5];
  }
  return v3;
}

- (void)_updateDeviceManagementInformation
{
  unsigned __int8 v3 = [UIApp displayDevice];
  v4 = [v3 valueForProperty:NRDevicePropertyMDMManagementState];
  unint64_t v5 = (unint64_t)[v4 unsignedIntegerValue] & 3;
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[COSSettingsListController _updateDeviceManagementInformation]";
    __int16 v12 = 1024;
    BOOL v13 = v5 == 3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s enrolledAndSupervised: %{BOOL}d", buf, 0x12u);
  }

  if ((v5 == 3) != [(COSSettingsListController *)self isEnrolledAndSupervised])
  {
    [(COSSettingsListController *)self setIsEnrolledAndSupervised:v5 == 3];
    if ([(COSSettingsListController *)self isEnrolledAndSupervised])
    {
      objc_initWeak((id *)buf, self);
      v7 = dispatch_get_global_queue(25, 0);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10007C218;
      v8[3] = &unk_100243D28;
      objc_copyWeak(&v9, (id *)buf);
      v8[4] = self;
      dispatch_async(v7, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(COSSettingsListController *)self setEnrolledOrganizationName:0];
      [(COSListController *)self reloadSpecifiers];
    }
  }
}

- (void)_notifyNTKAboutActiveWatchSkipSetupCompletionCheck:(BOOL)a3
{
  if (a3
    || (+[UIApplication sharedApplication],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isInSetupFlow],
        v4,
        !v5))
  {
    v7 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v8 = [v7 compatibilityState];

    if (v8 - 3 > 2)
    {
      v11 = pbb_bridge_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        BOOL v13 = "-[COSSettingsListController _notifyNTKAboutActiveWatchSkipSetupCompletionCheck:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s nil", (uint8_t *)&v12, 0xCu);
      }

      [(id)objc_opt_class() setDisplayDevice:0];
    }
    else
    {
      id v9 = [(COSSettingsListController *)self activeWatchOrFakeWatch];
      v10 = pbb_bridge_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        BOOL v13 = "-[COSSettingsListController _notifyNTKAboutActiveWatchSkipSetupCompletionCheck:]";
        __int16 v14 = 2112;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v12, 0x16u);
      }

      [(id)objc_opt_class() setDisplayDevice:v9];
    }
  }
  else
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "skip notifying NTK as we are in pairing. ", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)COSSettingsListController;
  [(COSSettingsListController *)&v10 viewWillAppear:a3];
  [(COSSettingsListController *)self updateNavTitle];
  v4 = [(COSSettingsListController *)self navigationItem];
  id v5 = objc_alloc((Class)UIBarButtonItem);
  id v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"PICKER_BUTTON" value:&stru_100249230 table:@"Localizable"];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"_showDevicePicker:"];
  [v4 setLeftBarButtonItem:v8];

  [(COSSettingsListController *)self _refreshAppInstallationStatus];
  [(COSSettingsListController *)self _updateDeviceManagementInformation];
  id v9 = +[BPSTinkerSupport sharedInstance];
  [v9 fetchFamilyDetails];
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"SETTINGS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)COSSettingsListController;
  [(COSSettingsListController *)&v18 viewDidLoad];
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v4 = (id *)qword_10029B0C0;
  uint64_t v27 = qword_10029B0C0;
  if (!qword_10029B0C0)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10007C9A0;
    v22 = &unk_1002436A8;
    v23 = &v24;
    id v5 = (void *)sub_100016254();
    id v6 = dlsym(v5, "NPHCellularPlanInfoDidChangeNotification");
    *(void *)(v23[1] + 24) = v6;
    qword_10029B0C0 = *(void *)(v23[1] + 24);
    v4 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v4)
  {
    v17 = (_Unwind_Exception *)sub_100171A7C();
    _Block_object_dispose(&v24, 8);
    _Unwind_Resume(v17);
  }
  id v7 = *v4;
  id v8 = [sub_100006450() sharedInstance];
  [v3 addObserver:self selector:"ctCellularPlanInfoDidChange:" name:v7 object:v8];

  id v9 = [(COSSettingsListController *)self table];
  [v9 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"COSGalleryHeaderIdentifier"];

  objc_super v10 = [(COSSettingsListController *)self table];
  [v10 setEstimatedSectionHeaderHeight:240.0];

  v11 = [(COSSettingsListController *)self table];
  [v11 setSectionHeaderHeight:UITableViewAutomaticDimension];

  if (*(void *)(&self->_isEnrolledAndSupervised + 6) && (sub_10000F6D4() & 1) == 0)
  {
    [(COSSettingsListController *)self addChildViewController:*(void *)(&self->_isEnrolledAndSupervised + 6)];
    [*(id *)(&self->_isEnrolledAndSupervised + 6) didMoveToParentViewController:self];
  }
  int v12 = [(COSSettingsListController *)self navigationItem];
  id v13 = objc_alloc((Class)UIBarButtonItem);
  __int16 v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"PICKER_BUTTON" value:&stru_100249230 table:@"Localizable"];
  id v16 = [v13 initWithTitle:v15 style:0 target:self action:"_showDevicePicker:"];
  [v12 setLeftBarButtonItem:v16];
}

- (void)_prepareDiscoveryIfNeeded
{
  if (![(COSSettingsListController *)self showPairingButton])
  {
    v2 = +[PPDiscoveryManager sharedDiscoveryManager];
    [v2 setSignalLimitOverride:PPDiscoveryLimitBridge];

    id v3 = +[PPDiscoveryManager sharedDiscoveryManager];
    [v3 begin];
  }
}

- (void)loadSpolightSearchControllers
{
  id v3 = objc_alloc_init((Class)PSSpotlightSearchResultsController);
  [(COSSettingsListController *)self setSpotlightResultsController:v3];

  v4 = [(COSSettingsListController *)self spotlightResultsController];
  [v4 setDelegate:self];

  id v5 = objc_alloc((Class)PSKeyboardNavigationSearchController);
  id v6 = [(COSSettingsListController *)self spotlightResultsController];
  id v7 = [v5 initWithSearchResultsController:v6];
  [(COSSettingsListController *)self setSpotlightSearchController:v7];

  id v8 = [(COSSettingsListController *)self spotlightSearchController];
  [v8 setSearchResultsUpdater:self];

  id v9 = sub_100010E5C(@"SEARCH_SETTINGS_PLACEHOLDER");
  objc_super v10 = [(COSSettingsListController *)self spotlightSearchController];
  v11 = [v10 searchBar];
  [v11 setPlaceholder:v9];

  int v12 = [(COSSettingsListController *)self spotlightSearchController];
  id v13 = [v12 searchBar];
  [v13 setDelegate:self];

  __int16 v14 = [(COSSettingsListController *)self spotlightSearchController];
  [v14 setDelegate:self];

  v15 = [(COSSettingsListController *)self spotlightSearchController];
  [v15 setAdditionalSafeAreaInsets:20.0, 0.0, 0.0, 0.0];

  [(COSSettingsListController *)self setDefinesPresentationContext:1];
  id v16 = [(COSSettingsListController *)self spotlightSearchController];
  v17 = [(COSSettingsListController *)self navigationItem];
  [v17 setSearchController:v16];

  id v18 = +[NSMutableSet set];
  [(COSSettingsListController *)self setSearchCategoriesWithoutIcons:v18];
}

- (PSKeyboardNavigationSearchController)spotlightSearchController
{
  return *(PSKeyboardNavigationSearchController **)((char *)&self->_skippedMiniFlowController + 6);
}

- (PSSpotlightSearchResultsController)spotlightResultsController
{
  return *(PSKeyboardNavigationSearchController **)((char *)&self->_spotlightSearchController + 6);
}

- (COSSettingsListController)init
{
  v31.receiver = self;
  v31.super_class = (Class)COSSettingsListController;
  v2 = [(COSPreferencesListController *)&v31 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Bridge.SpotlightWorkQueue", 0);
    v4 = *(void **)(v2 + 342);
    *(void *)(v2 + 342) = v3;

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"reloadAppleWatchDetails:" name:@"COSAboutControllerUserDidChangeDeviceNameNotification" object:0];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"refreshSoftwareUpdateBadge:" name:@"com.apple.Bridge.badgeUpdate" object:0];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"deviceBecameActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    objc_super v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"deviceBecameInActive:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"deviceBecamePaired:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

    int v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"deviceIsSetup:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"compatibilityStateChanged:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

    __int16 v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"reloadApplicationForGreenfieldInstall:" name:NTKGreenfieldApplicationInstallBeganNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"facesViewControllerDidUpdateContent:" name:BPSNTKFacesViewControllerDidUpdateContentNotification object:0];

    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"appInstallErrorReceived:" name:@"COSAppInstallErrorNotification" object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"reloadWatchKitApps:" name:@"COSAppListChangedNotification" object:0];

    id v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"reloadWatchKitApps:" name:ACXRemoteApplicationDatabaseResyncedDistributedNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100073F10, ACXApplicationsUpdatedDarwinNotification, 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v20 = +[MCProfileConnection sharedConnection];
    [v20 registerObserver:v2];

    v21 = @"/System/Library/NanoPreferenceBundles/Customization/NTKCustomization.bundle";
    v22 = +[NSFileManager defaultManager];
    unsigned int v23 = [v22 fileExistsAtPath:v21];

    if ((sub_10000F6D4() & 1) == 0 && v23)
    {
      uint64_t v24 = +[NSBundle bundleWithPath:v21];
      [v24 principalClass];
      uint64_t v25 = objc_opt_new();
      uint64_t v26 = *(void **)(v2 + 278);
      *(void *)(v2 + 278) = v25;
    }
    if ((sub_10000F6D4() & 1) == 0)
    {
      uint64_t v27 = [*(id *)(v2 + 278) facesViewController];
      v28 = *(void **)(v2 + 222);
      *(void *)(v2 + 222) = v27;
    }
    v2[208] = 1;
    v29 = [v2 table];
    [v29 setDelegate:v2];
  }
  return (COSSettingsListController *)v2;
}

- (void)systemAppSpecifierProcessing:(id)a3
{
  id v4 = a3;
  v47 = [(COSSettingsListController *)self activeWatchOrFakeWatch];
  id v5 = [v47 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v43 = [v5 BOOLValue];

  id v6 = [v4 specifierForID:@"com.apple.HeartRateSettings"];
  v46 = v6;
  id v7 = v6;
  if (v6)
  {
    [v6 setProperty:@"Bridge-HeartIcon" forKey:@"squareIconName"];
    [v7 setProperty:@"Bridge-HeartIcon" forKey:PSLazyIconAppID];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  }
  id v8 = [v4 specifierForID:@"com.apple.MessagesBridgeSettings"];
  v45 = v8;
  id v9 = v8;
  if (v8)
  {
    [v8 setProperty:@"messages-80" forKey:@"squareIconName"];
    [v9 setProperty:@"messages-80" forKey:PSLazyIconAppID];
    [v9 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  }
  objc_super v10 = +[MCProfileConnection sharedConnection];
  unsigned int v11 = [v10 effectiveBoolValueForSetting:MCFeatureChatAllowed];

  if (v11 == 2)
  {
    int v12 = [v4 specifierForID:@"com.apple.MessagesBridgeSettings"];
    [v4 removeObject:v12];
  }
  objc_initWeak(&location, self);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10000F9E4;
  v52[3] = &unk_100243810;
  objc_copyWeak(&v53, &location);
  v44 = objc_retainBlock(v52);
  if ((BPSStockholmSupportedInGizmoRegion() & 1) == 0)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v49;
      uint64_t v16 = PSIDKey;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v19 = [v18 propertyForKey:v16];
          unsigned int v20 = [v19 isEqual:@"com.apple.NanoPassbookBridgeSettings"];

          if (v20)
          {
            v21 = sub_100010E5C(@"NanoPassbookBridgeSettings_NoStockholm");
            [v18 setName:v21];

            goto LABEL_18;
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v48 objects:v55 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  BPSRemoveHiddenAppsFromSpecifiers();
  if (BPSDeviceHasCapabilityForString())
  {
    v22 = [v4 specifierForID:@"com.apple.NanoBooks.BridgeSettings"];
    [v4 removeObject:v22];

    unsigned int v23 = [v4 specifierForID:@"com.apple.private.PodcastsBridgeSettings"];
    [v4 removeObject:v23];

    uint64_t v24 = [v4 specifierForID:@"com.apple.tincan.settings"];
    [v4 removeObject:v24];

    uint64_t v25 = [v4 specifierForID:@"com.apple.weatherbridgesettings"];
    [v4 removeObject:v25];

    uint64_t v26 = [v4 specifierForID:@"com.apple.StocksBridgeSettings"];
    [v4 removeObject:v26];

    uint64_t v27 = [v4 specifierForID:@"com.apple.NanoMailBridgeSettings"];
    [v4 removeObject:v27];

    v28 = [v4 specifierForID:@"com.apple.NanoMapsBridgeSettings"];
    [v4 removeObject:v28];

    v29 = [v4 specifierForID:@"com.apple.NanoMusicBridgeSettings"];
    [v4 removeObject:v29];

    v30 = [v4 specifierForID:@"com.apple.NanoCalendarBridgeSettings"];
    [v4 removeObject:v30];

    objc_super v31 = [v4 specifierForID:@"com.apple.NanoClockBridgeSettings"];
    [v4 removeObject:v31];

    v32 = [v4 specifierForID:@"com.apple.HealthSettings"];
    [v4 removeObject:v32];

    v33 = [v4 specifierForID:@"com.apple.DeepBreathingSettings"];
    [v4 removeObject:v33];

    v34 = [v4 specifierForID:@"com.apple.PhoneBridgeSettings"];
    [v4 removeObject:v34];

    v35 = [v4 specifierForID:@"com.apple.MindSettings"];
    [v4 removeObject:v35];

    v36 = [v4 specifierForID:@"com.apple.NanoTipsBridgeSettings"];
    [v4 removeObject:v36];

    v37 = [v4 specifierForID:@"com.apple.NanoMenstrualCyclesCompanionSettings"];
    [v4 removeObject:v37];

    v38 = [v4 specifierForID:@"com.apple.findmy"];
    [v4 removeObject:v38];
  }
  if (sub_10000F71C())
  {
    v39 = [v4 specifierForID:@"com.apple.BridgeHealthSettings"];
    [v4 removeObject:v39];

    v40 = [v4 specifierForID:@"SOS_MODE_ID"];
    [v4 removeObject:v40];

    v41 = [v4 specifierForID:@"PASSCODE_ID"];
    [v4 removeObject:v41];
  }
  if (v43)
  {
    v42 = [v4 specifierForID:@"com.apple.BridgeAppStoreDaemonSettings"];
    [v42 setControllerLoadAction:"_appStoreSpecifierTapped:"];
  }
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);
}

- (id)activeWatchOrFakeWatch
{
  if ([UIApp launchedToTest]) {
    [(COSSettingsListController *)self fakeDevice];
  }
  else {
  dispatch_queue_t v3 = [UIApp displayDevice];
  }

  return v3;
}

- (id)fakeDevice
{
  id v2 = objc_alloc((Class)NRDevice);
  dispatch_queue_t v3 = dispatch_get_global_queue(-2, 0);
  id v4 = [v2 initWithQueue:v3];

  [v4 setValue:&off_10025BFE0 forProperty:@"COSIsActiveHack"];
  [v4 setValue:&off_10025BFE0 forProperty:NRDevicePropertyIsActive];
  [v4 setValue:@"Watch1,1" forProperty:NRDevicePropertyProductType];
  id v9 = &off_10025BFF8;
  objc_super v10 = &off_10025C010;
  id v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v4 setValue:v5 forProperty:NRDevicePropertyDmin];

  [v4 setValue:@"fakeWatch" forProperty:NRDevicePropertyName];
  [v4 setValue:&__kCFBooleanTrue forProperty:NRDevicePropertyIsPaired];
  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:1000.0];
  [v4 setValue:v6 forProperty:NRDevicePropertyPairedDate];

  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"431078C9-5856-4EE3-BD2D-DCA0D02CE82C"];
  [v4 setValue:v7 forProperty:NRDevicePropertyPairingID];

  return v4;
}

- (void)updateNavTitle
{
  dispatch_queue_t v3 = sub_100010E5C(@"MY_WATCH");
  id v4 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    objc_super v10 = "-[COSSettingsListController updateNavTitle]";
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s activeWatch: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v4)
  {
    uint64_t v6 = [UIApp cachedNameForDevice:v4];

    dispatch_queue_t v3 = (void *)v6;
  }
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    objc_super v10 = "-[COSSettingsListController updateNavTitle]";
    __int16 v11 = 2112;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s setting nav title to: %@", (uint8_t *)&v9, 0x16u);
  }

  [(COSSettingsListController *)self setTitle:v3];
  id v8 = [(COSSettingsListController *)self navigationItem];
  [v8 _setLargeTitleTwoLineMode:1];
}

- (id)specifiers
{
  dispatch_queue_t v3 = *(void **)&self->super.super.BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_85;
  }
  uint64_t v94 = OBJC_IVAR___PSListController__specifiers;
  val = self;
  v115.receiver = self;
  v115.super_class = (Class)COSSettingsListController;
  id v4 = [(COSPreferencesListController *)&v115 specifiers];
  id v99 = [v4 mutableCopy];

  if (v99)
  {
    if (!sub_100012810())
    {
      id v5 = [v99 specifierForID:@"FAMILY_WATCHES_GROUP_ID"];
      uint64_t v6 = [v99 specifierForID:@"FAMILY_WATCHES_ID"];
      [v99 removeObject:v5];
      [v99 removeObject:v6];
    }
    if (+[COSPreferencesAppController hasUpdateAvailable])
    {
      id v7 = [v99 specifierForID:@"GENERAL_LINK"];
      [v7 setProperty:&off_10025BFE0 forKey:PSBadgeNumberKey];
    }
    long long v113 = 0u;
    long long v114 = 0u;
    long long v112 = 0u;
    long long v111 = 0u;
    id obj = v99;
    id v8 = [obj countByEnumeratingWithState:&v111 objects:v118 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v112;
      uint64_t v10 = PSLazyIconLoadingCustomQueue;
      uint64_t v11 = PSLazyIconAppID;
      uint64_t v12 = PSLazyIconLoading;
      uint64_t v13 = PSCellClassKey;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v112 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          uint64_t v16 = [v15 propertyForKey:@"squareIconName"];
          if (v16)
          {
            v17 = +[COSSettingsListController sharedTopLevelIconsLazyLoadingQueue];
            [v15 setProperty:v17 forKey:v10];

            [v15 setProperty:v16 forKey:v11];
            [v15 setProperty:&__kCFBooleanTrue forKey:v12];
            [v15 setProperty:objc_opt_class() forKey:v13];
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v111 objects:v118 count:16];
      }
      while (v8);
    }

    if (sub_100008380())
    {
      id v18 = +[NSFileManager defaultManager];
      unsigned int v19 = [v18 fileExistsAtPath:@"/AppleInternal/Library/NanoPreferenceBundles/General/CompanionSetupSettings.bundle"];

      if (v19)
      {
        if ((sub_10000F71C() & 1) == 0 && (sub_10000F634() & 1) == 0) {
          +[COSSetupController debugLiveActivities];
        }
      }
    }
    unsigned int v20 = @"/System/Library/NanoPreferenceBundles/Customization/NTKCustomization.bundle";
    v21 = +[NSFileManager defaultManager];
    unsigned __int8 v22 = [v21 fileExistsAtPath:v20];

    if ((v22 & 1) == 0)
    {
      unsigned int v23 = [obj specifierForID:@"NTK_CUSTOMIZATION_ID"];
      [obj removeObject:v23];
    }
  }
  [(COSSettingsListController *)val updateNavTitle];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obja = v99;
  id v24 = [obja countByEnumeratingWithState:&v107 objects:v117 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v108;
    uint64_t v26 = PSLazyIconAppID;
    uint64_t v100 = PSLazyIconLoading;
    uint64_t v97 = PSCellClassKey;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v108 != v25) {
          objc_enumerationMutation(obja);
        }
        v28 = *(void **)(*((void *)&v107 + 1) + 8 * (void)v27);
        v29 = [v28 identifier];
        if ([v29 isEqualToString:@"INTERNAL_SETTINGS"]) {
          goto LABEL_30;
        }
        v30 = [v28 identifier];
        unsigned __int8 v31 = [v30 isEqualToString:@"CARRIER_SETTINGS"];

        if ((v31 & 1) == 0 && [v28 cellType] == (id)1)
        {
          v32 = [v28 propertyForKey:v26];
          BOOL v33 = v32 == 0;

          if (v33)
          {
            v34 = +[NSNumber numberWithBool:1];
            [v28 setProperty:v34 forKey:v100];

            v29 = BPSWatchAppBundleIDForSettingsBundleSpecifier();
            [v28 setProperty:v29 forKey:v26];
            v35 = BPSIsIconForBundleIDRemote();
            if (([v35 BOOLValue] & 1) == 0)
            {
              v36 = BPSLocalIconName();
              [v28 setProperty:v36 forKey:@"squareIconName"];
            }
            [v28 setProperty:objc_opt_class() forKey:v97];

LABEL_30:
          }
        }
        uint64_t v27 = (char *)v27 + 1;
      }
      while (v24 != v27);
      id v37 = [obja countByEnumeratingWithState:&v107 objects:v117 count:16];
      id v24 = v37;
    }
    while (v37);
  }

  v101 = [(COSSettingsListController *)val activeWatchOrFakeWatch];
  id v38 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E81D5008-B450-487E-9A35-6029799E6588"];
  unsigned int v39 = [v101 supportsCapability:v38];

  if (v39) {
    CFStringRef v40 = @"APP_LAYOUT_ID";
  }
  else {
    CFStringRef v40 = @"APP_VIEW_ID";
  }
  id v41 = [obja indexOfSpecifierWithID:v40];
  if (v41 < [obja count]) {
    [obja removeObjectAtIndex:v41];
  }
  v42 = sub_10000DCF4();
  if (v42 || !PBIsInternalInstall()) {
    goto LABEL_49;
  }
  if (sub_100012810())
  {
    v42 = +[PSSpecifier groupSpecifierWithID:@"UNAVAILABLE_APPS_GROUP_ID"];
    [v42 setProperty:@"It appears that your paired Satellite-Paired Watch is not active. This will be fixed soon (see 46906937).\n\nThis means connectivity will not function until you connect manually to your device; tap the 'all watches' button above and select the device you'd like to make active." forKey:@""];
      PSFooterTextGroupKey);
    [obja insertObject:v42 atIndex:0];
    unsigned int v43 = +[PSSpecifier preferenceSpecifierNamed:@"Internal-Only: No Device Active" target:0 set:0 get:0 detail:0 cell:4 edit:0];
    [obja insertObject:v43 atIndex:1];

LABEL_49:
  }
  if (-[COSSettingsListController watchKitOneAppsEOL](val, "watchKitOneAppsEOL") && [0 count])
  {
    v44 = +[PSSpecifier groupSpecifierWithID:@"UNAVAILABLE_APPS_GROUP_ID"];
    [obja addObject:v44];
    v45 = +[NSBundle mainBundle];
    v46 = [v45 localizedStringForKey:@"UNAVAILABLE_APPS" value:&stru_100249230 table:@"Localizable"];
    v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [obja addObject:v47];
  }
  long long v48 = [v101 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v49 = [v48 BOOLValue];

  v95 = +[BPSFollowUpController baseDomainIdentifier];
  long long v50 = *(BPSNTKCustomization **)((char *)&val->_customizationController + 6);
  if (!v50)
  {
    id v51 = [objc_alloc((Class)FLTopLevelViewModel) initWithBundleIdentifier:v95 clientIdentifier:0];
    v52 = (BPSNTKCustomization *)[objc_alloc((Class)FLPreferencesController) initWithViewModel:v51];
    id v53 = *(BPSNTKCustomization **)((char *)&val->_customizationController + 6);
    *(BPSNTKCustomization **)((char *)&val->_customizationController + 6) = v52;

    v54 = sub_100010E5C(@"APPLE_WATCH_SETUP_SUGGESTIONS");
    [v51 setLocalizedDeviceRowTitle:v54];

    [*(id *)((char *)&val->_customizationController + 6) setListViewController:val];
    objc_initWeak(location, val);
    v55 = *(BPSNTKCustomization **)((char *)&val->_customizationController + 6);
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_100074060;
    v104[3] = &unk_1002439E0;
    objc_copyWeak(&v105, location);
    [v55 setItemChangeObserver:v104];
    objc_destroyWeak(&v105);
    objc_destroyWeak(location);

    long long v50 = *(BPSNTKCustomization **)((char *)&val->_customizationController + 6);
  }
  v56 = [v50 topLevelSpecifiers];
  v57 = +[BPSFollowUpController skippedSetupPaneClassesForCurrentDevice];
  v98 = v57;
  if (v57 && [v57 count])
  {
    v58 = +[PSSpecifier groupSpecifierWithID:@"SKIPPED_PANES_GROUP"];
    v59 = sub_100010E5C(@"SKIPPED_PANES_ROW_TITLE");
    if (v49)
    {
      v60 = [UIApp tinkerUserName];
      v61 = +[NSBundle mainBundle];
      v62 = [v61 localizedStringForKey:@"SKIPPED_PANES_ROW_TITLE_NAME_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      uint64_t v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v60);

      v59 = (void *)v63;
    }
    v64 = +[PSSpecifier preferenceSpecifierNamed:v59 target:val set:0 get:0 detail:0 cell:1 edit:0];
    [v64 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v65 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v98 count]);
    [v64 setProperty:v65 forKey:PSBadgeNumberKey];

    [v64 setControllerLoadAction:"presentSkippedPanes:"];
    [v64 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    v116[0] = v58;
    v116[1] = v64;
    v66 = +[NSArray arrayWithObjects:v116 count:2];
    uint64_t v67 = [v56 arrayByAddingObjectsFromArray:v66];

    v56 = (void *)v67;
    if ((v49 & 1) == 0) {
      goto LABEL_60;
    }
LABEL_63:
    if (v66 && [v66 count])
    {
      v69 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v66 count]);
      [obja insertObjects:v66 atIndexes:v69];
    }
    v68 = [UIApp tinkerUserName];
    if ([v68 length])
    {
      v70 = [(COSSettingsListController *)val specifierForID:@"APPLE_APP_GROUP_ID"];
      v71 = +[NSBundle mainBundle];
      v72 = [v71 localizedStringForKey:@"TINKER_APP_INSTALL_FOR_USER_%@" value:&stru_100249230 table:@"Localizable-tinker"];
      v73 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v72, v68);
      [v70 setProperty:v73 forKey:PSFooterTextGroupKey];
    }
    else
    {
      v70 = pbb_bridge_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Tinker user name had zero length!", (uint8_t *)location, 2u);
      }
    }

    goto LABEL_72;
  }
  v66 = 0;
  if (v49) {
    goto LABEL_63;
  }
LABEL_60:
  if (![v56 count]) {
    goto LABEL_73;
  }
  v68 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v56 count]);
  [obja insertObjects:v56 atIndexes:v68];
LABEL_72:

LABEL_73:
  [(COSSettingsListController *)val notifyNTKAboutActiveWatch];
  if (!BPSDeviceHasCapabilityForString()
    || ![(COSSettingsListController *)val isBreatheAppInstalled]
    && (-[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0(),
        v74 = objc_claimAutoreleasedReturnValue(),
        int HasStandaloneAppsCapability = BPSDeviceHasStandaloneAppsCapability(),
        v74,
        HasStandaloneAppsCapability))
  {
    v76 = [obja specifierForID:@"com.apple.DeepBreathingSettings"];
    [obja removeObject:v76];
  }
  [(COSSettingsListController *)val systemAppSpecifierProcessing:obja];
  if (sub_10000F71C())
  {
    v77 = [obja specifierForID:@"PASSCODE_ID"];
    [obja removeObject:v77];
  }
  v78 = [obja specifierForID:@"PAIRED_WATCH_GROUP_ID"];
  [obja removeObject:v78];

  if ([(COSSettingsListController *)val isEnrolledAndSupervised])
  {
    v79 = +[PSSpecifier groupSpecifierWithID:@"DEVICE_MANAGEMENT_GROUP_ID"];
    v80 = +[NSBundle mainBundle];
    v81 = [v80 localizedStringForKey:@"LEARN_MORE_ABOUT_SUPERVISION" value:&stru_100249230 table:@"Localizable-yorktown"];

    v82 = [(COSSettingsListController *)val enrolledOrganizationName];

    +[NSBundle mainBundle];
    if (v82) {
      v83 = {;
    }
      v84 = [v83 localizedStringForKey:@"DEVICE_MANAGEMENT_INFO_WITH_ORG_%@" value:&stru_100249230 table:@"Localizable-yorktown"];
      v85 = [(COSSettingsListController *)val enrolledOrganizationName];
      v86 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v84, v85);
    }
    else {
      v83 = {;
    }
      v86 = [v83 localizedStringForKey:@"DEVICE_MANAGEMENT_INFO" value:&stru_100249230 table:@"Localizable-yorktown"];
    }

    v87 = +[NSString stringWithFormat:@"%@ %@", v86, v81];
    v88 = (objc_class *)objc_opt_class();
    v89 = NSStringFromClass(v88);
    [v79 setProperty:v89 forKey:PSFooterCellClassGroupKey];

    [v79 setProperty:v87 forKey:PSFooterHyperlinkViewTitleKey];
    v120.id location = (NSUInteger)[v87 rangeOfString:v81];
    v90 = NSStringFromRange(v120);
    [v79 setProperty:v90 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v91 = +[NSValue valueWithNonretainedObject:val];
    [v79 setProperty:v91 forKey:PSFooterHyperlinkViewTargetKey];

    [v79 setProperty:@"showDeviceSupervisionInfo" forKey:PSFooterHyperlinkViewActionKey];
    [obja insertObject:v79 atIndex:0];
  }
  v92 = *(void **)&val->super.super.BPSListController_opaque[v94];
  *(void *)&val->super.super.BPSListController_opaque[v94] = obja;

  dispatch_queue_t v3 = *(void **)&val->super.super.BPSListController_opaque[v94];
LABEL_85:

  return v3;
}

+ (id)sharedTopLevelIconsLazyLoadingQueue
{
  id v2 = (void *)qword_10029B0A8;
  if (!qword_10029B0A8)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    id v4 = (void *)qword_10029B0A8;
    qword_10029B0A8 = (uint64_t)v3;

    [(id)qword_10029B0A8 setMaxConcurrentOperationCount:8];
    id v2 = (void *)qword_10029B0A8;
  }

  return v2;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)COSSettingsListController;
    id v7 = [(COSSettingsListController *)&v15 tableView:v6 viewForHeaderInSection:a4];
  }
  else
  {
    id v8 = [(COSSettingsListController *)self activeWatchOrFakeWatch];
    uint64_t v9 = [v8 valueForProperty:NRDevicePropertyIsAltAccount];
    unsigned __int8 v10 = [v9 BOOLValue];

    int HasCapabilityForString = BPSDeviceHasCapabilityForString();
    unsigned __int8 v12 = sub_10000F6D4();
    id v7 = 0;
    if (*(void *)(&self->_isEnrolledAndSupervised + 6) && (v12 & 1) == 0 && (v10 & 1) == 0 && HasCapabilityForString)
    {
      id v7 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"COSGalleryHeaderIdentifier"];
      uint64_t v13 = [*(id *)(&self->_isEnrolledAndSupervised + 6) view];
      [v7 setGalleryView:v13];
    }
  }

  return v7;
}

- (id)settingsFileName
{
  return @"Settings";
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)COSSettingsListController;
  [(COSSettingsListController *)&v3 viewDidLayoutSubviews];
  if (!self->super._didFirstLoad) {
    self->super._didFirstLoad = 1;
  }
}

- (BOOL)showPairingButton
{
  if (!self->_receivedDiscoveryResult) {
    return 0;
  }
  id v2 = +[NRDeviceDiscoveryController sharedInstance];
  objc_super v3 = [v2 devices];

  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_100245090];

  id v6 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    uint64_t v11 = _NRDevicePropertyBluetoothIdentifier;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = [*(id *)(*((void *)&v33 + 1) + 8 * i) valueForProperty:v11];
        [v6 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  id v14 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    uint64_t v17 = NRDevicePropertyIsPaired;
    uint64_t v27 = _NRDevicePropertyBluetoothIdentifier;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        unsigned int v19 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
        unsigned int v20 = [v19 valueForProperty:v17, v27];
        if ([v20 BOOLValue])
        {
        }
        else
        {
          v21 = [v19 valueForProperty:v27];
          unsigned __int8 v22 = [v6 containsObject:v21];

          if ((v22 & 1) == 0)
          {
            id v24 = pbb_bridge_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v19;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "There's an advertising Watch nearby: %@", buf, 0xCu);
            }

            uint64_t v25 = +[PPDiscoveryManager sharedDiscoveryManager];
            [v25 end];

            BOOL v23 = 1;
            goto LABEL_24;
          }
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 0;
LABEL_24:

  return v23;
}

- (void)setSpotlightSearchController:(id)a3
{
}

- (void)setSpotlightResultsController:(id)a3
{
}

- (void)setSearchCategoriesWithoutIcons:(id)a3
{
}

- (BOOL)reloadsWhenBecomingActive
{
  return 0;
}

- (void)reindexIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015FD8;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyNTKAboutActiveWatch
{
}

- (BOOL)isEnrolledAndSupervised
{
  return self->_isEnrolledAndSupervised;
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v5 = +[MCProfileConnection sharedConnection];
  [v5 unregisterObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)COSSettingsListController;
  [(COSPreferencesListController *)&v6 dealloc];
}

- (void)_showDevicePicker:(id)a3
{
  id v6 = a3;
  [(COSSettingsListController *)self setSpotlightSearchController:0];
  [(COSSettingsListController *)self setSpotlightResultsController:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v6 identifier];
    id v5 = [v4 isEqualToString:@"FAMILY_WATCHES_ID"];
  }
  else
  {
    id v5 = 0;
  }
  [UIApp presentDevicePicker:v5];
}

- (void)_appStoreSpecifierTapped:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[COSSettingsListController _appStoreSpecifierTapped:]";
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s app store specifier call back: %@", buf, 0x16u);
  }

  [(COSSettingsListController *)self _startSpinnerInSpecifier:v4];
  id v6 = [v4 propertyForKey:PSLazilyLoadedBundleKey];
  id v7 = +[NSBundle bundleWithPath:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = objc_alloc_init((Class)[v7 principalClass]);
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = pbb_bridge_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[COSSettingsListController _appStoreSpecifierTapped:]";
          __int16 v29 = 2112;
          id v30 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s app store controller: %@", buf, 0x16u);
        }
        goto LABEL_13;
      }
    }
  }
  uint64_t v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[COSSettingsListController _appStoreSpecifierTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s app store controller not found!", buf, 0xCu);
  }
  id v9 = 0;
LABEL_13:

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000744A4;
  v24[3] = &unk_100244FA8;
  v24[4] = self;
  id v11 = v4;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10007464C;
  v22[3] = &unk_100244FF8;
  v22[4] = self;
  uint64_t v13 = objc_retainBlock(v24);
  id v23 = v13;
  id v14 = objc_retainBlock(v22);
  id v15 = +[BPSTinkerSupport sharedInstance];
  uint64_t v16 = [v15 cachedTinkerAKDevice];

  uint64_t v17 = +[BPSTinkerSupport sharedInstance];
  id v18 = [v17 cachedTinkerFamilyMemeber];

  if (v16 && v18)
  {
    ((void (*)(void *, void *, void *, void))v14[2])(v14, v18, v16, 0);
  }
  else
  {
    unsigned int v19 = +[BPSTinkerSupport sharedInstance];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100074788;
    v20[3] = &unk_100245020;
    v21 = v14;
    [v19 getActiveTinkerFamilyMemberDetailsWithCompletion:v20];
  }
}

- (void)_storeReauthStepForTinkerFamilyMember:(id)a3 withWatchAKDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pbb_accountsignin_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[COSSettingsListController _storeReauthStepForTinkerFamilyMember:withWatchAKDevice:completion:]";
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Found: %@", buf, 0x16u);
  }

  id v12 = +[COSTinkerAppStoreAuthHelper satelliteStoreAccountForFamilyMember:v8];
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100074994;
  v16[3] = &unk_100245070;
  id v13 = v10;
  id v20 = v13;
  objc_copyWeak(&v21, (id *)buf);
  id v14 = v12;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  unsigned int v19 = self;
  +[COSiTunesStoreAuthController repairDialogsForActiveDeviceWithCompletion:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithStoreRepairForAccount:(id)a3 withWatchAKDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(COSTinkerAppStoreAuthHelperContext);
  [(COSTinkerAppStoreAuthHelperContext *)v11 setPresentingViewController:self];
  [(COSTinkerAppStoreAuthHelperContext *)v11 setSatelliteAKDevice:v9];

  [(COSTinkerAppStoreAuthHelperContext *)v11 setSatelliteAppStoreAccount:v10];
  id v12 = [[COSTinkerAppStoreAuthHelper alloc] initWithContext:v11];
  id v13 = *(NSString **)((char *)&self->_enrolledOrganizationName + 6);
  *(NSString **)((char *)&self->_enrolledOrganizationName + 6) = (NSString *)&v12->super.isa;

  id v14 = *(NSString **)((char *)&self->_enrolledOrganizationName + 6);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100074ED8;
  v16[3] = &unk_100244998;
  id v17 = v8;
  id v15 = v8;
  [v14 authenticateWithCompletion:v16];
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  if (a3)
  {
    objc_super v3 = [a3 propertyForKey:PSTableCellKey];
    if (v3)
    {
      id v5 = v3;
      id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v4 startAnimating];
      [v5 setAccessoryView:v4];

      objc_super v3 = v5;
    }
  }
}

- (void)_stopSpinnerInSpecifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[COSSettingsListController _stopSpinnerInSpecifier:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s app store specifier stopping", (uint8_t *)&v7, 0xCu);
    }

    id v5 = [v3 propertyForKey:PSTableCellKey];
    if (v5)
    {
      id v6 = [v3 propertyForKey:PSControlKey];
      [v5 setAccessoryView:v6];
    }
  }
}

- (void)jumpToAppStoreWatchSection:(id)a3
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSSettingsListController jumpToAppStoreWatchSection:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[NSURL URLWithString:@"itms-apps://?action=watchCategory"];
  BPSOpenSensitiveURLAsync();
}

- (void)presentPairingFlowIfPossible
{
  id v2 = +[UIApplication sharedApplication];
  [v2 presentNewPairingFlowIfPossible];
}

- (void)_hackToRemoveExtraSearchView
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [*(id *)&self->super.super.BPSListController_opaque[OBJC_IVAR___PSListController__table] subviews];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      int v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
      if ([v7 isMemberOfClass:objc_opt_class()]) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v8 = v7;

    if (!v8) {
      return;
    }
    [v8 removeFromSuperview];
    id v2 = v8;
  }
LABEL_12:
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COSSettingsListController;
  [(COSSettingsListController *)&v6 viewWillDisappear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:PPDeviceWasDiscoveredNotification object:0];

  uint64_t v5 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v5 end];
}

- (void)willEnterForeground:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  if ([v4 isInSetupFlow])
  {
  }
  else
  {
    uint64_t v5 = [(COSSettingsListController *)self navigationController];
    objc_super v6 = [v5 topViewController];

    if (v6 == self) {
      [(COSSettingsListController *)self _prepareDiscoveryIfNeeded];
    }
  }
  if ([(COSSettingsListController *)self shouldRefreshRowsOnForegroundEvent])
  {
    [(COSSettingsListController *)self setShouldRefreshRowsOnForegroundEvent:0];
    int v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"COSInstallProgressNotificationName" object:0];
  }
  id v8 = +[UIApplication sharedApplication];
  unsigned __int8 v9 = [v8 isInSetupFlow];

  if ((v9 & 1) == 0)
  {
    [(COSSettingsListController *)self _kickOffWatchKitAppReload];
    long long v10 = (void *)UIApp;
    _[v10 performDeviceSpecificRepairStepsForActiveDevice];
  }
}

- (void)didEnterBackground:(id)a3
{
  if ([(COSSettingsListController *)self hasRowsPendingInstallation])
  {
    [(COSSettingsListController *)self setShouldRefreshRowsOnForegroundEvent:1];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)presentSkippedPanes:(id)a3
{
  id v4 = a3;
  if (*(FLPreferencesController **)((char *)&self->_fuPrefsController + 6))
  {
    uint64_t v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Already presenting mini-flow. skipping", (uint8_t *)buf, 2u);
    }

    objc_super v6 = [(COSSettingsListController *)self table];
    int v7 = [(COSSettingsListController *)self table];
    id v8 = [v7 indexPathForSelectedRow];
    [v6 deselectRowAtIndexPath:v8 animated:1];
  }
  else
  {
    unsigned __int8 v9 = +[BPSFollowUpController skippedSetupPaneClassesForCurrentDevice];
    objc_super v6 = v9;
    if (v9 && [v9 count])
    {
      id v10 = +[COSSetupController loadBundleControllerClasses];
      long long v11 = [[COSSkippedMiniFlowController alloc] initWithSkippedControllerClassNames:v6];
      long long v12 = *(FLPreferencesController **)((char *)&self->_fuPrefsController + 6);
      *(FLPreferencesController **)((char *)&self->_fuPrefsController + 6) = (FLPreferencesController *)v11;

      [*(id *)((char *)&self->_fuPrefsController + 6) setFlowDelegate:self];
      id v13 = [*(id *)((char *)&self->_fuPrefsController + 6) currentController];

      if (v13)
      {
        objc_initWeak(buf, self);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100075B54;
        v32[3] = &unk_1002450B8;
        objc_copyWeak(&v33, buf);
        id v14 = objc_retainBlock(v32);
        id v15 = [UIApp activeWatch];
        uint64_t v16 = [v15 valueForProperty:NRDevicePropertyIsAltAccount];
        unsigned int v17 = [v16 BOOLValue];

        if (v17)
        {
          id v18 = +[BPSTinkerSupport sharedInstance];
          unsigned int v19 = [v18 cachedTinkerFamilyMemeber];

          if (v19)
          {
            ((void (*)(void *, void *, void))v14[2])(v14, v19, 0);
          }
          else
          {
            [(COSSettingsListController *)self _startSpinnerInSpecifier:v4];
            id v23 = +[BPSTinkerSupport sharedInstance];
            id v25 = _NSConcreteStackBlock;
            uint64_t v26 = 3221225472;
            uint64_t v27 = sub_100075CB0;
            v28 = &unk_100245108;
            objc_copyWeak(&v31, buf);
            id v29 = v4;
            id v30 = v14;
            [v23 getActiveTinkerFamilyMemberDetailsWithCompletion:&v25];

            objc_destroyWeak(&v31);
          }
        }
        else
        {
          [(COSSettingsListController *)self presentViewController:*(FLPreferencesController **)((char *)&self->_fuPrefsController + 6) animated:1 completion:0];
        }

        objc_destroyWeak(&v33);
        objc_destroyWeak(buf);
      }
      else
      {
        id v21 = pbb_bridge_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Tried to present skipped panes but none could be initialized, aborting skipped mini-flow", (uint8_t *)buf, 2u);
        }

        unsigned __int8 v22 = *(FLPreferencesController **)((char *)&self->_fuPrefsController + 6);
        *(FLPreferencesController **)((char *)&self->_fuPrefsController + 6) = 0;
      }
    }
    else
    {
      id v20 = pbb_bridge_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tried to present skipped panes but none were found", (uint8_t *)buf, 2u);
      }
    }
    int v7 = [(COSSettingsListController *)self table];
    id v8 = [(COSSettingsListController *)self table];
    __int16 v24 = [v8 indexPathForSelectedRow];
    [v7 deselectRowAtIndexPath:v24 animated:1];
  }
}

- (void)skippedMiniFlowDidFinish:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipped mini flow did finish, reloading root settings specifiers", v6, 2u);
  }

  uint64_t v5 = *(FLPreferencesController **)((char *)&self->_fuPrefsController + 6);
  *(FLPreferencesController **)((char *)&self->_fuPrefsController + 6) = 0;

  [(COSListController *)self reloadSpecifiers];
}

- (void)discoveredAdvertisingWatch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "discoveredAdvertisingWatch: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_receivedDiscoveryResult = 1;
  objc_super v6 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v6 end];
}

- (id)generalViewController
{
  id v3 = [(COSSettingsListController *)self specifierForID:@"GENERAL_LINK"];
  id v4 = [(COSSettingsListController *)self selectSpecifier:v3];

  return v4;
}

- (int64_t)indexOfGeneralController
{
  return (int64_t)[(COSSettingsListController *)self indexOfSpecifierID:@"GENERAL_LINK"];
}

- (BOOL)wantsCustomControllerForRootSpecifierID:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = sub_10007CA64();
  uint64_t v5 = [v4 allKeys];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:v3])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (void)pushCustomControllerForRootSpecifierID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10007CA64();
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    [(COSSettingsListController *)self _pushCustomControllerForPath:v6 andTitle:0];
  }
  else
  {
    uint64_t v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to push controller for rootSpecifierID: %@!", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)customControllerForRootSpecifierID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10007CA64();
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [(COSSettingsListController *)self customControllerForBundlePath:v6];
  }
  else
  {
    int v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to to get controller for rootSpecifierID: %@!", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)customControllerForBundlePath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithPath:v3];
  uint64_t v5 = pbb_bridge_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found Bundle: %@!", (uint8_t *)&v11, 0xCu);
    }

    id v7 = objc_alloc_init((Class)[v4 principalClass]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [v7 viewControllers];
      id v9 = [v8 firstObject];
    }
    else
    {
      id v9 = v7;
    }
  }
  else
  {
    if (v6)
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did Not Find %@", (uint8_t *)&v11, 0xCu);
    }

    id v9 = objc_alloc_init((Class)PSViewController);
  }

  return v9;
}

- (void)_pushCustomControllerForPath:(id)a3 andTitle:(id)a4
{
  -[COSSettingsListController customControllerForBundlePath:](self, "customControllerForBundlePath:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(COSSettingsListController *)self splitViewController];
  [v5 showInitialViewController:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(COSSettingsListController *)self specifierAtIndex:[(COSSettingsListController *)self indexForIndexPath:v7]];
  id v9 = [v8 identifier];
  unsigned int v10 = [v9 isEqualToString:@"CELLULAR_ID"];
  if ((v10 & 1) == 0)
  {
    [(COSSettingsListController *)self stopSpinner];
    self->_navigateWhenReceivingCellularPlanResult = 0;
  }
  if ([(COSSettingsListController *)self wantsCustomControllerForRootSpecifierID:v9])
  {
    [(COSSettingsListController *)self pushCustomControllerForRootSpecifierID:v9];
  }
  else if ([v9 isEqual:@"FAMILY_WATCHES_ID"])
  {
    [(COSSettingsListController *)self _showDevicePicker:v8];
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
  else if (v10)
  {
    int v11 = [sub_100006450() sharedInstance];
    unsigned int v12 = [v11 cellularPlanIsSetUp];

    if (v12)
    {
      -[COSPreferencesListController tableView:didSelectRowAtIndexPath:](&v17, "tableView:didSelectRowAtIndexPath:", v6, v7, v16.receiver, v16.super_class, self, COSSettingsListController);
    }
    else
    {
      self->_navigateWhenReceivingCellularPlanResult = 1;
      [v6 deselectRowAtIndexPath:v7 animated:1];
      id v13 = [(COSSettingsListController *)self indexForIndexPath:v7];
      id v14 = [*(id *)&self->super.super.BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v13];
      [(COSSettingsListController *)self startSpinnerInCellForSpecifier:v14];
      id v15 = [sub_100006450() sharedInstance];
      [v15 updateCellularPlansWithFetch:0];
    }
  }
  else
  {
    -[COSPreferencesListController tableView:didSelectRowAtIndexPath:](&v16, "tableView:didSelectRowAtIndexPath:", v6, v7, self, COSSettingsListController, v17.receiver, v17.super_class);
  }
}

- (void)startSpinnerInCellForSpecifier:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  [(COSSettingsListController *)self stopSpinner];
  id v7 = [(NSMutableArray *)v4 propertyForKey:PSTableCellKey];
  if (v7)
  {
    id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    [v7 setForceHideDisclosureIndicator:1];
    [v7 setAccessoryView:v5];
  }
  id v6 = *(NSMutableArray **)((char *)&self->_stashedWatchKitAppsState + 6);
  *(NSMutableArray **)((char *)&self->_stashedWatchKitAppsState + 6) = v4;
}

- (void)stopSpinner
{
  id v3 = *(NSMutableArray **)((char *)&self->_stashedWatchKitAppsState + 6);
  if (v3)
  {
    id v5 = [v3 propertyForKey:PSTableCellKey];
    [v5 setAccessoryView:0];
    [v5 setForceHideDisclosureIndicator:0];
    id v4 = *(NSMutableArray **)((char *)&self->_stashedWatchKitAppsState + 6);
    *(NSMutableArray **)((char *)&self->_stashedWatchKitAppsState + 6) = 0;
  }
}

- (id)hardcodedSpecifiers
{
  return &__NSArray0__struct;
}

- (id)specialCaseVictoryRow
{
  id v2 = [UIApp displayDevice];
  if (v2)
  {
    id v3 = sub_1000E3478();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)wkAppSpinnerGroup
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076984;
  block[3] = &unk_1002438A0;
  block[4] = self;
  if (qword_10029B0B8 != -1) {
    dispatch_once(&qword_10029B0B8, block);
  }
  return (id)qword_10029B0B0;
}

- (void)decorateSpecifierWithWKDetails:(id)a3 byIdentifier:(id)a4 andApplication:(id)a5
{
  id v8 = a3;
  id v25 = a4;
  id v9 = a5;
  unsigned int v10 = sub_100076E1C(v9);
  int v11 = [v9 companionAppBundleID];
  unsigned int v12 = [v9 bundleIdentifier];
  id v13 = *(NSMutableSet **)((char *)&self->_searchCategoriesWithoutIcons + 6);
  id v14 = [v9 bundleIdentifier];
  id v15 = [v13 objectForKey:v14];

  id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 applicationMode]);
  __int16 v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isBetaApp]);
  id v23 = [v9 watchKitVersion];
  unsigned __int8 v22 = [v9 teamID];
  unint64_t v16 = (unint64_t)[v9 isLocallyAvailable];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  objc_super v17 = (void *)qword_10029B0E8;
  uint64_t v30 = qword_10029B0E8;
  if (!qword_10029B0E8)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10007CB90;
    v26[3] = &unk_1002436A8;
    v26[4] = &v27;
    sub_10007CB90((uint64_t)v26);
    objc_super v17 = (void *)v28[3];
    unint64_t v16 = v16;
  }
  id v18 = v17;
  _Block_object_dispose(&v27, 8);
  id v19 = objc_alloc_init(v18);
  [v19 setSectionID:v12];
  [v8 setName:v10];
  [v8 setProperty:@"Root" forKey:PSPlistNameKey];
  [v8 setProperty:v11 forKey:PSIDKey];
  [v8 setProperty:v11 forKey:PSAppSettingsBundleIDKey];
  [v8 setProperty:v25 forKey:PSLazyIconAppID];
  [v8 setProperty:v25 forKey:@"COSSockPuppetAppBundleIDKey"];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v8 setProperty:v19 forKey:BPSNotificationAppBBSectionInfo];
  [v8 setProperty:v15 forKey:@"COSSockPuppetInstallationState"];
  [v8 setProperty:v21 forKey:@"applicationMode"];
  id v20 = +[NSNumber numberWithBool:v16];
  [v8 setProperty:v20 forKey:@"locallyAvailable"];

  [v8 setProperty:v24 forKey:@"COSApplicationIsBeta"];
  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v8 setProperty:v23 forKey:@"COSSockPuppetWatchKitVersionKey"];
  [v8 setProperty:v22 forKey:@"COSSockPuppetAppTeamIDKey"];
}

- (id)specifiersForWKApps:(id)a3
{
  id v4 = a3;
  id v5 = (UIViewController *)objc_opt_new();
  id v6 = *(UIViewController **)((char *)&self->_nothingSelectedController + 6);
  *(UIViewController **)((char *)&self->_nothingSelectedController + 6) = v5;

  id v7 = +[NSMutableArray array];
  id v8 = +[NSMutableArray array];
  id v9 = +[NSMutableArray array];
  unsigned int v10 = +[MCProfileConnection sharedConnection];
  int v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 effectiveBoolValueForSetting:@"allowAppInstallation"] != 2);

  [(COSSettingsListController *)self setHasRowsPendingInstallation:0];
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000772FC;
  v23[3] = &unk_100245130;
  v23[4] = self;
  objc_copyWeak(&v28, &location);
  id v12 = v7;
  id v24 = v12;
  id v13 = v8;
  id v25 = v13;
  id v14 = v11;
  id v26 = v14;
  id v15 = v9;
  id v27 = v15;
  [v4 enumerateKeysAndObjectsUsingBlock:v23];
  if (!self->_showAppSections)
  {
    if (![v12 count]) {
      goto LABEL_9;
    }
    [v12 sortUsingSelector:"titleCompare:"];
    id v18 = +[PSSpecifier emptyGroupSpecifier];
    [v12 insertObject:v18 atIndex:0];
    goto LABEL_8;
  }
  if ([v13 count])
  {
    [v13 sortUsingSelector:"titleCompare:"];
    unint64_t v16 = +[PSSpecifier emptyGroupSpecifier];
    objc_super v17 = [(COSSettingsListController *)self localizedPrefsStringForString:@"Installed_Apps_Section_Title"];
    [v16 setName:v17];

    [v13 insertObject:v16 atIndex:0];
    [v12 addObjectsFromArray:v13];
  }
  if ([v15 count])
  {
    [v15 sortUsingSelector:"titleCompare:"];
    id v18 = +[PSSpecifier emptyGroupSpecifier];
    id v19 = [(COSSettingsListController *)self localizedPrefsStringForString:@"Available_Apps_Section_Title"];
    [v18 setName:v19];

    [v15 insertObject:v18 atIndex:0];
    [v12 addObjectsFromArray:v15];
LABEL_8:
  }
LABEL_9:
  id v20 = v27;
  id v21 = v12;

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v21;
}

- (int64_t)_groupIndexForGroup:(id)a3
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  [(COSSettingsListController *)self getGroup:&v4 row:0 ofSpecifier:a3];
  return v4;
}

- (void)refreshAppleAppGroupFooterState:(BOOL)a3
{
  id v8 = [(COSSettingsListController *)self specifierForID:@"APPLE_APP_GROUP_ID"];
  int64_t v4 = -[COSSettingsListController _groupIndexForGroup:](self, "_groupIndexForGroup:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v4;
    id v6 = [(COSSettingsListController *)self table];
    id v7 = +[NSIndexSet indexSetWithIndex:v5];
    [v6 _reloadSectionHeaderFooters:v7 withRowAnimation:100];
  }
}

- (id)filterSockPuppetApps:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_opt_new();
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100077D6C;
  v20[3] = &unk_100245158;
  void v20[4] = self;
  objc_copyWeak(&v22, &location);
  id v6 = v5;
  id v21 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v20];
  if ([(COSSettingsListController *)self watchKitOneAppsEOL])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [0 allKeys];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v12 = [v6 objectForKey:v11];

          if (v12) {
            [v6 removeObjectForKey:v11];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v8);
    }
  }
  id v13 = v21;
  id v14 = v6;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v14;
}

- (id)filterForWatchInstalledApps:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100077F3C;
  v9[3] = &unk_100245180;
  v9[4] = self;
  id v5 = (id)objc_opt_new();
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)_kickOffWatchKitAppReload
{
  id v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 isInSetupFlow];

  if (v4)
  {
    uint64_t v5 = pbb_bridge_log();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Skipping app reload as we are in pairing", buf, 2u);
    }
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100078318;
    v18[3] = &unk_1002451F8;
    v18[4] = self;
    uint64_t v5 = objc_retainBlock(v18);
    id v6 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    int HasCapabilityForString = BPSDeviceHasCapabilityForString();

    if (HasCapabilityForString)
    {
      id v8 = pbb_bridge_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skip showing Guardian Apps while connected to Tinker Device", buf, 2u);
      }

      (*(void (**)(uint64_t, void, void, void))(v5 + 16))(v5, 0, 0, 0);
    }
    else
    {
      uint64_t v9 = +[UIApplication sharedApplication];
      unsigned int v10 = [v9 _forceComplexTopLevel];

      if (v10)
      {
        uint64_t v11 = [(COSSettingsListController *)self _pptApps];
        (*(void (**)(uint64_t, void *, void, void))(v5 + 16))(v5, v11, 0, 0);
      }
      else
      {
        id v12 = sub_1000333A4();
        id v13 = pbb_bridge_log();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            id v15 = [v12 pairingID];
            *(_DWORD *)buf = 138543362;
            id v20 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Kick off App Reload for %{public}@...", buf, 0xCu);
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100078A08;
          block[3] = &unk_1002441B0;
          block[4] = self;
          id v17 = (id)v5;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        else
        {
          if (v14)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skip App Reload since we have no active device.", buf, 2u);
          }
        }
      }
    }
  }
}

- (void)insertAndDeleteSpecifiersForChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  id v6 = 0;
  unint64_t v7 = 0;
  id v8 = ASDPurchase_ptr;
  *(void *)&long long v9 = 138412290;
  long long v49 = v9;
  id v50 = v4;
LABEL_2:
  unint64_t v51 = v7;
  while (v7 < (unint64_t)objc_msgSend(v4, "count", v49)
       || v7 < (unint64_t)[*(id *)((char *)&self->_sockPuppetAppMapping + 6) count])
  {

    if (v7 >= (unint64_t)[v4 count])
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [v4 objectAtIndex:v7];
    }
    if (v7 >= (unint64_t)[*(id *)((char *)&self->_sockPuppetAppMapping + 6) count])
    {
      uint64_t v5 = 0;
      if (!v6) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v5 = [*(id *)((char *)&self->_sockPuppetAppMapping + 6) objectAtIndex:v7];
      if (!v6) {
        goto LABEL_13;
      }
    }
    if (!v5)
    {
      long long v34 = pbb_bridge_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "New set of specifiers is longer than the old set, appending new specifiers", buf, 2u);
      }

      long long v35 = v8[114];
      long long v36 = objc_msgSend(v4, "subarrayWithRange:", v7, (char *)objc_msgSend(v4, "count") - v7);
      uint64_t v37 = [v35 arrayWithArray:v36];

      id v38 = [*(id *)((char *)&self->_sockPuppetAppMapping + 6) lastObject];
      unsigned int v39 = [v38 identifier];
      CFStringRef v40 = (char *)[(COSSettingsListController *)self indexOfSpecifierID:v39];

      [(COSPreferencesListController *)self insertContiguousSpecifiers:v37 atIndex:v40 + 1 animated:1];
      goto LABEL_46;
    }
LABEL_13:
    if (v5 && !v6)
    {
      id v41 = pbb_bridge_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "New set of specifiers is shorter than the old set, removing extra specifiers", buf, 2u);
      }

      v42 = v8[114];
      unsigned int v43 = objc_msgSend(*(id *)((char *)&self->_sockPuppetAppMapping + 6), "subarrayWithRange:", v7, (char *)objc_msgSend(*(id *)((char *)&self->_sockPuppetAppMapping + 6), "count") - v7);
      v44 = [v42 arrayWithArray:v43];

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v38 = v44;
      id v45 = [v38 countByEnumeratingWithState:&v52 objects:v63 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v53;
        do
        {
          for (i = 0; i != v46; i = (char *)i + 1)
          {
            if (*(void *)v53 != v47) {
              objc_enumerationMutation(v38);
            }
            [(COSSettingsListController *)self _removeSpecifierFromTableAndStash:*(void *)(*((void *)&v52 + 1) + 8 * i) animated:1];
          }
          id v46 = [v38 countByEnumeratingWithState:&v52 objects:v63 count:16];
        }
        while (v46);
      }
      uint64_t v37 = (uint64_t)v38;
      id v6 = v5;
LABEL_46:

      uint64_t v5 = (void *)v37;
      break;
    }
    if (sub_100079190(v6, v5))
    {
      ++v7;
      goto LABEL_2;
    }
    unsigned int v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 identifier];
      id v12 = [v5 identifier];
      *(_DWORD *)buf = 138412546;
      v60 = v11;
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New specifier: %@ and old one: %@ differ, adjusting list", buf, 0x16u);
    }
    id v13 = [v6 name];
    BOOL v14 = [v5 name];
    unsigned int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      [(COSSettingsListController *)self _removeSpecifier:v5 andInsertSpecifier:v6 animated:0];
      id v8 = ASDPurchase_ptr;
    }
    else
    {
      v58[0] = v6;
      v58[1] = v5;
      long long v16 = +[NSArray arrayWithObjects:v58 count:2];
      id v17 = +[NSMutableArray arrayWithArray:v16];

      long long v18 = [v6 identifier];
      long long v19 = [(COSSettingsListController *)self localizedPrefsStringForString:@"Available_Apps_Section_Title"];
      unsigned int v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        v57[0] = v5;
        v57[1] = v6;
        id v21 = +[NSArray arrayWithObjects:v57 count:2];
        uint64_t v22 = +[NSMutableArray arrayWithArray:v21];

        id v17 = (void *)v22;
        id v8 = ASDPurchase_ptr;
      }
      else
      {
        id v23 = [v5 identifier];
        id v24 = [(COSSettingsListController *)self localizedPrefsStringForString:@"Available_Apps_Section_Title"];
        unsigned int v25 = [v23 isEqualToString:v24];

        if (v25)
        {
          v56[0] = v6;
          v56[1] = v5;
          id v8 = ASDPurchase_ptr;
          id v26 = +[NSArray arrayWithObjects:v56 count:2];
          uint64_t v27 = +[NSMutableArray arrayWithArray:v26];

          id v17 = (void *)v27;
        }
        else
        {
          [v17 sortUsingSelector:"titleCompare:"];
          id v8 = ASDPurchase_ptr;
        }
      }
      id v4 = v50;
      unint64_t v7 = v51;
      id v28 = [v17 firstObject];
      unsigned int v29 = [v28 isEqual:v6];

      if (v29)
      {
        uint64_t v30 = [v5 identifier];
        id v31 = [(COSSettingsListController *)self indexOfSpecifierID:v30];

        [(COSSettingsListController *)self _insertSpecifierIntoTableAndStash:v6 atIndex:v31 stashIndex:v51 animated:1];
        long long v32 = pbb_bridge_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [v6 identifier];
          *(_DWORD *)buf = 138412546;
          v60 = v33;
          __int16 v61 = 2048;
          id v62 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "New app list has an additional specifier %@ to be inserted at index %lu", buf, 0x16u);
        }
        id v8 = ASDPurchase_ptr;
      }
      else
      {
        [(COSSettingsListController *)self _removeSpecifierFromTableAndStash:v5 animated:1];
        long long v32 = pbb_bridge_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v49;
          v60 = v5;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Old app list has an additional specifier, removing %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)_removeSpecifier:(id)a3 andInsertSpecifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  id v8 = a3;
  long long v9 = [v8 identifier];
  id v10 = [(COSSettingsListController *)self indexOfSpecifierID:v9];

  id v11 = [*(id *)((char *)&self->_sockPuppetAppMapping + 6) indexOfObject:v8];
  [(COSSettingsListController *)self _removeSpecifierFromTableAndStash:v8 animated:v5];

  [(COSSettingsListController *)self _insertSpecifierIntoTableAndStash:v12 atIndex:v10 stashIndex:v11 animated:v5];
}

- (void)_removeSpecifierFromTableAndStash:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [v7 identifier];
  [(COSSettingsListController *)self removeSpecifierID:v6 animated:v4];

  [*(id *)((char *)&self->_sockPuppetAppMapping + 6) removeObject:v7];
}

- (void)_insertSpecifierIntoTableAndStash:(id)a3 atIndex:(unint64_t)a4 stashIndex:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = *(NSMutableDictionary **)((char *)&self->_sockPuppetAppMapping + 6);
  id v11 = a3;
  [v10 insertObject:v11 atIndex:a5];
  [(COSSettingsListController *)self insertSpecifier:v11 atIndex:a4 animated:v6];
}

- (void)gatherAllWatchAppsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new();
  BOOL v6 = sub_10000DCF4();
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = +[ACXDeviceConnection sharedDeviceConnection];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000795DC;
  v12[3] = &unk_100245220;
  id v13 = v5;
  id v14 = v7;
  unsigned int v15 = self;
  id v16 = v4;
  id v9 = v4;
  id v10 = v7;
  id v11 = v5;
  [v8 enumerateInstalledApplicationsOnPairedDevice:v6 withBlock:v12];
}

- (void)groupLocallyAvailableAppsWithWatchOnlyApps:(id)a3 withStates:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10000DCF4();
  id v11 = +[ACXDeviceConnection sharedDeviceConnection];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100079880;
  v15[3] = &unk_100245248;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  [v11 enumerateLocallyAvailableApplicationsForPairedDevice:v10 options:1 withBlock:v15];
}

- (id)freezeDryAppStates:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = PSEnabledKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, [v10 cellType], 0);
        if ([v10 cellType])
        {
          id v12 = [v10 propertyForKey:@"COSSockPuppetInstallationState"];
          [v11 setProperty:v12 forKey:@"COSSockPuppetInstallationState"];
        }
        id v13 = [v10 identifier];
        [v11 setIdentifier:v13];

        id v14 = [v10 propertyForKey:v8];
        [v11 setProperty:v14 forKey:v8];

        [v4 addObject:v11];
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)appInstallErrorReceived:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"COSAppInstallErrorKey"];

  if (v5)
  {
    id v6 = [v5 domain];
    unsigned __int8 v7 = [v6 isEqualToString:@"ACXUserPresentableErrorDomain"];

    if (v7)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100079E68;
      v9[3] = &unk_100243908;
      id v10 = v5;
      id v11 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
      uint64_t v8 = v10;
    }
    else
    {
      uint64_t v8 = pbb_bridge_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AppConduit installation error is not presentable: %@", buf, 0xCu);
      }
    }
  }
}

- (void)reloadWatchKitApps:(id)a3
{
  id v4 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "reloading watch kit apps on notification: %@", (uint8_t *)&v7, 0xCu);
  }
  [(COSSettingsListController *)self _kickOffWatchKitAppReload];
}

- (id)_pptApps
{
  return 0;
}

- (id)sockPuppetApps
{
  [(COSSettingsListController *)self _kickOffWatchKitAppReload];
  id v3 = +[NSMutableArray array];
  id v4 = *(NSMutableDictionary **)((char *)&self->_sockPuppetAppMapping + 6);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(COSSettingsListController *)self wkAppSpinnerGroup];
  }
  id v6 = v5;
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (id)sockPuppetAppValue:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

- (id)localizedPrefsStringForString:(id)a3
{
  return sub_100010E5C(a3);
}

+ (id)unavailableWatchKitApps
{
  return 0;
}

- (void)addUnavailableAppsSectionIfNeeded
{
  if (-[COSSettingsListController watchKitOneAppsEOL](self, "watchKitOneAppsEOL") && [0 count])
  {
    id v3 = [(COSSettingsListController *)self specifierForID:@"UNAVAILABLE_APPS_GROUP_ID"];
    unsigned __int8 v4 = [(COSSettingsListController *)self containsSpecifier:v3];

    if ((v4 & 1) == 0)
    {
      id v5 = +[PSSpecifier groupSpecifierWithID:@"UNAVAILABLE_APPS_GROUP_ID"];
      id v6 = +[NSBundle mainBundle];
      int v7 = [v6 localizedStringForKey:@"UNAVAILABLE_APPS" value:&stru_100249230 table:@"Localizable"];
      uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      v11[0] = v5;
      v11[1] = v8;
      id v9 = +[NSArray arrayWithObjects:v11 count:2];
      id v10 = [(COSSettingsListController *)self specifiers];
      -[COSSettingsListController insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v9, [v10 count]);
    }
  }
}

- (void)facesViewControllerDidUpdateContent:(id)a3
{
  id v3 = *(void **)&self->super.super.BPSListController_opaque[OBJC_IVAR___PSListController__table];
  id v4 = +[NSIndexSet indexSetWithIndex:0];
  [v3 _reloadSectionHeaderFooters:v4 withRowAnimation:5];
}

- (void)reloadApplicationForGreenfieldInstall:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:NTKGreenfieldApplicationInstallBeganNotificationAppKey];

  int v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKey:NTKGreenfieldApplicationInstallBeganNotificationInstallStateKey];
  id v9 = [v8 integerValue];

  id v10 = [(COSSettingsListController *)self specifierForID:v6];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 propertyForKey:@"COSSockPuppetInstallationState"];
    id v13 = [v12 integerValue];

    if (v9 != v13)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007A574;
      block[3] = &unk_100245270;
      id v16 = self;
      id v17 = v9;
      id v15 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)deviceBecameInActive:(id)a3
{
  id v4 = [(COSSettingsListController *)self navigationController];
  id v5 = [v4 topViewController];

  if (v5 != self)
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446210;
      id v12 = "-[COSSettingsListController deviceBecameInActive:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Popping to root.", (uint8_t *)&v11, 0xCu);
    }

    int v7 = [(COSSettingsListController *)self navigationController];
    id v8 = [v7 popToRootViewControllerAnimated:1];

    id v9 = sub_100014784();
    id v10 = [v9 count];

    if (v10) {
      [(COSSettingsListController *)self _showDevicePicker:0];
    }
  }
}

- (void)deviceBecameActive:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    int v7 = "-[COSSettingsListController deviceBecameActive:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[BPSLinkCell _iconCache];
  [v5 removeAllObjects];

  [(COSSettingsListController *)self _refreshAppInstallationStatus];
  [(COSSettingsListController *)self _updateDeviceManagementInformation];
  [(COSListController *)self reloadSpecifiers];
  [(COSSettingsListController *)self notifyNTKAboutActiveWatch];
}

- (void)deviceBecamePaired:(id)a3
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[COSSettingsListController deviceBecamePaired:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deviceIsSetup:(id)a3
{
  int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    int v6 = "-[COSSettingsListController deviceIsSetup:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  [(COSSettingsListController *)self _notifyNTKAboutActiveWatchSkipSetupCompletionCheck:1];
}

- (void)compatibilityStateChanged:(id)a3
{
  int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    int v6 = "-[COSSettingsListController compatibilityStateChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  [(COSSettingsListController *)self notifyNTKAboutActiveWatch];
}

+ (id)installedWatchkitApps
{
  return (id)qword_10029B0A0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = +[PPDiscoveryManager sharedDiscoveryManager];
  [v3 end];
}

- (void)removeContiguousSpecifiersFromIndexing:(id)a3
{
  id v4 = a3;
  int v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[COSSettingsListController removeContiguousSpecifiersFromIndexing:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v6 = *(NSObject **)((char *)&self->_watchAppInstallStates + 6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007AE28;
  v8[3] = &unk_100245298;
  id v9 = v4;
  id v7 = v4;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(v6, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak((id *)buf);
}

- (void)insertContiguousSpecifiersForIndexing:(id)a3
{
  id v4 = a3;
  int v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[COSSettingsListController insertContiguousSpecifiersForIndexing:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v6 = *(NSObject **)((char *)&self->_watchAppInstallStates + 6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007B13C;
  v8[3] = &unk_100245298;
  id v9 = v4;
  id v7 = v4;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async(v6, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak((id *)buf);
}

- (void)searchResultsController:(id)a3 didSelectURL:(id)a4
{
  id v5 = a4;
  [UIApp processURL:v5 animated:1 fromSearch:1];
  int v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 absoluteString];
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[url absoluteString] -> %@", buf, 0xCu);
  }
  id v8 = [v5 absoluteString];
  unsigned int v9 = [v8 hasPrefix:@"bridge:root=(null)"];

  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007B4DC;
    block[3] = &unk_1002438A0;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (int64_t)searchResultsController:(id)a3 sortCategory1:(id)a4 sortCategory2:(id)a5
{
  id v7 = a5;
  id v8 = +[NSNumber numberWithInteger:[(COSSettingsListController *)self indexOfSpecifierID:a4]];
  id v9 = [(COSSettingsListController *)self indexOfSpecifierID:v7];

  id v10 = +[NSNumber numberWithInteger:v9];
  id v11 = [v8 compare:v10];

  return (int64_t)v11;
}

- (id)searchResultsController:(id)a3 iconForCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7
    || ([(COSSettingsListController *)self searchCategoriesWithoutIcons],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 containsObject:v7],
        v8,
        (v9 & 1) != 0))
  {
    id v10 = 0;
    goto LABEL_11;
  }
  id v11 = [(COSSettingsListController *)self specifierForID:v7];
  id v12 = [v11 propertyForKey:PSLazyIconAppID];
  id v10 = [v11 propertyForKey:PSIconImageKey];
  if (!v10)
  {
    id v13 = +[BPSLinkCell _iconCache];
    id v10 = [v13 objectForKey:v12];

    if (!v10)
    {
      id v14 = [v11 propertyForKey:@"squareIconName"];
      if (v14)
      {
        id v15 = +[UIImage imageNamed:v14];
        BPSCreateRoundedGizmoAppIconForSquareImage();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v12)
        {
          id v10 = 0;
          goto LABEL_9;
        }
        if ([v12 isEqualToString:@"VICTORY_ROW_ID"])
        {
          id v17 = +[NSBundle bundleForClass:objc_opt_class()];
          long long v18 = +[UIImage imageNamed:@"VictoryIcon" inBundle:v17];

          id v31 = BPSCreateRoundedGizmoAppIconForSquareImage();
        }
        else
        {
          id v31 = 0;
        }
        if (![v12 isEqualToString:@"VICTORY_TRAINING_CLUB_ROW_ID"])
        {
          uint64_t v35 = 0;
          long long v36 = &v35;
          uint64_t v37 = 0x3032000000;
          id v38 = sub_100015DAC;
          unsigned int v39 = sub_100015D54;
          id v40 = 0;
          dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
          uint64_t v30 = +[NanoResourceGrabber sharedInstance];
          long long v20 = +[UIScreen mainScreen];
          id v21 = [v20 traitCollection];
          [v21 displayScale];
          if (v22 <= 2.0) {
            uint64_t v23 = 47;
          }
          else {
            uint64_t v23 = 48;
          }
          id v24 = dispatch_get_global_queue(0, 0);
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10007BABC;
          v32[3] = &unk_1002452C0;
          long long v34 = &v35;
          dispatch_semaphore_t dsemaa = dsema;
          dispatch_semaphore_t v33 = dsemaa;
          [v30 getIconForBundleID:v12 iconVariant:v23 queue:v24 block:v32 timeout:0.1];

          dispatch_time_t v25 = dispatch_time(0, 100000000);
          if (dispatch_semaphore_wait(dsemaa, v25) >= 1)
          {
            id v26 = pbb_bridge_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v7;
              __int16 v43 = 2112;
              v44 = v12;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Timed out looking for category %@ search icon for %@, never looking again...", buf, 0x16u);
            }

            uint64_t v27 = [(COSSettingsListController *)self searchCategoriesWithoutIcons];
            [v27 addObject:v7];
          }
          id v10 = (id)v36[5];

          _Block_object_dispose(&v35, 8);
          goto LABEL_9;
        }
        long long v19 = +[NSBundle bundleForClass:objc_opt_class()];
        id v15 = +[UIImage imageNamed:@"NTCIcon" inBundle:v19];

        BPSCreateRoundedGizmoAppIconForSquareImage();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_9:
    }
  }

LABEL_11:

  return v10;
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  if (([(COSSettingsListController *)self isFirstResponder] & 1) == 0)
  {
    [(COSSettingsListController *)self becomeFirstResponder];
  }
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  id v4 = [(COSSettingsListController *)self spotlightResultsController];
  id v5 = [v4 tableView];
  id v6 = [v5 indexPathForSelectedRow];

  if (v6)
  {
    id v7 = [(COSSettingsListController *)self spotlightResultsController];
    [v7 showSelectedSearchResult];
  }
  return v6 == 0;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007BDE4;
  v21[3] = &unk_1002447C8;
  objc_copyWeak(&v22, &location);
  id v5 = objc_retainBlock(v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007BF00;
  v19[3] = &unk_1002452E8;
  objc_copyWeak(&v20, &location);
  id v6 = objc_retainBlock(v19);
  id v7 = *(NSObject **)((char *)&self->_watchAppInstallStates + 6);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10007BFE8;
  id v15 = &unk_100245310;
  id v8 = v4;
  id v16 = v8;
  unsigned __int8 v9 = v5;
  id v17 = v9;
  id v10 = v6;
  id v18 = v10;
  dispatch_async(v7, &v12);
  id v11 = [(COSSettingsListController *)self spotlightResultsController];
  [v11 searchQueryStarted];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 installPhase:(int64_t)a5
{
  if ((unint64_t)(a5 - 1) <= 1)
  {
    double v6 = a4 * 0.54;
    double v7 = a4 * 0.46 + 54.0;
    if (a5 == 1) {
      double v8 = v6;
    }
    else {
      double v8 = v7;
    }
    id v9 = a3;
    id v10 = +[NSNotificationCenter defaultCenter];
    v15[0] = v9;
    v14[0] = @"appid";
    v14[1] = @"progress";
    id v11 = +[NSNumber numberWithDouble:v8];
    v15[1] = v11;
    v14[2] = @"phase";
    id v12 = +[NSNumber numberWithInteger:a5];
    v15[2] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

    [v10 postNotificationName:@"COSInstallProgressNotificationName" object:v13];
  }
}

- (void)showDeviceSupervisionInfo
{
  id v3 = +[NSBundle mainBundle];
  if (MGGetBoolAnswer()) {
    CFStringRef v4 = @"DEVICE_SUPERVISION_INFO_WLAN";
  }
  else {
    CFStringRef v4 = @"DEVICE_SUPERVISION_INFO";
  }
  id v7 = [v3 localizedStringForKey:v4 value:&stru_100249230 table:@"DeviceSupervisionInfo-yorktown"];

  id v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"LEARN_MORE_ABOUT_SUPERVISION_SHEET_TITLE" value:&stru_100249230 table:@"Localizable-yorktown"];
  +[PSAboutHTMLSheetViewController presentAboutSheetTitled:v6 HTMLContent:v7 fromViewController:self];
}

- (BPSNTKFacesViewController)facesController
{
  return *(BPSNTKFacesViewController **)(&self->_isEnrolledAndSupervised + 6);
}

- (void)setFacesController:(id)a3
{
}

- (NSDictionary)inheritedWhiteList
{
  return *(NSDictionary **)((char *)&self->_facesController + 6);
}

- (void)setInheritedWhiteList:(id)a3
{
}

- (UIViewController)nothingSelectedController
{
  return *(UIViewController **)((char *)&self->_inheritedWhiteList + 6);
}

- (void)setNothingSelectedController:(id)a3
{
}

- (NSMutableDictionary)sockPuppetAppMapping
{
  return *(NSMutableDictionary **)((char *)&self->_nothingSelectedController + 6);
}

- (void)setSockPuppetAppMapping:(id)a3
{
}

- (NSMutableArray)stashedWatchKitApps
{
  return *(NSMutableArray **)((char *)&self->_sockPuppetAppMapping + 6);
}

- (void)setStashedWatchKitApps:(id)a3
{
}

- (BOOL)showAppSections
{
  return self->_showAppSections;
}

- (void)setShowAppSections:(BOOL)a3
{
  self->_showAppSections = a3;
}

- (NSMutableArray)stashedWatchKitAppsState
{
  return *(NSMutableArray **)((char *)&self->_stashedWatchKitApps + 6);
}

- (void)setStashedWatchKitAppsState:(id)a3
{
}

- (BOOL)shouldRefreshRowsOnForegroundEvent
{
  return self->_shouldRefreshRowsOnForegroundEvent;
}

- (void)setShouldRefreshRowsOnForegroundEvent:(BOOL)a3
{
  self->_shouldRefreshRowsOnForegroundEvent = a3;
}

- (BOOL)hasRowsPendingInstallation
{
  return self->_hasRowsPendingInstallation;
}

- (void)setHasRowsPendingInstallation:(BOOL)a3
{
  self->_hasRowsPendingInstallation = a3;
}

- (BOOL)receivedDiscoveryResult
{
  return self->_receivedDiscoveryResult;
}

- (void)setReceivedDiscoveryResult:(BOOL)a3
{
  self->_receivedDiscoveryResult = a3;
}

- (PSSpecifier)loadingSpecifier
{
  return *(PSSpecifier **)((char *)&self->_stashedWatchKitAppsState + 6);
}

- (void)setLoadingSpecifier:(id)a3
{
}

- (BOOL)navigateWhenReceivingCellularPlanResult
{
  return self->_navigateWhenReceivingCellularPlanResult;
}

- (void)setNavigateWhenReceivingCellularPlanResult:(BOOL)a3
{
  self->_navigateWhenReceivingCellularPlanResult = a3;
}

- (BPSNTKCustomization)customizationController
{
  return *(PSSpecifier **)((char *)&self->_loadingSpecifier + 6);
}

- (void)setCustomizationController:(id)a3
{
}

- (FLPreferencesController)fuPrefsController
{
  return *(BPSNTKCustomization **)((char *)&self->_customizationController + 6);
}

- (void)setFuPrefsController:(id)a3
{
}

- (COSSkippedMiniFlowController)skippedMiniFlowController
{
  return *(COSSkippedMiniFlowController **)((char *)&self->_fuPrefsController + 6);
}

- (void)setSkippedMiniFlowController:(id)a3
{
}

- (CSSearchQuery)searchQuery
{
  return *(CSSearchQuery **)((char *)&self->_spotlightResultsController + 6);
}

- (void)setSearchQuery:(id)a3
{
}

- (NSMutableSet)searchCategoriesWithoutIcons
{
  return *(NSMutableSet **)((char *)&self->_searchQuery + 6);
}

- (NSMutableDictionary)watchAppInstallStates
{
  return *(NSMutableDictionary **)((char *)&self->_searchCategoriesWithoutIcons + 6);
}

- (void)setWatchAppInstallStates:(id)a3
{
}

- (BOOL)isBreatheAppInstalled
{
  return self->_isBreatheAppInstalled;
}

- (void)setIsBreatheAppInstalled:(BOOL)a3
{
  self->_isBreatheAppInstalled = a3;
}

- (BOOL)isReloadingWatchkitApps
{
  return self->_isReloadingWatchkitApps;
}

- (void)setIsReloadingWatchkitApps:(BOOL)a3
{
  self->_isReloadingWatchkitApps = a3;
}

- (BOOL)wantsAnotherWatchkitAppsReload
{
  return self->_wantsAnotherWatchkitAppsReload;
}

- (void)setWantsAnotherWatchkitAppsReload:(BOOL)a3
{
  self->_wantsAnotherWatchkitAppsReload = a3;
}

- (OS_dispatch_queue)spotlightWorkQueue
{
  return *(OS_dispatch_queue **)((char *)&self->_watchAppInstallStates + 6);
}

- (void)setSpotlightWorkQueue:(id)a3
{
}

- (void)setIsEnrolledAndSupervised:(BOOL)a3
{
  self->_isEnrolledAndSupervised = a3;
}

- (NSString)enrolledOrganizationName
{
  return *(NSString **)((char *)&self->_spotlightWorkQueue + 6);
}

- (void)setEnrolledOrganizationName:(id)a3
{
}

- (COSTinkerAppStoreAuthHelper)storeAuthHelper
{
  return *(COSTinkerAppStoreAuthHelper **)((char *)&self->_enrolledOrganizationName + 6);
}

- (void)setStoreAuthHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_enrolledOrganizationName + 6), 0);
  objc_storeStrong((id *)((char *)&self->_spotlightWorkQueue + 6), 0);
  objc_storeStrong((id *)((char *)&self->_watchAppInstallStates + 6), 0);
  objc_storeStrong((id *)((char *)&self->_searchCategoriesWithoutIcons + 6), 0);
  objc_storeStrong((id *)((char *)&self->_searchQuery + 6), 0);
  objc_storeStrong((id *)((char *)&self->_spotlightResultsController + 6), 0);
  objc_storeStrong((id *)((char *)&self->_spotlightSearchController + 6), 0);
  objc_storeStrong((id *)((char *)&self->_skippedMiniFlowController + 6), 0);
  objc_storeStrong((id *)((char *)&self->_fuPrefsController + 6), 0);
  objc_storeStrong((id *)((char *)&self->_customizationController + 6), 0);
  objc_storeStrong((id *)((char *)&self->_loadingSpecifier + 6), 0);
  objc_storeStrong((id *)((char *)&self->_stashedWatchKitAppsState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_stashedWatchKitApps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_sockPuppetAppMapping + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nothingSelectedController + 6), 0);
  objc_storeStrong((id *)((char *)&self->_inheritedWhiteList + 6), 0);
  objc_storeStrong((id *)((char *)&self->_facesController + 6), 0);

  objc_storeStrong((id *)(&self->_isEnrolledAndSupervised + 6), 0);
}

@end