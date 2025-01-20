@interface SBHomeScreenController
- (BOOL)_allowsBadgingForApplicationBundleIdentifier:(id)a3;
- (BOOL)_controlCenterIsOnTheSameWindowScene;
- (BOOL)_dragSessionContainsAppClipWebClipIcon:(id)a3;
- (BOOL)_isCoplanarHomeScreenEnabled;
- (BOOL)_isHostedByCoverSheet;
- (BOOL)_shouldHideAppIconForceTouchInfoForApplication:(id)a3;
- (BOOL)_shouldTodayViewController:(id)a3 receiveTouch:(id)a4;
- (BOOL)allowsBadgingForIcon:(id)a3;
- (BOOL)allowsHomeScreenOverlay;
- (BOOL)allowsUninstall;
- (BOOL)appPredictionViewController:(id)a3 launchAppFromIcon:(id)a4;
- (BOOL)appPredictionViewController:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4;
- (BOOL)areAnyIconViewContextMenusAnimating;
- (BOOL)areAnyIconViewContextMenusShowing;
- (BOOL)areHomeScreenIconsOccluded;
- (BOOL)canAppPredictionsWidgetAlignWithGrid;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
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
- (BOOL)isAnySearchVisibleOrTransitioning;
- (BOOL)isAppLibraryAllowed;
- (BOOL)isAppLibrarySupported;
- (BOOL)isBackdropVisible;
- (BOOL)isEditingAllowedForIconManager:(id)a3;
- (BOOL)isEditingForHomeScreenOverlayController:(id)a3;
- (BOOL)isFloatingDockSupportedForIconManager:(id)a3;
- (BOOL)isFloatingDockVisibleForIconManager:(id)a3;
- (BOOL)isFocusAllowedForIconManager:(id)a3;
- (BOOL)isHideSuggestionSupportedForIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isHideSupportedForIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isHomeScreenWallpaperDimmedForIconManager:(id)a3;
- (BOOL)isIconContentPossiblyVisibleOverApplicationForIconManager:(id)a3;
- (BOOL)isIconListViewTornDown;
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
- (BOOL)listsAllowRotatedLayoutForIconManager:(id)a3;
- (BOOL)searchPresenterCanPresent:(id)a3;
- (BOOL)shouldCommandeerContentDragsInLocation:(id)a3;
- (BOOL)shouldUseHomeScreenLargeIconSizeForIconManager:(id)a3;
- (BOOL)shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:(id)a3;
- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:(id)a3;
- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayController:(id)a3;
- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3;
- (BSInvalidatable)addWidgetSheetKeyboardFocusAssertion;
- (BSInvalidatable)displayLayoutTransition;
- (BSInvalidatable)keepTodayViewIconImagesStaticAssertion;
- (BSInvalidatable)scrollAccessoryBorrowedForSearchPresentationAssertion;
- (BSInvalidatable)suspendWallpaperAnimationForOverlayViewAssertion;
- (BSInvalidatable)suspendWallpaperAnimationForSpotlightAssertion;
- (BSInvalidatable)todayViewDisplayLayoutAssertion;
- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4;
- (DNDStateService)dndStateService;
- (NSHashTable)floatingDockControllerObservers;
- (NSSet)appIconForceTouchWindows;
- (NSSet)floatingDockBehaviorAssertions;
- (NSString)description;
- (NSTimer)delayedLaunchRequestTimer;
- (SBBarSwipeAffordanceViewController)widgetAddSheetAffordanceViewController;
- (SBFolderController)_currentFolderController;
- (SBFolderController)_openFolderController;
- (SBHIconManager)iconManager;
- (SBHIconRootViewProviding)rootViewController;
- (SBHLegibility)scrollAccessoryAuxiliaryView;
- (SBHRootFolderSettings)rootFolderSettings;
- (SBHSearchPresenting)searchPresenter;
- (SBHomeScreenController)initWithWindowScene:(id)a3;
- (SBHomeScreenController)initWithWindowScene:(id)a3 alertItemsController:(id)a4 applicationController:(id)a5 applicationPlaceholderController:(id)a6 assistantController:(id)a7 coverSheetPresentationManager:(id)a8 lockScreenManager:(id)a9 mainDisplaySceneManager:(id)a10 policyAggregator:(id)a11 userInterfaceController:(id)a12;
- (SBHomeScreenOverlayController)homeScreenOverlayController;
- (SBHomeScreenSpotlightViewController)spotlightViewController;
- (SBHomeScreenViewController)homeScreenViewController;
- (SBHomeScreenWindow)homeScreenWindow;
- (SBIconModel)model;
- (SBLeftOfHomeAppViewController)leftOfHomeAppViewController;
- (SBLibraryViewController)overlayLibraryViewController;
- (SBProactiveHomeScreenUsageObserver)proactiveUsageObserver;
- (SBRootFolderController)_rootFolderController;
- (SBRootFolderPageTransition)interactivePullToTodaySearchTransition;
- (SBRootFolderPageTransition)searchPresenterPageStateTransition;
- (SBSpotlightPresentableViewController)searchPresentableViewController;
- (SBTipsHomeScreenUsageObserver)tipsUsageObserver;
- (SBTodayViewController)coverSheetTodayViewController;
- (SBTodayViewController)todayViewController;
- (SBUIController)userInterfaceController;
- (SBWindow)window;
- (SBWindowScene)windowScene;
- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3;
- (UIEdgeInsets)iconManager:(id)a3 contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a4;
- (UIEdgeInsets)iconManager:(id)a3 statusBarEdgeInsetsForFolderController:(id)a4;
- (UIView)containerView;
- (UIView)homeScreenContentView;
- (UIView)homeScreenScalingView;
- (_UILegibilitySettings)legibilitySettings;
- (double)distanceToTopOfSpotlightIconsForIconManager:(id)a3;
- (double)iconManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4;
- (double)maxPresentationOffset;
- (double)minimumHomeScreenScale;
- (double)searchTopOffsetForSearchPresenter:(id)a3;
- (double)topOffset;
- (id)_aggregateLoggingAppKeyForIcon:(id)a3;
- (id)_appLibraryListLayoutProviderForWindowScene:(id)a3;
- (id)_configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3;
- (id)_createHomeScreenOverlayControllerIfNeeded;
- (id)_currentMainDisplayLayoutState;
- (id)_focusModeFromDoNotDisturbState:(id)a3;
- (id)_homeScreenOverlayControllerIfNeeded;
- (id)_iconController;
- (id)_identifierForSearchPresenter;
- (id)_libraryViewControllers;
- (id)_newSearchPillBackgroundView;
- (id)_newTodayViewControllerWithIconManager:(id)a3 iconListModel:(id)a4 rootFolder:(id)a5 location:(int64_t)a6;
- (id)_setUpLibraryViewControllerForWindowScene:(id)a3;
- (id)additionalIconListLayoutObserversForAppPredictionViewController:(id)a3;
- (id)alertItemsController;
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
- (id)currentAnimationContainer;
- (id)currentIconImageAppearance;
- (id)currentIconImageStyleConfiguration;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayConfigurationForPresenter:(id)a3;
- (id)externalDisplaySceneManager;
- (id)fallbackDefaultFirstPageWidgetsForIconManager:(id)a3;
- (id)featureIntroductionItemForWidgetSetupAtLocation:(unint64_t)a3;
- (id)homeScreenOverlayController:(id)a3 displayLayoutIdentifierForSidebarViewController:(id)a4;
- (id)iconDragManager;
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
- (id)iconStylePickerConfigurationForIconManager:(id)a3;
- (id)launchActionsForIconView:(id)a3;
- (id)launchActivationSettingsForIconView:(id)a3;
- (id)launchURLForIconView:(id)a3;
- (id)libraryViewControllerForWindowScene:(id)a3;
- (id)localizedDefaultFolderNameForIconManager:(id)a3;
- (id)localizedFolderNameForDefaultDisplayName:(id)a3;
- (id)lockScreenManager;
- (id)mainDisplaySceneManager;
- (id)mainDisplayWindowScene;
- (id)markIconsOccludedForReason:(id)a3;
- (id)policyAggregator;
- (id)preferredFocusEnvironments;
- (id)recycledViewsContainerProviderForIconManager:(id)a3;
- (id)rootFolder;
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
- (id)widgetIntroductionPreviewViewForIconManager:(id)a3;
- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5;
- (id)windowForIconDragPreviewsForIconManager:(id)a3 forWindowScene:(id)a4;
- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5;
- (int64_t)iconManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5;
- (int64_t)iconManagerListsFixedIconLocationBehavior:(id)a3;
- (int64_t)interfaceOrientationForIconManager:(id)a3;
- (int64_t)searchPresenterDestinationPageState;
- (uint64_t)_disableEditingByDefaultDuringStaging;
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
- (void)_beginDisablingAllOrientationChangesForReason:(id)a3;
- (void)_closeOpenFolderIfNecessary;
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
- (void)_enumerateTodayViewControllers:(id)a3;
- (void)_forceTouchControllerWillPresent:(id)a3;
- (void)_handleEditingGesture:(id)a3;
- (void)_handleSearchAffordanceTap;
- (void)_hideKeyboard;
- (void)_iconForceTouchControllerDidDismiss:(id)a3;
- (void)_iconForceTouchControllerWillPresent:(id)a3;
- (void)_iconModelDidChange:(id)a3;
- (void)_launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5;
- (void)_launchWidgetIcon:(id)a3 fromLocation:(id)a4 withContext:(id)a5;
- (void)_lockScreenUIWillLock:(id)a3;
- (void)_mainSwitcherCreated:(id)a3;
- (void)_makeTodayViewControllers;
- (void)_policyAggregatorCapabilitiesDidChange:(id)a3;
- (void)_presentPageManagement:(id)a3;
- (void)_rebuildTodayViewControllers;
- (void)_reduceMotionStatusDidChange:(id)a3;
- (void)_removeReachabilityEffectViewIfNecessary;
- (void)_rootFolderDidChange;
- (void)_setFolderDisplayLayoutElementActive:(BOOL)a3;
- (void)_setWidgetEditingDisplayLayoutElementActive:(BOOL)a3;
- (void)_setupAppearanceControlling;
- (void)_setupHomeScreenContentBackdropView;
- (void)_setupHomeScreenDimmingWindow;
- (void)_setupOverlayLibraryViewController;
- (void)_showInfoAlertIfNeeded:(BOOL)a3;
- (void)_showsBadgesInAppLibraryDidChange;
- (void)_startSpotlightInteractiveGestureTransactionForGesture:(id)a3;
- (void)_switchToHomeScreenWallpaperAnimated:(BOOL)a3;
- (void)_teardownDeweyTestConfigurations;
- (void)_unlockAnimationDidFinish:(id)a3;
- (void)_updateFocusModeManagerWithDoNotDisturbState:(id)a3;
- (void)_updateLegibility;
- (void)_updateRequireWallpaperRasterization;
- (void)_updateVisibleIconsAfterOcclusionChange;
- (void)_willRevealOrHideContentView;
- (void)activateTodayViewWithCompletion:(id)a3;
- (void)addFloatingDockControllerObserver:(id)a3;
- (void)addIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4;
- (void)addIconToHomeScreen:(id)a3;
- (void)addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction;
- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)beginRequiringBackdropViewForReason:(id)a3;
- (void)beginRequiringContentForReason:(id)a3;
- (void)beginRequiringContentForReason:(id)a3 options:(unint64_t)a4;
- (void)beginRequiringLiveBackdropViewForReason:(id)a3;
- (void)cancelInProcessAnimations;
- (void)dealloc;
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
- (void)endRequiringBackdropViewForReason:(id)a3;
- (void)endRequiringContentForReason:(id)a3;
- (void)endRequiringLiveBackdropViewForReason:(id)a3;
- (void)enumerateTintableViewControllersUsingBlock:(id)a3;
- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5;
- (void)folderIconStateDidDirty:(id)a3;
- (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4;
- (void)handleDidEndReachabilityAnimation;
- (void)handleHomeButtonTap;
- (void)handleNavigationCommand:(id)a3 withDirection:(int64_t)a4;
- (void)handleSpotlightDismissalFromViewController:(id)a3;
- (void)handleSpotlightPresentationFromViewController:(id)a3;
- (void)handleWillBeginReachabilityAnimation;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)homeScreenBackdropView:(id)a3 opaquenessDidChange:(BOOL)a4;
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
- (void)iconModel:(id)a3 backupRestoringStatusDidChange:(BOOL)a4;
- (void)iconModel:(id)a3 wantsToRevealAnyApplicationFromIdentifiers:(id)a4;
- (void)iconModelDidImportIconState:(id)a3;
- (void)iconModelInstalledAppsDidChange:(id)a3;
- (void)iconStyleCoordinatorDidUpdate:(id)a3;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4;
- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4;
- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4;
- (void)libraryViewControllerDidDismiss:(id)a3;
- (void)libraryViewControllerRequestsDismissal:(id)a3;
- (void)libraryViewControllerWillPresent:(id)a3;
- (void)noteTransientOverlayPresented;
- (void)noteViewCovered;
- (void)notifyFloatingDockControllerObserversDidRegister:(id)a3;
- (void)obtainProactiveSecondPageWidgetSuggestion;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4;
- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3;
- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3;
- (void)popToCurrentRootIconListWhenPossible;
- (void)presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5;
- (void)presentLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentTodayOverlayForIconManager:(id)a3;
- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
- (void)removeFloatingDockControllerObserver:(id)a3;
- (void)removeHomeScreenTraitOverridesForViewController:(id)a3;
- (void)removeIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4;
- (void)removeIconsOccludedAssertion:(id)a3;
- (void)restoreContent;
- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3;
- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5;
- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)restoreContentWithOptions:(unint64_t)a3;
- (void)rootFolderController:(id)a3 transitionDidFinish:(id)a4;
- (void)rootFolderController:(id)a3 transitionWillBegin:(id)a4;
- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5;
- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6;
- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)searchBarDidFocus;
- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4;
- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4;
- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4;
- (void)searchPresenterDidDismissSearch:(id)a3;
- (void)searchPresenterDidPresentSearch:(id)a3;
- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4;
- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4;
- (void)setAddWidgetSheetKeyboardFocusAssertion:(id)a3;
- (void)setCoverSheetTodayViewController:(id)a3;
- (void)setDelayedLaunchRequestTimer:(id)a3;
- (void)setDisplayLayoutTransition:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setFloatingDockBehaviorAssertions:(id)a3;
- (void)setFloatingDockControllerObservers:(id)a3;
- (void)setHomeScreenAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenBackdropBlurMaterialRecipeName:(id)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenDimmingAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setHomeScreenOverlayController:(id)a3;
- (void)setHomeScreenScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5;
- (void)setIconOcclusionReasons:(unint64_t)a3;
- (void)setInteractivePullToTodaySearchTransition:(id)a3;
- (void)setKeepTodayViewIconImagesStaticAssertion:(id)a3;
- (void)setLeftOfHomeAppViewController:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaxPresentationOffset:(double)a3;
- (void)setModel:(id)a3;
- (void)setOverlayLibraryViewController:(id)a3;
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
- (void)setWallpaperAnimationDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setWidgetAddSheetAffordanceViewController:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)tearDownIconListAndBar;
- (void)todayViewControllerDidAppear:(id)a3;
- (void)todayViewControllerDidDisappear:(id)a3;
- (void)todayViewControllerWillPresentSpotlight:(id)a3;
- (void)todayViewDidAppear:(id)a3;
- (void)todayViewWantsToEndEditing:(id)a3;
- (void)updateDefaultFirstPageWidgetDescriptors:(id)a3 withSizeClass:(id)a4 andGridCellInfoOptions:(unint64_t)a5;
- (void)updateHomeScreenTraitOverridesForTraitOverrides:(id)a3;
- (void)updateHomeScreenTraitOverridesForViewController:(id)a3;
- (void)updateHomeScreenTraitOverridesForWindowScene:(id)a3;
- (void)updateNumberOfRowsWithDuration:(double)a3;
- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6;
- (void)updateRootFolderWithCurrentDoNotDisturbState;
- (void)updateStatusBarLegibilityForWindowScene:(id)a3;
- (void)updateStyleConfiguration:(id)a3 forIconManager:(id)a4;
@end

@implementation SBHomeScreenController

- (SBWindow)window
{
  return (SBWindow *)self->_homeScreenWindow;
}

- (UIView)homeScreenContentView
{
  return self->_homeScreenContentView;
}

- (UIView)homeScreenScalingView
{
  return self->_homeScreenScalingView;
}

- (void)setHomeScreenAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [(SBHomeScreenController *)self homeScreenScalingView];
  if ([(NSMutableSet *)self->_contentRequiringReasons count])
  {
    v10 = (void *)MEMORY[0x1E4F42FF0];
    v11 = [(SBAppSwitcherSettings *)self->_switcherSettings animationSettings];
    v12 = [v11 homeScreenOpacitySettings];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__SBHomeScreenController_AppearanceControlling__setHomeScreenAlpha_behaviorMode_completion___block_invoke;
    v13[3] = &unk_1E6AF4A70;
    id v14 = v9;
    double v15 = a3;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v13, v8);
  }
  else
  {
    [v9 setAlpha:a3];
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
}

uint64_t __92__SBHomeScreenController_AppearanceControlling__setHomeScreenAlpha_behaviorMode_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setHomeScreenScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [(SBHomeScreenController *)self homeScreenScalingView];
  if ([(NSMutableSet *)self->_contentRequiringReasons count])
  {
    v10 = (void *)MEMORY[0x1E4F42FF0];
    v11 = [(SBAppSwitcherSettings *)self->_switcherSettings animationSettings];
    v12 = [v11 homeScreenScaleSettings];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__SBHomeScreenController_AppearanceControlling__setHomeScreenScale_behaviorMode_completion___block_invoke;
    v13[3] = &unk_1E6AF4A70;
    id v14 = v9;
    double v15 = a3;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v13, v8);
  }
  else
  {
    CGAffineTransformMakeScale(&v16, a3, a3);
    [v9 setTransform:&v16];
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
}

uint64_t __92__SBHomeScreenController_AppearanceControlling__setHomeScreenScale_behaviorMode_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v1 setTransform:&v3];
}

- (void)setHomeScreenDimmingAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = [(SBWindow *)self->_homeScreenDimmingWindow rootViewController];
  v10 = [v9 view];

  [v10 alpha];
  if (v11 == a3)
  {
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke;
    v22[3] = &unk_1E6AF5580;
    v22[4] = self;
    id v12 = v10;
    id v23 = v12;
    v13 = v8;
    id v24 = v13;
    id v14 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v22);
    [(SBWindow *)self->_homeScreenDimmingWindow setHidden:0];
    uint64_t v15 = [(NSMutableSet *)self->_contentRequiringReasons count];
    if (a4 != 5 || v15)
    {
      CGAffineTransform v16 = (void *)MEMORY[0x1E4F42FF0];
      v17 = [(SBAppSwitcherSettings *)self->_switcherSettings animationSettings];
      v18 = [v17 opacitySettings];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2;
      v19[3] = &unk_1E6AF4A70;
      id v20 = v12;
      double v21 = a3;
      objc_msgSend(v16, "sb_animateWithSettings:mode:animations:completion:", v18, a4, v19, v14);
    }
    else
    {
      [v12 setAlpha:a3];
      if (v13) {
        v14[2](v14, 1, 0);
      }
    }
  }
}

uint64_t __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 24);
    [*(id *)(a1 + 40) alpha];
    [v4 setHidden:BSFloatIsZero()];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setHomeScreenBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
}

- (void)setHomeScreenBackdropBlurMaterialRecipeName:(id)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x1E4F42FF0];
  switcherSettings = self->_switcherSettings;
  id v11 = a5;
  id v12 = [(SBAppSwitcherSettings *)switcherSettings animationSettings];
  v13 = [v12 homeScreenScaleSettings];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__SBHomeScreenController_AppearanceControlling__setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke;
  v15[3] = &unk_1E6AF5290;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a4, v15, v11);
}

void __117__SBHomeScreenController_AppearanceControlling__setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  CGAffineTransform v3 = SBSafeCast(v2, *(void **)(*(void *)(a1 + 32) + 8));
  if (v3)
  {
    id v4 = v3;
    [v3 setMaterialRecipeName:*(void *)(a1 + 40)];
    CGAffineTransform v3 = v4;
  }
}

- (void)_willRevealOrHideContentView
{
  id v2 = [(SBHomeScreenController *)self iconManager];
  [v2 cancelAllFolderScrolling];
}

- (void)_hideKeyboard
{
}

- (void)_closeOpenFolderIfNecessary
{
  id v3 = [(SBHomeScreenController *)self iconManager];
  id v2 = [v3 iconToReveal];
  if (v2 && [v3 hasOpenFolder]) {
    [v3 popToCurrentRootIconList];
  }
}

- (void)restoreContent
{
}

- (void)restoreContentWithOptions:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = [(SBHomeScreenController *)self windowScene];
  v6 = +[SBLockScreenManager sharedInstance];
  int v7 = [v6 isUILocked];
  int v8 = [v5 isContinuityDisplayWindowScene];
  v9 = SBLogUIController();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSBUIControllerRequireContentOptions(a3);
    *(_DWORD *)buf = 138412290;
    v35 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Attempting restoreContentWithOptions:(%@)", buf, 0xCu);
  }
  if ((a3 & 2) == 0)
  {
    id v11 = [(id)SBApp lockOutController];
    if ([v11 isLockedOut])
    {

      if ((v7 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v15 = [v6 lockScreenEnvironment];
      id v16 = [v15 callController];
      int v17 = [v16 isMakingEmergencyCall];

      if (((v17 ^ 1 | v7) & 1) == 0)
      {
LABEL_6:
        v32[0] = @"SBUILockOptionsUseScreenOffModeKey";
        v32[1] = @"SBUILockOptionsLockAutomaticallyKey";
        v33[0] = MEMORY[0x1E4F1CC28];
        v33[1] = MEMORY[0x1E4F1CC38];
        v32[2] = @"SBUILockOptionsForceLockKey";
        v33[2] = MEMORY[0x1E4F1CC38];
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
        [v6 lockUIFromSource:6 withOptions:v12];

        v13 = SBLogUIController();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v14 = "abort restoreContentWithOptions: Force lock case";
LABEL_15:
          _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
    }
  }
  if ((v7 ^ 1 | v8))
  {
    v13 = [(id)SBApp restartManager];
    if ([v13 isPendingExit])
    {
      v18 = SBLogUIController();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "abort restoreContentWithOptions: restartManager isPendingExit", buf, 2u);
      }
      goto LABEL_40;
    }
    v19 = [(SBHomeScreenController *)self homeScreenScalingView];
    v18 = v19;
    if (v19 && ([v19 isHidden] & 1) == 0)
    {
      double v21 = SBLogUIController();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v23 = "abort restoreContentWithOptions: _iconsView is already visible";
        goto LABEL_33;
      }
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    BOOL v20 = [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView isOpaque];
    double v21 = SBLogUIController();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        id v23 = "abort restoreContentWithOptions: _homeScreenBackdropView is opaque";
LABEL_33:
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Restoring home screen", buf, 2u);
    }

    BOOL v24 = [(SBHomeScreenController *)self isIconListViewTornDown];
    [(SBHomeScreenController *)self _willRevealOrHideContentView];
    double v21 = [(SBHomeScreenController *)self homeScreenViewController];
    v25 = SBLogUIController();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Setting _iconsView to visible", buf, 2u);
    }

    [v21 setIconContentHidden:0];
    v26 = [(SBHomeScreenController *)self window];
    v27 = [v26 traitsParticipant];
    [v27 setNeedsUpdatePreferencesWithReason:@"restore icons" animate:0];

    [(SBHomeScreenController *)self _closeOpenFolderIfNecessary];
    [(SBHomeScreenController *)self updateNumberOfRowsWithDuration:0.0];
    if ((a3 & 1) == 0) {
      [(SBHomeScreenController *)self updateStatusBarLegibilityForWindowScene:v5];
    }
    if ([v5 isMainDisplayWindowScene])
    {
      [(SBHomeScreenController *)self _switchToHomeScreenWallpaperAnimated:1];
      v28 = +[SBWallpaperController sharedInstance];
      [v28 activateOrientationSource:2];

      if (!v24)
      {
LABEL_29:
        if ((a3 & 4) == 0) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }
    else if (!v24)
    {
      goto LABEL_29;
    }
    v29 = [(SBHomeScreenController *)self window];
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen") & 1) == 0) {
      [v29 _updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:0];
    }
    [v29 layoutBelowIfNeeded];

    if ((a3 & 4) == 0) {
      goto LABEL_39;
    }
LABEL_38:
    v30 = [(SBHomeScreenController *)self iconManager];
    v31 = [v30 rootFolderController];
    [v31 presentSpotlightAnimated:0 completionHandler:&__block_literal_global_233];

    goto LABEL_39;
  }
  v13 = SBLogUIController();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v14 = "abort restoreContentWithOptions: UI is locked";
    goto LABEL_15;
  }
LABEL_41:
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3
{
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [(SBHomeScreenController *)self restoreContent];
  id v9 = [(SBHomeScreenController *)self iconManager];
  [v9 unscatterAnimated:v6 afterDelay:v8 withCompletion:a4];
}

- (void)tearDownIconListAndBar
{
  if (![(NSMutableSet *)self->_contentRequiringReasons count]
    || [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView isOpaque])
  {
    id v3 = SBLogUIController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down home screen", v8, 2u);
    }

    id v4 = [(SBHomeScreenController *)self homeScreenViewController];
    [v4 setIconContentHidden:1];
    v5 = [(SBHomeScreenController *)self windowScene];
    int v6 = [v5 isMainDisplayWindowScene];

    if (v6)
    {
      int v7 = +[SBWallpaperController sharedInstance];
      [v7 deactivateOrientationSource:2];
    }
  }
}

- (BOOL)isIconListViewTornDown
{
  id v2 = [(SBHomeScreenController *)self homeScreenScalingView];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)beginRequiringContentForReason:(id)a3
{
}

- (void)beginRequiringContentForReason:(id)a3 options:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBHomeScreenController+AppearanceControlling.m", 315, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v8 = SBLogUIController();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Begin requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  contentRequiringReasons = self->_contentRequiringReasons;
  if (!contentRequiringReasons)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v11 = self->_contentRequiringReasons;
    self->_contentRequiringReasons = v10;

    contentRequiringReasons = self->_contentRequiringReasons;
  }
  uint64_t v12 = [(NSMutableSet *)contentRequiringReasons count];
  [(NSMutableSet *)self->_contentRequiringReasons addObject:v7];
  if (!v12 || [(SBHomeScreenController *)self isIconListViewTornDown]) {
    [(SBHomeScreenController *)self restoreContentWithOptions:a4];
  }
}

- (void)endRequiringContentForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBHomeScreenController+AppearanceControlling.m", 332, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  int v6 = SBLogUIController();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "End requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  uint64_t v7 = [(NSMutableSet *)self->_contentRequiringReasons count];
  [(NSMutableSet *)self->_contentRequiringReasons removeObject:v5];
  uint64_t v8 = [(NSMutableSet *)self->_contentRequiringReasons count];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    [(SBHomeScreenController *)self tearDownIconListAndBar];
  }
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView beginRequiringBackdropViewForReason:a3];
  [(SBHomeScreenController *)self _updateRequireWallpaperRasterization];
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView beginRequiringLiveBackdropViewForReason:a3];
  [(SBHomeScreenController *)self _updateRequireWallpaperRasterization];
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView endRequiringBackdropViewForReason:a3];
  [(SBHomeScreenController *)self _removeReachabilityEffectViewIfNecessary];
  [(SBHomeScreenController *)self _updateRequireWallpaperRasterization];
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView endRequiringLiveBackdropViewForReason:a3];
  [(SBHomeScreenController *)self _removeReachabilityEffectViewIfNecessary];
  [(SBHomeScreenController *)self _updateRequireWallpaperRasterization];
}

- (void)_updateRequireWallpaperRasterization
{
  BOOL v3 = [(SBHomeScreenController *)self isBackdropVisible];
  wallpaperRasterizationAssertion = self->_wallpaperRasterizationAssertion;
  if (v3)
  {
    if (wallpaperRasterizationAssertion) {
      return;
    }
    uint64_t v8 = +[SBWallpaperController sharedInstance];
    id v5 = [v8 requireWallpaperRasterizationWithReason:@"SBUIControllerWallpaperRasterizationReason"];
    int v6 = self->_wallpaperRasterizationAssertion;
    self->_wallpaperRasterizationAssertion = v5;

    uint64_t v7 = (BSInvalidatable *)v8;
  }
  else
  {
    if (!wallpaperRasterizationAssertion) {
      return;
    }
    [(BSInvalidatable *)wallpaperRasterizationAssertion invalidate];
    uint64_t v7 = self->_wallpaperRasterizationAssertion;
    self->_wallpaperRasterizationAssertion = 0;
  }
}

- (BOOL)isBackdropVisible
{
  if ([(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresBackdropView]) {
    return 1;
  }
  homeScreenBackdropView = self->_homeScreenBackdropView;
  return [(SBHomeScreenBackdropViewBase *)homeScreenBackdropView requiresLiveBackdropView];
}

- (void)cancelInProcessAnimations
{
  BOOL v3 = [(SBHomeScreenController *)self window];
  [v3 _removeAllRetargetableAnimations:1];

  [(SBWindow *)self->_homeScreenDimmingWindow _removeAllRetargetableAnimations:1];
  homeScreenBackdropView = self->_homeScreenBackdropView;
  [(SBHomeScreenBackdropViewBase *)homeScreenBackdropView cancelInProcessAnimations];
}

- (void)_switchToHomeScreenWallpaperAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = +[SBWallpaperController sharedInstance];
  if ([v14 activeVariant] != 1)
  {
    id v4 = [MEMORY[0x1E4F5E408] rootSettings];
    id v5 = v4;
    if (v3)
    {
      int v6 = (void *)MEMORY[0x1E4F4F898];
      uint64_t v7 = [v4 unlockToPhoneWallpaperOutSettings];
      uint64_t v8 = [v7 BSAnimationSettings];
      BOOL v9 = [v6 factoryWithSettings:v8];

      v10 = (void *)MEMORY[0x1E4F4F898];
      id v11 = [v5 unlockToPhoneWallpaperInSettings];
      id v12 = [v11 BSAnimationSettings];
      uint64_t v13 = [v10 factoryWithSettings:v12];
    }
    else
    {
      uint64_t v13 = 0;
      BOOL v9 = 0;
    }
    [v14 setWindowLevel:*MEMORY[0x1E4F43F20] + -3.0];
    [v14 setActiveVariant:1 withOutAnimationFactory:v9 inAnimationFactory:v13 completion:0];
  }
}

