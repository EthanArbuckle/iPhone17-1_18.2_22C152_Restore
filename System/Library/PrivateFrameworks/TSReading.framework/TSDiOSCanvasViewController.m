@interface TSDiOSCanvasViewController
- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement;
- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement;
- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)contextMenuMightBeDisplayed;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)isDraggingViaGuidedPan;
- (BOOL)isInFocusedContainer;
- (BOOL)isPopoverGestureInFlight;
- (BOOL)isRotating;
- (BOOL)p_shouldUseWideGamut;
- (BOOL)repDragGestureRecognizer:(id)a3 shouldBeginTapHoldTrackingAtScaledPoint:(CGPoint)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldIgnoreTextGestures;
- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3;
- (CALayer)clippingLayer;
- (CALayer)layer;
- (CGRect)targetRectForEditMenu:(id)a3;
- (Class)audioInspectorPaneClass;
- (Class)movieInspectorPaneClass;
- (NSArray)commonGestureRecognizers;
- (NSSet)panGestureRecognizers;
- (TSDAllTouchesDoneGestureRecognizer)allTouchesDoneGestureRecognizer;
- (TSDCanvasLayer)canvasLayer;
- (TSDCanvasSubviewsController)subviewsController;
- (TSDCanvasView)canvasView;
- (TSDEditMenuTapGestureRecognizer)editMenuTapGestureRecognizer;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSDKnobDragGestureRecognizer)knobDragGestureRecognizer;
- (TSDMultiSelectGestureRecognizer)multiSelectGestureRecognizer;
- (TSDNudgeGestureRecognizer)nudgeGestureRecognizer;
- (TSDPreventScrollGestureRecognizer)preventScrollGestureRecognizer;
- (TSDRepDragGestureRecognizer)repDragGestureRecognizer;
- (TSDRepRotateGestureRecognizer)repRotateGestureRecognizer;
- (TSDiOSCanvasViewControllerDelegate)delegate;
- (UIPanGestureRecognizer)guidedPanGestureRecognizer;
- (UIPinchGestureRecognizer)zoomGestureRecognizer;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)singleTapGestureRecognizer;
- (id)extraMenuItems;
- (id)hitKnobWithTouch:(id)a3 returningRep:(id *)a4;
- (id)hitRepWithTouch:(id)a3;
- (id)itemsToAddToEditMenuForRep:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)newAudioPlaybackHUDWithFrame:(CGRect)a3 audioRep:(id)a4 delegate:(id)a5;
- (id)newMoviePlaybackHUDWithFrame:(CGRect)a3 playerController:(id)a4 movieRep:(id)a5;
- (id)p_willPresentError:(id)a3;
- (id)topLevelReps;
- (id)viewForGestureRecognizer:(id)a3;
- (void)addInspectorPanZoomModeGRsToArray:(id)a3;
- (void)beginInspectorPanZoomModeWithSingleTapBlock:(id)a3;
- (void)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (void)canvasZoomTracker:(id)a3 willBeginViewScaleFeedbackWithFastPinch:(BOOL)a4;
- (void)canvasZoomTrackerDidEndFinalZoomAnimation:(id)a3;
- (void)canvasZoomTrackerDidFinish:(id)a3;
- (void)canvasZoomTrackerWillBeginFinalZoomAnimation:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)endInspectorPanZoomMode;
- (void)endModalOperation;
- (void)forceStopScrolling;
- (void)forwardInvocation:(id)a3;
- (void)handleDoubleTap:(id)a3;
- (void)hideEditMenu;
- (void)i_updateZoomGestureRecognizer;
- (void)loadView;
- (void)p_allTouchesDone:(id)a3;
- (void)p_buildMenuItems:(id)a3 forSelection:(id)a4;
- (void)p_didPresentErrorWithRecovery:(BOOL)a3 completionHandler:(void *)a4;
- (void)p_editMenuDidHide:(id)a3;
- (void)p_guidedPanWithGesture:(id)a3;
- (void)p_handleSingleTapGesture:(id)a3;
- (void)p_handleTapForEditMenu:(id)a3;
- (void)p_updateWideGamut;
- (void)p_zoomWithGesture:(id)a3;
- (void)presentError:(id)a3 completionHandler:(id)a4;
- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5;
- (void)presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:(id)a3 completionHandler:(id)a4;
- (void)presentMovieCompatibilityAlertForUnplayableMovieURLs:(id)a3 completionHandler:(id)a4;
- (void)resetGesturesForContextSwitch;
- (void)setAllTouchesDoneGestureRecognizer:(id)a3;
- (void)setContextMenuMightBeDisplayed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setEditMenuTapGestureRecognizer:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setKnobDragGestureRecognizer:(id)a3;
- (void)setMultiSelectGestureRecognizer:(id)a3;
- (void)setNudgeGestureRecognizer:(id)a3;
- (void)setRepDragGestureRecognizer:(id)a3;
- (void)setRepRotateGestureRecognizer:(id)a3;
- (void)setSingleTapGestureRecognizer:(id)a3;
- (void)setUpGestureRecognizers;
- (void)setZoomGestureRecognizer:(id)a3;
- (void)showEditMenu:(id)a3;
- (void)showEditMenuForSelection:(id)a3;
- (void)stopScrolling;
- (void)teardown;
- (void)toggleEditMenuForCurrentSelection;
- (void)unlock:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TSDiOSCanvasViewController

- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement
{
  [(TSDGuidedPanController *)self->mGuidedPanController touchContentPlacement];
  result.var0.y = v3;
  result.var0.x = v2;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement
{
  [(TSDGuidedPanController *)self->mGuidedPanController centerPlusMovementContentPlacement];
  result.var0.y = v3;
  result.var0.x = v2;
  return result;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDiOSCanvasViewController;
  if (-[TSDiOSCanvasViewController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDiOSCanvasViewController;
    return [(TSDiOSCanvasViewController *)&v6 methodSignatureForSelector:a3];
  }
  else
  {
    id result = (id)methodSignatureForSelector__s_actionMethodSignature_0;
    if (!methodSignatureForSelector__s_actionMethodSignature_0)
    {
      id result = (id)[MEMORY[0x263EFF970] signatureWithObjCTypes:objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%s%s%s%s", "v", "@", ":", "@"), "UTF8String")];
      methodSignatureForSelector__s_actionMethodSignature_0 = (uint64_t)result;
    }
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDiOSCanvasViewController;
  if (-[TSDiOSCanvasViewController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = +[TSDInteractiveCanvasController selectorIsActionMethod:a3];
    if (v5)
    {
      [(TSDiOSCanvasViewController *)self interactiveCanvasController];
      LOBYTE(v5) = objc_opt_respondsToSelector();
    }
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  v4 = [(TSDiOSCanvasViewController *)self interactiveCanvasController];

  [a3 invokeWithTarget:v4];
}

- (void)dealloc
{
  if (!self->mHasBeenTornDown)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 151, @"CVC should have been torn down before dealloc");
  }

  self->mInspectorGestureRecognizersToReenable = 0;
  self->mInspectorSingleTapBlock = 0;

  self->mSingleTapGestureRecognizer = 0;
  self->mDoubleTapGestureRecognizer = 0;

  self->mEditMenuTapGestureRecognizer = 0;
  self->mKnobDragGestureRecognizer = 0;

  self->mMultiSelectGestureRecognizer = 0;
  self->mRepDragGestureRecognizer = 0;

  self->mRepRotateGestureRecognizer = 0;
  self->mZoomGestureRecognizer = 0;

  self->mNudgeGestureRecognizer = 0;
  self->mAllTouchesDoneGestureRecognizer = 0;

  self->mPreventScrollGestureRecognizer = 0;
  self->mGuidedPanGestureRecognizer = 0;

  self->mGuidedPanController = 0;
  self->mSubviewsController = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSDiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v5 dealloc];
}

- (void)teardown
{
  if ([(TSDiOSCanvasViewController *)self isViewLoaded])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
    [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] teardown];
  }
  self->mHasBeenTornDown = 1;
  [(TSDCanvasSubviewsController *)self->mSubviewsController teardown];
  if ([(NSSet *)[(TSDCanvasSubviewsController *)self->mSubviewsController repChildViews] count])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController teardown]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 183, @"subviews of cvc %@ not torn down: %@", self, -[TSDCanvasSubviewsController repChildViews](self->mSubviewsController, "repChildViews") file lineNumber description];
  }
  [(TSDiOSCanvasViewController *)self resignFirstResponder];
  [(TSDInteractiveCanvasController *)self->mICC i_layerHostHasBeenTornDown];
  self->mICC = 0;
}

