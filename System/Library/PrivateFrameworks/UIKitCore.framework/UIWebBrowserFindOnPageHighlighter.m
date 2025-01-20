@interface UIWebBrowserFindOnPageHighlighter
+ (BOOL)expandedRectsWouldIntersect:(id)a3;
- (BOOL)_highlightSelection;
- (BOOL)_updateHighlightedMatchIndex:(BOOL)a3;
- (BOOL)updateHighlightBubbleWobble:(BOOL)a3;
- (NSString)searchText;
- (UIWebBrowserFindOnPageHighlighter)initWithBrowserView:(id)a3;
- (UIWebBrowserFindOnPageHighlighter)initWithPDFViewHandler:(id)a3;
- (UIWebFindOnPageHighlighterDelegate)delegate;
- (id)_currentPDFSearchResult;
- (unint64_t)findOnPageOptions;
- (unint64_t)highlightedMatchIndex;
- (unint64_t)numberOfMatches;
- (void)_addContentViewAtIndex:(unint64_t)a3 withRect:(CGRect)a4;
- (void)_clearHighlightViews;
- (void)_commonInitialize;
- (void)_highlightFindOnPageMatch:(BOOL)a3;
- (void)_highlightFindOnPageMatchForPDF:(BOOL)a3 withPDFHandler:(id)a4;
- (void)_setSelectionRect:(CGRect)a3 textRects:(id)a4 contentImage:(CGImage *)a5 contentViews:(id)a6 wobble:(BOOL)a7;
- (void)clearBrowserView;
- (void)dealloc;
- (void)highlightNextMatch;
- (void)highlightPreviousMatch;
- (void)search:(id)a3 hasPartialResults:(id)a4;
- (void)searchDidBegin:(id)a3;
- (void)searchDidFinish:(id)a3;
- (void)searchDidTimeOut:(id)a3;
- (void)searchLimitHit:(id)a3;
- (void)searchWasCancelled:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchText:(id)a3 matchLimit:(unint64_t)a4;
- (void)setSelectionRect:(CGRect)a3 textRects:(id)a4 contentImage:(CGImage *)a5 wobble:(BOOL)a6;
- (void)setSelectionRect:(CGRect)a3 textRects:(id)a4 contentViews:(id)a5 wobble:(BOOL)a6;
@end

@implementation UIWebBrowserFindOnPageHighlighter

- (UIWebBrowserFindOnPageHighlighter)initWithBrowserView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebBrowserFindOnPageHighlighter;
  v4 = [(UIWebBrowserFindOnPageHighlighter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(UIWebBrowserFindOnPageHighlighter *)v4 _commonInitialize];
    v5->_browserView = (UIWebBrowserView *)a3;
    [a3 addSubview:v5->_highlightHostView];
  }
  return v5;
}

- (UIWebBrowserFindOnPageHighlighter)initWithPDFViewHandler:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebBrowserFindOnPageHighlighter;
  v4 = [(UIWebBrowserFindOnPageHighlighter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(UIWebBrowserFindOnPageHighlighter *)v4 _commonInitialize];
    v5->_pdfHandler = (UIWebPDFViewHandler *)a3;
    objc_msgSend((id)objc_msgSend(a3, "pdfView"), "addSubview:", v5->_highlightHostView);
  }
  return v5;
}

- (void)_commonInitialize
{
  self->_highlightBubbleViews = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_zoomToHighlightSelection = 1;
  self->_highlightedMatchIndex = 0x7FFFFFFFFFFFFFFFLL;
  v3 = [UIView alloc];
  self->_highlightHostView = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dealloc
{
  [(UIWebPDFViewHandler *)self->_pdfHandler clearSearchControllerForHighlighter:self];
  self->_pdfHandler = 0;
  [(UIWebBrowserFindOnPageHighlighter *)self clearBrowserView];
  [(UIView *)self->_highlightHostView removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)UIWebBrowserFindOnPageHighlighter;
  [(UIWebBrowserFindOnPageHighlighter *)&v3 dealloc];
}

- (void)clearBrowserView
{
  self->_browserView = 0;
}

+ (BOOL)expandedRectsWouldIntersect:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 count];
  if (v4 == 1) {
    return 0;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) rectValue];
        CGRect v32 = CGRectInset(v31, -6.0, -6.0);
        double x = v32.origin.x;
        double y = v32.origin.y;
        double width = v32.size.width;
        double height = v32.size.height;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v15 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v6);
              }
              [*(id *)(*((void *)&v20 + 1) + 8 * j) CGRectValue];
              v34.origin.double x = x;
              v34.origin.double y = y;
              v34.size.double width = width;
              v34.size.double height = height;
              if (CGRectIntersectsRect(v33, v34))
              {
                BOOL v5 = 1;
                goto LABEL_21;
              }
            }
            uint64_t v16 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height));
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v24 objects:v29 count:16];
      BOOL v5 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v5 = 0;
  }
