@interface THWFreeTransformGestureRecognizer
- (BOOL)useGestureViewForReCentering;
- (CGAffineTransform)transform;
- (CGAffineTransform)transformWithScale:(SEL)a3 angle:(double)a4;
- (CGPoint)centerPoint;
- (CGPoint)initialLocation1;
- (CGPoint)initialLocation2;
- (CGPoint)location1;
- (CGPoint)location2;
- (CGPoint)previousLocation1;
- (CGPoint)previousLocation2;
- (THWFreeTransformGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (THWFreeTransformGestureRecognizerDelegate)freeTransformDelegate;
- (UITouch)touch1;
- (UITouch)touch2;
- (UIView)unmovingParentView;
- (double)angle;
- (double)p_calculateAngle;
- (double)p_calculateAngleFromLocation1:(CGPoint)a3 location2:(CGPoint)a4;
- (double)p_calculateScale;
- (double)p_calculateScaleFromLocation1:(CGPoint)a3 location2:(CGPoint)a4;
- (double)scale;
- (unint64_t)movements;
- (void)cancel;
- (void)dealloc;
- (void)p_clearDynamicFreeTransformController;
- (void)p_failWithGestureState:(int64_t)a3;
- (void)p_tryToBegin;
- (void)p_updateTransform;
- (void)recenterOnTargetWithRectInView:(CGRect)a3;
- (void)recenterOnTargetWithRectInView:(CGRect)a3 withTouchPoint:(CGPoint)a4 withTouchPoint:(CGPoint)a5;
- (void)reset;
- (void)setAngle:(double)a3;
- (void)setCenterPoint:(CGPoint)a3;
- (void)setFreeTransformDelegate:(id)a3;
- (void)setInitialLocation1:(CGPoint)a3;
- (void)setInitialLocation2:(CGPoint)a3;
- (void)setLocation1:(CGPoint)a3;
- (void)setLocation2:(CGPoint)a3;
- (void)setMovements:(unint64_t)a3;
- (void)setPreviousLocation1:(CGPoint)a3;
- (void)setPreviousLocation2:(CGPoint)a3;
- (void)setScale:(double)a3;
- (void)setTouch1:(id)a3;
- (void)setTouch2:(id)a3;
- (void)setUnmovingParentView:(id)a3;
- (void)setUseGestureViewForReCentering:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateAngle;
@end

@implementation THWFreeTransformGestureRecognizer

- (THWFreeTransformGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWFreeTransformGestureRecognizer;
  v4 = [(THWFreeTransformGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = (THWFreeTransformGestureRecognizer *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)(v4 + 88) = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)(v4 + 104) = v6;
    *(_OWORD *)(v4 + 120) = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v4 setScale:1.0];
  }
  return v5;
}

- (void)dealloc
{
  [(THWFreeTransformGestureRecognizer *)self setTouch1:0];
  [(THWFreeTransformGestureRecognizer *)self setTouch2:0];
  [(THWFreeTransformGestureRecognizer *)self setUnmovingParentView:0];
  v3.receiver = self;
  v3.super_class = (Class)THWFreeTransformGestureRecognizer;
  [(THWFreeTransformGestureRecognizer *)&v3 dealloc];
}

- (void)p_clearDynamicFreeTransformController
{
  if ([(THWFreeTransformGestureRecognizer *)self delegate])
  {
    [(THWFreeTransformGestureRecognizer *)self delegate];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformGestureRecognizer p_clearDynamicFreeTransformController]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformGestureRecognizer.m") lineNumber:78 description:@"Expected a the non-nil delegate to be a gesture dispatcher."];
    }
    [(THWFreeTransformGestureRecognizer *)self setFreeTransformDelegate:0];
  }
}

- (double)p_calculateScaleFromLocation1:(CGPoint)a3 location2:(CGPoint)a4
{
  [(THWFreeTransformGestureRecognizer *)self initialLocation1];
  [(THWFreeTransformGestureRecognizer *)self initialLocation2];
  TSDDistance();
  double v6 = v5;
  TSDDistance();
  double v8 = v7 / v6;
  if ([(THWFreeTransformGestureRecognizerDelegate *)[(THWFreeTransformGestureRecognizer *)self freeTransformDelegate] freeTransformGestureRecognizerShouldRubberband:self])
  {
    float v9 = v8;
    return (float)((float)(logf(v9) * 0.25) + 1.0);
  }
  return v8;
}

