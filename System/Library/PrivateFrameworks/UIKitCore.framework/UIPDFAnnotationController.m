@interface UIPDFAnnotationController
+ (BOOL)pageHasAnnotations:(id)a3;
+ (CGImage)newMaskImage:(CGPDFPage *)a3 size:(CGSize)a4;
+ (id)newAnnotation:(CGPDFDictionary *)a3 type:(const char *)a4;
- (BOOL)allowEditing;
- (BOOL)annotationBriefPressRecognized:(id)a3;
- (BOOL)annotationSingleTapRecognized:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)intersects:(CGPDFSelection *)a3 with:(CGPDFSelection *)a4;
- (BOOL)isLinkAnnotationAt:(CGPoint)a3;
- (BOOL)isSelection:(CGPDFSelection *)a3 equalTo:(CGPDFSelection *)a4;
- (BOOL)linkAnnotationShouldBegin:(id)a3;
- (BOOL)madeInstantAnnotation;
- (BOOL)makeUnderlineAnnotation;
- (BOOL)trackMoved:(CGPoint)a3;
- (BOOL)tracking;
- (BOOL)willDoSomethingWithTap:(CGPoint)a3;
- (BOOL)willHandleTouchGestureAtPoint:(CGPoint)a3;
- (BOOL)willTrackAtPoint:(CGPoint)a3;
- (CALayer)drawingSurface;
- (CGImage)newHighlightMaskImageFor:(CGRect)a3;
- (CGImage)underlineImageFor:(CGRect)a3;
- (CGPoint)convertPoint:(CGPoint)a3 toSurfaceLayer:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toSurfaceLayer:(id)a4;
- (CGSize)marginNoteImageSize;
- (NSObject)delegate;
- (UIColor)currentColor;
- (UIPDFAnnotation)currentAnnotation;
- (UIPDFAnnotationController)init;
- (UIPDFAnnotationController)initWithPageView:(id)a3;
- (UIPDFPageView)pageView;
- (id)_linkAnnotationViewAt:(CGPoint)a3;
- (id)annotatePageSelection;
- (id)annotationAt:(CGPoint)a3;
- (id)linkAnnotationAt:(CGPoint)a3;
- (id)marginNoteImage:(id)a3;
- (void)_addAnnotationViewFor:(id)a3;
- (void)_addLinkAnnotationViewFor:(id)a3;
- (void)_addRecognizers:(id)a3;
- (void)_initialRange:(CGPoint)a3;
- (void)addAnnotation:(id)a3;
- (void)addDrawingSurface:(id)a3 view:(id)a4;
- (void)addLinkAnnotationViews;
- (void)annotationTapRecognized:(id)a3;
- (void)copyAttributesOf:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)doubleTapRecognized:(id)a3;
- (void)drawAnnotations:(CGContext *)a3;
- (void)endTrackingAtPoint:(CGPoint)a3;
- (void)layoutAnnotationViews:(id)a3;
- (void)linkPressRecognized:(id)a3;
- (void)lock;
- (void)mergeSelectionOfAnnotation:(id)a3;
- (void)resetBeingPressedForRecognizer:(id)a3 withDelegate:(id)a4 withAnnotation:(id)a5;
- (void)setAllowEditing:(BOOL)a3;
- (void)setCurrentAnnotation:(id)a3;
- (void)setCurrentColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingSurface:(id)a3;
- (void)setMakeUnderlineAnnotation:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setSurfacePosition:(id)a3;
- (void)setView:(id)a3;
- (void)startTracking:(CGPoint)a3;
- (void)tracking:(CGPoint)a3;
- (void)unlock;
@end

@implementation UIPDFAnnotationController

+ (BOOL)pageHasAnnotations:(id)a3
{
  if (a3)
  {
    Dictionary = CGPDFPageGetDictionary((CGPDFPageRef)[a3 CGPage]);
    if (Dictionary)
    {
      CGPDFArrayRef value = 0;
      LOBYTE(Dictionary) = CGPDFDictionaryGetArray(Dictionary, "Annots", &value);
    }
  }
  else
  {
    LOBYTE(Dictionary) = 0;
  }
  return (char)Dictionary;
}

