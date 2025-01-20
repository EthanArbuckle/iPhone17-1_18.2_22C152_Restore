@interface THWScrollableCanvasController
- (BOOL)allowCopy;
- (BOOL)allowSearchBook;
- (BOOL)allowSelectionPopover;
- (BOOL)canvasViewControllerShouldShowScaleFeedback:(id)a3;
- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsHyperlinkInteraction;
- (BOOL)editorAllowsKeyboard;
- (BOOL)editorAllowsMagnifier;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)isCanvasInteractive;
- (BOOL)p_shouldUseOverlayScrollerOnly;
- (BOOL)rasterize;
- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds;
- (BOOL)shouldPopKnobsOutsideEnclosingScrollView;
- (BOOL)shouldResizeCanvasToScrollView;
- (BOOL)spellCheckingSuppressed;
- (BOOL)updateCanvasSizeOnLayout;
- (BOOL)updateInfosOnScroll;
- (BOOL)userInteractionEnabled;
- (CALayer)strokeLayer;
- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 anchor:(CGPoint)a4 viewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6;
- (CGPoint)contentOffsetForAnchor:(CGPoint)a3;
- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6;
- (CGRect)frame;
- (CGRect)insetFrame:(CGRect)a3;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4;
- (CGRect)targetVisibleRect;
- (CGSize)p_scrollViewContentSize;
- (CGSize)unscaledContentSizeForFillScreen;
- (Class)wpEditorClassOverride;
- (NSObject)instanceData;
- (THDocumentRoot)documentRoot;
- (THInteractiveCanvasController)interactiveCanvasController;
- (THWClippingLayerHost)clippingLayerHost;
- (THWScrollableCanvasController)initWithDocumentRoot:(id)a3;
- (THWScrollableCanvasControllerDelegate)delegate;
- (TSDCanvasLayerHosting)layerHost;
- (TSKScrollView)scrollView;
- (UIView)strokeView;
- (double)scrollerPadding;
- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5;
- (id)activityItemProviderWithCachedAnnotation:(id)a3;
- (id)bookNavigatorForInteractiveCanvasController:(id)a3;
- (id)canvasViewController;
- (id)documentNavigatorForInteractiveCanvasController:(id)a3;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4;
- (id)interactiveCanvasController:(id)a3 maskLayerForBounds:(CGRect)a4;
- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)titleOfCurrentNavigationUnit;
- (void)addAlternateLayersToArray:(id)a3;
- (void)dealloc;
- (void)didAddView;
- (void)disableCanvasInteraction;
- (void)displayModeDidChange:(int)a3;
- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4;
- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4;
- (void)interactiveCanvasControllerDidLayout:(id)a3;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)interactiveCanvasControllerWasTapped:(id)a3;
- (void)invalidateLayers;
- (void)invalidateLayoutsAndFrames;
- (void)invalidateViews;
- (void)p_addStrokeLayer;
- (void)p_rebuild;
- (void)p_rebuildUpdateInfos:(BOOL)a3;
- (void)p_scaleToFitWidth;
- (void)p_updateContentsScale;
- (void)p_updateInfosToDisplay;
- (void)p_updateRasterizeOnLayer;
- (void)p_updateWithDelegate;
- (void)presentSearchResultsForString:(id)a3;
- (void)selectionDidChange;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3 scale:(double)a4;
- (void)setInstanceData:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setRasterize:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollerPadding:(double)a3;
- (void)setStrokeLayer:(id)a3;
- (void)setStrokeView:(id)a3;
- (void)setTargetVisibleRect:(CGRect)a3;
- (void)setUpdateCanvasSizeOnLayout:(BOOL)a3;
- (void)setUpdateInfosOnScroll:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 anchor:(CGPoint)a5;
- (void)setupImmediatePressGestureWithSimultaneousGestures:(id)a3;
- (void)teardownController;
- (void)teardownView;
@end

@implementation THWScrollableCanvasController

