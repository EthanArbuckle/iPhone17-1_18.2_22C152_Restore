@interface THWZoomableCanvasController
- (BOOL)createLayerHostIfNeededWithUnscaledFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)createViewIfNeededWithUnscaledFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)inResize;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)isCanvasInteractive;
- (BOOL)isZoomedOut;
- (BOOL)shouldResizeCanvasToScrollView;
- (BOOL)spellCheckingSuppressed;
- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 anchor:(CGPoint)a4 viewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6;
- (CGPoint)contentOffsetForAnchor:(CGPoint)a3;
- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4;
- (CGRect)targetVisibleRect;
- (NSObject)instanceData;
- (THDocumentRoot)documentRoot;
- (THWClippingLayerHost)clippingLayerHost;
- (THWZoomableCanvasController)initWithDocumentRoot:(id)a3;
- (THWZoomableCanvasControllerDelegate)delegate;
- (TSDCanvasLayerHosting)layerHost;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSKScrollView)scrollView;
- (TSWPLongPressGestureRecognizer)immediatePressGesture;
- (_NSRange)loadedPageRange;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4;
- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (void)dealloc;
- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4;
- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)interactiveCanvasControllerDidZoom:(id)a3;
- (void)invalidateLayers;
- (void)p_rebuildContentSize;
- (void)p_rebuildInfos;
- (void)p_updateContentsScale;
- (void)p_updateInfosToDisplay;
- (void)p_updateWithDelegate;
- (void)setClippingLayerHost:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImmediatePressGesture:(id)a3;
- (void)setInResize:(BOOL)a3;
- (void)setInstanceData:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setLayerHost:(id)a3;
- (void)setLoadedPageRange:(_NSRange)a3;
- (void)setScrollView:(id)a3;
- (void)setTargetVisibleRect:(CGRect)a3;
- (void)setUnscaledFrame:(CGRect)a3 viewScale:(double)a4;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 anchor:(CGPoint)a5;
- (void)setupImmediatePressGesture;
- (void)teardownController;
- (void)teardownView;
@end

@implementation THWZoomableCanvasController

- (THWZoomableCanvasController)initWithDocumentRoot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWZoomableCanvasController;
  v3 = [(THWZoomableCanvasController *)&v7 init];
  if (v3)
  {
    objc_opt_class();
    v3->_documentRoot = (THDocumentRoot *)(id)TSUDynamicCast();
    CGPoint origin = CGRectNull.origin;
    CGSize size = CGRectNull.size;
    v3->_loadedPageRange = (_NSRange)xmmword_3447B0;
    v3->_targetVisibleRect.CGPoint origin = origin;
    v3->_targetVisibleRect.CGSize size = size;
  }
  return v3;
}

- (void)dealloc
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)THWZoomableCanvasController;
  [(THWZoomableCanvasController *)&v3 dealloc];
}

- (BOOL)createViewIfNeededWithUnscaledFrame:(CGRect)a3 viewScale:(double)a4
{
  p_scrollView = &self->_scrollView;
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    p_layerHost = &self->_layerHost;
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    THCanvasAndScrollViewCreateWithClass(self, (id *)p_interactiveCanvasController, (id *)p_layerHost, p_scrollView, v14, 0, v15);
    clippingLayerHost = self->_clippingLayerHost;
    if (clippingLayerHost)
    {
      [(THWClippingLayerHost *)clippingLayerHost setInteractiveCanvasController:0];
      [(THWClippingLayerHost *)self->_clippingLayerHost teardownAndTransferCanvasLayersToHost:[(THWZoomableCanvasController *)self layerHost]];

      self->_clippingLayerHost = 0;
    }
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController disableAllGestures];
    -[THWZoomableCanvasController setUnscaledFrame:viewScale:](self, "setUnscaledFrame:viewScale:", x, y, width, height, a4);
    [(TSKScrollView *)self->_scrollView hideScrollIndicators];
    [(TSKScrollView *)self->_scrollView setMayPassScrollEventsToNextResponder:1];
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:0];
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setAllowLayoutAndRenderOnThread:1];
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setCreateRepsForOffscreenLayouts:1];
    [self->_layerHost.canvasLayer setCenteredInScrollView:1];
    [(THWZoomableCanvasController *)self p_updateWithDelegate];
  }
  return scrollView == 0;
}

