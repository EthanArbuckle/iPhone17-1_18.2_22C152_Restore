@interface Application
+ (BOOL)prepareTestControllerWithType:(id)a3 suiteURL:(id)a4 bundleNames:(id)a5 outputURL:(id)a6;
+ (CKContextClient)contextClient;
+ (id)browserControllerUIDelegateProvider;
+ (id)sharedApplication;
+ (id)sharedTestRunner;
+ (unint64_t)systemMemorySize;
+ (void)commandLineTestOption:(int)a3 arg:(const char *)a4;
+ (void)initialize;
+ (void)postTestNotificationName:(id)a3 object:(id)a4;
+ (void)postTestNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5;
+ (void)setBrowserControllerUIDelegateProvider:(id)a3;
- (AutomationController)automationController;
- (BOOL)_hasLockablePrivateTabsOpenInAnyWindow;
- (BOOL)_hasPrivateBrowserControllerActiveInAnyWindow;
- (BOOL)_mediaIsPlayingInPrivateBrowsing;
- (BOOL)_resetHistoryWithCompressedDatabaseAtURL:(id)a3 error:(id *)a4;
- (BOOL)_shouldLockPrivateBrowsing;
- (BOOL)_startResizeTestWithName:(id)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)canAddNewTabForPrivateBrowsing:(BOOL)a3;
- (BOOL)didStartBookmarksTest;
- (BOOL)focusProfileUpdateIsForInactiveFocusMode;
- (BOOL)hasPointerDevice;
- (BOOL)isCloudHistoryEnabled;
- (BOOL)isNoteTakingControllerSupportedInPrivateBrowsing:(id)a3;
- (BOOL)isPrivateBrowsingLocked;
- (BOOL)isRunningCanvasTest;
- (BOOL)isRunningPPT;
- (BOOL)isRunningShowBookmarksTest;
- (BOOL)needsFocusProfileUpdate;
- (BOOL)needsFocusedTabGroupUpdate;
- (BOOL)overrideBrowserStateForTestNamed:(id)a3 browserController:(id)a4;
- (BOOL)prefersSingleWindow;
- (BOOL)prepareBookmarksTest;
- (BOOL)privateBrowsingRequiresAuthentication;
- (BOOL)runMemoryOrIOTestWithType:(unint64_t)a3;
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)sfWebExtensionsController:(id)a3 canSendMessageFromWebView:(id)a4;
- (BOOL)shouldRestoreStateForPPT;
- (BOOL)startCanvasTest:(id)a3;
- (BOOL)startHistoryLoadTest;
- (BOOL)startHistoryTest;
- (BOOL)startSidebarTest;
- (BOOL)startTabBarTest;
- (BOOL)usesDefaultBrowsingModeInAllWindows;
- (BOOL)usesLoweredSearchBar;
- (BOOL)usesPrivateBrowsingModeInAnyWindow;
- (BrowserController)primaryBrowserController;
- (BrowserWindowController)browserWindowController;
- (ForYouRecommendationMediator)existingForYouRecommendationMediator;
- (HighlightManager)highlightManager;
- (HistoryController)historyController;
- (NSArray)allProcessPools;
- (NSArray)allTabEntities;
- (NSArray)allWindowEntities;
- (NSArray)browserControllers;
- (NSArray)cachedUserContentControllersForAllProfiles;
- (NSSet)historiesForProfiles;
- (NSString)focusProfileIdentifier;
- (NSString)focusedTabGroupUUIDString;
- (NSString)lastActiveProfileIdentifier;
- (ReadingListLeadImageCache)readingListLeadImageCache;
- (SFWebExtensionsController)defaultWebExtensionsController;
- (SafariSettingsSyncEngine)settingsSyncEngine;
- (SystemNoteTakingController)systemNoteTakingController;
- (UIScene)currentScene;
- (WBProfile)focusProfile;
- (WBSAllowedLegacyTLSHostManager)legacyTLSHostManager;
- (WBSBackgroundImageAssetController)backgroundImageAssetController;
- (WBSForYouRecentParsecResultsManager)forYouRecentParsecResultsManager;
- (WBSPrivateBrowsingUserDefinedContentBlockerManager)userDefinedContentBlockerManagerForPrivateBrowsing;
- (WBSSafariScribbleFeedbackSyncEngine)scribbleFeedbackSyncEngine;
- (WBSScribbleQuirksManager)scribbleQuirksManager;
- (WBSUnifiedBarAnalyticsProviding)unifiedBarAnalyticsProvider;
- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager;
- (WBTabGroupManager)ephemeralTabGroupManager;
- (WBTabGroupManager)tabGroupManager;
- (WKProcessPool)defaultProcessPool;
- (WebBookmarkCollection)bookmarkCollection;
- (id)_allTabsWithExtensionContentLoadedForBrowserController:(id)a3 extensionHost:(id)a4 composedIdentifier:(id)a5;
- (id)_browserControllerForApplicationTesting;
- (id)_browserControllerForTabWithUUID:(id)a3;
- (id)_createBookmarkWithTitle:(id)a3 url:(id)a4 parentBookmark:(id)a5;
- (id)_extendLaunchTest;
- (id)_generateMemoryFootprintResults:(id)a3;
- (id)_numberOption:(id)a3;
- (id)_recentsStoreForDefaultProfile;
- (id)_scrollViewForTestNamed:(id)a3;
- (id)_sortedBrowserControllers;
- (id)_syntheticHTMLString;
- (id)_tabCompletionProvider;
- (id)_userContentControllerForProfileServerID:(id)a3;
- (id)allContentBlockerManagers;
- (id)allWebExtensionsControllers;
- (id)contentBlockerManagerForProfileServerID:(id)a3;
- (id)createBookmarkWithTitle:(id)a3 url:(id)a4;
- (id)createNewTab;
- (id)createNewTabGroupWithTitle:(id)a3;
- (id)createNewTabWithURL:(id)a3 isPrivate:(BOOL)a4;
- (id)createNewWindowWithRequestIdentifier:(id)a3 isPrivate:(BOOL)a4;
- (id)createRecommendationMediatorOrReuseExistingOneIfPossible;
- (id)processPoolForProfileIdentifier:(id)a3;
- (id)recentsStoreForProfileWithIdentifier:(id)a3;
- (id)savedAccountContextForWebPageID:(unint64_t)a3;
- (id)sceneForTabGroupWithUUIDString:(id)a3;
- (id)searchParametersWithCFEnabled:(BOOL)a3;
- (id)sectionManagerForProfileWithIdentifier:(id)a3;
- (id)selectedTabInfoForBrowserTabCompletionProvider:(id)a3;
- (id)sfWebExtensionsController:(id)a3 duplicateTab:(id)a4;
- (id)sfWebExtensionsController:(id)a3 forProfileServerID:(id)a4;
- (id)sfWebExtensionsController:(id)a3 navigationIntentUUIDForWindow:(id)a4;
- (id)sfWebExtensionsController:(id)a3 reusableTabWithID:(double)a4;
- (id)sfWebExtensionsController:(id)a3 tabForWebView:(id)a4;
- (id)sfWebExtensionsController:(id)a3 tabWithID:(double)a4;
- (id)sfWebExtensionsController:(id)a3 windowForWebView:(id)a4 extension:(id)a5;
- (id)sfWebExtensionsController:(id)a3 windowWithID:(double)a4;
- (id)sfWebExtensionsControllerAllWindows:(id)a3;
- (id)sfWebExtensionsControllerContentBlockerManager:(id)a3 forProfileServerID:(id)a4;
- (id)sfWebExtensionsControllerDomainForDefaultSearchProvider:(id)a3;
- (id)sfWebExtensionsControllerLastFocusedWindow:(id)a3;
- (id)suggestionsManagerForProfileIdentifier:(id)a3;
- (id)tabCollectionConfiguration;
- (id)tabEntityWithUUID:(id)a3;
- (id)tabInfosForBrowserTabCompletionProvider:(id)a3;
- (id)webExtensionsControllerForProfileServerID:(id)a3;
- (id)webExtensionsControllerForTabWithPrivateBrowsingEnabled:(BOOL)a3 profile:(id)a4;
- (id)windowEntityWithIdentifier:(id)a3;
- (int64_t)currentKeyboardModifierFlags;
- (uint64_t)_showSearchEngineAlertIfNeeded;
- (unint64_t)_numberOfTabsForPrivateBrowsing:(BOOL)a3;
- (unint64_t)maximumTabCount;
- (unint64_t)maximumTabCountAllowingMoreTabs:(BOOL)a3;
- (void)_addDefaultsObserver;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_clearInvalidCertificateBypassesOlderThanOneWeek;
- (void)_connectToCyclerIfNecessary;
- (void)_createExtensionControllersIfNeededForProfileServerID:(id)a3;
- (void)_deleteExtensionControllersForProfileServerID:(id)a3;
- (void)_determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler:(id)a3;
- (void)_didEnableCustomizationSync;
- (void)_doSearchTestOnCVC:(id)a3 WithTestStrings:(id)a4 andDispatchGroup:(id)a5;
- (void)_downloadDidStartNotification:(id)a3;
- (void)_downloadDidStopNotification:(id)a3;
- (void)_export30DaysWorthOfHistoryAfterUpgrade;
- (void)_frequentlyVisitedSitesWereChanged:(id)a3;
- (void)_getBookmarksDataClassEnabledWithCompletionHandler:(id)a3;
- (void)_handleHIDEvent:(__IOHIDEvent *)a3;
- (void)_historyHostnamesWereRemoved:(id)a3;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)_historyWasCleared:(id)a3;
- (void)_initializeProcessPoolForProfileIdentifier:(id)a3;
- (void)_loadAlternateHTMLString:(id)a3 completionHandler:(id)a4;
- (void)_loadExtensionsInProfile:(id)a3;
- (void)_loadLargeForm:(id)a3;
- (void)_loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4 completion:(id)a5;
- (void)_managedProfileConfigurationDidUpdate;
- (void)_observeNotificationOnce:(id)a3 handler:(id)a4;
- (void)_performBookmarksDatabaseTasksInBackground;
- (void)_pollCanvasTest:(id)a3;
- (void)_populateInMemoryBookmarksDBForTestNamed:(id)a3;
- (void)_preparePageLoadTestControllerParameters;
- (void)_prepareTabViewBringUpTest;
- (void)_prepareTabViewCloseTest;
- (void)_prepareTabViewOpenTest;
- (void)_prepareTabViewRotationTest;
- (void)_prepareTabViewScrollTest;
- (void)_prepareTabViewSelectTest;
- (void)_prewarmAutomationControllerIfEnabled;
- (void)_profileFocusConfigurationChanged;
- (void)_pruneExpiredScenes;
- (void)_readDefaults;
- (void)_readFocusConfigurationKeys;
- (void)_reloadSearchEngines;
- (void)_reportBookmarksDatabaseHealth;
- (void)_reportLaunchAnalyticsSoon;
- (void)_resetCloudHistoryAccountIfNeeded;
- (void)_runFormTypingTextWithSetupScript:(id)a3;
- (void)_runSidebarTest;
- (void)_runTabBarSwitchTabTest;
- (void)_runTabOverviewOpenNewTabTest;
- (void)_runTabOverviewPresentingAndDismissalTest;
- (void)_runTabOverviewScrollPerfTest;
- (void)_saveFrequentlyVisitedListsToDatabaseIfNeeded;
- (void)_scrollContentWithTestName:(id)a3 scrollingBounds:(CGRect)a4 amplitude:(double)a5 completionHandler:(id)a6;
- (void)_setUpSuggestionManagersIfNeeded;
- (void)_setWKWebsiteDataStoreDelegate;
- (void)_showExtensionPermissionBannerIfNecessary;
- (void)_showSearchEngineAlertIfNeeded;
- (void)_suspendOrResumeWallpaperAnimationIfNeeded;
- (void)_switchToBookmarksCollectionForTestNamed:(id)a3;
- (void)_tabGroupFocusConfigurationChanged;
- (void)_typeTextInForm:(id)a3 completionHandler:(id)a4;
- (void)_updateCloudFeatureAvailability;
- (void)_updateKeyboardCorrectionLearningAllowed;
- (void)_updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory;
- (void)_webBookmarksDidReload;
- (void)applicationWillSuspend;
- (void)applicationWillTerminate;
- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)checkExtendedLaunchPageLoad:(id)a3 forTabDocument:(id)a4;
- (void)clearCachedTabCompletionData;
- (void)closeWindowsWithIdentifiers:(id)a3;
- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4;
- (void)deleteBookmarksWithUUIDs:(id)a3;
- (void)deleteTabGroupsWithUUIDs:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)dispatchNavigationIntent:(id)a3;
- (void)downloadDidFail:(id)a3;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidReceiveResponse:(id)a3;
- (void)downloadDidStart:(id)a3;
- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4;
- (void)enumerateContentBlockerManagersUsingBlock:(id)a3;
- (void)extensionsController:(id)a3 closeOpenExtensionTabsInPrivateBrowsingWithBaseURI:(id)a4 composedIdentifier:(id)a5;
- (void)extensionsController:(id)a3 closeOpenExtensionTabsWithBaseURI:(id)a4 composedIdentifier:(id)a5;
- (void)failedPurpleTestWithError:(id)a3;
- (void)finishedBookmarksTest;
- (void)finishedCanvasTestWithURL:(id)a3 forTabDocument:(id)a4;
- (void)finishedPurpleTest:(id)a3;
- (void)focusProfile;
- (void)handleKeyUIEvent:(id)a3;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)loadBlankPageforKeyboardTests;
- (void)loadExtensionsInProfileIfNecessary:(id)a3;
- (void)loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4;
- (void)loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4 completion:(id)a5;
- (void)lockPrivateBrowsing;
- (void)mousePointerDevicesDidConnect:(id)a3;
- (void)mousePointerDevicesDidDisconnect:(id)a3;
- (void)moveTabsWithUUIDs:(id)a3 toTabGroupWithUUID:(id)a4;
- (void)moveTabsWithUUIDs:(id)a3 toWindowWithIdentifier:(id)a4;
- (void)navigateTabWithUUID:(id)a3 toURL:(id)a4;
- (void)noteTakingController:(id)a3 addHighlightForUserActivity:(id)a4 completion:(id)a5;
- (void)notifyAddedLinkPreviewMetadata:(id)a3 toUserActivity:(id)a4 webView:(id)a5;
- (void)notifyExtensionControllersThatSettingsWereUpdatedExternallyFromSettingsApp;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pageLoadTestRunnerFinished:(id)a3;
- (void)pdfDataForTabWithUUID:(id)a3 completionHandler:(id)a4;
- (void)prepareTabViewBringUpTest;
- (void)prepareTabViewCloseTest;
- (void)prepareTabViewOpenTest;
- (void)prepareTabViewRotationTest;
- (void)prepareTabViewScrollTest;
- (void)prepareTabViewSelectTest;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)prewarmAndRemoveOrphanedProfileDataStores;
- (void)reloadContentBlockers;
- (void)reloadReadingListWidgetIfNeeded;
- (void)runBookmarksViewTest;
- (void)runGeneratePasswordTest;
- (void)runLargeFormFocusTest;
- (void)runLargeFormTypingTest;
- (void)runTabOverviewTest;
- (void)runTabSnapshotCacheStressTest;
- (void)saveChangesToCloudHistoryStore;
- (void)sceneForTabWithUUID:(id)a3 completionHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)setExistingForYouRecommendationMediator:(id)a3;
- (void)setFocusProfileIdentifier:(id)a3;
- (void)setFocusProfileUpdateIsForInactiveFocusMode:(BOOL)a3;
- (void)setNeedsFocusProfileUpdate:(BOOL)a3;
- (void)setNeedsFocusedTabGroupUpdate:(BOOL)a3;
- (void)setObject:(id)a3 forInjectedBundleParameter:(id)a4;
- (void)setPrivateBrowsingRequiresAuthentication:(BOOL)a3;
- (void)setReadingListWidgetNeedsReload;
- (void)sfWebExtensionsController:(id)a3 captureVisibleTab:(id)a4 format:(id)a5 quality:(double)a6 completionHandler:(id)a7;
- (void)sfWebExtensionsController:(id)a3 createNewTabInWindow:(id)a4 tabIndex:(id)a5 url:(id)a6 makeActive:(BOOL)a7 completionHandler:(id)a8;
- (void)sfWebExtensionsController:(id)a3 relateParentTab:(id)a4 toTab:(id)a5;
- (void)sfWebExtensionsController:(id)a3 showPopupOrPerSitePermissionsForExtension:(id)a4 inWindow:(id)a5 completionHandler:(id)a6;
- (void)sfWebExtensionsControllerContentBlockerListDidChange:(id)a3;
- (void)sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:(id)a3;
- (void)showWindowWithIdentifier:(id)a3;
- (void)startBookmarksTest;
- (void)startCommandLineTest;
- (void)startKeyboardBringupTest;
- (void)startKeyboardRotationTest;
- (void)startKeyboardSplitAndMergeTest;
- (void)startSearchPerformanceDetailedTestWithCF:(BOOL)a3;
- (void)startSearchPerformanceTest;
- (void)startSearchPerformanceTestWithTestStrings:(id)a3;
- (void)startSearchPerformanceTestWithTestStrings:(id)a3 perQuery:(BOOL)a4 withCF:(BOOL)a5;
- (void)startSearchPerformanceUnifiedFieldKeyTimeTest;
- (void)startTabViewBringUpTest;
- (void)startTabViewCloseTest;
- (void)startTabViewOpenTest;
- (void)startTabViewRotationTest;
- (void)startTabViewScrollTest;
- (void)startTabViewSelectTest;
- (void)startedPurpleTest;
- (void)tabEntitiesMatchingQuery:(id)a3 completionHandler:(id)a4;
- (void)tabGroupManager:(id)a3 didInsertProfileWithIdentifier:(id)a4;
- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4;
- (void)tabSnapshotCacheStressTestRunnerDidFinish:(id)a3;
- (void)unlockPrivateBrowsing;
- (void)updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing;
- (void)updateLockedPrivateBrowsingState;
- (void)updateShouldLockPrivateBrowsingWithTimerIfNecessary;
- (void)updateTabCount;
- (void)userDefaultsDidChange:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)webClipCacheDidChange:(id)a3;
- (void)websiteDataStore:(id)a3 domain:(id)a4 didOpenDomainViaWindowOpen:(id)a5 withProperty:(int64_t)a6 directly:(BOOL)a7;
- (void)websiteDataStore:(id)a3 openWindow:(id)a4 fromServiceWorkerOrigin:(id)a5 completionHandler:(id)a6;
@end

@implementation Application

+ (id)sharedApplication
{
  return (id)*MEMORY[0x1E4FB2608];
}

- (WBTabGroupManager)tabGroupManager
{
  tabGroupManager = self->_tabGroupManager;
  if (!tabGroupManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB60A8]);
    v5 = [(Application *)self tabCollectionConfiguration];
    v6 = (void *)[v4 initWithConfiguration:v5 openDatabase:1];

    v7 = (WBTabGroupManager *)[objc_alloc(MEMORY[0x1E4FB60C0]) initWithCollection:v6];
    v8 = self->_tabGroupManager;
    self->_tabGroupManager = v7;

    v9 = self->_tabGroupManager;
    v10 = [MEMORY[0x1E4FB60C8] sharedProxy];
    [(WBTabGroupManager *)v9 addTabGroupObserver:v10];

    [(WBTabGroupManager *)self->_tabGroupManager addTabGroupObserver:self];
    v11 = [MEMORY[0x1E4FB60C8] sharedProxy];
    [(WBTabGroupManager *)self->_tabGroupManager setSyncAgentProxy:v11];

    tabGroupManager = self->_tabGroupManager;
  }
  return tabGroupManager;
}

- (id)webExtensionsControllerForTabWithPrivateBrowsingEnabled:(BOOL)a3 profile:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = v6;
  if (v4 || !v6)
  {
    v9 = [(Application *)self webExtensionsControllerForProfileServerID:*MEMORY[0x1E4F980C8]];
  }
  else
  {
    v8 = [v6 identifierForExtensions];
    v9 = [(Application *)self webExtensionsControllerForProfileServerID:v8];
  }
  return v9;
}

- (id)webExtensionsControllerForProfileServerID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_profileServerIDToWebExtensionsControllers objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      [(Application *)self _createExtensionControllersIfNeededForProfileServerID:v4];
      id v7 = [(NSMutableDictionary *)self->_profileServerIDToWebExtensionsControllers objectForKeyedSubscript:v4];
    }
    v9 = v7;
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXProfiles();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[Application webExtensionsControllerForProfileServerID:]();
    }
    v9 = 0;
  }

  return v9;
}

- (void)startCommandLineTest
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (gTestOptions && [(id)gTestOptions count])
  {
    v3 = (void *)gTestOptions;
    gTestOptions = 0;
    id v4 = v3;

    uint64_t v5 = [v4 objectForKey:@"testName"];
    if (v5) {
      id v6 = (__CFString *)v5;
    }
    else {
      id v6 = @"PLT";
    }
    [(Application *)self runTest:v6 options:v4];
  }
  if (gTestController)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(id)gTestController setDelegate:gTestController];
    }
    id v7 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      int v9 = 138543362;
      uint64_t v10 = objc_opt_class();
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Running %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(id)gTestController runTestsAndStoreResultsIn:gTestResults completionHandler:&__block_literal_global_2];
  }
}

- (BrowserWindowController)browserWindowController
{
  return self->_browserWindowController;
}

- (void)updateTabCount
{
}

- (void)clearCachedTabCompletionData
{
}

- (BrowserController)primaryBrowserController
{
  v2 = [(Application *)self browserControllers];
  v3 = [v2 firstObject];

  return (BrowserController *)v3;
}

- (NSArray)browserControllers
{
  return [(BrowserWindowController *)self->_browserWindowController browserControllers];
}

void __29__Application_updateTabCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 tabController];
  [v2 updateTabCount];
}

- (BOOL)hasPointerDevice
{
  if (!SFDeviceSupportsPointerInteractions()) {
    return 0;
  }
  if ([MEMORY[0x1E4F38E00] isHoverActive]) {
    return 1;
  }
  os_unfair_lock_lock(&self->_pointerDeviceLock);
  id v4 = self->_pointerDevices;
  os_unfair_lock_unlock(&self->_pointerDeviceLock);
  BOOL v3 = [(NSMutableSet *)v4 count] != 0;

  return v3;
}

- (BOOL)isPrivateBrowsingLocked
{
  return self->_privateBrowsingLocked;
}

- (id)_extendLaunchTest
{
  if (gExtendedLaunchPageLoad == 1) {
    return @"pageLoad";
  }
  else {
    return 0;
  }
}

- (void)updateLockedPrivateBrowsingState
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Private Browsing unlocked", v2, v3, v4, v5, v6);
}

- (BOOL)_shouldLockPrivateBrowsing
{
  int v3 = [MEMORY[0x1E4F97EA0] isLockedPrivateBrowsingEnabled];
  if (v3)
  {
    int v3 = [(Application *)self privateBrowsingRequiresAuthentication];
    if (v3)
    {
      int v3 = [(Application *)self _hasLockablePrivateTabsOpenInAnyWindow];
      if (v3) {
        LOBYTE(v3) = self->_shouldPrivateBrowsingBeLockedIfPossible;
      }
    }
  }
  return v3;
}

- (BOOL)privateBrowsingRequiresAuthentication
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v3 = [v2 objectForKey:*MEMORY[0x1E4F99340]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v3 BOOLValue]) {
    char v4 = 0;
  }
  else {
    char v4 = [v2 BOOLForKey:*MEMORY[0x1E4F993B8]];
  }

  return v4;
}

uint64_t __34__Application__pruneExpiredScenes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 persistentIdentifier];
}

- (void)userDefaultsDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)Application;
  [(Application *)&v4 userDefaultsDidChange:a3];
  if (self->_finishedLaunching)
  {
    if ([(Application *)self isSuspended]) {
      self->_shouldReadDefaultsOnResume = 1;
    }
    else {
      [(Application *)self _readDefaults];
    }
  }
}

- (void)_readDefaults
{
  if (!self->_isReadingDefaults)
  {
    self->_isReadingDefaults = 1;
    [(BrowserWindowController *)self->_browserWindowController updateCloudTabUpdatesEnabled];
    self->_isReadingDefaults = 0;
  }
}

BrowserControllerDefaultUIDelegate *__50__Application_browserControllerUIDelegateProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [[BrowserControllerDefaultUIDelegate alloc] initWithBrowserController:v2];

  return v3;
}

- (SystemNoteTakingController)systemNoteTakingController
{
  systemNoteTakingController = self->_systemNoteTakingController;
  if (!systemNoteTakingController)
  {
    objc_super v4 = objc_alloc_init(SystemNoteTakingController);
    uint64_t v5 = self->_systemNoteTakingController;
    self->_systemNoteTakingController = v4;

    [(WBSSystemNoteTakingController *)self->_systemNoteTakingController setDelegate:self];
    systemNoteTakingController = self->_systemNoteTakingController;
  }
  return systemNoteTakingController;
}

- (WBSPrivateBrowsingUserDefinedContentBlockerManager)userDefinedContentBlockerManagerForPrivateBrowsing
{
  userDefinedContentBlockerManagerForPrivateBrowsing = self->_userDefinedContentBlockerManagerForPrivateBrowsing;
  if (!userDefinedContentBlockerManagerForPrivateBrowsing)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98D18]);
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F98F90]) initWithDatabaseURL:0];
    uint8_t v6 = (WBSPrivateBrowsingUserDefinedContentBlockerManager *)[v4 initWithDataStore:v5];
    id v7 = self->_userDefinedContentBlockerManagerForPrivateBrowsing;
    self->_userDefinedContentBlockerManagerForPrivateBrowsing = v6;

    v8 = [(Application *)self userDefinedContentBlockerManager];
    [(WBSPrivateBrowsingUserDefinedContentBlockerManager *)self->_userDefinedContentBlockerManagerForPrivateBrowsing setNormalBrowsingUserDefinedContentBlockerManager:v8];

    userDefinedContentBlockerManagerForPrivateBrowsing = self->_userDefinedContentBlockerManagerForPrivateBrowsing;
  }
  return userDefinedContentBlockerManagerForPrivateBrowsing;
}

- (WBSUserDefinedContentBlockerManager)userDefinedContentBlockerManager
{
  userDefinedContentBlockerManager = self->_userDefinedContentBlockerManager;
  if (!userDefinedContentBlockerManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98F88]);
    uint64_t v5 = [MEMORY[0x1E4F98F90] sharedStore];
    uint8_t v6 = (WBSUserDefinedContentBlockerManager *)[v4 initWithDataStore:v5];
    id v7 = self->_userDefinedContentBlockerManager;
    self->_userDefinedContentBlockerManager = v6;

    userDefinedContentBlockerManager = self->_userDefinedContentBlockerManager;
  }
  return userDefinedContentBlockerManager;
}

- (void)_setUpSuggestionManagersIfNeeded
{
  if (!self->_profileIdentifiersToSuggestionsManagers)
  {
    int v3 = [MEMORY[0x1E4F1CA60] dictionary];
    profileIdentifiersToSuggestionsManagers = self->_profileIdentifiersToSuggestionsManagers;
    self->_profileIdentifiersToSuggestionsManagers = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F98EC8]);
    id v8 = [(Application *)self highlightManager];
    uint8_t v6 = (WBSStartPageSuggestionsProviderBroadcaster *)[v5 initWithSuggestionsProvider:v8];
    highlightManagerSuggestionsProviderBroadcaster = self->_highlightManagerSuggestionsProviderBroadcaster;
    self->_highlightManagerSuggestionsProviderBroadcaster = v6;
  }
}

- (HighlightManager)highlightManager
{
  highlightManager = self->_highlightManager;
  if (!highlightManager)
  {
    id v4 = objc_alloc_init(HighlightManager);
    id v5 = self->_highlightManager;
    self->_highlightManager = v4;

    highlightManager = self->_highlightManager;
  }
  return highlightManager;
}

- (id)suggestionsManagerForProfileIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_profileIdentifiersToSuggestionsManagers objectForKeyedSubscript:v4];
    if (!v5)
    {
      [(Application *)self _setUpSuggestionManagersIfNeeded];
      id v6 = objc_alloc(MEMORY[0x1E4F98EC0]);
      id v7 = [(Application *)self sectionManagerForProfileWithIdentifier:v4];
      id v5 = (void *)[v6 initWithSectionManager:v7];

      [(NSMutableDictionary *)self->_profileIdentifiersToSuggestionsManagers setObject:v5 forKeyedSubscript:v4];
      id v8 = [(Application *)self historyController];
      int v9 = [v8 frequentlyVisitedSitesControllerForProfileIdentifier:v4 loadIfNeeded:1];
      [v5 registerProvider:v9];

      uint64_t v10 = [(WBSStartPageSuggestionsProviderBroadcaster *)self->_highlightManagerSuggestionsProviderBroadcaster createSuggestionProviderProxy];
      [v5 registerProvider:v10];
    }
    id v11 = v5;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (HistoryController)historyController
{
  historyController = self->_historyController;
  if (!historyController)
  {
    id v4 = objc_alloc_init(HistoryController);
    id v5 = self->_historyController;
    self->_historyController = v4;

    historyController = self->_historyController;
  }
  return historyController;
}

- (id)sectionManagerForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F980C8]];
  id v6 = objc_alloc(MEMORY[0x1E4F98EB0]);
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v8 = (void *)[v6 initWithStorage:v7];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F98D38]);
    id v7 = [(Application *)self tabGroupManager];
    uint64_t v10 = (void *)[v9 initWithProfileIdentifier:v4 tabGroupManager:v7];
    id v8 = (void *)[v6 initWithStorage:v10];
  }
  return v8;
}

- (id)recentsStoreForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    char v5 = [(Application *)self _recentsStoreForDefaultProfile];
  }
  else
  {
    id v6 = +[Application sharedApplication];
    id v7 = [v6 tabGroupManager];

    id v8 = [v7 profileWithIdentifier:v4];
    id v9 = [v8 recentsStore];

    if (!v9)
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F98D88]) initWithCloudTabDeviceProvider:v7];
      [v10 setActiveProfileIdentifier:v4];
      id v11 = objc_alloc(MEMORY[0x1E4F98DA0]);
      v12 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
      v13 = (void *)[v11 initWithSiteMetadataManager:v12];

      [v13 registerProvider:v10];
      [v8 setRecentsStore:v13];
    }
    char v5 = [v8 recentsStore];
  }
  return v5;
}

- (id)_recentsStoreForDefaultProfile
{
  if (_recentsStoreForDefaultProfile_onceToken != -1) {
    dispatch_once(&_recentsStoreForDefaultProfile_onceToken, &__block_literal_global_411);
  }
  id v2 = (void *)_recentsStoreForDefaultProfile_store;
  return v2;
}

void __45__Application__recentsStoreForDefaultProfile__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F98D88]);
  uint64_t v1 = +[CloudTabStore sharedCloudTabStore];
  id v6 = (id)[v0 initWithCloudTabDeviceProvider:v1];

  [v6 setActiveProfileIdentifier:*MEMORY[0x1E4F980C8]];
  id v2 = objc_alloc(MEMORY[0x1E4F98DA0]);
  int v3 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  uint64_t v4 = [v2 initWithSiteMetadataManager:v3];
  char v5 = (void *)_recentsStoreForDefaultProfile_store;
  _recentsStoreForDefaultProfile_store = v4;

  [(id)_recentsStoreForDefaultProfile_store registerProvider:v6];
}