- (double)p_calculateScale
{
  [(THWFreeTransformGestureRecognizer *)self previousLocation1];
  [(THWFreeTransformGestureRecognizer *)self previousLocation2];
  TSDDistance();
  double v4 = v3;
  [(THWFreeTransformGestureRecognizer *)self location1];
  [(THWFreeTransformGestureRecognizer *)self location2];
  TSDDistance();
  double v6 = v4 - v5;
  [(THWFreeTransformGestureRecognizer *)self scale];
  if (v6 != 0.0)
  {
    [(THWFreeTransformGestureRecognizer *)self location1];
    double v9 = v8;
    double v11 = v10;
    [(THWFreeTransformGestureRecognizer *)self location2];
    -[THWFreeTransformGestureRecognizer p_calculateScaleFromLocation1:location2:](self, "p_calculateScaleFromLocation1:location2:", v9, v11, v12, v13);
  }
  return result;
}

- (double)p_calculateAngleFromLocation1:(CGPoint)a3 location2:(CGPoint)a4
{
  [(THWFreeTransformGestureRecognizer *)self initialLocation1];
  [(THWFreeTransformGestureRecognizer *)self initialLocation2];
  TSDSubtractPoints();
  TSDAngleFromDelta();
  double v6 = v5;
  TSDSubtractPoints();
  TSDAngleFromDelta();
  double v8 = v7 - v6;
  if ([(THWFreeTransformGestureRecognizerDelegate *)[(THWFreeTransformGestureRecognizer *)self freeTransformDelegate] freeTransformGestureRecognizerShouldRubberband:self])return (fmod(v8 + 9.42477796, 6.28318531) + -3.14159265) * 0.5; {
  return v8;
  }
}

- (double)p_calculateAngle
{
  [(THWFreeTransformGestureRecognizer *)self angle];
  [(THWFreeTransformGestureRecognizer *)self location1];
  double v4 = v3;
  double v6 = v5;
  [(THWFreeTransformGestureRecognizer *)self location2];
  -[THWFreeTransformGestureRecognizer p_calculateAngleFromLocation1:location2:](self, "p_calculateAngleFromLocation1:location2:", v4, v6, v7, v8);
  TSDDeltaFromAngle();
  TSDDeltaFromAngle();
  TSDAveragePoints();
  TSDAngleFromDelta();
  return round(v9 * 100.0) / 100.0;
}

- (CGAffineTransform)transformWithScale:(SEL)a3 angle:(double)a4
{
  long long v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v22;
  long long v20 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tdouble x = v20;
  double x = self->mInitialDelta.x;
  double y = self->mInitialDelta.y;
  CGAffineTransformMakeTranslation(&t2, -x, -y);
  *(_OWORD *)&t1.a = v21;
  *(_OWORD *)&t1.c = v22;
  *(_OWORD *)&t1.tdouble x = v20;
  CGAffineTransformConcat(retstr, &t1, &t2);
  CGAffineTransformMakeScale(&v27, a4, a4);
  long long v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v11;
  *(_OWORD *)&v26.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v26, &v27);
  long long v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeRotation(&v25, a5);
  long long v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v13;
  *(_OWORD *)&v26.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v26, &v25);
  long long v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v24, x, y);
  long long v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v15;
  *(_OWORD *)&v26.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v26, &v24);
  long long v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v23, self->mPreviousTranslation.x, self->mPreviousTranslation.y);
  long long v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v17;
  *(_OWORD *)&v26.tdouble x = *(_OWORD *)&retstr->tx;
  double result = CGAffineTransformConcat(&t1, &v26, &v23);
  long long v19 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v19;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  return result;
}

- (void)updateAngle
{
  [(THWFreeTransformGestureRecognizer *)self p_calculateAngle];
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:");

  [(THWFreeTransformGestureRecognizer *)self p_updateTransform];
}

