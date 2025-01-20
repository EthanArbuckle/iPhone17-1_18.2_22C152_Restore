@interface UIPDFSelectionController
- (BOOL)instantHighlightMode;
- (BOOL)isTracking;
- (BOOL)rangeMode;
- (BOOL)shouldTrackAt:(CGPoint)a3;
- (BOOL)useParagraphMode;
- (CGPoint)adjustedPoint;
- (CGPoint)currentSelectionPoint;
- (CGPoint)initialSelectionPoint;
- (CGPoint)selectedPointOffset;
- (UIPDFPageView)pageView;
- (UIPDFSelectionController)init;
- (UIPDFSelectionWidget)selectionWidget;
- (id)description;
- (void)addSelectionWidget:(id)a3;
- (void)adjustSelection:(CGPoint)a3;
- (void)clearSelection;
- (void)dealloc;
- (void)endTracking:(CGPoint)a3;
- (void)extendSelectionToParagraph;
- (void)hideWidget;
- (void)layoutSelections;
- (void)selectionHide:(id)a3;
- (void)selectionHideFromAncestor:(id)a3;
- (void)selectionShow:(id)a3;
- (void)selectionShowDelayed:(id)a3;
- (void)selectionShowToAncestor:(id)a3;
- (void)setInstantHighlightMode:(BOOL)a3;
- (void)setPageView:(id)a3;
- (void)setSelectionFor:(CGPoint)a3;
- (void)startSelectingAt:(CGPoint)a3;
- (void)startTracking:(CGPoint)a3 andPoint:(CGPoint)a4;
- (void)startTracking:(CGPoint)a3 showMagnifier:(BOOL *)a4;
- (void)suspendInstantHighlightMode;
- (void)tracking:(CGPoint)a3 andPoint:(CGPoint)a4;
- (void)tracking:(CGPoint)a3 showMagnifier:(BOOL *)a4;
@end

@implementation UIPDFSelectionController

- (UIPDFSelectionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIPDFSelectionController;
  v2 = [(UIPDFSelectionController *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_selectionHideFromAncestor_ name:@"UITextSelectionWillScroll" object:0];
    [v3 addObserver:v2 selector:sel_selectionShowToAncestor_ name:@"UITextSelectionDidScroll" object:0];
    [v3 addObserver:v2 selector:sel_selectionHideFromAncestor_ name:@"UITextSelectionWillZoom" object:0];
    [v3 addObserver:v2 selector:sel_selectionShowToAncestor_ name:@"UITextSelectionDidZoom" object:0];
    [v3 addObserver:v2 selector:sel_selectionHide_ name:@"UIWindowWillRotateNotification" object:0];
    [v3 addObserver:v2 selector:sel_selectionShowDelayed_ name:@"UIWindowDidRotateNotification" object:0];
    v2->_pageView = 0;
    *(_WORD *)&v2->_instantModeIsSuspended = 0;
    v2->_needsLayout = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFSelectionController;
  [(UIPDFSelectionController *)&v3 dealloc];
}

- (void)selectionHideFromAncestor:(id)a3
{
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(UIView *)self->_pageView isDescendantOfView:v5])
  {
    [(UIPDFSelectionController *)self selectionHide:a3];
  }
}

- (void)selectionShowToAncestor:(id)a3
{
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(UIView *)self->_pageView isDescendantOfView:v5])
  {
    [(UIPDFSelectionController *)self selectionShow:a3];
  }
}

- (void)selectionHide:(id)a3
{
  self->_hiding = 1;
  if (self->_selectionWidget) {
    [(UIPDFPageView *)self->_pageView hideSelection];
  }
}

- (void)selectionShow:(id)a3
{
  self->_hiding = 0;
  if (self->_selectionWidget) {
    [(UIPDFPageView *)self->_pageView showSelection];
  }
}

- (void)selectionShowDelayed:(id)a3
{
}

