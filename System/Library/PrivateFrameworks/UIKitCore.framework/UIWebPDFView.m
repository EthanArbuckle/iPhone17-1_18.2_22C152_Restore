@interface UIWebPDFView
+ (void)initialize;
+ (void)setAsPDFDocRepAndView;
- (BOOL)_checkIfDocumentNeedsUnlock;
- (BOOL)_hasPageRects;
- (BOOL)_tryToUnlockDocumentWithPassword:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hideActivityIndicatorForUnRenderedContent;
- (BOOL)hidePageViewsUntilReadyToRender;
- (BOOL)readyForSnapshot;
- (CGAffineTransform)documentTransform;
- (CGPDFDocument)cgPDFDocument;
- (CGPDFPage)imageForContactRect:(CGFloat)a3 onPageInViewRect:(CGFloat)a4 destinationRect:(CGFloat)a5;
- (CGRect)_viewCachingBoundsInUIViewCoords;
- (CGRect)_viewportBoundsInUIVIewCoordsWithView:(id)a3;
- (CGRect)_viewportBoundsInUIViewCoords;
- (CGRect)documentBounds;
- (NSArray)pageMinYs;
- (NSArray)pageRects;
- (NSData)documentData;
- (NSString)documentPassword;
- (NSURL)documentURL;
- (UIColor)backgroundColorForUnRenderedContent;
- (UIWebPDFView)initWithWebPDFViewPlaceholder:(id)a3;
- (UIWebPDFViewDelegate)pdfDelegate;
- (WebPDFViewPlaceholder)pdfPlaceHolderView;
- (double)documentScale;
- (double)initialZoomScale;
- (id)_addPageAtIndex:(unint64_t)a3;
- (id)_installViewAtIndex:(int64_t)a3 inFrame:(CGRect)a4;
- (id)_pageWithSelection;
- (id)_selection;
- (id)uiPDFDocument;
- (id)viewAtIndex:(int64_t)a3;
- (id)viewportView;
- (int64_t)ignoreContentOffsetChanges;
- (unint64_t)_pageNumberForRect:(CGRect)a3;
- (unint64_t)firstVisiblePageNumber;
- (unint64_t)totalPages;
- (void)_addSubViewsInViewCoordsBounds:(CGRect)a3 force:(BOOL)a4;
- (void)_define:(id)a3;
- (void)_didLongPress:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToPageIndex:(unint64_t)a6;
- (void)_didLongPress:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToURL:(id)a6;
- (void)_didScroll;
- (void)_didTouch:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToPageIndex:(unint64_t)a6;
- (void)_didTouch:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToURL:(id)a6;
- (void)_recreateUIPDFDocument;
- (void)_removeBackgroundImageObserverIfNeeded:(id)a3;
- (void)_removePageViewsNotInCurrentViewCoordsRect;
- (void)_removePageViewsNotInViewCoordsRect:(CGRect)a3;
- (void)_scheduleRemovePageViewsNotInViewCoordsRect;
- (void)_share:(id)a3;
- (void)_tapGestureRecognized:(id)a3;
- (void)_translate:(id)a3;
- (void)annotation:(id)a3 isBeingPressedAtPoint:(CGPoint)a4 controller:(id)a5;
- (void)annotation:(id)a3 wasTouchedAtPoint:(CGPoint)a4 controller:(id)a5;
- (void)clearSelection;
- (void)dealloc;
- (void)didCompleteLayout;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)didRotate:(id)a3;
- (void)didZoom:(id)a3;
- (void)ensureCorrectPagesAreInstalled:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForSnapshot:(BOOL)a3;
- (void)resetZoom:(id)a3;
- (void)setBackgroundColorForUnRenderedContent:(id)a3;
- (void)setDocumentPassword:(id)a3;
- (void)setDocumentTransform:(CGAffineTransform *)a3;
- (void)setDocumentURL:(id)a3;
- (void)setHideActivityIndicatorForUnRenderedContent:(BOOL)a3;
- (void)setHidePageViewsUntilReadyToRender:(BOOL)a3;
- (void)setIgnoreContentOffsetChanges:(int64_t)a3;
- (void)setInitialZoomScale:(double)a3;
- (void)setPageMinYs:(id)a3;
- (void)setPageRects:(id)a3;
- (void)setPdfDelegate:(id)a3;
- (void)setPdfPlaceHolderView:(id)a3;
- (void)setReadyForSnapshot:(BOOL)a3;
- (void)snapshotComplete;
- (void)viewWillClose;
- (void)willRotate:(id)a3;
- (void)willScroll:(id)a3;
- (void)willZoom:(id)a3;
- (void)zoom:(id)a3 to:(CGRect)a4 atPoint:(CGPoint)a5 kind:(int)a6;
@end

@implementation UIWebPDFView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _UIApplicationLoadWebKit();
  }
}

- (void)setIgnoreContentOffsetChanges:(int64_t)a3
{
  int64_t ignoreContentOffsetChanges = self->_ignoreContentOffsetChanges;
  if (ignoreContentOffsetChanges <= 1) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = self->_ignoreContentOffsetChanges;
  }
  int64_t v5 = v4 - 1;
  if (a3) {
    int64_t v6 = ignoreContentOffsetChanges + 1;
  }
  else {
    int64_t v6 = v5;
  }
  self->_int64_t ignoreContentOffsetChanges = v6;
}

- (void)setPdfDelegate:(id)a3
{
  if (self->_pdfDelegate != a3)
  {
    self->_pdfDelegate = (UIWebPDFViewDelegate *)a3;
    self->_delegateRespondsToDidScroll = objc_opt_respondsToSelector() & 1;
  }
}

- (unint64_t)totalPages
{
  return [(UIPDFDocument *)self->_document numberOfPages];
}

- (BOOL)_hasPageRects
{
  return [(NSArray *)self->pageRects count] != 0;
}

- (CGPDFDocument)cgPDFDocument
{
  return self->_cgPDFDocument;
}

- (id)uiPDFDocument
{
  return self->_document;
}

- (NSData)documentData
{
  if (!self->_cgPDFDocument) {
    return 0;
  }
  DataProvider = (CGDataProvider *)CGPDFDocumentGetDataProvider();
  if (!DataProvider) {
    return 0;
  }
  CFDataRef v3 = CGDataProviderCopyData(DataProvider);
  return (NSData *)v3;
}

+ (void)setAsPDFDocRepAndView
{
}

