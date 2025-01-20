@interface PXGView
+ (BOOL)forceAccessibilityEnabled;
+ (NSString)allDescriptions;
+ (id)debugHierarchyChildGroupingID;
+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (int64_t)screenPixelCount;
+ (unint64_t)supportLevel;
+ (void)enumerateAllViewsUsingBlock:(id)a3;
+ (void)setForceAccessibilityEnabled:(BOOL)a3;
- ($F86F3654D89882C10874F1715C6C992F)displayConfiguration;
- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode;
- (BOOL)avoidSnapshotOnHeightChanges;
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (BOOL)canBlockMainThreadIfNeeded;
- (BOOL)contentShouldBeObscured;
- (BOOL)disableMetalViewDisplayCompositing;
- (BOOL)enableUnderlaySupport;
- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5;
- (BOOL)exportDebugHierarchyToURL:(id)a3 error:(id *)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)handlePrimaryInteractionAtPoint:(CGPoint)a3;
- (BOOL)hasExtendedColorDisplay;
- (BOOL)isAccessibilityEnabled;
- (BOOL)isAnimatingScrollTowardsEdge;
- (BOOL)isBeingFullPageSnapshotted;
- (BOOL)isFocusFastScrolling;
- (BOOL)isObjectReference:(id)a3 visuallyBeforeObjectReference:(id)a4;
- (BOOL)isSceneBackgrounded;
- (BOOL)isSceneResumingFromBackground;
- (BOOL)isScrolling;
- (BOOL)isVisible;
- (BOOL)lowMemoryModeEnabled;
- (BOOL)managesScrollableAxisExternally;
- (BOOL)resizesDrawableManually;
- (BOOL)shouldReleaseResourcesWhenInvisible;
- (BOOL)shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea;
- (BOOL)shouldWorkaround18475431;
- (BOOL)showDebugHUD;
- (BOOL)showPerspectiveDebug;
- (BOOL)slowAnimationsEnabled;
- (CGImage)textureSnapshotForSpriteReference:(id)a3;
- (CGPoint)convertPoint:(CGPoint)a3 fromLayout:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toLayout:(id)a4;
- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toLayout:(id)a4;
- (MTKView)metalView;
- (NSArray)debugHierarchyIdentifiers;
- (NSDictionary)ppt_currentTestOptions;
- (NSDictionary)ppt_extraResults;
- (NSString)diagnosticDescription;
- (NSString)preferredFileNameForExportingDebugHierarchy;
- (PXAnonymousScrollView)diagnosticsMainScrollView;
- (PXGAXResponder)axNextResponder;
- (PXGAnchor)scrollingAnimationAnchor;
- (PXGEngine)engine;
- (PXGLayout)rootLayout;
- (PXGLayout)rootLayoutIfExists;
- (PXGMetalRenderer)metalRenderer;
- (PXGView)initWithCoder:(id)a3;
- (PXGView)initWithFrame:(CGRect)a3;
- (PXGView)initWithFrame:(CGRect)a3 allowedPresentationTypes:(id)a4;
- (PXGView)initWithFrame:(CGRect)a3 allowedPresentationTypes:(id)a4 displayConfiguration:(id *)a5;
- (PXGViewDiagnosticsSource)diagnosticsSource;
- (PXGViewRenderer)viewRenderer;
- (PXScrollViewController)scrollViewController;
- (PXScrollViewSpeedometer)scrollingSpeedometer;
- (PXUpdater)updater;
- (PXVisualDiagnosticsConfiguration)visualDiagnosticsConfigurationForFullPageSnapshot;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (UIEdgeInsets)hitTestPadding;
- (UIEdgeInsets)minimumSafeAreaInsets;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)entityHostingView;
- (UIWindowScene)windowScene;
- (float)displayScaleMultiplier;
- (id)axContainingScrollViewForAXGroup:(id)a3;
- (id)backgroundColor;
- (id)contentCoordinateSpaceForLayout:(id)a3;
- (id)curatedLibraryHitTestResultsInRect:(CGRect)a3 withControl:(int64_t)a4;
- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3;
- (id)feedHitTestResultAtPoint:(CGPoint)a3;
- (id)feedHitTestResultAtPoint:(CGPoint)a3 ignoringOverlayContent:(BOOL)a4;
- (id)feedHitTestResultsInRect:(CGRect)a3;
- (id)firstCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 withControl:(int64_t)a4;
- (id)handleTouchAtPoint:(CGPoint)a3;
- (id)hitTestResultAtPoint:(CGPoint)a3;
- (id)hitTestResultAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4 passingTest:(id)a5;
- (id)hitTestResultsAtPoint:(CGPoint)a3;
- (id)hitTestResultsAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4 passingTest:(id)a5;
- (id)hitTestResultsAtPoint:(CGPoint)a3 withIdentifiers:(id)a4;
- (id)hitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4;
- (id)hitTestResultsInRect:(CGRect)a3 passingTest:(id)a4;
- (id)layout:(id)a3 viewForSpriteIndex:(unsigned int)a4;
- (id)nextDidLayoutHandler;
- (id)preferredFocusEnvironments;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)regionOfInterestForHitTestResult:(id)a3;
- (id)regionOfInterestForObjectReference:(id)a3;
- (id)regionOfInterestForSpriteReference:(id)a3;
- (id)storyHitTestResultAtPoint:(CGPoint)a3;
- (id)trackingContainerViewForSpriteIndex:(unsigned int)a3;
- (id)viewForSpriteIndex:(unsigned int)a3;
- (id)viewForSpriteReference:(id)a3;
- (unint64_t)offscreenEffectQuality;
- (void)_ensureEndAnimatedScroll;
- (void)_handleSceneDidEnterBackground:(id)a3;
- (void)_handleSceneWillEnterForeground:(id)a3;
- (void)_installNextDidLayoutHandler:(id)a3;
- (void)_invalidateScrollableAxis;
- (void)_setNeedsUpdate;
- (void)_updateAccessibility;
- (void)_updateDebugHUD;
- (void)_updateEngineCanBlockMainThreadIfNeeded;
- (void)_updateEngineLowMemoryMode;
- (void)_updateEngineWindowProperties;
- (void)_updateFocusItemProvider;
- (void)_updateInvertColors;
- (void)_updateIsSceneBackgrounded;
- (void)_updateIsVisible;
- (void)_updateLayoutScreenProperties;
- (void)_updateLayoutViewEnvironment;
- (void)_updateMetalView;
- (void)_updateRectDiagnosticsLayer;
- (void)_updateScrollableAxis;
- (void)_updateUserInterfaceDirection;
- (void)_willChangeBoundsSizeFrom:(CGRect)a3 toBounds:(CGRect)a4;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)disablePreheating;
- (void)engine:(id)a3 updateDebugHUDWithStats:(id *)a4;
- (void)engineDidRender:(id)a3;
- (void)engineSetNeedsUpdate:(id)a3;
- (void)ensureUpdatedLayout;
- (void)enumerateCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 usingBlock:(id)a4;
- (void)enumerateCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 withControls:(id)a4 usingBlock:(id)a5;
- (void)enumerateCuratedLibraryHitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4 usingBlock:(id)a5;
- (void)enumerateCuratedLibraryHitTestResultsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateDebugHierarchyWithIdentifier:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)forceFullUpdate;
- (void)forceUpdate;
- (void)handlePan:(id)a3;
- (void)installAnimationRenderingCompletionHandler:(id)a3;
- (void)installLayoutCompletionHandler:(id)a3;
- (void)installRenderingCompletionHandler:(id)a3;
- (void)notifyContentFullyLoadedWithTimeout:(double)a3 block:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)ppt_cleanUpAfterTest:(id)a3 isScrollTest:(BOOL)a4;
- (void)ppt_prepareForTest:(id)a3 withOptions:(id)a4 isScrollTest:(BOOL)a5;
- (void)ppt_setCurrentTestOptions:(id)a3;
- (void)registerAllTextureProvidersWithMediaProvider:(id)a3;
- (void)registerAllTextureProvidersWithMediaProvider:(id)a3 namedImagesBundle:(id)a4;
- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewControllerDidBeginFocusFastScrolling:(id)a3;
- (void)scrollViewControllerDidEndFocusFastScrolling:(id)a3;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidLayoutSubviews:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4;
- (void)setAdditionalSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3;
- (void)setAvoidSnapshotOnHeightChanges:(BOOL)a3;
- (void)setAxNextResponder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCanBlockMainThreadIfNeeded:(BOOL)a3;
- (void)setContentShouldBeObscured:(BOOL)a3;
- (void)setDiagnosticsSource:(id)a3;
- (void)setDisableMetalViewDisplayCompositing:(BOOL)a3;
- (void)setEnableUnderlaySupport:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsAccessibilityEnabled:(BOOL)a3;
- (void)setIsAnimatingScrollTowardsEdge:(BOOL)a3;
- (void)setIsBeingFullPageSnapshotted:(BOOL)a3;
- (void)setIsFocusFastScrolling:(BOOL)a3;
- (void)setIsSceneBackgrounded:(BOOL)a3;
- (void)setIsSceneResumingFromBackground:(BOOL)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setLowMemoryModeEnabled:(BOOL)a3;
- (void)setManagesScrollableAxisExternally:(BOOL)a3;
- (void)setMinimumSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setNextDidLayoutHandler:(id)a3;
- (void)setOffscreenEffectQuality:(unint64_t)a3;
- (void)setResizesDrawableManually:(BOOL)a3;
- (void)setRootLayout:(id)a3;
- (void)setRootLayoutIfExists:(id)a3;
- (void)setScrollingAnimationAnchor:(id)a3;
- (void)setShouldReleaseResourcesWhenInvisible:(BOOL)a3;
- (void)setShouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea:(BOOL)a3;
- (void)setShouldWorkaround18475431:(BOOL)a3;
- (void)setShowDebugHUD:(BOOL)a3;
- (void)setShowPerspectiveDebug:(BOOL)a3;
- (void)setSlowAnimationsEnabled:(BOOL)a3;
- (void)test_installRenderSnapshotHandler:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXGView

- (void)setCanBlockMainThreadIfNeeded:(BOOL)a3
{
  if (self->_canBlockMainThreadIfNeeded != a3)
  {
    self->_canBlockMainThreadIfNeeded = a3;
    [(PXGView *)self _updateEngineCanBlockMainThreadIfNeeded];
  }
}

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  return 1;
}

- (void)_updateScrollableAxis
{
  if (![(PXGView *)self managesScrollableAxisExternally])
  {
    v3 = [(PXGView *)self rootLayout];
    uint64_t v4 = [v3 scrollableAxis];

    v5 = [(PXGView *)self scrollViewController];
    id v6 = [v5 scrollView];

    [v6 setAlwaysBounceHorizontal:v4 == 2];
    [v6 setAlwaysBounceVertical:v4 == 1];
  }
}

- (BOOL)managesScrollableAxisExternally
{
  return self->_managesScrollableAxisExternally;
}

- (void)_updateLayoutViewEnvironment
{
  uint64_t v4 = [[PXGViewEnvironment alloc] initWithView:self accessibilityEnabled:[(PXGView *)self isAccessibilityEnabled] isBeingFullPageSnapshotted:[(PXGView *)self isBeingFullPageSnapshotted]];
  v3 = [(PXGView *)self engine];
  [v3 setViewEnvironment:v4];
}

- (BOOL)isBeingFullPageSnapshotted
{
  return self->_isBeingFullPageSnapshotted;
}

- (BOOL)isAccessibilityEnabled
{
  return self->_isAccessibilityEnabled;
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setMinimumSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->_minimumSafeAreaInsets.left != a3.left
    || self->_minimumSafeAreaInsets.top != a3.top
    || self->_minimumSafeAreaInsets.right != a3.right
    || self->_minimumSafeAreaInsets.bottom != a3.bottom)
  {
    self->_minimumSafeAreaInsets = a3;
    [(PXGView *)self safeAreaInsetsDidChange];
  }
}

- (void)setAdditionalSafeAreaInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalSafeAreaInsets.left
    || a3.top != self->_additionalSafeAreaInsets.top
    || a3.right != self->_additionalSafeAreaInsets.right
    || a3.bottom != self->_additionalSafeAreaInsets.bottom)
  {
    self->_additionalSafeAreaInsets = a3;
    [(PXGView *)self safeAreaInsetsDidChange];
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGView;
  [(PXGView *)&v3 safeAreaInsetsDidChange];
  [(PXGView *)self safeAreaInsets];
  [(PXGView *)self px_screenScale];
  PXEdgeInsetsRoundToPixel();
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (UIEdgeInsets)safeAreaInsets
{
  v3.receiver = self;
  v3.super_class = (Class)PXGView;
  [(PXGView *)&v3 safeAreaInsets];
  [(PXGView *)self additionalSafeAreaInsets];
  PXEdgeInsetsAdd();
}

- (UIEdgeInsets)minimumSafeAreaInsets
{
  double top = self->_minimumSafeAreaInsets.top;
  double left = self->_minimumSafeAreaInsets.left;
  double bottom = self->_minimumSafeAreaInsets.bottom;
  double right = self->_minimumSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double top = self->_additionalSafeAreaInsets.top;
  double left = self->_additionalSafeAreaInsets.left;
  double bottom = self->_additionalSafeAreaInsets.bottom;
  double right = self->_additionalSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setRootLayout:(id)a3
{
  id v4 = a3;
  v5 = [(PXGView *)self engine];
  id v6 = [v5 layout];

  v7 = [v6 scrollDelegate];

  if (v7)
  {
    v8 = [v6 scrollDelegate];

    if (v8 != self) {
      PXAssertGetLog();
    }
    [v6 setScrollDelegate:0];
  }
  v9 = [v6 viewDelegate];

  if (v9)
  {
    v10 = [v6 viewDelegate];

    if (v10 != self) {
      PXAssertGetLog();
    }
    [v6 setViewDelegate:0];
  }
  v11 = [v6 focusDelegate];

  if (v11)
  {
    v12 = [v6 focusDelegate];

    if (v12 != self) {
      PXAssertGetLog();
    }
    [v6 setFocusDelegate:0];
  }
  v13 = [(PXGView *)self engine];
  [v13 setLayout:v4];

  [(PXGView *)self _updateLayoutScreenProperties];
  [(PXGView *)self _updateUserInterfaceDirection];
  [(PXGView *)self _updateLayoutViewEnvironment];
  [(PXGView *)self _updateFocusItemProvider];
  [(PXGView *)self _updateDebugHUD];
  [v4 setScrollDelegate:self];
  [v4 setViewDelegate:self];
  [v4 setFocusDelegate:self];

  [(PXGView *)self _invalidateScrollableAxis];
}

- (void)engine:(id)a3 updateDebugHUDWithStats:(id *)a4
{
  [(PXGDebugHUDLayer *)self->_debugHUDLayer updateDebugHUDWithStats:a4];
  if (self->_rectDiagnosticsLayer)
  {
    v5 = [(PXGView *)self rootLayout];
    [(PXGRectDiagnosticsLayer *)self->_rectDiagnosticsLayer setLayout:v5];

    rectDiagnosticsLayer = self->_rectDiagnosticsLayer;
    [(PXGRectDiagnosticsLayer *)rectDiagnosticsLayer update];
  }
}

- (void)_updateLayoutScreenProperties
{
  [(PXGView *)self maximumDynamicRangeHeadroom];
  double v4 = v3;
  v5 = [(PXGView *)self rootLayoutIfExists];
  [v5 setDisplayMaximumHeadroom:v4];

  [(PXGView *)self px_screenScale];
  double v7 = v6;
  [(PXGView *)self displayScaleMultiplier];
  double v9 = v7 * v8;
  id v10 = [(PXGView *)self rootLayoutIfExists];
  [v10 setDisplayScale:v9];
}

- (PXGLayout)rootLayoutIfExists
{
  v2 = [(PXGView *)self engine];
  double v3 = [v2 layout];

  return (PXGLayout *)v3;
}

- (PXGLayout)rootLayout
{
  double v4 = [(PXGView *)self engine];
  v5 = [v4 layout];

  if (!v5)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXGView.m", 1266, @"layout not set yet on %@", self object file lineNumber description];
  }
  return (PXGLayout *)v5;
}

- (PXGEngine)engine
{
  return self->_engine;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  id v3 = [a3 scrollController];
  [v3 setNeedsUpdate];
}

- (float)displayScaleMultiplier
{
  return self->_displayScaleMultiplier;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v5 = a3;
  if ([(PXGView *)self isScrolling]
    || [(PXGView *)self isFocusFastScrolling]
    || [(PXGView *)self isAnimatingScrollTowardsEdge]
    || [v5 isAnimatingScroll])
  {
    double v4 = [(PXGView *)self rootLayout];
    [v4 clearLastVisibleAreaAnchoringInformation];
  }
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)isFocusFastScrolling
{
  return self->_isFocusFastScrolling;
}

- (BOOL)isAnimatingScrollTowardsEdge
{
  return self->_isAnimatingScrollTowardsEdge;
}

- (void)_invalidateScrollableAxis
{
  id v2 = [(PXGView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrollableAxis];
}

- (void)scrollViewControllerDidLayoutSubviews:(id)a3
{
  double v4 = [(PXGView *)self updater];
  [v4 updateIfNeeded];

  id v5 = [(PXGView *)self nextDidLayoutHandler];
  if (v5)
  {
    double v6 = v5;
    [(PXGView *)self setNextDidLayoutHandler:0];
    v6[2](v6);
    id v5 = v6;
  }
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)nextDidLayoutHandler
{
  return self->_nextDidLayoutHandler;
}

- (void)_setNeedsUpdate
{
  id v2 = [(PXGView *)self scrollViewController];
  [v2 setNeedsUpdate];
}

- (void)setShouldWorkaround18475431:(BOOL)a3
{
  self->_shouldWorkaround18475431 = a3;
}

- (PXGView)initWithFrame:(CGRect)a3 allowedPresentationTypes:(id)a4 displayConfiguration:(id *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v63[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PXGView;
  v12 = -[PXGView initWithFrame:](&v62, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    [(PXGView *)v12 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    unint64_t var2 = a5->var2;
    *(_OWORD *)&v13->_displayConfiguration.allowHDR = *(_OWORD *)&a5->var0;
    v13->_displayConfiguration.requiredPixelFormat = var2;
    v13->_displayScaleMultiplier = 1.0;
    if (!v11)
    {
      v63[0] = &unk_1F02D9C10;
      v23 = [NSNumber numberWithUnsignedChar:0];
      v63[1] = v23;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    }
    long long v24 = *((_OWORD *)off_1E5DAAF08 + 1);
    *(_OWORD *)&v13->_hitTestPadding.double top = *(_OWORD *)off_1E5DAAF08;
    *(_OWORD *)&v13->_hitTestPadding.double bottom = v24;
    v25 = [MEMORY[0x1E4FB1618] clearColor];
    v61.receiver = v13;
    v61.super_class = (Class)PXGView;
    [(PXGView *)&v61 setBackgroundColor:v25];

    v26 = -[PXUIScrollViewController initWithFrame:]([PXUIScrollViewController alloc], "initWithFrame:", v15, v17, v19, v21);
    [(PXUIScrollViewController *)v26 setChildScrollViewAccessibilityIdentifier:@"content_scroll_view"];
    v27 = [(PXUIScrollViewController *)v26 scrollView];
    [v27 setContentInsetAdjustmentBehavior:1];

    v28 = [(PXUIScrollViewController *)v26 scrollView];
    [v28 _setAutomaticContentOffsetAdjustmentEnabled:0];

    v29 = [(PXUIScrollViewController *)v26 scrollView];
    [v29 _setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:1];

    v30 = [(PXUIScrollViewController *)v26 scrollView];
    [v30 setAutoresizingMask:0];

    v31 = [(PXUIScrollViewController *)v26 scrollView];
    [v31 setClipsToBounds:0];

    p_scrollViewController = (id *)&v13->_scrollViewController;
    objc_storeStrong((id *)&v13->_scrollViewController, v26);
    [(PXScrollViewController *)v13->_scrollViewController setRespectsContentZOrder:1];
    [(PXScrollViewController *)v13->_scrollViewController registerObserver:v13];
    uint64_t v33 = [objc_alloc((Class)off_1E5DA83C8) initWithScrollController:v13->_scrollViewController];
    scrollingSpeedometer = v13->_scrollingSpeedometer;
    v13->_scrollingSpeedometer = (PXScrollViewSpeedometer *)v33;

    v35 = [MEMORY[0x1E4F1CA48] array];
    int v36 = [v11 containsObject:&unk_1F02D9C28];
    if ([v11 containsObject:&unk_1F02D9C10])
    {
      v37 = objc_alloc_init(PXGViewRenderer);
      viewRenderer = v13->_viewRenderer;
      v13->_viewRenderer = v37;

      [(PXGViewRenderer *)v13->_viewRenderer setScrollViewController:*p_scrollViewController];
      [(PXGViewRenderer *)v13->_viewRenderer setShouldSeparateViewLayers:0];
      [(PXGViewRenderer *)v13->_viewRenderer setRootView:v13];
      [v35 addObject:v13->_viewRenderer];
    }
    if (v36)
    {
      v39 = [PXGMetalViewRenderDestination alloc];
      long long v59 = *(_OWORD *)&a5->var0;
      unint64_t v60 = a5->var2;
      v40 = [(PXGMetalViewRenderDestination *)v39 initWithDisplayConfiguration:&v59];
      [(PXGView *)v13 displayScaleMultiplier];
      -[PXGMetalViewRenderDestination setDisplayScaleMultiplier:](v40, "setDisplayScaleMultiplier:");
      v41 = [PXGMetalRenderer alloc];
      uint64_t v42 = [(PXGMetalRenderer *)v41 initWithRenderDestination:v40 layoutQueue:MEMORY[0x1E4F14428]];
      metalRenderer = v13->_metalRenderer;
      v13->_metalRenderer = (PXGMetalRenderer *)v42;

      uint64_t v44 = [(PXGMetalViewRenderDestination *)v40 metalView];
      metalView = v13->_metalView;
      v13->_metalView = (MTKView *)v44;

      [v35 addObject:v13->_metalRenderer];
    }
    v46 = [PXGEngine alloc];
    v47 = objc_alloc_init(PXGAnimator);
    uint64_t v48 = [(PXGEngine *)v46 initWithAnimator:v47 renderers:v35 displayLinkClass:objc_opt_class() layoutQueue:MEMORY[0x1E4F14428]];
    engine = v13->_engine;
    v13->_engine = (PXGEngine *)v48;

    [(PXGEngine *)v13->_engine setScrollController:v26];
    [(PXGEngine *)v13->_engine setScrollViewSpeedometer:v13->_scrollingSpeedometer];
    [(PXGEngine *)v13->_engine setInteractionView:v13];
    [(PXGEngine *)v13->_engine setDelegate:v13];
    v50 = [(PXGEngine *)v13->_engine coalescingAXResponder];
    [v50 setAxNextResponder:v13];

    v13->_canBlockMainThreadIfNeeded = [(PXGEngine *)v13->_engine canBlockMainThreadIfNeeded];
    uint64_t v51 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v13 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v13->_updater;
    v13->_updater = (PXUpdater *)v51;

    [(PXUpdater *)v13->_updater addUpdateSelector:sel__updateScrollableAxis];
    if (v36)
    {
      v53 = v13->_metalView;
      [(PXGView *)v13 bounds];
      -[MTKView setFrame:](v53, "setFrame:");
      v54 = [MEMORY[0x1E4FB1618] clearColor];
      [(MTKView *)v53 setBackgroundColor:v54];

      [(MTKView *)v53 setAutoresizingMask:0];
      [(PXGView *)v13 addSubview:v13->_metalView];
    }
    v55 = [*p_scrollViewController scrollView];
    [(PXGView *)v13 addSubview:v55];

    v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v57 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PXGView *)v13 setBackgroundColor:v57];

    [v56 addObserver:v13 selector:sel__updateInvertColors name:*MEMORY[0x1E4FB2450] object:0];
    [v56 addObserver:v13 selector:sel__handleSceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
    [v56 addObserver:v13 selector:sel__handleSceneWillEnterForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];
    v13->_isAccessibilityEnabled = [(id)objc_opt_class() forceAccessibilityEnabled];
    v13->_offscreenEffectQualitdouble y = 3;
  }
  return v13;
}

+ (BOOL)forceAccessibilityEnabled
{
  return s_forceAccessibilityEnabled;
}

- (void)_updateRectDiagnosticsLayer
{
  id v3 = +[PXGRectDiagnosticsLayer layer];
  rectDiagnosticsLayer = self->_rectDiagnosticsLayer;
  self->_rectDiagnosticsLayer = v3;

  id v13 = +[PXGRectDiagnosticsLayer defaultRectDiagnosticsProviders];
  id v5 = [(PXGView *)self diagnosticsSource];

  if (v5)
  {
    double v6 = [(PXGView *)self diagnosticsSource];
    double v7 = [v6 additionalRectDiagnosticsProvidersForView:self];
    uint64_t v8 = [v13 arrayByAddingObjectsFromArray:v7];

    id v9 = (id)v8;
  }
  else
  {
    id v9 = v13;
  }
  id v14 = v9;
  [(PXGRectDiagnosticsLayer *)self->_rectDiagnosticsLayer setRectDiagnosticsProviders:v9];
  [(PXGDebugHUDLayer *)self->_debugHUDLayer zPosition];
  [(PXGRectDiagnosticsLayer *)self->_rectDiagnosticsLayer setZPosition:v10 + -1.0];
  id v11 = [(PXGDebugHUDLayer *)self->_debugHUDLayer superlayer];
  [v11 insertSublayer:self->_rectDiagnosticsLayer below:self->_debugHUDLayer];

  v12 = [(PXGView *)self rootLayout];
  [v12 displayScale];
  -[PXGRectDiagnosticsLayer setContentsScale:](self->_rectDiagnosticsLayer, "setContentsScale:");
}

- (PXGViewDiagnosticsSource)diagnosticsSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diagnosticsSource);
  return (PXGViewDiagnosticsSource *)WeakRetained;
}

- (PXScrollViewSpeedometer)scrollingSpeedometer
{
  return self->_scrollingSpeedometer;
}

- (void)setDiagnosticsSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diagnosticsSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_diagnosticsSource, obj);
    [(PXGView *)self _updateRectDiagnosticsLayer];
    id v5 = obj;
  }
}