LABEL_21:

  return v5;
}

- (void)_addContentViewAtIndex:(unint64_t)a3 withRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(NSArray *)self->_pdfHighlightViews objectAtIndex:a3];
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  highlightHostView = self->_highlightHostView;
  [(UIView *)highlightHostView addSubview:v9];
}

- (void)_clearHighlightViews
{
  self->_pdfHighlightViews = 0;
}

- (void)_setSelectionRect:(CGRect)a3 textRects:(id)a4 contentImage:(CGImage *)a5 contentViews:(id)a6 wobble:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [(UIWebBrowserFindOnPageHighlighter *)self _clearHighlightViews];

  self->_pdfHighlightViews = (NSArray *)a6;
  v11 = +[UIColor clearColor];
  if (v7)
  {
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    uint64_t v12 = [a4 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(a4);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * i) rectValue];
          double x = v55.origin.x;
          double y = v55.origin.y;
          double width = v55.size.width;
          double height = v55.size.height;
          CGRect v56 = CGRectInset(v55, -4.5 - v55.size.width * 0.25, -4.5 - v55.size.height * 0.25);
          long long v21 = -[UIView initWithFrame:]([_UIWebFindOnPageHighlightBubbleView alloc], "initWithFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
          [(UIView *)v21 setBackgroundColor:v11];
          [(UIView *)self->_highlightHostView addSubview:v21];
          [(NSMutableArray *)self->_highlightBubbleViews addObject:v21];
          -[UIWebBrowserFindOnPageHighlighter _addContentViewAtIndex:withRect:](self, "_addContentViewAtIndex:withRect:", v14 + i, x, y, width, height);
        }
        uint64_t v13 = [a4 countByEnumeratingWithState:&v48 objects:v53 count:16];
        v14 += i;
      }
      while (v13);
    }
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __98__UIWebBrowserFindOnPageHighlighter__setSelectionRect_textRects_contentImage_contentViews_wobble___block_invoke;
    v45[3] = &unk_1E5310940;
    CGRect v46 = a3;
    v45[4] = a4;
    v45[5] = self;
    v47 = a5;
    +[UIView animateWithDuration:0 delay:v45 options:0 animations:0.12 completion:0.0];
  }
  else
  {
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    uint64_t v22 = [a4 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(a4);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * j) rectValue];
          CGRect v40 = v57;
          CGRect v58 = CGRectInset(v57, -6.0, -6.0);
          CGFloat v27 = v58.origin.x;
          CGFloat v28 = v58.origin.y;
          CGFloat v29 = v58.size.width;
          CGFloat v38 = v58.size.height;
          CGFloat v39 = v58.size.width;
          double MinX = CGRectGetMinX(a3);
          v59.origin.double x = v27;
          v59.origin.double y = v28;
          v59.size.double width = v29;
          v59.size.double height = v38;
          double v31 = round(MinX - CGRectGetMinX(v59));
          double MinY = CGRectGetMinY(a3);
          v60.origin.double x = v27;
          v60.origin.double y = v28;
          v60.size.double width = v39;
          v60.size.double height = v38;
          double v33 = round(MinY - CGRectGetMinY(v60));
          CGRect v34 = [_UIWebFindOnPageHighlightBubbleView alloc];
          v61.origin.double x = v27;
          v61.origin.double y = v28;
          v61.size.double width = v39;
          v61.size.double height = v38;
          CGRect v62 = CGRectIntegral(v61);
          v35 = -[UIView initWithFrame:](v34, "initWithFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
          [(UIView *)v35 setBackgroundColor:v11];
          -[_UIWebFindOnPageHighlightBubbleView setHighlightedContent:withOrigin:](v35, "setHighlightedContent:withOrigin:", a5, v31, v33);
          [(UIView *)self->_highlightHostView addSubview:v35];
          [(NSMutableArray *)self->_highlightBubbleViews addObject:v35];
          -[UIWebBrowserFindOnPageHighlighter _addContentViewAtIndex:withRect:](self, "_addContentViewAtIndex:withRect:", v24 + j, v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
        }
        uint64_t v23 = [a4 countByEnumeratingWithState:&v41 objects:v52 count:16];
        v24 += j;
      }
      while (v23);
    }
  }
}

