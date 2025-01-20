@interface THWiOSExpandedViewController
- (BOOL)adornmentController:(id)a3 allowWindowMoveForPanel:(int)a4;
- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4;
- (BOOL)allowZoom;
- (BOOL)animationControllerSetsDestination:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4;
- (BOOL)disablePanelAnimation;
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsMagnifier;
- (BOOL)expandedRepControllerHasRoomForPanels;
- (BOOL)freeTransformInFlight;
- (BOOL)freeTransformWasCancelled;
- (BOOL)handleGesture:(id)a3;
- (BOOL)inFlowMode;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)isCanvasInteractive;
- (BOOL)isDismissing;
- (BOOL)isZoomed;
- (BOOL)p_alwaysVisible;
- (BOOL)p_hasRepForICC:(id)a3 forInfo:(id)a4;
- (BOOL)p_hasSourceRepForInfo:(id)a3;
- (BOOL)p_hasTargetRepForInfo:(id)a3;
- (BOOL)p_startsVisible;
- (BOOL)prefersStatusBarHidden;
- (BOOL)repIsPresentedExpanded:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)wantsStatusBarVisible;
- (BOOL)wasTornDown;
- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3;
- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3;
- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3;
- (BOOL)widgetLayoutIsCompactFlow:(id)a3;
- (BOOL)widgetLayoutIsReflowablePresentation:(id)a3;
- (CALayer)rotationScrim;
- (CGAffineTransform)bookViewWillAnimateRotationToSize:(SEL)a3 withContext:(CGSize)a4;
- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4;
- (CGRect)pFrameInUnscaledCanvasSizeForExpandedRep:(id)a3;
- (CGRect)preRotateViewFrame;
- (CGRect)rectForCompletionAnimationWithRep:(id)a3;
- (CGRect)widgetLayoutBounds;
- (CGSize)widgetHostExpandedSize;
- (Class)wpEditorClassOverride;
- (THDocumentRoot)documentRoot;
- (THWAdornmentController)adornmentController;
- (THWExpandedRep)expandedRep;
- (THWExpandedTransitionRotationAnimationController)expandedRotationAnimationController;
- (THWExpandedViewControllerDelegate)delegate;
- (THWFreeTransformController)ftc;
- (THWFreeTransformGestureRecognizer)transformGR;
- (THWiOSExpandedViewController)initWithDocumentRoot:(id)a3 expandableRep:(id)a4 delegate:(id)a5;
- (TSDInfo)drawableToPresent;
- (TSDInteractiveCanvasController)icc;
- (TSDiOSCanvasViewController)cvc;
- (UIEdgeInsets)_safeAreaInsets;
- (UIScrollView)scrollView;
- (double)expandedHeightForPanel:(int)a3 allowDefault:(BOOL)a4;
- (double)originalViewScale;
- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5;
- (id)additionalGestureTargetsForInteractiveCanvasController:(id)a3 gesture:(id)a4;
- (id)expandedRepSourceRep;
- (id)hostCanvasLayer;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)p_sourceICC;
- (id)p_sourceRepForInfo:(id)a3;
- (id)p_targetICC;
- (id)p_targetRepForInfo:(id)a3;
- (id)p_targetViewBackgroundColor;
- (int)expandedRepControllerState;
- (int)widgetLayoutMode:(id)a3;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)widgetInteractionModeForRep:(id)a3;
- (void)_dismissReplaceContent;
- (void)_dismissWillReplaceContentWithFlush:(BOOL)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)animationControllerDidPresent:(id)a3;
- (void)animationControllerDidPresentPostCommit:(id)a3;
- (void)animationControllerSetupTarget:(id)a3;
- (void)animationControllerTeardownTarget:(id)a3;
- (void)animationControllerWillPresent:(id)a3;
- (void)bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4 transform:(CGAffineTransform *)a5;
- (void)bookViewDidRotateTransitionToSize:(CGSize)a3 withContext:(id)a4;
- (void)bookViewDidTransitionToSize:(CGSize)a3 withContext:(id)a4;
- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)bookViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)dismiss;
- (void)dismissExpandedAnimatedWithCompletionBlock:(id)a3;
- (void)dismissExpandedImmediate;
- (void)exitAVPresentation:(id)a3;
- (void)expandedRepControllerAnimatePanel:(int)a3 withCrossFadeContent:(BOOL)a4 backgroundLayout:(BOOL)a5 duration:(double)a6;
- (void)expandedRepControllerInvalidateChildrenInPanel:(int)a3 invalidateWPAuto:(BOOL)a4;
- (void)expandedRepControllerUpdatePanelVisibility;
- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4;
- (void)freeTransformDidCancelWithRep:(id)a3 expandableRep:(id)a4;
- (void)freeTransformDidEndWithRep:(id)a3 expandableRep:(id)a4 completionBlock:(id)a5;
- (void)freeTransformPostAnimationDidCancelWithRep:(id)a3 expandableRep:(id)a4;
- (void)freeTransformWillFadeOutCurtain:(id)a3 expandableRep:(id)a4;
- (void)gestureSequenceDidEnd;
- (void)handleCloseForAdornmentController:(id)a3;
- (void)handleHyperlinkWithURL:(id)a3;
- (void)handleSingleTap;
- (void)hideAdornments;
- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4;
- (void)interactiveCanvasController:(id)a3 willLayoutRep:(id)a4;
- (void)invalidate;
- (void)loadView;
- (void)p_addKeyCommands;
- (void)p_cleanup;
- (void)p_dismissExpandedAnimatedWithCompletionBlock:(id)a3 freeTransformDidEnd:(BOOL)a4;
- (void)p_handleDoubleTap:(id)a3;
- (void)p_handleEscapeKey:(id)a3;
- (void)p_handleMediaTransportKey:(id)a3;
- (void)p_handleNavigationKey:(id)a3;
- (void)p_handleNumber:(id)a3;
- (void)p_handleZoomInKey:(id)a3;
- (void)p_handleZoomOutKey:(id)a3;
- (void)p_setOnCanvasRepShadowLayerHidden:(BOOL)a3;
- (void)p_setWantsStatusBarVisible:(BOOL)a3;
- (void)p_toggleCanvasZoomAnimated:(BOOL)a3;
- (void)p_updateBackgroundColor;
- (void)p_updateCanvasToSize:(CGSize)a3;
- (void)p_updateContentOffsetFromCurrentViewScale:(double)a3 toNewViewScale:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)p_updateScrollViewLayout;
- (void)p_viewSizeDidChange;
- (void)presentExpandedAnimatedWithCompletionBlock:(id)a3;
- (void)presentPopoverForPopUpInfo:(id)a3 withFrame:(CGRect)a4 inLayer:(id)a5;
- (void)presentRepExpanded:(id)a3;
- (void)progressDidChangeForRep:(id)a3 percent:(id)a4;
- (void)resetAttemptForRep:(id)a3;
- (void)scoreDidChangeForRep:(id)a3 score:(id)a4 total:(id)a5;
- (void)setAdornmentController:(id)a3;
- (void)setAllowPinchZoom:(BOOL)a3 withMinimumScale:(double)a4 maximumScale:(double)a5;
- (void)setAllowZoom:(BOOL)a3;
- (void)setCvc:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablePanelAnimation:(BOOL)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setDrawableToPresent:(id)a3;
- (void)setExpandedRepControllerState:(int)a3;
- (void)setExpandedRotationAnimationController:(id)a3;
- (void)setFreeTransformInFlight:(BOOL)a3;
- (void)setFreeTransformWasCancelled:(BOOL)a3;
- (void)setFtc:(id)a3;
- (void)setIcc:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setOriginalViewScale:(double)a3;
- (void)setPreRotateViewFrame:(CGRect)a3;
- (void)setRotationScrim:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTransformGR:(id)a3;
- (void)setWantsStatusBarVisible:(BOOL)a3;
- (void)setWasTornDown:(BOOL)a3;
- (void)showAdornments;
- (void)teardown;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zoomInOrOut:(BOOL)a3;
@end

@implementation THWiOSExpandedViewController

- (THWExpandedRep)expandedRep
{
  return (THWExpandedRep *)TSUClassAndProtocolCast();
}

