@interface THWOverlayableZoomableCanvasController
- (BOOL)allowsPinchZoom;
- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3;
- (BOOL)createViewIfNeededWithFrame:(CGRect)a3;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4;
- (BOOL)interactiveCanvasControllerShouldResampleImages:(id)a3;
- (BOOL)isCanvasInteractive;
- (BOOL)isDragging;
- (BOOL)isScrollEnabled;
- (BOOL)isZoomedOut;
- (BOOL)isZooming;
- (BOOL)rasterize;
- (BOOL)spellCheckingSuppressed;
- (BOOL)zooming;
- (CALayer)alternateLayerForView;
- (CALayer)backgroundLayer;
- (CALayer)containerLayer;
- (CALayer)layer;
- (CGAffineTransform)contentViewTransform;
- (CGAffineTransform)p_containerBoundsToContentBoundsTransform;
- (CGAffineTransform)p_contentBoundsToContainerBoundsTransform;
- (CGAffineTransform)p_contentBoundsToUnscaledTransform;
- (CGAffineTransform)p_contentUnscaledToBoundsTransform;
- (CGPoint)contentOffset;
- (CGPoint)p_clampContentOffset:(CGPoint)a3 forViewScale:(double)a4;
- (CGPoint)scaledContainerPointFromUnscaledContentPoint:(CGPoint)a3;
- (CGPoint)unscaledContainerPointFromUnscaledContentPoint:(CGPoint)a3;
- (CGRect)contentViewFrame;
- (CGRect)frame;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4;
- (CGRect)scaledContentRectFromUnscaledContainerRect:(CGRect)a3;
- (CGRect)targetVisibleRect;
- (CGRect)unscaledContentRectFromUnscaledContainerRect:(CGRect)a3;
- (THWClippingLayerHost)containerClippingLayerHost;
- (THWClippingLayerHost)contentClippingLayerHost;
- (THWOverlayableZoomableBackgroundView)backgroundView;
- (THWOverlayableZoomableCanvasController)init;
- (THWOverlayableZoomableCanvasController)initWithFrame:(CGRect)a3 documentRoot:(id)a4 delegate:(id)a5;
- (THWOverlayableZoomableCanvasControllerDelegate)delegate;
- (TSDInteractiveCanvasController)scrollContainerICC;
- (TSDInteractiveCanvasController)scrollContentICC;
- (TSKDocumentRoot)documentRoot;
- (TSKScrollView)scrollView;
- (UIEdgeInsets)contentInset;
- (UIView)containerView;
- (UIView)view;
- (UIViewController)containerViewController;
- (UIViewController)viewController;
- (id)additionalGestureTargetsForInteractiveCanvasController:(id)a3 gesture:(id)a4;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4;
- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)visibleBoundsClipViewForInteractiveCanvasController:(id)a3;
- (void)dealloc;
- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4;
- (void)interactiveCanvasController:(id)a3 layoutUnregistered:(id)a4;
- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4;
- (void)interactiveCanvasController:(id)a3 willLayoutRep:(id)a4;
- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)interactiveCanvasControllerDidZoom:(id)a3;
- (void)interactiveCanvasControllerWillZoom:(id)a3;
- (void)invalidateLayers;
- (void)p_rebuild;
- (void)p_setViewScale:(double)a3 contentOffset:(CGPoint)a4 completion:(id)a5;
- (void)p_updateContainerInfosToDisplay;
- (void)p_updateContentInfosToDisplay;
- (void)p_updateInfosToDisplay:(id)a3 forICC:(id)a4;
- (void)p_updateRasterizeOnLayer;
- (void)p_updateScrollViewWithDelegate;
- (void)p_updateSubviewsOrLayers;
- (void)p_updateWithDelegate;
- (void)screenScaleDidChange;
- (void)setAllowsPinchZoom:(BOOL)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContainerLayer:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setNaturalFrame:(CGRect)a3 scale:(double)a4;
- (void)setRasterize:(BOOL)a3;
- (void)setScrollContainerICC:(id)a3;
- (void)setScrollContentICC:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setTargetVisibleRect:(CGRect)a3;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animationDuration:(double)a5 completion:(id)a6;
- (void)setZooming:(BOOL)a3;
- (void)setupImmediatePressGesture;
- (void)teardownController;
- (void)teardownView;
- (void)updateContainerInfosToDisplay;
@end

@implementation THWOverlayableZoomableCanvasController

- (UIView)view
{
  return self->_containerView;
}

- (UIViewController)viewController
{
  return self->_containerViewController;
}

- (CALayer)alternateLayerForView
{
  if (self->_containerView) {
    return 0;
  }
  else {
    return self->_containerLayer;
  }
}

- (CALayer)layer
{
  containerView = self->_containerView;
  if (containerView) {
    return [(UIView *)containerView layer];
  }
  else {
    return self->_containerLayer;
  }
}

- (UIEdgeInsets)contentInset
{
  v2 = [(THWOverlayableZoomableCanvasController *)self scrollView];

  [(TSKScrollView *)v2 contentInset];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v7 = [(THWOverlayableZoomableCanvasController *)self scrollView];

  -[TSKScrollView setContentInset:](v7, "setContentInset:", top, left, bottom, right);
}

- (CGPoint)contentOffset
{
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] contentOffset];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] viewScale];

  TSDMultiplyPointScalar();
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)contentViewFrame
{
  id v2 = [(TSDCanvasLayerHosting *)self->mScrollContentLayerHost canvasView];

  [v2 frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGAffineTransform)contentViewTransform
{
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] viewScale];

  return CGAffineTransformMakeScale(retstr, v4, v4);
}

- (BOOL)isScrollEnabled
{
  id v2 = [(THWOverlayableZoomableCanvasController *)self scrollView];

  return [(TSKScrollView *)v2 isScrollEnabled];
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v4 = [(THWOverlayableZoomableCanvasController *)self scrollView];

  [(TSKScrollView *)v4 setScrollEnabled:v3];
}