- (ReadingListLeadImageCache)readingListLeadImageCache
{
  readingListImageCache = self->_readingListImageCache;
  if (!readingListImageCache)
  {
    uint64_t v4 = [ReadingListLeadImageCache alloc];
    char v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [MEMORY[0x1E4FB60E8] bookmarkImagesDirectoryPath];
    id v7 = [v5 fileURLWithPath:v6 isDirectory:1];
    id v8 = [(ReadingListLeadImageCache *)v4 initWithDirectoryURL:v7];
    id v9 = self->_readingListImageCache;
    self->_readingListImageCache = v8;

    readingListImageCache = self->_readingListImageCache;
  }
  return readingListImageCache;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v115 = a3;
  id v116 = a4;
  objc_initWeak(&location, self);
  id v6 = WBS_LOG_CHANNEL_PREFIXSignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E102C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LaunchToFirstLoad", (const char *)&unk_1E1266082, buf, 2u);
  }
  int v7 = [(id)*MEMORY[0x1E4FB2608] supportsMultipleScenes];
  [MEMORY[0x1E4F78550] setShouldMergeAllWindowsIfNeeded:v7 ^ 1u];
  +[WebBookmarkCollection observeDatabaseVacuumNotification]();
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [MEMORY[0x1E4F98D28] overrideSystemProxiesIfNeeded:v8];
  id v9 = [MEMORY[0x1E4F98F50] shared];
  [v9 performDelayedLaunchOperations];
  v123 = (void *)v8;

  id v10 = objc_alloc(MEMORY[0x1E4F785B0]);
  id v11 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariInjectedBundleURL");
  v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = _SFSafariIconImageCacheDirectoryPath();
  v14 = [v12 fileURLWithPath:v13 isDirectory:1];
  v122 = (void *)[v10 initWithInjectedBundleURL:v11 imageCacheDirectoryURL:v14 cacheIsReadOnly:0 metadataType:383];

  [MEMORY[0x1E4F785B0] setSharedSiteMetadataManager:v122];
  v15 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  objc_msgSend(v15, "webui_applySafariCookieAcceptPolicy");

  [MEMORY[0x1E4F3B060] loadSystemLanguageProperties];
  id v16 = +[FeatureManager sharedFeatureManager];
  v17 = (void *)MEMORY[0x1E4F97FE0];
  v18 = [MEMORY[0x1E4F3B060] sharedInstance];
  [v17 setUpSharedObserverWithSearchProviderContext:v18];

  uint64_t v19 = *MEMORY[0x1E4F980C8];
  v118 = [(Application *)self webExtensionsControllerForProfileServerID:*MEMORY[0x1E4F980C8]];
  id v20 = objc_alloc(MEMORY[0x1E4F3B008]);
  v21 = [(Application *)self tabGroupManager];
  v119 = (void *)[v20 initWithExtensionsController:v118 profileProvider:v21];

  v22 = [MEMORY[0x1E4F28C40] defaultCenter];
  v23 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", *MEMORY[0x1E4F980D8]);
  [v22 addObserver:self selector:sel__didEnableCustomizationSync name:v23 object:0];

  v24 = [(Application *)self tabGroupManager];
  v25 = [v24 defaultProfile];
  [(Application *)self _loadExtensionsInProfile:v25];

  v26 = [(Application *)self webExtensionsControllerForProfileServerID:v19];
  v27 = [MEMORY[0x1E4F781F8] sharedProvider];
  [v27 setWebExtensionsController:v26];

  v124 = [(Application *)self tabGroupManager];
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v28 = [v124 namedProfiles];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v136 objects:v143 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v137;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v137 != v30) {
          objc_enumerationMutation(v28);
        }
        v32 = [*(id *)(*((void *)&v136 + 1) + 8 * i) identifierForExtensions];
        [(Application *)self _createExtensionControllersIfNeededForProfileServerID:v32];
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v136 objects:v143 count:16];
    }
    while (v29);
  }

  [(Application *)self _setWKWebsiteDataStoreDelegate];
  v33 = (void *)MEMORY[0x1E4F78358];
  v34 = [(Application *)self proxy];
  [v33 setApplicationProxy:v34];

  [(Application *)self _readFocusConfigurationKeys];
  v35 = [MEMORY[0x1E4F28C40] defaultCenter];
  v36 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", *MEMORY[0x1E4F98168]);
  [v35 addObserver:self selector:sel__profileFocusConfigurationChanged name:v36 object:0];

  v37 = [MEMORY[0x1E4F28C40] defaultCenter];
  v38 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", *MEMORY[0x1E4F981E0]);
  [v37 addObserver:self selector:sel__tabGroupFocusConfigurationChanged name:v38 object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)deviceDidLock, @"com.apple.springboard.lockcomplete", 0, (CFNotificationSuspensionBehavior)1024);
  [(Application *)self updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing];
  if (([v124 hasCompletedMigration] & 1) == 0 && objc_msgSend(v124, "isPersistent")) {
    +[SharedDataMigration migrateTabDatabaseIfNeeded];
  }
  v121 = [v124 browserState];
  v40 = [PinnedTabsManager alloc];
  v41 = [v124 tabCollection];
  v117 = [(PinnedTabsManager *)v40 initWithBrowserState:v121 tabCollection:v41];

  v42 = [BrowserWindowController alloc];
  int v43 = [(Application *)self supportsMultipleScenes];
  v44 = [(id)objc_opt_class() browserControllerUIDelegateProvider];
  v45 = [(BrowserWindowController *)v42 initWithTabGroupManager:v124 browserState:v121 pinnedTabsManager:v117 perSitePreferencesVendor:v119 shouldMergeAllWindowsIfNeeded:v43 ^ 1u browserControllerUIDelegateProvider:v44];
  browserWindowController = self->_browserWindowController;
  self->_browserWindowController = v45;

  [(Application *)self _pruneExpiredScenes];
  v47 = [(BrowserWindowController *)self->_browserWindowController browserControllers];
  uint64_t v48 = [v47 count];

  if (v48)
  {
    v49 = [(BrowserWindowController *)self->_browserWindowController browserControllers];
    v50 = [v49 firstObject];
    v51 = [v50 processPool];
    [v51 _warmInitialProcess];
  }
  uint64_t v52 = *MEMORY[0x1E4F78918];
  v53 = v123;
  v120 = [v123 objectForKey:*MEMORY[0x1E4F78918]];
  if (v120)
  {
    if (([v120 BOOLValue] & 1) == 0)
    {
      v54 = [v119 sharedUserMediaPermissionController];
      v55 = [v54 cameraMediaCapturePreference];
      [v54 setDefaultValue:&unk_1F3C737E8 ofPreference:v55 completionHandler:0];

      v56 = [v54 microphoneMediaCapturePreference];
      [v54 setDefaultValue:&unk_1F3C737E8 ofPreference:v56 completionHandler:0];

      objc_msgSend(MEMORY[0x1E4F28C40], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
      v53 = v123;
    }
    [v53 removeObjectForKey:v52];
  }
  [(Application *)self _prewarmAutomationControllerIfEnabled];
  v57 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v57 setUsesOpportunisticPushTopic:0];

  if (([v123 BOOLForKey:@"didMigrateHistoryToCoreSpotlightAfterUpgrade"] & 1) == 0) {
    [(Application *)self performSelector:sel__export30DaysWorthOfHistoryAfterUpgrade withObject:0 afterDelay:60.0];
  }
  v58 = [MEMORY[0x1E4F74230] sharedConnection];
  if (objc_opt_respondsToSelector()) {
    [v58 registerObserver:self];
  }
  else {
    [v58 addObserver:self];
  }
  v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v59 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:self];
  [v59 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:self];
  [v59 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:self];
  [v59 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:self];
  [v59 addObserver:self selector:sel__updateKeyboardCorrectionLearningAllowed name:*MEMORY[0x1E4FB2BC8] object:0];
  [v59 addObserver:self selector:sel__historyHostnamesWereRemoved_ name:*MEMORY[0x1E4F99240] object:0];
  [v59 addObserver:self selector:sel__historyWasCleared_ name:*MEMORY[0x1E4F99268] object:0];
  [v59 addObserver:self selector:sel__historyItemsWereRemoved_ name:*MEMORY[0x1E4F99258] object:0];
  [v59 addObserver:self selector:sel__frequentlyVisitedSitesWereChanged_ name:*MEMORY[0x1E4F99218] object:0];
  [(Application *)self _clearInvalidCertificateBypassesOlderThanOneWeek];
  uint64_t v60 = *MEMORY[0x1E4F788F0];
  if (([v123 BOOLForKey:*MEMORY[0x1E4F788F0]] & 1) == 0)
  {
    [MEMORY[0x1E4F3AFF0] clearOldCertificateBypasses];
    [v123 setBool:1 forKey:v60];
  }
  v61 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v62 = *MEMORY[0x1E4FB3178];
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke;
  v135[3] = &unk_1E6D77F08;
  v135[4] = self;
  id v63 = (id)[v59 addObserverForName:v62 object:self queue:v61 usingBlock:v135];
  id v64 = (id)[v59 addObserverForName:*MEMORY[0x1E4F99098] object:0 queue:0 usingBlock:&__block_literal_global_169];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_localeChanged, (CFStringRef)*MEMORY[0x1E4F1D200], 0, (CFNotificationSuspensionBehavior)1025);
  v66 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_carrierBundledChanged, (CFStringRef)*MEMORY[0x1E4F23E80], 0, (CFNotificationSuspensionBehavior)1024);
  [v59 addObserver:self selector:sel__appleKeyboardsChanged_ name:@"AppleKeyboardsPreferencesChangedNotification" object:0];
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_autoFillStateChanged, @"com.apple.mobilesafari.AutoFillStateChanged", 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_quickWebsiteSearchProvidersChanged, @"com.apple.mobilesafari.QuickWebsiteSearchProvidersDidChange", 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)_webFilterSettingsDidChange, (CFStringRef)*MEMORY[0x1E4FB6128], 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)siriSuggestionsStateDidChange, @"com.apple.suggestions.settingsChanged", 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)screenTimeRestrictionsStateDidChange, (CFStringRef)screenTimeManagementStateDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)screenTimeRestrictionsStateDidChange, (CFStringRef)screenTimePasscodeStateDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1024);
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)safariSettingsChangedExtensionSettings, @"com.apple.mobilesafari.SafariSettingsChangedExtensionSettings", 0, (CFNotificationSuspensionBehavior)1024);
  uint64_t v67 = *MEMORY[0x1E4F99760];
  id v68 = (id)[v59 addObserverForName:*MEMORY[0x1E4F99760] object:0 queue:v61 usingBlock:&__block_literal_global_178];
  id v69 = (id)[v59 addObserverForName:v67 object:0 queue:v61 usingBlock:&__block_literal_global_180];
  id v70 = (id)[v59 addObserverForName:*MEMORY[0x1E4F991A0] object:0 queue:v61 usingBlock:&__block_literal_global_180];
  id v71 = (id)[v59 addObserverForName:*MEMORY[0x1E4F991D0] object:0 queue:v61 usingBlock:&__block_literal_global_180];
  id v72 = (id)[v59 addObserverForName:*MEMORY[0x1E4F991D8] object:0 queue:v61 usingBlock:&__block_literal_global_180];
  uint64_t v73 = *MEMORY[0x1E4F994A8];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_8;
  v134[3] = &unk_1E6D77F08;
  v134[4] = self;
  id v74 = (id)[v59 addObserverForName:v73 object:0 queue:v61 usingBlock:v134];
  v75 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v75 addObserver:self selector:sel__updateCloudFeatureAvailability name:*MEMORY[0x1E4FB6138] object:0];

  [(Application *)self _updateCloudFeatureAvailability];
  CFNotificationCenterAddObserver(v66, self, (CFNotificationCallback)contentBlockerDidChange, (CFStringRef)*MEMORY[0x1E4F3B0C8], 0, (CFNotificationSuspensionBehavior)1028);
  CFLocaleRef v76 = CFLocaleCopyCurrent();
  +[History localeChanged:v76];
  CFRelease(v76);
  [MEMORY[0x1E4FB6D98] scheduleEmptyDatabaseRemoval];
  [(Application *)self _readDefaults];
  [(Application *)self setReceivesMemoryWarnings:1];
  v77 = [MEMORY[0x1E4F78398] sharedTracker];
  [v77 load];

  v78 = [MEMORY[0x1E4F782B0] sharedTracker];
  [v78 load];

  [MEMORY[0x1E4F98E88] warmUp];
  tabGroupManager = self->_tabGroupManager;
  v80 = [MEMORY[0x1E4F98E88] defaultManager];
  [(WBTabGroupManager *)tabGroupManager addTabGroupObserver:v80];

  [(Application *)self _showSearchEngineAlertIfNeeded];
  if (SFDeviceSupportsPointerInteractions())
  {
    v81 = [MEMORY[0x1E4F1CA80] set];
    pointerDevices = self->_pointerDevices;
    self->_pointerDevices = v81;

    self->_pointerDeviceLock._os_unfair_lock_opaque = 0;
    v83 = [MEMORY[0x1E4F4F350] sharedInstance];
    v84 = [v83 addPointerDeviceObserver:self];
    pointerDeviceObserverToken = self->_pointerDeviceObserverToken;
    self->_pointerDeviceObserverToken = v84;
  }
  self->_finishedLaunching = 1;
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_10;
  v132[3] = &unk_1E6D77EB8;
  id v87 = v86;
  id v133 = v87;
  performBlockForBrowserControllers(v132);
  v88 = [(Application *)self tabGroupManager];
  [v88 addTabGroupObserver:self];

  [(Application *)self prewarmAndRemoveOrphanedProfileDataStores];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v89 = [(WBTabGroupManager *)self->_tabGroupManager allSyncedTabGroupsExceptRemoteUnnamedTabGroups];
  uint64_t v90 = [v89 countByEnumeratingWithState:&v128 objects:v142 count:16];
  if (v90)
  {
    uint64_t v91 = *(void *)v129;
    do
    {
      for (uint64_t j = 0; j != v90; ++j)
      {
        if (*(void *)v129 != v91) {
          objc_enumerationMutation(v89);
        }
        v93 = [*(id *)(*((void *)&v128 + 1) + 8 * j) tabsUUIDSet];
        [v87 unionSet:v93];
      }
      uint64_t v90 = [v89 countByEnumeratingWithState:&v128 objects:v142 count:16];
    }
    while (v90);
  }

  +[TabSnapshotCache removeSavedSnapshotsKeepingSnapshotsWithIdentifiers:v87];
  id v94 = objc_alloc(MEMORY[0x1E4F98B30]);
  v95 = [MEMORY[0x1E4F98B38] standardStore];
  v96 = (WBSFormAutoFillCorrectionsHistoryObserver *)[v94 initWithCorrectionsStore:v95];
  formAutoFillCorrectionsHistoryObserver = self->_formAutoFillCorrectionsHistoryObserver;
  self->_formAutoFillCorrectionsHistoryObserver = v96;

  [(Application *)self _addDefaultsObserver];
  v98 = self->_tabGroupManager;
  v99 = [v122 tabGroupIconProvider];
  [(WBTabGroupManager *)v98 addTabGroupObserver:v99];

  [(Application *)self _reportLaunchAnalyticsSoon];
  if ([MEMORY[0x1E4F97EA0] hasInternalContent]) {
    [(Application *)self _connectToCyclerIfNecessary];
  }
  [v59 addObserver:self selector:sel__webBookmarksDidReload name:*MEMORY[0x1E4FB6148] object:0];
  [v59 addObserver:self selector:sel__webBookmarksDidReload name:@"bookmarkCollectionHasBecomeAvailableNotification" object:0];
  v100 = [MEMORY[0x1E4FB60C8] sharedProxy];
  [v100 scheduleSyncIfNeeded];

  v101 = [MEMORY[0x1E4F3AF68] sharedManager];
  [v101 setExtraDownloadDelegate:self];

  [v59 addObserver:self selector:sel__downloadDidStartNotification_ name:*MEMORY[0x1E4F3B148] object:0];
  [v59 addObserver:self selector:sel__downloadDidStopNotification_ name:*MEMORY[0x1E4F3B150] object:0];
  [MEMORY[0x1E4F78598] registerBookmarkCollectionFactory:&__block_literal_global_204];
  v102 = (WBSOfflineSearchSuggestionsModelUpdateManager *)objc_alloc_init(MEMORY[0x1E4F98C40]);
  offlineSearchSuggestionsModelUpdateManager = self->_offlineSearchSuggestionsModelUpdateManager;
  self->_offlineSearchSuggestionsModelUpdateManager = v102;

  v104 = +[LaunchStateController sharedController];
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_12;
  v125[3] = &unk_1E6D77F98;
  objc_copyWeak(&v127, &location);
  id v105 = v123;
  id v126 = v105;
  [v104 doAfterUIBecomesActive:v125];

  [(Application *)self lockPrivateBrowsing];
  v106 = (WBSBackgroundImageAssetController *)objc_alloc_init(MEMORY[0x1E4F989A8]);
  backgroundImageAssetController = self->_backgroundImageAssetController;
  self->_backgroundImageAssetController = v106;

  [(WBSBackgroundImageAssetController *)self->_backgroundImageAssetController setDelegate:self];
  v108 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  LODWORD(v101) = [v108 BOOLForKey:*MEMORY[0x1E4F99180]];

  if (v101)
  {
    v109 = [(WBSCompletionListVendorForHistoryService *)[CompletionListVendorForHistoryService alloc] initWithDataSource:self];
    completionListVendorForHistoryService = self->_completionListVendorForHistoryService;
    self->_completionListVendorForHistoryService = v109;
  }
  v111 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  [v111 setIndexDelegate:self];

  [(Application *)self _showExtensionPermissionBannerIfNecessary];
  [v59 addObserver:self selector:sel_reloadContentBlockers name:*MEMORY[0x1E4F98118] object:0];
  if ([MEMORY[0x1E4F97EA0] isWAPEnabled])
  {
    v112 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    [v112 setDelegate:self];
  }
  if [MEMORY[0x1E4F97EA0] isWAPEnabled] && (objc_opt_respondsToSelector()) {
    [MEMORY[0x1E4F46710] _setWebPushActionHandler:&__block_literal_global_225];
  }
  if ([MEMORY[0x1E4F97EA0] isWAPEnabled])
  {
    v113 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v113 addObserver:self selector:sel_webClipCacheDidChange_ name:*MEMORY[0x1E4F3B120] object:0];

    [(Application *)self webClipCacheDidChange:0];
  }

  objc_destroyWeak(&v127);
  objc_destroyWeak(&location);

  return 1;
}

- (unint64_t)maximumTabCountAllowingMoreTabs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 objectForKey:@"DebugOverrideTabCapacity"];

  if ([MEMORY[0x1E4F97EA0] hasInternalContent]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (highTabCapacityDevice)
    {
      if (+[WBUFeatureManager accessLevel] == 2)
      {
        unint64_t v7 = 200;
      }
      else
      {
        uint64_t v8 = [MEMORY[0x1E4F78290] sharedFeatureManager];
        if (([v8 allowsUnlimitedTabs] & v3) != 0) {
          unint64_t v7 = 5000;
        }
        else {
          unint64_t v7 = 500;
        }
      }
    }
    else
    {
      unint64_t v7 = 36;
    }
  }
  else if ([v5 integerValue] == -1)
  {
    unint64_t v7 = -1;
  }
  else
  {
    unint64_t v7 = [v5 integerValue];
  }

  return v7;
}

- (unint64_t)maximumTabCount
{
  return [(Application *)self maximumTabCountAllowingMoreTabs:0];
}

- (void)updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke;
  v3[3] = &unk_1E6D78080;
  objc_copyWeak(&v4, &location);
  [(Application *)self _determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)prewarmAndRemoveOrphanedProfileDataStores
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(Application *)self tabGroupManager];
  id v4 = [v3 allNamedProfileIdentifiers];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v5 = [v4 allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (id)objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreForProfileWithIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v11 = (void *)MEMORY[0x1E4F46710];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke;
  v16[3] = &unk_1E6D78008;
  id v17 = v4;
  id v12 = v4;
  [v11 _fetchAllIdentifiers:v16];
  v13 = (void *)MEMORY[0x1E4F98CF8];
  v14 = [(Application *)self tabGroupManager];
  v15 = [v14 allProfileIdentifiers];
  [v13 clearCachedDataForProfilesWithIdentifiersNotInSet:v15];
}

- (void)lockPrivateBrowsing
{
  if (!self->_privateBrowsingLocked)
  {
    self->_shouldPrivateBrowsingBeLockedIfPossible = 1;
    [(Application *)self updateLockedPrivateBrowsingState];
  }
}

- (void)_updateCloudFeatureAvailability
{
  BOOL v3 = +[FeatureManager sharedFeatureManager];
  int v4 = [v3 isCloudSyncAvailable];

  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__Application__updateCloudFeatureAvailability__block_invoke;
    v5[3] = &unk_1E6D77C20;
    v5[4] = self;
    [(Application *)self _getBookmarksDataClassEnabledWithCompletionHandler:v5];
  }
}

- (void)_showSearchEngineAlertIfNeeded
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v3 = *MEMORY[0x1E4F786C8];
  int v4 = [v2 stringForKey:*MEMORY[0x1E4F786C8]];
  char v5 = (void *)MGCopyAnswer();
  [v2 setObject:v5 forKey:v3];
  if (_SFDeviceRegionCodeIsRussia() && ([v4 isEqualToString:v5] & 1) == 0)
  {
    if (!v4)
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      uint64_t v6 = (uint64_t (*)(void))getDMGetUserDataDispositionSymbolLoc_ptr;
      long long v19 = getDMGetUserDataDispositionSymbolLoc_ptr;
      if (!getDMGetUserDataDispositionSymbolLoc_ptr)
      {
        uint64_t v7 = (void *)DataMigrationLibrary();
        v17[3] = (uint64_t)dlsym(v7, "DMGetUserDataDisposition");
        getDMGetUserDataDispositionSymbolLoc_ptr = (_UNKNOWN *)v17[3];
        uint64_t v6 = (uint64_t (*)(void))v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (v6)
      {
        char v8 = v6();
        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x2020000000;
        uint64_t v9 = (uint64_t (*)(void))getDMGetPreviousBuildVersionSymbolLoc_ptr;
        long long v19 = getDMGetPreviousBuildVersionSymbolLoc_ptr;
        if (!getDMGetPreviousBuildVersionSymbolLoc_ptr)
        {
          id v10 = (void *)DataMigrationLibrary();
          v17[3] = (uint64_t)dlsym(v10, "DMGetPreviousBuildVersion");
          getDMGetPreviousBuildVersionSymbolLoc_ptr = (_UNKNOWN *)v17[3];
          uint64_t v9 = (uint64_t (*)(void))v17[3];
        }
        _Block_object_dispose(&v16, 8);
        if (v9)
        {
          id v11 = (void *)v9();
          id v12 = v11;
          if ((v8 & 2) != 0 && v11)
          {
            uint64_t v13 = [v11 compare:@"18F0" options:64];

            if (v13 == -1) {
              goto LABEL_16;
            }
          }
          else
          {
          }
          goto LABEL_15;
        }
      }
      else
      {
        -[Application _showSearchEngineAlertIfNeeded]();
      }
      v15 = (_Unwind_Exception *)-[Application _showSearchEngineAlertIfNeeded]();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v15);
    }
LABEL_15:
    v14 = [MEMORY[0x1E4F783A0] searchEngineSettingAlert];
    [v14 scheduleWithCompletionBlock:&__block_literal_global_268];
  }
LABEL_16:
}

- (void)_showExtensionPermissionBannerIfNecessary
{
  uint64_t v3 = [(Application *)self webExtensionsControllerForProfileServerID:*MEMORY[0x1E4F980C8]];
  int v4 = [v3 composedIdentifiersOfExtensionsWithAutomaticallyGrantedPermissions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__Application__showExtensionPermissionBannerIfNecessary__block_invoke;
  v9[3] = &unk_1E6D784B0;
  id v10 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v9);

  if ([v6 count])
  {
    uint64_t v7 = [(Application *)self browserControllers];
    char v8 = [v7 firstObject];
    [v8 showExtensionPermissionBannerForExtensions:v6];
  }
}

- (void)_setWKWebsiteDataStoreDelegate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F46710], "safari_allPersistentDataStores", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "set_delegate:", self);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_reportLaunchAnalyticsSoon
{
  uint64_t v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  uint64_t v4 = [MEMORY[0x1E4F78558] settings];
  char v5 = [v4 hasPrivateBrowsingWindow];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__Application__reportLaunchAnalyticsSoon__block_invoke;
  v7[3] = &unk_1E6D780C8;
  char v9 = v5;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v6 performOnAnalyticsQueueWithDelay:5 block:v7];
}

- (void)_readFocusConfigurationKeys
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Missing FTG UUID", v2, v3, v4, v5, v6);
}

- (void)_prewarmAutomationControllerIfEnabled
{
  if ([MEMORY[0x1E4F3AF00] isSystemRemoteAutomationEnabled])
  {
    id v3 = [(Application *)self automationController];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4F3B130];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__Application__prewarmAutomationControllerIfEnabled__block_invoke;
    v8[3] = &unk_1E6D77F08;
    v8[4] = self;
    uint8_t v6 = [v4 addObserverForName:v5 object:0 queue:0 usingBlock:v8];
    developerPreferencesDidChangeNotificationToken = self->_developerPreferencesDidChangeNotificationToken;
    self->_developerPreferencesDidChangeNotificationToken = v6;
  }
}

- (void)_getBookmarksDataClassEnabledWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[FeatureManager sharedFeatureManager];
  char v5 = [v4 isCloudSyncAvailable];

  if (v5)
  {
    uint8_t v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__Application__getBookmarksDataClassEnabledWithCompletionHandler___block_invoke;
    block[3] = &unk_1E6D77E70;
    id v8 = v3;
    dispatch_async(v6, block);
  }
  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (void)_determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__Application__determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6D77E70;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (id)browserControllerUIDelegateProvider
{
  if (browserControllerUIDelegateProvider) {
    uint64_t v2 = (void *)browserControllerUIDelegateProvider;
  }
  else {
    uint64_t v2 = &__block_literal_global_364;
  }
  id v3 = (void *)MEMORY[0x1E4E42950](v2, a2);
  return v3;
}

void __57__Application__suspendOrResumeWallpaperAnimationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)needsFocusedTabGroupUpdate
{
  return self->_needsFocusedTabGroupUpdate;
}

- (BOOL)needsFocusProfileUpdate
{
  return self->_needsFocusProfileUpdate;
}

- (id)allWebExtensionsControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(Application *)self tabGroupManager];
  uint64_t v4 = [v3 namedProfiles];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) identifierForExtensions];
        [(Application *)self _createExtensionControllersIfNeededForProfileServerID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = [(NSMutableDictionary *)self->_profileServerIDToWebExtensionsControllers allValues];
  return v10;
}

- (void)_clearInvalidCertificateBypassesOlderThanOneWeek
{
  id v3 = [MEMORY[0x1E4F98A08] sharedManager];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  [v3 clearCertificateBypassesCreatedBeforeDate:v2];
}

- (void)_frequentlyVisitedSitesWereChanged:(id)a3
{
  id v7 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    pendingFrequentlyVisitedSites = self->_pendingFrequentlyVisitedSites;
    if (!pendingFrequentlyVisitedSites)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v6 = self->_pendingFrequentlyVisitedSites;
      self->_pendingFrequentlyVisitedSites = v5;

      pendingFrequentlyVisitedSites = self->_pendingFrequentlyVisitedSites;
    }
    [(NSMutableSet *)pendingFrequentlyVisitedSites addObject:v7];
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Application did become active", buf, 2u);
  }
  [(Application *)self _suspendOrResumeWallpaperAnimationIfNeeded];
  if (self->_resigningActive)
  {
    self->_resigningActive = 0;
    self->_willEnterSuspendedState = 0;
    if (self->_shouldReadDefaultsOnResume) {
      [(Application *)self _readDefaults];
    }
    uint64_t v5 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    [v5 setSuspended:0];

    uint64_t v6 = MEMORY[0x1E4F98C78];
    id v7 = [MEMORY[0x1E4F78558] settings];
    +[WBSParsecDSession sendLaunchFeedbackWithEvent:isPrivate:usesLoweredSearchBar:](v6, 26, [v7 hasPrivateBrowsingWindow], -[Application usesLoweredSearchBar](self, "usesLoweredSearchBar"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [(BrowserWindowController *)self->_browserWindowController browserControllers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) scene];

          if (v14) {
            ++v11;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }
    else
    {
      unint64_t v11 = 0;
    }

    unint64_t v15 = [(Application *)self _numberOfTabsForPrivateBrowsing:0];
    uint64_t v16 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v16 reportNumberOfWindows:v11];
    [v16 reportNumberOfTabs:v15];
    if (v11) {
      uint64_t v17 = (uint64_t)(float)((float)v15 / (float)v11);
    }
    else {
      uint64_t v17 = 0;
    }
    [v16 reportNumberOfTabsPerWindow:v17];
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v19 = [v18 BOOLForKey:*MEMORY[0x1E4F980D8]];

    if (v19)
    {
      uint64_t v20 = 1;
    }
    else
    {
      long long v21 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      uint64_t v20 = [v21 BOOLForKey:*MEMORY[0x1E4F980E0]];
    }
    [v16 reportCustomizationSyncEnablement:v20];
  }
}

- (void)_suspendOrResumeWallpaperAnimationIfNeeded
{
  char v3 = [(Application *)self isSuspended];
  wallpaperSuspensionAssertion = self->_wallpaperSuspensionAssertion;
  if (v3)
  {
    self->_wallpaperSuspensionAssertion = 0;
  }
  else if (!wallpaperSuspensionAssertion)
  {
    SBSAcquireWallpaperAnimationSuspensionAssertion();
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Application will enter foreground", buf, 2u);
  }
  uint64_t v5 = [MEMORY[0x1E4F78558] settings];
  char v6 = [v5 hasPrivateBrowsingWindow];

  +[WBSParsecDSession sendLaunchFeedbackWithEvent:isPrivate:usesLoweredSearchBar:](MEMORY[0x1E4F98C78], 7, v6, [(Application *)self usesLoweredSearchBar]);
  id v7 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v7 setUsesOpportunisticPushTopic:0];

  [(BrowserWindowController *)self->_browserWindowController updateCloudTabsForEnteringForeground];
  if ([MEMORY[0x1E4F98998] shouldCloseTabsAutomaticallyWhenEnteringForeground])
  {
    [MEMORY[0x1E4F98998] clearMostDistantLastViewedTime];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [(BrowserWindowController *)self->_browserWindowController browserControllers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [*(id *)(*((void *)&v18 + 1) + 8 * v12) tabController];
          [v13 closeTabsAutomaticallyIfNecessary];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }
  }
  +[ApplicationShortcutController updateShortcutItemsIfNeeded];
  [(Application *)self updateShouldLockPrivateBrowsingWithTimerIfNecessary];
  long long v14 = +[LaunchStateController sharedController];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__Application__applicationWillEnterForeground___block_invoke;
  v17[3] = &unk_1E6D77E20;
  v17[4] = self;
  [v14 doAfterUIBecomesActive:v17];

  unint64_t v15 = +[AppStoreReviewController sharedController];
  [v15 applicationDidEnterForeground];

  uint64_t v16 = [(Application *)self tabGroupManager];
  [v16 enableDevicePresenceReporting];
}

- (BOOL)usesLoweredSearchBar
{
  uint64_t v2 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  BOOL v3 = [v2 preferredCapsuleLayoutStyle] != 2;

  return v3;
}

- (void)updateShouldLockPrivateBrowsingWithTimerIfNecessary
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  unint64_t v15 = [v3 objectForKey:*MEMORY[0x1E4F99050]];

  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || [v15 intValue] != 2;
  if ([(Application *)self _hasPrivateBrowserControllerActiveInAnyWindow]|| [(Application *)self isPrivateBrowsingLocked])
  {
    int v5 = 0;
  }
  else
  {
    int v5 = ![(Application *)self _mediaIsPlayingInPrivateBrowsing];
  }
  char v6 = v15;
  if (v4)
  {
    lockPrivateBrowsingInBackgroundTimer = self->_lockPrivateBrowsingInBackgroundTimer;
    if (v5)
    {
      if (lockPrivateBrowsingInBackgroundTimer) {
        goto LABEL_17;
      }
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      objc_msgSend(v8, "safari_doubleForKey:defaultValue:", *MEMORY[0x1E4F99140], 30.0);
      double v10 = v9;

      uint64_t v11 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_lockPrivateBrowsing selector:0 userInfo:0 repeats:v10];
      uint64_t v12 = self->_lockPrivateBrowsingInBackgroundTimer;
      self->_lockPrivateBrowsingInBackgroundTimer = v11;

      long long v13 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v13 addTimer:self->_lockPrivateBrowsingInBackgroundTimer forMode:*MEMORY[0x1E4F1C3A0]];
    }
    else
    {
      if (!lockPrivateBrowsingInBackgroundTimer) {
        goto LABEL_17;
      }
      [(NSTimer *)lockPrivateBrowsingInBackgroundTimer invalidate];
      long long v14 = self->_lockPrivateBrowsingInBackgroundTimer;
      self->_lockPrivateBrowsingInBackgroundTimer = 0;
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_17;
    }
    [(Application *)self lockPrivateBrowsing];
  }
  char v6 = v15;
LABEL_17:
}

- (BOOL)_mediaIsPlayingInPrivateBrowsing
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v2 = [(Application *)self browserControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = [v7 tabController];
        double v9 = [v8 privateTabDocuments];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              unint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if ([v15 isAudible]) {
                goto LABEL_22;
              }
              uint64_t v16 = [v7 tabDocumentPlayingPIPVideo];

              if (v15 == v16) {
                goto LABEL_22;
              }
              uint64_t v17 = [v15 webView];
              if ([v17 cameraCaptureState] == 1)
              {

LABEL_22:
                BOOL v19 = 1;
                goto LABEL_23;
              }
              uint64_t v18 = [v17 microphoneCaptureState];

              if (v18 == 1) {
                goto LABEL_22;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            uint64_t v5 = v21;
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
      BOOL v19 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_23:

  return v19;
}

- (BOOL)_hasPrivateBrowserControllerActiveInAnyWindow
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(Application *)self browserControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        char v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isShowingPrivateTabs]
          && ([v6 activeWindowIsForeground] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)enumerateContentBlockerManagersUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(Application *)self allContentBlockerManagers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)allContentBlockerManagers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(Application *)self tabGroupManager];
  uint64_t v4 = [v3 namedProfiles];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) identifierForExtensions];
        [(Application *)self _createExtensionControllersIfNeededForProfileServerID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = [(NSMutableDictionary *)self->_profileServerIDToContentBlockerManagers allValues];
  return v10;
}

- (SFWebExtensionsController)defaultWebExtensionsController
{
  uint64_t v2 = +[Application sharedApplication];
  uint64_t v3 = [v2 webExtensionsControllerForProfileServerID:*MEMORY[0x1E4F980C8]];

  return (SFWebExtensionsController *)v3;
}

- (void)setObject:(id)a3 forInjectedBundleParameter:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(Application *)self allProcessPools];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _setObject:v6 forBundleParameter:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSArray)allProcessPools
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(Application *)self tabGroupManager];
  uint64_t v4 = [v3 profiles];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) identifier];
        [(Application *)self _initializeProcessPoolForProfileIdentifier:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(NSMutableDictionary *)self->_processPools allValues];
  return (NSArray *)v10;
}

- (id)processPoolForProfileIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(Application *)self _initializeProcessPoolForProfileIdentifier:v4];
    uint64_t v5 = [(NSMutableDictionary *)self->_processPools objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)_initializeProcessPoolForProfileIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_processPools, "objectForKeyedSubscript:");

  if (!v4)
  {
    if (!self->_processPools)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      processPools = self->_processPools;
      self->_processPools = v5;
    }
    uint64_t v7 = +[BrowserController newProcessPool];
    [(NSMutableDictionary *)self->_processPools setObject:v7 forKeyedSubscript:v8];
  }
}