- (THWiOSExpandedViewController)initWithDocumentRoot:(id)a3 expandableRep:(id)a4 delegate:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)THWiOSExpandedViewController;
  v8 = [(THWiOSExpandedViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    v8->mDocumentRoot = (THDocumentRoot *)a3;
    v8->_wantsStatusBarVisible = [a5 isFreeTransformInProgress];
    [a4 expandedContentDrawableToPresent];
    objc_opt_class();
    v11 = &OBJC_PROTOCOL___TSDInfo;
    uint64_t v9 = TSUClassAndProtocolCast();
    if (!v9) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THWiOSExpandedViewController initWithDocumentRoot:expandableRep:delegate:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"] lineNumber:130 description:@"invalid nil value for '%s'", "drawableToPresent"];
    }
    -[THWiOSExpandedViewController setDrawableToPresent:](v8, "setDrawableToPresent:", v9, v11);
    [(THWiOSExpandedViewController *)v8 setDelegate:a5];
    THCanvasCreate(v8, (id *)&v8->_icc, &v8->_cvc);
    [(-[THWExpandedViewControllerDelegate rootSuperviewController](-[THWiOSExpandedViewController delegate](v8, "delegate"), "rootSuperviewController")) addChildViewController:v8];
    [(THWiOSExpandedViewController *)v8 addChildViewController:[(THWiOSExpandedViewController *)v8 cvc]];
    [(TSDInteractiveCanvasController *)v8->_icc disableAllGestures];
    [(TSDInteractiveCanvasController *)v8->_icc enableGestureKinds:+[NSArray arrayWithObject:TSWPImmediateSingleTap]];
    [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)v8 icc] setCreateRepsForOffscreenLayouts:1];
    [(THWiOSExpandedViewController *)v8 setFreeTransformInFlight:0];
    [(-[THWiOSExpandedViewController cvc](v8, "cvc"), "view") setBackgroundColor:[UIColor clearColor](UIColor, "clearColor")];
    [(-[THWiOSExpandedViewController cvc](v8, "cvc"), "view") setClipsToBounds:0];
    [(TSDiOSCanvasViewController *)[(THWiOSExpandedViewController *)v8 cvc] setDelegate:v8];
    [(THWiOSExpandedViewController *)v8 setOriginalViewScale:1.0];
    [(THWiOSExpandedViewController *)v8 setExpandedRepControllerState:0];
    [+[THWAVController sharedController](THWAVController, "sharedController") stopPlayer];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [a4 expandableShouldPreloadExpanded]) {
      [v8 view].layoutIfNeeded;
    }
    [(THWiOSExpandedViewController *)v8 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v8;
}

- (BOOL)p_startsVisible
{
  v2 = [(THWiOSExpandedViewController *)self expandedRep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [(THWExpandedRep *)v2 expandedPanelStartsVisible];
}

- (BOOL)p_alwaysVisible
{
  v2 = [(THWiOSExpandedViewController *)self expandedRep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWExpandedRep *)v2 expandedPanelAlwaysVisible];
}

- (void)dismiss
{
}

- (void)teardown
{
  self->_wasTornDown = 1;
}

- (void)loadView
{
  v3 = -[THWiOSExpandedView initWithFrame:]([THWiOSExpandedView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  [(THWiOSExpandedViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)THWiOSExpandedViewController;
  [(THWiOSExpandedViewController *)&v14 viewDidLoad];
  [self.delegate.rootSuperview frame];
  [self view].frame = CGRectMake(v3, v4, v5, v6);
  [self view].autoresizingMask = 18;
  [self view].setAutoresizesSubviews:1;
  id v7 = objc_alloc((Class)TSKScrollView);
  [self view].frame
  -[THWiOSExpandedViewController setScrollView:[v7 initWithFrame:]];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setDelegate:[(THWiOSExpandedViewController *)self icc]];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setClipsToBounds:0];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setScrollEnabled:1];
  [(-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer") unscaledSize];
  -[UIScrollView setContentSize:]([(THWiOSExpandedViewController *)self scrollView], "setContentSize:", v8, v9);
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setAutoresizingMask:18];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setContentInsetAdjustmentBehavior:2];
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] setInfosToDisplay:+[NSArray arrayWithObject:[(THWiOSExpandedViewController *)self drawableToPresent]]];
  v10 = [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector()) {
    [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setScrollEnabled:[(THWExpandedRep *)v10 expandedContentScrollEnabled]];
  }
  [-[THWiOSExpandedViewController view](self, "view") addSubview:[self scrollView]];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] addSubview:[(TSDiOSCanvasViewController *)[(THWiOSExpandedViewController *)self cvc] view]];
  if (objc_opt_respondsToSelector())
  {
    if ([(THWExpandedRep *)v10 expandedContentAllowDoubleTapZoom])
    {
      [(TSDInteractiveCanvasController *)self->_icc enableGestureKinds:+[NSArray arrayWithObject:TSWPTapAndTouch]];
      [(THWiOSExpandedViewController *)self setAllowZoom:1];
      if (objc_opt_respondsToSelector()) {
        [(THWiOSExpandedViewController *)self setAllowZoom:[(THWExpandedRep *)v10 expandedContentHandlesDoubleTapZoomDirectly] ^ 1];
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasController *)self->_icc enableGestureKinds:[(THWExpandedRep *)v10 expandedSupportedGestureKinds]];
  }
  v11 = [THWFreeTransformGestureRecognizer alloc];
  id v12 = [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] gestureDispatcher];
  [(THWiOSExpandedViewController *)self setTransformGR:[(THWFreeTransformGestureRecognizer *)v11 initWithGestureDispatcher:v12 gestureKind:TSDFreeTransform]];
  [(-[THWiOSExpandedViewController cvc](self, "cvc")) viewForGestureRecognizer:(-[THWiOSExpandedViewController transformGR](self, "transformGR")) addGestureRecognizer:(-[THWiOSExpandedViewController transformGR](self, "transformGR"))];
  [(THWFreeTransformGestureRecognizer *)[(THWiOSExpandedViewController *)self transformGR] setUnmovingParentView:[(TSDiOSCanvasViewController *)[(THWiOSExpandedViewController *)self cvc] view]];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v13 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWExpandedRep expandedZoomableInteractiveCanvasController](v10, "expandedZoomableInteractiveCanvasController"), "layerHost"), "asiOSCVC"), "zoomGestureRecognizer")) == 0)
  {
    id v13 = [(TSDiOSCanvasViewController *)[(THWiOSExpandedViewController *)self cvc] zoomGestureRecognizer];
  }
  [v13 requireGestureRecognizerToFail:[self transformGR]];
  [(THWiOSExpandedViewController *)self p_updateBackgroundColor];
  [(THWiOSExpandedViewController *)self setAdornmentController:[[THWAdornmentController alloc] initWithExpandedRep:v10 documentRoot:[(THWiOSExpandedViewController *)self documentRoot]]];
  [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] setDelegate:self];
  [(THWiOSExpandedViewController *)self setFtc:objc_alloc_init(THWFreeTransformController)];
  [(THWFreeTransformController *)[(THWiOSExpandedViewController *)self ftc] setGestureRecognizerDelegate:[(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] freeTransformableHandler]];
  [(THWiOSExpandedViewController *)self p_addKeyCommands];
}

- (void)p_updateBackgroundColor
{
  if ([(THDocumentRoot *)[(THWiOSExpandedViewController *)self documentRoot] themeProvider]&& [(THThemeProvider *)[(THDocumentRoot *)[(THWiOSExpandedViewController *)self documentRoot] themeProvider] forceThemeColors])
  {
    if ([(THWiOSExpandedViewController *)self freeTransformInFlight])
    {
      double v3 = +[UIColor clearColor];
      double v4 = v3;
    }
    else
    {
      double v4 = [-(THWiOSExpandedViewController *)self p_targetViewBackgroundColor] UIColor];
      double v3 = +[UIColor clearColor];
    }
  }
  else
  {
    double v4 = [-(THWiOSExpandedViewController *)self p_targetViewBackgroundColor] UIColor];
    [(THWiOSExpandedViewController *)self expandedRep];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (id v5 = [(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedBackgroundColor]) == 0)
    {
      double v6 = 0;
      goto LABEL_11;
    }
    double v3 = (UIColor *)[v5 platformColor];
  }
  double v6 = v3;
LABEL_11:
  [self.view setBackgroundColor:v4];
  if (v6)
  {
    id v7 = [(THWiOSExpandedViewController *)self scrollView];
    [(UIScrollView *)v7 setBackgroundColor:v6];
  }
}

- (void)invalidate
{
  objc_opt_class();
  [(THWiOSExpandedViewController *)self expandedRep];
  uint64_t v3 = TSUDynamicCast();
  if (v3)
  {
    double v4 = (void *)v3;
    objc_opt_class();
    objc_msgSend(objc_msgSend(v4, "scrollableCanvasController"), "interactiveCanvasController");
    id v5 = (void *)TSUDynamicCast();
    if (v5)
    {
      double v6 = v5;
      [v5 pushThreadedLayoutAndRenderDisabled];
      [v6 recreateAllLayoutsAndReps];
      [v6 layoutIfNeeded];
      [v6 popThreadedLayoutAndRenderDisabled];
      if ([(THDocumentRoot *)[(THWiOSExpandedViewController *)self documentRoot] themeProvider])
      {
        objc_msgSend(objc_msgSend(v6, "canvasView"), "setBackgroundColor:", +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", -[THThemeProvider backgroundColor](-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider"), "backgroundColor")));
      }
    }
  }

  [(THWiOSExpandedViewController *)self p_updateBackgroundColor];
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  if ([(THWiOSExpandedViewController *)self im_isCompactHeight]) {
    return 1;
  }
  else {
    return ![(THWiOSExpandedViewController *)self wantsStatusBarVisible];
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  int64_t result = [(THWiOSExpandedViewController *)&v4 overrideUserInterfaceStyle];
  if (!result)
  {
    objc_opt_class();
    [(THDocumentRoot *)[(THWiOSExpandedViewController *)self documentRoot] themeProvider];
    int64_t result = TSUDynamicCast();
    if (result) {
      return (int64_t)[(id)result userInterfaceStyle];
    }
  }
  return result;
}