- (void)handleWillBeginReachabilityAnimation
{
  if ([(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresBackdropView]
    || [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresLiveBackdropView])
  {
    [(SBHomeScreenController *)self beginRequiringLiveBackdropViewForReason:@"ReachabilityAnimation"];
    if (!self->_reachabilityWallpaperEffectView)
    {
      BOOL v3 = [(SBHomeScreenController *)self homeScreenContentView];
      id v4 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1];
      reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = v4;

      [(PBUIWallpaperEffectViewBase *)self->_reachabilityWallpaperEffectView setForcesOpaque:1];
      [(PBUIWallpaperEffectViewBase *)self->_reachabilityWallpaperEffectView setFullscreen:1];
      [(PBUIWallpaperEffectViewBase *)self->_reachabilityWallpaperEffectView setStyle:0];
      [v3 addSubview:self->_reachabilityWallpaperEffectView];
      [v3 sendSubviewToBack:self->_reachabilityWallpaperEffectView];
      int v6 = (void *)MEMORY[0x1E4F42FF0];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __85__SBHomeScreenController_AppearanceControlling__handleWillBeginReachabilityAnimation__block_invoke;
      v8[3] = &unk_1E6AF5290;
      v8[4] = self;
      id v9 = v3;
      id v7 = v3;
      [v6 _performWithoutRetargetingAnimations:v8];
    }
  }
}

uint64_t __85__SBHomeScreenController_AppearanceControlling__handleWillBeginReachabilityAnimation__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 80);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "setFrame:");
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v3 layoutIfNeeded];
}

- (void)handleDidEndReachabilityAnimation
{
}

- (void)_removeReachabilityEffectViewIfNecessary
{
  if ([(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresBackdropView]) {
    char v3 = 0;
  }
  else {
    char v3 = ![(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView requiresLiveBackdropView];
  }
  BOOL v4 = [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView isOpaque];
  if ((v3 & 1) != 0 || v4)
  {
    reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
    if (reachabilityWallpaperEffectView)
    {
      [(SBWallpaperEffectView *)reachabilityWallpaperEffectView removeFromSuperview];
      int v6 = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = 0;
    }
  }
}

- (void)_setupAppearanceControlling
{
  id v13 = [(SBHomeScreenController *)self windowScene];
  char v3 = [SBHomeScreenWindow alloc];
  BOOL v4 = [(SBHomeScreenController *)self homeScreenViewController];
  id v5 = [(SBWindow *)v3 initWithWindowScene:v13 rootViewController:v4 role:@"SBTraitsParticipantRoleHomeScreen" debugName:@"HomeScreen"];
  homeScreenWindow = self->_homeScreenWindow;
  self->_homeScreenWindow = v5;

  [(SBHomeScreenWindow *)self->_homeScreenWindow setOpaque:0];
  [(SBHomeScreenWindow *)self->_homeScreenWindow setWindowLevel:*MEMORY[0x1E4F43F20] + -2.0];
  [(SBWindow *)self->_homeScreenWindow makeKeyAndVisible];
  id v7 = [v13 statusBarManager];
  uint64_t v8 = [v7 layoutManager];
  [v8 setOrientationWindow:self->_homeScreenWindow forStatusBarLayoutLayer:0];
  id v9 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", @"SBUIHomeScreenActiveContentRequirementReason", 0);
  contentRequiringReasons = self->_contentRequiringReasons;
  self->_contentRequiringReasons = v9;

  [(SBHomeScreenController *)self _setupHomeScreenContentBackdropView];
  [(SBHomeScreenController *)self _setupHomeScreenDimmingWindow];
  id v11 = +[SBAppSwitcherDomain rootSettings];
  switcherSettings = self->_switcherSettings;
  self->_switcherSettings = v11;

  [(PTSettings *)self->_switcherSettings addKeyObserver:self];
}

- (void)_setupHomeScreenDimmingWindow
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  char v3 = [v10 view];
  BOOL v4 = [MEMORY[0x1E4F428B8] blackColor];
  [v3 setBackgroundColor:v4];

  id v5 = [v10 view];
  [v5 setAlpha:0.0];

  int v6 = [SBWindow alloc];
  id v7 = [(SBHomeScreenController *)self windowScene];
  uint64_t v8 = [(SBWindow *)v6 initWithWindowScene:v7 rootViewController:v10 role:@"SBTraitsParticipantRoleHomeScreenDimming" debugName:@"HomeScreenDimming"];
  homeScreenDimmingWindow = self->_homeScreenDimmingWindow;
  self->_homeScreenDimmingWindow = v8;

  [(SBWindow *)self->_homeScreenDimmingWindow setWindowLevel:*MEMORY[0x1E4F43F20] + -2.0 + 1.0];
  [(SBWindow *)self->_homeScreenDimmingWindow bs_setHitTestingDisabled:1];
}

- (void)_setupHomeScreenContentBackdropView
{
  id v7 = [(SBHomeScreenController *)self homeScreenContentView];
  if (UIAccessibilityIsReduceTransparencyEnabled()) {
    char v3 = SBHomeScreenBackdropDarkTintView;
  }
  else {
    char v3 = SBHomeScreenBackdropView;
  }
  id v4 = [v3 alloc];
  [v7 bounds];
  id v5 = (SBHomeScreenBackdropViewBase *)objc_msgSend(v4, "initWithFrame:");
  homeScreenBackdropView = self->_homeScreenBackdropView;
  self->_homeScreenBackdropView = v5;

  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView setAutoresizingMask:18];
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView bs_setHitTestingDisabled:1];
  [(SBHomeScreenBackdropViewBase *)self->_homeScreenBackdropView setDelegate:self];
  [v7 addSubview:self->_homeScreenBackdropView];
}

- (void)homeScreenBackdropView:(id)a3 opaquenessDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v4)
  {
    int v6 = [(SBHomeScreenController *)self iconManager];
    self->_isShowingSpotlightUnderOpaqueBackdrop = [v6 isShowingPullDownSearch];

    [(SBHomeScreenController *)self tearDownIconListAndBar];
    [(SBHomeScreenController *)self _removeReachabilityEffectViewIfNecessary];
  }
  else if ([(NSMutableSet *)self->_contentRequiringReasons count] {
         && [(SBHomeScreenController *)self isIconListViewTornDown])
  }
  {
    if (self->_isShowingSpotlightUnderOpaqueBackdrop)
    {
      self->_isShowingSpotlightUnderOpaqueBackdrop = 0;
      uint64_t v7 = 5;
    }
    else
    {
      uint64_t v7 = 1;
    }
    [(SBHomeScreenController *)self restoreContentWithOptions:v7];
  }
}

- (SBHomeScreenController)initWithWindowScene:(id)a3
{
  return [(SBHomeScreenController *)self initWithWindowScene:a3 alertItemsController:0 applicationController:0 applicationPlaceholderController:0 assistantController:0 coverSheetPresentationManager:0 lockScreenManager:0 mainDisplaySceneManager:0 policyAggregator:0 userInterfaceController:0];
}

- (SBHomeScreenController)initWithWindowScene:(id)a3 alertItemsController:(id)a4 applicationController:(id)a5 applicationPlaceholderController:(id)a6 assistantController:(id)a7 coverSheetPresentationManager:(id)a8 lockScreenManager:(id)a9 mainDisplaySceneManager:(id)a10 policyAggregator:(id)a11 userInterfaceController:(id)a12
{
  id obj = a3;
  id v102 = a4;
  id v101 = a5;
  id v100 = a6;
  id v99 = a7;
  id v98 = a8;
  id v97 = a9;
  id v96 = a10;
  id v95 = a11;
  id v94 = a12;
  v113.receiver = self;
  v113.super_class = (Class)SBHomeScreenController;
  v18 = [(SBHomeScreenController *)&v113 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_windowScene, obj);
    objc_storeStrong((id *)&v19->_override_alertItemsController, a4);
    objc_storeStrong((id *)&v19->_override_applicationController, a5);
    objc_storeStrong((id *)&v19->_override_applicationPlaceholderController, a6);
    objc_storeStrong((id *)&v19->_override_assistantController, a7);
    objc_storeStrong((id *)&v19->_override_coverSheetPresentationManager, a8);
    objc_storeStrong((id *)&v19->_override_lockScreenManager, a9);
    objc_storeStrong((id *)&v19->_override_mainDisplaySceneManager, a10);
    objc_storeStrong((id *)&v19->_override_policyAggregator, a11);
    objc_storeStrong((id *)&v19->_override_userInterfaceController, a12);
    BOOL v20 = [(SBHomeScreenController *)v19 userInterfaceController];
    double v21 = [v20 iconController];
    uint64_t v22 = objc_opt_class();
    id v23 = [v21 model];
    uint64_t v24 = SBSafeCast(v22, v23);

    v91 = (void *)v24;
    [(SBHomeScreenController *)v19 setModel:v24];
    [v21 addIconModelControllerObserver:v19];
    uint64_t v25 = [(SBHomeScreenController *)v19 coverSheetPresentationManager];
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v19 selector:sel__unlockAnimationDidFinish_ name:@"SBLockScreenManagerUnlockAnimationDidFinish" object:0];
    [v26 addObserver:v19 selector:sel__lockScreenUIWillLock_ name:@"SBLockScreenUIWillLockNotification" object:0];
    [v26 addObserver:v19 selector:sel__lockScreenUIWillLock_ name:@"SBLockScreenUIRelockedNotification" object:0];
    [v26 addObserver:v19 selector:sel__iconModelDidChange_ name:SBIconControllerIconModelDidChangeNotification object:v21];
    v27 = +[SBControlCenterController sharedInstanceIfExists];
    [v26 addObserver:v19 selector:sel__controlCenterWillPresent_ name:@"SBControlCenterControllerWillPresentNotification" object:v27];

    v28 = +[SBControlCenterController sharedInstanceIfExists];
    [v26 addObserver:v19 selector:sel__controlCenterWillDismiss_ name:@"SBControlCenterControllerWillDismissNotification" object:v28];

    [v26 addObserver:v19 selector:sel__coverSheetWillPresent_ name:@"SBCoverSheetWillPresentNotification" object:v25];
    v90 = (void *)v25;
    [v26 addObserver:v19 selector:sel__coverSheetDidPresent_ name:@"SBCoverSheetDidPresentNotification" object:v25];
    [v26 addObserver:v19 selector:sel__forceTouchControllerWillPresent_ name:*MEMORY[0x1E4FA6720] object:0];
    [v26 addObserver:v19 selector:sel__mainSwitcherCreated_ name:@"SBMainSwitcherSwitcherSharedInstanceCreatedNotification" object:0];
    [v26 addObserver:v19 selector:sel__reduceMotionStatusDidChange_ name:*MEMORY[0x1E4F43478] object:0];
    [v26 addObserver:v19 selector:sel__policyAggregatorCapabilitiesDidChange_ name:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:0];
    [v26 addObserver:v19 selector:sel__colorDropperWillPresent_ name:*MEMORY[0x1E4FA6590] object:0];
    [v26 addObserver:v19 selector:sel__colorDropperDismissed_ name:*MEMORY[0x1E4FA6568] object:0];
    v29 = (SBHIconManager *)objc_alloc_init(MEMORY[0x1E4FA62B0]);
    iconManager = v19->_iconManager;
    v19->_iconManager = v29;

    [(SBHIconManager *)v19->_iconManager setDelegate:v19];
    [(SBHIconManager *)v19->_iconManager setOwnsIconModel:0];
    v31 = [SBWallpaperIconStyleCoordinator alloc];
    v32 = +[SBWallpaperController sharedInstance];
    v33 = +[SBDefaults localDefaults];
    v34 = [v33 homeScreenDefaults];
    uint64_t v35 = [(SBWallpaperIconStyleCoordinator *)v31 initWithWallpaperController:v32 homeScreenDefaults:v34];
    iconStyleCoordinator = v19->_iconStyleCoordinator;
    v19->_iconStyleCoordinator = (SBWallpaperIconStyleCoordinator *)v35;

    [(SBWallpaperIconStyleCoordinator *)v19->_iconStyleCoordinator addIconStyleObserver:v19];
    v37 = [SBHomeScreenViewController alloc];
    v38 = v37;
    v93 = v20;
    if (v21)
    {
      uint64_t v39 = [(SBHomeScreenViewController *)v37 initWithWindowScene:obj iconController:v21 iconManager:v19->_iconManager userInterfaceController:v20];
      homeScreenViewController = v19->_homeScreenViewController;
      v19->_homeScreenViewController = (SBHomeScreenViewController *)v39;

      uint64_t v41 = [(SBHomeScreenViewController *)v19->_homeScreenViewController iconContentView];
      homeScreenScalingView = v19->_homeScreenScalingView;
      v19->_homeScreenScalingView = (UIView *)v41;
      v43 = obj;
    }
    else
    {
      homeScreenScalingView = [(SBHomeScreenController *)v19 userInterfaceController];
      v43 = obj;
      uint64_t v44 = [(SBHomeScreenViewController *)v38 initWithWindowScene:obj iconController:0 iconManager:0 userInterfaceController:homeScreenScalingView];
      v45 = v19->_homeScreenViewController;
      v19->_homeScreenViewController = (SBHomeScreenViewController *)v44;
    }
    uint64_t v46 = [(SBHomeScreenViewController *)v19->_homeScreenViewController view];
    homeScreenContentView = v19->_homeScreenContentView;
    v19->_homeScreenContentView = (UIView *)v46;

    [(SBHIconManager *)v19->_iconManager configureFeedbackView:v19->_homeScreenContentView];
    [(SBHomeScreenController *)v19 updateHomeScreenTraitOverridesForWindowScene:v43];
    [(SBHIconManager *)v19->_iconManager setListLayoutProviderLayoutOptions:[(SBHomeScreenController *)v19 bestListLayoutProviderLayoutOptions]];
    [(SBHIconManager *)v19->_iconManager setIconModel:v19->_iconModel];
    if (![(SBHomeScreenController *)v19 _isCoplanarHomeScreenEnabled]) {
      [(SBHomeScreenController *)v19 _setupOverlayLibraryViewController];
    }
    v92 = v21;
    [(SBHomeScreenController *)v19 _setupOverlayLibraryViewController];
    [(SBHomeScreenController *)v19 _makeTodayViewControllers];
    if (![(SBHomeScreenController *)v19 _isCoplanarHomeScreenEnabled])
    {
      v48 = v19->_iconManager;
      v49 = [(SBHomeScreenController *)v19 todayViewController];
      [(SBHIconManager *)v48 setOverlayTodayViewController:v49];
    }
    v50 = v19->_iconManager;
    v51 = [(SBHomeScreenController *)v19 coverSheetTodayViewController];
    [(SBHIconManager *)v50 setOverlayCoverSheetTodayViewController:v51];

    [(SBHomeScreenController *)v19 _setupAppearanceControlling];
    v52 = [(SBHomeScreenController *)v19 alertItemsController];
    [v52 addObserver:v19];

    v53 = [(SBHomeScreenController *)v19 assistantController];
    [v53 addObserver:v19];

    v54 = [v43 displayLayoutPublisher];
    [v54 addObserver:v19];

    v55 = [v43 layoutStateTransitionCoordinator];
    [v55 addObserver:v19];

    v56 = [[SBTipsHomeScreenUsageObserver alloc] initWithIconManager:v19->_iconManager];
    tipsUsageObserver = v19->_tipsUsageObserver;
    v19->_tipsUsageObserver = v56;

    v58 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v59 = [v58 rootFolderSettings];
    rootFolderSettings = v19->_rootFolderSettings;
    v19->_rootFolderSettings = (SBHRootFolderSettings *)v59;

    [(SBHRootFolderSettings *)v19->_rootFolderSettings addKeyObserver:v19];
    uint64_t v61 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    deviceOrientationUpdateDeferralAssertionsByReason = v19->_deviceOrientationUpdateDeferralAssertionsByReason;
    v19->_deviceOrientationUpdateDeferralAssertionsByReason = (NSMapTable *)v61;

    uint64_t v63 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    activeInterfaceOrientationChangeDeferralAssertionsByReason = v19->_activeInterfaceOrientationChangeDeferralAssertionsByReason;
    v19->_activeInterfaceOrientationChangeDeferralAssertionsByReason = (NSMapTable *)v63;

    v65 = +[SBDefaults localDefaults];
    v66 = [v65 homeScreenDefaults];

    v67 = +[SBDefaults localDefaults];
    v68 = [v67 floatingDockDefaults];

    v69 = [MEMORY[0x1E4FA6270] rootSettings];
    objc_initWeak(&location, v19);
    v70 = [NSString stringWithUTF8String:"shouldUseLargeDefaultSizedIcons"];
    uint64_t v71 = MEMORY[0x1E4F14428];
    id v72 = MEMORY[0x1E4F14428];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke;
    v110[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v111, &location);
    id v73 = (id)[v66 observeDefault:v70 onQueue:v71 withBlock:v110];

    v74 = [NSString stringWithUTF8String:"recentsEnabled"];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_2;
    v108[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v109, &location);
    id v75 = (id)[v68 observeDefault:v74 onQueue:MEMORY[0x1E4F14428] withBlock:v108];

    [v69 addKeyObserver:v19];
    v76 = [NSString stringWithUTF8String:"showsBadgesInAppLibrary"];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_3;
    v106[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v107, &location);
    id v77 = (id)[v66 observeDefault:v76 onQueue:MEMORY[0x1E4F14428] withBlock:v106];

    v78 = [NSString stringWithUTF8String:"showsHomeScreenSearchAffordance"];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_4;
    v104[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v105, &location);
    id v79 = (id)[v66 observeDefault:v78 onQueue:MEMORY[0x1E4F14428] withBlock:v104];

    v80 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v81 = [v80 iconEditingSettings];
    iconEditingSettings = v19->_iconEditingSettings;
    v19->_iconEditingSettings = (SBHIconEditingSettings *)v81;

    [(SBHIconEditingSettings *)v19->_iconEditingSettings addKeyObserver:v19];
    [(SBHomeScreenController *)v19 _configureEditingGestureRecognizers];
    v83 = [MEMORY[0x1E4FA6270] rootSettings];
    uint64_t v84 = [v83 widgetSettings];
    widgetSettings = v19->_widgetSettings;
    v19->_widgetSettings = (SBHWidgetSettings *)v84;

    id v86 = +[SBDraggingSystemManager sharedInstance];
    uint64_t v87 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.SBIconController"];
    dndStateService = v19->_dndStateService;
    v19->_dndStateService = (DNDStateService *)v87;

    [(DNDStateService *)v19->_dndStateService addStateUpdateListener:v19 withCompletionHandler:0];
    [(SBHomeScreenController *)v19 updateRootFolderWithCurrentDoNotDisturbState];
    objc_destroyWeak(&v105);
    objc_destroyWeak(&v107);
    objc_destroyWeak(&v109);
    objc_destroyWeak(&v111);
    objc_destroyWeak(&location);
  }
  return v19;
}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:animated:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"), 0);
}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"));
}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showsBadgesInAppLibraryDidChange];
}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained iconManager];
  [v1 tearDownAndResetRootIconLists];
}

- (void)_setupOverlayLibraryViewController
{
  if (![(SBHomeScreenController *)self isModalAppLibrarySupported])
  {
    char v3 = [(SBHomeScreenController *)self overlayLibraryViewController];
    if (!v3)
    {
      BOOL v4 = [(SBHomeScreenController *)self isAppLibrarySupported];
      char v3 = 0;
      if (v4)
      {
        id v5 = [(SBHomeScreenController *)self iconManager];

        if (!v5) {
          return;
        }
        int v6 = [(SBHomeScreenController *)self mainDisplayWindowScene];
        uint64_t v7 = [(SBHomeScreenController *)self _setUpLibraryViewControllerForWindowScene:v6];

        [(SBHomeScreenController *)self setOverlayLibraryViewController:v7];
        if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled]) {
          [(SBHIconManager *)self->_iconManager setOverlayLibraryViewController:v7];
        }
        char v3 = (void *)v7;
      }
    }
  }
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:492 description:@"SBHomeScreenController must be invalidated before -dealloc"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBHomeScreenController;
  [(SBHomeScreenController *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_invalidated = 1;
  char v3 = [(SBHomeScreenController *)self iconManager];
  BOOL v4 = [(SBHomeScreenController *)self spotlightViewController];
  if ([v3 isShowingPullDownOrLeadingCustomViewSearch])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__SBHomeScreenController_invalidate__block_invoke;
    v22[3] = &unk_1E6AF4AC0;
    id v23 = v4;
    [v3 dismissSpotlightAnimated:0 completionHandler:v22];
  }
  else
  {
    [v4 invalidate];
  }
  objc_super v5 = [v3 rootViewController];
  [(SBHomeScreenController *)self iconManager:v3 willDestroyRootViewController:v5];

  int v6 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  if (v6)
  {
    [(NSMapTable *)self->_windowSceneToMedusaDragWindowContext removeObjectForKey:v6];
    uint64_t v7 = [(SBHomeScreenController *)self iconDragManager];
    [v7 windowSceneDidDisconnect:v6];

    id v8 = [v6 displayLayoutPublisher];
    [v8 removeObserver:self];

    id v9 = [v6 layoutStateTransitionCoordinator];
    [v9 removeObserver:self];
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];

  [(SBHIconEditingSettings *)self->_iconEditingSettings removeKeyObserver:self];
  [(BSInvalidatable *)self->_duckWallpaperDimmingAssertion invalidate];
  [(BSInvalidatable *)self->_displayLayoutTransition invalidate];
  [(BSInvalidatable *)self->_folderDisplayLayoutAssertion invalidate];
  [(BSInvalidatable *)self->_todayViewDisplayLayoutAssertion invalidate];
  [(BSInvalidatable *)self->_widgetEditingLayoutAssertion invalidate];
  [(NSMapTable *)self->_suspendWallpaperAnimationForFolderAssertions bs_each:&__block_literal_global_371];
  [(BSInvalidatable *)self->_suspendWallpaperAnimationForOverlayViewAssertion invalidate];
  [(BSInvalidatable *)self->_suspendWallpaperAnimationForSpotlightAssertion invalidate];
  [(BSInvalidatable *)self->_wallpaperRasterizationAssertion invalidate];
  [(SBFloatingDockBehaviorAssertion *)self->_homeScreenOverlayFloatingDockBehaviorAssertion invalidate];
  [(SBFloatingDockBehaviorAssertion *)self->_addWidgetSheetFloatingDockBehaviorAssertion invalidate];
  [(SBFloatingDockBehaviorAssertion *)self->_widgetConfigurationFloatingDockBehaviorAssertion invalidate];
  [(SBFloatingDockBehaviorAssertion *)self->_modalInteractionFloatingDockBehaviorAssertion invalidate];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [(SBHomeScreenController *)self floatingDockBehaviorAssertions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
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
        [*(id *)(*((void *)&v18 + 1) + 8 * v15++) invalidate];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v13);
  }

  [(BSInvalidatable *)self->_addWidgetSheetKeyboardFocusAssertion invalidate];
  [(SBLibraryViewController *)self->_overlayLibraryViewController invalidate];
  uint64_t v16 = +[SBIconController sharedInstance];
  int v17 = [v16 iconStyleCoordinator];
  [v17 removeIconStyleObserver:self];
}

uint64_t __36__SBHomeScreenController_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __36__SBHomeScreenController_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (SBIconModel)model
{
  return self->_iconModel;
}

- (id)iconDragManager
{
  id v2 = [(SBHomeScreenController *)self iconManager];
  char v3 = [v2 iconDragManager];

  return v3;
}

- (id)alertItemsController
{
  override_alertItemsController = self->_override_alertItemsController;
  if (override_alertItemsController)
  {
    char v3 = override_alertItemsController;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_super v5 = [WeakRetained alertItemsController];
    int v6 = v5;
    if (v5)
    {
      uint64_t v7 = v5;
    }
    else
    {
      uint64_t v7 = +[SBAlertItemsController sharedInstance];
    }
    char v3 = v7;
  }
  return v3;
}

- (id)applicationController
{
  override_applicationController = self->_override_applicationController;
  if (override_applicationController)
  {
    char v3 = override_applicationController;
  }
  else
  {
    char v3 = +[SBApplicationController sharedInstance];
  }
  return v3;
}

- (id)applicationPlaceholderController
{
  override_applicationPlaceholderController = self->_override_applicationPlaceholderController;
  if (override_applicationPlaceholderController)
  {
    char v3 = override_applicationPlaceholderController;
  }
  else
  {
    char v3 = +[SBApplicationPlaceholderController sharedInstance];
  }
  return v3;
}

- (id)assistantController
{
  override_assistantController = self->_override_assistantController;
  if (override_assistantController)
  {
    char v3 = override_assistantController;
  }
  else
  {
    char v3 = +[SBAssistantController sharedInstance];
  }
  return v3;
}

- (id)coverSheetPresentationManager
{
  override_coverSheetPresentationManager = self->_override_coverSheetPresentationManager;
  if (override_coverSheetPresentationManager)
  {
    char v3 = override_coverSheetPresentationManager;
  }
  else
  {
    char v3 = +[SBCoverSheetPresentationManager sharedInstance];
  }
  return v3;
}

- (id)lockScreenManager
{
  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
  {
    char v3 = override_lockScreenManager;
  }
  else
  {
    char v3 = +[SBLockScreenManager sharedInstance];
  }
  return v3;
}

- (id)policyAggregator
{
  override_policyAggregator = self->_override_policyAggregator;
  if (override_policyAggregator)
  {
    char v3 = override_policyAggregator;
  }
  else
  {
    objc_super v5 = [(SBHomeScreenController *)self mainDisplaySceneManager];
    int v6 = [v5 policyAggregator];
    uint64_t v7 = v6;
    if (v6)
    {
      char v3 = v6;
    }
    else
    {
      id v8 = [(SBHomeScreenController *)self externalDisplaySceneManager];
      char v3 = [v8 policyAggregator];
    }
  }
  return v3;
}

- (SBUIController)userInterfaceController
{
  override_userInterfaceController = self->_override_userInterfaceController;
  if (override_userInterfaceController)
  {
    char v3 = override_userInterfaceController;
  }
  else
  {
    char v3 = +[SBUIController sharedInstance];
  }
  return v3;
}

- (id)_currentMainDisplayLayoutState
{
  id v2 = [(SBHomeScreenController *)self windowScene];
  char v3 = [v2 layoutStateProvider];
  BOOL v4 = [v3 layoutState];

  return v4;
}

- (void)_updateLegibility
{
  char v3 = [(SBHomeScreenController *)self _iconController];
  id v5 = [v3 legibilitySettings];

  [(SBHomeScreenController *)self setLegibilitySettings:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [(SBHomeScreenController *)self updateStatusBarLegibilityForWindowScene:WeakRetained];
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (id)_iconController
{
  id v2 = [(SBHomeScreenController *)self userInterfaceController];
  char v3 = [v2 iconController];

  return v3;
}

- (id)mainDisplayWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return WeakRetained;
}

- (id)mainDisplaySceneManager
{
  override_mainDisplaySceneManager = self->_override_mainDisplaySceneManager;
  if (override_mainDisplaySceneManager)
  {
    char v3 = override_mainDisplaySceneManager;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    int v6 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    uint64_t v7 = [v6 sceneManager];
    SBSafeCast(v5, v7);
    char v3 = (SBMainDisplaySceneManager *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)externalDisplaySceneManager
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(SBHomeScreenController *)self windowScene];
  uint64_t v5 = [v4 sceneManager];
  int v6 = SBSafeCast(v3, v5);

  return v6;
}

- (uint64_t)_disableEditingByDefaultDuringStaging
{
  if (result)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(result + 88));
    int v2 = [WeakRetained isContinuityDisplayWindowScene];

    if (v2) {
      return SBFIsOnenessHomeScreenEditingAvailable() ^ 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)updateStatusBarLegibilityForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self userInterfaceController];
  [v5 updateStatusBarLegibilityForWindowScene:v4];
}

- (void)iconModelDidImportIconState:(id)a3
{
  id v3 = [(SBHomeScreenController *)self iconManager];
  [v3 relayout];
}

- (void)iconModelInstalledAppsDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHomeScreenController *)self _libraryViewControllers];
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
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) noteInstalledApplicationsDidChange];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  id v9 = [(SBHomeScreenController *)self iconManager];
  [v9 checkForInvalidCustomElements];
}

- (void)iconModel:(id)a3 backupRestoringStatusDidChange:(BOOL)a4
{
  if (!a4)
  {
    uint64_t v6 = [(SBHomeScreenController *)self iconManager];
    [v6 checkForInvalidWidgets];

    id v7 = [(SBHomeScreenController *)self iconManager];
    [v7 checkForInvalidCustomElements];
  }
}

- (void)iconModel:(id)a3 wantsToRevealAnyApplicationFromIdentifiers:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHomeScreenController *)self iconManager];
  id v9 = [v7 anyObject];
  if (v9)
  {
    long long v10 = [v6 applicationIconForBundleIdentifier:v9];
  }
  else
  {
    long long v10 = 0;
  }
  long long v11 = [(SBHomeScreenController *)self _currentMainDisplayLayoutState];
  uint64_t v12 = [v11 unlockedEnvironmentMode];

  if ((unint64_t)[v7 count] < 2)
  {
    if (v10)
    {
      if (v12 == 3) {
        uint64_t v22 = 4;
      }
      else {
        uint64_t v22 = 6;
      }
      [v8 addNewIconToDesignatedLocation:v10 options:v22];
    }
  }
  else if (v12 != 3 && v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v7;
    uint64_t v25 = [v13 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v25)
    {
      uint64_t v14 = *(void *)v32;
      v26 = v13;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v13);
          }
          uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          int v17 = [v6 applicationIconsForBundleIdentifier:v16];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v28;
            while (2)
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v28 != v20) {
                  objc_enumerationMutation(v17);
                }
                if ([v8 isDisplayingIcon:*(void *)(*((void *)&v27 + 1) + 8 * j)])
                {

                  id v23 = SBLogIconController();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v36 = v9;
                    _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Skipping revealing added/modified icon: %@", buf, 0xCu);
                  }

                  goto LABEL_31;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          id v13 = v26;
          uint64_t v14 = v24;
        }
        uint64_t v25 = [v26 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v25);
    }

    [v8 scrollToIconListContainingIcon:v10 animate:1];
  }
LABEL_31:
}

- (id)featureIntroductionItemForWidgetSetupAtLocation:(unint64_t)a3
{
  uint64_t v4 = [(SBHomeScreenController *)self iconManager];
  uint64_t v5 = [v4 featureIntroductionManager];
  id v6 = [v5 featureIntroductionItemAtLocation:a3 withIdentifier:@"SBFeatureIntroductionLocationNone"];
  if ([v6 shouldSetupFeatureIntroductionAtLocations:a3]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)_beginDisablingAllOrientationChangesForReason:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMapTable objectForKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "objectForKey:");
  if (!v4)
  {
    uint64_t v4 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:v6];
    [(NSMapTable *)self->_deviceOrientationUpdateDeferralAssertionsByReason setObject:v4 forKey:v6];
  }
  uint64_t v5 = [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason objectForKey:v6];
  if (!v5)
  {
    uint64_t v5 = [[SBDisableActiveInterfaceOrientationChangeAssertion alloc] initWithReason:v6 nudgeOrientationOnInvalidate:0];
    [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason setObject:v5 forKey:v6];
  }
}