+ (id)newAnnotation:(CGPDFDictionary *)a3 type:(const char *)a4
{
  if (!strcmp("Underline", a4))
  {
    v7 = off_1E52D4318;
  }
  else if (!strcmp("Text", a4))
  {
    v7 = off_1E52D4310;
  }
  else if (!strcmp("FreeText", a4))
  {
    v7 = off_1E52D42A8;
  }
  else if (!strcmp("Highlight", a4))
  {
    v7 = off_1E52D42B0;
  }
  else if (!strcmp("StrikeOut", a4))
  {
    v7 = off_1E52D4308;
  }
  else if (!strcmp("Circle", a4))
  {
    v7 = off_1E52D4298;
  }
  else if (!strcmp("Square", a4))
  {
    v7 = off_1E52D42F8;
  }
  else if (!strcmp("Line", a4))
  {
    v7 = off_1E52D42B8;
  }
  else if (!strcmp("Popup", a4))
  {
    v7 = off_1E52D42E8;
  }
  else if (!strcmp("Link", a4))
  {
    v7 = off_1E52D42C0;
  }
  else
  {
    if (strcmp("Stamp", a4)) {
      return 0;
    }
    v7 = off_1E52D4300;
  }
  id v8 = objc_alloc(*v7);
  return (id)[v8 initWithAnnotationDictionary:a3];
}

