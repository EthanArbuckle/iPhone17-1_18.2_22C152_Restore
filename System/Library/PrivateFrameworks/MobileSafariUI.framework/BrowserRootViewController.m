@interface BrowserRootViewController
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)_interfaceFillsScreen;
- (BOOL)_isShowingEmbeddedSidebar;
- (BOOL)_isShowingFindOnPage;
- (BOOL)_isTrackingDropSession;
- (BOOL)_navigationBarIsExpandedOnTop;
- (BOOL)_shouldHideUnifiedBar;
- (BOOL)_shouldInterceptBottomGesture;
- (BOOL)_shouldPositionBottomToolbarAboveKeyboard;
- (BOOL)_shouldShowSidebarContentDimmingView;
- (BOOL)_shouldShowThemeColorInTopBar;
- (BOOL)_showsTopBackdrop;
- (BOOL)_usesWebpageStatusBar;
- (BOOL)barStateAllowsHidingHomeIndicator;
- (BOOL)becomeFirstResponder;
- (BOOL)browserToolbarShouldHitTestAsOpaque:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)capsuleNavigationBarViewController:(id)a3 shouldUnminimizeOnScrollForScrollView:(id)a4;
- (BOOL)capsuleNavigationBarViewControllerAllowsMinimizationGesture:(id)a3;
- (BOOL)documentSafeAreaInsetsFrozen;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)inElementFullscreenForTabDocumentView:(id)a3;
- (BOOL)insetsContentContainerFromStatusBar;
- (BOOL)isInYttriumMode;
- (BOOL)isInYttriumState;
- (BOOL)isInteractivelyMinimizingBars;
- (BOOL)isPerformingSizeTransition;
- (BOOL)isShowingDefaultBrowserSheet;
- (BOOL)isShowingLockedPrivateBrowsingView;
- (BOOL)isShowingPrivateBrowsingExplanationSheet;
- (BOOL)isShowingSidebar;
- (BOOL)isShowingTabBar;
- (BOOL)isTogglingTabBar;
- (BOOL)isUsingBottomCapsule;
- (BOOL)keepBarsMinimized;
- (BOOL)needsScrollToTopView;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)pullToRefreshIsEnabled;
- (BOOL)safari_wantsTransparentApplicationBackground;
- (BOOL)shouldFreezeWebViewUpdatesForTabDocumentView:(id)a3;
- (BOOL)usesFaintTopSeparator;
- (BOOL)usingLoweredBar;
- (BOOL)usingUnifiedBar;
- (BookmarksBarView)bookmarksBar;
- (BrowserController)browserController;
- (BrowserRootViewController)initWithBrowserController:(id)a3;
- (BrowserRootViewControllerDelegate)delegate;
- (BrowserToolbar)bottomToolbar;
- (CGPoint)_convertDocumentCoordinateSpacePoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)_convertDocumentCoordinateSpaceRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (CGRect)_convertRect:(CGRect)a3 fromViewInDocumentContainer:(id)a4 toCoordinateSpace:(id)a5;
- (CGRect)_frameForBottomToolbarForceHidden:(BOOL)a3;
- (CGRect)_frameForCatalogView;
- (CGRect)_frameForContentContainerView;
- (CGRect)_frameForNavigationBar;
- (CGRect)_frameForSidebarWhenShowing:(BOOL)a3;
- (CGRect)_sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:(BOOL)a3;
- (CGRect)bottomToolbarFrameInCoordinateSpace:(id)a3 includeKeyboard:(BOOL)a4;
- (CGRect)contentContainerViewFrameForBrowserSize:(CGSize)a3;
- (CGRect)contentFrameInPageView;
- (CGRect)navigationBarFrameInCoordinateSpace:(id)a3;
- (CGSize)_webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:(BOOL)a3;
- (CGSize)contentSizeForSnapshotGenerator:(id)a3;
- (CGSize)webViewMaximumUnobscuredLayoutSize;
- (CGSize)webViewMinimumLayoutSize;
- (CGSize)webViewMinimumUnobscuredLayoutSize;
- (CapsuleNavigationBarViewController)capsuleViewController;
- (CatalogViewController)catalogViewController;
- (NSArray)bars;
- (NSNumber)capsuleCollectionViewLayout;
- (NavigationBar)navigationBar;
- (SFBannerTheme)bannerTheme;
- (SFBarAnimating)currentBarAnimator;
- (SFLockedPrivateBrowsingView)lockedPrivateBrowsingView;
- (SFScreenTimeOverlayViewController)screenTimeOverlayViewController;
- (SFScrollIndicatorInsets)scrollIndicatorInsetsForTabDocumentView:(SEL)a3;
- (SFThemeColorEffectView)topBackdrop;
- (SFTipsCoordinator)tipsCoordinator;
- (SFWebpageStatusBarView)statusBarView;
- (SidebarContentDimmingView)sidebarContentDimmingView;
- (SidebarUIProxyDelegate)sidebarUIProxyDelegate;
- (SidebarViewController)sidebarViewController;
- (TabBar)tabBar;
- (TabBarManager)tabBarManager;
- (TabHoverPreview)tabHoverPreview;
- (TabSwitcherViewController)tabSwitcherViewController;
- (TabThumbnailCollectionView)tabThumbnailCollectionView;
- (UIBarButtonItem)leadingSidebarButtonItem;
- (UIBarButtonItem)sidebarButtonItem;
- (UIBarButtonItem)sidebarTrailingButtonItem;
- (UIButton)floatingSidebarButton;
- (UIButton)sidebarButtonEmbeddedInSidebar;
- (UIEdgeInsets)_avoidanceInsets;
- (UIEdgeInsets)_baseInsetsForHorizontalScrollIndicator;
- (UIEdgeInsets)_baseInsetsForVerticalScrollIndicator;
- (UIEdgeInsets)_loweredBarMaximumObscuredInsets;
- (UIEdgeInsets)_loweredBarMinimumObscuredInsets;
- (UIEdgeInsets)_loweredBarObscuredInsets;
- (UIEdgeInsets)_loweredBarObscuredInsetsIgnoringKeyboard;
- (UIEdgeInsets)_webViewMinimumEffectiveSafeAreaInsets;
- (UIEdgeInsets)_webViewSafeAreaInsets;
- (UIEdgeInsets)maximumObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4 ignoreBarsMinimized:(BOOL)a5;
- (UIEdgeInsets)minimumObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (UIEdgeInsets)obscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (UIEdgeInsets)obscuredInsetsWithComponents:(unint64_t)a3 forRect:(CGRect)a4 inCoordinateSpace:(id)a5;
- (UIEdgeInsets)obscuredScrollViewInsetsConsideringTargetState:(BOOL)a3 insetsDueToSafeArea:(UIEdgeInsets *)a4;
- (UIEdgeInsets)obscuredScrollViewInsetsForTabDocumentView:(id)a3 unobscuredSafeAreaInsets:(UIEdgeInsets *)a4;
- (UIEdgeInsets)scrollViewContentInsetAdjustmentsForTabDocumentView:(id)a3;
- (UIEdgeInsets)sidebarObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (UIEdgeInsets)webViewEffectiveSafeAreaInsets;
- (UIRefreshControl)refreshControl;
- (UIScrollView)scrollView;
- (UIView)clipperView;
- (UIView)documentAndTopBarsContainerView;
- (UIView)tabBarClipperView;
- (UIView)transitionViewForReducedMotion;
- (UIViewController)contentContainerViewController;
- (UIViewController)documentAndTopBarsContainerViewController;
- (UIViewController)hostViewControllerForOverlay;
- (UnifiedBar)unifiedBar;
- (ViewWithCustomNextResponder)contentContainerView;
- (_SFBarCommon)primaryBar;
- (_SFBrowserConfiguration)configuration;
- (_SFDynamicBarAnimator)dynamicBarAnimator;
- (_SFNavigationBarCommon)primaryNavigationBar;
- (_SFNavigationBarCommon)topBar;
- (_SFWebView)webView;
- (double)_bottomBarOffset;
- (double)_topAuxiliaryBarsHeight;
- (double)_totalAdditionalContentHeightForBanners;
- (double)horizontalMarginForCatalogViewInPopover;
- (double)keyboardInsetInCoordinateSpace:(id)a3;
- (double)maximumHeightObscuredByBottomToolbar;
- (double)minimumEffectiveDeviceWidthForTabDocumentView:(id)a3;
- (double)navigationBarDesiredHeight;
- (double)navigationBarSquishedHeight;
- (double)offsetForDynamicBarAnimator;
- (double)topBarsHeightForSnapshotGenerator:(id)a3;
- (id)_activeTabDocumentView;
- (id)_continuousReadingViewController;
- (id)_makeTurnOnLockedPrivateBrowsingViewController;
- (id)_makeWhatsNewInPrivateBrowsingViewController;
- (id)_multitaskingDragExclusionRects;
- (id)_plainTopBackdropGroupName;
- (id)_unifiedField;
- (id)_viewForConvertingToCoordinateSpace:(id)a3;
- (id)borrowCapsuleViewForTab:(id)a3;
- (id)childViewControllerForStatusBarStyle;
- (id)createToolbarForCapsuleNavigationBarViewController:(id)a3;
- (id)intentInteractionCompletion;
- (id)managedTopBanners;
- (id)preferredFocusEnvironments;
- (id)setUpTabSwitcherViewController;
- (id)showTabGroupPicker:(id)a3;
- (id)snapshotContentProviderForTab:(id)a3;
- (id)tabOverview:(id)a3 topBarThemeForItem:(id)a4;
- (int64_t)bookmarksPresentationStyle;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (int64_t)sidebarStyle;
- (int64_t)toolbarPlacement;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)tabDocumentView:(id)a3 contentOffsetAdjustmentEdgeWithPreviousContentInset:(UIEdgeInsets)a4;
- (void)_applyStatusBarBackdropTheme;
- (void)_applyTopBackdropTheme;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_createBottomToolbarIfNeeded;
- (void)_createSidebarContentDimmingViewIfNeeded;
- (void)_destroySidebarContentDimmingViewIfNeeded;
- (void)_dismissPrivateBrowsingExplanationSheet;
- (void)_dismissWebSearchTipPopoverIfNeeded;
- (void)_enterYttriumStateGestureRecognized:(id)a3;
- (void)_exitYttriumStateGestureRecognized:(id)a3;
- (void)_hideNavigationBarGestureRecognized:(id)a3;
- (void)_installTabSwitcherViewController;
- (void)_installTabView;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_layOutBottomToolbar;
- (void)_layOutFloatingSidebarButtonForSidebarShowing:(BOOL)a3;
- (void)_layOutScrollToTopView;
- (void)_layOutSidebar;
- (void)_layOutSidebarContentDimmingView;
- (void)_layOutTabView;
- (void)_layOutTopBackdrop;
- (void)_layOutTopBanners;
- (void)_layOutWebpageStatusBarView;
- (void)_logCurrentLayoutState;
- (void)_prepareBarsForTransitionFromPreviousToolbarPlacement:(int64_t)a3;
- (void)_prepareToShowSidebarViewControllerIfNeeded;
- (void)_pushTurnOnLockedPrivateBrowsingPromptIfNeeded;
- (void)_receivedTouchDown:(id)a3;
- (void)_receivedTouchUp:(id)a3;
- (void)_refreshControlFired:(id)a3;
- (void)_registerLayoutStateUpdateHandler;
- (void)_setShowingFloatingSidebarButton:(BOOL)a3;
- (void)_setToolbarPlacement:(int64_t)a3;
- (void)_setTopBackdropTheme:(id)a3 animated:(BOOL)a4;
- (void)_setTopBackdropUsesPlainTheme:(BOOL)a3;
- (void)_setUpFloatingSidebarButton;
- (void)_setUpRefreshControlIfNeeded;
- (void)_setUpTabGroupButton;
- (void)_setUpWebpageStatusBarIfNeeded;
- (void)_showBarsFromBottomBarTap:(id)a3;
- (void)_showPrivateBrowsingExplanationSheetWithViewController:(id)a3;
- (void)_showWelcomeBrowsingExplanationSheet;
- (void)_sidebarTrailingButtonWasTapped;
- (void)_statusBarHover:(id)a3;
- (void)_tabSwitcherVisibilityDidChange:(BOOL)a3;
- (void)_transitionFromBanner:(id)a3 toBanner:(id)a4 animated:(BOOL)a5;
- (void)_turnOnLockedPrivateBrowsingFromSheet;
- (void)_uninstallTabSwitcherViewController;
- (void)_uninstallTabView;
- (void)_updateAllowsHidingHomeIndicatorMinimized:(BOOL)a3;
- (void)_updateBannerTheme;
- (void)_updateBottomBarHeightAboveKeyboard;
- (void)_updateCapsuleTopSeparatorColor;
- (void)_updateRefreshControl;
- (void)_updateRefreshControlStyle;
- (void)_updateScrollToTopOverride;
- (void)_updateSidebarStyle;
- (void)_updateTabSwitcherSidebarToggle;
- (void)_updateThemeForBanner:(id)a3 animated:(BOOL)a4;
- (void)_updateToolbarForToolbarPlacementAllowingRemoval:(BOOL)a3;
- (void)_updateToolbarPlacementIfNeeded;
- (void)_updateTopBarAllowingRemoval:(BOOL)a3;
- (void)_updateTopBarStyles;
- (void)_updateTopBarStylesAnimated:(BOOL)a3;
- (void)addChildViewController:(id)a3;
- (void)addToastViewController:(id)a3;
- (void)bannerController:(id)a3 didSetAppBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)bannerController:(id)a3 didSetCrashBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)bannerController:(id)a3 didSetPrivateBrowsingPrivacyProtectionsBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)bannerController:(id)a3 didSetRemotelyEnabledExtensionBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)bannerController:(id)a3 didSetTabGroupBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)bannerController:(id)a3 didSetWebExtensionBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)bannerController:(id)a3 didSetWebExtensionPermissionGrantedBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6;
- (void)capsuleCollectionView:(id)a3 selectionGestureDidChangeFromAxis:(unint64_t)a4;
- (void)capsuleCollectionViewDidUpdateMinimizationGesture:(id)a3;
- (void)capsuleNavigationBarViewController:(id)a3 didCreateNavigationBar:(id)a4;
- (void)capsuleNavigationBarViewController:(id)a3 selectedItemWillChangeToState:(int64_t)a4 options:(int64_t)a5 coordinator:(id)a6;
- (void)capsuleNavigationBarViewControllerDidChangeCapsuleFocus:(id)a3 options:(int64_t)a4;
- (void)capsuleNavigationBarViewControllerDidTapVoiceSearch:(id)a3;
- (void)capsuleNavigationBarViewControllerWillHideKeyboard:(id)a3;
- (void)capsuleNavigationController:(id)a3 obscuredInsetsDidChangeWithCoordinator:(id)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didToggleTabBar;
- (void)dismissDefaultBrowserSheet;
- (void)dismissDefaultBrowserSheetForOtherWindows;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)displayHostedScreenTimeView;
- (void)dynamicBarAnimatorOutputsDidChange:(id)a3;
- (void)hideLockedPrivateBrowsingView;
- (void)layOutCatalogView;
- (void)layOutTopBars;
- (void)loadView;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)relinquishBorrowedCapsuleView:(id)a3;
- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4;
- (void)removeToastViewController:(id)a3;
- (void)setBarStateAllowsHidingHomeIndicator:(BOOL)a3;
- (void)setBookmarksBar:(id)a3;
- (void)setCatalogViewController:(id)a3;
- (void)setClipperView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentSafeAreaInsetsFrozen:(BOOL)a3;
- (void)setInYttriumMode:(BOOL)a3;
- (void)setInYttriumState:(BOOL)a3;
- (void)setIntentInteractionCompletion:(id)a3;
- (void)setKeepBarsMinimized:(BOOL)a3;
- (void)setNeedsPreferredStatusBarUpdateAfterCommitAnimated:(BOOL)a3;
- (void)setNeedsScrollToTopView:(BOOL)a3;
- (void)setPullToRefreshIsEnabled:(BOOL)a3;
- (void)setScreenTimeOverlayViewController:(id)a3;
- (void)setShowingSidebar:(BOOL)a3 completion:(id)a4;
- (void)setShowingTabBar:(BOOL)a3;
- (void)setSidebarUIProxyDelegate:(id)a3;
- (void)setTabBar:(id)a3;
- (void)setTabThumbnailCollectionView:(id)a3;
- (void)setTogglingTabBar:(BOOL)a3;
- (void)setUsesFaintTopSeparator:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)showDefaultBrowserSheetWithDisplayHandler:(id)a3;
- (void)showLockedPrivateBrowsingView;
- (void)showTurnOnLockedPrivateBrowsingSheet;
- (void)showWhatsNewInPrivateBrowsingSheet;
- (void)sidebarDimmingViewDismiss:(id)a3;
- (void)stopRefreshing;
- (void)tabBarDropExpansionView:(id)a3 didBeginTrackingDropSession:(id)a4;
- (void)tabBarDropExpansionView:(id)a3 didEndTrackingDropSession:(id)a4;
- (void)tabCollectionViewDidCancelDismissal:(id)a3;
- (void)tabCollectionViewDidDismiss:(id)a3;
- (void)tabCollectionViewWillDismiss:(id)a3;
- (void)tabCollectionViewWillPresent:(id)a3;
- (void)tabOverviewVisibilityDidChange:(BOOL)a3;
- (void)takeOwnershipOfStepperContainer:(id)a3;
- (void)tearDownTabSwitcherViewController;
- (void)toggleSidebar;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAccessibilityIdentifier;
- (void)updateCapsuleLayoutStyle;
- (void)updateCapsuleMinimizationStyle;
- (void)updateOrderedSubviewsForOrderedContainerView:(id)a3;
- (void)updateSuppressesStandaloneTabBar;
- (void)updateTabHoverPreview;
- (void)updateTabViewPinchRecognizer;
- (void)updateThemeColorIfNeededAnimated:(BOOL)a3;
- (void)updateUnifiedBarChromelessScrollDistance;
- (void)updateUnifiedBarVisibility;
- (void)updateUsesLockdownStatusBar;
- (void)updateUsesWebpageStatusBar;
- (void)updateViewForTabDocument:(id)a3;
- (void)updateViewsAfterContentContainerViewBoundsChange;
- (void)updateWebViewSizeAttributes;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)webSearchTipDidBecomeUnavailable;
- (void)willToggleTabBar;
@end

@implementation BrowserRootViewController

- (void)updateWebViewSizeAttributes
{
  if ([(_SFWebView *)self->_webView _isInFullscreen])
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    webView = self->_webView;
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[_SFWebView setHitTestInsets:](webView, "setHitTestInsets:", v3, v4, v6, v7);
  }
  else
  {
    [(BrowserRootViewController *)self contentFrameInPageView];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    v16 = [(BrowserRootViewController *)self contentContainerView];
    [v16 bounds];
    -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self, "contentContainerViewFrameForBrowserSize:", v17, v18);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView, v20, v22, v24, v26);
    CGFloat v54 = v9;
    CGFloat recta = v20 + v27;
    CGFloat v53 = v22 + v28;
    CGFloat v30 = v24 - (v27 + v29);
    CGFloat v32 = v26 - (v28 + v31);
    v58.origin.x = v9;
    v58.origin.y = v11;
    v58.size.width = v13;
    v58.size.height = v15;
    double MinY = CGRectGetMinY(v58);
    v59.origin.x = recta;
    v59.origin.y = v53;
    v59.size.width = v30;
    v59.size.height = v32;
    self->_contentInsetForContentFrame.top = MinY - CGRectGetMinY(v59);
    v60.origin.x = v9;
    v60.origin.y = v11;
    v60.size.width = v13;
    v60.size.height = v15;
    double MinX = CGRectGetMinX(v60);
    v61.origin.x = recta;
    v61.origin.y = v53;
    v61.size.width = v30;
    v61.size.height = v32;
    self->_contentInsetForContentFrame.left = MinX - CGRectGetMinX(v61);
    v62.origin.x = recta;
    v62.origin.y = v53;
    v62.size.width = v30;
    v62.size.height = v32;
    double MaxY = CGRectGetMaxY(v62);
    v63.origin.x = v54;
    v63.origin.y = v11;
    v63.size.width = v13;
    v63.size.height = v15;
    self->_contentInsetForContentFrame.double bottom = MaxY - CGRectGetMaxY(v63);
    v64.origin.x = recta;
    v64.origin.y = v53;
    v64.size.width = v30;
    v64.size.height = v32;
    double MaxX = CGRectGetMaxX(v64);
    v65.origin.x = v54;
    v65.origin.y = v11;
    v65.size.width = v13;
    v65.size.height = v15;
    self->_contentInsetForContentFrame.right = MaxX - CGRectGetMaxX(v65);
    [(BrowserRootViewController *)self _totalAdditionalContentHeightForBanners];
    self->_contentInsetForContentFrame.top = v37 + self->_contentInsetForContentFrame.top;
    _SFRoundEdgeInsetsToPixels();
    self->_contentInsetForContentFrame.top = v38;
    self->_contentInsetForContentFrame.left = v39;
    self->_contentInsetForContentFrame.double bottom = v40;
    self->_contentInsetForContentFrame.right = v41;
    v42 = [(BrowserRootViewController *)self view];
    int v43 = objc_msgSend(v42, "_sf_isFullScreenWidth");

    id rect = objc_loadWeakRetained((id *)&self->_browserController);
    v44 = [rect tabController];
    v45 = [v44 activeTabDocument];

    uint64_t v46 = [rect isShowingInOneThirdMode];
    v47 = [v45 reloadOptionsController];
    [v47 setTryUsingMobileIfPossible:v46];

    [(BrowserRootViewController *)self _updateBottomBarHeightAboveKeyboard];
    [(_SFWebView *)self->_webView _setAllowsViewportShrinkToFit:v43 ^ 1u];
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
    double v49 = v48;
    double bottom = 0.0;
    if (v49 <= 0.0) {
      double bottom = self->_contentInsetForContentFrame.bottom;
    }
    -[_SFWebView setHitTestInsets:](self->_webView, "setHitTestInsets:", 0.0, 0.0, bottom, 0.0);
    v51 = [rect scene];
    -[_SFWebView _setInterfaceOrientationOverride:](self->_webView, "_setInterfaceOrientationOverride:", [v51 interfaceOrientation]);

    v52 = [v45 view];
    [v52 setWebViewGeometryNeedsUpdate];
  }
}

- (ViewWithCustomNextResponder)contentContainerView
{
  [(BrowserRootViewController *)self loadViewIfNeeded];
  contentContainerView = self->_contentContainerView;
  return contentContainerView;
}

- (CGRect)contentContainerViewFrameForBrowserSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ([(BrowserRootViewController *)self insetsContentContainerFromStatusBar])
  {
    double v6 = [(BrowserRootViewController *)self viewIfLoaded];
    [v6 safeAreaInsets];
    double v8 = v7;

    double v9 = -v8;
    double height = height + v8;
  }
  else
  {
    double v9 = 0.0;
  }
  double v10 = 0.0;
  double v11 = width;
  double v12 = height;
  result.size.double height = v12;
  result.size.CGFloat width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  if (_SFDeviceIsPad()) {
    goto LABEL_7;
  }
  double v3 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
  char v4 = WBSIsEqual();

  if (v4) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  uint64_t v6 = [WeakRetained presentationState];

  if (v6 == 3)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_browserController);
    double v11 = [v10 tabController];
    double v12 = [v11 activeTabDocument];
    if ([v12 isShowingSystemStartPage]) {
      catalogViewController = self->_catalogViewController;
    }
    else {
      catalogViewController = 0;
    }
    double v8 = catalogViewController;

    goto LABEL_8;
  }
  if (v6)
  {
LABEL_7:
    double v8 = 0;
  }
  else
  {
    if (self->_willDismissCatalogViewController) {
      double v7 = 0;
    }
    else {
      double v7 = self->_catalogViewController;
    }
    double v8 = v7;
  }
LABEL_8:
  return v8;
}

- (NSNumber)capsuleCollectionViewLayout
{
  v2 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  double v3 = v2;
  if (v2)
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v2, "layoutStyle"));
  }
  else
  {
    char v4 = 0;
  }

  return (NSNumber *)v4;
}

- (UIEdgeInsets)minimumObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  [(BrowserRootViewController *)self _loweredBarMinimumObscuredInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v49 = x;
  if (![(BrowserRootViewController *)self usingLoweredBar] || v15 == 0.0)
  {
    double v31 = 0.0;
    if (![(BrowserRootViewController *)self usingLoweredBar])
    {
      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView safeAreaInsets];
      double v31 = v32;
    }
    [(BrowserRootViewController *)self navigationBarSquishedHeight];
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v9, 0.0, v31 + v33);
  }
  else
  {
    double v18 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    [v18 bounds];
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v9, v13 + v19, v11 + v20, v21 - (v13 + v17), v22 - (v11 + v15));
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    double v48 = v11;
    CGFloat v30 = v29;
    v50.origin.CGFloat x = x;
    v50.origin.double y = y;
    v50.size.double width = width;
    v50.size.double height = height;
    CGRectGetMaxY(v50);
    v51.origin.CGFloat x = v24;
    v51.origin.double y = v26;
    v51.size.double width = v28;
    v51.size.double height = v30;
    CGRectGetMaxY(v51);
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v9, 0.0, v48);
  }
  if ([(BrowserRootViewController *)self _interfaceFillsScreen])
  {
    v34 = [(BrowserRootViewController *)self view];
    [v34 safeAreaInsets];
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v9, 0.0, v35);
  }
  v52.origin.CGFloat x = v49;
  v52.origin.double y = y;
  v52.size.double width = width;
  v52.size.double height = height;
  CGRectGetMinY(v52);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", v9, v49, y, width, height);
  UIEdgeInsetsAdd();
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.right = v47;
  result.double bottom = v46;
  result.left = v45;
  result.top = v44;
  return result;
}

- (UIEdgeInsets)maximumObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4 ignoreBarsMinimized:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  if ([(BrowserRootViewController *)self isInteractivelyMinimizingBars])
  {
    -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", v11, x, y, width, height);
LABEL_6:
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    double v19 = v15;
    goto LABEL_22;
  }
  if (!a5 && self->_keepBarsMinimized)
  {
    -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", v11, x, y, width, height);
    goto LABEL_6;
  }
  if (self->_toolbarPlacement == 1)
  {
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    if (!CGRectIsEmpty(v43))
    {
      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
      double MaxY = CGRectGetMaxY(v44);
      [(BrowserRootViewController *)self maximumHeightObscuredByBottomToolbar];
      -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, MaxY - v21);
      double v23 = v22;
      v45.origin.double x = x;
      v45.origin.double y = y;
      v45.size.double width = width;
      v45.size.double height = height;
      fmax(CGRectGetMaxY(v45) - v23, 0.0);
    }
  }
  BOOL inYttriumState = self->_inYttriumState;
  BOOL v25 = [(BrowserRootViewController *)self usingLoweredBar];
  if (!inYttriumState)
  {
    if (v25)
    {
      [(BrowserRootViewController *)self _loweredBarMaximumObscuredInsets];
      goto LABEL_15;
    }
    CGFloat v28 = [(BrowserRootViewController *)self view];
    [v28 safeAreaInsets];
    double v31 = v30;
    [(BrowserRootViewController *)self navigationBarDesiredHeight];
    double v27 = v31 + v32;
LABEL_18:

    goto LABEL_19;
  }
  if (!v25)
  {
    CGFloat v28 = [(BrowserRootViewController *)self view];
    [v28 safeAreaInsets];
    double v27 = v29;
    goto LABEL_18;
  }
  [(BrowserRootViewController *)self _loweredBarMinimumObscuredInsets];
LABEL_15:
  double v27 = v26;
LABEL_19:
  -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, v27);
  if ([(BrowserRootViewController *)self _interfaceFillsScreen])
  {
    double v33 = [(BrowserRootViewController *)self view];
    [v33 safeAreaInsets];
    -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, v34);
  }
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  CGRectGetMinY(v46);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", v11, x, y, width, height);
  UIEdgeInsetsAdd();
  double v16 = v35;
  double v17 = v36;
  double v19 = v37;
  double v18 = fmax(v38, 0.0);
LABEL_22:

  double v39 = v16;
  double v40 = v17;
  double v41 = v18;
  double v42 = v19;
  result.right = v42;
  result.double bottom = v41;
  result.left = v40;
  result.top = v39;
  return result;
}

- (UIEdgeInsets)obscuredInsetsWithComponents:(unint64_t)a3 forRect:(CGRect)a4 inCoordinateSpace:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  char v9 = a3;
  id v11 = a5;
  if (v9)
  {
    [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:v11];
    double MaxY = CGRectGetMaxY(v55);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    fmax(MaxY - CGRectGetMinY(v56), 0.0);
    if ([(BrowserRootViewController *)self _interfaceFillsScreen])
    {
      double v13 = [(BrowserRootViewController *)self view];
      [v13 safeAreaInsets];
      -[BrowserRootViewController _convertDocumentCoordinateSpacePoint:toCoordinateSpace:](self, "_convertDocumentCoordinateSpacePoint:toCoordinateSpace:", v11, 0.0, v14);
    }
  }
  if ((v9 & 2) != 0 && self->_toolbarPlacement == 1)
  {
    [(BrowserRootViewController *)self bottomToolbarFrameInCoordinateSpace:v11 includeKeyboard:0];
    CGFloat v15 = height;
    CGFloat v17 = v16;
    CGFloat recta = v19;
    CGFloat v54 = v18;
    CGFloat v21 = v20;
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = v15;
    CGRectGetMaxY(v57);
    v58.origin.CGFloat x = v17;
    CGFloat height = v15;
    v58.size.CGFloat width = recta;
    v58.origin.CGFloat y = v54;
    v58.size.CGFloat height = v21;
    CGRectGetMinY(v58);
  }
  if (self->_showingSidebar && ((v9 & 4) != 0 || (v9 & 0xC) == 8 && !self->_sidebarStyle))
  {
    CGFloat v22 = width;
    CGFloat v23 = x;
    CGFloat rect = height;
    CGFloat v24 = -[BrowserRootViewController _viewForConvertingToCoordinateSpace:](self, "_viewForConvertingToCoordinateSpace:", v11, *(void *)&v22, *(void *)&y);
    [(BrowserRootViewController *)self _frameForSidebarWhenShowing:self->_showingSidebar];
    objc_msgSend(v24, "convertRect:toCoordinateSpace:", v11);
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    double v33 = [(BrowserRootViewController *)self view];
    LODWORD(v24) = objc_msgSend(v33, "_sf_usesLeftToRightLayout");

    if (v24)
    {
      v59.origin.CGFloat x = v26;
      v59.origin.CGFloat y = v28;
      v59.size.CGFloat width = v30;
      v59.size.CGFloat height = v32;
      CGRectGetMaxX(v59);
      CGFloat v34 = v23;
      CGFloat v36 = v50;
      CGFloat v35 = v51;
      CGFloat v37 = rect;
    }
    else
    {
      v60.origin.CGFloat x = v23;
      v60.size.CGFloat width = v50;
      v60.origin.CGFloat y = v51;
      v60.size.CGFloat height = rect;
      CGRectGetMaxX(v60);
      CGFloat v34 = v26;
      CGFloat v35 = v28;
      CGFloat v36 = v30;
      CGFloat v37 = v32;
    }
    CGRectGetMinX(*(CGRect *)&v34);
  }
  _SFRoundEdgeInsetsToPixels();
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  double v46 = v39;
  double v47 = v41;
  double v48 = v43;
  double v49 = v45;
  result.right = v49;
  result.double bottom = v48;
  result.left = v47;
  result.top = v46;
  return result;
}

- (BOOL)_interfaceFillsScreen
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained browserViewControllerInterfaceFillsScreen:v2];

  return (char)v2;
}

- (UIEdgeInsets)sidebarObscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.right = v7;
  result.double bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (CGPoint)_convertDocumentCoordinateSpacePoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(BrowserRootViewController *)self _viewForConvertingToCoordinateSpace:v7];
  objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)_convertDocumentCoordinateSpaceRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(BrowserRootViewController *)self _viewForConvertingToCoordinateSpace:v9];
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (id)_viewForConvertingToCoordinateSpace:(id)a3
{
  id v4 = a3;
  p_documentAndTopBarsContainerView = &self->_documentAndTopBarsContainerView;
  id v6 = [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView superview];
  p_contentContainerView = (id *)&self->_contentContainerView;
  id v8 = *p_contentContainerView;

  if (v6 != v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 isDescendantOfView:*p_documentAndTopBarsContainerView]) {
        p_contentContainerView = (id *)p_documentAndTopBarsContainerView;
      }
    }
  }
  id v9 = *p_contentContainerView;

  return v9;
}

- (CGRect)bottomToolbarFrameInCoordinateSpace:(id)a3 includeKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(BrowserRootViewController *)self usingLoweredBar];
  capsuleViewController = self->_capsuleViewController;
  if (v7)
  {
    id v9 = [(CapsuleNavigationBarViewController *)capsuleViewController capsuleCollectionView];
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    if (v4) {
      [(BrowserRootViewController *)self _loweredBarObscuredInsets];
    }
    else {
      [(BrowserRootViewController *)self _loweredBarObscuredInsetsIgnoringKeyboard];
    }
    double v29 = v18;
    v56.origin.double x = v11;
    v56.origin.double y = v13;
    v56.size.double width = v15;
    v56.size.double height = v17;
    CGFloat v30 = CGRectGetHeight(v56) - v29;
    v57.origin.double x = v11;
    v57.origin.double y = v13;
    v57.size.double width = v15;
    v57.size.double height = v17;
    double Width = CGRectGetWidth(v57);
    double v32 = 0.0;
    double v33 = self;
    double v34 = v30;
    double v35 = v29;
    goto LABEL_16;
  }
  if (!capsuleViewController)
  {
LABEL_17:
    [(BrowserRootViewController *)self _frameForBottomToolbarForceHidden:0];
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v6);
    double v41 = v48;
    double v43 = v49;
    double v45 = v50;
    double v47 = v51;
    goto LABEL_18;
  }
  id v9 = [(CapsuleNavigationBarViewController *)capsuleViewController capsuleCollectionView];
  unint64_t v19 = [v9 selectedItemState];
  if (v19 < 2)
  {
    [v9 bounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    if (v4) {
      [v9 obscuredInsets];
    }
    else {
      [v9 obscuredInsetsIgnoringKeyboard];
    }
    double v39 = v28;
    v58.origin.double x = v21;
    v58.origin.double y = v23;
    v58.size.double width = v25;
    v58.size.double height = v27;
    double v37 = CGRectGetHeight(v58) - v39;
    [v9 bounds];
    double Width = CGRectGetWidth(v59);
    double v32 = 0.0;
    goto LABEL_15;
  }
  if (v19 != 2)
  {

    goto LABEL_17;
  }
  [v9 capsuleFrame];
  double v37 = v36;
  double v39 = v38;
LABEL_15:
  double v33 = self;
  double v34 = v37;
  double v35 = v39;
LABEL_16:
  -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](v33, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v6, v32, v34, Width, v35);
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

