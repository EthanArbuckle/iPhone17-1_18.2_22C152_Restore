@interface CarMapNudgerizer
- ($29727DC6989B69F22950FCD998EA20D4)panningMetrics;
- (BOOL)_hasBegunMomentaryImpulseInDirection:(int64_t)a3;
- (BOOL)active;
- (CarImpulsePanningDynamicItem)item;
- (CarMapNudgerizer)init;
- (CarMapNudgerizerDelegate)delegate;
- (MKMapView)mapView;
- (NSDate)lastImpulseDate;
- (double)_userDefaultsDoubleForKey:(id)a3 defaultValue:(double)a4;
- (double)holdMagnitudeForDirection:(int64_t)a3;
- (double)impulseMagnitudeForDirection:(int64_t)a3;
- (id)_behaviorForDirection:(int64_t)a3;
- (int64_t)_eventDirectionForButtonType:(int64_t)a3;
- (int64_t)lastImpulseDirection;
- (unint64_t)impulseCount;
- (void)_addPanRecognizers;
- (void)_beginAnimatingIfNeeded;
- (void)_beginImpulseDown;
- (void)_beginImpulseInDirection:(int64_t)a3 withMagnitude:(double)a4;
- (void)_beginImpulseLeft;
- (void)_beginImpulseRight;
- (void)_beginImpulseUp;
- (void)_clearGesture:(id)a3;
- (void)_clearGestureRecognizersInFlight;
- (void)_clearGesturesAndAnimations;
- (void)_configureAnimator;
- (void)_endAnimating;
- (void)_endAnimatingIfNeeded;
- (void)_endImpulseDown;
- (void)_endImpulseLeft;
- (void)_endImpulseRight;
- (void)_endImpulseUp;
- (void)_momentaryImpulseDown;
- (void)_momentaryImpulseLeft;
- (void)_momentaryImpulseRight;
- (void)_momentaryImpulseUp;
- (void)_removePanRecognizers;
- (void)_setHasBegunMomentaryImpulse:(BOOL)a3 inDirection:(int64_t)a4;
- (void)_setImpulseInDirection:(int64_t)a3 magnitude:(double)a4;
- (void)beginImpulseInDirection:(int64_t)a3;
- (void)dynamicAnimatorDidPause:(id)a3;
- (void)endImpluseInDirection:(int64_t)a3;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)momentaryImpulseInDirection:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setImpulseCount:(unint64_t)a3;
- (void)setItem:(id)a3;
- (void)setLastImpulseDate:(id)a3;
- (void)setLastImpulseDirection:(int64_t)a3;
- (void)setMapView:(id)a3;
- (void)setPanningMetrics:(id *)a3;
@end

@implementation CarMapNudgerizer

- (CarMapNudgerizer)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarMapNudgerizer;
  v2 = [(CarMapNudgerizer *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(CarMapNudgerizer *)v2 _userDefaultsCGFloatForKey:@"CarMapNudgerizerMagnitudeHold" defaultValue:0.25];
    double v5 = v4;
    [(CarMapNudgerizer *)v3 _userDefaultsCGFloatForKey:@"CarMapNudgerizerMagnitudeImpulse" defaultValue:0.300000012];
    double v7 = v6;
    [(CarMapNudgerizer *)v3 _userDefaultsCGFloatForKey:@"CarMapNudgerizerMagnitudeImpulseAcceleration" defaultValue:0.100000001];
    double v9 = v8;
    [(CarMapNudgerizer *)v3 _userDefaultsCGFloatForKey:@"CarMapNudgerizerMagnitudeImpulseMax" defaultValue:0.699999988];
    double v11 = v10;
    [(CarMapNudgerizer *)v3 _userDefaultsDoubleForKey:@"CarMapNudgerizerImpulseAccelerationTimeout" defaultValue:5.0];
    v3->_panningMetrics.holdTime = 0.25;
    v3->_panningMetrics.holdMagnitude = v5;
    v3->_panningMetrics.impulseMagnitude = v7;
    v3->_panningMetrics.impulseMagnitudeAccelerationFactor = v9;
    v3->_panningMetrics.impulseMagnitudeMax = v11;
    v3->_panningMetrics.impulseAccelerationTimeout = v12;
    v3->_panningMetrics.stopTimer = 0.5;
  }
  return v3;
}