- (void)loadView
{
  double v3 = objc_alloc_init(TSDCanvasView);

  [(TSDiOSCanvasViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)TSDiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v14 viewDidLoad];
  double v3 = [(TSDiOSCanvasViewController *)self canvasView];
  if (v3)
  {
    uint64_t v4 = v3;
    self->mSubviewsController = [[TSDCanvasSubviewsController alloc] initWithLayerAndSubviewHost:self];
    [(TSDiOSCanvasViewController *)self setWantsFullScreenLayout:1];
    if (!self->mICC)
    {
      objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController viewDidLoad]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 211, @"invalid nil value for '%s'", "mICC");
    }
    [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] viewScale];
    double v8 = v7;
    [(TSDCanvasView *)v4 setController:self->mICC];
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)self->mICC canvas] setViewScale:v8];
    v9 = [(TSDInteractiveCanvasController *)self->mICC canvas];
    TSUScreenScale();
    -[TSDCanvas i_setContentsScale:](v9, "i_setContentsScale:");
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)self->mICC canvas] i_setCanvasIsWideGamut:[(TSDiOSCanvasViewController *)self p_shouldUseWideGamut]];
    [(TSDCanvasView *)v4 setMultipleTouchEnabled:1];
    [(TSDCanvasView *)v4 setExclusiveTouch:1];
    [(TSDCanvasView *)v4 setClipsToBounds:1];
    [(TSDCanvasView *)v4 setClearsContextBeforeDrawing:0];
    v10 = [(TSDCanvasView *)v4 enclosingScrollView];
    if (v10)
    {
      v11 = v10;
      if (![(TSKScrollView *)v10 delegate]) {
        [(TSKScrollView *)v11 setDelegate:self->mICC];
      }
      [(TSDCanvasLayer *)[(TSDiOSCanvasViewController *)self canvasLayer] fixFrameAndScrollView];
      [(TSKScrollView *)v11 setAutoresizesSubviews:0];
      [(TSKScrollView *)v11 setDelaysContentTouches:0];
      [(TSKScrollView *)v11 setCanCancelContentTouches:1];
    }
    [(TSDInteractiveCanvasController *)self->mICC setTextGesturesInFlight:0];
    [(TSDiOSCanvasViewController *)self setUpGestureRecognizers];
    [(TSDiOSCanvasViewController *)self becomeFirstResponder];
  }
  else
  {
    v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController viewDidLoad]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 199, @"invalid nil value for '%s'", "canvasView");
  }
}

- (BOOL)p_shouldUseWideGamut
{
  double v3 = (void *)[(TSDiOSCanvasViewController *)self traitCollection];
  if (!v3 || (uint64_t v4 = [v3 displayGamut], v4 == -1))
  {
    objc_super v5 = objc_msgSend((id)objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view"), "window"), "traitCollection");
    if (v5) {
      uint64_t v4 = [v5 displayGamut];
    }
    else {
      uint64_t v4 = -1;
    }
  }
  return v4 == 1 || v4 == -1;
}

- (void)p_updateWideGamut
{
  double v3 = [(TSDInteractiveCanvasController *)self->mICC canvas];
  BOOL v4 = [(TSDiOSCanvasViewController *)self p_shouldUseWideGamut];
  if (v4 != [(TSDCanvas *)v3 canvasIsWideGamut])
  {
    [(TSDCanvas *)v3 i_setCanvasIsWideGamut:v4];
    mICC = self->mICC;
    [(TSDInteractiveCanvasController *)mICC i_canvasWideGamutValueDidChange];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v4 viewWillAppear:a3];
  [(TSDiOSCanvasViewController *)self p_updateWideGamut];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] currentlyScrolling])
  {
    [(TSDiOSCanvasViewController *)self forceStopScrolling];
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v5 viewWillDisappear:v3];
}

- (BOOL)becomeFirstResponder
{
  [(TSDInteractiveCanvasController *)self->mICC i_cvcWillBecomeFirstResponder];
  v4.receiver = self;
  v4.super_class = (Class)TSDiOSCanvasViewController;
  return [(TSDiOSCanvasViewController *)&v4 becomeFirstResponder];
}

- (TSDCanvasLayer)canvasLayer
{
  objc_opt_class();
  objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view"), "layer");

  return (TSDCanvasLayer *)TSUDynamicCast();
}

- (TSDCanvasView)canvasView
{
  objc_opt_class();
  [(TSDiOSCanvasViewController *)self view];

  return (TSDCanvasView *)TSUDynamicCast();
}

- (CALayer)layer
{
  double v2 = (void *)[(TSDiOSCanvasViewController *)self view];

  return (CALayer *)[v2 layer];
}

- (CALayer)clippingLayer
{
  double v2 = [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView];

  return (CALayer *)[(TSKScrollView *)v2 layer];
}

- (BOOL)isInFocusedContainer
{
  return 1;
}

- (id)hitRepWithTouch:(id)a3
{
  if ([(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] allowLayoutAndRenderOnThread]&& [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] currentlyScrolling])
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController hitRepWithTouch:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 350, @"unsafe to find hit reps during scroll if we layout and render on a thread during scroll");
  }
  if (a3)
  {
    objc_msgSend(a3, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:]([(TSDiOSCanvasViewController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v7, v8);
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(TSDiOSCanvasViewController *)self interactiveCanvasController];
    return -[TSDInteractiveCanvasController hitRep:](v13, "hitRep:", v10, v12);
  }
  else
  {
    v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController hitRepWithTouch:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 351, @"invalid nil value for '%s'", "touch");
    return 0;
  }
}

- (id)hitKnobWithTouch:(id)a3 returningRep:(id *)a4
{
  if (a3)
  {
    objc_msgSend(a3, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:]([(TSDiOSCanvasViewController *)self interactiveCanvasController], "convertBoundsToUnscaledPoint:", v6, v7);
    double v9 = v8;
    double v11 = v10;
    double v12 = [(TSDiOSCanvasViewController *)self interactiveCanvasController];
    return -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](v12, "hitKnobAtPoint:returningRep:", a4, v9, v11);
  }
  else
  {
    objc_super v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController hitKnobWithTouch:returningRep:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 366, @"invalid nil value for '%s'", "touch");
    if (a4) {
      *a4 = 0;
    }
    return 0;
  }
}

