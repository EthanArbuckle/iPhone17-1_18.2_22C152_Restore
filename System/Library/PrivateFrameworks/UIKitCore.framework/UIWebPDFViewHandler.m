@interface UIWebPDFViewHandler
- ($1AB5FA073B851C12C2339EC22442E995)doubleTapScalesForSize:(CGSize)a3;
- ($1AB5FA073B851C12C2339EC22442E995)scalesForContainerSize:(CGSize)a3;
- (BOOL)considerHeightForDoubleTap;
- (BOOL)hideActivityIndicatorForUnRenderedContent;
- (BOOL)hidePageViewsUntilReadyToRender;
- (BOOL)scalesPageToFit;
- (BOOL)showPageLabels;
- (CGRect)_frameForDocumentBounds:(CGRect)a3;
- (CGRect)_rectForPasswordView:(id)a3;
- (CGRect)_rectForPdfView:(CGRect)a3;
- (CGRect)activeRectForRectOfInterest:(CGRect)a3;
- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3;
- (CGRect)rectOfInterestForPoint:(CGPoint)a3;
- (CGRect)rectOfInterestForRotation;
- (CGRect)visibleContentRect;
- (UIColor)backgroundColorForUnRenderedContent;
- (UIView)frontView;
- (UIWebPDFView)pdfView;
- (UIWebPDFViewHandler)init;
- (UIWebPDFViewHandlerDelegate)pdfHandlerDelegate;
- (double)_pinValueForVerticalEdge:(unint64_t)a3 inScrollView:(id)a4;
- (double)heightToKeepVisible;
- (double)minimumScaleForSize:(CGSize)a3;
- (double)minimumVerticalContentOffset;
- (double)zoomedDocumentScale;
- (id)_absoluteUrlRelativeToDocumentURL:(id)a3;
- (id)_actionForType:(int)a3;
- (id)_actionForType:(int)a3 withActionInfo:(id)a4;
- (id)_actionsForInteractionInfo:(id)a3;
- (id)_getLabelViewFormatter;
- (id)_getPDFDocumentViewForWebView:(id)a3;
- (id)_scroller:(id)a3;
- (id)contentView;
- (id)createLinkHighlight;
- (id)createPageLabel;
- (id)enclosingScrollView;
- (id)findOnPageHighlighter;
- (id)hostViewForSheet:(id)a3;
- (id)passwordForPDFView:(id)a3;
- (id)searchControllerForHighlighter:(id)a3;
- (unint64_t)_verticalEdgeForContentOffsetInScrollView:(id)a3;
- (void)_adjustContentOffsetForKeyboardIfNeeded;
- (void)_adjustZoomScalesForScrollViewInternal:(id)a3;
- (void)_completeLinkClickWithURL:(id)a3;
- (void)_completeLinkClickWithURLString:(id)a3;
- (void)_createPDFViewIfNeeded:(id)a3;
- (void)_ensurePDFViewInHierarchyForWebDocView:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_notifyDelegateDidClickLink:(id)a3;
- (void)_notifyDelegateWillClickLink:(id)a3;
- (void)_postdidDetermineDocumentBounds;
- (void)_removePDFViewIfWebDocViewIsNotPDF:(id)a3;
- (void)_removePDFViewIfWebDocViewIsNotSamePDF:(id)a3;
- (void)_replacePDFViewIfPresentWithWebDocView:(id)a3;
- (void)_resultRects:(id)a3 andResultViews:(id)a4 forSearchResult:(id)a5 inViewCoordinates:(id)a6;
- (void)_setSearchControllerDocumentToSearch:(id)a3;
- (void)_showLinkSheet:(id)a3;
- (void)_showPasswordEntryViewForFile:(id)a3;
- (void)_showPasswordErrorAlert;
- (void)_updateViewHierarchyForDocumentView:(id)a3 ignoreIfSame:(BOOL)a4;
- (void)adjustZoomScalesForScrollView;
- (void)clearActionSheet;
- (void)clearAllViews;
- (void)clearLinkHighlight;
- (void)clearPageLabel;
- (void)clearSearchControllerForHighlighter:(id)a3;
- (void)dealloc;
- (void)didBeginEditingPassword:(id)a3 inView:(id)a4;
- (void)didDetermineDocumentBounds:(id)a3;
- (void)didEndEditingPassword:(id)a3 inView:(id)a4;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)didScroll:(id)a3;
- (void)ensureCorrectPagesAreInstalled:(BOOL)a3;
- (void)handleLinkClick:(id)a3 inRect:(CGRect)a4;
- (void)handleLongPressOnLink:(id)a3 atPoint:(CGPoint)a4 inRect:(CGRect)a5 contentRect:(CGRect)a6;
- (void)handleScrollToAnchor:(id)a3;
- (void)highlightRect:(CGRect)a3;
- (void)pdfView:(id)a3 zoomToRect:(CGRect)a4 forPoint:(CGPoint)a5 considerHeight:(BOOL)a6;
- (void)performAction:(id)a3 fromAlertController:(id)a4;
- (void)removeViewFromSuperview;
- (void)resetZoom:(id)a3;
- (void)restoreStateFromHistoryItem:(id)a3 forWebView:(id)a4;
- (void)restoreStateFromPendingHistoryItem;
- (void)revealSearchResult:(id)a3 andZoomIn:(BOOL)a4;
- (void)rotateEnclosingScrollViewToFrame:(CGRect)a3;
- (void)saveStateToHistoryItem:(id)a3 forWebView:(id)a4;
- (void)scrollToPageNumber:(int64_t)a3 animate:(BOOL)a4;
- (void)setBackgroundColorForUnRenderedContent:(id)a3;
- (void)setHideActivityIndicatorForUnRenderedContent:(BOOL)a3;
- (void)setHidePageViewsUntilReadyToRender:(BOOL)a3;
- (void)setPdfHandlerDelegate:(id)a3;
- (void)setScalesPageToFit:(BOOL)a3;
- (void)setShowPageLabels:(BOOL)a3;
- (void)updateBoundariesOfScrollView:(id)a3 withScales:(id)a4;
- (void)updatePageNumberLabelWithUserScrolling:(BOOL)a3 animated:(BOOL)a4;
- (void)updateViewHierarchyForDocumentViewLoadComplete:(id)a3;
- (void)updateViewHierarchyForDocumentViewNewLoad:(id)a3;
- (void)updateViewHierarchyForDocumentViewTabSwitch:(id)a3;
- (void)updateViewHierarchyForDocumentViewTabSwitch:(id)a3 restoringZoomScale:(double)a4 andScrollPt:(CGPoint)a5;
- (void)updateViewSettings;
- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4;
@end

@implementation UIWebPDFViewHandler

- (void)setHidePageViewsUntilReadyToRender:(BOOL)a3
{
  self->_hidePageViewsUntilReadyToRender = a3;
  -[UIWebPDFView setHidePageViewsUntilReadyToRender:](self->_pdfView, "setHidePageViewsUntilReadyToRender:");
}

- (void)setBackgroundColorForUnRenderedContent:(id)a3
{
  v5 = (UIColor *)a3;
  self->_backgroundColorForUnRenderedContent = v5;
  pdfView = self->_pdfView;
  [(UIWebPDFView *)pdfView setBackgroundColorForUnRenderedContent:v5];
}

- (void)setHideActivityIndicatorForUnRenderedContent:(BOOL)a3
{
  self->_hideActivityIndicatorForUnRenderedContent = a3;
  -[UIWebPDFView setHideActivityIndicatorForUnRenderedContent:](self->_pdfView, "setHideActivityIndicatorForUnRenderedContent:");
}

- (void)setShowPageLabels:(BOOL)a3
{
  BOOL showPageLabels = self->_showPageLabels;
  if (showPageLabels != a3)
  {
    self->_BOOL showPageLabels = a3;
    BOOL showPageLabels = a3;
  }
  if (!showPageLabels) {
    [(UIWebPDFViewHandler *)self clearPageLabel];
  }
}