- (void)_createExtensionControllersIfNeededForProfileServerID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_profileServerIDToWebExtensionsControllers objectForKeyedSubscript:v4];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_profileServerIDToContentBlockerManagers objectForKeyedSubscript:v4];

    if (!v6)
    {
      char v19 = [MEMORY[0x1E4F98FC0] isProfileServerIDForDefaultProfile:v4];
      uint64_t v7 = [(Application *)self _userContentControllerForProfileServerID:v4];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F78530]) initWithProfileServerID:v4 userContentController:v7];
      [v8 setDelegate:self];
      [v8 setProfileDelegate:self];
      uint64_t v9 = [(Application *)self processPoolForProfileIdentifier:v4];
      [v8 setProcessPool:v9];
      uint64_t v10 = _SFApplicationNameForUserAgent();
      [v8 setApplicationNameForUserAgent:v10];

      [v8 setNavigationIntentHandler:self];
      [v8 initializeWebKitControllerIfNeededFromSettings:0];
      uint64_t v11 = [MEMORY[0x1E4F98A18] sharedManager];
      [v11 addProvider:v8];

      long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F3AE78]) initWithUserContentController:v7 webExtensionsController:v8];
      [v12 setWebExtensionsController:v8];
      [v12 setDelegate:self];
      long long v13 = [MEMORY[0x1E4F98A18] sharedManager];
      [v13 addProvider:v12];

      if ((v19 & 1) == 0)
      {
        long long v14 = [MEMORY[0x1E4F3AE78] contentBlockerStore];
        id v20 = v7;
        WBSLoadBuiltInContentBlockersWithStore();
      }
      if (!self->_profileServerIDToWebExtensionsControllers)
      {
        long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
        profileServerIDToWebExtensionsControllers = self->_profileServerIDToWebExtensionsControllers;
        self->_profileServerIDToWebExtensionsControllers = v15;
      }
      if (!self->_profileServerIDToContentBlockerManagers)
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
        profileServerIDToContentBlockerManagers = self->_profileServerIDToContentBlockerManagers;
        self->_profileServerIDToContentBlockerManagers = v17;
      }
      [(NSMutableDictionary *)self->_profileServerIDToWebExtensionsControllers setObject:v8 forKeyedSubscript:v4];
      [(NSMutableDictionary *)self->_profileServerIDToContentBlockerManagers setObject:v12 forKeyedSubscript:v4];
      [v8 findExtensions];
    }
  }
}

- (id)_userContentControllerForProfileServerID:(id)a3
{
  id v4 = a3;
  profileServerIDToUserContentController = self->_profileServerIDToUserContentController;
  if (!profileServerIDToUserContentController)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = self->_profileServerIDToUserContentController;
    self->_profileServerIDToUserContentController = v6;

    profileServerIDToUserContentController = self->_profileServerIDToUserContentController;
  }
  id v8 = [(NSMutableDictionary *)profileServerIDToUserContentController objectForKeyedSubscript:v4];
  if (!v8)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F980C8]])
    {
      objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F466A0]);
    }
    id v8 = v9;
    [(NSMutableDictionary *)self->_profileServerIDToUserContentController setObject:v9 forKeyedSubscript:v4];
  }
  id v10 = v8;

  return v10;
}

void __98__Application__determineIfAuthenticationIsAvailableForLockedPrivateBrowsingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F3AFD0] sharedObserver];
  int v3 = [v2 doesUserHavePasscodeSet];

  id v4 = [MEMORY[0x1E4F3AFD0] sharedObserver];
  [v4 biometryTypeCurrentlyAvailableForDevice];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F993B8]];

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F3AFD0] sharedObserver];
      [v6 isUserEnrolledInBiometricAuthentication];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke_2;
    v9[3] = &unk_1E6D78058;
    char v10 = a2;
    v9[5] = a3;
    v9[6] = a4;
    void v9[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

- (void)_loadExtensionsInProfile:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v19 = 138477827;
    id v20 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Loading extensions in profile %{private}@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v6 = [v4 identifierForExtensions];
  id v7 = [(Application *)self webExtensionsControllerForProfileServerID:v6];

  id v8 = (void *)MEMORY[0x1E4F98FA8];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v8 migrateStorageToPerProfileFormatIfNecessaryWithDefaults:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F98FB8]);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  long long v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v13 = objc_msgSend(v12, "safari_settingsDirectoryURL");
  long long v14 = (void *)[v10 initWithUserDefaults:v11 safariContainerSettingsDirectoryURL:v13];

  [v14 migrateSQLiteStorageToWebKitIfNecessary];
  [v7 loadEnabledExtensions];
  if ([v7 hasDiscoveredExtensions]) {
    [v7 loadSuitableDiscoveredExtensions];
  }
  long long v15 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1E102C000, v15, OS_LOG_TYPE_INFO, "Creating SFContentBlockerManager", (uint8_t *)&v19, 2u);
  }
  long long v16 = [v4 identifierForExtensions];
  uint64_t v17 = [(Application *)self contentBlockerManagerForProfileServerID:v16];

  uint64_t v18 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = 138477827;
    id v20 = v17;
    _os_log_impl(&dword_1E102C000, v18, OS_LOG_TYPE_INFO, "Calling reloadUserContentControllerReadingStateFromDisk on: %{private}@", (uint8_t *)&v19, 0xCu);
  }
  [v17 reloadUserContentControllerReadingStateFromDisk:0];
}

- (id)contentBlockerManagerForProfileServerID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_profileServerIDToContentBlockerManagers objectForKeyedSubscript:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      [(Application *)self _createExtensionControllersIfNeededForProfileServerID:v4];
      id v7 = [(NSMutableDictionary *)self->_profileServerIDToContentBlockerManagers objectForKeyedSubscript:v4];
    }
    id v9 = v7;
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXProfiles();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[Application contentBlockerManagerForProfileServerID:]();
    }
    id v9 = 0;
  }

  return v9;
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_12(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v17 = WeakRetained;
    [WeakRetained _didEnableCustomizationSync];
    uint64_t v3 = *MEMORY[0x1E4F98160];
    char v4 = [*(id *)(a1 + 32) BOOLForKey:*MEMORY[0x1E4F98160]];
    int v5 = [*(id *)(a1 + 32) BOOLForKey:*MEMORY[0x1E4F980E0]];
    if ((v4 & 1) == 0 && v5 && v17[114])
    {
      [*(id *)(a1 + 32) setBool:1 forKey:v3];
      [v17[114] syncPerSiteSettingsUpWithCompletion:&__block_literal_global_207];
      [v17[114] syncPerSiteSettingsDownWithCompletion:&__block_literal_global_209];
    }
    uint64_t v6 = +[SafariCloudBookmarksMigrationCoordinator migrationCoordinator];
    [v6 startCoordinatingMigration];

    [v17[98] checkForModelUpdatesOrRemoteDisablementIfNeeded];
    id v7 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    [v7 fetchAvailableVoiceLanguages];

    id v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    id v9 = [[BookmarkImporter alloc] initWithBookmarkCollection:v8];
    [(BookmarkImporter *)v9 importBuiltinBookmarks];
    id v10 = [v8 bookmarksInFavoritesList];
    uint64_t v11 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    uint64_t v12 = objc_msgSend(v10, "safari_prefixWithMaxLength:", 60);
    [v11 scheduleLowPriorityRequestForBookmarks:v12];

    long long v13 = [MEMORY[0x1E4F97FD0] sharedStore];
    [v13 setShouldWarmDataStoreAfterReset:1];

    long long v14 = objc_alloc_init(SpotlightBookmarksDonationWriter);
    id v15 = v17[100];
    v17[100] = v14;

    long long v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LOBYTE(v12) = [v16 BOOLForKey:*MEMORY[0x1E4F99158]];

    if ((v12 & 1) == 0) {
      [v17[100] donateAllBookmarks];
    }

    id WeakRetained = v17;
  }
}

- (void)_didEnableCustomizationSync
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F980D8]];

  if ((v4 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
        int v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLForKey:*MEMORY[0x1E4F980E0]],
        v5,
        v6))
  {
    if (self->_settingsSyncEngine) {
      return;
    }
    id v7 = objc_alloc_init(SafariSettingsSyncEngine);
    settingsSyncEngine = self->_settingsSyncEngine;
    self->_settingsSyncEngine = v7;
  }
  else
  {
    settingsSyncEngine = self->_settingsSyncEngine;
    if (!settingsSyncEngine) {
      return;
    }
    self->_settingsSyncEngine = 0;
  }
}

- (id)tabCollectionConfiguration
{
  if ([(Application *)self shouldRestoreStateForPPT]) {
    [MEMORY[0x1E4FB6060] pptTabCollectionConfiguration];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4FB6060] safariTabCollectionConfiguration];
  }
  objc_msgSend(v3, "setMaximumTabsPerTabGroup:", -[Application maximumTabCountAllowingMoreTabs:](self, "maximumTabCountAllowingMoreTabs:", 1));
  return v3;
}

- (BOOL)shouldRestoreStateForPPT
{
  BOOL v2 = [(Application *)self isRunningPPT];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"shouldRestoreStateForPPT"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isRunningPPT
{
  if ([(Application *)self launchedToTest]) {
    return 1;
  }
  return [(Application *)self isRunningTest];
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v4 tabCollectionViewProvider];
  int v6 = [v5 allSnapshotIdentifiers];
  [v3 unionSet:v6];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v4 windowState];
  id v9 = [v8 localTabGroup];
  id v10 = [v9 tabsUUIDSet];
  [v7 unionSet:v10];

  uint64_t v11 = *(void **)(a1 + 32);
  id v14 = [v4 windowState];

  uint64_t v12 = [v14 privateTabGroup];
  long long v13 = [v12 tabsUUIDSet];
  [v11 unionSet:v13];
}

void __66__Application__getBookmarksDataClassEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  BOOL v2 = objc_msgSend(v3, "aa_primaryAppleAccountWithPreloadedDataclasses");
  [v2 isEnabledForDataclass:*MEMORY[0x1E4F17A70]];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__Application__updateCloudFeatureAvailability__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__Application__updateCloudFeatureAvailability__block_invoke_2;
  v2[3] = &unk_1E6D781E8;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2(uint64_t a1)
{
  BOOL v2 = +[FeatureManager sharedFeatureManager];
  int v3 = [v2 isCloudHistorySyncAvailable];

  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    [v4 _resetCloudHistoryAccountIfNeeded];
    int v6 = +[History sharedHistory];
    [v6 releaseCloudHistory:&__block_literal_global_333];

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 544);
    *(void *)(v7 + 544) = 0;
  }
  else if (v4[68])
  {
    [v4 _resetCloudHistoryAccountIfNeeded];
  }
  else
  {
    id v9 = +[History sharedHistory];
    id v10 = +[CloudHistoryConfiguration sharedConfiguration];
    uint64_t v11 = [v10 dictionaryRepresentation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__Application__updateCloudFeatureAvailability__block_invoke_3;
    v14[3] = &unk_1E6D781C0;
    v14[4] = *(void *)(a1 + 32);
    [v9 initializeCloudHistoryWithConfiguration:v11 completionHandler:v14];
  }
  if (+[WBUFeatureManager accessLevel] == 2)
  {
    uint64_t v12 = +[CloudTabStore sharedCloudTabStore];
    long long v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __46__Application__updateCloudFeatureAvailability__block_invoke_2_cold_1();
    }
    [v12 synchronizeCloudTabDevices];
  }
}

- (void)_resetCloudHistoryAccountIfNeeded
{
  int v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = *MEMORY[0x1E4FB6178];
  id v5 = v3;
  if ([v3 BOOLForKey:*MEMORY[0x1E4FB6178]])
  {
    [v5 removeObjectForKey:v4];
    [(WBSCloudHistoryServiceProtocol *)self->_cloudHistory resetForAccountChangeWithCompletionHandler:&__block_literal_global_323];
  }
}

- (void)loadExtensionsInProfileIfNecessary:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 identifierForExtensions];
  id v5 = [(Application *)self webExtensionsControllerForProfileServerID:v4];
  char v6 = [v5 loadEnabledExtensionsWasCalled];

  if ((v6 & 1) == 0) {
    [(Application *)self _loadExtensionsInProfile:v7];
  }
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2_331(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__Application__updateCloudFeatureAvailability__block_invoke_2_331_cold_1(v3);
    }
  }
}

void __91__Application_updateBiometricAuthenticationAndPasscodeAvailabilityForLockedPrivateBrowsing__block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = v2;
  if (v3 != 2)
  {
    [v2 setBool:v3 == 0 forKey:*MEMORY[0x1E4F99048]];
    id v2 = v4;
  }
  [v2 setBool:*(unsigned __int8 *)(a1 + 56) forKey:*MEMORY[0x1E4F99340]];
  [v4 setInteger:*(void *)(a1 + 48) forKey:*MEMORY[0x1E4F99050]];
  [*(id *)(a1 + 32) updateLockedPrivateBrowsingState];
}

uint64_t __47__Application__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isPrivateBrowsingLocked];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _hasPrivateBrowserControllerActiveInAnyWindow];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 authenticateToUnlockPrivateBrowsingWithCompletionHandler:0];
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (MGGetBoolAnswer()) {
      char v2 = 1;
    }
    else {
      char v2 = MGGetBoolAnswer();
    }
    highTabCapacityDevice = v2;
    screenTimeManagementStateDidChangeNotification = (uint64_t)CFStringCreateWithCString(0, (const char *)*MEMORY[0x1E4F99D88], 0x600u);
    screenTimePasscodeStateDidChangeNotification = (uint64_t)CFStringCreateWithCString(0, (const char *)*MEMORY[0x1E4F99D90], 0x600u);
  }
}

- (void)_pruneExpiredScenes
{
  uint64_t v3 = [(Application *)self openSessions];
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_294);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(BrowserWindowController *)self->_browserWindowController removeWindowsNotMatchingSceneIDs:v4 supportsMultipleScenes:[(Application *)self supportsMultipleScenes]];
}

- (void)_connectToCyclerIfNecessary
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Multiple cyclers enabled. Only one will be used.", v2, v3, v4, v5, v6);
}

- (void)_addDefaultsObserver
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v4 = *MEMORY[0x1E4F786D0];
  uint64_t v51 = *MEMORY[0x1E4F785D8];
  uint64_t v52 = v4;
  uint64_t v5 = *MEMORY[0x1E4F78708];
  uint64_t v53 = *MEMORY[0x1E4F786E0];
  uint64_t v54 = v5;
  uint64_t v6 = *MEMORY[0x1E4F78748];
  uint64_t v55 = *MEMORY[0x1E4F78710];
  uint64_t v56 = v6;
  uint64_t v7 = *MEMORY[0x1E4F78818];
  uint64_t v57 = *MEMORY[0x1E4F78810];
  uint64_t v58 = v7;
  uint64_t v8 = *MEMORY[0x1E4F78828];
  uint64_t v59 = *MEMORY[0x1E4F78820];
  uint64_t v60 = v8;
  uint64_t v9 = *MEMORY[0x1E4F78838];
  uint64_t v61 = *MEMORY[0x1E4F78830];
  uint64_t v62 = v9;
  uint64_t v10 = *MEMORY[0x1E4F78848];
  uint64_t v63 = *MEMORY[0x1E4F78840];
  uint64_t v64 = v10;
  uint64_t v11 = *MEMORY[0x1E4F981F0];
  uint64_t v65 = *MEMORY[0x1E4F78850];
  uint64_t v66 = v11;
  uint64_t v12 = *MEMORY[0x1E4F78938];
  uint64_t v67 = *MEMORY[0x1E4F78898];
  uint64_t v68 = v12;
  uint64_t v13 = *MEMORY[0x1E4F789E0];
  uint64_t v69 = *MEMORY[0x1E4F78940];
  uint64_t v70 = v13;
  uint64_t v14 = *MEMORY[0x1E4F78A18];
  id v71 = @"DebugBarCollapsingBehavior";
  uint64_t v72 = v14;
  uint64_t v15 = *MEMORY[0x1E4F78758];
  uint64_t v73 = @"SpeculativeLoading";
  uint64_t v74 = v15;
  uint64_t v16 = *MEMORY[0x1E4F993B8];
  uint64_t v75 = *MEMORY[0x1E4F980E0];
  uint64_t v76 = v16;
  uint64_t v17 = *MEMORY[0x1E4F785E8];
  uint64_t v77 = *MEMORY[0x1E4F78860];
  uint64_t v78 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:28];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v44 + 1) + 8 * v22++) options:3 context:userDefaultsObserverContext];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v20);
  }

  long long v23 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v24 = *MEMORY[0x1E4F789A0];
  uint64_t v51 = *MEMORY[0x1E4F789C8];
  uint64_t v52 = v24;
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:2];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        [v23 addObserver:self forKeyPath:*(void *)(*((void *)&v40 + 1) + 8 * v29++) options:3 context:userDefaultsObserverContext];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v27);
  }

  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CB18], "webui_defaults");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v51 = *MEMORY[0x1E4FB6F30];
  v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v51, 1, 0);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v37;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(v31);
        }
        [v30 addObserver:self forKeyPath:*(void *)(*((void *)&v36 + 1) + 8 * v35++) options:3 context:userDefaultsObserverContext];
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v33);
  }
}

void __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138543362;
    long long v12 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v8), "UUIDString", v12);
        if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0)
        {
          uint64_t v10 = WBS_LOG_CHANNEL_PREFIXOther();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v12;
            uint64_t v20 = v9;
            _os_log_fault_impl(&dword_1E102C000, v10, OS_LOG_TYPE_FAULT, "WKWebsiteDataStore with identifier %{public}@ does not correspond to any Safari profile, deleting", buf, 0xCu);
          }
          uint64_t v11 = (void *)MEMORY[0x1E4F46710];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_238;
          v13[3] = &unk_1E6D77FE0;
          id v14 = v9;
          objc_msgSend(v11, "safari_removeDataStoreForProfileWithIdentifier:completionHandler:", v14, v13);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }
}

- (BOOL)usesDefaultBrowsingModeInAllWindows
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(Application *)self browserControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v7 isPrivateBrowsingEnabled] & 1) != 0
          || ([v7 isControlledByAutomation] & 1) != 0)
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 1;
  }
LABEL_13:

  return v8;
}

- (BOOL)usesPrivateBrowsingModeInAnyWindow
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(Application *)self browserControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isPrivateBrowsingEnabled])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_hasLockablePrivateTabsOpenInAnyWindow
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v2 = [(Application *)self browserControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = [*(id *)(*((void *)&v22 + 1) + 8 * i) tabController];
        long long v8 = [v7 pinnedTabsManager];
        long long v9 = [v8 privatePinnedTabs];
        uint64_t v10 = [v9 count];

        if (v10)
        {
LABEL_19:

          BOOL v16 = 1;
          goto LABEL_21;
        }
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v11 = objc_msgSend(v7, "privateTabs", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (![*(id *)(*((void *)&v18 + 1) + 8 * j) isBlank])
              {

                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_21:

  return v16;
}

- (void)setPrivateBrowsingRequiresAuthentication:(BOOL)a3
{
  if (a3) {
    self->_shouldPrivateBrowsingBeLockedIfPossible = 1;
  }
  [(Application *)self updateLockedPrivateBrowsingState];
}

- (void)unlockPrivateBrowsing
{
  if (self->_privateBrowsingLocked)
  {
    self->_shouldPrivateBrowsingBeLockedIfPossible = 0;
    [(Application *)self updateLockedPrivateBrowsingState];
  }
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_lockedPrivateBrowsingAuthenticationCompletionHandlers)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    lockedPrivateBrowsingAuthenticationCompletionHandlers = self->_lockedPrivateBrowsingAuthenticationCompletionHandlers;
    self->_lockedPrivateBrowsingAuthenticationCompletionHandlers = v5;
  }
  if (v4)
  {
    long long v7 = self->_lockedPrivateBrowsingAuthenticationCompletionHandlers;
    long long v8 = (void *)MEMORY[0x1E4E42950](v4);
    [(NSMutableArray *)v7 addObject:v8];
  }
  p_lockedPrivateBrowsingAuthenticationContext = &self->_lockedPrivateBrowsingAuthenticationContext;
  if (self->_lockedPrivateBrowsingAuthenticationContext)
  {
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXPrivateBrowsing();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[Application authenticateToUnlockPrivateBrowsingWithCompletionHandler:]();
    }
  }
  else
  {
    long long v11 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    uint64_t v12 = *p_lockedPrivateBrowsingAuthenticationContext;
    *p_lockedPrivateBrowsingAuthenticationContext = v11;

    uint64_t v13 = *p_lockedPrivateBrowsingAuthenticationContext;
    id v26 = 0;
    BOOL v14 = [(LAContext *)v13 canEvaluatePolicy:2 error:&v26];
    id v15 = v26;
    BOOL v16 = v15;
    if (v14)
    {
      v27[0] = &unk_1F3C737B8;
      long long v17 = _WBSLocalizedString();
      v27[1] = &unk_1F3C737D0;
      v28[0] = v17;
      long long v18 = _WBSLocalizedString();
      v28[1] = v18;
      long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

      long long v20 = WBS_LOG_CHANNEL_PREFIXPrivateBrowsing();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[Application authenticateToUnlockPrivateBrowsingWithCompletionHandler:]();
      }
      long long v21 = *p_lockedPrivateBrowsingAuthenticationContext;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke;
      v25[3] = &unk_1E6D77DB8;
      v25[4] = self;
      [(LAContext *)v21 evaluatePolicy:2 options:v19 reply:v25];
    }
    else
    {
      if (v15)
      {
        long long v22 = WBS_LOG_CHANNEL_PREFIXOther();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[Application authenticateToUnlockPrivateBrowsingWithCompletionHandler:](v22);
        }
      }
      long long v19 = [(NSMutableArray *)self->_lockedPrivateBrowsingAuthenticationCompletionHandlers firstObject];
      long long v23 = self->_lockedPrivateBrowsingAuthenticationCompletionHandlers;
      self->_lockedPrivateBrowsingAuthenticationCompletionHandlers = 0;

      long long v24 = *p_lockedPrivateBrowsingAuthenticationContext;
      *p_lockedPrivateBrowsingAuthenticationContext = 0;

      if (v19) {
        v19[2](v19, 0);
      }
    }
  }
}

void __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E6D77D90;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 752);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 752);
  *(void *)(v3 + 752) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 744);
  *(void *)(v5 + 744) = 0;

  id v7 = (void *)(a1 + 40);
  if (*(void *)(a1 + 40))
  {
    long long v8 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    [*(id *)(a1 + 32) unlockPrivateBrowsing];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v2;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void, BOOL))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13), *v7 == 0);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)applicationWillSuspend
{
  v4.receiver = self;
  v4.super_class = (Class)Application;
  [(Application *)&v4 applicationWillSuspend];
  self->_shouldReadDefaultsOnResume = 0;
  self->_willEnterSuspendedState = 1;
  uint64_t v3 = [MEMORY[0x1E4F98A70] standardStore];
  [v3 closeDatabase];
}

- (void)saveChangesToCloudHistoryStore
{
  cloudHistory = self->_cloudHistory;
  BOOL v3 = +[WBUFeatureManager accessLevel] == 2;
  [(WBSCloudHistoryServiceProtocol *)cloudHistory saveChangesBypassingThrottler:v3 completionHandler:&__block_literal_global_0];
}

void __45__Application_saveChangesToCloudHistoryStore__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __45__Application_saveChangesToCloudHistoryStore__block_invoke_cold_1(v3);
    }
  }
}

- (void)_updateKeyboardCorrectionLearningAllowed
{
  id v2 = [(Application *)self browserControllers];
  BOOL v3 = objc_msgSend(v2, "safari_firstObjectPassingTest:", &__block_literal_global_49);
  BOOL v4 = v3 == 0;

  id v5 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v5 setCorrectionLearningAllowed:v4];
}

uint64_t __55__Application__updateKeyboardCorrectionLearningAllowed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 configuration];
  uint64_t v3 = [v2 allowsKeyboardCorrectionLearning] ^ 1;

  return v3;
}

- (void)_applicationWillResignActive:(id)a3
{
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Application will resign active", v6, 2u);
  }
  if (!self->_resigningActive)
  {
    self->_resigningActive = 1;
    [(Application *)self saveChangesToCloudHistoryStore];
    id v5 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    [v5 setSuspended:1];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Application did enter background", buf, 2u);
  }
  +[ApplicationShortcutController updateShortcutItemsIfNeeded];
  [(Application *)self _performBookmarksDatabaseTasksInBackground];
  [(Application *)self _reportBookmarksDatabaseHealth];
  id v5 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v5 setUsesOpportunisticPushTopic:1];

  uint64_t v6 = MEMORY[0x1E4F98C78];
  id v7 = [MEMORY[0x1E4F78558] settings];
  +[WBSParsecDSession sendSuspendFeedbackWithEvent:isPrivate:](v6, 23, [v7 hasPrivateBrowsingWindow]);

  [(BrowserWindowController *)self->_browserWindowController updateCloudTabsForEnteringBackground];
  [(Application *)self _suspendOrResumeWallpaperAnimationIfNeeded];
  long long v8 = [MEMORY[0x1E4F3B0A8] sharedController];
  [v8 savePendingChanges];

  [MEMORY[0x1E4F78278] applicationDidEnterBackground];
  id v9 = self->_activeDownloads;
  activeDownloads = self->_activeDownloads;
  self->_activeDownloads = 0;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = v9;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
        long long v17 = [MEMORY[0x1E4F3AF68] sharedManager];
        int v18 = [v17 shouldExcludeDownloadFromList:v16];

        if (v18) {
          [v16 cancel];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v13);
  }

  [(Application *)self updateShouldLockPrivateBrowsingWithTimerIfNecessary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = [(Application *)self allWebExtensionsControllers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v23++) didDeactivateWindow];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v21);
  }

  long long v24 = [(Application *)self tabGroupManager];
  [v24 disableDevicePresenceReporting];

  long long v25 = [MEMORY[0x1E4F98E50] sharedInstance];
  [v25 donatePendingTabDataNowWithCompletionHandler:0];
}

- (void)_reportBookmarksDatabaseHealth
{
  bookmarksDatabaseHealthReporter = self->_bookmarksDatabaseHealthReporter;
  if (!bookmarksDatabaseHealthReporter)
  {
    BOOL v4 = objc_alloc_init(BookmarksDatabaseHealthReporter);
    id v5 = self->_bookmarksDatabaseHealthReporter;
    self->_bookmarksDatabaseHealthReporter = v4;

    bookmarksDatabaseHealthReporter = self->_bookmarksDatabaseHealthReporter;
  }
  [(BookmarksDatabaseHealthReporter *)bookmarksDatabaseHealthReporter reportDatabaseHealth];
}

- (void)_performBookmarksDatabaseTasksInBackground
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  BOOL v4 = (void *)v3;
  if (self->_bookmarksDatabaseBackgroundTaskIdentifier == *MEMORY[0x1E4FB2748] && v3 != 0)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Performing bookmarks database background tasks", buf, 2u);
    }
    id v7 = (WBDatabaseLockAcquisitor *)[objc_alloc(MEMORY[0x1E4FB6068]) initWithWebBookmarkCollectionClass:objc_opt_class()];
    bookmarksDatabaseBackgroundTaskLockAcquisitor = self->_bookmarksDatabaseBackgroundTaskLockAcquisitor;
    self->_bookmarksDatabaseBackgroundTaskLockAcquisitor = v7;

    [(WBDatabaseLockAcquisitor *)self->_bookmarksDatabaseBackgroundTaskLockAcquisitor setDelegate:self];
    id v9 = (void *)*MEMORY[0x1E4FB2608];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke;
    v15[3] = &unk_1E6D77E20;
    v15[4] = self;
    self->_bookmarksDatabaseBackgroundTaskIdentifier = [v9 beginBackgroundTaskWithName:@"com.apple.mobilesafari.PerformBookmarksDatabaseTasks" expirationHandler:v15];
    uint64_t v10 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    int v11 = [v10 hasInMemoryChanges];

    double v12 = 0.0;
    if (v11)
    {
      uint64_t v13 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v13 didEnterBackgroundWithBookmarksInMemory];

      double v12 = 10.0;
    }
    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = v12;
      _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to acquire bookmark lock to perform background tasks with timeout %f", buf, 0xCu);
    }
    [(WBDatabaseLockAcquisitor *)self->_bookmarksDatabaseBackgroundTaskLockAcquisitor acquireLockWithTimeout:v12];
    [(Application *)self _saveFrequentlyVisitedListsToDatabaseIfNeeded];
  }
}

uint64_t __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke_cold_1();
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 528) releaseLock];
  uint64_t v4 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(a1 + 32) + 520) != *MEMORY[0x1E4FB2748])
  {
    uint64_t result = objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
    *(void *)(*(void *)(a1 + 32) + 520) = v4;
  }
  return result;
}

- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke;
  v11[3] = &unk_1E6D77E20;
  v11[4] = self;
  uint64_t v6 = (void (**)(void))MEMORY[0x1E4E42950](v11, a2, a3);
  id v7 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  long long v8 = v7;
  if (a4)
  {
    [v7 applyInMemoryChangesToDatabase];

    [(Application *)self reloadReadingListWidgetIfNeeded];
    v6[2](v6);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke_2;
    v9[3] = &unk_1E6D77E70;
    uint64_t v10 = v6;
    [v8 persistChangesWithCompletion:v9];
  }
}

uint64_t __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 528) releaseLock];
  uint64_t v3 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(a1 + 32) + 520) != *MEMORY[0x1E4FB2748])
  {
    uint64_t result = objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
    *(void *)(*(void *)(a1 + 32) + 520) = v3;
  }
  return result;
}

uint64_t __51__Application_databaseLockAcquisitor_acquiredLock___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v2 didSaveInMemoryBookmarksToSideFile];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)_saveFrequentlyVisitedListsToDatabaseIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_pendingFrequentlyVisitedSites)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    uint64_t v3 = (void *)*MEMORY[0x1E4FB2608];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke;
    v20[3] = &unk_1E6D77CE0;
    v20[4] = &v21;
    uint64_t v4 = [v3 beginBackgroundTaskWithName:@"com.apple.mobilesafari.PerformFrequentlyVisitedSitesTasks" expirationHandler:v20];
    v22[3] = v4;
    id v5 = dispatch_group_create();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = self->_pendingFrequentlyVisitedSites;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          dispatch_group_enter(v5);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_80;
          v14[3] = &unk_1E6D77E20;
          uint64_t v15 = v5;
          [v10 saveFrequentlyVisitedSitesToBookmarksDBWithCompletion:v14];
        }
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v7);
    }

    int v11 = [(Application *)self tabGroupManager];
    [v11 disableSuddenTerminationForPendingChanges];

    pendingFrequentlyVisitedSites = self->_pendingFrequentlyVisitedSites;
    self->_pendingFrequentlyVisitedSites = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_2;
    block[3] = &unk_1E6D77CE0;
    void block[4] = &v21;
    dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(&v21, 8);
  }
}

void __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_cold_1();
  }
  uint64_t v3 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  }
}

void __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_80(uint64_t a1)
{
}

uint64_t __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    uint64_t v2 = result;
    uint64_t result = objc_msgSend((id)*MEMORY[0x1E4FB2608], "endBackgroundTask:");
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = v1;
  }
  return result;
}

- (void)didReceiveMemoryWarning
{
  performBlockForBrowserControllers(&__block_literal_global_83);
  v3.receiver = self;
  v3.super_class = (Class)Application;
  [(Application *)&v3 didReceiveMemoryWarning];
}

uint64_t __38__Application_didReceiveMemoryWarning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didReceiveMemoryWarning];
}

+ (unint64_t)systemMemorySize
{
  if (systemMemorySize___once != -1) {
    dispatch_once(&systemMemorySize___once, &__block_literal_global_87);
  }
  return systemMemorySize_systemPhysicalMemorySize;
}

void __31__Application_systemMemorySize__block_invoke()
{
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)host_info_out = 0u;
  host_t v0 = MEMORY[0x1E4E425F0]();
  mach_msg_type_number_t host_info_outCnt = 12;
  mach_error_t v1 = host_info(v0, 1, host_info_out, &host_info_outCnt);
  mach_port_deallocate(*MEMORY[0x1E4F14960], v0);
  if (v1)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __31__Application_systemMemorySize__block_invoke_cold_1(v2, v1);
    }
  }
  double v3 = log2((double)*((unint64_t *)&v7 + 1));
  systemMemorySize_systemPhysicalMemorySize = (unint64_t)exp2(ceil(v3));
}

- (void)handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1) {
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_1082);
  }
  if (!useUIResponderMethodsForModifierFlags_flag) {
    self->_currentKeyboardModifierFlags = [v4 _modifierFlags];
  }
  v5.receiver = self;
  v5.super_class = (Class)Application;
  [(Application *)&v5 handleKeyUIEvent:v4];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1) {
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_1082);
  }
  if (useUIResponderMethodsForModifierFlags_flag) {
    self->_currentKeyboardModifierFlags = [v7 modifierFlags];
  }
  v8.receiver = self;
  v8.super_class = (Class)Application;
  [(Application *)&v8 pressesBegan:v6 withEvent:v7];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1) {
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_1082);
  }
  if (useUIResponderMethodsForModifierFlags_flag) {
    self->_currentKeyboardModifierFlags = [v7 modifierFlags];
  }
  v8.receiver = self;
  v8.super_class = (Class)Application;
  [(Application *)&v8 pressesChanged:v6 withEvent:v7];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1) {
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_1082);
  }
  if (useUIResponderMethodsForModifierFlags_flag) {
    self->_currentKeyboardModifierFlags = [v7 modifierFlags];
  }
  v8.receiver = self;
  v8.super_class = (Class)Application;
  [(Application *)&v8 pressesEnded:v6 withEvent:v7];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (useUIResponderMethodsForModifierFlags_onceToken != -1) {
    dispatch_once(&useUIResponderMethodsForModifierFlags_onceToken, &__block_literal_global_1082);
  }
  if (useUIResponderMethodsForModifierFlags_flag) {
    self->_currentKeyboardModifierFlags = [v7 modifierFlags];
  }
  v8.receiver = self;
  v8.super_class = (Class)Application;
  [(Application *)&v8 pressesCancelled:v6 withEvent:v7];
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)Application;
  [(Application *)&v11 buildMenuWithBuilder:v4];
  objc_super v5 = [v4 system];
  id v6 = [MEMORY[0x1E4FB1998] mainSystem];

  if (v5 == v6)
  {
    id v7 = [MEMORY[0x1E4F781F8] sharedProvider];
    objc_super v8 = [(Application *)self _sortedBrowserControllers];
    id v9 = [v8 firstObject];
    uint64_t v10 = [v9 rootViewController];
    objc_msgSend(v7, "setAlwaysAllowWebInterception:", objc_msgSend(v10, "isInYttriumMode"));

    [v7 setMenusForSafariWithBuilder:v4];
  }
}

- (void)_reloadSearchEngines
{
  id v2 = [MEMORY[0x1E4F3B060] sharedInstance];
  [v2 reloadSearchEngines];
}

