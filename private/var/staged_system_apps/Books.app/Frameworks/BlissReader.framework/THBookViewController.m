@interface THBookViewController
+ (BOOL)allBodiesExist:(id)a3;
+ (id)themeMap;
+ (void)initialize;
- (AEAsset)asset;
- (AEAssetOpenAnimating)contentOpenAnimator;
- (AEAssetViewControllerDelegate)assetViewControllerDelegate;
- (BCDisplayOnlyNavigationBar)titleLabelNavigationBar;
- (BCUIHoverInteraction)hoverInteraction;
- (BKLocation)openingLocationOverride;
- (BOOL)_canSearch;
- (BOOL)_canShowGlossaryOrStudyCards;
- (BOOL)_inAnalyticsReadSession;
- (BOOL)_isShowingContent;
- (BOOL)allowCopy;
- (BOOL)aspectFitDuringLiveResize;
- (BOOL)autoNightModeEnabled:(id)a3;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)bc_analyticsVisibilityOfSelf;
- (BOOL)bookIsPaginatedForLandscape;
- (BOOL)bookIsPaginatedForPortrait;
- (BOOL)bookLoadedSuccessfully;
- (BOOL)bookOpenDestinationIsTOC;
- (BOOL)bookOpenFailed;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canDecreaseFontSize;
- (BOOL)canIncreaseFontSize;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canRevealTOC;
- (BOOL)canTrustCalculatedPageNumbers;
- (BOOL)chapterBrowserController:(id)a3 isCurrentlyDisplayedPageForRelativePageIndex:(unint64_t)a4 andChapterIndex:(unint64_t)a5;
- (BOOL)chapterBrowserController:(id)a3 navigateToLinkInDVC:(id)a4;
- (BOOL)chapterBrowserController:(id)a3 shouldShowShroudForVisibleSize:(CGSize)a4;
- (BOOL)disableRotationEdgeClip;
- (BOOL)disallowRotate;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)flowModeEnabled:(id)a3;
- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4;
- (BOOL)followLink:(id)a3;
- (BOOL)followLink:(id)a3 animated:(BOOL)a4;
- (BOOL)hasThumbnailImageForAbsolutePageIndex:(unint64_t)a3;
- (BOOL)isAnnotationWriteEnabled;
- (BOOL)isBookEpub;
- (BOOL)isBookPortraitOnly;
- (BOOL)isBookmarkApplicable;
- (BOOL)isCompleteBook;
- (BOOL)isCurrentPageBookmarkedForBookmarkMenuPopoverViewController:(id)a3;
- (BOOL)isGlossaryPresenting;
- (BOOL)isGlossaryVisible;
- (BOOL)isLastPageInChapterForChapterBrowserController:(id)a3 pageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5;
- (BOOL)isNotesFullscreenVisible;
- (BOOL)isPageBookmarked;
- (BOOL)isPageBookmarkedForDocumentViewController:(id)a3;
- (BOOL)isScrubberDisabled;
- (BOOL)isSinglePageInChapterForChapterBrowserController:(id)a3 chapterIndex:(unint64_t)a4;
- (BOOL)isStudyViewControllerVisible;
- (BOOL)isTOCButtonApplicable;
- (BOOL)isTOCVisible;
- (BOOL)isToolbarHidden;
- (BOOL)isTwoUpForChapterBrowserController:(id)a3;
- (BOOL)jumpToPageLocation:(id)a3 touchHistory:(BOOL)a4 minor:(BOOL)a5;
- (BOOL)navigateToAnchorInDVC:(id)a3;
- (BOOL)navigateToAnchorInDVC:(id)a3 pulse:(BOOL)a4;
- (BOOL)navigateToLinkInDVC:(id)a3;
- (BOOL)navigationBarIsTranslucent:(id)a3;
- (BOOL)openAnimationDidFinish;
- (BOOL)p_hasDestinationPage;
- (BOOL)p_introMediaIsUnseenAndSeeable;
- (BOOL)p_isPageLocationApplicable;
- (BOOL)p_isPageLocationValid:(id)a3;
- (BOOL)p_isPreorderBook;
- (BOOL)p_isSampleBook;
- (BOOL)p_isSearchVisible;
- (BOOL)p_isTOCViewController:(id)a3;
- (BOOL)p_jumpToBKCFIString:(id)a3;
- (BOOL)p_jumpToFragment:(id)a3;
- (BOOL)p_jumpToLocation:(id)a3;
- (BOOL)p_restoreToLaunchPage;
- (BOOL)p_shouldAlertAboutRetinaUpdate;
- (BOOL)p_shouldSendVantageChangedNotificationWithReason:(id)a3;
- (BOOL)p_shouldShowAppearanceImage;
- (BOOL)p_shouldShowShroudForVisibleSize:(CGSize)a3;
- (BOOL)p_showBuyButton;
- (BOOL)p_wantsToOpenToTOC;
- (BOOL)paginationInProgress;
- (BOOL)performanceModeBookOpening;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)presentingGlossary;
- (BOOL)readingStatisticsCollector:(id)a3 needTOCEntriesForOrdinal:(int64_t)a4;
- (BOOL)readingStatisticsCollector:(id)a3 needTextNodeCharacterCountsForOrdinal:(int64_t)a4;
- (BOOL)readingStatisticsControllerLoaded;
- (BOOL)settingToolbarHidden;
- (BOOL)setupLoadSpinner;
- (BOOL)shouldAllowToolbarHover;
- (BOOL)shouldAutohideNavigationBar;
- (BOOL)shouldAutorotate;
- (BOOL)shouldKeepTOCInBackground:(id)a3;
- (BOOL)shouldShowChapterTitle;
- (BOOL)shouldShowFlowModeSwitch:(id)a3;
- (BOOL)shouldShowFontResizeControls:(id)a3;
- (BOOL)smartInvertEnabled;
- (BOOL)snapshotDuringLiveResize;
- (BOOL)startedScanningReadingStatistics;
- (BOOL)toolbarEnabledViaHover;
- (BOOL)transitioningTOCSize;
- (BOOL)useWhiteTheme;
- (CGImage)thumbnailImageForAbsolutePageIndex:(unint64_t)a3;
- (CGRect)chapterBrowserController:(id)a3 rectForRelativePageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5;
- (CGRect)chapterBrowserController:(id)a3 targetRelativeRectForPoint:(CGPoint)a4 atPageIndex:(unint64_t)a5 chapterIndex:(unint64_t)a6;
- (CGRect)chapterBrowserController:(id)a3 targetRelativeRectForRelativePoint:(CGPoint)a4 atPageIndex:(unint64_t)a5 chapterIndex:(unint64_t)a6;
- (CGRect)frameForHUDFromVendor:(id)a3;
- (CGRect)p_navigationOverlayFrame;
- (CGRect)pageTargetRectForRevealingTOC;
- (NSDate)analyticsReadStartDate;
- (NSNumber)analyticsReadStartProgress;
- (NSNumber)readingProgressHighwaterMark;
- (NSObject)bookPositionProcessor;
- (NSString)openingCFIOverride;
- (NSString)openingFragmentOverride;
- (THBookDescription)bookDescription;
- (THBookLinkResolver)bookLinkResolver;
- (THBookViewController)initWithBookDescription:(id)a3;
- (THBookmarkMenuPopoverViewController)bookmarkViewController;
- (THBookspotHistoryStack)bookspotHistoryStack;
- (THChapterBrowserController)chapterBrowserController;
- (THDisplaySettingsViewController)displaySettingsViewController;
- (THDocumentNavigationModel)navigationModel;
- (THDocumentNavigator)documentNavigator;
- (THDocumentViewController)documentViewController;
- (THFlowTOCViewController)flowTocViewController;
- (THGlossaryViewController)glossaryViewController;
- (THHUDVending)HUDVendor;
- (THNavigationBarController)navigationBarController;
- (THNavigationHistoryStepperController)navigationHistoryStepperController;
- (THNavigationOverlayView)navigationOverlayView;
- (THNotesViewController)notesFullscreenViewController;
- (THReadingStatisticsCollector)readingStatisticsCollector;
- (THSearchViewController)searchViewController;
- (THTOCGlossaryMenuPopoverViewController)TOCGlossaryViewController;
- (THTheme)theme;
- (THWFreeTransformController)canvasExitFreeTransformController;
- (THiOSDocument)document;
- (THiOSFlowToCTableViewController)flowToCTableViewController;
- (THiOSIntroMediaViewController)introMediaViewController;
- (THiOSStudyViewController)studyViewController;
- (UIAlertController)fontDownloadAlertController;
- (UIBarButtonItem)appearanceButtonItem;
- (UIBarButtonItem)bookmarkButtonItem;
- (UIBarButtonItem)brightnessButtonItem;
- (UIBarButtonItem)buyButtonItem;
- (UIBarButtonItem)closeButtonItem;
- (UIBarButtonItem)closeTOCButtonItem;
- (UIBarButtonItem)notesButtonItem;
- (UIBarButtonItem)searchButtonItem;
- (UIBarButtonItem)shareButtonItem;
- (UIBarButtonItem)tocGlossaryButtonItem;
- (UIButton)actionlessBookmarkButton;
- (UIButton)bookmarkButton;
- (UIColor)viewBackgroundColor;
- (UILabel)titleLabel;
- (UIView)HUDOverlayView;
- (UIViewController)activityViewController;
- (UIViewController)visibleViewController;
- (double)bottomBarHeight;
- (double)toolbarHeight;
- (double)topBarHeight;
- (id)TOCViewControllerToolbarBackgroundColor:(id)a3;
- (id)_analyticsContentSettingsData;
- (id)_analyticsReadingProgress;
- (id)_analyticsReadingSettingsData;
- (id)_analyticsSessionHost;
- (id)_currentLocation;
- (id)_storageAnchorForPageBookmark;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)activityItemProviderWithCachedAnnotation:(id)a3;
- (id)activityItemProviderWithCachedAnnotations:(id)a3;
- (id)anchorFromLink:(id)a3;
- (id)annotationID;
- (id)assetViewControllerViewForLiveResizeSnapshot;
- (id)backgroundColorForNavigationBar:(id)a3;
- (id)bookmarkFetchedResultsController;
- (id)cachedAnnotationForFetchedObject:(id)a3;
- (id)canvasScrollViewForChapterBrowserController:(id)a3;
- (id)chapterBrowserController:(id)a3 pageNumberStringForRelativePageIndex:(unint64_t)a4 andChapterIndex:(unint64_t)a5;
- (id)chapterBrowserController:(id)a3 tocTileModelAtIndex:(unint64_t)a4;
- (id)childViewControllerForStatusBarHidden;
- (id)contentData;
- (id)contentSubType;
- (id)createButtonItemConfigurationWithImageName:(id)a3 forSelector:(SEL)a4;
- (id)currentPageInfoForBookmarks;
- (id)currentPresentationType;
- (id)documentRoot;
- (id)documentViewControllerWithDocument:(id)a3;
- (id)foregroundTintColorForNavigationBar:(id)a3;
- (id)htmlGeneratorWithAnnotations:(id)a3;
- (id)keyCommands;
- (id)leftToolbarItems:(BOOL)a3;
- (id)navigationUnitForChapterBrowserController:(id)a3 chapterIndex:(unint64_t)a4;
- (id)overlayViewColorForLiveResize;
- (id)p_THCFIReaderStringFromBKCFIString:(id)a3;
- (id)p_popoverPassthroughViews;
- (id)p_retinaUpdateAlertAttemptsKey;
- (id)p_retinaUpdateAlertDateKey;
- (id)p_selectedTocViewController;
- (id)p_selectedTocViewControllerCreateIfNecessary:(BOOL)a3;
- (id)p_unselectedTocViewController;
- (id)pageNumberStringForAnnotation:(id)a3;
- (id)pageNumberStringForLocation:(id)a3;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (id)presentationTypeForChapterBrowserController:(id)a3;
- (id)readingSessionData;
- (id)rightToolbarItems:(BOOL)a3;
- (id)sectionNumberStringForLocation:(id)a3;
- (id)sectionTitleStringForLocation:(id)a3;
- (id)snapshotBlock;
- (id)storageForCFI:(id)a3;
- (id)storeURLForHTMLGenerator:(id)a3;
- (id)studyViewController:(id)a3 pageNumberStringForAnnotation:(id)a4;
- (id)studyViewController:(id)a3 storageForCFI:(id)a4;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)tellAFriendBaseURLForHTMLGenerator:(id)a3;
- (id)themeForStyle:(int64_t)a3;
- (id)titleColorForNavigationBar:(id)a3;
- (id)transitionContentBackgroundColor;
- (id)transitionContentView;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)appearanceStyle;
- (int64_t)doNotDisturbStatusAtStart;
- (int64_t)lastAnalyticsDeviceOrientationReported;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)pageNumberForAnnotation:(id)a3;
- (int64_t)positionForBar:(id)a3;
- (int64_t)readerType;
- (int64_t)studyViewController:(id)a3 pageNumberForAnnotation:(id)a4;
- (int64_t)styleBeforeAutoNight;
- (unint64_t)absolutePageIndexForCFI:(id)a3;
- (unint64_t)absolutePageIndexForTileEntry:(id)a3;
- (unint64_t)chapterBrowserController:(id)a3 relativePageIndexForLink:(id)a4;
- (unint64_t)chapterCountForChapterBrowserController:(id)a3;
- (unint64_t)currentAbsolutePageIndex;
- (unint64_t)currentAbsolutePageIndexForBookmarks;
- (unint64_t)maxAbsolutePageIndexForNodeAtTileEntry:(id)a3;
- (unint64_t)openingAbsolutePageIndexOverride;
- (void)TOCHideToolbarAnimated:(BOOL)a3;
- (void)TOCShowToolbarAnimated:(BOOL)a3;
- (void)TOCViewControllerDidShowIntroMedia:(id)a3;
- (void)_accessibilityInvertColorsStatusDidChange:(id)a3;
- (void)_adjustSizeIncreasing:(BOOL)a3;
- (void)_checkIfScanningReadingStatisticsCanBegin;
- (void)_disableAutoNightMode;
- (void)_enableAutoNightMode;
- (void)_teardown;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateAppearanceFromLightLevelController:(id)a3;
- (void)_updateCloseButtonItem;
- (void)addRemoveBookmarkCurrentPage;
- (void)appearanceViewController:(id)a3 brightnessLevelDidChange:(float)a4;
- (void)applyAppearanceStyle:(int64_t)a3;
- (void)assetViewControllerDidOpenAnimated:(BOOL)a3;
- (void)assetViewControllerPrepareForReload;
- (void)assetViewControllerReadyToAnswerReadingStatisticsQueries;
- (void)assetViewControllerUpdateToolbars;
- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityWillDisappear;
- (void)bookOpenTransitionDidEnd;
- (void)bookView:(id)a3 didMoveToWindow:(id)a4;
- (void)books_decreaseSize:(id)a3;
- (void)books_find:(id)a3;
- (void)books_increaseSize:(id)a3;
- (void)books_setThemeGray:(id)a3;
- (void)books_setThemeNight:(id)a3;
- (void)books_setThemeSepia:(id)a3;
- (void)books_setThemeWhite:(id)a3;
- (void)books_toggleBookmark:(id)a3;
- (void)buildHoverRegions;
- (void)cancelPreloadOfContentNodes;
- (void)cancelPreloadOfContentNodesForChapterBrowserController:(id)a3;
- (void)chapterBrowserController:(id)a3 cancelledTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5;
- (void)chapterBrowserController:(id)a3 didTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 relativeTargetRect:(CGRect)a6;
- (void)chapterBrowserController:(id)a3 preloadContentNodesForPageRange:(_NSRange)a4 chapterIndex:(unint64_t)a5;
- (void)chapterBrowserController:(id)a3 updateTitleForChapterIndex:(unint64_t)a4;
- (void)chapterBrowserController:(id)a3 willTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 freeTransform:(BOOL)a6;
- (void)close:(BOOL)a3;
- (void)closeDocument;
- (void)closeDocumentWithErrorBlock:(id)a3;
- (void)closeDocumentWithReadLock:(id)a3;
- (void)closeTOC;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5;
- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4;
- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4;
- (void)dealloc;
- (void)decreaseFontSize:(id)a3;
- (void)denyBookmarkEdit;
- (void)didJumpToPageLocation:(id)a3;
- (void)didLoadBook:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didRevealTOC;
- (void)didSetNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)didTransitionFromViewController:(id)a3 toTOCViewController:(id)a4;
- (void)dismissActivePopover;
- (void)dismissActivePopoverIsTransitioning:(BOOL)a3;
- (void)dismissBookmarkMenu:(BOOL)a3 completion:(id)a4;
- (void)dismissDisplaySettings:(BOOL)a3;
- (void)dismissSearchPopover:(BOOL)a3 completion:(id)a4;
- (void)dismissSharePopover:(BOOL)a3;
- (void)dismissTOCGlossaryView:(BOOL)a3;
- (void)displaySettingsController:(id)a3 didChangeAutoNightMode:(BOOL)a4;
- (void)displaySettingsController:(id)a3 didChangeStyle:(int64_t)a4;
- (void)displaySettingsControllerDidChangeFlowMode:(id)a3;
- (void)displaySettingsControllerDidChangeFlowMode:(id)a3 notifyingCoordinator:(BOOL)a4;
- (void)displaySettingsControllerDidChangeFontSize:(id)a3 toFlowSizeScale:(unint64_t)a4;
- (void)documentViewController:(id)a3 bodyReps:(id)a4 visibleRectIs:(CGRect)a5;
- (void)documentViewController:(id)a3 didChangePaginationStatus:(BOOL)a4;
- (void)emitReadingOrientationChangeEventIfNeeded;
- (void)endRevealTOC;
- (void)followAbsolutePageIndex:(unint64_t)a3;
- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 animated:(BOOL)a5 force:(BOOL)a6 completion:(id)a7;
- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 completion:(id)a5;
- (void)hideGlossaryWithDestinationViewController:(id)a3;
- (void)hideGlossaryWithDestinationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)hideHUDForVendor:(id)a3;
- (void)hideLoadSpinner;
- (void)hideNavigationHistory;
- (void)hideTOC;
- (void)hideToolbarAnimated:(BOOL)a3;
- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4;
- (void)hoverInteractionDidSettle:(id)a3;
- (void)increaseFontSize:(id)a3;
- (void)introMediaControllerMoviePlayerWillHideControls;
- (void)introMediaControllerMoviePlayerWillShowControls;
- (void)loadMetadata;
- (void)loadStudyViewControllerForAnimation:(BOOL)a3;
- (void)loadView;
- (void)navigateFromNotesViewToAnchorInDVC:(id)a3 completion:(id)a4;
- (void)navigateToSearchResult:(id)a3;
- (void)open:(BOOL)a3;
- (void)openToLocation:(id)a3 animated:(BOOL)a4;
- (void)pAutoHideNavOverlay;
- (void)p_TOCGlossaryPopoverDidHide;
- (void)p_addViewControllerInBack:(id)a3;
- (void)p_addViewControllerInBack:(id)a3 animated:(BOOL)a4;
- (void)p_addViewControllerInFront:(id)a3 reason:(id)a4;
- (void)p_alertUserAboutAnnotationBehavior;
- (void)p_alertUserAboutDenyingBookmarkEditing;
- (void)p_alertUserAboutFontDownload;
- (void)p_alertUserAboutRetinaUpdate;
- (void)p_bookContentDidLoad;
- (void)p_bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4;
- (void)p_bookViewDidRotateTransitionToSize:(CGSize)a3 withContext:(id)a4;
- (void)p_bookViewDidTransitionToSize:(CGSize)a3 withContext:(id)a4;
- (void)p_bookViewWillAnimateRotationToSize:(CGSize)a3 withContext:(id)a4;
- (void)p_bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)p_bookViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)p_bookmarkPopoverDidHide;
- (void)p_buildIntroMediaViewController;
- (void)p_cancelBookOpen;
- (void)p_cleanupAfterViewUnload;
- (void)p_clearNotesFullscreenViewController;
- (void)p_closeBookAndGoToStoreForRetinaUpdate;
- (void)p_closeBookAndGoToStorePageForBook;
- (void)p_dismissBookmarkMenu;
- (void)p_displaySettingsDidHide;
- (void)p_ensureGlossaryViewController;
- (void)p_finishBookLoad;
- (void)p_finishBookLoadIfReady;
- (void)p_hideHUDView;
- (void)p_insertDVCInBack;
- (void)p_insertDVCInBackAnimated:(BOOL)a3;
- (void)p_kickOffIntroMediaIfNecessary;
- (void)p_loadNavigationOverlay;
- (void)p_loadTitleLabel;
- (void)p_loadToolbar;
- (void)p_navigationHistoryDidChange:(id)a3;
- (void)p_openBook;
- (void)p_placeholderLocationDidChange;
- (void)p_postponeAlertForRetinaUpdate;
- (void)p_removeViewController:(id)a3;
- (void)p_savePlaceholder;
- (void)p_searchDidHide;
- (void)p_setCenterTitleForNavigationUnit:(id)a3;
- (void)p_setCenterTitleForTOC;
- (void)p_setCenterTitleToBookTitle;
- (void)p_setNavigationOverlayHidden:(BOOL)a3 animated:(BOOL)a4 autoHides:(BOOL)a5;
- (void)p_setVisibleViewControllerToViewController:(id)a3 reason:(id)a4;
- (void)p_setupCanvasExitTransformController;
- (void)p_setupDisplaySettingsIfNeeded;
- (void)p_shareDidHide;
- (void)p_showBookmarkMenu;
- (void)p_showDVC;
- (void)p_showDVCAnimated:(BOOL)a3 withLink:(id)a4;
- (void)p_showGlossary;
- (void)p_syncActionlessBookmarkToolbarButtonFrame;
- (void)p_unloadGlossaryViewControllerIfHiding;
- (void)p_unloadStudyViewController;
- (void)p_updateCanvasWithPendingPageIndexPath;
- (void)p_updateCenterTitle;
- (void)p_updateFromTheme:(BOOL)a3;
- (void)p_updateTOCForPresentationModeChange;
- (void)p_updateTOCForUpcomingPresentationModeChange;
- (void)p_updateTitleLabelToolbarVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)p_updateToolbarButtonStates;
- (void)p_updateToolbarButtonStatesWithTraits:(id)a3;
- (void)paginationDidComplete;
- (void)preloadContentNodesForPageRange:(_NSRange)a3 chapterIndex:(unint64_t)a4;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)putTOCInBack;
- (void)readingStatisticsCollector:(id)a3 addTOCEntries:(id)a4 ordinal:(int64_t)a5 completion:(id)a6;
- (void)readingStatisticsCollector:(id)a3 addTextNodeCharacterCounts:(id)a4 ordinal:(int64_t)a5 completion:(id)a6;
- (void)readingStatisticsCollector:(id)a3 didShowContentWithCFIs:(id)a4;
- (void)readingStatisticsCollector:(id)a3 willHideContentWithCFIs:(id)a4;
- (void)recordCurrentLocationInHistory;
- (void)recordOutgoingMajorNavigationJump;
- (void)removeBookmark:(id)a3;
- (void)removeTOC;
- (void)requestClose:(BOOL)a3;
- (void)revealTOCAnimated:(BOOL)a3 duration:(double)a4;
- (void)revealTOCByAmount:(double)a3;
- (void)runPreloadOptimizations;
- (void)saveStateClosing:(BOOL)a3;
- (void)searchFinished:(BOOL)a3 completion:(id)a4;
- (void)setActionlessBookmarkButton:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAnalyticsReadStartDate:(id)a3;
- (void)setAnalyticsReadStartProgress:(id)a3;
- (void)setAppearanceButtonItem:(id)a3;
- (void)setAppearanceStyle:(int64_t)a3;
- (void)setApplicationToolbarHiddenFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5;
- (void)setAssetViewControllerDelegate:(id)a3;
- (void)setBookDescription:(id)a3;
- (void)setBookLinkResolver:(id)a3;
- (void)setBookLoadedSuccessfully:(BOOL)a3;
- (void)setBookOpenDestinationIsTOC:(BOOL)a3;
- (void)setBookOpenFailed:(BOOL)a3;
- (void)setBookPositionProcessor:(id)a3;
- (void)setBookmarkButton:(id)a3;
- (void)setBookmarkButtonItem:(id)a3;
- (void)setBookmarkViewController:(id)a3;
- (void)setBrightnessButtonItem:(id)a3;
- (void)setCenterTitle:(id)a3;
- (void)setCenterTitleForCurrentNavigationUnit;
- (void)setChapterBrowserController:(id)a3;
- (void)setCloseButtonItem:(id)a3;
- (void)setCloseTOCButtonItem:(id)a3;
- (void)setContentOpenAnimator:(id)a3;
- (void)setCurrentPageBookmarked:(BOOL)a3 forBookmarkMenuPopoverViewController:(id)a4;
- (void)setDisallowRotate:(BOOL)a3;
- (void)setDisplaySettingsViewController:(id)a3;
- (void)setDoNotDisturbStatusAtStart:(int64_t)a3;
- (void)setDocumentViewController:(id)a3;
- (void)setFlowToCTableViewController:(id)a3;
- (void)setFlowTocViewController:(id)a3;
- (void)setFontDownloadAlertController:(id)a3;
- (void)setHUDOverlayView:(id)a3;
- (void)setHUDVendor:(id)a3;
- (void)setHoverInteraction:(id)a3;
- (void)setIntroMediaViewController:(id)a3;
- (void)setLastAnalyticsDeviceOrientationReported:(int64_t)a3;
- (void)setNavigationBarController:(id)a3;
- (void)setNavigationHistoryStepperController:(id)a3;
- (void)setNavigationOverlayView:(id)a3;
- (void)setNotesButtonItem:(id)a3;
- (void)setNotesFullscreenViewController:(id)a3;
- (void)setOpeningAbsolutePageIndexOverride:(unint64_t)a3;
- (void)setOpeningCFIOverride:(id)a3;
- (void)setOpeningFragmentOverride:(id)a3;
- (void)setOpeningLocationOverride:(id)a3;
- (void)setPageBookmarked:(BOOL)a3;
- (void)setPageBookmarked:(BOOL)a3 forDocumentViewController:(id)a4;
- (void)setPageIndexForProofing:(int64_t)a3;
- (void)setPaginationInProgress:(BOOL)a3;
- (void)setPerformanceModeBookOpening:(BOOL)a3;
- (void)setPresentingGlossary:(BOOL)a3;
- (void)setReadingProgressHighwaterMark:(id)a3;
- (void)setReadingStatisticsCollector:(id)a3;
- (void)setReadingStatisticsControllerLoaded:(BOOL)a3;
- (void)setSearchButtonItem:(id)a3;
- (void)setSearchViewController:(id)a3;
- (void)setSettingToolbarHidden:(BOOL)a3;
- (void)setShareButtonItem:(id)a3;
- (void)setSmartInvertEnabled:(BOOL)a3;
- (void)setSnapshotBlock:(id)a3;
- (void)setStartedScanningReadingStatistics:(BOOL)a3;
- (void)setStudyViewController:(id)a3;
- (void)setStyleBeforeAutoNight:(int64_t)a3;
- (void)setTOCGlossaryViewController:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelNavigationBar:(id)a3;
- (void)setTocGlossaryButtonItem:(id)a3;
- (void)setToolbarEnabledViaHover:(BOOL)a3;
- (void)setToolbarHiddenFromAccessibility:(BOOL)a3;
- (void)setTransitioningTOCSize:(BOOL)a3;
- (void)setViewBackgroundColor:(id)a3;
- (void)setVisibleViewController:(id)a3;
- (void)settingNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setupDVCForTOCController:(id)a3;
- (void)showBookmarkMenu:(BOOL)a3 fromItem:(id)a4;
- (void)showBookmarksView:(id)a3;
- (void)showDisplaySettingsPopover:(id)a3;
- (void)showFullscreenNotesView:(id)a3;
- (void)showFullscreenNotesView:(id)a3 completion:(id)a4;
- (void)showGlossary:(id)a3;
- (void)showGlossaryEntry:(id)a3;
- (void)showGlossaryEntryAtPath:(id)a3;
- (void)showHUDForVendor:(id)a3;
- (void)showPageForModelLink:(id)a3 animated:(BOOL)a4;
- (void)showSearchPopover;
- (void)showSearchPopoverFromBarButtonItem:(id)a3;
- (void)showSearchPopoverFromBarButtonItem:(id)a3 withText:(id)a4;
- (void)showSearchPopoverWithText:(id)a3;
- (void)showSharePopover:(id)a3;
- (void)showStudyCardsForNavigationUnit:(id)a3 useChapterTitle:(id)a4;
- (void)showTOC;
- (void)showTOCGlossaryPopover:(id)a3;
- (void)showToolbarAnimated:(BOOL)a3;
- (void)studyViewControllerIsDone:(id)a3;
- (void)temporarilySetHUDViewHidden:(BOOL)a3;
- (void)textForPagesLeftInChapterDidChangeTo:(id)a3;
- (void)tocIsReadyToPresent:(id)a3;
- (void)transitionDidFinish:(id)a3;
- (void)transitionWillBegin:(id)a3;
- (void)unrevealTOCAnimated:(BOOL)a3 duration:(double)a4;
- (void)updateBookmarkButton;
- (void)updateNavigationAffordances;
- (void)updatePageNumberWidth;
- (void)updateViewBackgroundColor;
- (void)userWillInteractInToolbar;
- (void)validateCommand:(id)a3;
- (void)vantageChangeWasCancelledBy:(id)a3 reason:(id)a4;
- (void)vantageDidChangeBy:(id)a3 reason:(id)a4;
- (void)vantageWillChangeBy:(id)a3 reason:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)viewsAreReadyForOpenAnimation;
- (void)viewsDidResize;
- (void)willFollowAnchor:(id)a3 pulse:(BOOL)a4;
- (void)willJumpToPageLocation:(id)a3;
- (void)willJumpToTOC;
- (void)willRevealTOC;
- (void)willSetNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation THBookViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc((Class)NSDictionary);
    id v3 = [v2 initWithObjectsAndKeys:&off_499108, qword_5731E8, 0];
    [+[NSUserDefaults standardUserDefaults] registerDefaults:v3];
  }
}

- (THBookViewController)initWithBookDescription:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THBookViewController;
  v4 = [(THBookViewController *)&v7 init];
  if (v4)
  {
    v4->mBookDescription = (THBookDescription *)a3;
    v4->mIsCompleteBook = 1;
    [(THBookViewController *)v4 setOpeningAbsolutePageIndexOverride:0x7FFFFFFFFFFFFFFFLL];
    [(THBookViewController *)v4 setTheme:[(THBookViewController *)v4 themeForStyle:[(THBookViewController *)v4 appearanceStyle]]];
    [(THBookViewController *)v4 updateViewBackgroundColor];
    v5 = objc_alloc_init(THReadingStatisticsCollector);
    v4->_readingStatisticsCollector = v5;
    [(THReadingStatisticsCollector *)v5 setDelegate:v4];
    v4->_performanceModeBookOpening = 1;
    if ([(THBookDescription *)v4->mBookDescription isEpub]) {
      [v4 view].setAccessibilityIgnoresInvertColors:1;
    }
    [(THBookViewController *)v4 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)updateViewBackgroundColor
{
  id v3 = +[UIColor bc_darkSystemBackgroundForTraitCollection:[(THBookViewController *)self traitCollection]];
  if ([(THBookDescription *)self->mBookDescription isEpub]) {
    id v3 = [(THTheme *)[(THBookViewController *)self theme] backgroundColorForTraitEnvironment:self];
  }

  [(THBookViewController *)self setViewBackgroundColor:v3];
}

+ (id)themeMap
{
  if (qword_5731F8 != -1) {
    dispatch_once(&qword_5731F8, &stru_4583D0);
  }
  return (id)qword_5731F0;
}

- (id)childViewControllerForStatusBarHidden
{
  if (self->_settingToolbarHidden) {
    return [(THBookViewController *)self visibleViewController];
  }
  else {
    return 0;
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  id v2 = [(THBookViewController *)self titleLabelNavigationBar];

  return [(BCDisplayOnlyNavigationBar *)v2 isHidden];
}

- (void)p_cleanupAfterViewUnload
{
  [(THBookViewController *)self setVisibleViewController:0];
  [(THBookViewController *)self setFlowTocViewController:0];
  [(THTOCViewController *)self->mChapterBrowserController setDelegate:0];
  self->mChapterBrowserController = 0;
  [(THBookViewController *)self setBookmarkButtonItem:0];
  [(THBookViewController *)self setBookmarkButton:0];
  [(THBookViewController *)self setBrightnessButtonItem:0];
  [(THBookViewController *)self setAppearanceButtonItem:0];
  [(THBookViewController *)self setSearchButtonItem:0];
  [(THBookViewController *)self setNotesButtonItem:0];
  [(THBookViewController *)self setTocGlossaryButtonItem:0];
  [(THBookViewController *)self setCloseButtonItem:0];
  [(THBookViewController *)self setCloseTOCButtonItem:0];
  [(THBookViewController *)self setActionlessBookmarkButton:0];
  [(THBookViewController *)self setShareButtonItem:0];
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setDelegate:0];
  [(THBookViewController *)self setNavigationBarController:0];
  [(THBookViewController *)self setIntroMediaViewController:0];
  [(THNavigationHistoryStepperController *)self->navigationHistoryStepperController setBookspotHistoryStack:0];
  [(THNavigationHistoryStepperController *)self->navigationHistoryStepperController setPageIndexFormatter:0];
  [(THNavigationHistoryStepperController *)self->navigationHistoryStepperController setChrome:0];

  self->navigationHistoryStepperController = 0;
  [(THBookViewController *)self setNavigationOverlayView:0];

  self->mTitleLabel = 0;
  self->mTitleLabelNavigationBar = 0;

  self->mCanvasExitTransformDelegate = 0;
  self->mCanvasExitTransformController = 0;
  [(THBookViewController *)self p_clearNotesFullscreenViewController];
  [(THBookViewController *)self setSearchViewController:0];

  self->mDebugPopover = 0;
  id v3 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v3 removeObserver:self];
}