- (void)_configureAnimator
{
  location = (id *)&self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  [WeakRetained bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v38 = -[CarImpulsePanningDynamicItem initWithBounds:]([CarImpulsePanningDynamicItem alloc], "initWithBounds:", v5, v7, v9, v11);
  objc_storeStrong((id *)&self->_item, v38);
  -[CarImpulsePanningDynamicItem setCenter:](self->_item, "setCenter:", CGPointZero.x, CGPointZero.y);
  double v12 = (UIDynamicBehavior *)objc_alloc_init((Class)UIDynamicBehavior);
  panBehavior = self->_panBehavior;
  self->_panBehavior = v12;

  id v14 = objc_alloc((Class)UIDynamicItemBehavior);
  item = self->_item;
  v15 = +[NSArray arrayWithObjects:&item count:1];
  id v16 = [v14 initWithItems:v15];

  [v16 setResistance:5.0];
  [(UIDynamicBehavior *)self->_panBehavior addChildBehavior:v16];
  id v17 = objc_alloc((Class)UIPushBehavior);
  v46 = self->_item;
  v18 = +[NSArray arrayWithObjects:&v46 count:1];
  v19 = (UIPushBehavior *)[v17 initWithItems:v18 mode:0];
  leftPush = self->_leftPush;
  self->_leftPush = v19;

  [(UIPushBehavior *)self->_leftPush setAngle:0.0];
  id v21 = objc_alloc((Class)UIPushBehavior);
  v45 = self->_item;
  v22 = +[NSArray arrayWithObjects:&v45 count:1];
  v23 = (UIPushBehavior *)[v21 initWithItems:v22 mode:0];
  rightPush = self->_rightPush;
  self->_rightPush = v23;

  [(UIPushBehavior *)self->_rightPush setAngle:3.14159265];
  id v25 = objc_alloc((Class)UIPushBehavior);
  v44 = self->_item;
  v26 = +[NSArray arrayWithObjects:&v44 count:1];
  v27 = (UIPushBehavior *)[v25 initWithItems:v26 mode:0];
  upPush = self->_upPush;
  self->_upPush = v27;

  [(UIPushBehavior *)self->_upPush setAngle:1.57079633];
  id v29 = objc_alloc((Class)UIPushBehavior);
  v43 = self->_item;
  v30 = +[NSArray arrayWithObjects:&v43 count:1];
  v31 = (UIPushBehavior *)[v29 initWithItems:v30 mode:0];
  downPush = self->_downPush;
  self->_downPush = v31;

  [(UIPushBehavior *)self->_downPush setAngle:4.71238898];
  [(UIDynamicBehavior *)self->_panBehavior addChildBehavior:self->_leftPush];
  [(UIDynamicBehavior *)self->_panBehavior addChildBehavior:self->_rightPush];
  [(UIDynamicBehavior *)self->_panBehavior addChildBehavior:self->_downPush];
  [(UIDynamicBehavior *)self->_panBehavior addChildBehavior:self->_upPush];
  id v33 = objc_alloc((Class)UIDynamicAnimator);
  id v34 = objc_loadWeakRetained(location);
  v35 = (UIDynamicAnimator *)[v33 initWithReferenceView:v34];
  animator = self->_animator;
  self->_animator = v35;

  [(UIDynamicAnimator *)self->_animator addBehavior:self->_panBehavior];
  [(UIDynamicAnimator *)self->_animator setDelegate:self];
  objc_initWeak(&from, self);
  v37 = self->_panBehavior;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10076F86C;
  v40[3] = &unk_1012E6708;
  objc_copyWeak(&v41, &from);
  [(UIDynamicBehavior *)v37 setAction:v40];
  objc_destroyWeak(&v41);
  objc_destroyWeak(&from);
}

- (void)dynamicAnimatorDidPause:(id)a3
{
}

- (void)_beginAnimatingIfNeeded
{
  if (!self->_animating)
  {
    [(CarMapNudgerizer *)self _configureAnimator];
    -[CarImpulsePanningDynamicItem setCenter:](self->_item, "setCenter:", CGPointZero.x, CGPointZero.y);
    self->_animating = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    CGFloat MidX = CGRectGetMidX(v16);
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    CGFloat MidY = CGRectGetMidY(v17);
    self->_initialPanPoint.x = MidX;
    self->_initialPanPoint.y = MidY;
    id v14 = objc_loadWeakRetained((id *)&self->_mapView);
    [v14 _startPanningAtPoint:self->_initialPanPoint.x, self->_initialPanPoint.y];
  }
}

- (void)_endAnimating
{
  [(UIDynamicAnimator *)self->_animator removeAllBehaviors];
  animator = self->_animator;
  self->_animator = 0;

  item = self->_item;
  self->_item = 0;

  if (self->_animating)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _stopPanningAtPoint:self->_initialPanPoint.x, self->_initialPanPoint.y];
  }
  self->_animating = 0;
}

