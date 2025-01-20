@interface SBHomeScreenService
+ (BOOL)isHomeScreenLayoutAvailableForIconController:(id)a3;
- (BOOL)_isLibraryDismissalAllowedWithCompletion:(id)a3;
- (BOOL)_isLibraryPresentationAllowedWithCompletion:(id)a3;
- (BOOL)authenticateIconStyleRequestForAuditToken:(id)a3 error:(id *)a4;
- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4;
- (BOOL)debugContinuityWithBadgeType:(id)a3 deviceTypeIdentifier:(id)a4;
- (BOOL)hasWidgetWithBundleIdentifier:(id)a3;
- (BOOL)isHomeScreenLayoutAvailable;
- (BSDefaultObserver)iconTintColorObserver;
- (BSServiceConnectionListener)connectionListener;
- (FBServiceClientAuthenticator)activeWidgetInfoAuthenticator;
- (FBServiceClientAuthenticator)addApplicationIconAuthenticator;
- (FBServiceClientAuthenticator)addDebugIconAuthenticator;
- (FBServiceClientAuthenticator)addEmptyPageAuthenticator;
- (FBServiceClientAuthenticator)addSuggestedPageAuthenticator;
- (FBServiceClientAuthenticator)addWidgetToTodayViewAuthenticator;
- (FBServiceClientAuthenticator)addsNewIconsToHomeScreenAuthenticator;
- (FBServiceClientAuthenticator)appLibraryRequestUpdateAuthenticator;
- (FBServiceClientAuthenticator)configurationAuthenticator;
- (FBServiceClientAuthenticator)displayedDateAuthenticator;
- (FBServiceClientAuthenticator)homeScreenBundleIdentifiersAuthenticator;
- (FBServiceClientAuthenticator)homeScreenLayoutAuthenticator;
- (FBServiceClientAuthenticator)homeScreenLayoutAvailabilityAuthenticator;
- (FBServiceClientAuthenticator)iconBadgeValueAuthenticator;
- (FBServiceClientAuthenticator)iconFolderPathLookupAuthenticator;
- (FBServiceClientAuthenticator)iconStyleAuthenticator;
- (FBServiceClientAuthenticator)iconTintColorAuthenticator;
- (FBServiceClientAuthenticator)largeIconLayoutAuthenticator;
- (FBServiceClientAuthenticator)observeInstalledWebClipsAuthenticator;
- (FBServiceClientAuthenticator)openPodAuthenticator;
- (FBServiceClientAuthenticator)overflowSlotsAuthenticator;
- (FBServiceClientAuthenticator)prominentIconSwapAuthenticator;
- (FBServiceClientAuthenticator)requestSuggestedAppAuthenticator;
- (FBServiceClientAuthenticator)resetHomeScreenLayoutAuthenticator;
- (FBServiceClientAuthenticator)shareSheetCustomViewAuthenticator;
- (FBServiceClientAuthenticator)showsBadgesInAppLibraryAuthenticator;
- (FBServiceClientAuthenticator)showsHomeScreenSearchAffordanceAuthenticator;
- (FBServiceClientAuthenticator)silhouetteAuthenticator;
- (NSMutableSet)activeConnections;
- (NSMutableSet)iconBadgeValueObservingConnections;
- (NSMutableSet)iconBadgeValueUpdateBatchBundleIdentifiers;
- (NSMutableSet)iconTintColorObservingConnections;
- (NSMutableSet)layoutAvailabilityObservingConnections;
- (NSMutableSet)layoutObservingConnections;
- (NSMutableSet)webClipObservingConnections;
- (NSNumber)addsNewIconsToHomeScreenValue;
- (NSNumber)homeScreenLayoutAvailability;
- (NSNumber)largeIconLayoutEnabledValue;
- (NSNumber)largeIconSizeEnabledValue;
- (NSNumber)showsBadgesInAppLibraryValue;
- (NSNumber)showsHomeScreenSearchAffordanceValue;
- (NSString)allIconLists;
- (NSTimer)iconBadgeValueUpdateBatchTimer;
- (SBHomeScreenService)initWithIconController:(id)a3;
- (SBIconController)iconController;
- (SBSDebugActiveWidgetInfo)debuggingActiveWidgetInfo;
- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration;
- (SBSHomeScreenServiceArrayOfNumbers)overflowSlotCounts;
- (SBSHomeScreenServiceArrayOfStrings)allHomeScreenApplicationBundleIdentifiers;
- (SBSHomeScreenServiceArrayOfStrings)allHomeScreenApplicationPlaceholderBundleIdentifiers;
- (id)_currentStyleConfiguration;
- (id)_currentStyleConfigurationForConnection:(id)a3;
- (id)_translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:(id)a3;
- (id)badgeValueForIconWithApplicationBundleIdentifier:(id)a3;
- (id)configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3;
- (id)folderPathToIconWithBundleIdentifier:(id)a3;
- (id)homeScreenDefaults;
- (id)silhouetteLayoutForPageAtIndex:(id)a3;
- (void)_requestAppLibraryUpdate:(id)a3 categoryMapProvider:(id)a4 reason:(id)a5 optionalCompletionHandler:(id)a6;
- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(id)a3;
- (void)addDebugIconWithSizeClassDescription:(id)a3 inPage:(id)a4 atPositionDescription:(id)a5;
- (void)addEmptyPage;
- (void)addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4;
- (void)addsNewIconsToHomeScreenValue;
- (void)allHomeScreenApplicationBundleIdentifiers;
- (void)allHomeScreenApplicationPlaceholderBundleIdentifiers;
- (void)allIconLists;
- (void)badgeValueForIconWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)beginObservingNotificationsForIconBadgeValue;
- (void)beginObservingNotificationsForIconTintColor;
- (void)changeDisplayedDateOffsetOverride:(id)a3;
- (void)changeDisplayedDateOverride:(id)a3;
- (void)clearAllOverflowSlotCounts;
- (void)clearNewlyInstalledAndRecentlyUpdatedAppIndicators;
- (void)clearTodayViewLayout;
- (void)configureDeweyEachAppHasItsOwnCategory;
- (void)configureDeweyOneCategoryWithAllApps;
- (void)configureLibraryWithCategoryLimit:(id)a3;
- (void)dealloc;
- (void)debuggingActiveWidgetInfo;
- (void)deleteAllWebClips;
- (void)dismissAppLibraryWithCompletion:(id)a3;
- (void)endObservingNotificationsForIconBadgeValue;
- (void)endObservingNotificationsForIconTintColor;
- (void)forbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4;
- (void)homeScreenIconStyleConfiguration;
- (void)homeScreenLayoutAvailability;
- (void)iconBadgeVisibilityDidChange:(id)a3;
- (void)iconModelDidLayout:(id)a3;
- (void)ignoreAllApps;
- (void)insertEmptyPageAtIndex:(id)a3;
- (void)largeIconLayoutEnabledValue;
- (void)largeIconSizeEnabledValue;
- (void)leafIconDataSourceDidChange:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)noteHomeScreenLayoutAvailabilityDidChange;
- (void)noteHomeScreenLayoutDidChange;
- (void)noteInstalledWebClipsDidChange;
- (void)notifyObserversOfIconImageStyleChange;
- (void)organizeAllIconsAcrossPagesWithPageCount:(id)a3;
- (void)organizeAllIconsIntoFoldersWithPageCount:(id)a3;
- (void)overflowSlotCounts;
- (void)overrideBadgeValue:(id)a3 forBundleIdentifier:(id)a4;
- (void)presentAppLibraryAnimated:(id)a3 completion:(id)a4;
- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(id)a3 completion:(id)a4;
- (void)processUpdatesToBadgeValueForApplicationBundleIdentifiers:(id)a3;
- (void)randomizeAllIconsAcrossPagesWithPageCount:(id)a3;
- (void)refreshAppLibrary:(id)a3 reason:(id)a4;
- (void)reloadHomeScreenLayout;
- (void)reloadIcons;
- (void)removeAllWidgets;
- (void)removeWidgetsFromHomeScreen;
- (void)requestAppLibraryUpdate:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)requestSuggestedApplicationWithBundleIdentifier:(id)a3 assertionPort:(id)a4 completion:(id)a5;
- (void)resetCategoriesLayoutWithCompletion:(id)a3;
- (void)resetHomeScreenLayoutWithCompletion:(id)a3;
- (void)resetTodayViewLayout;
- (void)runDownloadingIconTest;
- (void)runFloatingDockStressTestWithCompletion:(id)a3;
- (void)runRemoveAndRestoreIconTest;
- (void)runWidgetDiscoverabilityTest;
- (void)setAddsNewIconsToHomeScreenValue:(id)a3;
- (void)setHomeScreenIconStyleConfiguration:(id)a3;
- (void)setHomeScreenLayoutAvailable:(BOOL)a3;
- (void)setIconBadgeValueUpdateBatchBundleIdentifiers:(id)a3;
- (void)setIconBadgeValueUpdateBatchTimer:(id)a3;
- (void)setIconListsHidden:(id)a3;
- (void)setIconTintColorObserver:(id)a3;
- (void)setLargeIconLayoutEnabledValue:(id)a3;
- (void)setLargeIconSizeEnabledValue:(id)a3;
- (void)setObservingHomeScreenLayout:(id)a3;
- (void)setObservingHomeScreenLayoutAvailability:(id)a3;
- (void)setObservingIconBadgeValue:(id)a3;
- (void)setObservingIconTintColor:(id)a3;
- (void)setObservingInstalledWebClips:(id)a3;
- (void)setShowsBadgesInAppLibraryValue:(id)a3;
- (void)setShowsHomeScreenSearchAffordanceValue:(id)a3;
- (void)setupHomeScreenForWidgetScrollPerformanceTest;
- (void)showsBadgesInAppLibraryValue;
- (void)showsHomeScreenSearchAffordanceValue;
- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4;
- (void)unforbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4;
@end

@implementation SBHomeScreenService

- (void)refreshAppLibrary:(id)a3 reason:(id)a4
{
}

- (void)requestAppLibraryUpdate:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self->_iconController;
  if ([(SBIconController *)v11 isModalAppLibrarySupported])
  {
    v23 = v11;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = [(id)SBApp windowSceneManager];
    v13 = [v12 connectedWindowScenes];

    id obj = v13;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) modalLibraryController];
          v19 = [v18 libraryViewController];
          v20 = [v19 categoryMapProvider];
          [(SBHomeScreenService *)self _requestAppLibraryUpdate:v8 categoryMapProvider:v20 reason:v9 optionalCompletionHandler:v10];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    v11 = v23;
  }
  else
  {
    v21 = [(SBIconController *)v11 overlayLibraryViewController];
    v22 = [v21 categoryMapProvider];
    [(SBHomeScreenService *)self _requestAppLibraryUpdate:v8 categoryMapProvider:v22 reason:v9 optionalCompletionHandler:v10];
  }
}