- (void)_setSearchControllerDocumentToSearch:(id)a3
{
  if (a3)
  {
    v4 = CGPDFDocumentCopy((uint64_t)[(UIWebPDFView *)self->_pdfView cgPDFDocument], [(UIWebPDFView *)self->_pdfView documentPassword]);
    if (v4)
    {
      v5 = v4;
      v6 = [[UIPDFDocument alloc] initWithCGPDFDocument:v4];
      CGPDFDocumentRelease(v5);
    }
    else
    {
      v6 = 0;
    }
    [a3 setDocumentToSearch:v6];
  }
}

- (id)searchControllerForHighlighter:(id)a3
{
  searchControllers = self->_searchControllers;
  if (!searchControllers)
  {
    searchControllers = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:4];
    self->_searchControllers = searchControllers;
  }
  v6 = [(NSMapTable *)searchControllers objectForKey:a3];
  if (!v6)
  {
    v6 = objc_alloc_init(UIWebPDFSearchController);
    [(NSMapTable *)self->_searchControllers setObject:v6 forKey:a3];
  }
  [(UIWebPDFViewHandler *)self _setSearchControllerDocumentToSearch:v6];
  [(UIWebPDFView *)self->_pdfView documentScale];
  -[UIWebPDFSearchController setDocumentScale:](v6, "setDocumentScale:");
  return v6;
}

- (void)clearSearchControllerForHighlighter:(id)a3
{
  id v5 = -[NSMapTable objectForKey:](self->_searchControllers, "objectForKey:");
  if (v5)
  {
    [v5 setSearchDelegate:0];
    searchControllers = self->_searchControllers;
    [(NSMapTable *)searchControllers removeObjectForKey:a3];
  }
}

- (id)findOnPageHighlighter
{
  v2 = [[UIWebBrowserFindOnPageHighlighter alloc] initWithPDFViewHandler:self];
  return v2;
}

- (UIWebPDFViewHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebPDFViewHandler;
  v2 = [(UIWebPDFViewHandler *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_scalesPageToFit = 1;
    v2->_initialZoomScale = 1.0;
    v2->_showsShadowsForHTMLContent = 1;
    [(UIWebPDFViewHandler *)v2 setBackgroundColorForUnRenderedContent:+[UIColor lightGrayColor]];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_didReceiveMemoryWarning_, @"UIApplicationDidReceiveMemoryWarningNotification", 0);
  }
  return v3;
}

- (void)dealloc
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v5[0] = @"UIApplicationDidReceiveMemoryWarningNotification";
  v5[1] = @"UIKeyboardDidShowNotification";
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2]);
  [(UIWebPDFViewHandler *)self clearAllViews];
  [(UIWebPDFViewHandler *)self setBackgroundColorForUnRenderedContent:0];
  v4.receiver = self;
  v4.super_class = (Class)UIWebPDFViewHandler;
  [(UIWebPDFViewHandler *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning:(id)a3
{
  [(UIWebPDFView *)self->_pdfView didReceiveMemoryWarning:a3];
  objc_super v4 = [(NSMapTable *)self->_searchControllers objectEnumerator];
  uint64_t v5 = [(NSEnumerator *)v4 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      [(UIWebPDFViewHandler *)self _setSearchControllerDocumentToSearch:v6];
      uint64_t v6 = [(NSEnumerator *)v4 nextObject];
    }
    while (v6);
  }
}

- (void)clearAllViews
{
  self->_pdfView = 0;
  [(UIView *)self->_passwordEntryView removeFromSuperview];

  self->_passwordEntryView = 0;
  self->_searchControllers = 0;

  self->_labelViewFormatter = 0;
}

- (id)_scroller:(id)a3
{
  id result = [(UIView *)self->_pdfView _scroller];
  if (!result)
  {
    return (id)[a3 _scroller];
  }
  return result;
}

- (id)_getPDFDocumentViewForWebView:(id)a3
{
  WebThreadLock();
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "webView"), "mainFrame"), "frameView"), "documentView");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v4;
  }
  else {
    return 0;
  }
}

- (CGRect)_rectForPdfView:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (objc_opt_respondsToSelector())
  {
    -[UIWebPDFViewHandlerDelegate frameForPDFViewWithHandler:proposedFrame:](self->_pdfHandlerDelegate, "frameForPDFViewWithHandler:proposedFrame:", self, x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_frameForDocumentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(UIView *)self->_pdfView frame];
  double v7 = v6;
  double v9 = v8;
  pdfView = self->_pdfView;
  if (pdfView)
  {
    [(UIWebPDFView *)pdfView documentTransform];
    double v11 = *((double *)&v19 + 1);
    double v12 = *(double *)&v19;
    double v13 = *((double *)&v20 + 1);
    double v14 = *(double *)&v20;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    double v13 = 0.0;
    double v11 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
  }
  -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:", v7, v9, height * v14 + width * v12, height * v13 + width * v11, v19, v20, v21);
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_rectForPasswordView:(id)a3
{
  [(UIView *)self->_passwordEntryView frame];
  double v6 = v5;
  double v8 = v7;
  [a3 frame];
  -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:", v6, v8);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)_replacePDFViewIfPresentWithWebDocView:(id)a3
{
  if (self->_pdfView)
  {
    id v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:");
    [v5 insertSubview:a3 aboveSubview:self->_pdfView];
    [(UIWebPDFViewHandler *)self clearAllViews];
    BOOL showsShadowsForHTMLContent = self->_showsShadowsForHTMLContent;
    [v5 _setShowsBackgroundShadow:showsShadowsForHTMLContent];
  }
}

- (void)_removePDFViewIfWebDocViewIsNotPDF:(id)a3
{
  if (!-[UIWebPDFViewHandler _getPDFDocumentViewForWebView:](self, "_getPDFDocumentViewForWebView:"))
  {
    [(UIWebPDFViewHandler *)self _replacePDFViewIfPresentWithWebDocView:a3];
  }
}

- (void)_removePDFViewIfWebDocViewIsNotSamePDF:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "_documentUrl"), "_webkit_URLByRemovingFragment"), "isEqual:", -[NSURL _webkit_URLByRemovingFragment](-[UIWebPDFView documentURL](self->_pdfView, "documentURL"), "_webkit_URLByRemovingFragment")) & 1) == 0)
  {
    [(UIWebPDFViewHandler *)self _replacePDFViewIfPresentWithWebDocView:a3];
  }
}

- (void)_createPDFViewIfNeeded:(id)a3
{
  if (!self->_pdfView)
  {
    id v5 = -[UIWebPDFViewHandler _getPDFDocumentViewForWebView:](self, "_getPDFDocumentViewForWebView:");
    if (v5)
    {
      double v6 = v5;
      id v7 = [(UIWebPDFViewHandler *)self _scroller:a3];
      id v8 = v7 ? v7 : a3;
      double v9 = [[UIWebPDFView alloc] initWithWebPDFViewPlaceholder:v6];
      self->_pdfView = v9;
      [(UIWebPDFView *)v9 setInitialZoomScale:self->_initialZoomScale];
      -[UIWebPDFView setDocumentURL:](self->_pdfView, "setDocumentURL:", [a3 _documentUrl]);
      [(UIWebPDFView *)self->_pdfView setHidePageViewsUntilReadyToRender:self->_hidePageViewsUntilReadyToRender];
      [(UIWebPDFView *)self->_pdfView setBackgroundColorForUnRenderedContent:self->_backgroundColorForUnRenderedContent];
      [(UIWebPDFView *)self->_pdfView setHideActivityIndicatorForUnRenderedContent:self->_hideActivityIndicatorForUnRenderedContent];
      [v8 frame];
      -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:", 0.0, 0.0);
      double v11 = v10;
      double v13 = v12;
      -[UIView setFrame:](self->_pdfView, "setFrame:");
      [(UIWebPDFView *)self->_pdfView setPdfDelegate:self];
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "setContainerSize:", v11, v13);
      }
    }
  }
}

