@interface THChapterBrowserScrubbablePageControl
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)firstDotSpecialRendering;
- (BOOL)isDragging;
- (CGPoint)p_indicatorCenterAtIndex:(unint64_t)a3;
- (THChapterBrowserScrubbablePageControl)initWithFrame:(CGRect)a3;
- (TSKFidgetResolver)fidgetResolver;
- (id)p_layerForPageIndex:(unint64_t)a3;
- (id)p_layerForSelectingPage;
- (unint64_t)currentPage;
- (unint64_t)numberOfPages;
- (unint64_t)p_pageIndexForPoint:(CGPoint)a3;
- (void)_selectDotAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)p_selectDotClosestToPageIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)p_setCurrentPage:(unint64_t)a3;
- (void)p_updateWithNewPageIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)p_updateWithTouch:(id)a3 animated:(BOOL)a4 lastTouch:(BOOL)a5;
- (void)setCurrentPage:(unint64_t)a3;
- (void)setDragging:(BOOL)a3;
- (void)setFidgetResolver:(id)a3;
- (void)setFirstDotSpecialRendering:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNumberOfPages:(unint64_t)a3;
@end

@implementation THChapterBrowserScrubbablePageControl

- (THChapterBrowserScrubbablePageControl)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THChapterBrowserScrubbablePageControl;
  v3 = -[THChapterBrowserScrubbablePageControl initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
    v3->_currentPageIndicatorIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5 = (TSKFidgetResolver *)objc_alloc_init((Class)TSKFidgetResolver);
    v4->_fidgetResolver = v5;
    [(TSKFidgetResolver *)v5 setFidgetThreshold:0.02];
    v4->_indicators = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    [(THChapterBrowserScrubbablePageControl *)v4 setNeedsLayout];
    [(THChapterBrowserScrubbablePageControl *)v4 setAutoresizingMask:2];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THChapterBrowserScrubbablePageControl;
  [(THChapterBrowserScrubbablePageControl *)&v3 dealloc];
}

- (void)setNumberOfPages:(unint64_t)a3
{
  if (self->_numberOfPages != a3)
  {
    [(THChapterBrowserScrubbablePageControl *)self bounds];
    if (CGRectIsEmpty(v17)) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THChapterBrowserScrubbablePageControl setNumberOfPages:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THChapterBrowserScrubbablePageControl.m") lineNumber:64 description:@"can't limit the number of dots without a valid frame"];
    }
    self->_numberOfPages = a3;
    [(THChapterBrowserScrubbablePageControl *)self bounds];
    TSUClamp();
    self->_dotWidth = (unint64_t)v5;
    [(THChapterBrowserScrubbablePageControl *)self bounds];
    double v7 = fmax(v6 / (double)self->_dotWidth, 1.0);
    if ((unint64_t)v7 >= a3) {
      unint64_t v8 = a3;
    }
    else {
      unint64_t v8 = (unint64_t)v7;
    }
    [(THChapterBrowserScrubbablePageControl *)self bounds];
    self->_leftMargin = (v9 - (double)(v8 * self->_dotWidth)) * 0.5;
    if ((unint64_t)[(NSMutableArray *)self->_indicators count] >= v8)
    {
      indicators = self->_indicators;
      if (v8)
      {
        for (i = (char *)[(NSMutableArray *)indicators count] - 1; (unint64_t)i >= v8; --i)
        {
          [self->_indicators[i] removeFromSuperlayer];
          [(NSMutableArray *)self->_indicators removeObjectAtIndex:i];
        }
      }
      else
      {
        [(NSMutableArray *)indicators makeObjectsPerformSelector:"removeFromSuperlayer"];
        [(NSMutableArray *)self->_indicators removeAllObjects];
      }
    }
    else
    {
      v10 = (char *)[(NSMutableArray *)self->_indicators count];
      if ((unint64_t)v10 < v8)
      {
        v11 = v10;
        do
        {
          id v12 = [(THChapterBrowserScrubbablePageControl *)self p_layerForPageIndex:v11];
          [self.layer addSublayer:v12];
          [(NSMutableArray *)self->_indicators addObject:v12];
          ++v11;
        }
        while ((char *)v8 != v11);
      }
    }
    unint64_t v15 = a3 - 1;
    if ([(THChapterBrowserScrubbablePageControl *)self currentPage] > v15) {
      [(THChapterBrowserScrubbablePageControl *)self setCurrentPage:v15];
    }
    [(THChapterBrowserScrubbablePageControl *)self setNeedsLayout];
  }
}

