@interface SBSHomeScreenService
- (BOOL)addsNewIconsToHomeScreen;
- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4;
- (BOOL)debugContinuityWithBadgeType:(id)a3 deviceTypeIdentifier:(id)a4;
- (BOOL)hasWidgetWithBundleIdentifier:(id)a3;
- (BOOL)isCachedHomeScreenLayoutAvailable;
- (BOOL)isCachedHomeScreenLayoutAvailableValid;
- (BOOL)isCachedIconStyleConfigurationValid;
- (BOOL)isHomeScreenLayoutAvailable;
- (BOOL)isLargeIconLayoutEnabled;
- (BOOL)isLargeIconSizeEnabled;
- (BOOL)showsBadgesInAppLibrary;
- (BOOL)showsHomeScreenSearchAffordance;
- (BSColor)iconTintColor;
- (NSArray)allHomeScreenApplicationBundleIdentifiers;
- (NSArray)allHomeScreenApplicationPlaceholderBundleIdentifiers;
- (NSArray)overflowSlotCounts;
- (NSString)allIconLists;
- (NSString)iconUserInterfaceStyle;
- (SBSDebugActiveWidgetInfo)debuggingActiveWidgetInfo;
- (SBSHomeScreenIconStyleConfiguration)cachedIconStyleConfiguration;
- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration;
- (SBSHomeScreenService)init;
- (id)addHomeScreenIconStyleObserver:(id)a3;
- (id)addHomeScreenLayoutAvailabilityObserver:(id)a3;
- (id)addHomeScreenLayoutObserver:(id)a3;
- (id)addIconBadgeValueObserver:(id)a3;
- (id)addIconTintColorObserver:(id)a3;
- (id)addInstalledWebClipsObserver:(id)a3;
- (id)badgeValueForIconWithApplicationBundleIdentifier:(id)a3;
- (id)configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3;
- (id)folderPathToIconWithBundleIdentifier:(id)a3;
- (id)silhouetteLayoutForPageAtIndex:(unint64_t)a3;
- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(id)a3;
- (void)addDebugIconWithSizeClassDescription:(id)a3 inPage:(unint64_t)a4 atPositionDescription:(id)a5;
- (void)addEmptyPage;
- (void)addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4;
- (void)addWidgetToTodayViewWithBundleIdentifier:(id)a3;
- (void)addsNewIconsToHomeScreen;
- (void)allHomeScreenApplicationBundleIdentifiers;
- (void)allHomeScreenApplicationPlaceholderBundleIdentifiers;
- (void)allIconLists;
- (void)applicationIconInfoChangedForBundleIdentifiers:(id)a3;
- (void)badgeValueForIconWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)changeDisplayedDateOffsetOverride:(double)a3;
- (void)changeDisplayedDateOverride:(id)a3;
- (void)clearAllOverflowSlotCounts;
- (void)clearNewlyInstalledAndRecentlyUpdatedAppIndicators;
- (void)clearTodayViewLayout;
- (void)configureDeweyEachAppHasItsOwnCategory;
- (void)configureDeweyOneCategoryWithAllApps;
- (void)configureLibraryWithCategoryLimit:(int64_t)a3;
- (void)dealloc;
- (void)debuggingActiveWidgetInfo;
- (void)deleteAllWebClips;
- (void)dismissAppLibraryWithCompletion:(id)a3;
- (void)forbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4;
- (void)homeScreenIconStyleConfiguration;
- (void)homeScreenIconStyleConfigurationDidChange:(id)a3;
- (void)homeScreenLayoutAvailabilityDidChange:(id)a3;
- (void)homeScreenLayoutDidChange;
- (void)ignoreAllApps;
- (void)insertEmptyPageAtIndex:(unint64_t)a3;
- (void)installedWebClipsDidChange;
- (void)isHomeScreenLayoutAvailable;
- (void)isLargeIconLayoutEnabled;
- (void)organizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3;
- (void)organizeAllIconsIntoFoldersWithPageCount:(unint64_t)a3;
- (void)overflowSlotCounts;
- (void)overrideBadgeValue:(id)a3 forBundleIdentifier:(id)a4;
- (void)presentAppLibraryAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(id)a3 completion:(id)a4;
- (void)randomizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3;
- (void)reloadHomeScreenLayout;
- (void)reloadIcons;
- (void)removeAllWidgets;
- (void)removeHomeScreenLayoutAvailabilityObservationAssertion:(id)a3;
- (void)removeHomeScreenLayoutObservationAssertion:(id)a3;
- (void)removeIconBadgeValueObservationAssertion:(id)a3;
- (void)removeIconStyleObservationAssertion:(id)a3;
- (void)removeInstalledWebClipsObservationAssertion:(id)a3;
- (void)removeWidgetsFromHomeScreen;
- (void)requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:(id)a3 completionHandler:(id)a4;
- (void)requestAppLibraryUpdateWithReason:(id)a3 completionHandler:(id)a4;
- (void)requestSuggestedApplicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)resetCategoriesLayoutWithCompletion:(id)a3;
- (void)resetHomeScreenLayoutWithCompletion:(id)a3;
- (void)resetTodayViewLayout;
- (void)runDownloadingIconTest;
- (void)runFloatingDockStressTestWithCompletion:(id)a3;
- (void)runRemoveAndRestoreIconTest;
- (void)runWidgetDiscoverabilityTest;
- (void)setAddsNewIconsToHomeScreen:(BOOL)a3;
- (void)setCachedHomeScreenLayoutAvailable:(BOOL)a3;
- (void)setCachedHomeScreenLayoutAvailableValid:(BOOL)a3;
- (void)setCachedIconStyleConfiguration:(id)a3;
- (void)setCachedIconStyleConfigurationValid:(BOOL)a3;
- (void)setHomeScreenIconStyleConfiguration:(id)a3;
- (void)setHomeScreenLayoutAvailable:(BOOL)a3;
- (void)setIconListsHidden:(id)a3;
- (void)setIconTintColor:(id)a3;
- (void)setIconUserInterfaceStyle:(id)a3;
- (void)setLargeIconLayoutEnabled:(BOOL)a3;
- (void)setLargeIconSizeEnabled:(BOOL)a3;
- (void)setShowsBadgesInAppLibrary:(BOOL)a3;
- (void)setShowsHomeScreenSearchAffordance:(BOOL)a3;
- (void)setupHomeScreenForWidgetScrollPerformanceTest;
- (void)showsBadgesInAppLibrary;
- (void)showsHomeScreenSearchAffordance;
- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4;
- (void)unforbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4;
@end