- (void)setAxNextResponder:(id)a3
{
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3 namedImagesBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXGView *)self engine];
  [v8 registerAllTextureProvidersWithMediaProvider:v7 namedImagesBundle:v6];
}

- (PXGView)initWithFrame:(CGRect)a3 allowedPresentationTypes:(id)a4
{
  long long v5 = *(_OWORD *)off_1E5DAAFB0;
  uint64_t v6 = *((void *)off_1E5DAAFB0 + 2);
  return -[PXGView initWithFrame:allowedPresentationTypes:displayConfiguration:](self, "initWithFrame:allowedPresentationTypes:displayConfiguration:", a4, &v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXGView)initWithFrame:(CGRect)a3
{
  return -[PXGView initWithFrame:allowedPresentationTypes:](self, "initWithFrame:allowedPresentationTypes:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (int64_t)screenPixelCount
{
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXGView *)self bounds];
  if (width != v9 || height != v8) {
    -[PXGView _willChangeBoundsSizeFrom:toBounds:](self, "_willChangeBoundsSizeFrom:toBounds:");
  }
  v11.receiver = self;
  v11.super_class = (Class)PXGView;
  -[PXGView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setBackgroundColor:(id)a3
{
  long long v5 = (UIColor *)a3;
  uint64_t v6 = self->_backgroundColor;
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(UIColor *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      [(PXGView *)self _updateMetalView];
      v9.receiver = self;
      v9.super_class = (Class)PXGView;
      [(PXGView *)&v9 setBackgroundColor:v5];
    }
  }
}

- (void)_updateMetalView
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXGView *)self metalView];
  if (v3)
  {
    double v28 = 0.0;
    double v29 = 0.0;
    double v26 = 0.0;
    double v27 = 0.0;
    double v4 = [(PXGView *)self backgroundColor];
    long long v5 = [(PXGView *)self traitCollection];
    uint64_t v6 = [v4 resolvedColorWithTraitCollection:v5];

    if (([v6 getRed:&v29 green:&v28 blue:&v27 alpha:&v26] & 1) == 0) {
      PXGTungstenGetLog();
    }
    if (UIAccessibilityIsInvertColorsEnabled())
    {
      id v7 = [(PXGView *)self traitCollection];
      BOOL v8 = [v7 userInterfaceStyle] == 1;
    }
    else
    {
      BOOL v8 = 0;
    }
    objc_super v9 = [(PXGView *)self metalRenderer];
    [v9 setIsInvertColorsEnabled:v8];

    LODWORD(v9) = v26 == 1.0;
    uint64_t v10 = v9 & ~[(PXGView *)self enableUnderlaySupport];
    if (v10 == 1)
    {
      id v11 = v6;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] clearColor];
    }
    v12 = v11;
    [v3 setBackgroundColor:v11];
    id v13 = [v3 layer];
    [v13 setOpaque:v10];

    if (!v12
      || ([(PXGView *)self metalRenderer],
          id v14 = objc_claimAutoreleasedReturnValue(),
          double v15 = (CGColorSpace *)MEMORY[0x1AD10B240]([v14 destinationColorSpaceName]),
          v14,
          id v16 = v12,
          CGColorGetColorSpace((CGColorRef)[v16 CGColor]),
          (CGColorSpaceEqualToColorSpace() & 1) != 0))
    {
LABEL_23:
      double v23 = v29;
      if (v8)
      {
        double v23 = 1.0 - v29;
        double v24 = 1.0 - v28;
        double v25 = 1.0 - v27;
      }
      else
      {
        double v25 = v27;
        double v24 = v28;
      }
      objc_msgSend(v3, "setClearColor:", v23 * v26, v24 * v26, v25 * v26);
      [(PXGView *)self displayConfiguration];
      PXGPixelFormatNameToMetalFormat();
    }
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v15, kCGRenderingIntentDefault, (CGColorRef)[v16 CGColor], 0);
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
    if (NumberOfComponents != 3)
    {
      if (NumberOfComponents == 2)
      {
        CGFloat v21 = Components[1];
        double v27 = *Components;
        double v28 = v27;
        double v29 = v27;
      }
      else
      {
        if (NumberOfComponents == 1)
        {
          double v27 = *Components;
          double v28 = v27;
          double v29 = v27;
LABEL_17:
          double v26 = 1.0;
LABEL_22:
          CGColorRelease(CopyByMatchingToColorSpace);
          goto LABEL_23;
        }
        if (NumberOfComponents < 4) {
          goto LABEL_22;
        }
        double v22 = *Components;
        double v28 = Components[1];
        double v29 = v22;
        CGFloat v21 = Components[3];
        double v27 = Components[2];
      }
      double v26 = v21;
      goto LABEL_22;
    }
    double v20 = *Components;
    double v28 = Components[1];
    double v29 = v20;
    double v27 = Components[2];
    goto LABEL_17;
  }
}

- (PXGMetalRenderer)metalRenderer
{
  return self->_metalRenderer;
}

- (BOOL)hasExtendedColorDisplay
{
  id v2 = [(PXGView *)self traitCollection];
  BOOL v3 = [v2 displayGamut] == 1;

  return v3;
}

- (BOOL)enableUnderlaySupport
{
  return self->_enableUnderlaySupport;
}

- ($F86F3654D89882C10874F1715C6C992F)displayConfiguration
{
  *($C51E2077B87F80227BBF36E385921798 *)retstr = *($C51E2077B87F80227BBF36E385921798 *)((char *)self + 584);
  return self;
}

- (BOOL)contentShouldBeObscured
{
  return self->_contentShouldBeObscured;
}

- (void)_willChangeBoundsSizeFrom:(CGRect)a3 toBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  uint64_t v33 = [(PXGView *)self metalView];
  id v13 = [(PXGView *)self entityHostingView];
  if (v13)
  {
    id v14 = [(PXGView *)self entityHostingView];
    [v14 frame];
    CGFloat v36 = v16;
    CGFloat v37 = v15;
    CGFloat v34 = v18;
    CGFloat v35 = v17;
  }
  else
  {
    [v33 frame];
    CGFloat v36 = v20;
    CGFloat v37 = v19;
    CGFloat v34 = v22;
    CGFloat v35 = v21;
  }

  if ([(PXGView *)self shouldWorkaround18475431])
  {
    v39.origin.CGFloat x = v11;
    v39.origin.CGFloat y = v10;
    v39.size.CGFloat width = v9;
    v39.size.CGFloat height = v8;
    CGRectGetWidth(v39);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGRectGetWidth(v40);
    PXFloatApproximatelyEqualToFloat();
  }
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  v42.origin.CGFloat y = v36;
  v42.origin.CGFloat x = v37;
  v42.size.CGFloat height = v34;
  v42.size.CGFloat width = v35;
  if (!CGRectEqualToRect(v41, v42))
  {
    double v23 = [(PXGView *)self rootLayout];
    double v24 = [v23 createAnchorForVisibleArea];
    id v25 = (id)[v24 autoInvalidate];

    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    double v26 = [(PXGView *)self metalView];

    if (v26)
    {
      double v27 = [(PXGView *)self metalView];
      [v32 addObject:v27];
    }
    double v28 = [(PXGView *)self entityHostingView];

    if (v28)
    {
      double v29 = [(PXGView *)self entityHostingView];
      [v32 addObject:v29];
    }
    v31 = [MEMORY[0x1E4F1CA48] arrayWithArray:v32];
    uint64_t v30 = [(PXGView *)self scrollViewController];
    uint64_t v38 = [v30 scrollView];

    if (v38) {
      objc_msgSend(v31, "addObject:");
    }
    PXIsPhotoPicker();
  }
}

- (MTKView)metalView
{
  return self->_metalView;
}

- (BOOL)resizesDrawableManually
{
  return self->_resizesDrawableManually;
}

- (UIView)entityHostingView
{
  return self->_entityHostingView;
}

- (BOOL)shouldWorkaround18475431
{
  return self->_shouldWorkaround18475431;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGView;
  [(PXGView *)&v3 tintColorDidChange];
  [(PXGView *)self _updateLayoutViewEnvironment];
}

- (void)didMoveToWindow
{
  [(PXGView *)self _updateIsSceneBackgrounded];
  [(PXGView *)self _updateLayoutScreenProperties];
  [(PXGView *)self _updateLayoutViewEnvironment];
  if ([(PXGView *)self isVisible])
  {
    [(PXGView *)self _updateIsVisible];
  }
  else
  {
    objc_super v3 = self;
    double v4 = +[PXPreloadScheduler sharedScheduler];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __26__PXGView_didMoveToWindow__block_invoke;
    v6[3] = &unk_1E5DD36F8;
    v6[4] = v3;
    [v4 scheduleTaskAfterCATransactionCommits:v6];
  }
  long long v5 = [(PXGView *)self engine];
  [v5 setDidChangeWindow:1];

  [(PXGView *)self _updateEngineWindowProperties];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXGView;
  id v4 = a3;
  [(PXGView *)&v7 traitCollectionDidChange:v4];
  long long v5 = [(PXGView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PXGView *)self _updateMetalView];
  }
  [(PXGView *)self _updateLayoutViewEnvironment];
}