- (void)dealloc
{
  [(THBookViewController *)self _teardown];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"pAutoHideNavOverlay" object:0];
  [+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin") didCloseBook:self];

  self->mDocument = 0;
  [(THBookViewController *)self p_cleanupAfterViewUnload];
  [(THBookViewController *)self setBookDescription:0];
  [(THBookViewController *)self setReadingProgressHighwaterMark:0];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setToolbarDelegate:0];
  [(THBookViewController *)self setDocumentViewController:0];
  [(THBookViewController *)self setBookLinkResolver:0];
  [(THBookViewController *)self setOpeningCFIOverride:0];
  [(THBookViewController *)self setOpeningLocationOverride:0];

  self->mGlossaryViewController = 0;
  [(THBookViewController *)self setViewBackgroundColor:0];
  [(THBookViewController *)self setHUDOverlayView:0];
  [(THBookViewController *)self setHoverInteraction:0];

  self->mBookmarkViewController = 0;
  self->mTOCGlossaryViewController = 0;

  self->mDisplaySettingsViewController = 0;
  self->_searchViewController = 0;

  self->_activityViewController = 0;
  [(THBookViewController *)self setTheme:0];

  self->_readingStatisticsCollector = 0;
  objc_opt_class();
  [(THBookViewController *)self viewIfLoaded];
  [(id)BUDynamicCast() setBookDelegate:0];

  self->_analyticsReadStartDate = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v3 dealloc];
}

- (THBookspotHistoryStack)bookspotHistoryStack
{
  if (![(THBookViewController *)self documentRoot]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController bookspotHistoryStack]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:567 description:@"invalid nil value for '%s'", "self.documentRoot"];
  }
  objc_super v3 = (THBookspotHistoryStack *)[THBookViewController documentRoot](self, "documentRoot").bookspotHistoryStack;
  if (!v3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController bookspotHistoryStack]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:570 description:@"invalid nil value for '%s'", "bookspotHistoryStack"];
  }
  return v3;
}

- (id)documentRoot
{
  id v2 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentRoot];
  if (!v2) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController documentRoot]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:578 description:@"invalid nil value for '%s'", "documentRoot"];
  }
  return v2;
}

- (THDocumentNavigationModel)navigationModel
{
  id v2 = [-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot].navigationModel;
  if (!v2) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookViewController navigationModel]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"] lineNumber:585 description:@"invalid nil value for '%s'", "navModel"];
  }
  return v2;
}

- (THChapterBrowserController)chapterBrowserController
{
  if (!self->mChapterBrowserController
    && [(THBookViewController *)self bookDescription]
    && ![(THBookViewController *)self isBookEpub])
  {
    v4 = [(THTOCViewController *)[THChapterBrowserController alloc] initWithBookPropertiesDelegate:self delegate:self];
    self->mChapterBrowserController = v4;
    [(THBookViewController *)self addChildViewController:v4];
    [self->mChapterBrowserController setDataSource:[-[THBookViewController documentRoot](self, "documentRoot") tocModel]];
    [(THChapterBrowserController *)self->mChapterBrowserController setPageAreaBackgroundColor:[(THBookViewController *)self viewBackgroundColor]];
  }
  return self->mChapterBrowserController;
}

- (THiOSFlowToCTableViewController)flowToCTableViewController
{
  return self->mFlowToCTableViewController;
}

- (THFlowTOCViewController)flowTocViewController
{
  if (!self->mFlowTocViewController)
  {
    objc_super v3 = [(THTOCViewController *)[THFlowTOCViewController alloc] initWithBookPropertiesDelegate:self delegate:self];
    self->mFlowTocViewController = v3;
    [(THBookViewController *)self addChildViewController:v3];
    [self->mFlowTocViewController setDataSource:[-[THBookViewController documentRoot](self, "documentRoot") tocModel]];
    [self->mFlowTocViewController setZipPackage:[-[THBookViewController documentRoot](self, "documentRoot") zipPackage]];
    [(THFlowTOCViewController *)self->mFlowTocViewController setDrmContext:[(THBookDescription *)[(THBookViewController *)self bookDescription] drmContext]];
    [(THFlowTOCViewController *)self->mFlowTocViewController setHasPaginatedData:[(THBookViewController *)self isBookEpub] ^ 1];
    if ([(THBookViewController *)self isBookEpub]) {
      [(THFlowTOCViewController *)self->mFlowTocViewController setTheme:[(THBookViewController *)self theme]];
    }
  }
  return self->mFlowTocViewController;
}

- (THNotesViewController)notesFullscreenViewController
{
  result = self->mNotesFullscreenViewController;
  if (!result)
  {
    v4 = +[THNotesViewController newNotesViewController];
    self->mNotesFullscreenViewController = v4;
    [(THNotesViewController *)v4 setBookViewController:self];
    [(THNotesViewController *)self->mNotesFullscreenViewController setModalPresentationStyle:0];
    if ([(THBookViewController *)self isBookEpub]) {
      [(THNotesViewController *)self->mNotesFullscreenViewController setTheme:[(THBookViewController *)self theme]];
    }
    [(THNotesViewController *)self->mNotesFullscreenViewController view];
    return self->mNotesFullscreenViewController;
  }
  return result;
}

- (void)p_clearNotesFullscreenViewController
{
  self->mNotesFullscreenViewController = 0;
}

- (void)appearanceViewController:(id)a3 brightnessLevelDidChange:(float)a4
{
  id v6 = +[BAEventReporter sharedReporter];
  id v7 = [(THBookViewController *)self ba_effectiveAnalyticsTracker];
  id v8 = [(THBookViewController *)self readingSessionData];
  id v9 = [(THBookViewController *)self contentData];
  LODWORD(v10) = llroundf(a4 * 100.0);

  [v6 emitReadingBrightnessChangeEventWithTracker:v7 readingSessionData:v8 contentData:v9 brightness:v10];
}

- (void)displaySettingsControllerDidChangeFontSize:(id)a3 toFlowSizeScale:(unint64_t)a4
{
  id v6 = +[BAEventReporter sharedReporter];
  id v7 = [(THBookViewController *)self ba_effectiveAnalyticsTracker];
  id v8 = [(THBookViewController *)self readingSessionData];
  id v9 = [(THBookViewController *)self contentData];
  *(float *)&double v10 = (float)a4;
  [v6 emitReadingFontSizeChangeEventWithTracker:v7 readingSessionData:v8 contentData:v9 fontSize:v10];
  v11 = [(THBookViewController *)self visibleViewController];
  if (v11 == (UIViewController *)[(THBookViewController *)self documentViewController])
  {
    v12 = [(THBookViewController *)self documentViewController];
    [(THDocumentViewController *)v12 changeFontSize:a4];
  }
}

- (BOOL)shouldShowFontResizeControls:(id)a3
{
  v4 = [(THBookViewController *)self visibleViewController];
  if (v4 != (UIViewController *)[(THBookViewController *)self documentViewController]) {
    return 0;
  }
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] inFlowMode])
  {
    return 1;
  }

  return [(THBookViewController *)self isBookEpub];
}

- (void)displaySettingsController:(id)a3 didChangeStyle:(int64_t)a4
{
  [+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter") emitReadingBackgroundColorChangeEventWithTracker:[self ba_effectiveAnalyticsTracker] readingSessionData:[self readingSessionData] contentData:[self contentData] backgroundColorData:BABackgroundColorDataFromBCAppearanceStyle()];

  [(THBookViewController *)self applyAppearanceStyle:a4];
}

- (void)displaySettingsController:(id)a3 didChangeAutoNightMode:(BOOL)a4
{
  BOOL v4 = a4;
  [+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3) emitReadingAutoNightSettingChangeEventWithTracker:a4 readingSessionData:[self readingSessionData] contentData:[self contentData]];
  unsigned int v6 = +[IMTheme isAutoNightModeEnabled];
  +[IMTheme setAutoNightModeEnabled:v4];
  if (v4)
  {
    if ((v6 & 1) == 0)
    {
      [(THBookViewController *)self _enableAutoNightMode];
    }
  }
  else
  {
    if (v6) {
      [(THBookViewController *)self _disableAutoNightMode];
    }
    int64_t v7 = [(THBookViewController *)self styleBeforeAutoNight];
    [(THBookViewController *)self applyAppearanceStyle:v7];
  }
}

- (BOOL)shouldShowFlowModeSwitch:(id)a3
{
  return !-[THBookViewController p_isTOCViewController:](self, "p_isTOCViewController:", -[THBookViewController visibleViewController](self, "visibleViewController", a3))&& objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType") != 0;
}

- (BOOL)flowModeEnabled:(id)a3
{
  objc_super v3 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v3 showFlowModeIfAvailable];
}

- (BOOL)autoNightModeEnabled:(id)a3
{
  unsigned int v3 = [(THBookViewController *)self isBookEpub];
  if (v3)
  {
    LOBYTE(v3) = +[IMTheme isAutoNightModeEnabled];
  }
  return v3;
}

- (void)_enableAutoNightMode
{
  if ([(THBookViewController *)self isBookEpub])
  {
    unsigned int v3 = +[BCLightLevelController sharedInstance];
    objc_initWeak(&location, self);
    BOOL v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    unsigned int v6 = sub_819C4;
    int64_t v7 = &unk_4583F8;
    objc_copyWeak(&v8, &location);
    [(BCLightLevelController *)v3 addObserver:self changeHandler:&v4];
    -[THBookViewController _updateAppearanceFromLightLevelController:](self, "_updateAppearanceFromLightLevelController:", v3, v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_disableAutoNightMode
{
  unsigned int v3 = +[BCLightLevelController sharedInstance];

  [(BCLightLevelController *)v3 removeObserver:self];
}

- (void)_updateAppearanceFromLightLevelController:(id)a3
{
  if ([(THBookViewController *)self isBookEpub]
    && +[IMTheme isAutoNightModeEnabled]
    && [a3 shouldMonitorLightLevel])
  {
    int64_t styleBeforeAutoNight = self->_styleBeforeAutoNight;
    if ([a3 currentLightLevel] == (char *)&dword_0 + 2) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = styleBeforeAutoNight;
    }
    [(THBookViewController *)self applyAppearanceStyle:v6];
  }
}

- (void)displaySettingsControllerDidChangeFlowMode:(id)a3
{
}

- (void)displaySettingsControllerDidChangeFlowMode:(id)a3 notifyingCoordinator:(BOOL)a4
{
  BOOL v4 = a4;
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] invalidate];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] toggleFlowPresentation];
  [(THBookViewController *)self p_updateFromTheme:0];
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v6 postNotificationName:THScrollingViewDidChangeNotification object:0];
  if (v4)
  {
    if ([(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] isScroll])uint64_t v7 = 2; {
    else
    }
      uint64_t v7 = 1;
    id v8 = +[BCThemeCoordinator shared];
    [v8 observer:self didChangeLayout:v7];
  }
}

- (BOOL)p_isTOCViewController:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self->mFlowTocViewController == a3 || self->mChapterBrowserController == a3) {
    return 1;
  }
  return self->mFlowToCTableViewController == a3;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v5 loadView];
  unsigned int v3 = [THBookView alloc];
  [self view].frame;
  BOOL v4 = -[THBookView initWithFrame:expandedLayout:](v3, "initWithFrame:expandedLayout:", 1);
  [(THBookView *)v4 setBookDelegate:self];
  [(THBookView *)v4 setBackgroundColor:[(THBookViewController *)self defaultBackgroundColor]];
  [(THBookView *)v4 setAutoresizingMask:18];
  [(THBookViewController *)self setView:v4];
  [(THBookViewController *)self setEdgesForExtendedLayout:15];
  [(THBookViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  [(THBookViewController *)self p_loadToolbar];
  [(THBookViewController *)self p_loadNavigationOverlay];
  [(THBookViewController *)self p_loadTitleLabel];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v5 viewDidLoad];
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"p_navigationHistoryDidChange:" name:THNavigationHistoryDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 addObserver:self selector:"_accessibilityInvertColorsStatusDidChange:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 addObserver:self selector:"_voiceOverSwitchControlStatusDidChange" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];
  self->_smartInvertEnabled = UIAccessibilityIsInvertColorsEnabled();
  [(THBookViewController *)self setStyleBeforeAutoNight:[(THBookViewController *)self appearanceStyle]];
  if ((char *)[+[UIDevice currentDevice] orientation]- 3 >= (unsigned char *)&dword_0 + 2)uint64_t v4 = 1; {
  else
  }
    uint64_t v4 = 2;
  [(THBookViewController *)self setLastAnalyticsDeviceOrientationReported:v4];
}

- (void)didReceiveMemoryWarning
{
  if (self->mIsClosing)
  {
    v4.receiver = self;
    v4.super_class = (Class)THBookViewController;
    [(THBookViewController *)&v4 didReceiveMemoryWarning];
  }
  if (![(THBookViewController *)self isNotesFullscreenVisible]) {
    [(THBookViewController *)self p_clearNotesFullscreenViewController];
  }
  if (![(THBookViewController *)self isGlossaryVisible])
  {

    self->mGlossaryViewController = 0;
  }
  id v3 = [-[THBookViewController documentRoot](self, "documentRoot") searchController];
  if ([(THBookViewController *)self p_isSearchVisible])
  {
    [v3 setUnloadRequested:1];
  }
  else
  {
    [v3 unloadIndex];
    [(THBookViewController *)self setSearchViewController:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setNavigationBarHidden:[(THBookViewController *)self shouldAutohideNavigationBar] animated:0];
  [+[BCThemeCoordinator shared](BCThemeCoordinator, "shared") addObserver:self];
  if (![(THBookViewController *)self bc_contextualPresentedViewController]
    && +[IMTheme isAutoNightModeEnabled])
  {
    [(THBookViewController *)self _enableAutoNightMode];
  }
  if ([(THBookViewController *)self isMovingToParentViewController])
  {
    [(THBookViewController *)self p_updateToolbarButtonStates];
    [(THBookViewController *)self p_updateFromTheme:0];
    if ([(THBookViewController *)self p_hasDestinationPage]) {
      [(THBookViewController *)self p_showDVC];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v5 viewWillAppear:v3];
  if (self->mHaveCalledDidOpen) {
    [(THBookViewController *)self viewsAreReadyForOpenAnimation];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(THBookViewController *)self _updateCloseButtonItem];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v4 viewWillDisappear:a3];
  [+[BCThemeCoordinator shared](BCThemeCoordinator, "shared") removeObserver:self];
  [(THBookViewController *)self bc_analyticsVisibilitySubtreeWillDisappear];
  [+[NSNotificationCenter defaultCenter] postNotificationName:@"kTHPPT_bookControllerChange" object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v4 viewDidDisappear:a3];
  [(THBookViewController *)self bc_analyticsVisibilitySubtreeDidDisappear];
  if (![(THBookViewController *)self presentedViewController])
  {
    if (+[IMTheme isAutoNightModeEnabled]) {
      [(THBookViewController *)self _disableAutoNightMode];
    }
    [+[NSUserDefaults standardUserDefaults] setInteger:[(THBookViewController *)self styleBeforeAutoNight] forKey:@"THBookViewControllerStyleBeforeAutoNight"];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v5 viewDidAppear:a3];
  [(THBookViewController *)self bc_analyticsVisibilityUpdateSubtree];
  objc_msgSend(objc_msgSend(-[THBookViewController view](self, "view"), "window"), "makeKeyWindow");
  [(THBookViewController *)self p_updateCenterTitle];
  mBookOpener = self->mBookOpener;
  if (mBookOpener && ([(THBookOpener *)mBookOpener isFinished] & 1) == 0) {
    [(THBookViewController *)self p_alertUserAboutFontDownload];
  }
  [+[NSNotificationCenter defaultCenter] postNotificationName:@"kTHPPT_bookControllerChange" object:self];
}

- (void)p_updateTitleLabelToolbarVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3
    && objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))
  {
    [self->mTitleLabelNavigationBar insertSubview:[self view] belowSubview:[-[THBookViewController navigationBarController](self, "navigationBarController") navigationBar]];
    [(BCDisplayOnlyNavigationBar *)[(THBookViewController *)self titleLabelNavigationBar] setLeftItems:&__NSArray0__struct rightItems:&__NSArray0__struct titleView:[(THBookViewController *)self titleLabel] animated:0];
    [(UILabel *)[(THBookViewController *)self titleLabel] sizeToFit];
    [-[THBookViewController view](self, "view") insertSubview: -[THBookViewController actionlessBookmarkButton](self, "actionlessBookmarkButton") belowSubview: -[THNavigationBarController navigationBar](-[THBookViewController navigationBarController](self, "navigationBarController"), "navigationBar")];
    [(THBookViewController *)self p_syncActionlessBookmarkToolbarButtonFrame];
    if (!v4)
    {
      [(BCDisplayOnlyNavigationBar *)[(THBookViewController *)self titleLabelNavigationBar] setAlpha:1.0];
      [(BCDisplayOnlyNavigationBar *)[(THBookViewController *)self titleLabelNavigationBar] setHidden:0];
      goto LABEL_10;
    }
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_82460;
    v26 = &unk_456DE0;
    v27 = self;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_82490;
    v21 = &unk_457140;
    v22 = self;
    objc_super v6 = &v23;
    uint64_t v7 = &v18;
  }
  else
  {
    if (!v4)
    {
      [(BCDisplayOnlyNavigationBar *)[(THBookViewController *)self titleLabelNavigationBar] setLeftItems:&__NSArray0__struct rightItems:&__NSArray0__struct titleView:0 animated:0];
      [(BCDisplayOnlyNavigationBar *)[(THBookViewController *)self titleLabelNavigationBar] setAlpha:0.0];
      [(BCDisplayOnlyNavigationBar *)[(THBookViewController *)self titleLabelNavigationBar] setHidden:1];
      [(UIButton *)[(THBookViewController *)self actionlessBookmarkButton] setAlpha:0.0];
      goto LABEL_10;
    }
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_824C0;
    v16 = &unk_456DE0;
    v17 = self;
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    double v10 = sub_8250C;
    v11 = &unk_457140;
    v12 = self;
    objc_super v6 = &v13;
    uint64_t v7 = &v8;
  }
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v7, 0.15, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27);
LABEL_10:
  [(THBookViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
}

- (void)viewWillLayoutSubviews
{
  id v2 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration];

  [(THDocumentReflowableLayoutConfiguration *)v2 invalidate];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)THBookViewController;
  [(THBookViewController *)&v10 viewDidLayoutSubviews];
  if (![(THBookViewController *)self hoverInteraction])
  {
    -[self setHoverInteraction:[objc_alloc((Class)BCUIHoverInteraction) initWithDelegate:self view:[self view]]];
    [(-[THBookViewController view](self, "view")) addInteraction:(-[THBookViewController hoverInteraction](self, "hoverInteraction"))];
  }
  [(THBookViewController *)self buildHoverRegions];
  [(THBookViewController *)self p_navigationOverlayFrame];
  -[THNavigationOverlayView setFrame:]([(THBookViewController *)self navigationOverlayView], "setFrame:", v3, v4, v5, v6);
  if ([(THBookViewController *)self documentViewController]
    && [(THBookViewController *)self isBookEpub])
  {
    [(UIView *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] navigationOverlayContainer] addSubview:[(THBookViewController *)self navigationOverlayView]];
    [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] addSubview:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] navOverlayPageNumberView]];
    int v7 = 1;
  }
  else
  {
    [-[THBookViewController view](self, "view") addSubview: -[THBookViewController navigationOverlayView](self, "navigationOverlayView")];
    int v7 = 0;
  }
  if (!self->mDocumentToTOCViewTransitionView && !self->mTOCToDocumentViewTransitionView)
  {
    BOOL v9 = 0;
    if (v7)
    {
      if (objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))
      {
        id v8 = [(THBookViewController *)self visibleViewController];
        if (v8 == (UIViewController *)[(THBookViewController *)self documentViewController]
          && ![(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView])
        {
          BOOL v9 = 1;
        }
      }
    }
    [(THBookViewController *)self p_updateTitleLabelToolbarVisible:v9 animated:0];
  }
}

- (void)p_syncActionlessBookmarkToolbarButtonFrame
{
  id v3 = [(THBookViewController *)self view];
  [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
  [v3 convertRect:[-[UIButton superview](-[THBookViewController bookmarkButton](self, "bookmarkButton"), "superview")] fromView:v4, v5, v6, v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(THBookViewController *)self actionlessBookmarkButton];

  -[UIButton setFrame:](v16, "setFrame:", v9, v11, v13, v15);
}

- (int64_t)overrideUserInterfaceStyle
{
  v4.receiver = self;
  v4.super_class = (Class)THBookViewController;
  int64_t result = [(THBookViewController *)&v4 overrideUserInterfaceStyle];
  if (!result)
  {
    objc_opt_class();
    [(THBookViewController *)self theme];
    int64_t result = TSUDynamicCast();
    if (result) {
      return (int64_t)[(id)result userInterfaceStyle];
    }
  }
  return result;
}

- (void)p_bookViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double v5 = [(THBookViewController *)self visibleViewController];
  if (v5 == (UIViewController *)[(THBookViewController *)self documentViewController]
    && [(THBookViewController *)self tocViewControllerMayBeShrouded:[(THBookViewController *)self p_selectedTocViewController]])
  {
    mChapterBrowserController = self->mChapterBrowserController;
    [(THTOCViewController *)mChapterBrowserController setShrouded:1 animated:0 duration:0.0];
  }
}

- (void)p_bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double v5 = [(THBookViewController *)self visibleViewController];
  if (v5 == (UIViewController *)[(THBookViewController *)self documentViewController]
    && [(THBookViewController *)self tocViewControllerMayBeShrouded:[(THBookViewController *)self p_selectedTocViewController]])
  {
    [(THTOCViewController *)self->mChapterBrowserController setShrouded:1 animated:0 duration:0.0];
  }
  double v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = TSKWillRotateToInterfaceOrientationNotification;
  double v8 = +[NSDictionary dictionary];

  [(NSNotificationCenter *)v6 postNotificationName:v7 object:self userInfo:v8];
}

- (void)p_bookViewWillAnimateRotationToSize:(CGSize)a3 withContext:(id)a4
{
  -[THBookViewController temporarilySetHUDViewHidden:](self, "temporarilySetHUDViewHidden:", 1, a3.width, a3.height);

  [(THBookViewController *)self updateBookmarkButton];
}

- (void)p_bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4
{
}

- (void)p_bookViewDidRotateTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  double v5 = [(THBookViewController *)self visibleViewController];
  if (v5 == (UIViewController *)[(THBookViewController *)self documentViewController]
    && [(THBookViewController *)self tocViewControllerMayBeShrouded:[(THBookViewController *)self p_selectedTocViewController]])
  {
    [(THTOCViewController *)self->mChapterBrowserController setShrouded:1 animated:0 duration:0.0];
  }
  double v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = TSKDidRotateToInterfaceOrientationNotification;
  double v8 = +[NSDictionary dictionary];

  [(NSNotificationCenter *)v6 postNotificationName:v7 object:self userInfo:v8];
}

- (void)p_bookViewDidTransitionToSize:(CGSize)a3 withContext:(id)a4
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] inLiveResize])
  {
    v22.receiver = self;
    v22.super_class = (Class)THBookViewController;
    -[THBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  }
  else
  {
    [(THBookViewController *)self dismissActivePopoverIsTransitioning:1];
    if (a4) {
      [a4 targetTransform];
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v21);
    BOOL v9 = !IsIdentity;
    if (IsIdentity) {
      -[THBookViewController p_bookViewWillTransitionToSize:withTransitionCoordinator:](self, "p_bookViewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
    }
    else {
      -[THBookViewController p_bookViewWillRotateTransitionToSize:withTransitionCoordinator:](self, "p_bookViewWillRotateTransitionToSize:withTransitionCoordinator:", a4, width, height);
    }
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_82D28;
    v15[3] = &unk_457428;
    BOOL v16 = v9;
    v15[4] = self;
    v15[5] = &v17;
    *(double *)&v15[6] = width;
    *(double *)&v15[7] = height;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_82D68;
    v13[3] = &unk_458420;
    v13[4] = self;
    v13[5] = &v17;
    BOOL v14 = v9;
    *(double *)&v13[6] = width;
    *(double *)&v13[7] = height;
    unsigned __int8 v10 = [a4 animateAlongsideTransition:v15 completion:v13];
    *((unsigned char *)v18 + 24) = v10;
    v12.receiver = self;
    v12.super_class = (Class)THBookViewController;
    -[THBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
    double v11 = [(THBookViewController *)self visibleViewController];
    if (v11 != (UIViewController *)[(THBookViewController *)self documentViewController]) {
      -[THDocumentViewController updateTwoUpForSize:]([(THBookViewController *)self documentViewController], "updateTwoUpForSize:", width, height);
    }
    _Block_object_dispose(&v17, 8);
  }
}

- (void)p_updateToolbarButtonStatesWithTraits:(id)a3
{
  id v5 = [(THBookViewController *)self im_isCompactWidth];
  if (a3) {
    BOOL v6 = [a3 horizontalSizeClass] == (char *)&dword_0 + 1;
  }
  else {
    BOOL v6 = (BOOL)v5;
  }
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setLeftItems:[(THBookViewController *)self leftToolbarItems:v6] rightItems:[(THBookViewController *)self rightToolbarItems:v6]];
  [(THBookViewController *)self updateBookmarkButton];
  id v7 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "glossaryController"), "model");
  BOOL v8 = ([(THBookViewController *)self isTOCButtonApplicable]
     || (uint64_t)[v7 entryCount] >= 1)
    && [(THBookViewController *)self isCompleteBook];
  [(UIBarButtonItem *)[(THBookViewController *)self tocGlossaryButtonItem] setEnabled:v8];
  if ([(THBookViewController *)self isBookEpub]) {
    id v9 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] isDocumentLoaded];
  }
  else {
    id v9 = &dword_0 + 1;
  }
  unsigned __int8 v10 = [(THBookViewController *)self searchButtonItem];

  [(UIBarButtonItem *)v10 setEnabled:v9];
}

- (void)p_updateToolbarButtonStates
{
}

- (void)p_updateFromTheme:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookViewController *)self theme];
  [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setTheme:v5 force:v3];
  [(THBookViewController *)self p_navigationOverlayFrame];
  -[THNavigationOverlayView setFrame:]([(THBookViewController *)self navigationOverlayView], "setFrame:", v6, v7, v8, v9);
  if ([(THBookViewController *)self isBookEpub])
  {
    [(THTheme *)v5 stylizeOuterView:[(THBookViewController *)self view]];
    [(-[THBookViewController view](self, "view")) setBackgroundColor:[-[THTheme backgroundColorForTraitEnvironment:](-[THBookViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self)]];
    [(THTheme *)v5 stylizeBCNavigationBar:[(THBookViewController *)self titleLabelNavigationBar]];
    [(UILabel *)[(THBookViewController *)self titleLabel] setTextColor:[(THTheme *)v5 headerTextColorDimmed]];
    [(THNotesViewController *)self->mNotesFullscreenViewController setTheme:[(THBookViewController *)self theme]];
    [(THTOCGlossaryMenuPopoverViewController *)[(THBookViewController *)self TOCGlossaryViewController] setTheme:[(THBookViewController *)self theme]];
  }
  [(THBookViewController *)self refreshStatusBarAppearance];
  unsigned __int8 v10 = self;
  if ([(UIViewController *)[(THBookViewController *)self visibleViewController] conformsToProtocol:&OBJC_PROTOCOL___THNavigationBarThemeDelegate])unsigned __int8 v10 = [(THBookViewController *)self visibleViewController]; {
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] updateViewStateWithThemeDelegate:v10];
  }
  if ([(THBookViewController *)self isBookEpub])
  {
    [(THBookViewController *)self visibleViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setCenterItemTextColor:[(THTheme *)v5 headerTextColor]];
    }
  }
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] clearAutohideTimer];
  double v11 = [(THBookViewController *)self visibleViewController];
  if (v11 == (UIViewController *)[(THBookViewController *)self documentViewController]
    && [(THBookViewController *)self isBookEpub])
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] chromeAnimationInterval];
    [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setShowHideAnimationDuration:v12];
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] chromeAnimationInterval];
    [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setShowHideDuration:v13];
    BOOL v14 = [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] toolbarSeparatorsVisible];
  }
  else
  {
    [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setShowHideAnimationDuration:0.15];
    [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setShowHideDuration:0.15];
    BOOL v14 = 0;
  }
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] updateForTheme:v5];
  if ([(THBookViewController *)self isBookEpub])
  {
    [(THFlowTOCViewController *)self->mFlowTocViewController setTheme:v5];
    [(THiOSFlowToCTableViewController *)self->mFlowToCTableViewController setTheme:v5];
    [(THNotesViewController *)self->mNotesFullscreenViewController setTheme:v5];
    [(THSearchViewController *)[(THBookViewController *)self searchViewController] setTheme:v5];
    [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] setTheme:v5];
  }
  [(THDisplaySettingsViewController *)[(THBookViewController *)self displaySettingsViewController] setTheme:v5];
  [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setSeparatorsVisible:v14];
  [(BCNavigationBar *)[(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar] setSeparatorsVisible:v14];
  double v15 = [(THBookViewController *)self titleLabelNavigationBar];

  [(BCDisplayOnlyNavigationBar *)v15 setSeparatorsVisible:v14];
}

- (BOOL)disableRotationEdgeClip
{
  [(THBookViewController *)self visibleViewController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v3 = [(THBookViewController *)self visibleViewController];

  return [(UIViewController *)v3 disableRotationEdgeClip];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  v8.receiver = self;
  v8.super_class = (Class)THBookViewController;
  id v3 = [[-[THBookViewController keyCommands](&v8, "keyCommands") mutableCopy]];
  if (!v3) {
    id v3 = +[NSMutableArray array];
  }
  if (objc_msgSend(-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](self, "documentViewController"), "canvasViewController"), "isFirstResponder"))
  {
    objc_super v4 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", [(id)THBundle() localizedStringForKey:@"Next Page" value:&stru_46D7E8 table:0], 0, "books_pageForward:", UIKeyInputRightArrow, 0, 0);
    [(UIKeyCommand *)v4 setWantsPriorityOverSystemBehavior:1];
    [(UIKeyCommand *)v4 setAllowsAutomaticMirroring:0];
    [v3 addObject:v4];
    id v5 = +[UIKeyCommand keyCommandWithInput:@" " modifierFlags:0 action:"books_pageForward:"];
    [(UIKeyCommand *)v5 setWantsPriorityOverSystemBehavior:1];
    [v3 addObject:v5];
    double v6 = +[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", [(id)THBundle() localizedStringForKey:@"Previous Page" value:&stru_46D7E8 table:0], 0, "books_pageBackward:", UIKeyInputLeftArrow, 0, 0);
    [(UIKeyCommand *)v6 setWantsPriorityOverSystemBehavior:1];
    [(UIKeyCommand *)v6 setAllowsAutomaticMirroring:0];
    [v3 addObject:v6];
  }
  return v3;
}

- (void)books_toggleBookmark:(id)a3
{
}

- (void)books_increaseSize:(id)a3
{
}

- (void)books_decreaseSize:(id)a3
{
}

- (void)_adjustSizeIncreasing:(BOOL)a3
{
  id v5 = [(THBookViewController *)self displaySettingsViewController];
  if (!v5) {
    id v5 = [[THDisplaySettingsViewController alloc] initWithNibName:0 bundle:0];
  }
  [(THBookViewController *)self visibleViewController];
  [(THDisplaySettingsViewController *)v5 setDelegate:TSUProtocolCast()];
  [(THDisplaySettingsViewController *)v5 setTheme:[(THBookViewController *)self theme]];
  if (a3)
  {
    [(THDisplaySettingsViewController *)v5 increaseFontSize:self];
  }
  else
  {
    [(THDisplaySettingsViewController *)v5 decreaseFontSize:self];
  }
}

- (void)books_find:(id)a3
{
}

- (void)p_insertDVCInBack
{
}

- (void)p_insertDVCInBackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookViewController *)self documentViewController];

  [(THBookViewController *)self p_addViewControllerInBack:v5 animated:v3];
}

- (void)p_showDVC
{
  BOOL v3 = [(THBookViewController *)self visibleViewController];
  if (v3 != (UIViewController *)[(THBookViewController *)self documentViewController])
  {
    [(THBookViewController *)self p_addViewControllerInFront:[(THBookViewController *)self documentViewController] reason:@"THVantageChangeReasonTransitionToDVC"];
    [(THFlowTOCViewController *)[(THBookViewController *)self flowTocViewController] setReflowablePaginationController:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController]];
    [(THBookViewController *)self p_setupCanvasExitTransformController];
    [self.p_selectedTocViewController setShrouded:1 animated:0 duration:0.0];
    [(THBookViewController *)self removeTOC];
    objc_super v4 = [(THBookViewController *)self documentViewController];
    [(THDocumentViewController *)v4 setVisibleInfoUpdatesAllowedInLandscape:1];
  }
}

- (void)p_showDVCAnimated:(BOOL)a3 withLink:(id)a4
{
  id v4 = a4;
  BOOL v5 = a3;
  if (a4) {
    goto LABEL_2;
  }
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] isDocumentLoaded]&& [(THDocumentNavigator *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentNavigator] currentContentNode])
  {
    id v4 = 0;
LABEL_9:
    int v8 = 0;
    int v7 = 1;
    goto LABEL_10;
  }
  id v4 = [self documentRoot] linkForNavigationUnitIndex:0];
  if (!v4) {
    goto LABEL_9;
  }
LABEL_2:
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] isDocumentLoaded])
  {
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] followLink:v4];
    int v7 = 0;
    int v8 = 1;
  }
  else
  {
    int v7 = 0;
    int v8 = 0;
  }