- (UIPDFAnnotationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFAnnotationController;
  result = [(UIPDFAnnotationController *)&v3 init];
  if (result)
  {
    result->_tracking = 0;
    result->_cachedMarginNoteSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (UIPDFAnnotationController)initWithPageView:(id)a3
{
  v4 = [(UIPDFAnnotationController *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_pageView = (UIPDFPageView *)a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    [(UIPDFAnnotationController *)v4 setMakeUnderlineAnnotation:0];
    -[UIPDFAnnotationController setDrawingSurface:](v5, "setDrawingSurface:", [a3 layer]);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFAnnotationController;
  [(UIPDFAnnotationController *)&v3 dealloc];
}

- (void)addAnnotation:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)willHandleTouchGestureAtPoint:(CGPoint)a3
{
  objc_super v3 = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v4 = (void *)[(UIView *)v3 annotation];
  return [v4 recognizeGestures];
}

- (void)addLinkAnnotationViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [[(UIPDFPageView *)self->_pageView page] annotations];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 hidden] & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v8, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
            if (![v8 annotationView]) {
              [(UIPDFAnnotationController *)self _addLinkAnnotationViewFor:v8];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CGPoint)convertPoint:(CGPoint)a3 toSurfaceLayer:(id)a4
{
  -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  long long v10 = [[(UIView *)self->_pageView superview] layer];
  -[CALayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", [(UIView *)self->_pageView layer], v7, v9);
  objc_msgSend(a4, "convertPoint:fromLayer:", v10);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toSurfaceLayer:(id)a4
{
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [[(UIView *)self->_pageView superview] layer];
  -[CALayer convertRect:fromLayer:](v14, "convertRect:fromLayer:", [(UIView *)self->_pageView layer], v7, v9, v11, v13);
  objc_msgSend(a4, "convertRect:fromLayer:", v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)addDrawingSurface:(id)a3 view:(id)a4
{
  double v6 = objc_alloc_init(SurfaceLayer);
  [(SurfaceLayer *)v6 setDelegate:a3];
  [(CALayer *)self->_drawingSurface addSublayer:v6];
  [a3 setDrawingLayer:v6];
  [(UIPDFAnnotationController *)self setSurfacePosition:a3];
  [(SurfaceLayer *)v6 setNeedsDisplay];
}

- (void)setSurfacePosition:(id)a3
{
  uint64_t v5 = (void *)[a3 selection];
  if (v5)
  {
    double v6 = v5;
    [v5 bounds];
    double x = v7;
    double y = v9;
    double width = v11;
    double height = v13;
    memset(&v25[1], 0, sizeof(CGAffineTransform));
    [v6 transform];
    v25[0] = v25[1];
    if (!CGAffineTransformIsIdentity(v25))
    {
      v25[0] = v25[1];
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.double width = width;
      v26.size.double height = height;
      CGRect v27 = CGRectApplyAffineTransform(v26, v25);
      double x = v27.origin.x;
      double y = v27.origin.y;
      double width = v27.size.width;
      double height = v27.size.height;
    }
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, width, height);
    -[UIView convertRect:fromView:]([(UIView *)self->_pageView superview], "convertRect:fromView:", self->_pageView, v15, v16, v17, v18);
    CGFloat v19 = v28.origin.x;
    CGFloat v20 = v28.origin.y;
    double v21 = v28.size.width;
    double v22 = v28.size.height;
    double MidX = CGRectGetMidX(v28);
    v29.origin.double x = v19;
    v29.origin.double y = v20;
    v29.size.double width = v21;
    v29.size.double height = v22;
    double MidY = CGRectGetMidY(v29);
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_msgSend((id)objc_msgSend(a3, "drawingLayer"), "setBounds:", 0.0, 0.0, v21, v22);
    objc_msgSend((id)objc_msgSend(a3, "drawingLayer"), "setPosition:", MidX, MidY);
    [MEMORY[0x1E4F39CF8] setDisableActions:0];
    objc_msgSend((id)objc_msgSend(a3, "drawingLayer"), "setNeedsDisplay");
  }
}

- (void)_addRecognizers:(id)a3
{
  uint64_t v5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_doubleTapRecognized_];
  [(UIGestureRecognizer *)v5 setDelegate:self];
  [(UITapGestureRecognizer *)v5 setNumberOfTapsRequired:2];
  [a3 addGestureRecognizer:v5];
  double v6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_annotationTapRecognized_];
  [(UIGestureRecognizer *)v6 setDelegate:self];
  [(UITapGestureRecognizer *)v6 setNumberOfTapsRequired:1];
  [a3 addGestureRecognizer:v6];
  [(UIGestureRecognizer *)v6 requireGestureRecognizerToFail:v5];

  [a3 annotation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel_linkPressRecognized_];
    [(UIGestureRecognizer *)v7 setDelegate:self];
    [a3 addGestureRecognizer:v7];
  }
}

- (void)_addLinkAnnotationViewFor:(id)a3
{
  [a3 Rect];
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
  double v9 = -[UIView initWithFrame:]([UIPDFAnnotationView alloc], "initWithFrame:", v5, v6, v7, v8);
  [(UIView *)v9 setBackgroundColor:+[UIColor clearColor]];
  [(UIView *)self->_pageView addSubview:v9];
  [a3 setAnnotationView:v9];
  [(UIPDFAnnotationView *)v9 setAnnotation:a3];
  [(UIPDFAnnotationController *)self _addRecognizers:v9];
}

- (void)_addAnnotationViewFor:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (double v5 = (void *)[a3 selection]) == 0)
  {
    [a3 Rect];
    goto LABEL_7;
  }
  double v6 = v5;
  [v5 bounds];
  double x = v7;
  double y = v9;
  double width = v11;
  double height = v13;
  memset(&v20[1], 0, sizeof(CGAffineTransform));
  [v6 transform];
  v20[0] = v20[1];
  if (!CGAffineTransformIsIdentity(v20))
  {
    v20[0] = v20[1];
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    CGRect v22 = CGRectApplyAffineTransform(v21, v20);
LABEL_7:
    double x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
  }
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, width, height);
  CGFloat v19 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "viewClass")), "initWithFrame:", v15, v16, v17, v18);
  objc_msgSend(v19, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  [(UIView *)self->_pageView addSubview:v19];
  [a3 setAnnotationView:v19];
  [v19 setAnnotation:a3];
  [(UIPDFAnnotationController *)self _addRecognizers:v19];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(UIPDFAnnotationController *)self addDrawingSurface:a3 view:v19];
    }
  }
}