LABEL_18:
  double v52 = v41;
  double v53 = v43;
  double v54 = v45;
  double v55 = v47;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (CGRect)navigationBarFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  if ([(BrowserRootViewController *)self usingLoweredBar])
  {
    double v5 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    if ([v5 minimizationStyle] == 1)
    {
      [v5 obscuredInsetsForState:0];
      double v7 = v6;
      [v5 obscuredInsets];
      double v9 = v8 - v7;
      double v10 = [(BrowserRootViewController *)self view];
      [v10 bounds];
      double Width = CGRectGetWidth(v29);
    }
    else
    {
      double v10 = [(BrowserRootViewController *)self view];
      [v10 bounds];
      double Width = CGRectGetWidth(v30);
      [v5 obscuredInsets];
      double v7 = v20;
      double v9 = 0.0;
    }
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v4, 0.0, v9, Width, v7);
    double v13 = v21;
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
  }
  else
  {
    [(BrowserRootViewController *)self _frameForNavigationBar];
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v4);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }

  double v25 = v13;
  double v26 = v15;
  double v27 = v17;
  double v28 = v19;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (BOOL)usingLoweredBar
{
  return self->_toolbarPlacement == 1;
}

- (CapsuleNavigationBarViewController)capsuleViewController
{
  return self->_capsuleViewController;
}

- (BOOL)keepBarsMinimized
{
  return self->_keepBarsMinimized;
}

- (BOOL)isInYttriumMode
{
  return self->_inYttriumMode;
}

- (UIEdgeInsets)_loweredBarObscuredInsetsIgnoringKeyboard
{
  v2 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v2 obscuredInsetsIgnoringKeyboard];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.double bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)isInteractivelyMinimizingBars
{
  uint64_t v2 = [(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer state];
  return v2 > 0 && v2 != 5;
}

- (double)maximumHeightObscuredByBottomToolbar
{
  double result = 0.0;
  if (self->_toolbarPlacement == 1)
  {
    [(BrowserRootViewController *)self _loweredBarMaximumObscuredInsets];
    return v3;
  }
  return result;
}

- (UIEdgeInsets)_loweredBarMaximumObscuredInsets
{
  uint64_t v2 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v2 obscuredInsetsForState:0 ignoringKeyboard:1];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 obscuredInsetsForState:1 ignoringKeyboard:1];
  if (v4 + v8 <= v11 + v13)
  {
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }

  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.right = v18;
  result.double bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)_loweredBarMinimumObscuredInsets
{
  uint64_t v2 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v2 obscuredInsetsForState:0 ignoringKeyboard:1];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 obscuredInsetsForState:1 ignoringKeyboard:1];
  if (v4 + v8 >= v11 + v13)
  {
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }

  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.right = v18;
  result.double bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGRect)contentFrameInPageView
{
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", self->_documentAndTopBarsContainerView, 0);
  [(BrowserRootViewController *)self webViewEffectiveSafeAreaInsets];
  UIEdgeInsetsMax();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  double v12 = v6 + v11;
  double v14 = v4 + v13;
  double v16 = v15 - (v6 + v10);
  double v18 = v17 - (v4 + v8);
  result.size.double height = v18;
  result.size.double width = v16;
  result.origin.double y = v14;
  result.origin.double x = v12;
  return result;
}

- (CGSize)_webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", self->_documentAndTopBarsContainerView, v3);
  [(BrowserRootViewController *)self _totalAdditionalContentHeightForBanners];
  [(BrowserRootViewController *)self webViewEffectiveSafeAreaInsets];
  UIEdgeInsetsMax();
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
  UIEdgeInsetsMax();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  double v14 = v13 - (v8 + v12);
  double v16 = v15 - (v6 + v10);
  result.double height = v16;
  result.double width = v14;
  return result;
}

- (void)_updateBottomBarHeightAboveKeyboard
{
  id v4 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
  if (v4 && [v4 integerValue] == 1)
  {
    BOOL v3 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    [v3 minimizedCapsuleHeightAboveKeyboard];
    -[_SFWebView setBottomBarHeightAboveKeyboard:](self->_webView, "setBottomBarHeightAboveKeyboard:");
  }
  else
  {
    [(_SFWebView *)self->_webView setBottomBarHeightAboveKeyboard:0.0];
  }
}

- (UnifiedBar)unifiedBar
{
  return self->_unifiedBar;
}

uint64_t __57__BrowserRootViewController__updateTopBarStylesAnimated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1288) = 0;
  return result;
}

- (BOOL)isShowingTabBar
{
  return self->_showingTabBar;
}

- (void)_updateToolbarPlacementIfNeeded
{
  BOOL v3 = [(BrowserRootViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  p_sizeForToolbarPlacement = &self->_sizeForToolbarPlacement;
  if (self->_sizeForToolbarPlacement.width != v5 || self->_sizeForToolbarPlacement.height != v7)
  {
    p_sizeForToolbarPlacement->double width = v5;
    self->_sizeForToolbarPlacement.double height = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v11 = objc_msgSend(WeakRetained, "browserViewController:toolbarPlacementForViewSize:", self, p_sizeForToolbarPlacement->width, self->_sizeForToolbarPlacement.height);

    [(BrowserRootViewController *)self _setToolbarPlacement:v11];
  }
}

- (TabBarManager)tabBarManager
{
  return self->_tabBarManager;
}

- (CatalogViewController)catalogViewController
{
  return self->_catalogViewController;
}

- (BookmarksBarView)bookmarksBar
{
  return self->_bookmarksBar;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return 4;
}

- (int64_t)preferredCenterStatusBarStyle
{
  return 4;
}

- (void)updateAccessibilityIdentifier
{
  v23[7] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v22[0] = @"UUID";
  double v5 = [WeakRetained UUID];
  uint64_t v6 = [v5 UUIDString];
  double v7 = (void *)v6;
  double v8 = &stru_1F3C268E8;
  if (v6) {
    double v8 = (__CFString *)v6;
  }
  v23[0] = v8;
  v22[1] = @"View";
  int v9 = [WeakRetained usesNarrowLayout];
  double v10 = @"Regular";
  if (v9) {
    double v10 = @"Narrow";
  }
  if (self->_keepBarsMinimized) {
    uint64_t v11 = @"true";
  }
  else {
    uint64_t v11 = @"false";
  }
  v23[1] = v10;
  v23[2] = v11;
  v22[2] = @"BarsKeptMinimized";
  v22[3] = @"SupportsTabBar";
  char v12 = [WeakRetained usesTabBar];
  if (v12)
  {
    double v13 = @"true";
  }
  else
  {
    uint64_t v2 = [(TabBarManager *)self->_tabBarManager standaloneTabBar];
    if (v2) {
      double v13 = @"true";
    }
    else {
      double v13 = @"false";
    }
  }
  v23[3] = v13;
  v22[4] = @"UsingLoweredBar";
  if ([(BrowserRootViewController *)self usingLoweredBar]) {
    double v14 = @"true";
  }
  else {
    double v14 = @"false";
  }
  v23[4] = v14;
  v22[5] = @"UsingUnifiedBar";
  if ([(BrowserRootViewController *)self usingUnifiedBar]) {
    double v15 = @"true";
  }
  else {
    double v15 = @"false";
  }
  v23[5] = v15;
  v22[6] = @"IsSecure";
  double v16 = [WeakRetained tabController];
  double v17 = [v16 activeTabDocument];
  if ([v17 isSecure]) {
    double v18 = @"true";
  }
  else {
    double v18 = @"false";
  }
  v23[6] = v18;
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  double v20 = WBSMakeAccessibilityIdentifier();
  double v21 = [(BrowserRootViewController *)self view];
  [v21 setAccessibilityIdentifier:v20];

  if ((v12 & 1) == 0) {
}
  }

- (void)_updateTopBarStylesAnimated:(BOOL)a3
{
  if (self->_updatingTopBarStyles) {
    return;
  }
  BOOL v3 = a3;
  self->_updatingTopBarStyles = 1;
  id v5 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __57__BrowserRootViewController__updateTopBarStylesAnimated___block_invoke;
  v59[3] = &unk_1E6D77E20;
  v59[4] = self;
  [v5 setHandler:v59];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v7 = [WeakRetained tabController];
  double v8 = [v7 activeTabDocument];
  objc_msgSend(v8, "updateThemeColorAndUnderPageBackground:", -[BrowserRootViewController _navigationBarIsExpandedOnTop](self, "_navigationBarIsExpandedOnTop") ^ 1);

  int v9 = objc_msgSend(MEMORY[0x1E4F78548], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
  [(_SFNavigationBar *)self->_navigationBar setTheme:v9];
  double v10 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v10 setTheme:v9];
  if (self->_topBackdropUsesPlainTheme && [v10 layoutStyle] == 2) {
    int v11 = 0;
  }
  else {
    int v11 = [MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari] ^ 1;
  }
  char v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v13 = [v12 BOOLForKey:*MEMORY[0x1E4F786D0]];

  CGRect v58 = 0;
  BOOL v55 = v3;
  if (!v13 && v11)
  {
    if ([v10 layoutStyle] == 2)
    {
      double v14 = [WeakRetained tabController];
      double v15 = [v14 activeTabDocument];
      CGRect v58 = [v15 themeColor];
    }
    else
    {
      double v14 = [(_SFWebView *)self->_webView underPageBackgroundColor];
      [(_SFWebView *)self->_webView setUnderPageBackgroundColor:0];
      CGRect v58 = [(_SFWebView *)self->_webView underPageBackgroundColor];
      if ((WBSIsEqual() & 1) == 0) {
        [(_SFWebView *)self->_webView setUnderPageBackgroundColor:v14];
      }
    }
  }
  double v16 = objc_msgSend(MEMORY[0x1E4F784E0], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"), v58, 0);
  double v17 = objc_msgSend(NSString, "stringWithFormat:", @"Safari.BackgroundColorBackdrop.%p", self);
  [v16 setBackdropGroupName:v17];

  CGRect v56 = v16;
  [v10 setMinimizedTheme:v16];
  CGRect v57 = v9;
  if ([(BrowserRootViewController *)self _showsTopBackdrop])
  {
    if ([(BrowserRootViewController *)self _shouldShowThemeColorInTopBar]
      && !self->_topBackdropUsesPlainTheme)
    {
      double v40 = [WeakRetained tabController];
      double v41 = [v40 activeTabDocument];
      double v18 = [v41 themeColor];
    }
    else
    {
      double v18 = 0;
    }
    double v19 = objc_msgSend(MEMORY[0x1E4F784E0], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"), v18, 0);
    if (self->_topBackdropUsesPlainTheme)
    {
      uint64_t v20 = [(BrowserRootViewController *)self _plainTopBackdropGroupName];
    }
    else
    {
      double v21 = NSString;
      int v22 = WBSIsEqual();
      double v23 = @"Theme";
      if (v22) {
        double v23 = @"Background";
      }
      uint64_t v20 = [v21 stringWithFormat:@"Safari.Top%@ColorBackdrop.%p", v23, self];
    }
    double v24 = (void *)v20;
    [v19 setBackdropGroupName:v20];

    if ([(BrowserRootViewController *)self _navigationBarIsExpandedOnTop])
    {
      double v25 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
      [v19 setOverrideBackdropEffect:v25];
    }
    uint64_t v26 = [v19 userInterfaceStyle];
    if (v26 != [(SFUnifiedBarTheme *)self->_topBackdropTheme userInterfaceStyle]) {
      [(BrowserRootViewController *)self setNeedsPreferredStatusBarUpdateAfterCommitAnimated:v3];
    }
    [(BrowserRootViewController *)self _setTopBackdropTheme:v19 animated:v3];
    [v10 obscuredInsets];
    double v28 = v27;
    [(SFThemeColorEffectView *)self->_topBackdrop frame];
    if (v28 != v29) {
      [(BrowserRootViewController *)self _layOutTopBackdrop];
    }

    int v9 = v57;
  }
  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    uint64_t v30 = [(_SFBrowserConfiguration *)self->_configuration barTintStyle];
    if ([(BrowserRootViewController *)self _shouldShowThemeColorInTopBar])
    {
      double v31 = [WeakRetained tabController];
      double v32 = [v31 activeTabDocument];
      double v33 = [v32 themeColor];
    }
    else
    {
      double v33 = 0;
    }
    uint64_t v34 = [WeakRetained overrideBarTintStyleForUnifiedBar];
    id v54 = WeakRetained;
    if (v34)
    {
      uint64_t v35 = v34;
      if (_SFIsDarkTintStyle()) {
        [MEMORY[0x1E4FB1618] whiteColor];
      }
      else {
      double v36 = [MEMORY[0x1E4FB1618] blackColor];
      }
      double v38 = (void *)MEMORY[0x1E4FB14C8];
      if (_SFIsDarkTintStyle()) {
        uint64_t v39 = 17;
      }
      else {
        uint64_t v39 = 12;
      }
      double v37 = [v38 effectWithStyle:v39];
    }
    else
    {
      if ([MEMORY[0x1E4F98F20] shouldIgnoreThemeColorForContrastWithActiveTab:v33 privateBrowsingEnabled:_SFIsPrivateTintStyle()])
      {

        if (_SFIsPrivateTintStyle())
        {
          uint64_t v35 = _SFDarkTintStyleForStyle();
          double v33 = 0;
          double v36 = 0;
          double v37 = 0;
          goto LABEL_47;
        }
        double v33 = 0;
      }
      double v36 = 0;
      double v37 = 0;
      uint64_t v35 = v30;
    }
LABEL_47:
    double v42 = [MEMORY[0x1E4F784E0] themeWithBarTintStyle:v35 preferredBarTintColor:v33 controlsTintColor:v36];
    if ((_SFIsDarkTintStyle() & 1) != 0 || [(TabBarManager *)self->_tabBarManager displayMode] != 2)
    {
      [v42 setAppliesDarkeningOverlay:0];
    }
    else
    {
      double v43 = [MEMORY[0x1E4F78290] sharedFeatureManager];
      objc_msgSend(v42, "setAppliesDarkeningOverlay:", objc_msgSend(v43, "showRectangularTabsInSeparateBar") ^ 1);
    }
    double v44 = _SFBackdropGroupNameForOwner();
    [v42 setBackdropGroupName:v44];

    [v42 setOverrideBackdropEffect:v37];
    uint64_t v45 = [v42 userInterfaceStyle];
    double v46 = [(SFUnifiedBar *)self->_unifiedBar barTheme];
    uint64_t v47 = [v46 userInterfaceStyle];

    if (v45 != v47) {
      [(BrowserRootViewController *)self setNeedsPreferredStatusBarUpdateAfterCommitAnimated:v55];
    }
    [(SFUnifiedBar *)self->_unifiedBar setBarTheme:v42 animated:v55];
    [(BrowserRootViewController *)self _applyStatusBarBackdropTheme];

    id WeakRetained = v54;
    int v9 = v57;
  }
  [(BrowserRootViewController *)self _updateBannerTheme];
  if (self->_tabBar) {
    [(TabBar *)self->_tabBar setTintStyle:[(_SFBrowserConfiguration *)self->_configuration barTintStyle]];
  }
  if (self->_bookmarksBar)
  {
    double v48 = [(_SFNavigationBar *)self->_navigationBar effectiveTheme];
    double v49 = [v48 textColor];

    if ([(BrowserRootViewController *)self usingUnifiedBar])
    {
      double v50 = [(SFUnifiedBar *)self->_unifiedBar barTheme];
      double v51 = [v50 titleTheme];

      uint64_t v52 = [v51 primaryTextColor];

      double v53 = [v51 themeColor];
      [(BookmarksBarView *)self->_bookmarksBar setThemeColor:v53];

      double v49 = (void *)v52;
    }
    [(BookmarksBarView *)self->_bookmarksBar setTintColor:v49];
  }
  [(BrowserRootViewController *)self _updateRefreshControlStyle];
}

- (BOOL)_showsTopBackdrop
{
  uint64_t v2 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_navigationBarIsExpandedOnTop
{
  uint64_t v2 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  BOOL v3 = v2;
  BOOL v4 = v2 && [v2 layoutStyle] == 2 && objc_msgSend(v3, "selectedItemState") != 1;

  return v4;
}

- (void)_updateBannerTheme
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (![(BrowserRootViewController *)self usingUnifiedBar]
    && ![(BrowserRootViewController *)self usingLoweredBar])
  {
    objc_msgSend(MEMORY[0x1E4F781D8], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
    double v10 = (SFBannerTheme *)objc_claimAutoreleasedReturnValue();
    bannerTheme = self->_bannerTheme;
    self->_bannerTheme = v10;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v4 = [(_SFBrowserConfiguration *)self->_configuration barTintStyle];
  id v5 = [WeakRetained tabController];
  uint64_t v6 = [v5 activeTabDocument];
  bannerTheme = [v6 themeColor];

  if ([(BrowserRootViewController *)self usingUnifiedBar]
    && [MEMORY[0x1E4F98F20] shouldIgnoreThemeColorForContrastWithActiveTab:bannerTheme privateBrowsingEnabled:_SFIsPrivateTintStyle()])
  {

    bannerTheme = 0;
  }
  double v8 = [MEMORY[0x1E4F781D8] themeWithBarTintStyle:v4 preferredBarTintColor:bannerTheme controlsTintColor:0];
  int v9 = self->_bannerTheme;
  self->_bannerTheme = v8;

  if (bannerTheme) {
    goto LABEL_9;
  }
LABEL_10:
  int v11 = _SFBackdropGroupNameForOwner();
  [(SFBannerTheme *)self->_bannerTheme setBackdropGroupName:v11];

  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    char v12 = [(SFUnifiedBar *)self->_unifiedBar barTheme];
    -[SFBannerTheme setAppliesDarkeningOverlay:](self->_bannerTheme, "setAppliesDarkeningOverlay:", [v12 appliesDarkeningOverlay]);
    int v13 = [v12 overrideBackdropEffect];
    [(SFBannerTheme *)self->_bannerTheme setOverrideBackdropEffect:v13];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v14 = [(BrowserRootViewController *)self managedTopBanners];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [(BrowserRootViewController *)self _updateThemeForBanner:*(void *)(*((void *)&v20 + 1) + 8 * i) animated:1];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v19 browserViewController:self didUpdateBannerTheme:self->_bannerTheme];
  }
}

- (BOOL)insetsContentContainerFromStatusBar
{
  if ([(BrowserRootViewController *)self usingUnifiedBar]) {
    return 0;
  }
  else {
    return ![(BrowserRootViewController *)self usingLoweredBar];
  }
}

- (BOOL)usingUnifiedBar
{
  return self->_toolbarPlacement == 0;
}

- (SFScrollIndicatorInsets)scrollIndicatorInsetsForTabDocumentView:(SEL)a3
{
  [(_SFWebView *)self->_webView bounds];
  -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", self->_webView);
  double v7 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewController:self adjustedTopObscuredInsetForBanners:v7];

  int v9 = [(BrowserRootViewController *)self view];
  [(BrowserRootViewController *)self keyboardInsetInCoordinateSpace:v9];

  [(BrowserRootViewController *)self _baseInsetsForVerticalScrollIndicator];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(BrowserRootViewController *)self _baseInsetsForHorizontalScrollIndicator];
  double v19 = v18;
  double v21 = v20;
  double v58 = v22;
  double v24 = v23;
  if (objc_msgSend(MEMORY[0x1E4FB1BE0], "_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:", v11, v13, v15, v17)&& objc_msgSend(MEMORY[0x1E4FB1BE0], "_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:", v19, v21, v58, v24))
  {
    [(BrowserRootViewController *)self _webViewSafeAreaInsets];
    CGSize result = (SFScrollIndicatorInsets *)UIEdgeInsetsMax();
    retstr->var0.top = v26;
    retstr->var0.left = v27;
    retstr->var0.double bottom = v28;
    retstr->var0.right = v29;
    retstr->var1.top = v26;
    retstr->var1.left = v27;
    retstr->var1.double bottom = v28;
    retstr->var1.right = v29;
  }
  else
  {
    UIEdgeInsetsMax();
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v57 = v34;
    CGFloat v36 = v35;
    double v37 = [(BrowserRootViewController *)self view];
    [v37 bounds];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v46 = [(BrowserRootViewController *)self view];
    -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 2, v46, v39, v41, v43, v45);
    double v48 = v47;

    double v49 = fmax(v48, v58);
    double v50 = [(BrowserRootViewController *)self view];
    [v50 safeAreaInsets];
    double v52 = v51;

    if (v49 >= v52) {
      UIEdgeInsetsReplace();
    }
    CGSize result = (SFScrollIndicatorInsets *)UIEdgeInsetsMax();
    retstr->var0.top = v53;
    retstr->var0.left = v54;
    retstr->var0.double bottom = v55;
    retstr->var0.right = v56;
    retstr->var1.top = v31;
    retstr->var1.left = v33;
    retstr->var1.double bottom = v57;
    retstr->var1.right = v36;
  }
  return result;
}

- (void)_layOutTopBanners
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewControllerAdditionalContentHeightForBanners:self];
  uint64_t v5 = v4;

  [(UIScrollView *)self->_scrollView bounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  id v14 = objc_loadWeakRetained((id *)&self->_browserController);
  double v15 = [v14 bannerController];
  uint64_t v16 = [v15 indexOfFirstBannerSeparableFromStatusBar];

  double v17 = [(BrowserRootViewController *)self managedTopBanners];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __46__BrowserRootViewController__layOutTopBanners__block_invoke;
  v33[3] = &unk_1E6D7A3A0;
  v33[4] = self;
  v33[5] = v16;
  v33[6] = v7;
  v33[7] = v9;
  v33[8] = v11;
  v33[9] = v13;
  [v17 enumerateObjectsWithOptions:2 usingBlock:v33];

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  double v32 = 0.0;
  [(BrowserRootViewController *)self _totalAdditionalContentHeightForBanners];
  double v32 = -v18;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  CGFloat MaxY = 0.0;
  [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:self->_scrollView];
  CGFloat MaxY = CGRectGetMaxY(v34);
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  CGFloat v26 = __Block_byref_object_copy__4;
  CGFloat v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  double v19 = [(BrowserRootViewController *)self managedTopBanners];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__BrowserRootViewController__layOutTopBanners__block_invoke_148;
  v22[3] = &unk_1E6D7A3C8;
  v22[8] = v7;
  v22[9] = v9;
  v22[10] = v11;
  v22[11] = v13;
  v22[12] = v16;
  v22[4] = self;
  v22[5] = v31;
  v22[13] = v5;
  v22[6] = v29;
  void v22[7] = &v23;
  [v19 enumerateObjectsUsingBlock:v22];

  double v20 = (void *)v24[5];
  if (v20) {
    uint64_t v21 = [v20 shouldUsePlainTheme];
  }
  else {
    uint64_t v21 = 0;
  }
  [(BrowserRootViewController *)self _setTopBackdropUsesPlainTheme:v21];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

- (id)managedTopBanners
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v4 = [WeakRetained bannerController];
  uint64_t v5 = [v4 delegate];

  if (v5 == self)
  {
    uint64_t v7 = [WeakRetained bannerController];
    uint64_t v6 = [v7 topBanners];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (double)_totalAdditionalContentHeightForBanners
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(BrowserRootViewController *)self managedTopBanners];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) bounds];
        double v7 = v7 + CGRectGetHeight(v19);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewControllerAdditionalContentHeightForBanners:self];
  double v11 = v10;

  return v7 + v11;
}

- (void)_setTopBackdropUsesPlainTheme:(BOOL)a3
{
  if (self->_topBackdropUsesPlainTheme != a3)
  {
    self->_topBackdropUsesPlainTheme = a3;
    uint64_t v4 = [(SFThemeColorEffectView *)self->_topBackdrop snapshotViewAfterScreenUpdates:0];
    [(SFThemeColorEffectView *)self->_topBackdrop addSubview:v4];
    uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke;
    v12[3] = &unk_1E6D77E20;
    id v13 = v4;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke_2;
    double v10 = &unk_1E6D77C20;
    id v11 = v13;
    id v6 = v13;
    [v5 animateWithDuration:50331648 delay:v12 options:&v7 animations:0.2 completion:0.0];
    -[BrowserRootViewController _updateTopBarStylesAnimated:](self, "_updateTopBarStylesAnimated:", 0, v7, v8, v9, v10);
  }
}

- (double)keyboardInsetInCoordinateSpace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BrowserRootViewController *)self view];
  [v5 bounds];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  CGFloat v10 = CGRectGetHeight(v30) - self->_bottomBarKeyboardOffset;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v5, 0.0, v10, CGRectGetWidth(v31), self->_bottomBarKeyboardOffset);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v4 bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v32.origin.CGFloat x = v20;
  v32.origin.CGFloat y = v22;
  v32.size.CGFloat width = v24;
  v32.size.CGFloat height = v26;
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.CGFloat x = v12;
  v33.origin.CGFloat y = v14;
  v33.size.CGFloat width = v16;
  v33.size.CGFloat height = v18;
  double v28 = fmax(MaxY - CGRectGetMinY(v33), 0.0);

  return v28;
}

- (BOOL)_shouldShowThemeColorInTopBar
{
  if ([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari])
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_inYttriumState)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if ([(BrowserRootViewController *)self usingUnifiedBar])
    {
      if (_SFDeviceIsPad())
      {
        if ([WeakRetained isShowingFavorites]) {
          int v3 = [WeakRetained usesNarrowLayout] ^ 1;
        }
        else {
          LOBYTE(v3) = 1;
        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      uint64_t v5 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      id v6 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController selectedItemNavigationBar];
      uint64_t v7 = v6;
      if (v5) {
        BOOL v8 = v6 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      LOBYTE(v3) = !v8 && (([v6 isMinimized] & 1) != 0 || objc_msgSend(v5, "layoutStyle") != 2);
    }
  }
  return v3;
}

- (UIEdgeInsets)_baseInsetsForVerticalScrollIndicator
{
  p_verticalScrollIndicatorBaseInsets = &self->_verticalScrollIndicatorBaseInsets;
  double top = self->_verticalScrollIndicatorBaseInsets.top;
  double left = self->_verticalScrollIndicatorBaseInsets.left;
  double bottom = self->_verticalScrollIndicatorBaseInsets.bottom;
  double right = self->_verticalScrollIndicatorBaseInsets.right;
  if (left == 1.79769313e308 && top == 1.79769313e308 && right == 1.79769313e308 && bottom == 1.79769313e308)
  {
    CGFloat v10 = (void *)MEMORY[0x1E4FB1BE0];
    double v11 = [(BrowserRootViewController *)self view];
    objc_msgSend(v10, "_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:", v11);
    p_verticalScrollIndicatorBaseInsets->double top = v12;
    p_verticalScrollIndicatorBaseInsets->double left = v13;
    p_verticalScrollIndicatorBaseInsets->double bottom = v14;
    p_verticalScrollIndicatorBaseInsets->double right = v15;

    double top = p_verticalScrollIndicatorBaseInsets->top;
    double left = p_verticalScrollIndicatorBaseInsets->left;
    double bottom = p_verticalScrollIndicatorBaseInsets->bottom;
    double right = p_verticalScrollIndicatorBaseInsets->right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_baseInsetsForHorizontalScrollIndicator
{
  p_horizontalScrollIndicatorBaseInsets = &self->_horizontalScrollIndicatorBaseInsets;
  double top = self->_horizontalScrollIndicatorBaseInsets.top;
  double left = self->_horizontalScrollIndicatorBaseInsets.left;
  double bottom = self->_horizontalScrollIndicatorBaseInsets.bottom;
  double right = self->_horizontalScrollIndicatorBaseInsets.right;
  if (left == 1.79769313e308 && top == 1.79769313e308 && right == 1.79769313e308 && bottom == 1.79769313e308)
  {
    CGFloat v10 = (void *)MEMORY[0x1E4FB1BE0];
    double v11 = [(BrowserRootViewController *)self view];
    objc_msgSend(v10, "_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:", v11);
    p_horizontalScrollIndicatorBaseInsets->double top = v12;
    p_horizontalScrollIndicatorBaseInsets->double left = v13;
    p_horizontalScrollIndicatorBaseInsets->double bottom = v14;
    p_horizontalScrollIndicatorBaseInsets->double right = v15;

    double top = p_horizontalScrollIndicatorBaseInsets->top;
    double left = p_horizontalScrollIndicatorBaseInsets->left;
    double bottom = p_horizontalScrollIndicatorBaseInsets->bottom;
    double right = p_horizontalScrollIndicatorBaseInsets->right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_updateRefreshControlStyle
{
  id v6 = [(BrowserRootViewController *)self refreshControl];
  if (v6)
  {
    int v3 = [(_SFWebView *)self->_webView underPageBackgroundColor];
    if (objc_msgSend(v3, "sf_isDarkColor")) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    uint64_t v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v4];
    [v6 _setLocalOverrideTraitCollection:v5];
  }
}

- (UIRefreshControl)refreshControl
{
  return [(UIScrollView *)self->_scrollView refreshControl];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)BrowserRootViewController;
  [(BrowserRootViewController *)&v7 viewDidLayoutSubviews];
  [(BrowserRootViewController *)self _layOutTopBackdrop];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v4 = [WeakRetained tabController];
  uint64_t v5 = [v4 activeTabDocument];
  id v6 = [v5 view];
  [v6 ensureContentOffsetWithinContentInsets];
}

- (void)_setTopBackdropTheme:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  BOOL v8 = v7;
  if (v7 && ([v7 isEqual:self->_topBackdropTheme] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_topBackdropTheme, a3);
    if (v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__BrowserRootViewController__setTopBackdropTheme_animated___block_invoke;
      v9[3] = &unk_1E6D77E20;
      v9[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:50331650 animations:v9 completion:0];
    }
    else
    {
      [(BrowserRootViewController *)self _applyTopBackdropTheme];
      [(BrowserRootViewController *)self _applyStatusBarBackdropTheme];
    }
  }
}

- (void)_applyStatusBarBackdropTheme
{
  if (self->_topBackdrop)
  {
    topBackdropTheme = self->_topBackdropTheme;
    statusBarBackdrop = self->_statusBarBackdrop;
    [(SFThemeColorEffectView *)statusBarBackdrop setTheme:topBackdropTheme];
  }
  else
  {
    id v5 = [(SFUnifiedBar *)self->_unifiedBar barTheme];
    [(SFThemeColorEffectView *)self->_statusBarBackdrop setTheme:v5];
  }
}

- (void)setNeedsPreferredStatusBarUpdateAfterCommitAnimated:(BOOL)a3
{
  if (!self->_statusBarStyleUpdateQueued)
  {
    self->_statusBarStyleUpdateQueued = 1;
    int v3 = (void *)*MEMORY[0x1E4FB2608];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke;
    v4[3] = &unk_1E6D781E8;
    v4[4] = self;
    BOOL v5 = a3;
    [v3 _performBlockAfterCATransactionCommits:v4];
  }
}

- (void)_applyTopBackdropTheme
{
  topBackdropTheme = self->_topBackdropTheme;
  if (topBackdropTheme)
  {
    [(SFThemeColorEffectView *)self->_topBackdrop setOverrideUserInterfaceStyle:[(SFUnifiedBarTheme *)topBackdropTheme userInterfaceStyle]];
    BOOL v4 = self->_topBackdropTheme;
    topBackdrop = self->_topBackdrop;
    [(SFThemeColorEffectView *)topBackdrop setTheme:v4];
  }
}

- (void)updateOrderedSubviewsForOrderedContainerView:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BrowserRootViewController *)self view];

  if (v5 == v4)
  {
    contentContainerView = self->_contentContainerView;
    id v11 = (id)[(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    stepperContainer = self->_stepperContainer;
    statusBarView = self->_statusBarView;
    statusBarBackdrop = self->_statusBarBackdrop;
    scrollToTopView = self->_scrollToTopView;
    id v38 = v11;
    double v39 = stepperContainer;
    lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
    uint64_t v40 = (uint64_t)statusBarView;
    uint64_t v41 = (uint64_t)statusBarBackdrop;
    double v42 = scrollToTopView;
    uint64_t v43 = (uint64_t)lockedPrivateBrowsingView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_clipperView);

    [v4 updateOrderedSubviews:&contentContainerView count:8];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_browserController);
    id v7 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
    int v8 = WBSIsEqual();

    BOOL v9 = [(BrowserRootViewController *)self isUsingBottomCapsule];
    double v35 = [(BrowserRootViewController *)self _continuousReadingViewController];
    contentContainerView = (ViewWithCustomNextResponder *)(id)[v35 view];
    id v38 = (id)[(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
    CGRect v34 = [v6 bannerController];
    double v39 = (SFStepperContainer *)(id)[v34 tabGroupBanner];
    if (v9)
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = [(SFToastViewController *)self->_currentlyPresentedToastViewController view];
    }
    uint64_t v40 = v10;
    CGRect v33 = (void *)v10;
    if (v8)
    {
      uint64_t v17 = [(CatalogViewController *)self->_catalogViewController view];
    }
    else
    {
      uint64_t v17 = 0;
    }
    topBackdrop = self->_topBackdrop;
    uint64_t v41 = v17;
    double v42 = topBackdrop;
    CGRect v32 = (void *)v17;
    if (v9)
    {
      uint64_t v19 = [(SFToastViewController *)self->_currentlyPresentedToastViewController view];
    }
    else
    {
      uint64_t v19 = 0;
    }
    uint64_t v43 = v19;
    CGRect v31 = (void *)v19;
    if (v8)
    {
      CGFloat v20 = 0;
    }
    else
    {
      CGFloat v20 = [(CatalogViewController *)self->_catalogViewController view];
    }
    double v21 = self->_statusBarBackdrop;
    id WeakRetained = v20;
    double v45 = v21;
    CGFloat v36 = v6;
    CGFloat v22 = [v6 tabController];
    double v23 = [v22 activeTabDocument];
    CGFloat v24 = [v23 sfScribbleControllerIfLoaded];
    id v25 = (id)[v24 overlay];
    unifiedBar = self->_unifiedBar;
    id v46 = v25;
    double v47 = unifiedBar;
    topAuxiliaryBarsContainerView = self->_topAuxiliaryBarsContainerView;
    navigationBar = self->_navigationBar;
    double v49 = topAuxiliaryBarsContainerView;
    tabHoverPreview = self->_tabHoverPreview;
    tabBarDropExpansionView = self->_tabBarDropExpansionView;
    double v51 = tabHoverPreview;
    CGFloat v29 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    id v52 = (id)[v29 lockdownStatusBar];
    CGRect v30 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    id v53 = (id)[v30 minimizedProgressView];

    if ((v8 & 1) == 0) {
    if (v9)
    }

    if (v8) {
    if (!v9)
    }

    [v4 updateOrderedSubviews:&contentContainerView count:17];
  }
}