- (void)recenterOnTargetWithRectInView:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(THWFreeTransformGestureRecognizer *)self touch1]
    && [(THWFreeTransformGestureRecognizer *)self touch2])
  {
    id v8 = [(THWFreeTransformGestureRecognizer *)self view];
    [(UITouch *)[(THWFreeTransformGestureRecognizer *)self touch1] locationInView:v8];
    double v10 = v9;
    double v12 = v11;
    [(UITouch *)[(THWFreeTransformGestureRecognizer *)self touch2] locationInView:v8];
    -[THWFreeTransformGestureRecognizer recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:](self, "recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:", x, y, width, height, v10, v12, v13, v14);
  }
}

- (void)recenterOnTargetWithRectInView:(CGRect)a3 withTouchPoint:(CGPoint)a4 withTouchPoint:(CGPoint)a5
{
  TSDAveragePoints();
  double v7 = v6;
  double v9 = v8;
  TSDCenterOfRect();
  self->mInitialDelta.double x = v7 - v10;
  self->mInitialDelta.double y = v9 - v11;
}

- (void)p_updateTransform
{
  [(THWFreeTransformGestureRecognizer *)self scale];
  double v4 = v3;
  [(THWFreeTransformGestureRecognizer *)self angle];
  double v6 = v5;
  [(THWFreeTransformGestureRecognizer *)self location1];
  [(THWFreeTransformGestureRecognizer *)self location2];
  [(THWFreeTransformGestureRecognizer *)self initialLocation1];
  [(THWFreeTransformGestureRecognizer *)self initialLocation2];
  TSDAveragePoints();
  TSDAveragePoints();
  -[THWFreeTransformGestureRecognizer setCenterPoint:](self, "setCenterPoint:");
  TSDSubtractPoints();
  self->mPreviousTranslation.double x = v7;
  self->mPreviousTranslation.double y = v8;
  if ([(THWFreeTransformGestureRecognizerDelegate *)[(THWFreeTransformGestureRecognizer *)self freeTransformDelegate] freeTransformGestureRecognizerShouldRubberband:self])
  {
    TSDMultiplyPointScalar();
    self->mPreviousTranslation.double x = v9;
    self->mPreviousTranslation.double y = v10;
  }
  [(THWFreeTransformGestureRecognizer *)self transformWithScale:v4 angle:v6];
  *(_OWORD *)&self->mTransform.a = v11;
  *(_OWORD *)&self->mTransform.c = v12;
  *(_OWORD *)&self->mTransform.tdouble x = v13;
}

- (void)p_tryToBegin
{
  if (![(THWFreeTransformGestureRecognizer *)self freeTransformDelegate]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformGestureRecognizer p_tryToBegin]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformGestureRecognizer.m") lineNumber:197 description:@"Attempting to begin with a nil delegate."];
  }
  if ([(THWFreeTransformGestureRecognizer *)self freeTransformDelegate]
    && (([(THWFreeTransformGestureRecognizerDelegate *)[(THWFreeTransformGestureRecognizer *)self freeTransformDelegate] freeTransformGestureRecognizerShouldAllowPinchDown:self] & 1) != 0|| ([(THWFreeTransformGestureRecognizer *)self scale], v3 >= 1.0))&& (([(THWFreeTransformGestureRecognizerDelegate *)[(THWFreeTransformGestureRecognizer *)self freeTransformDelegate] freeTransformGestureRecognizerShouldAllowPinchUp:self] & 1) != 0|| ([(THWFreeTransformGestureRecognizer *)self scale], v4 <= 1.0)))
  {
    [(THWFreeTransformGestureRecognizer *)self p_updateTransform];
    [(THWFreeTransformGestureRecognizer *)self setState:1];
  }
  else
  {
    [(THWFreeTransformGestureRecognizer *)self p_failWithGestureState:5];
  }
}

- (void)cancel
{
}