- (void)layoutAnnotationViews:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [[(UIPDFPageView *)self->_pageView page] annotations];
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_lock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v9 hidden] & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if ([(UIPDFPageView *)self->_pageView allowHighlighting]
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || [(UIPDFPageView *)self->_pageView showTextAnnotations])
                {
                  objc_msgSend(v9, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
                  if (([(UIPDFPageView *)self->_pageView allowHighlighting]
                     || [(UIPDFPageView *)self->_pageView showAnnotations])
                    && [v9 recognizeGestures]
                    && ![v9 annotationView])
                  {
                    [(UIPDFAnnotationController *)self _addAnnotationViewFor:v9];
                  }
                }
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    if ([(UIPDFPageView *)self->_pageView allowHighlighting])
    {
      [(UIPDFAnnotationController *)self marginNoteImageSize];
      double v12 = -[UIPDFPlacementController initWithAnnotations:viewSize:]([UIPDFPlacementController alloc], "initWithAnnotations:viewSize:", v4, v10 + 4.0, v11 + 4.0);
      [(UIPDFPlacementController *)v12 setPageView:self->_pageView];
      [(UIPDFPlacementController *)v12 layoutViews:-4.0];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)setView:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_pageView = (UIPDFPageView *)a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setNeedsDisplay
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [[(UIPDFPageView *)self->_pageView page] annotations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 annotationType] == 9) {
          double v8 = (void *)[v7 annotationView];
        }
        else {
          double v8 = (void *)[v7 drawingLayer];
        }
        [v8 setNeedsDisplay];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)drawAnnotations:(CGContext *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pageView = self->_pageView;
  if (pageView)
  {
    uint64_t v7 = pageView;
    lock = p_lock;
    BOOL v8 = ![(UIPDFPageView *)self->_pageView showAnnotations]
      && [(UIPDFPageView *)self->_pageView allowHighlighting];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [[(UIPDFPageView *)self->_pageView page] annotations];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || [(UIPDFPageView *)self->_pageView showTextAnnotations])
          {
            if (v8)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v14 parent];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_20;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_20:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                }
              }
            }
            [v14 drawInContext:a3];
            continue;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    os_unfair_lock_unlock(lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = (void *)[a3 view];
  [v4 annotation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[v4 annotation];
    [a3 locationInView:v4];
    return objc_msgSend(v5, "shouldRecognizeTapOrPress:");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 annotation];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return 1;
      }
    }
    uint64_t v7 = (void *)[v4 annotation];
    return [v7 hasPopUp];
  }
}

- (void)doubleTapRecognized:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "view"), "annotation");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 state] == 3)
  {
    pageView = self->_pageView;
    [a3 locationInView:pageView];
    -[UIPDFPageView doubleTapAt:](pageView, "doubleTapAt:");
  }
}

- (void)resetBeingPressedForRecognizer:(id)a3 withDelegate:(id)a4 withAnnotation:(id)a5
{
  [(UIPDFPageView *)self->_pageView clearSelection];
  if (objc_opt_respondsToSelector())
  {
    [a3 locationInView:self->_pageView];
    objc_msgSend(a4, "annotation:isBeingPressedAtPoint:controller:", a5, self);
  }
}

- (void)linkPressRecognized:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "view"), "annotation");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(UIPDFAnnotationController *)self delegate];
    if (v6)
    {
      uint64_t v7 = v6;
      if ([a3 state] == 1)
      {
        [(UIPDFAnnotationController *)self resetBeingPressedForRecognizer:a3 withDelegate:v7 withAnnotation:v5];
      }
    }
  }
}

- (void)annotationTapRecognized:(id)a3
{
  if (self->_pageView)
  {
    uint64_t v5 = [a3 view];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 annotation];
        if ([a3 state] == 3)
        {
          [(UIPDFPageView *)self->_pageView clearSelection];
          BOOL v8 = [(UIPDFAnnotationController *)self delegate];
          if (objc_opt_respondsToSelector())
          {
            [a3 locationInView:self->_pageView];
            -[NSObject annotation:wasTouchedAtPoint:controller:](v8, "annotation:wasTouchedAtPoint:controller:", v7, self);
          }
        }
      }
    }
  }
}