- (THWScrollableCanvasController)initWithDocumentRoot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWScrollableCanvasController;
  v3 = [(THWScrollableCanvasController *)&v6 init];
  if (v3)
  {
    objc_opt_class();
    v3->_documentRoot = (THDocumentRoot *)(id)TSUDynamicCast();
    CGSize size = CGRectNull.size;
    v3->_targetVisibleRect.origin = CGRectNull.origin;
    v3->_targetVisibleRect.CGSize size = size;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWScrollableCanvasController;
  [(THWScrollableCanvasController *)&v3 dealloc];
}

- (void)invalidateViews
{
  if (+[NSThread isMainThread]
    && ![(THWScrollableCanvasController *)self scrollView])
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    [(THInteractiveCanvasController *)interactiveCanvasController invalidateRepsIfSynced];
  }
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = [(THWScrollableCanvasController *)self delegate];
  if ([(THWScrollableCanvasController *)self mainView]
    || [(THWScrollableCanvasController *)self scrollView]
    || [(THWScrollableCanvasController *)self layerHost]
    || ([(THWScrollableCanvasControllerDelegate *)v10 deferViewCreationForScrollableCanvasController:self] & 1) != 0)
  {
    return 0;
  }
  TSDRoundedRectForMainScreen();
  id v16 = [objc_alloc((Class)UIView) initWithFrame:v12, v13, v14, v15];
  [(THWScrollableCanvasController *)self setStrokeLayer:0];
  [(THWScrollableCanvasControllerDelegate *)v10 contentInsetsForScrollableCanvasController:self];
  TSDRoundedRectForMainScreen();
  v21 = -[THScrollView initWithFrame:]([THScrollView alloc], "initWithFrame:", v17, v18, v19, v20);
  [(THScrollView *)v21 setMayPassScrollEventsToNextResponder:1];
  if (objc_opt_respondsToSelector())
  {
    [(THWScrollableCanvasControllerDelegate *)v10 scrollViewContentInsetForScrollableCanvasController:self];
    -[THScrollView setContentInset:](v21, "setContentInset:");
  }
  [(THScrollView *)v21 setClipsToBounds:0];
  [(THScrollView *)v21 setHandleNaturally:1];
  [(THScrollView *)v21 setBounces:1];
  [(THScrollView *)v21 setAlwaysBounceVertical:0];
  [(THScrollView *)v21 setAlwaysBounceHorizontal:0];
  [(THWScrollableCanvasController *)self setScrollView:v21];
  [(THWScrollableCanvasController *)self setStrokeView:v16];
  [(UIView *)[(THWScrollableCanvasController *)self strokeView] addSubview:[(THWScrollableCanvasController *)self scrollView]];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  THCanvasCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_layerHost, v22, v23);
  clippingLayerHost = self->_clippingLayerHost;
  if (clippingLayerHost)
  {
    [(THWClippingLayerHost *)clippingLayerHost setInteractiveCanvasController:0];
    [(THWClippingLayerHost *)self->_clippingLayerHost teardownAndTransferCanvasLayersToHost:[(THWScrollableCanvasController *)self layerHost]];

    self->_clippingLayerHost = 0;
  }
  v25 = [(THWScrollableCanvasController *)self interactiveCanvasController];
  [(THInteractiveCanvasController *)v25 disableNormalGestures];
  [(THInteractiveCanvasController *)v25 enableGestureKinds:+[NSArray arrayWithObject:TSWPImmediateSingleTap]];
  id v26 = [[-[THInteractiveCanvasController layerHost](v25, "layerHost")] canvasLayer];
  [v26 setAllowsPinchZoom:0];
  [(TSKScrollView *)[(THWScrollableCanvasController *)self scrollView] addSubview:[(TSDCanvasLayerHosting *)[(THWScrollableCanvasController *)self layerHost] canvasView]];
  [(TSKScrollView *)[(THWScrollableCanvasController *)self scrollView] setDelegate:v25];
  [(THInteractiveCanvasController *)v25 setNestedCanvasAllowLayoutAndRenderOnThread:0];
  [(THInteractiveCanvasController *)v25 setAllowLayoutAndRenderOnThread:1];
  [(THInteractiveCanvasController *)v25 setCreateRepsForOffscreenLayouts:1];
  objc_opt_class();
  [(id)TSUDynamicCast() setDelegate:self];
  -[THWScrollableCanvasController setFrame:scale:](self, "setFrame:scale:", x, y, width, height, a4);
  if (objc_opt_respondsToSelector())
  {
    if (-[THWScrollableCanvasControllerDelegate centeredInScrollViewForScrollableCanvasController:](v10, "centeredInScrollViewForScrollableCanvasController:", self))[v26 setCenteredInScrollView:1]; {
  }
    }
  [(THWScrollableCanvasController *)self p_updateWithDelegate];
  [(THWScrollableCanvasController *)self p_updateRasterizeOnLayer];
  return 1;
}