LABEL_10:
  double v9 = [(THBookViewController *)self visibleViewController];
  if (v9 != (UIViewController *)[(THBookViewController *)self documentViewController])
  {
    [(THBookViewController *)self p_addViewControllerInFront:[(THBookViewController *)self documentViewController] reason:@"THVantageChangeReasonTransitionToDVC"];
    [(THFlowTOCViewController *)[(THBookViewController *)self flowTocViewController] setReflowablePaginationController:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController]];
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setVisibleInfoUpdatesAllowedInLandscape:1];
    if (((v7 | v8) & 1) == 0)
    {
      [(THDocumentViewController *)[(THBookViewController *)self documentViewController] followLink:v4];
      if (!v5) {
        return;
      }
      goto LABEL_14;
    }
    [(THBookViewController *)self dismissActivePopover];
  }
  if (!v5) {
    return;
  }
LABEL_14:
  unsigned __int8 v10 = [(THBookViewController *)self documentViewController];
  [(THFlowTOCViewController *)self->mFlowTocViewController bottomSeparatorYPositionForChapterIndex:[(THDocumentViewController *)v10 currentChapter] lessonIndex:[(THDocumentViewController *)v10 currentTOCLessonIndex]];
  [self->mFlowTocViewController->view convertPoint:[self view] toView:[self view] 0.0 v11];
  double v13 = v12;
  [(THBookViewController *)self setDisallowRotate:1];
  BOOL v14 = [THTOCSplitTransitionView alloc];
  [self view].bounds
  double v15 = -[THTOCSplitTransitionView initWithFrame:](v14, "initWithFrame:");
  self->mDocumentToTOCViewTransitionView = v15;
  [(THTransitionView *)v15 setDelegate:self];
  [(THTOCSplitTransitionView *)self->mDocumentToTOCViewTransitionView setSplitPositionY:v13];
  mFlowToCTableViewController = self->mFlowToCTableViewController;
  if (!mFlowToCTableViewController) {
    mFlowToCTableViewController = self->mFlowTocViewController;
  }
  [(THTransitionView *)self->mDocumentToTOCViewTransitionView setFromViewController:mFlowToCTableViewController];
  [(THTransitionView *)self->mDocumentToTOCViewTransitionView setToViewController:v10];
  [(THTOCSplitTransitionView *)self->mDocumentToTOCViewTransitionView setAnimationDuration:0.65];
  [self->mDocumentToTOCViewTransitionView insertSubview:self->mDocumentToTOCViewTransitionView belowSubview:[self->mNavigationBarController view]];
  [(THTOCSplitTransitionView *)self->mDocumentToTOCViewTransitionView beginTransition];

  [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonTransitionToDVC"];
}

- (void)p_setVisibleViewControllerToViewController:(id)a3 reason:(id)a4
{
  if ([(THBookViewController *)self visibleViewController] != a3)
  {
    [(THBookViewController *)self vantageWillChangeBy:self reason:a4];
    [(THBookViewController *)self setVisibleViewController:a3];
    [(THBookViewController *)self vantageDidChangeBy:self reason:a4];
    if ([(THBookViewController *)self isBookEpub])
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_83A80;
      v7[3] = &unk_456DE0;
      v7[4] = self;
      +[UIView animateWithDuration:v7 animations:0.2];
    }
    else
    {
      [(THBookViewController *)self p_updateFromTheme:0];
    }
    [(THBookViewController *)self p_updateToolbarButtonStates];
    [(THBookViewController *)self p_updateCenterTitle];
    if ([(THBookViewController *)self p_isTOCViewController:[(THBookViewController *)self visibleViewController]])
    {
      [(THBookViewController *)self p_setNavigationOverlayHidden:1 animated:1 autoHides:0];
    }
    [(THBookspotHistoryStack *)[(THBookViewController *)self bookspotHistoryStack] setSeekDistinctSpots:[(THBookViewController *)self documentViewController] == a3];
    [(THBookViewController *)self buildHoverRegions];
    [(THBookViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
  }
}

- (void)transitionWillBegin:(id)a3
{
  if (self->mDocumentToTOCViewTransitionView == a3)
  {
    [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) pushThreadedLayoutAndRenderDisabled];
    [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) layoutIfNeeded];
    [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) popThreadedLayoutAndRenderDisabled];
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
    [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setNavigationBarHidden:1 animated:0];
    +[CATransaction flush];
  }
  else if (self->mTOCToDocumentViewTransitionView == a3)
  {
    [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setNavigationBarHidden:1 animated:0];
    [(THBookViewController *)self p_updateTitleLabelToolbarVisible:0 animated:1];
  }
}

- (void)transitionDidFinish:(id)a3
{
  if (self->mDocumentToTOCViewTransitionView == a3)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController"), "layerHost"), "canvasLayer"), "popLayoutDisabled");
    [(THBookViewController *)self hideTOC];
    [(THBookViewController *)self p_showDVC];
    self->mDocumentToTOCViewTransitionView = 0;
    [(THBookViewController *)self p_updateTitleLabelToolbarVisible:1 animated:1];
  }
  else if (self->mTOCToDocumentViewTransitionView == a3)
  {
    if ([a3 wasReversed])
    {
      [(THBookViewController *)self p_showDVC];
      [(THBookViewController *)self hideTOC];
      [(THBookViewController *)self p_updateTitleLabelToolbarVisible:1 animated:1];
    }
    else
    {
      [(THBookViewController *)self p_removeViewController:[(THBookViewController *)self documentViewController]];
      [(THBookViewController *)self showTOC];
    }
    self->mTOCToDocumentViewTransitionView = 0;
  }
  [a3 removeFromSuperview];

  [(THBookViewController *)self setDisallowRotate:0];
}

- (void)p_setupCanvasExitTransformController
{
  id v3 = [(THBookViewController *)self currentPresentationType];
  if (self->mDocumentViewController
    && (id v4 = v3, ([v3 isFlow] & 1) == 0)
    && [(THDocumentViewController *)self->mDocumentViewController isDocumentLoaded]
    && ![(THBookViewController *)self isBookEpub])
  {
    if (self->mDocumentViewController
      && ([v4 isFlow] & 1) == 0
      && !self->mCanvasExitTransformDelegate
      && !self->mCanvasExitTransformController)
    {
      id v5 = [[-[THDocumentViewController canvasViewController](-[THBookViewController documentViewController](self, "documentViewController"), "canvasViewController") canvasView] enclosingScrollView];
      self->mCanvasExitTransformDelegate = [[THCanvasExitTransformDelegate alloc] initWithBookViewController:self];
      double v6 = objc_alloc_init(THWFreeTransformController);
      self->mCanvasExitTransformController = v6;
      [(THWFreeTransformController *)v6 setDelegate:self->mCanvasExitTransformDelegate];
      [(THWFreeTransformController *)self->mCanvasExitTransformController setScaleThreshold:0.75];
      -[THWFreeTransformController setTargetLayer:](self->mCanvasExitTransformController, "setTargetLayer:", [v5 layer]);
      mCanvasExitTransformController = self->mCanvasExitTransformController;
      [(THWFreeTransformController *)mCanvasExitTransformController setSmoothEdges:1];
    }
  }
  else
  {
    [(THWFreeTransformController *)self->mCanvasExitTransformController setTargetLayer:0];

    self->mCanvasExitTransformDelegate = 0;
    self->mCanvasExitTransformController = 0;
  }
}

- (unint64_t)absolutePageIndexForCFI:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return (unint64_t)[v4 absolutePageIndexForCFI:a3];
}

- (id)storageForCFI:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return [v4 storageForCFI:a3];
}

- (THGlossaryViewController)glossaryViewController
{
  return self->mGlossaryViewController;
}

- (void)hideGlossaryWithDestinationViewController:(id)a3
{
  BOOL v5 = +[UIView areAnimationsEnabled];

  [(THBookViewController *)self hideGlossaryWithDestinationViewController:a3 animated:v5 completion:0];
}

- (void)p_unloadGlossaryViewControllerIfHiding
{
  if (self->mHidingGlossary)
  {
    if (self->mGlossaryViewController)
    {
      [(THGlossaryViewController *)[(THBookViewController *)self glossaryViewController] unload];

      self->mGlossaryViewController = 0;
      self->mHidingGlossary = 0;
    }
  }
}

- (void)hideGlossaryWithDestinationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  [(THBookViewController *)self setPresentingGlossary:0];
  if (self->mHidingGlossary || ![(THBookViewController *)self isGlossaryVisible])
  {
    if (a5)
    {
      double v9 = (void (*)(id))*((void *)a5 + 2);
      v9(a5);
    }
  }
  else
  {
    self->mHidingGlossary = 1;
    [(THBookViewController *)self vantageWillChangeBy:self reason:@"THVantageChangeReasonTransitionFromGlossary"];
    [(THBookViewController *)self hideToolbarAnimated:0];
    if (!a3 || [(THBookViewController *)self documentViewController] == a3) {
      [(THBookViewController *)self p_showDVC];
    }
    else {
      [(THBookViewController *)self p_addViewControllerInFront:a3 reason:@"THVantageChangeReasonTransitionFromGlossary"];
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_84090;
    v10[3] = &unk_456E88;
    v10[4] = self;
    v10[5] = a5;
    [(THGlossaryViewController *)[(THBookViewController *)self glossaryViewController] dismissViewControllerAnimated:v6 completion:v10];
    [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonTransitionFromGlossary"];
  }
}

- (void)p_ensureGlossaryViewController
{
  [(THBookViewController *)self p_unloadGlossaryViewControllerIfHiding];
  if (!self->mGlossaryViewController)
  {
    id v3 = +[THGlossaryViewController newViewController];
    self->mGlossaryViewController = v3;
    [(THGlossaryViewController *)v3 setTransitioningDelegate:self];
    -[self->mGlossaryViewController furtherInitWithGlossaryController:[-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot") glossaryController]];
    [(THGlossaryViewController *)self->mGlossaryViewController setBookViewController:self];
    [(THGlossaryViewController *)self->mGlossaryViewController setModalPresentationStyle:0];
    [(THGlossaryViewController *)self->mGlossaryViewController setOverrideUserInterfaceStyle:1];
    id v4 = [(THGlossaryViewController *)self->mGlossaryViewController glossaryLinkResolver];
    BOOL v5 = [(THBookViewController *)self bookLinkResolver];
    [(THBookLinkResolver *)v5 setGlossaryLinkResolver:v4];
  }
}

- (void)p_showGlossary
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_84234;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Show Glossary", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)showGlossary:(id)a3
{
  if ([(THBookViewController *)self isGlossaryVisible])
  {
    id v4 = [(THGlossaryViewController *)[(THBookViewController *)self glossaryViewController] originalViewController];
    [(THBookViewController *)self hideGlossaryWithDestinationViewController:v4];
  }
  else
  {
    [(THBookViewController *)self dismissTOCGlossaryView:1];
    [(THBookViewController *)self p_ensureGlossaryViewController];
    [(THGlossaryViewController *)[(THBookViewController *)self glossaryViewController] showFirstEntry];
    [(THBookViewController *)self p_showGlossary];
  }
}

- (void)showGlossaryEntry:(id)a3
{
  if (![(THBookViewController *)self isGlossaryVisible]) {
    [(THBookViewController *)self p_showGlossary];
  }
  BOOL v5 = [(THBookViewController *)self glossaryViewController];

  [(THGlossaryViewController *)v5 showEntry:a3];
}

- (void)showGlossaryEntryAtPath:(id)a3
{
  if (![(THBookViewController *)self isGlossaryVisible]) {
    [(THBookViewController *)self p_showGlossary];
  }
  BOOL v5 = [(THBookViewController *)self glossaryViewController];

  [(THGlossaryViewController *)v5 showEntryAtPath:a3];
}

- (void)introMediaControllerMoviePlayerWillShowControls
{
  id v3 = [(THBookViewController *)self visibleViewController];
  if (v3 == (UIViewController *)self->mFlowTocViewController
    || (id v3 = [(THBookViewController *)self visibleViewController],
        v3 == (UIViewController *)self->mChapterBrowserController))
  {
    [(UIViewController *)v3 introMediaControllerMoviePlayerWillShowControls];
  }
}

- (void)introMediaControllerMoviePlayerWillHideControls
{
  id v3 = [(THBookViewController *)self visibleViewController];
  if (v3 == (UIViewController *)self->mFlowTocViewController
    || (id v3 = [(THBookViewController *)self visibleViewController],
        v3 == (UIViewController *)self->mChapterBrowserController))
  {
    [(UIViewController *)v3 introMediaControllerMoviePlayerWillHideControls];
  }
}

- (void)TOCViewControllerDidShowIntroMedia:(id)a3
{
  self->mHasSeenIntroMedia = 1;
}

- (id)TOCViewControllerToolbarBackgroundColor:(id)a3
{
  id v4 = [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar];

  return [(THBookViewController *)self backgroundColorForNavigationBar:v4];
}

- (BOOL)p_shouldShowShroudForVisibleSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (TSUPhoneUI()) {
    return 1;
  }
  objc_msgSend(objc_msgSend(-[THBookViewController view](self, "view"), "window"), "statusBarMinDimension");
  double v8 = v7;
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] paginatedSpreadSize];
  BOOL result = 0;
  if (v9 > 0.0 && width > 0.0) {
    return vabdd_f64(v10 / v9, (height - v8) / width) >= 0.00999999978;
  }
  return result;
}

- (void)p_buildIntroMediaViewController
{
  id v3 = [[THiOSIntroMediaViewController alloc] initWithDocumentRoot:[(THBookViewController *)self documentRoot]];

  [(THBookViewController *)self setIntroMediaViewController:v3];
}

- (id)p_selectedTocViewController
{
  return [(THBookViewController *)self p_selectedTocViewControllerCreateIfNecessary:1];
}

- (id)p_selectedTocViewControllerCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow") & 1) != 0|| -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    if (v3)
    {
      return [(THBookViewController *)self flowTocViewController];
    }
    uint64_t v6 = 64;
    return *(Class *)((char *)&self->super.super.super.isa + v6);
  }
  if (!v3)
  {
    uint64_t v6 = 80;
    return *(Class *)((char *)&self->super.super.super.isa + v6);
  }

  return [(THBookViewController *)self chapterBrowserController];
}

- (id)p_unselectedTocViewController
{
  if ((objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow") & 1) != 0|| -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    return [(THBookViewController *)self chapterBrowserController];
  }
  else
  {
    return [(THBookViewController *)self flowTocViewController];
  }
}

- (void)p_updateTOCForUpcomingPresentationModeChange
{
  id v3 = [(THBookViewController *)self p_selectedTocViewController];

  [(THBookViewController *)self p_removeViewController:v3];
}

- (BOOL)p_introMediaIsUnseenAndSeeable
{
  return !self->mHasSeenIntroMedia;
}

- (void)p_updateTOCForPresentationModeChange
{
  [(THBookViewController *)self p_removeViewController:[(THBookViewController *)self p_unselectedTocViewController]];
  id v3 = [(THBookViewController *)self p_selectedTocViewController];
  if (![(UIViewController *)v3 introMediaViewController]
    && [(THBookViewController *)self introMediaViewController])
  {
    [(UIViewController *)v3 setIntroMediaViewController:[(THBookViewController *)self introMediaViewController] showIt:[(THBookViewController *)self p_introMediaIsUnseenAndSeeable]];
  }
  if ([(THBookViewController *)self shouldKeepTOCInBackground:v3]
    && [(THBookViewController *)self visibleViewController] != v3
    && ![[(UIViewController *)v3 view] superview])
  {
    [(THBookViewController *)self p_addViewControllerInBack:v3];
    [(UIViewController *)v3 setShrouded:1 animated:0 duration:0.0];
  }
  id v4 = [(THBookViewController *)self visibleViewController];
  if (v4 == (UIViewController *)[(THBookViewController *)self documentViewController])
  {
    [(THBookViewController *)self p_setupCanvasExitTransformController];
  }
}

- (void)putTOCInBack
{
  id v3 = [(THBookViewController *)self p_selectedTocViewController];

  [(THBookViewController *)self p_addViewControllerInBack:v3];
}

- (void)showTOC
{
  [(THBookViewController *)self temporarilySetHUDViewHidden:1];
  [(THBookViewController *)self hideNavigationHistory];
  id v3 = [(THBookViewController *)self p_selectedTocViewController];
  id v4 = [(THBookViewController *)self visibleViewController];
  if (v4 == (UIViewController *)[(THBookViewController *)self documentViewController]
    && v3 == [(THBookViewController *)self chapterBrowserController])
  {
    [(THDocumentViewController *)self->mDocumentViewController willStartRevealTOC];
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] zoomOutIfNecessaryPriorToNavigation];
    if (!UIAccessibilityIsSwitchControlRunning() && !UIAccessibilityIsVoiceOverRunning()) {
      [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setNavigationBarHidden:1 animated:1];
    }
    [(THBookViewController *)self p_addViewControllerInBack:[(THBookViewController *)self chapterBrowserController]];
    unint64_t v5 = [(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndex];
    unint64_t v6 = [(THDocumentViewController *)self->mDocumentViewController currentChapter];
    [(THChapterBrowserController *)[(THBookViewController *)self chapterBrowserController] willTransitionFromChapterIndex:v6];
    [(THChapterBrowserController *)[(THBookViewController *)self chapterBrowserController] prepareToScrollToThumbnailAtIndex:v5 chapterIndex:v6];
    [(THChapterBrowserController *)[(THBookViewController *)self chapterBrowserController] hidePageThumbnailAtIndex:v5 chapterIndex:v6 scrollIfNecessary:1];
    [(THChapterBrowserController *)[(THBookViewController *)self chapterBrowserController] scrollToThumbnailAtIndex:v5];
    -[THChapterBrowserController rectForPageThumbnailAtIndex:chapterIndex:inLayer:](-[THBookViewController chapterBrowserController](self, "chapterBrowserController"), "rectForPageThumbnailAtIndex:chapterIndex:inLayer:", v5, v6, objc_msgSend(objc_msgSend(-[THDocumentViewController view](-[THBookViewController documentViewController](self, "documentViewController"), "view"), "superview"), "layer"));
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    [(-[THBookViewController documentViewController](self, "documentViewController"), "canvasScrollView") frame];
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    id v23 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] canvasScrollView];
    if (v23)
    {
      [v23 transform];
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
    }
    [self->mDocumentViewController view].setNeedsLayout;
    [self->mDocumentViewController->view layoutIfNeeded];
    [(THDocumentViewController *)self->mDocumentViewController startRevealTOC];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_84CD0;
    v28[3] = &unk_458468;
    v28[5] = v8;
    v28[6] = v10;
    v28[7] = v12;
    v28[8] = v14;
    v28[9] = v16;
    v28[10] = v18;
    v28[11] = v20;
    v28[12] = v22;
    v28[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_84DCC;
    v24[3] = &unk_458490;
    v24[4] = self;
    v24[5] = v5;
    long long v27 = v31;
    long long v26 = v30;
    long long v25 = v29;
    +[UIView animateWithDuration:0x20000 delay:v28 options:v24 animations:0.300000012 completion:0.0];
    [(THTOCViewController *)v3 setShrouded:0 animated:1 duration:0.300000012];
  }
  else
  {
    [(THTOCViewController *)v3 setShrouded:0 animated:0 duration:0.0];
    [(THBookViewController *)self p_addViewControllerInFront:v3 reason:@"THVantageChangeReasonTransitionToTOC"];
    if ([(THBookViewController *)self isBookEpub]) {
      [(THFlowTOCViewController *)[(THBookViewController *)self flowTocViewController] setReflowablePaginationController:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController]];
    }
  }
  [(THBookViewController *)self dismissTOCGlossaryView:1];
}

- (void)didTransitionFromViewController:(id)a3 toTOCViewController:(id)a4
{
  [(THBookViewController *)self p_addViewControllerInFront:a4 reason:@"THVantageChangeReasonTransitionToTOC"];

  [(THBookViewController *)self p_removeViewController:a3];
}

- (void)removeTOC
{
  id v3 = [(THBookViewController *)self p_selectedTocViewController];
  if (![(THBookViewController *)self shouldKeepTOCInBackground:v3])
  {
    [(THBookViewController *)self p_removeViewController:v3];
  }
}

- (void)hideTOC
{
  id v3 = [(THBookViewController *)self p_selectedTocViewControllerCreateIfNecessary:0];
  if (v3)
  {
    [(THBookViewController *)self p_removeViewController:v3];
  }
}

- (BOOL)shouldKeepTOCInBackground:(id)a3
{
  return a3 && self->mChapterBrowserController == a3;
}

- (BOOL)isTOCButtonApplicable
{
  id v3 = [(THBookViewController *)self visibleViewController];
  return v3 == (UIViewController *)[(THBookViewController *)self documentViewController];
}

- (id)currentPresentationType
{
  id v2 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v2 currentPresentationType];
}

- (void)showFullscreenNotesView:(id)a3
{
}

- (void)showFullscreenNotesView:(id)a3 completion:(id)a4
{
  if ([(THBookViewController *)self isNotesFullscreenVisible]
    || (objc_opt_class(),
        unint64_t v6 = (void *)TSUDynamicCast(),
        [v6 setEnabled:0],
        [(THBookViewController *)self dismissActivePopover],
        [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setOverlayHidden:1 animated:0], ![(THBookViewController *)self notesFullscreenViewController]))
  {
    if (a4)
    {
      uint64_t v7 = (void (*)(id))*((void *)a4 + 2);
      v7(a4);
    }
  }
  else
  {
    [(THNotesViewController *)[(THBookViewController *)self notesFullscreenViewController] setOriginalViewController:[(THBookViewController *)self visibleViewController]];
    [(THNotesViewController *)[(THBookViewController *)self notesFullscreenViewController] updateWithNavigationUnit:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentNavigationUnit]];
    [(THBookViewController *)self vantageWillChangeBy:self reason:@"THVantageChangeReasonTransitionToNotesVC"];
    [(THNotesViewController *)[(THBookViewController *)self notesFullscreenViewController] setModalTransitionStyle:0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_851AC;
    v8[3] = &unk_456E88;
    v8[4] = v6;
    v8[5] = a4;
    [(THBookViewController *)self presentViewController:[(THBookViewController *)self notesFullscreenViewController] animated:1 completion:v8];
    [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonTransitionToNotesVC"];
  }
}

- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 completion:(id)a5
{
}

- (void)hideFullscreenNotesView:(id)a3 andSearchForText:(id)a4 animated:(BOOL)a5 force:(BOOL)a6 completion:(id)a7
{
  if (!self->mHidingNotesVC
    && ((BOOL v8 = a6, v9 = a5, [(THBookViewController *)self isNotesFullscreenVisible]) || v8))
  {
    self->mHidingNotesVC = 1;
    [(THBookViewController *)self vantageWillChangeBy:self reason:@"THVantageChangeReasonTransitionFromStudyVC"];
    if (!a3 || [(THBookViewController *)self documentViewController] == a3) {
      [(THBookViewController *)self p_showDVC];
    }
    else {
      [(THBookViewController *)self p_addViewControllerInFront:a3 reason:@"THVantageChangeReasonTransitionFromStudyVC"];
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_85394;
    v14[3] = &unk_457360;
    v14[4] = self;
    v14[5] = a4;
    v14[6] = a7;
    [(THNotesViewController *)[(THBookViewController *)self notesFullscreenViewController] dismissViewControllerAnimated:v9 completion:v14];
    [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonTransitionFromStudyVC"];
  }
  else if (a7)
  {
    uint64_t v13 = (void (*)(id, void))*((void *)a7 + 2);
    v13(a7, 0);
  }
}

- (BOOL)navigateToAnchorInDVC:(id)a3 pulse:(BOOL)a4
{
  BOOL v4 = a4;
  [(THBookViewController *)self p_showDVC];
  LOBYTE(v4) = [(THBookViewController *)self followAnchor:a3 pulse:v4];
  [self->mDocumentViewController->interactiveCanvasController layoutIfNeeded];
  +[CATransaction flush];
  return v4;
}

- (BOOL)navigateToAnchorInDVC:(id)a3
{
  return [(THBookViewController *)self navigateToAnchorInDVC:a3 pulse:1];
}

- (BOOL)navigateToLinkInDVC:(id)a3
{
  if ([(THBookViewController *)self visibleViewController] == (UIViewController *)self->mChapterBrowserController)
  {
    [(THBookViewController *)self p_insertDVCInBack];
    unint64_t v6 = [(THChapterBrowserController *)self->mChapterBrowserController chapterIndex];
    id v7 = [a3 cachedAbsolutePageIndex];
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL
      || (unint64_t v8 = -[THDocumentNavigationModel navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:](-[THBookViewController navigationModel](self, "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", v7, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "context"))), v8 == 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v9 = [(THBookViewController *)self chapterBrowserController:self->mChapterBrowserController relativePageIndexForLink:a3];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = v9;
      }
    }
    [(THChapterBrowserController *)self->mChapterBrowserController transitionPageToDVC:v8 chapterIndex:v6];
    return 1;
  }
  else
  {
    id v5 = [(THBookLinkResolver *)[(THBookViewController *)self bookLinkResolver] anchorFromAbsoluteLink:a3 presentationType:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentPresentationType]];
    return [(THBookViewController *)self navigateToAnchorInDVC:v5];
  }
}

- (void)navigateFromNotesViewToAnchorInDVC:(id)a3 completion:(id)a4
{
  unsigned __int8 v7 = [(THBookViewController *)self setupLoadSpinner];
  id v8 = [[-[THBookViewController documentRoot](self, "documentRoot")] reflowablePaginationController];
  if (!v8) {
    [(THBookViewController *)self followAnchor:a3 pulse:0];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_856E4;
  v9[3] = &unk_4584B8;
  BOOL v10 = v8 != 0;
  v9[4] = self;
  v9[5] = a3;
  unsigned __int8 v11 = v7;
  v9[6] = a4;
  [(THBookViewController *)self hideFullscreenNotesView:[(THBookViewController *)self visibleViewController] andSearchForText:0 completion:v9];
}

- (BOOL)isStudyViewControllerVisible
{
  unsigned int v3 = [(THiOSStudyViewController *)[(THBookViewController *)self studyViewController] isViewLoaded];
  if (v3) {
    LOBYTE(v3) = [-[THBookViewController studyViewController](self, "studyViewController") view].superview != 0;
  }
  return v3;
}

- (void)loadStudyViewControllerForAnimation:(BOOL)a3
{
  if ([(THBookViewController *)self studyViewController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController loadStudyViewControllerForAnimation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:2572 description:@"expected nil value for '%s'", "self.studyViewController"];
  }
  BOOL v4 = [[THiOSStudyViewController alloc] initWithDocumentRoot:[(THBookViewController *)self documentRoot]];
  [(THiOSStudyViewController *)v4 setTheme:[(THBookViewController *)self theme]];
  [(THiOSStudyViewController *)v4 setDelegate:self];
  [(THBookViewController *)self setStudyViewController:v4];
}

- (void)showStudyCardsForNavigationUnit:(id)a3 useChapterTitle:(id)a4
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:2584 description:@"invalid nil value for '%s'", "navigationUnit"];
  }
  if (![(THBookViewController *)self studyViewController]) {
    [(THBookViewController *)self loadStudyViewControllerForAnimation:0];
  }
  objc_msgSend(objc_msgSend(-[THNotesViewController view](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "view"), "window"), "frame");
  [(-[THBookViewController studyViewController](self, "studyViewController")) view setFrame:v7, v8, v9, v10];
  id v11 = +[NSMutableArray array];
  id v12 = [[[THDocumentViewController documentRoot] documentViewController] glossaryController] model];
  uint64_t v13 = (char *)[v12 entryCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (i = 0; i != v14; ++i)
      [v11 addObject:[v12 entryAtIndex:i]];
  }
  if (!a4 || ![a4 length]) {
    a4 = [(THDocumentNavigationModel *)[(THBookViewController *)self navigationModel] titleStringForNavigationUnit:a3];
  }
  if (![a4 length]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:2614 description:@"no title for current navigation unit"];
  }
  uint64_t v16 = (THBookViewController *)[(THiOSStudyViewController *)[(THBookViewController *)self studyViewController] parentViewController];
  if (v16 != self) {
    [(THNotesViewController *)[(THBookViewController *)self notesFullscreenViewController] addChildViewController:[(THBookViewController *)self studyViewController]];
  }
  if ([(THBookViewController *)self isStudyViewControllerVisible])
  {
    uint64_t v17 = [(THBookViewController *)self studyViewController];
    [(THiOSStudyViewController *)v17 updateWithNavigationUnit:a3 title:a4];
  }
  else
  {
    if (![(THBookViewController *)self isNotesFullscreenVisible]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController showStudyCardsForNavigationUnit:useChapterTitle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:2625 description:@"expect to only navigate to study cards from notes"];
    }
    [(THiOSStudyViewController *)[(THBookViewController *)self studyViewController] updateWithNavigationUnit:a3 title:a4];
    [-[THNotesViewController view](-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController"), "view") addSubview:[-[THBookViewController studyViewController](self, "studyViewController"), "view"]];
    [(THBookViewController *)self p_setVisibleViewControllerToViewController:[(THBookViewController *)self studyViewController] reason:@"THVantageChangeReasonTransitionToStudyVC"];
    if (v16 != self) {
      [(THiOSStudyViewController *)[(THBookViewController *)self studyViewController] didMoveToParentViewController:[(THBookViewController *)self notesFullscreenViewController]];
    }
    uint64_t v18 = [(THBookViewController *)self studyViewController];
    [(THiOSStudyViewController *)v18 transitionInWithCompletion:0];
  }
}

- (void)p_unloadStudyViewController
{
  unsigned int v3 = [(THBookViewController *)self studyViewController];
  [(THiOSStudyViewController *)v3 removeFromParentViewController];
  [(THiOSStudyViewController *)v3 viewWillDisappear:0];
  [v3 view].removeFromSuperview;
  [(THiOSStudyViewController *)v3 viewDidDisappear:0];
  [(THBookViewController *)self setStudyViewController:0];
  UIAccessibilityNotifications v4 = UIAccessibilityScreenChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

- (void)studyViewControllerIsDone:(id)a3
{
  if (![(THBookViewController *)self isStudyViewControllerVisible]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController studyViewControllerIsDone:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:2669 description:@"study view controller needs to be visible when it is closing"];
  }
  UIAccessibilityNotifications v4 = [(THBookViewController *)self studyViewController];
  [(THBookViewController *)self p_setVisibleViewControllerToViewController:[(THBookViewController *)self notesFullscreenViewController] reason:@"THVantageChangeReasonTransitionFromStudyVC"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_85DB4;
  v5[3] = &unk_456DE0;
  v5[4] = self;
  [(THiOSStudyViewController *)v4 transitionOutWithCompletion:v5];
}

- (BOOL)canTrustCalculatedPageNumbers
{
  id v3 = [self documentRoot].reflowablePaginationController;
  if (!v3) {
    return 1;
  }
  UIAccessibilityNotifications v4 = v3;
  [self view].bounds;
  -[THDocumentViewController reflowablePageSizeForViewSize:]([(THBookViewController *)self documentViewController], "reflowablePageSizeForViewSize:", v5, v6);

  return [v4 presentationTypeMatchesPageSize:];
}

- (int64_t)pageNumberForAnnotation:(id)a3
{
  if (![(THBookViewController *)self canTrustCalculatedPageNumbers]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(THBookViewController *)self documentRoot];

  return (int64_t)[v5 absolutePageIndexForAnnotation:a3];
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  if ([(THBookViewController *)self canTrustCalculatedPageNumbers])
  {
    id v5 = [(THBookViewController *)self documentRoot];
    return [v5 pageNumberStringForAnnotation:a3];
  }
  else
  {
    double v7 = (void *)THBundle();
    return [v7 localizedStringForKey:@"-" value:&stru_46D7E8 table:0];
  }
}

- (int64_t)studyViewController:(id)a3 pageNumberForAnnotation:(id)a4
{
  return [(THBookViewController *)self pageNumberForAnnotation:a4];
}

- (id)studyViewController:(id)a3 pageNumberStringForAnnotation:(id)a4
{
  return [(THBookViewController *)self pageNumberStringForAnnotation:a4];
}

- (id)studyViewController:(id)a3 storageForCFI:(id)a4
{
  return [(THBookViewController *)self storageForCFI:a4];
}

- (id)documentViewControllerWithDocument:(id)a3
{
  id v5 = [[THDocumentViewController alloc] initWithDefaultView];
  [(THBookViewController *)self addChildViewController:v5];
  [(THDocumentViewController *)v5 setDocument:a3];
  [(THDocumentViewController *)v5 setDocumentLinkResolver:[[THDocumentLinkResolver alloc] initWithDocumentRoot:[(THDocumentViewController *)v5 documentRoot]]];
  [(THDocumentViewController *)v5 setToolbarDelegate:self];
  [(THDocumentViewController *)v5 setBookNavigationDelegate:self];
  [(THDocumentViewController *)v5 setUserAnnotationDelegate:self];
  [(THDocumentViewController *)v5 setSpinnerProvider:self];
  [(THDocumentViewController *)v5 setBookPropertiesDelegate:self];
  [(THDocumentViewController *)v5 setRevealTOCDelegate:self];
  [(THDocumentViewController *)v5 setThemeDelegate:self];
  [(THDocumentViewController *)v5 setReadingStatisticsDelegate:self];
  [(THDocumentViewController *)v5 setPaginationDelegate:self];
  return v5;
}

+ (BOOL)allBodiesExist:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookViewController allBodiesExist:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:2752 description:@"Invalid parameter not satisfying: %s", "node"];
  }
  objc_opt_class();
  id v5 = (void *)TSUDynamicCast();
  if (!v5)
  {
    objc_opt_class();
    double v7 = (void *)TSUDynamicCast();
    if (v7)
    {
      double v8 = v7;
      double v9 = (char *)[v7 count];
      if (v9)
      {
        double v10 = 0;
        id v11 = v9 - 1;
        do
        {
          unsigned int v6 = [a1 allBodiesExist:[v8 nodeAtIndex:v10]];
          if (!v6) {
            break;
          }
        }
        while (v11 != v10++);
        return v6;
      }
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookViewController allBodiesExist:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"), 2771, @"Unexpected THModelNode class: %@.", objc_msgSend(a3, "description"));
    }
    LOBYTE(v6) = 1;
    return v6;
  }

  LOBYTE(v6) = [v5 nodeBodyExists];
  return v6;
}