- (THWOverlayableZoomableCanvasController)init
{
  return -[THWOverlayableZoomableCanvasController initWithFrame:documentRoot:delegate:](self, "initWithFrame:documentRoot:delegate:", 0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (THWOverlayableZoomableCanvasController)initWithFrame:(CGRect)a3 documentRoot:(id)a4 delegate:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)THWOverlayableZoomableCanvasController;
  v7 = [(THWOverlayableZoomableCanvasController *)&v15 init];
  v8 = v7;
  if (v7)
  {
    -[THWOverlayableZoomableCanvasController setTargetVisibleRect:](v7, "setTargetVisibleRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v8->mUniformScale = _Q0;
    v8->_documentRoot = (TSKDocumentRoot *)a4;
    v8->_delegate = (THWOverlayableZoomableCanvasControllerDelegate *)a5;
  }
  return v8;
}

- (void)dealloc
{
  self->mScrollContainerLayerHost = 0;
  [(TSDInteractiveCanvasController *)self->mScrollContainerICC setDelegate:0];

  self->mScrollContainerICC = 0;
  self->mScrollContentLayerHost = 0;
  [(TSDInteractiveCanvasController *)self->mScrollContentICC setDelegate:0];

  self->mScrollContentICC = 0;
  self->mScrollView = 0;

  self->_documentRoot = 0;
  self->mContainerClippingLayerHost = 0;

  self->mContentClippingLayerHost = 0;
  self->_backgroundView = 0;

  self->_backgroundLayer = 0;
  self->_containerView = 0;

  self->_containerViewController = 0;
  self->_containerLayer = 0;

  self->mChildViewControllers = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWOverlayableZoomableCanvasController;
  [(THWOverlayableZoomableCanvasController *)&v3 dealloc];
}

- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3
{
  p_mScrollContainerICC = &self->mScrollContainerICC;
  if (self->mScrollContainerICC) {
    return 0;
  }
  p_mContainerClippingLayerHost = &self->mContainerClippingLayerHost;
  if (self->mContainerClippingLayerHost
    || self->mScrollContentICC
    || self->mContentClippingLayerHost
    || self->_containerLayer)
  {
    return 0;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
  self->_containerLayer = v12;
  -[CALayer setFrame:](v12, "setFrame:", x, y, width, height);
  BOOL v6 = 1;
  [(CALayer *)self->_containerLayer setMasksToBounds:1];
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)p_mScrollContainerICC, p_mContainerClippingLayerHost, 0);
  [(TSDInteractiveCanvasController *)self->mScrollContainerICC setNestedCanvasAllowLayoutAndRenderOnThread:1];
  [(TSDInteractiveCanvasController *)self->mScrollContainerICC setCreateRepsForOffscreenLayouts:1];
  mContainerClippingLayerHost = self->mContainerClippingLayerHost;
  TSDRectWithSize();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  -[THWClippingLayerHost setFrame:](mContainerClippingLayerHost, "setFrame:");
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->mScrollContentICC, &self->mContentClippingLayerHost, 0);
  [(TSDInteractiveCanvasController *)self->mScrollContentICC setNestedCanvasAllowLayoutAndRenderOnThread:1];
  [(TSDInteractiveCanvasController *)self->mScrollContentICC setCreateRepsForOffscreenLayouts:1];
  -[THWClippingLayerHost setFrame:](self->mContentClippingLayerHost, "setFrame:", v15, v17, v19, v21);
  [(CALayer *)[(THWClippingLayerHost *)self->mContentClippingLayerHost clippingLayer] setMasksToBounds:0];
  id v22 = [(TSDInteractiveCanvasController *)self->mScrollContainerICC canvas];
  [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] overlayableZoomableCanvasControllerContentsScale:self];
  [v22 i_setContentsScale:];
  id v23 = [(TSDInteractiveCanvasController *)self->mScrollContentICC canvas];
  [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] overlayableZoomableCanvasControllerContentsScale:self];
  [v23 i_setContentsScale:];
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](self, "setNaturalFrame:scale:", x, y, width, height, 1.0);
  [(THWOverlayableZoomableCanvasController *)self p_updateRasterizeOnLayer];
  [(THWOverlayableZoomableCanvasController *)self p_updateSubviewsOrLayers];
  return v6;
}

- (void)p_updateSubviewsOrLayers
{
  if (self->_containerView)
  {
    mScrollView = self->mScrollView;
    v32[0] = self->_backgroundView;
    v32[1] = mScrollView;
    v32[2] = [(TSDInteractiveCanvasController *)self->mScrollContainerICC canvasView];
    CGFloat v4 = +[NSArray arrayWithObjects:v32 count:3];
    id v5 = [(NSArray *)[(UIView *)self->_containerView subviews] copy];
    if (![(NSArray *)v4 isEqualToArray:v5])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v25;
        do
        {
          v9 = 0;
          do
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * (void)v9) removeFromSuperview];
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v7);
      }
      mChildViewControllers = self->mChildViewControllers;
      if (mChildViewControllers)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = [(NSMutableArray *)mChildViewControllers countByEnumeratingWithState:&v20 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            double v14 = 0;
            do
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(mChildViewControllers);
              }
              [*(id *)(*((void *)&v20 + 1) + 8 * (void)v14) removeFromParentViewController];
              double v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [(NSMutableArray *)mChildViewControllers countByEnumeratingWithState:&v20 objects:v30 count:16];
          }
          while (v12);
        }
        [(NSMutableArray *)self->mChildViewControllers removeAllObjects];
      }
      else
      {
        self->mChildViewControllers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      }
      id v16 = [(TSDCanvasLayerHosting *)self->mScrollContentLayerHost viewController];
      if (v16)
      {
        id v17 = v16;
        [(UIViewController *)self->_containerViewController addChildViewController:v16];
        [(NSMutableArray *)self->mChildViewControllers addObject:v17];
      }
      id v18 = [(TSDCanvasLayerHosting *)self->mScrollContainerLayerHost viewController];
      if (v18)
      {
        id v19 = v18;
        [(UIViewController *)self->_containerViewController addChildViewController:v18];
        [(NSMutableArray *)self->mChildViewControllers addObject:v19];
      }
      [(UIView *)self->_containerView addSubview:self->_backgroundView];
      [(UIView *)self->_containerView addSubview:self->mScrollView];
      [(UIView *)self->_containerView addSubview:[(TSDInteractiveCanvasController *)self->mScrollContainerICC canvasView]];
    }
  }
  else if (self->_containerLayer && self->_backgroundLayer)
  {
    v29[0] = [(THWClippingLayerHost *)self->mContentClippingLayerHost layer];
    v29[1] = [(THWClippingLayerHost *)self->mContainerClippingLayerHost layer];
    double v15 = +[NSArray arrayWithObjects:v29 count:2];
    if (self->_backgroundLayer)
    {
      backgroundLayer = self->_backgroundLayer;
      double v15 = [+[NSArray arrayWithObjects:&backgroundLayer count:1] arrayByAddingObjectsFromArray:v15];
    }
    if (![(NSArray *)v15 isEqualToArray:[(CALayer *)self->_containerLayer sublayers]]) {
      [(CALayer *)self->_containerLayer setSublayers:v15];
    }
  }
}