- (void)_requestAppLibraryUpdate:(id)a3 categoryMapProvider:(id)a4 reason:(id)a5 optionalCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (__CFString *)a5;
  id v13 = a6;
  uint64_t v14 = [v10 unsignedIntegerValue];
  uint64_t v15 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v16 = [v15 remoteProcess];
  uint64_t v17 = [(id)v16 auditToken];

  v18 = [(SBHomeScreenService *)self appLibraryRequestUpdateAuthenticator];
  id v33 = 0;
  LOBYTE(v16) = [v18 authenticateAuditToken:v17 error:&v33];
  id v19 = v33;

  if (v16)
  {
    uint64_t v20 = 8;
    if (!v14) {
      uint64_t v20 = 14;
    }
    if (v14 == 1) {
      uint64_t v20 = 10;
    }
    if (v13) {
      uint64_t v21 = v20 | 0x20;
    }
    else {
      uint64_t v21 = v20;
    }
    if (v12) {
      v22 = v12;
    }
    else {
      v22 = @"(Home Screen Service; no update reason given)";
    }
    v23 = [v11 requestLibraryCategoryMapRefreshWithOptions:v21 reason:v22];
    if (v13)
    {
      id v28 = v11;
      id from = 0;
      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      long long v25 = [MEMORY[0x1E4F28F08] mainQueue];
      uint64_t v26 = *MEMORY[0x1E4FA65C8];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __101__SBHomeScreenService__requestAppLibraryUpdate_categoryMapProvider_reason_optionalCompletionHandler___block_invoke;
      v29[3] = &unk_1E6AFEE68;
      objc_copyWeak(&v31, &from);
      id v30 = v13;
      long long v27 = [v24 addObserverForName:v26 object:v23 queue:v25 usingBlock:v29];
      objc_storeWeak(&from, v27);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&from);
      id v11 = v28;
    }
  }
  else
  {
    v23 = SBLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService _requestAppLibraryUpdate:categoryMapProvider:reason:optionalCompletionHandler:](v19);
    }
  }
}

- (FBServiceClientAuthenticator)appLibraryRequestUpdateAuthenticator
{
  return self->_appLibraryRequestUpdateAuthenticator;
}

- (SBHomeScreenService)initWithIconController:(id)a3
{
  id v5 = a3;
  v76.receiver = self;
  v76.super_class = (Class)SBHomeScreenService;
  v6 = [(SBHomeScreenService *)&v76 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconController, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.resetHomeScreenLayout"];
    resetHomeScreenLayoutAuthenticator = v7->_resetHomeScreenLayoutAuthenticator;
    v7->_resetHomeScreenLayoutAuthenticator = (FBServiceClientAuthenticator *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.requestSuggestedApplication"];
    requestSuggestedAppAuthenticator = v7->_requestSuggestedAppAuthenticator;
    v7->_requestSuggestedAppAuthenticator = (FBServiceClientAuthenticator *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.lookupFolderPathForIcon"];
    iconFolderPathLookupAuthenticator = v7->_iconFolderPathLookupAuthenticator;
    v7->_iconFolderPathLookupAuthenticator = (FBServiceClientAuthenticator *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.addApplicationIcon"];
    addApplicationIconAuthenticator = v7->_addApplicationIconAuthenticator;
    v7->_addApplicationIconAuthenticator = (FBServiceClientAuthenticator *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.addWidgetToTodayView"];
    addWidgetToTodayViewAuthenticator = v7->_addWidgetToTodayViewAuthenticator;
    v7->_addWidgetToTodayViewAuthenticator = (FBServiceClientAuthenticator *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.largeIconLayout"];
    largeIconLayoutAuthenticator = v7->_largeIconLayoutAuthenticator;
    v7->_largeIconLayoutAuthenticator = (FBServiceClientAuthenticator *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.addsNewIconsToHomeScreen"];
    addsNewIconsToHomeScreenAuthenticator = v7->_addsNewIconsToHomeScreenAuthenticator;
    v7->_addsNewIconsToHomeScreenAuthenticator = (FBServiceClientAuthenticator *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.showsBadgesInAppLibrary"];
    showsBadgesInAppLibraryAuthenticator = v7->_showsBadgesInAppLibraryAuthenticator;
    v7->_showsBadgesInAppLibraryAuthenticator = (FBServiceClientAuthenticator *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.showsHomeScreenSearchAffordance"];
    showsHomeScreenSearchAffordanceAuthenticator = v7->_showsHomeScreenSearchAffordanceAuthenticator;
    v7->_showsHomeScreenSearchAffordanceAuthenticator = (FBServiceClientAuthenticator *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.allHomeScreenApplicationBundleIdentifiers"];
    homeScreenBundleIdentifiersAuthenticator = v7->_homeScreenBundleIdentifiersAuthenticator;
    v7->_homeScreenBundleIdentifiersAuthenticator = (FBServiceClientAuthenticator *)v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.overrideDisplayedDate"];
    displayedDateAuthenticator = v7->_displayedDateAuthenticator;
    v7->_displayedDateAuthenticator = (FBServiceClientAuthenticator *)v28;

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.configureHomeScreenForTesting"];
    configurationAuthenticator = v7->_configurationAuthenticator;
    v7->_configurationAuthenticator = (FBServiceClientAuthenticator *)v30;

    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.appLibraryRefresh"];
    appLibraryRequestUpdateAuthenticator = v7->_appLibraryRequestUpdateAuthenticator;
    v7->_appLibraryRequestUpdateAuthenticator = (FBServiceClientAuthenticator *)v32;

    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.applibrary.openpod"];
    openPodAuthenticator = v7->_openPodAuthenticator;
    v7->_openPodAuthenticator = (FBServiceClientAuthenticator *)v34;

    uint64_t v36 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.addDebugIcon"];
    addDebugIconAuthenticator = v7->_addDebugIconAuthenticator;
    v7->_addDebugIconAuthenticator = (FBServiceClientAuthenticator *)v36;

    uint64_t v38 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.observeInstalledWebClips"];
    observeInstalledWebClipsAuthenticator = v7->_observeInstalledWebClipsAuthenticator;
    v7->_observeInstalledWebClipsAuthenticator = (FBServiceClientAuthenticator *)v38;

    uint64_t v40 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.activeWidgetInfo"];
    activeWidgetInfoAuthenticator = v7->_activeWidgetInfoAuthenticator;
    v7->_activeWidgetInfoAuthenticator = (FBServiceClientAuthenticator *)v40;

    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.addEmptyPage"];
    addEmptyPageAuthenticator = v7->_addEmptyPageAuthenticator;
    v7->_addEmptyPageAuthenticator = (FBServiceClientAuthenticator *)v42;

    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.addSuggestedPage"];
    addSuggestedPageAuthenticator = v7->_addSuggestedPageAuthenticator;
    v7->_addSuggestedPageAuthenticator = (FBServiceClientAuthenticator *)v44;

    uint64_t v46 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.homeScreenLayoutAvailability"];
    homeScreenLayoutAvailabilityAuthenticator = v7->_homeScreenLayoutAvailabilityAuthenticator;
    v7->_homeScreenLayoutAvailabilityAuthenticator = (FBServiceClientAuthenticator *)v46;

    uint64_t v48 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.homeScreenLayout"];
    homeScreenLayoutAuthenticator = v7->_homeScreenLayoutAuthenticator;
    v7->_homeScreenLayoutAuthenticator = (FBServiceClientAuthenticator *)v48;

    uint64_t v50 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.iconBadgeValue"];
    iconBadgeValueAuthenticator = v7->_iconBadgeValueAuthenticator;
    v7->_iconBadgeValueAuthenticator = (FBServiceClientAuthenticator *)v50;

    uint64_t v52 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.overflowSlotCount"];
    overflowSlotsAuthenticator = v7->_overflowSlotsAuthenticator;
    v7->_overflowSlotsAuthenticator = (FBServiceClientAuthenticator *)v52;

    uint64_t v54 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.homeScreenSilhouetteLayout"];
    silhouetteAuthenticator = v7->_silhouetteAuthenticator;
    v7->_silhouetteAuthenticator = (FBServiceClientAuthenticator *)v54;

    uint64_t v56 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.iconTintColor"];
    iconTintColorAuthenticator = v7->_iconTintColorAuthenticator;
    v7->_iconTintColorAuthenticator = (FBServiceClientAuthenticator *)v56;

    uint64_t v58 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.homeScreenIconStyle"];
    iconStyleAuthenticator = v7->_iconStyleAuthenticator;
    v7->_iconStyleAuthenticator = (FBServiceClientAuthenticator *)v58;

    uint64_t v60 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.sharesheet.allow-custom-view"];
    shareSheetCustomViewAuthenticator = v7->_shareSheetCustomViewAuthenticator;
    v7->_shareSheetCustomViewAuthenticator = (FBServiceClientAuthenticator *)v60;

    uint64_t v62 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.swapIconsInProminentPositions"];
    prominentIconSwapAuthenticator = v7->_prominentIconSwapAuthenticator;
    v7->_prominentIconSwapAuthenticator = (FBServiceClientAuthenticator *)v62;

    v7->_homeScreenLayoutAvailable = [(id)objc_opt_class() isHomeScreenLayoutAvailableForIconController:v5];
    v64 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v65 = *MEMORY[0x1E4FA66F0];
    v66 = [v5 model];
    [v64 addObserver:v7 selector:sel_iconModelDidLayout_ name:v65 object:v66];

    v67 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeConnections = v7->_activeConnections;
    v7->_activeConnections = v67;

    v7->_lock._os_unfair_lock_opaque = 0;
    v69 = (void *)MEMORY[0x1E4F628A0];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __46__SBHomeScreenService_initWithIconController___block_invoke;
    v74[3] = &unk_1E6AF58F0;
    v70 = v7;
    v75 = v70;
    uint64_t v71 = [v69 listenerWithConfigurator:v74];
    id v72 = v70[37];
    v70[37] = (id)v71;

    [v70[37] activate];
  }

  return v7;
}

void __46__SBHomeScreenService_initWithIconController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = [MEMORY[0x1E4FA6AE8] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FA66F0];
  id v5 = [(SBIconController *)self->_iconController model];
  [v3 removeObserver:self name:v4 object:v5];

  v6 = +[SBIconController sharedInstance];
  v7 = [v6 iconStyleCoordinator];
  [v7 removeIconStyleObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)SBHomeScreenService;
  [(SBHomeScreenService *)&v8 dealloc];
}

- (id)homeScreenDefaults
{
  v2 = +[SBDefaults localDefaults];
  v3 = [v2 homeScreenDefaults];

  return v3;
}

- (void)resetHomeScreenLayoutWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  v6 = [v5 remoteProcess];
  v7 = [v6 auditToken];

  objc_super v8 = [(SBHomeScreenService *)self resetHomeScreenLayoutAuthenticator];
  id v15 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v15];
  id v10 = v15;

  if (v9)
  {
    id v11 = [(SBHomeScreenService *)self iconController];
    char v12 = [v11 resetHomeScreenLayout];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHomeScreenServiceErrorDomain" code:1 userInfo:0];

      id v10 = (id)v13;
    }
  }
  else
  {
    uint64_t v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService resetHomeScreenLayoutWithCompletion:](v10);
    }

    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    }
  }
  v4[2](v4, v10);
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  objc_super v8 = [MEMORY[0x1E4F62880] currentContext];
  char v9 = [v8 remoteProcess];
  id v10 = [v9 auditToken];

  id v11 = [(SBHomeScreenService *)self resetHomeScreenLayoutAuthenticator];
  id v18 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v18];
  id v13 = v18;

  if (v12)
  {
    uint64_t v14 = [(SBHomeScreenService *)self iconController];
    char v15 = [v14 unforbidApplicationBundleIdentifierFromLibrary:v6];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHomeScreenServiceErrorDomain" code:1 userInfo:0];

      id v13 = (id)v16;
    }
  }
  else
  {
    uint64_t v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService unforbidApplicationBundleIdentifierFromLibrary:withCompletion:](v13);
    }

    if (!v13)
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    }
  }
  v7[2](v7, v13);
}

