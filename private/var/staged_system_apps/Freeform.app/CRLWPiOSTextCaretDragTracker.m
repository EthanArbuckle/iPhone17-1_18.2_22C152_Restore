@interface CRLWPiOSTextCaretDragTracker
- (BOOL)autoScrollIsActive;
- (BOOL)cursorIsFloating;
- (BOOL)isAnimatingPickup;
- (BOOL)p_isVerticalTextLayout;
- (BOOL)p_shouldSnapToSelection;
- (BOOL)p_shouldSuppressAnimation;
- (BOOL)pointDidLeaveOriginalLine;
- (BOOL)terminalPointPlacedCarefully;
- (CGAffineTransform)p_caretAffineTransformWithScaleFactor:(SEL)a3;
- (CGAffineTransform)p_growTransform;
- (CGAffineTransform)p_shrinkTransform;
- (CGPoint)animationPoint;
- (CGPoint)magnificationPoint;
- (CGPoint)offset;
- (CGPoint)p_naturalPointFromUnscaledPoint:(CGPoint)a3;
- (CGPoint)p_scaledCaretRectCenter;
- (CGPoint)p_selectionPointFromPoint:(CGPoint)a3;
- (CGPoint)p_unscaledScrollPoint;
- (CGPoint)p_unscaledSelectionPoint;
- (CGPoint)startingUnscaledAutoscrollPoint;
- (CGPoint)startingiccUnscaledContentOffset;
- (CGRect)naturalCaretRect;
- (CGRect)p_scaledCaretRect;
- (CGRect)p_unscaledCaretRect;
- (CGSize)p_clampedScaledCaretSize;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLCanvasRep)target;
- (CRLInteractiveCanvasController)icc;
- (CRLWPCaretDragMagnifierDelegate)delegate;
- (CRLWPiOSTextCaretDragTracker)init;
- (NSMutableArray)recentVelocityQueue;
- (NSString)underlayImageName;
- (UIView)hostView;
- (double)p_smoothedVelocity;
- (double)p_trackingOffset;
- (double)pointVelocity;
- (double)unscaledStartAutoscrollThreshold;
- (double)yOffset;
- (int64_t)scrollingDirection;
- (unint64_t)maximumAutoscrollDeltaForCount:(unint64_t)a3;
- (void)autoscrollWillNotStart;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)continueMagnifyingWithMagnificationPoint:(CGPoint)a3;
- (void)p_removeFromView;
- (void)p_setBoundsAndCenterToCaretRect;
- (void)p_updateFrameAndOffset;
- (void)p_updateNaturalCaretRectFromTarget:(id)a3;
- (void)p_zoomDownAnimation;
- (void)p_zoomUpAnimation;
- (void)setAnimationPoint:(CGPoint)a3;
- (void)setAutoScrollIsActive:(BOOL)a3;
- (void)setAutoscroll:(id)a3;
- (void)setCursorIsFloating:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHostView:(id)a3;
- (void)setIsAnimatingPickup:(BOOL)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setNaturalCaretRect:(CGRect)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setPointDidLeaveOriginalLine:(BOOL)a3;
- (void)setPointVelocity:(double)a3;
- (void)setRecentVelocityQueue:(id)a3;
- (void)setScrollingDirection:(int64_t)a3;
- (void)setStartingUnscaledAutoscrollPoint:(CGPoint)a3;
- (void)setStartingiccUnscaledContentOffset:(CGPoint)a3;
- (void)setYOffset:(double)a3;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateAfterAutoscroll:(id)a3;
@end

@implementation CRLWPiOSTextCaretDragTracker

- (CRLWPiOSTextCaretDragTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPiOSTextCaretDragTracker;
  v2 = -[CRLWPiOSTextCaretDragTracker initWithFrame:](&v11, "initWithFrame:", 0.0, 0.0, 2.0, 48.0);
  if (v2)
  {
    v3 = +[CRLColor colorWithRed:0.26 green:0.42 blue:0.95 alpha:1.0];
    v4 = [v3 UIColor];
    [(CRLWPiOSTextCaretDragTracker *)v2 setBackgroundColor:v4];

    [(CRLWPiOSTextCaretDragTracker *)v2 setClipsToBounds:0];
    v5 = [(CRLWPiOSTextCaretDragTracker *)v2 layer];
    v6 = +[CRLColor blackColor];
    [v5 setShadowColor:[v6 CGColor]];

    LODWORD(v7) = 1047233823;
    [v5 setShadowOpacity:v7];
    [v5 setShadowOffset:0.0, 6.0];
    [v5 setShadowRadius:2.75];
    uint64_t v8 = +[NSMutableArray array];
    recentVelocityQueue = v2->_recentVelocityQueue;
    v2->_recentVelocityQueue = (NSMutableArray *)v8;

    v2->_scrollingDirection = 0;
  }
  return v2;
}

- (void)p_updateNaturalCaretRectFromTarget:(id)a3
{
  id v16 = a3;
  v4 = [(CRLWPiOSTextCaretDragTracker *)self delegate];
  unsigned int v5 = [v4 caretDragSelectionIsValid];

  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    double v7 = sub_10024715C(v6, v16);
    [v7 caretRect];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    -[CRLWPiOSTextCaretDragTracker setNaturalCaretRect:](self, "setNaturalCaretRect:", v9, v11, v13, v15);
  }
}

- (void)setNaturalCaretRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_naturalCaretRect = &self->_naturalCaretRect;
  if (!CGRectEqualToRect(a3, self->_naturalCaretRect))
  {
    v16.origin.double x = CGRectZero.origin.x;
    v16.origin.double y = CGRectZero.origin.y;
    v16.size.CGFloat width = CGRectZero.size.width;
    v16.size.CGFloat height = CGRectZero.size.height;
    if (!CGRectEqualToRect(*p_naturalCaretRect, v16)
      && ![(CRLWPiOSTextCaretDragTracker *)self pointDidLeaveOriginalLine])
    {
      if (![(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout])
      {
        double v9 = p_naturalCaretRect->origin.y;
        double v10 = vabdd_f64(y, v9);
        BOOL v11 = y == v9;
        double v12 = 2.0;
        if (!v11 && v10 >= 2.0) {
          goto LABEL_21;
        }
      }
      if ([(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout])
      {
        double v10 = vabdd_f64(x, p_naturalCaretRect->origin.x);
        double v12 = 2.0;
        if (x != p_naturalCaretRect->origin.x && v10 >= 2.0)
        {
LABEL_21:
          if ([(CRLWPiOSTextCaretDragTracker *)self isAnimatingPickup])
          {
            double v15 = [(CRLWPiOSTextCaretDragTracker *)self layer];
            [v15 removeAllAnimations];
          }
          [(CRLWPiOSTextCaretDragTracker *)self setPointDidLeaveOriginalLine:1];
        }
      }
    }
    p_naturalCaretRect->origin.double x = x;
    p_naturalCaretRect->origin.double y = y;
    p_naturalCaretRect->size.CGFloat width = width;
    p_naturalCaretRect->size.CGFloat height = height;
  }
}

- (void)setPointVelocity:(double)a3
{
  unsigned int v5 = [(CRLWPiOSTextCaretDragTracker *)self recentVelocityQueue];
  v6 = +[NSNumber crl_numberWithCGFloat:a3];
  [v5 insertObject:v6 atIndex:0];

  double v7 = [(CRLWPiOSTextCaretDragTracker *)self recentVelocityQueue];
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 0x15)
  {
    double v9 = [(CRLWPiOSTextCaretDragTracker *)self recentVelocityQueue];
    [v9 removeObjectAtIndex:20];
  }
  self->_pointVelocitdouble y = a3;
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  p_magnificationPoint = &self->_magnificationPoint;
  double y = self->_magnificationPoint.y;
  if (a3.x != self->_magnificationPoint.x || a3.y != y)
  {
    double v7 = a3.y;
    if (sub_100065BC8(a3.x, a3.y))
    {
      if (v7 <= y) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 2;
      }
      [(CRLWPiOSTextCaretDragTracker *)self setScrollingDirection:v9];
    }
    p_magnificationPoint->CGFloat x = x;
    p_magnificationPoint->double y = v7;
  }
}