- (UIWebPDFView)initWithWebPDFViewPlaceholder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)UIWebPDFView;
  int64_t v4 = [(UIView *)&v16 init];
  int64_t v5 = v4;
  if (v4)
  {
    v4->_initialZoomScale = 1.0;
    v4->_pageViews = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(UIWebPDFView *)v5 setBackgroundColorForUnRenderedContent:+[UIColor lightGrayColor]];
    [(UIWebPDFView *)v5 setPdfPlaceHolderView:a3];
    [(WebPDFViewPlaceholder *)[(UIWebPDFView *)v5 pdfPlaceHolderView] setDelegate:v5];
    if ([(WebPDFViewPlaceholder *)v5->pdfPlaceHolderView didCompleteLayout]) {
      [(UIWebPDFView *)v5 performSelector:sel_didCompleteLayout withObject:v5->pdfPlaceHolderView afterDelay:0.0];
    }
    int64_t v6 = [[UITapGestureRecognizer alloc] initWithTarget:v5 action:sel__tapGestureRecognized_];
    v5->_tapGestureRecognizer = v6;
    [(UIGestureRecognizer *)v6 setDelegate:v5];
    [(UIView *)v5 addGestureRecognizer:v5->_tapGestureRecognizer];
    v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel_willRotate_ name:@"UIWindowWillRotateNotification" object:0];
    [v7 addObserver:v5 selector:sel_didRotate_ name:@"UIWindowDidRotateNotification" object:0];
    [v7 addObserver:v5 selector:sel_willZoom_ name:@"UITextSelectionWillZoom" object:0];
    [v7 addObserver:v5 selector:sel_didZoom_ name:@"UITextSelectionDidZoom" object:0];
    [v7 addObserver:v5 selector:sel_willScroll_ name:@"UITextSelectionWillScroll" object:0];
    __asm { FMOV            V0.2D, #-1.0 }
    v5->_contentOffsetAtScrollStart = _Q0;
    v13 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v5->_documentTransform.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v14 = v13[1];
    *(_OWORD *)&v5->_documentTransform.a = *v13;
    *(_OWORD *)&v5->_documentTransform.c = v14;
    v5->_documentScale = 1.0;
  }
  return v5;
}

- (void)_removeBackgroundImageObserverIfNeeded:(id)a3
{
  if ([a3 observationInfo]) {
    [a3 removeObserver:self forKeyPath:@"backgroundImage"];
  }
}

- (void)dealloc
{
  v16[5] = *MEMORY[0x1E4F143B8];
  CFDataRef v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v16[0] = @"UIWindowWillRotateNotification";
  v16[1] = @"UIWindowDidRotateNotification";
  v16[2] = @"UITextSelectionWillZoom";
  v16[3] = @"UITextSelectionDidZoom";
  v16[4] = @"UITextSelectionWillScroll";
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5]);
  [(UIWebPDFView *)self setPageRects:0];
  [(UIWebPDFView *)self setPageMinYs:0];

  [(WebPDFViewPlaceholder *)[(UIWebPDFView *)self pdfPlaceHolderView] setDelegate:0];
  [(UIWebPDFView *)self setPdfPlaceHolderView:0];
  [(UIWebPDFView *)self setDocumentURL:0];
  [(UIWebPDFView *)self setDocumentPassword:0];
  CGPDFDocumentRelease(self->_cgPDFDocument);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  pageViews = self->_pageViews;
  uint64_t v5 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(pageViews);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 setDelegate:0];
        [(UIWebPDFView *)self _removeBackgroundImageObserverIfNeeded:v9];
      }
      uint64_t v6 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(UIWebPDFView *)self setBackgroundColorForUnRenderedContent:0];
  v10.receiver = self;
  v10.super_class = (Class)UIWebPDFView;
  [(UIView *)&v10 dealloc];
}

- (id)viewAtIndex:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  pageViews = self->_pageViews;
  uint64_t v5 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  int64_t v7 = a3 + 1000000;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(pageViews);
    }
    objc_super v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 tag] == v7) {
      return v10;
    }
    if (v6 == ++v9)
    {
      uint64_t v6 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)viewportView
{
  CFDataRef v3 = [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return self;
  }
}