- (void)p_kickOffIntroMediaIfNecessary
{
  if ([(THBookViewController *)self introMediaViewController]
    && ![(THBookViewController *)self p_hasDestinationPage]
    && [(THBookViewController *)self p_introMediaIsUnseenAndSeeable])
  {
    [(THiOSIntroMediaViewController *)[(THBookViewController *)self introMediaViewController] ensureReadyToPlay];
    [(THiOSIntroMediaViewController *)[(THBookViewController *)self introMediaViewController] playForBookOpen];
    [(THBookViewController *)self TOCViewControllerDidShowIntroMedia:0];
  }
}

- (void)p_bookContentDidLoad
{
  [(AEAssetOpenAnimating *)[(THBookViewController *)self contentOpenAnimator] bookContentDidLoad];
  [(THBookViewController *)self setContentOpenAnimator:0];
  if ([(THBookViewController *)self snapshotBlock])
  {
    (*((void (**)(void))[(THBookViewController *)self snapshotBlock] + 2))();
    [(THBookViewController *)self setSnapshotBlock:0];
  }
}

- (void)viewsAreReadyForOpenAnimation
{
  if (!self->mHaveCalledDidOpen)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_86368;
    v3[3] = &unk_4577C8;
    v3[4] = self;
    +[THPerformanceRegressionLogger logEventWithBlock:v3];
    self->mHaveCalledDidOpen = 1;
  }
  [(THBookViewController *)self p_bookContentDidLoad];
}

- (void)didLoadBook:(id)a3
{
  [(UIAlertController *)[(THBookViewController *)self fontDownloadAlertController] dismissViewControllerAnimated:1 completion:0];

  [(THBookViewController *)self p_finishBookLoadIfReady];
}

- (void)p_finishBookLoadIfReady
{
  if (objc_msgSend(-[THBookViewController view](self, "view"), "window")
    && [(THBookOpener *)self->mBookOpener isFinished])
  {
    [(THBookViewController *)self p_finishBookLoad];
  }
}

- (void)setPerformanceModeBookOpening:(BOOL)a3
{
  BOOL v3 = a3;
  self->_performanceModeBookOpening = a3;
  UIAccessibilityNotifications v4 = [(THBookViewController *)self documentViewController];

  [(THDocumentViewController *)v4 setPerformanceModeBookOpening:v3];
}

- (void)p_finishBookLoad
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_86AB4;
  v12[3] = &unk_4577C8;
  v12[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v12];
  [(THBookViewController *)self setBookOpenFailed:[(THBookOpener *)self->mBookOpener isSuccessful] ^ 1];
  if (![(THBookViewController *)self bookOpenFailed])
  {
    [+[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:0];
    id v7 = [(THiOSDocument *)self->mDocument documentRoot];
    [v7 setSuppliedAnnotationProvider:[+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin") sharedAnnotationProvider]];
    [v7 documentDidLoad];
    [(THBookViewController *)self setDocumentViewController:[(THBookViewController *)self documentViewControllerWithDocument:self->mDocument]];
    if ([(THBookViewController *)self isBookEpub])
    {
      if ((char *)[(THBookViewController *)self appearanceStyle] == (char *)&dword_0 + 3) {
        int64_t v8 = [+[NSUserDefaults standardUserDefaults] integerForKey:@"THBookViewControllerStyleBeforeAutoNight"];
      }
      else {
        int64_t v8 = [(THBookViewController *)self appearanceStyle];
      }
      [(THBookViewController *)self setStyleBeforeAutoNight:v8];
      if (+[IMTheme isAutoNightModeEnabled]) {
        [(THBookViewController *)self _updateAppearanceFromLightLevelController:+[BCLightLevelController sharedInstance]];
      }
      [(THBookViewController *)self setTheme:[(THBookViewController *)self themeForStyle:[(THBookViewController *)self appearanceStyle]]];
    }
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] pushMinimizeLayoutPadding];
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setPerformanceModeBookOpening:self->_performanceModeBookOpening];
    if ((objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "isEpub") & 1) == 0)
    {
      [(THDocumentLinkResolver *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentLinkResolver] updatePaginationResults];
      objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController"), "updatePaginationResults");
    }
    -[THBookViewController setBookLinkResolver:](self, "setBookLinkResolver:", -[THBookLinkResolver initWithDocumentLinkResolver:glossaryLinkResolver:]([THBookLinkResolver alloc], "initWithDocumentLinkResolver:glossaryLinkResolver:", -[THDocumentViewController documentLinkResolver](-[THBookViewController documentViewController](self, "documentViewController"), "documentLinkResolver"), +[THGlossaryLinkResolver glossaryLinkResolverWithGlossaryController:](THGlossaryLinkResolver, "glossaryLinkResolverWithGlossaryController:", [v7 glossaryController])));
    self->mIsCompleteBook = [objc_opt_class() allBodiesExist:[v7 rootNode]];
    if ([(THBookViewController *)self isCompleteBook])
    {
      id v9 = [v7 tocModel];
      [v9 setBookTitle:[-[THBookViewController bookDescription](self, "bookDescription") bookTitle]];
      [v9 setBookSubtitle:[-[THBookViewController bookDescription](self, "bookDescription") bookSubtitle]];
      [(THBookViewController *)self p_buildIntroMediaViewController];
      [(THBookViewController *)self setBookOpenDestinationIsTOC:[(THBookViewController *)self p_wantsToOpenToTOC]];
      if (![(THBookViewController *)self p_hasDestinationPage])
      {
        if ([(THBookViewController *)self isBookEpub]) {
          [(THBookViewController *)self p_insertDVCInBack];
        }
        [(THBookViewController *)self showTOC];
      }
      if ([(THBookViewController *)self p_restoreToLaunchPage])
      {
        self->mHasSeenIntroMedia = 1;
        [(THBookViewController *)self viewsAreReadyForOpenAnimation];
      }
      else
      {
        [(THBookViewController *)self setBookOpenDestinationIsTOC:1];
        [(THBookViewController *)self showTOC];
      }
      if (![(THBookViewController *)self introMediaViewController]) {
        goto LABEL_32;
      }
      [(THiOSIntroMediaViewController *)[(THBookViewController *)self introMediaViewController] setNeedsMoviePosterForOpenAnimation:[(THBookViewController *)self p_introMediaIsUnseenAndSeeable]];
      [self.p_selectedTocViewController setIntroMediaViewController:[self introMediaViewController] showIt:[self p_introMediaIsUnseenAndSeeable]];
      if ([(THBookViewController *)self openAnimationDidFinish]) {
        [(THBookViewController *)self p_kickOffIntroMediaIfNecessary];
      }
    }
    else
    {
      [(THBookViewController *)self p_showDVC];
      [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setVisibleInfoUpdatesAllowedInLandscape:1];
      [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setAllowPortraitTOC:0];
      -[THDocumentViewController followLink:](-[THBookViewController documentViewController](self, "documentViewController"), "followLink:", [v7 linkForNavigationUnitIndex:0]);
    }
    [(THBookViewController *)self viewsAreReadyForOpenAnimation];
LABEL_32:
    [(THNavigationHistoryStepperController *)[(THBookViewController *)self navigationHistoryStepperController] setPageIndexFormatter:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentRoot]];
    [(THNavigationHistoryStepperController *)[(THBookViewController *)self navigationHistoryStepperController] setBookspotHistoryStack:[(THBookViewController *)self bookspotHistoryStack]];
    [(THBookViewController *)self setBookLoadedSuccessfully:1];
    [(THBookViewController *)self _checkIfScanningReadingStatisticsCanBegin];
    goto LABEL_33;
  }
  BOOL v3 = [(THBookOpener *)self->mBookOpener error];
  UIAccessibilityNotifications v4 = [(NSError *)v3 domain];
  if (!v3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookViewController p_finishBookLoad]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"] lineNumber:2990 description:@"invalid nil value for '%s'", "openError"];
    [(NSString *)v4 isEqualToString:@"ibookserrors"];
LABEL_12:
    [(THBookViewController *)self bookOpenTransitionDidEnd];
    goto LABEL_33;
  }
  id v5 = (char *)[(NSError *)v3 code] + 42597;
  if ([(NSString *)v4 isEqualToString:@"ibookserrors"]) {
    BOOL v6 = (unint64_t)v5 > 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_12;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_86AFC;
  v11[3] = &unk_456DE0;
  v11[4] = self;
  [(THBookViewController *)self closeDocumentWithErrorBlock:v11];
LABEL_33:

  self->mBookOpener = 0;
  [(THBookViewController *)self p_updateToolbarButtonStates];
  [(THBookViewController *)self p_updateFromTheme:0];
  [(THBookViewController *)self performSelector:"viewsAreReadyForOpenAnimation" withObject:0 afterDelay:3.0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_86BC0;
  v10[3] = &unk_4577C8;
  v10[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v10];
}

- (void)p_openBook
{
  if ([(THBookViewController *)self bookDescription]
    && [(THAsset *)[(THBookDescription *)[(THBookViewController *)self bookDescription] asset] assetID])
  {
    if (!self->mDocument)
    {
      if (self->mBookOpener) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_openBook]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:3048 description:@"expected nil value for '%s'", "mBookOpener"];
      }
      BOOL v3 = [[THiOSDocument alloc] initWithBookDescription:[(THBookViewController *)self bookDescription]];
      self->mDocument = v3;
      if (![(THiOSDocument *)v3 context]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_openBook]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:3051 description:@"invalid nil value for '%s'", "mDocument.context"];
      }
      if (![(THiOSDocument *)self->mDocument documentRoot]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController p_openBook]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:3052 description:@"invalid nil value for '%s'", "mDocument.documentRoot"];
      }
      UIAccessibilityNotifications v4 = [[THBookOpener alloc] initWithDocumentRoot:[(THiOSDocument *)self->mDocument documentRoot]];
      self->mBookOpener = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_86E88;
      v5[3] = &unk_456DE0;
      v5[4] = self;
      [(THBookOpener *)v4 setCompletionBlock:v5];
      [+[THBookOpener loadingQueue](THBookOpener, "loadingQueue") addOperation:self->mBookOpener];
    }
  }
  else
  {
    [(THBookViewController *)self closeDocument];
  }
}

- (void)setPageIndexForProofing:(int64_t)a3
{
  if ([(THBookViewController *)self isCompleteBook]) {
    [(THDocumentNavigator *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentNavigator] setVisibleAbsolutePhysicalPageIndex:a3];
  }
  else {
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setCurrentNavigationUnit:[(NSArray *)[(THDocumentNavigationModel *)[(THBookViewController *)self navigationModel] navigationUnits] objectAtIndex:0] withRelativePageIndex:a3 animated:0];
  }
  id v5 = [(THBookViewController *)self documentViewController];

  [(THDocumentViewController *)v5 updateVisibleInfos];
}

- (unint64_t)absolutePageIndexForTileEntry:(id)a3
{
  if (![(THReflowablePaginationController *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController] paginationComplete])return 0x7FFFFFFFFFFFFFFFLL; {
  id v5 = [(THBookViewController *)self documentNavigator];
  }
  id v6 = [a3 modelLink];

  return [(THDocumentNavigator *)v5 absolutePageIndexForLink:v6];
}

- (unint64_t)maxAbsolutePageIndexForNodeAtTileEntry:(id)a3
{
  if (![(THReflowablePaginationController *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController] paginationComplete])return 0x7FFFFFFFFFFFFFFFLL; {
  id v5 = objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForGUID:", objc_msgSend(a3, "nodeGUID"));
  }
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = [(THReflowablePaginationController *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController] paginationResultForContentNode:v5];
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    int64_t v8 = v6;
    if ([v6 firstPageIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = [v8 firstPageIndex];
      return (unint64_t)v9 + (void)[v8 pageCount];
    }
  }
  return v7;
}

- (void)showPageForModelLink:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(THBookViewController *)self recordOutgoingMajorNavigationJump];
  [(THBookViewController *)self p_showDVCAnimated:v4 withLink:a3];

  [(THBookViewController *)self recordCurrentLocationInHistory];
}

- (void)p_alertUserAboutDenyingBookmarkEditing
{
  id v3 = [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0];
  id v4 = [(id)THBundle() localizedStringForKey:@"Not Now" value:&stru_46D7E8 table:0];
  id v5 = [(id)THBundle() localizedStringForKey:@"New Version Available" value:&stru_46D7E8 table:0];
  id v6 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, [(id)THBundle() localizedStringForKey:@"You won\\U2019t be able to delete bookmarks until you update this book." value:&stru_46D7E8 table:0], 1);
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook")) {
    id v7 = v4;
  }
  else {
    id v7 = v3;
  }
  [(UIAlertController *)v6 addAction:+[UIAlertAction actionWithTitle:v7 style:1 handler:0]];
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_872C4;
    v8[3] = &unk_457310;
    v8[4] = self;
    -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"Update" value:&stru_46D7E8 table:0], 0, v8));
  }
  [(THBookViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)p_alertUserAboutAnnotationBehavior
{
  id v3 = [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0];
  id v4 = [(id)THBundle() localizedStringForKey:@"Not Now" value:&stru_46D7E8 table:0];
  id v5 = [(id)THBundle() localizedStringForKey:@"New Version Available" value:&stru_46D7E8 table:0];
  id v6 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, [(id)THBundle() localizedStringForKey:@"You won\\U2019t be able to add notes, highlights or bookmarks until you update this book.", &stru_46D7E8, 0 value table], 1);
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook")) {
    id v7 = v4;
  }
  else {
    id v7 = v3;
  }
  [(UIAlertController *)v6 addAction:+[UIAlertAction actionWithTitle:v7 style:1 handler:0]];
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_8747C;
    v8[3] = &unk_457310;
    v8[4] = self;
    -[UIAlertController addAction:](v6, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"Update" value:&stru_46D7E8 table:0], 0, v8));
  }
  [(THBookViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)p_alertUserAboutFontDownload
{
  id v3 = [(id)THBundle() localizedStringForKey:@"Downloading Fonts" value:&stru_46D7E8 table:0];
  -[THBookViewController setFontDownloadAlertController:](self, "setFontDownloadAlertController:", +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, [(id)THBundle() localizedStringForKey:@"This book will open when the download is complete." value:&stru_46D7E8 table:0], 1));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_87618;
  v4[3] = &unk_457310;
  v4[4] = self;
  -[UIAlertController addAction:](-[THBookViewController fontDownloadAlertController](self, "fontDownloadAlertController"), "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"Cancel" value:&stru_46D7E8 table:0], 0, v4));
  -[UIAlertController addAction:](-[THBookViewController fontDownloadAlertController](self, "fontDownloadAlertController"), "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0], 1, 0));
  [(THBookViewController *)self presentViewController:[(THBookViewController *)self fontDownloadAlertController] animated:1 completion:0];
}

- (void)p_alertUserAboutRetinaUpdate
{
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    id v3 = [(id)THBundle() localizedStringForKey:@"Not Now" value:&stru_46D7E8 table:0];
    id v4 = [(id)THBundle() localizedStringForKey:@"Retina Update Available" value:&stru_46D7E8 table:0];
    id v5 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, [(id)THBundle() localizedStringForKey:@"Update this book to get enhanced graphics for your device\\U2019s Retina display." value:&stru_46D7E8 table:0], 1);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_87804;
    v7[3] = &unk_457310;
    v7[4] = self;
    [(UIAlertController *)v5 addAction:+[UIAlertAction actionWithTitle:v3 style:1 handler:v7]];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8780C;
    v6[3] = &unk_457310;
    v6[4] = self;
    -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"Update" value:&stru_46D7E8 table:0], 0, v6));
    [(THBookViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (BOOL)p_shouldAlertAboutRetinaUpdate
{
  unsigned int v3 = [self documentRoot].isStoreBook;
  if (v3)
  {
    id v4 = [+[NSUserDefaults standardUserDefaults] objectForKey:[(THBookViewController *)self p_retinaUpdateAlertDateKey]];
    if (v4) {
      LOBYTE(v3) = [v4 compare:[NSDate date]] == (id)-1;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)p_closeBookAndGoToStorePageForBook
{
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    id v3 = [[AEAssetEngine storeMgr] clientApplicationController];
    id v4 = [[self documentRoot] storeItemID];
    [v3 openEBookProductPageForStoreID:v4];
  }
}

- (id)p_retinaUpdateAlertDateKey
{
  id v2 = [self documentRoot].storeItemID;

  return [@"kTHRetinaUpdateAlertNextDate" stringByAppendingString:v2];
}

- (id)p_retinaUpdateAlertAttemptsKey
{
  id v2 = [self documentRoot].storeItemID;

  return [@"kTHRetinaUpdateAlertNumberOfAttempts" stringByAppendingString:v2];
}

- (void)p_postponeAlertForRetinaUpdate
{
  if (!objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook")) {
    return;
  }
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [(THBookViewController *)self p_retinaUpdateAlertDateKey];
  id v5 = [(THBookViewController *)self p_retinaUpdateAlertAttemptsKey];
  id v6 = [(NSUserDefaults *)v3 integerForKey:v5];
  id v7 = v6;
  if (!v6)
  {
    double v8 = 14400.0;
    goto LABEL_11;
  }
  if ((unint64_t)v6 < 3)
  {
    double v8 = 86400.0;
LABEL_11:
    id v9 = +[NSDate dateWithTimeIntervalSinceNow:v8];
    [(NSUserDefaults *)v3 setInteger:v7 + 1 forKey:v5];
    goto LABEL_12;
  }
  double v8 = 604800.0;
  if (v6 != (unsigned char *)&dword_0 + 3) {
    double v8 = 0.0;
  }
  if ((uint64_t)v6 < 4) {
    goto LABEL_11;
  }
  id v9 = +[NSDate distantFuture];
  [(NSUserDefaults *)v3 removeObjectForKey:v5];
LABEL_12:
  [(NSUserDefaults *)v3 setObject:v9 forKey:v4];

  [(NSUserDefaults *)v3 synchronize];
}

- (void)p_closeBookAndGoToStoreForRetinaUpdate
{
  if (objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "isStoreBook"))
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    id v4 = [self documentRoot].storeItemID;
    [(NSUserDefaults *)v3 removeObjectForKey:[(THBookViewController *)self p_retinaUpdateAlertDateKey]];
    [(NSUserDefaults *)v3 removeObjectForKey:[(THBookViewController *)self p_retinaUpdateAlertAttemptsKey]];
    [(NSUserDefaults *)v3 synchronize];
    id v5 = [[AEAssetEngine storeMgr] clientApplicationController];
    [v5 openEBookProductPageForStoreID:v4];
  }
}

- (int64_t)readerType
{
  return 2;
}

- (AEAsset)asset
{
  BOOL result = (AEAsset *)self->mBookDescription;
  if (result) {
    return (AEAsset *)[(AEAsset *)result asset];
  }
  return result;
}

- (void)assetViewControllerPrepareForReload
{
  id v2 = [(-[THDocumentViewController documentViewController](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot")) annotationController];

  [v2 setPlaceholder:0 pageHistoryDictionary:0 withContentNode:0];
}

- (void)open:(BOOL)a3
{
  BOOL v3 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_87CEC;
  v5[3] = &unk_4577C8;
  v5[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v5];
  [(THBookViewController *)self runPreloadOptimizations];
  if (![(THBookViewController *)self bookDescription]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THBookViewController open:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"] lineNumber:3328 description:@"Invalid parameter not satisfying: %s", @"self.bookDescription != nil"];
  }
  [+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin") willOpenBook:self];
  [(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] assetViewController:self willOpen:v3];
  [(THBookViewController *)self p_openBook];
}

- (BOOL)p_jumpToLocation:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v5 = [a3 performSelector:"cfiString"];
    if (v5)
    {
      return [(THBookViewController *)self p_jumpToBKCFIString:v5];
    }
    return 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [a3 performSelector:"anchor"];
    if (!v7) {
      return 0;
    }
    return [(THBookViewController *)self p_jumpToFragment:v7];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
    id v8 = [a3 performSelector:"pageOffset"];
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    id v9 = [[THPageLocation alloc] initWithAbsolutePageIndex:v8];
    return [(THBookViewController *)self jumpToPageLocation:v9 touchHistory:1 minor:0];
  }
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(THBookViewController *)self setOpeningCFIOverride:0];
  [(THBookViewController *)self setOpeningFragmentOverride:0];
  [(THBookViewController *)self setOpeningAbsolutePageIndexOverride:0x7FFFFFFFFFFFFFFFLL];
  [(THBookViewController *)self setOpeningLocationOverride:0];
  if (objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "existingBookViewControllerForDocumentRoot:", -[THBookViewController documentRoot](self, "documentRoot")))
  {
    if ([(THBookViewController *)self documentViewController])
    {
      if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView])
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_880A4;
        v7[3] = &unk_456E38;
        v7[4] = self;
        void v7[5] = a3;
        [(THWExpandedViewController *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] expandedViewController] dismissExpandedAnimatedWithCompletionBlock:v7];
      }
      else
      {
        [(THBookViewController *)self p_jumpToLocation:a3];
      }
    }
    else
    {
      [(THBookViewController *)self setOpeningLocationOverride:a3];
    }
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      -[THBookViewController setOpeningCFIOverride:](self, "setOpeningCFIOverride:", [a3 performSelector:"cfiString"]);
    }
    else if (objc_opt_respondsToSelector())
    {
      -[THBookViewController setOpeningFragmentOverride:](self, "setOpeningFragmentOverride:", [a3 performSelector:"anchor"]);
    }
    else if (objc_opt_respondsToSelector())
    {
      -[THBookViewController setOpeningAbsolutePageIndexOverride:](self, "setOpeningAbsolutePageIndexOverride:", [a3 performSelector:"pageOffset"]);
    }
    [(THBookViewController *)self open:v4];
  }
}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  [(THBookViewController *)self setPerformanceModeBookOpening:0];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] popMinimizeLayoutPadding];
  [+[TSWPLoadableFonts sharedInstance] resumeBackgroundLoading];
  [(THBookViewController *)self p_kickOffIntroMediaIfNecessary];
  self->mOpenAnimationDidFinish = 1;
  if ([(THBookViewController *)self openingCFIOverride])
  {
    [(THBookViewController *)self p_jumpToBKCFIString:[(THBookViewController *)self openingCFIOverride]];
    [(THBookViewController *)self setOpeningCFIOverride:0];
  }
  [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonBookOpen"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8828C;
  v6[3] = &unk_4577C8;
  v6[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v6];
  if (![-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot") annotationController]){
  id v4 = [[-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot] properties];
  }
  if (objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController")&& !-[THBookViewController isAnnotationWriteEnabled](self, "isAnnotationWriteEnabled"))
  {
    [(THBookViewController *)self p_alertUserAboutAnnotationBehavior];
  }
  else if ([v4 wasThinned])
  {
    TSUScreenScale();
    if (v5 > 1.0)
    {
      if ([(THBookViewController *)self p_shouldAlertAboutRetinaUpdate]) {
        [(THBookViewController *)self p_alertUserAboutRetinaUpdate];
      }
    }
  }
}

- (void)assetViewControllerUpdateToolbars
{
  id v3 = [(THBookViewController *)self traitCollection];

  [(THBookViewController *)self p_updateToolbarButtonStatesWithTraits:v3];
}

- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation
{
  if ([(THBookViewController *)self isBookEpub])
  {
    if ([(THBookViewController *)self isToolbarHidden])
    {
      id v3 = +[BRCConfigurationManager sharedInstance];
      if (objc_msgSend(-[BRCConfigurationManager valueForKey:fromNamespace:](v3, "valueForKey:fromNamespace:", BRCBooksDefaultsKeyReadingExperienceSamplesShowChromeOnOpen, BRCBooksDefaultsNamespace), "BOOLValue"))
      {
        if ([(THBookViewController *)self p_isSampleBook])
        {
          id v4 = [(THBookViewController *)self documentViewController];
          if (![(THDocumentViewController *)v4 showingExpandedWidgetView])
          {
            [(THDocumentViewController *)v4 showToolbarAnimated:1];
            double v5 = [(THBookViewController *)self navigationBarController];
            [(THNavigationBarController *)v5 clearAutohideTimer];
          }
        }
      }
    }
  }
}

- (void)closeDocumentWithReadLock:(id)a3
{
  id v4 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentRoot];
  self->mIsClosing = 1;
  id v5 = [v4 context];
  id v6 = v5;
  [v4 willClose];
  [+[TSWPLoadableFonts sharedInstance] pauseBackgroundLoading];
  -[TSWPLoadableFonts unregisterFontsForGroup:](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "unregisterFontsForGroup:", objc_msgSend(objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID"));
  [(THFlowTOCViewController *)self->mFlowTocViewController setReflowablePaginationController:0];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setDocument:0];

  id v7 = +[THApplePubAssetPlugin sharedPlugin];

  [v7 didCloseBook:self];
}

- (void)p_cancelBookOpen
{
  mBookOpener = self->mBookOpener;
  if (mBookOpener)
  {
    [(THBookOpener *)mBookOpener cancel];

    self->mBookOpener = 0;
  }
}

- (void)close:(BOOL)a3
{
  BOOL v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"pAutoHideNavOverlay" object:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_88670;
  v7[3] = &unk_4577C8;
  v7[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v7];
  [(THBookViewController *)self dismissActivePopover];
  [(THBookViewController *)self hideFullscreenNotesView:[(THBookViewController *)self visibleViewController] andSearchForText:0 animated:0 force:0 completion:0];
  [(THBookViewController *)self hideGlossaryWithDestinationViewController:[(THBookViewController *)self visibleViewController] animated:0 completion:0];
  [(THWAutoplayController *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] autoplayController] stop];
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] clearAutohideTimer];
  id v5 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentRoot];
  objc_msgSend(objc_msgSend(v5, "userDataManager"), "save:", objc_msgSend(v5, "moc"));
  id v6 = [(THBookViewController *)self visibleViewController];
  if (v6 == (UIViewController *)[(THBookViewController *)self documentViewController]) {
    [(THBookViewController *)self hideTOC];
  }
  [(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] assetViewController:self willClose:v3];
  [+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin") willCloseBook:self];
}

- (void)requestClose:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookViewController *)self assetViewControllerDelegate];

  [(AEAssetViewControllerDelegate *)v5 assetViewController:self requestClose:v3 error:0];
}

- (void)_teardown
{
  if (!self->mTornDown)
  {
    self->mTornDown = 1;
    self->mIsClosing = 1;
    [(THBookViewController *)self p_cancelBookOpen];
    [(THBookViewController *)self hideTOC];
    [(THTOCViewController *)self->mChapterBrowserController setDelegate:0];
    [(THBookViewController *)self setChapterBrowserController:0];
    [(THGlossaryViewController *)[(THBookViewController *)self glossaryViewController] unload];
    id v3 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentRoot];
    if (v3)
    {
      id v4 = v3;
      [v3 cancelApplePubRead];
      id v5 = [v4 accessController];
      id v6 = v5;
      [v5 performRead:"closeDocumentWithReadLock:" withTarget:self argument:0];
    }
    [(THBookViewController *)self setBookDescription:0];
    id v7 = [(THBookViewController *)self documentViewController];
    [(THBookViewController *)self p_removeViewController:v7];
  }
}

- (void)saveStateClosing:(BOOL)a3
{
}

- (BOOL)dismissShouldBegin:(id)a3
{
  [a3 velocity];
  double v6 = v5;
  [a3 velocity];
  if (v6 >= v7) {
    return 0;
  }
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] inFlowMode])
  {
    return 0;
  }
  id v9 = [(THBookViewController *)self visibleViewController];
  if (v9 == (UIViewController *)[(THBookViewController *)self documentViewController]
    && [(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView])
  {
    return 0;
  }

  return [a3 proposedBeginState];
}

- (void)assetViewControllerReadyToAnswerReadingStatisticsQueries
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_88934;
  block[3] = &unk_456DE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)assetViewControllerViewForLiveResizeSnapshot
{
  id v3 = [(THBookViewController *)self visibleViewController];
  if (v3 == (UIViewController *)[(THBookViewController *)self documentViewController])
  {
    id v6 = [self documentViewController].canvasViewController.canvasView;
    return [v6 enclosingScrollView];
  }
  else
  {
    id v4 = [(THBookViewController *)self visibleViewController];
    return [(UIViewController *)v4 view];
  }
}

- (BOOL)snapshotDuringLiveResize
{
  return 1;
}

- (BOOL)aspectFitDuringLiveResize
{
  return ![(THBookViewController *)self isBookEpub];
}

- (id)overlayViewColorForLiveResize
{
  if ([(THBookViewController *)self isBookEpub])
  {
    id v3 = [(THBookViewController *)self theme];
    id v4 = [[-[THBookViewController view](self, "view")] traitCollection];
    return [(THTheme *)v3 backgroundColorForTraitCollection:v4];
  }
  else
  {
    return +[UIColor whiteColor];
  }
}

- (void)loadMetadata
{
}

- (void)paginationDidComplete
{
  if ([(THBookViewController *)self _inAnalyticsReadSession]
    && ![(THBookViewController *)self analyticsReadStartProgress])
  {
    id v3 = [(THBookViewController *)self _analyticsReadingProgress];
    [(THBookViewController *)self setAnalyticsReadStartProgress:v3];
  }
}

- (void)documentViewController:(id)a3 didChangePaginationStatus:(BOOL)a4
{
}

- (BOOL)p_shouldSendVantageChangedNotificationWithReason:(id)a3
{
  BOOL result = 0;
  if (![(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView])
  {
    if (![a3 isEqualToString:@"THVantageChangeReasonRotation"]) {
      return 1;
    }
    if (![(THBookViewController *)self isNotesFullscreenVisible]
      && ![(THBookViewController *)self isGlossaryVisible]
      && ![(THBookViewController *)self isStudyViewControllerVisible])
    {
      double v5 = [(THBookViewController *)self documentViewController];
      if (v5 == (THDocumentViewController *)[(THBookViewController *)self visibleViewController])return 1; {
    }
      }
  }
  return result;
}

- (void)vantageWillChangeBy:(id)a3 reason:(id)a4
{
  if ([(THBookViewController *)self p_shouldSendVantageChangedNotificationWithReason:a4])
  {
    CFStringRef v7 = @"THVantageChangeReason";
    id v8 = a4;
    [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") postNotificationName:@"THVantageWillChangeNotification" object:a3 userInfo:+[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1]];
  }
  if ([a4 isEqualToString:@"THVantageChangeReasonPresentationMode"]) {
    [(THBookViewController *)self p_updateTOCForUpcomingPresentationModeChange];
  }
}

- (void)vantageChangeWasCancelledBy:(id)a3 reason:(id)a4
{
  if ([(THBookViewController *)self p_shouldSendVantageChangedNotificationWithReason:a4])
  {
    CFStringRef v6 = @"THVantageChangeReason";
    id v7 = a4;
    [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") postNotificationName:@"THVantageChangeWasCancelledNotification" object:a3 userInfo:+[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]];
  }
}

- (void)vantageDidChangeBy:(id)a3 reason:(id)a4
{
  if ([(THBookViewController *)self p_shouldSendVantageChangedNotificationWithReason:a4])
  {
    CFStringRef v7 = @"THVantageChangeReason";
    id v8 = a4;
    [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") postNotificationName:@"THVantageDidChangeNotification" object:a3 userInfo:+[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1]];
  }
  if ([a4 isEqualToString:@"THVantageChangeReasonPresentationMode"]) {
    [(THBookViewController *)self p_updateTOCForPresentationModeChange];
  }
  [(THBookViewController *)self p_placeholderLocationDidChange];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (BOOL)bookIsPaginatedForPortrait
{
  id v3 = [(THBookViewController *)self bookDescription];
  if (v3) {
    LOBYTE(v3) = [(THBookDescription *)[(THBookViewController *)self bookDescription] orientationLock] == 1;
  }
  return (char)v3;
}

- (BOOL)bookIsPaginatedForLandscape
{
  return ![(THBookViewController *)self bookIsPaginatedForPortrait];
}

- (BOOL)allowCopy
{
  id v2 = [(THBookViewController *)self bookDescription];

  return [(THBookDescription *)v2 allowCopy];
}

- (id)activityItemProviderWithCachedAnnotation:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return [v4 activityItemProviderWithAnnotation:a3];
}

- (id)activityItemProviderWithCachedAnnotations:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return [v4 activityItemProviderWithAnnotations:a3];
}

- (id)htmlGeneratorWithAnnotations:(id)a3
{
  id v5 = objc_alloc_init((Class)AEAnnotationGroupHTMLGenerator);
  CFStringRef v6 = [(THBookViewController *)self bookDescription];
  id v7 = [self documentRoot].bookMetadata;
  [v5 setDataSource:self];
  [v5 setStoreId:[self storeID]];
  id v8 = (NSString *)[v7 objectForKey:@"itemName"];
  if (!v8) {
    id v8 = [(THBookDescription *)v6 bookTitle];
  }
  [v5 setTitle:v8];
  id v9 = (NSString *)[v7 objectForKey:@"artistName"];
  if (!v9) {
    id v9 = [(THBookDescription *)v6 bookAuthor];
  }
  [v5 setAuthor:v9];
  [v5 setPublisherName:[v7 objectForKey:@"publisher"]];
  [v5 setPublisherYear:[-[THBookViewController documentRoot](self, "documentRoot") yearFromReleaseDate]];
  [v5 setContentProtected:[-[THBookDescription drmContext](v6, "drmContext") kiUanAfQBD5qIUraolUj]];
  [v5 setCitationsAllowed:[self allowCopy]];
  [v5 setAnnotations:a3];
  return v5;
}

- (id)annotationID
{
  id v2 = [self documentRoot].bookDescription;

  return [v2 annotationID];
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  BOOL v4 = a4;
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] zoomOutIfNecessaryPriorToNavigation];
  if ([a3 contentNode])
  {
    if ([(THBookViewController *)self isGlossaryVisible])
    {
      if (![(THGlossaryViewController *)[(THBookViewController *)self glossaryViewController] shouldDismissAfterRotate])
      {
        [(THBookViewController *)self p_showDVC];
        [(THBookViewController *)self hideGlossaryWithDestinationViewController:[(THBookViewController *)self visibleViewController]];
      }
    }
    else
    {
      [(THBookViewController *)self p_showDVC];
    }
    id v8 = [(THBookViewController *)self documentViewController];
  }
  else
  {
    id v7 = [a3 glossaryEntry];
    if (!v7) {
      return (char)v7;
    }
    [(THBookViewController *)self p_showGlossary];
    id v8 = [(THBookViewController *)self glossaryViewController];
  }

  LOBYTE(v7) = [(THDocumentViewController *)v8 followAnchor:a3 pulse:v4];
  return (char)v7;
}

- (void)willFollowAnchor:(id)a3 pulse:(BOOL)a4
{
  if ([a3 contentNode])
  {
    id v5 = [(THBookViewController *)self visibleViewController];
    if (v5 != (UIViewController *)[(THBookViewController *)self documentViewController])
    {
      [(THBookViewController *)self p_showDVC];
    }
  }
}

- (BOOL)followLink:(id)a3
{
  return [(THBookViewController *)self followLink:a3 animated:1];
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(THBookViewController *)self anchorFromLink:a3];
  BOOL v7 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:v4];
  LOBYTE(v4) = [(THBookViewController *)self followAnchor:v6 pulse:1];
  +[UIView setAnimationsEnabled:v7];
  return v4;
}