- (void)_endDisablingAllOrientationChangesForReason:(id)a3
{
  deviceOrientationUpdateDeferralAssertionsByReason = self->_deviceOrientationUpdateDeferralAssertionsByReason;
  id v5 = a3;
  id v7 = [(NSMapTable *)deviceOrientationUpdateDeferralAssertionsByReason objectForKey:v5];
  [(NSMapTable *)self->_deviceOrientationUpdateDeferralAssertionsByReason removeObjectForKey:v5];
  [v7 invalidate];
  id v6 = [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason objectForKey:v5];
  [(NSMapTable *)self->_activeInterfaceOrientationChangeDeferralAssertionsByReason removeObjectForKey:v5];

  [v6 invalidate];
}

- (unint64_t)bestListLayoutProviderLayoutOptions
{
  id v3 = +[SBDefaults localDefaults];
  uint64_t v4 = [v3 homeScreenDefaults];

  id v5 = +[SBDefaults localDefaults];
  id v6 = [v5 floatingDockDefaults];

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

- (id)rootFolder
{
  int v2 = [(SBHomeScreenController *)self model];
  id v3 = [v2 rootFolder];

  return v3;
}

- (SBRootFolderController)_rootFolderController
{
  int v2 = [(SBHomeScreenController *)self iconManager];
  id v3 = [v2 rootFolderController];

  return (SBRootFolderController *)v3;
}

- (SBFolderController)_openFolderController
{
  int v2 = [(SBHomeScreenController *)self iconManager];
  id v3 = [v2 openedFolderController];

  return (SBFolderController *)v3;
}

- (SBFolderController)_currentFolderController
{
  id v3 = [(SBHomeScreenController *)self _openFolderController];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBHomeScreenController *)self _rootFolderController];
  }
  id v6 = v5;

  return (SBFolderController *)v6;
}

- (void)_showInfoAlertIfNeeded:(BOOL)a3
{
  id v14 = [(SBHomeScreenController *)self alertItemsController];
  id v5 = +[SBDefaults localDefaults];
  id v6 = [v5 iconDefaults];
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
    unint64_t v10 = [(SBHomeScreenController *)self applicationPlaceholderController];
    int v9 = [v10 hasDownloadedStoreApplication];

    if (v7) {
      goto LABEL_7;
    }
  }
  long long v11 = [(SBHomeScreenController *)self iconManager];
  int v12 = [v11 isEditingAllowed] & ~v8 & v9;

  if (v12 == 1)
  {
    id v13 = objc_alloc_init(SBReorderInfoAlert);
    [v14 activateAlertItem:v13];
  }
LABEL_7:
}

- (void)handleHomeButtonTap
{
  id v3 = [(SBHomeScreenController *)self iconManager];
  uint64_t v4 = [(SBHomeScreenController *)self homeScreenViewController];
  if (![(SBHomeScreenController *)self areAnyIconViewContextMenusShowing])
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
    if ([(SBHomeScreenController *)self isMainDisplayLibraryViewVisible])
    {
      if (![(SBHomeScreenController *)self isModalAppLibrarySupported])
      {
        id v6 = [(SBHomeScreenController *)self overlayLibraryViewController];
        [v6 popPresentationState];
LABEL_35:

        goto LABEL_7;
      }
      id v6 = [(SBHomeScreenController *)self mainDisplayWindowScene];
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
      if ([(SBHomeScreenController *)self isTodayOverlaySpotlightVisible])
      {
        [(SBHomeScreenController *)self dismissTodayOverlaySpotlightAnimated:1];
        goto LABEL_7;
      }
      if ([(SBHomeScreenController *)self isTodayOverlayPresented])
      {
        [(SBHomeScreenController *)self dismissTodayOverlayAnimated:1];
        goto LABEL_7;
      }
      int v9 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)long long v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
      }

      kdebug_trace();
      [v3 animateToDefaultStateWithCompletionHandler:&__block_literal_global_123_0];
      id v6 = [v4 iconContentView];
      unint64_t v10 = [v6 window];
      char v7 = [v10 _eventRoutingScene];

      if (!v7) {
        goto LABEL_34;
      }
      int v8 = [MEMORY[0x1E4F42738] sharedApplication];
      [v8 _cancelAllEventsOfType:0 onEventRoutingScene:v7];
    }

    goto LABEL_34;
  }
  [(SBHomeScreenController *)self dismissAppIconForceTouchControllers:0];
LABEL_7:
}

uint64_t __45__SBHomeScreenController_handleHomeButtonTap__block_invoke()
{
  v0 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)int v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v2, 2u);
  }

  return kdebug_trace();
}

- (BOOL)allowsUninstall
{
  int v2 = [(SBHomeScreenController *)self _iconController];
  char v3 = [v2 allowsUninstall];

  return v3;
}

- (BOOL)isUninstallingSystemAppsRestricted
{
  int v2 = [(SBHomeScreenController *)self _iconController];
  char v3 = [v2 isUninstallingSystemAppsRestricted];

  return v3;
}

- (BOOL)isUninstallSupportedForAnyIcon
{
  int v2 = [(SBHomeScreenController *)self allowsUninstall];
  if (v2)
  {
    if ([MEMORY[0x1E4F42738] isRunningInStoreDemoMode])
    {
      char v3 = +[SBDefaults externalDefaults];
      uint64_t v4 = [v3 demoDefaults];
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
  if ([(SBHomeScreenController *)self isUninstallSupportedForAnyIcon]
    && [v4 isUninstallSupported])
  {
    if ([v4 isApplicationIcon])
    {
      char v5 = [v4 application];
      if ([v5 isSystemApplication]
        && [(SBHomeScreenController *)self isUninstallingSystemAppsRestricted])
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
  if ([(SBHomeScreenController *)self isAppLibrarySupported]
    && (SBIconLocationGroupContainsLocation() & 1) == 0)
  {
    if ([v6 isApplicationIcon] & 1) != 0 || (objc_msgSend(v6, "isFolderIcon"))
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v9 = [(SBHomeScreenController *)self iconManager];
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
  BOOL v7 = [(SBHomeScreenController *)self isHideSupportedForIcon:v6 inLocation:a4]
    || [(SBHomeScreenController *)self isUninstallSupportedForIcon:v6];

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
    BOOL v7 = [(SBHomeScreenController *)self mainDisplayWindowScene];
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
  v5[2] = __57__SBHomeScreenController_updateNumberOfRowsWithDuration___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:2 delay:v5 options:0 animations:a3 completion:0.0];
  id v4 = [(SBHomeScreenController *)self iconManager];
  [v4 layoutIconListsWithAnimationType:0 forceRelayout:0];
}

void __57__SBHomeScreenController_updateNumberOfRowsWithDuration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeScreenViewController];
  v1 = [v2 iconContentView];
  [v1 layoutIfNeeded];
}

- (void)_launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(SBHomeScreenController *)self delayedLaunchRequestTimer];
  [v10 invalidate];

  [(SBHomeScreenController *)self setDelayedLaunchRequestTimer:0];
  long long v11 = [(SBHomeScreenController *)self iconManager];
  int v12 = [v8 icon];
  id v13 = [v11 reasonToDisallowTapOnIconView:v8];
  if (v13)
  {
    [v11 clearHighlightedIcon];
    id v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v8;
      __int16 v39 = 2114;
      v40 = v13;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring launch from icon view: %@, reason: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    int64_t v32 = a5;
    id v34 = v9;
    uint64_t v15 = SBLogIcon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v8;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Initiating launch from icon view: %@", buf, 0xCu);
    }

    id v14 = [v8 _sbWindowScene];
    uint64_t v16 = [v14 switcherController];
    int v17 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v17 cancelEventsWithName:@"SBUIApplicationIconLaunchEventLabel"];

    uint64_t v18 = [MEMORY[0x1E4F624E0] sharedInstance];
    uint64_t v19 = [v16 toggleSwitcherEventName];
    [v18 cancelEventsWithName:v19];

    uint64_t v20 = [MEMORY[0x1E4F624E0] sharedInstance];
    long long v21 = [v16 activateSwitcherEventName];
    [v20 cancelEventsWithName:v21];

    uint64_t v22 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v22 emitEvent:10];

    id v23 = [(SBHomeScreenController *)self launchActivationSettingsForIconView:v8];
    long long v33 = v16;
    uint64_t v24 = [v16 windowManagementStyle];
    if ((v32 & 0x20000) != 0 && v24 == 2) {
      [v23 setFlag:1 forActivationSetting:73];
    }
    uint64_t v25 = objc_msgSend(v8, "location", v32);
    v26 = objc_alloc_init(SBIconLaunchContext);
    [(SBIconLaunchContext *)v26 setActivationSettings:v23];
    [(SBIconLaunchContext *)v26 setActions:v34];
    [(SBIconLaunchContext *)v26 setIconView:v8];
    if ([v12 isWidgetIcon])
    {
      [(SBHomeScreenController *)self _launchWidgetIcon:v12 fromLocation:v25 withContext:v26];
    }
    else
    {
      int v27 = [v12 performLaunchFromLocation:v25 context:v26];
      long long v28 = SBLogIcon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v27;
        _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Icon handled launch: %{BOOL}u", buf, 8u);
      }
    }
    long long v29 = (void *)MEMORY[0x1E4F624D8];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __72__SBHomeScreenController__launchFromIconView_withActions_modifierFlags___block_invoke;
    v35[3] = &unk_1E6AF4AC0;
    id v36 = v8;
    long long v30 = [v29 eventWithName:@"noteActivatingAppSuggestion" handler:v35];
    long long v31 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v31 executeOrAppendEvent:v30];

    id v9 = v34;
  }
}

void __72__SBHomeScreenController__launchFromIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) continuityInfo];
  if (v2)
  {
    v1 = +[SBAppSuggestionManager sharedInstance];
    [v1 noteActivatingForAppSuggestion:v2 fromSource:2];
  }
}

- (void)_launchWidgetIcon:(id)a3 fromLocation:(id)a4 withContext:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v10 activationSettings];
  int v12 = [v10 actions];

  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(SBActivationSettings);
  }
  id v14 = v13;
  uint64_t v15 = [v8 activeWidget];
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v25 = v12;
    v26 = v9;
    int v17 = [v15 extensionBundleIdentifier];
    uint64_t v18 = [v16 containerBundleIdentifier];
    uint64_t v19 = [(SBHomeScreenController *)self applicationController];
    uint64_t v20 = [v19 applicationWithBundleIdentifier:v18];

    SBLogIcon();
    long long v21 = (SBLockScreenUnlockRequest *)objc_claimAutoreleasedReturnValue();
    BOOL v22 = os_log_type_enabled(&v21->super, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412802;
        id v34 = v18;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        id v38 = v26;
        _os_log_impl(&dword_1D85BA000, &v21->super, OS_LOG_TYPE_INFO, "Launching application %@ from widget icon %@, location: %@", buf, 0x20u);
      }

      [(SBActivationSettings *)v14 setObject:v17 forActivationSetting:14];
      long long v21 = objc_alloc_init(SBLockScreenUnlockRequest);
      [(SBLockScreenUnlockRequest *)v21 setSource:24];
      [(SBLockScreenUnlockRequest *)v21 setIntent:3];
      [(SBLockScreenUnlockRequest *)v21 setName:@"Launch From Widget Icon Unlock"];
      [(SBLockScreenUnlockRequest *)v21 setWantsBiometricPresentation:1];
      id v23 = [(SBHomeScreenController *)self windowScene];
      [(SBLockScreenUnlockRequest *)v21 setWindowScene:v23];

      uint64_t v24 = [(SBHomeScreenController *)self lockScreenManager];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__SBHomeScreenController__launchWidgetIcon_fromLocation_withContext___block_invoke;
      v27[3] = &unk_1E6AFB668;
      v27[4] = self;
      id v28 = v20;
      id v29 = v8;
      id v30 = v26;
      long long v31 = v14;
      id v32 = v25;
      [v24 unlockWithRequest:v21 completion:v27];
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v18;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v26;
      _os_log_impl(&dword_1D85BA000, &v21->super, OS_LOG_TYPE_INFO, "Failed to launch application %@ from widget icon %@, location: %@", buf, 0x20u);
    }

    int v12 = v25;
    id v9 = v26;
  }
}

void __69__SBHomeScreenController__launchWidgetIcon_fromLocation_withContext___block_invoke(uint64_t a1, int a2)
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

  id v4 = [(SBHomeScreenController *)self iconManager];
  [v4 setEditing:0];

  char v5 = [(SBHomeScreenController *)self iconManager];
  [v5 cancelAllDrags];
}

- (void)noteViewCovered
{
  id v2 = [(SBHomeScreenController *)self iconManager];
  [v2 cancelAllFolderScrolling];
}

- (void)_lockScreenUIWillLock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  int v6 = [v5 isMainDisplayWindowScene];

  if (v6)
  {
    BOOL v7 = [(SBHomeScreenController *)self iconManager];
    [v7 setEditing:0];
    uint64_t v8 = objc_opt_class();
    id v9 = [v4 userInfo];
    id v10 = [v9 objectForKey:@"Animated"];
    long long v11 = SBSafeCast(v8, v10);

    uint64_t v24 = v11;
    uint64_t v12 = [v11 BOOLValue];
    [(SBHomeScreenController *)self dismissAppIconForceTouchControllers:0];
    [v7 dismissIconShareSheets];
    id v13 = [(SBHomeScreenController *)self homeScreenViewController];
    id v14 = [v13 presentedViewController];

    if (v14) {
      [v13 dismissViewControllerAnimated:v12 completion:0];
    }
    [(SBHomeScreenController *)self dismissTodayOverlayAnimated:v12];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v15 = [(id)SBApp windowSceneManager];
    uint64_t v16 = [v15 connectedWindowScenes];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v25 + 1) + 8 * i) modalLibraryController];
          if ([v21 isPresentingLibraryInForeground]) {
            [v21 dismissLibraryAnimated:v12 completion:0];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v18);
    }

    if (v12) {
      [v7 dismissModalInteractions];
    }
    else {
      [v7 dismissModalInteractionsImmediately];
    }
    BOOL v22 = [v7 focusModeManager];
    [v22 dismissAllFocusModePopovers];
    id v23 = [(SBHomeScreenController *)self _rootFolderController];
    objc_msgSend(v23, "setCurrentPageIndex:animated:", objc_msgSend(v23, "nearestIconPageIndex"), 0);
  }
}

- (unint64_t)_foldersInList:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SBHomeScreenController__foldersInList___block_invoke;
  v6[3] = &unk_1E6AFB690;
  v6[4] = &v7;
  [v3 enumerateFolderIconsUsingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__SBHomeScreenController__foldersInList___block_invoke(uint64_t result)
{
  return result;
}

- (id)currentAnimationContainer
{
  id v3 = [(SBHomeScreenController *)self _currentFolderController];
  unint64_t v4 = v3;
  if (!v3) {
    id v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (id)launchActionsForIconView:(id)a3
{
  id v3 = [a3 continuityInfo];
  unint64_t v4 = [v3 uniqueIdentifier];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42700]);
    int v6 = [v4 UUIDString];
    uint64_t v7 = [v3 activityType];
    uint64_t v8 = (void *)[v5 initWithIdentifier:v6 activityTypeIdentifier:v7 appSuggestion:v3];

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)launchURLForIconView:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 continuityInfo];
  id v5 = [v4 launchURL];
  int v6 = [v4 launchURLRequiresInboxCopy];
  uint64_t v7 = [v3 icon];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 application];
    uint64_t v10 = [v9 info];
    uint64_t v11 = [v10 documentInboxURL];

    uint64_t v12 = [v4 makeInboxCopyOfLaunchURLToInboxURL:v11];

    id v5 = (void *)v11;
    goto LABEL_3;
  }
  int v13 = [v7 isBookmarkIcon];

  if (v13)
  {
    uint64_t v8 = [v3 icon];
    id v14 = [v8 applicationToLaunch];
    uint64_t v9 = v14;
    if (!v14) {
      goto LABEL_4;
    }
    uint64_t v15 = [v14 info];
    if ([v15 supportsYttrium])
    {
      uint64_t v16 = [v8 webClip];
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

- (id)launchActivationSettingsForIconView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SBActivationSettings);
  int v6 = [(SBHomeScreenController *)self launchURLForIconView:v4];
  if (v6) {
    [(SBActivationSettings *)v5 setObject:v6 forActivationSetting:5];
  }
  uint64_t v7 = [v4 _sbWindowScene];
  uint64_t v8 = [v4 icon];
  uint64_t v9 = [v8 application];
  uint64_t v10 = v9;
  if (v9
    && [v9 restrictedToTheEmbeddedDisplayInChamois]
    && [v7 isExtendedDisplayWindowScene])
  {
    uint64_t v11 = [(id)SBApp windowSceneManager];
    uint64_t v12 = [v11 embeddedDisplayWindowScene];

    uint64_t v7 = (void *)v12;
  }
  [(SBActivationSettings *)v5 setObject:v7 forActivationSetting:69];

  return v5;
}

- (BOOL)allowsBadgingForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overrideBadgeNumberOrString];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [v4 applicationBundleID];
    if (!v7)
    {
      if ([v4 isBookmarkIcon])
      {
        uint64_t v8 = [v4 bookmark];
        uint64_t v7 = [v8 placeholderBundleIdentifier];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    BOOL v6 = [(SBHomeScreenController *)self _allowsBadgingForApplicationBundleIdentifier:v7];
  }
  return v6;
}

- (BOOL)_allowsBadgingForApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self iconManager];
  BOOL v6 = [v5 focusModeManager];
  uint64_t v7 = [v6 activeFocusMode];
  int v8 = [v7 showsOnlyAllowedApplicationBadges];
  int v9 = [v7 hidesOnlyDeniedApplicationBadges];
  if (v4)
  {
    int v10 = v9;
    uint64_t v11 = [(SBHomeScreenController *)self _iconController];
    uint64_t v12 = [v11 displayIDsWithBadgingEnabled];

    char v13 = [v12 containsObject:v4];
    if (v8)
    {
      id v14 = [v7 allowedApplicationBundleIdentifiers];
      LOBYTE(v15) = [v14 containsObject:v4];
    }
    else
    {
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v14 = [v7 deniedApplicationBundleIdentifiers];
      int v15 = [v14 containsObject:v4] ^ 1;
    }
    v13 &= v15;

    goto LABEL_8;
  }
  char v13 = v8 ^ 1;
LABEL_9:

  return v13;
}

- (double)minimumHomeScreenScale
{
  id v2 = [(SBHomeScreenController *)self mainDisplayWindowScene];
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

- (void)_mainSwitcherCreated:(id)a3
{
  id v3 = [(SBHomeScreenController *)self iconManager];
  [v3 minimumHomeScreenScaleDidChange];
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
  if ([(SBHomeScreenController *)self isTodayOverlayPresented]) {
    return 1;
  }
  return [(SBHomeScreenController *)self isMainDisplayLibraryViewVisible];
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
    uint64_t v7 = dispatch_group_create();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 1;
    dispatch_group_enter(v7);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke;
    v34[3] = &unk_1E6AFB6B8;
    id v36 = v37;
    int v8 = v7;
    __int16 v35 = v8;
    int v9 = (void *)MEMORY[0x1D948C7A0](v34);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 1;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2;
    v29[3] = &unk_1E6AFB6B8;
    long long v31 = v32;
    int v10 = v8;
    uint64_t v30 = v10;
    uint64_t v11 = (void *)MEMORY[0x1D948C7A0](v29);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3;
    block[3] = &unk_1E6AFB6E0;
    id v26 = v6;
    long long v27 = v37;
    long long v28 = v32;
    dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v37, 8);
    if (![(SBHomeScreenController *)self isModalAppLibrarySupported])
    {
      if (v10) {
        dispatch_group_enter(v10);
      }
      goto LABEL_16;
    }
  }
  else
  {
    int v9 = 0;
    int v10 = 0;
    uint64_t v11 = 0;
    if (![(SBHomeScreenController *)self isModalAppLibrarySupported])
    {
LABEL_16:
      [(SBHomeScreenController *)self dismissLibraryAnimated:v4 completion:v11];
      goto LABEL_17;
    }
  }
  uint64_t v20 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [(id)SBApp windowSceneManager];
  char v13 = [v12 connectedWindowScenes];

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
        uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v10) {
          dispatch_group_enter(v10);
        }
        uint64_t v19 = [v18 modalLibraryController];
        [v19 dismissLibraryAnimated:v4 completion:v11];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v39 count:16];
    }
    while (v15);
  }

  int v9 = v20;
LABEL_17:
  [(SBHomeScreenController *)self dismissTodayOverlayAnimated:v4 completion:v9];
}

void __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke(uint64_t a1, char a2)
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

void __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2(uint64_t a1, char a2)
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

uint64_t __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3(void *a1)
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
  if ([(SBHomeScreenController *)self isTodayOverlayPresented])
  {
    [(SBHomeScreenController *)self dismissHomeScreenOverlayControllerAnimated:v4 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }
}

- (BOOL)isTodayOverlaySpotlightVisible
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(SBHomeScreenController *)self todayViewController];
  double v5 = SBSafeCast(v3, v4);

  LOBYTE(v4) = [v5 isSpotlightVisible];
  return (char)v4;
}

- (void)dismissTodayOverlaySpotlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(SBHomeScreenController *)self todayViewController];
  SBSafeCast(v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [v7 dismissSpotlightAnimated:v3];
}

- (void)dismissHomeScreenOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBHomeScreenController *)self homeScreenOverlayController];
  if ([v7 isPresented])
  {
    if ([(SBHomeScreenController *)self isBackdropVisible]) {
      [(SBHomeScreenController *)self beginRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
    }
    [v7 setShouldUseReducedMotionAnimation:UIAccessibilityIsReduceMotionEnabled()];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__SBHomeScreenController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke;
    v8[3] = &unk_1E6AFA2A0;
    v8[4] = self;
    id v9 = v7;
    id v10 = v6;
    [v9 dismissAnimated:v4 completionHandler:v8];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __80__SBHomeScreenController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke(uint64_t a1)
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
  uint64_t v5 = [(SBHomeScreenController *)self homeScreenOverlayController];
  if ([v5 isPresented])
  {
    if ([(SBHomeScreenController *)self isBackdropVisible])
    {
      [(SBHomeScreenController *)self beginRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke;
      v7[3] = &unk_1E6AF53F8;
      v7[4] = self;
      [v4 notifyWhenInteractionChangesUsingBlock:v7];
    }
    [v5 dismissUsingViewControllerTransitionCoordinator:v4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2;
    v6[3] = &unk_1E6AF53F8;
    v6[4] = self;
    [v4 animateAlongsideTransition:v6 completion:0];
  }
}

uint64_t __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRequiringLiveBackdropViewForReason:@"SBIconControllerLiveBackdropForDismissingTodayViewReason"];
}

void __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2(uint64_t a1)
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
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    temporaryWidgetIntents = self->_temporaryWidgetIntents;
    self->_temporaryWidgetIntents = v11;
  }
  char v13 = (void *)[[NSString alloc] initWithFormat:@"%@^%@", v9, v10];
  if (v8)
  {
    id v25 = 0;
    uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v25];
    id v15 = v25;
    if (!v14)
    {
      char v17 = SBLogWidgetIntent();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v8 _indexingHash];
        *(_DWORD *)buf = 138544130;
        id v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        long long v31 = v13;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_error_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_ERROR, "Error archiving temporary intent widget unique identifier '%{public}@/%lld/%@': %@", buf, 0x2Au);
      }
      goto LABEL_17;
    }
    [(NSMutableDictionary *)self->_temporaryWidgetIntents setObject:v14 forKey:v13];
    uint64_t v16 = [v14 length];
    char v17 = SBLogWidgetIntent();
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
        uint64_t v20 = "Saving temporary intent for widget unique identifier '%{public}@'/%lld";
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
      uint64_t v20 = "Saving 0-length temporary intent for widget unique identifier '%{public}@'";
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
    long long v31 = v13;
    _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Removing temporary intent for widget unique identifier '%{public}@'/%lld/%@", buf, 0x20u);
  }

  [(NSMutableDictionary *)self->_temporaryWidgetIntents removeObjectForKey:v13];
LABEL_18:
}

- (id)temporaryIntentDataForIconWithIdentifier:(id)a3 widgetUniqueIdentifier:(id)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithFormat:@"%@^%@", v8, v7];

  id v10 = [(NSMutableDictionary *)self->_temporaryWidgetIntents objectForKey:v9];
  uint64_t v11 = v10;
  if (v10) {
    [v10 length];
  }

  return v11;
}

- (BOOL)allowsHomeScreenOverlay
{
  BOOL v3 = [(id)SBApp userSessionController];
  BOOL v4 = [v3 sessionType] != 2;

  uint64_t v5 = [(SBHomeScreenController *)self iconManager];
  LOBYTE(v3) = v4 & ~[v5 isFolderPageManagementUIVisible];

  return (char)v3;
}