- (void)_updateIsVisible
{
  BOOL v3 = [(PXGView *)self isVisible];
  id v4 = [(PXGView *)self engine];
  [v4 setVisible:v3];
}

- (BOOL)isVisible
{
  uint64_t v3 = [(PXGView *)self window];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [(PXGView *)self isHidden];

    if (v5) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PXGView *)self isSceneBackgrounded];
    }
  }
  return v3;
}

- (BOOL)isSceneBackgrounded
{
  return self->_isSceneBackgrounded;
}

- (void)_updateIsSceneBackgrounded
{
  uint64_t v3 = [(PXGView *)self windowScene];
  if (v3)
  {
    id v4 = v3;
    -[PXGView setIsSceneBackgrounded:](self, "setIsSceneBackgrounded:", [v3 activationState] == 2);
    uint64_t v3 = v4;
  }
}

- (UIWindowScene)windowScene
{
  id v2 = [(PXGView *)self window];
  uint64_t v3 = [v2 windowScene];

  return (UIWindowScene *)v3;
}

- (void)setIsSceneBackgrounded:(BOOL)a3
{
  BOOL isSceneBackgrounded = self->_isSceneBackgrounded;
  if (isSceneBackgrounded != a3)
  {
    self->_BOOL isSceneBackgrounded = a3;
    [(PXGView *)self setIsSceneResumingFromBackground:isSceneBackgrounded];
    [(PXGView *)self _updateIsVisible];
  }
}

- (void)_updateEngineWindowProperties
{
  id v5 = [(PXGView *)self window];
  uint64_t v3 = [v5 screen];
  id v4 = [(PXGView *)self engine];
  [v4 setScreen:v3];
}

- (void)setDisableMetalViewDisplayCompositing:(BOOL)a3
{
  if (self->_disableMetalViewDisplayCompositing != a3)
  {
    BOOL v3 = a3;
    self->_disableMetalViewDisplayCompositing = a3;
    id v4 = [(PXGView *)self engine];
    [v4 setDisableMetalViewDisplayCompositing:v3];
  }
}

- (void)installLayoutCompletionHandler:(id)a3
{
}

- (void)_updateUserInterfaceDirection
{
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXGView semanticContentAttribute](self, "semanticContentAttribute")))
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [(PXGView *)self ppt_currentTestOptions];
    id v5 = [v4 objectForKeyedSubscript:@"forceRTL"];
    uint64_t v3 = [v5 BOOLValue];
  }
  id v6 = [(PXGView *)self rootLayout];
  [v6 setUserInterfaceDirection:v3];
}

- (NSDictionary)ppt_currentTestOptions
{
  return self->_ppt_currentTestOptions;
}

- (void)_updateFocusItemProvider
{
  id v11 = [(PXGView *)self scrollViewController];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v9 = (objc_class *)objc_opt_class();
    CGFloat v8 = NSStringFromClass(v9);
    CGFloat v10 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:a2, self, @"PXGView.m", 1383, @"%@ should be an instance inheriting from %@, but it is %@", @"self.scrollViewController", v8, v10 object file lineNumber description];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v7 = (objc_class *)objc_opt_class();
    CGFloat v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PXGView.m", 1383, @"%@ should be an instance inheriting from %@, but it is nil", @"self.scrollViewController", v8 object file lineNumber description];
  }

LABEL_3:
  id v4 = [(PXGView *)self rootLayout];
  id v5 = [v4 axGroup];
  [v11 setFocusItemProvider:v5];
}

- (void)_updateDebugHUD
{
  id v4 = [off_1E5DA9658 sharedInstance];
  if ([v4 wantsStatsDebugHUD]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v4 wantsRectDiagnosticsDebugHUD];
  }
  [(PXGView *)self setShowDebugHUD:v3];
}

- (void)setShowDebugHUD:(BOOL)a3
{
  if (self->_showDebugHUD != a3)
  {
    BOOL v3 = a3;
    self->_showDebugHUD = a3;
    [(PXGDebugHUDLayer *)self->_debugHUDLayer removeFromSuperlayer];
    [(PXGRectDiagnosticsLayer *)self->_rectDiagnosticsLayer removeFromSuperlayer];
    debugHUDLayer = self->_debugHUDLayer;
    self->_debugHUDLayer = 0;

    rectDiagnosticsLayer = self->_rectDiagnosticsLayer;
    self->_rectDiagnosticsLayer = 0;

    if (v3)
    {
      objc_super v7 = +[PXGDebugHUDLayer layer];
      CGFloat v8 = self->_debugHUDLayer;
      self->_debugHUDLayer = v7;

      CGFloat v9 = [(PXGView *)self scrollViewController];
      CGFloat v10 = [v9 scrollView];
      [v10 safeAreaInsets];
      double v12 = v11;
      double v14 = v13;

      -[PXGDebugHUDLayer setFrame:](self->_debugHUDLayer, "setFrame:", v14, v12, 100.0, 100.0);
      double v15 = [(PXGView *)self layer];
      [v15 addSublayer:self->_debugHUDLayer];

      double v16 = [(PXGView *)self rootLayout];
      [v16 displayScale];
      -[PXGDebugHUDLayer setContentsScale:](self->_debugHUDLayer, "setContentsScale:");

      double v17 = [(PXGView *)self engine];
      [v17 setStatsTrackingEnabled:1];

      [(PXGView *)self _updateRectDiagnosticsLayer];
    }
  }
}

- (PXVisualDiagnosticsConfiguration)visualDiagnosticsConfigurationForFullPageSnapshot
{
  id v2 = self;
  id v3 = PXGView.visualDiagnosticsConfigurationForFullPageSnapshot.getter();

  return (PXVisualDiagnosticsConfiguration *)v3;
}

- (id)curatedLibraryHitTestResultsInRect:(CGRect)a3 withControl:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v10 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__PXGView_PXCuratedLibraryHitTestResultExtensions__curatedLibraryHitTestResultsInRect_withControl___block_invoke;
  v13[3] = &unk_1E5DB0330;
  int64_t v15 = a4;
  id v11 = v10;
  id v14 = v11;
  -[PXGView enumerateCuratedLibraryHitTestResultsInRect:usingBlock:](self, "enumerateCuratedLibraryHitTestResultsInRect:usingBlock:", v13, x, y, width, height);

  return v11;
}

void __99__PXGView_PXCuratedLibraryHitTestResultExtensions__curatedLibraryHitTestResultsInRect_withControl___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 control] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)enumerateCuratedLibraryHitTestResultsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  CGFloat v10 = -[PXGView hitTestResultsInRect:passingTest:](self, "hitTestResultsInRect:passingTest:", 0, x, y, width, height);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInRect_usingBlock___block_invoke;
  v12[3] = &unk_1E5DB5328;
  id v13 = v9;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __107__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInRect_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateCuratedLibraryHitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = [(PXGView *)self hitTestResultsInDirection:a3 fromSpriteReference:a4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __132__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke;
    v10[3] = &unk_1E5DB5328;
    id v11 = v8;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

void __132__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsInDirection_fromSpriteReference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)firstCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 withControl:(int64_t)a4
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CGFloat v10 = __Block_byref_object_copy__14323;
  id v11 = __Block_byref_object_dispose__14324;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__PXGView_PXCuratedLibraryHitTestResultExtensions__firstCuratedLibraryHitTestResultsAtPoint_withControl___block_invoke;
  v6[3] = &unk_1E5DB0308;
  v6[4] = &v7;
  void v6[5] = a4;
  -[PXGView enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:](self, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v6, a3.x, a3.y);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __105__PXGView_PXCuratedLibraryHitTestResultExtensions__firstCuratedLibraryHitTestResultsAtPoint_withControl___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 control] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)enumerateCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 withControls:(id)a4 usingBlock:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __121__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_withControls_usingBlock___block_invoke;
  v13[3] = &unk_1E5DB02E0;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  -[PXGView enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:](self, "enumerateCuratedLibraryHitTestResultsAtPoint:usingBlock:", v13, x, y);
}

void __121__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_withControls_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "control"));
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateCuratedLibraryHitTestResultsAtPoint:(CGPoint)a3 usingBlock:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (v7)
  {
    id v8 = -[PXGView hitTestResultsAtPoint:](self, "hitTestResultsAtPoint:", x, y);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __108__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_usingBlock___block_invoke;
    v9[3] = &unk_1E5DB5328;
    id v10 = v7;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __108__PXGView_PXCuratedLibraryHitTestResultExtensions__enumerateCuratedLibraryHitTestResultsAtPoint_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)handleTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[PXGView feedHitTestResultAtPoint:](self, "feedHitTestResultAtPoint:");
  id v7 = [v6 touchAction];
  if (v7)
  {
    id v8 = [v6 layout];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(PXGView *)self rootLayout];
    }
    id v12 = v10;

    -[PXGView convertPoint:toLayout:](self, "convertPoint:toLayout:", v12, x, y);
    id v11 = ((void (**)(void, void *))v7)[2](v7, v12);
  }
  else
  {
    id v11 = 0;
  }
  id v13 = _Block_copy(v11);

  return v13;
}