- (void)adjustSelection:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:");
  __n128 v50 = v6;
  __n128 v51 = v7;
  v8 = [(UIPDFPageView *)self->_pageView page];
  uint64_t v9 = [(UIPDFPage *)v8 CGPage];
  if (!self->_rangeMode)
  {
    [(UIPDFSelectionWidget *)self->_selectionWidget selectionRectangle];
    -[UIPDFPageView convertRectToPDFPageSpace:](self->_pageView, "convertRectToPDFPageSpace:");
    uint64_t IntersectingRect = CGPDFSelectionCreateIntersectingRect();
    if (!IntersectingRect) {
      goto LABEL_32;
    }
    goto LABEL_10;
  }
  if (self->_preceeds)
  {
    uint64_t v10 = CGPDFSelectionCreateFromPointToIndex();
    if (v10)
    {
      uint64_t IntersectingRect = v10;
      EndIndeCGFloat x = CGPDFSelectionGetEndIndex();
      lastIndeCGFloat x = self->_lastIndex;
      goto LABEL_9;
    }
    CGPDFPageGetLayout();
    CGPDFLayoutGetCharacterBounds();
    CGFloat v36 = v64.origin.y;
    v37.n128_f64[0] = CGRectGetWidth(v64) + v64.origin.x;
    v38.n128_u64[0] = 0;
    uint64_t v39 = v9;
    __n128 v40 = v50;
    __n128 v41 = v51;
    v42.n128_f64[0] = v36;
  }
  else
  {
    uint64_t v14 = CGPDFSelectionCreateFromIndexToPoint();
    if (v14)
    {
      uint64_t IntersectingRect = v14;
      EndIndeCGFloat x = CGPDFSelectionGetStartIndex();
      lastIndeCGFloat x = self->_firstIndex;
LABEL_9:
      if (EndIndex == lastIndex) {
        goto LABEL_10;
      }
LABEL_31:
      CGPDFSelectionRelease();
      goto LABEL_32;
    }
    CGPDFPageGetLayout();
    CGPDFLayoutGetCharacterBounds();
    v38.n128_u64[0] = 0;
    uint64_t v39 = v9;
    __n128 v37 = v50;
    __n128 v42 = v51;
  }
  uint64_t v46 = MEMORY[0x18C104D70](v39, 3, v40, v41, v37, v42, v38);
  if (!v46) {
    goto LABEL_32;
  }
  uint64_t IntersectingRect = v46;
  if (CGPDFSelectionIsWithinLayout()) {
    goto LABEL_31;
  }