- (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4
{
  id v7 = [(SBHomeScreenController *)self iconManager];
  id v20 = [v7 listLayoutProvider];

  id v8 = [v20 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
  id v9 = [(SBHomeScreenController *)self homeScreenViewController];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  [(SBHomeScreenController *)self homeScreenViewController];
  v19 = uint64_t v5 = v4 + 2;
  ((void (*)(void (**)(id, void *)))v4[2])(v4);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__SBHomeScreenController_enumerateTintableViewControllersUsingBlock___block_invoke;
  v24[3] = &unk_1E6AFB708;
  id v6 = v4;
  id v25 = v6;
  double v18 = self;
  [(SBHomeScreenController *)self _enumerateTodayViewControllers:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(id)SBApp windowSceneManager];
  id v8 = [v7 connectedWindowScenes];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v14 = [v13 modalLibraryController];
        double v15 = [v14 libraryViewController];
        if (v15) {
          (*v5)(v6, v15);
        }
        double v16 = [v13 floatingDockController];
        double v17 = [v16 viewController];
        if (v17) {
          (*v5)(v6, v17);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  if (v18->_overlayLibraryViewController) {
    ((void (*)(void (**)(id, void *)))*v5)(v6);
  }
}

uint64_t __69__SBHomeScreenController_enumerateTintableViewControllersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateHomeScreenTraitOverridesForViewController:(id)a3
{
  id v4 = [a3 traitOverrides];
  [(SBHomeScreenController *)self updateHomeScreenTraitOverridesForTraitOverrides:v4];
}

- (void)updateHomeScreenTraitOverridesForWindowScene:(id)a3
{
  id v4 = [a3 traitOverrides];
  [(SBHomeScreenController *)self updateHomeScreenTraitOverridesForTraitOverrides:v4];
}

- (void)updateHomeScreenTraitOverridesForTraitOverrides:(id)a3
{
  iconManager = self->_iconManager;
  id v5 = a3;
  id v7 = [(SBHomeScreenController *)self iconStylePickerConfigurationForIconManager:iconManager];
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
  BOOL v3 = self;
  [v4 removeTrait:v3];
}

- (id)currentIconImageStyleConfiguration
{
  uint64_t v2 = [(SBHomeScreenController *)self rootViewController];
  BOOL v3 = [v2 traitCollection];
  id v4 = objc_msgSend(MEMORY[0x1E4F42F80], "sbh_iconImageStyleConfigurationFromTraitCollection:", v3);

  return v4;
}

- (id)currentIconImageAppearance
{
  uint64_t v2 = [(SBHomeScreenController *)self rootViewController];
  BOOL v3 = [v2 traitCollection];
  id v4 = objc_msgSend(MEMORY[0x1E4F42F80], "sbh_iconImageAppearanceFromTraitCollection:", v3);

  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBHomeScreenController *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)createFloatingDockControllerForWindowScene:(id)a3
{
  id v4 = a3;
  if (+[SBFloatingDockController isFloatingDockSupported])
  {
    id v5 = [[SBFloatingDockController alloc] initWithWindowScene:v4 homeScreenContextProvider:self];
    [(SBHomeScreenController *)self _configureFloatingDockController:v5 forWindowScene:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_configureFloatingDockController:(id)a3 forWindowScene:(id)a4
{
  id v6 = a3;
  [v6 registerForWindowScene:a4];
  [(SBHomeScreenController *)self notifyFloatingDockControllerObserversDidRegister:v6];
}

- (void)addFloatingDockControllerObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:1524 description:@"cannot be observed by a nil object"];

    id v5 = 0;
  }
  if (![(NSHashTable *)self->_floatingDockControllerObservers containsObject:v5])
  {
    floatingDockControllerObservers = self->_floatingDockControllerObservers;
    if (!floatingDockControllerObservers)
    {
      id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
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
    [v6 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:1534 description:@"cannot be observed by a nil object"];

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
  BOOL v3 = [(SBHomeScreenController *)self _currentFolderController];
  id v4 = [(SBHomeScreenController *)self homeScreenOverlayController];
  id v5 = [(SBHomeScreenController *)self mainDisplayWindowScene];
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
  id v14 = [(SBHomeScreenController *)self searchPresentableViewController];
  [v14 invalidateBackgroundView];
  [v14 invalidateSearchAffordanceView];
  uint64_t v4 = [(SBHomeScreenController *)self scrollAccessoryAuxiliaryView];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [(SBHomeScreenController *)self searchPresenter];
    int v7 = [v6 isPresenting];

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [(SBHomeScreenController *)self _rootFolderController];
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
  BOOL v9 = [(SBHomeScreenController *)self isModalAppLibrarySupported];
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
      double v15 = [(SBHomeScreenController *)self iconManager];
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
  BOOL v17 = [(SBHomeScreenController *)self areHomeScreenIconsOccluded];
  uint64_t v8 = v41;
  if (!v17)
  {
    int v18 = [v41 isMainDisplayWindowScene];
    uint64_t v8 = v41;
    if (v18)
    {
      BOOL v19 = [(SBHomeScreenController *)self _currentFolderController];
      long long v20 = [(SBHomeScreenController *)self _rootFolderController];
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
          BOOL v25 = [(SBHomeScreenController *)self isTodayOverlayPresented];
          if (a4 != 1 || v25 || v22)
          {
            if ((a4 == 4 || a4 == 2) && v25)
            {
              char v24 = 1;
              [(SBHomeScreenController *)self dismissTodayOverlayAnimated:1];
            }
            else
            {
              char v24 = 0;
            }
          }
          else
          {
            id v26 = [(SBHomeScreenController *)self iconManager];
            [(SBHomeScreenController *)self presentTodayOverlayForIconManager:v26];

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
            [(SBHomeScreenController *)self presentLibraryFromOverlayControllerAnimated:1 completion:0];
            goto LABEL_78;
          }
          if ((a4 == 4 || a4 == 1) && v14)
          {
            [(SBHomeScreenController *)self dismissLibraryAnimated:1 completion:0];
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
            __int16 v37 = [v19 folder];
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
        uint64_t v39 = [MEMORY[0x1E4F42948] currentDevice];
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
    BOOL v3 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleEditingGesture_];
    longPressToEditGestureRecognizer = self->_longPressToEditGestureRecognizer;
    self->_longPressToEditGestureRecognizer = v3;

    [(UILongPressGestureRecognizer *)self->_longPressToEditGestureRecognizer setDelegate:self];
    id v5 = [(SBHomeScreenController *)self homeScreenViewController];
    uint64_t v6 = [v5 view];
    [v6 addGestureRecognizer:self->_longPressToEditGestureRecognizer];
  }
  if (!self->_tapToEndEditingGestureRecognizer)
  {
    int v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleEditingGesture_];
    tapToEndEditingGestureRecognizer = self->_tapToEndEditingGestureRecognizer;
    self->_tapToEndEditingGestureRecognizer = v7;

    [(UITapGestureRecognizer *)self->_tapToEndEditingGestureRecognizer setDelegate:self];
    BOOL v9 = [(SBHomeScreenController *)self homeScreenViewController];
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
  uint64_t v4 = [(SBHomeScreenController *)self iconManager];
  if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v8)
  {
    if ([(UITapGestureRecognizer *)v8 state] == 1)
    {
      id v5 = [v4 iconEditingFeedbackBehavior];
      uint64_t v6 = [(SBHomeScreenController *)self homeScreenViewController];
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

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6
    || self->_tapToEndEditingGestureRecognizer == v6)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 1;
    BOOL v9 = [(SBHomeScreenController *)self iconManager];
    int v10 = [v9 isEditing];
    int v11 = [v9 isFolderPageManagementUIVisible];
    int v12 = [v9 isShowingIconContextMenu];
    if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6)
    {
      *((unsigned char *)v42 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = (v10 | v11 | v12) ^ 1;
    }
    else if (self->_tapToEndEditingGestureRecognizer == v6)
    {
      if ((v10 ^ 1 | v11 | v12))
      {
        *((unsigned char *)v42 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      }
      else
      {
        char v13 = [(SBHomeScreenController *)self iconDragManager];
        char v14 = [v13 isTrackingUserActiveIconDrags];
        *((unsigned char *)v42 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v14 ^ 1;
      }
    }
    if (*((unsigned char *)v42 + 24))
    {
      if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer != v6) {
        goto LABEL_15;
      }
      uint64_t v15 = objc_opt_class();
      int v16 = [(SBHomeScreenController *)self _rootFolderController];
      BOOL v17 = [v16 contentView];
      int v18 = SBSafeCast(v15, v17);

      if (v18)
      {
        [v18 enterEditingTouchRect];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        [v7 locationInView:v18];
        v45.x = v27;
        v45.y = v28;
        v46.origin.x = v20;
        v46.origin.y = v22;
        v46.size.width = v24;
        v46.size.height = v26;
        *((unsigned char *)v42 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = CGRectContainsPoint(v46, v45);
      }

      if (*((unsigned char *)v42 + 24))
      {
LABEL_15:
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __63__SBHomeScreenController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        void v37[3] = &unk_1E6AFB7C0;
        id v29 = v7;
        id v38 = v29;
        id v30 = v9;
        id v39 = v30;
        char v40 = &v41;
        [v30 enumerateDisplayedIconViewsUsingBlock:v37];

        if (*((unsigned char *)v42 + 24) && [v30 isOverlayTodayViewVisible])
        {
          char v31 = [(SBHomeScreenController *)self todayViewController];
          BOOL v32 = [(SBHomeScreenController *)self _shouldTodayViewController:v31 receiveTouch:v29];
          *((unsigned char *)v42 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v32;
        }
      }
    }
    if (*((unsigned char *)v42 + 24) && [v9 isMainDisplayLibraryViewVisible])
    {
      char v33 = [(SBHomeScreenController *)self mainDisplayWindowScene];
      uint64_t v34 = [(SBHomeScreenController *)self libraryViewControllerForWindowScene:v33];

      char v35 = [v34 isPresentingSearch];
      *((unsigned char *)v42 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v35 ^ 1;
    }
    BOOL v8 = *((unsigned char *)v42 + 24) != 0;

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

void __63__SBHomeScreenController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a3 = 1;
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
        double v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_isKindOfClass(),
        v7,
        (v8 & 1) != 0))
  {
    id v9 = [v6 view];
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
  return [(SBHomeScreenController *)self iconOcclusionReasons] != 0;
}

- (void)addIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(SBHomeScreenController *)self iconOcclusionReasons];
  if ((a3 & ~v7) != 0)
  {
    [(SBHomeScreenController *)self setIconOcclusionReasons:v7 | a3];
    if (v4)
    {
      [(SBHomeScreenController *)self _updateVisibleIconsAfterOcclusionChange];
    }
  }
}

- (void)removeIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(SBHomeScreenController *)self iconOcclusionReasons];
  if ((v7 & a3) != 0)
  {
    [(SBHomeScreenController *)self setIconOcclusionReasons:v7 & ~a3];
    if (v4)
    {
      [(SBHomeScreenController *)self _updateVisibleIconsAfterOcclusionChange];
    }
  }
}

- (void)_updateVisibleIconsAfterOcclusionChange
{
  unint64_t v4 = [(SBHomeScreenController *)self iconOcclusionReasons];
  BOOL v5 = (v4 & 0x12) != 0;
  if ((v4 & 0x12) != 0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v4 != 0;
  }
  id v9 = [(SBHomeScreenController *)self iconManager];
  [v9 setContentVisibility:v6];
  unint64_t v7 = [(SBHomeScreenController *)self homeScreenOverlayController];
  [v7 setContentVisibility:v6];
  char v8 = NSStringFromSelector(a2);
  [(SBHomeScreenController *)self setWallpaperAnimationDisabled:v5 forReason:v8];
}

- (id)markIconsOccludedForReason:(id)a3
{
  id v4 = a3;
  if (!self->_iconsOccludedAssertions)
  {
    BOOL v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconsOccludedAssertions = self->_iconsOccludedAssertions;
    self->_iconsOccludedAssertions = v5;
  }
  unint64_t v7 = [[SBIconsOccludedAssertion alloc] initWithInvalidator:self reason:v4];
  [(NSHashTable *)self->_iconsOccludedAssertions addObject:v7];
  [(SBHomeScreenController *)self addIconOcclusionReason:64 updateVisibleIcons:1];

  return v7;
}

- (void)removeIconsOccludedAssertion:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_iconsOccludedAssertions, "containsObject:"))
  {
    [(NSHashTable *)self->_iconsOccludedAssertions removeObject:v4];
    if (![(NSHashTable *)self->_iconsOccludedAssertions count]) {
      [(SBHomeScreenController *)self removeIconOcclusionReason:64 updateVisibleIcons:1];
    }
  }
}

- (void)_coverSheetWillPresent:(id)a3
{
  id v4 = [(SBHomeScreenController *)self iconManager];
  [v4 setEditing:0];

  id v5 = [(SBHomeScreenController *)self iconManager];
  [v5 cancelAllDrags];
}

- (void)_coverSheetDidPresent:(id)a3
{
}

- (void)_controlCenterWillPresent:(id)a3
{
  if ([(SBHomeScreenController *)self _controlCenterIsOnTheSameWindowScene])
  {
    [(SBHomeScreenController *)self addIconOcclusionReason:4 updateVisibleIcons:1];
    id v4 = [(SBHomeScreenController *)self iconManager];
    [v4 setEditing:0];

    id v5 = [(SBHomeScreenController *)self iconManager];
    [v5 cancelAllDrags];
  }
}

- (void)_controlCenterWillDismiss:(id)a3
{
  if ([(SBHomeScreenController *)self _controlCenterIsOnTheSameWindowScene])
  {
    [(SBHomeScreenController *)self removeIconOcclusionReason:4 updateVisibleIcons:1];
  }
}

- (BOOL)_controlCenterIsOnTheSameWindowScene
{
  id v2 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  BOOL v3 = +[SBControlCenterController sharedInstanceIfExists];
  id v4 = [v3 _controlCenterWindow];
  uint64_t v5 = [v4 _sbWindowScene];
  uint64_t v6 = (void *)v5;
  if (v5) {
    unint64_t v7 = (void *)v5;
  }
  else {
    unint64_t v7 = v2;
  }
  id v8 = v7;

  return v2 == v8;
}

- (void)_policyAggregatorCapabilitiesDidChange:(id)a3
{
  id v5 = [(SBHomeScreenController *)self policyAggregator];
  if (([v5 allowsCapability:23] & 1) == 0) {
    [(SBHomeScreenController *)self dismissTodayOverlay];
  }
  if (([v5 allowsCapability:17] & 1) == 0)
  {
    id v4 = [(SBHomeScreenController *)self iconManager];
    [v4 setEditing:0];
  }
}

- (void)setModel:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (SBIconModel *)a3;
  if (self->_iconModel != v5)
  {
    uint64_t v6 = [(SBHomeScreenController *)self iconManager];
    unint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *MEMORY[0x1E4FA66F0];
    [v7 removeObserver:self name:*MEMORY[0x1E4FA66F0] object:self->_iconModel];
    id v9 = [(SBHomeScreenController *)self overlayLibraryViewController];
    [v9 invalidate];

    [(SBHomeScreenController *)self setOverlayLibraryViewController:0];
    [v6 setOverlayLibraryViewController:0];
    [(SBHomeScreenController *)self setHomeScreenOverlayController:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    CGPoint v11 = SBLogIcon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SBHomeScreenController setModel:](WeakRetained, v11);
    }

    objc_storeStrong((id *)&self->_iconModel, a3);
    CGRect v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = v12;

    [v6 setIconModel:v5];
    [v7 addObserver:self selector:sel__iconModelDidLayout_ name:v8 object:self->_iconModel];
    char v14 = [(SBHIconModel *)self->_iconModel rootFolder];

    if (v14) {
      [(SBHomeScreenController *)self _rootFolderDidChange];
    }
    if (![(SBHomeScreenController *)self isAppLibrarySupported]) {
      goto LABEL_11;
    }
    uint64_t v15 = [(SBHomeScreenController *)self iconManager];

    if (!v15 || [(SBHomeScreenController *)self isModalAppLibrarySupported]) {
      goto LABEL_11;
    }
    int v16 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    BOOL v17 = [(SBHomeScreenController *)self _setUpLibraryViewControllerForWindowScene:v16];
    [(SBHomeScreenController *)self setOverlayLibraryViewController:v17];
    int v18 = [(SBHomeScreenController *)self iconManager];
    [v18 setOverlayLibraryViewController:v17];

    while (1)
    {

LABEL_11:
      if (![(NSMutableSet *)self->_delayedStyleWallpaperEffectViews count]) {
        break;
      }
      double v19 = self->_delayedStyleWallpaperEffectViews;
      CGFloat v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      double v21 = self->_delayedStyleWallpaperEffectViews;
      self->_delayedStyleWallpaperEffectViews = v20;

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      int v16 = v19;
      uint64_t v22 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v28;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v28 != v24) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * v25++) setStyle:29];
          }
          while (v23 != v25);
          uint64_t v23 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v23);
      }
    }
    CGFloat v26 = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = 0;
  }
}

- (void)_showsBadgesInAppLibraryDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[SBDefaults localDefaults];
  id v4 = [v3 homeScreenDefaults];
  uint64_t v5 = [v4 showsBadgesInAppLibrary];

  uint64_t v6 = [(SBHomeScreenController *)self _libraryViewControllers];
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

- (void)_iconModelDidChange:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 model];
  [(SBHomeScreenController *)self setModel:v4];
}

- (void)addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction
{
  id v8 = [(SBHomeScreenController *)self iconManager];
  BOOL v3 = +[SBDefaults localDefaults];
  id v4 = [v3 homeScreenDefaults];

  int v5 = [v8 deviceTypeSupportModalWidgetIntroduction];
  if (v5)
  {
    uint64_t v6 = [(SBHomeScreenController *)self alertItemsController];
    [v6 setForceAlertsToPend:1 forReason:@"SBHomeScreenWidgetDiscoverabilityIntroduction"];
  }
  if ([v8 addDefaultWidgetsToHomeScreen])
  {
    [v8 scrollToDefaultWidgets];
    [v4 setShouldAddDefaultWidgetsToHomeScreen:0];
    uint64_t v7 = [(SBHomeScreenController *)self iconManager];
    [v7 disableUserInteractionForWidgetDiscoverability];
LABEL_9:

    goto LABEL_10;
  }
  if ([v8 rootFolderContainsWidgets]) {
    [v4 setShouldAddDefaultWidgetsToHomeScreen:0];
  }
  if (v5)
  {
    uint64_t v7 = [(SBHomeScreenController *)self alertItemsController];
    [v7 setForceAlertsToPend:0 forReason:@"SBHomeScreenWidgetDiscoverabilityIntroduction"];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)obtainProactiveSecondPageWidgetSuggestion
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(SBHomeScreenController *)self iconManager];
  BOOL v3 = [v2 widgetExtensionProvider];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FA6388]) initWithKind:@"com.apple.tv" extensionBundleIdentifier:@"com.apple.tv.TVWidgetExtension"];
  uint64_t v5 = objc_msgSend(v3, "sbh_descriptorForWidgetIdentifiable:", v4);
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v2 setDefaultSecondPageWidgetDescriptors:v8];

    [v2 setDefaultSecondPageWidgetSizeClass:*MEMORY[0x1E4FA6520]];
  }
}

- (void)updateDefaultFirstPageWidgetDescriptors:(id)a3 withSizeClass:(id)a4 andGridCellInfoOptions:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SBHomeScreenController *)self iconManager];
  [v10 setDefaultFirstPageWidgetDescriptors:v9];

  [v10 setDefaultFirstPageWidgetSizeClass:v8];
  [v10 setGridCellInfoOptionsForInsertingDefaultWidgets:a5];
}

- (void)displayFeatureIntroductionItem:(id)a3 atLocation:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 shouldDisplayFeatureIntroductionAtLocations:a4])
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = [v6 featureIntroductionIdentifier];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 shouldDeferAlertsAtLocations:a4])
    {
      *((unsigned char *)v14 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      id v8 = [(SBHomeScreenController *)self alertItemsController];
      [v8 setForceAlertsToPend:1 forReason:v7];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![v6 shouldPauseUserInteractionAtLocations:a4])
      {
        goto LABEL_9;
      }
      id v8 = [(SBHomeScreenController *)self iconManager];
      [v8 disableUserInteractionForWidgetDiscoverability];
    }

LABEL_9:
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __68__SBHomeScreenController_displayFeatureIntroductionItem_atLocation___block_invoke;
    v10[3] = &unk_1E6AF6380;
    long long v12 = &v13;
    v10[4] = self;
    id v9 = v7;
    id v11 = v9;
    [v6 displayFeatureIntroductionAtLocations:a4 presentCompletion:0 dismissCompletion:v10];

    _Block_object_dispose(&v13, 8);
  }
}

void __68__SBHomeScreenController_displayFeatureIntroductionItem_atLocation___block_invoke(uint64_t a1)
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
  uint64_t v5 = [(SBHomeScreenController *)self iconManager];
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
        [(SBHomeScreenController *)self displayFeatureIntroductionItem:*(void *)(*((void *)&v13 + 1) + 8 * v12++) atLocation:a3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_unlockAnimationDidFinish:(id)a3
{
  id v5 = [(SBHomeScreenController *)self iconManager];
  id v4 = [v5 focusModeManager];
  [v4 updateFocusModePopoverVisibility];
  [(SBHomeScreenController *)self displayFeatureIntroductionsAtLocation:4];
}

- (void)_rootFolderDidChange
{
  id v14 = [(SBHomeScreenController *)self iconManager];
  BOOL v3 = [(SBHomeScreenController *)self model];
  id v4 = [v3 rootFolder];
  id v5 = [(id)SBApp userSessionController];
  uint64_t v6 = [v5 sessionType];

  if (v6 == 2) {
    [v14 removeWidgetIconsFromHomeScreen];
  }
  uint64_t v7 = [v4 todayList];
  id v8 = [(SBHomeScreenController *)self todayViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(SBHomeScreenController *)self todayViewController];
    [v10 setRootFolder:v4];
  }
  else
  {
    if (!v14) {
      goto LABEL_9;
    }
    id v10 = [(SBHomeScreenController *)self _newTodayViewControllerWithIconManager:v14 iconListModel:v7 rootFolder:v4 location:1];
    [(SBHomeScreenController *)self setTodayViewController:v10];
    if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled]) {
      [(SBHIconManager *)self->_iconManager setOverlayTodayViewController:v10];
    }
  }

LABEL_9:
  [(SBHomeScreenController *)self _setupOverlayLibraryViewController];
  uint64_t v11 = [(SBHomeScreenController *)self coverSheetTodayViewController];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    id v13 = [(SBHomeScreenController *)self coverSheetTodayViewController];
    [v13 setRootFolder:v4];
  }
  else
  {
    if (!v14) {
      goto LABEL_14;
    }
    id v13 = [(SBHomeScreenController *)self _newTodayViewControllerWithIconManager:v14 iconListModel:v7 rootFolder:v4 location:2];
    [(SBHomeScreenController *)self setCoverSheetTodayViewController:v13];
  }

LABEL_14:
  [(SBHomeScreenController *)self updateRootFolderWithCurrentDoNotDisturbState];
  [v4 addFolderObserver:self];
}

- (void)_makeTodayViewControllers
{
  id v10 = [(SBHomeScreenController *)self iconManager];
  BOOL v3 = [(SBHomeScreenController *)self model];
  id v4 = [v3 rootFolder];
  id v5 = [v4 todayList];
  uint64_t v6 = [(SBHomeScreenController *)self todayViewController];

  if (!v6)
  {
    id v7 = [(SBHomeScreenController *)self _newTodayViewControllerWithIconManager:v10 iconListModel:v5 rootFolder:v4 location:1];
    [(SBHomeScreenController *)self setTodayViewController:v7];
    if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled]) {
      [(SBHIconManager *)self->_iconManager setOverlayTodayViewController:v7];
    }
  }
  id v8 = [(SBHomeScreenController *)self coverSheetTodayViewController];

  if (!v8)
  {
    id v9 = [(SBHomeScreenController *)self _newTodayViewControllerWithIconManager:v10 iconListModel:v5 rootFolder:v4 location:2];
    [(SBHomeScreenController *)self setCoverSheetTodayViewController:v9];
  }
}

- (void)_rebuildTodayViewControllers
{
  [(SBHomeScreenController *)self setTodayViewController:0];
  [(SBHomeScreenController *)self setCoverSheetTodayViewController:0];
  [(SBHomeScreenController *)self _makeTodayViewControllers];
}

- (void)_enumerateTodayViewControllers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SBHomeScreenController *)self todayViewController];

    if (v5)
    {
      id v5 = objc_opt_new();
      uint64_t v6 = [(SBHomeScreenController *)self todayViewController];
      objc_msgSend(v5, "bs_safeAddObject:", v6);
    }
    id v7 = [(SBHomeScreenController *)self coverSheetTodayViewController];

    if (v7)
    {
      if (!v5) {
        id v5 = objc_opt_new();
      }
      id v8 = [(SBHomeScreenController *)self coverSheetTodayViewController];
      objc_msgSend(v5, "bs_safeAddObject:", v8);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBHomeScreenController__enumerateTodayViewControllers___block_invoke;
    v9[3] = &unk_1E6AFB928;
    id v10 = v4;
    [v5 enumerateObjectsUsingBlock:v9];
  }
}

uint64_t __57__SBHomeScreenController__enumerateTodayViewControllers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)iconsSnapToGrid
{
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() == 2;
  }
  BOOL v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == 1;

  return v2;
}

- (BOOL)isAppLibrarySupported
{
  return 1;
}

- (BOOL)isModalAppLibrarySupported
{
  BOOL v2 = [(SBHomeScreenController *)self isAppLibrarySupported];
  if (v2)
  {
    LOBYTE(v2) = +[SBFloatingDockController isFloatingDockSupported];
  }
  return v2;
}

- (BOOL)isAppLibraryAllowed
{
  if (![(SBHomeScreenController *)self isAppLibrarySupported]) {
    return 0;
  }
  if ([(id)SBApp homeScreenRotationStyle] == 1) {
    return 1;
  }
  id v4 = [(SBHomeScreenController *)self homeScreenViewController];
  BOOL v3 = (unint64_t)([v4 orientation] - 5) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (id)createModalLibraryControllerForWindowScene:(id)a3
{
  id v5 = a3;
  if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
  {
    if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
    {
      uint64_t v6 = [(SBHomeScreenController *)self _iconController];
      id v7 = (id)[v6 createModalLibraryControllerForWindowScene:v5];
    }
    id v8 = [v5 floatingDockController];
    if (!v8)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:2217 description:@"floating dock controller must exist in order to create a modal library controller"];
    }
    id v9 = [(SBHomeScreenController *)self iconManager];

    if (v9)
    {
      id v9 = [(SBHomeScreenController *)self _setUpLibraryViewControllerForWindowScene:v5];
    }
    id v10 = [SBModalLibraryController alloc];
    uint64_t v11 = [(SBHomeScreenController *)self iconManager];
    char v12 = [(SBModalLibraryController *)v10 initWithIconManager:v11 libraryViewController:v9 floatingDockController:v8 windowScene:v5];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)_setUpLibraryViewControllerForWindowScene:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(SBHomeScreenController *)self iconManager];
  id v7 = [(SBHomeScreenController *)self model];
  if (!v6)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:2233 description:@"icon manager must exist in order to create a library view controller"];
  }
  id v8 = [v6 iconModel];

  if (!v8)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:2234 description:@"icon model must exist in order to create a library view controller"];
  }
  id v9 = [(SBHomeScreenController *)self _iconController];
  id v10 = [v9 libraryCategoryMapProvider];

  uint64_t v11 = +[SBDefaults localDefaults];
  char v12 = [v11 homeScreenDefaults];

  id v13 = [[SBLibraryViewController alloc] initWithCategoryMapProvider:v10 windowScene:v5];
  if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled]) {
    [(SBHLibraryViewController *)v13 setIconLocation:*MEMORY[0x1E4FA6678]];
  }
  [(SBHLibraryViewController *)v13 setIconModel:v7];
  [(SBHLibraryViewController *)v13 addObserver:self];
  [(SBHLibraryViewController *)v13 setBehaviorDelegate:self];
  -[SBLibraryViewController setEditing:](v13, "setEditing:", [v6 isEditing]);
  -[SBHLibraryViewController setAllowsBadging:](v13, "setAllowsBadging:", [v12 showsBadgesInAppLibrary]);
  [(SBHLibraryViewController *)v13 setContentVisibility:2];
  [(SBHLibraryViewController *)v13 setIconViewProvider:v6];
  [(SBHLibraryViewController *)v13 setIconViewDelegate:v6];
  [(SBHLibraryViewController *)v13 setHomeScreenIconTransitionAnimatorDelegate:v6];
  id v14 = [(SBHomeScreenController *)self _appLibraryListLayoutProviderForWindowScene:v5];
  [(SBHLibraryViewController *)v13 setListLayoutProvider:v14];
  long long v15 = [v6 iconImageCache];
  [(SBHLibraryViewController *)v13 setIconImageCache:v15];

  long long v16 = [v6 legibilitySettings];
  [(SBHLibraryViewController *)v13 setLegibilitySettings:v16];

  [(SBHLibraryViewController *)v13 addObserver:v6];
  return v13;
}

- (id)libraryViewControllerForWindowScene:(id)a3
{
  id v4 = a3;
  if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
  {
    id v5 = [v4 modalLibraryController];
    uint64_t v6 = [v5 libraryViewController];
  }
  else
  {
    uint64_t v6 = [(SBHomeScreenController *)self overlayLibraryViewController];
  }

  return v6;
}

- (id)_appLibraryListLayoutProviderForWindowScene:(id)a3
{
  v31[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = SBLogIconController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SBHomeScreenController _appLibraryListLayoutProviderForWindowScene:](v5);
    }
  }
  uint64_t v6 = [(SBHomeScreenController *)self iconManager];
  if (([v4 isContinuityDisplayWindowScene] & 1) != 0
    || [v4 isMainDisplayWindowScene])
  {
    id v7 = [v6 listLayoutProvider];
  }
  else
  {
    id v8 = [v6 listLayoutProvider];
    uint64_t v9 = *MEMORY[0x1E4FA6660];
    id v10 = [v8 layoutForIconLocation:*MEMORY[0x1E4FA6660]];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        id v13 = v12;
      }
      else {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
    id v14 = v13;

    long long v15 = [v14 layoutConfiguration];

    long long v29 = v12;
    long long v16 = (void *)[v15 copy];

    [v16 landscapeLayoutInsets];
    [v16 portraitLayoutInsets];
    objc_msgSend(v16, "setPortraitLayoutInsets:");
    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4FA63F0]) initWithLayoutConfiguration:v16];
    v30[0] = *MEMORY[0x1E4FA66D0];
    long long v28 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[0] = v28;
    v30[1] = *MEMORY[0x1E4FA6648];
    long long v27 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[1] = v27;
    v30[2] = *MEMORY[0x1E4FA6678];
    CGFloat v26 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[2] = v26;
    v30[3] = *MEMORY[0x1E4FA6650];
    BOOL v17 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[3] = v17;
    v30[4] = *MEMORY[0x1E4FA6670];
    uint64_t v18 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[4] = v18;
    v30[5] = *MEMORY[0x1E4FA6668];
    double v19 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[5] = v19;
    v30[6] = *MEMORY[0x1E4FA6658];
    CGFloat v20 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[6] = v20;
    v31[7] = v25;
    uint64_t v21 = *MEMORY[0x1E4FA6680];
    v30[7] = v9;
    v30[8] = v21;
    uint64_t v22 = objc_msgSend(v8, "layoutForIconLocation:");
    v31[8] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:9];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6230]) initWithListLayouts:v23];
  }

  return v7;
}

- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5
{
  uint64_t v6 = [a3 iconAnimator];
  id v7 = [MEMORY[0x1E4FA6270] rootSettings];
  id v8 = [v7 iconAnimationSettings];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = [v8 reducedMotionSettings];
LABEL_4:
    id v10 = (void *)v9;
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
    id v10 = (void *)v13;

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
  id v10 = 0;
LABEL_5:

  return v10;
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

- (void)iconManager:(id)a3 folderControllerDidEndScrolling:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(SBHomeScreenController *)self _rootFolderController];
  char v7 = [v5 hasOpenFolder];

  if ((v7 & 1) == 0 && ([v6 isDockExternal] & 1) == 0)
  {
    id v8 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    uint64_t v9 = [v8 pictureInPictureManager];

    [v6 dockHeight];
    objc_msgSend(v9, "applyPictureInPictureInsets:forSource:", 1, 0.0, 0.0, v10, 0.0);
  }
  uint64_t v11 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v12, 2u);
  }

  kdebug_trace();
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4FA74D8];
  v14[0] = &unk_1F334B4E0;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a5;
  id v8 = [v6 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v9 = (void *)MEMORY[0x1E4FA5E78];
  id v10 = v8;
  uint64_t v11 = [v9 sharedInstance];
  [v11 emitEvent:31 withPayload:v10];

  id v12 = [(SBHomeScreenController *)self iconDragManager];
  [v12 performSpringLoadedInteractionForIconDragOnIconView:v7];
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
{
  BOOL v3 = [(SBHomeScreenController *)self homeScreenViewController];
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

- (void)iconManager:(id)a3 willOpenFolderController:(id)a4
{
  id v5 = a4;
  if ([v5 suspendsWallpaperAnimationWhileOpen])
  {
    if (self->_invalidated)
    {
      double v6 = SBLogIconController();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenController iconManager:willOpenFolderController:]();
      }
    }
    else
    {
      id v7 = [v5 extraAssertions];
      if (!v7)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v5 setExtraAssertions:v7];
      }
      double v8 = [v7 valueForKey:@"SuspendWallpaperAnimationAssertion"];
      double v9 = v8;
      if (v8) {
        [v8 invalidate];
      }
      double v10 = +[SBWallpaperController sharedInstance];
      double v11 = objc_msgSend(@"SBIconControllerOpenFolderWallpaperAnimationSuspensionReason", "stringByAppendingFormat:", @"-%p", v5);
      double v12 = [v10 suspendWallpaperAnimationForReason:v11];

      [v7 setValue:v12 forKey:@"SuspendWallpaperAnimationAssertion"];
    }
  }
}

- (void)iconManager:(id)a3 willCloseFolderController:(id)a4
{
  id v8 = a4;
  if ([v8 suspendsWallpaperAnimationWhileOpen])
  {
    double v4 = [v8 extraAssertions];
    id v5 = [v4 valueForKey:@"SuspendWallpaperAnimationAssertion"];
    double v6 = v5;
    if (v5)
    {
      [v5 invalidate];
      [v4 removeObjectForKey:@"SuspendWallpaperAnimationAssertion"];
    }
  }
  id v7 = [MEMORY[0x1E4FA62D0] sharedInstance];
  [v7 noteFolderControllerWillClose:v8];
}

- (void)setLegibilitySettings:(id)a3
{
  id v12 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    id v5 = [(SBHomeScreenController *)self iconManager];
    [v5 setLegibilitySettings:self->_legibilitySettings];

    double v6 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    id v7 = [v6 floatingDockController];
    [v7 setLegibilitySettings:self->_legibilitySettings];
    id v8 = [(SBHomeScreenController *)self spotlightViewController];
    [v8 setLegibilitySettings:self->_legibilitySettings];

    double v9 = [(SBHomeScreenController *)self searchPresentableViewController];
    double v10 = [v9 searchAffordanceView];
    [v10 setLegibilitySettings:self->_legibilitySettings];

    double v11 = [(SBHomeScreenController *)self scrollAccessoryAuxiliaryView];
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
  id v7 = [(SBHomeScreenController *)self homeScreenViewController];
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
  double v4 = [(SBHomeScreenController *)self _currentMainDisplayLayoutState];
  uint64_t v5 = [v4 unlockedEnvironmentMode];

  if (v5 == 3) {
    return 0;
  }
  double v6 = +[SBWorkspace mainWorkspace];
  id v7 = [v6 transientOverlayPresentationManager];
  char v8 = [v7 hasActivePresentation];

  if (v8) {
    return 0;
  }
  double v10 = [(SBHomeScreenController *)self coverSheetPresentationManager];
  char v11 = [v10 isVisible];

  return v11 ^ 1;
}

- (void)iconManager:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v10 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  char v8 = [v10 statusBarManager];
  double v9 = [v8 layoutManager];
  objc_msgSend(v9, "setStatusBarEdgeInsets:forLayoutLayer:", 0, top, left, bottom, right);
}

- (BOOL)iconManager:(id)a3 folderController:(id)a4 canChangeCurrentPageIndexToIndex:(int64_t)a5
{
  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken_0 != -1) {
    dispatch_once(&iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken_0, &__block_literal_global_229_0);
  }
  return iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage_0 == 0;
}

void __88__SBHomeScreenController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke()
{
  v0 = +[SBDefaults localDefaults];
  id v1 = [v0 iconDefaults];
  iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage_0 = [v1 suppressSetCurrentPage];

  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage_0)
  {
    BOOL v2 = SBLogIcon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __88__SBHomeScreenController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1(v2);
    }
  }
}

- (BOOL)isIconContentPossiblyVisibleOverApplicationForIconManager:(id)a3
{
  BOOL v3 = [(SBHomeScreenController *)self _currentMainDisplayLayoutState];
  BOOL v4 = [v3 unlockedEnvironmentMode] == 3;

  return v4;
}