- (NSArray)commonGestureRecognizers
{
  return (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", -[TSDiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"), -[TSDiOSCanvasViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer"), -[TSDiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"), -[TSDiOSCanvasViewController knobDragGestureRecognizer](self, "knobDragGestureRecognizer"), -[TSDiOSCanvasViewController multiSelectGestureRecognizer](self, "multiSelectGestureRecognizer"), -[TSDiOSCanvasViewController repDragGestureRecognizer](self, "repDragGestureRecognizer"), -[TSDiOSCanvasViewController repRotateGestureRecognizer](self, "repRotateGestureRecognizer"), -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"), -[TSDiOSCanvasViewController nudgeGestureRecognizer](self, "nudgeGestureRecognizer"), 0);
}

- (NSSet)panGestureRecognizers
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", -[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), self->mGuidedPanGestureRecognizer, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->mGuidedPanGestureRecognizer == a3)
  {
    [(TSDInteractiveCanvasController *)self->mICC delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_super v5 = [(TSDInteractiveCanvasController *)self->mICC delegate];
      mICC = self->mICC;
      [(UIPanGestureRecognizer *)self->mGuidedPanGestureRecognizer direction];
      return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldUseGuidedPan:withMovementDirection:](v5, "interactiveCanvasControllerShouldUseGuidedPan:withMovementDirection:", mICC);
    }
    else
    {
      return 0;
    }
  }
  else if ([(TSDiOSCanvasViewController *)self zoomGestureRecognizer] == a3)
  {
    return [(TSKScrollView *)[(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView] isDragging] ^ 1;
  }
  else
  {
    return 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if ([(TSDiOSCanvasViewController *)self zoomGestureRecognizer] == a3
    || self->mGuidedPanGestureRecognizer == a3)
  {
    return 1;
  }
  double v7 = [(TSDiOSCanvasViewController *)self canvasView];
  [a4 locationInView:v7];
  uint64_t v8 = -[TSDCanvasView hitTest:withEvent:](v7, "hitTest:withEvent:", 0);
  if ([(TSDiOSCanvasViewController *)self editMenuTapGestureRecognizer] == a3) {
    self->mContextMenuMightBeDisplayed = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "isMenuVisible");
  }
  return v8 == (void)v7;
}

- (void)setUpGestureRecognizers
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    BOOL v3 = [(TSDiOSCanvasViewController *)self canvasView];
    if (objc_msgSend((id)-[TSDCanvasView gestureRecognizers](v3, "gestureRecognizers"), "count"))
    {
      objc_super v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController setUpGestureRecognizers]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 458, @"-[TSDICC setUpGestureRecognizers] should be called only once each time the view is loaded");
    }
    double v6 = [[TSDTapGestureRecognizer alloc] initWithTarget:self action:sel_p_handleSingleTapGesture_];
    [(TSDTapGestureRecognizer *)v6 setDelegate:self];
    [(TSDCanvasView *)v3 addGestureRecognizer:v6];
    [(TSDiOSCanvasViewController *)self setSingleTapGestureRecognizer:v6];

    double v7 = [[TSDTapGestureRecognizer alloc] initWithTarget:self action:sel_handleDoubleTap_];
    [(TSDTapGestureRecognizer *)v7 setNumberOfTapsRequired:2];
    [(TSDTapGestureRecognizer *)v7 setDelegate:self];
    [(TSDCanvasView *)v3 addGestureRecognizer:v7];
    [(TSDiOSCanvasViewController *)self setDoubleTapGestureRecognizer:v7];

    uint64_t v8 = [[TSDEditMenuTapGestureRecognizer alloc] initWithTarget:self action:sel_p_handleTapForEditMenu_];
    [(TSDEditMenuTapGestureRecognizer *)v8 setDelegate:self];
    [(TSDEditMenuTapGestureRecognizer *)v8 requireGestureRecognizerToFail:[(TSDiOSCanvasViewController *)self doubleTapGestureRecognizer]];
    [(TSDCanvasView *)v3 addGestureRecognizer:v8];
    [(TSDiOSCanvasViewController *)self setEditMenuTapGestureRecognizer:v8];

    double v9 = [[TSDKnobDragGestureRecognizer alloc] initWithInteractiveCanvasController:self->mICC];
    [(TSDKnobDragGestureRecognizer *)v9 setDelegate:self];
    [(TSDCanvasView *)v3 addGestureRecognizer:v9];
    [(TSDiOSCanvasViewController *)self setKnobDragGestureRecognizer:v9];

    double v10 = [[TSDAllTouchesDoneGestureRecognizer alloc] initWithTarget:self action:sel_p_allTouchesDone_];
    [(TSDAllTouchesDoneGestureRecognizer *)v10 setDelegate:self];
    [(TSDCanvasView *)v3 addGestureRecognizer:v10];
    [(TSDiOSCanvasViewController *)self setAllTouchesDoneGestureRecognizer:v10];

    double v11 = [[TSDCanvasZoomPinchGestureRecognizer alloc] initWithTarget:self action:sel_p_zoomWithGesture_];
    [(TSDCanvasZoomPinchGestureRecognizer *)v11 setDelegate:self];
    [(TSDCanvasZoomPinchGestureRecognizer *)v11 setAllowedTouchTypes:&unk_26D739408];
    [(TSDCanvasView *)v3 addGestureRecognizer:v11];
    [(TSDiOSCanvasViewController *)self setZoomGestureRecognizer:v11];

    [(TSDiOSCanvasViewController *)self i_updateZoomGestureRecognizer];
    double v12 = [[TSDPreventScrollGestureRecognizer alloc] initWithInteractiveCanvasController:self->mICC];
    [(TSDPreventScrollGestureRecognizer *)v12 setDelegate:self];
    [(TSDCanvasView *)v3 addGestureRecognizer:v12];

    self->mPreventScrollGestureRecognizer = v12;
    uint64_t v13 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_p_guidedPanWithGesture_];
    [(UIPanGestureRecognizer *)v13 setDelegate:self];
    [(TSDCanvasView *)v3 addGestureRecognizer:v13];

    self->mGuidedPanGestureRecognizer = v13;
    objc_super v14 = (void *)[(TSKScrollView *)[(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView] panGestureRecognizer];
    [v14 requireGestureRecognizerToFail:v13];
  }
}

- (void)resetGesturesForContextSwitch
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view", 0), "gestureRecognizers");
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isEnabled])
        {
          [v8 setEnabled:0];
          [v8 setEnabled:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  if ([(TSDEditMenuTapGestureRecognizer *)[(TSDiOSCanvasViewController *)self editMenuTapGestureRecognizer] isEnabled])[(TSDEditMenuTapGestureRecognizer *)[(TSDiOSCanvasViewController *)self editMenuTapGestureRecognizer] setIgnoreTargetAction:1]; {
}
  }

- (void)i_updateZoomGestureRecognizer
{
  BOOL v3 = [(TSDCanvasLayer *)[(TSDiOSCanvasViewController *)self canvasLayer] allowsPinchZoom];
  uint64_t v4 = [(TSDiOSCanvasViewController *)self zoomGestureRecognizer];

  [(UIPinchGestureRecognizer *)v4 setEnabled:v3];
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  -[TSDInteractiveCanvasController setLastTapPoint:](self->mICC, "setLastTapPoint:");
  if ([(TSDiOSCanvasViewControllerDelegate *)self->mDelegate inFindReplaceMode])
  {
    -[TSDiOSCanvasViewControllerDelegate handleFindTapAtPoint:](self->mDelegate, "handleFindTapAtPoint:", x, y);
LABEL_11:
    LOBYTE(v10) = 1;
    return v10;
  }
  id v13 = 0;
  id v8 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->mICC, "hitKnobAtPoint:returningRep:", &v13, x, y);
  if (v8 && (objc_msgSend(v13, "handleSingleTapAtPoint:onKnob:", v8, x, y) & 1) != 0
    || (id v9 = -[TSDInteractiveCanvasController hitRep:](self->mICC, "hitRep:", x, y), ![v9 repForSelecting])&& (objc_msgSend(v9, "shouldIgnoreSingleTapAtPoint:withRecognizer:", a4, x, y) & 1) != 0|| (v10 = -[TSDInteractiveCanvasController handleSingleTapAtPoint:](self->mICC, "handleSingleTapAtPoint:", x, y)))
  {
    if (self->mInspectorModeEnabled)
    {
      mInspectorSingleTapBlock = (void (**)(void))self->mInspectorSingleTapBlock;
      if (mInspectorSingleTapBlock) {
        mInspectorSingleTapBlock[2]();
      }
    }
    goto LABEL_11;
  }
  return v10;
}