- (CGRect)_viewportBoundsInUIVIewCoordsWithView:(id)a3
{
  [a3 bounds];
  objc_msgSend(a3, "convertRect:toView:", self);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_viewportBoundsInUIViewCoords
{
  id v3 = [(UIWebPDFView *)self viewportView];
  [(UIWebPDFView *)self _viewportBoundsInUIVIewCoordsWithView:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_viewCachingBoundsInUIViewCoords
{
  double initialZoomScale = self->_initialZoomScale;
  id v4 = [(UIWebPDFView *)self viewportView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 zoomScale];
    double initialZoomScale = v5;
  }
  double v6 = initialZoomScale / self->_initialZoomScale * 3.0;
  [(UIWebPDFView *)self _viewportBoundsInUIVIewCoordsWithView:v4];
  double v11 = v9 - v10;
  double v12 = v6 * v10;
  result.size.height = v12;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v7;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"backgroundImage"])
  {
    double v11 = (void *)[a5 objectForKey:*MEMORY[0x1E4F284C8]];
    if ((objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      long long v13 = __63__UIWebPDFView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      long long v14 = &unk_1E52EBA80;
      id v15 = a4;
      objc_super v16 = self;
      if (pthread_main_np() == 1) {
        v13((uint64_t)v12);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v12);
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIWebPDFView;
    [(UIWebPDFView *)&v17 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

uint64_t __63__UIWebPDFView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 40) _removeBackgroundImageObserverIfNeeded:*(void *)(a1 + 32)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(*(void *)(a1 + 40) + 600);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      double v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
      if (v7 != *(void **)(a1 + 32))
      {
        uint64_t result = [v7 backgroundImage];
        if (!result) {
          break;
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    [*(id *)(a1 + 40) setReadyForSnapshot:1];
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"UIWebPDFViewReadyForSnapshotNotification", *(void *)(a1 + 40));
  }
  return result;
}

- (id)_installViewAtIndex:(int64_t)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v10 = -[UIWebPDFView viewAtIndex:](self, "viewAtIndex:");
  if (!v10)
  {
    long long v11 = [[UIPDFPageView alloc] initWithPage:[(UIPDFDocument *)self->_document pageAtIndex:a3]];
    long long v10 = v11;
    if (v11)
    {
      [(UIPDFPageView *)v11 setShowAnnotations:1];
      [(UIPDFPageView *)v10 setAllowSelection:1];
      [(UIPDFPageView *)v10 setUseBackingLayer:1];
      [(UIView *)v10 setTag:a3 + 1000000];
      [(UIPDFPageView *)v10 setDelegate:self];
      [(UIPDFAnnotationController *)[(UIPDFPageView *)v10 annotationController] setDelegate:self];
      [(UIPDFPageView *)v10 setBackingLayerColor:self->backgroundColorForUnRenderedContent];
      [(UIPDFPageView *)v10 setShowActivityIndicator:!self->hideActivityIndicatorForUnRenderedContent];
      [(UIView *)v10 setHidden:self->hidePageViewsUntilReadyToRender];
      [(UIPDFPageView *)v10 setShowLinkAnnotationUnderline:0];
      [(UIPDFPageView *)v10 addObserver:self forKeyPath:@"backgroundImage" options:1 context:0];
      [(UIWebPDFView *)self setReadyForSnapshot:0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__UIWebPDFView__installViewAtIndex_inFrame___block_invoke;
      v13[3] = &unk_1E52F1BC8;
      *(CGFloat *)&v13[6] = x;
      *(CGFloat *)&v13[7] = y;
      *(CGFloat *)&v13[8] = width;
      *(CGFloat *)&v13[9] = height;
      v13[4] = v10;
      v13[5] = self;
      +[UIView performWithoutAnimation:v13];
      AddShadowPathToView(v10);
      [(NSMutableArray *)self->_pageViews addObject:v10];
      [(UIView *)self insertSubview:v10 atIndex:0];
    }
  }
  return v10;
}

uint64_t __44__UIWebPDFView__installViewAtIndex_inFrame___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGRect v7 = *(CGRect *)(a1 + 48);
  long long v4 = *(_OWORD *)(*(void *)(a1 + 40) + 536);
  long long v5 = *(_OWORD *)(*(void *)(a1 + 40) + 552);
  *(_OWORD *)&v6.a = *(_OWORD *)(*(void *)(a1 + 40) + 520);
  long long v3 = *(_OWORD *)&v6.a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tCGFloat x = v5;
  CGRect v8 = CGRectApplyAffineTransform(v7, &v6);
  CGRect v9 = CGRectIntegral(v8);
  return objc_msgSend(v1, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height, v3);
}

- (void)_addSubViewsInViewCoordsBounds:(CGRect)a3 force:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = [(UIView *)self _scroller];
  if (v10)
  {
    long long v11 = v10;
    NSUInteger v12 = [(NSArray *)self->pageRects count];
    if (v12)
    {
      if (self->_pageMinYs)
      {
        NSUInteger v13 = v12;
        [v11 contentOffset];
        if (v14 - self->_contentOffsetAtScrollStart.y != 0.0
          || a4
          || ![(NSMutableArray *)self->_pageViews count])
        {
          long long v15 = *(_OWORD *)&self->_documentTransform.c;
          *(_OWORD *)&v25.a = *(_OWORD *)&self->_documentTransform.a;
          *(_OWORD *)&v25.c = v15;
          *(_OWORD *)&v25.tCGFloat x = *(_OWORD *)&self->_documentTransform.tx;
          CGAffineTransformInvert(&v26, &v25);
          v27.origin.CGFloat x = x;
          v27.origin.CGFloat y = y;
          v27.size.CGFloat width = width;
          v27.size.CGFloat height = height;
          CGRect v28 = CGRectApplyAffineTransform(v27, &v26);
          CGFloat v16 = v28.origin.x;
          CGFloat v17 = v28.origin.y;
          CGFloat v18 = v28.size.width;
          CGFloat v19 = v28.size.height;
          double MinY = CGRectGetMinY(v28);
          v29.origin.CGFloat x = v16;
          v29.origin.CGFloat y = v17;
          v29.size.CGFloat width = v18;
          v29.size.CGFloat height = v19;
          double MaxY = CGRectGetMaxY(v29);
          unint64_t v22 = v13 - 1;
          unint64_t PreviousPageIndexGivenYOffset = findPreviousPageIndexGivenYOffset(self->_pageMinYs, 0, v22, MinY);
          unint64_t NextPageIndexGivenYOffset = findNextPageIndexGivenYOffset(self->_pageMinYs, 0, v22, MaxY);
          if (!NextPageIndexGivenYOffset) {
            unint64_t NextPageIndexGivenYOffset = findPreviousPageIndexGivenYOffset(self->_pageMinYs, 0, v22, MaxY);
          }
          if (PreviousPageIndexGivenYOffset >= NextPageIndexGivenYOffset) {
            unint64_t PreviousPageIndexGivenYOffset = NextPageIndexGivenYOffset;
          }
          if (NextPageIndexGivenYOffset < v22) {
            unint64_t v22 = NextPageIndexGivenYOffset;
          }
          while (PreviousPageIndexGivenYOffset <= v22)
          {
            objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", PreviousPageIndexGivenYOffset), "CGRectValue");
            -[UIWebPDFView _installViewAtIndex:inFrame:](self, "_installViewAtIndex:inFrame:", PreviousPageIndexGivenYOffset++);
          }
        }
      }
    }
  }
}

- (id)_addPageAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->pageRects count] <= a3) {
    return 0;
  }
  objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", a3), "CGRectValue");
  return -[UIWebPDFView _installViewAtIndex:inFrame:](self, "_installViewAtIndex:inFrame:", a3);
}

- (void)_removePageViewsNotInViewCoordsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v8 = *(_OWORD *)&self->_documentTransform.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&self->_documentTransform.a;
  *(_OWORD *)&v18.c = v8;
  *(_OWORD *)&v18.tCGFloat x = *(_OWORD *)&self->_documentTransform.tx;
  CGAffineTransformInvert(&v19, &v18);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v19);
  double v9 = v21.origin.y;
  double v10 = v21.size.height;
  uint64_t v11 = [(NSMutableArray *)self->_pageViews count];
  if (v11 - 1 >= 0)
  {
    uint64_t v12 = v11;
    double v13 = v9 + v10;
    do
    {
      double v14 = (void *)[(NSMutableArray *)self->_pageViews objectAtIndex:--v12];
      objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", objc_msgSend(v14, "tag") - 1000000), "CGRectValue");
      if (v9 >= v15) {
        BOOL v17 = v15 + v16 > v9;
      }
      else {
        BOOL v17 = v13 > v15;
      }
      if (!v17)
      {
        objc_msgSend((id)objc_msgSend(v14, "annotationController", v15 + v16), "setDelegate:", 0);
        [v14 setDelegate:0];
        [(UIWebPDFView *)self _removeBackgroundImageObserverIfNeeded:v14];
        [v14 removeFromSuperview];
        [(NSMutableArray *)self->_pageViews removeObjectAtIndex:v12];
      }
    }
    while (v12 > 0);
  }
}

- (void)_removePageViewsNotInCurrentViewCoordsRect
{
  [(UIWebPDFView *)self _viewCachingBoundsInUIViewCoords];
  -[UIWebPDFView _removePageViewsNotInViewCoordsRect:](self, "_removePageViewsNotInViewCoordsRect:");
}