- (void)updateViewsAfterContentContainerViewBoundsChange
{
  [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
  -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self, "contentContainerViewFrameForBrowserSize:", v3, v4);
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_contentContainerView, *MEMORY[0x1E4F1DAD8], v10);
  double v12 = v9 + v11;
  double v14 = v10 + v13;
  double v16 = v6 - (v11 + v15);
  double v18 = v8 - (v13 + v17);
  uint64_t v19 = [(BrowserRootViewController *)self _activeTabDocumentView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [(BrowserRootViewController *)self updateWebViewSizeAttributes];
  [(BrowserRootViewController *)self layOutCatalogView];
  id v20 = [(BrowserRootViewController *)self _continuousReadingViewController];
  [v20 updateContinuousPreviewViewSizeAttributes];
}

- (id)_continuousReadingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    double v4 = [WeakRetained continuousReadingViewControllerForBrowserViewController:self];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)layOutCatalogView
{
  id v3 = [(CatalogViewController *)self->_catalogViewController view];
  [(BrowserRootViewController *)self _frameForCatalogView];
  objc_msgSend(v3, "setFrame:");
  [v3 bounds];
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 27, v3);
  -[CatalogViewController setObscuredInsets:](self->_catalogViewController, "setObscuredInsets:");
}

- (CGRect)_frameForCatalogView
{
  [(ViewWithCustomNextResponder *)self->_contentContainerView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(BrowserRootViewController *)self view];
  [v11 bounds];
  CGFloat Height = v12;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v15 = [WeakRetained _shouldUseNarrowLayout];

  if (v15)
  {
    v24.origin.CGFloat x = v4;
    v24.origin.CGFloat y = v6;
    v24.size.CGFloat width = v8;
    v24.size.CGFloat height = v10;
    double Width = CGRectGetWidth(v24);
    v25.origin.CGFloat x = v4;
    v25.origin.CGFloat y = v6;
    v25.size.CGFloat width = v8;
    v25.size.CGFloat height = v10;
    CGFloat Height = CGRectGetHeight(v25);
    double v17 = 0.0;
  }
  else
  {
    double v18 = 0.0;
    if ([(CatalogViewController *)self->_catalogViewController usesPopoverStyleForFavorites])
    {
      [(BrowserRootViewController *)self horizontalMarginForCatalogViewInPopover];
      double v18 = v19;
    }
    double v17 = v18 * 0.5;
    v26.origin.CGFloat x = v4;
    v26.origin.CGFloat y = v6;
    v26.size.CGFloat width = v8;
    v26.size.CGFloat height = v10;
    double Width = CGRectGetWidth(v26) - v18;
  }
  double v20 = v17;
  double v21 = 0.0;
  double v22 = Width;
  double v23 = Height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (id)_activeTabDocumentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained tabController];
  CGFloat v4 = [v3 activeTabDocument];
  double v5 = [v4 view];

  return v5;
}

- (void)_layOutTopBackdrop
{
  id v29 = [(BrowserRootViewController *)self view];
  [(UIView *)self->_topSeparator setHidden:[(BrowserRootViewController *)self isUsingBottomCapsule]];
  [v29 bounds];
  double Width = CGRectGetWidth(v31);
  double v4 = 0.0;
  if ([(BrowserRootViewController *)self _showsTopBackdrop])
  {
    double v5 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    [v5 obscuredInsets];
    double v4 = v6;
  }
  -[SFThemeColorEffectView setFrame:](self->_topBackdrop, "setFrame:", 0.0, 0.0, Width, v4);
  BOOL v7 = [(BrowserRootViewController *)self _interfaceFillsScreen];
  statusBarBackdrop = self->_statusBarBackdrop;
  if (v7)
  {
    if (!statusBarBackdrop)
    {
      double v9 = (SFThemeColorEffectView *)[objc_alloc(MEMORY[0x1E4F78468]) initWithEffect:0];
      CGFloat v10 = self->_statusBarBackdrop;
      self->_statusBarBackdrop = v9;

      [(BrowserRootViewController *)self _applyStatusBarBackdropTheme];
    }
  }
  else if (statusBarBackdrop)
  {
    [(SFThemeColorEffectView *)statusBarBackdrop removeFromSuperview];
    double v11 = self->_statusBarBackdrop;
    self->_statusBarBackdrop = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[SFThemeColorEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", (double)([WeakRetained isShowingFavorites] ^ 1));

  id v13 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if ([v13 presentationState])
  {
    double v14 = self->_documentAndTopBarsContainerView;
  }
  else
  {
    int v15 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
    documentAndTopBarsContainerView = (SFOrderedContainerView *)v29;
    if (!v15) {
      documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
    }
    double v14 = documentAndTopBarsContainerView;
  }
  double v17 = self->_statusBarBackdrop;
  if (v17)
  {
    double v18 = [(SFThemeColorEffectView *)v17 superview];

    if (v18 != v14) {
      [(SFOrderedContainerView *)v14 addSubview:self->_statusBarBackdrop];
    }
  }
  [(SFOrderedContainerView *)v14 bounds];
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, v14);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [v29 bounds];
  double v27 = CGRectGetWidth(v32);
  [v29 safeAreaInsets];
  -[SFThemeColorEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", v22 + 0.0, v20 + 0.0, v27 - (v22 + v26), v28 - (v20 + v24));
}

- (BOOL)isUsingBottomCapsule
{
  uint64_t v2 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
  double v3 = v2;
  if (v2) {
    BOOL v4 = [v2 integerValue] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateTabViewPinchRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained isPrivateBrowsingEnabled])
  {
    BOOL v4 = +[Application sharedApplication];
    LODWORD(v5) = [v4 isPrivateBrowsingLocked] ^ 1;
  }
  else
  {
    LODWORD(v5) = 1;
  }
  id v6 = [(_SFWebView *)self->_webView scrollView];
  [v6 zoomScale];
  double v8 = v7;
  double v9 = [(_SFWebView *)self->_webView scrollView];
  [v9 minimumZoomScale];
  double v11 = v8 / v10;

  if (v11 >= 1.0001)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    if ([v6 presentationState] == 1)
    {
    }
    else
    {
      double v12 = (void *)[v6 presentationState];

      if (v12 != (void *)2 && ([WeakRetained favoritesAreEmbedded] & 1) == 0) {
        goto LABEL_11;
      }
    }
  }
  id v13 = [WeakRetained activeLibraryType];
  double v12 = v13;
  if (v13)
  {

    if (v11 < 1.0001)
    {
LABEL_12:
      uint64_t v14 = 0;
      uint64_t v5 = 0;
      goto LABEL_13;
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v2 = [(BrowserRootViewController *)self capsuleViewController];
  if ([v2 capsuleIsFocused])
  {
    uint64_t v5 = 0;
  }
  else if (self->_inYttriumMode)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = v5;
  }

  if (v11 >= 1.0001)
  {

    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
  if (v5)
  {
LABEL_27:
    double v12 = [WeakRetained tabCollectionViewProvider];
    uint64_t v2 = [v12 tabOverview];
    uint64_t v5 = [v2 allowsInteractivePresentation];
    uint64_t v14 = 1;
    goto LABEL_13;
  }
  uint64_t v14 = 0;
LABEL_13:
  int v15 = [WeakRetained tabViewPinchRecognizer];
  [v15 setEnabled:v5];

  if (v14)
  {
  }
  double v16 = [(TabSwitcherViewController *)self->_tabSwitcherViewController pinchGestureRecognizer];
  [v16 setEnabled:v14];
}

- (void)updateUnifiedBarChromelessScrollDistance
{
  if (self->_unifiedBar)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if ([WeakRetained isShowingFavorites]
      && ([WeakRetained favoritesAreShowingInPopover] & 1) == 0)
    {
      [(CatalogViewController *)self->_catalogViewController chromelessScrollDistance];
      double v7 = v8;
    }
    else
    {
      double v3 = [WeakRetained tabController];
      BOOL v4 = [v3 activeTabDocument];
      uint64_t v5 = [v4 view];
      [v5 scrollDistance];
      double v7 = v6;
    }
    [(SFUnifiedBar *)self->_unifiedBar setChromelessScrollDistance:v7];
  }
}

- (CGSize)webViewMinimumUnobscuredLayoutSize
{
  [(BrowserRootViewController *)self _webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)webViewMinimumLayoutSize
{
  [(BrowserRootViewController *)self _webViewMinimumLayoutSizeWithBarVisibilitiesIgnored:0];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)webViewMaximumUnobscuredLayoutSize
{
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
  -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](self, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView, v4, v6, v8, v10);
  UIEdgeInsetsReplace();
  [(BrowserRootViewController *)self _webViewMinimumEffectiveSafeAreaInsets];
  UIEdgeInsetsMax();
  double v13 = v8 - (v11 + v12);
  double v16 = v10 - (v14 + v15);
  double v17 = v13;
  result.CGFloat height = v16;
  result.CGFloat width = v17;
  return result;
}

- (unint64_t)tabDocumentView:(id)a3 contentOffsetAdjustmentEdgeWithPreviousContentInset:(UIEdgeInsets)a4
{
  double top = a4.top;
  id v6 = a3;
  if ([(UIScrollView *)self->_scrollView isDragging])
  {
    unint64_t v7 = 0;
  }
  else if ([(CapsuleNavigationBarViewController *)self->_capsuleViewController performingWebViewTapTransition])
  {
    [v6 scrollDistance];
    unint64_t v7 = v8 < 0.0;
  }
  else if ([(CapsuleNavigationBarViewController *)self->_capsuleViewController transitioningToNormalStateForKeyboardDismissal])
  {
    unint64_t v7 = 4;
  }
  else
  {
    double v9 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    if (v9)
    {
      if ([v6 isShowingReader]) {
        [v6 readerWebView];
      }
      else {
      double v10 = [v6 webView];
      }
      double v11 = [v10 scrollView];

      if (([v11 isTracking] & 1) != 0 || (objc_msgSend(v11, "contentOffset"), v12 != -top))
      {
        if ([v9 isTransitioningToNormalStateForTapInBottomRegion]) {
          unint64_t v7 = 4;
        }
        else {
          unint64_t v7 = 0;
        }
      }
      else
      {
        unint64_t v7 = 1;
      }
    }
    else
    {
      unint64_t v7 = [(_SFNavigationBar *)self->_navigationBar isSendingBarMetricsChangeNotification]|| self->_togglingTabBar;
    }
  }
  return v7;
}

- (BOOL)shouldFreezeWebViewUpdatesForTabDocumentView:(id)a3
{
  double v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained browserViewControllerShouldFreezeWebViewUpdatesForSizeTransition:v3];

  return (char)v3;
}

- (UIEdgeInsets)scrollViewContentInsetAdjustmentsForTabDocumentView:(id)a3
{
  CGFloat top = self->_contentInsetForContentFrame.top;
  CGFloat left = self->_contentInsetForContentFrame.left;
  double bottom = self->_contentInsetForContentFrame.bottom;
  CGFloat right = self->_contentInsetForContentFrame.right;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewController:self adjustedBottomContentInset:bottom];
  double v10 = v9;

  if (self->_toolbarPlacement == 1 && !self->_keepBarsMinimized)
  {
    [(BrowserRootViewController *)self _bottomBarOffset];
    double v10 = v10 - v11;
  }
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 16, self->_documentAndTopBarsContainerView);
  double v13 = fmax(v10, 0.0) - v12;
  double v14 = top;
  double v15 = left;
  double v16 = right;
  result.CGFloat right = v16;
  result.double bottom = v13;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (UIEdgeInsets)obscuredScrollViewInsetsForTabDocumentView:(id)a3 unobscuredSafeAreaInsets:(UIEdgeInsets *)a4
{
  [(BrowserRootViewController *)self obscuredScrollViewInsetsConsideringTargetState:0 insetsDueToSafeArea:a4];
  result.CGFloat right = v7;
  result.double bottom = v6;
  result.CGFloat left = v5;
  result.CGFloat top = v4;
  return result;
}

- (double)minimumEffectiveDeviceWidthForTabDocumentView:(id)a3
{
  return 0.0;
}

- (BOOL)inElementFullscreenForTabDocumentView:(id)a3
{
  double v3 = [a3 webView];
  double v4 = +[TabDocument tabDocumentForWKWebView:v3];

  LOBYTE(v3) = [v4 inElementFullscreen];
  return (char)v3;
}

- (UIEdgeInsets)_webViewMinimumEffectiveSafeAreaInsets
{
  if ([(_SFWebView *)self->_webView _safeAreaShouldAffectObscuredInsets])
  {
    double v3 = [(BrowserRootViewController *)self view];
    [v3 safeAreaInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    double v10 = 0.0;
  }
  else
  {
    double v5 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.CGFloat right = v13;
  result.double bottom = v10;
  result.CGFloat left = v12;
  result.CGFloat top = v11;
  return result;
}

- (UIEdgeInsets)obscuredScrollViewInsetsConsideringTargetState:(BOOL)a3 insetsDueToSafeArea:(UIEdgeInsets *)a4
{
  int64_t toolbarPlacement = self->_toolbarPlacement;
  uint64_t v8 = [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator targetState];
  if (toolbarPlacement == 1 || !a3)
  {
    [(_SFWebView *)self->_webView bounds];
    -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", self->_webView);
  }
  else
  {
    uint64_t v9 = v8;
    [(_SFWebView *)self->_webView bounds];
    webView = self->_webView;
    if (v9) {
      -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", webView, 0);
    }
    else {
      -[BrowserRootViewController minimumObscuredInsetsForRect:inCoordinateSpace:](self, "minimumObscuredInsetsForRect:inCoordinateSpace:", webView);
    }
  }
  double v13 = v11;
  double v14 = v12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewController:self adjustedTopObscuredInsetForBanners:v13];
  [WeakRetained browserViewController:self adjustedBottomObscuredInset:v14];
  if (a4)
  {
    [(BrowserRootViewController *)self _webViewSafeAreaInsets];
    UIEdgeInsetsMax();
    UIEdgeInsetsSubtract();
    a4->CGFloat top = v16;
    a4->CGFloat left = v17;
    a4->double bottom = v18;
    a4->CGFloat right = v19;
  }
  [(BrowserRootViewController *)self webViewEffectiveSafeAreaInsets];
  UIEdgeInsetsMax();
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.CGFloat right = v31;
  result.double bottom = v30;
  result.CGFloat left = v29;
  result.CGFloat top = v28;
  return result;
}

- (UIEdgeInsets)webViewEffectiveSafeAreaInsets
{
  if ([(_SFWebView *)self->_webView _safeAreaShouldAffectObscuredInsets])
  {
    [(BrowserRootViewController *)self _webViewSafeAreaInsets];
    double v6 = 0.0;
  }
  else
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  result.CGFloat right = v5;
  result.double bottom = v6;
  result.CGFloat left = v4;
  result.CGFloat top = v3;
  return result;
}

- (UIEdgeInsets)_webViewSafeAreaInsets
{
  double v2 = [(BrowserRootViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.CGFloat right = v14;
  result.double bottom = v13;
  result.CGFloat left = v12;
  result.CGFloat top = v11;
  return result;
}

- (double)_bottomBarOffset
{
  [(BrowserRootViewController *)self maximumHeightObscuredByBottomToolbar];
  double v4 = v3;
  double v5 = [(BrowserRootViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(BrowserRootViewController *)self view];
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 2, v14, v7, v9, v11, v13);
  double v16 = v4 - v15;

  return v16;
}

- (void)viewWillLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)BrowserRootViewController;
  [(BrowserRootViewController *)&v39 viewWillLayoutSubviews];
  double v3 = [(BrowserRootViewController *)self view];
  [v3 bounds];
  CGRectGetWidth(v40);
  uint64_t v4 = _SFSizeClassForWidth();
  double v5 = [(BrowserRootViewController *)self traitOverrides];
  [v5 setHorizontalSizeClass:v4];

  [(BrowserRootViewController *)self _frameForContentContainerView];
  -[ViewWithCustomNextResponder setFrame:](self->_contentContainerView, "setFrame:");
  [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
  -[SFOrderedContainerView setFrame:](self->_documentAndTopBarsContainerView, "setFrame:");
  [(BrowserRootViewController *)self _layOutTabView];
  [(BrowserRootViewController *)self layOutTopBars];
  [(BrowserRootViewController *)self _layOutScrollToTopView];
  [(BrowserRootViewController *)self _updateToolbarPlacementIfNeeded];
  [(BrowserRootViewController *)self _layOutBottomToolbar];
  [(BrowserRootViewController *)self _layOutSidebar];
  [(BrowserRootViewController *)self _layOutSidebarContentDimmingView];
  [(BrowserRootViewController *)self _layOutWebpageStatusBarView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewControllerDidLayOutSubviews:self];
  float64x2_t v37 = *(float64x2_t *)&self->_obscuredInsets.bottom;
  float64x2_t v38 = *(float64x2_t *)&self->_obscuredInsets.top;
  float64x2_t v35 = *(float64x2_t *)&self->_maximumObscuredInsets.bottom;
  float64x2_t v36 = *(float64x2_t *)&self->_maximumObscuredInsets.top;
  double v7 = [(BrowserRootViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(BrowserRootViewController *)self view];
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v16, 0, v9, v11, v13, v15);
  self->_maximumObscuredInsets.CGFloat top = v17;
  self->_maximumObscuredInsets.CGFloat left = v18;
  self->_maximumObscuredInsets.double bottom = v19;
  self->_maximumObscuredInsets.CGFloat right = v20;

  double v21 = [(BrowserRootViewController *)self view];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = [(BrowserRootViewController *)self view];
  -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", v30, v23, v25, v27, v29);
  self->_obscuredInsets.CGFloat top = v31;
  self->_obscuredInsets.CGFloat left = v32;
  self->_obscuredInsets.double bottom = v33;
  self->_obscuredInsets.CGFloat right = v34;

  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_maximumObscuredInsets.top, v36), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_maximumObscuredInsets.bottom, v35))), 0xFuLL))) & 1) == 0&& (objc_opt_respondsToSelector())
  {
    [WeakRetained browserViewControllerDidChangeMaximumObscuredInsets:self];
  }
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_obscuredInsets.top, v38), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_obscuredInsets.bottom, v37))), 0xFuLL))) & 1) == 0&& (objc_opt_respondsToSelector())
  {
    [WeakRetained browserViewControllerDidChangeBarInsets:self];
  }
  if ([(BrowserRootViewController *)self usingUnifiedBar]) {
    [(BrowserRootViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
  }
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[SFStepperContainer setFrame:](self->_stepperContainer, "setFrame:");
}

- (int64_t)toolbarPlacement
{
  return self->_toolbarPlacement;
}

- (void)_layOutTabView
{
  contentContainerView = self->_contentContainerView;
  uint64_t v4 = [(BrowserRootViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(BrowserRootViewController *)self view];
  -[ViewWithCustomNextResponder convertRect:fromView:](contentContainerView, "convertRect:fromView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, self->_contentContainerView, v15, v17, v19, v21);
  double v23 = v15 + v22;
  double v25 = v17 + v24;
  double v27 = v19 - (v22 + v26);
  double v29 = v21 - (v24 + v28);
  if (SFTabGroupSwitcherEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    CGFloat v31 = [WeakRetained tabCollectionViewProvider];
    CGFloat v32 = [v31 tabViewContainerView];
    objc_msgSend(v32, "setFrame:", v23, v25, v27, v29);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    CGFloat v31 = [WeakRetained view];
    objc_msgSend(v31, "setFrame:", v23, v25, v27, v29);
  }

  tabSwitcherViewController = self->_tabSwitcherViewController;
  if (tabSwitcherViewController)
  {
    CGFloat v34 = [(TabSwitcherViewController *)tabSwitcherViewController view];
    objc_msgSend(v34, "setFrame:", v23, v25, v27, v29);

    float64x2_t v35 = [(BrowserRootViewController *)self view];
    [v35 bounds];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v44 = [(BrowserRootViewController *)self view];
    -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v44, 1, v37, v39, v41, v43);
    -[TabSwitcherViewController setBrowserContentInsets:](self->_tabSwitcherViewController, "setBrowserContentInsets:");

    double v45 = self->_tabSwitcherViewController;
    [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
    double v47 = v46;
    double v49 = v48;
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    -[BrowserRootViewController obscuredInsetsForRect:inCoordinateSpace:](self, "obscuredInsetsForRect:inCoordinateSpace:", self->_documentAndTopBarsContainerView);
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v58 = [(TabSwitcherViewController *)self->_tabSwitcherViewController delegate];
    [v58 tabCollectionViewItemHeaderHeightIncludedInSnapshot:self->_tabSwitcherViewController];
    double v60 = v51 + v59;

    -[TabSwitcherViewController setBorrowedContentSize:obscuredInsets:](v45, "setBorrowedContentSize:obscuredInsets:", v47, v49, v60, v53, v55, v57);
    CGRect v61 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];

    if (v61)
    {
      CGRect v62 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      [v62 capsuleFrame];
      -[TabSwitcherViewController setCapsuleReferenceFrame:](self->_tabSwitcherViewController, "setCapsuleReferenceFrame:");

      id v64 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      [v64 pageWidth];
      -[TabSwitcherViewController setLinkedPanGesturePageWidth:](self->_tabSwitcherViewController, "setLinkedPanGesturePageWidth:");
    }
    else
    {
      -[TabSwitcherViewController setCapsuleReferenceFrame:](self->_tabSwitcherViewController, "setCapsuleReferenceFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      CGRect v63 = self->_tabSwitcherViewController;
      [(TabSwitcherViewController *)v63 setLinkedPanGesturePageWidth:0.0];
    }
  }
}

- (UIEdgeInsets)obscuredInsetsForRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 27, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.CGFloat right = v7;
  result.double bottom = v6;
  result.CGFloat left = v5;
  result.CGFloat top = v4;
  return result;
}

- (void)layOutTopBars
{
  double v3 = [(BrowserRootViewController *)self view];
  [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(BrowserRootViewController *)self navigationBarDesiredHeight];
  double v13 = v12;
  double v14 = [(BrowserRootViewController *)self view];
  [v14 safeAreaInsets];
  double v16 = v15;

  navigationBar = self->_navigationBar;
  __CGFloat x = v13;
  if (navigationBar)
  {
    [(_SFNavigationBar *)navigationBar setMaximumHeight:v13];
    -[NavigationBar setFrame:](self->_navigationBar, "setFrame:", v5, v7, v9, v11);
    [(_SFNavigationBar *)self->_navigationBar setContentUnderStatusBarHeight:v16];
    if (self->_scrollToTopView)
    {
      double v18 = [(BrowserRootViewController *)self view];
      [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:v18];
      [(NavigationBar *)self->_navigationBar setHidden:CGRectGetMaxY(v78) <= 0.0];
    }
    else
    {
      [(NavigationBar *)self->_navigationBar setHidden:0];
    }
    [(_SFNavigationBar *)self->_navigationBar defaultHeight];
    double v19 = v20;
  }
  else
  {
    double v19 = 0.0;
  }
  CGFloat rect = v9;
  if (self->_unifiedBar)
  {
    if ([(BrowserRootViewController *)self usingUnifiedBar])
    {
      double Height = v11;
      double v22 = v7;
    }
    else
    {
      [(BrowserRootViewController *)self _frameForNavigationBar];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v27 = v5;
      CGFloat v29 = v28;
      double v74 = v16;
      CGFloat v31 = v30;
      v79.origin.CGFloat x = v27;
      v79.origin.CGFloat y = v7;
      v79.size.CGFloat width = rect;
      v79.size.CGFloat height = v11;
      double MaxY = CGRectGetMaxY(v79);
      v80.origin.CGFloat x = v24;
      v80.origin.CGFloat y = v26;
      v80.size.CGFloat width = v29;
      v80.size.CGFloat height = v31;
      double v22 = MaxY - CGRectGetHeight(v80);
      v81.origin.CGFloat x = v24;
      v81.origin.CGFloat y = v26;
      v81.size.CGFloat width = v29;
      double v5 = v27;
      v81.size.CGFloat height = v31;
      double v16 = v74;
      double v9 = rect;
      double Height = CGRectGetHeight(v81);
    }
    -[UnifiedBar setFrame:](self->_unifiedBar, "setFrame:", v5, v22, v9, Height);
    [(SFUnifiedBar *)self->_unifiedBar setContentUnderStatusBarHeight:v16];
    BOOL v33 = [(BrowserRootViewController *)self _shouldHideUnifiedBar];
    if (v33 || !self->_scrollToTopView)
    {
      [(UnifiedBar *)self->_unifiedBar setHidden:v33];
    }
    else
    {
      CGFloat v34 = [(BrowserRootViewController *)self view];
      [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:v34];
      [(UnifiedBar *)self->_unifiedBar setHidden:CGRectGetMaxY(v82) <= 0.0];
    }
    [(BrowserRootViewController *)self _topAuxiliaryBarsHeight];
    -[SFUnifiedBar setExtendedBottomHeight:](self->_unifiedBar, "setExtendedBottomHeight:");
    [(SFUnifiedBar *)self->_unifiedBar expandedHeight];
    double v19 = v35;
  }
  v83.origin.CGFloat x = v5;
  v83.origin.CGFloat y = v7;
  v83.size.CGFloat width = v9;
  v83.size.CGFloat height = v11;
  double v36 = fmax(CGRectGetHeight(v83) - v19, 0.0);
  v84.origin.CGFloat x = v5;
  v84.origin.CGFloat y = v7;
  v84.size.CGFloat width = v9;
  v84.size.CGFloat height = v11;
  double MinX = CGRectGetMinX(v84);
  v85.origin.CGFloat x = v5;
  v85.origin.CGFloat y = v7;
  v85.size.CGFloat width = v9;
  v85.size.CGFloat height = v11;
  CGFloat v38 = v5;
  double v39 = CGRectGetMaxY(v85) - v36;
  v86.origin.CGFloat x = v38;
  v86.origin.CGFloat y = v7;
  v86.size.CGFloat width = v9;
  v86.size.CGFloat height = v11;
  double Width = CGRectGetWidth(v86);
  -[BarContainerView setFrame:](self->_topAuxiliaryBarsContainerView, "setFrame:", MinX, v39, Width, v36);
  CGFloat v75 = v38;
  v87.origin.CGFloat x = v38;
  v87.origin.CGFloat y = v7;
  v87.size.CGFloat width = v9;
  v87.size.CGFloat height = v11;
  [(BarContainerView *)self->_topAuxiliaryBarsContainerView setClipsToBounds:CGRectGetHeight(v87) < __x];
  [(_SFNavigationBar *)self->_navigationBar _controlsAlpha];
  long double v42 = v41;
  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    [(SFUnifiedBar *)self->_unifiedBar squishTransformFactor];
    SFBarContentAlphaForSquishTransformFactor();
    long double v42 = v43;
  }
  if (self->_tabBar)
  {
    double v72 = v11;
    if (self->_showingTabBar)
    {
      +[TabBar defaultHeight];
      double v45 = v44;
    }
    else
    {
      double v45 = 0.0;
    }
    v88.origin.CGFloat x = MinX;
    v88.origin.CGFloat y = v39;
    v88.size.CGFloat width = Width;
    v88.size.CGFloat height = v36;
    -[UIView setFrame:](self->_tabBarClipperView, "setFrame:", *MEMORY[0x1E4F1DB28], CGRectGetHeight(v88) - (v45 + 3.0), Width, v45 + 3.0);
    double v46 = [(TabBar *)self->_tabBar superview];
    [v46 bounds];
    CGFloat v47 = CGRectGetMaxY(v89) - v45;
    v90.origin.CGFloat x = MinX;
    v90.origin.CGFloat y = v39;
    v90.size.CGFloat width = Width;
    v90.size.CGFloat height = v36;
    double v48 = CGRectGetWidth(v90);
    +[TabBar defaultHeight];
    -[TabBar setFrame:](self->_tabBar, "setFrame:", 0.0, v47, v48, v49);

    [(TabBar *)self->_tabBar setAlpha:(double)v42];
    double v11 = v72;
  }
  [(BrowserRootViewController *)self _layOutTopBanners];
  if (self->_tabBar) {
    BOOL showingTabBar = self->_showingTabBar;
  }
  else {
    BOOL showingTabBar = 1;
  }
  [(TabBarDropExpansionView *)self->_tabBarDropExpansionView setHidden:showingTabBar];
  v91.origin.CGFloat x = MinX;
  v91.origin.CGFloat y = v39;
  v91.size.CGFloat width = Width;
  v91.size.CGFloat height = v36;
  double v51 = CGRectGetMaxY(v91);
  v92.origin.CGFloat x = v75;
  v92.origin.CGFloat y = v7;
  v92.size.CGFloat width = rect;
  CGFloat v52 = v11;
  v92.size.CGFloat height = v11;
  double v53 = CGRectGetWidth(v92);
  +[TabBar defaultHeight];
  -[TabBarDropExpansionView setFrame:](self->_tabBarDropExpansionView, "setFrame:", 0.0, v51, v53, v54);
  bookmarksBar = self->_bookmarksBar;
  if (bookmarksBar)
  {
    double v56 = [(BookmarksBarView *)bookmarksBar superview];
    topAuxiliaryBarsContainerView = self->_topAuxiliaryBarsContainerView;

    if (v56 == topAuxiliaryBarsContainerView)
    {
      if (self->_tabBar && self->_showingTabBar)
      {
        double v58 = [(BookmarksBarView *)self->_bookmarksBar superview];
        [(TabBar *)self->_tabBar bounds];
        objc_msgSend(v58, "convertRect:fromView:", self->_tabBar);
        CGFloat v60 = v59;
        CGFloat v62 = v61;
        double v63 = v7;
        CGFloat v65 = v64;
        CGFloat v67 = v66;

        v93.origin.CGFloat x = v60;
        v93.origin.CGFloat y = v62;
        v93.size.CGFloat width = v65;
        double v7 = v63;
        v93.size.CGFloat height = v67;
        double MinY = CGRectGetMinY(v93);
      }
      else
      {
        v69 = [(BookmarksBarView *)self->_bookmarksBar superview];
        [v69 bounds];
        double MinY = CGRectGetMaxY(v94);
      }
      v95.origin.CGFloat x = v75;
      v95.origin.CGFloat y = v7;
      v95.size.CGFloat width = rect;
      v95.size.CGFloat height = v52;
      -[BookmarksBarView setFrame:](self->_bookmarksBar, "setFrame:", 0.0, MinY + -23.0 + -3.0, CGRectGetWidth(v95), 23.0);
      double v70 = pow(v42, 5.0);
      v71 = self->_bookmarksBar;
      [(BookmarksBarView *)v71 setAlpha:v70];
    }
  }
}

- (double)navigationBarDesiredHeight
{
  unifiedBar = self->_unifiedBar;
  if (unifiedBar) {
    [(SFUnifiedBar *)unifiedBar expandedHeight];
  }
  else {
    [(_SFNavigationBar *)self->_navigationBar defaultHeight];
  }
  double v5 = v4;
  [(BrowserRootViewController *)self _topAuxiliaryBarsHeight];
  return v5 + v6;
}

- (double)_topAuxiliaryBarsHeight
{
  bookmarksBar = self->_bookmarksBar;
  if (bookmarksBar)
  {
    double v4 = [(BookmarksBarView *)bookmarksBar superview];
    BOOL v5 = v4 == self->_topAuxiliaryBarsContainerView;

    if (v5) {
      double v6 = 23.0;
    }
    else {
      double v6 = 0.0;
    }
  }
  else
  {
    double v6 = 0.0;
  }
  if (self->_showingTabBar && self->_tabBar)
  {
    +[TabBar defaultHeight];
    return v6 + v7;
  }
  return v6;
}

- (void)_layOutSidebar
{
  [(BrowserRootViewController *)self _frameForSidebarWhenShowing:self->_showingSidebar];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SidebarViewController *)self->_sidebarViewController view];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)_layOutScrollToTopView
{
  if (self->_scrollToTopView)
  {
    double v3 = 5.0;
    if ([(_SFDynamicBarAnimator *)self->_dynamicBarAnimator state] != 1)
    {
      [(ScrollToTopView *)self->_scrollToTopView defaultHeight];
      double v3 = v4;
    }
    double v5 = [(BrowserRootViewController *)self view];
    [v5 bounds];
    -[ScrollToTopView setFrame:](self->_scrollToTopView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v8), v3);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    -[ScrollToTopView setHidden:](self->_scrollToTopView, "setHidden:", [WeakRetained presentationState] != 0);
  }
}

- (void)_layOutBottomToolbar
{
  if (self->_bottomToolbar)
  {
    [(BrowserRootViewController *)self _frameForBottomToolbarForceHidden:0];
    -[BrowserToolbar setFrame:](self->_bottomToolbar, "setFrame:");
    bottomToolbar = self->_bottomToolbar;
    [(BrowserToolbar *)bottomToolbar setNeedsLayout];
  }
}

- (CGRect)_frameForContentContainerView
{
  BOOL v3 = [(BrowserRootViewController *)self insetsContentContainerFromStatusBar];
  double v4 = [(BrowserRootViewController *)self view];
  [v4 bounds];
  double v8 = v7;
  double v10 = v9;
  if (v3)
  {
    [v4 safeAreaInsets];
    double v12 = v11;
    double v10 = v10 - v11;
    double v13 = 0.0;
  }
  else
  {
    double v13 = v5;
    double v12 = v6;
  }

  double v14 = v13;
  double v15 = v12;
  double v16 = v8;
  double v17 = v10;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  if (!a4)
  {
    self->_verticalScrollIndicatorBaseInsets = *(UIEdgeInsets *)invalidScrollViewInsets;
    self->_horizontalScrollIndicatorBaseInsets = *(UIEdgeInsets *)invalidScrollViewInsets;
  }
}