- (id)canvasViewController
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (void)p_updateWithDelegate
{
  if (self->_delegate)
  {
    if (objc_opt_respondsToSelector()) {
      [(THWScrollableCanvasControllerDelegate *)self->_delegate scrollableCanvasController:self customizeLayerHost:[(THInteractiveCanvasController *)self->_interactiveCanvasController layerHost]];
    }
    [(THWScrollableCanvasController *)self p_updateContentsScale];
    [(THWScrollableCanvasController *)self p_rebuild];
    [(THInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
    [(THWScrollableCanvasController *)self frame];
    -[THWScrollableCanvasController insetFrame:](self, "insetFrame:");
    double v4 = v3;
    double v6 = v5;
    [(THWScrollableCanvasController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      -[THWScrollableCanvasControllerDelegate scrollableCanvasController:allowsPinchZoomForFrameSize:]([(THWScrollableCanvasController *)self delegate], "scrollableCanvasController:allowsPinchZoomForFrameSize:", self, v4, v6);
      if (v7 != 0.0)
      {
        -[THWScrollableCanvasControllerDelegate scrollableCanvasController:minViewScaleForFrameSize:]([(THWScrollableCanvasController *)self delegate], "scrollableCanvasController:minViewScaleForFrameSize:", self, v4, v6);
        double v9 = v8;
        -[THWScrollableCanvasControllerDelegate scrollableCanvasController:maxViewScaleForFrameSize:]([(THWScrollableCanvasController *)self delegate], "scrollableCanvasController:maxViewScaleForFrameSize:", self, v4, v6);
        double v11 = v10;
        [(-[TSDCanvasLayerHosting canvasLayer](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasLayer")) setAllowsPinchZoom:1];
        [(-[TSDCanvasLayerHosting canvasLayer](-[THWScrollableCanvasController layerHost](self, "layerHost"), "canvasLayer")) setMinimumPinchViewScale:v9];
        id v12 = [(TSDCanvasLayerHosting *)[(THWScrollableCanvasController *)self layerHost] canvasLayer];
        [v12 setMaximumPinchViewScale:v11];
      }
    }
  }
}

- (void)p_updateContentsScale
{
  if (self->_clippingLayerHost)
  {
    id v3 = [(THInteractiveCanvasController *)self->_interactiveCanvasController canvas];
    [(THWScrollableCanvasControllerDelegate *)self->_delegate contentsScaleForScrollableCanvasController:self];
    [v3 i_setContentsScale:];
  }
}

- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(THWScrollableCanvasController *)self scrollView]
    || [(THWScrollableCanvasController *)self layerHost]
    || [(THWScrollableCanvasController *)self interactiveCanvasController]
    || [(THWScrollableCanvasController *)self clippingLayerHost])
  {
    return 0;
  }
  id v12 = objc_opt_class();
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_clippingLayerHost, v12);
  BOOL v10 = 1;
  [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] setNestedCanvasAllowLayoutAndRenderOnThread:1];
  [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] setCreateRepsForOffscreenLayouts:1];
  -[THWScrollableCanvasController setFrame:scale:](self, "setFrame:scale:", x, y, width, height, a4);
  [(THWScrollableCanvasController *)self p_updateWithDelegate];
  [(THWScrollableCanvasController *)self p_updateRasterizeOnLayer];
  return v10;
}

- (BOOL)p_shouldUseOverlayScrollerOnly
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(THWScrollableCanvasControllerDelegate *)delegate scrollableCanvasControllerUseOverlayScrollerOnly:self];
}