- (void)_managedProfileConfigurationDidUpdate
{
}

void __52__Application__managedProfileConfigurationDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateJavaScriptPreferences];
  [v2 fraudWarningsToggled];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if ((void *)userDefaultsObserverContext == a6)
  {
    uint64_t v12 = *MEMORY[0x1E4F284E0];
    id v13 = a5;
    uint64_t v11 = [v13 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    if (v11 | v14 && ([(id)v11 isEqual:v14] & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E6D77D90;
      id v16 = v10;
      long long v17 = self;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)Application;
    uint64_t v11 = (uint64_t)a5;
    [(Application *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

void __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F981F0]])
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:*MEMORY[0x1E4F99640] object:0];
LABEL_3:

    return;
  }
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F789C8]]
    || [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F789A0]])
  {
    id v2 = *(void **)(a1 + 40);
    [v2 _reloadSearchEngines];
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F980E0]])
    {
      uint64_t v4 = *MEMORY[0x1E4F993B8];
      if (![*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F993B8]])
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v6[3] = &unk_1E6D77EB8;
        id v7 = *(id *)(a1 + 32);
        performBlockForBrowserControllers(v6);

        return;
      }
      objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setPrivateBrowsingRequiresAuthentication:", objc_msgSend(v5, "BOOLForKey:", v4));
      goto LABEL_3;
    }
    double v3 = *(void **)(a1 + 40);
    [v3 _didEnableCustomizationSync];
  }
}

uint64_t __62__Application_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 userDefaultsDidChangeValueForKey:*(void *)(a1 + 32)];
}

- (unint64_t)_numberOfTabsForPrivateBrowsing:(BOOL)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__Application__numberOfTabsForPrivateBrowsing___block_invoke;
  v5[3] = &unk_1E6D77EE0;
  v5[4] = &v7;
  BOOL v6 = a3;
  performBlockForBrowserControllers(v5);
  unint64_t v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __47__Application__numberOfTabsForPrivateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 tabController];
  id v5 = v3;
  if (*(unsigned char *)(a1 + 40)) {
    [v3 privateTabs];
  }
  else {
  uint64_t v4 = [v3 normalTabs];
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v4 count];
}

- (BOOL)canAddNewTabForPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [(Application *)self primaryBrowserController];
    int v6 = [v5 isPrivateBrowsingAvailable];

    if (!v6) {
      return 0;
    }
  }
  unint64_t v7 = [(Application *)self _numberOfTabsForPrivateBrowsing:v3];
  return v7 < [(Application *)self maximumTabCount];
}

- (AutomationController)automationController
{
  automationController = self->_automationController;
  if (!automationController)
  {
    uint64_t v4 = objc_alloc_init(AutomationController);
    id v5 = self->_automationController;
    self->_automationController = v4;

    automationController = self->_automationController;
  }
  return automationController;
}

id __52__Application__prewarmAutomationControllerIfEnabled__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[90])
  {
    BOOL v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 removeObserver:*(void *)(*(void *)(a1 + 32) + 720) name:*MEMORY[0x1E4F3B130] object:0];

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 720);
    *(void *)(v4 + 720) = 0;

    id v2 = *(void **)(a1 + 32);
  }
  return (id)[v2 automationController];
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)Application;
  -[Application _handleHIDEvent:](&v8, sel__handleHIDEvent_);
  id v5 = [(AutomationController *)self->_automationController automationSession];

  if (v5)
  {
    int v6 = [NSClassFromString((NSString *)@"_WKTouchEventGenerator") sharedTouchEventGenerator];
    unint64_t v7 = v6;
    if (v6) {
      [v6 receivedHIDEvent:a3];
    }
  }
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1)
{
  mach_error_t v1 = [*(id *)(a1 + 32) _systemNavigationAction];

  if (!v1)
  {
    performBlockForBrowserControllers(&__block_literal_global_167);
  }
}

uint64_t __57__Application_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateSourceApplication];
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_4;
  block[3] = &unk_1E6D77E20;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_4(uint64_t a1)
{
  mach_error_t v1 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F990A0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = SafariHistoryCloudBackupIndicatorFileURL();
    if ([v5 BOOLValue])
    {
      BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v3 removeItemAtURL:v2 error:0];
    }
    else
    {
      id v4 = fopen((const char *)[v2 fileSystemRepresentation], "w");
      fclose(v4);
    }
  }
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 userInfo];
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:", *MEMORY[0x1E4F99768]);

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 postNotificationName:*MEMORY[0x1E4F997F0] object:0];
  }
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_6()
{
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 activeWebExtensionWindow];
  [v2 validateExtensionToolbarItemsInWindow:v3];
}

void __57__Application_application_didFinishLaunchingWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x1E4F99460]);

  if (v5)
  {
    id v6 = [v3 userInfo];
    unint64_t v7 = objc_msgSend(v6, "safari_stringForKey:", *MEMORY[0x1E4F99468]);

    objc_super v8 = [*(id *)(a1 + 32) webExtensionsControllerForProfileServerID:v7];
    uint64_t v9 = [v8 webExtensionForComposedIdentifier:v5];
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) browserControllers];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__Application_application_didFinishLaunchingWithOptions___block_invoke_9;
      v12[3] = &unk_1E6D77F50;
      id v13 = v7;
      uint64_t v11 = objc_msgSend(v10, "safari_firstObjectPassingTest:", v12);

      if (v11)
      {
        [v11 webExtensionWasRemotelyEnabled:v9];
        [v8 remotelyEnabledExtensionBannerWasShownForComposedIdentifier:v5];
      }
    }
  }
}

uint64_t __57__Application_application_didFinishLaunchingWithOptions___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = [a2 activeProfile];
  id v4 = [v3 identifierForExtensions];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __57__Application_application_didFinishLaunchingWithOptions___block_invoke_11()
{
  return [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
}

id __57__Application_application_didFinishLaunchingWithOptions___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXPush();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138739971;
    id v7 = v2;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Handling web push action %{sensitive}@ with default data store", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");

  return v4;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  uint64_t v9 = [v7 actionIdentifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F446D0]];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F467D0] _webPushActionWithNotificationResponse:v7];
    if (v11)
    {
      uint64_t v12 = [v7 notification];
      id v13 = [v12 sourceIdentifier];
      int v14 = [v13 hasPrefix:@"com.apple.WebKit.PushBundle."];

      if (v14)
      {
        long long v29 = self;
        uint64_t v15 = [v7 notification];
        id v16 = [v15 sourceIdentifier];
        long long v17 = [v16 substringFromIndex:28];

        objc_super v18 = NSString;
        long long v19 = objc_msgSend(v17, "substringWithRange:", 0, 8);
        uint64_t v20 = objc_msgSend(v17, "substringWithRange:", 8, 4);
        uint64_t v21 = objc_msgSend(v17, "substringWithRange:", 12, 4);
        uint64_t v22 = objc_msgSend(v17, "substringWithRange:", 16, 4);
        uint64_t v23 = objc_msgSend(v17, "substringWithRange:", 20, 12);
        uint64_t v24 = [v18 stringWithFormat:@"%@-%@-%@-%@-%@", v19, v20, v21, v22, v23];

        long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v24];
        if (v25)
        {
          uint64_t v26 = WBS_LOG_CHANNEL_PREFIXWebClips();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543619;
            long long v31 = v25;
            __int16 v32 = 2117;
            id v33 = v7;
            _os_log_impl(&dword_1E102C000, v26, OS_LOG_TYPE_DEFAULT, "Activating clip with identifier %{public}@ in response to notification response %{sensitive}@", buf, 0x16u);
          }
          long long v27 = [(Application *)v29 _sortedBrowserControllers];
          long long v28 = [v27 firstObject];

          [v28 activateWebClipWithID:v25];
        }
      }
    }
  }
  [MEMORY[0x1E4F46710] handleNotificationResponse:v7];
  v8[2](v8);
}

- (void)webClipCacheDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F3AF08], "sharedWebClipCache", a3);
  uint64_t v5 = [v4 webClipURLs];

  if (v5)
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
    [v6 _setPersistedSites:v5];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__Application_webClipCacheDidChange___block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__Application_webClipCacheDidChange___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mach_error_t v1 = objc_msgSend(*(id *)(a1 + 32), "browserControllers", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) webClipCacheDidChange];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)tabGroupManager:(id)a3 didInsertProfileWithIdentifier:(id)a4
{
  [(Application *)self prewarmAndRemoveOrphanedProfileDataStores];
  [(Application *)self _setWKWebsiteDataStoreDelegate];
}

void __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_238(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_238_cold_1(a1, v4);
    }
  }
}

- (WKProcessPool)defaultProcessPool
{
  return (WKProcessPool *)[(Application *)self processPoolForProfileIdentifier:*MEMORY[0x1E4F980C8]];
}

uint64_t __69__Application__createExtensionControllersIfNeededForProfileServerID___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addContentRuleList:a2];
  }
  return result;
}

- (void)_deleteExtensionControllersForProfileServerID:(id)a3
{
  id v4 = a3;
  id v7 = [(Application *)self webExtensionsControllerForProfileServerID:v4];
  uint64_t v5 = [(Application *)self contentBlockerManagerForProfileServerID:v4];
  [v7 unloadAndDeleteStateForAllExtensions];
  [v5 unloadAndDeleteStateForAllExtensions];
  long long v6 = [MEMORY[0x1E4F98A18] sharedManager];
  [v6 removeProvider:v7];
  [v6 removeProvider:v5];
  [v6 localExtensionStateDidChange];
  [(NSMutableDictionary *)self->_profileServerIDToWebExtensionsControllers setObject:0 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_profileServerIDToContentBlockerManagers setObject:0 forKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_profileServerIDToUserContentController setObject:0 forKeyedSubscript:v4];
}

- (void)reloadContentBlockers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Reloading content blockers due to distributed notification", buf, 2u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(Application *)self allContentBlockerManagers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 reloadUserContentControllerReadingStateFromDisk:1];
        [v9 informObserversThatContentBlockerManagerExtensionListDidChange];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)notifyExtensionControllersThatSettingsWereUpdatedExternallyFromSettingsApp
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(Application *)self allWebExtensionsControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) extensionSettingsWereUpdatedExternallyFromSettingsApp:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __45__Application__showSearchEngineAlertIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SAFARI&path=SEARCH_ENGINE_SETTING"];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v2 openSensitiveURL:v3 withOptions:0];
  }
}

void __41__Application__reportLaunchAnalyticsSoon__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  +[WBSParsecDSession sendLaunchFeedbackWithEvent:isPrivate:usesLoweredSearchBar:](MEMORY[0x1E4F98C78], 7, *(unsigned char *)(a1 + 48), [*(id *)(a1 + 32) usesLoweredSearchBar]);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = objc_msgSend(v3, "safari_normalizedVersion");
  [v2 registerSafariVersion:v4 persona:3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__Application__reportLaunchAnalyticsSoon__block_invoke_2;
  block[3] = &unk_1E6D77D90;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v46 = v5;
  uint64_t v47 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
  long long v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v8 = objc_msgSend(v7, "safari_isJavaScriptEnabled");
  uint64_t v9 = [v7 BOOLForKey:*MEMORY[0x1E4F789E0]];
  long long v39 = v7;
  uint64_t v10 = [v7 BOOLForKey:@"DisableWebsiteSpecificSearch"] ^ 1;
  long long v11 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  uint64_t v12 = objc_msgSend(v11, "webui_safariCookieAcceptPolicyEnumValue");

  uint64_t v40 = a1;
  [*(id *)(a1 + 40) reportUserPreferencesOnLaunchForJavaScriptEnabled:v8 safeBrowsingEnabled:v9 siteSpecificSearchEnabled:v10 trackingPolicy:v12];
  long long v13 = (void *)[&unk_1F3C73C80 mutableCopy];
  int v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v15 = [MEMORY[0x1E4F46688] _experimentalFeatures];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v21 = [v20 key];
        uint64_t v22 = [v13 objectForKeyedSubscript:v21];

        if (v22)
        {
          uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_keyForWebKitFeature:", v20);
          uint64_t v24 = [v14 objectForKey:v23];
          long long v25 = [v20 key];
          [v13 setObject:v24 forKeyedSubscript:v25];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v17);
  }

  long long v38 = *(void **)(v40 + 40);
  uint64_t v26 = [v13 objectForKeyedSubscript:@"WebXREnabled"];
  uint64_t v27 = [v26 BOOLValue];
  long long v28 = [v13 objectForKeyedSubscript:@"WebXRGamepadsModuleEnabled"];
  uint64_t v29 = [v28 BOOLValue];
  long long v30 = [v13 objectForKeyedSubscript:@"WebXRHandInputModuleEnabled"];
  uint64_t v31 = [v30 BOOLValue];
  __int16 v32 = [v13 objectForKeyedSubscript:@"ModelElementEnabled"];
  objc_msgSend(v38, "reportExperimentalFeaturesOnLaunchForWebXREnabled:webXRGamepadsModuleEnabled:webXRHandInputModuleEnabled:modelElementEnabled:", v27, v29, v31, objc_msgSend(v32, "BOOLValue"));

  id v33 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  uint64_t v34 = [v33 preferredCapsuleLayoutStyle];

  int v35 = [v39 BOOLForKey:*MEMORY[0x1E4F786D0]];
  if ((_SFDeviceIsPad() & 1) == 0) {
    objc_msgSend(*(id *)(v40 + 40), "_sf_reportCapsuleLayoutStyle:backgroundColorInTabBarEnabled:", v34, v35 ^ 1u);
  }
  long long v36 = *(void **)(v40 + 40);
  uint64_t v37 = [*(id *)(v40 + 32) webExtensionsControllerForProfileServerID:*MEMORY[0x1E4F980C8]];
  objc_msgSend(v36, "_sf_performExtensionsReportIfNecessaryWithExtensionsController:", v37);

  [*(id *)(v40 + 40) schedulePeriodicTabGroupsReport];
  [*(id *)(v40 + 40) schedulePeriodicPrivateBrowsingReport];
  [*(id *)(v40 + 40) schedulePeriodicSettingsReport];
  [*(id *)(v40 + 40) schedulePeriodicWebClipsReport];
  [*(id *)(v40 + 40) scheduleBrowsingAssistantReport];
  if (WBSIsiPad()) {
    [*(id *)(v40 + 40) schedulePeriodicStandaloneTabBarReport];
  }
}

uint64_t __41__Application__reportLaunchAnalyticsSoon__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [MEMORY[0x1E4F98998] automaticTabClosingInterval];
  id v3 = WBSAutomaticTabClosingIntervalAnalyticsTitle();
  [v2 reportAutomaticTabClosingInterval:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F98000]);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(v5 + 712);
  *(void *)(v5 + 712) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 712), "setDelegate:");
  long long v7 = *(void **)(*(void *)(a1 + 40) + 712);
  return [v7 schedulePeriodicReport];
}

- (void)applicationWillTerminate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(BrowserWindowController *)self->_browserWindowController saveBrowserState];
  id v3 = [MEMORY[0x1E4F98D50] sharedController];
  [v3 savePendingChangesBeforeTermination];

  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  if (objc_opt_respondsToSelector()) {
    [v4 unregisterObserver:self];
  }
  else {
    [v4 removeObserver:self];
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"AppleKeyboardsPreferencesChangedNotification" object:0];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4F1D200], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F23E80], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobilesafari.AutoFillStateChanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobilesafari.QuickWebsiteSearchProvidersDidChange", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F3B0C8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)screenTimeManagementStateDidChangeNotification, 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)screenTimePasscodeStateDidChangeNotification, 0);
  uint64_t v8 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v8 removeObserver:self];

  +[WebBookmarkCollection stopObservingDatabaseVacuumNotification]();
  [(WBSFormAutoFillCorrectionsHistoryObserver *)self->_formAutoFillCorrectionsHistoryObserver flushPendingChangesAndDisconnectFromStoreAndHistory];
  uint64_t v9 = MEMORY[0x1E4F98C78];
  uint64_t v10 = [MEMORY[0x1E4F78558] settings];
  +[WBSParsecDSession sendSuspendFeedbackWithEvent:isPrivate:](v9, 1, [v10 hasPrivateBrowsingWindow]);

  long long v11 = [MEMORY[0x1E4F97FB8] sharedProxy];
  [v11 setUsesOpportunisticPushTopic:1];

  [(WBSBackgroundImageAssetController *)self->_backgroundImageAssetController savePendingChangesBeforeTermination];
  uint64_t v12 = [MEMORY[0x1E4F98A70] standardStore];
  [v12 closeDatabase];

  long long v13 = [MEMORY[0x1E4F3B0A8] sharedController];
  [v13 savePendingChangesBeforeTermination];

  int v14 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  [v14 savePendingProviderChangesBeforeTermination];

  uint64_t v15 = [MEMORY[0x1E4FB6ED8] sharedCreditCardDataController];
  [v15 savePendingChangesBeforeTermination];

  uint64_t v16 = [MEMORY[0x1E4F3AF68] sharedManager];
  [v16 savePendingChangesBeforeTermination];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = [(Application *)self allContentBlockerManagers];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v21++) savePendingChangesBeforeTermination];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

  uint64_t v22 = [MEMORY[0x1E4F98A08] sharedManager];
  [v22 savePendingChangesBeforeTermination];
}

- (void)_export30DaysWorthOfHistoryAfterUpgrade
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to donate 30 days of history to Core Spotlight", v2, v3, v4, v5, v6);
}

void __54__Application__export30DaysWorthOfHistoryAfterUpgrade__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F98E50] sharedInstance];
  uint64_t v3 = [*(id *)(a1 + 32) historiesForProfiles];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__Application__export30DaysWorthOfHistoryAfterUpgrade__block_invoke_2;
  v4[3] = &unk_1E6D77C20;
  id v5 = *(id *)(a1 + 40);
  [v2 export30DaysWorthOfHistoryToCoreSpotlightForProfiles:v3 completionHandler:v4];
}

uint64_t __54__Application__export30DaysWorthOfHistoryAfterUpgrade__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setBool:1 forKey:@"didMigrateHistoryToCoreSpotlightAfterUpgrade"];
  }
  return result;
}

- (void)_downloadDidStartNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  activeDownloads = self->_activeDownloads;
  id v8 = (id)v4;
  if (activeDownloads)
  {
    [(NSMutableArray *)activeDownloads addObject:v4];
  }
  else
  {
    uint8_t v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
    long long v7 = self->_activeDownloads;
    self->_activeDownloads = v6;
  }
}

- (void)_downloadDidStopNotification:(id)a3
{
  id v5 = [a3 object];
  -[NSMutableArray removeObject:](self->_activeDownloads, "removeObject:");
  if (![(NSMutableArray *)self->_activeDownloads count])
  {
    activeDownloads = self->_activeDownloads;
    self->_activeDownloads = 0;
  }
}

- (id)savedAccountContextForWebPageID:(unint64_t)a3
{
  uint64_t v4 = [(Application *)self browserControllers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__Application_savedAccountContextForWebPageID___block_invoke;
  v10[3] = &__block_descriptor_40_e27_B16__0__BrowserController_8l;
  v10[4] = a3;
  id v5 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v10);

  if (v5 && ([v5 isInDefaultProfile] & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F97FC0]);
    id v8 = [v5 activeProfileIdentifier];
    uint8_t v6 = (void *)[v7 initWithSafariProfileIdentifier:v8];
  }
  else
  {
    uint8_t v6 = [MEMORY[0x1E4F97FC0] defaultContext];
  }

  return v6;
}

BOOL __47__Application_savedAccountContextForWebPageID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 tabController];
  uint64_t v4 = [v3 tabDocuments];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__Application_savedAccountContextForWebPageID___block_invoke_2;
  v8[3] = &__block_descriptor_40_e21_B16__0__TabDocument_8l;
  v8[4] = *(void *)(a1 + 32);
  id v5 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v8);
  BOOL v6 = v5 != 0;

  return v6;
}

BOOL __47__Application_savedAccountContextForWebPageID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 webPageID] == *(void *)(a1 + 32);
}

- (id)createRecommendationMediatorOrReuseExistingOneIfPossible
{
  uint64_t v3 = [(Application *)self existingForYouRecommendationMediator];
  if (!v3)
  {
    uint64_t v4 = [ForYouRecommendationMediator alloc];
    id v5 = +[Application contextClient];
    BOOL v6 = +[FeatureManager sharedFeatureManager];
    uint64_t v3 = [(ForYouRecommendationMediator *)v4 initWithContextClient:v5 featureManager:v6 historyProvider:&__block_literal_global_303];

    [(Application *)self setExistingForYouRecommendationMediator:v3];
  }
  id v7 = v3;

  return v7;
}

id __71__Application_createRecommendationMediatorOrReuseExistingOneIfPossible__block_invoke()
{
  return +[History sharedHistory];
}

- (WBSForYouRecentParsecResultsManager)forYouRecentParsecResultsManager
{
  forYouRecentParsecResultsManager = self->_forYouRecentParsecResultsManager;
  if (!forYouRecentParsecResultsManager)
  {
    uint64_t v4 = (WBSForYouRecentParsecResultsManager *)objc_alloc_init(MEMORY[0x1E4F98B20]);
    id v5 = self->_forYouRecentParsecResultsManager;
    self->_forYouRecentParsecResultsManager = v4;

    forYouRecentParsecResultsManager = self->_forYouRecentParsecResultsManager;
  }
  return forYouRecentParsecResultsManager;
}

- (NSSet)historiesForProfiles
{
  uint64_t v3 = [(WBTabGroupManager *)self->_tabGroupManager allProfileIdentifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__Application_historiesForProfiles__block_invoke;
  v6[3] = &unk_1E6D78170;
  void v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v6);

  return (NSSet *)v4;
}

id __35__Application_historiesForProfiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 historyController];
  id v5 = [v4 historyForProfileIdentifier:v3 loadIfNeeded:1];

  return v5;
}

- (WBSSafariScribbleFeedbackSyncEngine)scribbleFeedbackSyncEngine
{
  scribbleFeedbackSyncEngine = self->_scribbleFeedbackSyncEngine;
  if (!scribbleFeedbackSyncEngine)
  {
    uint64_t v4 = (WBSSafariScribbleFeedbackSyncEngine *)objc_alloc_init(MEMORY[0x1E4F98DC0]);
    id v5 = self->_scribbleFeedbackSyncEngine;
    self->_scribbleFeedbackSyncEngine = v4;

    scribbleFeedbackSyncEngine = self->_scribbleFeedbackSyncEngine;
  }
  return scribbleFeedbackSyncEngine;
}

- (WBTabGroupManager)ephemeralTabGroupManager
{
  ephemeralTabGroupManager = self->_ephemeralTabGroupManager;
  if (!ephemeralTabGroupManager)
  {
    uint64_t v4 = [MEMORY[0x1E4FB60C0] ephemeralTabGroupManager];
    id v5 = self->_ephemeralTabGroupManager;
    self->_ephemeralTabGroupManager = v4;

    ephemeralTabGroupManager = self->_ephemeralTabGroupManager;
  }
  return ephemeralTabGroupManager;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  scribbleQuirksManager = self->_scribbleQuirksManager;
  if (!scribbleQuirksManager)
  {
    uint64_t v4 = (WBSScribbleQuirksManager *)objc_opt_new();
    id v5 = self->_scribbleQuirksManager;
    self->_scribbleQuirksManager = v4;

    scribbleQuirksManager = self->_scribbleQuirksManager;
  }
  return scribbleQuirksManager;
}

- (NSArray)cachedUserContentControllersForAllProfiles
{
  return (NSArray *)[(NSMutableDictionary *)self->_profileServerIDToUserContentController allValues];
}

- (void)downloadDidFinish:(id)a3
{
  id v3 = a3;
  tabDocumentForDownload(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 downloadDidFinish:v3];
}

- (void)downloadDidFail:(id)a3
{
  id v3 = a3;
  tabDocumentForDownload(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 downloadDidFail:v3];
}

- (void)downloadDidStart:(id)a3
{
  id v3 = a3;
  tabDocumentForDownload(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 downloadDidStart:v3];
}

- (void)downloadDidReceiveResponse:(id)a3
{
  id v6 = a3;
  if ([v6 explicitlySaved])
  {
    id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v4 = [v6 mimeType];
    id v5 = [v6 uti];
    objc_msgSend(v3, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v4, v5, 1, 0, 0);
  }
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  id v11 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  id v6 = tabDocumentForDownload(v11);
  id v7 = v6;
  if (v6)
  {
    [v6 downloadShouldContinueAfterReceivingResponse:v11 decisionHandler:v5];
  }
  else
  {
    if (([v11 explicitlySaved] & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F97E48] sharedLogger];
      uint64_t v9 = [v11 mimeType];
      uint64_t v10 = [v11 uti];
      objc_msgSend(v8, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v9, v10, 0, 0, 0);
    }
    v5[2](v5, 1);
  }
}

- (BOOL)isCloudHistoryEnabled
{
  return self->_cloudHistory != 0;
}

void __48__Application__resetCloudHistoryAccountIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__Application__resetCloudHistoryAccountIfNeeded__block_invoke_cold_1(v3);
    }
  }
}

- (void)_updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_cloudHistory)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(Application *)self tabGroupManager];
    id v5 = [v4 namedProfiles];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 bookmark];
          uint64_t v12 = [v11 serverID];

          if (v12)
          {
            long long v13 = [v10 identifier];
            [v3 setObject:v12 forKeyedSubscript:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [(WBSCloudHistoryServiceProtocol *)self->_cloudHistory updateProfileLocalIdentifiersToServerIdentifiersMap:v3 completionHandler:&__block_literal_global_325];
  }
}

void __81__Application__updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __81__Application__updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory__block_invoke_cold_1(v3);
    }
  }
}

- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 profileWithIdentifier:v7];
  uint64_t v9 = [v8 identifierForExtensions];

  if (v9) {
    [(Application *)self _deleteExtensionControllersForProfileServerID:v9];
  }
  uint64_t v10 = [(BrowserWindowController *)self->_browserWindowController perSitePreferencesVendor];
  id v11 = [v10 profilePreferenceManager];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F98BB8] sharedController];
    [v12 removeIgnoredSiriSuggestedSitesInProfile:v7];

    long long v13 = [v11 profilePreference];
    long long v14 = [MEMORY[0x1E4F1CA80] set];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__Application_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke;
    v17[3] = &unk_1E6D78198;
    id v18 = v11;
    id v19 = v13;
    id v20 = v6;
    id v21 = v7;
    id v22 = v14;
    id v15 = v14;
    id v16 = v13;
    [v18 getAllDomainsConfiguredForPreference:v16 usingBlock:v17];
  }
}

void __62__Application_tabGroupManager_didRemoveProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(a1 + 32) valueOfPreference:*(void *)(a1 + 40) forDomain:v8];
        uint64_t v10 = [*(id *)(a1 + 48) profileWithIdentifier:*(void *)(a1 + 56)];
        id v11 = [v10 serverID];
        int v12 = [v9 isEqualToString:v11];

        if (v12) {
          [*(id *)(a1 + 64) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 32) removePreferenceValuesForDomains:*(void *)(a1 + 64) fromPreference:*(void *)(a1 + 40) completionHandler:0];
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__Application__updateCloudFeatureAvailability__block_invoke_3_cold_1(v7);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__Application__updateCloudFeatureAvailability__block_invoke_329;
    v8[3] = &unk_1E6D77D90;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __46__Application__updateCloudFeatureAvailability__block_invoke_329(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 544), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory];
  id v2 = *(void **)(a1 + 32);
  return [v2 _resetCloudHistoryAccountIfNeeded];
}

- (WBSAllowedLegacyTLSHostManager)legacyTLSHostManager
{
  cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  if (!cachedLegacyTLSHostManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98940]);
    id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v6 = (WBSAllowedLegacyTLSHostManager *)[v4 initWithBrowserDefaults:v5];
    id v7 = self->_cachedLegacyTLSHostManager;
    self->_cachedLegacyTLSHostManager = v6;

    cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  }
  return cachedLegacyTLSHostManager;
}

- (void)_historyWasCleared:(id)a3
{
  id v3 = [(Application *)self legacyTLSHostManager];
  [v3 clearAllLegacyTLSHosts];
}

- (void)_historyItemsWereRemoved:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F99248];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F99248]];
  id v7 = objc_msgSend(v6, "safari_setByApplyingBlock:", &__block_literal_global_338);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        long long v14 = objc_msgSend(MEMORY[0x1E4F3B060], "sharedInstance", (void)v20);
        long long v15 = [v14 userVisibleQueryFromSearchURL:v13];

        long long v16 = +[RecentWebSearchesController sharedController];
        [v16 clearRecentSearch:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v17 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
  uint64_t v18 = [v3 userInfo];
  id v19 = [v18 objectForKeyedSubscript:v5];
  [v17 historyItemsWereRemoved:v19];
}

uint64_t __40__Application__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  return [a2 url];
}

- (void)_historyHostnamesWereRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(Application *)self legacyTLSHostManager];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [v4 object];
  id v8 = [v6 setWithArray:v7];
  [v5 clearLegacyTLSForHosts:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F98D00];
  id v10 = [v4 object];

  [v9 removeHostnames:v10];
}

+ (CKContextClient)contextClient
{
  if (contextClient_onceToken != -1) {
    dispatch_once(&contextClient_onceToken, &__block_literal_global_344);
  }
  id v2 = (void *)contextClient_instance;
  return (CKContextClient *)v2;
}

void __28__Application_contextClient__block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  host_t v0 = (void *)getCKContextClientClass_softClass;
  uint64_t v8 = getCKContextClientClass_softClass;
  if (!getCKContextClientClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getCKContextClientClass_block_invoke;
    v4[3] = &unk_1E6D77CE0;
    void v4[4] = &v5;
    __getCKContextClientClass_block_invoke((uint64_t)v4);
    host_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 clientWithDefaultRequestType:1];
  id v3 = (void *)contextClient_instance;
  contextClient_instance = v2;
}

- (void)dispatchNavigationIntent:(id)a3
{
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
}

- (void)extensionsController:(id)a3 closeOpenExtensionTabsWithBaseURI:(id)a4 composedIdentifier:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [a4 host];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(Application *)self browserControllers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = [(Application *)self _allTabsWithExtensionContentLoadedForBrowserController:v14 extensionHost:v8 composedIdentifier:v7];
        if ([v15 count])
        {
          long long v16 = [v14 tabController];
          [v16 closeTabs:v15 animated:1 allowAddingToRecentlyClosedTabs:0 showAutoCloseTabsAlert:0];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)_allTabsWithExtensionContentLoadedForBrowserController:(id)a3 extensionHost:(id)a4 composedIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 tabController];
  uint64_t v10 = [v9 normalAndPrivateTabs];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__Application__allTabsWithExtensionContentLoadedForBrowserController_extensionHost_composedIdentifier___block_invoke;
  v15[3] = &unk_1E6D78230;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  uint64_t v13 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v15);

  return v13;
}

uint64_t __103__Application__allTabsWithExtensionContentLoadedForBrowserController_extensionHost_composedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 urlForExtensions];
  if (objc_msgSend(v3, "safari_isSafariWebExtensionURL"))
  {
    id v4 = [v3 host];
    if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)extensionsController:(id)a3 closeOpenExtensionTabsInPrivateBrowsingWithBaseURI:(id)a4 composedIdentifier:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [a4 host];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = [(Application *)self browserControllers];
  uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = [(Application *)self _allTabsWithExtensionContentLoadedForBrowserController:v13 extensionHost:v8 composedIdentifier:v7];
        long long v15 = objc_msgSend(v14, "safari_filterObjectsUsingBlock:", &__block_literal_global_347);

        if ([v15 count])
        {
          id v16 = [v13 tabController];
          [v16 closeTabs:v15 animated:1 allowAddingToRecentlyClosedTabs:0 showAutoCloseTabsAlert:0];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

uint64_t __106__Application_extensionsController_closeOpenExtensionTabsInPrivateBrowsingWithBaseURI_composedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrivate];
}

- (id)sfWebExtensionsController:(id)a3 tabWithID:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(Application *)self browserControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) tabController];
      uint64_t v11 = [v10 tabWithIDForWebExtensions:a4];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)sfWebExtensionsController:(id)a3 reusableTabWithID:(double)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__0;
  long long v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  uint64_t v6 = +[WBReusableTabManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__Application_sfWebExtensionsController_reusableTabWithID___block_invoke;
  v9[3] = &unk_1E6D78278;
  *(double *)&v9[5] = a4;
  void v9[4] = &v10;
  [v6 enumerateReusableTabDocuments:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __59__Application_sfWebExtensionsController_reusableTabWithID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  [v7 idForWebExtensions];
  if (v6 == *(double *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)sfWebExtensionsController:(id)a3 tabForWebView:(id)a4
{
  id v4 = +[TabDocument tabDocumentForWKWebView:a4];
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 webExtensionWindow];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 webExtensionTabs];
      if ([v8 containsObject:v5]) {
        uint64_t v9 = v5;
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = v5;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)sfWebExtensionsController:(id)a3 createNewTabInWindow:(id)a4 tabIndex:(id)a5 url:(id)a6 makeActive:(BOOL)a7 completionHandler:(id)a8
{
  if (a4) {
    [a4 createNewTabAtIndex:a5 url:a6 makeActive:a7 completionHandler:a8];
  }
  else {
    (*((void (**)(id, void))a8 + 2))(a8, 0);
  }
}

- (id)sfWebExtensionsController:(id)a3 duplicateTab:(id)a4
{
  id v4 = a4;
  id v5 = [v4 browserController];
  double v6 = [v5 tabController];
  id v7 = [v6 duplicateTab:v4];

  return v7;
}

- (void)sfWebExtensionsController:(id)a3 relateParentTab:(id)a4 toTab:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v12 = v6;
  uint64_t v8 = [v7 browserController];
  uint64_t v9 = [v12 browserController];
  if (v8 == v9)
  {
    int v10 = [v7 isPrivate];
    int v11 = [v12 isPrivate];

    if (v10 == v11) {
      [v7 updateAncestryWithParentTab:v12];
    }
  }
  else
  {
  }
}

- (BOOL)sfWebExtensionsController:(id)a3 canSendMessageFromWebView:(id)a4
{
  id v4 = +[TabDocument tabDocumentForWKWebView:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 browserController];
    int v7 = [v6 isContinuousReadingDocument:v5] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)sfWebExtensionsController:(id)a3 captureVisibleTab:(id)a4 format:(id)a5 quality:(double)a6 completionHandler:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  id v12 = a4;
  long long v13 = [v12 browserController];
  long long v14 = [v13 tabCollectionViewProvider];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__Application_sfWebExtensionsController_captureVisibleTab_format_quality_completionHandler___block_invoke;
  v17[3] = &unk_1E6D782A0;
  id v18 = v10;
  id v19 = v11;
  double v20 = a6;
  id v15 = v11;
  id v16 = v10;
  [v14 requestSnapshotForTabDocument:v12 completion:v17];
}

