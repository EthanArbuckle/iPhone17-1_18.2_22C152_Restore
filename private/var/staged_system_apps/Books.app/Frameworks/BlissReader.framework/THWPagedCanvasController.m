@interface THWPagedCanvasController
- (BOOL)allowCopy;
- (BOOL)allowHighlighting;
- (BOOL)allowSelectionPopoverForInteractiveCanvasController:(id)a3;
- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4;
- (BOOL)disableThreadedLayoutAndRenderDuringAnimation;
- (BOOL)editorAllowsCaret;
- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)isCanvasInteractive;
- (BOOL)mayPassScrollEventsToNextResponder;
- (BOOL)minimizeInfoChange;
- (BOOL)needRestore;
- (BOOL)padInfos;
- (BOOL)rasterize;
- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds;
- (BOOL)spellCheckingSuppressed;
- (BOOL)userInteractionEnabled;
- (CALayer)alternateLayerForView;
- (CGPoint)interactiveCanvasController:(id)a3 restrictedContentOffset:(CGPoint)a4 forViewScale:(double)a5;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForScrollViewHitTesting:(CGRect)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4;
- (CGRect)targetVisibleRect;
- (Class)wpEditorClassOverride;
- (THDocumentRoot)documentRoot;
- (THScrollView)scrollView;
- (THWClippingLayerHost)clippingLayerHost;
- (THWPagedCanvasController)init;
- (THWPagedCanvasController)initWithDocumentRoot:(id)a3;
- (THWPagedCanvasControllerDelegate)delegate;
- (TSDCanvasLayerHosting)layerHost;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSWPLongPressGestureRecognizer)immediatePressGesture;
- (UIView)view;
- (_NSRange)loadedPageRange;
- (double)p_adjustScale:(double)a3 andFrame:(CGRect *)a4;
- (double)p_verticalOverflow;
- (id)bookNavigatorForInteractiveCanvasController:(id)a3;
- (id)documentNavigatorForInteractiveCanvasController:(id)a3;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4;
- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)p_enclosingInteractiveCanvasController;
- (unint64_t)mostVisiblePageIndex;
- (unint64_t)pageIndex;
- (unint64_t)pageOffset;
- (unint64_t)preloadPageIndex;
- (unint64_t)preloadedPageIndex;
- (void)dealloc;
- (void)forceStopScrollingAtCurrentPageIndex;
- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4;
- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4;
- (void)interactiveCanvasControllerDidLayout:(id)a3;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)interactiveCanvasControllerDidStopScrolling:(id)a3;
- (void)interactiveCanvasControllerWillScroll:(id)a3;
- (void)invalidateLayers;
- (void)invalidateLayoutsAndFrames;
- (void)invalidateViews;
- (void)p_rebuild;
- (void)p_rebuildContentSize;
- (void)p_rebuildWithPageIndex:(unint64_t)a3;
- (void)p_setFrame:(CGRect)a3 scale:(double)a4 pageIndex:(unint64_t)a5;
- (void)p_updateContentsScale;
- (void)p_updateInfosToDisplay;
- (void)p_updateInfosToDisplayForced:(BOOL)a3;
- (void)p_updateMostVisiblePageIndex;
- (void)p_updateRasterizeOnLayer;
- (void)p_updateRenderedPageIndexes;
- (void)p_updateWithDelegate;
- (void)popDisableInfoUpdates;
- (void)pushDisableInfoUpdates;
- (void)setDelegate:(id)a3;
- (void)setDisableThreadedLayoutAndRenderDuringAnimation:(BOOL)a3;
- (void)setFrame:(CGRect)a3 scale:(double)a4;
- (void)setImmediatePressGesture:(id)a3;
- (void)setLoadedPageRange:(_NSRange)a3;
- (void)setMayPassScrollEventsToNextResponder:(BOOL)a3;
- (void)setMinimizeInfoChange:(BOOL)a3;
- (void)setNeedRestore:(BOOL)a3;
- (void)setPadInfos:(BOOL)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setPageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setPageOffset:(unint64_t)a3;
- (void)setPreloadPageIndex:(unint64_t)a3;
- (void)setRasterize:(BOOL)a3;
- (void)setTargetVisibleRect:(CGRect)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setupImmediatePressGesture;
- (void)setupImmediatePressGestureWithSimultaneousGestures:(id)a3;
- (void)teardownController;
- (void)teardownView;
- (void)updateInfosToDisplay;
@end

@implementation THWPagedCanvasController

- (THWPagedCanvasController)initWithDocumentRoot:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THWPagedCanvasController;
  v3 = [(THWPagedCanvasController *)&v8 init];
  if (v3)
  {
    objc_opt_class();
    id v4 = (id)TSUDynamicCast();
    *(_OWORD *)(v3 + 136) = xmmword_3447B0;
    CGSize size = CGRectNull.size;
    *(CGPoint *)(v3 + 152) = CGRectNull.origin;
    *((void *)v3 + 6) = v4;
    *(CGSize *)(v3 + 168) = size;
    *((void *)v3 + 12) = 0x7FFFFFFFFFFFFFFFLL;
    *((int64x2_t *)v3 + 7) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v3[42] = 1;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v3 + 2) = dispatch_queue_create("com.apple.iBooks.PagedCanvasRasterize", v6);
    v3[44] = 1;
  }
  return (THWPagedCanvasController *)v3;
}

