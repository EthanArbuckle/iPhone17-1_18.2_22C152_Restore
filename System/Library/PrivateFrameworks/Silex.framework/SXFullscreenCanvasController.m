@interface SXFullscreenCanvasController
- (BOOL)captionView:(id)a3 tapGestureRecognizerShouldBegin:(id)a4;
- (BOOL)comparePoint:(CGPoint)a3 withPoint:(CGPoint)a4 maxDelta:(double)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFullscreen;
- (BOOL)isStoppingVerticalSwiping;
- (BOOL)isSupressingColorSettings;
- (BOOL)isTransitioning;
- (BOOL)lessTouchesAreInterupting;
- (BOOL)orientationChangeIsInterupting;
- (BOOL)otherInteractivityGestureShouldBegin:(id)a3;
- (BOOL)panIsActive;
- (BOOL)pinchIsActive;
- (BOOL)rotationIsActive;
- (BOOL)verticalSwipingIsActive;
- (CGPoint)calculateAnchorPointFromBounds:(CGRect)a3 andPoint:(CGPoint)a4;
- (CGPoint)currentTranslation;
- (CGPoint)startingAnchorPoint;
- (CGRect)currentDestinationFrame;
- (CGRect)currentOriginFrame;
- (CGRect)itemizedScrollView:(id)a3 frameForViewAtIndex:(unint64_t)a4;
- (CGSize)fitSizeForRect:(CGRect)a3;
- (SXDragManager)dragManager;
- (SXFullscreenCanvasController)initWithShowable:(id)a3 captionViewFactory:(id)a4 sharingPolicy:(unint64_t)a5;
- (SXFullscreenCanvasShowable)showable;
- (SXFullscreenCanvasViewController)canvasViewController;
- (SXFullscreenCaptionView)captionView;
- (SXFullscreenCaptionViewFactory)captionViewFactory;
- (SXFullscreenNavigationBarView)navigationBarView;
- (SXItemizedScrollView)itemizedScrollView;
- (UIColor)backgroundColor;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIRotationGestureRecognizer)rotationGestureRecognizer;
- (UITapGestureRecognizer)openTapGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)backgroundView;
- (UIView)currentView;
- (UIView)gestureView;
- (double)currentRotation;
- (double)currentScale;
- (id)dragManager:(id)a3 dragableAtLocation:(CGPoint)a4;
- (id)itemizedScrollView:(id)a3 viewAtIndex:(unint64_t)a4;
- (int)previousExpansionMode;
- (int64_t)viewIndexForPoint:(CGPoint)a3;
- (unint64_t)activeViewIndex;
- (unint64_t)currentViewIndex;
- (unint64_t)numberOfViewsInItemizedScrollView:(id)a3;
- (unint64_t)sharingPolicy;
- (unint64_t)totalActiveGestureRecognizers;
- (void)changeCaptionViewForViewWithIndex:(unint64_t)a3 expanded:(BOOL)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)didEndTransitionFromFullScreen:(BOOL)a3 toFullScreen:(BOOL)a4;
- (void)didFinishFullscreenActiveIndex:(unint64_t)a3;
- (void)dismiss;
- (void)fullScreenImageViewDidStartZooming:(id)a3;
- (void)fullScreenImageViewDidStopZooming:(id)a3;
- (void)fullscreenCanvasViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)goToFullScreenFromFullScreenAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)goToFullScreenFromOriginalAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)goToOriginalFromFullScreenAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)goToOriginalFromOriginalAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)goToOriginalFromVerticalSwipingWithVelocity:(CGPoint)a3 completionBlock:(id)a4;
- (void)handleGestureRecognizer:(id)a3;
- (void)handleNextCommand;
- (void)handleOpenTapGesture:(id)a3;
- (void)handlePanGestureRecognizer:(id)a3;
- (void)handlePinchGestureRecognizer:(id)a3;
- (void)handlePreviousCommand;
- (void)handleRotationGestureRecognizer:(id)a3;
- (void)handleTap:(id)a3;
- (void)itemizedScrollView:(id)a3 didChangeToActiveViewIndex:(unint64_t)a4;
- (void)itemizedScrollView:(id)a3 didHideViewWithIndex:(unint64_t)a4;
- (void)itemizedScrollView:(id)a3 willShowViewWithIndex:(unint64_t)a4;
- (void)presentFullscreenWithIndex:(unint64_t)a3;
- (void)removeScaleAndTranslationFromCurrentView;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setCanvasViewController:(id)a3;
- (void)setCaptionView:(id)a3;
- (void)setCurrentDestinationFrame:(CGRect)a3;
- (void)setCurrentOriginFrame:(CGRect)a3;
- (void)setCurrentView:(id)a3;
- (void)setCurrentViewIndex:(unint64_t)a3;
- (void)setDragManager:(id)a3;
- (void)setIsFullscreen:(BOOL)a3;
- (void)setIsSupressingColorSettings:(BOOL)a3;
- (void)setItemizedScrollView:(id)a3;
- (void)setLessTouchesAreInterupting:(BOOL)a3;
- (void)setNavigationBarView:(id)a3;
- (void)setOrientationChangeIsInterupting:(BOOL)a3;
- (void)setPreviousExpansionMode:(int)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setup;
- (void)setupGestureRecognizersInView:(id)a3;
- (void)setupScrollViewIfNeededWithActiveIndex:(unint64_t)a3;
- (void)startSupressingColorSettings;
- (void)startTransitionToFullScreen:(BOOL)a3 controllable:(BOOL)a4;
- (void)startVerticalSwiping;
- (void)stopSupressingColorSettings;
- (void)stopTransformingCancelled:(BOOL)a3;
- (void)stopVerticalSwipingDismissed:(BOOL)a3 lastVelocity:(CGPoint)a4;
- (void)transferCurrentViewToCanvas;
- (void)transferCurrentViewToOriginalView;
- (void)transferGestureViewToView:(id)a3;
- (void)transformViewToSize:(CGSize)a3;
- (void)updateTransform;
- (void)willStartTransformingWithGestureRecognizer:(id)a3 completionBlock:(id)a4;
@end

@implementation SXFullscreenCanvasController

- (SXFullscreenCanvasController)initWithShowable:(id)a3 captionViewFactory:(id)a4 sharingPolicy:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXFullscreenCanvasController;
  v10 = [(SXFullscreenCanvasController *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_sharingPolicy = a5;
    objc_storeStrong((id *)&v10->_captionViewFactory, a4);
    objc_storeWeak((id *)&v11->_showable, v8);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = v12;

    [(UIView *)v11->_backgroundView setAutoresizingMask:18];
    v14 = [MEMORY[0x263F1C550] blackColor];
    [(UIView *)v11->_backgroundView setBackgroundColor:v14];

    [(SXFullscreenCanvasController *)v11 setup];
  }

  return v11;
}

- (void)dealloc
{
  [(SXFullscreenCanvasController *)self stopSupressingColorSettings];
  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenCanvasController;
  [(SXFullscreenCanvasController *)&v3 dealloc];
}

- (void)dismiss
{
  objc_super v3 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  self->_currentViewIndex = [v3 activeViewIndex];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SXFullscreenCanvasController_dismiss__block_invoke;
  v4[3] = &unk_2646521E0;
  v4[4] = self;
  [(SXFullscreenCanvasController *)self willStartTransformingWithGestureRecognizer:0 completionBlock:v4];
}

void __39__SXFullscreenCanvasController_dismiss__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) startTransitionToFullScreen:1 controllable:0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SXFullscreenCanvasController_dismiss__block_invoke_2;
    block[3] = &unk_2646511F8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __39__SXFullscreenCanvasController_dismiss__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__SXFullscreenCanvasController_dismiss__block_invoke_3;
  v3[3] = &unk_2646511F8;
  v3[4] = v1;
  return [v1 goToOriginalFromFullScreenAnimated:1 completionBlock:v3];
}

uint64_t __39__SXFullscreenCanvasController_dismiss__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionFromFullScreen:1 toFullScreen:0];
}

- (void)setupScrollViewIfNeededWithActiveIndex:(unint64_t)a3
{
  v5 = [(SXFullscreenCanvasController *)self itemizedScrollView];

  if (!v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleTap_];
    [(SXFullscreenCanvasController *)self setTapGestureRecognizer:v6];

    v7 = [SXItemizedScrollView alloc];
    id v8 = -[SXItemizedScrollView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(SXFullscreenCanvasController *)self setItemizedScrollView:v8];

    id v9 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v9 setContentInsetAdjustmentBehavior:2];

    v10 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v10 setDataSource:self];

    v11 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v11 setDelegate:self];

    v12 = [(SXFullscreenCanvasController *)self canvasViewController];
    v13 = [v12 view];
    [v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v22 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    CGFloat v23 = CGRectGetWidth(v32) + 20.0;
    v33.origin.x = v15;
    v33.origin.y = v17;
    v33.size.width = v19;
    v33.size.height = v21;
    objc_msgSend(v22, "setFrame:", -10.0, 0.0, v23, CGRectGetHeight(v33));

    v24 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v24 setActiveViewIndex:a3 animated:0];

    v25 = [(SXFullscreenCanvasController *)self canvasViewController];
    v26 = [v25 view];
    v27 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v26 addSubview:v27];

    id v30 = [(SXFullscreenCanvasController *)self canvasViewController];
    v28 = [v30 view];
    v29 = [(SXFullscreenCanvasController *)self tapGestureRecognizer];
    [v28 addGestureRecognizer:v29];
  }
}

- (void)didFinishFullscreenActiveIndex:(unint64_t)a3
{
  -[SXFullscreenCanvasController setupScrollViewIfNeededWithActiveIndex:](self, "setupScrollViewIfNeededWithActiveIndex:");
  v5 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  id v9 = [v5 activeView];

  v6 = [v9 scrollView];
  [(SXFullscreenCanvasController *)self transferGestureViewToView:v6];

  v7 = [(SXFullscreenCanvasController *)self captionView];
  if (v7)
  {
    id v8 = [(SXFullscreenCanvasController *)self captionView];
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", a3, [v8 expanded], 1);
  }
  else
  {
    [(SXFullscreenCanvasController *)self changeCaptionViewForViewWithIndex:a3 expanded:1 animated:1];
  }
}