- (void)setInYttriumMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F97EA0] isWAPEnabled] && self->_inYttriumMode != v3)
  {
    self->_inYttriumMode = v3;
    [(UITapGestureRecognizer *)self->_showBarsFromBottomBarRecognizer setEnabled:v3 ^ 1];
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator setIgnoresDragging:v3];
    double v5 = [(BrowserRootViewController *)self _activeTabDocumentView];
    [v5 setShowsInteractionHint:v3];

    if (!v3)
    {
      double v12 = [(BrowserRootViewController *)self _continuousReadingViewController];
      double v13 = [v12 view];
      [v13 removeGestureRecognizer:self->_enterYttriumStateRecognizer];

      enterYttriumStateRecognizer = self->_enterYttriumStateRecognizer;
      self->_enterYttriumStateRecognizer = 0;

      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView removeGestureRecognizer:self->_exitYttriumStateRecognizer];
      exitYttriumStateRecognizer = self->_exitYttriumStateRecognizer;
      self->_exitYttriumStateRecognizer = 0;

      [(BrowserRootViewController *)self setInYttriumState:0];
    }
    else
    {
      double v6 = (SFTouchDownGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F78480]) initWithTarget:self action:sel__enterYttriumStateGestureRecognized_];
      double v7 = self->_enterYttriumStateRecognizer;
      self->_enterYttriumStateRecognizer = v6;

      [(SFTouchDownGestureRecognizer *)self->_enterYttriumStateRecognizer setDelegate:self];
      double v8 = [(BrowserRootViewController *)self _continuousReadingViewController];
      double v9 = [v8 view];
      [v9 addGestureRecognizer:self->_enterYttriumStateRecognizer];

      double v10 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__exitYttriumStateGestureRecognized_];
      double v11 = self->_exitYttriumStateRecognizer;
      self->_exitYttriumStateRecognizer = v10;

      [(UIPanGestureRecognizer *)self->_exitYttriumStateRecognizer _setCanPanHorizontally:0];
      [(UIPanGestureRecognizer *)self->_exitYttriumStateRecognizer setDelegate:self];
      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addGestureRecognizer:self->_exitYttriumStateRecognizer];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [(BrowserRootViewController *)self updateCapsuleMinimizationStyle];
    [(BrowserRootViewController *)self updateTabViewPinchRecognizer];
    [WeakRetained updatePullToRefreshIsEnabled];
    [WeakRetained updateDynamicBarGeometry];
    double v16 = [MEMORY[0x1E4F781F8] sharedProvider];
    [v16 clearCachedMenuForPersona:0];
  }
}

- (void)_layOutSidebarContentDimmingView
{
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[SidebarContentDimmingView setFrame:](self->_sidebarContentDimmingView, "setFrame:");
  sidebarContentDimmingView = self->_sidebarContentDimmingView;
  [(BrowserRootViewController *)self _sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:0];
  -[SidebarContentDimmingView setDimmedContentFrame:](sidebarContentDimmingView, "setDimmedContentFrame:");
  double v4 = self->_sidebarContentDimmingView;
  uint64_t v5 = [(BrowserRootViewController *)self _shouldShowSidebarContentDimmingView] ^ 1;
  [(SidebarContentDimmingView *)v4 setTransparent:v5];
}

- (CGRect)_sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 4;
  }
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  -[BrowserRootViewController obscuredInsetsWithComponents:forRect:inCoordinateSpace:](self, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", v4, self->_documentAndTopBarsContainerView);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(BrowserRootViewController *)self view];
  [v13 safeAreaInsets];
  double v15 = v6 - v14;

  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  double v17 = v8 + v16;
  double v19 = v15 + v18;
  double v21 = v20 - (v8 + v12);
  double v23 = v22 - (v10 + v15);
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)_shouldShowSidebarContentDimmingView
{
  return self->_showingSidebar && self->_sidebarStyle == 1;
}

- (void)webSearchTipDidBecomeUnavailable
{
  [(BrowserRootViewController *)self _dismissWebSearchTipPopoverIfNeeded];
  catalogViewController = self->_catalogViewController;
  [(CatalogViewController *)catalogViewController dismissWebSearchTipIfNeeded];
}

- (void)_dismissWebSearchTipPopoverIfNeeded
{
  double v2 = [(UIViewController *)self->_webSearchTipViewController presentingViewController];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1EC0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__BrowserRootViewController__dismissWebSearchTipPopoverIfNeeded__block_invoke;
    v5[3] = &unk_1E6D77E20;
    id v6 = v2;
    [v4 _performWithoutDeferringTransitions:v5];
  }
}

- (BOOL)capsuleNavigationBarViewController:(id)a3 shouldUnminimizeOnScrollForScrollView:(id)a4
{
  if (self->_keepBarsMinimized) {
    return 0;
  }
  else {
    return ![(BrowserRootViewController *)self _isShowingFindOnPage];
  }
}

- (BOOL)_isShowingFindOnPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v3 = [WeakRetained tabController];
  uint64_t v4 = [v3 activeTabDocument];
  char v5 = [v4 isShowingFindOnPage];

  return v5;
}

- (BOOL)isInYttriumState
{
  return self->_inYttriumState;
}

- (double)horizontalMarginForCatalogViewInPopover
{
  BOOL v3 = [(BrowserRootViewController *)self view];
  [v3 frame];

  [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
  CGRectGetWidth(v6);
  _SFRoundFloatToPixels();
  return result;
}

- (void)_layOutWebpageStatusBarView
{
  webView = self->_webView;
  [(_SFWebView *)webView frame];
  -[_SFWebView convertRect:toView:](webView, "convertRect:toView:", self->_documentAndTopBarsContainerView);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v11;
  double MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = v13;
  v27.origin.CGFloat y = v15;
  v27.size.CGFloat width = v17;
  v27.size.CGFloat height = v19;
  double MinY = CGRectGetMinY(v27);
  v28.origin.CGFloat x = v5;
  v28.origin.CGFloat y = v7;
  v28.size.CGFloat width = v9;
  v28.size.CGFloat height = v11;
  double Width = CGRectGetWidth(v28);
  v29.origin.CGFloat x = v13;
  v29.origin.CGFloat y = v15;
  v29.size.CGFloat width = v17;
  v29.size.CGFloat height = v19;
  double Height = CGRectGetHeight(v29);
  statusBarView = self->_statusBarView;
  -[SFWebpageStatusBarView setFrame:](statusBarView, "setFrame:", MinX, MinY, Width, Height);
}

void __40__BrowserRootViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v33 = [*(id *)(a1 + 32) view];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1672));
  BOOL v3 = [WeakRetained siriLinkCoordinator];

  double v4 = [v3 createNewBookmarkInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v4);

  CGFloat v5 = [v3 createReadingListItemInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v5);

  double v6 = [v3 openBookmarkInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v6);

  CGFloat v7 = [v3 openBookmarkInTabInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v7);

  double v8 = [v3 openReadingListItemInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v8);

  CGFloat v9 = [v3 changeReaderModeInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v9);

  double v10 = [v3 createNewTabInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v10);

  CGFloat v11 = [v3 createNewTabInteractionForAssistantIntent];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v11);

  double v12 = [v3 openTabInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v12);

  CGFloat v13 = [v3 closeTabInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v13);

  double v14 = [v3 createNewPrivateTabInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v14);

  CGFloat v15 = [v3 createNewTabGroupInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v15);

  double v16 = [v3 openTabGroupInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v16);

  CGFloat v17 = [v3 closeViewInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v17);

  double v18 = [v3 openViewInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v18);

  CGFloat v19 = [v3 webSearchInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v19);

  double v20 = [v3 navigateContinuousReadingListInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v20);

  double v21 = [v3 openClearHistoryInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v21);

  double v22 = [v3 listenToPageSiriReaderInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v22);

  double v23 = [v3 loadURLInTabInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v23);

  CGFloat v24 = [v3 searchTabsInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v24);

  double v25 = [v3 findOnPageInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v25);

  CGRect v26 = [v3 searchWebAssistantIntentInteraction];
  objc_msgSend(v33, "_sf_addInteractionUnlessNil:", v26);

  uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 1712);
  if (v27)
  {
    (*(void (**)(void))(v27 + 16))();
    uint64_t v28 = *(void *)(a1 + 32);
    CGRect v29 = *(void **)(v28 + 1712);
    *(void *)(v28 + 1712) = 0;
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F78470]);
  uint64_t v31 = *(void *)(a1 + 32);
  CGFloat v32 = *(void **)(v31 + 1720);
  *(void *)(v31 + 1720) = v30;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1720), "setObserver:");
  [*(id *)(*(void *)(a1 + 32) + 1720) startObserving];
}

- (int64_t)preferredLeadingStatusBarStyle
{
  if (!self->_showingSidebar) {
    return 4;
  }
  [(_SFBrowserConfiguration *)self->_configuration barTintStyle];
  if (_SFIsDarkTintStyle()) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)setUpTabSwitcherViewController
{
  BOOL v3 = [TabSwitcherViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  CGFloat v5 = [WeakRetained tabController];
  double v6 = [(TabSwitcherViewController *)v3 initWithTabController:v5];
  tabSwitcherViewController = self->_tabSwitcherViewController;
  self->_tabSwitcherViewController = v6;

  [(TabSwitcherViewController *)self->_tabSwitcherViewController setContainer:self];
  [(CapsuleNavigationBarViewController *)self->_capsuleViewController setLinkedPageView:self->_tabSwitcherViewController];
  contentContainerView = self->_contentContainerView;
  CGFloat v9 = [(TabSwitcherViewController *)self->_tabSwitcherViewController pinchGestureRecognizer];
  [(ViewWithCustomNextResponder *)contentContainerView addGestureRecognizer:v9];

  double v10 = self->_contentContainerView;
  CGFloat v11 = [(TabSwitcherViewController *)self->_tabSwitcherViewController panGestureRecognizerForTrackingPinchTranslationVelocity];
  [(ViewWithCustomNextResponder *)v10 addGestureRecognizer:v11];

  [(BrowserRootViewController *)self _layOutTabView];
  double v12 = [(TabSwitcherViewController *)self->_tabSwitcherViewController view];
  [v12 layoutIfNeeded];

  [(BrowserRootViewController *)self _updateTabSwitcherSidebarToggle];
  CGFloat v13 = self->_tabSwitcherViewController;
  return v13;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  CGFloat v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    int v6 = [(BrowserRootViewController *)self isViewLoaded];
    CGFloat v5 = obj;
    if (v6)
    {
      self->_sizeForToolbarPlacement = (CGSize)*MEMORY[0x1E4F1DB30];
      [(BrowserRootViewController *)self _updateToolbarPlacementIfNeeded];
      CGFloat v5 = obj;
    }
  }
}

- (void)_createBottomToolbarIfNeeded
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!self->_bottomToolbar && !self->_capsuleViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    double v4 = objc_alloc_init(CapsuleNavigationBarViewController);
    capsuleViewController = self->_capsuleViewController;
    self->_capsuleViewController = v4;

    [(CapsuleNavigationBarViewController *)self->_capsuleViewController setNextResponder:WeakRetained parentFocusEnvironment:WeakRetained];
    [(CapsuleNavigationBarViewController *)self->_capsuleViewController setDelegate:self];
    int v6 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    [v6 setAccessibilityIdentifier:@"CapsuleViewController"];

    BOOL v7 = self->_lockedPrivateBrowsingView != 0;
    double v8 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    [v8 setHidden:v7];

    CGFloat v9 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    double v10 = objc_msgSend(MEMORY[0x1E4F78548], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
    [v9 setTheme:v10];

    CGFloat v11 = [MEMORY[0x1E4F78290] sharedFeatureManager];
    objc_msgSend(v9, "setLayoutStyle:", objc_msgSend(v11, "preferredCapsuleLayoutStyle"));

    [(BrowserRootViewController *)self updateCapsuleMinimizationStyle];
    [(CapsuleNavigationBarViewController *)self->_capsuleViewController setLinkedPageView:self->_tabSwitcherViewController];
    BOOL v12 = [(TabSwitcherViewController *)self->_tabSwitcherViewController tabOverviewIsVisible];
    CGFloat v13 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = @"not visible";
      if (v12) {
        double v14 = @"visible";
      }
      int v46 = 138412290;
      CGFloat v47 = v14;
      _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "Setting up capsule view while tab overview is %@", (uint8_t *)&v46, 0xCu);
    }
    [v9 setShouldDismissContent:v12];
    [v9 setUserInteractionEnabled:v12 ^ 1];
    [v9 addGestureObserver:self];
    CGFloat v15 = [WeakRetained tabController];
    [(CapsuleNavigationBarViewController *)self->_capsuleViewController setTabController:v15];

    [(BrowserRootViewController *)self addChildViewController:self->_capsuleViewController];
    double v16 = [(BrowserRootViewController *)self view];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    CGRect v26 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    [v26 setAutoresizingMask:18];

    uint64_t v27 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    [v16 addSubview:v27];

    [(CapsuleNavigationBarViewController *)self->_capsuleViewController didMoveToParentViewController:self];
    if (self->_keepBarsMinimized) {
      [(CapsuleNavigationBarViewController *)self->_capsuleViewController transitionToState:1 animated:0 completionHandler:0];
    }
    if (self->_inYttriumMode)
    {
      BOOL inYttriumState = self->_inYttriumState;
      CGRect v29 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      [v29 setForceHidden:inYttriumState];

      [(CapsuleNavigationBarViewController *)self->_capsuleViewController transitionToState:self->_inYttriumState animated:0 completionHandler:0];
    }
    id v30 = objc_alloc(MEMORY[0x1E4F78468]);
    uint64_t v31 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
    CGFloat v32 = (SFThemeColorEffectView *)[v30 initWithEffect:v31];
    topBackdrop = self->_topBackdrop;
    self->_topBackdrop = v32;

    [(SFThemeColorEffectView *)self->_topBackdrop setThemeColorVisibility:1.0];
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addSubview:self->_topBackdrop];
    id v34 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v35 = [(SFThemeColorEffectView *)self->_topBackdrop contentView];
    [v35 bounds];
    double Height = CGRectGetHeight(v49);
    _SFOnePixel();
    double v38 = Height - v37;
    double v39 = [(SFThemeColorEffectView *)self->_topBackdrop contentView];
    [v39 bounds];
    double Width = CGRectGetWidth(v50);
    _SFOnePixel();
    long double v42 = (UIView *)objc_msgSend(v34, "initWithFrame:", 0.0, v38, Width, v41);
    topSeparator = self->_topSeparator;
    self->_topSeparator = v42;

    [(UIView *)self->_topSeparator setAutoresizingMask:10];
    [(BrowserRootViewController *)self _updateCapsuleTopSeparatorColor];
    double v44 = [(SFThemeColorEffectView *)self->_topBackdrop contentView];
    [v44 addSubview:self->_topSeparator];

    [(BrowserRootViewController *)self _applyTopBackdropTheme];
    [(BrowserRootViewController *)self _applyStatusBarBackdropTheme];
    double v45 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    [(CatalogViewController *)self->_catalogViewController setStartPageScrollObserver:v45];
  }
}

- (void)_updateCapsuleTopSeparatorColor
{
  if (self->_usesFaintTopSeparator) {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_secondaryBarHairlineOutlineColor");
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineShadowColor");
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)self->_topSeparator setBackgroundColor:v3];
}

- (void)_updateTopBarAllowingRemoval:(BOOL)a3
{
  BOOL v3 = a3;
  v28[1] = *MEMORY[0x1E4F143B8];
  if ([(BrowserRootViewController *)self isViewLoaded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if ([(BrowserRootViewController *)self usingUnifiedBar])
    {
      if (!self->_unifiedBar)
      {
        BOOL v7 = objc_alloc_init(UnifiedBar);
        unifiedBar = self->_unifiedBar;
        self->_unifiedBar = v7;

        [(UnifiedBar *)self->_unifiedBar setDelegate:WeakRetained];
        uint64_t v27 = @"isStandaloneBar";
        uint64_t v9 = [WeakRetained tabBarDisplayMode];
        double v10 = @"false";
        if (v9 == 2) {
          double v10 = @"true";
        }
        v28[0] = v10;
        CGFloat v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        BOOL v12 = WBSMakeAccessibilityIdentifier();
        [(UnifiedBar *)self->_unifiedBar setAccessibilityIdentifier:v12];

        [(TabBarManager *)self->_tabBarManager setUnifiedBar:self->_unifiedBar];
        -[TabBarManager setDisplayMode:](self->_tabBarManager, "setDisplayMode:", [WeakRetained tabBarDisplayMode]);
        [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addSubview:self->_unifiedBar];
        [v6 browserViewController:self didCreateUnifiedBar:self->_unifiedBar];
        CGFloat v13 = [(UnifiedBar *)self->_unifiedBar viewForBarItem:3];
        sidebarButtonEmbeddedInUnifiedBar = self->_sidebarButtonEmbeddedInUnifiedBar;
        self->_sidebarButtonEmbeddedInUnifiedBar = v13;

LABEL_10:
        if (!v3)
        {
LABEL_15:
          double v21 = [(BrowserRootViewController *)self topBar];
          if (v21)
          {
            double v22 = (void *)MEMORY[0x1E4F3AF10];
            dynamicBarAnimator = self->_dynamicBarAnimator;
            double v24 = [(BrowserRootViewController *)self view];
            [v22 attachToBar:v21 withAnimator:dynamicBarAnimator inContainerView:v24];

            if (self->_inYttriumMode) {
              [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:!self->_inYttriumState animated:0];
            }
          }
          [(BrowserRootViewController *)self _updateTopBarStyles];

          goto LABEL_19;
        }
        [(NavigationBar *)self->_navigationBar removeFromSuperview];
        navigationBar = self->_navigationBar;
        self->_navigationBar = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      if (v3)
      {
        [(TabBarManager *)self->_tabBarManager setDisplayMode:0];
        [(TabBarManager *)self->_tabBarManager setUnifiedBar:0];
        [(UnifiedBar *)self->_unifiedBar removeFromSuperview];
        CGFloat v15 = self->_unifiedBar;
        self->_unifiedBar = 0;
      }
      if ([(BrowserRootViewController *)self usingLoweredBar]) {
        goto LABEL_10;
      }
      if (!self->_navigationBar)
      {
        double v17 = -[_SFNavigationBar initWithFrame:]([NavigationBar alloc], "initWithFrame:", 0.0, 0.0, 0.0, 44.0);
        double v18 = self->_navigationBar;
        self->_navigationBar = v17;

        [(_SFNavigationBar *)self->_navigationBar setDelegate:WeakRetained];
        double v19 = _SFBackdropGroupNameForOwner();
        [(_SFNavigationBar *)self->_navigationBar setBackdropGroupName:v19];

        [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addSubview:self->_navigationBar];
        [v6 browserViewController:self didCreateNavigationBar:self->_navigationBar];
        [(CatalogViewController *)self->_catalogViewController setNavigationBar:self->_navigationBar];
        double v20 = (void *)MEMORY[0x1E4FB1EB0];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __58__BrowserRootViewController__updateTopBarAllowingRemoval___block_invoke;
        v25[3] = &unk_1E6D77D90;
        v25[4] = self;
        CGRect v26 = (NavigationBar *)WeakRetained;
        [v20 performWithoutAnimation:v25];
        navigationBar = v26;
        goto LABEL_14;
      }
    }
LABEL_19:
  }
}

- (_SFNavigationBarCommon)topBar
{
  unifiedBar = self->_unifiedBar;
  if (!unifiedBar) {
    unifiedBar = self->_navigationBar;
  }
  id v3 = unifiedBar;
  return (_SFNavigationBarCommon *)v3;
}

- (void)setConfiguration:(id)a3
{
  CGFloat v5 = (_SFBrowserConfiguration *)a3;
  configuration = self->_configuration;
  if (configuration != v5)
  {
    double v8 = v5;
    char v7 = [(_SFBrowserConfiguration *)configuration isEqual:v5];
    CGFloat v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      [(BrowserRootViewController *)self _updateTopBarStyles];
      CGFloat v5 = v8;
    }
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)BrowserRootViewController;
  [(BrowserRootViewController *)&v6 viewDidLoad];
  [(BrowserRootViewController *)self _updateTopBarStyles];
  id v3 = +[LaunchStateController sharedController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__BrowserRootViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_1E6D77E20;
  void v5[4] = self;
  [v3 doAfterUIBecomesActive:v5];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C28] object:0];
  [v4 addObserver:self selector:sel__updateTopBarStyles name:*MEMORY[0x1E4F99658] object:0];
}

- (void)setTabBar:(id)a3
{
  CGFloat v5 = (TabBar *)a3;
  p_tabBar = &self->_tabBar;
  if (self->_tabBar != v5)
  {
    CGFloat v13 = v5;
    char v7 = [(BrowserRootViewController *)self view];
    [v7 setNeedsLayout];

    if (*p_tabBar)
    {
      -[BarContainerView unregisterBarView:](self->_topAuxiliaryBarsContainerView, "unregisterBarView:");
      double v8 = *p_tabBar;
    }
    else
    {
      double v8 = 0;
    }
    [(TabBar *)v8 removeFromSuperview];
    objc_storeStrong((id *)&self->_tabBar, a3);
    tabBarClipperView = self->_tabBarClipperView;
    if (*p_tabBar)
    {
      if (!tabBarClipperView)
      {
        CGFloat v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        BOOL v12 = self->_tabBarClipperView;
        self->_tabBarClipperView = v11;

        [(UIView *)self->_tabBarClipperView setClipsToBounds:1];
        [(BarContainerView *)self->_topAuxiliaryBarsContainerView addSubview:self->_tabBarClipperView];
      }
      -[BarContainerView registerBarView:](self->_topAuxiliaryBarsContainerView, "registerBarView:");
      [(UIView *)self->_tabBarClipperView addSubview:*p_tabBar];
      [(BrowserRootViewController *)self updateTabHoverPreview];
      [(BrowserRootViewController *)self _updateTopBarStyles];
    }
    else
    {
      [(UIView *)tabBarClipperView removeFromSuperview];
      double v10 = self->_tabBarClipperView;
      self->_tabBarClipperView = 0;
    }
    CGFloat v5 = v13;
  }
}

- (void)_updateTopBarStyles
{
}

- (void)updateTabHoverPreview
{
  tabBar = self->_tabBar;
  if (tabBar)
  {
    double v4 = tabBar;
  }
  else
  {
    double v4 = [(TabBarManager *)self->_tabBarManager effectiveTabBar];
  }
  BOOL v12 = v4;
  CGFloat v5 = [(TabHoverPreview *)self->_tabHoverPreview tabBar];

  objc_super v6 = v12;
  if (v5 != v12)
  {
    [(TabHoverPreview *)self->_tabHoverPreview removeFromSuperview];
    tabHoverPreview = self->_tabHoverPreview;
    self->_tabHoverPreview = 0;

    objc_super v6 = v12;
    if (v12)
    {
      double v8 = [[TabHoverPreview alloc] initWithTabBar:v12];
      uint64_t v9 = self->_tabHoverPreview;
      self->_tabHoverPreview = v8;

      [(TabHoverPreview *)self->_tabHoverPreview setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TabHoverPreview *)self->_tabHoverPreview setInsetsPreviewFromTabBarEdge:v12 == self->_tabBar];
      unifiedBar = self->_unifiedBar;
      if (unifiedBar)
      {
        [(UnifiedBar *)unifiedBar layoutMargins];
        [(TabHoverPreview *)self->_tabHoverPreview setTopInset:v11];
      }
      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addSubview:self->_tabHoverPreview];
      objc_super v6 = v12;
    }
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F78300]);
  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  id v28 = (id)objc_msgSend(v3, "initWithFrame:");

  [(BrowserRootViewController *)self setView:v28];
  [v28 setDelegate:self];
  [v28 setClipsToBounds:1];
  if (objc_opt_respondsToSelector()) {
    [v28 _addBoundingPathChangeObserver:self];
  }
  CGFloat v5 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  contentContainerViewController = self->_contentContainerViewController;
  self->_contentContainerViewController = v5;

  char v7 = objc_alloc_init(ViewWithCustomNextResponder);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v7;

  [(UIViewController *)self->_contentContainerViewController setView:self->_contentContainerView];
  [(ViewWithCustomNextResponder *)self->_contentContainerView setClipsToBounds:0];
  [(BrowserRootViewController *)self addChildViewController:self->_contentContainerViewController];
  [v28 addSubview:self->_contentContainerView];
  [(UIViewController *)self->_contentContainerViewController didMoveToParentViewController:self];
  uint64_t v9 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  documentAndTopBarsContainerViewController = self->_documentAndTopBarsContainerViewController;
  self->_documentAndTopBarsContainerViewController = v9;

  id v11 = objc_alloc(MEMORY[0x1E4F78300]);
  [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
  BOOL v12 = (SFOrderedContainerView *)objc_msgSend(v11, "initWithFrame:");
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  self->_documentAndTopBarsContainerView = v12;

  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView setDelegate:self];
  [(UIViewController *)self->_documentAndTopBarsContainerViewController setView:self->_documentAndTopBarsContainerView];
  [(UIViewController *)self->_contentContainerViewController addChildViewController:self->_documentAndTopBarsContainerViewController];
  [(ViewWithCustomNextResponder *)self->_contentContainerView addSubview:self->_documentAndTopBarsContainerView];
  [(UIViewController *)self->_documentAndTopBarsContainerViewController didMoveToParentViewController:self->_contentContainerViewController];
  double v14 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__hideNavigationBarGestureRecognized_];
  hideNavigationBarGestureRecognizer = self->_hideNavigationBarGestureRecognizer;
  self->_hideNavigationBarGestureRecognizer = v14;

  [(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer _setCanPanHorizontally:0];
  [(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer setDelegate:self];
  [v28 addGestureRecognizer:self->_hideNavigationBarGestureRecognizer];
  double v16 = objc_alloc_init(BarContainerView);
  topAuxiliaryBarsContainerView = self->_topAuxiliaryBarsContainerView;
  self->_topAuxiliaryBarsContainerView = v16;

  double v18 = [(BarContainerView *)self->_topAuxiliaryBarsContainerView layer];
  [v18 setAllowsGroupOpacity:0];
  [v18 setAllowsGroupBlending:0];
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addSubview:self->_topAuxiliaryBarsContainerView];
  double v19 = objc_alloc_init(TabBarDropExpansionView);
  tabBarDropExpansionView = self->_tabBarDropExpansionView;
  self->_tabBarDropExpansionView = v19;

  [(TabBarDropExpansionView *)self->_tabBarDropExpansionView setDelegate:self];
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addSubview:self->_tabBarDropExpansionView];
  double v21 = (SFTouchDownGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F78480]) initWithTarget:self action:sel__receivedTouchDown_];
  touchDownGestureRecognizer = self->_touchDownGestureRecognizer;
  self->_touchDownGestureRecognizer = v21;

  [(SFTouchDownGestureRecognizer *)self->_touchDownGestureRecognizer setDelegate:self];
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addGestureRecognizer:self->_touchDownGestureRecognizer];
  double v23 = (SFTouchUpGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F78488]) initWithTarget:self action:sel__receivedTouchUp_];
  touchUpGestureRecognizer = self->_touchUpGestureRecognizer;
  self->_touchUpGestureRecognizer = v23;

  [(SFTouchUpGestureRecognizer *)self->_touchUpGestureRecognizer setDelegate:self];
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addGestureRecognizer:self->_touchUpGestureRecognizer];
  double v25 = (_SFDynamicBarAnimator *)objc_alloc_init(MEMORY[0x1E4F3AF70]);
  dynamicBarAnimator = self->_dynamicBarAnimator;
  self->_dynamicBarAnimator = v25;

  [(BrowserRootViewController *)self _updateToolbarPlacementIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained updateDynamicBarGeometry];

  [(BrowserRootViewController *)self _setUpFloatingSidebarButton];
  [(BrowserRootViewController *)self _setUpTabGroupButton];
  self->_pullToRefreshIsEnabled = 1;
  [(BrowserRootViewController *)self _setUpWebpageStatusBarIfNeeded];
}

- (void)addChildViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BrowserRootViewController;
  id v4 = a3;
  [(BrowserRootViewController *)&v5 addChildViewController:v4];
  objc_msgSend(v4, "_setIgnoresWrapperViewForContentOverlayInsets:", self->_documentSafeAreaInsetsFrozen, v5.receiver, v5.super_class);
}

- (void)_setUpWebpageStatusBarIfNeeded
{
  if ([(BrowserRootViewController *)self _usesWebpageStatusBar] && !self->_statusBarView)
  {
    id v9 = [(BrowserRootViewController *)self view];
    id v3 = objc_alloc(MEMORY[0x1E4F78540]);
    id v4 = [(BrowserRootViewController *)self view];
    [v4 bounds];
    objc_super v5 = (SFWebpageStatusBarView *)objc_msgSend(v3, "initWithFrame:");
    statusBarView = self->_statusBarView;
    self->_statusBarView = v5;

    [v9 addSubview:self->_statusBarView];
    char v7 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel__statusBarHover_];
    statusBarHoverGestureRecognizer = self->_statusBarHoverGestureRecognizer;
    self->_statusBarHoverGestureRecognizer = v7;

    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addGestureRecognizer:self->_statusBarHoverGestureRecognizer];
    [v9 setNeedsLayout];
  }
}

- (BOOL)_usesWebpageStatusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained isPrivateBrowsingEnabled])
  {
    id v4 = +[Application sharedApplication];
    char v5 = [v4 isPrivateBrowsingLocked];

    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (![MEMORY[0x1E4F78290] supportsWebpageStatusBar])
  {
LABEL_8:
    LOBYTE(v7) = 0;
    return v7;
  }
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v6 BOOLForKey:*MEMORY[0x1E4F78758]]) {
    BOOL v7 = ![(BrowserRootViewController *)self usingLoweredBar];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_setUpTabGroupButton
{
  id v3 = +[FeatureManager sharedFeatureManager];
  if ([v3 isTabGroupButtonEnabled]
    && [v3 isCustomTabGroupsEnabled])
  {
    id v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    char v5 = [MEMORY[0x1E4FB1618] clearColor];
    objc_super v6 = [v4 background];
    [v6 setBackgroundColor:v5];

    objc_msgSend(v4, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    BOOL v7 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v4 primaryAction:0];
    sidebarTrailingButton = self->_sidebarTrailingButton;
    self->_sidebarTrailingButton = v7;

    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
    [(UIButton *)self->_sidebarTrailingButton setImage:v9 forState:0];
    [(UIButton *)self->_sidebarTrailingButton addTarget:self action:sel__sidebarTrailingButtonWasTapped forControlEvents:64];
    [(UIButton *)self->_sidebarButtonEmbeddedInSidebar _touchInsets];
    -[UIButton _setTouchInsets:](self->_sidebarTrailingButton, "_setTouchInsets:");
    [(UIButton *)self->_sidebarTrailingButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_sidebarTrailingButton setShowsMenuAsPrimaryAction:1];
    [(UIButton *)self->_sidebarTrailingButton setAccessibilityIdentifier:@"NewTabGroupButton"];
    [(UIButton *)self->_sidebarTrailingButton sf_configureLargeContentViewerForBarItem:2];
    [(UIButton *)self->_sidebarTrailingButton setLargeContentImage:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v11 = [WeakRetained tabController];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__BrowserRootViewController__setUpTabGroupButton__block_invoke;
    v15[3] = &unk_1E6D7A418;
    objc_copyWeak(&v17, &location);
    id v12 = v11;
    id v16 = v12;
    [(UIButton *)self->_sidebarTrailingButton _setMenuProvider:v15];
    CGFloat v13 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_sidebarTrailingButton];
    sidebarTrailingButtonItem = self->_sidebarTrailingButtonItem;
    self->_sidebarTrailingButtonItem = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)updateUsesLockdownStatusBar
{
  uint64_t v3 = [MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari];
  if ([(BrowserRootViewController *)self usingUnifiedBar]) {
    [(TabBarManager *)self->_tabBarManager setShowingLockdownStatusBar:v3];
  }
  if ([(BrowserRootViewController *)self usingLoweredBar])
  {
    id v4 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    [v4 setShowingLockdownStatusBar:v3];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v5 = [WeakRetained tabController];
  objc_super v6 = [v5 activeTabDocument];
  BOOL v7 = [v6 navigationBarItem];
  double v8 = [(TabBarManager *)self->_tabBarManager lockdownStatusBar];
  [v8 setNavigationBarItem:v7];
}

- (void)updateSuppressesStandaloneTabBar
{
  if (self->_unifiedBar
    && self->_sizeTransitionCount
    && ![(BrowserRootViewController *)self usingUnifiedBar])
  {
    return;
  }
  uint64_t v3 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  char v4 = [v3 showRectangularTabsInSeparateBar];

  if ((v4 & 1) == 0)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v7 = [v6 BOOLForKey:*MEMORY[0x1E4F78A18]];

    double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    if (objc_msgSend(MEMORY[0x1E4F3AF78], "isTabBarAvailableForScreenSize:", v9, v11))
    {
      BOOL v13 = fmin(v10, v12) <= 414.0;
      BOOL v14 = v10 <= v12 && v13;

      if (v7) {
        BOOL v15 = !v14;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        uint64_t v5 = 0;
        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v5 = _SFDeviceIsPad() ^ 1;
    goto LABEL_19;
  }
  uint64_t v5 = 1;
LABEL_19:
  tabBarManager = self->_tabBarManager;
  [(TabBarManager *)tabBarManager setSuppressesStandaloneTabBar:v5];
}

- (CGRect)_frameForSidebarWhenShowing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(BrowserRootViewController *)self view];
  [v5 safeAreaInsets];
  double v7 = v6;

  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  double v8 = v7 + CGRectGetHeight(v35);
  if (self->_toolbarPlacement == 1)
  {
    bottomToolbar = self->_bottomToolbar;
    if (bottomToolbar)
    {
      documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
      [(BrowserToolbar *)bottomToolbar bounds];
      -[SFOrderedContainerView convertRect:fromView:](documentAndTopBarsContainerView, "convertRect:fromView:", self->_bottomToolbar);
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
      double MaxY = CGRectGetMaxY(v36);
      v37.origin.CGFloat x = v12;
      v37.origin.CGFloat y = v14;
      v37.size.CGFloat width = v16;
      v37.size.CGFloat height = v18;
      double v20 = MaxY - CGRectGetMinY(v37);
      if (v20 >= 0.0)
      {
        v38.origin.CGFloat x = v12;
        v38.origin.CGFloat y = v14;
        v38.size.CGFloat width = v16;
        v38.size.CGFloat height = v18;
        double Height = CGRectGetHeight(v38);
        [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView safeAreaInsets];
        if (v20 <= Height + v22) {
          double v8 = v8 - v20;
        }
      }
    }
  }
  double v23 = -v7;
  [(SidebarViewController *)self->_sidebarViewController separatorWidth];
  double v25 = v24;
  if ([(SFOrderedContainerView *)self->_documentAndTopBarsContainerView _sf_usesLeftToRightLayout])
  {
    CGFloat v26 = 0.0;
    if (!v3)
    {
      uint64_t v27 = 0x4074000000000000;
      double v28 = v23;
      double v29 = v8;
      CGFloat v26 = -CGRectGetWidth(*(CGRect *)&v26) - v25;
    }
  }
  else
  {
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    double Width = CGRectGetWidth(v39);
    double v31 = Width;
    if (v3)
    {
      v40.size.CGFloat width = 320.0;
      v40.origin.CGFloat x = 0.0;
      v40.origin.CGFloat y = v23;
      v40.size.CGFloat height = v8;
      CGFloat v26 = v31 - CGRectGetWidth(v40);
    }
    else
    {
      CGFloat v26 = v25 + Width;
    }
  }
  double v32 = 320.0;
  double v33 = v23;
  double v34 = v8;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BrowserRootViewController;
  id v4 = a3;
  [(BrowserRootViewController *)&v8 traitCollectionDidChange:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserViewController:traitCollectionDidChange:", self, v4, v8.receiver, v8.super_class);

  double v6 = [(BrowserRootViewController *)self traitCollection];
  int v7 = [v6 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v7) {
    [(BrowserRootViewController *)self safari_updateApplicationBackgroundStyle];
  }
}

- (TabSwitcherViewController)tabSwitcherViewController
{
  return self->_tabSwitcherViewController;
}

void __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1192) = 0;
  char v1 = *(unsigned char *)(a1 + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke_2;
  v2[3] = &unk_1E6D77E20;
  v2[4] = *(void *)(a1 + 32);
  +[UIView safari_animate:withDuration:animations:](0.25, MEMORY[0x1E4FB1EB0], v1, v2);
}

uint64_t __81__BrowserRootViewController_setNeedsPreferredStatusBarUpdateAfterCommitAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)setNeedsScrollToTopView:(BOOL)a3
{
  if (self->_needsScrollToTopView != a3)
  {
    self->_needsScrollToTopView = a3;
    if (a3)
    {
      objc_initWeak(&location, self);
      id v4 = [ScrollToTopView alloc];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke;
      v12[3] = &unk_1E6D7A300;
      objc_copyWeak(&v13, &location);
      uint64_t v5 = [(ScrollToTopView *)v4 initWithTargetBlock:v12];
      scrollToTopView = self->_scrollToTopView;
      self->_scrollToTopView = v5;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke_2;
      v10[3] = &unk_1E6D78630;
      objc_copyWeak(&v11, &location);
      [(ScrollToTopView *)self->_scrollToTopView setShowBarsBlock:v10];
      int v7 = [(BrowserRootViewController *)self view];
      [v7 addSubview:self->_scrollToTopView];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      [(ScrollToTopView *)self->_scrollToTopView removeFromSuperview];
      objc_super v8 = self->_scrollToTopView;
      self->_scrollToTopView = 0;
    }
    double v9 = [(BrowserRootViewController *)self view];
    [v9 setNeedsLayout];
  }
}

- (SFBarAnimating)currentBarAnimator
{
  BOOL v3 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];

  if (v3)
  {
    id v4 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  }
  else
  {
    id v4 = self->_dynamicBarAnimator;
  }
  return v4;
}