- (BOOL)handlePrimaryInteractionAtPoint:(CGPoint)a3
{
  id v3 = -[PXGView feedHitTestResultAtPoint:](self, "feedHitTestResultAtPoint:", a3.x, a3.y);
  uint64_t v4 = [v3 primaryAction];
  id v5 = (void *)v4;
  if (v4) {
    char v6 = (*(uint64_t (**)(uint64_t))(v4 + 16))(v4);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)feedHitTestResultsInRect:(CGRect)a3
{
  id v3 = -[PXGView hitTestResultsInRect:passingTest:](self, "hitTestResultsInRect:passingTest:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_48];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

uint64_t __44__PXGView_PXFeed__feedHitTestResultsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)feedHitTestResultAtPoint:(CGPoint)a3 ignoringOverlayContent:(BOOL)a4
{
  if (a4) {
    -[PXGView hitTestResultAtPoint:padding:passingTest:](self, "hitTestResultAtPoint:padding:passingTest:", &__block_literal_global_38604, a3.x, a3.y, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  }
  else {
  uint64_t v4 = -[PXGView hitTestResultAtPoint:](self, "hitTestResultAtPoint:", a3.x, a3.y);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

uint64_t __67__PXGView_PXFeed__feedHitTestResultAtPoint_ignoringOverlayContent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 leafSublayoutForSpriteIndex:a2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)feedHitTestResultAtPoint:(CGPoint)a3
{
  return -[PXGView feedHitTestResultAtPoint:ignoringOverlayContent:](self, "feedHitTestResultAtPoint:ignoringOverlayContent:", 0, a3.x, a3.y);
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  -[PXGView convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v8, x, y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(PXGView *)self bounds];
  v18.double x = v11;
  v18.double y = v13;
  if (CGRectContainsPoint(v19, v18))
  {
    id v14 = objc_alloc_init(PXDiagnosticsItemProvider);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__PXGView_PXDiagnostics__px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
    v16[3] = &unk_1E5DD2988;
    v16[4] = self;
    [(PXDiagnosticsItemProvider *)v14 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierTungstenView" loadHandler:v16];
    [v9 addObject:v14];
    [(PXGView *)self rootLayout];
    objc_claimAutoreleasedReturnValue();
    PXRectWithOriginAndSize();
  }
  return v9;
}

id __80__PXGView_PXDiagnostics__px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_destroyWeak((id *)&self->_diagnosticsSource);
  objc_storeStrong((id *)&self->_rootLayoutIfExists, 0);
  objc_storeStrong(&self->_nextDidLayoutHandler, 0);
  objc_storeStrong((id *)&self->_ppt_currentTestOptions, 0);
  objc_storeStrong((id *)&self->_scrollingAnimationAnchor, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_storeStrong((id *)&self->_entityHostingView, 0);
  objc_storeStrong((id *)&self->_viewRenderer, 0);
  objc_storeStrong((id *)&self->_metalRenderer, 0);
  objc_storeStrong((id *)&self->_scrollingSpeedometer, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_coalescingAXResponder, 0);
  objc_storeStrong((id *)&self->_rectDiagnosticsLayer, 0);
  objc_storeStrong((id *)&self->_debugHUDLayer, 0);
}

- (void)setManagesScrollableAxisExternally:(BOOL)a3
{
  self->_managesScrollableAxisExternalldouble y = a3;
}

- (void)setAvoidSnapshotOnHeightChanges:(BOOL)a3
{
  self->_avoidSnapshotOnHeightChanges = a3;
}

- (BOOL)avoidSnapshotOnHeightChanges
{
  return self->_avoidSnapshotOnHeightChanges;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (BOOL)disableMetalViewDisplayCompositing
{
  return self->_disableMetalViewDisplayCompositing;
}

- (void)setResizesDrawableManually:(BOOL)a3
{
  self->_resizesDrawableManualldouble y = a3;
}

- (BOOL)shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea
{
  return self->_shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea;
}

- (unint64_t)offscreenEffectQuality
{
  return self->_offscreenEffectQuality;
}

- (BOOL)showPerspectiveDebug
{
  return self->_showPerspectiveDebug;
}

- (BOOL)showDebugHUD
{
  return self->_showDebugHUD;
}

- (UIEdgeInsets)hitTestPadding
{
  double top = self->_hitTestPadding.top;
  double left = self->_hitTestPadding.left;
  double bottom = self->_hitTestPadding.bottom;
  double right = self->_hitTestPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setRootLayoutIfExists:(id)a3
{
}

- (BOOL)isSceneResumingFromBackground
{
  return self->_isSceneResumingFromBackground;
}

- (void)setIsAccessibilityEnabled:(BOOL)a3
{
  self->_isAccessibilityEnabled = a3;
}

- (void)setNextDidLayoutHandler:(id)a3
{
}

- (PXGAnchor)scrollingAnimationAnchor
{
  return self->_scrollingAnimationAnchor;
}

- (void)setIsAnimatingScrollTowardsEdge:(BOOL)a3
{
  self->_isAnimatingScrollTowardsEdge = a3;
}

- (void)setIsFocusFastScrolling:(BOOL)a3
{
  self->_isFocusFastScrolling = a3;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (PXGViewRenderer)viewRenderer
{
  return self->_viewRenderer;
}

- (BOOL)lowMemoryModeEnabled
{
  return self->_lowMemoryModeEnabled;
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

- (BOOL)canBlockMainThreadIfNeeded
{
  return self->_canBlockMainThreadIfNeeded;
}

- (void)setIsBeingFullPageSnapshotted:(BOOL)a3
{
  if (self->_isBeingFullPageSnapshotted != a3)
  {
    self->_isBeingFullPageSnapshotted = a3;
    [(PXGView *)self _updateLayoutViewEnvironment];
  }
}

- (void)forceFullUpdate
{
  id v3 = [(PXGView *)self engine];
  [v3 setWantsImmediateUpdates:1];

  uint64_t v4 = [(PXGView *)self scrollViewController];
  [v4 scrollViewDidLayout];

  id v6 = [(PXGView *)self metalView];
  id v5 = [v6 delegate];
  [v5 drawInMTKView:v6];
}

- (void)forceUpdate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

void __22__PXGView_forceUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v3;
  }
  else {
    id v2 = 0;
  }

  [v2 forceUpdate];
}

- (void)ensureUpdatedLayout
{
  id v2 = [(PXGView *)self engine];
  [v2 ensureUpdatedLayout];
}

- (id)viewForSpriteReference:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PXGView *)self engine];
    id v6 = [v5 layout];

    if (!v6
      || ([(PXGView *)self engine],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v7 ensureUpdatedLayout],
          v7,
          uint64_t v8 = [v6 spriteIndexForSpriteReference:v4 options:0],
          v8 == -1))
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(PXGView *)self viewForSpriteIndex:v8];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)trackingContainerViewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(PXGView *)self viewRenderer];
  id v5 = [v4 trackingContainerViewForSpriteIndex:v3];

  return v5;
}

- (id)viewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(PXGView *)self viewRenderer];
  id v5 = [v4 viewForSpriteIndex:v3];

  return v5;
}

- (NSDictionary)ppt_extraResults
{
  id v2 = [(PXGView *)self engine];
  uint64_t v3 = (_OWORD *)[v2 stats];
  long long v4 = v3[13];
  v27[12] = v3[12];
  v27[13] = v4;
  v27[14] = v3[14];
  long long v5 = v3[9];
  v27[8] = v3[8];
  v27[9] = v5;
  long long v6 = v3[11];
  v27[10] = v3[10];
  v27[11] = v6;
  long long v7 = v3[5];
  v27[4] = v3[4];
  v27[5] = v7;
  long long v8 = v3[7];
  v27[6] = v3[6];
  v27[7] = v8;
  long long v9 = v3[1];
  v27[0] = *v3;
  v27[1] = v9;
  long long v10 = v3[3];
  v27[2] = v3[2];
  v27[3] = v10;

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (unint64_t i = 0; i != 48; i += 8)
  {
    CGFloat v13 = off_1E5DCC910[i / 8];
    double v14 = *(double *)((char *)&v27[12] + i);
    id v15 = [NSNumber numberWithDouble:*(double *)((char *)&v27[9] + i) * 1000.0];
    double v16 = [NSString stringWithFormat:@"PXTungsten:Update:%@:min", v13];
    [v11 setObject:v15 forKeyedSubscript:v16];

    double v17 = [NSString stringWithFormat:@"PXTungsten:Update:%@:minUnits", v13];
    [v11 setObject:@"ms" forKeyedSubscript:v17];

    CGPoint v18 = [NSNumber numberWithDouble:v14 * 1000.0];
    CGRect v19 = [NSString stringWithFormat:@"PXTungsten:Update:%@:max", v13];
    [v11 setObject:v18 forKeyedSubscript:v19];

    double v20 = [NSString stringWithFormat:@"PXTungsten:Update:%@:maxUnits", v13];
    [v11 setObject:@"ms" forKeyedSubscript:v20];

    uint64_t v21 = *(void *)((char *)&v27[6] + i);
    if (v21 >= 1)
    {
      double v22 = [NSNumber numberWithDouble:*(double *)((char *)&v27[3] + i) / (double)v21 * 1000.0];
      double v23 = [NSString stringWithFormat:@"PXTungsten:Update:%@:mean", v13];
      [v11 setObject:v22 forKeyedSubscript:v23];

      double v24 = [NSString stringWithFormat:@"PXTungsten:Update:%@:meanUnits", v13];
      [v11 setObject:@"ms" forKeyedSubscript:v24];
    }
  }
  id v25 = (void *)[v11 copy];

  return (NSDictionary *)v25;
}

- (void)ppt_setCurrentTestOptions:(id)a3
{
  long long v8 = (NSDictionary *)a3;
  long long v4 = self->_ppt_currentTestOptions;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      long long v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      ppt_currentTestOptions = self->_ppt_currentTestOptions;
      self->_ppt_currentTestOptions = v6;

      [(PXGView *)self _updateUserInterfaceDirection];
    }
  }
}

- (void)ppt_cleanUpAfterTest:(id)a3 isScrollTest:(BOOL)a4
{
  BOOL v4 = a4;
  [(PXGView *)self ppt_setCurrentTestOptions:0];
  if (v4)
  {
    [(PXGView *)self setIsScrolling:0];
  }
}

- (void)ppt_prepareForTest:(id)a3 withOptions:(id)a4 isScrollTest:(BOOL)a5
{
  BOOL v5 = a5;
  [(PXGView *)self ppt_setCurrentTestOptions:a4];
  id v7 = [(PXGView *)self engine];
  long long v8 = (_OWORD *)[v7 stats];
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[6] = 0u;
  v8[7] = 0u;
  v8[8] = 0u;
  v8[9] = 0u;
  v8[10] = 0u;
  v8[11] = 0u;
  v8[12] = 0u;
  v8[13] = 0u;
  v8[14] = 0u;

  if (v5)
  {
    [(PXGView *)self setIsScrolling:1];
  }
}

- (PXAnonymousScrollView)diagnosticsMainScrollView
{
  id v2 = [(PXGView *)self scrollViewController];
  uint64_t v3 = [v2 scrollView];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v5 = [v3 subviews];
  long long v6 = (void *)[v5 mutableCopy];

  while ([v6 count])
  {
    id v7 = objc_msgSend(v6, "px_popFirst");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 addObject:v7];
    }
    long long v8 = [v7 subviews];
    [v6 addObjectsFromArray:v8];
  }
  if ([v4 count])
  {
    if ((unint64_t)[v4 count] >= 2) {
      PXFilter();
    }
    if ((unint64_t)[v4 count] >= 2) {
      PXGTungstenGetLog();
    }
    id v9 = [v4 firstObject];
  }
  else
  {
    id v9 = v3;
  }
  long long v10 = v9;

  return (PXAnonymousScrollView *)v10;
}

void __36__PXGView_diagnosticsMainScrollView__block_invoke()
{
}

- (id)layout:(id)a3 viewForSpriteIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(PXGView *)self rootLayout];

  if (v7 == v6)
  {
    long long v8 = [(PXGView *)self viewForSpriteIndex:v4];
  }
  else
  {
    long long v8 = 0;
  }
  return v8;
}

- (id)contentCoordinateSpaceForLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self rootLayout];

  if (v5 == v4)
  {
    id v7 = [(PXGView *)self scrollViewController];
    id v6 = [v7 contentCoordinateSpace];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)test_installRenderSnapshotHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self engine];
  objc_msgSend(v5, "test_installRenderSnapshotHandler:", v4);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self diagnosticDescription];
  [v4 setObject:v5 forKeyedSubscript:@"Summary"];
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  long long v10 = [(PXGView *)self axNextResponder];
  LOBYTE(a4) = [v10 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return a4;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXGView *)self axNextResponder];
  [v10 axGroup:v9 didChange:a4 userInfo:v8];
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  uint64_t v3 = [(PXGView *)self scrollViewController];
  id v4 = [v3 scrollView];

  return v4;
}