- (BOOL)createLayerHostIfNeededWithUnscaledFrame:(CGRect)a3 viewScale:(double)a4
{
  if (self->_scrollView || self->_layerHost || self->_interactiveCanvasController || self->_clippingLayerHost) {
    return 0;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_clippingLayerHost, 0);
  BOOL v5 = 1;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:1];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setCreateRepsForOffscreenLayouts:1];
  [(TSDCanvasLayer *)[(THWClippingLayerHost *)self->_clippingLayerHost canvasLayer] setCenteredInScrollView:1];
  -[THWZoomableCanvasController setUnscaledFrame:viewScale:](self, "setUnscaledFrame:viewScale:", x, y, width, height, a4);
  [(THWZoomableCanvasController *)self p_updateWithDelegate];
  return v5;
}

- (void)p_updateWithDelegate
{
  if (self->_delegate)
  {
    [(THWZoomableCanvasController *)self p_rebuildContentSize];
    [(THWZoomableCanvasController *)self p_updateContentsScale];
    if (objc_opt_respondsToSelector()) {
      [(THWZoomableCanvasControllerDelegate *)self->_delegate zoomableCanvasControllerCustomizeLayerHost:self];
    }
    [(THWZoomableCanvasController *)self p_rebuildInfos];
  }
}

- (void)p_updateContentsScale
{
  if (self->_clippingLayerHost)
  {
    id v3 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvas];
    [(THWZoomableCanvasControllerDelegate *)self->_delegate zoomableCanvasControllerContentsScale:self];
    [v3 i_setContentsScale:];
  }
}

- (void)setUnscaledFrame:(CGRect)a3 viewScale:(double)a4
{
  TSDMultiplyRectScalar();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  scrollView = self->_scrollView;
  if (scrollView)
  {
    [(TSKScrollView *)scrollView frame];
    double v15 = v14;
    double v17 = v16;
    v18 = (CALayer *)self->_scrollView;
  }
  else
  {
    clippingLayerHost = self->_clippingLayerHost;
    if (!clippingLayerHost) {
      return;
    }
    [(CALayer *)[(THWClippingLayerHost *)clippingLayerHost clippingLayer] frame];
    double v15 = v20;
    double v17 = v21;
    v18 = [(THWClippingLayerHost *)self->_clippingLayerHost clippingLayer];
  }
  -[CALayer setFrame:](v18, "setFrame:", v6, v8, v10, v12);
  if (v15 != v10 || v17 != v12)
  {
    [(THWZoomableCanvasController *)self p_rebuildContentSize];
    [(THWZoomableCanvasController *)self p_rebuildInfos];
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWZoomableCanvasControllerDelegate *)a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  double v5 = sub_180390;
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
    v3[2] = sub_180398;
    v3[3] = &unk_457868;
    v3[4] = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (void)teardownController
{
  [(TSKScrollView *)self->_scrollView setDelegate:0];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController teardown];
  clippingLayerHost = self->_clippingLayerHost;

  [(THWClippingLayerHost *)clippingLayerHost teardown];
}

- (void)teardownView
{
}

- (void)invalidateLayers
{
}

- (void)p_updateInfosToDisplay
{
  id v3 = [(THWZoomableCanvasController *)self delegate];
  if (v3)
  {
    v4 = v3;
    [(TSDInteractiveCanvasController *)[(THWZoomableCanvasController *)self interactiveCanvasController] visibleBoundsRect];
    CGRect v9 = CGRectUnion(v8, self->_targetVisibleRect);
    id v5 = -[THWZoomableCanvasControllerDelegate zoomableCanvasController:infosToDisplayForViewport:](v4, "zoomableCanvasController:infosToDisplayForViewport:", self, v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
    double v6 = [(THWZoomableCanvasController *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v6 setInfosToDisplay:v5];
  }
}

- (void)p_rebuildContentSize
{
  id v3 = [(THWZoomableCanvasController *)self interactiveCanvasController];
  if (self->_delegate)
  {
    v4 = v3;
    if ([(TSDInteractiveCanvasController *)v3 layerHost])
    {
      [(THWZoomableCanvasControllerDelegate *)[(THWZoomableCanvasController *)self delegate] sizeOfCanvasForZoomableCanvasController:self];
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](v4, "layerHost"), "canvasLayer"), "setUnscaledSize:", v5, v6);
      id v7 = [self->_interactiveCanvasController.layerHost canvasLayer];
      [v7 fixFrameAndScrollView];
    }
  }
}