- (void)setCursorIsFloating:(BOOL)a3
{
  if (self->_cursorIsFloating != a3) {
    self->_cursorIsFloating = a3;
  }
}

- (BOOL)p_isVerticalTextLayout
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLWPiOSTextCaretDragTracker *)self target];
  unsigned int v5 = sub_1002469D0(v3, v4);

  if (v5)
  {
    unsigned __int8 v6 = [v5 textIsVertical];
  }
  else
  {
    double v7 = [(CRLWPiOSTextCaretDragTracker *)self delegate];
    unsigned __int8 v6 = [v7 isVerticalTextCaretForMagnifying];
  }
  return v6;
}

- (CGPoint)p_unscaledScrollPoint
{
  uint64_t v3 = [(CRLWPiOSTextCaretDragTracker *)self target];
  v4 = [v3 interactiveCanvasController];
  [(CRLWPiOSTextCaretDragTracker *)self magnificationPoint];
  [v4 convertBoundsToUnscaledPoint:];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.CGFloat x = v9;
  return result;
}

- (CGPoint)p_naturalPointFromUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLWPiOSTextCaretDragTracker *)self target];
  double v6 = [v5 interactiveCanvasController];
  [v6 convertUnscaledToBoundsPoint:x, y];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)p_smoothedVelocity
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(CRLWPiOSTextCaretDragTracker *)self recentVelocityQueue];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) crl_CGFloatValue];
        double v7 = v7 + v9;
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  double v10 = [(CRLWPiOSTextCaretDragTracker *)self recentVelocityQueue];
  if ([v10 count])
  {
    double v11 = [(CRLWPiOSTextCaretDragTracker *)self recentVelocityQueue];
    double v12 = (double)(unint64_t)[v11 count];
  }
  else
  {
    double v12 = 1.0;
  }

  return v7 / v12;
}