uint64_t __98__UIWebBrowserFindOnPageHighlighter__setSelectionRect_textRects_contentImage_contentViews_wobble___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v3 = result;
    for (uint64_t i = 0; i != v3; ++i)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i), "rectValue");
      CGRect v15 = CGRectInset(v14, -6.0, -6.0);
      CGFloat x = v15.origin.x;
      CGFloat y = v15.origin.y;
      CGFloat width = v15.size.width;
      CGFloat height = v15.size.height;
      double MinX = CGRectGetMinX(*(CGRect *)(a1 + 48));
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      double v10 = round(MinX - CGRectGetMinX(v16));
      double MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double v12 = round(MinY - CGRectGetMinY(v17));
      uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 40) + 8) objectAtIndex:i];
      objc_msgSend(v13, "setHighlightedContent:withOrigin:", *(void *)(a1 + 80), v10, v12);
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGRect v19 = CGRectIntegral(v18);
      uint64_t result = objc_msgSend(v13, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    }
  }
  return result;
}

- (void)setSelectionRect:(CGRect)a3 textRects:(id)a4 contentImage:(CGImage *)a5 wobble:(BOOL)a6
{
}

- (void)setSelectionRect:(CGRect)a3 textRects:(id)a4 contentViews:(id)a5 wobble:(BOOL)a6
{
}

- (BOOL)updateHighlightBubbleWobble:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self->_browserView webView];
  v6 = (void *)[v5 selectedFrame];
  if (!v6) {
    v6 = (void *)[v5 mainFrame];
  }
  objc_msgSend((id)objc_msgSend(v6, "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  BOOL v7 = objc_msgSend((id)objc_msgSend(v6, "frameView"), "documentView");
  [v7 selectionRect];
  CGFloat x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat width = v56.size.width;
  CGFloat height = v56.size.height;
  if (CGRectIsEmpty(v56)) {
    return 0;
  }
  uint64_t v13 = (void *)[v7 selectionView];
  CGRect v14 = (void *)[v7 selectionTextRects];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v13 visibleRect];
  CGFloat v16 = v57.origin.x;
  CGFloat v17 = v57.origin.y;
  CGFloat v18 = v57.size.width;
  CGFloat v19 = v57.size.height;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  CGRect v58 = CGRectIntersection(v57, v62);
  objc_msgSend(v13, "convertRect:toView:", 0, v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
  double v45 = v20;
  double v46 = v21;
  double v47 = v22;
  double v48 = v23;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v24 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * i) CGRectValue];
        v63.origin.CGFloat x = v28;
        v63.origin.CGFloat y = v29;
        v63.size.CGFloat width = v30;
        v63.size.CGFloat height = v31;
        v59.origin.CGFloat x = v16;
        v59.origin.CGFloat y = v17;
        v59.size.CGFloat width = v18;
        v59.size.CGFloat height = v19;
        CGRect v60 = CGRectIntersection(v59, v63);
        objc_msgSend(v13, "convertRect:toView:", 0, v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
        double v32 = v61.origin.x;
        double v33 = v61.origin.y;
        double v34 = v61.size.width;
        double v35 = v61.size.height;
        if (!CGRectIsEmpty(v61)) {
          objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v32, v33, v34, v35));
        }
      }
      uint64_t v25 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v25);
  }
  uint64_t v36 = [v15 count];
  BOOL v12 = v36 != 0;
  if (v36)
  {
    uint64_t v37 = [v7 selectionImageForcingBlackText:1];
    if (+[UIWebBrowserFindOnPageHighlighter expandedRectsWouldIntersect:v15])
    {
      uint64_t v53 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v45, v46, v47, v48);
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      CGFloat v39 = self;
      double v40 = v45;
      double v41 = v46;
      double v42 = v47;
      double v43 = v48;
    }
    else
    {
      CGFloat v39 = self;
      double v40 = v45;
      double v41 = v46;
      double v42 = v47;
      double v43 = v48;
      uint64_t v38 = (uint64_t)v15;
    }
    -[UIWebBrowserFindOnPageHighlighter setSelectionRect:textRects:contentImage:wobble:](v39, "setSelectionRect:textRects:contentImage:wobble:", v38, v37, v3, v40, v41, v42, v43);
  }

  return v12;
}