- (void)_endAnimatingIfNeeded
{
  if (self->_animating && ![(UIDynamicAnimator *)self->_animator isRunning])
  {
    [(CarMapNudgerizer *)self _endAnimating];
  }
}

- (void)_beginImpulseUp
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseUp" object:0];
  [(CarMapNudgerizer *)self holdMagnitudeForDirection:1];

  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 1);
}

- (void)_endImpulseUp
{
  v3 = [(CarMapNudgerizer *)self _behaviorForDirection:1];
  [v3 setMagnitude:0.0];

  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:0 inDirection:1];
}

- (void)_momentaryImpulseUp
{
  [(CarMapNudgerizer *)self impulseMagnitudeForDirection:1];
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 1);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseUp" object:0];
  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:1 inDirection:1];
  [(CarMapNudgerizer *)self panningMetrics];
  [(CarMapNudgerizer *)self performSelector:"_endImpulseUp" withObject:0 afterDelay:v3];
}

- (void)_beginImpulseDown
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseDown" object:0];
  [(CarMapNudgerizer *)self holdMagnitudeForDirection:2];

  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 2);
}

- (void)_endImpulseDown
{
  double v3 = [(CarMapNudgerizer *)self _behaviorForDirection:2];
  [v3 setMagnitude:0.0];

  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:0 inDirection:2];
}

- (void)_momentaryImpulseDown
{
  [(CarMapNudgerizer *)self impulseMagnitudeForDirection:2];
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 2);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseDown" object:0];
  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:1 inDirection:2];
  [(CarMapNudgerizer *)self panningMetrics];
  [(CarMapNudgerizer *)self performSelector:"_endImpulseDown" withObject:0 afterDelay:v3];
}

- (void)_beginImpulseLeft
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseLeft" object:0];
  [(CarMapNudgerizer *)self holdMagnitudeForDirection:3];

  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 3);
}

- (void)_endImpulseLeft
{
  double v3 = [(CarMapNudgerizer *)self _behaviorForDirection:3];
  [v3 setMagnitude:0.0];

  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:0 inDirection:3];
}

- (void)_momentaryImpulseLeft
{
  [(CarMapNudgerizer *)self impulseMagnitudeForDirection:3];
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 3);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseLeft" object:0];
  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:1 inDirection:3];
  [(CarMapNudgerizer *)self panningMetrics];
  [(CarMapNudgerizer *)self performSelector:"_endImpulseLeft" withObject:0 afterDelay:v3];
}

- (void)_beginImpulseRight
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseRight" object:0];
  [(CarMapNudgerizer *)self holdMagnitudeForDirection:4];

  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 4);
}

- (void)_endImpulseRight
{
  double v3 = [(CarMapNudgerizer *)self _behaviorForDirection:4];
  [v3 setMagnitude:0.0];

  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:0 inDirection:4];
}

- (void)_momentaryImpulseRight
{
  [(CarMapNudgerizer *)self impulseMagnitudeForDirection:4];
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 4);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_endImpulseRight" object:0];
  [(CarMapNudgerizer *)self _setHasBegunMomentaryImpulse:1 inDirection:4];
  [(CarMapNudgerizer *)self panningMetrics];
  [(CarMapNudgerizer *)self performSelector:"_endImpulseRight" withObject:0 afterDelay:v3];
}