- (void)setCurrentPage:(unint64_t)a3
{
  [(THChapterBrowserScrubbablePageControl *)self p_setCurrentPage:a3];
  unint64_t v4 = [(THChapterBrowserScrubbablePageControl *)self currentPage];

  [(THChapterBrowserScrubbablePageControl *)self p_selectDotClosestToPageIndex:v4 animated:0];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t dotWidth = self->_dotWidth;
  unint64_t numberOfPages = (unint64_t)fmax(a3.size.width / (double)dotWidth, 1.0);
  if (self->_numberOfPages < numberOfPages) {
    unint64_t numberOfPages = self->_numberOfPages;
  }
  self->_leftMargin = (a3.size.width - (double)(numberOfPages * dotWidth)) * 0.5;
  self->_unint64_t numberOfPages = 0;
  -[THChapterBrowserScrubbablePageControl setNumberOfPages:](self, "setNumberOfPages:");
  v10.receiver = self;
  v10.super_class = (Class)THChapterBrowserScrubbablePageControl;
  -[THChapterBrowserScrubbablePageControl setFrame:](&v10, "setFrame:", x, y, width, height);
}

- (void)layoutSubviews
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v3 = [(NSMutableArray *)self->_indicators count];
  if (v3)
  {
    unint64_t v4 = (unint64_t)v3;
    double leftMargin = self->_leftMargin;
    unint64_t dotWidth = self->_dotWidth;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    indicators = self->_indicators;
    id v8 = [(NSMutableArray *)indicators countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      double v10 = leftMargin + (double)dotWidth * 0.5;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(indicators);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) setPosition:round(v10) y:24.0];
          double v10 = v10 + (double)self->_dotWidth;
        }
        id v9 = [(NSMutableArray *)indicators countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    if (self->_currentPageIndicatorIndex < v4)
    {
      -[THChapterBrowserScrubbablePageControl p_indicatorCenterAtIndex:](self, "p_indicatorCenterAtIndex:");
      -[CALayer setPosition:](self->_currentPageIndicator, "setPosition:");
    }
  }
  +[CATransaction commit];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THChapterBrowserScrubbablePageControl;
  BOOL v6 = [(THChapterBrowserScrubbablePageControl *)&v8 beginTrackingWithTouch:a3 withEvent:a4];
  if (v6) {
    self->_startingPage = [(THChapterBrowserScrubbablePageControl *)self currentPage];
  }
  [(THChapterBrowserScrubbablePageControl *)self p_updateWithTouch:a3 animated:1 lastTouch:0];
  return v6;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_dragging = 1;
  [(THChapterBrowserScrubbablePageControl *)self p_updateWithTouch:a3 animated:0 lastTouch:0];
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_dragging = 0;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  if ([(THChapterBrowserScrubbablePageControl *)self currentPage] != self->_startingPage) {
    [(THChapterBrowserScrubbablePageControl *)self sendActionsForControlEvents:4096];
  }

  [(THChapterBrowserScrubbablePageControl *)self sendActionsForControlEvents:128];
}

- (id)p_layerForSelectingPage
{
  v2 = +[CALayer layer];
  -[CALayer setBounds:](v2, "setBounds:", 0.0, 0.0, 22.0, 22.0);
  [(CALayer *)v2 setBorderColor:[+[UIColor whiteColor] CGColor]];
  [(CALayer *)v2 setBorderWidth:1.0];
  [(CALayer *)v2 setBackgroundColor:[+[UIColor colorWithWhite:1.0 alpha:0.3] CGColor]];
  [(CALayer *)v2 setCornerRadius:11.0];
  return v2;
}

- (id)p_layerForPageIndex:(unint64_t)a3
{
  double v3 = 6.0;
  if (a3
    || (![(THChapterBrowserScrubbablePageControl *)self firstDotSpecialRendering]
      ? (double v3 = 6.0)
      : (double v3 = 7.0),
        ![(THChapterBrowserScrubbablePageControl *)self firstDotSpecialRendering]))
  {
    double v5 = +[CALayer layer];
    -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, 6.0, v3);
    [(CALayer *)v5 setCornerRadius:3.0];
    [(CALayer *)v5 setBackgroundColor:[+[UIColor whiteColor] CGColor]];
  }
  else
  {
    double v5 = (CALayer *)+[CAShapeLayer layer];
    -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, 6.0, v3);
    [(CALayer *)v5 setFillColor:[+[UIColor whiteColor] CGColor]];
    BOOL v6 = +[UIBezierPath bezierPath];
    double y = CGPointZero.y;
    -[UIBezierPath moveToPoint:](v6, "moveToPoint:", CGPointZero.x, y);
    -[UIBezierPath addLineToPoint:](v6, "addLineToPoint:", 0.0, v3);
    -[UIBezierPath addLineToPoint:](v6, "addLineToPoint:", 6.0, v3 * 0.5);
    -[UIBezierPath addLineToPoint:](v6, "addLineToPoint:", CGPointZero.x, y);
    CGAffineTransformMakeTranslation(&v9, 1.0, 0.0);
    [(UIBezierPath *)v6 applyTransform:&v9];
    [(CALayer *)v5 setPath:[(UIBezierPath *)v6 CGPath]];
  }
  return v5;
}