- (void)_scheduleRemovePageViewsNotInViewCoordsRect
{
  if (!self->_hasScheduledCacheUpdate)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__removePageViewsNotInCurrentViewCoordsRect object:0];
    [(UIWebPDFView *)self performSelector:sel__removePageViewsNotInCurrentViewCoordsRect withObject:0 afterDelay:0.02];
    self->_hasScheduledCacheUpdate = 1;
  }
}

- (void)ensureCorrectPagesAreInstalled:(BOOL)a3
{
  if (!self->_rotating && self->_ignoreContentOffsetChanges <= 0 && !self->_zooming)
  {
    BOOL v4 = a3;
    [(UIWebPDFView *)self _viewCachingBoundsInUIViewCoords];
    -[UIWebPDFView _addSubViewsInViewCoordsBounds:force:](self, "_addSubViewsInViewCoordsBounds:force:", v4);
    self->_hasScheduledCacheUpdate = 0;
    [(UIWebPDFView *)self _scheduleRemovePageViewsNotInViewCoordsRect];
  }
}

- (void)willScroll:(id)a3
{
  if (!self->_rotating)
  {
    p_contentOffsetAtScrollStart = &self->_contentOffsetAtScrollStart;
    objc_msgSend(-[UIView _scroller](self, "_scroller", a3), "contentOffset");
    p_contentOffsetAtScrollStart->CGFloat x = v4;
    p_contentOffsetAtScrollStart->CGFloat y = v5;
  }
}

- (void)_didScroll
{
  if (self->_document)
  {
    if (self->_delegateRespondsToDidScroll) {
      [(UIWebPDFViewDelegate *)self->_pdfDelegate didScroll:self];
    }
    [(UIWebPDFView *)self ensureCorrectPagesAreInstalled:0];
    objc_msgSend(-[UIView _scroller](self, "_scroller"), "contentOffset");
    self->_contentOffsetAtScrollStart.CGFloat x = v3;
    self->_contentOffsetAtScrollStart.CGFloat y = v4;
  }
}

- (void)didReceiveMemoryWarning:(id)a3
{
  [(UIWebPDFView *)self _viewportBoundsInUIViewCoords];
  -[UIWebPDFView _removePageViewsNotInViewCoordsRect:](self, "_removePageViewsNotInViewCoordsRect:");
  [(UIWebPDFView *)self _recreateUIPDFDocument];
}

- (void)willRotate:(id)a3
{
  self->_rotating = 1;
  p_contentOffsetAtScrollStart = &self->_contentOffsetAtScrollStart;
  objc_msgSend(-[UIView _scroller](self, "_scroller", a3), "contentOffset");
  p_contentOffsetAtScrollStart->CGFloat x = v5;
  p_contentOffsetAtScrollStart->CGFloat y = v6;
  if (self->_hasScheduledCacheUpdate)
  {
    CGRect v7 = (void *)MEMORY[0x1E4FBA8A8];
    [v7 cancelPreviousPerformRequestsWithTarget:self selector:sel__removePageViewsNotInCurrentDocCoordsRect object:0];
  }
}

- (void)didRotate:(id)a3
{
  self->_rotating = 0;
  [(UIWebPDFView *)self ensureCorrectPagesAreInstalled:1];
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "contentOffset");
  self->_contentOffsetAtScrollStart.CGFloat x = v4;
  self->_contentOffsetAtScrollStart.CGFloat y = v5;
}

- (void)willZoom:(id)a3
{
  self->_zooming = 1;
  p_contentOffsetAtScrollStart = &self->_contentOffsetAtScrollStart;
  objc_msgSend(-[UIView _scroller](self, "_scroller", a3), "contentOffset");
  p_contentOffsetAtScrollStart->CGFloat x = v5;
  p_contentOffsetAtScrollStart->CGFloat y = v6;
  if (self->_hasScheduledCacheUpdate)
  {
    CGRect v7 = (void *)MEMORY[0x1E4FBA8A8];
    [v7 cancelPreviousPerformRequestsWithTarget:self selector:sel__removePageViewsNotInCurrentDocCoordsRect object:0];
  }
}

- (void)didZoom:(id)a3
{
  self->_zooming = 0;
  [(UIWebPDFView *)self ensureCorrectPagesAreInstalled:1];
}

- (unint64_t)firstVisiblePageNumber
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(UIWebPDFView *)self _viewportBoundsInUIViewCoords];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v11 = *(_OWORD *)&self->_documentTransform.c;
  *(_OWORD *)&v43.a = *(_OWORD *)&self->_documentTransform.a;
  *(_OWORD *)&v43.c = v11;
  *(_OWORD *)&v43.tCGFloat x = *(_OWORD *)&self->_documentTransform.tx;
  CGAffineTransformInvert(&v44, &v43);
  v47.origin.CGFloat x = v4;
  v47.origin.CGFloat y = v6;
  v47.size.double width = v8;
  v47.size.CGFloat height = v10;
  CGRect v48 = CGRectApplyAffineTransform(v47, &v44);
  CGFloat height = v48.size.height;
  pageMinYs = self->_pageMinYs;
  CGFloat y = v48.origin.y;
  CGFloat x = v48.origin.x;
  CGFloat r1 = v48.size.width;
  double MinX = CGRectGetMinX(v48);
  uint64_t PreviousPageIndexGivenYOffset = findPreviousPageIndexGivenYOffset(pageMinYs, 0, [(NSArray *)self->pageRects count] - 1, MinX);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  pageViews = self->_pageViews;
  uint64_t v17 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    double v20 = 0.0;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v40 != v19) {
        objc_enumerationMutation(pageViews);
      }
      uint64_t v22 = [*(id *)(*((void *)&v39 + 1) + 8 * v21) tag] - 1000000;
      objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", v22), "CGRectValue");
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      v49.origin.CGFloat y = y;
      v49.origin.CGFloat x = x;
      v49.size.double width = r1;
      v49.size.CGFloat height = height;
      v51.origin.CGFloat x = v24;
      v51.origin.CGFloat y = v26;
      v51.size.double width = v28;
      v51.size.CGFloat height = v30;
      CGRect v50 = CGRectIntersection(v49, v51);
      double width = v50.size.width;
      double v32 = v50.size.height;
      v52.origin.CGFloat x = v24;
      v52.origin.CGFloat y = v26;
      v52.size.double width = v28;
      v52.size.CGFloat height = v30;
      BOOL v33 = CGRectEqualToRect(v50, v52);
      if (width * v32 > v20 || v33) {
        uint64_t PreviousPageIndexGivenYOffset = v22;
      }
      if (v33) {
        break;
      }
      if (width * v32 > v20) {
        double v20 = width * v32;
      }
      if (v18 == ++v21)
      {
        uint64_t v18 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v18) {
          goto LABEL_3;
        }
        return PreviousPageIndexGivenYOffset + 1;
      }
    }
  }
  return PreviousPageIndexGivenYOffset + 1;
}