- (THWPagedCanvasController)init
{
  return [(THWPagedCanvasController *)self initWithDocumentRoot:0];
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_rasterizeQueue);
  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasController;
  [(THWPagedCanvasController *)&v3 dealloc];
}

- (void)invalidateViews
{
  if (+[NSThread isMainThread] && !self->_scrollView)
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    [(TSDInteractiveCanvasController *)interactiveCanvasController invalidateRepsIfSynced];
  }
}

- (id)bookNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(THWPagedCanvasControllerDelegate *)delegate bookNavigationForPagedCanvasController:self];
}

- (id)documentNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(THWPagedCanvasControllerDelegate *)delegate documentNavigatorForPagedCanvasController:self];
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  if (self->_wrapperView) {
    return 0;
  }
  p_scrollView = &self->_scrollView;
  if (self->_scrollView) {
    return 0;
  }
  if (self->_layerHost) {
    return 0;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(THWPagedCanvasControllerDelegate *)self->_delegate pagedCanvasControllerDeferViewCreation:self])return 0; {
  [(THWPagedCanvasController *)self pushDisableInfoUpdates];
  }
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  THCanvasAndScrollViewCreateWithClass(self, (id *)&self->_interactiveCanvasController, (id *)&self->_layerHost, p_scrollView, v13, 0, v14);
  if (self->_clippingLayerHost)
  {
    unint64_t v15 = [(THWPagedCanvasController *)self pageIndex];
    [(THWClippingLayerHost *)self->_clippingLayerHost setInteractiveCanvasController:0];
    [(THWClippingLayerHost *)self->_clippingLayerHost teardownAndTransferCanvasLayersToHost:[(THWPagedCanvasController *)self layerHost]];

    self->_clippingLayerHost = 0;
  }
  else
  {
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v11 = 1;
  [(THScrollView *)self->_scrollView setPagingEnabled:1];
  v16 = [objc_alloc((Class)UIView) initWithFrame:x, y, width, height];
  self->_wrapperView = v16;
  [(UIView *)v16 addSubview:self->_scrollView];
  [(THScrollView *)self->_scrollView hideScrollIndicators];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController disableAllGestures];
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 0);
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:0];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setAllowLayoutAndRenderOnThread:1];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setCreateRepsForOffscreenLayouts:1];
  -[THWPagedCanvasController p_setFrame:scale:pageIndex:](self, "p_setFrame:scale:pageIndex:", v15, x, y, width, height, a4);
  [(THWPagedCanvasController *)self p_updateWithDelegate];
  [(THWPagedCanvasController *)self popDisableInfoUpdates];
  [(THWPagedCanvasController *)self p_updateRasterizeOnLayer];
  return v11;
}

- (void)p_updateWithDelegate
{
  if (self->_delegate)
  {
    if (self->_scrollView)
    {
      if (objc_opt_respondsToSelector())
      {
        id v3 = [(THWPagedCanvasControllerDelegate *)self->_delegate pagedCanvasController:self shouldDisableScrollingAtContentEdgesForScrollView:self->_scrollView];
        self->_mayPassScrollEventsToNextResponder = (char)v3;
        [(THScrollView *)self->_scrollView setMayPassScrollEventsToNextResponder:v3];
      }
      if (objc_opt_respondsToSelector()) {
        [(THScrollView *)self->_scrollView setShouldDisableScrollingWhenCursorIsHidden:[(THWPagedCanvasControllerDelegate *)self->_delegate pagedCanvasController:self shouldDisableScrollingWhenCursorIsHiddenForScrollView:self->_scrollView]];
      }
    }
    [(THWPagedCanvasController *)self p_rebuildContentSize];
    if (objc_opt_respondsToSelector()) {
      [(THWPagedCanvasControllerDelegate *)self->_delegate pagedCanvasController:self customizeLayerHost:[(TSDInteractiveCanvasController *)self->_interactiveCanvasController layerHost]];
    }
    [(THWPagedCanvasController *)self p_updateContentsScale];
    [(THWPagedCanvasController *)self p_rebuild];
    interactiveCanvasController = self->_interactiveCanvasController;
    [(TSDInteractiveCanvasController *)interactiveCanvasController layoutIfNeeded];
  }
}

- (void)p_updateContentsScale
{
  if (self->_clippingLayerHost)
  {
    id v3 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvas];
    [(THWPagedCanvasControllerDelegate *)self->_delegate pagedCanvasControllerContentsScale:self];
    [v3 i_setContentsScale:];
  }
}

- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
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
  -[THWPagedCanvasController setFrame:scale:](self, "setFrame:scale:", x, y, width, height, a4);
  [(THWPagedCanvasController *)self p_updateWithDelegate];
  [(THWPagedCanvasController *)self p_updateRasterizeOnLayer];
  return v5;
}