- (void)setupImmediatePressGestureWithSimultaneousGestures:(id)a3
{
  if ([(THInteractiveCanvasController *)self->_interactiveCanvasController canvasView])
  {
    uint64_t v5 = TSWPImmediatePress;
    [(THInteractiveCanvasController *)self->_interactiveCanvasController enableGestureKinds:+[NSArray arrayWithObject:TSWPImmediatePress]];
    id v6 = [(THInteractiveCanvasController *)self->_interactiveCanvasController gestureRecognizerWithKind:v5];
    [self->_interactiveCanvasController.gestureDispatcher allowSimultaneousRecognitionByRecognizers:v6, self->_scrollView.panGestureRecognizer];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        BOOL v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(a3);
          }
          [self->_interactiveCanvasController gestureDispatcher] allowSimultaneousRecognitionByRecognizers:v6, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), 0);
          BOOL v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [self->_interactiveCanvasController.canvasView setUserInteractionEnabled:a3];
  [(TSKScrollView *)self->_scrollView setUserInteractionEnabled:v3];
  [(TSKScrollView *)self->_scrollView setScrollEnabled:v3];
  uint64_t v5 = [(THWScrollableCanvasController *)self mainView];

  [(UIView *)v5 setUserInteractionEnabled:v3];
}

- (BOOL)userInteractionEnabled
{
  id v2 = [(THInteractiveCanvasController *)self->_interactiveCanvasController canvasView];

  return [v2 isUserInteractionEnabled];
}

- (CGSize)p_scrollViewContentSize
{
  [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] viewScale];
  [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] sizeOfCanvasForScrollableCanvasController:self];
  TSDMultiplySizeScalar();

  TSDRoundedSize();
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGRect)insetFrame:(CGRect)a3
{
  [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] contentInsetsForScrollableCanvasController:self];

  TSDRoundedRectForMainScreen();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setFrame:(CGRect)a3 scale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  TSDRoundedRectForMainScreen();
  double v53 = v11;
  double v54 = v10;
  double v51 = v13;
  double v52 = v12;
  [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] contentInsetsForScrollableCanvasController:self];
  [(THWScrollableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v14 = [(THWScrollableCanvasController *)self delegate];
    -[THWScrollableCanvasController insetFrame:](self, "insetFrame:", x, y, width, height);
    -[THWScrollableCanvasControllerDelegate scrollableCanvasController:viewScaleForFrameSize:withScale:](v14, "scrollableCanvasController:viewScaleForFrameSize:withScale:", self, v15, v16, a4);
    double v55 = v17;
  }
  else
  {
    double v55 = a4;
  }
  if ([(THWScrollableCanvasController *)self clippingLayerHost])
  {
    TSDRoundedRectForMainScreen();
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(CALayer *)[(THWClippingLayerHost *)[(THWScrollableCanvasController *)self clippingLayerHost] clippingLayer] bounds];
    double v27 = v26;
    double v29 = v28;
    -[THWClippingLayerHost setFrame:]([(THWScrollableCanvasController *)self clippingLayerHost], "setFrame:", v19, v21, v23, v25);
    [(CALayer *)[(THWClippingLayerHost *)[(THWScrollableCanvasController *)self clippingLayerHost] clippingLayer] bounds];
    if (v27 != v31 || v29 != v30)
    {
      -[THInteractiveCanvasController setViewScale:andScrollViewFrame:maintainPosition:animated:](self->_interactiveCanvasController, "setViewScale:andScrollViewFrame:maintainPosition:animated:", 1, 0, v55, v19, v21, v23, v25);
      [(THWScrollableCanvasController *)self p_rebuild];
    }
  }
  else if ([(THWScrollableCanvasController *)self mainView] {
         && [(THWScrollableCanvasController *)self scrollView]
  }
         && +[NSThread isMainThread])
  {
    [(UIView *)[(THWScrollableCanvasController *)self mainView] frame];
    v58.origin.double x = v32;
    v58.origin.double y = v33;
    v58.size.double width = v34;
    v58.size.double height = v35;
    v57.origin.double y = v53;
    v57.origin.double x = v54;
    v57.size.double height = v51;
    v57.size.double width = v52;
    if (!CGRectEqualToRect(v57, v58)) {
      goto LABEL_17;
    }
    [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] viewScale];
    if (v36 != v55 && vabdd_f64(v36, v55) >= fabs(v55 * 0.000000999999997)) {
      goto LABEL_17;
    }
    [(TSKScrollView *)[(THWScrollableCanvasController *)self scrollView] contentSize];
    [(THWScrollableCanvasController *)self p_scrollViewContentSize];
    if ((TSDNearlyEqualSizes() & 1) == 0)
    {
LABEL_17:
      [(THWScrollableCanvasController *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ![(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] maintainScrollOffsetInFrameChangeForScrollableCanvasController:self])
      {
        int v39 = 0;
        uint64_t v47 = 0;
        uint64_t v49 = 0;
      }
      else
      {
        [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] contentOffset];
        uint64_t v47 = v38;
        uint64_t v49 = v37;
        int v39 = 1;
      }
      -[UIView setFrame:]([(THWScrollableCanvasController *)self mainView], "setFrame:", v54, v53, v52, v51);
      [(THWScrollableCanvasController *)self mainView];
      TSDRoundedRectForView();
      double v41 = v40;
      double v43 = v42;
      [(THWScrollableCanvasController *)self mainView];
      TSDRoundedPointForView();
      -[THInteractiveCanvasController setViewScale:andScrollViewFrame:maintainPosition:animated:](self->_interactiveCanvasController, "setViewScale:andScrollViewFrame:maintainPosition:animated:", 1, 0, v55, v44, v45, v41, v43);
      [(THWScrollableCanvasController *)self p_rebuild];
      if (v39)
      {
        v46 = [(THWScrollableCanvasController *)self interactiveCanvasController];
        -[THInteractiveCanvasController setContentOffset:animated:](v46, "setContentOffset:animated:", 0, v50, v48);
      }
    }
  }
}