- (void)changeCaptionViewForViewWithIndex:(unint64_t)a3 expanded:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(SXFullscreenCanvasController *)self showable];
  v10 = [(SXFullscreenCanvasController *)self showable];
  id v37 = [v9 fullScreenCanvasController:self captionForShowable:v10 viewIndex:a3];

  v11 = [(SXFullscreenCanvasController *)self captionView];

  if (!v11)
  {
    double v14 = [(SXFullscreenCanvasController *)self captionViewFactory];
    CGFloat v15 = [v14 createCaptionView];
    captionView = self->_captionView;
    self->_captionView = v15;

    CGFloat v17 = [(SXFullscreenCanvasController *)self captionView];
    [v17 setDelegate:self];

    double v18 = [(SXFullscreenCanvasController *)self canvasViewController];
    CGFloat v19 = [v18 view];
    double v20 = [(SXFullscreenCanvasController *)self captionView];
    [v19 addSubview:v20];

    self->_uint64_t previousExpansionMode = 1;
    goto LABEL_5;
  }
  v12 = [(SXFullscreenCanvasController *)self captionView];
  uint64_t v13 = [v12 viewIndex];

  if (v13 != a3)
  {
LABEL_5:
    CGFloat v21 = [(SXFullscreenCanvasController *)self captionView];
    [v21 updateWithCaption:v37 forViewIndex:a3 animated:v5];
  }
  v22 = [(SXFullscreenCanvasController *)self navigationBarView];

  if (!v22)
  {
    CGFloat v23 = objc_alloc_init(SXFullscreenNavigationBarView);
    navigationBarView = self->_navigationBarView;
    self->_navigationBarView = v23;

    v25 = [(SXFullscreenCanvasController *)self navigationBarView];
    [v25 setDelegate:self];

    v26 = [(SXFullscreenCanvasController *)self canvasViewController];
    v27 = [v26 view];
    v28 = [(SXFullscreenCanvasController *)self navigationBarView];
    [v27 addSubview:v28];
  }
  v29 = [(SXFullscreenCanvasController *)self captionView];
  int v30 = [v29 expanded];

  if (v30 != v6)
  {
    if (!v6 || (uint64_t previousExpansionMode = self->_previousExpansionMode, !previousExpansionMode))
    {
      CGRect v32 = [(SXFullscreenCanvasController *)self captionView];
      self->_uint64_t previousExpansionMode = [v32 expansionMode];

      uint64_t previousExpansionMode = 0;
    }
    CGRect v33 = [(SXFullscreenCanvasController *)self captionView];
    [v33 setExpansionMode:previousExpansionMode animated:v5];
  }
  v34 = [(SXFullscreenCanvasController *)self navigationBarView];
  int v35 = [v34 expanded];

  if (v35 != v6)
  {
    v36 = [(SXFullscreenCanvasController *)self navigationBarView];
    [v36 setExpanded:v6 animated:v5];
  }
}

- (void)transformViewToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(SXFullscreenCanvasController *)self isFullscreen])
  {
    BOOL v6 = [(SXFullscreenCanvasController *)self canvasViewController];
    v7 = [v6 view];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;

    v12 = [(SXFullscreenCanvasController *)self canvasViewController];
    uint64_t v13 = [v12 view];
    objc_msgSend(v13, "setFrame:", v9, v11, width, height);

    double v14 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    objc_msgSend(v14, "setFrame:", -10.0, 0.0, width + 20.0, height);

    CGFloat v15 = [(SXFullscreenCanvasController *)self showable];
    double v16 = [(SXFullscreenCanvasController *)self showable];
    CGFloat v17 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    uint64_t v18 = [v17 activeViewIndex];
    CGFloat v19 = [(SXFullscreenCanvasController *)self canvasViewController];
    double v20 = [v19 view];
    [v20 bounds];
    objc_msgSend(v15, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", self, v16, v18);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    v29 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    id v39 = [v29 activeView];

    objc_msgSend(v39, "setContentViewFrame:", v22, v24, v26, v28);
    int v30 = [(SXFullscreenCanvasController *)self captionView];
    [v30 updateFrameAnimated:0];

    v31 = [(SXFullscreenCanvasController *)self navigationBarView];
    [v31 updateFrameAnimated:0];

    CGRect v32 = [(SXFullscreenCanvasController *)self gestureView];
    CGRect v33 = [v32 superview];
    [v33 bounds];
    double v34 = CGRectGetWidth(v41);
    int v35 = [(SXFullscreenCanvasController *)self gestureView];
    v36 = [v35 superview];
    [v36 bounds];
    double v37 = CGRectGetHeight(v42);
    v38 = [(SXFullscreenCanvasController *)self gestureView];
    objc_msgSend(v38, "setFrame:", 0.0, 0.0, v34, v37);
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(SXFullscreenCanvasController *)self backgroundView];
  [v5 setBackgroundColor:v4];
}

- (UIColor)backgroundColor
{
  v2 = [(SXFullscreenCanvasController *)self backgroundView];
  objc_super v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (unint64_t)activeViewIndex
{
  if (![(SXFullscreenCanvasController *)self isFullscreen]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_super v3 = [(SXFullscreenCanvasController *)self itemizedScrollView];

  if (v3)
  {
    id v4 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    unint64_t v5 = [v4 activeViewIndex];

    return v5;
  }
  else
  {
    return [(SXFullscreenCanvasController *)self currentViewIndex];
  }
}

- (BOOL)otherInteractivityGestureShouldBegin:(id)a3
{
  return 0;
}

- (void)setup
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  gestureView = self->_gestureView;
  self->_gestureView = v4;

  BOOL v6 = [(SXFullscreenCanvasController *)self gestureView];
  [v6 setAutoresizingMask:18];

  v7 = [(SXFullscreenCanvasController *)self gestureView];
  [(SXFullscreenCanvasController *)self setupGestureRecognizersInView:v7];

  double v8 = [(SXFullscreenCanvasController *)self showable];
  double v9 = [(SXFullscreenCanvasController *)self gestureView];
  double v10 = [(SXFullscreenCanvasController *)self showable];
  [v8 fullScreenCanvasController:self shouldAddGestureView:v9 forShowable:v10];

  id v12 = [(SXFullscreenCanvasController *)self gestureView];
  double v11 = [v12 superview];
  [v11 setUserInteractionEnabled:1];
}

- (void)setupGestureRecognizersInView:(id)a3
{
  id v4 = a3;
  double v21 = [[SXDragManager alloc] initWithSharingPolicy:[(SXFullscreenCanvasController *)self sharingPolicy] dataSource:self];
  [(SXDragManager *)v21 setEnabled:0];
  [(SXFullscreenCanvasController *)self setDragManager:v21];
  unint64_t v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleOpenTapGesture_];
  openTapGestureRecognizer = self->_openTapGestureRecognizer;
  self->_openTapGestureRecognizer = v5;

  v7 = [(SXFullscreenCanvasController *)self openTapGestureRecognizer];
  [v7 setDelegate:self];

  double v8 = [(SXFullscreenCanvasController *)self openTapGestureRecognizer];
  [v4 addGestureRecognizer:v8];

  double v9 = (UIPinchGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C860]) initWithTarget:self action:sel_handlePinchGestureRecognizer_];
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  self->_pinchGestureRecognizer = v9;

  double v11 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];
  [v11 setDelegate:self];

  id v12 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];
  [v4 addGestureRecognizer:v12];

  uint64_t v13 = (UIRotationGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C900]) initWithTarget:self action:sel_handleRotationGestureRecognizer_];
  rotationGestureRecognizer = self->_rotationGestureRecognizer;
  self->_rotationGestureRecognizer = v13;

  CGFloat v15 = [(SXFullscreenCanvasController *)self rotationGestureRecognizer];
  [v15 setDelegate:self];

  double v16 = [(SXFullscreenCanvasController *)self rotationGestureRecognizer];
  [v4 addGestureRecognizer:v16];

  CGFloat v17 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_handlePanGestureRecognizer_];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v17;

  CGFloat v19 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  [v19 setDelegate:self];

  double v20 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  [v4 addGestureRecognizer:v20];
}