- (BOOL)_highlightSelection
{
  WebThreadLock();
  LODWORD(v3) = [(UIWebBrowserFindOnPageHighlighter *)self updateHighlightBubbleWobble:1];
  if (v3)
  {
    id v4 = [(UIWebDocumentView *)self->_browserView webView];
    uint64_t v3 = [v4 selectedDOMRange];
    if (v3)
    {
      [(UIWebDocumentView *)self->_browserView _documentScale];
      float v6 = v5;
      id v7 = [(UIView *)self->_browserView _scroller];
      [v7 zoomScale];
      double v9 = v8;
      double v10 = (void *)[v4 selectedFrame];
      if (!v10) {
        double v10 = (void *)[v4 mainFrame];
      }
      objc_msgSend((id)objc_msgSend(v10, "frameView"), "documentView");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = objc_msgSend((id)objc_msgSend(v10, "frameView"), "documentView");
        [v11 selectionRect];
        CGFloat x = v53.origin.x;
        CGFloat y = v53.origin.y;
        CGFloat width = v53.size.width;
        CGFloat height = v53.size.height;
        IsEmptCGFloat y = CGRectIsEmpty(v53);
        if (IsEmpty)
        {
LABEL_21:
          LOBYTE(v3) = !IsEmpty;
          return v3;
        }
        CGFloat v17 = (void *)[v11 selectionView];
        [v17 visibleRect];
        v61.origin.CGFloat x = x;
        v61.origin.CGFloat y = y;
        v61.size.CGFloat width = width;
        v61.size.CGFloat height = height;
        CGRect v55 = CGRectIntersection(v54, v61);
        double v18 = v55.origin.x;
        double v19 = v55.origin.y;
        double v20 = v55.size.width;
        double v21 = v55.size.height;
        double v50 = v6;
        if (self->_zoomToHighlightSelection)
        {
          char v52 = 0;
          int v51 = 0;
          double MidX = CGRectGetMidX(v55);
          v56.origin.CGFloat x = v18;
          v56.origin.CGFloat y = v19;
          v56.size.CGFloat width = v20;
          v56.size.CGFloat height = v21;
          objc_msgSend((id)objc_msgSend(v17, "_frame"), "renderRectForPoint:isReplaced:fontSize:", &v52, &v51, MidX, CGRectGetMidY(v56));
          objc_msgSend(v17, "convertRect:toView:", 0);
          double v48 = v19;
          double v49 = v18;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          double v28 = v27;
          double v30 = v29;
          [v7 visibleBounds];
          double v33 = v9 * v32 / v28;
          if (v33 >= v9 * v31 / v30) {
            double v33 = v9 * v31 / v30;
          }
          double v34 = v33 + v33 * -0.05;
          [v7 minimumZoomScale];
          if (v34 >= v35) {
            double v35 = v34;
          }
          double v36 = fmin(v35, 1.6);
          self->_zoomToHighlightSelection = 0;
          if (v36 - v9 >= 0.02) {
            double v37 = v36;
          }
          else {
            double v37 = v9;
          }
          if (v37 != v9) {
            goto LABEL_20;
          }
          double v19 = v48;
          double v18 = v49;
        }
        else
        {
          double v37 = v9;
        }
        objc_msgSend(v17, "convertRect:toView:", 0, v18, v19, v20, v21);
        CGFloat v24 = v38;
        CGFloat v26 = v39;
        double v28 = v40;
        double v30 = v41;
LABEL_20:
        v57.origin.CGFloat x = v24;
        v57.origin.CGFloat y = v26;
        v57.size.CGFloat width = v28;
        v57.size.CGFloat height = v30;
        CGRect v58 = CGRectInset(v57, -20.0, -20.0);
        double v42 = v58.origin.x;
        double v43 = v58.origin.y;
        double v44 = v58.size.width;
        double v45 = v58.size.height;
        [(UIWebTiledView *)self->_browserView layoutTilesNowForRect:"layoutTilesNowForRect:"];
        v59.origin.CGFloat x = v42;
        v59.origin.CGFloat y = v43;
        v59.size.CGFloat width = v44;
        v59.size.CGFloat height = v45;
        double MinX = CGRectGetMinX(v59);
        v60.origin.CGFloat x = v42;
        v60.origin.CGFloat y = v43;
        v60.size.CGFloat width = v44;
        v60.size.CGFloat height = v45;
        -[UIWebBrowserView _zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:](self->_browserView, "_zoomToRect:ensuringVisibilityOfRect:withScale:forceScroll:", 1, v42, v43, v44, v45, MinX, CGRectGetMaxY(v60), 1.0, 1.0, v37 * v50);
        goto LABEL_21;
      }
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (unint64_t)findOnPageOptions
{
  return 55;
}

- (void)setSearchText:(id)a3 matchLimit:(unint64_t)a4
{
  self->_highlightedMatchIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
  if ([a3 caseInsensitiveCompare:self->_searchText])
  {
    [(UIWebBrowserFindOnPageHighlighter *)self _clearHighlightViews];
    if ([a3 length])
    {
      self->_numberOfMatches = 0x7FFFFFFFFFFFFFFFLL;

      self->_searchText = (NSString *)[a3 copy];
      pdfHandler = self->_pdfHandler;
      if (pdfHandler)
      {
        id v8 = [(UIWebPDFViewHandler *)pdfHandler searchControllerForHighlighter:self];
        [v8 setSearchDelegate:self];
        [v8 setResultLimit:a4 + 1];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __62__UIWebBrowserFindOnPageHighlighter_setSearchText_matchLimit___block_invoke;
        v11[3] = &unk_1E52EBA80;
        v11[4] = v8;
        v11[5] = a3;
        dispatch_async(MEMORY[0x1E4F14428], v11);
      }
      else
      {
        WebThreadLock();
        id v9 = [(UIWebDocumentView *)self->_browserView webView];
        double v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "mainFrame"), "frameView"), "documentView");
        if ([v10 conformsToProtocol:&unk_1ED701CC0]) {
          [v10 deselectAll];
        }
        self->_numberOfMatches = objc_msgSend(v9, "countMatchesForText:options:highlight:limit:markMatches:", a3, -[UIWebBrowserFindOnPageHighlighter findOnPageOptions](self, "findOnPageOptions"), 0, a4 + 1, 0);
      }
    }
    else
    {
      self->_numberOfMatches = 0;

      self->_searchText = 0;
    }
  }
}