- (void)handleDoubleTap:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    mICC = self->mICC;
    double v7 = [(TSDiOSCanvasViewController *)self canvasView];
    [v5 firstTapLocation];
    -[TSDCanvasView convertPoint:fromView:](v7, "convertPoint:fromView:", 0);
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
    double v9 = v8;
    double v11 = v10;
    if (!-[TSDiOSCanvasViewController handleDoubleTapAtPoint:withRecognizer:](self, "handleDoubleTapAtPoint:withRecognizer:", v5))
    {
      long long v12 = self->mICC;
      -[TSDInteractiveCanvasController handleDoubleTapAtPoint:](v12, "handleDoubleTapAtPoint:", v9, v11);
    }
  }
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v13 = 0;
  id v8 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->mICC, "hitKnobAtPoint:returningRep:", &v13);
  if (v8 && (objc_msgSend(v13, "handleDoubleTapAtPoint:onKnob:", v8, x, y) & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    double v9 = objc_msgSend(-[TSDInteractiveCanvasController hitRep:](self->mICC, "hitRep:", x, y), "repForSelecting");
    if (v9)
    {
      double v10 = v9;
      if ([v9 info])
      {
        double v11 = [(TSDInteractiveCanvasController *)self->mICC canvasEditor];
        -[TSDCanvasEditor setSelection:](v11, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v11, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_msgSend(v10, "info"))));
      }
      if (objc_opt_respondsToSelector()) {
        LOBYTE(v9) = objc_msgSend(v10, "handleDoubleTapAtPoint:withRecognizer:", a4, x, y);
      }
      else {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
}

- (void)p_allTouchesDone:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);

  [v4 postNotificationName:@"TSDInteractiveCanvasControllerAllTouchesInGestureFinished" object:self];
}

- (void)p_handleTapForEditMenu:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    if (([v4 ignoreTargetAction] & 1) == 0)
    {
      mICC = self->mICC;
      objc_msgSend(v5, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
      double v8 = v7;
      double v10 = v9;
      double v11 = (void *)[v5 touchedRep];
      if (v11)
      {
        long long v12 = v11;
        if (([v11 isSelectedIgnoringLocking] & 1) == 0
          && [(TSDiOSCanvasViewController *)self shouldSelectAndShowEditMenuOnFirstTapForRep:v12])
        {
          [(TSDInteractiveCanvasController *)self->mICC endEditing];
          id v13 = [(TSDInteractiveCanvasController *)self->mICC canvasEditor];
          -[TSDCanvasEditor setSelection:](v13, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v13, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_msgSend(v12, "info"))));
        }
        -[TSDInteractiveCanvasController setLastTapPoint:](self->mICC, "setLastTapPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
        if ([v12 isSelectedIgnoringLocking]
          && (objc_msgSend(v12, "shouldIgnoreEditMenuTapAtPoint:withRecognizer:", v5, v8, v10) & 1) == 0)
        {
          if (self->mContextMenuMightBeDisplayed)
          {
            [(TSDiOSCanvasViewController *)self hideEditMenu];
          }
          else
          {
            [(TSDiOSCanvasViewController *)self showEditMenu:v12];
          }
        }
      }
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  mSingleTapGestureRecognizer = self->mSingleTapGestureRecognizer;
  mEditMenuTapGestureRecognizer = self->mEditMenuTapGestureRecognizer;
  BOOL v6 = mSingleTapGestureRecognizer == a3 && mEditMenuTapGestureRecognizer == a4;
  BOOL result = v6
        || (mSingleTapGestureRecognizer == a4 ? (BOOL v9 = mEditMenuTapGestureRecognizer == a3) : (BOOL v9 = 0),
            v9
         || ([(TSDiOSCanvasViewController *)self preventScrollGestureRecognizer] == a3
          || [(TSDiOSCanvasViewController *)self preventScrollGestureRecognizer] == a4)
         && (id)[(TSKScrollView *)[(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView] panGestureRecognizer] != a3&& (id)[(TSKScrollView *)[(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView] panGestureRecognizer] != a4)|| [(TSDiOSCanvasViewController *)self zoomGestureRecognizer] == a3&& (id)[(TSKScrollView *)[(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView] panGestureRecognizer] == a4;
  return result;
}

- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3
{
  return 1;
}

- (BOOL)shouldIgnoreTextGestures
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDiOSCanvasViewControllerDelegate *)mDelegate shouldIgnoreTextGestures];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)TSDiOSCanvasViewController;
  [(TSDiOSCanvasViewController *)&v26 viewWillTransitionToSize:a3.width withTransitionCoordinator:a3.height];
  [(TSDiOSCanvasViewController *)self forceStopScrolling];
  [(TSDTextInputResponder *)[(TSDInteractiveCanvasController *)self->mICC textInputResponder] canvasWillRotate];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v6 = [(TSDiOSCanvasViewController *)self commonGestureRecognizers];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
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
        double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (![v11 state] || objc_msgSend(v11, "state") == 1 || objc_msgSend(v11, "state") == 2))
        {
          [v11 performSelector:sel_cancelBecauseOfRotation];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }
  [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] i_syncWithLayoutThread];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [(TSDCanvas *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] canvas] topLevelReps];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * j) recursivelyPerformSelectorIfImplemented:sel_canvasWillRotate];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v14);
  }
  self->mRotating = 1;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__TSDiOSCanvasViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_2646B2390;
  v17[4] = self;
  [a4 animateAlongsideTransition:0 completion:v17];
}

unsigned char *__81__TSDiOSCanvasViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  BOOL result = *(unsigned char **)(a1 + 32);
  if (!result[1104])
  {
    objc_msgSend((id)objc_msgSend(result, "interactiveCanvasController"), "i_syncWithLayoutThread");
    *(unsigned char *)(*(void *)(a1 + 32) + 1129) = 0;
    BOOL v3 = (void *)[*(id *)(a1 + 32) interactiveCanvasController];
    return (unsigned char *)[v3 invalidateReps];
  }
  return result;
}

- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDiOSCanvasViewControllerDelegate *)mDelegate allowTouchOutsideCanvasView:a3 forGesture:a4];
}

- (BOOL)repDragGestureRecognizer:(id)a3 shouldBeginTapHoldTrackingAtScaledPoint:(CGPoint)a4
{
  if (!self->mDelegate) {
    return 1;
  }
  double y = a4.y;
  double x = a4.x;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  mDelegate = self->mDelegate;

  return -[TSDiOSCanvasViewControllerDelegate canvasViewController:shouldBeginTapHoldDragAtPoint:](mDelegate, "canvasViewController:shouldBeginTapHoldDragAtPoint:", self, x, y);
}

- (id)viewForGestureRecognizer:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    return (id)[(TSDiOSCanvasViewControllerDelegate *)mDelegate viewForGestureRecognizer:a3];
  }
  else
  {
    return [(TSDiOSCanvasViewController *)self canvasView];
  }
}