- (CGSize)fitSizeForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = [(SXFullscreenCanvasController *)self canvasViewController];
  double v8 = [v7 view];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v24 = v11;
  CGFloat v25 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v27.origin.CGFloat x = v10;
  v27.origin.CGFloat y = v12;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v16;
  double v17 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v18 = v17 / CGRectGetWidth(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  CGFloat v23 = height;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v19 = v18 * CGRectGetHeight(v29);
  v30.origin.CGFloat x = v25;
  v30.origin.CGFloat y = v24;
  v30.size.CGFloat width = v14;
  v30.size.CGFloat height = v16;
  if (v19 > CGRectGetHeight(v30))
  {
    v31.origin.CGFloat x = v25;
    v31.origin.CGFloat y = v24;
    v31.size.CGFloat width = v14;
    v31.size.CGFloat height = v16;
    double v19 = CGRectGetHeight(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = v23;
    double v20 = v19 / CGRectGetHeight(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = v23;
    double v17 = v20 * CGRectGetWidth(v33);
  }
  double v21 = v17;
  double v22 = v19;
  result.CGFloat height = v22;
  result.CGFloat width = v21;
  return result;
}

- (void)handleGestureRecognizer:(id)a3
{
  id v4 = a3;
  unint64_t totalActiveGestureRecognizers = self->_totalActiveGestureRecognizers;
  if ([v4 state] == 1) {
    ++self->_totalActiveGestureRecognizers;
  }
  if ([v4 state] == 4 || objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 5) {
    --self->_totalActiveGestureRecognizers;
  }
  if ([(SXFullscreenCanvasController *)self verticalSwipingIsActive]
    && ![(SXFullscreenCanvasController *)self isStoppingVerticalSwiping])
  {
    if (![(SXFullscreenCanvasController *)self panIsActive]) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (totalActiveGestureRecognizers != 1)
  {
    if (totalActiveGestureRecognizers)
    {
      unint64_t v6 = self->_totalActiveGestureRecognizers;
    }
    else
    {
      unint64_t v6 = self->_totalActiveGestureRecognizers;
      if (v6 == 1)
      {
        v7 = (CGPoint *)MEMORY[0x263F00148];
        *(_OWORD *)&self->_currentRotation = xmmword_222BEF4E0;
        self->_currentTranslation = *v7;
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __56__SXFullscreenCanvasController_handleGestureRecognizer___block_invoke;
        v8[3] = &unk_2646521E0;
        v8[4] = self;
        [(SXFullscreenCanvasController *)self willStartTransformingWithGestureRecognizer:v4 completionBlock:v8];
        goto LABEL_23;
      }
    }
    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (self->_totalActiveGestureRecognizers)
  {
LABEL_21:
    if ([v4 state] != 2) {
      goto LABEL_23;
    }
LABEL_22:
    [(SXFullscreenCanvasController *)self updateTransform];
    goto LABEL_23;
  }
  if (![(SXFullscreenCanvasController *)self isStoppingVerticalSwiping])
  {
    -[SXFullscreenCanvasController stopTransformingCancelled:](self, "stopTransformingCancelled:", [v4 state] == 4);
    [(SXFullscreenCanvasController *)self setLessTouchesAreInterupting:0];
    [(SXFullscreenCanvasController *)self setOrientationChangeIsInterupting:0];
  }
  *(_WORD *)&self->_verticalSwipingIsActive = 0;
LABEL_23:
}

void __56__SXFullscreenCanvasController_handleGestureRecognizer___block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) isFullscreen] ^ 1;
    [v2 startTransitionToFullScreen:v3 controllable:1];
  }
  else
  {
    unint64_t v5 = [*(id *)(a1 + 32) pinchGestureRecognizer];
    [v5 cancel];

    unint64_t v6 = [*(id *)(a1 + 32) panGestureRecognizer];
    [v6 cancel];

    id v7 = [*(id *)(a1 + 32) rotationGestureRecognizer];
    [v7 cancel];
  }
}

- (void)handlePanGestureRecognizer:(id)a3
{
  id v20 = a3;
  if ([v20 state] == 1)
  {
    self->_panIsActive = 1;
    self->_currentTranslation = (CGPoint)*MEMORY[0x263F00148];
    if ([(SXFullscreenCanvasController *)self isFullscreen])
    {
      if ([v20 numberOfTouches] == 1
        && ![(SXFullscreenCanvasController *)self pinchIsActive]
        && ![(SXFullscreenCanvasController *)self rotationIsActive])
      {
        self->_verticalSwipingIsActive = 1;
        [(SXFullscreenCanvasController *)self startVerticalSwiping];
      }
    }
  }
  if ([v20 state] == 2)
  {
    if ([(SXFullscreenCanvasController *)self pinchIsActive]
      || [(SXFullscreenCanvasController *)self isFullscreen])
    {
      id v4 = [(SXFullscreenCanvasController *)self canvasViewController];
      unint64_t v5 = [v4 view];
      [v20 translationInView:v5];
      self->_currentTranslation.CGFloat x = v6;
      self->_currentTranslation.CGFloat y = v7;

      if ([(SXFullscreenCanvasController *)self isFullscreen])
      {
        if ([(SXFullscreenCanvasController *)self verticalSwipingIsActive]) {
          self->_currentTranslation.CGFloat x = 0.0;
        }
      }
    }
    if ([v20 numberOfTouches] == 1
      && ![(SXFullscreenCanvasController *)self verticalSwipingIsActive])
    {
      [(SXFullscreenCanvasController *)self setLessTouchesAreInterupting:1];
      [v20 cancel];
      goto LABEL_34;
    }
  }
  if ([v20 state] == 4 || objc_msgSend(v20, "state") == 3 || objc_msgSend(v20, "state") == 5)
  {
    self->_panIsActive = 0;
    if ([(SXFullscreenCanvasController *)self isFullscreen])
    {
      if ([(SXFullscreenCanvasController *)self verticalSwipingIsActive])
      {
        self->_isStoppingVerticalSwiping = 1;
        double v8 = [v20 view];
        [v20 velocityInView:v8];
        double v10 = v9;
        double v12 = v11;

        [(SXFullscreenCanvasController *)self currentTranslation];
        if (v13 >= 0.0) {
          double v14 = v13;
        }
        else {
          double v14 = -v13;
        }
        double v15 = [(SXFullscreenCanvasController *)self canvasViewController];
        CGFloat v16 = [v15 view];
        [v16 bounds];
        if (v14 / v17 <= 0.25)
        {
          if (v12 >= 0.0) {
            double v18 = v12;
          }
          else {
            double v18 = -v12;
          }

          if (v18 <= 10.0)
          {
            uint64_t v19 = 0;
            goto LABEL_32;
          }
        }
        else
        {
        }
        uint64_t v19 = 1;
LABEL_32:
        -[SXFullscreenCanvasController stopVerticalSwipingDismissed:lastVelocity:](self, "stopVerticalSwipingDismissed:lastVelocity:", v19, v10, v12);
      }
    }
  }
  [(SXFullscreenCanvasController *)self handleGestureRecognizer:v20];
LABEL_34:
}

- (void)handleRotationGestureRecognizer:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    self->_rotationIsActive = 1;
    self->_currentRotation = 0.0;
  }
  if ([v5 state] != 2) {
    goto LABEL_10;
  }
  if ([(SXFullscreenCanvasController *)self pinchIsActive])
  {
    [v5 rotation];
    self->_currentRotation = v4;
  }
  if ([v5 numberOfTouches] == 1)
  {
    [(SXFullscreenCanvasController *)self setLessTouchesAreInterupting:1];
    [v5 cancel];
  }
  else
  {
LABEL_10:
    if ([v5 state] == 4 || objc_msgSend(v5, "state") == 3 || objc_msgSend(v5, "state") == 5) {
      self->_rotationIsActive = 0;
    }
    [(SXFullscreenCanvasController *)self handleGestureRecognizer:v5];
  }
}

- (void)handleOpenTapGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(SXFullscreenCanvasController *)self showable];
  char v6 = [v5 requestInteractivityFocusForFullScreenCanvasController:self];

  if (v6)
  {
    if ([v4 state] != 4 && objc_msgSend(v4, "state") != 5 && objc_msgSend(v4, "state") == 3)
    {
      __asm { FMOV            V0.2D, #0.5 }
      self->_startingAnchorPoint = _Q0;
      double v12 = (CGPoint *)MEMORY[0x263F00148];
      *(_OWORD *)&self->_currentRotation = xmmword_222BEF4E0;
      self->_currentTranslation = *v12;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke;
      v13[3] = &unk_264652C50;
      v13[4] = self;
      id v14 = v4;
      [(SXFullscreenCanvasController *)self willStartTransformingWithGestureRecognizer:v14 completionBlock:v13];
    }
  }
  else
  {
    [v4 cancel];
  }
}

uint64_t __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) startTransitionToFullScreen:1 controllable:0];
    uint64_t v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke_2;
    v6[3] = &unk_2646511F8;
    v6[4] = v3;
    return [v3 goToFullScreenFromOriginalAnimated:1 completionBlock:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 cancel];
  }
}

uint64_t __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionFromFullScreen:0 toFullScreen:1];
}

- (void)presentFullscreenWithIndex:(unint64_t)a3
{
  self->_currentScale = 1.0;
  [(SXFullscreenCanvasController *)self setCurrentViewIndex:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke;
  v4[3] = &unk_2646521E0;
  v4[4] = self;
  [(SXFullscreenCanvasController *)self willStartTransformingWithGestureRecognizer:0 completionBlock:v4];
}

uint64_t __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(result + 32) backgroundView];
    [v3 setAlpha:1.0];

    id v4 = *(void **)(v2 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke_2;
    v5[3] = &unk_2646511F8;
    v5[4] = v4;
    return [v4 goToFullScreenFromOriginalAnimated:0 completionBlock:v5];
  }
  return result;
}

uint64_t __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionFromFullScreen:0 toFullScreen:1];
}

- (void)handlePinchGestureRecognizer:(id)a3
{
  id v11 = a3;
  if ([v11 state] == 1)
  {
    self->_pinchIsActive = 1;
    [v11 scale];
    self->_currentScale = v4;
    self->_currentRotation = 0.0;
    id v5 = (double *)MEMORY[0x263F00148];
    self->_currentTranslation = (CGPoint)*MEMORY[0x263F00148];
    char v6 = [(SXFullscreenCanvasController *)self rotationGestureRecognizer];
    [v6 setRotation:0.0];

    CGFloat v7 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
    double v8 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
    double v9 = [v8 view];
    objc_msgSend(v7, "setTranslation:inView:", v9, *v5, v5[1]);
  }
  if ([v11 state] == 2
    && ([v11 scale], self->_currentScale = v10, objc_msgSend(v11, "numberOfTouches") == 1))
  {
    [(SXFullscreenCanvasController *)self setLessTouchesAreInterupting:1];
    [v11 cancel];
  }
  else
  {
    if ([v11 state] == 4 || objc_msgSend(v11, "state") == 3 || objc_msgSend(v11, "state") == 5) {
      self->_pinchIsActive = 0;
    }
    [(SXFullscreenCanvasController *)self handleGestureRecognizer:v11];
  }
}