void __92__Application_sfWebExtensionsController_captureVisibleTab_format_quality_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  image = a2;
  if (image)
  {
    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F99750]]) {
      UIImagePNGRepresentation(image);
    }
    else {
    id v3 = UIImageJPEGRepresentation(image, *(double *)(a1 + 48) / 100.0);
    }
    if (v3)
    {
      id v4 = NSString;
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = objc_msgSend(NSString, "safari_stringByBase64EncodingData:", v3);
      int v7 = [v4 stringWithFormat:@"data:image/%@;base64,%@", v5, v6];
    }
    else
    {
      int v7 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)sfWebExtensionsController:(id)a3 windowWithID:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(Application *)self browserControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) webExtensionWindowWithID:a4];
        if (v10)
        {
          id v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)sfWebExtensionsController:(id)a3 windowForWebView:(id)a4 extension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 backgroundWebView];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    long long v13 = [(Application *)self sfWebExtensionsControllerLastFocusedWindow:v8];
  }
  else
  {
    long long v14 = [v10 toolbarItem];
    long long v15 = [v14 popupWebView];
    int v16 = [v9 isEqual:v15];

    if (v16)
    {
      long long v13 = [v14 windowDisplayingPopupWebView];
    }
    else
    {
      id v17 = +[TabDocument tabDocumentForWKWebView:v9];
      long long v13 = [v17 webExtensionWindow];
    }
  }

  return v13;
}

- (id)sfWebExtensionsController:(id)a3 navigationIntentUUIDForWindow:(id)a4
{
  id v4 = objc_msgSend(a4, "browserController", a3);
  uint64_t v5 = [v4 UUID];

  return v5;
}

- (id)sfWebExtensionsControllerAllWindows:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(Application *)self browserControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) webExtensionWindows];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

- (id)sfWebExtensionsControllerLastFocusedWindow:(id)a3
{
  id v3 = [(Application *)self browserControllers];
  id v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_356);

  uint64_t v5 = [v4 activeWebExtensionWindow];

  return v5;
}

uint64_t __58__Application_sfWebExtensionsControllerLastFocusedWindow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 activeWebExtensionWindowIsFocused];
}

- (void)sfWebExtensionsControllerContentBlockerListDidChange:(id)a3
{
  id v4 = [a3 profileServerID];
  id v5 = [(Application *)self contentBlockerManagerForProfileServerID:v4];

  [v5 informObserversThatContentBlockerManagerExtensionListDidChange];
}

- (void)sfWebExtensionsControllerDidChangeExtensionForPermissionBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(Application *)self browserControllers];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];

  uint64_t v7 = [v4 currentExtensionForPermissionBanner];

  if (v7)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F78520]) initWithExtension:v7];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke;
    v15[3] = &unk_1E6D782C8;
    id v9 = v7;
    id v16 = v9;
    [v8 setOpenActionHandler:v15];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke_2;
    long long v13 = &unk_1E6D782C8;
    id v14 = v9;
    [v8 setDismissButtonHandler:&v10];
    objc_msgSend(v6, "showWebExtensionBanner:", v8, v10, v11, v12, v13);
  }
  else
  {
    [v6 showWebExtensionBanner:0];
  }
}

uint64_t __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAlertForPendingPermissionRequests];
}

uint64_t __78__Application_sfWebExtensionsControllerDidChangeExtensionForPermissionBanner___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) permissionRequestBannerWasDismissed];
}

- (void)sfWebExtensionsController:(id)a3 showPopupOrPerSitePermissionsForExtension:(id)a4 inWindow:(id)a5 completionHandler:(id)a6
{
  id v14 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void))a6;
  id v12 = [(Application *)self sfWebExtensionsControllerLastFocusedWindow:a3];

  if (v12 == v10)
  {
    long long v13 = [v10 browserController];
    [v13 showPopupOrPerSitePermissionsForWebExtension:v14];
  }
  v11[2](v11);
}

- (id)sfWebExtensionsController:(id)a3 forProfileServerID:(id)a4
{
  return [(Application *)self webExtensionsControllerForProfileServerID:a4];
}

- (id)sfWebExtensionsControllerContentBlockerManager:(id)a3 forProfileServerID:(id)a4
{
  return [(Application *)self contentBlockerManagerForProfileServerID:a4];
}

- (id)sfWebExtensionsControllerDomainForDefaultSearchProvider:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F3B060], "sharedInstance", a3);
  id v4 = [v3 defaultSearchEngineForPrivateBrowsing:0];
  id v5 = [v4 searchURLForUserTypedString:@"a"];
  uint64_t v6 = [v5 host];
  uint64_t v7 = objc_msgSend(v6, "safari_highLevelDomainFromHost");

  return v7;
}

+ (void)setBrowserControllerUIDelegateProvider:(id)a3
{
  uint64_t v3 = [a3 copy];
  id v4 = (void *)browserControllerUIDelegateProvider;
  browserControllerUIDelegateProvider = v3;
}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  p_pointerDeviceLock = &self->_pointerDeviceLock;
  id v5 = a3;
  os_unfair_lock_lock(p_pointerDeviceLock);
  [(NSMutableSet *)self->_pointerDevices unionSet:v5];

  os_unfair_lock_unlock(p_pointerDeviceLock);
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  p_pointerDeviceLock = &self->_pointerDeviceLock;
  id v5 = a3;
  os_unfair_lock_lock(p_pointerDeviceLock);
  [(NSMutableSet *)self->_pointerDevices minusSet:v5];

  os_unfair_lock_unlock(p_pointerDeviceLock);
}

- (void)noteTakingController:(id)a3 addHighlightForUserActivity:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id, void))a5;
  id v25 = v7;
  id v9 = [v7 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"uniqueIdentifier"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = +[Application sharedApplication];
  id v12 = [v11 browserControllers];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = [*(id *)(*((void *)&v28 + 1) + 8 * v16) tabController];
      uint64_t v18 = [v17 activeTabDocument];

      id v19 = [v18 userActivity];
      double v20 = [v19 _uniqueIdentifier];
      char v21 = [v20 isEqual:v10];

      if (v21) {
        break;
      }

      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v14) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (!v18) {
      goto LABEL_13;
    }
    uint64_t v22 = v26;
    uint64_t v23 = v25;
    if (objc_msgSend(v26, "isNoteTakingSupportedWithPrivateBrowsing:", objc_msgSend(v18, "isPrivateBrowsingEnabled")))
    {
      [v18 setLinkAddedToUserActivityCallback:v8];
      [v18 addAppHighlightCreatingLink:0];
    }
    else
    {
      long long v24 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_INFO, "Not adding highlight to user activity because the tab is Private and Quick Note is disabled in Private Browsing", buf, 2u);
      }
      v8[2](v8, v25, 0);
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    uint64_t v23 = v25;
    v8[2](v8, v25, 0);
    uint64_t v22 = v26;
  }
}

- (void)notifyAddedLinkPreviewMetadata:(id)a3 toUserActivity:(id)a4 webView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[Application sharedApplication];
  uint64_t v11 = [v10 browserControllers];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__Application_notifyAddedLinkPreviewMetadata_toUserActivity_webView___block_invoke;
  v18[3] = &unk_1E6D77F50;
  id v19 = v9;
  id v12 = v9;
  uint64_t v13 = objc_msgSend(v11, "safari_firstObjectPassingTest:", v18);

  uint64_t v14 = [v13 tabController];
  uint64_t v15 = [v14 activeTabDocument];

  uint64_t v16 = [v15 linkAddedToUserActivityCallback];

  if (v16)
  {
    id v17 = [v15 linkAddedToUserActivityCallback];
    ((void (**)(void, id, id))v17)[2](v17, v8, v7);

    [v15 setLinkAddedToUserActivityCallback:0];
  }
}

BOOL __69__Application_notifyAddedLinkPreviewMetadata_toUserActivity_webView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 tabController];
  id v4 = [v3 activeTabDocument];

  id v5 = [v4 webView];
  BOOL v6 = v5 == *(void **)(a1 + 32);

  return v6;
}

- (BOOL)isNoteTakingControllerSupportedInPrivateBrowsing:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults", a3);
  char v4 = [v3 BOOLForKey:*MEMORY[0x1E4F992D0]];

  return v4;
}

- (WBSUnifiedBarAnalyticsProviding)unifiedBarAnalyticsProvider
{
  uint64_t v2 = [(Application *)self browserControllers];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_371);
  char v4 = [v3 firstObject];

  return (WBSUnifiedBarAnalyticsProviding *)v4;
}

uint64_t __42__Application_unifiedBarAnalyticsProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 scene];
  if ([v3 activationState])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v2 rootViewController];
    uint64_t v4 = [v5 usingUnifiedBar];
  }
  return v4;
}

- (WebBookmarkCollection)bookmarkCollection
{
  bookmarkCollection = self->_bookmarkCollection;
  if (!bookmarkCollection)
  {
    uint64_t v4 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    id v5 = self->_bookmarkCollection;
    self->_bookmarkCollection = v4;

    bookmarkCollection = self->_bookmarkCollection;
  }
  return bookmarkCollection;
}

- (void)_webBookmarksDidReload
{
  uint64_t v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  bookmarkCollection = self->_bookmarkCollection;
  self->_bookmarkCollection = v3;
}

- (id)_sortedBrowserControllers
{
  id v2 = [(Application *)self browserControllers];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_374];

  return v3;
}

uint64_t __40__Application__sortedBrowserControllers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 scene];
  uint64_t v6 = [v4 scene];

  if (v5 && !v6)
  {
LABEL_3:
    uint64_t v7 = -1;
    goto LABEL_17;
  }
  if (!v5 && v6) {
    goto LABEL_6;
  }
  if (!(v5 | v6))
  {
    uint64_t v7 = 0;
    goto LABEL_17;
  }
  if ([(id)v5 _isKeyWindowScene]) {
    goto LABEL_3;
  }
  if ([(id)v6 _isKeyWindowScene])
  {
LABEL_6:
    uint64_t v7 = 1;
    goto LABEL_17;
  }
  uint64_t v8 = [(id)v5 activationState];
  uint64_t v9 = [(id)v6 activationState];
  if (v9) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v8) {
    uint64_t v7 = v9 == 0;
  }
  else {
    uint64_t v7 = v10;
  }
LABEL_17:

  return v7;
}

- (UIScene)currentScene
{
  id v2 = [(Application *)self _sortedBrowserControllers];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 scene];

  return (UIScene *)v4;
}

- (id)_tabCompletionProvider
{
  tabCompletionProvider = self->_tabCompletionProvider;
  if (!tabCompletionProvider)
  {
    id v4 = (WBSBrowserTabCompletionProvider *)objc_alloc_init(MEMORY[0x1E4F989D8]);
    uint64_t v5 = self->_tabCompletionProvider;
    self->_tabCompletionProvider = v4;

    [(WBSBrowserTabCompletionProvider *)self->_tabCompletionProvider setDataSource:self];
    tabCompletionProvider = self->_tabCompletionProvider;
  }
  return tabCompletionProvider;
}

- (void)tabEntitiesMatchingQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(Application *)self _tabCompletionProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__Application_tabEntitiesMatchingQuery_completionHandler___block_invoke;
  v10[3] = &unk_1E6D78350;
  id v11 = v6;
  id v9 = v6;
  [v8 tabCompletionMatchesForQuery:v7 completionHandler:v10];
}

void __58__Application_tabEntitiesMatchingQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_378);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __58__Application_tabEntitiesMatchingQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F98EE8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 tabUUID];
  id v6 = [v3 title];
  id v7 = [v3 originalURLString];

  uint64_t v8 = (void *)[v4 initWithUUID:v5 title:v6 address:v7 isPrivate:0];
  return v8;
}

- (NSArray)allTabEntities
{
  id v2 = [(Application *)self _tabCompletionProvider];
  id v3 = [v2 tabInfos];
  id v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_382);

  return (NSArray *)v4;
}

id __29__Application_allTabEntities__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F98EE8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 uuid];
  id v6 = [v3 title];
  id v7 = [v3 url];

  uint64_t v8 = [v7 absoluteString];
  id v9 = (void *)[v4 initWithUUID:v5 title:v6 address:v8 isPrivate:0];

  return v9;
}

- (id)tabEntityWithUUID:(id)a3
{
  id v3 = [(BrowserWindowController *)self->_browserWindowController tabWithUUID:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98EE8]);
    uint64_t v5 = [v3 uuid];
    id v6 = [v3 title];
    id v7 = [v3 url];
    uint64_t v8 = [v7 absoluteString];
    id v9 = objc_msgSend(v4, "initWithUUID:title:address:isPrivate:", v5, v6, v8, objc_msgSend(v3, "isPrivateBrowsingEnabled"));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)pdfDataForTabWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(BrowserWindowController *)self->_browserWindowController tabDocumentWithUUID:a3];
  uint64_t v8 = [v7 printController];

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__Application_pdfDataForTabWithUUID_completionHandler___block_invoke;
    v9[3] = &unk_1E6D78398;
    id v10 = v6;
    [v8 getPDFDataForUsage:3 withCompletion:v9];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __55__Application_pdfDataForTabWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__Application_pdfDataForTabWithUUID_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_browserControllerForTabWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(Application *)self browserControllers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__Application__browserControllerForTabWithUUID___block_invoke;
  v9[3] = &unk_1E6D77F50;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_firstObjectPassingTest:", v9);

  return v7;
}

BOOL __48__Application__browserControllerForTabWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tabController];
  id v4 = [v3 tabWithUUID:*(void *)(a1 + 32)];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)sceneForTabWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(Application *)self _browserControllerForTabWithUUID:a3];
  if (v7)
  {
    uint64_t v8 = [(Application *)self openSessions];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__Application_sceneForTabWithUUID_completionHandler___block_invoke;
    v13[3] = &unk_1E6D783C0;
    id v9 = v7;
    id v14 = v9;
    id v10 = objc_msgSend(v8, "safari_anyObjectPassingTest:", v13);

    if ([(Application *)self supportsMultipleScenes] && !v10)
    {
      v6[2](v6, 0);
LABEL_12:

      goto LABEL_13;
    }
    id v11 = [v9 scene];
    if (v11)
    {
      ((void (**)(id, void *))v6)[2](v6, v11);
      if (![v11 activationState]) {
        goto LABEL_11;
      }
    }
    else
    {
      [v9 setIntentSceneConfigurationCompletion:v6];
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
    [(Application *)self requestSceneSessionActivation:v10 userActivity:0 options:v12 errorHandler:&__block_literal_global_387];

LABEL_11:
    goto LABEL_12;
  }
  v6[2](v6, 0);
LABEL_13:
}

uint64_t __53__Application_sceneForTabWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 persistentIdentifier];
  id v4 = [*(id *)(a1 + 32) windowState];
  BOOL v5 = [v4 sceneID];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

void __53__Application_sceneForTabWithUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXSiriLink();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53__Application_sceneForTabWithUUID_completionHandler___block_invoke_2_cold_1(v3);
  }
}

- (id)sceneForTabGroupWithUUIDString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(Application *)self _sortedBrowserControllers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__Application_sceneForTabGroupWithUUIDString___block_invoke;
  v10[3] = &unk_1E6D77F50;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_firstObjectPassingTest:", v10);

  uint64_t v8 = [v7 scene];

  return v8;
}

uint64_t __46__Application_sceneForTabGroupWithUUIDString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tabController];
  id v4 = [v3 activeTabGroup];
  BOOL v5 = [v4 uuid];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

- (WBProfile)focusProfile
{
  id v3 = [(Application *)self focusProfileIdentifier];
  if (v3)
  {
    id v4 = +[Application sharedApplication];
    BOOL v5 = [v4 tabGroupManager];
    uint64_t v6 = [v5 profileWithIdentifier:v3];

    if (!v6)
    {
      tabGroupManager = self->_tabGroupManager;
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXSiriLink();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (tabGroupManager)
      {
        if (v9) {
          -[Application focusProfile]();
        }
      }
      else if (v9)
      {
        -[Application focusProfile]();
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (WBProfile *)v6;
}

- (void)_profileFocusConfigurationChanged
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = WBS_LOG_CHANNEL_PREFIXSiriLink();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Received profile focus change notification", buf, 2u);
  }
  [(Application *)self _readFocusConfigurationKeys];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(Application *)self browserControllers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v9 = [v8 tabController];
        [v9 dismissOpenTabGroupAlertIfNeeded];
        id v10 = [v8 scene];
        id v11 = v10;
        if (v10 && (![v10 activationState] || objc_msgSend(v11, "activationState") == 1))
        {
          focusProfileIdentifier = self->_focusProfileIdentifier;
          [v8 activeProfileIdentifier];
          v14 = uint64_t v13 = self;
          LODWORD(focusProfileIdentifier) = [(NSString *)focusProfileIdentifier isEqualToString:v14];

          self = v13;
          if (focusProfileIdentifier)
          {
            uint64_t v18 = WBS_LOG_CHANNEL_PREFIXSiriLink();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = v18;
              double v20 = [v8 windowState];
              char v21 = [v20 uuid];
              uint64_t v22 = v13->_focusProfileIdentifier;
              *(_DWORD *)buf = 138543618;
              long long v30 = v21;
              __int16 v31 = 2114;
              __int16 v32 = v22;
              _os_log_impl(&dword_1E102C000, v19, OS_LOG_TYPE_DEFAULT, "Foreground window %{public}@ already has focus profile %{public}@ open", buf, 0x16u);
            }
            [(Application *)v13 setNeedsFocusProfileUpdate:0];

            return;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if ([(Application *)self needsFocusProfileUpdate]
    && [(Application *)self applicationState] != 2)
  {
    if ([(Application *)self prefersSingleWindow])
    {
      uint64_t v15 = [(Application *)self _sortedBrowserControllers];
      uint64_t v16 = [v15 firstObject];
      id v17 = [v16 tabController];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48__Application__profileFocusConfigurationChanged__block_invoke;
      v24[3] = &unk_1E6D77C20;
      v24[4] = self;
      [v17 openFocusProfileWithCompletionHandler:v24];
    }
  }
}

void __48__Application__profileFocusConfigurationChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsFocusProfileUpdate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 867))
  {
    id v3 = *(void **)(v2 + 936);
    *(void *)(v2 + 936) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 867) = 0;
  }
}

- (void)setNeedsFocusProfileUpdate:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_needsFocusProfileUpdate != a3)
  {
    BOOL v3 = a3;
    self->_needsFocusProfileUpdate = a3;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v4 setBool:v3 forKey:*MEMORY[0x1E4F98120]];

    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Updated needsFocusProfileUpdate to %i", (uint8_t *)v6, 8u);
    }
  }
}

- (void)_tabGroupFocusConfigurationChanged
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1E102C000, v0, OS_LOG_TYPE_ERROR, "Couldn't find FTG %{public}@ on focus change", v1, 0xCu);
}

uint64_t __49__Application__tabGroupFocusConfigurationChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusedTabGroupUpdate:0];
}

- (BOOL)prefersSingleWindow
{
  uint64_t v2 = [(Application *)self openSessions];
  if ([v2 count] == 1) {
    LOBYTE(v3) = 1;
  }
  else {
    int v3 = _SFDeviceIsPad() ^ 1;
  }

  return v3;
}

- (void)setNeedsFocusedTabGroupUpdate:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_needsFocusedTabGroupUpdate != a3)
  {
    BOOL v3 = a3;
    self->_needsFocusedTabGroupUpdate = a3;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v4 setBool:v3 forKey:*MEMORY[0x1E4F98128]];

    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Updated needsFTGUpdate to %i", (uint8_t *)v6, 8u);
    }
  }
}

- (id)tabInfosForBrowserTabCompletionProvider:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [(Application *)self openSessions];
  __int16 v32 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_389);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v6 = [(Application *)self _sortedBrowserControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    uint64_t v30 = *(void *)v38;
    long long v29 = self;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (([v11 isPrivateBrowsingEnabled] & 1) == 0)
        {
          if (![(Application *)self supportsMultipleScenes]
            || ([v11 windowState],
                id v12 = objc_claimAutoreleasedReturnValue(),
                [v12 sceneID],
                uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                int v14 = [v32 containsObject:v13],
                v13,
                v12,
                v14))
          {
            uint64_t v15 = [v11 tabController];
            uint64_t v16 = [v15 activeTabGroup];

            if (([v4 containsObject:v16] & 1) == 0)
            {
              [v4 addObject:v16];
              id v17 = objc_alloc(MEMORY[0x1E4F29128]);
              uint64_t v18 = [v16 uuid];
              id v19 = (void *)[v17 initWithUUIDString:v18];

              double v20 = [v16 displayTitle];
              char v21 = [v11 tabController];
              [v21 currentTabs];
              uint64_t v22 = v8;
              uint64_t v23 = v6;
              v25 = long long v24 = v4;
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __55__Application_tabInfosForBrowserTabCompletionProvider___block_invoke_2;
              v33[3] = &unk_1E6D783E8;
              v33[4] = v11;
              id v34 = v19;
              id v35 = v20;
              id v36 = v31;
              id v26 = v20;
              id v27 = v19;
              [v25 enumerateObjectsUsingBlock:v33];

              uint64_t v4 = v24;
              uint64_t v6 = v23;
              uint64_t v8 = v22;

              self = v29;
              uint64_t v9 = v30;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v8);
  }

  return v31;
}

uint64_t __55__Application_tabInfosForBrowserTabCompletionProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 persistentIdentifier];
}

void __55__Application_tabInfosForBrowserTabCompletionProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  uint64_t v5 = [v13 url];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F989C8]);
    uint64_t v7 = [v13 uuid];
    uint64_t v8 = [*(id *)(a1 + 32) UUID];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [v13 title];
    id v12 = objc_msgSend(v6, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v7, v8, v9, v10, a3, v5, v11, objc_msgSend(v13, "pageStatus"));

    [*(id *)(a1 + 56) addObject:v12];
  }
}

- (id)selectedTabInfoForBrowserTabCompletionProvider:(id)a3
{
  return 0;
}

- (void)setReadingListWidgetNeedsReload
{
  self->_readingListWidgetNeedsReloading = 1;
}

- (void)reloadReadingListWidgetIfNeeded
{
  if (self->_readingListWidgetNeedsReloading)
  {
    self->_readingListWidgetNeedsReloading = 0;
    WBSReloadReadingListWidget();
  }
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Received request from CoreSpotlight to reindex all searchable items", buf, 2u);
  }
  bookmarksDonationWriter = self->_bookmarksDonationWriter;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke;
  v9[3] = &unk_1E6D78438;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(SpotlightBookmarksDonationWriter *)bookmarksDonationWriter getBookmarksToDonateWithCompletionHandler:v9];
}

void __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke_2;
  block[3] = &unk_1E6D78410;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__Application_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke_2(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F98E50] sharedInstance];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) historiesForProfiles];
  [v4 reindexAllBookmarkAndHistoryItems:v2 historiesForProfiles:v3 withAcknowledgementHandler:*(void *)(a1 + 48)];
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_INFO, "Received request from CoreSpotlight to reindex searchable items with identifiers.", buf, 2u);
  }
  bookmarksDonationWriter = self->_bookmarksDonationWriter;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
  v13[3] = &unk_1E6D78488;
  id v14 = v7;
  uint64_t v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  [(SpotlightBookmarksDonationWriter *)bookmarksDonationWriter getBookmarksToDonateWithCompletionHandler:v13];
}

void __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2;
  v6[3] = &unk_1E6D78460;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __92__Application_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F98E50] sharedInstance];
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) historiesForProfiles];
  [v5 reindexBookmarkAndHistoryItemsWithIdentifiers:v2 allBookmarks:v3 historiesForProfiles:v4 withAcknowledgementHandler:*(void *)(a1 + 56)];
}

uint64_t __56__Application__showExtensionPermissionBannerIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) webExtensionForComposedIdentifier:a2];
}

- (void)websiteDataStore:(id)a3 openWindow:(id)a4 fromServiceWorkerOrigin:(id)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = WBS_LOG_CHANNEL_PREFIXPush();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v27 = "-[Application websiteDataStore:openWindow:fromServiceWorkerOrigin:completionHandler:]";
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2114;
    id v33 = v12;
    _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s with ds=%{public}@ url=%{public}@ swOrigin=%{public}@", buf, 0x2Au);
  }
  uint64_t v15 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
  id v16 = [v15 navigationIntentWithServiceWorkerOpenURL:v11];

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __85__Application_websiteDataStore_openWindow_fromServiceWorkerOrigin_completionHandler___block_invoke;
  uint64_t v23 = &unk_1E6D784D8;
  id v24 = v16;
  id v25 = v13;
  id v17 = v13;
  id v18 = v16;
  id v19 = (void *)MEMORY[0x1E4E42950](&v20);
  -[Application handleNavigationIntent:completion:](self, "handleNavigationIntent:completion:", v18, v19, v20, v21, v22, v23);
}

void __85__Application_websiteDataStore_openWindow_fromServiceWorkerOrigin_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2
    && ([*(id *)(a1 + 32) usedTabDocument],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [*(id *)(a1 + 32) usedTabDocument];
    id v6 = [v4 webView];

    id v5 = v6;
  }
  else
  {
    id v5 = 0;
  }
  id v7 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)websiteDataStore:(id)a3 domain:(id)a4 didOpenDomainViaWindowOpen:(id)a5 withProperty:(int64_t)a6 directly:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a4;
  id v11 = a5;
  if ([a3 isPersistent])
  {
    id v12 = [MEMORY[0x1E4F989B0] sharedManager];
    [v12 donateWindowProxyWithDomain:v13 openedDomain:v11 windowProxyProperty:a6 accessedPropertyDirectly:v7];
  }
}

- (id)_createBookmarkWithTitle:(id)a3 url:(id)a4 parentBookmark:(id)a5
{
  BOOL v7 = (void *)MEMORY[0x1E4FB60E8];
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 mainBookmarkCollection];
  id v12 = objc_alloc(MEMORY[0x1E4FB60E0]);
  id v13 = [v9 absoluteString];

  id v14 = [v11 configuration];
  uint64_t v15 = objc_msgSend(v12, "initWithTitle:address:collectionType:", v10, v13, objc_msgSend(v14, "collectionType"));

  id v16 = v8[2](v8, v11);

  if ([MEMORY[0x1E4FB60E8] isLockedSync])
  {
    objc_msgSend(v11, "moveBookmark:toFolderWithID:", v15, objc_msgSend(v16, "identifier"));
    [v11 saveBookmark:v15];
  }
  else if (([MEMORY[0x1E4FB60E8] lockSync] & 1) != 0 {
         || ([v15 isInserted] & 1) != 0
  }
         || ([MEMORY[0x1E4F78290] sharedFeatureManager],
             id v17 = objc_claimAutoreleasedReturnValue(),
             int v18 = [v17 isInMemoryBookmarkChangeTrackingAvailable],
             v17,
             !v18))
  {
    objc_msgSend(v11, "moveBookmark:toFolderWithID:", v15, objc_msgSend(v16, "identifier"));
    [v11 saveBookmark:v15];
    [MEMORY[0x1E4FB60E8] unlockSync];
  }
  else
  {
    objc_msgSend(v11, "addBookmarkInMemory:toFolderWithID:", v15, objc_msgSend(v16, "identifier"));
  }

  return v15;
}

- (id)createBookmarkWithTitle:(id)a3 url:(id)a4
{
  return [(Application *)self _createBookmarkWithTitle:a3 url:a4 parentBookmark:&__block_literal_global_397];
}

uint64_t __43__Application_createBookmarkWithTitle_url___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootBookmark];
}

- (void)deleteBookmarksWithUUIDs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138543362;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v4, "bookmarkWithUUID:", v11, v15, (void)v16);
        if (v12)
        {
          if (([v4 deleteBookmark:v12] & 1) == 0)
          {
            id v13 = WBS_LOG_CHANNEL_PREFIXSiriLink();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[Application deleteBookmarksWithUUIDs:](v20, v13, v12, &v21);
            }
          }
        }
        else
        {
          id v14 = WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            uint64_t v23 = v11;
            _os_log_error_impl(&dword_1E102C000, v14, OS_LOG_TYPE_ERROR, "Can't find bookmark %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }
}

- (id)createNewTab
{
  return (id)[MEMORY[0x1E4F29128] UUID];
}

- (id)createNewTabWithURL:(id)a3 isPrivate:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "UUID", a3, a4);
}

- (void)moveTabsWithUUIDs:(id)a3 toTabGroupWithUUID:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__Application_moveTabsWithUUIDs_toTabGroupWithUUID___block_invoke;
  v11[3] = &unk_1E6D78520;
  v11[4] = self;
  long long v7 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v11);
  if ([v7 count])
  {
    tabGroupManager = self->_tabGroupManager;
    uint64_t v9 = [v6 UUIDString];
    id v10 = [(WBTabGroupManager *)tabGroupManager tabGroupWithUUID:v9];

    if (v10) {
      [(WBTabGroupManager *)self->_tabGroupManager moveTabs:v7 toTabGroup:v10 afterTab:0 withoutPersistingTabGroupsWithUUIDStrings:0];
    }
  }
}

id __52__Application_moveTabsWithUUIDs_toTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 624);
  id v3 = [a2 UUIDString];
  id v4 = [v2 tabWithUUID:v3];

  return v4;
}

- (void)moveTabsWithUUIDs:(id)a3 toWindowWithIdentifier:(id)a4
{
  id v6 = a3;
  long long v7 = browserControllerWithEntityIdentifier(a4);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 tabController];
    id v10 = [v9 activeTabGroup];

    uint64_t v11 = [v10 uuid];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    long long v16 = __56__Application_moveTabsWithUUIDs_toWindowWithIdentifier___block_invoke;
    long long v17 = &unk_1E6D78548;
    long long v18 = self;
    id v12 = v11;
    id v19 = v12;
    id v13 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &v14);
    if (objc_msgSend(v13, "count", v14, v15, v16, v17, v18)) {
      [(WBTabGroupManager *)self->_tabGroupManager moveTabs:v13 toTabGroup:v10 afterTab:0 withoutPersistingTabGroupsWithUUIDStrings:0];
    }
  }
}

id __56__Application_moveTabsWithUUIDs_toWindowWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  id v3 = *(void **)(*(void *)(a1 + 32) + 624);
  id v4 = [a2 UUIDString];
  id v5 = [v3 tabWithUUID:v4];

  id v6 = [v5 tabGroupUUID];
  LOBYTE(v2) = objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", *(void *)(v2 + 40));

  if (v2) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (void)navigateTabWithUUID:(id)a3 toURL:(id)a4
{
  browserWindowController = self->_browserWindowController;
  id v6 = a4;
  id v7 = [(BrowserWindowController *)browserWindowController tabWithUUID:a3];
  [v7 loadURL:v6 title:&stru_1F3C268E8 skipSyncableTabUpdates:0];
}

- (id)createNewTabGroupWithTitle:(id)a3
{
  return 0;
}

- (void)deleteTabGroupsWithUUIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        if (v9) {
          [(WBTabGroupManager *)self->_tabGroupManager removeTabGroup:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSString)lastActiveProfileIdentifier
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = [v2 stringForKey:*MEMORY[0x1E4F78700]];

  return (NSString *)v3;
}

- (NSArray)allWindowEntities
{
  uint64_t v2 = [(Application *)self browserControllers];
  id v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_404);

  return (NSArray *)v3;
}

id __32__Application_allWindowEntities__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPrivateBrowsingEnabled])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = windowEntityForBrowserController(v2);
  }

  return v3;
}

- (id)windowEntityWithIdentifier:(id)a3
{
  id v3 = browserControllerWithEntityIdentifier(a3);
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = windowEntityForBrowserController(v3);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)createNewWindowWithRequestIdentifier:(id)a3 isPrivate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(Application *)self supportsMultipleScenes])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(Application *)self browserControllers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v13 = [v12 proxy];
          uint64_t v14 = [v13 appIntentRequestIdentifier];
          char v15 = [v14 isEqual:v6];

          if (v15)
          {
            [v12 setPrivateBrowsingEnabled:v4];
            long long v16 = entityIdentifierForBrowserController(v12);
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    long long v16 = 0;
LABEL_13:
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

- (void)closeWindowsWithIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__Application_closeWindowsWithIdentifiers___block_invoke;
  v13[3] = &unk_1E6D78590;
  void v13[4] = self;
  BOOL v4 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v13);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(Application *)self requestSceneSessionDestruction:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:0 errorHandler:&__block_literal_global_407];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

id __43__Application_closeWindowsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) openSessions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__Application_closeWindowsWithIdentifiers___block_invoke_2;
  v8[3] = &unk_1E6D783C0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "safari_anyObjectPassingTest:", v8);

  return v6;
}

uint64_t __43__Application_closeWindowsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 persistentIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __43__Application_closeWindowsWithIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __43__Application_closeWindowsWithIdentifiers___block_invoke_3_cold_1(v3);
  }
}

- (void)showWindowWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(Application *)self openSessions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__Application_showWindowWithIdentifier___block_invoke;
  v8[3] = &unk_1E6D783C0;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "safari_anyObjectPassingTest:", v8);

  if (v7) {
    [(Application *)self requestSceneSessionActivation:v7 userActivity:0 options:0 errorHandler:0];
  }
}

uint64_t __40__Application_showWindowWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 persistentIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (int64_t)currentKeyboardModifierFlags
{
  return self->_currentKeyboardModifierFlags;
}

- (ForYouRecommendationMediator)existingForYouRecommendationMediator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_existingForYouRecommendationMediator);
  return (ForYouRecommendationMediator *)WeakRetained;
}