@implementation SBSHomeScreenService

- (void)requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  v9 = v8;
  if (v8)
  {
    if (v7) {
      [v8 requestAppLibraryUpdate:&unk_1EDF59468 reason:v6 completion:v7];
    }
    else {
      [v8 refreshAppLibrary:&unk_1EDF59468 reason:v6];
    }
  }
  else
  {
    v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:]();
    }
  }
}

- (SBSHomeScreenService)init
{
  v17.receiver = self;
  v17.super_class = (Class)SBSHomeScreenService;
  v2 = [(SBSHomeScreenService *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)Serial;

    id v6 = (void *)MEMORY[0x1E4F50BB8];
    id v7 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v8 = +[SBSHomeScreenServiceSpecification identifier];
    v9 = [v6 endpointForMachName:v7 service:v8 instance:0];

    objc_initWeak(&location, v3);
    v10 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v9];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __28__SBSHomeScreenService_init__block_invoke;
    v13[3] = &unk_1E566B438;
    v11 = v3;
    v14 = v11;
    objc_copyWeak(&v15, &location);
    [v10 configureConnection:v13];
    objc_storeStrong(v11 + 1, v10);
    [v11[1] activate];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__SBSHomeScreenService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSHomeScreenServiceSpecification interface];
  [v3 setInterface:v4];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v5 = +[SBSHomeScreenServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v3 setActivationHandler:&__block_literal_global_24];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__SBSHomeScreenService_init__block_invoke_7;
  v6[3] = &unk_1E566B410;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setInterruptionHandler:v6];
  [v3 setInvalidationHandler:&__block_literal_global_10];
  objc_destroyWeak(&v7);
}

void __28__SBSHomeScreenService_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "SBSHomeScreenService: Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __28__SBSHomeScreenService_init__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_INFO, "SBSHomeScreenService: Received interruption for connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [v3 activate];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 6);
    if ([*(id *)&v6[8]._os_unfair_lock_opaque count])
    {
      id v7 = [v3 remoteTarget];
      [v7 setObservingInstalledWebClips:MEMORY[0x1E4F1CC38]];
    }
    os_unfair_lock_unlock(v6 + 6);
  }
}

void __28__SBSHomeScreenService_init__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_INFO, "SBSHomeScreenService: Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSHomeScreenService;
  [(SBSHomeScreenService *)&v3 dealloc];
}

- (void)resetHomeScreenLayoutWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke;
    v11[3] = &unk_1E566B488;
    uint64_t v6 = &v12;
    id v12 = v4;
    [v5 resetHomeScreenLayoutWithCompletion:v11];
LABEL_7:

    goto LABEL_8;
  }
  id v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService resetHomeScreenLayoutWithCompletion:]();
  }

  if (v4)
  {
    connectionQueue = self->_connectionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_15;
    v9[3] = &unk_1E566B4D8;
    uint64_t v6 = &v10;
    id v10 = v4;
    dispatch_async(connectionQueue, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogCommon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: home screen layout successfully reset", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);
  }
}

uint64_t __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetCategoriesLayoutWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke;
    v11[3] = &unk_1E566B488;
    uint64_t v6 = &v12;
    id v12 = v4;
    [v5 resetCategoriesLayoutWithCompletion:v11];
LABEL_7:

    goto LABEL_8;
  }
  id v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService resetCategoriesLayoutWithCompletion:]();
  }

  if (v4)
  {
    connectionQueue = self->_connectionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_17;
    v9[3] = &unk_1E566B4D8;
    uint64_t v6 = &v10;
    id v10 = v4;
    dispatch_async(connectionQueue, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogCommon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: categories successfully reset", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);
  }
}

uint64_t __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke;
    v15[3] = &unk_1E566B930;
    id v9 = &v16;
    id v10 = v6;
    id v16 = v10;
    id v17 = v7;
    [v8 forbidApplicationBundleIdentifierFromLibrary:v10 withCompletion:v15];

LABEL_7:
    goto LABEL_8;
  }
  v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService forbidApplicationBundleIdentifierFromLibrary:withCompletion:]();
  }

  if (v7)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_18;
    block[3] = &unk_1E566B4D8;
    id v9 = &v14;
    id v14 = v7;
    dispatch_async(connectionQueue, block);
    goto LABEL_7;
  }
LABEL_8:
}

void __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: app bundle identifier '%@' was forbidden", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);
  }
}

uint64_t __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke;
    v15[3] = &unk_1E566B930;
    uint64_t v9 = &v16;
    id v10 = v6;
    id v16 = v10;
    id v17 = v7;
    [v8 unforbidApplicationBundleIdentifierFromLibrary:v10 withCompletion:v15];

LABEL_7:
    goto LABEL_8;
  }
  v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService unforbidApplicationBundleIdentifierFromLibrary:withCompletion:]();
  }

  if (v7)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_19;
    block[3] = &unk_1E566B4D8;
    uint64_t v9 = &v14;
    id v14 = v7;
    dispatch_async(connectionQueue, block);
    goto LABEL_7;
  }
LABEL_8:
}

void __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: app bundle identifier '%@' was unforbidden", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);
  }
}