- (void)prepareForSnapshot:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  pageViews = self->_pageViews;
  uint64_t v5 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(pageViews);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setShadowPath:", 0);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setShadowOffset:", 0.0, 3.0);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setShadowOpacity:", 0.0);
        if ([(UIWebPDFView *)self viewportView] != self)
        {
          id v10 = [(UIWebPDFView *)self viewportView];
          if (v10)
          {
            [v10 zoomScale];
            if (v11 > 2.5) {
              return;
            }
            if (!self->_backingLayerImageViews) {
              self->_backingLayerImageViews = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
            }
            uint64_t v12 = [v9 backgroundImage];
            if (v12)
            {
              double v13 = [[UIImageView alloc] initWithImage:v12];
              [v9 frame];
              -[UIImageView setFrame:](v13, "setFrame:");
              [(UIView *)self insertSubview:v13 aboveSubview:v9];

              [(NSMutableArray *)self->_backingLayerImageViews addObject:v13];
              [v9 setHidden:1];
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)snapshotComplete
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  backingLayerImageViews = self->_backingLayerImageViews;
  if (backingLayerImageViews)
  {
    [(NSMutableArray *)backingLayerImageViews makeObjectsPerformSelector:sel_removeFromSuperview];

    self->_backingLayerImageViews = 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  pageViews = self->_pageViews;
  uint64_t v5 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(pageViews);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        AddShadowPathToView(v9);
        [v9 setHidden:0];
      }
      uint64_t v6 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)viewWillClose
{
}

- (BOOL)_tryToUnlockDocumentWithPassword:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (!CGPDFDocumentIsUnlocked(self->_cgPDFDocument))
  {
    cgPDFDocument = self->_cgPDFDocument;
    uint64_t v7 = [a3 UTF8String];
    if (v7) {
      CGFloat v8 = (const char *)v7;
    }
    else {
      CGFloat v8 = "";
    }
    if (CGPDFDocumentUnlockWithPassword(cgPDFDocument, v8))
    {
      [(UIWebPDFView *)self setDocumentPassword:a3];
      double v9 = [(UIWebPDFView *)self pdfPlaceHolderView];
      BOOL v5 = 1;
      [(WebPDFViewPlaceholder *)v9 setNeedsLayout:1];
      return v5;
    }
    return 0;
  }
  return 1;
}

- (BOOL)_checkIfDocumentNeedsUnlock
{
  if (CGPDFDocumentIsUnlocked(self->_cgPDFDocument)) {
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    CGFloat v4 = (__CFString *)[(UIWebPDFViewDelegate *)self->_pdfDelegate passwordForPDFView:self];
  }
  else {
    CGFloat v4 = &stru_1ED0E84C0;
  }
  cgPDFDocument = self->_cgPDFDocument;
  uint64_t v6 = [(__CFString *)v4 UTF8String];
  if (v6) {
    uint64_t v7 = (const char *)v6;
  }
  else {
    uint64_t v7 = "";
  }
  BOOL v8 = CGPDFDocumentUnlockWithPassword(cgPDFDocument, v7);
  if (v8)
  {
    [(UIWebPDFView *)self setDocumentPassword:v4];
    [(UIWebPDFView *)self pdfPlaceHolderView];
    WebThreadRun();
  }
  return !v8;
}

uint64_t __43__UIWebPDFView__checkIfDocumentNeedsUnlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUnlockDocument];
}

- (void)_recreateUIPDFDocument
{
  if (CGPDFDocumentIsUnlocked(self->_cgPDFDocument))
  {
    double v3 = CGPDFDocumentCopy((uint64_t)self->_cgPDFDocument, [(UIWebPDFView *)self documentPassword]);
    document = self->_document;
    if (document)
    {
      [(UIWebPDFView *)self clearSelection];
      document = self->_document;
    }

    self->_document = [[UIPDFDocument alloc] initWithCGPDFDocument:v3];
    CGPDFDocumentRelease(self->_cgPDFDocument);
    self->_cgPDFDocument = v3;
  }
}

- (void)didCompleteLayout
{
  double v3 = [(UIWebPDFView *)self pdfPlaceHolderView];
  CGFloat v4 = v3;
  if (!self->_cgPDFDocument) {
    self->_cgPDFDocument = CGPDFDocumentRetain((CGPDFDocumentRef)[(WebPDFViewPlaceholder *)v3 document]);
  }
  if (![(UIWebPDFView *)self _checkIfDocumentNeedsUnlock])
  {
    [(UIWebPDFView *)self _recreateUIPDFDocument];
    [(WebPDFViewPlaceholder *)v4 clearDocument];
    [(UIWebPDFView *)self setPageRects:[(WebPDFViewPlaceholder *)v4 pageRects]];
    [(UIWebPDFView *)self setPageMinYs:[(WebPDFViewPlaceholder *)v4 pageYOrigins]];
  }
  [(WebPDFViewPlaceholder *)v4 bounds];
  if (!CGRectEqualToRect(v13, self->_documentBounds))
  {
    [(WebPDFViewPlaceholder *)v4 bounds];
    self->_documentBounds.origin.CGFloat x = v5;
    self->_documentBounds.origin.CGFloat y = v6;
    self->_documentBounds.size.double width = v7;
    self->_documentBounds.size.CGFloat height = v8;
    [(UIView *)self bounds];
    double v10 = v9 / self->_documentBounds.size.width;
    self->_documentScale = v10;
    CGAffineTransformMakeScale(&v12, v10, v10);
    long long v11 = *(_OWORD *)&v12.c;
    *(_OWORD *)&self->_documentTransform.a = *(_OWORD *)&v12.a;
    *(_OWORD *)&self->_documentTransform.c = v11;
    *(_OWORD *)&self->_documentTransform.tCGFloat x = *(_OWORD *)&v12.tx;
    if (objc_opt_respondsToSelector()) {
      [(UIWebPDFViewDelegate *)self->_pdfDelegate didDetermineDocumentBounds:self];
    }
  }
}

- (void)zoom:(id)a3 to:(CGRect)a4 atPoint:(CGPoint)a5 kind:(int)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(a3, "convertRect:toView:", self, v12, v11, width, height);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    objc_msgSend(a3, "convertPoint:toView:", self, x, y);
    pdfDelegate = self->_pdfDelegate;
    -[UIWebPDFViewDelegate pdfView:zoomToRect:forPoint:considerHeight:](pdfDelegate, "pdfView:zoomToRect:forPoint:considerHeight:", self, a6 != 2, v16, v18, v20, v22, v23, v24);
  }
}