- (void)enumerateDebugHierarchyWithIdentifier:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v49 = a4;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v51 = (char *)a5;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  char v95 = 0;
  v50 = v7;
  if ([v7 isEqualToString:@"PXGViewLayoutsAndSpritesHierarchyIdentifier"])
  {
    id v8 = [(PXGView *)self rootLayout];
    [v8 visibleRect];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v48 = v8;
    double v17 = [(PXGView *)self engine];
    v47 = [v17 textureManager];

    CGPoint v18 = objc_alloc_init(PXDebugHierarchyMutableElement);
    [(PXGView *)self bounds];
    -[PXDebugHierarchyMutableElement setFrame:](v18, "setFrame:");
    id v19 = [(PXGView *)self backgroundColor];
    -[PXDebugHierarchyMutableElement setBackgroundColor:](v18, "setBackgroundColor:", [v19 CGColor]);

    [(PXDebugHierarchyMutableElement *)v18 setName:@"Tungsten Hierarchies"];
    [(PXDebugHierarchyMutableElement *)v18 setCanHaveChildren:1];
    double v20 = (void (**)(char *, PXDebugHierarchyMutableElement *, uint64_t *))(v51 + 16);
    (*((void (**)(char *, PXDebugHierarchyMutableElement *, uint64_t *))v51 + 2))(v51, v18, v93 + 3);
    if (!*((unsigned char *)v93 + 24))
    {
      uint64_t v21 = [(PXDebugHierarchyMutableElement *)v18 identifier];
      [(PXDebugHierarchyMutableElement *)v18 prepareForReuse];
      [(PXGView *)self bounds];
      -[PXDebugHierarchyMutableElement setFrame:](v18, "setFrame:");
      [(PXDebugHierarchyMutableElement *)v18 setName:@"Layouts"];
      [(PXDebugHierarchyMutableElement *)v18 setCanHaveChildren:1];
      [(PXDebugHierarchyMutableElement *)v18 setParentIdentifier:v21];
      (*((void (**)(char *, PXDebugHierarchyMutableElement *, uint64_t *))v51 + 2))(v51, v18, v93 + 3);
      if (!*((unsigned char *)v93 + 24))
      {
        uint64_t v22 = [(PXDebugHierarchyMutableElement *)v18 identifier];
        uint64_t v43 = v21;
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_3;
        aBlock[3] = &unk_1E5DCC7F0;
        id v24 = v23;
        id v90 = v24;
        id v91 = &__block_literal_global_174;
        id v25 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_4;
        v86[3] = &unk_1E5DCC818;
        id v46 = v24;
        id v87 = v46;
        id v88 = &__block_literal_global_174;
        double v26 = _Block_copy(v86);
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_5;
        v78[3] = &unk_1E5DCC840;
        uint64_t v82 = v10;
        uint64_t v83 = v12;
        uint64_t v84 = v14;
        uint64_t v85 = v16;
        id v79 = v47;
        id v27 = v48;
        id v80 = v27;
        id v81 = &__block_literal_global_167;
        double v28 = _Block_copy(v78);
        v25[2](v25, v22, 0);
        double v29 = [off_1E5DA9658 sharedInstance];
        LOBYTE(v22) = [v29 includeLayoutsLocalSpritesInDebugHierarchy];

        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_6;
        v66[3] = &unk_1E5DCC868;
        uint64_t v75 = v10;
        uint64_t v76 = v12;
        uint64_t v30 = v18;
        v67 = v30;
        id v69 = &__block_literal_global_167;
        id v45 = v26;
        id v70 = v45;
        v31 = v51;
        v71 = v31;
        v74 = &v92;
        uint64_t v44 = v25;
        id v72 = v44;
        char v77 = v22;
        id v32 = v27;
        id v68 = v32;
        id v33 = v28;
        id v73 = v33;
        [v32 enumerateDescendantsLayoutsUsingBlock:v66];
        if (!*((unsigned char *)v93 + 24))
        {
          [(PXDebugHierarchyMutableElement *)v30 prepareForReuse];
          [(PXGView *)self bounds];
          -[PXDebugHierarchyMutableElement setFrame:](v30, "setFrame:");
          [(PXDebugHierarchyMutableElement *)v30 setName:@"Sprites"];
          [(PXDebugHierarchyMutableElement *)v30 setCanHaveChildren:1];
          [(PXDebugHierarchyMutableElement *)v30 setParentIdentifier:v43];
          (*v20)(v31, v30, v93 + 3);
          if (!*((unsigned char *)v93 + 24))
          {
            uint64_t v34 = [(PXDebugHierarchyMutableElement *)v30 identifier];
            if (v49) {
              CGFloat v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "numberOfSprites"));
            }
            else {
              CGFloat v35 = 0;
            }
            uint64_t v36 = [v32 numberOfSprites] << 32;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_7;
            v56[3] = &unk_1E5DCC890;
            v57 = v30;
            uint64_t v62 = v34;
            id v59 = v33;
            uint64_t v63 = v10;
            uint64_t v64 = v12;
            char v65 = v49 & 1;
            id v37 = v35;
            id v58 = v37;
            uint64_t v38 = v31;
            unint64_t v60 = v38;
            objc_super v61 = &v92;
            [v32 enumerateSpritesInRange:v36 usingBlock:v56];
            if ((v49 & 1) != 0 && !*((unsigned char *)v93 + 24))
            {
              [v37 sortUsingComparator:&__block_literal_global_188];
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v39 = v37;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v96 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v53;
LABEL_13:
                uint64_t v42 = 0;
                while (1)
                {
                  if (*(void *)v53 != v41) {
                    objc_enumerationMutation(v39);
                  }
                  (*v20)(v38, *(PXDebugHierarchyMutableElement **)(*((void *)&v52 + 1) + 8 * v42), v93 + 3);
                  if (*((unsigned char *)v93 + 24)) {
                    break;
                  }
                  if (v40 == ++v42)
                  {
                    uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v96 count:16];
                    if (v40) {
                      goto LABEL_13;
                    }
                    break;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  _Block_object_dispose(&v92, 8);
}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = a3;
  id v9 = [v5 numberWithUnsignedInteger:a2];
  id v7 = *(void **)(a1 + 32);
  id v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  [v7 setObject:v9 forKeyedSubscript:v8];
}

uint64_t __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = [v1 objectForKeyedSubscript:v2];
  uint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v8 = a2;
  id v9 = a7;
  PXRectWithCenterAndSize();
}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_6(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v5 contentSize];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v5 superlayout];
  uint64_t v13 = v12;
  if (!v12) {
    PXPointSubtract();
  }
  objc_msgSend(v12, "convertRect:fromDescendantLayout:", v5, v6, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [*(id *)(a1 + 32) prepareForReuse];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v15, v17, v19, v21);
  uint64_t v22 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) setName:v22];

  [*(id *)(a1 + 32) setCanHaveChildren:1];
  [*(id *)(a1 + 32) setParentIdentifier:(*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))()];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v23 = [*(id *)(a1 + 32) identifier];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    if (*(unsigned char *)(a1 + 112))
    {
      [*(id *)(a1 + 32) prepareForReuse];
      [*(id *)(a1 + 32) setParentIdentifier:v23];
      id v24 = objc_msgSend(v5, "spriteDataStore", *(void *)off_1E5DAAF78, *((void *)off_1E5DAAF78 + 1), *((void *)off_1E5DAAF78 + 2), *((void *)off_1E5DAAF78 + 3), *((void *)off_1E5DAAF78 + 4), *((void *)off_1E5DAAF78 + 5), *((void *)off_1E5DAAF78 + 6));
      int v25 = [v24 count];
      id v26 = v24;
      uint64_t v27 = [v26 geometries];
      id v28 = v26;
      uint64_t v29 = [v28 styles];
      id v30 = v28;
      uint64_t v31 = [v30 infos];
      objc_msgSend(*(id *)(a1 + 40), "convertPoint:fromLayout:", v5, v6, v7);
      if (v25)
      {
        double v34 = v32;
        double v35 = v33;
        uint64_t v36 = 0;
        while (1)
        {
          if ((*(unsigned int (**)(double, double, double, double))(*(void *)(a1 + 80) + 16))(v34, v35, v6, v7))
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
              break;
            }
          }
          ++v36;
          v31 += 40;
          v29 += 160;
          v27 += 32;
          if (v25 == v36) {
            goto LABEL_11;
          }
        }
        *a3 = 1;
      }
LABEL_11:
    }
  }
}

void __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_7(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, int a8, unsigned char *a9)
{
  unint64_t v14 = HIDWORD(a2);
  id v19 = a7;
  [*(id *)(a1 + 32) prepareForReuse];
  [*(id *)(a1 + 32) setParentIdentifier:*(void *)(a1 + 72)];
  if (v14)
  {
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      if ((*(unsigned int (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(v15, v16, *(double *)(a1 + 80), *(double *)(a1 + 88)))
      {
        if (*(unsigned char *)(a1 + 96))
        {
          double v17 = *(void **)(a1 + 40);
          double v18 = (void *)[*(id *)(a1 + 32) copy];
          [v17 addObject:v18];
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
          {
            *a9 = 1;
            break;
          }
        }
      }
      ++a8;
      a6 += 40;
      a5 += 160;
      a4 += 32;
      --v14;
    }
    while (v14);
  }
}

uint64_t __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 zPosition];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 zPosition];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

id __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = [v2 stringWithFormat:@"%@ (%p)", v5, v3];

  return v6;
}

uint64_t __68__PXGView_enumerateDebugHierarchyWithIdentifier_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F29238] valueWithPointer:a2];
}

- (NSArray)debugHierarchyIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PXGViewLayoutsAndSpritesHierarchyIdentifier";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(PXGView *)self description];
  id v5 = (void *)[v3 initWithString:v4];

  objc_msgSend(v5, "px_removeSuffix:", @">");
  double v6 = [(PXGView *)self rootLayout];
  double v7 = [v6 recursiveDescription];
  [v5 appendFormat:@"\nLayout Hierarchy: {\n%@\n}\n", v7];

  double v8 = (void *)[off_1E5DA6B40 newSpriteDataStore];
  objc_msgSend(v8, "setCount:", objc_msgSend(v6, "numberOfSprites"));
  uint64_t v9 = [v8 count] << 32;
  id v10 = v8;
  uint64_t v11 = [v10 entities];
  id v12 = v10;
  uint64_t v13 = [v12 geometries];
  id v14 = v12;
  uint64_t v15 = [v14 styles];
  id v16 = v14;
  objc_msgSend(v6, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v9, v11, v13, v15, objc_msgSend(v16, "infos"));
  double v17 = [v16 diagnosticDescription];
  [v5 appendFormat:@"\nSprites: { %@ }\n", v17];

  [v16 recycle];
  [v5 appendString:@"\nDescendant Layouts: {\n"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __32__PXGView_diagnosticDescription__block_invoke;
  v20[3] = &unk_1E5DCC760;
  id v18 = v5;
  id v21 = v18;
  [v6 enumerateDescendantsLayoutsUsingBlock:v20];
  [v18 appendString:@"}"];
  [v18 appendString:@">"];

  return (NSString *)v18;
}

void __32__PXGView_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 diagnosticDescription];
  [v2 appendFormat:@"%@\n", v3];
}

- (void)_ensureEndAnimatedScroll
{
  [(PXGView *)self setIsAnimatingScrollTowardsEdge:0];
  [(PXGView *)self setScrollingAnimationAnchor:0];
}

- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4
{
  id v7 = [(PXGView *)self rootLayout];
  [v7 clearLastVisibleAreaAnchoringInformation];
  [(PXGView *)self setIsAnimatingScrollTowardsEdge:1];
  double v6 = [v7 createAnchorForScrollingAnimationTowardsContentEdges:a4];
  [(PXGView *)self setScrollingAnimationAnchor:v6];
}

- (void)scrollViewControllerDidEndFocusFastScrolling:(id)a3
{
  [(PXGView *)self _ensureEndAnimatedScroll];
  [(PXGView *)self setIsFocusFastScrolling:0];
}

- (void)scrollViewControllerDidBeginFocusFastScrolling:(id)a3
{
  [(PXGView *)self _ensureEndAnimatedScroll];
  [(PXGView *)self setIsFocusFastScrolling:1];
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  [(PXGView *)self _ensureEndAnimatedScroll];
  [(PXGView *)self setIsScrolling:0];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  [(PXGView *)self _ensureEndAnimatedScroll];
  [(PXGView *)self setIsScrolling:1];
}

- (void)setSlowAnimationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXGView *)self engine];
  [v4 setSlowAnimationsEnabled:v3];
}

- (BOOL)slowAnimationsEnabled
{
  id v2 = [(PXGView *)self engine];
  char v3 = [v2 slowAnimationsEnabled];

  return v3;
}

- (void)_updateEngineCanBlockMainThreadIfNeeded
{
  BOOL v3 = [(PXGView *)self canBlockMainThreadIfNeeded]
    || [(PXGView *)self isSceneResumingFromBackground];
  id v4 = [(PXGView *)self engine];
  [v4 setCanBlockMainThreadIfNeeded:v3];
}