uint64_t __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runFloatingDockStressTestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke;
    v11[3] = &unk_1E566B488;
    uint64_t v6 = &v12;
    id v12 = v4;
    [v5 runFloatingDockStressTestWithCompletion:v11];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService runFloatingDockStressTestWithCompletion:]();
  }

  if (v4)
  {
    connectionQueue = self->_connectionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_20;
    v9[3] = &unk_1E566B4D8;
    uint64_t v6 = &v10;
    id v10 = v4;
    dispatch_async(connectionQueue, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogCommon();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: successfully ran floating dock suggestions stress test", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestSuggestedApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v8 isUsable])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initFromReceiveRight:v8];
    id v10 = [(BSServiceConnection *)self->_connection remoteTarget];
    if (v10)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2;
      v18[3] = &unk_1E566C1E8;
      v11 = &v20;
      id v20 = v7;
      id v19 = v8;
      [v10 requestSuggestedApplicationWithBundleIdentifier:v6 assertionPort:v9 completion:v18];
    }
    else
    {
      id v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SBSHomeScreenService requestSuggestedApplicationWithBundleIdentifier:completion:]();
      }

      connectionQueue = self->_connectionQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_27;
      v16[3] = &unk_1E566B4D8;
      v11 = &v17;
      id v17 = v7;
      dispatch_async(connectionQueue, v16);
    }
  }
  else
  {
    id v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService requestSuggestedApplicationWithBundleIdentifier:completion:]();
    }

    v13 = self->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke;
    block[3] = &unk_1E566B4D8;
    id v22 = v7;
    dispatch_async(v13, block);
    uint64_t v9 = v22;
  }
}

uint64_t __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [[SBSAssertion alloc] initWithAssertionName:@"com.apple.springboard.requestSuggestedApplication" reason:@"requestSuggestedApplicationWithBundleIdentifier" receiveRight:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, SBSAssertion *))(v5 + 16))(v5, v6);
  }
}

uint64_t __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)folderPathToIconWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService folderPathToIconWithBundleIdentifier:]();
    }
  }
  id v7 = [v5 folderPathToIconWithBundleIdentifier:v4];
  id v8 = [v7 array];

  return v8;
}

- (BOOL)debugContinuityWithBadgeType:(id)a3 deviceTypeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v8)
  {
    uint64_t v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService debugContinuityWithBadgeType:deviceTypeIdentifier:]();
    }
  }
  char v10 = [v8 debugContinuityWithBadgeType:v6 deviceTypeIdentifier:v7];

  return v10;
}

- (void)runDownloadingIconTest
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed runDownloadingIconTest (no target).", v2, v3, v4, v5, v6);
}

- (void)configureDeweyEachAppHasItsOwnCategory
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed configureDeweyEachAppHasItsOwnCategory (no target).", v2, v3, v4, v5, v6);
}

- (void)configureDeweyOneCategoryWithAllApps
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed configureDeweyOneCategoryWithAllApps (no target).", v2, v3, v4, v5, v6);
}

- (void)configureLibraryWithCategoryLimit:(int64_t)a3
{
  uint64_t v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService configureLibraryWithCategoryLimit:]();
    }
  }
  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v4 configureLibraryWithCategoryLimit:v6];
}

- (id)configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    uint8_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService configureCategoryMapProviderToUseCategoryMapAtURL:]();
    }
  }
  id v7 = [v5 configureCategoryMapProviderToUseCategoryMapAtURL:v4];

  return v7;
}

- (void)runRemoveAndRestoreIconTest
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed runRemoveAndRestoreIconTest (no target).", v2, v3, v4, v5, v6);
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    uint8_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:]();
    }
  }
  [v5 addApplicationIconToHomeScreenWithBundleIdentifier:v4];
}

- (void)addWidgetToTodayViewWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    uint8_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addWidgetToTodayViewWithBundleIdentifier:]();
    }
  }
  [v5 addWidgetToTodayViewWithBundleIdentifier:v4];
}

- (BOOL)isLargeIconLayoutEnabled
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    uint64_t v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService isLargeIconLayoutEnabled]();
    }
  }
  id v4 = [v2 largeIconLayoutEnabledValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setLargeIconLayoutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService isLargeIconLayoutEnabled]();
    }
  }
  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v4 setLargeIconLayoutEnabledValue:v6];
}

- (BOOL)isLargeIconSizeEnabled
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService isLargeIconLayoutEnabled]();
    }
  }
  id v4 = [v2 largeIconSizeEnabledValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setLargeIconSizeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService isLargeIconLayoutEnabled]();
    }
  }
  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v4 setLargeIconSizeEnabledValue:v6];
}

- (BOOL)addsNewIconsToHomeScreen
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addsNewIconsToHomeScreen]();
    }
  }
  id v4 = [v2 addsNewIconsToHomeScreenValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setAddsNewIconsToHomeScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService setAddsNewIconsToHomeScreen:]();
    }
  }
  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v4 setAddsNewIconsToHomeScreenValue:v6];
}

- (void)setIconListsHidden:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  char v5 = [(BSServiceConnection *)connection remoteTarget];
  if (!v5)
  {
    uint8_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService setIconListsHidden:]();
    }
  }
  id v7 = [[SBSHomeScreenServiceArrayOfStrings alloc] initWithArray:v4];

  [v5 setIconListsHidden:v7];
}

- (BOOL)showsBadgesInAppLibrary
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService showsBadgesInAppLibrary]();
    }
  }
  id v4 = [v2 showsBadgesInAppLibraryValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setShowsBadgesInAppLibrary:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService showsBadgesInAppLibrary]();
    }
  }
  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v4 setShowsBadgesInAppLibraryValue:v6];
}

- (BOOL)showsHomeScreenSearchAffordance
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService showsHomeScreenSearchAffordance]();
    }
  }
  id v4 = [v2 showsHomeScreenSearchAffordanceValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setShowsHomeScreenSearchAffordance:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService showsHomeScreenSearchAffordance]();
    }
  }
  uint8_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v4 setShowsHomeScreenSearchAffordanceValue:v6];
}

- (NSArray)allHomeScreenApplicationBundleIdentifiers
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService allHomeScreenApplicationBundleIdentifiers]();
    }
  }
  id v4 = [v2 allHomeScreenApplicationBundleIdentifiers];
  char v5 = [v4 array];

  return (NSArray *)v5;
}