- (double)holdMagnitudeForDirection:(int64_t)a3
{
  double v3 = self;
  [(CarMapNudgerizer *)self panningMetrics];
  double v3 = (CarMapNudgerizer *)((char *)v3 + 168);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->super.isa);
  [WeakRetained bounds];
  double Height = CGRectGetHeight(v10);
  id v6 = objc_loadWeakRetained((id *)&v3->super.isa);
  [v6 bounds];
  double v7 = v9 * fmax(Height, CGRectGetWidth(v11));

  return v7;
}

- (double)impulseMagnitudeForDirection:(int64_t)a3
{
  [(CarMapNudgerizer *)self panningMetrics];
  double v5 = v22;
  id v6 = +[NSDate date];
  double v7 = [(CarMapNudgerizer *)self lastImpulseDate];
  [(CarMapNudgerizer *)self panningMetrics];
  double v8 = [v7 dateByAddingTimeInterval:v21];
  id v9 = [v8 compare:v6];

  if ([(CarMapNudgerizer *)self lastImpulseDirection] == a3 && v9 == (id)1)
  {
    double v10 = (double)[(CarMapNudgerizer *)self impulseCount];
    [(CarMapNudgerizer *)self panningMetrics];
    [(CarMapNudgerizer *)self panningMetrics];
    double v5 = fmin(v22 + v10 * v20, v19);
  }
  else
  {
    [(CarMapNudgerizer *)self setLastImpulseDirection:a3];
    [(CarMapNudgerizer *)self setImpulseCount:0];
  }
  [(CarMapNudgerizer *)self setLastImpulseDate:v6];
  [(CarMapNudgerizer *)self setImpulseCount:(char *)[(CarMapNudgerizer *)self impulseCount] + 1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  [WeakRetained bounds];
  if ((unint64_t)(a3 - 1) > 1) {
    double Width = CGRectGetWidth(*(CGRect *)&v12);
  }
  else {
    double Width = CGRectGetHeight(*(CGRect *)&v12);
  }
  double v17 = Width;

  return v5 * v17;
}

- (void)_beginImpulseInDirection:(int64_t)a3 withMagnitude:(double)a4
{
  p_mapView = &self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  if (!WeakRetained) {
    goto LABEL_13;
  }
  id v9 = WeakRetained;
  id v10 = objc_loadWeakRetained((id *)p_mapView);
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double height = CGSizeZero.height;

  if (v12 == CGSizeZero.width && v14 == height)
  {
LABEL_13:
    v24 = sub_100015DB4();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      return;
    }
    id v25 = objc_loadWeakRetained((id *)p_mapView);
    if (!v25)
    {
      v30 = @"<nil>";
      goto LABEL_22;
    }
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    if (objc_opt_respondsToSelector())
    {
      v28 = [v25 performSelector:"accessibilityIdentifier"];
      id v29 = v28;
      if (v28 && ![v28 isEqualToString:v27])
      {
        v30 = +[NSString stringWithFormat:@"%@<%p, %@>", v27, v25, v29];

        goto LABEL_20;
      }
    }
    v30 = +[NSString stringWithFormat:@"%@<%p>", v27, v25];
LABEL_20:

LABEL_22:
    id v31 = objc_loadWeakRetained((id *)p_mapView);
    [v31 bounds];
    v32 = NSStringFromCGRect(v38);
    *(_DWORD *)buf = 138412546;
    id v34 = v30;
    __int16 v35 = 2112;
    v36 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Cannot begin map panning impulse with mapView:%@ bounds:%@", buf, 0x16u);

    goto LABEL_23;
  }
  id v17 = objc_loadWeakRetained((id *)p_mapView);
  id v18 = [v17 userTrackingMode];

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_mapView);
    [v19 _setUserTrackingMode:0 animated:0 fromTrackingButton:0];
  }
  id v20 = objc_loadWeakRetained((id *)&self->_delegate);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    id v23 = objc_loadWeakRetained((id *)p_mapView);
    [v22 nudgerizer:self didGestureMapView:v23 inDirection:a3];
  }

  [(CarMapNudgerizer *)self _setImpulseInDirection:a3 magnitude:a4];
}

- (id)_behaviorForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.isa + qword_100F72050[a3 - 1]);
  }
  return v4;
}