- (void)resetZoom:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    pdfDelegate = self->_pdfDelegate;
    [(UIWebPDFViewDelegate *)pdfDelegate resetZoom:self];
  }
}

- (void)_didTouch:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToURL:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (objc_opt_respondsToSelector())
  {
    pdfDelegate = self->_pdfDelegate;
    uint64_t v14 = [a6 absoluteString];
    objc_msgSend(a3, "convertRect:toView:", self, x, y, width, height);
    -[UIWebPDFViewDelegate handleLinkClick:inRect:](pdfDelegate, "handleLinkClick:inRect:", v14);
  }
}

- (void)_didTouch:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToPageIndex:(unint64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (objc_opt_respondsToSelector())
  {
    pdfDelegate = self->_pdfDelegate;
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"#page%lu", a6 + 1);
    objc_msgSend(a3, "convertRect:toView:", self, x, y, width, height);
    -[UIWebPDFViewDelegate handleLinkClick:inRect:](pdfDelegate, "handleLinkClick:inRect:", v14);
  }
}

- (void)_didLongPress:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToURL:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  if (objc_opt_respondsToSelector())
  {
    pdfDelegate = self->_pdfDelegate;
    uint64_t v16 = [a6 absoluteString];
    objc_msgSend(a3, "convertPoint:toView:", self, x, y);
    double v31 = v18;
    double v32 = v17;
    objc_msgSend(a3, "convertRect:toView:", self, v12, v11, width, height);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    objc_msgSend(a3, "convertRectToPDFPageSpace:", v12, v11, width, height);
    -[UIWebPDFViewDelegate handleLongPressOnLink:atPoint:inRect:contentRect:](pdfDelegate, "handleLongPressOnLink:atPoint:inRect:contentRect:", v16, v32, v31, v20, v22, v24, v26, v27, v28, v29, v30);
  }
}

- (void)_didLongPress:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToPageIndex:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  if (objc_opt_respondsToSelector())
  {
    pdfDelegate = self->_pdfDelegate;
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"#page%lu", a6 + 1);
    objc_msgSend(a3, "convertPoint:toView:", self, x, y);
    double v31 = v18;
    double v32 = v17;
    objc_msgSend(a3, "convertRect:toView:", self, v12, v11, width, height);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    objc_msgSend(a3, "convertRectToPDFPageSpace:", v12, v11, width, height);
    -[UIWebPDFViewDelegate handleLongPressOnLink:atPoint:inRect:contentRect:](pdfDelegate, "handleLongPressOnLink:atPoint:inRect:contentRect:", v16, v32, v31, v20, v22, v24, v26, v27, v28, v29, v30);
  }
}

- (void)annotation:(id)a3 wasTouchedAtPoint:(CGPoint)a4 controller:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "annotationController"), "pageView");
    if (v9)
    {
      double v10 = (void *)v9;
      [a3 Rect];
      objc_msgSend(v10, "convertRectFromPDFPageSpace:");
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = [a3 url];
      if (v19)
      {
        -[UIWebPDFView _didTouch:inRect:atPoint:linkingToURL:](self, "_didTouch:inRect:atPoint:linkingToURL:", v10, v19, v12, v14, v16, v18, x, y);
      }
      else
      {
        uint64_t v20 = [a3 pageNumber];
        if (v20) {
          uint64_t v21 = v20 - 1;
        }
        else {
          uint64_t v21 = 0;
        }
        -[UIWebPDFView _didTouch:inRect:atPoint:linkingToPageIndex:](self, "_didTouch:inRect:atPoint:linkingToPageIndex:", v10, v21, v12, v14, v16, v18, x, y);
      }
    }
  }
}

- (void)annotation:(id)a3 isBeingPressedAtPoint:(CGPoint)a4 controller:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "annotationController"), "pageView");
    if (v9)
    {
      double v10 = (void *)v9;
      [a3 Rect];
      objc_msgSend(v10, "convertRectFromPDFPageSpace:");
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = [a3 url];
      if (v19)
      {
        -[UIWebPDFView _didLongPress:inRect:atPoint:linkingToURL:](self, "_didLongPress:inRect:atPoint:linkingToURL:", v10, v19, v12, v14, v16, v18, x, y);
      }
      else
      {
        uint64_t v20 = [a3 pageNumber];
        if (v20) {
          uint64_t v21 = v20 - 1;
        }
        else {
          uint64_t v21 = 0;
        }
        -[UIWebPDFView _didLongPress:inRect:atPoint:linkingToPageIndex:](self, "_didLongPress:inRect:atPoint:linkingToPageIndex:", v10, v21, v12, v14, v16, v18, x, y);
      }
    }
  }
}

- (void)clearSelection
{
}

