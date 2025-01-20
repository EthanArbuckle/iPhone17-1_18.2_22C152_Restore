@interface SBIconController
+ (SBIconController)sharedInstance;
+ (SBIconController)sharedInstanceIfExists;
+ (void)_getApplicationDataStore:(id *)a3 configurationKey:(id *)a4 forDataSource:(id)a5;
- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription;
- (BOOL)_allowsBadgingForApplicationBundleIdentifier:(id)a3;
- (BOOL)_badgesAreEnabledForSectionInfo:(id)a3;
- (BOOL)_dragSessionContainsAppClipWebClipIcon:(id)a3;
- (BOOL)_enableWidgetSuggestionsForIconsInModel:(id)a3 withRootFolder:(id)a4;
- (BOOL)_ignoreMutatingIconListsOnApplicationInstall;
- (BOOL)_isCoplanarHomeScreenEnabled;
- (BOOL)_isHostedByCoverSheet;
- (BOOL)_isWidgetWithContainerBundleIdentifierValid:(id)a3;
- (BOOL)_ppt_pushHomeScreenStateWithError:(id *)a3;
- (BOOL)_shouldHideAppIconForceTouchInfoForApplication:(id)a3;
- (BOOL)_shouldTodayViewController:(id)a3 receiveTouch:(id)a4;
- (BOOL)_tryToPrepareNonDynamicDefaultTodayLayout;
- (BOOL)allowsBadgingForIcon:(id)a3;
- (BOOL)allowsHomeScreenOverlay;
- (BOOL)allowsUninstall;
- (BOOL)appPredictionViewController:(id)a3 launchAppFromIcon:(id)a4;
- (BOOL)appPredictionViewController:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4;
- (BOOL)areAnyIconViewContextMenusAnimating;
- (BOOL)areAnyIconViewContextMenusShowing;
- (BOOL)areHomeScreenIconsOccluded;
- (BOOL)canAppPredictionsWidgetAlignWithGrid;
- (BOOL)forbidApplicationBundleIdentifierFromLibrary:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasRestrictedEnforcedLayout;
- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4;
- (BOOL)iconManager:(id)a3 allowsBadgingForIconLocation:(id)a4;
- (BOOL)iconManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5;
- (BOOL)iconManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5;
- (BOOL)iconManager:(id)a3 canAddIcon:(id)a4 toIconList:(id)a5 inFolder:(id)a6;
- (BOOL)iconManager:(id)a3 canAddIconToIgnoredList:(id)a4;
- (BOOL)iconManager:(id)a3 canBeginDragForIconView:(id)a4;
- (BOOL)iconManager:(id)a3 canCustomElementAlignWithGrid:(id)a4;
- (BOOL)iconManager:(id)a3 folderController:(id)a4 canChangeCurrentPageIndexToIndex:(int64_t)a5;
- (BOOL)iconManager:(id)a3 iconViewDisplaysCloseBox:(id)a4;
- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4;
- (BOOL)iconManager:(id)a3 isCustomElementValid:(id)a4;
- (BOOL)iconManager:(id)a3 isEditingAllowedForIconView:(id)a4;
- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4;
- (BOOL)iconManager:(id)a3 isPartialEditingAllowedForIconLocation:(id)a4;
- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4;
- (BOOL)iconManager:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5 forIconView:(id)a6;
- (BOOL)iconManager:(id)a3 shouldCacheRecentViewController:(id)a4 forIdentifier:(id)a5;
- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5;
- (BOOL)iconManager:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4;
- (BOOL)iconManager:(id)a3 supportsParallaxForIconView:(id)a4;
- (BOOL)iconManagerAppliesListsFixedIconLocationBehaviorOnlyToNewLists:(id)a3;
- (BOOL)iconManagerCanBeginIconDrags:(id)a3;
- (BOOL)iconManagerCanSaveIconState:(id)a3;
- (BOOL)iconManagerCanUseSeparateWindowForRotation:(id)a3;
- (BOOL)iconManagerShouldShowWidgetIntroductionPopoverForDefaultWidgets:(id)a3;
- (BOOL)iconsSnapToGrid;
- (BOOL)importIconState:(id)a3;
- (BOOL)isAnySearchVisibleOrTransitioning;
- (BOOL)isAppLibraryAllowed;
- (BOOL)isAppLibrarySupported;
- (BOOL)isEditingAllowedForIconManager:(id)a3;
- (BOOL)isEditingForHomeScreenOverlayController:(id)a3;
- (BOOL)isEnterpriseMultiUser;
- (BOOL)isFloatingDockSupportedForIconManager:(id)a3;
- (BOOL)isFloatingDockVisibleForIconManager:(id)a3;
- (BOOL)isFocusAllowedForIconManager:(id)a3;
- (BOOL)isHideSuggestionSupportedForIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isHideSupportedForIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isHomeScreenWallpaperDimmedForIconManager:(id)a3;
- (BOOL)isIconContentPossiblyVisibleOverApplicationForIconManager:(id)a3;
- (BOOL)isIconVisibleForBundleIdentifier:(id)a3;
- (BOOL)isLargeIconSizeEnabled;
- (BOOL)isMainDisplayLibraryViewVisible;
- (BOOL)isModalAppLibrarySupported;
- (BOOL)isOnlyHideSuggestionSupportedForIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3;
- (BOOL)isShowingHomeScreenOverlay;
- (BOOL)isTodayOverlayPresented;
- (BOOL)isTodayOverlaySpotlightVisible;
- (BOOL)isTodayViewRotating:(id)a3;
- (BOOL)isUninstallOrHideSupportedForIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isUninstallSupportedForAnyIcon;
- (BOOL)isUninstallSupportedForIcon:(id)a3;
- (BOOL)isUninstallingSystemAppsRestricted;
- (BOOL)isUpgradeRestore;
- (BOOL)listsAllowRotatedLayoutForIconManager:(id)a3;
- (BOOL)resetCategories;
- (BOOL)resetHomeScreenLayout;
- (BOOL)searchPresenterCanPresent:(id)a3;
- (BOOL)shouldAddNewIconsToRootFolder;
- (BOOL)shouldCommandeerContentDragsInLocation:(id)a3;
- (BOOL)shouldUseHomeScreenLargeIconSizeForIconManager:(id)a3;
- (BOOL)shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:(id)a3;
- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:(id)a3;
- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayController:(id)a3;
- (BOOL)unforbidApplicationBundleIdentifierFromLibrary:(id)a3;
- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3;
- (BSInvalidatable)addWidgetSheetKeyboardFocusAssertion;
- (BSInvalidatable)displayLayoutTransition;
- (BSInvalidatable)keepTodayViewIconImagesStaticAssertion;
- (BSInvalidatable)scrollAccessoryBorrowedForSearchPresentationAssertion;
- (BSInvalidatable)suspendWallpaperAnimationForOverlayViewAssertion;
- (BSInvalidatable)suspendWallpaperAnimationForSpotlightAssertion;
- (BSInvalidatable)todayViewDisplayLayoutAssertion;
- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4;
- (Class)iconManager:(id)a3 iconClassForApplicationWithBundleIdentifier:(id)a4 proposedClass:(Class)a5;
- (DNDModeConfigurationService)dndModeConfigurationService;
- (DNDStateService)dndStateService;
- (NSArray)suggestedOnboardingStack;
- (NSHashTable)floatingDockControllerObservers;
- (NSMutableArray)hiddenAppBundleIdentifiers;
- (NSSet)appIconForceTouchWindows;
- (NSSet)floatingDockBehaviorAssertions;
- (NSSet)visibleIconStateDisplayIdentifiers;
- (NSString)description;
- (NSTimer)delayedLaunchRequestTimer;
- (NSTimer)popoverDelayTimer;
- (OS_dispatch_queue)accountStoreQueue;
- (PTDoubleTestRecipe)shuffleStackTestRecipe;
- (PTSingleTestRecipe)organizeInFoldersTestRecipe;
- (PTSingleTestRecipe)relayoutTestRecipe;
- (PTSingleTestRecipe)runDownloadingIconTestRecipe;
- (PTSingleTestRecipe)runRemoveAndRestoreIconTestRecipe;
- (PTSingleTestRecipe)runWidgetDiscoverabilityTestRecipe;
- (PTSingleTestRecipe)toggleSearchTestRecipe;
- (SBAnalyticsEventsControllerForIconController)analyticsEventsController;
- (SBApplicationHosting)leftOfHomeAppViewController;
- (SBBarSwipeAffordanceViewController)widgetAddSheetAffordanceViewController;
- (SBFZStackParticipant)zStackParticipant;
- (SBFolderController)_currentFolderController;
- (SBFolderController)_openFolderController;
- (SBHIconImageAppearance)currentIconImageAppearance;
- (SBHIconImageCache)appSwitcherHeaderIconImageCache;
- (SBHIconImageCache)notificationIconImageCache;
- (SBHIconImageCache)tableUIIconImageCache;
- (SBHIconImageStyleConfiguration)currentIconImageStyleConfiguration;
- (SBHIconManager)iconManager;
- (SBHIconRootViewProviding)rootViewController;
- (SBHLegibility)scrollAccessoryAuxiliaryView;
- (SBHRootFolderSettings)rootFolderSettings;
- (SBHSearchPresenting)searchPresenter;
- (SBHWidgetMetricsProvider)ambientWidgetMetricsProvider;
- (SBHomeScreenOverlayController)homeScreenOverlayController;
- (SBHomeScreenSpotlightViewController)spotlightViewController;
- (SBHomeScreenViewController)homeScreenViewController;
- (SBIconAnimationContaining)currentAnimationContainer;
- (SBIconController)initWithMainDisplayWindowScene:(id)a3;
- (SBIconController)initWithMainDisplayWindowScene:(id)a3 alertItemsController:(id)a4 analyticsClient:(id)a5 applicationController:(id)a6 applicationPlaceholderController:(id)a7 assistantController:(id)a8 coverSheetPresentationManager:(id)a9 layoutStateProvider:(id)a10 lockScreenManager:(id)a11 policyAggregator:(id)a12 userInterfaceController:(id)a13 widgetMetricsServer:(id)a14;
- (SBIconDragManager)iconDragManager;
- (SBIconListLayoutProvider)ambientListLayoutProvider;
- (SBIconModel)model;
- (SBLibraryViewController)overlayLibraryViewController;
- (SBProactiveHomeScreenSuggestionProvider)proactiveSuggestionProvider;
- (SBProactiveHomeScreenUsageObserver)proactiveUsageObserver;
- (SBRootFolder)rootFolder;
- (SBRootFolderController)_rootFolderController;
- (SBRootFolderPageTransition)interactivePullToTodaySearchTransition;
- (SBRootFolderPageTransition)searchPresenterPageStateTransition;
- (SBSHomeScreenIconStyleConfiguration)currentHomeScreenIconStyleConfiguration;
- (SBSpotlightPresentableViewController)searchPresentableViewController;
- (SBTipsHomeScreenUsageObserver)tipsUsageObserver;
- (SBTodayViewController)coverSheetTodayViewController;
- (SBTodayViewController)todayViewController;
- (SBWallpaperIconStyleCoordinator)iconStyleCoordinator;
- (SBWidgetMetricsServer)widgetMetricsServer;
- (SBWindowScene)mainDisplayWindowScene;
- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3;
- (UIEdgeInsets)iconManager:(id)a3 contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a4;
- (UIEdgeInsets)iconManager:(id)a3 statusBarEdgeInsetsForFolderController:(id)a4;
- (UIView)containerView;
- (UIView)fallbackIconContainerView;
- (UIWindow)animationWindow;
- (_UILegibilitySettings)legibilitySettings;
- (double)distanceToTopOfSpotlightIconsForIconManager:(id)a3;
- (double)iconManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4;
- (double)maxPresentationOffset;
- (double)minimumHomeScreenScale;
- (double)searchTopOffsetForSearchPresenter:(id)a3;
- (double)topOffset;
- (id)_addStateCaptureHandlerForHomeScreenDefaults;
- (id)_addStateCaptureHandlerForInterestingAppIconLocations;
- (id)_addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled;
- (id)_addStateCaptureHandlerForRestrictions;
- (id)_aggregateLoggingAppKeyForIcon:(id)a3;
- (id)_appLibraryListLayoutProviderForWindowScene:(id)a3;
- (id)_configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3;
- (id)_createHomeScreenOverlayControllerIfNeeded;
- (id)_createTestFolder;
- (id)_createTestFolderWithOverrideIconList:(id)a3;
- (id)_createWidgetIconWithDataSource:(id)a3 gridSize:(id)a4;
- (id)_createWidgetIconWithDescriptors:(id)a3 gridSize:(id)a4;
- (id)_createWidgetIconWithKind:(id)a3 extensionBundleIdentifier:(id)a4 gridSize:(id)a5;
- (id)_featureIntroductionItemForWidgetSetupAtLocation:(unint64_t)a3;
- (id)_focusModeFromDoNotDisturbState:(id)a3;
- (id)_homeScreenOverlayControllerIfNeeded;
- (id)_identifierForSearchPresenter;
- (id)_libraryViewControllers;
- (id)_newSearchPillBackgroundView;
- (id)_newTodayViewControllerWithIconManager:(id)a3 iconListModel:(id)a4 rootFolder:(id)a5 location:(int64_t)a6;
- (id)_ppt_prepareTransientIconModelStoreWithError:(id *)a3;
- (id)_setUpLibraryViewControllerForWindowScene:(id)a3;
- (id)additionalIconListLayoutObserversForAppPredictionViewController:(id)a3;
- (id)alertItemsController;
- (id)allApplicationPlaceholdersForIconModel:(id)a3;
- (id)allApplicationsForIconModel:(id)a3;
- (id)analyticsClient;
- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5;
- (id)appPredictionViewController:(id)a3 badgeValueForApplicationWithBundleIdentifier:(id)a4;
- (id)appPredictionViewController:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4;
- (id)applicationController;
- (id)applicationPlaceholderController;
- (id)assistantController;
- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayController:(id)a3;
- (id)backgroundViewForSpotlightPresentableViewController:(id)a3;
- (id)coverSheetPresentationManager;
- (id)createFloatingDockControllerForWindowScene:(id)a3;
- (id)createModalLibraryControllerForWindowScene:(id)a3;
- (id)createStatusBarVisibiltyAssertionForWindowScene:(id)a3;
- (id)defaultIconStateForIconManager:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayConfigurationForPresenter:(id)a3;
- (id)displayIDsWithBadgingEnabled;
- (id)fallbackDefaultFirstPageWidgetsForIconManager:(id)a3;
- (id)folderNameForDisplayID:(id)a3;
- (id)homeScreenOverlayController:(id)a3 displayLayoutIdentifierForSidebarViewController:(id)a4;
- (id)iconManager:(id)a3 accessibilityTintColorForIconView:(id)a4;
- (id)iconManager:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4;
- (id)iconManager:(id)a3 animator:(id)a4 animationSettingsForOperation:(unint64_t)a5 childViewController:(id)a6;
- (id)iconManager:(id)a3 applicationIconForReplacingIconWithAppIcon:(id)a4 proposedApplicationIcon:(id)a5;
- (id)iconManager:(id)a3 applicationShortcutItemsForIconView:(id)a4;
- (id)iconManager:(id)a3 backgroundViewForComponentsOfIconView:(id)a4;
- (id)iconManager:(id)a3 backgroundViewForDockForRootFolderController:(id)a4;
- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4;
- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5;
- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4;
- (id)iconManager:(id)a3 containerViewControllerForConfigurationOfIconView:(id)a4;
- (id)iconManager:(id)a3 containerViewControllerForModalInteractionFromIconView:(id)a4;
- (id)iconManager:(id)a3 containerViewForConfigurationOfIconView:(id)a4;
- (id)iconManager:(id)a3 containerViewForModalInteractionFromIconView:(id)a4;
- (id)iconManager:(id)a3 containerViewForPresentingContextMenuForIconView:(id)a4;
- (id)iconManager:(id)a3 defaultAutomaticFavoriteIconIdentifiersWithMaximumCount:(unint64_t)a4;
- (id)iconManager:(id)a3 dragPreviewForIconView:(id)a4;
- (id)iconManager:(id)a3 fakeStatusBarForFolderController:(id)a4;
- (id)iconManager:(id)a3 floatingDockViewControllerForView:(id)a4;
- (id)iconManager:(id)a3 floatingDockViewControllerForViewController:(id)a4;
- (id)iconManager:(id)a3 homeScreenContentViewForConfigurationOfIconView:(id)a4;
- (id)iconManager:(id)a3 homeScreenContentViewForModalInteractionFromIconView:(id)a4;
- (id)iconManager:(id)a3 launchActionsForIconView:(id)a4;
- (id)iconManager:(id)a3 launchURLForIconView:(id)a4;
- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4;
- (id)iconManager:(id)a3 screenSnapshotProviderForComponentsOfIconView:(id)a4;
- (id)iconManager:(id)a3 statusBarStyleRequestForFolderController:(id)a4;
- (id)iconManager:(id)a3 viewControllerForCustomIcon:(id)a4 element:(id)a5;
- (id)iconManager:(id)a3 wantsToHideStatusBarForFolderController:(id)a4 animated:(BOOL)a5;
- (id)iconManager:(id)a3 widgetDataSourceForReplacingIconWithWidget:(id)a4 proposedWidgetDataSource:(id)a5;
- (id)iconManager:(id)a3 willAddDefaultFirstPageWidgetsBasedOnPinnedWidgets:(id)a4 suggestionWidgets:(id)a5;
- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4;
- (id)iconPathForIconWithDisplayID:(id)a3;
- (id)iconStylePickerConfigurationForIconManager:(id)a3;
- (id)launchActionsForIconView:(id)a3;
- (id)launchActivationSettingsForIconView:(id)a3;
- (id)launchURLForIconView:(id)a3;
- (id)layoutStateProvider;
- (id)libraryCategoryMapProvider;
- (id)libraryViewControllerForWindowScene:(id)a3;
- (id)localizedDefaultFolderNameForIconManager:(id)a3;
- (id)localizedFolderNameForDefaultDisplayName:(id)a3;
- (id)lockScreenManager;
- (id)markIconsOccludedForReason:(id)a3;
- (id)policyAggregator;
- (id)powerLogAggregator;
- (id)preferredFocusEnvironments;
- (id)proactiveHomeScreenUsageObserver:(id)a3 intentForWidget:(id)a4 ofIcon:(id)a5;
- (id)proactiveOnboardingDefaultStacks;
- (id)recycledViewsContainerProviderForIconManager:(id)a3;
- (id)rootFolderController:(id)a3 transitionContextForTransitioningToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (id)searchAffordanceViewForSpotlightPresentableViewController:(id)a3;
- (id)searchPresentablesForPresenter:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)temporaryIntentDataForIconWithIdentifier:(id)a3 widgetUniqueIdentifier:(id)a4;
- (id)testSetupForIconManagerAddWidgetsToEachPage:(id)a3;
- (id)testSetupForIconManagerWidgetScrollPerformanceTest:(id)a3;
- (id)testSetupForIconManagerWidgetScrollTest:(id)a3;
- (id)testSetupHomeScreenForWidgetScrollPerformanceTest:(id)a3;
- (id)transitionContextToShowSpotlight:(BOOL)a3 fromTodayView:(BOOL)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (id)userInterfaceController;
- (id)widgetIntroductionPreviewViewForIconManager:(id)a3;
- (id)widgetMetricsProvider:(id)a3 listLayoutProviderForScreenType:(unint64_t)a4;
- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5;
- (id)windowForIconDragPreviewsForIconManager:(id)a3 forWindowScene:(id)a4;
- (int64_t)currentIconListIndex;
- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5;
- (int64_t)iconManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5;
- (int64_t)iconManagerListsFixedIconLocationBehavior:(id)a3;
- (int64_t)interfaceOrientationForIconManager:(id)a3;
- (int64_t)searchPresenterDestinationPageState;
- (int64_t)userIconStateFileStatus;
- (unint64_t)_foldersInList:(id)a3;
- (unint64_t)addWidgetSheetStyleForIconManager:(id)a3;
- (unint64_t)allowedInterfaceOrientationsForIconManager:(id)a3;
- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (unint64_t)bestListLayoutProviderLayoutOptions;
- (unint64_t)defaultSearchViewPresentationSourceForViewController:(id)a3;
- (unint64_t)iconManager:(id)a3 focusEffectTypeForIconView:(id)a4;
- (unint64_t)iconManager:(id)a3 supportedMultitaskingShortcutActionsForIconView:(id)a4;
- (unint64_t)iconOcclusionReasons;
- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3;
- (unint64_t)possibleInterfaceOrientationsForIconManager:(id)a3;
- (unint64_t)searchPresenterOutstandingAnimationCount;
- (unint64_t)supportedMultitaskingShortcutActionsForBundleIdentifier:(id)a3;
- (void)_addSmartStackToTodayList:(id)a3 completionHandler:(id)a4;
- (void)_backupRestoringDidChange:(id)a3;
- (void)_beginDisablingAllOrientationChangesForReason:(id)a3;
- (void)_bookmarkDidUninstall:(id)a3;
- (void)_colorDropperDismissed:(id)a3;
- (void)_colorDropperWillPresent:(id)a3;
- (void)_configureDeweyEachAppHasItsOwnCategory:(unint64_t)a3;
- (void)_configureDeweyOneCategoryWithAllApps;
- (void)_configureEditingGestureRecognizers;
- (void)_configureFloatingDockController:(id)a3 forWindowScene:(id)a4;
- (void)_configureLibraryWithCategoryLimit:(int64_t)a3;
- (void)_controlCenterWillDismiss:(id)a3;
- (void)_controlCenterWillPresent:(id)a3;
- (void)_coverSheetDidPresent:(id)a3;
- (void)_coverSheetWillPresent:(id)a3;
- (void)_dismissPageManagementIfPresented:(id)a3;
- (void)_endDisablingAllOrientationChangesForReason:(id)a3;
- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4;
- (void)_enumerateTodayViewControllers:(id)a3;
- (void)_failCurrentTestWithMessage:(id)a3;
- (void)_forceTouchControllerWillPresent:(id)a3;
- (void)_handleEditingGesture:(id)a3;
- (void)_handleSearchAffordanceTap;
- (void)_iconForceTouchControllerDidDismiss:(id)a3;
- (void)_iconForceTouchControllerWillPresent:(id)a3;
- (void)_iconModel:(id)a3 wantsToRevealAnyApplicationFromIdentifiers:(id)a4;
- (void)_iconModelInstalledAppsDidChange:(id)a3;
- (void)_installedAppsDidChange:(id)a3;
- (void)_launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5;
- (void)_launchWidgetIcon:(id)a3 fromLocation:(id)a4 withContext:(id)a5;
- (void)_lockScreenUIWillLock:(id)a3;
- (void)_mainSwitcherCreated:(id)a3;
- (void)_makeTodayViewControllers;
- (void)_mutateIconListsForInstalledAppsDidChangeWithController:(id)a3 added:(id)a4 modified:(id)a5 removed:(id)a6;
- (void)_obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:(id)a3;
- (void)_policyAggregatorCapabilitiesDidChange:(id)a3;
- (void)_ppt_popHomeScreenState;
- (void)_prepareDefaultTodayLayoutIfNecessary;
- (void)_presentPageManagement:(id)a3;
- (void)_rebuildTodayViewControllers;
- (void)_reduceMotionStatusDidChange:(id)a3;
- (void)_registerAnalytics;
- (void)_rootFolderDidChange;
- (void)_runAppIconForceTouchTest:(id)a3 withOptions:(id)a4;
- (void)_runFolderCloseTest;
- (void)_runFolderOpenTest;
- (void)_runFolderTestWithName:(id)a3 actions:(id)a4;
- (void)_runScrollFolderTest:(int64_t)a3;
- (void)_runTest:(id)a3 afterMovingIconsIntoFolder:(id)a4 withFolderOpen:(BOOL)a5;
- (void)_setFolderDisplayLayoutElementActive:(BOOL)a3;
- (void)_setIgnoreMutatingIconListsOnApplicationInstall:(BOOL)a3;
- (void)_setWidgetEditingDisplayLayoutElementActive:(BOOL)a3;
- (void)_setupOverlayLibraryViewController;
- (void)_setupWidgetIntroductionIfNecessary;
- (void)_showInfoAlertIfNeeded:(BOOL)a3;
- (void)_showsBadgesInAppLibraryDidChange;
- (void)_startSpotlightInteractiveGestureTransactionForGesture:(id)a3;
- (void)_styleEditorDidDismiss:(id)a3;
- (void)_styleEditorWillPresent:(id)a3;
- (void)_teardownDeweyTestConfigurations;
- (void)_tryToPrepareDynamicDefaultTodayLayout;
- (void)_unlockAnimationDidFinish:(id)a3;
- (void)_updateDefaultFirstPageWidgetDescriptors:(id)a3 withSizeClass:(id)a4 andGridCellInfoOptions:(unint64_t)a5;
- (void)_updateEnabledBadgesSetWithSections:(id)a3;
- (void)_updateFocusModeManagerWithDoNotDisturbState:(id)a3;
- (void)_updateIconModelStore;
- (void)_updateUninstallingSystemAppsRestricted;
- (void)_updateVisibleIconsAfterOcclusionChange;
- (void)activateTodayViewWithCompletion:(id)a3;
- (void)addFloatingDockControllerObserver:(id)a3;
- (void)addIconModelControllerObserver:(id)a3;
- (void)addIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4;
- (void)addIconStyleObserver:(id)a3;
- (void)addIconToHomeScreen:(id)a3;
- (void)addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction;
- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)applicationRestrictionController:(id)a3 didUpdateVisibleTags:(id)a4 hiddenTags:(id)a5;
- (void)applicationRestrictionControllerDidPostAppVisibilityUpdate:(id)a3;
- (void)applicationRestrictionControllerWillPostAppVisibilityUpdate:(id)a3;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)dealloc;
- (void)deleteAllWebClips;
- (void)dismissAppIconForceTouchControllers:(id)a3;
- (void)dismissHomeScreenOverlayControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissHomeScreenOverlayUsingTransitionCoordinator:(id)a3;
- (void)dismissHomeScreenOverlays;
- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3;
- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5;
- (void)dismissLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissOverlaysForIconManager:(id)a3;
- (void)dismissSearchView;
- (void)dismissTodayOverlay;
- (void)dismissTodayOverlayAnimated:(BOOL)a3;
- (void)dismissTodayOverlayAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissTodayOverlayForIconManager:(id)a3;
- (void)dismissTodayOverlaySpotlightAnimated:(BOOL)a3;
- (void)displayFeatureIntroductionItem:(id)a3 atLocation:(unint64_t)a4;
- (void)displayFeatureIntroductionsAtLocation:(unint64_t)a3;
- (void)earlyTerminateAnyContextMenuAnimations;
- (void)enumerateTintableViewControllersUsingBlock:(id)a3;
- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5;
- (void)folderIconStateDidDirty:(id)a3;
- (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4;
- (void)handleHomeButtonTap;
- (void)handleNavigationCommand:(id)a3 withDirection:(int64_t)a4;
- (void)handleSpotlightDismissalFromViewController:(id)a3;
- (void)handleSpotlightPresentationFromViewController:(id)a3;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)homeScreenOverlayController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4;
- (void)homeScreenOverlayWantsToEndEditing:(id)a3;
- (void)homeScreenOverlayWantsWidgetEditingViewControllerPresented:(id)a3;
- (void)iconManager:(id)a3 dataSource:(id)a4 ofIcon:(id)a5 didUpdateConfigurationData:(id)a6;
- (void)iconManager:(id)a3 didAddItemsToIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5;
- (void)iconManager:(id)a3 didChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6;
- (void)iconManager:(id)a3 didCloseFolder:(id)a4;
- (void)iconManager:(id)a3 didCreateRootFolderController:(id)a4;
- (void)iconManager:(id)a3 didCreateRootViewController:(id)a4;
- (void)iconManager:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5;
- (void)iconManager:(id)a3 didEndIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5;
- (void)iconManager:(id)a3 didOpenFolder:(id)a4;
- (void)iconManager:(id)a3 didReceiveTapOnLaunchDisabledIconView:(id)a4;
- (void)iconManager:(id)a3 didRemoveConfigurableDataSource:(id)a4 ofIcon:(id)a5;
- (void)iconManager:(id)a3 didSpringLoadIconView:(id)a4;
- (void)iconManager:(id)a3 displayFeatureIntroductionItem:(id)a4 atLocation:(unint64_t)a5;
- (void)iconManager:(id)a3 displayFeatureIntroductionItemIfUnlocked:(id)a4;
- (void)iconManager:(id)a3 folderControllerDidEndScrolling:(id)a4;
- (void)iconManager:(id)a3 folderControllerWillBeginScrolling:(id)a4;
- (void)iconManager:(id)a3 iconDropSessionDidEnter:(id)a4;
- (void)iconManager:(id)a3 iconView:(id)a4 configurationDidEndWithInteraction:(id)a5;
- (void)iconManager:(id)a3 iconView:(id)a4 configurationWillBeginWithInteraction:(id)a5;
- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidEnter:(id)a5;
- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidExit:(id)a5;
- (void)iconManager:(id)a3 iconView:(id)a4 willUseContextMenuStyle:(id)a5;
- (void)iconManager:(id)a3 launchIcon:(id)a4 location:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6;
- (void)iconManager:(id)a3 modalInteractionDidEnd:(id)a4;
- (void)iconManager:(id)a3 modalInteractionWillBegin:(id)a4;
- (void)iconManager:(id)a3 nestingViewController:(id)a4 willPerformOperation:(int64_t)a5 onViewController:(id)a6 withTransitionCoordinator:(id)a7;
- (void)iconManager:(id)a3 possibleUserIconTapBegan:(id)a4;
- (void)iconManager:(id)a3 possibleUserIconTapBeganAfterInformingIcon:(id)a4;
- (void)iconManager:(id)a3 prepareAddSheetViewController:(id)a4;
- (void)iconManager:(id)a3 prepareForPageHidingEducationWithCompletionHandler:(id)a4;
- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnFirstPageWithVelocity:(double)a5 translation:(double)a6;
- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnLastPageWithVelocity:(double)a5 translation:(double)a6;
- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnFirstPageByAmount:(double)a5;
- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnLastPageByAmount:(double)a5;
- (void)iconManager:(id)a3 rootFolderController:(id)a4 willUseTransitionContext:(id)a5 toTransitionToState:(int64_t)a6;
- (void)iconManager:(id)a3 setTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6;
- (void)iconManager:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4;
- (void)iconManager:(id)a3 touchesEndedForIconView:(id)a4;
- (void)iconManager:(id)a3 wantsLaunchForWidgetURL:(id)a4;
- (void)iconManager:(id)a3 wantsUninstallForIcon:(id)a4 location:(id)a5;
- (void)iconManager:(id)a3 willBeginIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5;
- (void)iconManager:(id)a3 willChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6;
- (void)iconManager:(id)a3 willCloseFolder:(id)a4;
- (void)iconManager:(id)a3 willCloseFolderController:(id)a4;
- (void)iconManager:(id)a3 willDestroyRootFolderController:(id)a4;
- (void)iconManager:(id)a3 willDestroyRootViewController:(id)a4;
- (void)iconManager:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5;
- (void)iconManager:(id)a3 willOpenFolder:(id)a4;
- (void)iconManager:(id)a3 willOpenFolderController:(id)a4;
- (void)iconManager:(id)a3 willPrepareIconViewForLaunch:(id)a4;
- (void)iconManager:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6;
- (void)iconManager:(id)a3 willRemoveFakeStatusBar:(id)a4 forFolderController:(id)a5;
- (void)iconManager:(id)a3 willRemoveViewControllerForIdentifier:(id)a4;
- (void)iconManager:(id)a3 willUseIconImageCache:(id)a4;
- (void)iconManager:(id)a3 willUseRootFolderControllerConfiguration:(id)a4;
- (void)iconManagerDidAddOrRemoveWidgetIcon:(id)a3;
- (void)iconManagerDidDismissWidgetEditing:(id)a3;
- (void)iconManagerDidFinishInstallForIcon:(id)a3;
- (void)iconManagerDidNoteIconStateChangedExternally:(id)a3;
- (void)iconManagerDidSaveIconState:(id)a3;
- (void)iconManagerEditingDidChange:(id)a3;
- (void)iconManagerFolderAnimatingDidChange:(id)a3;
- (void)iconManagerIconDraggingDidChange:(id)a3;
- (void)iconManagerListLayoutProviderDidChange:(id)a3;
- (void)iconManagerPreferredProminentPosterColor:(id)a3 handler:(id)a4;
- (void)iconManagerToggleHomeScreenWallpaperDimming:(id)a3;
- (void)iconManagerWantsIconSizeToggled:(id)a3;
- (void)iconManagerWillAnimateWidgetInsertion:(id)a3;
- (void)iconManagerWillPresentWidgetEditing:(id)a3;
- (void)iconStyleCoordinatorDidUpdate:(id)a3;
- (void)informIconStyleObserversOfStyleChange;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4;
- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4;
- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4;
- (void)libraryViewControllerDidDismiss:(id)a3;
- (void)libraryViewControllerRequestsDismissal:(id)a3;
- (void)libraryViewControllerWillPresent:(id)a3;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
- (void)noteTransientOverlayPresented;
- (void)noteViewCovered;
- (void)notifyFloatingDockControllerObserversDidRegister:(id)a3;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)obtainProactiveSecondPageWidgetSuggestion;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4;
- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3;
- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3;
- (void)popToCurrentRootIconListWhenPossible;
- (void)prepareForImminentExit;
- (void)presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5;
- (void)presentLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentTodayOverlayForIconManager:(id)a3;
- (void)proactiveHomeScreenSuggestionProvider:(id)a3 willUseTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6;
- (void)proactiveHomeScreenSuggestionProviderDidUpdatePrediction:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
- (void)removeFloatingDockControllerObserver:(id)a3;
- (void)removeHomeScreenTraitOverridesForViewController:(id)a3;
- (void)removeIconModelControllerObserver:(id)a3;
- (void)removeIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4;
- (void)removeIconStyleObserver:(id)a3;
- (void)removeIconsOccludedAssertion:(id)a3;
- (void)rootFolderController:(id)a3 transitionDidFinish:(id)a4;
- (void)rootFolderController:(id)a3 transitionWillBegin:(id)a4;
- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5;
- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6;
- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)runWidgetDiscoverabilityTest;
- (void)searchBarDidFocus;
- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4;
- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4;
- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4;
- (void)searchPresenterDidDismissSearch:(id)a3;
- (void)searchPresenterDidPresentSearch:(id)a3;
- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4;
- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4;
- (void)setAddWidgetSheetKeyboardFocusAssertion:(id)a3;
- (void)setAmbientListLayoutProvider:(id)a3;
- (void)setAmbientWidgetMetricsProvider:(id)a3;
- (void)setAnalyticsEventsController:(id)a3;
- (void)setCoverSheetTodayViewController:(id)a3;
- (void)setCurrentHomeScreenIconStyleConfiguration:(id)a3;
- (void)setDelayedLaunchRequestTimer:(id)a3;
- (void)setDisplayLayoutTransition:(id)a3;
- (void)setDndModeConfigurationService:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setFloatingDockBehaviorAssertions:(id)a3;
- (void)setFloatingDockControllerObservers:(id)a3;
- (void)setHasRestrictedEnforcedLayout:(BOOL)a3;
- (void)setHiddenAppBundleIdentifiers:(id)a3;
- (void)setHomeScreenOverlayController:(id)a3;
- (void)setIconOcclusionReasons:(unint64_t)a3;
- (void)setInteractivePullToTodaySearchTransition:(id)a3;
- (void)setKeepTodayViewIconImagesStaticAssertion:(id)a3;
- (void)setLargeIconSizeEnabled:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaxPresentationOffset:(double)a3;
- (void)setModel:(id)a3;
- (void)setOverlayLibraryViewController:(id)a3;
- (void)setPopoverDelayTimer:(id)a3;
- (void)setProactiveSuggestionProvider:(id)a3;
- (void)setProactiveUsageObserver:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setScrollAccessoryAuxiliaryView:(id)a3;
- (void)setScrollAccessoryBorrowedForSearchPresentationAssertion:(id)a3;
- (void)setSearchPresentableViewController:(id)a3;
- (void)setSearchPresenter:(id)a3;
- (void)setSearchPresenterDestinationPageState:(int64_t)a3;
- (void)setSearchPresenterOutstandingAnimationCount:(unint64_t)a3;
- (void)setSearchPresenterPageStateTransition:(id)a3;
- (void)setSpotlightViewController:(id)a3;
- (void)setSuspendWallpaperAnimationForOverlayViewAssertion:(id)a3;
- (void)setSuspendWallpaperAnimationForSpotlightAssertion:(id)a3;
- (void)setTemporaryIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5;
- (void)setTipsUsageObserver:(id)a3;
- (void)setTodayViewController:(id)a3;
- (void)setTodayViewDisplayLayoutAssertion:(id)a3;
- (void)setTopOffset:(double)a3;
- (void)setUninstallingSystemAppsRestricted:(BOOL)a3;
- (void)setUserIconStateFileStatus:(int64_t)a3;
- (void)setWallpaperAnimationDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setWidgetAddSheetAffordanceViewController:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)todayViewControllerDidAppear:(id)a3;
- (void)todayViewControllerDidDisappear:(id)a3;
- (void)todayViewControllerWillPresentSpotlight:(id)a3;
- (void)todayViewDidAppear:(id)a3;
- (void)todayViewWantsToEndEditing:(id)a3;
- (void)updateHomeScreenTraitOverridesForTraitOverrides:(id)a3;
- (void)updateHomeScreenTraitOverridesForViewController:(id)a3;
- (void)updateHomeScreenTraitOverridesForWindowScene:(id)a3;
- (void)updateNumberOfRowsWithDuration:(double)a3;
- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6;
- (void)updateRootFolderWithCurrentDoNotDisturbState;
- (void)updateStyleConfiguration:(id)a3 forIconManager:(id)a4;
- (void)windowSceneDidDisconnect:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBIconController

- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4
{
  return [(SBIconController *)self allowsBadgingForIcon:a4];
}

+ (SBIconController)sharedInstance
{
  v2 = +[SBUIController sharedInstance];
  v3 = [v2 iconController];

  return (SBIconController *)v3;
}

- (SBHomeScreenViewController)homeScreenViewController
{
  return self->_homeScreenViewController;
}

- (BOOL)isTodayOverlaySpotlightVisible
{
  uint64_t v3 = objc_opt_class();
  v4 = [(SBIconController *)self todayViewController];
  v5 = SBSafeCast(v3, v4);

  LOBYTE(v4) = [v5 isSpotlightVisible];
  return (char)v4;
}

- (SBTodayViewController)todayViewController
{
  return self->_todayViewController;
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

void __57__SBIconController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  [*(id *)(a1 + 32) locationInView:v9];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [v9 bounds];
  v11.x = v6;
  v11.y = v8;
  if (CGRectContainsPoint(v12, v11) && SBIconViewQueryingDisplayingIconView())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (SBApplicationHosting)leftOfHomeAppViewController
{
  return self->_leftOfHomeAppViewController;
}

- (BOOL)allowsBadgingForIcon:(id)a3
{
  id v4 = a3;
  double v5 = [v4 overrideBadgeNumberOrString];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    double v7 = [v4 applicationBundleID];
    if (!v7)
    {
      if ([v4 isBookmarkIcon])
      {
        CGFloat v8 = [v4 bookmark];
        double v7 = [v8 placeholderBundleIdentifier];
      }
      else
      {
        double v7 = 0;
      }
    }
    BOOL v6 = [(SBIconController *)self _allowsBadgingForApplicationBundleIdentifier:v7];
  }
  return v6;
}

- (BOOL)_allowsBadgingForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SBIconController *)self iconManager];
  BOOL v6 = [v5 focusModeManager];
  double v7 = [v6 activeFocusMode];
  int v8 = [v7 showsOnlyAllowedApplicationBadges];
  int v9 = [v7 hidesOnlyDeniedApplicationBadges];
  if (v4)
  {
    int v10 = v9;
    int v11 = [(NSMutableSet *)self->_displayIDsWithBadgingEnabled containsObject:v4];
    if (v8)
    {
      CGRect v12 = [v7 allowedApplicationBundleIdentifiers];
      v11 &= [v12 containsObject:v4];
LABEL_7:

      goto LABEL_8;
    }
    if (v10)
    {
      CGRect v12 = [v7 deniedApplicationBundleIdentifiers];
      v11 &= ~[v12 containsObject:v4];
      goto LABEL_7;
    }
  }
  else
  {
    LOBYTE(v11) = v8 ^ 1;
  }
LABEL_8:

  return v11;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

+ (SBIconController)sharedInstanceIfExists
{
  v2 = +[SBUIController sharedInstanceIfExists];
  uint64_t v3 = [v2 iconController];

  return (SBIconController *)v3;
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4
{
  id v4 = objc_msgSend(a4, "icon", a3);
  if ([v4 isWidgetIcon])
  {
    if (__sb__runningInSpringBoard())
    {
      BOOL v5 = SBFEffectiveDeviceClass() != 2;
    }
    else
    {
      BOOL v6 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v5 = [v6 userInterfaceIdiom] != 1;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_libraryViewControllers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(SBIconController *)self isModalAppLibrarySupported])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [(id)SBApp windowSceneManager];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v5 = objc_msgSend(v4, "connectedWindowScenes", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
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
          int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) modalLibraryController];
          int v11 = [v10 libraryViewController];

          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else if (self->_overlayLibraryViewController)
  {
    overlayLibraryViewController = self->_overlayLibraryViewController;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&overlayLibraryViewController count:1];
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (BOOL)isModalAppLibrarySupported
{
  BOOL v2 = [(SBIconController *)self isAppLibrarySupported];
  if (v2)
  {
    LOBYTE(v2) = +[SBFloatingDockController isFloatingDockSupported];
  }
  return v2;
}

- (BOOL)isAppLibrarySupported
{
  return 1;
}

- (id)libraryViewControllerForWindowScene:(id)a3
{
  id v4 = a3;
  if ([(SBIconController *)self isModalAppLibrarySupported])
  {
    BOOL v5 = [v4 modalLibraryController];
    uint64_t v6 = [v5 libraryViewController];
  }
  else
  {
    uint64_t v6 = [(SBIconController *)self overlayLibraryViewController];
  }

  return v6;
}

- (SBLibraryViewController)overlayLibraryViewController
{
  return self->_overlayLibraryViewController;
}

- (id)recycledViewsContainerProviderForIconManager:(id)a3
{
  id v3 = [(SBIconController *)self userInterfaceController];
  id v4 = [v3 window];

  return v4;
}

- (id)userInterfaceController
{
  override_userInterfaceController = self->_override_userInterfaceController;
  if (override_userInterfaceController)
  {
    id v3 = override_userInterfaceController;
  }
  else
  {
    id v3 = +[SBUIController sharedInstance];
  }
  return v3;
}

- (SBSHomeScreenIconStyleConfiguration)currentHomeScreenIconStyleConfiguration
{
  BOOL v2 = [(SBIconController *)self currentIconImageStyleConfiguration];
  id v3 = objc_msgSend(v2, "sb_homeScreenIconStyleConfiguration");

  return (SBSHomeScreenIconStyleConfiguration *)v3;
}

- (SBHIconImageStyleConfiguration)currentIconImageStyleConfiguration
{
  BOOL v2 = [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator currentStyleConfiguration];
  id v3 = [MEMORY[0x1E4FA62A8] styleConfigurationWithHomeScreenConfiguration:v2];

  return (SBHIconImageStyleConfiguration *)v3;
}

- (SBHIconImageCache)appSwitcherHeaderIconImageCache
{
  appSwitcherHeaderIconImageCache = self->_appSwitcherHeaderIconImageCache;
  if (!appSwitcherHeaderIconImageCache)
  {
    id v4 = +[SBAppSwitcherModel appSwitcherHeaderIconImageDescriptorName];
    if ([v4 isEqualToString:*MEMORY[0x1E4F6F2B8]])
    {
      BOOL v5 = [(SBIconController *)self tableUIIconImageCache];
      uint64_t v6 = self->_appSwitcherHeaderIconImageCache;
      self->_appSwitcherHeaderIconImageCache = v5;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:v4];
      [v6 size];
      double v8 = v7;
      double v10 = v9;
      [v6 scale];
      double v12 = v11;
      [v6 continuousCornerRadius];
      long long v14 = (SBHIconImageCache *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"appSwitcherHeaderIcon", v8, v10, v12, v13);
      long long v15 = self->_appSwitcherHeaderIconImageCache;
      self->_appSwitcherHeaderIconImageCache = v14;
    }
    appSwitcherHeaderIconImageCache = self->_appSwitcherHeaderIconImageCache;
  }
  return appSwitcherHeaderIconImageCache;
}

- (void)rootFolderController:(id)a3 transitionWillBegin:(id)a4
{
  BOOL v5 = [(SBIconController *)self displayLayoutTransition];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F62438] sharedInstance];
    id v7 = [v6 transitionAssertionWithReason:0];

    [(SBIconController *)self setDisplayLayoutTransition:v7];
    BOOL v5 = v7;
  }
}

- (void)setDisplayLayoutTransition:(id)a3
{
}

- (void)rootFolderController:(id)a3 transitionDidFinish:(id)a4
{
  BOOL v5 = [(SBIconController *)self displayLayoutTransition];
  [v5 invalidate];

  [(SBIconController *)self setDisplayLayoutTransition:0];
}

- (BSInvalidatable)displayLayoutTransition
{
  return self->_displayLayoutTransition;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5 = a4;
  id v19 = [v5 fromLayoutState];
  uint64_t v6 = [v19 unlockedEnvironmentMode];
  id v7 = [v5 toLayoutState];

  uint64_t v8 = [v7 unlockedEnvironmentMode];
  unint64_t v9 = v8;
  if (v6 == 2 || v8 != 2)
  {
    if (v6 != 3 && v8 == 3) {
      [(SBIconController *)self addIconOcclusionReason:2 updateVisibleIcons:1];
    }
    if (v6 == 2 && v9 != 2)
    {
      uint64_t v10 = 8;
      goto LABEL_13;
    }
  }
  else
  {
    [(SBIconController *)self addIconOcclusionReason:8 updateVisibleIcons:1];
  }
  if (v6 == 3 && v9 != 3)
  {
    uint64_t v10 = 2;
LABEL_13:
    [(SBIconController *)self removeIconOcclusionReason:v10 updateVisibleIcons:1];
  }
  double v11 = [(SBIconController *)self todayViewController];
  double v12 = [(SBIconController *)self homeScreenOverlayController];
  double v13 = [(SBIconController *)self keepTodayViewIconImagesStaticAssertion];
  long long v14 = v13;
  if (v9 == 1 || v13)
  {
    if (v9 == 1 && v13)
    {
      [v13 invalidate];
      [(SBIconController *)self setKeepTodayViewIconImagesStaticAssertion:0];
    }
  }
  else if ([v12 isPresented])
  {
    long long v15 = [v12 activeSidebarViewController];

    if (v15 == v11)
    {
      long long v16 = SBStringForUnlockedEnvironmentMode(v9);
      v17 = [@"Layout State: " stringByAppendingString:v16];

      v18 = [v11 keepIconImageViewControllersStaticForReason:v17];
      [(SBIconController *)self setKeepTodayViewIconImagesStaticAssertion:v18];
    }
  }
}

- (BSInvalidatable)keepTodayViewIconImagesStaticAssertion
{
  return self->_keepTodayViewIconImagesStaticAssertion;
}

- (void)_updateVisibleIconsAfterOcclusionChange
{
  unint64_t v4 = [(SBIconController *)self iconOcclusionReasons];
  BOOL v5 = (v4 & 0x12) != 0;
  if ((v4 & 0x12) != 0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v4 != 0;
  }
  id v9 = [(SBIconController *)self iconManager];
  [v9 setContentVisibility:v6];
  id v7 = [(SBIconController *)self homeScreenOverlayController];
  [v7 setContentVisibility:v6];
  uint64_t v8 = NSStringFromSelector(a2);
  [(SBIconController *)self setWallpaperAnimationDisabled:v5 forReason:v8];
}

- (SBHomeScreenOverlayController)homeScreenOverlayController
{
  return self->_homeScreenOverlayController;
}

- (unint64_t)iconOcclusionReasons
{
  return self->_iconOcclusionReasons;
}

- (void)setWallpaperAnimationDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  uint64_t v6 = [(SBIconController *)self suspendWallpaperAnimationForOverlayViewAssertion];
  [v6 invalidate];

  if (v4)
  {
    id v7 = +[SBWallpaperController sharedInstance];
    uint64_t v8 = [v7 suspendWallpaperAnimationForReason:v9];
    [(SBIconController *)self setSuspendWallpaperAnimationForOverlayViewAssertion:v8];
  }
}

- (BSInvalidatable)suspendWallpaperAnimationForOverlayViewAssertion
{
  return self->_suspendWallpaperAnimationForOverlayViewAssertion;
}

- (void)setSuspendWallpaperAnimationForOverlayViewAssertion:(id)a3
{
}

- (id)iconManager:(id)a3 launchActionsForIconView:(id)a4
{
  return [(SBIconController *)self launchActionsForIconView:a4];
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIconLocation:(id)a4
{
  id v4 = a4;
  BOOL v5 = +[SBDefaults localDefaults];
  uint64_t v6 = [v5 homeScreenDefaults];
  char v7 = [v6 showsBadgesInAppLibrary];

  if ((v7 & 1) != 0 || !SBIconLocationGroupContainsLocation()) {
    char v8 = 1;
  }
  else {
    char v8 = [v4 isEqualToString:*MEMORY[0x1E4FA6660]];
  }

  return v8;
}

- (void)addIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(SBIconController *)self iconOcclusionReasons];
  if ((a3 & ~v7) != 0)
  {
    [(SBIconController *)self setIconOcclusionReasons:v7 | a3];
    if (v4)
    {
      [(SBIconController *)self _updateVisibleIconsAfterOcclusionChange];
    }
  }
}

uint64_t __61__SBIconController_publisher_didUpdateLayout_withTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconOcclusionReasons:", objc_msgSend(*(id *)(a1 + 32), "iconOcclusionReasons") & 0xFFFFFFFFFFFFFFCFLL | *(void *)(a1 + 40));
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibleIconsAfterOcclusionChange];
}

- (void)setIconOcclusionReasons:(unint64_t)a3
{
  self->_iconOcclusionReasons = a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  char v8 = +[SBControlCenterController sharedInstance];
  char v9 = [v8 isPresented];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6 {
         || self->_tapToEndEditingGestureRecognizer == v6)
  }
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 1;
    double v11 = [(SBIconController *)self iconManager];
    int v12 = [v11 isEditing];
    int v13 = [v11 isFolderPageManagementUIVisible];
    int v14 = [v11 isShowingIconContextMenu];
    if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6)
    {
      *((unsigned char *)v44 + 24) = (v12 | v13 | v14) ^ 1;
    }
    else if (self->_tapToEndEditingGestureRecognizer == v6)
    {
      if ((v12 ^ 1 | v13 | v14))
      {
        *((unsigned char *)v44 + 24) = 0;
      }
      else
      {
        long long v15 = [(SBIconController *)self iconDragManager];
        char v16 = [v15 isTrackingUserActiveIconDrags];
        *((unsigned char *)v44 + 24) = v16 ^ 1;
      }
    }
    if (*((unsigned char *)v44 + 24))
    {
      if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer != v6) {
        goto LABEL_17;
      }
      uint64_t v17 = objc_opt_class();
      v18 = [(SBIconController *)self _rootFolderController];
      id v19 = [v18 contentView];
      v20 = SBSafeCast(v17, v19);

      if (v20)
      {
        [v20 enterEditingTouchRect];
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        [v7 locationInView:v20];
        v47.x = v29;
        v47.y = v30;
        v48.origin.x = v22;
        v48.origin.y = v24;
        v48.size.width = v26;
        v48.size.height = v28;
        *((unsigned char *)v44 + 24) = CGRectContainsPoint(v48, v47);
      }

      if (*((unsigned char *)v44 + 24))
      {
LABEL_17:
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __57__SBIconController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v39[3] = &unk_1E6AFB7C0;
        id v31 = v7;
        id v40 = v31;
        id v32 = v11;
        id v41 = v32;
        v42 = &v43;
        [v32 enumerateDisplayedIconViewsUsingBlock:v39];

        if (*((unsigned char *)v44 + 24) && [v32 isOverlayTodayViewVisible])
        {
          v33 = [(SBIconController *)self todayViewController];
          BOOL v34 = [(SBIconController *)self _shouldTodayViewController:v33 receiveTouch:v31];
          *((unsigned char *)v44 + 24) = v34;
        }
      }
    }
    if (*((unsigned char *)v44 + 24) && [v11 isMainDisplayLibraryViewVisible])
    {
      v35 = [(SBIconController *)self mainDisplayWindowScene];
      v36 = [(SBIconController *)self libraryViewControllerForWindowScene:v35];

      char v37 = [v36 isPresentingSearch];
      *((unsigned char *)v44 + 24) = v37 ^ 1;
    }
    BOOL v10 = *((unsigned char *)v44 + 24) != 0;

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)areAnyIconViewContextMenusShowing
{
  BOOL v2 = [MEMORY[0x1E4FA62D0] sharedInstance];
  char v3 = [v2 areAnyIconViewContextMenusShowing];

  return v3;
}

- (SBRootFolderController)_rootFolderController
{
  BOOL v2 = [(SBIconController *)self iconManager];
  char v3 = [v2 rootFolderController];

  return (SBRootFolderController *)v3;
}

- (id)iconManager:(id)a3 wantsToHideStatusBarForFolderController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  char v8 = [(SBIconController *)self mainDisplayWindowScene];
  char v9 = [v8 statusBarManager];
  BOOL v10 = [v9 assertionManager];

  double v11 = objc_msgSend(NSString, "stringWithFormat:", @"SBFolderController - %p", v7);

  int v12 = (void *)[v10 newSettingsAssertionWithStatusBarHidden:1 atLevel:1 reason:v11];
  if (v5)
  {
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [v12 acquireWithAnimationParameters:v13];
  }
  else
  {
    [v12 acquire];
  }

  return v12;
}

void __66__SBIconController__launchFromIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) continuityInfo];
  if (v2)
  {
    v1 = +[SBAppSuggestionManager sharedInstance];
    [v1 noteActivatingForAppSuggestion:v2 fromSource:2];
  }
}

- (void)iconManager:(id)a3 willPrepareIconViewForLaunch:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(SBIconController *)self delayedLaunchRequestTimer];
  [v6 invalidate];

  [(SBIconController *)self setDelayedLaunchRequestTimer:0];
  id v7 = [v5 icon];
  char v8 = [v5 location];

  char v9 = [(SBIconController *)self rootFolder];
  BOOL v10 = [v9 indexPathForIcon:v7];

  uint64_t v11 = *MEMORY[0x1E4FA7558];
  v20[0] = v8;
  uint64_t v12 = *MEMORY[0x1E4FA7550];
  v19[0] = v11;
  v19[1] = v12;
  int v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isFolderIcon"));
  v20[1] = v13;
  v19[2] = *MEMORY[0x1E4FA7548];
  int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "indexAtPosition:", objc_msgSend(v10, "length") - 1));
  v20[2] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  char v16 = (void *)MEMORY[0x1E4FA5E78];
  id v17 = v15;
  v18 = [v16 sharedInstance];
  [v18 emitEvent:9 withPayload:v17];
}

- (SBIconModel)model
{
  return self->_iconModel;
}

- (SBRootFolder)rootFolder
{
  return [(SBHIconModel *)self->_iconModel rootFolder];
}

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBIconController *)self delayedLaunchRequestTimer];
  [v11 invalidate];

  [(SBIconController *)self setDelayedLaunchRequestTimer:0];
  uint64_t v12 = [v9 icon];
  if ([v12 isApplicationIcon]
    && ([v12 application],
        int v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isAnyTerminationAssertionInEffect],
        v13,
        v14))
  {
    long long v15 = SBLogIcon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = [v12 applicationBundleID];
      *(_DWORD *)buf = 138412290;
      CGFloat v29 = v16;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Delaying launch of %@ because termination assertion is held", buf, 0xCu);
    }
    id v17 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    CGFloat v22 = __80__SBIconController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke;
    double v23 = &unk_1E6AFB9C8;
    CGFloat v24 = self;
    id v25 = v9;
    id v26 = v10;
    int64_t v27 = a6;
    v18 = [v17 timerWithTimeInterval:0 repeats:&v20 block:1.0];
    id v19 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v20, v21, v22, v23, v24);
    [v19 addTimer:v18 forMode:*MEMORY[0x1E4F1C4B0]];

    [(SBIconController *)self setDelayedLaunchRequestTimer:v18];
  }
  else
  {
    [(SBIconController *)self _launchFromIconView:v9 withActions:v10 modifierFlags:a6];
  }
}

- (void)setDelayedLaunchRequestTimer:(id)a3
{
}

- (NSTimer)delayedLaunchRequestTimer
{
  return self->_delayedLaunchRequestTimer;
}

- (void)_launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBIconController *)self delayedLaunchRequestTimer];
  [v10 invalidate];

  [(SBIconController *)self setDelayedLaunchRequestTimer:0];
  uint64_t v11 = [(SBIconController *)self iconManager];
  uint64_t v12 = [v8 icon];
  int v13 = [v11 reasonToDisallowTapOnIconView:v8];
  if (v13)
  {
    [v11 clearHighlightedIcon];
    int v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v8;
      __int16 v39 = 2114;
      id v40 = v13;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring launch from icon view: %@, reason: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    int64_t v32 = a5;
    id v34 = v9;
    long long v15 = SBLogIcon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Initiating launch from icon view: %@", buf, 0xCu);
    }

    int v14 = [v8 _sbWindowScene];
    char v16 = [v14 switcherController];
    id v17 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v17 cancelEventsWithName:@"SBUIApplicationIconLaunchEventLabel"];

    v18 = [MEMORY[0x1E4F624E0] sharedInstance];
    id v19 = [v16 toggleSwitcherEventName];
    [v18 cancelEventsWithName:v19];

    uint64_t v20 = [MEMORY[0x1E4F624E0] sharedInstance];
    uint64_t v21 = [v16 activateSwitcherEventName];
    [v20 cancelEventsWithName:v21];

    CGFloat v22 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v22 emitEvent:10];

    double v23 = [(SBIconController *)self launchActivationSettingsForIconView:v8];
    v33 = v16;
    uint64_t v24 = [v16 windowManagementStyle];
    if ((v32 & 0x20000) != 0 && v24 == 2) {
      [v23 setFlag:1 forActivationSetting:73];
    }
    id v25 = objc_msgSend(v8, "location", v32);
    id v26 = objc_alloc_init(SBIconLaunchContext);
    [(SBIconLaunchContext *)v26 setActivationSettings:v23];
    [(SBIconLaunchContext *)v26 setActions:v34];
    [(SBIconLaunchContext *)v26 setIconView:v8];
    if ([v12 isWidgetIcon])
    {
      [(SBIconController *)self _launchWidgetIcon:v12 fromLocation:v25 withContext:v26];
    }
    else
    {
      int v27 = [v12 performLaunchFromLocation:v25 context:v26];
      CGFloat v28 = SBLogIcon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v27;
        _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Icon handled launch: %{BOOL}u", buf, 8u);
      }
    }
    CGFloat v29 = (void *)MEMORY[0x1E4F624D8];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __66__SBIconController__launchFromIconView_withActions_modifierFlags___block_invoke;
    v35[3] = &unk_1E6AF4AC0;
    id v36 = v8;
    uint64_t v30 = [v29 eventWithName:@"noteActivatingAppSuggestion" handler:v35];
    id v31 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v31 executeOrAppendEvent:v30];

    id v9 = v34;
  }
}

- (id)launchActivationSettingsForIconView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SBActivationSettings);
  uint64_t v6 = [(SBIconController *)self launchURLForIconView:v4];
  if (v6) {
    [(SBActivationSettings *)v5 setObject:v6 forActivationSetting:5];
  }
  id v7 = [v4 _sbWindowScene];
  id v8 = [v4 icon];
  id v9 = [v8 application];
  id v10 = v9;
  if (v9
    && [v9 restrictedToTheEmbeddedDisplayInChamois]
    && [v7 isExtendedDisplayWindowScene])
  {
    uint64_t v11 = [(id)SBApp windowSceneManager];
    uint64_t v12 = [v11 embeddedDisplayWindowScene];

    id v7 = (void *)v12;
  }
  [(SBActivationSettings *)v5 setObject:v7 forActivationSetting:69];

  return v5;
}

- (id)launchURLForIconView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 continuityInfo];
  id v5 = [v4 launchURL];
  int v6 = [v4 launchURLRequiresInboxCopy];
  id v7 = [v3 icon];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v7 application];
    id v10 = [v9 info];
    uint64_t v11 = [v10 documentInboxURL];

    uint64_t v12 = [v4 makeInboxCopyOfLaunchURLToInboxURL:v11];

    id v5 = (void *)v11;
    goto LABEL_3;
  }
  int v13 = [v7 isBookmarkIcon];

  if (v13)
  {
    id v8 = [v3 icon];
    int v14 = [v8 applicationToLaunch];
    id v9 = v14;
    if (!v14) {
      goto LABEL_4;
    }
    long long v15 = [v14 info];
    if ([v15 supportsYttrium])
    {
      char v16 = [v8 webClip];
      char v17 = [v16 alternativeFullScreen];

      if (v17) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    uint64_t v12 = [v8 launchURL];
LABEL_3:

    id v5 = (void *)v12;
LABEL_4:
  }
  return v5;
}

- (id)launchActionsForIconView:(id)a3
{
  id v3 = [a3 continuityInfo];
  id v4 = [v3 uniqueIdentifier];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42700]);
    int v6 = [v4 UUIDString];
    id v7 = [v3 activityType];
    id v8 = (void *)[v5 initWithIdentifier:v6 activityTypeIdentifier:v7 appSuggestion:v3];

    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)iconManager:(id)a3 folderControllerWillBeginScrolling:(id)a4
{
  id v4 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
}

- (BOOL)iconManager:(id)a3 folderController:(id)a4 canChangeCurrentPageIndexToIndex:(int64_t)a5
{
  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken != -1) {
    dispatch_once(&iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken, &__block_literal_global_456);
  }
  return iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage == 0;
}

- (void)iconManager:(id)a3 touchesEndedForIconView:(id)a4
{
}

- (void)iconManager:(id)a3 possibleUserIconTapBeganAfterInformingIcon:(id)a4
{
}

- (void)iconManager:(id)a3 possibleUserIconTapBegan:(id)a4
{
}

- (BOOL)isIconVisibleForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconController *)self model];
  int v6 = [v5 applicationIconForBundleIdentifier:v4];

  LOBYTE(v4) = [v5 isIconVisible:v6];
  return (char)v4;
}

- (SBIconDragManager)iconDragManager
{
  id v2 = [(SBIconController *)self iconManager];
  id v3 = [v2 iconDragManager];

  return (SBIconDragManager *)v3;
}

- (BOOL)isTodayViewRotating:(id)a3
{
  return self->_rotating;
}

- (void)iconManager:(id)a3 willOpenFolderController:(id)a4
{
  id v10 = a4;
  if ([v10 suspendsWallpaperAnimationWhileOpen])
  {
    id v4 = [v10 extraAssertions];
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v10 setExtraAssertions:v4];
    }
    id v5 = [v4 valueForKey:@"SuspendWallpaperAnimationAssertion"];
    int v6 = v5;
    if (v5) {
      [v5 invalidate];
    }
    id v7 = +[SBWallpaperController sharedInstance];
    id v8 = objc_msgSend(@"SBIconControllerOpenFolderWallpaperAnimationSuspensionReason", "stringByAppendingFormat:", @"-%p", v10);
    id v9 = [v7 suspendWallpaperAnimationForReason:v8];

    [v4 setValue:v9 forKey:@"SuspendWallpaperAnimationAssertion"];
  }
}

- (id)iconManager:(id)a3 floatingDockViewControllerForView:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  id v5 = [v4 floatingDockController];
  int v6 = [v5 floatingDockViewController];

  return v6;
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = objc_msgSend(a4, "elements", a3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x1E4F625B0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 isSpringBoardElement])
        {
          int v13 = [v12 identifier];
          int v14 = [v13 isEqualToString:v10];

          if (v14)
          {
            v8 |= 0x10uLL;
          }
          else
          {
            long long v15 = [v12 identifier];
            int v16 = [v15 isEqualToString:@"com.apple.InCallService"];

            if (v16) {
              v8 |= 0x20uLL;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SBIconController_publisher_didUpdateLayout_withTransition___block_invoke;
  block[3] = &unk_1E6AF4A70;
  block[4] = self;
  block[5] = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)iconManager:(id)a3 statusBarStyleRequestForFolderController:(id)a4
{
  id v4 = [(SBIconController *)self mainDisplayWindowScene];
  id v5 = [v4 statusBarManager];
  uint64_t v6 = [v5 assertionManager];
  uint64_t v7 = [v6 effectiveStatusBarStyleRequestForLevel:0];

  return v7;
}

- (id)iconManager:(id)a3 fakeStatusBarForFolderController:(id)a4
{
  id v4 = [(SBIconController *)self mainDisplayWindowScene];
  id v5 = [v4 statusBarManager];
  uint64_t v6 = [v5 reusePool];
  uint64_t v7 = [v6 getReusableStatusBarWithReason:@"SBFolderController - Blurred Status Bar"];

  return v7;
}

- (void)iconManager:(id)a3 nestingViewController:(id)a4 willPerformOperation:(int64_t)a5 onViewController:(id)a6 withTransitionCoordinator:(id)a7
{
  id v10 = a4;
  uint64_t v11 = NSString;
  id v12 = a7;
  int v13 = [v11 stringWithFormat:@"SBTransitioningToOrFromFolder-<%@ %p>", objc_opt_class(), v10];
  int v14 = [(SBIconController *)self userInterfaceController];
  [v14 setAllowIconRotation:0 forReason:v13];

  [(SBIconController *)self _beginDisablingAllOrientationChangesForReason:v13];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10;
  v25[3] = &unk_1E6AFBA60;
  v25[4] = self;
  id v15 = v13;
  id v26 = v15;
  [v12 animateAlongsideTransition:&__block_literal_global_744 completion:v25];

  if (!+[SBFloatingDockController isFloatingDockSupported])
  {
    if (a5 != 1
      && ([(SBIconController *)self _rootFolderController],
          id v16 = (id)objc_claimAutoreleasedReturnValue(),
          v16,
          v16 == v10))
    {
      long long v21 = [(SBIconController *)self _rootFolderController];
      [v21 dockHeight];
      double v19 = v22;

      double v20 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
    }
    else
    {
      double v18 = *MEMORY[0x1E4F437F8];
      double v17 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v19 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v20 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    }
    double v23 = [(SBIconController *)self mainDisplayWindowScene];
    uint64_t v24 = [v23 pictureInPictureManager];
    objc_msgSend(v24, "applyPictureInPictureInsets:forSource:", 1, v18, v17, v19, v20);
  }
}

- (UIEdgeInsets)iconManager:(id)a3 statusBarEdgeInsetsForFolderController:(id)a4
{
  id v4 = [(SBIconController *)self mainDisplayWindowScene];
  id v5 = [v4 statusBarManager];
  uint64_t v6 = [v5 layoutManager];
  [v6 statusBarEdgeInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)iconManager:(id)a3 folderControllerDidEndScrolling:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(SBIconController *)self _rootFolderController];
  char v7 = [v5 hasOpenFolder];

  if ((v7 & 1) == 0 && ([v6 isDockExternal] & 1) == 0)
  {
    double v8 = [(SBIconController *)self mainDisplayWindowScene];
    double v9 = [v8 pictureInPictureManager];

    [v6 dockHeight];
    objc_msgSend(v9, "applyPictureInPictureInsets:forSource:", 1, 0.0, 0.0, v10, 0.0);
  }
  double v11 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)double v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v12, 2u);
  }

  kdebug_trace();
}

- (double)minimumHomeScreenScale
{
  id v2 = [(SBIconController *)self mainDisplayWindowScene];
  id v3 = [v2 switcherController];

  if (v3)
  {
    [v3 minimumHomeScreenScale];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (SBWindowScene)mainDisplayWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainDisplayWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)_beginDisablingAllOrientationChangesForReason:(id)a3
{
  id v6 = a3;
  double v4 = -[NSMapTable objectForKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "objectForKey:");
  if (!v4)
  {
    double v4 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:v6];
    [(NSMapTable *)self->_deviceOrientationUpdateDeferralAssertionsByReason setObject:v4 forKey:v6];
  }
  double v5 = [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason objectForKey:v6];
  if (!v5)
  {
    double v5 = [[SBDisableActiveInterfaceOrientationChangeAssertion alloc] initWithReason:v6 nudgeOrientationOnInvalidate:0];
    [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason setObject:v5 forKey:v6];
  }
}

- (id)iconManager:(id)a3 backgroundViewForComponentsOfIconView:(id)a4
{
  if ([(SBIconController *)self shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:a4])
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1];
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    if (delayedStyleWallpaperEffectViews)
    {
      [(NSMutableSet *)delayedStyleWallpaperEffectViews addObject:v5];
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = 29;
    }
    [(PBUIWallpaperEffectViewBase *)v5 setStyle:v7];
  }
  return v5;
}

- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5
{
  id v7 = a4;
  LOBYTE(a5) = [(SBIconController *)self shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:a5];
  double v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return (a5 ^ isKindOfClass) & 1;
}

- (BOOL)shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:(id)a3
{
  return 1;
}

- (void)iconManager:(id)a3 willOpenFolder:(id)a4
{
  id v4 = a4;
  double v5 = +[SBReachabilityManager sharedInstance];
  [v5 deactivateReachability];

  id v6 = +[SBReachabilityManager sharedInstance];
  [v6 setReachabilityTemporarilyDisabled:1 forReason:@"Open Folder"];

  int v7 = [v4 isLibraryCategoryFolder];
  double v8 = SBLogTelemetrySignposts();
  BOOL v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      __int16 v13 = 0;
      double v10 = "SB_HOME_DEWEY_POD_OPEN";
      double v11 = (uint8_t *)&v13;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
    }
  }
  else if (v9)
  {
    __int16 v12 = 0;
    double v10 = "SB_HOME_FOLDER_OPEN";
    double v11 = (uint8_t *)&v12;
    goto LABEL_6;
  }

  kdebug_trace();
}

- (void)iconManager:(id)a3 didOpenFolder:(id)a4
{
  id v5 = a4;
  id v6 = +[SBReachabilityManager sharedInstance];
  [v6 setReachabilityTemporarilyDisabled:0 forReason:@"Open Folder"];

  int v7 = [v5 isLibraryCategoryFolder];
  double v8 = SBLogTelemetrySignposts();
  BOOL v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_DEWEY_POD_OPEN", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)__int16 v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_FOLDER_OPEN", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
    }

    kdebug_trace();
    [(SBIconController *)self _setFolderDisplayLayoutElementActive:1];
  }
  double v10 = [(SBIconController *)self homeScreenViewController];
  double v11 = [MEMORY[0x1E4F42A28] focusSystemForEnvironment:v10];
  __int16 v12 = [v11 focusedItem];

  if (v12) {
    [v10 setNeedsFocusUpdate];
  }
}

- (void)_setFolderDisplayLayoutElementActive:(BOOL)a3
{
  folderDisplayLayoutAssertion = self->_folderDisplayLayoutAssertion;
  if (a3)
  {
    if (folderDisplayLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    double v10 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4FA6F48]];
    [v10 setLevel:0];
    [v10 setFillsDisplayBounds:1];
    [v10 setLayoutRole:6];
    id v6 = [MEMORY[0x1E4F62438] sharedInstance];
    int v7 = [v6 addElement:v10];
    double v8 = self->_folderDisplayLayoutAssertion;
    self->_folderDisplayLayoutAssertion = v7;

    BOOL v9 = (BSInvalidatable *)v10;
  }
  else
  {
    if (!folderDisplayLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)folderDisplayLayoutAssertion invalidate];
    BOOL v9 = self->_folderDisplayLayoutAssertion;
    self->_folderDisplayLayoutAssertion = 0;
  }
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInterfaceController];
  [v2 setAllowIconRotation:1 forReason:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _endDisablingAllOrientationChangesForReason:*(void *)(a1 + 40)];
  id v3 = (id *)MEMORY[0x1E4F43630];
  uint64_t result = [(id)*MEMORY[0x1E4F43630] isRunningTest];
  if (!result) {
    return result;
  }
  id v5 = @"AppOpen";
  int v6 = [*v3 isRunningTest:@"AppOpen"];
  id v7 = *v3;
  if (v6) {
    goto LABEL_3;
  }
  id v5 = @"AppClose";
  int v9 = [v7 isRunningTest:@"AppClose"];
  id v7 = *v3;
  if (v9)
  {
LABEL_5:
    double v8 = @"AppCloseAnimation";
    goto LABEL_6;
  }
  id v5 = @"AppOpenInFolder";
  int v10 = [v7 isRunningTest:@"AppOpenInFolder"];
  id v7 = *v3;
  if (v10) {
    goto LABEL_3;
  }
  id v5 = @"AppCloseInFolder";
  int v11 = [v7 isRunningTest:@"AppCloseInFolder"];
  id v7 = *v3;
  if (v11) {
    goto LABEL_5;
  }
  __int16 v12 = @"FolderOpen";
  int v13 = [v7 isRunningTest:@"FolderOpen"];
  id v14 = *v3;
  if (!v13)
  {
    __int16 v12 = @"FolderClose";
    int v16 = [v14 isRunningTest:@"FolderClose"];
    id v14 = *v3;
    if (v16)
    {
      double v15 = @"FolderCloseAnimation";
      goto LABEL_15;
    }
    id v5 = @"AppOpenInScreenTime";
    int v18 = [v14 isRunningTest:@"AppOpenInScreenTime"];
    id v7 = *v3;
    if (!v18)
    {
      id v5 = @"AppCloseInScreenTime";
      uint64_t result = [v7 isRunningTest:@"AppCloseInScreenTime"];
      if (!result) {
        return result;
      }
      id v7 = *v3;
      goto LABEL_5;
    }
LABEL_3:
    double v8 = @"AppOpenAnimation";
LABEL_6:
    return [v7 finishedSubTest:v8 forTest:v5];
  }
  double v15 = @"FolderOpenAnimation";
LABEL_15:
  [v14 finishedSubTest:v15 forTest:v12];
  id v17 = *v3;
  return [v17 finishedTest:v12];
}

- (void)_endDisablingAllOrientationChangesForReason:(id)a3
{
  deviceOrientationUpdateDeferralAssertionsByReason = self->_deviceOrientationUpdateDeferralAssertionsByReason;
  id v5 = a3;
  id v7 = [(NSMapTable *)deviceOrientationUpdateDeferralAssertionsByReason objectForKey:v5];
  [(NSMapTable *)self->_deviceOrientationUpdateDeferralAssertionsByReason removeObjectForKey:v5];
  [v7 invalidate];
  int v6 = [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason objectForKey:v5];
  [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason removeObjectForKey:v5];

  [v6 invalidate];
}

- (BOOL)iconManager:(id)a3 supportsParallaxForIconView:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  char v5 = [v4 isMainDisplayWindowScene];

  return v5;
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke()
{
  v0 = (id *)MEMORY[0x1E4F43630];
  uint64_t result = [(id)*MEMORY[0x1E4F43630] isRunningTest];
  if (result)
  {
    [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
    int v2 = [*v0 isRunningTest:@"AppOpen"];
    id v3 = *v0;
    if (v2)
    {
      [v3 finishedSubTest:@"workspaceActivate" forTest:@"AppOpen"];
      id v4 = *v0;
      char v5 = &__block_literal_global_750;
    }
    else
    {
      int v6 = [v3 isRunningTest:@"AppClose"];
      id v7 = *v0;
      if (v6)
      {
        [v7 finishedSubTest:@"workspaceDeactivate" forTest:@"AppClose"];
        id v4 = *v0;
        char v5 = &__block_literal_global_755;
      }
      else
      {
        int v8 = [v7 isRunningTest:@"AppOpenInFolder"];
        id v9 = *v0;
        if (v8)
        {
          [v9 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenInFolder"];
          id v4 = *v0;
          char v5 = &__block_literal_global_757;
        }
        else
        {
          int v10 = [v9 isRunningTest:@"AppCloseInFolder"];
          id v11 = *v0;
          if (v10)
          {
            [v11 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseInFolder"];
            id v4 = *v0;
            char v5 = &__block_literal_global_759;
          }
          else
          {
            int v12 = [v11 isRunningTest:@"FolderOpen"];
            id v4 = *v0;
            if (v12)
            {
              char v5 = &__block_literal_global_761;
            }
            else
            {
              int v13 = [v4 isRunningTest:@"FolderClose"];
              id v4 = *v0;
              if (v13)
              {
                char v5 = &__block_literal_global_763;
              }
              else
              {
                int v14 = [v4 isRunningTest:@"AppOpenInScreenTime"];
                id v15 = *v0;
                if (v14)
                {
                  [v15 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenInScreenTime"];
                  id v4 = *v0;
                  char v5 = &__block_literal_global_765;
                }
                else
                {
                  uint64_t result = [v15 isRunningTest:@"AppCloseInScreenTime"];
                  if (!result) {
                    return result;
                  }
                  [*v0 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseInScreenTime"];
                  id v4 = *v0;
                  char v5 = &__block_literal_global_767;
                }
              }
            }
          }
        }
      }
    }
    return [v4 installCACommitCompletionBlock:v5];
  }
  return result;
}

- (SBIconController)initWithMainDisplayWindowScene:(id)a3
{
  return [(SBIconController *)self initWithMainDisplayWindowScene:a3 alertItemsController:0 analyticsClient:0 applicationController:0 applicationPlaceholderController:0 assistantController:0 coverSheetPresentationManager:0 layoutStateProvider:0 lockScreenManager:0 policyAggregator:0 userInterfaceController:0 widgetMetricsServer:0];
}

- (SBIconController)initWithMainDisplayWindowScene:(id)a3 alertItemsController:(id)a4 analyticsClient:(id)a5 applicationController:(id)a6 applicationPlaceholderController:(id)a7 assistantController:(id)a8 coverSheetPresentationManager:(id)a9 layoutStateProvider:(id)a10 lockScreenManager:(id)a11 policyAggregator:(id)a12 userInterfaceController:(id)a13 widgetMetricsServer:(id)a14
{
  id v19 = a3;
  id v159 = a4;
  id v158 = a5;
  id v148 = a6;
  id v157 = a6;
  id v156 = a7;
  id v155 = a8;
  id v154 = a9;
  id v153 = a10;
  id v152 = a11;
  id v151 = a12;
  id v150 = a13;
  id v149 = a14;
  v186.receiver = self;
  v186.super_class = (Class)SBIconController;
  double v20 = [(SBIconController *)&v186 init];
  long long v21 = v20;
  if (v20)
  {
    v161 = v19;
    objc_storeWeak((id *)&v20->_mainDisplayWindowScene, v19);
    objc_storeStrong((id *)&v21->_override_alertItemsController, a4);
    objc_storeStrong((id *)&v21->_override_analyticsClient, a5);
    objc_storeStrong((id *)&v21->_override_applicationController, v148);
    objc_storeStrong((id *)&v21->_override_applicationPlaceholderController, a7);
    objc_storeStrong((id *)&v21->_override_assistantController, a8);
    objc_storeStrong((id *)&v21->_override_coverSheetPresentationManager, a9);
    objc_storeStrong((id *)&v21->_override_layoutStateProvider, a10);
    objc_storeStrong((id *)&v21->_override_lockScreenManager, a11);
    objc_storeStrong((id *)&v21->_override_policyAggregator, a12);
    objc_storeStrong((id *)&v21->_override_userInterfaceController, a13);
    objc_storeStrong((id *)&v21->_override_widgetMetricsServer, a14);
    double v22 = objc_alloc_init(SBPowerLogMetricsAggregator);
    powerLogAggregator = v21->_powerLogAggregator;
    v21->_powerLogAggregator = v22;

    id v24 = objc_alloc(MEMORY[0x1E4F4F740]);
    uint64_t v25 = [v24 initWithName:@"com.apple.SpringBoard.iconController.transitions" onQueue:MEMORY[0x1E4F14428]];
    transitionEventQueue = v21->_transitionEventQueue;
    v21->_transitionEventQueue = (BSEventQueue *)v25;

    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    accountStoreQueue = v21->_accountStoreQueue;
    v21->_accountStoreQueue = (OS_dispatch_queue *)SerialWithQoS;

    [MEMORY[0x1E4FA6198] setSignificantTimeChangeNotificationName:@"SBSignificantTimeChangedNotification"];
    CGFloat v29 = [(SBIconController *)v21 applicationController];
    uint64_t v30 = [v29 restrictionController];
    [v30 addObserver:v21];

    [(SBIconController *)v21 _updateIconModelStore];
    if ([(SBIconController *)v21 isUpgradeRestore]
      && ![(SBIconController *)v21 isEnterpriseMultiUser])
    {
      uint64_t v33 = [(SBIconController *)v21 proactiveOnboardingDefaultStacks];
      suggestedOnboardingStack = v21->_suggestedOnboardingStack;
      v21->_suggestedOnboardingStack = (NSArray *)v33;
    }
    else
    {
      suggestedOnboardingStack = +[SBDefaults localDefaults];
      int64_t v32 = [suggestedOnboardingStack homeScreenDefaults];
      [v32 setShouldAddDefaultWidgetsToHomeScreen:0];
    }
    v21->_sendITunesNotification = 1;
    id v34 = [(id)SBApp accountStoreController];
    v35 = [(SBIconController *)v21 coverSheetPresentationManager];
    id v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v21 selector:sel__installedAppsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
    [v36 addObserver:v21 selector:sel__unlockAnimationDidFinish_ name:@"SBLockScreenManagerUnlockAnimationDidFinish" object:0];
    [v36 addObserver:v21 selector:sel__lockScreenUIWillLock_ name:@"SBLockScreenUIWillLockNotification" object:0];
    [v36 addObserver:v21 selector:sel__lockScreenUIWillLock_ name:@"SBLockScreenUIRelockedNotification" object:0];
    [v36 addObserver:v21 selector:sel__primaryAppleAccountDidChange_ name:@"SBAccountStoreManagerPrimaryAppleAccountDidChangeNotification" object:v34];
    [v36 addObserver:v21 selector:sel__storeAccountDidChange_ name:*MEMORY[0x1E4F178D8] object:0];
    char v37 = +[SBSyncController sharedInstance];
    [v36 addObserver:v21 selector:sel__backupRestoringDidChange_ name:@"SBResetOrRestoreStateDidChangeNotification" object:v37];

    id v38 = +[SBControlCenterController sharedInstanceIfExists];
    [v36 addObserver:v21 selector:sel__controlCenterWillPresent_ name:@"SBControlCenterControllerWillPresentNotification" object:v38];

    __int16 v39 = +[SBControlCenterController sharedInstanceIfExists];
    [v36 addObserver:v21 selector:sel__controlCenterWillDismiss_ name:@"SBControlCenterControllerWillDismissNotification" object:v39];

    [v36 addObserver:v21 selector:sel__coverSheetWillPresent_ name:@"SBCoverSheetWillPresentNotification" object:v35];
    [v36 addObserver:v21 selector:sel__coverSheetDidPresent_ name:@"SBCoverSheetDidPresentNotification" object:v35];
    [v36 addObserver:v21 selector:sel__forceTouchControllerWillPresent_ name:*MEMORY[0x1E4FA6720] object:0];
    [v36 addObserver:v21 selector:sel__bookmarkDidUninstall_ name:*MEMORY[0x1E4FA6750] object:0];
    [v36 addObserver:v21 selector:sel__mainSwitcherCreated_ name:@"SBMainSwitcherSwitcherSharedInstanceCreatedNotification" object:0];
    [v36 addObserver:v21 selector:sel__reduceMotionStatusDidChange_ name:*MEMORY[0x1E4F43478] object:0];
    [v36 addObserver:v21 selector:sel__policyAggregatorCapabilitiesDidChange_ name:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:0];
    [v36 addObserver:v21 selector:sel__styleEditorWillPresent_ name:*MEMORY[0x1E4FA6598] object:0];
    [v36 addObserver:v21 selector:sel__styleEditorDidDismiss_ name:*MEMORY[0x1E4FA6570] object:0];
    [v36 addObserver:v21 selector:sel__colorDropperWillPresent_ name:*MEMORY[0x1E4FA6590] object:0];
    [v36 addObserver:v21 selector:sel__colorDropperDismissed_ name:*MEMORY[0x1E4FA6568] object:0];
    id v40 = +[SBDefaults localDefaults];
    uint64_t v41 = [v40 notificationDefaults];
    v42 = [v41 displayIDsWithBadgingEnabled];

    if ([v42 count])
    {
      uint64_t v43 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v42];
      displayIDsWithBadgingEnabled = v21->_displayIDsWithBadgingEnabled;
      v21->_displayIDsWithBadgingEnabled = (NSMutableSet *)v43;
    }
    uint64_t Serial = BSDispatchQueueCreateSerial();
    id v46 = objc_alloc(MEMORY[0x1E4F50CC8]);
    CGPoint v47 = (void *)MEMORY[0x1E4F14428];
    v146 = (void *)Serial;
    uint64_t v48 = [v46 initWithQueue:Serial calloutQueue:MEMORY[0x1E4F14428]];
    bbObserver = v21->_bbObserver;
    v21->_bbObserver = (BBObserver *)v48;

    [(BBObserver *)v21->_bbObserver setDelegate:v21];
    [(BBObserver *)v21->_bbObserver setObserverFeed:512];
    v50 = [MEMORY[0x1E4F74230] sharedConnection];
    [v50 registerObserver:v21];
    v145 = v50;
    [(SBIconController *)v21 profileConnectionDidReceiveEffectiveSettingsChangedNotification:v50 userInfo:0];
    [(SBIconController *)v21 _updateUninstallingSystemAppsRestricted];
    v51 = (SBHIconManager *)objc_alloc_init(MEMORY[0x1E4FA62B0]);
    iconManager = v21->_iconManager;
    v21->_iconManager = v51;

    [(SBHIconManager *)v21->_iconManager setDelegate:v21];
    if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
    {
      v53 = [SBWallpaperIconStyleCoordinator alloc];
      v54 = +[SBWallpaperController sharedInstance];
      v55 = +[SBDefaults localDefaults];
      v56 = [v55 homeScreenDefaults];
      uint64_t v57 = [(SBWallpaperIconStyleCoordinator *)v53 initWithWallpaperController:v54 homeScreenDefaults:v56];
      iconStyleCoordinator = v21->_iconStyleCoordinator;
      v21->_iconStyleCoordinator = (SBWallpaperIconStyleCoordinator *)v57;

      [(SBWallpaperIconStyleCoordinator *)v21->_iconStyleCoordinator addIconStyleObserver:v21];
      v59 = [SBHomeScreenViewController alloc];
      v60 = v21->_iconManager;
      v61 = [(SBIconController *)v21 userInterfaceController];
      v62 = [(SBHomeScreenViewController *)v59 initWithWindowScene:v161 iconController:v21 iconManager:v60 userInterfaceController:v61];

      homeScreenViewController = v21->_homeScreenViewController;
      v21->_homeScreenViewController = v62;
      v64 = v62;

      v65 = v21->_iconManager;
      v66 = [(SBHomeScreenViewController *)v64 view];
      [(SBHIconManager *)v65 configureFeedbackView:v66];

      [(SBIconController *)v21 updateHomeScreenTraitOverridesForWindowScene:v161];
    }
    uint64_t v67 = [(SBIconController *)v21 widgetMetricsServer];
    widgetMetricsServer = v21->_widgetMetricsServer;
    v21->_widgetMetricsServer = (SBWidgetMetricsServer *)v67;

    [(SBHIconManager *)v21->_iconManager setListLayoutProviderLayoutOptions:[(SBIconController *)v21 bestListLayoutProviderLayoutOptions]];
    [(SBHIconManager *)v21->_iconManager setIconModel:v21->_iconModel];
    [(SBHIconModel *)v21->_iconModel setPostsDidAddIconNotification:1];
    if (![(SBIconController *)v21 _isCoplanarHomeScreenEnabled]) {
      [(SBIconController *)v21 _setupOverlayLibraryViewController];
    }
    [(SBIconController *)v21 _makeTodayViewControllers];
    if (![(SBIconController *)v21 _isCoplanarHomeScreenEnabled])
    {
      v69 = v21->_iconManager;
      v70 = [(SBIconController *)v21 todayViewController];
      [(SBHIconManager *)v69 setOverlayTodayViewController:v70];
    }
    v71 = v21->_iconManager;
    v72 = [(SBIconController *)v21 coverSheetTodayViewController];
    [(SBHIconManager *)v71 setOverlayCoverSheetTodayViewController:v72];

    v73 = [(SBIconController *)v21 appSwitcherHeaderIconImageCache];
    if (v73) {
      [(SBHIconManager *)v21->_iconManager addAdditionalIconImageCacheForPrecaching:v73];
    }
    v147 = v42;
    [(SBIconController *)v21 _registerAnalytics];
    v74 = [(SBIconController *)v21 alertItemsController];
    [v74 addObserver:v21];

    v75 = [(SBIconController *)v21 assistantController];
    [v75 addObserver:v21];

    v76 = [MEMORY[0x1E4F62438] sharedInstance];
    [v76 addObserver:v21];

    v77 = [v161 layoutStateTransitionCoordinator];
    [v77 addObserver:v21];

    v78 = [[SBProactiveHomeScreenUsageObserver alloc] initWithIconController:v21];
    proactiveUsageObserver = v21->_proactiveUsageObserver;
    v21->_proactiveUsageObserver = v78;

    [(SBProactiveHomeScreenUsageObserver *)v21->_proactiveUsageObserver setDelegate:v21];
    v80 = [[SBProactiveHomeScreenSuggestionProvider alloc] initWithIconController:v21];
    proactiveSuggestionProvider = v21->_proactiveSuggestionProvider;
    v21->_proactiveSuggestionProvider = v80;

    [(SBProactiveHomeScreenSuggestionProvider *)v21->_proactiveSuggestionProvider addObserver:v21];
    v82 = [[SBTipsHomeScreenUsageObserver alloc] initWithIconManager:v21->_iconManager];
    tipsUsageObserver = v21->_tipsUsageObserver;
    v21->_tipsUsageObserver = v82;

    objc_initWeak(&location, v21);
    v84 = (void *)MEMORY[0x1E4F941D0];
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke;
    v183[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v184, &location);
    uint64_t v85 = [v84 recipeWithTitle:@"Relayout Home Screen" prepareBlock:0 action:v183 cleanupBlock:0];
    relayoutTestRecipe = v21->_relayoutTestRecipe;
    v21->_relayoutTestRecipe = (PTSingleTestRecipe *)v85;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_relayoutTestRecipe];
    uint64_t v87 = [MEMORY[0x1E4F941D0] recipeWithTitle:@"Toggle Search" prepareBlock:0 action:&__block_literal_global_69 cleanupBlock:0];
    toggleSearchTestRecipe = v21->_toggleSearchTestRecipe;
    v21->_toggleSearchTestRecipe = (PTSingleTestRecipe *)v87;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_toggleSearchTestRecipe];
    v89 = (void *)MEMORY[0x1E4F941D0];
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_3;
    v181[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v182, &location);
    uint64_t v90 = [v89 recipeWithTitle:@"Run Downloading Icon Test" action:v181];
    runDownloadingIconTestRecipe = v21->_runDownloadingIconTestRecipe;
    v21->_runDownloadingIconTestRecipe = (PTSingleTestRecipe *)v90;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_runDownloadingIconTestRecipe];
    v92 = (void *)MEMORY[0x1E4F941D0];
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_4;
    v179[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v180, &location);
    uint64_t v93 = [v92 recipeWithTitle:@"Run Remove/Restore Icon Test" action:v179];
    runRemoveAndRestoreIconTestRecipe = v21->_runRemoveAndRestoreIconTestRecipe;
    v21->_runRemoveAndRestoreIconTestRecipe = (PTSingleTestRecipe *)v93;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_runRemoveAndRestoreIconTestRecipe];
    v95 = (void *)MEMORY[0x1E4F941D0];
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_5;
    v177[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v178, &location);
    uint64_t v96 = [v95 recipeWithTitle:@"Organize Icons in Folders" action:v177];
    organizeInFoldersTestRecipe = v21->_organizeInFoldersTestRecipe;
    v21->_organizeInFoldersTestRecipe = (PTSingleTestRecipe *)v96;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_organizeInFoldersTestRecipe];
    v98 = (void *)MEMORY[0x1E4F94128];
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_6;
    v175[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v176, &location);
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_7;
    v173[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v174, &location);
    uint64_t v99 = [v98 recipeWithTitle:@"Shuffle Stack / Toggle Suggestion" prepareBlock:0 increaseAction:v175 decreaseAction:v173 cleanupBlock:0];
    shuffleStackTestRecipe = v21->_shuffleStackTestRecipe;
    v21->_shuffleStackTestRecipe = (PTDoubleTestRecipe *)v99;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_shuffleStackTestRecipe];
    v101 = (void *)MEMORY[0x1E4F941D0];
    v171[0] = MEMORY[0x1E4F143A8];
    v171[1] = 3221225472;
    v171[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_8;
    v171[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v172, &location);
    uint64_t v102 = [v101 recipeWithTitle:@"Run Widget Discoverability Test" action:v171];
    runWidgetDiscoverabilityTestRecipe = v21->_runWidgetDiscoverabilityTestRecipe;
    v21->_runWidgetDiscoverabilityTestRecipe = (PTSingleTestRecipe *)v102;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v21->_runWidgetDiscoverabilityTestRecipe];
    v104 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v105 = [v104 rootFolderSettings];
    rootFolderSettings = v21->_rootFolderSettings;
    v21->_rootFolderSettings = (SBHRootFolderSettings *)v105;

    [(SBHRootFolderSettings *)v21->_rootFolderSettings addKeyObserver:v21];
    uint64_t v107 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    deviceOrientationUpdateDeferralAssertionsByReason = v21->_deviceOrientationUpdateDeferralAssertionsByReason;
    v21->_deviceOrientationUpdateDeferralAssertionsByReason = (NSMapTable *)v107;

    uint64_t v109 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    activeInterfaceOrientationChangeDeferralAssertionsByReason = v21->_activeInterfaceOrientationChangeDeferralAssertionsByReason;
    v21->_activeInterfaceOrientationChangeDeferralAssertionsByReason = (NSMapTable *)v109;

    v111 = +[SBDefaults localDefaults];
    v112 = [v111 homeScreenDefaults];

    v113 = +[SBDefaults localDefaults];
    id v162 = [v113 floatingDockDefaults];

    v114 = [MEMORY[0x1E4FA6270] rootSettings];
    v115 = [NSString stringWithUTF8String:"shouldUseLargeDefaultSizedIcons"];
    v169[0] = MEMORY[0x1E4F143A8];
    v169[1] = 3221225472;
    v169[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_9;
    v169[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v170, &location);
    id v116 = (id)[v112 observeDefault:v115 onQueue:MEMORY[0x1E4F14428] withBlock:v169];

    v117 = [NSString stringWithUTF8String:"recentsEnabled"];
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_10;
    v167[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v168, &location);
    id v118 = (id)[v162 observeDefault:v117 onQueue:MEMORY[0x1E4F14428] withBlock:v167];

    [v114 addKeyObserver:v21];
    v119 = [NSString stringWithUTF8String:"showsBadgesInAppLibrary"];
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_11;
    v165[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v166, &location);
    id v120 = (id)[v112 observeDefault:v119 onQueue:MEMORY[0x1E4F14428] withBlock:v165];

    v121 = [NSString stringWithUTF8String:"showsHomeScreenSearchAffordance"];
    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v163[2] = __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_12;
    v163[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v164, &location);
    id v122 = (id)[v112 observeDefault:v121 onQueue:MEMORY[0x1E4F14428] withBlock:v163];

    v123 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v124 = [v123 iconEditingSettings];
    iconEditingSettings = v21->_iconEditingSettings;
    v21->_iconEditingSettings = (SBHIconEditingSettings *)v124;

    [(SBHIconEditingSettings *)v21->_iconEditingSettings addKeyObserver:v21];
    [(SBIconController *)v21 _configureEditingGestureRecognizers];
    v126 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v127 = [v126 widgetSettings];
    widgetSettings = v21->_widgetSettings;
    v21->_widgetSettings = (SBHWidgetSettings *)v127;

    id v129 = +[SBDraggingSystemManager sharedInstance];
    uint64_t v130 = [(SBIconController *)v21 _addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled];
    stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled = v21->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled;
    v21->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled = (BSInvalidatable *)v130;

    uint64_t v132 = [(SBIconController *)v21 _addStateCaptureHandlerForHomeScreenDefaults];
    stateCaptureHandleForHomeScreenDefaults = v21->_stateCaptureHandleForHomeScreenDefaults;
    v21->_stateCaptureHandleForHomeScreenDefaults = (BSInvalidatable *)v132;

    uint64_t v134 = [(SBIconController *)v21 _addStateCaptureHandlerForInterestingAppIconLocations];
    stateCaptureHandleForInterestingAppIconLocations = v21->_stateCaptureHandleForInterestingAppIconLocations;
    v21->_stateCaptureHandleForInterestingAppIconLocations = (BSInvalidatable *)v134;

    uint64_t v136 = [(SBIconController *)v21 _addStateCaptureHandlerForRestrictions];
    stateCaptureHandleForRestrictions = v21->_stateCaptureHandleForRestrictions;
    v21->_stateCaptureHandleForRestrictions = (BSInvalidatable *)v136;

    uint64_t v138 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.SBIconController"];
    dndStateService = v21->_dndStateService;
    v21->_dndStateService = (DNDStateService *)v138;

    [(DNDStateService *)v21->_dndStateService addStateUpdateListener:v21 withCompletionHandler:0];
    [(SBIconController *)v21 updateRootFolderWithCurrentDoNotDisturbState];
    uint64_t v140 = [MEMORY[0x1E4F5F690] serviceForClientIdentifier:@"com.apple.springboard.SBIconController"];
    dndModeConfigurationService = v21->_dndModeConfigurationService;
    v21->_dndModeConfigurationService = (DNDModeConfigurationService *)v140;

    [(DNDModeConfigurationService *)v21->_dndModeConfigurationService addListener:v21 withCompletionHandler:0];
    v142 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    v143 = [v142 addMonitor:v21 subjectMask:1 subscriptionOptions:1];
    objc_storeWeak((id *)&v21->_appProtectionSubjectMonitorSubscription, v143);

    objc_destroyWeak(&v164);
    objc_destroyWeak(&v166);
    objc_destroyWeak(&v168);
    objc_destroyWeak(&v170);

    objc_destroyWeak(&v172);
    objc_destroyWeak(&v174);
    objc_destroyWeak(&v176);
    objc_destroyWeak(&v178);
    objc_destroyWeak(&v180);
    objc_destroyWeak(&v182);
    objc_destroyWeak(&v184);
    objc_destroyWeak(&location);

    id v19 = v161;
  }

  return v21;
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 relayout];
}

uint64_t __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_2()
{
  return [(id)SBApp toggleSearchOnWindowScene:0 fromBreadcrumbSource:0 withWillBeginHandler:0 completionHandler:0];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 runDownloadingIconTest];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 runRemoveAndRestoreIconTest];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 organizeAllIconsIntoFoldersWithPageCount:2];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 shuffleWidgetStackForTestRecipe];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 toggleSuggestedWidgetInStackForTestRecipe];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runWidgetDiscoverabilityTest];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:animated:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"), 0);
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"));
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showsBadgesInAppLibraryDidChange];
}

void __292__SBIconController_initWithMainDisplayWindowScene_alertItemsController_analyticsClient_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_layoutStateProvider_lockScreenManager_policyAggregator_userInterfaceController_widgetMetricsServer___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 tearDownAndResetRootIconLists];
}

- (void)_setupOverlayLibraryViewController
{
  if (![(SBIconController *)self isModalAppLibrarySupported])
  {
    id v3 = [(SBIconController *)self overlayLibraryViewController];
    if (!v3)
    {
      BOOL v4 = [(SBIconController *)self isAppLibrarySupported];
      id v3 = 0;
      if (v4)
      {
        char v5 = [(SBIconController *)self iconManager];

        if (!v5) {
          return;
        }
        int v6 = [(SBIconController *)self mainDisplayWindowScene];
        uint64_t v7 = [(SBIconController *)self _setUpLibraryViewControllerForWindowScene:v6];

        [(SBIconController *)self setOverlayLibraryViewController:v7];
        if (![(SBIconController *)self _isCoplanarHomeScreenEnabled]) {
          [(SBHIconManager *)self->_iconManager setOverlayLibraryViewController:v7];
        }
        id v3 = (void *)v7;
      }
    }
  }
}

- (id)proactiveOnboardingDefaultStacks
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F4AF88] sharedInstance];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  BOOL v4 = [v2 fetchWidgetDiscoverabilityStacks];
  char v5 = [v3 arrayWithArray:v4];

  int v6 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Synchronously fetched proactive onboarding stack %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [(SBIconController *)self applicationController];
  char v5 = [v4 restrictionController];
  [v5 removeObserver:self];

  int v6 = [MEMORY[0x1E4F74230] sharedConnection];
  [v6 unregisterObserver:self];

  [(SBHIconEditingSettings *)self->_iconEditingSettings removeKeyObserver:self];
  uint64_t v7 = [MEMORY[0x1E4F62438] sharedInstance];
  [v7 removeObserver:self];

  [(BBObserver *)self->_bbObserver invalidate];
  [(BSInvalidatable *)self->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled invalidate];
  [(BSInvalidatable *)self->_stateCaptureHandleForHomeScreenDefaults invalidate];
  [(BSInvalidatable *)self->_stateCaptureHandleForInterestingAppIconLocations invalidate];
  [(BSInvalidatable *)self->_stateCaptureHandleForRestrictions invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  [(BSInvalidatable *)self->_duckWallpaperDimmingAssertion invalidate];
  [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
  id v9 = +[SBIconController sharedInstance];
  uint64_t v10 = [v9 iconStyleCoordinator];
  [v10 removeIconStyleObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)SBIconController;
  [(SBIconController *)&v11 dealloc];
}

- (id)alertItemsController
{
  override_alertItemsController = self->_override_alertItemsController;
  if (override_alertItemsController)
  {
    id v3 = override_alertItemsController;
  }
  else
  {
    id v3 = +[SBAlertItemsController sharedInstance];
  }
  return v3;
}

- (id)analyticsClient
{
  override_analyticsClient = self->_override_analyticsClient;
  if (override_analyticsClient)
  {
    id v3 = override_analyticsClient;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FA5E78] sharedInstance];
  }
  return v3;
}

- (id)applicationController
{
  override_applicationController = self->_override_applicationController;
  if (override_applicationController)
  {
    id v3 = override_applicationController;
  }
  else
  {
    id v3 = +[SBApplicationController sharedInstance];
  }
  return v3;
}

- (id)applicationPlaceholderController
{
  override_applicationPlaceholderController = self->_override_applicationPlaceholderController;
  if (override_applicationPlaceholderController)
  {
    id v3 = override_applicationPlaceholderController;
  }
  else
  {
    id v3 = +[SBApplicationPlaceholderController sharedInstance];
  }
  return v3;
}

- (id)assistantController
{
  override_assistantController = self->_override_assistantController;
  if (override_assistantController)
  {
    id v3 = override_assistantController;
  }
  else
  {
    id v3 = +[SBAssistantController sharedInstance];
  }
  return v3;
}

- (id)coverSheetPresentationManager
{
  override_coverSheetPresentationManager = self->_override_coverSheetPresentationManager;
  if (override_coverSheetPresentationManager)
  {
    id v3 = override_coverSheetPresentationManager;
  }
  else
  {
    id v3 = +[SBCoverSheetPresentationManager sharedInstance];
  }
  return v3;
}

- (id)lockScreenManager
{
  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
  {
    id v3 = override_lockScreenManager;
  }
  else
  {
    id v3 = +[SBLockScreenManager sharedInstance];
  }
  return v3;
}

- (id)layoutStateProvider
{
  override_layoutStateProvider = self->_override_layoutStateProvider;
  if (override_layoutStateProvider)
  {
    id v3 = override_layoutStateProvider;
  }
  else
  {
    BOOL v4 = [(SBIconController *)self mainDisplayWindowScene];
    id v3 = [v4 layoutStateProvider];
  }
  return v3;
}

- (id)policyAggregator
{
  override_policyAggregator = self->_override_policyAggregator;
  if (override_policyAggregator)
  {
    id v3 = override_policyAggregator;
  }
  else
  {
    BOOL v4 = [(SBIconController *)self mainDisplayWindowScene];
    char v5 = [v4 sceneManager];
    id v3 = [v5 policyAggregator];
  }
  return v3;
}

- (SBWidgetMetricsServer)widgetMetricsServer
{
  override_widgetMetricsServer = self->_override_widgetMetricsServer;
  if (override_widgetMetricsServer || (override_widgetMetricsServer = self->_widgetMetricsServer) != 0)
  {
    BOOL v4 = override_widgetMetricsServer;
  }
  else
  {
    int v6 = [(SBIconController *)self iconManager];
    uint64_t v7 = [v6 widgetMetricsProvider];
    int v8 = [(SBIconController *)self lockScreenManager];
    id v9 = [v8 lockScreenEnvironment];
    uint64_t v10 = [v9 widgetMetricsProvider];
    id v11 = objc_alloc_init(MEMORY[0x1E4F4A490]);
    [(SBIconController *)self setAmbientListLayoutProvider:v11];
    id v12 = objc_alloc_init(MEMORY[0x1E4FA6398]);
    [v12 setDelegate:self];
    [(SBIconController *)self setAmbientWidgetMetricsProvider:v12];
    BOOL v4 = [[SBWidgetMetricsServer alloc] initWithSystemMetricsProvider:v7 lockScreenMetricsProvider:v10 ambientMetricsProvider:v12];
  }
  return v4;
}

- (id)widgetMetricsProvider:(id)a3 listLayoutProviderForScreenType:(unint64_t)a4
{
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F4A490]) initWithScreenType:a4];
  return v4;
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [(NSMapTable *)self->_windowSceneToMedusaDragWindowContext removeObjectForKey:v7];
    int v6 = [(SBIconController *)self iconDragManager];
    [v6 windowSceneDidDisconnect:v7];
  }
}

- (unint64_t)bestListLayoutProviderLayoutOptions
{
  id v3 = +[SBDefaults localDefaults];
  id v4 = [v3 homeScreenDefaults];

  uint64_t v5 = +[SBDefaults localDefaults];
  int v6 = [v5 floatingDockDefaults];

  if ([v6 recentsEnabled]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 4;
  }
  if ([v4 shouldUseLargeDefaultSizedIcons])
  {
    if (__sb__runningInSpringBoard())
    {
      BOOL v8 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v8 = [v9 userInterfaceIdiom] == 1;
    }
    if (v8) {
      v7 |= 8uLL;
    }
  }
  if ([(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator shouldUseLargeHomeScreenIcons])
  {
    unint64_t v10 = v7 | 0x18;
  }
  else
  {
    unint64_t v10 = v7;
  }

  return v10;
}

- (SBFolderController)_openFolderController
{
  int v2 = [(SBIconController *)self iconManager];
  id v3 = [v2 openedFolderController];

  return (SBFolderController *)v3;
}

- (SBFolderController)_currentFolderController
{
  id v3 = [(SBIconController *)self _openFolderController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBIconController *)self _rootFolderController];
  }
  int v6 = v5;

  return (SBFolderController *)v6;
}

- (id)folderNameForDisplayID:(id)a3
{
  iconModel = self->_iconModel;
  id v4 = a3;
  id v5 = [(SBHIconModel *)iconModel rootFolder];
  int v6 = [v5 indexPathForIconWithIdentifier:v4];

  uint64_t v7 = [v5 folderContainingIndexPath:v6 relativeIndexPath:0];

  if (v7)
  {
    BOOL v8 = [v7 displayName];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)iconPathForIconWithDisplayID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconModel *)self->_iconModel rootFolder];
  int v6 = [v5 indexPathForIconWithIdentifier:v4];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v20 = v5;
    [v5 resolvedComponentsForIndexPath:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          int v14 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v16 = [v13 displayName];
            if (!v16) {
              goto LABEL_12;
            }
            id v17 = (void *)v16;
            [v7 addObject:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
LABEL_12:

    int v18 = (void *)[v7 copy];
    id v5 = v20;
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

- (void)_showInfoAlertIfNeeded:(BOOL)a3
{
  id v14 = [(SBIconController *)self alertItemsController];
  id v5 = +[SBDefaults localDefaults];
  int v6 = [v5 iconDefaults];
  char v7 = [v6 didShowIconReorderAlert];

  int v8 = [v14 hasAlertOfClass:objc_opt_class()];
  if (a3)
  {
    int v9 = 1;
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = [(SBIconController *)self applicationPlaceholderController];
    int v9 = [v10 hasDownloadedStoreApplication];

    if (v7) {
      goto LABEL_7;
    }
  }
  uint64_t v11 = [(SBIconController *)self iconManager];
  int v12 = [v11 isEditingAllowed] & ~v8 & v9;

  if (v12 == 1)
  {
    int v13 = objc_alloc_init(SBReorderInfoAlert);
    [v14 activateAlertItem:v13];
  }
LABEL_7:
}

- (void)handleHomeButtonTap
{
  id v3 = [(SBIconController *)self iconManager];
  id v4 = [(SBIconController *)self homeScreenViewController];
  if (![(SBIconController *)self areAnyIconViewContextMenusShowing])
  {
    if ([v3 areAnyIconShareSheetsShowing])
    {
      [v3 dismissIconShareSheets];
      goto LABEL_7;
    }
    id v5 = [v4 presentedViewController];

    if (v5)
    {
      [v4 dismissViewControllerAnimated:1 completion:0];
      goto LABEL_7;
    }
    if ([v3 hasOpenFolder]
      && (![v3 isEditing] || objc_msgSend(v3, "isIconDragging")))
    {
      [v3 popExpandedIconAnimated:1 completionHandler:0];
      goto LABEL_7;
    }
    if ([v3 isShowingModalInteraction])
    {
      [v3 popModalInteraction];
      goto LABEL_7;
    }
    if ([v3 isFolderPageManagementUIVisible])
    {
      [v3 dismissFolderPageManagementUI];
      goto LABEL_7;
    }
    if ([v3 isEditing])
    {
      [v3 setEditing:0];
      goto LABEL_7;
    }
    if ([v3 isShowingPullDownSearchOrTransitioningToVisible])
    {
      [v3 dismissSpotlightAnimated:1 completionHandler:0];
      goto LABEL_7;
    }
    if ([(SBIconController *)self isMainDisplayLibraryViewVisible])
    {
      if (![(SBIconController *)self isModalAppLibrarySupported])
      {
        int v6 = [(SBIconController *)self overlayLibraryViewController];
        [v6 popPresentationState];
LABEL_35:

        goto LABEL_7;
      }
      int v6 = [(SBIconController *)self mainDisplayWindowScene];
      char v7 = [v6 modalLibraryController];
      if (![v7 isPresentingLibrary])
      {
LABEL_34:

        goto LABEL_35;
      }
      int v8 = [v7 libraryViewController];
      [v8 popPresentationState];
    }
    else
    {
      if ([(SBIconController *)self isTodayOverlaySpotlightVisible])
      {
        [(SBIconController *)self dismissTodayOverlaySpotlightAnimated:1];
        goto LABEL_7;
      }
      if ([(SBIconController *)self isTodayOverlayPresented])
      {
        [(SBIconController *)self dismissTodayOverlayAnimated:1];
        goto LABEL_7;
      }
      int v9 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
      }

      kdebug_trace();
      [v3 animateToDefaultStateWithCompletionHandler:&__block_literal_global_249_0];
      int v6 = [v4 iconContentView];
      uint64_t v10 = [v6 window];
      char v7 = [v10 _eventRoutingScene];

      if (!v7) {
        goto LABEL_34;
      }
      int v8 = [MEMORY[0x1E4F42738] sharedApplication];
      [v8 _cancelAllEventsOfType:0 onEventRoutingScene:v7];
    }

    goto LABEL_34;
  }
  [(SBIconController *)self dismissAppIconForceTouchControllers:0];
LABEL_7:
}

uint64_t __39__SBIconController_handleHomeButtonTap__block_invoke()
{
  v0 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)int v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v2, 2u);
  }

  return kdebug_trace();
}

- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBIconController.m", 1110, @"Invalid parameter not satisfying: %@", @"transitionName" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SBIconController.m", 1111, @"Invalid parameter not satisfying: %@", @"transitionHandler" object file lineNumber description];

LABEL_3:
  transitionEventQueue = self->_transitionEventQueue;
  int v9 = [MEMORY[0x1E4F4F748] eventWithName:v12 handler:v7];
  [(BSEventQueue *)transitionEventQueue executeOrInsertEvent:v9 atPosition:1];
}

- (BOOL)allowsUninstall
{
  return self->_allowsUninstall;
}

- (BOOL)isUninstallSupportedForAnyIcon
{
  int v2 = [(SBIconController *)self allowsUninstall];
  if (v2)
  {
    if ([MEMORY[0x1E4F42738] isRunningInStoreDemoMode])
    {
      id v3 = +[SBDefaults externalDefaults];
      id v4 = [v3 demoDefaults];
      char v5 = [v4 shouldLockIconsInStoreDemoMode];

      LOBYTE(v2) = v5 ^ 1;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (BOOL)isUninstallSupportedForIcon:(id)a3
{
  id v4 = a3;
  if ([(SBIconController *)self isUninstallSupportedForAnyIcon]
    && [v4 isUninstallSupported])
  {
    if ([v4 isApplicationIcon])
    {
      char v5 = [v4 application];
      if ([v5 isSystemApplication]
        && [(SBIconController *)self isUninstallingSystemAppsRestricted])
      {
        char v6 = 0;
      }
      else if (v5)
      {
        int v8 = [v5 info];
        uint64_t v9 = [v8 uninstallCapability];

        if (v9) {
          char v6 = -1;
        }
        else {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 1;
      }
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)isHideSupportedForIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBIconController *)self isAppLibrarySupported]
    && (SBIconLocationGroupContainsLocation() & 1) == 0)
  {
    if ([v6 isApplicationIcon] & 1) != 0 || (objc_msgSend(v6, "isFolderIcon"))
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v9 = [(SBIconController *)self iconManager];
      char v8 = [v9 canAddIconToIgnoredList:v6];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isUninstallOrHideSupportedForIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  BOOL v7 = [(SBIconController *)self isHideSupportedForIcon:v6 inLocation:a4]
    || [(SBIconController *)self isUninstallSupportedForIcon:v6];

  return v7;
}

- (BOOL)isOnlyHideSuggestionSupportedForIcon:(id)a3 inLocation:(id)a4
{
  return [a4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"];
}

- (BOOL)isHideSuggestionSupportedForIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"])
  {
    BOOL v7 = [(SBIconController *)self mainDisplayWindowScene];
    char v8 = [v7 floatingDockController];
    char v9 = [v8 shouldShowHideSuggestionForIconView:v6 proposedValue:1];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)updateNumberOfRowsWithDuration:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBIconController_updateNumberOfRowsWithDuration___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:2 delay:v5 options:0 animations:a3 completion:0.0];
  id v4 = [(SBIconController *)self iconManager];
  [v4 layoutIconListsWithAnimationType:0 forceRelayout:0];
}

void __51__SBIconController_updateNumberOfRowsWithDuration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeScreenViewController];
  v1 = [v2 iconContentView];
  [v1 layoutIfNeeded];
}

- (void)_launchWidgetIcon:(id)a3 fromLocation:(id)a4 withContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 activationSettings];
  id v12 = [v10 actions];

  if (v11) {
    int v13 = v11;
  }
  else {
    int v13 = objc_alloc_init(SBActivationSettings);
  }
  id v14 = v13;
  id v15 = [v8 activeWidget];
  uint64_t v16 = v15;
  if (v15)
  {
    long long v24 = v12;
    uint64_t v25 = v9;
    id v17 = [v15 extensionBundleIdentifier];
    int v18 = [v16 containerBundleIdentifier];
    id v19 = [(SBIconController *)self applicationController];
    double v20 = [v19 applicationWithBundleIdentifier:v18];

    SBLogIcon();
    long long v21 = (SBLockScreenUnlockRequest *)objc_claimAutoreleasedReturnValue();
    BOOL v22 = os_log_type_enabled(&v21->super, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v33 = v18;
        __int16 v34 = 2112;
        id v35 = v8;
        __int16 v36 = 2112;
        char v37 = v25;
        _os_log_impl(&dword_1D85BA000, &v21->super, OS_LOG_TYPE_INFO, "Launching application %@ from widget icon %@, location: %@", buf, 0x20u);
      }

      [(SBActivationSettings *)v14 setObject:v17 forActivationSetting:14];
      long long v21 = objc_alloc_init(SBLockScreenUnlockRequest);
      [(SBLockScreenUnlockRequest *)v21 setSource:24];
      [(SBLockScreenUnlockRequest *)v21 setIntent:3];
      [(SBLockScreenUnlockRequest *)v21 setName:@"Launch From Widget Icon Unlock"];
      [(SBLockScreenUnlockRequest *)v21 setWantsBiometricPresentation:1];
      long long v23 = [(SBIconController *)self lockScreenManager];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__SBIconController__launchWidgetIcon_fromLocation_withContext___block_invoke;
      v26[3] = &unk_1E6AFB668;
      v26[4] = self;
      id v27 = v20;
      id v28 = v8;
      id v29 = v25;
      uint64_t v30 = v14;
      id v31 = v24;
      [v23 unlockWithRequest:v21 completion:v26];
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v18;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      char v37 = v25;
      _os_log_impl(&dword_1D85BA000, &v21->super, OS_LOG_TYPE_INFO, "Failed to launch application %@ from widget icon %@, location: %@", buf, 0x20u);
    }

    id v12 = v24;
    id v9 = v25;
  }
}

void __63__SBIconController__launchWidgetIcon_fromLocation_withContext___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) userInterfaceController];
    [v3 activateApplication:*(void *)(a1 + 40) fromIcon:*(void *)(a1 + 48) location:*(void *)(a1 + 56) activationSettings:*(void *)(a1 + 64) actions:*(void *)(a1 + 72)];
  }
}

- (void)noteTransientOverlayPresented
{
  id v3 = SBLogIconDragging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "transient overlay presented", v6, 2u);
  }

  id v4 = [(SBIconController *)self iconManager];
  [v4 setEditing:0];

  char v5 = [(SBIconController *)self iconManager];
  [v5 cancelAllDrags];
}

- (void)noteViewCovered
{
  id v2 = [(SBIconController *)self iconManager];
  [v2 cancelAllFolderScrolling];
}

- (NSSet)visibleIconStateDisplayIdentifiers
{
  return (NSSet *)[(SBIconVisibilityService *)self->_iconVisibilityService iconStateDisplayIdentifiers];
}

- (void)_lockScreenUIWillLock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SBIconController *)self iconManager];
  [v5 setEditing:0];
  uint64_t v6 = objc_opt_class();
  BOOL v22 = v4;
  BOOL v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:@"Animated"];
  id v9 = SBSafeCast(v6, v8);

  uint64_t v10 = [v9 BOOLValue];
  [(SBIconController *)self dismissAppIconForceTouchControllers:0];
  [v5 dismissIconShareSheets];
  uint64_t v11 = [(SBIconController *)self homeScreenViewController];
  id v12 = [v11 presentedViewController];

  if (v12) {
    [v11 dismissViewControllerAnimated:v10 completion:0];
  }
  [(SBIconController *)self dismissTodayOverlayAnimated:v10];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v13 = [(id)SBApp windowSceneManager];
  id v14 = [v13 connectedWindowScenes];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v23 + 1) + 8 * i) modalLibraryController];
        if ([v19 isPresentingLibraryInForeground]) {
          [v19 dismissLibraryAnimated:v10 completion:0];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  if (v10) {
    [v5 dismissModalInteractions];
  }
  else {
    [v5 dismissModalInteractionsImmediately];
  }
  double v20 = [v5 focusModeManager];
  [v20 dismissAllFocusModePopovers];
  long long v21 = [(SBIconController *)self _rootFolderController];
  objc_msgSend(v21, "setCurrentPageIndex:animated:", objc_msgSend(v21, "nearestIconPageIndex"), 0);
}

- (void)_updateUninstallingSystemAppsRestricted
{
  id v3 = [(id)SBApp accountStoreController];
  id v4 = [v3 primaryAppleAccount];
  char v5 = objc_msgSend(v4, "aa_isManagedAppleID");
  uint64_t v6 = [(SBIconController *)self accountStoreQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke;
  v7[3] = &unk_1E6AF5D38;
  char v8 = v5;
  v7[4] = self;
  dispatch_async(v6, v7);
}

void __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  char v4 = objc_msgSend(v3, "aa_isManagedAppleID");
  int v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_cold_1((unsigned __int8 *)(a1 + 40), v4, v6);
  }
  if (v5) {
    char v7 = 1;
  }
  else {
    char v7 = v4;
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_281;
  v8[3] = &unk_1E6AF8018;
  char v9 = v7;
  v8[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  char v11 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_281(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) isUninstallingSystemAppsRestricted];
  if (v2 != result)
  {
    char v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      int v6 = *(unsigned __int8 *)(a1 + 41);
      int v7 = *(unsigned __int8 *)(a1 + 42);
      v8[0] = 67109632;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Changing restriction for uninstalling system apps to %i (Apple account restricted: %i, iTunes Store account restricted: %i)", (uint8_t *)v8, 0x14u);
    }

    return [*(id *)(a1 + 32) setUninstallingSystemAppsRestricted:*(unsigned __int8 *)(a1 + 40)];
  }
  return result;
}

- (unint64_t)_foldersInList:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SBIconController__foldersInList___block_invoke;
  v6[3] = &unk_1E6AFB690;
  v6[4] = &v7;
  [v3 enumerateFolderIconsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __35__SBIconController__foldersInList___block_invoke(uint64_t result)
{
  return result;
}

- (SBIconAnimationContaining)currentAnimationContainer
{
  id v3 = [(SBIconController *)self _currentFolderController];
  unint64_t v4 = v3;
  if (!v3) {
    id v3 = self;
  }
  int v5 = v3;

  return v5;
}

- (void)_mainSwitcherCreated:(id)a3
{
  id v3 = [(SBIconController *)self iconManager];
  [v3 minimumHomeScreenScaleDidChange];
}

- (BOOL)isUpgradeRestore
{
  return [(SBIconController *)self userIconStateFileStatus] == 2;
}

- (BOOL)isEnterpriseMultiUser
{
  int v2 = [(id)SBApp userSessionController];
  char v3 = [v2 isMultiUserSupported];

  return v3;
}

- (BOOL)resetHomeScreenLayout
{
  [MEMORY[0x1E4FA62E0] clearCachesForReason:@"Reset home screen layout"];
  [(SBIconController *)self dismissHomeScreenOverlaysAnimated:0];
  [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider resetForbiddenApplicationIdentifiers];
  [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider overrideCategoryMapForTesting:0];
  [(SBIconController *)self setUserIconStateFileStatus:1];
  char v3 = [(SBIconController *)self iconManager];
  char v4 = [v3 resetIconLayoutWithOptions:1];
  [(SBIconController *)self updateRootFolderWithCurrentDoNotDisturbState];
  int v5 = [(SBIconController *)self rootFolder];
  int v6 = [v5 todayList];
  [(SBIconController *)self _addSmartStackToTodayList:v6 completionHandler:0];

  if ([(SBIconController *)self isUpgradeRestore]
    && ![(SBIconController *)self isEnterpriseMultiUser])
  {
    [v3 addDefaultWidgetsToHomeScreen];
  }
  [v3 removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded:1];
  id v7 = (id)[(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider requestLibraryCategoryMapRefreshWithOptions:7 reason:@"SBIconController requested reset home screen layout."];

  return v4;
}

- (BOOL)resetCategories
{
  [MEMORY[0x1E4FA62E0] clearCachesForReason:@"Reset categories"];
  [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider overrideCategoryMapForTesting:0];
  id v3 = (id)[(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider requestLibraryCategoryMapRefreshWithOptions:7 reason:@"SBIconController requested reset category."];
  return 1;
}

- (BOOL)forbidApplicationBundleIdentifierFromLibrary:(id)a3
{
  return [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider forbidApplicationIdentifier:a3];
}

- (BOOL)unforbidApplicationBundleIdentifierFromLibrary:(id)a3
{
  return [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider unforbidApplicationIdentifier:a3];
}

- (SBHIconImageCache)tableUIIconImageCache
{
  tableUIIconImageCache = self->_tableUIIconImageCache;
  if (!tableUIIconImageCache)
  {
    char v4 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
    [v4 size];
    double v6 = v5;
    double v8 = v7;
    [v4 scale];
    double v10 = v9;
    [v4 continuousCornerRadius];
    int v12 = (SBHIconImageCache *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"tableUIIcon", v6, v8, v10, v11);
    uint64_t v13 = self->_tableUIIconImageCache;
    self->_tableUIIconImageCache = v12;

    tableUIIconImageCache = self->_tableUIIconImageCache;
  }
  return tableUIIconImageCache;
}

- (SBHIconImageCache)notificationIconImageCache
{
  notificationIconImageCache = self->_notificationIconImageCache;
  if (!notificationIconImageCache)
  {
    char v4 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2A8]];
    [v4 size];
    double v6 = v5;
    double v8 = v7;
    [v4 scale];
    double v10 = v9;
    [v4 continuousCornerRadius];
    int v12 = (SBHIconImageCache *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"notificationIcon", v6, v8, v10, v11);
    uint64_t v13 = self->_notificationIconImageCache;
    self->_notificationIconImageCache = v12;

    notificationIconImageCache = self->_notificationIconImageCache;
  }
  return notificationIconImageCache;
}

- (BOOL)_isCoplanarHomeScreenEnabled
{
  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 0;
  }
  return v2;
}

- (BOOL)isShowingHomeScreenOverlay
{
  if ([(SBIconController *)self isTodayOverlayPresented]) {
    return 1;
  }
  return [(SBIconController *)self isMainDisplayLibraryViewVisible];
}

- (void)dismissHomeScreenOverlays
{
}

- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3
{
}

- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    double v7 = dispatch_group_create();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 1;
    dispatch_group_enter(v7);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke;
    v34[3] = &unk_1E6AFB6B8;
    __int16 v36 = v37;
    double v8 = v7;
    id v35 = v8;
    double v9 = (void *)MEMORY[0x1D948C7A0](v34);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 1;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2;
    v29[3] = &unk_1E6AFB6B8;
    id v31 = v32;
    double v10 = v8;
    uint64_t v30 = v10;
    double v11 = (void *)MEMORY[0x1D948C7A0](v29);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3;
    block[3] = &unk_1E6AFB6E0;
    id v26 = v6;
    id v27 = v37;
    uint64_t v28 = v32;
    dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v37, 8);
    if (![(SBIconController *)self isModalAppLibrarySupported])
    {
      if (v10) {
        dispatch_group_enter(v10);
      }
      goto LABEL_16;
    }
  }
  else
  {
    double v9 = 0;
    double v10 = 0;
    double v11 = 0;
    if (![(SBIconController *)self isModalAppLibrarySupported])
    {
LABEL_16:
      [(SBIconController *)self dismissLibraryAnimated:v4 completion:v11];
      goto LABEL_17;
    }
  }
  double v20 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v12 = [(id)SBApp windowSceneManager];
  uint64_t v13 = [v12 connectedWindowScenes];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v10) {
          dispatch_group_enter(v10);
        }
        id v19 = [v18 modalLibraryController];
        [v19 dismissLibraryAnimated:v4 completion:v11];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v39 count:16];
    }
    while (v15);
  }

  double v9 = v20;
LABEL_17:
  [(SBIconController *)self dismissTodayOverlayAnimated:v4 completion:v9];
}

void __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __65__SBIconController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    BOOL v3 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, BOOL))(v2 + 16))(v2, v3);
}

- (void)dismissTodayOverlay
{
}

- (void)dismissTodayOverlayAnimated:(BOOL)a3
{
}

- (void)dismissTodayOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if ([(SBIconController *)self isTodayOverlayPresented])
  {
    [(SBIconController *)self dismissHomeScreenOverlayControllerAnimated:v4 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }
}

- (void)dismissTodayOverlaySpotlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(SBIconController *)self todayViewController];
  SBSafeCast(v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 dismissSpotlightAnimated:v3];
}

- (void)dismissHomeScreenOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBIconController *)self homeScreenOverlayController];
  if ([v7 isPresented])
  {
    double v8 = [(SBIconController *)self userInterfaceController];
    if ([v8 isBackdropVisible]) {
      [v8 beginRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
    }
    [v7 setShouldUseReducedMotionAnimation:UIAccessibilityIsReduceMotionEnabled()];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__SBIconController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke;
    v10[3] = &unk_1E6AFA2A0;
    id v11 = v8;
    id v12 = v7;
    id v13 = v6;
    id v9 = v8;
    [v12 dismissAnimated:v4 completionHandler:v10];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __74__SBIconController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) endRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
  [*(id *)(a1 + 40) setShouldUseReducedMotionAnimation:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dismissHomeScreenOverlayUsingTransitionCoordinator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIconController *)self homeScreenOverlayController];
  if ([v5 isPresented])
  {
    id v6 = [(SBIconController *)self userInterfaceController];
    if ([v6 isBackdropVisible])
    {
      [v6 beginRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _DWORD v8[2] = __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke;
      v8[3] = &unk_1E6AF53F8;
      id v9 = v6;
      [v4 notifyWhenInteractionChangesUsingBlock:v8];
    }
    [v5 dismissUsingViewControllerTransitionCoordinator:v4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2;
    v7[3] = &unk_1E6AF53F8;
    v7[4] = self;
    [v4 animateAlongsideTransition:v7 completion:0];
  }
}

uint64_t __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
}

void __71__SBIconController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _rootFolderController];
  [v1 setSuppressesExtraEditingButtons:0];
}

- (void)setTemporaryIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && !self->_temporaryWidgetIntents)
  {
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    temporaryWidgetIntents = self->_temporaryWidgetIntents;
    self->_temporaryWidgetIntents = v11;
  }
  id v13 = (void *)[[NSString alloc] initWithFormat:@"%@^%@", v9, v10];
  if (v8)
  {
    id v25 = 0;
    uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v25];
    id v15 = v25;
    if (!v14)
    {
      uint64_t v17 = SBLogWidgetIntent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v8 _indexingHash];
        *(_DWORD *)buf = 138544130;
        id v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        id v31 = v13;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_error_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_ERROR, "Error archiving temporary intent widget unique identifier '%{public}@/%lld/%@': %@", buf, 0x2Au);
      }
      goto LABEL_17;
    }
    [(NSMutableDictionary *)self->_temporaryWidgetIntents setObject:v14 forKey:v13];
    uint64_t v16 = [v14 length];
    uint64_t v17 = SBLogWidgetIntent();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = [v8 _indexingHash];
        *(_DWORD *)buf = 138543618;
        id v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v19;
        double v20 = "Saving temporary intent for widget unique identifier '%{public}@'/%lld";
        long long v21 = v17;
        uint32_t v22 = 22;
LABEL_16:
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v10;
      double v20 = "Saving 0-length temporary intent for widget unique identifier '%{public}@'";
      long long v21 = v17;
      uint32_t v22 = 12;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  long long v23 = SBLogWidgetIntent();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = v10;
    __int16 v28 = 2048;
    uint64_t v29 = [0 _indexingHash];
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Removing temporary intent for widget unique identifier '%{public}@'/%lld/%@", buf, 0x20u);
  }

  [(NSMutableDictionary *)self->_temporaryWidgetIntents removeObjectForKey:v13];
LABEL_18:
}

- (id)temporaryIntentDataForIconWithIdentifier:(id)a3 widgetUniqueIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (objc_class *)NSString;
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithFormat:@"%@^%@", v8, v6];

  id v10 = [(NSMutableDictionary *)self->_temporaryWidgetIntents objectForKey:v9];
  id v11 = v10;
  if (v10)
  {
    if ([v10 length]) {
      id v12 = @"HAS DATA";
    }
    else {
      id v12 = @"0 LENGTH INTENT";
    }
  }
  else
  {
    id v12 = @"NIL INTENT";
  }
  id v13 = SBLogWidgetIntent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v16 = v6;
    __int16 v17 = 2112;
    BOOL v18 = v9;
    __int16 v19 = 2114;
    double v20 = v12;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Fetching temporary intent for widget unique identifier '%{public}@' / %@; has data? %{public}@",
      buf,
      0x20u);
  }

  return v11;
}

- (BOOL)allowsHomeScreenOverlay
{
  BOOL v3 = [(id)SBApp userSessionController];
  BOOL v4 = [v3 sessionType] != 2;

  uint64_t v5 = [(SBIconController *)self iconManager];
  LOBYTE(v3) = v4 & ~[v5 isFolderPageManagementUIVisible];

  return (char)v3;
}

- (void)_bookmarkDidUninstall:(id)a3
{
  objc_msgSend((id)SBApp, "noteInstalledWebClipsDidChange", a3);
  id v3 = [MEMORY[0x1E4F4AEB8] sharedInstance];
  [v3 notifyBookmarksDidChange];
}

- (BOOL)shouldAddNewIconsToRootFolder
{
  uint64_t v2 = +[SBDefaults localDefaults];
  id v3 = [v2 homeScreenDefaults];

  int v4 = [v3 automaticallyAddsNewApplications];
  if (([v3 automaticallyAddsNewApplicationsExists] & 1) == 0) {
    v4 &= ~[v3 pagesHaveEverBeenHidden];
  }

  return v4;
}

- (void)prepareForImminentExit
{
}

- (void)runWidgetDiscoverabilityTest
{
  id v3 = [(SBIconController *)self iconManager];
  [v3 removeWidgetIconsFromHomeScreen];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconController_runWidgetDiscoverabilityTest__block_invoke;
  v4[3] = &unk_1E6AF5350;
  v4[4] = self;
  [(SBIconController *)self _obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:v4];
}

uint64_t __48__SBIconController_runWidgetDiscoverabilityTest__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction];
  }
  return result;
}

- (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4
{
  id v7 = [(SBIconController *)self iconManager];
  id v20 = [v7 listLayoutProvider];

  id v8 = [v20 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
  id v9 = [(SBIconController *)self homeScreenViewController];
  id v10 = [v9 iconContentView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  BOOL v19 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
  objc_msgSend(MEMORY[0x1E4FA6468], "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forListLayout:withTranslationOffset:inRTL:", a3, a4, v8, v19, v12, v14, v16, v18, 0.0);
}

- (void)enumerateTintableViewControllersUsingBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void *))a3;
  if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
  {
    uint64_t v5 = [(SBIconController *)self homeScreenViewController];
    v4[2](v4, v5);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__SBIconController_enumerateTintableViewControllersUsingBlock___block_invoke;
  v23[3] = &unk_1E6AFB708;
  id v6 = v4;
  uint64_t v24 = v6;
  double v18 = self;
  [(SBIconController *)self _enumerateTodayViewControllers:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(id)SBApp windowSceneManager];
  id v8 = [v7 connectedWindowScenes];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v14 = [v13 modalLibraryController];
        double v15 = [v14 libraryViewController];
        if (v15) {
          v6[2](v6, v15);
        }
        double v16 = [v13 floatingDockController];
        double v17 = [v16 viewController];
        if (v17) {
          v6[2](v6, v17);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  if (v18->_overlayLibraryViewController) {
    ((void (*)(void (**)(id, void *)))v6[2])(v6);
  }
}

uint64_t __63__SBIconController_enumerateTintableViewControllersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateHomeScreenTraitOverridesForViewController:(id)a3
{
  id v4 = [a3 traitOverrides];
  [(SBIconController *)self updateHomeScreenTraitOverridesForTraitOverrides:v4];
}

- (void)updateHomeScreenTraitOverridesForWindowScene:(id)a3
{
  id v4 = [a3 traitOverrides];
  [(SBIconController *)self updateHomeScreenTraitOverridesForTraitOverrides:v4];
}

- (void)updateHomeScreenTraitOverridesForTraitOverrides:(id)a3
{
  iconManager = self->_iconManager;
  id v5 = a3;
  id v7 = [(SBIconController *)self iconStylePickerConfigurationForIconManager:iconManager];
  id v6 = self;
  if (v7) {
    [v5 setObject:v7 forTrait:v6];
  }
  else {
    [v5 removeTrait:v6];
  }
}

- (id)iconStylePickerConfigurationForIconManager:(id)a3
{
  return [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator currentStyleConfiguration];
}

- (void)updateStyleConfiguration:(id)a3 forIconManager:(id)a4
{
}

- (void)iconManagerWantsIconSizeToggled:(id)a3
{
  iconStyleCoordinator = self->_iconStyleCoordinator;
  uint64_t v4 = [(SBWallpaperIconStyleCoordinator *)iconStyleCoordinator shouldUseLargeHomeScreenIcons] ^ 1;
  [(SBWallpaperIconStyleCoordinator *)iconStyleCoordinator setShouldUseLargeHomeScreenIcons:v4];
}

- (BOOL)shouldUseHomeScreenLargeIconSizeForIconManager:(id)a3
{
  return [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator shouldUseLargeHomeScreenIcons];
}

- (void)removeHomeScreenTraitOverridesForViewController:(id)a3
{
  id v4 = [a3 traitOverrides];
  id v3 = self;
  [v4 removeTrait:v3];
}

- (void)setCurrentHomeScreenIconStyleConfiguration:(id)a3
{
  objc_msgSend(a3, "sb_iconImageStyleConfiguration");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 homeScreenConfiguration];
  [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator setCurrentStyleConfiguration:v4];
  [(SBIconController *)self iconStyleCoordinatorDidUpdate:self->_iconStyleCoordinator];
}

- (SBHIconImageAppearance)currentIconImageAppearance
{
  uint64_t v2 = [(SBIconController *)self rootViewController];
  id v3 = [v2 traitCollection];
  id v4 = objc_msgSend(MEMORY[0x1E4F42F80], "sbh_iconImageAppearanceFromTraitCollection:", v3);

  return (SBHIconImageAppearance *)v4;
}

- (void)deleteAllWebClips
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBIconController *)self iconManager];
  id v3 = [v2 iconModel];
  id v4 = [v3 leafIcons];
  id v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_334);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v2, "uninstallIcon:animate:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), 0, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

uint64_t __37__SBIconController_deleteAllWebClips__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBookmarkIcon];
}

- (BOOL)isLargeIconSizeEnabled
{
  return [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator shouldUseLargeHomeScreenIcons];
}

- (void)setLargeIconSizeEnabled:(BOOL)a3
{
}

- (NSString)description
{
  return (NSString *)[(SBIconController *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)addIconStyleObserver:(id)a3
{
  id v4 = a3;
  iconStyleObservers = self->_iconStyleObservers;
  id v8 = v4;
  if (!iconStyleObservers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_iconStyleObservers;
    self->_iconStyleObservers = v6;

    id v4 = v8;
    iconStyleObservers = self->_iconStyleObservers;
  }
  [(NSHashTable *)iconStyleObservers addObject:v4];
}

- (void)removeIconStyleObserver:(id)a3
{
}

- (void)informIconStyleObserversOfStyleChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBIconController *)self currentIconStyleConfiguration];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_iconStyleObservers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) iconStyleProvider:self didUpdateIconStyleConfiguration:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_registerAnalytics
{
  objc_initWeak(&location, self);
  id v3 = [(SBIconController *)self analyticsClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__SBIconController__registerAnalytics__block_invoke;
  v9[3] = &unk_1E6AFB778;
  objc_copyWeak(&v10, &location);
  [v3 registerForQueryName:0 handler:v9];

  id v4 = [(SBIconController *)self analyticsClient];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SBIconController__registerAnalytics__block_invoke_2;
  v7[3] = &unk_1E6AFB778;
  objc_copyWeak(&v8, &location);
  [v4 registerForQueryName:2 handler:v7];

  uint64_t v5 = [(SBIconController *)self analyticsClient];
  [v5 registerForQueryName:3 handler:&__block_literal_global_343];

  uint64_t v6 = [(SBIconController *)self analyticsClient];
  [v6 registerForQueryName:1 handler:&__block_literal_global_345];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __38__SBIconController__registerAnalytics__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__21;
  long long v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SBIconController__registerAnalytics__block_invoke_339;
  v3[3] = &unk_1E6AFB750;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3[4] = &v5;
  dispatch_sync(MEMORY[0x1E4F14428], v3);
  id v1 = (id)v6[5];
  objc_destroyWeak(&v4);
  _Block_object_dispose(&v5, 8);

  return v1;
}

void __38__SBIconController__registerAnalytics__block_invoke_339(uint64_t a1)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained rootFolder];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 dock];
      v16[0] = *MEMORY[0x1E4FA7508];
      uint64_t v7 = NSNumber;
      id v8 = [v5 folderIcons];
      long long v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v17[0] = v9;
      v16[1] = *MEMORY[0x1E4FA7518];
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "listCount"));
      v17[1] = v10;
      v16[2] = *MEMORY[0x1E4FA7510];
      long long v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "numberOfIcons"));
      v17[2] = v11;
      v16[3] = *MEMORY[0x1E4FA7500];
      long long v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "_foldersInList:", v6));
      v17[3] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      double v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

id __38__SBIconController__registerAnalytics__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__21;
  long long v9 = __Block_byref_object_dispose__21;
  id v10 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SBIconController__registerAnalytics__block_invoke_3;
  v3[3] = &unk_1E6AFB750;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3[4] = &v5;
  dispatch_sync(MEMORY[0x1E4F14428], v3);
  id v1 = (id)v6[5];
  objc_destroyWeak(&v4);
  _Block_object_dispose(&v5, 8);

  return v1;
}

void __38__SBIconController__registerAnalytics__block_invoke_3(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained rootFolder];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 visibleListCount];
      uint64_t v7 = [v5 hiddenListCount];
      v13[0] = *MEMORY[0x1E4FA7570];
      id v8 = [NSNumber numberWithUnsignedInteger:v6];
      v14[0] = v8;
      v13[1] = *MEMORY[0x1E4FA7568];
      long long v9 = [NSNumber numberWithUnsignedInteger:v7];
      v14[1] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

id __38__SBIconController__registerAnalytics__block_invoke_4()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3032000000;
  uint64_t v6 = __Block_byref_object_copy__21;
  uint64_t v7 = __Block_byref_object_dispose__21;
  id v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBIconController__registerAnalytics__block_invoke_5;
  block[3] = &unk_1E6AF56B0;
  void block[4] = &v3;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

void __38__SBIconController__registerAnalytics__block_invoke_5(uint64_t a1)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[SBDefaults localDefaults];
  uint64_t v3 = [v2 homeScreenDefaults];

  id v4 = +[SBDefaults localDefaults];
  uint64_t v5 = [v4 floatingDockDefaults];

  int v6 = [v3 automaticallyAddsNewApplications];
  uint64_t v7 = (id *)MEMORY[0x1E4FA6648];
  if (v6) {
    uint64_t v7 = (id *)MEMORY[0x1E4FA66D0];
  }
  id v8 = *v7;
  uint64_t v9 = [v3 automaticallyAddsNewApplicationsExists];
  uint64_t v10 = [v3 pagesHaveEverBeenHidden];
  uint64_t v11 = [v5 appLibraryEnabled] ^ 1;
  v20[0] = *MEMORY[0x1E4FA7520];
  long long v12 = [NSNumber numberWithBool:v10];
  uint64_t v13 = *MEMORY[0x1E4FA75E8];
  v21[0] = v12;
  v21[1] = v8;
  uint64_t v14 = *MEMORY[0x1E4FA75E0];
  v20[1] = v13;
  v20[2] = v14;
  double v15 = [NSNumber numberWithBool:v9];
  v21[2] = v15;
  v20[3] = *MEMORY[0x1E4FA7578];
  uint64_t v16 = [NSNumber numberWithBool:v11];
  v21[3] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

id __38__SBIconController__registerAnalytics__block_invoke_6()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3032000000;
  int v6 = __Block_byref_object_copy__21;
  uint64_t v7 = __Block_byref_object_dispose__21;
  id v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBIconController__registerAnalytics__block_invoke_7;
  block[3] = &unk_1E6AF56B0;
  void block[4] = &v3;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

void __38__SBIconController__registerAnalytics__block_invoke_7(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[SBDefaults localDefaults];
  uint64_t v3 = [v2 floatingDockDefaults];

  uint64_t v4 = [v3 recentsEnabled];
  uint64_t v9 = *MEMORY[0x1E4FA74B0];
  uint64_t v5 = [NSNumber numberWithBool:v4];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)createFloatingDockControllerForWindowScene:(id)a3
{
  id v4 = a3;
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    uint64_t v5 = [[SBFloatingDockController alloc] initWithWindowScene:v4 homeScreenContextProvider:self];
    [(SBIconController *)self _configureFloatingDockController:v5 forWindowScene:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_configureFloatingDockController:(id)a3 forWindowScene:(id)a4
{
  id v6 = a3;
  [v6 registerForWindowScene:a4];
  [(SBIconController *)self notifyFloatingDockControllerObserversDidRegister:v6];
}

- (void)addFloatingDockControllerObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBIconController.m" lineNumber:2075 description:@"cannot be observed by a nil object"];

    id v5 = 0;
  }
  if (![(NSHashTable *)self->_floatingDockControllerObservers containsObject:v5])
  {
    floatingDockControllerObservers = self->_floatingDockControllerObservers;
    if (!floatingDockControllerObservers)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v8 = self->_floatingDockControllerObservers;
      self->_floatingDockControllerObservers = v7;

      floatingDockControllerObservers = self->_floatingDockControllerObservers;
    }
    [(NSHashTable *)floatingDockControllerObservers addObject:v10];
  }
}

- (void)removeFloatingDockControllerObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBIconController.m" lineNumber:2085 description:@"cannot be observed by a nil object"];

    id v5 = 0;
  }
  [(NSHashTable *)self->_floatingDockControllerObservers removeObject:v5];
}

- (void)notifyFloatingDockControllerObserversDidRegister:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_floatingDockControllerObservers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 floatingDockControllerDidRegister:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)preferredFocusEnvironments
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBIconController *)self _currentFolderController];
  id v4 = [(SBIconController *)self homeScreenOverlayController];
  id v5 = [(SBIconController *)self mainDisplayWindowScene];
  uint64_t v6 = [v5 modalLibraryController];

  if ([v4 isPresented])
  {
    uint64_t v7 = [v4 viewController];
    v14[0] = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = (void **)v14;
LABEL_5:
    id v10 = [v8 arrayWithObjects:v9 count:1];

    goto LABEL_6;
  }
  if ([v6 isPresentingLibraryInForeground])
  {
    uint64_t v7 = [v6 libraryViewController];
    long long v13 = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = &v13;
    goto LABEL_5;
  }
  if (v3)
  {
    long long v12 = v3;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_6:

  return v10;
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  id v14 = [(SBIconController *)self searchPresentableViewController];
  [v14 invalidateBackgroundView];
  [v14 invalidateSearchAffordanceView];
  uint64_t v4 = [(SBIconController *)self scrollAccessoryAuxiliaryView];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [(SBIconController *)self searchPresenter];
    int v7 = [v6 isPresenting];

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [(SBIconController *)self _rootFolderController];
      id v10 = [v9 contentView];
      long long v11 = SBSafeCast(v8, v10);

      if (UIAccessibilityIsReduceMotionEnabled()) {
        double v12 = 1.0;
      }
      else {
        double v12 = 0.0;
      }
      long long v13 = [v11 scrollAccessoryView];
      [v13 setAlpha:v12];
    }
  }
}

- (void)handleNavigationCommand:(id)a3 withDirection:(int64_t)a4
{
  uint64_t v6 = objc_msgSend((id)SBApp, "windowSceneManager", a3);
  uint64_t v41 = [v6 activeDisplayWindowScene];

  int v7 = [v41 isMainDisplayWindowScene];
  uint64_t v8 = v41;
  if (!v7) {
    goto LABEL_79;
  }
  BOOL v9 = [(SBIconController *)self isModalAppLibrarySupported];
  BOOL v10 = v9;
  if (a4 == 4)
  {
    if (v9)
    {
      long long v11 = [v41 modalLibraryController];
      double v12 = [v11 libraryViewController];
      char v13 = [v11 isPresentingLibrary];

      if (v13)
      {
LABEL_5:
        [(SBHLibraryViewController *)v12 popPresentationState];
        int v14 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      double v12 = self->_overlayLibraryViewController;
      double v15 = [(SBIconController *)self iconManager];
      int v16 = [v15 isMainDisplayLibraryViewVisible];

      if (v16) {
        goto LABEL_5;
      }
    }
    int v14 = 0;
    goto LABEL_9;
  }
  int v14 = 0;
LABEL_10:
  BOOL v17 = [(SBIconController *)self areHomeScreenIconsOccluded];
  uint64_t v8 = v41;
  if (!v17)
  {
    int v18 = [v41 isMainDisplayWindowScene];
    uint64_t v8 = v41;
    if (v18)
    {
      long long v19 = [(SBIconController *)self _currentFolderController];
      long long v20 = [(SBIconController *)self _rootFolderController];
      uint64_t v21 = [v19 currentPageIndex];
      uint64_t v22 = [v19 contentVisibility];
      if (v21 == [v19 firstIconPageIndex]) {
        char v23 = v14;
      }
      else {
        char v23 = 1;
      }
      char v24 = v14;
      if ((v23 & 1) == 0)
      {
        char v24 = v14;
        if (v19 == v20)
        {
          BOOL v25 = [(SBIconController *)self isTodayOverlayPresented];
          if (a4 != 1 || v25 || v22)
          {
            if ((a4 == 4 || a4 == 2) && v25)
            {
              char v24 = 1;
              [(SBIconController *)self dismissTodayOverlayAnimated:1];
            }
            else
            {
              char v24 = 0;
            }
          }
          else
          {
            uint64_t v26 = [(SBIconController *)self iconManager];
            [(SBIconController *)self presentTodayOverlayForIconManager:v26];

            char v24 = 1;
          }
        }
      }
      if (v10)
      {
        uint64_t v27 = [v20 trailingCustomViewPageIndex];
        if (v21 == [v19 lastIconPageIndex]) {
          char v28 = v24;
        }
        else {
          char v28 = 1;
        }
        if ((v28 & 1) == 0 && v19 == v20 && a4 == 2 && !v22)
        {
          uint64_t v29 = v19;
          uint64_t v30 = v27;
          goto LABEL_35;
        }
        if (v21 == v27) {
          char v33 = v24;
        }
        else {
          char v33 = 1;
        }
        if (a4 == 1 && (v33 & 1) == 0 && v19 == v20)
        {
          uint64_t v34 = [v41 modalLibraryController];
          [v34 dismissLibraryAnimated:1 completion:0];

          goto LABEL_78;
        }
      }
      else
      {
        if (v21 == [v19 lastIconPageIndex]) {
          char v31 = v24;
        }
        else {
          char v31 = 1;
        }
        if ((v31 & 1) == 0 && v19 == v20)
        {
          if (a4 == 2) {
            char v32 = v14;
          }
          else {
            char v32 = 1;
          }
          if ((v32 & 1) == 0 && !v22)
          {
            [(SBIconController *)self presentLibraryFromOverlayControllerAnimated:1 completion:0];
            goto LABEL_78;
          }
          if ((a4 == 4 || a4 == 1) && v14)
          {
            [(SBIconController *)self dismissLibraryAnimated:1 completion:0];
            goto LABEL_78;
          }
          char v24 = 0;
        }
      }
      if (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL || (v24)
      {
        if (a4 == 4) {
          char v36 = v24;
        }
        else {
          char v36 = 1;
        }
        if ((v36 & 1) == 0 && !v22)
        {
          if ([v19 isOpen])
          {
            char v37 = [v19 folder];
            char v38 = [v37 isRootFolder];

            if ((v38 & 1) == 0) {
              [v19 _closeFolder];
            }
          }
        }
        goto LABEL_78;
      }
      if (a4 == 2) {
        uint64_t v35 = v21 + 1;
      }
      else {
        uint64_t v35 = v21 - 1;
      }
      if (v22 || ![v19 _isValidPageIndex:v35])
      {
LABEL_78:

        uint64_t v8 = v41;
        goto LABEL_79;
      }
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2
          && ![v19 doesPageContainIconListView:v35])
        {
          goto LABEL_78;
        }
      }
      else
      {
        __int16 v39 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v39 userInterfaceIdiom] == 1)
        {
          char v40 = [v19 doesPageContainIconListView:v35];

          if ((v40 & 1) == 0) {
            goto LABEL_78;
          }
        }
        else
        {
        }
      }
      uint64_t v29 = v19;
      uint64_t v30 = v35;
LABEL_35:
      [v29 setCurrentPageIndex:v30 animated:1];
      goto LABEL_78;
    }
  }
LABEL_79:
}

- (void)_configureEditingGestureRecognizers
{
  if (!self->_longPressToEditGestureRecognizer)
  {
    uint64_t v3 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleEditingGesture_];
    longPressToEditGestureRecognizer = self->_longPressToEditGestureRecognizer;
    self->_longPressToEditGestureRecognizer = v3;

    [(UILongPressGestureRecognizer *)self->_longPressToEditGestureRecognizer setDelegate:self];
    id v5 = [(SBIconController *)self homeScreenViewController];
    uint64_t v6 = [v5 view];
    [v6 addGestureRecognizer:self->_longPressToEditGestureRecognizer];
  }
  if (!self->_tapToEndEditingGestureRecognizer)
  {
    int v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleEditingGesture_];
    tapToEndEditingGestureRecognizer = self->_tapToEndEditingGestureRecognizer;
    self->_tapToEndEditingGestureRecognizer = v7;

    [(UITapGestureRecognizer *)self->_tapToEndEditingGestureRecognizer setDelegate:self];
    BOOL v9 = [(SBIconController *)self homeScreenViewController];
    BOOL v10 = [v9 view];
    [v10 addGestureRecognizer:self->_tapToEndEditingGestureRecognizer];
  }
  long long v11 = self->_longPressToEditGestureRecognizer;
  [(SBHIconEditingSettings *)self->_iconEditingSettings longPressToEditDuration];
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v11, "setMinimumPressDuration:");
}

- (void)_handleEditingGesture:(id)a3
{
  uint64_t v8 = (UITapGestureRecognizer *)a3;
  uint64_t v4 = [(SBIconController *)self iconManager];
  if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v8)
  {
    if ([(UITapGestureRecognizer *)v8 state] == 1)
    {
      id v5 = [v4 iconEditingFeedbackBehavior];
      uint64_t v6 = [(SBIconController *)self homeScreenViewController];
      int v7 = [v6 view];
      [(UITapGestureRecognizer *)v8 locationInView:v7];
      objc_msgSend(v4, "setEditing:withFeedbackBehavior:location:", 1, v5);

      [(UITapGestureRecognizer *)v8 setEnabled:0];
      [(UITapGestureRecognizer *)v8 setEnabled:1];
    }
  }
  else if (self->_tapToEndEditingGestureRecognizer == v8)
  {
    objc_msgSend(v4, "setEditing:withFeedbackBehavior:location:", 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (BOOL)_shouldTodayViewController:(id)a3 receiveTouch:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4 isSpotlightVisible] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_longPressToEditGestureRecognizer == a3
    && (self,
        int v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_isKindOfClass(),
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = [v6 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)areHomeScreenIconsOccluded
{
  return [(SBIconController *)self iconOcclusionReasons] != 0;
}

- (void)removeIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(SBIconController *)self iconOcclusionReasons];
  if ((v7 & a3) != 0)
  {
    [(SBIconController *)self setIconOcclusionReasons:v7 & ~a3];
    if (v4)
    {
      [(SBIconController *)self _updateVisibleIconsAfterOcclusionChange];
    }
  }
}

- (id)markIconsOccludedForReason:(id)a3
{
  id v4 = a3;
  if (!self->_iconsOccludedAssertions)
  {
    int v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconsOccludedAssertions = self->_iconsOccludedAssertions;
    self->_iconsOccludedAssertions = v5;
  }
  unint64_t v7 = [[SBIconsOccludedAssertion alloc] initWithInvalidator:self reason:v4];
  [(NSHashTable *)self->_iconsOccludedAssertions addObject:v7];
  [(SBIconController *)self addIconOcclusionReason:64 updateVisibleIcons:1];

  return v7;
}

- (void)removeIconsOccludedAssertion:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_iconsOccludedAssertions, "containsObject:"))
  {
    [(NSHashTable *)self->_iconsOccludedAssertions removeObject:v4];
    if (![(NSHashTable *)self->_iconsOccludedAssertions count]) {
      [(SBIconController *)self removeIconOcclusionReason:64 updateVisibleIcons:1];
    }
  }
}

- (void)_coverSheetWillPresent:(id)a3
{
  id v4 = [(SBIconController *)self iconManager];
  [v4 setEditing:0];

  id v5 = [(SBIconController *)self iconManager];
  [v5 cancelAllDrags];
}

- (void)_coverSheetDidPresent:(id)a3
{
}

- (void)_controlCenterWillPresent:(id)a3
{
  [(SBIconController *)self addIconOcclusionReason:4 updateVisibleIcons:1];
  id v4 = [(SBIconController *)self iconManager];
  [v4 setEditing:0];

  id v5 = [(SBIconController *)self iconManager];
  [v5 cancelAllDrags];
}

- (void)_controlCenterWillDismiss:(id)a3
{
}

- (void)_policyAggregatorCapabilitiesDidChange:(id)a3
{
  id v5 = [(SBIconController *)self policyAggregator];
  if (([v5 allowsCapability:23] & 1) == 0) {
    [(SBIconController *)self dismissTodayOverlay];
  }
  if (([v5 allowsCapability:17] & 1) == 0)
  {
    id v4 = [(SBIconController *)self iconManager];
    [v4 setEditing:0];
  }
}

- (void)_installedAppsDidChange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [v4 userInfo];
  unint64_t v7 = [v6 objectForKey:@"SBInstalledApplicationsAddedBundleIDs"];

  char v8 = [v4 userInfo];
  BOOL v9 = [v8 objectForKey:@"SBInstalledApplicationsRemovedBundleIDs"];

  BOOL v10 = [v4 userInfo];
  long long v11 = [v10 objectForKey:@"SBInstalledApplicationsReplacedBundleIDs"];

  double v12 = [v4 userInfo];
  char v13 = [v12 objectForKey:@"SBInstalledApplicationsUpdatedBundleIDs"];

  uint64_t v34 = v7;
  if ([v7 count]
    || [v9 count]
    || [v11 count]
    || [v13 count])
  {
    id v32 = v4;
    char v33 = v9;
    int v14 = objc_opt_new();
    uint64_t v15 = objc_opt_class();
    int v16 = [(SBIconController *)self rootFolder];
    [v16 addIconsOfClass:v15 toSet:v14];

    [(SBHIconModel *)self->_iconModel addIconsOfClass:v15 toSet:v14];
    char v31 = self;
    uint64_t v30 = [(SBIconController *)self mainDisplayWindowScene];
    uint64_t v29 = [v30 floatingDockController];
    BOOL v17 = [v29 suggestionsIconListView];
    int v18 = [v17 model];
    [v18 addIconsOfClass:v15 toSet:v14];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = v14;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v20) {
      goto LABEL_23;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    while (1)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        char v24 = *(void **)(*((void *)&v35 + 1) + 8 * v23);
        if (([v24 hasApplicationPlaceholder] & 1) == 0)
        {
          BOOL v25 = [v24 applicationBundleID];
          if (([v11 containsObject:v25] & 1) != 0
            || ([v13 containsObject:v25] & 1) != 0)
          {
            [v24 removeApplicationDataSources];
            goto LABEL_14;
          }
          if ([v33 containsObject:v25]) {
            [v24 removeApplicationDataSources];
          }
          if ([v34 containsObject:v25])
          {
LABEL_14:
            uint64_t v26 = [v5 applicationWithBundleIdentifier:v25];
            [v24 addApplicationDataSource:v26];
          }
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v27 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v21 = v27;
      if (!v27)
      {
LABEL_23:

        BOOL v9 = v33;
        [(SBIconController *)v31 _mutateIconListsForInstalledAppsDidChangeWithController:v5 added:v34 modified:v11 removed:v33];
        char v28 = [(SBIconController *)v31 model];
        [(SBIconController *)v31 _iconModelInstalledAppsDidChange:v28];

        id v4 = v32;
        break;
      }
    }
  }
}

- (void)_mutateIconListsForInstalledAppsDidChangeWithController:(id)a3 added:(id)a4 modified:(id)a5 removed:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v55 = self;
  if ([(SBIconController *)self _ignoreMutatingIconListsOnApplicationInstall])
  {
    goto LABEL_49;
  }
  int v14 = [MEMORY[0x1E4F1CA80] set];
  [v14 unionSet:v11];
  [v14 unionSet:v12];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v53 = v14;
  if ([v14 count] || objc_msgSend(v13, "count"))
  {
    v54 = v15;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v22 = [v10 applicationWithBundleIdentifier:v21];
          if ([v11 containsObject:v21])
          {
            [v54 addObject:v22];
            [v22 setRestoringIcon:1];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v18);
    }

    uint64_t v23 = [(SBIconController *)v55 model];
    v49 = [v23 rootFolder];
    char v24 = [v49 hasHiddenLists];
    if ([v54 count] == 1)
    {
      uint64_t v25 = [v54 anyObject];
    }
    else
    {
      uint64_t v25 = 0;
    }
    id v52 = v10;
    if ([v13 count] == 1)
    {
      uint64_t v26 = [v13 anyObject];
      uint64_t v27 = (void *)v26;
      if (v25) {
        char v28 = v24;
      }
      else {
        char v28 = 1;
      }
      if (v28)
      {
        if (!v26)
        {
LABEL_30:
          id v50 = v13;
          id v51 = v12;
          -[SBIconController _iconModel:wantsToRevealAnyApplicationFromIdentifiers:](v55, "_iconModel:wantsToRevealAnyApplicationFromIdentifiers:", v23, v16, v25);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v32 = v16;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v69 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v61;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v61 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                long long v38 = [v23 applicationIconForBundleIdentifier:v37];
                if ([v38 hasApplicationPlaceholder])
                {
                  __int16 v39 = [(SBIconController *)v55 applicationPlaceholderController];
                  uint64_t v40 = [v39 placeholderForDisplayID:v37];

                  if (!v40)
                  {
                    uint64_t v41 = (void *)MEMORY[0x1E4F78060];
                    v42 = [NSString stringWithFormat:@"Removing downloading icon because app installed without ever receiving a placeholder."];
                    [v41 logStep:5 byParty:10 phase:3 success:1 forBundleID:v37 description:v42];

                    [v38 removeApplicationPlaceholderDataSources];
                  }
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v60 objects:v69 count:16];
            }
            while (v34);
          }

          id v12 = v51;
          id v10 = v52;
          id v13 = v50;
          id v15 = v54;
          goto LABEL_41;
        }
        id v29 = (id)[v23 removeApplicationWithBundleIdentifier:v26 pruneEmptyIcons:1];
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if (v25) {
        char v30 = v24;
      }
      else {
        char v30 = 1;
      }
      if (v30) {
        goto LABEL_30;
      }
      uint64_t v27 = 0;
    }
    id v31 = (id)[v23 addApplication:v25];
    goto LABEL_29;
  }
LABEL_41:
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v43 = v15;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v57 != v46) {
          objc_enumerationMutation(v43);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * k) setRestoringIcon:0];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v45);
  }

LABEL_49:
}

- (void)_iconModelInstalledAppsDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBIconController *)self _libraryViewControllers];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) noteInstalledApplicationsDidChange];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  id v10 = [(SBIconController *)self iconManager];
  [v10 checkForInvalidCustomElements];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 iconModelInstalledAppsDidChange:v4];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)_iconModel:(id)a3 wantsToRevealAnyApplicationFromIdentifiers:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBIconController *)self iconManager];
  uint64_t v9 = [v7 anyObject];
  uint64_t v35 = (void *)v9;
  if (v9)
  {
    uint64_t v10 = [v6 applicationIconForBundleIdentifier:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [(SBIconController *)self layoutStateProvider];
  uint64_t v12 = [v11 layoutState];
  uint64_t v13 = [v12 unlockedEnvironmentMode];

  long long v36 = (void *)v10;
  if ((unint64_t)[v7 count] < 2)
  {
    if (v10)
    {
      if (v13 == 3) {
        uint64_t v23 = 4;
      }
      else {
        uint64_t v23 = 6;
      }
      [v8 addNewIconToDesignatedLocation:v10 options:v23];
    }
  }
  else if (v13 != 3 && v10)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v14 = v7;
    uint64_t v33 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v33)
    {
      uint64_t v15 = *(void *)v46;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v14);
          }
          uint64_t v17 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v18 = objc_msgSend(v6, "applicationIconsForBundleIdentifier:", v17, v32);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v52 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v42 != v21) {
                  objc_enumerationMutation(v18);
                }
                if ([v8 isDisplayingIcon:*(void *)(*((void *)&v41 + 1) + 8 * j)])
                {

                  long long v24 = SBLogIconController();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v51 = v35;
                    _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Skipping revealing added/modified icon: %@", buf, 0xCu);
                  }

                  goto LABEL_31;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v52 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          uint64_t v15 = v32;
          uint64_t v10 = (uint64_t)v36;
        }
        uint64_t v33 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v33);
    }

    [v8 scrollToIconListContainingIcon:v10 animate:1];
  }
LABEL_31:
  uint64_t v34 = v8;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v25 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        char v30 = *(void **)(*((void *)&v37 + 1) + 8 * k);
        if (objc_opt_respondsToSelector())
        {
          id v31 = (void *)[v7 copy];
          [v30 iconModel:v6 wantsToRevealAnyApplicationFromIdentifiers:v31];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v27);
  }
}

- (void)_backupRestoringDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBIconController *)self model];
  id v5 = +[SBSyncController sharedInstance];
  uint64_t v6 = [v5 isRestoring];

  [v4 setRestoring:v6];
  if ((v6 & 1) == 0)
  {
    id v7 = [(SBIconController *)self iconManager];
    [v7 checkForInvalidWidgets];

    uint64_t v8 = [(SBIconController *)self iconManager];
    [v8 checkForInvalidCustomElements];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 iconModel:v4 backupRestoringStatusDidChange:v6];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_updateIconModelStore
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  id v4 = [v3 restrictionEnforcedHomeScreenLayout];

  if (!v4
    || (id v5 = [[SBIconProfileModelMemoryStore alloc] initWithITunesRepresentation:v4]) == 0)
  {
    if (self->_visibleTags) {
      goto LABEL_32;
    }
    id v7 = SBLogIconController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "No visible tag information available when creating icon model for first time", (uint8_t *)&v19, 2u);
    }

    id v5 = (SBReadOnlyDefaultIconModelStore *)objc_alloc_init(MEMORY[0x1E4FA6428]);
    if (!v5)
    {
LABEL_32:
      if (!self->_isAppAllowlistActiveAndTransient) {
        goto LABEL_8;
      }
      uint64_t v6 = SBLogIconController();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Using read-only variant of default icon model store because app allowlist is being treated as transient", (uint8_t *)&v19, 2u);
      }

      id v5 = objc_alloc_init(SBReadOnlyDefaultIconModelStore);
      if (!v5)
      {
LABEL_8:
        id v5 = +[SBDefaultIconModelStore sharedInstance];
      }
    }
  }
  uint64_t v8 = [(SBIconController *)self model];
  uint64_t v9 = [(SBHIconModel *)v8 store];

  uint64_t v10 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(SBHIconModel *)v8 store];
    int v19 = 138412546;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    long long v22 = v5;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "iconModelStore(%@), store(%@)", (uint8_t *)&v19, 0x16u);
  }
  if (v9 != v5)
  {
    [(SBIconController *)self setHasRestrictedEnforcedLayout:v4 != 0];
    uint64_t v12 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v14 = [(SBReadOnlyDefaultIconModelStore *)v5 currentIconStateURL];
      if ([v14 checkResourceIsReachableAndReturnError:0]) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 1;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    [(SBIconController *)self setUserIconStateFileStatus:v15];
    long long v16 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [(SBIconController *)self userIconStateFileStatus];
      int v19 = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Icon state = %d", (uint8_t *)&v19, 8u);
    }

    if (v8)
    {
      [(SBHIconModel *)v8 setStore:v5];
      if (v4)
      {
LABEL_25:
        long long v18 = +[SBDefaultIconModelStore sharedInstance];
LABEL_28:
        [(SBHIconModel *)v8 setTodayListsStore:v18];

        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v8 = [(SBHIconModel *)[SBIconModel alloc] initWithStore:v5 applicationDataSource:self];
      [(SBHIconModel *)v8 setPostsDidAddIconNotification:0];
      [(SBIconController *)self setModel:v8];
      if (v4) {
        goto LABEL_25;
      }
    }
    long long v18 = 0;
    goto LABEL_28;
  }
LABEL_29:
}

- (void)setModel:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = (SBIconModel *)a3;
  p_iconModel = &self->_iconModel;
  if (self->_iconModel != v5)
  {
    id v7 = [(SBIconController *)self iconManager];
    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4FA66F0];
    [v8 removeObserver:self name:*MEMORY[0x1E4FA66F0] object:self->_iconModel];
    categoryMapProvider = self->_categoryMapProvider;
    self->_categoryMapProvider = 0;

    uint64_t v11 = [(SBIconController *)self overlayLibraryViewController];
    [v11 invalidate];

    [(SBIconController *)self setOverlayLibraryViewController:0];
    [v7 setOverlayLibraryViewController:0];
    [(SBIconController *)self setHomeScreenOverlayController:0];
    uint64_t v12 = SBLogIcon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[SBIconController setModel:]();
    }

    objc_storeStrong((id *)&self->_iconModel, a3);
    iconModel = self->_iconModel;
    id v14 = +[SBSyncController sharedInstance];
    -[SBHIconModel setRestoring:](iconModel, "setRestoring:", [v14 isRestoring]);

    [(SBHIconModel *)self->_iconModel reloadIcons];
    if (*(_OWORD *)&self->_visibleTags != 0) {
      -[SBHIconModel setVisibilityOfIconsWithVisibleTags:hiddenTags:](*p_iconModel, "setVisibilityOfIconsWithVisibleTags:hiddenTags:");
    }
    uint64_t v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = v15;

    [v7 setIconModel:v5];
    [v8 addObserver:self selector:sel__iconModelDidLayout_ name:v9 object:self->_iconModel];
    int v17 = [(SBHIconModel *)self->_iconModel rootFolder];

    if (v17) {
      [(SBIconController *)self _rootFolderDidChange];
    }
    long long v18 = [[SBIconVisibilityService alloc] initWithIconModel:self->_iconModel];
    iconVisibilityService = self->_iconVisibilityService;
    self->_iconVisibilityService = v18;

    if ([(SBIconController *)self isAppLibrarySupported])
    {
      uint64_t v20 = [(SBIconController *)self iconManager];

      if (v20)
      {
        if (![(SBIconController *)self isModalAppLibrarySupported])
        {
          __int16 v21 = [(SBIconController *)self mainDisplayWindowScene];
          long long v22 = [(SBIconController *)self _setUpLibraryViewControllerForWindowScene:v21];
          [(SBIconController *)self setOverlayLibraryViewController:v22];
          uint64_t v23 = [(SBIconController *)self iconManager];
          [v23 setOverlayLibraryViewController:v22];
        }
      }
    }
    [v8 postNotificationName:SBIconControllerIconModelDidChangeNotification object:self];
    while ([(NSMutableSet *)self->_delayedStyleWallpaperEffectViews count])
    {
      long long v24 = self->_delayedStyleWallpaperEffectViews;
      uint64_t v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v26 = self->_delayedStyleWallpaperEffectViews;
      self->_delayedStyleWallpaperEffectViews = v25;

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v27 = v24;
      uint64_t v28 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v42 + 1) + 8 * v31++) setStyle:29];
          }
          while (v29 != v31);
          uint64_t v29 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v29);
      }
    }
    uint64_t v32 = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = 0;

    if ([(SBHIconModel *)self->_iconModel hasDesiredIconState])
    {
      uint64_t v33 = [(SBHIconModel *)*p_iconModel missingDesiredIconIdentifiers];
      uint64_t v46 = *MEMORY[0x1E4FA7560];
      uint64_t v34 = [v33 allObjects];
      long long v47 = v34;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      long long v36 = (void *)MEMORY[0x1E4FA5E78];
      id v37 = v35;
      long long v38 = [v36 sharedInstance];
      [v38 emitEvent:35 withPayload:v37];
    }
    analyticsEventsController = self->_analyticsEventsController;
    if (analyticsEventsController)
    {
      [(SBAnalyticsEventsControllerForIconController *)analyticsEventsController updateIconModel:v5];
    }
    else
    {
      long long v40 = [[SBAnalyticsEventsControllerForIconController alloc] initWithIconModel:v5];
      long long v41 = self->_analyticsEventsController;
      self->_analyticsEventsController = v40;
    }
  }
}

- (void)_showsBadgesInAppLibraryDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SBDefaults localDefaults];
  id v4 = [v3 homeScreenDefaults];
  uint64_t v5 = [v4 showsBadgesInAppLibrary];

  uint64_t v6 = [(SBIconController *)self _libraryViewControllers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setAllowsBadging:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_addSmartStackToTodayList:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke;
  v11[3] = &unk_1E6AFB838;
  id v9 = v7;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v6;
  id v12 = v10;
  [v8 performAfterFirstUnlockSinceBootUsingBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke(id *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F4AF88] sharedInstance];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2;
  v3[3] = &unk_1E6AFB810;
  id v5 = a1[5];
  objc_copyWeak(&v6, a1 + 6);
  id v4 = a1[4];
  [v2 fetchSmartStackOfVariant:1 completionHandler:v3];

  objc_destroyWeak(&v6);
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    id v31 = v6;
    id v32 = v5;
    id v7 = [v5 objectAtIndexedSubscript:0];
    uint64_t v8 = SBLogWidgets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = (uint64_t)v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Found suggested default widget stack: %@", buf, 0xCu);
    }

    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v30 = v7;
    id v10 = [v7 mediumDefaultStack];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v16 = [v15 avocadoDescriptor];
          int v17 = [v16 sanitizedDescriptor];

          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || ([v17 extensionBundleIdentifier],
                  long long v18 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v19 = [v18 length],
                  v18,
                  v19))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                || ([v17 kind],
                    uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v21 = [v20 length],
                    v20,
                    v21))
              {
                [v9 addObject:v17];
                goto LABEL_24;
              }
              long long v22 = SBLogWidgets();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v44 = (uint64_t)v15;
                uint64_t v23 = v22;
                long long v24 = "Widget in suggested default widget stack has no kind: %@";
                goto LABEL_22;
              }
            }
            else
            {
              long long v22 = SBLogWidgets();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v44 = (uint64_t)v15;
                uint64_t v23 = v22;
                long long v24 = "Widget in suggested default widget stack has no extension bundle identifier: %@";
                goto LABEL_22;
              }
            }
          }
          else
          {
            long long v22 = SBLogWidgets();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = (uint64_t)v15;
              uint64_t v23 = v22;
              long long v24 = "Widget in suggested default widget stack has no descriptor: %@";
LABEL_22:
              _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
            }
          }

LABEL_24:
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      uint64_t v25 = SBLogWidgets();
      id v6 = v31;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [v9 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v44 = v26;
        _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Found %lu medium default widget stack descriptors", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_381;
      block[3] = &unk_1E6AFB7E8;
      objc_copyWeak(&v37, a1 + 6);
      id v34 = v9;
      id v35 = a1[4];
      id v36 = a1[5];
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v37);
      id v5 = v32;
    }
    else
    {
      id v6 = v31;
      id v5 = v32;
      if (a1[5])
      {
        uint64_t v29 = SBLogWidgets();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_2();
        }

        (*((void (**)(void))a1[5] + 2))();
      }
    }
  }
  else
  {
    uint64_t v27 = SBLogWidgets();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_1(v6);
    }

    uint64_t v28 = (void (**)(id, void))a1[5];
    if (v28) {
      v28[2](v28, 0);
    }
  }
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_381(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained _createWidgetIconWithDescriptors:*(void *)(a1 + 32) gridSize:*MEMORY[0x1E4FA6530]];
  if ([v3 iconDataSourceCount])
  {
    id v4 = (id)[*(id *)(a1 + 40) insertIcon:v3 atIndex:0];
    id v5 = [WeakRetained model];
    [v5 saveIconStateIfNeeded];

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else if (*(void *)(a1 + 48))
  {
    uint64_t v8 = SBLogWidgets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_381_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_8;
  }
}

- (void)_obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6AF6828;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAfterFirstUnlockSinceBootUsingBlock:v7];
}

void __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) suggestedOnboardingStack];
  uint64_t v4 = [*(id *)(a1 + 32) userIconStateFileStatus];
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
      goto LABEL_4;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (!v7)
    {
LABEL_4:
      id v5 = (id *)MEMORY[0x1E4FA6560];
      goto LABEL_11;
    }
  }
  id v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  BOOL v10 = v4 == 1 && (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  id v5 = (id *)MEMORY[0x1E4FA6528];
  if (!v10) {
    id v5 = (id *)MEMORY[0x1E4FA6530];
  }
LABEL_11:
  id v11 = *v5;
  uint64_t v12 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Suggested widgets size class = %d", buf, 8u);
  }

  if (v3 && [v3 count])
  {
    uint64_t v36 = a1;
    long long v38 = v2;
    long long v40 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v37 = v3;
    obuint64_t j = v3;
    uint64_t v13 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v44 = *(void *)v54;
      id v15 = (id)*MEMORY[0x1E4FA6560];
      id v39 = (id)*MEMORY[0x1E4FA6530];
      long long v42 = (void *)*MEMORY[0x1E4FA6560];
      id v43 = v11;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v54 != v44) {
            objc_enumerationMutation(obj);
          }
          int v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v18 = v17;
          }
          else {
            long long v18 = 0;
          }
          id v19 = v18;
          if (v19)
          {
            uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
            if (v11 == v15 || [v11 isEqualToString:v15])
            {
              uint64_t v21 = [v19 smallDefaultStack];
            }
            else if (v11 == v39 || objc_msgSend(v11, "isEqualToString:"))
            {
              uint64_t v21 = [v19 mediumDefaultStack];
            }
            else
            {
              uint64_t v21 = [v19 largeDefaultStack];
            }
            long long v52 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v49 = 0u;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v50;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v50 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = [*(id *)(*((void *)&v49 + 1) + 8 * j) avocadoDescriptor];
                  uint64_t v28 = [v27 sanitizedDescriptor];

                  [v20 addObject:v28];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
              }
              while (v24);
            }

            if ([v20 count]) {
              [v40 addObject:v20];
            }

            id v15 = v42;
            id v11 = v43;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v14);
    }

    uint64_t v29 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v58 = v40;
      _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "Smart stack %@", buf, 0xCu);
    }

    a1 = v36;
    uint64_t v30 = *(void **)(v36 + 32);
    uint64_t v3 = v37;
    uint64_t v2 = v38;
    if (__sb__runningInSpringBoard())
    {
      [v30 _updateDefaultFirstPageWidgetDescriptors:v40 withSizeClass:v11 andGridCellInfoOptions:2 * (SBFEffectiveDeviceClass() == 2)];
    }
    else
    {
      id v31 = [MEMORY[0x1E4F42948] currentDevice];
      objc_msgSend(v30, "_updateDefaultFirstPageWidgetDescriptors:withSizeClass:andGridCellInfoOptions:", v40, v11, 2 * (objc_msgSend(v31, "userInterfaceIdiom") == 1));
    }
    dispatch_group_leave(v38);
  }
  else
  {
    dispatch_group_leave(v2);
  }
  id v32 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v33 = [v32 userInterfaceIdiom];

  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    dispatch_group_enter(v2);
    id v34 = objc_alloc_init(MEMORY[0x1E4F4AFB0]);
    id v35 = [*(id *)(a1 + 32) iconManager];
    [v35 setProactiveWidgetSuggesterClient:v34];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_385;
    v47[3] = &unk_1E6AFB860;
    v47[4] = *(void *)(a1 + 32);
    long long v48 = v2;
    [v34 defaultWidgetSuggestionOfType:1 completionHandler:v47];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_387;
  block[3] = &unk_1E6AF5300;
  id v46 = *(id *)(a1 + 40);
  dispatch_group_notify(v2, MEMORY[0x1E4F14428], block);
}

void __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_385(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_2;
    BOOL v10 = &unk_1E6AF5290;
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v3;
    BSDispatchMain();
  }
  else
  {
    uint64_t v4 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "TV widget was determined not to load", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SBWidgetSuggestionDidChange, (CFStringRef)*MEMORY[0x1E4F4AD80], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) obtainProactiveSecondPageWidgetSuggestion];
  uint64_t v2 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "TV widget was determined to load", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __83__SBIconController__obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler___block_invoke_387(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Finish fetching smart stacks", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)_updateDefaultFirstPageWidgetDescriptors:(id)a3 withSizeClass:(id)a4 andGridCellInfoOptions:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(SBIconController *)self iconManager];
  [v10 setDefaultFirstPageWidgetDescriptors:v8];
  [v10 setDefaultFirstPageWidgetSizeClass:v9];
  int v17 = v10;
  [v10 setGridCellInfoOptionsForInsertingDefaultWidgets:a5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 updateDefaultFirstPageWidgetDescriptors:v8 withSizeClass:v9 andGridCellInfoOptions:a5];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction
{
  id v8 = [(SBIconController *)self iconManager];
  uint64_t v3 = +[SBDefaults localDefaults];
  uint64_t v4 = [v3 homeScreenDefaults];

  int v5 = [v8 deviceTypeSupportModalWidgetIntroduction];
  if (v5)
  {
    id v6 = [(SBIconController *)self alertItemsController];
    [v6 setForceAlertsToPend:1 forReason:@"SBHomeScreenWidgetDiscoverabilityIntroduction"];
  }
  if ([v8 addDefaultWidgetsToHomeScreen])
  {
    [v8 scrollToDefaultWidgets];
    [v4 setShouldAddDefaultWidgetsToHomeScreen:0];
    uint64_t v7 = [(SBIconController *)self iconManager];
    [v7 disableUserInteractionForWidgetDiscoverability];
LABEL_9:

    goto LABEL_10;
  }
  if ([v8 rootFolderContainsWidgets]) {
    [v4 setShouldAddDefaultWidgetsToHomeScreen:0];
  }
  if (v5)
  {
    uint64_t v7 = [(SBIconController *)self alertItemsController];
    [v7 setForceAlertsToPend:0 forReason:@"SBHomeScreenWidgetDiscoverabilityIntroduction"];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)obtainProactiveSecondPageWidgetSuggestion
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBIconController *)self iconManager];
  uint64_t v4 = [v3 widgetExtensionProvider];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6388]) initWithKind:@"com.apple.tv" extensionBundleIdentifier:@"com.apple.tv.TVWidgetExtension"];
  uint64_t v16 = v4;
  uint64_t v6 = objc_msgSend(v4, "sbh_descriptorForWidgetIdentifiable:", v5);
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    uint64_t v22 = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v23[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v3 setDefaultSecondPageWidgetDescriptors:v9];

    [v3 setDefaultSecondPageWidgetSizeClass:*MEMORY[0x1E4FA6520]];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v10 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 obtainProactiveSecondPageWidgetSuggestion];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (void)displayFeatureIntroductionItem:(id)a3 atLocation:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 shouldDisplayFeatureIntroductionAtLocations:a4])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = [v6 featureIntroductionIdentifier];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 shouldDeferAlertsAtLocations:a4])
    {
      *((unsigned char *)v14 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      id v8 = [(SBIconController *)self alertItemsController];
      [v8 setForceAlertsToPend:1 forReason:v7];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![v6 shouldPauseUserInteractionAtLocations:a4])
      {
        goto LABEL_9;
      }
      id v8 = [(SBIconController *)self iconManager];
      [v8 disableUserInteractionForWidgetDiscoverability];
    }

LABEL_9:
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __62__SBIconController_displayFeatureIntroductionItem_atLocation___block_invoke;
    v10[3] = &unk_1E6AF6380;
    uint64_t v12 = &v13;
    void v10[4] = self;
    id v9 = v7;
    id v11 = v9;
    [v6 displayFeatureIntroductionAtLocations:a4 presentCompletion:0 dismissCompletion:v10];

    _Block_object_dispose(&v13, 8);
  }
}

void __62__SBIconController_displayFeatureIntroductionItem_atLocation___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v2 = [*(id *)(a1 + 32) alertItemsController];
    [v2 setForceAlertsToPend:0 forReason:*(void *)(a1 + 40)];
  }
}

- (void)displayFeatureIntroductionsAtLocation:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = [(SBIconController *)self iconManager];
  id v6 = [v5 featureIntroductionManager];
  uint64_t v7 = [v6 featureIntroductionItemAtLocation:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = objc_msgSend(v7, "allObjects", 0);
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
        [(SBIconController *)self displayFeatureIntroductionItem:*(void *)(*((void *)&v13 + 1) + 8 * v12++) atLocation:a3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_unlockAnimationDidFinish:(id)a3
{
  id v5 = [(SBIconController *)self iconManager];
  uint64_t v4 = [v5 focusModeManager];
  [v4 updateFocusModePopoverVisibility];
  [(SBIconController *)self displayFeatureIntroductionsAtLocation:4];
}

- (void)_rootFolderDidChange
{
  id v17 = [(SBIconController *)self iconManager];
  uint64_t v3 = [(SBIconController *)self model];
  uint64_t v4 = [v3 rootFolder];
  id v5 = [(id)SBApp userSessionController];
  uint64_t v6 = [v5 sessionType];

  if (v6 == 2) {
    [v17 removeWidgetIconsFromHomeScreen];
  }
  uint64_t v7 = +[SBDefaults localDefaults];
  id v8 = [v7 homeScreenDefaults];

  if ([v8 shouldUpgradeEnableWidgetSuggestions]) {
    BOOL v9 = v6 == 2;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9
    && [(SBIconController *)self _enableWidgetSuggestionsForIconsInModel:v3 withRootFolder:v4])
  {
    [v8 setShouldUpgradeEnableWidgetSuggestions:0];
  }
  uint64_t v10 = [v4 todayList];
  [(SBIconController *)self _prepareDefaultTodayLayoutIfNecessary];
  [(SBIconController *)self _setupWidgetIntroductionIfNecessary];
  uint64_t v11 = [(SBIconController *)self todayViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v13 = [(SBIconController *)self todayViewController];
    [v13 setRootFolder:v4];
  }
  else
  {
    if (!v17) {
      goto LABEL_15;
    }
    id v13 = [(SBIconController *)self _newTodayViewControllerWithIconManager:v17 iconListModel:v10 rootFolder:v4 location:1];
    [(SBIconController *)self setTodayViewController:v13];
    if (![(SBIconController *)self _isCoplanarHomeScreenEnabled]) {
      [(SBHIconManager *)self->_iconManager setOverlayTodayViewController:v13];
    }
  }

LABEL_15:
  [(SBIconController *)self _setupOverlayLibraryViewController];
  long long v14 = [(SBIconController *)self coverSheetTodayViewController];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    id v16 = [(SBIconController *)self coverSheetTodayViewController];
    [v16 setRootFolder:v4];
  }
  else
  {
    if (!v17) {
      goto LABEL_20;
    }
    id v16 = [(SBIconController *)self _newTodayViewControllerWithIconManager:v17 iconListModel:v10 rootFolder:v4 location:2];
    [(SBIconController *)self setCoverSheetTodayViewController:v16];
  }

LABEL_20:
  [(SBIconController *)self updateRootFolderWithCurrentDoNotDisturbState];
  [v4 addFolderObserver:self];
}

- (BOOL)_enableWidgetSuggestionsForIconsInModel:(id)a3 withRootFolder:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke;
  v11[3] = &unk_1E6AFB8B0;
  void v11[4] = &v12;
  [v6 enumerateListsWithOptions:1 usingBlock:v11];
  if (*((unsigned char *)v13 + 24))
  {
    uint64_t v7 = SBLogIconController();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Enabled Widget Suggestions for at least one widget icon; saving icon state...",
        buf,
        2u);
    }

    [v6 markIconStateDirty];
    int v8 = [v5 saveIconStateIfNeeded];
    BOOL v9 = SBLogIconController();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v8;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Enabled Widget Suggestions for at least one widget icon; icon state saved: %{BOOL}u",
        buf,
        8u);
    }
  }
  else
  {
    BOOL v9 = SBLogIconController();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Did not enable Widget Suggestions for any widget icons", buf, 2u);
    }
    LOBYTE(v8) = 1;
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke_2;
  v3[3] = &unk_1E6AFB888;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateIconsWithOptions:1 usingBlock:v3];
}

void __75__SBIconController__enableWidgetSuggestionsForIconsInModel_withRootFolder___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = [v6 isWidgetIcon];
  uint64_t v4 = v6;
  if (v3)
  {
    id v5 = v6;
    if ([v5 allowsSuggestions])
    {
      [v5 setAllowsExternalSuggestions:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }

    uint64_t v4 = v6;
  }
}

- (void)_setupWidgetIntroductionIfNecessary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(id)SBApp userSessionController];
  uint64_t v4 = [v3 sessionType];

  int64_t v5 = [(SBIconController *)self userIconStateFileStatus];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(SBIconController *)self _featureIntroductionItemForWidgetSetupAtLocation:2];
  objc_msgSend(v6, "bs_safeAddObject:", v7);
  if (v5 == 2 && v4 != 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v8 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v14 = [v13 featureIntroductionItemForWidgetSetupAtLocation:2];
            objc_msgSend(v6, "bs_safeAddObject:", v14);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    if ([v6 count])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__SBIconController__setupWidgetIntroductionIfNecessary__block_invoke;
      v15[3] = &unk_1E6AF5350;
      id v16 = v6;
      [(SBIconController *)self _obtainSmartStackForWidgetDiscoverabilityWithCompletionHandler:v15];
    }
  }
}

void __55__SBIconController__setupWidgetIntroductionIfNecessary__block_invoke(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = @"unsuccessfully";
    if (a2) {
      int64_t v5 = @"successfully";
    }
    *(_DWORD *)buf = 138412290;
    long long v17 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Obtained widget discoverability fetching status %@", buf, 0xCu);
  }

  if (a2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setupFeatureIntroductionAtLocations:", 2, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)_featureIntroductionItemForWidgetSetupAtLocation:(unint64_t)a3
{
  uint64_t v4 = [(SBIconController *)self iconManager];
  int64_t v5 = [v4 featureIntroductionManager];
  id v6 = [v5 featureIntroductionItemAtLocation:a3 withIdentifier:@"SBFeatureIntroductionLocationNone"];
  if ([v6 shouldSetupFeatureIntroductionAtLocations:a3]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)_prepareDefaultTodayLayoutIfNecessary
{
  if ([(SBIconController *)self _tryToPrepareNonDynamicDefaultTodayLayout])
  {
    [(SBIconController *)self _tryToPrepareDynamicDefaultTodayLayout];
  }
  else
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SBIconController__prepareDefaultTodayLayoutIfNecessary__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    void block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__SBIconController__prepareDefaultTodayLayoutIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _tryToPrepareNonDynamicDefaultTodayLayout];
  if (result)
  {
    dispatch_time_t v3 = *(void **)(a1 + 32);
    return [v3 _tryToPrepareDynamicDefaultTodayLayout];
  }
  return result;
}

- (BOOL)_tryToPrepareNonDynamicDefaultTodayLayout
{
  dispatch_time_t v3 = [(SBIconController *)self iconManager];
  uint64_t v4 = [(SBIconController *)self model];
  int64_t v5 = +[SBDefaults localDefaults];
  id v6 = [v5 homeScreenDefaults];

  if ([v6 shouldPrepareDefaultTodayList])
  {
    if (![v3 resetTodayLayout] || !objc_msgSend(v4, "saveIconStateIfNeeded"))
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    [v6 setShouldPrepareDefaultTodayList:0];
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (void)_tryToPrepareDynamicDefaultTodayLayout
{
  dispatch_time_t v3 = [(SBIconController *)self model];
  uint64_t v4 = [v3 rootFolder];
  int64_t v5 = +[SBDefaults localDefaults];
  id v6 = [v5 homeScreenDefaults];

  if ([v6 shouldPrepareStackForDefaultTodayList])
  {
    BOOL v7 = [v4 todayList];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke;
    v9[3] = &unk_1E6AFB900;
    id v10 = v6;
    objc_copyWeak(&v12, &location);
    id v8 = v7;
    id v11 = v8;
    [(SBIconController *)self _addSmartStackToTodayList:v8 completionHandler:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke(id *a1, int a2)
{
  if (a2)
  {
    id v3 = a1[4];
    [v3 setShouldPrepareStackForDefaultTodayList:0];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_2;
    block[3] = &unk_1E6AFB8D8;
    objc_copyWeak(&v8, a1 + 6);
    id v6 = a1[5];
    id v7 = a1[4];
    dispatch_after(v4, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v8);
  }
}

void __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_3;
  v4[3] = &unk_1E6AF5350;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [WeakRetained _addSmartStackToTodayList:v3 completionHandler:v4];
}

uint64_t __58__SBIconController__tryToPrepareDynamicDefaultTodayLayout__block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setShouldPrepareStackForDefaultTodayList:0];
  }
  return result;
}

- (void)_makeTodayViewControllers
{
  if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
  {
    id v10 = [(SBIconController *)self iconManager];
    uint64_t v3 = [(SBIconController *)self model];
    dispatch_time_t v4 = [v3 rootFolder];
    id v5 = [v4 todayList];
    id v6 = [(SBIconController *)self todayViewController];

    if (!v6)
    {
      id v7 = [(SBIconController *)self _newTodayViewControllerWithIconManager:v10 iconListModel:v5 rootFolder:v4 location:1];
      [(SBIconController *)self setTodayViewController:v7];
      if (![(SBIconController *)self _isCoplanarHomeScreenEnabled]) {
        [(SBHIconManager *)self->_iconManager setOverlayTodayViewController:v7];
      }
    }
    id v8 = [(SBIconController *)self coverSheetTodayViewController];

    if (!v8)
    {
      id v9 = [(SBIconController *)self _newTodayViewControllerWithIconManager:v10 iconListModel:v5 rootFolder:v4 location:2];
      [(SBIconController *)self setCoverSheetTodayViewController:v9];
    }
  }
}

- (void)_rebuildTodayViewControllers
{
  [(SBIconController *)self setTodayViewController:0];
  [(SBIconController *)self setCoverSheetTodayViewController:0];
  [(SBIconController *)self _makeTodayViewControllers];
}

- (void)_enumerateTodayViewControllers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SBIconController *)self todayViewController];

    if (v5)
    {
      id v5 = objc_opt_new();
      id v6 = [(SBIconController *)self todayViewController];
      objc_msgSend(v5, "bs_safeAddObject:", v6);
    }
    id v7 = [(SBIconController *)self coverSheetTodayViewController];

    if (v7)
    {
      if (!v5) {
        id v5 = objc_opt_new();
      }
      id v8 = [(SBIconController *)self coverSheetTodayViewController];
      objc_msgSend(v5, "bs_safeAddObject:", v8);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__SBIconController__enumerateTodayViewControllers___block_invoke;
    v9[3] = &unk_1E6AFB928;
    id v10 = v4;
    [v5 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t __51__SBIconController__enumerateTodayViewControllers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)importIconState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_sendITunesNotification = 0;
  BOOL v4 = [(SBIconModel *)self->_iconModel importState:a3];
  if (v4)
  {
    id v5 = [(SBIconController *)self iconManager];
    [v5 relayout];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NSHashTable *)self->_iconModelControllerObservers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 iconModelDidImportIconState:self->_iconModel];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  self->_sendITunesNotification = 1;
  return v4;
}

- (BOOL)iconsSnapToGrid
{
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() == 2;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == 1;

  return v2;
}

- (BOOL)isAppLibraryAllowed
{
  if (![(SBIconController *)self isAppLibrarySupported]) {
    return 0;
  }
  if ([(id)SBApp homeScreenRotationStyle] == 1) {
    return 1;
  }
  BOOL v4 = [(SBIconController *)self homeScreenViewController];
  BOOL v3 = (unint64_t)([v4 orientation] - 5) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (id)createModalLibraryControllerForWindowScene:(id)a3
{
  id v5 = a3;
  if ([(SBIconController *)self isModalAppLibrarySupported])
  {
    id v6 = [v5 floatingDockController];
    if (!v6)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBIconController.m" lineNumber:3355 description:@"floating dock controller must exist in order to create a modal library controller"];
    }
    uint64_t v7 = [(SBIconController *)self iconManager];

    if (v7)
    {
      uint64_t v7 = [(SBIconController *)self _setUpLibraryViewControllerForWindowScene:v5];
    }
    if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v9 = [SBModalLibraryController alloc];
      uint64_t v10 = [(SBIconController *)self iconManager];
      uint64_t v8 = [(SBModalLibraryController *)v9 initWithIconManager:v10 libraryViewController:v7 floatingDockController:v6 windowScene:v5];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_setUpLibraryViewControllerForWindowScene:(id)a3
{
  id v5 = a3;
  id v6 = [(SBIconController *)self iconManager];
  uint64_t v7 = [(SBIconController *)self model];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBIconController.m" lineNumber:3375 description:@"icon manager must exist in order to create a library view controller"];

    if (v8) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2 object:self file:@"SBIconController.m" lineNumber:3376 description:@"icon model must exist in order to create a library view controller"];

LABEL_3:
  if (!self->_categoryMapProvider)
  {
    uint64_t v9 = objc_alloc_init(SBProactiveLibraryCategoryMapProviderSource);
    uint64_t v10 = (SBHLibraryCategoryMapProvider *)[objc_alloc(MEMORY[0x1E4FA62E0]) initWithSource:v9];
    categoryMapProvider = self->_categoryMapProvider;
    self->_categoryMapProvider = v10;
  }
  if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
  {
    id v12 = 0;
  }
  else
  {
    long long v13 = +[SBDefaults localDefaults];
    long long v14 = [v13 homeScreenDefaults];

    id v12 = [[SBLibraryViewController alloc] initWithCategoryMapProvider:self->_categoryMapProvider windowScene:v5];
    if (![(SBIconController *)self _isCoplanarHomeScreenEnabled]) {
      [(SBHLibraryViewController *)v12 setIconLocation:*MEMORY[0x1E4FA6678]];
    }
    [(SBHLibraryViewController *)v12 setIconModel:v8];
    [(SBHLibraryViewController *)v12 addObserver:self];
    [(SBHLibraryViewController *)v12 setBehaviorDelegate:self];
    -[SBLibraryViewController setEditing:](v12, "setEditing:", [v6 isEditing]);
    -[SBHLibraryViewController setAllowsBadging:](v12, "setAllowsBadging:", [v14 showsBadgesInAppLibrary]);
    [(SBHLibraryViewController *)v12 setContentVisibility:2];
    [(SBHLibraryViewController *)v12 setIconViewProvider:v6];
    [(SBHLibraryViewController *)v12 setIconViewDelegate:v6];
    [(SBHLibraryViewController *)v12 setHomeScreenIconTransitionAnimatorDelegate:v6];
    long long v15 = [(SBIconController *)self _appLibraryListLayoutProviderForWindowScene:v5];
    [(SBHLibraryViewController *)v12 setListLayoutProvider:v15];
    long long v16 = [v6 iconImageCache];
    [(SBHLibraryViewController *)v12 setIconImageCache:v16];

    long long v17 = [v6 legibilitySettings];
    [(SBHLibraryViewController *)v12 setLegibilitySettings:v17];

    [(SBHLibraryViewController *)v12 addObserver:v6];
  }

  return v12;
}

- (id)_appLibraryListLayoutProviderForWindowScene:(id)a3
{
  v31[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = SBLogIconController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SBIconController _appLibraryListLayoutProviderForWindowScene:]();
    }
  }
  id v6 = [(SBIconController *)self iconManager];
  if (([v4 isContinuityDisplayWindowScene] & 1) != 0
    || [v4 isMainDisplayWindowScene])
  {
    uint64_t v7 = [v6 listLayoutProvider];
  }
  else
  {
    uint64_t v8 = [v6 listLayoutProvider];
    uint64_t v9 = *MEMORY[0x1E4FA6660];
    uint64_t v10 = [v8 layoutForIconLocation:*MEMORY[0x1E4FA6660]];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        long long v13 = v12;
      }
      else {
        long long v13 = 0;
      }
    }
    else
    {
      long long v13 = 0;
    }
    id v14 = v13;

    long long v15 = [v14 layoutConfiguration];

    uint64_t v29 = v12;
    long long v16 = (void *)[v15 copy];

    [v16 landscapeLayoutInsets];
    [v16 portraitLayoutInsets];
    objc_msgSend(v16, "setPortraitLayoutInsets:");
    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4FA63F0]) initWithLayoutConfiguration:v16];
    v30[0] = *MEMORY[0x1E4FA66D0];
    uint64_t v28 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[0] = v28;
    v30[1] = *MEMORY[0x1E4FA6648];
    uint64_t v27 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[1] = v27;
    v30[2] = *MEMORY[0x1E4FA6678];
    uint64_t v26 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[2] = v26;
    v30[3] = *MEMORY[0x1E4FA6650];
    long long v17 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[3] = v17;
    v30[4] = *MEMORY[0x1E4FA6670];
    uint64_t v18 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[4] = v18;
    v30[5] = *MEMORY[0x1E4FA6668];
    long long v19 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[5] = v19;
    v30[6] = *MEMORY[0x1E4FA6658];
    long long v20 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[6] = v20;
    v31[7] = v25;
    uint64_t v21 = *MEMORY[0x1E4FA6680];
    v30[7] = v9;
    v30[8] = v21;
    uint64_t v22 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[8] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:9];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6230]) initWithListLayouts:v23];
  }

  return v7;
}

- (BOOL)_badgesAreEnabledForSectionInfo:(id)a3
{
  return ((unint64_t)[a3 pushSettings] >> 3) & 1;
}

- (void)_updateEnabledBadgesSetWithSections:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    uint64_t v37 = 138412290;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "sectionID", v37);
        if (![(SBIconController *)self _badgesAreEnabledForSectionInfo:v11])
        {
          if (![(NSMutableSet *)self->_displayIDsWithBadgingEnabled containsObject:v12])goto LABEL_18; {
          [(NSMutableSet *)self->_displayIDsWithBadgingEnabled removeObject:v12];
          }
          [v5 addObject:v12];
          long long v15 = SBLogIcon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v37;
            long long v56 = v12;
            long long v16 = v15;
            long long v17 = "Removing %@ from list of apps with allowed badges";
LABEL_16:
            _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
          }
LABEL_17:

          goto LABEL_18;
        }
        if (v12
          && ([(NSMutableSet *)self->_displayIDsWithBadgingEnabled containsObject:v12] & 1) == 0)
        {
          if (!self->_displayIDsWithBadgingEnabled)
          {
            long long v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            displayIDsWithBadgingEnabled = self->_displayIDsWithBadgingEnabled;
            self->_displayIDsWithBadgingEnabled = v13;
          }
          [v5 addObject:v12];
          [(NSMutableSet *)self->_displayIDsWithBadgingEnabled addObject:v12];
          long long v15 = SBLogIcon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v37;
            long long v56 = v12;
            long long v16 = v15;
            long long v17 = "Adding %@ to list of apps with allowed badges";
            goto LABEL_16;
          }
          goto LABEL_17;
        }
LABEL_18:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v8);
  }
  long long v38 = v6;

  if (![(NSMutableSet *)self->_displayIDsWithBadgingEnabled count])
  {
    uint64_t v18 = self->_displayIDsWithBadgingEnabled;
    self->_displayIDsWithBadgingEnabled = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v5;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v25 = -[SBHIconModel applicationIconsForBundleIdentifier:](self->_iconModel, "applicationIconsForBundleIdentifier:", v24, v38);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v53 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v40;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v25);
              }
              [*(id *)(*((void *)&v39 + 1) + 8 * k) noteBadgeDidChange];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v53 count:16];
          }
          while (v27);
        }

        uint64_t v30 = [(SBHIconModel *)self->_iconModel bookmarkIconForWebClipPlaceholderBundleIdentifier:v24];
        [v30 noteBadgeDidChange];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v21);
  }

  id v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v32 = SBIconControllerIconBadgeVisibilityDidChangeNotification;
  long long v51 = @"SBApplicationBundleIdentifiers";
  id v52 = v19;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  [v31 postNotificationName:v32 object:self userInfo:v33];

  if ([v19 count])
  {
    id v34 = +[SBDefaults localDefaults];
    id v35 = [v34 notificationDefaults];

    uint64_t v36 = [(NSMutableSet *)self->_displayIDsWithBadgingEnabled allObjects];
    [v35 setDisplayIDsWithBadgingEnabled:v36];
  }
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:a4];
  [(SBIconController *)self _updateEnabledBadgesSetWithSections:v5];
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__SBIconController_observer_noteServerConnectionStateChanged___block_invoke;
    v4[3] = &unk_1E6AF8F58;
    void v4[4] = self;
    [a3 getSectionInfoWithCompletion:v4];
  }
}

uint64_t __62__SBIconController_observer_noteServerConnectionStateChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateEnabledBadgesSetWithSections:a2];
}

- (id)allApplicationsForIconModel:(id)a3
{
  BOOL v3 = [(SBIconController *)self applicationController];
  id v4 = [v3 allApplications];

  return v4;
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconController *)self applicationController];
  uint64_t v7 = [v6 applicationWithBundleIdentifier:v5];

  return v7;
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  BOOL v3 = [(SBIconController *)self applicationPlaceholderController];
  id v4 = [v3 placeholdersByDisplayID];
  id v5 = [v4 allValues];

  return v5;
}

- (id)defaultIconStateForIconManager:(id)a3
{
  if ([(SBIconController *)self hasRestrictedEnforcedLayout])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v4 = +[SBPlatformController sharedInstance];
    BOOL v3 = [v4 defaultIconState];
  }
  return v3;
}

- (id)iconManager:(id)a3 defaultAutomaticFavoriteIconIdentifiersWithMaximumCount:(unint64_t)a4
{
  id v5 = [(SBIconController *)self model];
  id v6 = [v5 leafIconIdentifiers];

  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  if ([v8 count] > a4)
  {
    uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, a4);

    uint64_t v8 = (void *)v9;
  }

  return v8;
}

- (Class)iconManager:(id)a3 iconClassForApplicationWithBundleIdentifier:(id)a4 proposedClass:(Class)a5
{
  uint64_t v7 = +[SBDefaults localDefaults];
  uint64_t v8 = [v7 iconDefaults];
  int v9 = [v8 shouldDisableLiveIcons];

  if (v9)
  {
    uint64_t v10 = [(SBIconController *)self model];
    a5 = (Class)[(id)objc_opt_class() applicationIconClass];
  }
  return a5;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_BOOL allowsUninstall = objc_msgSend(a3, "effectiveBoolValueForSetting:", *MEMORY[0x1E4F73F08], a4) != 2;
  id v5 = SBLogIconController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL allowsUninstall = self->_allowsUninstall;
    v7[0] = 67109120;
    v7[1] = allowsUninstall;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Profile connection settings changed; allowsUninstall: %{BOOL}u",
      (uint8_t *)v7,
      8u);
  }
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F624E0], "sharedInstance", a3, a4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __87__SBIconController_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke;
  v7[3] = &unk_1E6AF4AC0;
  void v7[4] = self;
  id v6 = [MEMORY[0x1E4F624D8] eventWithName:@"SBIconController-ProfileListChanged-IconModelSelection" handler:v7];
  [v5 executeOrAppendEvent:v6];
}

uint64_t __87__SBIconController_profileConnectionDidReceiveProfileListChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIconModelStore];
}

- (void)applicationRestrictionControllerWillPostAppVisibilityUpdate:(id)a3
{
  if ([a3 isAllowlistActiveAndTransient] && !self->_isAppAllowlistActiveAndTransient)
  {
    id v4 = SBLogIconController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "App visibility updates will be treated as transient. Updating icon model store.", v5, 2u);
    }

    self->_isAppAllowlistActiveAndTransient = 1;
    [(SBIconController *)self _updateIconModelStore];
  }
}

- (void)applicationRestrictionController:(id)a3 didUpdateVisibleTags:(id)a4 hiddenTags:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (NSSet *)[a4 copy];
  visibleTags = self->_visibleTags;
  self->_visibleTags = v8;

  uint64_t v10 = (NSSet *)[v7 copy];
  hiddenTags = self->_hiddenTags;
  self->_hiddenTags = v10;

  id v12 = [(SBIconController *)self model];
  [v12 setVisibilityOfIconsWithVisibleTags:self->_visibleTags hiddenTags:self->_hiddenTags];
}

- (void)applicationRestrictionControllerDidPostAppVisibilityUpdate:(id)a3
{
  if (([a3 isAllowlistActiveAndTransient] & 1) == 0 && self->_isAppAllowlistActiveAndTransient)
  {
    id v4 = SBLogIconController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "App visibility updates will no longer be treated as transient. Updating icon model store.", v5, 2u);
    }

    self->_isAppAllowlistActiveAndTransient = 0;
    [(SBIconController *)self _updateIconModelStore];
  }
}

- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5
{
  id v6 = [a3 iconAnimator];
  id v7 = [MEMORY[0x1E4FA6270] rootSettings];
  uint64_t v8 = [v7 iconAnimationSettings];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = [v8 reducedMotionSettings];
LABEL_4:
    uint64_t v10 = (void *)v9;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      [v8 folderCloseSettings];
    }
    else {
      [v8 folderOpenSettings];
    }
    uint64_t v9 = LABEL_11:;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a4)
    {
      uint64_t v9 = [v8 crossfadeLaunchSettings];
      goto LABEL_4;
    }
    id v12 = [(id)SBApp homeHardwareButton];
    if ([v12 supportsAcceleratedAppDismiss]) {
      [v8 crossfadeAcceleratedSuspendSettings];
    }
    else {
      [v8 crossfadeSuspendSettings];
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a4)
    {
      uint64_t v9 = [v8 centerLaunchSettings];
      goto LABEL_4;
    }
    id v12 = [(id)SBApp homeHardwareButton];
    if ([v12 supportsAcceleratedAppDismiss]) {
      [v8 centerAcceleratedSuspendSettings];
    }
    else {
      [v8 centerSuspendSettings];
    }
    uint64_t v13 = LABEL_16:;
    uint64_t v10 = (void *)v13;

    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      [v8 libraryPodCloseSettings];
    }
    else {
      [v8 libraryPodOpenSettings];
    }
    goto LABEL_11;
  }
  uint64_t v10 = 0;
LABEL_5:

  return v10;
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4FA74D8];
  v14[0] = &unk_1F3349B48;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a5;
  uint64_t v8 = [v6 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v9 = (void *)MEMORY[0x1E4FA5E78];
  id v10 = v8;
  uint64_t v11 = [v9 sharedInstance];
  [v11 emitEvent:31 withPayload:v10];

  id v12 = [(SBIconController *)self iconDragManager];
  [v12 performSpringLoadedInteractionForIconDragOnIconView:v7];
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
{
  BOOL v3 = [(SBIconController *)self homeScreenViewController];
  [v3 _contentOverlayInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)iconManager:(id)a3 willCloseFolderController:(id)a4
{
  id v8 = a4;
  if ([v8 suspendsWallpaperAnimationWhileOpen])
  {
    double v4 = [v8 extraAssertions];
    double v5 = [v4 valueForKey:@"SuspendWallpaperAnimationAssertion"];
    double v6 = v5;
    if (v5)
    {
      [v5 invalidate];
      [v4 removeObjectForKey:@"SuspendWallpaperAnimationAssertion"];
    }
  }
  double v7 = [MEMORY[0x1E4FA62D0] sharedInstance];
  [v7 noteFolderControllerWillClose:v8];
}

- (void)setLegibilitySettings:(id)a3
{
  id v12 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    double v5 = [(SBIconController *)self iconManager];
    [v5 setLegibilitySettings:self->_legibilitySettings];

    double v6 = [(SBIconController *)self mainDisplayWindowScene];
    double v7 = [v6 floatingDockController];
    [v7 setLegibilitySettings:self->_legibilitySettings];
    id v8 = [(SBIconController *)self spotlightViewController];
    [v8 setLegibilitySettings:self->_legibilitySettings];

    double v9 = [(SBIconController *)self searchPresentableViewController];
    double v10 = [v9 searchAffordanceView];
    [v10 setLegibilitySettings:self->_legibilitySettings];

    double v11 = [(SBIconController *)self scrollAccessoryAuxiliaryView];
    [v11 setLegibilitySettings:self->_legibilitySettings];
  }
}

- (double)distanceToTopOfSpotlightIconsForIconManager:(id)a3
{
  double v4 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
  if ([v4 source] == 6)
  {
    char v5 = [MEMORY[0x1E4FA5E28] enableFloatingWindow];

    double v6 = 0.0;
    if (v5) {
      return v6;
    }
  }
  else
  {
  }
  double v7 = [(SBIconController *)self homeScreenViewController];
  id v8 = [v7 view];
  [v8 safeAreaInsets];
  double v10 = v9;

  double v11 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
  [v11 distanceToTopOfIcons];
  double v13 = v12;

  double v6 = v10 + v13;
  return v6;
}

- (id)iconManager:(id)a3 backgroundViewForDockForRootFolderController:(id)a4
{
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
      [(id)SBApp homeScreenSupportsRotation];
    }
  }
  else
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v4 userInterfaceIdiom]) {
      [(id)SBApp homeScreenSupportsRotation];
    }
  }
  return 0;
}

- (BOOL)iconManagerCanUseSeparateWindowForRotation:(id)a3
{
  double v4 = [(SBIconController *)self layoutStateProvider];
  char v5 = [v4 layoutState];
  uint64_t v6 = [v5 unlockedEnvironmentMode];

  if (v6 == 3) {
    return 0;
  }
  double v7 = +[SBWorkspace mainWorkspace];
  id v8 = [v7 transientOverlayPresentationManager];
  char v9 = [v8 hasActivePresentation];

  if (v9) {
    return 0;
  }
  double v11 = [(SBIconController *)self coverSheetPresentationManager];
  char v12 = [v11 isVisible];

  return v12 ^ 1;
}

- (void)iconManager:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v10 = [(SBIconController *)self mainDisplayWindowScene];
  id v8 = [v10 statusBarManager];
  char v9 = [v8 layoutManager];
  objc_msgSend(v9, "setStatusBarEdgeInsets:forLayoutLayer:", 0, top, left, bottom, right);
}

void __82__SBIconController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke()
{
  id v0 = +[SBDefaults localDefaults];
  uint64_t v1 = [v0 iconDefaults];
  iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage = [v1 suppressSetCurrentPage];

  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage)
  {
    BOOL v2 = SBLogIcon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __82__SBIconController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1();
    }
  }
}

- (BOOL)isIconContentPossiblyVisibleOverApplicationForIconManager:(id)a3
{
  BOOL v3 = [(SBIconController *)self layoutStateProvider];
  double v4 = [v3 layoutState];
  BOOL v5 = [v4 unlockedEnvironmentMode] == 3;

  return v5;
}

- (id)_createHomeScreenOverlayControllerIfNeeded
{
  BOOL v3 = [(SBIconController *)self homeScreenOverlayController];
  if (!v3)
  {
    uint64_t v21 = [(SBIconController *)self iconManager];
    double v4 = [v21 listLayoutProvider];
    BOOL v3 = [[SBHomeScreenOverlayController alloc] initWithListLayoutProvider:v4];
    [(SBHomeScreenOverlayController *)v3 setDelegate:self];
    [(SBHomeScreenOverlayController *)v3 addHomeScreenOverlayObserver:self];
    BOOL v5 = [(SBIconController *)self overlayLibraryViewController];
    [(SBHomeScreenOverlayController *)v3 addHomeScreenOverlayObserver:v5];

    uint64_t v6 = [(SBIconController *)self todayViewController];
    [(SBHomeScreenOverlayController *)v3 addHomeScreenOverlayObserver:v6];

    [(SBHomeScreenOverlayController *)v3 setContentVisibility:2];
    double v7 = [(SBHomeScreenOverlayController *)v3 viewController];
    id v8 = [(SBIconController *)self homeScreenViewController];
    char v9 = [v8 iconContentView];
    objc_msgSend(v8, "bs_addChildViewController:withSuperview:", v7, v9);
    id v10 = [v7 view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = (id)SBHPinViewWithinView();
    char v12 = [(SBHomeScreenOverlayController *)v3 dismissTapGestureRecognizer];
    [v12 requireGestureRecognizerToFail:self->_longPressToEditGestureRecognizer];

    double v13 = [(SBHomeScreenOverlayController *)v3 dismissTapGestureRecognizer];
    [v13 requireGestureRecognizerToFail:self->_tapToEndEditingGestureRecognizer];

    double v14 = [(SBIconController *)self todayViewController];
    if (+[SBLeftOfHomeAppViewController isEnabled])
    {
      double v15 = objc_alloc_init(SBLeftOfHomeAppViewController);
      [(SBHomeScreenOverlayController *)v3 setLeadingSidebarViewController:v15];
      leftOfHomeAppViewController = self->_leftOfHomeAppViewController;
      self->_leftOfHomeAppViewController = (SBApplicationHosting *)v15;
    }
    else
    {
      [(SBHomeScreenOverlayController *)v3 setLeadingSidebarViewController:v14];
    }
    long long v17 = [(SBHomeScreenOverlayController *)v3 viewController];
    [v14 setContainerViewController:v17];

    [v14 setDismissalDelegate:v3];
    if ([(SBIconController *)self isAppLibrarySupported]
      && ![(SBIconController *)self isModalAppLibrarySupported])
    {
      uint64_t v18 = [(SBIconController *)self overlayLibraryViewController];
      [(SBHomeScreenOverlayController *)v3 setTrailingSidebarViewController:v18];
      id v19 = [(SBHomeScreenOverlayController *)v3 viewController];
      [v18 setPresenter:v19];
    }
    [(SBIconController *)self setHomeScreenOverlayController:v3];
  }
  return v3;
}

- (id)_homeScreenOverlayControllerIfNeeded
{
  if ([(SBIconController *)self _isCoplanarHomeScreenEnabled])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(SBIconController *)self _createHomeScreenOverlayControllerIfNeeded];
  }
  return v3;
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnFirstPageByAmount:(double)a5
{
  id v17 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
  if ([(SBIconController *)self allowsHomeScreenOverlay]
    && ([(SBIconController *)self policyAggregator],
        double v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 allowsCapability:23],
        v7,
        (v8 & 1) != 0))
  {
    homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    if (!homeScreenOverlayInitialPresentationProgress)
    {
      id v10 = NSNumber;
      [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController layerPresentationProgress];
      *(float *)&double v11 = v11;
      char v12 = [v10 numberWithFloat:v11];
      double v13 = self->_homeScreenOverlayInitialPresentationProgress;
      self->_homeScreenOverlayInitialPresentationProgress = v12;

      homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    }
    homeScreenOverlayController = self->_homeScreenOverlayController;
    [(NSNumber *)homeScreenOverlayInitialPresentationProgress doubleValue];
    [(SBHomeScreenOverlayController *)homeScreenOverlayController presentationProgressForTranslation:1 initialPresentationProgress:a5 fromLeading:v15];
    objc_msgSend(v17, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 1, 1, 1, 0);
  }
  else
  {
    long long v16 = self->_homeScreenOverlayInitialPresentationProgress;
    self->_homeScreenOverlayInitialPresentationProgress = 0;

    [v17 setPresentationProgress:1 fromLeading:0.0];
  }
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnFirstPageWithVelocity:(double)a5 translation:(double)a6
{
  id v13 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if ([(SBIconController *)self allowsHomeScreenOverlay]
    && ([(SBIconController *)self policyAggregator],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 allowsCapability:23],
        v10,
        (v11 & 1) != 0))
  {
    [(NSNumber *)self->_homeScreenOverlayInitialPresentationProgress doubleValue];
    [v13 finalPresentationProgressForTranslation:1 velocity:a6 initialPresentationProgress:a5 fromLeading:v12];
    objc_msgSend(v13, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
  }
  else
  {
    [v13 setPresentationProgress:1 fromLeading:0.0];
  }
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnLastPageByAmount:(double)a5
{
  id v15 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
  if ([(SBIconController *)self allowsHomeScreenOverlay]
    && [(SBIconController *)self isAppLibrarySupported])
  {
    homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    if (!homeScreenOverlayInitialPresentationProgress)
    {
      char v8 = NSNumber;
      [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController layerPresentationProgress];
      *(float *)&double v9 = v9;
      id v10 = [v8 numberWithFloat:v9];
      char v11 = self->_homeScreenOverlayInitialPresentationProgress;
      self->_homeScreenOverlayInitialPresentationProgress = v10;

      homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    }
    homeScreenOverlayController = self->_homeScreenOverlayController;
    [(NSNumber *)homeScreenOverlayInitialPresentationProgress doubleValue];
    [(SBHomeScreenOverlayController *)homeScreenOverlayController presentationProgressForTranslation:0 initialPresentationProgress:a5 fromLeading:v13];
    objc_msgSend(v15, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 0, 1, 1, 0);
  }
  else
  {
    double v14 = self->_homeScreenOverlayInitialPresentationProgress;
    self->_homeScreenOverlayInitialPresentationProgress = 0;

    [v15 setPresentationProgress:0 fromLeading:0.0];
  }
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnLastPageWithVelocity:(double)a5 translation:(double)a6
{
  id v11 = [(SBIconController *)self homeScreenOverlayController];
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if ([(SBIconController *)self allowsHomeScreenOverlay]
    && [(SBIconController *)self isAppLibrarySupported])
  {
    [(NSNumber *)self->_homeScreenOverlayInitialPresentationProgress doubleValue];
    [v11 finalPresentationProgressForTranslation:0 velocity:a6 initialPresentationProgress:a5 fromLeading:v10];
    objc_msgSend(v11, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
  }
  else
  {
    [v11 setPresentationProgress:0 fromLeading:0.0];
  }
}

- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4
{
  return [(SBIconController *)self isIconVisibleForBundleIdentifier:a4];
}

- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4
{
  double v4 = SBWorkspaceApplicationForURLWithError(a4, 0, 0);
  BOOL v5 = [v4 bundleIdentifier];

  return v5;
}

- (void)iconManager:(id)a3 wantsLaunchForWidgetURL:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v6 setSource:24];
  [(SBLockScreenUnlockRequest *)v6 setIntent:3];
  [(SBLockScreenUnlockRequest *)v6 setName:@"Launch From Widget Icon Unlock"];
  [(SBLockScreenUnlockRequest *)v6 setWantsBiometricPresentation:1];
  double v7 = [(SBIconController *)self lockScreenManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SBIconController_iconManager_wantsLaunchForWidgetURL___block_invoke;
  v9[3] = &unk_1E6AF5350;
  id v10 = v5;
  id v8 = v5;
  [v7 unlockWithRequest:v6 completion:v9];
}

uint64_t __56__SBIconController_iconManager_wantsLaunchForWidgetURL___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return SBWorkspaceActivateApplicationFromURL(*(void **)(result + 32), 0, &__block_literal_global_461);
  }
  return result;
}

uint64_t __56__SBIconController_iconManager_wantsLaunchForWidgetURL___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSource:1];
}

- (id)iconManager:(id)a3 viewControllerForCustomIcon:(id)a4 element:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v13 = [v9 gridSizeClass];
    uint64_t v14 = SBHIconGridSizeClassToStackLayoutSize();

    id v15 = objc_alloc(MEMORY[0x1E4F4B790]);
    long long v16 = [v10 uniqueIdentifier];
    id v17 = [MEMORY[0x1E4F4B0C0] sharedInstance];
    id v18 = (id)[v15 initWithIdentifier:v16 suggestionsClient:v17 layoutSize:v14];

    goto LABEL_5;
  }
  id v19 = self;
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    uint64_t v21 = [v9 gridSizeClass];
    uint64_t v22 = SBHIconGridSizeClassToStackLayoutSize();

    uint64_t v23 = [(SBIconController *)self canAppPredictionsWidgetAlignWithGrid] ^ 1;
    id v24 = objc_alloc(MEMORY[0x1E4F4B788]);
    uint64_t v25 = [v9 uniqueIdentifier];
    id v18 = (id)[v24 initWithIdentifier:v25 layoutSize:v22 mode:v23];

    [v18 setDelegate:self];
    uint64_t v26 = [v8 listLayoutProvider];
    long long v16 = [v26 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];

    [v16 iconImageInfoForGridSizeClass:*MEMORY[0x1E4FA6528]];
    double v28 = v27;
    uint64_t v29 = [(SBIconController *)self homeScreenViewController];
    uint64_t v30 = [v29 iconContentView];
    [v30 bounds];
    double v32 = (v31 - v28) * 0.5;

    objc_msgSend(v18, "setParentLayoutInsets:", 0.0, v32, 0.0, v32);
LABEL_5:

    if (v18) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  uint64_t v33 = self;
  char v34 = objc_opt_isKindOfClass();

  if (v34)
  {
    id v35 = v10;
    id v36 = objc_alloc_init(MEMORY[0x1E4FB74E8]);
    uint64_t v37 = [v9 gridSizeClass];
    [v36 setFamily:CHSWidgetFamilyForSBHIconGridSizeClass()];

    long long v38 = [(SBIconController *)self iconManager];
    long long v39 = [v38 intentForDataSource:v35 ofIcon:v9];
    if (!v39)
    {
      long long v39 = WFCreateShortcutsWidgetConfigurationIntent();
      id v64 = 0;
      long long v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v39 requiringSecureCoding:1 error:&v64];
      id v61 = v64;
      if (!v40)
      {
        long long v41 = SBLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          long long v42 = v61;
          -[SBIconController iconManager:viewControllerForCustomIcon:element:]();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        long long v42 = v61;
        goto LABEL_17;
      }
LABEL_15:
      long long v41 = [(SBIconController *)self iconManager];
      [(SBIconController *)self iconManager:v41 dataSource:v35 ofIcon:v9 didUpdateConfigurationData:v40];
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  long long v43 = self;
  char v44 = objc_opt_isKindOfClass();

  if (v44)
  {
    id v35 = v10;
    id v36 = objc_alloc_init(MEMORY[0x1E4FB74E8]);
    long long v45 = [v9 gridSizeClass];
    [v36 setFamily:CHSWidgetFamilyForSBHIconGridSizeClass()];

    long long v38 = [(SBIconController *)self iconManager];
    long long v39 = [v38 intentForDataSource:v35 ofIcon:v9];
    if (!v39)
    {
      long long v39 = WFCreateShortcutsSmallWidgetConfigurationIntent();
      id v63 = 0;
      long long v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v39 requiringSecureCoding:1 error:&v63];
      id v61 = v63;
      if (!v40)
      {
        long long v41 = SBLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          long long v42 = v61;
          -[SBIconController iconManager:viewControllerForCustomIcon:element:]();
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_18:
    objc_msgSend(v36, "setIntent:", v39, v61);
    id v18 = (id)[objc_alloc(MEMORY[0x1E4FB74F0]) initWithOptions:v36];
    goto LABEL_19;
  }
  long long v46 = self;
  char v47 = objc_opt_isKindOfClass();

  if (v47)
  {
    id v35 = v10;
    id v36 = [(SBIconController *)self iconManager];
    long long v38 = [v36 intentForDataSource:v35 ofIcon:v9];
    if (!v38)
    {
      long long v38 = DOCCreateDefaultHomeScreenWidgetIntent();
      id v62 = 0;
      long long v48 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v38 requiringSecureCoding:1 error:&v62];
      id v49 = v62;
      if (v48)
      {
        long long v50 = [(SBIconController *)self iconManager];
        [(SBIconController *)self iconManager:v50 dataSource:v35 ofIcon:v9 didUpdateConfigurationData:v48];
      }
      else
      {
        long long v50 = SBLogCommon();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[SBIconController iconManager:viewControllerForCustomIcon:element:].cold.4();
        }
      }
    }
    if (!self->_filesWidgetExtensionProviders)
    {
      long long v55 = [MEMORY[0x1E4F1CA60] dictionary];
      filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
      self->_filesWidgetExtensionProviders = v55;
    }
    long long v39 = [v35 uniqueIdentifier];
    uint64_t v57 = [(NSMutableDictionary *)self->_filesWidgetExtensionProviders objectForKey:v39];
    if (v57)
    {
      id v58 = (id)v57;
      [MEMORY[0x1E4F1CA60] cancelPreviousPerformRequestsWithTarget:self->_filesWidgetExtensionProviders selector:sel_removeObjectForKey_ object:v39];
    }
    else
    {
      id v58 = objc_alloc_init(MEMORY[0x1E4FA6250]);
      long long v59 = self->_filesWidgetExtensionProviders;
      long long v60 = [v35 uniqueIdentifier];
      [(NSMutableDictionary *)v59 setObject:v58 forKey:v60];
    }
    id v18 = [v58 filesWidgetViewControllerWithConfiguration:v38];

LABEL_19:
    if (v18) {
      goto LABEL_28;
    }
  }
LABEL_25:
  long long v51 = SBLogCommon();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    -[SBIconController iconManager:viewControllerForCustomIcon:element:]((uint64_t)v10, v51);
  }

  id v52 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  long long v53 = [MEMORY[0x1E4F428B8] cyanColor];
  [v52 setBackgroundColor:v53];

  id v18 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  [v18 setView:v52];

LABEL_28:
  return v18;
}

- (BOOL)iconManager:(id)a3 shouldCacheRecentViewController:(id)a4 forIdentifier:(id)a5
{
  filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
  id v6 = a5;
  double v7 = [(NSMutableDictionary *)filesWidgetExtensionProviders allKeys];
  char v8 = [v7 containsObject:v6];

  return v8 ^ 1;
}

- (void)iconManager:(id)a3 willRemoveViewControllerForIdentifier:(id)a4
{
  id v6 = a4;
  id v5 = -[NSMutableDictionary objectForKey:](self->_filesWidgetExtensionProviders, "objectForKey:");

  if (v5) {
    [(NSMutableDictionary *)self->_filesWidgetExtensionProviders performSelector:sel_removeObjectForKey_ withObject:v6 afterDelay:10.0];
  }
}

- (id)fallbackDefaultFirstPageWidgetsForIconManager:(id)a3
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  id v5 = (id *)MEMORY[0x1E4FA6530];
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    id v5 = (id *)MEMORY[0x1E4FA6560];
  }
  id v6 = *v5;
  double v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  id v9 = objc_alloc(MEMORY[0x1E4FA6488]);
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v10 = (void *)[v9 initWithWidgetExtensionIdentifiers:&unk_1F3347A48 widgetKinds:&unk_1F3347A60 widgetContainerBundleIdentifiers:&unk_1F3347A48];
    [v10 setGridSizeClass:v6];
    id v11 = objc_alloc(MEMORY[0x1E4FA6488]);
    v19[0] = @"com.apple.weather";
    v19[1] = @"com.apple.reminders.widget";
    double v12 = [MEMORY[0x1E4F1CA98] null];
    v19[2] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    uint64_t v14 = (void *)[v11 initWithWidgetExtensionIdentifiers:&unk_1F3347A78 widgetKinds:v13 widgetContainerBundleIdentifiers:&unk_1F3347A90];

    id v15 = v14;
  }
  else
  {
    id v10 = (void *)[v9 initWithWidgetExtensionIdentifiers:&unk_1F3347AF0 widgetKinds:&unk_1F3347B08 widgetContainerBundleIdentifiers:&unk_1F3347B20];
    [v10 setGridSizeClass:v6];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidgetExtensionIdentifiers:&unk_1F3347AA8 widgetKinds:&unk_1F3347AC0 widgetContainerBundleIdentifiers:&unk_1F3347AD8];
    uint64_t v14 = v15;
  }
  [v15 setGridSizeClass:v6];
  v18[0] = v10;
  v18[1] = v14;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  return v16;
}

- (id)iconManager:(id)a3 willAddDefaultFirstPageWidgetsBasedOnPinnedWidgets:(id)a4 suggestionWidgets:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C978] array];
  double v12 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic", (uint8_t *)&v24, 2u);
  }

  double v13 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    int64_t v15 = [(SBIconController *)self userIconStateFileStatus];
    long long v16 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 67109120;
      LODWORD(v25) = v15 == 1;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic isDefaultIconState(%d)", (uint8_t *)&v24, 8u);
    }

    if ((unint64_t)[v10 count] <= 1)
    {
      id v17 = [(SBIconController *)self fallbackDefaultFirstPageWidgetsForIconManager:v8];
      uint64_t v18 = [v10 arrayByAddingObjectsFromArray:v17];

      id v10 = (id)v18;
    }
    id v19 = [[SBWidgetOnboardingLayoutBuilder alloc] initWithPinnedWidgets:v9 suggestionWidgets:v10];
    [(SBWidgetOnboardingLayoutBuilder *)v19 migratedDefaultWidgets:v15 == 1];
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v21 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = @"upgrade";
      int v24 = 138412802;
      if (v15 == 1) {
        uint64_t v22 = @"erase";
      }
      uint64_t v25 = v22;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Migration pinned widgets with %@ install \n PinnedWidgets = %@ \n SuggestionWidgets = %@", (uint8_t *)&v24, 0x20u);
    }

    id v11 = v19;
  }
  else
  {
    id v20 = v10;
    id v10 = v20;
  }

  return v20;
}

- (BOOL)iconManagerShouldShowWidgetIntroductionPopoverForDefaultWidgets:(id)a3
{
  return (objc_msgSend(MEMORY[0x1E4F42738], "isRunningInStoreDemoMode", a3) & 1) == 0
      && [(SBIconController *)self userIconStateFileStatus] == 2;
}

- (id)widgetIntroductionPreviewViewForIconManager:(id)a3
{
  uint64_t v4 = [(SBIconController *)self interfaceOrientationForIconManager:a3];
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  SBScreenBounds(v4);
  double v8 = v7;
  double v10 = v9;
  id v11 = [SBHomeScreenPreviewView alloc];
  double v12 = [(SBIconController *)self iconManager];
  double v13 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v11, "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v12, 0, 0, 0, 0, v5, v6, v8, v10);

  uint64_t v14 = [(SBIconController *)self mainDisplayWindowScene];
  int64_t v15 = [[SBViewSnapshotProvider alloc] initWithWindowScene:v14 view:v13 orientation:v4];
  id v16 = objc_alloc(MEMORY[0x1E4FA6440]);
  id v17 = [(SBViewSnapshotProvider *)v15 snapshot];
  uint64_t v18 = (void *)[v16 initWithPreview:v13 withSnapshot:v17];

  return v18;
}

- (void)iconManagerDidAddOrRemoveWidgetIcon:(id)a3
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = [(SBIconController *)self homeScreenViewController];
    [v4 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (int64_t)iconManagerListsFixedIconLocationBehavior:(id)a3
{
  return 4;
}

- (BOOL)iconManagerAppliesListsFixedIconLocationBehaviorOnlyToNewLists:(id)a3
{
  return 1;
}

- (void)iconManagerPreferredProminentPosterColor:(id)a3 handler:(id)a4
{
  if (a4) {
    [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator fetchWallpaperProminentColor:a4];
  }
}

- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v7 = a3;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    double v8 = [(SBIconController *)self homeScreenViewController];
    [v8 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
  int v9 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if ((v9 & 1) == 0) {
    [(SBTodayViewController *)self->_todayViewController resetForSpotlightDismissalAnimated:1];
  }
  [(SBIconController *)self removeIconOcclusionReason:1 updateVisibleIcons:1];
  uint64_t v10 = [v7 pageState];

  if (SBRootFolderPageStateIsSearch())
  {
    id v11 = [(SBIconController *)self iconManager];
    if ([v11 isShowingModalInteraction]) {
      [v11 dismissModalInteractionsImmediately];
    }
  }
  if (v10 == 2)
  {
    double v12 = [(SBIconController *)self todayViewController];
    [v12 setDisplayLayoutElementActive:1];
    [v12 setNeedsFocusUpdate];
  }
  if ((v9 & SBRootFolderPageStateIsOnIconPage()) == 1)
  {
    double v13 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v13))
    {
      __int16 v17 = 0;
      uint64_t v14 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      int64_t v15 = (uint8_t *)&v17;
LABEL_18:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v14, " enableTelemetry=YES  isAnimation=YES ", v15, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    double v13 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v13))
    {
      __int16 v16 = 0;
      uint64_t v14 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      int64_t v15 = (uint8_t *)&v16;
      goto LABEL_18;
    }
LABEL_19:

    kdebug_trace();
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5
{
  if (a4 == 1)
  {
    double v6 = [(SBIconController *)self searchPresentableViewController];

    if (!v6)
    {
      id v7 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
      [v7 setRevealProgress:a5];
    }
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6
{
  BOOL v6 = a6;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    uint64_t v10 = [(SBIconController *)self homeScreenViewController];
    [v10 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
  if (v6) {
    int64_t v11 = a5;
  }
  else {
    int64_t v11 = a4;
  }
  int IsSearch = SBRootFolderPageStateIsSearch();
  if (IsSearch)
  {
    double v13 = +[SBReachabilityManager sharedInstance];
    [v13 deactivateReachability];
  }
  if (a4 == 3 && a5 == 2)
  {
    uint64_t v14 = [(SBTodayViewController *)self->_todayViewController transitionContext];

    if (v14)
    {
      [(SBTodayViewController *)self->_todayViewController resetForSpotlightDismissalAnimated:0];
      [(SBTodayViewController *)self->_todayViewController setTransitionContext:0];
    }
  }
  if (IsSearch)
  {
    [(SBIconController *)self addIconOcclusionReason:1 updateVisibleIcons:1];
    int64_t v15 = [(SBIconController *)self suspendWallpaperAnimationForSpotlightAssertion];
    [v15 invalidate];

    __int16 v16 = +[SBWallpaperController sharedInstance];
    __int16 v17 = [v16 suspendWallpaperAnimationForReason:@"SBIconControllerSuspendingWallpaperForSpotlightReason"];
    [(SBIconController *)self setSuspendWallpaperAnimationForSpotlightAssertion:v17];
  }
  else
  {
    [(SBIconController *)self removeIconOcclusionReason:1 updateVisibleIcons:1];
    if (SBRootFolderPageStateIsSearch())
    {
      uint64_t v18 = [(SBIconController *)self suspendWallpaperAnimationForSpotlightAssertion];
      [v18 invalidate];

      [(SBIconController *)self setSuspendWallpaperAnimationForSpotlightAssertion:0];
    }
  }
  if (v11 == 2)
  {
    id v19 = [(SBIconController *)self todayViewController];
    [v19 setDisplayLayoutElementActive:1];
    [v19 setNeedsFocusUpdate];
  }
  if (SBRootFolderPageStateIsOnIconPage() && SBRootFolderPageStateIsOnLeadingCustomPage())
  {
    id v20 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v20))
    {
      __int16 v24 = 0;
      uint64_t v21 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      uint64_t v22 = (uint8_t *)&v24;
LABEL_26:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v21, " enableTelemetry=YES  isAnimation=YES ", v22, 2u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    id v20 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v20))
    {
      __int16 v23 = 0;
      uint64_t v21 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      uint64_t v22 = (uint8_t *)&v23;
      goto LABEL_26;
    }
LABEL_27:

    kdebug_trace();
  }
}

- (id)rootFolderController:(id)a3 transitionContextForTransitioningToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [v10 pageState];
  double v12 = [v10 headerView];

  if (v12)
  {
    if (SBRootFolderPageStateIsSearch())
    {
      uint64_t IsSearch = 1;
LABEL_9:
      if (SBRootFolderPageStateIsOnLeadingCustomPage()) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = SBRootFolderPageStateIsOnLeadingCustomPage();
      }
      int64_t v15 = [(SBIconController *)self transitionContextToShowSpotlight:IsSearch fromTodayView:v14 animated:v7 interactive:v6];
      goto LABEL_14;
    }
    if (SBRootFolderPageStateIsSearch())
    {
      uint64_t IsSearch = 0;
      goto LABEL_9;
    }
  }
  else if (a4 == 3 || v11 == 3)
  {
    uint64_t IsSearch = SBRootFolderPageStateIsSearch();
    goto LABEL_9;
  }
  int64_t v15 = 0;
LABEL_14:
  return v15;
}

- (id)transitionContextToShowSpotlight:(BOOL)a3 fromTodayView:(BOOL)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = (id)*MEMORY[0x1E4F43EC0];
  id v12 = (id)*MEMORY[0x1E4F43EC8];
  if (!a3)
  {
    id v13 = (id)*MEMORY[0x1E4F43EB0];

    id v14 = (id)*MEMORY[0x1E4F43EB8];
    id v12 = v14;
    id v11 = v13;
  }
  BOOL v29 = v7;
  id v27 = v12;
  if (v7)
  {
    int64_t v15 = objc_alloc_init(SBSpotlightTransitionAnimator);
    __int16 v28 = v15;
    BOOL v16 = v8;
    if (v6) {
      __int16 v17 = [[SBSpotlightTransitionInteractor alloc] initWithAnimator:v15];
    }
    else {
      __int16 v17 = 0;
    }
  }
  else
  {
    BOOL v16 = v8;
    __int16 v17 = 0;
    __int16 v28 = 0;
  }
  uint64_t v18 = [(SBIconController *)self _rootFolderController];
  id v19 = [v18 contentView];
  id v20 = [(SBIconController *)self spotlightViewController];
  uint64_t v21 = [v20 view];
  [v19 bounds];
  objc_msgSend(v21, "setFrame:");
  id v22 = objc_alloc_init(MEMORY[0x1E4FA6480]);
  __int16 v23 = [v18 searchableLeadingCustomWrapperView];
  [v22 setContainerView:v23];

  if (v16)
  {
    __int16 v24 = [(SBIconController *)self todayViewController];
    if (v24) {
      [v22 setViewController:v24 forKey:@"SBSpotlightInitiatingViewControllerKey"];
    }
  }
  else
  {
    __int16 v24 = [v18 headerView];
    if (v24) {
      [v22 setView:v24 forKey:@"SBSpotlightSearchHeaderViewKey"];
    }
  }

  [v22 setViewController:v20 forKey:v11];
  [v22 setView:v21 forKey:v27];
  uint64_t v25 = [v18 searchBackdropView];
  [v22 setView:v25 forKey:@"SBSpotlightSearchBackdropViewKey"];

  [v22 setAnimator:v28];
  [v22 setInteractor:v17];
  [v22 setWantsAnimation:v29];

  return v22;
}

- (void)popToCurrentRootIconListWhenPossible
{
  BOOL v3 = [(SBIconController *)self iconManager];
  [v3 popToCurrentRootIconListWhenPossible];

  [(SBIconController *)self dismissHomeScreenOverlaysAnimated:0];
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  id v3 = [(SBIconController *)self iconManager];
  if ([v3 isShowingModalInteraction]) {
    [v3 dismissModalInteractions];
  }
  [v3 dismissIconContextMenu];
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  BOOL v6 = a6;
  [a3 presentationProgress];
  double v9 = v8;
  int v10 = BSFloatGreaterThanFloat();
  homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
  if (v10)
  {
    if (!homeScreenOverlayFloatingDockBehaviorAssertion)
    {
      id v12 = [(SBIconController *)self mainDisplayWindowScene];
      id v13 = [v12 floatingDockController];
      id v14 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v13 visibleProgress:1 animated:1 gesturePossible:4 atLevel:@"homeScreenOverlay" reason:0 withCompletion:1.0 - v9];
      int64_t v15 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
      self->_homeScreenOverlayFloatingDockBehaviorAssertion = v14;
    }
    if (BSFloatIsZero()) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = BSFloatIsOne() ^ 1;
    }
    [(SBFloatingDockBehaviorAssertion *)self->_homeScreenOverlayFloatingDockBehaviorAssertion modifyProgress:v16 interactive:0 completion:1.0 - v9];
  }
  else
  {
    [(SBFloatingDockBehaviorAssertion *)homeScreenOverlayFloatingDockBehaviorAssertion invalidate];
    __int16 v17 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;
  }
  BOOL v18 = v9 < 1.0 && v9 > 0.0;
  id v20 = [(SBIconController *)self iconManager];
  [v20 setOverlayTodayViewVisible:v10 & v6 todayViewTransitioning:v18 & v6];
  id v19 = [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController trailingSidebarViewController];

  if (v19) {
    [v20 setMainDisplayLibraryViewVisible:v10 & !v6 libraryViewTransitioning:v18 && !v6];
  }
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsZero()) {
    [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController updateExtraButtonVisibilityAnimated:0];
  }
}

- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = NSStringFromSelector(a2);
  [(SBIconController *)self setWallpaperAnimationDisabled:v4 forReason:v6];

  if (!v4)
  {
    [(SBFloatingDockBehaviorAssertion *)self->_homeScreenOverlayFloatingDockBehaviorAssertion invalidate];
    homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;
  }
  [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController updateExtraButtonVisibilityAnimated:0];
  double v8 = [(SBIconController *)self _rootFolderController];
  [v8 setSuppressesExtraEditingButtons:v4];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:SBIconControllerOverlayVisibilityDidChangeNotification object:self];
}

- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayController:(id)a3
{
  return 0;
}

- (void)homeScreenOverlayWantsToEndEditing:(id)a3
{
  id v3 = [(SBIconController *)self iconManager];
  [v3 setEditing:0];
}

- (void)homeScreenOverlayWantsWidgetEditingViewControllerPresented:(id)a3
{
  id v5 = [(SBIconController *)self _rootFolderController];
  BOOL v4 = [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController viewController];
  [v5 presentWidgetEditingViewControllerFromViewController:v4];
}

- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activeSidebarViewController];

  if (v5)
  {
    BOOL v6 = [v4 activeSidebarViewController];
    BOOL v7 = [(SBIconController *)self iconManager];
    double v8 = [v7 overlayTodayViewController];
    BOOL v9 = v6 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayController:(id)a3
{
  id v3 = [(SBIconController *)self iconManager];
  char v4 = [v3 showsDoneButtonWhileEditing];

  return v4;
}

- (BOOL)isEditingForHomeScreenOverlayController:(id)a3
{
  id v3 = [(SBIconController *)self iconManager];
  char v4 = [v3 isEditing];

  return v4;
}

- (void)homeScreenOverlayController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(SBIconController *)self todayViewController];
  [v7 setSuppressesEditingStateForListViews:v4];
  BOOL v6 = [(SBIconController *)self overlayLibraryViewController];
  [v6 setSuppressesEditingStateForListViews:v4];
}

- (id)homeScreenOverlayController:(id)a3 displayLayoutIdentifierForSidebarViewController:(id)a4
{
  id v6 = a4;
  id v7 = [(SBIconController *)self overlayLibraryViewController];

  if (v7 == v6)
  {
    id v11 = (id *)MEMORY[0x1E4FA6F20];
  }
  else
  {
    id v8 = [(SBIconController *)self todayViewController];

    if (v8 == v6
      || v6
      && ([(SBIconController *)self leftOfHomeAppViewController],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          v9 == v6))
    {
      id v11 = (id *)MEMORY[0x1E4FA6F88];
    }
    else
    {
      int v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"SBIconController.m", 4540, @"unexpected sidebar view controller: %@", v6 object file lineNumber description];

      id v11 = (id *)MEMORY[0x1E4FA6F40];
    }
  }
  id v12 = *v11;

  return v12;
}

- (void)handleSpotlightPresentationFromViewController:(id)a3
{
  id v3 = [(SBIconController *)self _rootFolderController];
  if (([v3 isTransitioningPageState] & 1) == 0) {
    [v3 presentSpotlightAnimated:1 completionHandler:0];
  }
}

- (void)handleSpotlightDismissalFromViewController:(id)a3
{
  id v3 = [(SBIconController *)self _rootFolderController];
  if (([v3 isTransitioningPageState] & 1) == 0) {
    [v3 dismissSpotlightAnimated:1 completionHandler:0];
  }
}

- (unint64_t)defaultSearchViewPresentationSourceForViewController:(id)a3
{
  id v3 = [(SBIconController *)self _rootFolderController];
  uint64_t v4 = [v3 pageState];
  uint64_t v5 = [v3 destinationPageState];
  if ([v3 presentationSource])
  {
    unint64_t v6 = [v3 presentationSource];
  }
  else if (v5 == 3 || v4 == 3)
  {
    unint64_t v6 = 2;
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (void)todayViewWantsToEndEditing:(id)a3
{
  id v3 = [(SBIconController *)self iconManager];
  [v3 setEditing:0];
}

- (void)todayViewControllerWillPresentSpotlight:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:SBIconControllerOverlayVisibilityDidChangeNotification object:self];

  id v5 = [(SBIconController *)self iconManager];
  [v5 dismissModalInteractionsImmediately];
}

- (void)todayViewDidAppear:(id)a3
{
  id v3 = [(SBIconController *)self proactiveUsageObserver];
  [v3 logTodayViewDidAppear];
}

- (void)todayViewControllerDidAppear:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [(SBIconController *)self todayViewDisplayLayoutAssertion];
  if (!v4)
  {
    id v5 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
    id v6 = [v5 leadingSidebarViewController];

    if (v6 == v17)
    {
      uint64_t v4 = 0;
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4FA6A68]);
      id v8 = (void *)[v7 initWithIdentifier:*MEMORY[0x1E4FA6F88]];
      id v9 = [v17 listView];
      int v10 = [v9 window];
      [v10 level];
      [v8 setLevel:(uint64_t)v11];

      [v8 setLayoutRole:6];
      id v12 = [v17 listView];
      id v13 = [v12 window];
      [v12 bounds];
      objc_msgSend(v13, "_convertRectToSceneReferenceSpace:");
      objc_msgSend(v8, "setReferenceFrame:");
      id v14 = [v17 _sbWindowScene];
      int64_t v15 = [v14 displayLayoutPublisher];
      uint64_t v4 = [v15 addElement:v8];

      [(SBIconController *)self setTodayViewDisplayLayoutAssertion:v4];
    }
  }
  uint64_t v16 = [(SBIconController *)self homeScreenViewController];
  [v16 setHomeAffordanceInteractionAllowed:0];
}

- (void)todayViewControllerDidDisappear:(id)a3
{
  id v5 = [(SBIconController *)self todayViewDisplayLayoutAssertion];
  [v5 invalidate];
  [(SBIconController *)self setTodayViewDisplayLayoutAssertion:0];
  uint64_t v4 = [(SBIconController *)self homeScreenViewController];
  [v4 setHomeAffordanceInteractionAllowed:1];
}

- (void)activateTodayViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconController *)self _rootFolderController];
  uint64_t v6 = [v5 minimumPageIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __52__SBIconController_activateTodayViewWithCompletion___block_invoke;
  v8[3] = &unk_1E6AF6828;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 setCurrentPageIndex:v6 animated:1 completion:v8];
}

void __52__SBIconController_activateTodayViewWithCompletion___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _homeScreenOverlayControllerIfNeeded];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SBIconController_activateTodayViewWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6AF5A50;
  id v4 = *(id *)(a1 + 40);
  [v2 setPresentationProgress:0 interactive:1 animated:v3 completionHandler:1.0];
}

uint64_t __52__SBIconController_activateTodayViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)searchPresentablesForPresenter:(id)a3
{
  _DWORD v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(SBIconController *)self searchPresentableViewController];
  if (v4)
  {
    id v5 = [(SBIconController *)self searchPresentableViewController];
    v8[0] = v5;
    v8[1] = self;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)displayConfigurationForPresenter:(id)a3
{
  id v3 = [(SBIconController *)self _rootFolderController];
  id v4 = [v3 _sbDisplayConfiguration];

  return v4;
}

- (double)searchTopOffsetForSearchPresenter:(id)a3
{
  [a3 interactivePresentationMetrics];
  return -v3;
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  id v4 = [(SBIconController *)self policyAggregator];
  char v5 = [v4 allowsCapability:9];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = SBLogSpotlight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Disallowing Spotlight presentation over home screen: disallowed by ManagedConfiguration", buf, 2u);
    }
    goto LABEL_15;
  }
  uint64_t v6 = [(SBIconController *)self _rootFolderController];
  id v7 = [(SBIconController *)self searchPresenterPageStateTransition];
  if (v7)
  {
  }
  else if (([v6 canTransitionPageStateToState:1] & 1) == 0)
  {
    id v8 = SBLogSpotlight();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      id v9 = "Disallowing Spotlight presentation over home screen: cannot perform transition";
      int v10 = v14;
      goto LABEL_13;
    }
LABEL_14:

LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  if ([v6 isScrolling])
  {
    id v8 = SBLogSpotlight();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v9 = "Disallowing Spotlight presentation over home screen: scrolling";
      int v10 = (uint8_t *)&v13;
LABEL_13:
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v5 = [(SBIconController *)self _rootFolderController];
  [v5 setScrollingDisabled:1 forReason:@"SBIconControllerDisableScrollingForSearchPresentationReason"];
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 contentView];
  id v8 = SBSafeCast(v6, v7);

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      id v9 = [(SBIconController *)self scrollAccessoryAuxiliaryView];

      if (v9) {
        [v8 setPageControlAlpha:0.0];
      }
    }
    int v10 = [(SBIconController *)self scrollAccessoryBorrowedForSearchPresentationAssertion];

    if (!v10)
    {
      BOOL v11 = [v8 borrowScrollAccessoryForReason:@"SearchPresentation"];
      [(SBIconController *)self setScrollAccessoryBorrowedForSearchPresentationAssertion:v11];
    }
  }
  id v12 = [(SBIconController *)self searchPresentableViewController];
  __int16 v13 = [v12 view];

  [v13 setHidden:0];
  id v14 = [v13 superview];
  [v14 bringSubviewToFront:v13];

  int64_t v15 = [(SBIconController *)self searchPresenterPageStateTransition];
  char v16 = [v15 isValid];
  id v17 = SBLogRootController();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      id v19 = _SBFLoggingMethodProem();
      int v24 = 138543362;
      uint64_t v25 = v19;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (v18)
    {
      id v20 = _SBFLoggingMethodProem();
      int v24 = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 1026;
      BOOL v27 = v15 == 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v24,
        0x12u);
    }
    uint64_t v21 = [(SBIconController *)self _rootFolderController];
    uint64_t v22 = [v21 beginPageStateTransitionToState:1 reason:@"SBIconController-SearchPresenter-Present" animated:1 interactive:1];

    [(SBIconController *)self setSearchPresenterPageStateTransition:v22];
    [(SBIconController *)self setSearchPresenterDestinationPageState:1];
    int64_t v15 = (void *)v22;
  }
  __int16 v23 = [(SBIconController *)self homeScreenViewController];
  [v23 setHomeAffordanceInteractionAllowed:0];
}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBIconController *)self searchPresenterPageStateTransition];
  objc_msgSend(v4, "endTransitionSuccessfully:", -[SBIconController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 1);
  char v5 = SBLogRootController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v7, 0xCu);
  }
  [(SBIconController *)self setSearchPresenterPageStateTransition:0];
  [(SBIconController *)self setSearchPresenterDestinationPageState:-1];
}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v5 = [(SBIconController *)self _rootFolderController];
  [v5 setScrollingDisabled:0 forReason:@"SBIconControllerDisableScrollingForSearchPresentationReason"];
  uint64_t v6 = [(SBIconController *)self searchPresenterPageStateTransition];
  char v7 = [v6 isValid];
  id v8 = SBLogRootController();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = _SBFLoggingMethodProem();
      int v15 = 138543362;
      char v16 = v10;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      BOOL v11 = _SBFLoggingMethodProem();
      int v15 = 138543618;
      char v16 = v11;
      __int16 v17 = 1026;
      BOOL v18 = v6 == 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v15,
        0x12u);
    }
    id v12 = [(SBIconController *)self _rootFolderController];
    uint64_t v13 = [v12 beginPageStateTransitionToState:0 reason:@"SBIconController-SearchPresenter-Dismiss" animated:1 interactive:1];

    [(SBIconController *)self setSearchPresenterPageStateTransition:v13];
    [(SBIconController *)self setSearchPresenterDestinationPageState:0];
    uint64_t v6 = (void *)v13;
  }
  id v14 = [(SBIconController *)self homeScreenViewController];
  [v14 setHomeAffordanceInteractionAllowed:1];
}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBIconController *)self scrollAccessoryBorrowedForSearchPresentationAssertion];
  [v4 invalidate];

  [(SBIconController *)self setScrollAccessoryBorrowedForSearchPresentationAssertion:0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(SBIconController *)self _rootFolderController];
  char v7 = [v6 contentView];
  id v8 = SBSafeCast(v5, v7);

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      BOOL v9 = [(SBIconController *)self scrollAccessoryAuxiliaryView];

      if (v9) {
        [v8 setPageControlAlpha:1.0];
      }
    }
  }
  int v10 = [(SBIconController *)self searchPresentableViewController];
  BOOL v11 = [v10 view];
  [v11 setHidden:1];

  id v12 = [(SBIconController *)self searchPresenterPageStateTransition];
  objc_msgSend(v12, "endTransitionSuccessfully:", -[SBIconController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 0);
  uint64_t v13 = SBLogRootController();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = _SBFLoggingMethodProem();
    int v15 = 138543362;
    char v16 = v14;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v15, 0xCu);
  }
  [(SBIconController *)self setSearchPresenterPageStateTransition:0];
  [(SBIconController *)self setSearchPresenterDestinationPageState:-1];
}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
  id v3 = [(SBIconController *)self searchPresenter];
  [v3 dismissSearchAnimated:1];
}

- (id)searchAffordanceViewForSpotlightPresentableViewController:(id)a3
{
  id v4 = [(SBIconController *)self scrollAccessoryAuxiliaryView];
  uint64_t v5 = [(SBIconController *)self rootViewController];
  uint64_t v6 = 0;
  if (v5 && v4)
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

    if (IsReduceMotionEnabled)
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    uint64_t v6 = [MEMORY[0x1E4FA6328] searchPillViewWithSystemDefaultBackground];
    id v8 = [v4 legibilitySettings];
    [v6 setLegibilitySettings:v8];

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleSearchAffordanceTap];
    [v6 addGestureRecognizer:v5];
    [v6 setSearchAffordanceReferenceView:v4];
    id v9 = [(SBIconController *)self _newSearchPillBackgroundView];
    [v6 setSearchAffordanceReferenceBackgroundView:v9];

    uint64_t v10 = objc_opt_class();
    BOOL v11 = [(SBIconController *)self _rootFolderController];
    id v12 = [v11 contentView];
    uint64_t v13 = SBSafeCast(v10, v12);

    if (v13)
    {
      id v14 = [v13 scalingView];
      [v6 setSearchAffordanceReferenceContainerView:v14];
    }
  }

LABEL_9:
  return v6;
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", a3);
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6470]), "initWithFrame:style:", 3, v5, v7, v9, v11);
  [v12 prepareForTransitionToBlurred:1];
  return v12;
}

- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3
{
  return 1;
}

- (void)_handleSearchAffordanceTap
{
  id v2 = [(SBIconController *)self searchPresenter];
  if (![v2 presentationState]) {
    [v2 presentSearchAnimated:1];
  }
}

- (id)_newSearchPillBackgroundView
{
  id v2 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
  [v2 setGroupNameBase:0];
  [v2 setGroupName:@"WallpaperCaptureGroup"];
  id v3 = [v2 layer];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  [v7 setGroupNamespace:*MEMORY[0x1E4F39DA0]];
  return v2;
}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  double v6 = a3;
  if ([(SBIconController *)self searchPresenterDestinationPageState] != 1)double v6 = 1.0 - v6; {
  id v8 = [(SBIconController *)self searchPresenterPageStateTransition];
  }
  [v8 setTransitionProgress:v6];
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  if (a4)
  {
    unint64_t v8 = [(SBIconController *)self searchPresenterOutstandingAnimationCount];
    if (a3 != 1 && !v8) {
      *a5 = 1;
    }
    [(SBIconController *)self setSearchPresenterOutstandingAnimationCount:v8 + 1];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__SBIconController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
    v11[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v12, &location);
    double v9 = (void *)MEMORY[0x1D948C7A0](v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

void __95__SBIconController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSearchPresenterOutstandingAnimationCount:", objc_msgSend(WeakRetained, "searchPresenterOutstandingAnimationCount") - 1);
}

- (id)_identifierForSearchPresenter
{
  return @"HomeScreen";
}

- (void)dismissSearchView
{
  id v2 = [(SBIconController *)self _rootFolderController];
  if (([v2 isTransitioningPageState] & 1) == 0) {
    [v2 dismissSpotlightAnimated:1 completionHandler:0];
  }
}

- (void)dismissAppIconForceTouchControllers:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FA62D0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 dismissAppIconForceTouchControllers:v4];
}

- (BOOL)areAnyIconViewContextMenusAnimating
{
  id v2 = [MEMORY[0x1E4FA62D0] sharedInstance];
  char v3 = [v2 areAnyIconViewContextMenusAnimating];

  return v3;
}

- (BOOL)isAnySearchVisibleOrTransitioning
{
  id v2 = [(SBIconController *)self _rootFolderController];
  char v3 = [v2 isAnySearchVisibleOrTransitioning];

  return v3;
}

- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4FA62D0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 performAfterContextMenuAnimationsHaveCompleted:v4];
}

- (void)earlyTerminateAnyContextMenuAnimations
{
  id v2 = [MEMORY[0x1E4FA62D0] sharedInstance];
  [v2 earlyTerminateAnyContextMenuAnimations];
}

- (BOOL)_isHostedByCoverSheet
{
  id v2 = [(SBIconController *)self coverSheetPresentationManager];
  char v3 = [v2 isCoverSheetHostingUnlockedEnvironmentWindows];

  return v3;
}

- (BOOL)_shouldHideAppIconForceTouchInfoForApplication:(id)a3
{
  char v3 = [a3 info];
  char v4 = [v3 isBlockedForScreenTimeExpiration];

  return v4;
}

- (id)iconManager:(id)a3 applicationShortcutItemsForIconView:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 icon];
  double v9 = [v7 location];
  uint64_t v10 = [v6 isEditingAllowedForIconView:v7];
  if (v10)
  {
    if ([(SBIconController *)self isOnlyHideSuggestionSupportedForIcon:v8 inLocation:v9])
    {
      uint64_t v11 = [(SBIconController *)self isHideSuggestionSupportedForIconView:v7 inLocation:v9];
    }
    else if ([(SBIconController *)self isHideSupportedForIcon:v8 inLocation:v9])
    {
      uint64_t v11 = 2;
    }
    else if ([(SBIconController *)self isUninstallSupportedForIcon:v8])
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v77 = self;
  if ([v8 isApplicationIcon])
  {
    id v12 = [v8 application];
    uint64_t v13 = [v8 applicationPlaceholder];
    id v14 = (void *)v13;
    if (v12)
    {
      long long v66 = v9;
      id v63 = (void *)v13;
      uint64_t v64 = v11;
      BOOL v15 = [(SBIconController *)self _shouldHideAppIconForceTouchInfoForApplication:v12];
      uint64_t v16 = [v12 bundleIdentifier];
      uint64_t v17 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      BOOL v18 = [v17 _recentAppLayoutsController];
      v75 = (void *)v16;
      uint64_t v19 = [v18 recentDisplayItemsForBundleIdentifier:v16 includingHiddenAppLayouts:0];
      uint64_t v62 = [v19 count];

      char v60 = [v6 isIconIgnored:v8];
      id v20 = (void *)MEMORY[0x1E4F4B7E0];
      uint64_t v21 = [v8 applicationBundleID];
      uint64_t v22 = [v20 applicationWithBundleIdentifier:v21];

      int v23 = 0;
      BOOL v72 = v15;
      if (!v15) {
        int v23 = [v22 isLocked] ^ 1;
      }
      long long v59 = (void *)MEMORY[0x1E4FA6278];
      v74 = [v8 displayName];
      if (v15)
      {
        v69 = 0;
      }
      else
      {
        uint64_t v57 = [v12 info];
        v69 = [v57 staticApplicationShortcutItems];
      }
      id v67 = v7;
      id v68 = v6;
      char v65 = v10;
      uint64_t v71 = v22;
      int v61 = v23;
      if (v23)
      {
        id v58 = [v12 dynamicApplicationShortcutItems];
      }
      else
      {
        id v58 = 0;
      }
      long long v42 = [v12 info];
      long long v43 = [v42 itemID];
      uint64_t v44 = [v43 unsignedIntegerValue];
      long long v45 = [v12 info];
      char v46 = [v45 supportsMultiwindow];
      char v47 = [v12 isSystemApplication];
      char v48 = [v12 isInternalApplication];
      id v49 = [v12 info];
      BYTE5(v55) = v65;
      BYTE4(v55) = v60;
      BYTE3(v55) = [v49 isBeta];
      BYTE2(v55) = v48;
      BYTE1(v55) = v47;
      LOBYTE(v55) = v46;
      BOOL v27 = objc_msgSend(v59, "composedShortcutsForApplicationWithBundleIdentifier:iconDisplayName:staticItems:dynamicItems:applicationItemID:numberOfDisplayItemsInSwitcher:supportsMultipleWindows:isSystemApplication:isInternalApplication:isApplicationInBeta:isApplicationHidden:iconManagerAllowsEditing:removeStyle:", v75, v74, v69, v58, v44, v62, v55, v64);

      if (v61) {
      id v7 = v67;
      }
      id v6 = v68;
      double v9 = v66;
      id v14 = v63;
      long long v41 = v71;
      if (!v72)
      {
      }
    }
    else
    {
      if (!v13)
      {
        BOOL v27 = 0;
        goto LABEL_31;
      }
      [(SBIconController *)self applicationPlaceholderController];
      v35 = char v34 = v14;
      id v36 = [v35 placeholdersByDisplayID];
      BOOL v73 = (unint64_t)[v36 count] > 1;

      LOBYTE(v35) = [v34 canBeShared];
      v76 = (void *)MEMORY[0x1E4FA6278];
      uint64_t v37 = [v8 applicationBundleID];
      uint64_t v70 = [v8 displayName];
      v74 = [v34 applicationItemID];
      uint64_t v38 = [v74 unsignedIntegerValue];
      LOBYTE(v56) = (_BYTE)v35;
      id v14 = v34;
      LOBYTE(v55) = v10;
      long long v39 = v76;
      v75 = (void *)v37;
      uint64_t v40 = v37;
      long long v41 = (void *)v70;
      BOOL v27 = [v39 composedShortcutsForDownloadingApplicationWithBundleIdentifier:v40 iconDisplayName:v70 applicationItemID:v38 canModifyDownloadState:1 prioritizationIsAvailable:v73 downloadingInformationAgent:v34 iconManagerAllowsEditing:v55 removeStyle:v11 canShare:v56];
    }

LABEL_31:
    goto LABEL_40;
  }
  if ([v8 isBookmarkIcon])
  {
    int v24 = (void *)MEMORY[0x1E4FA6278];
    id v25 = v8;
    __int16 v26 = [v25 displayName];
    BOOL v27 = [v24 composedShortcutsForBookmarkIcon:v25 withDisplayName:v26 iconManagerAllowsEditing:v10 removeStyle:v11];

    goto LABEL_40;
  }
  if ([v8 isFolderIcon])
  {
    uint64_t v28 = objc_alloc_init(SBForceTouchAppIconInfoProvider);
    BOOL v29 = (void *)MEMORY[0x1E4FA6278];
    uint64_t v30 = [(SBIconController *)self iconManager];
    [v30 iconImageCache];
    v32 = uint64_t v31 = v11;
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __68__SBIconController_iconManager_applicationShortcutItemsForIconView___block_invoke;
    v78[3] = &unk_1E6AFB950;
    v79 = v28;
    uint64_t v33 = v28;
    BOOL v27 = [v29 composedShortcutsForFolderIcon:v8 iconImageCache:v32 iconManagerAllowsEditing:v10 removeStyle:v31 badgeViewGenerator:v78];
  }
  else
  {
    if (![v8 isWidgetIcon])
    {
      BOOL v27 = 0;
      goto LABEL_40;
    }
    long long v50 = [v7 customIconImageViewController];
    char v51 = objc_opt_respondsToSelector();

    if (v51)
    {
      id v52 = [v7 customIconImageViewController];
      uint64_t v33 = [v52 applicationShortcutItems];
    }
    else
    {
      uint64_t v33 = 0;
    }
    BOOL v27 = objc_msgSend(MEMORY[0x1E4FA6278], "composedShortcutsForWidgetIcon:additionalApplicationShortcutItems:widgetIconSupportsConfiguration:iconManagerAllowsEditing:widgetSettings:", v8, v33, objc_msgSend(v7, "supportsConfigurationCard"), v10, self->_widgetSettings);
  }

LABEL_40:
  long long v53 = SBLogIcon();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v81 = v77;
    __int16 v82 = 2114;
    v83 = v27;
    _os_log_impl(&dword_1D85BA000, v53, OS_LOG_TYPE_DEFAULT, "%p: iconManager:applicationShortcutItemsForIconView: %{public}@", buf, 0x16u);
  }

  return v27;
}

id __68__SBIconController_iconManager_applicationShortcutItemsForIconView___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (objc_class *)MEMORY[0x1E4FA63C0];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 configureForIcon:v4 infoProvider:*(void *)(a1 + 32)];

  return v5;
}

- (BOOL)iconManager:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5 forIconView:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v11 icon];
  uint64_t v13 = [v10 type];
  if (([v13 isEqualToString:*MEMORY[0x1E4FA6818]] & 1) != 0
    || ([v13 isEqualToString:*MEMORY[0x1E4FA6830]] & 1) != 0
    || ([v13 isEqualToString:*MEMORY[0x1E4FA6810]] & 1) != 0
    || ([v13 isEqualToString:*MEMORY[0x1E4FA6838]] & 1) != 0
    || [v13 isEqualToString:*MEMORY[0x1E4FA6820]])
  {
    [v9 iconCloseBoxTapped:v11];
LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA67B8]]
    && [v11 supportsConfigurationCard])
  {
    [v11 dismissContextMenuWithCompletion:0];
    [v11 earlyTerminateContextMenuDismissAnimation];
    [v11 presentConfigurationCard];
    goto LABEL_7;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA67B0]]
    && [v11 supportsStackConfigurationCard])
  {
    [v11 presentStackConfigurationCard];
    goto LABEL_7;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA67C0]])
  {
    uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:@"tap-to-radar://new?ComponentID=1083491&ComponentName=Proactive%20Stacks&ComponentVersion=UI&Title=Stack%20rotation%20feedback:&Classification=UI%2FUsability&Description=Give%20details%20here..."];
    SBWorkspaceActivateApplicationFromURL(v22, 0, 0);
LABEL_25:

    goto LABEL_7;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA67D8]])
  {
    uint64_t v23 = objc_opt_class();
    int v24 = [v11 icon];
    SBSafeCast(v23, v24);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    [v9 hideSuggestedWidgetFromStack:v25];
LABEL_60:

    goto LABEL_7;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA67D0]])
  {
    uint64_t v26 = objc_opt_class();
    BOOL v27 = [v11 icon];
    SBSafeCast(v26, v27);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    [v9 hideSiriSuggestionOnWidgetFromStack:v25];
    goto LABEL_60;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA6760]])
  {
    uint64_t v28 = objc_opt_class();
    BOOL v29 = [v11 icon];
    SBSafeCast(v28, v29);
    id v25 = (id)objc_claimAutoreleasedReturnValue();

    [v9 addSuggestedActiveWidgetToStack:v25];
    goto LABEL_60;
  }
  if (([v12 isWidgetIcon] & 1) != 0 || objc_msgSend(v12, "isApplicationIcon"))
  {
    if ([v13 isEqualToString:*MEMORY[0x1E4FA67A0]])
    {
      uint64_t v30 = *MEMORY[0x1E4FA6788];
LABEL_40:
      if ([v13 isEqualToString:v30])
      {
        double v32 = (id *)MEMORY[0x1E4FA6528];
      }
      else if ([v13 isEqualToString:*MEMORY[0x1E4FA6780]])
      {
        double v32 = (id *)MEMORY[0x1E4FA6520];
      }
      else if ([v13 isEqualToString:*MEMORY[0x1E4FA6798]])
      {
        double v32 = (id *)MEMORY[0x1E4FA6538];
      }
      else
      {
        int v39 = [v13 isEqualToString:*MEMORY[0x1E4FA6790]];
        double v32 = (id *)MEMORY[0x1E4FA6560];
        if (v39) {
          double v32 = (id *)MEMORY[0x1E4FA6530];
        }
      }
      id v25 = *v32;
      if ([v12 isWidgetIcon]) {
        [v9 changeSizeOfWidgetIcon:v12 toSizeClass:v25];
      }
      else {
        [v9 replaceAppIcon:v12 withWidgetOfSize:v25];
      }
      goto LABEL_60;
    }
    char v31 = [v13 isEqualToString:*MEMORY[0x1E4FA6790]];
    uint64_t v30 = *MEMORY[0x1E4FA6788];
    if ((v31 & 1) != 0
      || ([v13 isEqualToString:*MEMORY[0x1E4FA6788]] & 1) != 0
      || ([v13 isEqualToString:*MEMORY[0x1E4FA6780]] & 1) != 0
      || [v13 isEqualToString:*MEMORY[0x1E4FA6798]])
    {
      goto LABEL_40;
    }
  }
  if ([v12 isWidgetIcon]
    && ([v12 isWidgetStackIcon] & 1) == 0
    && [v13 isEqualToString:*MEMORY[0x1E4FA67A8]])
  {
    [v9 replaceWidgetIconWithAppIcon:v12];
    goto LABEL_7;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA6828]])
  {
    [v11 startForbiddingEditingModeWithReason:@"SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"];
    [v9 setEditing:1 fromIconView:v11];
    objc_initWeak((id *)buf, v11);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke;
    v64[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v65, (id *)buf);
    [v11 performAfterContextMenusDismissUsingBlock:v64];
    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
    goto LABEL_7;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA6758]])
  {
    uint64_t v33 = (void *)MEMORY[0x1E4F4B7E0];
    char v34 = [v11 icon];
    id v35 = [v34 applicationBundleID];
    id v36 = [v33 applicationWithBundleIdentifier:v35];

    if ([v36 isHidden])
    {
      uint64_t v37 = [(SBIconController *)self rootViewController];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2;
      v62[3] = &unk_1E6AF5290;
      v62[4] = self;
      id v63 = v12;
      uint64_t v38 = _SBUnhideProtectedAppAlertControllerFor(v36, v62);
      [v37 presentViewController:v38 animated:1 completion:0];
    }
    else
    {
      [(SBIconController *)self addIconToHomeScreen:v12];
    }

    goto LABEL_7;
  }
  if ([v12 isApplicationIcon])
  {
    id v57 = v12;
    if ([v13 isEqualToString:*MEMORY[0x1E4FA6840]])
    {
      uint64_t v56 = [(id)SBApp windowSceneManager];
      uint64_t v40 = [v56 activeDisplayWindowScene];
      long long v41 = [v40 _fbsDisplayConfiguration];
      long long v42 = +[SBApplicationMultiwindowService sharedInstance];
      long long v43 = [v57 applicationBundleID];
      [v42 triggerShowAllWindowsForApplicationBundleIdentifier:v43 displayConfiguration:v41];
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA67F0]])
    {
      [v57 prioritizeDownload];
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA67E8]])
    {
      [v57 pauseDownload];
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA6800]])
    {
      [v57 resumeDownload];
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA6778]])
    {
      [v57 cancelDownload];
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA6808]])
    {
      long long v53 = [v9 iconShareSheetManager];
      [v53 presentShareSheetForIconView:v11];
    }
    else
    {
      uint64_t v54 = *MEMORY[0x1E4FA67E0];
      if (([v13 isEqualToString:*MEMORY[0x1E4FA67E0]] & 1) != 0
        || [v13 isEqualToString:*MEMORY[0x1E4FA6850]])
      {
        objc_msgSend(v57, "changeLockedStatusToLocked:", objc_msgSend(v13, "isEqualToString:", v54));
      }
      else
      {
        uint64_t v55 = *MEMORY[0x1E4FA67C8];
        if (([v13 isEqualToString:*MEMORY[0x1E4FA67C8]] & 1) == 0
          && ![v13 isEqualToString:*MEMORY[0x1E4FA6848]])
        {
          BOOL v14 = 1;
          goto LABEL_98;
        }
        objc_msgSend(v57, "changeHiddenStatusToHidden:", objc_msgSend(v13, "isEqualToString:", v55));
      }
    }
    BOOL v14 = 0;
LABEL_98:

    goto LABEL_8;
  }
  if ([v13 isEqualToString:*MEMORY[0x1E4FA6768]])
  {
    uint64_t v44 = [v10 userInfo];
    id v25 = [v44 objectForKey:*MEMORY[0x1E4FA6770]];

    if (v25)
    {
      long long v45 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
      SBWorkspaceActivateApplicationFromURL(v45, 0, 0);
    }
    goto LABEL_60;
  }
  if ([v12 isBookmarkIcon])
  {
    if (![v12 displaysShareBookmarkShortcutItem]
      || ![v13 isEqualToString:*MEMORY[0x1E4FA6808]])
    {
      goto LABEL_7;
    }
    uint64_t v22 = [v9 iconShareSheetManager];
    [v22 presentShareSheetForIconView:v11];
    goto LABEL_25;
  }
  if ([v12 isFolderIcon])
  {
    if ([v13 isEqualToString:*MEMORY[0x1E4FA6858]])
    {
      char v46 = [(SBIconController *)self applicationController];
      char v47 = [v10 bundleIdentifierToLaunch];
      char v48 = [v46 applicationWithBundleIdentifier:v47];

      SBWorkspaceActivateApplication(v48);
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA67F8]])
    {
      id v52 = [v11 location];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3;
      v59[3] = &unk_1E6AF4A98;
      id v60 = v9;
      id v61 = v11;
      [v60 openFolderIcon:v12 location:v52 animated:1 withCompletion:v59];
    }
    goto LABEL_7;
  }
  id v49 = [v11 customIconImageViewController];
  char v50 = objc_opt_respondsToSelector();

  if (v50)
  {
    char v51 = [v11 customIconImageViewController];
    [v51 didSelectApplicationShortcutItem:v10];
  }
  BOOL v14 = 1;
LABEL_8:
  BOOL v15 = NSString;
  uint64_t v16 = [(SBIconController *)self _aggregateLoggingAppKeyForIcon:v12];
  uint64_t v17 = [v15 stringWithFormat:@"com.apple.springboard.quickaction.selected.%@", v16];

  if ([v12 isApplicationIcon])
  {
    BOOL v18 = [v12 application];
    if (([v18 isSystemApplication] & 1) == 0) {
      [v18 isInternalApplication];
    }
  }
  ADClientAddValueForScalarKey();
  uint64_t v19 = SBLogIcon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    id v20 = @"NO";
    id v67 = self;
    __int16 v68 = 2114;
    if (v14) {
      id v20 = @"YES";
    }
    id v69 = v10;
    __int16 v70 = 2048;
    unint64_t v71 = a5;
    __int16 v72 = 2114;
    id v73 = v11;
    __int16 v74 = 2114;
    v75 = v20;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "%p: iconManager:shouldActivateApplicationShortcutItem:%{public}@ atIndex:%lu forIconView:%{public}@ -- Returning %{public}@", buf, 0x34u);
  }

  return v14;
}

void __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endForbiddingEditingModeWithReason:@"SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"];
}

uint64_t __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addIconToHomeScreen:*(void *)(a1 + 40)];
}

void __90__SBIconController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setEditing:1 fromIconView:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) openedFolderController];
  [v2 beginEditingTitle];
}

- (unint64_t)iconManager:(id)a3 supportedMultitaskingShortcutActionsForIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "icon", a3);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || ![v5 isApplicationIcon]) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v7 userInterfaceIdiom] != 1)
  {
    unint64_t v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v8 = [v5 isApplicationIcon];

  if (v8)
  {
LABEL_7:
    id v7 = [v5 applicationBundleID];
    unint64_t v9 = [(SBIconController *)self supportedMultitaskingShortcutActionsForBundleIdentifier:v7];
    unint64_t v6 = 0;
    switch(v9)
    {
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 8uLL:
        unint64_t v6 = v9;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_13;
      default:
        if (v9 == 16) {
          unint64_t v6 = 16;
        }
        else {
          unint64_t v6 = 0;
        }
        break;
    }
    goto LABEL_13;
  }
LABEL_4:
  unint64_t v6 = 0;
LABEL_14:

  return v6;
}

- (unint64_t)supportedMultitaskingShortcutActionsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconController *)self applicationController];
  unint64_t v6 = [v5 applicationWithBundleIdentifier:v4];

  if (v6)
  {
    id v7 = [(id)SBApp windowSceneManager];
    char v8 = [v7 activeDisplayWindowScene];
    unint64_t v9 = [v8 switcherController];

    unint64_t v10 = [v9 canPerformKeyboardShortcutAction:11 forBundleIdentifier:v4];
    if ([v9 canPerformKeyboardShortcutAction:13 forBundleIdentifier:v4]) {
      v10 |= 6uLL;
    }
    if ([v9 canPerformKeyboardShortcutAction:3 forBundleIdentifier:v4]) {
      v10 |= 8uLL;
    }
    if ([v9 canPerformKeyboardShortcutAction:18 forBundleIdentifier:v4]) {
      v10 |= 0x10uLL;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)addIconToHomeScreen:(id)a3
{
  id v11 = a3;
  id v4 = [(SBIconController *)self iconManager];
  if ([v4 isShowingSpotlightOrLeadingCustomView]) {
    [v4 dismissSpotlightAnimated:1 completionHandler:0];
  }
  id v5 = +[SBMainWorkspace sharedInstance];
  unint64_t v6 = [v5 transientOverlayPresentationManager];

  if ([v6 hasActivePresentation])
  {
    id v7 = +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers];
    [v6 performDismissalRequest:v7];
  }
  [v4 addNewIconToDesignatedLocation:v11 options:91];
  if ([(SBIconController *)self isModalAppLibrarySupported])
  {
    char v8 = [(SBIconController *)self mainDisplayWindowScene];
    unint64_t v9 = [v8 modalLibraryController];
    unint64_t v10 = [v9 libraryViewController];
  }
  else
  {
    unint64_t v10 = [(SBIconController *)self overlayLibraryViewController];
  }
  [v10 forcedSearchTextFieldNoneditable:1];
  [v4 setDisablesScrollingToLastIconPageForLibraryDismissal:1];
  [(SBIconController *)self dismissHomeScreenOverlaysAnimated:1];
  [v4 setDisablesScrollingToLastIconPageForLibraryDismissal:0];
  [v10 forcedSearchTextFieldNoneditable:0];
}

- (void)_forceTouchControllerWillPresent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = [v4 object];

  SBSafeCast(v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    id v7 = [(SBIconController *)self mainDisplayWindowScene];
    char v8 = [v7 floatingDockController];
    if ([v8 isFloatingDockPresented])
    {
      unint64_t v9 = [v11 location];
      if (([v9 isEqual:*MEMORY[0x1E4FA6690]] & 1) == 0)
      {
        unint64_t v10 = [v11 location];
        [v10 isEqual:@"SBIconLocationFloatingDockSuggestions"];
      }
    }
  }
}

- (id)_aggregateLoggingAppKeyForIcon:(id)a3
{
  id v3 = a3;
  if ([v3 isApplicationIcon])
  {
    id v4 = [v3 application];
    uint64_t v5 = [v3 applicationPlaceholder];
    if (([v4 isSystemApplication] & 1) != 0 || objc_msgSend(v4, "isInternalApplication"))
    {
      unint64_t v6 = [v4 bundleIdentifier];
    }
    else if (v4)
    {
      unint64_t v6 = @"thirdParty";
    }
    else if (v5)
    {
      char v8 = [v3 applicationBundleID];
      unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
      unint64_t v10 = v9;
      if (v9)
      {
        id v11 = [v9 typeForInstallMachinery];
        char v12 = [v11 isEqualToString:@"User"];

        if (v12) {
          unint64_t v6 = @"thirdParty";
        }
        else {
          unint64_t v6 = v8;
        }
      }
      else
      {
        unint64_t v6 = @"unknown";
      }
    }
    else
    {
      unint64_t v6 = @"unknown";
    }
  }
  else if ([v3 isBookmarkIcon])
  {
    unint64_t v6 = @"bookmark";
  }
  else if ([v3 isFolderIcon])
  {
    unint64_t v6 = @"folder";
  }
  else
  {
    unint64_t v6 = @"unknown";
  }

  return v6;
}

- (void)_styleEditorWillPresent:(id)a3
{
  id v4 = [(SBIconController *)self mainDisplayWindowScene];
  uint64_t v5 = [v4 zStackResolver];
  unint64_t v6 = [v5 acquireParticipantWithIdentifier:6 delegate:self];
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = v6;

  char v8 = self->_zStackParticipant;
  [(SBIconController *)self zStackParticipantDidChange:v8];
}

- (void)_styleEditorDidDismiss:(id)a3
{
  [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
  zStackParticipant = self->_zStackParticipant;
  self->_zStackParticipant = 0;
}

- (void)_colorDropperWillPresent:(id)a3
{
  id v5 = a3;
  id v17 = [(SBIconController *)self mainDisplayWindowScene];
  unint64_t v6 = [v17 floatingDockController];
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  if (colorPickerInterfactionFloatingDockBehaviorAssertion) {
    [(SBFloatingDockBehaviorAssertion *)colorPickerInterfactionFloatingDockBehaviorAssertion invalidate];
  }
  char v8 = [SBFloatingDockBehaviorAssertion alloc];
  unint64_t v9 = [v5 name];

  unint64_t v10 = [(SBFloatingDockBehaviorAssertion *)v8 initWithFloatingDockController:v6 visibleProgress:1 animated:0 gesturePossible:0 atLevel:v9 reason:0 withCompletion:0.0];
  id v11 = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = v10;

  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  if (duckWallpaperDimmingAssertion) {
    [(BSInvalidatable *)duckWallpaperDimmingAssertion invalidate];
  }
  uint64_t v13 = +[SBWallpaperController sharedInstance];
  BOOL v14 = NSStringFromSelector(a2);
  BOOL v15 = [v13 acquireDuckHomeScreenWallpaperDimAssertionWithReason:v14];
  uint64_t v16 = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = v15;

  [(SBIconController *)self _beginDisablingAllOrientationChangesForReason:@"SBIconControllerDisableRotationForStyleColorDropperReason"];
}

- (void)_colorDropperDismissed:(id)a3
{
  [(SBFloatingDockBehaviorAssertion *)self->_colorPickerInterfactionFloatingDockBehaviorAssertion invalidate];
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = 0;

  [(BSInvalidatable *)self->_duckWallpaperDimmingAssertion invalidate];
  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = 0;

  [(SBIconController *)self _endDisablingAllOrientationChangesForReason:@"SBIconControllerDisableRotationForStyleColorDropperReason"];
}

- (void)_iconForceTouchControllerWillPresent:(id)a3
{
}

- (void)_iconForceTouchControllerDidDismiss:(id)a3
{
}

- (void)_startSpotlightInteractiveGestureTransactionForGesture:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4FA5E28] enableFloatingWindow])
  {
    id v5 = [(SBIconController *)self policyAggregator];
    int v6 = [v5 allowsCapability:9];

    if (v6)
    {
      if (!self->_spotlightInteractiveGestureTransaction)
      {
        id v7 = (void *)SBApp;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke;
        v11[3] = &unk_1E6AF99E8;
        id v12 = v4;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        _DWORD v8[2] = __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2;
        void v8[3] = &unk_1E6AFB9A0;
        id v9 = v12;
        unint64_t v10 = self;
        [v7 beginInteractiveSpotlightTransientOverlayPresentationWithValidator:v11 beginHandler:v8];
      }
    }
  }
}

uint64_t __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDragging];
}

void __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) isDragging])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 352), a2);
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v5 = [v4 completionBlock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3;
    v7[3] = &unk_1E6AFB978;
    id v6 = v5;
    id v8 = v6;
    objc_copyWeak(&v9, &location);
    [v4 setCompletionBlock:v7];
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  else
  {
    [v4 noteGestureFinishedBeforeTransactionBegan];
  }
}

void __75__SBIconController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[44];
    WeakRetained[44] = 0;
    id v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4) {
    [(SBIconController *)self _startSpotlightInteractiveGestureTransactionForGesture:a3];
  }
}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  id v7 = a3;
  if ([v7 isTracking])
  {
    if (self->_spotlightInteractiveGestureTransaction
      || ([(SBIconController *)self _startSpotlightInteractiveGestureTransactionForGesture:v7], self->_spotlightInteractiveGestureTransaction))
    {
      [(id)objc_opt_class() searchHeaderHeight];
      [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)self->_spotlightInteractiveGestureTransaction updatePresentationWithProgress:a4 translation:v6 * a4];
    }
  }
}

- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4
{
  spotlightInteractiveGestureTransaction = self->_spotlightInteractiveGestureTransaction;
  if (spotlightInteractiveGestureTransaction) {
    [(SBSpotlightTransientOverlayInteractiveGestureTransaction *)spotlightInteractiveGestureTransaction endPresentation:a4];
  }
}

- (UIView)containerView
{
  uint64_t v2 = [(SBIconController *)self homeScreenViewController];
  id v3 = [v2 iconContentView];

  return (UIView *)v3;
}

- (UIWindow)animationWindow
{
  uint64_t v2 = [(SBIconController *)self userInterfaceController];
  id v3 = [v2 window];

  return (UIWindow *)v3;
}

- (UIView)fallbackIconContainerView
{
  uint64_t v2 = [(SBIconController *)self userInterfaceController];
  id v3 = [v2 homeScreenContentView];

  return (UIView *)v3;
}

- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4
{
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "alert item will activate", v7, 2u);
  }

  double v6 = [(SBIconController *)self iconManager];
  [v6 cancelAllDrags];
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  if (objc_msgSend(a4, "isMainDisplayWindowScene", a3))
  {
    id v5 = SBLogIconDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "assistant will appear", v8, 2u);
    }

    double v6 = [(SBIconController *)self iconManager];
    [v6 setEditing:0];

    id v7 = [(SBIconController *)self iconManager];
    [v7 cancelAllDrags];
  }
}

- (void)iconManager:(id)a3 willDestroyRootFolderController:(id)a4
{
  id v5 = a4;
  [v5 removePageStateObserver:self];
  [v5 setAccessoryViewControllerDelegate:0];

  id v12 = [(SBIconController *)self homeScreenViewController];
  double v6 = [v12 iconContentView];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [v10 setContentView:0];
  id v11 = [(SBIconController *)self spotlightViewController];
  [v11 invalidate];

  [(SBIconController *)self setSpotlightViewController:0];
}

- (void)iconManager:(id)a3 willDestroyRootViewController:(id)a4
{
  id v5 = a4;
  id v11 = [(SBIconController *)self homeScreenViewController];
  double v6 = [v11 iconContentView];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [v10 setContentView:0];
  [v5 removeFromParentViewController];
  [(SBIconController *)self setRootViewController:v5];
}

- (void)iconManager:(id)a3 willUseRootFolderControllerConfiguration:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (MEMORY[0x1D948A640]())
  {
    if (SBHHomeScreenSearchAffordanceEnabled()
      && (+[SBDefaults localDefaults],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 homeScreenDefaults],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 showsHomeScreenSearchAffordance],
          v8,
          v7,
          v9))
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FA6328]);
      id v11 = [(SBIconController *)self legibilitySettings];
      [v10 setLegibilitySettings:v11];

      [v10 setAccessibilityIdentifier:@"spotlight-pill"];
      [(SBIconController *)self setScrollAccessoryAuxiliaryView:v10];
      [v6 setScrollAccessoryAuxiliaryView:v10];
      id v12 = [(SBIconController *)self _newSearchPillBackgroundView];
      [v6 setScrollAccessoryBackgroundView:v12];
    }
    else
    {
      [(SBIconController *)self setScrollAccessoryAuxiliaryView:0];
    }
    uint64_t v13 = [[SBHomeScreenSpotlightViewController alloc] initWithDelegate:self];
    [(SBIconController *)self setSpotlightViewController:v13];
    BOOL v14 = [[SBSpotlightPresentableViewController alloc] initWithSpotlightMultiplexingViewController:v13];
    [(SBSpotlightPresentableViewController *)v14 setDelegate:self];
    [(SBIconController *)self setSearchPresentableViewController:v14];
    BOOL v15 = [SBSearchPresenter alloc];
    uint64_t v16 = [MEMORY[0x1E4FA6270] rootSettings];
    id v17 = [v16 homeScreenPullToSearchSettings];
    BOOL v18 = [(SBIconController *)self _identifierForSearchPresenter];
    uint64_t v19 = [(SBSearchPresenter *)v15 initWithSettings:v17 identifier:v18];

    [(SBSearchPresenter *)v19 setSearchPresenterDelegate:self];
    [(SBSearchPresenter *)v19 setUsesTransitionDistanceAsStartOffset:1];
    [(SBIconController *)self setSearchPresenter:v19];
    [v6 setSearchPresenter:v19];
    [v6 setSearchPresentableViewController:v14];
  }
  else
  {
    [(SBIconController *)self setSpotlightViewController:0];
    [(SBIconController *)self setSearchPresentableViewController:0];
    [(SBIconController *)self setSearchPresenter:0];
    if ([MEMORY[0x1E4FA5E28] enableFloatingWindow]) {
      goto LABEL_10;
    }
    uint64_t v13 = [[SBHomeScreenSpotlightViewController alloc] initWithDelegate:self];
    [(SBSpotlightMultiplexingViewController *)v13 setSpotlightDelegate:self];
    [(SBIconController *)self setSpotlightViewController:v13];
    [v6 setPullDownSearchViewController:v13];
  }

LABEL_10:
  if ([(SBIconController *)self _isCoplanarHomeScreenEnabled])
  {
    id v20 = [(SBIconController *)self todayViewController];
    [v6 setLeadingCustomViewController:v20];

    uint64_t v21 = [(SBIconController *)self overlayLibraryViewController];
    [v6 setTrailingCustomViewController:v21];

    uint64_t v22 = [(SBIconController *)self overlayLibraryViewController];
    [v22 setPresenter:v26];
  }
  uint64_t v23 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ([(SBIconController *)self allowsHomeScreenOverlay]) {
      [v6 setIgnoresOverscrollOnFirstPageOrientations:30];
    }
    [v6 setFolderPageManagementAllowedOrientations:30];
    [v6 setShowsAddWidgetButtonWhileEditingAllowedOrientations:30];
    if ([(SBIconController *)self isFocusAllowedForIconManager:v26]) {
      [v6 setAddsFocusGuidesForWrapping:1];
    }
  }
  else
  {
    if (![(SBIconController *)self _isCoplanarHomeScreenEnabled])
    {
      [v6 setIgnoresOverscrollOnFirstPageOrientations:30];
      if ([(SBIconController *)self isAppLibrarySupported]) {
        [v6 setIgnoresOverscrollOnLastPageOrientations:6];
      }
    }
    [v6 setFolderPageManagementAllowedOrientations:6];
    [v6 setShowsAddWidgetButtonWhileEditingAllowedOrientations:6];
  }
  id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 postNotificationName:SBIconControllerDidReconfigureChildControllersNotification object:self];
}

- (id)_newTodayViewControllerWithIconManager:(id)a3 iconListModel:(id)a4 rootFolder:(id)a5 location:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [SBTodayViewController alloc];
  uint64_t v13 = [v10 listLayoutProvider];
  BOOL v14 = [(SBHTodayViewController *)v12 initWithListLayoutProvider:v13 iconViewProvider:v10 location:a6];

  if (!v14)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBIconController.m" lineNumber:5524 description:@"Today view controller is not initialized."];
  }
  if (![(SBIconController *)self _isCoplanarHomeScreenEnabled]) {
    [(SBHTodayViewController *)v14 setIconLocation:*MEMORY[0x1E4FA66E0]];
  }
  [(SBHTodayViewController *)v14 setDelegate:self];
  [(SBHTodayViewController *)v14 addObserver:self];
  [(SBHTodayViewController *)v14 setRootFolder:v11];

  [(SBHTodayViewController *)v14 setIconManager:v10];
  -[SBHTodayViewController setEditing:](v14, "setEditing:", [v10 isEditing]);

  return v14;
}

- (id)_createWidgetIconWithDataSource:(id)a3 gridSize:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6488];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithUniqueLeafIdentifier];
  [v8 addIconDataSource:v7];

  [v8 setGridSizeClass:v6];
  return v8;
}

- (id)_createWidgetIconWithKind:(id)a3 extensionBundleIdentifier:(id)a4 gridSize:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4FA6388];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v7 alloc] initWithKind:v10 extensionBundleIdentifier:v9];

  id v12 = SBLogWidgets();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v11 extensionBundleIdentifier];
    BOOL v14 = [v11 uniqueIdentifier];
    int v17 = 138543618;
    BOOL v18 = v13;
    __int16 v19 = 2114;
    id v20 = v14;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created from icon controller.", (uint8_t *)&v17, 0x16u);
  }
  BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidget:v11];
  [v15 setGridSizeClass:v8];

  return v15;
}

- (id)_createWidgetIconWithDescriptors:(id)a3 gridSize:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6488];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithCHSWidgetDescriptors:v7];

  [v8 setGridSizeClass:v6];
  return v8;
}

- (void)iconManager:(id)a3 didCreateRootFolderController:(id)a4
{
  id v5 = a4;
  id v12 = [(SBIconController *)self userInterfaceController];
  [v5 addPageStateObserver:self];
  [v5 setAccessoryViewControllerDelegate:self];
  id v6 = (void *)MEMORY[0x1E4FA61C8];
  id v7 = [MEMORY[0x1E4F42D90] mainScreen];
  id v8 = [v12 window];
  id v9 = [v12 homeScreenContentView];
  id v10 = [v6 contextWithScreen:v7 animationWindow:v8 fallbackIconContainer:v9];
  [v5 setAnimationContext:v10];

  id v11 = [v5 searchGesture];

  [v11 addObserver:self];
}

- (void)iconManager:(id)a3 didCreateRootViewController:(id)a4
{
  id v5 = a4;
  [(SBIconController *)self updateHomeScreenTraitOverridesForViewController:v5];
  id v6 = (void *)*MEMORY[0x1E4F43630];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  __int16 v19 = __60__SBIconController_iconManager_didCreateRootViewController___block_invoke;
  id v20 = &unk_1E6AF5290;
  uint64_t v21 = self;
  id v7 = v5;
  id v22 = v7;
  [v6 _performBlockAfterCATransactionCommits:&v17];
  id v8 = objc_msgSend(v7, "view", v17, v18, v19, v20, v21);
  id v9 = [(SBIconController *)self homeScreenViewController];
  id v10 = [v9 iconContentView];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  [v9 addChildViewController:v7];
  [v14 setContentView:v8];
  [v7 didMoveToParentViewController:v9];
  [v14 sendSubviewToBack:v8];

  BOOL v15 = [(SBIconController *)self userInterfaceController];
  [v15 updateStatusBarLegibilityForWindowScene:0];
  [(SBIconController *)self setRootViewController:v7];
  uint64_t v16 = [(SBIconController *)self searchPresentableViewController];
  [v16 invalidateSearchAffordanceView];
}

uint64_t __60__SBIconController_iconManager_didCreateRootViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeHomeScreenTraitOverridesForViewController:*(void *)(a1 + 40)];
}

- (int64_t)interfaceOrientationForIconManager:(id)a3
{
  id v3 = [(SBIconController *)self homeScreenViewController];
  int64_t v4 = [v3 effectiveOrientation];

  return v4;
}

- (unint64_t)allowedInterfaceOrientationsForIconManager:(id)a3
{
  id v3 = [(SBIconController *)self homeScreenViewController];
  unint64_t v4 = [v3 allowedInterfaceOrientations];

  return v4;
}

- (unint64_t)possibleInterfaceOrientationsForIconManager:(id)a3
{
  id v3 = [(SBIconController *)self homeScreenViewController];
  unint64_t v4 = [v3 possibleInterfaceOrientations];

  return v4;
}

- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3
{
  id v3 = [(SBIconController *)self layoutStateProvider];
  unint64_t v4 = [v3 layoutState];
  BOOL v5 = [v4 unlockedEnvironmentMode] == 1;

  return v5;
}

- (BOOL)isEditingAllowedForIconManager:(id)a3
{
  id v3 = [(SBIconController *)self policyAggregator];
  char v4 = [v3 allowsCapability:17];

  return v4;
}

- (BOOL)iconManager:(id)a3 isPartialEditingAllowedForIconLocation:(id)a4
{
  id v5 = a4;
  if ([(SBIconController *)self hasRestrictedEnforcedLayout]) {
    char v6 = SBIconLocationGroupContainsLocation();
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)iconManagerEditingDidChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBIconController *)self homeScreenOverlayController];
  [v5 updateExtraButtonVisibilityAnimated:1];

  if ([v4 isEditing])
  {
    id v23 = v4;
    [(id)SBApp windowSceneManager];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = v31 = 0u;
    char v6 = [v22 connectedWindowScenes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v11 isExternalDisplayWindowScene])
          {
            id v12 = [v11 floatingDockController];
            uint64_t v13 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v12 visibleProgress:1 animated:0 gesturePossible:1 atLevel:@"hideFloatingDockOnExternalDisplayForHomeScreenEditMode" reason:0 withCompletion:0.0];
            id v14 = [(SBIconController *)self floatingDockBehaviorAssertions];
            if (v14)
            {
              BOOL v15 = v14;
              uint64_t v16 = [v14 setByAddingObject:v13];
            }
            else
            {
              uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v13, 0);
            }
            [(SBIconController *)self setFloatingDockBehaviorAssertions:v16];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v8);
    }

    id v4 = v23;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v17 = [(SBIconController *)self floatingDockBehaviorAssertions];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * j) invalidate];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [(SBIconController *)self setFloatingDockBehaviorAssertions:0];
  }
}

- (void)iconManager:(id)a3 willUseIconImageCache:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [(id)SBApp userSessionController];
  uint64_t v7 = [v6 sessionType];

  if (v7 == 2) {
    [v5 setPoolingBypassCount:200];
  }
  uint64_t v8 = [(SBIconController *)self _libraryViewControllers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setIconImageCache:v5];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)iconManagerListLayoutProviderDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBIconController *)self _libraryViewControllers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v9 _sbWindowScene];
        uint64_t v11 = [(SBIconController *)self _appLibraryListLayoutProviderForWindowScene:v10];
        [v9 setListLayoutProvider:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  return (id)[MEMORY[0x1E4F43098] _localizedFolderNameForName:a3];
}

- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return [(SBIconController *)self localizedFolderNameForDefaultDisplayName:a4];
}

- (id)localizedDefaultFolderNameForIconManager:(id)a3
{
  return [(SBIconController *)self localizedFolderNameForDefaultDisplayName:@"Folder"];
}

- (void)iconManagerDidFinishInstallForIcon:(id)a3
{
  id v4 = [(SBIconController *)self layoutStateProvider];
  uint64_t v5 = [v4 layoutState];
  uint64_t v6 = [v5 unlockedEnvironmentMode];

  if (v6 == 1)
  {
    [(SBIconController *)self _showInfoAlertIfNeeded:1];
  }
}

- (void)iconManager:(id)a3 didReceiveTapOnLaunchDisabledIconView:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(SBIconController *)self delayedLaunchRequestTimer];
  [v6 invalidate];

  [(SBIconController *)self setDelayedLaunchRequestTimer:0];
  uint64_t v7 = SBLogIcon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 icon];
    uint64_t v9 = [v8 applicationBundleID];
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Received tap on launch-disabled icon view '%@'", (uint8_t *)&v10, 0xCu);
  }
  kdebug_trace();
}

uint64_t __80__SBIconController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchFromIconView:*(void *)(a1 + 40) withActions:*(void *)(a1 + 48) modifierFlags:*(void *)(a1 + 56)];
}

- (id)iconManager:(id)a3 launchURLForIconView:(id)a4
{
  return [(SBIconController *)self launchURLForIconView:a4];
}

- (void)iconManager:(id)a3 launchIcon:(id)a4 location:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, BOOL))a7;
  if (![v10 isApplicationIcon])
  {
    BOOL v17 = 0;
    if (!v12) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  long long v13 = [v10 application];
  uint64_t v14 = [v10 applicationBundleID];
  long long v15 = (void *)v14;
  if (!v13)
  {
    if (v14)
    {
      long long v16 = [(SBIconController *)self applicationController];
      long long v13 = [v16 applicationWithBundleIdentifier:v15];
    }
    else
    {
      long long v13 = 0;
    }
  }
  uint64_t v18 = SBLogIcon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    int v27 = 138412802;
    id v28 = v10;
    __int16 v29 = 2112;
    long long v30 = v15;
    __int16 v31 = 2112;
    double v32 = v13;
    _os_log_fault_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_FAULT, "Fallback launch path: Trying to launch app icon: %@ (%@), found app: %@", (uint8_t *)&v27, 0x20u);
  }

  BOOL v17 = v13 != 0;
  if (v13)
  {
    uint64_t v19 = [(SBIconController *)self userInterfaceController];
    uint64_t v20 = objc_alloc_init(SBActivationSettings);
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
    [v19 activateApplication:v13 fromIcon:v10 location:v11 activationSettings:v20 actions:v21];

    if (v15)
    {
      id v22 = [(SBIconController *)self model];
      id v23 = [v22 applicationIconForBundleIdentifier:v15];

      if (v23 && v23 != v10)
      {
        long long v24 = [(SBIconController *)self rootFolder];
        long long v25 = [v24 indexPathForIcon:v10];
        if (v25)
        {
          id v26 = [v24 iconAtIndexPath:v25];

          if (v26 != v23) {
            [v24 replaceIcon:v10 withIcon:v23];
          }
        }
      }
    }
  }

  if (v12) {
LABEL_20:
  }
    v12[2](v12, v17);
LABEL_21:
}

- (id)iconManager:(id)a3 containerViewForPresentingContextMenuForIconView:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBIconController *)self homeScreenViewController];
  uint64_t v7 = [v6 containerViewForPresentingContextMenuForIconView:v5];

  return v7;
}

- (id)iconManager:(id)a3 containerViewControllerForConfigurationOfIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "location", a3);
  uint64_t v6 = [(SBIconController *)self homeScreenViewController];
  if (SBIconLocationGroupContainsLocation())
  {
    id v7 = v6;
LABEL_5:
    uint64_t v8 = v7;
    goto LABEL_7;
  }
  if (SBIconLocationGroupContainsLocation())
  {
    id v7 = [v6 containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:0];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)iconManager:(id)a3 containerViewForConfigurationOfIconView:(id)a4
{
  id v5 = [(SBIconController *)self iconManager:a3 containerViewControllerForConfigurationOfIconView:a4];
  uint64_t v6 = [(SBIconController *)self homeScreenViewController];
  if (v5 == v6) {
    [v5 iconContentView];
  }
  else {
  id v7 = [v5 view];
  }

  return v7;
}

- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4
{
  id v6 = a4;
  id v7 = [(SBIconController *)self iconManager:a3 containerViewForConfigurationOfIconView:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = [v6 location];
    id v11 = v9;
    if (SBIconLocationGroupContainsLocation())
    {
      id v11 = v9;
      if ([(SBIconController *)self isTodayOverlayPresented])
      {
        uint64_t v12 = [(SBIconController *)self todayViewController];
        id v11 = [v12 view];
      }
    }
    [v11 bounds];
    objc_msgSend(v11, "convertRect:toView:", v9);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)iconManager:(id)a3 homeScreenContentViewForConfigurationOfIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "location", a3);
  if (SBIconLocationGroupContainsLocation()
    && [(SBIconController *)self isTodayOverlayPresented])
  {
    id v6 = [(SBIconController *)self todayViewController];
  }
  else
  {
    id v6 = [(SBIconController *)self _rootFolderController];
  }
  id v7 = v6;
  uint64_t v8 = [v6 view];

  return v8;
}

- (id)iconManager:(id)a3 containerViewControllerForModalInteractionFromIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "location", a3);
  id v6 = [(SBIconController *)self homeScreenViewController];
  if (SBIconLocationGroupContainsLocation())
  {
    id v7 = v6;
LABEL_5:
    uint64_t v8 = v7;
    goto LABEL_7;
  }
  if (SBIconLocationGroupContainsLocation())
  {
    id v7 = [v6 containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:1];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)iconManager:(id)a3 containerViewForModalInteractionFromIconView:(id)a4
{
  id v5 = [(SBIconController *)self iconManager:a3 containerViewControllerForModalInteractionFromIconView:a4];
  id v6 = [(SBIconController *)self homeScreenViewController];
  if (v5 == v6) {
    [v5 iconContentView];
  }
  else {
  id v7 = [v5 view];
  }

  return v7;
}

- (id)iconManager:(id)a3 homeScreenContentViewForModalInteractionFromIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "location", a3);
  if (SBIconLocationGroupContainsLocation())
  {
    id v6 = [(SBIconController *)self coverSheetPresentationManager];
    int v7 = [v6 isVisible];

    if (v7) {
      [(SBIconController *)self coverSheetTodayViewController];
    }
    else {
    uint64_t v8 = [(SBIconController *)self todayViewController];
    }
    if ([v8 _appearState] == 2 || objc_msgSend(v8, "_appearState") == 1)
    {
      id v9 = [(SBIconController *)self todayViewController];
      id v10 = [v9 view];

      goto LABEL_10;
    }
  }
  uint64_t v8 = [(SBIconController *)self _rootFolderController];
  id v10 = [v8 view];
LABEL_10:

  return v10;
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationWillBeginWithInteraction:(id)a5
{
  id v13 = a5;
  [(SBPowerLogMetricsAggregator *)self->_powerLogAggregator emitEventOfType:1];
  if (!self->_widgetConfigurationFloatingDockBehaviorAssertion)
  {
    id v6 = [(SBIconController *)self mainDisplayWindowScene];
    int v7 = [v6 floatingDockController];
    uint64_t v8 = [SBFloatingDockBehaviorAssertion alloc];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [(SBFloatingDockBehaviorAssertion *)v8 initWithFloatingDockController:v7 visibleProgress:1 animated:1 gesturePossible:3 atLevel:v10 reason:0 withCompletion:0.0];
    widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
    self->_widgetConfigurationFloatingDockBehaviorAssertion = v11;
  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationDidEndWithInteraction:(id)a5
{
  [(SBFloatingDockBehaviorAssertion *)self->_widgetConfigurationFloatingDockBehaviorAssertion invalidate];
  widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
  self->_widgetConfigurationFloatingDockBehaviorAssertion = 0;
}

- (void)iconManager:(id)a3 modalInteractionWillBegin:(id)a4
{
  if (!self->_modalInteractionFloatingDockBehaviorAssertion)
  {
    id v5 = a4;
    id v12 = [(SBIconController *)self mainDisplayWindowScene];
    id v6 = [v12 floatingDockController];
    int v7 = [SBFloatingDockBehaviorAssertion alloc];
    uint64_t v8 = (objc_class *)objc_opt_class();

    id v9 = NSStringFromClass(v8);
    id v10 = [(SBFloatingDockBehaviorAssertion *)v7 initWithFloatingDockController:v6 visibleProgress:1 animated:1 gesturePossible:3 atLevel:v9 reason:0 withCompletion:0.0];
    modalInteractionFloatingDockBehaviorAssertion = self->_modalInteractionFloatingDockBehaviorAssertion;
    self->_modalInteractionFloatingDockBehaviorAssertion = v10;
  }
}

- (void)iconManager:(id)a3 modalInteractionDidEnd:(id)a4
{
  [(SBFloatingDockBehaviorAssertion *)self->_modalInteractionFloatingDockBehaviorAssertion invalidate];
  modalInteractionFloatingDockBehaviorAssertion = self->_modalInteractionFloatingDockBehaviorAssertion;
  self->_modalInteractionFloatingDockBehaviorAssertion = 0;
}

- (unint64_t)addWidgetSheetStyleForIconManager:(id)a3
{
  if (__sb__runningInSpringBoard())
  {
    return SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 1;
  }
  return v3;
}

- (void)iconManager:(id)a3 iconView:(id)a4 willUseContextMenuStyle:(id)a5
{
  id v16 = a5;
  [(SBIconController *)self minimumHomeScreenScale];
  double v7 = v6;
  if (v6 != 1.0)
  {
    uint64_t v8 = [v16 containerView];
    [v8 bounds];
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
    double v13 = v7 + -1.0;
    double v14 = (v7 + -1.0) * CGRectGetWidth(v18) * 0.5;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGFloat v15 = CGRectGetHeight(v19);
    objc_msgSend(v16, "setPreferredBackgroundInsets:", v13 * v15 * 0.5, v14, v13 * v15 * 0.5, v14);
  }
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysCloseBox:(id)a4
{
  id v5 = a4;
  double v6 = [v5 icon];
  BOOL v7 = [(SBIconController *)self isAppLibrarySupported];
  int v8 = [v6 isApplicationIcon];
  BOOL v9 = v8 && v7 || [(SBIconController *)self isUninstallSupportedForIcon:v6];
  id v10 = [v5 location];
  id v11 = [(SBIconController *)self mainDisplayWindowScene];
  id v12 = [v11 floatingDockController];
  if ([v12 isPresentingIconLocation:v10])
  {
    char v13 = [v12 shouldShowCloseBoxForIconView:v5 proposedValue:v9];
LABEL_10:
    LOBYTE(v9) = v13;
    goto LABEL_11;
  }
  if (v8 && SBIconLocationGroupContainsLocation())
  {
    char v13 = [(SBIconController *)self isUninstallSupportedForIcon:v6];
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (void)iconManager:(id)a3 wantsUninstallForIcon:(id)a4 location:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(SBIconController *)self mainDisplayWindowScene];
  id v10 = [v9 floatingDockController];
  if (([v10 handlePromptingUserToUninstallIcon:v7 location:v8] & 1) == 0)
  {
    if ([v7 isApplicationIcon])
    {
      id v11 = [(SBIconController *)self applicationController];
      id v12 = [v7 applicationBundleID];
      BOOL v13 = [(SBIconController *)self isUninstallSupportedForIcon:v7];
      if (v12 && (v13 || [(SBIconController *)self isAppLibrarySupported]))
      {
        if ([(SBIconController *)self isAppLibrarySupported]) {
          uint64_t v14 = SBIconLocationGroupContainsLocation() ^ 1;
        }
        else {
          uint64_t v14 = 0;
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke;
        v20[3] = &unk_1E6AFB9F0;
        id v21 = v7;
        double v22 = self;
        [(SBRemoveWidgetAlertItem *)v11 requestUninstallApplicationWithBundleIdentifier:v12 options:v14 withCompletion:v20];
      }
    }
    else
    {
      if ([v7 isWidgetIcon])
      {
        CGFloat v15 = [SBRemoveWidgetAlertItem alloc];
        id v16 = [(SBIconController *)self iconManager];
        id v11 = [(SBRemoveWidgetAlertItem *)v15 initWithWidgetIcon:v7 location:v8 iconManager:v16];

        double v17 = v11;
      }
      else
      {
        if ([v7 isFolderIcon]) {
          CGRect v18 = SBHideFolderContentsAlertItem;
        }
        else {
          CGRect v18 = SBDeleteNonAppIconAlertItem;
        }
        double v17 = (SBRemoveWidgetAlertItem *)[[v18 alloc] initWithIcon:v7 location:v8];
        id v11 = v17;
      }
      [(SBAlertItem *)v17 _setPreferredActivationWindowScene:v9];
      CGRect v19 = [(SBIconController *)self alertItemsController];
      [v19 activateAlertItem:v11];
    }
  }
}

void __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = v7;
  if (a2)
  {
    if ([*(id *)(a1 + 32) isApplicationIcon])
    {
      [*(id *)(a1 + 32) setUninstalledByUser:1];
      [*(id *)(a1 + 32) cancelDownload];
    }
    BOOL v9 = [*(id *)(a1 + 40) iconManager];
    uint64_t v10 = *(void *)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_2;
    v16[3] = &unk_1E6AF5350;
    id v17 = v8;
    [v9 uninstallIcon:v10 animate:1 completion:v16];

    id v11 = v17;
  }
  else
  {
    if (!a3)
    {
      [v7 invalidate];
      goto LABEL_9;
    }
    id v12 = [*(id *)(a1 + 40) iconManager];
    uint64_t v13 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    uint8_t v14[2] = __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_3;
    void v14[3] = &unk_1E6AF5350;
    id v15 = v8;
    [v12 addIconToIgnoredList:v13 options:1 completion:v14];

    id v11 = v15;
  }

LABEL_9:
}

uint64_t __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __63__SBIconController_iconManager_wantsUninstallForIcon_location___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)iconManager:(id)a3 canBeginDragForIconView:(id)a4
{
  id v4 = +[SBWorkspace mainWorkspace];
  id v5 = [v4 transientOverlayPresentationManager];
  char v6 = [v5 hasActivePresentation];

  return v6 ^ 1;
}

- (BOOL)_dragSessionContainsAppClipWebClipIcon:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = objc_msgSend(a3, "items", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "sbh_appDragLocalContext");
        uint64_t v10 = v9;
        if (v9)
        {
          id v11 = [v9 uniqueIdentifier];
          id v12 = [(SBIconController *)self model];
          uint64_t v13 = [v12 bookmarkIconForWebClipIdentifier:v11];

          uint64_t v14 = [v13 webClip];
          char v15 = [v14 isAppClip];

          if (v15)
          {

            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)iconManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return ![(SBIconController *)self _dragSessionContainsAppClipWebClipIcon:a4];
}

- (BOOL)iconManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  return ![(SBIconController *)self _dragSessionContainsAppClipWebClipIcon:a4];
}

- (double)iconManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4
{
  return 1.1;
}

- (int64_t)iconManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5
{
  uint64_t v6 = objc_msgSend(a4, "location", a3);
  if ([v6 isEqualToString:@"SBIconLocationFloatingDockSuggestions"]) {
    a5 = 7;
  }

  return a5;
}

- (void)iconManager:(id)a3 iconDropSessionDidEnter:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F429C0];
  id v6 = a4;
  uint64_t v7 = [v5 sharedInstance];
  id v8 = [v7 sessionForDropSession:v6];

  BOOL v9 = [v8 info];
  LODWORD(v7) = [v9 processIdentifier];
  if (v7 != getpid())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    if (v9) {
      [v9 auditToken];
    }
    v13[0] = v14;
    v13[1] = v15;
    uint64_t v10 = [MEMORY[0x1E4F4F6A8] tokenFromAuditToken:v13];
    if (([v10 hasEntitlement:@"com.apple.springboard.app-drag"] & 1) == 0)
    {
      id v12 = [(SBIconController *)self iconManager];
      [v12 cancelAllDrags];

      goto LABEL_8;
    }
  }
  id v11 = +[SBDraggingSystemManager sharedInstance];
  [v11 setCommandeered:1 forDraggingSystemSession:v8 forReason:@"SBIconController-IconDrag"];

LABEL_8:
}

- (BOOL)shouldCommandeerContentDragsInLocation:(id)a3
{
  return SBIconLocationGroupContainsLocation();
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidEnter:(id)a5
{
  id v9 = a5;
  uint64_t v7 = [a4 location];
  if ([(SBIconController *)self shouldCommandeerContentDragsInLocation:v7])
  {
    id v8 = +[SBDraggingSystemManager sharedInstance];
    [v8 setCommandeered:1 forDropSession:v9 forReason:@"SBIconController-ContentDrag"];
  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidExit:(id)a5
{
  id v9 = a5;
  uint64_t v7 = [a4 location];
  if ([(SBIconController *)self shouldCommandeerContentDragsInLocation:v7])
  {
    id v8 = +[SBDraggingSystemManager sharedInstance];
    [v8 setCommandeered:0 forDropSession:v9 forReason:@"SBIconController-ContentDrag"];
  }
}

- (id)iconManager:(id)a3 screenSnapshotProviderForComponentsOfIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_screenSnapshotForIconViews) {
    goto LABEL_3;
  }
  id v9 = [v7 window];
  uint64_t v10 = [v9 screen];
  uint64_t v11 = [v10 snapshotViewAfterScreenUpdates:0];
  screenSnapshotForIconViews = v8->_screenSnapshotForIconViews;
  v8->_screenSnapshotForIconViews = (UIView *)v11;

  if (v8->_screenSnapshotForIconViews)
  {
LABEL_3:
    objc_initWeak(&location, v8);
    uint64_t v13 = [SBIconViewSnapshotProvider alloc];
    long long v14 = (void *)[objc_alloc((Class)objc_opt_class()) initAsCopyOf:v8->_screenSnapshotForIconViews];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__SBIconController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke;
    v20[3] = &unk_1E6AFBA18;
    objc_copyWeak(&v21, &location);
    void v20[4] = v8;
    long long v15 = [(SBIconViewSnapshotProvider *)v13 initWithSnapshotView:v14 invalidation:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    if (v15)
    {
      outstandingSnapshotProviders = v8->_outstandingSnapshotProviders;
      if (!outstandingSnapshotProviders)
      {
        id v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v18 = v8->_outstandingSnapshotProviders;
        v8->_outstandingSnapshotProviders = v17;

        outstandingSnapshotProviders = v8->_outstandingSnapshotProviders;
      }
      [(NSMutableArray *)outstandingSnapshotProviders addObject:v15];
    }
  }
  else
  {
    long long v15 = 0;
  }
  objc_sync_exit(v8);

  return v15;
}

void __78__SBIconController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    uint64_t v6 = [v5[48] indexOfObject:v10];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [v5[48] removeObjectAtIndex:v6];
    }
    if (!objc_msgSend(v5[48], "count", v6))
    {
      id v7 = v5[48];
      v5[48] = 0;

      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 376);
      *(void *)(v8 + 376) = 0;
    }
    objc_sync_exit(v5);
  }
}

- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [v7 icon];
  id v9 = [v7 location];

  if (([v9 isEqualToString:@"SBIconLocationFloatingDockSuggestions"] & 1) != 0
    || ([v8 isWidgetIcon] & 1) != 0)
  {
    a5 = 1;
  }
  else if ([(SBIconController *)self isAppLibrarySupported])
  {
    a5 = SBIconLocationGroupContainsLocation() ^ 1;
  }

  return a5;
}

- (BOOL)isFocusAllowedForIconManager:(id)a3
{
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() == 2;
  }
  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v3 = [v4 userInterfaceIdiom] == 1;

  return v3;
}

- (unint64_t)iconManager:(id)a3 focusEffectTypeForIconView:(id)a4
{
  return 1;
}

- (id)iconManager:(id)a3 accessibilityTintColorForIconView:(id)a4
{
  id v4 = +[SBWallpaperController sharedInstance];
  uint64_t v5 = [v4 averageColorForVariant:1];

  return v5;
}

- (BOOL)iconManagerCanBeginIconDrags:(id)a3
{
  BOOL v3 = +[SBSetupManager sharedInstance];
  int v4 = [v3 isInSetupMode];

  if (v4)
  {
    uint64_t v5 = SBLogIconDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "disallowing icon drag because we are in setup mode", v7, 2u);
    }
  }
  return v4 ^ 1;
}

- (id)iconManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [[SBAppPlatterDragPreview alloc] initWithReferenceIconView:v4 sourceView:0];
  [v4 iconImageCenter];
  double v7 = v6;
  double v9 = v8;
  id v10 = [v4 window];
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  -[SBAppPlatterDragPreview setCenter:](v5, "setCenter:", v12, v14);
  [(SBAppPlatterDragPreview *)v5 setAlpha:0.0];
  return v5;
}

- (id)windowForIconDragPreviewsForIconManager:(id)a3 forWindowScene:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v20 = [NSString stringWithUTF8String:"-[SBIconController windowForIconDragPreviewsForIconManager:forWindowScene:]"];
    [v19 handleFailureInFunction:v20 file:@"SBIconController.m" lineNumber:6272 description:@"this call must be made on the main thread"];
  }
  if (!self->_windowSceneToMedusaDragWindowContext)
  {
    double v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    windowSceneToMedusaDragWindowContext = self->_windowSceneToMedusaDragWindowContext;
    self->_windowSceneToMedusaDragWindowContext = v7;
  }
  uint64_t v9 = objc_opt_class();
  id v10 = SBSafeCast(v9, v6);

  if (v10)
  {
    double v11 = [(NSMapTable *)self->_windowSceneToMedusaDragWindowContext objectForKey:v10];
  }
  else
  {
    double v11 = 0;
  }
  double v12 = [(SBMedusaDragWindowContext *)v11 dragWindow];
  if (v10 && !v11)
  {
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
    if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleMedusaDrag"))
    {
      double v14 = [(SBWindow *)[SBIconDragPlatterWindow alloc] initWithWindowScene:v10 rootViewController:v13 role:@"SBTraitsParticipantRoleMedusaDrag" debugName:@"Medusa Portal Source Window"];
    }
    else
    {
      double v14 = [(SBMainScreenActiveInterfaceOrientationWindow *)[SBOldIconDragPlatterWindow alloc] initWithWindowScene:v10 role:@"SBTraitsParticipantRoleMedusaDrag" debugName:@"Medusa Portal Source Window"];
      [(SBIconDragPlatterWindow *)v14 setContentViewController:v13];
    }

    long long v15 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    BOOL v16 = [v10 traitsArbiter];
    id v17 = [v16 acquireParticipantWithRole:@"SBTraitsParticipantRoleMedusaDrag" delegate:v15];

    [(SBTraitsWindowParticipantDelegate *)v15 setParticipant:v17 ownedByWindow:v14];
    [(SBTraitsWindowParticipantDelegate *)v15 windowDidUpdatePreferredWindowLevel:v17 ownedParticipant:1.79769313e308];
    [(SBTraitsWindowParticipantDelegate *)v15 windowDidUpdateSupportedOrientations:30 ownedParticipant:v17];
    [(SBTraitsWindowParticipantDelegate *)v15 windowWillBecomeVisible:v14 ownedParticipant:v17];
    [v17 setNeedsUpdatePreferencesWithReason:@"Setup"];
    [(SBIconDragPlatterWindow *)v14 setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0 + -1.0];
    [(SBWindow *)v14 setHidden:0];
    [(SBIconDragPlatterWindow *)v14 setUserInteractionEnabled:0];
    double v11 = [[SBMedusaDragWindowContext alloc] initWithDragWindow:v14 traitsParticipant:v17 traitsParticipantDelegate:v15];
    [(NSMapTable *)self->_windowSceneToMedusaDragWindowContext setObject:v11 forKey:v10];

    double v12 = v14;
  }

  return v12;
}

- (void)iconManagerIconDraggingDidChange:(id)a3
{
  if ([a3 isIconDragging]) {
    [(SBIconController *)self _beginDisablingAllOrientationChangesForReason:@"SBIconController Dragging"];
  }
  else {
    [(SBIconController *)self _endDisablingAllOrientationChangesForReason:@"SBIconController Dragging"];
  }
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = [(SBIconController *)self homeScreenViewController];
    [v4 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (void)iconManager:(id)a3 willBeginIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4FA7538];
  double v7 = objc_msgSend(a4, "UUIDString", a3);
  v16[0] = v7;
  v15[1] = *MEMORY[0x1E4FA7540];
  double v8 = [NSNumber numberWithUnsignedInteger:a5];
  v16[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v10 = (void *)MEMORY[0x1E4FA5E78];
  id v11 = v9;
  double v12 = [v10 sharedInstance];
  [v12 emitEvent:28 withPayload:v11];

  if (!self->_iconDragSessionBeginDate)
  {
    double v13 = [MEMORY[0x1E4F1C9C8] date];
    iconDragSessionBeginDate = self->_iconDragSessionBeginDate;
    self->_iconDragSessionBeginDate = v13;
  }
}

- (void)iconManager:(id)a3 didAddItemsToIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  _OWORD v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4FA7538];
  id v6 = objc_msgSend(a4, "UUIDString", a3);
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E4FA7540];
  double v7 = [NSNumber numberWithUnsignedInteger:a5];
  v13[1] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v9 = (void *)MEMORY[0x1E4FA5E78];
  id v10 = v8;
  id v11 = [v9 sharedInstance];
  [v11 emitEvent:29 withPayload:v10];
}

- (void)iconManager:(id)a3 didEndIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4FA7538];
  double v7 = objc_msgSend(a4, "UUIDString", a3);
  v18[0] = v7;
  v17[1] = *MEMORY[0x1E4FA7540];
  double v8 = [NSNumber numberWithUnsignedInteger:a5];
  v18[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v10 = (void *)MEMORY[0x1E4FA5E78];
  id v11 = v9;
  double v12 = [v10 sharedInstance];
  [v12 emitEvent:30 withPayload:v11];

  if (self->_iconDragSessionBeginDate)
  {
    double v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:self->_iconDragSessionBeginDate];
    double v15 = v14;

    iconDragSessionBeginDate = self->_iconDragSessionBeginDate;
    self->_iconDragSessionBeginDate = 0;

    [(SBPowerLogMetricsAggregator *)self->_powerLogAggregator emitEventOfType:2 withDuration:v15];
  }
}

- (void)iconManager:(id)a3 didSpringLoadIconView:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FA74D8];
  v13[0] = &unk_1F3349B48;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  double v7 = [v5 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  double v8 = (void *)MEMORY[0x1E4FA5E78];
  id v9 = v7;
  id v10 = [v8 sharedInstance];
  [v10 emitEvent:31 withPayload:v9];

  id v11 = [(SBIconController *)self iconDragManager];
  [v11 performSpringLoadedInteractionForIconDragOnIconView:v6];
}

- (void)iconManager:(id)a3 willRemoveFakeStatusBar:(id)a4 forFolderController:(id)a5
{
  id v6 = a4;
  id v9 = [(SBIconController *)self mainDisplayWindowScene];
  double v7 = [v9 statusBarManager];
  double v8 = [v7 reusePool];
  [v8 recycleStatusBar:v6];
}

- (UIEdgeInsets)iconManager:(id)a3 contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a4
{
  id v4 = [(SBIconController *)self homeScreenViewController];
  [v4 _contentOverlayInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.double right = v16;
  result.double bottom = v15;
  result.double left = v14;
  result.double top = v13;
  return result;
}

- (void)_setWidgetEditingDisplayLayoutElementActive:(BOOL)a3
{
  widgetEditingLayoutAssertion = self->_widgetEditingLayoutAssertion;
  if (a3)
  {
    if (widgetEditingLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    double v10 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4FA6F90]];
    [v10 setLevel:0];
    [v10 setFillsDisplayBounds:1];
    [v10 setLayoutRole:6];
    double v6 = [MEMORY[0x1E4F62438] sharedInstance];
    double v7 = [v6 addElement:v10];
    double v8 = self->_widgetEditingLayoutAssertion;
    self->_widgetEditingLayoutAssertion = v7;

    double v9 = (BSInvalidatable *)v10;
  }
  else
  {
    if (!widgetEditingLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)widgetEditingLayoutAssertion invalidate];
    double v9 = self->_widgetEditingLayoutAssertion;
    self->_widgetEditingLayoutAssertion = 0;
  }
}

- (void)iconManager:(id)a3 willCloseFolder:(id)a4
{
  id v4 = a4;
  id v5 = +[SBReachabilityManager sharedInstance];
  [v5 deactivateReachability];

  double v6 = +[SBReachabilityManager sharedInstance];
  [v6 setReachabilityTemporarilyDisabled:1 forReason:@"Close Folder"];

  int v7 = [v4 isLibraryCategoryFolder];
  double v8 = SBLogTelemetrySignposts();
  BOOL v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      __int16 v13 = 0;
      double v10 = "SB_HOME_DEWEY_POD_CLOSE";
      double v11 = (uint8_t *)&v13;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
    }
  }
  else if (v9)
  {
    __int16 v12 = 0;
    double v10 = "SB_HOME_FOLDER_CLOSE";
    double v11 = (uint8_t *)&v12;
    goto LABEL_6;
  }

  kdebug_trace();
}

- (void)iconManager:(id)a3 didCloseFolder:(id)a4
{
  id v5 = a4;
  double v6 = +[SBReachabilityManager sharedInstance];
  [v6 setReachabilityTemporarilyDisabled:0 forReason:@"Close Folder"];

  int v7 = [v5 isLibraryCategoryFolder];
  double v8 = SBLogTelemetrySignposts();
  BOOL v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_DEWEY_POD_CLOSE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)__int16 v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_FOLDER_CLOSE", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
    }

    kdebug_trace();
    [(SBIconController *)self _setFolderDisplayLayoutElementActive:0];
  }
  double v10 = [(SBIconController *)self homeScreenViewController];
  double v11 = [MEMORY[0x1E4F42A28] focusSystemForEnvironment:v10];
  __int16 v12 = [v11 focusedItem];

  if (v12) {
    [v10 setNeedsFocusUpdate];
  }
}

- (void)iconManagerFolderAnimatingDidChange:(id)a3
{
  if (([a3 hasAnimatingFolder] & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SBIconController_iconManagerFolderAnimatingDidChange___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = [(SBIconController *)self homeScreenViewController];
    [v4 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

void __56__SBIconController_iconManagerFolderAnimatingDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInterfaceController];
  uint64_t v1 = [v2 window];
  objc_msgSend(v1, "sb_updateInterfaceOrientationFromActiveInterfaceOrientation");
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpen"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppClose"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpenInFolder"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppCloseInFolder"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"FolderOpenAnimation" forTest:@"FolderOpen"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"FolderCloseAnimation" forTest:@"FolderClose"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_8()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpenInScreenTime"];
}

uint64_t __118__SBIconController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_9()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppCloseInScreenTime"];
}

- (BOOL)iconManagerCanSaveIconState:(id)a3
{
  BOOL v3 = +[SBSyncController sharedInstance];
  int v4 = [v3 restoreState];

  if (v4 == 1)
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Icon state save prevented due to in progress restore", v7, 2u);
    }
  }
  return v4 != 1;
}

- (void)iconManagerDidSaveIconState:(id)a3
{
  if (self->_sendITunesNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.iconStateChanged", 0, 0, 1u);
  }
  proactiveUsageObserver = self->_proactiveUsageObserver;
  [(SBProactiveHomeScreenUsageObserver *)proactiveUsageObserver pushCurrentHomeScreenConfiguration];
}

- (id)iconManager:(id)a3 animator:(id)a4 animationSettingsForOperation:(unint64_t)a5 childViewController:(id)a6
{
  return [(SBIconController *)self animator:a4 animationSettingsForOperation:a5 childViewController:a6];
}

- (id)iconManager:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = +[SBWallpaperController sharedInstance];
  BOOL v9 = objc_msgSend(v8, "averageColorInRect:forVariant:", 1, x, y, width, height);

  return v9;
}

- (BOOL)isFloatingDockSupportedForIconManager:(id)a3
{
  return +[SBFloatingDockController isFloatingDockSupported];
}

- (BOOL)isFloatingDockVisibleForIconManager:(id)a3
{
  BOOL v3 = [(SBIconController *)self mainDisplayWindowScene];
  int v4 = [v3 floatingDockController];
  char v5 = [v4 isFloatingDockPresented];

  return v5;
}

- (void)presentTodayOverlayForIconManager:(id)a3
{
  if ([(SBIconController *)self _isCoplanarHomeScreenEnabled])
  {
    id v4 = [(SBIconController *)self iconManager];
    [v4 presentLeadingCustomViewWithCompletion:0];
  }
  else
  {
    id v4 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
    [v4 presentAnimated:1 fromLeading:1];
  }
}

- (void)presentLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a4;
  BOOL v7 = [(SBIconController *)self isAppLibraryAllowed];
  double v8 = v14;
  if (v7)
  {
    if ([(SBIconController *)self isModalAppLibrarySupported])
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v14;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          double v11 = v10;
        }
        else {
          double v11 = 0;
        }
      }
      else
      {
        double v11 = 0;
      }
      id v12 = v11;

      __int16 v13 = [v12 modalLibraryController];

      if (([v13 isPresentingLibraryInForeground] & 1) == 0) {
        [v13 toggleLibraryPresentedAnimated:v5 completion:0];
      }
    }
    else
    {
      [(SBIconController *)self presentLibraryFromOverlayControllerAnimated:v5 completion:0];
    }
    double v8 = v14;
  }
}

- (void)presentLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(SBIconController *)self isAppLibraryAllowed])
  {
    BOOL v7 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
    if (![v7 isPresented]
      || ([v7 activeSidebarViewController],
          double v8 = objc_claimAutoreleasedReturnValue(),
          [v7 trailingSidebarViewController],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v8 == v9))
    {
      if (![(SBIconController *)self _isCoplanarHomeScreenEnabled])
      {
        [v7 presentAnimated:v4 fromLeading:0 completionHandler:v6];
        goto LABEL_11;
      }
      double v11 = [(SBIconController *)self iconManager];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2;
      v12[3] = &unk_1E6AF5300;
      id v13 = v6;
      [v11 presentTrailingCustomViewWithCompletion:v12];

      id v10 = v13;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      uint8_t v14[2] = __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke;
      void v14[3] = &unk_1E6AFBA88;
      id v15 = v7;
      BOOL v17 = v4;
      id v16 = v6;
      [v15 dismissAnimated:v4 completionHandler:v14];

      id v10 = v15;
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
LABEL_12:
}

uint64_t __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAnimated:*(unsigned __int8 *)(a1 + 48) fromLeading:0 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __75__SBIconController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = self->_overlayLibraryViewController;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke;
  v20[3] = &unk_1E6AF7268;
  BOOL v24 = v6;
  void v20[4] = self;
  id v21 = v8;
  double v22 = v10;
  id v23 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  id v14 = (void *)MEMORY[0x1D948C7A0](v20);
  id v15 = [(SBIconController *)self _rootFolderController];
  uint64_t v16 = [v15 lastIconPageIndex];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3;
  void v18[3] = &unk_1E6AF5300;
  id v19 = v14;
  id v17 = v14;
  [v15 setCurrentPageIndex:v16 animated:v6 completion:v18];
}

void __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2;
  v4[3] = &unk_1E6AF6980;
  BOOL v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v3 presentLibraryFromOverlayControllerAnimated:v2 completion:v4];
}

void __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    if (a1[4])
    {
      uint64_t v2 = (void *)a1[5];
      objc_msgSend(v2, "presentPodWithCategoryIdentifier:animated:completion:");
    }
    else
    {
      uint64_t v4 = a1[6];
      if (v4)
      {
        id v5 = *(void (**)(void))(v4 + 16);
        v5();
      }
    }
  }
  else
  {
    uint64_t v3 = a1[6];
    if (v3)
    {
      SBHLibraryPresentationErrorForCode();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
    }
  }
}

uint64_t __108__SBIconController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(SBIconController *)self _isCoplanarHomeScreenEnabled])
  {
    if ([(SBIconController *)self isMainDisplayLibraryViewVisible])
    {
      id v7 = [(SBIconController *)self iconManager];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _DWORD v8[2] = __54__SBIconController_dismissLibraryAnimated_completion___block_invoke;
      void v8[3] = &unk_1E6AF5300;
      id v9 = v6;
      [v7 animateToDefaultStateWithCompletionHandler:v8];
    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
  else
  {
    [(SBIconController *)self dismissLibraryFromOverlayControllerAnimated:v4 completion:v6];
  }
}

uint64_t __54__SBIconController_dismissLibraryAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)dismissLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v10 = (void (**)(id, uint64_t))a4;
  if ([(SBIconController *)self isAppLibraryAllowed])
  {
    id v6 = [(SBIconController *)self _homeScreenOverlayControllerIfNeeded];
    if ([(SBIconController *)self isMainDisplayLibraryViewVisible]
      && ([v6 activeSidebarViewController],
          id v7 = (SBLibraryViewController *)objc_claimAutoreleasedReturnValue(),
          overlayLibraryViewController = self->_overlayLibraryViewController,
          v7,
          v7 == overlayLibraryViewController))
    {
      [(SBIconController *)self dismissHomeScreenOverlayControllerAnimated:v4 completion:v10];
    }
    else if (v10)
    {
      v10[2](v10, 1);
    }
  }
  else
  {
    id v9 = v10;
    if (!v10) {
      goto LABEL_11;
    }
    v10[2](v10, 0);
  }
  id v9 = v10;
LABEL_11:
}

- (BOOL)isMainDisplayLibraryViewVisible
{
  uint64_t v2 = [(SBIconController *)self iconManager];
  char v3 = [v2 isMainDisplayLibraryViewVisible];

  return v3;
}

- (BOOL)isTodayOverlayPresented
{
  uint64_t v2 = [(SBIconController *)self iconManager];
  char v3 = [v2 isOverlayTodayViewVisible];

  return v3;
}

- (void)dismissTodayOverlayForIconManager:(id)a3
{
}

- (void)dismissLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  if ([(SBIconController *)self isModalAppLibrarySupported])
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v12;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 modalLibraryController];

    [v11 dismissLibraryAnimated:v5 completion:0];
  }
  else
  {
    [(SBIconController *)self dismissLibraryAnimated:v5 completion:0];
  }
}

- (void)dismissOverlaysForIconManager:(id)a3
{
}

- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3
{
  char v3 = +[SBDefaults localDefaults];
  BOOL v4 = [v3 iconDefaults];
  unint64_t v5 = [v4 maxIconListCount];

  if (v5 - 1 >= 0xE) {
    return 15;
  }
  else {
    return v5;
  }
}

- (BOOL)listsAllowRotatedLayoutForIconManager:(id)a3
{
  return objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3) == 1;
}

- (void)iconManagerDidNoteIconStateChangedExternally:(id)a3
{
  id v4 = a3;
  [(SBIconController *)self dismissAppIconForceTouchControllers:0];
  [v4 dismissIconShareSheets];
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 willUseTransitionContext:(id)a5 toTransitionToState:(int64_t)a6
{
  id v10 = a5;
  uint64_t v9 = [a4 pageState];
  if (a6 == 2 && v9 == 3) {
    [(SBTodayViewController *)self->_todayViewController setTransitionContext:v10];
  }
}

+ (void)_getApplicationDataStore:(id *)a3 configurationKey:(id *)a4 forDataSource:(id)a5
{
  id v7 = a5;
  char v8 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();
  if (v8 & 1) != 0 && (v9)
  {
    id v10 = [v7 uniqueIdentifier];
    id v11 = [v7 configurationStorageIdentifier];
    if ([v11 length])
    {
      *a3 = [MEMORY[0x1E4F628D8] storeForApplication:v11];
    }
    else
    {
      id v12 = SBLogWidgetIntent();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SBIconController _getApplicationDataStore:configurationKey:forDataSource:]();
      }
    }
    if ([v10 length])
    {
      *a4 = [NSString stringWithFormat:@"icon-config:%@", v10];
    }
    else
    {
      id v13 = SBLogWidgetIntent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[SBIconController _getApplicationDataStore:configurationKey:forDataSource:]();
      }
    }
  }
}

- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = objc_opt_class();
  id v10 = SBSafeCast(v9, v7);
  if (![v8 isWidgetIcon]) {
    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_4;
  }
  id v11 = [v10 uniqueIdentifier];
  id v12 = [v8 uniqueIdentifier];
  id v13 = [(SBIconController *)self temporaryIntentDataForIconWithIdentifier:v12 widgetUniqueIdentifier:v11];

  if (!v13)
  {
LABEL_4:
    id v14 = [MEMORY[0x1E4FA5F80] sharedInstance];
    [v14 performAfterFirstUnlockSinceBootUsingBlock:&__block_literal_global_780];
    id v24 = 0;
    id v25 = 0;
    [(id)objc_opt_class() _getApplicationDataStore:&v25 configurationKey:&v24 forDataSource:v7];
    id v15 = v25;
    id v16 = v24;
    id v17 = self;
    id v13 = [v15 safeObjectForKey:v16 ofType:v17];

    long long v18 = SBLogWidgetIntent();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      SBHConfigurationIdentifierFromDataSource();
      id v19 = v23 = v8;
      long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
      id v21 = [v14 state];
      *(_DWORD *)buf = 138544130;
      int v27 = v19;
      __int16 v28 = 2114;
      id v29 = v16;
      __int16 v30 = 2114;
      __int16 v31 = v20;
      __int16 v32 = 2114;
      uint64_t v33 = v21;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: fetched config data for key: %{public}@, result: %{public}@ bytes with keybag state: %{public}@.", buf, 0x2Au);

      id v8 = v23;
    }
  }
  return v13;
}

void __70__SBIconController_iconManager_configurationDataForDataSource_ofIcon___block_invoke()
{
  id v0 = SBLogWidgetIntent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __70__SBIconController_iconManager_configurationDataForDataSource_ofIcon___block_invoke_cold_1();
  }
}

- (void)iconManager:(id)a3 dataSource:(id)a4 ofIcon:(id)a5 didUpdateConfigurationData:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v20 = 0;
  id v21 = 0;
  [(id)objc_opt_class() _getApplicationDataStore:&v21 configurationKey:&v20 forDataSource:v8];
  id v11 = v21;
  id v12 = v20;
  [v11 setObject:v10 forKey:v12];
  id v13 = (void *)MEMORY[0x1E4F628D8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __77__SBIconController_iconManager_dataSource_ofIcon_didUpdateConfigurationData___block_invoke;
  void v18[3] = &unk_1E6AF4AC0;
  id v14 = v9;
  id v19 = v14;
  [v13 synchronizeWithCompletion:v18];
  id v15 = SBLogWidgetIntent();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = SBHConfigurationIdentifierFromDataSource();
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
    *(_DWORD *)buf = 138543874;
    id v23 = v16;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2114;
    int v27 = v17;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: updating config data for key: %{public}@, data: %{public}@ bytes", buf, 0x20u);
  }
}

void __77__SBIconController_iconManager_dataSource_ofIcon_didUpdateConfigurationData___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v4 = [v3 activeWidget];
    unint64_t v5 = [v4 extensionBundleIdentifier];
  }
  else
  {
    unint64_t v5 = [v3 uniqueIdentifier];
  }
  id v6 = SBLogWidgetIntent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Writing to disk for icon(%{public}@) config data.", (uint8_t *)&v7, 0xCu);
  }
}

- (void)iconManager:(id)a3 didRemoveConfigurableDataSource:(id)a4 ofIcon:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v10 = 0;
  id v11 = 0;
  [(id)objc_opt_class() _getApplicationDataStore:&v11 configurationKey:&v10 forDataSource:v5];
  id v6 = v11;
  id v7 = v10;
  [v6 removeObjectForKey:v7];
  id v8 = SBLogWidgetIntent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = SBHConfigurationIdentifierFromDataSource();
    *(_DWORD *)buf = 138543618;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: removed config data for key: %{public}@", buf, 0x16u);
  }
}

- (void)iconManager:(id)a3 prepareForPageHidingEducationWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconController *)self homeScreenOverlayController];
  [v6 dismissAnimated:1 completionHandler:v5];
}

- (void)iconManager:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBIconControllerDisableRotationForPageHidingReason"];
  if (v10) {
    [v9 setObject:v10 forKey:@"SBIconControllerPreventDeviceOrientationChangesForPageHiding"];
  }
  id v11 = [[SBDisableActiveInterfaceOrientationChangeAssertion alloc] initWithReason:@"SBIconControllerDisableRotationForPageHidingReason" nudgeOrientationOnInvalidate:0];
  if (v11) {
    [v9 setObject:v11 forKey:@"SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"];
  }
  id v12 = [(SBIconController *)self mainDisplayWindowScene];
  id v13 = [v12 floatingDockController];
  __int16 v14 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v13 visibleProgress:1 animated:0 gesturePossible:1 atLevel:@"pageManagement" reason:0 withCompletion:0.0];
  if (v14) {
    [v9 setObject:v14 forKey:@"SBIconControllerPageHidingFloatingDockBehaviorAssertion"];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __92__SBIconController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke;
  void v18[3] = &unk_1E6AF4AC0;
  id v19 = v9;
  id v15 = v9;
  uint64_t v16 = MEMORY[0x1D948C7A0](v18);
  id v17 = (void *)v16;
  if (v8) {
    [v8 addAnimations:v16];
  }
  else {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
}

void __92__SBIconController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke(uint64_t a1)
{
  id v4 = +[SBWallpaperController sharedInstance];
  [v4 minimumHomescreenWallpaperScale];
  char v3 = objc_msgSend(v4, "setHomescreenWallpaperScale:withAnimationFactory:", 0, fmax(v2, 0.8));
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKey:@"SBIconControllerChangeWallpaperScaleForPageHiding"];
  }
}

- (void)iconManager:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = [v7 objectForKey:@"SBIconControllerChangeWallpaperScaleForPageHiding"];
  [v7 removeObjectForKey:@"SBIconControllerChangeWallpaperScaleForPageHiding"];
  id v9 = [v7 objectForKey:@"SBIconControllerPageHidingFloatingDockBehaviorAssertion"];
  id v10 = v9;
  if (v9)
  {
    [v9 invalidate];
    [v7 removeObjectForKey:@"SBIconControllerPageHidingFloatingDockBehaviorAssertion"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint8_t v14[2] = __79__SBIconController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke;
  void v14[3] = &unk_1E6AF4AC0;
  id v15 = v8;
  id v11 = v8;
  uint64_t v12 = MEMORY[0x1D948C7A0](v14);
  id v13 = (void *)v12;
  if (v6) {
    [v6 addAnimations:v12];
  }
  else {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
}

uint64_t __79__SBIconController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)iconManager:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5
{
  id v11 = a4;
  id v6 = a5;
  id v7 = [v6 objectForKey:@"SBIconControllerPreventDeviceOrientationChangesForPageHiding"];
  [v7 invalidate];
  [v6 removeObjectForKey:@"SBIconControllerPreventDeviceOrientationChangesForPageHiding"];
  id v8 = [v6 objectForKey:@"SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"];
  [v8 invalidate];
  [v6 removeObjectForKey:@"SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"];

  id v9 = [v11 completionURL];
  id v10 = v9;
  if (v9)
  {
    SBWorkspaceActivateApplicationFromURL(v9, 0, 0);
    [v11 setCompletionURL:0];
  }
}

- (void)iconManagerWillPresentWidgetEditing:(id)a3
{
  if (!self->_addWidgetSheetFloatingDockBehaviorAssertion)
  {
    id v4 = [(SBIconController *)self mainDisplayWindowScene];
    id v5 = [v4 floatingDockController];
    id v6 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v5 visibleProgress:1 animated:1 gesturePossible:3 atLevel:@"addWidgetSheet" reason:0 withCompletion:0.0];
    addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
    self->_addWidgetSheetFloatingDockBehaviorAssertion = v6;

    id v8 = [(SBIconController *)self homeScreenViewController];
    id v9 = [v8 iconContentView];
    id v10 = [v9 window];
    if (!self->_addWidgetSheetKeyboardFocusAssertion)
    {
      id v11 = +[SBWorkspace mainWorkspace];
      uint64_t v12 = [v11 keyboardFocusController];
      id v13 = +[SBKeyboardFocusLockReason addWidgetSheet];
      __int16 v14 = [v12 focusLockSpringBoardWindow:v10 forReason:v13];
      addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
      self->_addWidgetSheetKeyboardFocusAssertion = v14;
    }
    if (([v10 isKeyWindow] & 1) == 0) {
      [v10 makeKeyWindow];
    }
  }
  [(SBBarSwipeAffordanceViewController *)self->_widgetAddSheetAffordanceViewController setWantsToBeActiveAffordance:1];
  [(SBIconController *)self _setWidgetEditingDisplayLayoutElementActive:1];
}

- (void)iconManagerDidDismissWidgetEditing:(id)a3
{
  [(SBFloatingDockBehaviorAssertion *)self->_addWidgetSheetFloatingDockBehaviorAssertion invalidate];
  addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
  self->_addWidgetSheetFloatingDockBehaviorAssertion = 0;

  [(SBIconController *)self _setWidgetEditingDisplayLayoutElementActive:0];
  [(SBBarSwipeAffordanceViewController *)self->_widgetAddSheetAffordanceViewController setWantsToBeActiveAffordance:0];
  addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
  if (addWidgetSheetKeyboardFocusAssertion)
  {
    [(BSInvalidatable *)addWidgetSheetKeyboardFocusAssertion invalidate];
    id v6 = self->_addWidgetSheetKeyboardFocusAssertion;
    self->_addWidgetSheetKeyboardFocusAssertion = 0;
  }
}

- (void)iconManagerWillAnimateWidgetInsertion:(id)a3
{
}

- (BOOL)iconManager:(id)a3 canAddIconToIgnoredList:(id)a4
{
  return objc_msgSend(a4, "isApplicationIcon", a3);
}

- (BOOL)iconManager:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4
{
  return ![(SBIconController *)self shouldAddNewIconsToRootFolder];
}

- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 containerBundleIdentifier];
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] checking widget = %@", (uint8_t *)&v11, 0xCu);
  }
  id v8 = [v5 containerBundleIdentifier];
  BOOL v9 = [(SBIconController *)self _isWidgetWithContainerBundleIdentifierValid:v8];

  return v9;
}

- (BOOL)iconManager:(id)a3 isCustomElementValid:(id)a4
{
  id v5 = objc_msgSend(a4, "containerBundleIdentifier", a3);
  if (v5) {
    BOOL v6 = [(SBIconController *)self _isWidgetWithContainerBundleIdentifierValid:v5];
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_isWidgetWithContainerBundleIdentifierValid:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] applicationIdentifier = %@", (uint8_t *)&v27, 0xCu);
  }

  BOOL v6 = +[SBSyncController sharedInstance];
  char v7 = [v6 isRestoring];

  if ((v7 & 1) == 0)
  {
    BOOL v9 = [(SBIconController *)self applicationPlaceholderController];
    id v10 = [v9 placeholderForDisplayID:v4];

    if (v10)
    {
      int v11 = SBLogWidgetDiscoverability();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] valid placeholder", (uint8_t *)&v27, 2u);
      }
      BOOL v8 = 1;
      goto LABEL_25;
    }
    int v11 = [(SBIconController *)self applicationController];
    uint64_t v12 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 allBundleIdentifiers];
      int v27 = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] all application bundle identifiers = %@", (uint8_t *)&v27, 0xCu);
    }
    __int16 v14 = [v11 applicationWithBundleIdentifier:v4];
    id v15 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v14;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] application = %@", (uint8_t *)&v27, 0xCu);
    }

    if (v14)
    {
      if (self->_isAppAllowlistActiveAndTransient)
      {
        uint64_t v16 = SBLogWidgetDiscoverability();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:
          BOOL v8 = 1;
LABEL_23:

LABEL_24:
LABEL_25:

          goto LABEL_26;
        }
        LOWORD(v27) = 0;
        id v17 = "[ContainerBundleIdentifier debugging] not valid restricted, but current layout is transient. Permitting widget.";
LABEL_17:
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v27, 2u);
        goto LABEL_18;
      }
      id v20 = [(SBIconController *)self applicationController];
      id v21 = [v20 restrictionController];
      int v22 = [v21 isApplicationIdentifierRestricted:v4];

      if (!v22)
      {
        BOOL v8 = 1;
        goto LABEL_24;
      }
      int v23 = [v4 isEqualToString:@"com.apple.news"];
      __int16 v24 = [MEMORY[0x1E4F74230] sharedConnection];
      int v25 = [v24 effectiveBoolValueForSetting:*MEMORY[0x1E4F740F8]];

      uint64_t v16 = SBLogWidgetDiscoverability();
      BOOL v26 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v23 && v25 == 1)
      {
        if (!v26) {
          goto LABEL_18;
        }
        LOWORD(v27) = 0;
        id v17 = "[ContainerBundleIdentifier debugging] News app is restricted, but the widget is valid and not restricted";
        goto LABEL_17;
      }
      if (v26)
      {
        LOWORD(v27) = 0;
        long long v18 = "[ContainerBundleIdentifier debugging] not valid restricted";
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v16 = SBLogWidgetDiscoverability();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        long long v18 = "[ContainerBundleIdentifier debugging] not valid application";
LABEL_21:
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v27, 2u);
      }
    }
    BOOL v8 = 0;
    goto LABEL_23;
  }
  BOOL v8 = 1;
LABEL_26:

  return v8;
}

- (BOOL)canAppPredictionsWidgetAlignWithGrid
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    char v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  return !v2;
}

- (BOOL)iconManager:(id)a3 canCustomElementAlignWithGrid:(id)a4
{
  id v5 = a4;
  BOOL v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  return [(SBIconController *)self canAppPredictionsWidgetAlignWithGrid];
}

- (BOOL)iconManager:(id)a3 canAddIcon:(id)a4 toIconList:(id)a5 inFolder:(id)a6
{
  return 1;
}

- (void)iconManager:(id)a3 prepareAddSheetViewController:(id)a4
{
  id v5 = a4;
  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  id v12 = v5;
  if (!widgetAddSheetAffordanceViewController)
  {
    char v7 = [(SBIconController *)self mainDisplayWindowScene];
    BOOL v8 = [[SBBarSwipeAffordanceViewController alloc] initWithZStackParticipantIdentifier:6 windowScene:v7];
    BOOL v9 = self->_widgetAddSheetAffordanceViewController;
    self->_widgetAddSheetAffordanceViewController = v8;
    id v10 = v8;

    int v11 = [(SBBarSwipeAffordanceViewController *)v10 view];

    [v11 addObserver:self];
    [v11 setDelegate:self];
    [v11 setHomeAffordanceHidden:1];

    id v5 = v12;
    widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  }
  [v5 setBarSwipeViewController:widgetAddSheetAffordanceViewController];
}

- (void)iconManager:(id)a3 displayFeatureIntroductionItem:(id)a4 atLocation:(unint64_t)a5
{
}

- (void)iconManager:(id)a3 displayFeatureIntroductionItemIfUnlocked:(id)a4
{
  id v9 = a4;
  BOOL v6 = [a3 featureIntroductionManager];
  [v6 addFeatureIntroductionItem:v9 atLocations:4];
  char v7 = [(SBIconController *)self lockScreenManager];
  char v8 = [v7 isUILocked];

  if ((v8 & 1) == 0) {
    [(SBIconController *)self displayFeatureIntroductionItem:v9 atLocation:4];
  }
}

- (id)iconManager:(id)a3 floatingDockViewControllerForViewController:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  id v5 = [v4 floatingDockController];
  BOOL v6 = [v5 floatingDockViewController];

  return v6;
}

- (BOOL)iconManager:(id)a3 isEditingAllowedForIconView:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  char v5 = [v4 isMainDisplayWindowScene];

  return v5;
}

- (id)iconManager:(id)a3 widgetDataSourceForReplacingIconWithWidget:(id)a4 proposedWidgetDataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v9)
  {
    if ([v8 isApplicationIcon])
    {
      int v11 = [v8 applicationBundleID];
      if ([v11 isEqualToString:@"com.apple.MobileAddressBook"])
      {
        id v12 = [v7 widgetExtensionProvider];
        uint64_t v13 = objc_msgSend(v12, "sbh_defaultDescriptorForContainerBundleIdentifier:", @"com.apple.PeopleViewService");

        id v10 = objc_msgSend(v13, "sbh_iconDataSource");
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)iconManager:(id)a3 applicationIconForReplacingIconWithAppIcon:(id)a4 proposedApplicationIcon:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!v8)
  {
    if ([v7 isWidgetIcon] && (objc_msgSend(v7, "isWidgetStackIcon") & 1) == 0)
    {
      id v10 = [v7 activeWidget];
      int v11 = [v10 containerBundleIdentifier];
      id v12 = [v10 extensionBundleIdentifier];
      uint64_t v13 = [v10 kind];
      if ([v11 isEqualToString:@"com.apple.PeopleViewService"]
        && [v12 isEqualToString:@"com.apple.PeopleViewService.PeopleWidget-iOS"]
        && [v13 isEqualToString:@"SingleContactWidget_iOS"])
      {
        __int16 v14 = [(SBIconController *)self model];
        id v9 = [v14 applicationIconForBundleIdentifier:@"com.apple.MobileAddressBook"];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (void)iconManager:(id)a3 willChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6
{
}

- (void)iconManager:(id)a3 didChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6
{
}

- (void)iconManagerToggleHomeScreenWallpaperDimming:(id)a3
{
  uint64_t v4 = [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator isWallpaperDimmed] ^ 1;
  iconStyleCoordinator = self->_iconStyleCoordinator;
  [(SBWallpaperIconStyleCoordinator *)iconStyleCoordinator setWallpaperDimmed:v4];
}

- (BOOL)isHomeScreenWallpaperDimmedForIconManager:(id)a3
{
  return [(SBWallpaperIconStyleCoordinator *)self->_iconStyleCoordinator isWallpaperDimmed];
}

- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4
{
  id v4 = a4;
  char v5 = [v4 extensionIdentity];
  BOOL v6 = [v5 containerBundleIdentifier];

  id v7 = [v4 extensionIdentity];

  id v8 = [v7 extensionBundleIdentifier];

  if ([(__CFString *)v6 isEqualToString:@"com.apple.Health.Sleep"]
    && [v8 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"])
  {

    BOOL v6 = @"com.apple.Health";
  }

  return v6;
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  id v6 = a3;
  id v7 = [(SBBarSwipeAffordanceViewController *)widgetAddSheetAffordanceViewController barSwipeAffordanceView];

  if (v7 == v6 && a4 == 1) {
    return 58;
  }
  else {
    return 0;
  }
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  id v5 = a3;
  id v6 = [(SBBarSwipeAffordanceViewController *)widgetAddSheetAffordanceViewController barSwipeAffordanceView];

  if (v6 == v5)
  {
    id v7 = [(SBIconController *)self _rootFolderController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)libraryViewControllerRequestsDismissal:(id)a3
{
  id v6 = a3;
  if ([(SBIconController *)self isModalAppLibrarySupported])
  {
    id v4 = [v6 _sbWindowScene];
    id v5 = [v4 modalLibraryController];

    [v5 dismissLibraryAnimated:1 completion:0];
  }
  else
  {
    [(SBIconController *)self dismissLibraryAnimated:1 completion:0];
  }
}

- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4
{
  id v4 = [(SBIconController *)self homeScreenOverlayController];
  [v4 addReasonToDisableDismissGestureRecognizer:@"kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"];
}

- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4
{
  id v4 = [(SBIconController *)self homeScreenOverlayController];
  [v4 removeReasonToDisableDismissGestureRecognizer:@"kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"];
}

- (void)libraryViewControllerWillPresent:(id)a3
{
  id v3 = [(SBIconController *)self _rootFolderController];
  [v3 dismissWidgetEditingViewControllerIfPresentedAnimated:1];
}

- (void)libraryViewControllerDidDismiss:(id)a3
{
  id v3 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
}

- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a3;
  id v7 = [v5 defaultCenter];
  [v7 postNotificationName:SBIconControllerOverlayVisibilityDidChangeNotification object:self];

  libraryViewControllersActivatingSpotlightAppService = self->_libraryViewControllersActivatingSpotlightAppService;
  if (!libraryViewControllersActivatingSpotlightAppService)
  {
    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v10 = self->_libraryViewControllersActivatingSpotlightAppService;
    self->_libraryViewControllersActivatingSpotlightAppService = v9;

    libraryViewControllersActivatingSpotlightAppService = self->_libraryViewControllersActivatingSpotlightAppService;
  }
  uint64_t v11 = [(NSHashTable *)libraryViewControllersActivatingSpotlightAppService count];
  [(NSHashTable *)self->_libraryViewControllersActivatingSpotlightAppService addObject:v6];

  if (!v11)
  {
    id v12 = [MEMORY[0x1E4FA5E20] sharedAppService];
    [v12 activate];
  }
}

- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  [v5 postNotificationName:SBIconControllerOverlayVisibilityDidChangeNotification object:self];

  id v6 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
  }

  kdebug_trace();
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  id v5 = a3;
  id v6 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  kdebug_trace();
  [(NSHashTable *)self->_libraryViewControllersActivatingSpotlightAppService removeObject:v5];

  if (![(NSHashTable *)self->_libraryViewControllersActivatingSpotlightAppService count])
  {
    id v7 = [MEMORY[0x1E4FA5E20] sharedAppService];
    [v7 deactivate];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v9 = (SBHIconEditingSettings *)a3;
  id v6 = a4;
  id v7 = [(SBIconController *)self rootFolderSettings];

  if (v7 == v9)
  {
    if ([v6 isEqualToString:@"showsSpotlightOnEveryPage"])
    {
      id v8 = [(SBIconController *)self iconManager];
      [v8 tearDownAndResetRootIconLists];
    }
  }
  else if (self->_iconEditingSettings == v9)
  {
    [(SBIconController *)self _configureEditingGestureRecognizers];
  }
}

- (void)folderIconStateDidDirty:(id)a3
{
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4 = a4;
  [v4 setActivationPolicyForParticipantsBelow:0];
  [v4 setHomeGestureConsumption:1];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SBIconController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__SBIconController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) appProtectionSubjectMonitorSubscription];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    objc_msgSend(*(id *)(v1 + 48), "bs_map:", &__block_literal_global_838);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v25;
      *(void *)&long long v5 = 138412290;
      long long v20 = v5;
      uint64_t v21 = *(void *)v25;
      do
      {
        uint64_t v8 = 0;
        uint64_t v22 = v6;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
          id v10 = objc_msgSend(v9, "bundleIdentifier", v20);
          id v11 = [*(id *)(v1 + 40) hiddenAppBundleIdentifiers];
          if ([v9 isHidden])
          {
            id v12 = [*(id *)(v1 + 40) hiddenAppBundleIdentifiers];
            if (!v12) {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v12 addObject:v10];
            uint64_t v13 = v1;
            __int16 v14 = [*(id *)(v1 + 40) iconManager];
            id v15 = [v14 iconModel];
            uint64_t v16 = [v9 bundleIdentifier];
            id v17 = [v15 applicationIconForBundleIdentifier:v16];

            if (v17)
            {
              [v14 addIconToIgnoredList:v17 options:3 completion:0];
            }
            else
            {
              long long v18 = SBLogAppProtection();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                id v19 = [v9 bundleIdentifier];
                *(_DWORD *)buf = v20;
                uint64_t v29 = v19;
                _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Could not add bundle identifier:%@ to ignored list. app icon is nil", buf, 0xCu);
              }
            }
            uint64_t v7 = v21;

            uint64_t v1 = v13;
            uint64_t v6 = v22;
          }
          else if ([v11 containsObject:v10])
          {
            [v11 removeObject:v10];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v6);
    }
  }
}

id __65__SBIconController_appProtectionSubjectsChanged_forSubscription___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      long long v5 = v4;
    }
    else {
      long long v5 = 0;
    }
  }
  else
  {
    long long v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)searchBarDidFocus
{
  id v2 = [(SBIconController *)self _rootFolderController];
  if (([v2 isTransitioningPageState] & 1) == 0 && (SBSpotlightIsVisible() & 1) == 0) {
    [v2 presentSpotlightAnimated:1 completionHandler:0];
  }
}

- (void)proactiveHomeScreenSuggestionProviderDidUpdatePrediction:(id)a3
{
  id v5 = [a3 currentPrediction];
  id v4 = [(SBIconController *)self proactiveUsageObserver];
  [v4 setCurrentPrediction:v5];
}

- (void)proactiveHomeScreenSuggestionProvider:(id)a3 willUseTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = SBLogWidgetIntent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    id v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = [v9 _indexingHash];
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Setting temporary intent '%@/%lld' for icons with identifier '%@' / widgetUniqueIdentifier: %{public}@", (uint8_t *)&v13, 0x2Au);
  }

  [(SBIconController *)self setTemporaryIntent:v9 forIconWithIdentifier:v10 widgetUniqueIdentifier:v11];
}

- (id)proactiveHomeScreenUsageObserver:(id)a3 intentForWidget:(id)a4 ofIcon:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBIconController *)self iconManager];
  id v10 = [v9 intentForWidget:v8 ofIcon:v7];

  return v10;
}

- (BOOL)appPredictionViewController:(id)a3 launchAppFromIcon:(id)a4
{
  return 0;
}

- (id)appPredictionViewController:(id)a3 badgeValueForApplicationWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  if ([(NSMutableSet *)self->_displayIDsWithBadgingEnabled containsObject:v5])
  {
    id v6 = [(SBIconController *)self applicationController];
    id v7 = [v6 applicationWithBundleIdentifier:v5];
    id v8 = [v7 badgeValue];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)appPredictionViewController:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4
{
  return [(SBIconController *)self _allowsBadgingForApplicationBundleIdentifier:a4];
}

- (id)appPredictionViewController:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconController *)self model];
  id v7 = [v6 applicationIconForBundleIdentifier:v5];

  return v7;
}

- (id)additionalIconListLayoutObserversForAppPredictionViewController:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBIconController *)self iconManager];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __67__SBIconController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __67__SBIconController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  [*(id *)(a1 + 40) _updateFocusModeManagerWithDoNotDisturbState:v2];
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  id v15 = 0;
  id v5 = objc_msgSend(a3, "availableModesReturningError:", &v15, a4);
  id v6 = v15;
  if (v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBIconController modeConfigurationService:didReceiveAvailableModesUpdate:]();
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke;
  void v13[3] = &unk_1E6AFBAF0;
  id v9 = v8;
  id v14 = v9;
  [v5 enumerateObjectsUsingBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2;
  v11[3] = &unk_1E6AF5290;
  void v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [v3 UUIDString];

  [*(id *)(a1 + 32) addObject:v4];
}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootFolder];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_3;
  v4[3] = &unk_1E6AFBB40;
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  id v3 = v2;
  [v3 enumerateListsUsingBlock:v4];
}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 focusModeIdentifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_4;
  v6[3] = &unk_1E6AFBB18;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __76__SBIconController_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    id v4 = SBLogFocusModes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Removing a focus mode that no longer exists: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6268]) initWithIdentifier:v3 folder:*(void *)(a1 + 40)];
    [v5 removeFromList:*(void *)(a1 + 48)];
  }
}

- (id)createStatusBarVisibiltyAssertionForWindowScene:(id)a3
{
  id v3 = [a3 statusBarManager];
  id v4 = [v3 assertionManager];
  id v5 = (void *)[v4 newSettingsAssertionWithStatusBarHidden:0 atLevel:0 reason:@"show on homescreen backstop"];

  return v5;
}

- (void)updateRootFolderWithCurrentDoNotDisturbState
{
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 792) queryCurrentStateWithError:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2;
  v4[3] = &unk_1E6AF5290;
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __64__SBIconController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFocusModeManagerWithDoNotDisturbState:*(void *)(a1 + 40)];
}

- (void)_updateFocusModeManagerWithDoNotDisturbState:(id)a3
{
  id v4 = a3;
  id v9 = [(SBIconController *)self iconManager];
  id v5 = [v9 focusModeManager];
  int v6 = [(SBIconController *)self _focusModeFromDoNotDisturbState:v4];

  [v5 setActiveFocusMode:v6];
  if ([v6 customizedHomeScreenPagesEnabled])
  {
    id v7 = [(SBIconController *)self mainDisplayWindowScene];
    uint64_t v8 = [v7 floatingDockController];
    [v8 resetRecentsAndSuggestions];
  }
}

- (id)_focusModeFromDoNotDisturbState:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isActive])
  {
    id v5 = [v4 activeModeConfiguration];
    int v6 = [v5 mode];
    id v7 = [v6 identifier];
    uint64_t v8 = [v7 UUIDString];

    uint64_t v37 = [(SBIconController *)self rootFolder];
    uint64_t v38 = (void *)v8;
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA6268]) initWithIdentifier:v8 folder:v37];
    id v10 = [v6 name];
    [v9 setName:v10];

    id v11 = [v6 symbolImageName];
    [v9 setSymbol:v11];

    if ([v6 semanticType] == 1) {
      [v9 setSleepFocus:1];
    }
    id v35 = [v6 tintColorName];
    SEL v12 = NSSelectorFromString(v35);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [MEMORY[0x1E4F428B8] performSelector:v12];
    }
    else
    {
      id v14 = [MEMORY[0x1E4F5F5F8] defaultTintColorName];
      SEL v15 = NSSelectorFromString(v14);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [MEMORY[0x1E4F428B8] performSelector:v15];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    [v9 setColor:v13];
    uint64_t v16 = [v5 configuration];
    uint64_t v17 = [v16 hideApplicationBadges];
    id v40 = v4;
    if ([v16 applicationConfigurationType])
    {
      if (objc_msgSend(v16, "applicationConfigurationType", v13, v35) == 1) {
        [v9 setHidesOnlyDeniedApplicationBadges:v17 == 2];
      }
    }
    else
    {
      objc_msgSend(v9, "setShowsOnlyAllowedApplicationBadges:", v17 == 2, v13, v35);
    }
    int v39 = v5;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    __int16 v19 = [v16 allowedApplicationIdentifiers];
    id v20 = [v19 allKeys];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = [*(id *)(*((void *)&v45 + 1) + 8 * i) bundleID];
          [v18 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v22);
    }

    [v9 setAllowedApplicationBundleIdentifiers:v18];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v27 = [v16 deniedApplicationIdentifiers];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          __int16 v32 = [*(id *)(*((void *)&v41 + 1) + 8 * j) bundleID];
          [v26 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v29);
    }

    [v9 setDeniedApplicationBundleIdentifiers:v26];
    id v4 = v40;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)testSetupForIconManagerWidgetScrollPerformanceTest:(id)a3
{
  v40[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA6530];
  id v36 = [MEMORY[0x1E4FA6370] todayNewsWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6530]];
  v39[0] = v36;
  uint64_t v4 = *MEMORY[0x1E4FA6560];
  id v35 = [MEMORY[0x1E4FA6370] overviewStocksWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6560]];
  v39[1] = v35;
  uint64_t v34 = [MEMORY[0x1E4FA6370] calendarWidgetIconDescriptorForSizeClass:v4];
  v39[2] = v34;
  uint64_t v33 = [MEMORY[0x1E4FA6360] health];
  v39[3] = v33;
  __int16 v32 = [MEMORY[0x1E4FA6360] home];
  void v39[4] = v32;
  uint64_t v31 = [MEMORY[0x1E4FA6360] passbook];
  v39[5] = v31;
  uint64_t v30 = [MEMORY[0x1E4FA6360] preferences];
  v39[6] = v30;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
  v40[0] = v29;
  uint64_t v28 = [MEMORY[0x1E4FA6370] remindersWidgetIconDescriptorForSizeClass:v3];
  v38[0] = v28;
  long long v27 = [MEMORY[0x1E4FA6370] tvWidgetIconDescriptorForSizeClass:v3];
  v38[1] = v27;
  id v26 = [MEMORY[0x1E4FA6360] documents];
  v38[2] = v26;
  long long v25 = [MEMORY[0x1E4FA6360] findMy];
  v38[3] = v25;
  long long v24 = [MEMORY[0x1E4FA6360] shortcuts];
  v38[4] = v24;
  uint64_t v23 = [MEMORY[0x1E4FA6360] iTunesStore];
  v38[5] = v23;
  uint64_t v22 = [MEMORY[0x1E4FA6360] tips];
  v38[6] = v22;
  uint64_t v21 = [MEMORY[0x1E4FA6360] translate];
  v38[7] = v21;
  id v20 = [MEMORY[0x1E4FA6360] contacts];
  v38[8] = v20;
  __int16 v19 = [MEMORY[0x1E4FA6360] watch];
  v38[9] = v19;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:10];
  v40[1] = v18;
  uint64_t v17 = [MEMORY[0x1E4FA6378] defaultStackIconDescriptorForSizeClass:v3];
  v37[0] = v17;
  uint64_t v16 = [MEMORY[0x1E4FA6370] recentsWidgetIconDescriptorForSizeClass:v3];
  v37[1] = v16;
  id v5 = [MEMORY[0x1E4FA6360] documents];
  v37[2] = v5;
  int v6 = [MEMORY[0x1E4FA6360] findMy];
  void v37[3] = v6;
  id v7 = [MEMORY[0x1E4FA6360] shortcuts];
  v37[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4FA6360] iTunesStore];
  v37[5] = v8;
  id v9 = [MEMORY[0x1E4FA6360] health];
  v37[6] = v9;
  id v10 = [MEMORY[0x1E4FA6360] home];
  v37[7] = v10;
  id v11 = [MEMORY[0x1E4FA6360] passbook];
  v37[8] = v11;
  SEL v12 = [MEMORY[0x1E4FA6360] preferences];
  v37[9] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:10];
  v40[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];

  return v14;
}

- (id)testSetupForIconManagerAddWidgetsToEachPage:(id)a3
{
  void v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA6530];
  uint64_t v4 = [MEMORY[0x1E4FA6370] gasparWatchDogWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6530]];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4FA6370] relivePhotosWidgetIconDescriptorForSizeClass:v3];
  v10[1] = v5;
  int v6 = [MEMORY[0x1E4FA6370] mobileNotesWidgetIconDescriptorForSizeClass:v3];
  void v10[2] = v6;
  id v7 = [MEMORY[0x1E4FA6370] remindersWidgetIconDescriptorForSizeClass:v3];
  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

- (id)testSetupForIconManagerWidgetScrollTest:(id)a3
{
  v46[17] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v39 = (id)objc_opt_new();
  uint64_t v3 = 0;
  uint64_t v37 = (void *)*MEMORY[0x1E4FA6530];
  uint64_t v30 = *MEMORY[0x1E4FA6560];
  uint64_t v29 = *MEMORY[0x1E4FA6528];
  uint64_t v28 = *MEMORY[0x1E4FA6520];
  do
  {
    uint64_t v4 = objc_opt_new();
    id v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if ((v3 & 1 | 2) == 2)
      {
        uint64_t v40 = [MEMORY[0x1E4FA6370] dateTimeWidgetIconDescriptorForSizeClass:v30];
        v46[0] = v40;
        long long v43 = [MEMORY[0x1E4FA6370] notesWidgetIconDescriptorForSizeClass:v30];
        v46[1] = v43;
        uint64_t v36 = [MEMORY[0x1E4FA6378] padDefaultLeadingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:v29];
        v46[2] = v36;
        uint64_t v35 = [MEMORY[0x1E4FA6370] calendarWidgetIconDescriptorForSizeClass:v37];
        v46[3] = v35;
        uint64_t v7 = [MEMORY[0x1E4FA6378] padDefaultTrailingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:v29];
        v46[4] = v7;
        uint64_t v38 = v4;
        uint64_t v8 = [MEMORY[0x1E4FA6360] facetime];
        v46[5] = v8;
        long long v42 = [MEMORY[0x1E4FA6360] documents];
        v46[6] = v42;
        id v9 = [MEMORY[0x1E4FA6360] reminders];
        v46[7] = v9;
        id v10 = [MEMORY[0x1E4FA6360] maps];
        v46[8] = v10;
        uint64_t v34 = [MEMORY[0x1E4FA6360] home];
        v46[9] = v34;
        uint64_t v33 = [MEMORY[0x1E4FA6360] camera];
        v46[10] = v33;
        __int16 v32 = [MEMORY[0x1E4FA6360] appStore];
        v46[11] = v32;
        uint64_t v31 = [MEMORY[0x1E4FA6360] books];
        v46[12] = v31;
        id v11 = [MEMORY[0x1E4FA6360] podcasts];
        v46[13] = v11;
        SEL v12 = [MEMORY[0x1E4FA6360] tv];
        v46[14] = v12;
        uint64_t v13 = [MEMORY[0x1E4FA6360] news];
        v46[15] = v13;
        id v14 = [MEMORY[0x1E4FA6360] preferences];
        v46[16] = v14;
        SEL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:17];
        [v38 addObjectsFromArray:v15];

        uint64_t v16 = (void *)v8;
        uint64_t v17 = (void *)v7;

        uint64_t v4 = v38;
        id v18 = (void *)v40;
        __int16 v19 = (void *)v36;

        id v20 = (void *)v35;
      }
      else
      {
        id v18 = [MEMORY[0x1E4FA6370] tvWidgetIconDescriptorForSizeClass:v28];
        v45[0] = v18;
        long long v43 = [MEMORY[0x1E4FA6360] findMy];
        v45[1] = v43;
        __int16 v19 = [MEMORY[0x1E4FA6360] shortcuts];
        v45[2] = v19;
        id v20 = [MEMORY[0x1E4FA6360] iTunesStore];
        v45[3] = v20;
        uint64_t v17 = [MEMORY[0x1E4FA6360] health];
        v45[4] = v17;
        uint64_t v16 = [MEMORY[0x1E4FA6360] home];
        v45[5] = v16;
        long long v42 = [MEMORY[0x1E4FA6360] passbook];
        v45[6] = v42;
        id v9 = [MEMORY[0x1E4FA6360] preferences];
        v45[7] = v9;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:8];
        [v4 addObjectsFromArray:v10];
      }
    }
    else
    {
      id v21 = v37;
      id v41 = v21;
      switch(v3 & 3)
      {
        case 1:
          uint64_t v22 = [MEMORY[0x1E4FA6370] relivePhotosWidgetIconDescriptorForSizeClass:v21];
          break;
        case 2:
          uint64_t v22 = [MEMORY[0x1E4FA6370] mobileNotesWidgetIconDescriptorForSizeClass:v21];
          break;
        case 3:
          uint64_t v22 = [MEMORY[0x1E4FA6370] remindersWidgetIconDescriptorForSizeClass:v21];
          break;
        default:
          uint64_t v22 = [MEMORY[0x1E4FA6370] gasparWatchDogWidgetIconDescriptorForSizeClass:v21];
          break;
      }
      long long v43 = (void *)v22;
      [v4 addObject:v22];
      __int16 v19 = [MEMORY[0x1E4FA6360] documents];
      v44[0] = v19;
      id v20 = [MEMORY[0x1E4FA6360] findMy];
      v44[1] = v20;
      uint64_t v17 = [MEMORY[0x1E4FA6360] shortcuts];
      v44[2] = v17;
      uint64_t v16 = [MEMORY[0x1E4FA6360] iTunesStore];
      v44[3] = v16;
      long long v42 = [MEMORY[0x1E4FA6360] health];
      v44[4] = v42;
      id v9 = [MEMORY[0x1E4FA6360] home];
      v44[5] = v9;
      id v10 = [MEMORY[0x1E4FA6360] passbook];
      v44[6] = v10;
      uint64_t v23 = [MEMORY[0x1E4FA6360] preferences];
      v44[7] = v23;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:8];
      v25 = long long v24 = v4;
      [v24 addObjectsFromArray:v25];

      uint64_t v4 = v24;
      id v18 = v41;
    }

    [v39 addObject:v4];
    ++v3;
  }
  while (v3 != 8);

  return v39;
}

- (id)testSetupHomeScreenForWidgetScrollPerformanceTest:(id)a3
{
  void v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA6560];
  uint64_t v4 = [MEMORY[0x1E4FA6370] calendarWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6560]];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4FA6370] podcastWidgetIconDescriptorForSizeClass:v3];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4FA6370] relivePhotosWidgetIconDescriptorForSizeClass:v3];
  void v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4FA6370] batteryWidgetIconDescriptorForSizeClass:v3];
  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

- (id)_configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4 = a3;
  if ([(SBIconController *)self isAppLibrarySupported])
  {
    categoryMapProvider = self->_categoryMapProvider;
    id v8 = 0;
    [(SBHLibraryCategoryMapProvider *)categoryMapProvider overrideCategoryMapForTestingAtURL:v4 error:&v8];
    id v6 = v8;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_configureDeweyOneCategoryWithAllApps
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(SBIconController *)self isAppLibrarySupported])
  {
    uint64_t v3 = self->_iconModel;
    id v4 = [(SBHIconModel *)v3 leafIcons];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v3, "isIconVisible:", v11, (void)v18))
          {
            SEL v12 = [v11 applicationBundleID];
            if (v12)
            {
              uint64_t v13 = [v11 leafIdentifier];
              [v5 setObject:v11 forKey:v13];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v8);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4FA62E8]);
    SEL v15 = [MEMORY[0x1E4FA62D8] categoryWithLocalizedDisplayName:@"Reference & Reading" categoryID:0 categoryIndex:0];
    uint64_t v22 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v14 setCategoryIdentifiers:v16];

    [v14 setLocalizedCategoryName:@"Reference & Reading" forCategoryIdentifier:v15];
    uint64_t v17 = [v5 allKeys];
    [v14 setSortedApplicationIdentifiers:v17 forCategoryIdentifier:v15];

    [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider overrideCategoryMapForTesting:v14];
  }
}

- (void)_configureDeweyEachAppHasItsOwnCategory:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(SBIconController *)self isAppLibrarySupported])
  {
    unint64_t v17 = a3;
    id v5 = self->_iconModel;
    id v6 = [(SBHIconModel *)v5 leafIcons];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          SEL v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v5, "isIconVisible:", v12, v17))
          {
            uint64_t v13 = [v12 applicationBundleID];
            if (v13)
            {
              id v14 = [v12 leafIdentifier];
              [v7 setObject:v12 forKey:v14];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    id v15 = objc_alloc_init(MEMORY[0x1E4FA62E8]);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __60__SBIconController__configureDeweyEachAppHasItsOwnCategory___block_invoke;
    void v18[3] = &unk_1E6AFBB68;
    long long v20 = v22;
    id v16 = v15;
    id v19 = v16;
    unint64_t v21 = v17;
    [v7 enumerateKeysAndObjectsUsingBlock:v18];
    [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider overrideCategoryMapForTesting:v16];

    _Block_object_dispose(v22, 8);
  }
}

void __60__SBIconController__configureDeweyEachAppHasItsOwnCategory___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4FA62D8];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 categoryWithLocalizedDisplayName:v10 categoryID:v8 categoryIndex:v8];
  [*(id *)(a1 + 32) addCategoryIdentifier:v11];
  SEL v12 = *(void **)(a1 + 32);
  v19[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v12 setSortedApplicationIdentifiers:v13 forCategoryIdentifier:v11];

  id v14 = *(void **)(a1 + 32);
  id v15 = [v9 displayName];

  [v14 setLocalizedCategoryName:v15 forCategoryIdentifier:v11];
  unint64_t v16 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  unint64_t v17 = *(void *)(a1 + 48);
  if (v16 > v17 && v17 != 0) {
    *a4 = 1;
  }
}

- (void)_configureLibraryWithCategoryLimit:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(SBIconController *)self isAppLibrarySupported])
  {
    id v5 = [(SBIconController *)self _libraryViewControllers];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) podFolderViewController];
          id v11 = [v10 dataSource];
          [v11 setMaximumNumberOfDisplayedCategories:a3];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_teardownDeweyTestConfigurations
{
  [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider overrideCategoryMapForTesting:0];
  id v3 = (id)[(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider requestLibraryCategoryMapRefreshWithOptions:15 reason:@"Tearing down test config"];
  [(SBIconController *)self _configureLibraryWithCategoryLimit:-1];
}

- (void)_presentPageManagement:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconController *)self _rootFolderController];
  [v5 _presentPageManagement:v4];
}

- (void)_dismissPageManagementIfPresented:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconController *)self _rootFolderController];
  [v5 _dismissPageManagementIfPresented:v4];
}

- (void)iconManager:(id)a3 setTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
}

- (void)iconStyleCoordinatorDidUpdate:(id)a3
{
  id v5 = [(SBIconController *)self iconManager];
  objc_msgSend(v5, "setListLayoutProviderLayoutOptions:animated:", -[SBIconController bestListLayoutProviderLayoutOptions](self, "bestListLayoutProviderLayoutOptions"), 1);
  id v4 = [(SBIconController *)self mainDisplayWindowScene];
  [(SBIconController *)self updateHomeScreenTraitOverridesForWindowScene:v4];

  [(SBIconController *)self informIconStyleObserversOfStyleChange];
}

- (id)powerLogAggregator
{
  return self->_powerLogAggregator;
}

- (id)libraryCategoryMapProvider
{
  return self->_categoryMapProvider;
}

- (id)displayIDsWithBadgingEnabled
{
  id v2 = (void *)[(NSMutableSet *)self->_displayIDsWithBadgingEnabled copy];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v5 = v4;

  return v5;
}

- (void)addIconModelControllerObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBIconController.m", 7915, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  iconModelControllerObservers = self->_iconModelControllerObservers;
  if (!iconModelControllerObservers)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v8 = self->_iconModelControllerObservers;
    self->_iconModelControllerObservers = v7;

    id v5 = v10;
    iconModelControllerObservers = self->_iconModelControllerObservers;
  }
  [(NSHashTable *)iconModelControllerObservers addObject:v5];
}

- (void)removeIconModelControllerObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBIconController.m", 7923, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_iconModelControllerObservers removeObject:v5];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
  {
    id v5 = [(SBIconController *)self model];
    id v6 = (id)[v4 appendObject:v5 withName:@"model"];
  }
  else
  {
    id v5 = [(SBIconController *)self homeScreenViewController];
    if ([v5 orientation] == 1)
    {
      id v7 = @"UIInterfaceOrientationPortrait";
    }
    else if ([v5 orientation] == 4)
    {
      id v7 = @"UIInterfaceOrientationLandscapeLeft";
    }
    else if ([v5 orientation] == 3)
    {
      id v7 = @"UIInterfaceOrientationLandscapeRight";
    }
    else if ([v5 orientation] == 2)
    {
      id v7 = @"UIInterfaceOrientationPortraitUpsideDown";
    }
    else
    {
      id v7 = 0;
    }
    id v8 = (id)[v4 appendObject:v7 withName:@"orientation"];
    uint64_t v9 = [(SBIconController *)self model];
    id v10 = (id)[v4 appendObject:v9 withName:@"model"];

    id v11 = [(SBIconController *)self _rootFolderController];
    id v12 = (id)[v4 appendObject:v11 withName:@"rootFolderController"];
  }
  return v4;
}

- (id)succinctDescription
{
  id v2 = [(SBIconController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)_addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v5, &location);
  id v3 = BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v3;
}

id __77__SBIconController__addStateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained[5] description];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_addStateCaptureHandlerForInterestingAppIconLocations
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v5, &location);
  id v3 = BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v3;
}

id __73__SBIconController__addStateCaptureHandlerForInterestingAppIconLocations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = [WeakRetained rootFolder];
    id v4 = [v3 indexPathForIconWithIdentifier:@"com.apple.AppStore"];
    id v5 = v4;
    if (v4)
    {
      id v6 = objc_msgSend(v4, "sb_iconPathDescription");
      [v2 setObject:v6 forKeyedSubscript:@"rdar://67699908"];
    }
    else
    {
      [v2 setObject:@"MISSING" forKeyedSubscript:@"rdar://67699908"];
    }
    id v7 = [WeakRetained applicationController];
    id v8 = [v7 applicationWithBundleIdentifier:@"com.apple.AppStore"];

    uint64_t v9 = NSNumber;
    id v10 = [WeakRetained applicationController];
    id v11 = [v10 restrictionController];
    id v12 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isApplicationIdentifierRestricted:", @"com.apple.AppStore"));
    [v2 setObject:v12 forKeyedSubscript:@"rdar://67699908 - restricted"];

    long long v13 = NSNumber;
    long long v14 = [v8 info];
    long long v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isRestricted"));
    [v2 setObject:v15 forKeyedSubscript:@"rdar://67699908 - info restricted"];

    unint64_t v16 = NSNumber;
    uint64_t v17 = [v8 info];
    long long v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isBlocked"));
    [v2 setObject:v18 forKeyedSubscript:@"rdar://67699908 - info blocked"];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)_addStateCaptureHandlerForRestrictions
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v5, &location);
  id v3 = BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
  return v3;
}

id __58__SBIconController__addStateCaptureHandlerForRestrictions__block_invoke(uint64_t a1)
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained policyAggregator];
    id v14 = 0;
    uint64_t v4 = [v3 allowsCapability:17 explanation:&v14];
    id v5 = (__CFString *)v14;
    v15[0] = @"hasRestrictedEnforcedLayout";
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "hasRestrictedEnforcedLayout"));
    v16[0] = v6;
    v15[1] = @"isUninstallingSystemAppsRestricted";
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isUninstallingSystemAppsRestricted"));
    v16[1] = v7;
    void v15[2] = @"allowsUninstall";
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "allowsUninstall"));
    v16[2] = v8;
    v15[3] = @"isEditingAllowed";
    uint64_t v9 = [NSNumber numberWithBool:v4];
    id v10 = (void *)v9;
    void v15[4] = @"editingAllowedExplanation";
    id v11 = @"<none>";
    if (v5) {
      id v11 = v5;
    }
    void v16[3] = v9;
    void v16[4] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_addStateCaptureHandlerForHomeScreenDefaults
{
  return (id)BSLogAddStateCaptureBlockWithTitle();
}

id __64__SBIconController__addStateCaptureHandlerForHomeScreenDefaults__block_invoke()
{
  id v0 = objc_opt_new();
  uint64_t v1 = +[SBDefaults localDefaults];
  id v2 = [v1 homeScreenDefaults];

  uint64_t v3 = [v2 shouldPrepareDefaultTodayList];
  uint64_t v4 = [NSNumber numberWithBool:v3];
  [v0 setObject:v4 forKeyedSubscript:@"shouldPrepareDefaultTodayList"];

  uint64_t v5 = [v2 shouldPrepareStackForDefaultTodayList];
  id v6 = [NSNumber numberWithBool:v5];
  [v0 setObject:v6 forKeyedSubscript:@"shouldPrepareStackForDefaultTodayList"];

  id v7 = [v2 overriddenScreenType];
  objc_msgSend(v0, "bs_setSafeObject:forKey:", v7, @"overriddenScreenType");
  uint64_t v8 = [v2 automaticallyAddsNewApplications];
  uint64_t v9 = [NSNumber numberWithBool:v8];
  [v0 setObject:v9 forKeyedSubscript:@"automaticallyAddsNewApplications"];

  uint64_t v10 = [v2 automaticallyAddsNewApplicationsExists];
  id v11 = [NSNumber numberWithBool:v10];
  [v0 setObject:v11 forKeyedSubscript:@"automaticallyAddsNewApplicationsExists"];

  uint64_t v12 = [v2 showsBadgesInAppLibrary];
  long long v13 = [NSNumber numberWithBool:v12];
  [v0 setObject:v13 forKeyedSubscript:@"showsBadgesInAppLibrary"];

  uint64_t v14 = [v2 showsHomeScreenSearchAffordance];
  long long v15 = [NSNumber numberWithBool:v14];
  [v0 setObject:v15 forKeyedSubscript:@"showsHomeScreenSearchAffordance"];

  uint64_t v16 = [v2 pagesHaveEverBeenHidden];
  uint64_t v17 = [NSNumber numberWithBool:v16];
  [v0 setObject:v17 forKeyedSubscript:@"pagesHaveEverBeenHidden"];

  uint64_t v18 = [v2 shouldShowLibraryEducationView];
  id v19 = [NSNumber numberWithBool:v18];
  [v0 setObject:v19 forKeyedSubscript:@"shouldShowLibraryEducationView"];

  long long v20 = [v2 iconUserInterfaceStyle];
  [v0 setObject:v20 forKeyedSubscript:@"iconUserInterfaceStyle"];

  return v0;
}

- (double)topOffset
{
  return self->topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->maxPresentationOffset = a3;
}

- (SBWallpaperIconStyleCoordinator)iconStyleCoordinator
{
  return self->_iconStyleCoordinator;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setTodayViewController:(id)a3
{
}

- (SBTodayViewController)coverSheetTodayViewController
{
  return self->_coverSheetTodayViewController;
}

- (void)setCoverSheetTodayViewController:(id)a3
{
}

- (SBHomeScreenSpotlightViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void)setSpotlightViewController:(id)a3
{
}

- (void)setSearchPresenter:(id)a3
{
}

- (void)setOverlayLibraryViewController:(id)a3
{
}

- (SBHIconRootViewProviding)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (BOOL)hasRestrictedEnforcedLayout
{
  return self->_hasRestrictedEnforcedLayout;
}

- (void)setHasRestrictedEnforcedLayout:(BOOL)a3
{
  self->_hasRestrictedEnforcedLayout = a3;
}

- (BOOL)isUninstallingSystemAppsRestricted
{
  return self->_uninstallingSystemAppsRestricted;
}

- (void)setUninstallingSystemAppsRestricted:(BOOL)a3
{
  self->_uninstallingSystemAppsRestricted = a3;
}

- (NSTimer)popoverDelayTimer
{
  return self->_popoverDelayTimer;
}

- (void)setPopoverDelayTimer:(id)a3
{
}

- (SBRootFolderPageTransition)interactivePullToTodaySearchTransition
{
  return self->_interactivePullToTodaySearchTransition;
}

- (void)setInteractivePullToTodaySearchTransition:(id)a3
{
}

- (PTSingleTestRecipe)relayoutTestRecipe
{
  return self->_relayoutTestRecipe;
}

- (PTSingleTestRecipe)toggleSearchTestRecipe
{
  return self->_toggleSearchTestRecipe;
}

- (PTSingleTestRecipe)runDownloadingIconTestRecipe
{
  return self->_runDownloadingIconTestRecipe;
}

- (PTSingleTestRecipe)runRemoveAndRestoreIconTestRecipe
{
  return self->_runRemoveAndRestoreIconTestRecipe;
}

- (PTSingleTestRecipe)organizeInFoldersTestRecipe
{
  return self->_organizeInFoldersTestRecipe;
}

- (PTDoubleTestRecipe)shuffleStackTestRecipe
{
  return self->_shuffleStackTestRecipe;
}

- (PTSingleTestRecipe)runWidgetDiscoverabilityTestRecipe
{
  return self->_runWidgetDiscoverabilityTestRecipe;
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (void)setKeepTodayViewIconImagesStaticAssertion:(id)a3
{
}

- (BSInvalidatable)suspendWallpaperAnimationForSpotlightAssertion
{
  return self->_suspendWallpaperAnimationForSpotlightAssertion;
}

- (void)setSuspendWallpaperAnimationForSpotlightAssertion:(id)a3
{
}

- (SBProactiveHomeScreenUsageObserver)proactiveUsageObserver
{
  return self->_proactiveUsageObserver;
}

- (void)setProactiveUsageObserver:(id)a3
{
}

- (SBProactiveHomeScreenSuggestionProvider)proactiveSuggestionProvider
{
  return self->_proactiveSuggestionProvider;
}

- (void)setProactiveSuggestionProvider:(id)a3
{
}

- (SBTipsHomeScreenUsageObserver)tipsUsageObserver
{
  return self->_tipsUsageObserver;
}

- (void)setTipsUsageObserver:(id)a3
{
}

- (OS_dispatch_queue)accountStoreQueue
{
  return self->_accountStoreQueue;
}

- (SBBarSwipeAffordanceViewController)widgetAddSheetAffordanceViewController
{
  return self->_widgetAddSheetAffordanceViewController;
}

- (void)setWidgetAddSheetAffordanceViewController:(id)a3
{
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
}

- (DNDModeConfigurationService)dndModeConfigurationService
{
  return self->_dndModeConfigurationService;
}

- (void)setDndModeConfigurationService:(id)a3
{
}

- (NSArray)suggestedOnboardingStack
{
  return self->_suggestedOnboardingStack;
}

- (int64_t)userIconStateFileStatus
{
  return self->_userIconStateFileStatus;
}

- (void)setUserIconStateFileStatus:(int64_t)a3
{
  self->_userIconStateFileStatus = a3;
}

- (NSHashTable)floatingDockControllerObservers
{
  return self->_floatingDockControllerObservers;
}

- (void)setFloatingDockControllerObservers:(id)a3
{
}

- (NSSet)floatingDockBehaviorAssertions
{
  return self->_floatingDockBehaviorAssertions;
}

- (void)setFloatingDockBehaviorAssertions:(id)a3
{
}

- (SBSpotlightPresentableViewController)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (void)setSearchPresentableViewController:(id)a3
{
}

- (SBRootFolderPageTransition)searchPresenterPageStateTransition
{
  return self->_searchPresenterPageStateTransition;
}

- (void)setSearchPresenterPageStateTransition:(id)a3
{
}

- (int64_t)searchPresenterDestinationPageState
{
  return self->_searchPresenterDestinationPageState;
}

- (void)setSearchPresenterDestinationPageState:(int64_t)a3
{
  self->_searchPresenterDestinationPageState = a3;
}

- (unint64_t)searchPresenterOutstandingAnimationCount
{
  return self->_searchPresenterOutstandingAnimationCount;
}

- (void)setSearchPresenterOutstandingAnimationCount:(unint64_t)a3
{
  self->_searchPresenterOutstandingAnimationCount = a3;
}

- (SBHLegibility)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (void)setScrollAccessoryAuxiliaryView:(id)a3
{
}

- (BSInvalidatable)scrollAccessoryBorrowedForSearchPresentationAssertion
{
  return self->_scrollAccessoryBorrowedForSearchPresentationAssertion;
}

- (void)setScrollAccessoryBorrowedForSearchPresentationAssertion:(id)a3
{
}

- (BSInvalidatable)addWidgetSheetKeyboardFocusAssertion
{
  return self->_addWidgetSheetKeyboardFocusAssertion;
}

- (void)setAddWidgetSheetKeyboardFocusAssertion:(id)a3
{
}

- (SBIconListLayoutProvider)ambientListLayoutProvider
{
  return self->_ambientListLayoutProvider;
}

- (void)setAmbientListLayoutProvider:(id)a3
{
}

- (SBHWidgetMetricsProvider)ambientWidgetMetricsProvider
{
  return self->_ambientWidgetMetricsProvider;
}

- (void)setAmbientWidgetMetricsProvider:(id)a3
{
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (BSInvalidatable)todayViewDisplayLayoutAssertion
{
  return self->_todayViewDisplayLayoutAssertion;
}

- (void)setTodayViewDisplayLayoutAssertion:(id)a3
{
}

- (NSMutableArray)hiddenAppBundleIdentifiers
{
  return self->_hiddenAppBundleIdentifiers;
}

- (void)setHiddenAppBundleIdentifiers:(id)a3
{
}

- (SBAnalyticsEventsControllerForIconController)analyticsEventsController
{
  return self->_analyticsEventsController;
}

- (void)setAnalyticsEventsController:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (void)setHomeScreenOverlayController:(id)a3
{
}

- (BOOL)_ignoreMutatingIconListsOnApplicationInstall
{
  return self->__ignoreMutatingIconListsOnApplicationInstall;
}

- (void)_setIgnoreMutatingIconListsOnApplicationInstall:(BOOL)a3
{
  self->__ignoreMutatingIconListsOnApplicationInstall = a3;
}

- (int64_t)currentIconListIndex
{
  return self->_currentIconListIndex;
}

- (NSSet)appIconForceTouchWindows
{
  return self->_appIconForceTouchWindows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconForceTouchWindows, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayController, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_analyticsEventsController, 0);
  objc_storeStrong((id *)&self->_hiddenAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_todayViewDisplayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_ambientWidgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_ambientListLayoutProvider, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedForSearchPresentationAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_searchPresenterPageStateTransition, 0);
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertions, 0);
  objc_storeStrong((id *)&self->_floatingDockControllerObservers, 0);
  objc_storeStrong((id *)&self->_suggestedOnboardingStack, 0);
  objc_storeStrong((id *)&self->_dndModeConfigurationService, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_accountStoreQueue, 0);
  objc_storeStrong((id *)&self->_tipsUsageObserver, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionProvider, 0);
  objc_storeStrong((id *)&self->_proactiveUsageObserver, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForOverlayViewAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForSpotlightAssertion, 0);
  objc_storeStrong((id *)&self->_keepTodayViewIconImagesStaticAssertion, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_runWidgetDiscoverabilityTestRecipe, 0);
  objc_storeStrong((id *)&self->_shuffleStackTestRecipe, 0);
  objc_storeStrong((id *)&self->_organizeInFoldersTestRecipe, 0);
  objc_storeStrong((id *)&self->_runRemoveAndRestoreIconTestRecipe, 0);
  objc_storeStrong((id *)&self->_runDownloadingIconTestRecipe, 0);
  objc_storeStrong((id *)&self->_toggleSearchTestRecipe, 0);
  objc_storeStrong((id *)&self->_relayoutTestRecipe, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransition, 0);
  objc_storeStrong((id *)&self->_interactivePullToTodaySearchTransition, 0);
  objc_storeStrong((id *)&self->_popoverDelayTimer, 0);
  objc_storeStrong((id *)&self->_delayedLaunchRequestTimer, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_destroyWeak((id *)&self->_mainDisplayWindowScene);
  objc_storeStrong((id *)&self->_overlayLibraryViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetTodayViewController, 0);
  objc_storeStrong((id *)&self->_todayViewController, 0);
  objc_storeStrong((id *)&self->_leftOfHomeAppViewController, 0);
  objc_storeStrong((id *)&self->_homeScreenViewController, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_widgetMetricsServer, 0);
  objc_storeStrong((id *)&self->_iconStyleCoordinator, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandleForRestrictions, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandleForInterestingAppIconLocations, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandleForHomeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandlerForKeyDisplayIDsWithBadgingEnabled, 0);
  objc_storeStrong((id *)&self->_iconVisibilityService, 0);
  objc_storeStrong((id *)&self->_iconStyleObservers, 0);
  objc_storeStrong((id *)&self->_iconModelControllerObservers, 0);
  objc_storeStrong((id *)&self->_windowSceneToMedusaDragWindowContext, 0);
  objc_storeStrong((id *)&self->_iconsOccludedAssertions, 0);
  objc_storeStrong((id *)&self->_iconDragSessionBeginDate, 0);
  objc_storeStrong((id *)&self->_powerLogAggregator, 0);
  objc_storeStrong((id *)&self->_widgetEditingLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_folderDisplayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_outstandingSnapshotProviders, 0);
  objc_storeStrong((id *)&self->_screenSnapshotForIconViews, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayInitialPresentationProgress, 0);
  objc_storeStrong((id *)&self->_filesWidgetExtensionProviders, 0);
  objc_storeStrong((id *)&self->_spotlightInteractiveGestureTransaction, 0);
  objc_storeStrong((id *)&self->_tapToEndEditingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressToEditGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_libraryViewControllersActivatingSpotlightAppService, 0);
  objc_storeStrong((id *)&self->_categoryMapProvider, 0);
  objc_storeStrong((id *)&self->_temporaryWidgetIntents, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForFolderAssertions, 0);
  objc_storeStrong((id *)&self->_delayedStyleWallpaperEffectViews, 0);
  objc_storeStrong((id *)&self->_notificationIconImageCache, 0);
  objc_storeStrong((id *)&self->_tableUIIconImageCache, 0);
  objc_storeStrong((id *)&self->_appSwitcherHeaderIconImageCache, 0);
  objc_storeStrong((id *)&self->_duckWallpaperDimmingAssertion, 0);
  objc_storeStrong((id *)&self->_colorPickerInterfactionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_modalInteractionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_deviceOrientationUpdateDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_iconTouchesFinishedBlocks, 0);
  objc_storeStrong((id *)&self->_queryableFolderMetric, 0);
  objc_storeStrong((id *)&self->_transitionEventQueue, 0);
  objc_storeStrong((id *)&self->_currentTransitionRequest, 0);
  objc_storeStrong((id *)&self->_indexPathToResetTo, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_override_widgetMetricsServer, 0);
  objc_storeStrong((id *)&self->_override_userInterfaceController, 0);
  objc_storeStrong((id *)&self->_override_policyAggregator, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_layoutStateProvider, 0);
  objc_storeStrong((id *)&self->_override_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_override_assistantController, 0);
  objc_storeStrong((id *)&self->_override_applicationPlaceholderController, 0);
  objc_storeStrong((id *)&self->_override_applicationController, 0);
  objc_storeStrong((id *)&self->_override_analyticsClient, 0);
  objc_storeStrong((id *)&self->_override_alertItemsController, 0);
  objc_storeStrong((id *)&self->_displayIDsWithBadgingEnabled, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_hiddenTags, 0);
  objc_storeStrong((id *)&self->_visibleTags, 0);
}

- (id)_createTestFolder
{
  return [(SBIconController *)self _createTestFolderWithOverrideIconList:0];
}

- (id)_createTestFolderWithOverrideIconList:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBIconController *)self rootFolder];
  id v6 = [v5 allIcons];

  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ((!v4 || [v4 containsObject:*(void *)(*((void *)&v33 + 1) + 8 * i)])
          && [v13 isApplicationIcon])
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    uint64_t v14 = [(SBIconController *)self model];
    uint64_t v28 = self;
    long long v15 = [(SBIconController *)self rootFolder];
    id v27 = v14;
    uint64_t v16 = [v14 makeFolderWithDisplayName:@"TEST FOLDER"];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FA61D8]) initWithFolder:v16];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          [v15 removeIcon:*(void *)(*((void *)&v29 + 1) + 8 * j) options:0];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    id v23 = (id)[v16 addIcons:v18];
    id v24 = (id)[v15 addIcon:v17];

    self = v28;
  }
  else
  {
    uint64_t v16 = 0;
  }
  long long v25 = [(SBIconController *)self iconManager];
  [v25 layoutIconListsWithAnimationType:-1 forceRelayout:1];

  return v16;
}

- (BOOL)_ppt_pushHomeScreenStateWithError:(id *)a3
{
  id v4 = [(SBIconController *)self _ppt_prepareTransientIconModelStoreWithError:a3];
  if (v4)
  {
    uint64_t v5 = (void *)__ppt_homeScreenStateStack;
    if (!__ppt_homeScreenStateStack)
    {
      uint64_t v6 = objc_opt_new();
      id v7 = (void *)__ppt_homeScreenStateStack;
      __ppt_homeScreenStateStacuint64_t k = v6;

      uint64_t v5 = (void *)__ppt_homeScreenStateStack;
    }
    [v5 addObject:v4];
    id v8 = [(SBIconController *)self model];
    [v8 setStore:v4];

    uint64_t v9 = [(SBIconController *)self iconManager];
    [v9 relayout];
  }
  return v4 != 0;
}

- (void)_ppt_popHomeScreenState
{
  if (__ppt_homeScreenStateStack)
  {
    uint64_t v3 = [(SBIconController *)self model];
    id v17 = [v3 store];

    [(id)__ppt_homeScreenStateStack removeLastObject];
    id v4 = [(id)__ppt_homeScreenStateStack lastObject];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = +[SBDefaultIconModelStore sharedInstance];
    }
    id v7 = v6;

    if (![(id)__ppt_homeScreenStateStack count])
    {
      id v8 = (void *)__ppt_homeScreenStateStack;
      __ppt_homeScreenStateStacuint64_t k = 0;
    }
    uint64_t v9 = [(SBIconController *)self model];
    [v9 setStore:v7];

    uint64_t v10 = [(SBIconController *)self iconManager];
    [v10 relayout];

    uint64_t v11 = self;
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v17;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      uint64_t v14 = [v13 currentIconStateURL];
      long long v15 = [v14 URLByDeletingLastPathComponent];

      uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 removeItemAtURL:v15 error:0];
    }
  }
}

- (id)_ppt_prepareTransientIconModelStoreWithError:(id *)a3
{
  id v4 = [(SBIconController *)self model];
  [v4 saveIconStateIfNeeded];
  uint64_t v5 = [v4 store];
  if (!v5)
  {
    uint64_t v10 = 0;
    goto LABEL_26;
  }
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = 0;
  if (isKindOfClass)
  {
    uint64_t v11 = [v5 currentIconStateURL];
    uint64_t v12 = [v5 desiredIconStateURL];
    id v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];

    long long v15 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v16 = NSTemporaryDirectory();
    id v17 = [v15 fileURLWithPath:v16];
    long long v34 = (void *)v14;
    id v18 = [v17 URLByAppendingPathComponent:v14];

    uint64_t v19 = [v11 lastPathComponent];
    uint64_t v20 = [v18 URLByAppendingPathComponent:v19];

    long long v36 = v12;
    uint64_t v21 = [v12 lastPathComponent];
    uint64_t v38 = [v18 URLByAppendingPathComponent:v21];

    uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v41 = 0;
    [v22 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v41];
    id v23 = v41;
    id v24 = v23;
    id v35 = v9;
    uint64_t v37 = (void *)v20;
    if (v23)
    {
      if (a3)
      {
        id v25 = v23;
        id v26 = 0;
        id v27 = 0;
        uint64_t v10 = 0;
        *a3 = v25;
      }
      else
      {
        id v26 = 0;
        id v27 = 0;
        uint64_t v10 = 0;
      }
      long long v29 = v36;
      long long v30 = v11;
      goto LABEL_24;
    }
    id v40 = 0;
    [v22 copyItemAtURL:v11 toURL:v20 error:&v40];
    id v28 = v40;
    if (v28)
    {
      id v26 = v28;
      if (a3)
      {
        id v26 = v28;
        id v27 = 0;
        uint64_t v10 = 0;
        *a3 = v26;
LABEL_22:
        long long v29 = v36;
        goto LABEL_23;
      }
      id v27 = 0;
    }
    else
    {
      long long v31 = [v36 path];
      int v32 = [v22 fileExistsAtPath:v31];

      if (!v32
        || (v39 = 0, [v22 copyItemAtURL:v36 toURL:v38 error:&v39], (id v27 = v39) == 0))
      {
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FA6420]) initWithIconStateURL:v37 desiredIconStateURL:v38];
        id v26 = 0;
        id v27 = 0;
        long long v29 = v36;
LABEL_23:
        long long v30 = v11;
LABEL_24:

        id v9 = v35;
        goto LABEL_25;
      }
      if (a3)
      {
        id v27 = v27;
        id v26 = 0;
        uint64_t v10 = 0;
        *a3 = v27;
        goto LABEL_22;
      }
      id v26 = 0;
    }
    uint64_t v10 = 0;
    goto LABEL_22;
  }
LABEL_25:

LABEL_26:
  return v10;
}

- (void)_runTest:(id)a3 afterMovingIconsIntoFolder:(id)a4 withFolderOpen:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if ([(SBIconController *)self _ppt_pushHomeScreenStateWithError:0])
  {
    uint64_t v11 = (void *)[v10 mutableCopy];
    uint64_t v12 = [(SBIconController *)self _createTestFolderWithOverrideIconList:v11];

    if (v12)
    {
      id v13 = [v12 icon];
      if (v5)
      {
        uint64_t v14 = [(SBIconController *)self iconManager];
        [v14 scrollToIconListContainingIcon:v13 animate:0];
      }
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke;
      void v18[3] = &unk_1E6AF69D0;
      BOOL v22 = v5;
      id v19 = v13;
      uint64_t v20 = self;
      id v21 = v9;
      id v16 = v13;
      dispatch_after(v15, MEMORY[0x1E4F14428], v18);
    }
    else
    {
      [(SBIconController *)self _failCurrentTestWithMessage:@"Unable to create test folder"];
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBIconController-Folders.m" lineNumber:204 description:@"Unable to swap out icon model store; cannot run test."];
  }
}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) launchFromLocation:*MEMORY[0x1E4FA66D0] context:0];
  }
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_2;
  block[3] = &unk_1E6AFCF18;
  char v6 = *(unsigned char *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_3;
  v4[3] = &unk_1E6AF5D38;
  char v5 = *(unsigned char *)(a1 + 48);
  void v4[4] = *(void *)(a1 + 32);
  dispatch_time_t v2 = (void (**)(void))MEMORY[0x1D948C7A0](v4);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void (**)(void)))(v3 + 16))(v3, v2);
  }
  else {
    v2[2](v2);
  }
}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_4;
  v3[3] = &unk_1E6AF5D38;
  char v4 = *(unsigned char *)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
}

void __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    char v4 = [v3 iconManager];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_5;
    v5[3] = &unk_1E6AF5350;
    v5[4] = *(void *)(a1 + 32);
    [v4 popExpandedIconAnimated:1 completionHandler:v5];
  }
  else
  {
    objc_msgSend(v3, "_ppt_popHomeScreenState");
  }
}

uint64_t __80__SBIconController_Folders___runTest_afterMovingIconsIntoFolder_withFolderOpen___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runFolderOpenTest
{
  if ([(SBIconController *)self _ppt_pushHomeScreenStateWithError:0])
  {
    char v4 = [(SBIconController *)self _createTestFolder];
    char v5 = v4;
    if (v4)
    {
      char v6 = [v4 icon];
      id v7 = [(SBIconController *)self iconManager];
      [v7 scrollToIconListContainingIcon:v6 animate:0];

      dispatch_time_t v8 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke;
      block[3] = &unk_1E6AF5290;
      id v12 = v6;
      id v13 = self;
      id v9 = v6;
      dispatch_after(v8, MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(SBIconController *)self _failCurrentTestWithMessage:@"Unable to create test folder"];
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBIconController-Folders.m" lineNumber:248 description:@"Unable to swap out icon model store; cannot run test."];
  }
}

uint64_t __47__SBIconController_Folders___runFolderOpenTest__block_invoke(uint64_t a1)
{
  int v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:@"FolderOpen"];
  [*v2 startedSubTest:@"delay" forTest:@"FolderOpen"];
  [*v2 startedSubTest:@"openAnimation" forTest:@"FolderOpen"];
  [*(id *)(a1 + 32) launchFromLocation:*MEMORY[0x1E4FA66D0] context:0];
  [*v2 finishedSubTest:@"delay" forTest:@"FolderOpen"];
  [*v2 startedSubTest:@"commitDelay" forTest:@"FolderOpen"];
  id v3 = *v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke_2;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = *(void *)(a1 + 40);
  return [v3 _performBlockAfterCATransactionCommits:v5];
}

void __47__SBIconController_Folders___runFolderOpenTest__block_invoke_2(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"commitDelay" forTest:@"FolderOpen"];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __47__SBIconController_Folders___runFolderOpenTest__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) iconManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SBIconController_Folders___runFolderOpenTest__block_invoke_4;
  v3[3] = &unk_1E6AF5350;
  void v3[4] = *(void *)(a1 + 32);
  [v2 popExpandedIconAnimated:1 completionHandler:v3];
}

uint64_t __47__SBIconController_Folders___runFolderOpenTest__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runFolderCloseTest
{
  if ([(SBIconController *)self _ppt_pushHomeScreenStateWithError:0])
  {
    char v4 = [(SBIconController *)self _createTestFolder];
    char v5 = v4;
    if (v4)
    {
      char v6 = [v4 icon];
      id v7 = [(SBIconController *)self iconManager];
      [v7 scrollToIconListContainingIcon:v6 animate:0];

      dispatch_time_t v8 = [(SBIconController *)self iconManager];
      uint64_t v9 = *MEMORY[0x1E4FA66D0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__SBIconController_Folders___runFolderCloseTest__block_invoke;
      v11[3] = &unk_1E6AF5350;
      void v11[4] = self;
      [v8 openFolderIcon:v6 location:v9 animated:0 withCompletion:v11];
    }
    else
    {
      [(SBIconController *)self _failCurrentTestWithMessage:@"Unable to create test folder"];
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBIconController-Folders.m" lineNumber:284 description:@"Unable to swap out icon model store; cannot run test."];
  }
}

void __48__SBIconController_Folders___runFolderCloseTest__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBIconController_Folders___runFolderCloseTest__block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __48__SBIconController_Folders___runFolderCloseTest__block_invoke_2(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] startedTest:@"FolderClose"];
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  dispatch_time_t v2 = [*(id *)(a1 + 32) iconManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__SBIconController_Folders___runFolderCloseTest__block_invoke_3;
  v3[3] = &unk_1E6AF5350;
  void v3[4] = *(void *)(a1 + 32);
  [v2 popExpandedIconAnimated:1 completionHandler:v3];
}

uint64_t __48__SBIconController_Folders___runFolderCloseTest__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runFolderTestWithName:(id)a3 actions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(SBIconController *)self _ppt_pushHomeScreenStateWithError:0])
  {
    uint64_t v9 = [(SBIconController *)self _createTestFolder];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 icon];
      id v12 = [(SBIconController *)self iconManager];
      [v12 scrollToIconListContainingIcon:v11 animate:0];

      [v11 launchFromLocation:*MEMORY[0x1E4FA66D0] context:0];
      dispatch_time_t v13 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke;
      block[3] = &unk_1E6AFCAC8;
      id v16 = v7;
      id v17 = self;
      id v18 = v8;
      dispatch_after(v13, MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(id)*MEMORY[0x1E4F43630] failedTest:v7 withFailure:@"Unable to create test folder"];
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBIconController-Folders.m", 310, @"Unable to swap out icon model store; cannot run test %@",
      v7);
  }
}

uint64_t __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke(void *a1)
{
  [(id)*MEMORY[0x1E4F43630] startedTest:a1[4]];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  char v6 = __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke_2;
  id v7 = &unk_1E6AF4AC0;
  uint64_t v2 = a1[6];
  uint64_t v8 = a1[5];
  return (*(uint64_t (**)(void))(v2 + 16))();
}

uint64_t __60__SBIconController_Folders___runFolderTestWithName_actions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runScrollFolderTest:(int64_t)a3
{
  if ([(SBIconController *)self _ppt_pushHomeScreenStateWithError:0])
  {
    char v6 = [(SBIconController *)self _createTestFolder];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 icon];
      uint64_t v9 = [(SBIconController *)self iconManager];
      [v9 scrollToIconListContainingIcon:v8 animate:0];

      [v8 launchFromLocation:*MEMORY[0x1E4FA66D0] context:0];
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__SBIconController_Folders___runScrollFolderTest___block_invoke;
      block[3] = &unk_1E6AF4A70;
      void block[4] = self;
      void block[5] = a3;
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBIconController-Folders.m" lineNumber:336 description:@"Unable to swap out icon model store; cannot run test."];
  }
}

void __50__SBIconController_Folders___runScrollFolderTest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _openFolderController];
  [v2 layoutIconListsWithAnimationType:0 forceRelayout:1];
  objc_msgSend(v2, "setCurrentPageIndex:animated:", objc_msgSend(v2, "defaultPageIndex"), 0);
  [(id)*MEMORY[0x1E4F43630] startedTest:@"ScrollFolder"];
  uint64_t v3 = *(void *)(a1 + 40) + [v2 minimumPageIndex];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SBIconController_Folders___runScrollFolderTest___block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  void v4[4] = *(void *)(a1 + 32);
  [v2 setCurrentPageIndex:v3 animated:1 completion:v4];
}

void __50__SBIconController_Folders___runScrollFolderTest___block_invoke_2(uint64_t a1)
{
  [(id)*MEMORY[0x1E4F43630] finishedTest:@"ScrollFolder"];
  uint64_t v2 = [*(id *)(a1 + 32) iconManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__SBIconController_Folders___runScrollFolderTest___block_invoke_3;
  v3[3] = &unk_1E6AF5350;
  void v3[4] = *(void *)(a1 + 32);
  [v2 popExpandedIconAnimated:1 completionHandler:v3];
}

uint64_t __50__SBIconController_Folders___runScrollFolderTest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_popHomeScreenState");
}

- (void)_runAppIconForceTouchTest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"testApplication"];
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x3032000000;
  long long v47 = __Block_byref_object_copy__48;
  long long v48 = __Block_byref_object_dispose__48;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__48;
  long long v42 = __Block_byref_object_dispose__48;
  id v43 = (id)*MEMORY[0x1E4FA66D0];
  if (v8)
  {
    uint64_t v9 = [(SBIconController *)self rootFolder];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke;
    v33[3] = &unk_1E6B010A0;
    long long v36 = &v44;
    uint64_t v37 = &v38;
    id v34 = v8;
    id v35 = self;
    [v9 enumerateAllIconsUsingBlock:v33];
  }
  if (!v45[5]) {
    goto LABEL_7;
  }
  dispatch_time_t v10 = [(SBIconController *)self iconManager];
  id v11 = [v10 iconViewForIcon:v45[5] location:v39[5]];

  if (v11
    || ([(SBIconController *)self iconManager],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 iconViewForIcon:v45[5] location:*MEMORY[0x1E4FA6688]],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11))
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_2;
    v30[3] = &unk_1E6AF5290;
    id v13 = v6;
    id v31 = v13;
    id v14 = v11;
    id v32 = v14;
    dispatch_time_t v15 = (void *)MEMORY[0x1D948C7A0](v30);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_8;
    v27[3] = &unk_1E6AF5290;
    id v16 = v13;
    id v28 = v16;
    id v17 = v14;
    id v29 = v17;
    id v18 = (void *)MEMORY[0x1D948C7A0](v27);
    id v19 = [(SBIconController *)self iconManager];
    [v19 scrollToIconListContainingIcon:v45[5] animate:0];

    dispatch_time_t v20 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_14;
    block[3] = &unk_1E6AF6BF8;
    id v24 = v16;
    id v25 = v15;
    id v26 = v18;
    id v21 = v18;
    id v22 = v15;
    dispatch_after(v20, MEMORY[0x1E4F14428], block);
  }
  else
  {
LABEL_7:
    [(id)*MEMORY[0x1E4F43630] failedTest:v6];
  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v8 = a3;
  if ([v14 isLeafIcon])
  {
    uint64_t v9 = [v14 applicationBundleID];
    int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      id v11 = [*(id *)(a1 + 40) rootFolder];
      int v12 = [v11 isIconAtIndexPathInDock:v8];
      id v13 = (id *)MEMORY[0x1E4FA6688];
      if (!v12) {
        id v13 = (id *)MEMORY[0x1E4FA66D0];
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *v13);

      *a4 = 1;
    }
  }
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"Delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint8_t v14[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_3;
  void v14[3] = &unk_1E6AF4AC0;
  id v15 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v14];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)MEMORY[0x1E4F94818];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_4;
  v12[3] = &unk_1E6AF66C0;
  id v13 = *(id *)(a1 + 40);
  id v6 = [v5 eventStreamWithEventActions:v12];
  id v7 = (void *)MEMORY[0x1E4F94808];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_5;
  v9[3] = &unk_1E6AF5290;
  id v10 = *(id *)(a1 + 32);
  id v11 = v4;
  id v8 = v4;
  [v7 playEventStream:v6 options:v8 completion:v9];
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"Delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"Animation" forTest:v4];
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v24 = a2;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int v12 = [*(id *)(a1 + 32) window];
  id v13 = [v12 screen];
  id v14 = [v13 fixedCoordinateSpace];
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v26.origin.double x = v16;
  v26.origin.double y = v18;
  v26.size.double width = v20;
  v26.size.double height = v22;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = v16;
  v27.origin.double y = v18;
  v27.size.double width = v20;
  v27.size.double height = v22;
  objc_msgSend(v24, "touchDown:", MidX, CGRectGetMidY(v27));
  [v24 advanceTime:3.0];
  [v24 liftUpAtAllActivePoints];
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F43630];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_6;
  v6[3] = &unk_1E6AF4AC0;
  id v7 = *(id *)(a1 + 32);
  [v2 installCACommitCompletionBlock:v6];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_7;
  v4[3] = &unk_1E6AF4AC0;
  id v5 = *(id *)(a1 + 40);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"Animation" forTest:*(void *)(a1 + 32)];
  dispatch_time_t v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 finishedTest:v4];
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_7(uint64_t a1)
{
  return [MEMORY[0x1E4F94808] playCommandString:@"b h" options:*(void *)(a1 + 32) completion:0];
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] startedTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"Delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  uint8_t v14[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_9;
  void v14[3] = &unk_1E6AF4AC0;
  id v15 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v14];
  uint64_t v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x1E4F94818];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_10;
  v12[3] = &unk_1E6AF66C0;
  id v13 = *(id *)(a1 + 40);
  double v6 = [v5 eventStreamWithEventActions:v12];
  id v7 = (void *)MEMORY[0x1E4F94808];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_11;
  v9[3] = &unk_1E6AF5290;
  id v10 = v4;
  id v11 = *(id *)(a1 + 32);
  id v8 = v4;
  [v7 playEventStream:v6 options:v8 completion:v9];
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"Delay" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"Animation" forTest:v4];
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v24 = a2;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int v12 = [*(id *)(a1 + 32) window];
  id v13 = [v12 screen];
  id v14 = [v13 fixedCoordinateSpace];
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v26.origin.double x = v16;
  v26.origin.double y = v18;
  v26.size.double width = v20;
  v26.size.double height = v22;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = v16;
  v27.origin.double y = v18;
  v27.size.double width = v20;
  v27.size.double height = v22;
  objc_msgSend(v24, "touchDown:", MidX, CGRectGetMidY(v27));
  [v24 advanceTime:3.0];
  [v24 liftUpAtAllActivePoints];
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_11(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_12;
  v3[3] = &unk_1E6AF5290;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
}

void __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_12(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F94808];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_13;
  v3[3] = &unk_1E6AF4AC0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v1 playCommandString:@"b h" options:v2 completion:v3];
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"Animation" forTest:*(void *)(a1 + 32)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 finishedTest:v4];
}

uint64_t __67__SBIconController_Folders___runAppIconForceTouchTest_withOptions___block_invoke_14(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"AppIconForceTouchPresent"] & 1) != 0
    || [*(id *)(a1 + 32) isEqualToString:@"AppIconForceTouchPresentInDock"])
  {
    uint64_t v2 = a1 + 40;
  }
  else
  {
    if (([*(id *)(a1 + 32) isEqualToString:@"AppIconForceTouchDismiss"] & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"AppIconForceTouchDismissInDock"];
      if (!result) {
        return result;
      }
    }
    uint64_t v2 = a1 + 48;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)v2 + 16);
  return v4();
}

- (void)_failCurrentTestWithMessage:(id)a3
{
  id v3 = (void *)*MEMORY[0x1E4F43630];
  id v4 = a3;
  id v6 = +[SBApplicationTestingManager sharedInstance];
  id v5 = [v6 currentTestName];
  [v3 failedTest:v5 withFailure:v4];
}

void __59__SBIconController__updateUninstallingSystemAppsRestricted__block_invoke_cold_1(unsigned __int8 *a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Checking restriction for uninstalling system apps. Apple account restricted: %i, iTunes Store account restricted: %i", (uint8_t *)v4, 0xEu);
}

- (void)setModel:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_5();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Changing icon model from %@ to %@", v1, 0x16u);
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "Couldn't fetch default widget stack with error: %@", v4, v5, v6, v7, v8);
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "No medium default widget stack found", v1, 2u);
}

void __64__SBIconController__addSmartStackToTodayList_completionHandler___block_invoke_381_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "No icon data source for icon %{public}@", v2, v3, v4, v5, v6);
}

- (void)_appLibraryListLayoutProviderForWindowScene:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_FAULT, "attempting to construct a list layout provider with a nil windowScene!", v1, 2u);
}

void __82__SBIconController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
}

- (void)iconManager:(uint64_t)a1 viewControllerForCustomIcon:(NSObject *)a2 element:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  double v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Did not make a view controller for custom widget element: %@ (%{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error archiving Shortcuts folder widget intent: %@", v2, v3, v4, v5, v6);
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error archiving Shortcuts single widget intent: %@", v2, v3, v4, v5, v6);
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error archiving Files widget intent: %@", v2, v3, v4, v5, v6);
}

+ (void)_getApplicationDataStore:configurationKey:forDataSource:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "uniqueIdentifier for dataSource '%@' was nil", v2, v3, v4, v5, v6);
}

+ (void)_getApplicationDataStore:configurationKey:forDataSource:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "configurationStorageIdentifier for dataSource '%@' was nil", v2, v3, v4, v5, v6);
}

void __70__SBIconController_iconManager_configurationDataForDataSource_ofIcon___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Config data is accessible after first unlock.", v1, 2u);
}

- (void)modeConfigurationService:didReceiveAvailableModesUpdate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error fetching available DND modes: %@", v2, v3, v4, v5, v6);
}

@end