- (void)_setImpulseInDirection:(int64_t)a3 magnitude:(double)a4
{
  [(CarMapNudgerizer *)self _beginAnimatingIfNeeded];
  id v7 = [(CarMapNudgerizer *)self _behaviorForDirection:a3];
  [v7 setMagnitude:a4];
}

- (BOOL)_hasBegunMomentaryImpulseInDirection:(int64_t)a3
{
  return *((unsigned char *)&self->super.isa + a3 + 7);
}

- (void)_setHasBegunMomentaryImpulse:(BOOL)a3 inDirection:(int64_t)a4
{
  *((unsigned char *)&self->super.isa + a4 + 7) = a3;
}

- (void)beginImpulseInDirection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      [(CarMapNudgerizer *)self _beginImpulseUp];
      break;
    case 2:
      [(CarMapNudgerizer *)self _beginImpulseDown];
      break;
    case 3:
      [(CarMapNudgerizer *)self _beginImpulseLeft];
      break;
    case 4:
      [(CarMapNudgerizer *)self _beginImpulseRight];
      break;
    default:
      return;
  }
}

- (void)endImpluseInDirection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      [(CarMapNudgerizer *)self _endImpulseUp];
      break;
    case 2:
      [(CarMapNudgerizer *)self _endImpulseDown];
      break;
    case 3:
      [(CarMapNudgerizer *)self _endImpulseLeft];
      break;
    case 4:
      [(CarMapNudgerizer *)self _endImpulseRight];
      break;
    default:
      return;
  }
}

- (void)momentaryImpulseInDirection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      [(CarMapNudgerizer *)self _momentaryImpulseUp];
      break;
    case 2:
      [(CarMapNudgerizer *)self _momentaryImpulseDown];
      break;
    case 3:
      [(CarMapNudgerizer *)self _momentaryImpulseLeft];
      break;
    case 4:
      [(CarMapNudgerizer *)self _momentaryImpulseRight];
      break;
    default:
      return;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(CarMapNudgerizer *)self _addPanRecognizers];
    }
    else {
      [(CarMapNudgerizer *)self _removePanRecognizers];
    }
  }
}