- (id)_createHomeScreenOverlayControllerIfNeeded
{
  BOOL v3 = [(SBHomeScreenController *)self homeScreenOverlayController];
  if (!v3)
  {
    uint64_t v21 = [(SBHomeScreenController *)self iconManager];
    BOOL v4 = [v21 listLayoutProvider];
    BOOL v3 = [[SBHomeScreenOverlayController alloc] initWithListLayoutProvider:v4];
    [(SBHomeScreenOverlayController *)v3 setDelegate:self];
    [(SBHomeScreenOverlayController *)v3 addHomeScreenOverlayObserver:self];
    uint64_t v5 = [(SBHomeScreenController *)self overlayLibraryViewController];
    [(SBHomeScreenOverlayController *)v3 addHomeScreenOverlayObserver:v5];

    double v6 = [(SBHomeScreenController *)self todayViewController];
    [(SBHomeScreenOverlayController *)v3 addHomeScreenOverlayObserver:v6];

    [(SBHomeScreenOverlayController *)v3 setContentVisibility:2];
    id v7 = [(SBHomeScreenOverlayController *)v3 viewController];
    char v8 = [(SBHomeScreenController *)self homeScreenViewController];
    double v9 = [v8 iconContentView];
    objc_msgSend(v8, "bs_addChildViewController:withSuperview:", v7, v9);
    id v10 = [v7 view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = (id)SBHPinViewWithinView();
    double v12 = [(SBHomeScreenOverlayController *)v3 dismissTapGestureRecognizer];
    [v12 requireGestureRecognizerToFail:self->_longPressToEditGestureRecognizer];

    double v13 = [(SBHomeScreenOverlayController *)v3 dismissTapGestureRecognizer];
    [v13 requireGestureRecognizerToFail:self->_tapToEndEditingGestureRecognizer];

    double v14 = [(SBHomeScreenController *)self todayViewController];
    if (+[SBLeftOfHomeAppViewController isEnabled])
    {
      double v15 = objc_alloc_init(SBLeftOfHomeAppViewController);
      [(SBHomeScreenOverlayController *)v3 setLeadingSidebarViewController:v15];
      leftOfHomeAppViewController = self->_leftOfHomeAppViewController;
      self->_leftOfHomeAppViewController = v15;
    }
    else
    {
      [(SBHomeScreenOverlayController *)v3 setLeadingSidebarViewController:v14];
    }
    BOOL v17 = [(SBHomeScreenOverlayController *)v3 viewController];
    [v14 setContainerViewController:v17];

    [v14 setDismissalDelegate:v3];
    if ([(SBHomeScreenController *)self isAppLibrarySupported]
      && ![(SBHomeScreenController *)self isModalAppLibrarySupported])
    {
      uint64_t v18 = [(SBHomeScreenController *)self overlayLibraryViewController];
      [(SBHomeScreenOverlayController *)v3 setTrailingSidebarViewController:v18];
      double v19 = [(SBHomeScreenOverlayController *)v3 viewController];
      [v18 setPresenter:v19];
    }
    [(SBHomeScreenController *)self setHomeScreenOverlayController:v3];
  }
  return v3;
}

- (id)_homeScreenOverlayControllerIfNeeded
{
  if ([(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(SBHomeScreenController *)self _createHomeScreenOverlayControllerIfNeeded];
  }
  return v3;
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnFirstPageByAmount:(double)a5
{
  id v17 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
  if ([(SBHomeScreenController *)self allowsHomeScreenOverlay]
    && ([(SBHomeScreenController *)self policyAggregator],
        id v7 = objc_claimAutoreleasedReturnValue(),
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
      double v12 = [v10 numberWithFloat:v11];
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
  id v13 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if ([(SBHomeScreenController *)self allowsHomeScreenOverlay]
    && ([(SBHomeScreenController *)self policyAggregator],
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
  id v15 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
  if ([(SBHomeScreenController *)self allowsHomeScreenOverlay]
    && [(SBHomeScreenController *)self isAppLibrarySupported])
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
  id v11 = [(SBHomeScreenController *)self homeScreenOverlayController];
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if ([(SBHomeScreenController *)self allowsHomeScreenOverlay]
    && [(SBHomeScreenController *)self isAppLibrarySupported])
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
  id v5 = a4;
  double v6 = [(SBHomeScreenController *)self _iconController];
  char v7 = [v6 isIconVisibleForBundleIdentifier:v5];

  return v7;
}

- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4
{
  BOOL v4 = SBWorkspaceApplicationForURLWithError(a4, 0, 0);
  id v5 = [v4 bundleIdentifier];

  return v5;
}

- (void)iconManager:(id)a3 wantsLaunchForWidgetURL:(id)a4
{
  id v5 = a4;
  double v6 = [(SBHomeScreenController *)self windowScene];
  char v7 = [v6 _sbDisplayConfiguration];
  char v8 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v8 setSource:24];
  [(SBLockScreenUnlockRequest *)v8 setIntent:3];
  [(SBLockScreenUnlockRequest *)v8 setName:@"Launch From Widget Icon Unlock"];
  [(SBLockScreenUnlockRequest *)v8 setWantsBiometricPresentation:1];
  [(SBLockScreenUnlockRequest *)v8 setWindowScene:v6];
  double v9 = [(SBHomeScreenController *)self lockScreenManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke;
  v12[3] = &unk_1E6AF4A98;
  id v13 = v5;
  id v14 = v7;
  id v10 = v7;
  id v11 = v5;
  [v9 unlockWithRequest:v8 completion:v12];
}

void __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    BOOL v2 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke_2;
    v4[3] = &unk_1E6AF57E8;
    id v5 = v2;
    SBWorkspaceActivateApplicationFromURLWithDisplayConfiguration(v3, v5, 0, v4);
  }
}

void __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:1];
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
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
    id v13 = [v9 gridSizeClass];
    uint64_t v14 = SBHIconGridSizeClassToStackLayoutSize();

    id v15 = objc_alloc(MEMORY[0x1E4F4B790]);
    long long v16 = [v10 uniqueIdentifier];
    id v17 = [MEMORY[0x1E4F4B0C0] sharedInstance];
    id v18 = (id)[v15 initWithIdentifier:v16 suggestionsClient:v17 layoutSize:v14];

    goto LABEL_5;
  }
  double v19 = self;
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    uint64_t v21 = [v9 gridSizeClass];
    uint64_t v22 = SBHIconGridSizeClassToStackLayoutSize();

    uint64_t v23 = [(SBHomeScreenController *)self canAppPredictionsWidgetAlignWithGrid] ^ 1;
    id v24 = objc_alloc(MEMORY[0x1E4F4B788]);
    uint64_t v25 = [v9 uniqueIdentifier];
    id v18 = (id)[v24 initWithIdentifier:v25 layoutSize:v22 mode:v23];

    [v18 setDelegate:self];
    CGFloat v26 = [v8 listLayoutProvider];
    long long v16 = [v26 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];

    [v16 iconImageInfoForGridSizeClass:*MEMORY[0x1E4FA6528]];
    double v28 = v27;
    long long v29 = [(SBHomeScreenController *)self homeScreenViewController];
    long long v30 = [v29 iconContentView];
    [v30 bounds];
    double v32 = (v31 - v28) * 0.5;

    objc_msgSend(v18, "setParentLayoutInsets:", 0.0, v32, 0.0, v32);
LABEL_5:

    if (v18) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  char v33 = self;
  char v34 = objc_opt_isKindOfClass();

  if (v34)
  {
    id v35 = v10;
    id v36 = objc_alloc_init(MEMORY[0x1E4FB74E8]);
    __int16 v37 = [v9 gridSizeClass];
    [v36 setFamily:CHSWidgetFamilyForSBHIconGridSizeClass()];

    id v38 = [(SBHomeScreenController *)self iconManager];
    id v39 = [v38 intentForDataSource:v35 ofIcon:v9];
    if (!v39)
    {
      id v39 = WFCreateShortcutsWidgetConfigurationIntent();
      id v64 = 0;
      char v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v39 requiringSecureCoding:1 error:&v64];
      id v61 = v64;
      if (!v40)
      {
        uint64_t v41 = SBLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v61;
          -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:]();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        v42 = v61;
        goto LABEL_17;
      }
LABEL_15:
      uint64_t v41 = [(SBHomeScreenController *)self iconManager];
      [(SBHomeScreenController *)self iconManager:v41 dataSource:v35 ofIcon:v9 didUpdateConfigurationData:v40];
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  uint64_t v43 = self;
  char v44 = objc_opt_isKindOfClass();

  if (v44)
  {
    id v35 = v10;
    id v36 = objc_alloc_init(MEMORY[0x1E4FB74E8]);
    CGPoint v45 = [v9 gridSizeClass];
    [v36 setFamily:CHSWidgetFamilyForSBHIconGridSizeClass()];

    id v38 = [(SBHomeScreenController *)self iconManager];
    id v39 = [v38 intentForDataSource:v35 ofIcon:v9];
    if (!v39)
    {
      id v39 = WFCreateShortcutsSmallWidgetConfigurationIntent();
      id v63 = 0;
      char v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v39 requiringSecureCoding:1 error:&v63];
      id v61 = v63;
      if (!v40)
      {
        uint64_t v41 = SBLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v61;
          -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:]();
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
  CGRect v46 = self;
  char v47 = objc_opt_isKindOfClass();

  if (v47)
  {
    id v35 = v10;
    id v36 = [(SBHomeScreenController *)self iconManager];
    id v38 = [v36 intentForDataSource:v35 ofIcon:v9];
    if (!v38)
    {
      id v38 = DOCCreateDefaultHomeScreenWidgetIntent();
      id v62 = 0;
      v48 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v38 requiringSecureCoding:1 error:&v62];
      id v49 = v62;
      if (v48)
      {
        v50 = [(SBHomeScreenController *)self iconManager];
        [(SBHomeScreenController *)self iconManager:v50 dataSource:v35 ofIcon:v9 didUpdateConfigurationData:v48];
      }
      else
      {
        v50 = SBLogCommon();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:].cold.4();
        }
      }
    }
    if (!self->_filesWidgetExtensionProviders)
    {
      v55 = [MEMORY[0x1E4F1CA60] dictionary];
      filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
      self->_filesWidgetExtensionProviders = v55;
    }
    id v39 = [v35 uniqueIdentifier];
    uint64_t v57 = [(NSMutableDictionary *)self->_filesWidgetExtensionProviders objectForKey:v39];
    if (v57)
    {
      id v58 = (id)v57;
      [MEMORY[0x1E4F1CA60] cancelPreviousPerformRequestsWithTarget:self->_filesWidgetExtensionProviders selector:sel_removeObjectForKey_ object:v39];
    }
    else
    {
      id v58 = objc_alloc_init(MEMORY[0x1E4FA6250]);
      uint64_t v59 = self->_filesWidgetExtensionProviders;
      v60 = [v35 uniqueIdentifier];
      [(NSMutableDictionary *)v59 setObject:v58 forKey:v60];
    }
    id v18 = [v58 filesWidgetViewControllerWithConfiguration:v38];

LABEL_19:
    if (v18) {
      goto LABEL_28;
    }
  }
LABEL_25:
  v51 = SBLogCommon();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    -[SBIconController iconManager:viewControllerForCustomIcon:element:]((uint64_t)v10, v51);
  }

  id v52 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  v53 = [MEMORY[0x1E4F428B8] cyanColor];
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
  char v7 = [(NSMutableDictionary *)filesWidgetExtensionProviders allKeys];
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
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  id v5 = (id *)MEMORY[0x1E4FA6530];
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    id v5 = (id *)MEMORY[0x1E4FA6560];
  }
  id v6 = *v5;
  char v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  id v9 = objc_alloc(MEMORY[0x1E4FA6488]);
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v10 = (void *)[v9 initWithWidgetExtensionIdentifiers:&unk_1F3348780 widgetKinds:&unk_1F3348798 widgetContainerBundleIdentifiers:&unk_1F3348780];
    [v10 setGridSizeClass:v6];
    id v11 = objc_alloc(MEMORY[0x1E4FA6488]);
    v19[0] = @"com.apple.weather";
    v19[1] = @"com.apple.reminders.widget";
    double v12 = [MEMORY[0x1E4F1CA98] null];
    v19[2] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    uint64_t v14 = (void *)[v11 initWithWidgetExtensionIdentifiers:&unk_1F33487B0 widgetKinds:v13 widgetContainerBundleIdentifiers:&unk_1F33487C8];

    id v15 = v14;
  }
  else
  {
    id v10 = (void *)[v9 initWithWidgetExtensionIdentifiers:&unk_1F3348828 widgetKinds:&unk_1F3348840 widgetContainerBundleIdentifiers:&unk_1F3348858];
    [v10 setGridSizeClass:v6];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidgetExtensionIdentifiers:&unk_1F33487E0 widgetKinds:&unk_1F33487F8 widgetContainerBundleIdentifiers:&unk_1F3348810];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C978] array];
  double v12 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic", (uint8_t *)&v25, 2u);
  }

  id v13 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v15 = [(SBHomeScreenController *)self _iconController];
    uint64_t v16 = [v15 userIconStateFileStatus];

    id v17 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 67109120;
      LODWORD(v26) = v16 == 1;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic isDefaultIconState(%d)", (uint8_t *)&v25, 8u);
    }

    if ((unint64_t)[v10 count] <= 1)
    {
      id v18 = [(SBHomeScreenController *)self fallbackDefaultFirstPageWidgetsForIconManager:v8];
      uint64_t v19 = [v10 arrayByAddingObjectsFromArray:v18];

      id v10 = (id)v19;
    }
    char v20 = [[SBWidgetOnboardingLayoutBuilder alloc] initWithPinnedWidgets:v9 suggestionWidgets:v10];
    [(SBWidgetOnboardingLayoutBuilder *)v20 migratedDefaultWidgets:v16 == 1];
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v22 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = @"upgrade";
      int v25 = 138412802;
      if (v16 == 1) {
        uint64_t v23 = @"erase";
      }
      CGFloat v26 = v23;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Migration pinned widgets with %@ install \n PinnedWidgets = %@ \n SuggestionWidgets = %@", (uint8_t *)&v25, 0x20u);
    }

    id v11 = v20;
  }
  else
  {
    id v21 = v10;
    id v10 = v21;
  }

  return v21;
}

- (BOOL)iconManagerShouldShowWidgetIntroductionPopoverForDefaultWidgets:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F42738], "isRunningInStoreDemoMode", a3)) {
    return 0;
  }
  id v5 = [(SBHomeScreenController *)self _iconController];
  uint64_t v6 = [v5 userIconStateFileStatus];

  return v6 == 2;
}

- (id)widgetIntroductionPreviewViewForIconManager:(id)a3
{
  uint64_t v4 = [(SBHomeScreenController *)self interfaceOrientationForIconManager:a3];
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  SBScreenBounds(v4);
  double v8 = v7;
  double v10 = v9;
  id v11 = [SBHomeScreenPreviewView alloc];
  double v12 = [(SBHomeScreenController *)self iconManager];
  id v13 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v11, "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v12, 0, 0, 0, 0, v5, v6, v8, v10);

  uint64_t v14 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  id v15 = [[SBViewSnapshotProvider alloc] initWithWindowScene:v14 view:v13 orientation:v4];
  id v16 = objc_alloc(MEMORY[0x1E4FA6440]);
  id v17 = [(SBViewSnapshotProvider *)v15 snapshot];
  id v18 = (void *)[v16 initWithPreview:v13 withSnapshot:v17];

  return v18;
}

- (void)iconManagerDidAddOrRemoveWidgetIcon:(id)a3
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = [(SBHomeScreenController *)self homeScreenViewController];
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
    double v8 = [(SBHomeScreenController *)self homeScreenViewController];
    [v8 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
  int v9 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if ((v9 & 1) == 0) {
    [(SBTodayViewController *)self->_todayViewController resetForSpotlightDismissalAnimated:1];
  }
  [(SBHomeScreenController *)self removeIconOcclusionReason:1 updateVisibleIcons:1];
  uint64_t v10 = [v7 pageState];

  if (SBRootFolderPageStateIsSearch())
  {
    id v11 = [(SBHomeScreenController *)self iconManager];
    if ([v11 isShowingModalInteraction]) {
      [v11 dismissModalInteractionsImmediately];
    }
  }
  if (v10 == 2)
  {
    double v12 = [(SBHomeScreenController *)self todayViewController];
    [v12 setDisplayLayoutElementActive:1];
    [v12 setNeedsFocusUpdate];
  }
  if ((v9 & SBRootFolderPageStateIsOnIconPage()) == 1)
  {
    id v13 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v13))
    {
      __int16 v17 = 0;
      uint64_t v14 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      id v15 = (uint8_t *)&v17;
LABEL_18:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v14, " enableTelemetry=YES  isAnimation=YES ", v15, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    id v13 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v13))
    {
      __int16 v16 = 0;
      uint64_t v14 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      id v15 = (uint8_t *)&v16;
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
    double v6 = [(SBHomeScreenController *)self searchPresentableViewController];

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
    uint64_t v10 = [(SBHomeScreenController *)self homeScreenViewController];
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
    id v13 = +[SBReachabilityManager sharedInstance];
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
    [(SBHomeScreenController *)self addIconOcclusionReason:1 updateVisibleIcons:1];
    id v15 = [(SBHomeScreenController *)self suspendWallpaperAnimationForSpotlightAssertion];
    [v15 invalidate];

    if (self->_invalidated)
    {
      __int16 v16 = SBLogIconController();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenController iconManager:willOpenFolderController:]();
      }
    }
    else
    {
      id v18 = +[SBWallpaperController sharedInstance];
      uint64_t v19 = [v18 suspendWallpaperAnimationForReason:@"SBIconControllerSuspendingWallpaperForSpotlightReason"];
      [(SBHomeScreenController *)self setSuspendWallpaperAnimationForSpotlightAssertion:v19];
    }
  }
  else
  {
    [(SBHomeScreenController *)self removeIconOcclusionReason:1 updateVisibleIcons:1];
    if (SBRootFolderPageStateIsSearch())
    {
      __int16 v17 = [(SBHomeScreenController *)self suspendWallpaperAnimationForSpotlightAssertion];
      [v17 invalidate];

      [(SBHomeScreenController *)self setSuspendWallpaperAnimationForSpotlightAssertion:0];
    }
  }
  if (v11 == 2)
  {
    char v20 = [(SBHomeScreenController *)self todayViewController];
    [v20 setDisplayLayoutElementActive:1];
    [v20 setNeedsFocusUpdate];
  }
  if (SBRootFolderPageStateIsOnIconPage() && SBRootFolderPageStateIsOnLeadingCustomPage())
  {
    id v21 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v21))
    {
      __int16 v25 = 0;
      uint64_t v22 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      uint64_t v23 = (uint8_t *)&v25;
LABEL_30:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v22, " enableTelemetry=YES  isAnimation=YES ", v23, 2u);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    id v21 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v21))
    {
      __int16 v24 = 0;
      uint64_t v22 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      uint64_t v23 = (uint8_t *)&v24;
      goto LABEL_30;
    }
LABEL_31:

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
      id v15 = [(SBHomeScreenController *)self transitionContextToShowSpotlight:IsSearch fromTodayView:v14 animated:v7 interactive:v6];
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
  id v15 = 0;
LABEL_14:
  return v15;
}

- (void)rootFolderController:(id)a3 transitionWillBegin:(id)a4
{
  double v5 = [(SBHomeScreenController *)self displayLayoutTransition];
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    BOOL v7 = [WeakRetained displayLayoutPublisher];
    id v8 = [v7 transitionAssertionWithReason:0];

    [(SBHomeScreenController *)self setDisplayLayoutTransition:v8];
    double v5 = v8;
  }
}

- (void)rootFolderController:(id)a3 transitionDidFinish:(id)a4
{
  double v5 = [(SBHomeScreenController *)self displayLayoutTransition];
  [v5 invalidate];

  [(SBHomeScreenController *)self setDisplayLayoutTransition:0];
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
  __int16 v27 = v12;
  if (v7)
  {
    id v15 = objc_alloc_init(SBSpotlightTransitionAnimator);
    id v28 = v15;
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
    id v28 = 0;
  }
  id v18 = [(SBHomeScreenController *)self _rootFolderController];
  uint64_t v19 = [v18 contentView];
  char v20 = [(SBHomeScreenController *)self spotlightViewController];
  id v21 = [v20 view];
  [v19 bounds];
  objc_msgSend(v21, "setFrame:");
  id v22 = objc_alloc_init(MEMORY[0x1E4FA6480]);
  uint64_t v23 = [v18 searchableLeadingCustomWrapperView];
  [v22 setContainerView:v23];

  if (v16)
  {
    __int16 v24 = [(SBHomeScreenController *)self todayViewController];
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
  __int16 v25 = [v18 searchBackdropView];
  [v22 setView:v25 forKey:@"SBSpotlightSearchBackdropViewKey"];

  [v22 setAnimator:v28];
  [v22 setInteractor:v17];
  [v22 setWantsAnimation:v29];

  return v22;
}

- (void)popToCurrentRootIconListWhenPossible
{
  id v3 = [(SBHomeScreenController *)self iconManager];
  [v3 popToCurrentRootIconListWhenPossible];

  [(SBHomeScreenController *)self dismissHomeScreenOverlaysAnimated:0];
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  id v3 = [(SBHomeScreenController *)self iconManager];
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
      id v12 = [(SBHomeScreenController *)self mainDisplayWindowScene];
      id v13 = [v12 floatingDockController];
      id v14 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v13 visibleProgress:1 animated:1 gesturePossible:4 atLevel:@"homeScreenOverlay" reason:0 withCompletion:1.0 - v9];
      id v15 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
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
  id v20 = [(SBHomeScreenController *)self iconManager];
  [v20 setOverlayTodayViewVisible:v10 & v6 todayViewTransitioning:v18 & v6];
  uint64_t v19 = [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController trailingSidebarViewController];

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
  [(SBHomeScreenController *)self setWallpaperAnimationDisabled:v4 forReason:v6];

  if (!v4)
  {
    [(SBFloatingDockBehaviorAssertion *)self->_homeScreenOverlayFloatingDockBehaviorAssertion invalidate];
    homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;
  }
  [(SBHomeScreenOverlayController *)self->_homeScreenOverlayController updateExtraButtonVisibilityAnimated:0];
  double v8 = [(SBHomeScreenController *)self _rootFolderController];
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
  id v3 = [(SBHomeScreenController *)self iconManager];
  [v3 setEditing:0];
}

- (void)homeScreenOverlayWantsWidgetEditingViewControllerPresented:(id)a3
{
  id v5 = [(SBHomeScreenController *)self _rootFolderController];
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
    BOOL v7 = [(SBHomeScreenController *)self iconManager];
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
  id v3 = [(SBHomeScreenController *)self iconManager];
  char v4 = [v3 showsDoneButtonWhileEditing];

  return v4;
}

- (BOOL)isEditingForHomeScreenOverlayController:(id)a3
{
  id v3 = [(SBHomeScreenController *)self iconManager];
  char v4 = [v3 isEditing];

  return v4;
}

- (void)homeScreenOverlayController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(SBHomeScreenController *)self todayViewController];
  [v7 setSuppressesEditingStateForListViews:v4];
  BOOL v6 = [(SBHomeScreenController *)self overlayLibraryViewController];
  [v6 setSuppressesEditingStateForListViews:v4];
}

- (id)homeScreenOverlayController:(id)a3 displayLayoutIdentifierForSidebarViewController:(id)a4
{
  id v6 = a4;
  id v7 = [(SBHomeScreenController *)self overlayLibraryViewController];

  if (v7 == v6)
  {
    id v11 = (id *)MEMORY[0x1E4FA6F20];
  }
  else
  {
    id v8 = [(SBHomeScreenController *)self todayViewController];

    if (v8 == v6
      || v6
      && ([(SBHomeScreenController *)self leftOfHomeAppViewController],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          v9 == v6))
    {
      id v11 = (id *)MEMORY[0x1E4FA6F88];
    }
    else
    {
      int v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"SBHomeScreenController.m", 3236, @"unexpected sidebar view controller: %@", v6 object file lineNumber description];

      id v11 = (id *)MEMORY[0x1E4FA6F40];
    }
  }
  id v12 = *v11;

  return v12;
}

- (void)handleSpotlightPresentationFromViewController:(id)a3
{
  id v3 = [(SBHomeScreenController *)self _rootFolderController];
  if (([v3 isTransitioningPageState] & 1) == 0) {
    [v3 presentSpotlightAnimated:1 completionHandler:0];
  }
}

- (void)handleSpotlightDismissalFromViewController:(id)a3
{
  id v3 = [(SBHomeScreenController *)self _rootFolderController];
  if (([v3 isTransitioningPageState] & 1) == 0) {
    [v3 dismissSpotlightAnimated:1 completionHandler:0];
  }
}

- (unint64_t)defaultSearchViewPresentationSourceForViewController:(id)a3
{
  id v3 = [(SBHomeScreenController *)self _rootFolderController];
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
  id v3 = [(SBHomeScreenController *)self iconManager];
  [v3 setEditing:0];
}

- (void)todayViewControllerWillPresentSpotlight:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:SBIconControllerOverlayVisibilityDidChangeNotification object:self];

  id v5 = [(SBHomeScreenController *)self iconManager];
  [v5 dismissModalInteractionsImmediately];
}

- (void)todayViewDidAppear:(id)a3
{
  id v3 = [(SBHomeScreenController *)self proactiveUsageObserver];
  [v3 logTodayViewDidAppear];
}

- (BOOL)isTodayViewRotating:(id)a3
{
  return self->_rotating;
}

- (void)todayViewControllerDidAppear:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [(SBHomeScreenController *)self todayViewDisplayLayoutAssertion];
  if (!v4)
  {
    id v5 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
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
      id v15 = [v14 displayLayoutPublisher];
      uint64_t v4 = [v15 addElement:v8];

      [(SBHomeScreenController *)self setTodayViewDisplayLayoutAssertion:v4];
    }
  }
  uint64_t v16 = [(SBHomeScreenController *)self homeScreenViewController];
  [v16 setHomeAffordanceInteractionAllowed:0];
}

- (void)todayViewControllerDidDisappear:(id)a3
{
  id v5 = [(SBHomeScreenController *)self todayViewDisplayLayoutAssertion];
  [v5 invalidate];
  [(SBHomeScreenController *)self setTodayViewDisplayLayoutAssertion:0];
  uint64_t v4 = [(SBHomeScreenController *)self homeScreenViewController];
  [v4 setHomeAffordanceInteractionAllowed:1];
}

- (void)activateTodayViewWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self _rootFolderController];
  uint64_t v6 = [v5 minimumPageIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke;
  v8[3] = &unk_1E6AF6828;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 setCurrentPageIndex:v6 animated:1 completion:v8];
}

void __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _homeScreenOverlayControllerIfNeeded];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6AF5A50;
  id v4 = *(id *)(a1 + 40);
  [v2 setPresentationProgress:0 interactive:1 animated:v3 completionHandler:1.0];
}

uint64_t __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)searchPresentablesForPresenter:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHomeScreenController *)self searchPresentableViewController];
  if (v4)
  {
    id v5 = [(SBHomeScreenController *)self searchPresentableViewController];
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
  id v3 = [(SBHomeScreenController *)self _rootFolderController];
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
  id v4 = [(SBHomeScreenController *)self policyAggregator];
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
  uint64_t v6 = [(SBHomeScreenController *)self _rootFolderController];
  id v7 = [(SBHomeScreenController *)self searchPresenterPageStateTransition];
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
  char v5 = [(SBHomeScreenController *)self _rootFolderController];
  [v5 setScrollingDisabled:1 forReason:@"SBIconControllerDisableScrollingForSearchPresentationReason"];
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 contentView];
  id v8 = SBSafeCast(v6, v7);

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      id v9 = [(SBHomeScreenController *)self scrollAccessoryAuxiliaryView];

      if (v9) {
        [v8 setPageControlAlpha:0.0];
      }
    }
    int v10 = [(SBHomeScreenController *)self scrollAccessoryBorrowedForSearchPresentationAssertion];

    if (!v10)
    {
      BOOL v11 = [v8 borrowScrollAccessoryForReason:@"SearchPresentation"];
      [(SBHomeScreenController *)self setScrollAccessoryBorrowedForSearchPresentationAssertion:v11];
    }
  }
  id v12 = [(SBHomeScreenController *)self searchPresentableViewController];
  __int16 v13 = [v12 view];

  [v13 setHidden:0];
  id v14 = [v13 superview];
  [v14 bringSubviewToFront:v13];

  id v15 = [(SBHomeScreenController *)self searchPresenterPageStateTransition];
  char v16 = [v15 isValid];
  id v17 = SBLogRootController();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      uint64_t v19 = _SBFLoggingMethodProem();
      int v24 = 138543362;
      __int16 v25 = v19;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (v18)
    {
      id v20 = _SBFLoggingMethodProem();
      int v24 = 138543618;
      __int16 v25 = v20;
      __int16 v26 = 1026;
      BOOL v27 = v15 == 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v24,
        0x12u);
    }
    id v21 = [(SBHomeScreenController *)self _rootFolderController];
    uint64_t v22 = [v21 beginPageStateTransitionToState:1 reason:@"SBHomeScreenController-SearchPresenter-Present" animated:1 interactive:1];

    [(SBHomeScreenController *)self setSearchPresenterPageStateTransition:v22];
    [(SBHomeScreenController *)self setSearchPresenterDestinationPageState:1];
    id v15 = (void *)v22;
  }
  uint64_t v23 = [(SBHomeScreenController *)self homeScreenViewController];
  [v23 setHomeAffordanceInteractionAllowed:0];
}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHomeScreenController *)self searchPresenterPageStateTransition];
  objc_msgSend(v4, "endTransitionSuccessfully:", -[SBHomeScreenController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 1);
  char v5 = SBLogRootController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = _SBFLoggingMethodProem();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v7, 0xCu);
  }
  [(SBHomeScreenController *)self setSearchPresenterPageStateTransition:0];
  [(SBHomeScreenController *)self setSearchPresenterDestinationPageState:-1];
}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v5 = [(SBHomeScreenController *)self _rootFolderController];
  [v5 setScrollingDisabled:0 forReason:@"SBIconControllerDisableScrollingForSearchPresentationReason"];
  uint64_t v6 = [(SBHomeScreenController *)self searchPresenterPageStateTransition];
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
    id v12 = [(SBHomeScreenController *)self _rootFolderController];
    uint64_t v13 = [v12 beginPageStateTransitionToState:0 reason:@"SBHomeScreenController-SearchPresenter-Dismiss" animated:1 interactive:1];

    [(SBHomeScreenController *)self setSearchPresenterPageStateTransition:v13];
    [(SBHomeScreenController *)self setSearchPresenterDestinationPageState:0];
    uint64_t v6 = (void *)v13;
  }
  id v14 = [(SBHomeScreenController *)self homeScreenViewController];
  [v14 setHomeAffordanceInteractionAllowed:1];
}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBHomeScreenController *)self scrollAccessoryBorrowedForSearchPresentationAssertion];
  [v4 invalidate];

  [(SBHomeScreenController *)self setScrollAccessoryBorrowedForSearchPresentationAssertion:0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(SBHomeScreenController *)self _rootFolderController];
  char v7 = [v6 contentView];
  id v8 = SBSafeCast(v5, v7);

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      BOOL v9 = [(SBHomeScreenController *)self scrollAccessoryAuxiliaryView];

      if (v9) {
        [v8 setPageControlAlpha:1.0];
      }
    }
  }
  int v10 = [(SBHomeScreenController *)self searchPresentableViewController];
  BOOL v11 = [v10 view];
  [v11 setHidden:1];

  id v12 = [(SBHomeScreenController *)self searchPresenterPageStateTransition];
  objc_msgSend(v12, "endTransitionSuccessfully:", -[SBHomeScreenController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 0);
  uint64_t v13 = SBLogRootController();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = _SBFLoggingMethodProem();
    int v15 = 138543362;
    char v16 = v14;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v15, 0xCu);
  }
  [(SBHomeScreenController *)self setSearchPresenterPageStateTransition:0];
  [(SBHomeScreenController *)self setSearchPresenterDestinationPageState:-1];
}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
  id v3 = [(SBHomeScreenController *)self searchPresenter];
  [v3 dismissSearchAnimated:1];
}