- (void)screenScaleDidChange
{
  id v3 = [(TSDInteractiveCanvasController *)self->mScrollContainerICC canvas];
  [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] overlayableZoomableCanvasControllerContentsScale:self];
  [v3 i_setContentsScale:];
  id v4 = [(TSDInteractiveCanvasController *)self->mScrollContentICC canvas];
  [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] overlayableZoomableCanvasControllerContentsScale:self];
  [v4 i_setContentsScale:];
  double height = self->mNaturalFrame.size.height;
  double mUniformScale = self->mUniformScale;
  double x = self->mNaturalFrame.origin.x;
  double y = self->mNaturalFrame.origin.y;
  double width = self->mNaturalFrame.size.width;

  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](self, "setNaturalFrame:scale:", x, y, width, height, mUniformScale);
}

- (void)p_updateRasterizeOnLayer
{
  mContainerClippingLayerHost = self->mContainerClippingLayerHost;
  if (mContainerClippingLayerHost) {
    id v4 = [(THWClippingLayerHost *)mContainerClippingLayerHost clippingLayer];
  }
  else {
    id v4 = [(UIView *)[(THWOverlayableZoomableCanvasController *)self view] layer];
  }
  id v5 = v4;
  [self->mScrollContainerICC canvas]->contentsScale;
  -[CALayer setRasterizationScale:](v5, "setRasterizationScale:");
  [(CALayer *)v5 setShouldRasterize:self->_rasterize];
  BOOL rasterize = self->_rasterize;

  [(CALayer *)v5 spi_setPreloadsCache:rasterize];
}

- (void)setRasterize:(BOOL)a3
{
  if (self->_rasterize != a3)
  {
    self->_BOOL rasterize = a3;
    [(THWOverlayableZoomableCanvasController *)self p_updateRasterizeOnLayer];
  }
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3
{
  p_mScrollContainerLayerHost = &self->mScrollContainerLayerHost;
  if (self->mScrollContainerLayerHost) {
    return 0;
  }
  p_mScrollContentLayerHost = &self->mScrollContentLayerHost;
  if (self->mScrollContentLayerHost) {
    return 0;
  }
  if (self->_containerView) {
    return 0;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(THWOverlayableZoomableCanvasControllerDelegate *)self->_delegate overlayableZoomableCanvasControllerDeferViewCreation:self])return 0; {
  id v11 = [objc_alloc((Class)UIView) initWithFrame:x, y, width, height];
  }
  self->_containerView = v11;
  [(UIView *)v11 setClipsToBounds:1];
  id v12 = (UIViewController *)objc_alloc_init((Class)UIViewController);
  self->_containerViewController = v12;
  [(UIViewController *)v12 setView:self->_containerView];
  uint64_t v13 = objc_opt_class();
  THCanvasCreateWithClass(self, (id *)&self->mScrollContainerICC, p_mScrollContainerLayerHost, v13, 0);
  [(TSDInteractiveCanvasController *)self->mScrollContainerICC disableAllGestures];
  [self->mScrollContainerLayerHost canvasLayer setName:@"scrollContainerCanvas"];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContainerICC] setNestedCanvasAllowLayoutAndRenderOnThread:0];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContainerICC] setAllowLayoutAndRenderOnThread:1];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContainerICC] setCreateRepsForOffscreenLayouts:1];
  mContainerClippingLayerHost = self->mContainerClippingLayerHost;
  if (mContainerClippingLayerHost)
  {
    [(THWClippingLayerHost *)mContainerClippingLayerHost setInteractiveCanvasController:0];
    [(THWClippingLayerHost *)self->mContainerClippingLayerHost teardownAndTransferCanvasLayersToHost:self->mScrollContainerLayerHost];

    self->mContainerClippingLayerHost = 0;
  }
  double v15 = objc_opt_class();
  id v16 = objc_opt_class();
  THCanvasAndScrollViewCreateWithClass(self, (id *)&self->mScrollContentICC, (id *)p_mScrollContentLayerHost, &self->mScrollView, v15, 0, v16);
  [(TSDInteractiveCanvasController *)self->mScrollContentICC disableAllGestures];
  objc_msgSend(objc_msgSend(-[TSDCanvasLayerHosting canvasView](self->mScrollContentLayerHost, "canvasView"), "layer"), "setName:", @"scrollContentCanvas");
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->mScrollContentICC, "canvasView"), "layer"), "setMasksToBounds:", 0);
  [(THWOverlayableZoomableCanvasController *)self p_updateScrollViewWithDelegate];
  [(TSKScrollView *)[(THWOverlayableZoomableCanvasController *)self scrollView] hideScrollIndicators];
  [(-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView")) layer setName:@"scrollView"];
  [(TSKScrollView *)[(THWOverlayableZoomableCanvasController *)self scrollView] setBackgroundColor:+[UIColor clearColor]];
  [(TSKScrollView *)[(THWOverlayableZoomableCanvasController *)self scrollView] setDecelerationRate:UIScrollViewDecelerationRateFast];
  [(TSKScrollView *)[(THWOverlayableZoomableCanvasController *)self scrollView] setClipsToBounds:0];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] setNestedCanvasAllowLayoutAndRenderOnThread:0];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] setAllowLayoutAndRenderOnThread:1];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] setCreateRepsForOffscreenLayouts:1];
  mContentClippingLayerHost = self->mContentClippingLayerHost;
  if (mContentClippingLayerHost)
  {
    [(THWClippingLayerHost *)mContentClippingLayerHost setInteractiveCanvasController:0];
    [(THWClippingLayerHost *)self->mContentClippingLayerHost teardownAndTransferCanvasLayersToHost:self->mScrollContentLayerHost];

    self->mContentClippingLayerHost = 0;
  }

  self->_containerLayer = 0;
  CGSize size = CGRectNull.size;
  self->mNaturalFrame.origin = CGRectNull.origin;
  self->mNaturalFrame.CGSize size = size;
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](self, "setNaturalFrame:scale:", x, y, width, height, 1.0);
  [(THWOverlayableZoomableCanvasController *)self p_updateRasterizeOnLayer];
  id v19 = [THWOverlayableZoomableBackgroundView alloc];
  TSDRectWithSize();
  long long v20 = -[THWOverlayableZoomableBackgroundView initWithFrame:](v19, "initWithFrame:");
  self->_backgroundView = v20;
  [(THLayerContainingView *)v20 setAllowLayerDelegate:1];
  if (self->_backgroundLayer) {
    -[THLayerContainingView addSublayer:](self->_backgroundView, "addSublayer:");
  }
  [(THWOverlayableZoomableCanvasController *)self p_updateSubviewsOrLayers];
  return 1;
}