- (void)_ensurePDFViewInHierarchyForWebDocView:(id)a3
{
  pdfView = self->_pdfView;
  if (pdfView)
  {
    [(UIView *)self->_pdfView frame];
    -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:");
    -[UIView setFrame:](pdfView, "setFrame:");
    double v6 = [(UIWebPDFViewHandler *)self _scroller:a3];
    if (v6 != [(UIView *)self->_pdfView superview]) {
      [(UIView *)v6 insertSubview:self->_pdfView aboveSubview:a3];
    }
    if ([a3 superview]) {
      [a3 removeFromSuperview];
    }
    passwordEntryView = self->_passwordEntryView;
    if (passwordEntryView)
    {
      [(UIWebPDFViewHandler *)self _rectForPasswordView:v6];
      -[UIView setFrame:](passwordEntryView, "setFrame:");
      [(UIView *)v6 insertSubview:self->_passwordEntryView above:self->_pdfView];
    }
    [(UIView *)v6 _setShowsBackgroundShadow:0];
  }
}

- (void)_updateViewHierarchyForDocumentView:(id)a3 ignoreIfSame:(BOOL)a4
{
  if (a4)
  {
    [(UIWebPDFViewHandler *)self _removePDFViewIfWebDocViewIsNotPDF:a3];
    [(UIWebPDFViewHandler *)self _removePDFViewIfWebDocViewIsNotSamePDF:a3];
  }
  else if (self->_pdfView)
  {
    [(UIWebPDFViewHandler *)self _replacePDFViewIfPresentWithWebDocView:a3];
  }
  [(UIWebPDFViewHandler *)self _createPDFViewIfNeeded:a3];
  [(UIWebPDFViewHandler *)self _ensurePDFViewInHierarchyForWebDocView:a3];
}

- (void)updateViewSettings
{
  id v3 = [(UIWebPDFViewHandler *)self _scroller:0];
  if (v3)
  {
    objc_super v4 = v3;
    passwordEntryView = self->_passwordEntryView;
    if (passwordEntryView)
    {
      [(UIWebPDFViewHandler *)self _rectForPasswordView:v3];
      -[UIView setFrame:](passwordEntryView, "setFrame:");
    }
    else
    {
      [v3 zoomScale];
      double v7 = v6;
      [v4 minimumZoomScale];
      double v9 = v8;
      [v4 frame];
      -[UIWebPDFViewHandler scalesForContainerSize:](self, "scalesForContainerSize:", v10, v11);
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      unint64_t v18 = [(UIWebPDFViewHandler *)self _verticalEdgeForContentOffsetInScrollView:v4];
      [v4 setMinimumZoomScale:v13];
      [v4 setMaximumZoomScale:v15];
      [(UIWebPDFView *)self->_pdfView setInitialZoomScale:v17];
      self->_initialZoomScale = v17;
      if (v7 < v17 || v7 == v9) {
        [v4 setZoomScale:v17];
      }
      [v4 setZoomEnabled:self->_scalesPageToFit];
      [v4 setBouncesHorizontally:self->_scalesPageToFit];
      if (v18)
      {
        double v19 = *MEMORY[0x1E4F1DAD8];
        [(UIWebPDFViewHandler *)self _pinValueForVerticalEdge:v18 inScrollView:v4];
        objc_msgSend(v4, "setContentOffset:animated:", 0, v19, v20);
      }
    }
  }
}

- (void)_adjustZoomScalesForScrollViewInternal:(id)a3
{
  if (a3)
  {
    [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:1];
    [a3 setMinimumZoomScale:1.0];
    [a3 setMaximumZoomScale:32.0];
    [a3 setZoomScale:1.0];
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(a3, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], v6);
    [a3 setBouncesVertically:1];
    [a3 setScrollEnabled:1];
    [(UIWebPDFView *)self->_pdfView documentBounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    pdfView = self->_pdfView;
    if (pdfView) {
      [(UIWebPDFView *)pdfView documentTransform];
    }
    else {
      memset(&v23, 0, sizeof(v23));
    }
    v24.origin.double x = v8;
    v24.origin.double y = v10;
    v24.size.double width = v12;
    v24.size.double height = v14;
    CGRect v25 = CGRectApplyAffineTransform(v24, &v23);
    double width = v25.size.width;
    objc_msgSend(a3, "setContentSize:", v25.size.width, v25.size.height);
    if (width > 0.0 && self->_scalesPageToFit)
    {
      [a3 contentOffset];
      double v18 = v17;
      double v20 = v19;
      [a3 frame];
      double v22 = v21 / width;
      [a3 setMinimumZoomScale:v22];
      [a3 setZoomScale:v22];
      if (v5 == v18 && v6 == v20) {
        objc_msgSend(a3, "setContentOffset:animated:", 0, v5, v6);
      }
    }
    [(UIWebPDFViewHandler *)self updateViewSettings];
    [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:0];
  }
}

- (void)adjustZoomScalesForScrollView
{
  id v3 = [(UIWebPDFViewHandler *)self _scroller:0];
  if (v3)
  {
    objc_super v4 = v3;
    if (self->_passwordEntryView)
    {
      [v3 setMinimumZoomScale:1.0];
      [v4 setMaximumZoomScale:1.0];
      [v4 setZoomScale:1.0];
      objc_msgSend(v4, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [(UIView *)self->_passwordEntryView bounds];
      objc_msgSend(v4, "setContentSize:", v5, v6);
      if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        [v4 setBouncesVertically:0];
        [v4 setScrollEnabled:0];
      }
    }
    else
    {
      [(UIWebPDFViewHandler *)self _adjustZoomScalesForScrollViewInternal:v3];
    }
  }
}

- (void)clearLinkHighlight
{
  self->_linkHighlightView = 0;
}

- (id)createLinkHighlight
{
  linkHighlightView = self->_linkHighlightView;
  if (!linkHighlightView)
  {
    objc_super v4 = [_UIHighlightView alloc];
    linkHighlightView = -[_UIHighlightView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)linkHighlightView setOpaque:0];
    [(_UIHighlightView *)linkHighlightView setCornerRadius:3.0];
    [(_UIHighlightView *)linkHighlightView setColor:+[UIColor colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.3]];
    self->_linkHighlightView = linkHighlightView;
  }
  return linkHighlightView;
}

- (void)highlightRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIWebPDFViewHandler *)self clearLinkHighlight];
  if (self->_pdfView)
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRect v17 = CGRectInset(v16, -3.0, -3.0);
    double v8 = v17.origin.x;
    double v9 = v17.origin.y;
    double v10 = v17.size.width;
    double v11 = v17.size.height;
    id v12 = [(UIWebPDFViewHandler *)self createLinkHighlight];
    [v12 removeFromSuperview];
    [(UIView *)self->_pdfView addSubview:v12];
    uint64_t v13 = 4;
    CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    do
    {
      objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v10 + 3.0, v11 + 3.0));
      --v13;
    }
    while (v13);
    [v12 setCornerRadii:v14];

    objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);
  }
}

- (void)scrollToPageNumber:(int64_t)a3 animate:(BOOL)a4
{
  int64_t v4 = a3 - 1;
  if (a3 >= 1)
  {
    id v7 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a4);
    if (v7)
    {
      double v8 = v7;
      double v9 = [(UIWebPDFView *)self->_pdfView pageRects];
      if ([(NSArray *)v9 count])
      {
        if ([(NSArray *)v9 count] >= a3)
        {
          [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:1];
          [v8 setZoomScale:self->_initialZoomScale];
          objc_msgSend(-[NSArray objectAtIndex:](v9, "objectAtIndex:", v4), "CGRectValue");
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          pdfView = self->_pdfView;
          if (pdfView)
          {
            [(UIWebPDFView *)pdfView documentTransform];
            double v19 = self->_pdfView;
          }
          else
          {
            double v19 = 0;
            memset(&v20, 0, sizeof(v20));
          }
          v21.origin.CGFloat x = v11;
          v21.origin.CGFloat y = v13;
          v21.size.CGFloat width = v15;
          v21.size.CGFloat height = v17;
          CGRect v22 = CGRectApplyAffineTransform(v21, &v20);
          objc_msgSend(v8, "convertRect:fromView:", v19, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
          [v8 contentOffset];
          objc_msgSend(v8, "setContentOffset:animated:", 0);
          [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:0];
          [(UIWebPDFView *)self->_pdfView ensureCorrectPagesAreInstalled:1];
        }
      }
    }
  }
}