- (CALayer)alternateLayerForView
{
  return [(THWClippingLayerHost *)self->_clippingLayerHost layer];
}

- (double)p_verticalOverflow
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  delegate = self->_delegate;

  [(THWPagedCanvasControllerDelegate *)delegate pagedCanvasControllerVerticalOverflow:self];
  return result;
}

- (double)p_adjustScale:(double)a3 andFrame:(CGRect *)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a3;
  }
  delegate = self->_delegate;

  [(THWPagedCanvasControllerDelegate *)delegate pagedCanvasController:self adjustScale:a4 andFrame:a3];
  return result;
}

- (void)setFrame:(CGRect)a3 scale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v10 = [(THWPagedCanvasController *)self pageIndex];

  -[THWPagedCanvasController p_setFrame:scale:pageIndex:](self, "p_setFrame:scale:pageIndex:", v10, x, y, width, height, a4);
}

- (void)p_setFrame:(CGRect)a3 scale:(double)a4 pageIndex:(unint64_t)a5
{
  CGRect v36 = a3;
  [(THWPagedCanvasController *)self p_adjustScale:&v36 andFrame:a4];
  double v8 = v7;
  if (self->_clippingLayerHost)
  {
    [(THWPagedCanvasController *)self p_verticalOverflow];
    *(float *)&double v9 = v8 * v9;
    CGRect v36 = CGRectInset(v36, 0.0, -ceilf(*(float *)&v9));
    [(CALayer *)[(THWClippingLayerHost *)self->_clippingLayerHost clippingLayer] bounds];
    double v11 = v10;
    double v13 = v12;
    -[THWClippingLayerHost setFrame:](self->_clippingLayerHost, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    [(CALayer *)[(THWClippingLayerHost *)self->_clippingLayerHost clippingLayer] bounds];
    if (v11 != v15 || v13 != v14)
    {
      interactiveCanvasController = self->_interactiveCanvasController;
      double x = v36.origin.x;
      double y = v36.origin.y;
      double width = v36.size.width;
      double height = v36.size.height;
      double v22 = v8;
LABEL_7:
      -[TSDInteractiveCanvasController setViewScale:andScrollViewFrame:maintainPosition:animated:](interactiveCanvasController, "setViewScale:andScrollViewFrame:maintainPosition:animated:", 0, 0, v22, x, y, width, height);
      [(THWPagedCanvasController *)self p_rebuildWithPageIndex:a5];
    }
  }
  else if (self->_wrapperView)
  {
    if (self->_scrollView)
    {
      if (+[NSThread isMainThread])
      {
        [(THWPagedCanvasController *)self p_verticalOverflow];
        *(float *)&double v23 = v8 * v23;
        CGRect v37 = CGRectInset(v36, 0.0, -ceilf(*(float *)&v23));
        CGRect v36 = v37;
        -[UIView setFrame:](self->_wrapperView, "setFrame:", *(void *)&v37.origin.x, *(void *)&v37.origin.y, *(void *)&v37.size.width, *(void *)&v37.size.height);
        TSDRectWithSize();
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        [(THScrollView *)self->_scrollView frame];
        v39.origin.double x = v32;
        v39.origin.double y = v33;
        v39.size.double width = v34;
        v39.size.double height = v35;
        v38.origin.double x = v25;
        v38.origin.double y = v27;
        v38.size.double width = v29;
        v38.size.double height = v31;
        if (!CGRectEqualToRect(v38, v39))
        {
          interactiveCanvasController = self->_interactiveCanvasController;
          double v22 = v8;
          double x = v25;
          double y = v27;
          double width = v29;
          double height = v31;
          goto LABEL_7;
        }
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWPagedCanvasControllerDelegate *)a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  BOOL v5 = sub_159014;
  v6 = &unk_456DE0;
  double v7 = self;
  if (+[NSThread isMainThread])
  {
    v5((uint64_t)v4);
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_15901C;
    v3[3] = &unk_457868;
    v3[4] = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (unint64_t)pageIndex
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController visibleBoundsRect];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  if (CGRectIsEmpty(v12)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v13);
  double pageOffset = (double)self->_pageOffset;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v10 = MidX + pageOffset * CGRectGetWidth(v14);
  if (v10 >= 0.0)
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double v11 = (char *)(v10 / CGRectGetWidth(v15));
  }
  else
  {
    double v11 = 0;
  }
  if (v11 <= (char *)[(THWPagedCanvasControllerDelegate *)[(THWPagedCanvasController *)self delegate] pageCountForPagedCanvasController:self]- 1)return (unint64_t)v11; {
  else
  }
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(THWPagedCanvasController *)self scrollView];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController visibleBoundsRect];
  if (self->_clippingLayerHost)
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](interactiveCanvasController, "layerHost"), "canvasLayer"), "unscaledSize");
    -[TSDInteractiveCanvasController convertUnscaledToBoundsSize:](interactiveCanvasController, "convertUnscaledToBoundsSize:");
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController visibleBoundsRect];
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    CGRectGetWidth(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGRectGetWidth(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRectGetWidth(v31);
    TSUClamp();
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
    TSDRectWithOriginAndSize();
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "setBounds:", v16, v17, v18, v19);
    [(THWPagedCanvasController *)self p_updateInfosToDisplay];
  }
  else if (v6)
  {
    CGFloat v20 = v7;
    CGFloat v21 = v8;
    CGFloat v22 = v9;
    CGFloat v23 = v10;
    if (!CGRectIsEmpty(*(CGRect *)&v7))
    {
      [(THScrollView *)v6 contentSize];
      v32.origin.CGFloat x = v20;
      v32.origin.CGFloat y = v21;
      v32.size.CGFloat width = v22;
      v32.size.CGFloat height = v23;
      CGRectGetWidth(v32);
      v33.origin.CGFloat x = v20;
      v33.origin.CGFloat y = v21;
      v33.size.CGFloat width = v22;
      v33.size.CGFloat height = v23;
      CGRectGetWidth(v33);
      v34.origin.CGFloat x = v20;
      v34.origin.CGFloat y = v21;
      v34.size.CGFloat width = v22;
      v34.size.CGFloat height = v23;
      CGRectGetWidth(v34);
      TSUClamp();
      double v25 = v24;
      [(THScrollView *)v6 contentOffset];
      if (v25 != v27 || v26 != 0.0)
      {
        -[THScrollView setContentOffset:animated:](v6, "setContentOffset:animated:", v4, v25, 0.0);
      }
    }
  }
}