- (void)_addPanRecognizers
{
  uint64_t v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 window];
  objc_storeWeak((id *)&self->_gestureRecognizerView, v4);

  double v5 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleLongPress:"];
  leftLongPressRecognizer = self->_leftLongPressRecognizer;
  self->_leftLongPressRecognizer = v5;

  [(UILongPressGestureRecognizer *)self->_leftLongPressRecognizer setAllowedPressTypes:&off_1013ADE90];
  id v7 = self->_leftLongPressRecognizer;
  [(CarMapNudgerizer *)self panningMetrics];
  [(UILongPressGestureRecognizer *)v7 setMinimumPressDuration:v36];
  double v8 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  leftTapRecognizer = self->_leftTapRecognizer;
  self->_leftTapRecognizer = v8;

  [(UITapGestureRecognizer *)self->_leftTapRecognizer setAllowedPressTypes:&off_1013ADEA8];
  [(UITapGestureRecognizer *)self->_leftTapRecognizer requireGestureRecognizerToFail:self->_leftLongPressRecognizer];
  id v10 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleLongPress:"];
  rightLongPressRecognizer = self->_rightLongPressRecognizer;
  self->_rightLongPressRecognizer = v10;

  [(UILongPressGestureRecognizer *)self->_rightLongPressRecognizer setAllowedPressTypes:&off_1013ADEC0];
  double v12 = self->_rightLongPressRecognizer;
  [(CarMapNudgerizer *)self panningMetrics];
  [(UILongPressGestureRecognizer *)v12 setMinimumPressDuration:v35];
  double v13 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  rightTapRecognizer = self->_rightTapRecognizer;
  self->_rightTapRecognizer = v13;

  [(UITapGestureRecognizer *)self->_rightTapRecognizer setAllowedPressTypes:&off_1013ADED8];
  [(UITapGestureRecognizer *)self->_rightTapRecognizer requireGestureRecognizerToFail:self->_rightLongPressRecognizer];
  v15 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleLongPress:"];
  upLongPressRecognizer = self->_upLongPressRecognizer;
  self->_upLongPressRecognizer = v15;

  [(UILongPressGestureRecognizer *)self->_upLongPressRecognizer setAllowedPressTypes:&off_1013ADEF0];
  id v17 = self->_upLongPressRecognizer;
  [(CarMapNudgerizer *)self panningMetrics];
  [(UILongPressGestureRecognizer *)v17 setMinimumPressDuration:v34];
  id v18 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  upTapRecognizer = self->_upTapRecognizer;
  self->_upTapRecognizer = v18;

  [(UITapGestureRecognizer *)self->_upTapRecognizer setAllowedPressTypes:&off_1013ADF08];
  [(UITapGestureRecognizer *)self->_upTapRecognizer requireGestureRecognizerToFail:self->_upLongPressRecognizer];
  id v20 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleLongPress:"];
  downLongPressRecognizer = self->_downLongPressRecognizer;
  self->_downLongPressRecognizer = v20;

  [(UILongPressGestureRecognizer *)self->_downLongPressRecognizer setAllowedPressTypes:&off_1013ADF20];
  id v22 = self->_downLongPressRecognizer;
  [(CarMapNudgerizer *)self panningMetrics];
  [(UILongPressGestureRecognizer *)v22 setMinimumPressDuration:v33];
  id v23 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  downTapRecognizer = self->_downTapRecognizer;
  self->_downTapRecognizer = v23;

  [(UITapGestureRecognizer *)self->_downTapRecognizer setAllowedPressTypes:&off_1013ADF38];
  [(UITapGestureRecognizer *)self->_downTapRecognizer requireGestureRecognizerToFail:self->_downLongPressRecognizer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [WeakRetained addGestureRecognizer:self->_leftTapRecognizer];

  id v26 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v26 addGestureRecognizer:self->_leftLongPressRecognizer];

  id v27 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v27 addGestureRecognizer:self->_rightTapRecognizer];

  id v28 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v28 addGestureRecognizer:self->_rightLongPressRecognizer];

  id v29 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v29 addGestureRecognizer:self->_upTapRecognizer];

  id v30 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v30 addGestureRecognizer:self->_upLongPressRecognizer];

  id v31 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v31 addGestureRecognizer:self->_downTapRecognizer];

  id v32 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [v32 addGestureRecognizer:self->_downLongPressRecognizer];
}

- (void)_removePanRecognizers
{
  p_gestureRecognizerView = &self->_gestureRecognizerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  [WeakRetained removeGestureRecognizer:self->_leftTapRecognizer];

  id v5 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v5 removeGestureRecognizer:self->_leftLongPressRecognizer];

  id v6 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v6 removeGestureRecognizer:self->_rightTapRecognizer];

  id v7 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v7 removeGestureRecognizer:self->_rightLongPressRecognizer];

  id v8 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v8 removeGestureRecognizer:self->_upTapRecognizer];

  id v9 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v9 removeGestureRecognizer:self->_upLongPressRecognizer];

  id v10 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v10 removeGestureRecognizer:self->_downTapRecognizer];

  id v11 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  [v11 removeGestureRecognizer:self->_downLongPressRecognizer];

  leftTapRecognizer = self->_leftTapRecognizer;
  self->_leftTapRecognizer = 0;

  leftLongPressRecognizer = self->_leftLongPressRecognizer;
  self->_leftLongPressRecognizer = 0;

  rightTapRecognizer = self->_rightTapRecognizer;
  self->_rightTapRecognizer = 0;

  rightLongPressRecognizer = self->_rightLongPressRecognizer;
  self->_rightLongPressRecognizer = 0;

  upTapRecognizer = self->_upTapRecognizer;
  self->_upTapRecognizer = 0;

  upLongPressRecognizer = self->_upLongPressRecognizer;
  self->_upLongPressRecognizer = 0;

  downTapRecognizer = self->_downTapRecognizer;
  self->_downTapRecognizer = 0;

  downLongPressRecognizer = self->_downLongPressRecognizer;
  self->_downLongPressRecognizer = 0;
}

- (void)_clearGesture:(id)a3
{
  id v4 = a3;
  id v3 = [v4 isEnabled];
  [v4 setEnabled:0];
  [v4 setEnabled:v3];
}