- (id)_pageWithSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pageViews = self->_pageViews;
  uint64_t v3 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(pageViews);
    }
    CGFloat v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
    CGFloat v8 = (void *)[v7 page];
    if (v8)
    {
      uint64_t v9 = (void *)[v8 selection];
      if (v9)
      {
        if (objc_msgSend((id)objc_msgSend(v9, "string"), "length")) {
          return v7;
        }
      }
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [(NSMutableArray *)pageViews countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)_selection
{
  v2 = objc_msgSend(-[UIWebPDFView _pageWithSelection](self, "_pageWithSelection"), "page");
  return (id)[v2 selection];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel__define_ == a3)
  {
    BOOL v5 = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 2, a4);
    if (v5)
    {
      uint64_t v6 = objc_msgSend(-[UIWebPDFView _selection](self, "_selection"), "string");
      LOBYTE(v5) = +[UIReferenceLibraryViewController _shouldShowDefineForTerm:v6];
    }
  }
  else if (sel__translate_ == a3)
  {
    BOOL v5 = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 32, a4);
    if (v5)
    {
      [(UIWebPDFView *)self _selection];
      LOBYTE(v5) = 1;
    }
  }
  else if (sel__share_ == a3)
  {
    BOOL v5 = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 8, a4);
    if (v5) {
      LOBYTE(v5) = objc_msgSend((id)objc_msgSend(-[UIWebPDFView _selection](self, "_selection"), "string"), "length") != 0;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIWebPDFView;
    LOBYTE(v5) = -[UIView canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return v5;
}

- (void)_define:(id)a3
{
  id v4 = [(UIWebPDFView *)self _pageWithSelection];
  BOOL v5 = objc_msgSend((id)objc_msgSend(v4, "page"), "selection");
  uint64_t v6 = [v5 string];
  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  v16.origin.double x = v8;
  v16.origin.double y = v10;
  v16.size.double width = v12;
  v16.size.double height = v14;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v4, "convertRectFromPDFPageSpace:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  [(UIResponder *)self _showServiceForType:2 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v6, v4)];
}

- (void)_translate:(id)a3
{
  id v4 = [(UIWebPDFView *)self _pageWithSelection];
  BOOL v5 = objc_msgSend((id)objc_msgSend(v4, "page"), "selection");
  uint64_t v6 = [v5 string];
  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  v16.origin.double x = v8;
  v16.origin.double y = v10;
  v16.size.double width = v12;
  v16.size.double height = v14;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v4, "convertRectFromPDFPageSpace:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  [(UIResponder *)self _showServiceForType:32 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v6, v4)];
}

- (void)_share:(id)a3
{
  id v4 = [(UIWebPDFView *)self _pageWithSelection];
  BOOL v5 = objc_msgSend((id)objc_msgSend(v4, "page"), "selection");
  uint64_t v6 = [v5 string];
  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  v16.origin.double x = v8;
  v16.origin.double y = v10;
  v16.size.double width = v12;
  v16.size.double height = v14;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v4, "convertRectFromPDFPageSpace:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  [(UIResponder *)self _showServiceForType:8 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v6, v4)];
}

- (void)_tapGestureRecognized:(id)a3
{
  if (self->_tapGestureRecognizer == a3) {
    [(UIWebPDFView *)self clearSelection];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_tapGestureRecognizer != a3 || [(UIWebPDFView *)self _selection] != 0;
}

- (unint64_t)_pageNumberForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v8 = *(_OWORD *)&self->_documentTransform.c;
  *(_OWORD *)&v19.a = *(_OWORD *)&self->_documentTransform.a;
  *(_OWORD *)&v19.c = v8;
  *(_OWORD *)&v19.tCGFloat x = *(_OWORD *)&self->_documentTransform.tx;
  CGAffineTransformInvert(&v20, &v19);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectApplyAffineTransform(v21, &v20);
  double v9 = v22.origin.y;
  double v10 = v22.size.height;
  double v11 = [(UIWebPDFView *)self pageRects];
  uint64_t v12 = [(NSArray *)v11 count];
  unint64_t v13 = 0;
  double v14 = v9 + v10;
  while (v12 != v13)
  {
    objc_msgSend(-[NSArray objectAtIndex:](v11, "objectAtIndex:", v13), "CGRectValue");
    if (v15 >= v9) {
      BOOL v17 = v14 > v15;
    }
    else {
      BOOL v17 = v15 + v16 > v9;
    }
    ++v13;
    if (v17) {
      return v13;
    }
  }
  return 0;
}

- (CGPDFPage)imageForContactRect:(CGFloat)a3 onPageInViewRect:(CGFloat)a4 destinationRect:(CGFloat)a5
{
  v70.origin.CGFloat x = a10;
  v70.origin.CGFloat y = a11;
  v70.size.double width = a12;
  v70.size.double height = a13;
  CGRect v71 = CGRectIntegral(v70);
  double width = v71.size.width;
  double height = v71.size.height;
  CGFloat x = v71.origin.x;
  CGFloat y = v71.origin.y;
  if (CGRectIsEmpty(v71)) {
    return 0;
  }
  v72.origin.CGFloat x = a2;
  v72.origin.CGFloat y = a3;
  v72.size.double width = a4;
  v72.size.double height = a5;
  CGRect v73 = CGRectIntegral(v72);
  CGFloat v29 = v73.origin.x;
  CGFloat v30 = v73.origin.y;
  CGFloat v31 = v73.size.width;
  CGFloat v32 = v73.size.height;
  if (CGRectIsEmpty(v73)) {
    return 0;
  }
  size_t v33 = objc_msgSend(a1, "_pageNumberForRect:", a6, a7, a8, a9);
  if (!v33) {
    return 0;
  }
  Page = CGPDFDocumentGetPage((CGPDFDocumentRef)[a1 cgPDFDocument], v33);
  ImageFromCurrentImageContext = Page;
  if (Page)
  {
    int v36 = CGPDFPageGetRotationAngle(Page) % 360;
    int v37 = v36 + (v36 < 0 ? 0x168 : 0);
    BOOL v38 = v37 == 90 || v37 == 270;
    if (v38) {
      CGFloat v39 = height;
    }
    else {
      CGFloat v39 = width;
    }
    if (v38) {
      double height = width;
    }
    memset(&v65, 0, 32);
    memset(&transform, 0, sizeof(transform));
    v74.origin.CGFloat x = v29;
    v74.origin.CGFloat y = v30;
    v74.size.double width = v31;
    v74.size.double height = v32;
    double MinX = CGRectGetMinX(v74);
    v75.origin.CGFloat x = v29;
    v75.origin.CGFloat y = v30;
    v75.size.double width = v31;
    v75.size.double height = v32;
    CGFloat v40 = v29;
    double MinY = CGRectGetMinY(v75);
    v76.origin.CGFloat x = v29;
    v76.origin.CGFloat y = v30;
    v76.size.double width = v31;
    v76.size.double height = v32;
    double MaxX = CGRectGetMaxX(v76);
    v77.origin.CGFloat x = v29;
    v77.origin.CGFloat y = v30;
    v77.size.double width = v31;
    v77.size.double height = v32;
    CGFloat MaxY = CGRectGetMaxY(v77);
    v78.origin.CGFloat x = v40;
    v78.origin.CGFloat y = v30;
    v78.size.double width = v31;
    v78.size.double height = v32;
    CGFloat txa = CGRectGetWidth(v78);
    v79.origin.CGFloat x = v40;
    v79.origin.CGFloat y = v30;
    v79.size.double width = v31;
    v79.size.double height = v32;
    double v43 = CGRectGetHeight(v79);
    int v44 = CGPDFPageGetRotationAngle(ImageFromCurrentImageContext) % 360;
    int v45 = v44 + (v44 < 0 ? 0x168 : 0);
    if (v45 > 179)
    {
      CGFloat v46 = x;
      if (v45 != 180)
      {
        if (v45 == 270)
        {
          double MaxX = -MinX;
          *(_OWORD *)&v65.a = xmmword_186B89740;
          *(_OWORD *)&v65.c = xmmword_186B9C3F0;
          double v47 = MaxY;
          goto LABEL_22;
        }
LABEL_30:
        abort();
      }
      v65.a = -1.0;
      v65.b = 0.0;
      v65.c = 0.0;
      v65.d = -1.0;
      double v47 = MaxX;
      double MaxX = MaxY;
    }
    else
    {
      CGFloat v46 = x;
      if (v45)
      {
        if (v45 == 90)
        {
          double v47 = -MinY;
          *(_OWORD *)&v65.a = xmmword_186B97840;
          *(_OWORD *)&v65.c = xmmword_186B8C800;
LABEL_22:
          double v49 = v43;
          double v43 = txa;
LABEL_26:
          v65.tCGFloat x = v47;
          v65.tCGFloat y = MaxX;
          CGAffineTransformMakeTranslation(&transform, v49 * -0.5, v43 * -0.5);
          CGAffineTransform t1 = v65;
          CGAffineTransform t2 = transform;
          CGAffineTransformConcat(&v65, &t1, &t2);
          v80.origin.CGFloat x = v46;
          v80.origin.CGFloat y = y;
          v80.size.double width = v39;
          v80.size.double height = height;
          CGFloat txb = CGRectGetMinX(v80);
          v81.origin.CGFloat x = v46;
          v81.origin.CGFloat y = y;
          v81.size.double width = v39;
          v81.size.double height = height;
          CGFloat v50 = CGRectGetMinY(v81);
          v82.origin.CGFloat x = v46;
          v82.origin.CGFloat y = y;
          v82.size.double width = v39;
          v82.size.double height = height;
          double v51 = CGRectGetWidth(v82);
          v83.origin.CGFloat x = v46;
          v83.origin.CGFloat y = y;
          v83.size.double width = v39;
          v83.size.double height = height;
          double v52 = CGRectGetHeight(v83);
          CGFloat v53 = fmin(v51 / v49, v52 / v43);
          CGAffineTransformMakeScale(&t1, v53, v53);
          CGAffineTransform transform = t1;
          CGAffineTransform t2 = v65;
          CGAffineTransform v66 = t1;
          CGAffineTransformConcat(&t1, &t2, &v66);
          CGAffineTransform v65 = t1;
          CGAffineTransformMakeTranslation(&t1, v51 * 0.5, v52 * 0.5);
          CGAffineTransform transform = t1;
          CGAffineTransform t2 = v65;
          CGAffineTransform v66 = t1;
          CGAffineTransformConcat(&t1, &t2, &v66);
          CGAffineTransform v65 = t1;
          CGAffineTransformMakeTranslation(&t1, txb, v50);
          CGAffineTransform transform = t1;
          CGAffineTransform t2 = v65;
          CGAffineTransform v66 = t1;
          CGAffineTransformConcat(&t1, &t2, &v66);
          CGAffineTransform v65 = t1;
          _UIGraphicsBeginImageContextWithOptions(1, 0, v39, height, 0.0);
          ContextStack = GetContextStack(0);
          if (*(int *)ContextStack < 1) {
            v55 = 0;
          }
          else {
            v55 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
          }
          v84.origin.CGFloat x = v46;
          v84.origin.CGFloat y = y;
          v84.size.double width = v39;
          v84.size.double height = height;
          CGContextClipToRect(v55, v84);
          v85.origin.CGFloat x = v46;
          v85.origin.CGFloat y = y;
          v85.size.double width = v39;
          v85.size.double height = height;
          CGFloat v56 = CGRectGetHeight(v85);
          CGContextTranslateCTM(v55, 0.0, v56);
          CGContextScaleCTM(v55, 1.0, -1.0);
          CGAffineTransform transform = v65;
          CGContextConcatCTM(v55, &transform);
          CGContextSetFillColorWithColor(v55, [+[UIColor whiteColor] CGColor]);
          v86.origin.CGFloat x = v46;
          v86.origin.CGFloat y = y;
          v86.size.double width = v39;
          v86.size.double height = height;
          CGContextFillRect(v55, v86);
          CGContextDrawPDFPage(v55, ImageFromCurrentImageContext);
          ImageFromCurrentImageContext = (CGPDFPage *)_UIGraphicsGetImageFromCurrentImageContext(0);
          UIGraphicsEndImageContext();
          return ImageFromCurrentImageContext;
        }
        goto LABEL_30;
      }
      double v47 = -MinX;
      double MaxX = -MinY;
      v65.a = 1.0;
      v65.b = 0.0;
      v65.c = 0.0;
      v65.d = 1.0;
    }
    double v49 = txa;
    goto LABEL_26;
  }
  return ImageFromCurrentImageContext;
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (void)setDocumentURL:(id)a3
{
}

- (UIWebPDFViewDelegate)pdfDelegate
{
  return self->_pdfDelegate;
}

- (CGRect)documentBounds
{
  double x = self->_documentBounds.origin.x;
  double y = self->_documentBounds.origin.y;
  double width = self->_documentBounds.size.width;
  double height = self->_documentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)initialZoomScale
{
  return self->_initialZoomScale;
}

- (void)setInitialZoomScale:(double)a3
{
  self->_double initialZoomScale = a3;
}

- (CGAffineTransform)documentTransform
{
  long long v3 = *(_OWORD *)&self[11].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[11].d;
  return self;
}

- (void)setDocumentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_documentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_documentTransform.c = v4;
  *(_OWORD *)&self->_documentTransform.tdouble x = v3;
}

- (double)documentScale
{
  return self->_documentScale;
}

- (WebPDFViewPlaceholder)pdfPlaceHolderView
{
  return self->pdfPlaceHolderView;
}

- (void)setPdfPlaceHolderView:(id)a3
{
  self->pdfPlaceHolderView = (WebPDFViewPlaceholder *)a3;
}

- (int64_t)ignoreContentOffsetChanges
{
  return self->_ignoreContentOffsetChanges;
}

- (BOOL)hidePageViewsUntilReadyToRender
{
  return self->hidePageViewsUntilReadyToRender;
}

- (void)setHidePageViewsUntilReadyToRender:(BOOL)a3
{
  self->hidePageViewsUntilReadyToRender = a3;
}

- (UIColor)backgroundColorForUnRenderedContent
{
  return self->backgroundColorForUnRenderedContent;
}

- (void)setBackgroundColorForUnRenderedContent:(id)a3
{
}

- (BOOL)hideActivityIndicatorForUnRenderedContent
{
  return self->hideActivityIndicatorForUnRenderedContent;
}

- (void)setHideActivityIndicatorForUnRenderedContent:(BOOL)a3
{
  self->hideActivityIndicatorForUnRenderedContent = a3;
}

- (NSString)documentPassword
{
  return self->documentPassword;
}

- (void)setDocumentPassword:(id)a3
{
}

- (NSArray)pageRects
{
  return self->pageRects;
}

- (void)setPageRects:(id)a3
{
}

- (BOOL)readyForSnapshot
{
  return self->readyForSnapshot;
}

- (void)setReadyForSnapshot:(BOOL)a3
{
  self->readyForSnapshot = a3;
}

- (NSArray)pageMinYs
{
  return self->_pageMinYs;
}

- (void)setPageMinYs:(id)a3
{
}

@end