- (void)engineDidRender:(id)a3
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handlePan:(id)a3
{
  id v6 = a3;
  id v4 = [off_1E5DA9658 sharedInstance];
  if ([v6 state] == 2)
  {
    [v6 translationInView:self];
    objc_msgSend(v4, "setPerspectiveAngle:");
    id v5 = [(PXGView *)self rootLayout];
    [v5 setNeedsUpdate];
  }
}

- (void)setShowPerspectiveDebug:(BOOL)a3
{
  if (self->_showPerspectiveDebug != a3)
  {
    BOOL v3 = a3;
    self->_showPerspectiveDebug = a3;
    id v6 = [off_1E5DA9658 sharedInstance];
    [v6 setWantsPerspectiveDebug:v3];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_handlePan_];
    [v5 setMaximumNumberOfTouches:1];
    [v5 setDelegate:self];
    [(PXGView *)self addGestureRecognizer:v5];
  }
}

- (CGImage)textureSnapshotForSpriteReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self rootLayout];
  uint64_t v6 = [v5 spriteIndexForSpriteReference:v4];

  id v7 = [(PXGView *)self engine];
  double v8 = [v7 textureManager];
  uint64_t v9 = (CGImage *)[v8 textureSnapshotForSpriteIndex:v6];

  return v9;
}

- (BOOL)isObjectReference:(id)a3 visuallyBeforeObjectReference:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXGView.m", 1754, @"Invalid parameter not satisfying: %@", @"objectReference1" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXGView.m", 1755, @"Invalid parameter not satisfying: %@", @"objectReference2" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  id v10 = [(PXGView *)self regionOfInterestForObjectReference:v7];
  uint64_t v11 = [(PXGView *)self regionOfInterestForObjectReference:v9];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    [v10 rectInCoordinateSpace:self];
    PXRectRoundToPixel();
  }
  uint64_t v13 = PLUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    double v20 = v9;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Couldn't find region of interests for visual comparison of %@ with %@", buf, 0x16u);
  }

  return 1;
}

- (id)regionOfInterestForObjectReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self rootLayout];
  uint64_t v6 = [v5 spriteReferenceForObjectReference:v4];

  id v7 = [(PXGView *)self regionOfInterestForSpriteReference:v6];

  return v7;
}

- (id)regionOfInterestForHitTestResult:(id)a3
{
  id v4 = [a3 spriteReference];
  id v5 = [(PXGView *)self regionOfInterestForSpriteReference:v4];

  return v5;
}

- (id)regionOfInterestForSpriteReference:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PXGView *)self engine];
    uint64_t v6 = [v5 layout];

    if (!v6) {
      goto LABEL_5;
    }
    long long v7 = *((_OWORD *)off_1E5DAAF70 + 1);
    long long v24 = *(_OWORD *)off_1E5DAAF70;
    long long v25 = v7;
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v33 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v34 = v8;
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v35 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v36 = v9;
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v29 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v30 = v10;
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v31 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v32 = v11;
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v27 = *(_OWORD *)off_1E5DAAF90;
    long long v28 = v12;
    long long v13 = *((_OWORD *)off_1E5DAAF88 + 1);
    v22[0] = *(_OWORD *)off_1E5DAAF88;
    v22[1] = v13;
    uint64_t v23 = *((void *)off_1E5DAAF88 + 4);
    id v14 = [(PXGView *)self engine];
    int v15 = [v14 copyPresentedSpriteFor:v4 geometry:&v24 style:&v27 info:v22];

    if (v15)
    {
      id v16 = [(PXGView *)self scrollViewController];
      double v17 = [v16 contentCoordinateSpace];

      v21[0] = v24;
      v21[1] = v25;
      v26[6] = v33;
      v26[7] = v34;
      v26[8] = v35;
      v26[9] = v36;
      v26[2] = v29;
      v26[3] = v30;
      v26[4] = v31;
      v26[5] = v32;
      v26[0] = v27;
      v26[1] = v28;
      __int16 v19 = PXGRegionOfInterestForSprite((uint64_t)v21, (float *)v26, v18, v17);
    }
    else
    {
LABEL_5:
      __int16 v19 = 0;
    }
  }
  else
  {
    __int16 v19 = 0;
  }

  return v19;
}

- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  long long v10 = [(PXGView *)self rootLayout];
  objc_msgSend(v10, "convertRect:fromLayout:", v9, x, y, width, height);

  [(PXGView *)self scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

- (CGRect)convertRect:(CGRect)a3 toLayout:(id)a4
{
  id v5 = a4;
  [(PXGView *)self scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v8 = [(PXGView *)self rootLayout];
  objc_msgSend(v8, "convertPoint:fromLayout:", v7, x, y);

  [(PXGView *)self scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayout:(id)a4
{
  id v5 = a4;
  [(PXGView *)self scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3
{
  id v4 = [(PXGView *)self rootLayout];
  uint64_t v5 = [v4 userInterfaceDirection];

  if (v5 == 1) {
    [(PXGView *)self bounds];
  }
  [(PXGView *)self scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (id)hitTestResultsInDirection:(unint64_t)a3 fromSpriteReference:(id)a4
{
  id v5 = a4;
  [(PXGView *)self rootLayout];
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(PXGView *)self regionOfInterestForSpriteReference:v5];

  [v6 rectInCoordinateSpace:self];
  PXRectShrinkToPixel();
}

void __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke(uint64_t a1)
{
}

void __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = a3;
  [v4 scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

BOOL __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_5(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  uint64_t v3 = [a2 tag];
  return v3 == [*(id *)(a1 + 32) tag];
}

uint64_t __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 tag];
  return [v2 hitTestResultForSpriteIndex:v3];
}

void __57__PXGView_hitTestResultsInDirection_fromSpriteReference___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, float *a4, unsigned char *a5)
{
  BOOL v8 = *a4 > 0.0;
  int v9 = a5[1];
  if (v9 == 8) {
    BOOL v8 = *a4 > 0.0 && *a5 == 1;
  }
  uint64_t v11 = *(void *)(a3 + 24);
  if (*(float *)&v11 >= *((float *)&v11 + 1)) {
    LODWORD(v11) = HIDWORD(*(void *)(a3 + 24));
  }
  if (v9 == 2 && *(float *)&v11 > 1.0 && (a5[34] & 2) == 0 && v8)
  {
    id v15 = objc_alloc((Class)off_1E5DA94E8);
    float32x2_t v16 = *(float32x2_t *)(a3 + 24);
    float32x2_t v17 = vmul_f32(v16, (float32x2_t)0x3F0000003F000000);
    id v18 = (id)objc_msgSend(v15, "initWithRect:tag:", a2, *(double *)a3 - v17.f32[0], *(double *)(a3 + 8) - v17.f32[1], v16.f32[0], v16.f32[1]);
    [*(id *)(a1 + 32) addObject:v18];
  }
}

- (id)hitTestResultsInRect:(CGRect)a3 passingTest:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PXGView *)self scrollViewController];
  [(id)objc_claimAutoreleasedReturnValue() contentCoordinateSpace];
  objc_claimAutoreleasedReturnValue();
  PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

void __44__PXGView_hitTestResultsInRect_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, unsigned char *a5, uint64_t a6)
{
  BOOL v8 = *a4 > 0.0;
  if (a5[1] == 8) {
    BOOL v8 = *a4 > 0.0 && *a5 == 1;
  }
  uint64_t v10 = *(void *)(a3 + 24);
  if (*(float *)&v10 >= *((float *)&v10 + 1)) {
    LODWORD(v10) = HIDWORD(*(void *)(a3 + 24));
  }
  if (*(float *)&v10 > 1.0 && (a5[34] & 2) == 0 && v8)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (!v13
      || (*(unsigned int (**)(uint64_t, uint64_t, void, uint64_t))(v13 + 16))(v13, a2, *(void *)(a1 + 32), a6))
    {
      id v14 = [*(id *)(a1 + 32) hitTestResultForSpriteIndex:a2];
      if (v14)
      {
        id v15 = v14;
        [*(id *)(a1 + 40) addObject:v14];
        id v14 = v15;
      }
    }
  }
}

- (id)hitTestResultsAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v10 = [(PXGView *)self rootLayout];
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGView.m" lineNumber:1539 description:@"can't do hit testing without a layout"];
  }
  -[PXGView convertPoint:toLayout:](self, "convertPoint:toLayout:", v10, x, y);
  PXRectWithEdges();
}

uint64_t __53__PXGView_hitTestResultsAtPoint_padding_passingTest___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, float *a4, unsigned char *a5, uint64_t a6)
{
  uint64_t v6 = result;
  BOOL v7 = *a4 > 0.0;
  if (a5[1] == 8) {
    BOOL v7 = *a4 > 0.0 && *a5 == 1;
  }
  uint64_t v9 = *(void *)(a3 + 24);
  float v10 = *((float *)&v9 + 1);
  if (*(float *)&v9 < *((float *)&v9 + 1)) {
    float v10 = *(float *)&v9;
  }
  if (v10 > 1.0 && (a5[34] & 2) == 0 && v7)
  {
    uint64_t v13 = *(void *)(result + 48);
    if (!v13
      || (UIEdgeInsets result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v13 + 16))(v13, a2, *(void *)(v6 + 32), a6), result))
    {
      PXRectWithCenterAndSize();
    }
  }
  return result;
}

- (id)hitTestResultsAtPoint:(CGPoint)a3 withIdentifiers:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(PXGView *)self hitTestPadding];
  long long v12 = -[PXGView hitTestResultsAtPoint:padding:passingTest:](self, "hitTestResultsAtPoint:padding:passingTest:", 0, x, y, v8, v9, v10, v11);
  uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__PXGView_hitTestResultsAtPoint_withIdentifiers___block_invoke;
  v18[3] = &unk_1E5DCC620;
  id v19 = v7;
  id v14 = v7;
  id v15 = [v13 predicateWithBlock:v18];
  float32x2_t v16 = [v12 filteredArrayUsingPredicate:v15];

  return v16;
}

uint64_t __49__PXGView_hitTestResultsAtPoint_withIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)hitTestResultsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXGView *)self hitTestPadding];
  return -[PXGView hitTestResultsAtPoint:padding:passingTest:](self, "hitTestResultsAtPoint:padding:passingTest:", 0, x, y, v6, v7, v8, v9);
}

- (id)hitTestResultAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  uint64_t v10 = [(PXGView *)self rootLayout];
  if (!v10)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGView.m" lineNumber:1483 description:@"can't do hit testing without a layout"];
  }
  -[PXGView convertPoint:toLayout:](self, "convertPoint:toLayout:", v10, x, y);
  PXRectWithEdges();
}

void __52__PXGView_hitTestResultAtPoint_padding_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, unsigned char *a5)
{
  BOOL v5 = *a4 > 0.0;
  if (a5[1] == 8) {
    BOOL v5 = *a4 > 0.0 && *a5 == 1;
  }
  uint64_t v7 = *(void *)(a3 + 24);
  if (*(float *)&v7 >= *((float *)&v7 + 1)) {
    LODWORD(v8) = HIDWORD(*(void *)(a3 + 24));
  }
  else {
    float v8 = *(float *)&v7;
  }
  if (v8 > 1.0 && (a5[34] & 2) == 0 && v5) {
    PXRectWithCenterAndSize();
  }
}

- (id)hitTestResultAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXGView *)self hitTestPadding];
  return -[PXGView hitTestResultAtPoint:padding:passingTest:](self, "hitTestResultAtPoint:padding:passingTest:", 0, x, y, v6, v7, v8, v9);
}

- (void)disablePreheating
{
  id v5 = +[PXGTextureManagerPreheatingStrategy noPreheatingStrategy];
  uint64_t v3 = [(PXGView *)self engine];
  uint64_t v4 = [v3 textureManager];
  [v4 setPreheatingStrategy:v5];
}