- (void)setNaturalFrame:(CGRect)a3 scale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self->_containerView)
  {
    memset(&v52, 0, sizeof(v52));
    CGAffineTransformMakeScale(&v52, a4, a4);
    CGAffineTransform v51 = v52;
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    CGRectApplyAffineTransform(v53, &v51);
    double v49 = a4;
    double v10 = width;
    [self->mScrollContainerICC->canvas contentsScale];
    TSDRoundedRectForScale();
    double v50 = v11;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.double width = v10;
    v56.size.double height = height;
    if (!CGRectEqualToRect(self->mNaturalFrame, v56)
      || (double mUniformScale = self->mUniformScale, mUniformScale != v49)
      && vabdd_f64(mUniformScale, v49) >= fabs(v49 * 0.000000999999997)
      || (([(UIView *)self->_containerView frame], v50 == v20) ? (BOOL v21 = v13 == v19) : (BOOL v21 = 0), !v21))
    {
      if ([-[TSDInteractiveCanvasController animatingViewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "animatingViewScale"]]) {
      +[CATransaction begin];
      }
      self->mNaturalFrame.origin.CGFloat x = x;
      self->mNaturalFrame.origin.CGFloat y = y;
      self->mNaturalFrame.size.double width = v10;
      self->mNaturalFrame.size.double height = height;
      self->double mUniformScale = v49;
      -[UIView setFrame:](self->_containerView, "setFrame:", v50, v13, v15, v17);
      TSDRectWithSize();
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      -[THWOverlayableZoomableBackgroundView setFrame:](self->_backgroundView, "setFrame:");
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "layerHost"), "canvasLayer"), "setUnscaledSize:", v10, height);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContainerICC](self, "scrollContainerICC"), "layerHost"), "canvasLayer"), "setViewScale:", v49);
      [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] contentOffset];
      double v31 = v30;
      double v33 = v32;
      -[TSKScrollView setFrame:]([(THWOverlayableZoomableCanvasController *)self scrollView], "setFrame:", v23, v25, v27, v29);
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "canvasLayer"), "setViewScale:", self->mUniformScale * self->mContentScale);
      -[TSDInteractiveCanvasController setContentOffset:animated:]([(THWOverlayableZoomableCanvasController *)self scrollContentICC], "setContentOffset:animated:", 0, v31, v33);
      [(THWOverlayableZoomableCanvasController *)self p_rebuild];