uint64_t __62__UIWebBrowserFindOnPageHighlighter_setSearchText_matchLimit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) search:*(void *)(a1 + 40)];
}

- (BOOL)_updateHighlightedMatchIndex:(BOOL)a3
{
  unint64_t numberOfMatches = self->_numberOfMatches;
  if (numberOfMatches)
  {
    highlightedMatchIndeCGFloat x = self->_highlightedMatchIndex;
    unint64_t v5 = highlightedMatchIndex - 1;
    if (highlightedMatchIndex == 0x7FFFFFFFFFFFFFFFLL || highlightedMatchIndex == 0) {
      unint64_t v5 = numberOfMatches - 1;
    }
    if (highlightedMatchIndex == numberOfMatches - 1 || highlightedMatchIndex == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = highlightedMatchIndex + 1;
    }
    if (!a3) {
      unint64_t v8 = v5;
    }
    self->_highlightedMatchIndeCGFloat x = v8;
  }
  return numberOfMatches != 0;
}

- (id)_currentPDFSearchResult
{
  id v3 = [(UIWebPDFViewHandler *)self->_pdfHandler searchControllerForHighlighter:self];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = (void *)[v3 results];
  if (![v5 count]) {
    return 0;
  }
  highlightedMatchIndeCGFloat x = self->_highlightedMatchIndex;
  if (highlightedMatchIndex == 0x7FFFFFFFFFFFFFFFLL || highlightedMatchIndex >= [v5 count]) {
    return 0;
  }
  id v7 = (void *)[v4 results];
  unint64_t v8 = self->_highlightedMatchIndex;
  return (id)[v7 objectAtIndex:v8];
}