- (BOOL)intersects:(CGPDFSelection *)a3 with:(CGPDFSelection *)a4
{
  uint64_t NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
  uint64_t v5 = CGPDFSelectionGetNumberOfTextRanges();
  if (NumberOfTextRanges < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    BOOL v8 = 1;
    while (1)
    {
      uint64_t TextRange = CGPDFSelectionGetTextRange();
      if (v6 >= 1) {
        break;
      }
LABEL_8:
      BOOL v8 = ++v7 < NumberOfTextRanges;
      if (v7 == NumberOfTextRanges) {
        return v8;
      }
    }
    uint64_t v11 = TextRange;
    uint64_t v12 = 0;
    uint64_t v13 = TextRange + v10;
    while (1)
    {
      uint64_t v14 = CGPDFSelectionGetTextRange();
      if (v13 > v14 && v14 + v15 > v11) {
        break;
      }
      if (v6 == ++v12) {
        goto LABEL_8;
      }
    }
  }
  return v8;
}

- (BOOL)isSelection:(CGPDFSelection *)a3 equalTo:(CGPDFSelection *)a4
{
  if (a3 == a4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
    if (NumberOfTextRanges == CGPDFSelectionGetNumberOfTextRanges())
    {
      uint64_t v5 = NumberOfTextRanges - 1;
      if (NumberOfTextRanges < 1)
      {
        LOBYTE(v12) = 1;
      }
      else
      {
        uint64_t v6 = 0;
        do
        {
          uint64_t TextRange = CGPDFSelectionGetTextRange();
          uint64_t v9 = v8;
          BOOL v12 = TextRange == CGPDFSelectionGetTextRange() && v9 == v10;
        }
        while (v12 && v5 != v6++);
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (void)mergeSelectionOfAnnotation:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v42 = (void *)[a3 selection];
  uint64_t v4 = [v42 CGSelection];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [[(UIPDFPageView *)self->_pageView page] annotations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v12 = (void *)[v11 selection];
          if (v12)
          {
            uint64_t v13 = [v12 CGSelection];
            if (v13)
            {
              uint64_t v14 = v13;
              if (![(UIPDFAnnotationController *)self isSelection:v4 equalTo:v13])
              {
                if ([(UIPDFAnnotationController *)self intersects:v4 with:v14]) {
                  [v5 addObject:v11];
                }
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v8);
  }
  uint64_t v15 = [v5 count];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = [v42 extent];
    uint64_t v18 = 0;
    uint64_t v20 = v19 + v17 - 1;
    do
    {
      uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v18), "selection"), "extent");
      if (v21 < v17) {
        uint64_t v17 = v21;
      }
      if (v22 + v21 - 1 > v20) {
        uint64_t v20 = v22 + v21 - 1;
      }
      ++v18;
    }
    while (v16 != v18);
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v24 = [v5 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v5);
          }
          CGRect v28 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          if ([v28 popup])
          {
            uint64_t v29 = [v28 contents];
            if (v29)
            {
              uint64_t v30 = v29;
              if ([v23 length]) {
                [v23 appendString:@"\n"];
              }
              [v23 appendString:v30];
            }
          }
          v31 = [(UIPDFAnnotationController *)self delegate];
          if (objc_opt_respondsToSelector()) {
            [v31 annotationWasRemoved:v28 controller:self];
          }
          v32 = (void *)[v28 popup];
          if (v32)
          {
            v33 = v32;
            [v32 setParent:0];
            [[(UIPDFPageView *)self->_pageView page] removeAnnotation:v33];
          }
          [[(UIPDFPageView *)self->_pageView page] removeAnnotation:v28];
        }
        uint64_t v25 = [v5 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v25);
    }

    [[(UIPDFPageView *)self->_pageView page] CGPage];
    uint64_t v34 = CGPDFSelectionCreateForRange();
    if (v34)
    {
      v35 = [[UIPDFSelection alloc] initWithPage:[(UIPDFPageView *)self->_pageView page] cgSelection:v34];
      [a3 setSelection:v35];

      if ([a3 annotationView])
      {
        CGPDFSelectionGetBounds();
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
        objc_msgSend((id)objc_msgSend(a3, "annotationView"), "setFrame:", v36, v37, v38, v39);
        [(UIPDFAnnotationController *)self setSurfacePosition:a3];
      }
      else
      {
        [(UIPDFAnnotationController *)self _addAnnotationViewFor:a3];
      }
      if ([v23 length])
      {
        v40 = objc_alloc_init(UIPDFPopupAnnotation);
        [a3 setPopup:v40];
        [a3 setContents:v23];
        [(UIPDFPopupAnnotation *)v40 setParent:a3];
        [[(UIPDFPageView *)self->_pageView page] addAnnotation:v40];
      }
      CGPDFSelectionRelease();
    }
  }
  else
  {
    v23 = v5;
  }
}