- (CGRect)frame
{
  clippingLayerHost = (UIView *)self->_clippingLayerHost;
  if (!clippingLayerHost) {
    clippingLayerHost = [(THWScrollableCanvasController *)self mainView];
  }
  [(UIView *)clippingLayerHost frame];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWScrollableCanvasControllerDelegate *)a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  double v5 = sub_1A54E4;
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
    v3[2] = sub_1A54EC;
    v3[3] = &unk_457868;
    v3[4] = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (void)teardownController
{
  [(THInteractiveCanvasController *)self->_interactiveCanvasController teardown];
  clippingLayerHost = self->_clippingLayerHost;

  [(THWClippingLayerHost *)clippingLayerHost teardown];
}

- (void)teardownView
{
  [(TSKScrollView *)self->_scrollView setDelegate:0];
  layerHost = self->_layerHost;

  [(TSDCanvasLayerHosting *)layerHost teardown];
}

- (void)invalidateLayers
{
}

- (void)invalidateLayoutsAndFrames
{
  id v2 = [self->_interactiveCanvasController layoutController].rootLayout;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v2 addLayoutsToArray:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        id v8 = (void *)TSUDynamicCast();
        if (v8)
        {
          uint64_t v9 = v8;
          [v8 invalidateFrame];
          [v9 invalidateChildren];
        }
        ++v7;
      }
      while (v5 != v7);
      double v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)p_updateInfosToDisplay
{
  id v3 = [(THWScrollableCanvasController *)self delegate];
  if (v3)
  {
    double v4 = v3;
    unsigned int v5 = [(THWScrollableCanvasControllerDelegate *)v3 infosChangeForViewportChangeInScrollableCanvasController:self];
    uint64_t v6 = [(THWScrollableCanvasController *)self interactiveCanvasController];
    if (!objc_msgSend(-[THInteractiveCanvasController infosToDisplay](v6, "infosToDisplay"), "count") || v5)
    {
      [(THWScrollableCanvasController *)self targetVisibleRect];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [(THInteractiveCanvasController *)v6 visibleBoundsRect];
      v24.origin.double x = v15;
      v24.origin.double y = v16;
      v24.size.double width = v17;
      v24.size.double height = v18;
      v22.origin.double x = v8;
      v22.origin.double y = v10;
      v22.size.double width = v12;
      v22.size.double height = v14;
      CGRect v23 = CGRectUnion(v22, v24);
      id v19 = -[THWScrollableCanvasControllerDelegate scrollableCanvasController:infosToDisplayForViewport:](v4, "scrollableCanvasController:infosToDisplayForViewport:", self, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
      if ((objc_msgSend(v19, "isEqualToArray:", -[THInteractiveCanvasController infosToDisplay](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "infosToDisplay")) & 1) == 0)
      {
        double v20 = [(THWScrollableCanvasController *)self interactiveCanvasController];
        [(THInteractiveCanvasController *)v20 setInfosToDisplay:v19];
      }
    }
  }
}

- (void)addAlternateLayersToArray:(id)a3
{
  unsigned int v5 = [(THWClippingLayerHost *)[(THWScrollableCanvasController *)self clippingLayerHost] layer];
  if (v5)
  {
    [a3 addObject:v5];
    uint64_t v6 = [(THWScrollableCanvasController *)self strokeLayer];
    if (v6)
    {
      [a3 addObject:v6];
    }
  }
}

- (void)p_addStrokeLayer
{
  id v3 = [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] strokeLayerForScrollableCanvasController:self];
  [(CALayer *)[(THWScrollableCanvasController *)self strokeLayer] removeFromSuperlayer];
  [(THWScrollableCanvasController *)self setStrokeLayer:v3];
  if ([(THWScrollableCanvasController *)self strokeView])
  {
    if (v3)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(CALayer *)[(UIView *)[(THWScrollableCanvasController *)self strokeView] layer] setMasksToBounds:0];
      [(CALayer *)[(UIView *)[(THWScrollableCanvasController *)self strokeView] layer] addSublayer:v3];
      +[CATransaction commit];
    }
  }
  else
  {
    double v4 = [(THWClippingLayerHost *)[(THWScrollableCanvasController *)self clippingLayerHost] layer];
    if (v4)
    {
      [(CALayer *)v4 position];
      [v3 setPosition:];
    }
  }
}