- (id)searchAffordanceViewForSpotlightPresentableViewController:(id)a3
{
  id v4 = [(SBHomeScreenController *)self scrollAccessoryAuxiliaryView];
  uint64_t v5 = [(SBHomeScreenController *)self rootViewController];
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
    id v9 = [(SBHomeScreenController *)self _newSearchPillBackgroundView];
    [v6 setSearchAffordanceReferenceBackgroundView:v9];

    uint64_t v10 = objc_opt_class();
    BOOL v11 = [(SBHomeScreenController *)self _rootFolderController];
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v4 = [WeakRetained screen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6470]), "initWithFrame:style:", 3, v6, v8, v10, v12);
  [v13 prepareForTransitionToBlurred:1];
  return v13;
}

- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3
{
  return 1;
}

- (void)_handleSearchAffordanceTap
{
  id v2 = [(SBHomeScreenController *)self searchPresenter];
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
  if ([(SBHomeScreenController *)self searchPresenterDestinationPageState] != 1)double v6 = 1.0 - v6; {
  id v8 = [(SBHomeScreenController *)self searchPresenterPageStateTransition];
  }
  [v8 setTransitionProgress:v6];
}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  if (a4)
  {
    unint64_t v8 = [(SBHomeScreenController *)self searchPresenterOutstandingAnimationCount];
    if (a3 != 1 && !v8) {
      *a5 = 1;
    }
    [(SBHomeScreenController *)self setSearchPresenterOutstandingAnimationCount:v8 + 1];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__SBHomeScreenController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
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

void __101__SBHomeScreenController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSearchPresenterOutstandingAnimationCount:", objc_msgSend(WeakRetained, "searchPresenterOutstandingAnimationCount") - 1);
}

- (id)_identifierForSearchPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v3 = [WeakRetained isContinuityDisplayWindowScene];

  if (v3) {
    return @"Continuity";
  }
  else {
    return @"HomeScreen";
  }
}

- (void)dismissSearchView
{
  id v2 = [(SBHomeScreenController *)self _rootFolderController];
  if (([v2 isTransitioningPageState] & 1) == 0) {
    [v2 dismissSpotlightAnimated:1 completionHandler:0];
  }
}

- (void)dismissAppIconForceTouchControllers:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4FA62D0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 dismissAppIconForceTouchControllers:v4];
}

- (BOOL)areAnyIconViewContextMenusShowing
{
  id v2 = [MEMORY[0x1E4FA62D0] sharedInstance];
  char v3 = [v2 areAnyIconViewContextMenusShowing];

  return v3;
}

- (BOOL)areAnyIconViewContextMenusAnimating
{
  id v2 = [MEMORY[0x1E4FA62D0] sharedInstance];
  char v3 = [v2 areAnyIconViewContextMenusAnimating];

  return v3;
}

- (BOOL)isAnySearchVisibleOrTransitioning
{
  id v2 = [(SBHomeScreenController *)self _rootFolderController];
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
  id v2 = [(SBHomeScreenController *)self coverSheetPresentationManager];
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
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 icon];
  double v9 = [v7 location];
  uint64_t v10 = [v6 isEditingAllowedForIconView:v7];
  if (v10)
  {
    if ([(SBHomeScreenController *)self isOnlyHideSuggestionSupportedForIcon:v8 inLocation:v9])
    {
      uint64_t v11 = [(SBHomeScreenController *)self isHideSuggestionSupportedForIconView:v7 inLocation:v9];
    }
    else if ([(SBHomeScreenController *)self isHideSupportedForIcon:v8 inLocation:v9])
    {
      uint64_t v11 = 2;
    }
    else if ([(SBHomeScreenController *)self isUninstallSupportedForIcon:v8])
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
  uint64_t v71 = self;
  if ([v8 isApplicationIcon])
  {
    id v12 = [v8 application];
    uint64_t v13 = [v8 applicationPlaceholder];
    id v14 = (void *)v13;
    if (v12)
    {
      id v62 = v9;
      uint64_t v59 = (void *)v13;
      uint64_t v60 = v11;
      BOOL v15 = [(SBHomeScreenController *)self _shouldHideAppIconForceTouchInfoForApplication:v12];
      uint64_t v16 = [v12 bundleIdentifier];
      uint64_t v17 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      BOOL v18 = [v17 _recentAppLayoutsController];
      v66 = (void *)v16;
      uint64_t v19 = [v18 recentDisplayItemsForBundleIdentifier:v16 includingHiddenAppLayouts:0];
      uint64_t v57 = [v19 count];

      char v54 = [v6 isIconIgnored:v8];
      v55 = (void *)MEMORY[0x1E4FA6278];
      [v8 displayName];
      v69 = id v68 = v6;
      BOOL v58 = v15;
      id v63 = v7;
      char v61 = v10;
      if (v15)
      {
        v56 = 0;
        id v64 = 0;
      }
      else
      {
        v53 = [v12 info];
        v56 = [v53 staticApplicationShortcutItems];
        id v64 = [v12 dynamicApplicationShortcutItems];
      }
      id v38 = [v12 info];
      id v39 = [v38 itemID];
      uint64_t v40 = [v39 unsignedIntegerValue];
      uint64_t v41 = [v12 info];
      char v42 = [v41 supportsMultiwindow];
      char v43 = [v12 isSystemApplication];
      char v44 = [v12 isInternalApplication];
      CGPoint v45 = [v12 info];
      BYTE5(v51) = v61;
      BYTE4(v51) = v54;
      BYTE3(v51) = [v45 isBeta];
      BYTE2(v51) = v44;
      BYTE1(v51) = v43;
      LOBYTE(v51) = v42;
      id v36 = v66;
      uint64_t v23 = objc_msgSend(v55, "composedShortcutsForApplicationWithBundleIdentifier:iconDisplayName:staticItems:dynamicItems:applicationItemID:numberOfDisplayItemsInSwitcher:supportsMultipleWindows:isSystemApplication:isInternalApplication:isApplicationInBeta:isApplicationHidden:iconManagerAllowsEditing:removeStyle:", v66, v69, v56, v64, v40, v57, v51, v60);

      if (v58)
      {
        id v6 = v68;
        double v9 = v62;
        id v7 = v63;
        id v14 = v59;
LABEL_25:

LABEL_26:
        goto LABEL_35;
      }

      double v9 = v62;
      id v7 = v63;
      id v14 = v59;
      char v34 = v53;
    }
    else
    {
      if (!v13)
      {
        uint64_t v23 = 0;
        goto LABEL_26;
      }
      id v68 = v6;
      [(SBHomeScreenController *)self applicationPlaceholderController];
      v31 = id v30 = v14;
      double v32 = [v31 placeholdersByDisplayID];
      BOOL v65 = (unint64_t)[v32 count] > 1;

      LOBYTE(v31) = [v30 canBeShared];
      v70 = (void *)MEMORY[0x1E4FA6278];
      uint64_t v67 = [v8 applicationBundleID];
      uint64_t v33 = [v8 displayName];
      char v34 = [v30 applicationItemID];
      uint64_t v35 = [v34 unsignedIntegerValue];
      LOBYTE(v52) = (_BYTE)v31;
      id v14 = v30;
      id v36 = (void *)v67;
      LOBYTE(v51) = v10;
      __int16 v37 = v70;
      v69 = (void *)v33;
      uint64_t v23 = [v37 composedShortcutsForDownloadingApplicationWithBundleIdentifier:v67 iconDisplayName:v33 applicationItemID:v35 canModifyDownloadState:1 prioritizationIsAvailable:v65 downloadingInformationAgent:v14 iconManagerAllowsEditing:v51 removeStyle:v11 canShare:v52];
    }

    id v6 = v68;
    goto LABEL_25;
  }
  if ([v8 isBookmarkIcon])
  {
    id v20 = (void *)MEMORY[0x1E4FA6278];
    id v21 = v8;
    uint64_t v22 = [v21 displayName];
    uint64_t v23 = [v20 composedShortcutsForBookmarkIcon:v21 withDisplayName:v22 iconManagerAllowsEditing:v10 removeStyle:v11];

    goto LABEL_35;
  }
  if ([v8 isFolderIcon])
  {
    int v24 = objc_alloc_init(SBForceTouchAppIconInfoProvider);
    __int16 v25 = (void *)MEMORY[0x1E4FA6278];
    __int16 v26 = [(SBHomeScreenController *)self iconManager];
    [v26 iconImageCache];
    v28 = uint64_t v27 = v11;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __74__SBHomeScreenController_iconManager_applicationShortcutItemsForIconView___block_invoke;
    v72[3] = &unk_1E6AFB950;
    id v73 = v24;
    BOOL v29 = v24;
    uint64_t v23 = [v25 composedShortcutsForFolderIcon:v8 iconImageCache:v28 iconManagerAllowsEditing:v10 removeStyle:v27 badgeViewGenerator:v72];
  }
  else
  {
    if (![v8 isWidgetIcon])
    {
      uint64_t v23 = 0;
      goto LABEL_35;
    }
    CGRect v46 = [v7 customIconImageViewController];
    char v47 = objc_opt_respondsToSelector();

    if (v47)
    {
      v48 = [v7 customIconImageViewController];
      BOOL v29 = [v48 applicationShortcutItems];
    }
    else
    {
      BOOL v29 = 0;
    }
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4FA6278], "composedShortcutsForWidgetIcon:additionalApplicationShortcutItems:widgetIconSupportsConfiguration:iconManagerAllowsEditing:widgetSettings:", v8, v29, objc_msgSend(v7, "supportsConfigurationCard"), v10, self->_widgetSettings);
  }

LABEL_35:
  id v49 = SBLogIcon();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v75 = v71;
    __int16 v76 = 2114;
    id v77 = v23;
    _os_log_impl(&dword_1D85BA000, v49, OS_LOG_TYPE_DEFAULT, "%p: iconManager:applicationShortcutItemsForIconView: %{public}@", buf, 0x16u);
  }

  return v23;
}

id __74__SBHomeScreenController_iconManager_applicationShortcutItemsForIconView___block_invoke(uint64_t a1, void *a2)
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
    uint64_t v27 = [v11 icon];
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
    v64[2] = __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke;
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
    uint64_t v35 = [v34 applicationBundleID];
    id v36 = [v33 applicationWithBundleIdentifier:v35];

    if ([v36 isHidden])
    {
      __int16 v37 = [(SBHomeScreenController *)self rootViewController];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2;
      v62[3] = &unk_1E6AF5290;
      v62[4] = self;
      id v63 = v12;
      id v38 = _SBUnhideProtectedAppAlertControllerFor(v36, v62);
      [v37 presentViewController:v38 animated:1 completion:0];
    }
    else
    {
      [(SBHomeScreenController *)self addIconToHomeScreen:v12];
    }
    [(SBHomeScreenController *)self addIconToHomeScreen:v12];

    goto LABEL_7;
  }
  if ([v12 isApplicationIcon])
  {
    id v57 = v12;
    if ([v13 isEqualToString:*MEMORY[0x1E4FA6840]])
    {
      v56 = [(id)SBApp windowSceneManager];
      uint64_t v40 = [v56 activeDisplayWindowScene];
      uint64_t v41 = [v40 _fbsDisplayConfiguration];
      char v42 = +[SBApplicationMultiwindowService sharedInstance];
      char v43 = [v57 applicationBundleID];
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
      v53 = [v9 iconShareSheetManager];
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
    char v44 = [v10 userInfo];
    id v25 = [v44 objectForKey:*MEMORY[0x1E4FA6770]];

    if (v25)
    {
      CGPoint v45 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
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
      CGRect v46 = [(SBHomeScreenController *)self applicationController];
      char v47 = [v10 bundleIdentifierToLaunch];
      v48 = [v46 applicationWithBundleIdentifier:v47];

      SBWorkspaceActivateApplication(v48);
    }
    else if ([v13 isEqualToString:*MEMORY[0x1E4FA67F8]])
    {
      uint64_t v52 = [v11 location];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3;
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
    uint64_t v51 = [v11 customIconImageViewController];
    [v51 didSelectApplicationShortcutItem:v10];
  }
  BOOL v14 = 1;
LABEL_8:
  BOOL v15 = NSString;
  uint64_t v16 = [(SBHomeScreenController *)self _aggregateLoggingAppKeyForIcon:v12];
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
    uint64_t v67 = self;
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
    id v75 = v20;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "%p: iconManager:shouldActivateApplicationShortcutItem:%{public}@ atIndex:%lu forIconView:%{public}@ -- Returning %{public}@", buf, 0x34u);
  }

  return v14;
}

void __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endForbiddingEditingModeWithReason:@"SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"];
}

uint64_t __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addIconToHomeScreen:*(void *)(a1 + 40)];
}

void __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3(uint64_t a1)
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
    goto LABEL_9;
  }
  char v8 = [v5 isApplicationIcon];

  if (v8)
  {
LABEL_7:
    id v7 = [v5 applicationBundleID];
    unint64_t v6 = _SBHMultitaskingApplicationSupportedShortcutActionMaskFromSBSMask([(SBHomeScreenController *)self supportedMultitaskingShortcutActionsForBundleIdentifier:v7]);
LABEL_9:

    goto LABEL_10;
  }
LABEL_4:
  unint64_t v6 = 0;
LABEL_10:

  return v6;
}

- (unint64_t)supportedMultitaskingShortcutActionsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self applicationController];
  unint64_t v6 = [v5 applicationWithBundleIdentifier:v4];

  if (v6)
  {
    id v7 = [(id)SBApp windowSceneManager];
    char v8 = [v7 activeDisplayWindowScene];
    id v9 = [v8 switcherController];

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
  id v4 = [(SBHomeScreenController *)self iconManager];
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
  if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
  {
    char v8 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    id v9 = [v8 modalLibraryController];
    unint64_t v10 = [v9 libraryViewController];
  }
  else
  {
    unint64_t v10 = [(SBHomeScreenController *)self overlayLibraryViewController];
  }
  [v10 forcedSearchTextFieldNoneditable:1];
  [v4 setDisablesScrollingToLastIconPageForLibraryDismissal:1];
  [(SBHomeScreenController *)self dismissHomeScreenOverlaysAnimated:1];
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
    id v7 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    char v8 = [v7 floatingDockController];
    if ([v8 isFloatingDockPresented])
    {
      id v9 = [v11 location];
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
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
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

- (void)_colorDropperWillPresent:(id)a3
{
  id v5 = a3;
  id v17 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  unint64_t v6 = [v17 floatingDockController];
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  if (colorPickerInterfactionFloatingDockBehaviorAssertion) {
    [(SBFloatingDockBehaviorAssertion *)colorPickerInterfactionFloatingDockBehaviorAssertion invalidate];
  }
  char v8 = [SBFloatingDockBehaviorAssertion alloc];
  id v9 = [v5 name];

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

  [(SBHomeScreenController *)self _beginDisablingAllOrientationChangesForReason:@"SBIconControllerDisableRotationForStyleColorDropperReason"];
}

- (void)_colorDropperDismissed:(id)a3
{
  [(SBFloatingDockBehaviorAssertion *)self->_colorPickerInterfactionFloatingDockBehaviorAssertion invalidate];
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = 0;

  [(BSInvalidatable *)self->_duckWallpaperDimmingAssertion invalidate];
  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = 0;

  [(SBHomeScreenController *)self _endDisablingAllOrientationChangesForReason:@"SBIconControllerDisableRotationForStyleColorDropperReason"];
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
    id v5 = [(SBHomeScreenController *)self policyAggregator];
    int v6 = [v5 allowsCapability:9];

    if (v6)
    {
      if (!self->_spotlightInteractiveGestureTransaction)
      {
        id v7 = (void *)SBApp;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke;
        v11[3] = &unk_1E6AF99E8;
        id v12 = v4;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2;
        void v8[3] = &unk_1E6AFB9A0;
        id v9 = v12;
        unint64_t v10 = self;
        [v7 beginInteractiveSpotlightTransientOverlayPresentationWithValidator:v11 beginHandler:v8];
      }
    }
  }
}

uint64_t __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDragging];
}

void __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) isDragging])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 312), a2);
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v5 = [v4 completionBlock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3;
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

void __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[39];
    WeakRetained[39] = 0;
    id v5 = WeakRetained;

    id WeakRetained = v5;
  }
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4) {
    [(SBHomeScreenController *)self _startSpotlightInteractiveGestureTransactionForGesture:a3];
  }
}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  id v7 = a3;
  if ([v7 isTracking])
  {
    if (self->_spotlightInteractiveGestureTransaction
      || ([(SBHomeScreenController *)self _startSpotlightInteractiveGestureTransactionForGesture:v7], self->_spotlightInteractiveGestureTransaction))
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
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 isSpringBoardElement])
        {
          uint64_t v13 = [v12 identifier];
          int v14 = [v13 isEqualToString:v10];

          if (v14)
          {
            v8 |= 0x10uLL;
          }
          else
          {
            BOOL v15 = [v12 identifier];
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
  block[2] = __67__SBHomeScreenController_publisher_didUpdateLayout_withTransition___block_invoke;
  block[3] = &unk_1E6AF4A70;
  void block[4] = self;
  block[5] = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__SBHomeScreenController_publisher_didUpdateLayout_withTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconOcclusionReasons:", objc_msgSend(*(id *)(a1 + 32), "iconOcclusionReasons") & 0xFFFFFFFFFFFFFFCFLL | *(void *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibleIconsAfterOcclusionChange];
}

- (UIView)containerView
{
  uint64_t v2 = [(SBHomeScreenController *)self homeScreenViewController];
  id v3 = [v2 iconContentView];

  return (UIView *)v3;
}

- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4
{
  id v5 = SBLogIconDragging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "alert item will activate", v7, 2u);
  }

  uint64_t v6 = [(SBHomeScreenController *)self iconManager];
  [v6 cancelAllDrags];
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  if (objc_msgSend(a4, "isMainDisplayWindowScene", a3))
  {
    id v5 = SBLogIconDragging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "assistant will appear", v8, 2u);
    }

    uint64_t v6 = [(SBHomeScreenController *)self iconManager];
    [v6 setEditing:0];

    uint64_t v7 = [(SBHomeScreenController *)self iconManager];
    [v7 cancelAllDrags];
  }
}

- (void)iconManager:(id)a3 willDestroyRootFolderController:(id)a4
{
  id v5 = a4;
  [v5 removePageStateObserver:self];
  [v5 setAccessoryViewControllerDelegate:0];

  id v12 = [(SBHomeScreenController *)self homeScreenViewController];
  uint64_t v6 = [v12 iconContentView];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  [v10 setContentView:0];
  id v11 = [(SBHomeScreenController *)self spotlightViewController];
  [v11 invalidate];

  [(SBHomeScreenController *)self setSpotlightViewController:0];
}

- (void)iconManager:(id)a3 willDestroyRootViewController:(id)a4
{
  id v5 = a4;
  id v11 = [(SBHomeScreenController *)self homeScreenViewController];
  uint64_t v6 = [v11 iconContentView];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  [v10 setContentView:0];
  [v5 removeFromParentViewController];

  [(SBHomeScreenController *)self setRootViewController:0];
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
      id v11 = [(SBHomeScreenController *)self legibilitySettings];
      [v10 setLegibilitySettings:v11];

      [v10 setAccessibilityIdentifier:@"spotlight-pill"];
      [(SBHomeScreenController *)self setScrollAccessoryAuxiliaryView:v10];
      [v6 setScrollAccessoryAuxiliaryView:v10];
      id v12 = [(SBHomeScreenController *)self _newSearchPillBackgroundView];
      [v6 setScrollAccessoryBackgroundView:v12];
    }
    else
    {
      [(SBHomeScreenController *)self setScrollAccessoryAuxiliaryView:0];
    }
    uint64_t v13 = [[SBHomeScreenSpotlightViewController alloc] initWithDelegate:self];
    [(SBHomeScreenController *)self setSpotlightViewController:v13];
    int v14 = [[SBSpotlightPresentableViewController alloc] initWithSpotlightMultiplexingViewController:v13];
    [(SBSpotlightPresentableViewController *)v14 setDelegate:self];
    [(SBHomeScreenController *)self setSearchPresentableViewController:v14];
    BOOL v15 = [SBSearchPresenter alloc];
    int v16 = [MEMORY[0x1E4FA6270] rootSettings];
    id v17 = [v16 homeScreenPullToSearchSettings];
    BOOL v18 = [(SBHomeScreenController *)self _identifierForSearchPresenter];
    long long v19 = [(SBSearchPresenter *)v15 initWithSettings:v17 identifier:v18];

    [(SBSearchPresenter *)v19 setSearchPresenterDelegate:self];
    [(SBSearchPresenter *)v19 setUsesTransitionDistanceAsStartOffset:1];
    [(SBHomeScreenController *)self setSearchPresenter:v19];
    [v6 setSearchPresenter:v19];
    [v6 setSearchPresentableViewController:v14];
  }
  else
  {
    [(SBHomeScreenController *)self setSpotlightViewController:0];
    [(SBHomeScreenController *)self setSearchPresentableViewController:0];
    [(SBHomeScreenController *)self setSearchPresenter:0];
    if ([MEMORY[0x1E4FA5E28] enableFloatingWindow]) {
      goto LABEL_10;
    }
    uint64_t v13 = [[SBHomeScreenSpotlightViewController alloc] initWithDelegate:self];
    [(SBSpotlightMultiplexingViewController *)v13 setSpotlightDelegate:self];
    [(SBHomeScreenController *)self setSpotlightViewController:v13];
    [v6 setPullDownSearchViewController:v13];
  }

LABEL_10:
  if ([(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled])
  {
    long long v20 = [(SBHomeScreenController *)self todayViewController];
    [v6 setLeadingCustomViewController:v20];

    long long v21 = [(SBHomeScreenController *)self overlayLibraryViewController];
    [v6 setTrailingCustomViewController:v21];

    long long v22 = [(SBHomeScreenController *)self overlayLibraryViewController];
    [v22 setPresenter:v26];
  }
  uint64_t v23 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ([(SBHomeScreenController *)self allowsHomeScreenOverlay]) {
      [v6 setIgnoresOverscrollOnFirstPageOrientations:30];
    }
    [v6 setFolderPageManagementAllowedOrientations:30];
    [v6 setShowsAddWidgetButtonWhileEditingAllowedOrientations:30];
    if ([(SBHomeScreenController *)self isFocusAllowedForIconManager:v26]) {
      [v6 setAddsFocusGuidesForWrapping:1];
    }
  }
  else
  {
    if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled])
    {
      [v6 setIgnoresOverscrollOnFirstPageOrientations:30];
      if ([(SBHomeScreenController *)self isAppLibrarySupported]) {
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
  int v14 = [(SBHTodayViewController *)v12 initWithListLayoutProvider:v13 iconViewProvider:v10 location:a6];

  if (!v14)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBHomeScreenController.m" lineNumber:4205 description:@"Today view controller is not initialized."];
  }
  if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled]) {
    [(SBHTodayViewController *)v14 setIconLocation:*MEMORY[0x1E4FA66E0]];
  }
  [(SBHTodayViewController *)v14 setDelegate:self];
  [(SBHTodayViewController *)v14 addObserver:self];
  [(SBHTodayViewController *)v14 setRootFolder:v11];

  [(SBHTodayViewController *)v14 setIconManager:v10];
  -[SBHTodayViewController setEditing:](v14, "setEditing:", [v10 isEditing]);

  return v14;
}

- (void)iconManager:(id)a3 didCreateRootFolderController:(id)a4
{
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v12 addPageStateObserver:self];
  [v12 setAccessoryViewControllerDelegate:self];
  id v6 = (void *)MEMORY[0x1E4FA61C8];
  uint64_t v7 = [WeakRetained screen];
  id v8 = [(SBHomeScreenController *)self animationWindow];
  int v9 = [(SBHomeScreenController *)self homeScreenContentView];
  id v10 = [v6 contextWithScreen:v7 animationWindow:v8 fallbackIconContainer:v9];
  [v12 setAnimationContext:v10];

  id v11 = [v12 searchGesture];
  [v11 addObserver:self];

  if ([WeakRetained isContinuityDisplayWindowScene]) {
    [v12 setParallaxDisabled:1 forReason:@"Continuity"];
  }
}

- (void)iconManager:(id)a3 didCreateRootViewController:(id)a4
{
  id v5 = a4;
  [(SBHomeScreenController *)self updateHomeScreenTraitOverridesForViewController:v5];
  id v6 = (void *)*MEMORY[0x1E4F43630];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __66__SBHomeScreenController_iconManager_didCreateRootViewController___block_invoke;
  long long v21 = &unk_1E6AF5290;
  long long v22 = self;
  id v7 = v5;
  id v23 = v7;
  [v6 _performBlockAfterCATransactionCommits:&v18];
  id v8 = objc_msgSend(v7, "view", v18, v19, v20, v21, v22);
  int v9 = [(SBHomeScreenController *)self homeScreenViewController];
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

  BOOL v15 = [(SBHomeScreenController *)self userInterfaceController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v15 updateStatusBarLegibilityForWindowScene:WeakRetained];

  [(SBHomeScreenController *)self setRootViewController:v7];
  id v17 = [(SBHomeScreenController *)self searchPresentableViewController];
  [v17 invalidateSearchAffordanceView];

  if (v7 && v9) {
    [(SBHomeScreenController *)self _updateLegibility];
  }
}

uint64_t __66__SBHomeScreenController_iconManager_didCreateRootViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeHomeScreenTraitOverridesForViewController:*(void *)(a1 + 40)];
}

- (int64_t)interfaceOrientationForIconManager:(id)a3
{
  id v3 = [(SBHomeScreenController *)self homeScreenViewController];
  int64_t v4 = [v3 effectiveOrientation];

  return v4;
}

- (unint64_t)allowedInterfaceOrientationsForIconManager:(id)a3
{
  id v3 = [(SBHomeScreenController *)self homeScreenViewController];
  unint64_t v4 = [v3 allowedInterfaceOrientations];

  return v4;
}

- (unint64_t)possibleInterfaceOrientationsForIconManager:(id)a3
{
  id v3 = [(SBHomeScreenController *)self homeScreenViewController];
  unint64_t v4 = [v3 possibleInterfaceOrientations];

  return v4;
}

- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3
{
  id v3 = [(SBHomeScreenController *)self _currentMainDisplayLayoutState];
  BOOL v4 = [v3 unlockedEnvironmentMode] == 1;

  return v4;
}

- (BOOL)isEditingAllowedForIconManager:(id)a3
{
  if (-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self)) {
    return 0;
  }
  id v5 = [(SBHomeScreenController *)self policyAggregator];
  char v6 = [v5 allowsCapability:17];

  return v6;
}

- (BOOL)iconManager:(id)a3 isPartialEditingAllowedForIconLocation:(id)a4
{
  id v5 = a4;
  if ((-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self) & 1) != 0
    || ([(SBHomeScreenController *)self _iconController],
        char v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasRestrictedEnforcedLayout],
        v6,
        !v7))
  {
    char v8 = 0;
  }
  else
  {
    char v8 = SBIconLocationGroupContainsLocation();
  }

  return v8;
}

- (void)iconManagerEditingDidChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self homeScreenOverlayController];
  [v5 updateExtraButtonVisibilityAnimated:1];

  if ([v4 isEditing])
  {
    id v23 = v4;
    [(id)SBApp windowSceneManager];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v22 = v31 = 0u;
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
            id v14 = [(SBHomeScreenController *)self floatingDockBehaviorAssertions];
            if (v14)
            {
              BOOL v15 = v14;
              int v16 = [v14 setByAddingObject:v13];
            }
            else
            {
              int v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v13, 0);
            }
            [(SBHomeScreenController *)self setFloatingDockBehaviorAssertions:v16];
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
    id v17 = [(SBHomeScreenController *)self floatingDockBehaviorAssertions];
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

    [(SBHomeScreenController *)self setFloatingDockBehaviorAssertions:0];
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
  uint64_t v8 = [(SBHomeScreenController *)self _libraryViewControllers];
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
  id v4 = [(SBHomeScreenController *)self _libraryViewControllers];
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
        uint64_t v11 = [(SBHomeScreenController *)self _appLibraryListLayoutProviderForWindowScene:v10];
        [v9 setListLayoutProvider:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHomeScreenController *)self _iconController];
  uint64_t v6 = [v5 localizedFolderNameForDefaultDisplayName:v4];

  return v6;
}

- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHomeScreenController *)self _iconController];
  uint64_t v7 = [v6 localizedFolderNameForDefaultDisplayName:v5];

  return v7;
}

- (id)localizedDefaultFolderNameForIconManager:(id)a3
{
  id v3 = [(SBHomeScreenController *)self _iconController];
  id v4 = [v3 localizedFolderNameForDefaultDisplayName:@"Folder"];

  return v4;
}

- (void)iconManagerDidFinishInstallForIcon:(id)a3
{
  id v4 = [(SBHomeScreenController *)self _currentMainDisplayLayoutState];
  uint64_t v5 = [v4 unlockedEnvironmentMode];

  if (v5 == 1)
  {
    [(SBHomeScreenController *)self _showInfoAlertIfNeeded:1];
  }
}

- (void)iconManager:(id)a3 possibleUserIconTapBegan:(id)a4
{
}

- (void)iconManager:(id)a3 possibleUserIconTapBeganAfterInformingIcon:(id)a4
{
}

- (void)iconManager:(id)a3 willPrepareIconViewForLaunch:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(SBHomeScreenController *)self delayedLaunchRequestTimer];
  [v6 invalidate];

  [(SBHomeScreenController *)self setDelayedLaunchRequestTimer:0];
  uint64_t v7 = [v5 icon];
  uint64_t v8 = [v5 location];

  uint64_t v9 = [(SBHomeScreenController *)self rootFolder];
  uint64_t v10 = [v9 indexPathForIcon:v7];

  uint64_t v11 = *MEMORY[0x1E4FA7558];
  v20[0] = v8;
  uint64_t v12 = *MEMORY[0x1E4FA7550];
  v19[0] = v11;
  v19[1] = v12;
  long long v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isFolderIcon"));
  v20[1] = v13;
  v19[2] = *MEMORY[0x1E4FA7548];
  long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "indexAtPosition:", objc_msgSend(v10, "length") - 1));
  v20[2] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  long long v16 = (void *)MEMORY[0x1E4FA5E78];
  id v17 = v15;
  uint64_t v18 = [v16 sharedInstance];
  [v18 emitEvent:9 withPayload:v17];
}