- (BOOL)madeInstantAnnotation
{
  return self->_currentAnnotation != 0;
}

- (BOOL)trackMoved:(CGPoint)a3
{
  BOOL v3 = vabdd_f64(self->_startPoint.x, a3.x) > 12.0;
  return vabdd_f64(self->_startPoint.y, a3.y) > 12.0 || v3;
}

- (void)_initialRange:(CGPoint)a3
{
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", a3.x, a3.y);
  [[(UIPDFPageView *)self->_pageView page] CGPage];
  uint64_t v4 = CGPDFSelectionCreateAtPointWithOptions();
  self->_initialRange.location = 0;
  self->_initialRange.length = 0;
  if (v4)
  {
    FirstIndedouble x = CGPDFSelectionGetFirstIndex();
    LastIndedouble x = CGPDFSelectionGetLastIndex();
    self->_initialRange.location = FirstIndex;
    self->_initialRange.length = LastIndex - FirstIndex + 1;
    CGPDFSelectionRelease();
  }
}

- (BOOL)willTrackAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(UIPDFAnnotationController *)self delegate]) {
    return 0;
  }
  id v6 = [(UIPDFAnnotationController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return -[NSObject willTrackAnnotationAtPoint:controller:](v6, "willTrackAnnotationAtPoint:controller:", self, x, y);
}

- (void)startTracking:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  currentAnnotation = self->_currentAnnotation;
  if (currentAnnotation)
  {

    self->_currentAnnotation = 0;
  }
  self->_tracking = 1;
  self->_moving = 0;
  self->_startPoint.double x = x;
  self->_startPoint.double y = y;
  -[UIPDFAnnotationController _initialRange:](self, "_initialRange:", x, y);
}

- (void)tracking:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_moving)
  {
    if (!-[UIPDFAnnotationController trackMoved:](self, "trackMoved:", a3.x, a3.y)) {
      return;
    }
    self->_moving = 1;
  }
  int64_t length = self->_initialRange.length;
  if (!length)
  {
    -[UIPDFAnnotationController _initialRange:](self, "_initialRange:", x, y);
    int64_t length = self->_initialRange.length;
  }
  if (length >= 1)
  {
    if (!self->_currentAnnotation)
    {
      BOOL v7 = [(UIPDFAnnotationController *)self makeUnderlineAnnotation];
      uint64_t v8 = off_1E52D4318;
      if (!v7) {
        uint64_t v8 = off_1E52D42B0;
      }
      self->_currentAnnotation = (UIPDFMarkupAnnotation *)objc_alloc_init(*v8);
      [(UIPDFAnnotation *)self->_currentAnnotation setAnnotationController:[(UIPDFPageView *)self->_pageView annotationController]];
      [(UIPDFAnnotation *)self->_currentAnnotation setColor:[(UIColor *)[(UIPDFAnnotationController *)self currentColor] CGColor]];
    }
    [[(UIPDFPageView *)self->_pageView page] CGPage];
    -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
    uint64_t BetweenRangeAndPoint = CGPDFSelectionCreateBetweenRangeAndPoint();
    if (BetweenRangeAndPoint)
    {
      uint64_t v10 = [[UIPDFSelection alloc] initWithPage:[(UIPDFPageView *)self->_pageView page] cgSelection:BetweenRangeAndPoint];
      [(UIPDFAnnotation *)self->_currentAnnotation setSelection:v10];

      if ([(UIPDFAnnotation *)self->_currentAnnotation annotationView])
      {
        CGPDFSelectionGetBounds();
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
        -[UIView setFrame:]([(UIPDFAnnotation *)self->_currentAnnotation annotationView], "setFrame:", v11, v12, v13, v14);
        [(UIPDFAnnotationController *)self setSurfacePosition:self->_currentAnnotation];
      }
      else
      {
        [(UIPDFAnnotationController *)self _addAnnotationViewFor:self->_currentAnnotation];
      }
      CGPDFSelectionRelease();
      uint64_t v15 = [(UIPDFAnnotation *)self->_currentAnnotation annotationView];
      [(UIView *)v15 setNeedsDisplay];
    }
  }
}