- (void)setPageIndex:(unint64_t)a3
{
}

- (void)setMinimizeInfoChange:(BOOL)a3
{
  if (self->_minimizeInfoChange != a3)
  {
    self->_minimizeInfoChange = a3;
    if (!a3) {
      [(THWPagedCanvasController *)self p_updateInfosToDisplayForced:1];
    }
  }
}

- (void)setPadInfos:(BOOL)a3
{
  if (self->_padInfos != a3)
  {
    self->_padInfos = a3;
    [(THWPagedCanvasController *)self p_updateInfosToDisplayForced:1];
  }
}

- (void)teardownController
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController teardown];
  clippingLayerHost = self->_clippingLayerHost;

  [(THWClippingLayerHost *)clippingLayerHost teardown];
}

- (void)teardownView
{
  [(THScrollView *)self->_scrollView setDelegate:0];
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
  BOOL v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      CGFloat v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        double v8 = (void *)TSUDynamicCast();
        if (v8)
        {
          double v9 = v8;
          [v8 invalidateFrame];
          [v9 invalidateChildren];
        }
        ++v7;
      }
      while (v5 != v7);
      BOOL v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)updateInfosToDisplay
{
}

- (void)p_updateInfosToDisplay
{
}

- (void)p_updateInfosToDisplayForced:(BOOL)a3
{
  BOOL v5 = [(THWPagedCanvasController *)self delegate];
  if (v5)
  {
    uint64_t v6 = v5;
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self interactiveCanvasController] visibleBoundsRect];
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    CGRect v48 = CGRectUnion(v47, self->_targetVisibleRect);
    CGFloat v11 = v48.origin.x;
    CGFloat v45 = v48.origin.y;
    CGFloat v12 = v48.size.width;
    CGFloat v13 = v48.size.height;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
    double v14 = CGRectGetWidth(v49);
    if (v14 > 0.0)
    {
      double v15 = v14;
      id v16 = [(THWPagedCanvasControllerDelegate *)v6 pageCountForPagedCanvasController:self];
      if (v16)
      {
        NSUInteger v17 = (NSUInteger)v16;
        v50.origin.CGFloat x = x;
        v50.origin.CGFloat y = y;
        v50.size.CGFloat width = width;
        v50.size.CGFloat height = height;
        unint64_t v18 = (unint64_t)(fmax(CGRectGetMinX(v50), 0.0) / v15 + (double)self->_pageOffset);
        v51.origin.CGFloat x = x;
        v51.origin.CGFloat y = y;
        v51.size.CGFloat width = width;
        v51.size.CGFloat height = height;
        unint64_t v19 = (unint64_t)(fmax(CGRectGetMaxX(v51) + -1.0, 0.0) / v15 + (double)self->_pageOffset) - v18;
        v52.origin.CGFloat x = v11;
        v52.origin.CGFloat y = v45;
        v52.size.CGFloat width = v12;
        v52.size.CGFloat height = v13;
        unint64_t v20 = (unint64_t)(fmax(CGRectGetMinX(v52), 0.0) / v15 + (double)self->_pageOffset);
        v53.origin.CGFloat x = v11;
        v53.origin.CGFloat y = v45;
        v53.size.CGFloat width = v12;
        v53.size.CGFloat height = v13;
        double v21 = fmax(CGRectGetMaxX(v53) + -1.0, 0.0) / v15 + (double)self->_pageOffset;
        unint64_t v22 = v20 - 1;
        if (!v20) {
          unint64_t v22 = 0;
        }
        if (v17 >= v22) {
          NSUInteger v23 = v22;
        }
        else {
          NSUInteger v23 = v17;
        }
        unint64_t v24 = (unint64_t)v21 + 2;
        if (v24 >= v17) {
          unint64_t v24 = v17;
        }
        unint64_t v46 = v24;
        NSUInteger v25 = v24 - v23;
        double v26 = +[TSUPointerSet setWithArray:[(TSDInteractiveCanvasController *)self->_interactiveCanvasController infosToDisplay]];
        if (self->_padInfos) {
          NSUInteger v27 = v23;
        }
        else {
          NSUInteger v27 = v18;
        }
        if (!self->_padInfos) {
          NSUInteger v25 = v19 + 1;
        }
        if (!self->_minimizeInfoChange || ((NSUInteger v28 = v19 + 1, v27 == v18) ? (v29 = v25 == v28) : (v29 = 0), v29))
        {
          BOOL v33 = v27 != 0x7FFFFFFFFFFFFFFFLL && a3;
          if (!v33
            && (v27 == self->_loadedPageRange.location ? (BOOL v34 = v25 == self->_loadedPageRange.length) : (BOOL v34 = 0), v34))
          {
            id v31 = 0;
            unsigned int v32 = 0;
          }
          else
          {
            id v31 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v27, v25);
            unsigned int v32 = 1;
          }
        }
        else
        {
          CGRect v30 = v26;
          id v31 = [-[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v27, v25) tsu_arrayWithObjectsInSet: -[TSUPointerSet setByAddingObjectsFromArray:](v26, "setByAddingObjectsFromArray:", -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v18, v28))];
          unsigned int v32 = [+[TSUPointerSet setWithArray:v31] isEqualToSet:v30] ^ 1;
          NSUInteger v27 = v18;
          NSUInteger v25 = v28;
        }
        preloadPageIndeCGFloat x = self->_preloadPageIndex;
        if (preloadPageIndex == 0x7FFFFFFFFFFFFFFFLL) {
          unsigned int v36 = 0;
        }
        else {
          unsigned int v36 = v32;
        }
        if ((self->_preloadedPageIndex != preloadPageIndex || v36)
          && ((self->_preloadedPageIndeCGFloat x = preloadPageIndex, preloadPageIndex >= v27)
            ? (BOOL v37 = preloadPageIndex - v27 >= v25)
            : (BOOL v37 = 1),
              v37))
        {
          if (!v31)
          {
            id v31 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v27, v25);
            preloadPageIndeCGFloat x = self->_preloadedPageIndex;
          }
          if (preloadPageIndex == 0x7FFFFFFFFFFFFFFFLL) {
            id v38 = 0;
          }
          else {
            id v38 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, preloadPageIndex, 1);
          }
          if ([v38 count])
          {
            preloadedPageIndeCGFloat x = self->_preloadedPageIndex;
            if (preloadedPageIndex >= v23) {
              unint64_t v40 = v23;
            }
            else {
              unint64_t v40 = self->_preloadedPageIndex;
            }
            if (preloadedPageIndex + 1 > v46) {
              unint64_t v41 = preloadedPageIndex + 1;
            }
            else {
              unint64_t v41 = v46;
            }
            if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v42 = preloadedPageIndex + 1;
            }
            else {
              unint64_t v42 = v41;
            }
            id v43 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v40, v42 - v40);
            id v44 = [objc_alloc((Class)TSUMutablePointerSet) initWithArray:v31];
            [v44 addObjectsFromArray:v38];
            id v31 = [v43 tsu_arrayWithObjectsInSet:v44];
          }
        }
        else if (!v32)
        {
          return;
        }
        if (self->_delegate && !self->_disableInfoUpdates)
        {
          if (objc_opt_respondsToSelector()) {
            [(THWPagedCanvasControllerDelegate *)v6 pagedCanvasController:self willUpdateWithInfosToDisplay:v31];
          }
          [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self interactiveCanvasController] setInfosToDisplay:v31];
          self->_loadedPageRange.location = v27;
          self->_loadedPageRange.length = v25;
        }
      }
    }
  }
}