- (void)iconManager:(id)a3 didReceiveTapOnLaunchDisabledIconView:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(SBHomeScreenController *)self delayedLaunchRequestTimer];
  [v6 invalidate];

  [(SBHomeScreenController *)self setDelayedLaunchRequestTimer:0];
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

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBHomeScreenController *)self delayedLaunchRequestTimer];
  [v11 invalidate];

  [(SBHomeScreenController *)self setDelayedLaunchRequestTimer:0];
  uint64_t v12 = [v9 icon];
  if ([v12 isApplicationIcon]
    && ([v12 application],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isAnyTerminationAssertionInEffect],
        v13,
        v14))
  {
    long long v15 = SBLogIcon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v12 applicationBundleID];
      *(_DWORD *)buf = 138412290;
      long long v29 = v16;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Delaying launch of %@ because termination assertion is held", buf, 0xCu);
    }
    id v17 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v22 = __86__SBHomeScreenController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke;
    id v23 = &unk_1E6AFB9C8;
    long long v24 = self;
    id v25 = v9;
    id v26 = v10;
    int64_t v27 = a6;
    uint64_t v18 = [v17 timerWithTimeInterval:0 repeats:&v20 block:1.0];
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v20, v21, v22, v23, v24);
    [v19 addTimer:v18 forMode:*MEMORY[0x1E4F1C4B0]];

    [(SBHomeScreenController *)self setDelayedLaunchRequestTimer:v18];
  }
  else
  {
    [(SBHomeScreenController *)self _launchFromIconView:v9 withActions:v10 modifierFlags:a6];
  }
}

uint64_t __86__SBHomeScreenController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchFromIconView:*(void *)(a1 + 40) withActions:*(void *)(a1 + 48) modifierFlags:*(void *)(a1 + 56)];
}

- (void)iconManager:(id)a3 touchesEndedForIconView:(id)a4
{
}

- (id)iconManager:(id)a3 launchActionsForIconView:(id)a4
{
  return [(SBHomeScreenController *)self launchActionsForIconView:a4];
}

- (id)iconManager:(id)a3 launchURLForIconView:(id)a4
{
  return [(SBHomeScreenController *)self launchURLForIconView:a4];
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
      long long v16 = [(SBHomeScreenController *)self applicationController];
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
    uint64_t v30 = v15;
    __int16 v31 = 2112;
    double v32 = v13;
    _os_log_fault_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_FAULT, "Fallback launch path: Trying to launch app icon: %@ (%@), found app: %@", (uint8_t *)&v27, 0x20u);
  }

  BOOL v17 = v13 != 0;
  if (v13)
  {
    uint64_t v19 = [(SBHomeScreenController *)self userInterfaceController];
    uint64_t v20 = objc_alloc_init(SBActivationSettings);
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
    [v19 activateApplication:v13 fromIcon:v10 location:v11 activationSettings:v20 actions:v21];

    if (v15)
    {
      long long v22 = [(SBHomeScreenController *)self model];
      id v23 = [v22 applicationIconForBundleIdentifier:v15];

      if (v23 && v23 != v10)
      {
        long long v24 = [(SBHomeScreenController *)self rootFolder];
        id v25 = [v24 indexPathForIcon:v10];
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
  uint64_t v6 = [(SBHomeScreenController *)self homeScreenViewController];
  uint64_t v7 = [v6 containerViewForPresentingContextMenuForIconView:v5];

  return v7;
}

- (id)iconManager:(id)a3 containerViewControllerForConfigurationOfIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "location", a3);
  uint64_t v6 = [(SBHomeScreenController *)self homeScreenViewController];
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
  id v5 = [(SBHomeScreenController *)self iconManager:a3 containerViewControllerForConfigurationOfIconView:a4];
  uint64_t v6 = [(SBHomeScreenController *)self homeScreenViewController];
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
  id v7 = [(SBHomeScreenController *)self iconManager:a3 containerViewForConfigurationOfIconView:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
    id v10 = [v6 location];
    id v11 = v9;
    if (SBIconLocationGroupContainsLocation())
    {
      id v11 = v9;
      if ([(SBHomeScreenController *)self isTodayOverlayPresented])
      {
        uint64_t v12 = [(SBHomeScreenController *)self todayViewController];
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
    && [(SBHomeScreenController *)self isTodayOverlayPresented])
  {
    id v6 = [(SBHomeScreenController *)self todayViewController];
  }
  else
  {
    id v6 = [(SBHomeScreenController *)self _rootFolderController];
  }
  id v7 = v6;
  uint64_t v8 = [v6 view];

  return v8;
}

- (id)iconManager:(id)a3 containerViewControllerForModalInteractionFromIconView:(id)a4
{
  id v5 = objc_msgSend(a4, "location", a3);
  id v6 = [(SBHomeScreenController *)self homeScreenViewController];
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
  id v5 = [(SBHomeScreenController *)self iconManager:a3 containerViewControllerForModalInteractionFromIconView:a4];
  id v6 = [(SBHomeScreenController *)self homeScreenViewController];
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
    id v6 = [(SBHomeScreenController *)self coverSheetPresentationManager];
    int v7 = [v6 isVisible];

    if (v7) {
      [(SBHomeScreenController *)self coverSheetTodayViewController];
    }
    else {
    uint64_t v8 = [(SBHomeScreenController *)self todayViewController];
    }
    if ([v8 _appearState] == 2 || objc_msgSend(v8, "_appearState") == 1)
    {
      id v9 = [(SBHomeScreenController *)self todayViewController];
      id v10 = [v9 view];

      goto LABEL_10;
    }
  }
  uint64_t v8 = [(SBHomeScreenController *)self _rootFolderController];
  id v10 = [v8 view];
LABEL_10:

  return v10;
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationWillBeginWithInteraction:(id)a5
{
  id v15 = a5;
  id v6 = [(SBHomeScreenController *)self _iconController];
  int v7 = [v6 powerLogAggregator];
  [v7 emitEventOfType:1];

  if (!self->_widgetConfigurationFloatingDockBehaviorAssertion)
  {
    uint64_t v8 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    id v9 = [v8 floatingDockController];
    id v10 = [SBFloatingDockBehaviorAssertion alloc];
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    double v13 = [(SBFloatingDockBehaviorAssertion *)v10 initWithFloatingDockController:v9 visibleProgress:1 animated:1 gesturePossible:3 atLevel:v12 reason:0 withCompletion:0.0];
    widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
    self->_widgetConfigurationFloatingDockBehaviorAssertion = v13;
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
    id v12 = [(SBHomeScreenController *)self mainDisplayWindowScene];
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
  [(SBHomeScreenController *)self minimumHomeScreenScale];
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
  BOOL v7 = [(SBHomeScreenController *)self isAppLibrarySupported];
  int v8 = [v6 isApplicationIcon];
  BOOL v9 = v8 && v7 || [(SBHomeScreenController *)self isUninstallSupportedForIcon:v6];
  id v10 = [v5 location];
  id v11 = [(SBHomeScreenController *)self mainDisplayWindowScene];
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
    char v13 = [(SBHomeScreenController *)self isUninstallSupportedForIcon:v6];
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (void)iconManager:(id)a3 wantsUninstallForIcon:(id)a4 location:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  id v10 = [v9 floatingDockController];
  if (([v10 handlePromptingUserToUninstallIcon:v7 location:v8] & 1) == 0)
  {
    if ([v7 isApplicationIcon])
    {
      id v11 = [(SBHomeScreenController *)self applicationController];
      id v12 = [v7 applicationBundleID];
      BOOL v13 = [(SBHomeScreenController *)self isUninstallSupportedForIcon:v7];
      if (v12 && (v13 || [(SBHomeScreenController *)self isAppLibrarySupported]))
      {
        if ([(SBHomeScreenController *)self isAppLibrarySupported]) {
          uint64_t v14 = SBIconLocationGroupContainsLocation() ^ 1;
        }
        else {
          uint64_t v14 = 0;
        }
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke;
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
        id v16 = [(SBHomeScreenController *)self iconManager];
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
      CGRect v19 = [(SBHomeScreenController *)self alertItemsController];
      [v19 activateAlertItem:v11];
    }
  }
}

void __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke(uint64_t a1, int a2, int a3, void *a4)
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
    v16[2] = __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_2;
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
    uint8_t v14[2] = __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_3;
    v14[3] = &unk_1E6AF5350;
    id v15 = v8;
    [v12 addIconToIgnoredList:v13 options:1 completion:v14];

    id v11 = v15;
  }

LABEL_9:
}

uint64_t __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
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
      double v6 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v5 = [v6 userInterfaceIdiom] != 1;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)iconManager:(id)a3 canBeginDragForIconView:(id)a4
{
  id v4 = +[SBWorkspace mainWorkspace];
  BOOL v5 = [v4 transientOverlayPresentationManager];
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
          id v12 = [(SBHomeScreenController *)self model];
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
  return ![(SBHomeScreenController *)self _dragSessionContainsAppClipWebClipIcon:a4];
}

- (BOOL)iconManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  return ![(SBHomeScreenController *)self _dragSessionContainsAppClipWebClipIcon:a4];
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
      id v12 = [(SBHomeScreenController *)self iconManager];
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
  if ([(SBHomeScreenController *)self shouldCommandeerContentDragsInLocation:v7])
  {
    id v8 = +[SBDraggingSystemManager sharedInstance];
    [v8 setCommandeered:1 forDropSession:v9 forReason:@"SBIconController-ContentDrag"];
  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidExit:(id)a5
{
  id v9 = a5;
  uint64_t v7 = [a4 location];
  if ([(SBHomeScreenController *)self shouldCommandeerContentDragsInLocation:v7])
  {
    id v8 = +[SBDraggingSystemManager sharedInstance];
    [v8 setCommandeered:0 forDropSession:v9 forReason:@"SBIconController-ContentDrag"];
  }
}

- (BOOL)shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:(id)a3
{
  return 1;
}

- (id)iconManager:(id)a3 backgroundViewForComponentsOfIconView:(id)a4
{
  if ([(SBHomeScreenController *)self shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:a4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1];
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
  LOBYTE(a5) = [(SBHomeScreenController *)self shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:a5];
  id v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return (a5 ^ isKindOfClass) & 1;
}

- (BOOL)iconManager:(id)a3 supportsParallaxForIconView:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  char v5 = [v4 isMainDisplayWindowScene];

  return v5;
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
    v20[2] = __84__SBHomeScreenController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke;
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

void __84__SBHomeScreenController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    uint64_t v6 = [v5[43] indexOfObject:v10];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [v5[43] removeObjectAtIndex:v6];
    }
    if (!objc_msgSend(v5[43], "count", v6))
    {
      id v7 = v5[43];
      v5[43] = 0;

      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 336);
      *(void *)(v8 + 336) = 0;
    }
    objc_sync_exit(v5);
  }
}

- (id)recycledViewsContainerProviderForIconManager:(id)a3
{
  BOOL v3 = [(SBHomeScreenController *)self userInterfaceController];
  id v4 = [v3 window];

  return v4;
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
  else if ([(SBHomeScreenController *)self isAppLibrarySupported])
  {
    a5 = SBIconLocationGroupContainsLocation() ^ 1;
  }

  return a5;
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4
{
  return [(SBHomeScreenController *)self allowsBadgingForIcon:a4];
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIconLocation:(id)a4
{
  id v4 = a4;
  char v5 = +[SBDefaults localDefaults];
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
  char v5 = [v4 averageColorForVariant:1];

  return v5;
}

- (BOOL)iconManagerCanBeginIconDrags:(id)a3
{
  id v4 = +[SBSetupManager sharedInstance];
  int v5 = [v4 isInSetupMode];

  if (v5)
  {
    uint64_t v6 = SBLogIconDragging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "disallowing icon drag because we are in setup mode", v8, 2u);
    }
  }
  return (-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self) | v5) ^ 1;
}

- (id)iconManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v4 = a4;
  int v5 = [[SBAppPlatterDragPreview alloc] initWithReferenceIconView:v4 sourceView:0];
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
  int v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a4;
  if (([v5 isMainThread] & 1) == 0)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v20 = [NSString stringWithUTF8String:"-[SBHomeScreenController windowForIconDragPreviewsForIconManager:forWindowScene:]"];
    [v19 handleFailureInFunction:v20 file:@"SBHomeScreenController.m" lineNumber:4954 description:@"this call must be made on the main thread"];
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
    [(SBHomeScreenController *)self _beginDisablingAllOrientationChangesForReason:@"SBIconController Dragging"];
  }
  else {
    [(SBHomeScreenController *)self _endDisablingAllOrientationChangesForReason:@"SBIconController Dragging"];
  }
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = [(SBHomeScreenController *)self homeScreenViewController];
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
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4FA7538];
  double v7 = objc_msgSend(a4, "UUIDString", a3);
  v20[0] = v7;
  v19[1] = *MEMORY[0x1E4FA7540];
  double v8 = [NSNumber numberWithUnsignedInteger:a5];
  v20[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
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

    id v17 = [(SBHomeScreenController *)self _iconController];
    long long v18 = [v17 powerLogAggregator];
    [v18 emitEventOfType:2 withDuration:v15];
  }
}

- (void)iconManager:(id)a3 didSpringLoadIconView:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FA74D8];
  v13[0] = &unk_1F334B4E0;
  int v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  double v7 = [v5 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  double v8 = (void *)MEMORY[0x1E4FA5E78];
  id v9 = v7;
  id v10 = [v8 sharedInstance];
  [v10 emitEvent:31 withPayload:v9];

  id v11 = [(SBHomeScreenController *)self iconDragManager];
  [v11 performSpringLoadedInteractionForIconDragOnIconView:v6];
}

- (id)iconManager:(id)a3 wantsToHideStatusBarForFolderController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  double v8 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  id v9 = [v8 statusBarManager];
  id v10 = [v9 assertionManager];

  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"SBFolderController - %p", v7);

  uint64_t v12 = (void *)[v10 newSettingsAssertionWithStatusBarHidden:1 atLevel:1 reason:v11];
  if (v5)
  {
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [v12 acquireWithAnimationParameters:v13];
  }
  else
  {
    [v12 acquire];
  }

  return v12;
}

- (id)iconManager:(id)a3 fakeStatusBarForFolderController:(id)a4
{
  id v4 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  BOOL v5 = [v4 statusBarManager];
  id v6 = [v5 reusePool];
  id v7 = [v6 getReusableStatusBarWithReason:@"SBFolderController - Blurred Status Bar"];

  return v7;
}

- (id)iconManager:(id)a3 statusBarStyleRequestForFolderController:(id)a4
{
  id v4 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  BOOL v5 = [v4 statusBarManager];
  id v6 = [v5 assertionManager];
  id v7 = [v6 effectiveStatusBarStyleRequestForLevel:0];

  return v7;
}

- (void)iconManager:(id)a3 willRemoveFakeStatusBar:(id)a4 forFolderController:(id)a5
{
  id v6 = a4;
  id v9 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  id v7 = [v9 statusBarManager];
  double v8 = [v7 reusePool];
  [v8 recycleStatusBar:v6];
}

- (UIEdgeInsets)iconManager:(id)a3 statusBarEdgeInsetsForFolderController:(id)a4
{
  id v4 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  BOOL v5 = [v4 statusBarManager];
  id v6 = [v5 layoutManager];
  [v6 statusBarEdgeInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.double right = v18;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (UIEdgeInsets)iconManager:(id)a3 contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a4
{
  id v4 = [(SBHomeScreenController *)self homeScreenViewController];
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

- (void)_setFolderDisplayLayoutElementActive:(BOOL)a3
{
  folderDisplayLayoutAssertion = self->_folderDisplayLayoutAssertion;
  if (a3)
  {
    if (folderDisplayLayoutAssertion) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4FA6A68]);
    double v11 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4FA6F48]];
    [v11 setLevel:0];
    [v11 setFillsDisplayBounds:1];
    [v11 setLayoutRole:6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v7 = [WeakRetained displayLayoutPublisher];
    double v8 = [v7 addElement:v11];
    double v9 = self->_folderDisplayLayoutAssertion;
    self->_folderDisplayLayoutAssertion = v8;

    double v10 = (BSInvalidatable *)v11;
  }
  else
  {
    if (!folderDisplayLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)folderDisplayLayoutAssertion invalidate];
    double v10 = self->_folderDisplayLayoutAssertion;
    self->_folderDisplayLayoutAssertion = 0;
  }
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
    double v11 = (void *)[v5 initWithIdentifier:*MEMORY[0x1E4FA6F90]];
    [v11 setLevel:0];
    [v11 setFillsDisplayBounds:1];
    [v11 setLayoutRole:6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v7 = [WeakRetained displayLayoutPublisher];
    double v8 = [v7 addElement:v11];
    double v9 = self->_widgetEditingLayoutAssertion;
    self->_widgetEditingLayoutAssertion = v8;

    double v10 = (BSInvalidatable *)v11;
  }
  else
  {
    if (!widgetEditingLayoutAssertion) {
      return;
    }
    [(BSInvalidatable *)widgetEditingLayoutAssertion invalidate];
    double v10 = self->_widgetEditingLayoutAssertion;
    self->_widgetEditingLayoutAssertion = 0;
  }
}

- (void)iconManager:(id)a3 willOpenFolder:(id)a4
{
  id v4 = a4;
  id v5 = +[SBReachabilityManager sharedInstance];
  [v5 deactivateReachability];

  double v6 = +[SBReachabilityManager sharedInstance];
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
  double v6 = +[SBReachabilityManager sharedInstance];
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
    [(SBHomeScreenController *)self _setFolderDisplayLayoutElementActive:1];
  }
  double v10 = [(SBHomeScreenController *)self homeScreenViewController];
  double v11 = [MEMORY[0x1E4F42A28] focusSystemForEnvironment:v10];
  __int16 v12 = [v11 focusedItem];

  if (v12) {
    [v10 setNeedsFocusUpdate];
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
    [(SBHomeScreenController *)self _setFolderDisplayLayoutElementActive:0];
  }
  double v10 = [(SBHomeScreenController *)self homeScreenViewController];
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
    block[2] = __62__SBHomeScreenController_iconManagerFolderAnimatingDidChange___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleHomeScreen"))
  {
    id v4 = [(SBHomeScreenController *)self homeScreenViewController];
    [v4 setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

void __62__SBHomeScreenController_iconManagerFolderAnimatingDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInterfaceController];
  id v1 = [v2 window];
  objc_msgSend(v1, "sb_updateInterfaceOrientationFromActiveInterfaceOrientation");
}

- (void)iconManager:(id)a3 nestingViewController:(id)a4 willPerformOperation:(int64_t)a5 onViewController:(id)a6 withTransitionCoordinator:(id)a7
{
  id v10 = a4;
  double v11 = NSString;
  id v12 = a7;
  __int16 v13 = [v11 stringWithFormat:@"SBTransitioningToOrFromFolder-<%@ %p>", objc_opt_class(), v10];
  double v14 = [(SBHomeScreenController *)self userInterfaceController];
  [v14 setAllowIconRotation:0 forReason:v13];

  [(SBHomeScreenController *)self _beginDisablingAllOrientationChangesForReason:v13];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10;
  v25[3] = &unk_1E6AFBA60;
  v25[4] = self;
  id v15 = v13;
  id v26 = v15;
  [v12 animateAlongsideTransition:&__block_literal_global_518 completion:v25];

  if (!+[SBFloatingDockController isFloatingDockSupported])
  {
    if (a5 != 1
      && ([(SBHomeScreenController *)self _rootFolderController],
          id v16 = (id)objc_claimAutoreleasedReturnValue(),
          v16,
          v16 == v10))
    {
      id v21 = [(SBHomeScreenController *)self _rootFolderController];
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
    uint64_t v23 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    double v24 = [v23 pictureInPictureManager];
    objc_msgSend(v24, "applyPictureInPictureInsets:forSource:", 1, v18, v17, v19, v20);
  }
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke()
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
      id v5 = &__block_literal_global_524;
    }
    else
    {
      int v6 = [v3 isRunningTest:@"AppClose"];
      id v7 = *v0;
      if (v6)
      {
        [v7 finishedSubTest:@"workspaceDeactivate" forTest:@"AppClose"];
        id v4 = *v0;
        id v5 = &__block_literal_global_529_0;
      }
      else
      {
        int v8 = [v7 isRunningTest:@"AppOpenInFolder"];
        id v9 = *v0;
        if (v8)
        {
          [v9 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenInFolder"];
          id v4 = *v0;
          id v5 = &__block_literal_global_531_0;
        }
        else
        {
          int v10 = [v9 isRunningTest:@"AppCloseInFolder"];
          id v11 = *v0;
          if (v10)
          {
            [v11 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseInFolder"];
            id v4 = *v0;
            id v5 = &__block_literal_global_533_0;
          }
          else
          {
            int v12 = [v11 isRunningTest:@"FolderOpen"];
            id v4 = *v0;
            if (v12)
            {
              id v5 = &__block_literal_global_535;
            }
            else
            {
              int v13 = [v4 isRunningTest:@"FolderClose"];
              id v4 = *v0;
              if (v13)
              {
                id v5 = &__block_literal_global_537;
              }
              else
              {
                int v14 = [v4 isRunningTest:@"AppOpenInScreenTime"];
                id v15 = *v0;
                if (v14)
                {
                  [v15 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenInScreenTime"];
                  id v4 = *v0;
                  id v5 = &__block_literal_global_539;
                }
                else
                {
                  uint64_t result = [v15 isRunningTest:@"AppCloseInScreenTime"];
                  if (!result) {
                    return result;
                  }
                  [*v0 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseInScreenTime"];
                  id v4 = *v0;
                  id v5 = &__block_literal_global_541;
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

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpen"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppClose"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpenInFolder"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppCloseInFolder"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"FolderOpenAnimation" forTest:@"FolderOpen"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"FolderCloseAnimation" forTest:@"FolderClose"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_8()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpenInScreenTime"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_9()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppCloseInScreenTime"];
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) userInterfaceController];
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
    int v8 = __PPTAppCloseAnimationSubTestName;
    goto LABEL_6;
  }
  id v5 = @"AppOpenInFolder";
  int v11 = [v7 isRunningTest:@"AppOpenInFolder"];
  id v7 = *v3;
  if (v11) {
    goto LABEL_3;
  }
  id v5 = @"AppCloseInFolder";
  int v12 = [v7 isRunningTest:@"AppCloseInFolder"];
  id v7 = *v3;
  if (v12) {
    goto LABEL_5;
  }
  int v13 = @"FolderOpen";
  int v14 = [v7 isRunningTest:@"FolderOpen"];
  id v15 = *v3;
  if (!v14)
  {
    int v13 = @"FolderClose";
    int v17 = [v15 isRunningTest:@"FolderClose"];
    id v15 = *v3;
    if (v17)
    {
      id v16 = __PPTFolderCloseAnimationSubTestName;
      goto LABEL_15;
    }
    id v5 = @"AppOpenInScreenTime";
    int v19 = [v15 isRunningTest:@"AppOpenInScreenTime"];
    id v7 = *v3;
    if (!v19)
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
    int v8 = __PPTAppOpenAnimationSubTestName;
LABEL_6:
    int v10 = *v8;
    return [v7 finishedSubTest:v10 forTest:v5];
  }
  id v16 = __PPTFolderOpenAnimationSubTestName;
LABEL_15:
  [v15 finishedSubTest:*v16 forTest:v13];
  id v18 = *v3;
  return [v18 finishedTest:v13];
}

- (BOOL)iconManagerCanSaveIconState:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self _iconController];
  char v6 = [v5 iconManagerCanSaveIconState:v4];

  return v6;
}

- (void)iconManagerDidSaveIconState:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self _iconController];
  [v5 iconManagerDidSaveIconState:v4];
}

- (id)iconManager:(id)a3 animator:(id)a4 animationSettingsForOperation:(unint64_t)a5 childViewController:(id)a6
{
  return [(SBHomeScreenController *)self animator:a4 animationSettingsForOperation:a5 childViewController:a6];
}

- (id)iconManager:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  int v8 = +[SBWallpaperController sharedInstance];
  int v9 = objc_msgSend(v8, "averageColorInRect:forVariant:", 1, x, y, width, height);

  return v9;
}

- (BOOL)isFloatingDockSupportedForIconManager:(id)a3
{
  return +[SBFloatingDockController isFloatingDockSupported];
}

- (BOOL)isFloatingDockVisibleForIconManager:(id)a3
{
  id v3 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  id v4 = [v3 floatingDockController];
  char v5 = [v4 isFloatingDockPresented];

  return v5;
}

- (void)presentTodayOverlayForIconManager:(id)a3
{
  if ([(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled])
  {
    id v4 = [(SBHomeScreenController *)self iconManager];
    [v4 presentLeadingCustomViewWithCompletion:0];
  }
  else
  {
    id v4 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
    [v4 presentAnimated:1 fromLeading:1];
  }
}

- (void)presentLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a4;
  BOOL v7 = [(SBHomeScreenController *)self isAppLibraryAllowed];
  int v8 = v14;
  if (v7)
  {
    if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v14;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          int v11 = v10;
        }
        else {
          int v11 = 0;
        }
      }
      else
      {
        int v11 = 0;
      }
      id v12 = v11;

      int v13 = [v12 modalLibraryController];

      if (([v13 isPresentingLibraryInForeground] & 1) == 0) {
        [v13 toggleLibraryPresentedAnimated:v5 completion:0];
      }
    }
    else
    {
      [(SBHomeScreenController *)self presentLibraryFromOverlayControllerAnimated:v5 completion:0];
    }
    int v8 = v14;
  }
}

- (void)presentLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(SBHomeScreenController *)self isAppLibraryAllowed])
  {
    BOOL v7 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
    if (![v7 isPresented]
      || ([v7 activeSidebarViewController],
          int v8 = objc_claimAutoreleasedReturnValue(),
          [v7 trailingSidebarViewController],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v8 == v9))
    {
      if (![(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled])
      {
        [v7 presentAnimated:v4 fromLeading:0 completionHandler:v6];
        goto LABEL_11;
      }
      int v11 = [(SBHomeScreenController *)self iconManager];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2;
      v12[3] = &unk_1E6AF5300;
      id v13 = v6;
      [v11 presentTrailingCustomViewWithCompletion:v12];

      id v10 = v13;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      uint8_t v14[2] = __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke;
      v14[3] = &unk_1E6AFBA88;
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

uint64_t __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAnimated:*(unsigned __int8 *)(a1 + 48) fromLeading:0 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2(uint64_t a1)
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
  v20[2] = __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke;
  void v20[3] = &unk_1E6AF7268;
  BOOL v24 = v6;
  void v20[4] = self;
  id v21 = v8;
  double v22 = v10;
  id v23 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  id v14 = (void *)MEMORY[0x1D948C7A0](v20);
  id v15 = [(SBHomeScreenController *)self _rootFolderController];
  uint64_t v16 = [v15 lastIconPageIndex];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3;
  v18[3] = &unk_1E6AF5300;
  id v19 = v14;
  id v17 = v14;
  [v15 setCurrentPageIndex:v16 animated:v6 completion:v18];
}

void __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2;
  v4[3] = &unk_1E6AF6980;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v3 presentLibraryFromOverlayControllerAnimated:v2 completion:v4];
}

void __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2(void *a1, int a2)
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

uint64_t __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(SBHomeScreenController *)self _isCoplanarHomeScreenEnabled])
  {
    if ([(SBHomeScreenController *)self isMainDisplayLibraryViewVisible])
    {
      id v7 = [(SBHomeScreenController *)self iconManager];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60__SBHomeScreenController_dismissLibraryAnimated_completion___block_invoke;
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
    [(SBHomeScreenController *)self dismissLibraryFromOverlayControllerAnimated:v4 completion:v6];
  }
}

uint64_t __60__SBHomeScreenController_dismissLibraryAnimated_completion___block_invoke(uint64_t a1)
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
  if ([(SBHomeScreenController *)self isAppLibraryAllowed])
  {
    id v6 = [(SBHomeScreenController *)self _homeScreenOverlayControllerIfNeeded];
    if ([(SBHomeScreenController *)self isMainDisplayLibraryViewVisible]
      && ([v6 activeSidebarViewController],
          id v7 = (SBLibraryViewController *)objc_claimAutoreleasedReturnValue(),
          overlayLibraryViewController = self->_overlayLibraryViewController,
          v7,
          v7 == overlayLibraryViewController))
    {
      [(SBHomeScreenController *)self dismissHomeScreenOverlayControllerAnimated:v4 completion:v10];
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

- (id)_libraryViewControllers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v4 = [(id)SBApp windowSceneManager];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = objc_msgSend(v4, "connectedWindowScenes", 0);
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
          id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) modalLibraryController];
          id v11 = [v10 libraryViewController];

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

- (BOOL)isMainDisplayLibraryViewVisible
{
  uint64_t v2 = [(SBHomeScreenController *)self iconManager];
  char v3 = [v2 isMainDisplayLibraryViewVisible];

  return v3;
}

- (BOOL)isTodayOverlayPresented
{
  uint64_t v2 = [(SBHomeScreenController *)self iconManager];
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
  if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
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
    [(SBHomeScreenController *)self dismissLibraryAnimated:v5 completion:0];
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
  [(SBHomeScreenController *)self dismissAppIconForceTouchControllers:0];
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

- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBHomeScreenController *)self _iconController];
  id v12 = [v11 iconManager:v10 configurationDataForDataSource:v9 ofIcon:v8];

  return v12;
}

- (void)iconManager:(id)a3 dataSource:(id)a4 ofIcon:(id)a5 didUpdateConfigurationData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(SBHomeScreenController *)self _iconController];
  [v14 iconManager:v13 dataSource:v12 ofIcon:v11 didUpdateConfigurationData:v10];
}

- (void)iconManager:(id)a3 didRemoveConfigurableDataSource:(id)a4 ofIcon:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBHomeScreenController *)self _iconController];
  [v11 iconManager:v10 didRemoveConfigurableDataSource:v9 ofIcon:v8];
}

- (void)iconManager:(id)a3 prepareForPageHidingEducationWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHomeScreenController *)self homeScreenOverlayController];
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
  id v12 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  id v13 = [v12 floatingDockController];
  id v14 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v13 visibleProgress:1 animated:0 gesturePossible:1 atLevel:@"pageManagement" reason:0 withCompletion:0.0];
  if (v14) {
    [v9 setObject:v14 forKey:@"SBIconControllerPageHidingFloatingDockBehaviorAssertion"];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __98__SBHomeScreenController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke;
  v18[3] = &unk_1E6AF4AC0;
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

void __98__SBHomeScreenController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke(uint64_t a1)
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
  uint8_t v14[2] = __85__SBHomeScreenController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke;
  v14[3] = &unk_1E6AF4AC0;
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

uint64_t __85__SBHomeScreenController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke(uint64_t a1)
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
    id v4 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    id v5 = [v4 floatingDockController];
    id v6 = [[SBFloatingDockBehaviorAssertion alloc] initWithFloatingDockController:v5 visibleProgress:1 animated:1 gesturePossible:3 atLevel:@"addWidgetSheet" reason:0 withCompletion:0.0];
    addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
    self->_addWidgetSheetFloatingDockBehaviorAssertion = v6;

    id v8 = [(SBHomeScreenController *)self homeScreenViewController];
    id v9 = [v8 iconContentView];
    id v10 = [v9 window];
    if (!self->_addWidgetSheetKeyboardFocusAssertion)
    {
      id v11 = +[SBWorkspace mainWorkspace];
      uint64_t v12 = [v11 keyboardFocusController];
      id v13 = +[SBKeyboardFocusLockReason addWidgetSheet];
      id v14 = [v12 focusLockSpringBoardWindow:v10 forReason:v13];
      addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
      self->_addWidgetSheetKeyboardFocusAssertion = v14;
    }
    if (([v10 isKeyWindow] & 1) == 0) {
      [v10 makeKeyWindow];
    }
  }
  [(SBBarSwipeAffordanceViewController *)self->_widgetAddSheetAffordanceViewController setWantsToBeActiveAffordance:1];
  [(SBHomeScreenController *)self _setWidgetEditingDisplayLayoutElementActive:1];
}