- (void)endTrackingAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(UIPDFAnnotation *)self->_currentAnnotation selection]
    || ([(UIPDFAnnotationController *)self mergeSelectionOfAnnotation:self->_currentAnnotation], ![(UIPDFAnnotation *)self->_currentAnnotation selection]))
  {
    [(UIPDFAnnotationController *)self layoutAnnotationViews:self->_pageView];
  }
  self->_tracking = 0;
  id v6 = [(UIPDFAnnotationController *)self delegate];
  if (v6)
  {
    BOOL v7 = v6;
    if (objc_opt_respondsToSelector()) {
      -[NSObject annotation:didEndTrackingAtPoint:controller:](v7, "annotation:didEndTrackingAtPoint:controller:", self->_currentAnnotation, self, x, y);
    }
  }

  self->_currentAnnotation = 0;
  pageView = self->_pageView;
  [(UIPDFPageView *)pageView setNeedsDisplay];
}

- (id)_linkAnnotationViewAt:(CGPoint)a3
{
  id result = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (result)
  {
    id v4 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 annotation];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v4;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isLinkAnnotationAt:(CGPoint)a3
{
  return -[UIPDFAnnotationController _linkAnnotationViewAt:](self, "_linkAnnotationViewAt:", a3.x, a3.y) != 0;
}

- (BOOL)linkAnnotationShouldBegin:(id)a3
{
  [a3 locationInView:self->_pageView];
  double v5 = v4;
  double v7 = v6;
  id v8 = -[UIPDFAnnotationController _linkAnnotationViewAt:](self, "_linkAnnotationViewAt:");
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)[v8 annotation];
    objc_msgSend(v9, "convertPoint:fromView:", self->_pageView, v5, v7);
    LOBYTE(v8) = objc_msgSend(v10, "shouldRecognizeTapOrPress:");
  }
  return (char)v8;
}

- (id)annotationAt:(CGPoint)a3
{
  BOOL v3 = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (!v3) {
    return 0;
  }
  double v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (id)[(UIView *)v4 annotation];
}