- (CGRect)targetRectForEditMenu:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v9 = objc_msgSend(-[TSDEditorController currentEditors](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "currentEditors"), "reverseObjectEnumerator");
  uint64_t v10 = [v9 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v68;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v68 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
      if (objc_opt_respondsToSelector())
      {
        [v14 targetRectForEditMenu];
        double x = v75.origin.x;
        double y = v75.origin.y;
        double width = v75.size.width;
        double height = v75.size.height;
        if (!CGRectIsNull(v75)) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v67 objects:v73 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  v76.origin.double x = x;
  v76.origin.double y = y;
  v76.size.double width = width;
  v76.size.double height = height;
  if (CGRectIsNull(v76))
  {
    uint64_t v15 = (void *)[a3 infos];
    if ([v15 count])
    {
      [(TSDInteractiveCanvasController *)self->mICC layoutIfNeeded];
      if ([v15 count] == 1)
      {
        id v16 = -[TSDInteractiveCanvasController repForInfo:](self->mICC, "repForInfo:", [v15 anyObject]);
        [v16 targetRectForEditMenu];
        CGFloat v17 = v77.origin.x;
        CGFloat v18 = v77.origin.y;
        CGFloat v19 = v77.size.width;
        CGFloat v20 = v77.size.height;
        if (!CGRectIsNull(v77))
        {
          if (v16) {
            [v16 transformToConvertNaturalToLayerRelative];
          }
          else {
            memset(&v66, 0, sizeof(v66));
          }
          v78.origin.double x = v17;
          v78.origin.double y = v18;
          v78.size.double width = v19;
          v78.size.double height = v20;
          CGRect v79 = CGRectApplyAffineTransform(v78, &v66);
          double v29 = v79.origin.x;
          double v30 = v79.origin.y;
          double width = v79.size.width;
          double height = v79.size.height;
          [v16 layerFrameInScaledCanvas];
          double x = TSDAddPoints(v29, v30, v31);
          double y = v32;
        }
      }
      v80.origin.double x = x;
      v80.origin.double y = y;
      v80.size.double width = width;
      v80.size.double height = height;
      if (CGRectIsNull(v80))
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v33 = [v15 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v63;
          do
          {
            uint64_t v36 = 0;
            do
            {
              if (*(void *)v63 != v35) {
                objc_enumerationMutation(v15);
              }
              uint64_t v37 = *(void *)(*((void *)&v62 + 1) + 8 * v36);
              long long v58 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              id v38 = -[TSDInteractiveCanvasController repsForInfo:](self->mICC, "repsForInfo:", v37, 0);
              uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v71 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v59;
                do
                {
                  uint64_t v42 = 0;
                  do
                  {
                    if (*(void *)v59 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * v42), "layout"), "alignmentFrameInRoot");
                    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self->mICC, "convertUnscaledToBoundsRect:");
                    double v44 = v43;
                    double v46 = v45;
                    double v48 = v47;
                    double v50 = v49;
                    v81.origin.double x = x;
                    v81.origin.double y = y;
                    v81.size.double width = width;
                    v81.size.double height = height;
                    if (CGRectIsNull(v81))
                    {
                      double height = v50;
                      double width = v48;
                      double y = v46;
                      double x = v44;
                    }
                    else
                    {
                      double x = TSDUnionRect(x, y, width, height, v44, v46, v48, v50);
                      double y = v51;
                      double width = v52;
                      double height = v53;
                    }
                    ++v42;
                  }
                  while (v40 != v42);
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v58 objects:v71 count:16];
                }
                while (v40);
              }
              ++v36;
            }
            while (v36 != v34);
            uint64_t v34 = [v15 countByEnumeratingWithState:&v62 objects:v72 count:16];
          }
          while (v34);
        }
        v82.origin.double x = x;
        v82.origin.double y = y;
        v82.size.double width = width;
        v82.size.double height = height;
        if (CGRectIsNull(v82))
        {
          double x = *MEMORY[0x263F001A8];
          double y = *(double *)(MEMORY[0x263F001A8] + 8);
          double width = *(double *)(MEMORY[0x263F001A8] + 16);
          double height = *(double *)(MEMORY[0x263F001A8] + 24);
        }
      }
    }
    else
    {
      [(UITapGestureRecognizer *)[(TSDiOSCanvasViewController *)self singleTapGestureRecognizer] locationInView:[(TSDiOSCanvasViewController *)self canvasView]];
      double v23 = TSDAddPoints(v21, v22, 0.0);
      double x = TSDRectWithOriginAndSize(v24, v23, v25, 1.0, 1.0);
      double y = v26;
      double width = v27;
      double height = v28;
    }
  }
  double v54 = x;
  double v55 = y;
  double v56 = width;
  double v57 = height;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (void)showEditMenuForSelection:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263F1C7B0] sharedMenuController];
  if (((objc_opt_respondsToSelector() & 1) == 0
     || [(TSDiOSCanvasViewControllerDelegate *)self->mDelegate allowEditMenuToAppear])&& (([(TSDTextInputResponder *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] textInputResponder] isFirstResponder] & 1) != 0|| [(TSDTextInputResponder *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] textInputResponder] canBecomeFirstResponder]&& [(TSDTextInputResponder *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] textInputResponder] becomeFirstResponder]|| ([(TSDiOSCanvasViewController *)self isFirstResponder] & 1) != 0|| [(TSDiOSCanvasViewController *)self canBecomeFirstResponder]
     && [(TSDiOSCanvasViewController *)self becomeFirstResponder]))
  {
    [(TSDInteractiveCanvasController *)self->mICC visibleBoundsRect];
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    [(TSDiOSCanvasViewController *)self targetRectForEditMenu:a3];
    v31.origin.double x = v7;
    v31.origin.double y = v9;
    v31.size.double width = v11;
    v31.size.double height = v13;
    CGRect v25 = CGRectIntersection(v24, v31);
    double x = v25.origin.x;
    double y = v25.origin.y;
    double width = v25.size.width;
    double height = v25.size.height;
    if (!CGRectEqualToRect(v25, *MEMORY[0x263F001A0]))
    {
      uint64_t v18 = [MEMORY[0x263EFF980] array];
      [(TSDiOSCanvasViewController *)self p_buildMenuItems:v18 forSelection:a3];
      [v5 setMenuItems:v18];
      [v5 setArrowDirection:0];
      unint64_t v19 = [a3 unlockedInfoCount];
      double v20 = height * 0.5;
      if (v19 <= 1) {
        double v20 = -0.0;
      }
      double v21 = y + v20;
      if (v21 <= v9 + 100.0 && height >= v13 + -100.0)
      {
        v26.origin.double x = x;
        v26.origin.double y = v21;
        v26.size.double width = width;
        v26.size.double height = height;
        v27.origin.double x = CGRectGetMidX(v26);
        double x = v27.origin.x;
        v27.origin.double y = v21;
        v27.size.double width = width;
        v27.size.double height = height;
        double MinY = CGRectGetMinY(v27);
        v28.origin.double x = v7;
        v28.origin.double y = v9;
        v28.size.double width = v11;
        v28.size.double height = v13;
        if (MinY <= CGRectGetMinY(v28) + 6.0)
        {
          v30.origin.double x = v7;
          v30.origin.double y = v9;
          v30.size.double width = v11;
          v30.size.double height = v13;
          double v21 = CGRectGetMinY(v30) + 6.0;
        }
        else
        {
          v29.origin.double x = x;
          v29.origin.double y = v21;
          v29.size.double width = width;
          v29.size.double height = height;
          double v21 = CGRectGetMinY(v29);
        }
        double width = *MEMORY[0x263F001B0];
        double height = *(double *)(MEMORY[0x263F001B0] + 8);
        [v5 setArrowDirection:1];
      }
      objc_msgSend(v5, "showMenuFromView:rect:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"), x, v21, width, height);
      self->mContextMenuMightBeDisplayed = 1;
    }
  }
}