- (CGRect)pFrameInUnscaledCanvasSizeForExpandedRep:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [a3 expandedFrameInUnscaledCanvasSize];
  }
  else {
    [a3 frameInUnscaledCanvas];
  }

  return CGRectIntegral(*(CGRect *)&v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  [(THWiOSExpandedViewController *)&v4 viewWillAppear:a3];
  [(THWiOSExpandedViewController *)self p_viewSizeDidChange];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  [(THWiOSExpandedViewController *)&v4 viewWillDisappear:a3];
  if ([(THWiOSExpandedViewController *)self isFirstResponder]) {
    [(THWiOSExpandedViewController *)self resignFirstResponder];
  }
}

- (void)p_viewSizeDidChange
{
  uint64_t v3 = [(THWiOSExpandedViewController *)self expandedRep];
  id v4 = [(THWExpandedRep *)v3 layout];
  id v5 = v4;
  if (v4)
  {
    [v4 invalidateFrame];
    [v5 invalidateChildren];
  }
  [(THWiOSExpandedViewController *)self _safeAreaInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [self view].frame;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18 - (v9 + v13);
  double v21 = v20 - (v7 + v11);
  -[THWiOSExpandedViewController p_updateCanvasToSize:](self, "p_updateCanvasToSize:", v19, v21);
  [(THWiOSExpandedViewController *)self p_updateScrollViewLayout];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THWExpandedRep *)v3 expandedContentAllowPinchZoom])
  {
    [(THWiOSExpandedViewController *)self setAllowPinchZoom:1 withMinimumScale:1.0 maximumScale:2.0];
  }
  if (v5) {
    [v3 interactiveCanvasController].layoutIfNeeded;
  }
  v22 = [(THWiOSExpandedViewController *)self adornmentController];

  -[THWAdornmentController layoutInFrame:](v22, "layoutInFrame:", v9 + v15, v7 + v17, v19, v21);
}

- (id)p_targetViewBackgroundColor
{
  id v3 = +[TSUColor whiteColor];
  [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector())
  {
    if ([(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedAppearance] == 1)
    {
      return +[TSUColor whiteColor];
    }
    else
    {
      return +[TSUColor blackColor];
    }
  }
  else if ([(THDocumentRoot *)[(THWiOSExpandedViewController *)self documentRoot] themeProvider])
  {
    id v5 = [(THThemeProvider *)[(THDocumentRoot *)[(THWiOSExpandedViewController *)self documentRoot] themeProvider] backgroundColor];
    return +[TSUColor colorWithCGColor:v5];
  }
  else
  {
    return v3;
  }
}

- (void)p_cleanup
{
  self->mContentsRep = 0;
  self->mDocumentRoot = 0;

  self->_expandedRotationAnimationController = 0;
}

- (void)dealloc
{
  if (!self->_wasTornDown) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:515 description:@"Expanded view controller was not torn down."];
  }
  [(THWiOSExpandedViewController *)self p_cleanup];
  v3.receiver = self;
  v3.super_class = (Class)THWiOSExpandedViewController;
  [(THWiOSExpandedViewController *)&v3 dealloc];
}

- (void)setAllowPinchZoom:(BOOL)a3 withMinimumScale:(double)a4 maximumScale:(double)a5
{
  BOOL v7 = a3;
  [(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer")) setAllowsPinchZoom:a3];
  [(-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer") setMinimumPinchViewScale:a4];
  [(-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer") setMaximumPinchViewScale:a5];

  [(THWiOSExpandedViewController *)self setAllowZoom:v7];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector()) {
    unsigned int v5 = [(THWExpandedRep *)v4 expandedContentAllowDoubleTapZoom];
  }
  else {
    unsigned int v5 = 0;
  }
  objc_opt_class();
  uint64_t v6 = TSUDynamicCast();
  BOOL result = 0;
  if (!v6
    || (BOOL v7 = (void *)v6,
        objc_opt_class(),
        objc_msgSend(objc_msgSend(v7, "scrollableCanvasController"), "interactiveCanvasController"),
        (double v8 = (void *)TSUDynamicCast()) == 0)
    || ([v8 gestureHitLink:a3] & 1) == 0)
  {
    if (v5)
    {
      id v9 = [a3 gestureKind];
      if (v9 == (id)TSWPTapAndTouch) {
        return 1;
      }
    }
    id v10 = [a3 gestureKind];
    if (v10 == (id)TSWPImmediateSingleTap) {
      return 1;
    }
  }
  return result;
}

- (BOOL)handleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSWPImmediateSingleTap)
  {
    unsigned int v8 = [a3 gestureState];
    BOOL result = 1;
    if (v8 == 3) {
      self->mSingleTapPossible = 1;
    }
  }
  else
  {
    id v6 = [a3 gestureKind];
    if (v6 == (id)TSWPTapAndTouch)
    {
      if ([a3 gestureState] == 3)
      {
        self->mSingleTapPossible = 0;
        [(THWiOSExpandedViewController *)self p_handleDoubleTap:a3];
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)gestureSequenceDidEnd
{
  if (self->mSingleTapPossible) {
    [(THWiOSExpandedViewController *)self handleSingleTap];
  }
}

- (void)handleSingleTap
{
  if (![(THWiOSExpandedViewController *)self p_alwaysVisible])
  {
    [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] toggleVisibility];
    [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector())
    {
      objc_super v3 = [(THWiOSExpandedViewController *)self expandedRep];
      [(THWExpandedRep *)v3 userInteractionDidTakePlace];
    }
  }
}

- (void)p_handleDoubleTap:(id)a3
{
  id v5 = [(THWiOSExpandedViewController *)self expandedRep];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THWExpandedRep *)v5 expandedContentHandlesDoubleTapZoomDirectly])
  {
    [a3 unscaledLocationForICC:[self icc]];
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:]([(THWiOSExpandedViewController *)self icc], "convertBoundsToUnscaledPoint:", v6, v7);
    -[THWExpandedRep convertNaturalPointFromUnscaledCanvas:](v5, "convertNaturalPointFromUnscaledCanvas:");
    -[THWExpandedRep expandedContentHandleDoubleTapZoomDirectlyAtPoint:](v5, "expandedContentHandleDoubleTapZoomDirectlyAtPoint:");
  }
  else
  {
    [(THWiOSExpandedViewController *)self p_toggleCanvasZoomAnimated:1];
  }
}

- (void)p_toggleCanvasZoomAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] viewScale];
  double v6 = v5;
  [(THWiOSExpandedViewController *)self originalViewScale];
  double v8 = v7;
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] viewScale];
  if (v8 != v9)
  {
    [(THWiOSExpandedViewController *)self originalViewScale];
LABEL_5:
    double v11 = v10;
    goto LABEL_7;
  }
  [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector())
  {
    [(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedContentMaximumZoomScale];
    goto LABEL_5;
  }
  double v11 = v6 + v6;
LABEL_7:
  if (vabdd_f64(v6, v11) >= 0.00999999978)
  {
    [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] contentOffset];
    [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] bounds];
    CGRectGetWidth(v18);
    [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] bounds];
    CGRectGetHeight(v19);
    TSDMultiplyPointScalar();
    TSDAddPoints();
    TSDMultiplyPointScalar();
    TSDSubtractPoints();
    TSDMultiplyPointScalar();
    double v13 = v12;
    double v15 = v14;
    double v16 = [(THWiOSExpandedViewController *)self icc];
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](v16, "setViewScale:contentOffset:clampOffset:animated:", 1, v3, v11, v13, v15);
  }
}

- (BOOL)isZoomed
{
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] viewScale];
  double v4 = v3;
  [(THWiOSExpandedViewController *)self originalViewScale];
  return vabdd_f64(v4, v5) >= 0.00999999978;
}

- (void)p_setWantsStatusBarVisible:(BOOL)a3
{
  self->_wantsStatusBarVisible = a3;
  [(THWiOSExpandedViewController *)self refreshStatusBarAppearance];
}

- (void)presentExpandedAnimatedWithCompletionBlock:(id)a3
{
  [(THWiOSExpandedViewController *)self setExpandedRepControllerState:1];
  id v5 = [self expandedRepSourceRep].animationController;
  [v5 addObserver:self];
  [(THWiOSExpandedViewController *)self p_setWantsStatusBarVisible:0];

  [v5 presentAnimationWithCompletionBlock:a3 overshoot:0];
}

- (void)dismissExpandedAnimatedWithCompletionBlock:(id)a3
{
  [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerWillBeginDismissing:self];

  [(THWiOSExpandedViewController *)self p_dismissExpandedAnimatedWithCompletionBlock:a3 freeTransformDidEnd:0];
}