LABEL_10:
  int IsWithinLayout = CGPDFSelectionIsWithinLayout();
  if (!self->_rangeMode || (IsWithinLayout & 1) != 0)
  {
    if (self->_rangeMode) {
      int v23 = 0;
    }
    else {
      int v23 = IsWithinLayout;
    }
    if (v23 == 1)
    {
      CGPDFSelectionGetBounds();
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
      CGRect v58 = CGRectInset(v57, 8.0, 8.0);
      v55.CGFloat x = x;
      v55.CGFloat y = y;
      if (CGRectContainsPoint(v58, v55) && CGPDFSelectionGetNumberOfTextRanges() >= 1)
      {
        memset(&v53, 0, sizeof(v53));
        CGPDFSelectionGetRectAndTransform();
        v59.CGPoint origin = 0u;
        v59.CGSize size = 0u;
        CGRect v60 = CGRectInset(v59, 0.1, 0.1);
        v52.a = v60.origin.x;
        v52.CGFloat b = v60.origin.y;
        v52.CGFloat c = v60.size.width;
        v52.CGFloat d = v60.size.height;
        double MinX = CGRectGetMinX(v60);
        v61.origin.CGFloat x = v52.a;
        v61.origin.CGFloat y = v52.b;
        v61.size.width = v52.c;
        v61.size.height = v52.d;
        double v25 = MinX * 0.0 + CGRectGetMaxY(v61) * 0.0 + 0.0;
        CGPDFSelectionGetRectAndTransform();
        v62.origin.CGFloat x = v52.a;
        v62.origin.CGFloat y = v52.b;
        v62.size.width = v52.c;
        v62.size.height = v52.d;
        CGRect v63 = CGRectInset(v62, 0.1, 0.1);
        v52.a = v63.origin.x;
        v52.CGFloat b = v63.origin.y;
        v52.CGFloat c = v63.size.width;
        v52.CGFloat d = v63.size.height;
        *(double *)&long long v26 = CGRectGetMaxX(v63);
        long long v49 = v26;
        *(CGFloat *)&long long v26 = v52.a;
        CGFloat b = v52.b;
        CGFloat c = v52.c;
        CGFloat d = v52.d;
        double MinY = CGRectGetMinY(*(CGRect *)&v26);
        *(void *)&v31.f64[0] = v50.n128_u64[0];
        *(void *)&v31.f64[1] = v51.n128_u64[0];
        float64x2_t v32 = vsubq_f64(v31, vaddq_f64((float64x2_t)0, vaddq_f64(vmulq_n_f64((float64x2_t)0, *(double *)&v49), vmulq_n_f64((float64x2_t)0, MinY))));
        float64x2_t v33 = vmulq_f64(v32, v32);
        float64x2_t v34 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v33.f64[0], 0);
        v34.f64[0] = (v50.n128_f64[0] - v25) * (v50.n128_f64[0] - v25);
        v33.f64[0] = (v51.n128_f64[0] - v25) * (v51.n128_f64[0] - v25);
        *(float32x2_t *)&v33.f64[0] = vsqrt_f32(vcvt_f32_f64(vaddq_f64(v34, v33)));
        LOBYTE(v33.f64[0]) = vcgt_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v33.f64[0], 1), *(float32x2_t *)&v33.f64[0]).u8[0];
        self->_preceeds = LOBYTE(v33.f64[0]) & 1;
        uint64_t v35 = (LOBYTE(v33.f64[0]) & 1) != 0
            ? CGPDFSelectionCreateFromPointToIndex()
            : CGPDFSelectionCreateFromIndexToPoint();
        uint64_t v47 = v35;
        if (v35)
        {
          CGPDFSelectionRelease();
          [(UIPDFSelectionWidget *)self->_selectionWidget remove];

          v48 = objc_alloc_init(UIPDFTextRangeWidget);
          self->_selectionWidget = (UIPDFSelectionWidget *)v48;
          [(UIPDFTextRangeWidget *)v48 setPageView:self->_pageView];
          self->_rangeMode = 1;
          [(UIPDFSelectionWidget *)self->_selectionWidget setSelectedGrabber:!self->_preceeds];
          uint64_t IntersectingRect = v47;
        }
      }
    }
  }
  else
  {
    v16 = [(UIPDFPageView *)self->_pageView page];
    v17 = [(UIPDFPage *)v16 selection];
    uint64_t v18 = [(UIPDFSelection *)v17 numberOfRectangles];
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t i = 0; i != v19; ++i)
      {
        memset(&v54, 0, sizeof(v54));
        memset(&v53, 0, sizeof(v53));
        [(UIPDFSelection *)v17 getBounds:&v54 transform:&v53 index:i];
        CGPoint origin = v54.origin;
        CGSize size = v54.size;
        CGAffineTransform v52 = v53;
        CGRect v56 = CGRectApplyAffineTransform(v54, &v52);
        v65.CGPoint origin = origin;
        v65.CGSize size = size;
        CGRectUnion(v56, v65);
      }
    }
    CGPDFSelectionRelease();
    [(UIPDFPage *)v16 CGPage];
    uint64_t IntersectingRect = CGPDFSelectionCreateIntersectingRect();
    if (IntersectingRect)
    {
      v43 = [[UIPDFSelection alloc] initWithPage:v16 cgSelection:IntersectingRect];
      [(UIPDFPage *)v16 setSelection:v43];

      [(UIPDFSelectionWidget *)self->_selectionWidget remove];
      self->_rangeMode = 0;
      v44 = objc_alloc_init(UIPDFParagraphWidget);
      self->_selectionWidget = (UIPDFSelectionWidget *)v44;
      [(UIPDFParagraphWidget *)v44 setPageView:self->_pageView];
      [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:v43];
    }
  }
  v45 = [[UIPDFSelection alloc] initWithPage:v8 cgSelection:IntersectingRect];
  self->_firstIndeCGFloat x = [(UIPDFSelection *)v45 startIndex];
  self->_lastIndeCGFloat x = [(UIPDFSelection *)v45 endIndex];
  [(UIPDFPage *)v8 setSelection:v45];

  CGPDFSelectionRelease();
  [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:[[(UIPDFPageView *)self->_pageView page] selection]];
LABEL_32:
  [(UIPDFPageView *)self->_pageView setNeedsDisplay];
}

- (BOOL)useParagraphMode
{
  return 0;
}