- (void)p_buildMenuItems:(id)a3 forSelection:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CGFloat v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Cut", &stru_26D688A48, @"TSDrawables"), sel_cutObject_);
  double v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Copy", &stru_26D688A48, @"TSDrawables"), sel_copyObject_);
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Paste", &stru_26D688A48, @"TSDrawables"), sel_pasteObject_);
  double v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Delete", &stru_26D688A48, @"TSDrawables"), sel_deleteObject_);
  [a3 addObject:v7];
  [a3 addObject:v8];
  [a3 addObject:v9];
  [a3 addObject:v10];

  if ([a4 infoCount] == 1) {
    int v11 = [a4 containsUnlockedKindOfClass:objc_opt_class()];
  }
  else {
    int v11 = 0;
  }
  if ((unint64_t)[a4 unlockedInfoCount] >= 2 && (v11 & 1) == 0)
  {
    double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Group", &stru_26D688A48, @"TSDrawables"), sel_group_);
    [a3 addObject:v12];
  }
  if (v11)
  {
    double v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Ungroup", &stru_26D688A48, @"TSDrawables"), sel_ungroup_);
    [a3 addObject:v13];
  }
  if ([a4 infoCount] == 1)
  {
    id v14 = -[TSDInteractiveCanvasController repForInfo:](self->mICC, "repForInfo:", objc_msgSend((id)objc_msgSend(a4, "infos"), "anyObject"));
    if ([v14 isLocked])
    {
      int v15 = 0;
    }
    else
    {
      objc_msgSend(a3, "addObjectsFromArray:", objc_msgSend(v14, "itemsToAddToEditMenu"));
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
    id v14 = 0;
  }
  id v16 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] editorController] editorForEditAction:sel_addOrShowComment_ withSender:0];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 canAddOrShowComment])
  {
    CGFloat v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Comment", &stru_26D688A48, @"TSDrawables"), sel_addOrShowComment_);
    [a3 addObject:v17];
  }
  uint64_t v18 = [a4 unlockedInfoCount];
  if (v18 != [a4 infoCount])
  {
    unint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Unlock", &stru_26D688A48, @"TSDrawables"), sel_unlock_);
    [a3 addObject:v19];
  }
  if (v15)
  {
    id v20 = [(TSDiOSCanvasViewController *)self itemsToAddToEditMenuForRep:v14];
    if (v20)
    {
      id v21 = v20;
      if ([v20 count]) {
        [a3 addObjectsFromArray:v21];
      }
    }
  }
  if ([(TSDCanvasEditorHelper *)[(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self->mICC canvasEditor] canvasEditorHelper] canPerformMaskWithShapeWithSender:0])
  {
    double v22 = objc_msgSend(objc_alloc(MEMORY[0x263F1C7B8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"Mask with Shape", &stru_26D688A48, @"TSDrawables"), sel_maskWithShape_);
    [a3 addObject:v22];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] editorController] currentEditors];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        CGRect v28 = *(void **)(*((void *)&v29 + 1) + 8 * v27);
        if (objc_opt_respondsToSelector()) {
          [v28 addContextualMenuItemsToArray:a3];
        }
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v25);
  }
}

- (void)showEditMenu:(id)a3
{
  uint64_t v5 = [(TSDInteractiveCanvasController *)self->mICC canvasEditor];
  double v6 = v5;
  if (a3) {
    uint64_t v7 = [(TSDCanvasSelection *)[(TSDCanvasEditor *)v5 canvasSelection] infos];
  }
  else {
    uint64_t v7 = 0;
  }
  [(TSDCanvasEditor *)v6 canvasSelectionWithInfos:v7];
  uint64_t v8 = TSUProtocolCast();

  [(TSDiOSCanvasViewController *)self showEditMenuForSelection:v8];
}

- (void)toggleEditMenuForCurrentSelection
{
  if (self->mContextMenuMightBeDisplayed)
  {
    [(TSDiOSCanvasViewController *)self hideEditMenu];
  }
  else
  {
    BOOL v3 = [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self->mICC canvasEditor] canvasSelection];
    [(TSDiOSCanvasViewController *)self showEditMenuForSelection:v3];
  }
}

- (void)hideEditMenu
{
  self->mContextMenuMightBeDisplayed = 0;
}

- (id)itemsToAddToEditMenuForRep:(id)a3
{
  return 0;
}

- (id)extraMenuItems
{
  id v2 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] editorController] textInputEditor];
  if (objc_opt_respondsToSelector()) {
    BOOL v3 = (void *)[v2 extraMenuItems];
  }
  else {
    BOOL v3 = 0;
  }
  if ([v3 count]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)canBecomeFirstResponder
{
  return !self->mHasBeenTornDown;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ([(TSDInteractiveCanvasController *)self->mICC isInDynamicOperation]) {
    return 0;
  }
  mICC = self->mICC;

  return [(TSDInteractiveCanvasController *)mICC canPerformInteractiveAction:a3 withSender:a4];
}

- (void)setContextMenuMightBeDisplayed:(BOOL)a3
{
  if (!a3 && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "isMenuVisible")) {
    [(TSDiOSCanvasViewController *)self hideEditMenu];
  }
  self->mContextMenuMightBeDisplayed = a3;
}

- (void)cut:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [(TSDiOSCanvasViewController *)self hideEditMenu];
  }
  mICC = self->mICC;

  [(TSDInteractiveCanvasController *)mICC makeEditorPerformAction:a2 withSender:a3];
}

- (void)unlock:(id)a3
{
  [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] makeEditorPerformAction:a2 withSender:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] canvasEditor];
    uint64_t v5 = [(TSDCanvasEditor *)v4 canvasSelectionWithInfos:[(TSDCanvasSelection *)[(TSDCanvasEditor *)v4 canvasSelection] infos]];
    [(TSDiOSCanvasViewController *)self showEditMenuForSelection:v5];
  }
}

- (void)stopScrolling
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController stopScrolling]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1171, @"This operation must only be performed on the main thread.");
  }
  uint64_t v5 = [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView];
  [(TSKScrollView *)v5 contentOffset];

  -[TSKScrollView setContentOffset:animated:](v5, "setContentOffset:animated:", 0);
}

- (void)forceStopScrolling
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController forceStopScrolling]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1181, @"This operation must only be performed on the main thread.");
  }
  uint64_t v5 = [(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] enclosingScrollView];
  if ([(TSKScrollView *)v5 isScrollEnabled]
    && [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] currentlyScrolling])
  {
    [(TSKScrollView *)v5 setScrollEnabled:0];
    [(TSKScrollView *)v5 setScrollEnabled:1];
    [(TSKScrollView *)v5 contentOffset];
    -[TSKScrollView setContentOffset:animated:](v5, "setContentOffset:animated:", 0);
  }
}