- (void)p_dismissExpandedAnimatedWithCompletionBlock:(id)a3 freeTransformDidEnd:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(THWiOSExpandedViewController *)self isDismissing])
  {
    [(THWiOSExpandedViewController *)self setIsDismissing:1];
    [(THWiOSExpandedViewController *)self setExpandedRepControllerState:3];
    [(THWiOSExpandedViewController *)self p_setWantsStatusBarVisible:[(THWiOSExpandedViewController *)self im_isCompactHeight] ^ 1];
    double v7 = [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector()) {
      [(THWExpandedRep *)v7 willExitExpandedFreeTransformDidEnd:v4];
    }
    if (v4)
    {
      id v8 = 0;
      id v9 = 0;
    }
    else
    {
      id v9 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "hostICC"), "layerHost"), "canvasLayer");
      id v8 = [self view].layer;
    }
    objc_opt_class();
    id v10 = [TSUClassAndProtocolCast() animationController:&OBJC_PROTOCOL___THWExpandedRep];
    if (!v10) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWiOSExpandedViewController p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"] lineNumber:741 description:@"invalid nil value for '%s'", "animationController"];
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    double v15 = sub_149064;
    double v16 = &unk_456E88;
    id v17 = [(THWiOSExpandedViewController *)self expandedRepSourceRep];
    id v18 = a3;
    uint64_t v11 = TSUProtocolCast();
    [(THWiOSExpandedViewController *)self expandedRepSourceRep];
    uint64_t v12 = TSUProtocolCast();
    if (v11 && (uint64_t v13 = v12) != 0)
    {
      [v10 setSource:v11];
      [v10 setDestination:v13];
      [v10 setHostLayer:[-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview") layer]];
      [v10 setForegroundLayer:v9];
      [v10 setBackgroundLayer:v8];
      [v10 addObserver:self];
      [v10 presentAnimationWithCompletionBlock:v14 overshoot:v4];
    }
    else
    {
      [(THWiOSExpandedViewController *)self dismissExpandedImmediate];
      v15((uint64_t)v14);
    }
  }
}

- (void)handleHyperlinkWithURL:(id)a3
{
  id v5 = [(THWiOSExpandedViewController *)self delegate];

  [(THWExpandedViewControllerDelegate *)v5 expandedViewController:self handleHyperlinkWithURL:a3];
}

- (void)dismissExpandedImmediate
{
  [(THWiOSExpandedViewController *)self setIsDismissing:1];
  double v3 = self;
  [(THWiOSExpandedViewController *)self _dismissWillReplaceContentWithFlush:0];
  [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerWillDismiss:self];
  [(THWiOSExpandedViewController *)self removeFromParentViewController];
  [self view].removeFromSuperview;
  [(THWiOSExpandedViewController *)self _dismissReplaceContent];
  BOOL v4 = [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector()) {
    [(THWExpandedRep *)v4 didExitExpanded];
  }
  [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerDidDismiss:self];
  [(THWiOSExpandedViewController *)self setExpandedRepControllerState:4];
  [(THWiOSExpandedViewController *)self setIsDismissing:0];

  [(THWiOSExpandedViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)THWiOSExpandedViewController;
  [(THWiOSExpandedViewController *)&v2 didReceiveMemoryWarning];
}

- (UIEdgeInsets)_safeAreaInsets
{
  if (objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "superview")
    || ([(THWiOSExpandedViewController *)self delegate], (objc_opt_respondsToSelector() & 1) == 0))
  {
    id v4 = [(THWiOSExpandedViewController *)self view];
    [v4 safeAreaInsets];
  }
  else
  {
    double v3 = [(THWiOSExpandedViewController *)self delegate];
    [(THWExpandedViewControllerDelegate *)v3 expandedViewControllerSafeAreaInsets:self];
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)p_updateCanvasToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(TSDiOSCanvasViewController *)[(THWiOSExpandedViewController *)self cvc] canvasLayer];

  [v5 setUnscaledSize:width, height];
}