- (void)_clearGestureRecognizersInFlight
{
  [(CarMapNudgerizer *)self _clearGesture:self->_leftTapRecognizer];
  [(CarMapNudgerizer *)self _clearGesture:self->_leftLongPressRecognizer];
  [(CarMapNudgerizer *)self _clearGesture:self->_rightTapRecognizer];
  [(CarMapNudgerizer *)self _clearGesture:self->_rightLongPressRecognizer];
  [(CarMapNudgerizer *)self _clearGesture:self->_upTapRecognizer];
  [(CarMapNudgerizer *)self _clearGesture:self->_upLongPressRecognizer];
  [(CarMapNudgerizer *)self _clearGesture:self->_downTapRecognizer];
  downLongPressRecognizer = self->_downLongPressRecognizer;

  [(CarMapNudgerizer *)self _clearGesture:downLongPressRecognizer];
}

- (void)_clearGesturesAndAnimations
{
  [(CarMapNudgerizer *)self _clearGestureRecognizersInFlight];
  [(CarMapNudgerizer *)self _endImpulseUp];
  [(CarMapNudgerizer *)self _endImpulseDown];
  [(CarMapNudgerizer *)self _endImpulseLeft];
  [(CarMapNudgerizer *)self _endImpulseRight];

  [(CarMapNudgerizer *)self _endAnimating];
}

- (int64_t)_eventDirectionForButtonType:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)handleTap:(id)a3
{
  id v7 = a3;
  if ([v7 state] == (id)3)
  {
    id v4 = [v7 allowedPressTypes];
    id v5 = [v4 firstObject];
    int64_t v6 = -[CarMapNudgerizer _eventDirectionForButtonType:](self, "_eventDirectionForButtonType:", [v5 integerValue]);

    [(CarMapNudgerizer *)self momentaryImpulseInDirection:v6];
  }
}

- (void)handleLongPress:(id)a3
{
  id v7 = a3;
  id v4 = [v7 allowedPressTypes];
  id v5 = [v4 firstObject];
  int64_t v6 = -[CarMapNudgerizer _eventDirectionForButtonType:](self, "_eventDirectionForButtonType:", [v5 integerValue]);

  if ([v7 state] == (id)1)
  {
    [(CarMapNudgerizer *)self beginImpulseInDirection:v6];
  }
  else if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)4)
  {
    [(CarMapNudgerizer *)self endImpluseInDirection:v6];
  }
}

- (double)_userDefaultsDoubleForKey:(id)a3 defaultValue:(double)a4
{
  id v5 = a3;
  int64_t v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    [v8 doubleForKey:v5];
    a4 = v9;
  }
  return a4;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (CarMapNudgerizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarMapNudgerizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (CarImpulsePanningDynamicItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- ($29727DC6989B69F22950FCD998EA20D4)panningMetrics
{
  objc_copyStruct(retstr, &self->_panningMetrics, 56, 1, 0);
  return result;
}

- (void)setPanningMetrics:(id *)a3
{
}

- (int64_t)lastImpulseDirection
{
  return self->_lastImpulseDirection;
}

- (void)setLastImpulseDirection:(int64_t)a3
{
  self->_lastImpulseDirection = a3;
}

- (NSDate)lastImpulseDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastImpulseDate:(id)a3
{
}

- (unint64_t)impulseCount
{
  return self->_impulseCount;
}

- (void)setImpulseCount:(unint64_t)a3
{
  self->_impulseCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImpulseDate, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_gestureRecognizerView);
  objc_storeStrong((id *)&self->_downLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_downTapRecognizer, 0);
  objc_storeStrong((id *)&self->_upLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_upTapRecognizer, 0);
  objc_storeStrong((id *)&self->_rightLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_rightTapRecognizer, 0);
  objc_storeStrong((id *)&self->_leftLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftTapRecognizer, 0);
  objc_storeStrong((id *)&self->_downPush, 0);
  objc_storeStrong((id *)&self->_upPush, 0);
  objc_storeStrong((id *)&self->_rightPush, 0);
  objc_storeStrong((id *)&self->_leftPush, 0);
  objc_storeStrong((id *)&self->_panBehavior, 0);

  objc_storeStrong((id *)&self->_animator, 0);
}

@end