- (id)anchorFromLink:(id)a3
{
  id v5 = [(THBookViewController *)self bookLinkResolver];
  id v6 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentPresentationType];

  return [(THBookLinkResolver *)v5 anchorFromAbsoluteLink:a3 presentationType:v6];
}

- (void)followAbsolutePageIndex:(unint64_t)a3
{
  [(THBookViewController *)self p_showDVC];
  [(THBookViewController *)self hideGlossaryWithDestinationViewController:[(THBookViewController *)self visibleViewController]];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] followAbsolutePageIndex:a3];
  [self->mDocumentViewController->interactiveCanvasController layoutIfNeeded];

  +[CATransaction flush];
}

- (BOOL)isNotesFullscreenVisible
{
  if (self->mNotesFullscreenViewController
    && ![(THBookViewController *)self isStudyViewControllerVisible])
  {
    unsigned int v3 = [(THNotesViewController *)[(THBookViewController *)self notesFullscreenViewController] isViewLoaded];
    if (v3) {
      LOBYTE(v3) = [[-[THBookViewController notesFullscreenViewController](self, "notesFullscreenViewController") view] superview] != 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isGlossaryVisible
{
  unsigned int v3 = [(THBookViewController *)self glossaryViewController];
  if (v3)
  {
    BOOL v4 = [(THBookViewController *)self glossaryViewController];
    LOBYTE(v3) = [(THGlossaryViewController *)v4 isGlossaryVisible];
  }
  return (char)v3;
}

- (BOOL)isTOCVisible
{
  unsigned int v3 = [(THBookViewController *)self visibleViewController];
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3 == (THiOSFlowToCTableViewController *)self->mFlowTocViewController
    || v3 == (THiOSFlowToCTableViewController *)self->mChapterBrowserController
    || v3 == self->mFlowToCTableViewController;
  if ([(THBookViewController *)self isGlossaryVisible]
    || [(THBookViewController *)self isNotesFullscreenVisible]
    || [(THBookViewController *)self isStudyViewControllerVisible])
  {
    return 0;
  }
  return v4;
}

- (BOOL)isGlossaryPresenting
{
  BOOL v3 = [(THBookViewController *)self presentingGlossary];
  if (v3) {
    LOBYTE(v3) = [(THBookViewController *)self glossaryViewController] != 0;
  }
  return v3;
}

- (THBookLinkResolver)bookLinkResolver
{
  return self->mBookLinkResolver;
}

- (void)willJumpToPageLocation:(id)a3
{
  [(THBookViewController *)self vantageWillChangeBy:self reason:@"THVantageChangeReasonNavigation"];

  [(THBookViewController *)self p_showDVC];
}

- (void)didJumpToPageLocation:(id)a3
{
  [self->mDocumentViewController->interactiveCanvasController layoutIfNeeded];
  +[CATransaction flush];

  [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonNavigation"];
}

- (void)showBookmarksView:(id)a3
{
}

- (void)books_setThemeWhite:(id)a3
{
}

- (void)books_setThemeSepia:(id)a3
{
}

- (void)books_setThemeGray:(id)a3
{
}

- (void)books_setThemeNight:(id)a3
{
}

- (BOOL)canIncreaseFontSize
{
  BOOL v3 = [(THBookViewController *)self displaySettingsViewController];

  return [(THBookViewController *)self shouldShowFontResizeControls:v3];
}

- (BOOL)canDecreaseFontSize
{
  BOOL v3 = [(THBookViewController *)self displaySettingsViewController];

  return [(THBookViewController *)self shouldShowFontResizeControls:v3];
}

- (void)increaseFontSize:(id)a3
{
  [(THBookViewController *)self p_setupDisplaySettingsIfNeeded];
  [(THDisplaySettingsViewController *)[(THBookViewController *)self displaySettingsViewController] increaseFontSize:self];

  [(THBookViewController *)self setDisplaySettingsViewController:0];
}

- (void)decreaseFontSize:(id)a3
{
  [(THBookViewController *)self p_setupDisplaySettingsIfNeeded];
  [(THDisplaySettingsViewController *)[(THBookViewController *)self displaySettingsViewController] decreaseFontSize:self];

  [(THBookViewController *)self setDisplaySettingsViewController:0];
}

- (void)navigateToSearchResult:(id)a3
{
}

- (void)searchFinished:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if ([(THBookViewController *)self p_isSearchVisible])
  {
    [(THBookViewController *)self dismissSearchPopover:v5 completion:a4];
  }
}

- (BOOL)canRevealTOC
{
  BOOL v3 = [(THBookViewController *)self p_selectedTocViewController];
  mChapterBrowserController = self->mChapterBrowserController;
  [self view].bounds
  double v5 = 1.0;
  if (v6 > 0.0)
  {
    [self view].bounds
    double v8 = v7;
    [self view].bounds
    double v5 = v8 / v9;
  }
  if (v3 != mChapterBrowserController) {
    return 0;
  }
  if (TSUPhoneUI()) {
    return 1;
  }
  BOOL result = [(THBookViewController *)self im_isCompactWidth];
  if (v5 >= 0.5) {
    return 0;
  }
  return result;
}

- (void)willRevealTOC
{
  [(THDocumentViewController *)self->mDocumentViewController willStartRevealTOC];
  unint64_t v3 = [(THDocumentViewController *)self->mDocumentViewController currentChapter];
  unint64_t v4 = [(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController willRevealTOC]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:4174 description:@"Current page index is bogus"];
  }
  [(THChapterBrowserController *)self->mChapterBrowserController setIsPinchingDownFromCanvas:1];
  [(THChapterBrowserController *)self->mChapterBrowserController setChapterIndex:v3];
  [(THTOCViewController *)self->mChapterBrowserController setShroudedFraction:1.0];
  [(THBookViewController *)self p_addViewControllerInBack:self->mChapterBrowserController];
  [(THChapterBrowserController *)self->mChapterBrowserController willTransitionFromChapterIndex:v3];
  [(THChapterBrowserController *)self->mChapterBrowserController hidePageThumbnailAtIndex:v4 chapterIndex:v3 scrollIfNecessary:1];
  [(THChapterBrowserController *)self->mChapterBrowserController scrollToThumbnailAtIndex:[(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndex]];
  mDocumentViewController = self->mDocumentViewController;

  [(THDocumentViewController *)mDocumentViewController startRevealTOC];
}

- (CGRect)pageTargetRectForRevealingTOC
{
  mChapterBrowserController = self->mChapterBrowserController;
  unint64_t v4 = [(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndex];
  id v5 = [[self unmovingViewForRevealingTOC] layer];

  [(THChapterBrowserController *)mChapterBrowserController rectForPageThumbnailAtIndex:v4 inLayer:v5];
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)revealTOCByAmount:(double)a3
{
}

- (void)revealTOCAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  [(THDocumentViewController *)self->mDocumentViewController showPageThumbnailsForPageIndexes:+[NSIndexSet indexSetWithIndex:[(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndex]] animated:1 duration:a4];
  mChapterBrowserController = self->mChapterBrowserController;

  [(THTOCViewController *)mChapterBrowserController setShrouded:0 animated:v5 duration:a4];
}

- (void)unrevealTOCAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  -[THDocumentViewController hidePageThumbnailsAnimated:duration:](self->mDocumentViewController, "hidePageThumbnailsAnimated:duration:");
  mChapterBrowserController = self->mChapterBrowserController;

  [(THTOCViewController *)mChapterBrowserController setShrouded:1 animated:v5 duration:a4];
}

- (void)didRevealTOC
{
  [(THBookViewController *)self dismissActivePopover];
  if (![(THChapterBrowserController *)self->mChapterBrowserController paginatedTOCShowsStatusBar]&& ![(THBookViewController *)self isToolbarHidden])
  {
    [(THBookViewController *)self hideToolbarAnimated:1];
  }
  [(THBookViewController *)self refreshStatusBarAppearance];
  [(THChapterBrowserController *)self->mChapterBrowserController didTransitionFromCanvas];
  [(THTOCViewControllerDelegate *)[(THTOCViewController *)self->mChapterBrowserController delegate] didTransitionFromViewController:[(THDocumentViewController *)self->mDocumentViewController canvasViewController] toTOCViewController:self->mChapterBrowserController];
  [self->mDocumentViewController->view removeFromSuperview];
  [(THDocumentViewController *)self->mDocumentViewController setVisibleInfoUpdatesAllowedInLandscape:0];
  [(THDocumentViewController *)self->mDocumentViewController hidePageThumbnailsAnimated:0 duration:0.0];

  [(THBookViewController *)self recordOutgoingMajorNavigationJump];
}

- (void)endRevealTOC
{
  [(THChapterBrowserController *)self->mChapterBrowserController showPageThumbnailAtIndex:[(THDocumentViewController *)self->mDocumentViewController currentRelativePageIndex]];
  mDocumentViewController = self->mDocumentViewController;

  [(THDocumentViewController *)mDocumentViewController endRevealTOC];
}

- (void)viewsDidResize
{
  unint64_t v3 = [(THBookViewController *)self assetViewControllerDelegate];

  [(AEAssetViewControllerDelegate *)v3 didFinishUpdateForAssetViewController:self];
}

- (void)recordOutgoingMajorNavigationJump
{
  id v2 = [(THBookViewController *)self bookspotHistoryStack];

  [(THBookspotHistoryStack *)v2 recordOutgoingMajorNavigationJump];
}

- (void)willJumpToTOC
{
  id v2 = [(THBookViewController *)self bookspotHistoryStack];

  [(THBookspotHistoryStack *)v2 recordOutgoingMajorNavigationJumpSuppressingToolbar:1];
}

- (void)updateNavigationAffordances
{
  [(THNavigationHistoryStepperController *)[(THBookViewController *)self navigationHistoryStepperController] updateHistoryNavigation];

  [(THBookViewController *)self updatePageNumberWidth];
}

- (void)updatePageNumberWidth
{
  [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] layoutIfNeeded];
  [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] frame];
  CGFloat v3 = CGRectGetWidth(v14) * 0.5;
  [(UIButton *)[(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] prevButton] frame];
  CGFloat v4 = v3 - CGRectGetMaxX(v15);
  [(UIButton *)[(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] nextButton] frame];
  double MinX = CGRectGetMinX(v16);
  [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] frame];
  CGFloat v6 = MinX - CGRectGetWidth(v17) * 0.5;
  double v7 = [(THBookViewController *)self navigationOverlayView];
  if (v4 >= v6)
  {
    [(UIButton *)[(THNavigationOverlayView *)v7 nextButton] frame];
    double v10 = CGRectGetMinX(v20);
    [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] frame];
    double v9 = v10 + CGRectGetWidth(v21) * -0.5;
  }
  else
  {
    [(THNavigationOverlayView *)v7 frame];
    CGFloat v8 = CGRectGetWidth(v18) * 0.5;
    [(UIButton *)[(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] prevButton] frame];
    double v9 = v8 - CGRectGetMaxX(v19);
  }
  double v11 = v9 + v9;
  id v12 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] navOverlayPageNumberView];

  [(THPageNumberView *)v12 updateMaxWidth:v11];
}

- (void)tocIsReadyToPresent:(id)a3
{
  if ([(THBookViewController *)self bookOpenDestinationIsTOC])
  {
    [(THBookViewController *)self viewsAreReadyForOpenAnimation];
  }
}

- (void)setupDVCForTOCController:(id)a3
{
  CGFloat v4 = [(THBookViewController *)self visibleViewController];
  if (v4 != (UIViewController *)[(THBookViewController *)self documentViewController])
  {
    [(THBookViewController *)self p_insertDVCInBack];
  }
}

- (id)navigationUnitForChapterBrowserController:(id)a3 chapterIndex:(unint64_t)a4
{
  BOOL v5 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v5 navigationUnitForChapterIndex:a4];
}

- (id)presentationTypeForChapterBrowserController:(id)a3
{
  id v3 = [[-[THDocumentViewController documentViewController](-[THBookViewController documentViewController](self, "documentViewController", a3), "documentRoot") properties];

  return [v3 chapterBrowserPagePresentationType];
}

- (void)p_updateCanvasWithPendingPageIndexPath
{
  if (self->mPendingPageIndexPath)
  {
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setVisibleInfoUpdatesAllowedInLandscape:1];
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] updateVisibleInfosWithPageIndex:[(NSIndexPath *)self->mPendingPageIndexPath indexAtPosition:1]];

    self->mPendingPageIndexPath = 0;
  }
}

- (void)preloadContentNodesForPageRange:(_NSRange)a3 chapterIndex:(unint64_t)a4
{
  if ((id)a3.location != NSInvalidRange[0] || a3.length != (void)NSInvalidRange[1])
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v9 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "rootNode"), "context"));
    id v10 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] navigationUnitForChapterIndex:a4];
    double v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    if (length)
    {
      CGRect v15 = v19;
      do
      {
        id v12 = [v10 contentNodeForRelativePageIndex:location forPresentationType:v9 v15];
        if (v12)
        {
          uint64_t v13 = v12;
          [(NSMutableSet *)v11 addObject:v12];
          [v13 startLoading];
          v18[0] = 0;
          v18[1] = v18;
          v18[2] = 0x3052000000;
          v19[0] = sub_8A184;
          v19[1] = sub_8A194;
          CGRect v20 = 0;
          CGRect v20 = [(THBookViewController *)self documentViewController];
          v16[6] = v18;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_8A1A0;
          v17[3] = &unk_456E38;
          v17[4] = v11;
          v17[5] = v13;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_8A1AC;
          v16[3] = &unk_457DC8;
          v16[4] = v11;
          v16[5] = v13;
          [v13 performWhenFinishedLoading:v17 onError:v16];
          _Block_object_dispose(v18, 8);
        }
        ++location;
        --length;
      }
      while (length);
    }
    id v14 = [(NSMutableSet *)self->mPreloadingContentNodes mutableCopy];
    [v14 minusSet:v11];
    [v14 makeObjectsPerformSelector:"cancelLoading"];

    self->mPreloadingContentNodes = v11;
  }
}

- (void)cancelPreloadOfContentNodes
{
  mPreloadingContentNodes = self->mPreloadingContentNodes;
  self->mPreloadingContentNodes = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(NSMutableSet *)mPreloadingContentNodes countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      CGFloat v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(mPreloadingContentNodes);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) cancelLoading];
        CGFloat v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableSet *)mPreloadingContentNodes countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
  [(NSMutableSet *)mPreloadingContentNodes removeAllObjects];
}

- (void)cancelPreloadOfContentNodesForChapterBrowserController:(id)a3
{
}

- (void)chapterBrowserController:(id)a3 preloadContentNodesForPageRange:(_NSRange)a4 chapterIndex:(unint64_t)a5
{
}

- (void)chapterBrowserController:(id)a3 willTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 freeTransform:(BOOL)a6
{
  BOOL v6 = a6;
  [(THBookViewController *)self setDisallowRotate:1];
  if (!v6) {
    [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setNavigationBarHidden:1 animated:1];
  }
  [(THBookViewController *)self p_insertDVCInBackAnimated:1];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] switchToNavigationUnitForChapterIndex:a5];
  [(THBookLinkResolver *)[(THBookViewController *)self bookLinkResolver] setDocumentLinkResolver:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentLinkResolver]];
  [(THDocumentNavigator *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentNavigator] setVisitedPagesAfterOpening:1];
  v19[0] = a5;
  v19[1] = a4;
  long long v10 = (NSIndexPath *)[objc_alloc((Class)NSIndexPath) initWithIndexes:v19 length:2];
  if (self->mPendingPageIndexPath) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookViewController chapterBrowserController:willTransitionToPageIndex:chapterIndex:freeTransform:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm") lineNumber:4421 description:@"expected nil value for '%s'", "mPendingPageIndexPath"];
  }
  self->mPendingPageIndexPath = v10;
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) setSuppressRevealScrollViewOnLayoutAndRender:!v6];
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) didBeginFreeTransform];
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) beginStaticLayoutAndRender];
  id v11 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] contentNodeForPageIndex:a4];
  [v11 startLoading];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = sub_8A184;
  v17[4] = sub_8A194;
  CGRect v18 = 0;
  CGRect v18 = [(THBookViewController *)self documentViewController];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = sub_8A184;
  v15[4] = sub_8A194;
  id v16 = 0;
  id v16 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] interactiveCanvasController];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_8A184;
  v14[4] = sub_8A194;
  v14[5] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8A6B0;
  v13[3] = &unk_4584E0;
  v13[4] = self;
  v13[5] = v10;
  v13[6] = v17;
  v13[7] = v14;
  void v13[8] = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8A738;
  v12[3] = &unk_457B00;
  v12[4] = self;
  void v12[5] = v15;
  v12[6] = v17;
  [v11 performWhenFinishedLoading:v13 onError:v12];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

- (void)chapterBrowserController:(id)a3 didTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 relativeTargetRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  unsigned int v13 = [(THBookViewController *)self setupLoadSpinner];
  [(-[THDocumentViewController contentNodeForPageIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "contentNodeForPageIndex:", a4)) waitUntilFinishedLoadingAndPaginating];
  +[CATransaction begin];
  [(THBookViewController *)self p_updateCanvasWithPendingPageIndexPath];
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) layoutIfNeeded];
  id v14 = [[[THDocumentViewController interactiveCanvasController] documentViewController] interactiveCanvasController].canvasView.enclosingScrollView.layer;
  LODWORD(v15) = 1.0;
  [v14 setOpacity:v15];
  +[CATransaction commit];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] updateVisibleInfos];
  if (v13) {
    [(THBookViewController *)self hideLoadSpinner];
  }
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) endStaticLayoutAndRender:0];
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) didEndFreeTransform];
  [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) setSuppressRevealScrollViewOnLayoutAndRender:0];
  if ([(THBookViewController *)self shouldKeepTOCInBackground:a3]) {
    [(THBookViewController *)self p_addViewControllerInBack:a3];
  }
  else {
    [(THBookViewController *)self hideTOC];
  }
  [(THBookViewController *)self hideToolbarAnimated:0];
  [(THBookViewController *)self p_showDVC];
  id v16 = [self documentRoot].searchController;
  if (([v16 indexLoaded] & 1) == 0
    && ([v16 unloadRequested] & 1) == 0
    && (TSUPadIsFirstGen() & 1) == 0)
  {
    [v16 loadIndex];
  }
  [(THBookViewController *)self recordCurrentLocationInHistory];
  -[THDocumentViewController zoomToRelativeTargetRect:atPageIndex:]([(THBookViewController *)self documentViewController], "zoomToRelativeTargetRect:atPageIndex:", a4, x, y, width, height);
  [(THBookViewController *)self setDisallowRotate:0];

  [(THBookViewController *)self refreshStatusBarAppearance];
}

- (void)chapterBrowserController:(id)a3 cancelledTransitionToPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5
{
  long long v7 = [(THBookViewController *)self documentViewController];
  [v7 interactiveCanvasController].endStaticLayoutAndRender:1;
  [v7 interactiveCanvasController].didEndFreeTransform;
  [v7 contentNodeForPageIndex:[self contentNodeForPageIndex:a4] cancelLoading];
  [(THBookViewController *)self p_removeViewController:v7];
  [(THDocumentViewController *)v7 setVisibleInfoUpdatesAllowedInLandscape:0];

  self->mPendingPageIndexPath = 0;

  [(THBookViewController *)self setDisallowRotate:0];
}

- (CGRect)chapterBrowserController:(id)a3 rectForRelativePageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5
{
  long long v7 = [(THBookViewController *)self documentViewController];

  [(THDocumentViewController *)v7 rectForRelativePageIndex:a4 chapterIndex:a5];
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)chapterBrowserController:(id)a3 updateTitleForChapterIndex:(unint64_t)a4
{
  uint64_t v5 = [(THBookViewController *)self navigationBarController];

  [(THNavigationBarController *)v5 updateViewStateWithThemeDelegate:a3];
}

- (id)chapterBrowserController:(id)a3 pageNumberStringForRelativePageIndex:(unint64_t)a4 andChapterIndex:(unint64_t)a5
{
  long long v7 = [(-[THDocumentViewController navigationUnitForChapterIndex:](-[THBookViewController documentViewController](self, "documentViewController"), "navigationUnitForChapterIndex:", a5)) absolutePageIndexForRelativePageIndex:0 forPresentationType:[self presentationTypeForChapterBrowserController:a3]]+ a4;
  double v8 = [(THBookViewController *)self navigationModel];
  id v9 = [(THBookViewController *)self presentationTypeForChapterBrowserController:a3];

  return [(THDocumentNavigationModel *)v8 pageNumberStringForAbsolutePageIndex:v7 forPresentationType:v9];
}

- (BOOL)chapterBrowserController:(id)a3 isCurrentlyDisplayedPageForRelativePageIndex:(unint64_t)a4 andChapterIndex:(unint64_t)a5
{
  return [(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentChapter] == a5&& [(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentRelativePageIndex] == a4;
}

- (unint64_t)chapterCountForChapterBrowserController:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot", a3), "tocModel"), "tiles");

  return (unint64_t)[v3 count];
}

- (id)chapterBrowserController:(id)a3 tocTileModelAtIndex:(unint64_t)a4
{
  id v5 = objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot", a3), "tocModel"), "tiles");

  return [v5 objectAtIndex:a4];
}

- (id)canvasScrollViewForChapterBrowserController:(id)a3
{
  id v3 = [[-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController", a3), "interactiveCanvasController") canvasView];

  return [v3 enclosingScrollView];
}

- (unint64_t)chapterBrowserController:(id)a3 relativePageIndexForLink:(id)a4
{
  id v5 = [(THBookViewController *)self documentViewController];
  [(THDocumentViewController *)v5 ensureDocumentIsLoaded];
  BOOL v6 = [(THDocumentViewController *)v5 documentNavigator];

  return [(THDocumentNavigator *)v6 relativePageIndexForLink:a4];
}

- (CGRect)chapterBrowserController:(id)a3 targetRelativeRectForPoint:(CGPoint)a4 atPageIndex:(unint64_t)a5 chapterIndex:(unint64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = [(THBookViewController *)self documentViewController];

  -[THDocumentViewController targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:](v10, "targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:", a5, a6, 0, x, y);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)chapterBrowserController:(id)a3 targetRelativeRectForRelativePoint:(CGPoint)a4 atPageIndex:(unint64_t)a5 chapterIndex:(unint64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = [(THBookViewController *)self documentViewController];

  -[THDocumentViewController targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:](v10, "targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:", a5, a6, 0, x, y);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)chapterBrowserController:(id)a3 shouldShowShroudForVisibleSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if ([(THBookViewController *)self visibleViewController] == a3
    || [(THBookViewController *)self transitioningTOCSize])
  {
    return 0;
  }

  return -[THBookViewController p_shouldShowShroudForVisibleSize:](self, "p_shouldShowShroudForVisibleSize:", width, height);
}

- (BOOL)chapterBrowserController:(id)a3 navigateToLinkInDVC:(id)a4
{
  return [(THBookViewController *)self navigateToLinkInDVC:a4];
}

- (BOOL)isTwoUpForChapterBrowserController:(id)a3
{
  id v3 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v3 isTwoUp];
}

- (BOOL)isLastPageInChapterForChapterBrowserController:(id)a3 pageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5
{
  long long v7 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v7 isLastPageInChapterForRelativePageIndex:a4 chapterIndex:a5];
}

- (BOOL)isSinglePageInChapterForChapterBrowserController:(id)a3 chapterIndex:(unint64_t)a4
{
  id v5 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v5 isSinglePageChapterForChapterIndex:a4];
}

- (void)TOCShowToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookViewController *)self visibleViewController];
  if (v5 == (UIViewController *)[(THBookViewController *)self chapterBrowserController])
  {
    [(THBookViewController *)self showToolbarAnimated:v3];
  }
}

- (void)TOCHideToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THBookViewController *)self visibleViewController];
  if (v5 == (UIViewController *)[(THBookViewController *)self chapterBrowserController])
  {
    [(THBookViewController *)self hideToolbarAnimated:v3];
  }
}

- (BOOL)isPageBookmarkedForDocumentViewController:(id)a3
{
  if ([(THBookViewController *)self documentViewController] != a3) {
    return 0;
  }

  return [(THBookViewController *)self isPageBookmarked];
}

- (void)setPageBookmarked:(BOOL)a3 forDocumentViewController:(id)a4
{
  BOOL v4 = a3;
  if ([(THBookViewController *)self documentViewController] == a4)
  {
    [(THBookViewController *)self setPageBookmarked:v4];
  }
}

- (BOOL)setupLoadSpinner
{
  mSpinnerView = self->mSpinnerView;
  if (!mSpinnerView)
  {
    +[CATransaction begin];
    self->mSpinnerView = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 112.0, 112.0];
    [self view].bounds
    TSDCenterOfRect();
    -[UIView setCenter:](self->mSpinnerView, "setCenter:");
    [(UIView *)self->mSpinnerView frame];
    CGRect v10 = CGRectIntegral(v9);
    -[UIView setFrame:](self->mSpinnerView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    [(CALayer *)[(UIView *)self->mSpinnerView layer] setCornerRadius:8.0];
    [(UIView *)self->mSpinnerView setBackgroundColor:+[UIColor colorWithWhite:0.0 alpha:0.800000012]];
    id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
    [(UIView *)self->mSpinnerView bounds];
    TSDCenterOfRect();
    [v4 setCenter:];
    [v4 frame];
    CGRect v12 = CGRectIntegral(v11);
    [v4 setFrame:v12.origin.x, v12.origin.y, v12.size.width, v12.size.height];
    [v4 setColor:[UIColor colorWithWhite:1.0 alpha:0.899999976]];
    [v4 startAnimating];
    [(UIView *)self->mSpinnerView addSubview:v4];

    [(CALayer *)[(UIView *)self->mSpinnerView layer] setZPosition:10.0];
    [self.view addSubview:self->mSpinnerView];
    [(UIView *)self->mSpinnerView setAlpha:0.0];
    unsigned int v5 = [(THBookViewController *)self isBookEpub];
    double v6 = 3.0;
    if (!v5) {
      double v6 = 2.0;
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_8B200;
    v8[3] = &unk_456DE0;
    v8[4] = self;
    +[UIView animateWithDuration:0 delay:v8 options:0 animations:0.15 completion:v6];
    +[CATransaction commit];
  }
  return mSpinnerView == 0;
}

- (void)hideLoadSpinner
{
  mSpinnerView = self->mSpinnerView;
  if (!mSpinnerView)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookViewController hideLoadSpinner]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"] lineNumber:4741 description:@"invalid nil value for '%s'", "mSpinnerView"];
    mSpinnerView = self->mSpinnerView;
  }
  [(UIView *)mSpinnerView removeFromSuperview];

  self->mSpinnerView = 0;
}

- (void)p_loadToolbar
{
  id v3 = [objc_alloc((Class)BCNavigationBar) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setSeparatorsVisible:0];
  [v3 setTranslucent:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [self.view addSubview:v3];
  [(THBookViewController *)self setNavigationBarController:objc_alloc_init(THNavigationBarController)];
  [v3 setDelegate:[self navigationBarController]];
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setNavigationBar:v3];
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setDelegate:self];
  [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] setAutohideTimeout:6.0];
  -[THNavigationBarController buildConstraintsFromParent:layoutGuide:](-[THBookViewController navigationBarController](self, "navigationBarController"), "buildConstraintsFromParent:layoutGuide:", -[THBookViewController view](self, "view"), [v1 safeAreaLayoutGuide]);
}

- (void)closeDocument
{
  id v3 = +[AETestDriver shared];
  [v3 postEvent:kBETestDriverOpenAnimationStart sender:self];
  id v4 = +[AETestDriver shared];
  [v4 postEvent:kBETestDriverOpenAnimationSetupStart sender:self];

  [(THBookViewController *)self closeDocumentWithErrorBlock:0];
}

- (void)closeDocumentWithErrorBlock:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8B654;
  v8[3] = &unk_4577C8;
  v8[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v8];
  [(THBookViewController *)self p_bookContentDidLoad];
  [(THBookViewController *)self dismissActivePopover];
  [(THBookViewController *)self p_savePlaceholder];
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8B69C;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8B6C8;
  v6[3] = &unk_457140;
  +[UIView animateWithDuration:v7 animations:v6 completion:0.15];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8B6F4;
  v5[3] = &unk_4577C8;
  v5[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:v5];
  [(THBookViewController *)self vantageWillChangeBy:self reason:@"THVantageChangeReasonBookClose"];
  [(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] assetViewController:self requestClose:1 finishedConsuming:0 error:0 withErrorBlock:a3];
  [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonBookClose"];
}

- (void)closeTOC
{
}

- (void)runPreloadOptimizations
{
  id v2 = +[TSWPLoadableFonts sharedInstance];

  [(TSWPLoadableFonts *)v2 pauseBackgroundLoading];
}

- (BOOL)p_showBuyButton
{
  BOOL v3 = [(THBookViewController *)self p_isSampleBook];
  if (v3) {
    LOBYTE(v3) = ![(THBookViewController *)self p_isPreorderBook];
  }
  return v3;
}

- (id)rightToolbarItems:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  if ([(THBookViewController *)self documentViewController])
  {
    if ([(THBookViewController *)self p_shouldShowAppearanceImage]) {
      double v6 = [(THBookViewController *)self appearanceButtonItem];
    }
    else {
      double v6 = [(THBookViewController *)self brightnessButtonItem];
    }
    long long v7 = v6;
    double v8 = [(THBookViewController *)self visibleViewController];
    if (v8 == (THiOSFlowToCTableViewController *)self->mFlowTocViewController
      || v8 == self->mFlowToCTableViewController)
    {
      [v5 tsu_addObjects:[self closeTOCButtonItem], [self searchButtonItem]];
    }
    else
    {
      if (!v3 || ![(THBookViewController *)self p_showBuyButton]) {
        [v5 addObject:[self bookmarkButtonItem]];
      }
      [v5 addObject:[self searchButtonItem]];
      if (v7) {
        [v5 addObject:v7];
      }
    }
  }
  return v5;
}

- (UIButton)bookmarkButton
{
  CGRect result = self->_bookmarkButton;
  if (!result)
  {
    id v4 = +[THTintableButton buttonWithType:0];
    self->_bookmarkButton = &v4->super;
    [(THTintableButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_bookmarkButton addTarget:self action:"p_showBookmarkMenu" forControlEvents:64];
    [(UIButton *)self->_bookmarkButton setImage:[+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"bookmark") imageWithConfiguration:+[UIImageSymbolConfiguration configurationWithPointSize:5 weight:3 scale:17.0]] forState:0];
    [(UIButton *)self->_bookmarkButton sizeToFit];
    return self->_bookmarkButton;
  }
  return result;
}