- (void)p_updateScrollViewLayout
{
  [(-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer") unscaledSize];
  -[UIScrollView setContentSize:]([(THWiOSExpandedViewController *)self scrollView], "setContentSize:", v3, v4);
  [(THWiOSExpandedViewController *)self _safeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(THWiOSExpandedViewController *)self scrollView];

  -[UIScrollView setContentInset:](v13, "setContentInset:", v6, v8, v10, v12);
}

- (BOOL)shouldAutorotate
{
  return [(THWiOSExpandedViewController *)self expandedRepControllerState] == 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  if (!self->_wasTornDown)
  {
    double height = a3.height;
    double width = a3.width;
    v24.receiver = self;
    v24.super_class = (Class)THWiOSExpandedViewController;
    -[THWiOSExpandedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v24, "viewWillTransitionToSize:withTransitionCoordinator:");
    if (a4)
    {
      [a4 targetTransform];
      if (CGAffineTransformIsIdentity(&v23))
      {
        -[THWiOSExpandedViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
        char v8 = 0;
      }
      else
      {
        -[THWiOSExpandedViewController bookViewWillRotateTransitionToSize:withTransitionCoordinator:](self, "bookViewWillRotateTransitionToSize:withTransitionCoordinator:", a4, width, height);
        char v8 = 1;
      }
      uint64_t v19 = 0;
      double v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x5010000000;
      v15[3] = &unk_41622E;
      long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v17 = v9;
      long long v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1495C0;
      v13[3] = &unk_459EB0;
      char v14 = v8;
      v13[5] = &v19;
      v13[6] = v15;
      v13[4] = self;
      *(double *)&v13[7] = width;
      *(double *)&v13[8] = height;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_149634;
      v11[3] = &unk_459ED8;
      char v12 = v8;
      v11[4] = self;
      v11[5] = &v19;
      *(double *)&v11[7] = width;
      *(double *)&v11[8] = height;
      v11[6] = v15;
      unsigned __int8 v10 = [a4 animateAlongsideTransition:v13 completion:v11];
      *((unsigned char *)v20 + 24) = v10;
      _Block_object_dispose(v15, 8);
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      -[THWiOSExpandedViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", 0, width, height);
      -[THWiOSExpandedViewController bookViewDidTransitionToSize:withContext:](self, "bookViewDidTransitionToSize:withContext:", 0, width, height);
    }
  }
}

- (void)bookViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  -[THWAdornmentController controllerWillTransitionToSize:withTransitionCoordinator:]([(THWiOSExpandedViewController *)self adornmentController], "controllerWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  double v7 = [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector()) {
    id v8 = [(THWExpandedRep *)v7 expandedRotationAnimationController];
  }
  else {
    id v8 = 0;
  }
  [(THWiOSExpandedViewController *)self setExpandedRotationAnimationController:v8];
  expandedRotationAnimationController = self->_expandedRotationAnimationController;
  [self view].frame

  -[THWExpandedTransitionRotationAnimationController expandedWillTransitionFromSize:toSize:](expandedRotationAnimationController, "expandedWillTransitionFromSize:toSize:", v10, v11, width, height);
}

- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  -[THWAdornmentController controllerWillTransitionToSize:withTransitionCoordinator:]([(THWiOSExpandedViewController *)self adornmentController], "controllerWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  [(THWiOSExpandedViewController *)self setRotationScrim:+[CALayer layer]];
  -[CALayer setBackgroundColor:](-[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"), "setBackgroundColor:", objc_msgSend(-[THWiOSExpandedViewController p_targetViewBackgroundColor](self, "p_targetViewBackgroundColor"), "CGColor"));
  [self view].bounds;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [self view].bounds;
  CGFloat v16 = v15 * -0.707;
  [self view].bounds
  CGFloat v18 = v17 * -0.707;
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.double width = v12;
  v27.size.double height = v14;
  CGRect v28 = CGRectInset(v27, v16, v18);
  -[CALayer setFrame:]([(THWiOSExpandedViewController *)self rotationScrim], "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  [(CALayer *)[(THWiOSExpandedViewController *)self rotationScrim] setZPosition:-32000.0];
  objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "layer"), "addSublayer:", -[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"));
  [self view].frame;
  self->_preRotateViewFrame.origin.x = v19;
  self->_preRotateViewFrame.origin.y = v20;
  self->_preRotateViewFrame.size.double width = v21;
  self->_preRotateViewFrame.size.double height = v22;
  [(THWAdornmentController *)self->_adornmentController setDisablePanelFrameAnimation:1];
  CGAffineTransform v23 = [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector()) {
    id v24 = [(THWExpandedRep *)v23 expandedRotationAnimationController];
  }
  else {
    id v24 = 0;
  }
  [(THWiOSExpandedViewController *)self setExpandedRotationAnimationController:v24];
  -[THWExpandedTransitionRotationAnimationController expandedWillRotateTransitionFromSize:toSize:](self->_expandedRotationAnimationController, "expandedWillRotateTransitionFromSize:toSize:", self->_preRotateViewFrame.size.width, self->_preRotateViewFrame.size.height, width, height);
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setClipsToBounds:0];
  id v25 = [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] canvasView];

  [v25 setClipsToBounds:0];
}

- (CGAffineTransform)bookViewWillAnimateRotationToSize:(SEL)a3 withContext:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  id v10 = [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] canvasView];
  if (v10)
  {
    [v10 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  +[CATransaction begin];
  [(THWiOSExpandedViewController *)self _safeAreaInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [self view].frame;
  double v20 = v14 + v19;
  double v22 = v12 + v21;
  double v24 = v23 - (v14 + v18);
  double v26 = v25 - (v12 + v16);
  CGRect v27 = [(THWiOSExpandedViewController *)self adornmentController];
  [a5 transitionDuration];
  -[THWAdornmentController controllerWillAnimateToSize:duration:inFrame:](v27, "controllerWillAnimateToSize:duration:inFrame:", width, height, v28, v20, v22, v24, v26);
  -[THWiOSExpandedViewController p_updateCanvasToSize:](self, "p_updateCanvasToSize:", v24, v26);
  [(THWiOSExpandedViewController *)self p_updateScrollViewLayout];
  double v30 = self->_preRotateViewFrame.size.width;
  double v29 = self->_preRotateViewFrame.size.height;
  [self view].frame
  double v32 = v31;
  double v34 = v33;
  expandedRotationAnimationController = self->_expandedRotationAnimationController;
  [a5 transitionDuration];
  -[THWExpandedTransitionRotationAnimationController expandedWillAnimateRotationFromSize:toSize:duration:](expandedRotationAnimationController, "expandedWillAnimateRotationFromSize:toSize:duration:", v30, v29, v32, v34, v36);
  unsigned int v37 = [(THWExpandedTransitionRotationAnimationController *)self->_expandedRotationAnimationController autoRotationMode];
  if (v37)
  {
    unsigned int v38 = v37;
    v39 = [(THWiOSExpandedViewController *)self icc];
    long long v40 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v53.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v53.c = v40;
    *(_OWORD *)&v53.tdouble x = *(_OWORD *)&retstr->tx;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    if (v38 == 1)
    {
      double v43 = v32 / v30;
    }
    else if (v38 == 2)
    {
      double v43 = v34 / v29;
    }
    else
    {
      double v43 = 1.0;
      if (v38 == 3)
      {
        -[THWExpandedTransitionRotationAnimationController scaleForCenteredAutoRotateFromSize:toSize:](self->_expandedRotationAnimationController, "scaleForCenteredAutoRotateFromSize:toSize:", v30, v29, v32, v34);
        double v43 = v44;
        -[THWExpandedTransitionRotationAnimationController translateForCenteredAutoRotateFromSize:toSize:](self->_expandedRotationAnimationController, "translateForCenteredAutoRotateFromSize:toSize:", v30, v29, v32, v34);
        double x = v45;
        double y = v46;
      }
    }
    CGAffineTransform v52 = v53;
    CGAffineTransformScale(&v53, &v52, v43, v43);
    if (v38 == 4)
    {
      CGAffineTransform v51 = v53;
      double v47 = x;
      double v48 = y;
    }
    else
    {
      double v47 = x - (v30 - v32) * 0.5;
      double v48 = y - (v29 - v34) * 0.5;
      CGAffineTransform v51 = v53;
    }
    CGAffineTransformTranslate(&v52, &v51, v47, v48);
    CGAffineTransform v53 = v52;
    v50[1] = v52;
    v50[0] = v52;
    [v39 canvasView].transform = v50;
  }
  return (CGAffineTransform *)+[CATransaction commit];
}

- (void)bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4 transform:(CGAffineTransform *)a5
{
  double height = a3.height;
  double width = a3.width;
  -[THWAdornmentController controllerDidTransitionToSize:]([(THWiOSExpandedViewController *)self adornmentController], "controllerDidTransitionToSize:", a3.width, a3.height);
  [(CALayer *)[(THWiOSExpandedViewController *)self rotationScrim] removeFromSuperlayer];
  [(THWiOSExpandedViewController *)self setRotationScrim:0];
  -[THWExpandedTransitionRotationAnimationController expandedDidAnimateRotationToSize:](self->_expandedRotationAnimationController, "expandedDidAnimateRotationToSize:", width, height);
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] viewScale];
  if (fabs(v9 + -1.0) >= 0.00999999978)
  {
    [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector())
    {
      if ([(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedContentNonContiguousZoomScale])
      {
        [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] setViewScale:1.0];
        [(THWiOSExpandedViewController *)self p_toggleCanvasZoomAnimated:0];
      }
    }
  }
  [(-[THWiOSExpandedViewController icc](self, "icc", *(void *)&a5->a, *(void *)&a5->b, *(void *)&a5->c, *(void *)&a5->d, *(void *)&a5->tx, *(void *)&a5->ty), "canvasView") setTransform:&v10];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setClipsToBounds:1];
  [(-[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc"), "canvasView")) setClipsToBounds:1];
  [(THWAdornmentController *)self->_adornmentController setDisablePanelFrameAnimation:0];
}

- (void)bookViewDidRotateTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  -[THWExpandedTransitionRotationAnimationController expandedDidRotateTransitionToSize:](self->_expandedRotationAnimationController, "expandedDidRotateTransitionToSize:", a4, a3.width, a3.height);
  [(THWiOSExpandedViewController *)self setExpandedRotationAnimationController:0];
  adornmentController = self->_adornmentController;

  [(THWAdornmentController *)adornmentController updateVisibility];
}

- (void)bookViewDidTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [(THWiOSExpandedViewController *)self p_viewSizeDidChange];
  -[THWAdornmentController controllerDidTransitionToSize:]([(THWiOSExpandedViewController *)self adornmentController], "controllerDidTransitionToSize:", width, height);
  -[THWExpandedTransitionRotationAnimationController expandedDidTransitionToSize:](self->_expandedRotationAnimationController, "expandedDidTransitionToSize:", width, height);
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] viewScale];
  if (fabs(v7 + -1.0) >= 0.00999999978)
  {
    [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector())
    {
      if ([(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedContentNonContiguousZoomScale])
      {
        [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] setViewScale:1.0];
        [(THWiOSExpandedViewController *)self p_toggleCanvasZoomAnimated:0];
      }
    }
  }
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] setClipsToBounds:1];
  [(-[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc"), "canvasView")) setClipsToBounds:1];
  [(THWiOSExpandedViewController *)self setExpandedRotationAnimationController:0];
  [(THWAdornmentController *)self->_adornmentController setDisablePanelFrameAnimation:0];
  adornmentController = self->_adornmentController;

  [(THWAdornmentController *)adornmentController updateVisibility];
}

- (BOOL)p_hasRepForICC:(id)a3 forInfo:(id)a4
{
  return [a3 repForInfo:a4 createIfNeeded:1] != 0;
}

- (BOOL)p_hasSourceRepForInfo:(id)a3
{
  id v5 = [(THWiOSExpandedViewController *)self p_sourceICC];

  return [(THWiOSExpandedViewController *)self p_hasRepForICC:v5 forInfo:a3];
}

- (id)p_sourceRepForInfo:(id)a3
{
  id v3 = [self p_sourceICC] repForInfo:a3 createIfNeeded:1];
  if (!v3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController p_sourceRepForInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:1108 description:@"invalid nil value for '%s'", "resultRep"];
  }
  return v3;
}

- (BOOL)p_hasTargetRepForInfo:(id)a3
{
  id v5 = [(THWiOSExpandedViewController *)self p_targetICC];

  return [(THWiOSExpandedViewController *)self p_hasRepForICC:v5 forInfo:a3];
}

- (id)p_targetRepForInfo:(id)a3
{
  id v4 = [(THWiOSExpandedViewController *)self p_targetICC];

  return [v4 repForInfo:a3 createIfNeeded:0];
}

- (void)_dismissWillReplaceContentWithFlush:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THWiOSExpandedViewController *)self expandedRepSourceRep];
  if (-[THWiOSExpandedViewController p_hasSourceRepForInfo:](self, "p_hasSourceRepForInfo:", [v5 info]))
  {
    id v6 = -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", [v5 info]);
    if (v6)
    {
      id v7 = v6;
      if (v3) {
        +[CATransaction flush];
      }
      [v5 willReplaceContentsFromRep:v7];
    }
  }
}

- (void)_dismissReplaceContent
{
  mContentsRep = self->mContentsRep;
  if (mContentsRep)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController _dismissReplaceContent]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:1148 description:@"expected nil value for '%s'", "mContentsRep"];
    mContentsRep = self->mContentsRep;
  }

  self->mContentsRep = 0;
  if ([(THWiOSExpandedViewController *)self p_hasTargetRepForInfo:[(THWiOSExpandedViewController *)self drawableToPresent]])
  {
    id v4 = [(THWiOSExpandedViewController *)self p_targetRepForInfo:[(THWiOSExpandedViewController *)self drawableToPresent]];
    if (!v4) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController _dismissReplaceContent]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:1154 description:@"invalid nil value for '%s'", "targetContentsRep"];
    }
    id v5 = -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", [v4 info]);
    [v4 replaceContentsFromRep:v5];
  }
}

- (void)animationControllerWillPresent:(id)a3
{
  if ([(THWiOSExpandedViewController *)self isDismissing])
  {
    [(THWiOSExpandedViewController *)self _dismissWillReplaceContentWithFlush:1];
    id v4 = [(THWiOSExpandedViewController *)self delegate];
    [(THWExpandedViewControllerDelegate *)v4 expandedViewControllerWillDismiss:self];
  }
  else
  {
    id v5 = [(THWiOSExpandedViewController *)self delegate];
    [(THWExpandedViewControllerDelegate *)v5 expandedViewControllerWillPresent:self];
  }
}

- (void)animationControllerTeardownTarget:(id)a3
{
  if ([(THWiOSExpandedViewController *)self isDismissing])
  {
    [(THWiOSExpandedViewController *)self _dismissReplaceContent];
  }
  else if (self->mContentsRep)
  {
    mContentsRep = [(THWiOSExpandedViewController *)self p_targetRepForInfo:[(THWiOSExpandedViewController *)self drawableToPresent]];
    id v5 = mContentsRep;
    if (self->mContentsRep != mContentsRep)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController animationControllerTeardownTarget:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:1179 description:@"Save contents rep and contents rep do not match."];
      mContentsRep = self->mContentsRep;
    }
    id v6 = [(TSDRep *)mContentsRep info];
    if (self->mContentsRep == v5)
    {
      id v7 = v6;
      if ([(THWiOSExpandedViewController *)self p_hasSourceRepForInfo:v6])
      {
        id v8 = [(THWiOSExpandedViewController *)self p_sourceRepForInfo:v7];
        double v9 = self->mContentsRep;
        [(TSDRep *)v9 replaceContentsFromRep:v8];
      }
    }
  }
}