- (id)_absoluteUrlRelativeToDocumentURL:(id)a3
{
  int64_t v4 = [(NSURL *)[(UIWebPDFView *)self->_pdfView documentURL] absoluteURL];
  if (([a3 hasPrefix:@"#"] & 1) == 0
    && ![(NSString *)[(NSURL *)v4 absoluteString] hasSuffix:@"/"])
  {
    int64_t v4 = [(NSURL *)v4 URLByDeletingLastPathComponent];
  }
  double v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:relativeToURL:", a3, v4), "absoluteURL");
  return (id)[v5 standardizedURL];
}

- (void)_completeLinkClickWithURL:(id)a3
{
  if (a3)
  {
    [(UIWebPDFView *)self->_pdfView pdfPlaceHolderView];
    WebThreadRun();
  }
}

uint64_t __49__UIWebPDFViewHandler__completeLinkClickWithURL___block_invoke(uint64_t a1)
{
  return WebThreadRunOnMainThread();
}

uint64_t __49__UIWebPDFViewHandler__completeLinkClickWithURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateWillClickLink:*(void *)(a1 + 40)];
}

uint64_t __49__UIWebPDFViewHandler__completeLinkClickWithURL___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateDidClickLink:*(void *)(a1 + 40)];
}

- (void)_completeLinkClickWithURLString:(id)a3
{
  id v4 = [(UIWebPDFViewHandler *)self _absoluteUrlRelativeToDocumentURL:a3];
  [(UIWebPDFViewHandler *)self _completeLinkClickWithURL:v4];
}

- (void)_notifyDelegateWillClickLink:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    pdfHandlerDelegate = self->_pdfHandlerDelegate;
    [(UIWebPDFViewHandlerDelegate *)pdfHandlerDelegate pdfViewHandler:self willClickLink:a3];
  }
}

- (void)_notifyDelegateDidClickLink:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    pdfHandlerDelegate = self->_pdfHandlerDelegate;
    [(UIWebPDFViewHandlerDelegate *)pdfHandlerDelegate pdfViewHandler:self linkClicked:a3];
  }
}

- (void)handleLinkClick:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(UIWebPDFViewHandler *)self performSelector:sel__completeLinkClickWithURLString_ withObject:a3 afterDelay:0.2];
  -[UIWebPDFViewHandler highlightRect:](self, "highlightRect:", x, y, width, height);
}

- (void)clearActionSheet
{
  [(_UIRotatingAlertController *)self->_linkActionSheet doneWithSheet];
  id v3 = self->_linkActionSheet;
  self->_linkActionSheet = 0;

  self->_linkActions = 0;
  self->_linkActionInfo = 0;
}

- (id)_actionForType:(int)a3
{
  return [(UIWebPDFViewHandler *)self _actionForType:*(void *)&a3 withActionInfo:0];
}

- (id)_actionForType:(int)a3 withActionInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  switch(a3)
  {
    case 0:
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x3052000000;
      v11[3] = __Block_byref_object_copy__245;
      v11[4] = __Block_byref_object_dispose__245;
      v11[5] = self;
      id v5 = (id)[_UIKitBundle() localizedStringForKey:@"Open Link" value:@"Open" table:@"Localizable"];
      double v6 = v10;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke;
      v10[3] = &unk_1E5310FE8;
      v10[4] = v11;
      _Block_object_dispose(v11, 8);
      if (v5) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 1:
      id v5 = (id)[_UIKitBundle() localizedStringForKey:@"Copy Link" value:@"Copy" table:@"Localizable"];
      double v6 = &__block_literal_global_674;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 2:
      id v5 = _UINSLocalizedStringWithDefaultValue(@"Add to Reading List", @"Add to Reading List");
      double v6 = &__block_literal_global_458_2;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 3:
      id v5 = _UINSLocalizedStringWithDefaultValue(@"Open in Safari", @"Open in Safari");
      double v6 = &__block_literal_global_463_1;
      if (v5) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 4:
      uint64_t v9 = [a4 objectForKeyedSubscript:@"UIWebPDFLinkActionExternalApplicationName"];
      id v5 = (id)[NSString localizedStringWithFormat:objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", @"Open in “%@” (Link Element Action Sheet Button)", @"Open in “%@”", @"Localizable", v9];
      double v6 = &__block_literal_global_474_1;
      if (!v5) {
        goto LABEL_11;
      }
LABEL_9:
      id v7 = objc_alloc_init(UIWebPDFLinkAction);
      [(UIWebPDFLinkAction *)v7 setTitle:v5];
      [(UIWebPDFLinkAction *)v7 setType:v4];
      [(UIWebPDFLinkAction *)v7 setHandler:v6];
      id result = v7;
      break;
    default:
LABEL_11:
      id result = 0;
      break;
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 valueForKey:@"UIWebPDFLinkActionURLAttribute"];
  if (result)
  {
    uint64_t v4 = result;
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v5 _completeLinkClickWithURL:v4];
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_2(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 valueForKey:@"UIWebPDFLinkActionURLAttribute"];
  if (result)
  {
    id v3 = (void *)result;
    v7[0] = [UIPasteboardTypeListString objectAtIndex:0];
    v8[0] = [v3 absoluteString];
    v7[1] = [UIPasteboardTypeListURL objectAtIndex:0];
    v8[1] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    id v5 = +[UIPasteboard generalPasteboard];
    uint64_t v6 = v4;
    return -[UIPasteboard setItems:](v5, "setItems:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1]);
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 valueForKey:@"UIWebPDFLinkActionURLAttribute"];
  if (result)
  {
    id v3 = (void *)result;
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3052000000;
    uint64_t v9 = __Block_byref_object_copy__245;
    double v10 = __Block_byref_object_dispose__245;
    uint64_t v4 = (void *)_MergedGlobals_13_5;
    uint64_t v11 = _MergedGlobals_13_5;
    if (!_MergedGlobals_13_5)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __getSSReadingListClass_block_invoke_1;
      void v5[3] = &unk_1E52D9900;
      v5[4] = &v6;
      __getSSReadingListClass_block_invoke_1((uint64_t)v5);
      uint64_t v4 = (void *)v7[5];
    }
    _Block_object_dispose(&v6, 8);
    return objc_msgSend((id)objc_msgSend(v4, "defaultReadingList"), "addReadingListItemWithURL:title:previewText:error:", v3, objc_msgSend(v3, "absoluteString"), 0, 0);
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 objectForKeyedSubscript:@"UIWebPDFLinkActionAppLinkAttribute"];
  return [v2 openInWebBrowser:1 setAppropriateOpenStrategyAndWebBrowserState:0 completionHandler:&__block_literal_global_466_0];
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 objectForKeyedSubscript:@"UIWebPDFLinkActionAppLinkAttribute"];
  return [v2 openInWebBrowser:0 setAppropriateOpenStrategyAndWebBrowserState:0 completionHandler:&__block_literal_global_476_0];
}

- (id)_actionsForInteractionInfo:(id)a3
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)[a3 valueForKey:@"UIWebPDFLinkActionURLAttribute"];
  if (_UIApplicationHasAppLinkEntitlements() && (id v8 = _UIAppLinkForURL(v7)) != 0)
  {
    uint64_t v9 = v8;
    double v10 = (void *)[a3 mutableCopy];
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "targetApplicationRecord"), "localizedName");
    if (v11)
    {
      [v10 setObject:v11 forKeyedSubscript:@"UIWebPDFLinkActionExternalApplicationName"];
      [v10 setObject:v9 forKeyedSubscript:@"UIWebPDFLinkActionAppLinkAttribute"];
      objc_msgSend(v6, "addObject:", -[UIWebPDFViewHandler _actionForType:withActionInfo:](self, "_actionForType:withActionInfo:", 3, v10));
      uint64_t v12 = 4;
    }
    else
    {
      [v10 setObject:v9 forKeyedSubscript:@"UIWebPDFLinkActionAppLinkAttribute"];
      uint64_t v12 = 3;
    }
    objc_msgSend(v6, "addObject:", -[UIWebPDFViewHandler _actionForType:withActionInfo:](self, "_actionForType:withActionInfo:", v12, v10));
  }
  else
  {
    objc_msgSend(v6, "addObject:", -[UIWebPDFViewHandler _actionForType:](self, "_actionForType:", 0));
  }
  if ([v7 isHTTPOrHTTPSURL])
  {
    id v13 = [(UIWebPDFViewHandler *)self _actionForType:2];
    if (!v13) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWebPDFView.m", 2313, @"readingListAction is nil");
    }
    [v6 addObject:v13];
  }
  id v14 = [(UIWebPDFViewHandler *)self _actionForType:1];
  if (!v14) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWebPDFView.m", 2322, @"copyAction is nil");
  }
  [v6 addObject:v14];
  return v6;
}