- (void)p_rebuildInfos
{
  id v3 = [(THWZoomableCanvasController *)self interactiveCanvasController];
  if (self->_delegate && [(TSDInteractiveCanvasController *)v3 layerHost])
  {
    [(THWZoomableCanvasController *)self p_updateInfosToDisplay];
  }
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  -[THWZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);

  [a3 currentlyWaitingOnThreadedLayoutAndRender];
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4) {
    -[THWZoomableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  double v6 = [(THWZoomableCanvasController *)self delegate];

  return [(THWZoomableCanvasControllerDelegate *)v6 zoomableCanvasController:self geometryProviderForLayout:a4];
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  double v6 = [(THWZoomableCanvasController *)self delegate];
  if ([(THWZoomableCanvasControllerDelegate *)v6 conformsToProtocol:a4]) {
    return v6;
  }
  else {
    return 0;
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGRect v9 = [(THWZoomableCanvasController *)self delegate];

  -[THWZoomableCanvasControllerDelegate zoomableCanvasController:expandBoundsForHitTesting:](v9, "zoomableCanvasController:expandBoundsForHitTesting:", self, x, y, width, height);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  double v6 = [(THWZoomableCanvasController *)self delegate];

  return [(THWZoomableCanvasControllerDelegate *)v6 zoomableCanvasController:self primaryTargetForGesture:a4];
}

- (void)interactiveCanvasControllerDidZoom:(id)a3
{
  double v5 = [(THWZoomableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [a3 viewScale];
    -[THWZoomableCanvasControllerDelegate zoomableCanvasController:didEndZoomingAtScale:](v5, "zoomableCanvasController:didEndZoomingAtScale:", self);
  }
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  v4 = [(THWZoomableCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWZoomableCanvasControllerDelegate *)v4 zoomableCanvasControllerIsRelatedCanvasScrolling:self];
}

- (BOOL)shouldResizeCanvasToScrollView
{
  return ![(THWZoomableCanvasController *)self inResize];
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double y = a4.y;
  double x = a4.x;
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost", a3), "canvasLayer"), "unscaledSize");
  TSDMultiplySizeScalar();
  if (width <= v10) {
    double v12 = x;
  }
  else {
    double v12 = (width - v10) * -0.5;
  }
  if (height <= v11) {
    double v13 = y;
  }
  else {
    double v13 = (height - v11) * -0.5;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  double v6 = [(THWZoomableCanvasController *)self delegate];

  return [(THWZoomableCanvasControllerDelegate *)v6 zoomableCanvasController:self allowsEditMenuForRep:a4];
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
  if (!self->_immediatePressGesture)
  {
    id v3 = objc_alloc((Class)TSWPLongPressGestureRecognizer);
    id v4 = [(TSDInteractiveCanvasController *)[(THWZoomableCanvasController *)self interactiveCanvasController] gestureDispatcher];
    id v5 = [v3 initWithGestureDispatcher:v4 gestureKind:TSWPImmediatePress];
    [(THWZoomableCanvasController *)self setImmediatePressGesture:v5];

    [(TSWPLongPressGestureRecognizer *)[(THWZoomableCanvasController *)self immediatePressGesture] setNumberOfTapsRequired:0];
    [(TSWPLongPressGestureRecognizer *)[(THWZoomableCanvasController *)self immediatePressGesture] setNumberOfTouchesRequired:1];
    [(TSWPLongPressGestureRecognizer *)[(THWZoomableCanvasController *)self immediatePressGesture] setMinimumPressDuration:0.0];
    objc_msgSend(objc_msgSend(-[TSDCanvasLayerHosting asiOSCVC](-[THWZoomableCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "viewForGestureRecognizer:", -[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture")), "addGestureRecognizer:", -[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture"));
    [(-[TSDInteractiveCanvasController gestureDispatcher](-[THWZoomableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher")) allowSimultaneousRecognitionByRecognizers:(-[THWZoomableCanvasController immediatePressGesture](self, "immediatePressGesture")), (-[TSKScrollView panGestureRecognizer](-[THWZoomableCanvasController scrollView](self, "scrollView"), "panGestureRecognizer")), 0];
  }
}

- (BOOL)isZoomedOut
{
  id v3 = [self->_interactiveCanvasController canvasView].canvasLayer;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController viewScale];
  double v5 = v4;
  [v3 minimumPinchViewScale];
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (CGPoint)contentOffsetForAnchor:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_scrollView) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWZoomableCanvasController contentOffsetForAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWZoomableCanvasController.m") lineNumber:391 description:@"current not supported without scrollView"];
  }
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController contentOffset];
  double v7 = v6;
  double v9 = v8;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController viewScale];
  double v11 = v10;
  [(TSKScrollView *)self->_scrollView bounds];
  double v13 = v7 + x * v12 / v11;
  double v15 = v9 + y * v14 / v11;
  result.double y = v15;
  result.double x = v13;
  return result;
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 anchor:(CGPoint)a4 viewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6
{
  CGFloat v6 = a4.x * a6.width / a5;
  CGFloat v7 = a4.y * a6.height / a5;
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:](self->_interactiveCanvasController, "clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:", a3.x - v6, a3.y - v7, a5, a6.width, a6.height);
  double v9 = v6 + v8;
  double v11 = v7 + v10;
  result.double y = v11;
  result.double x = v9;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 anchor:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  id v11 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layerHost];
  objc_msgSend(objc_msgSend(v11, "clippingLayer"), "bounds");
  double v13 = v8 - x * v12 / a3;
  double v15 = v7 - y * v14 / a3;
  if (self->_clippingLayerHost)
  {
    -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self->_interactiveCanvasController, "clampedUnscaledContentOffset:forViewScale:", v13, v15, a3);
    id v16 = [v11 canvasLayer];
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setViewScale:a3];
    [v16 fixFrameAndScrollView];
    [v16 bounds];
    TSDRectWithSize();
    [v16 setFrame:];
    TSDMultiplyPointScalar();
    clippingLayerHost = self->_clippingLayerHost;
    -[THWClippingLayerHost setContentOffset:](clippingLayerHost, "setContentOffset:");
  }
  else if (self->_scrollView)
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, 0, a3, v13, v15);
  }
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (TSKScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->_layerHost;
}

- (void)setLayerHost:(id)a3
{
}

- (THWClippingLayerHost)clippingLayerHost
{
  return self->_clippingLayerHost;
}

- (void)setClippingLayerHost:(id)a3
{
}

- (THWZoomableCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (TSWPLongPressGestureRecognizer)immediatePressGesture
{
  return self->_immediatePressGesture;
}

- (void)setImmediatePressGesture:(id)a3
{
}

- (BOOL)inResize
{
  return self->_inResize;
}

- (void)setInResize:(BOOL)a3
{
  self->_inReCGSize size = a3;
}

- (NSObject)instanceData
{
  return self->_instanceData;
}

- (void)setInstanceData:(id)a3
{
}

- (_NSRange)loadedPageRange
{
  NSUInteger length = self->_loadedPageRange.length;
  NSUInteger location = self->_loadedPageRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLoadedPageRange:(_NSRange)a3
{
  self->_loadedPageRange = a3;
}

- (CGRect)targetVisibleRect
{
  double x = self->_targetVisibleRect.origin.x;
  double y = self->_targetVisibleRect.origin.y;
  double width = self->_targetVisibleRect.size.width;
  double height = self->_targetVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetVisibleRect:(CGRect)a3
{
  self->_targetVisibleRect = a3;
}

@end