- (void)beginInspectorPanZoomModeWithSingleTapBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!self->mInspectorModeEnabled
    || (uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v6 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController beginInspectorPanZoomModeWithSingleTapBlock:]"], objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1199, @"attempting to re-enable inspector pan/zoom mode"), !self->mInspectorModeEnabled))
  {
    self->mInspectorModeEnabled = 1;
    if (self->mInspectorSingleTapBlock)
    {
      uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController beginInspectorPanZoomModeWithSingleTapBlock:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1203, @"expected nil value for '%s'", "mInspectorSingleTapBlock");
    }
    self->mInspectorSingleTapBlock = (id)[a3 copy];
    if (!self->mInspectorGestureRecognizersToReenable) {
      self->mInspectorGestureRecognizersToReenable = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    double v9 = (void *)[MEMORY[0x263EFF980] array];
    [(TSDiOSCanvasViewController *)self addInspectorPanZoomModeGRsToArray:v9];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v10 = (void *)[(TSDCanvasView *)[(TSDiOSCanvasViewController *)self canvasView] gestureRecognizers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (([v9 containsObject:v15] & 1) == 0)
          {
            if ([v15 isEnabled])
            {
              [(NSMutableArray *)self->mInspectorGestureRecognizersToReenable addObject:v15];
              [v15 setEnabled:0];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)endInspectorPanZoomMode
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->mInspectorModeEnabled
    || (BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v4 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController endInspectorPanZoomMode]"], objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1225, @"attempting to re-disable inspector pan/zoom mode"), self->mInspectorModeEnabled))
  {
    self->mInspectorModeEnabled = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    mInspectorGestureRecognizersToReenable = self->mInspectorGestureRecognizersToReenable;
    uint64_t v6 = [(NSMutableArray *)mInspectorGestureRecognizersToReenable countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(mInspectorGestureRecognizersToReenable);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setEnabled:1];
        }
        uint64_t v7 = [(NSMutableArray *)mInspectorGestureRecognizersToReenable countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    [(NSMutableArray *)self->mInspectorGestureRecognizersToReenable removeAllObjects];

    self->mInspectorSingleTapBlock = 0;
    if (objc_msgSend(-[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), "conformsToProtocol:", &unk_26D78F478))-[TSDInteractiveCanvasController setShouldAutoscrollToSelectionAfterLayout:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "setShouldAutoscrollToSelectionAfterLayout:", 1); {
  }
    }
}

- (void)addInspectorPanZoomModeGRsToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
  uint64_t v5 = [(TSDiOSCanvasViewController *)self singleTapGestureRecognizer];

  [a3 addObject:v5];
}

- (void)p_handleSingleTapGesture:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    if ([v4 state] != 4)
    {
      mICC = self->mICC;
      objc_msgSend(v5, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
      double v8 = v7;
      double v10 = v9;
      if (!-[TSDiOSCanvasViewController handleSingleTapAtPoint:withRecognizer:](self, "handleSingleTapAtPoint:withRecognizer:", v5))
      {
        long long v11 = self->mICC;
        -[TSDInteractiveCanvasController tappedCanvasBackgroundAtPoint:](v11, "tappedCanvasBackgroundAtPoint:", v8, v10);
      }
    }
  }
}

- (void)p_zoomWithGesture:(id)a3
{
  int v5 = 1;
  uint64_t v6 = 1;
  switch([a3 state])
  {
    case 1:
      if (self->mCanvasZoomTracker)
      {
        double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v8 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController p_zoomWithGesture:]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1277, @"expected nil value for '%s'", "mCanvasZoomTracker");
      }
      objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 0);
      int v5 = 0;
      uint64_t v6 = 0;
      break;
    case 2:
      break;
    case 3:
      objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 1);
      int v5 = 0;
      uint64_t v6 = 2;
      break;
    case 4:
      objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 1);
      goto LABEL_7;
    default:
LABEL_7:
      int v5 = 0;
      uint64_t v6 = 3;
      break;
  }
  if (!self->mCanvasZoomTracker)
  {
    double v9 = [[TSDCanvasZoomTracker alloc] initWithCanvasLayer:[(TSDiOSCanvasViewController *)self canvasLayer]];
    self->mCanvasZoomTracker = v9;
    [(TSDCanvasZoomTracker *)v9 setDelegate:self];
  }
  objc_msgSend(a3, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
  double v11 = v10;
  double v13 = v12;
  if (objc_opt_respondsToSelector()) {
    [(TSDCanvasLayer *)[(TSDiOSCanvasViewController *)self canvasLayer] setShowsScaleFeedback:[(TSDiOSCanvasViewControllerDelegate *)self->mDelegate canvasViewControllerShouldShowScaleFeedback:self]];
  }
  if (!v5 || [a3 numberOfTouches] == 2)
  {
    mCanvasZoomTracker = self->mCanvasZoomTracker;
    [a3 scale];
    double v16 = v15;
    [a3 velocity];
    -[TSDCanvasZoomTracker zoomWithScale:velocity:locationInView:phase:](mCanvasZoomTracker, "zoomWithScale:velocity:locationInView:phase:", v6, v16, v17, v11, v13);
  }
}

- (void)canvasZoomTracker:(id)a3 willBeginViewScaleFeedbackWithFastPinch:(BOOL)a4
{
  uint64_t v6 = [(TSDiOSCanvasViewController *)self canvasView];
  double v7 = [(TSDiOSCanvasViewController *)self zoomGestureRecognizer];
  if (a4 || (uint64_t v8 = v7, [(UIPinchGestureRecognizer *)v7 numberOfTouches] != 2))
  {
    double v17 = [(TSDCanvasView *)v6 enclosingScrollView];
    [(TSKScrollView *)v17 center];
    objc_msgSend((id)-[TSKScrollView superview](v17, "superview"), "convertPoint:toView:", v6, v19, v18 + -120.0);
    double v14 = v20;
    double v16 = v21;
    double v12 = v21;
    double v10 = v20;
  }
  else
  {
    [(UIPinchGestureRecognizer *)v8 locationOfTouch:0 inView:v6];
    double v10 = v9;
    double v12 = v11;
    [(UIPinchGestureRecognizer *)v8 locationOfTouch:1 inView:v6];
    double v14 = v13;
    double v16 = v15;
  }
  double v22 = TSDAddPoints(v10, v12, v14);
  double v24 = TSDMultiplyPointScalar(v22, v23, 0.5);
  double v26 = v25;
  if (vabdd_f64(v10, v14) >= 40.0)
  {
    if (v10 >= v14) {
      double v27 = v14;
    }
    else {
      double v27 = v10;
    }
    if (v10 >= v14) {
      double v28 = v10;
    }
    else {
      double v28 = v14;
    }
    if (v10 >= v14) {
      double v29 = v12;
    }
    else {
      double v29 = v16;
    }
    double v30 = TSDSubtractPoints(v28, v29, v27);
    double v32 = TSDAngleFromDelta(v30, v31);
    double v33 = TSDDeltaFromAngle(v32 + -1.57079633);
    double v35 = TSDMultiplyPointScalar(v33, v34, 120.0);
    TSDAddPoints(v24, v26, v35);
  }
  self->mLastZoomHUDLocation.double x = TSDRoundedPoint();
  self->mLastZoomHUDLocation.double y = v36;
}

- (void)canvasZoomTrackerWillBeginFinalZoomAnimation:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v3 beginIgnoringInteractionEvents];
}

- (void)canvasZoomTrackerDidEndFinalZoomAnimation:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v3 endIgnoringInteractionEvents];
}

- (void)canvasZoomTrackerDidFinish:(id)a3
{
  self->mCanvasZoomTracker = 0;
}

- (BOOL)isDraggingViaGuidedPan
{
  return (unint64_t)([(UIPanGestureRecognizer *)self->mGuidedPanGestureRecognizer state] - 1) < 3;
}