- (_SFDynamicBarAnimator)dynamicBarAnimator
{
  return self->_dynamicBarAnimator;
}

- (UIView)documentAndTopBarsContainerView
{
  return (UIView *)self->_documentAndTopBarsContainerView;
}

- (void)setUsesFaintTopSeparator:(BOOL)a3
{
  if (self->_usesFaintTopSeparator != a3)
  {
    BOOL v3 = a3;
    self->_usesFaintTopSeparator = a3;
    uint64_t v5 = [(BrowserRootViewController *)self navigationBar];
    [v5 setUsesFaintSeparator:v3];

    double v6 = [(BrowserRootViewController *)self tabBarManager];
    int v7 = [v6 unifiedBar];
    [v7 setUsesFaintSeparator:v3];

    [(BrowserRootViewController *)self _updateCapsuleTopSeparatorColor];
  }
}

- (void)updateThemeColorIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BrowserRootViewController *)self usingUnifiedBar]
    || [(BrowserRootViewController *)self usingLoweredBar])
  {
    [(BrowserRootViewController *)self _updateTopBarStylesAnimated:v3];
  }
}

- (void)updateUnifiedBarVisibility
{
  [(UnifiedBar *)self->_unifiedBar setHidden:[(BrowserRootViewController *)self _shouldHideUnifiedBar]];
  [(BrowserRootViewController *)self _setShowingFloatingSidebarButton:0];
  id v3 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if ([v3 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v4 = [v3 presentationState];

    if (v4 == 2) {
      goto LABEL_6;
    }
    id v3 = [(BrowserRootViewController *)self view];
    [v3 setNeedsLayout];
    [v3 layoutIfNeeded];
  }

LABEL_6:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained reloadSidebarAnimated:0];
  [WeakRetained updateTabViewPinchRecognizer];
  uint64_t v5 = [WeakRetained tabController];
  [v5 updateLocalTabGroupTitle];
}

- (BOOL)_shouldHideUnifiedBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = [WeakRetained tabController];
  char v4 = [v3 isShowingLibraryDocument];

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BrowserRootViewController;
  [(BrowserRootViewController *)&v8 viewDidAppear:a3];
  self->_canBecomeFirstResponder = 1;
  [(BrowserRootViewController *)self updateAccessibilityIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v5 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if ([v5 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v6 = [v5 presentationState];

    if (v6 != 2) {
      [WeakRetained updateFirstResponderOrFocus];
    }
  }
  int v7 = +[LaunchStateController sharedController];
  [v7 applicationUIDidBecomeActive];
}

- (void)setWebView:(id)a3
{
  id v5 = (_SFWebView *)a3;
  webView = self->_webView;
  id v11 = v5;
  if (webView != v5)
  {
    int v7 = webView;
    objc_super v8 = [(_SFWebView *)v7 scrollView];
    [v8 setRefreshControl:0];

    objc_storeStrong((id *)&self->_webView, a3);
    double v9 = [(_SFWebView *)v11 scrollView];
    scrollView = self->_scrollView;
    self->_scrollView = v9;

    [(BrowserRootViewController *)self _setUpRefreshControlIfNeeded];
  }
}

- (void)_setUpRefreshControlIfNeeded
{
  id v3 = [(BrowserRootViewController *)self refreshControl];
  if (!v3)
  {
    if (!self->_pullToRefreshIsEnabled) {
      return;
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1B58]);
    [v4 addTarget:self action:sel__refreshControlFired_ forControlEvents:4096];
    [(UIScrollView *)self->_scrollView setRefreshControl:v4];
    [(BrowserRootViewController *)self _updateRefreshControlStyle];
    id v3 = v4;
  }
}

- (void)updateViewForTabDocument:(id)a3
{
  id v4 = a3;
  id v7 = [(BrowserRootViewController *)self _continuousReadingViewController];
  id v5 = [v7 view];
  uint64_t v6 = [v4 view];

  [v5 addSubview:v6];
}

- (NavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (BOOL)safari_wantsTransparentApplicationBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (SFTabGroupSwitcherEnabled() || SFEnhancedTabOverviewEnabled())
  {
    BOOL v3 = [WeakRetained presentationState] != 0;
  }
  else
  {
    id v4 = [WeakRetained view];
    id v5 = [v4 superview];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  BOOL v3 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 selectionGestureAxis] != 1;
  }
  else {
    BOOL v5 = 1;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if ([v6 presentationState] != 1 && objc_msgSend(v6, "presentationState") != 2) {
    BOOL v5 = 0;
  }

  if (v5) {
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v9 = [WeakRetained tabController];
  double v10 = [v9 activeTabDocument];
  if ([v10 isShowingSystemStartPage])
  {
  }
  else
  {
    BOOL v11 = [(BrowserRootViewController *)self _shouldShowThemeColorInTopBar];

    if (!v11) {
      goto LABEL_8;
    }
  }
  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    CGFloat v12 = [(SFUnifiedBar *)self->_unifiedBar barTheme];
    [v12 userInterfaceStyle];
    int64_t v7 = SFContrastingStatusBarStyleForInterfaceStyle();

    goto LABEL_16;
  }
  if ([(BrowserRootViewController *)self usingLoweredBar])
  {
    [(SFUnifiedBarTheme *)self->_topBackdropTheme userInterfaceStyle];
    int64_t v7 = SFContrastingStatusBarStyleForInterfaceStyle();
    goto LABEL_16;
  }
LABEL_8:
  int64_t v7 = 0;
LABEL_16:

  return v7;
}

- (void)updateCapsuleMinimizationStyle
{
  BOOL v3 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  id v7 = v3;
  if (self->_inYttriumMode)
  {
    [v3 setMinimizationStyle:1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    BOOL v5 = [WeakRetained tabController];
    id v6 = [v5 activeTabDocument];
    objc_msgSend(v7, "setMinimizationStyle:", objc_msgSend(v6, "isShowingReader"));
  }
}

- (TabBar)tabBar
{
  return self->_tabBar;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  id v3 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if ([v3 presentationState] == 1)
  {

    return 0;
  }
  uint64_t v4 = [v3 presentationState];

  if (v4 == 2 || [(BrowserRootViewController *)self _shouldInterceptBottomGesture]) {
    return 0;
  }
  return self->_barStateAllowsHidingHomeIndicator;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v4 = [WeakRetained tabController];
  BOOL v5 = [v4 activeTabDocument];
  id v6 = [v5 webView];

  int v7 = objc_msgSend(v6, "_sf_usesLeftToRightLayout");
  BOOL showingSidebar = self->_showingSidebar;
  int v9 = [v6 canGoBack];
  int v10 = [v6 canGoForward];
  if (self->_showingSidebar)
  {
    BOOL v11 = [(SidebarViewController *)self->_sidebarViewController contentViewController];
    uint64_t v12 = [v11 preferredScreenEdgesDeferringSystemGestures];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 8;
  if (v7) {
    int v14 = 2;
  }
  else {
    int v14 = 8;
  }
  if (!v7) {
    uint64_t v13 = 2;
  }
  if (v9) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  if (v10) {
    int v16 = v13;
  }
  else {
    int v16 = 0;
  }
  uint64_t v17 = v16 | v15;
  if (showingSidebar) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = 10;
  }
  BOOL v19 = [(BrowserRootViewController *)self _shouldInterceptBottomGesture];
  uint64_t v20 = 4;
  if (!v19) {
    uint64_t v20 = 0;
  }
  unint64_t v21 = v12 | v20 | v17 & v18;

  return v21;
}

- (BOOL)_shouldInterceptBottomGesture
{
  if (!self->_inYttriumState || (_SFDeviceIsPad() & 1) != 0 || (_SFDeviceHasHomeButton() & 1) != 0) {
    return 0;
  }
  BOOL v5 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
  BOOL v3 = v5 != 0;

  return v3;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4E42950]();
  objc_super v8 = [(BrowserRootViewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = [(CatalogViewController *)self->_catalogViewController usesPopoverStyleForFavorites];

    if (v9)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke;
      v15[3] = &unk_1E6D78748;
      void v15[4] = self;
      id v16 = v6;
      uint64_t v10 = MEMORY[0x1E4E42950](v15);

      int v7 = (void *)v10;
    }
  }
  else
  {
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke_2;
  v13[3] = &unk_1E6D78D48;
  v13[4] = self;
  id v14 = v7;
  v12.receiver = self;
  v12.super_class = (Class)BrowserRootViewController;
  id v11 = v7;
  [(BrowserRootViewController *)&v12 dismissViewControllerAnimated:v4 completion:v13];
}

- (void)_setShowingFloatingSidebarButton:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3;
  [(UIButton *)self->_floatingSidebarButton setHidden:v5];
  [(UIView *)self->_sidebarButtonEmbeddedInUnifiedBar setHidden:v3];
  [(UIButton *)self->_sidebarButtonEmbeddedInSidebar setAlpha:(double)v5];
  [(UIButton *)self->_sidebarButtonEmbeddedInSidebar setEnabled:v5];
  uint64_t v6 = v3 | [(BrowserRootViewController *)self _isShowingEmbeddedSidebar];
  int v7 = [(CatalogViewController *)self->_catalogViewController sidebarButton];
  [v7 setHidden:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  id v12 = [WeakRetained toolbar];

  [v12 setBarButton:4 hidden:v6];
  id v9 = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v10 = [v9 sidebarUIProxy];

  if ([v10 isShowingSidebar]) {
    BOOL v11 = [v10 sidebarStyle] == 1;
  }
  else {
    BOOL v11 = 1;
  }
  [v12 setShouldReserveSpaceForSidebarButton:v11];
  [(BrowserRootViewController *)self _updateTabSwitcherSidebarToggle];
}

- (BOOL)isShowingSidebar
{
  return self->_showingSidebar;
}

- (void)_updateTabSwitcherSidebarToggle
{
  floatingSidebarButton = self->_floatingSidebarButton;
  if (floatingSidebarButton) {
    double v4 = (double)[(UIButton *)floatingSidebarButton isHidden];
  }
  else {
    double v4 = 1.0;
  }
  if ([(BrowserRootViewController *)self _isShowingEmbeddedSidebar]) {
    uint64_t IsPad = 0;
  }
  else {
    uint64_t IsPad = _SFDeviceIsPad();
  }
  [(TabSwitcherViewController *)self->_tabSwitcherViewController setShowsSidebarToggle:IsPad];
  id v7 = [(TabSwitcherViewController *)self->_tabSwitcherViewController sidebarToggleBarButtonItem];
  uint64_t v6 = [v7 view];
  [v6 setAlpha:v4];
}

- (BOOL)_isShowingEmbeddedSidebar
{
  return self->_showingSidebar && self->_sidebarStyle == 0;
}

- (BOOL)isShowingPrivateBrowsingExplanationSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  BOOL v3 = [WeakRetained view];
  double v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isShowingDefaultBrowserSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultBrowserSheet);
  BOOL v3 = [WeakRetained view];
  double v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (int64_t)bookmarksPresentationStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = [(BrowserRootViewController *)self view];
  [v4 bounds];
  int64_t v7 = objc_msgSend(WeakRetained, "bookmarksPresentationStyleForViewOfSize:", v5, v6);

  return v7;
}

- (SFScreenTimeOverlayViewController)screenTimeOverlayViewController
{
  return self->_screenTimeOverlayViewController;
}

- (void)capsuleNavigationBarViewController:(id)a3 didCreateNavigationBar:(id)a4
{
  p_browserController = &self->_browserController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  double v6 = [WeakRetained barManager];
  int64_t v7 = [[CapsuleNavigationBarRegistration alloc] initWithBar:v5 barManager:v6];
  [v6 registerBar:v5 withToken:v7];
  [v5 setDelegate:WeakRetained];
}

- (void)setTabThumbnailCollectionView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if (WeakRetained != obj)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = WeakRetained;
      [v5 willMoveToParentViewController:0];
      [v5 removeFromParentViewController];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      contentContainerViewController = self->_contentContainerViewController;
      id v7 = obj;
      [(UIViewController *)contentContainerViewController addChildViewController:v7];
      [v7 didMoveToParentViewController:self->_contentContainerViewController];
    }
    [(CapsuleNavigationBarViewController *)self->_capsuleViewController willTransitionFromTabView:WeakRetained toTabView:obj];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [obj setThemeProvider:self];
    }
    objc_storeWeak((id *)&self->_tabThumbnailCollectionView, obj);
    [(BrowserRootViewController *)self _layOutTabView];
  }
}

- (BrowserRootViewController)initWithBrowserController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BrowserRootViewController;
  id v5 = [(BrowserRootViewController *)&v13 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserController, v4);
    uint64_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    app = v6->_app;
    v6->_app = (UIApplication *)v7;

    *(_OWORD *)&v6->_horizontalScrollIndicatorBaseInsets.CGFloat top = *(_OWORD *)invalidScrollViewInsets;
    *(_OWORD *)&v6->_horizontalScrollIndicatorBaseInsets.double bottom = *(_OWORD *)&invalidScrollViewInsets[16];
    *(_OWORD *)&v6->_verticalScrollIndicatorBaseInsets.CGFloat top = *(_OWORD *)invalidScrollViewInsets;
    *(_OWORD *)&v6->_verticalScrollIndicatorBaseInsets.double bottom = *(_OWORD *)&invalidScrollViewInsets[16];
    id v9 = objc_alloc_init(TabBarManager);
    tabBarManager = v6->_tabBarManager;
    v6->_tabBarManager = v9;

    [(BrowserRootViewController *)v6 updateSuppressesStandaloneTabBar];
    [(BrowserRootViewController *)v6 _registerLayoutStateUpdateHandler];
    [(BrowserRootViewController *)v6 _logCurrentLayoutState];
    BOOL v11 = v6;
  }

  return v6;
}

- (void)_setUpFloatingSidebarButton
{
  id v16 = +[FeatureManager sharedFeatureManager];
  if ([v16 isFloatingSidebarButtonEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v4 = [WeakRetained makeSidebarButton];
    sidebarButtonEmbeddedInSidebar = self->_sidebarButtonEmbeddedInSidebar;
    self->_sidebarButtonEmbeddedInSidebar = v4;

    [(UIButton *)self->_sidebarButtonEmbeddedInSidebar setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_bookmarkMenu");
    [(UIButton *)self->_sidebarButtonEmbeddedInSidebar setMenu:v6];

    [(UIButton *)self->_sidebarButtonEmbeddedInSidebar intrinsicContentSize];
    double v8 = fmax(44.0 - v7, 0.0) * -0.5;
    double v10 = fmax(44.0 - v9, 0.0) * -0.5;
    -[UIButton _setTouchInsets:](self->_sidebarButtonEmbeddedInSidebar, "_setTouchInsets:", v8, v10, v8, v10);
    BOOL v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_sidebarButtonEmbeddedInSidebar];
    sidebarButtonItem = self->_sidebarButtonItem;
    self->_sidebarButtonItem = v11;

    objc_super v13 = _SFAccessibilityIdentifierForBarItem();
    [(UIBarButtonItem *)self->_sidebarButtonItem setAccessibilityIdentifier:v13];

    id v14 = [WeakRetained makeSidebarButton];
    floatingSidebarButton = self->_floatingSidebarButton;
    self->_floatingSidebarButton = v14;

    [(UIButton *)self->_floatingSidebarButton setHidden:1];
    [(UIButton *)self->_floatingSidebarButton sf_applyContentSizeCategoryLimitsForToolbarButton];
    [(ViewWithCustomNextResponder *)self->_contentContainerView addSubview:self->_floatingSidebarButton];
  }
}

- (void)_registerLayoutStateUpdateHandler
{
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x1E4F97E90];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__BrowserRootViewController__registerLayoutStateUpdateHandler__block_invoke;
  v6[3] = &unk_1E6D7A350;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 registeredStateCollectorWithLogLabel:@"MobileSafari Layout State" payloadProvider:v6];
  stateCollector = self->_stateCollector;
  self->_stateCollector = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_logCurrentLayoutState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int IsPad = _SFDeviceIsPad();
  BOOL v3 = WBS_LOG_CHANNEL_PREFIXLayout();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (IsPad)
  {
    if (!v4) {
      return;
    }
    id v5 = v3;
    double v6 = stringForCurrentTabBarLayoutPreference();
    int v8 = 138543362;
    double v9 = v6;
    id v7 = "Current Tab Bar Layout: %{public}@";
  }
  else
  {
    if (!v4) {
      return;
    }
    id v5 = v3;
    double v6 = stringForCurrentCapsuleLayoutPreference();
    int v8 = 138543362;
    double v9 = v6;
    id v7 = "Current Capsule Layout: %{public}@";
  }
  _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);
}

void __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1672));
  [WeakRetained updateFirstResponderOrFocus];
}

- (void)setCatalogViewController:(id)a3
{
  id v5 = (CatalogViewController *)a3;
  p_catalogViewController = &self->_catalogViewController;
  catalogViewController = self->_catalogViewController;
  if (catalogViewController != v5)
  {
    double v9 = v5;
    if (catalogViewController)
    {
      [(CatalogViewController *)catalogViewController setStartPageScrollObserver:0];
      [(CatalogViewController *)*p_catalogViewController willMoveToParentViewController:0];
      [(CatalogViewController *)*p_catalogViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_catalogViewController, a3);
    self->_willDismissCatalogViewController = 0;
    if (*p_catalogViewController)
    {
      -[UIViewController addChildViewController:](self->_documentAndTopBarsContainerViewController, "addChildViewController:");
      [(CatalogViewController *)*p_catalogViewController didMoveToParentViewController:self->_documentAndTopBarsContainerViewController];
      int v8 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      [(CatalogViewController *)*p_catalogViewController setStartPageScrollObserver:v8];

      [(CatalogViewController *)*p_catalogViewController reloadNavigationItemAnimated:0];
    }
    -[BrowserRootViewController setNeedsPreferredStatusBarUpdateAfterCommitAnimated:](self, "setNeedsPreferredStatusBarUpdateAfterCommitAnimated:", [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
    id v5 = v9;
  }
}

- (void)setSidebarUIProxyDelegate:(id)a3
{
}

- (id)createToolbarForCapsuleNavigationBarViewController:(id)a3
{
  BOOL v4 = [[BrowserToolbar alloc] initWithPlacement:1 hideBackground:1];
  [(BrowserToolbar *)v4 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewController:self didCreateToolbar:v4];

  return v4;
}

- (BOOL)becomeFirstResponder
{
  if (![(BrowserRootViewController *)self canBecomeFirstResponder]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained becomeFirstResponder])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BrowserRootViewController;
    BOOL v4 = [(BrowserRootViewController *)&v6 becomeFirstResponder];
  }

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  if (!self->_canBecomeFirstResponder) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained canBecomeFirstResponder])
  {
    BOOL v4 = [(BrowserRootViewController *)self presentedViewController];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setToolbarPlacement:(int64_t)a3
{
  int64_t toolbarPlacement = self->_toolbarPlacement;
  if (self->_bottomToolbar)
  {
    if (toolbarPlacement == a3) {
      return;
    }
  }
  else if (toolbarPlacement == a3 {
         && (self->_capsuleViewController || [(_SFNavigationBar *)self->_navigationBar hasToolbar]))
  }
  {
    return;
  }
  self->_int64_t toolbarPlacement = a3;
  objc_super v6 = [(BrowserRootViewController *)self view];
  [v6 setNeedsLayout];

  [(BrowserRootViewController *)self _updateToolbarForToolbarPlacementAllowingRemoval:!self->_isPerformingSizeTransition];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewControllerDidChangeToolbarPlacement:self];
}

- (void)_updateToolbarForToolbarPlacementAllowingRemoval:(BOOL)a3
{
  BOOL v3 = a3;
  -[BrowserRootViewController _updateTopBarAllowingRemoval:](self, "_updateTopBarAllowingRemoval:");
  if (self->_toolbarPlacement == 1)
  {
    [(BrowserRootViewController *)self _createBottomToolbarIfNeeded];
    if (!self->_showBarsFromBottomBarRecognizer)
    {
      BOOL v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__showBarsFromBottomBarTap_];
      showBarsFromBottomBarRecognizer = self->_showBarsFromBottomBarRecognizer;
      self->_showBarsFromBottomBarRecognizer = v5;

      [(UITapGestureRecognizer *)self->_showBarsFromBottomBarRecognizer setDelegate:self];
      [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView addGestureRecognizer:self->_showBarsFromBottomBarRecognizer];
    }
  }
  else
  {
    [(_SFNavigationBar *)self->_navigationBar setHasToolbar:1];
    capsuleViewController = self->_capsuleViewController;
    if (capsuleViewController) {
      BOOL v8 = !v3;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      [(CapsuleNavigationBarViewController *)capsuleViewController willMoveToParentViewController:0];
      double v9 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
      [v9 removeFromSuperview];

      uint64_t v10 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      BOOL v11 = [v10 minimizedProgressView];
      [v11 removeFromSuperview];

      [(CapsuleNavigationBarViewController *)self->_capsuleViewController removeFromParentViewController];
      id v12 = self->_capsuleViewController;
      self->_capsuleViewController = 0;

      [(SFThemeColorEffectView *)self->_topBackdrop removeFromSuperview];
      topBackdrop = self->_topBackdrop;
      self->_topBackdrop = 0;
    }
    bottomToolbar = self->_bottomToolbar;
    if (bottomToolbar) {
      BOOL v15 = !v3;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      [(BrowserToolbar *)bottomToolbar removeFromSuperview];
      id v16 = self->_bottomToolbar;
      self->_bottomToolbar = 0;
    }
    if (self->_showBarsFromBottomBarRecognizer)
    {
      -[SFOrderedContainerView removeGestureRecognizer:](self->_documentAndTopBarsContainerView, "removeGestureRecognizer:");
      uint64_t v17 = self->_showBarsFromBottomBarRecognizer;
      self->_showBarsFromBottomBarRecognizer = 0;
    }
  }
  [(BrowserRootViewController *)self updateUsesLockdownStatusBar];
  catalogViewController = self->_catalogViewController;
  [(CatalogViewController *)catalogViewController updateStartPageTopSpacing];
}

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
  if (![(BrowserRootViewController *)self usingLoweredBar])
  {
    uint64_t v4 = [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator targetState];
    [(_SFNavigationBar *)self->_navigationBar setUnifiedFieldShowsProgressView:v4 != 0];
    BOOL v5 = [(BrowserRootViewController *)self view];
    [v5 setNeedsLayout];

    [(BrowserRootViewController *)self _setAvoidanceInsetsNeedsUpdate];
    if (v4) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = [(BrowserRootViewController *)self _interfaceFillsScreen];
    }
    [(BrowserRootViewController *)self setBarStateAllowsHidingHomeIndicator:v6];
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"showingSidebar"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___BrowserRootViewController;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)dealloc
{
  BOOL v3 = [(BrowserRootViewController *)self view];
  if (objc_opt_respondsToSelector()) {
    [v3 _removeBoundingPathChangeObserver:self];
  }

  v4.receiver = self;
  v4.super_class = (Class)BrowserRootViewController;
  [(BrowserRootViewController *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Sidebar is unparented, but is still in the view hierarchy with parent view %{public}@, removing the sidebar from the view hierarchy before discarding.", (uint8_t *)&v2, 0xCu);
}

- (void)setBookmarksBar:(id)a3
{
  unsigned __int8 v5 = (BookmarksBarView *)a3;
  p_bookmarksBar = &self->_bookmarksBar;
  if (self->_bookmarksBar != v5)
  {
    id v12 = v5;
    objc_super v7 = [(BrowserRootViewController *)self view];
    [v7 setNeedsLayout];

    BOOL v8 = [MEMORY[0x1E4F78290] sharedFeatureManager];
    char v9 = [v8 showRectangularTabsInSeparateBar];

    if (v9)
    {
      if (*p_bookmarksBar)
      {
        -[BarContainerView unregisterBarView:](self->_topAuxiliaryBarsContainerView, "unregisterBarView:");
        uint64_t v10 = *p_bookmarksBar;
      }
      else
      {
        uint64_t v10 = 0;
      }
      [(BookmarksBarView *)v10 removeFromSuperview];
      objc_storeStrong((id *)&self->_bookmarksBar, a3);
      unsigned __int8 v5 = v12;
      if (!*p_bookmarksBar) {
        goto LABEL_10;
      }
      -[BarContainerView registerBarView:](self->_topAuxiliaryBarsContainerView, "registerBarView:");
      [(BarContainerView *)self->_topAuxiliaryBarsContainerView addSubview:*p_bookmarksBar];
      [(BrowserRootViewController *)self _updateTopBarStyles];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      [WeakRetained updateDynamicBarGeometry];
    }
    else
    {
      objc_storeStrong((id *)&self->_bookmarksBar, a3);
      [(TabBarManager *)self->_tabBarManager setBookmarksBar:v12];
      [(BrowserRootViewController *)self _updateTopBarStyles];
    }
    unsigned __int8 v5 = v12;
  }
LABEL_10:
}

- (void)setShowingTabBar:(BOOL)a3
{
  if (self->_showingTabBar != a3)
  {
    self->_BOOL showingTabBar = a3;
    BOOL v4 = !a3;
    unsigned __int8 v5 = [(TabBarManager *)self->_tabBarManager standaloneTabBar];
    [v5 setContentHidden:v4];

    [(UnifiedBar *)self->_unifiedBar setNeedsLayout];
    id v6 = [(BrowserRootViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)willToggleTabBar
{
  self->_togglingTabBar = 1;
}

- (void)didToggleTabBar
{
  self->_togglingTabBar = 0;
}

- (_SFBarCommon)primaryBar
{
  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    uint64_t v3 = 1584;
  }
  else
  {
    [(BrowserRootViewController *)self _updateToolbarPlacementIfNeeded];
    if ([(BrowserRootViewController *)self usingLoweredBar])
    {
      BOOL v4 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
      unsigned __int8 v5 = [v4 toolbar];

      if (v5)
      {
        id v6 = v5;
      }
      else
      {
        id v6 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController selectedItemNavigationBar];
      }
      id v8 = v6;

      goto LABEL_13;
    }
    if (self->_toolbarPlacement) {
      objc_super v7 = &OBJC_IVAR___BrowserRootViewController__bottomToolbar;
    }
    else {
      objc_super v7 = &OBJC_IVAR___BrowserRootViewController__navigationBar;
    }
    uint64_t v3 = *v7;
  }
  id v8 = *(id *)((char *)&self->super.super.super.isa + v3);
LABEL_13:
  return (_SFBarCommon *)v8;
}

- (_SFNavigationBarCommon)primaryNavigationBar
{
  if ([(BrowserRootViewController *)self usingLoweredBar])
  {
    id v3 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController selectedItemNavigationBar];
  }
  else
  {
    unifiedBar = self->_unifiedBar;
    if (!unifiedBar) {
      unifiedBar = self->_navigationBar;
    }
    id v3 = unifiedBar;
  }
  return (_SFNavigationBarCommon *)v3;
}

- (NSArray)bars
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    v14[0] = self->_unifiedBar;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    p_navigationBar = (NavigationBar **)v14;
LABEL_8:
    uint64_t v10 = 1;
    goto LABEL_9;
  }
  if ([(BrowserRootViewController *)self usingLoweredBar])
  {
    unsigned __int8 v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController selectedItemNavigationBar];
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v6);

    objc_super v7 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    id v8 = [v7 toolbar];
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v8);

    goto LABEL_10;
  }
  if (self->_toolbarPlacement != 1)
  {
    navigationBar = self->_navigationBar;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    p_navigationBar = &navigationBar;
    goto LABEL_8;
  }
  bottomToolbar = self->_bottomToolbar;
  v13[0] = self->_navigationBar;
  v13[1] = bottomToolbar;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  p_navigationBar = (NavigationBar **)v13;
  uint64_t v10 = 2;
LABEL_9:
  unsigned __int8 v5 = [v3 arrayWithObjects:p_navigationBar count:v10];
LABEL_10:
  return (NSArray *)v5;
}

uint64_t __59__BrowserRootViewController__setTopBackdropTheme_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyTopBackdropTheme];
  int v2 = *(void **)(a1 + 32);
  return [v2 _applyStatusBarBackdropTheme];
}

uint64_t __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __59__BrowserRootViewController__setTopBackdropUsesPlainTheme___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setShowingSidebar:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (self->_showingSidebar == v4)
  {
    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
  else
  {
    id v8 = [(BrowserRootViewController *)self view];
    [v8 layoutIfNeeded];

    [(BrowserRootViewController *)self willChangeValueForKey:@"showingSidebar"];
    self->_BOOL showingSidebar = v4;
    [(BrowserRootViewController *)self didChangeValueForKey:@"showingSidebar"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserViewController:self didChangeShowingSidebar:self->_showingSidebar];
    }
    [(BrowserRootViewController *)self _updateSidebarStyle];
    if (!self->_sidebarViewController && self->_showingSidebar)
    {
      uint64_t v10 = objc_alloc_init(SidebarViewController);
      sidebarViewController = self->_sidebarViewController;
      self->_sidebarViewController = v10;

      id v12 = [(SidebarViewController *)self->_sidebarViewController view];
      int v13 = objc_msgSend(v12, "_sf_usesLeftToRightLayout");

      id v14 = [(BrowserRootViewController *)self view];
      [v14 safeAreaInsets];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      if (v13) {
        double v21 = v18;
      }
      else {
        double v21 = 0.0;
      }
      if (v13) {
        double v22 = 0.0;
      }
      else {
        double v22 = v20;
      }
      -[SidebarViewController setAdditionalSafeAreaInsets:](self->_sidebarViewController, "setAdditionalSafeAreaInsets:", v16, v21, 0.0, v22);
      id v23 = objc_loadWeakRetained((id *)&self->_sidebarUIProxyDelegate);
      if (objc_opt_respondsToSelector())
      {
        double v24 = [v23 sidebarContentViewControllerForSidebarUIProxy:self];
        [(SidebarViewController *)self->_sidebarViewController setContentViewController:v24];
      }
    }
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke;
    v50[3] = &unk_1E6D77E20;
    v50[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v50];
    [(BrowserRootViewController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    double v25 = [(CatalogViewController *)self->_catalogViewController view];
    [v25 layoutIfNeeded];

    [(BrowserRootViewController *)self _layOutFloatingSidebarButtonForSidebarShowing:!v4];
    if (self->_sidebarStyle == 1) {
      [(UnifiedBar *)self->_unifiedBar layoutIfNeeded];
    }
    CGFloat v26 = dispatch_group_create();
    ++self->_sidebarControllerActiveAnimationCount;
    uint64_t v27 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    [(BrowserRootViewController *)self setNeedsPreferredStatusBarUpdateAfterCommitAnimated:v27];
    double v28 = [(BrowserRootViewController *)self view];
    [v28 setNeedsLayout];

    double v29 = [(SidebarViewController *)self->_sidebarViewController view];
    CGRect v37 = WeakRetained;
    if (self->_sizeTransitionCount)
    {
      BOOL v30 = 0;
    }
    else
    {
      double v31 = [(_SFWebView *)self->_webView window];
      BOOL v30 = v31 != 0;
    }
    dispatch_group_enter(v26);
    double v32 = (void *)MEMORY[0x1E4FB1EB0];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_2;
    v48[3] = &unk_1E6D781E8;
    v48[4] = self;
    BOOL v49 = v30;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_4;
    v46[3] = &unk_1E6D7A168;
    v46[4] = self;
    double v33 = v26;
    CGFloat v47 = v33;
    objc_msgSend(v32, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", v27, 4, v48, v46);
    dispatch_group_enter(v33);
    double v34 = (void *)MEMORY[0x1E4FB1EB0];
    double v43 = v33;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_5;
    v44[3] = &unk_1E6D781E8;
    v44[4] = self;
    BOOL v45 = v4;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_6;
    v42[3] = &unk_1E6D77C20;
    CGRect v35 = v33;
    objc_msgSend(v34, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", v27, 6, v44, v42);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_7;
    block[3] = &unk_1E6D7A2D8;
    BOOL v41 = v30;
    block[4] = self;
    id v39 = v29;
    id v40 = v7;
    id v36 = v29;
    dispatch_group_notify(v35, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareToShowSidebarViewControllerIfNeeded];
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1696) beginAnimatedSizeTransition];
  int v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = (void *)v2[206];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_3;
    v6[3] = &unk_1E6D77E20;
    void v6[4] = v2;
    [v3 _beginAnimatedResizeWithUpdates:v6];
  }
  else
  {
    BOOL v4 = [v2 view];
    [v4 layoutIfNeeded];
  }
  return +[Application postTestNotificationName:@"SidebarWillPresentNotification" object:*(void *)(a1 + 32)];
}

void __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1680) ignorePreviousLayoutSize];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