- (void)p_failWithGestureState:(int64_t)a3
{
  [(THWFreeTransformGestureRecognizer *)self setState:a3];

  [(THWFreeTransformGestureRecognizer *)self p_clearDynamicFreeTransformController];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer touchesBegan:withEvent:](&v17, "touchesBegan:withEvent:");
  if ((unint64_t)[a3 count] >= 3) {
    goto LABEL_2;
  }
  id v9 = [a4 allTouches];
  if ([v9 count] != (char *)&dword_0 + 2 || -[THWFreeTransformGestureRecognizer state](self, "state"))
  {
    if ([(THWFreeTransformGestureRecognizer *)self state] != (char *)&dword_0 + 1
      || objc_msgSend(v9, "containsObject:", -[THWFreeTransformGestureRecognizer touch1](self, "touch1"))
      && (objc_msgSend(v9, "containsObject:", -[THWFreeTransformGestureRecognizer touch2](self, "touch2")) & 1) != 0)
    {
      [(THWFreeTransformGestureRecognizer *)self setState:0];
      return;
    }
    CGFloat v7 = self;
    uint64_t v8 = 4;
    goto LABEL_10;
  }
  id v10 = [v9 allObjects];
  id v11 = [v10 objectAtIndex:0];
  id v12 = [v10 objectAtIndex:1];
  id v13 = [(THWFreeTransformGestureRecognizer *)self view];
  id v14 = [v13 superview];
  [v11 locationInView:v14];
  [v12 locationInView:v14];
  TSDAveragePoints();
  if (!objc_msgSend(objc_msgSend(v14, "hitTest:withEvent:", 0), "isDescendantOfView:", v13))
  {
LABEL_2:
    CGFloat v7 = self;
    uint64_t v8 = 5;
LABEL_10:
    [(THWFreeTransformGestureRecognizer *)v7 p_failWithGestureState:v8];
    return;
  }
  [(THWFreeTransformGestureRecognizer *)self setTouch1:v11];
  [(THWFreeTransformGestureRecognizer *)self setTouch2:v12];
  [(THWFreeTransformGestureRecognizer *)self delegate];
  BOOL v15 = (objc_opt_respondsToSelector() & 1) != 0
     && ![self delegate].gestureRecognizerShouldBegin:self || [self freeTransformDelegate] == 0;
  if ([(THWFreeTransformGestureRecognizer *)self delegate])
  {
    [(THWFreeTransformGestureRecognizer *)self delegate];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformGestureRecognizer touchesBegan:withEvent:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformGestureRecognizer.m") lineNumber:266 description:@"Expected a the non-nil delegate to be a gesture dispatcher."];
    }
  }
  if (v15)
  {
    [(THWFreeTransformGestureRecognizer *)self freeTransformDelegate];
    [(THWFreeTransformGestureRecognizer *)self setTouch1:0];
    [(THWFreeTransformGestureRecognizer *)self setTouch2:0];
    goto LABEL_2;
  }
  long long v16 = [(THWFreeTransformGestureRecognizer *)self unmovingParentView];
  [(THWFreeTransformGestureRecognizer *)self setMovements:0];
  [v11 locationInView:v16];
  -[THWFreeTransformGestureRecognizer setInitialLocation1:](self, "setInitialLocation1:");
  [v12 locationInView:v16];
  -[THWFreeTransformGestureRecognizer setInitialLocation2:](self, "setInitialLocation2:");
  [(THWFreeTransformGestureRecognizer *)self initialLocation1];
  -[THWFreeTransformGestureRecognizer setPreviousLocation1:](self, "setPreviousLocation1:");
  [(THWFreeTransformGestureRecognizer *)self initialLocation2];
  -[THWFreeTransformGestureRecognizer setPreviousLocation2:](self, "setPreviousLocation2:");
  [(THWFreeTransformGestureRecognizer *)self initialLocation1];
  -[THWFreeTransformGestureRecognizer setLocation1:](self, "setLocation1:");
  [(THWFreeTransformGestureRecognizer *)self initialLocation2];
  -[THWFreeTransformGestureRecognizer setLocation2:](self, "setLocation2:");
  [(THWFreeTransformGestureRecognizer *)self p_calculateScale];
  -[THWFreeTransformGestureRecognizer setScale:](self, "setScale:");
  [(THWFreeTransformGestureRecognizer *)self p_calculateAngle];
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:");
  if ([(THWFreeTransformGestureRecognizer *)self useGestureViewForReCentering]) {
    long long v16 = (UIView *)[(THWFreeTransformGestureRecognizer *)self view];
  }
  [v11 locationInView:v16];
  [v12 locationInView:v16];
  [(UIView *)v16 bounds];
  -[THWFreeTransformGestureRecognizer recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:](self, "recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:");
  self->mReaddouble y = 1;
  if (([(THWFreeTransformGestureRecognizerDelegate *)[(THWFreeTransformGestureRecognizer *)self freeTransformDelegate] freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:self] & 1) == 0)[(THWFreeTransformGestureRecognizer *)self p_tryToBegin]; {
}
  }

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7 = [a4 allTouches];
  [(UITouch *)[(THWFreeTransformGestureRecognizer *)self touch1] previousLocationInView:[(THWFreeTransformGestureRecognizer *)self unmovingParentView]];
  -[THWFreeTransformGestureRecognizer setPreviousLocation1:](self, "setPreviousLocation1:");
  [(UITouch *)[(THWFreeTransformGestureRecognizer *)self touch2] previousLocationInView:[(THWFreeTransformGestureRecognizer *)self unmovingParentView]];
  -[THWFreeTransformGestureRecognizer setPreviousLocation2:](self, "setPreviousLocation2:");
  [(UITouch *)[(THWFreeTransformGestureRecognizer *)self touch1] locationInView:[(THWFreeTransformGestureRecognizer *)self unmovingParentView]];
  -[THWFreeTransformGestureRecognizer setLocation1:](self, "setLocation1:");
  [(UITouch *)[(THWFreeTransformGestureRecognizer *)self touch2] locationInView:[(THWFreeTransformGestureRecognizer *)self unmovingParentView]];
  -[THWFreeTransformGestureRecognizer setLocation2:](self, "setLocation2:");
  [(THWFreeTransformGestureRecognizer *)self p_calculateScale];
  -[THWFreeTransformGestureRecognizer setScale:](self, "setScale:");
  [(THWFreeTransformGestureRecognizer *)self p_calculateAngle];
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:");
  if ([(THWFreeTransformGestureRecognizer *)self state] || !self->mReady)
  {
    if ([(THWFreeTransformGestureRecognizer *)self state] != (char *)&dword_0 + 1
      || objc_msgSend(v7, "containsObject:", -[THWFreeTransformGestureRecognizer touch1](self, "touch1"))
      && (objc_msgSend(v7, "containsObject:", -[THWFreeTransformGestureRecognizer touch2](self, "touch2")) & 1) != 0)
    {
      if ([(THWFreeTransformGestureRecognizer *)self state] != (char *)&dword_0 + 1
        && [(THWFreeTransformGestureRecognizer *)self state] != (char *)&dword_0 + 2)
      {
        goto LABEL_13;
      }
      [(THWFreeTransformGestureRecognizer *)self setMovements:(char *)[(THWFreeTransformGestureRecognizer *)self movements] + 1];
      [(THWFreeTransformGestureRecognizer *)self p_updateTransform];
      uint64_t v8 = self;
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v8 = self;
      uint64_t v9 = 4;
    }
    [(THWFreeTransformGestureRecognizer *)v8 setState:v9];
    goto LABEL_13;
  }
  [(THWFreeTransformGestureRecognizer *)self scale];
  if (v10 != 1.0) {
    [(THWFreeTransformGestureRecognizer *)self p_tryToBegin];
  }