LABEL_19:
      +[CATransaction commit];
    }
  }
  else if (self->mContainerClippingLayerHost)
  {
    if (!CGRectEqualToRect(self->mNaturalFrame, a3)
      || (double v34 = self->mUniformScale, v34 != a4) && vabdd_f64(v34, a4) >= fabs(a4 * 0.000000999999997))
    {
      if ([-[TSDInteractiveCanvasController animatingViewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "animatingViewScale"]) {
      +[CATransaction begin];
      }
      self->mNaturalFrame.origin.CGFloat x = x;
      self->mNaturalFrame.origin.CGFloat y = y;
      self->mNaturalFrame.size.double width = width;
      self->mNaturalFrame.size.double height = height;
      self->double mUniformScale = a4;
      memset(&v52, 0, sizeof(v52));
      CGAffineTransformMakeScale(&v52, a4, a4);
      CGAffineTransform v51 = v52;
      v54.origin.CGFloat x = x;
      v54.origin.CGFloat y = y;
      v54.size.double width = width;
      v54.size.double height = height;
      CGRect v55 = CGRectApplyAffineTransform(v54, &v51);
      double v35 = width;
      -[CALayer setFrame:](self->_containerLayer, "setFrame:", v55.origin.x, v55.origin.y);
      -[TSDCanvasLayer setUnscaledSize:]([(THWClippingLayerHost *)self->mContainerClippingLayerHost canvasLayer], "setUnscaledSize:", width, height);
      [(TSDCanvasLayer *)[(THWClippingLayerHost *)self->mContainerClippingLayerHost canvasLayer] setViewScale:a4];
      TSDRectWithSize();
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      -[CALayer setFrame:]([(THWClippingLayerHost *)self->mContainerClippingLayerHost clippingLayer], "setFrame:", v36, v38, v40, v42);
      mScrollContentICC = self->mScrollContentICC;
      [(THWClippingLayerHost *)self->mContentClippingLayerHost contentOffset];
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mScrollContentICC, "convertBoundsToUnscaledPoint:");
      double v46 = v45;
      double v48 = v47;
      -[TSDCanvasLayer setUnscaledSize:]([(THWClippingLayerHost *)self->mContentClippingLayerHost canvasLayer], "setUnscaledSize:", v35, height);
      [(TSDCanvasLayer *)[(THWClippingLayerHost *)self->mContentClippingLayerHost canvasLayer] setViewScale:self->mUniformScale * self->mContentScale];
      -[CALayer setFrame:]([(THWClippingLayerHost *)self->mContentClippingLayerHost clippingLayer], "setFrame:", v37, v39, v41, v43);
      -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self->mScrollContentICC, "convertUnscaledToBoundsPoint:", v46, v48);
      -[THWClippingLayerHost setContentOffset:](self->mContentClippingLayerHost, "setContentOffset:");
      [(THWOverlayableZoomableCanvasController *)self p_rebuild];
      goto LABEL_19;
    }
  }
}

- (void)p_setViewScale:(double)a3 contentOffset:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v10 = [(THWOverlayableZoomableCanvasController *)self contentClippingLayerHost];
  [(CALayer *)[(THWClippingLayerHost *)v10 clippingLayer] bounds];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] setViewScale:a3];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:]([(THWOverlayableZoomableCanvasController *)self scrollContentICC], "convertUnscaledToBoundsPoint:", x, y);
  TSDRectWithOriginAndSize();
  -[CALayer setBounds:]([(THWClippingLayerHost *)v10 clippingLayer], "setBounds:", v11, v12, v13, v14);
  if (a5)
  {
    double v15 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v15(a5, 1);
  }
}

- (CGPoint)p_clampContentOffset:(CGPoint)a3 forViewScale:(double)a4
{
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "clippingLayer"), "bounds");
  TSDMultiplySizeScalar();
  id v6 = [(THWOverlayableZoomableCanvasController *)self delegate];
  TSDRectWithOriginAndSize();
  -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:contentInsetsForViewScale:viewportBounds:](v6, "overlayableZoomableCanvasController:contentInsetsForViewScale:viewportBounds:", self, a4, v7, v8, v9, v10);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "canvasLayer"), "unscaledSize");
  TSDMultiplySizeScalar();
  TSUClamp();
  double v12 = v11;
  TSUClamp();
  double v14 = v13;
  double v15 = v12;
  result.double y = v14;
  result.double x = v15;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animationDuration:(double)a5 completion:(id)a6
{
  self->mContentScale = a3;
  double v9 = self->mUniformScale * a3;
  -[THWOverlayableZoomableCanvasController p_clampContentOffset:forViewScale:](self, "p_clampContentOffset:forViewScale:", a4.x, a4.y, a3);
  TSDMultiplyPointScalar();
  if (self->mScrollView) {
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:forceAnimation:completion:]([(THWOverlayableZoomableCanvasController *)self scrollContentICC], "setViewScale:contentOffset:clampOffset:animationDuration:forceAnimation:completion:", 0, a5 > 0.0, a6, v9, v10, v11, a5);
  }
  else {
    -[THWOverlayableZoomableCanvasController p_setViewScale:contentOffset:completion:](self, "p_setViewScale:contentOffset:completion:", a6, v9, v10, v11);
  }
  self->mAnimatingToViewScale = v9;
  TSDMultiplyPointScalar();
  self->mAnimatingToContentOffset.double x = v12;
  self->mAnimatingToContentOffset.double y = v13;
}

- (CGRect)frame
{
  id v2 = [(THWOverlayableZoomableCanvasController *)self view];

  [(UIView *)v2 frame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWOverlayableZoomableCanvasControllerDelegate *)a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  double v5 = sub_1902E0;
  double v6 = &unk_456DE0;
  double v7 = self;
  if (+[NSThread isMainThread])
  {
    v5((uint64_t)v4);
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1902E8;
    v3[3] = &unk_457868;
    v3[4] = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (void)p_updateScrollViewWithDelegate
{
  if (self->_delegate && self->mScrollView)
  {
    if (objc_opt_respondsToSelector()) {
      [(THScrollView *)self->mScrollView setMayPassScrollEventsToNextResponder:[(THWOverlayableZoomableCanvasControllerDelegate *)self->_delegate overlayableZoomableCanvasController:self shouldDisableScrollingAtContentEdgesForScrollView:self->mScrollView]];
    }
    if (objc_opt_respondsToSelector())
    {
      id v3 = [(THWOverlayableZoomableCanvasControllerDelegate *)self->_delegate overlayableZoomableCanvasController:self shouldDisableScrollingWhenCursorIsHiddenForScrollView:self->mScrollView];
      mScrollView = self->mScrollView;
      [(THScrollView *)mScrollView setShouldDisableScrollingWhenCursorIsHidden:v3];
    }
  }
}

- (void)p_updateWithDelegate
{
  if (self->_delegate)
  {
    [(THWOverlayableZoomableCanvasController *)self p_updateScrollViewWithDelegate];
    [(THWOverlayableZoomableCanvasController *)self p_rebuild];
  }
}

- (void)teardownController
{
  [(TSDInteractiveCanvasController *)self->mScrollContainerICC teardown];
  [(TSDInteractiveCanvasController *)self->mScrollContentICC teardown];
  [(THWClippingLayerHost *)self->mContainerClippingLayerHost teardown];
  mContentClippingLayerHost = self->mContentClippingLayerHost;

  [(THWClippingLayerHost *)mContentClippingLayerHost teardown];
}

- (void)teardownView
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mChildViewControllers = self->mChildViewControllers;
  id v4 = [(NSMutableArray *)mChildViewControllers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mChildViewControllers);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) removeFromParentViewController];
      }
      id v5 = [(NSMutableArray *)mChildViewControllers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->mChildViewControllers = 0;
  [(TSKScrollView *)[(THWOverlayableZoomableCanvasController *)self scrollView] setDelegate:0];
  [(TSDCanvasLayerHosting *)self->mScrollContentLayerHost teardown];
  [(TSDCanvasLayerHosting *)self->mScrollContainerLayerHost teardown];

  self->_documentRoot = 0;
}