- (void)_showLinkSheet:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(UIWebPDFViewHandler *)self clearLinkHighlight];
  uint64_t v5 = [a3 valueForKey:@"UIWebPDFLinkActionURLAttribute"];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = objc_alloc_init(_UIRotatingAlertController);
    -[UIAlertController setTitle:](v7, "setTitle:", objc_msgSend(v6, "_web_userVisibleString"));
    [(_UIRotatingAlertController *)v7 setRotatingSheetDelegate:self];
    id v8 = [(UIWebPDFViewHandler *)self _actionsForInteractionInfo:a3];
    id v16 = a3;
    if (objc_opt_respondsToSelector()) {
      id v8 = (id)-[UIWebPDFViewHandlerDelegate pdfViewHandler:actionsForURL:suggestedActions:](self->_pdfHandlerDelegate, "pdfViewHandler:actionsForURL:suggestedActions:", self, v6, v8, a3);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v16);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = [v13 title];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __38__UIWebPDFViewHandler__showLinkSheet___block_invoke;
          v19[3] = &unk_1E52EBAA8;
          v19[4] = self;
          v19[5] = v13;
          v19[6] = v7;
          [(UIAlertController *)v7 _addActionWithTitle:v14 image:0 style:0 handler:v19];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    id v15 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__UIWebPDFViewHandler__showLinkSheet___block_invoke_2;
    v18[3] = &unk_1E52EBA80;
    v18[4] = self;
    v18[5] = v7;
    [(UIAlertController *)v7 _addActionWithTitle:v15 image:0 style:1 handler:v18];
    self->_linkActionSheet = v7;
    self->_linkActionInfo = (NSDictionary *)v17;
    self->_linkActions = (NSArray *)v8;
    if (![(_UIRotatingAlertController *)v7 presentSheet]) {
      [(UIWebPDFViewHandler *)self performAction:0 fromAlertController:v7];
    }
  }
}

uint64_t __38__UIWebPDFViewHandler__showLinkSheet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction:*(void *)(a1 + 40) fromAlertController:*(void *)(a1 + 48)];
}

uint64_t __38__UIWebPDFViewHandler__showLinkSheet___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction:0 fromAlertController:*(void *)(a1 + 40)];
}

- (void)handleLongPressOnLink:(id)a3 atPoint:(CGPoint)a4 inRect:(CGRect)a5 contentRect:(CGRect)a6
{
  v15[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    double height = a5.size.height;
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    double v10 = a4.y;
    double v11 = a4.x;
    id v13 = -[UIWebPDFViewHandler _absoluteUrlRelativeToDocumentURL:](self, "_absoluteUrlRelativeToDocumentURL:");
    if (v13)
    {
      v15[0] = v13;
      v14[0] = @"UIWebPDFLinkActionURLAttribute";
      v14[1] = @"UIWebPDFLinkActionPointAttribute";
      v15[1] = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11, v10);
      v14[2] = @"UIWebPDFLinkActionRectAttribute";
      v15[2] = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
      v14[3] = @"UIWebPDFLinkActionContentRectAttribute";
      v15[3] = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
      -[UIWebPDFViewHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showLinkSheet_, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4], 0.75);
      -[UIWebPDFViewHandler highlightRect:](self, "highlightRect:", x, y, width, height);
    }
  }
}

- (void)performAction:(id)a3 fromAlertController:(id)a4
{
  if (self->_linkActionSheet == a4)
  {
    if (!a3)
    {
      uint64_t v5 = [0 handler];
      if (v5) {
        (*(void (**)(uint64_t, NSDictionary *))(v5 + 16))(v5, self->_linkActionInfo);
      }
    }
    [(_UIRotatingAlertController *)self->_linkActionSheet doneWithSheet];
    [(UIWebPDFViewHandler *)self clearActionSheet];
  }
}

- (id)hostViewForSheet:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(UIWebPDFViewHandlerDelegate *)self->_pdfHandlerDelegate hostViewForLinkSheet:self]) == 0)
  {
    pdfView = self->_pdfView;
    if (!pdfView) {
      goto LABEL_11;
    }
    uint64_t v6 = 0;
    do
    {
      id v7 = +[UIViewController viewControllerForView:pdfView];
      if (v7) {
        uint64_t v6 = v7;
      }
      pdfView = [(UIView *)pdfView superview];
    }
    while (pdfView);
    if (!v6 || (id result = (id)[v6 view]) == 0)
    {
LABEL_11:
      id v8 = self->_pdfView;
      return [(UIView *)v8 window];
    }
  }
  return result;
}

- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3
{
  id v4 = [(UIWebPDFViewHandler *)self hostViewForSheet:0];
  if (v4
    && (uint64_t v5 = v4,
        (id v6 = [(NSDictionary *)self->_linkActionInfo valueForKey:@"UIWebPDFLinkActionPointAttribute"]) != 0))
  {
    [v6 CGPointValue];
    objc_msgSend(v5, "convertPoint:fromView:", self->_pdfView);
    v7.size.double width = 1.0;
    v7.size.double height = 1.0;
    return CGRectInset(v7, -22.0, -22.0);
  }
  else
  {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  }
}

- (void)clearPageLabel
{
  self->_pageLabelView = 0;
}

- (id)createPageLabel
{
  id result = self->_pageLabelView;
  if (!result)
  {
    id v4 = [UIWebPDFLabelView alloc];
    id result = -[UIWebPDFLabelView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    self->_pageLabelView = (UIWebPDFLabelView *)result;
  }
  return result;
}

- (void)_showPasswordErrorAlert
{
  [(UITextField *)[(UIDocumentPasswordView *)self->_passwordEntryView passwordField] setText:0];
  id v3 = +[UIAlertController alertControllerWithTitle:_UINSLocalizedStringWithDefaultValue(@"The document could not be opened with that password.", @"The document could not be opened with that password.") message:0 preferredStyle:1];
  id v4 = _UINSLocalizedStringWithDefaultValue(@"OK", @"OK");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UIWebPDFViewHandler__showPasswordErrorAlert__block_invoke;
  void v5[3] = &unk_1E5310E18;
  v5[4] = self;
  [(UIAlertController *)v3 addAction:+[UIAlertAction actionWithTitle:v4 style:1 handler:v5]];
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self->_pdfView), "presentViewController:animated:completion:", v3, 1, 0);
}

uint64_t __46__UIWebPDFViewHandler__showPasswordErrorAlert__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) passwordField];
  return [v1 becomeFirstResponder];
}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  if (-[UIWebPDFView _tryToUnlockDocumentWithPassword:](self->_pdfView, "_tryToUnlockDocumentWithPassword:", a3, a4))
  {
    [(UIWebPDFView *)self->_pdfView pdfPlaceHolderView];
    WebThreadRun();
  }
  else
  {
    [(UIWebPDFViewHandler *)self _showPasswordErrorAlert];
  }
}

uint64_t __60__UIWebPDFViewHandler_userDidEnterPassword_forPasswordView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUnlockDocument];
}