- (void)forbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  objc_super v8 = [MEMORY[0x1E4F62880] currentContext];
  char v9 = [v8 remoteProcess];
  id v10 = [v9 auditToken];

  id v11 = [(SBHomeScreenService *)self resetHomeScreenLayoutAuthenticator];
  id v18 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v18];
  id v13 = v18;

  if (v12)
  {
    uint64_t v14 = [(SBHomeScreenService *)self iconController];
    char v15 = [v14 forbidApplicationBundleIdentifierFromLibrary:v6];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHomeScreenServiceErrorDomain" code:1 userInfo:0];

      id v13 = (id)v16;
    }
  }
  else
  {
    uint64_t v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService forbidApplicationBundleIdentifierFromLibrary:withCompletion:](v13);
    }

    if (!v13)
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    }
  }
  v7[2](v7, v13);
}

- (void)resetCategoriesLayoutWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];
  v7 = [v6 auditToken];

  objc_super v8 = [(SBHomeScreenService *)self resetHomeScreenLayoutAuthenticator];
  id v15 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v15];
  id v10 = v15;

  if (v9)
  {
    id v11 = [(SBHomeScreenService *)self iconController];
    char v12 = [v11 resetCategories];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHomeScreenServiceErrorDomain" code:1 userInfo:0];

      id v10 = (id)v13;
    }
  }
  else
  {
    uint64_t v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService resetCategoriesLayoutWithCompletion:](v10);
    }

    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    }
  }
  v4[2](v4, v10);
}

- (void)runFloatingDockStressTestWithCompletion:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  v7 = [(id)v6 auditToken];

  objc_super v8 = [(SBHomeScreenService *)self resetHomeScreenLayoutAuthenticator];
  id v23 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v23];
  id v9 = v23;

  if (v6)
  {
    id v10 = [(id)SBApp windowSceneManager];
    id v11 = [v10 activeDisplayWindowScene];
    char v12 = [v11 floatingDockController];
    uint64_t v13 = [v12 viewController];
    uint64_t v14 = objc_opt_class();
    id v15 = v13;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v18 = v16;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = [v18 suggestionsModel];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __63__SBHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke;
      v21[3] = &unk_1E6AF5300;
      id v22 = v4;
      [v19 _runStressTestWithCompletion:v21];
    }
    else if (v9)
    {
      (*((void (**)(id, id))v4 + 2))(v4, v9);
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
      (*((void (**)(id, void *))v4 + 2))(v4, v20);
    }
    goto LABEL_18;
  }
  uint64_t v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBHomeScreenService runFloatingDockStressTestWithCompletion:](v9);
  }

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v10);
LABEL_18:

    goto LABEL_19;
  }
  (*((void (**)(id, id))v4 + 2))(v4, v9);
LABEL_19:
}

uint64_t __63__SBHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)requestSuggestedApplicationWithBundleIdentifier:(id)a3 assertionPort:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  BSDispatchQueueAssertMain();
  id v11 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v12 = [v11 remoteProcess];
  uint64_t v13 = [(id)v12 auditToken];

  uint64_t v14 = [(SBHomeScreenService *)self requestSuggestedAppAuthenticator];
  id v30 = 0;
  LOBYTE(v12) = [v14 authenticateAuditToken:v13 error:&v30];
  id v15 = v30;

  if (v12)
  {
    uint64_t v16 = +[SBApplicationController sharedInstance];
    uint64_t v17 = [v16 applicationWithBundleIdentifier:v8];

    id v18 = [(id)SBApp windowSceneManager];
    id v19 = [v18 activeDisplayWindowScene];
    uint64_t v20 = [v19 floatingDockController];
    uint64_t v21 = v20;
    if (v17
      && v20
      && ([v20 requestedSuggestedApplication],
          id v22 = objc_claimAutoreleasedReturnValue(),
          v22,
          !v22))
    {
      [v21 setRequestedSuggestedApplication:v17];
      uint64_t v26 = (void *)MEMORY[0x1E4F4F7E0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __96__SBHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_assertionPort_completion___block_invoke;
      v27[3] = &unk_1E6AF5290;
      id v28 = v21;
      id v29 = v17;
      [v26 monitorSendRight:v9 withHandler:v27];

      uint64_t v24 = v28;
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHomeScreenServiceErrorDomain" code:1 userInfo:0];
      uint64_t v24 = v15;
      id v15 = (id)v23;
    }

    v10[2](v10, v15);
  }
  else
  {
    long long v25 = SBLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService requestSuggestedApplicationWithBundleIdentifier:assertionPort:completion:](v15);
    }

    if (!v15)
    {
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    }
    v10[2](v10, v15);
  }
}

void __96__SBHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_assertionPort_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  BSDispatchMain();
}

void __96__SBHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_assertionPort_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) requestedSuggestedApplication];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 setRequestedSuggestedApplication:0];
  }
}

- (id)folderPathToIconWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self iconFolderPathLookupAuthenticator];
  id v15 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v15];
  id v10 = v15;

  if (v9)
  {
    id v11 = [(SBHomeScreenService *)self iconController];
    uint64_t v12 = [v11 iconPathForIconWithDisplayID:v4];

    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA6AD8]) initWithArray:v12];
  }
  else
  {
    uint64_t v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService folderPathToIconWithBundleIdentifier:](v10);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self addApplicationIconAuthenticator];
  id v15 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v15];
  id v10 = v15;

  if (v9)
  {
    if ([v4 length])
    {
      id v11 = [(SBHomeScreenService *)self iconController];
      uint64_t v12 = [v11 iconManager];
      uint64_t v13 = [v12 iconModel];

      uint64_t v14 = [v13 applicationIconForBundleIdentifier:v4];
      if (v14) {
        [v11 addIconToHomeScreen:v14];
      }
    }
    else
    {
      id v11 = SBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:](v11);
      }
    }
  }
  else
  {
    id v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:](v10);
    }
  }
}

- (NSNumber)largeIconLayoutEnabledValue
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  id v5 = [(id)v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self largeIconLayoutAuthenticator];
  id v13 = 0;
  LOBYTE(v4) = [v6 authenticateAuditToken:v5 error:&v13];
  id v7 = v13;

  if (v4)
  {
    id v8 = +[SBDefaults localDefaults];
    char v9 = [v8 homeScreenDefaults];
    uint64_t v10 = [v9 shouldUseLargeDefaultSizedIcons];
  }
  else
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService largeIconLayoutEnabledValue](v7);
    }
    uint64_t v10 = 0;
  }

  id v11 = [NSNumber numberWithBool:v10];

  return (NSNumber *)v11;
}

- (void)setLargeIconLayoutEnabledValue:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [(id)v6 auditToken];

  id v8 = [(SBHomeScreenService *)self largeIconLayoutAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    uint64_t v10 = +[SBDefaults localDefaults];
    id v11 = [v10 homeScreenDefaults];
    objc_msgSend(v11, "setShouldUseLargeDefaultSizedIcons:", objc_msgSend(v4, "BOOLValue"));
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setLargeIconLayoutEnabledValue:](v9);
    }
  }
}

- (NSNumber)largeIconSizeEnabledValue
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  id v5 = [(id)v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self largeIconLayoutAuthenticator];
  id v12 = 0;
  LOBYTE(v4) = [v6 authenticateAuditToken:v5 error:&v12];
  id v7 = v12;

  if (v4)
  {
    id v8 = +[SBIconController sharedInstanceIfExists];
    uint64_t v9 = [v8 isLargeIconSizeEnabled];
  }
  else
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService largeIconSizeEnabledValue](v7);
    }
    uint64_t v9 = 0;
  }

  uint64_t v10 = [NSNumber numberWithBool:v9];

  return (NSNumber *)v10;
}

- (void)setLargeIconSizeEnabledValue:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [(id)v6 auditToken];

  id v8 = [(SBHomeScreenService *)self largeIconLayoutAuthenticator];
  id v11 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v11];
  id v9 = v11;

  if (v6)
  {
    uint64_t v10 = +[SBIconController sharedInstanceIfExists];
    -[NSObject setLargeIconSizeEnabled:](v10, "setLargeIconSizeEnabled:", [v4 BOOLValue]);
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setLargeIconSizeEnabledValue:](v9);
    }
  }
}

- (NSNumber)addsNewIconsToHomeScreenValue
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  id v5 = [(id)v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self addsNewIconsToHomeScreenAuthenticator];
  id v12 = 0;
  LOBYTE(v4) = [v6 authenticateAuditToken:v5 error:&v12];
  id v7 = v12;

  if (v4)
  {
    id v8 = +[SBIconController sharedInstance];
    uint64_t v9 = [v8 shouldAddNewIconsToRootFolder];
  }
  else
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService addsNewIconsToHomeScreenValue](v7);
    }
    uint64_t v9 = 0;
  }

  uint64_t v10 = [NSNumber numberWithBool:v9];

  return (NSNumber *)v10;
}

- (void)setAddsNewIconsToHomeScreenValue:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [(id)v6 auditToken];

  id v8 = [(SBHomeScreenService *)self addsNewIconsToHomeScreenAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    uint64_t v10 = +[SBDefaults localDefaults];
    id v11 = [v10 homeScreenDefaults];
    objc_msgSend(v11, "setAutomaticallyAddsNewApplications:", objc_msgSend(v4, "BOOLValue"));
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setAddsNewIconsToHomeScreenValue:](v9);
    }
  }
}

- (void)setIconListsHidden:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self addsNewIconsToHomeScreenAuthenticator];
  id v49 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v49];
  id v10 = v49;

  if (v9)
  {
    id v31 = v10;
    uint64_t v32 = v7;
    id v11 = [(SBHomeScreenService *)self iconController];
    id v12 = [v11 model];
    id v13 = [v12 rootFolder];
    uint64_t v14 = [v13 lists];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v14;
    uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * i) setHidden:0];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v16);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v33 = v4;
    id v34 = [v4 array];
    uint64_t v19 = [v34 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v35 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v42 != v35) {
            objc_enumerationMutation(v34);
          }
          uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v23 = obj;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v38;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v38 != v26) {
                  objc_enumerationMutation(v23);
                }
                id v28 = *(void **)(*((void *)&v37 + 1) + 8 * k);
                id v29 = [v28 uniqueIdentifier];
                int v30 = [v29 isEqualToString:v22];

                if (v30) {
                  [v28 setHidden:1];
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
            }
            while (v25);
          }
        }
        uint64_t v20 = [v34 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v20);
    }

    id v7 = v32;
    id v4 = v33;
    id v10 = v31;
  }
  else
  {
    id obj = SBLogCommon();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setIconListsHidden:](v10);
    }
  }
}

- (NSNumber)showsBadgesInAppLibraryValue
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  id v5 = [(id)v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self showsBadgesInAppLibraryAuthenticator];
  id v13 = 0;
  LOBYTE(v4) = [v6 authenticateAuditToken:v5 error:&v13];
  id v7 = v13;

  if (v4)
  {
    id v8 = +[SBDefaults localDefaults];
    char v9 = [v8 homeScreenDefaults];
    uint64_t v10 = [v9 showsBadgesInAppLibrary];
  }
  else
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService showsBadgesInAppLibraryValue](v7);
    }
    uint64_t v10 = 0;
  }

  id v11 = [NSNumber numberWithBool:v10];

  return (NSNumber *)v11;
}