- (void)p_rebuild
{
}

- (void)p_rebuildUpdateInfos:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(THWScrollableCanvasController *)self interactiveCanvasController];
  if ([(THWScrollableCanvasController *)self delegate] && v5)
  {
    [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] sizeOfCanvasForScrollableCanvasController:self];
    objc_msgSend(objc_msgSend(-[THInteractiveCanvasController layerHost](v5, "layerHost"), "canvasLayer"), "setUnscaledSize:", v6, v7);
    if ([(THWScrollableCanvasController *)self scrollView])
    {
      [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] contentInsetsForScrollableCanvasController:self];
      -[TSKScrollView setScrollIndicatorInsets:]([(THWScrollableCanvasController *)self scrollView], "setScrollIndicatorInsets:", 4.0, 0.0, 0.0, 2.0 - v8);
    }
    if (v3) {
      [(THWScrollableCanvasController *)self p_updateInfosToDisplay];
    }
    [(THWScrollableCanvasController *)self p_addStrokeLayer];
    objc_msgSend(objc_msgSend(-[THInteractiveCanvasController layerHost](v5, "layerHost"), "canvasLayer"), "fixFrameAndScrollView");
    [(THWScrollableCanvasController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      double v9 = [(THWScrollableCanvasController *)self delegate];
      id v10 = [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] layerHost];
      [(THWScrollableCanvasControllerDelegate *)v9 scrollableCanvasController:self customizeLayerHost:v10];
    }
  }
}

- (BOOL)editorAllowsKeyboard
{
  return 0;
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

- (BOOL)allowSearchBook
{
  return 0;
}

- (BOOL)editorAllowsHyperlinkInteraction
{
  return 0;
}

- (BOOL)allowCopy
{
  id v2 = [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] scrollableCanvasHost];

  return [v2 scrollableCanvasAllowCopy];
}

- (id)titleOfCurrentNavigationUnit
{
  return 0;
}

- (id)activityItemProviderWithCachedAnnotation:(id)a3
{
  id v4 = [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] scrollableCanvasHost];

  return [v4 scrollableCanvasActivityItemProviderWithCachedAnnotation:a3];
}

- (void)presentSearchResultsForString:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWScrollableCanvasController presentSearchResultsForString:]");
  unsigned int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWScrollableCanvasController.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:818 description:@"not yet implemented"];
}