- (void)p_updateRenderedPageIndexes
{
  id v3 = [(THWPagedCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {

    self->_renderedPageIndexes = (NSIndexSet *)-[THWPagedCanvasControllerDelegate pagedCanvasController:renderedPageIndexSetFromReps:](v3, "pagedCanvasController:renderedPageIndexSetFromReps:", self, objc_msgSend(-[TSDInteractiveCanvasController canvas](self->_interactiveCanvasController, "canvas"), "topLevelReps"));
  }
}

- (void)p_rebuild
{
}

- (void)p_rebuildContentSize
{
  id v3 = [(THWPagedCanvasController *)self delegate];
  if (v3)
  {
    BOOL v4 = v3;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
    -[TSDInteractiveCanvasController convertBoundsToUnscaledSize:](self->_interactiveCanvasController, "convertBoundsToUnscaledSize:", v5, v6);
    double height = v7;
    double width = v9
          * (double)(unint64_t)[(THWPagedCanvasControllerDelegate *)v4 pageCountForPagedCanvasController:self];
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  id v11 = [[-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController") layerHost] canvasLayer];

  [v11 setUnscaledSize:width height];
}

- (void)p_rebuildWithPageIndex:(unint64_t)a3
{
  [(THWPagedCanvasController *)self p_rebuildContentSize];
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
  CATransform3DMakeTranslation(&v8, -(v5 * (double)self->_pageOffset), 0.0, 0.0);
  id v6 = [(-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController")) layerHost].layer;
  CATransform3D v7 = v8;
  [v6 setSublayerTransform:&v7];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    [(THWPagedCanvasController *)self setPageIndex:a3 animated:0];
  }
  [(THWPagedCanvasController *)self p_updateInfosToDisplay];
}

- (void)p_updateMostVisiblePageIndex
{
  unint64_t v3 = [(THWPagedCanvasController *)self pageIndex];
  mostVisiblePageIndeCGFloat x = self->_mostVisiblePageIndex;
  if (v3 != mostVisiblePageIndex)
  {
    unint64_t v5 = v3;
    self->_mostVisiblePageIndeCGFloat x = v3;
    id v6 = [(THWPagedCanvasController *)self delegate];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL && mostVisiblePageIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      CATransform3D v7 = v6;
      if (objc_opt_respondsToSelector())
      {
        unint64_t v8 = self->_mostVisiblePageIndex;
        [(THWPagedCanvasControllerDelegate *)v7 pagedCanvasController:self mostVisiblePageChangedToPageIndex:v8];
      }
    }
  }
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)allowCopy
{
  return 0;
}

- (BOOL)allowHighlighting
{
  return 0;
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  self->_targetVisibleRect = a4;
  if (self->_disableThreadedLayoutAndRenderDuringAnimation) {
    [a3 pushThreadedLayoutAndRenderDisabled];
  }

  [(THWPagedCanvasController *)self p_updateInfosToDisplay];
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  if (!a4)
  {
    CGSize size = CGRectNull.size;
    self->_targetVisibleRect.origin = CGRectNull.origin;
    self->_targetVisibleRect.CGSize size = size;
  }
  if (self->_disableThreadedLayoutAndRenderDuringAnimation) {
    [a3 popThreadedLayoutAndRenderDisabled];
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0) {
    [(THWPagedCanvasController *)self p_updateInfosToDisplay];
  }
  [(THWPagedCanvasController *)self p_updateMostVisiblePageIndex];
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(THWPagedCanvasControllerDelegate *)delegate pagedCanvasControllerDidScroll:self];
  }
}

- (id)p_enclosingInteractiveCanvasController
{
  objc_opt_class();
  objc_opt_class();
  [self->_scrollView superview].superview;
  [(id)TSUDynamicCast() controller];

  return (id)TSUDynamicCast();
}

- (CGPoint)interactiveCanvasController:(id)a3 restrictedContentOffset:(CGPoint)a4 forViewScale:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  if ([(TSDInteractiveCanvasController *)self->_interactiveCanvasController currentlyScrolling])
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(THWPagedCanvasControllerDelegate *)self->_delegate pagedCanvasControllerRestrictVisibleToRenderedContent:self])
      {
        if (self->_renderedPageIndexes)
        {
          if ([(THWPagedCanvasController *)self pageIndex])
          {
            unint64_t v8 = [(THWPagedCanvasController *)self pageIndex];
            if (v8 < (char *)[(THWPagedCanvasControllerDelegate *)self->_delegate pageCountForPagedCanvasController:self]- 1)
            {
              [(TSDInteractiveCanvasController *)self->_interactiveCanvasController visibleUnscaledRect];
              double width = v24.size.width;
              CGFloat height = v24.size.height;
              double pageOffset = (double)self->_pageOffset;
              v24.origin.CGFloat x = x;
              v24.origin.CGFloat y = y;
              uint64_t v12 = (uint64_t)(CGRectGetMinX(v24) / v24.size.width + pageOffset);
              double v13 = (double)self->_pageOffset;
              v25.origin.CGFloat x = x;
              v25.origin.CGFloat y = y;
              v25.size.double width = width;
              v25.size.CGFloat height = height;
              uint64_t v14 = (uint64_t)((CGRectGetMaxX(v25) + -1.0) / width + v13);
              if (v12 <= v14)
              {
                uint64_t v15 = v14 + 1;
                uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
                do
                {
                  unsigned int v18 = [(NSIndexSet *)self->_renderedPageIndexes containsIndex:v12];
                  if ((v18 & (v17 == 0x7FFFFFFFFFFFFFFFLL)) != 0) {
                    uint64_t v17 = v12;
                  }
                  if (v18) {
                    uint64_t v16 = v12;
                  }
                  ++v12;
                }
                while (v15 != v12);
                if (v17 != 0x7FFFFFFFFFFFFFFFLL && v16 != 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_21;
                }
              }
              if ([(NSIndexSet *)self->_renderedPageIndexes count])
              {
                [(NSIndexSet *)self->_renderedPageIndexes firstIndex];
                [(NSIndexSet *)self->_renderedPageIndexes lastIndex];
LABEL_21:
                TSUClamp();
                CGFloat x = v20;
              }
            }
          }
        }
      }
    }
  }
  double v21 = x;
  double v22 = y;
  result.CGFloat y = v22;
  result.CGFloat x = v21;
  return result;
}