- (NSArray)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService allHomeScreenApplicationPlaceholderBundleIdentifiers]();
    }
  }
  id v4 = [v2 allHomeScreenApplicationPlaceholderBundleIdentifiers];
  char v5 = [v4 array];

  return (NSArray *)v5;
}

- (NSString)allIconLists
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    BOOL v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService allIconLists]();
    }
  }
  id v4 = [v2 allIconLists];

  return (NSString *)v4;
}

- (BOOL)hasWidgetWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    uint8_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService hasWidgetWithBundleIdentifier:]();
    }
  }
  char v7 = [v5 hasWidgetWithBundleIdentifier:v4];

  return v7;
}

- (void)requestAppLibraryUpdateWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v7) {
      [v8 requestAppLibraryUpdate:&unk_1EDF59450 reason:v6 completion:v7];
    }
    else {
      [v8 refreshAppLibrary:&unk_1EDF59450 reason:v6];
    }
  }
  else
  {
    char v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService requestAppLibraryUpdateWithReason:completionHandler:]();
    }
  }
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(unint64_t)a3
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService organizeAllIconsIntoFoldersWithPageCount:]();
    }
  }
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v4 organizeAllIconsIntoFoldersWithPageCount:v6];
}

- (void)organizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService organizeAllIconsAcrossPagesWithPageCount:]();
    }
  }
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v4 organizeAllIconsAcrossPagesWithPageCount:v6];
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService randomizeAllIconsAcrossPagesWithPageCount:]();
    }
  }
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v4 randomizeAllIconsAcrossPagesWithPageCount:v6];
}

- (void)removeAllWidgets
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_18FBC5000, a2, v4, "SBSHomeScreenService: failed %{public}@ request (no target).", v5);
}

- (void)removeWidgetsFromHomeScreen
{
  BOOL v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v3)
  {
    uint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SBSHomeScreenService *)a2 removeAllWidgets];
    }
  }
  [v3 removeWidgetsFromHomeScreen];
}

- (void)ignoreAllApps
{
  BOOL v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v3)
  {
    uint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SBSHomeScreenService *)a2 removeAllWidgets];
    }
  }
  [v3 ignoreAllApps];
}

- (void)deleteAllWebClips
{
  BOOL v3 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v3)
  {
    uint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SBSHomeScreenService *)a2 removeAllWidgets];
    }
  }
  [v3 deleteAllWebClips];
}

- (void)changeDisplayedDateOverride:(id)a3
{
  id v4 = a3;
  char v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    uint64_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService changeDisplayedDateOverride:]();
    }
  }
  [v5 changeDisplayedDateOverride:v4];
}

- (void)changeDisplayedDateOffsetOverride:(double)a3
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    char v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService changeDisplayedDateOffsetOverride:]();
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [v4 changeDisplayedDateOffsetOverride:v6];
}

- (void)reloadIcons
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed reloadIcons request (no target).", v2, v3, v4, v5, v6);
}

- (void)reloadHomeScreenLayout
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed reloadHomeScreenLayout request (no target).", v2, v3, v4, v5, v6);
}

- (void)resetTodayViewLayout
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed resetTodayViewLayout request (no target).", v2, v3, v4, v5, v6);
}

- (void)clearTodayViewLayout
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed clearTodayViewLayout request (no target).", v2, v3, v4, v5, v6);
}

- (void)overrideBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v8)
  {
    uint64_t v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService overrideBadgeValue:forBundleIdentifier:]();
    }
  }
  [v8 overrideBadgeValue:v6 forBundleIdentifier:v7];
}

- (void)clearNewlyInstalledAndRecentlyUpdatedAppIndicators
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed clearNewlyInstalledAndRecentlyUpdatedAppIndicators request (no target).", v2, v3, v4, v5, v6);
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v8)
  {
    uint64_t v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService presentAppLibraryCategoryPodForCategoryIdentifier:completion:]();
    }
  }
  [v8 presentAppLibraryCategoryPodForCategoryIdentifier:v6 completion:v7];
}

- (void)presentAppLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  connection = self->_connection;
  id v6 = a4;
  id v7 = [(BSServiceConnection *)connection remoteTarget];
  if (!v7)
  {
    id v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService presentAppLibraryAnimated:completion:]();
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [v7 presentAppLibraryAnimated:v9 completion:v6];
}

- (void)dismissAppLibraryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService dismissAppLibraryWithCompletion:]();
    }
  }
  [v5 dismissAppLibraryWithCompletion:v4];
}

- (void)addDebugIconWithSizeClassDescription:(id)a3 inPage:(unint64_t)a4 atPositionDescription:(id)a5
{
  connection = self->_connection;
  id v8 = a5;
  id v9 = a3;
  char v10 = [(BSServiceConnection *)connection remoteTarget];
  if (!v10)
  {
    v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addDebugIconWithSizeClassDescription:inPage:atPositionDescription:]();
    }
  }
  id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  [v10 addDebugIconWithSizeClassDescription:v9 inPage:v12 atPositionDescription:v8];
}

- (id)addInstalledWebClipsObserver:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(BSServiceConnection *)connection remoteTarget];
  if (!v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addInstalledWebClipsObserver:]();
    }
  }
  id v8 = [[SBSHomeScreenServiceInstalledWebClipsObservationAssertion alloc] initWithObserver:v5 service:self];

  os_unfair_lock_lock(&self->_lock);
  installedWebClipObservers = self->_installedWebClipObservers;
  if (!installedWebClipObservers)
  {
    char v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v11 = self->_installedWebClipObservers;
    self->_installedWebClipObservers = v10;

    installedWebClipObservers = self->_installedWebClipObservers;
  }
  [(NSHashTable *)installedWebClipObservers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  [v6 setObservingInstalledWebClips:MEMORY[0x1E4F1CC38]];

  return v8;
}

- (void)removeInstalledWebClipsObservationAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_installedWebClipObservers removeObject:v5];

  NSUInteger v6 = [(NSHashTable *)self->_installedWebClipObservers count];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v7 setObservingInstalledWebClips:MEMORY[0x1E4F1CC28]];
  }
}

- (SBSDebugActiveWidgetInfo)debuggingActiveWidgetInfo
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    uint64_t v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService debuggingActiveWidgetInfo]();
    }
  }
  id v4 = [v2 debuggingActiveWidgetInfo];

  return (SBSDebugActiveWidgetInfo *)v4;
}

- (void)insertEmptyPageAtIndex:(unint64_t)a3
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v4)
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService insertEmptyPageAtIndex:]();
    }
  }
  NSUInteger v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v4 insertEmptyPageAtIndex:v6];
}

- (void)addEmptyPage
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addEmptyPage request (no target).", v2, v3, v4, v5, v6);
}

- (void)addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v8)
  {
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addSuggestedPageWithPageType:focusModeIdentifier:]();
    }
  }
  [v8 addSuggestedPageWithPageType:v6 focusModeIdentifier:v7];
}

- (BOOL)isHomeScreenLayoutAvailable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(SBSHomeScreenService *)self isCachedHomeScreenLayoutAvailableValid];
  char v5 = [(SBSHomeScreenService *)self isCachedHomeScreenLayoutAvailable];
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    id v6 = [(BSServiceConnection *)self->_connection remoteTarget];
    if (!v6)
    {
      id v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SBSHomeScreenService isHomeScreenLayoutAvailable]();
      }
    }
    id v8 = [v6 homeScreenLayoutAvailability];
    char v5 = [v8 BOOLValue];
  }
  return v5;
}

- (id)addHomeScreenLayoutAvailabilityObserver:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(BSServiceConnection *)connection remoteTarget];
  if (!v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addHomeScreenLayoutAvailabilityObserver:]();
    }
  }
  id v8 = [[SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion alloc] initWithObserver:v5 service:self];

  os_unfair_lock_lock(&self->_lock);
  homeScreenLayoutAvailableObservers = self->_homeScreenLayoutAvailableObservers;
  if (!homeScreenLayoutAvailableObservers)
  {
    char v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v11 = self->_homeScreenLayoutAvailableObservers;
    self->_homeScreenLayoutAvailableObservers = v10;

    homeScreenLayoutAvailableObservers = self->_homeScreenLayoutAvailableObservers;
  }
  [(NSHashTable *)homeScreenLayoutAvailableObservers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  [v6 setObservingHomeScreenLayoutAvailability:MEMORY[0x1E4F1CC38]];

  return v8;
}

- (void)removeHomeScreenLayoutAvailabilityObservationAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_homeScreenLayoutAvailableObservers removeObject:v5];

  NSUInteger v6 = [(NSHashTable *)self->_homeScreenLayoutAvailableObservers count];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v7 setObservingHomeScreenLayoutAvailability:MEMORY[0x1E4F1CC28]];
  }
}

- (id)addHomeScreenLayoutObserver:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  NSUInteger v6 = [(BSServiceConnection *)connection remoteTarget];
  if (!v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addHomeScreenLayoutObserver:]();
    }
  }
  id v8 = [[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion alloc] initWithObserver:v5 service:self];

  os_unfair_lock_lock(&self->_lock);
  homeScreenLayoutObservers = self->_homeScreenLayoutObservers;
  if (!homeScreenLayoutObservers)
  {
    char v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v11 = self->_homeScreenLayoutObservers;
    self->_homeScreenLayoutObservers = v10;

    homeScreenLayoutObservers = self->_homeScreenLayoutObservers;
  }
  [(NSHashTable *)homeScreenLayoutObservers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  [v6 setObservingHomeScreenLayout:MEMORY[0x1E4F1CC38]];

  return v8;
}

- (void)removeHomeScreenLayoutObservationAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_homeScreenLayoutObservers removeObject:v5];

  NSUInteger v6 = [(NSHashTable *)self->_homeScreenLayoutObservers count];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v7 setObservingHomeScreenLayout:MEMORY[0x1E4F1CC28]];
  }
}

- (BSColor)iconTintColor
{
  uint64_t v2 = [(SBSHomeScreenService *)self homeScreenIconStyleConfiguration];
  uint64_t v3 = v2;
  if (v2 && [v2 configurationType] == 3)
  {
    BOOL v4 = [v3 tintColor];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (BSColor *)v4;
}

- (void)setIconTintColor:(id)a3
{
  id v4 = +[SBSHomeScreenIconStyleConfiguration tintedStyleConfigurationWithTintColor:a3];
  [(SBSHomeScreenService *)self setHomeScreenIconStyleConfiguration:v4];
}

- (NSString)iconUserInterfaceStyle
{
  uint64_t v2 = [(SBSHomeScreenService *)self homeScreenIconStyleConfiguration];
  uint64_t v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 configurationType];
    if (v4 > 3) {
      id v5 = @"unknown";
    }
    else {
      id v5 = off_1E566C230[v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return &v5->isa;
}

- (void)setIconUserInterfaceStyle:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:@"auto"])
  {
    uint64_t v4 = +[SBSHomeScreenIconStyleConfiguration automaticStyleConfiguration];
LABEL_7:
    id v5 = (void *)v4;
    [(SBSHomeScreenService *)self setHomeScreenIconStyleConfiguration:v4];

    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"light"])
  {
    uint64_t v4 = +[SBSHomeScreenIconStyleConfiguration lightStyleConfiguration];
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"dark"])
  {
    uint64_t v4 = +[SBSHomeScreenIconStyleConfiguration darkStyleConfiguration];
    goto LABEL_7;
  }
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "Unable to set icon style to %s\n", (const char *)[v6 UTF8String]);
LABEL_8:
}

- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(SBSHomeScreenService *)self isCachedIconStyleConfigurationValid];
  id v5 = [(SBSHomeScreenService *)self cachedIconStyleConfiguration];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
    id v8 = v7;
    if (v7)
    {
      id v6 = [v7 homeScreenIconStyleConfiguration];
    }
    else
    {
      id v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBSHomeScreenService homeScreenIconStyleConfiguration]();
      }

      id v6 = 0;
    }
  }
  return (SBSHomeScreenIconStyleConfiguration *)v6;
}

- (void)setHomeScreenIconStyleConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  id v6 = v5;
  if (v5)
  {
    [v5 setHomeScreenIconStyleConfiguration:v4];
  }
  else
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService setHomeScreenIconStyleConfiguration:]();
    }
  }
}

- (id)addIconTintColorObserver:(id)a3
{
  return 0;
}

- (id)addHomeScreenIconStyleObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v5)
  {
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addHomeScreenIconStyleObserver:]();
    }
  }
  id v7 = [[SBSHomeScreenServiceIconStyleObservationAssertion alloc] initWithObserver:v4 service:self];
  os_unfair_lock_lock(&self->_lock);
  iconStyleObservers = self->_iconStyleObservers;
  if (!iconStyleObservers)
  {
    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    char v10 = self->_iconStyleObservers;
    self->_iconStyleObservers = v9;

    iconStyleObservers = self->_iconStyleObservers;
  }
  [(NSHashTable *)iconStyleObservers addObject:v7];
  BOOL v11 = [(SBSHomeScreenService *)self isCachedIconStyleConfigurationValid];
  id v12 = [(SBSHomeScreenService *)self cachedIconStyleConfiguration];
  os_unfair_lock_unlock(&self->_lock);
  [v5 setObservingIconTintColor:MEMORY[0x1E4F1CC38]];
  if (v11) {
    [v4 homeScreenService:self homeScreenIconStyleConfigurationDidChange:v12];
  }

  return v7;
}

- (void)removeIconStyleObservationAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_iconStyleObservers removeObject:v5];

  if ([(NSHashTable *)self->_iconStyleObservers count])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(SBSHomeScreenService *)self setCachedIconStyleConfigurationValid:0];
    os_unfair_lock_unlock(p_lock);
    id v6 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v6 setObservingIconTintColor:MEMORY[0x1E4F1CC28]];
  }
}

- (id)silhouetteLayoutForPageAtIndex:(unint64_t)a3
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    id v6 = [v4 silhouetteLayoutForPageAtIndex:v5];
  }
  else
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService silhouetteLayoutForPageAtIndex:]();
    }

    id v6 = 0;
  }

  return v6;
}

- (id)addIconBadgeValueObserver:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(BSServiceConnection *)connection remoteTarget];
  if (!v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService addIconBadgeValueObserver:]();
    }
  }
  id v8 = [[SBSHomeScreenServiceIconBadgeValueObservationAssertion alloc] initWithObserver:v5 service:self];

  os_unfair_lock_lock(&self->_lock);
  iconBadgeValueObservers = self->_iconBadgeValueObservers;
  if (!iconBadgeValueObservers)
  {
    char v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v11 = self->_iconBadgeValueObservers;
    self->_iconBadgeValueObservers = v10;

    iconBadgeValueObservers = self->_iconBadgeValueObservers;
  }
  [(NSHashTable *)iconBadgeValueObservers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  [v6 setObservingIconBadgeValue:MEMORY[0x1E4F1CC38]];

  return v8;
}

- (void)removeIconBadgeValueObservationAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_iconBadgeValueObservers removeObject:v5];

  NSUInteger v6 = [(NSHashTable *)self->_iconBadgeValueObservers count];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v7 setObservingIconBadgeValue:MEMORY[0x1E4F1CC28]];
  }
}

- (id)badgeValueForIconWithApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
  NSUInteger v6 = v5;
  if (v5)
  {
    id v7 = [v5 badgeValueForIconWithApplicationBundleIdentifier:v4];
    id v8 = [v7 numberOrString];
  }
  else
  {
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (v8) {
    goto LABEL_2;
  }
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:]();
  }

  if (!v7)
  {
LABEL_2:
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__SBSHomeScreenService_badgeValueForIconWithApplicationBundleIdentifier_completionHandler___block_invoke;
    v10[3] = &unk_1E566C210;
    id v11 = v7;
    [v8 badgeValueForIconWithApplicationBundleIdentifier:v6 completionHandler:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __91__SBSHomeScreenService_badgeValueForIconWithApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 numberOrString];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAllOverflowSlotCounts
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed clearAllOverflowSlotCounts request (no target).", v2, v3, v4, v5, v6);
}

- (NSArray)overflowSlotCounts
{
  uint64_t v2 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v2)
  {
    uint64_t v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService overflowSlotCounts]();
    }
  }
  uint64_t v4 = [v2 overflowSlotCounts];
  uint64_t v5 = [v4 array];

  return (NSArray *)v5;
}

- (void)setupHomeScreenForWidgetScrollPerformanceTest
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed setupHomeScreenForWidgetScrollPerformanceTest request (no target).", v2, v3, v4, v5, v6);
}

- (void)runWidgetDiscoverabilityTest
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed runWidgetDiscoverabilityTest request (no target).", v2, v3, v4, v5, v6);
}

- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v8)
  {
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:]();
    }
  }
  [v8 swapApplicationIconsInProminentPositionsWithBundleIdentifier:v6 withApplicationIconsWithWithBundleIdentifier:v7];
}

- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BSServiceConnection *)self->_connection remoteTarget];
  if (!v8)
  {
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSHomeScreenService canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:]();
    }
  }
  char v10 = [v8 canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:v6 withApplicationIconsWithWithBundleIdentifier:v7];

  return v10;
}

- (void)installedWebClipsDidChange
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18FBC5000, v2, (uint64_t)v2, "Lost an observer for installed web clips without invalidating the assertion", v3);
}

- (void)homeScreenLayoutAvailabilityDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSHashTable *)self->_homeScreenLayoutAvailableObservers allObjects];
  -[SBSHomeScreenService setCachedHomeScreenLayoutAvailable:](self, "setCachedHomeScreenLayoutAvailable:", [v4 BOOLValue]);
  [(SBSHomeScreenService *)self setCachedHomeScreenLayoutAvailableValid:1];
  os_unfair_lock_unlock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 observer];
        v13 = v12;
        if (v12)
        {
          [v12 homeScreenServiceLayoutAvailabilityDidChange:self];
        }
        else
        {
          id v14 = SBLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SBSHomeScreenService homeScreenLayoutAvailabilityDidChange:](&v15, v16);
          }

          [(SBSHomeScreenService *)self removeHomeScreenLayoutAvailabilityObservationAssertion:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)applicationIconInfoChangedForBundleIdentifiers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSHashTable *)self->_iconBadgeValueObservers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  long long v19 = v4;
  uint64_t v7 = [v4 array];
  uint64_t v8 = (void *)[v6 initWithArray:v7];

  uint64_t v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SBSHomeScreenService applicationIconInfoChangedForBundleIdentifiers:]();
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v16 = [v15 observer];
        long long v17 = v16;
        if (v16)
        {
          [v16 homeScreenService:self applicationIconInfoChangedForBundleIdentifiers:v8];
        }
        else
        {
          long long v18 = SBLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[SBSHomeScreenService applicationIconInfoChangedForBundleIdentifiers:](&v20, v21);
          }

          [(SBSHomeScreenService *)self removeIconBadgeValueObservationAssertion:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)homeScreenLayoutDidChange
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18FBC5000, v2, (uint64_t)v2, "Lost an observer for home screen layout without invalidating the assertion", v3);
}

- (void)homeScreenIconStyleConfigurationDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSHashTable *)self->_iconStyleObservers allObjects];
  [(SBSHomeScreenService *)self setCachedIconStyleConfiguration:v4];
  [(SBSHomeScreenService *)self setCachedIconStyleConfigurationValid:1];
  os_unfair_lock_unlock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 observer];
        uint64_t v13 = v12;
        if (v12)
        {
          [v12 homeScreenService:self homeScreenIconStyleConfigurationDidChange:v4];
        }
        else
        {
          id v14 = SBLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SBSHomeScreenService homeScreenIconStyleConfigurationDidChange:](&v15, v16);
          }

          [(SBSHomeScreenService *)self removeIconStyleObservationAssertion:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)setHomeScreenLayoutAvailable:(BOOL)a3
{
  self->_homeScreenLayoutAvailable = a3;
}

- (BOOL)isCachedHomeScreenLayoutAvailable
{
  return self->_cachedHomeScreenLayoutAvailable;
}

- (void)setCachedHomeScreenLayoutAvailable:(BOOL)a3
{
  self->_cachedHomeScreenLayoutAvailable = a3;
}

- (BOOL)isCachedHomeScreenLayoutAvailableValid
{
  return self->_cachedHomeScreenLayoutAvailableValid;
}

- (void)setCachedHomeScreenLayoutAvailableValid:(BOOL)a3
{
  self->_cachedHomeScreenLayoutAvailableValid = a3;
}

- (SBSHomeScreenIconStyleConfiguration)cachedIconStyleConfiguration
{
  return self->_cachedIconStyleConfiguration;
}

- (void)setCachedIconStyleConfiguration:(id)a3
{
}

- (BOOL)isCachedIconStyleConfigurationValid
{
  return self->_cachedIconStyleConfigurationValid;
}

- (void)setCachedIconStyleConfigurationValid:(BOOL)a3
{
  self->_cachedIconStyleConfigurationValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIconStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_iconStyleObservers, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueObservers, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutObservers, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutAvailableObservers, 0);
  objc_storeStrong((id *)&self->_installedWebClipObservers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)resetHomeScreenLayoutWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed request to reset home screen layout (no target).", v2, v3, v4, v5, v6);
}

void __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: error from request to reset home screen layout: %@", v2, v3, v4, v5, v6);
}

- (void)resetCategoriesLayoutWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed request to reset categories (no target).", v2, v3, v4, v5, v6);
}

void __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: error from request to reset categories: %@", v2, v3, v4, v5, v6);
}

- (void)forbidApplicationBundleIdentifierFromLibrary:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed to forbid application bundle identifier (no target).", v2, v3, v4, v5, v6);
}

void __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: error from request to forbid application bundle identifier: %@", v2, v3, v4, v5, v6);
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed to unforbid application bundle identifier (no target).", v2, v3, v4, v5, v6);
}

void __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: error from request to unforbid application bundle identifier: %@", v2, v3, v4, v5, v6);
}

- (void)runFloatingDockStressTestWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed request to run floating dock suggestions stress test.", v2, v3, v4, v5, v6);
}

void __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: error from request to run stress test: %@", v2, v3, v4, v5, v6);
}

- (void)requestSuggestedApplicationWithBundleIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed app dock suggestion request (no target).", v2, v3, v4, v5, v6);
}

- (void)requestSuggestedApplicationWithBundleIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed app dock suggestion request (unusable assertion port).", v2, v3, v4, v5, v6);
}

void __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: error from app dock suggestion request: %@", v2, v3, v4, v5, v6);
}

- (void)folderPathToIconWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed folder path lookup request (no target).", v2, v3, v4, v5, v6);
}

- (void)debugContinuityWithBadgeType:deviceTypeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed debug continuity badge typoe (no target).", v2, v3, v4, v5, v6);
}

- (void)configureLibraryWithCategoryLimit:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed configureLibraryWithCategoryLimit: (no target).", v2, v3, v4, v5, v6);
}

- (void)configureCategoryMapProviderToUseCategoryMapAtURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed configureCategoryMapProviderToUseCategoryMapAtURL: (no target).", v2, v3, v4, v5, v6);
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed add icon to home screen request (no target).", v2, v3, v4, v5, v6);
}

- (void)addWidgetToTodayViewWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed add widget to today view request (no target).", v2, v3, v4, v5, v6);
}

- (void)isLargeIconLayoutEnabled
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed large icon request (no target).", v2, v3, v4, v5, v6);
}

- (void)addsNewIconsToHomeScreen
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed adds new icons to home screen request (no target).", v2, v3, v4, v5, v6);
}