- (void)animationControllerDidPresent:(id)a3
{
  id v4 = [(THWiOSExpandedViewController *)self parentViewController];
  if ([(THWiOSExpandedViewController *)self isDismissing])
  {
    id v5 = self;
    [(THWiOSExpandedViewController *)self p_setOnCanvasRepShadowLayerHidden:0];
    [(THWiOSExpandedViewController *)self removeFromParentViewController];
    [self view].removeFromSuperview;
    id v6 = [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector()) {
      [(THWExpandedRep *)v6 didExitExpanded];
    }
    [(THWiOSExpandedViewController *)self expandedRep];
    objc_opt_class();
    double v12 = &OBJC_PROTOCOL___BCProgressTracking;
    uint64_t v7 = TSUClassAndProtocolCast();
    if (v7)
    {
      uint64_t v8 = v7;
      [(THWiOSExpandedViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewController:self deactivateProgressForRep:v8];
      }
    }
    [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerDidDismiss:self];
  }
  else
  {
    [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] addAdornmentViewsToView:[(THWiOSExpandedViewController *)self view]];
    if ([(THWiOSExpandedViewController *)self p_startsVisible]
      || [(THWiOSExpandedViewController *)self p_alwaysVisible])
    {
      [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] setAdornmentsVisible:1 animated:1 completionBlock:0];
    }
    double v9 = [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector()) {
      [(THWExpandedRep *)v9 didPresentExpanded];
    }
    [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerDidPresent:self];
    [(THWiOSExpandedViewController *)self expandedRep];
    objc_opt_class();
    double v13 = &OBJC_PROTOCOL___BCProgressTracking;
    uint64_t v10 = TSUClassAndProtocolCast();
    if (v10)
    {
      uint64_t v11 = v10;
      [(THWiOSExpandedViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewController:self activateProgressForRep:v11];
      }
    }
    -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 0, v13);
  }
  [v4 setNeedsWhitePointAdaptivityStyleUpdate];

  self->mContentsRep = 0;
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  if ([(THWiOSExpandedViewController *)self expandedRepControllerState] == 1)
  {
    uint64_t v5 = 2;
LABEL_5:
    [(THWiOSExpandedViewController *)self setExpandedRepControllerState:v5];
    goto LABEL_6;
  }
  if ([(THWiOSExpandedViewController *)self expandedRepControllerState] == 3)
  {
    uint64_t v5 = 4;
    goto LABEL_5;
  }
LABEL_6:
  if (![(THWiOSExpandedViewController *)self isDismissing])
  {
    [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector()) {
      [(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] didPresentExpandedPostCommit];
    }
  }
  [(THWiOSExpandedViewController *)self setIsDismissing:0];

  [a3 removeObserver:self];
}

- (void)animationControllerSetupTarget:(id)a3
{
  if (![(THWiOSExpandedViewController *)self isDismissing])
  {
    [(THWAdornmentController *)self->_adornmentController setDisablePanelFrameAnimation:1];
    id v5 = [(THWiOSExpandedViewController *)self view];
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v13[1] = v6;
    v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v5 setTransform:v13];
    [(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview")) bounds];
    [v5 setFrame:];
    [(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview")) addSubview:v5];
    uint64_t v7 = [(THWiOSExpandedViewController *)self expandedRep];
    id v8 = [(THWiOSExpandedViewController *)self expandedRepSourceRep];
    if (objc_opt_respondsToSelector()) {
      [v8 expandableWillPresentExpanded];
    }
    if ([(THWiOSExpandedViewController *)self isDismissing]) {
      id v9 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "hostICC"), "layerHost"), "canvasLayer");
    }
    else {
      id v9 = [v5 layer];
    }
    id v10 = v9;
    if ([(THWiOSExpandedViewController *)self isDismissing]) {
      id v11 = [v5 layer];
    }
    else {
      id v11 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "hostICC"), "layerHost"), "canvasLayer");
    }
    id v12 = v11;
    [a3 setSource:v8];
    [a3 setDestination:v7];
    [a3 setHostLayer:[-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview") layer]];
    [a3 setForegroundLayer:v10];
    [a3 setBackgroundLayer:v12];
    [v5 layoutIfNeeded];
    [(THWAdornmentController *)self->_adornmentController setDisablePanelFrameAnimation:0];
    if (objc_opt_respondsToSelector()) {
      [(THWExpandedRep *)v7 expandedDidAppearPreAnimation];
    }
  }
}

- (BOOL)animationControllerSetsDestination:(id)a3
{
  return 1;
}

- (void)hideAdornments
{
  if (![(THWiOSExpandedViewController *)self p_alwaysVisible])
  {
    BOOL v3 = [(THWiOSExpandedViewController *)self adornmentController];
    [(THWAdornmentController *)v3 setAdornmentsVisible:0 animated:1 completionBlock:0];
  }
}

- (void)showAdornments
{
  if (![(THWiOSExpandedViewController *)self p_alwaysVisible])
  {
    BOOL v3 = [(THWiOSExpandedViewController *)self adornmentController];
    [(THWAdornmentController *)v3 setAdornmentsVisible:1 animated:1 completionBlock:0];
  }
}

- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4
{
  id v5 = (void *)TSUProtocolCast();
  id v6 = [v5 gestureKind];
  if (v6 == (id)TSWPImmediateSingleTap)
  {
    char v8 = 1;
  }
  else
  {
    id v7 = [v5 gestureKind];
    char v8 = v7 == (id)TSWPTapAndTouch;
  }
  id v9 = [v5 gestureKind];
  if (v9 != (id)TSDFreeTransform) {
    return v8;
  }
  id v10 = [(THWiOSExpandedViewController *)self expandedRep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [(THWExpandedRep *)v10 expandedAllowFreeTransform];
}

- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4
{
  return a4 == 1;
}

- (id)p_sourceICC
{
  if ([(THWiOSExpandedViewController *)self isDismissing])
  {
    return [(THWiOSExpandedViewController *)self icc];
  }
  else
  {
    id v4 = [(THWiOSExpandedViewController *)self expandedRepSourceRep];
    return [v4 hostICC];
  }
}

- (id)p_targetICC
{
  if ([(THWiOSExpandedViewController *)self isDismissing])
  {
    id v3 = [(THWiOSExpandedViewController *)self expandedRepSourceRep];
    return [v3 hostICC];
  }
  else
  {
    return [(THWiOSExpandedViewController *)self icc];
  }
}

- (void)interactiveCanvasController:(id)a3 willLayoutRep:(id)a4
{
  if ([(THWiOSExpandedViewController *)self p_targetICC] == a3)
  {
    id v6 = [(THWiOSExpandedViewController *)self drawableToPresent];
    if ([a4 info] == v6)
    {

      self->mContentsRep = 0;
      self->mContentsRep = (TSDRep *)a4;
      id v7 = (void *)TSUProtocolCast();
      if (objc_opt_respondsToSelector()) {
        [v7 expandedWillPresentWithController:self];
      }
    }
    if (-[THWiOSExpandedViewController p_hasSourceRepForInfo:](self, "p_hasSourceRepForInfo:", [a4 info]))
    {
      id v8 = -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", [a4 info]);
      [a4 willReplaceContentsFromRep:v8];
    }
  }
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5
{
  id v6 = [(THWiOSExpandedViewController *)self scrollView];
  id v7 = [(UIScrollView *)v6 window];
  if (!v7) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController interactiveCanvasController:clampContentOffset:forViewScale:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:1429 description:@"invalid nil value for '%s'", "window"];
  }
  [v7 bounds];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRectGetHeight(v19);
  [self view].safeAreaInsets;
  [(-[THWiOSExpandedViewController cvc](self, "cvc")).canvasLayer unscaledSize];
  TSDMultiplySizeScalar();
  [(UIScrollView *)v6 bounds];
  [(UIScrollView *)v6 bounds];
  [(UIScrollView *)v6 bounds];
  TSUClamp();
  double v13 = v12;
  [(UIScrollView *)v6 bounds];
  TSUClamp();
  double v15 = v14;
  double v16 = v13;
  result.CGFloat y = v15;
  result.CGFloat x = v16;
  return result;
}

- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4
{
  id v5 = (void *)TSUProtocolCast();
  if (v5)
  {
    [v5 setDelegate:self];
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  [self view:a4.origin.x, a4.origin.y, a4.size.width, a4.size.height].bounds;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(THWiOSExpandedViewController *)self view];
  id v15 = [a3 canvasView];

  [v14 convertRect:v15 toView:v7];
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  id v4 = [(TSDiOSCanvasViewController *)[(THWiOSExpandedViewController *)self cvc] view];

  [v4 bounds];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)additionalGestureTargetsForInteractiveCanvasController:(id)a3 gesture:(id)a4
{
  id v6 = +[NSMutableArray array];
  [(THWiOSExpandedViewController *)self expandedRep];
  uint64_t v7 = TSUProtocolCast();
  id v8 = [a4 gestureKind];
  if (v8 == (id)TSDFreeTransform && v7 != 0) {
    [v6 addObject:v7];
  }
  [v6 addObject:self];
  return v6;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  return (id)TSUProtocolCast();
}