- (void)setShowsBadgesInAppLibraryValue:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [(id)v6 auditToken];

  id v8 = [(SBHomeScreenService *)self showsBadgesInAppLibraryAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    uint64_t v10 = +[SBDefaults localDefaults];
    id v11 = [v10 homeScreenDefaults];
    objc_msgSend(v11, "setShowsBadgesInAppLibrary:", objc_msgSend(v4, "BOOLValue"));
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setShowsBadgesInAppLibraryValue:](v9);
    }
  }
}

- (NSNumber)showsHomeScreenSearchAffordanceValue
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  id v5 = [(id)v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self showsHomeScreenSearchAffordanceAuthenticator];
  id v13 = 0;
  LOBYTE(v4) = [v6 authenticateAuditToken:v5 error:&v13];
  id v7 = v13;

  if (v4)
  {
    id v8 = +[SBDefaults localDefaults];
    id v9 = [v8 homeScreenDefaults];
    uint64_t v10 = [v9 showsHomeScreenSearchAffordance];
  }
  else
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService showsHomeScreenSearchAffordanceValue](v7);
    }
    uint64_t v10 = 0;
  }

  id v11 = [NSNumber numberWithBool:v10];

  return (NSNumber *)v11;
}

- (void)setShowsHomeScreenSearchAffordanceValue:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [(id)v6 auditToken];

  id v8 = [(SBHomeScreenService *)self showsHomeScreenSearchAffordanceAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    uint64_t v10 = +[SBDefaults localDefaults];
    id v11 = [v10 homeScreenDefaults];
    objc_msgSend(v11, "setShowsHomeScreenSearchAffordance:", objc_msgSend(v4, "BOOLValue"));
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setShowsHomeScreenSearchAffordanceValue:](v9);
    }
  }
}

- (SBSHomeScreenServiceArrayOfStrings)allHomeScreenApplicationBundleIdentifiers
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  id v5 = [v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self homeScreenBundleIdentifiersAuthenticator];
  id v18 = 0;
  char v7 = [v6 authenticateAuditToken:v5 error:&v18];
  id v8 = v18;

  if (v7)
  {
    id v9 = [(SBHomeScreenService *)self iconController];
    uint64_t v10 = [v9 model];
    id v11 = [v10 rootFolder];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__SBHomeScreenService_allHomeScreenApplicationBundleIdentifiers__block_invoke;
    v16[3] = &unk_1E6AFEE18;
    id v13 = v12;
    id v17 = v13;
    [v11 enumerateAllIconsWithOptions:1 usingBlock:v16];
  }
  else
  {
    id v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService allHomeScreenApplicationBundleIdentifiers](v8);
    }
    id v13 = 0;
  }

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6AD8]) initWithArray:v13];
  return (SBSHomeScreenServiceArrayOfStrings *)v14;
}

void __64__SBHomeScreenService_allHomeScreenApplicationBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isApplicationIcon])
  {
    if ([v5 hasApplication])
    {
      uint64_t v3 = [v5 applicationBundleID];
      if (v3)
      {
        id v4 = (void *)v3;
        [*(id *)(a1 + 32) addObject:v3];
      }
    }
  }
}

- (SBSHomeScreenServiceArrayOfStrings)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  id v5 = [v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self homeScreenBundleIdentifiersAuthenticator];
  id v18 = 0;
  char v7 = [v6 authenticateAuditToken:v5 error:&v18];
  id v8 = v18;

  if (v7)
  {
    id v9 = [(SBHomeScreenService *)self iconController];
    uint64_t v10 = [v9 model];
    id v11 = [v10 rootFolder];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__SBHomeScreenService_allHomeScreenApplicationPlaceholderBundleIdentifiers__block_invoke;
    v16[3] = &unk_1E6AFEE18;
    id v13 = v12;
    id v17 = v13;
    [v11 enumerateAllIconsWithOptions:1 usingBlock:v16];
  }
  else
  {
    id v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService allHomeScreenApplicationPlaceholderBundleIdentifiers](v8);
    }
    id v13 = 0;
  }

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6AD8]) initWithArray:v13];
  return (SBSHomeScreenServiceArrayOfStrings *)v14;
}

void __75__SBHomeScreenService_allHomeScreenApplicationPlaceholderBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isApplicationIcon])
  {
    if ([v5 hasApplicationPlaceholder])
    {
      uint64_t v3 = [v5 applicationBundleID];
      if (v3)
      {
        id v4 = (void *)v3;
        [*(id *)(a1 + 32) addObject:v3];
      }
    }
  }
}

- (NSString)allIconLists
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  id v5 = [v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self homeScreenBundleIdentifiersAuthenticator];
  id v15 = 0;
  char v7 = [v6 authenticateAuditToken:v5 error:&v15];
  id v8 = v15;

  if (v7)
  {
    id v9 = [(SBHomeScreenService *)self iconController];
    uint64_t v10 = [v9 model];
    id v11 = [v10 rootFolder];
    id v12 = [v11 lists];
    id v13 = [v12 debugDescription];
  }
  else
  {
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService allIconLists](v8);
    }
    id v13 = &stru_1F3084718;
  }

  return (NSString *)v13;
}

- (BOOL)hasWidgetWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  char v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self homeScreenBundleIdentifiersAuthenticator];
  id v19 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v19];
  id v10 = v19;

  if (v9)
  {
    id v11 = [(SBHomeScreenService *)self iconController];
    id v12 = [v11 model];
    id v13 = [v12 rootFolder];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__SBHomeScreenService_hasWidgetWithBundleIdentifier___block_invoke;
    v17[3] = &unk_1E6AFEE40;
    id v18 = v4;
    uint64_t v14 = [v13 indexPathForIconPassingTest:v17];
    BOOL v15 = v14 != 0;
  }
  else
  {
    id v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService hasWidgetWithBundleIdentifier:](v10);
    }
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __53__SBHomeScreenService_hasWidgetWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isWidgetIcon])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(v3, "widgets", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) extensionBundleIdentifier];
          char v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

          if (v10)
          {
            uint64_t v11 = 1;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_13:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)debugContinuityWithBadgeType:(id)a3 deviceTypeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (os_variant_has_internal_content())
  {
    uint64_t v8 = [MEMORY[0x1E4F62880] currentContext];
    char v9 = [v8 remoteProcess];
    char v10 = [v9 auditToken];

    uint64_t v11 = [(SBHomeScreenService *)self configurationAuthenticator];
    id v16 = 0;
    char v12 = [v11 authenticateAuditToken:v10 error:&v16];
    id v13 = v16;

    if (v12)
    {
      long long v14 = [MEMORY[0x1E4FA63C8] itemForBadgeTypeString:v6 deviceTypeIdentifier:v7];
      [MEMORY[0x1E4FA6430] setDebugContinuityItem:v14];
    }
    else
    {
      long long v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenService debugContinuityWithBadgeType:deviceTypeIdentifier:](v13);
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)runDownloadingIconTest
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)runRemoveAndRestoreIconTest
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void __101__SBHomeScreenService__requestAppLibraryUpdate_categoryMapProvider_reason_optionalCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObserver:WeakRetained];

  uint64_t v5 = [v11 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FA65A8]];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = [v11 userInfo];
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4FA65B0]];

    uint64_t v9 = *(void *)(a1 + 32);
    char v10 = [v8 dictionaryRepresentation];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
}

- (void)configureDeweyEachAppHasItsOwnCategory
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)configureDeweyOneCategoryWithAllApps
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)configureLibraryWithCategoryLimit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v11 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v11];
  id v9 = v11;

  if (v6)
  {
    char v10 = +[SBIconController sharedInstance];
    -[NSObject _configureLibraryWithCategoryLimit:](v10, "_configureLibraryWithCategoryLimit:", [v4 integerValue]);
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService configureLibraryWithCategoryLimit:](v9);
    }
  }
}

- (id)configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v13 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v13];
  id v9 = v13;

  if (v6)
  {
    char v10 = +[SBIconController sharedInstance];
    id v11 = [v10 _configureCategoryMapProviderToUseCategoryMapAtURL:v4];
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService configureCategoryMapProviderToUseCategoryMapAtURL:](v9);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    char v10 = +[SBIconController sharedInstance];
    id v11 = [v10 iconManager];
    objc_msgSend(v11, "organizeAllIconsIntoFoldersWithPageCount:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService organizeAllIconsIntoFoldersWithPageCount:](v9);
    }
  }
}

- (void)organizeAllIconsAcrossPagesWithPageCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    char v10 = +[SBIconController sharedInstance];
    id v11 = [v10 iconManager];
    objc_msgSend(v11, "organizeAllIconsAcrossPagesWithPageCount:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService organizeAllIconsAcrossPagesWithPageCount:](v9);
    }
  }
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v12 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v12];
  id v9 = v12;

  if (v6)
  {
    char v10 = +[SBIconController sharedInstance];
    id v11 = [v10 iconManager];
    objc_msgSend(v11, "randomizeAllIconsAcrossPagesWithPageCount:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService randomizeAllIconsAcrossPagesWithPageCount:](v9);
    }
  }
}

- (void)ignoreAllApps
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)removeAllWidgets
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)removeWidgetsFromHomeScreen
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)deleteAllWebClips
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)changeDisplayedDateOverride:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self displayedDateAuthenticator];
  id v11 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v11];
  id v9 = v11;

  if (v6)
  {
    char v10 = [MEMORY[0x1E4FA5EE8] sharedInstance];
    [v10 setOverrideDate:v4];
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService changeDisplayedDateOverride:](v9);
    }
  }
}

- (void)changeDisplayedDateOffsetOverride:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [(id)v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self displayedDateAuthenticator];
  id v11 = 0;
  LOBYTE(v6) = [v8 authenticateAuditToken:v7 error:&v11];
  id v9 = v11;

  if (v6)
  {
    char v10 = [MEMORY[0x1E4FA5EE8] sharedInstance];
    [v4 doubleValue];
    -[NSObject setOverrideDateOffset:](v10, "setOverrideDateOffset:");
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService changeDisplayedDateOffsetOverride:](v9);
    }
  }
}

- (void)reloadIcons
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)reloadHomeScreenLayout
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)resetTodayViewLayout
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)clearTodayViewLayout
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)overrideBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v8 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v9 = [v8 remoteProcess];
  char v10 = [(id)v9 auditToken];

  id v11 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v21 = 0;
  LOBYTE(v9) = [v11 authenticateAuditToken:v10 error:&v21];
  id v12 = v21;

  if (v9)
  {
    id v13 = v6;
    if ([v13 integerValue] >= 1)
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "integerValue"));

      id v13 = (id)v14;
    }
    long long v15 = +[SBIconController sharedInstance];
    id v16 = [v15 iconManager];
    id v17 = [v16 iconModel];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__SBHomeScreenService_overrideBadgeValue_forBundleIdentifier___block_invoke;
    v19[3] = &unk_1E6AFEE90;
    id v20 = v13;
    id v18 = v13;
    [v17 enumerateApplicationIconsForBundleIdentifier:v7 usingBlock:v19];
  }
  else
  {
    id v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService overrideBadgeValue:forBundleIdentifier:](v12);
    }
  }
}

uint64_t __62__SBHomeScreenService_overrideBadgeValue_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOverrideBadgeNumberOrString:*(void *)(a1 + 32)];
}

