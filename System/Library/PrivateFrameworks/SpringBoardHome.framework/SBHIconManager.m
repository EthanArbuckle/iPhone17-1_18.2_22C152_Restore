@interface SBHIconManager
+ (double)defaultIconLayoutAnimationDuration;
+ (id)defaultIconLocationForListsWithNonDefaultSizedIcons;
+ (id)undoActionNameForDraggedIcons:(id)a3;
- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription;
- (ATXDefaultWidgetSuggesterClient)proactiveWidgetSuggesterClient;
- (ATXHomeScreenPageIconRanker)atxIconRanker;
- (BOOL)_alwaysPresentStackConfigurationSheet;
- (BOOL)_determineIfAvocadoHostViewControllerIsVisible:(id)a3;
- (BOOL)_determineIfAvocadoHostViewControllerIsVisible:(id)a3 withinStackViewController:(id)a4;
- (BOOL)_isShowingLeadingCustomViewSearch;
- (BOOL)_isShowingLeadingCustomViewSearchOrTransitioning;
- (BOOL)_isShowingOrTransitioningToSearchableLeadingCustomView;
- (BOOL)_isShowingPullDownSearchOrTransitioning;
- (BOOL)_isShowingSearchableLeadingCustomView;
- (BOOL)_shouldLibraryOverlayAllowSwipeToDismissGesture:(id)a3;
- (BOOL)_shouldParallaxInIconLocation:(id)a3;
- (BOOL)_shouldRespondToIconCloseBoxes;
- (BOOL)_shouldUseHomeScreenLargeIconSize;
- (BOOL)addDefaultFirstPageWidgetsToHomeScreen:(BOOL)a3;
- (BOOL)addDefaultSecondPageWidgetsToHomeScreen:(BOOL)a3;
- (BOOL)addDefaultWidgetsToHomeScreen;
- (BOOL)allowsBadgingForIcon:(id)a3;
- (BOOL)allowsBadgingForIconLocation:(id)a3;
- (BOOL)allowsNestedFolders;
- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3;
- (BOOL)animator:(id)a3 canAlterViewHierarchyDuringCleanupUsingBlock:(id)a4;
- (BOOL)applyOriginaliconStateForWidgetDiscoverability;
- (BOOL)areAnyIconShareSheetsShowing;
- (BOOL)canAddIconToIgnoredList:(id)a3;
- (BOOL)canCloseFolders;
- (BOOL)canDismissOverscrollLibraryForPageTransition;
- (BOOL)canOpenFolderForIcon:(id)a3;
- (BOOL)canPresentOverscrollLibraryForPageTransition;
- (BOOL)canSaveIconState:(id)a3;
- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4;
- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4 focusModeIdentifier:(id)a5;
- (BOOL)clearTodayLayout;
- (BOOL)currentHomeScreenWallpaperDimState;
- (BOOL)deviceTypeSupportModalWidgetIntroduction;
- (BOOL)didChangeIconStyleWithColorPicker;
- (BOOL)disablesScrollingToLastIconPageForLibraryDismissal;
- (BOOL)dismissSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4;
- (BOOL)dismissSpotlightOrTodayViewAnimated:(BOOL)a3;
- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4;
- (BOOL)hasAnimatingFolder;
- (BOOL)hasBackgroundBlur;
- (BOOL)hasOpenFolder;
- (BOOL)hasOpenFolderInLocation:(id)a3;
- (BOOL)hasRootFolderController;
- (BOOL)hasRootViewController;
- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4;
- (BOOL)iconDragManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5;
- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5;
- (BOOL)iconDragManager:(id)a3 canBeginDragForIconView:(id)a4;
- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4;
- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4;
- (BOOL)iconDragManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4;
- (BOOL)iconDragManager:(id)a3 shouldDuplicateIconsInDragSession:(id)a4;
- (BOOL)iconModel:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4;
- (BOOL)iconModel:(id)a3 shouldAvoidPlacingIconOnFirstPage:(id)a4;
- (BOOL)iconModel:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4;
- (BOOL)iconShouldAllowTap:(id)a3;
- (BOOL)iconView:(id)a3 editingModeGestureRecognizerDidFire:(id)a4;
- (BOOL)iconView:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)iconView:(id)a3 shouldContinueToUseBackgroundViewForComponents:(id)a4;
- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4;
- (BOOL)iconViewCanBecomeFocused:(id)a3;
- (BOOL)iconViewDisplaysAccessories:(id)a3;
- (BOOL)iconViewDisplaysCloseBox:(id)a3;
- (BOOL)iconViewDisplaysLabel:(id)a3;
- (BOOL)iconViewDisplaysResizeHandle:(id)a3;
- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3;
- (BOOL)iconsShouldAllowCloseBoxes;
- (BOOL)internalForceShowWidgetDiscoverability;
- (BOOL)isAnimatingFolderCreation;
- (BOOL)isAnimatingFolderIconTransitionForIconDragManager:(id)a3;
- (BOOL)isAnimatingFolderOpeningOrClosing;
- (BOOL)isAnimatingForUnscatter;
- (BOOL)isCustomIconElementValid:(id)a3;
- (BOOL)isCustomLeadingViewTodayView;
- (BOOL)isDismissingMenuForFolderPresentation;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4;
- (BOOL)isDisplayingIcon:(id)a3 queryOptions:(unint64_t)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4;
- (BOOL)isDockPinnedForRotation;
- (BOOL)isEditing;
- (BOOL)isEditingAllowed;
- (BOOL)isEditingAllowedForIconListView:(id)a3;
- (BOOL)isEditingAllowedForIconLocation:(id)a3;
- (BOOL)isEditingAllowedForIconView:(id)a3;
- (BOOL)isEditingForIconListView:(id)a3;
- (BOOL)isEditingForIconLocation:(id)a3;
- (BOOL)isFloatingDockSupported;
- (BOOL)isFloatingDockVisible;
- (BOOL)isFolderOpenForIconDragManager:(id)a3;
- (BOOL)isFolderPageManagementUIVisible;
- (BOOL)isFolderScrolling;
- (BOOL)isIconContentPossiblyVisibleOverApplication;
- (BOOL)isIconCurrentlyOnscreen:(id)a3;
- (BOOL)isIconDragging;
- (BOOL)isIconIgnored:(id)a3;
- (BOOL)isIconStylePickerVisible;
- (BOOL)isIconTouched;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isIconVisiblyRepresented:(id)a3;
- (BOOL)isLibraryPresentationModal;
- (BOOL)isMainDisplayLibraryViewVisibilityTransitioning;
- (BOOL)isMainDisplayLibraryViewVisible;
- (BOOL)isOverlayCoverSheetTodayViewVisible;
- (BOOL)isOverlayTodayOrLibraryViewVisible;
- (BOOL)isOverlayTodayViewVisibilityTransitioning;
- (BOOL)isOverlayTodayViewVisible;
- (BOOL)isPerformingCancelledCollapseTransition;
- (BOOL)isPerformingCancelledExpandTransition;
- (BOOL)isPerformingExpandTransition;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3;
- (BOOL)isResettingRootIconLists;
- (BOOL)isRootFolderContentVisible;
- (BOOL)isRootFolderScrolling;
- (BOOL)isScrolling;
- (BOOL)isShowingIconContextMenu;
- (BOOL)isShowingModalInteraction;
- (BOOL)isShowingOrTransitioningToTrailingCustomView;
- (BOOL)isShowingPullDownOrLeadingCustomViewSearch;
- (BOOL)isShowingPullDownSearch;
- (BOOL)isShowingPullDownSearchOrTransitioningToVisible;
- (BOOL)isShowingSpotlightOrLeadingCustomView;
- (BOOL)isSidebarEffectivelyVisible;
- (BOOL)isSidebarVisibilityGestureActive;
- (BOOL)isSidebarVisible;
- (BOOL)isTodayViewEffectivelyVisible;
- (BOOL)isTrackingScroll;
- (BOOL)isTransitioning;
- (BOOL)isTransitioningHomeScreenState;
- (BOOL)isUsageMonitoringEnabled;
- (BOOL)isWidgetValid:(id)a3 iconSizeClass:(id)a4;
- (BOOL)listsAllowRotatedLayoutForFolderClass:(Class)a3;
- (BOOL)multiplexingManager:(id)a3 shouldCacheRecentViewController:(id)a4 forIdentifier:(id)a5;
- (BOOL)needsRelayout;
- (BOOL)ownsIconModel;
- (BOOL)presentHomeScreenIconsAnimated:(BOOL)a3;
- (BOOL)presentSpotlightFromSource:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)prototypeSettingBumpLeastUsedApps;
- (BOOL)prototypeSettingEditButtonAsUndo;
- (BOOL)prototypeSettingShowExtraLargeTVWidget;
- (BOOL)prototypeSettingShowWidgetIntroduction;
- (BOOL)prototypeSettingSimpleBottomSnaking;
- (BOOL)recyclesIconViews;
- (BOOL)relayout;
- (BOOL)resetIconLayoutWithOptions:(unint64_t)a3;
- (BOOL)resetTodayLayout;
- (BOOL)rootFolder:(id)a3 canAddIcon:(id)a4 toIconList:(id)a5 inFolder:(id)a6;
- (BOOL)rootFolder:(id)a3 canBounceIcon:(id)a4;
- (BOOL)rootFolder:(id)a3 isGridLayoutValid:(id)a4 forIconList:(id)a5 inFolder:(id)a6;
- (BOOL)rootFolderContainsSuggestedWidget;
- (BOOL)rootFolderContainsWidgets;
- (BOOL)rootFolderController:(id)a3 allowsRemovalOfIconDataSourceWithinStack:(id)a4;
- (BOOL)rootFolderControllerCanUseSeparateWindowForRotation:(id)a3;
- (BOOL)rootFolderControllerDidSetPrototypeSettingEditAsUndo:(id)a3;
- (BOOL)shouldClearStylePreviewManagerAfterRootTraitChange;
- (BOOL)shouldDisableUserInteractionForWidgetDiscoverability;
- (BOOL)shouldHighlightTouchedIconView:(id)a3;
- (BOOL)shouldRecycleIconView:(id)a3;
- (BOOL)shouldSkipPrecachingDataAfterReloadIcons;
- (BOOL)showsAddWidgetButtonWhileEditing;
- (BOOL)showsBadgesInAppLibrary;
- (BOOL)showsDoneButtonWhileEditing;
- (BOOL)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4;
- (BOOL)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4 focusModeIdentifier:(id)a5;
- (BOOL)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4 inRootFolder:(id)a5 focusModeIdentifier:(id)a6;
- (BOOL)userHasUsedWidget;
- (BOOL)viewMap:(id)a3 shouldRecycleView:(id)a4;
- (BOOL)widgetIconIsOnboardingWidget:(id)a3;
- (BOOL)widgetStackViewController:(id)a3 isDataSourceBlockedForScreenTimeExpiration:(id)a4;
- (BSEventQueue)transitionEventQueue;
- (BSInvalidatable)editingAutosaveDisableAssertion;
- (BSInvalidatable)todayViewCancelTouchesScrollingAssertion;
- (CGRect)iconView:(id)a3 contentBoundingRectForConfigurationInteraction:(id)a4;
- (CHSWidgetExtensionProvider)widgetExtensionProvider;
- (Class)controllerClassForFolder:(id)a3;
- (Class)controllerClassForFolderClass:(Class)a3;
- (Class)iconModel:(id)a3 iconClassForApplicationWithBundleIdentifier:(id)a4 proposedClass:(Class)a5;
- (Class)iconViewClass;
- (NSArray)defaultFirstPageSuggestedWidgetIcons;
- (NSArray)defaultFirstPageWidgetDescriptors;
- (NSArray)defaultSecondPageSuggestedWidgetIcons;
- (NSArray)defaultSecondPageWidgetDescriptors;
- (NSArray)leadingCustomViewControllers;
- (NSArray)postResetPathIdentifiers;
- (NSArray)trailingCustomViewControllers;
- (NSDictionary)widgetIntents;
- (NSMutableArray)chuisOnboardingWidgetViewControllers;
- (NSSet)presentedIconLocations;
- (NSString)defaultFirstPageWidgetSizeClass;
- (NSString)defaultSecondPageWidgetSizeClass;
- (NSString)description;
- (NSString)precachedContentSizeCategory;
- (NSString)statisticsSummary;
- (NSTimer)editingEndTimer;
- (NSTimer)visibleIconTintLimitedDelayedUpdateTimer;
- (PUIStylePickerViewController)currentStylePickerViewController;
- (SBFParallaxSettings)badgeParallaxSettings;
- (SBFloatingDockViewController)floatingDockViewController;
- (SBFolder)closingFolder;
- (SBFolder)openedFolder;
- (SBFolderController)openedFolderController;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHAddWidgetSheetConfigurationManager)addWidgetSheetConfigurationManager;
- (SBHFeatureIntroductionManager)featureIntroductionManager;
- (SBHFocusModeManager)focusModeManager;
- (SBHHomeScreenSettings)homeScreenSettings;
- (SBHHomeScreenUsageMonitor)usageMonitor;
- (SBHIconGridSize)iconModel:(id)a3 listGridSizeForFolderClass:(Class)a4;
- (SBHIconGridSize)iconModel:(id)a3 listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a4;
- (SBHIconGridSize)listGridSizeForFolderClass:(Class)a3;
- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3;
- (SBHIconImageCache)addWidgetSheetIconImageCache;
- (SBHIconImageCache)iconImageCache;
- (SBHIconImageCacheRequestIdentifying)iconImageRecachingRequestCancellation;
- (SBHIconImageCacheRequestIdentifying)iconPrecachingCancellation;
- (SBHIconImageCacheRequestIdentifying)visibleIconImageRecachingRequestCancellation;
- (SBHIconManager)init;
- (SBHIconManagerDelegate)delegate;
- (SBHIconManagerWidgetMetricsDelegate)widgetMetricsDelegate;
- (SBHIconModel)iconModel;
- (SBHIconRootViewProviding)rootViewController;
- (SBHIconShareSheetManager)iconShareSheetManager;
- (SBHIconStylePreviewManager)stylePreviewManager;
- (SBHLibraryViewController)overlayLibraryViewController;
- (SBHPeopleWidgetPersonDetailInteraction)currentPersonDetailInteraction;
- (SBHProactivePageSuggestionsManager)proactivePageSuggestionsManager;
- (SBHRootFolderSettings)rootFolderSettings;
- (SBHTodayViewControlling)overlayCoverSheetTodayViewController;
- (SBHTodayViewControlling)overlayTodayViewController;
- (SBHWidgetIntroductionFeatureIntroductionItem)widgetIntroductionItem;
- (SBHWidgetIntroductionSettings)widgetIntroductionSettings;
- (SBHWidgetMetricsProvider)widgetMetricsProvider;
- (SBHomeScreenDefaults)homeScreenDefaults;
- (SBHomeScreenIconTransitionAnimator)currentTransitionAnimator;
- (SBIcon)iconToReveal;
- (SBIconDragManager)iconDragManager;
- (SBIconLabelImageCache)iconLabelImageCache;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListView)currentRootIconList;
- (SBIconListView)dockListView;
- (SBIconListView)effectiveDockListView;
- (SBIconListView)floatingDockListView;
- (SBIconListView)floatingDockSuggestionsListView;
- (SBIconView)currentConfiguringIconView;
- (SBIconView)highlightedIconView;
- (SBIconView)previewInteractingIconView;
- (SBRootFolder)rootFolder;
- (SBRootFolderController)rootFolderController;
- (SBSearchGesture)searchGesture;
- (SBWorkspaceInteractionContext)currentInteractionContext;
- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3;
- (UIEdgeInsets)statusBarEdgeInsetsForFolderController:(id)a3;
- (UIImpactFeedbackGenerator)iconEditingFeedbackBehavior;
- (UITraitChangeRegistration)rootViewControllerUserInterfaceStyleObservation;
- (_UILegibilitySettings)legibilitySettings;
- (double)defaultIconLayoutAnimationDurationForIconDragManager:(id)a3;
- (double)distanceToTopOfSpotlightIconsForRootFolderController:(id)a3;
- (double)externalDockHeightForRootFolderController:(id)a3;
- (double)iconDragManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4;
- (double)maxExternalDockHeightForRootFolderController:(id)a3;
- (double)minimumHomeScreenScaleForFolderController:(id)a3;
- (double)preferredExternalDockVerticalMarginForRootFolderController:(id)a3;
- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3;
- (id)_archivedIntentForDataSource:(id)a3 inIcon:(id)a4 loadingIfNecessary:(BOOL)a5;
- (id)_containerViewControllerForPersonDetailInteractionTargetingIconView:(id)a3;
- (id)_containerViewForPersonDetailInteractionTargetingIconView:(id)a3;
- (id)_createAppropriateRootViewControllerForRootFolder:(id)a3;
- (id)_createRootFolderControllerForRootFolder:(id)a3;
- (id)_createRootTableControllerForRootFolder:(id)a3;
- (id)_currentFolderController;
- (id)_customViewControllerForResizingIcon:(id)a3 gridSizeClass:(id)a4 dataSource:(id)a5 location:(id)a6;
- (id)_dumpRootFolderForStateCapture:(id)a3;
- (id)_effectiveAppPredictionViewControllersForUniqueIdentifier;
- (id)_effectiveTodayViewController;
- (id)_effectiveWidgetMultiplexingManager;
- (id)_fetchCurrentStyleConfiguration;
- (id)_folderControllerForIcon:(id)a3 inLocation:(id)a4;
- (id)_homeScreenContentViewForPersonDetailInteractionTargetingIconView:(id)a3;
- (id)_iconForDescriptor:(id)a3;
- (id)_intentForDataSource:(id)a3 inIcon:(id)a4 creatingIfNecessary:(BOOL)a5;
- (id)_intentForWidget:(id)a3 ofIcon:(id)a4 creatingIfNecessary:(BOOL)a5;
- (id)_libraryViewControllers;
- (id)_makeCustomViewControllerForWidgetIcon:(id)a3 dataSource:(id)a4 location:(id)a5;
- (id)_makeCustomViewControllerForWidgetIcon:(id)a3 dataSource:(id)a4 location:(id)a5 gridSizeClass:(id)a6;
- (id)_multiplexingViewControllerForIcon:(id)a3 dataSource:(id)a4 location:(id)a5 withPriority:(unint64_t)a6;
- (id)_newIntentForDataSource:(id)a3 inIcon:(id)a4;
- (id)_personDetailInteractionContextForPersonURL:(id)a3 iconView:(id)a4;
- (id)_proposedFolderNameForGrabbedIcon:(id)a3 recipientIcon:(id)a4;
- (id)_rootFolderForRootViewControllerForRootFolder:(id)a3;
- (id)_stackConfigurationForStackIcon:(id)a3;
- (id)_stashedIconsWithRemovableDataSourcesForStashedIcons:(id)a3 newIcons:(id)a4;
- (id)_stateCaptureString;
- (id)_widgetIntroductionHomeScreenPreviewView;
- (id)accessibilityTintColorForIconView:(id)a3;
- (id)accessibilityTintColorForScreenRect:(CGRect)a3;
- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3;
- (id)addAllIconsToCacheRequestBuilder:(id)a3 iconImageStyleConfiguration:(id)a4 highestPriority:(int64_t)a5 lowerPriority:(int64_t)a6 cacheOptions:(unint64_t)a7;
- (id)addApplicationPlaceholders:(id)a3;
- (id)addWidgetSheetConfigurationManager:(id)a3 containerBundleIdentiferForDescriptor:(id)a4;
- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4;
- (id)addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:(id)a3;
- (id)addWidgetsToEachPage;
- (id)additionalIconViewsToUpdateDuringColorPicking;
- (id)allowedGridSizeClassesForDock;
- (id)allowedGridSizeClassesForTodayList;
- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5;
- (id)appPredictionViewControllerForIconView:(id)a3;
- (id)appPredictionsIconViewDisplayingIconView:(id)a3 options:(unint64_t)a4;
- (id)applicationWithBundleIdentifier:(id)a3;
- (id)backgroundViewForDockForRootFolderController:(id)a3;
- (id)backgroundViewForEditingDoneButtonForRootFolderController:(id)a3;
- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (id)bestHomeScreenLocationForIcon:(id)a3;
- (id)bestLocationForIcon:(id)a3;
- (id)cachingImageAppearances;
- (id)cachingImageStyleConfiguration;
- (id)captureHomeScreenOnboardingSnapshot;
- (id)containerBundleIdentifierForDataSource:(id)a3;
- (id)containerViewForPresentingContextMenuForIconView:(id)a3;
- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)debuggingActiveWidgetInfo;
- (id)defaultIconStateForIconModel:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)fakeStatusBarForFolderController:(id)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4;
- (id)firstIconViewWithOptions:(unint64_t)a3 iconPassingTest:(id)a4;
- (id)floatingDockViewControllerForView:(id)a3;
- (id)folderControllerForFolder:(id)a3;
- (id)folderControllerWantsToHideStatusBar:(id)a3 animated:(BOOL)a4;
- (id)gridPathForIcon:(id)a3;
- (id)gridSizeClassDomain;
- (id)gridSizeClassSizesForIconModel:(id)a3;
- (id)homeScreenDefaultsForAddWidgetSheetConfigurationManager:(id)a3;
- (id)homescreenIconAccessoryViewMap;
- (id)homescreenIconImageViewMap;
- (id)homescreenIconLabelAccessoryViewMap;
- (id)iconDataSourceForReplacingAppIconWithWidgetIcon:(id)a3;
- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4;
- (id)iconDragManager:(id)a3 launchActionsForIconView:(id)a4;
- (id)iconDragManager:(id)a3 launchURLForIconView:(id)a4;
- (id)iconDragManager:(id)a3 localizedFolderNameForCombiningIcon:(id)a4 withIcon:(id)a5;
- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7;
- (id)iconForReplacingWidgetIconWithAppIcon:(id)a3;
- (id)iconGridSizeClassSizes;
- (id)iconListViewForIndexPath:(id)a3;
- (id)iconLocationForList:(id)a3 inFolder:(id)a4 ofRootFolder:(id)a5;
- (id)iconLocationForListsWithNonDefaultSizedIcons;
- (id)iconLocationForPrecachingImages;
- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4;
- (id)iconModel:(id)a3 customInsertionIndexPathForIcon:(id)a4 inRootFolder:(id)a5;
- (id)iconModel:(id)a3 customInsertionRelativePathForIcon:(id)a4 inRootFolder:(id)a5;
- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4;
- (id)iconModel:(id)a3 supportedGridSizeClassesForWidgetWithKind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6;
- (id)iconModel:(id)a3 validatedWidgetIconForWidgetIcon:(id)a4;
- (id)iconSizeChangeAnimator:(id)a3 intentForWidget:(id)a4;
- (id)iconSizeChangeAnimator:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6;
- (id)iconView:(id)a3 applicationShortcutItemsWithProposedItems:(id)a4;
- (id)iconView:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4;
- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4;
- (id)iconView:(id)a3 containerViewControllerForConfigurationInteraction:(id)a4;
- (id)iconView:(id)a3 containerViewForConfigurationInteraction:(id)a4;
- (id)iconView:(id)a3 homeScreenContentViewForConfigurationInteraction:(id)a4;
- (id)iconView:(id)a3 iconAccessoryViewOfClass:(Class)a4;
- (id)iconView:(id)a3 iconLabelAccessoryViewOfType:(int64_t)a4;
- (id)iconView:(id)a3 labelImageWithParameters:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5;
- (id)iconViewMap;
- (id)iconViewShowingContextMenu;
- (id)iconViewsToPreviewForIconStylePicker;
- (id)iconsToRecacheForIconStylePickerPreview;
- (id)iconsToRecacheForImageAppearanceChange;
- (id)imageViewForIconView:(id)a3;
- (id)intentForDataSource:(id)a3 ofIcon:(id)a4;
- (id)intentForWidget:(id)a3 ofIcon:(id)a4;
- (id)launchActionsForIconView:(id)a3;
- (id)launchURLForIconView:(id)a3;
- (id)leadingTodayViewController;
- (id)listRotatedLayoutClusterGridSizeClassForIconModel:(id)a3;
- (id)listViewsToUpdateDuringColorPicking;
- (id)localizedDefaultFolderName;
- (id)localizedFolderNameForDefaultDisplayName:(id)a3;
- (id)makeResizedCopyOfWidgetIcon:(id)a3 withGridSizeClass:(id)a4;
- (id)metricsForCHSWidget:(id)a3 inLocation:(id)a4;
- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (id)onboardingWidgetPreviewsForWidgetIcon:(id)a3;
- (id)parallaxSettingsForComponentsOfIconView:(id)a3;
- (id)persistedHomeScreenColorConfiguration;
- (id)preWarmCustomViewControllerForWidgetIcon:(id)a3;
- (id)preWarmCustomViewControllerForWidgetIcon:(id)a3 withGridSizeClass:(id)a4;
- (id)prepareForUndo;
- (id)prioritizedCachingImageAppearances;
- (id)prioritizedCachingImageAppearancesForIconImageStyleConfiguration:(id)a3 priority:(int64_t)a4;
- (id)promoteSuggestedWidget:(id)a3 withinStack:(id)a4;
- (id)reasonToDisallowInteractionOnIconView:(id)a3;
- (id)reasonToDisallowTapOnIconView:(id)a3;
- (id)recycledViewsContainerProviderForViewMap:(id)a3;
- (id)replaceApplicationPlaceholderWithApplication:(id)a3;
- (id)resizeGestureHandler:(id)a3 intentForWidget:(id)a4;
- (id)resizeGestureHandler:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6;
- (id)resizeGestureHandlerForIconView:(id)a3;
- (id)rootFolder:(id)a3 shouldBounceIcon:(id)a4 afterInsertingIcons:(id)a5 forIconList:(id)a6 inFolder:(id)a7;
- (id)rootFolderController:(id)a3 dragPreviewForIconView:(id)a4;
- (id)rootFolderController:(id)a3 draggedIconForStackConfigurationInteractionForIdentifier:(id)a4;
- (id)rootFolderController:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5;
- (id)rootFolderForAddWidgetSheetConfigurationManager:(id)a3;
- (id)rootIconListAtIndex:(int64_t)a3;
- (id)rootViewForIconDragManager:(id)a3;
- (id)screenSnapshotProviderForComponentsOfIconView:(id)a3;
- (id)silhouetteLayoutForPageAtIndex:(unint64_t)a3;
- (id)stackConfigurationInteractionForIconView:(id)a3;
- (id)statusBarStyleRequestForFolderController:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)supportedGridSizeClassesForIconView:(id)a3;
- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5;
- (id)supportedIconGridSizeClassesForResizeOfIconView:(id)a3;
- (id)todayViewControllers;
- (id)trailingLibraryViewController;
- (id)validatedWidgetIconForWidgetIcon:(id)a3;
- (id)viewControllerForPresentingViewControllers;
- (id)viewMap:(id)a3 makeNewViewOfClass:(Class)a4;
- (id)visibleIconsToRecacheForImageAppearanceChange;
- (id)widgetBackgroundViewMap;
- (id)widgetIconWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 sizeClass:(id)a5;
- (id)widgetInsertionRippleIconAnimatorForIcon:(id)a3 iconListView:(id)a4 withReferenceIconView:(id)a5;
- (id)widgetMetricsProvider:(id)a3 listLayoutProviderForScreenType:(unint64_t)a4;
- (id)widgetStackViewController:(id)a3 containerApplicationNameForDataSource:(id)a4;
- (id)widgetStackViewController:(id)a3 containerBundleIdentifierForDataSource:(id)a4;
- (id)widgetStackViewController:(id)a3 viewControllerForDataSource:(id)a4;
- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4;
- (id)windowForStackConfigurationIconDragPreviewsForRootFolderController:(id)a3 forWindowScene:(id)a4;
- (int64_t)closeBoxTypeForIconView:(id)a3;
- (int64_t)currentIconListIndex;
- (int64_t)iconDragManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5;
- (int64_t)iconModel:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4;
- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4;
- (int64_t)interfaceOrientation;
- (int64_t)listsFixedIconLocationBehavior;
- (int64_t)listsFixedIconLocationBehaviorForFolderClass:(Class)a3;
- (unint64_t)addWidgetSheetStyleForRootFolderController:(id)a3;
- (unint64_t)allowedInterfaceOrientations;
- (unint64_t)columnCountForTodayList;
- (unint64_t)contentVisibility;
- (unint64_t)effectiveRootFolderControllerContentVisibility;
- (unint64_t)focusEffectTypeForIconView:(id)a3;
- (unint64_t)gridCellInfoOptions;
- (unint64_t)gridCellInfoOptionsForInsertingDefaultWidgets;
- (unint64_t)gridCellInfoOptionsForOrientation:(int64_t)a3;
- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4;
- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4;
- (unint64_t)listLayoutProviderLayoutOptions;
- (unint64_t)maxIconCountForDock;
- (unint64_t)maxListCountForFolders;
- (unint64_t)maxRowCountForFavoriteTodayListForIconModel:(id)a3;
- (unint64_t)possibleInterfaceOrientations;
- (unint64_t)supportedMultitaskingShortcutActionsForIconView:(id)a3;
- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4;
- (unint64_t)widgetSheetPresenterTypeForRootFolderController:(id)a3;
- (void)_addTouchedIconView:(id)a3;
- (void)_animateFolderIcon:(id)a3 open:(BOOL)a4 location:(id)a5 animated:(BOOL)a6 withCompletion:(id)a7;
- (void)_applyBarButtonItemsToStylePicker:(id)a3 forHomeScreenConfiguration:(id)a4;
- (void)_archiveConfiguration:(id)a3 forDataSource:(id)a4 ofIcon:(id)a5;
- (void)_beginObservingLeafIconsInModel:(id)a3;
- (void)_cleanupForClosingFolderAnimated:(BOOL)a3;
- (void)_clearStashedIconsForRelayout;
- (void)_closeFolderController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)_compactRootListsAfterFolderCloseWithAnimation:(BOOL)a3;
- (void)_configureRootFolderConfiguration:(id)a3;
- (void)_discardEndEditingTimerAndDontResetUntilReasonIsRemoved:(id)a3;
- (void)_dismissStylePickerViewControllerImmediately;
- (void)_endObservingLeafIconsInModel:(id)a3;
- (void)_engageWallpaperTintColorDropper:(id)a3;
- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4;
- (void)_ensureRootFolderController;
- (void)_ensureWidgetIsVisibleForDebuggingWithDescriptor:(id)a3 sizeClass:(int64_t)a4;
- (void)_enumerateEditableViewController:(id)a3 usingBlock:(id)a4;
- (void)_fetchWallpaperProminentColor:(id)a3;
- (void)_finishResetRootIconLists;
- (void)_finishResetRootIconListsReusingPreviousControllers:(BOOL)a3;
- (void)_folderDidFinishOpenClose:(BOOL)a3 animated:(BOOL)a4 success:(BOOL)a5;
- (void)_handleRemovedDataSource:(id)a3 ofIcon:(id)a4;
- (void)_handleUpdatedConfiguration:(id)a3 forDataSource:(id)a4 ofIcon:(id)a5 archiving:(BOOL)a6;
- (void)_iconModelDidLayout:(id)a3;
- (void)_iconModelDidReloadIcons:(id)a3;
- (void)_iconModelWillLayout:(id)a3;
- (void)_iconModelWillReloadIcons:(id)a3;
- (void)_iconVisibilityChanged:(id)a3;
- (void)_invalidateWallpaperTintColorDropper;
- (void)_loadAndSaveDefaultIntentIfNecessaryForWidget:(id)a3 ofIcon:(id)a4 viewController:(id)a5;
- (void)_noteUserIsInteractingWithIcons;
- (void)_precacheDataForRootIcons;
- (void)_precacheImagesForRootIcons;
- (void)_precacheIntentsForRootIcons;
- (void)_precacheLabelsForRootIcons;
- (void)_prepareToResetRootIconLists;
- (void)_presentStylePickerViewController;
- (void)_presentStylePickerViewControllerForStylePickerConfiguration:(id)a3;
- (void)_processPendingDefaultIntents;
- (void)_reduceTransparencyStatusDidChange:(id)a3;
- (void)_removeReasonToNotResetEndEditingTimer:(id)a3;
- (void)_removeTouchedIconView:(id)a3;
- (void)_resetHomescreenIconStateTo:(id)a3;
- (void)_restartEditingEndTimer;
- (void)_scrollToLastIconPageIfNecessaryForLibraryOverlayDismissal:(id)a3;
- (void)_setupApplicationShortcutItemsForPresentation:(id)a3;
- (void)_setupStateCaptureHandleIfNeeded;
- (void)_sizeCategoryDidChange:(id)a3;
- (void)_todayViewControllerSuppressesEditingStateForListViews:(BOOL)a3;
- (void)_tryScrollToIconToRevealAnimated:(BOOL)a3;
- (void)_updateCaptureOnlyBackgroundViewForCustomIconImageViewController:(id)a3;
- (void)_updateIconView:(id)a3 forCustomIconImageViewController:(id)a4;
- (void)_updateMaximumEditingIconSizeForFloatingDockViewController:(id)a3;
- (void)_updateOverlayOcclusionForRootFolderController;
- (void)_updateOverscrollModalLibraryForScrollToPresented:(BOOL)a3;
- (void)_updateShouldUseHomeScreenLargeIconSize:(BOOL)a3;
- (void)_updateStyleConfiguration:(id)a3;
- (void)_updateVisibleIconsViewsForAllowableCloseBoxes;
- (void)_updateWidgetMultiplexingViewController:(id)a3 forIconView:(id)a4;
- (void)_willAnimateWidgetInsertion;
- (void)addAdditionalIconImageCacheForPrecaching:(id)a3;
- (void)addAllEligibleIconsToIgnoredList;
- (void)addDebugIconOfSizeClass:(id)a3 toPage:(unint64_t)a4 coordinate:(SBIconCoordinate)a5;
- (void)addDebugIconOfSizeClass:(id)a3 toPage:(unint64_t)a4 coordinate:(SBIconCoordinate)a5 orientation:(int64_t)a6;
- (void)addDebugIconOfSizeClass:(id)a3 toPage:(unint64_t)a4 iconIndex:(unint64_t)a5;
- (void)addFolderPresentationObserver:(id)a3;
- (void)addIconToIgnoredList:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)addIcons:(id)a3 intoFolderIcon:(id)a4 openFolderOnFinish:(BOOL)a5 completion:(id)a6;
- (void)addNewIconToDesignatedLocation:(id)a3 options:(unint64_t)a4;
- (void)addNewIconsToDesignatedLocations:(id)a3 saveIconState:(BOOL)a4;
- (void)addPageStateObserver:(id)a3;
- (void)addReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:(id)a3;
- (void)addSuggestedActiveWidgetToStack:(id)a3;
- (void)addWidgetStackToCurrentPage;
- (void)addWidgetStackWithIdentifiers:(id)a3 toPage:(int64_t)a4 withSizeClass:(id)a5;
- (void)addWidgetWithIdentifier:(id)a3 toPage:(int64_t)a4 withSizeClass:(id)a5;
- (void)addWidgets:(id)a3 toGridPath:(id)a4 overflowOptions:(unint64_t)a5;
- (void)animateToDefaultStateWithCompletionHandler:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)beginStopUpdatingDefaultWidgetsBumpedIconRecord;
- (void)cancelAllDrags;
- (void)cancelAllFolderScrolling;
- (void)changeSizeOfWidgetIcon:(id)a3 toSizeClass:(id)a4;
- (void)changeSizeOfWidgetIcon:(id)a3 toSizeClass:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)checkForInvalidCustomElements;
- (void)checkForInvalidWidgets;
- (void)clearHighlightedIcon;
- (void)clearHighlightedIcon:(id)a3;
- (void)closeFolderAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)configureFeedbackView:(id)a3;
- (void)configureFloatingDockViewController:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)configureLibraryViewController:(id)a3;
- (void)continueChangingSizeOfWidgetIcon:(id)a3 toSizeClass:(id)a4 newIcon:(id)a5 displayedIconView:(id)a6 listView:(id)a7 resizedViewController:(id)a8 undoPreparation:(id)a9 previousIconGridPath:(id)a10 currentIconGridPath:(id)a11 animated:(BOOL)a12 completionHandler:(id)a13;
- (void)dealloc;
- (void)didDeleteIconState:(id)a3;
- (void)didSaveIconState:(id)a3;
- (void)disableUserInteractionForWidgetDiscoverability;
- (void)dismissFolderPageManagementUI;
- (void)dismissIconContextMenu;
- (void)dismissIconShareSheets;
- (void)dismissLibraryForIconDragManager:(id)a3 windowScene:(id)a4;
- (void)dismissModalInteractions;
- (void)dismissModalInteractionsImmediately;
- (void)dismissTodayOverlayForIconDragManager:(id)a3;
- (void)displayEnterEditingModeFeatureIntroductions;
- (void)displayFeatureIntroductionItemIfUnlocked:(id)a3;
- (void)displayPronouncedContainerViewVisibility:(BOOL)a3 isVertical:(BOOL)a4;
- (void)editingDidChange;
- (void)editingDidChangeWithFeedbackBehavior:(id)a3 location:(CGPoint)a4;
- (void)enableUserInteractionForWidgetDiscoverability;
- (void)endStopUpdatingDefaultWidgetsBumpedIconRecord;
- (void)ensureFixedIconLocationsIfNecessary;
- (void)enumerateAllIconImageCachesUsingBlock:(id)a3;
- (void)enumerateAppPredictionViewControllersInIconLocationGroup:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateAppPredictionViewControllersWithIconViewsInIconLocationGroup:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateEditableViewControllersUsingBlock:(id)a3;
- (void)enumerateIconViewQueryableChildrenUsingBlock:(id)a3;
- (void)enumerateIconViewQueryableChildrenWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateIconViewsDisplayedInAppPredictionsInLocationGroup:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateKnownIconViewsUsingBlock:(id)a3;
- (void)enumeratePageStateObserversUsingBlock:(id)a3;
- (void)enumerateViewsToUpdateDuringColorPickingUsingListViewBlock:(id)a3 iconViewBlock:(id)a4;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)finishInstallingIconAnimated:(BOOL)a3;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)folder:(id)a3 listHiddenDidChange:(id)a4;
- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4;
- (void)folderController:(id)a3 didEndEditingTitle:(id)a4;
- (void)folderController:(id)a3 willRemoveFakeStatusBar:(id)a4;
- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7;
- (void)folderControllerDidEndScrolling:(id)a3;
- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4;
- (void)folderControllerShouldEndEditing:(id)a3;
- (void)folderControllerWillBeginScrolling:(id)a3;
- (void)folderControllerWillClose:(id)a3;
- (void)folderControllerWillOpen:(id)a3;
- (void)folderIconImageCache;
- (void)getListView:(id *)a3 folder:(id *)a4 relativePath:(id *)a5 forIndexPath:(id)a6;
- (void)getStatistics:(SBHIconManagerStatistics *)a3;
- (void)hasAnimatingFolderChanged;
- (void)hideSiriSuggestionOnWidgetFromStack:(id)a3;
- (void)hideSuggestedWidgetFromStack:(id)a3;
- (void)highlightIconView:(id)a3;
- (void)icon:(id)a3 touchEnded:(BOOL)a4;
- (void)iconCloseBoxTapped:(id)a3;
- (void)iconDragManager:(id)a3 didAddItemsToIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5;
- (void)iconDragManager:(id)a3 didEndIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5;
- (void)iconDragManager:(id)a3 didSpringLoadIconView:(id)a4;
- (void)iconDragManager:(id)a3 folderController:(id)a4 draggedIconShouldDropFromListView:(id)a5;
- (void)iconDragManager:(id)a3 iconDropSessionDidEnter:(id)a4;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6;
- (void)iconDragManager:(id)a3 wantsAnimatedRemovalOfIcon:(id)a4;
- (void)iconDragManager:(id)a3 wantsScrollToIconListContainingIcon:(id)a4 animated:(BOOL)a5;
- (void)iconDragManager:(id)a3 willBeginIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5;
- (void)iconDragManagerIconDraggingDidChange:(id)a3;
- (void)iconModel:(id)a3 didAddIcon:(id)a4;
- (void)iconModel:(id)a3 launchIcon:(id)a4 fromLocation:(id)a5 context:(id)a6;
- (void)iconModel:(id)a3 willRemoveIcon:(id)a4;
- (void)iconSizeButtonTriggered;
- (void)iconTapped:(id)a3;
- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4;
- (void)iconTouchBegan:(id)a3;
- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationWillEndWithInteraction:(id)a4;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)iconView:(id)a3 didDiscardCustomImageViewController:(id)a4;
- (void)iconView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)iconView:(id)a3 dropSessionDidExit:(id)a4;
- (void)iconView:(id)a3 wantsResizeToGridSizeClass:(id)a4 completionHandler:(id)a5;
- (void)iconView:(id)a3 willRemoveIconAccessoryView:(id)a4;
- (void)iconView:(id)a3 willRemoveIconImageView:(id)a4;
- (void)iconView:(id)a3 willRemoveIconLabelAccessoryView:(id)a4;
- (void)iconView:(id)a3 willUseContextMenuStyle:(id)a4;
- (void)iconViewDidBeginTrackingPossibleResize:(id)a3 context:(id)a4;
- (void)iconViewDidEndTrackingPossibleResize:(id)a3 context:(id)a4;
- (void)iconViewShortcutsPresentationDidCancel:(id)a3;
- (void)iconViewShortcutsPresentationWillFinish:(id)a3;
- (void)immediateDownloadSpringBoardHomeTrialSettingsWhenNeeded;
- (void)informUsageMonitorOfTodayViewVisibilityChange:(id)a3;
- (void)informUsageMonitorOfVisibleIconRectsForTodayViewController:(id)a3;
- (void)insertIcons:(id)a3 intoWidgetStack:(id)a4;
- (void)invalidateOnboardingWidgetPreviewViewControllers;
- (void)launchFolderFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5;
- (void)launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5;
- (void)layoutIconListsWithAnimationType:(int64_t)a3;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4;
- (void)libraryViewController:(id)a3 didAcceptDrop:(id)a4;
- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4;
- (void)libraryViewController:(id)a3 willLaunchIcon:(id)a4 fromLocation:(id)a5;
- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4;
- (void)libraryViewControllerDidDismiss:(id)a3;
- (void)libraryViewControllerDidPresent:(id)a3;
- (void)minimumHomeScreenScaleDidChange;
- (void)modalInteractionDidEnd:(id)a3;
- (void)modalInteractionWillBegin:(id)a3;
- (void)moveIconToHiddenPage:(id)a3;
- (void)multiplexingManager:(id)a3 willRemoveViewController:(id)a4 forIdentifier:(id)a5;
- (void)multiplexingWrapperViewControllerDidChangeGridAlignment:(id)a3;
- (void)multiplexingWrapperViewControllerWillChangeGridAlignment:(id)a3;
- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6;
- (void)noteFloatingDockWillAnimateChangeInHeight;
- (void)noteFloatingDockWillChangeHeight;
- (void)noteIconStateChangedExternally;
- (void)noteIconViewWillZoomDown:(id)a3;
- (void)noteInterfaceOrientationChanged;
- (void)noteRootFolderDidMutate;
- (void)openFolderIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)organizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3;
- (void)organizeAllIconsIntoFoldersWithPageCount:(unint64_t)a3;
- (void)performAfterAllIconTouchesFinishedUsingBlock:(id)a3;
- (void)performAfterCachingWidgetIntentsUsingBlock:(id)a3;
- (void)performAfterIconContextMenuDismissesUsingBlock:(id)a3;
- (void)popExpandedIconAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)popExpandedIconFromLocation:(id)a3 interactionContext:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)popModalInteraction;
- (void)popToCurrentRootIconList;
- (void)popToCurrentRootIconListWhenPossible;
- (void)prepareModalWidgetIntroductionWidgetViewSnapshots;
- (void)presentLeadingCustomViewWithCompletion:(id)a3;
- (void)presentLibraryForIconDragManager:(id)a3 windowScene:(id)a4;
- (void)presentTodayOverlay;
- (void)presentTodayOverlayForIconDragManager:(id)a3;
- (void)presentTrailingCustomViewWithCompletion:(id)a3;
- (void)prototypeSetDefaultSecondPageWidgetIcons;
- (void)purgeUnnecessaryAppearanceIconImageData;
- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7;
- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 forcePoppingPriorExpandedIcon:(BOOL)a6 animated:(BOOL)a7 completionHandler:(id)a8;
- (void)randomizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3;
- (void)recacheIconImageDataForRootIconsInBackgroundWithIconImageStyleConfiguration:(id)a3 cacheOptions:(unint64_t)a4;
- (void)recacheVisibleIconImageDataForRootIconsInBackgroundWithImageAppearance:(id)a3 cacheOptions:(unint64_t)a4;
- (void)recycleIconView:(id)a3;
- (void)refreshAppPredictionBadges;
- (void)relayout;
- (void)removeAllIconAnimations;
- (void)removeAllUndoRegistrationsInUndoManager:(id)a3;
- (void)removeAllWidgetIcons;
- (void)removeFirstWidgetFromRootFolderListAtIndex:(unint64_t)a3;
- (void)removeFolderPresentationObserver:(id)a3;
- (void)removeIcon:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)removePageStateObserver:(id)a3;
- (void)removeReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:(id)a3;
- (void)removeWidget:(id)a3 fromStack:(id)a4;
- (void)removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded:(BOOL)a3;
- (void)removeWidgetIconsFromHomeScreen;
- (void)replaceAppIcon:(id)a3 withWidgetOfSize:(id)a4;
- (void)replaceApplicationPlaceholderWithApplication:(id)a3 completionHandler:(id)a4;
- (void)replaceFolderIcon:(id)a3 byContainedIcon:(id)a4 animated:(BOOL)a5;
- (void)replaceHomescreenWithWidgets;
- (void)replaceWidgetIconWithAppIcon:(id)a3;
- (void)resetAllIconImageCaches;
- (void)resetRootIconLists;
- (void)resizeGestureHandler:(id)a3 didFinishWithGridSizeClass:(id)a4;
- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)rootFolder:(id)a3 wantsToDoPageHidingEducationWithCompletion:(id)a4;
- (void)rootFolderController:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5;
- (void)rootFolderController:(id)a3 didDismissWidgetEditingViewController:(id)a4;
- (void)rootFolderController:(id)a3 didEndOverscrollOnFirstPageWithVelocity:(double)a4 translation:(double)a5;
- (void)rootFolderController:(id)a3 didEndOverscrollOnLastPageWithVelocity:(double)a4 translation:(double)a5;
- (void)rootFolderController:(id)a3 didOverscrollOnFirstPageByAmount:(double)a4;
- (void)rootFolderController:(id)a3 didOverscrollOnLastPageByAmount:(double)a4;
- (void)rootFolderController:(id)a3 didPresentWidgetEditingViewController:(id)a4;
- (void)rootFolderController:(id)a3 handleInsertionForWidgetIcon:(id)a4 withReferenceIconView:(id)a5 fromPresenter:(id)a6 dismissViewControllerHandler:(id)a7;
- (void)rootFolderController:(id)a3 noteDidRemoveSuggestedWidgetIcon:(id)a4;
- (void)rootFolderController:(id)a3 noteDragItemWasConsumedExternallyForDropSession:(id)a4;
- (void)rootFolderController:(id)a3 prepareAddSheetViewController:(id)a4;
- (void)rootFolderController:(id)a3 setSuppressesEditingStateForExternalDockListViews:(BOOL)a4;
- (void)rootFolderController:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4;
- (void)rootFolderController:(id)a3 viewDidTransitionToSize:(CGSize)a4;
- (void)rootFolderController:(id)a3 wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:(CGPoint)a4;
- (void)rootFolderController:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5;
- (void)rootFolderController:(id)a3 willDismissWidgetEditingViewController:(id)a4;
- (void)rootFolderController:(id)a3 willPresentAddSheetViewController:(id)a4;
- (void)rootFolderController:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6;
- (void)rootFolderController:(id)a3 willPresentWidgetEditingViewController:(id)a4;
- (void)rootFolderController:(id)a3 willUsePropertyAnimator:(id)a4 toTransitionToState:(int64_t)a5;
- (void)rootFolderController:(id)a3 willUseTransitionContext:(id)a4 toTransitionToState:(int64_t)a5;
- (void)rootFolderControllerDidAcceptWidgetIntroduction:(id)a3;
- (void)rootFolderControllerDidEditWidgetIntroduction:(id)a3;
- (void)rootFolderControllerDidUndoWidgetIntroduction:(id)a3;
- (void)rootFolderControllerViewDidDisappear:(id)a3;
- (void)rootFolderControllerViewWillAppear:(id)a3;
- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5;
- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6;
- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)rootFolderPageStateProvider:(id)a3 willEndTransitionToState:(int64_t)a4 successfully:(BOOL)a5;
- (void)runDownloadingIconTest;
- (void)runRemoveAndRestoreIconTest;
- (void)saveGridPath:(id)a3 asPriorLocationBeforeResizeForIcon:(id)a4;
- (void)saveOriginalIconStateForWidgetDiscoverability;
- (void)scrollToDefaultWidgets;
- (void)scrollToIconListContainingIcon:(id)a3 animate:(BOOL)a4;
- (void)setAddWidgetSheetConfigurationManager:(id)a3;
- (void)setAnimatingFolderCreation:(BOOL)a3;
- (void)setAnimatingFolderOpeningOrClosing:(BOOL)a3;
- (void)setAnimatingForUnscatter:(BOOL)a3;
- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3;
- (void)setAtxIconRanker:(id)a3;
- (void)setCanDismissOverscrollLibraryForPageTransition:(BOOL)a3;
- (void)setCanPresentOverscrollLibraryForPageTransition:(BOOL)a3;
- (void)setChuisOnboardingWidgetViewControllers:(id)a3;
- (void)setClosingFolder:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setCurrentConfiguringIconView:(id)a3;
- (void)setCurrentInteractionContext:(id)a3;
- (void)setCurrentPersonDetailInteraction:(id)a3;
- (void)setCurrentStylePickerViewController:(id)a3;
- (void)setCurrentTransitionAnimator:(id)a3;
- (void)setDefaultFirstPageSuggestedWidgetIcons:(id)a3;
- (void)setDefaultFirstPageWidgetDescriptors:(id)a3;
- (void)setDefaultFirstPageWidgetSizeClass:(id)a3;
- (void)setDefaultSecondPageSuggestedWidgetIcons:(id)a3;
- (void)setDefaultSecondPageWidgetDescriptors:(id)a3;
- (void)setDefaultSecondPageWidgetSizeClass:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidChangeIconStyleWithColorPicker:(BOOL)a3;
- (void)setDisablesScrollingToLastIconPageForLibraryDismissal:(BOOL)a3;
- (void)setDismissingMenuForFolderPresentation:(BOOL)a3;
- (void)setDockPinnedForRotation:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 forIconLocation:(id)a4;
- (void)setEditing:(BOOL)a3 fromIconListView:(id)a4;
- (void)setEditing:(BOOL)a3 fromIconView:(id)a4;
- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4;
- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4 location:(CGPoint)a5;
- (void)setEditingAutosaveDisableAssertion:(id)a3;
- (void)setEditingEndTimer:(id)a3;
- (void)setFloatingDockViewController:(id)a3;
- (void)setGridCellInfoOptionsForInsertingDefaultWidgets:(unint64_t)a3;
- (void)setHighlightedIconView:(id)a3;
- (void)setIconImageRecachingRequestCancellation:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIconPrecachingCancellation:(id)a3;
- (void)setIconStylePickerVisible:(BOOL)a3;
- (void)setIconToReveal:(id)a3;
- (void)setIconToReveal:(id)a3 revealingPrevious:(BOOL)a4;
- (void)setIdleModeText:(id)a3;
- (void)setInternalForceShowWidgetDiscoverability:(BOOL)a3;
- (void)setLeadingCustomViewControllers:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setListLayoutProviderLayoutOptions:(unint64_t)a3;
- (void)setListLayoutProviderLayoutOptions:(unint64_t)a3 animated:(BOOL)a4;
- (void)setMainDisplayLibraryViewVisibilityTransitioning:(BOOL)a3;
- (void)setMainDisplayLibraryViewVisible:(BOOL)a3;
- (void)setMainDisplayLibraryViewVisible:(BOOL)a3 libraryViewTransitioning:(BOOL)a4;
- (void)setNeedsRelayout:(BOOL)a3;
- (void)setOverlayCoverSheetTodayViewController:(id)a3;
- (void)setOverlayCoverSheetTodayViewVisible:(BOOL)a3;
- (void)setOverlayLibraryViewController:(id)a3;
- (void)setOverlayTodayViewController:(id)a3;
- (void)setOverlayTodayViewVisibilityTransitioning:(BOOL)a3;
- (void)setOverlayTodayViewVisible:(BOOL)a3;
- (void)setOverlayTodayViewVisible:(BOOL)a3 todayViewTransitioning:(BOOL)a4;
- (void)setOwnsIconModel:(BOOL)a3;
- (void)setPostResetPathIdentifiers:(id)a3;
- (void)setPrecachedContentSizeCategory:(id)a3;
- (void)setPreviewInteractingIconView:(id)a3;
- (void)setProactiveWidgetSuggesterClient:(id)a3;
- (void)setRecyclesIconViews:(BOOL)a3;
- (void)setResettingRootIconLists:(BOOL)a3;
- (void)setRootFolder:(id)a3;
- (void)setRootFolderController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setRootViewControllerUserInterfaceStyleObservation:(id)a3;
- (void)setShouldClearStylePreviewManagerAfterRootTraitChange:(BOOL)a3;
- (void)setShouldDisableUserInteractionForWidgetDiscoverability:(BOOL)a3;
- (void)setShouldSkipPrecachingDataAfterReloadIcons:(BOOL)a3;
- (void)setShowsAddWidgetButtonWhileEditing:(BOOL)a3;
- (void)setShowsDoneButtonWhileEditing:(BOOL)a3;
- (void)setStylePreviewManager:(id)a3;
- (void)setTemporaryIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5;
- (void)setTodayViewCancelTouchesScrollingAssertion:(id)a3;
- (void)setTrailingCustomViewControllers:(id)a3;
- (void)setUsageMonitor:(id)a3;
- (void)setUsageMonitoringEnabled:(BOOL)a3;
- (void)setVisibleIconImageRecachingRequestCancellation:(id)a3;
- (void)setVisibleIconTintLimitedDelayedUpdateTimer:(id)a3;
- (void)setWidgetIntroductionItem:(id)a3;
- (void)setWidgetMetricsDelegate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)setupHomeScreenForWidgetScrollPerformanceTest;
- (void)shuffleWidgetStackForTestRecipe;
- (void)stylePickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4;
- (void)stylePickerViewController:(id)a3 didUpdateHomeScreenConfiguration:(id)a4;
- (void)stylePickerViewControllerDidFinish:(id)a3;
- (void)tearDownAndResetRootIconLists;
- (void)todayViewController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)toggleHomeScreenWallpaperDim:(id)a3;
- (void)toggleSuggestedWidgetInStackForTestRecipe;
- (void)tryScrollToIconToRevealAnimated:(BOOL)a3;
- (void)undoChangeWithPreparation:(id)a3;
- (void)undoDefaultTVWidget;
- (void)undoDefaultWidgets:(BOOL)a3;
- (void)undoPreparation:(id)a3 registerWithUndoManager:(id)a4 actionName:(id)a5 observer:(id)a6;
- (void)uninstallIcon:(id)a3;
- (void)uninstallIcon:(id)a3 animate:(BOOL)a4;
- (void)uninstallIcon:(id)a3 animate:(BOOL)a4 completion:(id)a5;
- (void)unscatterAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5;
- (void)updateAppPredictionViewControllersWithListLayoutProvider:(id)a3 oldListLayoutProvider:(id)a4 animated:(BOOL)a5;
- (void)updateIconViewAccessoryVisibility;
- (void)updateLargeIconsEnabledForAppPredictionViewController:(id)a3 animated:(BOOL)a4;
- (void)updatePronouncedContainerViewVisibility:(BOOL)a3 vertical:(BOOL)a4;
- (void)updateVisibleIconsToShowLeafIcons:(id)a3 hideLeafIcons:(id)a4;
- (void)updateWidgetDiscoverabilityUserPreferencesByDeletingWidget:(id)a3;
- (void)updateWidgetViewControllersWithCustomDisplayConfiguration:(id)a3;
- (void)updateWidgetViewControllersWithRenderScheme:(id)a3;
- (void)widgetHostViewController:(id)a3 requestsLaunch:(id)a4;
- (void)widgetHostViewControllerUsesSystemBackgroundMaterialDidChange:(id)a3;
- (void)widgetStackViewController:(id)a3 didActivateDataSource:(id)a4 fromUserInteraction:(BOOL)a5;
- (void)widgetStackViewController:(id)a3 didFinishUsingBackgroundView:(id)a4;
- (void)widgetStackViewController:(id)a3 didRemoveViewController:(id)a4;
@end

@implementation SBHIconManager

- (SBHFocusModeManager)focusModeManager
{
  return self->_focusModeManager;
}

void __44__SBHIconManager_iconViewShowingContextMenu__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 isShowingContextMenu])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)viewMap:(id)a3 shouldRecycleView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(self) = [(SBHIconManager *)self shouldRecycleIconView:v7];
  }
  else
  {
    id v8 = [(SBHIconManager *)self widgetBackgroundViewMap];

    if (v8 == v6) {
      LODWORD(self) = [v7 _wantsAutolayout] ^ 1;
    }
    else {
      LOBYTE(self) = 1;
    }
  }

  return (char)self;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 recycledViewsContainerProviderForIconManager:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)recycleIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self iconViewMap];
  [v5 recycleView:v4];
}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  id v5 = a3;
  id v6 = [(SBHIconManager *)self iconViewMap];

  if (v6 == v5
    || ([(SBHIconManager *)self homescreenIconAccessoryViewMap],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v5)
    || ([(SBHIconManager *)self homescreenIconLabelAccessoryViewMap],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v5))
  {
    unint64_t maxIconViewsInHierarchy = self->_maxIconViewsInHierarchy;
  }
  else
  {
    id v9 = [(SBHIconManager *)self homescreenIconImageViewMap];

    if (v9 == v5)
    {
      unint64_t maxIconViewsInHierarchy = -1;
    }
    else
    {
      id v10 = [(SBHIconManager *)self widgetBackgroundViewMap];

      if (v10 == v5) {
        unint64_t maxIconViewsInHierarchy = 10;
      }
      else {
        unint64_t maxIconViewsInHierarchy = 0;
      }
    }
  }

  return maxIconViewsInHierarchy;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id v4 = [(SBHIconManager *)self iconViewMap];
  id v5 = [v4 dequeueReusableViewOfClass:a3];

  return v5;
}

- (id)iconViewMap
{
  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    id v4 = [[SBHReusableViewMap alloc] initWithDelegate:self];
    id v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    id v6 = [(SBHIconManager *)self listLayoutProvider];
    id v7 = [v6 layoutForIconLocation:@"SBIconLocationRoot"];

    -[SBHReusableViewMap addRecycledViewsOfClass:upToCount:](self->_iconViewMap, "addRecycledViewsOfClass:upToCount:", -[SBHIconManager iconViewClass](self, "iconViewClass"), ([v7 numberOfColumnsForOrientation:1] + 2)* objc_msgSend(v7, "numberOfRowsForOrientation:", 1));
    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)homescreenIconAccessoryViewMap
{
  homescreenIconAccessoryViewMap = self->_homescreenIconAccessoryViewMap;
  if (!homescreenIconAccessoryViewMap)
  {
    id v4 = [[SBHReusableViewMap alloc] initWithDelegate:self];
    id v5 = self->_homescreenIconAccessoryViewMap;
    self->_homescreenIconAccessoryViewMap = v4;

    homescreenIconAccessoryViewMap = self->_homescreenIconAccessoryViewMap;
  }
  return homescreenIconAccessoryViewMap;
}

- (id)homescreenIconLabelAccessoryViewMap
{
  homescreenIconLabelAccessoryViewMap = self->_homescreenIconLabelAccessoryViewMap;
  if (!homescreenIconLabelAccessoryViewMap)
  {
    id v4 = [[SBHReusableViewMap alloc] initWithDelegate:self];
    id v5 = self->_homescreenIconLabelAccessoryViewMap;
    self->_homescreenIconLabelAccessoryViewMap = v4;

    homescreenIconLabelAccessoryViewMap = self->_homescreenIconLabelAccessoryViewMap;
  }
  return homescreenIconLabelAccessoryViewMap;
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icon];
  if ([(SBHIconManager *)self allowsBadgingForIcon:v5])
  {
    id v6 = [v4 location];
    BOOL v7 = [(SBHIconManager *)self allowsBadgingForIconLocation:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)allowsBadgingForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconManager:self allowsBadgingForIcon:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (SBHIconManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconManagerDelegate *)WeakRetained;
}

- (void)iconView:(id)a3 willRemoveIconImageView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self homescreenIconImageViewMap];
  [v6 recycleView:v5];
}

- (BOOL)isLibraryPresentationModal
{
  return 0;
}

- (BOOL)isTransitioningHomeScreenState
{
  v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isTransitioningPageState];

  return v3;
}

- (BOOL)isShowingPullDownSearch
{
  v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isPullDownSearchVisible];

  return v3;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootViewController];
  [v5 enumerateDisplayedIconViewsUsingBlock:v4];

  id v6 = [(SBHIconManager *)self floatingDockViewController];
  [v6 enumerateDisplayedIconViewsUsingBlock:v4];

  BOOL v7 = [(SBHIconManager *)self _effectiveTodayViewController];
  [v7 enumerateDisplayedIconViewsUsingBlock:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(SBHIconManager *)self _libraryViewControllers];
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
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) enumerateDisplayedIconViewsUsingBlock:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)isEditing
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  if (self->_editing)
  {
    BOOL v2 = 1;
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __27__SBHIconManager_isEditing__block_invoke;
    v4[3] = &unk_1E6AB3C40;
    v4[4] = &v5;
    [(SBHIconManager *)self enumerateEditableViewControllersUsingBlock:v4];
    BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumerateEditableViewControllersUsingBlock:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBHIconManager *)self rootViewController];
  [(SBHIconManager *)self _enumerateEditableViewController:v5 usingBlock:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(SBHIconManager *)self leadingCustomViewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SBHIconManager *)self _enumerateEditableViewController:*(void *)(*((void *)&v21 + 1) + 8 * v10++) usingBlock:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(SBHIconManager *)self overlayTodayViewController];
  [(SBHIconManager *)self _enumerateEditableViewController:v11 usingBlock:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = [(SBHIconManager *)self _libraryViewControllers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SBHIconManager *)self _enumerateEditableViewController:*(void *)(*((void *)&v17 + 1) + 8 * v16++) usingBlock:v4];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)_enumerateEditableViewController:(id)a3 usingBlock:(id)a4
{
  if (a3)
  {
    char v4 = 0;
    (*((void (**)(id, id, char *))a4 + 2))(a4, a3, &v4);
  }
}

uint64_t __27__SBHIconManager_isEditing__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isEditing];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)_libraryViewControllers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 libraryViewControllersForIconManager:self];
  }
  else
  {
    char v4 = 0;
  }
  uint64_t v5 = [(SBHIconManager *)self overlayLibraryViewController];
  if (v5 && ([v4 containsObject:v5] & 1) == 0)
  {
    if (v4)
    {
      uint64_t v6 = [v4 arrayByAddingObject:v5];

      char v4 = (void *)v6;
    }
    else
    {
      v8[0] = v5;
      char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
  }

  return v4;
}

- (BOOL)hasOpenFolder
{
  char v3 = [(SBHIconManager *)self floatingDockViewController];
  if ([v3 isPresentingFolder])
  {
    BOOL v4 = 1;
  }
  else if ([(SBHIconManager *)self hasRootFolderController])
  {
    uint64_t v5 = [(SBHIconManager *)self rootViewController];
    uint64_t v6 = [v5 deepestFolderController];

    if (v6)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v7 = [(SBHIconManager *)self rootFolderController];
      uint64_t v8 = [v7 deepestFolderController];

      if (v8)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v9 = [(SBHIconManager *)self _currentFolderController];
        uint64_t v10 = [v9 deepestFolderController];
        BOOL v4 = v10 != 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isTodayViewEffectivelyVisible
{
  BOOL v3 = [(SBHIconManager *)self isOverlayTodayViewVisible];
  BOOL v4 = [(SBHIconManager *)self isCustomLeadingViewTodayView];
  if (v4) {
    LOBYTE(v4) = [(SBHIconManager *)self isShowingLeadingCustomView];
  }
  return v3 || v4;
}

- (BOOL)isOverlayTodayViewVisible
{
  return self->_overlayTodayViewVisible;
}

- (BOOL)_isShowingSearchableLeadingCustomView
{
  BOOL v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isOnLeadingCustomPage];

  return v3;
}

- (id)_currentFolderController
{
  char v3 = [(SBHIconManager *)self openedFolderController];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBHIconManager *)self rootFolderController];
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)enumerateIconViewQueryableChildrenWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void (**)(void, void, void, void))v6;
  if ((a3 & 0x20) == 0) {
    goto LABEL_3;
  }
  a3 &= ~0x20uLL;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __75__SBHIconManager_enumerateIconViewQueryableChildrenWithOptions_usingBlock___block_invoke;
  v68[3] = &unk_1E6AB42D8;
  id v69 = v6;
  v70 = &v71;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:a3 | 0x40 usingBlock:v68];
  BOOL v8 = *((unsigned char *)v72 + 24) == 0;

  _Block_object_dispose(&v71, 8);
  if (v8)
  {
LABEL_3:
    uint64_t v71 = 0;
    v72 = &v71;
    if (((a3 & 3) != 0) | a3 & 1) {
      int v9 = 1;
    }
    else {
      int v9 = (a3 >> 3) & 1;
    }
    uint64_t v73 = 0x2020000000;
    char v74 = 0;
    uint64_t v10 = [(SBHIconManager *)self floatingDockViewController];
    BOOL v11 = (a3 & 0x80) != 0 || [(SBHIconManager *)self isFloatingDockVisible];
    int v12 = v9 ^ 1;
    if (v10)
    {
      if (v12 | v11)
      {
        uint64_t v13 = v72;
        *((unsigned char *)v72 + 24) = 0;
        ((void (**)(void, void *, unint64_t, uint64_t *))v7)[2](v7, v10, a3, v13 + 3);
        if (*((unsigned char *)v72 + 24)) {
          goto LABEL_77;
        }
      }
    }
    if ((a3 & 3) != 0 && [(SBHIconManager *)self isShowingModalInteraction]) {
      goto LABEL_77;
    }
    uint64_t v14 = [(SBHIconManager *)self leadingTodayViewController];
    uint64_t v15 = [(SBHIconManager *)self overlayTodayViewController];
    v54 = (void *)v15;
    if (v14) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = (void *)v15;
    }
    id v17 = v16;
    BOOL v18 = [(SBHIconManager *)self isTodayViewEffectivelyVisible];
    v55 = v10;
    v52 = v14;
    if (v14) {
      int v19 = [v14 isSpotlightVisible];
    }
    else {
      int v19 = [v54 isSpotlightVisible];
    }
    if (v17)
    {
      if ((v9 & (!v18 | v19) & 1) == 0)
      {
        long long v23 = v72;
        *((unsigned char *)v72 + 24) = 0;
        ((void (**)(void, id, unint64_t, uint64_t *))v7)[2](v7, v17, a3, v23 + 3);
        if (*((unsigned char *)v72 + 24)) {
          goto LABEL_76;
        }
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __75__SBHIconManager_enumerateIconViewQueryableChildrenWithOptions_usingBlock___block_invoke_2;
        v64[3] = &unk_1E6AB4300;
        v65 = v7;
        v66 = &v71;
        unint64_t v67 = a3;
        [(SBHIconManager *)self enumerateAppPredictionViewControllersInIconLocationGroup:@"SBIconLocationGroupTodayView" withOptions:a3 usingBlock:v64];

        if (*((unsigned char *)v72 + 24))
        {
LABEL_76:

          uint64_t v10 = v55;
LABEL_77:

          _Block_object_dispose(&v71, 8);
          goto LABEL_78;
        }
      }
    }
    id v51 = v17;
    if ([(SBHIconManager *)self isShowingOrTransitioningToTrailingCustomView])
    {
      if (v10)
      {
        BOOL v20 = 1;
        goto LABEL_26;
      }
      long long v21 = [(SBHIconManager *)self trailingLibraryViewController];
      BOOL v20 = 1;
    }
    else
    {
      BOOL v20 = [(SBHIconManager *)self isMainDisplayLibraryViewVisible];
      if (v10)
      {
LABEL_26:
        long long v21 = [v10 libraryViewController];
        int v22 = [v10 isPresentingLibrary];
        if (!v21) {
          goto LABEL_41;
        }
LABEL_34:
        if (v22 && v12 | v20)
        {
          long long v24 = v72;
          *((unsigned char *)v72 + 24) = 0;
          ((void (**)(void, void *, unint64_t, uint64_t *))v7)[2](v7, v21, a3, v24 + 3);
          BOOL v25 = v18 || v20;
          if ((a3 & 3) == 0) {
            BOOL v25 = 0;
          }
          if (*((unsigned char *)v72 + 24) || v25) {
            goto LABEL_75;
          }
          goto LABEL_43;
        }
LABEL_41:
        if ((a3 & 3) != 0 && (v18 || v20)) {
          goto LABEL_75;
        }
LABEL_43:
        unint64_t v26 = [(SBHIconManager *)self contentVisibility];
        if ((a3 & 5) == 1 && v26 - 3 >= 0xFFFFFFFFFFFFFFFELL) {
          goto LABEL_75;
        }
        uint64_t v27 = [(SBHIconManager *)self _currentFolderController];
        v50 = v21;
        if (self->_closingFolder
          || [(SBHIconManager *)self isPerformingCancelledExpandTransition])
        {
          uint64_t v28 = [(SBHIconManager *)self rootFolderController];

          uint64_t v27 = (void *)v28;
        }
        v49 = v27;
        if (!v27) {
          goto LABEL_54;
        }
        v29 = v72;
        *((unsigned char *)v72 + 24) = 0;
        ((void (**)(void, void *, unint64_t, uint64_t *))v7)[2](v7, v27, a3, v29 + 3);
        if ((a3 & 1) == 0 || *((unsigned char *)v72 + 24))
        {
          if (!*((unsigned char *)v72 + 24))
          {
LABEL_54:
            uint64_t v32 = [(SBHIconManager *)self rootViewController];
            v33 = (void *)v32;
            if (v27
              || !v32
              || (v34 = v72,
                  *((unsigned char *)v72 + 24) = 0,
                  ((void (**)(void, uint64_t, unint64_t, uint64_t *))v7)[2](v7, v32, a3, v34 + 3),
                  !*((unsigned char *)v72 + 24)))
            {
              if ((a3 & 0x40) != 0) {
                goto LABEL_59;
              }
              *((unsigned char *)v72 + 24) = 0;
              v60[0] = MEMORY[0x1E4F143A8];
              v60[1] = 3221225472;
              v60[2] = __75__SBHIconManager_enumerateIconViewQueryableChildrenWithOptions_usingBlock___block_invoke_3;
              v60[3] = &unk_1E6AB4300;
              v61 = v7;
              v62 = &v71;
              unint64_t v63 = a3;
              [(SBHIconManager *)self enumerateAppPredictionViewControllersInIconLocationGroup:@"SBIconLocationGroupRoot" withOptions:a3 usingBlock:v60];
              BOOL v35 = *((unsigned char *)v72 + 24) == 0;

              if (v35)
              {
LABEL_59:
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                v36 = [(SBHIconManager *)self trailingCustomViewControllers];
                uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v75 count:16];
                id obj = v36;
                v48 = v33;
                if (v37)
                {
                  uint64_t v38 = *(void *)v57;
LABEL_61:
                  uint64_t v39 = 0;
                  while (1)
                  {
                    if (*(void *)v57 != v38) {
                      objc_enumerationMutation(obj);
                    }
                    v40 = *(void **)(*((void *)&v56 + 1) + 8 * v39);
                    if (objc_opt_respondsToSelector())
                    {
                      v41 = [(SBHIconManager *)self rootFolderController];
                      BOOL v42 = [v41 pageState] == 4;

                      if (v42)
                      {
                        v43 = [v40 iconViewQueryable];
                        v44 = (objc_opt_respondsToSelector() & 1) != 0 ? v43 : 0;
                        id v45 = v44;

                        v46 = v72;
                        *((unsigned char *)v72 + 24) = 0;
                        ((void (**)(void, id, unint64_t, uint64_t *))v7)[2](v7, v45, a3, v46 + 3);
                        BOOL v47 = *((unsigned char *)v72 + 24) == 0;

                        if (!v47) {
                          break;
                        }
                      }
                    }
                    if (v37 == ++v39)
                    {
                      uint64_t v37 = [obj countByEnumeratingWithState:&v56 objects:v75 count:16];
                      if (v37) {
                        goto LABEL_61;
                      }
                      break;
                    }
                  }
                }

                v33 = v48;
              }
            }

            uint64_t v27 = v49;
          }
        }
        else
        {
          v30 = [(SBHIconManager *)self rootFolderController];
          BOOL v31 = v27 == v30;

          if (v31) {
            goto LABEL_54;
          }
        }

        long long v21 = v50;
LABEL_75:

        id v17 = v51;
        goto LABEL_76;
      }
      long long v21 = [(SBHIconManager *)self overlayLibraryViewController];
    }
    int v22 = 1;
    if (!v21) {
      goto LABEL_41;
    }
    goto LABEL_34;
  }
LABEL_78:
}

- (SBHLibraryViewController)overlayLibraryViewController
{
  return self->_overlayLibraryViewController;
}

- (SBHTodayViewControlling)overlayTodayViewController
{
  return self->_overlayTodayViewController;
}

- (SBHIconRootViewProviding)rootViewController
{
  return self->_rootViewController;
}

- (SBFolderController)openedFolderController
{
  char v3 = [(SBHIconManager *)self floatingDockViewController];
  BOOL v4 = [v3 presentedFolderController];

  if (!v4)
  {
    id v5 = [(SBHIconManager *)self rootFolderController];
    BOOL v4 = [v5 deepestFolderController];
  }
  return (SBFolderController *)v4;
}

- (SBFloatingDockViewController)floatingDockViewController
{
  return self->_floatingDockViewController;
}

- (BOOL)isShowingOrTransitioningToTrailingCustomView
{
  BOOL v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isTrailingCustomViewVisibleOrTransitionDestination];

  return v3;
}

- (SBRootFolderController)rootFolderController
{
  return self->_rootFolderController;
}

- (BOOL)isCustomLeadingViewTodayView
{
  BOOL v2 = [(SBHIconManager *)self leadingTodayViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isMainDisplayLibraryViewVisible
{
  if (self->_mainDisplayLibraryViewVisible) {
    return 1;
  }
  BOOL v4 = [(SBHIconManager *)self trailingLibraryViewController];
  BOOL v5 = [(SBHIconManager *)self isShowingOrTransitioningToTrailingCustomView];
  if (v4) {
    BOOL v2 = v5;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (BOOL)isShowingModalInteraction
{
  BOOL v3 = [(SBHIconManager *)self currentConfiguringIconView];

  if (v3) {
    return 1;
  }
  BOOL v4 = [(SBHIconManager *)self currentPersonDetailInteraction];

  if (v4) {
    return 1;
  }
  return [(SBHIconManager *)self isIconStylePickerVisible];
}

- (BOOL)isIconStylePickerVisible
{
  return self->_iconStylePickerVisible;
}

- (SBHPeopleWidgetPersonDetailInteraction)currentPersonDetailInteraction
{
  return self->_currentPersonDetailInteraction;
}

- (SBIconView)currentConfiguringIconView
{
  return self->_currentConfiguringIconView;
}

- (id)leadingTodayViewController
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v2 = [(SBHIconManager *)self leadingCustomViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(id *)(*((void *)&v11 + 1) + 8 * v6);
      id v8 = (objc_opt_respondsToSelector() & 1) != 0 ? v7 : 0;
      id v9 = v8;

      if (v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isPerformingCancelledExpandTransition
{
  BOOL v3 = [(SBHIconManager *)self isTransitioning];
  if (v3)
  {
    BOOL v3 = [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator isCancelled];
    if (v3) {
      LOBYTE(v3) = [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator currentOperation] == 1;
    }
  }
  return v3;
}

- (BOOL)isTransitioning
{
  BOOL v2 = [(SBHIconManager *)self currentTransitionAnimator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBHomeScreenIconTransitionAnimator)currentTransitionAnimator
{
  return self->_currentTransitionAnimator;
}

uint64_t __75__SBHIconManager_enumerateIconViewQueryableChildrenWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __51__SBHIconManager_iconViewForIcon_location_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 isPresentingIconLocation:*(void *)(a1 + 32)])
  {
    uint64_t v7 = SBIconViewQueryingIconViewForIconInLocation(v10, *(void **)(a1 + 40), *(void **)(a1 + 32), a3);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__20;
  int v22 = __Block_byref_object_dispose__20;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SBHIconManager_iconViewForIcon_location_options___block_invoke;
  v14[3] = &unk_1E6AB43F0;
  id v10 = v9;
  id v15 = v10;
  id v17 = &v18;
  id v11 = v8;
  id v16 = v11;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:a5 usingBlock:v14];
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void)enumerateAppPredictionViewControllersInIconLocationGroup:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__SBHIconManager_enumerateAppPredictionViewControllersInIconLocationGroup_withOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E6AB4328;
  id v11 = v8;
  id v9 = v8;
  [(SBHIconManager *)self enumerateAppPredictionViewControllersWithIconViewsInIconLocationGroup:a3 withOptions:a4 usingBlock:v10];
}

- (void)enumerateAppPredictionViewControllersWithIconViewsInIconLocationGroup:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  char v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v20 = (void (**)(id, uint64_t, void *, char *))a5;
  char v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [(SBHIconManager *)self _effectiveAppPredictionViewControllersForUniqueIdentifier];
  id v9 = [v8 objectEnumerator];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v15 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
        id v16 = [v15 activeMultiplexingViewControllerForViewController:v14];

        id v17 = [(NSMapTable *)self->_iconViewsForWidgetMultiplexingViewController objectForKey:v16];
        uint64_t v18 = v17;
        if (v17)
        {
          if ((v6 & 1) == 0
            || ([v17 effectiveIconImageAlpha], (BSFloatIsZero() & 1) == 0)
            && [v18 _isInAWindow])
          {
            int v19 = [v18 location];
            if (SBIconLocationGroupContainsLocation(v21, v19))
            {
              char v26 = 0;
              v20[2](v20, v14, v18, &v26);
              if (v26)
              {

                goto LABEL_17;
              }
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (id)_effectiveAppPredictionViewControllersForUniqueIdentifier
{
  appPredictionViewControllersForUniqueIdentifier = self->_appPredictionViewControllersForUniqueIdentifier;
  if (!appPredictionViewControllersForUniqueIdentifier)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = self->_appPredictionViewControllersForUniqueIdentifier;
    self->_appPredictionViewControllersForUniqueIdentifier = v4;

    appPredictionViewControllersForUniqueIdentifier = self->_appPredictionViewControllersForUniqueIdentifier;
  }
  return appPredictionViewControllersForUniqueIdentifier;
}

- (BOOL)hasRootFolderController
{
  BOOL v2 = [(SBHIconManager *)self rootFolderController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_effectiveTodayViewController
{
  if ([(SBHIconManager *)self isTodayViewEffectivelyVisible])
  {
    BOOL v3 = [(SBHIconManager *)self leadingTodayViewController];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(SBHIconManager *)self overlayTodayViewController];
    }
    char v6 = v5;
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (BOOL)isFloatingDockVisible
{
  BOOL v3 = [(SBHIconManager *)self floatingDockViewController];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 isFloatingDockVisibleForIconManager:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

uint64_t __47__SBHIconManager_isDisplayingIconView_options___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIconView:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  id v4 = a3;
  char v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconManager:self iconViewDisplaysLabel:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3
{
  return objc_msgSend(a3, "bs_isAppearingOrAppeared");
}

- (id)iconView:(id)a3 labelImageWithParameters:(id)a4
{
  id v5 = a4;
  char v6 = [(SBHIconManager *)self iconLabelImageCache];
  uint64_t v7 = [v6 labelImageForParameters:v5];

  return v7;
}

- (SBIconLabelImageCache)iconLabelImageCache
{
  labelImageCache = self->_labelImageCache;
  if (!labelImageCache)
  {
    id v4 = [(SBHIconManager *)self listLayoutProvider];
    id v5 = [v4 layoutForIconLocation:@"SBIconLocationRoot"];

    char v6 = [(SBHIconManager *)self iconViewClass];
    uint64_t v7 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    [(objc_class *)v6 maxLabelSizeForListLayout:v5 contentSizeCategory:v7 options:0];
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = [SBIconLabelImageCache alloc];
    long long v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    id v15 = -[SBIconLabelImageCache initWithMaxLabelSize:scale:](v12, "initWithMaxLabelSize:scale:", v9, v11, v14);
    id v16 = self->_labelImageCache;
    self->_labelImageCache = v15;

    labelImageCache = self->_labelImageCache;
  }
  return labelImageCache;
}

- (id)parallaxSettingsForComponentsOfIconView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 location];
  if (![(SBHIconManager *)self _shouldParallaxInIconLocation:v5]
    || ![MEMORY[0x1E4FB1EB0] _motionEffectsSupported])
  {
    goto LABEL_5;
  }
  char v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v7 = [v6 iconManager:self supportsParallaxForIconView:v4];

    if (!v7)
    {
LABEL_5:
      double v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v10 = +[SBHHomeScreenDomain rootSettings];
  double v11 = [v10 iconSettings];
  double v8 = [v11 badgeParallaxSettings];

LABEL_6:
  return v8;
}

- (BOOL)_shouldParallaxInIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolderController];
  char v6 = [v5 nonDockPresentedIconLocations];
  char v7 = [v6 containsObject:v4];

  return v7;
}

void __38__SBHIconManager_bestLocationForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  [v6 presentedIconLocations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v6, "isDisplayingIcon:inLocation:", *(void *)(a1 + 32), v12, (void)v13))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v12);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)isIconDragging
{
  BOOL v2 = [(SBHIconManager *)self iconDragManager];
  char v3 = [v2 isIconDragging];

  return v3;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_msgSend(v10, "setAllowsCloseBox:", -[SBHIconManager iconsShouldAllowCloseBoxes](self, "iconsShouldAllowCloseBoxes"));
  [v10 setAllowsResizeHandle:1];
  [v10 setDelegate:self];
  [v10 addObserver:self];
  id v7 = [v10 location];
  if ((SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v7) & 1) != 0
    || [v7 isEqualToString:@"SBIconLocationFolder"])
  {
    [v10 setDisplaysIconStatusInLabel:1];
  }
  uint64_t v8 = [(SBHIconManager *)self iconDragManager];
  [v8 configureIconView:v10];
  [v10 setImageLoadingBehavior:1];
  uint64_t v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconManager:self configureIconView:v10 forIcon:v6];
  }
}

- (BOOL)iconsShouldAllowCloseBoxes
{
  BOOL v2 = [(SBHIconManager *)self iconDragManager];
  char v3 = [v2 isTrackingMultipleItemIconDrags] ^ 1;

  return v3;
}

- (BOOL)shouldRecycleIconView:(id)a3
{
  id v4 = a3;
  if (![(SBHIconManager *)self recyclesIconViews]) {
    goto LABEL_8;
  }
  if ([v4 _wantsAutolayout]) {
    goto LABEL_8;
  }
  id v5 = [(SBHIconManager *)self iconDragManager];
  char v6 = [v5 isTrackingDragOriginatingFromIconView:v4];

  if ((v6 & 1) != 0
    || ([(SBHIconManager *)self iconDragManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isTrackingDropIntoDestinationIconView:v4],
        v7,
        (v8 & 1) != 0)
    || ([v4 isShowingContextMenu] & 1) != 0
    || ([v4 isShowingConfigurationCard] & 1) != 0
    || ([v4 isCursorActive] & 1) != 0)
  {
LABEL_8:
    LOBYTE(v9) = 0;
  }
  else
  {
    int v9 = [v4 isCrossfadingImageWithView] ^ 1;
  }

  return v9;
}

- (SBIconDragManager)iconDragManager
{
  return self->_iconDragManager;
}

- (BOOL)recyclesIconViews
{
  return self->_recyclesIconViews;
}

- (BOOL)areAnyIconShareSheetsShowing
{
  BOOL v2 = [(SBHIconManager *)self iconShareSheetManager];
  char v3 = [v2 areAnyAppIconShareSheetsShowing];

  return v3;
}

- (SBHIconShareSheetManager)iconShareSheetManager
{
  return self->_iconShareSheetManager;
}

- (BOOL)allowsBadgingForIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconManager:self allowsBadgingForIconLocation:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)shouldHighlightTouchedIconView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icon];
  char v6 = [(SBHIconManager *)self reasonToDisallowTapOnIconView:v4];

  if (v6
    || ([v4 isGrabbed] & 1) != 0
    || [v5 isFolderIcon]
    && ![(SBHIconManager *)self canOpenFolderForIcon:v5]
    || ([(SBHIconManager *)self iconDragManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isTrackingDroppingIconDrags],
        v7,
        (v8 & 1) != 0))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    int v9 = [v4 isPaused] ^ 1;
  }

  return v9;
}

- (BOOL)iconShouldAllowTap:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self reasonToDisallowTapOnIconView:v4];
  char v6 = SBLogIcon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      char v8 = [v4 icon];
      int v9 = [v8 uniqueIdentifier];
      int v14 = 138412546;
      long long v15 = v9;
      __int16 v16 = 2114;
      id v17 = v5;
      id v10 = "Disallowing tap for icon view '%@' for reason '%{public}@'";
      double v11 = v6;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v7)
  {
    char v8 = [v4 icon];
    int v9 = [v8 uniqueIdentifier];
    int v14 = 138412290;
    long long v15 = v9;
    id v10 = "Allowing tap for icon view '%@'";
    double v11 = v6;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  return v5 == 0;
}

- (id)reasonToDisallowTapOnIconView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icon];
  int v6 = [v5 isWidgetIcon];
  if (-[SBHIconManager isEditing](self, "isEditing") && ([v5 isLeafIcon] ^ 1 | v6) != 1)
  {
    BOOL v7 = @"editing";
    goto LABEL_27;
  }
  if ([v4 isGrabbed])
  {
    BOOL v7 = @"icon is grabbed";
    goto LABEL_27;
  }
  if ([v5 isFolderIcon]
    && ![(SBHIconManager *)self canOpenFolderForIcon:v5])
  {
    BOOL v7 = @"can't open folder icon";
  }
  else
  {
    char v8 = [(SBHIconManager *)self iconDragManager];
    char v9 = [v8 isTrackingDroppingIconDrags];

    if (v9)
    {
      BOOL v7 = @"tracking dropping icon drags";
      goto LABEL_27;
    }
    id v10 = [(SBHIconManager *)self iconDragManager];
    if ([v10 isTrackingUserActiveIconDrags])
    {
      char v11 = [v5 isWidgetIcon];

      if (v11)
      {
        BOOL v7 = @"can't open widget while dragging";
        goto LABEL_27;
      }
    }
    else
    {
    }
    if (([v5 isLaunchEnabled] & 1) != 0
      || -[SBHIconManager isEditing](self, "isEditing") && [v5 isWidgetStackIcon])
    {
      if ([v5 isPlaceholder])
      {
        BOOL v7 = @"placeholder";
      }
      else if ([(SBHIconManager *)self isDismissingMenuForFolderPresentation])
      {
        BOOL v7 = @"dismissing menu for folder";
      }
      else
      {
        uint32_t v12 = [(SBHIconManager *)self delegate];
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([v12 iconManager:self reasonToDisallowTapOnIconView:v4],
              (BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          BOOL v7 = [(SBHIconManager *)self reasonToDisallowInteractionOnIconView:v4];
        }
      }
    }
    else
    {
      BOOL v7 = @"icon launch not enabled";
    }
  }
LABEL_27:

  return v7;
}

- (id)reasonToDisallowInteractionOnIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 iconManager:self reasonToDisallowInteractionOnIconView:v4];
  }
  else if ([(SBHIconManager *)self shouldDisableUserInteractionForWidgetDiscoverability])
  {
    int v6 = @"widget discoverability";
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)shouldDisableUserInteractionForWidgetDiscoverability
{
  return self->_shouldDisableUserInteractionForWidgetDiscoverability;
}

- (BOOL)isDismissingMenuForFolderPresentation
{
  return self->_dismissingMenuForFolderPresentation;
}

- (BOOL)isFolderPageManagementUIVisible
{
  BOOL v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isPageManagementUIVisible];

  return v3;
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 iconManager:self folderController:v6 canChangeCurrentPageIndexToIndex:a4];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (id)iconLocationForListsWithNonDefaultSizedIcons
{
  BOOL v2 = [(SBHIconManager *)self listLayoutProvider];
  char v3 = [(id)objc_opt_class() defaultIconLocationForListsWithNonDefaultSizedIcons];
  id v4 = [v2 layoutForIconLocation:@"SBIconLocationRoot"];
  id v5 = [v2 layoutForIconLocation:v3];
  int v6 = SBHIconListLayoutListGridSize(v4, 1);
  int v7 = SBHIconListLayoutListGridSize(v5, 1);
  [v4 layoutInsetsForOrientation:1];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v5 layoutInsetsForOrientation:1];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  BOOL v24 = SBHIconGridSizeEqualToIconGridSize(v6, v7);
  long long v25 = v3;
  if (v24)
  {
    if (v13 == v21 && v15 == v23 && v9 == v17 && v11 == v19) {
      long long v25 = @"SBIconLocationRoot";
    }
    else {
      long long v25 = v3;
    }
  }
  v29 = v25;

  return v29;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

+ (id)defaultIconLocationForListsWithNonDefaultSizedIcons
{
  return @"SBIconLocationRootWithWidgets";
}

- (id)iconView:(id)a3 backgroundViewForComponentsOfType:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(SBHIconManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 iconManager:self backgroundViewForComponentsOfType:a4 forIconView:v6],
        (double v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v7 iconManager:self backgroundViewForComponentsOfIconView:v6],
          (double v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v9 = [v6 icon];
      int v10 = [v9 isWidgetIcon];

      double v8 = 0;
      if (a4 == 4)
      {
        if (v10)
        {
          double v11 = [(SBHIconManager *)self widgetBackgroundViewMap];
          double v8 = [v11 viewOfClass:objc_opt_class()];
        }
      }
    }
  }

  return v8;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 icon];
  if ([v6 isWidgetIcon])
  {
    widgetViewControllersForIconView = self->_widgetViewControllersForIconView;
    if (!widgetViewControllersForIconView)
    {
      double v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      double v9 = self->_widgetViewControllersForIconView;
      self->_widgetViewControllersForIconView = v8;

      widgetViewControllersForIconView = self->_widgetViewControllersForIconView;
    }
    int v10 = [(NSMapTable *)widgetViewControllersForIconView objectForKey:v5];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(SBIconViewCustomImageViewController *)v10 icon],
          double v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11 == v6))
    {
      if (v10)
      {
LABEL_35:
        [(SBHIconManager *)self _updateIconView:v5 forCustomIconImageViewController:v10];
        goto LABEL_36;
      }
    }
    else
    {
    }
    id v12 = v6;
    double v13 = [v12 activeDataSource];
    double v14 = [v5 location];
    if ([v14 isEqualToString:@"SBIconLocationAddWidgetSheet"]
      && ([v12 isWidgetStackIcon] & 1) == 0
      && (self,
          double v15 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          (isKindOfClass & 1) != 0))
    {
      double v17 = SBLogWidgets();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v5;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Creating new widget custom image view controller for icon view: %@", buf, 0xCu);
      }

      double v18 = [(SBHIconManager *)self _makeCustomViewControllerForWidgetIcon:v12 dataSource:v13 location:v14];
      int v10 = [[SBIconViewCustomImageViewController alloc] initWithContentViewController:v18];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v19 = -[SBHIconManager _multiplexingViewControllerForIcon:dataSource:location:withPriority:](self, "_multiplexingViewControllerForIcon:dataSource:location:withPriority:", v12, v13, v14, [v5 customIconImageViewControllerPriority]);
        uint64_t v20 = objc_opt_class();
        id v21 = v19;
        uint64_t v37 = v14;
        if (v20)
        {
          if (objc_opt_isKindOfClass()) {
            double v22 = v21;
          }
          else {
            double v22 = 0;
          }
        }
        else
        {
          double v22 = 0;
        }
        id v24 = v22;

        [(SBHIconManager *)self _updateWidgetMultiplexingViewController:v24 forIconView:v5];
        long long v25 = [(SBHIconManager *)self delegate];
        v36 = a2;
        if (objc_opt_respondsToSelector()) {
          uint64_t v26 = [v25 iconManager:self canCustomElementAlignWithGrid:v13];
        }
        else {
          uint64_t v26 = 0;
        }
        uint64_t v27 = [(SBHIconManager *)self _effectiveAppPredictionViewControllersForUniqueIdentifier];
        uint64_t v38 = v13;
        uint64_t v28 = [v13 uniqueIdentifier];
        v29 = [v27 objectForKey:v28];

        if (!v29)
        {
          BOOL v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"appPredictionViewController != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            [(SBHIconManager *)v36 customImageViewControllerForIconView:(uint64_t)v35];
          }
          [v35 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D7F38D90);
        }
        v30 = [SBHMultiplexingWrapperViewController alloc];
        BOOL v31 = [v5 location];
        int v10 = [(SBHMultiplexingWrapperViewController *)v30 initWithIcon:v12 location:v31 multiplexingViewController:v24 appPredictionViewController:v29 canAlignWithGrid:v26];

        [(SBIconViewCustomImageViewController *)v10 setDelegate:self];
        double v14 = v37;
        double v13 = v38;
      }
      else
      {
        double v23 = SBLogWidgets();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v5;
          _os_log_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_DEFAULT, "Creating new widget stack view controller for icon view: %@", buf, 0xCu);
        }

        int v10 = [[SBHWidgetStackViewController alloc] initWithIcon:v12 iconListLayoutProvider:self->_listLayoutProvider];
        [(SBIconViewCustomImageViewController *)v10 setDataSource:self];
        [(SBIconViewCustomImageViewController *)v10 setDelegate:self];
        [(SBIconViewCustomImageViewController *)v10 setAutomaticallyUpdatesVisiblySettled:0];
        -[SBIconViewCustomImageViewController setShowsSquareCorners:](v10, "setShowsSquareCorners:", [v5 showsSquareCorners]);
      }
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v32 = [(SBHIconManager *)self rootFolderController];
      uint64_t v33 = [v32 iconImageViewControllerPresentationModeForIconView:v5];

      [(SBIconViewCustomImageViewController *)v10 setPresentationMode:v33];
    }
    [(NSMapTable *)self->_widgetViewControllersForIconView setObject:v10 forKey:v5];

    if (v10) {
      goto LABEL_35;
    }
  }
  else
  {
    if (![v6 isDebugIcon])
    {
      int v10 = 0;
      goto LABEL_36;
    }
    int v10 = [[SBHDebugIconViewController alloc] initWithIcon:v6];
    if (v10) {
      goto LABEL_35;
    }
  }
LABEL_36:

  return v10;
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  id v11 = a3;
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconManager:self folderControllerWillBeginScrolling:v11];
  }
  id v5 = [(SBHIconManager *)self iconDragManager];
  [v5 noteFolderBeganScrolling];

  [(SBHIconManager *)self _discardEndEditingTimerAndDontResetUntilReasonIsRemoved:@"FOLDER_IS_BEING_SCROLLED"];
  id v6 = [(SBHIconManager *)self rootFolderController];
  [v6 bringWidgetIntroductionPopoverToFront];

  int v7 = [(SBHIconManager *)self leadingTodayViewController];
  if (objc_opt_respondsToSelector())
  {
    double v8 = [v7 cancelTouchesOnIconViews];
    double v9 = [(SBHIconManager *)self todayViewCancelTouchesScrollingAssertion];
    [v9 invalidate];

    [(SBHIconManager *)self setTodayViewCancelTouchesScrollingAssertion:v8];
  }
  int v10 = [(SBHIconManager *)self trailingLibraryViewController];
  if (objc_opt_respondsToSelector()) {
    [v10 folderControllerWillBeginScrolling:v11];
  }
}

- (void)folderControllerDidEndScrolling:(id)a3
{
  id v10 = a3;
  id v4 = [(SBHIconManager *)self iconToReveal];

  if (v4) {
    [(SBHIconManager *)self finishInstallingIconAnimated:1];
  }
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self folderControllerDidEndScrolling:v10];
  }
  [(SBHIconManager *)self _removeReasonToNotResetEndEditingTimer:@"FOLDER_IS_BEING_SCROLLED"];
  id v6 = [(SBHIconManager *)self rootFolderController];
  [v6 bringWidgetIntroductionPopoverToFront];

  int v7 = [(SBHIconManager *)self todayViewCancelTouchesScrollingAssertion];
  [v7 invalidate];

  [(SBHIconManager *)self setTodayViewCancelTouchesScrollingAssertion:0];
  BOOL v8 = [(SBHIconManager *)self isShowingOrTransitioningToLeadingCustomView]|| [(SBHIconManager *)self isShowingOrTransitioningToTrailingCustomView];
  [(SBRootFolderController *)self->_rootFolderController setParallaxDisabled:v8 forReason:@"Custom leading/trailing view is not visible"];
  double v9 = [(SBHIconManager *)self trailingLibraryViewController];
  if (v9 && ![(SBFolderController *)self->_rootFolderController isEditing]) {
    [v9 _dismissExpandedPods:1 completion:0];
  }
}

- (SBIcon)iconToReveal
{
  return self->_iconToReveal;
}

- (BSInvalidatable)todayViewCancelTouchesScrollingAssertion
{
  return self->_todayViewCancelTouchesScrollingAssertion;
}

- (void)setTodayViewCancelTouchesScrollingAssertion:(id)a3
{
}

- (void)_removeReasonToNotResetEndEditingTimer:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SBHIconManager *)self isEditing];
  reasonsToNotRestartEditingTimer = self->_reasonsToNotRestartEditingTimer;
  if (v4)
  {
    [(NSCountedSet *)reasonsToNotRestartEditingTimer removeObject:v6];
    [(SBHIconManager *)self _restartEditingEndTimer];
  }
  else
  {
    self->_reasonsToNotRestartEditingTimer = 0;
  }
}

- (BOOL)_isShowingOrTransitioningToSearchableLeadingCustomView
{
  BOOL v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isLeadingCustomViewVisibleOrTransitionDestination];

  return v3;
}

- (id)trailingLibraryViewController
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v2 = [(SBHIconManager *)self trailingCustomViewControllers];
  id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int v7 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_discardEndEditingTimerAndDontResetUntilReasonIsRemoved:(id)a3
{
  id v8 = a3;
  if ([(SBHIconManager *)self isEditing])
  {
    if (!self->_reasonsToNotRestartEditingTimer)
    {
      uint64_t v4 = (NSCountedSet *)objc_opt_new();
      reasonsToNotRestartEditingTimer = self->_reasonsToNotRestartEditingTimer;
      self->_reasonsToNotRestartEditingTimer = v4;
    }
    id v6 = [(SBHIconManager *)self editingEndTimer];
    if (v6)
    {
      int v7 = v6;
      [v6 invalidate];
      [(SBHIconManager *)self setEditingEndTimer:0];
    }
    [(NSCountedSet *)self->_reasonsToNotRestartEditingTimer addObject:v8];
  }
}

- (void)cancelAllFolderScrolling
{
  if ([(SBHIconManager *)self isScrolling])
  {
    id v3 = [(SBHIconManager *)self rootViewController];
    [v3 cancelScrolling];
  }
}

- (BOOL)isScrolling
{
  if ([(SBHIconManager *)self isRootFolderScrolling]) {
    return 1;
  }
  return [(SBHIconManager *)self isFolderScrolling];
}

- (BOOL)isRootFolderScrolling
{
  BOOL v2 = [(SBHIconManager *)self rootViewController];
  char v3 = [v2 isScrolling];

  return v3;
}

- (BOOL)isFolderScrolling
{
  BOOL v2 = [(SBHIconManager *)self openedFolderController];
  char v3 = [v2 isScrolling];

  return v3;
}

- (void)getListView:(id *)a3 folder:(id *)a4 relativePath:(id *)a5 forIndexPath:(id)a6
{
  id v10 = a6;
  long long v11 = [(SBHIconManager *)self rootFolder];
  id v20 = 0;
  long long v12 = [v11 folderContainingIndexPath:v10 relativeIndexPath:&v20];

  id v13 = v20;
  if (a3)
  {
    double v14 = [(SBHIconManager *)self rootFolderController];
    uint64_t v15 = [v14 folderControllerForFolder:v12];
    if ([v15 isOpen])
    {
      uint64_t v16 = SBFolderRelativeListIndex(v13);
      double v17 = [v15 iconListViewForIconListModelIndex:v16];
      if (v17)
      {
LABEL_10:
        id v19 = v17;
        *a3 = v19;

        goto LABEL_11;
      }
      if ([v12 isRootFolder])
      {
        if (v16 == 20000)
        {
          double v18 = [(SBHIconManager *)self _effectiveTodayViewController];
          double v17 = [v18 listView];

          goto LABEL_10;
        }
        if (v16 == 10000)
        {
          double v17 = [(SBHIconManager *)self floatingDockListView];
          goto LABEL_10;
        }
      }
    }
    double v17 = 0;
    goto LABEL_10;
  }
LABEL_11:
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = v13;
  }
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (id)imageViewForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self homescreenIconImageViewMap];
  uint64_t v6 = [v4 expectedIconImageViewClass];

  int v7 = [v5 viewOfClass:v6];

  return v7;
}

- (id)homescreenIconImageViewMap
{
  homescreenIconImageViewMap = self->_homescreenIconImageViewMap;
  if (!homescreenIconImageViewMap)
  {
    id v4 = [[SBHReusableViewMap alloc] initWithDelegate:self];
    id v5 = self->_homescreenIconImageViewMap;
    self->_homescreenIconImageViewMap = v4;

    [(SBHReusableViewMap *)self->_homescreenIconImageViewMap addRecycledViewsOfClass:objc_opt_class() upToCount:24];
    homescreenIconImageViewMap = self->_homescreenIconImageViewMap;
  }
  return homescreenIconImageViewMap;
}

- (id)viewMap:(id)a3 makeNewViewOfClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(SBHIconManager *)self widgetBackgroundViewMap];

  if (v7 == v6)
  {
    id v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
    uint64_t v11 = +[SBIconView componentBackgroundViewOfType:4 compatibleWithTraitCollection:v10 initialWeighting:1.0];
  }
  else
  {
    self;
    Class v8 = (Class)objc_claimAutoreleasedReturnValue();

    if (v8 != a4)
    {
      double v9 = 0;
      goto LABEL_7;
    }
    long long v12 = [SBIconView alloc];
    id v10 = [(SBHIconManager *)self listLayoutProvider];
    uint64_t v11 = [(SBIconView *)v12 initWithConfigurationOptions:0 listLayoutProvider:v10];
  }
  double v9 = (void *)v11;

LABEL_7:
  return v9;
}

- (id)widgetBackgroundViewMap
{
  widgetBackgroundViewMap = self->_widgetBackgroundViewMap;
  if (!widgetBackgroundViewMap)
  {
    id v4 = [[SBHReusableViewMap alloc] initWithDelegate:self];
    id v5 = self->_widgetBackgroundViewMap;
    self->_widgetBackgroundViewMap = v4;

    [(SBHReusableViewMap *)self->_widgetBackgroundViewMap addRecycledViewsOfClass:objc_opt_class() upToCount:2];
    widgetBackgroundViewMap = self->_widgetBackgroundViewMap;
  }
  return widgetBackgroundViewMap;
}

- (id)iconView:(id)a3 iconAccessoryViewOfClass:(Class)a4
{
  id v5 = [(SBHIconManager *)self homescreenIconAccessoryViewMap];
  id v6 = [v5 viewOfClass:a4];

  return v6;
}

- (void)setEditing:(BOOL)a3
{
}

void __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) clearHighlightedIcon];
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = *(id *)(a1 + 40);
    char v3 = [v2 view];
    id v4 = [v2 contentView];

    id v5 = [v4 superview];

    if (v5 != v3)
    {
      [v3 addSubview:v4];
      [v3 setNeedsLayout];
    }
  }
  if (*(void *)(a1 + 48))
  {
    id v6 = [*(id *)(a1 + 32) iconDragManager];
    [v6 setIndexPath:0 whenRevertingIconsWithPathPrefix:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) setCurrentTransitionAnimator:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4;
  v7[3] = &unk_1E6AACA90;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 isCancelled];
  if (*(unsigned char *)(a1 + 40) && (v4 & 1) == 0 && ([v3 transitionWasRestarted] & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1E4F4F898];
    id v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.15];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
    v7[3] = &unk_1E6AAC810;
    v7[4] = *(void *)(a1 + 32);
    [v5 animateWithSettings:v6 actions:v7];
  }
}

uint64_t __66__SBHIconManager_openFolderIcon_location_animated_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "finished opening folder: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) iconManager:*(void *)(a1 + 40) didOpenFolder:*(void *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SBHIconManager *)self rootViewController];
  uint64_t v11 = [(SBHIconManager *)self rootFolder];
  long long v12 = [v11 indexPathForIcon:v8];
  if (v12)
  {
    id v13 = [v11 folderContainingIndexPath:v12 relativeIndexPath:0];
    double v22 = [(SBHIconManager *)self openedFolderController];
    double v14 = [v22 folder];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6AB3D58;
    id v24 = v10;
    id v15 = v10;
    id v36 = v15;
    id v37 = v8;
    BOOL v39 = v6;
    id v23 = v9;
    id v38 = v9;
    uint64_t v16 = _Block_copy(aBlock);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_2;
    v27[3] = &unk_1E6AB3DA8;
    id v17 = v13;
    id v28 = v17;
    id v29 = v11;
    id v18 = v14;
    id v30 = v18;
    BOOL v34 = v6;
    id v31 = v15;
    uint64_t v32 = self;
    id v19 = v16;
    id v33 = v19;
    id v20 = (void (**)(void))_Block_copy(v27);
    id v21 = v20;
    if (!v18 || v18 == v17)
    {
      v20[2](v20);
    }
    else
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_5;
      v25[3] = &unk_1E6AADF78;
      uint64_t v26 = v20;
      [(SBHIconManager *)self popExpandedIconAnimated:v6 completionHandler:v25];
    }
    id v9 = v23;

    id v10 = v24;
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) revealIcon:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

void __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2 == *(void **)(a1 + 40) || ((v3 = *(void **)(a1 + 48)) != 0 ? (BOOL v4 = v3 == v2) : (BOOL v4 = 0), v4))
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v10();
  }
  else
  {
    id v5 = [v2 icon];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_3;
    v11[3] = &unk_1E6AB3D80;
    uint64_t v7 = *(void **)(a1 + 56);
    id v8 = *(void **)(a1 + 72);
    v11[4] = *(void *)(a1 + 64);
    id v12 = v5;
    char v14 = v6;
    id v13 = v8;
    id v9 = v5;
    [v7 revealIcon:v9 animated:v6 completionHandler:v11];
  }
}

uint64_t __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCurrentTransitionAnimator:(id)a3
{
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v11;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v15 = 0;
  int v16 = isKindOfClass & 1;
  BOOL v17 = a4 == 1;
  if (a4 != 1 && (isKindOfClass & 1) != 0)
  {
    id v18 = [(SBHIconManager *)self rootFolder];
    id v19 = [v13 folder];
    id v15 = [v18 indexPathForFolder:v19];
    if (v15)
    {
      BOOL v39 = v19;
      id v41 = v10;
      id v20 = [(SBHIconManager *)self rootViewController];
      uint64_t v21 = [v20 currentPageIndex];

      double v22 = [(SBHIconManager *)self rootFolderController];
      uint64_t v23 = [v22 iconListModelIndexForPageIndex:v21];

      if ([v18 isValidListIndex:v23])
      {
        id v24 = [v18 listAtIndex:v23];
        if (v24)
        {
          long long v25 = [v18 indexPathForFirstFreeSlotStartingAtList:v24 avoidingFirstList:0];
        }
        else
        {
          long long v25 = 0;
        }
      }
      else
      {
        long long v25 = 0;
        id v24 = 0;
      }
      uint64_t v26 = [(SBHIconManager *)self iconDragManager];
      [v26 setIndexPath:v25 whenRevertingIconsWithPathPrefix:v15];

      id v27 = v15;
      id v10 = v41;
      BOOL v17 = a4 == 1;
      id v19 = v39;
    }
  }
  id v28 = [(BSEventQueue *)self->_transitionEventQueue acquireLockForReason:@"performingTransitionOperation"];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
  v52[3] = &unk_1E6AB1330;
  BOOL v53 = v17;
  v52[4] = self;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3;
  v47[3] = &unk_1E6AB4608;
  v47[4] = self;
  char v51 = v16;
  id v29 = v13;
  id v48 = v29;
  id v30 = v15;
  id v49 = v30;
  id v31 = v28;
  id v50 = v31;
  [v12 animateAlongsideTransition:v52 completion:v47];
  if ([v12 isAnimated]) {
    [v12 animateAlongsideTransition:&__block_literal_global_932 completion:0];
  }
  if (v16)
  {
    id v40 = v30;
    id v42 = v10;
    id v32 = v29;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v33 = (void *)[(NSHashTable *)self->_folderPresentationObservers copy];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) iconManager:self willPerformTransitionWithFolder:v32 presenting:a4 == 1 withTransitionCoordinator:v12];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v35);
    }

    id v30 = v40;
    id v10 = v42;
  }
  id v38 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v38 iconManager:self nestingViewController:v10 willPerformOperation:a4 onViewController:v29 withTransitionCoordinator:v12];
  }
}

- (BOOL)presentHomeScreenIconsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBHIconManager *)self _isShowingPullDownSearchOrTransitioning]
    || (BOOL v5 = [(SBHIconManager *)self _isShowingLeadingCustomViewSearchOrTransitioning]))
  {
    uint64_t v6 = [(SBHIconManager *)self rootFolderController];
    [v6 performPageStateTransitionToState:0 reason:@"dismiss spotlight or today view" animated:v3 completionHandler:0];

    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_isShowingLeadingCustomViewSearchOrTransitioning
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isLeadingCustomViewSearchVisibleOrTransitioning];

  return v3;
}

- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SBHIconManager *)self highlightIconView:v6];
  uint64_t v7 = [v6 icon];
  id v8 = [(SBHIconManager *)self delegate];
  id v9 = [(SBHIconManager *)self iconDragManager];
  [v9 noteIconTapped];
  if ([v7 isLeafIcon] && -[SBHIconManager isEditing](self, "isEditing"))
  {
    if ([v6 supportsStackConfigurationCard])
    {
      id v10 = SBLogIcon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Starting stack configuration of icon due to tap: %@", buf, 0xCu);
      }

      [v6 presentStackConfigurationCard];
    }
    else if ([v6 supportsConfigurationCard])
    {
      uint64_t v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "Starting configuration of icon due to tap: %@", buf, 0xCu);
      }

      [v6 presentConfigurationCard];
    }
    else
    {
      [(SBHIconManager *)self clearHighlightedIcon];
      double v22 = SBLogIcon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v6;
        _os_log_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring tap to icon because of editing: %@", buf, 0xCu);
      }
    }
  }
  else if ([v7 isLaunchEnabled])
  {
    if ([v7 isWidgetIcon]
      && ([v7 activeWidget], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = v11;
      id v13 = [v11 uniqueIdentifier];
      char v14 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
      id v15 = [v14 viewControllerForIdentifier:v13];

      if (objc_msgSend(v15, "sbh_isWidgetHostViewController"))
      {
        id v16 = v15;
        BOOL v17 = [v6 customIconImageViewController];
        if (objc_msgSend(v17, "sbh_isWidgetStackViewController")) {
          id v18 = v17;
        }
        else {
          id v18 = 0;
        }
        id v19 = v18;
        if (([v19 isWidgetHitTestingDisabled] & 1) == 0)
        {
          id v24 = objc_msgSend(v19, "sbh_underlyingAvocadoHostViewControllers");
          if ([v24 containsObject:v16])
          {
            int v23 = [v16 shouldShareTouchesWithHost];

            if (v23) {
              [v16 requestLaunch];
            }
          }
          else
          {
          }
        }
      }
    }
    else
    {
      id v12 = [(SBHIconManager *)self launchActionsForIconView:v6];
      [(SBHIconManager *)self launchFromIconView:v6 withActions:v12 modifierFlags:a4];
    }
  }
  else
  {
    id v20 = SBLogIcon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring tap to icon because launching is not allowed: %@", buf, 0xCu);
    }

    [(SBHIconManager *)self clearHighlightedIcon];
    if (objc_opt_respondsToSelector()) {
      [v8 iconManager:self didReceiveTapOnLaunchDisabledIconView:v6];
    }
  }
}

- (void)launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 icon];
  id v11 = [v8 location];
  id v12 = [(SBHIconManager *)self delegate];
  id v13 = SBLogIcon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Icon tapped: %@", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v12 iconManager:self willPrepareIconViewForLaunch:v8];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SBHIconManager_launchFromIconView_withActions_modifierFlags___block_invoke;
  aBlock[3] = &unk_1E6AB41D0;
  id v14 = v8;
  id v27 = v14;
  id v15 = v10;
  id v28 = v15;
  id v29 = self;
  id v30 = v9;
  id v31 = v12;
  id v32 = v11;
  int64_t v33 = a5;
  id v16 = v11;
  id v17 = v12;
  id v18 = v9;
  id v19 = (void (**)(void))_Block_copy(aBlock);
  id v20 = [(SBHIconManager *)self floatingDockViewControllerForView:v14];
  uint64_t v21 = v20;
  if (v20)
  {
    char v22 = [v20 isPresentingLibrary];
  }
  else
  {
    if ([(SBHIconManager *)self isShowingOrTransitioningToTrailingCustomView])
    {
      int v23 = [(SBHIconManager *)self _currentFolderController];
LABEL_16:
      v19[2](v19);
      goto LABEL_17;
    }
    char v22 = [(SBHIconManager *)self isMainDisplayLibraryViewVisible];
  }
  char v24 = v22;
  int v23 = [(SBHIconManager *)self _currentFolderController];
  if ((v24 & 1) != 0
    || [(SBHIconManager *)self isShowingLeadingCustomView]
    || ![v23 isDisplayingIconView:v14])
  {
    goto LABEL_16;
  }
  long long v25 = SBLogIcon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v14;
    _os_log_impl(&dword_1D7F0A000, v25, OS_LOG_TYPE_INFO, "Telling current folder controller to prepare to launch: %@", buf, 0xCu);
  }

  [v23 prepareToLaunchTappedIcon:v15 completionHandler:v19];
LABEL_17:
  [(SBHIconManager *)self setPreviewInteractingIconView:0];
}

- (void)setPreviewInteractingIconView:(id)a3
{
  BOOL v5 = (SBIconView *)a3;
  previewInteractingIconView = self->_previewInteractingIconView;
  if (previewInteractingIconView != v5)
  {
    id v9 = v5;
    uint64_t v7 = previewInteractingIconView;
    objc_storeStrong((id *)&self->_previewInteractingIconView, a3);
    if (v7)
    {
      id v8 = [(SBHIconManager *)self iconDragManager];
      [v8 informQuickActionPlatterDidFinishPresentation:v7];
    }
    BOOL v5 = v9;
  }
}

- (id)launchActionsForIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self launchActionsForIconView:v4];
  }
  else {
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (void)iconTouchBegan:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBHIconManager *)self _addTouchedIconView:v4];
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Icon touch began: %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [v4 icon];
  uint64_t v7 = [(SBHIconManager *)self delegate];
  if ([(SBHIconManager *)self shouldHighlightTouchedIconView:v4]) {
    [(SBHIconManager *)self highlightIconView:v4];
  }
  id v8 = [(SBHIconManager *)self reasonToDisallowTapOnIconView:v4];
  if (v8)
  {
    id v9 = SBLogIcon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Icon tap not allowed because \"%@\": %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [v7 iconManager:self possibleUserIconTapBegan:v4];
    }
    uint64_t v10 = mach_absolute_time();
    [v6 possibleUserTapBeganWithAbsoluteTime:v10 andContinuousTime:mach_continuous_time()];
    if (objc_opt_respondsToSelector()) {
      [v7 iconManager:self possibleUserIconTapBeganAfterInformingIcon:v4];
    }
  }
}

- (void)highlightIconView:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self highlightedIconView];
  if (v5 == v4)
  {
    id v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v9 = 138412290;
      *(void *)&v9[4] = v4;
      id v8 = "Icon view is already highlighted: %@";
LABEL_10:
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, v8, v9, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  id v6 = SBLogIcon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v7)
    {
      *(_DWORD *)id v9 = 138412290;
      *(void *)&v9[4] = v4;
      id v8 = "Highlighting icon view: %@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    *(_DWORD *)id v9 = 138412546;
    *(void *)&v9[4] = v5;
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = v4;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "Unhighlighting icon view '%@' to highlight '%@'", v9, 0x16u);
  }

  [v5 setHighlighted:0];
LABEL_12:
  objc_msgSend(v4, "setHighlighted:", 1, *(_OWORD *)v9);
  [(SBHIconManager *)self setHighlightedIconView:v4];
}

- (void)setHighlightedIconView:(id)a3
{
}

- (void)clearHighlightedIcon
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = [(SBHIconManager *)self highlightedIconView];
  if (v3)
  {
    id v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "Clearing highlight from icon view: %@", (uint8_t *)&v5, 0xCu);
    }

    [v3 setHighlighted:0];
    [(SBHIconManager *)self setHighlightedIconView:0];
  }
}

- (SBIconView)highlightedIconView
{
  return self->_highlightedIconView;
}

- (void)icon:(id)a3 touchEnded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SBHIconManager *)self _removeTouchedIconView:v6];
  uint64_t v7 = SBLogIcon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Icon touch canceled (tap gesture may still succeed): %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = [v6 icon];
    [v7 possibleUserTapDidCancel];
  }
  else if (v8)
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Icon touch ended: %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [(SBHIconManager *)self iconEditingFeedbackBehavior];
  if ([v9 isActive]) {
    [v9 deactivate];
  }
  uint64_t v10 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 iconManager:self touchesEndedForIconView:v6];
  }
}

- (void)_removeTouchedIconView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_touchedIconViews removeObject:a3];
  if (![(NSMutableSet *)self->_touchedIconViews count])
  {
    iconTouchesFinishedBlocks = self->_iconTouchesFinishedBlocks;
    if (iconTouchesFinishedBlocks)
    {
      int v5 = iconTouchesFinishedBlocks;
      id v6 = self->_iconTouchesFinishedBlocks;
      self->_iconTouchesFinishedBlocks = 0;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v7 = v5;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

- (UIImpactFeedbackGenerator)iconEditingFeedbackBehavior
{
  iconEditingFeedbackBehavior = self->_iconEditingFeedbackBehavior;
  if (!iconEditingFeedbackBehavior)
  {
    BOOL v4 = [(SBHIconManager *)self rootViewController];
    int v5 = [v4 view];
    [(SBHIconManager *)self configureFeedbackView:v5];

    iconEditingFeedbackBehavior = self->_iconEditingFeedbackBehavior;
  }
  return iconEditingFeedbackBehavior;
}

- (id)floatingDockViewControllerForView:(id)a3
{
  id v4 = a3;
  int v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 iconManager:self floatingDockViewControllerForView:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_addTouchedIconView:(id)a3
{
  id v4 = a3;
  touchedIconViews = self->_touchedIconViews;
  id v8 = v4;
  if (!touchedIconViews)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_touchedIconViews;
    self->_touchedIconViews = v6;

    id v4 = v8;
    touchedIconViews = self->_touchedIconViews;
  }
  [(NSMutableSet *)touchedIconViews addObject:v4];
}

void __63__SBHIconManager_launchFromIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) icon];
  char v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    SBLogIcon();
    id v4 = (SBHIconLaunchContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v23 = 138412546;
      uint64_t v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      _os_log_impl(&dword_1D7F0A000, &v4->super, OS_LOG_TYPE_DEFAULT, "Skipping launch because icon and iconView no longer match. icon %@, iconView: %@", (uint8_t *)&v23, 0x16u);
    }
LABEL_4:

    return;
  }
  if ([*(id *)(a1 + 40) isFolderIcon])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 80);
    [v8 launchFolderFromIconView:v7 withActions:v9 modifierFlags:v10];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = SBLogIcon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 80);
      int v23 = 138412546;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Telling delegate to launch with actions: %@ modifierFlags: %ld", (uint8_t *)&v23, 0x16u);
    }

    [*(id *)(a1 + 64) iconManager:*(void *)(a1 + 48) launchIconForIconView:*(void *)(a1 + 32) withActions:*(void *)(a1 + 56) modifierFlags:*(void *)(a1 + 80)];
  }
  else if (objc_opt_respondsToSelector())
  {
    long long v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v23 = 138412290;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Telling delegate to launch with actions: %@", (uint8_t *)&v23, 0xCu);
    }

    [*(id *)(a1 + 64) iconManager:*(void *)(a1 + 48) launchIconForIconView:*(void *)(a1 + 32) withActions:*(void *)(a1 + 56)];
  }
  else
  {
    char v16 = objc_opt_respondsToSelector();
    uint64_t v17 = SBLogIcon();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((v16 & 1) == 0)
    {
      if (v18)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        int v23 = 138412290;
        uint64_t v24 = v20;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Instructing icon to launch manually: %@", (uint8_t *)&v23, 0xCu);
      }

      id v4 = objc_alloc_init(SBHIconLaunchContext);
      [(SBHIconLaunchContext *)v4 setIconView:*(void *)(a1 + 32)];
      int v21 = [*(id *)(a1 + 40) performLaunchFromLocation:*(void *)(a1 + 72) context:v4];
      char v22 = SBLogIcon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 67109120;
        LODWORD(v24) = v21;
        _os_log_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEFAULT, "Icon handled launch: %{BOOL}u", (uint8_t *)&v23, 8u);
      }

      goto LABEL_4;
    }
    if (v18)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Telling delegate to launch: %@", (uint8_t *)&v23, 0xCu);
    }

    [*(id *)(a1 + 64) iconManager:*(void *)(a1 + 48) launchIconForIconView:*(void *)(a1 + 32)];
  }
}

- (void)rootFolderControllerViewDidDisappear:(id)a3
{
  id v3 = [(SBHIconManager *)self usageMonitor];
  [v3 noteIconManagerRootFolderControllerViewDidDisappear];
}

- (void)setContentVisibility:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_contentVisibility != a3)
  {
    uint64_t v5 = SBLogIcon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = SBHStringFromContentVisibility(a3);
      int v11 = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Changing icon manager content visibility to %{public}@", (uint8_t *)&v11, 0xCu);
    }
    self->_contentVisibility = a3;
    uint64_t v7 = [(SBHIconManager *)self rootViewController];
    objc_msgSend(v7, "setContentVisibility:", -[SBHIconManager effectiveRootFolderControllerContentVisibility](self, "effectiveRootFolderControllerContentVisibility"));

    id v8 = [(SBHIconManager *)self floatingDockViewController];
    if ([v8 isPresentingLibrary])
    {
      uint64_t v9 = [v8 libraryViewController];
      [v9 setContentVisibility:0];
    }
    if (a3 == 2)
    {
      if ([(SBHIconManager *)self isShowingModalInteraction]) {
        [(SBHIconManager *)self dismissModalInteractionsImmediately];
      }
    }
    uint64_t v10 = [(SBHIconManager *)self usageMonitor];
    [v10 noteIconManagerContentOccludedChanged];
  }
}

- (SBHHomeScreenUsageMonitor)usageMonitor
{
  return self->_usageMonitor;
}

- (unint64_t)effectiveRootFolderControllerContentVisibility
{
  unint64_t v3 = [(SBHIconManager *)self contentVisibility];
  if (!v3)
  {
    if ([(SBHIconManager *)self isOverlayTodayViewVisible]) {
      unint64_t v3 = [(SBHIconManager *)self isOverlayTodayViewVisibilityTransitioning] ^ 1;
    }
    else {
      unint64_t v3 = 0;
    }
    if ([(SBHIconManager *)self isMainDisplayLibraryViewVisible])
    {
      if (![(SBHIconManager *)self isMainDisplayLibraryViewVisibilityTransitioning])
      {
        id v4 = [(SBHIconManager *)self trailingLibraryViewController];

        if (!v4) {
          return 1;
        }
      }
    }
  }
  return v3;
}

- (BOOL)_isShowingPullDownSearchOrTransitioning
{
  unint64_t v3 = [(SBHIconManager *)self rootFolderController];
  if ([v3 isPullDownSearchVisibleOrTransitioning])
  {
    id v4 = [(SBHIconManager *)self rootFolderController];
    int v5 = [v4 isOnLeadingCustomPage] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (double)minimumHomeScreenScaleForFolderController:(id)a3
{
  id v4 = a3;
  int v5 = [(SBHIconManager *)self delegate];
  double v6 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v5 iconManager:self minimumHomeScreenScaleForFolderController:v4];
    double v6 = v7;
  }

  return v6;
}

- (void)_noteUserIsInteractingWithIcons
{
  unint64_t v3 = [(SBHIconManager *)self rootViewController];
  [v3 noteUserIsInteractingWithIcons];

  [(SBHIconManager *)self _restartEditingEndTimer];
}

uint64_t __47__SBHIconManager_isDisplayingIconView_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIconView:*(void *)(a1 + 32) options:a3];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SBHIconManager_isDisplayingIconView_options___block_invoke;
  v13[3] = &unk_1E6AB26C8;
  uint64_t v15 = &v16;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SBHIconManager_isDisplayingIconView_options___block_invoke_2;
  v10[3] = &unk_1E6AB26F0;
  uint64_t v12 = &v16;
  id v8 = v14;
  id v11 = v8;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v13, v10);
  LOBYTE(a4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return a4;
}

- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v37 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v38 = a7;
  id v14 = SBLogIcon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v48 = v11;
    __int16 v49 = 2114;
    id v50 = v12;
    __int16 v51 = 2112;
    id v52 = v13;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "push expanded icon %@ from location %{public}@ with context: %@", buf, 0x20u);
  }

  if (!v13
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v13 iconView],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [(SBHIconManager *)self floatingDockViewControllerForView:v15],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v15,
        !v16))
  {
    uint64_t v16 = [(SBHIconManager *)self floatingDockViewController];
  }
  if ([v16 isPresentingIconLocation:v12]
    && [v11 isFolderIcon])
  {
    uint64_t v17 = SBLogIcon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "telling floating dock view controller to open folder", buf, 2u);
    }

    [v16 presentFolderForIcon:v11 location:v12 animated:v37 completion:v38];
  }
  else
  {
    currentTransitionAnimator = self->_currentTransitionAnimator;
    if (currentTransitionAnimator)
    {
      if ([(SBHomeScreenIconTransitionAnimator *)currentTransitionAnimator currentOperation] == 1)
      {
        char v19 = SBLogIcon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "a folder is collapsing when trying to open folder", buf, 2u);
        }

        uint64_t v20 = [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator childViewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v21 = [v20 folder];
          id v22 = [v21 icon];
        }
        else
        {
          id v22 = 0;
        }
        id v29 = SBLogIcon();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v22 == v11)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_DEFAULT, "collapsing folder is the same as what we are trying to open; reversing",
              buf,
              2u);
          }

          if (v38)
          {
            currentExpandCompletions = self->_currentExpandCompletions;
            if (!currentExpandCompletions)
            {
              id v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              int64_t v33 = self->_currentExpandCompletions;
              self->_currentExpandCompletions = v32;

              currentExpandCompletions = self->_currentExpandCompletions;
            }
            uint64_t v34 = (void *)[v38 copy];
            id v35 = _Block_copy(v34);
            [(NSMutableArray *)currentExpandCompletions addObject:v35];
          }
          [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator reverse];
        }
        else
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_DEFAULT, "will wait to open folder until folder is finished closing", buf, 2u);
          }

          if ([(BSEventQueue *)self->_transitionEventQueue isEmpty])
          {
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __79__SBHIconManager_pushExpandedIcon_location_context_animated_completionHandler___block_invoke;
            v43[3] = &unk_1E6AADD48;
            v43[4] = self;
            id v44 = v11;
            id v45 = v12;
            id v46 = v13;
            [(SBHIconManager *)self _enqueueTransitionName:@"Request to open a folder while another folder is still closing" withHandler:v43];
          }
          if (v38) {
            (*((void (**)(id, void))v38 + 2))(v38, 0);
          }
        }
      }
      else if (v38)
      {
        __int16 v25 = SBLogIcon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D7F0A000, v25, OS_LOG_TYPE_DEFAULT, "a folder is transitioning (not collapsing) when trying to open folder; rejecting",
            buf,
            2u);
        }

        (*((void (**)(id, void))v38 + 2))(v38, 0);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__SBHIconManager_pushExpandedIcon_location_context_animated_completionHandler___block_invoke_473;
      aBlock[3] = &unk_1E6AB2790;
      objc_copyWeak(&v41, &location);
      id v23 = v38;
      id v40 = v23;
      uint64_t v24 = _Block_copy(aBlock);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[SBHIconManager openFolderIcon:location:animated:withCompletion:](self, "openFolderIcon:location:animated:withCompletion:", v11, v12, v37, v24, &v41);
      }
      else
      {
        uint64_t v26 = [(SBHIconManager *)self delegate];
        char v27 = objc_opt_respondsToSelector();
        id v28 = SBLogIcon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v11;
          __int16 v49 = 1024;
          LODWORD(v50) = v27 & 1;
          _os_log_impl(&dword_1D7F0A000, v28, OS_LOG_TYPE_DEFAULT, "Unknown icon for pushing expanded icon: %@. Delegate can handle: %{BOOL}u", buf, 0x12u);
        }

        if (v27)
        {
          [v26 iconManager:self launchIcon:v11 location:v12 animated:v37 completionHandler:v23];
        }
        else if (v23)
        {
          (*((void (**)(id, void))v23 + 2))(v23, 0);
        }
      }
      objc_destroyWeak(v36);
      objc_destroyWeak(&location);
    }
  }
}

- (void)openFolderIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = SBLogIcon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v11;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "open folder icon %@ location %{public}@", buf, 0x16u);
  }

  if (v10 && [(SBHIconManager *)self canOpenFolderForIcon:v10])
  {
    if ([(SBHIconManager *)self isShowingIconContextMenu])
    {
      id v14 = SBLogIcon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "will wait until context menus are dismissed", buf, 2u);
      }

      objc_storeWeak((id *)&self->_pendingFolderIconToOpen, v10);
      objc_initWeak((id *)buf, self);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__SBHIconManager_openFolderIcon_location_animated_withCompletion___block_invoke;
      v26[3] = &unk_1E6AB4070;
      objc_copyWeak(&v30, (id *)buf);
      id v29 = v12;
      id v27 = v10;
      id v28 = v11;
      BOOL v31 = v7;
      [(SBHIconManager *)self performAfterIconContextMenuDismissesUsingBlock:v26];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      objc_storeWeak((id *)&self->_pendingFolderIconToOpen, 0);
      uint64_t v16 = [v10 folder];
      uint64_t v17 = [(SBHIconManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v17 iconManager:self willOpenFolder:v16];
      }
      uint64_t v18 = [(SBHIconManager *)self iconDragManager];
      [v18 noteFolderControllerWillOpen];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__SBHIconManager_openFolderIcon_location_animated_withCompletion___block_invoke_2;
      v21[3] = &unk_1E6AAEEE8;
      id v22 = v17;
      id v23 = self;
      id v24 = v16;
      id v25 = v12;
      id v19 = v16;
      id v20 = v17;
      [(SBHIconManager *)self _animateFolderIcon:v10 open:1 location:v11 animated:v7 withCompletion:v21];
      if (!v7) {
        [(SBHIconManager *)self setAnimatingFolderOpeningOrClosing:0];
      }
    }
  }
  else
  {
    uint64_t v15 = SBLogIcon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v10;
      _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_INFO, "IGNORING. Icon = %@", buf, 0xCu);
    }

    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (BOOL)isShowingIconContextMenu
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBHIconManager *)self iconViewShowingContextMenu];
  if (v2)
  {
    unint64_t v3 = SBLogIcon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 location];
      int v5 = [v2 icon];
      double v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v7;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "isShowingIconContextMenu at location '%{public}@' for icon type '%{public}@'", (uint8_t *)&v9, 0x16u);
    }
  }

  return v2 != 0;
}

- (id)iconViewShowingContextMenu
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__20;
  int v9 = __Block_byref_object_dispose__20;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SBHIconManager_iconViewShowingContextMenu__block_invoke;
  v4[3] = &unk_1E6AB40C0;
  v4[4] = &v5;
  [(SBHIconManager *)self enumerateDisplayedIconViewsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __75__SBHIconManager__animateFolderIcon_open_location_animated_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _folderDidFinishOpenClose:*(unsigned __int8 *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 49) success:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setAnimatingFolderOpeningOrClosing:(BOOL)a3
{
  if (self->_animatingFolderOpeningOrClosing != a3)
  {
    BOOL v5 = [(SBHIconManager *)self hasAnimatingFolder];
    self->_animatingFolderOpeningOrClosing = a3;
    if (v5 != [(SBHIconManager *)self hasAnimatingFolder])
    {
      [(SBHIconManager *)self hasAnimatingFolderChanged];
    }
  }
}

- (BOOL)isFolderOpenForIconDragManager:(id)a3
{
  unint64_t v3 = [(SBHIconManager *)self openedFolderController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isAnimatingFolderIconTransitionForIconDragManager:(id)a3
{
  unint64_t v3 = [(SBHIconManager *)self currentTransitionAnimator];
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 iconAnimator];
    char v6 = [v5 isAnimating];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_folderDidFinishOpenClose:(BOOL)a3 animated:(BOOL)a4 success:(BOOL)a5
{
  if (!a3)
  {
    if (a5)
    {
      [(SBHIconManager *)self _cleanupForClosingFolderAnimated:a4];
    }
    else
    {
      closingFolder = self->_closingFolder;
      self->_closingFolder = 0;
    }
  }
  if ([(SBHIconManager *)self hasAnimatingFolder] && self->_iconToReveal) {
    [(SBHIconManager *)self finishInstallingIconAnimated:1];
  }
  [(SBHIconManager *)self setAnimatingFolderOpeningOrClosing:0];
}

- (BOOL)isAnimatingFolderCreation
{
  return self->_animatingFolderCreation;
}

- (BOOL)hasAnimatingFolder
{
  if ([(SBHIconManager *)self isAnimatingFolderOpeningOrClosing]) {
    return 1;
  }
  return [(SBHIconManager *)self isAnimatingFolderCreation];
}

- (BOOL)isAnimatingFolderOpeningOrClosing
{
  return self->_animatingFolderOpeningOrClosing;
}

- (void)_animateFolderIcon:(id)a3 open:(BOOL)a4 location:(id)a5 animated:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void))a7;
  if (!v12 && v10) {
    goto LABEL_5;
  }
  if (v10)
  {
    if (![(SBHIconManager *)self canOpenFolderForIcon:v12])
    {
LABEL_5:
      uint64_t v15 = SBLogIcon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v12;
        _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_INFO, "IGNORING. Icon = %@", buf, 0xCu);
      }

      if (v14) {
        v14[2](v14, 0);
      }
      goto LABEL_16;
    }
  }
  else if (![(SBHIconManager *)self canCloseFolders])
  {
    goto LABEL_5;
  }
  if (v8) {
    [(SBHIconManager *)self setAnimatingFolderOpeningOrClosing:1];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SBHIconManager__animateFolderIcon_open_location_animated_withCompletion___block_invoke;
  aBlock[3] = &unk_1E6AB4098;
  void aBlock[4] = self;
  BOOL v21 = v10;
  BOOL v22 = v8;
  id v20 = v14;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = [(SBHIconManager *)self _folderControllerForIcon:v12 inLocation:v13];
  uint64_t v18 = v17;
  if (v10) {
    [v17 pushFolderIcon:v12 location:v13 animated:v8 completion:v16];
  }
  else {
    [v17 popFolderAnimated:v8 completion:v16];
  }

LABEL_16:
}

- (BOOL)canOpenFolderForIcon:(id)a3
{
  id v4 = a3;
  if ([v4 isFolderIcon])
  {
    BOOL v5 = [(SBHIconManager *)self iconDragManager];
    char v6 = [v5 isTrackingDroppingIconDrags];

    if ((v6 & 1) == 0)
    {
      BOOL v8 = [(SBHIconManager *)self floatingDockViewController];
      int v9 = v8;
      if (v8)
      {
        char v10 = [v8 isPresentingLibrary];
        __int16 v11 = [v4 folder];
        if ((v10 & 1) == 0) {
          goto LABEL_9;
        }
      }
      else
      {
        BOOL v12 = [(SBHIconManager *)self isMainDisplayLibraryViewVisible];
        __int16 v11 = [v4 folder];
        if (!v12) {
          goto LABEL_9;
        }
      }
      if (![v11 isLibraryCategoryFolder])
      {
        BOOL v7 = 0;
        goto LABEL_11;
      }
LABEL_9:
      BOOL v7 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (id)_folderControllerForIcon:(id)a3 inLocation:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7
    || ![v6 isFolderIcon]
    || !SBIconLocationGroupContainsLocation(@"SBIconLocationGroupAppLibrary", v7))
  {
    goto LABEL_17;
  }
  BOOL v8 = [(SBHIconManager *)self trailingLibraryViewController];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v9 = [(SBHIconManager *)self _libraryViewControllers];
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 isDisplayingIcon:v6])
        {
          id v10 = v13;
          goto LABEL_14;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  if ((v9, (id v14 = v8) == 0) && (id v14 = v10) == 0
    || ([v14 folderController],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v10,
        v8,
        !v15))
  {
LABEL_17:
    uint64_t v15 = [(SBHIconManager *)self rootFolderController];
  }

  return v15;
}

uint64_t __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearHighlightedIcon];
}

- (Class)controllerClassForFolderClass:(Class)a3
{
  if (a3)
  {
    if ([(objc_class *)a3 isRootFolderClass]) {
      id v5 = (id)objc_opt_class();
    }
    else {
      id v5 = self;
    }
    id v6 = v5;
    id v7 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      id v6 = (void *)[v7 iconManager:self folderControllerClassForFolderClass:a3 proposedClass:v6];
    }
  }
  else
  {
    id v6 = 0;
  }
  return (Class)v6;
}

- (Class)controllerClassForFolder:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBHIconManager *)self controllerClassForFolderClass:v4];
}

uint64_t __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 720) relinquishLock:*(void *)(a1 + 40)];
}

- (void)rootFolderController:(id)a3 setSuppressesEditingStateForExternalDockListViews:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SBHIconManager *)self floatingDockViewController];
  [v5 setSuppressesEditingStateForListViews:v4];
}

- (void)folderControllerWillOpen:(id)a3
{
  id v5 = a3;
  [(SBHIconManager *)self setPreviewInteractingIconView:0];
  [(SBHIconManager *)self _noteUserIsInteractingWithIcons];
  BOOL v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconManager:self willOpenFolderController:v5];
  }
}

- (void)_restartEditingEndTimer
{
  if (![(NSCountedSet *)self->_reasonsToNotRestartEditingTimer count])
  {
    unint64_t v3 = [(SBHIconManager *)self editingEndTimer];
    [v3 invalidate];

    if ([(SBHIconManager *)self isEditing] && ![(SBHIconManager *)self isIconDragging])
    {
      objc_initWeak(&location, self);
      id v5 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      BOOL v8 = __41__SBHIconManager__restartEditingEndTimer__block_invoke;
      int v9 = &unk_1E6AAFD28;
      objc_copyWeak(&v10, &location);
      BOOL v4 = [v5 scheduledTimerWithTimeInterval:0 repeats:&v6 block:30.0];
      objc_msgSend(v4, "setTolerance:", 10.0, v6, v7, v8, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      BOOL v4 = 0;
    }
    [(SBHIconManager *)self setEditingEndTimer:v4];
  }
}

- (void)setEditingEndTimer:(id)a3
{
}

- (NSTimer)editingEndTimer
{
  return self->_editingEndTimer;
}

- (SBFolder)openedFolder
{
  unint64_t v3 = [(SBHIconManager *)self floatingDockViewController];
  BOOL v4 = [v3 presentedFolderController];
  id v5 = [v4 folder];

  if (!v5)
  {
    uint64_t v6 = [(SBHIconManager *)self openedFolderController];
    id v5 = [v6 folder];
  }
  return (SBFolder *)v5;
}

- (BOOL)iconView:(id)a3 shouldContinueToUseBackgroundViewForComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v9 = [v8 iconManager:self shouldContinueToUseBackgroundView:v7 forComponentsOfIconView:v6];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (id)fakeStatusBarForFolderController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 iconManager:self fakeStatusBarForFolderController:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)statusBarStyleRequestForFolderController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 iconManager:self statusBarStyleRequestForFolderController:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UIEdgeInsets)statusBarEdgeInsetsForFolderController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 iconManager:self statusBarEdgeInsetsForFolderController:v4];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4FB2848];
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (id)folderControllerWantsToHideStatusBar:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v8 = [v7 iconManager:self wantsToHideStatusBarForFolderController:v6 animated:v4];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (!a3)
  {
    if (![(SBHIconManager *)self isEditing]) {
      goto LABEL_34;
    }
    self->_editing = 0;
LABEL_7:
    [(NSMutableSet *)self->_partialEditingIconLocations removeAllObjects];
    [(SBHIconManager *)self _invalidateWallpaperTintColorDropper];
    if (self->_editingActivity)
    {
      os_activity_scope_leave(&self->_editingActivityScope);
      editingActivitdouble y = self->_editingActivity;
      self->_editingActivitdouble y = 0;
    }
    double v15 = [(SBHIconManager *)self rootFolder];
    [v15 enumerateAllIconsWithOptions:1 usingBlock:&__block_literal_global_228];

    uint64_t v13 = 0;
    goto LABEL_10;
  }
  BOOL v10 = [(SBHIconManager *)self isEditingAllowed];
  if (v10 == [(SBHIconManager *)self isEditing]) {
    goto LABEL_34;
  }
  self->_editing = v10;
  if (!v10) {
    goto LABEL_7;
  }
  double v11 = (OS_os_activity *)_os_activity_create(&dword_1D7F0A000, "editing mode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  double v12 = self->_editingActivity;
  self->_editingActivitdouble y = v11;

  os_activity_scope_enter((os_activity_t)self->_editingActivity, &self->_editingActivityScope);
  uint64_t v13 = 1;
LABEL_10:
  double v16 = SBLogIcon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v51 = v13;
    _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Editing state changed: %{BOOL}u", buf, 8u);
  }

  [(SBHIconManager *)self setPreviewInteractingIconView:0];
  double v17 = [(SBHIconManager *)self floatingDockViewController];
  [v17 setEditing:v13 animated:1];

  long long v18 = [(SBHIconManager *)self rootViewController];
  [v18 setEditing:v13 animated:1];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v19 = [(SBHIconManager *)self leadingCustomViewControllers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) setEditing:v13];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v21);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v24 = [(SBHIconManager *)self trailingCustomViewControllers];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * j) setEditing:v13];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v26);
  }

  id v29 = [(SBHIconManager *)self overlayTodayViewController];
  [v29 setEditing:v13];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = [(SBHIconManager *)self _libraryViewControllers];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * k) setEditing:v13 animated:1];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v32);
  }

  -[SBHIconManager editingDidChangeWithFeedbackBehavior:location:](self, "editingDidChangeWithFeedbackBehavior:location:", v9, x, y);
LABEL_34:
}

void __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bestLocationForIcon:*(void *)(a1 + 40)];
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_4;
  v6[3] = &unk_1E6AADF78;
  id v7 = *(id *)(a1 + 48);
  [v3 pushExpandedIcon:v4 location:v2 context:0 animated:v5 completionHandler:v6];
}

- (id)bestLocationForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__20;
  double v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __38__SBHIconManager_bestLocationForIcon___block_invoke;
  v8[3] = &unk_1E6AB2678;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)enumerateIconViewQueryableChildrenUsingBlock:(id)a3
{
}

- (void)iconView:(id)a3 willRemoveIconAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self homescreenIconAccessoryViewMap];
  [v6 recycleView:v5];
}

- (SBHIconManager)init
{
  v50.receiver = self;
  v50.super_class = (Class)SBHIconManager;
  id v2 = [(SBHIconManager *)&v50 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FA60A0]);
    id v4 = (void *)*((void *)v2 + 114);
    *((void *)v2 + 114) = v3;

    id v5 = objc_alloc_init(SBHDefaultIconListLayoutProvider);
    id v6 = (void *)*((void *)v2 + 76);
    *((void *)v2 + 76) = v5;

    id v7 = objc_alloc_init(SBHWidgetMetricsProvider);
    double v8 = (void *)*((void *)v2 + 116);
    *((void *)v2 + 116) = v7;

    [*((id *)v2 + 116) setDelegate:v2];
    id v9 = [*((id *)v2 + 76) layoutForIconLocation:@"SBIconLocationDock"];
    uint64_t v10 = SBHIconListLayoutMaximumIconCount(v9);
    uint64_t v11 = [*((id *)v2 + 76) layoutForIconLocation:@"SBIconLocationRoot"];
    uint64_t v12 = 3 * SBHIconListLayoutMaximumIconCount(v11);
    uint64_t v13 = [*((id *)v2 + 76) layoutForIconLocation:@"SBIconLocationFolder"];
    *((void *)v2 + 10) = v12 + v10 + SBHIconListLayoutMaximumIconCount(v13);

    double v14 = objc_alloc_init(SBIconDragManager);
    double v15 = (void *)*((void *)v2 + 82);
    *((void *)v2 + 82) = v14;

    [*((id *)v2 + 82) setDelegate:v2];
    id v16 = [[SBHIconShareSheetManager alloc] initWithIconManager:v2];
    double v17 = (void *)*((void *)v2 + 83);
    *((void *)v2 + 83) = v16;

    long long v18 = [[SBHFocusModeManager alloc] initWithIconManager:v2];
    long long v19 = (void *)*((void *)v2 + 73);
    *((void *)v2 + 73) = v18;

    id v20 = objc_alloc(MEMORY[0x1E4F4F740]);
    uint64_t v21 = [v20 initWithName:@"com.apple.SpringBoardHome.iconManager.transitions" onQueue:MEMORY[0x1E4F14428]];
    uint64_t v22 = (void *)*((void *)v2 + 90);
    *((void *)v2 + 90) = v21;

    uint64_t v23 = SBFEffectiveHomeButtonType();
    BOOL v24 = 1;
    v2[471] = v23 == 2;
    if (v23 != 2)
    {
      uint64_t v25 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v26 = [v25 userInterfaceIdiom];

      BOOL v24 = (v26 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    }
    v2[471] = v24;
    v2[472] = 1;
    uint64_t v27 = +[SBHHomeScreenDomain rootSettings];
    id v28 = (void *)*((void *)v2 + 92);
    *((void *)v2 + 92) = v27;

    [*((id *)v2 + 92) addKeyObserver:v2];
    uint64_t v29 = [*((id *)v2 + 92) rootFolderSettings];
    id v30 = (void *)*((void *)v2 + 93);
    *((void *)v2 + 93) = v29;

    [*((id *)v2 + 93) addKeyObserver:v2];
    uint64_t v31 = [*((id *)v2 + 92) iconSettings];
    uint64_t v32 = [v31 badgeParallaxSettings];
    uint64_t v33 = (void *)*((void *)v2 + 101);
    *((void *)v2 + 101) = v32;

    [*((id *)v2 + 101) addKeyObserver:v2];
    __int16 v34 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v35 = [v34 widgetIntroductionSettings];
    long long v36 = (void *)*((void *)v2 + 103);
    *((void *)v2 + 103) = v35;

    [*((id *)v2 + 103) addKeyObserver:v2];
    objc_storeStrong((id *)v2 + 119, @"SBHIconGridSizeClassSmall");
    objc_storeStrong((id *)v2 + 121, @"SBHIconGridSizeClassSmall");
    *((void *)v2 + 62) = 0;
    *(_WORD *)(v2 + 493) = 257;
    long long v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v2 selector:sel__reduceTransparencyStatusDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
    [v37 addObserver:v2 selector:sel__sizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
    if (__sb__runningInSpringBoard())
    {
      long long v38 = [*((id *)v2 + 116) systemDefaultMetricsSpecification];
      uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
      long long v40 = (void *)*((void *)v2 + 33);
      *((void *)v2 + 33) = v39;

      id v41 = objc_alloc_init(MEMORY[0x1E4F58E40]);
      long long v42 = (void *)*((void *)v2 + 79);
      *((void *)v2 + 79) = v41;

      [*((id *)v2 + 79) registerObserver:v2];
    }
    [v2 _setupStateCaptureHandleIfNeeded];
    long long v43 = objc_alloc_init(SBHWidgetIntroductionFeatureIntroductionItem);
    long long v44 = (void *)*((void *)v2 + 124);
    *((void *)v2 + 124) = v43;

    [*((id *)v2 + 124) setIconManager:v2];
    long long v45 = objc_alloc_init(SBHFeatureIntroductionManager);
    long long v46 = (void *)*((void *)v2 + 74);
    *((void *)v2 + 74) = v45;

    [*((id *)v2 + 74) addFeatureIntroductionItem:*((void *)v2 + 124) atLocations:14];
    BOOL v47 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    id v48 = [v47 addMonitor:v2 subjectMask:1 subscriptionOptions:1];
    objc_storeWeak((id *)v2 + 85, v48);
  }
  return (SBHIconManager *)v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SBHIconManager;
  [(SBHIconManager *)&v4 dealloc];
}

- (SBSearchGesture)searchGesture
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  id v3 = [v2 searchGesture];

  return (SBSearchGesture *)v3;
}

- (int64_t)interfaceOrientation
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v4 = [v3 interfaceOrientationForIconManager:self];
  }
  else
  {
    id v5 = [(SBHIconManager *)self rootViewController];
    id v6 = v5;
    if (v5) {
      int64_t v4 = [v5 orientation];
    }
    else {
      int64_t v4 = 1;
    }
  }
  return v4;
}

- (unint64_t)allowedInterfaceOrientations
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 allowedInterfaceOrientationsForIconManager:self];
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

- (unint64_t)possibleInterfaceOrientations
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 possibleInterfaceOrientationsForIconManager:self];
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

- (void)noteInterfaceOrientationChanged
{
  if ([(SBHIconManager *)self hasRootViewController])
  {
    id v5 = [(SBHIconManager *)self rootFolderController];
    int64_t v3 = [(SBHIconManager *)self interfaceOrientation];
    [v5 setOrientation:v3];
    unint64_t v4 = [v5 folderView];
    [v4 setOrientation:v3];
  }
}

- (BOOL)hasRootViewController
{
  id v2 = [(SBHIconManager *)self rootViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setIconModel:(id)a3
{
  id v5 = (SBHIconModel *)a3;
  if (self->_iconModel != v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"SBIconModelWillReloadIconsNotification" object:self->_iconModel];
    [v6 removeObserver:self name:@"SBIconModelDidReloadIconsNotification" object:self->_iconModel];
    [v6 removeObserver:self name:@"SBIconModelWillLayoutIconStateNotification" object:self->_iconModel];
    [v6 removeObserver:self name:@"SBIconModelDidLayoutIconStateNotification" object:self->_iconModel];
    objc_msgSend(v6, "removeObserver:name:object:", self);
    [(SBHIconManager *)self _endObservingLeafIconsInModel:self->_iconModel];
    id v7 = [(SBHIconModel *)self->_iconModel rootFolder];
    [v7 removeFolderObserver:self];

    double v8 = [(SBHIconModel *)self->_iconModel delegate];

    if (v8 == self) {
      [(SBHIconModel *)self->_iconModel setDelegate:0];
    }
    [(SBHIconManager *)self _prepareToResetRootIconLists];
    homescreenIconAccessoryViewMap = self->_homescreenIconAccessoryViewMap;
    self->_homescreenIconAccessoryViewMap = 0;

    homescreenIconLabelAccessoryViewMap = self->_homescreenIconLabelAccessoryViewMap;
    self->_homescreenIconLabelAccessoryViewMap = 0;

    homescreenIconImageViewMap = self->_homescreenIconImageViewMap;
    self->_homescreenIconImageViewMap = 0;

    labelImageCache = self->_labelImageCache;
    self->_labelImageCache = 0;

    [(SBHIconManager *)self resetAllIconImageCaches];
    folderIconImageCache = self->_folderIconImageCache;
    self->_folderIconImageCache = 0;

    objc_storeStrong((id *)&self->_iconModel, a3);
    if ([(SBHIconManager *)self ownsIconModel]) {
      [(SBHIconModel *)self->_iconModel setDelegate:self];
    }
    [v6 addObserver:self selector:sel__iconModelWillReloadIcons_ name:@"SBIconModelWillReloadIconsNotification" object:self->_iconModel];
    [v6 addObserver:self selector:sel__iconModelDidReloadIcons_ name:@"SBIconModelDidReloadIconsNotification" object:self->_iconModel];
    [v6 addObserver:self selector:sel__iconModelWillLayout_ name:@"SBIconModelWillLayoutIconStateNotification" object:self->_iconModel];
    [v6 addObserver:self selector:sel__iconModelDidLayout_ name:@"SBIconModelDidLayoutIconStateNotification" object:self->_iconModel];
    [v6 addObserver:self selector:sel__iconVisibilityChanged_ name:@"SBIconModelVisibilityDidChangeNotification" object:self->_iconModel];
    [(SBHIconModel *)self->_iconModel layoutIfNeeded];
    double v14 = [(SBHIconModel *)self->_iconModel rootFolder];
    [(SBHIconManager *)self setRootFolder:v14];
    double v15 = [(SBHIconManager *)self _rootFolderForRootViewControllerForRootFolder:v14];
    id v16 = [(SBHIconManager *)self rootViewController];
    [v16 setFolder:v15];

    [v6 postNotificationName:@"SBHIconManagerIconModelDidChange" object:self];
    [(SBHIconManager *)self _beginObservingLeafIconsInModel:self->_iconModel];
    double v17 = (void *)*MEMORY[0x1E4FB2608];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __31__SBHIconManager_setIconModel___block_invoke;
    v19[3] = &unk_1E6AAC810;
    v19[4] = self;
    [v17 _performBlockAfterCATransactionCommits:v19];
    [(SBHIconManager *)self noteRootFolderDidMutate];
    long long v18 = [(SBHIconManager *)self addWidgetSheetConfigurationManager];
    [v18 setIconModel:v5];
  }
}

uint64_t __31__SBHIconManager_setIconModel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _precacheDataForRootIcons];
}

- (void)setRootFolder:(id)a3
{
  id v5 = (SBRootFolder *)a3;
  rootFolder = self->_rootFolder;
  if (rootFolder != v5)
  {
    uint64_t v10 = v5;
    p_rootFolder = &self->_rootFolder;
    double v8 = [(SBRootFolder *)rootFolder delegate];

    if (v8 == self) {
      [(SBRootFolder *)*p_rootFolder setDelegate:0];
    }
    [(SBFolder *)self->_rootFolder removeFolderObserver:self];
    id v9 = [(SBFolder *)self->_rootFolder badgeBehaviorProvider];

    if (v9 == self) {
      [(SBFolder *)*p_rootFolder setBadgeBehaviorProvider:0];
    }
    objc_storeStrong((id *)&self->_rootFolder, a3);
    if ([(SBHIconManager *)self ownsIconModel])
    {
      [(SBRootFolder *)self->_rootFolder setDelegate:self];
      [(SBFolder *)self->_rootFolder setBadgeBehaviorProvider:self];
    }
    [(SBFolder *)self->_rootFolder addFolderObserver:self];
    id v5 = v10;
  }
}

- (BOOL)relayout
{
  BOOL v3 = [(SBHIconManager *)self hasAnimatingFolder];
  if (v3)
  {
    [(SBHIconManager *)self setNeedsRelayout:1];
    unint64_t v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SBHIconManager relayout]();
    }
  }
  else
  {
    id v5 = [(SBHIconManager *)self iconModel];
    [v5 layout];

    [(SBHIconManager *)self setNeedsRelayout:0];
  }
  return !v3;
}

- (id)iconLocationForPrecachingImages
{
  return @"SBIconLocationRoot";
}

- (Class)iconViewClass
{
  BOOL v3 = self;
  char v4 = [(SBHIconManager *)self isMemberOfClass:v3];

  if (v4) {
    goto LABEL_2;
  }
  Class subclassIconViewClass = self->_subclassIconViewClass;
  if (!subclassIconViewClass)
  {
    id v6 = self;
    id v7 = [(SBHIconManager *)self controllerClassForFolderClass:v6];

    id v8 = objc_alloc((Class)[(objc_class *)v7 listViewClass]);
    id v9 = [(SBHIconManager *)self listLayoutProvider];
    uint64_t v10 = (void *)[v8 initWithModel:0 layoutProvider:v9 iconLocation:@"SBIconLocationFolder" orientation:1 iconViewProvider:0];

    self->_Class subclassIconViewClass = (Class)[v10 baseIconViewClass];
    Class subclassIconViewClass = self->_subclassIconViewClass;
    if (!subclassIconViewClass) {
LABEL_2:
    }
      Class subclassIconViewClass = (Class)self;
  }
  return subclassIconViewClass;
}

- (id)cachingImageStyleConfiguration
{
  BOOL v3 = [(SBHIconManager *)self rootViewController];
  char v4 = [v3 traitCollection];
  id v5 = objc_msgSend(v4, "sbh_iconImageStyleConfiguration");
  if (!v5)
  {
    uint64_t v6 = [(SBHIconManager *)self _fetchCurrentStyleConfiguration];
    if (!v6
      || (id v7 = (void *)v6,
          +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:v6], id v5 = objc_claimAutoreleasedReturnValue(), v7, !v5))
    {
      id v5 = +[SBHIconImageStyleConfiguration defaultStyleConfiguration];
    }
  }

  return v5;
}

- (id)cachingImageAppearances
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  char v4 = [(SBHIconManager *)self rootViewController];
  id v5 = [v4 traitCollection];
  if (v5
    || (uint64_t v6 = (void *)MEMORY[0x1E4FB1E20],
        [(SBHIconManager *)self _fetchCurrentStyleConfiguration],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "sbh_traitCollectionWithHomeScreenStyleConfiguration:", v7),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v7,
        v5))
  {
    if (objc_msgSend(v5, "sbh_automaticallyChangesWithUserInterfaceStyle"))
    {
      if ([v5 userInterfaceStyle] == 2)
      {
        id v8 = +[SBHIconImageAppearance darkAppearance];
        [v3 setObject:v8 forKey:@"primary"];

        +[SBHIconImageAppearance lightAppearance];
      }
      else
      {
        uint64_t v11 = +[SBHIconImageAppearance lightAppearance];
        [v3 setObject:v11 forKey:@"primary"];

        +[SBHIconImageAppearance darkAppearance];
      id v9 = };
      uint64_t v10 = @"secondary";
    }
    else
    {
      id v9 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v5);
      uint64_t v10 = @"primary";
    }
    [v3 setObject:v9 forKey:v10];
  }
  if (![v3 count])
  {
    uint64_t v12 = +[SBHIconImageAppearance defaultAppearance];
    [v3 setObject:v12 forKey:@"primary"];
  }
  return v3;
}

- (id)prioritizedCachingImageAppearances
{
  id v2 = [(SBHIconManager *)self cachingImageAppearances];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __52__SBHIconManager_prioritizedCachingImageAppearances__block_invoke;
  v6[3] = &unk_1E6AB3AA8;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

void __52__SBHIconManager_prioritizedCachingImageAppearances__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 isEqualToString:@"primary"]) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithInteger:v6];
  [v7 setObject:v8 forKey:v5];
}

- (id)prioritizedCachingImageAppearancesForIconImageStyleConfiguration:(id)a3 priority:(int64_t)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithCapacity:2];
  id v9 = [(SBHIconManager *)self rootFolderController];
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  uint64_t v10 = [v9 traitCollection];
  uint64_t v11 = objc_msgSend(v7, "iconImageAppearanceWithUserInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v12 forKey:v11];

  uint64_t v13 = [v7 configurationType];
  if (!v13)
  {
    uint64_t v14 = [v11 appearanceType];
    if (v14 == 1)
    {
      uint64_t v15 = +[SBHIconImageAppearance lightAppearance];
    }
    else
    {
      if (v14) {
        goto LABEL_10;
      }
      uint64_t v15 = +[SBHIconImageAppearance darkAppearance];
    }
    id v16 = (void *)v15;
    if (v15)
    {
      [v8 setObject:&unk_1F300EFB0 forKey:v15];
    }
  }
LABEL_10:

  return v8;
}

- (void)_precacheDataForRootIcons
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogWidgets();
  if (os_signpost_enabled(v3))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_PRECACHE", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  id v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to begin precaching images and labels for root icons", (uint8_t *)&v9, 2u);
  }

  [(SBHIconManager *)self _precacheLabelsForRootIcons];
  [(SBHIconManager *)self _precacheIntentsForRootIcons];
  [(SBHIconManager *)self _precacheImagesForRootIcons];
  double v6 = CFAbsoluteTimeGetCurrent();
  id v7 = SBLogIcon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = v6 - Current;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Finished starting background precache for images and labels in %fs", (uint8_t *)&v9, 0xCu);
  }

  id v8 = SBLogWidgets();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_PRECACHE", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }
}

- (void)_precacheLabelsForRootIcons
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHIconManager *)self rootFolder];
  id v4 = [(SBHIconManager *)self currentRootIconList];
  uint64_t v5 = [v4 model];

  if (!v5)
  {
    uint64_t v5 = [v3 firstList];
    if (!v5) {
      goto LABEL_43;
    }
  }
  unint64_t v63 = v3;
  v62 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  double Current = CFAbsoluteTimeGetCurrent();
  id v7 = SBLogLabels();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  int v9 = SBLogLabels();
  double v10 = v9;
  unint64_t v57 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "_precacheLabelsForRootIcons", "", buf, 2u);
  }
  uint64_t v11 = (void *)v5;
  os_signpost_id_t spid = v8;

  uint64_t v12 = [(SBHIconManager *)self iconImageCache];
  uint64_t v13 = [(SBHIconManager *)self folderIconImageCache];
  uint64_t v14 = [(SBHIconManager *)self iconLabelImageCache];
  uint64_t v15 = [(SBHIconManager *)self iconLocationForPrecachingImages];
  uint64_t v16 = [(SBHIconManager *)self legibilitySettings];
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x1E4FB21E0] sharedInstanceForStyle:1];
  }
  id v17 = objc_alloc([(SBHIconManager *)self iconViewClass]);
  long long v18 = [(SBHIconManager *)self listLayoutProvider];
  long long v19 = (void *)[v17 initWithConfigurationOptions:212 listLayoutProvider:v18];

  [v19 setDelegate:self];
  [v19 setIconImageCache:v12];
  [v19 setFolderIconImageCache:v13];
  [v19 setLocation:v15];
  [v19 setLegibilitySettings:v16];
  id v20 = +[SBIconLabelViewPrewarmFactory sharedInstance];
  [v19 setIconLabelViewFactory:v20];

  long long v56 = [(SBHIconManager *)self cachingImageAppearances];
  uint64_t v55 = [v56 objectForKey:@"primary"];
  objc_msgSend(v19, "setOverrideIconImageAppearance:");
  uint64_t v21 = objc_alloc_init(SBIconLabelImageParametersBuilder);
  long long v58 = v19;
  [v19 configureLabelImageParametersBuilder:v21];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__SBHIconManager__precacheLabelsForRootIcons__block_invoke;
  aBlock[3] = &unk_1E6AB3AD0;
  uint64_t v53 = v21;
  v72 = v53;
  id v54 = v15;
  id v73 = v54;
  uint64_t v22 = (void (**)(void *, void *))_Block_copy(aBlock);
  v60 = (void *)v13;
  v61 = (void *)v12;
  long long v59 = (void *)v16;
  if ([v14 numberOfCachedImages])
  {
    uint64_t v23 = v11;
    if (self->_precacheLabelsGeneration)
    {
      BOOL v24 = objc_opt_new();
      uint64_t v25 = [v63 icons];
      uint64_t v26 = (void *)[v25 mutableCopy];

      unint64_t v27 = [v26 count];
      uint32_t v28 = v27;
      if (v27 >= 5) {
        unint64_t v29 = 5;
      }
      else {
        unint64_t v29 = v27;
      }
      if ([v24 count] < v29)
      {
        do
        {
          if (![v26 count]) {
            break;
          }
          id v30 = [v26 objectAtIndex:arc4random_uniform(v28)];
          uint64_t v31 = v22[2](v22, v30);
          objc_msgSend(v24, "bs_safeAddObject:", v31);
          [v26 removeObject:v30];
          unint64_t v32 = [v26 count];
          uint32_t v28 = v32;
          unint64_t v33 = v32 >= 5 ? 5 : v32;
        }
        while ([v24 count] < v33);
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v34 = v24;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v84 count:16];
      uint64_t v23 = v11;
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v68;
        while (2)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v68 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = [v14 cachedLabelImageForParameters:*(void *)(*((void *)&v67 + 1) + 8 * i)];

            if (!v39)
            {

              long long v40 = @"cache fault detected";
              BOOL v3 = v63;
              goto LABEL_32;
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v67 objects:v84 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }

      long long v40 = 0;
      int v41 = 0;
      double v42 = 0.0;
      BOOL v3 = v63;
      goto LABEL_37;
    }
    long long v40 = @"first run";
  }
  else
  {
    long long v40 = @"no images currently cached; def need to rebuild";
    uint64_t v23 = v11;
  }
  BOOL v3 = v63;
LABEL_32:
  uint64_t v43 = [v14 numberOfCacheMisses];
  long long v44 = objc_opt_new();
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __45__SBHIconManager__precacheLabelsForRootIcons__block_invoke_2;
  v64[3] = &unk_1E6AB3AF8;
  id v34 = v44;
  id v65 = v34;
  v66 = v22;
  [v3 enumerateAllIconsWithOptions:1 usingBlock:v64];
  [v14 ensureLabelImagesAreCached:v34];
  uint64_t v45 = [v14 numberOfCacheMisses];
  *(void *)&double v42 = v45 - v43;
  if (v45 != v43)
  {
    long long v46 = SBLogLabels();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v75 = v42;
      _os_log_impl(&dword_1D7F0A000, v46, OS_LOG_TYPE_DEFAULT, "_precacheLabelsForRootIcons: new cache hits: %lu", buf, 0xCu);
    }
  }
  int v41 = 1;
  uint64_t v26 = v65;
LABEL_37:

  BOOL v47 = SBLogLabels();
  id v48 = v47;
  if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v48, OS_SIGNPOST_INTERVAL_END, spid, "_precacheLabelsForRootIcons", "", buf, 2u);
  }

  double v49 = CFAbsoluteTimeGetCurrent();
  objc_super v50 = SBLogLabels();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t precacheLabelsGeneration = self->_precacheLabelsGeneration;
    *(_DWORD *)buf = 134219010;
    double v75 = v49 - Current;
    __int16 v76 = 1024;
    int v77 = v41;
    __int16 v78 = 1024;
    BOOL v79 = *(void *)&v42 != 0;
    __int16 v80 = 2114;
    v81 = v40;
    __int16 v82 = 2048;
    unint64_t v83 = precacheLabelsGeneration;
    _os_log_impl(&dword_1D7F0A000, v50, OS_LOG_TYPE_DEFAULT, "_precacheLabelsForRootIcons: %f; should prewarm? %{BOOL}u did prewarm? %{BOOL}u reason: %{public}@; generation %lu",
      buf,
      0x2Cu);
  }

  ++self->_precacheLabelsGeneration;
  [(SBHIconManager *)self setPrecachedContentSizeCategory:v62];

LABEL_43:
}

uint64_t __45__SBHIconManager__precacheLabelsForRootIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setIcon:a2 forLocation:*(void *)(a1 + 40)];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 buildParameters];
}

void __45__SBHIconManager__precacheLabelsForRootIcons__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isWidgetIcon] & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_msgSend(v3, "bs_safeAddObject:", v4);
  }
}

- (void)_precacheIntentsForRootIcons
{
  BOOL v3 = [(SBHIconManager *)self rootFolder];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SBHIconManager__precacheIntentsForRootIcons__block_invoke;
  v4[3] = &unk_1E6AAD1C0;
  v4[4] = self;
  [v3 enumerateAllIconsWithOptions:1 usingBlock:v4];
}

void __46__SBHIconManager__precacheIntentsForRootIcons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isWidgetIcon])
  {
    id v4 = v3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(v4, "iconDataSources", 0);
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
          id v10 = (id)[*(id *)(a1 + 32) _intentForDataSource:*(void *)(*((void *)&v11 + 1) + 8 * v9++) inIcon:v4 creatingIfNecessary:1];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_precacheImagesForRootIcons
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHIconManager *)self iconImageCache];
  uint64_t v4 = [(SBHIconManager *)self folderIconImageCache];
  id v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    labelImageCache = self->_labelImageCache;
    *(_DWORD *)buf = 134218496;
    long long v46 = v3;
    __int16 v47 = 2048;
    uint64_t v48 = v4;
    __int16 v49 = 2048;
    objc_super v50 = labelImageCache;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Precaching images for root icons. SBHIconImageCache: %p, SBFolderIconImageCache: %p, SBIconLabelImageCache: %p", buf, 0x20u);
  }
  unint64_t v32 = (void *)v4;

  uint64_t v7 = [(SBHIconManager *)self iconPrecachingCancellation];
  [v7 cancel];

  [(SBHIconManager *)self setIconPrecachingCancellation:0];
  uint64_t v8 = [v3 buildCacheRequestWithReason:@"precacheDataForRootIcons"];
  uint64_t v9 = [(SBHIconManager *)self cachingImageStyleConfiguration];
  id v10 = [(SBHIconManager *)self addAllIconsToCacheRequestBuilder:v8 iconImageStyleConfiguration:v9 highestPriority:2 lowerPriority:1 cacheOptions:1];
  uint64_t v11 = [v10 count];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __45__SBHIconManager__precacheImagesForRootIcons__block_invoke;
  v43[3] = &unk_1E6AB3B20;
  v43[4] = self;
  void v43[5] = v11;
  uint64_t v31 = v8;
  id v30 = [v8 finalizeRequestWithCompletionHandler:v43];
  -[SBHIconManager setIconPrecachingCancellation:](self, "setIconPrecachingCancellation:");
  long long v12 = [(SBHIconManager *)self prioritizedCachingImageAppearances];
  [v3 iconImageInfo];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __45__SBHIconManager__precacheImagesForRootIcons__block_invoke_146;
  v37[3] = &unk_1E6AB3B48;
  id v21 = v3;
  id v38 = v21;
  uint64_t v39 = v14;
  uint64_t v40 = v16;
  uint64_t v41 = v18;
  uint64_t v42 = v20;
  [v12 enumerateKeysAndObjectsUsingBlock:v37];
  uint64_t v22 = [(SBHIconManager *)self prioritizedCachingImageAppearancesForIconImageStyleConfiguration:v9 priority:1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v23 = self->_additionalPrecachingIconImageCaches;
  uint64_t v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = (id)[*(id *)(*((void *)&v33 + 1) + 8 * v27++) cacheImagesForIcons:v10 prioritizedImageAppearances:v22 reason:@"precacheDataForRootIcons (additional caches)" options:0 completionHandler:0];
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v25);
  }

  unint64_t v29 = SBLogIcon();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_DEFAULT, "Finished starting background precache for images", buf, 2u);
  }
}

void __45__SBHIconManager__precacheImagesForRootIcons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) iconPrecachingCancellation];
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 requestIdentifier];
  int v7 = BSEqualObjects();

  if (v7) {
    [*(id *)(a1 + 32) setIconPrecachingCancellation:0];
  }
  [v3 elapsedTime];
  uint64_t v9 = v8;
  int v10 = [v3 isFinished];
  uint64_t v11 = SBLogIcon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 134218496;
    uint64_t v14 = v12;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Finished background precaching %lu root icons in %f seconds. Finished: %{BOOL}u", (uint8_t *)&v13, 0x1Cu);
  }
}

void __45__SBHIconManager__precacheImagesForRootIcons__block_invoke_146(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = (id)[v3 genericImageWithImageAppearance:v5 options:0];
  +[SBHClockApplicationIconImageView precacheDataWithIconImageInfo:appearance:](SBHClockApplicationIconImageView, "precacheDataWithIconImageInfo:appearance:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)addAllIconsToCacheRequestBuilder:(id)a3 iconImageStyleConfiguration:(id)a4 highestPriority:(int64_t)a5 lowerPriority:(int64_t)a6 cacheOptions:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  int v13 = [(SBHIconManager *)self rootFolder];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __int16 v15 = [(SBHIconManager *)self prioritizedCachingImageAppearancesForIconImageStyleConfiguration:v12 priority:a5];
  long long v44 = [(SBHIconManager *)self prioritizedCachingImageAppearancesForIconImageStyleConfiguration:v12 priority:a6];
  uint64_t v16 = [(SBHIconManager *)self currentRootIconList];
  __int16 v17 = [v16 model];

  if (v17 && [v13 indexOfList:v17] != 0x7FFFFFFFFFFFFFFFLL
    || ([v13 firstList],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v17,
        (__int16 v17 = (void *)v18) != 0))
  {
    id v42 = v12;
    uint64_t v39 = [v13 dock];
    uint64_t v19 = [v39 icons];
    [v11 addIcons:v19 prioritizedImageAppearances:v15 options:a7];
    id v38 = (void *)v19;
    [v14 addObjectsFromArray:v19];
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v53[3] = 3;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __122__SBHIconManager_addAllIconsToCacheRequestBuilder_iconImageStyleConfiguration_highestPriority_lowerPriority_cacheOptions___block_invoke;
    v46[3] = &unk_1E6AB3B98;
    uint64_t v51 = v53;
    uint64_t v40 = v15;
    id v20 = v15;
    id v47 = v20;
    id v21 = v44;
    id v48 = v21;
    id v43 = v11;
    id v22 = v11;
    id v49 = v22;
    unint64_t v52 = a7;
    id v41 = v14;
    id v23 = v14;
    id v50 = v23;
    [v13 enumerateListsNearestToList:v17 usingBlock:v46];
    uint64_t v24 = [(SBHIconManager *)self _libraryViewControllers];
    uint64_t v25 = [v24 firstObject];

    uint64_t v26 = [v25 podTopLevelDisplayedIcons];
    uint64_t v27 = v26;
    if (v26)
    {
      id v28 = objc_msgSend(v26, "sbh_arrayByRemovingObjectsFromArray:", v23);
      if ((unint64_t)[v13 listCount] <= 2) {
        unint64_t v29 = v21;
      }
      else {
        unint64_t v29 = v20;
      }
      id v30 = v29;
      [v22 addIcons:v28 prioritizedImageAppearances:v30 options:a7];
    }
    uint64_t v31 = [v13 ignoredList];
    unint64_t v32 = [v31 icons];
    long long v33 = v32;
    if (v27)
    {
      objc_msgSend(v32, "sbh_arrayByRemovingObjectsFromArray:", v27);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v34 = v32;
    }
    long long v35 = v34;
    [v22 addIcons:v34 prioritizedImageAppearances:v21 options:a7];
    [v23 addObjectsFromArray:v33];
    id v36 = v23;

    _Block_object_dispose(v53, 8);
    id v12 = v42;
    id v11 = v43;
    __int16 v15 = v40;
    id v14 = v41;
  }

  return v14;
}

void __122__SBHIconManager_addAllIconsToCacheRequestBuilder_iconImageStyleConfiguration_highestPriority_lowerPriority_cacheOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 32;
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    uint64_t v4 = 40;
  }
  id v5 = *(id *)(a1 + v4);
  uint64_t v6 = [a2 icons];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v11 isFolderIcon])
        {
          id v12 = [v11 folder];
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __122__SBHIconManager_addAllIconsToCacheRequestBuilder_iconImageStyleConfiguration_highestPriority_lowerPriority_cacheOptions___block_invoke_2;
          v17[3] = &unk_1E6AB3B70;
          id v18 = *(id *)(a1 + 32);
          id v19 = *(id *)(a1 + 40);
          id v13 = *(id *)(a1 + 48);
          uint64_t v14 = *(void *)(a1 + 72);
          id v20 = v13;
          uint64_t v21 = v14;
          [v12 enumerateListsUsingBlock:v17];
        }
        else
        {
          [*(id *)(a1 + 48) addIcon:v11 prioritizedImageAppearances:v5 options:*(void *)(a1 + 72)];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v16 = *(void *)(v15 + 24);
  if (v16) {
    *(void *)(v15 + 24) = v16 - 1;
  }
  [*(id *)(a1 + 56) addObjectsFromArray:v6];
}

void __122__SBHIconManager_addAllIconsToCacheRequestBuilder_iconImageStyleConfiguration_highestPriority_lowerPriority_cacheOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 icons];
  id v7 = (id)v5;
  uint64_t v6 = 40;
  if (!a3) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + 48) addIcons:v5 prioritizedImageAppearances:*(void *)(a1 + v6) options:*(void *)(a1 + 56)];
}

- (void)addAdditionalIconImageCacheForPrecaching:(id)a3
{
  id v4 = a3;
  additionalPrecachingIconImageCaches = self->_additionalPrecachingIconImageCaches;
  id v12 = v4;
  if (!additionalPrecachingIconImageCaches)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_additionalPrecachingIconImageCaches;
    self->_additionalPrecachingIconImageCaches = v6;

    id v4 = v12;
    additionalPrecachingIconImageCaches = self->_additionalPrecachingIconImageCaches;
  }
  [(NSMutableSet *)additionalPrecachingIconImageCaches addObject:v4];
  uint64_t v8 = [(SBHIconManager *)self iconsToRecacheForImageAppearanceChange];
  uint64_t v9 = [(SBHIconManager *)self prioritizedCachingImageAppearances];
  int v10 = [v9 allKeys];
  id v11 = (id)[v12 cacheImagesForIcons:v8 imageAppearances:v10 priority:0 reason:@"add additional icon image cache" options:0 completionHandler:0];
}

- (id)iconsToRecacheForImageAppearanceChange
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(SBHIconManager *)self rootFolder];
  uint64_t v5 = [(SBHIconManager *)self currentRootIconList];
  uint64_t v6 = [v5 model];

  if (v6)
  {
    id v7 = [v4 dock];
    uint64_t v8 = [v7 icons];
    [v3 addObjectsFromArray:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__SBHIconManager_iconsToRecacheForImageAppearanceChange__block_invoke;
    v15[3] = &unk_1E6AAF030;
    id v9 = v3;
    id v16 = v9;
    [v4 enumerateListsNearestToList:v6 usingBlock:v15];
    int v10 = [v4 ignoredList];
    id v11 = [v10 icons];
    [v9 addObjectsFromArray:v11];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__SBHIconManager_iconsToRecacheForImageAppearanceChange__block_invoke_2;
    v13[3] = &unk_1E6AAD1C0;
    id v14 = v3;
    [v4 enumerateAllIconsWithOptions:1 usingBlock:v13];
    id v7 = v14;
  }

  return v3;
}

void __56__SBHIconManager_iconsToRecacheForImageAppearanceChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 icons];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isFolderIcon])
        {
          id v9 = [v8 folder];
          int v10 = [v9 firstList];
          id v11 = [v10 icons];
          [*(id *)(a1 + 32) addObjectsFromArray:v11];
        }
        else
        {
          [*(id *)(a1 + 32) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

uint64_t __56__SBHIconManager_iconsToRecacheForImageAppearanceChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)visibleIconsToRecacheForImageAppearanceChange
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(SBHIconManager *)self rootFolder];
  uint64_t v5 = [v4 dock];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__SBHIconManager_visibleIconsToRecacheForImageAppearanceChange__block_invoke;
  v15[3] = &unk_1E6AB1F68;
  id v6 = v3;
  id v16 = v6;
  [v5 enumerateIconsUsingBlock:v15];
  id v7 = [(SBHIconManager *)self currentRootIconList];
  uint64_t v8 = [v7 model];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SBHIconManager_visibleIconsToRecacheForImageAppearanceChange__block_invoke_2;
  v13[3] = &unk_1E6AB1F68;
  id v9 = v6;
  id v14 = v9;
  [v8 enumerateIconsUsingBlock:v13];
  int v10 = v14;
  id v11 = v9;

  return v11;
}

uint64_t __63__SBHIconManager_visibleIconsToRecacheForImageAppearanceChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __63__SBHIconManager_visibleIconsToRecacheForImageAppearanceChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)recacheIconImageDataForRootIconsInBackgroundWithIconImageStyleConfiguration:(id)a3 cacheOptions:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v21 = [(SBHIconManager *)self iconImageCache];
  id v7 = [v21 buildCacheRequestWithReason:@"recacheIconImageDataForRootIconsInBackgroundWithImageAppearance"];
  uint64_t v8 = [(SBHIconManager *)self addAllIconsToCacheRequestBuilder:v7 iconImageStyleConfiguration:v6 highestPriority:4 lowerPriority:2 cacheOptions:a4];
  uint64_t v9 = [v8 count];
  int v10 = SBLogIcon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v9;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Starting background recaching of %lu icons with configuration %{public}@.", buf, 0x16u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __107__SBHIconManager_recacheIconImageDataForRootIconsInBackgroundWithIconImageStyleConfiguration_cacheOptions___block_invoke;
  v26[3] = &unk_1E6AAFFD8;
  uint64_t v29 = v9;
  id v11 = v6;
  id v27 = v11;
  id v28 = self;
  long long v12 = [v7 finalizeRequestWithCompletionHandler:v26];
  long long v13 = [(SBHIconManager *)self iconImageRecachingRequestCancellation];
  [v13 cancel];

  [(SBHIconManager *)self setIconImageRecachingRequestCancellation:v12];
  id v14 = [(SBHIconManager *)self prioritizedCachingImageAppearancesForIconImageStyleConfiguration:v11 priority:1];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v15 = self->_additionalPrecachingIconImageCaches;
  uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = (id)[*(id *)(*((void *)&v22 + 1) + 8 * v19++) cacheImagesForIcons:v8 prioritizedImageAppearances:v14 reason:@"recacheIconImageDataForRootIconsInBackgroundWithImageAppearance (additional cache)" options:0 completionHandler:0];
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
}

void __107__SBHIconManager_recacheIconImageDataForRootIconsInBackgroundWithIconImageStyleConfiguration_cacheOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 134218498;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = [v3 isFinished];
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Finished background recaching of %lu icons with configuration %{public}@. Success: %{BOOL}u", (uint8_t *)&v11, 0x1Cu);
  }

  id v7 = [*(id *)(a1 + 40) iconImageRecachingRequestCancellation];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v3 requestIdentifier];
  int v10 = BSEqualObjects();

  if (v10) {
    [*(id *)(a1 + 40) setIconImageRecachingRequestCancellation:0];
  }
}

- (void)recacheVisibleIconImageDataForRootIconsInBackgroundWithImageAppearance:(id)a3 cacheOptions:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBHIconManager *)self visibleIconsToRecacheForImageAppearanceChange];
  uint64_t v8 = [v7 count];
  uint64_t v9 = SBLogIcon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Starting background recaching of %lu visible icons with appearance %{public}@.", buf, 0x16u);
  }

  int v10 = [(SBHIconManager *)self iconImageCache];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__SBHIconManager_recacheVisibleIconImageDataForRootIconsInBackgroundWithImageAppearance_cacheOptions___block_invoke;
  v14[3] = &unk_1E6AAFFD8;
  int v16 = self;
  uint64_t v17 = v8;
  id v15 = v6;
  id v11 = v6;
  uint64_t v12 = [v10 cacheImagesForIcons:v7 imageAppearance:v11 priority:2 reason:@"recacheVisibleIconImageDataForRootIconsInBackgroundWithImageAppearance" options:a4 completionHandler:v14];
  __int16 v13 = [(SBHIconManager *)self visibleIconImageRecachingRequestCancellation];
  [v13 cancel];

  [(SBHIconManager *)self setVisibleIconImageRecachingRequestCancellation:v12];
}

void __102__SBHIconManager_recacheVisibleIconImageDataForRootIconsInBackgroundWithImageAppearance_cacheOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 134218498;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = [v3 isFinished];
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Finished background recaching of %lu visible icons with appearance %{public}@. Success: %{BOOL}u", (uint8_t *)&v11, 0x1Cu);
  }

  id v7 = [*(id *)(a1 + 40) visibleIconImageRecachingRequestCancellation];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v3 requestIdentifier];
  int v10 = BSEqualObjects();

  if (v10) {
    [*(id *)(a1 + 40) setVisibleIconImageRecachingRequestCancellation:0];
  }
}

- (void)purgeUnnecessaryAppearanceIconImageData
{
  id v7 = [(SBHIconManager *)self prioritizedCachingImageAppearances];
  id v3 = [v7 allKeys];
  uint64_t v4 = +[SBHIconImageAppearance tintableAppearance];
  uint64_t v5 = [v3 arrayByAddingObject:v4];

  uint64_t v6 = [(SBHIconManager *)self iconImageCache];
  [v6 purgeAllCachedImagesForAppearancesOtherThanAppearances:v5];
}

- (void)updateVisibleIconsToShowLeafIcons:(id)a3 hideLeafIcons:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHIconManager *)self iconModel];
  uint64_t v9 = [(SBHIconManager *)self rootFolder];
  if (!self->_previousIconLocationTracker)
  {
    int v10 = objc_alloc_init(SBIconPreviousLocationTracker);
    previousIconLocationTracker = self->_previousIconLocationTracker;
    self->_previousIconLocationTracker = v10;
  }
  if (!self->_previousIconLocations)
  {
    uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    previousIconLocations = self->_previousIconLocations;
    self->_previousIconLocations = v12;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        [(SBIconPreviousLocationTracker *)self->_previousIconLocationTracker captureLocationInfoForIcon:v19 inModel:v8];
        __int16 v20 = [v9 relativePathForIcon:v19 listGridCellInfoOptions:0];
        [(NSMapTable *)self->_previousIconLocations setObject:v20 forKey:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v16);
  }

  if ([v6 count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = v6;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          [(SBHIconManager *)self addNewIconToDesignatedLocation:*(void *)(*((void *)&v35 + 1) + 8 * j) options:0];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v23);
    }

    if (![v14 count]) {
      goto LABEL_31;
    }
    goto LABEL_23;
  }
  if ([v14 count])
  {
LABEL_23:
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v14;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(v9, "removeIcon:options:", *(void *)(*((void *)&v31 + 1) + 8 * k), 0x100000, (void)v31);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v28);
    }

LABEL_31:
    -[SBHIconManager layoutIconListsWithAnimationType:](self, "layoutIconListsWithAnimationType:", -1, (void)v31);
    [v8 saveIconStateIfNeeded];
  }
}

- (void)_clearStashedIconsForRelayout
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = [(SBHIconManager *)self iconModel];
  id v3 = [v17 leafIcons];
  uint64_t v4 = [v3 allObjects];

  uint64_t v16 = (void *)v4;
  uint64_t v5 = [(SBHIconManager *)self _stashedIconsWithRemovableDataSourcesForStashedIcons:self->_stashedLeafIconsForRelayout newIcons:v4];
  self->_shouldStashIconsForRelayout = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v5 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        int v11 = [v5 objectForKey:v10];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              [(SBHIconManager *)self _handleRemovedDataSource:*(void *)(*((void *)&v19 + 1) + 8 * v15++) ofIcon:v10];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_stashedLeafIconsForRelayout removeAllObjects];
}

- (id)_stashedIconsWithRemovableDataSourcesForStashedIcons:(id)a3 newIcons:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v44;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        uint64_t v7 = *(void **)(*((void *)&v43 + 1) + 8 * v6);
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v8 = [v7 iconDataSources];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v40;
          long long v33 = v8;
          long long v34 = v7;
          uint64_t v32 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0
                && [v13 iconSupportsConfiguration:v7])
              {
                long long v37 = 0u;
                long long v38 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v14 = v31;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v49 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v36;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v16; ++j)
                    {
                      if (*(void *)v36 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      long long v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                      long long v20 = [v13 uniqueIdentifier];
                      long long v21 = [v19 firstIconDataSourceWithUniqueIdentifier:v20];

                      if (v21)
                      {

                        goto LABEL_23;
                      }
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v49 count:16];
                    if (v16) {
                      continue;
                    }
                    break;
                  }
                }

                [v30 addObject:v13];
LABEL_23:
                uint64_t v8 = v33;
                uint64_t v7 = v34;
                uint64_t v11 = v32;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
          }
          while (v10);
        }

        if ([v30 count]) {
          [v26 setObject:v30 forKey:v7];
        }

        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v28);
  }

  long long v22 = SBLogWidgetIntent();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    long long v23 = [v26 allKeys];
    *(_DWORD *)buf = 138412290;
    id v48 = v23;
    _os_log_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEFAULT, "stashedIconsWithRemovableDataSources:%@", buf, 0xCu);
  }
  return v26;
}

- (void)resetRootIconLists
{
  [(SBHIconManager *)self _prepareToResetRootIconLists];
  [(SBHIconManager *)self _finishResetRootIconLists];
}

- (void)tearDownAndResetRootIconLists
{
  [(SBHIconManager *)self _prepareToResetRootIconLists];
  [(SBHIconManager *)self _finishResetRootIconListsReusingPreviousControllers:0];
}

- (void)_prepareToResetRootIconLists
{
  id v3 = SBLogIcon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "_prepareToResetRootIconLists", buf, 2u);
  }

  [(SBHIconManager *)self setResettingRootIconLists:1];
  uint64_t v4 = [(SBHIconManager *)self rootFolder];
  if (v4)
  {
    id v5 = [(SBHIconManager *)self _currentFolderController];
    uint64_t v6 = [v5 currentIconListView];
    uint64_t v7 = [v6 model];

    uint64_t v8 = [v4 indexPathForList:v7];
    uint64_t v9 = [v4 uniqueIdentifiersForIndexPath:v8];
    [(SBHIconManager *)self setPostResetPathIdentifiers:v9];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__SBHIconManager__prepareToResetRootIconLists__block_invoke;
    v13[3] = &unk_1E6AAD1C0;
    void v13[4] = self;
    [v4 enumerateAllIconsWithOptions:1 usingBlock:v13];
  }
  uint64_t v10 = [(NSMutableSet *)self->_touchedIconViews anyObject];
  uint64_t v11 = [v10 window];
  uint64_t v12 = [v11 _eventRoutingScene];

  if (v12) {
    [(id)*MEMORY[0x1E4FB2608] _cancelAllEventsOfType:0 onEventRoutingScene:v12];
  }
}

void __46__SBHIconManager__prepareToResetRootIconLists__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 352))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = objc_msgSend(v7, "iconDataSources", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [v13 iconSupportsConfiguration:v7])
          {
            if (!*(void *)(*(void *)(a1 + 32) + 360))
            {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v15 = *(void *)(a1 + 32);
              uint64_t v16 = *(void **)(v15 + 360);
              *(void *)(v15 + 360) = v14;
            }
            uint64_t v17 = SBLogWidgetIntent();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v7;
              _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Stashing leaf icon:%@ during relayout", buf, 0xCu);
            }

            [*(id *)(*(void *)(a1 + 32) + 360) addObject:v7];
            goto LABEL_22;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_finishResetRootIconLists
{
}

- (void)_finishResetRootIconListsReusingPreviousControllers:(BOOL)a3
{
  id v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "_finishResetRootIconLists", v18, 2u);
  }

  uint64_t v6 = [(SBHIconManager *)self delegate];
  id v7 = [(SBHIconManager *)self rootViewController];
  uint64_t v8 = [(SBHIconManager *)self rootFolderController];
  if (!a3)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 iconManager:self willDestroyRootFolderController:v8];
    }
    [(SBHIconManager *)self setRootFolderController:0];

    if (objc_opt_respondsToSelector()) {
      [v6 iconManager:self willDestroyRootViewController:v7];
    }
    [(SBHIconManager *)self setRootViewController:0];

    uint64_t v8 = 0;
    id v7 = 0;
  }
  uint64_t v9 = [(SBHIconModel *)self->_iconModel rootFolder];
  if (!v9)
  {
    [(SBHIconModel *)self->_iconModel layout];
    uint64_t v9 = [(SBHIconModel *)self->_iconModel rootFolder];
  }
  [(SBHIconManager *)self setRootFolder:v9];
  [(SBHIconManager *)self ensureFixedIconLocationsIfNecessary];
  if (v7)
  {
    uint64_t v10 = [(SBHIconManager *)self _rootFolderForRootViewControllerForRootFolder:v9];
    [v7 setFolder:v10];
    uint64_t v11 = [(SBHIconManager *)self iconImageCache];
    [v7 setIconImageCache:v11];

    uint64_t v12 = [(SBHIconManager *)self folderIconImageCache];
    [v7 setFolderIconImageCache:v12];

    int64_t v13 = [(SBHIconManager *)self interfaceOrientation];
    [v8 setOrientation:v13];
    id v14 = [v8 folderView];
    [v14 setOrientation:v13];

    uint64_t v15 = [(SBHIconManager *)self postResetPathIdentifiers];
    if (v15)
    {
      [v8 restoreExpandedPathIdentifiers:v15];
      [(SBHIconManager *)self setPostResetPathIdentifiers:0];
    }
  }
  else
  {
    uint64_t v10 = [(SBHIconManager *)self _createAppropriateRootViewControllerForRootFolder:v9];
    [(SBHIconManager *)self setRootViewController:v10];
    uint64_t v16 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(SBHIconManager *)self setRootFolderController:v10];
    }
    objc_msgSend(v10, "setEditing:animated:", -[SBHIconManager isEditing](self, "isEditing"), 0);
    if (objc_opt_respondsToSelector()) {
      [v6 iconManager:self didCreateRootViewController:v10];
    }
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"SBHIconManagerRootViewControllerDidChange" object:self];
  }

  [(SBHIconManager *)self setResettingRootIconLists:0];
}

- (id)_rootFolderForRootViewControllerForRootFolder:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)_createAppropriateRootViewControllerForRootFolder:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self homeScreenSettings];
  if ([v5 usesMinimumViableHomeScreen])
  {
    int v6 = MGGetBoolAnswer();

    if (v6)
    {
      uint64_t v7 = [(SBHIconManager *)self _createRootTableControllerForRootFolder:v4];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v7 = [(SBHIconManager *)self _createRootFolderControllerForRootFolder:v4];
LABEL_6:
  uint64_t v8 = (void *)v7;

  return v8;
}

- (void)_configureRootFolderConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self listLayoutProvider];
  [v4 setListLayoutProvider:v5];

  objc_msgSend(v4, "setOrientation:", -[SBHIconManager interfaceOrientation](self, "interfaceOrientation"));
  objc_msgSend(v4, "setAllowedOrientations:", -[SBHIconManager possibleInterfaceOrientations](self, "possibleInterfaceOrientations"));
  [v4 setIconViewProvider:self];
  int v6 = [(SBHIconManager *)self folderIconImageCache];
  [v4 setFolderIconImageCache:v6];

  uint64_t v7 = [(SBHIconManager *)self iconImageCache];
  [v4 setIconImageCache:v7];

  uint64_t v8 = [(SBHIconManager *)self legibilitySettings];
  [v4 setLegibilitySettings:v8];

  [v4 setDelegate:self];
  [v4 setFolderDelegate:self];
  objc_msgSend(v4, "setShowsDoneButtonWhileEditing:", -[SBHIconManager showsDoneButtonWhileEditing](self, "showsDoneButtonWhileEditing"));
  if ([(SBHIconManager *)self isFloatingDockSupported])
  {
    uint64_t v9 = objc_alloc_init(SBHLibraryOverscrollViewController);
    [v4 setTrailingCustomViewController:v9];

    [v4 setDockExternal:1];
    uint64_t v10 = SBLogIcon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_INFO, "making external dock since floating dock is supported", v11, 2u);
    }
  }
}

- (id)_createRootFolderControllerForRootFolder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self controllerClassForFolderClass:objc_opt_class()];
  int v6 = objc_alloc_init(SBRootFolderControllerConfiguration);
  [(SBFolderControllerConfiguration *)v6 setFolder:v4];
  [(SBHIconManager *)self _configureRootFolderConfiguration:v6];
  uint64_t v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v26 = v5;
    [v7 iconManager:self willUseRootFolderControllerConfiguration:v6];
    uint64_t v8 = [(SBHIconManager *)self legibilitySettings];
    uint64_t v9 = [(SBRootFolderControllerConfiguration *)v6 leadingCustomViewControllers];
    if (v9)
    {
      [(SBHIconManager *)self setLeadingCustomViewControllers:v9];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * i) setLegibilitySettings:v8];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v12);
      }
    }
    uint64_t v15 = [(SBRootFolderControllerConfiguration *)v6 trailingCustomViewControllers];
    if (v15)
    {
      id v25 = v4;
      [(SBHIconManager *)self setTrailingCustomViewControllers:v15];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * j) setLegibilitySettings:v8];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v18);
      }

      id v4 = v25;
    }

    id v5 = v26;
  }
  long long v21 = (void *)[[v5 alloc] initWithConfiguration:v6];
  [v21 setOpen:1];
  [v21 addPageStateObserver:self];
  objc_msgSend(v21, "setContentVisibility:", -[SBHIconManager effectiveRootFolderControllerContentVisibility](self, "effectiveRootFolderControllerContentVisibility"));
  [(SBHIconManager *)self setRootFolderController:v21];
  long long v22 = [(SBHIconManager *)self postResetPathIdentifiers];
  if (v22)
  {
    if (([v21 restoreExpandedPathIdentifiers:v22] & 1) == 0)
    {
      id v23 = SBLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v36 = v22;
        _os_log_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_INFO, "_resetRootIconLists: restoreExpandedPathIdentifiers: failed with path '%@'.", buf, 0xCu);
      }
    }
    [(SBHIconManager *)self setPostResetPathIdentifiers:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self didCreateRootFolderController:v21];
  }

  return v21;
}

- (id)_createRootTableControllerForRootFolder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SBHIconRootTableViewController);
  int v6 = [(SBHIconManager *)self legibilitySettings];
  [(SBHIconRootTableViewController *)v5 setLegibilitySettings:v6];

  uint64_t v7 = [(SBHIconManager *)self folderIconImageCache];
  [(SBHIconRootTableViewController *)v5 setFolderIconImageCache:v7];

  uint64_t v8 = [(SBHIconManager *)self iconImageCache];
  [(SBHIconRootTableViewController *)v5 setIconImageCache:v8];

  [(SBHIconRootTableViewController *)v5 setFolder:v4];
  return v5;
}

- (void)_ensureRootFolderController
{
  id v3 = [(SBHIconManager *)self rootFolderController];

  if (!v3)
  {
    [(SBHIconManager *)self _finishResetRootIconLists];
  }
}

- (void)setRootViewController:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = (SBHIconRootViewProviding *)a3;
  if (self->_rootViewController != v5)
  {
    int v6 = [(SBHIconManager *)self rootViewControllerUserInterfaceStyleObservation];
    if (v6) {
      [(SBHIconRootViewProviding *)self->_rootViewController unregisterForTraitChanges:v6];
    }
    objc_storeStrong((id *)&self->_rootViewController, a3);
    objc_initWeak(&location, self);
    uint64_t v7 = self;
    v14[0] = v7;
    uint64_t v8 = self;
    v14[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__SBHIconManager_setRootViewController___block_invoke;
    v11[3] = &unk_1E6AB38F0;
    objc_copyWeak(&v12, &location);
    id v10 = [(SBHIconRootViewProviding *)v5 registerForTraitChanges:v9 withHandler:v11];

    [(SBHIconManager *)self setRootViewControllerUserInterfaceStyleObservation:v10];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __40__SBHIconManager_setRootViewController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 traitCollection];

  int v6 = objc_msgSend(v5, "sbh_iconImageStyleConfiguration");
  [WeakRetained recacheIconImageDataForRootIconsInBackgroundWithIconImageStyleConfiguration:v6 cacheOptions:1];
  if ([WeakRetained shouldClearStylePreviewManagerAfterRootTraitChange])
  {
    [WeakRetained setShouldClearStylePreviewManagerAfterRootTraitChange:0];
    uint64_t v7 = [WeakRetained stylePreviewManager];
    uint64_t v8 = (void *)*MEMORY[0x1E4FB2608];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__SBHIconManager_setRootViewController___block_invoke_2;
    void v14[3] = &unk_1E6AACA90;
    id v15 = v7;
    id v16 = WeakRetained;
    id v9 = v7;
    [v8 _performBlockAfterCATransactionCommits:v14];
  }
  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBHIconManager_setRootViewController___block_invoke_3;
  block[3] = &unk_1E6AAC810;
  id v13 = WeakRetained;
  id v11 = WeakRetained;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

void __40__SBHIconManager_setRootViewController___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) stylePreviewManager];

  if (v2 == v3)
  {
    [*(id *)(a1 + 32) invalidate];
    id v4 = *(void **)(a1 + 40);
    [v4 setStylePreviewManager:0];
  }
}

uint64_t __40__SBHIconManager_setRootViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeUnnecessaryAppearanceIconImageData];
}

- (void)setLeadingCustomViewControllers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    id v5 = (NSArray *)[v4 copy];
    leadingCustomViewControllers = self->_leadingCustomViewControllers;
    self->_leadingCustomViewControllers = v5;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          id v13 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            -[SBHIconManager configureLibraryViewController:](self, "configureLibraryViewController:", v12, (void)v15);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)setTrailingCustomViewControllers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    id v5 = (NSArray *)[v4 copy];
    trailingCustomViewControllers = self->_trailingCustomViewControllers;
    self->_trailingCustomViewControllers = v5;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          id v13 = self;
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            -[SBHIconManager configureLibraryViewController:](self, "configureLibraryViewController:", v12, (void)v15);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)configureLibraryViewController:(id)a3
{
}

- (void)_ensureWidgetIsVisibleForDebuggingWithDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SBHIconManager *)self iconModel];
  uint64_t v8 = [v6 extensionBundleIdentifier];
  uint64_t v9 = [v6 kind];
  uint64_t v10 = [v7 widgetIconsContainingWidgetsMatchingExtensionBundleIdentifier:v8 kind:v9 sizeClass:a4];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SBHIconManager__ensureWidgetIsVisibleForDebuggingWithDescriptor_sizeClass___block_invoke;
  v13[3] = &unk_1E6AAEDA8;
  id v14 = v10;
  id v15 = v6;
  long long v16 = self;
  int64_t v17 = a4;
  id v11 = v6;
  id v12 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __77__SBHIconManager__ensureWidgetIsVisibleForDebuggingWithDescriptor_sizeClass___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = SBLogWidgets();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      id v7 = [*(id *)(a1 + 40) extensionBundleIdentifier];
      uint64_t v8 = [*(id *)(a1 + 40) kind];
      *(_DWORD *)buf = 138412546;
      long long v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Installing new widget for debugging: %@ %@", buf, 0x16u);
    }
    id v3 = [*(id *)(a1 + 48) rootFolderController];
    id v2 = [v3 widgetIconForDescriptor:*(void *)(a1 + 40) sizeClass:*(void *)(a1 + 56)];
    uint64_t v9 = [v3 folder];
    int v10 = [v9 canAddIcon:v2];

    id v11 = [v3 folder];
    id v5 = v11;
    if (v10)
    {
      id v12 = (id)[v11 addIcon:v2];
LABEL_10:

      goto LABEL_11;
    }
    id v6 = [v11 todayList];
    id v13 = (id)[v6 insertIcon:v2 atIndex:0];
LABEL_9:

    goto LABEL_10;
  }
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) extensionBundleIdentifier];
    id v6 = [*(id *)(a1 + 40) kind];
    *(_DWORD *)buf = 138412546;
    long long v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Found existing widgetIcon for debugging: %@ %@", buf, 0x16u);
    goto LABEL_9;
  }
LABEL_11:

  [*(id *)(a1 + 48) scrollToIconListContainingIcon:v2 animate:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__SBHIconManager__ensureWidgetIsVisibleForDebuggingWithDescriptor_sizeClass___block_invoke_194;
  v18[3] = &unk_1E6AB3BC8;
  id v19 = *(id *)(a1 + 40);
  id v14 = [v2 firstWidgetPassingTest:v18];
  if (v14)
  {
    id v15 = [v2 activeWidget];
    char v16 = [v15 isEqual:v14];

    if ((v16 & 1) == 0)
    {
      int64_t v17 = SBLogWidgets();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v14;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Setting active targetWidget: %@", buf, 0xCu);
      }

      [v2 setActiveWidget:v14];
    }
  }
}

uint64_t __77__SBHIconManager__ensureWidgetIsVisibleForDebuggingWithDescriptor_sizeClass___block_invoke_194(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 extensionBundleIdentifier];
  id v5 = [*(id *)(a1 + 32) extensionBundleIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [v3 kind];
    id v7 = [*(id *)(a1 + 32) kind];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    if ([(SBHIconManager *)self hasRootViewController]) {
      BOOL v8 = [(SBHIconManager *)self isResettingRootIconLists];
    }
    else {
      BOOL v8 = 1;
    }
    BOOL v9 = SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self->_listLayoutProvider, v7, @"SBIconLocationRoot", 1);
    if (!v8 && !v9) {
      [(SBHIconManager *)self _prepareToResetRootIconLists];
    }
    int v10 = [(SBIconListLayoutProvider *)v7 layoutForIconLocation:@"SBIconLocationRoot"];
    [v10 iconImageInfo];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    id v19 = [(SBHIconManager *)self iconImageCache];
    [v19 iconImageInfo];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    if (!SBIconImageInfoEqualToIconImageInfo(v12, v14, v16, v18, v21, v23, v25, v27))
    {
      [(SBHIconManager *)self resetAllIconImageCaches];
      folderIconImageCache = self->_folderIconImageCache;
      self->_folderIconImageCache = 0;
    }
    labelImageCache = self->_labelImageCache;
    self->_labelImageCache = 0;

    long long v30 = [(SBHIconManager *)self addWidgetSheetConfigurationManager];
    [v30 setListLayoutProvider:v7];

    long long v31 = self->_listLayoutProvider;
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    if (v8 || v9)
    {
      if (!v8 && v9)
      {
        long long v32 = [(SBHIconManager *)self usageMonitor];
        [v32 noteIconManagerListLayoutProviderChanged];

        long long v33 = [(SBHIconManager *)self rootFolderController];
        [v33 setListLayoutProvider:v7 animated:v4];
        long long v34 = [(SBHIconManager *)self iconImageCache];
        [v33 setIconImageCache:v34];

        long long v35 = [(SBHIconManager *)self folderIconImageCache];
        [v33 setFolderIconImageCache:v35];

        long long v36 = [(SBHIconManager *)self todayViewControllers];
        uint64_t v41 = MEMORY[0x1E4F143A8];
        uint64_t v42 = 3221225472;
        long long v43 = __49__SBHIconManager_setListLayoutProvider_animated___block_invoke;
        long long v44 = &unk_1E6AB3BF0;
        long long v37 = v7;
        long long v45 = v37;
        BOOL v46 = v4;
        [v36 enumerateObjectsUsingBlock:&v41];

        long long v38 = [(SBHIconManager *)self floatingDockViewController];
        [v38 setListLayoutProvider:v37 animated:v4];

        [(SBHIconManager *)self updateAppPredictionViewControllersWithListLayoutProvider:self->_listLayoutProvider oldListLayoutProvider:v31 animated:v4];
      }
    }
    else
    {
      [(SBHIconManager *)self _finishResetRootIconListsReusingPreviousControllers:0];
    }
    uint64_t v39 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v39 iconManagerListLayoutProviderDidChange:self];
    }
    long long v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 postNotificationName:@"SBHIconManagerListLayoutProviderDidChange" object:self];
  }
}

uint64_t __49__SBHIconManager_setListLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setListLayoutProvider:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setListLayoutProviderLayoutOptions:(unint64_t)a3
{
}

- (void)setListLayoutProviderLayoutOptions:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_listLayoutProviderLayoutOptions != a3)
  {
    BOOL v4 = a4;
    self->_listLayoutProviderLayoutOptions = a3;
    id v7 = [[SBHDefaultIconListLayoutProvider alloc] initWithLayoutOptions:a3];
    [(SBHIconManager *)self setListLayoutProvider:v7 animated:v4];
    id v6 = [(SBHIconManager *)self floatingDockViewController];
    [(SBHIconManager *)self _updateMaximumEditingIconSizeForFloatingDockViewController:v6];
  }
}

- (id)widgetMetricsProvider:(id)a3 listLayoutProviderForScreenType:(unint64_t)a4
{
  id v6 = [(SBHIconManager *)self widgetMetricsDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 iconManager:self widgetMetricsListLayoutProviderForScreenType:a4];
  }
  else
  {
    id v7 = [[SBHDefaultIconListLayoutProvider alloc] initWithScreenType:a4];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)setLegibilitySettings:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBHIconManager *)self _precacheLabelsForRootIcons];
    id v6 = [(SBHIconManager *)self rootViewController];
    [v6 setLegibilitySettings:v5];

    id v7 = [(SBHIconManager *)self floatingDockViewController];
    [v7 setLegibilitySettings:v5];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    BOOL v8 = [(SBHIconManager *)self leadingCustomViewControllers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v12++) setLegibilitySettings:v5];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v10);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v13 = [(SBHIconManager *)self trailingCustomViewControllers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v17++) setLegibilitySettings:v5];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v15);
    }

    double v18 = [(SBHIconManager *)self overlayTodayViewController];
    [v18 setLegibilitySettings:v5];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = [(SBHIconManager *)self _libraryViewControllers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v23++) setLegibilitySettings:v5];
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v21);
    }
  }
}

- (void)setFloatingDockViewController:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = (SBFloatingDockViewController *)a3;
  if (self->_floatingDockViewController != v5)
  {
    id v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      BOOL v8 = v5;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "setting floating dock view controller to %{public}@", (uint8_t *)&v7, 0xCu);
    }

    if ([(SBHIconManager *)self hasRootViewController])
    {
      [(SBHIconManager *)self _prepareToResetRootIconLists];
      objc_storeStrong((id *)&self->_floatingDockViewController, a3);
      [(SBHIconManager *)self configureFloatingDockViewController:v5];
      [(SBHIconManager *)self _finishResetRootIconLists];
    }
    else
    {
      objc_storeStrong((id *)&self->_floatingDockViewController, a3);
      [(SBHIconManager *)self configureFloatingDockViewController:v5];
    }
  }
}

- (void)configureFloatingDockViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self legibilitySettings];
  [v4 setLegibilitySettings:v5];
  [(SBHIconManager *)self _updateMaximumEditingIconSizeForFloatingDockViewController:v4];
}

- (void)_updateMaximumEditingIconSizeForFloatingDockViewController:(id)a3
{
  id v11 = a3;
  id v4 = [(SBHIconManager *)self listLayoutProvider];
  id v5 = [v4 layoutForIconLocation:@"SBIconLocationFloatingDock"];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 floatingDockVisualConfiguration];
    [v6 maximumEditingIconSize];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  objc_msgSend(v11, "setMaximumEditingIconSize:", v8, v10);
}

- (void)setOverlayTodayViewController:(id)a3
{
  id v5 = (SBHTodayViewControlling *)a3;
  overlayTodayViewController = self->_overlayTodayViewController;
  if (overlayTodayViewController != v5)
  {
    double v10 = v5;
    [(SBHTodayViewControlling *)overlayTodayViewController removeObserver:self];
    objc_storeStrong((id *)&self->_overlayTodayViewController, a3);
    double v7 = self->_overlayTodayViewController;
    double v8 = [(SBHIconManager *)self legibilitySettings];
    [(SBHTodayViewControlling *)v7 setLegibilitySettings:v8];

    BOOL v9 = [(SBHIconManager *)self isUsageMonitoringEnabled];
    id v5 = v10;
    if (v9)
    {
      [(SBHTodayViewControlling *)self->_overlayTodayViewController addObserver:self];
      id v5 = v10;
    }
  }
}

- (void)setOverlayCoverSheetTodayViewController:(id)a3
{
  id v5 = (SBHTodayViewControlling *)a3;
  overlayCoverSheetTodayViewController = self->_overlayCoverSheetTodayViewController;
  if (overlayCoverSheetTodayViewController != v5)
  {
    double v8 = v5;
    [(SBHTodayViewControlling *)overlayCoverSheetTodayViewController removeObserver:self];
    objc_storeStrong((id *)&self->_overlayCoverSheetTodayViewController, a3);
    BOOL v7 = [(SBHIconManager *)self isUsageMonitoringEnabled];
    id v5 = v8;
    if (v7)
    {
      [(SBHTodayViewControlling *)self->_overlayCoverSheetTodayViewController addObserver:self];
      id v5 = v8;
    }
  }
}

- (id)todayViewControllers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(SBHIconManager *)self overlayTodayViewController];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(SBHIconManager *)self overlayCoverSheetTodayViewController];
  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(SBHIconManager *)self leadingTodayViewController];
  if (v6) {
    [v3 addObject:v6];
  }

  return v3;
}

- (void)setOverlayLibraryViewController:(id)a3
{
  BOOL v7 = (SBHLibraryViewController *)a3;
  if (self->_overlayLibraryViewController != v7)
  {
    objc_storeStrong((id *)&self->_overlayLibraryViewController, a3);
    overlayLibraryViewController = self->_overlayLibraryViewController;
    id v6 = [(SBHIconManager *)self legibilitySettings];
    [(SBHLibraryViewController *)overlayLibraryViewController setLegibilitySettings:v6];

    [(SBHIconManager *)self configureLibraryViewController:v7];
  }
}

- (BOOL)isOverlayTodayOrLibraryViewVisible
{
  if ([(SBHIconManager *)self isOverlayTodayViewVisible]) {
    return 1;
  }
  return [(SBHIconManager *)self isMainDisplayLibraryViewVisible];
}

- (BOOL)isFloatingDockSupported
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isFloatingDockSupportedForIconManager:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setOverlayCoverSheetTodayViewVisible:(BOOL)a3
{
  if (self->_overlayCoverSheetTodayViewVisible != a3)
  {
    BOOL v3 = a3;
    self->_overlayCoverSheetTodayViewVisible = a3;
    id v5 = [(SBHIconManager *)self usageMonitor];
    id v7 = v5;
    if (v3)
    {
      [v5 noteIconManagerCoverSheetTodayViewDidAppear];
      id v6 = [(SBHIconManager *)self overlayCoverSheetTodayViewController];
      [(SBHIconManager *)self informUsageMonitorOfVisibleIconRectsForTodayViewController:v6];
    }
    else
    {
      [v5 noteIconManagerCoverSheetTodayViewDidDisappear];
    }
  }
}

- (void)setOverlayTodayViewVisible:(BOOL)a3
{
  if (self->_overlayTodayViewVisible != a3)
  {
    self->_overlayTodayViewVisible = a3;
    [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
    id v4 = [(SBHIconManager *)self overlayTodayViewController];
    [(SBHIconManager *)self informUsageMonitorOfTodayViewVisibilityChange:v4];
  }
}

- (void)setOverlayTodayViewVisibilityTransitioning:(BOOL)a3
{
  if (self->_overlayTodayViewVisibilityTransitioning != a3)
  {
    self->_overlayTodayViewVisibilityTransitioning = a3;
    [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
  }
}

- (void)setOverlayTodayViewVisible:(BOOL)a3 todayViewTransitioning:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  int overlayTodayViewVisible = self->_overlayTodayViewVisible;
  if (a4)
  {
    if (self->_overlayTodayViewVisibilityTransitioning) {
      goto LABEL_10;
    }
    BOOL overlayTodayViewIsDismissingFromFullyPresented = self->_overlayTodayViewVisible;
    goto LABEL_9;
  }
  if (!self->_overlayTodayViewVisibilityTransitioning) {
    goto LABEL_10;
  }
  if (a3) {
    goto LABEL_8;
  }
  BOOL overlayTodayViewIsDismissingFromFullyPresented = self->_overlayTodayViewIsDismissingFromFullyPresented;
  if (overlayTodayViewIsDismissingFromFullyPresented)
  {
    BOOL v9 = [(SBHIconManager *)self rootFolderController];
    double v10 = [v9 rootFolderView];
    [v10 _flashPageDotsForReason:@"today-view-dismiss"];

LABEL_8:
    BOOL overlayTodayViewIsDismissingFromFullyPresented = 0;
  }
LABEL_9:
  self->_BOOL overlayTodayViewIsDismissingFromFullyPresented = overlayTodayViewIsDismissingFromFullyPresented;
LABEL_10:
  if (overlayTodayViewVisible == v5)
  {
    if (self->_overlayTodayViewVisibilityTransitioning != v4)
    {
      self->_int overlayTodayViewVisible = v5;
      self->_overlayTodayViewVisibilityTransitioning = v4;
      [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
    }
  }
  else
  {
    self->_int overlayTodayViewVisible = v5;
    self->_overlayTodayViewVisibilityTransitioning = v4;
    [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
    id v11 = [(SBHIconManager *)self overlayTodayViewController];
    [(SBHIconManager *)self informUsageMonitorOfTodayViewVisibilityChange:v11];
  }
}

- (void)informUsageMonitorOfTodayViewVisibilityChange:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(SBHIconManager *)self usageMonitor];
  if ([(SBHIconManager *)self isTodayViewEffectivelyVisible])
  {
    [v4 noteIconManagerOverlayTodayViewDidAppear];
    [(SBHIconManager *)self informUsageMonitorOfVisibleIconRectsForTodayViewController:v5];
  }
  else
  {
    [v4 noteIconManagerOverlayTodayViewDidDisappear];
  }
}

- (void)informUsageMonitorOfVisibleIconRectsForTodayViewController:(id)a3
{
  id v4 = a3;
  if ([(SBHIconManager *)self isUsageMonitoringEnabled])
  {
    id v5 = [v4 scrollView];
    [v5 visibleBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__SBHIconManager_informUsageMonitorOfVisibleIconRectsForTodayViewController___block_invoke;
    v19[3] = &__block_descriptor_64_e24_v16__0__SBIconListView_8l;
    *(double *)&v19[4] = v6;
    *(double *)&void v19[5] = v8;
    *(double *)&v19[6] = v10;
    *(double *)&v19[7] = v12;
    uint64_t v14 = (void (**)(void *, void *))_Block_copy(v19);
    uint64_t v15 = [v4 listView];
    uint64_t v16 = objc_msgSend(v15, "iconVisibilityInfoForRect:normalized:", 1, v7, v9, v11, v13);
    v14[2](v14, v15);
    uint64_t v17 = [v16 visibleIconRects];
    double v18 = [(SBHIconManager *)self usageMonitor];
    [(SBHIconManager *)self overlayCoverSheetTodayViewController];

    [v18 noteIconManagerTodayViewAtLocation:1 didScrollToRevealIcons:v17];
  }
}

void __77__SBHIconManager_informUsageMonitorOfVisibleIconRectsForTodayViewController___block_invoke(double *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "iconVisibilityInfoForRect:normalized:", 0, a1[4], a1[5], a1[6], a1[7]);
  [v3 icons];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v22 = *(void *)v34;
    id v23 = v3;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * v8);
        double v10 = [v3 displayedIconViewForIcon:v9];
        double v11 = [v10 customIconImageViewController];
        if (objc_msgSend(v11, "sbh_isWidgetStackViewController"))
        {
          long long v27 = v10;
          uint64_t v28 = v8;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v26 = v11;
          double v12 = [v11 widgetViewControllers];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v30 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                if (objc_msgSend(v17, "sbh_isMultiplexingViewController"))
                {
                  id v18 = [v17 multiplexedViewController];
                }
                else
                {
                  id v18 = v17;
                }
                id v19 = v18;
                uint64_t v20 = self;
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  [v4 visibleRectForIcon:v9];
                  objc_msgSend(v19, "setVisibleBounds:");
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v14);
          }

          uint64_t v7 = v22;
          id v3 = v23;
          uint64_t v6 = v24;
          double v10 = v27;
          uint64_t v8 = v28;
          double v11 = v26;
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }
}

- (void)setMainDisplayLibraryViewVisible:(BOOL)a3
{
  if (self->_mainDisplayLibraryViewVisible != a3)
  {
    self->_mainDisplayLibraryViewVisible = a3;
    [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
  }
}

- (void)setMainDisplayLibraryViewVisibilityTransitioning:(BOOL)a3
{
  if (self->_mainDisplayLibraryViewVisibilityTransitioning != a3)
  {
    self->_mainDisplayLibraryViewVisibilityTransitioning = a3;
    [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
  }
}

- (void)setMainDisplayLibraryViewVisible:(BOOL)a3 libraryViewTransitioning:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a4)
  {
    if (!self->_mainDisplayLibraryViewVisibilityTransitioning)
    {
      BOOL mainDisplayLibraryViewVisible = self->_mainDisplayLibraryViewVisible;
LABEL_9:
      self->_mainDisplayLibraryViewIsDismissingFromFullyPresented = mainDisplayLibraryViewVisible;
    }
  }
  else if (self->_mainDisplayLibraryViewVisibilityTransitioning)
  {
    if (!a3)
    {
      BOOL mainDisplayLibraryViewVisible = self->_mainDisplayLibraryViewIsDismissingFromFullyPresented;
      if (!mainDisplayLibraryViewVisible) {
        goto LABEL_9;
      }
      uint64_t v8 = [(SBHIconManager *)self rootFolderController];
      uint64_t v9 = [v8 rootFolderView];
      [v9 _flashPageDotsForReason:@"library-dismiss"];
    }
    BOOL mainDisplayLibraryViewVisible = 0;
    goto LABEL_9;
  }
  if (self->_mainDisplayLibraryViewVisible != v5 || self->_mainDisplayLibraryViewVisibilityTransitioning != v4)
  {
    self->_BOOL mainDisplayLibraryViewVisible = v5;
    self->_mainDisplayLibraryViewVisibilityTransitioning = v4;
    [(SBHIconManager *)self _updateOverlayOcclusionForRootFolderController];
  }
}

- (void)_updateOverlayOcclusionForRootFolderController
{
  BOOL v4 = self->_overlayTodayViewVisible || self->_mainDisplayLibraryViewVisible;
  unint64_t v5 = [(SBHIconManager *)self effectiveRootFolderControllerContentVisibility];
  [(SBRootFolderController *)self->_rootFolderController setOccludedByOverlay:v4];
  [(SBFolderController *)self->_rootFolderController setContentVisibility:v5];
  rootFolderController = self->_rootFolderController;
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(SBRootFolderController *)rootFolderController setParallaxDisabled:v4 forReason:v7];
}

- (void)presentTodayOverlay
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 presentTodayOverlayForIconManager:self];
  }
}

- (int64_t)listsFixedIconLocationBehavior
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 iconManagerListsFixedIconLocationBehavior:self];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)ensureFixedIconLocationsIfNecessary
{
  if ([(SBHIconManager *)self listsFixedIconLocationBehavior])
  {
    id v3 = [(SBHIconManager *)self rootFolder];
    [v3 enumerateListsWithOptions:4 usingBlock:&__block_literal_global_64];
  }
}

uint64_t __53__SBHIconManager_ensureFixedIconLocationsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 saveOnlyRequiredIconLocationsAsFixed];
}

- (void)setEditing:(BOOL)a3 withFeedbackBehavior:(id)a4
{
}

void __59__SBHIconManager_setEditing_withFeedbackBehavior_location___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFolderIcon])
  {
    id v2 = [v3 folder];
    [v2 setCancelable:0];
  }
}

- (void)editingDidChange
{
}

- (void)editingDidChangeWithFeedbackBehavior:(id)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v15 = a3;
  BOOL v7 = [(SBHIconManager *)self isEditing];
  uint64_t v8 = [(SBHIconManager *)self iconModel];
  if (v7)
  {
    objc_msgSend(v15, "impactOccurredWithIntensity:atLocation:", 1.0, x, y);
    [(SBHIconManager *)self _restartEditingEndTimer];
    [(SBHIconManager *)self displayEnterEditingModeFeatureIntroductions];
  }
  else
  {
    uint64_t v9 = [(SBHIconManager *)self editingAutosaveDisableAssertion];
    [v9 invalidate];

    [(SBHIconManager *)self setEditingAutosaveDisableAssertion:0];
    [v8 saveIconStateIfNeeded];
    [v8 clearDesiredIconState];
    double v10 = [(SBHIconManager *)self editingEndTimer];
    [v10 invalidate];

    [(SBHIconManager *)self setEditingEndTimer:0];
  }
  double v11 = [(SBHIconManager *)self searchGesture];
  [v11 setDisabled:v7 forReason:@"SBHIconManager Editing"];

  double v12 = [(SBHIconManager *)self iconDragManager];
  [v12 noteIconManagerEditingDidChange];

  uint64_t v13 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 iconManagerEditingDidChange:self];
  }
  uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"SBHIconManagerEditingStateChanged" object:self];

  if (!v7) {
    [(SBHIconManager *)self enumerateKnownIconViewsUsingBlock:&__block_literal_global_233];
  }
}

uint64_t __64__SBHIconManager_editingDidChangeWithFeedbackBehavior_location___block_invoke(uint64_t a1, void *a2)
{
  return [a2 purgeCachedEditingViewData];
}

- (void)setEditing:(BOOL)a3 fromIconListView:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(SBHIconManager *)self isEditingAllowed])
  {
    [(SBHIconManager *)self setEditing:v4];
  }
  else if ([(SBHIconManager *)self isEditingAllowedForIconListView:v7])
  {
    uint64_t v6 = [v7 iconLocation];
    [(SBHIconManager *)self setEditing:v4 forIconLocation:v6];
  }
}

- (void)setEditing:(BOOL)a3 fromIconView:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (-[SBHIconManager isEditingAllowedForIconView:](self, "isEditingAllowedForIconView:"))
  {
    if ([(SBHIconManager *)self isEditingAllowed])
    {
      [(SBHIconManager *)self setEditing:v4];
    }
    else
    {
      uint64_t v6 = [v7 location];
      [(SBHIconManager *)self setEditing:v4 forIconLocation:v6];
    }
  }
}

- (void)setEditing:(BOOL)a3 forIconLocation:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  partialEditingIconLocations = self->_partialEditingIconLocations;
  if (v4)
  {
    if (!partialEditingIconLocations)
    {
      uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v9 = self->_partialEditingIconLocations;
      self->_partialEditingIconLocations = v8;

      partialEditingIconLocations = self->_partialEditingIconLocations;
    }
    [(NSMutableSet *)partialEditingIconLocations addObject:v6];
  }
  else
  {
    [(NSMutableSet *)partialEditingIconLocations removeObject:v6];
  }
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v6))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v10 = [(SBHIconManager *)self leadingCustomViewControllers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v14++) setEditing:v4];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    id v15 = [(SBHIconManager *)self overlayTodayViewController];
    [v15 setEditing:v4];

    goto LABEL_16;
  }
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupFloatingDock", v6)) {
LABEL_16:
  }
    [(SBHIconManager *)self editingDidChange];
}

- (BOOL)isEditingForIconLocation:(id)a3
{
  id v4 = a3;
  if ([(SBHIconManager *)self isEditing]) {
    char v5 = 1;
  }
  else {
    char v5 = [(NSMutableSet *)self->_partialEditingIconLocations containsObject:v4];
  }

  return v5;
}

- (BOOL)isEditingAllowed
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isEditingAllowedForIconManager:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isEditingAllowedForIconLocation:(id)a3
{
  id v4 = a3;
  if ([(SBHIconManager *)self isEditingAllowed]
    || -[SBHIconManager isIconContentPossiblyVisibleOverApplication](self, "isIconContentPossiblyVisibleOverApplication")&& ((SBIconLocationGroupContainsLocation(@"SBIconLocationGroupFloatingDock", v4) & 1) != 0|| ([v4 isEqualToString:@"SBIconLocationFolder"] & 1) != 0))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v5 = [v6 iconManager:self isPartialEditingAllowedForIconLocation:v4];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isEditingAllowedForIconView:(id)a3
{
  id v4 = a3;
  char v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconManager:self isEditingAllowedForIconView:v4];
  }
  else {
    char v6 = 1;
  }
  id v7 = [v4 location];
  BOOL v8 = v6 & [(SBHIconManager *)self isEditingAllowedForIconLocation:v7];

  return v8;
}

- (BOOL)isEditingAllowedForIconListView:(id)a3
{
  id v4 = [a3 iconLocation];
  LOBYTE(self) = [(SBHIconManager *)self isEditingAllowedForIconLocation:v4];

  return (char)self;
}

- (BOOL)isEditingForIconListView:(id)a3
{
  id v4 = [a3 iconLocation];
  LOBYTE(self) = [(SBHIconManager *)self isEditingForIconLocation:v4];

  return (char)self;
}

void __41__SBHIconManager__restartEditingEndTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isEditing]) {
    [WeakRetained setEditing:0];
  }
}

- (void)configureFeedbackView:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1840];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v9 = [MEMORY[0x1E4FB2190] defaultConfiguration];
  id v7 = (UIImpactFeedbackGenerator *)[v6 initWithConfiguration:v9 view:v5];

  iconEditingFeedbackBehavior = self->_iconEditingFeedbackBehavior;
  self->_iconEditingFeedbackBehavior = v7;
}

- (void)displayEnterEditingModeFeatureIntroductions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHIconManager *)self delegate];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SBHIconManager *)self featureIntroductionManager];
  id v5 = [v4 featureIntroductionItemAtLocation:8];
  id v6 = [v5 allObjects];

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
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v3 iconManager:self displayFeatureIntroductionItem:v11 atLocation:8];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)displayFeatureIntroductionItemIfUnlocked:(id)a3
{
  id v5 = a3;
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconManager:self displayFeatureIntroductionItemIfUnlocked:v5];
  }
}

- (BOOL)isIconTouched
{
  return [(NSMutableSet *)self->_touchedIconViews count] != 0;
}

- (void)performAfterAllIconTouchesFinishedUsingBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(SBHIconManager *)self isIconTouched])
  {
    id v5 = SBLogIcon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Will perform block after icon touches are finished", v11, 2u);
    }

    iconTouchesFinishedBlocks = self->_iconTouchesFinishedBlocks;
    if (!iconTouchesFinishedBlocks)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = self->_iconTouchesFinishedBlocks;
      self->_iconTouchesFinishedBlocks = v7;

      iconTouchesFinishedBlocks = self->_iconTouchesFinishedBlocks;
    }
    uint64_t v9 = (void *)[v4 copy];
    uint64_t v10 = _Block_copy(v9);
    [(NSMutableArray *)iconTouchesFinishedBlocks addObject:v10];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)clearHighlightedIcon:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self highlightedIconView];
  id v6 = [v5 icon];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    uint64_t v8 = SBLogIcon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_INFO, "Clearing highlight from icon view: %@", (uint8_t *)&v9, 0xCu);
    }

    [v5 setHighlighted:0];
    [(SBHIconManager *)self setHighlightedIconView:0];
  }
}

- (SBIconListView)currentRootIconList
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  id v3 = [v2 currentIconListView];

  return (SBIconListView *)v3;
}

- (id)rootIconListAtIndex:(int64_t)a3
{
  if (a3 == 10000)
  {
    id v3 = [(SBHIconManager *)self effectiveDockListView];
  }
  else
  {
    id v5 = [(SBHIconManager *)self rootFolderController];
    id v3 = [v5 iconListViewAtIndex:a3];
  }
  return v3;
}

- (SBIconListView)dockListView
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  id v3 = [v2 dockListView];

  return (SBIconListView *)v3;
}

- (SBIconListView)floatingDockListView
{
  id v2 = [(SBHIconManager *)self floatingDockViewController];
  id v3 = [v2 userIconListView];

  return (SBIconListView *)v3;
}

- (SBIconListView)floatingDockSuggestionsListView
{
  id v2 = [(SBHIconManager *)self floatingDockViewController];
  id v3 = [v2 recentIconListView];

  return (SBIconListView *)v3;
}

- (SBIconListView)effectiveDockListView
{
  id v3 = [(SBHIconManager *)self dockListView];
  if (!v3)
  {
    id v3 = [(SBHIconManager *)self floatingDockListView];
  }
  return (SBIconListView *)v3;
}

- (BOOL)_shouldRespondToIconCloseBoxes
{
  id v2 = [(SBHIconManager *)self iconDragManager];
  char v3 = [v2 isTrackingActiveOrDroppingIconDrags] ^ 1;

  return v3;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHIconManager *)self rootViewController];
  [v8 enumerateDisplayedIconViewsForIcon:v6 usingBlock:v7];

  int v9 = [(SBHIconManager *)self floatingDockViewController];
  [v9 enumerateDisplayedIconViewsForIcon:v6 usingBlock:v7];

  uint64_t v10 = [(SBHIconManager *)self _effectiveTodayViewController];
  [v10 enumerateDisplayedIconViewsForIcon:v6 usingBlock:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = [(SBHIconManager *)self _libraryViewControllers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) enumerateDisplayedIconViewsForIcon:v6 usingBlock:v7];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)enumerateKnownIconViewsUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self iconViewMap];
  [v5 enumerateRecycledViewsUsingBlock:v4];

  id v6 = [(SBHIconManager *)self rootViewController];
  [v6 enumerateDisplayedIconViewsUsingBlock:v4];

  id v7 = [(SBHIconManager *)self floatingDockViewController];
  [v7 enumerateDisplayedIconViewsUsingBlock:v4];

  uint64_t v8 = [(SBHIconManager *)self overlayTodayViewController];
  [v8 enumerateDisplayedIconViewsUsingBlock:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v9 = [(SBHIconManager *)self _libraryViewControllers];
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
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) enumerateDisplayedIconViewsUsingBlock:v4];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_updateVisibleIconsViewsForAllowableCloseBoxes
{
  BOOL v3 = [(SBHIconManager *)self iconsShouldAllowCloseBoxes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SBHIconManager__updateVisibleIconsViewsForAllowableCloseBoxes__block_invoke;
  v4[3] = &unk_1E6AB0BD0;
  v4[4] = self;
  BOOL v5 = v3;
  [(SBHIconManager *)self enumerateDisplayedIconViewsUsingBlock:v4];
}

void __64__SBHIconManager__updateVisibleIconsViewsForAllowableCloseBoxes__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [v5 continuityItem];
  if (v3)
  {
  }
  else if ([*(id *)(a1 + 32) iconViewDisplaysCloseBox:v5])
  {
    BOOL v4 = *(unsigned char *)(a1 + 40) != 0;
    goto LABEL_6;
  }
  BOOL v4 = 0;
LABEL_6:
  [v5 setAllowsCloseBox:v4];
}

- (BOOL)isIconVisiblyRepresented:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = [v5 indexPathForIcon:v4 includingPlaceholders:1];

  return v6 != 0;
}

- (BOOL)isIconIgnored:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = [v5 ignoredList];
  char v7 = [v6 directlyContainsIcon:v4];

  return v7;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self iconModel];
  id v6 = [v5 applicationIconForBundleIdentifier:v4];

  char v7 = [v6 application];

  return v7;
}

- (id)addApplicationPlaceholders:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self iconModel];
  uint64_t v20 = [(SBHIconManager *)self rootFolder];
  id v21 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v18 = 0;
    uint64_t v22 = *(void *)v26;
    id obj = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v10 applicationBundleIdentifier];
        uint64_t v12 = [v5 applicationIconsForBundleIdentifier:v11];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__SBHIconManager_addApplicationPlaceholders___block_invoke;
        v23[3] = &unk_1E6AB3C90;
        id v13 = v12;
        id v24 = v13;
        [(SBHIconManager *)self enumerateAllIconImageCachesUsingBlock:v23];
        long long v14 = [v5 addApplicationPlaceholder:v10];
        if (v14)
        {
          [v21 addObject:v14];
          long long v15 = [v20 indexPathForIcon:v14];

          if (!v15)
          {
            if ([v10 isNewAppInstallFromStore]) {
              uint64_t v16 = 64;
            }
            else {
              uint64_t v16 = 0;
            }
            [(SBHIconManager *)self addNewIconToDesignatedLocation:v14 options:v16];
            char v18 = 1;
          }
        }
      }
      id v6 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);

    if (v18) {
      [v5 saveIconStateIfNeeded];
    }
  }
  else
  {
  }
  return v21;
}

uint64_t __45__SBHIconManager_addApplicationPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 purgeCachedImagesForIcons:*(void *)(a1 + 32)];
}

- (id)replaceApplicationPlaceholderWithApplication:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHIconManager *)self iconModel];
  id v6 = [(SBHIconManager *)self iconImageCache];
  uint64_t v7 = [(SBHIconManager *)self prioritizedCachingImageAppearances];
  uint64_t v8 = [v4 bundleIdentifier];
  int v9 = [v5 applicationIconsForBundleIdentifier:v8];
  if ([v9 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v21 = v8;
      uint64_t v22 = v5;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "replaceIconDataSourcesWithApplication:", v4, v21, v22, (void)v23);
          long long v28 = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
          id v17 = (id)[v6 cacheImagesForIcons:v16 prioritizedImageAppearances:v7 reason:@"replace app placeholder with app" options:0 completionHandler:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v12);
      int v9 = v10;
      uint64_t v8 = v21;
      id v5 = v22;
    }
    else
    {
      int v9 = v10;
    }
  }
  else
  {
    id v10 = [v5 addApplication:v4];
    if (v10)
    {
      [(SBHIconManager *)self addNewIconToDesignatedLocation:v10 options:4];
      id v27 = v10;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];

      int v9 = (void *)v18;
    }
  }

  uint64_t v19 = [v9 firstObject];

  return v19;
}

- (void)replaceApplicationPlaceholderWithApplication:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bundleIdentifier];
  int v9 = [(SBHIconManager *)self iconImageCache];
  id v10 = [(SBHIconManager *)self prioritizedCachingImageAppearances];
  uint64_t v11 = [[SBLeafIcon alloc] initWithLeafIdentifier:v8 applicationBundleID:v8];
  v23[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__SBHIconManager_replaceApplicationPlaceholderWithApplication_completionHandler___block_invoke;
  v18[3] = &unk_1E6AB3CB8;
  void v18[4] = self;
  id v19 = v6;
  id v20 = v9;
  id v21 = v10;
  id v22 = v7;
  id v13 = v7;
  id v14 = v10;
  id v15 = v9;
  id v16 = v6;
  id v17 = (id)[v15 cacheImagesForIcons:v12 prioritizedImageAppearances:v14 reason:@"replace app placeholder with dummy icon (async)" options:1 completionHandler:v18];
}

void __81__SBHIconManager_replaceApplicationPlaceholderWithApplication_completionHandler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) iconModel];
  BOOL v3 = [v2 addApplication:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) rootFolder];
  id v5 = [v4 indexPathForIcon:v3];

  if (!v5) {
    [*(id *)(a1 + 32) addNewIconToDesignatedLocation:v3 options:4];
  }
  id v6 = *(void **)(a1 + 48);
  v10[0] = v3;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = (id)[v6 cacheImagesForIcons:v7 prioritizedImageAppearances:*(void *)(a1 + 56) reason:@"replace app placeholder with app (async)" options:1 completionHandler:0];

  uint64_t v9 = *(void *)(a1 + 64);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v3);
  }
}

- (void)uninstallIcon:(id)a3
{
}

- (void)uninstallIcon:(id)a3 animate:(BOOL)a4
{
}

- (void)uninstallIcon:(id)a3 animate:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    if (![v8 isUninstalled])
    {
      id v10 = SBLogIcon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        BOOL v20 = v6;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Uninstall icon animated=%{BOOL}u : %@", buf, 0x12u);
      }

      [v8 setUninstalled];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__SBHIconManager_uninstallIcon_animate_completion___block_invoke;
      v15[3] = &unk_1E6AB3CE0;
      id v16 = v8;
      id v17 = self;
      id v18 = v9;
      [(SBHIconManager *)self removeIcon:v16 options:v6 completion:v15];

      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = SBLogCommon();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

    if (v12) {
      NSLog(&cfstr_NoIconGivenToU.isa);
    }
    if (([0 isUninstalled] & 1) == 0)
    {
      id v14 = SBLogIcon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SBHIconManager uninstallIcon:animate:completion:]();
      }

      if (v9) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  id v13 = SBLogIcon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring uninstall icon animated=%{BOOL}u because it is already uninstalled : %@", buf, 0x12u);
  }

  if (v9) {
LABEL_12:
  }
    (*((void (**)(id, void))v9 + 2))(v9, 0);
LABEL_13:
}

uint64_t __51__SBHIconManager_uninstallIcon_animate_completion___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) completeUninstall];
  if (a2)
  {
    if ([*(id *)(a1 + 32) isWidgetIcon])
    {
      id v4 = [*(id *)(a1 + 40) homeScreenDefaults];
      char v5 = [v4 userDidUndoSuggestedWidget];

      if ((v5 & 1) == 0) {
        [*(id *)(a1 + 40) updateWidgetDiscoverabilityUserPreferencesByDeletingWidget:*(void *)(a1 + 32)];
      }
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)addIconToIgnoredList:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  char v6 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = v6 & 1;
    uint64_t v11 = SBLogIcon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v60 = v6 & 1;
      __int16 v61 = 2112;
      id v62 = v8;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Uninstall icon animated=%{BOOL}u : %@", buf, 0x12u);
    }

    if ([v8 isFolderIcon]
      && ![(SBHIconManager *)self canAddIconToIgnoredList:v8])
    {
      uint64_t v42 = [v8 folder];
      BOOL v12 = [v42 allIcons];
      id v13 = (void *)[v12 copy];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v54 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            if ([(SBHIconManager *)self canAddIconToIgnoredList:v19]) {
              [(SBHIconManager *)self removeIcon:v19 options:2 completion:0];
            }
            else {
              [(SBHIconManager *)self addNewIconToDesignatedLocation:v19 options:40];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v16);
      }
    }
    uint64_t v20 = v10 | 2;
    __int16 v21 = [(SBHIconManager *)self iconModel];
    id v22 = [v8 applicationBundleID];
    if (v22)
    {
      uint64_t v23 = [v21 applicationIconsForBundleIdentifier:v22];
      if ((v6 & 2) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
      if ((v6 & 2) == 0)
      {
LABEL_19:
        long long v24 = &off_1D81E4000;
        if ([v8 isApplicationIcon] && (unint64_t)objc_msgSend(v23, "count") >= 2)
        {
          if ([v8 leafIdentifierAndApplicationBundleIDMatches])
          {
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __58__SBHIconManager_addIconToIgnoredList_options_completion___block_invoke;
            v47[3] = &unk_1E6AB3D08;
            id v8 = v8;
            id v48 = v8;
            uint64_t v25 = [v23 indexOfObjectPassingTest:v47];
            if (v25 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v26 = 0;
            }
            else
            {
              uint64_t v26 = [v23 objectAtIndex:v25];
            }
            long long v35 = [v21 rootFolder];
            long long v36 = v35;
            uint64_t v41 = (void *)v26;
            if (v26)
            {
              uint64_t v37 = [v35 indexPathForIcon:v26];
            }
            else
            {
              uint64_t v37 = 0;
            }
            long long v38 = [v36 indexPathForIcon:v8];
            long long v44 = (void *)v37;
            if (v38 && v37)
            {
              [v36 swapIconAtIndexPath:v38 withIconAtIndexPath:v37 options:0];
              uint64_t v39 = v41;
              id v40 = v41;

              id v8 = v40;
            }
            else
            {
              uint64_t v39 = v41;
            }

            long long v24 = &off_1D81E4000;
          }
        }
        else
        {
          v10 |= 2uLL;
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = *((void *)v24 + 360);
        v45[2] = __58__SBHIconManager_addIconToIgnoredList_options_completion___block_invoke_2;
        v45[3] = &unk_1E6AADF78;
        id v46 = v9;
        [(SBHIconManager *)self removeIcon:v8 options:v10 completion:v45];

LABEL_43:
        goto LABEL_44;
      }
    }
    long long v43 = v21;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v30 = v23;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(v30);
          }
          [(SBHIconManager *)self removeIcon:*(void *)(*((void *)&v49 + 1) + 8 * j) options:v20 completion:0];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v32);
    }

    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
    __int16 v21 = v43;
    goto LABEL_43;
  }
  id v27 = SBLogCommon();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

  if (v28) {
    NSLog(&cfstr_NoIconGivenToH.isa);
  }
  long long v29 = SBLogIcon();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[SBHIconManager addIconToIgnoredList:options:completion:]();
  }

  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
LABEL_44:
}

BOOL __58__SBHIconManager_addIconToIgnoredList_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

uint64_t __58__SBHIconManager_addIconToIgnoredList_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)canAddIconToIgnoredList:(id)a3
{
  id v4 = a3;
  if ([v4 isLeafIcon] && (objc_msgSend(v4, "isWidgetIcon") & 1) == 0)
  {
    char v6 = [(SBHIconManager *)self delegate];
    BOOL v5 = (objc_opt_respondsToSelector() & 1) == 0
      || [v6 iconManager:self canAddIconToIgnoredList:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)removeIcon:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    uint64_t v10 = [(SBHIconManager *)self rootFolder];
    uint64_t v11 = [v10 indexPathForIcon:v8];
    BOOL v12 = [(SBHIconManager *)self iconModel];
    unint64_t v13 = [(SBHIconManager *)self gridCellInfoOptions];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__SBHIconManager_removeIcon_options_completion___block_invoke;
    aBlock[3] = &unk_1E6AB3D30;
    id v14 = v12;
    id v40 = v14;
    id v15 = v10;
    id v41 = v15;
    unint64_t v42 = v13;
    unint64_t v43 = a4;
    uint64_t v16 = (void (**)(void *, id))_Block_copy(aBlock);
    if (v11)
    {
      id v38 = v14;
      id v17 = [v15 folderContainingIndexPath:v11 relativeIndexPath:0];
      id v18 = [(SBHIconManager *)self iconListViewForIndexPath:v11];
      uint64_t v19 = [v18 displayedIconViewForIcon:v8];
      uint64_t v20 = v19;
      if (v19)
      {
        [v19 setAllowsEditingAnimation:0];
        [v18 markIcon:v8 asNeedingAnimation:0];
      }
      __int16 v21 = [v17 startCoalescingContentChangesForReason:@"SBUninstallIconCoalesceID"];
      v16[2](v16, v8);
      long long v36 = v21;
      [v21 invalidate];
      if (v17 != v15 && [v17 isEmpty])
      {
        if ([(SBHIconManager *)self hasOpenFolder])
        {
          [(SBHIconManager *)self popExpandedIconAnimated:1 completionHandler:0];
        }
        else
        {
          uint64_t v26 = [v17 icon];
          [(SBHIconManager *)self uninstallIcon:v26 animate:1];
        }
      }
      uint64_t v37 = v16;
      id v27 = [v8 gridSizeClass];
      if (v27 == @"SBHIconGridSizeClassDefault")
      {
        uint64_t v34 = 0;
      }
      else
      {
        [v8 gridSizeClass];
        long long v35 = v9;
        BOOL v28 = v17;
        id v29 = v15;
        id v30 = v20;
        uint64_t v31 = v18;
        v33 = uint64_t v32 = v11;
        uint64_t v34 = [v33 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;

        uint64_t v11 = v32;
        id v18 = v31;
        uint64_t v20 = v30;
        id v15 = v29;
        id v17 = v28;
        id v9 = v35;
      }

      [(SBHIconManager *)self layoutIconListsWithAnimationType:v34];
      if (v9) {
        v9[2](v9, 1);
      }

      uint64_t v16 = v37;
      id v14 = v38;
    }
    else
    {
      uint64_t v25 = SBLogIcon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[SBHIconManager removeIcon:options:completion:]();
      }

      if ([v8 isLeafIcon]
        && [v14 _shouldSkipAddingIcon:v8 toRootFolder:v15])
      {
        v16[2](v16, v8);
      }
      if (v9) {
        v9[2](v9, 0);
      }
    }
  }
  else
  {
    id v22 = SBLogCommon();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

    if (v23) {
      NSLog(&cfstr_NoIconGivenToR.isa);
    }
    long long v24 = SBLogIcon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SBHIconManager removeIcon:options:completion:]();
    }

    if (v9) {
      v9[2](v9, 0);
    }
  }
}

void __48__SBHIconManager_removeIcon_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [v7 leafIdentifier];
  id v4 = [*(id *)(a1 + 32) leafIconForIdentifier:v3];
  if (!v4) {
    id v4 = v7;
  }
  [*(id *)(a1 + 40) removeIcon:v4 options:26214400 listGridCellInfoOptions:*(void *)(a1 + 48)];
  BOOL v5 = [*(id *)(a1 + 40) ignoredList];
  char v6 = v5;
  if ((*(unsigned char *)(a1 + 56) & 2) != 0 && [v5 isAllowedToContainIcon:v4]) {
    [v6 addIcon:v4];
  }
  else {
    [*(id *)(a1 + 32) removeIcon:v4];
  }
  [*(id *)(a1 + 32) saveIconStateIfNeeded];
}

- (void)addNewIconsToDesignatedLocations:(id)a3 saveIconState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        [(SBHIconManager *)self addNewIconToDesignatedLocation:*(void *)(*((void *)&v12 + 1) + 8 * v10++) options:0];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  if (v4)
  {
    uint64_t v11 = [(SBHIconManager *)self iconModel];
    [v11 saveIconStateIfNeeded];
  }
}

- (void)addNewIconToDesignatedLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SBHIconManager *)self iconModel];
  if ([v7 isIconVisible:v6])
  {
    uint64_t v8 = [(SBHIconManager *)self iconDragManager];
    uint64_t v9 = [v6 leafIdentifier];
    [v8 swapTrackedIconWithIdentifier:v9 withIcon:v6];
    if ((a4 & 8) != 0) {
      [(SBHIconManager *)self addReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:@"SBHIconManagerAddNewIconOverridingUserPreference"];
    }
    objc_msgSend(v7, "addIconToDesignatedLocation:options:listGridCellInfoOptions:", v6, (a4 >> 3) & 0xE | (a4 >> 2) & 1, -[SBHIconManager gridCellInfoOptions](self, "gridCellInfoOptions"));
    uint64_t v10 = [v7 rootFolder];
    uint64_t v11 = [v10 indexPathForIcon:v6];
    if ((a4 & 8) != 0) {
      [(SBHIconManager *)self removeReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:@"SBHIconManagerAddNewIconOverridingUserPreference"];
    }
    unint64_t v19 = a4 & 4;
    if (v11)
    {
      long long v12 = [(SBHIconManager *)self iconListViewForIndexPath:v11];
    }
    else
    {
      long long v12 = 0;
    }
    [v12 markIcon:v6 asNeedingAnimation:1];
    [v12 layoutIconsIfNeededWithAnimationType:0 options:0];
    long long v14 = [(SBHIconManager *)self rootFolderController];
    if ((a4 & 2) != 0 && v11)
    {
      id v18 = v9;
      long long v15 = v8;
      char v16 = a4 & 1;
      uint64_t v17 = [v14 pageIndexForIconListModelIndex:SBFolderRelativeListIndex(v11)];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __57__SBHIconManager_addNewIconToDesignatedLocation_options___block_invoke;
      v20[3] = &unk_1E6AAED58;
      id v21 = v14;
      uint64_t v22 = v17;
      char v23 = v16;
      uint64_t v8 = v15;
      uint64_t v9 = v18;
      [(SBHIconManager *)self performAfterIconContextMenuDismissesUsingBlock:v20];
    }
    if (v19) {
      [v7 saveIconStateIfNeeded];
    }
  }
  else
  {
    long long v13 = SBLogIcon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v7;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "addNewIconToDesignatedLocation:options: -- Triggering icon relayout for _iconModel '%@' because, apparently, '%@' isn't visible!", buf, 0x16u);
    }

    [(SBHIconManager *)self relayout];
  }
}

uint64_t __57__SBHIconManager_addNewIconToDesignatedLocation_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentPageIndex:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) completion:0];
}

- (void)addReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Overriding user preference for adding new icons to the home screen for reason: %@", (uint8_t *)&v9, 0xCu);
  }

  reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen = self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen;
  if (!reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen)
  {
    uint64_t v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v8 = self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen;
    self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen = v7;

    reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen = self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen;
  }
  [(NSCountedSet *)reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen addObject:v4];
}

- (void)removeReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "End overriding user preference for adding new icons to the home screen for reason: %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSCountedSet *)self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen removeObject:v4];
}

- (void)scrollToIconListContainingIcon:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SBHIconManager *)self rootFolder];
  uint64_t v8 = [(SBHIconManager *)self rootFolder];
  int v9 = [v8 indexPathForIcon:v6];
  id v16 = 0;
  id v10 = [v7 folderContainingIndexPath:v9 relativeIndexPath:&v16];
  id v11 = v16;

  if (v10)
  {
    uint64_t v12 = SBFolderRelativeListIndex(v11);
    long long v13 = [(SBHIconManager *)self rootFolder];

    if (v10 == v13)
    {
      if (v12 == 20000 || v12 == 40000)
      {
        [(SBHIconManager *)self presentTodayOverlay];
        goto LABEL_5;
      }
      if (v12 == 10000) {
        goto LABEL_5;
      }
      long long v14 = [(SBHIconManager *)self rootFolderController];
      objc_msgSend(v14, "setCurrentPageIndex:animated:", objc_msgSend(v14, "pageIndexForIconListModelIndex:", v12), v4);
    }
    else
    {
      long long v14 = [(SBHIconManager *)self _currentFolderController];
      [v14 setCurrentPageIndexToListDirectlyContainingIcon:v6 animated:v4];
    }
  }
LABEL_5:
}

- (BOOL)_shouldLibraryOverlayAllowSwipeToDismissGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self rootFolderController];
  id v6 = [v4 view];

  id v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];
  int v9 = [v5 view];
  id v10 = [v9 window];
  id v11 = [v10 windowScene];

  if (v8 == v11
    && ((uint64_t v13 = [v5 currentPageIndex], v13 == objc_msgSend(v5, "trailingCustomViewPageIndex"))
     || [v5 destinationPageState] == 4))
  {
    int v12 = [v5 isScrollTracking] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_scrollToLastIconPageIfNecessaryForLibraryOverlayDismissal:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self rootFolderController];
  id v6 = [v4 view];

  id v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];
  int v9 = [v5 view];
  id v10 = [v9 window];
  id v11 = [v10 windowScene];

  if (v8 == v11)
  {
    uint64_t v12 = [v5 currentPageIndex];
    if ((v12 == [v5 trailingCustomViewPageIndex] || objc_msgSend(v5, "destinationPageState") == 4)
      && ([v5 isScrollTracking] & 1) == 0
      && ![(SBHIconManager *)self disablesScrollingToLastIconPageForLibraryDismissal])
    {
      unint64_t v13 = [(SBHIconManager *)self contentVisibility];
      long long v14 = SBLogIcon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109120;
        v16[1] = v13 != 2;
        _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Scrolling to last icon page due to modal library dismissal; animating scroll: %{BOOL}u",
          (uint8_t *)v16,
          8u);
      }

      uint64_t v15 = [v5 lastIconPageIndex];
      if (v13 == 2) {
        [v5 setCurrentPageIndex:v15 animated:0];
      }
      else {
        [v5 scrollUsingDecelerationAnimationToPageIndex:v15 withCompletionHandler:0];
      }
    }
  }
}

- (void)animateToDefaultStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolderController];
  [v5 scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:v4];
}

- (void)setIconToReveal:(id)a3
{
}

- (void)setIconToReveal:(id)a3 revealingPrevious:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (SBIcon *)a3;
  iconToReveal = self->_iconToReveal;
  if (iconToReveal != v7)
  {
    id v10 = v7;
    if (iconToReveal) {
      BOOL v9 = !v4;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && ([(SBIcon *)iconToReveal isEqual:v7] & 1) == 0) {
      [(SBHIconManager *)self addNewIconToDesignatedLocation:self->_iconToReveal options:4];
    }
    objc_storeStrong((id *)&self->_iconToReveal, a3);
    id v7 = v10;
  }
}

- (void)finishInstallingIconAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = [(SBIcon *)self->_iconToReveal leafIdentifier];
  id v10 = [v5 listsContainingLeafIconWithIdentifier:v6];

  if (![v10 count])
  {
    id v7 = [(SBHIconManager *)self iconToReveal];
    if (v7)
    {
      if (v3) {
        uint64_t v8 = 5;
      }
      else {
        uint64_t v8 = 4;
      }
      [(SBHIconManager *)self addNewIconToDesignatedLocation:v7 options:v8];
    }
  }
  BOOL v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconManagerDidFinishInstallForIcon:self];
  }
  [(SBHIconManager *)self setIconToReveal:0 revealingPrevious:0];
  [(SBHIconModel *)self->_iconModel saveIconStateIfNeeded];
}

- (void)tryScrollToIconToRevealAnimated:(BOOL)a3
{
  id v5 = NSString;
  id v6 = MEMORY[0x1D9483540](a3, a2);
  id v7 = [v5 stringWithFormat:@"tryScrollToIconToRevealAnimated:%@", v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__SBHIconManager_tryScrollToIconToRevealAnimated___block_invoke;
  v8[3] = &unk_1E6AAD728;
  void v8[4] = self;
  BOOL v9 = a3;
  [(SBHIconManager *)self _enqueueTransitionName:v7 withHandler:v8];
}

uint64_t __50__SBHIconManager_tryScrollToIconToRevealAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryScrollToIconToRevealAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_tryScrollToIconToRevealAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBHIconManager *)self rootViewController];
  id v6 = [(SBHIconManager *)self rootFolderController];
  id v7 = [(SBHIconManager *)self iconToReveal];
  if (v7)
  {
    if (([v6 isLeadingCustomViewVisible] & 1) != 0
      || [v6 isPullDownSearchVisible])
    {
      goto LABEL_4;
    }
    uint64_t v8 = [(SBHIconManager *)self rootFolder];
    BOOL v9 = [v8 indexPathForIcon:v7];

    if (v9) {
      goto LABEL_10;
    }
    char v10 = [v7 isLeafIcon];
    iconModel = self->_iconModel;
    if (v10)
    {
      BOOL v9 = [(SBHIconModel *)iconModel indexPathForNewIcon:v7 isDesignatedLocation:0 replaceExistingIconAtIndexPath:0];
    }
    else
    {
      uint64_t v12 = [(SBHIconModel *)iconModel rootFolder];
      BOOL v9 = [v12 indexPathForFirstFreeSlotAvoidingFirstList:1];
    }
    if (!v9)
    {
LABEL_4:
      [(SBHIconManager *)self finishInstallingIconAnimated:0];
    }
    else
    {
LABEL_10:
      unint64_t v13 = self->_iconToReveal;
      [(SBHIconManager *)self setIconToReveal:0 revealingPrevious:0];
      [(SBHIconManager *)self popToCurrentRootIconList];
      [(SBHIconManager *)self setIconToReveal:v13 revealingPrevious:0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__SBHIconManager__tryScrollToIconToRevealAnimated___block_invoke;
      void v14[3] = &unk_1E6AAF6D8;
      void v14[4] = self;
      BOOL v15 = v3;
      [v5 revealIcon:v7 animated:v3 completionHandler:v14];
    }
  }
}

uint64_t __51__SBHIconManager__tryScrollToIconToRevealAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishInstallingIconAnimated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __56__SBHIconManager_revealIcon_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3
{
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(SBHIconManager *)self rootFolderController];
  uint64_t v8 = [v7 folderControllers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v12++) layoutIconListsWithAnimationType:a3 forceRelayout:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  unint64_t v13 = [(SBHIconManager *)self floatingDockViewController];
  [v13 layoutUserControlledIconListsWithAnimationType:a3 forceRelayout:v4];

  long long v14 = [(SBHIconManager *)self _effectiveTodayViewController];
  [v14 layoutIconListViewWithAnimationType:a3 forceRelayout:v4];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v15 = [(SBHIconManager *)self _libraryViewControllers];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v19++) layoutIconListsWithAnimationType:a3 forceRelayout:v4];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)unscatterAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [(SBHIconManager *)self setAnimatingForUnscatter:1];
  [(SBHIconManager *)self setEditing:0];
  [(SBHIconManager *)self _ensureRootFolderController];
  uint64_t v9 = [(SBHIconManager *)self rootFolderController];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __62__SBHIconManager_unscatterAnimated_afterDelay_withCompletion___block_invoke;
    v10[3] = &unk_1E6AAF958;
    void v10[4] = self;
    id v11 = v8;
    [v9 unscatterAnimated:v6 afterDelay:v10 withCompletion:a4];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __62__SBHIconManager_unscatterAnimated_afterDelay_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingForUnscatter:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (double)defaultIconLayoutAnimationDuration
{
  return 0.225;
}

- (id)iconListViewForIndexPath:(id)a3
{
  id v5 = 0;
  [(SBHIconManager *)self getListView:&v5 folder:0 relativePath:0 forIndexPath:a3];
  id v3 = v5;
  return v3;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  p_folderIconImageCache = (uint64_t *)&self->_folderIconImageCache;
  folderIconImageCache = self->_folderIconImageCache;
  if (!folderIconImageCache)
  {
    id v5 = [(SBHIconManager *)self listLayoutProvider];
    BOOL v6 = [v5 layoutForIconLocation:@"SBIconLocationFolder"];

    id v7 = [SBFolderIconImageCache alloc];
    id v8 = [(SBHIconManager *)self iconImageCache];
    uint64_t v9 = [(SBFolderIconImageCache *)v7 initWithListLayout:v6 iconImageCache:v8];
    uint64_t v10 = self->_folderIconImageCache;
    self->_folderIconImageCache = v9;

    id v11 = SBLogIcon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(SBHIconManager *)p_folderIconImageCache folderIconImageCache];
    }

    folderIconImageCache = (SBFolderIconImageCache *)*p_folderIconImageCache;
  }
  return folderIconImageCache;
}

- (SBHIconImageCache)iconImageCache
{
  iconImageCache = self->_iconImageCache;
  if (!iconImageCache)
  {
    BOOL v4 = [(SBHIconManager *)self listLayoutProvider];
    id v5 = [v4 layoutForIconLocation:@"SBIconLocationRoot"];
    [v5 iconImageInfo];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    long long v14 = [[SBHIconImageCache alloc] initWithName:@"iconImages", v7, v9, v11, v13 iconImageInfo];
    BOOL v15 = self->_iconImageCache;
    self->_iconImageCache = v14;

    uint64_t v16 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v16 iconManager:self willUseIconImageCache:self->_iconImageCache];
    }

    iconImageCache = self->_iconImageCache;
  }
  return iconImageCache;
}

- (SBHIconImageCache)addWidgetSheetIconImageCache
{
  addWidgetSheetIconImageCache = self->_addWidgetSheetIconImageCache;
  if (!addWidgetSheetIconImageCache)
  {
    BOOL v4 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [v4 addWidgetSheetStyleForIconManager:self];
    }
    else {
      uint64_t v5 = 0;
    }
    double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v8 = v7;

    if (v5 == 1)
    {
      SBHAddWidgetSheetSplitViewIconMetricsForScale((uint64_t)v16, v8);
    }
    else
    {
      double v9 = 0.0;
      double v10 = 0.0;
      double v11 = 0.0;
      double v12 = 0.0;
      if (v5)
      {
LABEL_10:
        double v13 = [[SBHIconImageCache alloc] initWithName:@"addWidgetSheetIconImageCache", v9, v10, v11, v12 iconImageInfo];
        long long v14 = self->_addWidgetSheetIconImageCache;
        self->_addWidgetSheetIconImageCache = v13;

        addWidgetSheetIconImageCache = self->_addWidgetSheetIconImageCache;
        goto LABEL_11;
      }
      SBHAddWidgetSheetCompactViewIconMetricsForScale((uint64_t)v16, v8);
    }
    double v9 = v17;
    double v10 = v18;
    double v11 = v19;
    double v12 = v20;
    goto LABEL_10;
  }
LABEL_11:
  return addWidgetSheetIconImageCache;
}

- (void)enumerateAllIconImageCachesUsingBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  uint64_t v5 = v4;
  if (self->_iconImageCache)
  {
    v4[2](v4);
    BOOL v4 = v5;
  }
  if (self->_addWidgetSheetIconImageCache)
  {
    v4[2](v5);
    BOOL v4 = v5;
  }
}

- (void)resetAllIconImageCaches
{
  [(SBHIconManager *)self enumerateAllIconImageCachesUsingBlock:&__block_literal_global_299];
  iconImageCache = self->_iconImageCache;
  self->_iconImageCache = 0;

  addWidgetSheetIconImageCache = self->_addWidgetSheetIconImageCache;
  self->_addWidgetSheetIconImageCache = 0;
}

uint64_t __41__SBHIconManager_resetAllIconImageCaches__block_invoke(uint64_t a1, void *a2)
{
  return [a2 purgeAllCachedImages];
}

- (SBHAddWidgetSheetConfigurationManager)addWidgetSheetConfigurationManager
{
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  if (!addWidgetSheetConfigurationManager)
  {
    BOOL v4 = [[SBHAddWidgetSheetConfigurationManager alloc] initWithWidgetExtensionProvider:self->_widgetExtensionProvider];
    [(SBHAddWidgetSheetConfigurationManager *)v4 setConfigurationManagerDelegate:self];
    uint64_t v5 = [(SBHIconManager *)self iconModel];
    [(SBHAddWidgetSheetConfigurationManager *)v4 setIconModel:v5];

    double v6 = [(SBHIconManager *)self listLayoutProvider];
    [(SBHAddWidgetSheetConfigurationManager *)v4 setListLayoutProvider:v6];

    double v7 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v7 addWidgetSheetStyleForIconManager:self];
    }
    else {
      uint64_t v8 = 0;
    }
    [(SBHAddWidgetSheetConfigurationManager *)v4 setAddWidgetSheetStyle:v8];
    double v9 = self->_addWidgetSheetConfigurationManager;
    self->_addWidgetSheetConfigurationManager = v4;

    addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  }
  return addWidgetSheetConfigurationManager;
}

- (BOOL)isRootFolderContentVisible
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isRootFolderContentVisibleForIconManager:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isIconContentPossiblyVisibleOverApplication
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isIconContentPossiblyVisibleOverApplicationForIconManager:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setIdleModeText:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootViewController];
  [v5 setIdleText:v4];
}

- (void)removeAllIconAnimations
{
  id v3 = [(SBHIconManager *)self currentRootIconList];
  [v3 removeAllIconAnimations];

  id v5 = [(SBHIconManager *)self dockListView];
  id v4 = [v5 layer];
  [v4 removeAllAnimations];
}

- (void)noteFloatingDockWillChangeHeight
{
  id v2 = [(SBHIconManager *)self rootViewController];
  id v3 = [v2 contentView];

  [v3 setNeedsLayout];
}

- (void)noteFloatingDockWillAnimateChangeInHeight
{
  id v2 = [(SBHIconManager *)self rootViewController];
  id v3 = [v2 contentView];

  [v3 layoutIfNeeded];
}

- (void)noteIconViewWillZoomDown:(id)a3
{
  id v15 = a3;
  id v4 = -[SBHIconManager floatingDockViewControllerForView:](self, "floatingDockViewControllerForView:");
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 libraryViewController];
    if (([v5 isPresentingLibrary] & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    double v7 = [(SBHIconManager *)self overlayLibraryViewController];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(SBHIconManager *)self trailingLibraryViewController];
    }
    double v6 = v9;

    if (![(SBHIconManager *)self isMainDisplayLibraryViewVisible]) {
      goto LABEL_10;
    }
  }
  double v10 = [v15 location];
  int v11 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupAppLibrary", v10);

  if (v11) {
    [v6 noteIconViewWillZoomDown:v15];
  }
LABEL_10:
  if ([(SBHIconManager *)self isOverlayTodayViewVisible])
  {
    double v12 = [(SBHIconManager *)self overlayTodayViewController];
    int v13 = [v12 isDisplayingIconView:v15];

    if (v13)
    {
      long long v14 = [(SBHIconManager *)self overlayTodayViewController];
      [v14 noteIconViewWillZoomDown:v15];
    }
  }
}

- (id)viewControllerForPresentingViewControllers
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 viewControllerForPresentingViewControllersForIconManager:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)accessibilityTintColorForScreenRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = objc_msgSend(v8, "iconManager:accessibilityTintColorForScreenRect:", self, x, y, width, height);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)moveIconToHiddenPage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __39__SBHIconManager_moveIconToHiddenPage___block_invoke;
  v6[3] = &unk_1E6AACF80;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBHIconManager *)self removeIcon:v5 options:1 completion:v6];
}

void __39__SBHIconManager_moveIconToHiddenPage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootFolder];
  [v2 removeIcon:*(void *)(a1 + 40) options:0];
}

- (BOOL)resetIconLayoutWithOptions:(unint64_t)a3
{
  char v3 = a3;
  [(SBHIconManager *)self addReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:@"resetIconLayout"];
  id v5 = [(SBHIconManager *)self iconModel];
  uint64_t v6 = v3 & 1;
  char v7 = [v5 deleteIconStateWithOptions:v6];
  [v5 clearDesiredIconStateWithOptions:v6];
  [(SBHIconManager *)self removeReasonToIgnoreUserPreferenceForAddingNewIconsToHomeScreen:@"resetIconLayout"];

  return v7;
}

- (BOOL)resetTodayLayout
{
  id v2 = [(SBHIconManager *)self iconModel];
  char v3 = [v2 defaultIconState];
  id v4 = [[SBHIconStateUnarchiver alloc] initWithArchive:v3 iconModel:v2];
  id v5 = [(SBHIconStateUnarchiver *)v4 unarchive];
  if ([v5 isValid])
  {
    uint64_t v6 = [v5 rootFolder];
    char v7 = [v2 rootFolder];
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    BOOL v10 = !v9;
    if (!v9)
    {
      long long v21 = [v7 todayList];
      int v11 = [v8 favoriteTodayList];
      long long v22 = [v21 icons];
      [v11 icons];
      double v12 = v24 = v6;
      [v21 removeAllIcons];
      BOOL v23 = v10;
      int v13 = v11;
      [v11 removeAllIcons];
      [v2 removeIcons:v22];
      [v2 removeIcons:v12];
      long long v14 = [v24 todayList];
      id v15 = [v14 icons];

      uint64_t v16 = [v24 favoriteTodayList];
      double v17 = [v16 icons];

      id v18 = (id)[v21 addIcons:v15];
      id v19 = (id)[v13 addIcons:v17];
      [v2 saveIconStateIfNeeded];

      uint64_t v6 = v24;
      BOOL v10 = v23;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)clearTodayLayout
{
  id v2 = [(SBHIconManager *)self iconModel];
  char v3 = [v2 rootFolder];
  id v4 = [v3 todayList];
  [v4 removeAllIcons];

  id v5 = [v3 favoriteTodayList];
  [v5 removeAllIcons];

  [v2 saveIconStateIfNeeded];
  return 1;
}

- (void)minimumHomeScreenScaleDidChange
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  [v2 minimumHomeScreenScaleDidChange];
}

- (void)runDownloadingIconTest
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBHIconManager *)self iconModel];
  char v3 = [v2 leafIcons];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v2 isIconVisible:v9])
        {
          BOOL v10 = [v9 applicationBundleID];
          uint64_t v11 = [v9 application];
          double v12 = (void *)v11;
          if (v10) {
            BOOL v13 = v11 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13)
          {
            long long v14 = objc_alloc_init(SBHFakeApplicationPlaceholder);
            [(SBHFakeApplicationPlaceholder *)v14 setApplicationBundleIdentifier:v10];
            id v15 = [v9 displayName];
            [(SBHFakeApplicationPlaceholder *)v14 setApplicationDisplayName:v15];

            [v4 addObject:v14];
            [v22 setObject:v12 forKey:v10];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  id v16 = [(SBHIconManager *)self addApplicationPlaceholders:v4];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  double v17 = (void *)MEMORY[0x1E4F1CB00];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __40__SBHIconManager_runDownloadingIconTest__block_invoke;
  v23[3] = &unk_1E6AB3DF0;
  long long v27 = v28;
  id v18 = v4;
  id v24 = v18;
  id v19 = v22;
  id v25 = v19;
  long long v26 = self;
  id v20 = (id)[v17 scheduledTimerWithTimeInterval:1 repeats:v23 block:0.25];

  _Block_object_dispose(v28, 8);
}

void __40__SBHIconManager_runDownloadingIconTest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              + 0.1;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v8++) setProgress:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 1.0)
  {
    [v3 invalidate];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(a1 + 40);
          id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "applicationBundleIdentifier", (void)v18);
          id v16 = [v14 objectForKey:v15];

          id v17 = (id)[*(id *)(a1 + 48) replaceApplicationPlaceholderWithApplication:v16];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v11);
    }
  }
}

- (void)runRemoveAndRestoreIconTest
{
  id v3 = [(SBHIconManager *)self iconModel];
  id v4 = [v3 leafIcons];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SBHIconManager_runRemoveAndRestoreIconTest__block_invoke;
  v11[3] = &unk_1E6AB3E18;
  id v12 = v5;
  uint64_t v13 = self;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = (id)[v7 scheduledTimerWithTimeInterval:1 repeats:v11 block:0.1];
}

void __45__SBHIconManager_runRemoveAndRestoreIconTest__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] count])
  {
    id v4 = [a1[4] anyObject];
    [a1[4] removeObject:v4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __45__SBHIconManager_runRemoveAndRestoreIconTest__block_invoke_2;
    v8[3] = &unk_1E6AACF80;
    id v5 = a1[5];
    id v9 = a1[6];
    id v10 = v4;
    id v6 = v4;
    [v5 removeIcon:v6 options:1 completion:v8];
  }
  else if ([a1[6] count])
  {
    uint64_t v7 = [a1[6] anyObject];
    [a1[6] removeObject:v7];
    [a1[5] addNewIconToDesignatedLocation:v7 options:3];
  }
  else
  {
    [v3 invalidate];
  }
}

uint64_t __45__SBHIconManager_runRemoveAndRestoreIconTest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (void)addAllEligibleIconsToIgnoredList
{
  id v9 = [(SBHIconManager *)self iconModel];
  id v3 = [v9 leafIcons];
  id v4 = [(SBHIconManager *)self rootFolder];
  id v5 = [v4 ignoredList];
  id v6 = [v3 allObjects];
  uint64_t v7 = [v5 allowedIconsForIcons:v6];

  id v8 = (id)[v5 addIcons:v7];
  [v4 pruneEmptyFolders];
  [v4 compactLists];
}

- (void)removeAllWidgetIcons
{
  id v4 = [(SBHIconManager *)self iconModel];
  id v2 = [v4 widgetIcons];
  id v3 = [v2 allObjects];

  [v4 removeIcons:v3];
}

- (void)removeWidgetIconsFromHomeScreen
{
  id v2 = [(SBHIconManager *)self iconModel];
  id v3 = [v2 rootFolder];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __49__SBHIconManager_removeWidgetIconsFromHomeScreen__block_invoke;
  v6[3] = &unk_1E6AAF030;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateListsWithOptions:4 usingBlock:v6];
  [v2 removeIcons:v5];
}

void __49__SBHIconManager_removeWidgetIconsFromHomeScreen__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 directlyContainedIconsPassingTest:&__block_literal_global_316];
  [*(id *)(a1 + 32) addObjectsFromArray:v3];
}

uint64_t __49__SBHIconManager_removeWidgetIconsFromHomeScreen__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isWidgetIcon];
}

- (void)shuffleWidgetStackForTestRecipe
{
  id v14 = [(SBHIconManager *)self currentRootIconList];
  id v2 = [v14 icons];
  id v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", &__block_literal_global_319);

  if (v3)
  {
    unint64_t v4 = [v3 iconDataSourceCount];
    id v5 = [v3 iconDataSources];
    id v6 = [v3 activeDataSource];
    uint64_t v7 = [v5 indexOfObject:v6];

    uint32_t v8 = arc4random();
    unint64_t v9 = v8 % v4;
    if (v9 + 1 == v4) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = v9 + 1;
    }
    if (v9 == v7) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = v8 % v4;
    }
    id v12 = [v3 iconDataSources];
    uint64_t v13 = [v12 objectAtIndex:v11];

    [v3 setStackChangeReason:1];
    [v3 setActiveDataSource:v13];
  }
}

uint64_t __49__SBHIconManager_shuffleWidgetStackForTestRecipe__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWidgetStackIcon];
}

- (void)toggleSuggestedWidgetInStackForTestRecipe
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHIconManager *)self currentRootIconList];
  unint64_t v4 = [v3 icons];
  id v5 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_321_0);

  if (v5)
  {
    id v6 = [v5 widgets];
    objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_323);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v5 setStackChangeReason:3];
      [v5 removeIconDataSource:v7];
    }
    else
    {
      uint32_t v8 = [[SBHWidget alloc] initWithKind:@"com.apple.weather" extensionBundleIdentifier:@"com.apple.weather.widget"];
      id v7 = [(SBHWidget *)v8 copyWithSuggestionSource:1];

      unint64_t v9 = SBHWeatherWidgetTestIntent();
      unint64_t v10 = [v5 uniqueIdentifier];
      unint64_t v11 = [v7 uniqueIdentifier];
      [(SBHIconManager *)self setTemporaryIntent:v9 forIconWithIdentifier:v10 widgetUniqueIdentifier:v11];

      [v5 setStackChangeReason:2];
      v16[0] = v7;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      uint64_t v13 = (void *)MEMORY[0x1E4F28D60];
      id v14 = [v5 iconDataSources];
      id v15 = objc_msgSend(v13, "indexSetWithIndex:", objc_msgSend(v14, "count"));
      [v5 insertIconDataSources:v12 atIndexes:v15];

      [v5 setActiveDataSource:v7];
    }
  }
}

uint64_t __59__SBHIconManager_toggleSuggestedWidgetInStackForTestRecipe__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWidgetStackIcon];
}

BOOL __59__SBHIconManager_toggleSuggestedWidgetInStackForTestRecipe__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 suggestionSource] == 1;
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(unint64_t)a3
{
  id v32 = [(SBHIconManager *)self iconModel];
  id v5 = [(SBHIconManager *)self rootFolder];
  long long v31 = [v32 visibleLeafIcons];
  long long v30 = self;
  id v6 = [(SBHIconManager *)self listLayoutProvider];
  id v7 = [v6 layoutForIconLocation:@"SBIconLocationRoot"];

  long long v29 = v7;
  unint64_t v8 = SBHIconListLayoutMaximumIconCount(v7);
  unint64_t v9 = [v5 maxListCount];
  if (v9 >= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v11 = v10 * v8;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10 * v8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10 * v8];
  if (v10 * v8)
  {
    uint64_t v14 = 0;
    do
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Folder %lu", ++v14, v29);
      id v16 = [v32 makeFolderWithDisplayName:v15];

      id v17 = [[SBFolderIcon alloc] initWithFolder:v16];
      [v12 addObject:v16];
      [v13 addObject:v17];
    }
    while (v11 != v14);
  }
  long long v18 = (void *)[v31 mutableCopy];
  if ([v18 count])
  {
    uint64_t v19 = 0;
    do
    {
      long long v20 = [v18 anyObject];
      [v18 removeObject:v20];
      long long v21 = [v12 objectAtIndex:v19];
      id v22 = (id)[v21 addIcon:v20];
      int v23 = [v21 containsIcon:v20];
      if (v19 + 1 < v11) {
        uint64_t v24 = v19 + 1;
      }
      else {
        uint64_t v24 = 0;
      }
      if (v23) {
        uint64_t v19 = v24;
      }
    }
    while ([v18 count]);
  }
  [v5 removeAllLists];
  for (; v10; --v10)
  {
    unint64_t v25 = [v13 count];
    if (v8 >= v25) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = v8;
    }
    long long v27 = objc_msgSend(v13, "subarrayWithRange:", 0, v26);
    objc_msgSend(v13, "removeObjectsInRange:", 0, v26);
    id v28 = (id)[v5 addListWithIcons:v27];
  }
  [(SBHIconManager *)v30 layoutIconListsWithAnimationType:-1];
  [(SBHIconManager *)v30 _precacheDataForRootIcons];
}

- (void)organizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3
{
  id v23 = [(SBHIconManager *)self iconModel];
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = [v23 visibleLeafIcons];
  id v7 = [v6 allObjects];
  unint64_t v8 = [v7 sortedArrayUsingSelector:sel_localizedCompareDisplayNames_];

  unint64_t v9 = [(SBHIconManager *)self listLayoutProvider];
  unint64_t v10 = [v9 layoutForIconLocation:@"SBIconLocationRoot"];

  unint64_t v11 = [v5 maxListCount];
  if (v11 >= a3) {
    unint64_t v12 = a3;
  }
  else {
    unint64_t v12 = v11;
  }
  unint64_t v13 = [v8 count];
  unint64_t v14 = v13 / v12;
  unint64_t v15 = SBHIconListLayoutMaximumIconCount(v10);
  if (v13 / v12 >= v15) {
    unint64_t v14 = v15;
  }
  [v5 removeAllLists];
  uint64_t v16 = 0;
  unint64_t v17 = v12;
  do
  {
    long long v18 = objc_msgSend(v8, "subarrayWithRange:", v16 * v14, v14);
    id v19 = (id)[v5 addListWithIcons:v18];

    ++v16;
    --v17;
  }
  while (v17);
  long long v20 = objc_msgSend(v8, "subarrayWithRange:", v14 * v12, v13 - v14 * v12);
  long long v21 = [v5 ignoredList];
  id v22 = (id)[v21 addIcons:v20];

  [(SBHIconManager *)self layoutIconListsWithAnimationType:-1];
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v55 = [(SBHIconManager *)self iconModel];
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v58 = v5;
  id v7 = [v5 lists];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        unint64_t v13 = self;
        [v12 addIconsOfClass:v13 toSet:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v9);
  }

  long long v53 = self;
  unint64_t v14 = [(SBHIconManager *)self listLayoutProvider];
  unint64_t v15 = [v14 layoutForIconLocation:@"SBIconLocationRoot"];

  unint64_t v16 = [v58 maxListCount];
  if (v16 >= a3) {
    unint64_t v17 = a3;
  }
  else {
    unint64_t v17 = v16;
  }
  unint64_t v57 = v17;
  unint64_t v18 = [v6 count];
  long long v51 = v15;
  int v19 = SBHIconListLayoutMaximumIconCount(v15);
  [v58 removeAllLists];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v18 >= 8) {
    uint32_t v21 = 8;
  }
  else {
    uint32_t v21 = v18;
  }
  uint32_t v22 = arc4random_uniform(v21);
  uint64_t v23 = v22 + 1;
  if (v22 != -1)
  {
    uint64_t v24 = 0;
    do
    {
      if (!objc_msgSend(v6, "count", v51)) {
        break;
      }
      unint64_t v25 = arc4random_uniform(2u) + 1;
      unint64_t v26 = [v55 makeFolderWithDisplayName:@"Folder"];
      long long v27 = v26;
      while ([v26 iconCount] < v25 && objc_msgSend(v6, "count"))
      {
        id v28 = [v6 anyObject];
        if ([v27 canAddIcon:v28]) {
          id v29 = (id)[v27 addIcon:v28];
        }
        else {
          [v20 addObject:v28];
        }
        [v6 removeObject:v28];

        unint64_t v26 = v27;
      }
      long long v30 = [[SBFolderIcon alloc] initWithFolder:v27];
      [v20 addObject:v30];
      [v54 addObject:v27];

      ++v24;
    }
    while (v24 != v23);
  }
  long long v31 = objc_msgSend(v6, "allObjects", v51);
  [v20 addObjectsFromArray:v31];

  if (v57)
  {
    uint64_t v32 = 0;
    uint32_t __upper_bound = v19 - 4;
    do
    {
      unint64_t v33 = arc4random_uniform(__upper_bound) + 4;
      uint64_t v34 = [v58 addEmptyList];
      if (v33)
      {
        uint64_t v35 = 0;
        while ([v20 count])
        {
          uint64_t v36 = arc4random_uniform([v20 count]);
          uint64_t v37 = [v20 objectAtIndex:v36];
          if ([v34 allowsAddingIcon:v37])
          {
            [v34 addIcon:v37];
            [v20 removeObjectAtIndex:v36];
          }
          else
          {
            id v38 = [v37 gridSizeClass];
            if (v38 == @"SBHIconGridSizeClassDefault")
            {

LABEL_38:
              break;
            }
            uint64_t v39 = v38;
            id v40 = [v37 gridSizeClass];
            int v41 = [v40 isEqualToString:@"SBHIconGridSizeClassDefault"];

            if (v41) {
              goto LABEL_38;
            }
            --v35;
          }

          if (++v35 >= v33) {
            break;
          }
        }
      }

      ++v32;
    }
    while (v32 != v57);
  }
  while ([v20 count])
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v42 = v54;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v60;
LABEL_43:
      uint64_t v46 = 0;
      while (1)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(v42);
        }
        id v47 = *(void **)(*((void *)&v59 + 1) + 8 * v46);
        uint64_t v48 = [v20 lastObject];
        if (!v48) {
          break;
        }
        long long v49 = (void *)v48;
        if ([v47 canAddIcon:v48]) {
          id v50 = (id)[v47 addIcon:v49];
        }
        [v20 removeLastObject];

        if (v44 == ++v46)
        {
          uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v67 count:16];
          if (v44) {
            goto LABEL_43;
          }
          break;
        }
      }
    }
  }
  [(SBHIconManager *)v53 layoutIconListsWithAnimationType:-1];
}

- (void)replaceHomescreenWithWidgets
{
  id v3 = [(SBHIconManager *)self delegate];
  id v4 = [v3 testSetupForIconManagerWidgetScrollTest:self];

  [(SBHIconManager *)self _resetHomescreenIconStateTo:v4];
}

- (id)addWidgetsToEachPage
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHIconManager *)self rootFolder];
  id v4 = [(SBHIconManager *)self widgetExtensionProvider];
  id v5 = objc_msgSend(v4, "sbh_descriptors");
  id v6 = [v5 valueForKey:@"extensionBundleIdentifier"];

  id v7 = [(SBHIconManager *)self delegate];
  uint64_t v8 = [v7 testSetupForIconManagerAddWidgetsToEachPage:self];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __38__SBHIconManager_addWidgetsToEachPage__block_invoke;
  v29[3] = &unk_1E6AB3E60;
  id v24 = v6;
  id v30 = v24;
  uint64_t v9 = objc_msgSend(v8, "bs_filter:", v29);

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v3 firstVisibleListIndex];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [(SBHIconManager *)self _iconForDescriptor:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        if (v17)
        {
          unint64_t v18 = (void *)v17;
          int v19 = objc_msgSend(v3, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", v11, 0, -[SBHIconManager gridCellInfoOptions](self, "gridCellInfoOptions"));
          id v20 = (id)[v3 insertIcon:v18 atGridPath:v19 options:2];
          uint64_t v21 = [v3 nextVisibleListIndexAfterIndex:v11];
          if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          {

            goto LABEL_13;
          }
          uint64_t v11 = v21;
          [v10 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint32_t v22 = (void *)[v10 copy];
  return v22;
}

uint64_t __38__SBHIconManager_addWidgetsToEachPage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v7 bundleIdentifier];

  uint64_t v10 = [v8 containsObject:v9];
  return v10;
}

- (void)setupHomeScreenForWidgetScrollPerformanceTest
{
  id v3 = [(SBHIconManager *)self delegate];
  id v4 = [v3 testSetupForIconManagerWidgetScrollPerformanceTest:self];

  [(SBHIconManager *)self _resetHomescreenIconStateTo:v4];
}

- (void)_resetHomescreenIconStateTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v19 = [(SBHIconManager *)self rootFolder];
  [v19 removeAllLists];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        uint64_t v10 = [v19 addEmptyList];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              unint64_t v16 = [(SBHIconManager *)self _iconForDescriptor:*(void *)(*((void *)&v20 + 1) + 8 * v15)];
              if (v16) {
                [v10 addIcon:v16];
              }

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  uint64_t v17 = [v19 model];
  [v17 saveIconStateIfNeeded];
}

- (id)_iconForDescriptor:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  uint64_t v4 = objc_msgSend(v24, "sbh_iconDescriptorType");
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4 == 1)
    {
      id v6 = v24;
      uint64_t v7 = self;
      uint64_t v8 = [(SBHIconManager *)self iconModel];
      uint64_t v9 = [v6 bundleIdentifier];

      uint64_t v10 = [v8 leafIconForIdentifier:v9];

      id v11 = [(SBHIconManager *)v7 iconModel];
      uint64_t v12 = [v11 addAdditionalIconMatchingIcon:v10];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__20;
    v32[4] = __Block_byref_object_dispose__20;
    id v33 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__SBHIconManager__iconForDescriptor___block_invoke;
    aBlock[3] = &unk_1E6AB3E88;
    void aBlock[4] = self;
    void aBlock[5] = v32;
    long long v25 = self;
    uint64_t v5 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (objc_msgSend(v24, "sbh_iconDescriptorType") == 3)
    {
      [v24 widgetIconDescriptors];
    }
    else
    {
      v37[0] = v24;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v13 = };
    uint64_t v12 = [(SBLeafIcon *)[SBWidgetIcon alloc] initWithUniqueLeafIdentifier];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v18 = [v17 element];
            [(SBLeafIcon *)v12 addIconDataSource:v18];
          }
          else
          {
            unint64_t v18 = v5[2](v5, v17);
            if (v18)
            {
              int v19 = [(SBHIconManager *)v25 gridSizeClassDomain];
              long long v20 = objc_msgSend(v18, "sbh_iconDataSourceInDomain:", v19);
              long long v21 = SBLogWidgets();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v35 = v20;
                _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ created from descriptor.", buf, 0xCu);
              }

              [(SBLeafIcon *)v12 addIconDataSource:v20];
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v14);
    }

    long long v22 = [v24 sizeClass];
    [(SBIcon *)v12 setGridSizeClass:v22];

    _Block_object_dispose(v32, 8);
  }

  return v12;
}

id __37__SBHIconManager__iconForDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 bundleIdentifier];
    uint64_t v9 = [v7 widgetIdentifier];
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v10)
    {
      id v11 = [*(id *)(a1 + 32) widgetExtensionProvider];
      uint64_t v12 = objc_msgSend(v11, "sbh_descriptors");
      uint64_t v13 = [v12 copy];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v10;
    id v17 = (id)[v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      id v24 = v5;
      uint64_t v18 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = [v20 extensionBundleIdentifier];
          long long v22 = [v20 kind];
          if [v8 isEqual:v21] && (objc_msgSend(v9, "isEqual:", v22))
          {
            id v17 = v20;

            goto LABEL_21;
          }
        }
        id v17 = (id)[v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v17) {
          continue;
        }
        break;
      }
LABEL_21:
      id v5 = v24;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)addWidgetStackToCurrentPage
{
  id v16 = [(SBHIconManager *)self rootFolder];
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 testSetupHomeScreenForWidgetScrollPerformanceTest:self];
    id v5 = [[SBHTestWidgetStackIconDescriptor alloc] initWithWidgetIconDescriptors:v4];
    id v6 = [(SBHIconManager *)self _iconForDescriptor:v5];

    id v7 = [v6 iconDataSources];
    uint64_t v8 = [v7 objectAtIndex:2];
    [v6 setActiveDataSource:v8];

    uint64_t v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v11 = [v16 todayList];
      id v12 = (id)[v11 insertIcon:v6 atIndex:0];
      uint64_t v13 = [(SBHIconManager *)self _effectiveTodayViewController];
      uint64_t v14 = [v13 listView];
      [v14 layoutIconsNow];
    }
    else
    {
      id v11 = [(SBHIconManager *)self rootFolderController];
      uint64_t v13 = [v11 folderView];
      uint64_t v14 = objc_msgSend(v16, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", objc_msgSend(v13, "iconListModelIndexForPageIndex:", objc_msgSend(v13, "currentPageIndex")), 0, -[SBHIconManager gridCellInfoOptions](self, "gridCellInfoOptions"));
      id v15 = (id)[v16 insertIcon:v6 atGridPath:v14 options:2];
      [v11 layoutIconListsWithAnimationType:-1 forceRelayout:0];
    }
  }
}

- (id)widgetIconWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 sizeClass:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[SBWidgetIcon alloc] initWithWidgetExtensionIdentifiers:v9 widgetKinds:v8];

  [(SBIcon *)v10 setGridSizeClass:v7];
  return v10;
}

- (void)addWidgets:(id)a3 toGridPath:(id)a4 overflowOptions:(unint64_t)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SBHIconManager *)self rootFolder];
  if ([(SBHIconManager *)self prototypeSettingSimpleBottomSnaking])
  {
    unint64_t v78 = a5;
    id v11 = [(SBHIconManager *)self iconGridSizeClassSizes];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v91 objects:v105 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = v10;
      LODWORD(v15) = 0;
      uint64_t v16 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v92 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = [*(id *)(*((void *)&v91 + 1) + 8 * i) gridSizeClass];
          unint64_t v15 = [v11 gridSizeAreaForGridSizeClass:v18] + v15;
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v91 objects:v105 count:16];
      }
      while (v13);
      uint64_t v10 = v14;
    }
    else
    {
      unint64_t v15 = 0;
    }

    long long v20 = [v10 listAtGridPath:v9];
    uint64_t v21 = [v20 numberOfIcons];
    uint64_t v22 = [v20 maxNumberOfIcons];
    if (v22 - v21 > v15) {
      uint64_t v23 = -1;
    }
    else {
      uint64_t v23 = v22 - v15;
    }
    uint64_t v80 = v23;
    if (v23 < 0 || (uint64_t v24 = v21 - 1, v21 - 1 < 0))
    {
      long long v68 = SBLogWidgetDiscoverabilityMigration();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7F0A000, v68, OS_LOG_TYPE_DEFAULT, "Nothing to bump for onboarding widgets", buf, 2u);
      }

      id v69 = (id)[v10 insertIcons:obj atGridPath:v9 options:v78];
    }
    else
    {
      uint64_t v77 = [v10 indexOfList:v20];
      double v75 = [MEMORY[0x1E4F1CA48] array];
      BOOL v79 = [MEMORY[0x1E4F1CA48] array];
      id v76 = v8;
      if ([(SBHIconManager *)self prototypeSettingBumpLeastUsedApps])
      {
        uint64_t v72 = v21;
        unint64_t v25 = v21 - v80;
        long long v26 = [(SBHIconManager *)self atxIconRanker];

        if (!v26)
        {
          id v27 = objc_alloc_init(MEMORY[0x1E4F4B0A0]);
          [(SBHIconManager *)self setAtxIconRanker:v27];
        }
        uint64_t v71 = v21 - 1;
        id v74 = v9;
        long long v28 = [(SBHIconManager *)self atxIconRanker];
        long long v29 = [v28 iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:v77];

        uint64_t v30 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v29];
        long long v31 = [v30 array];

        unint64_t v32 = [v29 count];
        if (v25 >= v32) {
          unint64_t v33 = v32;
        }
        else {
          unint64_t v33 = v25;
        }
        uint64_t v34 = objc_msgSend(v31, "subarrayWithRange:", 0, v33);

        uint64_t v35 = SBLogWidgetDiscoverabilityMigration();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v96 = v29;
          __int16 v97 = 2112;
          v98 = v34;
          _os_log_impl(&dword_1D7F0A000, v35, OS_LOG_TYPE_DEFAULT, "Home screen icon index ranking: %@, trimed ranking: %@", buf, 0x16u);
        }
        long long v70 = v29;
        id v73 = v10;

        uint64_t v36 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecordOriginalIndex];
        [v36 addObjectsFromArray:v34];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v81 = v34;
        uint64_t v37 = [v81 countByEnumeratingWithState:&v87 objects:v104 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v88;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v88 != v39) {
                objc_enumerationMutation(v81);
              }
              unint64_t v41 = [*(id *)(*((void *)&v87 + 1) + 8 * j) integerValue];
              if (v41 < [v20 numberOfIcons])
              {
                id v42 = [v20 iconAtIndex:v41];
                uint64_t v43 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
                [v43 addObject:v42];

                if (!v41) {
                  goto LABEL_36;
                }
                unint64_t v44 = v41 - 1;
                if (v44 >= [v20 numberOfIcons])
                {
                  uint64_t v45 = [v20 lastIcon];
                  if (!v45) {
                    goto LABEL_36;
                  }
LABEL_34:
                  id v46 = v45;
                  id v47 = v46;
                }
                else
                {
                  uint64_t v45 = [v20 iconAtIndex:v44];
                  if (v45) {
                    goto LABEL_34;
                  }
LABEL_36:
                  id v46 = [MEMORY[0x1E4F1CA98] null];
                  id v47 = 0;
                }
                uint64_t v48 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                [v48 setObject:v46 forKey:v42];

                continue;
              }
            }
            uint64_t v38 = [v81 countByEnumeratingWithState:&v87 objects:v104 count:16];
          }
          while (v38);
        }

        long long v49 = SBLogWidgetDiscoverabilityMigration();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          id v50 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
          long long v51 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
          *(_DWORD *)buf = 138412546;
          id v96 = v50;
          __int16 v97 = 2112;
          v98 = v51;
          _os_log_impl(&dword_1D7F0A000, v49, OS_LOG_TYPE_DEFAULT, "Adding onboarding widgets by overflow icons: %@ \n usage record: %@", buf, 0x16u);
        }
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v52 = [v20 icons];
        uint64_t v53 = [v52 countByEnumeratingWithState:&v83 objects:v103 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v84;
          do
          {
            for (uint64_t k = 0; k != v54; ++k)
            {
              if (*(void *)v84 != v55) {
                objc_enumerationMutation(v52);
              }
              uint64_t v57 = *(void *)(*((void *)&v83 + 1) + 8 * k);
              long long v58 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
              int v59 = [v58 containsObject:v57];

              if (v59)
              {
                [v20 removeIcon:v57];
                [v20 addIcon:v57];
              }
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v83 objects:v103 count:16];
          }
          while (v54);
        }

        uint64_t v10 = v73;
        id v9 = v74;
        uint64_t v24 = v71;
        uint64_t v21 = v72;
      }
      unint64_t v60 = v77 + 1;
      if (v24 >= v80)
      {
        do
        {
          unint64_t v61 = v21 - 1;
          if (v61 >= [v20 numberOfIcons]) {
            break;
          }
          [v20 iconAtIndex:v61];
          long long v63 = v62 = v61;
          [v20 removeIcon:v63];
          [v75 insertObject:v63 atIndex:0];
          long long v64 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v62 listIndex:v60];
          [v79 insertObject:v64 atIndex:0];

          uint64_t v21 = v62;
        }
        while (v62 > v80);
      }
      if ([v10 listCount] <= v60) {
        id v65 = (id)[v10 addEmptyList];
      }
      long long v66 = SBLogWidgetDiscoverabilityMigration();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v96 = obj;
        __int16 v97 = 2112;
        v98 = v10;
        __int16 v99 = 2112;
        id v100 = v9;
        __int16 v101 = 1024;
        int v102 = v78;
        _os_log_impl(&dword_1D7F0A000, v66, OS_LOG_TYPE_DEFAULT, "Insert icons(%@) to rootFolder(%@) at gridPath(%@) with overflowOptions(%d)", buf, 0x26u);
      }

      id v67 = (id)[v10 insertIcons:obj atGridPath:v9 options:v78];
      [v10 _swapInsertIcons:v75 atIndexPaths:v79];

      id v8 = v76;
    }
  }
  else
  {
    id v19 = (id)[v10 insertIcons:v8 atGridPath:v9 options:a5];
  }
}

- (void)addWidgetWithIdentifier:(id)a3 toPage:(int64_t)a4 withSizeClass:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v12 count:1];

  -[SBHIconManager addWidgetStackWithIdentifiers:toPage:withSizeClass:](self, "addWidgetStackWithIdentifiers:toPage:withSizeClass:", v11, a4, v9, v12, v13);
}

- (void)addWidgetStackWithIdentifiers:(id)a3 toPage:(int64_t)a4 withSizeClass:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a5;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v25 = self;
  id v11 = [(SBHIconManager *)self rootFolder];
  uint64_t v24 = [v11 gridPathWithListAtIndex:a4 gridCellIndex:0 listGridCellInfoOptions:0];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v18 containsString:@","])
        {
          id v19 = [v18 componentsSeparatedByString:@","];

          long long v20 = [v19 objectAtIndexedSubscript:0];
          [v9 addObject:v20];

          if ((unint64_t)[v19 count] < 2) {
            [MEMORY[0x1E4F1CA98] null];
          }
          else {
          uint64_t v21 = [v19 objectAtIndexedSubscript:1];
          }
          unint64_t v15 = v19;
        }
        else
        {
          [v9 addObject:v18];
          uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
        }
        [v10 addObject:v21];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  uint64_t v22 = [(SBHIconManager *)v25 widgetIconWithWidgetExtensionIdentifiers:v9 widgetKinds:v10 sizeClass:v26];
  long long v31 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [(SBHIconManager *)v25 addWidgets:v23 toGridPath:v24 overflowOptions:2];
}

- (void)removeFirstWidgetFromRootFolderListAtIndex:(unint64_t)a3
{
  id v7 = [(SBHIconManager *)self rootFolder];
  uint64_t v4 = [v7 listAtIndex:a3];
  id v5 = [v4 directlyContainedIconsPassingTest:&__block_literal_global_360];
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    [v7 removeIcon:v6 options:0x800000];
  }
}

uint64_t __61__SBHIconManager_removeFirstWidgetFromRootFolderListAtIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWidgetIcon];
}

- (void)addDebugIconOfSizeClass:(id)a3 toPage:(unint64_t)a4 iconIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(SBLeafIcon *)[SBDebugIcon alloc] initWithUniqueLeafIdentifier];
  [(SBIcon *)v9 setGridSizeClass:v8];

  id v10 = [(SBHIconManager *)self rootFolder];
  id v11 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:a5 listIndex:a4];
  id v14 = v11;
  id v12 = (id)[v10 insertIcon:v9 atIndexPath:&v14 options:2];
  id v13 = v14;
}

- (void)addDebugIconOfSizeClass:(id)a3 toPage:(unint64_t)a4 coordinate:(SBIconCoordinate)a5
{
  int64_t row = a5.row;
  int64_t column = a5.column;
  id v9 = a3;
  -[SBHIconManager addDebugIconOfSizeClass:toPage:coordinate:orientation:](self, "addDebugIconOfSizeClass:toPage:coordinate:orientation:", v9, a4, column, row, [(SBHIconManager *)self interfaceOrientation]);
}

- (void)addDebugIconOfSizeClass:(id)a3 toPage:(unint64_t)a4 coordinate:(SBIconCoordinate)a5 orientation:(int64_t)a6
{
  int64_t row = a5.row;
  int64_t column = a5.column;
  id v11 = a3;
  id v21 = [(SBHIconManager *)self rootFolder];
  id v12 = [v21 listAtIndex:a4];
  unint64_t v13 = [(SBHIconManager *)self gridCellInfoOptionsForOrientation:a6];
  id v14 = [v12 gridCellInfoWithOptions:v13];
  uint64_t v15 = objc_msgSend(v14, "gridCellIndexForCoordinate:", column, row);
  uint64_t v16 = [SBHIconGridPath alloc];
  id v17 = [v12 uniqueIdentifier];
  uint64_t v18 = [(SBHIconGridPath *)v16 initWithFolderIdentifier:0 listIdentifier:v17 gridCellIndex:v15 gridCellInfoOptions:v13];

  id v19 = [(SBLeafIcon *)[SBDebugIcon alloc] initWithUniqueLeafIdentifier];
  [(SBIcon *)v19 setGridSizeClass:v11];

  id v20 = (id)[v21 insertIcon:v19 atGridPath:v18 options:2];
}

- (id)debuggingActiveWidgetInfo
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v40 = 0;
  unint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SBHIconManager_debuggingActiveWidgetInfo__block_invoke;
  aBlock[3] = &unk_1E6AB3EB0;
  id v18 = v3;
  id v28 = v18;
  long long v29 = &v40;
  long long v30 = &v36;
  long long v31 = &v32;
  uint64_t v4 = _Block_copy(aBlock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __43__SBHIconManager_debuggingActiveWidgetInfo__block_invoke_2;
  v25[3] = &unk_1E6AB3ED8;
  id v5 = v4;
  id v26 = v5;
  [(SBHIconManager *)self enumerateDisplayedIconViewsUsingBlock:v25];
  id v6 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __43__SBHIconManager_debuggingActiveWidgetInfo__block_invoke_3;
  v23[3] = &unk_1E6AB3F00;
  id v7 = v5;
  id v24 = v7;
  [v6 enumerateAllViewControllersUsingBlock:v23];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(NSMapTable *)self->_iconViewsForCustomIconImageViewController keyEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v13 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v15 = [v12 contentViewController];
          (*((void (**)(id, void *))v7 + 2))(v7, v15);
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v44 count:16];
    }
    while (v9);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4FA6A60]);
  [v16 setLiveWidgetCount:v41[3]];
  [v16 setStaticWidgetCount:v37[3]];
  [v16 setFakeWidgetCount:v33[3]];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v16;
}

void __43__SBHIconManager_debuggingActiveWidgetInfo__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    id v3 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v5 = [v9 presentationMode];
      if (v5 != 1 && v5 != 3)
      {
        id v6 = v9;
        if (v5 != 2)
        {
LABEL_11:
          [*(id *)(a1 + 32) addObject:v6];
          goto LABEL_12;
        }
        id v7 = (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
LABEL_10:
        ++*v7;
        goto LABEL_11;
      }
      uint64_t v8 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 56);
    }
    id v7 = (void *)(*(void *)(v8 + 8) + 24);
    id v6 = v9;
    goto LABEL_10;
  }
LABEL_12:
}

void __43__SBHIconManager_debuggingActiveWidgetInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 customIconImageViewController];
  if (objc_msgSend(v3, "sbh_isWidgetStackViewController"))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = objc_msgSend(v3, "widgetViewControllers", 0);
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
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "sbh_isMultiplexingViewController"))
          {
            id v10 = [v9 multiplexedViewController];
          }
          else
          {
            id v10 = v9;
          }
          id v11 = v10;
          if (v10) {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

uint64_t __43__SBHIconManager_debuggingActiveWidgetInfo__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUsageMonitoringEnabled:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_usageMonitoringEnabled != a3)
  {
    BOOL v3 = a3;
    self->_usageMonitoringEnabled = a3;
    if (a3) {
      uint64_t v5 = [[SBHHomeScreenUsageMonitor alloc] initWithIconManager:self];
    }
    else {
      uint64_t v5 = 0;
    }
    [(SBHIconManager *)self setUsageMonitor:v5];
    uint64_t v6 = [(SBHIconManager *)self todayViewControllers];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v3) {
            [v11 addObserver:self];
          }
          else {
            [v11 removeObserver:self];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)dismissFolderPageManagementUI
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  [v2 exitPageManagementUIWithCompletionHandler:0];
}

- (id)silhouetteLayoutForPageAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBHIconManager *)self rootFolderController];
  if ([v5 iconListViewCount] <= a3)
  {
    long long v68 = 0;
  }
  else
  {
    uint64_t v6 = [v5 rootFolderView];
    uint64_t v7 = [v5 iconListViewAtIndex:a3];
    [v6 bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v7 bounds];
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    CGFloat v98 = v9;
    v124.origin.double x = v9;
    double v92 = v11;
    double v93 = v13;
    v124.origin.double y = v11;
    v124.size.double width = v13;
    CGFloat v24 = v15;
    v124.size.double height = v15;
    CGFloat Height = CGRectGetHeight(v124);
    __int16 v97 = [v7 requireAllIconsShownForReason:@"silhouetteLayout"];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke;
    aBlock[3] = &unk_1E6AB3F28;
    double v94 = Height;
    CGFloat v122 = Height;
    id v96 = v26;
    id v121 = v96;
    long long v27 = _Block_copy(aBlock);
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke_2;
    v113[3] = &unk_1E6AB3F50;
    id v28 = v27;
    id v115 = v28;
    id v114 = v7;
    uint64_t v116 = v17;
    uint64_t v117 = v19;
    uint64_t v118 = v21;
    uint64_t v119 = v23;
    id v95 = v114;
    [v114 enumerateIconViewsUsingBlock:v113];
    long long v29 = [(SBHIconManager *)self floatingDockViewController];
    if (v29)
    {
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke_3;
      v106[3] = &unk_1E6AB3F78;
      id v108 = v28;
      long long v30 = v6;
      id v31 = v6;
      id v107 = v31;
      CGFloat v32 = v92;
      CGFloat v33 = v93;
      CGFloat v109 = v9;
      double v110 = v92;
      double v111 = v93;
      CGFloat v112 = v24;
      [v29 enumerateDisplayedIconViewsUsingBlock:v106];
      uint64_t v34 = [v29 dockView];
      uint64_t v35 = [v34 backgroundView];
      uint64_t v36 = [v34 window];
      uint64_t v37 = [v36 screen];
      uint64_t v38 = [v37 coordinateSpace];

      [v35 frame];
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      id v47 = [v35 superview];
      objc_msgSend(v47, "convertRect:toCoordinateSpace:", v38, v40, v42, v44, v46);
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;

      long long v56 = v31;
      uint64_t v6 = v30;
      objc_msgSend(v56, "convertRect:fromCoordinateSpace:", v38, v49, v51, v53, v55);
      CGFloat v58 = v57;
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      [v34 currentDockContinuousCornerRadius];
      double v66 = v65;

      id v67 = v108;
    }
    else
    {
      id v67 = [v5 dockIconListView];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke_4;
      v99[3] = &unk_1E6AB3F50;
      id v101 = v28;
      id v69 = v6;
      id v100 = v69;
      CGFloat v32 = v92;
      CGFloat v33 = v93;
      CGFloat v102 = v9;
      double v103 = v92;
      double v104 = v93;
      CGFloat v105 = v24;
      [v67 enumerateIconViewsUsingBlock:v99];
      long long v70 = [v69 dockView];
      uint64_t v71 = [v70 backgroundView];
      [v71 frame];
      double v73 = v72;
      double v75 = v74;
      double v77 = v76;
      double v79 = v78;
      uint64_t v80 = [v71 superview];
      objc_msgSend(v69, "convertRect:fromView:", v80, v73, v75, v77, v79);
      CGFloat v58 = v81;
      CGFloat v60 = v82;
      CGFloat v62 = v83;
      CGFloat v64 = v84;

      [v71 _cornerRadius];
      double v66 = v85;
    }
    double v86 = SBHNormalizedRectFromSubRect(v98, v32, v33, v24, v58, v60, v62, v64);
    long long v90 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6AC0]), "initWithFrame:cornerRadius:", v86, v87, v88, v89, v66 / v94);
    [v97 invalidate];
    long long v68 = (void *)[objc_alloc(MEMORY[0x1E4FA6AF0]) initWithIcons:v96 dock:v90];
  }
  return v68;
}

void __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a3;
  id v14 = a2;
  [v14 iconImageVisibleFrame];
  objc_msgSend(v13, "convertRect:fromView:", v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  double v23 = SBHNormalizedRectFromSubRect(a4, a5, a6, a7, v16, v18, v20, v22);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [v14 iconImageInfo];
  double v31 = v30;

  id v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6AC0]), "initWithFrame:cornerRadius:", v23, v25, v27, v29, v31 / *(double *)(a1 + 40));
  [*(id *)(a1 + 32) addObject:v32];
}

uint64_t __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __49__SBHIconManager_silhouetteLayoutForPageAtIndex___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)iconsToRecacheForIconStylePickerPreview
{
  id v2 = [(SBHIconManager *)self rootViewController];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __57__SBHIconManager_iconsToRecacheForIconStylePickerPreview__block_invoke;
  v6[3] = &unk_1E6AAD830;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateDisplayedIconViewsUsingBlock:v6];

  return v4;
}

void __57__SBHIconManager_iconsToRecacheForIconStylePickerPreview__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 icon];
  [*(id *)(a1 + 32) addObject:v4];
  if ([v4 isFolderIcon])
  {
    uint64_t v5 = [v4 folder];
    uint64_t v6 = [v3 visibleMiniIconListIndex];
    uint64_t v7 = [v3 firstVisibleMiniIconIndex];
    uint64_t v8 = [v3 lastVisibleMiniIconIndex];
    CGFloat v9 = [v5 listAtIndex:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __57__SBHIconManager_iconsToRecacheForIconStylePickerPreview__block_invoke_2;
    v10[3] = &unk_1E6AB3FA0;
    uint64_t v12 = v7;
    uint64_t v13 = v8;
    id v11 = *(id *)(a1 + 32);
    [v9 enumerateIconsUsingBlock:v10];
  }
}

void __57__SBHIconManager_iconsToRecacheForIconStylePickerPreview__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40) <= a3 && *(void *)(a1 + 48) >= a3)
  {
    id v6 = v5;
    [*(id *)(a1 + 32) addObject:v5];
    id v5 = v6;
  }
}

- (id)iconViewsToPreviewForIconStylePicker
{
  id v2 = [(SBHIconManager *)self rootViewController];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __54__SBHIconManager_iconViewsToPreviewForIconStylePicker__block_invoke;
  v6[3] = &unk_1E6AAD830;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateDisplayedIconViewsUsingBlock:v6];

  return v4;
}

uint64_t __54__SBHIconManager_iconViewsToPreviewForIconStylePicker__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSString)description
{
  return (NSString *)[(SBHIconManager *)self descriptionWithMultilinePrefix:@"\t"];
}

- (void)cancelAllDrags
{
  id v2 = [(SBHIconManager *)self iconDragManager];
  [v2 cancelAllDrags];
}

- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v6 iconManagerCanBeginIconDrags:self]
    || (objc_opt_respondsToSelector() & 1) != 0
    && ![v6 iconManager:self canBeginDragForIconView:v5]
    || ([(SBHIconManager *)self reasonToDisallowInteractionOnIconView:v5],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [v5 draggingStartLocation];
    double v10 = (void *)MEMORY[0x1E4F4B7E0];
    id v11 = [v5 icon];
    uint64_t v12 = [v11 applicationBundleID];
    uint64_t v13 = [v10 applicationWithBundleIdentifier:v12];

    BOOL v8 = v9 != 4 || ([v13 isHidden] & 1) == 0;
  }

  return v8;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v7 = a4;
  [(SBHIconManager *)self _restartEditingEndTimer];
  id v8 = [v7 icon];

  [(SBHIconManager *)self clearHighlightedIcon:v8];
}

- (void)iconDragManagerIconDraggingDidChange:(id)a3
{
  uint64_t v4 = [a3 isIconDragging];
  [(SBHIconManager *)self _restartEditingEndTimer];
  id v5 = [(SBHIconManager *)self rootFolderController];
  [v5 setAllowsAutoscrollToLeadingCustomView:v4 ^ 1];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SBHIconManagerIconDraggingChanged" object:self];

  id v7 = [(SBHIconManager *)self searchGesture];
  [v7 setDisabled:v4 forReason:@"SBHIconManager Dragging"];

  [(SBHIconManager *)self _updateVisibleIconsViewsForAllowableCloseBoxes];
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManagerIconDraggingDidChange:self];
  }
}

- (void)iconDragManager:(id)a3 wantsAnimatedRemovalOfIcon:(id)a4
{
}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 iconManager:self dragPreviewForIconView:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 windowForIconDragPreviewsForIconManager:self forWindowScene:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  double v15 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v16 = [v15 iconManager:self targetedDragPreviewForIconView:v11 item:v12 session:v13 previewParameters:v14];
  }
  else
  {
    CGFloat v16 = 0;
  }

  return v16;
}

- (id)rootViewForIconDragManager:(id)a3
{
  id v3 = [(SBHIconManager *)self rootFolderController];
  uint64_t v4 = [v3 view];

  return v4;
}

- (void)iconDragManager:(id)a3 willBeginIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  id v8 = a4;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self willBeginIconDragWithUniqueIdentifier:v8 numberOfDraggedItems:a5];
  }
}

- (void)iconDragManager:(id)a3 didAddItemsToIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  id v8 = a4;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self didAddItemsToIconDragWithUniqueIdentifier:v8 numberOfDraggedItems:a5];
  }
}

- (void)iconDragManager:(id)a3 didEndIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  id v8 = a4;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self didEndIconDragWithUniqueIdentifier:v8 numberOfDraggedItems:a5];
  }
}

- (void)iconDragManager:(id)a3 iconDropSessionDidEnter:(id)a4
{
  id v6 = a4;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self iconDropSessionDidEnter:v6];
  }
}

- (BOOL)iconDragManager:(id)a3 canBeginDragForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 iconManager:self canBeginDragForIconView:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = [v9 iconManager:self canAddDragItemsToSession:v7 fromIconView:v8];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)iconDragManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = [v9 iconManager:self canAcceptDropInSession:v7 inIconListView:v8];
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (double)iconDragManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  double v7 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v6 iconManager:self additionalDragLiftScaleForIconView:v5];
    double v7 = v8;
  }

  return v7;
}

- (int64_t)iconDragManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5
{
  id v7 = a4;
  double v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    a5 = [v8 iconManager:self draggingStartLocationForIconView:v7 proposedStartLocation:a5];
  }

  return a5;
}

- (void)presentTodayOverlayForIconDragManager:(id)a3
{
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 presentTodayOverlayForIconManager:self];
  }
}

- (void)dismissTodayOverlayForIconDragManager:(id)a3
{
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 dismissTodayOverlayForIconManager:self];
  }
}

- (void)presentLibraryForIconDragManager:(id)a3 windowScene:(id)a4
{
  id v6 = a4;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 presentLibraryForIconManager:self windowScene:v6 animated:1];
  }
}

- (void)dismissLibraryForIconDragManager:(id)a3 windowScene:(id)a4
{
  id v6 = a4;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 dismissLibraryForIconManager:self windowScene:v6 animated:1];
  }
}

- (double)defaultIconLayoutAnimationDurationForIconDragManager:(id)a3
{
  id v3 = objc_opt_class();
  [v3 defaultIconLayoutAnimationDuration];
  return result;
}

- (BOOL)iconDragManager:(id)a3 shouldDuplicateIconsInDragSession:(id)a4
{
  id v4 = objc_msgSend(a4, "items", a3);
  id v5 = [v4 firstObject];
  id v6 = objc_msgSend(v5, "sbh_appDragLocalContext");
  BOOL v7 = [v6 startLocation] == 4;

  return v7;
}

- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4
{
  return SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", a4);
}

- (void)iconDragManager:(id)a3 didSpringLoadIconView:(id)a4
{
  id v6 = a4;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self didSpringLoadIconView:v6];
  }
}

- (id)iconDragManager:(id)a3 launchActionsForIconView:(id)a4
{
  return [(SBHIconManager *)self launchActionsForIconView:a4];
}

- (id)iconDragManager:(id)a3 launchURLForIconView:(id)a4
{
  return [(SBHIconManager *)self launchURLForIconView:a4];
}

- (void)iconDragManager:(id)a3 folderController:(id)a4 draggedIconShouldDropFromListView:(id)a5
{
}

- (BOOL)iconDragManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 iconManager:self dragsSupportSystemDragsForIconView:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)iconDragManager:(id)a3 localizedFolderNameForCombiningIcon:(id)a4 withIcon:(id)a5
{
  return [(SBHIconManager *)self _proposedFolderNameForGrabbedIcon:a4 recipientIcon:a5];
}

- (void)iconDragManager:(id)a3 wantsScrollToIconListContainingIcon:(id)a4 animated:(BOOL)a5
{
}

- (void)insertIcons:(id)a3 intoWidgetStack:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHIconManager *)self iconModel];
  [v6 addDataSourcesFromWidgetIcons:v7];

  [v8 removeIcons:v7];
}

- (void)addSuggestedActiveWidgetToStack:(id)a3
{
  id v6 = a3;
  id v4 = [v6 firstSuggestedIconDataSource];
  id v5 = [(SBHIconManager *)self promoteSuggestedWidget:v4 withinStack:v6];
}

- (id)promoteSuggestedWidget:(id)a3 withinStack:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v9 = 0;
  if (!v6 || !v7) {
    goto LABEL_18;
  }
  char v10 = [v6 uniqueIdentifier];
  id v11 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  id v12 = [v11 viewControllerForIdentifier:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![v6 suggestionSource]) {
      NSLog(&cfstr_SbhwidgetDoesN.isa);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = 0;
      goto LABEL_11;
    }
    if (![v6 suggestionSource]) {
      NSLog(&cfstr_FakewidgetDoes.isa);
    }
  }
  uint64_t v9 = (void *)[v6 copyWithSuggestionSource:0];
LABEL_11:
  [v8 replaceIconDataSource:v6 withIconDataSource:v9];
  id v13 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v15 = [v12 widget];
    CGFloat v16 = [v15 intentReference];
    double v17 = [v16 intent];

    if (v17)
    {
      CGFloat v18 = [v15 extensionIdentity];
      double v23 = [v18 extensionBundleIdentifier];

      double v19 = [v15 kind];
      CGFloat v20 = SBLogIcon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        double v25 = v23;
        __int16 v26 = 2112;
        double v27 = v19;
        __int16 v28 = 2112;
        double v29 = v17;
        _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "Saving intent for 'added' suggested widget (%@ - %@): %@", buf, 0x20u);
      }

      [(SBHIconManager *)self _archiveConfiguration:v17 forDataSource:v9 ofIcon:v8];
    }
  }
  double v21 = [(SBHIconManager *)self usageMonitor];
  [v21 noteUserAddedWidgetIconStackSuggestion:v8];

LABEL_18:
  return v9;
}

- (void)hideSuggestedWidgetFromStack:(id)a3
{
  id v5 = a3;
  id v4 = [(SBHIconManager *)self usageMonitor];
  [v4 noteUserDislikedWidgetIconStackSuggestion:v5];

  [v5 removeFirstSuggestedIconDataSource];
}

- (void)hideSiriSuggestionOnWidgetFromStack:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self usageMonitor];
  [v5 noteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:v4];
}

- (void)removeWidget:(id)a3 fromStack:(id)a4
{
}

- (id)gridPathForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = objc_msgSend(v5, "gridPathForIcon:listGridCellInfoOptions:", v4, -[SBHIconManager gridCellInfoOptions](self, "gridCellInfoOptions"));

  return v6;
}

- (void)saveGridPath:(id)a3 asPriorLocationBeforeResizeForIcon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  previousIconGridPathsBeforeResize = self->_previousIconGridPathsBeforeResize;
  if (!previousIconGridPathsBeforeResize)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v9 = self->_previousIconGridPathsBeforeResize;
    self->_previousIconGridPathsBeforeResize = v8;

    previousIconGridPathsBeforeResize = self->_previousIconGridPathsBeforeResize;
  }
  [(NSMapTable *)previousIconGridPathsBeforeResize setObject:v10 forKey:v6];
}

- (void)changeSizeOfWidgetIcon:(id)a3 toSizeClass:(id)a4
{
}

- (void)changeSizeOfWidgetIcon:(id)a3 toSizeClass:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = [(SBHIconManager *)self rootFolder];
  id v14 = [v13 indexPathForIcon:v10];
  if (v14)
  {
    uint64_t v15 = [v10 gridSizeClass];
    if ((id)v15 == v11)
    {
    }
    else
    {
      CGFloat v16 = (void *)v15;
      double v17 = [v10 gridSizeClass];
      int v18 = [v17 isEqualToString:v11];

      if (!v18)
      {
        __int16 v28 = [(SBHIconManager *)self prepareForUndo];
        double v19 = [(SBHIconManager *)self delegate];
        CGFloat v20 = [(SBHIconManager *)self makeResizedCopyOfWidgetIcon:v10 withGridSizeClass:v11];
        if (objc_opt_respondsToSelector()) {
          [v19 iconManager:self willChangeSizeOfIcon:v10 toSizeClass:v11 byReplacingWithIcon:v20];
        }
        double v27 = v19;
        id v32 = [(SBHIconManager *)self preWarmCustomViewControllerForWidgetIcon:v20];
        double v21 = [(SBHIconManager *)self iconListViewForIndexPath:v14];
        CGFloat v22 = [v21 displayedIconViewForIcon:v10];
        double v31 = [(NSMapTable *)self->_previousIconGridPathsBeforeResize objectForKey:v10];
        [(SBHIconManager *)self gridPathForIcon:v10];
        v30 = double v29 = v22;
        if (v22)
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __80__SBHIconManager_changeSizeOfWidgetIcon_toSizeClass_animated_completionHandler___block_invoke;
          v33[3] = &unk_1E6AB3FD0;
          v33[4] = self;
          id v34 = v10;
          id v35 = v11;
          id v36 = v20;
          id v37 = v22;
          id v38 = v21;
          id v39 = v32;
          double v23 = v20;
          BOOL v24 = a5;
          double v25 = v28;
          id v40 = v28;
          id v41 = v31;
          id v42 = v30;
          BOOL v44 = v24;
          CGFloat v20 = v23;
          double v43 = v12;
          [v37 performAfterContextMenusDismissUsingBlock:v33];
        }
        else
        {
          LOBYTE(v26) = a5;
          double v25 = v28;
          [(SBHIconManager *)self continueChangingSizeOfWidgetIcon:v10 toSizeClass:v11 newIcon:v20 displayedIconView:0 listView:v21 resizedViewController:v32 undoPreparation:v28 previousIconGridPath:v31 currentIconGridPath:v30 animated:v26 completionHandler:v12];
        }

        goto LABEL_13;
      }
    }
  }
  if (v12) {
    v12[2](v12);
  }
LABEL_13:
}

uint64_t __80__SBHIconManager_changeSizeOfWidgetIcon_toSizeClass_animated_completionHandler___block_invoke(uint64_t a1)
{
  LOBYTE(v2) = *(unsigned char *)(a1 + 120);
  return [*(id *)(a1 + 32) continueChangingSizeOfWidgetIcon:*(void *)(a1 + 40) toSizeClass:*(void *)(a1 + 48) newIcon:*(void *)(a1 + 56) displayedIconView:*(void *)(a1 + 64) listView:*(void *)(a1 + 72) resizedViewController:*(void *)(a1 + 80) undoPreparation:*(void *)(a1 + 88) previousIconGridPath:*(void *)(a1 + 96) currentIconGridPath:*(void *)(a1 + 104) animated:v2 completionHandler:*(void *)(a1 + 112)];
}

- (void)continueChangingSizeOfWidgetIcon:(id)a3 toSizeClass:(id)a4 newIcon:(id)a5 displayedIconView:(id)a6 listView:(id)a7 resizedViewController:(id)a8 undoPreparation:(id)a9 previousIconGridPath:(id)a10 currentIconGridPath:(id)a11 animated:(BOOL)a12 completionHandler:(id)a13
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v43 = a9;
  id v45 = a10;
  id v22 = a13;
  id v38 = a11;
  double v23 = [(SBHIconManager *)self delegate];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __204__SBHIconManager_continueChangingSizeOfWidgetIcon_toSizeClass_newIcon_displayedIconView_listView_resizedViewController_undoPreparation_previousIconGridPath_currentIconGridPath_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6AB0368;
  id v40 = v23;
  id v49 = v40;
  double v50 = self;
  id v42 = v46;
  id v51 = v42;
  id v41 = v18;
  id v52 = v41;
  id v24 = v19;
  id v53 = v24;
  id v39 = v22;
  id v54 = v39;
  double v25 = (void (**)(void))_Block_copy(aBlock);
  id v47 = v21;
  BOOL v44 = v20;
  if (a12)
  {
    uint64_t v26 = [(SBHIconManager *)self widgetMetricsProvider];
    double v27 = [[SBIconListViewIconSizeChangeAnimator alloc] initWithIconView:v20 iconListView:v21 widgetMetricsProvider:v26];
    [(SBIconListViewIconSizeChangeAnimator *)v27 setDelegate:self];
    [(SBIconListViewIconSizeChangeAnimator *)v27 addAnimationCompletionHandler:v25];
  }
  else
  {
    double v27 = 0;
  }
  __int16 v28 = [(SBHIconManager *)self iconModel];
  double v29 = [(SBHIconManager *)self rootFolder];
  unint64_t v30 = [(SBHIconManager *)self gridCellInfoOptions];
  v55[0] = v24;
  double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  id v32 = (id)[v29 replaceIcon:v42 withIcons:v31 options:8389634 listGridCellInfoOptions:v30];

  CGFloat v33 = v45;
  if (v45) {
    id v34 = (id)[v29 insertIcon:v24 atGridPath:v45 options:1024];
  }
  [v28 removeIcon:v42];
  [v28 addIcon:v24];
  [v47 layoutIconsIfNeededUsingAnimator:v27 options:0];
  [(SBHIconManager *)self saveGridPath:v38 asPriorLocationBeforeResizeForIcon:v24];

  id v35 = [v47 undoManager];
  if (v35)
  {
    id v36 = SBHBundle();
    id v37 = [v36 localizedStringForKey:@"UNDO_RESIZE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [v43 registerWithUndoManager:v35 actionName:v37 observer:0];

    CGFloat v33 = v45;
  }
  if (!a12) {
    v25[2](v25);
  }
}

uint64_t __204__SBHIconManager_continueChangingSizeOfWidgetIcon_toSizeClass_newIcon_displayedIconView_listView_resizedViewController_undoPreparation_previousIconGridPath_currentIconGridPath_animated_completionHandler___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) iconManager:*(void *)(a1 + 40) didChangeSizeOfIcon:*(void *)(a1 + 48) toSizeClass:*(void *)(a1 + 56) byReplacingWithIcon:*(void *)(a1 + 64)];
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)makeResizedCopyOfWidgetIcon:(id)a3 withGridSizeClass:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v28 = v6;
  id v8 = (void *)[v6 copyWithUniqueLeafIdentifier];
  double v25 = v7;
  [v8 setGridSizeClass:v7];
  uint64_t v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = objc_opt_respondsToSelector();
  }
  else {
    char v10 = 0;
  }
  double v27 = (void *)v9;
  id v11 = [v8 iconDataSources];
  id v12 = (void *)[v11 copy];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    uint64_t v26 = v8;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v18 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0
          || (self,
              id v20 = objc_claimAutoreleasedReturnValue(),
              char v21 = objc_opt_isKindOfClass(),
              v20,
              (v21 & 1) != 0))
        {
          id v22 = (void *)[v17 copyWithUniqueIdentifier];
          [v8 replaceIconDataSource:v17 withIconDataSource:v22];
          if (v22 != 0 && (v10 & 1) != 0)
          {
            double v23 = [v27 iconManager:self configurationDataForDataSource:v17 ofIcon:v28];
            id v8 = v26;
            [v27 iconManager:self dataSource:v22 ofIcon:v26 didUpdateConfigurationData:v23];
          }
        }
        else
        {
          id v22 = 0;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  return v8;
}

- (void)replaceWidgetIconWithAppIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = [v5 indexPathForIcon:v4];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v4;
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

    if (v10)
    {
      id v11 = [(SBHIconManager *)self prepareForUndo];
      id v34 = [(SBHIconManager *)self iconModel];
      id v12 = [(SBHIconManager *)self iconForReplacingWidgetIconWithAppIcon:v8];
      long long v33 = [v5 indexPathForIcon:v12 includingPlaceholders:0];
      id v13 = v12;
      uint64_t v14 = v13;
      if ([v13 isLeafIcon])
      {
        uint64_t v14 = v13;
        if (v33)
        {
          uint64_t v14 = [v34 addAdditionalIconMatchingIcon:v13];
        }
      }
      if (v14)
      {
        long long v32 = v11;
        uint64_t v15 = [(SBHIconManager *)self iconListViewForIndexPath:v6];
        long long v31 = v10;
        CGFloat v16 = [v15 displayedIconViewForIcon:v10];
        double v25 = [(NSMapTable *)self->_previousIconGridPathsBeforeResize objectForKey:v8];
        __int16 v28 = [(SBHIconManager *)self gridPathForIcon:v8];
        double v17 = [(SBHIconManager *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v17 iconManager:self willChangeSizeOfIcon:v8 toSizeClass:@"SBHIconGridSizeClassDefault" byReplacingWithIcon:v14];
        }
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __47__SBHIconManager_replaceWidgetIconWithAppIcon___block_invoke;
        v35[3] = &unk_1E6AB3FF8;
        v35[4] = self;
        id v36 = v16;
        long long v30 = v15;
        id v37 = v30;
        id v27 = v17;
        id v38 = v27;
        id v39 = v8;
        id v18 = v14;
        id v40 = v18;
        id v41 = v5;
        id v19 = v31;
        id v42 = v19;
        id v26 = v25;
        id v43 = v26;
        id v44 = v34;
        id v20 = v28;
        id v45 = v20;
        id v46 = v32;
        id v29 = v36;
        [v36 performAfterContextMenusDismissUsingBlock:v35];
        if (!self->_previousWidgetDataSourceBeforeResize)
        {
          char v21 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          previousWidgetDataSourceBeforeResize = self->_previousWidgetDataSourceBeforeResize;
          self->_previousWidgetDataSourceBeforeResize = v21;
        }
        double v23 = [v19 activeDataSource];
        [(NSMapTable *)self->_previousWidgetDataSourceBeforeResize setObject:v23 forKey:v18];

        id v10 = v31;
        id v11 = v32;
        id v24 = v30;
      }
      else
      {
        id v24 = SBLogWidgets();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[SBHIconManager replaceWidgetIconWithAppIcon:]();
        }
      }
    }
  }
}

void __47__SBHIconManager_replaceWidgetIconWithAppIcon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) widgetMetricsProvider];
  id v3 = [[SBIconListViewIconSizeChangeAnimator alloc] initWithIconView:*(void *)(a1 + 40) iconListView:*(void *)(a1 + 48) widgetMetricsProvider:v2];
  [(SBIconListViewIconSizeChangeAnimator *)v3 setDelegate:*(void *)(a1 + 32)];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __47__SBHIconManager_replaceWidgetIconWithAppIcon___block_invoke_2;
  uint64_t v15 = &unk_1E6AADD48;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v16 = v4;
  uint64_t v17 = v5;
  id v18 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  [(SBIconListViewIconSizeChangeAnimator *)v3 addAnimationCompletionHandler:&v12];
  objc_msgSend(*(id *)(a1 + 80), "replaceIcon:withIcon:options:", *(void *)(a1 + 88), *(void *)(a1 + 72), 8389634, v12, v13, v14, v15);
  uint64_t v6 = *(void *)(a1 + 96);
  if (v6) {
    id v7 = (id)[*(id *)(a1 + 80) insertIcon:*(void *)(a1 + 72) atGridPath:v6 options:1024];
  }
  [*(id *)(a1 + 104) removeIcon:*(void *)(a1 + 88)];
  [*(id *)(a1 + 48) layoutIconsIfNeededUsingAnimator:v3 options:0];
  [*(id *)(a1 + 32) saveGridPath:*(void *)(a1 + 112) asPriorLocationBeforeResizeForIcon:*(void *)(a1 + 72)];
  id v8 = [*(id *)(a1 + 48) undoManager];
  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 120);
    id v10 = SBHBundle();
    id v11 = [v10 localizedStringForKey:@"UNDO_RESIZE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [v9 registerWithUndoManager:v8 actionName:v11 observer:0];
  }
}

uint64_t __47__SBHIconManager_replaceWidgetIconWithAppIcon___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 iconManager:v4 didChangeSizeOfIcon:v5 toSizeClass:@"SBHIconGridSizeClassDefault" byReplacingWithIcon:v6];
  }
  return result;
}

- (id)iconForReplacingWidgetIconWithAppIcon:(id)a3
{
  id v4 = a3;
  if ([v4 isLeafIcon])
  {
    uint64_t v5 = [v4 activeDataSource];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      && ([v5 containerBundleIdentifier], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = (void *)v6;
      id v8 = [(SBHIconManager *)self iconModel];
      uint64_t v9 = [v8 applicationIconForBundleIdentifier:v7];
      id v10 = [(SBHIconManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v11 = [v10 iconManager:self applicationIconForReplacingIconWithAppIcon:v4 proposedApplicationIcon:v9];

        uint64_t v9 = (void *)v11;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)replaceAppIcon:(id)a3 withWidgetOfSize:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHIconManager *)self rootFolder];
  uint64_t v9 = [v8 indexPathForIcon:v6];
  if (v9)
  {
    id v10 = [(SBHIconManager *)self prepareForUndo];
    uint64_t v11 = [(SBHIconManager *)self iconDataSourceForReplacingAppIconWithWidgetIcon:v6];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      long long v31 = v8;
      long long v32 = v10;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [v12 copyWithUniqueIdentifier];

        uint64_t v12 = (void *)v13;
      }
      uint64_t v14 = [(SBLeafIcon *)[SBWidgetIcon alloc] initWithUniqueLeafIdentifier];
      [(SBLeafIcon *)v14 addIconDataSource:v12];
      [(SBIcon *)v14 setGridSizeClass:v7];
      id v29 = [(SBHIconManager *)self preWarmCustomViewControllerForWidgetIcon:v14];
      uint64_t v15 = [(SBHIconManager *)self iconListViewForIndexPath:v9];
      __int16 v28 = [v15 displayedIconViewForIcon:v6];
      id v16 = [(NSMapTable *)self->_previousIconGridPathsBeforeResize objectForKey:v6];
      uint64_t v17 = [(SBHIconManager *)self gridPathForIcon:v6];
      id v18 = [(SBHIconManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v18 iconManager:self willChangeSizeOfIcon:v6 toSizeClass:v7 byReplacingWithIcon:v14];
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __50__SBHIconManager_replaceAppIcon_withWidgetOfSize___block_invoke;
      v33[3] = &unk_1E6AB3FF8;
      id v34 = v29;
      uint64_t v35 = self;
      id v36 = v28;
      id v37 = v15;
      id v38 = v18;
      id v39 = v6;
      id v30 = v7;
      id v40 = v7;
      id v41 = v14;
      id v42 = v31;
      id v43 = v16;
      id v44 = v17;
      id v45 = v32;
      id v19 = v17;
      id v8 = v31;
      id v27 = v19;
      id v26 = v16;
      id v20 = v14;
      id v21 = v18;
      id v10 = v32;
      id v22 = v21;
      id v23 = v15;
      id v24 = v28;
      id v25 = v29;
      [v24 performAfterContextMenusDismissUsingBlock:v33];

      id v7 = v30;
    }
  }
}

void __50__SBHIconManager_replaceAppIcon_withWidgetOfSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) widgetMetricsProvider];
  id v3 = [[SBIconListViewIconSizeChangeAnimator alloc] initWithIconView:*(void *)(a1 + 48) iconListView:*(void *)(a1 + 56) widgetMetricsProvider:v2];
  [(SBIconListViewIconSizeChangeAnimator *)v3 setDelegate:*(void *)(a1 + 40)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__SBHIconManager_replaceAppIcon_withWidgetOfSize___block_invoke_2;
  void v14[3] = &unk_1E6AB4020;
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  id v15 = v4;
  uint64_t v16 = v5;
  id v17 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  [(SBIconListViewIconSizeChangeAnimator *)v3 addAnimationCompletionHandler:v14];
  id v6 = [*(id *)(a1 + 40) iconModel];
  [*(id *)(a1 + 96) replaceIcon:*(void *)(a1 + 72) withIcon:*(void *)(a1 + 88) options:8390154];
  if ([*(id *)(a1 + 40) canAddIconToIgnoredList:*(void *)(a1 + 72)])
  {
    id v7 = [*(id *)(a1 + 96) ignoredList];
    [v7 addIcon:*(void *)(a1 + 72)];
  }
  uint64_t v8 = *(void *)(a1 + 104);
  if (v8) {
    id v9 = (id)[*(id *)(a1 + 96) insertIcon:*(void *)(a1 + 88) atGridPath:v8 options:1024];
  }
  [v6 addIcon:*(void *)(a1 + 88)];
  [*(id *)(a1 + 56) layoutIconsIfNeededUsingAnimator:v3 options:0];
  [*(id *)(a1 + 40) saveGridPath:*(void *)(a1 + 112) asPriorLocationBeforeResizeForIcon:*(void *)(a1 + 88)];
  id v10 = [*(id *)(a1 + 56) undoManager];
  if (v10)
  {
    uint64_t v11 = *(void **)(a1 + 120);
    uint64_t v12 = SBHBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"UNDO_RESIZE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [v11 registerWithUndoManager:v10 actionName:v13 observer:0];
  }
}

uint64_t __50__SBHIconManager_replaceAppIcon_withWidgetOfSize___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    return [v3 iconManager:v4 didChangeSizeOfIcon:v5 toSizeClass:v6 byReplacingWithIcon:v7];
  }
  return result;
}

- (id)iconDataSourceForReplacingAppIconWithWidgetIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_previousWidgetDataSourceBeforeResize objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = [v4 applicationBundleID];
    uint64_t v7 = [(SBHIconManager *)self widgetExtensionProvider];
    uint64_t v8 = objc_msgSend(v7, "sbh_defaultDescriptorForContainerBundleIdentifier:", v6);

    id v9 = [(SBHIconManager *)self gridSizeClassDomain];
    uint64_t v5 = objc_msgSend(v8, "sbh_iconDataSourceInDomain:", v9);
  }
  id v10 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v10 iconManager:self widgetDataSourceForReplacingIconWithWidget:v4 proposedWidgetDataSource:v5];

    uint64_t v5 = (void *)v11;
  }

  return v5;
}

- (id)intentForWidget:(id)a3 ofIcon:(id)a4
{
  return [(SBHIconManager *)self _intentForWidget:a3 ofIcon:a4 creatingIfNecessary:1];
}

- (id)_intentForWidget:(id)a3 ofIcon:(id)a4 creatingIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 uniqueIdentifier];
  id v11 = [(SBHIconManager *)self _intentForDataSource:v8 inIcon:v9 creatingIfNecessary:0];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v13 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
    uint64_t v14 = [v13 viewControllerForIdentifier:v10];

    if (objc_msgSend(v14, "sbh_isWidgetHostViewController"))
    {
      id v15 = [v14 widget];
      uint64_t v16 = [v15 intentReference];
      uint64_t v12 = [v16 intent];
    }
    else
    {
      uint64_t v12 = 0;
    }

    if (!v12 && v5)
    {
      uint64_t v12 = [(SBHIconManager *)self _intentForDataSource:v8 inIcon:v9 creatingIfNecessary:1];
    }
  }

  return v12;
}

- (void)setTemporaryIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 iconManager:self setTemporaryIntent:v11 forIconWithIdentifier:v8 widgetUniqueIdentifier:v9];
  }
}

- (NSDictionary)widgetIntents
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_widgetIntents];
}

- (BOOL)canCloseFolders
{
  uint64_t v2 = [(SBHIconManager *)self iconDragManager];
  char v3 = [v2 isTrackingDroppingIconDrags] ^ 1;

  return v3;
}

- (BOOL)hasOpenFolderInLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self floatingDockViewController];
  if ([v5 isPresentingIconLocation:v4]
    && ([v5 isPresentingFolder] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else if ([(SBHIconManager *)self hasRootFolderController])
  {
    uint64_t v7 = [(SBHIconManager *)self rootViewController];
    if ([v7 isPresentingIconLocation:v4]
      && ([v7 deepestFolderController],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      BOOL v6 = 1;
    }
    else
    {
      id v9 = [(SBHIconManager *)self rootFolderController];
      if ([v9 isPresentingIconLocation:v4]
        && ([v9 deepestFolderController],
            id v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {
        BOOL v6 = 1;
      }
      else
      {
        id v11 = [(SBHIconManager *)self _currentFolderController];
        if ([v11 isPresentingIconLocation:v4])
        {
          uint64_t v12 = [v11 deepestFolderController];
          BOOL v6 = v12 != 0;
        }
        else
        {
          BOOL v6 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setAnimatingFolderCreation:(BOOL)a3
{
  if (self->_animatingFolderCreation != a3)
  {
    BOOL v5 = [(SBHIconManager *)self hasAnimatingFolder];
    self->_animatingFolderCreation = a3;
    if (v5 != [(SBHIconManager *)self hasAnimatingFolder])
    {
      [(SBHIconManager *)self hasAnimatingFolderChanged];
    }
  }
}

- (void)hasAnimatingFolderChanged
{
  if (![(SBHIconManager *)self hasAnimatingFolder] && self->_needsRelayout)
  {
    char v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "SBHIconManager: requesting delayed relayout because folder finished animating.", v5, 2u);
    }

    [(SBHIconManager *)self relayout];
  }
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconManagerFolderAnimatingDidChange:self];
  }
}

- (BOOL)allowsNestedFolders
{
  uint64_t v2 = +[SBHHomeScreenDomain rootSettings];
  char v3 = [v2 folderSettings];
  char v4 = [v3 allowNestedFolders];

  return v4;
}

- (unint64_t)maxListCountForFolders
{
  char v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 maximumListCountForFoldersForIconManager:self];
  }
  else {
    unint64_t v4 = 15;
  }

  return v4;
}

- (unint64_t)maxIconCountForDock
{
  BOOL v3 = [(SBHIconManager *)self isFloatingDockSupported];
  unint64_t v4 = SBIconLocationFloatingDock;
  if (!v3) {
    unint64_t v4 = SBIconLocationDock;
  }
  BOOL v5 = *v4;
  BOOL v6 = [(SBHIconManager *)self listLayoutProvider];
  uint64_t v7 = [v6 layoutForIconLocation:v5];

  unint64_t v8 = SBHIconListLayoutMaximumIconCount(v7);
  return v8;
}

- (unint64_t)columnCountForTodayList
{
  uint64_t v2 = [(SBHIconManager *)self listLayoutProvider];
  BOOL v3 = [v2 layoutForIconLocation:@"SBIconLocationTodayView"];

  unint64_t v4 = [v3 numberOfColumnsForOrientation:1];
  return v4;
}

- (id)allowedGridSizeClassesForDock
{
  BOOL v3 = [(SBHIconManager *)self isFloatingDockSupported];
  unint64_t v4 = SBIconLocationFloatingDock;
  if (!v3) {
    unint64_t v4 = SBIconLocationDock;
  }
  BOOL v5 = *v4;
  BOOL v6 = [(SBHIconManager *)self listLayoutProvider];
  uint64_t v7 = [v6 layoutForIconLocation:v5];

  unint64_t v8 = SBHIconListLayoutSupportedIconGridSizeClasses(v7);

  return v8;
}

- (id)allowedGridSizeClassesForTodayList
{
  uint64_t v2 = [(SBHIconManager *)self listLayoutProvider];
  BOOL v3 = [v2 layoutForIconLocation:@"SBIconLocationTodayView"];

  unint64_t v4 = SBHIconListLayoutSupportedIconGridSizeClasses(v3);

  return v4;
}

- (SBHIconGridSize)listGridSizeForFolderClass:(Class)a3
{
  unint64_t v4 = [(objc_class *)[(SBHIconManager *)self controllerClassForFolderClass:a3] iconLocation];
  BOOL v5 = [(SBHIconManager *)self listLayoutProvider];
  BOOL v6 = [v5 layoutForIconLocation:v4];

  if (v6)
  {
    int v7 = SBHIconListLayoutListGridSize(v6, 1);
    unsigned int v8 = v7 & 0xFFFF0000;
    int v9 = (unsigned __int16)v7;
  }
  else
  {
    unsigned int v8 = 196608;
    int v9 = 3;
  }

  return (SBHIconGridSize)(v8 | v9);
}

- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3
{
  BOOL v5 = [(SBHIconManager *)self iconLocationForListsWithNonDefaultSizedIcons];
  BOOL v6 = self;
  if (![(objc_class *)a3 isSubclassOfClass:v6])
  {

    goto LABEL_6;
  }
  char v7 = [v5 isEqualToString:@"SBIconLocationRoot"];

  if (v7)
  {
LABEL_6:
    SBHIconGridSize v10 = 0;
    goto LABEL_9;
  }
  unsigned int v8 = [(SBHIconManager *)self listLayoutProvider];
  int v9 = [v8 layoutForIconLocation:v5];

  if (v9) {
    SBHIconGridSize v10 = (SBHIconGridSize)SBHIconListLayoutListGridSize(v9, 1);
  }
  else {
    SBHIconGridSize v10 = 0;
  }

LABEL_9:
  return v10;
}

- (BOOL)listsAllowRotatedLayoutForFolderClass:(Class)a3
{
  BOOL v5 = [(SBHIconManager *)self delegate];
  BOOL v6 = self;
  if (![(objc_class *)a3 isSubclassOfClass:v6])
  {

    goto LABEL_5;
  }
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
LABEL_5:
    char v8 = 0;
    goto LABEL_6;
  }
  char v8 = [v5 listsAllowRotatedLayoutForIconManager:self];
LABEL_6:

  return v8;
}

- (int64_t)listsFixedIconLocationBehaviorForFolderClass:(Class)a3
{
  BOOL v5 = self;
  LODWORD(a3) = [(objc_class *)a3 isSubclassOfClass:v5];

  if (!a3) {
    return 0;
  }
  return [(SBHIconManager *)self listsFixedIconLocationBehavior];
}

- (id)iconGridSizeClassSizes
{
  BOOL v3 = [(SBHIconManager *)self listLayoutProvider];
  unint64_t v4 = [v3 layoutForIconLocation:@"SBIconLocationRoot"];

  BOOL v5 = SBHIconListLayoutIconGridSizeClassSizes(v4, [(SBHIconManager *)self interfaceOrientation]);

  return v5;
}

- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBHIconManager *)self widgetExtensionProvider];
  uint64_t v12 = objc_msgSend(v11, "sbh_descriptorWithKind:extensionBundleIdentifier:containerBundleIdentifier:", v10, v9, v8);

  uint64_t v13 = [(SBHIconManager *)self gridSizeClassDomain];
  uint64_t v14 = v13;
  if (v12)
  {
    id v15 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:]([SBHIconGridSizeClassSet alloc], "initWithCHSWidgetFamilyMask:inDomain:", [v12 supportedFamilies], v13);
  }
  else
  {
    id v15 = [v13 allNonDefaultGridSizeClasses];
  }
  uint64_t v16 = v15;

  return v16;
}

- (id)gridSizeClassDomain
{
  uint64_t v2 = [(SBHIconManager *)self iconModel];
  BOOL v3 = [v2 gridSizeClassDomain];

  return v3;
}

- (int64_t)currentIconListIndex
{
  uint64_t v2 = [(SBHIconManager *)self rootViewController];
  int64_t v3 = [v2 currentPageIndex];

  return v3;
}

- (id)folderControllerForFolder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self rootFolderController];
  id v6 = [v5 folderControllerForFolder:v4];

  if (!v6)
  {
    char v7 = [(SBHIconManager *)self floatingDockViewController];
    id v8 = [v7 presentedFolderController];

    id v9 = [v8 folder];
    int v10 = [v9 isEqual:v4];

    if (v10) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4
{
  id v6 = a3;
  char v7 = [(SBHIconManager *)self _proposedFolderNameForGrabbedIcon:a4 recipientIcon:v6];
  id v8 = [(SBHIconManager *)self iconModel];
  id v9 = [v8 makeFolderWithDisplayName:v7];
  [v9 setCancelable:1];
  int v10 = [[SBFolderIcon alloc] initWithFolder:v9];
  id v11 = [(SBHIconManager *)self rootFolder];
  [v11 replaceIcon:v6 withIcon:v10];

  [v8 addIcon:v10];
  return v9;
}

- (void)addIcons:(id)a3 intoFolderIcon:(id)a4 openFolderOnFinish:(BOOL)a5 completion:(id)a6
{
  BOOL v20 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a6;
  uint64_t v12 = [v10 folder];
  uint64_t v13 = [v12 startCoalescingContentChangesForReason:@"SBIconIntoFolderCoalesceID"];
  id v21 = [(SBHIconManager *)self rootFolder];
  uint64_t v14 = [v21 indexPathForIcon:v10];
  id v22 = 0;
  [(SBHIconManager *)self getListView:&v22 folder:0 relativePath:0 forIndexPath:v14];
  id v15 = v22;
  uint64_t v16 = [v15 iconViewForIcon:v10];
  id v17 = [v16 superview];
  [v17 bringSubviewToFront:v16];

  [v16 setAllowsEditingAnimation:0];
  id v18 = (id)[v12 addIcons:v9];
  if (v20)
  {
    [(SBHIconManager *)self setAnimatingFolderCreation:1];
    [v16 setAllowsEditingAnimation:1];
    [v13 invalidate];
    id v19 = [v16 location];
    [(SBHIconManager *)self pushExpandedIcon:v10 location:v19 context:0 animated:1 completionHandler:0];

    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v16 setAllowsEditingAnimation:1];
  [v13 invalidate];
  if (v11) {
LABEL_5:
  }
    v11[2](v11);
LABEL_6:
  [(SBHIconManager *)self setAnimatingFolderCreation:0];
}

- (void)replaceFolderIcon:(id)a3 byContainedIcon:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SBHIconManager *)self rootFolder];
  id v11 = [v10 indexPathForIcon:v9];
  uint64_t v12 = [(SBHIconManager *)self iconListViewForIndexPath:v11];
  uint64_t v13 = [v12 iconViewForIcon:v9];
  long long v56 = [v13 matchingIconViewWithConfigurationOptions:6];
  [v13 frameForMiniIconAtIndex:0];
  double v54 = v15;
  double v55 = v14;
  double v17 = v16;
  double v19 = v18;
  [v10 replaceIcon:v9 withIcon:v8];

  BOOL v20 = [v12 iconViewForIcon:v8];
  id v21 = [v12 layout];
  [v21 iconImageInfo];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = SBHIconListLayoutFolderIconGridCellSize(v21);
  if (v5)
  {
    double v32 = v30;
    double v33 = v31;
    [v12 traitCollection];
    v34 = id v51 = v13;
    id v35 = objc_alloc(MEMORY[0x1E4FB1838]);
    [v20 iconImageSnapshot];
    id v36 = v53 = v10;
    id v52 = v11;
    id v37 = (void *)[v35 initWithImage:v36];

    id v38 = [(SBHIconManager *)self folderIconImageCache];
    double v50 = objc_msgSend(v38, "gridCellImageOfSize:forIcon:iconImageInfo:compatibleWithTraitCollection:", v8, v34, v32, v33, v23, v25, v27, v29);

    id v39 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v50];
    id v40 = [v56 folderIconBackgroundView];
    [v20 setIconImageAndAccessoryAlpha:0.0];
    [v20 setIconLabelAlpha:0.0];
    [v20 setRefusesRecipientStatus:1];
    id v41 = [v37 layer];
    [v41 setAllowsEdgeAntialiasing:1];

    id v42 = [v39 layer];
    [v42 setAllowsEdgeAntialiasing:1];

    [v20 iconImageCenter];
    objc_msgSend(v40, "setCenter:");
    objc_msgSend(v37, "setFrame:", v55, v54, v17, v19);
    objc_msgSend(v39, "setFrame:", v55, v54, v17, v19);
    [v20 addSubview:v40];
    [v20 addSubview:v37];
    [v20 addSubview:v39];
    id v43 = (void *)MEMORY[0x1E4FB1EB0];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke;
    v65[3] = &unk_1E6AADD48;
    id v44 = v20;
    id v66 = v44;
    id v67 = v37;
    id v68 = v39;
    id v69 = v40;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke_2;
    v59[3] = &unk_1E6AB4048;
    id v60 = v12;
    id v61 = v8;
    id v62 = v69;
    id v63 = v67;
    id v64 = v68;
    id v45 = v68;
    id v46 = v67;
    id v47 = v69;
    [v43 animateWithDuration:v65 animations:v59 completion:0.5];
    double v48 = (void *)MEMORY[0x1E4FB1EB0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke_4;
    v57[3] = &unk_1E6AAC810;
    id v58 = v44;
    id v49 = v48;
    id v10 = v53;
    [v49 animateWithDuration:0 delay:v57 options:0 animations:0.15 completion:0.35];

    id v11 = v52;
    uint64_t v13 = v51;
  }
}

uint64_t __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke(id *a1)
{
  [a1[4] iconImageFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(a1[5], "setFrame:");
  objc_msgSend(a1[6], "setFrame:", v3, v5, v7, v9);
  [a1[6] setAlpha:0.0];
  [a1[7] setAlpha:0.0];
  id v10 = a1[7];
  CGAffineTransformMakeScale(&v12, 0.01, 0.01);
  return [v10 setTransform:&v12];
}

void __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];
  [v2 setIconImageAlpha:1.0];
  [v2 setIconAccessoryAlpha:0.0];
  [v2 setRefusesRecipientStatus:0];
  double v3 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke_3;
  v5[3] = &unk_1E6AAC810;
  id v6 = v2;
  id v4 = v2;
  [v3 animateWithDuration:v5 animations:0.15];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
}

uint64_t __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconAccessoryAlpha:1.0];
}

uint64_t __61__SBHIconManager_replaceFolderIcon_byContainedIcon_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconLabelAlpha:1.0];
}

- (id)localizedDefaultFolderName
{
  double v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 localizedDefaultFolderNameForIconManager:self];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1FC0] _localizedFolderNameForName:@"Folder"];
  }

  return v4;
}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self localizedFolderNameForDefaultDisplayName:v4];
  }
  else {
  id v6 = [(SBHIconManager *)self localizedDefaultFolderName];
  }

  return v6;
}

- (id)_proposedFolderNameForGrabbedIcon:(id)a3 recipientIcon:(id)a4
{
  double v22 = self;
  id v5 = a3;
  id v6 = a4;
  double v25 = v5;
  double v7 = [v5 folderTitleOptions];
  double v24 = v6;
  double v8 = [v6 folderTitleOptions];
  uint64_t v9 = [v7 count];
  uint64_t v10 = [v8 count];
  uint64_t v28 = v9;
  uint64_t v26 = v9 + v10 - 2;
  if (v26 >= 0)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    unint64_t v27 = v9 - 1;
    do
    {
      if (v12 >= v27) {
        uint64_t v13 = v28 - 1;
      }
      else {
        uint64_t v13 = v12;
      }
      if (v28 >= 1)
      {
        uint64_t v14 = 0;
        do
        {
          double v15 = objc_msgSend(v7, "objectAtIndex:", v14, v22);
          if (v11 < 1)
          {
LABEL_13:
          }
          else
          {
            uint64_t v16 = 1;
            while (1)
            {
              double v17 = [v8 objectAtIndex:v16 - 1];
              char v18 = [v15 isEqualToString:v17];

              if (v18) {
                break;
              }
              if (v11 > v16)
              {
                unint64_t v19 = v14 + v16++;
                if (v19 <= v12) {
                  continue;
                }
              }
              goto LABEL_13;
            }
            if (v15) {
              goto LABEL_22;
            }
          }
          BOOL v20 = v14++ == v13;
        }
        while (!v20);
      }
      BOOL v20 = v12++ == v26;
    }
    while (!v20);
  }
  double v15 = objc_msgSend(v25, "folderFallbackTitle", v22);
  if (!v15)
  {
    double v15 = [v24 folderFallbackTitle];
    if (!v15)
    {
      double v15 = [v23 localizedDefaultFolderName];
    }
  }
LABEL_22:

  return v15;
}

void *__79__SBHIconManager_pushExpandedIcon_location_context_animated_completionHandler___block_invoke(void *a1)
{
  uint64_t result = (void *)a1[4];
  if (!result[81]) {
    return (void *)[result pushExpandedIcon:a1[5] location:a1[6] context:a1[7] animated:1 completionHandler:0];
  }
  return result;
}

void __79__SBHIconManager_pushExpandedIcon_location_context_animated_completionHandler___block_invoke_473(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  if (WeakRetained)
  {
    id v6 = WeakRetained[14];
    id v7 = WeakRetained[15];
    id v8 = WeakRetained[14];
    WeakRetained[14] = 0;

    id v9 = WeakRetained[15];
    WeakRetained[15] = 0;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * i) + 16))();
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * j));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)pushExpandedIcon:(id)a3 location:(id)a4 context:(id)a5 forcePoppingPriorExpandedIcon:(BOOL)a6 animated:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v17 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (v10) {
    [(SBHIconManager *)self popExpandedIconAnimated:0 completionHandler:0];
  }
  [(SBHIconManager *)self pushExpandedIcon:v17 location:v14 context:v15 animated:v9 completionHandler:v16];
}

- (void)popExpandedIconAnimated:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)popExpandedIconFromLocation:(id)a3 interactionContext:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  uint64_t v13 = [(SBHIconManager *)self floatingDockViewController];
  int v14 = [v13 isPresentingFolder];
  if ([v13 isPresentingIconLocation:v10])
  {
    if (!v14)
    {
LABEL_8:
      if (v12) {
        v12[2](v12, 0);
      }
      goto LABEL_20;
    }
LABEL_5:
    [v13 dismissPresentedFolderAnimated:v7 completion:v12];
    goto LABEL_20;
  }
  if (v14) {
    goto LABEL_5;
  }
  currentTransitionAnimator = self->_currentTransitionAnimator;
  if (currentTransitionAnimator)
  {
    if ([(SBHomeScreenIconTransitionAnimator *)currentTransitionAnimator currentOperation]) {
      goto LABEL_8;
    }
    if (v12)
    {
      currentCollapseCompletions = self->_currentCollapseCompletions;
      if (!currentCollapseCompletions)
      {
        long long v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v22 = self->_currentCollapseCompletions;
        self->_currentCollapseCompletions = v21;

        currentCollapseCompletions = self->_currentCollapseCompletions;
      }
      long long v23 = (void *)[v12 copy];
      long long v24 = _Block_copy(v23);
      [(NSMutableArray *)currentCollapseCompletions addObject:v24];
    }
    [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator reverse];
  }
  else
  {
    objc_initWeak(&location, self);
    aBlocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __92__SBHIconManager_popExpandedIconFromLocation_interactionContext_animated_completionHandler___block_invoke;
    double v29 = &unk_1E6AB2790;
    long long v25 = &v31;
    objc_copyWeak(&v31, &location);
    id v16 = v12;
    id v30 = v16;
    id v17 = _Block_copy(&aBlock);
    [(SBHIconManager *)self setCurrentInteractionContext:v11];
    uint64_t v18 = [(SBHIconManager *)self rootFolderController];
    unint64_t v19 = [v18 deepestNestedDescendantViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[SBHIconManager closeFolderAnimated:withCompletion:](self, "closeFolderAnimated:withCompletion:", v7, v17, &v31, aBlock, v27, v28, v29);
    }
    else if (v16)
    {
      v16[2](v16, 0);
    }

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
LABEL_20:
}

void __92__SBHIconManager_popExpandedIconFromLocation_interactionContext_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  if (WeakRetained)
  {
    id v6 = WeakRetained[14];
    id v7 = WeakRetained[15];
    id v8 = WeakRetained[14];
    WeakRetained[14] = 0;

    id v9 = WeakRetained[15];
    WeakRetained[15] = 0;

    [WeakRetained setCurrentInteractionContext:0];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * v14++) + 16))();
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v19) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * v19));
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)popToCurrentRootIconList
{
  double v3 = [(SBHIconManager *)self openedFolderController];
  do
  {
    if (!v3) {
      break;
    }
    id v4 = v3;
    [(SBHIconManager *)self popExpandedIconAnimated:0 completionHandler:0];
    id v6 = [(SBHIconManager *)self openedFolderController];

    int v5 = [v6 isEqual:v4];
    double v3 = v6;
  }
  while (!v5);
}

- (void)popToCurrentRootIconListWhenPossible
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SBHIconManager_popToCurrentRootIconListWhenPossible__block_invoke;
  v2[3] = &unk_1E6AAC810;
  v2[4] = self;
  [(SBHIconManager *)self _enqueueTransitionName:@"popToCurrentRootIconList" withHandler:v2];
}

uint64_t __54__SBHIconManager_popToCurrentRootIconListWhenPossible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) popToCurrentRootIconList];
}

- (BOOL)isPerformingExpandTransition
{
  if (![(SBHIconManager *)self isTransitioning]) {
    return 0;
  }
  double v3 = [(SBHIconManager *)self currentTransitionAnimator];
  BOOL v4 = [v3 currentOperation] == 0;

  return v4;
}

- (BOOL)isPerformingCancelledCollapseTransition
{
  if (![(SBHIconManager *)self isTransitioning]) {
    return 0;
  }
  double v3 = [(SBHIconManager *)self currentTransitionAnimator];
  if ([v3 isCancelled])
  {
    BOOL v4 = [(SBHIconManager *)self currentTransitionAnimator];
    BOOL v5 = [v4 currentOperation] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isTrackingScroll
{
  double v3 = [(SBHIconManager *)self rootViewController];
  char v4 = [v3 isScrollTracking];

  if (v4) {
    return 1;
  }
  id v6 = [(SBHIconManager *)self openedFolderController];
  char v7 = [v6 isScrollTracking];

  return v7;
}

void __66__SBHIconManager_openFolderIcon_location_animated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained
    && SBIconViewQueryingDisplayingIconInLocation(WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), 1))
  {
    [v4 openFolderIcon:*(void *)(a1 + 32) location:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 64) withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
}

- (void)closeFolderAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [(SBHIconManager *)self rootFolderController];
  id v8 = [v7 deepestFolderController];

  [(SBHIconManager *)self _closeFolderController:v8 animated:v4 withCompletion:v6];
}

- (void)_closeFolderController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8 && [(SBHIconManager *)self canCloseFolders])
  {
    id v10 = [(SBHIconManager *)self openedFolder];
    [(SBHIconManager *)self setClosingFolder:v10];
    uint64_t v11 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v11 iconManager:self willCloseFolder:v10];
    }
    uint64_t v12 = [(SBHIconManager *)self iconDragManager];
    [v12 noteFolderControllerWillClose:v8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__SBHIconManager__closeFolderController_animated_withCompletion___block_invoke;
    v17[3] = &unk_1E6AB3DA8;
    void v17[4] = self;
    id v18 = v10;
    BOOL v23 = a4;
    id v19 = v12;
    id v20 = v8;
    id v21 = v11;
    id v22 = v9;
    id v13 = v11;
    id v14 = v12;
    id v15 = v10;
    [(SBHIconManager *)self _enqueueTransitionName:@"Close Folder" withHandler:v17];
  }
  else
  {
    uint64_t v16 = SBLogIcon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_INFO, "IGNORING. Controller = %@", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __65__SBHIconManager__closeFolderController_animated_withCompletion___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) icon];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __65__SBHIconManager__closeFolderController_animated_withCompletion___block_invoke_2;
  uint64_t v11 = &unk_1E6AB0D08;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v6;
  id v16 = v7;
  id v17 = *(id *)(a1 + 72);
  [v2 _animateFolderIcon:v3 open:0 location:@"SBIconLocationNone" animated:v4 withCompletion:&v8];

  if (!*(unsigned char *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cleanupForClosingFolderAnimated:", 0, v8, v9, v10, v11, v12, v13, v14, v15, v16);
    [*(id *)(a1 + 32) _compactRootListsAfterFolderCloseWithAnimation:0];
  }
}

uint64_t __65__SBHIconManager__closeFolderController_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) noteFolderControllerDidClose:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 48) iconManager:*(void *)(a1 + 56) didCloseFolder:*(void *)(a1 + 64)];
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_cleanupForClosingFolderAnimated:(BOOL)a3
{
  closingFolder = self->_closingFolder;
  if (!closingFolder) {
    return;
  }
  BOOL v5 = a3;
  [(SBFolder *)closingFolder compactLists];
  uint64_t v6 = [(SBFolder *)self->_closingFolder icon];
  char v7 = [(SBFolder *)self->_closingFolder allIcons];
  uint64_t v8 = [v7 count];
  if (![(SBFolder *)self->_closingFolder shouldRemoveWhenEmpty])
  {
    uint64_t v9 = 0;
    id v11 = v6;
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  if (v8)
  {
    uint64_t v9 = 0;
    if ([(SBFolder *)self->_closingFolder isCancelable] && v8 == 1)
    {
      uint64_t v9 = [v7 anyObject];
      id v11 = 0;
    }
    else
    {
      id v11 = v6;
      uint64_t v6 = 0;
    }
    goto LABEL_14;
  }
  if (v6)
  {
    [(SBHIconManager *)self uninstallIcon:v6 animate:v5];

    id v11 = 0;
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  id v11 = 0;
  uint64_t v9 = 0;
LABEL_14:
  if ([(SBHIconManager *)self hasAnimatingFolder] && self->_iconToReveal) {
    [(SBHIconManager *)self finishInstallingIconAnimated:1];
  }
  [(SBHIconManager *)self setAnimatingFolderOpeningOrClosing:0];
  if (v9 && v6) {
    [(SBHIconManager *)self replaceFolderIcon:v6 byContainedIcon:v9 animated:v5];
  }
  id v10 = self->_closingFolder;
  self->_closingFolder = 0;
}

- (void)_compactRootListsAfterFolderCloseWithAnimation:(BOOL)a3
{
  if (a3) {
    [(SBHIconManager *)self layoutIconListsWithAnimationType:0 forceRelayout:1];
  }
}

- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4
{
  id v6 = [MEMORY[0x1E4F4F748] eventWithName:a3 handler:a4];
  BOOL v5 = [(SBHIconManager *)self transitionEventQueue];
  [v5 executeOrInsertEvent:v6 atPosition:1];
}

- (unint64_t)gridCellInfoOptions
{
  int64_t v3 = [(SBHIconManager *)self interfaceOrientation];
  return [(SBHIconManager *)self gridCellInfoOptionsForOrientation:v3];
}

- (unint64_t)gridCellInfoOptionsForOrientation:(int64_t)a3
{
  return +[SBIconListView gridCellInfoOptionsWithInterfaceOrientation:a3 reversedLayout:0];
}

- (void)presentLeadingCustomViewWithCompletion:(id)a3
{
  id v4 = a3;
  [(SBHIconManager *)self _ensureRootFolderController];
  id v5 = [(SBHIconManager *)self rootFolderController];
  [v5 performPageStateTransitionToState:2 reason:@"activate leading custom view" animated:1 completionHandler:v4];
}

- (void)presentTrailingCustomViewWithCompletion:(id)a3
{
  id v4 = a3;
  [(SBHIconManager *)self _ensureRootFolderController];
  id v5 = [(SBHIconManager *)self rootFolderController];
  [v5 performPageStateTransitionToState:4 reason:@"activate trailing custom view" animated:1 completionHandler:v4];
}

- (BOOL)presentSpotlightFromSource:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBHIconManager *)self rootFolderController];
  [v9 setPresentationSource:a3];
  if (a3 == 5) {
    [(SBHIconManager *)self popToCurrentRootIconList];
  }
  [v9 presentSpotlightAnimated:v5 completionHandler:v8];
  char v10 = [v9 isAnySearchVisibleOrTransitioning];
  [v9 setPresentationSource:0];

  return v10;
}

- (BOOL)dismissSpotlightOrTodayViewAnimated:(BOOL)a3
{
  BOOL v4 = [(SBHIconManager *)self presentHomeScreenIconsAnimated:a3];
  BOOL v5 = [(SBHIconManager *)self delegate];
  [v5 dismissTodayOverlayForIconManager:self];

  return v4;
}

- (BOOL)dismissSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [(SBHIconManager *)self rootFolderController];
  char v8 = [v7 isAnySearchVisibleOrTransitioning];

  uint64_t v9 = [(SBHIconManager *)self rootFolderController];
  [v9 dismissSpotlightAnimated:v4 completionHandler:v6];

  return v8;
}

- (BOOL)isShowingPullDownOrLeadingCustomViewSearch
{
  if ([(SBHIconManager *)self isShowingPullDownSearchOrTransitioningToVisible])
  {
    return 1;
  }
  return [(SBHIconManager *)self _isShowingLeadingCustomViewSearch];
}

- (BOOL)isShowingSpotlightOrLeadingCustomView
{
  if ([(SBHIconManager *)self isShowingPullDownSearchOrTransitioningToVisible])
  {
    return 1;
  }
  return [(SBHIconManager *)self _isShowingSearchableLeadingCustomView];
}

- (BOOL)isShowingPullDownSearchOrTransitioningToVisible
{
  double v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isPullDownSearchVisibleOrTransitioningToVisible];

  return v3;
}

- (BOOL)_isShowingLeadingCustomViewSearch
{
  double v2 = [(SBHIconManager *)self rootFolderController];
  char v3 = [v2 isLeadingCustomViewSearchVisible];

  return v3;
}

- (void)dismissIconContextMenu
{
  id v2 = [(SBHIconManager *)self iconViewShowingContextMenu];
  [v2 dismissContextMenuWithCompletion:0];
}

- (void)performAfterIconContextMenuDismissesUsingBlock:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  BOOL v5 = [(SBHIconManager *)self iconViewShowingContextMenu];
  id v6 = v5;
  if (v5) {
    [v5 performAfterContextMenusDismissUsingBlock:v4];
  }
  else {
    v4[2](v4);
  }
}

- (void)dismissIconShareSheets
{
  id v2 = [(SBHIconManager *)self iconShareSheetManager];
  [v2 dismissIconShareSheetsIfNecessaryAndCleanUp];
}

- (id)prepareForUndo
{
  id v2 = [[SBHIconManagerUndoPreparation alloc] initWithIconManager:self];
  return v2;
}

- (void)undoPreparation:(id)a3 registerWithUndoManager:(id)a4 actionName:(id)a5 observer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 originalRootFolder];
  uint64_t v15 = [(SBHIconManager *)self rootFolder];

  if (v14 == v15)
  {
    [v10 setObserver:v13];
    [v11 removeAllActionsWithTarget:self];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__SBHIconManager_undoPreparation_registerWithUndoManager_actionName_observer___block_invoke;
    v20[3] = &unk_1E6AAE7D8;
    id v21 = v10;
    [v11 registerUndoWithTarget:self handler:v20];
    if (v12) {
      [v11 setActionName:v12];
    }
    dispatch_time_t v16 = dispatch_time(0, 480000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__SBHIconManager_undoPreparation_registerWithUndoManager_actionName_observer___block_invoke_2;
    block[3] = &unk_1E6AACA90;
    id v18 = v11;
    id v19 = self;
    dispatch_after(v16, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78__SBHIconManager_undoPreparation_registerWithUndoManager_actionName_observer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 undoChangeWithPreparation:*(void *)(a1 + 32)];
}

uint64_t __78__SBHIconManager_undoPreparation_registerWithUndoManager_actionName_observer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllActionsWithTarget:*(void *)(a1 + 40)];
}

- (void)undoChangeWithPreparation:(id)a3
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBHIconManager *)self rootFolderController];
  id v40 = (void *)v5;
  if (v5)
  {
    v65[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [[SBIconDragUndoLayoutDelegatePreModificationInfo alloc] initWithRootFolderController:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v10);
  }
  id v39 = v8;

  id v14 = [(SBHIconManager *)self folderIconImageCache];
  [v14 purgeAllCachedFolderImages];

  uint64_t v15 = [v4 observer];
  [v15 willUndo];
  id v38 = self;
  dispatch_time_t v16 = [(SBHIconManager *)self rootFolder];
  id v41 = v4;
  id v35 = [v4 unmodifiedOriginalRootFolder];
  id v17 = (id)objc_msgSend(v16, "setListsFromFolder:");
  id v36 = v16;
  [v16 compactLists];
  id v37 = v15;
  [v15 didUndo];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v7;
  uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  id v18 = 0;
  id v19 = 0;
  if (v44)
  {
    uint64_t v43 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        id v22 = [[SBIconDragUndoLayoutDelegate alloc] initWithPreModificationInfo:v21];
        if (v22)
        {
          id v23 = v18;
          if (!v19) {
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          long long v24 = [v21 visibleListViews];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v62 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v50;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v50 != v27) {
                  objc_enumerationMutation(v24);
                }
                double v29 = [*(id *)(*((void *)&v49 + 1) + 8 * k) addOverridingLayoutDelegate:v22 reason:@"UndoDrag"];
                if (v29) {
                  [v19 addObject:v29];
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v49 objects:v62 count:16];
            }
            while (v26);
          }
          id v18 = v23;
          if (!v23) {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v18 addObject:v22];
        }
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v44);
  }

  [(SBHIconManager *)v38 layoutIconListsWithAnimationType:0 forceRelayout:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v30 = v19;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * m) invalidate];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v32);
  }
}

+ (id)undoActionNameForDraggedIcons:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    if ([v4 isApplicationIcon])
    {
      uint64_t v5 = SBHBundle();
      id v6 = v5;
      id v7 = @"UNDO_DRAG_APP";
    }
    else if ([v4 isWidgetIcon])
    {
      uint64_t v5 = SBHBundle();
      id v6 = v5;
      id v7 = @"UNDO_DRAG_WIDGET";
    }
    else if ([v4 isFolderIcon])
    {
      uint64_t v5 = SBHBundle();
      id v6 = v5;
      id v7 = @"UNDO_DRAG_FOLDER";
    }
    else
    {
      int v10 = [v4 isBookmarkIcon];
      uint64_t v5 = SBHBundle();
      id v6 = v5;
      if (v10) {
        id v7 = @"UNDO_DRAG_BOOKMARK";
      }
      else {
        id v7 = @"UNDO_DRAG";
      }
    }
    id v8 = [v5 localizedStringForKey:v7 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  }
  else
  {
    id v4 = SBHBundle();
    id v8 = [v4 localizedStringForKey:@"UNDO_DRAG" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  }

  return v8;
}

- (void)removeAllUndoRegistrationsInUndoManager:(id)a3
{
}

- (void)getStatistics:(SBHIconManagerStatistics *)a3
{
  a3->var0 = self->_relayoutCount;
  a3->var2 = [(SBHReusableViewMap *)self->_iconViewMap recycledViewCount];
  a3->var3 = [(SBHReusableViewMap *)self->_iconViewMap viewRecyclingCount];
  a3->var4 = [(SBHReusableViewMap *)self->_homescreenIconAccessoryViewMap recycledViewCount];
  a3->var5 = [(SBHReusableViewMap *)self->_homescreenIconAccessoryViewMap viewRecyclingCount];
  a3->var6 = [(SBHReusableViewMap *)self->_homescreenIconLabelAccessoryViewMap recycledViewCount];
  a3->var7 = [(SBHReusableViewMap *)self->_homescreenIconLabelAccessoryViewMap viewRecyclingCount];
  a3->var8 = [(SBHReusableViewMap *)self->_homescreenIconImageViewMap recycledViewCount];
  a3->var9 = [(SBHReusableViewMap *)self->_homescreenIconImageViewMap viewRecyclingCount];
  a3->var10 = [(SBIconLabelImageCache *)self->_labelImageCache numberOfCachedImages];
  a3->var11 = [(SBIconLabelImageCache *)self->_labelImageCache numberOfCacheHits];
  a3->var12 = [(SBIconLabelImageCache *)self->_labelImageCache numberOfCacheMisses];
  a3->var13 = [(SBHIconImageCache *)self->_iconImageCache numberOfCachedImages];
  a3->var14 = [(SBHIconImageCache *)self->_iconImageCache numberOfCacheHits];
  a3->var15 = [(SBHIconImageCache *)self->_iconImageCache numberOfCacheMisses];
  a3->var16 = [(SBHIconImageCache *)self->_iconImageCache numberOfMainThreadImageLoads];
  a3->var17 = [(SBHIconImageCache *)self->_iconImageCache numberOfUnmaskedCachedImages];
  a3->var18 = [(SBHIconImageCache *)self->_iconImageCache numberOfUnmaskedCacheHits];
  a3->var19 = [(SBHIconImageCache *)self->_iconImageCache numberOfUnmaskedCacheMisses];
  a3->var20 = [(SBFolderIconImageCache *)self->_folderIconImageCache numberOfCachedImages];
  a3->var21 = [(SBFolderIconImageCache *)self->_folderIconImageCache numberOfCacheHits];
  a3->var22 = [(SBFolderIconImageCache *)self->_folderIconImageCache numberOfCacheMisses];
  a3->var1 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SBHIconManager_getStatistics___block_invoke;
  v5[3] = &__block_descriptor_40_e24_v24__0__SBIconView_8_B16l;
  void v5[4] = a3;
  [(SBHIconManager *)self enumerateDisplayedIconViewsUsingBlock:v5];
}

uint64_t __32__SBHIconManager_getStatistics___block_invoke(uint64_t result)
{
  return result;
}

- (NSString)statisticsSummary
{
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  [(SBHIconManager *)self getStatistics:&v4];
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"Relayouts: %lu\nDisplayed icon views: %lu\nRecycled icon views: %lu\nIcon view recyclings: %lu\nRecycled icon accessory views: %lu\nIcon accessory view recyclings: %lu\nRecycled icon label accessory views: %lu\nIcon label accessory view recyclings: %lu\nRecycled icon image views: %lu\nIcon image view recyclings: %lu\nLabel cache live/hits/misses: %lu/%lu/%lu\nImage cache live/hits/misses/main: %lu/%lu/%lu/%lu (unmasked: %lu/%lu/%lu)\nFolder image cache live/hits/misses: %lu/%lu/%lu", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  return (NSString *)v2;
}

- (SBHProactivePageSuggestionsManager)proactivePageSuggestionsManager
{
  proactivePageSuggestionsManager = self->_proactivePageSuggestionsManager;
  if (!proactivePageSuggestionsManager)
  {
    long long v4 = [[SBHProactivePageSuggestionsManager alloc] initWithIconManager:self];
    long long v5 = self->_proactivePageSuggestionsManager;
    self->_proactivePageSuggestionsManager = v4;

    proactivePageSuggestionsManager = self->_proactivePageSuggestionsManager;
  }
  return proactivePageSuggestionsManager;
}

- (id)_makeCustomViewControllerForWidgetIcon:(id)a3 dataSource:(id)a4 location:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v10 gridSizeClass];
  long long v12 = [(SBHIconManager *)self _makeCustomViewControllerForWidgetIcon:v10 dataSource:v9 location:v8 gridSizeClass:v11];

  return v12;
}

- (id)_makeCustomViewControllerForWidgetIcon:(id)a3 dataSource:(id)a4 location:(id)a5 gridSizeClass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(SBHIconManager *)self delegate];
  uint64_t v15 = self;
  id v69 = v11;
  if (objc_opt_isKindOfClass()) {
    dispatch_time_t v16 = v11;
  }
  else {
    dispatch_time_t v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = [v17 kind];
  id v19 = [v17 extensionBundleIdentifier];
  uint64_t v20 = [v17 containerBundleIdentifier];
  uint64_t v21 = [(SBHIconManager *)self gridSizeClassDomain];
  if (v17) {
    BOOL v22 = v18 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  BOOL v23 = v22 || v19 == 0;
  long long v70 = (void *)v21;
  id v67 = v13;
  id v68 = v12;
  double v65 = (void *)v20;
  id v66 = (void *)v18;
  if (v23)
  {
    long long v24 = (void *)v14;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v25 = (void *)v14;
      uint64_t v26 = v69;
      uint64_t v27 = [v25 iconManager:self viewControllerForCustomIcon:v10 element:v69];
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v26 = v69;
    }
    uint64_t v28 = v70;
  }
  else
  {
    double v29 = (void *)v21;
    unsigned int v64 = 1;
    id v63 = v10;
    uint64_t v30 = [(SBHIconManager *)self _intentForWidget:v17 ofIcon:v10 creatingIfNecessary:1];
    uint64_t v31 = [v29 chsWidgetFamilyForIconGridSizeClass:v13];
    uint64_t v32 = v20;
    uint64_t v33 = v31;
    id v62 = v19;
    long long v60 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:v19 containerBundleIdentifier:v32 deviceIdentifier:0];
    id v61 = (void *)v30;
    id v34 = (void *)[objc_alloc(MEMORY[0x1E4F58DD8]) initWithExtensionIdentity:v60 kind:v18 family:v33 intent:v30 activityIdentifier:0];
    uint64_t v35 = [(SBHIconManager *)self metricsForCHSWidget:v34 inLocation:v12];
    uint64_t v36 = [v12 isEqualToString:@"SBIconLocationAddWidgetSheet"];
    uint64_t v37 = [v17 suggestionSource];
    char v38 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v12);
    long long v24 = (void *)v14;
    uint64_t v26 = v69;
    if ((v38 & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v64 = [v24 iconManagerWidgetsCanAppearInSecureEnvironment:self];
      }
      else {
        unsigned int v64 = 0;
      }
    }
    if (v37 == 3) {
      uint64_t v39 = 1;
    }
    else {
      uint64_t v39 = v36;
    }
    id v40 = [SBHWidgetViewController alloc];
    id v41 = [v17 uniqueIdentifier];
    uint64_t v27 = [(SBHWidgetViewController *)v40 initWithWidget:v34 metrics:v35 widgetConfigurationIdentifier:v41];

    aliveWidgetViewControllersHashTable = self->_aliveWidgetViewControllersHashTable;
    if (!aliveWidgetViewControllersHashTable)
    {
      uint64_t v43 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v44 = self->_aliveWidgetViewControllersHashTable;
      self->_aliveWidgetViewControllersHashTable = v43;

      aliveWidgetViewControllersHashTable = self->_aliveWidgetViewControllersHashTable;
    }
    long long v59 = (void *)v35;
    [(NSHashTable *)aliveWidgetViewControllersHashTable addObject:v27];
    [(SBHWidgetViewController *)v27 setDelegate:self];
    [(SBHWidgetViewController *)v27 setContentType:v39];
    [(SBHWidgetViewController *)v27 setCanAppearInSecureEnvironment:v64];
    [(SBHWidgetViewController *)v27 setDrawSystemBackgroundMaterialIfNecessary:v36];
    long long v45 = [(SBHIconManager *)self widgetExtensionProvider];
    [(SBHWidgetViewController *)v27 sbh_setWidgetExtensionProvider:v45];

    if (objc_opt_respondsToSelector()) {
      [v24 iconManager:self configureColorSchemeForWidgetViewController:v27];
    }
    id v19 = v62;
    id v10 = v63;
    uint64_t v28 = v70;
    if (objc_opt_respondsToSelector()) {
      [v24 iconManager:self configureBackgroundViewPolicyForWidgetViewController:v27];
    }
    if (objc_opt_respondsToSelector())
    {
      long long v46 = [v24 iconManager:self customDisplayConfigurationForWidgetViewController:v27];
      [(SBHWidgetViewController *)v27 sbh_setCustomDisplayConfiguration:v46];

      uint64_t v28 = v70;
    }
    [(SBHWidgetViewController *)v27 setShouldShareTouchesWithHost:1];
    if (v36) {
      uint64_t v47 = 2;
    }
    else {
      uint64_t v47 = 0;
    }
    [(SBHWidgetViewController *)v27 setVisibility:v47];
    if (!v61) {
      [(SBHIconManager *)self _loadAndSaveDefaultIntentIfNecessaryForWidget:v17 ofIcon:v63 viewController:v27];
    }
  }
  long long v48 = NSString;
  long long v49 = [v26 icon:v10 displayNameForLocation:@"SBIconLocationRoot"];
  long long v50 = [v48 stringWithFormat:@"widget:%@", v49];
  [(SBHWidgetViewController *)v27 setAccessibilityValue:v50];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v72 = 0;
    double v73 = &v72;
    uint64_t v74 = 0x2050000000;
    long long v51 = (void *)getAPUIAppPredictionViewControllerClass_softClass_0;
    uint64_t v75 = getAPUIAppPredictionViewControllerClass_softClass_0;
    if (!getAPUIAppPredictionViewControllerClass_softClass_0)
    {
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __getAPUIAppPredictionViewControllerClass_block_invoke_0;
      v71[3] = &unk_1E6AAD648;
      v71[4] = &v72;
      __getAPUIAppPredictionViewControllerClass_block_invoke_0((uint64_t)v71);
      long long v51 = (void *)v73[3];
    }
    id v52 = v51;
    _Block_object_dispose(&v72, 8);
    long long v53 = v27;
    if (v52)
    {
      if (objc_opt_isKindOfClass()) {
        long long v54 = v53;
      }
      else {
        long long v54 = 0;
      }
    }
    else
    {
      long long v54 = 0;
    }
    long long v55 = v54;

    [(SBHIconManager *)self updateLargeIconsEnabledForAppPredictionViewController:v55 animated:0];
    long long v56 = [(SBHIconManager *)self _effectiveAppPredictionViewControllersForUniqueIdentifier];
    long long v57 = [v26 uniqueIdentifier];
    [v56 setObject:v55 forKey:v57];

    uint64_t v28 = v70;
  }

  return v27;
}

- (void)updateWidgetViewControllersWithRenderScheme:(id)a3
{
  id v4 = a3;
  long long v5 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SBHIconManager_updateWidgetViewControllersWithRenderScheme___block_invoke;
  v7[3] = &unk_1E6AB40E8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateAllViewControllersUsingBlock:v7];
}

void __62__SBHIconManager_updateWidgetViewControllersWithRenderScheme___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      long long v5 = v7;
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

  [v6 setRenderScheme:*(void *)(a1 + 32)];
}

- (void)updateWidgetViewControllersWithCustomDisplayConfiguration:(id)a3
{
  id v4 = a3;
  long long v5 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SBHIconManager_updateWidgetViewControllersWithCustomDisplayConfiguration___block_invoke;
  v7[3] = &unk_1E6AB40E8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateAllViewControllersUsingBlock:v7];
}

void __76__SBHIconManager_updateWidgetViewControllersWithCustomDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      long long v5 = v7;
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

  objc_msgSend(v6, "sbh_setCustomDisplayConfiguration:", *(void *)(a1 + 32));
}

- (void)_loadAndSaveDefaultIntentIfNecessaryForWidget:(id)a3 ofIcon:(id)a4 viewController:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBHIconManager *)self _intentForWidget:v8 ofIcon:v9 creatingIfNecessary:1];
  if (v11)
  {
    id v12 = [(SBHIconManager *)self iconModel];
    id v13 = [v12 widgetIcons];
    if ([v13 containsObject:v9])
    {
      uint64_t v14 = [(SBHIconManager *)self _archivedIntentForDataSource:v8 inIcon:v9 loadingIfNecessary:1];

      if (!v14) {
        [(SBHIconManager *)self _archiveConfiguration:v11 forDataSource:v8 ofIcon:v9];
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v15 = [v10 widget];
    dispatch_time_t v16 = (void *)v15;
    if (v15) {
      id v17 = (void *)v15;
    }
    else {
      id v17 = v8;
    }
    id v18 = v17;
    id v19 = [v18 extensionIdentity];
    uint64_t v20 = [v19 extensionBundleIdentifier];

    uint64_t v21 = [v18 kind];
    objc_initWeak(&location, v10);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__SBHIconManager__loadAndSaveDefaultIntentIfNecessaryForWidget_ofIcon_viewController___block_invoke;
    aBlock[3] = &unk_1E6AB4110;
    void aBlock[4] = self;
    id v41 = v18;
    id v32 = v20;
    id v42 = v32;
    id v33 = v21;
    id v43 = v33;
    id v30 = v9;
    id v44 = v30;
    id v22 = v8;
    id v45 = v22;
    id v23 = v41;
    objc_copyWeak(&v47, &location);
    id v31 = v16;
    id v46 = v31;
    long long v24 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    uint64_t v25 = [(SBHIconManager *)self widgetExtensionProvider];
    uint64_t v26 = objc_msgSend(v25, "sbh_descriptorForWidgetIdentifiable:", v23);

    if (v26)
    {
      v24[2](v24, v26, &__block_literal_global_545);
    }
    else
    {
      uint64_t v27 = SBLogIcon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v50 = v32;
        __int16 v51 = 2112;
        id v52 = v33;
        __int16 v53 = 2112;
        uint64_t v54 = 0;
        _os_log_impl(&dword_1D7F0A000, v27, OS_LOG_TYPE_DEFAULT, "Missing intent and no descriptor intent found for widget: %@ - %@ - descriptor: %@", buf, 0x20u);
      }

      objc_initWeak((id *)buf, self);
      pendingWidgetIntentConfigurationInitializations = self->_pendingWidgetIntentConfigurationInitializations;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __86__SBHIconManager__loadAndSaveDefaultIntentIfNecessaryForWidget_ofIcon_viewController___block_invoke_546;
      v34[3] = &unk_1E6AB4138;
      objc_copyWeak(&v39, (id *)buf);
      id v35 = v22;
      id v36 = v30;
      id v37 = v23;
      char v38 = v24;
      double v29 = _Block_copy(v34);
      [(NSMutableSet *)pendingWidgetIntentConfigurationInitializations addObject:v29];

      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)buf);
    }

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }
}

void __86__SBHIconManager__loadAndSaveDefaultIntentIfNecessaryForWidget_ofIcon_viewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  BSDispatchQueueAssertMain();
  long long v5 = [*(id *)(a1 + 32) widgetExtensionProvider];
  id v6 = objc_msgSend(v5, "sbh_descriptorForWidgetIdentifiable:", *(void *)(a1 + 40));

  id v7 = [v6 defaultIntentReference];
  id v8 = [v7 intent];

  id v9 = SBLogIcon();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      int v24 = 138412802;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      double v29 = v8;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Default default intent for widget(%@ - %@): %@", (uint8_t *)&v24, 0x20u);
    }

    id v13 = [*(id *)(a1 + 32) iconModel];
    uint64_t v14 = [v13 widgetIcons];
    int v15 = [v14 containsObject:*(void *)(a1 + 64)];

    dispatch_time_t v16 = [*(id *)(a1 + 32) _archivedIntentForDataSource:*(void *)(a1 + 72) inIcon:*(void *)(a1 + 64) loadingIfNecessary:0];

    if (v15 && !v16)
    {
      id v17 = SBLogIcon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 48);
        uint64_t v19 = *(void *)(a1 + 56);
        int v24 = 138412802;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        __int16 v28 = 2112;
        double v29 = v8;
        _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "Saving new default intent for widget (%@ - %@): %@", (uint8_t *)&v24, 0x20u);
      }

      [*(id *)(a1 + 32) _archiveConfiguration:v8 forDataSource:*(void *)(a1 + 72) ofIcon:*(void *)(a1 + 64)];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v21 = [WeakRetained widget];
    id v22 = *(void **)(a1 + 80);

    if (v21 == v22)
    {
      id v23 = [*(id *)(a1 + 80) widgetByReplacingIntent:v8];
      [WeakRetained setWidget:v23];
    }
    v4[2](v4, 1);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __86__SBHIconManager__loadAndSaveDefaultIntentIfNecessaryForWidget_ofIcon_viewController___block_invoke_cold_1(a1, v10);
    }

    v4[2](v4, 0);
  }
}

void __86__SBHIconManager__loadAndSaveDefaultIntentIfNecessaryForWidget_ofIcon_viewController___block_invoke_546(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) resetDisplayName];
    [*(id *)(a1 + 40) updateLabel];
    uint64_t v4 = [WeakRetained widgetExtensionProvider];
    long long v5 = objc_msgSend(v4, "sbh_descriptorForWidgetIdentifiable:", *(void *)(a1 + 48));

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v6[2](v6, 1);
  }
}

- (void)performAfterCachingWidgetIntentsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if ([(NSMutableSet *)self->_pendingWidgetIntentConfigurationInitializations count]
    || [(NSMutableSet *)self->_activeWidgetIntentConfigurationInitializations count])
  {
    if (!self->_performAfterPendingWidgetIntentConfigurationBlocks)
    {
      long long v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      performAfterPendingWidgetIntentConfigurationBlocks = self->_performAfterPendingWidgetIntentConfigurationBlocks;
      self->_performAfterPendingWidgetIntentConfigurationBlocks = v5;
    }
    id v7 = (void *)[v4 copy];
    id v8 = self->_performAfterPendingWidgetIntentConfigurationBlocks;
    id v9 = _Block_copy(v7);
    [(NSMutableArray *)v8 addObject:v9];

    if ([(NSMutableSet *)self->_pendingWidgetIntentConfigurationInitializations count]) {
      [(SBHIconManager *)self _processPendingDefaultIntents];
    }
    dispatch_time_t v10 = dispatch_time(0, 30000000000);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SBHIconManager_performAfterCachingWidgetIntentsUsingBlock___block_invoke;
    v12[3] = &unk_1E6AAC8E8;
    v12[4] = self;
    id v13 = v7;
    id v11 = v7;
    dispatch_after(v10, MEMORY[0x1E4F14428], v12);
  }
  else
  {
    v4[2](v4);
  }
}

void __61__SBHIconManager_performAfterCachingWidgetIntentsUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 280);
  id v3 = _Block_copy(*(const void **)(a1 + 40));
  LODWORD(v2) = [v2 containsObject:v3];

  if (v2)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 280);
    long long v5 = _Block_copy(*(const void **)(a1 + 40));
    [v4 removeObject:v5];

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (id)_newIntentForDataSource:(id)a3 inIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHIconManager *)self _archivedIntentForDataSource:v6 inIcon:v7 loadingIfNecessary:1];
  if (!v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider sbh_descriptorForWidgetIdentifiable:v6];
      dispatch_time_t v10 = [v9 defaultIntentReference];
      id v8 = [v10 intent];

      id v11 = SBLogWidgetIntent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SBHIconManager _newIntentForDataSource:inIcon:](v7, v11);
      }
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)intentForDataSource:(id)a3 ofIcon:(id)a4
{
  return [(SBHIconManager *)self _intentForDataSource:a3 inIcon:a4 creatingIfNecessary:1];
}

- (id)_intentForDataSource:(id)a3 inIcon:(id)a4 creatingIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    dispatch_time_t v10 = [v8 uniqueIdentifier];
    if (v10)
    {
      id v11 = [(NSMutableDictionary *)self->_widgetIntents objectForKey:v10];
      char v12 = 1;
      if (v11) {
        goto LABEL_15;
      }
      goto LABEL_8;
    }
    id v11 = 0;
  }
  else
  {
    id v11 = 0;
    dispatch_time_t v10 = 0;
  }
  char v12 = 0;
LABEL_8:
  if (v5)
  {
    id v11 = [(SBHIconManager *)self _newIntentForDataSource:v8 inIcon:v9];
    char v13 = v12 ^ 1;
    if (!v11) {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      widgetIntents = self->_widgetIntents;
      if (!widgetIntents)
      {
        int v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        dispatch_time_t v16 = self->_widgetIntents;
        self->_widgetIntents = v15;

        widgetIntents = self->_widgetIntents;
      }
      [(NSMutableDictionary *)widgetIntents setObject:v11 forKey:v10];
    }
  }
LABEL_15:

  return v11;
}

- (id)_archivedIntentForDataSource:(id)a3 inIcon:(id)a4 loadingIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v11 = 0;
    dispatch_time_t v10 = 0;
LABEL_7:
    char v12 = 0;
LABEL_8:
    if (!v5) {
      goto LABEL_23;
    }
    char v13 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v13 iconManager:self configurationDataForDataSource:v8 ofIcon:v9];
      if (v14)
      {
        int v15 = (void *)v14;
        dispatch_time_t v16 = (void *)MEMORY[0x1E4F28DC0];
        id v17 = self;
        id v43 = 0;
        id v11 = [v16 unarchivedObjectOfClass:v17 fromData:v15 error:&v43];
        id v18 = v43;

        uint64_t v19 = SBLogWidgetIntent();
        uint64_t v20 = v19;
        if (v11)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = [v11 _indexingHash];
            *(_DWORD *)buf = 134218242;
            uint64_t v45 = v21;
            __int16 v46 = 2114;
            id v47 = v15;
            _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_DEFAULT, "Successfully unarchived widget intent '%llu' from %{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          -[SBHIconManager _archivedIntentForDataSource:inIcon:loadingIfNecessary:]();
        }
        id v42 = v18;

        uint64_t v29 = objc_opt_class();
        id v30 = v8;
        if (v29)
        {
          if (objc_opt_isKindOfClass()) {
            id v31 = v30;
          }
          else {
            id v31 = 0;
          }
        }
        else
        {
          id v31 = 0;
        }
        id v32 = v31;

        id v33 = [v32 extensionBundleIdentifier];

        if ([v33 isEqualToString:@"com.apple.mobilecal.CalendarWidgetExtension"])
        {
          id v41 = v15;
          id v34 = [v11 _className];
          char v35 = [v34 isEqualToString:@"CalendarSpatialWidgetIntent"];

          if ((v35 & 1) == 0)
          {
            int v15 = v41;
            id v36 = v42;
            goto LABEL_38;
          }
          id v33 = v11;
          id v11 = 0;
          int v15 = v41;
        }
        id v36 = v42;

LABEL_38:
        char v37 = v12 ^ 1;
        if (!v11) {
          char v37 = 1;
        }
        if ((v37 & 1) == 0)
        {
          archivedWidgetIntents = self->_archivedWidgetIntents;
          if (!archivedWidgetIntents)
          {
            id v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v40 = self->_archivedWidgetIntents;
            self->_archivedWidgetIntents = v39;

            archivedWidgetIntents = self->_archivedWidgetIntents;
          }
          [(NSMutableDictionary *)archivedWidgetIntents setObject:v11 forKey:v10];
        }
        goto LABEL_22;
      }
      if (__sb__runningInSpringBoard())
      {
        id v22 = SBLogWidgetIntent();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v9 applicationBundleID];
          int v24 = [v9 activeDataSource];
          uint64_t v25 = SBHConfigurationIdentifierFromDataSource(v24);
          __int16 v26 = [v9 activeDataSource];
          uint64_t v27 = SBHUniqueIdentifierOfDataSource(v26);
          *(_DWORD *)buf = 138544130;
          uint64_t v45 = (uint64_t)v9;
          __int16 v46 = 2114;
          id v47 = v23;
          __int16 v48 = 2114;
          long long v49 = v25;
          __int16 v50 = 2114;
          __int16 v51 = v27;
          _os_log_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEFAULT, "Archived widget intent data not found for icon: %{public}@, bundleID=%{public}@, storageIdentifier: %{public}@, dataSourceUniqueIdentifier: %{public}@", buf, 0x2Au);
        }
LABEL_17:
      }
    }
    else if (__sb__runningInSpringBoard())
    {
      id v22 = SBLogWidgetIntent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[SBHIconManager _archivedIntentForDataSource:inIcon:loadingIfNecessary:]();
      }
      goto LABEL_17;
    }
    id v11 = 0;
LABEL_22:

    goto LABEL_23;
  }
  dispatch_time_t v10 = [v8 uniqueIdentifier];
  if (!v10)
  {
    id v11 = 0;
    goto LABEL_7;
  }
  id v11 = [(NSMutableDictionary *)self->_archivedWidgetIntents objectForKey:v10];
  char v12 = 1;
  if (!v11) {
    goto LABEL_8;
  }
LABEL_23:

  return v11;
}

- (id)_stackConfigurationForStackIcon:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self _alwaysPresentStackConfigurationSheet];
  if (([v4 isWidgetStackIcon] & 1) != 0 || v5)
  {
    id v6 = objc_alloc_init(SBHStackConfiguration);
    -[SBHStackConfiguration setAllowsSuggestions:](v6, "setAllowsSuggestions:", [v4 allowsSuggestions]);
    -[SBHStackConfiguration setAllowsExternalSuggestions:](v6, "setAllowsExternalSuggestions:", [v4 allowsExternalSuggestions]);
    id v7 = [v4 iconDataSources];
    [(SBHStackConfiguration *)v6 setDataSources:v7];

    id v8 = [v4 gridSizeClass];
    [(SBHStackConfiguration *)v6 setSizeClass:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)containerBundleIdentifierForDataSource:(id)a3
{
  return SBHContainerBundleIdentifierForDataSource(a3);
}

- (id)validatedWidgetIconForWidgetIcon:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 gridSizeClass];
  id v6 = [v4 widgets];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v30;
    *(void *)&long long v8 = 138412546;
    long long v23 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (!-[SBHIconManager isWidgetValid:iconSizeClass:](self, "isWidgetValid:iconSizeClass:", v12, v5, v23))
        {
          char v13 = SBLogWidgets();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            uint64_t v35 = v12;
            __int16 v36 = 2112;
            id v37 = v4;
            _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Removing iconDataSource:%@ from widgetIcon:%@ as it is no longer valid", buf, 0x16u);
          }

          [v4 removeIconDataSource:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v9);
  }
  uint64_t v14 = [v4 iconDataSourcesOfClass:objc_opt_class()];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v26;
    *(void *)&long long v16 = 138412546;
    long long v24 = v16;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        if (!-[SBHIconManager isCustomIconElementValid:](self, "isCustomIconElementValid:", v20, v24))
        {
          uint64_t v21 = SBLogWidgets();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            uint64_t v35 = v20;
            __int16 v36 = 2112;
            id v37 = v4;
            _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "Removing iconDataSource:%@ from widgetIcon:%@ as it is no longer valid", buf, 0x16u);
          }

          [v4 removeIconDataSource:v20];
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  return v4;
}

- (BOOL)isCustomIconElementValid:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 containerBundleIdentifier];
  BOOL v5 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v4];
  if (([v5 isLocked] & 1) != 0 || objc_msgSend(v5, "isHidden"))
  {
    id v6 = SBLogWidgets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Application is locked or hidden; fakeWidget is invalid: %@",
        (uint8_t *)&v9,
        0xCu);
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)isWidgetValid:(id)a3 iconSizeClass:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(SBHIconManager *)self widgetExtensionProvider];
  int v9 = objc_msgSend(v8, "sbh_descriptorForWidgetIdentifiable:", v6);
  id v10 = [(SBHIconManager *)self delegate];
  uint64_t v11 = [(SBHIconManager *)self gridSizeClassDomain];
  if (v9)
  {
    long long v27 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:]([SBHIconGridSizeClassSet alloc], "initWithCHSWidgetFamilyMask:inDomain:", [v9 supportedFamilies], v11);
    BOOL v12 = [(SBHIconGridSizeClassSet *)v27 containsGridSizeClass:v7];
    long long v28 = v11;
    char v13 = v8;
    if (v12)
    {
      id v14 = v7;
      int v15 = 1;
    }
    else
    {
      uint64_t v18 = SBLogWidgets();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v6;
        _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "Icon size class no longer supported for widget; removing widget: %@",
          buf,
          0xCu);
      }
      id v14 = v7;

      int v15 = 0;
    }
    uint64_t v19 = [v9 extensionIdentity];
    uint64_t v20 = [v19 containerBundleIdentifier];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v21 = [v10 iconManager:self containerBundleIdentifierForDescriptor:v9];

      uint64_t v20 = (void *)v21;
    }
    id v22 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v20];
    long long v23 = v22;
    id v7 = v14;
    if (v12)
    {
      long long v8 = v13;
      if (([v22 isLocked] & 1) != 0 || objc_msgSend(v23, "isHidden"))
      {
        long long v24 = SBLogWidgets();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v6;
          _os_log_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_DEFAULT, "Icon is locked or hidden; removing widget: %@",
            buf,
            0xCu);
        }

        int v15 = 0;
      }
    }
    else
    {
      long long v8 = v13;
    }

    BOOL v17 = v15 != 0;
    uint64_t v11 = v28;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && [v10 iconManager:self isWidgetValid:v6])
  }
  {
    long long v16 = SBLogWidgets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "No widget descriptor found for widget, but delegate says to keep it: %@", buf, 0xCu);
    }

    BOOL v17 = 1;
  }
  else
  {
    long long v25 = SBLogWidgets();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_1D7F0A000, v25, OS_LOG_TYPE_DEFAULT, "No widget descriptor found for widget; removing widget: %@",
        buf,
        0xCu);
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (void)checkForInvalidWidgets
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [(SBHIconManager *)self iconModel];
  id v3 = [v11 widgetIcons];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        int v9 = [(SBHIconManager *)self validatedWidgetIconForWidgetIcon:v8];
        if (![v9 iconDataSourceCount])
        {
          id v10 = SBLogWidgets();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v8;
            _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Last data source removed for widget icon; removing icon: %@",
              buf,
              0xCu);
          }

          [(SBHIconManager *)self removeIcon:v8 options:1 completion:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)checkForInvalidCustomElements
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Unable to validate custom widgets; validation is not implemented by delegate: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (id)metricsForCHSWidget:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHIconManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v8 iconManager:self metricsForCHSWidget:v6 inLocation:v7],
        (int v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = [(SBHIconManager *)self widgetMetricsProvider];
    int v9 = [v10 systemMetricsForWidget:v6];
  }
  return v9;
}

- (void)widgetHostViewController:(id)a3 requestsLaunch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  int v9 = [v8 activeMultiplexingViewControllerForViewController:v6];

  id v10 = [(NSMapTable *)self->_iconViewsForWidgetMultiplexingViewController objectForKey:v9];
  if (([v10 isShowingContextMenu] & 1) == 0 && !-[SBHIconManager isEditing](self, "isEditing"))
  {
    uint64_t v11 = [(SBHIconManager *)self currentStylePickerViewController];

    if (!v11)
    {
      long long v12 = [v10 icon];
      uint64_t v13 = objc_opt_class();
      id v14 = v12;
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          long long v15 = v14;
        }
        else {
          long long v15 = 0;
        }
      }
      else
      {
        long long v15 = 0;
      }
      id v16 = v15;

      uint64_t v17 = [v16 activeWidget];
      if (!v17) {
        goto LABEL_50;
      }
      [v6 widget];
      uint64_t v18 = v50 = v16;
      uint64_t v19 = [v18 extensionIdentity];
      uint64_t v20 = [v19 extensionBundleIdentifier];
      [v17 extensionBundleIdentifier];
      uint64_t v21 = v51 = v17;
      int v22 = [v20 isEqualToString:v21];

      uint64_t v17 = v51;
      id v16 = v50;
      if (!v22) {
        goto LABEL_50;
      }
      uint64_t v23 = [(SBHIconManager *)self delegate];
      long long v24 = [v51 extensionBundleIdentifier];
      long long v49 = (void *)v23;
      if (objc_opt_respondsToSelector())
      {
        id v52 = 0;
        id v47 = v24;
        long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v24 error:&v52];
        id v26 = v52;
        if (!v25)
        {
          long long v27 = SBLogWidgets();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[SBHIconManager widgetHostViewController:requestsLaunch:]();
          }
        }
        uint64_t v28 = [v25 containingBundleRecord];
        long long v29 = (void *)v28;
        if (v25 && !v28)
        {
          id v30 = SBLogWidgets();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[SBHIconManager widgetHostViewController:requestsLaunch:]();
          }
        }
        uint64_t v31 = [v29 bundleIdentifier];
        if (v31) {
          char v45 = [v49 iconManager:self isIconVisibleForBundleIdentifier:v31];
        }
        else {
          char v45 = 0;
        }

        long long v24 = v47;
      }
      else
      {
        char v45 = 0;
      }
      uint64_t v46 = [v7 launchAction];
      uint64_t v32 = [v7 url];
      __int16 v48 = (void *)v32;
      if (v32)
      {
        id v33 = [v51 containerBundleIdentifier];
        if ([v33 isEqualToString:@"com.apple.PeopleViewService"])
        {
          id v34 = [(SBHHomeScreenSettings *)self->_homeScreenSettings widgetSettings];
          uint64_t v35 = [v34 personDetailInteractionSettings];
          LODWORD(v44) = [v35 usesCardStyle];

          uint64_t v32 = (uint64_t)v48;
          uint64_t v17 = v51;

          if (v44)
          {
            __int16 v36 = [(SBHIconManager *)self _personDetailInteractionContextForPersonURL:v48 iconView:v10];
            id v37 = [[SBHPeopleWidgetPersonDetailInteraction alloc] initWithInteractionContext:v36];
            [(SBHPeopleWidgetPersonDetailInteraction *)v37 setModalInteractionDelegate:self];
            [(SBHPeopleWidgetPersonDetailInteraction *)v37 beginInteractionAnimated:1];

            id v16 = v50;
            uint64_t v17 = v51;
LABEL_30:
            char v38 = (void *)v46;
LABEL_49:

            [(SBHHomeScreenUsageMonitor *)self->_usageMonitor noteUserTappedWidgetIcon:v16 withURL:v48];
LABEL_50:

            goto LABEL_51;
          }
        }
        else
        {
        }
      }
      if (objc_opt_respondsToSelector())
      {
        __int16 v36 = [v49 iconManager:self bundleIdentifierToLaunchForWidgetURL:v32];
        if (v36)
        {
          uint64_t v39 = [v17 containerBundleIdentifier];
          char v40 = [v36 isEqualToString:v39];

          char v41 = v32 ? v45 : 1;
          if ((v41 & 1) == 0)
          {
            id v42 = (void *)v46;
            if ((v40 & 1) != 0 || ![v7 isEntitledToOpenSystemProcesses])
            {
              id v16 = v50;
            }
            else
            {
              id v44 = sel_iconManager_widgetWantsLaunchForBundleIdentifier_withAction_;
              id v16 = v50;
              if ((objc_opt_respondsToSelector() & 1) != 0
                || (objc_opt_respondsToSelector() & 1) != 0
                || (objc_opt_respondsToSelector() & 1) != 0)
              {
                if ((objc_opt_respondsToSelector() & 1) == 0)
                {
                  uint64_t v17 = v51;
                  if (objc_opt_respondsToSelector())
                  {
                    char v38 = (void *)v46;
                    [v49 iconManager:self widgetWantsLaunchForBundleIdentifier:v36 withAction:v46];
                    goto LABEL_49;
                  }
                  [v49 iconManager:self wantsLaunchForWidgetURL:v32];
                  goto LABEL_30;
                }
                [v49 iconManager:self iconView:v10 widgetWantsLaunchForBundleIdentifier:v36 withAction:v46];
                char v38 = (void *)v46;
LABEL_48:
                uint64_t v17 = v51;
                goto LABEL_49;
              }
            }
LABEL_47:
            -[SBHIconManager highlightIconView:](self, "highlightIconView:", v10, v44);
            [MEMORY[0x1E4F1CAD0] setWithObject:v42];
            v43 = char v38 = v42;
            [(SBHIconManager *)self launchFromIconView:v10 withActions:v43 modifierFlags:0];

            goto LABEL_48;
          }
        }
      }
      else
      {
        __int16 v36 = 0;
      }
      id v16 = v50;
      id v42 = (void *)v46;
      goto LABEL_47;
    }
  }
LABEL_51:
}

- (void)widgetHostViewControllerUsesSystemBackgroundMaterialDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  id v15 = [v5 activeMultiplexingViewControllerForViewController:v4];

  id v6 = [(NSMapTable *)self->_iconViewsForWidgetMultiplexingViewController objectForKey:v15];
  id v7 = [(NSMapTable *)self->_widgetViewControllersForIconView objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = [v6 icon];
    int v9 = [(SBFolder *)self->_rootFolder indexPathForIcon:v8];
    id v10 = [(SBHIconManager *)self iconListViewForIndexPath:v9];
    [v10 _insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:v6];
    uint64_t v11 = objc_opt_class();
    id v12 = v7;
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

    [v14 evaluateBackground];
  }
}

- (BOOL)_determineIfAvocadoHostViewControllerIsVisible:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SBHIconManager__determineIfAvocadoHostViewControllerIsVisible___block_invoke;
  aBlock[3] = &unk_1E6AB4160;
  void aBlock[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  id v6 = _Block_copy(aBlock);
  [(SBHIconManager *)self enumerateDisplayedIconViewsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __65__SBHIconManager__determineIfAvocadoHostViewControllerIsVisible___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 customIconImageViewController];
  id v6 = v5;
  if (v5)
  {
    id v9 = v5;
    int v7 = objc_msgSend(v5, "sbh_isWidgetStackViewController");
    id v6 = v9;
    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) _determineIfAvocadoHostViewControllerIsVisible:*(void *)(a1 + 40) withinStackViewController:v9];
      id v6 = v9;
      if (v8)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
  }
}

- (BOOL)_determineIfAvocadoHostViewControllerIsVisible:(id)a3 withinStackViewController:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(a4, "widgetViewControllers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 multiplexedViewController];

        if (v11 == v5)
        {
          LOBYTE(v7) = objc_msgSend(v10, "bs_isAppearingOrAppeared");
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)multiplexingManager:(id)a3 willRemoveViewController:(id)a4 forIdentifier:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (objc_msgSend(v9, "sbh_isWidgetHostViewController")) {
    [v9 invalidate];
  }
  uint64_t v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManager:self willRemoveViewControllerForIdentifier:v7];
  }
}

- (BOOL)multiplexingManager:(id)a3 shouldCacheRecentViewController:(id)a4 forIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([v8 hasSuffix:@":Preview"])
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = [(SBHIconManager *)self iconModel];
    id v11 = [v10 widgetIconsContainingWidgetsMatchingUniqueIdentifier:v8];
    if ([v11 count])
    {
      id v12 = [(SBHIconManager *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ![v12 iconManager:self shouldCacheRecentViewController:v7 forIdentifier:v8])
      {
        long long v16 = SBLogWidgetCleanup();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138543362;
          id v19 = v7;
          _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Discarding %{public}@; will not cache",
            (uint8_t *)&v18,
            0xCu);
        }

        BOOL v9 = 0;
      }
      else
      {
        int v13 = objc_msgSend(v7, "bs_isAppearingOrAppeared");
        long long v14 = SBLogWidgetCleanup();
        long long v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SBHIconManager multiplexingManager:shouldCacheRecentViewController:forIdentifier:]();
          }

          objc_msgSend(v7, "bs_beginAppearanceTransition:animated:", 0, 0);
          objc_msgSend(v7, "bs_endAppearanceTransition");
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138543362;
            id v19 = v7;
            _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "Choosing to cache widget %{public}@ ", (uint8_t *)&v18, 0xCu);
          }
        }
        BOOL v9 = 1;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (id)_multiplexingViewControllerForIcon:(id)a3 dataSource:(id)a4 location:(id)a5 withPriority:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 uniqueIdentifier];
  long long v14 = (void *)v13;
  long long v15 = 0;
  if (v10 && v11 && v13)
  {
    long long v16 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v12 isEqualToString:@"SBIconLocationAddWidgetSheet"])
    {
      uint64_t v17 = [v14 stringByAppendingString:@":Preview"];

      long long v14 = (void *)v17;
    }
    if (([v16 hasViewControllerForIdentifier:v14] & 1) == 0)
    {
      int v18 = SBLogIcon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        id v22 = v10;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_INFO, "Creating new view controller for icon: %@, data source: %@", (uint8_t *)&v21, 0x16u);
      }

      id v19 = [(SBHIconManager *)self _makeCustomViewControllerForWidgetIcon:v10 dataSource:v11 location:v12];
      [v16 setViewController:v19 forIdentifier:v14];
    }
    long long v15 = (void *)[v16 newMultiplexingViewControllerForIdentifier:v14 atLevel:(double)a6];
  }
  return v15;
}

- (id)widgetStackViewController:(id)a3 viewControllerForDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 widgetIcon];
  BOOL v9 = [(NSMapTable *)self->_iconViewsForCustomIconImageViewController objectForKey:v6];
  if (v9) {
    goto LABEL_2;
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [v6 host];
    id v12 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (v9)
      {
LABEL_2:
        id v10 = [v9 location];
        uint64_t v11 = [v9 customIconImageViewControllerPriority];
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  NSLog(&cfstr_MissingIconvie.isa);
  id v10 = @"SBIconLocationRoot";
  BOOL v9 = 0;
  uint64_t v11 = 0;
LABEL_9:
  long long v14 = [(SBHIconManager *)self _multiplexingViewControllerForIcon:v8 dataSource:v7 location:v10 withPriority:v11];

  [(SBHIconManager *)self _updateWidgetMultiplexingViewController:v14 forIconView:v9];
  return v14;
}

- (id)widgetStackViewController:(id)a3 containerBundleIdentifierForDataSource:(id)a4
{
  return [(SBHIconManager *)self containerBundleIdentifierForDataSource:a4];
}

- (id)widgetStackViewController:(id)a3 containerApplicationNameForDataSource:(id)a4
{
  id v5 = [(SBHIconManager *)self containerBundleIdentifierForDataSource:a4];
  if (v5)
  {
    id v6 = [(SBHIconManager *)self applicationWithBundleIdentifier:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 displayName];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)widgetStackViewController:(id)a3 isDataSourceBlockedForScreenTimeExpiration:(id)a4
{
  id v5 = [(SBHIconManager *)self containerBundleIdentifierForDataSource:a4];
  if (v5)
  {
    id v6 = [(SBHIconManager *)self iconModel];
    id v7 = [(SBHIconManager *)self delegate];
    id v8 = [v6 applicationIconForBundleIdentifier:v5];
    BOOL v9 = v8;
    if (v8)
    {
      char v10 = [v8 isTimedOut];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        BOOL v11 = 0;
        goto LABEL_9;
      }
      char v10 = [v7 iconManager:self isTimedOutForDataSourceContainerBundleIdentifier:v5];
    }
    BOOL v11 = v10;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)widgetStackViewController:(id)a3 didActivateDataSource:(id)a4 fromUserInteraction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [v8 widgetIcon];
  BOOL v11 = v10;
  if (v9 && ([v10 hasIconDataSource:v9] & 1) == 0)
  {
    long long v14 = SBLogIcon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBHIconManager widgetStackViewController:didActivateDataSource:fromUserInteraction:]((uint64_t)v9, v11, v14);
    }
  }
  else
  {
    if (v5)
    {
      [v11 setStackChangeReason:1];
      [v11 setLastUserSelectedDataSource:v9];
      id v12 = SBLogIcon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v11 uniqueIdentifier];
        int v15 = 138412546;
        id v16 = v9;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Activating data source due to user scroll and setting last user selected data source: %@ for: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      [v11 setStackChangeReason:5];
      id v12 = SBLogIcon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Activating data source due to other scroll view interaction", (uint8_t *)&v15, 2u);
      }
    }

    [v11 setActiveDataSource:v9];
    [(SBHIconManager *)self _updateCaptureOnlyBackgroundViewForCustomIconImageViewController:v8];
  }
}

- (void)widgetStackViewController:(id)a3 didRemoveViewController:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  [v5 discardMultiplexingViewController:v6];

  [(NSMapTable *)self->_iconViewsForWidgetMultiplexingViewController removeObjectForKey:v6];
}

- (void)widgetStackViewController:(id)a3 didFinishUsingBackgroundView:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(SBHIconManager *)self widgetBackgroundViewMap];
    [v5 recycleView:v6];
  }
}

- (void)multiplexingWrapperViewControllerWillChangeGridAlignment:(id)a3
{
  id v4 = a3;
  if (([v4 isGridAligned] & 1) == 0) {
    [(SBHIconManager *)self _updateCaptureOnlyBackgroundViewForCustomIconImageViewController:v4];
  }
}

- (void)multiplexingWrapperViewControllerDidChangeGridAlignment:(id)a3
{
  id v4 = a3;
  if (([v4 isGridAligned] & 1) == 0) {
    [(SBHIconManager *)self _updateCaptureOnlyBackgroundViewForCustomIconImageViewController:v4];
  }
}

- (void)_updateCaptureOnlyBackgroundViewForCustomIconImageViewController:(id)a3
{
  id v10 = a3;
  char v4 = objc_opt_respondsToSelector();
  BOOL v5 = v10;
  if (v4)
  {
    id v6 = [v10 icon];
    id v7 = [(SBFolder *)self->_rootFolder indexPathForIcon:v6];
    id v8 = [(SBHIconManager *)self iconListViewForIndexPath:v7];
    if ([v8 containsIcon:v6])
    {
      id v9 = [(NSMapTable *)self->_iconViewsForCustomIconImageViewController objectForKey:v10];
      if (v9) {
        [v8 _insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:v9];
      }
    }
    BOOL v5 = v10;
  }
}

- (void)_reduceTransparencyStatusDidChange:(id)a3
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  labelImageCache = self->_labelImageCache;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __53__SBHIconManager__reduceTransparencyStatusDidChange___block_invoke;
  v6[3] = &__block_descriptor_33_e36_B16__0__SBIconLabelImageParameters_8l;
  BOOL v7 = IsReduceTransparencyEnabled;
  [(SBIconLabelImageCache *)labelImageCache removeLabelImagesWithParametersPassingTest:v6];
  [(SBHIconManager *)self _precacheDataForRootIcons];
}

BOOL __53__SBHIconManager__reduceTransparencyStatusDidChange___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 32);
  return v2 != [a2 isAccessibilityReduceTransparencyEnabled];
}

- (void)_sizeCategoryDidChange:(id)a3
{
  char v4 = [(SBHIconManager *)self precachedContentSizeCategory];
  labelImageCache = self->_labelImageCache;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __41__SBHIconManager__sizeCategoryDidChange___block_invoke;
  v6[3] = &unk_1E6AB41A8;
  void v6[4] = v4;
  [(SBIconLabelImageCache *)labelImageCache removeLabelImagesWithParametersPassingTest:v6];
  [(SBHIconManager *)self _precacheLabelsForRootIcons];
}

uint64_t __41__SBHIconManager__sizeCategoryDidChange___block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 contentSizeCategory];
  uint64_t v3 = BSEqualObjects() ^ 1;

  return v3;
}

- (void)launchFolderFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 icon];
  id v10 = [v7 location];
  BOOL v11 = objc_alloc_init(SBHIconLaunchContext);
  [(SBHIconLaunchContext *)v11 setIconView:v7];
  [(SBHIconLaunchContext *)v11 setActions:v8];
  id v12 = +[SBHIconViewContextMenuStateController sharedInstance];
  int v13 = [v12 areAnyIconViewContextMenusShowing];

  if (!v13) {
    goto LABEL_4;
  }
  long long v14 = [(SBHIconManager *)self previewInteractingIconView];
  int v15 = [v14 icon];

  if (v9 != v15)
  {
    id v16 = +[SBHIconViewContextMenuStateController sharedInstance];
    [v16 earlyTerminateAnyContextMenuAnimations];

LABEL_4:
    [(SBHIconManager *)self pushExpandedIcon:v9 location:v10 context:v11 forcePoppingPriorExpandedIcon:1 animated:1 completionHandler:0];
    goto LABEL_5;
  }
  __int16 v17 = SBLogIcon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_INFO, "Dismissing quick actions before opening folder", (uint8_t *)buf, 2u);
  }

  [(SBHIconManager *)self setDismissingMenuForFolderPresentation:1];
  objc_initWeak(buf, self);
  int v18 = +[SBHIconViewContextMenuStateController sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__SBHIconManager_launchFolderFromIconView_withActions_modifierFlags___block_invoke;
  v19[3] = &unk_1E6AB41F8;
  objc_copyWeak(&v24, buf);
  id v20 = v9;
  id v21 = v7;
  id v22 = v10;
  __int16 v23 = v11;
  [v18 dismissAppIconForceTouchControllers:v19];

  [(SBHIconManager *)self dismissIconShareSheets];
  objc_destroyWeak(&v24);
  objc_destroyWeak(buf);
LABEL_5:
}

void __69__SBHIconManager_launchFolderFromIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained setDismissingMenuForFolderPresentation:0];
  if ([WeakRetained isDisplayingIcon:*(void *)(a1 + 32)]
    && ([*(id *)(a1 + 40) icon],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEqual:*(void *)(a1 + 32)],
        v3,
        v4))
  {
    [WeakRetained pushExpandedIcon:*(void *)(a1 + 32) location:*(void *)(a1 + 48) context:*(void *)(a1 + 56) forcePoppingPriorExpandedIcon:1 animated:1 completionHandler:0];
  }
  else
  {
    BOOL v5 = SBLogIcon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Skipping opening folder after dismissing quick actions", v6, 2u);
    }
  }
}

- (void)iconTapped:(id)a3
{
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  id v6 = a4;
  id v7 = [a3 icon];
  if ([(SBHIconManager *)self hasOpenFolder])
  {
    if ([v6 isWidgetIcon]) {
      char v8 = 0;
    }
    else {
      char v8 = [(SBHIconManager *)self allowsNestedFolders];
    }
  }
  else if ([v7 isWidgetIcon] && objc_msgSend(v6, "isWidgetIcon"))
  {
    uint64_t v9 = [v7 iconDataSourcesExcludingSuggestionsCount];
    unint64_t v10 = [v6 iconDataSourcesExcludingSuggestionsCount] + v9;
    BOOL v11 = +[SBHHomeScreenDomain rootSettings];
    id v12 = [v11 widgetSettings];
    LOBYTE(v10) = v10 > [v12 maximumWidgetsInAStack];

    char v8 = v10 ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

- (void)iconCloseBoxTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Icon close box tapped: %@", (uint8_t *)&v9, 0xCu);
  }

  [(SBHIconManager *)self _noteUserIsInteractingWithIcons];
  [(SBHIconManager *)self _restartEditingEndTimer];
  if ([(SBHIconManager *)self _shouldRespondToIconCloseBoxes])
  {
    id v6 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 iconManager:self iconCloseBoxTapped:v4];
    }
    id v7 = [v4 icon];
    char v8 = [v4 location];
    if (objc_opt_respondsToSelector()) {
      [v6 iconManager:self wantsUninstallForIcon:v7 location:v8];
    }
  }
}

- (BOOL)iconViewDisplaysCloseBox:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconManager:self iconViewDisplaysCloseBox:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)iconViewDisplaysResizeHandle:(id)a3
{
  uint64_t v3 = [a3 icon];
  char v4 = [v3 isWidgetIcon];

  return v4;
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  char v4 = [(SBHIconManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isFocusAllowedForIconManager:self]) {
    BOOL v5 = ![(SBHIconManager *)self isEditing];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)focusEffectTypeForIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 iconManager:self focusEffectTypeForIconView:v4];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)iconView:(id)a3 editingModeGestureRecognizerDidFire:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(SBHIconManager *)self isEditingAllowed];
  int v7 = !v6 | [(SBHIconManager *)self isEditing];
  if (v7)
  {
    if (!v6 && [(SBHIconManager *)self isEditingAllowedForIconView:v5]) {
      [(SBHIconManager *)self setEditing:1 fromIconView:v5];
    }
  }
  else
  {
    [(SBHIconManager *)self setEditing:1];
  }

  return v7 ^ 1;
}

- (id)launchURLForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v5 iconManager:self launchURLForIconView:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)containerViewForPresentingContextMenuForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v5 iconManager:self containerViewForPresentingContextMenuForIconView:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)iconView:(id)a3 willUseContextMenuStyle:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self iconView:v8 willUseContextMenuStyle:v6];
  }
}

- (id)iconView:(id)a3 iconLabelAccessoryViewOfType:(int64_t)a4
{
  id v5 = [(SBHIconManager *)self homescreenIconLabelAccessoryViewMap];
  id v6 = [v5 viewOfClass:SBViewClassForIconLabelAccessoryType(a4)];

  return v6;
}

- (void)iconView:(id)a3 willRemoveIconLabelAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self homescreenIconLabelAccessoryViewMap];
  [v6 recycleView:v5];
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = [v5 iconManager:self closeBoxTypeForIconView:v4 proposedType:0];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)supportedGridSizeClassesForIconView:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = [v20 icon];
  if (![v21 isWidgetIcon]) {
    goto LABEL_24;
  }
  id v22 = v21;
  uint64_t v3 = [v22 iconDataSources];
  __int16 v23 = [(SBHIconManager *)self gridSizeClassDomain];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = v3;
  id v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v10 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v12 = v9;
          int v13 = [(SBHIconManager *)self widgetExtensionProvider];
          long long v14 = objc_msgSend(v13, "sbh_descriptorForWidgetIdentifiable:", v12);

          int v15 = -[SBHIconGridSizeClassSet initWithCHSWidgetFamilyMask:inDomain:]([SBHIconGridSizeClassSet alloc], "initWithCHSWidgetFamilyMask:inDomain:", [v14 supportedFamilies], v23);
          if (!v15) {
            continue;
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
          int v15 = [v9 supportedGridSizeClassesForIcon:v22];
          if (!v15) {
            continue;
          }
        }
        if (v5) {
          [v5 intersectGridSizeClassSet:v15];
        }
        else {
          id v5 = (void *)[(SBHIconGridSizeClassSet *)v15 mutableCopy];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (!v6) {
        break;
      }
    }
  }

  id v16 = [v20 location];
  if ([v5 containsGridSizeClass:@"SBHIconGridSizeClassNewsLargeTall"]
    && SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", v16))
  {
    __int16 v17 = [(SBHIconManager *)self rootFolder];
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__SBHIconManager_supportedGridSizeClassesForIconView___block_invoke;
    v25[3] = &unk_1E6AB4220;
    id v26 = v22;
    long long v27 = &v28;
    [v17 enumerateTodayListIconsUsingBlock:v25];
    if (*((unsigned char *)v29 + 24)) {
      [v5 removeGridSizeClass:@"SBHIconGridSizeClassNewsLargeTall"];
    }

    _Block_object_dispose(&v28, 8);
  }

  if (!v5)
  {
LABEL_24:
    int v18 = [(SBHIconManager *)self gridSizeClassDomain];
    id v5 = [v18 allGridSizeClasses];
  }
  return v5;
}

void __54__SBHIconManager_supportedGridSizeClassesForIconView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v6 = [v12 gridSizeClass];
  uint64_t v7 = v6;
  if (v6 == @"SBHIconGridSizeClassNewsLargeTall")
  {
    id v11 = *(id *)(a1 + 32);

    id v10 = v12;
    if (v11 == v12) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  id v8 = [v12 gridSizeClass];
  if (([v8 isEqualToString:@"SBHIconGridSizeClassNewsLargeTall"] & 1) == 0)
  {

    id v10 = v12;
    goto LABEL_8;
  }
  id v9 = *(id *)(a1 + 32);

  id v10 = v12;
  if (v9 != v12)
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_8:
}

- (id)supportedIconGridSizeClassesForResizeOfIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self supportedGridSizeClassesForIconView:v4];
  uint64_t v6 = [v4 icon];
  if ([v6 isWidgetStackIcon])
  {
    id v5 = v5;
    uint64_t v7 = v5;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F4B7E0];
    id v9 = [v4 icon];
    id v10 = [v9 applicationBundleID];
    id v11 = [v8 applicationWithBundleIdentifier:v10];

    if ([v11 isLocked])
    {
      id v12 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
    }
    else
    {
      if ([v6 isWidgetIcon])
      {
        id v13 = v6;
        long long v14 = [v13 activeDataSource];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          [v14 containerBundleIdentifier];
        }
        int v15 = [(SBHIconManager *)self iconForReplacingWidgetIconWithAppIcon:v13];
        if ([v15 isApplicationIcon])
        {
          id v16 = [v15 application];
          __int16 v17 = v16;
          if (v16 && ([v16 hasHiddenTag] & 1) == 0)
          {
            uint64_t v18 = [v5 gridSizeClassSetByAddingGridSizeClass:@"SBHIconGridSizeClassDefault"];

            id v5 = (id)v18;
          }
        }
        else
        {
          __int16 v17 = 0;
        }
      }
      if ([v6 isApplicationIcon])
      {
        uint64_t v19 = [(SBHIconManager *)self iconDataSourceForReplacingAppIconWithWidgetIcon:v6];
        if (objc_opt_respondsToSelector()) {
          [v19 supportedGridSizeClassesForIcon:v6];
        }
        else {
        uint64_t v20 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
        }

        id v5 = (id)v20;
      }
      id v12 = v5;
      id v5 = v12;
    }
    uint64_t v7 = v12;
  }
  return v7;
}

- (id)screenSnapshotProviderForComponentsOfIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 iconManager:self screenSnapshotProviderForComponentsOfIconView:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)accessibilityTintColorForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 iconManager:self accessibilityTintColorForIconView:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)iconViewDidBeginTrackingPossibleResize:(id)a3 context:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [v17 icon];
  if ([v7 isWidgetIcon])
  {
    id v8 = v7;
    id v9 = [v17 nextSmallerGridSizeClassForResize];
    if (v9)
    {
      uint64_t v10 = [(SBHIconManager *)self preWarmCustomViewControllerForWidgetIcon:v8 withGridSizeClass:v9];
      if (v10)
      {
        id v11 = (void *)v10;
        [v6 setObject:v10 forKey:@"smallerViewController"];
      }
    }
    id v12 = [v17 nextLargerGridSizeClassForResize];
    if (v12)
    {
      uint64_t v13 = [(SBHIconManager *)self preWarmCustomViewControllerForWidgetIcon:v8 withGridSizeClass:v12];
      if (v13)
      {
        long long v14 = (void *)v13;
        [v6 setObject:v13 forKey:@"largerViewController"];
      }
    }
    int v15 = [(SBHIconManager *)self rootFolderController];
    id v16 = [v15 disableAutoScrollForReason:@"icon resize"];
    if (v16) {
      [v6 setObject:v16 forKey:@"autoScrollAssertion"];
    }
  }
}

- (id)preWarmCustomViewControllerForWidgetIcon:(id)a3 withGridSizeClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 gridSizeClass];
  if ((id)v8 == v7)
  {
  }
  else
  {
    id v9 = (void *)v8;
    uint64_t v10 = [v6 gridSizeClass];
    int v11 = [v10 isEqualToString:v7];

    if (!v11)
    {
      id v12 = [(SBHIconManager *)self makeResizedCopyOfWidgetIcon:v6 withGridSizeClass:v7];
      uint64_t v13 = [(SBHIconManager *)self preWarmCustomViewControllerForWidgetIcon:v12];

      goto LABEL_6;
    }
  }
  uint64_t v13 = [(SBHIconManager *)self preWarmCustomViewControllerForWidgetIcon:v6];
LABEL_6:

  return v13;
}

- (id)preWarmCustomViewControllerForWidgetIcon:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activeDataSource];
  id v6 = [(SBHIconManager *)self _multiplexingViewControllerForIcon:v4 dataSource:v5 location:@"SBIconLocationRoot" withPriority:0];

  [v6 beginAppearanceTransition:1 animated:0];
  [v6 endAppearanceTransition];
  return v6;
}

- (id)_customViewControllerForResizingIcon:(id)a3 gridSizeClass:(id)a4 dataSource:(id)a5 location:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (self,
        id v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = objc_opt_isKindOfClass(),
        v16,
        (v17 & 1) != 0))
  {
    uint64_t v18 = [(SBHIconManager *)self _makeCustomViewControllerForWidgetIcon:v10 dataSource:v12 location:v13 gridSizeClass:v11];
  }
  else if (v11 && ![v11 isEqualToString:@"SBHIconGridSizeClassDefault"])
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v20 = [SBHLeafIconCustomImageViewController alloc];
    id v21 = [(SBHIconManager *)self iconImageCache];
    uint64_t v18 = [(SBHLeafIconCustomImageViewController *)v20 initWithIcon:v10 iconImageCache:v21];
  }
  return v18;
}

- (void)iconView:(id)a3 wantsResizeToGridSizeClass:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  uint64_t v8 = (void (**)(void))a5;
  id v9 = [a3 icon];
  if ([v9 isWidgetIcon])
  {
    [(SBHIconManager *)self changeSizeOfWidgetIcon:v9 toSizeClass:v10 animated:1 completionHandler:v8];
    [(SBHIconManager *)self _restartEditingEndTimer];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)iconViewDidEndTrackingPossibleResize:(id)a3 context:(id)a4
{
  id v4 = a4;
  id v5 = [v4 objectForKey:@"autoScrollAssertion"];
  [v5 invalidate];
  [v4 removeObjectForKey:@"autoScrollAssertion"];
}

- (id)resizeGestureHandlerForIconView:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 icon];
  if ([v5 isWidgetIcon])
  {
    id v6 = [v5 activeDataSource];
    if (v6)
    {
      id v7 = [(SBHIconManager *)self rootFolderController];
      uint64_t v8 = [v7 rootFolderView];
      id v9 = [v8 iconListViewDisplayingIconView:v4];

      if (v9)
      {
LABEL_16:
        [(SBHIconManager *)self _discardEndEditingTimerAndDontResetUntilReasonIsRemoved:@"widget resize"];
        int v15 = [(SBHIconManager *)self widgetMetricsProvider];
        id v10 = [[SBWidgetIconResizeGestureHandler alloc] initWithIconView:v4 iconListView:v9 widgetMetricsProvider:v15];
        [(SBWidgetIconResizeGestureHandler *)v10 setDelegate:self];
      }
      else
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = [(SBHIconManager *)self todayViewControllers];
        id v10 = (SBWidgetIconResizeGestureHandler *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v18;
          while (2)
          {
            for (uint64_t i = 0; i != v10; uint64_t i = (SBWidgetIconResizeGestureHandler *)((char *)i + 1))
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
              if ([v13 isDisplayingIconView:v4])
              {
                uint64_t v14 = [v13 listView];

                id v9 = (void *)v14;
                goto LABEL_16;
              }
            }
            id v10 = (SBWidgetIconResizeGestureHandler *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
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

  return v10;
}

- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self reasonToDisallowInteractionOnIconView:v4];
  if (v5
    || ([(SBHIconManager *)self previewInteractingIconView],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else if (![(SBHIconManager *)self isEditing])
  {
    uint64_t v8 = [(SBHIconManager *)self currentTransitionAnimator];

    if (!v8)
    {
      id v9 = [v4 icon];
      int v10 = [v9 isFolderIcon];

      if (!v10
        || (id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingFolderIconToOpen),
            WeakRetained,
            !WeakRetained))
      {
        [(SBHIconManager *)self _setupApplicationShortcutItemsForPresentation:v4];
        BOOL v6 = 1;
        goto LABEL_5;
      }
    }
  }
  BOOL v6 = 0;
LABEL_5:

  return v6;
}

- (void)_setupApplicationShortcutItemsForPresentation:(id)a3
{
  id v6 = a3;
  -[SBHIconManager setPreviewInteractingIconView:](self, "setPreviewInteractingIconView:");
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 iconManager:self applicationShortcutItemsForIconView:v6];
  }
  else
  {
    id v5 = 0;
  }
  [v6 setApplicationShortcutItems:v5];
}

- (void)iconViewShortcutsPresentationWillFinish:(id)a3
{
}

- (void)iconViewShortcutsPresentationDidCancel:(id)a3
{
}

- (id)iconView:(id)a3 applicationShortcutItemsWithProposedItems:(id)a4
{
  id v6 = a4;
  id v7 = [a3 location];
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __69__SBHIconManager_iconView_applicationShortcutItemsWithProposedItems___block_invoke;
  id v16 = &unk_1E6AB4248;
  long long v17 = self;
  id v18 = v7;
  id v9 = v7;
  int v10 = [v8 predicateWithBlock:&v13];
  uint64_t v11 = objc_msgSend(v6, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16, v17);

  return v11;
}

uint64_t __69__SBHIconManager_iconView_applicationShortcutItemsWithProposedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 type];
  int v5 = [v4 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.rearrange-icons"];

  if (!v5)
  {
LABEL_6:
    id v7 = [v3 type];
    int v8 = [v7 isEqualToString:@"com.apple.springboardhome.application-shortcut-item.delete-app"];

    if (!v8 || [*(id *)(a1 + 32) isRootFolderContentVisible])
    {
      uint64_t v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  if (![*(id *)(a1 + 32) isRootFolderContentVisible]) {
    goto LABEL_9;
  }
  if (!SBIconLocationGroupContainsLocation(@"SBIconLocationGroupTodayView", *(void **)(a1 + 40)))
  {
    if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupAppLibrary", *(void **)(a1 + 40))) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  uint64_t v6 = [*(id *)(a1 + 32) isOverlayCoverSheetTodayViewVisible] ^ 1;
LABEL_10:

  return v6;
}

- (BOOL)iconView:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(SBHIconManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v10 iconManager:self shouldActivateApplicationShortcutItem:v9 atIndex:a5 forIconView:v8]|| (id WeakRetained = objc_loadWeakRetained((id *)&self->_pendingFolderIconToOpen), WeakRetained, WeakRetained))
  {
    BOOL v12 = 0;
  }
  else
  {
    [(SBHIconManager *)self setPreviewInteractingIconView:0];
    BOOL v12 = 1;
  }

  return v12;
}

- (unint64_t)supportedMultitaskingShortcutActionsForIconView:(id)a3
{
  id v4 = a3;
  int v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 iconManager:self supportedMultitaskingShortcutActionsForIconView:v4];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (v8)
    {
      id v9 = [(SBHIconManager *)self widgetExtensionProvider];
      int v10 = objc_msgSend(v9, "sbh_descriptors");
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__SBHIconManager_iconView_supportsConfigurationForDataSource___block_invoke;
      v22[3] = &unk_1E6AB4270;
      id v11 = v8;
      id v23 = v11;
      BOOL v12 = objc_msgSend(v10, "bs_firstObjectPassingTest:", v22);

      uint64_t v13 = [v12 intentType];

      if (v13)
      {
        uint64_t v14 = [v6 icon];
        if ([v14 isWidgetIcon])
        {
          int v15 = [v6 icon];
        }
        else
        {
          int v15 = 0;
        }

        id v16 = [(SBHIconManager *)self _intentForWidget:v11 ofIcon:v15 creatingIfNecessary:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(self) = 1;
        }
        else
        {
          self = [v16 _codableDescription];
          [(SBHIconManager *)self attributes];
          long long v17 = v21 = v9;
          [v17 allValues];
          id v18 = v20 = v15;

          id v9 = v21;
          LOBYTE(self) = objc_msgSend(v18, "bs_containsObjectPassingTest:", &__block_literal_global_736);

          int v15 = v20;
        }
      }
      if (v13)
      {

        goto LABEL_21;
      }
    }

LABEL_20:
    LOBYTE(self) = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    LOBYTE(self) = _os_feature_enabled_impl();
  }
LABEL_21:

  return self & 1;
}

uint64_t __62__SBHIconManager_iconView_supportsConfigurationForDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 extensionBundleIdentifier];
  int v5 = [*(id *)(a1 + 32) extensionBundleIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [v3 kind];
    id v7 = [*(id *)(a1 + 32) kind];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __62__SBHIconManager_iconView_supportsConfigurationForDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isConfigurable];
}

- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4
{
  id v6 = a4;
  id v7 = [a3 icon];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = objc_opt_class();
    id v13 = v6;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v17 = v14;

    id v18 = [(SBHIconManager *)self widgetExtensionProvider];
    objc_msgSend(v18, "sbh_descriptorForWidgetIdentifiable:", v17);
    long long v19 = (SBHSpecialWidgetDescriptor *)objc_claimAutoreleasedReturnValue();
    id v20 = [(SBHIconManager *)self _intentForWidget:v17 ofIcon:v11 creatingIfNecessary:0];

    if (!v19) {
      goto LABEL_26;
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [SBHSpecialWidgetDescriptor alloc];
    uint64_t v16 = 2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = [SBHSpecialWidgetDescriptor alloc];
      uint64_t v16 = 6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v25 = SBLogIcon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[SBHIconManager iconView:configurationInteractionForDataSource:]();
        }

        id v20 = 0;
        long long v19 = 0;
        goto LABEL_26;
      }
      int v15 = [SBHSpecialWidgetDescriptor alloc];
      uint64_t v16 = 3;
    }
  }
  long long v19 = [(SBHSpecialWidgetDescriptor *)v15 initWithType:v16];
  id v20 = [(SBHIconManager *)self _newIntentForDataSource:v6 inIcon:v11];
  if (v19)
  {
LABEL_21:
    if (v20)
    {
      id v21 = [SBHWidgetConfigurationInteraction alloc];
      uint64_t v22 = [v11 gridSizeClass];
      id v23 = [(SBHIconManager *)self gridSizeClassDomain];
      id v24 = [(SBHWidgetConfigurationInteraction *)v21 initWithDescriptor:v19 gridSizeClass:v22 gridSizeClassDomain:v23 intent:v20 configuredDataSource:v6];

      goto LABEL_29;
    }
  }
LABEL_26:
  id v26 = SBLogIcon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[SBHIconManager iconView:configurationInteractionForDataSource:]();
  }

  id v24 = 0;
LABEL_29:

  return v24;
}

- (id)stackConfigurationInteractionForIconView:(id)a3
{
  id v4 = a3;
  int v5 = [v4 icon];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  int v10 = [(SBHIconManager *)self delegate];
  BOOL v11 = [(SBHIconManager *)self _alwaysPresentStackConfigurationSheet];
  if (([v9 isWidgetStackIcon] & 1) != 0 || v11)
  {
    uint64_t v12 = [(SBHIconManager *)self _stackConfigurationForStackIcon:v9];
    if (v12)
    {
      id v13 = [(SBHIconManager *)self rootFolderController];
      uint64_t v14 = [SBHStackConfigurationInteraction alloc];
      int v15 = [(SBHIconManager *)self listLayoutProvider];
      long long v32 = v12;
      uint64_t v12 = [(SBHStackConfigurationInteraction *)v14 initWithConfiguration:v12 iconView:v4 iconViewProvider:self listLayoutProvider:v15];

      uint64_t v16 = [(SBHIconManager *)self iconView:v4 containerViewControllerForConfigurationInteraction:v12];
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (v17 = objc_opt_respondsToSelector(), id v18 = (void *)v16, (v17 & 1) == 0))
      {
        id v18 = v13;
      }
      id v19 = v18;
      [(SBHStackConfigurationInteraction *)v12 setPresenter:v19];
      id v20 = [v4 window];
      id v21 = v20;
      if (v20) {
        [v20 interfaceOrientation];
      }
      if (v19 == v13) {
        [v13 showsAddWidgetButtonWhileEditingAllowedOrientations];
      }
      uint64_t v22 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
      char v31 = (void *)v16;
      if (objc_opt_respondsToSelector())
      {
        id v23 = [v10 iconManager:self stackConfigurationInteractionDelegateForIconView:v4];
      }
      else
      {
        id v23 = v13;
      }
      id v24 = v23;
      [(SBHStackConfigurationInteraction *)v12 setStackConfigurationDelegate:v23];
      uint64_t v30 = v19;
      uint64_t v25 = v13;
      uint64_t v26 = v22;
      if (objc_opt_respondsToSelector())
      {
        id v27 = [v10 iconManager:self stackConfigurationViewControllerAppearanceDelegateForIconView:v4];
      }
      else
      {
        id v27 = v25;
      }
      uint64_t v28 = v27;
      [(SBHStackConfigurationInteraction *)v12 setAppearanceDelegate:v27];
      [(SBHStackConfigurationInteraction *)v12 setShowsAddButton:v26];
      [(SBHStackConfigurationInteraction *)v12 setShowsDoneButton:[(SBHIconManager *)self showsDoneButtonWhileEditing]];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)iconView:(id)a3 containerViewControllerForConfigurationInteraction:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 iconManager:self containerViewControllerForConfigurationOfIconView:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)iconView:(id)a3 containerViewForConfigurationInteraction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 iconManager:self containerViewForConfigurationOfIconView:v7];
  }
  else
  {
    int v10 = [(SBHIconManager *)self iconView:v7 containerViewControllerForConfigurationInteraction:v6];

    id v9 = [v10 view];
    id v7 = v10;
  }

  return v9;
}

- (CGRect)iconView:(id)a3 contentBoundingRectForConfigurationInteraction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 iconManager:self contentBoundingRectForConfigurationOfIconView:v7];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    char v17 = [(SBHIconManager *)self iconView:v7 containerViewForConfigurationInteraction:v6];

    [v17 bounds];
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
    id v7 = v17;
  }

  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4
{
  id v5 = a3;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v7 = [v6 iconManager:self userInterfaceStyleForConfigurationOfIconView:v5];
  }
  else
  {
    uint64_t v8 = [v5 traitCollection];

    int64_t v7 = [v8 userInterfaceStyle];
    id v5 = v8;
  }

  return v7;
}

- (id)iconView:(id)a3 homeScreenContentViewForConfigurationInteraction:(id)a4
{
  id v5 = a3;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v7 = [v6 iconManager:self homeScreenContentViewForConfigurationOfIconView:v5];
  }
  else
  {
    uint64_t v8 = [(SBHIconManager *)self rootFolderController];
    int64_t v7 = [v8 view];
  }
  return v7;
}

- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [a3 icon];
  if ([v7 isLeafIcon])
  {
    id v8 = v7;
    if ([v8 isWidgetIcon]) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
    id v10 = v9;
    double v11 = [v6 configuration];
    uint64_t v12 = objc_opt_class();
    id v13 = v11;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        double v14 = v13;
      }
      else {
        double v14 = 0;
      }
    }
    else
    {
      double v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      id v49 = v8;
      id v50 = v7;
      id v51 = v6;
      objc_msgSend(v10, "setAllowsSuggestions:", objc_msgSend(v15, "allowsSuggestions"));
      objc_msgSend(v10, "setAllowsExternalSuggestions:", objc_msgSend(v15, "allowsExternalSuggestions"));
      id v48 = v15;
      double v16 = [v15 dataSources];
      char v17 = [v10 iconDataSources];
      double v18 = [v16 differenceFromArray:v17];

      double v19 = [v18 insertions];
      __int16 v53 = objc_msgSend(v19, "bs_mapNoNulls:", &__block_literal_global_762);

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      double v20 = [v18 removals];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v59 != v23) {
              objc_enumerationMutation(v20);
            }
            double v25 = [*(id *)(*((void *)&v58 + 1) + 8 * i) object];
            if ([v53 containsObject:v25])
            {
              uint64_t v26 = self->_movedStackConfigDataSources;
              if (!v26) {
                uint64_t v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [(NSMutableArray *)v26 addObject:v25];
              movedStackConfigDataSources = self->_movedStackConfigDataSources;
              self->_movedStackConfigDataSources = v26;
            }
            [v10 removeIconDataSource:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v22);
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v47 = v18;
      id obj = [v18 insertions];
      uint64_t v28 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v55 != v30) {
              objc_enumerationMutation(obj);
            }
            long long v32 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            long long v33 = [v32 object];
            id v62 = v33;
            long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
            long long v35 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v32, "index"));
            [v10 insertIconDataSources:v34 atIndexes:v35];

            __int16 v36 = self->_movedStackConfigDataSources;
            uint64_t v37 = [v32 object];
            LODWORD(v36) = [(NSMutableArray *)v36 containsObject:v37];

            if (v36)
            {
              char v38 = self->_movedStackConfigDataSources;
              uint64_t v39 = [v32 object];
              [(NSMutableArray *)v38 removeObject:v39];
            }
          }
          uint64_t v29 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
        }
        while (v29);
      }

      char v40 = [(SBHIconManager *)self rootFolder];
      [v40 markIconStateDirty];

      int64_t v7 = v50;
      id v6 = v51;
      id v15 = v48;
      id v8 = v49;
    }
    else
    {
      char v41 = [v6 configuredDataSource];
      id v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        id v43 = [v8 activeDataSource];
      }
      id v44 = v43;

      char v45 = [v6 configuration];
      [(SBHIconManager *)self _handleUpdatedConfiguration:v45 forDataSource:v44 ofIcon:v8 archiving:1];
    }
    uint64_t v46 = [(SBHIconManager *)self usageMonitor];
    [v46 noteUserConfiguredIcon:v8];
  }
}

uint64_t __65__SBHIconManager_iconView_configurationDidUpdateWithInteraction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 object];
}

- (void)_handleUpdatedConfiguration:(id)a3 forDataSource:(id)a4 ofIcon:(id)a5 archiving:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  if ([v12 isWidgetIcon]) {
    double v14 = v12;
  }
  else {
    double v14 = 0;
  }
  id v15 = v14;
  uint64_t v16 = objc_opt_class();
  id v17 = v13;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      double v18 = v17;
    }
    else {
      double v18 = 0;
    }
  }
  else
  {
    double v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = SBHShortcutsFolderElement;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = SBHShortcutsSingleElement;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v20 = 0;
          if (!v6) {
            goto LABEL_25;
          }
          goto LABEL_21;
        }
        id v27 = SBHFilesElement;
      }
    }
    id v20 = objc_alloc_init(v27);
    if (!v6) {
      goto LABEL_25;
    }
LABEL_21:
    if (v20) {
      id v28 = v20;
    }
    else {
      id v28 = v17;
    }
    [(SBHIconManager *)self _archiveConfiguration:v10 forDataSource:v28 ofIcon:v12];
    goto LABEL_25;
  }
  id v20 = (id)[v19 copyWithUniqueIdentifier];
  uint64_t v21 = SBLogWidgets();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    [v19 extensionBundleIdentifier];
    uint64_t v22 = v31 = v6;
    [v19 uniqueIdentifier];
    uint64_t v23 = v32 = self;
    double v24 = [v20 extensionBundleIdentifier];
    [v20 uniqueIdentifier];
    id v33 = v15;
    v26 = id v25 = v10;
    *(_DWORD *)buf = 138544130;
    id v35 = v22;
    __int16 v36 = 2114;
    uint64_t v37 = v23;
    __int16 v38 = 2114;
    uint64_t v39 = v24;
    __int16 v40 = 2114;
    char v41 = v26;
    _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created to replace widget %{public}@ %{public}@.", buf, 0x2Au);

    id v10 = v25;
    id v15 = v33;

    self = v32;
    BOOL v6 = v31;
  }

  if (v6) {
    goto LABEL_21;
  }
LABEL_25:
  if (v20)
  {
    [v15 replaceIconDataSource:v17 withIconDataSource:v20];
    uint64_t v29 = SBLogIcon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v15 uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      id v35 = v20;
      __int16 v36 = 2112;
      uint64_t v37 = v30;
      _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_DEFAULT, "Setting last user selected data source due to configuration update: %@ for: %@", buf, 0x16u);
    }
    [v15 setLastUserSelectedDataSource:v20];
  }
}

- (void)_archiveConfiguration:(id)a3 forDataSource:(id)a4 ofIcon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
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

  if (objc_opt_respondsToSelector())
  {
    id v15 = [v9 uniqueIdentifier];
  }
  else
  {
    id v15 = 0;
  }
  id v26 = 0;
  uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v26];
  id v17 = v26;
  double v18 = v17;
  if (!v16 || v17)
  {
    id v19 = SBLogIcon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[SBHIconManager _archiveConfiguration:forDataSource:ofIcon:]();
    }
  }
  else
  {
    id v19 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v19 iconManager:self dataSource:v9 ofIcon:v10 didUpdateConfigurationData:v16];
    }
    if (v14 && v15)
    {
      archivedWidgetIntents = self->_archivedWidgetIntents;
      if (!archivedWidgetIntents)
      {
        uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v22 = self->_archivedWidgetIntents;
        self->_archivedWidgetIntents = v21;

        archivedWidgetIntents = self->_archivedWidgetIntents;
      }
      [(NSMutableDictionary *)archivedWidgetIntents setObject:v14 forKey:v15];
    }
  }

  if (v14 && v15)
  {
    widgetIntents = self->_widgetIntents;
    if (!widgetIntents)
    {
      double v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v25 = self->_widgetIntents;
      self->_widgetIntents = v24;

      widgetIntents = self->_widgetIntents;
    }
    [(NSMutableDictionary *)widgetIntents setObject:v14 forKey:v15];
  }
}

- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(SBHIconManager *)self currentConfiguringIconView];
  if (v7 != v9)
  {
    [(SBHIconManager *)self dismissModalInteractionsImmediately];
    [(SBHIconManager *)self setCurrentConfiguringIconView:v9];
  }
  [(SBHIconManager *)self _discardEndEditingTimerAndDontResetUntilReasonIsRemoved:@"IconViewConfiguration"];
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManager:self iconView:v9 configurationWillBeginWithInteraction:v6];
  }
}

- (void)iconView:(id)a3 configurationWillEndWithInteraction:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self iconView:v8 configurationWillEndWithInteraction:v6];
  }
}

- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SBHIconManager *)self currentConfiguringIconView];

  if (v7 == v10) {
    [(SBHIconManager *)self setCurrentConfiguringIconView:0];
  }
  [(SBHIconManager *)self _removeReasonToNotResetEndEditingTimer:@"IconViewConfiguration"];
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManager:self iconView:v10 configurationDidEndWithInteraction:v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v10 icon];
    if (![v9 iconDataSourceCount]) {
      [(SBHIconManager *)self uninstallIcon:v9 animate:1];
    }
  }
}

- (BOOL)_alwaysPresentStackConfigurationSheet
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 iconManagerAllowsWidgetStackWithSingleWidgetToPresentStackConfigurationSheet:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  double v6 = -1.0;
  if (objc_opt_respondsToSelector())
  {
    [v5 iconManager:self verticalMarginPercentageForConfigurationOfIconView:v4];
    double v6 = v7;
  }

  return v6;
}

- (void)modalInteractionWillBegin:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(SBHIconManager *)self currentPersonDetailInteraction];
    id v5 = v7;
    if (v4 != v5)
    {
      [(SBHIconManager *)self dismissModalInteractionsImmediately];
      [(SBHIconManager *)self setCurrentPersonDetailInteraction:v5];
    }
  }
  double v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconManager:self modalInteractionWillBegin:v7];
  }
}

- (void)modalInteractionDidEnd:(id)a3
{
  id v6 = a3;
  id v4 = [(SBHIconManager *)self currentPersonDetailInteraction];

  if (v4 == v6) {
    [(SBHIconManager *)self setCurrentPersonDetailInteraction:0];
  }
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self modalInteractionDidEnd:v6];
  }
}

- (id)_containerViewControllerForPersonDetailInteractionTargetingIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 iconManager:self containerViewControllerForModalInteractionFromIconView:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_containerViewForPersonDetailInteractionTargetingIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 iconManager:self containerViewForModalInteractionFromIconView:v4];
  }
  else
  {
    id v7 = [(SBHIconManager *)self _containerViewControllerForPersonDetailInteractionTargetingIconView:v4];

    id v6 = [v7 view];
    id v4 = v7;
  }

  return v6;
}

- (id)_homeScreenContentViewForPersonDetailInteractionTargetingIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 iconManager:self homeScreenContentViewForModalInteractionFromIconView:v4];
  }
  else
  {
    id v7 = [(SBHIconManager *)self rootFolderController];
    id v6 = [v7 view];
  }
  return v6;
}

- (id)_personDetailInteractionContextForPersonURL:(id)a3 iconView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 representativeIconViewForModalInteractions];
  id v9 = [(SBHIconManager *)self _containerViewControllerForPersonDetailInteractionTargetingIconView:v6];
  id v10 = [(SBHIconManager *)self _containerViewForPersonDetailInteractionTargetingIconView:v6];
  uint64_t v11 = [(SBHIconManager *)self _homeScreenContentViewForPersonDetailInteractionTargetingIconView:v6];
  [v11 bounds];
  objc_msgSend(v11, "convertRect:toView:", v10);
  uint64_t v16 = -[SBHPeopleWidgetPersonDetailInteractionContext initWithPersonURL:sourceIconView:referenceIconView:containerViewController:containerView:homeScreenContentView:homeScreenContentFrame:]([SBHPeopleWidgetPersonDetailInteractionContext alloc], "initWithPersonURL:sourceIconView:referenceIconView:containerViewController:containerView:homeScreenContentView:homeScreenContentFrame:", v7, v8, v6, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (id)widgetInsertionRippleIconAnimatorForIcon:(id)a3 iconListView:(id)a4 withReferenceIconView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    goto LABEL_3;
  }
  uint64_t v11 = [(SBHIconManager *)self rootFolder];
  double v12 = [v11 indexPathForIcon:v8];
  id v9 = [(SBHIconManager *)self iconListViewForIndexPath:v12];

  if (v9)
  {
LABEL_3:
    double v13 = [v9 iconLocation];
    if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v13))
    {
      double v14 = [(SBHIconManager *)self dockListView];
    }
    else
    {
      double v14 = 0;
    }
    uint64_t v15 = [v13 isEqualToString:@"SBIconLocationStackConfiguration"];
    uint64_t v16 = [(SBHIconManager *)self listLayoutProvider];
    id v17 = [v16 layoutForIconLocation:@"SBIconLocationRoot"];

    double v18 = [SBHWidgetInsertionRippleIconAnimator alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__SBHIconManager_widgetInsertionRippleIconAnimatorForIcon_iconListView_withReferenceIconView___block_invoke;
    v21[3] = &unk_1E6AAC810;
    void v21[4] = self;
    id v19 = [(SBHWidgetInsertionRippleIconAnimator *)v18 initWithIconListView:v9 widgetIcon:v8 referenceLayout:v17 referenceIconView:v10 additionalIconListView:v14 preludeBlock:v21];
    [(SBHWidgetInsertionRippleIconAnimator *)v19 setKeepsJumpingIconAboveListViewAsLongAsPossible:v15];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

uint64_t __94__SBHIconManager_widgetInsertionRippleIconAnimatorForIcon_iconListView_withReferenceIconView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _willAnimateWidgetInsertion];
}

- (void)_willAnimateWidgetInsertion
{
  id v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 iconManagerWillAnimateWidgetInsertion:self];
  }
}

- (void)popModalInteraction
{
  id v4 = [(SBHIconManager *)self currentConfiguringIconView];
  [v4 popConfigurationCard];
  [v4 popStackConfigurationCard];
  id v3 = [(SBHIconManager *)self currentPersonDetailInteraction];
  [v3 endInteractionAnimated:1];
}

- (void)dismissModalInteractions
{
  id v4 = [(SBHIconManager *)self currentConfiguringIconView];
  [v4 dismissConfigurationCard];
  [v4 dismissStackConfigurationCard];
  [(SBHIconManager *)self setIconStylePickerVisible:0];
  id v3 = [(SBHIconManager *)self currentPersonDetailInteraction];
  [v3 endInteractionAnimated:1];
}

- (void)dismissModalInteractionsImmediately
{
  id v4 = [(SBHIconManager *)self currentConfiguringIconView];
  [v4 dismissConfigurationCardImmediately];
  [v4 dismissStackConfigurationCardImmediately];
  [(SBHIconManager *)self _dismissStylePickerViewControllerImmediately];
  id v3 = [(SBHIconManager *)self currentPersonDetailInteraction];
  [v3 endInteractionAnimated:0];
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_widgetViewControllersForIconView objectForKey:v10];
  if (v7 == v6) {
    [(NSMapTable *)self->_widgetViewControllersForIconView removeObjectForKey:v10];
  }
  [(NSMapTable *)self->_iconViewsForCustomIconImageViewController removeObjectForKey:v6];
  id v8 = [v10 customIconImageViewController];
  [(SBHIconManager *)self _updateIconView:v10 forCustomIconImageViewController:v8];
  [(SBHIconManager *)self _updateCaptureOnlyBackgroundViewForCustomIconImageViewController:v8];
  if (objc_msgSend(v8, "sbh_isWidgetStackViewController"))
  {
    id v9 = v8;
    [v9 setDelegate:self];
    [v9 setDataSource:self];
  }
}

- (void)_updateIconView:(id)a3 forCustomIconImageViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  iconViewsForCustomIconImageViewController = self->_iconViewsForCustomIconImageViewController;
  if (!iconViewsForCustomIconImageViewController)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    id v9 = self->_iconViewsForCustomIconImageViewController;
    self->_iconViewsForCustomIconImageViewController = v8;

    iconViewsForCustomIconImageViewController = self->_iconViewsForCustomIconImageViewController;
  }
  [(NSMapTable *)iconViewsForCustomIconImageViewController setObject:v10 forKey:v6];
}

- (void)_updateWidgetMultiplexingViewController:(id)a3 forIconView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  iconViewsForWidgetMultiplexingViewController = self->_iconViewsForWidgetMultiplexingViewController;
  if (!iconViewsForWidgetMultiplexingViewController)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    id v9 = self->_iconViewsForWidgetMultiplexingViewController;
    self->_iconViewsForWidgetMultiplexingViewController = v8;

    iconViewsForWidgetMultiplexingViewController = self->_iconViewsForWidgetMultiplexingViewController;
  }
  [(NSMapTable *)iconViewsForWidgetMultiplexingViewController setObject:v6 forKey:v10];
}

- (void)iconView:(id)a3 didDiscardCustomImageViewController:(id)a4
{
  id v17 = a4;
  if (objc_msgSend(v17, "sbh_isWidgetStackViewController"))
  {
    id v5 = v17;
    [v5 setDelegate:0];
    [v5 setDataSource:0];
  }
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = v17;
    id v9 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
    id v10 = [v8 multiplexingViewController];
    [v9 discardMultiplexingViewController:v10];

    iconViewsForWidgetMultiplexingViewController = self->_iconViewsForWidgetMultiplexingViewController;
    double v12 = [v8 multiplexingViewController];
    [(NSMapTable *)iconViewsForWidgetMultiplexingViewController removeObjectForKey:v12];

    [v8 setDelegate:0];
  }
  double v13 = self;
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    uint64_t v15 = [v17 contentViewController];
    if (objc_msgSend(v15, "sbh_isWidgetHostViewController")) {
      [v15 invalidate];
    }
  }
  uint64_t v16 = [v17 parentViewController];
  objc_msgSend(v16, "bs_removeChildViewController:", v17);

  [(NSMapTable *)self->_iconViewsForCustomIconImageViewController removeObjectForKey:v17];
}

- (void)iconView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self iconView:v8 contentDropSessionDidEnter:v6];
  }
}

- (void)iconView:(id)a3 dropSessionDidExit:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self iconView:v8 contentDropSessionDidExit:v6];
  }
}

- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4
{
}

- (void)_beginObservingLeafIconsInModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self;
  id v6 = objc_msgSend(v4, "iconsOfClass:", v5, 0);

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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) addObserver:self];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_endObservingLeafIconsInModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self;
  id v6 = objc_msgSend(v4, "iconsOfClass:", v5, 0);

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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) removeObserver:self];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

uint64_t __75__SBHIconManager_enumerateIconViewQueryableChildrenWithOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __75__SBHIconManager_enumerateIconViewQueryableChildrenWithOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __98__SBHIconManager_enumerateAppPredictionViewControllersInIconLocationGroup_withOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateIconViewsDisplayedInAppPredictionsInLocationGroup:(id)a3 withOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEqualToString:@"SBIconLocationGroupTodayView"])
  {
    uint64_t v10 = [(SBHIconManager *)self _effectiveTodayViewController];
    if (!v10
      || (a4 & 1) != 0 && ![(SBHIconManager *)self isTodayViewEffectivelyVisible])
    {

      goto LABEL_8;
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__SBHIconManager_enumerateIconViewsDisplayedInAppPredictionsInLocationGroup_withOptions_usingBlock___block_invoke;
  v11[3] = &unk_1E6AB4328;
  id v12 = v9;
  [(SBHIconManager *)self enumerateAppPredictionViewControllersWithIconViewsInIconLocationGroup:v8 withOptions:a4 usingBlock:v11];

LABEL_8:
}

void __100__SBHIconManager_enumerateIconViewsDisplayedInAppPredictionsInLocationGroup_withOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __100__SBHIconManager_enumerateIconViewsDisplayedInAppPredictionsInLocationGroup_withOptions_usingBlock___block_invoke_2;
  v6[3] = &unk_1E6AB4350;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = a4;
  [a2 enumerateDisplayedIconViewsUsingBlock:v6];
}

uint64_t __100__SBHIconManager_enumerateIconViewsDisplayedInAppPredictionsInLocationGroup_withOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a3) {
    **(unsigned char **)(a1 + 40) = 1;
  }
  return result;
}

- (id)appPredictionsIconViewDisplayingIconView:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__20;
  uint64_t v23 = __Block_byref_object_dispose__20;
  id v24 = 0;
  id v7 = [(SBHIconManager *)self _effectiveTodayViewController];
  if (v7 && ((a4 & 1) == 0 || [(SBHIconManager *)self isTodayViewEffectivelyVisible]))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__SBHIconManager_appPredictionsIconViewDisplayingIconView_options___block_invoke;
    v15[3] = &unk_1E6AB4378;
    id v16 = v6;
    id v17 = &v19;
    unint64_t v18 = a4;
    [(SBHIconManager *)self enumerateAppPredictionViewControllersWithIconViewsInIconLocationGroup:@"SBIconLocationGroupTodayView" withOptions:a4 usingBlock:v15];
  }
  uint64_t v8 = (void *)v20[5];
  if (!v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__SBHIconManager_appPredictionsIconViewDisplayingIconView_options___block_invoke_2;
    v11[3] = &unk_1E6AB4378;
    id v12 = v6;
    long long v13 = &v19;
    unint64_t v14 = a4;
    [(SBHIconManager *)self enumerateAppPredictionViewControllersWithIconViewsInIconLocationGroup:@"SBIconLocationGroupRoot" withOptions:a4 usingBlock:v11];

    uint64_t v8 = (void *)v20[5];
  }
  id v9 = v8;

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __67__SBHIconManager_appPredictionsIconViewDisplayingIconView_options___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (SBIconViewQueryingDisplayingIconView(a2, *(void **)(a1 + 32), *(void *)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __67__SBHIconManager_appPredictionsIconViewDisplayingIconView_options___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (SBIconViewQueryingDisplayingIconView(a2, *(void **)(a1 + 32), *(void *)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)appPredictionViewControllerForIconView:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = __Block_byref_object_copy__20;
  uint64_t v19 = __Block_byref_object_dispose__20;
  id v20 = 0;
  id v5 = [(SBHIconManager *)self _effectiveTodayViewController];
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__SBHIconManager_appPredictionViewControllerForIconView___block_invoke;
    v12[3] = &unk_1E6AB43A0;
    id v13 = v4;
    unint64_t v14 = &v15;
    [(SBHIconManager *)self enumerateAppPredictionViewControllersInIconLocationGroup:@"SBIconLocationGroupTodayView" withOptions:0 usingBlock:v12];
  }
  id v6 = (void *)v16[5];
  if (!v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBHIconManager_appPredictionViewControllerForIconView___block_invoke_2;
    v9[3] = &unk_1E6AB43A0;
    id v10 = v4;
    long long v11 = &v15;
    [(SBHIconManager *)self enumerateAppPredictionViewControllersInIconLocationGroup:@"SBIconLocationGroupRoot" withOptions:0 usingBlock:v9];

    id v6 = (void *)v16[5];
  }
  id v7 = v6;

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __57__SBHIconManager_appPredictionViewControllerForIconView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (SBIconViewQueryingDisplayingIconView(v6, *(void **)(a1 + 32), 0))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __57__SBHIconManager_appPredictionViewControllerForIconView___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (SBIconViewQueryingDisplayingIconView(v6, *(void **)(a1 + 32), 0))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)refreshAppPredictionBadges
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = [(SBHIconManager *)self _effectiveAppPredictionViewControllersForUniqueIdentifier];
  id v3 = [v2 objectEnumerator];

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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enumerateDisplayedIconViewsUsingBlock:&__block_literal_global_805];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __44__SBHIconManager_refreshAppPredictionBadges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 icon];
  [v2 noteBadgeDidChange];
}

- (void)updateAppPredictionViewControllersWithListLayoutProvider:(id)a3 oldListLayoutProvider:(id)a4 animated:(BOOL)a5
{
  appPredictionViewControllersForUniqueIdentifier = self->_appPredictionViewControllersForUniqueIdentifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __106__SBHIconManager_updateAppPredictionViewControllersWithListLayoutProvider_oldListLayoutProvider_animated___block_invoke;
  v6[3] = &unk_1E6AB43C8;
  void v6[4] = self;
  BOOL v7 = a5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appPredictionViewControllersForUniqueIdentifier, "enumerateKeysAndObjectsUsingBlock:", v6, a4);
}

uint64_t __106__SBHIconManager_updateAppPredictionViewControllersWithListLayoutProvider_oldListLayoutProvider_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateLargeIconsEnabledForAppPredictionViewController:a3 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateLargeIconsEnabledForAppPredictionViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_msgSend(v6, "setLargeIconsEnabled:animated:", (-[SBHIconManager listLayoutProviderLayoutOptions](self, "listLayoutProviderLayoutOptions") >> 3) & 1, v4);
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return [(SBHIconManager *)self iconViewForIcon:a3 location:a4 options:0];
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__20;
  id v20 = __Block_byref_object_dispose__20;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBHIconManager_firstIconViewForIcon_inLocations___block_invoke;
  v12[3] = &unk_1E6AB4418;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __51__SBHIconManager_firstIconViewForIcon_inLocations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 firstIconViewForIcon:a1[4] inLocations:a1[5]];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)firstIconViewWithOptions:(unint64_t)a3 iconPassingTest:(id)a4
{
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__20;
  uint64_t v19 = __Block_byref_object_dispose__20;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SBHIconManager_firstIconViewWithOptions_iconPassingTest___block_invoke;
  v11[3] = &unk_1E6AB4440;
  id v13 = &v15;
  SEL v14 = a2;
  id v8 = v7;
  id v12 = v8;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:a3 usingBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __59__SBHIconManager_firstIconViewWithOptions_iconPassingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  char v7 = objc_opt_respondsToSelector();
  if (v7)
  {
    id v8 = [v9 firstIconViewWithOptions:a3 iconPassingTest:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  if (v7) {

  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  SEL v14 = __Block_byref_object_copy__20;
  uint64_t v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __39__SBHIconManager_firstIconViewForIcon___block_invoke;
  v8[3] = &unk_1E6AB4468;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:1 usingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __39__SBHIconManager_firstIconViewForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 firstIconViewForIcon:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__20;
  id v20 = __Block_byref_object_dispose__20;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SBHIconManager_firstIconViewForIcon_excludingLocations___block_invoke;
  v12[3] = &unk_1E6AB4418;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:1 usingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __58__SBHIconManager_firstIconViewForIcon_excludingLocations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 firstIconViewForIcon:a1[4] excludingLocations:a1[5]];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a4 = 1;
  }
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return [(SBHIconManager *)self isDisplayingIcon:a3 inLocation:a4 options:0];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__SBHIconManager_isDisplayingIcon_inLocation_options___block_invoke;
  v13[3] = &unk_1E6AB43F0;
  id v10 = v9;
  id v14 = v10;
  uint64_t v16 = &v17;
  id v11 = v8;
  id v15 = v11;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:a5 usingBlock:v13];
  LOBYTE(a5) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return a5;
}

void __54__SBHIconManager_isDisplayingIcon_inLocation_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isPresentingIconLocation:*(void *)(a1 + 32)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = SBIconViewQueryingDisplayingIconInLocation(v7, *(void **)(a1 + 40), *(void **)(a1 + 32), a3);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SBHIconManager_isDisplayingIconView_inLocation___block_invoke;
  v11[3] = &unk_1E6AB43F0;
  id v8 = v7;
  id v12 = v8;
  id v14 = &v15;
  id v9 = v6;
  id v13 = v9;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenUsingBlock:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __50__SBHIconManager_isDisplayingIconView_inLocation___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isPresentingIconLocation:a1[4]]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v6 isDisplayingIconView:a1[5] inLocation:a1[4]];
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SBHIconManager_isDisplayingIcon_inLocations___block_invoke;
  v11[3] = &unk_1E6AB43F0;
  id v8 = v7;
  id v12 = v8;
  id v14 = &v15;
  id v9 = v6;
  id v13 = v9;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenUsingBlock:v11];
  LOBYTE(self) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __47__SBHIconManager_isDisplayingIcon_inLocations___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v6, "isPresentingIconLocation:", v12, (void)v13)) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 isDisplayingIcon:*(void *)(a1 + 40) inLocation:v12];
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SBHIconManager_isDisplayingIconView___block_invoke;
  v7[3] = &unk_1E6AB4468;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(SBHIconManager *)self enumerateIconViewQueryableChildrenWithOptions:1 usingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __39__SBHIconManager_isDisplayingIconView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isDisplayingIconView:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)isIconCurrentlyOnscreen:(id)a3
{
  return [(SBHIconManager *)self isDisplayingIcon:a3 options:17];
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return [(SBHIconManager *)self isDisplayingIcon:a3 queryOptions:5];
}

- (BOOL)isDisplayingIcon:(id)a3 queryOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v10 = 0;
    if ((v4 & 2) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    id v7 = [(SBHIconManager *)self rootFolder];
    id v8 = [v7 indexPathForIcon:v6];
    uint64_t v9 = [v7 folderContainingIndexPath:v8 relativeIndexPath:0];
    uint64_t v10 = [v9 icon];

    if ((v4 & 2) != 0)
    {
LABEL_12:
      if ((v4 & 4) == 0)
      {
        char v13 = [(SBHIconManager *)self _effectiveTodayViewController];
        long long v14 = v13;
        if (v13 && ([v13 isDisplayingIcon:v6] & 1) != 0)
        {

          goto LABEL_22;
        }
      }
      if ([(SBHIconManager *)self isRootFolderContentVisible])
      {
        long long v15 = [(SBHIconManager *)self _currentFolderController];
        long long v16 = v15;
        if (v10 && ([v15 isDisplayingIcon:v10] & 1) != 0)
        {

          goto LABEL_22;
        }
        char v17 = [v16 isDisplayingIcon:v6];

        if (v17) {
          goto LABEL_22;
        }
      }
      BOOL v18 = 0;
      goto LABEL_24;
    }
  }
  id v11 = [(SBHIconManager *)self floatingDockViewController];

  if (!v11) {
    goto LABEL_12;
  }
  uint64_t v12 = [(SBHIconManager *)self floatingDockViewController];
  if (![(SBHIconManager *)self isFloatingDockVisible]
    || (!v10 || ([v12 isDisplayingIcon:v10] & 1) == 0)
    && ([v12 isDisplayingIcon:v6] & 1) == 0)
  {

    goto LABEL_12;
  }

LABEL_22:
  BOOL v18 = 1;
LABEL_24:

  return v18;
}

- (id)bestHomeScreenLocationForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconManager *)self rootFolder];
  id v6 = [v5 indexPathForIcon:v4];

  if (!v6) {
    goto LABEL_6;
  }
  if (([v5 isIconAtIndexPathInDock:v6] & 1) == 0)
  {
    if (([v5 isIconAtIndexPathInTodayList:v6] & 1) == 0
      && ([v5 isIconAtIndexPathInIgnoredList:v6] & 1) == 0)
    {
      uint64_t v9 = [v5 folderContainingIndexPath:v6 relativeIndexPath:0];

      id v7 = SBIconLocationFolder;
      if (v9 == v5) {
        id v7 = SBIconLocationRoot;
      }
      goto LABEL_9;
    }
LABEL_6:
    id v8 = 0;
    goto LABEL_10;
  }
  id v7 = SBIconLocationDock;
LABEL_9:
  id v8 = *v7;
LABEL_10:

  return v8;
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__20;
  id v21 = __Block_byref_object_dispose__20;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__SBHIconManager_firstIconViewForIcon_options___block_invoke;
  void v14[3] = &unk_1E6AB26C8;
  long long v16 = &v17;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SBHIconManager_firstIconViewForIcon_options___block_invoke_2;
  v11[3] = &unk_1E6AB26F0;
  char v13 = &v17;
  id v8 = v15;
  id v12 = v8;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v14, v11);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

BOOL __47__SBHIconManager_firstIconViewForIcon_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 firstIconViewForIcon:*(void *)(a1 + 32) options:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

BOOL __47__SBHIconManager_firstIconViewForIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstIconViewForIcon:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__SBHIconManager_isDisplayingIcon_options___block_invoke;
  v13[3] = &unk_1E6AB26C8;
  id v15 = &v16;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __43__SBHIconManager_isDisplayingIcon_options___block_invoke_2;
  v10[3] = &unk_1E6AB26F0;
  id v12 = &v16;
  id v8 = v14;
  id v11 = v8;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v13, v10);
  LOBYTE(a4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return a4;
}

uint64_t __43__SBHIconManager_isDisplayingIcon_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIcon:*(void *)(a1 + 32) options:a3];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __43__SBHIconManager_isDisplayingIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIcon:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconManager *)self iconViewMap];
  char v6 = [v5 isViewRecycled:v4];

  return v6;
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconManager *)self _currentFolderController];
  if ([v5 isPresentingIconLocation:v4])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(SBHIconManager *)self floatingDockViewController];
    id v8 = v7;
    BOOL v6 = 0;
    if (v7)
    {
      [v7 dockOffscreenProgress];
      if (v9 < 1.0 && ([v8 isPresentingIconLocation:v4] & 1) != 0) {
        BOOL v6 = 1;
      }
    }
  }
  return v6;
}

- (NSSet)presentedIconLocations
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(SBHIconManager *)self _currentFolderController];
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 presentedIconLocations];
    [v3 unionSet:v6];
  }
  id v7 = [(SBHIconManager *)self floatingDockViewController];
  id v8 = v7;
  if (v7)
  {
    [v7 dockOffscreenProgress];
    if (v9 < 1.0)
    {
      uint64_t v10 = [v8 presentedIconLocations];
      [v3 unionSet:v10];
    }
  }

  return (NSSet *)v3;
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  id v6 = a4;
  id v7 = [a3 originatingIconLocation];
  if (v6) {
    id v8 = [[SBWorkspaceInteractionContext alloc] initWithGestureRecognizer:v6];
  }
  else {
    id v8 = 0;
  }
  [(SBHIconManager *)self popExpandedIconFromLocation:v7 interactionContext:v8 animated:1 completionHandler:0];

  return 0;
}

- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4
{
  id v19 = a3;
  if ([(SBHIconManager *)self isEditingAllowed])
  {
    id v6 = [v19 view];
    id v7 = [v19 view];
    [v7 center];
    double v9 = v8;
    double v11 = v10;
    id v12 = [(SBHIconManager *)self iconEditingFeedbackBehavior];
    char v13 = [v12 view];
    objc_msgSend(v6, "convertPoint:toView:", v13, v9, v11);
    double v15 = v14;
    double v17 = v16;

    if (a4)
    {
      uint64_t v18 = [(SBHIconManager *)self iconEditingFeedbackBehavior];
      -[SBHIconManager setEditing:withFeedbackBehavior:location:](self, "setEditing:withFeedbackBehavior:location:", 1, v18, v15, v17);
    }
    else
    {
      -[SBHIconManager setEditing:withFeedbackBehavior:location:](self, "setEditing:withFeedbackBehavior:location:", 1, 0, v15, v17);
    }
  }
}

- (void)folderControllerShouldEndEditing:(id)a3
{
}

- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4
{
}

- (void)folderController:(id)a3 didEndEditingTitle:(id)a4
{
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 iconManager:self contentOverlayInsetsFromParentIfAvailableForFolderController:v4];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4FB2848];
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottouint64_t m = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)folderControllerWillClose:(id)a3
{
  id v5 = a3;
  [(SBHIconManager *)self _noteUserIsInteractingWithIcons];
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconManager:self willCloseFolderController:v5];
  }
}

- (void)folderController:(id)a3 willRemoveFakeStatusBar:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  double v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 iconManager:self willRemoveFakeStatusBar:v6 forFolderController:v8];
  }
}

- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7
{
  id v8 = a4;
  [v8 setDelegate:self];
  [(SBHIconManager *)self setCurrentTransitionAnimator:v8];
}

- (void)rootFolderController:(id)a3 wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v7, "iconManager:wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:", self, x, y);
  }
}

- (double)distanceToTopOfSpotlightIconsForRootFolderController:(id)a3
{
  id v4 = [(SBHIconManager *)self delegate];
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v4 distanceToTopOfSpotlightIconsForIconManager:self];
    double v5 = v6;
  }

  return v5;
}

- (double)maxExternalDockHeightForRootFolderController:(id)a3
{
  uint64_t v3 = [(SBHIconManager *)self floatingDockViewController];
  [v3 maximumContentHeight];
  double v5 = v4;

  return v5;
}

- (double)externalDockHeightForRootFolderController:(id)a3
{
  uint64_t v3 = [(SBHIconManager *)self floatingDockViewController];
  [v3 contentHeight];
  double v5 = v4;

  return v5;
}

- (double)preferredExternalDockVerticalMarginForRootFolderController:(id)a3
{
  uint64_t v3 = [(SBHIconManager *)self floatingDockViewController];
  [v3 preferredVerticalMargin];
  double v5 = v4;

  return v5;
}

- (id)backgroundViewForDockForRootFolderController:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [v5 iconManager:self backgroundViewForDockForRootFolderController:v4];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)backgroundViewForEditingDoneButtonForRootFolderController:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [v5 iconManager:self backgroundViewForEditingDoneButtonForRootFolderController:v4];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)rootFolderControllerCanUseSeparateWindowForRotation:(id)a3
{
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 iconManagerCanUseSeparateWindowForRotation:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)rootFolderController:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4
{
  double right = a4.right;
  bottouint64_t m = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "iconManager:statusBarInsetsDidChange:", self, top, left, bottom, right);
  }
}

- (void)rootFolderController:(id)a3 willUseTransitionContext:(id)a4 toTransitionToState:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconManager:self rootFolderController:v10 willUseTransitionContext:v8 toTransitionToState:a5];
  }
}

- (void)rootFolderController:(id)a3 willUsePropertyAnimator:(id)a4 toTransitionToState:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconManager:self rootFolderController:v10 willUsePropertyAnimator:v8 toTransitionToState:a5];
  }
}

- (void)rootFolderController:(id)a3 didOverscrollOnFirstPageByAmount:(double)a4
{
  id v7 = a3;
  double v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconManager:self rootFolderController:v7 didOverscrollOnFirstPageByAmount:a4];
  }
}

- (void)rootFolderController:(id)a3 didEndOverscrollOnFirstPageWithVelocity:(double)a4 translation:(double)a5
{
  id v9 = a3;
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManager:self rootFolderController:v9 didEndOverscrollOnFirstPageWithVelocity:a4 translation:a5];
  }
}

- (void)rootFolderController:(id)a3 didOverscrollOnLastPageByAmount:(double)a4
{
  id v7 = a3;
  double v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconManager:self rootFolderController:v7 didOverscrollOnLastPageByAmount:a4];
  }
}

- (void)rootFolderController:(id)a3 didEndOverscrollOnLastPageWithVelocity:(double)a4 translation:(double)a5
{
  id v9 = a3;
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManager:self rootFolderController:v9 didEndOverscrollOnLastPageWithVelocity:a4 translation:a5];
  }
}

- (void)rootFolderControllerViewWillAppear:(id)a3
{
  id v3 = [(SBHIconManager *)self usageMonitor];
  [v3 noteIconManagerRootFolderControllerViewWillAppear];
}

- (void)rootFolderController:(id)a3 viewDidTransitionToSize:(CGSize)a4
{
  id v4 = [(SBHIconManager *)self iconShareSheetManager];
  [v4 showIconShareSheetsIfAnyWereHiddenForRotationAnimation];
}

- (void)iconSizeButtonTriggered
{
  BOOL v3 = [(SBHIconStyleLabelHidingView *)self->_labelHidingView shouldUseLargeIcons];
  [(SBHIconManager *)self _updateShouldUseHomeScreenLargeIconSize:v3];
}

- (id)_fetchCurrentStyleConfiguration
{
  BOOL v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 iconStylePickerConfigurationForIconManager:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateStyleConfiguration:(id)a3
{
  id v5 = a3;
  id v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 updateStyleConfiguration:v5 forIconManager:self];
  }
}

- (void)_updateShouldUseHomeScreenLargeIconSize:(BOOL)a3
{
  if ([(SBHIconManager *)self _shouldUseHomeScreenLargeIconSize] != a3)
  {
    id v4 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 iconManagerWantsIconSizeToggled:self];
    }
  }
}

- (BOOL)_shouldUseHomeScreenLargeIconSize
{
  BOOL v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldUseHomeScreenLargeIconSizeForIconManager:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)toggleHomeScreenWallpaperDim:(id)a3
{
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManagerToggleHomeScreenWallpaperDimming:self];
  }
  char v4 = [(UIBarButtonItem *)self->_dimBarButtonItem customView];
  objc_msgSend(v4, "setDimmed:animated:", -[SBHIconManager currentHomeScreenWallpaperDimState](self, "currentHomeScreenWallpaperDimState"), 1);
}

- (BOOL)currentHomeScreenWallpaperDimState
{
  BOOL v3 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isHomeScreenWallpaperDimmedForIconManager:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_engageWallpaperTintColorDropper:(id)a3
{
  char v4 = SBLogIconStylePicker();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Activating tint color eyedropper...", buf, 2u);
  }

  if (self->_isHomeScreenTintColorEyeDropperActive)
  {
    id v5 = SBLogIconStylePicker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Eye dropper is already active, bailing.", buf, 2u);
    }
  }
  else
  {
    self->_isHomeScreenTintColorEyeDropperActive = 1;
    double v6 = [(SBHIconManager *)self rootViewController];
    id v7 = [(SBHIconManager *)self currentStylePickerViewController];
    id v8 = [v7 navigationController];
    id v9 = [v8 sheetPresentationController];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__SBHIconManager__engageWallpaperTintColorDropper___block_invoke;
    v21[3] = &unk_1E6AACA90;
    id v10 = v9;
    id v22 = v10;
    id v5 = v6;
    uint64_t v23 = v5;
    [v10 animateChanges:v21];
    double v11 = (_UIColorSampler *)objc_opt_new();
    eyeDropperColorSampler = self->_eyeDropperColorSampler;
    self->_eyeDropperColorSampler = v11;

    [(_UIColorSampler *)self->_eyeDropperColorSampler setFloatEyedropperOnStart:1];
    double v13 = SBLogIconStylePicker();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Showing tint color eyedropper", buf, 2u);
    }

    double v14 = self->_eyeDropperColorSampler;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__SBHIconManager__engageWallpaperTintColorDropper___block_invoke_887;
    v17[3] = &unk_1E6AB4498;
    id v18 = v10;
    id v19 = self;
    id v20 = v7;
    id v15 = v7;
    id v16 = v10;
    [(_UIColorSampler *)v14 showSamplerWithSelectionHandler:v17];
  }
}

void __51__SBHIconManager__engageWallpaperTintColorDropper___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateDetents];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBHIconManagerWillPresentEyeDropperNotification" object:0];

  id v3 = [*(id *)(a1 + 40) contentView];
  [v3 setAlpha:0.0];
}

void __51__SBHIconManager__engageWallpaperTintColorDropper___block_invoke_887(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v4 = v3;
  BSDispatchMain();
}

uint64_t __51__SBHIconManager__engageWallpaperTintColorDropper___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogIconStylePicker();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Eyedropper called selection handler with color: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) invalidateDetents];
  uint64_t result = [*(id *)(a1 + 48) _invalidateWallpaperTintColorDropper];
  if (*(void *)(a1 + 32))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [*(id *)(a1 + 56) _navigateHomeScreenColorPickerSlidersToColor:*(void *)(a1 + 32)];
    }
  }
  return result;
}

- (void)_invalidateWallpaperTintColorDropper
{
  uint64_t v3 = SBLogIconStylePicker();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating tint color eyedropper...", buf, 2u);
  }

  if (self->_isHomeScreenTintColorEyeDropperActive)
  {
    self->_isHomeScreenTintColorEyeDropperActive = 0;
    id v4 = [(SBHIconManager *)self rootViewController];
    int v5 = [(SBHIconManager *)self currentStylePickerViewController];
    uint64_t v6 = [v5 navigationController];
    uint64_t v7 = [v6 sheetPresentationController];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__SBHIconManager__invalidateWallpaperTintColorDropper__block_invoke;
    aBlock[3] = &unk_1E6AAC810;
    id v13 = v4;
    id v8 = v4;
    id v9 = _Block_copy(aBlock);
    id v10 = v9;
    if (v7) {
      [v7 animateChanges:v9];
    }
    else {
      (*((void (**)(void *))v9 + 2))(v9);
    }
    eyeDropperColorSampler = self->_eyeDropperColorSampler;
    self->_eyeDropperColorSampler = 0;
  }
  else
  {
    int v5 = SBLogIconStylePicker();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Eyedropper is not active, bailing", buf, 2u);
    }
  }
}

void __54__SBHIconManager__invalidateWallpaperTintColorDropper__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SBHIconManagerDidDismissEyeDropperNotification" object:0];

  uint64_t v3 = [*(id *)(a1 + 32) contentView];
  [v3 setAlpha:1.0];

  id v4 = SBLogIconStylePicker();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Finished invalidating tint color eyedropper", v5, 2u);
  }
}

- (void)rootFolderController:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6
{
  id v15 = a4;
  id v9 = a5;
  id v10 = a6;
  double v11 = [(SBHIconManager *)self iconDragManager];
  [v11 cancelAllDrags];

  [(SBHIconManager *)self _discardEndEditingTimerAndDontResetUntilReasonIsRemoved:@"FolderPageManagement"];
  double v12 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(SBHIconManager *)self focusModeManager];
    double v14 = [v13 activeFocusMode];
    [v15 setActiveFocusMode:v14];
    [v12 iconManager:self willPresentPageManagementWithLayoutManager:v15 animator:v9 context:v10];
  }
}

- (void)rootFolderController:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(SBHIconManager *)self iconDragManager];
  [v8 cancelAllDrags];

  [(SBHIconManager *)self _removeReasonToNotResetEndEditingTimer:@"FolderPageManagement"];
  id v9 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 iconManager:self willDismissPageManagementUsingAnimator:v10 context:v7];
  }
}

- (void)rootFolderController:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 iconManager:self didDismissPageManagementWithLayoutManager:v9 context:v7];
  }
}

- (id)_effectiveWidgetMultiplexingManager
{
  if (!self->_widgetMultiplexingManagersForLayoutOptions)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    widgetMultiplexingManagersForLayoutOptions = self->_widgetMultiplexingManagersForLayoutOptions;
    self->_widgetMultiplexingManagersForLayoutOptions = v3;
  }
  int v5 = _SBHLayoutOptionsKeyTypeForListLayoutProvider(self->_listLayoutProvider);
  uint64_t v6 = [(NSMutableDictionary *)self->_widgetMultiplexingManagersForLayoutOptions objectForKey:v5];
  if (!v6)
  {
    uint64_t v6 = [[SBHMultiplexingManager alloc] initWithDelegate:self];
    [(SBHMultiplexingManager *)v6 setCachedRecentViewControllerCountLimit:10];
    [(NSMutableDictionary *)self->_widgetMultiplexingManagersForLayoutOptions setObject:v6 forKey:v5];
  }

  return v6;
}

- (id)rootFolderController:(id)a3 draggedIconForStackConfigurationInteractionForIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBHIconManager *)self iconDragManager];
  id v7 = [v6 draggedIconForIdentifier:v5];

  return v7;
}

- (void)rootFolderController:(id)a3 handleInsertionForWidgetIcon:(id)a4 withReferenceIconView:(id)a5 fromPresenter:(id)a6 dismissViewControllerHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v55 = v12;
  long long v56 = [v12 folder];
  double v17 = [v56 todayList];
  uint64_t v18 = objc_opt_class();
  id v19 = v15;
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }
  id v21 = v20;

  id v22 = [(SBHIconManager *)self _effectiveTodayViewController];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke;
  aBlock[3] = &unk_1E6AB44C8;
  void aBlock[4] = self;
  long long v57 = v19;
  uint64_t v23 = _Block_copy(aBlock);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_2;
  v69[3] = &unk_1E6AB45B8;
  id v24 = v13;
  id v70 = v24;
  id v25 = v17;
  id v71 = v25;
  uint64_t v72 = self;
  id v26 = v21;
  id v73 = v26;
  id v54 = v14;
  id v74 = v54;
  id v27 = v23;
  id v76 = v27;
  id v28 = v16;
  id v77 = v28;
  id v29 = v22;
  id v75 = v29;
  uint64_t v30 = _Block_copy(v69);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_8;
  v62[3] = &unk_1E6AB45E0;
  id v31 = v29;
  id v63 = v31;
  id v32 = v25;
  id v64 = v32;
  id v33 = v24;
  id v65 = v33;
  long long v34 = (void (**)(void))v28;
  id v66 = self;
  id v67 = v34;
  id v35 = v30;
  id v68 = v35;
  __int16 v36 = (void (**)(void))_Block_copy(v62);
  if ([v57 presenterType] == 1)
  {
    v36[2](v36);
LABEL_11:
    uint64_t v39 = v55;
    goto LABEL_19;
  }
  if ([v57 presenterType] == 2 && v26)
  {
    uint64_t v37 = [v26 iconListView];
    __int16 v38 = [v37 model];

    (*((void (**)(id, void *))v35 + 2))(v35, v38);
    goto LABEL_11;
  }
  __int16 v53 = v27;
  uint64_t v39 = v55;
  __int16 v40 = [v55 currentIconListModel];
  if ([v40 isAllowedToContainIcon:v33])
  {
    unint64_t v51 = [(SBHIconManager *)self gridCellInfoOptions];
    uint64_t v41 = objc_msgSend(v40, "bestGridCellIndexForInsertingIcon:gridCellInfoOptions:", v33);
    id v52 = v40;
    if (v41 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v42 = (id)objc_msgSend(v56, "addIcon:toListAtIndex:options:", v33, objc_msgSend(v56, "indexOfList:", v40), 10);
    }
    else
    {
      uint64_t v50 = v41;
      id v49 = [SBHIconGridPath alloc];
      id v43 = [v40 uniqueIdentifier];
      id v44 = [(SBHIconGridPath *)v49 initWithFolderIdentifier:0 listIdentifier:v43 gridCellIndex:v50 gridCellInfoOptions:v51];

      uint64_t v39 = v55;
      id v45 = (id)[v56 insertIcon:v33 atGridPath:v44 options:16777218];
    }
    [v39 setCurrentPageIndexToListDirectlyContainingIcon:v33 animated:0];
    uint64_t v46 = [v39 currentIconListView];
    id v47 = [(SBHIconManager *)self widgetInsertionRippleIconAnimatorForIcon:v33 iconListView:0 withReferenceIconView:v54];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_9;
    v58[3] = &unk_1E6AB44F0;
    id v61 = v53;
    id v59 = v33;
    id v60 = v46;
    id v48 = v46;
    [v47 animateWithCompletion:v58];
    v34[2](v34);

    uint64_t v39 = v55;
    __int16 v40 = v52;
  }
  else
  {
    v36[2](v36);
  }

  id v27 = v53;
LABEL_19:
}

void __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = [a3 displayedIconViewForIcon:v5];
  uint64_t v6 = [v5 activeWidget];

  if (v9 && v6)
  {
    id v7 = [*(id *)(a1 + 32) widgetExtensionProvider];
    id v8 = objc_msgSend(v7, "sbh_descriptorForWidgetIdentifiable:", v6);

    if ([v9 supportsConfigurationCard]
      && [v8 promptsForUserConfiguration])
    {
      [v9 presentConfigurationCard];
    }
  }
}

void __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBPlaceholderIcon placeholderForIcon:*(void *)(a1 + 32)];
  [v3 addIcon:v4];
  if ([v3 directlyContainsIcon:v4])
  {
    id v5 = *(id *)(a1 + 40);
    if (v5 == v3)
    {
      id v7 = [*(id *)(a1 + 48) rootFolder];
      id v8 = [v7 indexPathForIcon:v4];
      uint64_t v6 = [*(id *)(a1 + 48) iconListViewForIndexPath:v8];
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 56) iconListView];
    }
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    char v45 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_3;
    aBlock[3] = &unk_1E6AB4540;
    uint64_t v9 = *(void *)(a1 + 48);
    id v43 = v44;
    void aBlock[4] = v9;
    id v36 = v3;
    id v10 = v4;
    id v37 = v10;
    id v38 = *(id *)(a1 + 32);
    id v26 = v6;
    id v39 = v26;
    id v40 = *(id *)(a1 + 64);
    id v41 = *(id *)(a1 + 80);
    id v42 = *(id *)(a1 + 88);
    double v11 = _Block_copy(aBlock);
    id v12 = objc_alloc_init(SBIconListLayoutBlockObserver);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_6;
    v31[3] = &unk_1E6AB4568;
    id v13 = v12;
    id v32 = v13;
    id v14 = v10;
    id v33 = v14;
    id v15 = v11;
    id v34 = v15;
    [(SBIconListLayoutBlockObserver *)v13 setDidAddIconViewBlock:v31];
    [v26 addLayoutObserver:v13];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_7;
    v27[3] = &unk_1E6AB4590;
    id v16 = v13;
    id v28 = v16;
    uint64_t v30 = v44;
    id v29 = *(id *)(a1 + 88);
    double v17 = _Block_copy(v27);
    if (v5 == v3)
    {
      id v22 = *(void **)(a1 + 72);
      uint64_t v23 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v24 = [v23 userInterfaceIdiom];

      [v22 scrollIconToVisible:v14 atPosition:0 animated:(v24 & 0xFFFFFFFFFFFFFFFBLL) == 1 completion:v17];
      [*(id *)(a1 + 72) listView];
    }
    else
    {
      uint64_t v18 = *(void **)(a1 + 56);
      id v19 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v20 = [v19 userInterfaceIdiom];

      [v18 scrollIconToVisible:v14 animated:(v20 & 0xFFFFFFFFFFFFFFFBLL) == 1 completion:v17];
      [*(id *)(a1 + 56) iconListView];
    id v21 = };
    id v25 = [v21 displayedIconViewForIcon:v14];

    if (v25)
    {
      [(SBIconListLayoutBlockObserver *)v16 invalidate];
      v15[2](v15, 0.0);
    }

    _Block_object_dispose(v44, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_3(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 96) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_4;
    v6[3] = &unk_1E6AB4518;
    id v5 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 72);
    id v12 = *(id *)(a1 + 80);
    id v13 = *(id *)(a1 + 88);
    dispatch_after(v4, MEMORY[0x1E4F14428], v6);
  }
}

void __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_4(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 40), "replaceIcon:withIcon:gridCellInfoOptions:mutationOptions:", *(void *)(a1 + 48), *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "gridCellInfoOptions"), 0);
  [*(id *)(a1 + 64) layoutAndCreateIcon:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) widgetInsertionRippleIconAnimatorForIcon:*(void *)(a1 + 56) iconListView:*(void *)(a1 + 64) withReferenceIconView:*(void *)(a1 + 72)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_5;
  v4[3] = &unk_1E6AB44F0;
  id v7 = *(id *)(a1 + 80);
  id v5 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  [v3 animateWithCompletion:v4];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

uint64_t __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = *(id *)(a1 + 32);
  id v5 = [a3 icon];
  int v6 = [v5 isEqual:*(void *)(a1 + 40)];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    v10.n128_u64[0] = 0x3FD3333333333333;
    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      v10.n128_f64[0] = 0.0;
    }
    (*(void (**)(uint64_t, __n128))(v7 + 16))(v7, v10);
    [v11 invalidate];
  }
}

uint64_t __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    dispatch_time_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

uint64_t __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) addIcon:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    dispatch_time_t v4 = *(void **)(a1 + 56);
    return [v4 presentTodayOverlay];
  }
}

uint64_t __133__SBHIconManager_rootFolderController_handleInsertionForWidgetIcon_withReferenceIconView_fromPresenter_dismissViewControllerHandler___block_invoke_9(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)rootFolderController:(id)a3 noteDragItemWasConsumedExternallyForDropSession:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self iconDragManager];
  [v6 noteDragItemWasConsumedExternallyForDropSession:v5];
}

- (void)rootFolderController:(id)a3 noteDidRemoveSuggestedWidgetIcon:(id)a4
{
}

- (id)rootFolderController:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 iconManager:self dragPreviewForIconView:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)windowForStackConfigurationIconDragPreviewsForRootFolderController:(id)a3 forWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 windowForIconDragPreviewsForIconManager:self forWindowScene:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)rootFolderController:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  return [(SBHIconManager *)self promoteSuggestedWidget:a4 withinStack:a5];
}

- (BOOL)rootFolderController:(id)a3 allowsRemovalOfIconDataSourceWithinStack:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 iconManager:self allowsRemovalOfIconDataSourceWithinStack:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)rootFolderController:(id)a3 willPresentWidgetEditingViewController:(id)a4
{
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 iconManagerWillPresentWidgetEditing:self];
  }
  [(SBHIconManager *)self _discardEndEditingTimerAndDontResetUntilReasonIsRemoved:@"WIDGET_EDITING_PRESENTED"];
  id v5 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
  [v5 discardCachedRecentViewControllers];
}

- (void)rootFolderController:(id)a3 didPresentWidgetEditingViewController:(id)a4
{
  id v8 = a4;
  id v5 = [(SBHIconManager *)self _effectiveTodayViewController];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 keepIconImageViewControllersStaticForReason:@"WIDGET_EDITING_PRESENTED"];
    if (v6)
    {
      char v7 = [v8 userInfo];
      [v7 setObject:v6 forKey:@"WIDGET_EDITING_PRESENTED"];
    }
  }
}

- (void)rootFolderController:(id)a3 willDismissWidgetEditingViewController:(id)a4
{
  id v4 = a4;
  id v5 = [v4 userInfo];
  id v7 = [v5 objectForKey:@"WIDGET_EDITING_PRESENTED"];

  [v7 invalidate];
  id v6 = [v4 userInfo];

  [v6 removeObjectForKey:@"WIDGET_EDITING_PRESENTED"];
}

- (void)rootFolderController:(id)a3 didDismissWidgetEditingViewController:(id)a4
{
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManagerDidDismissWidgetEditing:self];
  }
  [(SBHIconManager *)self _removeReasonToNotResetEndEditingTimer:@"WIDGET_EDITING_PRESENTED"];
}

- (void)rootFolderController:(id)a3 prepareAddSheetViewController:(id)a4
{
  id v6 = a4;
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 iconManager:self prepareAddSheetViewController:v6];
  }
}

- (void)rootFolderController:(id)a3 willPresentAddSheetViewController:(id)a4
{
  id v4 = [(SBHIconManager *)self usageMonitor];
  [v4 noteAddWidgetSheetWillPresent];
}

- (unint64_t)addWidgetSheetStyleForRootFolderController:(id)a3
{
  uint64_t v3 = [(SBHIconManager *)self addWidgetSheetConfigurationManager];
  unint64_t v4 = [v3 addWidgetSheetStyle];

  return v4;
}

- (void)rootFolderControllerDidAcceptWidgetIntroduction:(id)a3
{
  id v5 = [(SBHIconManager *)self usageMonitor];
  unint64_t v4 = [(SBHIconManager *)self defaultFirstPageWidgetDescriptors];
  [v5 noteWidgetDiscoverabilityDidAcceptSuggestion:v4];
}

- (void)rootFolderControllerDidUndoWidgetIntroduction:(id)a3
{
  [(SBHIconManager *)self undoDefaultWidgets:0];
  id v5 = [(SBHIconManager *)self usageMonitor];
  unint64_t v4 = [(SBHIconManager *)self defaultFirstPageWidgetDescriptors];
  [v5 noteWidgetDiscoverabilityDidRejectSuggestion:v4];
}

- (void)rootFolderControllerDidEditWidgetIntroduction:(id)a3
{
  id v3 = [(SBHIconManager *)self usageMonitor];
  [v3 noteWidgetDiscoverabilityDidEnterEditingMode];
}

- (BOOL)rootFolderControllerDidSetPrototypeSettingEditAsUndo:(id)a3
{
  if ([(SBHIconManager *)self prototypeSettingEditButtonAsUndo]) {
    return 1;
  }
  if (!__sb__runningInSpringBoard())
  {
    unint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 0;

    return v3;
  }
  return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
}

- (unint64_t)widgetSheetPresenterTypeForRootFolderController:(id)a3
{
  return [(SBHIconManager *)self isTodayViewEffectivelyVisible];
}

- (id)nestingViewController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  if (self->_currentTransitionAnimator != a4 || objc_msgSend(a4, "operation", a3) != 1)
  {
    id v11 = 0;
    goto LABEL_8;
  }
  id v5 = [(SBHIconManager *)self currentInteractionContext];
  id v6 = [v5 interactionProgress];
  if (v6) {
    goto LABEL_4;
  }
  id v13 = [v5 gestureRecognizer];
  id v8 = v13;
  if (!v13
    || (unint64_t)([v13 state] - 1) > 1
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = 0;
    id v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  id v14 = +[SBHHomeScreenDomain rootSettings];
  id v15 = [v14 folderSettings];
  [v15 minPinchScale];
  double v17 = v16;

  id v6 = [[SBPinchInteractionProgress alloc] initWithPinchGesture:v8 minPinchScale:v17];
  if (v6)
  {
LABEL_4:
    [(UIInteractionProgress *)v6 percentComplete];
    if (BSFloatLessThanFloat())
    {
      id v7 = +[SBHHomeScreenDomain rootSettings];
      id v8 = [v7 iconAnimationSettings];

      uint64_t v9 = [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator childViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 maxFolderCloseHintProgress];
      }
      else {
        [v8 maxAppSuspendHintProgress];
      }
      double v18 = v10;

      id v11 = [[SBHintInteractor alloc] initWithInteractionProgress:v6 maxHintProgress:v18];
      goto LABEL_19;
    }
  }
  id v11 = 0;
LABEL_20:

LABEL_8:
  return v11;
}

uint64_t __104__SBHIconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isInteractive];
  if ((result & 1) == 0)
  {
    BOOL v3 = (void *)MEMORY[0x1E4FB1EB0];
    return [v3 _recenterMotionEffects];
  }
  return result;
}

- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 iconAnimator];
  id v11 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [v11 iconManager:self animator:v8 animationSettingsForOperation:a4 childViewController:v9];
    goto LABEL_21;
  }
  id v13 = +[SBHHomeScreenDomain rootSettings];
  id v14 = [v13 iconAnimationSettings];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v14 reducedMotionSettings];
LABEL_19:
    id v12 = (void *)v15;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      [v14 folderCloseSettings];
    }
    else {
      [v14 folderOpenSettings];
    }
    uint64_t v15 = LABEL_14:;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      [v14 crossfadeSuspendSettings];
    }
    else {
      [v14 crossfadeLaunchSettings];
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      [v14 centerSuspendSettings];
    }
    else {
      [v14 centerLaunchSettings];
    }
    goto LABEL_14;
  }
  id v12 = 0;
LABEL_20:

LABEL_21:
  return v12;
}

- (BOOL)animator:(id)a3 canAlterViewHierarchyDuringCleanupUsingBlock:(id)a4
{
  return 0;
}

- (SBHIconGridSize)iconModel:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)[(SBHIconManager *)self listGridSizeForFolderClass:a4];
}

- (SBHIconGridSize)iconModel:(id)a3 listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)[(SBHIconManager *)self listWithNonDefaultSizedIconsGridSizeForFolderClass:a4];
}

- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  id v5 = [(SBHIconManager *)self listLayoutProvider];
  id v6 = [v5 layoutForIconLocation:@"SBIconLocationRoot"];
  unint64_t v7 = [v6 numberOfRowsForOrientation:a4];

  return v7;
}

- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  id v5 = [(SBHIconManager *)self listLayoutProvider];
  id v6 = [v5 layoutForIconLocation:@"SBIconLocationRoot"];
  unint64_t v7 = [v6 numberOfColumnsForOrientation:a4];

  return v7;
}

- (unint64_t)maxRowCountForFavoriteTodayListForIconModel:(id)a3
{
  return 4;
}

- (id)gridSizeClassSizesForIconModel:(id)a3
{
  BOOL v3 = [(SBHIconManager *)self listLayoutProvider];
  unint64_t v4 = [v3 layoutForIconLocation:@"SBIconLocationRoot"];

  id v5 = SBHIconListLayoutIconGridSizeClassSizes(v4, 1);

  return v5;
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  id v5 = [(objc_class *)[(SBHIconManager *)self controllerClassForFolderClass:a4] iconLocation];
  id v6 = [(SBHIconManager *)self listLayoutProvider];
  unint64_t v7 = [v6 layoutForIconLocation:v5];

  if (v7) {
    SBHIconListLayoutSupportedIconGridSizeClasses(v7);
  }
  else {
  id v8 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
  }

  return v8;
}

- (id)iconModel:(id)a3 supportedGridSizeClassesForWidgetWithKind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6
{
  return [(SBHIconManager *)self supportedGridSizeClassesForWidgetWithKind:a4 extensionBundleIdentifier:a5 containerBundleIdentifier:a6];
}

- (id)listRotatedLayoutClusterGridSizeClassForIconModel:(id)a3
{
  BOOL v3 = [(SBHIconManager *)self listLayoutProvider];
  unint64_t v4 = [v3 layoutForIconLocation:@"SBIconLocationRoot"];

  id v5 = SBHIconListLayoutRotatedLayoutGridCellClusterSizeClass(v4);

  return v5;
}

- (BOOL)iconModel:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4
{
  return [(SBHIconManager *)self listsAllowRotatedLayoutForFolderClass:a4];
}

- (int64_t)iconModel:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4
{
  return [(SBHIconManager *)self listsFixedIconLocationBehaviorForFolderClass:a4];
}

- (id)iconModel:(id)a3 customInsertionRelativePathForIcon:(id)a4 inRootFolder:(id)a5
{
  return [(NSMapTable *)self->_previousIconLocations objectForKey:a4];
}

- (id)iconModel:(id)a3 customInsertionIndexPathForIcon:(id)a4 inRootFolder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__20;
  id v40 = __Block_byref_object_dispose__20;
  id v41 = 0;
  id v11 = [(SBIconPreviousLocationTracker *)self->_previousIconLocationTracker previousLocationInfoForIcon:v9];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 folder];
    id v14 = [v12 folderName];
    uint64_t v15 = v14;
    if (v13)
    {
      uint64_t v16 = [v13 indexPathForFirstFreeSlotAvoidingFirstList:0];
      double v17 = (void *)v37[5];
      v37[5] = v16;
    }
    else if (v14)
    {
      uint64_t v32 = 0;
      id v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __73__SBHIconManager_iconModel_customInsertionIndexPathForIcon_inRootFolder___block_invoke;
      v28[3] = &unk_1E6AB4650;
      id v18 = v14;
      id v29 = v18;
      uint64_t v30 = &v36;
      id v31 = &v32;
      [v10 enumerateAllIconsUsingBlock:v28];
      if (!*((unsigned char *)v33 + 24))
      {
        id v19 = [v8 makeFolderWithDisplayName:v18];
        uint64_t v20 = [[SBFolderIcon alloc] initWithFolder:v19];
        id v21 = [v10 addIcon:v20];
        id v22 = [(SBHIconManager *)self iconModel];
        [v22 addIcon:v20];

        uint64_t v23 = [v19 indexPathForFirstFreeSlotAvoidingFirstList:0];
        uint64_t v24 = objc_msgSend(v23, "bs_indexPathByAddingPrefix:", v21);
        id v25 = (void *)v37[5];
        v37[5] = v24;
      }
      _Block_object_dispose(&v32, 8);
    }
  }
  id v26 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  return v26;
}

void __73__SBHIconManager_iconModel_customInsertionIndexPathForIcon_inRootFolder___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  if ([v14 isFolderIcon])
  {
    id v8 = [v14 folder];
    id v9 = [v8 displayName];
    if ([*(id *)(a1 + 32) isEqualToString:v9])
    {
      id v10 = [v8 indexPathForFirstFreeSlotAvoidingFirstList:0];
      uint64_t v11 = objc_msgSend(v10, "bs_indexPathByAddingPrefix:", v7);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (BOOL)canSaveIconState:(id)a3
{
  if (self->_iconModel != a3) {
    return 0;
  }
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v5 iconManagerCanSaveIconState:self];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)didSaveIconState:(id)a3
{
  if (self->_iconModel == a3)
  {
    id v4 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 iconManagerDidSaveIconState:self];
    }
  }
}

- (void)didDeleteIconState:(id)a3
{
  if (self->_iconModel == a3 && ([a3 isLayingOut] & 1) == 0)
  {
    [(SBHIconManager *)self noteIconStateChangedExternally];
  }
}

- (id)defaultIconStateForIconModel:(id)a3
{
  if (self->_iconModel == a3)
  {
    id v5 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      char v3 = [v5 defaultIconStateForIconManager:self];
    }
    else
    {
      char v3 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    char v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (BOOL)iconModel:(id)a3 shouldAvoidPlacingIconOnFirstPage:(id)a4
{
  id v6 = a4;
  if (self->_iconModel == a3)
  {
    id v8 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v7 = [v8 iconManager:self shouldAvoidPlacingIconOnFirstPage:v6];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)iconModel:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4
{
  id v6 = a4;
  if (self->_iconModel == a3
    && ![(NSCountedSet *)self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen count])
  {
    id v9 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v7 = [v9 iconManager:self shouldPlaceIconOnIgnoredList:v6];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)iconModel:(id)a3 launchIcon:(id)a4 fromLocation:(id)a5 context:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = (SBHIconModel *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_iconModel == v10)
  {
    if ([v11 isFolderIcon])
    {
      id v14 = [v11 folder];
      uint64_t v16 = [(SBHIconManager *)self rootFolderController];
      double v17 = [v16 folderControllerForFolder:v14];
      id v18 = SBLogIcon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v11;
        _os_log_impl(&dword_1D7F0A000, v18, OS_LOG_TYPE_DEFAULT, "SBHIconManager will open folder from icon %@", (uint8_t *)&v20, 0xCu);
      }

      if ([v17 isOpen])
      {
        id v19 = SBLogIcon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_DEFAULT, "need to close previous folder before opening new one", (uint8_t *)&v20, 2u);
        }

        [(SBHIconManager *)self popExpandedIconAnimated:0 completionHandler:0];
      }
      [(SBHIconManager *)self pushExpandedIcon:v11 location:v12 context:v13 animated:1 completionHandler:0];
    }
    else
    {
      id v14 = [v13 iconView];
      if (!v14) {
        goto LABEL_15;
      }
      uint64_t v16 = [(SBHIconManager *)self launchActionsForIconView:v14];
      [(SBHIconManager *)self launchFromIconView:v14 withActions:v16 modifierFlags:0];
    }

    goto LABEL_15;
  }
  id v14 = SBLogIcon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    iconModel = self->_iconModel;
    int v20 = 138412802;
    id v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v10;
    __int16 v24 = 2048;
    id v25 = iconModel;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_DEFAULT, "SBHIconManager asked to launch an icon (%@) from an unknown icon model (model: %p, ours: %p", (uint8_t *)&v20, 0x20u);
  }
LABEL_15:
}

- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return [(SBHIconManager *)self localizedFolderNameForDefaultDisplayName:a4];
}

- (void)iconModel:(id)a3 didAddIcon:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 isLeafIcon])
  {
    [v5 addObserver:self];
    if ([v5 isWidgetIcon])
    {
      id v6 = v5;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      char v7 = objc_msgSend(v6, "widgets", 0);
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
            [(SBHIconManager *)self _loadAndSaveDefaultIntentIfNecessaryForWidget:*(void *)(*((void *)&v13 + 1) + 8 * v11++) ofIcon:v6 viewController:0];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      id v12 = [(SBHIconManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v12 iconManagerDidAddOrRemoveWidgetIcon:self];
      }
    }
  }
}

- (void)iconModel:(id)a3 willRemoveIcon:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 displayNameForLocation:@"SBIconLocationRoot"];
  labelImageCache = self->_labelImageCache;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __43__SBHIconManager_iconModel_willRemoveIcon___block_invoke;
  v36[3] = &unk_1E6AB41A8;
  id v8 = v6;
  id v37 = v8;
  [(SBIconLabelImageCache *)labelImageCache removeLabelImagesWithParametersPassingTest:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __43__SBHIconManager_iconModel_willRemoveIcon___block_invoke_2;
  v34[3] = &unk_1E6AB3C90;
  id v9 = v5;
  id v35 = v9;
  [(SBHIconManager *)self enumerateAllIconImageCachesUsingBlock:v34];
  if ([v9 isLeafIcon])
  {
    [v9 removeObserver:self];
    id v10 = v9;
    uint64_t v11 = [v10 iconDataSources];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
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
          [(SBHIconManager *)self _handleRemovedDataSource:*(void *)(*((void *)&v30 + 1) + 8 * v15++) ofIcon:v10];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v13);
    }
  }
  if ([v9 isWidgetIcon])
  {
    id v25 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v16 = [v9 iconDataSources];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v26 + 1) + 8 * v20);
          if (objc_opt_respondsToSelector())
          {
            __int16 v22 = [v21 uniqueIdentifier];
            uint64_t v23 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
            [v23 discardCachedRecentViewControllersForIdentifier:v22];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v18);
    }

    __int16 v24 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v24 iconManagerDidAddOrRemoveWidgetIcon:self];
    }

    id v8 = v25;
  }
}

uint64_t __43__SBHIconManager_iconModel_willRemoveIcon___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 text];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __43__SBHIconManager_iconModel_willRemoveIcon___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "purgeCachedImagesForIcons:", v4, v5, v6);
}

- (void)_handleRemovedDataSource:(id)a3 ofIcon:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "handleRemovedDataSource:%@ ofIcon:%@", buf, 0x16u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(SBHIconModel *)self->_iconModel widgetIcons];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      if ([v14 isEqual:v7] & 1) == 0 && (objc_msgSend(v14, "hasIconDataSource:", v6)) {
        goto LABEL_21;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (([(NSMutableArray *)self->_movedStackConfigDataSources containsObject:v6] & 1) == 0)
  {
    if (!self->_shouldStashIconsForRelayout
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v6 iconSupportsConfiguration:v7])
    {
      uint64_t v15 = [(SBHIconManager *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v15 iconManager:self didRemoveConfigurableDataSource:v6 ofIcon:v7];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 uniqueIdentifier];
      [(NSMutableDictionary *)self->_widgetIntents removeObjectForKey:v9];
      [(NSMutableDictionary *)self->_archivedWidgetIntents removeObjectForKey:v9];
      long long v16 = [(SBHIconManager *)self _effectiveWidgetMultiplexingManager];
      [v16 discardCachedRecentViewControllersForIdentifier:v9];

LABEL_21:
    }
  }
}

- (Class)iconModel:(id)a3 iconClassForApplicationWithBundleIdentifier:(id)a4 proposedClass:(Class)a5
{
  id v7 = a4;
  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    a5 = (Class)[v8 iconManager:self iconClassForApplicationWithBundleIdentifier:v7 proposedClass:a5];
  }
  id v9 = a5;

  return v9;
}

- (id)iconModel:(id)a3 validatedWidgetIconForWidgetIcon:(id)a4
{
  return [(SBHIconManager *)self validatedWidgetIconForWidgetIcon:a4];
}

- (void)_iconModelWillReloadIcons:(id)a3
{
}

uint64_t __44__SBHIconManager__iconModelWillReloadIcons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 purgeAllCachedImages];
}

- (void)_iconModelDidReloadIcons:(id)a3
{
  if (![(SBHIconManager *)self shouldSkipPrecachingDataAfterReloadIcons]) {
    [(SBHIconManager *)self _precacheDataForRootIcons];
  }
  iconToReveal = self->_iconToReveal;
  if (iconToReveal)
  {
    iconModel = self->_iconModel;
    id v6 = [(SBIcon *)iconToReveal leafIdentifier];
    id v7 = [(SBHIconModel *)iconModel leafIconForIdentifier:v6];

    if (!v7)
    {
      [(SBHIconManager *)self setIconToReveal:0 revealingPrevious:0];
    }
  }
}

- (void)_iconModelWillLayout:(id)a3
{
  self->_shouldStashIconsForRelayout = 1;
  [(SBHIconManager *)self _prepareToResetRootIconLists];
}

- (void)_iconModelDidLayout:(id)a3
{
  id v4 = [(SBHIconModel *)self->_iconModel rootFolder];
  [(SBHIconManager *)self setRootFolder:v4];
  [(NSMutableDictionary *)self->_widgetIntents removeAllObjects];
  [(NSMutableDictionary *)self->_archivedWidgetIntents removeAllObjects];
  [(SBHIconManager *)self _precacheDataForRootIcons];
  self->_shouldStashIconsForRelayout = 0;
  [(SBHIconManager *)self _clearStashedIconsForRelayout];
  [(SBHIconManager *)self _finishResetRootIconLists];
  [(SBHIconManager *)self noteRootFolderDidMutate];
  ++self->_relayoutCount;
}

- (void)_iconVisibilityChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v8 = [v5 objectForKey:@"SBIconModelIconsToShowKey"];

  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"SBIconModelIconsToHideKey"];

  [(SBHIconManager *)self updateVisibleIconsToShowLeafIcons:v8 hideLeafIcons:v7];
}

- (void)noteIconStateChangedExternally
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__SBHIconManager_noteIconStateChangedExternally__block_invoke;
  v2[3] = &unk_1E6AAC810;
  v2[4] = self;
  [(SBHIconManager *)self _enqueueTransitionName:@"noteIconStateChangedExternally" withHandler:v2];
}

void __48__SBHIconManager_noteIconStateChangedExternally__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEditing:0];
  if ([*(id *)(a1 + 32) hasOpenFolder]) {
    [*(id *)(a1 + 32) popToCurrentRootIconList];
  }
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 iconManagerDidNoteIconStateChangedExternally:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) setShouldSkipPrecachingDataAfterReloadIcons:1];
  id v3 = [*(id *)(a1 + 32) iconModel];
  [v3 clearDesiredIconState];
  [v3 reloadIcons];
  [*(id *)(a1 + 32) setShouldSkipPrecachingDataAfterReloadIcons:0];
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "Relaying out icon model due because the icon state changed externally.", v7, 2u);
  }

  [*(id *)(a1 + 32) relayout];
  uint64_t v5 = [*(id *)(a1 + 32) rootFolderController];
  id v6 = [*(id *)(a1 + 32) rootFolderController];
  objc_msgSend(v5, "setCurrentPageIndex:animated:", objc_msgSend(v6, "defaultPageIndex"), 0);
}

- (void)noteRootFolderDidMutate
{
  previousIconGridPathsBeforeResize = self->_previousIconGridPathsBeforeResize;
  self->_previousIconGridPathsBeforeResize = 0;

  id v4 = [(SBHIconManager *)self iconDragManager];
  [v4 noteRootFolderDidMutate];
}

- (BOOL)rootFolder:(id)a3 canBounceIcon:(id)a4
{
  id v4 = [(SBHIconManager *)self iconDragManager];
  char v5 = [v4 isIconDragging];

  return v5;
}

- (id)iconLocationForList:(id)a3 inFolder:(id)a4 ofRootFolder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBHIconManager *)self rootFolder];
  uint64_t v12 = @"SBIconLocationNone";
  uint64_t v13 = [v10 todayList];
  if ((id)v13 == v8)
  {

    goto LABEL_9;
  }
  uint64_t v14 = (void *)v13;
  id v15 = [v10 favoriteTodayList];

  if (v15 == v8)
  {
LABEL_9:
    long long v17 = SBIconLocationTodayView;
    goto LABEL_10;
  }
  id v16 = [v10 dock];

  if (v16 == v8)
  {
    long long v17 = SBIconLocationDock;
  }
  else if (v9 && ![v9 isRootFolder])
  {
    long long v17 = SBIconLocationFolder;
  }
  else
  {
    if (v11 != v10) {
      goto LABEL_11;
    }
    long long v17 = SBIconLocationRoot;
  }
LABEL_10:
  long long v18 = *v17;

  uint64_t v12 = v18;
LABEL_11:

  return v12;
}

- (BOOL)rootFolder:(id)a3 canAddIcon:(id)a4 toIconList:(id)a5 inFolder:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SBHIconManager *)self rootFolder];

  if (v14 == v10)
  {
    id v16 = [(SBHIconManager *)self iconLocationForList:v12 inFolder:v13 ofRootFolder:v10];
    long long v17 = [(SBHIconManager *)self listLayoutProvider];
    long long v18 = [v17 layoutForIconLocation:v16];

    long long v19 = [v11 gridSizeClass];
    int v20 = SBHIconListLayoutSupportsIconGridSizeClass(v18, v19);

    if (v20)
    {
      id v21 = [(SBHIconManager *)self delegate];
      BOOL v15 = 0;
      if ((objc_opt_respondsToSelector() & 1) == 0
        || [v21 iconManager:self canAddIcon:v11 toIconList:v12 inFolder:v13])
      {
        id v22 = [v10 ignoredList];

        if (v22 != v12 || [(SBHIconManager *)self canAddIconToIgnoredList:v11]) {
          BOOL v15 = 1;
        }
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)rootFolder:(id)a3 isGridLayoutValid:(id)a4 forIconList:(id)a5 inFolder:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(SBHIconManager *)self iconLocationForList:v12 inFolder:a6 ofRootFolder:v10];
  if (SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v13))
  {
    id v14 = [(SBHIconManager *)self listLayoutProvider];
    BOOL v15 = [v14 layoutForIconLocation:v13];

    id v16 = [v12 allowedGridSizeClasses];
    if (SBHIconListLayoutSupportsIconGridSizeClass(v15, @"SBHIconGridSizeClassExtraLarge")
      && [v16 containsGridSizeClass:@"SBHIconGridSizeClassExtraLarge"])
    {
      long long v17 = [v10 iconGridSizeClassSizes];
      unsigned int v18 = [v17 gridSizeForGridSizeClass:@"SBHIconGridSizeClassExtraLarge"];
      uint64_t v19 = v18;
      BOOL v20 = SBHIconGridSizeGetArea(v18) < 2
         || (unint64_t)[v11 countOfIconsOfSize:v19] < 3;
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (id)rootFolder:(id)a3 shouldBounceIcon:(id)a4 afterInsertingIcons:(id)a5 forIconList:(id)a6 inFolder:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [(SBHIconManager *)self iconLocationForList:v14 inFolder:a7 ofRootFolder:a3];
  if (!SBIconLocationGroupContainsLocation(@"SBIconLocationGroupRoot", v15)) {
    goto LABEL_6;
  }
  id v16 = [v14 directlyContainedIconsPassingTest:&__block_literal_global_967];
  if ((unint64_t)[v16 count] < 3)
  {
LABEL_5:

LABEL_6:
    id v18 = v12;
    goto LABEL_7;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__SBHIconManager_rootFolder_shouldBounceIcon_afterInsertingIcons_forIconList_inFolder___block_invoke_2;
  v20[3] = &unk_1E6AAF238;
  id v21 = v13;
  uint64_t v17 = [v16 indexOfObjectWithOptions:2 passingTest:v20];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_5;
  }
  id v18 = [v16 objectAtIndex:v17];

LABEL_7:
  return v18;
}

uint64_t __87__SBHIconManager_rootFolder_shouldBounceIcon_afterInsertingIcons_forIconList_inFolder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 gridSizeClass];
  if (v3 == @"SBHIconGridSizeClassExtraLarge")
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v4 = [v2 gridSizeClass];
    uint64_t v5 = [v4 isEqualToString:@"SBHIconGridSizeClassExtraLarge"];
  }
  return v5;
}

uint64_t __87__SBHIconManager_rootFolder_shouldBounceIcon_afterInsertingIcons_forIconList_inFolder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)rootFolder:(id)a3 wantsToDoPageHidingEducationWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__SBHIconManager_rootFolder_wantsToDoPageHidingEducationWithCompletion___block_invoke;
    v7[3] = &unk_1E6AAF958;
    void v7[4] = self;
    id v8 = v5;
    [v6 iconManager:self prepareForPageHidingEducationWithCompletionHandler:v7];
  }
  else if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

uint64_t __72__SBHIconManager_rootFolder_wantsToDoPageHidingEducationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2 && [*(id *)(a1 + 32) isEditingAllowed])
  {
    objc_msgSend(*(id *)(a1 + 32), "setEditing:withFeedbackBehavior:location:", 1, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    id v3 = [*(id *)(a1 + 32) rootFolderController];
    [v3 _doPageManagementEducation];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)addPageStateObserver:(id)a3
{
  id v4 = a3;
  pageStateObservers = self->_pageStateObservers;
  id v8 = v4;
  if (!pageStateObservers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_pageStateObservers;
    self->_pageStateObservers = v6;

    id v4 = v8;
    pageStateObservers = self->_pageStateObservers;
  }
  [(NSHashTable *)pageStateObservers addObject:v4];
}

- (void)removePageStateObserver:(id)a3
{
}

- (void)enumeratePageStateObserversUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSHashTable *)self->_pageStateObservers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__SBHIconManager_rootFolderPageStateProvider_willBeginTransitionToState_animated_interactive___block_invoke;
  v12[3] = &unk_1E6AAD040;
  id v13 = v10;
  int64_t v14 = a4;
  BOOL v15 = a5;
  BOOL v16 = a6;
  id v11 = v10;
  [(SBHIconManager *)self enumeratePageStateObserversUsingBlock:v12];
  [(SBHIconManager *)self setCanPresentOverscrollLibraryForPageTransition:1];
  [(SBHIconManager *)self setCanDismissOverscrollLibraryForPageTransition:1];
}

uint64_t __94__SBHIconManager_rootFolderPageStateProvider_willBeginTransitionToState_animated_interactive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) willBeginTransitionToState:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) interactive:*(unsigned __int8 *)(a1 + 49)];
}

- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__SBHIconManager_rootFolderPageStateProvider_didContinueTransitionToState_progress___block_invoke;
  v11[3] = &unk_1E6AAD0A8;
  id v9 = v8;
  id v12 = v9;
  int64_t v13 = a4;
  double v14 = a5;
  [(SBHIconManager *)self enumeratePageStateObserversUsingBlock:v11];
  if (a4 == 4)
  {
    if (a5 > 0.5 || [v9 pageState] == 4)
    {
      if ([(SBHIconManager *)self canPresentOverscrollLibraryForPageTransition]&& ![(SBHIconManager *)self isTrackingScroll])
      {
        uint64_t v10 = 1;
LABEL_13:
        [(SBHIconManager *)self _updateOverscrollModalLibraryForScrollToPresented:v10];
        [(SBHIconManager *)self setCanPresentOverscrollLibraryForPageTransition:v10 ^ 1];
        goto LABEL_14;
      }
    }
    else if ([(SBHIconManager *)self canDismissOverscrollLibraryForPageTransition])
    {
      uint64_t v10 = 0;
      goto LABEL_13;
    }
  }
  else if (!a4 {
         && a5 > 0.5
  }
         && [(SBHIconManager *)self canDismissOverscrollLibraryForPageTransition])
  {
    [(SBHIconManager *)self _updateOverscrollModalLibraryForScrollToPresented:0];
    uint64_t v10 = 0;
LABEL_14:
    [(SBHIconManager *)self setCanDismissOverscrollLibraryForPageTransition:v10];
  }
}

uint64_t __84__SBHIconManager_rootFolderPageStateProvider_didContinueTransitionToState_progress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) didContinueTransitionToState:*(void *)(a1 + 40) progress:*(double *)(a1 + 48)];
}

- (void)rootFolderPageStateProvider:(id)a3 willEndTransitionToState:(int64_t)a4 successfully:(BOOL)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __84__SBHIconManager_rootFolderPageStateProvider_willEndTransitionToState_successfully___block_invoke;
  v10[3] = &unk_1E6AAD0D0;
  id v11 = v8;
  int64_t v12 = a4;
  BOOL v13 = a5;
  id v9 = v8;
  [(SBHIconManager *)self enumeratePageStateObserversUsingBlock:v10];
}

uint64_t __84__SBHIconManager_rootFolderPageStateProvider_willEndTransitionToState_successfully___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) willEndTransitionToState:*(void *)(a1 + 40) successfully:*(unsigned __int8 *)(a1 + 48)];
}

- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6
{
  id v10 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __93__SBHIconManager_rootFolderPageStateProvider_didEndTransitionFromState_toState_successfully___block_invoke;
  BOOL v15 = &unk_1E6AAD0F8;
  id v11 = v10;
  id v16 = v11;
  int64_t v17 = a4;
  int64_t v18 = a5;
  BOOL v19 = a6;
  [(SBHIconManager *)self enumeratePageStateObserversUsingBlock:&v12];
  if (objc_msgSend(v11, "pageState", v12, v13, v14, v15) == 4) {
    [(SBHIconManager *)self _updateOverscrollModalLibraryForScrollToPresented:1];
  }
}

uint64_t __93__SBHIconManager_rootFolderPageStateProvider_didEndTransitionFromState_toState_successfully___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rootFolderPageStateProvider:*(void *)(a1 + 32) didEndTransitionFromState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48) successfully:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_updateOverscrollModalLibraryForScrollToPresented:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(SBHIconManager *)self _currentFolderController];
    uint64_t v7 = [v5 iconManager:self floatingDockViewControllerForViewController:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  int v8 = [v7 isPresentingLibrary];
  if (v3)
  {
    if ((v8 & 1) == 0)
    {
      [v7 presentLibraryAnimated:1 completion:0];
      uint64_t v13 = *MEMORY[0x1E4FA74D0];
      v14[0] = &unk_1F300EFC8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v10 = (void *)MEMORY[0x1E4FA5E78];
      id v11 = v9;
      uint64_t v12 = [v10 sharedInstance];
      [v12 emitEvent:53 withPayload:v11];
    }
  }
  else if (v8)
  {
    [v7 dismissLibraryAnimated:1 completion:0];
  }
}

- (BOOL)hasBackgroundBlur
{
  return 0;
}

- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3
{
  return 0;
}

- (void)libraryViewControllerDidPresent:(id)a3
{
  id v4 = [(SBHIconManager *)self trailingLibraryViewController];
  if (v4)
  {
    int v8 = v4;
    BOOL v5 = [(SBHIconManager *)self isShowingOrTransitioningToTrailingCustomView];
    id v4 = v8;
    if (v5 && !self->_trailingCustomLibraryPrewarmAssertion)
    {
      uint64_t v6 = [v8 acquireLibrarySearchPrewarmAssertionForReason:@"Coplanar trailing custom library is presented"];
      trailingCustomLibraryPrewarmAssertion = self->_trailingCustomLibraryPrewarmAssertion;
      self->_trailingCustomLibraryPrewarmAssertion = v6;

      id v4 = v8;
    }
  }
}

- (void)libraryViewControllerDidDismiss:(id)a3
{
  id v4 = [(SBHIconManager *)self trailingLibraryViewController];
  if (v4)
  {
    uint64_t v7 = v4;
    BOOL v5 = [(SBHIconManager *)self isShowingOrTransitioningToTrailingCustomView];
    id v4 = v7;
    if (!v5)
    {
      [(BSInvalidatable *)self->_trailingCustomLibraryPrewarmAssertion invalidate];
      trailingCustomLibraryPrewarmAssertion = self->_trailingCustomLibraryPrewarmAssertion;
      self->_trailingCustomLibraryPrewarmAssertion = 0;

      id v4 = v7;
    }
  }
}

- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4
{
  if ([(SBHIconManager *)self isEditing])
  {
    [(SBHIconManager *)self setEditing:0];
    self->_editingShouldBeReEnabledAfterLibrarySearchControllerIsDismissed = 1;
  }
}

- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self->_editingShouldBeReEnabledAfterLibrarySearchControllerIsDismissed
    && [(SBHIconManager *)self isEditingAllowed])
  {
    [(SBHIconManager *)self setEditing:1];
  }
  self->_editingShouldBeReEnabledAfterLibrarySearchControllerIsDismissed = 0;
}

- (void)libraryViewController:(id)a3 willLaunchIcon:(id)a4 fromLocation:(id)a5
{
  if (objc_msgSend(a5, "isEqual:", @"SBIconLocationAppLibrarySearch", a4)) {
    self->_editingShouldBeReEnabledAfterLibrarySearchControllerIsDismissed = 0;
  }
}

- (void)libraryViewController:(id)a3 didAcceptDrop:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHIconManager *)self iconDragManager];
  [v6 noteDragItemWasConsumedExternallyForDropSession:v5];
}

- (void)todayViewController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  id v8 = a3;
  if (a5 <= 1.0)
  {
    id v9 = v8;
    [(SBHIconManager *)self _todayViewControllerSuppressesEditingStateForListViews:a5 == 1.0];
    id v8 = v9;
  }
}

- (void)_todayViewControllerSuppressesEditingStateForListViews:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBHIconManager *)self rootFolderController];
  id v6 = [v5 rootFolderView];
  [v6 setSuppressesEditingStateForListViews:v3];

  id v7 = [(SBHIconManager *)self floatingDockViewController];
  [v7 setSuppressesEditingStateForListViews:v3];
}

- (void)addFolderPresentationObserver:(id)a3
{
  id v4 = a3;
  folderPresentationObservers = self->_folderPresentationObservers;
  id v8 = v4;
  if (!folderPresentationObservers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_folderPresentationObservers;
    self->_folderPresentationObservers = v6;

    id v4 = v8;
    folderPresentationObservers = self->_folderPresentationObservers;
  }
  [(NSHashTable *)folderPresentationObservers addObject:v4];
}

- (void)removeFolderPresentationObserver:(id)a3
{
  [(NSHashTable *)self->_folderPresentationObservers removeObject:a3];
  if (![(NSHashTable *)self->_folderPresentationObservers count])
  {
    folderPresentationObservers = self->_folderPresentationObservers;
    self->_folderPresentationObservers = 0;
  }
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
}

void __58__SBHIconManager_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) checkForInvalidWidgets];
  [*(id *)(a1 + 32) _processPendingDefaultIntents];
  id v2 = [*(id *)(a1 + 32) rootFolderController];
  [v2 updatePresentedWidgetEditingViewController];
}

- (void)_processPendingDefaultIntents
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  pendingWidgetIntentConfigurationInitializations = self->_pendingWidgetIntentConfigurationInitializations;
  ++self->_descriptorsChangedSequenceNumber;
  uint64_t v4 = [(NSMutableSet *)pendingWidgetIntentConfigurationInitializations count];
  if (v4)
  {
    int v5 = v4;
    activeWidgetIntentConfigurationInitializations = self->_activeWidgetIntentConfigurationInitializations;
    if (!activeWidgetIntentConfigurationInitializations)
    {
      id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v8 = self->_activeWidgetIntentConfigurationInitializations;
      self->_activeWidgetIntentConfigurationInitializations = v7;

      activeWidgetIntentConfigurationInitializations = self->_activeWidgetIntentConfigurationInitializations;
    }
    [(NSMutableSet *)activeWidgetIntentConfigurationInitializations unionSet:self->_pendingWidgetIntentConfigurationInitializations];
    [(NSMutableSet *)self->_pendingWidgetIntentConfigurationInitializations removeAllObjects];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    id v9 = SBLogIcon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v5;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "Descriptors changed. Attempting %d default intent loading operations", buf, 8u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = (void *)[(NSMutableSet *)self->_activeWidgetIntentConfigurationInitializations copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))();
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(v18, 8);
  }
}

uint64_t __47__SBHIconManager__processPendingDefaultIntents__block_invoke()
{
  return BSDispatchMain();
}

void __47__SBHIconManager__processPendingDefaultIntents__block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v3 = *(const void **)(a1 + 40);
  if (v2)
  {
    int v5 = *(void **)(v4 + 272);
    id v6 = _Block_copy(v3);
    [v5 removeObject:v6];
  }
  else
  {
    id v7 = *(void **)(v4 + 264);
    id v6 = _Block_copy(v3);
    [v7 addObject:v6];
  }

  id v8 = SBLogIcon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [*(id *)(*(void *)(a1 + 32) + 272) count];
    *(_DWORD *)buf = 67109120;
    int v27 = v9;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "Remaining default intent operations: %d", buf, 8u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(a1 + 56))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 64) != *(void *)(v10 + 256))
    {
      uint64_t v11 = [*(id *)(v10 + 264) count];
      uint64_t v12 = *(id **)(a1 + 32);
      if (v11)
      {
        [v12 _processPendingDefaultIntents];
      }
      else if ([v12[34] count])
      {
        id v13 = *(id *)(*(void *)(a1 + 32) + 280);
        uint64_t v14 = *(void *)(a1 + 32);
        long long v15 = *(void **)(v14 + 280);
        *(void *)(v14 + 280) = 0;

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v16 = v13;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v22;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v22 != v19) {
                objc_enumerationMutation(v16);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v20) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * v20));
              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v18);
        }
      }
    }
  }
}

- (NSArray)defaultFirstPageSuggestedWidgetIcons
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  defaultFirstPageSuggestedWidgetIcons = self->_defaultFirstPageSuggestedWidgetIcons;
  if (defaultFirstPageSuggestedWidgetIcons)
  {
    BOOL v3 = defaultFirstPageSuggestedWidgetIcons;
    goto LABEL_51;
  }
  int v5 = [(SBHIconManager *)self delegate];
  id v54 = [(SBHIconManager *)self gridSizeClassDomain];
  uint64_t v6 = [(SBHIconManager *)self defaultFirstPageWidgetDescriptors];
  id v49 = (void *)v6;
  if (v6)
  {
    id v7 = (void *)v6;
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    __int16 v53 = [(SBHIconManager *)self defaultFirstPageWidgetSizeClass];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v7;
    uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v55)
    {
      uint64_t v51 = *(void *)v71;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v71 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v57 = v8;
          int v9 = *(void **)(*((void *)&v70 + 1) + 8 * v8);
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v78 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v67 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(NSObject **)(*((void *)&v66 + 1) + 8 * i);
                id v16 = SBLogWidgetDiscoverabilityMigration();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v77 = v15;
                  _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] avocado descriptors from proactive = %@", buf, 0xCu);
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v66 objects:v78 count:16];
            }
            while (v12);
          }

          uint64_t v17 = [[SBWidgetIcon alloc] initWithCHSWidgetDescriptors:v10 inDomain:v54];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v56 = v17;
          uint64_t v18 = [(SBWidgetIcon *)v17 widgets];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v75 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v63 != v21) {
                  objc_enumerationMutation(v18);
                }
                long long v23 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                long long v24 = SBLogWidgetDiscoverabilityMigration();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  id v25 = [v23 containerBundleIdentifier];
                  *(_DWORD *)buf = 138412290;
                  id v77 = v25;
                  _os_log_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] container bundle identifier = %@", buf, 0xCu);
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v62 objects:v75 count:16];
            }
            while (v20);
          }

          [(SBIcon *)v56 setGridSizeClass:v53];
          [v52 addObject:v56];

          uint64_t v8 = v57 + 1;
        }
        while (v57 + 1 != v55);
        uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
      }
      while (v55);
    }

    uint64_t v26 = v52;
    int v27 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v77 = v26;
      _os_log_impl(&dword_1D7F0A000, v27, OS_LOG_TYPE_DEFAULT, "Proactive provided widgets %@", buf, 0xCu);
    }

    uint64_t v28 = v26;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v28 = 0;
      goto LABEL_33;
    }
    uint64_t v28 = [v5 fallbackDefaultFirstPageWidgetsForIconManager:self];
    uint64_t v26 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v77 = v28;
      _os_log_impl(&dword_1D7F0A000, v26, OS_LOG_TYPE_DEFAULT, "Fallback widgets %@", buf, 0xCu);
    }
  }

LABEL_33:
  long long v29 = v28;
  long long v30 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = [(SBHIconManager *)self homeScreenDefaults];
  int v32 = [v31 isSidebarPinned];

  if (v32)
  {
    long long v33 = [(SBHIconManager *)self rootFolder];
    uint64_t v34 = [v33 favoriteTodayList];

    id v35 = [v34 icons];
    [v30 addObjectsFromArray:v35];

    uint64_t v36 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v77 = v30;
      _os_log_impl(&dword_1D7F0A000, v36, OS_LOG_TYPE_DEFAULT, "Pinned widgets %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v34 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v34, OS_LOG_TYPE_DEFAULT, "Sidebar is not pinned.", buf, 2u);
    }
  }

  char v37 = objc_opt_respondsToSelector();
  uint64_t v38 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v77) = v37 & 1;
    _os_log_impl(&dword_1D7F0A000, v38, OS_LOG_TYPE_DEFAULT, "Call builder %d", buf, 8u);
  }

  id v39 = v29;
  if (v37)
  {
    id v39 = [v5 iconManager:self willAddDefaultFirstPageWidgetsBasedOnPinnedWidgets:v30 suggestionWidgets:v29];
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
  BOOL v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v40 = v39;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(v40);
        }
        char v45 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * k) copyWithSuggestionSource:2];
        [(NSArray *)v3 addObject:v45];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v42);
  }

  uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  id v47 = self->_defaultFirstPageSuggestedWidgetIcons;
  self->_defaultFirstPageSuggestedWidgetIcons = v46;

LABEL_51:
  return v3;
}

- (void)prototypeSetDefaultSecondPageWidgetIcons
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHIconManager *)self widgetExtensionProvider];
  uint64_t v4 = [[SBHWidget alloc] initWithKind:@"com.apple.tv" extensionBundleIdentifier:@"com.apple.tv.TVWidgetExtension"];
  uint64_t v5 = objc_msgSend(v3, "sbh_descriptorForWidgetIdentifiable:", v4);
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v9 = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(SBHIconManager *)self setDefaultSecondPageWidgetDescriptors:v8];

    [(SBHIconManager *)self setDefaultSecondPageWidgetSizeClass:@"SBHIconGridSizeClassExtraLarge"];
  }
}

- (NSArray)defaultSecondPageSuggestedWidgetIcons
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  defaultSecondPageSuggestedWidgetIcons = self->_defaultSecondPageSuggestedWidgetIcons;
  if (defaultSecondPageSuggestedWidgetIcons)
  {
    BOOL v3 = defaultSecondPageSuggestedWidgetIcons;
  }
  else
  {
    uint64_t v5 = [(SBHIconManager *)self defaultSecondPageWidgetDescriptors];
    if (v5)
    {
      BOOL v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = [(SBHIconManager *)self defaultSecondPageWidgetSizeClass];
      id v7 = [(SBHIconManager *)self gridSizeClassDomain];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v17 = v5;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [[SBWidgetIcon alloc] initWithCHSWidgetDescriptors:*(void *)(*((void *)&v18 + 1) + 8 * i) suggestionSource:2 inDomain:v7];
            [(SBIcon *)v13 setGridSizeClass:v6];
            [(NSArray *)v3 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      uint64_t v5 = v17;
    }
    else
    {
      BOOL v3 = 0;
    }
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
    long long v15 = self->_defaultSecondPageSuggestedWidgetIcons;
    self->_defaultSecondPageSuggestedWidgetIcons = v14;
  }
  return v3;
}

- (void)beginStopUpdatingDefaultWidgetsBumpedIconRecord
{
}

- (void)endStopUpdatingDefaultWidgetsBumpedIconRecord
{
}

- (BOOL)rootFolderContainsWidgets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = [(SBHIconManager *)self rootFolder];
  BOOL v3 = [v2 lists];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = self;
        LOBYTE(v7) = [v7 directlyContainsIconOfClass:v8];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)saveOriginalIconStateForWidgetDiscoverability
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHIconManager *)self iconModel];
  [v3 saveIconStateIfNeeded];
  uint64_t v4 = [v3 store];
  id v12 = 0;
  uint64_t v5 = [v4 loadCurrentIconState:&v12];
  id v6 = v12;
  if (!v5)
  {
    id v7 = SBLogWidgetDiscoverabilityMigration();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        uint64_t v9 = "Save original icon state error: %@";
        long long v10 = v7;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Save original icon state is empty";
      long long v10 = v7;
      uint32_t v11 = 2;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem setOriginalIconStateBeforeWidgetDiscoverability:v5];
LABEL_10:
}

- (BOOL)applyOriginaliconStateForWidgetDiscoverability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHIconManager *)self iconModel];
  [v3 saveIconStateIfNeeded];
  uint64_t v4 = [v3 store];
  uint64_t v5 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem originalIconStateBeforeWidgetDiscoverability];
  id v14 = 0;
  int v6 = [v4 saveCurrentIconState:v5 error:&v14];
  id v7 = v14;

  if (!v6)
  {
    BOOL v8 = SBLogWidgetDiscoverabilityMigration();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        long long v10 = "Apply original icon state error: %@";
        uint32_t v11 = v8;
        uint32_t v12 = 12;
LABEL_8:
        _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      long long v10 = "Apply original icon state failed";
      uint32_t v11 = v8;
      uint32_t v12 = 2;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  [v3 layout];
LABEL_10:

  return v6;
}

- (BOOL)addDefaultWidgetsToHomeScreen
{
  BOOL v3 = [(SBHIconManager *)self rootFolder];
  if (v3 && ![(SBHIconManager *)self rootFolderContainsWidgets])
  {
    uint64_t v5 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Saving original icon state", buf, 2u);
    }

    [(SBHIconManager *)self saveOriginalIconStateForWidgetDiscoverability];
    int v6 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Adding default widgets to home screen.", v9, 2u);
    }

    [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem resetDefaultWidgetsUndoInfo];
    BOOL v7 = [(SBHIconManager *)self addDefaultFirstPageWidgetsToHomeScreen:0];
    int v4 = v7 | [(SBHIconManager *)self addDefaultSecondPageWidgetsToHomeScreen:0];
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)displayPronouncedContainerViewVisibility:(BOOL)a3 isVertical:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned int v8 = [v7 iconManagerShouldShowWidgetIntroductionPopoverForDefaultWidgets:self];
  }
  else {
    unsigned int v8 = 1;
  }
  BOOL v9 = [(SBHIconManager *)self rootFolderController];
  unsigned int v10 = [v9 canShowWidgetIntroduction];

  uint32_t v11 = [(SBHIconManager *)self homeScreenDefaults];
  unsigned int v12 = [v11 shouldShowWidgetIntroductionPopover];

  long long v13 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218752;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v12;
    __int16 v22 = 2048;
    BOOL v23 = v5;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "IM pronounced container: shouldShowPopover(%ld), rootFolderControllerCanShow(%ld), userDefaultsShouldShow(%ld), force(%ld)", (uint8_t *)&v16, 0x2Au);
  }

  if ((v8 & v10 & v12 & 1) != 0 || v5)
  {
    id v14 = [(SBHIconManager *)self usageMonitor];
    [v14 noteWidgetDiscoverabilityStarted];

    [(SBHIconManager *)self updatePronouncedContainerViewVisibility:1 vertical:v4];
    uint64_t v15 = [(SBHIconManager *)self homeScreenDefaults];
    [v15 setShouldShowWidgetIntroductionPopover:0];
  }
}

- (BOOL)addDefaultFirstPageWidgetsToHomeScreen:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBHIconManager *)self defaultFirstPageSuggestedWidgetIcons];
  int v6 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v63 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Default first page widget icons %@", buf, 0xCu);
  }

  uint64_t v7 = [(__CFString *)v5 count];
  if (v7)
  {
    unsigned int v8 = [(SBHIconManager *)self rootFolder];
    uint64_t v9 = [v8 firstVisibleListIndex];

    unsigned int v10 = [(SBHIconManager *)self rootFolder];
    uint32_t v11 = [v10 listAtIndex:v9];

    if ([(__CFString *)v5 count] != 4) {
      goto LABEL_30;
    }
    long long v60 = [(__CFString *)v5 objectAtIndex:0];
    unsigned int v12 = [v60 gridSizeClass];
    if (v12 != @"SBHIconGridSizeClassSmall")
    {
      uint64_t v13 = v3;
      id v14 = v11;
      uint64_t v15 = [(__CFString *)v5 objectAtIndex:0];
      int v16 = [v15 gridSizeClass];
      if (![v16 isEqualToString:@"SBHIconGridSizeClassSmall"])
      {

        uint32_t v11 = v14;
        uint64_t v3 = v13;
        goto LABEL_30;
      }
      id v49 = v15;
      unsigned int v10 = v16;
      uint32_t v11 = v14;
      uint64_t v3 = v13;
    }
    long long v59 = [(__CFString *)v5 objectAtIndex:1];
    long long v58 = [v59 gridSizeClass];
    long long v56 = v10;
    if (v58 != @"SBHIconGridSizeClassSmall")
    {
      uint64_t v51 = [(__CFString *)v5 objectAtIndex:1];
      uint64_t v50 = [v51 gridSizeClass];
      if (![v50 isEqualToString:@"SBHIconGridSizeClassSmall"])
      {
        int v57 = 0;
        uint64_t v17 = v58;
        goto LABEL_23;
      }
    }
    __int16 v53 = [(__CFString *)v5 objectAtIndex:2];
    id v52 = [v53 gridSizeClass];
    if (v52 == @"SBHIconGridSizeClassMedium")
    {
      id v47 = v12;
      id v48 = v11;
      unsigned int v54 = v3;
    }
    else
    {
      uint64_t v46 = [(__CFString *)v5 objectAtIndex:2];
      char v45 = [v46 gridSizeClass];
      if (![v45 isEqualToString:@"SBHIconGridSizeClassMedium"])
      {
        int v57 = 0;
        BOOL v23 = v52;
        goto LABEL_21;
      }
      id v47 = v12;
      id v48 = v11;
      unsigned int v54 = v3;
    }
    __int16 v18 = [(__CFString *)v5 objectAtIndex:3];
    uint64_t v19 = [v18 gridSizeClass];
    __int16 v20 = v19;
    if (v19 == @"SBHIconGridSizeClassLarge")
    {

      int v57 = 1;
    }
    else
    {
      uint64_t v21 = [(__CFString *)v5 objectAtIndex:3];
      __int16 v22 = [v21 gridSizeClass];
      int v57 = [v22 isEqualToString:@"SBHIconGridSizeClassLarge"];
    }
    BOOL v23 = v52;
    uint64_t v3 = v54;
    unsigned int v12 = v47;
    uint32_t v11 = v48;
    if (v52 == @"SBHIconGridSizeClassMedium")
    {
LABEL_22:

      uint64_t v17 = v58;
      if (v58 == @"SBHIconGridSizeClassSmall")
      {
LABEL_24:

        if (v12 == @"SBHIconGridSizeClassSmall")
        {

          if (!v57) {
            goto LABEL_30;
          }
        }
        else
        {

          if ((v57 & 1) == 0) {
            goto LABEL_30;
          }
        }
        if ((unint64_t)[v11 numberOfIcons] >= 9)
        {
          uint64_t v24 = [(SBHIconManager *)self rootFolder];
          id v25 = objc_msgSend(v24, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", 0, 0, -[SBHIconManager gridCellInfoOptionsForInsertingDefaultWidgets](self, "gridCellInfoOptionsForInsertingDefaultWidgets"));

          uint64_t v26 = (void *)MEMORY[0x1E4F1C978];
          int v27 = -[__CFString subarrayWithRange:](v5, "subarrayWithRange:", 0, 2);
          long long v61 = [v26 arrayWithArray:v27];

          uint64_t v28 = [(SBHIconManager *)self rootFolder];
          long long v29 = objc_msgSend(v28, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", 0, 4, -[SBHIconManager gridCellInfoOptionsForInsertingDefaultWidgets](self, "gridCellInfoOptionsForInsertingDefaultWidgets"));

          long long v30 = (void *)MEMORY[0x1E4F1C978];
          [(__CFString *)v5 objectAtIndex:2];
          long long v31 = v55 = v3;
          int v32 = [v30 arrayWithObject:v31];

          [(SBHIconManager *)self rootFolder];
          v34 = long long v33 = v11;
          id v35 = objc_msgSend(v34, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", 0, 12, -[SBHIconManager gridCellInfoOptionsForInsertingDefaultWidgets](self, "gridCellInfoOptionsForInsertingDefaultWidgets"));

          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          char v37 = [(__CFString *)v5 lastObject];
          uint64_t v38 = [v36 arrayWithObject:v37];

          [(SBHIconManager *)self beginStopUpdatingDefaultWidgetsBumpedIconRecord];
          [(SBHIconManager *)self addWidgets:v61 toGridPath:v25 overflowOptions:0];
          [(SBHIconManager *)self addWidgets:v32 toGridPath:v29 overflowOptions:0];
          [(SBHIconManager *)self addWidgets:v38 toGridPath:v35 overflowOptions:0];
          [(SBHIconManager *)self endStopUpdatingDefaultWidgetsBumpedIconRecord];

          uint32_t v11 = v33;
          uint64_t v3 = v55;

          uint64_t v39 = 1;
LABEL_33:

          [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem setIsVerticalWidgetIntroduction:v39];
          [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem setForceShowWidgetIntroduction:v3];

          goto LABEL_34;
        }
LABEL_30:
        id v40 = [(SBHIconManager *)self rootFolder];
        id v25 = objc_msgSend(v40, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", v9, 0, -[SBHIconManager gridCellInfoOptionsForInsertingDefaultWidgets](self, "gridCellInfoOptionsForInsertingDefaultWidgets"));

        [(SBHIconManager *)self beginStopUpdatingDefaultWidgetsBumpedIconRecord];
        uint64_t v41 = SBLogWidgetDiscoverabilityMigration();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v63 = v5;
          _os_log_impl(&dword_1D7F0A000, v41, OS_LOG_TYPE_DEFAULT, "Add first page default widget icons(%@) to model", buf, 0xCu);
        }

        [(SBHIconManager *)self addWidgets:v5 toGridPath:v25 overflowOptions:0];
        [(SBHIconManager *)self endStopUpdatingDefaultWidgetsBumpedIconRecord];
        uint64_t v39 = 0;
        goto LABEL_33;
      }
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_34:
  uint64_t v42 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = @"not added";
    if (v7) {
      uint64_t v43 = @"added";
    }
    *(_DWORD *)buf = 138412290;
    long long v63 = v43;
    _os_log_impl(&dword_1D7F0A000, v42, OS_LOG_TYPE_DEFAULT, "First page widgets are %@", buf, 0xCu);
  }

  return v7 != 0;
}

- (BOOL)addDefaultSecondPageWidgetsToHomeScreen:(BOOL)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3) {
    [(SBHIconManager *)self prototypeSetDefaultSecondPageWidgetIcons];
  }
  BOOL v4 = [(SBHIconManager *)self defaultSecondPageSuggestedWidgetIcons];
  if ([v4 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    BOOL v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "activeWidget", (void)v29);
          uint32_t v11 = [v10 extensionBundleIdentifier];

          unsigned int v12 = [(SBHIconManager *)self rootFolder];
          int v13 = [v12 containsWidgetWithExtensionBundleIdentifier:v11];

          if (v13)
          {
            __int16 v20 = [(SBHIconManager *)self proactiveWidgetSuggesterClient];
            [v20 logEventForDefaultWidgetSuggestionType:1 event:1];

            LOBYTE(v21) = 0;
            goto LABEL_24;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v14 = [(SBHIconManager *)self rootFolder];
    uint64_t v15 = [v14 firstVisibleListIndex];

    int v16 = [(SBHIconManager *)self rootFolder];
    uint64_t v17 = [v16 nextVisibleListIndexAfterIndex:v15];

    __int16 v18 = [(SBHIconManager *)self rootFolder];
    uint64_t v19 = v18;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      [v18 addEmptyListRemovingLeastRecentlyHiddenListIfNecessary];
    }
    else {
    __int16 v22 = [v18 listAtIndex:v17];
    }

    BOOL v21 = v22 != 0;
    if (v22)
    {
      BOOL v23 = [(SBHIconManager *)self rootFolder];
      uint64_t v24 = [v23 indexOfList:v22];

      id v25 = [(SBHIconManager *)self rootFolder];
      uint64_t v26 = objc_msgSend(v25, "gridPathWithListAtIndex:gridCellIndex:listGridCellInfoOptions:", v24, 0, -[SBHIconManager gridCellInfoOptionsForInsertingDefaultWidgets](self, "gridCellInfoOptionsForInsertingDefaultWidgets"));

      [(SBHIconManager *)self beginStopUpdatingDefaultWidgetsBumpedIconRecord];
      [(SBHIconManager *)self addWidgets:v5 toGridPath:v26 overflowOptions:0];
      [(SBHIconManager *)self endStopUpdatingDefaultWidgetsBumpedIconRecord];
    }
  }
  else
  {
    BOOL v21 = 0;
  }
  BOOL v5 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = @"not added";
    if (v21) {
      int v27 = @"added";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v27;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Second page widgets are %@", buf, 0xCu);
  }
LABEL_24:

  return v21;
}

- (BOOL)deviceTypeSupportModalWidgetIntroduction
{
  return [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem deviceTypeSupportModalWidgetIntroduction];
}

- (void)immediateDownloadSpringBoardHomeTrialSettingsWhenNeeded
{
}

- (BOOL)userHasUsedWidget
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
  unsigned int v3 = [v2 BOOLForKey:@"hasHadWidgetsOnHomeScreen"];
  BOOL v4 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "User has had widget = %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)undoDefaultWidgets:(BOOL)a3
{
  [(SBHIconManager *)self updatePronouncedContainerViewVisibility:0 vertical:0];
  if (![(SBHIconManager *)self applyOriginaliconStateForWidgetDiscoverability])
  {
    BOOL v5 = [(SBHIconManager *)self defaultFirstPageSuggestedWidgetIcons];
    int v6 = [(SBHIconManager *)self defaultSecondPageSuggestedWidgetIcons];
    uint64_t v7 = [(SBHIconManager *)self iconModel];
    uint64_t v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      [v7 removeIcons:v6];
    }
    [v7 removeIcons:v5];
  }
  if (!a3)
  {
    unsigned int v10 = [(SBHIconManager *)self homeScreenDefaults];
    [v10 setUserDidUndoSuggestedWidget:1];

    [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem resetDefaultWidgetsUndoInfo];
    id v11 = [(SBHIconManager *)self widgetIntroductionSettings];
    [v11 setShowWidgetIntroConvenienceControl:0];
  }
}

- (void)undoDefaultTVWidget
{
  [(SBHIconManager *)self updatePronouncedContainerViewVisibility:0 vertical:0];
  id v5 = [(SBHIconManager *)self defaultSecondPageSuggestedWidgetIcons];
  unsigned int v3 = [(SBHIconManager *)self iconModel];
  [v3 removeIcons:v5];
  BOOL v4 = [(SBHIconManager *)self widgetIntroductionSettings];
  [v4 setShowXLTVWidget:0];
}

- (BOOL)rootFolderContainsSuggestedWidget
{
  unsigned int v3 = [(SBHIconManager *)self homeScreenDefaults];
  char v4 = [v3 userDidUndoSuggestedWidget];

  if (v4) {
    return 0;
  }
  uint64_t v9 = 0;
  unsigned int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  int v6 = [(SBHIconManager *)self rootFolder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__SBHIconManager_rootFolderContainsSuggestedWidget__block_invoke;
  v8[3] = &unk_1E6AB4220;
  void v8[4] = self;
  void v8[5] = &v9;
  [v6 enumerateAllIconsUsingBlock:v8];

  BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__SBHIconManager_rootFolderContainsSuggestedWidget__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  int v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [*(id *)(a1 + 32) widgetIconIsOnboardingWidget:v8])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)updateWidgetDiscoverabilityUserPreferencesByDeletingWidget:(id)a3
{
  id v9 = a3;
  char v4 = [(SBHIconManager *)self homeScreenDefaults];
  if (([v4 userHasDeletedSuggestedWidget] & 1) == 0)
  {
    BOOL v5 = [(SBHIconManager *)self widgetIconIsOnboardingWidget:v9];

    if (!v5) {
      goto LABEL_5;
    }
    char v4 = [(SBHIconManager *)self homeScreenDefaults];
    [v4 setUserHasDeletedSuggestedWidget:1];
  }

LABEL_5:
  if ([(SBHIconManager *)self rootFolderContainsSuggestedWidget])
  {
    int v6 = [(SBHIconManager *)self defaultSecondPageSuggestedWidgetIcons];
    int v7 = [v6 containsObject:v9];

    if (!v7) {
      goto LABEL_10;
    }
    id v8 = [(SBHIconManager *)self proactiveWidgetSuggesterClient];
    [v8 logEventForDefaultWidgetSuggestionType:1 event:3];
  }
  else
  {
    id v8 = [(SBHIconManager *)self homeScreenDefaults];
    [v8 setUserDidUndoSuggestedWidget:1];
  }

LABEL_10:
}

- (void)disableUserInteractionForWidgetDiscoverability
{
  unsigned int v3 = [(SBHIconManager *)self rootFolderController];
  [v3 setScrollingDisabled:1 forReason:@"SBHIconManager WidgetDiscoverability"];

  [(SBHIconManager *)self setShouldDisableUserInteractionForWidgetDiscoverability:1];
}

- (void)enableUserInteractionForWidgetDiscoverability
{
  unsigned int v3 = [(SBHIconManager *)self rootFolderController];
  [v3 setScrollingDisabled:0 forReason:@"SBHIconManager WidgetDiscoverability"];

  [(SBHIconManager *)self setShouldDisableUserInteractionForWidgetDiscoverability:0];
}

- (void)updatePronouncedContainerViewVisibility:(BOOL)a3 vertical:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(SBHIconManager *)self rootFolderController];
  [v6 updatePronouncedContainerViewVisibilityIfPossible:v5 vertical:v4];
}

- (BOOL)prototypeSettingShowWidgetIntroduction
{
  int v2 = [(SBHIconManager *)self widgetIntroductionSettings];
  char v3 = [v2 showWidgetIntroConvenienceControl];

  return v3;
}

- (BOOL)prototypeSettingEditButtonAsUndo
{
  int v2 = [(SBHIconManager *)self widgetIntroductionSettings];
  char v3 = [v2 editButtonAsUndo];

  return v3;
}

- (BOOL)prototypeSettingSimpleBottomSnaking
{
  int v2 = [(SBHIconManager *)self widgetIntroductionSettings];
  char v3 = [v2 simpleBottomSnaking];

  return v3;
}

- (BOOL)prototypeSettingBumpLeastUsedApps
{
  int v2 = [(SBHIconManager *)self widgetIntroductionSettings];
  char v3 = [v2 bumpLeastUsedApps];

  return v3;
}

- (BOOL)prototypeSettingShowExtraLargeTVWidget
{
  int v2 = [(SBHIconManager *)self widgetIntroductionSettings];
  char v3 = [v2 showXLTVWidget];

  return v3;
}

- (void)scrollToDefaultWidgets
{
  id v2 = [(SBHIconManager *)self rootFolderController];
  objc_msgSend(v2, "setCurrentPageIndex:animated:completion:", objc_msgSend(v2, "firstIconPageIndex"), 0, 0);
}

- (void)prepareModalWidgetIntroductionWidgetViewSnapshots
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  char v3 = [(SBHIconManager *)self defaultFirstPageSuggestedWidgetIcons];
  BOOL v4 = [v3 lastObject];

  BOOL v5 = [(SBHIconManager *)self rootViewController];
  id v6 = [v5 firstIconViewForIcon:v4 options:64];

  [v6 iconImageCenter];
  objc_msgSend(v6, "convertPoint:toView:", 0);
  double v8 = v7;
  double v10 = v9;
  [v6 iconImageSize];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
  int v16 = [(SBHIconManager *)self onboardingWidgetPreviewsForWidgetIcon:v4];
  char v45 = [v15 arrayWithArray:v16];

  uint64_t v17 = [(SBHIconManager *)self defaultFirstPageSuggestedWidgetIcons];
  __int16 v18 = [v17 firstObject];

  uint64_t v19 = [(SBHIconManager *)self rootViewController];
  __int16 v20 = [v19 firstIconViewForIcon:v18 options:64];

  [v20 iconImageCenter];
  objc_msgSend(v20, "convertPoint:toView:", 0);
  double v22 = v21;
  double v24 = v23;
  [v20 iconImageSize];
  double v26 = v25;
  double v28 = v27;
  long long v29 = (void *)MEMORY[0x1E4F1C978];
  long long v30 = [(SBHIconManager *)self onboardingWidgetPreviewsForWidgetIcon:v18];
  long long v31 = [v29 arrayWithArray:v30];

  long long v32 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    [v20 iconImageCenter];
    long long v33 = NSStringFromCGPoint(v51);
    [v6 iconImageCenter];
    uint64_t v34 = NSStringFromCGPoint(v52);
    *(_DWORD *)buf = 138412546;
    id v47 = v33;
    __int16 v48 = 2112;
    id v49 = v34;
    _os_log_impl(&dword_1D7F0A000, v32, OS_LOG_TYPE_DEFAULT, "Static original widget center(%@); falling original widget center(%@)",
      buf,
      0x16u);
  }
  id v35 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v53.double x = v22;
    v53.double y = v24;
    uint64_t v36 = NSStringFromCGPoint(v53);
    v54.double x = v8;
    v54.double y = v10;
    char v37 = NSStringFromCGPoint(v54);
    *(_DWORD *)buf = 138412546;
    id v47 = v36;
    __int16 v48 = 2112;
    id v49 = v37;
    _os_log_impl(&dword_1D7F0A000, v35, OS_LOG_TYPE_DEFAULT, "Static widget center(%@); falling widget center(%@)",
      buf,
      0x16u);
  }
  uint64_t v38 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];

  if (v38)
  {
    uint64_t v39 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];
    [v39 setOnboardingFallingWidgetPreviews:v45];

    id v40 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];
    objc_msgSend(v40, "setOnboardingFallingWidgetCenterPoint:", v8, v10);

    uint64_t v41 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];
    objc_msgSend(v41, "setOnboardingFallingWidgetBounds:", 0.0, 0.0, v12, v14);

    uint64_t v42 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];
    [v42 setOnboardingStaticWidgetPreviews:v31];

    uint64_t v43 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];
    objc_msgSend(v43, "setOnboardingStaticWidgetCenterPoint:", v22, v24);

    id v44 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem modalIntroductionViewController];
    objc_msgSend(v44, "setOnboardingStaticWidgetBounds:", 0.0, 0.0, v26, v28);
  }
}

- (id)_widgetIntroductionHomeScreenPreviewView
{
  char v3 = [(SBHIconManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained widgetIntroductionPreviewViewForIconManager:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)invalidateOnboardingWidgetPreviewViewControllers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBHIconManager *)self chuisOnboardingWidgetViewControllers];
  if (v3)
  {
    char v4 = (void *)v3;
    BOOL v5 = [(SBHIconManager *)self chuisOnboardingWidgetViewControllers];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v7 = [(SBHIconManager *)self chuisOnboardingWidgetViewControllers];
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
            [*(id *)(*((void *)&v13 + 1) + 8 * v11++) invalidate];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      double v12 = [(SBHIconManager *)self chuisOnboardingWidgetViewControllers];
      [v12 removeAllObjects];
    }
  }
  [(SBHIconManager *)self setChuisOnboardingWidgetViewControllers:0];
}

- (id)onboardingWidgetPreviewsForWidgetIcon:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SBHIconManager *)self chuisOnboardingWidgetViewControllers];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    chuisOnboardingWidgetViewControllers = self->_chuisOnboardingWidgetViewControllers;
    self->_chuisOnboardingWidgetViewControllers = v6;
  }
  char v37 = self;
  uint64_t v34 = [(SBHIconManager *)self gridSizeClassDomain];
  id v33 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v35 = v4;
  id obj = [v4 iconDataSources];
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v38)
  {
    uint64_t v8 = *(void *)v40;
    uint64_t v32 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v11 = self;
        if (objc_opt_isKindOfClass()) {
          double v12 = v10;
        }
        else {
          double v12 = 0;
        }
        id v13 = v12;

        long long v14 = [v13 kind];
        long long v15 = [v13 extensionBundleIdentifier];
        long long v16 = [v13 containerBundleIdentifier];
        if (v13) {
          BOOL v17 = v14 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && v15 != 0)
        {
          uint64_t v19 = [(SBHIconManager *)v37 _intentForWidget:v13 ofIcon:v35 creatingIfNecessary:1];
          __int16 v20 = [v35 gridSizeClass];
          uint64_t v21 = [v34 chsWidgetFamilyForIconGridSizeClass:v20];
          double v22 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:v15 containerBundleIdentifier:v16 deviceIdentifier:0];
          double v23 = (void *)[objc_alloc(MEMORY[0x1E4F58DD8]) initWithExtensionIdentity:v22 kind:v14 family:v21 intent:v19 activityIdentifier:0];

          if (v23)
          {
            double v24 = [(SBHIconManager *)v37 widgetMetricsProvider];
            double v25 = [v24 systemMetricsForWidget:v23];

            id v26 = objc_alloc(MEMORY[0x1E4F58F58]);
            double v27 = [v13 uniqueIdentifier];
            double v28 = (void *)[v26 initWithWidget:v23 metrics:v25 widgetConfigurationIdentifier:v27];

            uint64_t v8 = v32;
            long long v29 = [(SBHIconManager *)v37 chuisOnboardingWidgetViewControllers];
            [v29 addObject:v28];

            long long v30 = [v28 view];
            [v33 addObject:v30];
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v38);
  }

  return v33;
}

- (void)removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBHIconManager *)self rootFolder];
  uint64_t v6 = [(SBHIconManager *)self rootFolder];
  double v7 = objc_msgSend(v5, "listAtIndex:", objc_msgSend(v6, "firstVisibleListIndex"));

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__SBHIconManager_removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded___block_invoke;
  v9[3] = &unk_1E6AB46C8;
  void v9[4] = self;
  v9[5] = &v10;
  [v7 enumerateIconsWithOptions:0 usingBlock:v9];
  if (*((unsigned char *)v11 + 24)) {
    BOOL v8 = !v3;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    [(SBHIconManager *)self updatePronouncedContainerViewVisibility:0 vertical:[(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem isVerticalWidgetIntroduction]];
  }
  _Block_object_dispose(&v10, 8);
}

void __80__SBHIconManager_removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isWidgetIcon])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) widgetIconIsOnboardingWidget:v6];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

- (BOOL)widgetIconIsOnboardingWidget:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = objc_msgSend(a3, "widgets", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 suggestionSource] == 2)
        {
          char v7 = 1;
        }
        else if ([v10 suggestionSource] != 2)
        {
          v6 |= [v10 suggestionSource] != 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
    char v7 = 0;
  }

  return v7 & ~v6 & 1;
}

- (id)captureHomeScreenOnboardingSnapshot
{
  BOOL v3 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Capture home screen preview for widget discoverability introduction", v6, 2u);
  }

  uint64_t v4 = [(SBHIconManager *)self _widgetIntroductionHomeScreenPreviewView];
  return v4;
}

- (BOOL)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHIconManager *)self focusModeManager];
  uint64_t v9 = [v8 activeFocusMode];
  uint64_t v10 = [v9 identifier];
  LOBYTE(self) = [(SBHIconManager *)self swapApplicationIconsInProminentPositionsWithBundleIdentifier:v7 withApplicationIconsWithWithBundleIdentifier:v6 focusModeIdentifier:v10];

  return (char)self;
}

- (BOOL)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4 focusModeIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(SBHIconManager *)self rootFolder];
  LOBYTE(self) = [(SBHIconManager *)self swapApplicationIconsInProminentPositionsWithBundleIdentifier:v10 withApplicationIconsWithWithBundleIdentifier:v9 inRootFolder:v11 focusModeIdentifier:v8];

  return (char)self;
}

- (BOOL)swapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4 inRootFolder:(id)a5 focusModeIdentifier:(id)a6
{
  v85[2] = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v59 = [(SBHIconManager *)self iconModel];
  long long v13 = [v11 firstList];
  uint64_t v14 = [v11 dock];
  id v48 = v12;
  if (v12)
  {
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke;
    v79[3] = &unk_1E6AB46F0;
    id v80 = v12;
    long long v15 = [v11 indexesOfListsPassingTest:v79];
    if ([v15 count])
    {
      uint64_t v16 = objc_msgSend(v11, "listAtIndex:", objc_msgSend(v15, "firstIndex"));

      long long v13 = (void *)v16;
    }
  }
  id v49 = (void *)v14;
  uint64_t v50 = v13;
  v85[0] = v14;
  v85[1] = v13;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v76;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v76 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke_2;
        v73[3] = &unk_1E6AAF238;
        id v74 = v10;
        if ([v21 directlyContainsIconPassingTest:v73])
        {
          double v28 = SBLogIcon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[SBHIconManager swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:inRootFolder:focusModeIdentifier:]();
          }

          BOOL v29 = 0;
          long long v30 = v74;
          double v22 = obj;
          double v23 = obj;
          long long v31 = v48;
          goto LABEL_45;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  double v22 = obj;

  double v23 = [v59 applicationIconForBundleIdentifier:v10];
  if (v23)
  {
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke_1007;
    v71[3] = &unk_1E6AADB28;
    long long v72 = v10;
    double v24 = [v11 iconsPassingTest:v71];
    double v25 = [v24 allObjects];

    if ([v25 count])
    {
      uint64_t v26 = [v25 indexOfObjectIdenticalTo:v23];
      if (!v26 || v26 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_26;
      }
      double v27 = (void *)[v25 mutableCopy];
      [v27 removeObject:v23];
      [v27 insertObject:v23 atIndex:0];
    }
    else
    {
      double v83 = v23;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      v25 = double v27 = v25;
    }

LABEL_26:
    uint64_t v32 = objc_msgSend(v25, "objectEnumerator", v10);
    id v54 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v57 = obj;
    uint64_t v33 = [v57 countByEnumeratingWithState:&v67 objects:v82 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v68;
      uint64_t v52 = *(void *)v68;
      CGPoint v53 = v25;
      do
      {
        uint64_t v36 = 0;
        uint64_t v56 = v34;
        do
        {
          if (*(void *)v68 != v35) {
            objc_enumerationMutation(v57);
          }
          char v37 = *(void **)(*((void *)&v67 + 1) + 8 * v36);
          if (([v37 directlyContainsAnyIconInArray:v25] & 1) == 0)
          {
            uint64_t v58 = v36;
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke_2_1008;
            v64[3] = &unk_1E6AB4718;
            id v65 = v55;
            id v38 = v54;
            id v66 = v38;
            long long v39 = [v37 directlyContainedIconsPassingTest:v64];
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v60 objects:v81 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v61;
              do
              {
                for (uint64_t j = 0; j != v41; ++j)
                {
                  if (*(void *)v61 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v44 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                  char v45 = [v32 nextObject];
                  if (!v45)
                  {
                    char v45 = [v59 addAdditionalIconMatchingIcon:v23];
                  }
                  [v11 swapIcon:v44 withIcon:v45 options:0];
                  [v38 addObject:v44];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v60 objects:v81 count:16];
              }
              while (v41);
            }

            uint64_t v35 = v52;
            double v25 = v53;
            uint64_t v34 = v56;
            uint64_t v36 = v58;
          }
          ++v36;
        }
        while (v36 != v34);
        uint64_t v34 = [v57 countByEnumeratingWithState:&v67 objects:v82 count:16];
      }
      while (v34);
    }

    BOOL v29 = [v54 count] != 0;
    long long v30 = v72;
    id v10 = v47;
    long long v31 = v48;
    double v22 = obj;
    goto LABEL_45;
  }
  long long v30 = SBLogIcon();
  long long v31 = v48;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[SBHIconManager swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:inRootFolder:focusModeIdentifier:]();
  }
  BOOL v29 = 0;
LABEL_45:

  return v29;
}

uint64_t __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 focusModeIdentifiers];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 applicationBundleID];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

uint64_t __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke_1007(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon])
  {
    uint64_t v4 = [v3 applicationBundleID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __157__SBHIconManager_swapApplicationIconsInProminentPositionsWithBundleIdentifier_withApplicationIconsWithWithBundleIdentifier_inRootFolder_focusModeIdentifier___block_invoke_2_1008(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon])
  {
    uint64_t v4 = [v3 applicationBundleID];
    if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
      uint64_t v5 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHIconManager *)self focusModeManager];
  id v9 = [v8 activeFocusMode];
  id v10 = [v9 identifier];
  LOBYTE(self) = [(SBHIconManager *)self canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:v7 withApplicationIconsWithWithBundleIdentifier:v6 focusModeIdentifier:v10];

  return (char)self;
}

- (BOOL)canSwapApplicationIconsInProminentPositionsWithBundleIdentifier:(id)a3 withApplicationIconsWithWithBundleIdentifier:(id)a4 focusModeIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBHIconManager *)self rootFolder];
  id v12 = (void *)[v11 copy];
  LOBYTE(self) = [(SBHIconManager *)self swapApplicationIconsInProminentPositionsWithBundleIdentifier:v10 withApplicationIconsWithWithBundleIdentifier:v9 inRootFolder:v12 focusModeIdentifier:v8];

  return (char)self;
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  [(SBHIconManager *)self noteRootFolderDidMutate];
  if (![(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem stopUpdatingDefaultWidgetsBumpedIconRecord])
  {
    [(SBHIconManager *)self beginStopUpdatingDefaultWidgetsBumpedIconRecord];
    double v82 = [(SBHIconManager *)self iconGridSizeClassSizes];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v80 = v6;
    id v7 = [v6 allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v99 objects:v105 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v100;
      double v84 = v7;
      uint64_t v81 = *(void *)v100;
      do
      {
        uint64_t v11 = 0;
        uint64_t v83 = v9;
        do
        {
          if (*(void *)v100 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v99 + 1) + 8 * v11);
          if ([v12 isWidgetIcon]
            && [(SBHIconManager *)self widgetIconIsOnboardingWidget:v12])
          {
            id obj = v12;
            uint64_t v86 = [obj gridSizeClass];
            unsigned int v13 = objc_msgSend(v82, "gridSizeAreaForGridSizeClass:");
            uint64_t v14 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
            unint64_t v15 = [v14 count];

            if (v15 >= v13) {
              unint64_t v15 = v13;
            }
            uint64_t v16 = [(SBHIconManager *)self rootFolder];
            uint64_t v17 = [(SBHIconManager *)self rootFolder];
            uint64_t v18 = objc_msgSend(v16, "listAtIndex:", objc_msgSend(v17, "firstVisibleListIndex"));

            unint64_t v19 = [v18 maxNumberOfIcons];
            uint64_t v20 = [v18 numberOfIcons];
            unint64_t v89 = v15;
            if (v20 + v15 <= v19) {
              unint64_t v21 = v20;
            }
            else {
              unint64_t v21 = v19 - v15;
            }
            double v22 = [(SBHIconManager *)self rootFolder];
            double v23 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
            double v24 = [v23 firstObject];
            uint64_t v25 = [v22 indexOfListContainingIcon:v24];

            uint64_t v87 = v11;
            double v85 = v18;
            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
            {
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              uint64_t v26 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecordOriginalIndex];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v95 objects:v104 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v96;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v96 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    unint64_t v31 = [*(id *)(*((void *)&v95 + 1) + 8 * i) integerValue];
                    if (v31 < v21) {
                      unint64_t v21 = v31;
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v95 objects:v104 count:16];
                }
                while (v28);
              }
            }
            if (v89)
            {
              uint64_t v32 = 0;
              while (1)
              {
                uint64_t v33 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
                uint64_t v34 = [v33 firstObject];

                id v35 = v34;
                uint64_t v36 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecordKeyForIcon:v35];
                char v37 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                id v38 = [v37 objectForKey:v36];

                long long v39 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                uint64_t v40 = [v39 allKeys];
                int v41 = [v40 containsObject:v38];

                if (v41)
                {
                  uint64_t v42 = v35;
                  do
                  {
                    id v43 = v38;

                    uint64_t v44 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecordKeyForIcon:v43];
                    char v45 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                    id v38 = [v45 objectForKey:v44];

                    uint64_t v46 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                    id v47 = [v46 allKeys];
                    char v48 = [v47 containsObject:v38];

                    uint64_t v42 = v43;
                  }
                  while ((v48 & 1) != 0);
                }
                else
                {
                  id v43 = v35;
                }
                id v49 = [MEMORY[0x1E4F1CA98] null];
                int v50 = [v38 isEqual:v49];

                if (v50) {
                  break;
                }
                if (v38)
                {
                  id v54 = [(SBHIconManager *)self rootFolder];
                  id v55 = (id)[v54 insertIcon:v35 afterIcon:v38 options:0 listGridCellInfoOptions:0];
                  goto LABEL_36;
                }
LABEL_37:
                uint64_t v56 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                [v56 removeObjectForKey:v35];

                id v57 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
                [v57 removeObjectAtIndex:0];

                uint64_t v58 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecordOriginalIndex];
                [v58 removeObjectAtIndex:0];

                if (++v32 == v89) {
                  goto LABEL_38;
                }
              }
              CGPoint v51 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:0 listIndex:0];
              uint64_t v52 = [(SBHIconManager *)self rootFolder];
              id v94 = v51;
              id v53 = (id)[v52 insertIcon:v35 atIndexPath:&v94 options:0];
              id v54 = v94;

LABEL_36:
              goto LABEL_37;
            }
LABEL_38:
            long long v59 = [(SBHIconManager *)self rootFolder];
            long long v60 = [(SBHIconManager *)self rootFolder];
            uint64_t v61 = objc_msgSend(v59, "nextVisibleListIndexAfterIndex:", objc_msgSend(v60, "firstVisibleListIndex"));

            long long v62 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:v21 listIndex:v61];
            long long v63 = [(SBHIconManager *)self rootFolder];
            [v63 _swapRestoreIconCount:v89 toLocation:v62];

            [(SBHIconManager *)self removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded:0];
            uint64_t v9 = v83;
            id v7 = v84;
            uint64_t v10 = v81;
            uint64_t v64 = v85;
            id v65 = (void *)v86;
LABEL_51:

            uint64_t v11 = v87;
            goto LABEL_52;
          }
          id v66 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
          int v67 = [v66 containsObject:v12];

          if (v67)
          {
            long long v68 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
            long long v69 = [v68 allValues];
            int v70 = [v69 containsObject:v12];

            if (v70)
            {
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              long long v71 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
              long long v72 = [v71 allKeys];

              id obj = v72;
              uint64_t v73 = [v72 countByEnumeratingWithState:&v90 objects:v103 count:16];
              if (v73)
              {
                uint64_t v74 = v73;
                uint64_t v87 = v11;
                uint64_t v75 = *(void *)v91;
                while (2)
                {
                  for (uint64_t j = 0; j != v74; ++j)
                  {
                    if (*(void *)v91 != v75) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v77 = *(void *)(*((void *)&v90 + 1) + 8 * j);
                    long long v78 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                    id v65 = [v78 objectForKey:v77];

                    if ([v65 isEqual:v12])
                    {
                      double v79 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
                      [v79 removeObjectForKey:v77];

                      uint64_t v64 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsBumpedIconUsageRanking];
                      [v64 removeObject:v77];
                      id v7 = v84;
                      goto LABEL_51;
                    }
                  }
                  uint64_t v74 = [obj countByEnumeratingWithState:&v90 objects:v103 count:16];
                  if (v74) {
                    continue;
                  }
                  break;
                }
                uint64_t v11 = v87;
                id v7 = v84;
              }
LABEL_52:
            }
          }
          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v99 objects:v105 count:16];
      }
      while (v9);
    }

    [(SBHIconManager *)self endStopUpdatingDefaultWidgetsBumpedIconRecord];
    id v6 = v80;
  }
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(SBHIconManager *)self noteRootFolderDidMutate];
  if (![(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem stopUpdatingDefaultWidgetsBumpedIconRecord])
  {
    if ([v6 isWidgetIcon]
      && [(SBHIconManager *)self widgetIconIsOnboardingWidget:v6])
    {
      [(SBHIconManager *)self removeWidgetDiscoverabilityContainerViewsAndPopoverWhenNeeded:0];
    }
    id v7 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
    uint64_t v8 = [v7 allValues];
    int v9 = [v8 containsObject:v6];

    if (v9)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v10 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
      uint64_t v11 = [v10 allKeys];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v17 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
            uint64_t v18 = [v17 objectForKey:v16];

            if ([v18 isEqual:v6])
            {
              unint64_t v19 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self->_widgetIntroductionItem defaultWidgetsIconsRestoringRecord];
              [v19 setObject:v6 forKey:v16];

              goto LABEL_16;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
  id v8 = a4;
  [(SBHIconManager *)self noteRootFolderDidMutate];
  uint64_t v5 = [(SBHIconManager *)self rootFolder];
  uint64_t v6 = [v5 firstVisibleListIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v5 listAtIndex:v6];
    if ([v7 isEqual:v8]) {
      -[SBHWidgetIntroductionFeatureIntroductionItem setStopUpdatingDefaultWidgetsBumpedIconRecord:](self->_widgetIntroductionItem, "setStopUpdatingDefaultWidgetsBumpedIconRecord:", [v8 isHidden]);
    }
  }
}

- (id)addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:(id)a3
{
  uint64_t v4 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 addWidgetSheetViewControllerForIconManager:self];
  }
  else {
  uint64_t v5 = [(SBRootFolderController *)self->_rootFolderController addSheetViewController];
  }

  return v5;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4
{
  uint64_t v4 = [(SBHIconManager *)self applicationWithBundleIdentifier:a4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 vendorName];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (![(__CFString *)v5 length]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v4 isAppleApplication])
  {

    uint64_t v5 = @"Apple";
  }

  return v5;
}

- (id)rootFolderForAddWidgetSheetConfigurationManager:(id)a3
{
  return self->_rootFolder;
}

- (id)homeScreenDefaultsForAddWidgetSheetConfigurationManager:(id)a3
{
  return self->_homeScreenDefaults;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 containerBundleIdentiferForDescriptor:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 extensionIdentity];
  id v7 = [v6 containerBundleIdentifier];

  id v8 = [(SBHIconManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 iconManager:self containerBundleIdentifierForDescriptor:v5];

    id v7 = (void *)v9;
  }

  return v7;
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [[SBHIconLayoutHidingCompoundAssertion alloc] initWithInvalidationHandler:0 icons:v8 reason:v9 options:a5];
  uint64_t v11 = [(SBHIconManager *)self rootFolderController];
  [(SBHIconLayoutHidingCompoundAssertion *)v10 addAssertionFromChild:v11];

  uint64_t v12 = [(SBHIconManager *)self folderIconImageCache];
  [(SBHIconLayoutHidingCompoundAssertion *)v10 addAssertionFromChild:v12];

  uint64_t v13 = [(SBHIconManager *)self floatingDockListView];
  if (v13) {
    [(SBHIconLayoutHidingCompoundAssertion *)v10 addAssertionFromChild:v13];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [(SBHIconManager *)self todayViewControllers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = [*(id *)(*((void *)&v21 + 1) + 8 * i) listView];
        [(SBHIconLayoutHidingCompoundAssertion *)v10 addAssertionFromChild:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v10;
}

- (void)setIconStylePickerVisible:(BOOL)a3
{
  if (self->_iconStylePickerVisible == a3) {
    return;
  }
  self->_iconStylePickerVisible = a3;
  id v13 = [(SBHIconManager *)self currentStylePickerViewController];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = v5;
  if (a3)
  {
    [v5 postNotificationName:@"SBHIconManagerWillPresentStyleEditingSheetNotification" object:0];

LABEL_6:
    id v7 = v13;
    goto LABEL_7;
  }
  [v5 postNotificationName:@"SBHIconManagerDidDismissStyleEditingSheetNotification" object:0];

  id v7 = v13;
  if (v13)
  {
    id v8 = [v13 navigationController];
    id v9 = [v8 sheetPresentationController];
    uint64_t v10 = [v9 sourceView];
    [v10 removeFromSuperview];

    uint64_t v11 = [v13 navigationController];
    uint64_t v12 = [v11 presentingViewController];
    [v12 dismissViewControllerAnimated:1 completion:0];

    [(SBHIconManager *)self setCurrentStylePickerViewController:0];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_dismissStylePickerViewControllerImmediately
{
  id v5 = [(SBHIconManager *)self currentStylePickerViewController];
  id v3 = [v5 navigationController];
  uint64_t v4 = [v3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(SBHIconManager *)self setCurrentStylePickerViewController:0];
  [(SBHIconManager *)self setIconStylePickerVisible:0];
}

- (void)stylePickerViewController:(id)a3 didUpdateHomeScreenConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_getAssociatedObject(v7, &SBHLastHomeScreenConfigurationKey);
  long long v22 = [(SBHIconManager *)self rootViewController];
  id v9 = [v22 traitCollection];
  uint64_t v10 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:v6];
  uint64_t v11 = [(SBHIconManager *)self stylePreviewManager];
  [v11 setImageStyleConfiguration:v10];
  uint64_t v12 = objc_msgSend(v10, "iconImageAppearanceWithUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
  id v13 = (void *)MEMORY[0x1E4F1CB00];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __77__SBHIconManager_stylePickerViewController_didUpdateHomeScreenConfiguration___block_invoke;
  v23[3] = &unk_1E6AB4758;
  void v23[4] = self;
  id v24 = v12;
  id v14 = v12;
  uint64_t v15 = [v13 scheduledTimerWithTimeInterval:0 repeats:v23 block:0.25];
  uint64_t v16 = [(SBHIconManager *)self visibleIconTintLimitedDelayedUpdateTimer];
  [v16 invalidate];

  [(SBHIconManager *)self setVisibleIconTintLimitedDelayedUpdateTimer:v15];
  uint64_t v17 = [(SBHIconManager *)self visibleIconImageRecachingRequestCancellation];
  [v17 cancel];

  [(SBHIconManager *)self setVisibleIconImageRecachingRequestCancellation:0];
  [(SBHIconManager *)self setDidChangeIconStyleWithColorPicker:1];
  objc_setAssociatedObject(v7, &SBHLastHomeScreenConfigurationKey, v6, (void *)1);
  [(SBHIconManager *)self _applyBarButtonItemsToStylePicker:v7 forHomeScreenConfiguration:v6];

  uint64_t v18 = [v6 styleType];
  if (v18 != [v8 styleType])
  {
    BOOL v19 = [(SBHIconManager *)self currentHomeScreenWallpaperDimState];
    BOOL v20 = (v18 & 0xFFFFFFFFFFFFFFFDLL) == 0 && v19;
    char v21 = (v18 & 0xFFFFFFFFFFFFFFFDLL) != 1 || v19;
    if (v20 || (v21 & 1) == 0) {
      [(SBHIconManager *)self toggleHomeScreenWallpaperDim:0];
    }
  }
}

uint64_t __77__SBHIconManager_stylePickerViewController_didUpdateHomeScreenConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recacheVisibleIconImageDataForRootIconsInBackgroundWithImageAppearance:*(void *)(a1 + 40) cacheOptions:0];
}

- (void)stylePickerViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  [(SBHIconManager *)self setCurrentStylePickerViewController:0];
  [(SBHIconManager *)self setIconStylePickerVisible:0];
  id v5 = [(SBHIconManager *)self visibleIconTintLimitedDelayedUpdateTimer];
  [v5 invalidate];

  [(SBHIconManager *)self setVisibleIconTintLimitedDelayedUpdateTimer:0];
  id v6 = objc_getAssociatedObject(v4, &SBHLastHomeScreenConfigurationKey);

  if (v6) {
    [(SBHIconManager *)self _updateStyleConfiguration:v6];
  }
  id v7 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:v6];
  id v8 = [(SBHIconManager *)self rootViewController];
  id v9 = [v8 traitCollection];
  uint64_t v10 = objc_msgSend(v9, "sbh_iconImageAppearanceWithHomeScreenStyleConfiguration:", v6);
  uint64_t v11 = [(SBHIconManager *)self iconImageCache];
  uint64_t v12 = [(SBHIconManager *)self visibleIconsToRecacheForImageAppearanceChange];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __53__SBHIconManager_stylePickerViewControllerDidFinish___block_invoke;
  v16[3] = &unk_1E6AB4780;
  id v17 = v8;
  id v18 = v10;
  BOOL v19 = self;
  id v13 = v10;
  id v14 = v8;
  id v15 = (id)[v11 cacheImagesForIcons:v12 imageAppearance:v13 priority:4 reason:@"stylePickerDidFinish" options:0 completionHandler:v16];
  if ([(SBHIconManager *)self didChangeIconStyleWithColorPicker]) {
    [(SBHIconManager *)self recacheIconImageDataForRootIconsInBackgroundWithIconImageStyleConfiguration:v7 cacheOptions:1];
  }
}

void __53__SBHIconManager_stylePickerViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) traitCollection];
  id v2 = objc_msgSend(v6, "sbh_iconImageAppearance");
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 48);
  if (v3)
  {
    id v5 = [v4 stylePreviewManager];
    [v5 invalidate];

    [*(id *)(a1 + 48) setStylePreviewManager:0];
  }
  else
  {
    [v4 setShouldClearStylePreviewManagerAfterRootTraitChange:1];
  }
}

- (void)stylePickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  id v4 = objc_msgSend(a3, "navigationController", a4);
  id v5 = [v4 sheetPresentationController];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBHIconManager_stylePickerViewController_didUpdateDesiredDetent___block_invoke;
  v7[3] = &unk_1E6AAC810;
  id v8 = v5;
  id v6 = v5;
  [v6 animateChanges:v7];
}

uint64_t __67__SBHIconManager_stylePickerViewController_didUpdateDesiredDetent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateDetents];
}

- (void)_presentStylePickerViewController
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__SBHIconManager__presentStylePickerViewController__block_invoke;
  v2[3] = &unk_1E6AB34D8;
  v2[4] = self;
  [(SBHIconManager *)self _fetchWallpaperProminentColor:v2];
}

void __51__SBHIconManager__presentStylePickerViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  BSDispatchMain();
}

void __51__SBHIconManager__presentStylePickerViewController__block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) persistedHomeScreenColorConfiguration];
  id v2 = (void *)[v8 mutableCopy];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    getPUIMutableStylePickerConfigurationClass();
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;

  if ([v8 styleType] != 3) {
    [v5 setAccentColor:*(void *)(a1 + 40)];
  }
  [v5 setSuggestedAccentColor:*(void *)(a1 + 40)];
  id v6 = [getPUIMutableStylePickerConfigurationClass() defaultStylePickerConfigurationForRole:0];
  [v6 setHomeScreenConfiguration:v5];
  id v7 = (void *)[objc_alloc((Class)getPUIStylePickerComponentsClass()) initWithComponent:*MEMORY[0x1E4F92848]];
  [v6 setComponents:v7];

  [*(id *)(a1 + 32) _presentStylePickerViewControllerForStylePickerConfiguration:v6];
}

- (void)_applyBarButtonItemsToStylePicker:(id)a3 forHomeScreenConfiguration:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 styleType];
  if (!self->_eyeDropperControl)
  {
    id v8 = [SBHStyleTintButton alloc];
    id v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"eyedropper"];
    uint64_t v10 = [(SBHStyleTintButton *)v8 initWithImage:v9];
    eyeDropperControl = self->_eyeDropperControl;
    self->_eyeDropperControl = v10;

    [(SBHStyleTintButton *)self->_eyeDropperControl addTarget:self action:sel__engageWallpaperTintColorDropper_ forControlEvents:64];
    [(SBHStyleTintButton *)self->_eyeDropperControl sizeToFit];
  }
  if (!self->_wallpaperDimButton)
  {
    uint64_t v12 = [SBHWallpaperDimControl alloc];
    id v13 = -[SBHWallpaperDimControl initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    wallpaperDimButton = self->_wallpaperDimButton;
    self->_wallpaperDimButton = v13;

    [(SBHWallpaperDimControl *)self->_wallpaperDimButton setReferenceLayoutView:self->_eyeDropperControl];
    [(SBHWallpaperDimControl *)self->_wallpaperDimButton setAutoresizingMask:0];
    [(SBHWallpaperDimControl *)self->_wallpaperDimButton addTarget:self action:sel_toggleHomeScreenWallpaperDim_ forControlEvents:64];
  }
  dimBarButtonIteuint64_t m = self->_dimBarButtonItem;
  if (dimBarButtonItem)
  {
    uint64_t v16 = [(UIBarButtonItem *)dimBarButtonItem customView];
    objc_msgSend(v16, "setDimmed:animated:", -[SBHIconManager currentHomeScreenWallpaperDimState](self, "currentHomeScreenWallpaperDimState"), 1);
  }
  else
  {
    id v17 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_wallpaperDimButton];
    id v18 = self->_dimBarButtonItem;
    self->_dimBarButtonIteuint64_t m = v17;

    [(SBHWallpaperDimControl *)self->_wallpaperDimButton setDimmed:[(SBHIconManager *)self currentHomeScreenWallpaperDimState] animated:0];
  }
  v25[0] = self->_dimBarButtonItem;
  BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v6 setLeadingBarButtonItems:v19];

  if (v7 == 3)
  {
    eyeDropperBarButtonIteuint64_t m = self->_eyeDropperBarButtonItem;
    if (!eyeDropperBarButtonItem)
    {
      char v21 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_eyeDropperControl];
      long long v22 = self->_eyeDropperBarButtonItem;
      self->_eyeDropperBarButtonIteuint64_t m = v21;

      eyeDropperBarButtonIteuint64_t m = self->_eyeDropperBarButtonItem;
    }
    id v24 = eyeDropperBarButtonItem;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v6 setTrailingBarButtonItems:v23];
  }
  else
  {
    [v6 setTrailingBarButtonItems:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_presentStylePickerViewControllerForStylePickerConfiguration:(id)a3
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v4 = [(SBHIconManager *)self currentStylePickerViewController];

  if (!v4)
  {
    id object = (id)[objc_alloc((Class)getPUIStylePickerViewControllerClass()) initWithStylePickerConfiguration:v71];
    id v5 = SBHBundle();
    id v6 = [v5 localizedStringForKey:@"STYLE_PICKER_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [object setTitle:v6];

    [object setDelegate:self];
    [(SBHIconManager *)self setCurrentStylePickerViewController:object];
    uint64_t v7 = [v71 homeScreenConfiguration];
    objc_setAssociatedObject(object, &SBHLastHomeScreenConfigurationKey, v7, (void *)1);

    long long v69 = [[SBHNavigationController alloc] initWithRootViewController:object];
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(SBHNavigationController *)v69 setModalPresentedBackgroundColor:v8];

    [(SBHNavigationController *)v69 setModalPresentationStyle:2];
    objc_initWeak(&location, self);
    id v9 = [SBHIconStyleLabelHidingView alloc];
    id v10 = objc_loadWeakRetained(&location);
    id obj = [(SBHIconStyleLabelHidingView *)v9 initWithTarget:v10 action:sel_iconSizeButtonTriggered];

    [(SBHIconStyleLabelHidingView *)obj setShouldUseLargeIcons:[(SBHIconManager *)self _shouldUseHomeScreenLargeIconSize]];
    objc_storeStrong((id *)&self->_labelHidingView, obj);
    uint64_t v64 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:obj];
    v76[0] = v64;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
    [object setCenterBarButtonItems:v11];

    uint64_t v12 = [v71 homeScreenConfiguration];
    [(SBHIconManager *)self _applyBarButtonItemsToStylePicker:object forHomeScreenConfiguration:v12];

    id v13 = [(SBHIconManager *)self rootFolderController];
    id v65 = [v13 contentView];

    long long v68 = [(SBHNavigationController *)v69 sheetPresentationController];
    id v14 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [v65 bounds];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      id v24 = [v65 _screen];
      [v24 scale];
      uint64_t v57 = v25;
      UIRectCenteredXInRectScale();
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      v77.origin.double x = v17;
      v77.origin.double y = v19;
      v77.size.double width = v21;
      v77.size.double height = v23;
      double MaxY = CGRectGetMaxY(v77);
      uint64_t v33 = objc_msgSend(v65, "viewWithTag:", 748373893, v57);
      if (!v33)
      {
        uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v27, MaxY + -20.0, v29, v31);
        [v33 setAutoresizingMask:18];
        [v33 setTag:748373893];
        [v33 setUserInteractionEnabled:0];
        uint64_t v34 = [MEMORY[0x1E4FB1618] clearColor];
        [v33 setBackgroundColor:v34];

        [v65 addSubview:v33];
      }
      [v68 setSourceView:v33];
      [object desiredDetent];
      double v36 = v35;
      -[SBHNavigationController setPreferredContentSize:](v69, "setPreferredContentSize:", 500.0, v35);
      objc_msgSend(object, "setPreferredContentSize:", 500.0, v36);
      char v37 = [v68 traitOverrides];
      [v37 setVerticalSizeClass:1];

      id v38 = [v68 traitOverrides];
      [v38 setHorizontalSizeClass:1];

      long long v39 = [(SBHNavigationController *)v69 traitOverrides];
      [v39 setVerticalSizeClass:1];

      uint64_t v40 = [(SBHNavigationController *)v69 traitOverrides];
      [v40 setHorizontalSizeClass:1];

      [v68 setPreferredCornerRadius:SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(1)];
    }
    else
    {
      [v68 setPreferredCornerRadius:SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(0)];
    }
    [v68 _setShouldDismissWhenTappedOutside:1];
    int v41 = (void *)MEMORY[0x1E4FB1C30];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __79__SBHIconManager__presentStylePickerViewControllerForStylePickerConfiguration___block_invoke;
    v72[3] = &unk_1E6AB47A8;
    objc_copyWeak(&v73, &location);
    long long v59 = [v41 customDetentWithIdentifier:@"stylePickerViewControllerDetent" resolver:v72];
    uint64_t v75 = v59;
    long long v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [v68 setDetents:v63];
    [(SBHIconManager *)self setIconStylePickerVisible:1];
    long long v62 = [(SBHIconManager *)self listViewsToUpdateDuringColorPicking];
    uint64_t v61 = [(SBHIconManager *)self additionalIconViewsToUpdateDuringColorPicking];
    id v66 = [(SBHIconManager *)self iconImageCache];
    long long v60 = [(SBHIconManager *)self folderIconImageCache];
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v43 = [(SBHIconManager *)self rootFolderController];
    if (v43) {
      [v42 addObject:v43];
    }
    uint64_t v58 = (void *)v43;
    uint64_t v44 = [(SBHIconManager *)self floatingDockViewController];
    if (v44) {
      [v42 addObject:v44];
    }
    char v45 = [[SBHIconStylePreviewManager alloc] initWithTraitOverridableObjects:v42 iconListViews:v62 additionalIconViews:v61 iconImageCache:v66 folderIconImageCache:v60];
    [(SBHIconManager *)self setStylePreviewManager:v45];
    uint64_t v46 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v47 = [v46 userInterfaceIdiom];

    if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      char v48 = [(SBHIconManager *)self floatingDockViewController];
      id v49 = [v48 parentViewController];
      [v49 presentViewController:v69 animated:1 completion:0];
    }
    else
    {
      char v48 = [(SBHIconManager *)self rootFolderController];
      [v48 presentViewController:v69 animated:1 completion:0];
    }

    [(SBHIconManager *)self setEditing:0];
    int v50 = [(SBHIconManager *)self visibleIconsToRecacheForImageAppearanceChange];
    CGPoint v51 = [(SBHIconManager *)self iconsToRecacheForImageAppearanceChange];
    uint64_t v52 = [v66 buildCacheRequestWithReason:@"presentStylePicker"];
    id v53 = +[SBHIconImageAppearance tintableAppearance];
    [v52 addIcons:v50 imageAppearance:v53 priority:3 options:0];
    [v52 addIcons:v51 imageAppearance:v53 priority:2 options:0];
    id v54 = +[SBHIconImageAppearance lightAppearance];
    [v52 addIcons:v50 imageAppearance:v54 priority:3 options:0];

    id v55 = +[SBHIconImageAppearance darkAppearance];
    [v52 addIcons:v50 imageAppearance:v55 priority:3 options:0];

    id v56 = (id)[v52 finalizeRequestWithCompletionHandler:0];
    [(SBHIconManager *)self setDidChangeIconStyleWithColorPicker:0];

    objc_destroyWeak(&v73);
    objc_destroyWeak(&location);
  }
}

double __79__SBHIconManager__presentStylePickerViewControllerForStylePickerConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained currentStylePickerViewController];
    [v3 desiredDetent];
    double v5 = v4;

    if (v2[392]) {
      double v5 = -v5;
    }
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)_fetchWallpaperProminentColor:(id)a3
{
  double v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    id v10 = v4;
    if (os_variant_has_internal_content())
    {
      double v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v6 = [v5 stringForKey:@"KEYNOTE_OVERRIDE_PROMINENT_COLOR"];
      if (v6)
      {
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1618], "sbh_colorWithHexString:", v6);
        if (v7)
        {
          id v8 = (void *)v7;
          v10[2](v10, v7);

LABEL_10:
          double v4 = v10;
          goto LABEL_11;
        }
      }
    }
    double v5 = [(SBHIconManager *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v5 iconManagerPreferredProminentPosterColor:self handler:v10];
    }
    else
    {
      id v9 = [MEMORY[0x1E4FB1618] orangeColor];
      v10[2](v10, (uint64_t)v9);
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (id)listViewsToUpdateDuringColorPicking
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [(SBHIconManager *)self currentRootIconList];
  if (v4) {
    [v3 addObject:v4];
  }
  double v5 = [(SBHIconManager *)self dockListView];
  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(SBHIconManager *)self floatingDockViewController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__SBHIconManager_listViewsToUpdateDuringColorPicking__block_invoke;
  v15[3] = &unk_1E6AB47D0;
  id v7 = v3;
  id v16 = v7;
  [v6 enumerateIconListsUsingBlock:v15];
  id v8 = [(SBHIconManager *)self todayViewControllers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__SBHIconManager_listViewsToUpdateDuringColorPicking__block_invoke_2;
  v13[3] = &unk_1E6AB47F8;
  id v9 = v7;
  id v14 = v9;
  [v8 enumerateObjectsUsingBlock:v13];

  id v10 = v14;
  id v11 = v9;

  return v11;
}

uint64_t __53__SBHIconManager_listViewsToUpdateDuringColorPicking__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __53__SBHIconManager_listViewsToUpdateDuringColorPicking__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 listView];
  [v2 addObject:v3];
}

- (id)additionalIconViewsToUpdateDuringColorPicking
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v4 = [(SBHIconManager *)self _effectiveAppPredictionViewControllersForUniqueIdentifier];
  double v5 = [v4 objectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "bs_isAppearingOrAppeared"))
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          void v14[2] = __63__SBHIconManager_additionalIconViewsToUpdateDuringColorPicking__block_invoke;
          void v14[3] = &unk_1E6AAD830;
          id v15 = v3;
          [v10 enumerateDisplayedIconViewsUsingBlock:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v11 = [(SBHIconManager *)self floatingDockViewController];
  uint64_t v12 = [v11 libraryPodIconViewIfLoaded];
  if (v12) {
    [v3 addObject:v12];
  }

  return v3;
}

uint64_t __63__SBHIconManager_additionalIconViewsToUpdateDuringColorPicking__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateViewsToUpdateDuringColorPickingUsingListViewBlock:(id)a3 iconViewBlock:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  uint64_t v8 = [(SBHIconManager *)self currentRootIconList];
  if (v8)
  {
    v6[2](v6, v8);
    if (v7)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke;
      v39[3] = &unk_1E6AB3ED8;
      id v40 = v7;
      [v8 enumerateDisplayedIconViewsUsingBlock:v39];
    }
  }
  id v24 = v8;
  id v9 = [(SBHIconManager *)self dockListView];
  if (v9)
  {
    v6[2](v6, v9);
    if (v7)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_2;
      void v37[3] = &unk_1E6AB3ED8;
      id v38 = v7;
      [v9 enumerateDisplayedIconViewsUsingBlock:v37];
    }
  }
  id v10 = [(SBHIconManager *)self floatingDockViewController];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_3;
  v34[3] = &unk_1E6AB4820;
  id v11 = v6;
  double v35 = v11;
  id v12 = v7;
  id v36 = v12;
  [v10 enumerateIconListsUsingBlock:v34];
  id v13 = [(SBHIconManager *)self todayViewControllers];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_5;
  v31[3] = &unk_1E6AB4848;
  CGFloat v23 = v11;
  uint64_t v32 = v23;
  id v14 = v12;
  id v33 = v14;
  [v13 enumerateObjectsUsingBlock:v31];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = [(SBHIconManager *)self _effectiveAppPredictionViewControllersForUniqueIdentifier];
  long long v16 = [v15 objectEnumerator];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v21, "bs_isAppearingOrAppeared", v23))
        {
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          void v25[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_7;
          v25[3] = &unk_1E6AB3ED8;
          id v26 = v14;
          [v21 enumerateDisplayedIconViewsUsingBlock:v25];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }
    while (v18);
  }

  if (v14)
  {
    double v22 = [v10 libraryPodIconViewIfLoaded];
    if (v22) {
      (*((void (**)(id, void *))v14 + 2))(v14, v22);
    }
  }
}

uint64_t __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_4;
    v5[3] = &unk_1E6AB3ED8;
    id v6 = v4;
    [v3 enumerateDisplayedIconViewsUsingBlock:v5];
  }
}

uint64_t __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = [v3 listView];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (*(void *)(a1 + 40))
  {
    id v6 = [v3 listView];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_6;
    v7[3] = &unk_1E6AB3ED8;
    id v8 = *(id *)(a1 + 40);
    [v6 enumerateDisplayedIconViewsUsingBlock:v7];
  }
}

uint64_t __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__SBHIconManager_enumerateViewsToUpdateDuringColorPickingUsingListViewBlock_iconViewBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)persistedHomeScreenColorConfiguration
{
  id v3 = [(SBHIconManager *)self _fetchCurrentStyleConfiguration];
  if (!v3)
  {
    getPUIMutableStylePickerHomeScreenConfigurationClass();
    uint64_t v4 = objc_opt_new();
    double v5 = [(SBHomeScreenDefaults *)self->_homeScreenDefaults iconTintColor];

    if (v5)
    {
      id v6 = [(SBHomeScreenDefaults *)self->_homeScreenDefaults iconTintColor];
      [v4 setAccentColor:v6];

      [v4 setStyleType:3];
    }
    id v3 = (void *)[v4 copy];
  }
  uint64_t v7 = [(SBHIconManager *)self interfaceOrientation];
  id v8 = [[SBHDefaultIconListLayoutProvider alloc] initWithLayoutOptions:0];
  id v9 = [(SBHDefaultIconListLayoutProvider *)v8 layoutForIconLocation:@"SBIconLocationRoot"];
  [v9 iconImageInfo];
  double v11 = v10;
  double v13 = v12;
  [v9 iconImageInfo];
  double v42 = v14;
  double v15 = SBHIconListLayoutListIconSpacing(v9, v7);
  double v17 = v16;
  [v9 layoutInsetsForOrientation:v7];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v3 layoutInsets];
  BOOL v32 = v29 == v21 && v26 == v19 && v28 == v25 && v27 == v23;
  if (!v32
    || (([v3 iconSpacing], v34 == v15) ? (BOOL v35 = v33 == v17) : (BOOL v35 = 0),
        !v35
     || (([v3 iconSize], v37 == v11) ? (BOOL v38 = v36 == v13) : (BOOL v38 = 0),
         !v38 || ([v3 iconContinuousCornerRadius], (BSFloatEqualToFloat() & 1) == 0))))
  {
    long long v39 = (void *)[v3 mutableCopy];
    objc_msgSend(v39, "setIconSize:", v11, v13);
    [v39 setIconContinuousCornerRadius:v42];
    objc_msgSend(v39, "setLayoutInsets:", v19, v21, v23, v25);
    objc_msgSend(v39, "setIconSpacing:", v15, v17);
    uint64_t v40 = [v39 copy];

    id v3 = (void *)v40;
  }

  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(SBHIconManager *)self homeScreenSettings];

  if (v7 == v19)
  {
    if (![v6 isEqualToString:@"usesMinimumViableHomeScreen"])
    {
      if ([v6 isEqualToString:@"avocadoEnabled"])
      {
        [(SBHIconManager *)self relayout];
      }
      else if (![v6 isEqualToString:@"avocadoTodayPageEnabled"])
      {
        goto LABEL_24;
      }
    }
    [(SBHIconManager *)self tearDownAndResetRootIconLists];
  }
  else
  {
    id v8 = [(SBHIconManager *)self rootFolderSettings];

    if (v8 == v19)
    {
      double v15 = [(SBHIconManager *)self rootFolderSettings];
      if ([v6 isEqualToString:@"adjustableLayoutEnabled"])
      {
        int v16 = [v15 isAdjustableLayoutEnabled];
        double v17 = off_1E6AAB2C0;
        if (!v16) {
          double v17 = off_1E6AAB3B8;
        }
        double v18 = objc_msgSend(objc_alloc(*v17), "initWithLayoutOptions:", -[SBHIconManager listLayoutProviderLayoutOptions](self, "listLayoutProviderLayoutOptions"));
        [(SBHIconManager *)self setListLayoutProvider:v18];
      }
      else if ([v15 shouldRebuildLayoutOnChangesToValueForKey:v6] {
             && [v15 isAdjustableLayoutEnabled])
      }
      {
        [(SBHIconManager *)self tearDownAndResetRootIconLists];
      }
    }
    else
    {
      id v9 = [(SBHIconManager *)self badgeParallaxSettings];

      if (v9 == v19)
      {
        [(SBHIconManager *)self enumerateKnownIconViewsUsingBlock:&__block_literal_global_1069];
      }
      else
      {
        id v10 = [(SBHIconManager *)self widgetIntroductionSettings];

        if (v10 == v19)
        {
          if ([v6 isEqualToString:@"showWidgetIntroConvenienceControl"])
          {
            if ([(SBHIconManager *)self prototypeSettingShowWidgetIntroduction])
            {
              double v11 = [(SBHIconManager *)self homeScreenDefaults];
              [v11 setShouldAddDefaultWidgetsToHomeScreen:1];

              double v12 = [(SBHIconManager *)self homeScreenDefaults];
              [v12 setShouldShowWidgetIntroductionPopover:1];

              if (![(SBHIconManager *)self rootFolderContainsWidgets])
              {
                [(SBHIconManager *)self addDefaultFirstPageWidgetsToHomeScreen:1];
                [(SBHIconManager *)self addDefaultSecondPageWidgetsToHomeScreen:0];
              }
              double v13 = [(SBHIconManager *)self homeScreenDefaults];
              [v13 setShouldAddDefaultWidgetsToHomeScreen:0];

              double v14 = [(SBHIconManager *)self homeScreenDefaults];
              [v14 setShouldShowWidgetIntroductionPopover:0];
            }
            else
            {
              [(SBHIconManager *)self undoDefaultWidgets:0];
            }
          }
          else if ([v6 isEqualToString:@"showXLTVWidget"])
          {
            if ([(SBHIconManager *)self prototypeSettingShowExtraLargeTVWidget])
            {
              [(SBHIconManager *)self addDefaultSecondPageWidgetsToHomeScreen:1];
            }
            else
            {
              [(SBHIconManager *)self undoDefaultTVWidget];
            }
          }
        }
      }
    }
  }
LABEL_24:
}

uint64_t __46__SBHIconManager_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateParallaxSettings];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHIconManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHIconManager isEditing](self, "isEditing"), @"isEditing");
  id v6 = [(SBHIconManager *)self iconModel];
  id v7 = (id)[v4 appendObject:v6 withName:@"model"];

  id v8 = [(SBHIconManager *)self listLayoutProvider];
  id v9 = (id)[v4 appendObject:v8 withName:@"listLayoutProvider"];

  id v10 = [(SBHIconManager *)self rootViewController];
  id v11 = (id)[v4 appendObject:v10 withName:@"rootViewController"];

  id v12 = (id)[v4 appendObject:self->_touchedIconViews withName:@"touchedIconViews" skipIfNil:1];
  id v13 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconManager isIconDragging](self, "isIconDragging"), @"isIconDragging", 1);
  id v14 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconManager ownsIconModel](self, "ownsIconModel"), @"ownsIconModel", 0);
  if ([(NSCountedSet *)self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen count]) {
    id v15 = (id)[v4 appendObject:self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen withName:@"reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen"];
  }
  return v4;
}

- (id)succinctDescription
{
  id v2 = [(SBHIconManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)_setupStateCaptureHandleIfNeeded
{
  if (!self->_stateCaptureHandle)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    uint64_t v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = self->_stateCaptureHandle;
    self->_stateCaptureHandle = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

id __50__SBHIconManager__setupStateCaptureHandleIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _stateCaptureString];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_stateCaptureString
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  uint64_t v4 = [(SBHIconManager *)self rootFolder];
  objc_msgSend(v3, "bs_safeAddObject:", v4);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SBHIconManager *)self _libraryViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) categoriesRootFolder];
        objc_msgSend(v3, "bs_safeAddObject:", v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __37__SBHIconManager__stateCaptureString__block_invoke;
  void v14[3] = &unk_1E6AB4870;
  void v14[4] = self;
  id v11 = objc_msgSend(v3, "bs_map:", v14);
  id v12 = [v11 description];

  return v12;
}

uint64_t __37__SBHIconManager__stateCaptureString__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dumpRootFolderForStateCapture:a2];
}

- (id)_dumpRootFolderForStateCapture:(id)a3
{
  id v4 = a3;
  id v5 = [v4 badgeBehaviorProvider];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v5];
  [v6 setObject:v7 forKeyedSubscript:@"delegate"];

  uint64_t v8 = [NSNumber numberWithBool:v5 != 0];
  [v6 setObject:v8 forKeyedSubscript:@"delegate supports badge checking"];

  if (v5)
  {
    id v9 = objc_opt_new();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __49__SBHIconManager__dumpRootFolderForStateCapture___block_invoke;
    void v14[3] = &unk_1E6AB1900;
    void v14[4] = self;
    id v15 = v9;
    id v10 = v9;
    [v4 enumerateAllIconsWithOptions:1 usingBlock:v14];
    id v11 = (void *)[v10 copy];
    [v6 setObject:v11 forKeyedSubscript:@"icons supporting badges"];
  }
  id v12 = [v4 description];
  [v6 setObject:v12 forKeyedSubscript:@"description"];

  return v6;
}

void __49__SBHIconManager__dumpRootFolderForStateCapture___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isFolderIcon] & 1) == 0
    && ([v5 isWidgetIcon] & 1) == 0
    && ([v5 isWidgetStackIcon] & 1) == 0
    && [v5 isLeafIcon]
    && [*(id *)(a1 + 32) allowsBadgingForIcon:v5])
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v5 leafIdentifier];
    [v3 addObject:v4];
  }
}

- (void)updateIconViewAccessoryVisibility
{
  [(SBHIconManager *)self refreshAppPredictionBadges];
  id v3 = [(SBHIconManager *)self rootFolder];
  [v3 enumerateAllIconsWithOptions:1 usingBlock:&__block_literal_global_1122];
}

void __51__SBHIconManager_updateIconViewAccessoryVisibility__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isFolderIcon] & 1) == 0) {
    [v2 noteBadgeDidChange];
  }
}

- (void)resizeGestureHandler:(id)a3 didFinishWithGridSizeClass:(id)a4
{
  id v9 = a4;
  uint64_t v6 = [a3 iconView];
  uint64_t v7 = [v6 icon];
  id v8 = [v7 gridSizeClass];
  if ([v7 isWidgetIcon] && v8 != v9 && (objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0) {
    [(SBHIconManager *)self changeSizeOfWidgetIcon:v7 toSizeClass:v9 animated:0 completionHandler:0];
  }
  [(SBHIconManager *)self _removeReasonToNotResetEndEditingTimer:@"widget resize"];
}

- (id)resizeGestureHandler:(id)a3 intentForWidget:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 iconView];
  id v8 = [v7 icon];

  id v9 = [(SBHIconManager *)self _intentForWidget:v6 ofIcon:v8 creatingIfNecessary:1];

  return v9;
}

- (id)resizeGestureHandler:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 iconView];
  id v14 = [v13 location];
  id v15 = [(SBHIconManager *)self _customViewControllerForResizingIcon:v11 gridSizeClass:v10 dataSource:v12 location:v14];

  return v15;
}

- (id)iconSizeChangeAnimator:(id)a3 intentForWidget:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 iconView];
  id v8 = [v7 icon];

  id v9 = [(SBHIconManager *)self _intentForWidget:v6 ofIcon:v8 creatingIfNecessary:1];

  return v9;
}

- (id)iconSizeChangeAnimator:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 iconView];
  id v14 = [v13 location];
  id v15 = [(SBHIconManager *)self _customViewControllerForResizingIcon:v11 gridSizeClass:v10 dataSource:v12 location:v14];

  return v15;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SBHIconManager_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E6AACA90;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __63__SBHIconManager_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) appPrototectionSubjectMonitorSubscription];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 checkForInvalidWidgets];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setRootFolderController:(id)a3
{
}

- (SBHTodayViewControlling)overlayCoverSheetTodayViewController
{
  return self->_overlayCoverSheetTodayViewController;
}

- (BOOL)isOverlayTodayViewVisibilityTransitioning
{
  return self->_overlayTodayViewVisibilityTransitioning;
}

- (BOOL)isOverlayCoverSheetTodayViewVisible
{
  return self->_overlayCoverSheetTodayViewVisible;
}

- (BOOL)isMainDisplayLibraryViewVisibilityTransitioning
{
  return self->_mainDisplayLibraryViewVisibilityTransitioning;
}

- (BOOL)isDockPinnedForRotation
{
  return self->_dockPinnedForRotation;
}

- (void)setDockPinnedForRotation:(BOOL)a3
{
  self->_dockPinnedForRotation = a3;
}

- (BOOL)showsDoneButtonWhileEditing
{
  return self->_showsDoneButtonWhileEditing;
}

- (void)setShowsDoneButtonWhileEditing:(BOOL)a3
{
  self->_showsDoneButtonWhileEditing = a3;
}

- (BOOL)showsAddWidgetButtonWhileEditing
{
  return self->_showsAddWidgetButtonWhileEditing;
}

- (void)setShowsAddWidgetButtonWhileEditing:(BOOL)a3
{
  self->_showsAddWidgetButtonWhileEditing = a3;
}

- (SBHFeatureIntroductionManager)featureIntroductionManager
{
  return self->_featureIntroductionManager;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)listLayoutProviderLayoutOptions
{
  return self->_listLayoutProviderLayoutOptions;
}

- (BOOL)isAnimatingForUnscatter
{
  return self->_animatingForUnscatter;
}

- (void)setAnimatingForUnscatter:(BOOL)a3
{
  self->_animatingForUnscatter = a3;
}

- (CHSWidgetExtensionProvider)widgetExtensionProvider
{
  return self->_widgetExtensionProvider;
}

- (void)setAddWidgetSheetConfigurationManager:(id)a3
{
}

- (BOOL)isSidebarVisible
{
  return self->_sidebarVisible;
}

- (BOOL)isSidebarEffectivelyVisible
{
  return self->_sidebarEffectivelyVisible;
}

- (BOOL)isSidebarVisibilityGestureActive
{
  return self->_sidebarVisibilityGestureActive;
}

- (BOOL)showsBadgesInAppLibrary
{
  return self->_showsBadgesInAppLibrary;
}

- (BOOL)isUsageMonitoringEnabled
{
  return self->_usageMonitoringEnabled;
}

- (void)setUsageMonitor:(id)a3
{
}

- (APSubjectMonitorSubscription)appPrototectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPrototectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void)setAppPrototectionSubjectMonitorSubscription:(id)a3
{
}

- (NSArray)postResetPathIdentifiers
{
  return self->_postResetPathIdentifiers;
}

- (void)setPostResetPathIdentifiers:(id)a3
{
}

- (BOOL)needsRelayout
{
  return self->_needsRelayout;
}

- (void)setNeedsRelayout:(BOOL)a3
{
  self->_needsRelayout = a3;
}

- (SBFolder)closingFolder
{
  return self->_closingFolder;
}

- (void)setClosingFolder:(id)a3
{
}

- (BSEventQueue)transitionEventQueue
{
  return self->_transitionEventQueue;
}

- (SBWorkspaceInteractionContext)currentInteractionContext
{
  return self->_currentInteractionContext;
}

- (void)setCurrentInteractionContext:(id)a3
{
}

- (SBHHomeScreenSettings)homeScreenSettings
{
  return self->_homeScreenSettings;
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (NSString)precachedContentSizeCategory
{
  return self->_precachedContentSizeCategory;
}

- (void)setPrecachedContentSizeCategory:(id)a3
{
}

- (NSArray)trailingCustomViewControllers
{
  return self->_trailingCustomViewControllers;
}

- (NSArray)leadingCustomViewControllers
{
  return self->_leadingCustomViewControllers;
}

- (PUIStylePickerViewController)currentStylePickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentStylePickerViewController);
  return (PUIStylePickerViewController *)WeakRetained;
}

- (void)setCurrentStylePickerViewController:(id)a3
{
}

- (BOOL)isResettingRootIconLists
{
  return self->_resettingRootIconLists;
}

- (void)setResettingRootIconLists:(BOOL)a3
{
  self->_resettingRootIconLists = a3;
}

- (BOOL)canPresentOverscrollLibraryForPageTransition
{
  return self->_canPresentOverscrollLibraryForPageTransition;
}

- (void)setCanPresentOverscrollLibraryForPageTransition:(BOOL)a3
{
  self->_canPresentOverscrollLibraryForPageTransition = a3;
}

- (BOOL)canDismissOverscrollLibraryForPageTransition
{
  return self->_canDismissOverscrollLibraryForPageTransition;
}

- (void)setCanDismissOverscrollLibraryForPageTransition:(BOOL)a3
{
  self->_canDismissOverscrollLibraryForPageTransition = a3;
}

- (BSInvalidatable)editingAutosaveDisableAssertion
{
  return self->_editingAutosaveDisableAssertion;
}

- (void)setEditingAutosaveDisableAssertion:(id)a3
{
}

- (void)setCurrentConfiguringIconView:(id)a3
{
}

- (void)setCurrentPersonDetailInteraction:(id)a3
{
}

- (SBFParallaxSettings)badgeParallaxSettings
{
  return self->_badgeParallaxSettings;
}

- (ATXHomeScreenPageIconRanker)atxIconRanker
{
  return self->_atxIconRanker;
}

- (void)setAtxIconRanker:(id)a3
{
}

- (SBHWidgetIntroductionSettings)widgetIntroductionSettings
{
  return self->_widgetIntroductionSettings;
}

- (void)setDefaultFirstPageSuggestedWidgetIcons:(id)a3
{
}

- (void)setDefaultSecondPageSuggestedWidgetIcons:(id)a3
{
}

- (void)setShouldDisableUserInteractionForWidgetDiscoverability:(BOOL)a3
{
  self->_shouldDisableUserInteractionForWidgetDiscoverabilitdouble y = a3;
}

- (NSMutableArray)chuisOnboardingWidgetViewControllers
{
  return self->_chuisOnboardingWidgetViewControllers;
}

- (void)setChuisOnboardingWidgetViewControllers:(id)a3
{
}

- (void)setDismissingMenuForFolderPresentation:(BOOL)a3
{
  self->_dismissingMenuForFolderPresentation = a3;
}

- (SBHIconImageCacheRequestIdentifying)iconImageRecachingRequestCancellation
{
  return self->_iconImageRecachingRequestCancellation;
}

- (void)setIconImageRecachingRequestCancellation:(id)a3
{
}

- (SBHIconImageCacheRequestIdentifying)visibleIconImageRecachingRequestCancellation
{
  return self->_visibleIconImageRecachingRequestCancellation;
}

- (void)setVisibleIconImageRecachingRequestCancellation:(id)a3
{
}

- (SBHIconImageCacheRequestIdentifying)iconPrecachingCancellation
{
  return self->_iconPrecachingCancellation;
}

- (void)setIconPrecachingCancellation:(id)a3
{
}

- (BOOL)didChangeIconStyleWithColorPicker
{
  return self->_didChangeIconStyleWithColorPicker;
}

- (void)setDidChangeIconStyleWithColorPicker:(BOOL)a3
{
  self->_didChangeIconStyleWithColorPicker = a3;
}

- (NSTimer)visibleIconTintLimitedDelayedUpdateTimer
{
  return self->_visibleIconTintLimitedDelayedUpdateTimer;
}

- (void)setVisibleIconTintLimitedDelayedUpdateTimer:(id)a3
{
}

- (UITraitChangeRegistration)rootViewControllerUserInterfaceStyleObservation
{
  return self->_rootViewControllerUserInterfaceStyleObservation;
}

- (void)setRootViewControllerUserInterfaceStyleObservation:(id)a3
{
}

- (SBHIconStylePreviewManager)stylePreviewManager
{
  return self->_stylePreviewManager;
}

- (void)setStylePreviewManager:(id)a3
{
}

- (BOOL)shouldClearStylePreviewManagerAfterRootTraitChange
{
  return self->_shouldClearStylePreviewManagerAfterRootTraitChange;
}

- (void)setShouldClearStylePreviewManagerAfterRootTraitChange:(BOOL)a3
{
  self->_shouldClearStylePreviewManagerAfterRootTraitChange = a3;
}

- (BOOL)shouldSkipPrecachingDataAfterReloadIcons
{
  return self->_shouldSkipPrecachingDataAfterReloadIcons;
}

- (void)setShouldSkipPrecachingDataAfterReloadIcons:(BOOL)a3
{
  self->_shouldSkipPrecachingDataAfterReloadIcons = a3;
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (SBIconView)previewInteractingIconView
{
  return self->_previewInteractingIconView;
}

- (SBHWidgetMetricsProvider)widgetMetricsProvider
{
  return self->_widgetMetricsProvider;
}

- (SBHIconManagerWidgetMetricsDelegate)widgetMetricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetMetricsDelegate);
  return (SBHIconManagerWidgetMetricsDelegate *)WeakRetained;
}

- (void)setWidgetMetricsDelegate:(id)a3
{
}

- (NSArray)defaultFirstPageWidgetDescriptors
{
  return self->_defaultFirstPageWidgetDescriptors;
}

- (void)setDefaultFirstPageWidgetDescriptors:(id)a3
{
}

- (NSString)defaultFirstPageWidgetSizeClass
{
  return self->_defaultFirstPageWidgetSizeClass;
}

- (void)setDefaultFirstPageWidgetSizeClass:(id)a3
{
}

- (NSArray)defaultSecondPageWidgetDescriptors
{
  return self->_defaultSecondPageWidgetDescriptors;
}

- (void)setDefaultSecondPageWidgetDescriptors:(id)a3
{
}

- (NSString)defaultSecondPageWidgetSizeClass
{
  return self->_defaultSecondPageWidgetSizeClass;
}

- (void)setDefaultSecondPageWidgetSizeClass:(id)a3
{
}

- (BOOL)internalForceShowWidgetDiscoverability
{
  return self->_internalForceShowWidgetDiscoverability;
}

- (void)setInternalForceShowWidgetDiscoverability:(BOOL)a3
{
  self->_internalForceShowWidgetDiscoverabilitdouble y = a3;
}

- (unint64_t)gridCellInfoOptionsForInsertingDefaultWidgets
{
  return self->_gridCellInfoOptionsForInsertingDefaultWidgets;
}

- (void)setGridCellInfoOptionsForInsertingDefaultWidgets:(unint64_t)a3
{
  self->_gridCellInfoOptionsForInsertingDefaultWidgets = a3;
}

- (ATXDefaultWidgetSuggesterClient)proactiveWidgetSuggesterClient
{
  return self->_proactiveWidgetSuggesterClient;
}

- (void)setProactiveWidgetSuggesterClient:(id)a3
{
}

- (BOOL)disablesScrollingToLastIconPageForLibraryDismissal
{
  return self->_disablesScrollingToLastIconPageForLibraryDismissal;
}

- (void)setDisablesScrollingToLastIconPageForLibraryDismissal:(BOOL)a3
{
  self->_disablesScrollingToLastIconPageForLibraryDismissal = a3;
}

- (SBHWidgetIntroductionFeatureIntroductionItem)widgetIntroductionItem
{
  return self->_widgetIntroductionItem;
}

- (void)setWidgetIntroductionItem:(id)a3
{
}

- (void)setRecyclesIconViews:(BOOL)a3
{
  self->_recyclesIconViews = a3;
}

- (BOOL)ownsIconModel
{
  return self->_ownsIconModel;
}

- (void)setOwnsIconModel:(BOOL)a3
{
  self->_ownsIconModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIntroductionItem, 0);
  objc_storeStrong((id *)&self->_proactiveWidgetSuggesterClient, 0);
  objc_storeStrong((id *)&self->_defaultSecondPageWidgetSizeClass, 0);
  objc_storeStrong((id *)&self->_defaultSecondPageWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_defaultFirstPageWidgetSizeClass, 0);
  objc_storeStrong((id *)&self->_defaultFirstPageWidgetDescriptors, 0);
  objc_destroyWeak((id *)&self->_widgetMetricsDelegate);
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_previewInteractingIconView, 0);
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_stylePreviewManager, 0);
  objc_storeStrong((id *)&self->_rootViewControllerUserInterfaceStyleObservation, 0);
  objc_storeStrong((id *)&self->_visibleIconTintLimitedDelayedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_iconPrecachingCancellation, 0);
  objc_storeStrong((id *)&self->_visibleIconImageRecachingRequestCancellation, 0);
  objc_storeStrong((id *)&self->_iconImageRecachingRequestCancellation, 0);
  objc_storeStrong((id *)&self->_todayViewCancelTouchesScrollingAssertion, 0);
  objc_storeStrong((id *)&self->_chuisOnboardingWidgetViewControllers, 0);
  objc_storeStrong((id *)&self->_defaultSecondPageSuggestedWidgetIcons, 0);
  objc_storeStrong((id *)&self->_defaultFirstPageSuggestedWidgetIcons, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionSettings, 0);
  objc_storeStrong((id *)&self->_atxIconRanker, 0);
  objc_storeStrong((id *)&self->_badgeParallaxSettings, 0);
  objc_storeStrong((id *)&self->_currentPersonDetailInteraction, 0);
  objc_storeStrong((id *)&self->_currentConfiguringIconView, 0);
  objc_storeStrong((id *)&self->_editingAutosaveDisableAssertion, 0);
  objc_destroyWeak((id *)&self->_currentStylePickerViewController);
  objc_storeStrong((id *)&self->_leadingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_trailingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_precachedContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenSettings, 0);
  objc_storeStrong((id *)&self->_currentInteractionContext, 0);
  objc_storeStrong((id *)&self->_transitionEventQueue, 0);
  objc_storeStrong((id *)&self->_closingFolder, 0);
  objc_storeStrong((id *)&self->_postResetPathIdentifiers, 0);
  objc_storeStrong((id *)&self->_editingEndTimer, 0);
  objc_storeStrong((id *)&self->_highlightedIconView, 0);
  objc_destroyWeak((id *)&self->_appPrototectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_iconShareSheetManager, 0);
  objc_storeStrong((id *)&self->_iconDragManager, 0);
  objc_storeStrong((id *)&self->_currentTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetConfigurationManager, 0);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_iconToReveal, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_featureIntroductionManager, 0);
  objc_storeStrong((id *)&self->_focusModeManager, 0);
  objc_storeStrong((id *)&self->_overlayLibraryViewController, 0);
  objc_storeStrong((id *)&self->_overlayCoverSheetTodayViewController, 0);
  objc_storeStrong((id *)&self->_overlayTodayViewController, 0);
  objc_storeStrong((id *)&self->_floatingDockViewController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_rootFolderController, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proactivePageSuggestionsManager, 0);
  objc_storeStrong((id *)&self->_trailingCustomLibraryPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_additionalPrecachingIconImageCaches, 0);
  objc_storeStrong((id *)&self->_eyeDropperBarButtonItem, 0);
  objc_storeStrong((id *)&self->_dimBarButtonItem, 0);
  objc_storeStrong((id *)&self->_wallpaperDimButton, 0);
  objc_storeStrong((id *)&self->_eyeDropperControl, 0);
  objc_storeStrong((id *)&self->_eyeDropperColorSampler, 0);
  objc_storeStrong((id *)&self->_labelHidingView, 0);
  objc_storeStrong((id *)&self->_previousIconGridPathsBeforeResize, 0);
  objc_storeStrong((id *)&self->_previousWidgetDataSourceBeforeResize, 0);
  objc_storeStrong((id *)&self->_stashedLeafIconsForRelayout, 0);
  objc_storeStrong((id *)&self->_movedStackConfigDataSources, 0);
  objc_storeStrong((id *)&self->_partialEditingIconLocations, 0);
  objc_destroyWeak((id *)&self->_pendingFolderIconToOpen);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_editingActivity, 0);
  objc_storeStrong((id *)&self->_reasonsToIgnoreUserPreferenceForAddingNewIconsToHomeScreen, 0);
  objc_storeStrong((id *)&self->_performAfterPendingWidgetIntentConfigurationBlocks, 0);
  objc_storeStrong((id *)&self->_activeWidgetIntentConfigurationInitializations, 0);
  objc_storeStrong((id *)&self->_pendingWidgetIntentConfigurationInitializations, 0);
  objc_storeStrong((id *)&self->_archivedWidgetIntents, 0);
  objc_storeStrong((id *)&self->_widgetIntents, 0);
  objc_storeStrong((id *)&self->_appPredictionViewControllersForUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_iconViewsForWidgetMultiplexingViewController, 0);
  objc_storeStrong((id *)&self->_iconViewsForCustomIconImageViewController, 0);
  objc_storeStrong((id *)&self->_widgetViewControllersForIconView, 0);
  objc_storeStrong((id *)&self->_aliveWidgetViewControllersHashTable, 0);
  objc_storeStrong((id *)&self->_widgetMultiplexingManagersForLayoutOptions, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_previousIconLocations, 0);
  objc_storeStrong((id *)&self->_previousIconLocationTracker, 0);
  objc_storeStrong((id *)&self->_currentCollapseCompletions, 0);
  objc_storeStrong((id *)&self->_currentExpandCompletions, 0);
  objc_storeStrong((id *)&self->_folderPresentationObservers, 0);
  objc_storeStrong((id *)&self->_pageStateObservers, 0);
  objc_storeStrong((id *)&self->_reasonsToNotRestartEditingTimer, 0);
  objc_storeStrong((id *)&self->_iconTouchesFinishedBlocks, 0);
  objc_storeStrong((id *)&self->_touchedIconViews, 0);
  objc_storeStrong((id *)&self->_iconEditingFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_labelImageCache, 0);
  objc_storeStrong((id *)&self->_widgetBackgroundViewMap, 0);
  objc_storeStrong((id *)&self->_homescreenIconImageViewMap, 0);
  objc_storeStrong((id *)&self->_homescreenIconLabelAccessoryViewMap, 0);
  objc_storeStrong((id *)&self->_homescreenIconAccessoryViewMap, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

- (void)relayout
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D7F0A000, v0, v1, "SBIconModel: delaying relayout because folder is animating or icon is dropping", v2, v3, v4, v5, v6);
}

- (void)uninstallIcon:animate:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D7F0A000, v0, v1, "No icon given to uninstallIcon:animate:completion:", v2, v3, v4, v5, v6);
}

- (void)addIconToIgnoredList:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D7F0A000, v0, v1, "No icon given to addIconToIgnoredList:options:completion:", v2, v3, v4, v5, v6);
}

- (void)removeIcon:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D7F0A000, v0, v1, "No icon given to removeIcon:options:completion:", v2, v3, v4, v5, v6);
}

- (void)removeIcon:options:completion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D7F0A000, v0, v1, "Icon given to removeIcon:options:completion: not found in root folder", v2, v3, v4, v5, v6);
}

- (void)folderIconImageCache
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "Creating new SBFolderIconImageCache: %p", (uint8_t *)&v3, 0xCu);
}

- (void)replaceWidgetIconWithAppIcon:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1D7F0A000, v1, OS_LOG_TYPE_ERROR, "Unable to replace widget icon with app icon. Something is nil. existingAppIcon:%@ existingAppiconIndexPath:%@ matchingIcon:%@", v2, 0x20u);
}

void __86__SBHIconManager__loadAndSaveDefaultIntentIfNecessaryForWidget_ofIcon_viewController___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v4, 0x16u);
}

- (void)_newIntentForDataSource:(void *)a1 inIcon:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 applicationBundleID];
  uint64_t v5 = [a1 activeDataSource];
  __int16 v6 = SBHConfigurationIdentifierFromDataSource(v5);
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v4;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_debug_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_DEBUG, "Replacing widget icon's intent configuration data with default intent because the archived intent could not be found: %{public}@, bundleID=%{public}@,  dataSourceStorageIdentifier: %{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)_archivedIntentForDataSource:inIcon:loadingIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0(&dword_1D7F0A000, v0, v1, "Error unarchiving INIntent for data source %{public}@: %{public}@");
}

- (void)_archivedIntentForDataSource:inIcon:loadingIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_FAULT, "Archived widget intent data not found because there was no delegate for the SBHIconManager.", v1, 2u);
}

- (void)widgetHostViewController:requestsLaunch:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "No containing bundle record found for extension with identifier '%@'", v2, v3, v4, v5, v6);
}

- (void)widgetHostViewController:requestsLaunch:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "No record found for extension with identifier '%@': %@");
}

- (void)multiplexingManager:shouldCacheRecentViewController:forIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Forcing %{public}@ to end appearance transition to disappeared", v2, v3, v4, v5, v6);
}

- (void)widgetStackViewController:(uint64_t)a1 didActivateDataSource:(void *)a2 fromUserInteraction:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 uniqueIdentifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_error_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_ERROR, "Trying to active data source due to user scroll but the data source is unknown! %@ for: %@", (uint8_t *)&v6, 0x16u);
}

- (void)customImageViewControllerForIconView:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  __int16 v9 = v5;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"SBHIconManager.m";
  __int16 v16 = 1024;
  int v17 = 8173;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)iconView:configurationInteractionForDataSource:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "Can't create SBHWidgetConfigurationInteraction because missing widgetDescriptor (%@) or widgetIntent (%@)");
}

- (void)iconView:configurationInteractionForDataSource:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Can't create a CHSWidgetDescriptor because missing actionable dataSource (%@)", v2, v3, v4, v5, v6);
}

- (void)_archiveConfiguration:forDataSource:ofIcon:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0(&dword_1D7F0A000, v0, v1, "Error archiving configuration for icon %{public}@ -- error: %{public}@");
}

- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:inRootFolder:focusModeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "Can't replace %@ with %@ because no icons for the latter exist. we need the placeholder at least.");
}

- (void)swapApplicationIconsInProminentPositionsWithBundleIdentifier:withApplicationIconsWithWithBundleIdentifier:inRootFolder:focusModeIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D7F0A000, v0, v1, "Don't need to replace %@ with %@ because it already exists in a prominent location.");
}

@end