- (void)_highlightFindOnPageMatchForPDF:(BOOL)a3 withPDFHandler:(id)a4
{
  if ([(UIWebBrowserFindOnPageHighlighter *)self _updateHighlightedMatchIndex:a3])
  {
    objc_msgSend(a4, "revealSearchResult:andZoomIn:", -[UIWebBrowserFindOnPageHighlighter _currentPDFSearchResult](self, "_currentPDFSearchResult"), self->_zoomToHighlightSelection);
    self->_zoomToHighlightSelection = 0;
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterDidHighlightMatch:self];
    }
  }
}

- (void)_highlightFindOnPageMatch:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_pdfHandler)
  {
    -[UIWebBrowserFindOnPageHighlighter _highlightFindOnPageMatchForPDF:withPDFHandler:](self, "_highlightFindOnPageMatchForPDF:withPDFHandler:");
  }
  else if (self->_browserView)
  {
    WebThreadLock();
    id v5 = [(UIWebDocumentView *)self->_browserView webView];
    float v6 = (void *)[v5 mainFrame];
    [v6 recursiveSetUpdateAppearanceEnabled:1];
    unint64_t v7 = [(UIWebBrowserFindOnPageHighlighter *)self findOnPageOptions];
    if (v3) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v7 | 8;
    }
    int v9 = 3;
    while (1)
    {
      [v5 findString:self->_searchText options:v8];
      if ([(UIWebBrowserFindOnPageHighlighter *)self _highlightSelection]) {
        break;
      }
      if (!--v9)
      {
        [v6 recursiveSetUpdateAppearanceEnabled:0];
        return;
      }
    }
    [v6 recursiveSetUpdateAppearanceEnabled:0];
    [(UIWebBrowserFindOnPageHighlighter *)self _updateHighlightedMatchIndex:v3];
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterDidHighlightMatch:self];
    }
  }
}

- (void)highlightNextMatch
{
}

- (void)highlightPreviousMatch
{
}

- (void)searchDidBegin:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterSearchDidBegin:self];
  }
}

- (void)searchDidTimeOut:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterSearchDidTimeOut:self];
  }
}

- (void)searchWasCancelled:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterSearchWasCancelled:self];
  }
}

- (void)searchLimitHit:(id)a3
{
  [a3 pause];
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterSearchLimitHit:self];
  }
}

- (void)searchDidFinish:(id)a3
{
  if (self->_numberOfMatches == 0x7FFFFFFFFFFFFFFFLL) {
    self->_unint64_t numberOfMatches = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighterSearchDidFinish:self];
  }
}

- (void)search:(id)a3 hasPartialResults:(id)a4
{
  unint64_t numberOfMatches = self->_numberOfMatches;
  unint64_t v7 = objc_msgSend(a4, "count", a3);
  if (numberOfMatches != 0x7FFFFFFFFFFFFFFFLL) {
    v7 += self->_numberOfMatches;
  }
  self->_unint64_t numberOfMatches = v7;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFindOnPageHighlighterDelegate *)delegate findOnPageHighlighter:self hasPartialSearchResults:a4];
  }
}

- (NSString)searchText
{
  return self->_searchText;
}

- (UIWebFindOnPageHighlighterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIWebFindOnPageHighlighterDelegate *)a3;
}

- (unint64_t)numberOfMatches
{
  return self->_numberOfMatches;
}

- (unint64_t)highlightedMatchIndex
{
  return self->_highlightedMatchIndex;
}

@end