- (void)clearNewlyInstalledAndRecentlyUpdatedAppIndicators
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  uint64_t v8 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v9 = [v8 remoteProcess];
  char v10 = [v9 auditToken];

  id v11 = [(SBHomeScreenService *)self openPodAuthenticator];
  id v21 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v21];
  id v13 = v21;

  if (v12)
  {
    uint64_t v14 = [(SBHomeScreenService *)self _translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:v7];
    if ([(SBHomeScreenService *)self _isLibraryPresentationAllowedWithCompletion:v14])
    {
      long long v15 = self->_iconController;
      if ([(SBIconController *)v15 isModalAppLibrarySupported])
      {
        id v16 = [(id)SBApp windowSceneManager];

        id v17 = [(SBIconController *)v16 activeDisplayWindowScene];
        id v18 = [v17 modalLibraryController];
        [v18 presentLibraryCategoryPodForCategoryIdentifier:v6 animated:1 completion:v14];

        long long v15 = v16;
      }
      else
      {
        [(SBIconController *)v15 presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:v6 animated:1 completion:v14];
      }
    }
  }
  else
  {
    id v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService presentAppLibraryCategoryPodForCategoryIdentifier:completion:](v13);
    }

    if (v13)
    {
      v7[2](v7, v13);
    }
    else
    {
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
      v7[2](v7, v20);
    }
  }
}

- (BOOL)_isLibraryPresentationAllowedWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(SBHomeScreenService *)self iconController];
  if ([v5 isAppLibraryAllowed])
  {
    id v6 = +[SBLockScreenManager sharedInstance];
    int v7 = [v6 isUILocked];

    if (v7)
    {
      if (v4) {
        goto LABEL_6;
      }
LABEL_13:
      BOOL v9 = 0;
      goto LABEL_14;
    }
    uint64_t v8 = [(id)SBApp windowSceneManager];
    char v10 = [v8 activeDisplayWindowScene];
    id v11 = [v10 layoutStateProvider];
    char v12 = [v11 layoutState];
    if ([v12 unlockedEnvironmentMode] == 1)
    {

      BOOL v9 = 1;
      goto LABEL_7;
    }
    char v13 = [v5 isModalAppLibrarySupported];

    if (v13)
    {
      BOOL v9 = 1;
      goto LABEL_14;
    }
    if (!v4) {
      goto LABEL_13;
    }
  }
  else if (!v4)
  {
    goto LABEL_13;
  }
LABEL_6:
  uint64_t v8 = SBHLibraryPresentationErrorForCode();
  v4[2](v4, v8);
  BOOL v9 = 0;
LABEL_7:

LABEL_14:
  return v9;
}

- (void)presentAppLibraryAnimated:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  BSDispatchQueueAssertMain();
  int v7 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v8 = [v7 remoteProcess];
  BOOL v9 = [v8 auditToken];

  char v10 = [(SBHomeScreenService *)self configurationAuthenticator];
  id v20 = 0;
  char v11 = [v10 authenticateAuditToken:v9 error:&v20];
  id v12 = v20;

  if (v11)
  {
    char v13 = [(SBHomeScreenService *)self _translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:v6];
    if ([(SBHomeScreenService *)self _isLibraryPresentationAllowedWithCompletion:v13])
    {
      uint64_t v14 = [(SBHomeScreenService *)self iconController];
      if ([v14 isModalAppLibrarySupported])
      {
        long long v15 = [(id)SBApp windowSceneManager];
        id v16 = [v15 activeDisplayWindowScene];
        id v17 = [v16 modalLibraryController];
        [v17 presentLibraryAnimated:a3 != 0 completion:0];
      }
      else
      {
        [v14 presentLibraryFromOverlayControllerAnimated:a3 != 0 completion:0];
      }
    }
  }
  else
  {
    id v18 = SBLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService presentAppLibraryAnimated:completion:](v12);
    }

    if (v12)
    {
      v6[2](v6, v12);
    }
    else
    {
      id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
      v6[2](v6, v19);
    }
  }
}

- (void)dismissAppLibraryWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];
  int v7 = [v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self openPodAuthenticator];
  id v18 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v18];
  id v10 = v18;

  if (v9)
  {
    char v11 = [(SBHomeScreenService *)self _translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:v4];
    if ([(SBHomeScreenService *)self _isLibraryDismissalAllowedWithCompletion:v11])
    {
      id v12 = [(SBHomeScreenService *)self iconController];
      if ([v12 isModalAppLibrarySupported])
      {
        char v13 = [(id)SBApp windowSceneManager];
        uint64_t v14 = [v13 activeDisplayWindowScene];
        long long v15 = [v14 modalLibraryController];
        [v15 dismissLibraryAnimated:1 completion:0];
      }
      else
      {
        [v12 dismissLibraryAnimated:1 completion:0];
      }
    }
  }
  else
  {
    id v16 = SBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService dismissAppLibraryWithCompletion:](v10);
    }

    if (v10)
    {
      v4[2](v4, v10);
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
      v4[2](v4, v17);
    }
  }
}

- (BOOL)_isLibraryDismissalAllowedWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(SBHomeScreenService *)self iconController];
  id v6 = [(id)SBApp windowSceneManager];
  int v7 = [v6 activeDisplayWindowScene];

  if (([v5 isAppLibraryAllowed] & 1) == 0)
  {
    if (v4) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  if ([v5 isModalAppLibrarySupported])
  {
    uint64_t v8 = [v7 modalLibraryController];
    char v9 = [v8 isPresentingLibrary];
  }
  else
  {
    uint64_t v8 = [v5 iconManager];
    char v9 = [v8 isMainDisplayLibraryViewVisible];
  }
  char v10 = v9;

  if ((v10 & 1) == 0)
  {
    if (v4) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  char v11 = [v7 layoutStateProvider];
  id v12 = [v11 layoutState];
  if ([v12 unlockedEnvironmentMode] == 1)
  {

    BOOL v13 = 1;
LABEL_16:

    goto LABEL_18;
  }
  char v14 = [v5 isModalAppLibrarySupported];

  if ((v14 & 1) == 0)
  {
    if (v4)
    {
LABEL_15:
      char v11 = SBHLibraryPresentationErrorForCode();
      v4[2](v4, v11);
      BOOL v13 = 0;
      goto LABEL_16;
    }
LABEL_17:
    BOOL v13 = 0;
    goto LABEL_18;
  }
  BOOL v13 = 1;
LABEL_18:

  return v13;
}

- (id)_translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__SBHomeScreenService__translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion___block_invoke;
  v8[3] = &unk_1E6AF5DA8;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1D948C7A0](v8);
  id v6 = (void *)MEMORY[0x1D948C7A0]();

  return v6;
}

void __98__SBHomeScreenService__translatedSBSPresentationErrorCompletionForSBHPresentationErrorCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v11 = v3;
    id v4 = [v3 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4FA65D0]];

    if (v5)
    {
      [v11 code];
      uint64_t v6 = SBSLibraryPodPresentationErrorCodeForErrorCode();
      int v7 = NSStringFromSBSLibraryPodPresentationErrorCode();
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v7 forKey:*MEMORY[0x1E4F28568]];
      id v9 = [v11 userInfo];
      [v8 addEntriesFromDictionary:v9];

      char v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA7010] code:v6 userInfo:v8];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    id v3 = v11;
  }
}

- (void)addDebugIconWithSizeClassDescription:(id)a3 inPage:(id)a4 atPositionDescription:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  id v11 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v12 = [v11 remoteProcess];
  BOOL v13 = [(id)v12 auditToken];

  char v14 = [(SBHomeScreenService *)self addDebugIconAuthenticator];
  id v36 = 0;
  LOBYTE(v12) = [v14 authenticateAuditToken:v13 error:&v36];
  id v15 = v36;

  if (v12)
  {
    id v16 = +[SBIconController sharedInstance];
    id v17 = [v16 iconManager];

    id v18 = SBHIconGridSizeClassForString();
    uint64_t v19 = [v9 unsignedIntegerValue];
    uint64_t v20 = [v10 rangeOfString:@","];
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSObject addDebugIconOfSizeClass:toPage:iconIndex:](v17, "addDebugIconOfSizeClass:toPage:iconIndex:", v18, v19, [v10 integerValue]);
    }
    else
    {
      uint64_t v22 = v20;
      uint64_t v23 = v21;
      uint64_t v35 = v19;
      uint64_t v24 = [v10 substringToIndex:v20];
      uint64_t v34 = [v24 integerValue];

      uint64_t v25 = [v10 substringFromIndex:v22 + v23];
      uint64_t v26 = [v25 integerValue];

      if ([v10 hasSuffix:@"P"])
      {
        long long v27 = v17;
        id v28 = v18;
        uint64_t v30 = v34;
        uint64_t v29 = v35;
        uint64_t v31 = v26;
        uint64_t v32 = 1;
      }
      else
      {
        int v33 = [v10 hasSuffix:@"L"];
        uint64_t v29 = v35;
        if (!v33)
        {
          -[NSObject addDebugIconOfSizeClass:toPage:coordinate:](v17, "addDebugIconOfSizeClass:toPage:coordinate:", v18, v35, v34, v26);
          goto LABEL_12;
        }
        long long v27 = v17;
        id v28 = v18;
        uint64_t v30 = v34;
        uint64_t v31 = v26;
        uint64_t v32 = 4;
      }
      -[NSObject addDebugIconOfSizeClass:toPage:coordinate:orientation:](v27, "addDebugIconOfSizeClass:toPage:coordinate:orientation:", v28, v29, v30, v31, v32);
    }
LABEL_12:

    goto LABEL_13;
  }
  id v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBHomeScreenService addDebugIconWithSizeClassDescription:inPage:atPositionDescription:](v15);
  }
LABEL_13:
}

- (void)setObservingInstalledWebClips:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  int v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self observeInstalledWebClipsAuthenticator];
  id v16 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v16];
  id v10 = v16;

  if (v9)
  {
    os_unfair_lock_lock(&self->_lock);
    int v11 = [v4 BOOLValue];
    webClipObservingConnections = self->_webClipObservingConnections;
    if (v11)
    {
      if (!webClipObservingConnections)
      {
        BOOL v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        char v14 = self->_webClipObservingConnections;
        self->_webClipObservingConnections = v13;

        webClipObservingConnections = self->_webClipObservingConnections;
      }
      [(NSMutableSet *)webClipObservingConnections addObject:v5];
    }
    else
    {
      [(NSMutableSet *)webClipObservingConnections removeObject:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setObservingInstalledWebClips:](v10);
    }
  }
}

- (void)noteInstalledWebClipsDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(SBHomeScreenService *)self webClipObservingConnections];
  int v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "remoteTarget", (void)v12);
        [v11 installedWebClipsDidChange];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (SBSDebugActiveWidgetInfo)debuggingActiveWidgetInfo
{
  BSDispatchQueueAssertMain();
  id v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  int v5 = [v4 auditToken];

  id v6 = [(SBHomeScreenService *)self activeWidgetInfoAuthenticator];
  id v13 = 0;
  char v7 = [v6 authenticateAuditToken:v5 error:&v13];
  id v8 = v13;

  if (v7)
  {
    uint64_t v9 = +[SBIconController sharedInstance];
    uint64_t v10 = [v9 iconManager];

    int v11 = [v10 debuggingActiveWidgetInfo];
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService debuggingActiveWidgetInfo](v8);
    }
    int v11 = 0;
  }

  return (SBSDebugActiveWidgetInfo *)v11;
}