- (void)setScrollingAnimationAnchor:(id)a3
{
  id v5 = (PXGAnchor *)a3;
  scrollingAnimationAnchor = self->_scrollingAnimationAnchor;
  if (scrollingAnimationAnchor != v5)
  {
    double v7 = scrollingAnimationAnchor;
    objc_storeStrong((id *)&self->_scrollingAnimationAnchor, a3);
    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __39__PXGView_setScrollingAnimationAnchor___block_invoke;
      v8[3] = &unk_1E5DD36F8;
      double v9 = v7;
      [(PXGView *)self installLayoutCompletionHandler:v8];
    }
  }
}

uint64_t __39__PXGView_setScrollingAnimationAnchor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_installNextDidLayoutHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self nextDidLayoutHandler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PXGView__installNextDidLayoutHandler___block_invoke;
  v8[3] = &unk_1E5DCC5D0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PXGView *)self setNextDidLayoutHandler:v8];
}

uint64_t __40__PXGView__installNextDidLayoutHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_updateEngineLowMemoryMode
{
  BOOL v3 = [(PXGView *)self lowMemoryModeEnabled];
  id v4 = [(PXGView *)self engine];
  [v4 setLowMemoryMode:v3];

  BOOL v5 = [(PXGView *)self allowLargerImagesDuringScrollingInLowMemoryMode];
  id v6 = [(PXGView *)self engine];
  [v6 setAllowLargerImagesDuringScrollingInLowMemoryMode:v5];
}

- (void)setShouldReleaseResourcesWhenInvisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXGView *)self engine];
  [v4 setShouldReleaseResourcesWhenInvisible:v3];
}

- (BOOL)shouldReleaseResourcesWhenInvisible
{
  uint64_t v2 = [(PXGView *)self engine];
  char v3 = [v2 shouldReleaseResourcesWhenInvisible];

  return v3;
}

- (void)installAnimationRenderingCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PXGView *)self engine];
    id v6 = [v5 animationRenderingCompletionHandler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PXGView_installAnimationRenderingCompletionHandler___block_invoke;
    v8[3] = &unk_1E5DCC5D0;
    id v9 = v6;
    id v10 = v4;
    id v7 = v6;
    [v5 setAnimationRenderingCompletionHandler:v8];
  }
}

uint64_t __54__PXGView_installAnimationRenderingCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)installRenderingCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PXGView *)self engine];
    id v6 = [v5 renderingCompletionHandler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PXGView_installRenderingCompletionHandler___block_invoke;
    v8[3] = &unk_1E5DCC5D0;
    id v9 = v6;
    id v10 = v4;
    id v7 = v6;
    [v5 setRenderingCompletionHandler:v8];
  }
}

uint64_t __45__PXGView_installRenderingCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGView *)self engine];
  [v5 registerAllTextureProvidersWithMediaProvider:v4 namedImagesBundle:0];
}

- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(PXGView *)self engine];
  [v7 registerTextureProvider:v6 forMediaKind:v4];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGView;
  [(PXGView *)&v4 setHidden:a3];
  [(PXGView *)self _updateIsVisible];
}

uint64_t __26__PXGView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIsVisible];
}

- (void)setContentShouldBeObscured:(BOOL)a3
{
  if (self->_contentShouldBeObscured != a3)
  {
    self->_contentShouldBeObscured = a3;
    [(PXGView *)self _updateMetalView];
  }
}

- (void)_updateInvertColors
{
  [(PXGView *)self _updateMetalView];
  [(PXGView *)self _updateWolfRendererInvertColors];
}

- (void)_updateAccessibility
{
}

- (NSString)preferredFileNameForExportingDebugHierarchy
{
  id v3 = [NSString alloc];
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = (void *)[v3 initWithFormat:@"%@-%p-%lx.caar", v5, self, objc_msgSend(v6, "hash")];

  return (NSString *)v7;
}

- (BOOL)exportDebugHierarchyToURL:(id)a3 error:(id *)a4
{
  return +[PXDebugHierarchyCAArchiver archiveDebugHierarchyWithIdentifier:@"PXGViewLayoutsAndSpritesHierarchyIdentifier" provider:self toURL:a3 error:a4];
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = [(PXGView *)self rootLayout];
  id v3 = PXGDeepestPreferredFocusEnvironmentsForLayout(v2);

  return v3;
}

- (void)setEnableUnderlaySupport:(BOOL)a3
{
  if (self->_enableUnderlaySupport != a3)
  {
    self->_enableUnderlaySupport = a3;
    [(PXGView *)self _updateMetalView];
  }
}

- (void)notifyContentFullyLoadedWithTimeout:(double)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = [(PXGView *)self engine];
  [v7 notifyContentFullyLoadedWithTimeout:v6 block:a3];
}

- (void)setIsSceneResumingFromBackground:(BOOL)a3
{
  if (self->_isSceneResumingFromBackground != a3)
  {
    self->_isSceneResumingFromBackground = a3;
    if (a3)
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v3, &location);
      px_perform_on_main_runloop();
    }
    [(PXGView *)self _updateEngineCanBlockMainThreadIfNeeded];
  }
}

void __44__PXGView_setIsSceneResumingFromBackground___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsSceneResumingFromBackground:0];
}

- (void)_handleSceneWillEnterForeground:(id)a3
{
  id v5 = [a3 object];
  id v4 = [(PXGView *)self windowScene];
  if (v5 == v4) {
    [(PXGView *)self setIsSceneBackgrounded:0];
  }
}

- (void)_handleSceneDidEnterBackground:(id)a3
{
  id v5 = [a3 object];
  id v4 = [(PXGView *)self windowScene];
  if (v5 == v4) {
    [(PXGView *)self setIsSceneBackgrounded:1];
  }
}

- (void)setOffscreenEffectQuality:(unint64_t)a3
{
  if (self->_offscreenEffectQuality != a3)
  {
    self->_offscreenEffectQualitdouble y = a3;
    if (a3 == 1)
    {
      double v3 = 0.25;
    }
    else if (a3 == 2)
    {
      double v3 = 0.5;
    }
    else
    {
      double v3 = 1.0;
      if (!a3)
      {
        id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.0);
        [v6 handleFailureInMethod:a2 object:self file:@"PXGView.m" lineNumber:658 description:@"Code which should be unreachable has been reached"];

        abort();
      }
    }
    metalRenderer = self->_metalRenderer;
    [(PXGMetalRenderer *)metalRenderer setOffscreenEffectScale:v3];
  }
}

- (void)setLowMemoryModeEnabled:(BOOL)a3
{
  if (self->_lowMemoryModeEnabled != a3)
  {
    self->_lowMemoryModeEnabled = a3;
    [(PXGView *)self _updateEngineLowMemoryMode];
  }
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  if (self->_allowLargerImagesDuringScrollingInLowMemoryMode != a3)
  {
    self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
    [(PXGView *)self _updateEngineLowMemoryMode];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PXGView;
  id v6 = a3;
  [(PXGView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  id v7 = objc_msgSend(v6, "previouslyFocusedItem", v11.receiver, v11.super_class);
  char v8 = [(PXGView *)self px_isAncestorOfFocusEnvironment:v7];

  id v9 = [v6 nextFocusedItem];

  int v10 = [(PXGView *)self px_isAncestorOfFocusEnvironment:v9];
  if ((v8 & 1) != 0 || v10) {
    [(PXGView *)self _updateLayoutViewEnvironment];
  }
}

- (void)setShouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea:(BOOL)a3
{
  if (self->_shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea != a3)
  {
    BOOL v3 = a3;
    self->_shouldScrollViewContentInsetAlwaysAdjustToAvoidSafeArea = a3;
    id v4 = [(PXGView *)self scrollViewController];
    id v6 = [v4 scrollView];

    if (v3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    [v6 setContentInsetAdjustmentBehavior:v5];
    [v6 _setAutomaticContentOffsetAdjustmentEnabled:v3];
    [v6 _setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:v3 ^ 1];
  }
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80)) {
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  [*(id *)(a1 + 40) setShowsVerticalScrollIndicator:0];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  id v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.9999];
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = [*(id *)(a1 + 32) contentMode];
    [*(id *)(a1 + 32) setContentMode:7];
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_4;
    v5[3] = &unk_1E5DD08D8;
    double v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v2;
    [v3 installAnimationRenderingCompletionHandler:v5];
  }
  return [*(id *)(a1 + 48) setShowsVerticalScrollIndicator:1];
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowsVerticalScrollIndicator:0];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  id v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.9999];
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 setShowsVerticalScrollIndicator:1];
}

void __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_64(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) snapshotViewAfterScreenUpdates:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAutoresizingMask:0];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  memset(v6, 0, sizeof(v6));
  id v5 = *(id *)(a1 + 40);
  if ([v5 countByEnumeratingWithState:v6 objects:v7 count:16])
  {
    objc_msgSend(**((id **)&v6[0] + 1), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(void *)&v6[0]);
    PXRectGetCenter();
  }
}

void __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_2_65()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXRectGetCenter();
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_3_66(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeFromSuperview];
}

uint64_t __46__PXGView__willChangeBoundsSizeFrom_toBounds___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentMode:*(void *)(a1 + 40)];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXGView *)self bounds];
  if (width != v9 || height != v8) {
    -[PXGView _willChangeBoundsSizeFrom:toBounds:](self, "_willChangeBoundsSizeFrom:toBounds:");
  }
  v11.receiver = self;
  v11.super_class = (Class)PXGView;
  -[PXGView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WindowFirstResponderObserverContext == a6)
  {
    [(PXGView *)self _updateLayoutViewEnvironment];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXGView;
    -[PXGView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (PXGView)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGView.m", 219, @"%s is not available as initializer", "-[PXGView initWithCoder:]");

  abort();
}

+ (NSString)allDescriptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__PXGView_allDescriptions__block_invoke;
  v6[3] = &unk_1E5DCC788;
  id v4 = v3;
  id v7 = v4;
  [a1 enumerateAllViewsUsingBlock:v6];

  return (NSString *)v4;
}

void __26__PXGView_allDescriptions__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [v5 description];
  [v3 appendString:v4];
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [off_1E5DA9658 sharedInstance];
  double v9 = PXDebugHierarchyObjectsInGroupForView(v7, v6, @"PXGViewLayoutsAndSpritesHierarchyIdentifier", [v8 enableXcodeCustomDebugHierarchy]);

  return v9;
}

+ (id)debugHierarchyChildGroupingID
{
  uint64_t v2 = @"com.apple.AppKit.NSView";
  return @"com.apple.AppKit.NSView";
}

+ (void)enumerateAllViewsUsingBlock:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PXGView_enumerateAllViewsUsingBlock___block_invoke;
  v5[3] = &unk_1E5DCC5A0;
  id v6 = v3;
  id v4 = v3;
  EnumerateAllViewsUsingBlock(v5);
}

void __39__PXGView_enumerateAllViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)setForceAccessibilityEnabled:(BOOL)a3
{
  if (s_forceAccessibilityEnabled != a3)
  {
    s_forceAccessibilityEnabled = a3;
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"PXGInitializeAccessibilityNotification" object:0 userInfo:0];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotification:v4];
  }
}

+ (unint64_t)supportLevel
{
  if (supportLevel_onceToken != -1) {
    dispatch_once(&supportLevel_onceToken, &__block_literal_global_257128);
  }
  return supportLevel_supportLevel;
}

void __23__PXGView_supportLevel__block_invoke()
{
  id v0 = MTLCreateSystemDefaultDevice();

  if (v0)
  {
    v1 = [off_1E5DA9658 sharedInstance];
    char v2 = [v1 simulateMissingMetalDevice] ^ 1;
  }
  else
  {
    char v2 = 0;
  }
  supportLevel_supportLevel = v2;
}

- (id)storyHitTestResultAtPoint:(CGPoint)a3
{
  id v3 = -[PXGView hitTestResultAtPoint:](self, "hitTestResultAtPoint:", a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end