- (void)_adjustContentOffsetForKeyboardIfNeeded
{
  passwordEntryView = self->_passwordEntryView;
  if (passwordEntryView)
  {
    id v4 = [(UIDocumentPasswordView *)passwordEntryView passwordField];
    if ([(UITextField *)v4 isEditing])
    {
      id v5 = [(UIWebPDFViewHandler *)self _scroller:0];
      if (v5)
      {
        id v6 = v5;
        if (+[UIKeyboard activeKeyboard])
        {
          objc_msgSend((id)objc_msgSend(v6, "keyboardSceneDelegate"), "visibleFrameInView:", 0);
          double x = v35.origin.x;
          double y = v35.origin.y;
          double width = v35.size.width;
          double height = v35.size.height;
          if (!CGRectIsEmpty(v35))
          {
            double v11 = (void *)[v6 window];
            if (objc_msgSend(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0), "containsObject:", v11))double v12 = y; {
            else
            }
              double v12 = y + -50.0;
            objc_msgSend(v11, "convertRect:fromWindow:", 0, x, v12, width, height);
            objc_msgSend(v6, "convertRect:fromView:", v11);
            CGFloat v14 = v13;
            double v16 = v15;
            CGFloat v18 = v17;
            double v20 = v19;
            [(UIView *)v4 bounds];
            -[UIView convertRect:toView:](v4, "convertRect:toView:", v6);
            CGFloat v32 = v22;
            CGFloat v33 = v21;
            double v24 = v23;
            double v26 = v25;
            [(UIView *)self->_passwordEntryView bounds];
            double v28 = v27;
            double v30 = v29;
            v36.origin.double x = v14;
            v36.origin.double y = v16;
            v36.size.double width = v18;
            v36.size.double height = v20;
            objc_msgSend(v6, "setContentSize:", v28, CGRectGetHeight(v36) + v30);
            BOOL v31 = v24 + v26 > v16;
            if (v24 >= v16) {
              BOOL v31 = v16 + v20 > v24;
            }
            if (v31)
            {
              v37.size.double width = v32;
              v37.origin.double x = v33;
              v37.origin.double y = v24;
              v37.size.double height = v26;
              CGRectGetMaxY(v37);
              v38.origin.double x = v14;
              v38.origin.double y = v16;
              v38.size.double width = v18;
              v38.size.double height = v20;
              CGRectGetMinY(v38);
              [v6 contentOffset];
              objc_msgSend(v6, "setContentOffset:animated:", 1);
            }
          }
        }
      }
    }
  }
}

- (void)_keyboardDidShow:(id)a3
{
}

- (void)didBeginEditingPassword:(id)a3 inView:(id)a4
{
  if (self->_passwordEntryView)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
    [v5 addObserver:self selector:sel__keyboardDidShow_ name:@"UIKeyboardDidShowNotification" object:0];
  }
}

- (void)didEndEditingPassword:(id)a3 inView:(id)a4
{
  if (self->_passwordEntryView)
  {
    id v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a4);
    if (v5)
    {
      id v6 = v5;
      [(UIView *)self->_passwordEntryView frame];
      CGFloat x = v14.origin.x;
      double y = v14.origin.y;
      CGFloat width = v14.size.width;
      CGFloat height = v14.size.height;
      double MaxX = CGRectGetMaxX(v14);
      v15.origin.CGFloat x = x;
      v15.origin.double y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      objc_msgSend(v6, "setContentSize:", MaxX, CGRectGetMaxY(v15));
      objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, y);
      double v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 removeObserver:self name:@"UIKeyboardDidShowNotification" object:0];
    }
  }
}

- (void)_showPasswordEntryViewForFile:(id)a3
{
  if (!self->_passwordEntryView)
  {
    id v4 = [[UIDocumentPasswordView alloc] initWithDocumentName:a3];
    self->_passwordEntryView = v4;
    [(UIDocumentPasswordView *)v4 setPasswordDelegate:self];
    passwordEntryView = self->_passwordEntryView;
    [(UIWebPDFViewHandler *)self _rectForPasswordView:self->_pdfView];
    -[UIView setFrame:](passwordEntryView, "setFrame:");
  }
  id v6 = [(UIView *)self->_pdfView superview];
  CGRect v7 = self->_passwordEntryView;
  pdfView = self->_pdfView;
  [(UIView *)v6 insertSubview:v7 above:pdfView];
}

- (void)_postdidDetermineDocumentBounds
{
  if ([(UIView *)self->_pdfView superview])
  {
    [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:1];
    [(UIWebPDFViewHandler *)self adjustZoomScalesForScrollView];
    [(UIWebPDFViewHandler *)self restoreStateFromPendingHistoryItem];
    [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:0];
    [(UIWebPDFViewHandler *)self ensureCorrectPagesAreInstalled:1];
    if (objc_opt_respondsToSelector())
    {
      pdfHandlerDelegate = self->_pdfHandlerDelegate;
      [(UIWebPDFViewHandlerDelegate *)pdfHandlerDelegate pdfViewHandlerCompletedLayoutAndIsUnlocked:self];
    }
  }
}

- (void)didDetermineDocumentBounds:(id)a3
{
  pdfView = self->_pdfView;
  [(UIWebPDFView *)pdfView documentBounds];
  -[UIWebPDFViewHandler _frameForDocumentBounds:](self, "_frameForDocumentBounds:");
  -[UIView setFrame:](pdfView, "setFrame:");
  if (self->_passwordEntryView)
  {
    [(UIWebPDFViewHandler *)self _adjustZoomScalesForScrollViewInternal:[(UIWebPDFViewHandler *)self _scroller:0]];
    v5[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke;
    v6[3] = &unk_1E52DC580;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke_2;
    void v5[3] = &unk_1E530D518;
    +[UIView animateWithDuration:4 delay:v6 options:v5 animations:0.25 completion:0.0];
  }
  else
  {
    [(UIWebPDFViewHandler *)self _postdidDetermineDocumentBounds];
  }
}

uint64_t __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:0.0];
}

uint64_t __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) removeFromSuperview];

  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  v2 = *(void **)(a1 + 32);
  return [v2 _postdidDetermineDocumentBounds];
}

- (void)pdfView:(id)a3 zoomToRect:(CGRect)a4 forPoint:(CGPoint)a5 considerHeight:(BOOL)a6
{
  self->_rectOfInterest = a4;
  self->_rectOfInterestConsidersHeight = a6;
  _UIWebDoubleTapAtLocation(self, a5.x, a5.y);
  self->_rectOfInterestConsidersHeight = 0;
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_rectOfInterest.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_rectOfInterest.size = v7;
}

- (void)resetZoom:(id)a3
{
  id v4 = [(UIWebPDFViewHandler *)self _scroller:0];
  if (v4)
  {
    double initialZoomScale = self->_initialZoomScale;
    [v4 setZoomScale:1 animated:initialZoomScale];
  }
}

- (id)passwordForPDFView:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    pdfHandlerDelegate = self->_pdfHandlerDelegate;
    return (id)[(UIWebPDFViewHandlerDelegate *)pdfHandlerDelegate passwordForPDFViewHandler:self];
  }
  else
  {
    [(UIWebPDFViewHandler *)self _showPasswordEntryViewForFile:[(WebPDFViewPlaceholder *)[(UIWebPDFView *)self->_pdfView pdfPlaceHolderView] title]];
    [(UIWebPDFViewHandler *)self adjustZoomScalesForScrollView];
    return 0;
  }
}

- (void)didScroll:(id)a3
{
  if (![a3 ignoreContentOffsetChanges])
  {
    uint64_t v4 = objc_msgSend(-[UIView _scroller](self->_pdfView, "_scroller"), "isDragging");
    [(UIWebPDFViewHandler *)self updatePageNumberLabelWithUserScrolling:v4 animated:0];
  }
}

- (void)ensureCorrectPagesAreInstalled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self->_pdfView superview])
  {
    pdfView = self->_pdfView;
    [(UIWebPDFView *)pdfView ensureCorrectPagesAreInstalled:v3];
  }
}

- (UIWebPDFView)pdfView
{
  return self->_pdfView;
}

- (UIView)frontView
{
  if (self->_passwordEntryView) {
    return &self->_passwordEntryView->super;
  }
  else {
    return (UIView *)[(UIWebPDFViewHandler *)self pdfView];
  }
}

- (void)removeViewFromSuperview
{
  [(UIView *)self->_passwordEntryView removeFromSuperview];
  [(UIView *)self->_pdfView removeFromSuperview];
  pageLabelView = self->_pageLabelView;
  [(UIView *)pageLabelView removeFromSuperview];
}