- (void)iconManagerDidDismissWidgetEditing:(id)a3
{
  [(SBFloatingDockBehaviorAssertion *)self->_addWidgetSheetFloatingDockBehaviorAssertion invalidate];
  addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
  self->_addWidgetSheetFloatingDockBehaviorAssertion = 0;

  [(SBHomeScreenController *)self _setWidgetEditingDisplayLayoutElementActive:0];
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
  id v4 = [(SBHomeScreenController *)self _iconController];
  char v3 = [v4 powerLogAggregator];
  [v3 emitEventOfType:0];
}

- (BOOL)iconManager:(id)a3 canAddIconToIgnoredList:(id)a4
{
  return objc_msgSend(a4, "isApplicationIcon", a3);
}

- (BOOL)iconManager:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4
{
  id v4 = [(SBHomeScreenController *)self _iconController];
  char v5 = [v4 shouldAddNewIconsToRootFolder] ^ 1;

  return v5;
}

- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 containerBundleIdentifier];
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] checking widget = %@", (uint8_t *)&v12, 0xCu);
  }
  id v8 = [(SBHomeScreenController *)self _iconController];
  id v9 = [v5 containerBundleIdentifier];
  char v10 = [v8 _isWidgetWithContainerBundleIdentifierValid:v9];

  return v10;
}

- (BOOL)iconManager:(id)a3 isCustomElementValid:(id)a4
{
  id v5 = objc_msgSend(a4, "containerBundleIdentifier", a3);
  if (v5)
  {
    id v6 = [(SBHomeScreenController *)self _iconController];
    char v7 = [v6 _isWidgetWithContainerBundleIdentifierValid:v5];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
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
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  return [(SBHomeScreenController *)self canAppPredictionsWidgetAlignWithGrid];
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
    char v7 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    id v8 = [[SBBarSwipeAffordanceViewController alloc] initWithZStackParticipantIdentifier:6 windowScene:v7];
    id v9 = self->_widgetAddSheetAffordanceViewController;
    self->_widgetAddSheetAffordanceViewController = v8;
    char v10 = v8;

    id v11 = [(SBBarSwipeAffordanceViewController *)v10 view];

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
  id v6 = [a3 featureIntroductionManager];
  [v6 addFeatureIntroductionItem:v9 atLocations:4];
  char v7 = [(SBHomeScreenController *)self lockScreenManager];
  char v8 = [v7 isUILocked];

  if ((v8 & 1) == 0) {
    [(SBHomeScreenController *)self displayFeatureIntroductionItem:v9 atLocation:4];
  }
}

- (id)iconManager:(id)a3 floatingDockViewControllerForView:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  id v5 = [v4 floatingDockController];
  id v6 = [v5 floatingDockViewController];

  return v6;
}

- (id)iconManager:(id)a3 floatingDockViewControllerForViewController:(id)a4
{
  id v4 = objc_msgSend(a4, "_sbWindowScene", a3);
  id v5 = [v4 floatingDockController];
  id v6 = [v5 floatingDockViewController];

  return v6;
}

- (BOOL)iconManager:(id)a3 isEditingAllowedForIconView:(id)a4
{
  id v5 = a4;
  if (-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self))
  {
    char v6 = 0;
  }
  else
  {
    char v7 = [v5 _sbWindowScene];
    if ([v7 isContinuityDisplayWindowScene]) {
      char v6 = 1;
    }
    else {
      char v6 = [v7 isMainDisplayWindowScene];
    }
  }
  return v6;
}

- (id)iconManager:(id)a3 widgetDataSourceForReplacingIconWithWidget:(id)a4 proposedWidgetDataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = v9;
  if (!v9)
  {
    if ([v8 isApplicationIcon])
    {
      id v11 = [v8 applicationBundleID];
      if ([v11 isEqualToString:@"com.apple.MobileAddressBook"])
      {
        id v12 = [v7 widgetExtensionProvider];
        id v13 = objc_msgSend(v12, "sbh_defaultDescriptorForContainerBundleIdentifier:", @"com.apple.PeopleViewService");

        char v10 = objc_msgSend(v13, "sbh_iconDataSource");
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
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
      char v10 = [v7 activeWidget];
      id v11 = [v10 containerBundleIdentifier];
      id v12 = [v10 extensionBundleIdentifier];
      id v13 = [v10 kind];
      if ([v11 isEqualToString:@"com.apple.PeopleViewService"]
        && [v12 isEqualToString:@"com.apple.PeopleViewService.PeopleWidget-iOS"]
        && [v13 isEqualToString:@"SingleContactWidget_iOS"])
      {
        uint64_t v14 = [(SBHomeScreenController *)self model];
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
  id v5 = [v4 extensionIdentity];
  char v6 = [v5 containerBundleIdentifier];

  id v7 = [v4 extensionIdentity];

  id v8 = [v7 extensionBundleIdentifier];

  if ([(__CFString *)v6 isEqualToString:@"com.apple.Health.Sleep"]
    && [v8 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"])
  {

    char v6 = @"com.apple.Health";
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
    id v7 = [(SBHomeScreenController *)self _rootFolderController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)libraryViewControllerRequestsDismissal:(id)a3
{
  id v6 = a3;
  if ([(SBHomeScreenController *)self isModalAppLibrarySupported])
  {
    id v4 = [v6 _sbWindowScene];
    id v5 = [v4 modalLibraryController];

    [v5 dismissLibraryAnimated:1 completion:0];
  }
  else
  {
    [(SBHomeScreenController *)self dismissLibraryAnimated:1 completion:0];
  }
}

- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4
{
  id v4 = [(SBHomeScreenController *)self homeScreenOverlayController];
  [v4 addReasonToDisableDismissGestureRecognizer:@"kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"];
}

- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4
{
  id v4 = [(SBHomeScreenController *)self homeScreenOverlayController];
  [v4 removeReasonToDisableDismissGestureRecognizer:@"kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"];
}

- (void)libraryViewControllerWillPresent:(id)a3
{
  id v3 = [(SBHomeScreenController *)self _rootFolderController];
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
    char v10 = self->_libraryViewControllersActivatingSpotlightAppService;
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
  id v7 = [(SBHomeScreenController *)self rootFolderSettings];

  if (v7 == v9)
  {
    if ([v6 isEqualToString:@"showsSpotlightOnEveryPage"])
    {
      id v8 = [(SBHomeScreenController *)self iconManager];
      [v8 tearDownAndResetRootIconLists];
    }
  }
  else if (self->_iconEditingSettings == v9)
  {
    [(SBHomeScreenController *)self _configureEditingGestureRecognizers];
  }
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
      [(SBHomeScreenController *)self addIconOcclusionReason:2 updateVisibleIcons:1];
    }
    if (v6 == 2 && v9 != 2)
    {
      uint64_t v10 = 8;
      goto LABEL_13;
    }
  }
  else
  {
    [(SBHomeScreenController *)self addIconOcclusionReason:8 updateVisibleIcons:1];
  }
  if (v6 == 3 && v9 != 3)
  {
    uint64_t v10 = 2;
LABEL_13:
    [(SBHomeScreenController *)self removeIconOcclusionReason:v10 updateVisibleIcons:1];
  }
  uint64_t v11 = [(SBHomeScreenController *)self todayViewController];
  id v12 = [(SBHomeScreenController *)self homeScreenOverlayController];
  id v13 = [(SBHomeScreenController *)self keepTodayViewIconImagesStaticAssertion];
  uint64_t v14 = v13;
  if (v9 == 1 || v13)
  {
    if (v9 == 1 && v13)
    {
      [v13 invalidate];
      [(SBHomeScreenController *)self setKeepTodayViewIconImagesStaticAssertion:0];
    }
  }
  else if ([v12 isPresented])
  {
    id v15 = [v12 activeSidebarViewController];

    if (v15 == v11)
    {
      uint64_t v16 = SBStringForUnlockedEnvironmentMode(v9);
      id v17 = [@"Layout State: " stringByAppendingString:v16];

      id v18 = [v11 keepIconImageViewControllersStaticForReason:v17];
      [(SBHomeScreenController *)self setKeepTodayViewIconImagesStaticAssertion:v18];
    }
  }
}

- (void)folderIconStateDidDirty:(id)a3
{
}

- (void)searchBarDidFocus
{
  id v2 = [(SBHomeScreenController *)self _rootFolderController];
  if (([v2 isTransitioningPageState] & 1) == 0 && (SBSpotlightIsVisible() & 1) == 0) {
    [v2 presentSpotlightAnimated:1 completionHandler:0];
  }
}

- (BOOL)appPredictionViewController:(id)a3 launchAppFromIcon:(id)a4
{
  return 0;
}

- (id)appPredictionViewController:(id)a3 badgeValueForApplicationWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHomeScreenController *)self _iconController];
  id v7 = [v6 displayIDsWithBadgingEnabled];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    unint64_t v9 = [(SBHomeScreenController *)self applicationController];
    uint64_t v10 = [v9 applicationWithBundleIdentifier:v5];
    uint64_t v11 = [v10 badgeValue];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)appPredictionViewController:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4
{
  return [(SBHomeScreenController *)self _allowsBadgingForApplicationBundleIdentifier:a4];
}

- (id)appPredictionViewController:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHomeScreenController *)self model];
  id v7 = [v6 applicationIconForBundleIdentifier:v5];

  return v7;
}

- (id)additionalIconListLayoutObserversForAppPredictionViewController:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHomeScreenController *)self iconManager];
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
  v7[2] = __73__SBHomeScreenController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v5;
  unint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __73__SBHomeScreenController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  [*(id *)(a1 + 40) _updateFocusModeManagerWithDoNotDisturbState:v2];
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
  block[2] = __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 528) queryCurrentStateWithError:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2;
  v4[3] = &unk_1E6AF5290;
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFocusModeManagerWithDoNotDisturbState:*(void *)(a1 + 40)];
}

- (void)_updateFocusModeManagerWithDoNotDisturbState:(id)a3
{
  id v4 = a3;
  id v9 = [(SBHomeScreenController *)self iconManager];
  id v5 = [v9 focusModeManager];
  id v6 = [(SBHomeScreenController *)self _focusModeFromDoNotDisturbState:v4];

  [v5 setActiveFocusMode:v6];
  if ([v6 customizedHomeScreenPagesEnabled])
  {
    id v7 = [(SBHomeScreenController *)self mainDisplayWindowScene];
    id v8 = [v7 floatingDockController];
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
    id v6 = [v5 mode];
    id v7 = [v6 identifier];
    uint64_t v8 = [v7 UUIDString];

    __int16 v37 = [(SBHomeScreenController *)self rootFolder];
    id v38 = (void *)v8;
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA6268]) initWithIdentifier:v8 folder:v37];
    uint64_t v10 = [v6 name];
    [v9 setName:v10];

    uint64_t v11 = [v6 symbolImageName];
    [v9 setSymbol:v11];

    if ([v6 semanticType] == 1) {
      [v9 setSleepFocus:1];
    }
    uint64_t v35 = [v6 tintColorName];
    SEL v12 = NSSelectorFromString(v35);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [MEMORY[0x1E4F428B8] performSelector:v12];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F5F5F8] defaultTintColorName];
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
    id v19 = [v16 allowedApplicationIdentifiers];
    double v20 = [v19 allKeys];

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
          id v25 = [*(id *)(*((void *)&v45 + 1) + 8 * i) bundleID];
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
    int v27 = [v16 deniedApplicationIdentifiers];
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
          double v32 = [*(id *)(*((void *)&v41 + 1) + 8 * j) bundleID];
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

- (void)setWallpaperAnimationDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBHomeScreenController *)self suspendWallpaperAnimationForOverlayViewAssertion];
  [v7 invalidate];

  if (v4)
  {
    if (self->_invalidated)
    {
      uint64_t v8 = SBLogIconController();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenController iconManager:willOpenFolderController:]();
      }
    }
    else
    {
      id v9 = +[SBWallpaperController sharedInstance];
      uint64_t v10 = [v9 suspendWallpaperAnimationForReason:v6];
      [(SBHomeScreenController *)self setSuspendWallpaperAnimationForOverlayViewAssertion:v10];
    }
  }
}

- (id)testSetupForIconManagerWidgetScrollPerformanceTest:(id)a3
{
  v40[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA6530];
  id v36 = [MEMORY[0x1E4FA6370] todayNewsWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6530]];
  v39[0] = v36;
  uint64_t v4 = *MEMORY[0x1E4FA6560];
  uint64_t v35 = [MEMORY[0x1E4FA6370] overviewStocksWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6560]];
  v39[1] = v35;
  uint64_t v34 = [MEMORY[0x1E4FA6370] calendarWidgetIconDescriptorForSizeClass:v4];
  v39[2] = v34;
  uint64_t v33 = [MEMORY[0x1E4FA6360] health];
  v39[3] = v33;
  double v32 = [MEMORY[0x1E4FA6360] home];
  v39[4] = v32;
  __int16 v31 = [MEMORY[0x1E4FA6360] passbook];
  v39[5] = v31;
  uint64_t v30 = [MEMORY[0x1E4FA6360] preferences];
  v39[6] = v30;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
  v40[0] = v29;
  uint64_t v28 = [MEMORY[0x1E4FA6370] remindersWidgetIconDescriptorForSizeClass:v3];
  v38[0] = v28;
  int v27 = [MEMORY[0x1E4FA6370] tvWidgetIconDescriptorForSizeClass:v3];
  v38[1] = v27;
  id v26 = [MEMORY[0x1E4FA6360] documents];
  v38[2] = v26;
  id v25 = [MEMORY[0x1E4FA6360] findMy];
  v38[3] = v25;
  BOOL v24 = [MEMORY[0x1E4FA6360] shortcuts];
  v38[4] = v24;
  uint64_t v23 = [MEMORY[0x1E4FA6360] iTunesStore];
  v38[5] = v23;
  uint64_t v22 = [MEMORY[0x1E4FA6360] tips];
  v38[6] = v22;
  uint64_t v21 = [MEMORY[0x1E4FA6360] translate];
  v38[7] = v21;
  double v20 = [MEMORY[0x1E4FA6360] contacts];
  v38[8] = v20;
  id v19 = [MEMORY[0x1E4FA6360] watch];
  v38[9] = v19;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:10];
  v40[1] = v18;
  uint64_t v17 = [MEMORY[0x1E4FA6378] defaultStackIconDescriptorForSizeClass:v3];
  v37[0] = v17;
  uint64_t v16 = [MEMORY[0x1E4FA6370] recentsWidgetIconDescriptorForSizeClass:v3];
  v37[1] = v16;
  id v5 = [MEMORY[0x1E4FA6360] documents];
  v37[2] = v5;
  id v6 = [MEMORY[0x1E4FA6360] findMy];
  void v37[3] = v6;
  id v7 = [MEMORY[0x1E4FA6360] shortcuts];
  void v37[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4FA6360] iTunesStore];
  v37[5] = v8;
  id v9 = [MEMORY[0x1E4FA6360] health];
  v37[6] = v9;
  uint64_t v10 = [MEMORY[0x1E4FA6360] home];
  v37[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4FA6360] passbook];
  v37[8] = v11;
  SEL v12 = [MEMORY[0x1E4FA6360] preferences];
  v37[9] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:10];
  v40[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];

  return v14;
}

- (id)testSetupForIconManagerAddWidgetsToEachPage:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA6530];
  uint64_t v4 = [MEMORY[0x1E4FA6370] gasparWatchDogWidgetIconDescriptorForSizeClass:*MEMORY[0x1E4FA6530]];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4FA6370] relivePhotosWidgetIconDescriptorForSizeClass:v3];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4FA6370] mobileNotesWidgetIconDescriptorForSizeClass:v3];
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
  __int16 v37 = (void *)*MEMORY[0x1E4FA6530];
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
        id v38 = v4;
        uint64_t v8 = [MEMORY[0x1E4FA6360] facetime];
        v46[5] = v8;
        long long v42 = [MEMORY[0x1E4FA6360] documents];
        v46[6] = v42;
        id v9 = [MEMORY[0x1E4FA6360] reminders];
        v46[7] = v9;
        uint64_t v10 = [MEMORY[0x1E4FA6360] maps];
        v46[8] = v10;
        uint64_t v34 = [MEMORY[0x1E4FA6360] home];
        v46[9] = v34;
        uint64_t v33 = [MEMORY[0x1E4FA6360] camera];
        v46[10] = v33;
        double v32 = [MEMORY[0x1E4FA6360] appStore];
        v46[11] = v32;
        __int16 v31 = [MEMORY[0x1E4FA6360] books];
        v46[12] = v31;
        uint64_t v11 = [MEMORY[0x1E4FA6360] podcasts];
        v46[13] = v11;
        SEL v12 = [MEMORY[0x1E4FA6360] tv];
        v46[14] = v12;
        uint64_t v13 = [MEMORY[0x1E4FA6360] news];
        v46[15] = v13;
        uint64_t v14 = [MEMORY[0x1E4FA6360] preferences];
        v46[16] = v14;
        SEL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:17];
        [v38 addObjectsFromArray:v15];

        uint64_t v16 = (void *)v8;
        uint64_t v17 = (void *)v7;

        uint64_t v4 = v38;
        id v18 = (void *)v40;
        id v19 = (void *)v36;

        double v20 = (void *)v35;
      }
      else
      {
        id v18 = [MEMORY[0x1E4FA6370] tvWidgetIconDescriptorForSizeClass:v28];
        v45[0] = v18;
        long long v43 = [MEMORY[0x1E4FA6360] findMy];
        v45[1] = v43;
        id v19 = [MEMORY[0x1E4FA6360] shortcuts];
        v45[2] = v19;
        double v20 = [MEMORY[0x1E4FA6360] iTunesStore];
        v45[3] = v20;
        uint64_t v17 = [MEMORY[0x1E4FA6360] health];
        v45[4] = v17;
        uint64_t v16 = [MEMORY[0x1E4FA6360] home];
        v45[5] = v16;
        long long v42 = [MEMORY[0x1E4FA6360] passbook];
        v45[6] = v42;
        id v9 = [MEMORY[0x1E4FA6360] preferences];
        v45[7] = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:8];
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
      id v19 = [MEMORY[0x1E4FA6360] documents];
      v44[0] = v19;
      double v20 = [MEMORY[0x1E4FA6360] findMy];
      v44[1] = v20;
      uint64_t v17 = [MEMORY[0x1E4FA6360] shortcuts];
      v44[2] = v17;
      uint64_t v16 = [MEMORY[0x1E4FA6360] iTunesStore];
      v44[3] = v16;
      long long v42 = [MEMORY[0x1E4FA6360] health];
      v44[4] = v42;
      id v9 = [MEMORY[0x1E4FA6360] home];
      v44[5] = v9;
      uint64_t v10 = [MEMORY[0x1E4FA6360] passbook];
      v44[6] = v10;
      uint64_t v23 = [MEMORY[0x1E4FA6360] preferences];
      v44[7] = v23;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:8];
      v25 = BOOL v24 = v4;
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
  v10[4] = *MEMORY[0x1E4F143B8];
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
  if ([(SBHomeScreenController *)self isAppLibrarySupported])
  {
    id v5 = [(SBHomeScreenController *)self _iconController];
    uint64_t v6 = [v5 libraryCategoryMapProvider];

    id v9 = 0;
    [v6 overrideCategoryMapForTestingAtURL:v4 error:&v9];
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_configureDeweyOneCategoryWithAllApps
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(SBHomeScreenController *)self isAppLibrarySupported])
  {
    uint64_t v3 = self->_iconModel;
    id v4 = [(SBHIconModel *)v3 leafIcons];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v3, "isIconVisible:", v11, (void)v20))
          {
            SEL v12 = [v11 applicationBundleID];
            if (v12)
            {
              uint64_t v13 = [v11 leafIdentifier];
              [v5 setObject:v11 forKey:v13];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4FA62E8]);
    SEL v15 = [MEMORY[0x1E4FA62D8] categoryWithLocalizedDisplayName:@"Reference & Reading" categoryID:0 categoryIndex:0];
    BOOL v24 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v14 setCategoryIdentifiers:v16];

    [v14 setLocalizedCategoryName:@"Reference & Reading" forCategoryIdentifier:v15];
    uint64_t v17 = [v5 allKeys];
    [v14 setSortedApplicationIdentifiers:v17 forCategoryIdentifier:v15];

    id v18 = [(SBHomeScreenController *)self _iconController];
    id v19 = [v18 libraryCategoryMapProvider];

    [v19 overrideCategoryMapForTesting:v14];
  }
}

- (void)_configureDeweyEachAppHasItsOwnCategory:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(SBHomeScreenController *)self isAppLibrarySupported])
  {
    unint64_t v19 = a3;
    id v5 = self->_iconModel;
    id v6 = [(SBHIconModel *)v5 leafIcons];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v8);
          }
          SEL v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v5, "isIconVisible:", v12, v19))
          {
            uint64_t v13 = [v12 applicationBundleID];
            if (v13)
            {
              id v14 = [v12 leafIdentifier];
              [v7 setObject:v12 forKey:v14];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    id v15 = objc_alloc_init(MEMORY[0x1E4FA62E8]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__SBHomeScreenController__configureDeweyEachAppHasItsOwnCategory___block_invoke;
    void v20[3] = &unk_1E6AFBB68;
    long long v22 = v24;
    id v16 = v15;
    id v21 = v16;
    unint64_t v23 = v19;
    [v7 enumerateKeysAndObjectsUsingBlock:v20];
    uint64_t v17 = [(SBHomeScreenController *)self _iconController];
    id v18 = [v17 libraryCategoryMapProvider];

    [v18 overrideCategoryMapForTesting:v16];
    _Block_object_dispose(v24, 8);
  }
}

void __66__SBHomeScreenController__configureDeweyEachAppHasItsOwnCategory___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4FA62D8];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = [v7 categoryWithLocalizedDisplayName:v10 categoryID:v8 categoryIndex:v8];
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
  if ([(SBHomeScreenController *)self isAppLibrarySupported])
  {
    id v5 = [(SBHomeScreenController *)self _libraryViewControllers];
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
          uint64_t v11 = [v10 dataSource];
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
  uint64_t v3 = [(SBHomeScreenController *)self _iconController];
  id v5 = [v3 libraryCategoryMapProvider];

  [v5 overrideCategoryMapForTesting:0];
  id v4 = (id)[v5 requestLibraryCategoryMapRefreshWithOptions:15 reason:@"Tearing down test config"];
  [(SBHomeScreenController *)self _configureLibraryWithCategoryLimit:-1];
}

- (void)_presentPageManagement:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self _rootFolderController];
  [v5 _presentPageManagement:v4];
}

- (void)_dismissPageManagementIfPresented:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeScreenController *)self _rootFolderController];
  [v5 _dismissPageManagementIfPresented:v4];
}

- (void)iconManager:(id)a3 setTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
}

- (void)iconStyleCoordinatorDidUpdate:(id)a3
{
  id v5 = [(SBHomeScreenController *)self iconManager];
  objc_msgSend(v5, "setListLayoutProviderLayoutOptions:animated:", -[SBHomeScreenController bestListLayoutProviderLayoutOptions](self, "bestListLayoutProviderLayoutOptions"), 1);
  id v4 = [(SBHomeScreenController *)self mainDisplayWindowScene];
  [(SBHomeScreenController *)self updateHomeScreenTraitOverridesForWindowScene:v4];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHomeScreenController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(SBHomeScreenController *)self homeScreenViewController];
  if ([v5 orientation] == 1)
  {
    uint64_t v6 = @"UIInterfaceOrientationPortrait";
  }
  else if ([v5 orientation] == 4)
  {
    uint64_t v6 = @"UIInterfaceOrientationLandscapeLeft";
  }
  else if ([v5 orientation] == 3)
  {
    uint64_t v6 = @"UIInterfaceOrientationLandscapeRight";
  }
  else if ([v5 orientation] == 2)
  {
    uint64_t v6 = @"UIInterfaceOrientationPortraitUpsideDown";
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)[v4 appendObject:v6 withName:@"orientation"];
  uint64_t v8 = [(SBHomeScreenController *)self model];
  id v9 = (id)[v4 appendObject:v8 withName:@"model"];

  id v10 = [(SBHomeScreenController *)self _rootFolderController];
  id v11 = (id)[v4 appendObject:v10 withName:@"rootFolderController"];

  return v4;
}

- (id)succinctDescription
{
  id v2 = [(SBHomeScreenController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
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

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBHomeScreenViewController)homeScreenViewController
{
  return self->_homeScreenViewController;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconRootViewProviding)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (NSTimer)delayedLaunchRequestTimer
{
  return self->_delayedLaunchRequestTimer;
}

- (void)setDelayedLaunchRequestTimer:(id)a3
{
}

- (SBHomeScreenOverlayController)homeScreenOverlayController
{
  return self->_homeScreenOverlayController;
}

- (void)setHomeScreenOverlayController:(id)a3
{
}

- (SBHomeScreenWindow)homeScreenWindow
{
  return self->_homeScreenWindow;
}

- (BSInvalidatable)displayLayoutTransition
{
  return self->_displayLayoutTransition;
}

- (void)setDisplayLayoutTransition:(id)a3
{
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (BSInvalidatable)keepTodayViewIconImagesStaticAssertion
{
  return self->_keepTodayViewIconImagesStaticAssertion;
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

- (BSInvalidatable)suspendWallpaperAnimationForOverlayViewAssertion
{
  return self->_suspendWallpaperAnimationForOverlayViewAssertion;
}

- (void)setSuspendWallpaperAnimationForOverlayViewAssertion:(id)a3
{
}

- (SBProactiveHomeScreenUsageObserver)proactiveUsageObserver
{
  return self->_proactiveUsageObserver;
}

- (void)setProactiveUsageObserver:(id)a3
{
}

- (SBTipsHomeScreenUsageObserver)tipsUsageObserver
{
  return self->_tipsUsageObserver;
}

- (void)setTipsUsageObserver:(id)a3
{
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

- (unint64_t)iconOcclusionReasons
{
  return self->_iconOcclusionReasons;
}

- (void)setIconOcclusionReasons:(unint64_t)a3
{
  self->_iconOcclusionReasons = a3;
}

- (SBLeftOfHomeAppViewController)leftOfHomeAppViewController
{
  return self->_leftOfHomeAppViewController;
}

- (void)setLeftOfHomeAppViewController:(id)a3
{
}

- (SBTodayViewController)todayViewController
{
  return self->_todayViewController;
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

- (SBLibraryViewController)overlayLibraryViewController
{
  return self->_overlayLibraryViewController;
}

- (void)setOverlayLibraryViewController:(id)a3
{
}

- (SBRootFolderPageTransition)interactivePullToTodaySearchTransition
{
  return self->_interactivePullToTodaySearchTransition;
}

- (void)setInteractivePullToTodaySearchTransition:(id)a3
{
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

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
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

- (BSInvalidatable)todayViewDisplayLayoutAssertion
{
  return self->_todayViewDisplayLayoutAssertion;
}

- (void)setTodayViewDisplayLayoutAssertion:(id)a3
{
}

- (NSSet)appIconForceTouchWindows
{
  return self->_appIconForceTouchWindows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconForceTouchWindows, 0);
  objc_storeStrong((id *)&self->_todayViewDisplayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedForSearchPresentationAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_searchPresenterPageStateTransition, 0);
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertions, 0);
  objc_storeStrong((id *)&self->_floatingDockControllerObservers, 0);
  objc_storeStrong((id *)&self->_interactivePullToTodaySearchTransition, 0);
  objc_storeStrong((id *)&self->_overlayLibraryViewController, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetTodayViewController, 0);
  objc_storeStrong((id *)&self->_todayViewController, 0);
  objc_storeStrong((id *)&self->_leftOfHomeAppViewController, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_tipsUsageObserver, 0);
  objc_storeStrong((id *)&self->_proactiveUsageObserver, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForOverlayViewAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForSpotlightAssertion, 0);
  objc_storeStrong((id *)&self->_keepTodayViewIconImagesStaticAssertion, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransition, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayController, 0);
  objc_storeStrong((id *)&self->_delayedLaunchRequestTimer, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_homeScreenViewController, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_iconStyleCoordinator, 0);
  objc_storeStrong((id *)&self->_windowSceneToMedusaDragWindowContext, 0);
  objc_storeStrong((id *)&self->_iconsOccludedAssertions, 0);
  objc_storeStrong((id *)&self->_iconDragSessionBeginDate, 0);
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
  objc_storeStrong((id *)&self->_temporaryWidgetIntents, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForFolderAssertions, 0);
  objc_storeStrong((id *)&self->_delayedStyleWallpaperEffectViews, 0);
  objc_storeStrong((id *)&self->_duckWallpaperDimmingAssertion, 0);
  objc_storeStrong((id *)&self->_colorPickerInterfactionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_modalInteractionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_deviceOrientationUpdateDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_override_userInterfaceController, 0);
  objc_storeStrong((id *)&self->_override_policyAggregator, 0);
  objc_storeStrong((id *)&self->_override_mainDisplaySceneManager, 0);
  objc_storeStrong((id *)&self->_override_assistantController, 0);
  objc_storeStrong((id *)&self->_override_applicationPlaceholderController, 0);
  objc_storeStrong((id *)&self->_override_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_applicationController, 0);
  objc_storeStrong((id *)&self->_override_alertItemsController, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_reachabilityWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperRasterizationAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenScalingView, 0);
  objc_storeStrong((id *)&self->_homeScreenContentView, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
  objc_storeStrong((id *)&self->_contentRequiringReasons, 0);
  objc_storeStrong((id *)&self->_homeScreenDimmingWindow, 0);
  objc_storeStrong((id *)&self->_homeScreenWindow, 0);
  objc_storeStrong((id *)&self->_homeScreenBackdropView, 0);
}

- (void)setModel:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _sceneIdentifier];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Home Screen is updating icon model for %@", v4, 0xCu);
}

- (void)_appLibraryListLayoutProviderForWindowScene:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "attempting to construct a list layout provider with a nil windowScene!", v1, 2u);
}

- (void)iconManager:willOpenFolderController:.cold.1()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "%@ attempting to suspend wallpaper animation after invalidation!", v3, v4, v5, v6, v7);
}

void __88__SBHomeScreenController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
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

@end