- (void)willStartTransformingWithGestureRecognizer:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  CGFloat v7 = (void (**)(id, uint64_t))a4;
  if (!self->_isTransitioning)
  {
    if (v6)
    {
      double v8 = [v6 view];
      [v6 locationInView:v8];
      double v10 = v9;
      double v12 = v11;

      currentViewIndeCGFloat x = -[SXFullscreenCanvasController viewIndexForPoint:](self, "viewIndexForPoint:", v10, v12);
      self->_currentViewIndeCGFloat x = currentViewIndex;
    }
    else
    {
      double v10 = *MEMORY[0x263F00148];
      double v12 = *(double *)(MEMORY[0x263F00148] + 8);
      currentViewIndeCGFloat x = self->_currentViewIndex;
    }
    id v14 = [(SXFullscreenCanvasController *)self showable];
    double v15 = [(SXFullscreenCanvasController *)self showable];
    unint64_t v16 = [v14 fullScreenCanvasController:self numberOfViewsForShowable:v15];

    if (currentViewIndex < v16)
    {
      if ([(SXFullscreenCanvasController *)self isFullscreen])
      {
        self->_isTransitioning = 1;
        double v17 = [(SXFullscreenCanvasController *)self canvasViewController];
        [v17 setIsTransitioning:1];

        double v18 = [(SXFullscreenCanvasController *)self captionView];

        if (v18)
        {
          uint64_t v19 = [(SXFullscreenCanvasController *)self captionView];
          -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", [v19 viewIndex], 0, 1);
        }
        id v20 = [(SXFullscreenCanvasController *)self showable];
        double v21 = [(SXFullscreenCanvasController *)self showable];
        objc_msgSend(v20, "fullScreenCanvasController:originalViewForShowable:viewIndex:", self, v21, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
        double v22 = (UIView *)objc_claimAutoreleasedReturnValue();
        currentView = self->_currentView;
        self->_currentView = v22;

        if (v6)
        {
          CGFloat v24 = [v6 view];
          objc_msgSend(v24, "convertPoint:toView:", self->_currentView, v10, v12);

          [(UIView *)self->_currentView bounds];
          -[SXFullscreenCanvasController calculateAnchorPointFromBounds:andPoint:](self, "calculateAnchorPointFromBounds:andPoint:");
          self->_startingAnchorPoint.CGFloat x = v25;
          self->_startingAnchorPoint.CGFloat y = v26;
        }
        CGRect v27 = [(SXFullscreenCanvasController *)self showable];
        char v28 = objc_opt_respondsToSelector();

        if (v28)
        {
          CGRect v29 = [(SXFullscreenCanvasController *)self showable];
          CGRect v30 = [(SXFullscreenCanvasController *)self showable];
          objc_msgSend(v29, "fullScreenCanvasController:willHideShowable:viewIndex:", self, v30, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
        }
        CGRect v31 = [(SXFullscreenCanvasController *)self itemizedScrollView];
        [v31 setScrollEnabled:0];

        CGRect v32 = [(SXFullscreenCanvasController *)self showable];
        CGRect v33 = [(SXFullscreenCanvasController *)self showable];
        double v34 = [(SXFullscreenCanvasController *)self canvasViewController];
        int v35 = [v34 view];
        objc_msgSend(v32, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", self, v33, v35, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
        self->_currentDestinationFrame.origin.CGFloat x = v36;
        self->_currentDestinationFrame.origin.CGFloat y = v37;
        self->_currentDestinationFrame.size.CGFloat width = v38;
        self->_currentDestinationFrame.size.CGFloat height = v39;

        v40 = [(SXFullscreenCanvasController *)self showable];
        CGRect v41 = [(SXFullscreenCanvasController *)self showable];
        unint64_t v42 = [(SXFullscreenCanvasController *)self currentViewIndex];
        v43 = [(SXFullscreenCanvasController *)self canvasViewController];
        v44 = [v43 view];
        [v44 bounds];
        objc_msgSend(v40, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", self, v41, v42);
        self->_currentOriginFrame.origin.CGFloat x = v45;
        self->_currentOriginFrame.origin.CGFloat y = v46;
        self->_currentOriginFrame.size.CGFloat width = v47;
        self->_currentOriginFrame.size.CGFloat height = v48;

        v49 = [(SXFullscreenCanvasController *)self currentView];
        v50 = [v49 superview];
        v51 = [(SXFullscreenCanvasController *)self currentView];
        [v51 frame];
        double v53 = v52;
        double v55 = v54;
        double v57 = v56;
        double v59 = v58;
        v60 = [(SXFullscreenCanvasController *)self canvasViewController];
        v61 = [v60 view];
        objc_msgSend(v50, "convertRect:toView:", v61, v53, v55, v57, v59);
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;
        double v69 = v68;

        v70 = [(SXFullscreenCanvasController *)self currentView];
        objc_msgSend(v70, "setFrame:", v63, v65, v67, v69);

        v71 = [(SXFullscreenCanvasController *)self canvasViewController];
        v72 = [v71 view];
        v73 = [(SXFullscreenCanvasController *)self currentView];
        v74 = [(SXFullscreenCanvasController *)self captionView];
        [v72 insertSubview:v73 belowSubview:v74];

        [(SXFullscreenCanvasController *)self transferCurrentViewToCanvas];
        v75 = [(SXFullscreenCanvasController *)self currentView];
        [(SXFullscreenCanvasController *)self transferGestureViewToView:v75];

        v76 = [(SXFullscreenCanvasController *)self currentView];
        v77 = [v76 layer];
        [(SXFullscreenCanvasController *)self startingAnchorPoint];
        objc_msgSend(v77, "setAnchorPointWithoutChangingPosition:");

        v78 = [(SXFullscreenCanvasController *)self itemizedScrollView];
        [v78 removeFromSuperview];

        [(SXFullscreenCanvasController *)self setItemizedScrollView:0];
        v79 = [(SXFullscreenCanvasController *)self captionView];
        [v79 removeFromSuperview];

        [(SXFullscreenCanvasController *)self setCaptionView:0];
        v80 = [(SXFullscreenCanvasController *)self navigationBarView];
        [v80 removeFromSuperview];

        [(SXFullscreenCanvasController *)self setNavigationBarView:0];
        if (v7) {
          v7[2](v7, 1);
        }
        goto LABEL_19;
      }
      v81 = [(SXFullscreenCanvasController *)self showable];
      if (objc_opt_respondsToSelector())
      {
        v82 = [(SXFullscreenCanvasController *)self showable];
        v83 = [(SXFullscreenCanvasController *)self showable];
        char v84 = objc_msgSend(v82, "fullScreenCanvasController:willShowShowable:viewIndex:", self, v83, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

        if ((v84 & 1) == 0) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      self->_isTransitioning = 1;
      v85 = [(SXFullscreenCanvasController *)self showable];
      v86 = [(SXFullscreenCanvasController *)self showable];
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke;
      v90[3] = &unk_264652C78;
      v90[4] = self;
      id v91 = v6;
      double v93 = v10;
      double v94 = v12;
      v92 = v7;
      v87 = [v85 fullScreenCanvasController:self canvasViewControllerForShowable:v86 completionBlock:v90];
      canvasViewController = self->_canvasViewController;
      self->_canvasViewController = v87;

      v89 = [(SXFullscreenCanvasController *)self canvasViewController];
      [v89 setIsTransitioning:1];

      goto LABEL_19;
    }
  }
LABEL_17:
  if (v7) {
    v7[2](v7, 0);
  }
LABEL_19:
}

void __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) canvasViewController];
  [v2 setDelegate:*(void *)(a1 + 32)];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke_2;
  block[3] = &unk_264652C78;
  uint64_t v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) showable];
  uint64_t v3 = *(void **)(a1 + 32);
  double v4 = [v3 showable];
  uint64_t v5 = objc_msgSend(v2, "fullScreenCanvasController:originalViewForShowable:viewIndex:", v3, v4, objc_msgSend(*(id *)(a1 + 32), "currentViewIndex"));
  uint64_t v6 = *(void *)(a1 + 32);
  long long v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v5;

  double v8 = *(void **)(a1 + 32);
  double v9 = [v8 showable];
  double v10 = *(void **)(a1 + 32);
  double v11 = [v10 showable];
  double v12 = [*(id *)(a1 + 32) canvasViewController];
  double v13 = [v12 view];
  objc_msgSend(v9, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", v10, v11, v13, objc_msgSend(*(id *)(a1 + 32), "currentViewIndex"));
  v8[27] = v14;
  v8[28] = v15;
  v8[29] = v16;
  v8[30] = v17;

  double v18 = *(void **)(a1 + 32);
  uint64_t v19 = [v18 showable];
  id v20 = *(void **)(a1 + 32);
  double v21 = [v20 showable];
  uint64_t v22 = [*(id *)(a1 + 32) currentViewIndex];
  CGFloat v23 = [*(id *)(a1 + 32) canvasViewController];
  CGFloat v24 = [v23 view];
  [v24 bounds];
  objc_msgSend(v19, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", v20, v21, v22);
  v18[31] = v25;
  v18[32] = v26;
  v18[33] = v27;
  v18[34] = v28;

  CGRect v29 = *(void **)(a1 + 40);
  if (v29)
  {
    CGRect v30 = [v29 view];
    objc_msgSend(v30, "convertPoint:toView:", *(void *)(*(void *)(a1 + 32) + 136), *(double *)(a1 + 56), *(double *)(a1 + 64));

    uint64_t v31 = *(void *)(a1 + 32);
    [*(id *)(v31 + 136) bounds];
    objc_msgSend((id)v31, "calculateAnchorPointFromBounds:andPoint:");
    *(void *)(v31 + 200) = v32;
    *(void *)(v31 + 208) = v33;
  }
  double v34 = [*(id *)(a1 + 32) canvasViewController];
  int v35 = [v34 view];
  [v35 bounds];
  double v37 = v36;

  CGFloat v38 = [*(id *)(a1 + 32) canvasViewController];
  CGFloat v39 = [v38 view];
  [v39 bounds];
  double v41 = v40;

  if (v37 >= v41) {
    double v42 = v37;
  }
  else {
    double v42 = v41;
  }
  double v43 = v42 + v42;
  v44 = [*(id *)(a1 + 32) canvasViewController];
  CGFloat v45 = [v44 view];
  [v45 bounds];
  double v47 = v46 - v43 * 0.5;
  CGFloat v48 = [*(id *)(a1 + 32) canvasViewController];
  v49 = [v48 view];
  [v49 bounds];
  double v51 = v50 - v43 * 0.5;

  double v52 = [*(id *)(a1 + 32) canvasViewController];
  double v53 = [v52 view];
  double v54 = [*(id *)(a1 + 32) backgroundView];
  [v53 addSubview:v54];

  double v55 = [*(id *)(a1 + 32) backgroundView];
  [v55 setAlpha:0.0];

  double v56 = [*(id *)(a1 + 32) backgroundView];
  objc_msgSend(v56, "setFrame:", v47, v51, v43, v43);

  [*(id *)(a1 + 32) transferCurrentViewToCanvas];
  double v57 = [*(id *)(a1 + 32) currentView];
  double v58 = [v57 layer];
  [*(id *)(a1 + 32) startingAnchorPoint];
  objc_msgSend(v58, "setAnchorPointWithoutChangingPosition:");

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v60 = *(uint64_t (**)(void))(result + 16);
    return v60();
  }
  return result;
}

- (void)updateTransform
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v24.c = v3;
  *(_OWORD *)&v24.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGFloat x = self->_currentTranslation.x;
  CGFloat y = self->_currentTranslation.y;
  *(_OWORD *)&v23.a = *(_OWORD *)&v24.a;
  *(_OWORD *)&v23.c = v3;
  *(_OWORD *)&v23.tCGFloat x = *(_OWORD *)&v24.tx;
  CGAffineTransformTranslate(&v24, &v23, x, y);
  double currentRotation = self->_currentRotation;
  CGAffineTransform v22 = v24;
  CGAffineTransformRotate(&v23, &v22, currentRotation);
  CGAffineTransform v24 = v23;
  double currentScale = self->_currentScale;
  CGAffineTransform v22 = v23;
  CGAffineTransformScale(&v23, &v22, currentScale, currentScale);
  CGAffineTransform v24 = v23;
  CGAffineTransform v21 = v23;
  double v8 = [(SXFullscreenCanvasController *)self currentView];
  CGAffineTransform v20 = v21;
  [v8 setTransform:&v20];

  if ([(SXFullscreenCanvasController *)self verticalSwipingIsActive])
  {
    [(SXFullscreenCanvasController *)self currentTranslation];
    if (v9 >= 0.0) {
      double v10 = v9;
    }
    else {
      double v10 = -v9;
    }
    double v11 = [(SXFullscreenCanvasController *)self canvasViewController];
    double v12 = [v11 view];
    [v12 bounds];
    double v14 = v10 / (v13 * -0.5) + 1.0;
  }
  else
  {
    BOOL v15 = [(SXFullscreenCanvasController *)self isFullscreen];
    [(SXFullscreenCanvasController *)self currentScale];
    if (v15) {
      double v14 = (v16 + -0.6) / 0.4;
    }
    else {
      double v14 = v16 + -1.0 + v16 + -1.0;
    }
  }
  double v17 = fmax(v14, 0.0);
  if (v17 <= 1.0) {
    double v18 = v17;
  }
  else {
    double v18 = 1.0;
  }
  uint64_t v19 = [(SXFullscreenCanvasController *)self backgroundView];
  [v19 setAlpha:v18];
}