- (void)setAddsNewIconsToHomeScreen:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed setAddsNewIconsToHomeScreen request (no target).", v2, v3, v4, v5, v6);
}

- (void)setIconListsHidden:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed setIconListsHidden request (no target).", v2, v3, v4, v5, v6);
}

- (void)showsBadgesInAppLibrary
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed shows badges in app library request (no target).", v2, v3, v4, v5, v6);
}

- (void)showsHomeScreenSearchAffordance
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed shows home screen search affordance request (no target).", v2, v3, v4, v5, v6);
}

- (void)allHomeScreenApplicationBundleIdentifiers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed allHomeScreenApplicationBundleIdentifiers request (no target).", v2, v3, v4, v5, v6);
}

- (void)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed allHomeScreenApplicationPlaceholderBundleIdentifiers request (no target).", v2, v3, v4, v5, v6);
}

- (void)allIconLists
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed allIconLists request (no target).", v2, v3, v4, v5, v6);
}

- (void)hasWidgetWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed hasWidgetWithBundleIdentifier request (no target).", v2, v3, v4, v5, v6);
}

- (void)requestAppLibraryUpdateWithReason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed requestAppLibraryUpdateReason: request (no target).", v2, v3, v4, v5, v6);
}

- (void)requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason: request (no target).", v2, v3, v4, v5, v6);
}

- (void)organizeAllIconsIntoFoldersWithPageCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed organizeAllIconsIntoFoldersWithPageCount request (no target).", v2, v3, v4, v5, v6);
}

- (void)organizeAllIconsAcrossPagesWithPageCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed organizeAllIconsAcrossPagesWithPageCount request (no target).", v2, v3, v4, v5, v6);
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed randomizeAllIconsAcrossPagesWithPageCount request (no target).", v2, v3, v4, v5, v6);
}

- (void)changeDisplayedDateOverride:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed changeDisplayedDateOverride request (no target).", v2, v3, v4, v5, v6);
}

- (void)changeDisplayedDateOffsetOverride:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed changeDisplayedDateOffsetOverride request (no target).", v2, v3, v4, v5, v6);
}

- (void)overrideBadgeValue:forBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed overrideBadgeValue:forBundleIdentifier: request (no target).", v2, v3, v4, v5, v6);
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed presentAppLibraryCategoryPodForCategoryIdentifier request (no target).", v2, v3, v4, v5, v6);
}

- (void)presentAppLibraryAnimated:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed presentAppLibraryAnimated:completion: request (no target).", v2, v3, v4, v5, v6);
}

- (void)dismissAppLibraryWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed dismissAppLibraryWithCompletion request (no target).", v2, v3, v4, v5, v6);
}

- (void)addDebugIconWithSizeClassDescription:inPage:atPositionDescription:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addDebugIconWithSizeClassDescription request (no target).", v2, v3, v4, v5, v6);
}

- (void)addInstalledWebClipsObserver:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addInstalledWebClipsObserver: request (no target).", v2, v3, v4, v5, v6);
}

- (void)debuggingActiveWidgetInfo
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed debuggingActiveWidgetInfo: request (no target).", v2, v3, v4, v5, v6);
}

- (void)insertEmptyPageAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed insertEmptyPageAtIndex: request (no target).", v2, v3, v4, v5, v6);
}

- (void)addSuggestedPageWithPageType:focusModeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addSuggestedPage request (no target).", v2, v3, v4, v5, v6);
}

- (void)isHomeScreenLayoutAvailable
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed isHomeScreenLayoutAvailable request (no target).", v2, v3, v4, v5, v6);
}

- (void)addHomeScreenLayoutAvailabilityObserver:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addHomeScreenLayoutAvailabilityObserver: request (no target).", v2, v3, v4, v5, v6);
}

- (void)addHomeScreenLayoutObserver:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addHomeScreenLayoutObserver: request (no target).", v2, v3, v4, v5, v6);
}

- (void)homeScreenIconStyleConfiguration
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed homeScreenIconStyleConfiguration request (no target).", v2, v3, v4, v5, v6);
}

- (void)setHomeScreenIconStyleConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed setHomeScreenIconStyleConfiguration: request (no target).", v2, v3, v4, v5, v6);
}

- (void)addHomeScreenIconStyleObserver:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addHomeScreenIconStyleObserver: request (no target).", v2, v3, v4, v5, v6);
}

- (void)silhouetteLayoutForPageAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed silhouetteLayoutForPageAtIndex: request (no target).", v2, v3, v4, v5, v6);
}

- (void)addIconBadgeValueObserver:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed addIconBadgeValueObserver: request (no target).", v2, v3, v4, v5, v6);
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed badgeValueForIconWithApplicationBundleIdentifier: request (no target).", v2, v3, v4, v5, v6);
}

- (void)overflowSlotCounts
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed overflowSlotCounts request (no target).", v2, v3, v4, v5, v6);
}

- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed swapApplicationIconsInProminentPositionsWithBundleIdentifier request (no target).", v2, v3, v4, v5, v6);
}

- (void)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18FBC5000, v0, v1, "SBSHomeScreenService: failed canSwapApplicationIconsInProminentPositionsWithBundleIdentifier request (no target).", v2, v3, v4, v5, v6);
}

- (void)homeScreenLayoutAvailabilityDidChange:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18FBC5000, v2, (uint64_t)v2, "Lost an observer for home screen layout availability without invalidating the assertion", v3);
}

- (void)applicationIconInfoChangedForBundleIdentifiers:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18FBC5000, v2, (uint64_t)v2, "Lost an observer for application icon info without invalidating the assertion", v3);
}

- (void)applicationIconInfoChangedForBundleIdentifiers:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "Received notification for changed application icon info: %@", v2, v3, v4, v5, v6);
}

- (void)homeScreenIconStyleConfigurationDidChange:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18FBC5000, v2, (uint64_t)v2, "Lost an observer for icon style without invalidating the assertion", v3);
}

@end