- (void)insertEmptyPageAtIndex:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  int v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];
  char v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self addEmptyPageAuthenticator];
  id v16 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v16];
  id v10 = v16;

  if (v9)
  {
    int v11 = +[SBIconController sharedInstance];
    long long v12 = [v11 iconManager];

    id v13 = [v12 rootFolder];
    unint64_t v14 = [v4 unsignedIntegerValue];
    if (v14 <= [v13 listCount]) {
      id v15 = (id)[v13 insertEmptyListAtIndex:v14];
    }
  }
  else
  {
    long long v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService insertEmptyPageAtIndex:](v10);
    }
  }
}

- (void)addEmptyPage
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [MEMORY[0x1E4F62880] currentContext];
  char v9 = [v8 remoteProcess];
  id v10 = [v9 auditToken];

  int v11 = [(SBHomeScreenService *)self addSuggestedPageAuthenticator];
  id v17 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v17];
  id v13 = v17;

  if (v12)
  {
    unint64_t v14 = +[SBIconController sharedInstance];
    id v15 = [v14 iconManager];

    id v16 = [v15 proactivePageSuggestionsManager];
    [v16 _addSuggestedPageWithPageType:v6 focusModeIdentifier:v7];
  }
  else
  {
    id v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService addSuggestedPageWithPageType:focusModeIdentifier:](v13);
    }
  }
}

- (void)setObservingHomeScreenLayoutAvailability:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];
  id v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self homeScreenLayoutAvailabilityAuthenticator];
  id v18 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v18];
  id v10 = v18;

  if ((v9 & 1) == 0)
  {
    id v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setObservingHomeScreenLayoutAvailability:](v10);
    }
    goto LABEL_12;
  }
  os_unfair_lock_lock(&self->_lock);
  int v11 = [v4 BOOLValue];
  layoutAvailabilityObservingConnections = self->_layoutAvailabilityObservingConnections;
  if (v11)
  {
    if (!layoutAvailabilityObservingConnections)
    {
      id v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      unint64_t v14 = self->_layoutAvailabilityObservingConnections;
      self->_layoutAvailabilityObservingConnections = v13;

      layoutAvailabilityObservingConnections = self->_layoutAvailabilityObservingConnections;
    }
    [(NSMutableSet *)layoutAvailabilityObservingConnections addObject:v5];
  }
  else
  {
    [(NSMutableSet *)layoutAvailabilityObservingConnections removeObject:v5];
  }
  os_unfair_lock_unlock(&self->_lock);
  if ([v4 BOOLValue])
  {
    id v16 = [(SBHomeScreenService *)self homeScreenLayoutAvailability];
    int v17 = [v16 BOOLValue];

    if (v17)
    {
      id v15 = [v5 remoteTarget];
      [v15 homeScreenLayoutAvailabilityDidChange:MEMORY[0x1E4F1CC38]];
LABEL_12:
    }
  }
}

- (void)noteHomeScreenLayoutAvailabilityDidChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(SBHomeScreenService *)self layoutAvailabilityObservingConnections];
  uint64_t v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  BOOL v6 = [(SBHomeScreenService *)self isHomeScreenLayoutAvailable];
  id v7 = [NSNumber numberWithBool:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "remoteTarget", (void)v14);
        [v13 homeScreenLayoutAvailabilityDidChange:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (NSNumber)homeScreenLayoutAvailability
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [v3 remoteProcess];
  uint64_t v5 = [v4 auditToken];

  BOOL v6 = [(SBHomeScreenService *)self homeScreenLayoutAvailabilityAuthenticator];
  id v13 = 0;
  char v7 = [v6 authenticateAuditToken:v5 error:&v13];
  id v8 = v13;

  if (v7)
  {
    BOOL v9 = [(SBHomeScreenService *)self isHomeScreenLayoutAvailable];
    uint64_t v10 = [NSNumber numberWithBool:v9];
  }
  else
  {
    uint64_t v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService homeScreenLayoutAvailability](v8);
    }

    uint64_t v10 = (void *)MEMORY[0x1E4F1CC28];
  }

  return (NSNumber *)v10;
}

+ (BOOL)isHomeScreenLayoutAvailableForIconController:(id)a3
{
  uint64_t v3 = [a3 model];
  id v4 = [v3 rootFolder];
  if (v4) {
    BOOL v5 = (unint64_t)([v3 lastLayoutStatus] - 1) < 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)iconModelDidLayout:(id)a3
{
  id v5 = [(SBHomeScreenService *)self iconController];
  uint64_t v4 = [(id)objc_opt_class() isHomeScreenLayoutAvailableForIconController:v5];
  if (v4 != [(SBHomeScreenService *)self isHomeScreenLayoutAvailable])
  {
    [(SBHomeScreenService *)self setHomeScreenLayoutAvailable:v4];
    [(SBHomeScreenService *)self noteHomeScreenLayoutAvailabilityDidChange];
  }
  [(SBHomeScreenService *)self noteHomeScreenLayoutDidChange];
}

- (void)setObservingHomeScreenLayout:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  BOOL v6 = [v5 remoteProcess];
  char v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self homeScreenLayoutAuthenticator];
  id v16 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v16];
  id v10 = v16;

  if (v9)
  {
    os_unfair_lock_lock(&self->_lock);
    int v11 = [v4 BOOLValue];
    layoutObservingConnections = self->_layoutObservingConnections;
    if (v11)
    {
      if (!layoutObservingConnections)
      {
        id v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v14 = self->_layoutObservingConnections;
        self->_layoutObservingConnections = v13;

        layoutObservingConnections = self->_layoutObservingConnections;
      }
      [(NSMutableSet *)layoutObservingConnections addObject:v5];
    }
    else
    {
      [(NSMutableSet *)layoutObservingConnections removeObject:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    long long v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setObservingHomeScreenLayout:](v10);
    }
  }
}

- (void)noteHomeScreenLayoutDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(SBHomeScreenService *)self layoutObservingConnections];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "remoteTarget", (void)v12);
        [v11 homeScreenLayoutDidChange];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)setObservingIconBadgeValue:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];
  uint64_t v7 = [v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self iconBadgeValueAuthenticator];
  id v18 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v18];
  id v10 = v18;

  if (v9)
  {
    int v11 = [v4 BOOLValue];
    os_unfair_lock_lock(&self->_lock);
    uint64_t v12 = [(NSMutableSet *)self->_iconBadgeValueObservingConnections count];
    iconBadgeValueObservingConnections = self->_iconBadgeValueObservingConnections;
    if (v11)
    {
      if (!iconBadgeValueObservingConnections)
      {
        long long v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v15 = self->_iconBadgeValueObservingConnections;
        self->_iconBadgeValueObservingConnections = v14;

        iconBadgeValueObservingConnections = self->_iconBadgeValueObservingConnections;
      }
      [(NSMutableSet *)iconBadgeValueObservingConnections addObject:v5];
    }
    else
    {
      [(NSMutableSet *)iconBadgeValueObservingConnections removeObject:v5];
    }
    uint64_t v17 = [(NSMutableSet *)self->_iconBadgeValueObservingConnections count];
    os_unfair_lock_unlock(&self->_lock);
    if (v12 || !v17)
    {
      if (v12 && !v17) {
        [(SBHomeScreenService *)self endObservingNotificationsForIconBadgeValue];
      }
    }
    else
    {
      [(SBHomeScreenService *)self beginObservingNotificationsForIconBadgeValue];
    }
  }
  else
  {
    id v16 = SBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setObservingIconBadgeValue:](v10);
    }
  }
}

- (void)beginObservingNotificationsForIconBadgeValue
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  [v3 addObserver:self selector:sel_leafIconDataSourceDidChange_ name:*MEMORY[0x1E4FA6730] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = SBIconControllerIconBadgeVisibilityDidChangeNotification;
  id v5 = [(SBHomeScreenService *)self iconController];
  [v6 addObserver:self selector:sel_iconBadgeVisibilityDidChange_ name:v4 object:v5];
}

- (void)endObservingNotificationsForIconBadgeValue
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  [v3 removeObserver:self name:*MEMORY[0x1E4FA6730] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = SBIconControllerIconBadgeVisibilityDidChangeNotification;
  id v5 = [(SBHomeScreenService *)self iconController];
  [v6 removeObserver:self name:v4 object:v5];
}

- (void)leafIconDataSourceDidChange:(id)a3
{
  id v9 = [a3 object];
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = v9;
  if (isKindOfClass)
  {
    uint64_t v7 = [v9 bundleIdentifier];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      [(SBHomeScreenService *)self processUpdatesToBadgeValueForApplicationBundleIdentifiers:v8];
    }
    id v6 = v9;
  }
}

- (void)iconBadgeVisibilityDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"SBApplicationBundleIdentifiers"];

  id v5 = v6;
  if (v6)
  {
    [(SBHomeScreenService *)self processUpdatesToBadgeValueForApplicationBundleIdentifiers:v6];
    id v5 = v6;
  }
}

- (void)processUpdatesToBadgeValueForApplicationBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenService *)self iconBadgeValueUpdateBatchTimer];

  if (v5)
  {
    id v6 = [(SBHomeScreenService *)self iconBadgeValueUpdateBatchBundleIdentifiers];
    [v6 unionSet:v4];
  }
  else
  {
    uint64_t v7 = (void *)[v4 mutableCopy];
    [(SBHomeScreenService *)self setIconBadgeValueUpdateBatchBundleIdentifiers:v7];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __81__SBHomeScreenService_processUpdatesToBadgeValueForApplicationBundleIdentifiers___block_invoke;
    long long v14 = &unk_1E6AFAC30;
    long long v15 = self;
    id v16 = v7;
    id v9 = v7;
    id v10 = [v8 scheduledTimerWithTimeInterval:0 repeats:&v11 block:0.1];
    -[SBHomeScreenService setIconBadgeValueUpdateBatchTimer:](self, "setIconBadgeValueUpdateBatchTimer:", v10, v11, v12, v13, v14, v15);
  }
}

void __81__SBHomeScreenService_processUpdatesToBadgeValueForApplicationBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setIconBadgeValueUpdateBatchTimer:0];
  [*(id *)(a1 + 32) setIconBadgeValueUpdateBatchBundleIdentifiers:0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = [*(id *)(a1 + 32) iconBadgeValueObservingConnections];
  uint64_t v3 = (void *)[v2 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v4 = objc_alloc(MEMORY[0x1E4FA6AD8]);
  id v5 = [*(id *)(a1 + 40) allObjects];
  id v6 = (void *)[v4 initWithArray:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "remoteTarget", (void)v13);
        [v12 applicationIconInfoChangedForBundleIdentifiers:v6];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)badgeValueForIconWithApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];
  id v7 = [v6 auditToken];

  uint64_t v8 = [(SBHomeScreenService *)self iconBadgeValueAuthenticator];
  id v18 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v18];
  id v10 = v18;

  if (v9)
  {
    uint64_t v11 = +[SBIconController sharedInstance];
    uint64_t v12 = [v11 iconManager];

    long long v13 = [v12 iconModel];
    long long v14 = [v13 leafIconForIdentifier:v4];
    long long v15 = [v14 badgeNumberOrString];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA6AE0]) initWithNumberOrString:v15];
  }
  else
  {
    uint64_t v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:](v10);
    }
    long long v16 = 0;
  }

  return v16;
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  BSDispatchQueueAssertMain();
  uint64_t v8 = [MEMORY[0x1E4F62880] currentContext];
  char v9 = [v8 remoteProcess];
  id v10 = [v9 auditToken];

  uint64_t v11 = [(SBHomeScreenService *)self iconBadgeValueAuthenticator];
  id v21 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v21];
  id v13 = v21;

  if (v12)
  {
    long long v14 = +[SBIconController sharedInstance];
    long long v15 = [v14 iconManager];

    long long v16 = [v15 iconModel];
    uint64_t v17 = [v16 applicationIconForBundleIdentifier:v6];
    id v18 = [v17 badgeNumberOrString];
    if (([v15 allowsBadgingForIcon:v17] & 1) == 0)
    {

      id v18 = 0;
    }
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FA6AE0]) initWithNumberOrString:v18];
    v7[2](v7, v19, 0);

    id v7 = (void (**)(id, void *, void))v15;
  }
  else
  {
    uint64_t v20 = SBLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:completionHandler:](v13);
    }

    v7[2](v7, 0, 0);
  }
}