- (void)stopTransformingCancelled:(BOOL)a3
{
  double currentScale = self->_currentScale;
  if (currentScale > 1.5)
  {
    if (![(SXFullscreenCanvasController *)self isFullscreen])
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke;
      v8[3] = &unk_2646511F8;
      v8[4] = self;
      [(SXFullscreenCanvasController *)self goToFullScreenFromOriginalAnimated:1 completionBlock:v8];
      return;
    }
    double currentScale = self->_currentScale;
  }
  if (currentScale > 0.6)
  {
    if ([(SXFullscreenCanvasController *)self isFullscreen])
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_2;
      v7[3] = &unk_2646511F8;
      v7[4] = self;
      [(SXFullscreenCanvasController *)self goToFullScreenFromFullScreenAnimated:1 completionBlock:v7];
      return;
    }
    double currentScale = self->_currentScale;
  }
  if (currentScale <= 0.6)
  {
    if ([(SXFullscreenCanvasController *)self isFullscreen])
    {
      [(SXFullscreenCanvasController *)self removeScaleAndTranslationFromCurrentView];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_3;
      v6[3] = &unk_2646511F8;
      v6[4] = self;
      [(SXFullscreenCanvasController *)self goToOriginalFromFullScreenAnimated:1 completionBlock:v6];
      return;
    }
    double currentScale = self->_currentScale;
  }
  if (currentScale <= 1.5 && ![(SXFullscreenCanvasController *)self isFullscreen])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_4;
    v5[3] = &unk_2646511F8;
    v5[4] = self;
    [(SXFullscreenCanvasController *)self goToOriginalFromOriginalAnimated:1 completionBlock:v5];
  }
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeScaleAndTranslationFromCurrentView];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 didEndTransitionFromFullScreen:0 toFullScreen:1];
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionFromFullScreen:1 toFullScreen:1];
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionFromFullScreen:1 toFullScreen:0];
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTransitionFromFullScreen:0 toFullScreen:0];
}

- (void)startTransitionToFullScreen:(BOOL)a3 controllable:(BOOL)a4
{
  if (!a3)
  {
    BOOL v4 = a4;
    if ([(SXFullscreenCanvasController *)self isFullscreen])
    {
      if (v4)
      {
        id v7 = [(SXFullscreenCanvasController *)self itemizedScrollView];
        uint64_t v6 = [v7 activeView];
        [v6 removeFromSuperview];
      }
    }
  }
}

- (void)didEndTransitionFromFullScreen:(BOOL)a3 toFullScreen:(BOOL)a4
{
  [(SXFullscreenCanvasController *)self setIsFullscreen:a4];
  self->_isTransitioning = 0;
  if ([(SXFullscreenCanvasController *)self isFullscreen])
  {
    uint64_t v5 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v5 setScrollEnabled:1];

    [(SXFullscreenCanvasController *)self didFinishFullscreenActiveIndex:[(SXFullscreenCanvasController *)self currentViewIndex]];
    uint64_t v6 = [(SXFullscreenCanvasController *)self showable];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(SXFullscreenCanvasController *)self showable];
      double v9 = [(SXFullscreenCanvasController *)self showable];
      objc_msgSend(v8, "fullScreenCanvasController:didShowShowable:viewIndex:", self, v9, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
    }
    double v10 = [(SXFullscreenCanvasController *)self dragManager];
    double v11 = v10;
    uint64_t v12 = 1;
  }
  else
  {
    double v13 = [(SXFullscreenCanvasController *)self showable];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      BOOL v15 = [(SXFullscreenCanvasController *)self showable];
      double v16 = [(SXFullscreenCanvasController *)self showable];
      objc_msgSend(v15, "fullScreenCanvasController:didHideShowable:viewIndex:", self, v16, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
    }
    double v17 = [(SXFullscreenCanvasController *)self showable];
    double v18 = [(SXFullscreenCanvasController *)self gestureView];
    uint64_t v19 = [(SXFullscreenCanvasController *)self showable];
    [v17 fullScreenCanvasController:self shouldAddGestureView:v18 forShowable:v19];

    CGAffineTransform v20 = [(SXFullscreenCanvasController *)self canvasViewController];
    [v20 setView:0];

    double v10 = [(SXFullscreenCanvasController *)self dragManager];
    double v11 = v10;
    uint64_t v12 = 0;
  }
  [v10 setEnabled:v12];

  id v21 = [(SXFullscreenCanvasController *)self canvasViewController];
  [v21 setIsTransitioning:0];
}

- (void)startVerticalSwiping
{
  long long v3 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  [v3 setScrollEnabled:0];

  *(_OWORD *)&self->_double currentRotation = xmmword_222BEF4E0;
  id v4 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  [(SXFullscreenCanvasController *)self willStartTransformingWithGestureRecognizer:v4 completionBlock:0];
}

- (void)stopVerticalSwipingDismissed:(BOOL)a3 lastVelocity:(CGPoint)a4
{
  if (a3)
  {
    double y = a4.y;
    double x = a4.x;
    [(SXFullscreenCanvasController *)self setIsFullscreen:0];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke_2;
    v7[3] = &unk_2646511F8;
    v7[4] = self;
    -[SXFullscreenCanvasController goToOriginalFromVerticalSwipingWithVelocity:completionBlock:](self, "goToOriginalFromVerticalSwipingWithVelocity:completionBlock:", v7, x, y);
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke;
    v8[3] = &unk_2646511F8;
    v8[4] = self;
    [(SXFullscreenCanvasController *)self goToFullScreenFromFullScreenAnimated:1 completionBlock:v8];
  }
}

uint64_t __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) itemizedScrollView];
  [v2 setScrollEnabled:1];

  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[16];
  return [v3 didFinishFullscreenActiveIndex:v4];
}

uint64_t __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) transferCurrentViewToOriginalView];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 didEndTransitionFromFullScreen:1 toFullScreen:0];
}

- (void)goToFullScreenFromOriginalAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  char v7 = [(SXFullscreenCanvasController *)self currentView];
  double v8 = v7;
  if (v4)
  {
    [v7 setUserInteractionEnabled:0];

    double v9 = (void *)MEMORY[0x263F1CB60];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke;
    v16[3] = &unk_2646511F8;
    v16[4] = self;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke_2;
    v14[3] = &unk_264652CA0;
    v14[4] = self;
    BOOL v15 = v6;
    [v9 animateWithDuration:0 delay:v16 usingSpringWithDamping:v14 initialSpringVelocity:0.6 options:0.0 animations:0.6 completion:0.8];
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v13[0] = *MEMORY[0x263F000D0];
    v13[1] = v10;
    v13[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v7 setTransform:v13];

    double v11 = [(SXFullscreenCanvasController *)self currentView];
    uint64_t v12 = [v11 layer];
    objc_msgSend(v12, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    if (v6) {
      v6[2](v6);
    }
  }
}