void __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1696) endAnimatedSizeTransition];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layOutFloatingSidebarButtonForSidebarShowing:*(unsigned __int8 *)(a1 + 40)];
}

void __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_6(uint64_t a1)
{
}

uint64_t __58__BrowserRootViewController_setShowingSidebar_completion___block_invoke_7(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1344);
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(*(void *)(a1 + 32) + 1648) _endAnimatedResize];
  }
  [*(id *)(a1 + 32) _destroySidebarContentDimmingViewIfNeeded];
  +[Application postTestNotificationName:@"SidebarDidPresentNotification" object:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 32);
  if (!v2[168])
  {
    [v2 _setShowingFloatingSidebarButton:0];
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(void *)(v3 + 1344) && !*(unsigned char *)(v3 + 1440))
    {
      [*(id *)(v3 + 1464) willMoveToParentViewController:0];
      [*(id *)(a1 + 40) removeFromSuperview];
      [*(id *)(*(void *)(a1 + 32) + 1464) removeFromParentViewController];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    unsigned __int8 v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (UIBarButtonItem)leadingSidebarButtonItem
{
  if ([(BrowserRootViewController *)self sidebarStyle])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(BrowserRootViewController *)self sidebarButtonItem];
  }
  return (UIBarButtonItem *)v3;
}

id __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained _continuousReadingViewController];
    int v4 = [v3 interceptsScrollToTopTap];

    if (v4)
    {
      unsigned __int8 v5 = [v2 _continuousReadingViewController];
      id v6 = [v5 view];
    }
    else
    {
      id v6 = [v2 scrollView];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __53__BrowserRootViewController_setNeedsScrollToTopView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained dynamicBarAnimator];
    uint64_t v3 = [v2 state];

    id WeakRetained = v5;
    if (!v3)
    {
      int v4 = [v5 browserController];
      [v4 showBars];

      id WeakRetained = v5;
    }
  }
}

- (void)_prepareToShowSidebarViewControllerIfNeeded
{
  if (self->_showingSidebar)
  {
    uint64_t v3 = [(SidebarViewController *)self->_sidebarViewController parentViewController];

    if (!v3)
    {
      id v7 = [(SidebarViewController *)self->_sidebarViewController view];
      [(UIViewController *)self->_contentContainerViewController addChildViewController:self->_sidebarViewController];
      int v4 = +[FeatureManager sharedFeatureManager];
      int v5 = [v4 isFloatingSidebarButtonEnabled];

      contentContainerView = self->_contentContainerView;
      if (v5) {
        [(ViewWithCustomNextResponder *)contentContainerView insertSubview:v7 belowSubview:self->_floatingSidebarButton];
      }
      else {
        [(ViewWithCustomNextResponder *)contentContainerView addSubview:v7];
      }
      [(SidebarViewController *)self->_sidebarViewController didMoveToParentViewController:self->_contentContainerViewController];
      [(BrowserRootViewController *)self _frameForSidebarWhenShowing:0];
      objc_msgSend(v7, "setFrame:");
      [v7 layoutIfNeeded];
      [(SidebarContentDimmingView *)self->_sidebarContentDimmingView setPassthroughView:v7];
    }
  }
}

- (void)setDocumentSafeAreaInsetsFrozen:(BOOL)a3
{
  if (self->_documentSafeAreaInsetsFrozen != a3)
  {
    BOOL v3 = a3;
    self->_documentSafeAreaInsetsFrozen = a3;
    -[SFOrderedContainerView _setSafeAreaInsetsFrozen:](self->_documentAndTopBarsContainerView, "_setSafeAreaInsetsFrozen:");
    setSafeAreaInsetsFrozenRecursively(self, v3);
  }
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)BrowserRootViewController;
  id v5 = a3;
  [(BrowserRootViewController *)&v6 removeChildViewController:v5 notifyDidMove:v4];
  objc_msgSend(v5, "_setIgnoresWrapperViewForContentOverlayInsets:", 0, v6.receiver, v6.super_class);
}

- (id)_multitaskingDragExclusionRects
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (![(_SFDynamicBarAnimator *)self->_dynamicBarAnimator state]) {
    goto LABEL_5;
  }
  id v3 = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  if ([v3 presentationState] == 1)
  {

LABEL_5:
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_6;
  }
  uint64_t v4 = [v3 presentationState];

  if (v4 == 2) {
    goto LABEL_5;
  }
  if ([(BrowserRootViewController *)self usingUnifiedBar])
  {
    unifiedBar = self->_unifiedBar;
    [(UnifiedBar *)unifiedBar bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(BrowserRootViewController *)self view];
    -[UnifiedBar convertRect:toView:](unifiedBar, "convertRect:toView:", v16, v9, v11, v13, v15);
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;

    v47[0] = v18;
    v47[1] = v20;
    v47[2] = v22;
    v47[3] = v24;
    double v25 = [MEMORY[0x1E4F29238] valueWithBytes:v47 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v48[0] = v25;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  }
  else
  {
    CGFloat v26 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v43 = 0;
    double v44 = (CGFloat *)&v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    id v39 = __60__BrowserRootViewController__multitaskingDragExclusionRects__block_invoke;
    id v40 = &unk_1E6D7A328;
    long double v42 = &v43;
    id v27 = v26;
    id v41 = v27;
    double v28 = (void (**)(void, double, double, double, double))MEMORY[0x1E4E42950](&v37);
    double v29 = [(BrowserRootViewController *)self view];
    tabBar = self->_tabBar;
    if (tabBar && self->_showingTabBar)
    {
      [(TabBar *)self->_tabBar bounds];
      -[TabBar convertRect:toView:](tabBar, "convertRect:toView:", v29);
      double x = v50.origin.x;
      double y = v50.origin.y;
      double width = v50.size.width;
      double height = v50.size.height;
      v44[3] = CGRectGetMinY(v50);
      v28[2](v28, x, y, width, height);
    }
    [(_SFNavigationBar *)self->_navigationBar urlOutlineFrameRelativeToView:v29];
    ((void (*)(void (**)(void, double, double, double, double)))v28[2])(v28);
    if (!self->_toolbarPlacement
      && (![(_SFNavigationBar *)self->_navigationBar isExpanded]
       || ![(_SFNavigationBar *)self->_navigationBar usesNarrowLayout]))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      id v36 = [WeakRetained barManager];

      [v36 frameForBarItem:3 inCoordinateSpace:v29];
      ((void (*)(void (**)(void, double, double, double, double)))v28[2])(v28);
      [v36 frameForBarItem:7 inCoordinateSpace:v29];
      ((void (*)(void (**)(void, double, double, double, double)))v28[2])(v28);
    }
    id v5 = (void *)[v27 copy];

    _Block_object_dispose(&v43, 8);
  }
LABEL_6:
  return v5;
}

void __60__BrowserRootViewController__multitaskingDragExclusionRects__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&a2);
  double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (MaxY < v11)
  {
    v15.origin.double x = a2;
    v15.origin.double y = a3;
    v15.size.double width = a4;
    v15.size.double height = a5;
    a5 = v11 - CGRectGetMinY(v15);
  }
  double v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a2, a3, a4, a5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v12 addObject:v13];
}

- (UIEdgeInsets)_avoidanceInsets
{
  id v3 = [(BrowserRootViewController *)self view];
  uint64_t v4 = (double *)MEMORY[0x1E4FB2848];
  id v5 = [(BrowserRootViewController *)self topBar];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    CGRect v15 = [(BrowserRootViewController *)self view];
    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v15, v8, v10, v12, v14);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    v53.origin.double x = v17;
    v53.origin.double y = v19;
    v53.size.double width = v21;
    v53.size.double height = v23;
    CGFloat MaxY = CGRectGetMaxY(v53);
  }
  else
  {
    CGFloat MaxY = *v4;
  }
  double v25 = v4[1];
  double v26 = v4[3];
  id v27 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v27 obscuredInsetsForState:0];
  double v29 = v28;

  BOOL v30 = [(BrowserToolbar *)self->_bottomToolbar superview];

  if (v30)
  {
    [(BrowserToolbar *)self->_bottomToolbar frame];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    id v39 = [(BrowserToolbar *)self->_bottomToolbar superview];
    objc_msgSend(v3, "convertRect:fromView:", v39, v32, v34, v36, v38);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;

    [v3 bounds];
    double v48 = CGRectGetMaxY(v54);
    v55.origin.double x = v41;
    v55.origin.double y = v43;
    v55.size.double width = v45;
    v55.size.double height = v47;
    double v29 = fmax(v48 - CGRectGetMinY(v55), 0.0);
  }

  double v49 = MaxY;
  double v50 = v25;
  double v51 = v29;
  double v52 = v26;
  result.CGFloat right = v52;
  result.double bottom = v51;
  result.CGFloat left = v50;
  result.CGFloat top = v49;
  return result;
}

- (void)_updateAllowsHidingHomeIndicatorMinimized:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BrowserRootViewController *)self usingLoweredBar])
  {
    id v5 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    uint64_t v6 = [v5 layoutStyle];

    BOOL v8 = v6 == 2 && v3 && [(BrowserRootViewController *)self _interfaceFillsScreen];
    [(BrowserRootViewController *)self setBarStateAllowsHidingHomeIndicator:v8];
  }
}

- (void)setBarStateAllowsHidingHomeIndicator:(BOOL)a3
{
  if (self->_barStateAllowsHidingHomeIndicator != a3)
  {
    self->_barStateAllowsHidingHomeIndicator = a3;
    [(BrowserRootViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

- (void)setInYttriumState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F97EA0] isWAPEnabled] && self->_inYttriumState != v3)
  {
    self->_BOOL inYttriumState = v3;
    id v5 = [(BrowserRootViewController *)self _activeTabDocumentView];
    [v5 setInteractionHintPresented:v3 ^ 1 animated:1];

    if ([(BrowserRootViewController *)self _shouldInterceptBottomGesture])
    {
      uint64_t v6 = [(BrowserRootViewController *)self _continuousReadingViewController];
      double v7 = [v6 view];

      [v7 bounds];
      double Height = CGRectGetHeight(v13);
      [v7 bounds];
      double v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, Height + -44.0, CGRectGetWidth(v14), 44.0);
      bottomContentGestureBlocker = self->_bottomContentGestureBlocker;
      self->_bottomContentGestureBlocker = v9;

      [(UIView *)self->_bottomContentGestureBlocker setAutoresizingMask:8];
      [v7 addSubview:self->_bottomContentGestureBlocker];
    }
    else
    {
      [(UIView *)self->_bottomContentGestureBlocker removeFromSuperview];
      double v7 = self->_bottomContentGestureBlocker;
      self->_bottomContentGestureBlocker = 0;
    }

    double v11 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
    [v11 setForceHidden:v3];

    [(CapsuleNavigationBarViewController *)self->_capsuleViewController transitionToState:v3 animated:1 completionHandler:0];
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:v3 ^ 1 animated:1];
    [(BrowserRootViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
    [(BrowserRootViewController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    [(BrowserRootViewController *)self _updateTopBarStyles];
    [(BrowserRootViewController *)self _updateScrollToTopOverride];
  }
}

- (void)_updateScrollToTopOverride
{
  if (self->_inYttriumState)
  {
    if (_SFDeviceIsPad() & 1) != 0 || (_SFDeviceHasHomeButton()) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [(BrowserRootViewController *)self isUsingBottomCapsule] ^ 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BrowserRootViewController *)self _continuousReadingViewController];
  [v4 setInterceptsScrollToTopTap:v3];
}

- (void)_updateThemeForBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([v8 shouldUsePlainTheme])
  {
    objc_msgSend(MEMORY[0x1E4F781D8], "themeWithBarTintStyle:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"));
    uint64_t v6 = (SFBannerTheme *)objc_claimAutoreleasedReturnValue();
    double v7 = [(BrowserRootViewController *)self _plainTopBackdropGroupName];
    [(SFBannerTheme *)v6 setBackdropGroupName:v7];
  }
  else
  {
    uint64_t v6 = self->_bannerTheme;
  }
  [v8 setTheme:v6 animated:v4];
}

- (id)_plainTopBackdropGroupName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Safari.PlainTopBackdrop.%p", self);
}

- (UIEdgeInsets)_loweredBarObscuredInsets
{
  id v2 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v2 obscuredInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.CGFloat right = v14;
  result.double bottom = v13;
  result.CGFloat left = v12;
  result.CGFloat top = v11;
  return result;
}

id __62__BrowserRootViewController__registerLayoutStateUpdateHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (_SFDeviceIsPad())
    {
      double v3 = stringForCurrentTabBarLayoutPreference();
      double v4 = @"Tab Bar Layout";
    }
    else
    {
      double v3 = stringForCurrentCapsuleLayoutPreference();
      double v4 = @"Capsule Layout";
    }
    [v2 setObject:v3 forKeyedSubscript:v4];

    double v5 = (void *)[v2 copy];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)showDefaultBrowserSheetWithDisplayHandler:(id)a3
{
  double v4 = (void (**)(id, void))a3;
  if ([(BrowserRootViewController *)self isShowingDefaultBrowserSheet]
    || ([(BrowserRootViewController *)self view],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 window],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v4[2](v4, 0);
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F3AE88]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__BrowserRootViewController_showDefaultBrowserSheetWithDisplayHandler___block_invoke;
    v11[3] = &unk_1E6D784D8;
    v11[4] = self;
    double v12 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__BrowserRootViewController_showDefaultBrowserSheetWithDisplayHandler___block_invoke_2;
    v10[3] = &unk_1E6D7A378;
    void v10[4] = self;
    double v8 = (SFDefaultBrowserViewController *)[v7 initWithViewDidBecomeReady:v11 completion:v10];
    defaultBrowserViewController = self->_defaultBrowserViewController;
    self->_defaultBrowserViewController = v8;
  }
}

uint64_t __71__BrowserRootViewController_showDefaultBrowserSheetWithDisplayHandler___block_invoke(uint64_t a1, int a2)
{
  double v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 _showWelcomeBrowsingExplanationSheet];
  }
  else {
    [v3 dismissDefaultBrowserSheet];
  }
  double v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t __71__BrowserRootViewController_showDefaultBrowserSheetWithDisplayHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) dismissDefaultBrowserSheetForOtherWindows];
  if ((unint64_t)(a2 - 1) <= 1)
  {
    double v5 = *(void **)(a1 + 32);
    return [v5 dismissDefaultBrowserSheet];
  }
  return result;
}

- (void)dismissDefaultBrowserSheetForOtherWindows
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = [WeakRetained browserWindowController];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = objc_msgSend(v4, "browserControllers", 0);
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
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v11 = [v10 rootViewController];

        if (v11 != self)
        {
          double v12 = [v10 rootViewController];
          [v12 dismissDefaultBrowserSheet];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)dismissDefaultBrowserSheet
{
  p_defaultBrowserSheet = &self->_defaultBrowserSheet;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultBrowserSheet);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  objc_storeWeak((id *)p_defaultBrowserSheet, 0);
  defaultBrowserViewController = self->_defaultBrowserViewController;
  self->_defaultBrowserViewController = 0;
}

- (void)showLockedPrivateBrowsingView
{
  if (![(BrowserRootViewController *)self isShowingLockedPrivateBrowsingView])
  {
    if (SFEnhancedTabOverviewEnabled())
    {
      double v3 = self->_tabSwitcherViewController;
      if ([(TabSwitcherViewController *)v3 presentationState] == 1)
      {
      }
      else
      {
        uint64_t v11 = [(TabSwitcherViewController *)v3 presentationState];

        if (v11 != 2) {
          [(TabSwitcherViewController *)self->_tabSwitcherViewController setDismissesOnUnlock:1];
        }
      }
      tabSwitcherViewController = self->_tabSwitcherViewController;
      [(TabSwitcherViewController *)tabSwitcherViewController presentAnimated:0];
    }
    else
    {
      double v4 = [(BrowserRootViewController *)self view];
      double v5 = [SFLockedPrivateBrowsingView alloc];
      [v4 bounds];
      uint64_t v6 = -[SFLockedPrivateBrowsingView initWithFrame:](v5, "initWithFrame:");
      lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
      self->_lockedPrivateBrowsingView = v6;

      [(SFLockedPrivateBrowsingView *)self->_lockedPrivateBrowsingView setAutoresizingMask:18];
      [v4 addSubview:self->_lockedPrivateBrowsingView];
      [(ViewWithCustomNextResponder *)self->_contentContainerView setHidden:1];
      uint64_t v8 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
      [v8 setHidden:1];

      objc_initWeak(&location, self);
      double v9 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      long long v15 = __58__BrowserRootViewController_showLockedPrivateBrowsingView__block_invoke;
      long long v16 = &unk_1E6D78C18;
      objc_copyWeak(&v17, &location);
      double v10 = [v9 actionWithHandler:&v13];
      -[SFLockedPrivateBrowsingView setUnlockAction:](self->_lockedPrivateBrowsingView, "setUnlockAction:", v10, v13, v14, v15, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

void __58__BrowserRootViewController_showLockedPrivateBrowsingView__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 209);
    [v2 authenticateToUnlockPrivateBrowsing];

    id WeakRetained = v3;
  }
}

- (void)hideLockedPrivateBrowsingView
{
  if (![(BrowserRootViewController *)self isShowingLockedPrivateBrowsingView]) {
    return;
  }
  if (!SFEnhancedTabOverviewEnabled())
  {
    [(SFLockedPrivateBrowsingView *)self->_lockedPrivateBrowsingView removeFromSuperview];
    lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
    self->_lockedPrivateBrowsingView = 0;

    [(ViewWithCustomNextResponder *)self->_contentContainerView setHidden:0];
    id WeakRetained = [(CapsuleNavigationBarViewController *)self->_capsuleViewController view];
    [WeakRetained setHidden:0];
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (![(TabSwitcherViewController *)self->_tabSwitcherViewController dismissesOnUnlock])
  {
LABEL_8:
    double v4 = WeakRetained;
    goto LABEL_9;
  }
  int v3 = [WeakRetained isPrivateBrowsingEnabled];
  double v4 = WeakRetained;
  if (v3)
  {
    tabSwitcherViewController = self->_tabSwitcherViewController;
    uint64_t v6 = [WeakRetained scene];
    -[TabSwitcherViewController dismissForUnlockingAnimated:](tabSwitcherViewController, "dismissForUnlockingAnimated:", (unint64_t)[v6 activationState] < 2);

    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)isShowingLockedPrivateBrowsingView
{
  if ((SFTabGroupSwitcherEnabled() & 1) == 0 && !SFEnhancedTabOverviewEnabled()) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = [WeakRetained tabCollectionViewProvider];
  double v5 = [v4 tabThumbnailCollectionView];
  if ([v5 presentationState] == 1)
  {

    BOOL v6 = 1;
LABEL_9:

    return v6;
  }
  uint64_t v7 = [v5 presentationState];

  if (v7 != 2)
  {
LABEL_7:
    lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
    if (!lockedPrivateBrowsingView) {
      return 0;
    }
    id WeakRetained = [(SFLockedPrivateBrowsingView *)lockedPrivateBrowsingView superview];
    BOOL v6 = WeakRetained != 0;
    goto LABEL_9;
  }
  return 1;
}

- (void)showWhatsNewInPrivateBrowsingSheet
{
  if (![(BrowserRootViewController *)self isShowingPrivateBrowsingExplanationSheet])
  {
    int v3 = [(BrowserRootViewController *)self view];
    double v4 = [v3 window];

    if (v4)
    {
      double v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v5 setInteger:1 forKey:*MEMORY[0x1E4F993B0]];

      id v6 = [(BrowserRootViewController *)self _makeWhatsNewInPrivateBrowsingViewController];
      [(BrowserRootViewController *)self _showPrivateBrowsingExplanationSheetWithViewController:v6];
    }
  }
}

- (id)_makeWhatsNewInPrivateBrowsingViewController
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)getOBWelcomeControllerClass());
  int v3 = _WBSLocalizedString();
  double v4 = (void *)[v2 initWithTitle:v3 detailText:0 icon:0];

  double v5 = (void *)MEMORY[0x1E4F98D10];
  id v6 = [MEMORY[0x1E4F98D08] defaultConfiguration];
  uint64_t v7 = [v5 itemsForConfiguration:v6];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = [v13 title];
        long long v15 = [v13 message];
        long long v16 = [v13 image];
        id v17 = [MEMORY[0x1E4FB1618] labelColor];
        [v4 addBulletedListItemWithTitle:v14 description:v15 image:v16 tintColor:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  uint64_t v18 = [getOBBoldTrayButtonClass() boldButton];
  [v18 addTarget:self action:sel__pushTurnOnLockedPrivateBrowsingPromptIfNeeded];
  CGFloat v19 = _WBSLocalizedString();
  [v18 setTitle:v19 forState:0];

  double v20 = [v4 buttonTray];
  [v20 addButton:v18];

  return v4;
}

- (void)showTurnOnLockedPrivateBrowsingSheet
{
  if (![(BrowserRootViewController *)self isShowingPrivateBrowsingExplanationSheet])
  {
    int v3 = [(BrowserRootViewController *)self view];
    double v4 = [v3 window];

    if (v4)
    {
      double v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v5 setBool:1 forKey:*MEMORY[0x1E4F99150]];

      id v6 = [(BrowserRootViewController *)self _makeTurnOnLockedPrivateBrowsingViewController];
      [(BrowserRootViewController *)self _showPrivateBrowsingExplanationSheetWithViewController:v6];
    }
  }
}

- (void)_pushTurnOnLockedPrivateBrowsingPromptIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained shouldShowTurnOnLockedPrivateBrowsingSheet];

  if (v4)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v5 setBool:1 forKey:*MEMORY[0x1E4F99150]];

    id v7 = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
    id v6 = [(BrowserRootViewController *)self _makeTurnOnLockedPrivateBrowsingViewController];
    [v7 pushViewController:v6 animated:1];
  }
  else
  {
    [(BrowserRootViewController *)self _dismissPrivateBrowsingExplanationSheet];
  }
}

- (id)_makeTurnOnLockedPrivateBrowsingViewController
{
  int v3 = (void *)MEMORY[0x1E4F98D10];
  char v4 = [MEMORY[0x1E4F98D08] defaultConfiguration];
  double v5 = [v3 lockedPrivateBrowsingPromptForConfiguration:v4];

  id v6 = objc_alloc((Class)getOBWelcomeControllerClass());
  id v7 = [v5 title];
  id v8 = [v5 message];
  uint64_t v9 = [v5 image];
  uint64_t v10 = (void *)[v6 initWithTitle:v7 detailText:v8 icon:v9];

  uint64_t v11 = [MEMORY[0x1E4FB1618] labelColor];
  double v12 = [v10 headerView];
  [v12 setTintColor:v11];

  uint64_t v13 = [getOBBoldTrayButtonClass() boldButton];
  [v13 addTarget:self action:sel__turnOnLockedPrivateBrowsingFromSheet forControlEvents:0x2000];
  uint64_t v14 = _WBSLocalizedString();
  [v13 setTitle:v14 forState:0];

  long long v15 = [v10 buttonTray];
  [v15 addButton:v13];

  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2050000000;
  long long v16 = (void *)getOBLinkTrayButtonClass_softClass;
  uint64_t v27 = getOBLinkTrayButtonClass_softClass;
  if (!getOBLinkTrayButtonClass_softClass)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __getOBLinkTrayButtonClass_block_invoke;
    v23[3] = &unk_1E6D77CE0;
    v23[4] = &v24;
    __getOBLinkTrayButtonClass_block_invoke((uint64_t)v23);
    long long v16 = (void *)v25[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v24, 8);
  uint64_t v18 = [v17 linkButton];
  [v18 addTarget:self action:sel__dismissPrivateBrowsingExplanationSheet forControlEvents:0x2000];
  CGFloat v19 = _WBSLocalizedString();
  [v18 setTitle:v19 forState:0];

  double v20 = [MEMORY[0x1E4FB1618] labelColor];
  [v18 setTintColor:v20];

  CGFloat v21 = [v10 buttonTray];
  [v21 addButton:v18];

  return v10;
}

- (void)_turnOnLockedPrivateBrowsingFromSheet
{
  int v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 setBool:1 forKey:*MEMORY[0x1E4F993B8]];

  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__BrowserRootViewController__turnOnLockedPrivateBrowsingFromSheet__block_invoke;
  v5[3] = &unk_1E6D78630;
  objc_copyWeak(&v6, &location);
  [WeakRetained dismissViewControllerAnimated:1 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__BrowserRootViewController__turnOnLockedPrivateBrowsingFromSheet__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 209);
    [v2 authenticateToUnlockPrivateBrowsing];

    id WeakRetained = v3;
  }
}

- (void)_dismissPrivateBrowsingExplanationSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)_showWelcomeBrowsingExplanationSheet
{
  if (self->_defaultBrowserViewController)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_defaultBrowserViewController];
    [v3 setModalPresentationStyle:_SFDeviceIsPad()];
    [v3 setNavigationBarHidden:1];
    [v3 setModalInPresentation:1];
    [v3 setDelegate:self->_defaultBrowserViewController];
    objc_storeWeak((id *)&self->_defaultBrowserSheet, v3);
    char v4 = (void *)MEMORY[0x1E4FB1EC0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__BrowserRootViewController__showWelcomeBrowsingExplanationSheet__block_invoke;
    v6[3] = &unk_1E6D77D90;
    void v6[4] = self;
    id v7 = v3;
    id v5 = v3;
    [v4 _performWithoutDeferringTransitions:v6];
  }
}

uint64_t __65__BrowserRootViewController__showWelcomeBrowsingExplanationSheet__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
}

- (void)_showPrivateBrowsingExplanationSheetWithViewController:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithRootViewController:v5];

  [v6 setModalPresentationStyle:2];
  [v6 setNavigationBarHidden:1];
  [v6 setOverrideUserInterfaceStyle:2];
  id v7 = [v6 sheetPresentationController];
  [v7 setDelegate:self];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__BrowserRootViewController__showPrivateBrowsingExplanationSheetWithViewController___block_invoke;
  v8[3] = &unk_1E6D77E20;
  v8[4] = self;
  [(BrowserRootViewController *)self presentViewController:v6 animated:1 completion:v8];
  objc_storeWeak((id *)&self->_privateBrowsingExplanationSheet, v6);
}

void __84__BrowserRootViewController__showPrivateBrowsingExplanationSheetWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1672));
  [WeakRetained resetWhatsNewInPrivateBrowsingStartPageModule];
}

void __46__BrowserRootViewController__layOutTopBanners__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v9 = a2;
  id v5 = [*(id *)(a1 + 32) view];
  [v5 layoutMargins];
  objc_msgSend(v9, "setLayoutMargins:");

  id v6 = &OBJC_IVAR___BrowserRootViewController__scrollView;
  if (*(void *)(a1 + 40) > a3) {
    id v6 = &OBJC_IVAR___BrowserRootViewController__documentAndTopBarsContainerView;
  }
  [*(id *)(*(void *)(a1 + 32) + *v6) addSubview:v9];
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(v9, "sizeThatFits:", Width, 0.0);
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, Width, v8);
}

void __46__BrowserRootViewController__layOutTopBanners__block_invoke_148(uint64_t a1, void *a2, unint64_t a3)
{
  id v45 = a2;
  [v45 bounds];
  double v7 = v6;
  double v9 = v8;
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 8, *(void *)(*(void *)(a1 + 32) + 1656), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  double v13 = v11 + v12;
  double v16 = v14 + v15;
  if (*(void *)(a1 + 96) == a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 104)
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  double v17 = MinX + v11;
  double v18 = v7 - v13;
  double v19 = v9 - v16;
  int v20 = [v45 isPinnedToTop];
  double v21 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v20)
  {
    double v22 = [v45 pinnedOffset];

    if (v22)
    {
      double v23 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      double v24 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [*(id *)(*(void *)(a1 + 32) + 1656) contentOffset];
      double v26 = v25;
      uint64_t v27 = [v45 pinnedOffset];
      [v27 floatValue];
      double v21 = fmax(v23, v24 - fmax(v26 - v28, 0.0));

      double v29 = (void *)MEMORY[0x1E4F28ED0];
      [*(id *)(*(void *)(a1 + 32) + 1656) contentOffset];
      double v31 = v30;
      double v32 = [v45 pinnedOffset];
      [v32 floatValue];
      double v34 = objc_msgSend(v29, "numberWithDouble:", fmin(v31, v33));
      [v45 setPinnedOffset:v34];
    }
  }
  else if (v21 >= *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) {
         || *(double *)(a1 + 104) != 0.0 && *(void *)(a1 + 96) <= a3)
  }
  {
    double v21 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v35 = [v45 superview];
  objc_msgSend(v35, "convertRect:fromView:", *(void *)(*(void *)(a1 + 32) + 1656), v17, v21, v18, v19);
  objc_msgSend(v45, "setFrame:");

  v47.origin.double x = v17;
  v47.origin.double y = v21;
  v47.size.double width = v18;
  v47.size.double height = v19;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = fmax(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24), CGRectGetMaxY(v47));
  v48.origin.double x = v17;
  v48.origin.double y = v21;
  v48.size.double width = v18;
  v48.size.double height = v19;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetHeight(v48)
                                                               + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 24);
  v49.origin.double x = v17;
  v49.origin.double y = v21;
  v49.size.double width = v18;
  v49.size.double height = v19;
  double MaxY = CGRectGetMaxY(v49);
  [*(id *)(*(void *)(a1 + 32) + 1656) contentOffset];
  double v38 = v37;
  [*(id *)(a1 + 32) _loweredBarMinimumObscuredInsets];
  double v40 = v39;
  [*(id *)(*(void *)(a1 + 32) + 1656) safeAreaInsets];
  if (MaxY > v38 + fmax(v40, v41))
  {
    uint64_t v42 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v44 = *(void *)(v42 + 40);
    CGFloat v43 = (id *)(v42 + 40);
    if (!v44) {
      objc_storeStrong(v43, a2);
    }
  }
}

- (CGRect)_convertRect:(CGRect)a3 fromViewInDocumentContainer:(id)a4 toCoordinateSpace:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  id v13 = a4;
  double v14 = [(SFOrderedContainerView *)documentAndTopBarsContainerView superview];
  contentContainerView = self->_contentContainerView;

  if (v14 == contentContainerView)
  {
    objc_msgSend(v13, "convertRect:toCoordinateSpace:", v11, x, y, width, height);
    double v25 = v32;
    double v27 = v33;
    double v29 = v34;
    double v31 = v35;
  }
  else
  {
    objc_msgSend(v13, "convertRect:toView:", self->_documentAndTopBarsContainerView, x, y, width, height);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    -[BrowserRootViewController _convertDocumentCoordinateSpaceRect:toCoordinateSpace:](self, "_convertDocumentCoordinateSpaceRect:toCoordinateSpace:", v11, v17, v19, v21, v23);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
  }

  double v36 = v25;
  double v37 = v27;
  double v38 = v29;
  double v39 = v31;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (double)navigationBarSquishedHeight
{
  BOOL v3 = [(BrowserRootViewController *)self _interfaceFillsScreen];
  double result = 0.0;
  if (!v3)
  {
    if ([(BrowserRootViewController *)self usingUnifiedBar])
    {
      unifiedBar = self->_unifiedBar;
      [(SFUnifiedBar *)unifiedBar squishedHeight];
    }
    else if ([(BrowserRootViewController *)self usingLoweredBar])
    {
      [(BrowserRootViewController *)self _loweredBarMinimumObscuredInsets];
    }
    else
    {
      navigationBar = self->_navigationBar;
      [(_SFNavigationBar *)navigationBar minimumHeight];
    }
  }
  return result;
}

- (CGRect)_frameForNavigationBar
{
  if ([(BrowserRootViewController *)self _shouldHideUnifiedBar])
  {
    CGFloat MaxX = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    double Width = CGRectGetWidth(v24);
    double v4 = 0.0;
    CGFloat MaxX = 0.0;
    double v8 = 0.0;
    if (self->_showingSidebar && !self->_sidebarStyle)
    {
      [(BrowserRootViewController *)self _frameForSidebarWhenShowing:1];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      if ([(SFOrderedContainerView *)self->_documentAndTopBarsContainerView _sf_usesLeftToRightLayout])
      {
        v25.origin.double x = v10;
        v25.origin.double y = v12;
        v25.size.double width = v14;
        v25.size.double height = v16;
        CGFloat MaxX = CGRectGetMaxX(v25);
      }
      v26.origin.double x = v10;
      v26.origin.double y = v12;
      v26.size.double width = v14;
      v26.size.double height = v16;
      double v8 = CGRectGetWidth(v26);
    }
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator topBarHeight];
    double v6 = v17;
    if (![(BrowserRootViewController *)self insetsContentContainerFromStatusBar])
    {
      double v18 = [(BrowserRootViewController *)self view];
      [v18 safeAreaInsets];
      double v4 = v19;
    }
    if ([(BrowserRootViewController *)self usingLoweredBar]) {
      double v4 = -v6;
    }
    if ([(BrowserRootViewController *)self _interfaceFillsScreen])
    {
      [(BrowserRootViewController *)self navigationBarDesiredHeight];
      double v4 = v4 + v6 - v20;
      double v6 = v20;
    }
    double v5 = Width - v8;
  }
  double v21 = MaxX;
  double v22 = v4;
  double v23 = v6;
  result.size.double height = v23;
  result.size.double width = v5;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

uint64_t __58__BrowserRootViewController__updateTopBarAllowingRemoval___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1560), "setUsesNarrowLayout:", objc_msgSend(*(id *)(a1 + 40), "usesNarrowLayout"));
  id v2 = *(void **)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1560);
  uint64_t v4 = [v2 favoritesFieldShouldBeExpanded];
  return [v3 setExpanded:v4 completionHandler:0];
}