- (id)linkAnnotationAt:(CGPoint)a3
{
  id result = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (result)
  {
    id v4 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = (void *)[v4 annotation];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v5;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)annotationBriefPressRecognized:(id)a3
{
  [a3 locationInView:self->_pageView];
  id v5 = -[UIPDFAnnotationController linkAnnotationAt:](self, "linkAnnotationAt:");
  if (v5)
  {
    id v6 = v5;
    double v7 = [(UIPDFAnnotationController *)self delegate];
    uint64_t v8 = [a3 state];
    if ((unint64_t)(v8 - 3) >= 3)
    {
      if (v8 == 1) {
        [(UIPDFAnnotationController *)self resetBeingPressedForRecognizer:a3 withDelegate:v7 withAnnotation:v6];
      }
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (BOOL)annotationSingleTapRecognized:(id)a3
{
  [a3 locationInView:self->_pageView];
  id v5 = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0);
  if (v5)
  {
    id v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (uint64_t v7 = [(UIView *)v6 annotation], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (uint64_t v8 = [(UIPDFAnnotationController *)self delegate],
          uint64_t v9 = [a3 state],
          (unint64_t)(v9 - 4) < 2))
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    if (v9 == 3)
    {
      [(UIPDFPageView *)self->_pageView clearSelection];
      if (objc_opt_respondsToSelector())
      {
        [a3 locationInView:self->_pageView];
        -[NSObject annotation:wasTouchedAtPoint:controller:](v8, "annotation:wasTouchedAtPoint:controller:", v7, self);
      }
      goto LABEL_8;
    }
    LOBYTE(v5) = 1;
  }
  return (char)v5;
}

- (BOOL)willDoSomethingWithTap:(CGPoint)a3
{
  id v3 = -[UIPDFAnnotationController annotationAt:](self, "annotationAt:", a3.x, a3.y);
  if (v3)
  {
    LOBYTE(v3) = [v3 recognizeGestures];
  }
  return (char)v3;
}

- (id)annotatePageSelection
{
  id v3 = [[(UIPDFPageView *)self->_pageView page] selection];
  id v4 = v3;
  [(UIPDFPageView *)self->_pageView clearSelection];
  BOOL v5 = [(UIPDFAnnotationController *)self makeUnderlineAnnotation];
  id v6 = off_1E52D4318;
  if (!v5) {
    id v6 = off_1E52D42B0;
  }
  id v7 = objc_alloc_init(*v6);
  [v7 setEditable:1];
  [v7 setSelection:v3];

  objc_msgSend(v7, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
  [(UIPDFAnnotationController *)self mergeSelectionOfAnnotation:v7];
  [(UIPDFAnnotationController *)self addAnnotation:v7];
  return v7;
}

- (void)copyAttributesOf:(id)a3 to:(id)a4
{
  objc_msgSend(a4, "setContents:", objc_msgSend(a3, "contents"));
  uint64_t v6 = [a3 selection];
  [a4 setSelection:v6];
}

+ (CGImage)newMaskImage:(CGPDFPage *)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGRect BoxRect = CGPDFPageGetBoxRect(a3, kCGPDFCropBox);
  float v7 = width;
  float v8 = height;
  CGFloat v9 = truncf(v7) / BoxRect.size.width;
  CGFloat v10 = truncf(v8) / BoxRect.size.height;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, 0, DeviceRGB, 0x4001u);
  CGContextScaleCTM(v12, v9, v10);
  CGContextDrawPDFPage(v12, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  return Image;
}

- (CGImage)newHighlightMaskImageFor:(CGRect)a3
{
  if (!self->_delegate) {
    return 0;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;
  return (CGImage *)-[NSObject newHighlightMaskImage:controller:](delegate, "newHighlightMaskImage:controller:", self, x, y, width, height);
}

- (CGImage)underlineImageFor:(CGRect)a3
{
  if (!self->_delegate) {
    return 0;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;
  return (CGImage *)-[NSObject underlineImage:controller:](delegate, "underlineImage:controller:", self, x, y, width, height);
}

- (CGSize)marginNoteImageSize
{
  double width = self->_cachedMarginNoteSize.width;
  if (width == 0.0)
  {
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector())
      {
        [self->_delegate marginNoteImageSize:self];
        self->_cachedMarginNoteSize.double width = width;
        self->_cachedMarginNoteSize.double height = v4;
      }
      else
      {
        double width = self->_cachedMarginNoteSize.width;
      }
    }
    if (width == 0.0)
    {
      __asm { FMOV            V0.2D, #22.0 }
      self->_cachedMarginNoteSize = _Q0;
      double width = 22.0;
    }
  }
  double height = self->_cachedMarginNoteSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)marginNoteImage:(id)a3
{
  if (!self->_delegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;
  return (id)[delegate marginNoteImage:a3 controller:self];
}

- (UIPDFAnnotation)currentAnnotation
{
  return &self->_currentAnnotation->super;
}

- (void)setCurrentAnnotation:(id)a3
{
}

- (BOOL)makeUnderlineAnnotation
{
  return self->makeUnderlineAnnotation;
}

- (void)setMakeUnderlineAnnotation:(BOOL)a3
{
  self->makeUnderlineAnnotation = a3;
}

- (CALayer)drawingSurface
{
  return self->_drawingSurface;
}

- (void)setDrawingSurface:(id)a3
{
  self->_drawingSurface = (CALayer *)a3;
}

- (NSObject)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (UIPDFPageView)pageView
{
  return self->_pageView;
}

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (void)setAllowEditing:(BOOL)a3
{
  self->_allowEditing = a3;
}

- (UIColor)currentColor
{
  return self->_currentColor;
}

- (void)setCurrentColor:(id)a3
{
  self->_currentColor = (UIColor *)a3;
}

@end