- (void)interactiveCanvasControllerWasTapped:(id)a3
{
  id v4 = [(THWScrollableCanvasControllerDelegate *)[(THWScrollableCanvasController *)self delegate] scrollableCanvasHost];

  [v4 scrollableCanvasViewControllerDidReceiveBackgroundTap:self];
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  double v9 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v9 scrollableCanvasController:self actionForHyperlink:a3 inRep:a4 gesture:a5];
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  -[THWScrollableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0
    && [(THWScrollableCanvasController *)self updateInfosOnScroll])
  {
    [(THWScrollableCanvasController *)self p_updateInfosToDisplay];
  }
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4) {
    -[THWScrollableCanvasController setTargetVisibleRect:](self, "setTargetVisibleRect:", a3, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0
    && [(THWScrollableCanvasController *)self updateInfosOnScroll])
  {
    [(THWScrollableCanvasController *)self p_updateInfosToDisplay];
  }
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  double v6 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v6 scrollableCanvasController:self geometryProviderForLayout:a4];
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  double v6 = [(THWScrollableCanvasController *)self delegate];
  if ([(THWScrollableCanvasControllerDelegate *)v6 conformsToProtocol:a4]) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  if (self->_updateCanvasSizeOnLayout) {
    [(THWScrollableCanvasController *)self p_rebuildUpdateInfos:0];
  }
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
  {
    [(THWScrollableCanvasController *)self p_updateInfosToDisplay];
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = [(THWScrollableCanvasController *)self delegate];

  -[THWScrollableCanvasControllerDelegate scrollableCanvasController:expandBoundsForHitTesting:](v9, "scrollableCanvasController:expandBoundsForHitTesting:", self, x, y, width, height);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  double v6 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v6 scrollableCanvasController:self primaryTargetForGesture:a4];
}

- (BOOL)shouldResizeCanvasToScrollView
{
  return 1;
}

- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds
{
  return 1;
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5 scrollViewBoundsSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double y = a4.y;
  double x = a4.x;
  [(-[THWScrollableCanvasController layerHost](self, "layerHost", a3), "canvasLayer") unscaledSize];
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

- (id)interactiveCanvasController:(id)a3 maskLayerForBounds:(CGRect)a4
{
  unsigned int v5 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v5 maskLayerForScrollableCanvasController:self];
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  double v6 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v6 scrollableCanvasController:self allowsEditMenuForRep:a4];
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  double v8 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v8 scrollableCanvasController:self shouldBeginEditingTHWPRep:a4 withGesture:a5];
}

- (BOOL)interactiveCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  double v7 = [(THWScrollableCanvasController *)self delegate];
  objc_opt_class();
  uint64_t v8 = TSUDynamicCast();

  return [(THWScrollableCanvasControllerDelegate *)v7 scrollableCanvasController:self allowsHyperlinkWithGesture:a4 forRep:v8];
}

- (BOOL)allowSelectionPopover
{
  id v2 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v2 allowSelectionPopover];
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  id v4 = [(THWScrollableCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWScrollableCanvasControllerDelegate *)v4 isRelatedCanvasScrollingForScrollableCanvasController:self];
}

- (BOOL)shouldPopKnobsOutsideEnclosingScrollView
{
  return 1;
}

- (void)selectionDidChange
{
  if (objc_msgSend(objc_msgSend(-[THInteractiveCanvasController editorController](-[THWScrollableCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), "selection"))
  {
    id v3 = [(THWScrollableCanvasController *)self interactiveCanvasController];
    [(THInteractiveCanvasController *)v3 resumeEditing];
  }
}

- (id)bookNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(THWScrollableCanvasControllerDelegate *)delegate bookNavigatorForScrollableCanvasController:self];
}

- (id)documentNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(THWScrollableCanvasControllerDelegate *)delegate documentNavigatorForScrollableCanvasController:self];
}

- (CGPoint)contentOffsetForAnchor:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(THInteractiveCanvasController *)self->_interactiveCanvasController contentOffset];
  double v7 = v6;
  double v9 = v8;
  [(THInteractiveCanvasController *)self->_interactiveCanvasController viewScale];
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
  -[THInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:](self->_interactiveCanvasController, "clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:", a3.x - v6, a3.y - v7, a5, a6.width, a6.height);
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
  [(TSKScrollView *)self->_scrollView bounds];
  -[THInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self->_interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, 0, a3, v8 - x * v11 / a3, v7 - y * v12 / a3);

  [(THWScrollableCanvasController *)self p_rebuild];
}