- (BOOL)authenticateIconStyleRequestForAuditToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SBHomeScreenService *)self iconTintColorAuthenticator];
  char v8 = [v7 authenticateAuditToken:v6 error:a4];

  if ((v8 & 1) != 0
    || ([(SBHomeScreenService *)self iconStyleAuthenticator],
        char v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 authenticateAuditToken:v6 error:a4],
        v9,
        (v10 & 1) != 0))
  {
    char v11 = 1;
  }
  else
  {
    char v12 = [(SBHomeScreenService *)self shareSheetCustomViewAuthenticator];
    char v11 = [v12 authenticateAuditToken:v6 error:a4];
  }
  return v11;
}

- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  id v5 = [(id)v4 auditToken];

  id v10 = 0;
  LOBYTE(v4) = [(SBHomeScreenService *)self authenticateIconStyleRequestForAuditToken:v5 error:&v10];
  id v6 = v10;
  if (v4)
  {
    id v7 = +[SBIconController sharedInstanceIfExists];
    char v8 = [v7 currentHomeScreenIconStyleConfiguration];
  }
  else
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService homeScreenIconStyleConfiguration](v6);
    }
    char v8 = 0;
  }

  return (SBSHomeScreenIconStyleConfiguration *)v8;
}

- (void)setHomeScreenIconStyleConfiguration:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [(id)v6 auditToken];

  id v10 = 0;
  LOBYTE(v6) = [(SBHomeScreenService *)self authenticateIconStyleRequestForAuditToken:v7 error:&v10];
  id v8 = v10;
  if (v6)
  {
    char v9 = +[SBIconController sharedInstanceIfExists];
    [v9 setCurrentHomeScreenIconStyleConfiguration:v4];
  }
  else
  {
    char v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setHomeScreenIconStyleConfiguration:](v8);
    }
  }
}

- (void)setObservingIconTintColor:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  id v7 = [v6 auditToken];

  id v18 = 0;
  BOOL v8 = [(SBHomeScreenService *)self authenticateIconStyleRequestForAuditToken:v7 error:&v18];
  id v9 = v18;
  if (!v8)
  {
    long long v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService setObservingIconTintColor:](v9);
    }
    goto LABEL_17;
  }
  int v10 = [v4 BOOLValue];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = [(NSMutableSet *)self->_iconTintColorObservingConnections count];
  iconTintColorObservingConnections = self->_iconTintColorObservingConnections;
  if (v10)
  {
    if (!iconTintColorObservingConnections)
    {
      id v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v14 = self->_iconTintColorObservingConnections;
      self->_iconTintColorObservingConnections = v13;

      iconTintColorObservingConnections = self->_iconTintColorObservingConnections;
    }
    [(NSMutableSet *)iconTintColorObservingConnections addObject:v5];
  }
  else
  {
    [(NSMutableSet *)iconTintColorObservingConnections removeObject:v5];
  }
  uint64_t v16 = [(NSMutableSet *)self->_iconTintColorObservingConnections count];
  os_unfair_lock_unlock(&self->_lock);
  if (v11 || !v16)
  {
    if (v11 && !v16) {
      [(SBHomeScreenService *)self endObservingNotificationsForIconTintColor];
    }
  }
  else
  {
    [(SBHomeScreenService *)self beginObservingNotificationsForIconTintColor];
  }
  if (v10)
  {
    long long v15 = [v5 remoteTarget];
    uint64_t v17 = [(SBHomeScreenService *)self _currentStyleConfiguration];
    [v15 homeScreenIconStyleConfigurationDidChange:v17];

LABEL_17:
  }
}

- (void)beginObservingNotificationsForIconTintColor
{
  uint64_t v3 = [(SBHomeScreenService *)self iconTintColorObserver];

  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = [(SBHomeScreenService *)self homeScreenDefaults];
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    char v12 = __66__SBHomeScreenService_beginObservingNotificationsForIconTintColor__block_invoke;
    id v13 = &unk_1E6AF4B10;
    objc_copyWeak(&v14, &location);
    id v7 = [v4 observeIconTintColorOnQueue:v5 withBlock:&v10];

    -[SBHomeScreenService setIconTintColorObserver:](self, "setIconTintColorObserver:", v7, v10, v11, v12, v13);
    BOOL v8 = +[SBIconController sharedInstance];
    id v9 = [v8 iconStyleCoordinator];
    [v9 addIconStyleObserver:self];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __66__SBHomeScreenService_beginObservingNotificationsForIconTintColor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyObserversOfIconImageStyleChange];
}

- (void)endObservingNotificationsForIconTintColor
{
  uint64_t v3 = [(SBHomeScreenService *)self iconTintColorObserver];
  [v3 invalidate];

  [(SBHomeScreenService *)self setIconTintColorObserver:0];
  id v5 = +[SBIconController sharedInstance];
  id v4 = [v5 iconStyleCoordinator];
  [v4 removeIconStyleObserver:self];
}

- (id)_currentStyleConfiguration
{
  uint64_t v3 = [MEMORY[0x1E4F62880] currentContext];
  id v4 = [(SBHomeScreenService *)self _currentStyleConfigurationForConnection:v3];

  return v4;
}

- (id)_currentStyleConfigurationForConnection:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = +[SBIconController sharedInstanceIfExists];
    id v5 = [v4 currentIconStyleConfiguration];
  }
  else
  {
    id v4 = [v3 remoteToken];
    id v6 = [v4 bundleID];
    if ([v6 isEqualToString:@"com.apple.Spotlight"])
    {
      id v7 = +[SBIconController sharedInstanceIfExists];
      id v5 = [v7 currentHomeScreenIconStyleConfiguration];
    }
    else
    {
      id v5 = [MEMORY[0x1E4FA6AB8] automaticStyleConfiguration];
    }
  }
  return v5;
}

- (void)notifyObserversOfIconImageStyleChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(SBHomeScreenService *)self iconTintColorObservingConnections];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v12 = -[SBHomeScreenService _currentStyleConfigurationForConnection:](self, "_currentStyleConfigurationForConnection:", v11, (void)v14);
        id v13 = [v11 remoteTarget];
        [v13 homeScreenIconStyleConfigurationDidChange:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)clearAllOverflowSlotCounts
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

uint64_t __49__SBHomeScreenService_clearAllOverflowSlotCounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOverflowSlotCount:0];
}

- (SBSHomeScreenServiceArrayOfNumbers)overflowSlotCounts
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v4 = [v3 remoteProcess];
  uint64_t v5 = [v4 auditToken];

  uint64_t v6 = [(SBHomeScreenService *)self overflowSlotsAuthenticator];
  id v22 = 0;
  char v7 = [v6 authenticateAuditToken:v5 error:&v22];
  id v8 = v22;

  if (v7)
  {
    uint64_t v9 = +[SBIconController sharedInstance];
    uint64_t v10 = [v9 iconManager];

    uint64_t v11 = [v10 rootFolder];
    char v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __41__SBHomeScreenService_overflowSlotCounts__block_invoke;
    uint64_t v20 = &unk_1E6AFEED8;
    id v21 = v12;
    id v13 = v12;
    [v11 enumerateListsWithOptions:4 usingBlock:&v17];
    id v14 = objc_alloc(MEMORY[0x1E4FA6AD0]);
    long long v15 = objc_msgSend(v14, "initWithArray:", v13, v17, v18, v19, v20);
  }
  else
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService overflowSlotCounts](v8);
    }
    long long v15 = 0;
  }

  return (SBSHomeScreenServiceArrayOfNumbers *)v15;
}

void __41__SBHomeScreenService_overflowSlotCounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "overflowSlotCount"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)setupHomeScreenForWidgetScrollPerformanceTest
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)runWidgetDiscoverabilityTest
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (id)silhouetteLayoutForPageAtIndex:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v6 = [v5 remoteProcess];
  uint64_t v7 = [v6 auditToken];

  id v8 = [(SBHomeScreenService *)self silhouetteAuthenticator];
  id v15 = 0;
  char v9 = [v8 authenticateAuditToken:v7 error:&v15];
  id v10 = v15;

  if (v9)
  {
    uint64_t v11 = +[SBIconController sharedInstance];
    char v12 = [v11 iconManager];

    id v13 = -[NSObject silhouetteLayoutForPageAtIndex:](v12, "silhouetteLayoutForPageAtIndex:", [v4 unsignedIntegerValue]);
  }
  else
  {
    char v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService silhouetteLayoutForPageAtIndex:](v10);
    }
    id v13 = 0;
  }

  return v13;
}

- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [MEMORY[0x1E4F62880] currentContext];
  char v9 = [v8 remoteProcess];
  id v10 = [v9 auditToken];

  uint64_t v11 = [(SBHomeScreenService *)self prominentIconSwapAuthenticator];
  id v16 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v16];
  id v13 = v16;

  if (v12)
  {
    id v14 = +[SBIconController sharedInstance];
    id v15 = [v14 iconManager];

    [v15 swapApplicationIconsInProminentPositionsWithBundleIdentifier:v6 withApplicationIconsWithWithBundleIdentifier:v7];
  }
  else
  {
    id v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:](v13);
    }
  }
}

- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  id v8 = [MEMORY[0x1E4F62880] currentContext];
  char v9 = [v8 remoteProcess];
  id v10 = [v9 auditToken];

  uint64_t v11 = [(SBHomeScreenService *)self prominentIconSwapAuthenticator];
  id v18 = 0;
  char v12 = [v11 authenticateAuditToken:v10 error:&v18];
  id v13 = v18;

  if ((v12 & 1) == 0)
  {
    id v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenService canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:](v13);
    }
    goto LABEL_6;
  }
  id v14 = +[SBIconController sharedInstance];
  id v15 = [v14 iconManager];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:
    char v16 = 0;
    goto LABEL_7;
  }
  char v16 = [v15 canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:v6 withApplicationIconsWithWithBundleIdentifier:v7];
LABEL_7:

  return v16;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "New client connection: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke;
  v10[3] = &unk_1E6AF7470;
  v10[4] = self;
  [v6 configureConnection:v10];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v9 = [(SBHomeScreenService *)self activeConnections];
  [v9 addObject:v6];

  os_unfair_lock_unlock(p_lock);
  [v6 activate];
}

void __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA6AE8];
  id v4 = a2;
  uint64_t v5 = [v3 interface];
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v4 setServiceQuality:v6];

  [v4 setTargetQueue:MEMORY[0x1E4F14428]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E6AFEF00;
  v7[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v7];
}