- (void)p_guidedPanWithGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      int v5 = [(TSDInteractiveCanvasController *)self->mICC delegate];
      mICC = self->mICC;
      [(UIPanGestureRecognizer *)self->mGuidedPanGestureRecognizer direction];
      uint64_t v7 = -[TSDInteractiveCanvasControllerDelegate panGuideForInteractiveCanvasController:withMovementDirection:](v5, "panGuideForInteractiveCanvasController:withMovementDirection:", mICC);
      if (!v7)
      {
        uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController p_guidedPanWithGesture:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1427, @"invalid nil value for '%s'", "panGuide");
      }
      mGuidedPanController = self->mGuidedPanController;
      if (!mGuidedPanController)
      {
        mGuidedPanController = [[TSDGuidedPanController alloc] initWithInteractiveCanvasController:self->mICC];
        self->mGuidedPanController = mGuidedPanController;
      }
      [(TSDGuidedPanController *)mGuidedPanController setGuide:v7];
    }
    else
    {
      double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController p_guidedPanWithGesture:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1438, @"can't handle guided pan without a guide");
    }
  }
  double v13 = self->mGuidedPanController;

  [(TSDGuidedPanController *)v13 handlePanGesture:a3];
}

- (void)p_editMenuDidHide:(id)a3
{
}

- (id)p_willPresentError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[a3 localizedRecoveryOptions];
  if (v4
    && [v4 count]
    && (![v3 recoveryAttempter]
     || (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0))
  {
    int v5 = objc_msgSend((id)objc_msgSend(v3, "userInfo"), "mutableCopy");
    [v5 removeObjectForKey:*MEMORY[0x263F08348]];
    [v5 removeObjectForKey:*MEMORY[0x263F08340]];
    [v5 removeObjectForKey:*MEMORY[0x263F084A8]];
    id v3 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", objc_msgSend(v3, "domain"), objc_msgSend(v3, "code"), v5);
  }
  return v3;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v6 = [(TSDiOSCanvasViewController *)self p_willPresentError:a3];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C400]) initWithError:v6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__TSDiOSCanvasViewController_presentError_completionHandler___block_invoke;
  v8[3] = &unk_2646B23B8;
  v8[4] = v6;
  v8[5] = self;
  v8[6] = v7;
  v8[7] = a4;
  [v7 showWithCompletionHandler:v8];
}

void __61__TSDiOSCanvasViewController_presentError_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) recoveryAttempter];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = (void *)v4;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v5, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", *(void *)(a1 + 32), a2, *(void *)(a1 + 40), sel_p_didPresentErrorWithRecovery_completionHandler_, objc_msgSend(*(id *)(a1 + 56), "copy"));
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = [v5 attemptRecoveryFromError:*(void *)(a1 + 32) optionIndex:a2];
  }
  else {
LABEL_6:
  }
    uint64_t v6 = 0;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
  }
LABEL_9:
  uint64_t v8 = *(void **)(a1 + 48);
}

- (void)p_didPresentErrorWithRecovery:(BOOL)a3 completionHandler:(void *)a4
{
  if (a4)
  {
    (*((void (**)(void *, BOOL))a4 + 2))(a4, a3);
  }
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = [a3 count];
  id v9 = objc_alloc(MEMORY[0x263F1C400]);
  if (v8 == 1) {
    double v10 = objc_msgSend(v9, "initWithError:", objc_msgSend(a3, "objectAtIndex:", 0));
  }
  else {
    double v10 = objc_msgSend(v9, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a4, 0, 0, objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"OK", &stru_26D688A48, @"TSDrawables"), 0);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__TSDiOSCanvasViewController_presentErrors_withLocalizedDescription_completionHandler___block_invoke;
  v11[3] = &unk_2646B23E0;
  v11[4] = v10;
  v11[5] = a5;
  [v10 showWithCompletionHandler:v11];
}

void __87__TSDiOSCanvasViewController_presentErrors_withLocalizedDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
}

- (void)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3, a4, a5) & 1) == 0)
  {
    int v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController beginModalOperationWithLocalizedMessage:progress:cancelHandler:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1553, @"Modal operations must be started on the main thread,");
  }
  uint64_t v7 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  [v7 beginIgnoringInteractionEvents];
}

- (void)endModalOperation
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSDiOSCanvasViewController endModalOperation]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1565, @"Modal operations must be ended on the main thread,");
  }
  uint64_t v4 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  [v4 endIgnoringInteractionEvents];
}

- (void)presentMovieCompatibilityAlertForUnplayableMovieURLs:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (id)newMoviePlaybackHUDWithFrame:(CGRect)a3 playerController:(id)a4 movieRep:(id)a5
{
  return 0;
}

- (id)newAudioPlaybackHUDWithFrame:(CGRect)a3 audioRep:(id)a4 delegate:(id)a5
{
  return 0;
}

- (Class)movieInspectorPaneClass
{
  return 0;
}

- (Class)audioInspectorPaneClass
{
  return 0;
}

- (id)topLevelReps
{
  uint64_t v2 = [(TSDInteractiveCanvasController *)[(TSDiOSCanvasViewController *)self interactiveCanvasController] canvas];

  return [(TSDCanvas *)v2 topLevelReps];
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mICC;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->mICC = (TSDInteractiveCanvasController *)a3;
}

- (TSDiOSCanvasViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSDiOSCanvasViewControllerDelegate *)a3;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->mSingleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->mDoubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (TSDEditMenuTapGestureRecognizer)editMenuTapGestureRecognizer
{
  return self->mEditMenuTapGestureRecognizer;
}

- (void)setEditMenuTapGestureRecognizer:(id)a3
{
}

- (TSDKnobDragGestureRecognizer)knobDragGestureRecognizer
{
  return self->mKnobDragGestureRecognizer;
}

- (void)setKnobDragGestureRecognizer:(id)a3
{
}

- (TSDMultiSelectGestureRecognizer)multiSelectGestureRecognizer
{
  return self->mMultiSelectGestureRecognizer;
}

- (void)setMultiSelectGestureRecognizer:(id)a3
{
}

- (TSDRepDragGestureRecognizer)repDragGestureRecognizer
{
  return self->mRepDragGestureRecognizer;
}

- (void)setRepDragGestureRecognizer:(id)a3
{
}

- (TSDRepRotateGestureRecognizer)repRotateGestureRecognizer
{
  return self->mRepRotateGestureRecognizer;
}

- (void)setRepRotateGestureRecognizer:(id)a3
{
}

- (UIPinchGestureRecognizer)zoomGestureRecognizer
{
  return &self->mZoomGestureRecognizer->super;
}

- (void)setZoomGestureRecognizer:(id)a3
{
}

- (TSDNudgeGestureRecognizer)nudgeGestureRecognizer
{
  return self->mNudgeGestureRecognizer;
}

- (void)setNudgeGestureRecognizer:(id)a3
{
}

- (TSDAllTouchesDoneGestureRecognizer)allTouchesDoneGestureRecognizer
{
  return self->mAllTouchesDoneGestureRecognizer;
}

- (void)setAllTouchesDoneGestureRecognizer:(id)a3
{
}

- (TSDPreventScrollGestureRecognizer)preventScrollGestureRecognizer
{
  return self->mPreventScrollGestureRecognizer;
}

- (UIPanGestureRecognizer)guidedPanGestureRecognizer
{
  return self->mGuidedPanGestureRecognizer;
}

- (BOOL)isPopoverGestureInFlight
{
  return self->mIsPopoverGestureInFlight;
}

- (BOOL)contextMenuMightBeDisplayed
{
  return self->mContextMenuMightBeDisplayed;
}

- (BOOL)isRotating
{
  return self->_isRotating;
}

- (TSDCanvasSubviewsController)subviewsController
{
  return self->mSubviewsController;
}

@end