- (UIBarButtonItem)bookmarkButtonItem
{
  CGRect result = self->_bookmarkButtonItem;
  if (!result)
  {
    id v4 = [objc_alloc((Class)BCUIFullHeightNavWrapper) initWithView:[self bookmarkButton]];
    [v4 setCursorInsets:2.0, 0.0, 2.0, 0.0];
    id v5 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v4];
    self->_bookmarkButtonItem = v5;
    [(THBookViewController *)self p_applyAccessibilityLabelForButton:v5 withImageNamed:@"bookmark"];
    [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
    double Width = CGRectGetWidth(v8);
    double v7 = 47.0;
    if (Width >= 47.0)
    {
      [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
      double v7 = CGRectGetWidth(v9);
    }
    [(UIBarButtonItem *)self->_bookmarkButtonItem setWidth:v7];

    return self->_bookmarkButtonItem;
  }
  return result;
}

- (UIBarButtonItem)appearanceButtonItem
{
  appearanceButtonItem = self->_appearanceButtonItem;
  if (!appearanceButtonItem)
  {
    self->_appearanceButtonItem = (UIBarButtonItem *)[(THBookViewController *)self createButtonItemConfigurationWithImageName:@"textformat.size" forSelector:"showDisplaySettingsPopover:"];
    [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
    double Width = CGRectGetWidth(v7);
    double v5 = 47.0;
    if (Width >= 47.0)
    {
      [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
      double v5 = CGRectGetWidth(v8);
    }
    [(UIBarButtonItem *)self->_appearanceButtonItem setWidth:v5];
    appearanceButtonItem = self->_appearanceButtonItem;
  }
  [(THBookViewController *)self p_applyAccessibilityLabelForButton:appearanceButtonItem withImageNamed:@"textformat.size"];
  return self->_appearanceButtonItem;
}

- (UIBarButtonItem)brightnessButtonItem
{
  if (!self->_brightnessButtonItem
    && +[BEAppearanceViewController canChangeBrightness])
  {
    self->_brightnessButtonItem = (UIBarButtonItem *)[(THBookViewController *)self createButtonItemConfigurationWithImageName:@"sun.max" forSelector:"showDisplaySettingsPopover:"];
    [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
    double Width = CGRectGetWidth(v6);
    double v4 = 47.0;
    if (Width >= 47.0)
    {
      [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
      double v4 = CGRectGetWidth(v7);
    }
    [(UIBarButtonItem *)self->_brightnessButtonItem setWidth:v4];
    [(THBookViewController *)self p_applyAccessibilityLabelForButton:self->_brightnessButtonItem withImageNamed:@"sun.max"];
  }
  return self->_brightnessButtonItem;
}

- (UIBarButtonItem)searchButtonItem
{
  searchButtonItem = self->_searchButtonItem;
  if (!searchButtonItem)
  {
    self->_searchButtonItem = (UIBarButtonItem *)[(THBookViewController *)self createButtonItemConfigurationWithImageName:@"magnifyingglass" forSelector:"showSearchPopover"];
    [(UIBarButtonItem *)self->_searchButtonItem setEnabled:[(THBookViewController *)self isCompleteBook]];
    [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
    double Width = CGRectGetWidth(v7);
    double v5 = 47.0;
    if (Width >= 47.0)
    {
      [(UIButton *)[(THBookViewController *)self bookmarkButton] frame];
      double v5 = CGRectGetWidth(v8);
    }
    [(UIBarButtonItem *)self->_searchButtonItem setWidth:v5];
    searchButtonItem = self->_searchButtonItem;
  }
  [(THBookViewController *)self p_applyAccessibilityLabelForButton:searchButtonItem withImageNamed:@"magnifyingglass"];
  return self->_searchButtonItem;
}

- (UIBarButtonItem)closeTOCButtonItem
{
  CGRect result = self->_closeTOCButtonItem;
  if (!result)
  {
    CGRect result = [objc_alloc((Class)UIBarButtonItem) initWithTitle:[THBundle localizedStringForKey:@"Resume" value:&stru_46D7E8 table:0] style:2 target:self action:"closeTOC"];
    self->_closeTOCButtonItem = result;
  }
  return result;
}

- (void)_updateCloseButtonItem
{
  if (!self->_closeButtonItem)
  {
    closeButtonItem = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  closeButtonItem = self->_closeButtonItem;
  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    CGRect v6 = 0;
    goto LABEL_7;
  }
  id v5 = [(UIBarButtonItem *)closeButtonItem image];
  closeButtonItem = self->_closeButtonItem;
  if (v5)
  {
    CGRect v6 = &stru_46D7E8;
  }
  else
  {
    CGRect v6 = (__CFString *)[(UIBarButtonItem *)closeButtonItem title];
    closeButtonItem = self->_closeButtonItem;
  }
LABEL_7:

  self->_closeButtonItem = (UIBarButtonItem *)[(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] libraryButtonItemForViewController:self selector:"closeDocument"];
  if ([(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] canUpdateLibraryBarButtonItem:self->_closeButtonItem withOldString:v6])[(THBookViewController *)self assetViewControllerUpdateToolbars]; {
  [(THBookViewController *)self p_applyAccessibilityLabelForButton:self->_closeButtonItem withImageNamed:@"chevron.backward"];
  }
}

- (UIBarButtonItem)closeButtonItem
{
  CGRect result = self->_closeButtonItem;
  if (!result)
  {
    [(THBookViewController *)self _updateCloseButtonItem];
    return self->_closeButtonItem;
  }
  return result;
}

- (UIBarButtonItem)tocGlossaryButtonItem
{
  tocGlossaryButtonItem = self->_tocGlossaryButtonItem;
  if (!tocGlossaryButtonItem)
  {
    self->_tocGlossaryButtonItem = (UIBarButtonItem *)[(THBookViewController *)self createButtonItemConfigurationWithImageName:@"list.bullet" forSelector:"showTOCGlossaryPopover:"];
    [(UIBarButtonItem *)self->_tocGlossaryButtonItem setEnabled:[(THBookViewController *)self isCompleteBook]];
    tocGlossaryButtonItem = self->_tocGlossaryButtonItem;
  }
  [(THBookViewController *)self p_applyAccessibilityLabelForButton:tocGlossaryButtonItem withImageNamed:@"list.bullet"];
  return self->_tocGlossaryButtonItem;
}

- (UIBarButtonItem)notesButtonItem
{
  notesButtonItem = self->_notesButtonItem;
  if (!notesButtonItem)
  {
    notesButtonItem = [(THBookViewController *)self createButtonItemConfigurationWithImageName:@"rectangle.on.rectangle.angled" forSelector:"showFullscreenNotesView:"];
    self->_notesButtonItem = notesButtonItem;
  }
  [(THBookViewController *)self p_applyAccessibilityLabelForButton:notesButtonItem withImageNamed:@"rectangle.on.rectangle.angled"];
  return self->_notesButtonItem;
}

- (UIBarButtonItem)shareButtonItem
{
  CGRect result = self->_shareButtonItem;
  if (!result)
  {
    self->_shareButtonItem = (UIBarButtonItem *)[(THBookViewController *)self createButtonItemConfigurationWithImageName:@"square.and.arrow.up" forSelector:"showSharePopover:"];
    -[UIBarButtonItem setAccessibilityLabel:](self->_shareButtonItem, "setAccessibilityLabel:", [(id)THBundle() localizedStringForKey:@"Share" value:&stru_46D7E8 table:0]);
    return self->_shareButtonItem;
  }
  return result;
}

- (id)createButtonItemConfigurationWithImageName:(id)a3 forSelector:(SEL)a4
{
  id v7 = +[UIBarButtonItem bc_readingExperienceBarItem:a3 target:self action:a4];
  [(THBookViewController *)self p_applyAccessibilityLabelForButton:v7 withImageNamed:a3];

  return v7;
}

- (id)leftToolbarItems:(BOOL)a3
{
  id v4 = +[NSMutableArray array];
  if (![(THBookViewController *)self documentViewController])
  {
    CGRect v6 = [(THBookViewController *)self closeTOCButtonItem];
LABEL_14:
    [v4 addObject:v6];
    return v4;
  }
  id v5 = [(THBookViewController *)self visibleViewController];
  if (v5 == (THiOSFlowToCTableViewController *)self->mFlowTocViewController || v5 == self->mFlowToCTableViewController)
  {
    [v4 tsu_addObjects:[self closeButtonItem], [self shareButtonItem]];
  }
  else
  {
    [v4 tsu_addObjects:[self closeButtonItem]];
    if ([(THBookViewController *)self isTOCVisible]) {
      [v4 tsu_addObjects:[self shareButtonItem], 0, v9];
    }
    else {
      [v4 tsu_addObjects:[self tocGlossaryButtonItem], [self notesButtonItem]];
    }
    id v7 = [(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] assetViewControllerMinifiedBarButtonItem:self];
    if (v7) {
      [v4 insertObject:v7 atIndex:1];
    }
  }
  if ([(THBookViewController *)self p_showBuyButton]
    && [(THBookViewController *)self buyButtonItem])
  {
    CGRect v6 = [(THBookViewController *)self buyButtonItem];
    goto LABEL_14;
  }
  return v4;
}

- (void)setApplicationToolbarHiddenFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5
{
}

- (UIBarButtonItem)buyButtonItem
{
  BOOL v3 = [(THBookViewController *)self assetViewControllerDelegate];
  BOOL v4 = [(THBookDescription *)[(THBookViewController *)self bookDescription] isSample];
  BOOL v5 = [(THBookDescription *)[(THBookViewController *)self bookDescription] isPreorderBook];
  CGRect v6 = [(THBookDescription *)[(THBookViewController *)self bookDescription] storeID];

  return (UIBarButtonItem *)[(AEAssetViewControllerDelegate *)v3 assetViewControllerBuyButtonItem:self isSample:v4 isPreorder:v5 storeID:v6];
}

- (BOOL)p_isSampleBook
{
  id v2 = [(THBookViewController *)self bookDescription];

  return [(THBookDescription *)v2 isSample];
}

- (BOOL)p_isPreorderBook
{
  id v2 = [(THBookViewController *)self bookDescription];

  return [(THBookDescription *)v2 isPreorderBook];
}

- (BOOL)p_shouldShowAppearanceImage
{
  return [(THBookViewController *)self shouldShowFlowModeSwitch:0];
}

- (id)p_popoverPassthroughViews
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar], 0);
}

- (void)p_setupDisplaySettingsIfNeeded
{
  if (![(THBookViewController *)self displaySettingsViewController])
  {
    BOOL v3 = [[THDisplaySettingsViewController alloc] initWithDelegate:self];
    [(THDisplaySettingsViewController *)v3 setOverrideUserInterfaceStyle:[(THBookViewController *)self overrideUserInterfaceStyle]];
    if ([(THBookViewController *)self isBookEpub])
    {
      [(THDisplaySettingsViewController *)v3 setAppearanceStyle:[(THBookViewController *)self appearanceStyle]];
      [(THDisplaySettingsViewController *)v3 setTheme:[(THBookViewController *)self theme]];
    }
    [(THDisplaySettingsViewController *)v3 setTheme:[(THBookViewController *)self theme]];
    [(THBookViewController *)self setDisplaySettingsViewController:v3];
  }
}

- (void)showDisplaySettingsPopover:(id)a3
{
  if (objc_msgSend(-[THDisplaySettingsViewController view](-[THBookViewController displaySettingsViewController](self, "displaySettingsViewController"), "view"), "window"))
  {
    [(THBookViewController *)self dismissDisplaySettings:1];
  }
  else
  {
    objc_opt_class();
    [(id)BUDynamicCast() setEnabled:0];
    [(THBookViewController *)self dismissActivePopover];
    [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userWillInteractInToolbar];
    [(THBookViewController *)self p_setupDisplaySettingsIfNeeded];
    BOOL v5 = [(THBookViewController *)self displaySettingsViewController];
    [(THDisplaySettingsViewController *)v5 setModalPresentationStyle:7];
    objc_opt_class();
    if (BUDynamicCast())
    {
      id v6 = [(THDisplaySettingsViewController *)v5 popoverPresentationController];
      [v6 setBarButtonItem:a3];
      [v6 setPermittedArrowDirections:1];
      [v6 setDelegate:self];
      [v6 setPassthroughViews:[self p_popoverPassthroughViews]];
      [v6 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v5];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_8C4D4;
      v7[3] = &unk_456DE0;
      v7[4] = a3;
      [(THBookViewController *)self presentViewController:v5 animated:1 completion:v7];
    }
  }
}

- (void)dismissDisplaySettings:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8C5A0;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  [(THDisplaySettingsViewController *)[(THBookViewController *)self displaySettingsViewController] dismissViewControllerAnimated:a3 completion:v3];
}

- (void)p_displaySettingsDidHide
{
  [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userDidInteractInToolbar];

  [(THBookViewController *)self setDisplaySettingsViewController:0];
}

- (BOOL)p_isSearchVisible
{
  return [-[THSearchViewController view](-[THBookViewController searchViewController](self, "searchViewController"), "view") window] != 0;
}

- (void)showSearchPopoverFromBarButtonItem:(id)a3
{
}

- (void)showSearchPopoverFromBarButtonItem:(id)a3 withText:(id)a4
{
  id v7 = [(THBookViewController *)self searchViewController];
  CGRect v8 = v7;
  if (a4 || !v7)
  {
    [(THBookViewController *)self dismissActivePopover];
    if (!v8)
    {
      CGRect v8 = -[THSearchViewController initWithSearchController:]([THSearchViewController alloc], "initWithSearchController:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "searchController"));
      [(THSearchViewController *)v8 setTheme:[(THBookViewController *)self theme]];
      [(THSearchViewController *)v8 setDelegate:self];
      [v8 view].frame;
      -[THSearchViewController setPreferredContentSize:](v8, "setPreferredContentSize:", v9, v10);
      [(THBookViewController *)self setSearchViewController:v8];
      CGRect v11 = v8;
    }
  }
  else
  {
    if ([(THBookViewController *)self p_isSearchVisible])
    {
      [(THBookViewController *)self dismissSearchPopover:1 completion:0];
      return;
    }
    [(THBookViewController *)self dismissActivePopover];
  }
  -[THSearchViewController setSearchingForPredeterminedString:](v8, "setSearchingForPredeterminedString:", [a4 length] != 0);
  [(THSearchViewController *)v8 setModalPresentationStyle:7];
  [(THSearchViewController *)v8 setOverrideUserInterfaceStyle:[(THBookViewController *)self overrideUserInterfaceStyle]];
  if (([(THBookViewController *)self im_isCompactWidth] & 1) == 0
    && ([(THBookViewController *)self im_isCompactHeight] & 1) == 0)
  {
    [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userWillInteractInToolbar];
  }
  id v12 = [(THSearchViewController *)v8 popoverPresentationController];
  [v12 setBackgroundColor:[-[THBookViewController theme](self, "theme") popoverBackgroundColor]];
  [v12 setBarButtonItem:a3];
  [v12 setPermittedArrowDirections:1];
  [v12 setDelegate:self];
  [v12 setPassthroughViews:[self p_popoverPassthroughViews]];
  [v12 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v8];
  [(THBookViewController *)self presentViewController:v8 animated:1 completion:&stru_458500];
  if (a4 && [a4 length])
  {
    [(THSearchViewController *)v8 searchForString:a4];
  }
}

- (void)p_searchDidHide
{
  [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userDidInteractInToolbar];
  id v3 = [[-[THBookViewController documentRoot](self, "documentRoot")] searchController];
  if ([v3 unloadRequested])
  {
    [v3 unloadIndex];
    [(THBookViewController *)self setSearchViewController:0];
  }
}

- (void)dismissSearchPopover:(BOOL)a3 completion:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8C95C;
  v4[3] = &unk_4572A0;
  v4[4] = self;
  void v4[5] = a4;
  [(THSearchViewController *)[(THBookViewController *)self searchViewController] dismissViewControllerAnimated:a3 completion:v4];
}

- (CGRect)p_navigationOverlayFrame
{
  CGFloat x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if ([(THBookViewController *)self isBookEpub])
  {
    if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration])
    {
      [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] bottomFullWidthToolbarFrame];
      CGFloat width = v7;
      CGFloat height = v8;
      CGFloat x = CGPointZero.x;
      double y = CGPointZero.y;
    }
  }
  else
  {
    [self viewIfLoaded].bounds;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [self viewIfLoaded].safeAreaInsets;
    CGFloat v18 = v10 + v17;
    CGFloat v20 = v12 + v19;
    CGFloat v22 = v14 - (v17 + v21);
    CGFloat v24 = v16 - (v19 + v23);
    v29.origin.CGFloat x = v10 + v17;
    v29.origin.double y = v20;
    v29.size.CGFloat width = v22;
    v29.size.CGFloat height = v24;
    CGFloat x = CGRectGetMinX(v29);
    v30.origin.CGFloat x = v18;
    v30.origin.double y = v20;
    v30.size.CGFloat width = v22;
    v30.size.CGFloat height = v24;
    double y = CGRectGetMaxY(v30) + -64.0;
    v31.origin.CGFloat x = v18;
    v31.origin.double y = v20;
    v31.size.CGFloat width = v22;
    v31.size.CGFloat height = v24;
    CGFloat width = CGRectGetWidth(v31);
    CGFloat height = 64.0;
  }
  if ([(THBookViewController *)self HUDOverlayView]) {
    double v25 = y + -50.0;
  }
  else {
    double v25 = y;
  }
  double v26 = x;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.double y = v25;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)p_loadNavigationOverlay
{
  unsigned int v3 = [(THBookViewController *)self isBookEpub];
  BOOL v4 = -[THNavigationOverlayView initWithFrame:blissClassicStyle:]([THNavigationOverlayView alloc], "initWithFrame:blissClassicStyle:", v3 ^ 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  BOOL v5 = v4;
  if (v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 10;
  }
  [(THNavigationOverlayView *)v4 setAutoresizingMask:v6];
  [(THNavigationOverlayView *)v5 setTransparentMode:[(THBookViewController *)self isBookEpub] ^ 1];
  double v7 = objc_alloc_init(THNavigationHistoryStepperController);
  [(THNavigationHistoryStepperController *)v7 setChrome:v5];
  [(UIButton *)[(THNavigationOverlayView *)v5 prevButton] addTarget:v7 action:"jumpToPrev:" forControlEvents:64];
  [(UIButton *)[(THNavigationOverlayView *)v5 nextButton] addTarget:v7 action:"jumpToNext:" forControlEvents:64];
  [(UIButton *)[(THNavigationOverlayView *)v5 prevButton] addTarget:self action:"userWillInteractInToolbar" forControlEvents:4095];
  [(UIButton *)[(THNavigationOverlayView *)v5 nextButton] addTarget:self action:"userWillInteractInToolbar" forControlEvents:4095];
  [(THNavigationOverlayView *)v5 setOverlayHidden:1 animated:0];
  [(THBookViewController *)self setNavigationOverlayView:v5];
  [(THBookViewController *)self setNavigationHistoryStepperController:v7];
  if (v3) {
    double v8 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] navigationOverlayContainer];
  }
  else {
    double v8 = (UIView *)[(THBookViewController *)self view];
  }

  [(UIView *)v8 addSubview:v5];
}

- (void)p_loadTitleLabel
{
  if (!self->mTitleLabel && [(THBookViewController *)self isBookEpub])
  {
    unsigned int v3 = [objc_alloc((Class)BCDisplayOnlyNavigationBar) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    self->mTitleLabelNavigationBar = v3;
    [(BCDisplayOnlyNavigationBar *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BCDisplayOnlyNavigationBar *)self->mTitleLabelNavigationBar setTranslucent:0];
    [(BCDisplayOnlyNavigationBar *)self->mTitleLabelNavigationBar setDelegate:self];
    [self->mTitleLabelNavigationBar insertSubview:[self view] belowSubview:[-[THBookViewController navigationBarController] navigationBar]];
    objc_msgSend(objc_msgSend(-[BCDisplayOnlyNavigationBar leftAnchor](self->mTitleLabelNavigationBar, "leftAnchor"), "constraintEqualToAnchor:", objc_msgSend(-[THBookViewController view](self, "view"), "leftAnchor")), "setActive:", 1);
    objc_msgSend(objc_msgSend(-[BCDisplayOnlyNavigationBar rightAnchor](self->mTitleLabelNavigationBar, "rightAnchor"), "constraintEqualToAnchor:", objc_msgSend(-[THBookViewController view](self, "view"), "rightAnchor")), "setActive:", 1);
    objc_msgSend(objc_msgSend(-[BCDisplayOnlyNavigationBar topAnchor](self->mTitleLabelNavigationBar, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THBookViewController view](self, "view"), "safeAreaLayoutGuide"), "topAnchor")), "setActive:", 1);
    self->mTitleLabel = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)self->mTitleLabel setBackgroundColor:+[UIColor clearColor]];
    [(UILabel *)self->mTitleLabel setOpaque:0];
    [(UILabel *)self->mTitleLabel setFont:+[UIFont boldSystemFontOfSize:17.0]];
    [(UILabel *)self->mTitleLabel setMinimumScaleFactor:0.588235294];
    [(UILabel *)self->mTitleLabel setAutoresizingMask:2];
    [(UILabel *)self->mTitleLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)self->mTitleLabel setTextAlignment:1];
    [(UILabel *)self->mTitleLabel setBaselineAdjustment:1];
    [(UILabel *)self->mTitleLabel setText:[(THBookDescription *)[(THBookViewController *)self bookDescription] bookTitle]];
    [(UILabel *)self->mTitleLabel setLineBreakMode:5];
    [(UILabel *)self->mTitleLabel sizeToFit];
    BOOL v4 = [+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"bookmark.fill") imageWithConfiguration:+[UIImageSymbolConfiguration configurationWithPointSize:5 weight:3 scale:17.0]];
    BOOL v5 = +[UIButton buttonWithType:0];
    self->mActionlessBookmarkButton = v5;
    [(UIButton *)v5 setImage:v4 forState:0];
    [(UIButton *)self->mActionlessBookmarkButton setUserInteractionEnabled:0];
    uint64_t v6 = +[UIColor systemRedColor];
    mActionlessBookmarkButton = self->mActionlessBookmarkButton;
    [(UIButton *)mActionlessBookmarkButton setTintColor:v6];
  }
}

- (int64_t)positionForBar:(id)a3
{
  if (self->mTitleLabelNavigationBar == a3) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)p_isPageLocationApplicable
{
  return [(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentPresentationType] != 0;
}

- (void)p_savePlaceholder
{
  id v2 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentNavigator];

  [(THDocumentNavigator *)v2 savePlaceholder];
}

- (BOOL)p_isPageLocationValid:(id)a3
{
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if ([(THBookViewController *)self isBookEpub])
  {
    id v5 = [a3 storageUID];
    if (!v5) {
      return (char)v5;
    }
    BOOL v6 = [a3 range] == (id)0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
    LOBYTE(v5) = !v6;
    return (char)v5;
  }
  unint64_t v7 = [(THDocumentNavigationModel *)[(THBookViewController *)self navigationModel] pageCount];
  id v8 = [a3 absolutePhysicalPageIndex];
  LOBYTE(v5) = 0;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [a3 absolutePhysicalPageIndex];
    if (v9 >= (id)[(THDocumentNavigationModel *)[(THBookViewController *)self navigationModel] pageCount])
    {
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    if (objc_msgSend(objc_msgSend(a3, "storageUID"), "length"))
    {
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    BOOL v6 = objc_msgSend(objc_msgSend(a3, "contentNodeGUID"), "length") == 0;
    goto LABEL_5;
  }
  return (char)v5;
}

- (BOOL)p_hasDestinationPage
{
  unsigned __int8 v3 = -[THBookViewController p_isPageLocationValid:](self, "p_isPageLocationValid:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "placeholder"));
  BOOL result = [(THBookViewController *)self openingCFIOverride]
        || [(THBookViewController *)self openingFragmentOverride]
        || ([(THBookViewController *)self openingAbsolutePageIndexOverride] != 0x7FFFFFFFFFFFFFFFLL
          ? (char v4 = 1)
          : (char v4 = v3),
            (v4 & 1) != 0)
        || [(THBookViewController *)self openingLocationOverride] != 0;
  return result;
}

- (BOOL)p_wantsToOpenToTOC
{
  unsigned __int8 v3 = [(THBookViewController *)self p_hasDestinationPage];
  if ([(THBookViewController *)self introMediaViewController]) {
    return 0;
  }
  else {
    return v3 ^ 1;
  }
}

- (id)p_THCFIReaderStringFromBKCFIString:(id)a3
{
  if ([a3 rangeOfString:@"epubcfi(/"] {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5) {
    return a3;
  }

  return [@"#" stringByAppendingString:a3];
}

- (BOOL)p_jumpToBKCFIString:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = -[THBookViewController p_THCFIReaderStringFromBKCFIString:](self, "p_THCFIReaderStringFromBKCFIString:");
  uint64_t v13 = 0;
  id v5 = [[-[THBookViewController documentRoot](self, "documentRoot")] modelStorageAnchorForCfi:v4 error:&v13];
  BOOL v6 = v5 != 0;
  if (v5)
  {
    unint64_t v7 = v5;
    [(THBookViewController *)self navigateToAnchorInDVC:v5 pulse:1];
    unint64_t v8 = [(THBookViewController *)self absolutePageIndexForCFI:v4];
    id v9 = [THPageLocation alloc];
    id v10 = [v7 range];
    -[THBookspotHistoryStack gotoBookspot:minor:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "gotoBookspot:minor:", -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](v9, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v8, v10, v11, [v7 storageUID], objc_msgSend(objc_msgSend(v7, "contentNode"), "nodeGUID")), 0);
  }
  return v6;
}

- (BOOL)p_jumpToFragment:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [(THDocumentNavigationModel *)[(THBookViewController *)self navigationModel] contentNodeForGUID:a3];
  if (v5) {
    BOOL v6 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", v5, a3, 0, 0);
  }
  else {
    BOOL v6 = -[THDocumentLinkResolver anchorFromCustomLink:presentationType:](-[THBookLinkResolver documentLinkResolver](-[THBookViewController bookLinkResolver](self, "bookLinkResolver"), "documentLinkResolver"), "anchorFromCustomLink:presentationType:", -[THModelLink initWithTarget:context:]([THModelLink alloc], "initWithTarget:context:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ibooks://#%@", a3), objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "context")), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "context")));
  }
  if (!v6) {
    return 0;
  }
  [(THBookViewController *)self navigateToAnchorInDVC:v6 pulse:0];
  id v8 = objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "rootNode"), "context")));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v9 = (void *)TSUDynamicCast();
    uint64_t v10 = (uint64_t)[v9 range];
    uint64_t v12 = v11;
    id v13 = [v9 storageUID];
  }
  else
  {
    id v13 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[THBookspotHistoryStack gotoBookspot:minor:](-[THBookViewController bookspotHistoryStack](self, "bookspotHistoryStack"), "gotoBookspot:minor:", -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:]([THPageLocation alloc], "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v8, v10, v12, v13, [v5 nodeGUID]), 0);
  return 1;
}

- (BOOL)p_restoreToLaunchPage
{
  if ([(THBookViewController *)self isBookEpub]) {
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] ensureDocumentIsLoaded];
  }
  if ([(THBookViewController *)self openingCFIOverride])
  {
    unsigned __int8 v3 = [(THBookViewController *)self p_jumpToBKCFIString:[(THBookViewController *)self openingCFIOverride]];
    [(THBookViewController *)self setOpeningCFIOverride:0];
    if ((v3 & 1) == 0) {
      return 0;
    }
LABEL_20:
    [self view].bounds;
    [(-[THDocumentViewController view](-[THBookViewController documentViewController](self, "documentViewController"), "view")) setFrame:v11, v12, v13, v14];
    return 1;
  }
  if ([(THBookViewController *)self openingFragmentOverride])
  {
    unsigned __int8 v4 = [(THBookViewController *)self p_jumpToFragment:[(THBookViewController *)self openingFragmentOverride]];
    [(THBookViewController *)self setOpeningFragmentOverride:0];
    if ((v4 & 1) == 0) {
      return 0;
    }
    goto LABEL_20;
  }
  if ([(THBookViewController *)self openingLocationOverride])
  {
    unsigned __int8 v5 = [(THBookViewController *)self p_jumpToLocation:[(THBookViewController *)self openingLocationOverride]];
    [(THBookViewController *)self setOpeningLocationOverride:0];
    if ((v5 & 1) == 0) {
      return 0;
    }
    goto LABEL_20;
  }
  if ([(THBookViewController *)self openingAbsolutePageIndexOverride] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v9 = [(THBookViewController *)self jumpToPageLocation:[[THPageLocation alloc] initWithAbsolutePageIndex:[(THBookViewController *)self openingAbsolutePageIndexOverride]] touchHistory:1 minor:0];
    [(THBookViewController *)self setOpeningAbsolutePageIndexOverride:0x7FFFFFFFFFFFFFFFLL];
    BOOL result = 0;
    if ((v9 & 1) == 0) {
      return result;
    }
    goto LABEL_20;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "annotationController"), "getPlaceholder:andPageHistory:", &v16, &v15);
  if ([(THBookViewController *)self p_isPageLocationValid:v16])
  {
    unsigned int v6 = [(THBookViewController *)self jumpToPageLocation:v16 touchHistory:v15 == 0 minor:1];
    char v7 = v6;
    if (v15)
    {
      if (!-[THDocumentViewController documentNavigator](-[THBookViewController documentViewController](self, "documentViewController"), "documentNavigator"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:stringWithUTF8String:@"-[THBookViewController p_restoreToLaunchPage]" file:stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm" lineNumber:5618 description:stringWithFormat:@"invalid nil value for '%s'", "self.documentViewController.documentNavigator"]; {
      id v8 = [(THBookViewController *)self documentRoot];
      }
      [v8 resetWithDictionaryRepresentation:v15];
      if ((v7 & 1) == 0) {
        return 0;
      }
      goto LABEL_20;
    }
    if (v6) {
      goto LABEL_20;
    }
  }
  return 0;
}

- (void)p_placeholderLocationDidChange
{
  unsigned __int8 v3 = [(THBookViewController *)self readingProgressHighwaterMark];
  if (!v3)
  {
    unsigned __int8 v3 = (NSNumber *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "readingProgressHighwaterMark");
    [(THBookViewController *)self setReadingProgressHighwaterMark:v3];
  }
  id v4 = [(THDocumentNavigator *)[(THBookViewController *)self documentNavigator] readingProgress];
  if (v4)
  {
    unsigned __int8 v5 = v4;
    unsigned int v6 = [(THBookViewController *)self assetViewControllerDelegate];
    uint64_t v10 = BCAssetReadingProgressKey;
    double v11 = v5;
    [(AEAssetViewControllerDelegate *)v6 assetViewController:self assetPropertyChanged:+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]];
    [(NSNumber *)v3 floatValue];
    float v7 = kAEAnnotationReadingLocationSignificantHighwaterMark;
    if (v8 < kAEAnnotationReadingLocationSignificantHighwaterMark)
    {
      [(THBookViewController *)self setReadingProgressHighwaterMark:v5];
      [v5 floatValue];
      if (v9 > v7) {
        [(AEAssetViewControllerDelegate *)[(THBookViewController *)self assetViewControllerDelegate] assetViewControllerSignificantReadingLocationChange:self];
      }
    }
  }
  objc_msgSend(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"), "updateBookProgress:completion:", objc_msgSend(objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID"), 0);
}

- (void)dismissTOCGlossaryView:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8D92C;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  [(THTOCGlossaryMenuPopoverViewController *)[(THBookViewController *)self TOCGlossaryViewController] dismissViewControllerAnimated:a3 completion:v3];
}

- (void)p_TOCGlossaryPopoverDidHide
{
  [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userDidInteractInToolbar];

  [(THBookViewController *)self setTOCGlossaryViewController:0];
}

- (void)showSharePopover:(id)a3
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8DA98;
  v6[3] = &unk_458570;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  void v6[5] = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8DD50;
  v5[3] = &unk_458598;
  v5[4] = v6;
  [+[BCProgressKitController sharedController](BCProgressKitController, "sharedController") activeContextWithCompletion:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dismissSharePopover:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8DE60;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  [(UIViewController *)[(THBookViewController *)self activityViewController] dismissViewControllerAnimated:a3 completion:v3];
}

- (void)p_shareDidHide
{
  [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userDidInteractInToolbar];

  [(THBookViewController *)self setActivityViewController:0];
}

- (void)showBookmarkMenu:(BOOL)a3 fromItem:(id)a4
{
  BOOL v4 = a3;
  if (objc_msgSend(-[THBookmarkMenuPopoverViewController view](-[THBookViewController bookmarkViewController](self, "bookmarkViewController"), "view"), "window"))
  {
    [(THBookViewController *)self dismissBookmarkMenu:v4 completion:0];
  }
  else
  {
    [(THBookViewController *)self dismissActivePopover];
    uint64_t v10 = objc_alloc_init(THBookmarkMenuPopoverViewController);
    -[THBookmarkMenuPopoverViewController setTitle:](v10, "setTitle:", [(id)THBundle() localizedStringForKey:@"Bookmarks" value:&stru_46D7E8 table:0]);
    [(THBookmarkMenuPopoverViewController *)v10 setDelegate:self];
    [(THBookmarkMenuPopoverViewController *)v10 setReflowablePaginationController:[(THDocumentViewController *)[(THBookViewController *)self documentViewController] reflowablePaginationController]];
    [(THBookmarkMenuPopoverViewController *)v10 setOverrideUserInterfaceStyle:[(THBookViewController *)self overrideUserInterfaceStyle]];
    [(THBookViewController *)self setBookmarkViewController:v10];
    [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] setDelegate:self];
    [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] setTheme:[(THBookViewController *)self theme]];
    [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] setViewDelegate:self];
    [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userWillInteractInToolbar];
    objc_opt_class();
    uint64_t v6 = BUDynamicCast();
    if (v6)
    {
      id v7 = (void *)v6;
      float v8 = [[THNavigationController alloc] initWithRootViewController:[(THBookViewController *)self bookmarkViewController]];
      [(THNavigationController *)v8 setModalPresentationStyle:7];
      id v9 = [(THNavigationController *)v8 popoverPresentationController];
      [v9 setSourceView:v7];
      [v7 bounds];
      [v9 setSourceRect:];
      [v9 setPermittedArrowDirections:1];
      [v9 setDelegate:self];
      [v9 setPassthroughViews:[self p_popoverPassthroughViews]];
      [v9 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:[self bookmarkViewController]];
      [(THBookViewController *)self presentViewController:v8 animated:v4 completion:0];
    }
  }
}

- (void)p_bookmarkPopoverDidHide
{
  [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userDidInteractInToolbar];
  [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] teardown];
  [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] setReflowablePaginationController:0];
  [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] setDelegate:0];

  [(THBookViewController *)self setBookmarkViewController:0];
}