void __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:1.0];

  long long v3 = [*(id *)(a1 + 32) currentView];
  BOOL v4 = [v3 layer];
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  uint64_t v5 = [*(id *)(a1 + 32) currentView];
  [*(id *)(a1 + 32) currentDestinationFrame];
  double MidX = CGRectGetMidX(v12);
  [*(id *)(a1 + 32) currentDestinationFrame];
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v13));

  char v7 = [*(id *)(a1 + 32) currentView];
  [*(id *)(a1 + 32) currentDestinationFrame];
  double Width = CGRectGetWidth(v14);
  [*(id *)(a1 + 32) currentDestinationFrame];
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v15));

  double v9 = [*(id *)(a1 + 32) currentView];
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v11[0] = *MEMORY[0x263F000D0];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v9 setTransform:v11];
}

uint64_t __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentView];
  long long v3 = [v2 layer];
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  BOOL v4 = [*(id *)(a1 + 32) currentView];
  [v4 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)goToFullScreenFromFullScreenAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  char v7 = [(SXFullscreenCanvasController *)self showable];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(SXFullscreenCanvasController *)self showable];
    long long v10 = [(SXFullscreenCanvasController *)self showable];
    objc_msgSend(v9, "fullScreenCanvasController:willReturnToFullscreenForShowable:viewIndex:", self, v10, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
  }
  double v11 = [(SXFullscreenCanvasController *)self currentView];
  CGRect v12 = v11;
  if (v4)
  {
    [v11 setUserInteractionEnabled:1];

    CGRect v13 = (void *)MEMORY[0x263F1CB60];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke;
    v20[3] = &unk_2646511F8;
    v20[4] = self;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke_2;
    v18[3] = &unk_264652CA0;
    v18[4] = self;
    uint64_t v19 = v6;
    [v13 animateWithDuration:0 delay:v20 usingSpringWithDamping:v18 initialSpringVelocity:0.6 options:0.0 animations:0.6 completion:0.8];
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v17[0] = *MEMORY[0x263F000D0];
    v17[1] = v14;
    v17[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v11 setTransform:v17];

    CGRect v15 = [(SXFullscreenCanvasController *)self currentView];
    double v16 = [v15 layer];
    objc_msgSend(v16, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    if (v6) {
      v6[2](v6);
    }
  }
}

void __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:1.0];

  long long v3 = [*(id *)(a1 + 32) currentView];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v5];
}

uint64_t __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentView];
  long long v3 = [v2 layer];
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  long long v4 = [*(id *)(a1 + 32) currentView];
  [v4 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)goToOriginalFromFullScreenAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  char v7 = [(SXFullscreenCanvasController *)self canvasViewController];
  char v8 = [v7 view];
  double v9 = [v8 window];
  [v9 layoutIfNeeded];

  long long v10 = [(SXFullscreenCanvasController *)self showable];
  double v11 = [(SXFullscreenCanvasController *)self showable];
  CGRect v12 = [(SXFullscreenCanvasController *)self canvasViewController];
  CGRect v13 = [v12 view];
  objc_msgSend(v10, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", self, v11, v13, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  if (v4)
  {
    CGAffineTransform v22 = [(SXFullscreenCanvasController *)self currentView];
    [v22 setUserInteractionEnabled:0];

    CGAffineTransform v23 = (void *)MEMORY[0x263F1CB60];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke;
    v31[3] = &unk_264651D18;
    v31[4] = self;
    v31[5] = v15;
    v31[6] = v17;
    v31[7] = v19;
    v31[8] = v21;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke_2;
    v29[3] = &unk_264652CA0;
    v29[4] = self;
    CGRect v30 = v6;
    [v23 animateWithDuration:0 delay:v31 usingSpringWithDamping:v29 initialSpringVelocity:0.6 options:0.0 animations:0.6 completion:0.8];
  }
  else
  {
    CGAffineTransform v24 = [(SXFullscreenCanvasController *)self currentView];
    long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v28[0] = *MEMORY[0x263F000D0];
    v28[1] = v25;
    v28[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v24 setTransform:v28];

    uint64_t v26 = [(SXFullscreenCanvasController *)self currentView];
    uint64_t v27 = [v26 layer];
    objc_msgSend(v27, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    [(SXFullscreenCanvasController *)self transferCurrentViewToOriginalView];
    if (v6) {
      v6[2](v6);
    }
  }
}

void __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:0.0];

  long long v3 = [*(id *)(a1 + 32) currentView];
  BOOL v4 = [v3 layer];
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  uint64_t v5 = [*(id *)(a1 + 32) currentView];
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(*(CGRect *)(a1 + 40)));

  char v7 = [*(id *)(a1 + 32) currentView];
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(*(CGRect *)(a1 + 40)));

  double v9 = [*(id *)(a1 + 32) currentView];
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v11[0] = *MEMORY[0x263F000D0];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v9 setTransform:v11];
}

uint64_t __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentView];
  long long v3 = [v2 layer];
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  [*(id *)(a1 + 32) transferCurrentViewToOriginalView];
  BOOL v4 = [*(id *)(a1 + 32) currentView];
  [v4 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)goToOriginalFromOriginalAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (v4)
  {
    char v7 = [(SXFullscreenCanvasController *)self currentView];
    [v7 setUserInteractionEnabled:1];

    char v8 = (void *)MEMORY[0x263F1CB60];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke;
    _OWORD v17[3] = &unk_2646511F8;
    v17[4] = self;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke_2;
    v15[3] = &unk_264652CA0;
    v15[4] = self;
    uint64_t v16 = v6;
    [v8 animateWithDuration:0 delay:v17 usingSpringWithDamping:v15 initialSpringVelocity:0.6 options:0.0 animations:0.6 completion:0.8];
  }
  else
  {
    double v9 = [(SXFullscreenCanvasController *)self backgroundView];
    [v9 setAlpha:0.0];

    long long v10 = [(SXFullscreenCanvasController *)self currentView];
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v14[0] = *MEMORY[0x263F000D0];
    v14[1] = v11;
    v14[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v10 setTransform:v14];

    CGRect v12 = [(SXFullscreenCanvasController *)self currentView];
    CGRect v13 = [v12 layer];
    objc_msgSend(v13, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    [(SXFullscreenCanvasController *)self transferCurrentViewToOriginalView];
    if (v6) {
      v6[2](v6);
    }
  }
}

void __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:0.0];

  long long v3 = [*(id *)(a1 + 32) currentView];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v5];
}

uint64_t __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentView];
  long long v3 = [v2 layer];
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  [*(id *)(a1 + 32) transferCurrentViewToOriginalView];
  long long v4 = [*(id *)(a1 + 32) currentView];
  [v4 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)goToOriginalFromVerticalSwipingWithVelocity:(CGPoint)a3 completionBlock:(id)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  [(SXFullscreenCanvasController *)self removeScaleAndTranslationFromCurrentView];
  char v8 = [(SXFullscreenCanvasController *)self canvasViewController];
  double v9 = [v8 view];
  long long v10 = [v9 window];
  [v10 layoutIfNeeded];

  long long v11 = [(SXFullscreenCanvasController *)self showable];
  CGRect v12 = [(SXFullscreenCanvasController *)self showable];
  CGRect v13 = [(SXFullscreenCanvasController *)self canvasViewController];
  uint64_t v14 = [v13 view];
  objc_msgSend(v11, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", self, v12, v14, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
  uint64_t v16 = v15;
  double v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke;
  _OWORD v28[3] = &unk_264652CC8;
  v28[4] = self;
  *(CGFloat *)&v28[5] = x;
  *(double *)&v28[6] = y;
  [MEMORY[0x263F1CB60] animateWithDuration:0x20000 delay:v28 options:0 animations:0.13 completion:0.0];
  CGAffineTransform v23 = (void *)MEMORY[0x263F1CB60];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_2;
  v27[3] = &unk_264651D18;
  v27[4] = self;
  v27[5] = v16;
  *(double *)&v27[6] = v18 + y * -0.1;
  v27[7] = v20;
  v27[8] = v22;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_3;
  v25[3] = &unk_264652CA0;
  v25[4] = self;
  id v26 = v7;
  id v24 = v7;
  [v23 animateWithDuration:0 delay:v27 usingSpringWithDamping:v25 initialSpringVelocity:0.44 options:0.08 animations:0.85 completion:0.18];
}

void __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeTranslation(&v4, 0.0, *(double *)(a1 + 48) * 0.1);
  uint64_t v2 = [*(id *)(a1 + 32) currentView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:0.0];

  CGAffineTransform v3 = [*(id *)(a1 + 32) currentView];
  CGAffineTransform v4 = [v3 layer];
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  uint64_t v5 = [*(id *)(a1 + 32) currentView];
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(*(CGRect *)(a1 + 40)));

  id v8 = [*(id *)(a1 + 32) currentView];
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(*(CGRect *)(a1 + 40)));
}

uint64_t __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentView];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handleTap:(id)a3
{
  CGAffineTransform v4 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  uint64_t v5 = [v4 activeView];
  uint64_t v6 = [v5 superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(SXFullscreenCanvasController *)self captionView];

    if (v8)
    {
      id v11 = [(SXFullscreenCanvasController *)self captionView];
      uint64_t v9 = [v11 viewIndex];
      long long v10 = [(SXFullscreenCanvasController *)self captionView];
      -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", v9, [v10 expanded] ^ 1, 1);
    }
  }
}

- (void)startSupressingColorSettings
{
  if (![(SXFullscreenCanvasController *)self isSupressingColorSettings])
  {
    [MEMORY[0x263F1CBE8] suppressColorSettingsForRequester:self];
    [(SXFullscreenCanvasController *)self setIsSupressingColorSettings:1];
  }
}

- (void)stopSupressingColorSettings
{
  if ([(SXFullscreenCanvasController *)self isSupressingColorSettings])
  {
    [MEMORY[0x263F1CBE8] restoreColorSettingsForRequester:self];
    [(SXFullscreenCanvasController *)self setIsSupressingColorSettings:0];
  }
}

- (int64_t)viewIndexForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(SXFullscreenCanvasController *)self isFullscreen])
  {
    uint64_t v6 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    int64_t v7 = [v6 activeViewIndex];
  }
  else
  {
    uint64_t v6 = [(SXFullscreenCanvasController *)self showable];
    id v8 = [(SXFullscreenCanvasController *)self showable];
    int64_t v7 = objc_msgSend(v6, "fullScreenCanvasController:viewIndexForPoint:inShowable:", self, v8, x, y);
  }
  return v7;
}