- (void)setExistingForYouRecommendationMediator:(id)a3
{
}

- (SafariSettingsSyncEngine)settingsSyncEngine
{
  return self->_settingsSyncEngine;
}

- (WBSBackgroundImageAssetController)backgroundImageAssetController
{
  return self->_backgroundImageAssetController;
}

- (NSString)focusedTabGroupUUIDString
{
  return self->_focusedTabGroupUUIDString;
}

- (NSString)focusProfileIdentifier
{
  return self->_focusProfileIdentifier;
}

- (void)setFocusProfileIdentifier:(id)a3
{
}

- (BOOL)focusProfileUpdateIsForInactiveFocusMode
{
  return self->_focusProfileUpdateIsForInactiveFocusMode;
}

- (void)setFocusProfileUpdateIsForInactiveFocusMode:(BOOL)a3
{
  self->_focusProfileUpdateIsForInactiveFocusMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_focusedTabGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_backgroundImageAssetController, 0);
  objc_storeStrong((id *)&self->_settingsSyncEngine, 0);
  objc_destroyWeak((id *)&self->_existingForYouRecommendationMediator);
  objc_storeStrong((id *)&self->_browserWindowController, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_automationController, 0);
  objc_storeStrong((id *)&self->_scribbleFeedbackSyncEngine, 0);
  objc_storeStrong((id *)&self->_highlightManagerSuggestionsProviderBroadcaster, 0);
  objc_storeStrong((id *)&self->_profileIdentifiersToSuggestionsManagers, 0);
  objc_storeStrong((id *)&self->_userDefinedContentBlockerManagerForPrivateBrowsing, 0);
  objc_storeStrong((id *)&self->_userDefinedContentBlockerManager, 0);
  objc_storeStrong((id *)&self->_scribbleQuirksManager, 0);
  objc_storeStrong((id *)&self->_completionListVendorForHistoryService, 0);
  objc_storeStrong((id *)&self->_bookmarksDonationWriter, 0);
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsModelUpdateManager, 0);
  objc_storeStrong((id *)&self->_profileServerIDToUserContentController, 0);
  objc_storeStrong((id *)&self->_profileServerIDToContentBlockerManagers, 0);
  objc_storeStrong((id *)&self->_profileServerIDToWebExtensionsControllers, 0);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingAuthenticationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_lockPrivateBrowsingInBackgroundTimer, 0);
  objc_storeStrong((id *)&self->_developerPreferencesDidChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_unifiedBarAnalyticsRecorder, 0);
  objc_storeStrong((id *)&self->_systemNoteTakingController, 0);
  objc_storeStrong((id *)&self->_cachedLegacyTLSHostManager, 0);
  objc_storeStrong((id *)&self->_processPools, 0);
  objc_storeStrong((id *)&self->_pendingFrequentlyVisitedSites, 0);
  objc_storeStrong((id *)&self->_historyController, 0);
  objc_storeStrong((id *)&self->_highlightManager, 0);
  objc_storeStrong((id *)&self->_pointerDeviceObserverToken, 0);
  objc_storeStrong((id *)&self->_pointerDevices, 0);
  objc_storeStrong((id *)&self->_wallpaperSuspensionAssertion, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabCompletionProvider, 0);
  objc_storeStrong((id *)&self->_readingListImageCache, 0);
  objc_storeStrong((id *)&self->_formAutoFillCorrectionsHistoryObserver, 0);
  objc_storeStrong((id *)&self->_forYouRecommendationMediator, 0);
  objc_storeStrong((id *)&self->_forYouRecentParsecResultsManager, 0);
  objc_storeStrong((id *)&self->_ephemeralTabGroupManager, 0);
  objc_storeStrong((id *)&self->_cyclerConnectionManager, 0);
  objc_storeStrong((id *)&self->_cloudHistory, 0);
  objc_storeStrong((id *)&self->_bookmarksDatabaseHealthReporter, 0);
  objc_storeStrong((id *)&self->_bookmarksDatabaseBackgroundTaskLockAcquisitor, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
}

- (id)_browserControllerForApplicationTesting
{
  id v3 = +[LaunchStateController sharedController];
  [v3 forceMarkUIBecomeActiveForTesting];

  uint64_t v4 = [(Application *)self browserControllers];
  id v5 = [v4 firstObject];

  return v5;
}

+ (void)commandLineTestOption:(int)a3 arg:(const char *)a4
{
  if (a4) {
    id v5 = (void *)[[NSString alloc] initWithCString:a4 encoding:4];
  }
  else {
    id v5 = 0;
  }
  uint64_t v14 = v5;
  if (!gTestOptions)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = (void *)gTestOptions;
    gTestOptions = (uint64_t)v6;

    id v5 = v14;
  }
  if (a3 == 84 && v5)
  {
    [(id)gTestOptions setObject:v5 forKey:@"testName"];
LABEL_19:
    id v5 = v14;
    goto LABEL_20;
  }
  if (a3 == 85)
  {
    id v8 = [(id)gTestOptions objectForKey:@"URLs"];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(id)gTestOptions setObject:v8 forKey:@"URLs"];
    }
    if (v14) {
      [v8 addObject:v14];
    }

    goto LABEL_19;
  }
  if (a3 == 80)
  {
    if (v5)
    {
      uint64_t v9 = [v5 rangeOfString:@":"];
      id v5 = v14;
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = v9;
        long long v11 = (void *)gTestOptions;
        long long v12 = [v14 substringFromIndex:v9 + 1];
        long long v13 = [v14 substringToIndex:v10];
        [v11 setObject:v12 forKey:v13];

        goto LABEL_19;
      }
    }
  }
LABEL_20:
}

void __55__Application_ApplicationTesting__startCommandLineTest__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    id v1 = v0;
    int v3 = 138543362;
    uint64_t v4 = objc_opt_class();
    _os_log_impl(&dword_1E102C000, v1, OS_LOG_TYPE_DEFAULT, "Completed %{public}@", (uint8_t *)&v3, 0xCu);
  }
  id v2 = (void *)gTestController;
  gTestController = 0;
}

+ (BOOL)prepareTestControllerWithType:(id)a3 suiteURL:(id)a4 bundleNames:(id)a5 outputURL:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v31.st_dev = 138413058;
    *(void *)&v31.st_mode = v9;
    WORD2(v31.st_ino) = 2112;
    *(__darwin_ino64_t *)((char *)&v31.st_ino + 6) = (__darwin_ino64_t)v10;
    HIWORD(v31.st_gid) = 2112;
    *(void *)&v31.st_rdev = v11;
    LOWORD(v31.st_atimespec.tv_sec) = 2112;
    *(__darwin_time_t *)((char *)&v31.st_atimespec.tv_sec + 2) = (__darwin_time_t)v12;
    _os_log_debug_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEBUG, "Preparing test controller: type = %@, suiteURL = %@, bundle names = %@, output URL = %@", (uint8_t *)&v31, 0x2Au);
  }
  if ([v9 isEqualToString:@"autofill"])
  {
    gTestFileURLs = 1;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F98988]) initWithSuiteURL:v10 bundleNames:v11];
    uint64_t v15 = (void *)gTestController;
    gTestController = v14;

    memset(&v31, 0, sizeof(v31));
    id v16 = v12;
    if (!stat((const char *)[v16 fileSystemRepresentation], &v31) && (v31.st_mode & 0x1000) != 0)
    {
      id v30 = 0;
      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F98B00]) initWithFifoURL:v16 error:&v30];
      id v18 = v30;
      id v26 = (void *)gTestResults;
      gTestResults = v25;

      uint64_t v27 = gTestResults;
      __int16 v28 = WBS_LOG_CHANNEL_PREFIXTest();
      if (v27 && !v18)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:]();
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.4();
      }
    }
    else
    {
      id v29 = 0;
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F989F0]) initWithFileURL:v16 error:&v29];
      id v18 = v29;
      long long v19 = (void *)gTestResults;
      gTestResults = v17;

      uint64_t v20 = gTestResults;
      long long v21 = WBS_LOG_CHANNEL_PREFIXTest();
      if (v20 && !v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:]();
        }
LABEL_10:
        BOOL v22 = 1;
LABEL_17:

        goto LABEL_18;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:]();
      }
    }
    BOOL v22 = 0;
    goto LABEL_17;
  }
  uint64_t v23 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[Application(ApplicationTesting) prepareTestControllerWithType:suiteURL:bundleNames:outputURL:].cold.5();
  }
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (BOOL)overrideBrowserStateForTestNamed:(id)a3 browserController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPrefix:@"TabOverview"] & 1) != 0
    || ([v5 hasPrefix:@"SplitView"] & 1) != 0
    || ([v5 hasPrefix:@"TabBar"] & 1) != 0
    || [v5 hasPrefix:@"Memory"])
  {
    int v7 = [v5 isEqualToString:@"TabOverviewOpenNewTab"];
    int v8 = [v5 isEqualToString:@"TabBarSwitchTab"];
    if ([v5 isEqualToString:@"MemoryAndLiveTabs"]) {
      goto LABEL_12;
    }
    uint64_t v9 = 64;
    if (v7) {
      uint64_t v9 = 8;
    }
    uint64_t v10 = v8 ? 1 : v9;
    if ([v5 isEqualToString:@"IOAndLiveTabs"])
    {
LABEL_12:
      id v11 = [(id)gTabMemoryAndIOTestRunner testPageURL];
      uint64_t v10 = 200;
    }
    else
    {
      id v11 = 0;
    }
    id v12 = [MEMORY[0x1E4F1CA48] array];
    do
    {
      id v13 = objc_alloc(MEMORY[0x1E4FB6078]);
      uint64_t v14 = [v6 tabController];
      uint64_t v15 = [v14 deviceIdentifier];
      id v16 = (void *)[v13 initWithTitle:0 url:v11 deviceIdentifier:v15];

      [v12 addObject:v16];
      --v10;
    }
    while (v10);
    uint64_t v17 = (void *)[v12 copy];
    id v18 = [v6 windowState];
    long long v19 = [v18 localTabGroup];
    [v19 setTabs:v17];

    uint64_t v20 = (void *)MEMORY[0x1E4F78558];
    long long v21 = objc_alloc_init(PPTTestBrowserWindowSettings);
    [v20 setSharedSettings:v21];

    BOOL v22 = [MEMORY[0x1E4F78558] settings];
    uint64_t v23 = [v6 UUID];
    BOOL v24 = 1;
    [v22 setIsShowingTabView:1 forWindowWithUUID:v23];

    uint64_t v25 = [PinnedTabsManager alloc];
    id v26 = [v6 tabGroupManager];
    uint64_t v27 = [v26 tabCollection];
    __int16 v28 = [(PinnedTabsManager *)v25 initWithBrowserState:0 tabCollection:v27];
    id v29 = [v6 tabController];
    [v29 setPinnedTabsManager:v28];
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (void)checkExtendedLaunchPageLoad:(id)a3 forTabDocument:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (gExtendedLaunchPageLoad == -1)
  {
    id v6 = (void *)*MEMORY[0x1E4FB2608];
    int v7 = [(id)*MEMORY[0x1E4FB2608] _launchTestName];
    if ([v6 isRunningTest:v7])
    {
      int v8 = [v11 absoluteString];
      char v9 = [v8 isEqualToString:@"about:blank"];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [[PageLoadTestStatistics alloc] initWithInjectedBundle:1 withCallback:&__block_literal_global_158];
        [v5 setPageLoadStatistics:v10];
        gExtendedLaunchPageLoad = 1;

        goto LABEL_7;
      }
    }
    else
    {
    }
    gExtendedLaunchPageLoad = 0;
  }
LABEL_7:
}

void __78__Application_ApplicationTesting__checkExtendedLaunchPageLoad_forTabDocument___block_invoke()
{
  os_log_t v0 = (void *)*MEMORY[0x1E4FB2608];
  id v1 = [(id)*MEMORY[0x1E4FB2608] _launchTestName];
  [v0 finishedTest:v1];
}

- (id)_numberOption:(id)a3
{
  int v3 = [(id)gTestOptions objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  id v5 = v3;
  if (![v5 compare:@"yes" options:1])
  {
    char v9 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v10 = 1;
LABEL_12:
    uint64_t v8 = [v9 numberWithBool:v10];
LABEL_13:
    id v4 = (id)v8;

    goto LABEL_16;
  }
  if (![v5 compare:@"no" options:1])
  {
    char v9 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  if ([v5 length])
  {
    uint64_t v6 = [v5 rangeOfString:@"."];
    int v7 = (void *)MEMORY[0x1E4F28ED0];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v5, "intValue"));
    }
    else
    {
      [v5 doubleValue];
      objc_msgSend(v7, "numberWithDouble:");
    uint64_t v8 = };
    goto LABEL_13;
  }

LABEL_15:
  id v4 = 0;
LABEL_16:

  return v4;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (gRunner) {
    [(id)gRunner finish];
  }
  gTestFileURLs = 1;
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v8];
  uint64_t v10 = (void *)gTestOptions;
  gTestOptions = v9;

  [(id)gTestOptions setObject:v7 forKey:@"testName"];
  objc_storeStrong((id *)&gCurrentTestName, a3);
  id v11 = [(Application *)self _browserControllerForApplicationTesting];
  if ([v7 hasPrefix:@"PLT"])
  {
    id v12 = PurplePageLoadTestRunner;
LABEL_9:
    uint64_t v13 = [[v12 alloc] initWithTestName:v7 browserController:v11];
LABEL_10:
    uint64_t v14 = (ZoomTestProcessor *)v13;
    goto LABEL_11;
  }
  if ([v7 hasPrefix:@"Alexa"])
  {
    id v12 = AlexaTestRunner;
    goto LABEL_9;
  }
  if ([v7 hasPrefix:@"WhiteTabs"])
  {
    id v12 = WhiteTabsTestRunner;
    goto LABEL_9;
  }
  if ([v7 hasPrefix:@"ZoomTest"])
  {
    uint64_t v14 = [[ZoomTestProcessor alloc] initWithTestName:v7 browserController:v11];
    long long v19 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"iterations");
    -[ContentInteractionTestRunner setIterations:](v14, "setIterations:", [v19 intValue]);

    uint64_t v20 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"stepsPerZoom");
    -[ZoomTestProcessor setStepsPerZoom:](v14, "setStepsPerZoom:", [v20 intValue]);
LABEL_24:

    goto LABEL_11;
  }
  if ([v7 hasPrefix:@"ZoomAnimationTest"])
  {
    long long v21 = ZoomAnimationTestProcessor;
LABEL_21:
    uint64_t v14 = (ZoomTestProcessor *)[[v21 alloc] initWithTestName:v7 browserController:v11];
    uint64_t v20 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"iterations");
    -[ContentInteractionTestRunner setIterations:](v14, "setIterations:", [v20 intValue]);
    goto LABEL_24;
  }
  if ([v7 hasPrefix:@"ScrollTest"])
  {
    uint64_t v14 = [[ScrollTestProcessor alloc] initWithTestName:v7 browserController:v11];
    BOOL v22 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"iterations");
    -[ContentInteractionTestRunner setIterations:](v14, "setIterations:", [v22 intValue]);

    uint64_t v20 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"scrollDelta");
    -[ZoomTestProcessor setScrollDelta:](v14, "setScrollDelta:", [v20 intValue]);
    goto LABEL_24;
  }
  if ([v7 hasPrefix:@"ScrollDecelerationTest"])
  {
    long long v21 = ScrollDecelerationTestProcessor;
    goto LABEL_21;
  }
  if ([v7 hasPrefix:@"RotationTest"])
  {
    long long v21 = RotationTestProcessor;
    goto LABEL_21;
  }
  if ([v7 hasPrefix:@"ScrollPerf"])
  {
    uint64_t v23 = ScrollPerfTestRunner;
LABEL_31:
    uint64_t v13 = [[v23 alloc] initRenderTestWithName:v7 browserController:v11 showRenderTime:0 showFPS:1];
    goto LABEL_10;
  }
  if ([v7 hasPrefix:@"PageLoadUsageofMemory"])
  {
    id v12 = PurplePageMemoryTestRunner;
    goto LABEL_9;
  }
  if ([v7 hasPrefix:@"FlowManagedPageLoadTest"])
  {
    id v12 = PurpleFlowManagedPageLoadTestRunner;
    goto LABEL_9;
  }
  if ([v7 hasPrefix:@"ContentAnimation"])
  {
    uint64_t v23 = ContentAnimationTestRunner;
    goto LABEL_31;
  }
  if (![v7 hasPrefix:@"ScaleTest:"])
  {
    if ([v7 rangeOfString:@"ShowHideBookmarksTest"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v7 rangeOfString:@"CanvasTest"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [v8 objectForKey:@"url"];
        if (!v17)
        {
          id v30 = [v8 objectForKey:@"URLs"];
          uint64_t v17 = [v30 objectAtIndex:0];
        }
        BOOL v15 = [(Application *)self startCanvasTest:v17];
        goto LABEL_13;
      }
      if ([v7 rangeOfString:@"TabViewBringUpTest"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self prepareTabViewBringUpTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"TabViewRotateTest"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self prepareTabViewRotationTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"TabViewOpenTest"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self prepareTabViewOpenTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"TabViewSelectTest"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self prepareTabViewSelectTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"TabViewCloseTest"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self prepareTabViewCloseTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"KeyboardSplitAndMerge"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self startKeyboardSplitAndMergeTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"KeyboardBringup"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self startKeyboardBringupTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"KeyboardRotation"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self startKeyboardRotationTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"LargeFormFocus"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self runLargeFormFocusTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"LargeFormTyping"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self runLargeFormTypingTest];
        goto LABEL_76;
      }
      if ([v7 rangeOfString:@"GeneratePassword"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(Application *)self runGeneratePasswordTest];
        goto LABEL_76;
      }
      if ([v7 hasPrefix:@"TabOverview"])
      {
        [(Application *)self runTabOverviewTest];
LABEL_76:
        BOOL v15 = 1;
        goto LABEL_16;
      }
      if ([v7 hasPrefix:@"TabSnapshotCacheStressTest"])
      {
        [(Application *)self runTabSnapshotCacheStressTest];
        goto LABEL_76;
      }
      if ([v7 hasPrefix:@"BookmarksView"])
      {
        [(Application *)self runBookmarksViewTest];
        goto LABEL_76;
      }
      if ([v7 hasPrefix:@"SplitView"])
      {
        stat v31 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[Application(ApplicationTesting) runTest:options:](v31);
        }
        goto LABEL_15;
      }
      if ([v7 hasPrefix:@"SearchPerformanceUnifiedFieldKeyTimeTest"])
      {
        [(Application *)self startSearchPerformanceUnifiedFieldKeyTimeTest];
        goto LABEL_76;
      }
      if ([v7 hasPrefix:@"SearchPerformanceDetailed"])
      {
        -[Application startSearchPerformanceDetailedTestWithCF:](self, "startSearchPerformanceDetailedTestWithCF:", [v7 hasPrefix:@"SearchPerformanceDetailedWithCF"]);
        goto LABEL_76;
      }
      if ([v7 hasPrefix:@"SearchPerformance"])
      {
        [(Application *)self startSearchPerformanceTest];
        goto LABEL_76;
      }
      if ([v7 hasPrefix:@"SidebarOpen"])
      {
        unsigned __int8 v29 = [(Application *)self startSidebarTest];
        goto LABEL_61;
      }
      if ([v7 hasPrefix:@"TabBar"])
      {
        unsigned __int8 v29 = [(Application *)self startTabBarTest];
        goto LABEL_61;
      }
      if ([v7 hasPrefix:@"History"])
      {
        unsigned __int8 v29 = [(Application *)self startHistoryTest];
        goto LABEL_61;
      }
      if ([v7 hasPrefix:@"Memory"])
      {
        uint64_t v32 = self;
        uint64_t v33 = 0;
LABEL_100:
        unsigned __int8 v29 = [(Application *)v32 runMemoryOrIOTestWithType:v33];
        goto LABEL_61;
      }
      if ([v7 hasPrefix:@"IO"])
      {
        uint64_t v32 = self;
        uint64_t v33 = 1;
        goto LABEL_100;
      }
      if ([v7 hasPrefix:@"TabViewScroll"])
      {
        [(Application *)self prepareTabViewScrollTest];
        goto LABEL_76;
      }
      if ([v7 isEqualToString:@"Resize"])
      {
        unsigned __int8 v29 = [(Application *)self _startResizeTestWithName:v7];
      }
      else
      {
        v34.receiver = self;
        v34.super_class = (Class)Application;
        unsigned __int8 v29 = [(Application *)&v34 runTest:v7 options:v8];
      }
    }
    else
    {
      __int16 v28 = [v8 objectForKey:@"iterations"];
      gShowBookmarksTestIterations = [v28 intValue];

      unsigned __int8 v29 = [(Application *)self prepareBookmarksTest];
    }
LABEL_61:
    BOOL v15 = v29;
    goto LABEL_16;
  }
  uint64_t v14 = (ZoomTestProcessor *)[(PurplePageLoadTestRunner *)[ScaleTestProcessor alloc] initRenderTestWithName:v7 browserController:v11 showRenderTime:1 showFPS:0];
  BOOL v24 = [v8 objectForKey:@"scale"];
  uint64_t v25 = v24;
  if (v24)
  {
    int v27 = 0;
    if (([v24 isEqualToString:@"max"] & 1) == 0
      && ([v25 isEqualToString:@".5max"] & 1) == 0)
    {
      [v25 floatValue];
      int v27 = LODWORD(v26);
    }
    LODWORD(v26) = v27;
    [(ZoomTestProcessor *)v14 setZoomScale:v26];
  }

LABEL_11:
  if (!v14)
  {
    NSLog((NSString *)@"Could not run test '%@'", v7);
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_16;
  }
  BOOL v15 = 1;
  gRunningPurpleTest = 1;
  id v16 = (void *)gRunner;
  gRunner = (uint64_t)v14;
  uint64_t v17 = v14;

  [(id)gRunner setDelegate:self];
  [(PageLoadTestRunner *)v17 setTestOptions:v8];
  [(PageLoadTestRunner *)v17 start];
LABEL_13:

LABEL_16:
  return v15;
}

- (void)_observeNotificationOnce:(id)a3 handler:(id)a4
{
  id v5 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a3;
  id v8 = [v6 defaultCenter];
  uint64_t v9 = [MEMORY[0x1E4F28F08] mainQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__Application_ApplicationTesting___observeNotificationOnce_handler___block_invoke;
  v13[3] = &unk_1E6D78840;
  id v14 = v5;
  BOOL v15 = &v16;
  id v10 = v5;
  uint64_t v11 = [v8 addObserverForName:v7 object:0 queue:v9 usingBlock:v13];

  id v12 = (void *)v17[5];
  void v17[5] = v11;

  _Block_object_dispose(&v16, 8);
}

void __68__Application_ApplicationTesting___observeNotificationOnce_handler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v3 = (void *)MEMORY[0x1E4F28EB8];
    id v7 = a2;
    id v4 = [v3 defaultCenter];
    [v4 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)startKeyboardSplitAndMergeTest
{
  int v3 = [(Application *)self _browserControllerForApplicationTesting];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke;
  v7[3] = &unk_1E6D77E20;
  id v8 = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke_2;
  v5[3] = &unk_1E6D77E20;
  id v6 = v8;
  id v4 = v8;
  [(Application *)self runTestForKeyboardSplitAndMergeWithName:@"KeyboardSplitAndMerge" withShowKeyboardBlock:v7 withExtraResultsBlock:0 withCleanupBlock:v5];
}

uint64_t __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesFieldFocused:1 animated:0];
}

uint64_t __65__Application_ApplicationTesting__startKeyboardSplitAndMergeTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelFavorites];
}

- (void)startKeyboardBringupTest
{
  [(Application *)self loadBlankPageforKeyboardTests];
  int v3 = [(Application *)self _browserControllerForApplicationTesting];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke;
  v9[3] = &unk_1E6D77E20;
  id v10 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_2;
  v7[3] = &unk_1E6D77E20;
  id v8 = v10;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_3;
  v5[3] = &unk_1E6D77E20;
  id v6 = v8;
  id v4 = v8;
  [(Application *)self runTestForKeyboardBringupAndDismissalWithName:@"KeyboardBringup" withShowKeyboardBlock:v9 withHideKeyboardBlock:v7 withExtraResultsBlock:0 withCleanupBlock:v5];
}

uint64_t __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesFieldFocused:1 animated:0];
}

uint64_t __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelFavorites];
}

void __59__Application_ApplicationTesting__startKeyboardBringupTest__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tabController];
  [v1 closeAllOpenTabsAnimated:0];
}

- (void)startKeyboardRotationTest
{
  [(Application *)self loadBlankPageforKeyboardTests];
  int v3 = [(Application *)self _browserControllerForApplicationTesting];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke;
  v8[3] = &unk_1E6D77E20;
  id v9 = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke_2;
  v5[3] = &unk_1E6D77D90;
  id v6 = v9;
  id v7 = self;
  id v4 = v9;
  [(Application *)self runTestForKeyboardRotationWithName:@"KeyboardRotation" fromOrientation:1 withShowKeyboardBlock:v8 withExtraResultsBlock:0 withCleanupBlock:v5];
}

uint64_t __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesFieldFocused:1 animated:0];
}

void __60__Application_ApplicationTesting__startKeyboardRotationTest__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelFavorites];
  [*(id *)(a1 + 40) rotateIfNeeded:1];
  id v2 = [*(id *)(a1 + 32) tabController];
  [v2 closeAllOpenTabsAnimated:0];
}

- (void)loadBlankPageforKeyboardTests
{
  id v7 = [(Application *)self _browserControllerForApplicationTesting];
  id v2 = [v7 tabController];
  [v2 closeAllOpenTabsAnimated:0];

  int v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
  id v4 = (id)[v7 loadURLInNewTab:v3 inBackground:0];

  uint64_t v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2.0];
  [v5 runUntilDate:v6];
}

- (void)_loadAlternateHTMLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(Application *)self loadBlankPageforKeyboardTests];
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__Application_ApplicationTesting___loadAlternateHTMLString_completionHandler___block_invoke;
  block[3] = &unk_1E6D78410;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

void __78__Application_ApplicationTesting___loadAlternateHTMLString_completionHandler___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  id v2 = [v8 tabController];
  int v3 = [v2 activeTabDocument];

  [v3 setAllowsProgrammaticFocusToBeginInputSession:1];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
  [v3 loadAlternateHTMLString:v4 baseURL:v5 forUnreachableURL:v6];

  dispatch_time_t v7 = dispatch_time(0, 4000000000);
  dispatch_after(v7, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 48));
}

- (void)_loadLargeForm:(id)a3
{
  -[Application _loadAlternateHTMLString:completionHandler:](self, "_loadAlternateHTMLString:completionHandler:", @"<html><head><script>function populate(){var f=document.getElementById(\"form\");for (var i=0; i<1000; ++i) {var input = document.createElement('input');input.type = \"text\";input.name = \"firstname \" + i;f.appendChild(input);}}</script></head><body onload=\"populate()\"><form id=\"form\" action=\"/action_page.php\">First name:<br><input type=\"text\" name=\"firstname\" value=\"Test\"><br>Last name:<br><input type=\"text\" name=\"lastname\" value=\"Name\"><br><br><input type=\"submit\" value=\"Submit\"></form> </body></html>",
    a3);
}

- (void)runLargeFormFocusTest
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke;
  v2[3] = &unk_1E6D77D90;
  v2[4] = self;
  int v3 = @"document.getElementsByName(\"firstname 500\")[0].focus();";
  [(Application *)self _loadLargeForm:v2];
}

void __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke_2;
  v7[3] = &unk_1E6D77F08;
  void v7[4] = v2;
  [v2 _observeNotificationOnce:@"WebFormElementDidFocusNotification" handler:v7];
  int v3 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 tabController];
  uint64_t v5 = [v4 activeTabDocument];

  [*(id *)(a1 + 32) startedTest:gCurrentTestName];
  id v6 = [v5 webView];
  [v6 evaluateJavaScript:*(void *)(a1 + 40) completionHandler:0];
}

uint64_t __56__Application_ApplicationTesting__runLargeFormFocusTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:gCurrentTestName];
}

- (void)_typeTextInForm:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = gCurrentTestName;
  id v8 = a3;
  [(Application *)self startedSubTest:@"TypeLetter" forTest:v7 withMetrics:&unk_1F3C73CF8];
  id v9 = [(Application *)self _browserControllerForApplicationTesting];
  id v10 = [v9 tabController];
  uint64_t v11 = [v10 activeTabDocument];

  id v12 = [(id)*MEMORY[0x1E4FB2608] _responderForKeyEvents];
  [v12 insertText:v8];

  id v13 = [v11 webView];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__Application_ApplicationTesting___typeTextInForm_completionHandler___block_invoke;
  v15[3] = &unk_1E6D78868;
  void v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v13 evaluateJavaScript:@"null;" completionHandler:v15];
}

uint64_t __69__Application_ApplicationTesting___typeTextInForm_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"TypeLetter" forTest:gCurrentTestName];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_runFormTypingTextWithSetupScript:(id)a3
{
  id v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__315;
  uint64_t v20 = __Block_byref_object_dispose__316;
  id v21 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke;
  v11[3] = &unk_1E6D788B8;
  id v12 = @"Hello World";
  id v13 = self;
  id v14 = v22;
  BOOL v15 = &v16;
  uint64_t v5 = MEMORY[0x1E4E42950](v11);
  id v6 = (void *)v17[5];
  void v17[5] = v5;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_3;
  v8[3] = &unk_1E6D78908;
  void v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  id v10 = &v16;
  [(Application *)self _loadLargeForm:v8];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
}

void __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2 >= [*(id *)(a1 + 32) length])
  {
    [*(id *)(a1 + 40) finishedTest:gCurrentTestName];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  else
  {
    int v3 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 1);
    id v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_2;
    v7[3] = &unk_1E6D78890;
    long long v8 = *(_OWORD *)(a1 + 48);
    [v4 _typeTextInForm:v3 completionHandler:v7];
  }
}

uint64_t __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

void __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  int v3 = [v2 tabController];
  id v4 = [v3 activeTabDocument];

  uint64_t v5 = [v4 webView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_4;
  v8[3] = &unk_1E6D788E0;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  void v8[5] = v7;
  [v5 evaluateJavaScript:v6 completionHandler:v8];
}

void __69__Application_ApplicationTesting___runFormTypingTextWithSetupScript___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) startedTest:gCurrentTestName];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  int v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = MEMORY[0x1E4F14428];
  dispatch_after(v2, v4, v3);
}

- (void)runLargeFormTypingTest
{
  if ([(id)gCurrentTestName hasSuffix:@"Insert"])
  {
    int v3 = @"var field=document.getElementsByName(\"firstname 500\")[0];field.oninput=function() { var insertedElement=document.createElement('input');insertedElement.type='text';insertedElement.value='Hello World';field.parentNode.insertBefore(insertedElement,field);};field.focus();";
  }
  else if ([(id)gCurrentTestName hasSuffix:@"Delete"])
  {
    int v3 = @"var field=document.getElementsByName(\"firstname 500\")[0];field.oninput=function(){field.parentNode.removeChild(field.previousSibling);};field.focus();";
  }
  else if ([(id)gCurrentTestName hasSuffix:@"Reorder"])
  {
    int v3 = @"var field=document.getElementsByName(\"firstname 500\")[0];field.oninput=function(){field.parentNode.insertBefore(field.previousSibling, null);};field.focus();";
  }
  else
  {
    int v3 = @"document.getElementsByName(\"firstname 500\")[0].focus();";
  }
  [(Application *)self _runFormTypingTextWithSetupScript:v3];
}

- (void)runGeneratePasswordTest
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke;
  v2[3] = &unk_1E6D77E20;
  v2[4] = self;
  [(Application *)self _loadAlternateHTMLString:@"<html><body>Username: <input type=\"text\" name=\"username\"><br>Password: <input type=\"password\" name=\"password\"><br>Confirm Password: <input type=\"password\" name=\"confirm_password\"></body></html>" completionHandler:v2];
}

void __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4FB2BC8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke_2;
  v8[3] = &unk_1E6D77F08;
  void v8[4] = v2;
  [v2 _observeNotificationOnce:v3 handler:v8];
  id v4 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  uint64_t v5 = [v4 tabController];
  uint64_t v6 = [v5 activeTabDocument];

  [*(id *)(a1 + 32) startedTest:gCurrentTestName];
  uint64_t v7 = [v6 webView];
  objc_msgSend(v7, "evaluateJavaScript:completionHandler:", @"document.getElementsByName(\"password\")[0].focus();",
    0);
}

uint64_t __58__Application_ApplicationTesting__runGeneratePasswordTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:gCurrentTestName];
}

- (void)loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4
{
  id v16 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v6 = [v16 tabController];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  long long v8 = _SFSafariTestContentDirectoryPath();
  id v9 = [v8 stringByAppendingPathComponent:@"Apple.webarchive"];
  id v10 = [v7 fileURLWithPath:v9 isDirectory:0];

  [v6 closeAllOpenTabsAnimated:1];
  for (; a3; --a3)
    id v11 = (id)[v16 loadURLInNewTab:v10 inBackground:0];
  id v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:20.0];
  [v12 runUntilDate:v13];

  id v14 = [v16 tabCollectionViewProvider];
  BOOL v15 = [v14 tabThumbnailCollectionView];

  if (a4) {
    [v15 presentAnimated:1];
  }
  else {
    [v15 dismissAnimated:1];
  }
}

- (void)loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v10 = [(Application *)self _browserControllerForApplicationTesting];
  id v9 = [v10 tabController];
  [v9 closeAllOpenTabsAnimated:1];
  [(Application *)self _loadTabsForTesting:a3 presentTabView:v5 completion:v8];
}

- (void)_preparePageLoadTestControllerParameters
{
  id v3 = [(Application *)self _browserControllerForApplicationTesting];
  dispatch_time_t v2 = [v3 processPool];
  [v2 _setObject:MEMORY[0x1E4F1CC38] forBundleParameter:@"enablePageLoadMeasurementCollection"];
}