- (void)dismissBookmarkMenu:(BOOL)a3 completion:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8E1DC;
  v4[3] = &unk_4572A0;
  v4[4] = self;
  void v4[5] = a4;
  [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] dismissViewControllerAnimated:a3 completion:v4];
}

- (void)p_dismissBookmarkMenu
{
}

- (void)p_showBookmarkMenu
{
  unsigned __int8 v3 = [(THBookViewController *)self bookmarkButton];

  [(THBookViewController *)self showBookmarkMenu:1 fromItem:v3];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  BOOL v4 = [(THBookViewController *)self bookmarkViewController];
  id v5 = [a3 presentedViewController];
  if (v5 == [(THBookmarkMenuPopoverViewController *)v4 navigationController])
  {
    id v6 = [(THBookmarkMenuPopoverViewController *)v4 navigationItem];
    [v6 setRightBarButtonItem:0 animated:0];
  }
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v6 = [(THBookViewController *)self bookmarkViewController];
  id v7 = [a3 presentedViewController];
  if (v7 == [(THBookmarkMenuPopoverViewController *)v6 navigationController])
  {
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"p_dismissBookmarkMenu"];
    [v6 navigationItem].setRightBarButtonItem:v8, 0);
  }
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  BOOL v4 = (THSearchViewController *)[a3 presentedViewController];
  if (v4 == [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] navigationController])
  {
    [(THBookViewController *)self p_bookmarkPopoverDidHide];
  }
  else if (v4 == (THSearchViewController *)[(THBookViewController *)self TOCGlossaryViewController])
  {
    [(THBookViewController *)self p_TOCGlossaryPopoverDidHide];
  }
  else if (v4 == (THSearchViewController *)[(THBookViewController *)self displaySettingsViewController])
  {
    [(THBookViewController *)self p_displaySettingsDidHide];
  }
  else if (v4 == [(THBookViewController *)self searchViewController])
  {
    [(THBookViewController *)self p_searchDidHide];
    id v5 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] interactiveCanvasController];
    [v5 resumeEditing];
  }
  else if (v4 == (THSearchViewController *)[(THBookViewController *)self activityViewController])
  {
    [(THBookViewController *)self p_shareDidHide];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v5 = [(THBookViewController *)self traitCollection];

  return [(THBookViewController *)self adaptivePresentationStyleForPresentationController:a3 traitCollection:v5];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4 = a4;
  if (a4 || (id v4 = [(THBookViewController *)self traitCollection]) != 0)
  {
    id v7 = (char *)[v4 horizontalSizeClass];
    id v8 = (char *)[v4 verticalSizeClass];
    BOOL v10 = v7 == (unsigned char *)&dword_0 + 1 || v8 == (unsigned char *)&dword_0 + 1;
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBookViewController adaptivePresentationStyleForPresentationController:traitCollection:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookViewController.mm"] lineNumber:5898 description:@"invalid nil value for '%s'", "traitCollection"];
    BOOL v10 = 1;
  }
  double v11 = (THSearchViewController *)[a3 presentedViewController];
  if (v11 == (THSearchViewController *)[(THBookViewController *)self TOCGlossaryViewController]|| v11 == (THSearchViewController *)[(THBookViewController *)self displaySettingsViewController])
  {
    return -1;
  }
  if (v11 == [(THBookViewController *)self searchViewController]
    || v11 == (THSearchViewController *)[(THBookViewController *)self activityViewController])
  {
    if (!v10) {
      return 7;
    }
  }
  else if (v11 != [(THBookmarkMenuPopoverViewController *)[(THBookViewController *)self bookmarkViewController] navigationController]|| !v10)
  {
    return 7;
  }
  return 0;
}

- (id)pageNumberStringForLocation:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return [v4 pageNumberStringForLocation:a3];
}

- (CGImage)thumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return (CGImage *)[v4 thumbnailImageForAbsolutePageIndex:a3];
}

- (id)sectionTitleStringForLocation:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return [v4 sectionTitleStringForLocation:a3];
}

- (id)sectionNumberStringForLocation:(id)a3
{
  id v4 = [(THBookViewController *)self documentRoot];

  return [v4 sectionNumberStringForLocation:a3];
}

- (BOOL)hasThumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  return ![(THBookViewController *)self isBookEpub];
}

- (BOOL)isAnnotationWriteEnabled
{
  id v2 = [[-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot] annotationController];

  return [v2 canModifyAnnotations];
}

- (id)bookmarkFetchedResultsController
{
  id v2 = [[-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot] annotationController];

  return [v2 allBookmarksFetchedResultsController];
}

- (void)addRemoveBookmarkCurrentPage
{
  uint64_t v3 = [(THBookViewController *)self isPageBookmarked] ^ 1;

  [(THBookViewController *)self setPageBookmarked:v3];
}

- (BOOL)isCurrentPageBookmarkedForBookmarkMenuPopoverViewController:(id)a3
{
  if ([(THBookViewController *)self bookmarkViewController] != a3) {
    return 0;
  }

  return [(THBookViewController *)self isPageBookmarked];
}

- (void)setCurrentPageBookmarked:(BOOL)a3 forBookmarkMenuPopoverViewController:(id)a4
{
  BOOL v4 = a3;
  if ([(THBookViewController *)self bookmarkViewController] == a4)
  {
    [(THBookViewController *)self setPageBookmarked:v4];
  }
}

- (void)removeBookmark:(id)a3
{
  objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "annotationController"), "removeBookmark:", a3);

  [(THBookViewController *)self updateBookmarkButton];
}

- (void)p_navigationHistoryDidChange:(id)a3
{
  id v4 = [a3 object];
  unsigned __int8 v5 = [[v4 objectForKey:@"minor"] BOOLValue];
  unsigned int v6 = [[v4 objectForKey:@"suppressToolbar"] BOOLValue];
  if ((v5 & 1) == 0)
  {
    if ((![(THBookViewController *)self isBookEpub] | v6))
    {
      [(THBookViewController *)self p_setNavigationOverlayHidden:0 animated:1 autoHides:1];
    }
    else
    {
      id v7 = [(THBookViewController *)self navigationBarController];
      [(THNavigationBarController *)v7 setNavigationBarHidden:0 animated:1];
    }
  }
}

- (id)_currentLocation
{
  if ([(THBookViewController *)self currentAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v4 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentNavigator];

  return [(THDocumentNavigator *)v4 currentBookspotLocation];
}

- (void)recordCurrentLocationInHistory
{
  id v3 = [(THBookViewController *)self _currentLocation];
  id v4 = [(THBookViewController *)self bookspotHistoryStack];

  [(THBookspotHistoryStack *)v4 gotoBookspot:v3 minor:1];
}

- (BOOL)jumpToPageLocation:(id)a3 touchHistory:(BOOL)a4 minor:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unsigned int v9 = [(THBookViewController *)self isBookEpub];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = (uint64_t)[a3 absolutePhysicalPageIndex];
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6) {
LABEL_5:
  }
    [(THBookViewController *)self recordCurrentLocationInHistory];
LABEL_6:
  [(THBookViewController *)self p_insertDVCInBack];
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] zoomOutIfNecessaryPriorToNavigation];
  double v11 = [(THBookViewController *)self navigationModel];
  if (v9) {
    id v12 = -[THDocumentNavigationModel contentNodeForBodyStorageID:](v11, "contentNodeForBodyStorageID:", [a3 storageUID]);
  }
  else {
    id v12 = [(THDocumentNavigationModel *)v11 contentNodeForAbsolutePageIndex:v10];
  }
  double v13 = v12;
  if (v12)
  {
    [(THBookViewController *)self vantageWillChangeBy:self reason:@"THVantageChangeReasonNavigation"];
    if ([a3 storageUID])
    {
      double v14 = +[THModelStorageAnchor storageAnchorWithContentNode:v13 pageLocation:a3];
      [(THModelStorageAnchor *)v14 setAbsolutePageIndex:v10];
    }
    else
    {
      id v15 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "rootNode"), "context"));
      double v14 = -[THModelPageAnchor initWithContentNode:relativePageIndex:presentationType:]([THModelPageAnchor alloc], "initWithContentNode:relativePageIndex:presentationType:", v13, [v13 relativePageIndexForAbsolutePageIndex:v10 forPresentationType:v15], v15);
    }
    [(THBookViewController *)self navigateToAnchorInDVC:v14 pulse:0];
    id v16 = [a3 copy];
    if (v6) {
      [(THBookspotHistoryStack *)[(THBookViewController *)self bookspotHistoryStack] gotoBookspot:v16 minor:v5];
    }
    [(THBookViewController *)self vantageDidChangeBy:self reason:@"THVantageChangeReasonNavigation"];
    double v17 = +[NSNotificationCenter defaultCenter];
    CGFloat v18 = THNavigationHistoryDidChangeNotification;
    v20[0] = @"pageLocation";
    v20[1] = @"minor";
    v21[0] = v16;
    v21[1] = +[NSNumber numberWithBool:v5];
    [(NSNotificationCenter *)v17 postNotificationName:v18 object:+[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2]];
    [(THBookViewController *)self removeTOC];
  }
  return v13 != 0;
}

- (BOOL)isPageBookmarked
{
  unsigned int v3 = [(THBookViewController *)self isBookmarkApplicable];
  if (v3)
  {
    id v4 = [[-[THDocumentViewController documentViewController](-[THBookViewController documentViewController](self, "documentViewController")) documentRoot] annotationController];
    if ([(THBookViewController *)self isBookEpub])
    {
      id v5 = [(THBookViewController *)self currentPageInfoForBookmarks];
      LOBYTE(v3) = [v4 isPageInfoBookmarked:v5];
    }
    else
    {
      unint64_t v6 = [(THBookViewController *)self currentAbsolutePageIndexForBookmarks];
      LOBYTE(v3) = [v4 isAbsolutePhysicalPageBookmarked:v6];
    }
  }
  return v3;
}

- (id)_storageAnchorForPageBookmark
{
  id v2 = [(THBookViewController *)self documentViewController];
  unsigned int v3 = [(THDocumentViewController *)v2 documentNavigator];
  uint64_t v4 = [(THDocumentViewController *)v2 isTwoUp] ^ 1;

  return [(THDocumentNavigator *)v3 storageAnchorForBookmarksUsingViewCenter:v4];
}

- (void)setPageBookmarked:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(THBookViewController *)self isBookmarkApplicable]
    || [(THBookViewController *)self isPageBookmarked] == v3)
  {
    return;
  }
  id v5 = [[-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot] annotationController];
  if ([(THBookViewController *)self isBookEpub])
  {
    id v6 = [(THBookViewController *)self currentPageInfoForBookmarks];
    if (v3)
    {
      id v7 = [(THBookViewController *)self _storageAnchorForPageBookmark];
      if (v7) {
        [v5 bookmarkPageInfo:v6 anchor:v7];
      }
      goto LABEL_14;
    }
    uint64_t v10 = v5;
    id v11 = v6;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v8 = [(THBookViewController *)self currentAbsolutePageIndexForBookmarks];
    if (v3)
    {
      id v9 = [(THBookViewController *)self _storageAnchorForPageBookmark];
      if (v9) {
        [v5 bookmarkAbsolutePhysicalPage:v8 anchor:v9];
      }
      goto LABEL_14;
    }
    uint64_t v10 = v5;
    id v11 = 0;
    uint64_t v12 = v8;
  }
  [v10 unbookmarkPageInfo:v11 absolutePageIndex:v12];
LABEL_14:

  [(THBookViewController *)self updateBookmarkButton];
}

- (unint64_t)currentAbsolutePageIndex
{
  id v2 = [(THBookViewController *)self documentNavigator];

  return [(THDocumentNavigator *)v2 currentAbsolutePageIndex];
}

- (unint64_t)currentAbsolutePageIndexForBookmarks
{
  BOOL v3 = [(THBookViewController *)self documentNavigator];
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] isTwoUp])
  {
    id v4 = [[self currentPresentationType] isFlow];
  }
  else
  {
    id v4 = &dword_0 + 1;
  }

  return [(THDocumentNavigator *)v3 currentAbsolutePageIndexForBookmarksUsingViewCenter:v4];
}

- (id)currentPageInfoForBookmarks
{
  if (objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isFlow")&& -[THBookViewController isBookEpub](self, "isBookEpub"))
  {
    unint64_t v3 = [(THBookViewController *)self currentAbsolutePageIndex];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      unint64_t v7 = v3;
      id v8 = [THPresentationType paginatedPresentationTypeInContext:[-[THDocumentViewController documentViewController](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot") context]];
      id v9 = [[-[THDocumentViewController currentNavigationUnit](-[THBookViewController documentViewController](self, "documentViewController"), "currentNavigationUnit") relativePageIndexForAbsolutePageIndex:v7 forPresentationType:v8];
      id v10 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] currentNavigationUnit];
      return [v10 pageInfoForRelativePageIndex:v9 forPresentationType:v8];
    }
  }
  else
  {
    id v5 = [(THBookViewController *)self documentNavigator];
    if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] isTwoUp])
    {
      id v6 = [[self currentPresentationType] isFlow];
    }
    else
    {
      id v6 = &dword_0 + 1;
    }
    return [(THDocumentNavigator *)v5 currentPageInfoForBookmarksUsingViewCenter:v6];
  }
}

- (BOOL)isBookmarkApplicable
{
  BOOL v3 = [(THBookViewController *)self isAnnotationWriteEnabled];
  if (v3)
  {
    id v4 = [(THBookViewController *)self visibleViewController];
    if (v4 != (UIViewController *)[(THBookViewController *)self documentViewController])
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    if (![(THBookViewController *)self isBookEpub])
    {
      BOOL v5 = [(THBookViewController *)self currentAbsolutePageIndexForBookmarks] == 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
      LOBYTE(v3) = !v5;
      return v3;
    }
    if ((objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated") & 1) != 0|| (BOOL v3 = -[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](-[THBookViewController documentViewController](self, "documentViewController"), "reflowablePaginationController"), "paginationComplete")))
    {
      BOOL v5 = [(THBookViewController *)self currentPageInfoForBookmarks] == 0;
      goto LABEL_9;
    }
  }
  return v3;
}

- (BOOL)isBookPortraitOnly
{
  id v2 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] documentRoot];

  return [v2 isPortraitOnlyBook];
}

- (BOOL)isBookEpub
{
  id v2 = [(THBookViewController *)self bookDescription];

  return [(THBookDescription *)v2 isEpub];
}

- (id)cachedAnnotationForFetchedObject:(id)a3
{
  id v4 = [[-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot] annotationController];

  return [v4 cachedAnnotationForFetchedObject:a3];
}

- (void)denyBookmarkEdit
{
}

- (void)showTOCGlossaryPopover:(id)a3
{
  if ([(THBookViewController *)self TOCGlossaryViewController])
  {
    [(THBookViewController *)self dismissTOCGlossaryView:1];
  }
  else
  {
    [(THBookViewController *)self dismissActivePopover];
    if (objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "glossaryController"), "model"), "entryCount"))
    {
      [a3 setEnabled:0];
      [(THToolbarDelegate *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] toolbarDelegate] userWillInteractInToolbar];
      BOOL v5 = objc_alloc_init(THTOCGlossaryMenuPopoverViewController);
      if ([(THBookViewController *)self isBookEpub]) {
        [(THTOCGlossaryMenuPopoverViewController *)v5 setTheme:[(THBookViewController *)self theme]];
      }
      [(THTOCGlossaryMenuPopoverViewController *)v5 setDelegate:self];
      [(THBookViewController *)self setTOCGlossaryViewController:v5];
      [(THTOCGlossaryMenuPopoverViewController *)v5 setModalPresentationStyle:7];
      [(THTOCGlossaryMenuPopoverViewController *)v5 setOverrideUserInterfaceStyle:[(THBookViewController *)self overrideUserInterfaceStyle]];
      id v6 = [(THTOCGlossaryMenuPopoverViewController *)v5 popoverPresentationController];
      [v6 setBarButtonItem:a3];
      [v6 setPermittedArrowDirections:1];
      [v6 setDelegate:self];
      [v6 setPassthroughViews:[self p_popoverPassthroughViews]];
      [v6 bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:v5];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_8F384;
      v7[3] = &unk_456DE0;
      v7[4] = a3;
      [(THBookViewController *)self presentViewController:v5 animated:1 completion:v7];
    }
    else
    {
      [(THBookViewController *)self showTOC];
    }
  }
}

- (void)p_updateCenterTitle
{
  if ([(THBookViewController *)self p_isTOCViewController:[(THBookViewController *)self visibleViewController]])
  {
    [(THBookViewController *)self p_setCenterTitleForTOC];
  }
  else if ([(THBookViewController *)self isBookEpub])
  {
    [(THBookViewController *)self p_setCenterTitleToBookTitle];
  }
  else
  {
    [(THBookViewController *)self setCenterTitleForCurrentNavigationUnit];
  }
}

- (void)setCenterTitle:(id)a3
{
  id v4 = [(THBookViewController *)self navigationBarController];

  [(THNavigationBarController *)v4 setCenterTitle:a3];
}

- (void)p_setCenterTitleForTOC
{
  if ([(THBookViewController *)self shouldShowChapterTitle]) {
    CFStringRef v3 = (const __CFString *)[(id)THBundle() localizedStringForKey:@"Table of Contents" value:&stru_46D7E8 table:0];
  }
  else {
    CFStringRef v3 = &stru_46D7E8;
  }

  [(THBookViewController *)self setCenterTitle:v3];
}

- (void)p_setCenterTitleForNavigationUnit:(id)a3
{
  if ([(THBookViewController *)self shouldShowChapterTitle]) {
    CFStringRef v5 = (const __CFString *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](-[THBookViewController documentViewController](self, "documentViewController"), "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", a3);
  }
  else {
    CFStringRef v5 = &stru_46D7E8;
  }

  [(THBookViewController *)self setCenterTitle:v5];
}

- (void)setCenterTitleForCurrentNavigationUnit
{
  CFStringRef v3 = [(THBookViewController *)self documentViewController];
  if ([(THDocumentViewController *)v3 currentNavigationUnit])
  {
    id v4 = [(THDocumentViewController *)v3 currentNavigationUnit];
    [(THBookViewController *)self p_setCenterTitleForNavigationUnit:v4];
  }
}

- (void)p_setCenterTitleToBookTitle
{
  CFStringRef v3 = [(THBookDescription *)[(THBookViewController *)self bookDescription] bookTitle];
  if (v3) {
    CFStringRef v4 = (const __CFString *)v3;
  }
  else {
    CFStringRef v4 = &stru_46D7E8;
  }

  [(THBookViewController *)self setCenterTitle:v4];
}

- (void)hideNavigationHistory
{
}

- (void)pAutoHideNavOverlay
{
}

- (void)p_setNavigationOverlayHidden:(BOOL)a3 animated:(BOOL)a4 autoHides:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = self;
  id v9 = [(THBookViewController *)self visibleViewController];
  if (v9 == (UIViewController *)[(THBookViewController *)self documentViewController]) {
    unsigned __int8 v10 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView];
  }
  else {
    unsigned __int8 v10 = 0;
  }
  if ([(THBookViewController *)self isTOCVisible]
    || (v10 & 1) != 0
    || [(THBookViewController *)self isStudyViewControllerVisible]
    || [(THBookViewController *)self isGlossaryPresenting]
    || [(THBookViewController *)self isGlossaryVisible]
    || (unsigned __int8 v11 = [(THBookViewController *)self isNotesFullscreenVisible], a3)
    || (v11 & 1) != 0)
  {
    [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setOverlayHidden:1 animated:v6];
  }
  else
  {
    [(THNavigationHistoryStepperController *)[(THBookViewController *)self navigationHistoryStepperController] updateHistoryNavigation];
    uint64_t v12 = [(THNavigationHistoryStepperController *)[(THBookViewController *)self navigationHistoryStepperController] bookspotHistoryStack];
    if (([(THBookspotHistoryStack *)v12 hasPrevBookspot] & 1) != 0
      || ([(THBookspotHistoryStack *)v12 hasNextBookspot] & 1) != 0
      || objc_msgSend(objc_msgSend(-[THBookViewController documentRoot](self, "documentRoot"), "bookDescription"), "isEpub"))
    {
      [(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] setOverlayHidden:0 animated:v6];
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"pAutoHideNavOverlay" object:0];
      if (v5) {
        [(THBookViewController *)self performSelector:"pAutoHideNavOverlay" withObject:0 afterDelay:4.0];
      }
    }
  }
  [(THBookViewController *)self updatePageNumberWidth];
}

- (BOOL)shouldAutohideNavigationBar
{
  return ![(THBookViewController *)self p_isSearchVisible]
      && ![(THBookViewController *)self bookmarkViewController]
      && ![(THBookViewController *)self TOCGlossaryViewController]
      && ![(THBookViewController *)self displaySettingsViewController]
      && [(THBookViewController *)self activityViewController] == 0;
}

- (BOOL)shouldShowChapterTitle
{
  if (![(THBookViewController *)self im_isCompactWidth]) {
    return 1;
  }
  [self view].bounds;
  return CGRectGetWidth(v4) >= kIMConfigurationSize_largePhone[1];
}

- (void)willSetNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[THBookViewController setSettingToolbarHidden:](self, "setSettingToolbarHidden:");
  [(THBookViewController *)self refreshStatusBarAppearance];

  [(THBookViewController *)self p_setNavigationOverlayHidden:v5 animated:v4 autoHides:0];
}

- (void)settingNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(THBookViewController *)self view];
  id v8 = [self p_selectedTocViewControllerCreateIfNecessary:0].shroudOverlayView;
  id v9 = [(THBookViewController *)self viewBackgroundColor];
  if (v4) {
    double v10 = 0.15;
  }
  else {
    double v10 = 0.0;
  }
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_8F9DC;
    v12[3] = &unk_456E38;
    v12[4] = v7;
    void v12[5] = v9;
    +[UIView animateWithDuration:v12 animations:v10];
  }
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8F9E4;
    v11[3] = &unk_456E38;
    v11[4] = v8;
    void v11[5] = v9;
    +[UIView animateWithDuration:v11 animations:v10];
  }
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] settingToolbarHidden:v5 animated:v4];
}

- (void)didSetNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView])
  {
    [(-[THBookViewController view](self, "view")) bringSubviewToFront:(-[THWExpandedViewController view](-[THDocumentViewController expandedViewController](-[THBookViewController documentViewController](self, "documentViewController"), "expandedViewController"), "view"))];
  }
  [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setNeedsStatusBarAppearanceUpdate];
  BOOL v5 = [(THBookViewController *)self documentViewController];

  [(THDocumentViewController *)v5 setNeedsUpdateOfHomeIndicatorAutoHidden];
}

- (void)userWillInteractInToolbar
{
  id v2 = [(THBookViewController *)self navigationBarController];

  [(THNavigationBarController *)v2 resetAutohideTimer];
}

- (void)showToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(THBookViewController *)self userWillInteractInToolbar];
  BOOL v5 = [(THBookViewController *)self navigationBarController];

  [(THNavigationBarController *)v5 setNavigationBarHidden:0 animated:v3];
}

- (void)hideToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(THBookViewController *)self dismissActivePopoverIsTransitioning:0];
  BOOL v5 = [(THBookViewController *)self navigationBarController];

  [(THNavigationBarController *)v5 setNavigationBarHidden:1 animated:v3];
}

- (BOOL)isToolbarHidden
{
  id v2 = [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar];

  return [(BCNavigationBar *)v2 isHidden];
}

- (void)updateBookmarkButton
{
  unsigned int v3 = [(THBookViewController *)self isPageBookmarked];
  char v4 = v3;
  if (v3) {
    CFStringRef v5 = @"bookmark.fill";
  }
  else {
    CFStringRef v5 = @"bookmark";
  }
  if ([(BCNavigationBar *)[(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar] isMinibar])uint64_t v6 = 2; {
  else
  }
    uint64_t v6 = 3;
  [(UIButton *)[(THBookViewController *)self bookmarkButton] setImage:[+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5) imageWithConfiguration:+[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v6 scale:17.0]] forState:0];
  if (v4)
  {
    [(UIButton *)[(THBookViewController *)self bookmarkButton] setTintColor:+[UIColor systemRedColor]];
    [(UIButton *)[(THBookViewController *)self actionlessBookmarkButton] setImage:[[+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"bookmark.fill") imageWithConfiguration:+[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v6 scale:17.0]] imageWithRenderingMode:2] forState:0];
    if (objc_msgSend(-[THBookViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))
    {
      [(UIButton *)[(THBookViewController *)self actionlessBookmarkButton] alpha];
      if (v7 != 0.0) {
        goto LABEL_15;
      }
      char v8 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    [(UIButton *)[(THBookViewController *)self bookmarkButton] setTintColor:0];
    [(UIButton *)[(THBookViewController *)self actionlessBookmarkButton] setImage:[[+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"bookmark.fill") imageWithConfiguration:+[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v6 scale:17.0]] imageWithRenderingMode:2] forState:0];
  }
  [(UIButton *)[(THBookViewController *)self actionlessBookmarkButton] alpha];
  if (v9 != 1.0) {
    goto LABEL_15;
  }
  char v8 = 0;
LABEL_14:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_8FDD8;
  v10[3] = &unk_457278;
  v10[4] = self;
  char v11 = v8;
  +[UIView animateWithDuration:v10 animations:0 completion:0.2];
LABEL_15:
  if ([(THBookViewController *)self p_isPageLocationApplicable]) {
    [(-[THDocumentViewController interactiveCanvasController](-[THBookViewController documentViewController](self, "documentViewController"), "interactiveCanvasController")) updateBookmarkStatusAnimated:1];
  }
}

- (void)showSearchPopover
{
}

- (void)showSearchPopoverWithText:(id)a3
{
  double v7 = sub_8FF20;
  char v8 = &unk_456E38;
  double v9 = self;
  id v10 = a3;
  [(THBookViewController *)self userWillInteractInToolbar];
  if (![(THBookViewController *)self isToolbarHidden]
    || ([(THBookViewController *)self im_isCompactWidth] & 1) != 0
    || ([(THBookViewController *)self im_isCompactHeight] & 1) != 0)
  {
    if ([(THBookViewController *)self isToolbarHidden]
      || ![(THBookViewController *)self im_isCompactWidth]
      || UIAccessibilityIsVoiceOverRunning())
    {
      v7((uint64_t)&v6);
      return;
    }
    char v4 = [(THBookViewController *)self navigationBarController];
    uint64_t v5 = 1;
  }
  else
  {
    char v4 = [(THBookViewController *)self navigationBarController];
    uint64_t v5 = 0;
  }
  [(THNavigationBarController *)v4 setNavigationBarHidden:v5 animated:1 completion:&v6];
}

- (double)toolbarHeight
{
  id v2 = [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] view];

  [v2 frameHeight];
  return result;
}

- (BOOL)useWhiteTheme
{
  unsigned int v3 = [(THBookViewController *)self visibleViewController];
  if (v3 != (UIViewController *)[(THBookViewController *)self documentViewController]) {
    return 0;
  }

  return [(THBookViewController *)self isBookEpub];
}

- (void)textForPagesLeftInChapterDidChangeTo:(id)a3
{
  if (a3) {
    CFStringRef v3 = (const __CFString *)a3;
  }
  else {
    CFStringRef v3 = &stru_46D7E8;
  }
  char v4 = [(THBookViewController *)self navigationOverlayView];

  [(THNavigationOverlayView *)v4 setAlternativeNextCaption:v3];
}

- (void)setToolbarHiddenFromAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar];

  [(BCNavigationBar *)v4 setAccessibilityElementsHidden:v3];
}

- (double)topBarHeight
{
  objc_msgSend(objc_msgSend(-[THBookViewController navigationController](self, "navigationController"), "navigationBar"), "intrinsicContentSize");
  return v2;
}

- (double)bottomBarHeight
{
  [(THBookViewController *)self topBarHeight];
  return result;
}

- (BOOL)isScrubberDisabled
{
  return 0;
}

- (id)foregroundTintColorForNavigationBar:(id)a3
{
  if ([(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar] != a3)return 0; {
  uint64_t v6 = [(THBookViewController *)self theme];
  }

  return [(THTheme *)v6 foregroundTintColorForNavigationBar:a3];
}

- (id)backgroundColorForNavigationBar:(id)a3
{
  char v4 = [(THBookViewController *)self theme];

  return [(THTheme *)v4 backgroundColorForNavigationBar:a3];
}

- (id)titleColorForNavigationBar:(id)a3
{
  char v4 = [(THBookViewController *)self theme];

  return [(THTheme *)v4 titleColorForNavigationBar:a3];
}

- (BOOL)navigationBarIsTranslucent:(id)a3
{
  char v4 = [(THBookViewController *)self theme];

  return [(THTheme *)v4 navigationBarIsTranslucent:a3];
}

- (id)storeURLForHTMLGenerator:(id)a3
{
  id v4 = [[AEAssetEngine storeMgr] clientApplicationController];
  id v5 = [self documentRoot].storeItemID;

  return [v4 bookUrlForStoreId:v5];
}

- (id)tellAFriendBaseURLForHTMLGenerator:(id)a3
{
  id v3 = [[AEAssetEngine storeMgr] clientApplicationController];
  objc_opt_class();
  [v3 tellAFriendEmailBodyURLBase];

  return (id)BUDynamicCast();
}

- (int64_t)appearanceStyle
{
  if (![(THBookViewController *)self isBookEpub]) {
    return 4;
  }
  double v2 = +[NSUserDefaults standardUserDefaults];
  int64_t result = [(NSUserDefaults *)v2 integerForKey:qword_5731E8];
  if ((unint64_t)result >= 4) {
    return 0;
  }
  return result;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  if ([(THBookViewController *)self isBookEpub]
    && [(THBookViewController *)self appearanceStyle] != a3)
  {
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3)
    {
      uint64_t v6 = +[NSUserDefaults standardUserDefaults];
      [(NSUserDefaults *)v6 setInteger:a3 forKey:qword_5731E8];
    }
    else
    {
      id v5 = +[NSUserDefaults standardUserDefaults];
      [(NSUserDefaults *)v5 removeObjectForKey:qword_5731E8];
    }
    if (a3 != 3) {
      self->_int64_t styleBeforeAutoNight = [(THBookViewController *)self appearanceStyle];
    }
    [(BCNavigationBar *)[(THNavigationBarController *)[(THBookViewController *)self navigationBarController] navigationBar] setOverrideUserInterfaceStyle:[(THBookViewController *)self overrideUserInterfaceStyle]];
    if ([(THDisplaySettingsViewController *)self->mDisplaySettingsViewController appearanceStyle] != a3)
    {
      [(THDisplaySettingsViewController *)self->mDisplaySettingsViewController setAppearanceStyle:a3];
      mDisplaySettingsViewController = self->mDisplaySettingsViewController;
      [(THDisplaySettingsViewController *)mDisplaySettingsViewController setAutoNightModeSwitch:1];
    }
  }
}