- (void)interactiveCanvasControllerWillScroll:(id)a3
{
  if (!self->_currentlyScrolling)
  {
    [self p_enclosingInteractiveCanvasController] embeddedCanvasWillBeginScrolling];
    self->_currentlyScrolling = 1;
    unint64_t v4 = [(THWPagedCanvasController *)self pageIndex];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v5 = v4;
      id v6 = [(THWPagedCanvasController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        [(THWPagedCanvasControllerDelegate *)v6 pagedCanvasController:self willScrollFromPageIndex:v5];
      }
    }
  }
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  if (self->_currentlyScrolling)
  {
    self->_currentlyScrolling = 0;
    [self p_enclosingInteractiveCanvasController:a3].embeddedCanvasDidEndScrolling;
  }
  unint64_t v4 = [(THWPagedCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THWPagedCanvasControllerDelegate *)v4 pagedCanvasControllerDidStopScrolling:self];
  }
  if (v4)
  {
    unint64_t v5 = [(THWPagedCanvasController *)self pageIndex];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      [(THWPagedCanvasControllerDelegate *)v4 pagedCanvasController:self didScrollToPageIndex:v5];
    }
  }

  [(THWPagedCanvasController *)self p_updateMostVisiblePageIndex];
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  id v6 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v6 pagedCanvasController:self geometryProviderForLayout:a4];
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  unint64_t v8 = [(THWPagedCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    return [(THWPagedCanvasControllerDelegate *)v8 pagedCanvasController:self delegateConformingToProtocol:a4 forRep:a5];
  }
  else if ([(THWPagedCanvasControllerDelegate *)v8 conformsToProtocol:a4])
  {
    return v8;
  }
  else
  {
    return 0;
  }
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  unint64_t v5 = [(THWPagedCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THWPagedCanvasControllerDelegate *)v5 pagedCanvasControllerDidLayout:self];
  }
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
  {
    [(THWPagedCanvasController *)self p_updateRenderedPageIndexes];
  }
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  unint64_t v5 = [(THWPagedCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(THWPagedCanvasControllerDelegate *)v5 pagedCanvasControllerDidLayoutAndRenderOnBackgroundThread:self];
  }
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
  {
    [(THWPagedCanvasController *)self p_updateInfosToDisplay];
    [(THWPagedCanvasController *)self p_updateRenderedPageIndexes];
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForScrollViewHitTesting:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(THWPagedCanvasController *)self p_verticalOverflow];
  double v11 = v10;
  [a3 viewScale];
  *(float *)&double v12 = v11 * v12;
  CGFloat v13 = ceilf(*(float *)&v12);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectInset(v26, 0.0, v13);
  double v14 = v27.origin.x;
  double v15 = v27.origin.y;
  double v16 = v27.size.width;
  double v17 = v27.size.height;
  [(THWPagedCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    -[THWPagedCanvasControllerDelegate pagedCanvasController:expandBoundsForScrollViewHitTesting:]([(THWPagedCanvasController *)self delegate], "pagedCanvasController:expandBoundsForScrollViewHitTesting:", self, v14, v15, v16, v17);
    double v14 = v18;
    double v15 = v19;
    double v16 = v20;
    double v17 = v21;
  }
  double v22 = v14;
  double v23 = v15;
  double v24 = v16;
  double v25 = v17;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  double x = CGRectInfinite.origin.x;
  double y = CGRectInfinite.origin.y;
  double width = CGRectInfinite.size.width;
  double height = CGRectInfinite.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  id v6 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v6 pagedCanvasController:self primaryTargetForGesture:a4];
}

- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  [(THWPagedCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v6 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v6 pagedCanvasController:self canvasViewShouldBecomeFirstResponder:a4];
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  id v6 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v6 pagedCanvasController:self allowsEditMenuForRep:a4];
}

- (BOOL)interactiveCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  unint64_t v8 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v8 pagedCanvasController:self allowsHyperlinkWithGesture:a4 forRep:a5];
}

- (BOOL)allowSelectionPopoverForInteractiveCanvasController:(id)a3
{
  unint64_t v4 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v4 allowSelectionPopoverForPagedCanvasController:self];
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  unint64_t v8 = [(THWPagedCanvasController *)self delegate];

  return [(THWPagedCanvasControllerDelegate *)v8 pagedCanvasController:self shouldBeginEditingTHWPRep:a4 withGesture:a5];
}

- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds
{
  return 1;
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
  unint64_t v4 = [(THWPagedCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWPagedCanvasControllerDelegate *)v4 pagedCanvasControllerIsRelatedCanvasScrolling:self];
}

- (void)setupImmediatePressGestureWithSimultaneousGestures:(id)a3
{
  if ([(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvasView])
  {
    uint64_t v5 = TSWPImmediatePress;
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController enableGestureKinds:+[NSArray arrayWithObject:TSWPImmediatePress]];
    id v6 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController gestureRecognizerWithKind:v5];
    [self->_interactiveCanvasController.gestureDispatcher allowSimultaneousRecognitionByRecognizers:v6, self->_scrollView.panGestureRecognizer, 0];
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
        double v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(a3);
          }
          [self->_interactiveCanvasController gestureDispatcher] allowSimultaneousRecognitionByRecognizers:v6, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), 0);
          double v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setupImmediatePressGesture
{
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [self->_interactiveCanvasController.canvasView setUserInteractionEnabled:a3];
  [(THScrollView *)self->_scrollView setUserInteractionEnabled:v3];
  [(THScrollView *)self->_scrollView setScrollEnabled:v3];
  wrapperView = self->_wrapperView;

  [(UIView *)wrapperView setUserInteractionEnabled:v3];
}