- (CGPoint)calculateAnchorPointFromBounds:(CGRect)a3 andPoint:(CGPoint)a4
{
  double v4 = a4.x / a3.size.width;
  double v5 = a4.y / a3.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (void)transferCurrentViewToCanvas
{
  long long v3 = [(SXFullscreenCanvasController *)self canvasViewController];
  double v4 = [v3 view];
  double v5 = [(SXFullscreenCanvasController *)self currentView];
  [v4 addSubview:v5];

  [(SXFullscreenCanvasController *)self currentOriginFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(SXFullscreenCanvasController *)self currentView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
}

- (void)transferCurrentViewToOriginalView
{
  id v4 = [(SXFullscreenCanvasController *)self showable];
  long long v3 = [(SXFullscreenCanvasController *)self showable];
  objc_msgSend(v4, "fullScreenCanvasController:showable:shouldTransferToOriginalViewWithIndex:", self, v3, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
}

- (void)transferGestureViewToView:(id)a3
{
  id v9 = a3;
  id v4 = [(SXFullscreenCanvasController *)self gestureView];
  [v9 addSubview:v4];

  double v5 = [(SXFullscreenCanvasController *)self gestureView];
  double v6 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  [v6 bounds];
  double Width = CGRectGetWidth(v11);
  double v8 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  [v8 bounds];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v12));

  [v9 setUserInteractionEnabled:1];
}

- (BOOL)comparePoint:(CGPoint)a3 withPoint:(CGPoint)a4 maxDelta:(double)a5
{
  double v5 = a3.x - a4.x;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  double v6 = a3.y - a4.y;
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  return v6 <= a5 && v5 <= a5;
}

- (void)removeScaleAndTranslationFromCurrentView
{
  [(SXFullscreenCanvasController *)self currentOriginFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SXFullscreenCanvasController *)self startingAnchorPoint];
  double v12 = v11;
  [(SXFullscreenCanvasController *)self currentScale];
  double v14 = -(v12 * (v13 + -1.0));
  [(SXFullscreenCanvasController *)self currentTranslation];
  double v16 = v4 + v15 + v14 * v8;
  [(SXFullscreenCanvasController *)self startingAnchorPoint];
  double v18 = v17;
  [(SXFullscreenCanvasController *)self currentScale];
  double v20 = -(v18 * (v19 + -1.0));
  [(SXFullscreenCanvasController *)self currentTranslation];
  double v22 = v6 + v21 + v20 * v10;
  [(SXFullscreenCanvasController *)self currentScale];
  double v24 = v8 * v23;
  [(SXFullscreenCanvasController *)self currentScale];
  double v26 = v10 * v25;
  self->_currentTranslation = (CGPoint)*MEMORY[0x263F00148];
  self->_double currentScale = 1.0;
  uint64_t v27 = [(SXFullscreenCanvasController *)self backgroundView];
  [v27 alpha];
  double v29 = v28;

  [(SXFullscreenCanvasController *)self updateTransform];
  CGRect v30 = [(SXFullscreenCanvasController *)self backgroundView];
  [v30 setAlpha:v29];

  id v31 = [(SXFullscreenCanvasController *)self currentView];
  objc_msgSend(v31, "setFrameUsingCenterAndBounds:", v16, v22, v24, v26);
}

- (void)fullScreenImageViewDidStartZooming:(id)a3
{
  double v4 = [(SXFullscreenCanvasController *)self captionView];

  if (v4)
  {
    double v5 = [(SXFullscreenCanvasController *)self captionView];
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", [v5 viewIndex], 0, 1);
  }
  double v6 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];
  [v6 cancel];

  double v7 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  [v7 cancel];

  id v8 = [(SXFullscreenCanvasController *)self rotationGestureRecognizer];
  [v8 cancel];
}

- (void)fullScreenImageViewDidStopZooming:(id)a3
{
  double v4 = [(SXFullscreenCanvasController *)self captionView];

  if (v4)
  {
    id v5 = [(SXFullscreenCanvasController *)self captionView];
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", [v5 viewIndex], 1, 1);
  }
}

- (unint64_t)numberOfViewsInItemizedScrollView:(id)a3
{
  double v4 = [(SXFullscreenCanvasController *)self showable];
  id v5 = [(SXFullscreenCanvasController *)self showable];
  unint64_t v6 = [v4 fullScreenCanvasController:self numberOfViewsForShowable:v5];

  return v6;
}

- (CGRect)itemizedScrollView:(id)a3 frameForViewAtIndex:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [(SXFullscreenCanvasController *)self canvasViewController];
  double v7 = [v6 view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  [v5 frame];
  double v13 = -v12;
  [v5 frame];
  double v15 = v14;

  double v16 = -v15;
  double v17 = v13;
  double v18 = v9;
  double v19 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v16;
  result.origin.double x = v17;
  return result;
}

- (id)itemizedScrollView:(id)a3 viewAtIndex:(unint64_t)a4
{
  unint64_t v6 = [(SXFullscreenCanvasController *)self showable];
  double v7 = [(SXFullscreenCanvasController *)self showable];
  double v8 = [v6 fullScreenCanvasController:self originalViewForShowable:v7 viewIndex:a4];

  double v9 = [(SXFullscreenCanvasController *)self showable];
  double v10 = [(SXFullscreenCanvasController *)self showable];
  double v11 = [(SXFullscreenCanvasController *)self canvasViewController];
  double v12 = [v11 view];
  [v12 bounds];
  objc_msgSend(v9, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", self, v10, a4);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = [[SXFullscreenImageView alloc] initWithContentView:v8 viewIndex:a4];
  -[SXFullscreenImageView setContentViewFrame:](v21, "setContentViewFrame:", v14, v16, v18, v20);
  [(SXFullscreenImageView *)v21 setDelegate:self];
  double v22 = [(SXFullscreenCanvasController *)self tapGestureRecognizer];
  double v23 = [(SXFullscreenImageView *)v21 doubleTapGestureRecognizer];
  [v22 requireGestureRecognizerToFail:v23];

  double v24 = [(SXFullscreenImageView *)v21 scrollView];
  double v25 = [v24 pinchGestureRecognizer];
  double v26 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];
  [v25 requireGestureRecognizerToFail:v26];

  return v21;
}

- (void)itemizedScrollView:(id)a3 didChangeToActiveViewIndex:(unint64_t)a4
{
  id v12 = [a3 activeView];
  unint64_t v6 = [v12 scrollView];
  [(SXFullscreenCanvasController *)self transferGestureViewToView:v6];

  double v7 = [(SXFullscreenCanvasController *)self captionView];
  -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", a4, [v7 expanded], 1);

  double v8 = [(SXFullscreenCanvasController *)self showable];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(SXFullscreenCanvasController *)self showable];
    double v11 = [(SXFullscreenCanvasController *)self showable];
    [v10 fullScreenCanvasController:self showable:v11 didShowViewWithIndex:a4];
  }
}

- (void)itemizedScrollView:(id)a3 willShowViewWithIndex:(unint64_t)a4
{
  unint64_t v6 = [(SXFullscreenCanvasController *)self showable];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = [(SXFullscreenCanvasController *)self showable];
    double v8 = [(SXFullscreenCanvasController *)self showable];
    [v9 fullScreenCanvasController:self showable:v8 willShowViewWithIndex:a4];
  }
}

- (void)itemizedScrollView:(id)a3 didHideViewWithIndex:(unint64_t)a4
{
  unint64_t v6 = [(SXFullscreenCanvasController *)self showable];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(SXFullscreenCanvasController *)self showable];
    id v9 = [(SXFullscreenCanvasController *)self showable];
    [v8 fullScreenCanvasController:self showable:v9 didHideViewWithIndex:a4];
  }
  id v11 = [(SXFullscreenCanvasController *)self showable];
  double v10 = [(SXFullscreenCanvasController *)self showable];
  [v11 fullScreenCanvasController:self showable:v10 shouldTransferToOriginalViewWithIndex:a4];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(SXFullscreenCanvasController *)self stopSupressingColorSettings];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = [(SXFullscreenCanvasController *)self showable];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(SXFullscreenCanvasController *)self showable];
    double v3 = [(SXFullscreenCanvasController *)self showable];
    int v9 = [v8 fullScreenCanvasController:self showable:v3 gestureRecognizerShouldBegin:v5];

    if (!v9) {
      goto LABEL_49;
    }
  }
  if ([(SXFullscreenCanvasController *)self isFullscreen]
    && ![(SXFullscreenCanvasController *)self totalActiveGestureRecognizers])
  {
    int v35 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    uint64_t v27 = [v35 activeView];

    double v3 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    if ([v3 isDragging])
    {
LABEL_31:

LABEL_40:
      goto LABEL_49;
    }
    double v36 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    char v37 = [v36 isDecelerating];

    if ((v37 & 1) != 0 || v27 && ![v27 allowsDismissal]) {
      goto LABEL_40;
    }
  }
  id v10 = [(SXFullscreenCanvasController *)self tapGestureRecognizer];
  if (v10 == v5)
  {
    BOOL v11 = [(SXFullscreenCanvasController *)self isFullscreen];

    if (v11)
    {
      id v12 = [(SXFullscreenCanvasController *)self tapGestureRecognizer];
      double v13 = [(SXFullscreenCanvasController *)self tapGestureRecognizer];
      double v14 = [v13 view];
      [v12 locationInView:v14];
      CGFloat v16 = v15;
      CGFloat v18 = v17;

      double v19 = [(SXFullscreenCanvasController *)self captionView];
      [v19 frame];
      v72.double x = v16;
      v72.double y = v18;
      if (CGRectContainsPoint(v74, v72))
      {
        char v20 = 0;
      }
      else
      {
        CGFloat v38 = [(SXFullscreenCanvasController *)self navigationBarView];
        [v38 frame];
        v73.double x = v16;
        v73.double y = v18;
        char v20 = !CGRectContainsPoint(v75, v73);
      }
      goto LABEL_50;
    }
  }
  else
  {
  }
  id v21 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];

  if (v21 == v5)
  {
    BOOL v23 = [(SXFullscreenCanvasController *)self isFullscreen];
    if (v23)
    {
      double v3 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];
      [v3 scale];
      if (v24 > 1.0)
      {

        goto LABEL_48;
      }
      if ([(SXFullscreenCanvasController *)self isFullscreen])
      {

        goto LABEL_11;
      }
    }
    else if ([(SXFullscreenCanvasController *)self isFullscreen])
    {
      goto LABEL_11;
    }
    CGFloat v39 = [(SXFullscreenCanvasController *)self pinchGestureRecognizer];
    [v39 scale];
    double v41 = v40;

    if (v23) {
    if (v41 >= 1.0)
    }
      goto LABEL_11;