- (void)addSelectionWidget:(id)a3
{
  uint64_t v5 = objc_alloc_init(UIPDFTextRangeWidget);
  self->_selectionWidget = (UIPDFSelectionWidget *)v5;
  [(UIPDFTextRangeWidget *)v5 setPageView:self->_pageView];
  [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:a3];
  [(UIPDFSelectionController *)self suspendInstantHighlightMode];
}

- (void)setSelectionFor:(CGPoint)a3
{
  if (!self->_instantHighlightMode)
  {
    double y = a3.y;
    double x = a3.x;
    __n128 v6 = [(UIPDFPageView *)self->_pageView page];
    [(UIPDFPage *)v6 CGPage];
    -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
    uint64_t v7 = CGPDFSelectionCreateAtPointWithOptions();
    if (v7)
    {
      uint64_t v8 = v7;
      BOOL rangeMode = self->_rangeMode;
      IsStandaloneGraphiCGFloat c = CGPDFSelectionIsStandaloneGraphic();
      if (rangeMode)
      {
        if (IsStandaloneGraphic) {
          self->_BOOL rangeMode = 0;
        }
      }
      else if ((IsStandaloneGraphic & 1) == 0)
      {
        self->_BOOL rangeMode = 1;
        CGPDFSelectionRelease();
        uint64_t v8 = CGPDFSelectionCreateAtPointWithOptions();
      }
      v11 = [[UIPDFSelection alloc] initWithPage:v6 cgSelection:v8];
      CGPDFSelectionRelease();
      [(UIPDFPage *)v6 setSelection:v11];
    }
    else
    {
      [(UIPDFPage *)v6 setSelection:0];
    }
    pageView = self->_pageView;
    [(UIPDFPageView *)pageView setSelectionNeedsDisplay];
  }
}

- (void)extendSelectionToParagraph
{
  objc_super v3 = [(UIPDFPageView *)self->_pageView page];
  v4 = [(UIPDFPage *)v3 selection];
  [(UIPDFSelection *)v4 extendToParagraph];
  [(UIPDFPage *)v3 setSelection:v4];
  selectionWidget = self->_selectionWidget;
  [(UIPDFSelectionWidget *)selectionWidget setSelection:v4];
}

- (void)clearSelection
{
  objc_super v3 = [(UIPDFPageView *)self->_pageView page];
  if ([(UIPDFPage *)v3 selection])
  {
    if (self->_selectionWidget)
    {
      [+[UIMenuController sharedMenuController] setMenuVisible:0 animated:1];
      [(UIPDFSelectionWidget *)self->_selectionWidget remove];

      self->_selectionWidget = 0;
    }
    if (self->_instantModeIsSuspended) {
      *(_WORD *)&self->_instantModeIsSuspendeCGFloat d = 256;
    }
    [(UIPDFPage *)v3 setSelection:0];
    pageView = self->_pageView;
    [(UIPDFPageView *)pageView setNeedsDisplay];
  }
}

- (void)hideWidget
{
  selectionWidget = self->_selectionWidget;
  if (selectionWidget) {
    [(UIPDFSelectionWidget *)selectionWidget hide];
  }
}