void __65__SBHomeScreenService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Client disconnection: %@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v5 = [*(id *)(a1 + 32) activeConnections];
  [v5 removeObject:v3];

  id v6 = [*(id *)(a1 + 32) webClipObservingConnections];
  [v6 removeObject:v3];

  id v7 = [*(id *)(a1 + 32) layoutObservingConnections];
  [v7 removeObject:v3];

  id v8 = [*(id *)(a1 + 32) layoutAvailabilityObservingConnections];
  [v8 removeObject:v3];

  char v9 = [*(id *)(a1 + 32) iconBadgeValueObservingConnections];
  if ([v9 count])
  {
    [v9 removeObject:v3];
    if (![v9 count]) {
      [*(id *)(a1 + 32) endObservingNotificationsForIconBadgeValue];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (SBIconController)iconController
{
  return self->_iconController;
}

- (FBServiceClientAuthenticator)resetHomeScreenLayoutAuthenticator
{
  return self->_resetHomeScreenLayoutAuthenticator;
}

- (FBServiceClientAuthenticator)requestSuggestedAppAuthenticator
{
  return self->_requestSuggestedAppAuthenticator;
}

- (FBServiceClientAuthenticator)iconFolderPathLookupAuthenticator
{
  return self->_iconFolderPathLookupAuthenticator;
}

- (FBServiceClientAuthenticator)addApplicationIconAuthenticator
{
  return self->_addApplicationIconAuthenticator;
}

- (FBServiceClientAuthenticator)addWidgetToTodayViewAuthenticator
{
  return self->_addWidgetToTodayViewAuthenticator;
}

- (FBServiceClientAuthenticator)largeIconLayoutAuthenticator
{
  return self->_largeIconLayoutAuthenticator;
}

- (FBServiceClientAuthenticator)addsNewIconsToHomeScreenAuthenticator
{
  return self->_addsNewIconsToHomeScreenAuthenticator;
}

- (FBServiceClientAuthenticator)showsBadgesInAppLibraryAuthenticator
{
  return self->_showsBadgesInAppLibraryAuthenticator;
}

- (FBServiceClientAuthenticator)showsHomeScreenSearchAffordanceAuthenticator
{
  return self->_showsHomeScreenSearchAffordanceAuthenticator;
}

- (FBServiceClientAuthenticator)homeScreenBundleIdentifiersAuthenticator
{
  return self->_homeScreenBundleIdentifiersAuthenticator;
}

- (FBServiceClientAuthenticator)displayedDateAuthenticator
{
  return self->_displayedDateAuthenticator;
}

- (FBServiceClientAuthenticator)configurationAuthenticator
{
  return self->_configurationAuthenticator;
}

- (FBServiceClientAuthenticator)openPodAuthenticator
{
  return self->_openPodAuthenticator;
}

- (FBServiceClientAuthenticator)addDebugIconAuthenticator
{
  return self->_addDebugIconAuthenticator;
}

- (FBServiceClientAuthenticator)observeInstalledWebClipsAuthenticator
{
  return self->_observeInstalledWebClipsAuthenticator;
}

- (FBServiceClientAuthenticator)activeWidgetInfoAuthenticator
{
  return self->_activeWidgetInfoAuthenticator;
}

- (FBServiceClientAuthenticator)addEmptyPageAuthenticator
{
  return self->_addEmptyPageAuthenticator;
}

- (FBServiceClientAuthenticator)addSuggestedPageAuthenticator
{
  return self->_addSuggestedPageAuthenticator;
}

- (FBServiceClientAuthenticator)homeScreenLayoutAvailabilityAuthenticator
{
  return self->_homeScreenLayoutAvailabilityAuthenticator;
}

- (FBServiceClientAuthenticator)homeScreenLayoutAuthenticator
{
  return self->_homeScreenLayoutAuthenticator;
}

- (FBServiceClientAuthenticator)iconBadgeValueAuthenticator
{
  return self->_iconBadgeValueAuthenticator;
}

- (FBServiceClientAuthenticator)overflowSlotsAuthenticator
{
  return self->_overflowSlotsAuthenticator;
}

- (FBServiceClientAuthenticator)silhouetteAuthenticator
{
  return self->_silhouetteAuthenticator;
}

- (FBServiceClientAuthenticator)iconTintColorAuthenticator
{
  return self->_iconTintColorAuthenticator;
}

- (FBServiceClientAuthenticator)iconStyleAuthenticator
{
  return self->_iconStyleAuthenticator;
}

- (FBServiceClientAuthenticator)shareSheetCustomViewAuthenticator
{
  return self->_shareSheetCustomViewAuthenticator;
}

- (FBServiceClientAuthenticator)prominentIconSwapAuthenticator
{
  return self->_prominentIconSwapAuthenticator;
}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (NSMutableSet)webClipObservingConnections
{
  return self->_webClipObservingConnections;
}

- (NSMutableSet)layoutAvailabilityObservingConnections
{
  return self->_layoutAvailabilityObservingConnections;
}

- (NSMutableSet)layoutObservingConnections
{
  return self->_layoutObservingConnections;
}

- (NSMutableSet)iconBadgeValueObservingConnections
{
  return self->_iconBadgeValueObservingConnections;
}

- (NSMutableSet)iconTintColorObservingConnections
{
  return self->_iconTintColorObservingConnections;
}

- (BSServiceConnectionListener)connectionListener
{
  return self->_connectionListener;
}

- (BOOL)isHomeScreenLayoutAvailable
{
  return self->_homeScreenLayoutAvailable;
}

- (void)setHomeScreenLayoutAvailable:(BOOL)a3
{
  self->_homeScreenLayoutAvailable = a3;
}

- (NSTimer)iconBadgeValueUpdateBatchTimer
{
  return self->_iconBadgeValueUpdateBatchTimer;
}

- (void)setIconBadgeValueUpdateBatchTimer:(id)a3
{
}

- (NSMutableSet)iconBadgeValueUpdateBatchBundleIdentifiers
{
  return self->_iconBadgeValueUpdateBatchBundleIdentifiers;
}

- (void)setIconBadgeValueUpdateBatchBundleIdentifiers:(id)a3
{
}

- (BSDefaultObserver)iconTintColorObserver
{
  return self->_iconTintColorObserver;
}

- (void)setIconTintColorObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTintColorObserver, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueUpdateBatchBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueUpdateBatchTimer, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_iconTintColorObservingConnections, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueObservingConnections, 0);
  objc_storeStrong((id *)&self->_layoutObservingConnections, 0);
  objc_storeStrong((id *)&self->_layoutAvailabilityObservingConnections, 0);
  objc_storeStrong((id *)&self->_webClipObservingConnections, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_prominentIconSwapAuthenticator, 0);
  objc_storeStrong((id *)&self->_shareSheetCustomViewAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconStyleAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconTintColorAuthenticator, 0);
  objc_storeStrong((id *)&self->_silhouetteAuthenticator, 0);
  objc_storeStrong((id *)&self->_overflowSlotsAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueAuthenticator, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutAuthenticator, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutAvailabilityAuthenticator, 0);
  objc_storeStrong((id *)&self->_addSuggestedPageAuthenticator, 0);
  objc_storeStrong((id *)&self->_addEmptyPageAuthenticator, 0);
  objc_storeStrong((id *)&self->_activeWidgetInfoAuthenticator, 0);
  objc_storeStrong((id *)&self->_observeInstalledWebClipsAuthenticator, 0);
  objc_storeStrong((id *)&self->_addDebugIconAuthenticator, 0);
  objc_storeStrong((id *)&self->_openPodAuthenticator, 0);
  objc_storeStrong((id *)&self->_configurationAuthenticator, 0);
  objc_storeStrong((id *)&self->_displayedDateAuthenticator, 0);
  objc_storeStrong((id *)&self->_appLibraryRequestUpdateAuthenticator, 0);
  objc_storeStrong((id *)&self->_homeScreenBundleIdentifiersAuthenticator, 0);
  objc_storeStrong((id *)&self->_showsHomeScreenSearchAffordanceAuthenticator, 0);
  objc_storeStrong((id *)&self->_showsBadgesInAppLibraryAuthenticator, 0);
  objc_storeStrong((id *)&self->_addsNewIconsToHomeScreenAuthenticator, 0);
  objc_storeStrong((id *)&self->_largeIconLayoutAuthenticator, 0);
  objc_storeStrong((id *)&self->_addWidgetToTodayViewAuthenticator, 0);
  objc_storeStrong((id *)&self->_addApplicationIconAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconFolderPathLookupAuthenticator, 0);
  objc_storeStrong((id *)&self->_requestSuggestedAppAuthenticator, 0);
  objc_storeStrong((id *)&self->_resetHomeScreenLayoutAuthenticator, 0);
  objc_storeStrong((id *)&self->_iconController, 0);
}

- (void)resetHomeScreenLayoutWithCompletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:(void *)a1 withCompletion:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)forbidApplicationBundleIdentifierFromLibrary:(void *)a1 withCompletion:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)resetCategoriesLayoutWithCompletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)runFloatingDockStressTestWithCompletion:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)requestSuggestedApplicationWithBundleIdentifier:(void *)a1 assertionPort:completion:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)folderPathToIconWithBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[SBHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:]";
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "%s 'applicationBundleIdentifier' is empty", (uint8_t *)&v1, 0xCu);
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(void *)a1 .cold.2(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)largeIconLayoutEnabledValue
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setLargeIconLayoutEnabledValue:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)largeIconSizeEnabledValue
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setLargeIconSizeEnabledValue:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)addsNewIconsToHomeScreenValue
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setAddsNewIconsToHomeScreenValue:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setIconListsHidden:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)showsBadgesInAppLibraryValue
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setShowsBadgesInAppLibraryValue:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)showsHomeScreenSearchAffordanceValue
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setShowsHomeScreenSearchAffordanceValue:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)allHomeScreenApplicationBundleIdentifiers
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)allIconLists
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)hasWidgetWithBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)debugContinuityWithBadgeType:(void *)a1 deviceTypeIdentifier:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_requestAppLibraryUpdate:(void *)a1 categoryMapProvider:reason:optionalCompletionHandler:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)configureLibraryWithCategoryLimit:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)configureCategoryMapProviderToUseCategoryMapAtURL:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)organizeAllIconsAcrossPagesWithPageCount:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)changeDisplayedDateOverride:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)changeDisplayedDateOffsetOverride:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)overrideBadgeValue:(void *)a1 forBundleIdentifier:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(void *)a1 completion:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)presentAppLibraryAnimated:(void *)a1 completion:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)dismissAppLibraryWithCompletion:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)addDebugIconWithSizeClassDescription:(void *)a1 inPage:atPositionDescription:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setObservingInstalledWebClips:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)debuggingActiveWidgetInfo
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)insertEmptyPageAtIndex:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)addSuggestedPageWithPageType:(void *)a1 focusModeIdentifier:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setObservingHomeScreenLayoutAvailability:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)homeScreenLayoutAvailability
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setObservingHomeScreenLayout:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setObservingIconBadgeValue:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(void *)a1 completionHandler:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)homeScreenIconStyleConfiguration
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setHomeScreenIconStyleConfiguration:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setObservingIconTintColor:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)overflowSlotCounts
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)silhouetteLayoutForPageAtIndex:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(void *)a1 withApplicationIconsWithWithBundleIdentifier:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

- (void)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(void *)a1 withApplicationIconsWithWithBundleIdentifier:.cold.1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

@end