- (void)exitAVPresentation:(id)a3
{
  [(THWiOSExpandedViewController *)self dismissExpandedAnimatedWithCompletionBlock:&stru_459EF8];

  [a3 setDelegate:0];
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (int)widgetLayoutMode:(id)a3
{
  return 1;
}

- (BOOL)widgetLayoutIsCompactFlow:(id)a3
{
  return 0;
}

- (BOOL)widgetLayoutIsReflowablePresentation:(id)a3
{
  return 0;
}

- (CGRect)widgetLayoutBounds
{
  [self view].bounds;
  [(THWiOSExpandedViewController *)self _safeAreaInsets];

  TSDRectWithSize();
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)expandedRepControllerInvalidateChildrenInPanel:(int)a3 invalidateWPAuto:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  -[THWAdornmentController invalidateChildrenInPanel:](self->_adornmentController, "invalidateChildrenInPanel:");
  if (v4)
  {
    adornmentController = self->_adornmentController;
    [(THWAdornmentController *)adornmentController invalidateWPAutoInPanel:v5];
  }
}

- (id)expandedRepSourceRep
{
  double v3 = [(THWiOSExpandedViewController *)self delegate];
  BOOL v4 = [(THWiOSExpandedViewController *)self drawableToPresent];

  return [(THWExpandedViewControllerDelegate *)v3 expandableRepForInfo:v4];
}

- (void)expandedRepControllerAnimatePanel:(int)a3 withCrossFadeContent:(BOOL)a4 backgroundLayout:(BOOL)a5 duration:(double)a6
{
}

- (void)expandedRepControllerUpdatePanelVisibility
{
}

- (BOOL)expandedRepControllerHasRoomForPanels
{
  return [(THWAdornmentController *)self->_adornmentController hasRoomForPanels];
}

- (double)expandedHeightForPanel:(int)a3 allowDefault:(BOOL)a4
{
  adornmentController = self->_adornmentController;
  if (adornmentController)
  {
    [(THWAdornmentController *)adornmentController heightForPanel:*(void *)&a3 allowDefault:a4];
  }
  else
  {
    double result = 44.0;
    if (a3 >= 3 || !a4) {
      return 0.0;
    }
  }
  return result;
}

- (void)presentRepExpanded:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController presentRepExpanded:]");
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:1635 description:@"Main canvas widget host should handle this."];
}

- (BOOL)repIsPresentedExpanded:(id)a3
{
  return 0;
}

- (void)presentPopoverForPopUpInfo:(id)a3 withFrame:(CGRect)a4 inLayer:(id)a5
{
  if (!+[NSThread isMainThread])
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController presentPopoverForPopUpInfo:withFrame:inLayer:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:1647 description:@"This operation must only be performed on the main thread."];
  }
}

- (BOOL)inFlowMode
{
  objc_super v2 = [(THWiOSExpandedViewController *)self delegate];

  return [(THWExpandedViewControllerDelegate *)v2 inFlowMode];
}

- (CGSize)widgetHostExpandedSize
{
  [self view].frame;
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.CGFloat width = v3;
  return result;
}

- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3
{
  return 1;
}

- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3
{
  return 0;
}

- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3
{
  return 1;
}

- (id)hostCanvasLayer
{
  id v2 = [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] layerHost];

  return [v2 canvasLayer];
}

- (void)p_setOnCanvasRepShadowLayerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  [(THWiOSExpandedViewController *)self expandedRepSourceRep];
  double v4 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 styledRep];
    objc_msgSend(objc_msgSend(v5, "shadowLayer"), "setHidden:", v3);
    id v6 = [v5 reflectionLayer];
    [v6 setHidden:v3];
  }
}

- (CGRect)rectForCompletionAnimationWithRep:(id)a3
{
  [(THWiOSExpandedViewController *)self expandedRepSourceRep];
  double v4 = (void *)TSUProtocolCast();
  if (v4) {
    [v4 rectForCompletion];
  }
  else {
    objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "layout"), "frameInParent");
  }
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController freeTransformDidBeginWithRep:expandableRep:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m") lineNumber:1722 description:@"This operation must only be performed on the main thread."];
  }
  self->mControlsVisibleBeforeTransform = [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] adornmentsVisible];
  self->_freeTransformWasCancelled = 0;
  [(THWiOSExpandedViewController *)self setFreeTransformInFlight:1];
  [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] setAdornmentsVisible:0 buttonVisible:0 controlsVisible:0 forceVisibility:1 animated:1 completionBlock:0];
  objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "targetLayer"), "setHidden:", 1);
  [self view].backgroundColor = [UIColor clearColor];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_14B688;
  v5[3] = &unk_456DE0;
  v5[4] = self;
  +[UIView animateWithDuration:v5 animations:0.5];
  [(THWiOSExpandedViewController *)self p_setOnCanvasRepShadowLayerHidden:1];
  [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerWillBeginDismissing:self];
}

- (void)freeTransformDidEndWithRep:(id)a3 expandableRep:(id)a4 completionBlock:(id)a5
{
  -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 0, a4);

  [(THWiOSExpandedViewController *)self p_dismissExpandedAnimatedWithCompletionBlock:a5 freeTransformDidEnd:1];
}

- (void)freeTransformPostAnimationDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
}

- (void)freeTransformDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  [(THWExpandedViewControllerDelegate *)[(THWiOSExpandedViewController *)self delegate] expandedViewControllerDidCancelDismiss:self];
  self->_freeTransformWasCancelled = 1;
  [(THWiOSExpandedViewController *)self p_updateBackgroundColor];
  if (self->mControlsVisibleBeforeTransform) {
    [(THWAdornmentController *)[(THWiOSExpandedViewController *)self adornmentController] setAdornmentsVisible:1 animated:1 completionBlock:0];
  }
  objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "targetLayer"), "setHidden:", 0);
  [(THWiOSExpandedViewController *)self p_setWantsStatusBarVisible:0];

  [(THWiOSExpandedViewController *)self p_setOnCanvasRepShadowLayerHidden:0];
}

- (void)freeTransformWillFadeOutCurtain:(id)a3 expandableRep:(id)a4
{
  if (self->_freeTransformWasCancelled) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [(THWiOSExpandedViewController *)self im_isCompactHeight] ^ 1;
  }
  -[THWiOSExpandedViewController p_setWantsStatusBarVisible:](self, "p_setWantsStatusBarVisible:", v5, a4);
  [(THWiOSExpandedViewController *)self expandedRep];
  if (objc_opt_respondsToSelector())
  {
    double v6 = +[UIColor clearColor];
    double v7 = [(THWiOSExpandedViewController *)self scrollView];
    [(UIScrollView *)v7 setBackgroundColor:v6];
  }
}

- (void)handleCloseForAdornmentController:(id)a3
{
}

- (BOOL)adornmentController:(id)a3 allowWindowMoveForPanel:(int)a4
{
  return a4 == 0;
}

- (unint64_t)widgetInteractionModeForRep:(id)a3
{
  return 1;
}

- (void)progressDidChangeForRep:(id)a3 percent:(id)a4
{
  [(THWiOSExpandedViewController *)self delegate];
  double v6 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    [v6 interactiveCanvasController:0 progressDidChangeForRep:a3 percent:a4];
  }
}

- (void)scoreDidChangeForRep:(id)a3 score:(id)a4 total:(id)a5
{
  [(THWiOSExpandedViewController *)self delegate];
  double v8 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    [v8 interactiveCanvasController:0 scoreDidChangeForRep:a3 score:a4 total:a5];
  }
}

- (void)resetAttemptForRep:(id)a3
{
  [(THWiOSExpandedViewController *)self delegate];
  double v4 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    [v4 interactiveCanvasController:0 resetAttemptForRep:a3];
  }
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  [(THWiOSExpandedViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v9 = [(THWiOSExpandedViewController *)self delegate];

  return [(THWExpandedViewControllerDelegate *)v9 expandedViewController:self actionForHyperlink:a3 inRep:a4 gesture:a5];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  double v6 = [(THWiOSExpandedViewController *)self expandedRep];
  if (a4)
  {
    double v7 = v6;
    if (objc_opt_respondsToSelector())
    {
      if ([(THWExpandedRep *)v7 expandedShouldDismissOnChangeFromSizeClassPairWithController:self flowMode:[(THWiOSExpandedViewController *)self inFlowMode]])
      {
        [(THWiOSExpandedViewController *)self dismissExpandedImmediate];
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  [(THWiOSExpandedViewController *)&v4 viewDidAppear:a3];
  [(THWiOSExpandedViewController *)self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)p_addKeyCommands
{
  BOOL v3 = [(THWiOSExpandedViewController *)self expandedRep];
  uint64_t v4 = TSUProtocolCast();
  uint64_t v5 = TSUProtocolCast();
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"p_handleEscapeKey:"]];
  if (!v4)
  {
    if (!v5) {
      return;
    }
    CFStringRef v6 = @" ";
    double v7 = &selRef_p_handleMediaTransportKey_;
    goto LABEL_9;
  }
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@" " modifierFlags:0 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@" " modifierFlags:0x20000 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:UIKeyInputLeftArrow modifierFlags:0 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:UIKeyInputRightArrow modifierFlags:0 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"\n" modifierFlags:0 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"\t" modifierFlags:0 action:"p_handleNavigationKey:"]];
  [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"\t" modifierFlags:0x20000 action:"p_handleNavigationKey:"]];
  if (objc_opt_respondsToSelector())
  {
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"0" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"1" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"2" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"3" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"4" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"5" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"6" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"7" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"8" modifierFlags:0 action:"p_handleNumber:"]];
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"9" modifierFlags:0 action:"p_handleNumber:"]];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THWExpandedRep *)v3 expandedContentAllowPinchZoom])
  {
    [(THWiOSExpandedViewController *)self addKeyCommand:+[UIKeyCommand keyCommandWithInput:@"+" modifierFlags:0 action:"p_handleZoomInKey:"]];
    CFStringRef v6 = @"-";
    double v7 = &selRef_p_handleZoomOutKey_;
LABEL_9:
    double v8 = +[UIKeyCommand keyCommandWithInput:v6 modifierFlags:0 action:*v7];
    [(THWiOSExpandedViewController *)self addKeyCommand:v8];
  }
}