- (void)invalidateLayers
{
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContainerICC] invalidateLayers];
  id v3 = [(THWOverlayableZoomableCanvasController *)self scrollContentICC];

  [(TSDInteractiveCanvasController *)v3 invalidateLayers];
}

- (void)p_updateInfosToDisplay:(id)a3 forICC:(id)a4
{
  id v6 = [a4 infosToDisplay];
  id v7 = [a3 count];
  if (v7 == [v6 count])
  {
    id v8 = [a3 count];
    if (!v8) {
      return;
    }
    id v9 = v8;
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = [a3 objectAtIndexedSubscript:v10];
      if (v11 != [v6 objectAtIndexedSubscript:v10]) {
        break;
      }
      if (v9 == (id)++v10) {
        return;
      }
    }
  }

  [a4 setInfosToDisplay:a3];
}

- (void)p_updateContentInfosToDisplay
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [(THWOverlayableZoomableCanvasController *)self delegate];
  if (v7)
  {
    id v8 = [(THWOverlayableZoomableCanvasController *)self scrollView];
    if (v8)
    {
      [(TSKScrollView *)v8 tsk_bounds];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(THWOverlayableZoomableCanvasController *)self targetVisibleRect];
      v26.origin.double x = v17;
      v26.origin.double y = v18;
      v26.size.double width = v19;
      v26.size.double height = v20;
      v24.origin.double x = v10;
      v24.origin.double y = v12;
      v24.size.double width = v14;
      v24.size.double height = v16;
      CGRect v25 = CGRectUnion(v24, v26);
      double x = v25.origin.x;
      double y = v25.origin.y;
      double width = v25.size.width;
      double height = v25.size.height;
    }
  }
  id v21 = -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:infosToDisplayForContentViewport:](v7, "overlayableZoomableCanvasController:infosToDisplayForContentViewport:", self, x, y, width, height);
  double v22 = [(THWOverlayableZoomableCanvasController *)self scrollContentICC];

  [(THWOverlayableZoomableCanvasController *)self p_updateInfosToDisplay:v21 forICC:v22];
}

- (void)p_updateContainerInfosToDisplay
{
  id v3 = [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] infosToDisplayForContainerInOverlayableZoomableCanvasController:self];
  id v4 = [(THWOverlayableZoomableCanvasController *)self scrollContainerICC];

  [(THWOverlayableZoomableCanvasController *)self p_updateInfosToDisplay:v3 forICC:v4];
}

- (void)p_rebuild
{
  if (self->_delegate)
  {
    id v3 = [(THWOverlayableZoomableCanvasController *)self scrollContentICC];
    id v4 = [(THWOverlayableZoomableCanvasController *)self delegate];
    if (v4)
    {
      [(THWOverlayableZoomableCanvasControllerDelegate *)v4 sizeOfContentCanvasForOverlayableZoomableCanvasController:self];
      double v6 = v5;
      double v8 = v7;
    }
    else
    {
      [(THWOverlayableZoomableCanvasController *)self frame];
      double v6 = v9;
      double v8 = v10;
    }
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](v3, "layerHost"), "canvasLayer"), "setUnscaledSize:", v6, v8);
    [(THWOverlayableZoomableCanvasController *)self p_updateContentInfosToDisplay];
    [(THWOverlayableZoomableCanvasController *)self p_updateContainerInfosToDisplay];
  }
}

- (void)setAllowsPinchZoom:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TSDCanvasLayerHosting *)self->mScrollContentLayerHost canvasLayer];

  [v4 setAllowsPinchZoom:v3];
}

- (BOOL)allowsPinchZoom
{
  id v2 = [(TSDCanvasLayerHosting *)self->mScrollContentLayerHost canvasLayer];

  return [v2 allowsPinchZoom];
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  -[THWOverlayableZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0
    && [(THWOverlayableZoomableCanvasController *)self scrollContentICC] == a3)
  {
    [(THWOverlayableZoomableCanvasController *)self p_updateContentInfosToDisplay];
  }
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4) {
    -[THWOverlayableZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  [(THWOverlayableZoomableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] overlayableZoomableCanvasController:self interactiveCanvasControllerDidScroll:a3];
  }
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0
    && [(THWOverlayableZoomableCanvasController *)self scrollContentICC] == a3)
  {
    [(THWOverlayableZoomableCanvasController *)self p_updateContentInfosToDisplay];
  }
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];

  return [(THWOverlayableZoomableCanvasControllerDelegate *)v6 overlayableZoomableCanvasController:self geometryProviderForLayout:a4];
}

- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4
{
  if ([(THWOverlayableZoomableCanvasController *)self scrollContainerICC] == a3)
  {
    [(THWOverlayableZoomableCanvasController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];
      [(THWOverlayableZoomableCanvasControllerDelegate *)v6 overlayableZoomableCanvasController:self registeredLayoutInContainerICC:a4];
    }
  }
}