- (void)_loadTabsForTesting:(unint64_t)a3 presentTabView:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [(Application *)self _preparePageLoadTestControllerParameters];
  id v9 = [(Application *)self _browserControllerForApplicationTesting];
  id v10 = [v9 tabController];
  if (a3)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = _SFSafariTestContentDirectoryPath();
    id v13 = [v12 stringByAppendingPathComponent:@"Apple.webarchive"];
    id v14 = [v11 fileURLWithPath:v13 isDirectory:0];

    [v10 insertNewBlankTabDocumentAnimated:0];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    BOOL v15 = [v10 activeTabDocument];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke;
    v20[3] = &unk_1E6D78958;
    BOOL v22 = v25;
    unint64_t v23 = a3;
    uint8_t v20[4] = self;
    BOOL v24 = v5;
    id v21 = v8;
    [v15 loadTestURL:v14 withInjectedBundle:1 withCallback:v20];

    id v16 = [v10 activeTabDocument];
    uint64_t v17 = [v16 pageLoadStatistics];
    [v17 setPageLoadingTimeoutInterval:5.0];

    _Block_object_dispose(v25, 8);
  }
  else
  {
    uint64_t v18 = [v9 tabCollectionViewProvider];
    id v14 = [v18 tabThumbnailCollectionView];

    if (v5) {
      [v14 presentAnimated:1];
    }
    else {
      [v14 dismissAnimated:1];
    }
    dispatch_time_t v19 = dispatch_time(0, 5000000000);
    dispatch_after(v19, MEMORY[0x1E4F14428], v8);
  }
}

void __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    dispatch_time_t v3 = dispatch_time(0, 300000000);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke_2;
    v6[3] = &unk_1E6D78930;
    uint64_t v4 = *(void *)(a1 + 56);
    BOOL v5 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    uint64_t v8 = v4;
    char v9 = *(unsigned char *)(a1 + 64);
    id v7 = v5;
    dispatch_after(v3, MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __81__Application_ApplicationTesting___loadTabsForTesting_presentTabView_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadTabsForTesting:*(void *)(a1 + 48) - 1 presentTabView:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)prepareTabViewBringUpTest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__Application_ApplicationTesting__prepareTabViewBringUpTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__Application_ApplicationTesting__prepareTabViewBringUpTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTabViewBringUpTest];
}

- (void)_prepareTabViewBringUpTest
{
  [(Application *)self loadTabsForTesting:8 presentTabView:0];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__Application_ApplicationTesting___prepareTabViewBringUpTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __61__Application_ApplicationTesting___prepareTabViewBringUpTest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startTabViewBringUpTest];
  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 finishedSubTest:@"TabViewBringUpAnimationBeginSubTest" forTest:gCurrentTestName];
}

- (void)startTabViewBringUpTest
{
  [(Application *)self startedTest:gCurrentTestName];
  [(Application *)self startedSubTest:@"TabViewBringUpAnimationBeginSubTest" forTest:gCurrentTestName];
  dispatch_time_t v3 = [(Application *)self _browserControllerForApplicationTesting];
  id v5 = [v3 tabCollectionViewProvider];

  uint64_t v4 = [v5 tabThumbnailCollectionView];
  [v4 presentAnimated:1];
}

- (void)prepareTabViewOpenTest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__Application_ApplicationTesting__prepareTabViewOpenTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__Application_ApplicationTesting__prepareTabViewOpenTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTabViewOpenTest];
}

- (void)_prepareTabViewOpenTest
{
  [(Application *)self loadTabsForTesting:8 presentTabView:1];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__Application_ApplicationTesting___prepareTabViewOpenTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __58__Application_ApplicationTesting___prepareTabViewOpenTest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startTabViewOpenTest];
  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 finishedSubTest:@"TabViewOpenAnimationBeginSubTest" forTest:gCurrentTestName];
}

- (void)startTabViewOpenTest
{
  [(Application *)self startedTest:gCurrentTestName];
  [(Application *)self startedSubTest:@"TabViewOpenAnimationBeginSubTest" forTest:gCurrentTestName];
  dispatch_time_t v3 = [(Application *)self _browserControllerForApplicationTesting];
  id v5 = [v3 tabCollectionViewProvider];

  uint64_t v4 = [v5 tabThumbnailCollectionView];
  [v4 presentAnimated:1];
}

- (void)prepareTabViewSelectTest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__Application_ApplicationTesting__prepareTabViewSelectTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__Application_ApplicationTesting__prepareTabViewSelectTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTabViewSelectTest];
}

- (void)_prepareTabViewSelectTest
{
  [(Application *)self loadTabsForTesting:8 presentTabView:1];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__Application_ApplicationTesting___prepareTabViewSelectTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __60__Application_ApplicationTesting___prepareTabViewSelectTest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startTabViewSelectTest];
  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 finishedSubTest:@"TabViewSelectAnimationBeginSubTest" forTest:gCurrentTestName];
}

- (void)startTabViewSelectTest
{
  [(Application *)self startedTest:gCurrentTestName];
  [(Application *)self startedSubTest:@"TabViewSelectAnimationBeginSubTest" forTest:gCurrentTestName];
  dispatch_time_t v3 = [(Application *)self _browserControllerForApplicationTesting];
  id v7 = [v3 tabCollectionViewProvider];

  uint64_t v4 = [v7 tabOverview];
  id v5 = [v4 items];
  uint64_t v6 = [v5 objectAtIndexedSubscript:5];

  [v4 _dismissWithItem:v6];
}

- (void)prepareTabViewCloseTest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__Application_ApplicationTesting__prepareTabViewCloseTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__Application_ApplicationTesting__prepareTabViewCloseTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTabViewCloseTest];
}

- (void)_prepareTabViewCloseTest
{
  [(Application *)self loadTabsForTesting:8 presentTabView:1];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__Application_ApplicationTesting___prepareTabViewCloseTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __59__Application_ApplicationTesting___prepareTabViewCloseTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTabViewCloseTest];
}

- (void)startTabViewCloseTest
{
  dispatch_time_t v3 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 tabCollectionViewProvider];

  [(Application *)self startedTest:gCurrentTestName];
  [(Application *)self startedSubTest:@"TabViewSelectAnimationBeginSubTest" forTest:gCurrentTestName];
  id v5 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v6 = [v5 tabController];

  id v7 = [v6 currentTabDocuments];
  uint64_t v8 = [v7 objectAtIndexedSubscript:6];
  [v6 closeTabDocument:v8 animated:1];

  uint64_t v9 = gCurrentTestName;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke;
  v11[3] = &unk_1E6D77E20;
  id v12 = v4;
  id v10 = v4;
  [(Application *)self finishedTest:v9 waitForCommit:1 extraResults:0 withTeardownBlock:v11];
}

void __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke_2;
  block[3] = &unk_1E6D77E20;
  id v2 = *(id *)(a1 + 32);
  dispatch_after(1uLL, MEMORY[0x1E4F14428], block);
}

void __56__Application_ApplicationTesting__startTabViewCloseTest__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tabThumbnailCollectionView];
  [v1 dismissAnimated:1];
}

- (void)prepareTabViewRotationTest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__Application_ApplicationTesting__prepareTabViewRotationTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__Application_ApplicationTesting__prepareTabViewRotationTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTabViewRotationTest];
}

- (void)_prepareTabViewRotationTest
{
  [(Application *)self loadTabsForTesting:8 presentTabView:1];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__Application_ApplicationTesting___prepareTabViewRotationTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __62__Application_ApplicationTesting___prepareTabViewRotationTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTabViewRotationTest];
}

- (void)startTabViewRotationTest
{
  [(Application *)self startedTest:gCurrentTestName];
  if ([(id)gCurrentTestName rangeOfString:@"Landscape"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke_2;
    uint64_t v9 = &unk_1E6D77C20;
    id v10 = self;
    dispatch_time_t v3 = &v6;
    uint64_t v4 = self;
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke;
    id v14 = &unk_1E6D77C20;
    BOOL v15 = self;
    dispatch_time_t v3 = &v11;
    uint64_t v4 = self;
    uint64_t v5 = 1;
  }
  -[Application rotateIfNeeded:completion:](v4, "rotateIfNeeded:completion:", v5, v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:gCurrentTestName waitForCommit:1 extraResults:0];
}

uint64_t __59__Application_ApplicationTesting__startTabViewRotationTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:gCurrentTestName waitForCommit:1 extraResults:0];
}

- (void)prepareTabViewScrollTest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__Application_ApplicationTesting__prepareTabViewScrollTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__Application_ApplicationTesting__prepareTabViewScrollTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareTabViewScrollTest];
}

- (void)_prepareTabViewScrollTest
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke;
  v2[3] = &unk_1E6D77E20;
  v2[4] = self;
  [(Application *)self loadTabsForTesting:20 presentTabView:1 completion:v2];
}

void __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  dispatch_time_t v3 = [v2 tabCollectionViewProvider];

  uint64_t v4 = [v3 tabThumbnailCollectionView];
  objc_msgSend(v4, "test_scrollToTopWithoutAnimation");
  uint64_t v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke_2;
  v6[3] = &unk_1E6D77E20;
  void v6[4] = v5;
  [v5 installCACommitCompletionBlock:v6];
}

uint64_t __60__Application_ApplicationTesting___prepareTabViewScrollTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTabViewScrollTest];
}

- (void)startTabViewScrollTest
{
  if ([getRPTTestRunnerClass() isRecapAvailable])
  {
    dispatch_time_t v3 = [(Application *)self _browserControllerForApplicationTesting];
    id v8 = [v3 tabCollectionViewProvider];

    uint64_t v4 = [v8 tabThumbnailCollectionView];
    uint64_t v5 = [v4 view];
    uint64_t v6 = [v5 window];

    [v6 bounds];
    CGRect v11 = CGRectInset(v10, 0.0, 100.0);
    -[Application _scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:](self, "_scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:", gCurrentTestName, 0, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, v11.size.height + v11.size.height);
  }
  else
  {
    uint64_t v7 = gCurrentTestName;
    [(Application *)self failedTest:v7 withFailure:@"Recap not available"];
  }
}

- (void)_scrollContentWithTestName:(id)a3 scrollingBounds:(CGRect)a4 amplitude:(double)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  id v13 = a6;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v14 = (void *)getRPTScrollViewTestParametersClass_softClass;
  uint64_t v22 = getRPTScrollViewTestParametersClass_softClass;
  if (!getRPTScrollViewTestParametersClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getRPTScrollViewTestParametersClass_block_invoke;
    v18[3] = &unk_1E6D77CE0;
    void v18[4] = &v19;
    __getRPTScrollViewTestParametersClass_block_invoke((uint64_t)v18);
    id v14 = (void *)v20[3];
  }
  BOOL v15 = v14;
  _Block_object_dispose(&v19, 8);
  id v16 = [v15 alloc];
  uint64_t v17 = objc_msgSend(v16, "initWithTestName:scrollBounds:amplitude:direction:completionHandler:", gCurrentTestName, 1, 0, x, y, width, height, a5);
  [getRPTTestRunnerClass() runTestWithParameters:v17];
}

- (BOOL)startSidebarTest
{
  dispatch_time_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setBool:0 forKey:@"ShowSidebar"];

  uint64_t v4 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
  id v6 = (id)[v4 loadURLInNewTab:v5 inBackground:0 animated:0];

  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__Application_ApplicationTesting__startSidebarTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);

  return 1;
}

uint64_t __51__Application_ApplicationTesting__startSidebarTest__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__Application_ApplicationTesting__startSidebarTest__block_invoke_2;
  v3[3] = &unk_1E6D77C20;
  void v3[4] = v1;
  return [v1 rotateIfNeeded:3 completion:v3];
}

uint64_t __51__Application_ApplicationTesting__startSidebarTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runSidebarTest];
}

- (void)_runSidebarTest
{
  if ([(id)gCurrentTestName isEqualToString:@"SidebarOpenBookmarks"])
  {
    dispatch_time_t v3 = kCollectionTypeBookmarks;
  }
  else
  {
    if (![(id)gCurrentTestName isEqualToString:@"SidebarOpenReadingList"]) {
      goto LABEL_6;
    }
    dispatch_time_t v3 = kCollectionTypeReadingList;
  }
  +[BookmarksNavigationController test_setSavedStateCollection:*v3];
LABEL_6:
  [(Application *)self _populateInMemoryBookmarksDBForTestNamed:gCurrentTestName];
  id v5 = [(Application *)self _browserControllerForApplicationTesting];
  [(Application *)self _observeNotificationOnce:@"SidebarWillPresentNotification" handler:&__block_literal_global_354];
  [(Application *)self _observeNotificationOnce:@"SidebarDidPresentNotification" handler:&__block_literal_global_370];
  [(Application *)self startedTest:gCurrentTestName];
  [(Application *)self startedSubTest:@"Delay" forTest:gCurrentTestName withMetrics:&unk_1F3C73D28];
  uint64_t v4 = [v5 sidebarUIProxy];
  [v4 setShowingSidebar:1 completion:0];

  +[BookmarksNavigationController test_setSavedStateCollection:0];
}

void __50__Application_ApplicationTesting___runSidebarTest__block_invoke()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v0 installCACommitCompletionBlock:&__block_literal_global_356_0];
}

void __50__Application_ApplicationTesting___runSidebarTest__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v0 finishedSubTest:@"Delay" forTest:gCurrentTestName];

  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 startedSubTest:@"Animation" forTest:gCurrentTestName withMetrics:&unk_1F3C73D10];
}

void __50__Application_ApplicationTesting___runSidebarTest__block_invoke_3()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v0 finishedSubTest:@"Animation" forTest:gCurrentTestName];

  id v1 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v1 finishedTest:gCurrentTestName extraResults:0];
}

- (void)startedPurpleTest
{
  gRunningPurpleTest = 1;
  id v3 = [(id)gTestOptions objectForKey:@"testName"];
  [(Application *)self startedTest:v3];
}

- (void)finishedPurpleTest:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(id)gTestOptions objectForKey:@"testName"];
  if ([(Application *)self isRunningTest:v4])
  {
    [(Application *)self finishedTest:v4 extraResults:v5];
    gRunningPurpleTest = 0;
  }
}

- (void)failedPurpleTestWithError:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(id)gTestOptions objectForKey:@"testName"];
  if ([(Application *)self isRunningTest:v4])
  {
    if (v5) {
      NSLog((NSString *)@"Failed test %@: %@", v4, v5);
    }
    [(Application *)self failedTest:v4];
    gRunningPurpleTest = 0;
  }
}

- (BOOL)startCanvasTest:(id)a3
{
  self->_isRunningCanvasTest = 1;
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithString:v5];

  [(Application *)self startedPurpleTest];
  dispatch_time_t v7 = [(Application *)self _browserControllerForApplicationTesting];
  id v8 = [v7 tabController];
  uint64_t v9 = [v8 activeTabDocument];

  [v9 loadTestURL:v6 withInjectedBundle:1 withCallback:0];
  [(Application *)self performSelector:sel__pollCanvasTest_ withObject:0 afterDelay:5.0];

  return 1;
}

- (void)_pollCanvasTest:(id)a3
{
  uint64_t v4 = [(Application *)self _browserControllerForApplicationTesting];
  id v5 = [v4 tabController];
  id v9 = [v5 activeTabDocument];

  id v6 = [v9 URL];
  dispatch_time_t v7 = [v6 lastPathComponent];
  int v8 = [v7 isEqualToString:@"results.html"];

  if (v8) {
    [(Application *)self finishedCanvasTestWithURL:v6 forTabDocument:v9];
  }
  else {
    [(Application *)self performSelector:sel__pollCanvasTest_ withObject:0 afterDelay:5.0];
  }
}

- (void)finishedCanvasTestWithURL:(id)a3 forTabDocument:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v28 = a4;
  uint64_t v25 = self;
  self->_isRunningCanvasTest = 0;
  id v6 = [a3 fragment];
  dispatch_time_t v7 = [v6 stringByRemovingPercentEncoding];

  int v27 = v7;
  [v7 dataUsingEncoding:4];
  char v26 = v34 = 0;
  int v8 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
  id v24 = v34;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = (void *)MEMORY[0x1E4F1C978];
        BOOL v15 = (void *)MEMORY[0x1E4F28ED0];
        id v16 = [*(id *)(*((void *)&v30 + 1) + 8 * v13) objectForKey:@"averageTestFPS"];
        [v16 floatValue];
        uint64_t v17 = objc_msgSend(v15, "numberWithFloat:");
        uint64_t v18 = objc_msgSend(v14, "arrayWithObjects:", v17, @"fps", 0, v24);

        uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"averageTestFPS", @"averageTestFPSUnits", 0);
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v18 forKeys:v19];
        [v9 addEntriesFromDictionary:v20];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  [(Application *)v25 finishedPurpleTest:v9];
  uint64_t v21 = [(Application *)v25 _browserControllerForApplicationTesting];
  uint64_t v22 = [v21 tabController];

  [v22 closeTabDocument:v28 animated:0];
  unint64_t v23 = [v22 activeTabDocument];
  [v22 closeTabDocument:v23 animated:0];
}

- (id)_syntheticHTMLString
{
  return @"<html><head><script>function f(){var text='';for (var i=0;i<100;++i){text+=\"<div>\";for (var j=0;j<100;++j){text += \"<span>&#x1F603;</span>\"}text += \"</div>\";} document.getElementById('t').innerHTML=text;}</script></head><body onload=\"f()\"><div id=\"t\"></div></body></html>";
}

- (BOOL)startTabBarTest
{
  id v3 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 tabController];

  id v5 = [v4 tabCollectionViewProvider];
  id v6 = [(id)gTestOptions objectForKeyedSubscript:@"testName"];
  dispatch_time_t v7 = [(Application *)self _browserControllerForApplicationTesting];
  BOOL v8 = [(Application *)self overrideBrowserStateForTestNamed:v6 browserController:v7];

  if (v8)
  {
    [v4 readState];
    id v9 = [v5 tabThumbnailCollectionView];
    [v9 dismissAnimated:0];
  }
  uint64_t v10 = [v4 activeTabDocument];
  uint64_t v11 = [(Application *)self _syntheticHTMLString];
  uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"data:text/html,"];
  [v10 loadAlternateHTMLString:v11 baseURL:v12 forUnreachableURL:0];

  dispatch_time_t v13 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__Application_ApplicationTesting__startTabBarTest__block_invoke;
  block[3] = &unk_1E6D78980;
  id v18 = v4;
  uint64_t v19 = self;
  id v20 = v6;
  id v14 = v6;
  id v15 = v4;
  dispatch_after(v13, MEMORY[0x1E4F14428], block);

  return 1;
}

void __50__Application_ApplicationTesting__startTabBarTest__block_invoke(id *a1)
{
  uint64_t v2 = 8;
  do
  {
    [a1[4] insertNewBlankTabDocumentAnimated:0];
    id v3 = [a1[4] activeTabDocument];
    uint64_t v4 = [a1[5] _syntheticHTMLString];
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"data:text/html,"];
    [v3 loadAlternateHTMLString:v4 baseURL:v5 forUnreachableURL:0];

    --v2;
  }
  while (v2);
  id v6 = [a1[5] _browserControllerForApplicationTesting];
  [v6 setFavoritesState:0];

  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__Application_ApplicationTesting__startTabBarTest__block_invoke_2;
  v10[3] = &unk_1E6D77D90;
  id v8 = a1[6];
  id v9 = a1[5];
  id v11 = v8;
  id v12 = v9;
  dispatch_after(v7, MEMORY[0x1E4F14428], v10);
}

uint64_t __50__Application_ApplicationTesting__startTabBarTest__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"TabBarSwitchTab"];
  if (result)
  {
    char IsPad = _SFDeviceIsPad();
    uint64_t v4 = *(void **)(a1 + 40);
    if (IsPad)
    {
      return [v4 _runTabBarSwitchTabTest];
    }
    else
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __50__Application_ApplicationTesting__startTabBarTest__block_invoke_3;
      v5[3] = &unk_1E6D77C20;
      void v5[4] = v4;
      return [v4 rotateIfNeeded:3 completion:v5];
    }
  }
  return result;
}

uint64_t __50__Application_ApplicationTesting__startTabBarTest__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runTabBarSwitchTabTest];
}

- (void)_runTabBarSwitchTabTest
{
  id v3 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 tabController];

  id v5 = [v4 tabDocuments];
  id v6 = [v4 activeTabDocument];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__Application_ApplicationTesting___runTabBarSwitchTabTest__block_invoke;
  v13[3] = &unk_1E6D77F08;
  void v13[4] = self;
  [(Application *)self _observeNotificationOnce:@"TabBarDidSwitchTabNotification" handler:v13];
  [(Application *)self startedTest:gCurrentTestName];
  uint64_t v7 = [v5 indexOfObject:v6];
  if (v7 + 1 == [v5 count]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  id v9 = [v5 objectAtIndex:v8];
  uint64_t v10 = [v4 tabCollectionViewProvider];
  id v11 = [v10 tabBar];
  id v12 = [v9 tabBarItem];
  [v11 _activateItemIfNeeded:v12];
}

uint64_t __58__Application_ApplicationTesting___runTabBarSwitchTabTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedTest:gCurrentTestName extraResults:0];
}

- (void)runTabOverviewTest
{
  id v3 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 tabController];

  id v5 = [v4 tabCollectionViewProvider];
  id v6 = [(id)gTestOptions objectForKeyedSubscript:@"testName"];
  uint64_t v7 = [(Application *)self _browserControllerForApplicationTesting];
  BOOL v8 = [(Application *)self overrideBrowserStateForTestNamed:v6 browserController:v7];

  if (v8)
  {
    [v4 readState];
    id v9 = [MEMORY[0x1E4F78558] settings];
    uint64_t v10 = [(Application *)self _browserControllerForApplicationTesting];
    id v11 = [v10 UUID];
    int v12 = [v9 isShowingTabViewForWindowWithUUID:v11];

    if (v12)
    {
      dispatch_time_t v13 = [v5 tabThumbnailCollectionView];
      [v13 presentAnimated:0];
    }
  }
  if ([v6 isEqualToString:@"TabOverviewScroll"])
  {
    [(Application *)self _runTabOverviewScrollPerfTest];
  }
  else if ([v6 isEqualToString:@"TabOverviewOpenClose"])
  {
    [(Application *)self _runTabOverviewPresentingAndDismissalTest];
  }
  else if ([v6 isEqualToString:@"TabOverviewOpenNewTab"])
  {
    if (_SFDeviceIsPad())
    {
      [(Application *)self _runTabOverviewOpenNewTabTest];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __53__Application_ApplicationTesting__runTabOverviewTest__block_invoke;
      v14[3] = &unk_1E6D77C20;
      void v14[4] = self;
      [(Application *)self rotateIfNeeded:3 completion:v14];
    }
  }
}

uint64_t __53__Application_ApplicationTesting__runTabOverviewTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runTabOverviewOpenNewTabTest];
}

- (void)_runTabOverviewOpenNewTabTest
{
  id v3 = [(id)gTestOptions objectForKeyedSubscript:@"testName"];
  uint64_t v4 = [(Application *)self _browserControllerForApplicationTesting];
  id v5 = [v4 tabController];

  id v6 = [v5 tabCollectionViewProvider];
  uint64_t v7 = [v6 tabThumbnailCollectionView];
  objc_initWeak(&location, v7);
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke;
  v13[3] = &unk_1E6D789D0;
  id v14 = v7;
  id v9 = v7;
  objc_copyWeak(&v18, &location);
  id v15 = v3;
  id v16 = v6;
  id v17 = v5;
  id v10 = v5;
  id v11 = v6;
  id v12 = v3;
  dispatch_after(v8, MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_2;
  v4[3] = &unk_1E6D789A8;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  +[TabCollectionViewBlockObserver beginObservingTabView:v2 steadyStateBlock:v4];
  id v3 = (id *)MEMORY[0x1E4FB2608];
  [(id)*MEMORY[0x1E4FB2608] startedTest:*(void *)(a1 + 40)];
  [*v3 startedSubTest:@"Delay" forTest:*(void *)(a1 + 40) withMetrics:&unk_1F3C73D40];
  [*(id *)(a1 + 56) openNewTabWithOptions:0 completionHandler:0];
  [*v3 startedSubTest:@"Animation" forTest:*(void *)(a1 + 40) withMetrics:&unk_1F3C73D58];

  objc_destroyWeak(&v7);
}

void __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_2(id *a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_3;
  v5[3] = &unk_1E6D780C8;
  char v8 = a2;
  id v6 = a1[4];
  id v7 = a1[5];
  +[TabCollectionViewBlockObserver performIgnoringObservationForTabView:WeakRetained block:v5];
}

void __64__Application_ApplicationTesting___runTabOverviewOpenNewTabTest__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)
    || ([(id)*MEMORY[0x1E4FB2608] finishedSubTest:@"Delay" forTest:*(void *)(a1 + 32)],
        *(unsigned char *)(a1 + 48)))
  {
    uint64_t v2 = [*(id *)(a1 + 40) tabThumbnailCollectionView];
    uint64_t v3 = [v2 presentationState];

    if (!v3)
    {
      uint64_t v4 = (void **)MEMORY[0x1E4FB2608];
      [(id)*MEMORY[0x1E4FB2608] finishedSubTest:@"Animation" forTest:*(void *)(a1 + 32)];
      id v5 = *v4;
      uint64_t v6 = *(void *)(a1 + 32);
      [v5 finishedTest:v6 extraResults:0];
    }
  }
}

- (void)_runTabOverviewPresentingAndDismissalTest
{
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v3 = [(id)gTestOptions objectForKeyedSubscript:@"testName"];
  uint64_t v4 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"iterations");
  int v5 = [v4 intValue];

  if (v5 <= 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  [(id)*MEMORY[0x1E4FB2608] startedTest:v3];
  id v7 = [(Application *)self _browserControllerForApplicationTesting];
  char v8 = [v7 tabController];

  id v9 = [v8 tabCollectionViewProvider];
  id v10 = [v9 tabThumbnailCollectionView];
  objc_initWeak(&location, v10);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke;
  id v16 = &unk_1E6D78A20;
  objc_copyWeak(v20, &location);
  id v18 = v22;
  id v11 = v3;
  id v17 = v11;
  uint64_t v19 = v23;
  v20[1] = (id)v6;
  +[TabCollectionViewBlockObserver beginObservingTabView:v10 steadyStateBlock:&v13];
  id v12 = objc_msgSend(v9, "tabSwitcherViewController", v13, v14, v15, v16);
  [v12 applyContentIfNeeded];

  [v10 dismissAnimated:1];
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

void __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke_2;
  v10[3] = &unk_1E6D789F8;
  char v16 = a2;
  int v5 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  id v12 = WeakRetained;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  id v9 = WeakRetained;
  +[TabCollectionViewBlockObserver performIgnoringObservationForTabView:v9 block:v10];
}

uint64_t __76__Application_ApplicationTesting___runTabOverviewPresentingAndDismissalTest__block_invoke_2(uint64_t result)
{
  id v1 = (void *)result;
  uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24);
  if (*(unsigned char *)(result + 72))
  {
    uint64_t v3 = (void **)MEMORY[0x1E4FB2608];
    if (v2 >= 1) {
      [(id)*MEMORY[0x1E4FB2608] finishedSubTest:@"openClose" forTest:*(void *)(result + 32)];
    }
    uint64_t v4 = (void *)v1[5];
    if (*(unsigned char *)(*(void *)(v1[7] + 8) + 24)) {
      uint64_t result = [v4 dismissAnimated:1];
    }
    else {
      uint64_t result = [v4 presentAnimated:1];
    }
    *(unsigned char *)(*(void *)(v1[7] + 8) + 24) ^= 1u;
    uint64_t v7 = *(void *)(v1[6] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
    *(void *)(v7 + 24) = v8 + 1;
    if (v8 >= v1[8])
    {
      id v9 = *v3;
      uint64_t v10 = v1[4];
      return [v9 finishedTest:v10 extraResults:0];
    }
  }
  else if (v2 >= 1)
  {
    int v5 = (void *)*MEMORY[0x1E4FB2608];
    uint64_t v6 = v1[4];
    return [v5 startedSubTest:@"openClose" forTest:v6];
  }
  return result;
}

- (void)_runTabOverviewScrollPerfTest
{
  id v8 = [(id)gTestOptions objectForKeyedSubscript:@"testName"];
  uint64_t v3 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 tabCollectionViewProvider];
  int v5 = [v4 tabThumbnailCollectionView];
  uint64_t v6 = [v5 view];
  uint64_t v7 = [v6 window];

  [v7 bounds];
  CGRect v11 = CGRectInset(v10, 0.0, 100.0);
  -[Application _scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:](self, "_scrollContentWithTestName:scrollingBounds:amplitude:completionHandler:", v8, 0, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, v11.size.height + v11.size.height);
}

- (BOOL)prepareBookmarksTest
{
  self->_isRunningShowBookmarksTest = 1;
  self->_startedBookmarksTest = 0;
  uint64_t v3 = [(Application *)self _browserControllerForApplicationTesting];
  if ([v3 isPresentingModalBookmarksController]) {
    [v3 setPresentingModalBookmarksController:0 withExclusiveCollection:0 bookmarkUUIDString:0 animated:0];
  }
  else {
    [(Application *)self startBookmarksTest];
  }

  return 1;
}

- (void)startBookmarksTest
{
  self->_startedBookmarksTest = 1;
  uint64_t v3 = +[Application sharedApplication];
  [v3 startedPurpleTest];

  id v4 = [(Application *)self _browserControllerForApplicationTesting];
  [v4 performSelector:sel_toggleBookmarksPresentation withObject:0 afterDelay:0.0];
}

- (void)finishedBookmarksTest
{
  int v2 = --gShowBookmarksTestIterations;
  if (self->_isRunningShowBookmarksTest)
  {
    if (v2)
    {
      id v5 = [(Application *)self _browserControllerForApplicationTesting];
      [v5 performSelector:sel_toggleBookmarksPresentation withObject:0 afterDelay:0.0];
    }
    else
    {
      id v4 = +[Application sharedApplication];
      [v4 finishedPurpleTest:0];

      self->_isRunningShowBookmarksTest = 0;
    }
  }
}

- (void)_populateInMemoryBookmarksDBForTestNamed:(id)a3
{
  id v24 = a3;
  +[WebBookmarkCollection test_overrideMainBookmarkCollection]();
  uint64_t v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  if ([v24 isEqualToString:@"BookmarksViewFavoritesScroll"])
  {
    id v4 = [v3 favoritesFolder];
    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB60E0]);
      uint64_t v6 = [v3 configuration];
      id v4 = objc_msgSend(v5, "initFolderWithParentID:collectionType:", 0, objc_msgSend(v6, "collectionType"));

      [v3 setFavoritesFolder:v4 localOnly:1];
      [v3 saveBookmark:v4];
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 0; i != 250; ++i)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Test_Favorites_#%lu", i);
      CGRect v10 = objc_msgSend(NSString, "stringWithFormat:", @"http://www.apple.com/#%ld", i);
      id v11 = objc_alloc(MEMORY[0x1E4FB60E0]);
      id v12 = [v3 configuration];
      uint64_t v13 = objc_msgSend(v11, "initWithTitle:address:collectionType:", v9, v10, objc_msgSend(v12, "collectionType"));

      objc_msgSend(v3, "moveBookmark:toFolderWithID:", v13, objc_msgSend(v4, "identifier"));
      [v7 addObject:v13];
    }
    [v3 saveBookmarks:v7 postNotification:1];

    goto LABEL_7;
  }
  if (([v24 isEqualToString:@"BookmarksViewReadingListsScroll"] & 1) != 0
    || [v24 isEqualToString:@"SidebarOpenReadingList"])
  {
    for (uint64_t j = 0; j != 150; ++j)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Test_ReadingList_#%lu", j);
      char v16 = objc_msgSend(NSString, "stringWithFormat:", @"http://www.testfakereadinglist_favorites_bookmark_address.com/readinglist/id=#%ld", j);
      id v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v16);
      -[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](v3, v15, v17, @"Lorem ipsum dolor sit amet, pellentesque augue nonummy, neque lacinia velit vulputate ipsum, metus libero id pede, auctor felis metus.", 0, @"testSite", 0, 1, 0, 0, 0);
    }
  }
  else if (([v24 isEqualToString:@"BookmarksViewBookmarksScroll"] & 1) != 0 {
         || [v24 isEqualToString:@"SidebarOpenBookmarks"])
  }
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t k = 0; k != 250; ++k)
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Test_Bookmarks_#%lu", k);
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"http://www.testfakereadinglist_favorites_bookmark_address.com/bookmarks/id=#%ld", k);
      id v21 = objc_alloc(MEMORY[0x1E4FB60E0]);
      uint64_t v22 = [v3 configuration];
      unint64_t v23 = objc_msgSend(v21, "initWithTitle:address:collectionType:", v19, v20, objc_msgSend(v22, "collectionType"));

      [v4 addObject:v23];
    }
    [v3 saveBookmarks:v4 postNotification:0];
LABEL_7:
  }
}

- (id)_scrollViewForTestNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v6 = [v5 bookmarksNavigationController];

  if ([v4 isEqualToString:@"BookmarksViewBookmarksScroll"])
  {
    uint64_t v7 = [v6 topBookmarksTableViewController];
LABEL_7:
    CGRect v10 = v7;
    id v12 = [v7 tableView];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"BookmarksViewFavoritesScroll"])
  {
    id v8 = [(Application *)self _browserControllerForApplicationTesting];
    id v9 = [v8 rootViewController];
    CGRect v10 = [v9 catalogViewController];

    id v11 = [v10 startPageViewController];
    id v12 = objc_msgSend(v11, "test_scrollView");

LABEL_8:
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"BookmarksViewReadingListsScroll"])
  {
    uint64_t v7 = [v6 topReadingListViewController];
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (void)_switchToBookmarksCollectionForTestNamed:(id)a3
{
  id v7 = a3;
  id v4 = [(Application *)self _browserControllerForApplicationTesting];
  id v5 = [v4 bookmarksNavigationController];

  if ([v7 isEqualToString:@"BookmarksViewBookmarksScroll"])
  {
    [v5 setCurrentCollection:@"BookmarksCollection"];
  }
  else if ([v7 isEqualToString:@"BookmarksViewReadingListsScroll"])
  {
    uint64_t v6 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
    [v5 setCurrentCollection:@"ReadingListCollection"];
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v6];
  }
}