LABEL_13:
  v11.receiver = self;
  v11.super_class = (Class)THWFreeTransformGestureRecognizer;
  [(THWFreeTransformGestureRecognizer *)&v11 touchesMoved:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(THWFreeTransformGestureRecognizer *)self state] == (char *)&dword_0 + 2
    || [(THWFreeTransformGestureRecognizer *)self state] == (char *)&dword_0 + 1)
  {
    uint64_t v7 = 3;
  }
  else
  {
    if (objc_msgSend(objc_msgSend(a4, "allTouches"), "count") != (char *)&dword_0 + 1) {
      goto LABEL_5;
    }
    uint64_t v7 = 4;
  }
  [(THWFreeTransformGestureRecognizer *)self setState:v7];
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)THWFreeTransformGestureRecognizer;
  [(THWFreeTransformGestureRecognizer *)&v8 touchesEnded:a3 withEvent:a4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(THWFreeTransformGestureRecognizer *)self setState:4];
  v7.receiver = self;
  v7.super_class = (Class)THWFreeTransformGestureRecognizer;
  [(THWFreeTransformGestureRecognizer *)&v7 touchesCancelled:a3 withEvent:a4];
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)THWFreeTransformGestureRecognizer;
  [(THWFreeTransformGestureRecognizer *)&v5 reset];
  [(THWFreeTransformGestureRecognizer *)self setMovements:0];
  double y = CGPointZero.y;
  -[THWFreeTransformGestureRecognizer setInitialLocation1:](self, "setInitialLocation1:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setInitialLocation2:](self, "setInitialLocation2:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setPreviousLocation1:](self, "setPreviousLocation1:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setPreviousLocation2:](self, "setPreviousLocation2:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setLocation1:](self, "setLocation1:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setLocation2:](self, "setLocation2:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setCenterPoint:](self, "setCenterPoint:", CGPointZero.x, y);
  [(THWFreeTransformGestureRecognizer *)self setScale:1.0];
  [(THWFreeTransformGestureRecognizer *)self setAngle:0.0];
  [(THWFreeTransformGestureRecognizer *)self setTouch1:0];
  [(THWFreeTransformGestureRecognizer *)self setTouch2:0];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mTransform.c = v4;
  *(_OWORD *)&self->mTransform.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  self->mReaddouble y = 0;
  [(THWFreeTransformGestureRecognizer *)self p_clearDynamicFreeTransformController];
  [(THWFreeTransformGestureRecognizer *)self delegate];
  [(id)TSUProtocolCast() didReset:self];
}