- (void)interactiveCanvasController:(id)a3 layoutUnregistered:(id)a4
{
  if ([(THWOverlayableZoomableCanvasController *)self scrollContainerICC] == a3)
  {
    [(THWOverlayableZoomableCanvasController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];
      [(THWOverlayableZoomableCanvasControllerDelegate *)v6 overlayableZoomableCanvasController:self unregisteredLayoutInContainerICC:a4];
    }
  }
}

- (void)interactiveCanvasController:(id)a3 willLayoutRep:(id)a4
{
  [(THWOverlayableZoomableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];
    [(THWOverlayableZoomableCanvasControllerDelegate *)v6 overlayableZoomableCanvasController:self willLayoutRep:a4];
  }
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];
  if ([(THWOverlayableZoomableCanvasControllerDelegate *)v6 conformsToProtocol:a4])return v6; {
  else
  }
    return 0;
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
  {
    if ([(THWOverlayableZoomableCanvasController *)self scrollContentICC] == a3)
    {
      [(THWOverlayableZoomableCanvasController *)self p_updateContentInfosToDisplay];
    }
    else
    {
      [(THWOverlayableZoomableCanvasController *)self p_updateContainerInfosToDisplay];
    }
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  if (self->mScrollContainerICC == a3)
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  else
  {
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:expandBoundsForHitTesting:]([(THWOverlayableZoomableCanvasController *)self delegate], "overlayableZoomableCanvasController:expandBoundsForHitTesting:", self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];

  return [(THWOverlayableZoomableCanvasControllerDelegate *)v6 overlayableZoomableCanvasController:self primaryTargetForGesture:a4];
}

- (void)interactiveCanvasControllerWillZoom:(id)a3
{
  [(THWOverlayableZoomableCanvasController *)self setZooming:1];
  double v5 = [(THWOverlayableZoomableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [a3 viewScale];
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:willZoomAtScale:](v5, "overlayableZoomableCanvasController:willZoomAtScale:", self);
  }
}

- (void)interactiveCanvasControllerDidZoom:(id)a3
{
  double v5 = [(THWOverlayableZoomableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [a3 viewScale];
    -[THWOverlayableZoomableCanvasControllerDelegate overlayableZoomableCanvasController:didEndZoomingAtScale:](v5, "overlayableZoomableCanvasController:didEndZoomingAtScale:", self);
  }

  [(THWOverlayableZoomableCanvasController *)self setZooming:0];
}

- (BOOL)interactiveCanvasControllerShouldResampleImages:(id)a3
{
  id v4 = [(THWOverlayableZoomableCanvasController *)self delegate];

  return [(THWOverlayableZoomableCanvasControllerDelegate *)v4 overlayableZoomableCanvasControllerShouldResampleImages:self];
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];

  return [(THWOverlayableZoomableCanvasControllerDelegate *)v6 overlayableZoomableCanvasController:self allowsEditMenuForRep:a4];
}

- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  if (objc_opt_respondsToSelector()) {
    [(THWOverlayableZoomableCanvasControllerDelegate *)[(THWOverlayableZoomableCanvasController *)self delegate] overlayableZoomableCanvasController:self canvasViewShouldBecomeFirstResponder:a4];
  }
  return 0;
}

- (id)visibleBoundsClipViewForInteractiveCanvasController:(id)a3
{
  return self->_containerView;
}

- (id)additionalGestureTargetsForInteractiveCanvasController:(id)a3 gesture:(id)a4
{
  [(THWOverlayableZoomableCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v6 = [(THWOverlayableZoomableCanvasController *)self delegate];

  return [(THWOverlayableZoomableCanvasControllerDelegate *)v6 additionalGestureTargetsForZoomableCanvasController:self gesture:a4];
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (void)setupImmediatePressGesture
{
  BOOL v3 = [(THWOverlayableZoomableCanvasController *)self scrollContentICC];
  uint64_t v4 = TSWPImmediatePress;
  uint64_t v6 = TSWPImmediatePress;
  [(TSDInteractiveCanvasController *)v3 enableGestureKinds:+[NSArray arrayWithObjects:&v6 count:1]];
  id v5 = [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] gestureDispatcher];
  objc_opt_class();
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] gestureWithKind:v4];
  [v5 allowSimultaneousRecognitionByRecognizers:TSUDynamicCast() [-[TSKScrollView panGestureRecognizer](-[THWOverlayableZoomableCanvasController scrollView](self, "scrollView"), "panGestureRecognizer")], 0];
}

- (BOOL)isDragging
{
  id v2 = [(THWOverlayableZoomableCanvasController *)self scrollView];

  return [(TSKScrollView *)v2 isDragging];
}

- (BOOL)isZooming
{
  return [(THWOverlayableZoomableCanvasController *)self zooming];
}