- (void)updateViewHierarchyForDocumentViewNewLoad:(id)a3
{
  id v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:");
  if (!self->_cachedScrollViewShadowsState)
  {
    self->_BOOL showsShadowsForHTMLContent = [v5 _showsBackgroundShadow];
    self->_cachedScrollViewShadowsState = 1;
  }
  if ([(UIWebPDFViewHandler *)self _getPDFDocumentViewForWebView:a3])
  {
    self->_double initialZoomScale = 1.0;
    [(UIWebPDFViewHandler *)self _updateViewHierarchyForDocumentView:a3 ignoreIfSame:0];
  }
}

- (void)updateViewHierarchyForDocumentViewTabSwitch:(id)a3 restoringZoomScale:(double)a4 andScrollPt:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  pdfView = self->_pdfView;
  [(UIWebPDFView *)pdfView setIgnoreContentOffsetChanges:1];
  [(UIWebPDFViewHandler *)self _updateViewHierarchyForDocumentView:a3 ignoreIfSame:1];
  [(UIWebPDFViewHandler *)self adjustZoomScalesForScrollView];
  if (self->_passwordEntryView)
  {
    if (!pdfView) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v11 = [(UIView *)self->_pdfView _scroller];
  double v12 = v11;
  if (a4 > 1.00000012) {
    [v11 setZoomScale:a4];
  }
  objc_msgSend(v12, "_setContentOffsetPinned:animated:", 0, x, y);
  if (pdfView) {
LABEL_3:
  }
    [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:0];
LABEL_4:
  [(UIWebPDFViewHandler *)self ensureCorrectPagesAreInstalled:1];
}

- (void)updateViewHierarchyForDocumentViewTabSwitch:(id)a3
{
}

- (void)updateViewHierarchyForDocumentViewLoadComplete:(id)a3
{
  [(UIWebPDFViewHandler *)self _removePDFViewIfWebDocViewIsNotPDF:a3];
  [(UIWebPDFViewHandler *)self ensureCorrectPagesAreInstalled:0];
}

- (id)_getLabelViewFormatter
{
  id result = self->_labelViewFormatter;
  if (!result)
  {
    id result = +[WebPDFNSNumberFormatter copyNumberFormater];
    self->_labelViewFormatter = (WebPDFNSNumberFormatter *)result;
  }
  return result;
}

- (void)updatePageNumberLabelWithUserScrolling:(BOOL)a3 animated:(BOOL)a4
{
  if (!self->_showPageLabels) {
    goto LABEL_6;
  }
  BOOL v5 = a4;
  if (!a3 && ![(UIWebPDFLabelView *)self->_pageLabelView isTimerInstalled]) {
    return;
  }
  pdfView = self->_pdfView;
  if (!pdfView || [(UIWebPDFView *)pdfView totalPages] <= 1)
  {
LABEL_6:
    pageLabelView = self->_pageLabelView;
LABEL_7:
    [(UIWebPDFLabelView *)pageLabelView fadeOut];
    return;
  }
  unint64_t v8 = [(UIWebPDFView *)self->_pdfView firstVisiblePageNumber];
  pageLabelView = self->_pageLabelView;
  if (!v8) {
    goto LABEL_7;
  }
  if ([(UIWebPDFLabelView *)pageLabelView currentPageIndex] == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [(UIWebPDFLabelView *)self->_pageLabelView setCurrentPageIndex:v8];
    id v10 = [(UIWebPDFViewHandler *)self _getLabelViewFormatter];
    uint64_t v11 = objc_msgSend(v10, "stringFromNumber:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v8));
    uint64_t v12 = objc_msgSend(v10, "stringFromNumber:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UIWebPDFView totalPages](self->_pdfView, "totalPages")));
    uint64_t v9 = [NSString stringWithFormat:_UINSLocalizedStringWithDefaultValue(@"%1$@ of %2$@", @"%1$@ of %2$@", v11, v12];
  }
  id v13 = [(UIWebPDFViewHandler *)self _scroller:0];
  [v13 contentOffset];
  double v15 = v14;
  double v17 = v16;
  if (objc_opt_respondsToSelector())
  {
    -[UIWebPDFViewHandlerDelegate originForPDFPageLabelViewWithHandler:proposedOrigin:](self->_pdfHandlerDelegate, "originForPDFPageLabelViewWithHandler:proposedOrigin:", self, v15, v17);
    double v15 = v18;
    double v17 = v19;
  }
  id v20 = [(UIWebPDFViewHandler *)self createPageLabel];
  objc_msgSend(v20, "showNowInSuperView:atOrigin:withText:animated:", v13, v9, v5, v15, v17);
}

- (void)handleScrollToAnchor:(id)a3
{
  if (a3 && [(UIView *)self->_pdfView superview])
  {
    BOOL v5 = (void *)[a3 lowercaseString];
    if ([v5 hasPrefix:@"page"]) {
      BOOL v5 = (void *)[v5 substringFromIndex:4];
    }
    uint64_t v6 = [v5 integerValue];
    if (v6 >= 1)
    {
      [(UIWebPDFViewHandler *)self scrollToPageNumber:v6 animate:0];
    }
  }
}

- (void)_resultRects:(id)a3 andResultViews:(id)a4 forSearchResult:(id)a5 inViewCoordinates:(id)a6
{
  uint64_t v11 = (void *)[a5 rects];
  uint64_t v12 = (void *)[a5 strings];
  id v13 = (void *)[a5 rotationAngles];
  unint64_t v14 = [v11 count];
  unint64_t v15 = [v12 count];
  if (v14 >= v15) {
    unint64_t v14 = v15;
  }
  unint64_t v16 = [v13 count];
  if (v14 >= v16) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = v14;
  }
  if (v17)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", i), "CGRectValue");
      objc_msgSend(a6, "convertRectFromPDFPageSpace:");
      objc_msgSend(a6, "convertRect:toView:", self->_pdfView);
      CGRect v28 = CGRectIntegral(v27);
      double x = v28.origin.x;
      double y = v28.origin.y;
      double width = v28.size.width;
      double height = v28.size.height;
      objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:"));
      double v23 = -[_UIAttributedStringView initWithFrame:]([_UIAttributedStringView alloc], "initWithFrame:", x, y, width, height);
      -[_UIAttributedStringView setString:](v23, "setString:", [v12 objectAtIndex:i]);
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", i), "floatValue");
      [(_UIAttributedStringView *)v23 setTextRotationAngle:v24];
      objc_msgSend(a6, "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
      objc_msgSend(a6, "convertRect:toView:", self->_pdfView);
      CGAffineTransformMakeScale(&v26, v25, v25);
      [(UIView *)v23 setTransform:&v26];
      [a4 addObject:v23];
    }
  }
}

- (void)revealSearchResult:(id)a3 andZoomIn:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v7 = [(UIWebPDFViewHandler *)self _scroller:0];
    if (v7)
    {
      unint64_t v8 = v7;
      [a3 boundingBox];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      id v17 = -[UIWebPDFView _addPageAtIndex:](self->_pdfView, "_addPageAtIndex:", [a3 pageIndex]);
      if (v17)
      {
        double v18 = v17;
        objc_msgSend(v17, "convertRectFromPDFPageSpace:", v10, v12, v14, v16);
        objc_msgSend(v18, "convertRect:toView:", self->_pdfView);
        CGRect v36 = CGRectInset(v35, -80.0, -80.0);
        double x = v36.origin.x;
        double y = v36.origin.y;
        double width = v36.size.width;
        double height = v36.size.height;
        if (v4)
        {
          objc_msgSend(v8, "zoomToRect:animated:", 1, v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
        }
        else
        {
          if (+[UIKeyboard activeKeyboard])
          {
            objc_msgSend((id)objc_msgSend(v8, "keyboardSceneDelegate"), "visibleFrameInView:", v8);
            double v24 = v23;
          }
          else
          {
            double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          }
          -[UIView convertPoint:toView:](self->_pdfView, "convertPoint:toView:", v8, x + width * 0.5, y + height * 0.5);
          double v26 = v25;
          double v28 = v27;
          [v8 bounds];
          double v30 = v26 - v29 * 0.5;
          [v8 bounds];
          objc_msgSend(v8, "setContentOffset:animated:", 1, v30, v28 - (v31 - v24) * 0.5);
        }
        if (objc_opt_respondsToSelector())
        {
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(UIWebPDFViewHandler *)self _resultRects:v32 andResultViews:v33 forSearchResult:a3 inViewCoordinates:v18];
          -[UIWebPDFViewHandlerDelegate highlightSearchResultBounds:resultRects:contentViews:forPDFViewHandler:](self->_pdfHandlerDelegate, "highlightSearchResultBounds:resultRects:contentViews:forPDFViewHandler:", v32, v33, self, x, y, width, height);
        }
      }
    }
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)scalesForContainerSize:(CGSize)a3
{
  double width = a3.width;
  [(UIWebPDFView *)self->_pdfView documentBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  pdfView = self->_pdfView;
  if (pdfView) {
    [(UIWebPDFView *)pdfView documentTransform];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  v20.origin.double x = v6;
  v20.origin.double y = v8;
  v20.size.double width = v10;
  v20.size.double height = v12;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  double v14 = width / v21.size.width;
  if (v21.size.width <= 0.0) {
    double v14 = 1.0;
  }
  if (v14 >= 1.0) {
    double v15 = v14;
  }
  else {
    double v15 = 1.0;
  }
  double v16 = 32.0;
  if (!self->_scalesPageToFit)
  {
    double v16 = v15;
    double v14 = v15;
  }
  double v17 = v14;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v14;
  return result;
}

- (void)saveStateToHistoryItem:(id)a3 forWebView:(id)a4
{
  if (![a4 documentType])
  {
    id v6 = [(UIWebPDFViewHandler *)self _scroller:0];
    if (v6)
    {
      double v7 = v6;
      [v6 contentOffset];
      objc_msgSend(a3, "_setScrollPoint:");
      [v7 zoomScale];
      *(float *)&double v8 = v10;
      BOOL v9 = self->_initialZoomScale == v10;
      *(float *)&double v10 = v10;
      objc_msgSend(a3, "_setScale:isInitial:", v9, v10, v8);
    }
  }
}

- (void)restoreStateFromPendingHistoryItem
{
  if (self->_pendingHistoryItemRestore.restorePending)
  {
    id v3 = [(UIWebPDFViewHandler *)self _scroller:0];
    if (v3)
    {
      BOOL v4 = v3;
      uint64_t v5 = 24;
      if (!self->_pendingHistoryItemRestore.isInitialScale) {
        uint64_t v5 = 112;
      }
      double v6 = *(double *)((char *)&self->super.isa + v5);
      [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:1];
      [v4 setZoomScale:v6];
      objc_msgSend(v4, "_setContentOffsetPinned:animated:", 0, self->_pendingHistoryItemRestore.contentOffset.x, self->_pendingHistoryItemRestore.contentOffset.y);
      [(UIWebPDFView *)self->_pdfView setIgnoreContentOffsetChanges:0];
      self->_pendingHistoryItemRestore.restorePending = 0;
    }
  }
}

- (void)restoreStateFromHistoryItem:(id)a3 forWebView:(id)a4
{
  if (![a4 documentType])
  {
    self->_pendingHistoryItemRestore.restorePending = 1;
    self->_pendingHistoryItemRestore.isInitialScale = [a3 _scaleIsInitial];
    [a3 _scrollPoint];
    self->_pendingHistoryItemRestore.contentOffset.double x = v6;
    self->_pendingHistoryItemRestore.contentOffset.double y = v7;
    [a3 _scale];
    self->_pendingHistoryItemRestore.zoomScale = v8;
    if ([(UIWebPDFView *)self->_pdfView _hasPageRects])
    {
      [(UIWebPDFViewHandler *)self restoreStateFromPendingHistoryItem];
      [(UIWebPDFViewHandler *)self ensureCorrectPagesAreInstalled:1];
    }
  }
}

- (id)enclosingScrollView
{
  return [(UIWebPDFViewHandler *)self _scroller:0];
}

- (id)contentView
{
  return self->_pdfView;
}

- (double)zoomedDocumentScale
{
  id v2 = [(UIWebPDFViewHandler *)self _scroller:0];
  if (!v2) {
    return 1.0;
  }
  [v2 zoomScale];
  return result;
}

- (CGRect)visibleContentRect
{
  [(UIWebPDFView *)self->_pdfView _viewportBoundsInUIViewCoords];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)minimumScaleForSize:(CGSize)a3
{
  id v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a3.width, a3.height);
  if (!v3) {
    return 1.0;
  }
  [v3 minimumZoomScale];
  return result;
}

- (CGRect)rectOfInterestForPoint:(CGPoint)a3
{
  double x = self->_rectOfInterest.origin.x;
  double y = self->_rectOfInterest.origin.y;
  double width = self->_rectOfInterest.size.width;
  double height = self->_rectOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)doubleTapScalesForSize:(CGSize)a3
{
  id v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a3.width, a3.height);
  if (v3)
  {
    double v4 = v3;
    [v3 minimumZoomScale];
    double v6 = v5;
    [v4 maximumZoomScale];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = 0.0;
  double v10 = v6;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v10;
  return result;
}

- (BOOL)considerHeightForDoubleTap
{
  return self->_rectOfInterestConsidersHeight;
}

- (void)updateBoundariesOfScrollView:(id)a3 withScales:(id)a4
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  [a3 setMinimumZoomScale:a4.var0];
  [a3 setMaximumZoomScale:var1];
  [(UIWebPDFView *)self->_pdfView setInitialZoomScale:var2];
  self->_double initialZoomScale = var2;
}