- (void)applyAppearanceStyle:(int64_t)a3
{
  -[THBookViewController setTheme:](self, "setTheme:", -[THBookViewController themeForStyle:](self, "themeForStyle:"));
  [(THBookViewController *)self setAppearanceStyle:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_90468;
  v5[3] = &unk_456DE0;
  v5[4] = self;
  +[UIView animateWithDuration:v5 animations:&stru_4585B8 completion:0.1];
}

- (id)themeForStyle:(int64_t)a3
{
  id v4 = +[THBookViewController themeMap];
  id v5 = +[NSNumber numberWithInt:a3];

  return [v4 objectForKey:v5];
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  if ([(THBookViewController *)self shouldShowFlowModeSwitch:[(THBookViewController *)self displaySettingsViewController]])
  {
    uint64_t v6 = [(THBookViewController *)self displaySettingsViewController];
    [(THBookViewController *)self displaySettingsControllerDidChangeFlowMode:v6 notifyingCoordinator:0];
  }
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
  double v7 = [(THBookViewController *)self displaySettingsViewController];

  [(THBookViewController *)self displaySettingsController:v7 didChangeStyle:a5];
}

- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4
{
  if (![(THBookViewController *)self displaySettingsViewController])
  {
    id v5 = [(THBookViewController *)self displaySettingsViewController];
    id v6 = [[THApplicationSettings sharedSettings] flowSizeScale];
    [(THBookViewController *)self displaySettingsControllerDidChangeFontSize:v5 toFlowSizeScale:v6];
  }
}

- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4
{
  if (![(THBookViewController *)self displaySettingsViewController])
  {
    id v5 = [(THBookViewController *)self displaySettingsViewController];
    id v6 = [[THApplicationSettings sharedSettings] flowSizeScale];
    [(THBookViewController *)self displaySettingsControllerDidChangeFontSize:v5 toFlowSizeScale:v6];
  }
}

- (void)_accessibilityInvertColorsStatusDidChange:(id)a3
{
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  if (self->_smartInvertEnabled != IsInvertColorsEnabled)
  {
    self->_smartInvertEnabled = IsInvertColorsEnabled;
    [(THBookViewController *)self setTheme:[(THBookViewController *)self themeForStyle:[(THBookViewController *)self appearanceStyle]]];
    [(THBookViewController *)self p_updateFromTheme:1];
  }
}

- (void)dismissActivePopoverIsTransitioning:(BOOL)a3
{
  if (!a3)
  {
    [(THBookViewController *)self dismissBookmarkMenu:0 completion:0];
    [(THBookViewController *)self dismissTOCGlossaryView:0];
    [(THBookViewController *)self dismissDisplaySettings:0];
    [(THBookViewController *)self dismissSearchPopover:0 completion:0];
    [(THBookViewController *)self dismissSharePopover:0];
  }

  +[THWPHighlightController dismissActivePopoverEditor];
}

- (void)dismissActivePopover
{
}

- (THDocumentNavigator)documentNavigator
{
  double v2 = [(THBookViewController *)self documentViewController];

  return [(THDocumentViewController *)v2 documentNavigator];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  [(THBookViewController *)self updateViewBackgroundColor];
  if ((![(THBookDescription *)self->mBookDescription isEpub]
     || [(THTheme *)[(THBookViewController *)self theme] isNight:self])
    && (objc_msgSend(-[THBookViewController traitCollection](self, "traitCollection"), "bc_knownPropertiesEqual:", a4) & 1) == 0)
  {
    [(THBookViewController *)self p_updateFromTheme:1];
    [(THBookViewController *)self settingNavigationBarHidden:[(THBookViewController *)self settingToolbarHidden] animated:0];
  }
  [(THBookViewController *)self p_updateCenterTitle];
  id v6 = [(THBookViewController *)self traitCollection];

  [(THBookViewController *)self p_updateToolbarButtonStatesWithTraits:v6];
}

- (void)showHUDForVendor:(id)a3
{
  id v5 = (UIView *)[a3 viewForHUD];
  if (v5)
  {
    id v6 = v5;
    if ([(THBookViewController *)self HUDOverlayView] != v5)
    {
      double v7 = [(THBookViewController *)self HUDOverlayView];
      [(THBookViewController *)self setHUDVendor:a3];
      [(THBookViewController *)self setHUDOverlayView:v6];
      double v8 = 0.0;
      [(UIView *)[(THBookViewController *)self HUDOverlayView] setAlpha:0.0];
      [-[THBookViewController view](self, "view") addSubview:[self HUDOverlayView]];
      if ([(THBookViewController *)self navigationOverlayView])
      {
        if ([(THNavigationOverlayView *)[(THBookViewController *)self navigationOverlayView] superview])
        {
          double v8 = 0.2;
        }
        else
        {
          double v8 = 0.0;
        }
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_909B0;
      v10[3] = &unk_456DE0;
      v10[4] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_909F8;
      v9[3] = &unk_4585E0;
      v9[4] = v7;
      v9[5] = v6;
      +[UIView animateWithDuration:v10 animations:v9 completion:v8];
    }
  }
}

- (void)hideHUDForVendor:(id)a3
{
  if ([(THBookViewController *)self HUDVendor] == a3)
  {
    [(THBookViewController *)self p_hideHUDView];
  }
}

- (void)temporarilySetHUDViewHidden:(BOOL)a3
{
  double v3 = (double)!a3;
  id v4 = [(THBookViewController *)self HUDOverlayView];

  [(UIView *)v4 setAlpha:v3];
}

- (void)p_hideHUDView
{
  if ([(THBookViewController *)self HUDOverlayView])
  {
    double v3 = [(THBookViewController *)self HUDOverlayView];
    [(THBookViewController *)self setHUDOverlayView:0];
    [(THBookViewController *)self setHUDVendor:0];
    id v4 = [(UIView *)v3 superview];
    if (v4 == [(THBookViewController *)self viewIfLoaded])
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_90CEC;
      v6[3] = &unk_456DE0;
      v6[4] = v3;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_90CF8;
      v5[3] = &unk_4585E0;
      v5[4] = v3;
      void v5[5] = self;
      +[UIView animateWithDuration:v6 animations:v5 completion:0.2];
    }
  }
}

- (CGRect)frameForHUDFromVendor:(id)a3
{
  [self view].bounds;
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGFloat v7 = CGRectGetMaxX(v13) + -40.0;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat v8 = CGRectGetMinX(v14) + 20.0;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v9 = CGRectGetMaxY(v15) + -30.0 + -20.0;
  double v10 = 30.0;
  double v11 = v8;
  double v12 = v7;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)bookOpenTransitionDidEnd
{
  if ([(THBookViewController *)self bookOpenFailed])
  {
    double v3 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", [(id)THBundle() localizedStringForKey:@"Unable to open book." value:&stru_46D7E8 table:0], 0, 1);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_90FB8;
    v4[3] = &unk_457310;
    v4[4] = self;
    -[UIAlertController addAction:](v3, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0], 1, v4));
    [(THBookViewController *)self presentViewController:v3 animated:1 completion:0];
  }
}

- (id)transitionContentView
{
  [(THBookViewController *)self visibleViewController];
  objc_opt_class();
  double v3 = (void *)TSUClassAndProtocolCast();
  if (v3)
  {
    return [v3 transitionContentView];
  }
  else
  {
    id v5 = [(THBookViewController *)self visibleViewController];
    return [(UIViewController *)v5 contentScrollView];
  }
}

- (id)transitionContentBackgroundColor
{
  [(THBookViewController *)self visibleViewController];
  objc_opt_class();
  double v3 = (void *)TSUClassAndProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    return [v3 transitionContentBackgroundColor];
  }
  else
  {
    return [(THBookViewController *)self viewBackgroundColor];
  }
}

- (BOOL)shouldAutorotate
{
  if ([(THBookViewController *)self disallowRotate]
    || +[THWFreeTransformController isFreeTransformInProgress])
  {
    return 0;
  }
  if ([(THDocumentViewController *)[(THBookViewController *)self documentViewController] showingExpandedWidgetView])
  {
    id v4 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] expandedViewController];
  }
  else
  {
    if (![(THBookViewController *)self visibleViewController]) {
      return 1;
    }
    id v4 = [(THBookViewController *)self visibleViewController];
  }

  return [(THWExpandedViewController *)v4 shouldAutorotate];
}

- (void)p_addViewControllerInFront:(id)a3 reason:(id)a4
{
  if ([(THBookViewController *)self visibleViewController] != a3)
  {
    [a3 beginAppearanceTransition:1 animated:0];
    if ([(THBookViewController *)self visibleViewController])
    {
      CGFloat v7 = [(THBookViewController *)self visibleViewController];
      if (v7 == (UIViewController *)[(THBookViewController *)self studyViewController]) {
        [(THBookViewController *)self p_unloadStudyViewController];
      }
    }
    CGFloat v8 = (THBookViewController *)[a3 parentViewController];
    if (v8 != self) {
      [(THBookViewController *)self addChildViewController:a3];
    }
    [self view].bounds;
    objc_msgSend(objc_msgSend(a3, "view"), "setFrame:", v9, v10, v11, v12);
    objc_msgSend(-[THBookViewController view](self, "view"), "insertSubview:belowSubview:", objc_msgSend(a3, "view"), -[THNavigationBarController view](-[THBookViewController navigationBarController](self, "navigationBarController"), "view"));
    if (v8 != self) {
      [a3 didMoveToParentViewController:self];
    }
    [a3 endAppearanceTransition];
    [(THBookViewController *)self p_setVisibleViewControllerToViewController:a3 reason:a4];
  }
}

- (void)p_addViewControllerInBack:(id)a3
{
}

- (void)p_addViewControllerInBack:(id)a3 animated:(BOOL)a4
{
  [a3 beginAppearanceTransition:1 animated:0];
  if ([(THBookViewController *)self visibleViewController] == a3) {
    [(THBookViewController *)self setVisibleViewController:0];
  }
  id v6 = (THBookViewController *)[a3 parentViewController];
  if (v6 == self) {
    [(THBookViewController *)self addChildViewController:a3];
  }
  [self view].bounds;
  objc_msgSend(objc_msgSend(a3, "view"), "setFrame:", v7, v8, v9, v10);
  [self view].insertSubviewAtBack:[a3 view];
  if (v6 == self) {
    [a3 didMoveToParentViewController:self];
  }

  [a3 endAppearanceTransition];
}

- (void)p_removeViewController:(id)a3
{
  if ([a3 isViewLoaded])
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "view"), "superview");
    if (v5 == [(THBookViewController *)self viewIfLoaded])
    {
      [a3 beginAppearanceTransition:0 animated:0];
      if ([(THBookViewController *)self visibleViewController] == a3) {
        [(THBookViewController *)self setVisibleViewController:0];
      }
      objc_msgSend(objc_msgSend(a3, "view"), "removeFromSuperview");
      if ([(THBookViewController *)self documentViewController] == a3) {
        [(THBookViewController *)self p_hideHUDView];
      }
      [a3 endAppearanceTransition];
    }
  }
}

- (void)bookView:(id)a3 didMoveToWindow:(id)a4
{
  if (a4)
  {
    if (self->mBookOpener) {
      [(THBookViewController *)self p_finishBookLoadIfReady];
    }
  }
}

- (void)readingStatisticsCollector:(id)a3 didShowContentWithCFIs:(id)a4
{
  if ([(THBookViewController *)self readingStatisticsCollector] == a3)
  {
    id v6 = [(THBookViewController *)self assetViewControllerDelegate];
    [(AEAssetViewControllerDelegate *)v6 assetViewController:self didShowContentWithCFIs:a4];
  }
}

- (void)readingStatisticsCollector:(id)a3 willHideContentWithCFIs:(id)a4
{
  if ([(THBookViewController *)self readingStatisticsCollector] == a3)
  {
    id v6 = [(THBookViewController *)self assetViewControllerDelegate];
    [(AEAssetViewControllerDelegate *)v6 assetViewController:self willHideContentWithCFIs:a4];
  }
}

- (BOOL)readingStatisticsCollector:(id)a3 needTextNodeCharacterCountsForOrdinal:(int64_t)a4
{
  if ([(THBookViewController *)self readingStatisticsCollector] != a3) {
    return 0;
  }
  double v7 = [(THBookViewController *)self assetViewControllerDelegate];

  return [(AEAssetViewControllerDelegate *)v7 needTextNodeCharacterCountsForOrdinal:a4];
}

- (void)readingStatisticsCollector:(id)a3 addTextNodeCharacterCounts:(id)a4 ordinal:(int64_t)a5 completion:(id)a6
{
  if ([(THBookViewController *)self readingStatisticsCollector] == a3)
  {
    double v10 = [(THBookViewController *)self assetViewControllerDelegate];
    [(AEAssetViewControllerDelegate *)v10 addTextNodeCharacterCounts:a4 ordinal:a5 completion:a6];
  }
}

- (BOOL)readingStatisticsCollector:(id)a3 needTOCEntriesForOrdinal:(int64_t)a4
{
  if ([(THBookViewController *)self readingStatisticsCollector] != a3) {
    return 0;
  }
  double v7 = [(THBookViewController *)self assetViewControllerDelegate];

  return [(AEAssetViewControllerDelegate *)v7 needTOCEntriesForOrdinal:a4];
}

- (void)readingStatisticsCollector:(id)a3 addTOCEntries:(id)a4 ordinal:(int64_t)a5 completion:(id)a6
{
  if ([(THBookViewController *)self readingStatisticsCollector] == a3)
  {
    double v10 = [(THBookViewController *)self assetViewControllerDelegate];
    [(AEAssetViewControllerDelegate *)v10 addTOCEntries:a4 ordinal:a5 completion:a6];
  }
}

- (void)documentViewController:(id)a3 bodyReps:(id)a4 visibleRectIs:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  if ([(THBookViewController *)self documentViewController] == a3)
  {
    double v11 = [(THBookViewController *)self readingStatisticsCollector];
    -[THReadingStatisticsCollector bodyReps:visibleRectIs:](v11, "bodyReps:visibleRectIs:", a4, x, y, width, height);
  }
}

- (void)_checkIfScanningReadingStatisticsCanBegin
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(THBookViewController *)self bookLoadedSuccessfully]
    && [(THBookViewController *)self readingStatisticsControllerLoaded]
    && ![(THBookViewController *)self startedScanningReadingStatistics])
  {
    [(THBookViewController *)self setStartedScanningReadingStatistics:1];
    double v3 = [(THBookViewController *)self readingStatisticsCollector];
    id v4 = [(THBookViewController *)self documentRoot];
    [(THReadingStatisticsCollector *)v3 scanReadingStatisticsWithDocumentRoot:v4];
  }
}

- (id)contentSubType
{
  return +[BAContentSubType rmt];
}

- (void)bc_analyticsVisibilityDidAppear
{
  if ([(THBookViewController *)self analyticsReadStartDate])
  {

    [(THBookViewController *)self setAnalyticsReadStartDate:0];
  }
  [(THBookViewController *)self setAnalyticsReadStartDate:+[NSDate date]];
  [(THBookViewController *)self setAnalyticsReadStartProgress:[(THBookViewController *)self _analyticsReadingProgress]];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_919C0;
  v3[3] = &unk_457140;
  v3[4] = self;
  +[BADoNotDisturbHelper fetchCurrentState:v3];
}

- (void)bc_analyticsVisibilityWillDisappear
{
  id v3 = [(THBookViewController *)self ba_effectiveAnalyticsTracker];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = sub_8A184;
  v17[4] = sub_8A194;
  id v18 = 0;
  id v18 = [v3 newSessionAssertion];
  id v4 = [(THBookViewController *)self contentData];
  id v5 = [(THBookViewController *)self _analyticsContentSettingsData];
  id v6 = [(THBookViewController *)self _analyticsReadingSettingsData];
  id v7 = [(THBookViewController *)self readingSessionData];
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3052000000;
  CGRect v14 = sub_8A184;
  CGRect v15 = sub_8A194;
  id v16 = 0;
  id v16 = [(THBookViewController *)self analyticsReadStartDate];
  id v8 = (id)v12[5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_91BF0;
  v10[3] = &unk_458628;
  v10[4] = v3;
  void v10[5] = self;
  void v10[6] = v7;
  v10[7] = v4;
  v10[8] = v6;
  v10[9] = v5;
  v10[10] = &v11;
  v10[11] = v17;
  +[BADoNotDisturbHelper fetchCurrentState:v10];
  [(NSDate *)[(THBookViewController *)self analyticsReadStartDate] timeIntervalSinceNow];
  [(-[THBookViewController _analyticsSessionHost](self, "_analyticsSessionHost")) readSessionDidEnd:(-[AEAsset assetID](-[THBookViewController asset](self, "asset"), "assetID")) readTime:-v9];
  [(THBookViewController *)self setAnalyticsReadStartDate:0];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v17, 8);
}

- (void)emitReadingOrientationChangeEventIfNeeded
{
  if ((char *)[+[UIDevice currentDevice] orientation]- 3 >= (unsigned char *)&dword_0 + 2)id v3 = &dword_0 + 1; {
  else
  }
    id v3 = &dword_0 + 2;
  if ((void *)[(THBookViewController *)self lastAnalyticsDeviceOrientationReported] != v3)
  {
    [+[BAEventReporter sharedReporter] emitReadingOrientationChangeEventWithTracker:[self ba_effectiveAnalyticsTracker] readingSessionData:[self readingSessionDataForSearchViewController:0] contentData:[self contentDataForSearchViewController:0]];
    [(THBookViewController *)self setLastAnalyticsDeviceOrientationReported:v3];
  }
}

- (id)readingSessionData
{
  id v3 = [(THBookViewController *)self _analyticsReadingProgress];
  id v4 = +[NSNumber numberWithBool:[(THBookViewController *)self p_isSampleBook]];
  id v5 = objc_alloc((Class)BAReadingSessionData);
  id v6 = [(THBookViewController *)self analyticsReadStartProgress];
  int64_t v7 = [(THBookViewController *)self lastAnalyticsDeviceOrientationReported];

  return [v5 initWithPercentCompletionStart:v6 percentCompletionEnd:v3 isFreeSample:v4 deviceOrientation:v7];
}

- (id)contentData
{
  id v3 = [(THBookViewController *)self assetViewControllerDelegate];
  id v4 = [(THBookViewController *)self contentSubType];
  id v5 = [(THBookViewController *)self ba_effectiveAnalyticsTracker];

  return [(AEAssetViewControllerDelegate *)v3 analyticsContentDataForAssetViewController:self contentSubType:v4 tracker:v5];
}

- (BOOL)_inAnalyticsReadSession
{
  return [(THBookViewController *)self analyticsReadStartDate] != 0;
}

- (id)_analyticsReadingProgress
{
  if ([(THBookViewController *)self p_isSampleBook])
  {
    id v3 = [(THBookViewController *)self documentNavigator];
    return [(THDocumentNavigator *)v3 readingProgressAllowSample:1];
  }
  else
  {
    id v4 = [[-[THBookViewController documentRoot](self, "documentRoot")] annotationController];
    return [v4 readingProgress];
  }
}

- (id)_analyticsSessionHost
{
  id v2 = [(THBookViewController *)self im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___BASessionHostProviding];

  return [v2 analyticsSessionHost];
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  return [(THBookViewController *)self assetViewControllerDelegate] != 0;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (id)_analyticsContentSettingsData
{
  id v2 = [[-[THDocumentViewController documentViewController](self, "documentViewController") documentRoot] annotationController];
  id v3 = [v2 numberOfBookmarks];
  id v4 = [v2 allAnnotations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 annotationType] == 2)
        {
          if ([v11 annotationNote]) {
            ++v8;
          }
          else {
            ++v7;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  return [objc_alloc((Class)BAContentSettingsData) initWithBookmarkCount:[NSNumber numberWithUnsignedInteger:v3] noteCount:[NSNumber numberWithUnsignedInteger:v8] highlightCount:[NSNumber numberWithUnsignedInteger:v7]];
}

- (id)_analyticsReadingSettingsData
{
  unsigned int v3 = [(THBookDescription *)[(THBookViewController *)self bookDescription] isEpub];
  unsigned int v4 = [(THDocumentViewController *)[(THBookViewController *)self documentViewController] inFlowMode];
  unsigned int v5 = v4;
  if ((v3 & 1) != 0 || v4)
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)[(THBookViewController *)self documentViewController] configuration] fontSize];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    id v6 = 0;
  }
  [+[UIScreen mainScreen] brightness];
  double v8 = v7;
  if (v3)
  {
    if (+[IMTheme isAutoNightModeEnabled]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    id v10 = +[BAUtilities backgroundColorFromThemeIdentifier:[(THTheme *)[(THBookViewController *)self theme] themeIdentifier]];
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &dword_4;
  }
  if (v5) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  id v12 = objc_alloc((Class)BAReadingSettingsData);
  if (!v6) {
    id v6 = (NSNumber *)&off_499120;
  }
  id v13 = [v12 initWithScrollViewStatus:v11 autoNightThemeStatus:v9 backgroundColor:v10 font:&stru_46D7E8 fontSize:v6 brightnessLevel:[NSNumber numberWithDouble:v8]];

  return v13;
}

- (BOOL)shouldAllowToolbarHover
{
  if ([(THBookViewController *)self isNotesFullscreenVisible]
    || [(THBookViewController *)self isGlossaryVisible]
    || [(THBookViewController *)self isStudyViewControllerVisible])
  {
    return 0;
  }
  unsigned int v4 = [(THBookViewController *)self p_selectedTocViewController];
  if (v4 == [(THBookViewController *)self visibleViewController]) {
    return [(UIViewController *)v4 introMediaControllerIsActive] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4
{
  if (self->_hoverInteraction == a3
    && [a3 isHovering]
    && [(THBookViewController *)self shouldAllowToolbarHover]
    && [a4 containsObject:@"control"])
  {
    if ([a3 stateForRegionWithKey:@"control"])
    {
      [(THBookViewController *)self showToolbarAnimated:1];
      [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setScrubberHiddenAnimated:0];
      self->_toolbarEnabledViaHover = 1;
    }
  }
}

- (void)hoverInteractionDidSettle:(id)a3
{
  if (([a3 stateForRegionWithKey:@"control"] & 1) == 0
    && [a3 isHovering]
    && [(THBookViewController *)self shouldAllowToolbarHover]
    && self->_toolbarEnabledViaHover)
  {
    [(THBookViewController *)self hideToolbarAnimated:1];
    [(THDocumentViewController *)[(THBookViewController *)self documentViewController] setScrubberHiddenAnimated:1];
    self->_toolbarEnabledViaHover = 0;
  }
}

- (void)buildHoverRegions
{
  hoverInteraction = self->_hoverInteraction;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_9259C;
  v3[3] = &unk_458650;
  v3[4] = self;
  [(BCUIHoverInteraction *)hoverInteraction rebuildRegionWithKey:@"control" block:v3];
}

- (BOOL)_isShowingContent
{
  unsigned int v3 = [(THBookViewController *)self visibleViewController];
  return v3 == (UIViewController *)[(THBookViewController *)self documentViewController];
}

- (BOOL)_canSearch
{
  BOOL v3 = [(THBookViewController *)self _isShowingContent];
  if (v3) {
    LOBYTE(v3) = [(THBookViewController *)self presentedViewController] == 0;
  }
  return v3;
}

- (BOOL)_canShowGlossaryOrStudyCards
{
  return (uint64_t)[-[THBookViewController documentRoot](self, "documentRoot") glossary] entryCount] > 0;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if ([(UIViewController *)[(THBookViewController *)self visibleViewController] canPerformAction:a3 withSender:a4])
  {
    return [(THBookViewController *)self visibleViewController];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THBookViewController;
    return [(THBookViewController *)&v8 targetForAction:a3 withSender:a4];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THBookViewController;
  unsigned int v6 = [(THBookViewController *)&v9 canPerformAction:a3 withSender:a4];
  if (sel_isEqual(a3, "books_toggleBookmark:"))
  {
    if (v6) {
      return [(THBookViewController *)self isBookmarkApplicable];
    }
    return 0;
  }
  if (sel_isEqual(a3, "books_setThemeWhite:")
    || sel_isEqual(a3, "books_setThemeSepia:")
    || sel_isEqual(a3, "books_setThemeGray:")
    || sel_isEqual(a3, "books_setThemeNight:"))
  {
    if (v6) {
      return [self documentRoot].isEPUB;
    }
    return 0;
  }
  if (sel_isEqual(a3, "books_find:"))
  {
    if (v6) {
      return [(THBookViewController *)self _canSearch];
    }
    return 0;
  }
  if (sel_isEqual(a3, "books_increaseSize:"))
  {
    if (v6) {
      return [(THBookViewController *)self canIncreaseFontSize];
    }
    return 0;
  }
  if (sel_isEqual(a3, "books_decreaseSize:"))
  {
    if (v6) {
      return [(THBookViewController *)self canDecreaseFontSize];
    }
    return 0;
  }
  if (!sel_isEqual(a3, "books_showStudyCards:"))
  {
    BOOL isEqual = sel_isEqual(a3, "books_showGlossary:");
    if ((isEqual & v6 & 1) == 0) {
      return v6 & ~isEqual;
    }
    return [(THBookViewController *)self _canShowGlossaryOrStudyCards];
  }
  if (v6) {
    return [(THBookViewController *)self _canShowGlossaryOrStudyCards];
  }
  return 0;
}

- (void)validateCommand:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)THBookViewController;
  -[THBookViewController validateCommand:](&v13, "validateCommand:");
  unsigned int v5 = (const char *)[a3 action];
  unsigned int v6 = [(THBookViewController *)self theme];
  if (v5 == "books_toggleBookmark:")
  {
    unsigned int v10 = [(THBookViewController *)self isPageBookmarked];
    uint64_t v11 = (void *)THBundle();
    if (v10) {
      CFStringRef v12 = @"Remove Bookmark";
    }
    else {
      CFStringRef v12 = @"Bookmark Page";
    }
    [a3 setTitle:[v11 localizedStringForKey:v12 value:&stru_46D7E8 table:0]];
  }
  else
  {
    double v7 = v6;
    if (sel_isEqual(v5, "books_setThemeWhite:"))
    {
      id v8 = [(THTheme *)v7 themeIdentifier];
      objc_super v9 = &kIMThemeIdentifierWhitePageTheme;
    }
    else if (sel_isEqual(v5, "books_setThemeSepia:"))
    {
      id v8 = [(THTheme *)v7 themeIdentifier];
      objc_super v9 = &kIMThemeIdentifierSepiaPageTheme;
    }
    else if (sel_isEqual(v5, "books_setThemeGray:"))
    {
      id v8 = [(THTheme *)v7 themeIdentifier];
      objc_super v9 = &kIMThemeIdentifierGrayPageTheme;
    }
    else
    {
      if (!sel_isEqual(v5, "books_setThemeNight:")) {
        return;
      }
      id v8 = [(THTheme *)v7 themeIdentifier];
      objc_super v9 = &kIMThemeIdentifierNightPageTheme;
    }
    [a3 setState:[v8 isEqualToString:*v9]];
  }
}

- (THBookDescription)bookDescription
{
  return self->mBookDescription;
}

- (void)setBookDescription:(id)a3
{
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  return (AEAssetViewControllerDelegate *)objc_loadWeak((id *)&self->mAssetViewControllerDelegate);
}

- (void)setAssetViewControllerDelegate:(id)a3
{
}

- (void)setFlowToCTableViewController:(id)a3
{
}

- (void)setFlowTocViewController:(id)a3
{
}

- (THiOSStudyViewController)studyViewController
{
  return self->mStudyViewController;
}

- (void)setStudyViewController:(id)a3
{
}

- (void)setChapterBrowserController:(id)a3
{
}

- (THBookmarkMenuPopoverViewController)bookmarkViewController
{
  return self->mBookmarkViewController;
}

- (void)setBookmarkViewController:(id)a3
{
}

- (THNavigationHistoryStepperController)navigationHistoryStepperController
{
  return self->navigationHistoryStepperController;
}

- (void)setNavigationHistoryStepperController:(id)a3
{
}

- (THNavigationOverlayView)navigationOverlayView
{
  return self->navigationOverlayView;
}

- (void)setNavigationOverlayView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->mTitleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (BCDisplayOnlyNavigationBar)titleLabelNavigationBar
{
  return self->mTitleLabelNavigationBar;
}

- (void)setTitleLabelNavigationBar:(id)a3
{
}

- (UIButton)actionlessBookmarkButton
{
  return self->mActionlessBookmarkButton;
}

- (void)setActionlessBookmarkButton:(id)a3
{
}

- (THNavigationBarController)navigationBarController
{
  return self->mNavigationBarController;
}

- (void)setNavigationBarController:(id)a3
{
}

- (THDocumentViewController)documentViewController
{
  return self->mDocumentViewController;
}

- (void)setDocumentViewController:(id)a3
{
}

- (void)setNotesFullscreenViewController:(id)a3
{
}

- (THTOCGlossaryMenuPopoverViewController)TOCGlossaryViewController
{
  return self->mTOCGlossaryViewController;
}

- (void)setTOCGlossaryViewController:(id)a3
{
}

- (THDisplaySettingsViewController)displaySettingsViewController
{
  return self->mDisplaySettingsViewController;
}

- (void)setDisplaySettingsViewController:(id)a3
{
}

- (void)setBookLinkResolver:(id)a3
{
}

- (NSString)openingCFIOverride
{
  return self->mOpeningCFIOverride;
}

- (void)setOpeningCFIOverride:(id)a3
{
}

- (NSString)openingFragmentOverride
{
  return self->mOpeningFragmentOverride;
}

- (void)setOpeningFragmentOverride:(id)a3
{
}

- (unint64_t)openingAbsolutePageIndexOverride
{
  return self->mOpeningAbsolutePageIndexOverride;
}

- (void)setOpeningAbsolutePageIndexOverride:(unint64_t)a3
{
  self->mOpeningAbsolutePageIndexOverride = a3;
}

- (BKLocation)openingLocationOverride
{
  return self->mOpeningLocationOverride;
}

- (void)setOpeningLocationOverride:(id)a3
{
}

- (THiOSIntroMediaViewController)introMediaViewController
{
  return self->mIntroMediaViewController;
}

- (void)setIntroMediaViewController:(id)a3
{
}

- (BOOL)isCompleteBook
{
  return self->mIsCompleteBook;
}

- (BOOL)openAnimationDidFinish
{
  return self->mOpenAnimationDidFinish;
}

- (THWFreeTransformController)canvasExitFreeTransformController
{
  return self->mCanvasExitTransformController;
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return self->mContentOpenAnimator;
}

- (void)setContentOpenAnimator:(id)a3
{
}

- (THTheme)theme
{
  return self->mTheme;
}

- (void)setTheme:(id)a3
{
}

- (NSObject)bookPositionProcessor
{
  return self->mBookPositionProcessor;
}

- (void)setBookPositionProcessor:(id)a3
{
}

- (UIAlertController)fontDownloadAlertController
{
  return self->mFontDownloadAlertController;
}

- (void)setFontDownloadAlertController:(id)a3
{
}

- (THSearchViewController)searchViewController
{
  return self->_searchViewController;
}

- (void)setSearchViewController:(id)a3
{
}

- (UIColor)viewBackgroundColor
{
  return self->_viewBackgroundColor;
}

- (void)setViewBackgroundColor:(id)a3
{
}

- (BOOL)paginationInProgress
{
  return self->_paginationInProgress;
}

- (void)setPaginationInProgress:(BOOL)a3
{
  self->_paginationInProgress = a3;
}

- (BCUIHoverInteraction)hoverInteraction
{
  return self->_hoverInteraction;
}

- (void)setHoverInteraction:(id)a3
{
}

- (BOOL)bookOpenFailed
{
  return self->_bookOpenFailed;
}

- (void)setBookOpenFailed:(BOOL)a3
{
  self->_bookOpenFailed = a3;
}

- (BOOL)toolbarEnabledViaHover
{
  return self->_toolbarEnabledViaHover;
}

- (void)setToolbarEnabledViaHover:(BOOL)a3
{
  self->_toolbarEnabledViaHover = a3;
}

- (BOOL)performanceModeBookOpening
{
  return self->_performanceModeBookOpening;
}

- (id)snapshotBlock
{
  return self->_snapshotBlock;
}

- (void)setSnapshotBlock:(id)a3
{
}

- (int64_t)doNotDisturbStatusAtStart
{
  return self->_doNotDisturbStatusAtStart;
}

- (void)setDoNotDisturbStatusAtStart:(int64_t)a3
{
  self->_doNotDisturbStatusAtStart = a3;
}

- (int64_t)lastAnalyticsDeviceOrientationReported
{
  return self->_lastAnalyticsDeviceOrientationReported;
}

- (void)setLastAnalyticsDeviceOrientationReported:(int64_t)a3
{
  self->_lastAnalyticsDeviceOrientationReported = a3;
}

- (UIViewController)visibleViewController
{
  return self->_visibleViewController;
}

- (void)setVisibleViewController:(id)a3
{
}

- (THiOSDocument)document
{
  return self->_document;
}

- (void)setBookmarkButtonItem:(id)a3
{
}

- (void)setBookmarkButton:(id)a3
{
}

- (void)setBrightnessButtonItem:(id)a3
{
}

- (void)setAppearanceButtonItem:(id)a3
{
}

- (void)setSearchButtonItem:(id)a3
{
}

- (void)setNotesButtonItem:(id)a3
{
}

- (void)setTocGlossaryButtonItem:(id)a3
{
}

- (void)setCloseButtonItem:(id)a3
{
}

- (void)setCloseTOCButtonItem:(id)a3
{
}

- (void)setShareButtonItem:(id)a3
{
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (int64_t)styleBeforeAutoNight
{
  return self->_styleBeforeAutoNight;
}

- (void)setStyleBeforeAutoNight:(int64_t)a3
{
  self->_int64_t styleBeforeAutoNight = a3;
}

- (BOOL)bookOpenDestinationIsTOC
{
  return self->_bookOpenDestinationIsTOC;
}

- (void)setBookOpenDestinationIsTOC:(BOOL)a3
{
  self->_bookOpenDestinationIsTOC = a3;
}

- (BOOL)presentingGlossary
{
  return self->_presentingGlossary;
}

- (void)setPresentingGlossary:(BOOL)a3
{
  self->_presentingGlossardouble y = a3;
}

- (BOOL)settingToolbarHidden
{
  return self->_settingToolbarHidden;
}

- (void)setSettingToolbarHidden:(BOOL)a3
{
  self->_settingToolbarHidden = a3;
}

- (BOOL)transitioningTOCSize
{
  return self->_transitioningTOCSize;
}

- (void)setTransitioningTOCSize:(BOOL)a3
{
  self->_transitioningTOCSize = a3;
}

- (BOOL)disallowRotate
{
  return self->_disallowRotate;
}

- (void)setDisallowRotate:(BOOL)a3
{
  self->_disallowRotate = a3;
}

- (UIView)HUDOverlayView
{
  return self->_HUDOverlayView;
}

- (void)setHUDOverlayView:(id)a3
{
}

- (THHUDVending)HUDVendor
{
  return self->_HUDVendor;
}

- (void)setHUDVendor:(id)a3
{
  self->_HUDVendor = (THHUDVending *)a3;
}

- (NSNumber)readingProgressHighwaterMark
{
  return self->_readingProgressHighwaterMark;
}

- (void)setReadingProgressHighwaterMark:(id)a3
{
}

- (THReadingStatisticsCollector)readingStatisticsCollector
{
  return self->_readingStatisticsCollector;
}

- (void)setReadingStatisticsCollector:(id)a3
{
}

- (BOOL)bookLoadedSuccessfully
{
  return self->_bookLoadedSuccessfully;
}

- (void)setBookLoadedSuccessfully:(BOOL)a3
{
  self->_bookLoadedSuccessfulldouble y = a3;
}

- (BOOL)readingStatisticsControllerLoaded
{
  return self->_readingStatisticsControllerLoaded;
}

- (void)setReadingStatisticsControllerLoaded:(BOOL)a3
{
  self->_readingStatisticsControllerLoaded = a3;
}

- (BOOL)startedScanningReadingStatistics
{
  return self->_startedScanningReadingStatistics;
}

- (void)setStartedScanningReadingStatistics:(BOOL)a3
{
  self->_startedScanningReadingStatistics = a3;
}

- (NSDate)analyticsReadStartDate
{
  return self->_analyticsReadStartDate;
}

- (void)setAnalyticsReadStartDate:(id)a3
{
}

- (NSNumber)analyticsReadStartProgress
{
  return self->_analyticsReadStartProgress;
}

- (void)setAnalyticsReadStartProgress:(id)a3
{
}

- (BOOL)smartInvertEnabled
{
  return self->_smartInvertEnabled;
}

- (void)setSmartInvertEnabled:(BOOL)a3
{
  self->_smartInvertEnabled = a3;
}

- (void).cxx_destruct
{
}

@end