- (CGRect)_frameForBottomToolbarForceHidden:(BOOL)a3
{
  [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v14 = v13;
  v25.origin.double x = v6;
  v25.origin.double y = v8;
  v25.size.double width = v10;
  v25.size.double height = v12;
  double Height = CGRectGetHeight(v25);
  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  CGFloat Width = CGRectGetWidth(v26);
  if (self->_toolbarPlacement == 1 && !a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = [WeakRetained browserViewControllerShouldTemporarilyHideBottomToolbar:self];

    if ((v18 & 1) == 0)
    {
      [(BrowserRootViewController *)self _sf_bottomUnsafeAreaFrameForToolbar];
      double v19 = CGRectGetHeight(v27);
      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator bottomBarOffset];
      double Height = Height - (v14 + v19 - v20);
      if ([(BrowserRootViewController *)self _shouldPositionBottomToolbarAboveKeyboard])
      {
        double Height = Height - fmax(self->_bottomBarKeyboardOffset - v19, 0.0);
      }
    }
  }
  double v21 = 0.0;
  double v22 = Height;
  double v23 = Width;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (BOOL)_shouldPositionBottomToolbarAboveKeyboard
{
  id v2 = [(BrowserRootViewController *)self view];
  char v3 = objc_msgSend(v2, "_sf_isFullScreenWidth") ^ 1;

  return v3;
}

- (void)updateCapsuleLayoutStyle
{
  char v3 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  uint64_t v4 = [v3 preferredCapsuleLayoutStyle];
  double v5 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v5 setLayoutStyle:v4];

  [(CatalogViewController *)self->_catalogViewController reloadNavigationItemAnimated:0];
  [(BrowserRootViewController *)self _updateTopBarStyles];
  CGFloat v6 = [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView window];

  if (v6) {
    [(BrowserRootViewController *)self updateOrderedSubviewsForOrderedContainerView:self->_documentAndTopBarsContainerView];
  }
  id v7 = [(BrowserRootViewController *)self view];
  [v7 setNeedsLayout];
}

- (void)_layOutFloatingSidebarButtonForSidebarShowing:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[FeatureManager sharedFeatureManager];
  int v6 = [v5 isFloatingSidebarButtonEnabled];

  if (v6)
  {
    unsigned int v7 = [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator state] == 1
       ? [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator isTrackingDrag] ^ 1
       : 0;
    uint64_t v8 = self->_sidebarStyle ? 0 : v7;
    [(BrowserRootViewController *)self _setShowingFloatingSidebarButton:v8];
    if (v8 == 1)
    {
      *(void *)&rect.origin.CGFloat y = MEMORY[0x1E4F143A8];
      *(void *)&rect.size.CGFloat width = 3221225472;
      *(void *)&rect.size.CGFloat height = __75__BrowserRootViewController__layOutFloatingSidebarButtonForSidebarShowing___block_invoke;
      uint64_t v44 = &unk_1E6D7A3F0;
      id v45 = self;
      double v9 = (void (**)(void, void))MEMORY[0x1E4E42950](&rect.origin.y);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
      if (v3)
      {
        sidebarButtonEmbeddedInSidebar = self->_sidebarButtonEmbeddedInSidebar;
        [(UIButton *)sidebarButtonEmbeddedInSidebar bounds];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v20 = [(SidebarViewController *)self->_sidebarViewController view];
        -[UIButton convertRect:toView:](sidebarButtonEmbeddedInSidebar, "convertRect:toView:", v20, v13, v15, v17, v19);
        rect.origin.CGFloat x = v21;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;

        [(BrowserRootViewController *)self _frameForSidebarWhenShowing:1];
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat height = v46.size.height;
        CGFloat MinX = CGRectGetMinX(v46);
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        CGFloat MinY = CGRectGetMinY(v47);
        v48.origin.CGFloat x = rect.origin.x;
        v48.origin.CGFloat y = v23;
        v48.size.CGFloat width = v25;
        v48.size.CGFloat height = v27;
        CGRect v49 = CGRectOffset(v48, MinX, MinY);
        -[UIButton setFrame:](self->_floatingSidebarButton, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
        [(UIButton *)self->_floatingSidebarButton setTintColor:0];
LABEL_24:
        [(UIButton *)self->_floatingSidebarButton layoutIfNeeded];

        return;
      }
      if (SFEnhancedTabOverviewEnabled())
      {
        id v34 = WeakRetained;
        if ([v34 presentationState] == 1)
        {

          goto LABEL_15;
        }
        uint64_t v35 = [v34 presentationState];

        if (v35 == 2)
        {
LABEL_15:
          double v36 = [(TabSwitcherViewController *)self->_tabSwitcherViewController sidebarToggleBarButtonItem];
          double v37 = [v36 view];

          double v38 = [v37 subviews];
          double v39 = [v38 firstObject];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v40 = [v39 _imageView];
            ((void (**)(void, void *))v9)[2](v9, v40);
          }
          else
          {
            ((void (**)(void, void *))v9)[2](v9, v37);
          }
          goto LABEL_22;
        }
      }
      id v41 = WeakRetained;
      if ([v41 presentationState] == 1)
      {
      }
      else
      {
        uint64_t v42 = [v41 presentationState];

        if (v42 != 2)
        {
          if (![(BrowserRootViewController *)self _shouldHideUnifiedBar])
          {
            ((void (**)(void, UIView *))v9)[2](v9, self->_sidebarButtonEmbeddedInUnifiedBar);
            goto LABEL_24;
          }
          double v37 = [(CatalogViewController *)self->_catalogViewController sidebarButton];
          ((void (**)(void, void *))v9)[2](v9, v37);
          goto LABEL_23;
        }
      }
      double v37 = [v41 toolbar];
      [v37 rectForBarButton:4];
      objc_msgSend(v37, "convertRect:toView:", self->_contentContainerView);
      -[UIButton setFrame:](self->_floatingSidebarButton, "setFrame:");
      double v39 = [v37 resolvedTintColorForBarButton:4];
      [(UIButton *)self->_floatingSidebarButton setTintColor:v39];
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
  }
}

void __75__BrowserRootViewController__layOutFloatingSidebarButtonForSidebarShowing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bounds];
  objc_msgSend(v3, "convertRect:toView:", *(void *)(*(void *)(a1 + 32) + 1016));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1632), "setFrame:");
  id v6 = [v3 tintColor];
  uint64_t v4 = [v3 traitCollection];

  double v5 = [v6 resolvedColorWithTraitCollection:v4];
  [*(id *)(*(void *)(a1 + 32) + 1632) setTintColor:v5];
}

- (void)_statusBarHover:(id)a3
{
  [a3 locationInView:self->_statusBarView];
  double v5 = v4;
  double v7 = v6;
  -[SFWebpageStatusBarView setHoverPoint:](self->_statusBarView, "setHoverPoint:");
  BOOL v8 = v7 == *(double *)(MEMORY[0x1E4F1DAD8] + 8) && v5 == *MEMORY[0x1E4F1DAD8];
  statusBarView = self->_statusBarView;
  [(SFWebpageStatusBarView *)statusBarView setSuppressShowingStatusBar:v8];
}

- (void)updateUsesWebpageStatusBar
{
  if ([(BrowserRootViewController *)self _usesWebpageStatusBar])
  {
    [(BrowserRootViewController *)self _setUpWebpageStatusBarIfNeeded];
  }
  else
  {
    [(SFWebpageStatusBarView *)self->_statusBarView removeFromSuperview];
    statusBarView = self->_statusBarView;
    self->_statusBarView = 0;

    if (self->_statusBarHoverGestureRecognizer)
    {
      -[SFOrderedContainerView removeGestureRecognizer:](self->_documentAndTopBarsContainerView, "removeGestureRecognizer:");
      statusBarHoverGestureRecognizer = self->_statusBarHoverGestureRecognizer;
      self->_statusBarHoverGestureRecognizer = 0;
    }
  }
}

id __49__BrowserRootViewController__setUpTabGroupButton__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v4 = objc_loadWeakRetained(WeakRetained + 209);
    objc_msgSend(v3, "reportIOSToolbarButtonUsage:withLayout:", 6, objc_msgSend(v4, "analyticsLayoutProvenance"));

    double v5 = (void *)[*(id *)(a1 + 32) newTabGroupMenu];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)_sidebarTrailingButtonWasTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained sidebarTrailingButtonWasTapped];
}

- (void)_updateSidebarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_showingSidebar && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int64_t sidebarStyle = self->_sidebarStyle;
    double v5 = [(BrowserRootViewController *)self view];
    [v5 frame];
    self->_int64_t sidebarStyle = objc_msgSend(WeakRetained, "browserViewController:sidebarStyleForViewSize:", self, v6, v7);

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__BrowserRootViewController__updateSidebarStyle__block_invoke;
    v8[3] = &unk_1E6D77E20;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    if (sidebarStyle != self->_sidebarStyle)
    {
      [(BrowserRootViewController *)self _setShowingFloatingSidebarButton:0];
      if (objc_opt_respondsToSelector()) {
        [WeakRetained browserViewController:self didChangeSidebarStyle:self->_sidebarStyle];
      }
    }
  }
}

uint64_t __48__BrowserRootViewController__updateSidebarStyle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createSidebarContentDimmingViewIfNeeded];
}

- (void)_createSidebarContentDimmingViewIfNeeded
{
  if (!self->_sidebarContentDimmingView
    && [(BrowserRootViewController *)self _shouldShowSidebarContentDimmingView])
  {
    id v3 = [SidebarContentDimmingView alloc];
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(BrowserRootViewController *)self _sidebarDimmedContentFrameIncludingSidebarOnlyIfEmbedded:1];
    double v16 = -[SidebarContentDimmingView initWithFrame:dimmedContentFrame:](v3, "initWithFrame:dimmedContentFrame:", v5, v7, v9, v11, v12, v13, v14, v15);
    sidebarContentDimmingView = self->_sidebarContentDimmingView;
    self->_sidebarContentDimmingView = v16;

    [(SidebarContentDimmingView *)self->_sidebarContentDimmingView setTransparent:1];
    double v18 = [(SidebarViewController *)self->_sidebarViewController view];
    [(SidebarContentDimmingView *)self->_sidebarContentDimmingView setPassthroughView:v18];

    [(SidebarContentDimmingView *)self->_sidebarContentDimmingView setDelegate:self];
    contentContainerView = self->_contentContainerView;
    double v20 = self->_sidebarContentDimmingView;
    documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
    [(ViewWithCustomNextResponder *)contentContainerView insertSubview:v20 aboveSubview:documentAndTopBarsContainerView];
  }
}

- (void)_destroySidebarContentDimmingViewIfNeeded
{
  if (self->_sidebarContentDimmingView
    && ![(BrowserRootViewController *)self _shouldShowSidebarContentDimmingView])
  {
    [(SidebarContentDimmingView *)self->_sidebarContentDimmingView removeFromSuperview];
    sidebarContentDimmingView = self->_sidebarContentDimmingView;
    self->_sidebarContentDimmingView = 0;
  }
}

- (SFThemeColorEffectView)topBackdrop
{
  return self->_topBackdrop;
}

- (void)_transitionFromBanner:(id)a3 toBanner:(id)a4 animated:(BOOL)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = [(BrowserRootViewController *)self view];
  [v10 setNeedsLayout];

  int v11 = [v9 separableFromStatusBar];
  double v12 = &OBJC_IVAR___BrowserRootViewController__documentAndTopBarsContainerView;
  if (v11) {
    double v12 = &OBJC_IVAR___BrowserRootViewController__scrollView;
  }
  id v13 = *(id *)((char *)&self->super.super.super.isa + *v12);
  if (v9)
  {
    [(BrowserRootViewController *)self _updateThemeForBanner:v9 animated:0];
    [v9 setShowsTopSeparator:0];
    double v14 = [(BrowserRootViewController *)self view];
    [v14 layoutMargins];
    objc_msgSend(v9, "setLayoutMargins:");

    [v13 addSubview:v9];
  }
  [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
  objc_msgSend(v9, "sizeThatFits:", CGRectGetWidth(v48), 0.0);
  double v16 = v15;
  [v13 bounds];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, CGRectGetWidth(v49), v16);
  [(UIScrollView *)self->_scrollView contentOffset];
  double v18 = v17;
  double v20 = v19;
  if (v9 && ([v9 isInitiallyBehindNavigationBar] & 1) == 0)
  {
    [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:self->_documentAndTopBarsContainerView];
    double v21 = -CGRectGetMaxY(v50);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v22 = [(BrowserRootViewController *)self managedTopBanners];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) bounds];
          double v21 = v21 - CGRectGetHeight(v51);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v24);
    }

    [(UIScrollView *)self->_scrollView contentOffset];
    if (v27 - v21 <= v16 && v27 - v21 > 0.0) {
      double v20 = v21;
    }
  }
  if (a5)
  {
    double v29 = (void *)MEMORY[0x1E4FB1EB0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke;
    v37[3] = &unk_1E6D78B38;
    id v38 = v9;
    double v39 = self;
    double v41 = v16;
    id v40 = v13;
    [v29 performWithoutAnimation:v37];
    double v30 = (void *)MEMORY[0x1E4FB1EB0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_2;
    v33[3] = &unk_1E6D7A440;
    v33[4] = self;
    double v35 = v18;
    double v36 = v20;
    id v34 = v8;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_3;
    void v31[3] = &unk_1E6D77C20;
    id v32 = v34;
    [v30 _animateUsingDefaultTimingWithOptions:2 animations:v33 completion:v31];
  }
  else
  {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v18, v20);
    [v8 removeFromSuperview];
  }
}

uint64_t __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 40) + 1656);
  [v2 contentOffset];
  double v4 = v3 - *(double *)(a1 + 56);
  [*(id *)(*(void *)(a1 + 40) + 1224) bounds];
  objc_msgSend(v2, "convertRect:toView:", *(void *)(a1 + 48), 0.0, v4, CGRectGetWidth(v8), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  double v5 = *(void **)(a1 + 32);
  return [v5 layoutIfNeeded];
}

uint64_t __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1656), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  [*(id *)(a1 + 40) bounds];
  double v3 = -CGRectGetHeight(v9);
  [*(id *)(*(void *)(a1 + 32) + 1224) bounds];
  double Width = CGRectGetWidth(v10);
  [*(id *)(a1 + 40) bounds];
  double Height = CGRectGetHeight(v11);
  double v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "setFrame:", 0.0, v3, Width, Height);
}

uint64_t __69__BrowserRootViewController__transitionFromBanner_toBanner_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)bannerController:(id)a3 didSetAppBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  if (a4 != a5) {
    [(BrowserRootViewController *)self _transitionFromBanner:a5 toBanner:a4 animated:a6];
  }
}

- (void)bannerController:(id)a3 didSetCrashBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  if (a4 != a5)
  {
    BOOL v7 = a6;
    id v10 = a5;
    id v14 = a4;
    [v14 setPinnedToTop:1];
    CGRect v11 = (void *)MEMORY[0x1E4F28ED0];
    [(UIScrollView *)self->_scrollView contentOffset];
    id v13 = [v11 numberWithDouble:v12];
    [v14 setPinnedOffset:v13];

    [(BrowserRootViewController *)self _transitionFromBanner:v10 toBanner:v14 animated:v7];
  }
}

- (void)bannerController:(id)a3 didSetWebExtensionBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  if (v9 != a5)
  {
    [a5 removeFromSuperview];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __95__BrowserRootViewController_bannerController_didSetWebExtensionBanner_previousBanner_animated___block_invoke;
    v13[3] = &unk_1E6D77E20;
    v13[4] = self;
    id v10 = (void (**)(void))MEMORY[0x1E4E42950](v13);
    if (v9)
    {
      [(BrowserRootViewController *)self _updateThemeForBanner:v9 animated:v6];
      capsuleViewController = self->_capsuleViewController;
      if (capsuleViewController) {
        uint64_t v12 = [(CapsuleNavigationBarViewController *)capsuleViewController capsuleIsFocused];
      }
      else {
        uint64_t v12 = 0;
      }
      [v9 setHidden:v12];
      [v9 setPinnedToTop:1];
      [(UIScrollView *)self->_scrollView addSubview:v9];
    }
    v10[2](v10);
  }
}

void __95__BrowserRootViewController_bannerController_didSetWebExtensionBanner_previousBanner_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

- (void)bannerController:(id)a3 didSetRemotelyEnabledExtensionBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  if (v9 != a5)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __107__BrowserRootViewController_bannerController_didSetRemotelyEnabledExtensionBanner_previousBanner_animated___block_invoke;
    v14[3] = &unk_1E6D77E20;
    v14[4] = self;
    id v10 = a5;
    CGRect v11 = (void (**)(void))MEMORY[0x1E4E42950](v14);
    [v10 removeFromSuperview];

    if (v9)
    {
      [(BrowserRootViewController *)self _updateThemeForBanner:v9 animated:v6];
      capsuleViewController = self->_capsuleViewController;
      if (capsuleViewController) {
        uint64_t v13 = [(CapsuleNavigationBarViewController *)capsuleViewController capsuleIsFocused];
      }
      else {
        uint64_t v13 = 0;
      }
      [v9 setHidden:v13];
      [v9 setPinnedToTop:1];
      [(UIScrollView *)self->_scrollView addSubview:v9];
    }
    v11[2](v11);
  }
}

void __107__BrowserRootViewController_bannerController_didSetRemotelyEnabledExtensionBanner_previousBanner_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

- (void)bannerController:(id)a3 didSetWebExtensionPermissionGrantedBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  if (v9 != a5)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __112__BrowserRootViewController_bannerController_didSetWebExtensionPermissionGrantedBanner_previousBanner_animated___block_invoke;
    v14[3] = &unk_1E6D77E20;
    v14[4] = self;
    id v10 = a5;
    CGRect v11 = (void (**)(void))MEMORY[0x1E4E42950](v14);
    [v10 removeFromSuperview];

    if (v9)
    {
      [(BrowserRootViewController *)self _updateThemeForBanner:v9 animated:v6];
      capsuleViewController = self->_capsuleViewController;
      if (capsuleViewController) {
        uint64_t v13 = [(CapsuleNavigationBarViewController *)capsuleViewController capsuleIsFocused];
      }
      else {
        uint64_t v13 = 0;
      }
      [v9 setHidden:v13];
      [v9 setPinnedToTop:1];
      [(UIScrollView *)self->_scrollView addSubview:v9];
    }
    v11[2](v11);
  }
}

void __112__BrowserRootViewController_bannerController_didSetWebExtensionPermissionGrantedBanner_previousBanner_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

- (void)bannerController:(id)a3 didSetPrivateBrowsingPrivacyProtectionsBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  if (a4 != a5)
  {
    BOOL v7 = a6;
    id v10 = a5;
    id v14 = a4;
    [v14 setPinnedToTop:1];
    CGRect v11 = (void *)MEMORY[0x1E4F28ED0];
    [(UIScrollView *)self->_scrollView contentOffset];
    uint64_t v13 = [v11 numberWithDouble:v12];
    [v14 setPinnedOffset:v13];

    [(BrowserRootViewController *)self _transitionFromBanner:v10 toBanner:v14 animated:v7];
  }
}

- (void)bannerController:(id)a3 didSetTabGroupBanner:(id)a4 previousBanner:(id)a5 animated:(BOOL)a6
{
  if (a4 != a5) {
    [(BrowserRootViewController *)self _transitionFromBanner:a5 toBanner:a4 animated:a6];
  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled", a3);
  int v5 = v4;
  if (self->_capsuleViewController) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __54__BrowserRootViewController__keyboardWillChangeFrame___block_invoke;
    v30[3] = &unk_1E6D77E20;
    v30[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v30];
  }
  BOOL v7 = [(BrowserRootViewController *)self view];
  CGRect v8 = [v7 keyboardSceneDelegate];

  id v9 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];

  if (v8 == v9) {
    [v8 visibleFrameInView:0];
  }
  else {
    [v8 visibleInputViewFrameInView:0];
  }
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  contentContainerView = self->_contentContainerView;
  double v19 = [(ViewWithCustomNextResponder *)contentContainerView window];
  double v20 = [v19 screen];
  double v21 = [v20 coordinateSpace];
  -[ViewWithCustomNextResponder convertRect:fromCoordinateSpace:](contentContainerView, "convertRect:fromCoordinateSpace:", v21, v14, v15, v16, v17);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
  v33.origin.CGFloat x = 0.0;
  v33.origin.CGFloat y = v23;
  v33.size.CGFloat width = v25;
  v33.size.CGFloat height = v27;
  CGRect v32 = CGRectIntersection(v31, v33);
  self->_bottomBarKeyboardOffset = CGRectGetHeight(v32);
  if (!self->_capsuleViewController)
  {
    double v28 = [(BrowserRootViewController *)self view];
    [v28 setNeedsLayout];

    if (v5)
    {
      double v29 = [(BrowserRootViewController *)self view];
      [v29 layoutIfNeeded];
    }
  }
}

void __54__BrowserRootViewController__keyboardWillChangeFrame___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)addToastViewController:(id)a3
{
  int v4 = (SFToastViewController *)a3;
  [(BrowserRootViewController *)self loadViewIfNeeded];
  [(UIViewController *)self->_documentAndTopBarsContainerViewController addChildViewController:v4];
  currentlyPresentedToastViewController = self->_currentlyPresentedToastViewController;
  self->_currentlyPresentedToastViewController = v4;
  CGRect v8 = v4;

  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  BOOL v7 = [(SFToastViewController *)v8 view];
  [(SFOrderedContainerView *)documentAndTopBarsContainerView addSubview:v7];

  [(SFToastViewController *)v8 didMoveToParentViewController:self->_documentAndTopBarsContainerViewController];
}

- (void)removeToastViewController:(id)a3
{
  id v4 = a3;
  int v5 = [v4 view];
  [v5 removeFromSuperview];

  [(UIViewController *)self->_documentAndTopBarsContainerViewController removeChildViewController:v4];
  currentlyPresentedToastViewController = self->_currentlyPresentedToastViewController;
  self->_currentlyPresentedToastViewController = 0;
}

- (double)offsetForDynamicBarAnimator
{
  if ([(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer state] == 2)
  {
    hideNavigationBarGestureRecognizer = self->_hideNavigationBarGestureRecognizer;
    id v4 = [(BrowserRootViewController *)self view];
    [(UIPanGestureRecognizer *)hideNavigationBarGestureRecognizer translationInView:v4];
    double v6 = -v5;
  }
  else
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    return v7;
  }
  return v6;
}

- (void)_hideNavigationBarGestureRecognized:(id)a3
{
  id v13 = a3;
  id v4 = [(BrowserRootViewController *)self view];
  [v13 translationInView:v4];
  double v6 = v5;

  uint64_t v7 = [v13 state];
  if ((unint64_t)(v7 - 3) >= 3)
  {
    double v11 = -v6;
    if (v7 == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      [WeakRetained updateDynamicBarGeometry];

      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator updateDraggingWithOffset:v11];
    }
    else if (v7 == 1)
    {
      [(_SFWebView *)self->_webView _beginInteractiveObscuredInsetsChange];
      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator beginDraggingWithOffset:v11];
    }
  }
  else
  {
    [(_SFWebView *)self->_webView _endInteractiveObscuredInsetsChange];
    CGRect v8 = [(BrowserRootViewController *)self view];
    [v13 velocityInView:v8];
    double v10 = v9;

    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator endDraggingWithTargetOffset:(double)(v10 / log(*MEMORY[0x1E4FB2EF0]) - v6) velocity:v10 * -1000.0];
    if (![(_SFDynamicBarAnimator *)self->_dynamicBarAnimator targetState]) {
      self->_keepBarsMinimized = 1;
    }
  }
}

- (void)_showBarsFromBottomBarTap:(id)a3
{
  id v3 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v3 setSelectedItemState:0 animated:1];
}

- (void)_receivedTouchDown:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    stepperContainer = self->_stepperContainer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __48__BrowserRootViewController__receivedTouchDown___block_invoke;
    v14[3] = &unk_1E6D77E20;
    v14[4] = self;
    [(SFStepperContainer *)stepperContainer hideStepperWithCompletion:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    uint64_t v7 = [WeakRetained tabController];
    CGRect v8 = [v7 activeTabDocument];
    char v9 = [v8 isBlank];

    if ((v9 & 1) == 0)
    {
      [v4 locationInView:self->_documentAndTopBarsContainerView];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(BrowserRootViewController *)self navigationBarFrameInCoordinateSpace:self->_documentAndTopBarsContainerView];
      v15.CGFloat x = v11;
      v15.CGFloat y = v13;
      if (!CGRectContainsPoint(v16, v15))
      {
        [(SFWebpageStatusBarView *)self->_statusBarView setSuppressShowingStatusBar:1];
        [(SFWebpageStatusBarView *)self->_statusBarView clearStatus];
        [WeakRetained setOverridesUndoManagerForClosedTabs:0];
      }
    }
  }
}

void __48__BrowserRootViewController__receivedTouchDown___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 976);
  *(void *)(v2 + 976) = 0;
}

- (void)_enterYttriumStateGestureRecognized:(id)a3
{
  if ([a3 state] == 3)
  {
    [(BrowserRootViewController *)self setInYttriumState:1];
  }
}

- (void)_exitYttriumStateGestureRecognized:(id)a3
{
  id v8 = a3;
  if ([v8 state] >= 3)
  {
    [v8 velocityInView:self->_documentAndTopBarsContainerView];
    double v5 = v4;
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView bounds];
    double MaxY = CGRectGetMaxY(v10);
    [v8 locationInView:self->_documentAndTopBarsContainerView];
    if (MaxY - v7 > 200.0 || v5 < -150.0) {
      [(BrowserRootViewController *)self setInYttriumState:0];
    }
  }
}

- (void)_receivedTouchUp:(id)a3
{
  if ([a3 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained unhideCapsuleFromPageMenuIfNeeded];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  if ((UIPanGestureRecognizer *)self->_showBarsFromBottomBarRecognizer == v6)
  {
    if (self->_keepBarsMinimized
      || ([(CatalogViewController *)self->_catalogViewController view],
          double v18 = objc_claimAutoreleasedReturnValue(),
          [v18 window],
          double v19 = objc_claimAutoreleasedReturnValue(),
          v19,
          v18,
          v19))
    {
      LOBYTE(self) = 0;
    }
    else
    {
      [(ViewWithCustomNextResponder *)self->_contentContainerView bounds];
      double v26 = v25;
      [v7 locationInView:self->_contentContainerView];
      double v28 = v26 - v27;
      [(BrowserRootViewController *)self maximumHeightObscuredByBottomToolbar];
      LOBYTE(self) = v28 < v29;
    }
  }
  else
  {
    uint64_t v8 = [(BrowserRootViewController *)self topBar];
    char v9 = (void *)v8;
    if (self->_hideNavigationBarGestureRecognizer == v6)
    {
      if (v8)
      {
        [v7 locationInView:v8];
        double v21 = v20;
        [v9 bounds];
        LOBYTE(self) = v21 < CGRectGetMaxY(v31);
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
    else
    {
      CGRect v10 = [(BrowserRootViewController *)self view];
      [v10 safeAreaInsets];
      double v12 = v11;

      CGFloat v13 = [(BrowserRootViewController *)self view];
      [v13 bounds];
      double MaxY = CGRectGetMaxY(v30);
      CGPoint v15 = [(BrowserRootViewController *)self view];
      [v7 locationInView:v15];
      double v17 = MaxY - v16;

      if ((UIPanGestureRecognizer *)self->_enterYttriumStateRecognizer == v6)
      {
        LODWORD(self) = (v17 >= v12) & ~[(BrowserRootViewController *)self isInYttriumState];
      }
      else if (self->_exitYttriumStateRecognizer == v6)
      {
        BOOL v22 = [(BrowserRootViewController *)self _shouldInterceptBottomGesture];
        BOOL v23 = v17 <= fmax(v12, 34.0);
        LOBYTE(self) = v22 && v23;
      }
      else
      {
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_hideNavigationBarGestureRecognizer == a3)
  {
    id v5 = a3;
    double v6 = [(BrowserRootViewController *)self view];
    [v5 translationInView:v6];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      CGRect v10 = [WeakRetained tabController];
      double v11 = [v10 activeTabDocument];
      if ([v11 canHideToolbar]) {
        BOOL v3 = ![(BrowserRootViewController *)self _interfaceFillsScreen];
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = (SFTouchDownGestureRecognizer *)a3;
  BOOL v6 = self->_enterYttriumStateRecognizer == v5
    || (SFTouchDownGestureRecognizer *)self->_exitYttriumStateRecognizer == v5
    || self->_touchDownGestureRecognizer == v5
    || self->_touchUpGestureRecognizer == v5;

  return v6;
}

- (void)setPullToRefreshIsEnabled:(BOOL)a3
{
  self->_pullToRefreshIsEnabled = a3;
  [(BrowserRootViewController *)self _updateRefreshControl];
}

- (void)_updateRefreshControl
{
  if (self->_pullToRefreshIsEnabled) {
    [(BrowserRootViewController *)self _setUpRefreshControlIfNeeded];
  }
  else {
    [(UIScrollView *)self->_scrollView setRefreshControl:0];
  }
}

- (void)stopRefreshing
{
  id v2 = [(BrowserRootViewController *)self refreshControl];
  if ([v2 isRefreshing]) {
    [v2 endRefreshing];
  }
}

- (void)_refreshControlFired:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v6 = [WeakRetained tabController];
  double v7 = [v6 activeTabDocument];
  [v7 reloadUserInitiated];

  dispatch_time_t v8 = dispatch_time(0, 2500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BrowserRootViewController__refreshControlFired___block_invoke;
  block[3] = &unk_1E6D77E20;
  id v11 = v4;
  id v9 = v4;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

uint64_t __50__BrowserRootViewController__refreshControlFired___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRefreshing];
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 endRefreshing];
  }
  return result;
}

- (void)sidebarDimmingViewDismiss:(id)a3
{
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(BrowserRootViewController *)self view];
  id v5 = [v4 window];
  BOOL v6 = [v5 windowScene];
  double v7 = [v6 focusSystem];
  dispatch_time_t v8 = [v7 focusedItem];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  sidebarViewController = self->_sidebarViewController;
  id v11 = v9;
  double v12 = [(SidebarViewController *)sidebarViewController view];
  int v13 = [v11 isDescendantOfView:v12];

  double v14 = [(BrowserRootViewController *)self _unifiedField];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v14);

  if (v13) {
    objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_sidebarViewController);
  }
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_webView);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_catalogViewController);
  CGPoint v15 = [(TabBarManager *)self->_tabBarManager inlineTabBar];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v15);

  double v16 = [(TabBarManager *)self->_tabBarManager standaloneTabBar];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v16);

  if ((v13 & 1) == 0) {
    objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_sidebarViewController);
  }

  return v3;
}

- (void)_prepareBarsForTransitionFromPreviousToolbarPlacement:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__BrowserRootViewController__prepareBarsForTransitionFromPreviousToolbarPlacement___block_invoke;
  v3[3] = &unk_1E6D785E8;
  v3[4] = self;
  v3[5] = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __83__BrowserRootViewController__prepareBarsForTransitionFromPreviousToolbarPlacement___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) != 1) {
    goto LABEL_5;
  }
  uint64_t result = [*(id *)(a1 + 32) usingUnifiedBar];
  if (result)
  {
    *(void *)(*(void *)(a1 + 32) + 1328) = 1;
    [*(id *)(a1 + 32) layOutTopBars];
    [*(id *)(*(void *)(a1 + 32) + 1584) layoutIfNeeded];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1584) setAlpha:0.0];
    *(void *)(*(void *)(a1 + 32) + 1328) = 0;
    return result;
  }
  if (*(void *)(a1 + 40) != 1)
  {
LABEL_5:
    uint64_t result = [*(id *)(a1 + 32) usingLoweredBar];
    if (result)
    {
      [*(id *)(*(void *)(a1 + 32) + 1600) beginHidingCapsuleAnimated:0];
      BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1600) view];
      [v3 layoutIfNeeded];

      [*(id *)(a1 + 32) _layOutTopBackdrop];
      id v4 = *(void **)(*(void *)(a1 + 32) + 1600);
      return [v4 endHidingCapsuleAnimated:0];
    }
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)BrowserRootViewController;
  id v7 = a4;
  -[BrowserRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  BOOL v8 = self->_toolbarPlacement != 0;
  ++self->_sizeTransitionCount;
  self->_isPerformingSizeTransition = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BrowserRootViewController _setToolbarPlacement:](self, "_setToolbarPlacement:", objc_msgSend(WeakRetained, "browserViewController:toolbarPlacementForViewSize:", self, width, height));

  [(BrowserRootViewController *)self _updateToolbarForToolbarPlacementAllowingRemoval:0];
  CGRect v10 = [(BrowserRootViewController *)self view];
  [v10 bounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;

  id v15 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v15, "rootViewControllerViewWillTransitionToSize:", width, height);

  [(BrowserRootViewController *)self _prepareBarsForTransitionFromPreviousToolbarPlacement:v8];
  [(BrowserRootViewController *)self _dismissWebSearchTipPopoverIfNeeded];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E6D7A468;
  v17[4] = self;
  *(double *)&v17[5] = width;
  *(double *)&v17[6] = height;
  v17[7] = v12;
  v17[8] = v14;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v16[3] = &unk_1E6D7A490;
  v16[4] = self;
  v16[5] = v12;
  v16[6] = v14;
  [v7 animateAlongsideTransition:v17 completion:v16];
}

void __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 usingLoweredBar];
  BOOL v6 = *(void **)(*(void *)(a1 + 32) + 1584);
  if (v5)
  {
    [v6 setAlpha:0.0];
  }
  else
  {
    [v6 setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 1600) beginHidingCapsuleAnimated:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1672));
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1688));
  BOOL v8 = [v7 view];

  id v9 = [*(id *)(a1 + 32) view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  double v14 = *(double *)(a1 + 40);
  double v15 = *(double *)(a1 + 48);
  double v16 = [*(id *)(a1 + 32) view];
  objc_msgSend(v16, "setFrame:", v11, v13, v14, v15);

  [*(id *)(a1 + 32) _setShowingFloatingSidebarButton:0];
  [WeakRetained updateTabGroupButtonsVisibility];
  objc_msgSend(WeakRetained, "rootViewControllerViewTransitionFromSize:includingSidebar:animated:", 1, objc_msgSend(v4, "isAnimated"), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v17 = *(void **)(*(void *)(a1 + 32) + 1680);
  uint64_t v18 = [v4 isAnimated];

  [v17 reloadNavigationItemAnimated:v18];
  [*(id *)(a1 + 32) _updateSidebarStyle];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1336), "setTransparent:", objc_msgSend(*(id *)(a1 + 32), "_shouldShowSidebarContentDimmingView") ^ 1);
  double v19 = [v8 superview];

  if (v19) {
    [v8 layoutIfNeeded];
  }
  double v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 postNotificationName:@"BrowserRootViewControllerDidTransitionSizeNotification" object:*(void *)(a1 + 32)];
}