- (CGPoint)p_selectionPointFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLWPiOSTextCaretDragTracker *)self p_trackingOffset];
  double v6 = y - v5;
  double v7 = round(x);
  double v8 = round(v6);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)p_unscaledSelectionPoint
{
  [(CRLWPiOSTextCaretDragTracker *)self magnificationPoint];
  -[CRLWPiOSTextCaretDragTracker p_selectionPointFromPoint:](self, "p_selectionPointFromPoint:");
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CRLWPiOSTextCaretDragTracker *)self target];
  double v8 = [v7 interactiveCanvasController];
  [v8 convertBoundsToUnscaledPoint:v4, v6];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (BOOL)p_shouldSnapToSelection
{
  [(CRLWPiOSTextCaretDragTracker *)self magnificationPoint];
  -[CRLWPiOSTextCaretDragTracker p_selectionPointFromPoint:](self, "p_selectionPointFromPoint:");
  double v4 = v3;
  double v6 = v5;
  BOOL result = 0;
  if (![(CRLWPiOSTextCaretDragTracker *)self autoScrollIsActive]
    && ![(CRLWPiOSTextCaretDragTracker *)self isAnimatingPickup])
  {
    [(CRLWPiOSTextCaretDragTracker *)self p_smoothedVelocity];
    if (v7 < 180.0)
    {
      [(CRLWPiOSTextCaretDragTracker *)self p_scaledCaretRectCenter];
      if (sub_1000653B4(v8, v9, v4, v6) < 20.0) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)p_shouldSuppressAnimation
{
  if ([(CRLWPiOSTextCaretDragTracker *)self cursorIsFloating]
    || [(CRLWPiOSTextCaretDragTracker *)self autoScrollIsActive])
  {
    return 1;
  }

  return [(CRLWPiOSTextCaretDragTracker *)self isAnimatingPickup];
}

- (double)p_trackingOffset
{
  [(CRLWPiOSTextCaretDragTracker *)self offset];
  double v4 = v3;
  if ([(CRLWPiOSTextCaretDragTracker *)self pointDidLeaveOriginalLine])
  {
    unsigned __int8 v5 = [(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout];
    [(CRLWPiOSTextCaretDragTracker *)self p_clampedScaledCaretSize];
    if (v5) {
      double v8 = v6 * 0.5;
    }
    else {
      double v8 = v7 * 0.5;
    }
    return v8 + 16.0;
  }
  return v4;
}

- (CGPoint)p_scaledCaretRectCenter
{
  [(CRLWPiOSTextCaretDragTracker *)self p_scaledCaretRect];

  double v6 = sub_100065738(v2, v3, v4, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGRect)p_unscaledCaretRect
{
  CGFloat v3 = [(CRLWPiOSTextCaretDragTracker *)self target];
  [(CRLWPiOSTextCaretDragTracker *)self naturalCaretRect];
  [v3 convertNaturalRectToUnscaledCanvas:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)p_scaledCaretRect
{
  CGFloat v3 = [(CRLWPiOSTextCaretDragTracker *)self target];
  double v4 = [v3 interactiveCanvasController];
  [(CRLWPiOSTextCaretDragTracker *)self p_unscaledCaretRect];
  [v4 convertUnscaledToBoundsRect:];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)p_clampedScaledCaretSize
{
  unsigned int v3 = [(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout];
  [(CRLWPiOSTextCaretDragTracker *)self p_scaledCaretRect];
  float v5 = v4;
  double v6 = fmaxf(v5, 48.0);
  float v8 = v7;
  double v9 = fmaxf(v8, 48.0);
  if (v3) {
    double v6 = 2.0;
  }
  else {
    double v9 = 2.0;
  }
  result.CGFloat height = v6;
  result.CGFloat width = v9;
  return result;
}

- (void)p_removeFromView
{
  [(CRLWPiOSTextCaretDragTracker *)self setTarget:0];

  [(CRLWPiOSTextCaretDragTracker *)self removeFromSuperview];
}

- (void)p_updateFrameAndOffset
{
  [(CRLWPiOSTextCaretDragTracker *)self setNeedsLayout];
  [(CRLWPiOSTextCaretDragTracker *)self setNeedsDisplay];
  [(CRLWPiOSTextCaretDragTracker *)self p_clampedScaledCaretSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(CRLWPiOSTextCaretDragTracker *)self center];
  double v8 = v7;
  double v10 = v9;
  if ([(CRLWPiOSTextCaretDragTracker *)self p_shouldSnapToSelection])
  {
    [(CRLWPiOSTextCaretDragTracker *)self setCursorIsFloating:0];
    [(CRLWPiOSTextCaretDragTracker *)self p_scaledCaretRectCenter];
  }
  else
  {
    [(CRLWPiOSTextCaretDragTracker *)self setCursorIsFloating:1];
    [(CRLWPiOSTextCaretDragTracker *)self magnificationPoint];
    double v14 = v13;
    double v16 = v15;
    if (!sub_100065BC8(v13, v15)) {
      goto LABEL_6;
    }
    -[CRLWPiOSTextCaretDragTracker p_selectionPointFromPoint:](self, "p_selectionPointFromPoint:", v14, v16);
  }
  double v8 = v11;
  double v10 = v12;
LABEL_6:
  if ([(CRLWPiOSTextCaretDragTracker *)self p_shouldSuppressAnimation])
  {
    -[CRLWPiOSTextCaretDragTracker setCenter:](self, "setCenter:", v8, v10);
    v19.origin.double x = sub_100064070();
    CGRect v20 = CGRectIntegral(v19);
    -[CRLWPiOSTextCaretDragTracker setBounds:](self, "setBounds:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100052E0C;
    v17[3] = &unk_1014CE288;
    v17[4] = self;
    *(double *)&v17[5] = v8;
    *(double *)&v17[6] = v10;
    v17[7] = v4;
    v17[8] = v6;
    +[UIView animateWithDuration:0x20000 delay:v17 options:0 animations:0.08 completion:0.0];
  }
}

- (void)p_zoomUpAnimation
{
  [(CRLWPiOSTextCaretDragTracker *)self setIsAnimatingPickup:1];
  [(CRLWPiOSTextCaretDragTracker *)self p_updateFrameAndOffset];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100052F34;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100052F98;
  v3[3] = &unk_1014CE260;
  v3[4] = self;
  +[UIView animateWithDuration:v4 animations:v3 completion:0.15];
}

- (CGAffineTransform)p_growTransform
{
  return [(CRLWPiOSTextCaretDragTracker *)self p_caretAffineTransformWithScaleFactor:1.5];
}

- (CGAffineTransform)p_shrinkTransform
{
  return [(CRLWPiOSTextCaretDragTracker *)self p_caretAffineTransformWithScaleFactor:0.94];
}

- (CGAffineTransform)p_caretAffineTransformWithScaleFactor:(SEL)a3
{
  [(CRLWPiOSTextCaretDragTracker *)self p_clampedScaledCaretSize];
  double v8 = v7;
  double v10 = v9;
  if (![(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout]) {
    double v8 = v10;
  }
  unsigned int v11 = [(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout];
  [(CRLWPiOSTextCaretDragTracker *)self bounds];
  if (v11) {
    double v14 = v12;
  }
  else {
    double v14 = v13;
  }
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  double v15 = v8 * a4 / v14;
  if ([(CRLWPiOSTextCaretDragTracker *)self p_isVerticalTextLayout])
  {
    CGFloat v16 = 1.0;
    long long v17 = retstr;
    CGFloat v18 = v15;
  }
  else
  {
    CGFloat v18 = 1.0;
    long long v17 = retstr;
    CGFloat v16 = v15;
  }

  return CGAffineTransformMakeScale(v17, v18, v16);
}

- (void)p_setBoundsAndCenterToCaretRect
{
  [(CRLWPiOSTextCaretDragTracker *)self p_scaledCaretRect];
  if (v5 == 0.0)
  {
    CGFloat v7 = v3;
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    [(CRLWPiOSTextCaretDragTracker *)self setBounds:sub_100064070()];
    double v11 = sub_100065738(v7, v8, v9, v10);
    [(CRLWPiOSTextCaretDragTracker *)self setCenter:v11];
  }
  else
  {
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v13[1] = v12;
    v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(CRLWPiOSTextCaretDragTracker *)self setTransform:v13];
  }
}

- (void)p_zoomDownAnimation
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005349C;
  v4[3] = &unk_1014CBBB0;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000534A4;
  v3[3] = &unk_1014CE260;
  v3[4] = self;
  +[UIView animateWithDuration:v4 animations:v3 completion:0.22];
  [(CRLWPiOSTextCaretDragTracker *)self setTarget:0];
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  id v24 = a3;
  [(CRLWPiOSTextCaretDragTracker *)self setTarget:v24];
  [(CRLWPiOSTextCaretDragTracker *)self p_updateNaturalCaretRectFromTarget:v24];
  CGFloat v10 = [(CRLWPiOSTextCaretDragTracker *)self target];
  double v11 = [v10 interactiveCanvasController];

  uint64_t v12 = objc_opt_class();
  double v13 = sub_1002469D0(v12, v11);
  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    double v15 = [v13 layerHost];
    CGFloat v16 = sub_1002469D0(v14, v15);

    long long v17 = [v16 canvasView];
    [(CRLWPiOSTextCaretDragTracker *)self setHostView:v17];
  }
  [(CRLWPiOSTextCaretDragTracker *)self p_scaledCaretRect];
  -[CRLWPiOSTextCaretDragTracker setOffset:](self, "setOffset:", 0.0, y - CGRectGetMidY(v26));
  -[CRLWPiOSTextCaretDragTracker setMagnificationPoint:](self, "setMagnificationPoint:", x, y);
  uint64_t v18 = objc_opt_class();
  CGRect v19 = [v24 interactiveCanvasController];
  CGRect v20 = [v19 delegate];
  v21 = sub_1002469D0(v18, v20);

  v22 = -[CRLWPiOSTextCaretDragTrackerController initWithPreferredStatusBarStyle:]([CRLWPiOSTextCaretDragTrackerController alloc], "initWithPreferredStatusBarStyle:", [v21 preferredStatusBarStyle]);
  [(CRLWPiOSTextCaretDragTrackerController *)v22 setView:self];
  v23 = [(CRLWPiOSTextCaretDragTracker *)self hostView];
  [v23 addSubview:self];

  if (v6) {
    [(CRLWPiOSTextCaretDragTracker *)self p_zoomUpAnimation];
  }
}

- (void)continueMagnifyingWithMagnificationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[CRLWPiOSTextCaretDragTracker setMagnificationPoint:](self, "setMagnificationPoint:");
  if (sub_100065BC8(x, y))
  {
    [(CRLWPiOSTextCaretDragTracker *)self p_updateFrameAndOffset];
    BOOL v6 = [(CRLWPiOSTextCaretDragTracker *)self delegate];
    [(CRLWPiOSTextCaretDragTracker *)self p_unscaledSelectionPoint];
    [v6 setSelectionFromUnscaledPoint:];

    CGFloat v7 = [(CRLWPiOSTextCaretDragTracker *)self target];
    [(CRLWPiOSTextCaretDragTracker *)self p_updateNaturalCaretRectFromTarget:v7];

    CGFloat v8 = [(CRLWPiOSTextCaretDragTracker *)self target];
    CGFloat v9 = [v8 interactiveCanvasController];
    CGFloat v10 = [v9 layerHost];
    double v11 = [v10 canvasView];
    uint64_t v12 = [v11 enclosingScrollView];
    unsigned int v13 = [v12 isScrollEnabled];

    if (v13)
    {
      [(CRLWPiOSTextCaretDragTracker *)self p_unscaledScrollPoint];
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self);
    }
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3) {
    [(CRLWPiOSTextCaretDragTracker *)self p_zoomDownAnimation];
  }
  else {
    [(CRLWPiOSTextCaretDragTracker *)self p_removeFromView];
  }
  self->_magnificationPoint = (CGPoint)xmmword_101175150;
  double v4 = [(CRLWPiOSTextCaretDragTracker *)self autoscroll];
  [v4 invalidate];

  [(CRLWPiOSTextCaretDragTracker *)self setAutoscroll:0];
}

- (BOOL)terminalPointPlacedCarefully
{
  return 1;
}

- (CGPoint)animationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)unscaledStartAutoscrollThreshold
{
  int64_t v2 = [(CRLWPiOSTextCaretDragTracker *)self scrollingDirection];
  double result = 45.0;
  if (v2 == 1) {
    return 100.0;
  }
  return result;
}

- (CRLInteractiveCanvasController)icc
{
  int64_t v2 = [(CRLWPiOSTextCaretDragTracker *)self target];
  double v3 = [v2 interactiveCanvasController];

  return (CRLInteractiveCanvasController *)v3;
}

- (void)updateAfterAutoscroll:(id)a3
{
  if (![(CRLWPiOSTextCaretDragTracker *)self autoScrollIsActive]) {
    [(CRLWPiOSTextCaretDragTracker *)self setAutoScrollIsActive:1];
  }
  double v4 = [(CRLWPiOSTextCaretDragTracker *)self autoscroll];
  [v4 unscaledAutoscrollPoint];
  double v6 = v5;
  double v8 = v7;

  CGFloat v9 = [(CRLWPiOSTextCaretDragTracker *)self target];
  CGFloat v10 = [v9 interactiveCanvasController];
  [v10 contentOffset];
  double v12 = v11;
  double v14 = v13;

  [(CRLWPiOSTextCaretDragTracker *)self startingUnscaledAutoscrollPoint];
  if (!sub_1000640F4(v6, v8, v15, v16))
  {
    -[CRLWPiOSTextCaretDragTracker setStartingUnscaledAutoscrollPoint:](self, "setStartingUnscaledAutoscrollPoint:", v6, v8);
    -[CRLWPiOSTextCaretDragTracker setStartingiccUnscaledContentOffset:](self, "setStartingiccUnscaledContentOffset:", v12, v14);
  }
  [(CRLWPiOSTextCaretDragTracker *)self startingiccUnscaledContentOffset];
  double v18 = sub_100064680(v12, v14, v17);
  [(CRLWPiOSTextCaretDragTracker *)self p_naturalPointFromUnscaledPoint:sub_100064698(v6, v8, v18)];
  self->_magnificationPoint.double x = v19;
  self->_magnificationPoint.double y = v20;

  [(CRLWPiOSTextCaretDragTracker *)self p_updateFrameAndOffset];
}

- (void)autoscrollWillNotStart
{
}

- (unint64_t)maximumAutoscrollDeltaForCount:(unint64_t)a3
{
  if (a3 > 0x2C)
  {
    if (a3 > 0x31)
    {
      if (a3 > 0x40)
      {
        if (a3 > 0x63)
        {
          if (a3 > 0x77) {
            double v3 = 0.35;
          }
          else {
            double v3 = 0.3;
          }
        }
        else
        {
          double v3 = 0.22;
        }
      }
      else
      {
        double v3 = 0.15;
      }
    }
    else
    {
      double v3 = 0.1;
    }
  }
  else
  {
    double v3 = 0.07;
  }
  return (unint64_t)((double)0x30uLL * v3);
}

- (CRLCanvasRep)target
{
  return self->_target;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGRect)naturalCaretRect
{
  double x = self->_naturalCaretRect.origin.x;
  double y = self->_naturalCaretRect.origin.y;
  double width = self->_naturalCaretRect.size.width;
  double height = self->_naturalCaretRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (CRLWPCaretDragMagnifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLWPCaretDragMagnifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)pointVelocity
{
  return self->_pointVelocity;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSString)underlayImageName
{
  return self->_underlayImageName;
}

- (UIView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
}

- (BOOL)pointDidLeaveOriginalLine
{
  return self->_pointDidLeaveOriginalLine;
}

- (void)setPointDidLeaveOriginalLine:(BOOL)a3
{
  self->_pointDidLeaveOriginalLine = a3;
}

- (BOOL)cursorIsFloating
{
  return self->_cursorIsFloating;
}

- (BOOL)autoScrollIsActive
{
  return self->_autoScrollIsActive;
}

- (void)setAutoScrollIsActive:(BOOL)a3
{
  self->_autoScrollIsActive = a3;
}

- (BOOL)isAnimatingPickup
{
  return self->_isAnimatingPickup;
}

- (void)setIsAnimatingPickup:(BOOL)a3
{
  self->_isAnimatingPickup = a3;
}

- (NSMutableArray)recentVelocityQueue
{
  return self->_recentVelocityQueue;
}

- (void)setRecentVelocityQueue:(id)a3
{
}

- (int64_t)scrollingDirection
{
  return self->_scrollingDirection;
}

- (void)setScrollingDirection:(int64_t)a3
{
  self->_scrollingDirection = a3;
}

- (CGPoint)startingUnscaledAutoscrollPoint
{
  double x = self->_startingUnscaledAutoscrollPoint.x;
  double y = self->_startingUnscaledAutoscrollPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingUnscaledAutoscrollPoint:(CGPoint)a3
{
  self->_startingUnscaledAutoscrollPoint = a3;
}

- (CGPoint)startingiccUnscaledContentOffset
{
  double x = self->_startingiccUnscaledContentOffset.x;
  double y = self->_startingiccUnscaledContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingiccUnscaledContentOffset:(CGPoint)a3
{
  self->_startingiccUnscaledContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentVelocityQueue, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_underlayImageName, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_target, 0);
}

@end