- (BOOL)userInteractionEnabled
{
  id v2 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvasView];

  return [v2 isUserInteractionEnabled];
}

- (void)setPreloadPageIndex:(unint64_t)a3
{
  if (self->_preloadPageIndex != a3)
  {
    self->_preloadPageIndedouble x = a3;
    [(THWPagedCanvasController *)self p_updateInfosToDisplay];
  }
}

- (void)setPageOffset:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL
    && self->_pageOffset != a3
    && (unint64_t)[(THWPagedCanvasControllerDelegate *)self->_delegate pageCountForPagedCanvasController:self] > a3)
  {
    unint64_t v5 = [(THWPagedCanvasController *)self pageIndex];
    self->_double pageOffset = a3;
    [(THWPagedCanvasController *)self p_rebuildWithPageIndex:v5];
  }
}

- (void)p_updateRasterizeOnLayer
{
  BOOL rasterize = self->_rasterize;
  clippingLayerHost = self->_clippingLayerHost;
  if (clippingLayerHost) {
    unint64_t v5 = [(THWClippingLayerHost *)clippingLayerHost clippingLayer];
  }
  else {
    unint64_t v5 = [(UIView *)self->_wrapperView layer];
  }
  rasterizeQueue = self->_rasterizeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15A908;
  block[3] = &unk_458E48;
  block[4] = v5;
  block[5] = self;
  BOOL v8 = rasterize;
  dispatch_async(rasterizeQueue, block);
}

- (void)setRasterize:(BOOL)a3
{
  if (self->_rasterize != a3)
  {
    self->_BOOL rasterize = a3;
    [(THWPagedCanvasController *)self p_updateRasterizeOnLayer];
  }
}

- (void)pushDisableInfoUpdates
{
}

- (void)popDisableInfoUpdates
{
  unint64_t disableInfoUpdates = self->_disableInfoUpdates;
  if (disableInfoUpdates)
  {
    unint64_t v3 = disableInfoUpdates - 1;
    self->_unint64_t disableInfoUpdates = v3;
    if (!v3) {
      [(THWPagedCanvasController *)self p_updateInfosToDisplay];
    }
  }
}

- (void)forceStopScrollingAtCurrentPageIndex
{
  if (self->_currentlyScrolling)
  {
    [(THWPagedCanvasController *)self setPageIndex:[(THWPagedCanvasController *)self pageIndex] animated:0];
    unint64_t v3 = [(THWPagedCanvasController *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v3 forceStopScrolling];
  }
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (UIView)view
{
  return self->_wrapperView;
}

- (THScrollView)scrollView
{
  return self->_scrollView;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->_layerHost;
}

- (THWPagedCanvasControllerDelegate)delegate
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

- (BOOL)minimizeInfoChange
{
  return self->_minimizeInfoChange;
}

- (BOOL)padInfos
{
  return self->_padInfos;
}

- (unint64_t)preloadPageIndex
{
  return self->_preloadPageIndex;
}

- (unint64_t)pageOffset
{
  return self->_pageOffset;
}

- (BOOL)rasterize
{
  return self->_rasterize;
}

- (BOOL)disableThreadedLayoutAndRenderDuringAnimation
{
  return self->_disableThreadedLayoutAndRenderDuringAnimation;
}

- (void)setDisableThreadedLayoutAndRenderDuringAnimation:(BOOL)a3
{
  self->_disableThreadedLayoutAndRenderDuringAnimation = a3;
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

- (unint64_t)preloadedPageIndex
{
  return self->_preloadedPageIndex;
}

- (unint64_t)mostVisiblePageIndex
{
  return self->_mostVisiblePageIndex;
}

- (THWClippingLayerHost)clippingLayerHost
{
  return self->_clippingLayerHost;
}

- (BOOL)needRestore
{
  return self->_needRestore;
}

- (void)setNeedRestore:(BOOL)a3
{
  self->_needRestore = a3;
}

- (BOOL)mayPassScrollEventsToNextResponder
{
  return self->_mayPassScrollEventsToNextResponder;
}

- (void)setMayPassScrollEventsToNextResponder:(BOOL)a3
{
  self->_mayPassScrollEventsToNextResponder = a3;
}

@end