- (void)p_setCurrentPage:(unint64_t)a3
{
  unint64_t numberOfPages = self->_numberOfPages;
  if (numberOfPages <= a3) {
    unint64_t v4 = numberOfPages - 1;
  }
  else {
    unint64_t v4 = a3;
  }
  self->_currentPage = v4;
}

- (void)_selectDotAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_indicators count] > a3)
  {
    if (!self->_currentPageIndicator)
    {
      self->_currentPageIndicator = (CALayer *)[(THChapterBrowserScrubbablePageControl *)self p_layerForSelectingPage];
      [self->_currentPageIndicator addSublayer:[self layer]];
    }
    self->_currentPageIndicatorIndedouble x = a3;
    +[CATransaction begin];
    +[CATransaction setAnimationDuration:0.15];
    if (!a4) {
      +[CATransaction setDisableActions:1];
    }
    [(THChapterBrowserScrubbablePageControl *)self p_indicatorCenterAtIndex:self->_currentPageIndicatorIndex];
    -[CALayer setPosition:](self->_currentPageIndicator, "setPosition:");
    +[CATransaction commit];
  }
}

- (void)p_selectDotClosestToPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = vcvtas_u32_f32((float)((float)(unint64_t)[(NSMutableArray *)self->_indicators count]/ (float)self->_numberOfPages)* (float)a3);

  [(THChapterBrowserScrubbablePageControl *)self _selectDotAtIndex:v6 animated:v4];
}

- (CGPoint)p_indicatorCenterAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_indicators count] <= a3)
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  else
  {
    [self->_indicators objectAtIndex:a3].position
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)p_updateWithTouch:(id)a3 animated:(BOOL)a4 lastTouch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [a3 locationInView:self];
  id v8 = -[THChapterBrowserScrubbablePageControl p_pageIndexForPoint:](self, "p_pageIndexForPoint:");
  [(TSKFidgetResolver *)[(THChapterBrowserScrubbablePageControl *)self fidgetResolver] pushValue:+[NSNumber numberWithUnsignedInteger:v8]];
  if (v5) {
    id v8 = [[-[THChapterBrowserScrubbablePageControl fidgetResolver](self, "fidgetResolver") nonFidgetValue] unsignedIntegerValue];
  }

  [(THChapterBrowserScrubbablePageControl *)self p_updateWithNewPageIndex:v8 animated:v6];
}

- (void)p_updateWithNewPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_currentPage != a3)
  {
    BOOL v4 = a4;
    -[THChapterBrowserScrubbablePageControl p_setCurrentPage:](self, "p_setCurrentPage:");
    [(THChapterBrowserScrubbablePageControl *)self p_selectDotClosestToPageIndex:[(THChapterBrowserScrubbablePageControl *)self currentPage] animated:v4];
    [(THChapterBrowserScrubbablePageControl *)self sendActionsForControlEvents:4096];
  }
}

- (unint64_t)p_pageIndexForPoint:(CGPoint)a3
{
  double x = a3.x;
  [(THChapterBrowserScrubbablePageControl *)self bounds];
  double v6 = v5 + self->_leftMargin * -2.0;
  unint64_t v7 = (uint64_t)((x - self->_leftMargin)
               / (v6
                / (double)[(THChapterBrowserScrubbablePageControl *)self numberOfPages]));
  if ((v7 & 0x8000000000000000) != 0) {
    return 0;
  }
  if ([(THChapterBrowserScrubbablePageControl *)self numberOfPages] <= v7) {
    return [(THChapterBrowserScrubbablePageControl *)self numberOfPages] - 1;
  }
  return v7;
}

- (TSKFidgetResolver)fidgetResolver
{
  return self->_fidgetResolver;
}

- (void)setFidgetResolver:(id)a3
{
}

- (unint64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (unint64_t)currentPage
{
  return self->_currentPage;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (BOOL)firstDotSpecialRendering
{
  return self->_firstDotSpecialRendering;
}

- (void)setFirstDotSpecialRendering:(BOOL)a3
{
  self->_firstDotSpecialRendering = a3;
}

@end