- (void)p_handleEscapeKey:(id)a3
{
}

- (void)p_handleNavigationKey:(id)a3
{
  [(THWiOSExpandedViewController *)self expandedRep];
  uint64_t v4 = (void *)TSUProtocolCast();
  v6[0] = UIKeyInputRightArrow;
  v6[1] = @"\r";
  v6[2] = @"\n";
  if (-[NSArray containsObject:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3), "containsObject:", [a3 input]))
  {
    goto LABEL_2;
  }
  uint64_t v5 = UIKeyInputLeftArrow;
  if (!-[NSArray containsObject:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1), "containsObject:", [a3 input]))
  {
    if (!objc_msgSend(&off_499A70, "containsObject:", objc_msgSend(a3, "input"))) {
      return;
    }
    if (([a3 modifierFlags] & 0x20000) == 0)
    {
LABEL_2:
      [v4 handleNavigateNextCommand];
      return;
    }
  }
  [v4 handleNavigatePreviousCommand];
}

- (void)p_handleNumber:(id)a3
{
  [(THWiOSExpandedViewController *)self expandedRep];
  uint64_t v4 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "input"), "integerValue");
    [v4 handleNavigateCommandWithNumber:v5];
  }
}

- (void)p_handleMediaTransportKey:(id)a3
{
  [(THWiOSExpandedViewController *)self expandedRep];
  uint64_t v4 = (void *)TSUProtocolCast();
  if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", @" "))
  {
    [v4 handleTransportPlayPauseCommand];
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputRightArrow))
  {
    if ([a3 modifierFlags] == &loc_100000)
    {
      [v4 handleTransportFastforwardCommand];
    }
    else
    {
      [v4 handleTransportNextFrameCommand];
    }
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputLeftArrow))
  {
    if ([a3 modifierFlags] == &loc_100000)
    {
      [v4 handleTransportRewindCommand];
    }
    else
    {
      [v4 handleTransportPreviousFrameCommand];
    }
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputUpArrow))
  {
    [v4 handleTransportIncreaseVolumeCommand];
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputDownArrow))
  {
    [v4 handleTransportDecreaseVolumeCommand];
  }
}

- (void)p_handleZoomInKey:(id)a3
{
}

- (void)p_handleZoomOutKey:(id)a3
{
}

- (void)zoomInOrOut:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] viewScale];
  double v6 = v5;
  if (v3)
  {
    [(THWiOSExpandedViewController *)self expandedRep];
    char v7 = objc_opt_respondsToSelector();
    double v8 = 8.0;
    if (v7) {
      [(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedContentMaximumZoomScale];
    }
    double v9 = v6 * 1.5;
    if (v6 * 1.5 > v8) {
      double v9 = v8;
    }
  }
  else
  {
    [(THWiOSExpandedViewController *)self originalViewScale];
    double v11 = v10;
    [(THWiOSExpandedViewController *)self expandedRep];
    if (objc_opt_respondsToSelector())
    {
      [(THWExpandedRep *)[(THWiOSExpandedViewController *)self expandedRep] expandedContentMinimumZoomScale];
      double v11 = v12;
    }
    if (v6 / 1.5 >= v11) {
      double v9 = v6 / 1.5;
    }
    else {
      double v9 = v11;
    }
  }
  if (vabdd_f64(v6, v9) >= 0.00999999978)
  {
    -[THWiOSExpandedViewController p_updateContentOffsetFromCurrentViewScale:toNewViewScale:animated:duration:completion:](self, "p_updateContentOffsetFromCurrentViewScale:toNewViewScale:animated:duration:completion:", 1, 0, v6);
  }
}

- (void)p_updateContentOffsetFromCurrentViewScale:(double)a3 toNewViewScale:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  [(TSDInteractiveCanvasController *)[(THWiOSExpandedViewController *)self icc] contentOffset];
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] bounds];
  CGRectGetWidth(v21);
  [(UIScrollView *)[(THWiOSExpandedViewController *)self scrollView] bounds];
  CGRectGetHeight(v22);
  TSDMultiplyPointScalar();
  TSDAddPoints();
  TSDMultiplyPointScalar();
  TSDSubtractPoints();
  TSDMultiplyPointScalar();
  double v13 = v12;
  double v15 = v14;
  double v16 = [(THWiOSExpandedViewController *)self icc];
  if (v9)
  {
    if (a6 == 0.0) {
      double v17 = 0.3;
    }
    else {
      double v17 = a6;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_14C568;
    v19[3] = &unk_457CF8;
    v19[4] = a7;
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:completion:](v16, "setViewScale:contentOffset:clampOffset:animationDuration:completion:", 1, v19, a4, v13, v15, v17);
  }
  else
  {
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](v16, "setViewScale:contentOffset:clampOffset:animated:", 0, 0, a4, v13, v15);
    if (a7)
    {
      double v18 = (void (*)(id))*((void *)a7 + 2);
      v18(a7);
    }
  }
}

- (THWExpandedViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWExpandedViewControllerDelegate *)a3;
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (TSDInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
}

- (TSDiOSCanvasViewController)cvc
{
  return self->_cvc;
}

- (void)setCvc:(id)a3
{
}

- (THWAdornmentController)adornmentController
{
  return self->_adornmentController;
}

- (void)setAdornmentController:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (TSDInfo)drawableToPresent
{
  return self->_drawableToPresent;
}

- (void)setDrawableToPresent:(id)a3
{
}

- (double)originalViewScale
{
  return self->_originalViewScale;
}

- (void)setOriginalViewScale:(double)a3
{
  self->_originalViewScale = a3;
}

- (CALayer)rotationScrim
{
  return self->_rotationScrim;
}

- (void)setRotationScrim:(id)a3
{
  self->_rotationScrim = (CALayer *)a3;
}

- (BOOL)allowZoom
{
  return self->_allowZoom;
}

- (void)setAllowZoom:(BOOL)a3
{
  self->_allowZoom = a3;
}

- (THWFreeTransformGestureRecognizer)transformGR
{
  return self->_transformGR;
}

- (void)setTransformGR:(id)a3
{
}

- (THWFreeTransformController)ftc
{
  return self->_ftc;
}

- (void)setFtc:(id)a3
{
}

- (CGRect)preRotateViewFrame
{
  double x = self->_preRotateViewFrame.origin.x;
  double y = self->_preRotateViewFrame.origin.y;
  double width = self->_preRotateViewFrame.size.width;
  double height = self->_preRotateViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreRotateViewFrame:(CGRect)a3
{
  self->_preRotateViewFrame = a3;
}

- (THWExpandedTransitionRotationAnimationController)expandedRotationAnimationController
{
  return self->_expandedRotationAnimationController;
}

- (void)setExpandedRotationAnimationController:(id)a3
{
}

- (BOOL)disablePanelAnimation
{
  return self->_disablePanelAnimation;
}

- (void)setDisablePanelAnimation:(BOOL)a3
{
  self->_disablePanelAnimation = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (BOOL)wantsStatusBarVisible
{
  return self->_wantsStatusBarVisible;
}

- (void)setWantsStatusBarVisible:(BOOL)a3
{
  self->_wantsStatusBarVisible = a3;
}

- (int)expandedRepControllerState
{
  return self->_expandedRepControllerState;
}

- (void)setExpandedRepControllerState:(int)a3
{
  self->_expandedRepControllerState = a3;
}

- (BOOL)wasTornDown
{
  return self->_wasTornDown;
}

- (void)setWasTornDown:(BOOL)a3
{
  self->_wasTornDown = a3;
}

- (BOOL)freeTransformWasCancelled
{
  return self->_freeTransformWasCancelled;
}

- (void)setFreeTransformWasCancelled:(BOOL)a3
{
  self->_freeTransformWasCancelled = a3;
}

- (BOOL)freeTransformInFlight
{
  return self->_freeTransformInFlight;
}

- (void)setFreeTransformInFlight:(BOOL)a3
{
  self->_freeTransformInFlight = a3;
}

@end