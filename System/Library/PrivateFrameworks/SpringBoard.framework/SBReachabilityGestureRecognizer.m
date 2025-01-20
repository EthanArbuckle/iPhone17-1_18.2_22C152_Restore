@interface SBReachabilityGestureRecognizer
- (BOOL)everTranslatedUpwards;
- (BOOL)movedPastHysteresis;
- (CGPoint)initialTouchLocation;
- (SBReachabilityGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (SBReachabilitySettings)settings;
- (SBTouchHistory)touchHistory;
- (UITouch)activeTouch;
- (void)reset;
- (void)setActiveTouch:(id)a3;
- (void)setEverTranslatedUpwards:(BOOL)a3;
- (void)setInitialTouchLocation:(CGPoint)a3;
- (void)setMovedPastHysteresis:(BOOL)a3;
- (void)setSettings:(id)a3;
- (void)setTouchHistory:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBReachabilityGestureRecognizer

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBReachabilityGestureRecognizer;
  [(SBReachabilityGestureRecognizer *)&v3 reset];
  self->_everTranslatedUpwards = 0;
  self->_movedPastHysteresis = 0;
  [(SBTouchHistory *)self->_touchHistory reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBReachabilityGestureRecognizer;
  [(SBReachabilityGestureRecognizer *)&v19 touchesBegan:v6 withEvent:v7];
  v8 = [v6 anyObject];
  v9 = [(SBReachabilityGestureRecognizer *)self view];
  [v8 locationInView:v9];
  CGFloat v11 = v10;
  double v13 = v12;
  if ((unint64_t)[v6 count] < 2
    && ([v9 bounds],
        double v15 = v14,
        [(SBReachabilitySettings *)self->_settings systemWideSwipeDownHeight],
        v13 >= v15 - v16))
  {
    v17 = [v6 anyObject];
    v18 = [v7 coalescedTouchesForTouch:v17];

    _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v18, self, v9, 0);
    objc_storeStrong((id *)&self->_activeTouch, v8);
    self->_initialTouchLocation.x = v11;
    self->_initialTouchLocation.y = v13;
    self->_everTranslatedUpwards = v13 - v13 < -10.0;
  }
  else
  {
    [(SBReachabilityGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBReachabilityGestureRecognizer;
  [(SBReachabilityGestureRecognizer *)&v48 touchesEnded:v6 withEvent:v7];
  v8 = [v6 anyObject];
  if ((unint64_t)[v6 count] <= 1 && v8 == self->_activeTouch)
  {
    v9 = [(SBReachabilityGestureRecognizer *)self view];
    [(UITouch *)v8 locationInView:v9];
    double v11 = v10;
    double v13 = v12;
    double y = self->_initialTouchLocation.y;
    double x = self->_initialTouchLocation.x;
    double v14 = [v6 anyObject];
    double v15 = [v7 coalescedTouchesForTouch:v14];

    _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v15, self, v9, 0);
    [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0416666667];
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    [v9 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [v9 safeAreaInsets];
    CGFloat v29 = v23 + v28;
    CGFloat v32 = v25 - (v30 + v31);
    v49.size.height = v27 - (v28 + v33);
    v49.origin.double x = v21 + v30;
    v49.origin.double y = v29;
    v49.size.width = v32;
    BOOL v34 = CGRectContainsPoint(v49, self->_initialTouchLocation);
    [v9 bounds];
    if (!self->_movedPastHysteresis) {
      goto LABEL_8;
    }
    BOOL everTranslatedUpwards = self->_everTranslatedUpwards;
    *(double *)v43 = v11;
    *(double *)&v43[1] = v13;
    *(double *)&v43[2] = v11 - x;
    *(double *)&v43[3] = v13 - y;
    v43[4] = v17;
    v43[5] = v19;
    v43[6] = v35;
    v43[7] = v36;
    v43[8] = v37;
    v43[9] = v38;
    BOOL v44 = v34;
    BOOL v45 = everTranslatedUpwards;
    int v46 = 0;
    __int16 v47 = 0;
    if (SBReachabilityGestureShouldActivate((uint64_t)v43))
    {
      [(SBReachabilityGestureRecognizer *)self setState:1];
      uint64_t v40 = 3;
    }
    else
    {
LABEL_8:
      uint64_t v40 = 5;
    }
    [(SBReachabilityGestureRecognizer *)self setState:v40];
  }
  else
  {
    [(SBReachabilityGestureRecognizer *)self setState:5];
  }
}

- (SBReachabilityGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityGestureRecognizer;
  v4 = [(SBReachabilityGestureRecognizer *)&v11 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(SBReachabilityGestureRecognizer *)v4 _setRequiresSystemGesturesToFail:0];
    [(SBReachabilityGestureRecognizer *)v5 setDelaysTouchesBegan:1];
    [(SBReachabilityGestureRecognizer *)v5 setCancelsTouchesInView:1];
    id v6 = objc_alloc_init(SBTouchHistory);
    touchHistordouble y = v5->_touchHistory;
    v5->_touchHistordouble y = v6;

    uint64_t v8 = +[SBReachabilityDomain rootSettings];
    settings = v5->_settings;
    v5->_settings = (SBReachabilitySettings *)v8;
  }
  return v5;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBReachabilityGestureRecognizer;
  [(SBReachabilityGestureRecognizer *)&v19 touchesMoved:v6 withEvent:v7];
  uint64_t v8 = [v6 anyObject];
  if ((unint64_t)[v6 count] <= 1 && v8 == self->_activeTouch)
  {
    v9 = [(SBReachabilityGestureRecognizer *)self view];
    [(UITouch *)v8 locationInView:v9];
    double v11 = v10;
    double x = self->_initialTouchLocation.x;
    double v14 = v13 - self->_initialTouchLocation.y;
    double v15 = [v6 anyObject];
    uint64_t v16 = [v7 coalescedTouchesForTouch:v15];

    _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v16, self, v9, 0);
    if (!self->_everTranslatedUpwards) {
      self->_BOOL everTranslatedUpwards = v14 < -10.0;
    }
    if (!self->_movedPastHysteresis)
    {
      double v17 = fabs(v14);
      if (fabs(v11 - x) > 10.0 || v17 > 10.0) {
        self->_movedPastHysteresis = 1;
      }
    }
  }
  else
  {
    [(SBReachabilityGestureRecognizer *)self setState:5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBReachabilityGestureRecognizer;
  [(SBReachabilityGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(SBReachabilityGestureRecognizer *)self setState:4];
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (void)setActiveTouch:(id)a3
{
}

- (CGPoint)initialTouchLocation
{
  double x = self->_initialTouchLocation.x;
  double y = self->_initialTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialTouchLocation:(CGPoint)a3
{
  self->_initialTouchLocation = a3;
}

- (BOOL)everTranslatedUpwards
{
  return self->_everTranslatedUpwards;
}

- (void)setEverTranslatedUpwards:(BOOL)a3
{
  self->_BOOL everTranslatedUpwards = a3;
}

- (BOOL)movedPastHysteresis
{
  return self->_movedPastHysteresis;
}

- (void)setMovedPastHysteresis:(BOOL)a3
{
  self->_movedPastHysteresis = a3;
}

- (SBReachabilitySettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeTouch, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end