- (void)runBookmarksViewTest
{
  uint64_t v3 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"testName");
  [(Application *)self _populateInMemoryBookmarksDBForTestNamed:v3];
  id v4 = objc_msgSend((id)gTestOptions, "safari_stringForKey:", @"iterations");
  int v5 = [v4 intValue];

  char v6 = [v3 isEqualToString:@"BookmarksViewFavoritesScroll"];
  id v7 = [(Application *)self _browserControllerForApplicationTesting];
  id v8 = v7;
  if (v6)
  {
    [v7 setFavoritesState:4];
  }
  else
  {
    [v7 showBookmarksPanelWithNonAnimatedTransition];

    [(Application *)self _switchToBookmarksCollectionForTestNamed:v3];
  }
  if (v5 <= 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v5;
  }
  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__Application_ApplicationTesting__runBookmarksViewTest__block_invoke;
  block[3] = &unk_1E6D78A48;
  void block[4] = self;
  id v13 = v3;
  uint64_t v14 = v9;
  id v11 = v3;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

void __55__Application_ApplicationTesting__runBookmarksViewTest__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _scrollViewForTestNamed:*(void *)(a1 + 40)];
  [v2 _performScrollTest:*(void *)(a1 + 40) iterations:*(unsigned int *)(a1 + 48) delta:10];
}

- (BOOL)isRunningShowBookmarksTest
{
  return self->_isRunningShowBookmarksTest;
}

- (BOOL)isRunningCanvasTest
{
  return self->_isRunningCanvasTest;
}

- (BOOL)didStartBookmarksTest
{
  return self->_startedBookmarksTest;
}

+ (id)sharedTestRunner
{
  return (id)gRunner;
}

- (void)startSearchPerformanceTest
{
}

- (id)searchParametersWithCFEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F98F58]);
    [v5 setIsCFSearch:1];
    [v5 setEnableCompletionListHistoryDeduplicationValue:0];
    [v5 setEnableCompletionListHistoryDeduplicationSwitchToTabValue:0];
    [v4 addObject:v5];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F98F58]);
  [v6 setIsCFSearch:0];
  [v6 setEnableCompletionListHistoryDeduplicationValue:1];
  [v6 setEnableCompletionListHistoryDeduplicationSwitchToTabValue:1];
  [v4 addObject:v6];

  return v4;
}

- (void)startSearchPerformanceDetailedTestWithCF:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F98B98]);
  id v6 = (void *)gHistoryServiceConnection;
  gHistoryServiceConnection = (uint64_t)v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F98A20]);
  id v8 = (void *)gHistoryPushConnection;
  gHistoryPushConnection = (uint64_t)v7;

  uint64_t v9 = [(id)gHistoryServiceConnection queryMemoryFootprintWithError:0];
  dispatch_time_t v10 = (void *)gInitialHistoryServiceMemoryFootprint;
  gInitialHistoryServiceMemoryFootprint = v9;

  uint64_t v11 = [(id)gHistoryPushConnection queryMemoryFootprintWithError:0];
  id v12 = (void *)gInitialHistoryPushAgentMemoryFootprint;
  gInitialHistoryPushAgentMemoryFootprint = v11;

  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F97ED8]) initWithError:0];
  uint64_t v14 = (void *)gInitialSafariMemoryFootprint;
  gInitialSafariMemoryFootprint = v13;

  [(Application *)self startSearchPerformanceTestWithTestStrings:&unk_1F3C73D88 perQuery:1 withCF:v3];
}

- (void)startSearchPerformanceTestWithTestStrings:(id)a3
{
}

- (void)startSearchPerformanceTestWithTestStrings:(id)a3 perQuery:(BOOL)a4 withCF:(BOOL)a5
{
  id v7 = a3;
  [(Application *)self startedPurpleTest];
  id v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  dispatch_time_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke;
  v44[3] = &unk_1E6D78A70;
  BOOL v47 = a4;
  v44[4] = self;
  id v11 = v10;
  id v45 = v11;
  id v46 = v9;
  id v12 = (void *)MEMORY[0x1E4E42950](v44);
  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__1;
  v42[4] = __Block_byref_object_dispose__1;
  uint64_t v14 = [MEMORY[0x1E4F28F08] mainQueue];
  id v43 = [v13 addObserverForName:@"completionProviderDidStart" object:0 queue:v14 usingBlock:v12];

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__1;
  v40[4] = __Block_byref_object_dispose__1;
  uint64_t v15 = [MEMORY[0x1E4F28F08] mainQueue];
  id v41 = [v13 addObserverForName:@"completionProviderDidFinish" object:0 queue:v15 usingBlock:v12];

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__1;
  v38[4] = __Block_byref_object_dispose__1;
  char v16 = [MEMORY[0x1E4F28F08] mainQueue];
  id v39 = [v13 addObserverForName:@"catalogViewControllerDidStart" object:0 queue:v16 usingBlock:v12];

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__1;
  v36[4] = __Block_byref_object_dispose__1;
  id v17 = [MEMORY[0x1E4F28F08] mainQueue];
  id v37 = [v13 addObserverForName:@"catalogViewControllerDidFinish" object:0 queue:v17 usingBlock:v12];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_2;
  block[3] = &unk_1E6D78A98;
  long long v33 = v40;
  id v34 = v38;
  id v35 = v36;
  id v29 = v13;
  long long v30 = self;
  long long v31 = v9;
  long long v32 = v42;
  id v18 = v13;
  uint64_t v19 = MEMORY[0x1E4F14428];
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_4;
  void v23[3] = &unk_1E6D78AC0;
  BOOL v26 = a4;
  BOOL v27 = a5;
  v23[4] = self;
  id v24 = v7;
  uint64_t v25 = v8;
  id v20 = v8;
  id v21 = v7;
  dispatch_async(v19, v23);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke(uint64_t a1, void *a2)
{
  id v42 = a2;
  BOOL v3 = [v42 name];
  if (([v3 isEqualToString:@"completionProviderDidStart"] & 1) == 0)
  {
    id v4 = [v42 name];
    [v4 isEqualToString:@"completionProviderDidFinish"];
  }
  id v5 = [v42 name];
  if ([v5 isEqualToString:@"completionProviderDidStart"])
  {
    int v6 = 1;
  }
  else
  {
    id v7 = [v42 name];
    int v6 = [v7 isEqualToString:@"catalogViewControllerDidStart"];
  }
  id v8 = [v42 object];
  uint64_t v9 = (objc_class *)objc_opt_class();
  dispatch_time_t v10 = NSStringFromClass(v9);

  id v11 = [v42 userInfo];
  id v12 = [v11 objectForKeyedSubscript:@"query"];

  uint64_t v13 = [v42 userInfo];
  id v41 = [v13 objectForKeyedSubscript:@"time"];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v14 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
    uint64_t v15 = [v14 rootViewController];
    [v15 catalogViewController];
    v17 = char v16 = v10;
    [v17 completionList];
    uint64_t v19 = v18 = v12;
    id v20 = [v19 searchParametersList];
    [v20 firstObject];
    uint64_t v21 = a1;
    unint64_t v23 = v22 = v6;
    int v24 = [v23 isCFSearch];
    uint64_t v25 = @"normal - ";
    if (v24) {
      uint64_t v25 = @"cf - ";
    }
    long long v40 = v25;

    int v6 = v22;
    a1 = v21;

    id v12 = v18;
    dispatch_time_t v10 = v16;
  }
  else
  {
    long long v40 = &stru_1F3C268E8;
  }
  BOOL v26 = [*(id *)(a1 + 40) objectForKey:v10];
  BOOL v27 = v26;
  if (v6)
  {
    if (!v26)
    {
      BOOL v27 = [MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(a1 + 40) setObject:v27 forKey:v10];
    }
    id v28 = v41;
    [v27 setObject:v41 forKeyedSubscript:v12];
  }
  else
  {
    id v29 = [v26 objectForKeyedSubscript:v12];
    long long v30 = v29;
    if (v27 && v29)
    {
      long long v31 = (void *)MEMORY[0x1E4F28ED0];
      id v28 = v41;
      [v41 doubleValue];
      double v33 = v32;
      [v30 doubleValue];
      id v35 = [v31 numberWithDouble:v33 - v34];
      uint64_t v36 = v10;
      id v37 = v40;
      if (*(unsigned char *)(a1 + 56)) {
        [NSString stringWithFormat:@"%@'%@' - %@ completion time", v40, v12, v10];
      }
      else {
      long long v38 = [NSString stringWithFormat:@"%@%@ completion time", v40, v10, v39];
      }
      [*(id *)(a1 + 48) setObject:v35 forKeyedSubscript:v38];

      dispatch_time_t v10 = v36;
      goto LABEL_23;
    }

    id v28 = v41;
  }
  id v37 = v40;
LABEL_23:
}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_3;
  block[3] = &unk_1E6D78A98;
  id v5 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObserver:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [*(id *)(a1 + 32) removeObserver:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 32) removeObserver:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [*(id *)(a1 + 32) removeObserver:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  id v11 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  if (gInitialSafariMemoryFootprint)
  {
    id v12 = [*(id *)(a1 + 40) _generateMemoryFootprintResults:v10];
    [v11 finishedPurpleTest:v12];
  }
  else
  {
    [v11 finishedPurpleTest:v10];
  }
}

void __93__Application_ApplicationTesting__startSearchPerformanceTestWithTestStrings_perQuery_withCF___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  [v2 setFavoritesFieldFocused:1 animated:1];

  long long v3 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 rootViewController];
  id v7 = [v4 catalogViewController];

  if (*(unsigned char *)(a1 + 56))
  {
    [v7 _ensureCompletionListAndParsecSession];
    id v5 = [*(id *)(a1 + 32) searchParametersWithCFEnabled:*(unsigned __int8 *)(a1 + 57)];
    uint64_t v6 = [v7 completionList];
    [v6 setSearchParametersList:v5];
  }
  [*(id *)(a1 + 32) _doSearchTestOnCVC:v7 WithTestStrings:*(void *)(a1 + 40) andDispatchGroup:*(void *)(a1 + 48)];
}

- (void)startSearchPerformanceUnifiedFieldKeyTimeTest
{
  [(Application *)self startedPurpleTest];
  long long v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  uint64_t v4 = MEMORY[0x1E4F14428];
  dispatch_group_notify(v3, MEMORY[0x1E4F14428], block);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_3;
  v6[3] = &unk_1E6D77D90;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_2;
  block[3] = &unk_1E6D77E20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPurpleTest:0];
}

void __80__Application_ApplicationTesting__startSearchPerformanceUnifiedFieldKeyTimeTest__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  [v2 setFavoritesFieldFocused:1 animated:1];

  id v14 = (id)[&unk_1F3C73DA0 mutableCopy];
  long long v3 = [*(id *)(a1 + 32) _browserControllerForApplicationTesting];
  uint64_t v4 = [v3 rootViewController];
  id v5 = [v4 catalogViewController];

  [v5 _ensureCompletionListAndParsecSession];
  uint64_t v6 = [PPTUniversalCompletionProvider alloc];
  id v7 = +[FrequentlyVisitedSitesController sharedController];
  uint64_t v8 = [(UniversalSearchCompletionProvider *)v6 initWithFrequentlyVisitedSitesController:v7];

  uint64_t v9 = [v5 completionList];
  [(CompletionProvider *)v8 setDelegate:v9];

  uint64_t v10 = [v5 completionList];
  [v10 setUniversalSearchProvider:v8];

  id v11 = [[PPTSearchSuggestionProvider alloc] initForPrivateBrowsing:0];
  id v12 = [v5 completionList];
  [v11 setDelegate:v12];

  uint64_t v13 = [v5 completionList];
  [v13 setSuggestionProvider:v11];

  [*(id *)(a1 + 32) _doSearchTestOnCVC:v5 WithTestStrings:v14 andDispatchGroup:*(void *)(a1 + 40)];
}

- (void)_doSearchTestOnCVC:(id)a3 WithTestStrings:(id)a4 andDispatchGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_group_t v10 = dispatch_group_create();
  id v11 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke;
  v16[3] = &unk_1E6D78AE8;
  id v17 = v8;
  dispatch_group_t v18 = v10;
  id v19 = v7;
  id v20 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(v11, v16);
}

void __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_2;
        block[3] = &unk_1E6D78980;
        id v13 = *(id *)(a1 + 48);
        uint64_t v14 = v8;
        id v15 = *(id *)(a1 + 40);
        dispatch_async(v6, block);
        dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_3;
  v10[3] = &unk_1E6D77E20;
  id v11 = *(id *)(a1 + 56);
  dispatch_after(v9, MEMORY[0x1E4F14428], v10);
}

uint64_t __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "test_simulateTyping:inGroup:startIndex:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1);
}

void __87__Application_ApplicationTesting___doSearchTestOnCVC_WithTestStrings_andDispatchGroup___block_invoke_3(uint64_t a1)
{
}

- (BOOL)_resetHistoryWithCompressedDatabaseAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = objc_msgSend(v6, "safari_settingsDirectoryURL");
  uint64_t v8 = objc_msgSend(v6, "safari_ensureDirectoryExists:", v7);
  dispatch_time_t v9 = [NSString stringWithFormat:@"History-%@.db", gCurrentTestName];
  dispatch_group_t v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:0];

  id v11 = objc_msgSend(v6, "safari_settingsDirectoryURL");
  id v12 = [NSString stringWithFormat:@"History-%@.db-wal", gCurrentTestName];
  id v13 = [v11 URLByAppendingPathComponent:v12 isDirectory:0];

  uint64_t v14 = objc_msgSend(v6, "safari_settingsDirectoryURL");
  id v15 = [NSString stringWithFormat:@"History-%@.db-shm", gCurrentTestName];
  long long v16 = [v14 URLByAppendingPathComponent:v15 isDirectory:0];

  [v6 removeItemAtURL:v10 error:0];
  [v6 removeItemAtURL:v13 error:0];
  [v6 removeItemAtURL:v16 error:0];
  long long v17 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:a4];
  long long v18 = v17;
  if (!v17)
  {
    id v35 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[Application(ApplicationTesting) _resetHistoryWithCompressedDatabaseAtURL:error:]();
    }
    goto LABEL_15;
  }
  long long v19 = objc_msgSend(v17, "safari_dataByDecompressingData");
  char v20 = [v19 writeToURL:v10 options:0 error:a4];

  if ((v20 & 1) == 0)
  {
    uint64_t v36 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[Application(ApplicationTesting) _resetHistoryWithCompressedDatabaseAtURL:error:]();
    }
LABEL_15:
    BOOL v34 = 0;
    goto LABEL_16;
  }
  id v38 = v5;
  id v21 = v10;
  int v22 = dispatch_queue_create("rebaseHistoryVisitTimesOfDatabaseAt", 0);
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F97F98]) initWithURL:v21 queue:v22];

  uint64_t v46 = 0;
  BOOL v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  uint64_t v50 = 0;
  uint64_t v51 = (uint64_t)&v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__1;
  uint64_t v54 = __Block_byref_object_dispose__1;
  uint64_t v55 = 0;
  blocuint64_t k = MEMORY[0x1E4F143A8];
  p_blocuint64_t k = 3221225472;
  uint64_t v41 = (uint64_t)__rebaseHistoryVisitTimesOfDatabaseAt_block_invoke;
  id v42 = &unk_1E6D78B78;
  long long v44 = &v46;
  id v24 = v23;
  id v43 = v24;
  id v45 = &v50;
  dispatch_sync(v22, &block);
  int v25 = *((unsigned __int8 *)v47 + 24);
  if (a4 && !*((unsigned char *)v47 + 24)) {
    *a4 = *(id *)(v51 + 40);
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v46, 8);

  if (v25)
  {
    blocuint64_t k = 0;
    p_blocuint64_t k = (uint64_t)&block;
    uint64_t v41 = 0x3020000000;
    LOBYTE(v44) = 0;
    BOOL v26 = +[History sharedHistory];
    uint64_t v50 = MEMORY[0x1E4F143A8];
    uint64_t v51 = 3221225472;
    uint64_t v52 = (uint64_t)__waitUntilHistoryFinishLoading_block_invoke;
    uint64_t v53 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6D78BA0;
    BOOL v27 = v26;
    uint64_t v54 = v27;
    uint64_t v55 = &block;
    [v27 performBlockAfterHistoryHasLoaded:&v50];
    if (!*(unsigned char *)(p_block + 40))
    {
      uint64_t v28 = *MEMORY[0x1E4F1C3A0];
      do
      {
        id v29 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        long long v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.01];
        [v29 runMode:v28 beforeDate:v30];
      }
      while (!*(unsigned char *)(p_block + 40));
    }

    _Block_object_dispose(&block, 8);
    long long v31 = +[History sharedHistory];
    [v31 _unload];

    double v32 = (objc_class *)objc_opt_class();
    ClassMethod = class_getClassMethod(v32, sel_historyDatabaseURL);
    method_setImplementation(ClassMethod, (IMP)pptHistoryOverride);
    objc_storeStrong((id *)&pptHistoryURL, v10);
    BOOL v34 = 1;
    id v5 = v38;
  }
  else
  {
    BOOL v34 = 0;
    id v5 = v38;
  }
LABEL_16:

  return v34;
}

- (BOOL)startHistoryTest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F98B98]);
  uint64_t v4 = (void *)gHistoryServiceConnection;
  gHistoryServiceConnection = (uint64_t)v3;

  id v5 = objc_alloc_init(MEMORY[0x1E4F98A20]);
  uint64_t v6 = (void *)gHistoryPushConnection;
  gHistoryPushConnection = (uint64_t)v5;

  uint64_t v7 = [(id)gHistoryServiceConnection queryMemoryFootprintWithError:0];
  uint64_t v8 = (void *)gInitialHistoryServiceMemoryFootprint;
  gInitialHistoryServiceMemoryFootprint = v7;

  uint64_t v9 = [(id)gHistoryPushConnection queryMemoryFootprintWithError:0];
  dispatch_group_t v10 = (void *)gInitialHistoryPushAgentMemoryFootprint;
  gInitialHistoryPushAgentMemoryFootprint = v9;

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F97ED8]) initWithError:0];
  id v12 = (void *)gInitialSafariMemoryFootprint;
  gInitialSafariMemoryFootprint = v11;

  id v13 = (void *)MEMORY[0x1E4E426E0]();
  uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/Safari/History-Large.db.z"];
  id v23 = 0;
  BOOL v15 = [(Application *)self _resetHistoryWithCompressedDatabaseAtURL:v14 error:&v23];
  id v16 = v23;

  if (v15)
  {
    if ([(id)gCurrentTestName isEqualToString:@"HistoryLoad"])
    {
      BOOL v17 = [(Application *)self startHistoryLoadTest];
    }
    else
    {
      char v20 = +[History sharedHistory];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __51__Application_ApplicationTesting__startHistoryTest__block_invoke;
      v22[3] = &unk_1E6D77E20;
      void v22[4] = self;
      [v20 performBlockAfterHistoryHasLoaded:v22];

      BOOL v17 = 1;
    }
  }
  else
  {
    uint64_t v18 = gCurrentTestName;
    long long v19 = [v16 description];
    [(Application *)self failedTest:v18 withFailure:v19];

    BOOL v17 = 0;
  }

  return v17;
}

void __51__Application_ApplicationTesting__startHistoryTest__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__Application_ApplicationTesting__startHistoryTest__block_invoke_2;
  block[3] = &unk_1E6D77E20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__Application_ApplicationTesting__startHistoryTest__block_invoke_2(uint64_t a1)
{
  int v2 = [(id)gCurrentTestName isEqualToString:@"HistorySearchPerformance"];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 startSearchPerformanceTestWithTestStrings:&unk_1F3C73DB8];
  }
  else
  {
    uint64_t v5 = gCurrentTestName;
    return [v3 failedTest:v5 withFailure:@"Unknown test name"];
  }
}

- (id)_generateMemoryFootprintResults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F97ED8]) initWithError:0];
  uint64_t v5 = [(id)gHistoryServiceConnection queryMemoryFootprintWithError:0];
  uint64_t v6 = [(id)gHistoryPushConnection queryMemoryFootprintWithError:0];
  uint64_t v62 = v3;
  if (v3)
  {
    uint64_t v7 = [v3 mutableCopy];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(id)gInitialSafariMemoryFootprint dirtySize];
  uint64_t v10 = [(id)gInitialHistoryServiceMemoryFootprint dirtySize] + v9;
  double v11 = (double)(unint64_t)(v10 + [(id)gInitialHistoryPushAgentMemoryFootprint dirtySize]);
  uint64_t v12 = [v4 dirtySize];
  uint64_t v13 = [v5 dirtySize];
  double v14 = (double)(unint64_t)(v13 + [v6 dirtySize] + v12);
  uint64_t v15 = [(id)gInitialSafariMemoryFootprint residentSize];
  uint64_t v16 = [(id)gInitialHistoryServiceMemoryFootprint residentSize] + v15;
  double v17 = (double)(unint64_t)(v16 + [(id)gInitialHistoryPushAgentMemoryFootprint residentSize]);
  uint64_t v18 = [v4 residentSize];
  uint64_t v19 = [v5 residentSize];
  double v20 = (double)(unint64_t)(v19 + [v6 residentSize] + v18);
  id v21 = [(id)gInitialSafariMemoryFootprint defaultMallocZone];
  uint64_t v22 = [v21 sizeInUse];
  [(id)gInitialHistoryServiceMemoryFootprint defaultMallocZone];
  id v23 = v6;
  id v24 = v5;
  v25 = uint64_t v60 = v5;
  uint64_t v26 = [v25 sizeInUse] + v22;
  BOOL v27 = [(id)gInitialHistoryPushAgentMemoryFootprint defaultMallocZone];
  double v61 = (double)(unint64_t)(v26 + [v27 sizeInUse]);

  uint64_t v28 = v4;
  id v29 = [v4 defaultMallocZone];
  uint64_t v30 = [v29 sizeInUse];
  long long v31 = [v24 defaultMallocZone];
  uint64_t v32 = [v31 sizeInUse];
  double v33 = [v23 defaultMallocZone];
  double v34 = (double)(unint64_t)(v32 + [v33 sizeInUse] + v30);

  id v35 = [(id)gInitialSafariMemoryFootprint defaultMallocZone];
  uint64_t v36 = [v35 sizeAllocated];
  id v37 = [(id)gInitialHistoryServiceMemoryFootprint defaultMallocZone];
  uint64_t v38 = [v37 sizeAllocated] + v36;
  uint64_t v39 = [(id)gInitialHistoryPushAgentMemoryFootprint defaultMallocZone];
  double v40 = (double)(unint64_t)(v38 + [v39 sizeAllocated]);

  uint64_t v41 = [v28 defaultMallocZone];
  uint64_t v42 = [v41 sizeAllocated];
  id v43 = [v60 defaultMallocZone];
  uint64_t v44 = [v43 sizeAllocated];
  id v45 = [v23 defaultMallocZone];
  double v46 = (double)(unint64_t)(v44 + [v45 sizeAllocated] + v42);

  BOOL v47 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11 * 0.000000953674316];
  [v8 setObject:v47 forKeyedSubscript:@"MemoryDirtyBegin"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryDirtyBeginUnits"];
  uint64_t v48 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14 * 0.000000953674316];
  [v8 setObject:v48 forKeyedSubscript:@"MemoryDirtyEnd"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryDirtyEndUnits"];
  char v49 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v14 - v11) * 0.000000953674316];
  [v8 setObject:v49 forKeyedSubscript:@"MemoryDirtyDiff"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryDirtyDiffUnits"];
  uint64_t v50 = [MEMORY[0x1E4F28ED0] numberWithDouble:v17 * 0.000000953674316];
  [v8 setObject:v50 forKeyedSubscript:@"MemoryResidentBegin"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryResidentBeginUnits"];
  uint64_t v51 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20 * 0.000000953674316];
  [v8 setObject:v51 forKeyedSubscript:@"MemoryResidentEnd"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryResidentEndUnits"];
  uint64_t v52 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v20 - v17) * 0.000000953674316];
  [v8 setObject:v52 forKeyedSubscript:@"MemoryResidentDiff"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryResidentDiffUnits"];
  uint64_t v53 = [MEMORY[0x1E4F28ED0] numberWithDouble:v61 * 0.000000953674316];
  [v8 setObject:v53 forKeyedSubscript:@"MemoryMallocUsedBegin"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryMallocUsedBeginUnits"];
  uint64_t v54 = [MEMORY[0x1E4F28ED0] numberWithDouble:v34 * 0.000000953674316];
  [v8 setObject:v54 forKeyedSubscript:@"MemoryMallocUsedEnd"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryMallocUsedEndUnits"];
  uint64_t v55 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v34 - v61) * 0.000000953674316];
  [v8 setObject:v55 forKeyedSubscript:@"MemoryMallocUsedDiff"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryMallocUsedDiffUnits"];
  uint64_t v56 = [MEMORY[0x1E4F28ED0] numberWithDouble:v40 * 0.000000953674316];
  [v8 setObject:v56 forKeyedSubscript:@"MemoryMallocAllocatedBegin"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryMallocAllocatedBeginUnits"];
  uint64_t v57 = [MEMORY[0x1E4F28ED0] numberWithDouble:v46 * 0.000000953674316];
  [v8 setObject:v57 forKeyedSubscript:@"MemoryMallocAllocatedEnd"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryMallocAllocatedEndUnits"];
  uint64_t v58 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v46 - v40) * 0.000000953674316];
  [v8 setObject:v58 forKeyedSubscript:@"MemoryMallocAllocatedDiff"];

  [v8 setObject:@"MB" forKeyedSubscript:@"MemoryMallocAllocatedDiffUnits"];
  return v8;
}

- (BOOL)startHistoryLoadTest
{
  [(Application *)self startedTest:gCurrentTestName];
  id v3 = +[History sharedHistory];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke;
  v5[3] = &unk_1E6D77E20;
  void v5[4] = self;
  [v3 performBlockAfterHistoryHasLoaded:v5];

  return 1;
}

void __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke_2;
  block[3] = &unk_1E6D77E20;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__Application_ApplicationTesting__startHistoryLoadTest__block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = gCurrentTestName;
  id v3 = [v1 _generateMemoryFootprintResults:0];
  [v1 finishedTest:v2 extraResults:v3];
}

- (BOOL)runMemoryOrIOTestWithType:(unint64_t)a3
{
  uint64_t v5 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v6 = [v5 tabController];
  uint64_t v7 = [v6 tabCollectionViewProvider];
  if ([(Application *)self overrideBrowserStateForTestNamed:gCurrentTestName browserController:v5])
  {
    [v6 readState];
    uint64_t v8 = [v7 tabThumbnailCollectionView];
    [v8 dismissAnimated:0];
  }
  [(Application *)self _preparePageLoadTestControllerParameters];
  [(Application *)self startedTest:gCurrentTestName];
  uint64_t v9 = [MemoryAndIOTestRunner alloc];
  uint64_t v10 = [(MemoryAndIOTestRunner *)v9 initWithTestName:gCurrentTestName browserController:v5 type:a3];
  double v11 = (void *)gTabMemoryAndIOTestRunner;
  gTabMemoryAndIOTestRunner = v10;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__Application_ApplicationTesting__runMemoryOrIOTestWithType___block_invoke;
  v13[3] = &unk_1E6D78B10;
  void v13[4] = self;
  [(id)gTabMemoryAndIOTestRunner runTestWithCompletion:v13];

  return 1;
}

uint64_t __61__Application_ApplicationTesting__runMemoryOrIOTestWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedTest:gCurrentTestName extraResults:a2];
}

- (BOOL)_startResizeTestWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(Application *)self _browserControllerForApplicationTesting];
  uint64_t v6 = [v5 webView];
  uint64_t v7 = [v6 window];

  if (v7)
  {
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x2050000000;
    uint64_t v8 = (void *)getRPTResizeTestParametersClass_softClass;
    uint64_t v16 = getRPTResizeTestParametersClass_softClass;
    if (!getRPTResizeTestParametersClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getRPTResizeTestParametersClass_block_invoke;
      v12[3] = &unk_1E6D77CE0;
      void v12[4] = &v13;
      __getRPTResizeTestParametersClass_block_invoke((uint64_t)v12);
      uint64_t v8 = (void *)v14[3];
    }
    uint64_t v9 = v8;
    _Block_object_dispose(&v13, 8);
    uint64_t v10 = (void *)[[v9 alloc] initWithTestName:v4 window:v7 completionHandler:0];
    objc_msgSend(v10, "setMinimumWindowSize:", 300.0, 300.0);
    objc_msgSend(v10, "setMaximumWindowSize:", 750.0, 950.0);
    [getRPTTestRunnerClass() runTestWithParameters:v10];
  }
  else
  {
    [(Application *)self failedTest:v4 withFailure:@"No window available"];
  }

  return v7 != 0;
}

- (void)pageLoadTestRunnerFinished:(id)a3
{
  id v3 = a3;
  if ((id)gRunner == v3)
  {
    gRunner = 0;
    id v4 = v3;

    id v3 = v4;
    gRunningPurpleTest = 0;
  }
}

+ (void)postTestNotificationName:(id)a3 object:(id)a4
{
}

+ (void)postTestNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([(id)*MEMORY[0x1E4FB2608] launchedToTest])
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:v10 object:v7 userInfo:v8];
  }
}

- (void)runTabSnapshotCacheStressTest
{
  id v3 = objc_alloc_init(TabSnapshotCacheStressTestRunner);
  id v4 = (void *)gTabSnapshotCacheStressTestRunner;
  gTabSnapshotCacheStressTestRunner = (uint64_t)v3;

  uint64_t v5 = [(id)gTestOptions objectForKeyedSubscript:@"iterations"];
  id v7 = v5;
  if (v5) {
    uint64_t v6 = [v5 integerValue];
  }
  else {
    uint64_t v6 = 10;
  }
  [(id)gTabSnapshotCacheStressTestRunner setMaxIterations:v6];
  [(id)gTabSnapshotCacheStressTestRunner setDelegate:self];
  [(Application *)self startedPurpleTest];
  [(id)gTabSnapshotCacheStressTestRunner start];
}

- (void)tabSnapshotCacheStressTestRunnerDidFinish:(id)a3
{
  id v4 = (void *)gTabSnapshotCacheStressTestRunner;
  gTabSnapshotCacheStressTestRunner = 0;

  [(Application *)self finishedPurpleTest:0];
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1E102C000, v0, OS_LOG_TYPE_DEBUG, "Attempting to authenticate to unlock private browsing with context: %@", v1, 0xCu);
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Encountered error when determining can evaluate policy: %{public}@", v6, v7, v8, v9, v10);
}

- (void)authenticateToUnlockPrivateBrowsingWithCompletionHandler:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1E102C000, v0, OS_LOG_TYPE_DEBUG, "Already trying to authenticate to unlock private browsing with context: %@", v1, 0xCu);
}

void __72__Application_authenticateToUnlockPrivateBrowsingWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v5, v6, "Encountered error when evaluating authentication policy: %{public}@", v7, v8, v9, v10, v11);
}

void __45__Application_saveChangesToCloudHistoryStore__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to save changes: %{public}@", v6, v7, v8, v9, v10);
}

void __57__Application__performBookmarksDatabaseTasksInBackground__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Background task expired while waiting for MobileSafari to perform bookmarks database tasks", v2, v3, v4, v5, v6);
}

void __60__Application__saveFrequentlyVisitedListsToDatabaseIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Background task expired while waiting for MobileSafari to save frequently visited sites.", v2, v3, v4, v5, v6);
}

void __31__Application_systemMemorySize__block_invoke_cold_1(void *a1, mach_error_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = 136315650;
  uint64_t v5 = "+[Application systemMemorySize]_block_invoke";
  __int16 v6 = 1024;
  mach_error_t v7 = a2;
  __int16 v8 = 2080;
  uint64_t v9 = mach_error_string(a2);
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "%s : host_info(%d) : %s.\n", (uint8_t *)&v4, 0x1Cu);
}

void __56__Application_prewarmAndRemoveOrphanedProfileDataStores__block_invoke_238_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_4() localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1E102C000, v2, OS_LOG_TYPE_ERROR, "Unable to delete orphaned WKWebsiteDataStore with identifier %{public}@. Error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)webExtensionsControllerForProfileServerID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1E102C000, v0, OS_LOG_TYPE_FAULT, "Requested a profile web extensions controller with empty server ID %{public}@", v1, 0xCu);
}

- (void)contentBlockerManagerForProfileServerID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1E102C000, v0, OS_LOG_TYPE_FAULT, "Requested a profile content blocker manager with empty server ID %{public}@", v1, 0xCu);
}

- (uint64_t)_showSearchEngineAlertIfNeeded
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[Application _export30DaysWorthOfHistoryAfterUpgrade](v0);
}

void __48__Application__resetCloudHistoryAccountIfNeeded__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to reset account: %{public}@", v6, v7, v8, v9, v10);
}

void __81__Application__updateProfileLocalIdentifiersToServerIdentifiersMapInCloudHistory__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to update profile identifier map: %{public}@", v6, v7, v8, v9, v10);
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1E102C000, v0, v1, "Synchronizing for education user when updating feature availability", v2, v3, v4, v5, v6);
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_3_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to initialize cloud history: %{public}@", v6, v7, v8, v9, v10);
}

void __46__Application__updateCloudFeatureAvailability__block_invoke_2_331_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to release cloud history: %{public}@", v6, v7, v8, v9, v10);
}

void __55__Application_pdfDataForTabWithUUID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to generate PDF data for TabEntity", v2, v3, v4, v5, v6);
}

void __53__Application_sceneForTabWithUUID_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Unable to open session: %{public}@", v6, v7, v8, v9, v10);
}

- (void)focusProfile
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1E102C000, v0, OS_LOG_TYPE_ERROR, "Couldn't find focus profile %{public}@ on focus change.", v1, 0xCu);
}

- (void)deleteBookmarksWithUUIDs:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 privacyPreservingDescription];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1E102C000, v7, OS_LOG_TYPE_ERROR, "Failed to delete bookmark %{public}@", a1, 0xCu);
}

void __43__Application_closeWindowsWithIdentifiers___block_invoke_3_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to destroy scene: %{public}@", v6, v7, v8, v9, v10);
}

@end