- (BOOL)shouldTrackAt:(CGPoint)a3
{
  selectionWidget = self->_selectionWidget;
  if (selectionWidget)
  {
    self->_resizingWidget = 0;
    CGPoint v7 = (CGPoint)0;
    int v5 = -[UIPDFSelectionWidget hitTest:fixedPoint:preceeds:](selectionWidget, "hitTest:fixedPoint:preceeds:", &v7, &self->_preceeds, a3.x, a3.y);
    if (v5)
    {
      self->_isTracking = 1;
      self->_selectionFixedPoint = v7;
      self->_resizingWidget = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
    if (self->_instantModeIsSuspended) {
      *(_WORD *)&self->_instantModeIsSuspendeCGFloat d = 256;
    }
  }
  return v5;
}

- (void)startSelectingAt:(CGPoint)a3
{
  -[UIPDFSelectionController setSelectionFor:](self, "setSelectionFor:", a3.x, a3.y);
  if (!self->_rangeMode)
  {
    v4 = [[(UIPDFPageView *)self->_pageView page] selection];
    if (v4)
    {
      int v5 = v4;

      __n128 v6 = objc_alloc_init(UIPDFParagraphWidget);
      self->_selectionWidget = (UIPDFSelectionWidget *)v6;
      [(UIPDFParagraphWidget *)v6 setPageView:self->_pageView];
      [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:v5];
    }
  }
  if ([(UIPDFPageView *)self->_pageView delegate])
  {
    [(UIPDFPageView *)self->_pageView delegate];
    if (objc_opt_respondsToSelector()) {
      [[(UIPDFPageView *)self->_pageView delegate] selectionWillTrack:self->_pageView];
    }
  }
  pageView = self->_pageView;
  [(UIView *)pageView setNeedsLayout];
}

- (void)startTracking:(CGPoint)a3 showMagnifier:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  if (self->_instantHighlightMode)
  {
    self->_cancelleCGFloat d = 0;
    *a4 = 0;
    uint64_t v8 = [(UIPDFPageView *)self->_pageView annotationController];
    if (-[UIPDFAnnotationController willTrackAtPoint:](v8, "willTrackAtPoint:", x, y))
    {
      -[UIPDFAnnotationController startTracking:](v8, "startTracking:", x, y);
      -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
      self->_startPoint.double x = v9;
      self->_startPoint.double y = v10;
    }
    else
    {
      self->_cancelleCGFloat d = 1;
    }
  }
  else if (self->_pageView)
  {
    if (self->_resizingWidget)
    {
      *a4 = self->_rangeMode;
      -[UIPDFSelectionWidget selectedPointFor:](self->_selectionWidget, "selectedPointFor:", a3.x, a3.y);
      self->_adjustedPoint.double x = v11;
      self->_adjustedPoint.double y = v12;
      if ([(UIPDFPageView *)self->_pageView delegate])
      {
        [(UIPDFPageView *)self->_pageView delegate];
        if (objc_opt_respondsToSelector()) {
          [[(UIPDFPageView *)self->_pageView delegate] selectionWillTrack:self->_pageView];
        }
      }
    }
    else
    {
      self->_BOOL rangeMode = ![(UIPDFSelectionController *)self useParagraphMode];
      BOOL v13 = ![(UIPDFPageView *)self->_pageView allowHighlighting] && self->_rangeMode;
      *a4 = v13;
      -[UIPDFSelectionController startSelectingAt:](self, "startSelectingAt:", x, y);
    }
    if (!self->_rangeMode) {
      self->_isTracking = 0;
    }
  }
}

- (void)tracking:(CGPoint)a3 showMagnifier:(BOOL *)a4
{
  if (!self->_pageView) {
    return;
  }
  double y = a3.y;
  double x = a3.x;
  if (!self->_instantHighlightMode)
  {
    if (self->_resizingWidget)
    {
      -[UIPDFSelectionWidget selectedPointFor:](self->_selectionWidget, "selectedPointFor:", a3.x, a3.y);
      self->_adjustedPoint.double x = v9;
      self->_adjustedPoint.double y = v10;
      -[UIPDFSelectionWidget track:](self->_selectionWidget, "track:", x, y);
      -[UIPDFSelectionController adjustSelection:](self, "adjustSelection:", self->_adjustedPoint.x, self->_adjustedPoint.y);
      BOOL rangeMode = self->_rangeMode;
    }
    else
    {
      -[UIPDFSelectionController setSelectionFor:](self, "setSelectionFor:", a3.x, a3.y);
      if (!self->_rangeMode)
      {
        CGFloat v12 = [[(UIPDFPageView *)self->_pageView page] selection];
        selectionWidget = self->_selectionWidget;
        if (v12)
        {
          if (!selectionWidget)
          {
            uint64_t v14 = objc_alloc_init(UIPDFParagraphWidget);
            self->_selectionWidget = (UIPDFSelectionWidget *)v14;
            [(UIPDFParagraphWidget *)v14 setPageView:self->_pageView];
            selectionWidget = self->_selectionWidget;
          }
          [(UIPDFSelectionWidget *)selectionWidget setSelection:v12];
        }
        else if (selectionWidget)
        {
          [(UIPDFSelectionWidget *)selectionWidget remove];

          self->_selectionWidget = 0;
        }
        goto LABEL_11;
      }
      BOOL rangeMode = 1;
    }
    *a4 = rangeMode;
LABEL_11:
    [(UIView *)self->_pageView setNeedsLayout];
    p_needsLayout = &self->_needsLayout;
    goto LABEL_12;
  }
  if (!self->_cancelled)
  {
    *a4 = 0;
    -[UIPDFAnnotationController tracking:]([(UIPDFPageView *)self->_pageView annotationController], "tracking:", a3.x, a3.y);
    p_needsLayout = &self->_needsLayout;
    if (self->_needsLayout)
    {
      [(UIView *)self->_pageView setNeedsLayout];
LABEL_12:
      BOOL *p_needsLayout = 0;
    }
  }
}