- (BOOL)isZoomedOut
{
  id v3 = [[-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC") canvasView] canvasLayer];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] viewScale];
  double v5 = v4;
  [v3 minimumPinchViewScale];
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (void)setBackgroundLayer:(id)a3
{
  backgroundLayer = self->_backgroundLayer;
  if (backgroundLayer != a3)
  {
    if (backgroundLayer)
    {
      -[THLayerContainingView removeSublayer:](self->_backgroundView, "removeSublayer:");

      self->_backgroundLayer = 0;
    }
    if (a3)
    {
      double v6 = (CALayer *)a3;
      self->_backgroundLayer = v6;
      [(THLayerContainingView *)self->_backgroundView addSublayer:v6];
    }
    [(THWOverlayableZoomableCanvasController *)self p_updateSubviewsOrLayers];
  }
}

- (CGAffineTransform)p_contentBoundsToUnscaledTransform
{
  if ([(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] animatingViewScale])double mAnimatingToViewScale = self->mAnimatingToViewScale; {
  else
  }
    [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] viewScale];
  double v6 = 1.0 / mAnimatingToViewScale;

  return CGAffineTransformMakeScale(retstr, v6, v6);
}

- (CGAffineTransform)p_contentUnscaledToBoundsTransform
{
  if (self) {
    [(THWOverlayableZoomableCanvasController *)self p_contentBoundsToUnscaledTransform];
  }
  else {
    memset(&v5, 0, sizeof(v5));
  }
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGAffineTransform)p_contentBoundsToContainerBoundsTransform
{
  if ([(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self scrollContentICC] animatingViewScale])
  {
    double x = self->mAnimatingToContentOffset.x;
    double y = self->mAnimatingToContentOffset.y;
  }
  else if ([(THWOverlayableZoomableCanvasController *)self scrollView])
  {
    [(TSKScrollView *)[(THWOverlayableZoomableCanvasController *)self scrollView] contentOffset];
  }
  else
  {
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWOverlayableZoomableCanvasController scrollContentICC](self, "scrollContentICC"), "layerHost"), "clippingLayer"), "bounds");
  }
  double v7 = -x;
  double v8 = -y;

  return CGAffineTransformMakeTranslation(retstr, v7, v8);
}

- (CGAffineTransform)p_containerBoundsToContentBoundsTransform
{
  if (self) {
    [(THWOverlayableZoomableCanvasController *)self p_contentBoundsToContainerBoundsTransform];
  }
  else {
    memset(&v5, 0, sizeof(v5));
  }
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGPoint)unscaledContainerPointFromUnscaledContentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self)
  {
    [(THWOverlayableZoomableCanvasController *)self p_contentUnscaledToBoundsTransform];
    double v7 = *((double *)&v23 + 1);
    double v6 = *(double *)&v23;
    double v9 = *((double *)&v24 + 1);
    double v8 = *(double *)&v24;
    double v11 = *((double *)&v25 + 1);
    double v10 = *(double *)&v25;
    [(THWOverlayableZoomableCanvasController *)self p_contentBoundsToContainerBoundsTransform];
    float64x2_t v12 = v20;
    float64x2_t v13 = v21;
    float64x2_t v14 = v22;
  }
  else
  {
    float64x2_t v14 = 0uLL;
    long long v24 = 0u;
    long long v25 = 0u;
    double v6 = 0.0;
    double v8 = 0.0;
    float64x2_t v22 = 0u;
    long long v23 = 0u;
    float64x2_t v20 = 0u;
    float64x2_t v21 = 0u;
    double v10 = 0.0;
    double v7 = 0.0;
    double v9 = 0.0;
    double v11 = 0.0;
    float64x2_t v12 = 0uLL;
    float64x2_t v13 = 0uLL;
  }
  double v15 = [(THWOverlayableZoomableCanvasController *)self scrollContainerICC];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v15, "convertBoundsToUnscaledPoint:", v18, v19);
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)scaledContainerPointFromUnscaledContentPoint:(CGPoint)a3
{
  -[THWOverlayableZoomableCanvasController unscaledContainerPointFromUnscaledContentPoint:](self, "unscaledContainerPointFromUnscaledContentPoint:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(THWOverlayableZoomableCanvasController *)self scrollContainerICC];

  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v8, "convertUnscaledToBoundsPoint:", v5, v7);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGRect)unscaledContentRectFromUnscaledContainerRect:(CGRect)a3
{
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:]([(THWOverlayableZoomableCanvasController *)self scrollContainerICC], "convertUnscaledToBoundsRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if (self) {
    [(THWOverlayableZoomableCanvasController *)self p_containerBoundsToContentBoundsTransform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  v18.origin.CGFloat x = v5;
  v18.origin.CGFloat y = v7;
  v18.size.CGFloat width = v9;
  v18.size.CGFloat height = v11;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (self) {
    [(THWOverlayableZoomableCanvasController *)self p_contentBoundsToUnscaledTransform];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v20, &v16);
}

- (CGRect)scaledContentRectFromUnscaledContainerRect:(CGRect)a3
{
  -[THWOverlayableZoomableCanvasController unscaledContentRectFromUnscaledContainerRect:](self, "unscaledContentRectFromUnscaledContainerRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if (self) {
    [(THWOverlayableZoomableCanvasController *)self p_contentUnscaledToBoundsTransform];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  v13.origin.CGFloat x = v5;
  v13.origin.CGFloat y = v7;
  v13.size.CGFloat width = v9;
  v13.size.CGFloat height = v11;
  return CGRectApplyAffineTransform(v13, &v12);
}

- (void)updateContainerInfosToDisplay
{
}

- (CGRect)targetVisibleRect
{
  double x = self->mTargetVisibleRect.origin.x;
  double y = self->mTargetVisibleRect.origin.y;
  double width = self->mTargetVisibleRect.size.width;
  double height = self->mTargetVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetVisibleRect:(CGRect)a3
{
  self->mTargetVisibleRect = a3;
}

- (TSKScrollView)scrollView
{
  return (TSKScrollView *)self->mScrollView;
}

- (void)setScrollView:(id)a3
{
}

- (TSDInteractiveCanvasController)scrollContainerICC
{
  return self->mScrollContainerICC;
}

- (void)setScrollContainerICC:(id)a3
{
}

- (TSDInteractiveCanvasController)scrollContentICC
{
  return self->mScrollContentICC;
}

- (void)setScrollContentICC:(id)a3
{
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (THWClippingLayerHost)containerClippingLayerHost
{
  return self->mContainerClippingLayerHost;
}

- (THWClippingLayerHost)contentClippingLayerHost
{
  return self->mContentClippingLayerHost;
}

- (THWOverlayableZoomableCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)rasterize
{
  return self->_rasterize;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (BOOL)zooming
{
  return self->_zooming;
}

- (void)setZooming:(BOOL)a3
{
  self->_zooming = a3;
}

- (THWOverlayableZoomableBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
}

@end