LABEL_48:
    double v42 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
    [v42 cancel];

    double v43 = [(SXFullscreenCanvasController *)self rotationGestureRecognizer];
    [v43 cancel];

    goto LABEL_49;
  }
LABEL_11:
  id v22 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  if (v22 != v5)
  {

    goto LABEL_26;
  }
  BOOL v25 = [(SXFullscreenCanvasController *)self isFullscreen];

  if (v25)
  {
    double v26 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    uint64_t v27 = [v26 activeView];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    double v28 = objc_msgSend(v27, "scrollView", 0);
    double v3 = [v28 gestureRecognizers];

    uint64_t v29 = [v3 countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v67;
LABEL_19:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v67 != v31) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v66 + 1) + 8 * v32) state]) {
          goto LABEL_31;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v3 countByEnumeratingWithState:&v66 objects:v70 count:16];
          if (v30) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
  }
LABEL_26:
  if ([(SXFullscreenCanvasController *)self verticalSwipingIsActive]) {
    goto LABEL_49;
  }
  id v33 = [(SXFullscreenCanvasController *)self openTapGestureRecognizer];

  if (v33 == v5)
  {
    if (![(SXFullscreenCanvasController *)self isFullscreen])
    {
      char v20 = ![(SXFullscreenCanvasController *)self pinchIsActive];
      goto LABEL_50;
    }
LABEL_49:
    char v20 = 0;
    goto LABEL_50;
  }
  id v34 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  if (v34 != v5)
  {

    goto LABEL_58;
  }
  BOOL v45 = [(SXFullscreenCanvasController *)self isFullscreen];

  if (!v45)
  {
LABEL_58:
    if ([(SXFullscreenCanvasController *)self totalActiveGestureRecognizers])
    {
      char v20 = 1;
    }
    else
    {
      double v58 = [v5 view];
      [v5 locationInView:v58];
      double v60 = v59;
      double v62 = v61;

      int64_t v63 = -[SXFullscreenCanvasController viewIndexForPoint:](self, "viewIndexForPoint:", v60, v62);
      char v20 = v63 != 0x7FFFFFFFFFFFFFFFLL;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v20 = [v5 numberOfTouches] == 2 && v63 != 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    goto LABEL_50;
  }
  double v46 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  uint64_t v47 = [v46 numberOfTouches];

  CGFloat v48 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
  v49 = v48;
  if (v47 == 1)
  {
    double v50 = [(SXFullscreenCanvasController *)self panGestureRecognizer];
    double v51 = [v50 view];
    [v49 translationInView:v51];
    double v53 = v52;
    double v55 = v54;

    double v56 = -v55;
    if (v55 >= 0.0) {
      double v56 = v55;
    }
    double v57 = -v53;
    if (v53 >= 0.0) {
      double v57 = v53;
    }
    char v20 = v56 > v57;
  }
  else
  {
    BOOL v65 = [v48 numberOfTouches] == 2;

    char v20 = v65 | v7;
  }
LABEL_50:

  return v20 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)dragManager:(id)a3 dragableAtLocation:(CGPoint)a4
{
  id v5 = [(SXFullscreenCanvasController *)self itemizedScrollView];
  unint64_t v6 = [v5 activeView];

  if (v6)
  {
    char v7 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    double v8 = [v7 activeView];
    int v9 = [v8 contentView];
  }
  else
  {
    int v9 = 0;
  }
  return v9;
}

- (BOOL)captionView:(id)a3 tapGestureRecognizerShouldBegin:(id)a4
{
  id v5 = a4;
  if ([(SXFullscreenCanvasController *)self isFullscreen])
  {
    unint64_t v6 = [v5 view];
    [v5 locationInView:v6];
    CGFloat v8 = v7;
    CGFloat v10 = v9;

    BOOL v11 = [(SXFullscreenCanvasController *)self captionView];
    [v11 bounds];
    v14.double x = v8;
    v14.double y = v10;
    BOOL v12 = CGRectContainsPoint(v15, v14);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)handleNextCommand
{
  double v3 = [(SXFullscreenCanvasController *)self showable];
  double v4 = [(SXFullscreenCanvasController *)self showable];
  unint64_t v5 = [v3 fullScreenCanvasController:self numberOfViewsForShowable:v4];

  if (v5 >= 2)
  {
    id v6 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v6 scrollToNext];
  }
}

- (void)handlePreviousCommand
{
  double v3 = [(SXFullscreenCanvasController *)self showable];
  double v4 = [(SXFullscreenCanvasController *)self showable];
  unint64_t v5 = [v3 fullScreenCanvasController:self numberOfViewsForShowable:v4];

  if (v5 >= 2)
  {
    id v6 = [(SXFullscreenCanvasController *)self itemizedScrollView];
    [v6 scrollToPrevious];
  }
}

- (void)fullscreenCanvasViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __110__SXFullscreenCanvasController_fullscreenCanvasViewController_willTransitionToSize_withTransitionCoordinator___block_invoke;
  _OWORD v5[3] = &unk_264651130;
  v5[4] = self;
  CGSize v6 = a4;
  [a5 animateAlongsideTransition:v5 completion:0];
}

uint64_t __110__SXFullscreenCanvasController_fullscreenCanvasViewController_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformViewToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (SXFullscreenCanvasShowable)showable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showable);
  return (SXFullscreenCanvasShowable *)WeakRetained;
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void)setIsFullscreen:(BOOL)a3
{
  self->_isFullscreen = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (unint64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (SXFullscreenCaptionViewFactory)captionViewFactory
{
  return self->_captionViewFactory;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return self->_rotationGestureRecognizer;
}

- (UITapGestureRecognizer)openTapGestureRecognizer
{
  return self->_openTapGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)gestureView
{
  return self->_gestureView;
}

- (BOOL)rotationIsActive
{
  return self->_rotationIsActive;
}

- (BOOL)panIsActive
{
  return self->_panIsActive;
}

- (BOOL)pinchIsActive
{
  return self->_pinchIsActive;
}

- (BOOL)verticalSwipingIsActive
{
  return self->_verticalSwipingIsActive;
}

- (BOOL)isStoppingVerticalSwiping
{
  return self->_isStoppingVerticalSwiping;
}

- (unint64_t)totalActiveGestureRecognizers
{
  return self->_totalActiveGestureRecognizers;
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (CGPoint)currentTranslation
{
  double x = self->_currentTranslation.x;
  double y = self->_currentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)startingAnchorPoint
{
  double x = self->_startingAnchorPoint.x;
  double y = self->_startingAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)orientationChangeIsInterupting
{
  return self->_orientationChangeIsInterupting;
}

- (void)setOrientationChangeIsInterupting:(BOOL)a3
{
  self->_orientationChangeIsInterupting = a3;
}

- (BOOL)lessTouchesAreInterupting
{
  return self->_lessTouchesAreInterupting;
}

- (void)setLessTouchesAreInterupting:(BOOL)a3
{
  self->_lessTouchesAreInterupting = a3;
}

- (unint64_t)currentViewIndex
{
  return self->_currentViewIndex;
}

- (void)setCurrentViewIndex:(unint64_t)a3
{
  self->_currentViewIndedouble x = a3;
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (CGRect)currentOriginFrame
{
  double x = self->_currentOriginFrame.origin.x;
  double y = self->_currentOriginFrame.origin.y;
  double width = self->_currentOriginFrame.size.width;
  double height = self->_currentOriginFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentOriginFrame:(CGRect)a3
{
  self->_currentOriginFrame = a3;
}

- (CGRect)currentDestinationFrame
{
  double x = self->_currentDestinationFrame.origin.x;
  double y = self->_currentDestinationFrame.origin.y;
  double width = self->_currentDestinationFrame.size.width;
  double height = self->_currentDestinationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentDestinationFrame:(CGRect)a3
{
  self->_currentDestinationFrame = a3;
}

- (SXFullscreenCanvasViewController)canvasViewController
{
  return self->_canvasViewController;
}

- (void)setCanvasViewController:(id)a3
{
}

- (SXItemizedScrollView)itemizedScrollView
{
  return self->_itemizedScrollView;
}

- (void)setItemizedScrollView:(id)a3
{
}

- (SXFullscreenNavigationBarView)navigationBarView
{
  return self->_navigationBarView;
}

- (void)setNavigationBarView:(id)a3
{
}

- (SXFullscreenCaptionView)captionView
{
  return self->_captionView;
}

- (void)setCaptionView:(id)a3
{
}

- (int)previousExpansionMode
{
  return self->_previousExpansionMode;
}

- (void)setPreviousExpansionMode:(int)a3
{
  self->_uint64_t previousExpansionMode = a3;
}

- (BOOL)isSupressingColorSettings
{
  return self->_isSupressingColorSettings;
}

- (void)setIsSupressingColorSettings:(BOOL)a3
{
  self->_isSupressingColorSettings = a3;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
  objc_storeStrong((id *)&self->_navigationBarView, 0);
  objc_storeStrong((id *)&self->_itemizedScrollView, 0);
  objc_storeStrong((id *)&self->_canvasViewController, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_gestureView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_openTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_captionViewFactory, 0);
  objc_destroyWeak((id *)&self->_showable);
}

@end