- (UITouch)touch1
{
  return self->mTouch1;
}

- (void)setTouch1:(id)a3
{
}

- (UITouch)touch2
{
  return self->mTouch2;
}

- (void)setTouch2:(id)a3
{
}

- (CGPoint)initialLocation1
{
  double x = self->mInitialLocation1.x;
  double y = self->mInitialLocation1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialLocation1:(CGPoint)a3
{
  self->mInitialLocation1 = a3;
}

- (CGPoint)initialLocation2
{
  double x = self->mInitialLocation2.x;
  double y = self->mInitialLocation2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialLocation2:(CGPoint)a3
{
  self->mInitialLocation2 = a3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].d;
  return self;
}

- (CGPoint)centerPoint
{
  double x = self->mCenterPoint.x;
  double y = self->mCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenterPoint:(CGPoint)a3
{
  self->mCenterPoint = a3;
}

- (UIView)unmovingParentView
{
  return self->mUnmovingParentView;
}

- (void)setUnmovingParentView:(id)a3
{
  self->mUnmovingParentView = (UIView *)a3;
}

- (THWFreeTransformGestureRecognizerDelegate)freeTransformDelegate
{
  return self->mFreeTransformDelegate;
}

- (void)setFreeTransformDelegate:(id)a3
{
  self->mFreeTransformDelegate = (THWFreeTransformGestureRecognizerDelegate *)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (BOOL)useGestureViewForReCentering
{
  return self->_useGestureViewForReCentering;
}

- (void)setUseGestureViewForReCentering:(BOOL)a3
{
  self->_useGestureViewForReCentering = a3;
}

- (CGPoint)previousLocation1
{
  double x = self->_previousLocation1.x;
  double y = self->_previousLocation1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousLocation1:(CGPoint)a3
{
  self->_previousLocation1 = a3;
}

- (CGPoint)previousLocation2
{
  double x = self->_previousLocation2.x;
  double y = self->_previousLocation2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousLocation2:(CGPoint)a3
{
  self->_previousLocation2 = a3;
}

- (CGPoint)location1
{
  double x = self->_location1.x;
  double y = self->_location1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation1:(CGPoint)a3
{
  self->_location1 = a3;
}

- (CGPoint)location2
{
  double x = self->_location2.x;
  double y = self->_location2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation2:(CGPoint)a3
{
  self->_location2 = a3;
}

- (unint64_t)movements
{
  return self->_movements;
}

- (void)setMovements:(unint64_t)a3
{
  self->_movements = a3;
}

@end