- (void)didAddView
{
  [(THWScrollableCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(THWScrollableCanvasController *)self delegate];
    id v4 = [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] layerHost];
    [(THWScrollableCanvasControllerDelegate *)v3 scrollableCanvasController:self customizeLayerHost:v4];
  }
}

- (void)p_scaleToFitWidth
{
  [(TSKScrollView *)[(THWScrollableCanvasController *)self scrollView] frame];
  double v4 = v3;
  [[-[THInteractiveCanvasController interactiveCanvasController] canvas] unscaledSize];
  double v6 = v4 / v5;
  if (v6 < 1.0
    || ([(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] viewScale], vabdd_f64(v6, v7) >= 0.00999999978))
  {
    double v8 = [(THWScrollableCanvasController *)self interactiveCanvasController];
    [(THInteractiveCanvasController *)v8 setViewScale:v6];
  }
}

- (void)displayModeDidChange:(int)a3
{
  if (a3 == 1)
  {
    [(THWScrollableCanvasController *)self p_scaleToFitWidth];
  }
  else if (!a3)
  {
    double v5 = [(THWScrollableCanvasController *)self interactiveCanvasController];
    [(THInteractiveCanvasController *)v5 setViewScale:1.0];
  }
}

- (CGSize)unscaledContentSizeForFillScreen
{
  id v2 = [(THInteractiveCanvasController *)[(THWScrollableCanvasController *)self interactiveCanvasController] canvas];

  [v2 unscaledSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)disableCanvasInteraction
{
  id v2 = [(TSDCanvasLayerHosting *)[(THWScrollableCanvasController *)self layerHost] canvasView];

  [v2 setUserInteractionEnabled:0];
}

- (void)p_updateRasterizeOnLayer
{
  clippingLayerHost = self->_clippingLayerHost;
  if (!clippingLayerHost) {
    clippingLayerHost = self->_strokeView;
  }
  id v4 = [clippingLayerHost layer];
  [self->_interactiveCanvasController canvas].contentsScale
  [v4 setRasterizationScale:];
  [v4 setShouldRasterize:self->_rasterize];
  BOOL rasterize = self->_rasterize;

  [v4 spi_setPreloadsCache:rasterize];
}

- (void)setRasterize:(BOOL)a3
{
  if (self->_rasterize != a3)
  {
    self->_BOOL rasterize = a3;
    [(THWScrollableCanvasController *)self p_updateRasterizeOnLayer];
  }
}

- (BOOL)canvasViewControllerShouldShowScaleFeedback:(id)a3
{
  [(THWScrollableCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v4 = [(THWScrollableCanvasController *)self delegate];

  return [(THWScrollableCanvasControllerDelegate *)v4 scrollableCanvasControllerShouldShowScaleFeedback:self];
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (TSKScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (THWScrollableCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)updateInfosOnScroll
{
  return self->_updateInfosOnScroll;
}

- (void)setUpdateInfosOnScroll:(BOOL)a3
{
  self->_updateInfosOnScroll = a3;
}

- (NSObject)instanceData
{
  return self->_instanceData;
}

- (void)setInstanceData:(id)a3
{
}

- (BOOL)rasterize
{
  return self->_rasterize;
}

- (BOOL)updateCanvasSizeOnLayout
{
  return self->_updateCanvasSizeOnLayout;
}

- (void)setUpdateCanvasSizeOnLayout:(BOOL)a3
{
  self->_updateCanvasSizeOnLayout = a3;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->_layerHost;
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

- (UIView)strokeView
{
  return self->_strokeView;
}

- (void)setStrokeView:(id)a3
{
}

- (CALayer)strokeLayer
{
  return self->_strokeLayer;
}

- (void)setStrokeLayer:(id)a3
{
}

- (THWClippingLayerHost)clippingLayerHost
{
  return self->_clippingLayerHost;
}

- (double)scrollerPadding
{
  return self->_scrollerPadding;
}

- (void)setScrollerPadding:(double)a3
{
  self->_scrollerPadding = a3;
}

@end