- (void)endTracking:(CGPoint)a3
{
  if (self->_instantHighlightMode)
  {
    if (!self->_cancelled)
    {
      double y = a3.y;
      double x = a3.x;
      BOOL v6 = [(UIPDFAnnotationController *)[(UIPDFPageView *)self->_pageView annotationController] madeInstantAnnotation];
      pageView = self->_pageView;
      if (v6)
      {
        -[UIPDFAnnotationController endTrackingAtPoint:]([(UIPDFPageView *)pageView annotationController], "endTrackingAtPoint:", x, y);
      }
      else
      {
        CGFloat v12 = [(UIPDFPageView *)pageView page];
        -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
        [(UIPDFPage *)v12 CGPage];
        uint64_t v13 = CGPDFSelectionCreateAtPointWithOptions();
        if (v13)
        {
          uint64_t v14 = [[UIPDFSelection alloc] initWithPage:[(UIPDFPageView *)self->_pageView page] cgSelection:v13];
          [(UIPDFPage *)v12 setSelection:v14];

          selectionWidget = self->_selectionWidget;
          if (selectionWidget)
          {

            self->_selectionWidget = 0;
          }
          [(UIPDFSelectionController *)self suspendInstantHighlightMode];
          CGPDFSelectionRelease();
        }
      }
      [(UIView *)self->_pageView setNeedsLayout];
      v16 = self->_pageView;
      [(UIPDFPageView *)v16 setNeedsDisplay];
    }
  }
  else
  {
    if (self->_rangeMode)
    {
      uint64_t v8 = [[(UIPDFPageView *)self->_pageView page] selection];
      if (v8)
      {
        if (!self->_resizingWidget)
        {
          CGFloat v9 = v8;
          CGFloat v10 = self->_selectionWidget;
          if (v10) {

          }
          self->_firstIndedouble x = [(UIPDFSelection *)v9 startIndex];
          self->_lastIndedouble x = [(UIPDFSelection *)v9 endIndex];
          CGFloat v11 = objc_alloc_init(UIPDFTextRangeWidget);
          self->_selectionWidget = (UIPDFSelectionWidget *)v11;
          [(UIPDFTextRangeWidget *)v11 setPageView:self->_pageView];
          [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:v9];
        }
      }
    }
    self->_isTracking = 0;
    [(UIPDFSelectionWidget *)self->_selectionWidget endTracking];
    if ([(UIPDFPageView *)self->_pageView delegate])
    {
      [(UIPDFPageView *)self->_pageView delegate];
      if (objc_opt_respondsToSelector()) {
        [[(UIPDFPageView *)self->_pageView delegate] selectionDidEndTracking:self->_pageView];
      }
    }
    [(UIView *)self->_pageView setNeedsLayout];
    [(UIPDFPageView *)self->_pageView setNeedsDisplay];
    self->_resizingWidget = 0;
  }
}

- (void)suspendInstantHighlightMode
{
  objc_super v3 = [[(UIPDFPageView *)self->_pageView page] selection];
  if (v3)
  {
    v4 = v3;
    self->_resizingWidget = 0;
    self->_BOOL rangeMode = 1;
    *(_WORD *)&self->_instantModeIsSuspendeCGFloat d = 1;
    self->_isTracking = 0;
    selectionWidget = self->_selectionWidget;
    if (selectionWidget) {

    }
    BOOL v6 = objc_alloc_init(UIPDFTextRangeWidget);
    self->_selectionWidget = (UIPDFSelectionWidget *)v6;
    [(UIPDFTextRangeWidget *)v6 setPageView:self->_pageView];
    [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:v4];
    uint64_t v7 = [(UIPDFSelection *)v4 CGSelection];
    self->_firstIndedouble x = 0;
    self->_lastIndedouble x = 0;
    if (v7)
    {
      StartIndedouble x = CGPDFSelectionGetStartIndex();
      EndIndedouble x = CGPDFSelectionGetEndIndex();
      if (StartIndex != -1 && EndIndex != -1)
      {
        self->_firstIndedouble x = StartIndex;
        self->_lastIndedouble x = EndIndex;
      }
    }
  }
}