- (CGRect)rectOfInterestForRotation
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (double)minimumVerticalContentOffset
{
  return 0.0;
}

- (double)heightToKeepVisible
{
  return 0.0;
}

- (CGRect)activeRectForRectOfInterest:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)_pinValueForVerticalEdge:(unint64_t)a3 inScrollView:(id)a4
{
  double v4 = 0.0;
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      [a4 contentSize];
      double v7 = v6;
      [a4 bounds];
      return v7 - v8;
    }
    return v4;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v4;
  }
  pdfHandlerDelegate = self->_pdfHandlerDelegate;
  [(UIWebPDFViewHandlerDelegate *)pdfHandlerDelegate minimumVerticalContentOffsetForPDFViewHandler:self];
  return result;
}

- (unint64_t)_verticalEdgeForContentOffsetInScrollView:(id)a3
{
  [a3 contentOffset];
  double v6 = v5;
  unint64_t v7 = 1;
  [(UIWebPDFViewHandler *)self _pinValueForVerticalEdge:1 inScrollView:a3];
  if (v6 > v8)
  {
    [(UIWebPDFViewHandler *)self _pinValueForVerticalEdge:2 inScrollView:a3];
    if (v6 >= v9) {
      return 2;
    }
    else {
      return 0;
    }
  }
  return v7;
}

- (void)rotateEnclosingScrollViewToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_passwordEntryView)
  {
    id v8 = [(UIWebPDFViewHandler *)self _scroller:0];
    if (v8)
    {
      id v9 = v8;
      objc_msgSend(v8, "setFrame:", x, y, width, height);
      passwordEntryView = self->_passwordEntryView;
      [(UIWebPDFViewHandler *)self _rectForPasswordView:v9];
      -[UIView setFrame:](passwordEntryView, "setFrame:");
    }
  }
  else
  {
    _UIWebRotateToFrame(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (BOOL)showPageLabels
{
  return self->_showPageLabels;
}

- (BOOL)scalesPageToFit
{
  return self->_scalesPageToFit;
}

- (void)setScalesPageToFit:(BOOL)a3
{
  self->_scalesPageToFit = a3;
}

- (UIWebPDFViewHandlerDelegate)pdfHandlerDelegate
{
  return self->_pdfHandlerDelegate;
}

- (void)setPdfHandlerDelegate:(id)a3
{
  self->_pdfHandlerDelegate = (UIWebPDFViewHandlerDelegate *)a3;
}

- (BOOL)hidePageViewsUntilReadyToRender
{
  return self->_hidePageViewsUntilReadyToRender;
}

- (UIColor)backgroundColorForUnRenderedContent
{
  return self->_backgroundColorForUnRenderedContent;
}

- (BOOL)hideActivityIndicatorForUnRenderedContent
{
  return self->_hideActivityIndicatorForUnRenderedContent;
}

@end