void __80__BrowserRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(*(void *)(a1 + 32) + 1672);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [*(id *)(a1 + 32) _updateToolbarForToolbarPlacementAllowingRemoval:1];
  [*(id *)(a1 + 32) _destroySidebarContentDimmingViewIfNeeded];
  --*(void *)(*(void *)(a1 + 32) + 1184);
  [*(id *)(a1 + 32) updateSuppressesStandaloneTabBar];
  uint64_t v5 = [v4 isAnimated];

  objc_msgSend(WeakRetained, "rootViewControllerViewDidTransitionFromSize:animated:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(unsigned char *)(*(void *)(a1 + 32) + 1447) = 0;
  [WeakRetained updatePopoverPositionAfterSizeTransition];
  [*(id *)(a1 + 32) _setAvoidanceInsetsNeedsUpdate];
  BOOL v6 = *(id **)(a1 + 32);
  id v7 = [v6[200] capsuleCollectionView];
  objc_msgSend(v6, "_updateAllowsHidingHomeIndicatorMinimized:", objc_msgSend(v7, "selectedItemIsMinimized"));

  [*(id *)(a1 + 32) setNeedsUpdateOfHomeIndicatorAutoHidden];
  [*(id *)(a1 + 32) updateAccessibilityIdentifier];
  [*(id *)(a1 + 32) _setNeedsUpdateOfMultitaskingDragExclusionRects];
  [*(id *)(a1 + 32) _updateTopBarStyles];
  [*(id *)(a1 + 32) _updateScrollToTopOverride];
  [*(id *)(a1 + 32) setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  [*(id *)(a1 + 32) updateUsesWebpageStatusBar];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 presentingViewController];

  if (v10)
  {
    double v11 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BrowserRootViewController presentViewController:animated:completion:](v8, v11);
    }
  }
  double v12 = (void *)MEMORY[0x1E4E42950](v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v8 modalPresentationStyle]) {
    [v8 setModalPresentationStyle:5];
  }
  if (![(CatalogViewController *)self->_catalogViewController popoverIsShowing]) {
    goto LABEL_11;
  }
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2050000000;
  double v13 = (void *)getSKStoreProductViewControllerClass_softClass;
  uint64_t v24 = getSKStoreProductViewControllerClass_softClass;
  if (!getSKStoreProductViewControllerClass_softClass)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getSKStoreProductViewControllerClass_block_invoke;
    v20[3] = &unk_1E6D77CE0;
    v20[4] = &v21;
    __getSKStoreProductViewControllerClass_block_invoke((uint64_t)v20);
    double v13 = (void *)v22[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v21, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke;
    v15[3] = &unk_1E6D7A2D8;
    id v16 = v8;
    double v17 = self;
    BOOL v19 = v6;
    id v18 = v12;
    [(BrowserRootViewController *)self dismissViewControllerAnimated:1 completion:v15];
  }
  else
  {
LABEL_11:
    [(BrowserRootViewController *)self _sf_presentViewControllerOnTopOfPresentedViewController:v8 animated:v6 completion:v12];
  }
}

id __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1672));
    [WeakRetained cancelFavorites];
  }
  id v4 = [*v2 presentingViewController];

  if (v4)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke_cold_1(v2, a1, v5);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)BrowserRootViewController;
  return objc_msgSendSuper2(&v10, sel_presentViewController_animated_completion_, v6, v7, v8);
}

uint64_t __70__BrowserRootViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1680) displayPopover];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)capsuleNavigationController:(id)a3 obscuredInsetsDidChangeWithCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BrowserRootViewController *)self view];
  [v8 setNeedsLayout];

  id v9 = [(BrowserRootViewController *)self _activeTabDocumentView];
  [v9 beginInteractiveGeometryChanges];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke;
  v14[3] = &unk_1E6D7A4B8;
  v14[4] = self;
  id v15 = v6;
  id v10 = v6;
  [v7 addAnimations:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke_2;
  v12[3] = &unk_1E6D77E20;
  id v13 = v9;
  id v11 = v9;
  [v7 addCompletion:v12];
}

void __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layOutTopBackdrop];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1496));
  [WeakRetained browserViewControllerDidChangeBarInsets:*(void *)(a1 + 32)];

  BOOL v3 = *(unsigned char **)(a1 + 32);
  if (v3[1444])
  {
    id v4 = [*(id *)(a1 + 40) capsuleCollectionView];
    char v5 = [v4 selectedItemIsMinimized];

    BOOL v3 = *(unsigned char **)(a1 + 32);
    if ((v5 & 1) == 0)
    {
      v3[1444] = 0;
      BOOL v3 = *(unsigned char **)(a1 + 32);
    }
  }
  id v6 = [v3 view];
  [v6 layoutIfNeeded];
}

uint64_t __96__BrowserRootViewController_capsuleNavigationController_obscuredInsetsDidChangeWithCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endInteractiveGeometryChanges];
}

- (void)capsuleNavigationBarViewControllerDidChangeCapsuleFocus:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__BrowserRootViewController_capsuleNavigationBarViewControllerDidChangeCapsuleFocus_options___block_invoke;
  v15[3] = &unk_1E6D7A4E0;
  id v8 = v6;
  id v16 = v8;
  id v9 = WeakRetained;
  id v18 = self;
  int64_t v19 = a4;
  BOOL v20 = (a4 & 2) == 0;
  id v17 = v9;
  id v10 = (void (**)(void))MEMORY[0x1E4E42950](v15);
  [v9 updateTabViewPinchRecognizer];
  id v11 = [v9 tabController];
  double v12 = [v11 activeTabDocument];
  int v13 = [v12 isShowingSystemStartPage];

  if (v13)
  {
    v10[2](v10);
    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
    if (a4) {
      goto LABEL_7;
    }
  }
  if ([v9 isFavoritesFieldFocused])
  {
    id v14 = [v8 unifiedField];
    [(CatalogViewController *)self->_catalogViewController setTextField:v14];
    [v14 becomeFirstResponder];
  }
LABEL_7:
}

uint64_t __93__BrowserRootViewController_capsuleNavigationBarViewControllerDidChangeCapsuleFocus_options___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) capsuleIsFocused];
  BOOL v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(_DWORD *)(a1 + 56) & 1;
    uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
    return [v3 setFavoritesFieldFocused:1 forVoiceSearch:v4 animated:v5 completionHandler:0];
  }
  else
  {
    [v3 cancelFavoritesAnimated:*(unsigned __int8 *)(a1 + 64)];
    id v7 = *(void **)(*(void *)(a1 + 48) + 1680);
    return [v7 setTextField:0];
  }
}

- (void)capsuleNavigationBarViewController:(id)a3 selectedItemWillChangeToState:(int64_t)a4 options:(int64_t)a5 coordinator:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  [(BrowserRootViewController *)self _updateAllowsHidingHomeIndicatorMinimized:a4 == 1];
  int v11 = [v9 capsuleIsFocused];
  if (a4 != 2)
  {
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      int v13 = [WeakRetained tabController];
      id v14 = [v13 activeTabDocument];
      char v15 = [v14 isShowingSystemStartPage];

      if ((v15 & 1) == 0)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke;
        v30[3] = &unk_1E6D78CA8;
        v30[4] = self;
        [v10 addAnimations:v30];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_2;
        void v29[3] = &unk_1E6D77E20;
        v29[4] = self;
        [v10 addCompletion:v29];
      }
    }
  }
  if ([(SFTipsCoordinator *)self->_tipsCoordinator webSearchTipAvailable])
  {
    char v16 = [v9 capsuleIsFocused];
    if (a4 == 2 && (v16 & 1) == 0)
    {
      if ([(BrowserRootViewController *)self isUsingBottomCapsule])
      {
        id v17 = [(SFTipsCoordinator *)self->_tipsCoordinator webSearchTipViewController];
        webSearchTipViewController = self->_webSearchTipViewController;
        self->_webSearchTipViewController = v17;

        int64_t v19 = [(UIViewController *)self->_webSearchTipViewController popoverPresentationController];
        [v19 _setIgnoresKeyboardNotifications:1];
        [v19 setPermittedArrowDirections:2];
        objc_initWeak(&location, self);
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        uint64_t v23 = __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3;
        uint64_t v24 = &unk_1E6D7A508;
        objc_copyWeak(&v27, &location);
        id v25 = v9;
        id v20 = v19;
        id v26 = v20;
        [v10 addCompletion:&v21];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      goto LABEL_11;
    }
  }
  if (a4 == 2) {
LABEL_11:
  }
    [(TabSwitcherViewController *)self->_tabSwitcherViewController detachCapsuleForActiveTab];
  [(BrowserRootViewController *)self _updateBottomBarHeightAboveKeyboard];
}

uint64_t __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1289) = 1;
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

uint64_t __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1289) = 0;
  return result;
}

void __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    BOOL v3 = [a1[4] capsuleCollectionView];
    uint64_t v4 = objc_msgSend(v3, "viewForItemAtIndex:", objc_msgSend(v3, "selectedItemIndex"));
    if (v4)
    {
      [a1[5] setSourceItem:v4];
      [WeakRetained presentViewController:WeakRetained[176] animated:1 completion:0];
    }
    else
    {
      uint64_t v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3_cold_1(v5);
      }
    }
  }
}

- (BOOL)capsuleNavigationBarViewControllerAllowsMinimizationGesture:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (([WeakRetained isShowingAppInfoOverlay] & 1) != 0
    || [(BrowserRootViewController *)self _isShowingFindOnPage])
  {
LABEL_6:
    LOBYTE(v8) = 0;
    goto LABEL_7;
  }
  [(UIScrollView *)self->_scrollView zoomScale];
  double v7 = v6;
  [(_SFWebView *)self->_webView _initialScaleFactor];
  LOBYTE(v8) = 0;
  double v10 = v7 / v9;
  if (v7 / v9 != 0.0)
  {
    int v11 = [v4 capsuleCollectionView];
    double v12 = [v4 capsuleCollectionView];
    objc_msgSend(v11, "obscuredInsetsForState:", objc_msgSend(v12, "selectedItemState"));
    double v14 = v13;
    double v16 = v15;

    id v17 = [v4 capsuleCollectionView];
    [v17 obscuredInsetsForState:1];
    double v19 = v18;
    double v21 = v20;

    double v22 = v14 + v16 - v19 - v21;
    [(UIScrollView *)self->_scrollView contentInset];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    [(UIScrollView *)self->_scrollView contentSize];
    double v32 = round(v31 / v10) - v22;
    [(UIScrollView *)self->_scrollView frame];
    v40.origin.CGFloat x = v26 + v33;
    v40.origin.CGFloat y = v24 + v34;
    v40.size.double width = v35 - (v26 + v30);
    v40.size.double height = v36 - (v24 + v28);
    if (v32 > round(CGRectGetHeight(v40)) && !self->_keepBarsMinimized)
    {
      id v38 = [WeakRetained tabController];
      double v39 = [v38 activeTabDocument];
      int v8 = [v39 isBlank] ^ 1;

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)capsuleNavigationBarViewControllerWillHideKeyboard:(id)a3
{
  id v13 = a3;
  if (![(BrowserRootViewController *)self _isTrackingDropSession]
    && !-[CatalogViewController completionDetailIsPresented](self->_catalogViewController, "completionDetailIsPresented")&& !-[BrowserRootViewController _isShowingFindOnPage](self, "_isShowingFindOnPage")&& ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] & 1) == 0&& !self->_isPerformingSizeTransition)
  {
    id v4 = [(BrowserRootViewController *)self view];
    uint64_t v5 = [v4 window];
    double v6 = [v5 windowScene];
    int v7 = [v6 _isKeyWindowScene];

    if (v7)
    {
      if (([v13 focusingForScribble] & 1) == 0)
      {
        int v8 = [(BrowserRootViewController *)self _unifiedField];
        uint64_t v9 = [v8 voiceSearchState];

        if (v9 != 1
          && ![(CatalogViewController *)self->_catalogViewController isShowingUniversalSearchPrivacyDetails])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
          if (([WeakRetained isSuspendedOrSuspending] & 1) == 0)
          {
            int v11 = [WeakRetained rootViewController];
            double v12 = [v11 presentedViewController];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(WeakRetained, "setShouldKeepKeyboardFocused:", objc_msgSend(WeakRetained, "usesNarrowLayout") ^ 1);
                [WeakRetained cancelFavorites];
                [WeakRetained setShouldKeepKeyboardFocused:0];
              }
            }
          }
        }
      }
    }
  }
}

- (void)capsuleNavigationBarViewControllerDidTapVoiceSearch:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained toggleVoiceSearch];
}

- (BOOL)_isTrackingDropSession
{
  int v2 = [(CatalogViewController *)self->_catalogViewController startPageController];
  BOOL v3 = [v2 viewController];
  char v4 = [v3 isTrackingDropSession];

  return v4;
}

- (void)capsuleCollectionViewDidUpdateMinimizationGesture:(id)a3
{
  [(BrowserRootViewController *)self _layOutTopBackdrop];
  [(BrowserRootViewController *)self layOutTopBars];
  [(BrowserRootViewController *)self updateWebViewSizeAttributes];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browserViewControllerDidChangeBarInsets:self];
}

- (void)capsuleCollectionView:(id)a3 selectionGestureDidChangeFromAxis:(unint64_t)a4
{
}

- (id)_unifiedField
{
  int v2 = [(BrowserRootViewController *)self browserController];
  BOOL v3 = [v2 unifiedField];

  return v3;
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  if (self->_tabSwitcherViewController == a3) {
    [(BrowserRootViewController *)self _tabSwitcherVisibilityDidChange:1];
  }
  else {
    [(BrowserRootViewController *)self _installTabView];
  }
  [(BrowserRootViewController *)self safari_updateApplicationBackgroundStyle];
  [(BrowserRootViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  [(BrowserRootViewController *)self setNeedsPreferredStatusBarUpdateAfterCommitAnimated:1];
  [(BrowserRootViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
  id v6 = [(BrowserRootViewController *)self view];
  char v4 = [v6 window];
  uint64_t v5 = [v4 _rootSheetPresentationController];
  [v5 _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  char v4 = [(BrowserRootViewController *)self view];
  [v4 setNeedsLayout];

  [(BrowserRootViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  [(BrowserRootViewController *)self setNeedsPreferredStatusBarUpdateAfterCommitAnimated:1];
}

- (void)tabCollectionViewDidCancelDismissal:(id)a3
{
  char v4 = [(BrowserRootViewController *)self view];
  [v4 setNeedsLayout];

  [(BrowserRootViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  [(BrowserRootViewController *)self setNeedsPreferredStatusBarUpdateAfterCommitAnimated:1];
}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  uint64_t v5 = (TabSwitcherViewController *)a3;
  [(SFOrderedContainerView *)documentAndTopBarsContainerView setHidden:0];
  id v6 = [(BrowserRootViewController *)self view];
  [v6 setClipsToBounds:1];
  tabSwitcherViewController = self->_tabSwitcherViewController;

  if (tabSwitcherViewController == v5) {
    [(BrowserRootViewController *)self _tabSwitcherVisibilityDidChange:0];
  }
  else {
    [(BrowserRootViewController *)self _uninstallTabView];
  }
  [(BrowserRootViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
  int v8 = [v6 window];
  uint64_t v9 = [v8 _rootSheetPresentationController];
  [v9 _setShouldScaleDownBehindDescendantSheets:1];

  if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
  {
    [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__BrowserRootViewController_tabCollectionViewDidDismiss___block_invoke;
    block[3] = &unk_1E6D77E20;
    void block[4] = self;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(BrowserRootViewController *)self safari_updateApplicationBackgroundStyle];
  }
}

uint64_t __57__BrowserRootViewController_tabCollectionViewDidDismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_updateApplicationBackgroundStyle");
}

- (void)_installTabView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  BOOL v3 = [(BrowserRootViewController *)self view];
  [v3 setNeedsLayout];

  contentContainerView = self->_contentContainerView;
  if (SFTabGroupSwitcherEnabled())
  {
    id v5 = objc_loadWeakRetained((id *)&self->_browserController);
    id v6 = [v5 tabCollectionViewProvider];
    int v7 = [v6 tabViewContainerView];
  }
  else
  {
    int v7 = [WeakRetained view];
  }
  [(ViewWithCustomNextResponder *)contentContainerView insertSubview:v7 belowSubview:self->_documentAndTopBarsContainerView];

  [(BrowserRootViewController *)self _layOutTabView];
  documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
  uint64_t v9 = [WeakRetained view];
  LOBYTE(documentAndTopBarsContainerView) = [(SFOrderedContainerView *)documentAndTopBarsContainerView isDescendantOfView:v9];

  if ((documentAndTopBarsContainerView & 1) == 0) {
    [(SFOrderedContainerView *)self->_documentAndTopBarsContainerView setHidden:1];
  }
}

- (void)_uninstallTabView
{
  if (SFTabGroupSwitcherEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    BOOL v3 = [WeakRetained tabCollectionViewProvider];
    char v4 = [v3 tabViewContainerView];
    [v4 removeFromSuperview];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
    BOOL v3 = [WeakRetained view];
    [v3 removeFromSuperview];
  }
}

- (UIViewController)hostViewControllerForOverlay
{
  return self->_documentAndTopBarsContainerViewController;
}

- (void)tabBarDropExpansionView:(id)a3 didBeginTrackingDropSession:(id)a4
{
  p_browserController = &self->_browserController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained beginTrackingDropSessionForTabBarVisibility:v5];
}

- (void)tabBarDropExpansionView:(id)a3 didEndTrackingDropSession:(id)a4
{
  p_browserController = &self->_browserController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained endTrackingDropSessionForTabBarVisibility:v5];
}

- (void)displayHostedScreenTimeView
{
  BOOL v3 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController parentViewController];
  documentAndTopBarsContainerViewController = self->_documentAndTopBarsContainerViewController;

  if (v3 == documentAndTopBarsContainerViewController)
  {
    documentAndTopBarsContainerView = self->_documentAndTopBarsContainerView;
    id v10 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
    [(SFOrderedContainerView *)documentAndTopBarsContainerView addSubview:v10];
  }
  else
  {
    [(UIViewController *)self->_documentAndTopBarsContainerViewController addChildViewController:self->_screenTimeOverlayViewController];
    id v5 = self->_documentAndTopBarsContainerView;
    id v6 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
    [(SFOrderedContainerView *)v5 addSubview:v6];

    screenTimeOverlayViewController = self->_screenTimeOverlayViewController;
    int v8 = self->_documentAndTopBarsContainerViewController;
    [(SFScreenTimeOverlayViewController *)screenTimeOverlayViewController didMoveToParentViewController:v8];
  }
}

- (id)snapshotContentProviderForTab:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isPerformingSizeTransition
    || (([v4 isHibernated] & 1) != 0 || (objc_msgSend(v5, "contentIsReadyForSnapshot") & 1) == 0)
    && ![v5 isBlank])
  {
    id v6 = 0;
  }
  else
  {
    int v7 = [(BrowserRootViewController *)self screenTimeOverlayViewController];
    if ([v5 shouldObscureForDigitalHealth] && v7)
    {
      id v6 = v7;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      uint64_t v9 = [(BrowserRootViewController *)self catalogViewController];
      if ([v5 isShowingSystemStartPage]
        && ([v5 isPreparingForNewUserActivity] & 1) == 0)
      {
        if (![WeakRetained favoritesAreEmbedded]) {
          goto LABEL_25;
        }
        double v27 = [v5 tabGroupTab];
        double v28 = [v27 tabGroupUUID];
        double v29 = [WeakRetained tabController];
        double v30 = [v29 activeTabGroupUUID];
        int v31 = WBSIsEqual();

        if (v31) {
          id v6 = v9;
        }
        else {
LABEL_25:
        }
          id v6 = 0;
      }
      else
      {
        id v10 = [v5 frontWebView];
        if (v10)
        {
          if (([v5 isActive] & 1) == 0)
          {
            dispatch_time_t v11 = [WeakRetained tabController];
            double v12 = [v11 activeTabDocument];
            id v13 = [v12 webView];
            [v13 bounds];
            objc_msgSend(v10, "setBounds:");
          }
          [v10 bounds];
          -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v10, 0);
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          [v10 bounds];
          id v6 = -[WebViewSnapshotContentProvider initWithWebView:contentFrame:]([WebViewSnapshotContentProvider alloc], "initWithWebView:contentFrame:", v10, v17 + v22, v15 + v23, v24 - (v17 + v21), v25 - (v15 + v19));
        }
        else
        {
          id v6 = 0;
        }
      }
    }
  }
  return v6;
}

- (CGSize)contentSizeForSnapshotGenerator:(id)a3
{
  id v4 = [(BrowserRootViewController *)self documentAndTopBarsContainerView];
  [v4 bounds];
  -[BrowserRootViewController maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:](self, "maximumObscuredInsetsForRect:inCoordinateSpace:ignoreBarsMinimized:", v4, 0);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 bounds];
  double v14 = v13 - (v8 + v12);
  double v16 = v15 - (v6 + v10);

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (double)topBarsHeightForSnapshotGenerator:(id)a3
{
  [(BrowserRootViewController *)self contentFrameInPageView];
  double MinY = CGRectGetMinY(v10);
  double v5 = [(BrowserRootViewController *)self contentContainerView];
  [v5 bounds];
  -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self, "contentContainerViewFrameForBrowserSize:", v6, v7);
  double v8 = MinY - CGRectGetMinY(v11);

  return v8;
}

- (id)tabOverview:(id)a3 topBarThemeForItem:(id)a4
{
  p_browserController = &self->_browserController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  double v8 = [WeakRetained tabController];
  double v9 = [v6 UUID];

  CGRect v10 = [v8 tabWithUUID:v9];

  if ([v10 isShowingSystemStartPage]
    && [(BrowserRootViewController *)self usingLoweredBar])
  {
    CGRect v11 = 0;
  }
  else
  {
    CGRect v11 = objc_msgSend(v10, "topBarThemeForTabOverviewShowingThemeColor:", -[BrowserRootViewController _shouldShowThemeColorInTopBar](self, "_shouldShowThemeColorInTopBar"));
  }

  return v11;
}

uint64_t __64__BrowserRootViewController__dismissWebSearchTipPopoverIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v7 = [a3 presentedViewController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateBrowsingExplanationSheet);
  if (v7 == WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_browserController);
    int v6 = [v5 shouldShowTurnOnLockedPrivateBrowsingSheet];

    if (!v6) {
      return;
    }
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 setBool:1 forKey:*MEMORY[0x1E4F99150]];
  }
  else
  {
  }
}

- (BOOL)browserToolbarShouldHitTestAsOpaque:(id)a3
{
  return [(TabSwitcherViewController *)self->_tabSwitcherViewController presentationState] != 0;
}

- (void)tearDownTabSwitcherViewController
{
  [(BrowserRootViewController *)self _uninstallTabSwitcherViewController];
  contentContainerView = self->_contentContainerView;
  id v4 = [(TabSwitcherViewController *)self->_tabSwitcherViewController pinchGestureRecognizer];
  [(ViewWithCustomNextResponder *)contentContainerView removeGestureRecognizer:v4];

  id v5 = self->_contentContainerView;
  int v6 = [(TabSwitcherViewController *)self->_tabSwitcherViewController panGestureRecognizerForTrackingPinchTranslationVelocity];
  [(ViewWithCustomNextResponder *)v5 removeGestureRecognizer:v6];

  tabSwitcherViewController = self->_tabSwitcherViewController;
  self->_tabSwitcherViewController = 0;
}

- (void)_installTabSwitcherViewController
{
  [(UIViewController *)self->_contentContainerViewController addChildViewController:self->_tabSwitcherViewController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__BrowserRootViewController__installTabSwitcherViewController__block_invoke;
  v3[3] = &unk_1E6D77E20;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v3);
  [(TabSwitcherViewController *)self->_tabSwitcherViewController didMoveToParentViewController:self->_contentContainerViewController];
}

void __62__BrowserRootViewController__installTabSwitcherViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1016);
  id v4 = [*(id *)(v2 + 1696) view];
  [v3 insertSubview:v4 belowSubview:*(void *)(*(void *)(a1 + 32) + 1224)];
}

- (void)_uninstallTabSwitcherViewController
{
  [(TabSwitcherViewController *)self->_tabSwitcherViewController willMoveToParentViewController:0];
  BOOL v3 = [(TabSwitcherViewController *)self->_tabSwitcherViewController view];
  [v3 removeFromSuperview];

  tabSwitcherViewController = self->_tabSwitcherViewController;
  [(TabSwitcherViewController *)tabSwitcherViewController removeFromParentViewController];
}

- (void)_tabSwitcherVisibilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  -[SFOrderedContainerView setHidden:](self->_documentAndTopBarsContainerView, "setHidden:");
  if (v3)
  {
    [(BrowserRootViewController *)self _installTabSwitcherViewController];
  }
  else
  {
    [(BrowserRootViewController *)self _uninstallTabSwitcherViewController];
    if ([(TabSwitcherViewController *)self->_tabSwitcherViewController tabOverviewIsVisible])
    {
      id v5 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[BrowserRootViewController _tabSwitcherVisibilityDidChange:](v5);
      }
    }
  }
}

- (id)borrowCapsuleViewForTab:(id)a3
{
  id v4 = a3;
  id v5 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  int v6 = v5;
  if (!v5
    || [v5 selectedItemState]
    || [v6 layoutStyle] == 1 && !objc_msgSend(v6, "selectionGestureState")
    || (int64_t v9 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController collectionViewIndexOfTab:v4], v9 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v7 = 0;
  }
  else
  {
    CGRect v10 = [v6 detachViewForItemAtIndex:v9];
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F781F0]);
      [v6 capsuleFrame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v20 = [(BrowserRootViewController *)self view];
      [v20 bounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v29 = [(BrowserRootViewController *)self capsuleCollectionViewLayout];
      id v7 = objc_msgSend(v11, "initWithView:capsuleReferenceFrame:referenceBounds:shouldClipView:", v10, WBSIsEqual(), v13, v15, v17, v19, v22, v24, v26, v28);
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (void)relinquishBorrowedCapsuleView:(id)a3
{
  capsuleViewController = self->_capsuleViewController;
  id v4 = a3;
  id v5 = [(CapsuleNavigationBarViewController *)capsuleViewController capsuleCollectionView];
  [v5 reattachView:v4];
}

- (void)tabOverviewVisibilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = WBS_LOG_CHANNEL_PREFIXTabView();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"not visible";
    if (v3) {
      int v6 = @"visible";
    }
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Tab overview changed to %@", (uint8_t *)&v10, 0xCu);
  }
  if (v3)
  {
    double v7 = 0.0;
    if (![(TabSwitcherViewController *)self->_tabSwitcherViewController presentationState])
    {
      double v8 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BrowserRootViewController tabOverviewVisibilityDidChange:](v8);
      }
    }
  }
  else
  {
    double v7 = 0.1;
  }
  int64_t v9 = [(CapsuleNavigationBarViewController *)self->_capsuleViewController capsuleCollectionView];
  [v9 setUserInteractionEnabled:v3 ^ 1];
  [v9 setShouldDismissContent:v3 withDelay:v7];
}

- (void)toggleSidebar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained toggleBookmarksPresentation];
}

- (UIView)transitionViewForReducedMotion
{
  return (UIView *)self->_contentContainerView;
}

- (id)showTabGroupPicker:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  int v6 = [WeakRetained showTabGroupPicker:v4];

  return v6;
}

- (void)takeOwnershipOfStepperContainer:(id)a3
{
  id v5 = a3;
  if (!self->_stepperContainer)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_stepperContainer, a3);
    int v6 = [(BrowserRootViewController *)self view];
    [v8 bounds];
    objc_msgSend(v6, "convertRect:fromView:", v8);
    objc_msgSend(v8, "setFrame:");

    double v7 = [(BrowserRootViewController *)self view];
    [v7 addSubview:v8];
  }
  MEMORY[0x1F4181820]();
}

- (SidebarUIProxyDelegate)sidebarUIProxyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidebarUIProxyDelegate);
  return (SidebarUIProxyDelegate *)WeakRetained;
}

- (SidebarViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (int64_t)sidebarStyle
{
  return self->_sidebarStyle;
}

- (void)setScreenTimeOverlayViewController:(id)a3
{
}

- (_SFBrowserConfiguration)configuration
{
  return self->_configuration;
}

- (BrowserRootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BrowserRootViewControllerDelegate *)WeakRetained;
}

- (UIViewController)contentContainerViewController
{
  return self->_contentContainerViewController;
}

- (UIViewController)documentAndTopBarsContainerViewController
{
  return self->_documentAndTopBarsContainerViewController;
}

- (UIView)tabBarClipperView
{
  return self->_tabBarClipperView;
}

- (UIView)clipperView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clipperView);
  return (UIView *)WeakRetained;
}

- (void)setClipperView:(id)a3
{
}

- (BOOL)barStateAllowsHidingHomeIndicator
{
  return self->_barStateAllowsHidingHomeIndicator;
}

- (BrowserToolbar)bottomToolbar
{
  return self->_bottomToolbar;
}

- (TabHoverPreview)tabHoverPreview
{
  return self->_tabHoverPreview;
}

- (SFBannerTheme)bannerTheme
{
  return self->_bannerTheme;
}

- (BOOL)pullToRefreshIsEnabled
{
  return self->_pullToRefreshIsEnabled;
}

- (UIBarButtonItem)sidebarButtonItem
{
  return self->_sidebarButtonItem;
}

- (UIBarButtonItem)sidebarTrailingButtonItem
{
  return self->_sidebarTrailingButtonItem;
}

- (UIButton)floatingSidebarButton
{
  return self->_floatingSidebarButton;
}

- (UIButton)sidebarButtonEmbeddedInSidebar
{
  return self->_sidebarButtonEmbeddedInSidebar;
}

- (SidebarContentDimmingView)sidebarContentDimmingView
{
  return self->_sidebarContentDimmingView;
}

- (void)setKeepBarsMinimized:(BOOL)a3
{
  self->_keepBarsMinimized = a3;
}

- (BOOL)isTogglingTabBar
{
  return self->_togglingTabBar;
}

- (void)setTogglingTabBar:(BOOL)a3
{
  self->_togglingTabBar = a3;
}

- (BOOL)usesFaintTopSeparator
{
  return self->_usesFaintTopSeparator;
}

- (BOOL)isPerformingSizeTransition
{
  return self->_isPerformingSizeTransition;
}

- (_SFWebView)webView
{
  return self->_webView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)documentSafeAreaInsetsFrozen
{
  return self->_documentSafeAreaInsetsFrozen;
}

- (BOOL)needsScrollToTopView
{
  return self->_needsScrollToTopView;
}

- (SFLockedPrivateBrowsingView)lockedPrivateBrowsingView
{
  return self->_lockedPrivateBrowsingView;
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (TabThumbnailCollectionView)tabThumbnailCollectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabThumbnailCollectionView);
  return (TabThumbnailCollectionView *)WeakRetained;
}

- (SFWebpageStatusBarView)statusBarView
{
  return self->_statusBarView;
}

- (id)intentInteractionCompletion
{
  return self->_intentInteractionCompletion;
}

- (void)setIntentInteractionCompletion:(id)a3
{
}

- (SFTipsCoordinator)tipsCoordinator
{
  return self->_tipsCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipsCoordinator, 0);
  objc_storeStrong(&self->_intentInteractionCompletion, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_tabSwitcherViewController, 0);
  objc_destroyWeak((id *)&self->_tabThumbnailCollectionView);
  objc_storeStrong((id *)&self->_catalogViewController, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_sidebarButtonEmbeddedInSidebar, 0);
  objc_storeStrong((id *)&self->_floatingSidebarButton, 0);
  objc_storeStrong((id *)&self->_sidebarTrailingButtonItem, 0);
  objc_storeStrong((id *)&self->_sidebarButtonItem, 0);
  objc_storeStrong((id *)&self->_bannerTheme, 0);
  objc_storeStrong((id *)&self->_capsuleViewController, 0);
  objc_storeStrong((id *)&self->_tabBarManager, 0);
  objc_storeStrong((id *)&self->_unifiedBar, 0);
  objc_storeStrong((id *)&self->_tabHoverPreview, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_dynamicBarAnimator, 0);
  objc_storeStrong((id *)&self->_bottomToolbar, 0);
  objc_storeStrong((id *)&self->_bookmarksBar, 0);
  objc_destroyWeak((id *)&self->_clipperView);
  objc_storeStrong((id *)&self->_tabBarClipperView, 0);
  objc_storeStrong((id *)&self->_documentAndTopBarsContainerViewController, 0);
  objc_storeStrong((id *)&self->_contentContainerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_destroyWeak((id *)&self->_sidebarUIProxyDelegate);
  objc_storeStrong((id *)&self->_exitYttriumStateRecognizer, 0);
  objc_storeStrong((id *)&self->_enterYttriumStateRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomContentGestureBlocker, 0);
  objc_storeStrong((id *)&self->_webSearchTipViewController, 0);
  objc_storeStrong((id *)&self->_defaultBrowserViewController, 0);
  objc_destroyWeak((id *)&self->_defaultBrowserSheet);
  objc_destroyWeak((id *)&self->_privateBrowsingExplanationSheet);
  objc_storeStrong((id *)&self->_currentlyPresentedToastViewController, 0);
  objc_storeStrong((id *)&self->_statusBarHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sidebarButtonEmbeddedInUnifiedBar, 0);
  objc_storeStrong((id *)&self->_sidebarTrailingButton, 0);
  objc_storeStrong((id *)&self->_sidebarContentDimmingView, 0);
  objc_storeStrong((id *)&self->_hideNavigationBarGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_showBarsFromBottomBarRecognizer, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_topBackdropTheme, 0);
  objc_storeStrong((id *)&self->_topBackdrop, 0);
  objc_storeStrong((id *)&self->_touchDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_documentAndTopBarsContainerView, 0);
  objc_storeStrong((id *)&self->_scrollToTopView, 0);
  objc_storeStrong((id *)&self->_topAuxiliaryBarsContainerView, 0);
  objc_storeStrong((id *)&self->_tabBarDropExpansionView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_touchUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stepperContainer, 0);
}

- (void)presentViewController:(void *)a1 animated:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [a1 presentingViewController];
  OUTLINED_FUNCTION_0_2();
  int v10 = v5;
  __int16 v11 = v7;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_1E102C000, v3, OS_LOG_TYPE_ERROR, "Trying to present %{public}@ from %{public}@ (pre-dismiss) when it is already presented by: %{public}@", v9, 0x20u);
}

void __71__BrowserRootViewController_presentViewController_animated_completion___block_invoke_cold_1(id *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  __int16 v7 = [*a1 presentingViewController];
  OUTLINED_FUNCTION_0_2();
  __int16 v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_error_impl(&dword_1E102C000, v4, OS_LOG_TYPE_ERROR, "Trying to present %{public}@ from %{public}@ (post-dismiss) when it is already presented by: %{public}@", v10, 0x20u);
}

void __114__BrowserRootViewController_capsuleNavigationBarViewController_selectedItemWillChangeToState_options_coordinator___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1E102C000, log, OS_LOG_TYPE_FAULT, "Failed to obtain source view for Web Search Tip Popover", v1, 2u);
}

- (void)_tabSwitcherVisibilityDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Tab switcher dismissed while tab overview is still visible", v1, 2u);
}

- (void)tabOverviewVisibilityDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1E102C000, log, OS_LOG_TYPE_FAULT, "Tab overview became visible while tab switcher is not presented", v1, 2u);
}

@end