- (void)startTracking:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  CGFloat v9 = [(UIPDFPageView *)self->_pageView page];
  uint64_t v10 = [(UIPDFPage *)v9 CGPage];
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", v7, v6);
  double v12 = v11;
  double v14 = v13;
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
  uint64_t v17 = MEMORY[0x18C104D70](v10, 3, v12, v14, v15, v16, 1.0);
  if (v17)
  {
    uint64_t v18 = [[UIPDFSelection alloc] initWithPage:v9 cgSelection:v17];
    CGPDFSelectionRelease();
    [(UIPDFPage *)v9 setSelection:v18];
    selectionWidget = self->_selectionWidget;
    if (selectionWidget)
    {
      [(UIPDFSelectionWidget *)selectionWidget remove];
    }
    v20 = objc_alloc_init(UIPDFParagraphWidget);
    self->_selectionWidget = (UIPDFSelectionWidget *)v20;
    [(UIPDFParagraphWidget *)v20 setPageView:self->_pageView];
    [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:v18];
    [(UIPDFSelectionWidget *)self->_selectionWidget layout];

    self->_BOOL rangeMode = 0;
    *(_WORD *)&self->_instantModeIsSuspendeCGFloat d = 1;
  }
  else
  {
    [(UIPDFPage *)v9 setSelection:0];
  }
  [(UIView *)self->_pageView setNeedsLayout];
  pageView = self->_pageView;
  [(UIPDFPageView *)pageView setNeedsDisplay];
}

- (void)tracking:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  CGFloat v9 = [(UIPDFPageView *)self->_pageView page];
  uint64_t v10 = [(UIPDFPage *)v9 CGPage];
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", v7, v6);
  double v12 = v11;
  double v14 = v13;
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
  uint64_t v17 = MEMORY[0x18C104D70](v10, 3, v12, v14, v15, v16, 1.0);
  if (v17)
  {
    uint64_t v18 = [[UIPDFSelection alloc] initWithPage:v9 cgSelection:v17];
    CGPDFSelectionRelease();
    [(UIPDFPage *)v9 setSelection:v18];
    [(UIPDFSelectionWidget *)self->_selectionWidget setSelection:v18];
    [(UIPDFSelectionWidget *)self->_selectionWidget layout];

    [(UIView *)self->_pageView setNeedsLayout];
    pageView = self->_pageView;
    [(UIPDFPageView *)pageView setNeedsDisplay];
  }
}

- (CGPoint)selectedPointOffset
{
  [(UIPDFSelectionWidget *)self->_selectionWidget viewOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)initialSelectionPoint
{
  [(UIPDFSelectionWidget *)self->_selectionWidget initialSelectionPointOnPage];
  pageView = self->_pageView;
  -[UIPDFPageView convertPointFromPDFPageSpace:](pageView, "convertPointFromPDFPageSpace:");
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)currentSelectionPoint
{
  [(UIPDFSelectionWidget *)self->_selectionWidget currentSelectionPointOnPage];
  pageView = self->_pageView;
  -[UIPDFPageView convertPointFromPDFPageSpace:](pageView, "convertPointFromPDFPageSpace:");
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (void)layoutSelections
{
  selectionWidget = self->_selectionWidget;
  if (selectionWidget) {
    [(UIPDFSelectionWidget *)selectionWidget layout];
  }
}

- (id)description
{
  uint64_t v2 = [(UIPDFSelectionWidget *)self->_selectionWidget description];
  return (id)[NSString stringWithFormat:@"Selection Controller, widget: %@", v2];
}

- (UIPDFPageView)pageView
{
  return self->_pageView;
}

- (void)setPageView:(id)a3
{
  self->_pageView = (UIPDFPageView *)a3;
}

- (BOOL)rangeMode
{
  return self->_rangeMode;
}

- (UIPDFSelectionWidget)selectionWidget
{
  return self->_selectionWidget;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (CGPoint)adjustedPoint
{
  double x = self->_adjustedPoint.x;
  double y = self->_adjustedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)instantHighlightMode
{
  return self->_instantHighlightMode;
}

- (void)setInstantHighlightMode:(BOOL)a3
{
  self->_instantHighlightMode = a3;
}

@end