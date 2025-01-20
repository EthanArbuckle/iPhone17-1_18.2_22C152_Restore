@interface SCRCGestureFactory
- ($59F5B3D3FC56264B602E56EF9D3D8816)captureCurrentState;
- ($59F5B3D3FC56264B602E56EF9D3D8816)handleGestureEvent:(SEL)a3;
- (BOOL)_handleSplitEvent:(id)a3;
- (BOOL)_handleSplitTap;
- (BOOL)splitFlickEnabled;
- (BOOL)tapIsDown;
- (BOOL)thumbRejectionEnabled;
- (BOOL)usesAbsoluteDistanceForPinch;
- (CGPoint)endLocation;
- (CGPoint)rawAverageLocation;
- (CGPoint)rawLocation;
- (CGPoint)splitTapPrimaryFingerPoint;
- (CGPoint)startLocation;
- (CGPoint)tapPoint;
- (CGPoint)tapPointWeightedToSides;
- (CGRect)_currentTapRect;
- (CGRect)mainFrame;
- (CGRect)multiTapFrame;
- (CGRect)tapFrame;
- (SCRCGestureFactory)initWithSize:(CGSize)a3 delegate:(id)a4;
- (SCRCGestureFactory)initWithSize:(CGSize)a3 delegate:(id)a4 threadKey:(id)a5;
- (double)directionalSlope;
- (double)distance;
- (double)firstFingerAltitude;
- (double)firstFingerAzimuth;
- (double)firstFingerPressure;
- (double)flickSpeed;
- (double)tapInterval;
- (double)tapSpeed;
- (double)vector;
- (double)velocity;
- (id)gestureStateString;
- (int64_t)direction;
- (int64_t)gestureState;
- (int64_t)orientation;
- (unint64_t)absoluteFingerCount;
- (unint64_t)fingerCount;
- (unint64_t)tapCount;
- (void)_down:(id)a3;
- (void)_drag:(id)a3;
- (void)_enterTrackingMode:(id)a3;
- (void)_handleGutterUp;
- (void)_handleTap;
- (void)_processUpAndPost:(BOOL)a3;
- (void)_resetSplit;
- (void)_up;
- (void)_updateMultiTapFrame;
- (void)_updateStartWithPoint:(CGPoint)a3 time:(double)a4;
- (void)_updateTapState;
- (void)dealloc;
- (void)reset;
- (void)setFlickSpeed:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSplitFlickEnabled:(BOOL)a3;
- (void)setTapSpeed:(double)a3;
- (void)setTapSpeedTimeThreshold:(double)a3 forRegion:(CGRect)a4 fingerCount:(int64_t)a5;
- (void)setThumbRejectionEnabled:(BOOL)a3;
- (void)setUsesAbsoluteDistanceForPinch:(BOOL)a3;
@end

@implementation SCRCGestureFactory

- (SCRCGestureFactory)initWithSize:(CGSize)a3 delegate:(id)a4
{
  return -[SCRCGestureFactory initWithSize:delegate:threadKey:](self, "initWithSize:delegate:threadKey:", a4, 0, a3.width, a3.height);
}

- (SCRCGestureFactory)initWithSize:(CGSize)a3 delegate:(id)a4 threadKey:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SCRCGestureFactory *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_mainFrame.origin.x = 0.0;
    v11->_mainFrame.origin.y = 0.0;
    v11->_mainFrame.size.double width = width;
    v11->_mainFrame.size.double height = height;
    *(_OWORD *)&v11->_flickVelocityThreshold = xmmword_21C0363E0;
    v11->_echoWaitTime = 0.35;
    v11->_potentialTrackingStartTimestamp = -3061152000.0;
    v11->_split.fingerDownTime = -3061152000.0;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.double width = width;
    v22.size.double height = height;
    v11->_gutterFrame = CGRectInset(v22, 7.5, 7.5);
    [(SCRCGestureFactory *)v12 setOrientation:0];
    double v13 = v12->_mainFrame.size.width;
    double v14 = v12->_mainFrame.size.height;
    if (v13 <= v14) {
      double v13 = v12->_mainFrame.size.height;
    }
    v12->_stallDistance = 10.0 / v13;
    v12->_maxDimension = v13;
    v12->_thumbRegion = v14 * 0.333333333;
    v15 = [[SCRCTargetSelectorTimer alloc] initWithTarget:v12 selector:sel__enterTrackingMode_ threadKey:v10];
    trackingTimer = v12->_trackingTimer;
    v12->_trackingTimer = v15;

    if (objc_opt_respondsToSelector()) {
      objc_storeWeak((id *)&v12->_trackDelegate, v9);
    }
    if (objc_opt_respondsToSelector())
    {
      objc_storeWeak((id *)&v12->_tapDelegate, v9);
      v17 = [[SCRCTargetSelectorTimer alloc] initWithTarget:v12 selector:sel__handleTap threadKey:v10];
      tapTimer = v12->_tapTimer;
      v12->_tapTimer = v17;
    }
    if (objc_opt_respondsToSelector()) {
      objc_storeWeak((id *)&v12->_didBeginSplitGestureDelegate, v9);
    }
    if (objc_opt_respondsToSelector())
    {
      objc_storeWeak((id *)&v12->_splitTapDelegate, v9);
      v19 = -[SCRCGestureFactory initWithSize:delegate:threadKey:]([SCRCGestureFactory alloc], "initWithSize:delegate:threadKey:", 0, v10, width, height);
      splitFactory = v12->_splitFactory;
      v12->_splitFactory = v19;

      if (objc_opt_respondsToSelector()) {
        objc_storeWeak((id *)&v12->_canSplitTapDelegate, v9);
      }
    }
  }

  return v12;
}

- (void)setFlickSpeed:(double)a3
{
  double v3 = 1.0;
  if (a3 <= 1.0) {
    double v3 = a3;
  }
  if (a3 >= -1.0) {
    double v4 = v3;
  }
  else {
    double v4 = -1.0;
  }
  self->_flickVelocityThreshold = v4 * 0.6 + 0.9;
}

- (double)flickSpeed
{
  return (self->_flickVelocityThreshold + -0.9) / 0.6;
}

- (void)setTapSpeed:(double)a3
{
  double v3 = 1.0;
  if (a3 <= 1.0) {
    double v3 = a3;
  }
  if (a3 >= -1.0) {
    double v4 = v3;
  }
  else {
    double v4 = -1.0;
  }
  double v5 = v4 * -0.15 + 0.35;
  self->_tapVelocityThreshold = v5;
  self->_echoWaitTime = v5;
}

- (void)setTapSpeedTimeThreshold:(double)a3 forRegion:(CGRect)a4 fingerCount:(int64_t)a5
{
  self->_tapSpeedRegion = a4;
  self->_tapSpeedFingerCount = a5;
  self->_tapVelocityThresholdForRegion = a3;
}

- (double)tapSpeed
{
  return (0.35 - self->_tapVelocityThreshold) / 0.15;
}

- (void)setOrientation:(int64_t)a3
{
  -[SCRCGestureFactory setOrientation:](self->_splitFactory, "setOrientation:");
  self->_orientation = a3;
  self->_directions[0] = 0;
  int64_t v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 2)
  {
    double v12 = 1.0;
    int64_t v11 = 6;
    int64_t v10 = 5;
    int64_t v9 = 4;
    int64_t v8 = 3;
    int64_t v7 = 2;
    double v13 = 1.0;
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = a3 + 1;
    int64_t v7 = qword_21C0364E0[v5];
    int64_t v8 = qword_21C0364F8[v5];
    int64_t v9 = qword_21C036510[v5];
    int64_t v10 = qword_21C036528[v5];
    int64_t v11 = qword_21C036540[v5];
    double v12 = dbl_21C036558[v5];
    double v13 = dbl_21C036570[v5];
  }
  self->_directions[1] = v6;
  self->_directions[2] = v7;
  self->_directions[3] = v8;
  self->_directions[4] = v9;
  self->_directions[5] = v10;
  self->_directions[6] = v11;
  self->_axisFlipper.horizontal = v12;
  self->_axisFlipper.vertical = v13;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)dealloc
{
  [(SCRCTargetSelectorTimer *)self->_trackingTimer invalidate];
  [(SCRCTargetSelectorTimer *)self->_tapTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCRCGestureFactory;
  [(SCRCGestureFactory *)&v3 dealloc];
}

- (CGRect)mainFrame
{
  double x = self->_mainFrame.origin.x;
  double y = self->_mainFrame.origin.y;
  double width = self->_mainFrame.size.width;
  double height = self->_mainFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_currentTapRect
{
  CGFloat v2 = self->_tap.locationPerTap[0].x + -5.0;
  double v3 = self->_tap.locationPerTap[0].y + -5.0;
  double v4 = 10.0;
  if (self->_tap.numFingersInCurrentGestureEvent < 2)
  {
    double v7 = 10.0;
  }
  else
  {
    p_double y = &self->_tap.locationPerTap[1].y;
    double v7 = 10.0;
    unint64_t v8 = 1;
    do
    {
      v10.origin.double x = *(p_y - 1) + -5.0;
      v10.origin.double y = *p_y + -5.0;
      v10.size.double width = 10.0;
      v10.size.double height = 10.0;
      *(CGRect *)&CGFloat v2 = CGRectUnion(*(CGRect *)&v2, v10);
      ++v8;
      p_y += 2;
    }
    while (v8 < self->_tap.numFingersInCurrentGestureEvent);
  }
  result.size.double height = v7;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)_updateMultiTapFrame
{
  p_tapMultiFrame = &self->_tapMultiFrame;
  if (self->_tap.dead)
  {
    p_frame = (CGRect *)MEMORY[0x263F001A8];
LABEL_5:
    CGSize size = p_frame->size;
    p_tapMultiFrame->origin = p_frame->origin;
    p_tapMultiFrame->CGSize size = size;
    return;
  }
  if (CGRectEqualToRect(self->_tapMultiFrame, *MEMORY[0x263F001A8]))
  {
    p_frame = &self->_tap.frame;
    goto LABEL_5;
  }
  self->_tapMultiFrame = CGRectUnion(self->_tapMultiFrame, self->_tap.frame);
}

- (void)_updateTapState
{
  p_tap = &self->_tap;
  if (self->_tap.dead)
  {
    CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->_tapMultiFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_tapMultiFrame.CGSize size = v4;
    *(_OWORD *)&p_tap->isFingerCurrentlyDown = 0u;
    *(_OWORD *)&self->_tap.totalNumFingersInGesture = 0u;
    self->_tap.frame.origin = 0u;
    self->_tap.frame.CGSize size = 0u;
    self->_tap.location[0] = 0u;
    self->_tap.location[1] = 0u;
    self->_tap.location[2] = 0u;
    self->_tap.location[3] = 0u;
    self->_tap.location[4] = 0u;
    self->_tap.location[5] = 0u;
    self->_tap.location[6] = 0u;
    self->_tap.location[7] = 0u;
    self->_tap.locationPerTap[0] = 0u;
    self->_tap.locationPerTap[1] = 0u;
    self->_tap.locationPerTap[2] = 0u;
    self->_tap.locationPerTap[3] = 0u;
    self->_tap.locationPerTap[4] = 0u;
    self->_tap.locationPerTap[5] = 0u;
    self->_tap.locationPerTap[6] = 0u;
    self->_tap.locationPerTap[7] = 0u;
    *(_OWORD *)&self->_tap.thisTime = 0u;
  }
  else
  {
    p_tap->isFingerCurrentlyDown = 0;
    if (self->_tap.numFingersInCurrentGestureEvent)
    {
      [(SCRCGestureFactory *)self _currentTapRect];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      if (CGRectIsEmpty(self->_tap.frame))
      {
        self->_tap.frame.origin.double x = v6;
        self->_tap.frame.origin.double y = v8;
        self->_tap.frame.size.double width = v10;
        self->_tap.frame.size.double height = v12;
      }
      else
      {
        v14.origin.double x = v6;
        v14.origin.double y = v8;
        v14.size.double width = v10;
        v14.size.double height = v12;
        if (CGRectIntersectsRect(self->_tap.frame, v14) || self->_tap.thisTime - self->_tap.lastTime <= 0.05)
        {
          v15.origin.double x = v6;
          v15.origin.double y = v8;
          v15.size.double width = v10;
          v15.size.double height = v12;
          self->_tap.frame = CGRectUnion(self->_tap.frame, v15);
        }
        else
        {
          p_tap->dead = 1;
        }
      }
      [(SCRCGestureFactory *)self _updateMultiTapFrame];
    }
  }
}

- (void)_handleTap
{
  p_tap = &self->_tap;
  if (!self->_tap.dead)
  {
    unint64_t totalNumFingersInGesture = self->_tap.totalNumFingersInGesture;
    if (totalNumFingersInGesture)
    {
      if (totalNumFingersInGesture != 1 || !self->_tap.gutterHasBeenTouched)
      {
        if (totalNumFingersInGesture != 1 || !p_tap->isFingerCurrentlyDown)
        {
          unint64_t count = self->_tap.count;
          if (totalNumFingersInGesture == 2 && count == 1)
          {
            if (self->_split.isTapping) {
              goto LABEL_2;
            }
            unint64_t count = 1;
          }
        }
        else
        {
          unint64_t count = self->_tap.count;
          if (count == 1) {
            goto LABEL_2;
          }
        }
        self->_state = 7;
        self->_fingerCount = totalNumFingersInGesture;
        self->_tapCount = count;
        CGFloat x = self->_tap.location[0].x;
        CGFloat v10 = 1.0;
        CGFloat y = self->_tap.location[0].y;
        if (totalNumFingersInGesture < 2)
        {
          CGFloat v13 = 1.0;
        }
        else
        {
          p_CGFloat y = &self->_tap.location[1].y;
          CGFloat v13 = 1.0;
          unint64_t v14 = 1;
          do
          {
            v17.origin.CGFloat x = *(p_y - 1);
            v17.origin.CGFloat y = *p_y;
            v17.size.double width = 1.0;
            v17.size.double height = 1.0;
            *(CGRect *)&CGFloat x = CGRectUnion(*(CGRect *)&x, v17);
            ++v14;
            p_y += 2;
          }
          while (v14 < self->_tap.totalNumFingersInGesture);
        }
        self->_tapFrame.origin.CGFloat x = x;
        self->_tapFrame.origin.CGFloat y = y;
        self->_tapFrame.size.double width = v10;
        self->_tapFrame.size.double height = v13;
        CGSize size = self->_tapFrame.size;
        self->_tap.frame.origin = self->_tapFrame.origin;
        self->_tap.frame.CGSize size = size;
        [(SCRCGestureFactory *)self _updateMultiTapFrame];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);
        [WeakRetained gestureTappingCallbackWithFactory:self];

        [(SCRCGestureFactory *)self _resetSplit];
        [(SCRCGestureFactory *)self reset];
      }
    }
  }
LABEL_2:
  p_tap->locationPerTap[7] = 0u;
  *(_OWORD *)&p_tap->thisTime = 0u;
  p_tap->locationPerTap[5] = 0u;
  p_tap->locationPerTap[6] = 0u;
  p_tap->locationPerTap[3] = 0u;
  p_tap->locationPerTap[4] = 0u;
  p_tap->locationPerTap[1] = 0u;
  p_tap->locationPerTap[2] = 0u;
  p_tap->location[7] = 0u;
  p_tap->locationPerTap[0] = 0u;
  p_tap->location[5] = 0u;
  p_tap->location[6] = 0u;
  p_tap->location[3] = 0u;
  p_tap->location[4] = 0u;
  p_tap->location[1] = 0u;
  p_tap->location[2] = 0u;
  p_tap->frame.CGSize size = 0u;
  p_tap->location[0] = 0u;
  *(_OWORD *)&p_tap->unint64_t totalNumFingersInGesture = 0u;
  p_tap->frame.origin = 0u;
  *(_OWORD *)&p_tap->isFingerCurrentlyDown = 0u;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_tapMultiFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_tapMultiFrame.CGSize size = v4;
}

- (void)_enterTrackingMode:(id)a3
{
  id v5 = a3;
  self->_tap.dead = 1;
  if ((self->_state | 2) == 3 || [v5 BOOLValue])
  {
    self->_state = 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trackDelegate);
    [WeakRetained gestureTrackingCallbackWithFactory:self];
  }
}

- (void)_handleGutterUp
{
}

- (void)_processUpAndPost:(BOOL)a3
{
  int64_t lastFingerCount = self->_lastFingerCount;
  self->_tap.numFingersInCurrentGestureEvent = 0;
  self->_potentialTrackingStartTimestamp = -3061152000.0;
  if (lastFingerCount)
  {
    BOOL v5 = a3;
    self->_tap.lastTime = self->_tap.thisTime;
    self->_int64_t lastFingerCount = 0;
    [(SCRCGestureFactory *)self _up];
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_gutterUpDelegate);
      [WeakRetained gestureGutterUpCallbackWithFactory:self];
    }
  }
  [(SCRCGestureFactory *)self _updateTapState];
  if (self->_inTapSpeedRegionForDownEvent
    && self->_tapVelocityThresholdForRegion == 0.0
    && self->_tapSpeedFingerCount >= lastFingerCount)
  {
    [(SCRCGestureFactory *)self _handleTap];
  }
  self->_inTapSpeedRegionForDownEvent = 0;
}

- (void)_updateStartWithPoint:(CGPoint)a3 time:(double)a4
{
  if (self->_finger[0].dragStalled) {
    self->_lastDownTime = a4;
  }
  if (self->_finger[0].distancePerSample.current >= self->_stallDistance || a4 - self->_lastDownTime <= 0.2)
  {
    BOOL v4 = 0;
  }
  else
  {
    self->_finger[0].distancePerSample.current = 0.0;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[49] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.sum = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[45] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[47] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[41] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[43] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[37] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[39] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[33] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[35] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[29] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[31] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[25] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[27] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[21] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[23] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[17] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[19] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[13] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[15] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[9] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[11] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[5] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[7] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[1] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[3] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.samples = 0u;
    self->_finger[0].normalizedVelocityPerSample.current = 0.0;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[49] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.sum = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[45] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[47] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[41] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[43] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[37] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[39] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[33] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[35] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[29] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[31] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[25] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[27] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[21] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[23] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[17] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[19] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[13] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[15] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[9] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[11] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[5] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[7] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[1] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[3] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.samples = 0u;
    self->_finger[0].lastDownPoint = a3;
    self->_finger[0].startTouchPoint = a3;
    self->_lastDownTime = a4;
    BOOL v4 = 1;
    self->_finger[0].distanceTraveledWithInertiaApplied = 0.0;
  }
  self->_finger[0].dragStalled = v4;
}

- (BOOL)_handleSplitTap
{
  p_isTapping = &self->_split.isTapping;
  if (self->_split.isTapping
    && self->_state <= 2
    && SCRCMathGetDistanceBetweenPoints(self->_split.startTapLocation.x, self->_split.startTapLocation.y, self->_split.lastTapLocation.x, self->_split.lastTapLocation.y)* self->_maxDimension < 5.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_splitTapDelegate);
    [WeakRetained gestureSplitTappingCallbackWithFactory:self];

    BOOL result = 1;
  }
  else
  {
    BOOL result = 0;
  }
  BOOL *p_isTapping = 0;
  CGPoint v6 = (CGPoint)*MEMORY[0x263F00148];
  self->_split.lastTapLocation = (CGPoint)*MEMORY[0x263F00148];
  self->_split.startTapLocation = v6;
  return result;
}

- (BOOL)_handleSplitEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fingerCount];
  if (v5)
  {
    unint64_t v6 = v5;
    p_dead = &self->_tap.dead;
    if (self->_split.isSplitting)
    {
      CGFloat v8 = [v4 fingerWithIdentifier:self->_split.fingerIdentifier];

      if (!v8)
      {
        *(_WORD *)&self->_split.BOOL isSplitting = 0;
        self->_split.fingerIdentifier = 0;
        self->_int64_t state = 1;
        [(SCRCGestureFactory *)self _resetSplit];
        [(SCRCGestureFactory *)self->_splitFactory reset];
        goto LABEL_69;
      }
      double v9 = [v4 fingerWithIdentifier:self->_split.fingerIdentifier];
      [v9 location];
      double v11 = v10;
      double v13 = v12;

      [v4 removeFingerWithIdentifier:self->_split.fingerIdentifier];
      [(SCRCGestureFactory *)self->_splitFactory handleGestureEvent:v4];
      int64_t v14 = [(SCRCGestureFactory *)self->_splitFactory gestureState];
      char v15 = 1;
      int64_t v16 = 14;
      switch(v14)
      {
        case 3:
          int64_t v16 = 20;
          break;
        case 4:
          break;
        case 5:
          int64_t v16 = 15;
          break;
        case 6:
          int64_t v16 = 16;
          break;
        case 8:
          int64_t v16 = 21;
          break;
        case 10:
          int64_t v16 = 17;
          break;
        case 11:
          int64_t v16 = 18;
          break;
        case 12:
          int64_t v16 = 19;
          break;
        default:
          char v15 = 0;
          int64_t v16 = 13;
          break;
      }
      self->_split.int64_t state = v16;
      if (v6 == 2)
      {
        if (self->_splitFlickEnabled)
        {
LABEL_68:
          self->_split.isTapping = 0;
          self->_split.primaryFingerLocation.CGFloat x = v11;
          self->_split.primaryFingerLocation.CGFloat y = v13;
          goto LABEL_69;
        }
        if (self->_split.isTapping) {
          char v15 = 1;
        }
        if ((v15 & 1) == 0)
        {
          self->_split.isTapping = 1;
          goto LABEL_76;
        }
      }
      else if (self->_splitFlickEnabled)
      {
        unint64_t v39 = 1;
        goto LABEL_67;
      }
      unint64_t v39 = 2;
LABEL_67:
      if (v6 <= v39)
      {
        if (v6 == 1)
        {
          if (self->_split.isTapping)
          {
            v40 = [v4 fingerWithoutIdentifier:self->_split.fingerIdentifier];
            [v40 location];
            self->_split.startTapLocation.CGFloat x = v41;
            self->_split.startTapLocation.CGFloat y = v42;
            self->_split.lastTapLocation = self->_split.startTapLocation;

            [(SCRCGestureFactory *)self _handleSplitTap];
          }
          else if (SCRCMathGetDistanceBetweenPoints(self->_split.primaryFingerLocation.x, self->_split.primaryFingerLocation.y, v11, v13)* self->_maxDimension > 5.0)
          {
            self->_split.primaryFingerLocation.CGFloat x = v11;
            self->_split.primaryFingerLocation.CGFloat y = v13;
            self->_split.BOOL isSplitting = 0;
            BOOL isSplitting = 1;
            *((_WORD *)p_dead + 181) = 0;
            goto LABEL_77;
          }
          goto LABEL_70;
        }
LABEL_74:
        if (v6 < 3) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      goto LABEL_68;
    }
    [v4 time];
    double v19 = v18;
    uint64_t v20 = [(SCRCGestureFactory *)self gestureState];
    if (!self->_split.isTapping && !self->_split.fingerIdentifier)
    {
      v21 = [v4 fingerAtIndex:0];
      self->_split.fingerIdentifier = [v21 identifier];
      if (self->_split.fingerDownTime == -3061152000.0)
      {
        self->_split.double fingerDownTime = v19;
        [v21 location];
        self->_split.primaryFingerLocation.CGFloat x = v22;
        self->_split.primaryFingerLocation.CGFloat y = v23;
      }
    }
    double fingerDownTime = self->_split.fingerDownTime;
    if (fingerDownTime == -3061152000.0) {
      double v25 = 0.0;
    }
    else {
      double v25 = v19 - fingerDownTime;
    }
    if (v6 == 1 && !self->_split.timedOut && !self->_split.didNotify && v25 > 0.15 && v20 <= 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_didBeginSplitGestureDelegate);
      [WeakRetained gestureFactoryDidBeginSplitGesture:self];

      self->_split.didNotifCGFloat y = 1;
    }
    unint64_t v28 = 1;
    if (!self->_splitFlickEnabled) {
      unint64_t v28 = 2;
    }
    if (v6 <= v28 || self->_split.timedOut)
    {
      if (v6 != 2 || self->_splitFlickEnabled)
      {
        if (!self->_split.isTapping) {
          goto LABEL_69;
        }
      }
      else if (!self->_split.isTapping)
      {
        if (self->_split.tapDead || v25 <= 0.15) {
          goto LABEL_76;
        }
        self->_split.isTapping = 1;
        v29 = [v4 fingerWithoutIdentifier:self->_split.fingerIdentifier];
        [v29 location];
        self->_split.startTapLocation.CGFloat x = v30;
        self->_split.startTapLocation.CGFloat y = v31;
        self->_split.lastTapLocation = self->_split.startTapLocation;
        goto LABEL_50;
      }
      v32 = [v4 fingerWithIdentifier:self->_split.fingerIdentifier];

      if (v32)
      {
        if (v6 == 1)
        {
          int64_t state = self->_state;
          [(SCRCGestureFactory *)self _handleSplitTap];
          [(SCRCGestureFactory *)self reset];
          BOOL *p_dead = 1;
          *(_DWORD *)&self->_fingerCount = 65537;
          if (state == 1)
          {
            self->_int64_t state = 2;
            self->_split.fastTrack = 1;
            self->_potentialTrackingStartTimestamp = -3061152000.0;
          }
          else
          {
            self->_int64_t state = 1;
          }
          goto LABEL_70;
        }
        if (v6 != 2)
        {
LABEL_75:
          self->_split.tapDead = 1;
          goto LABEL_76;
        }
        v29 = [v4 fingerWithoutIdentifier:self->_split.fingerIdentifier];
        [v29 location];
        self->_split.lastTapLocation.CGFloat x = v37;
        self->_split.lastTapLocation.CGFloat y = v38;
LABEL_50:

LABEL_76:
        BOOL isSplitting = self->_split.isSplitting;
        goto LABEL_77;
      }
      self->_int64_t lastFingerCount = 0;
      v34 = [v4 fingerAtIndex:0];
      self->_split.fingerIdentifier = [v34 identifier];

      self->_split.isTapping = 0;
      if (self->_state == 1) {
        double v35 = -3061152000.0;
      }
      else {
        double v35 = v19;
      }
      self->_split.fastTrack = self->_state == 1;
      self->_potentialTrackingStartTimestamp = v35;
      self->_int64_t state = 1;
    }
    else if (v25 <= 0.15)
    {
      self->_split.timedOut = 1;
    }
    else if (v20 <= 2)
    {
      [(SCRCGestureFactory *)self velocity];
      if (v36 < 0.15)
      {
        self->_split.tapDead = 1;
        *(_WORD *)&self->_split.BOOL isSplitting = 1;
        BOOL *p_dead = 1;
        [v4 removeFingerWithIdentifier:self->_split.fingerIdentifier];
      }
    }
LABEL_69:
    if (v6 == 1)
    {
LABEL_70:
      *(_WORD *)&self->_split.tapDead = 0;
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  [(SCRCGestureFactory *)self _resetSplit];
  [(SCRCGestureFactory *)self->_splitFactory reset];
  BOOL isSplitting = 0;
LABEL_77:

  return isSplitting;
}

- ($59F5B3D3FC56264B602E56EF9D3D8816)handleGestureEvent:(SEL)a3
{
  id v18 = a4;
  [v18 time];
  double v6 = v5;
  unint64_t v7 = [v18 fingerCount];
  self->_absoluteFingerCount = v7;
  if (self->_requireUp && v7 != 0)
  {
    [(SCRCGestureFactory *)self captureCurrentState];
    goto LABEL_17;
  }
  unint64_t v9 = v7;
  self->_split.fastTrack = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canSplitTapDelegate);
  double v11 = WeakRetained;
  if (self->_splitFactory
    && WeakRetained
    && ([WeakRetained shouldBlockSplitTapGestureWithFactory:self] & 1) == 0
    && [(SCRCGestureFactory *)self _handleSplitEvent:v18])
  {
    self->_split.active = 1;
    goto LABEL_16;
  }
  self->_split.active = 0;
  if (!v9 || [v18 isCancelEvent])
  {
    if ([v18 isCancelEvent]) {
      self->_tap.dead = 1;
    }
    [(SCRCGestureFactory *)self _processUpAndPost:0];
    self->_requireUp = 0;
    goto LABEL_16;
  }
  if (v9 <= 8 && (v9 > 1 || v6 - self->_potentialTrackingStartTimestamp > 0.25))
  {
    self->_tap.numFingersInCurrentGestureEvent = v9;
    double echoWaitTime = 0.0;
    if (!self->_split.fastTrack) {
      double echoWaitTime = self->_echoWaitTime;
    }
    self->_potentialTrackingStartTimestamp = -3061152000.0;
    unint64_t lastFingerCount = self->_lastFingerCount;
    if (v9 == lastFingerCount)
    {
      self->_fingerCount = v9;
      self->_unint64_t lastFingerCount = v9;
      if (v9 >= 2) {
        self->_potentialTrackingStartTimestamp = v6;
      }
      [(SCRCGestureFactory *)self _drag:v18];
      goto LABEL_16;
    }
    if (!self->_lastFingerCount || v9 >= lastFingerCount)
    {
      self->_fingerCount = v9;
      self->_unint64_t lastFingerCount = v9;
      [(SCRCGestureFactory *)self _down:v18];
      goto LABEL_16;
    }
    int64_t state = self->_state;
    if (state != 1)
    {
      if (state == 3) {
        goto LABEL_38;
      }
      if ((unint64_t)(state - 4) > 2) {
        goto LABEL_16;
      }
    }
    if (v9 == 1)
    {
      [(SCRCGestureFactory *)self _up];
      *(_DWORD *)&self->_fingerCount = 65537;
      self->_setTrackingTimer = 1;
      trackingTimer = self->_trackingTimer;
      CGRect v17 = [NSNumber numberWithBool:1];
      [(SCRCTargetSelectorTimer *)trackingTimer dispatchAfterDelay:v17 withObject:echoWaitTime];

      goto LABEL_16;
    }
    self->_requireUp = 1;
LABEL_38:
    self->_potentialTrackingStartTimestamp = v6;
    [(SCRCGestureFactory *)self _up];
    self->_unint64_t lastFingerCount = 0;
  }
LABEL_16:
  [(SCRCGestureFactory *)self captureCurrentState];

LABEL_17:

  return result;
}

- (void)_down:(id)a3
{
  p_tap = &self->_tap;
  id v62 = a3;
  finger = self->_finger;
  bzero(self->_finger, 0xEB0uLL);
  self->_tap.locationPerTap[7] = 0u;
  self->_tap.locationPerTap[6] = 0u;
  self->_tap.locationPerTap[5] = 0u;
  self->_tap.locationPerTap[4] = 0u;
  self->_tap.locationPerTap[3] = 0u;
  self->_tap.locationPerTap[2] = 0u;
  self->_tap.locationPerTap[1] = 0u;
  self->_tap.locationPerTap[0] = 0u;
  [v62 time];
  double v7 = v6;
  unint64_t v8 = 0;
  self->_tap.thisTime = v6;
  p_tap->dead = 0;
  char v9 = 1;
  while (1)
  {
    char v10 = v9;
    if (v8 >= self->_fingerCount) {
      break;
    }
    double v11 = [v62 fingerAtIndex:v8];
    double v12 = v11;
    if (v11)
    {
      double v13 = &finger[v8];
      [v11 location];
      double height = self->_mainFrame.size.height;
      CGFloat v16 = v15 * self->_mainFrame.size.width;
      [v12 location];
      CGFloat v18 = height - v17 * self->_mainFrame.size.height;
      v13->mostRecentTouchPoint.double x = v16;
      v13->mostRecentTouchPoint.double y = v18;
      CGPoint mostRecentTouchPoint = v13->mostRecentTouchPoint;
      v13->CGPoint lastDownPoint = mostRecentTouchPoint;
      v13->startTouchPoint = mostRecentTouchPoint;
      v13->identifier = [v12 identifier];
      v13->type = [v12 type];
      [v12 pressure];
      v13->pressure = v20;
      if ([v12 type] == 1) {
        [v12 altitude];
      }
      else {
        uint64_t v21 = 0x7FF8000000000000;
      }
      *(void *)&finger[v8].altitude = v21;
      if ([v12 type] == 1) {
        [v12 azimuth];
      }
      else {
        uint64_t v22 = 0x7FF8000000000000;
      }
      *(void *)&finger[v8].azimuth = v22;
      CGPoint lastDownPoint = v13->lastDownPoint;
      self->_tap.location[v8] = lastDownPoint;
      self->_tap.locationPerTap[v8] = lastDownPoint;
    }

    char v9 = 0;
    unint64_t v8 = 1;
    if ((v10 & 1) == 0)
    {
      unint64_t v8 = 2;
      break;
    }
  }
  if (v8 < self->_tap.numFingersInCurrentGestureEvent)
  {
    p_double y = &self->_tap.locationPerTap[v8].y;
    while (1)
    {
      double v25 = [v62 fingerAtIndex:v8];
      if (!v25) {
        break;
      }
      v26 = v25;
      [v25 location];
      double v27 = self->_mainFrame.size.height;
      double v29 = v28 * self->_mainFrame.size.width;
      [v26 location];
      double v31 = v27 - v30 * self->_mainFrame.size.height;
      *(p_y - 17) = v29;
      *(p_y - 16) = v31;
      [v26 location];
      double v32 = self->_mainFrame.size.height;
      double v34 = v33 * self->_mainFrame.size.width;
      [v26 location];
      CGFloat v36 = v32 - v35 * self->_mainFrame.size.height;
      *(p_y - 1) = v34;
      *p_double y = v36;

      ++v8;
      p_y += 2;
      if (v8 >= self->_tap.numFingersInCurrentGestureEvent) {
        goto LABEL_19;
      }
    }
    p_tap->dead = 1;
  }
LABEL_19:
  *(_OWORD *)&self->_int64_t state = xmmword_21C0363F0;
  self->_distance = 0.0;
  self->_scaledTrackingDistance = 0.0;
  self->_setTrackingTimer = 0;
  self->_double startDegrees = 0.0;
  self->_startDistance = 0.0;
  self->_lastDegrees = 0.0;
  if (!p_tap->isFingerCurrentlyDown)
  {
    unint64_t count = self->_tap.count;
    if (count <= 3) {
      self->_tap.unint64_t count = count + 1;
    }
    p_tap->isFingerCurrentlyDown = 1;
  }
  unint64_t numFingersInCurrentGestureEvent = self->_tap.numFingersInCurrentGestureEvent;
  if (numFingersInCurrentGestureEvent > self->_tap.totalNumFingersInGesture) {
    self->_tap.unint64_t totalNumFingersInGesture = numFingersInCurrentGestureEvent;
  }
  double tapVelocityThreshold = self->_tapVelocityThreshold;
  if (!CGRectEqualToRect(*MEMORY[0x263F001A8], self->_tapSpeedRegion))
  {
    if (self->_tap.numFingersInCurrentGestureEvent)
    {
      uint64_t v40 = 0;
      while (1)
      {
        CGFloat v41 = [v62 fingerAtIndex:v40];
        [v41 location];
        v64.double x = v42;
        v64.double y = v43;
        BOOL v44 = CGRectContainsPoint(self->_tapSpeedRegion, v64);

        if (!v44) {
          break;
        }
        if (++v40 >= self->_tap.numFingersInCurrentGestureEvent) {
          goto LABEL_30;
        }
      }
    }
    else
    {
LABEL_30:
      double tapVelocityThreshold = self->_tapVelocityThresholdForRegion;
      self->_inTapSpeedRegionForDownEvent = 1;
    }
  }
  if (tapVelocityThreshold > 0.0) {
    [(SCRCTargetSelectorTimer *)self->_tapTimer dispatchAfterDelay:tapVelocityThreshold];
  }
  if (self->_fingerCount != 1)
  {
    [(SCRCTargetSelectorTimer *)self->_trackingTimer cancel];
    self->_setTrackingTimer = 0;
    if (self->_fingerCount != 2) {
      goto LABEL_68;
    }
    double x = self->_finger[0].lastDownPoint.x;
    double y = self->_finger[0].lastDownPoint.y;
    double v52 = self->_finger[1].lastDownPoint.x;
    double v53 = self->_finger[1].lastDownPoint.y;
    double v54 = x - v52;
    double v55 = vabdd_f64(x, v52);
    double v56 = vabdd_f64(y, v53);
    self->_startDistance = hypot(v55, v56);
    if (v54 == 0.0) {
      double v57 = 90.0;
    }
    else {
      double v57 = atan(v56 / v55) * 57.2957795;
    }
    double v58 = y - v53;
    if (v54 >= 0.0)
    {
      if (v58 > 0.0) {
        goto LABEL_54;
      }
      double v57 = 90.0 - v57;
      double v59 = 270.0;
    }
    else if (v58 <= 0.0)
    {
      double v59 = 180.0;
    }
    else
    {
      double v59 = 90.0;
      double v57 = 90.0 - v57;
    }
    double v57 = v57 + v59;
LABEL_54:
    double startDegrees = self->_startDegrees;
    double v61 = v57 + floor(startDegrees / 360.0) * 360.0;
    self->_double startDegrees = v61;
    if (v57 > 270.0)
    {
      if (startDegrees <= 0.0 || startDegrees >= 180.0)
      {
        if (startDegrees <= 360.0 && startDegrees != 0.0) {
          goto LABEL_67;
        }
      }
      else
      {
        double v57 = v57 + -360.0;
      }
      goto LABEL_66;
    }
    if (v57 < 90.0)
    {
      if (startDegrees > 180.0 && startDegrees < 360.0)
      {
        double v57 = v61 + 360.0;
LABEL_66:
        self->_double startDegrees = v57;
        double v61 = v57;
        goto LABEL_67;
      }
      if (startDegrees <= 0.0) {
        goto LABEL_66;
      }
    }
LABEL_67:
    self->_lastDegrees = v61;
    goto LABEL_68;
  }
  double v45 = self->_finger[0].mostRecentTouchPoint.y;
  double thumbRegion = self->_thumbRegion;
  if (v45 < thumbRegion)
  {
    double v47 = 1.0 - v45 / thumbRegion;
    double v48 = 3.6;
    if (!self->_thumbRejectionEnabled) {
      double v48 = 0.0;
    }
    self->_scaledTrackingDistance = v47 * v48;
  }
  if (BYTE2(p_tap[1].count))
  {
    p_tap->dead = 1;
    double echoWaitTime = 0.0;
  }
  else
  {
    double echoWaitTime = self->_echoWaitTime;
  }
  if (!self->_thumbRejectionEnabled)
  {
    self->_setTrackingTimer = 1;
    [(SCRCTargetSelectorTimer *)self->_trackingTimer dispatchAfterDelay:echoWaitTime];
  }
LABEL_68:
  self->_lastTime = v7;
  self->_lastDownTime = v7;
}

- (void)_drag:(id)a3
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  p_dead = &self->_tap.dead;
  id v120 = a3;
  double v5 = [v120 fingerWithIdentifier:self->_finger[0].identifier];
  double v6 = v120;
  if (!v5)
  {
    if (![v120 fingerCount])
    {
      BOOL *p_dead = 1;
      goto LABEL_160;
    }
    double v5 = [v120 fingerAtIndex:0];
    double v6 = v120;
  }
  [v6 time];
  double v119 = v7;
  [v5 location];
  double v9 = v8;
  double width = self->_mainFrame.size.width;
  double height = self->_mainFrame.size.height;
  [v5 location];
  double v13 = v12;
  double v14 = self->_mainFrame.size.height;
  uint64_t v15 = [v5 type];
  [v5 pressure];
  double v17 = v16;
  if (v15 == 1)
  {
    [v5 altitude];
    uint64_t v19 = v18;
    [v5 azimuth];
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0x7FF8000000000000;
    uint64_t v21 = 0x7FF8000000000000;
  }
  char v22 = 0;
  uint64_t v23 = 0;
  finger = self->_finger;
  double v25 = v9 * width;
  double v26 = height - v13 * v14;
  long long v121 = 0u;
  long long v122 = 0u;
  double v117 = v26;
  double v118 = v25;
  while (1)
  {
    char v27 = v22;
    double v28 = &finger[v23];
    double v29 = v25 - v28->mostRecentTouchPoint.x;
    double v30 = v26 - v28->mostRecentTouchPoint.y;
    double v31 = fabs(hypot(v29, v30));
    SCRCMathUpdateAverage((uint64_t)&v28->distancePerSample, 0x32u, v31);
    SCRCMathUpdateAverage((uint64_t)&v28->deltaXPerSample, 0x32u, v29);
    SCRCMathUpdateAverage((uint64_t)&v28->deltaYPerSample, 0x32u, v30);
    double v32 = v119 - self->_lastTime;
    if (v32 == 0.0) {
      double v33 = 0.0;
    }
    else {
      double v33 = v31 / self->_maxDimension / v32;
    }
    p_double x = &v28->mostRecentTouchPoint.x;
    double v35 = &finger[v23];
    SCRCMathUpdateAverage((uint64_t)&v35->normalizedVelocityPerSample, 0x32u, v33);
    v35->distanceTraveledWithInertiaApplied = v35->distancePerSample.average + v35->distanceTraveledWithInertiaApplied;
    v36.f64[0] = v35->deltaXPerSample.average;
    v37.f64[0] = 0.0;
    v37.f64[1] = v35->deltaYPerSample.average;
    int8x16_t v38 = (int8x16_t)vcgtq_f64(v37, v36);
    *(int8x16_t *)&v35->xDirection = vorrq_s8(vandq_s8(v38, (int8x16_t)xmmword_21C036410), vandq_s8(vbicq_s8((int8x16_t)vcgtq_f64(v36, v37), v38), (int8x16_t)xmmword_21C036400));
    *p_double x = v25;
    p_x[1] = v26;
    v35->pressure = v17;
    *(void *)&v35->altitude = v19;
    *(void *)&v35->azimuth = v21;
    unint64_t v39 = (double *)(&v121 + v23);
    *unint64_t v39 = v25;
    v39[1] = v26;
    uint64_t v40 = [v120 fingerWithIdentifier:v35[1].identifier];

    double v5 = (void *)v40;
    if (v40) {
      goto LABEL_14;
    }
    if ((unint64_t)[v120 fingerCount] < 2) {
      break;
    }
    double v5 = [v120 fingerAtIndex:1];
LABEL_14:
    objc_msgSend(v5, "location", *(void *)&v117);
    double v42 = v41;
    double v43 = self->_mainFrame.size.width;
    double v44 = self->_mainFrame.size.height;
    [v5 location];
    double v46 = v45;
    double v47 = self->_mainFrame.size.height;
    uint64_t v48 = [v5 type];
    [v5 pressure];
    double v17 = v49;
    if (v48 == 1)
    {
      [v5 altitude];
      uint64_t v19 = v50;
      [v5 azimuth];
      uint64_t v21 = v51;
    }
    else
    {
      uint64_t v21 = 0x7FF8000000000000;
      uint64_t v19 = 0x7FF8000000000000;
    }
    double v25 = v42 * v43;
    double v26 = v44 - v46 * v47;
    char v22 = 1;
    uint64_t v23 = 1;
    if (v27) {
      goto LABEL_20;
    }
  }
  double v5 = 0;
LABEL_20:
  unsigned int fingerCount = self->_fingerCount;
  if (fingerCount == 2)
  {
    double v61 = *((double *)&v121 + 1);
    double v62 = *((double *)&v122 + 1);
    double v63 = *(double *)&v121 - *(double *)&v122;
    double v64 = vabdd_f64(*(double *)&v121, *(double *)&v122);
    double v65 = vabdd_f64(*((double *)&v121 + 1), *((double *)&v122 + 1));
    double v66 = hypot(v64, v65);
    if (v63 == 0.0) {
      double v67 = 90.0;
    }
    else {
      double v67 = atan(v65 / v64) * 57.2957795;
    }
    double v76 = v61 - v62;
    if (v63 >= 0.0)
    {
      if (v76 > 0.0) {
        goto LABEL_85;
      }
      double v67 = 90.0 - v67;
      double v77 = 270.0;
    }
    else if (v76 <= 0.0)
    {
      double v77 = 180.0;
    }
    else
    {
      double v77 = 90.0;
      double v67 = 90.0 - v67;
    }
    double v67 = v67 + v77;
LABEL_85:
    double lastDegrees = self->_lastDegrees;
    double v95 = v67 + floor(lastDegrees / 360.0) * 360.0;
    self->_double lastDegrees = v95;
    if (v67 <= 270.0)
    {
      if (v67 >= 90.0) {
        goto LABEL_104;
      }
      if (lastDegrees <= 180.0 || lastDegrees >= 360.0)
      {
        if (lastDegrees > 0.0) {
          goto LABEL_104;
        }
      }
      else
      {
        double v67 = v95 + 360.0;
      }
    }
    else if (lastDegrees <= 0.0 || lastDegrees >= 180.0)
    {
      if (lastDegrees <= 360.0 && lastDegrees != 0.0) {
        goto LABEL_104;
      }
    }
    else
    {
      double v67 = v67 + -360.0;
    }
    self->_double lastDegrees = v67;
    double v95 = v67;
LABEL_104:
    double v97 = self->_startDegrees - v95;
    double x = self->_finger[0].lastDownPoint.x;
    double y = self->_finger[0].lastDownPoint.y;
    double v98 = self->_finger[0].mostRecentTouchPoint.x - x;
    double v99 = self->_finger[0].mostRecentTouchPoint.y - y;
    double v100 = 0.0;
    if (v99 == 0.0) {
      double v101 = 0.0;
    }
    else {
      double v101 = v98 / v99;
    }
    double v102 = self->_finger[1].mostRecentTouchPoint.x - self->_finger[1].lastDownPoint.x;
    double v103 = self->_finger[1].mostRecentTouchPoint.y - self->_finger[1].lastDownPoint.y;
    double v104 = v103 / v102;
    if (v102 == 0.0) {
      double v104 = 0.0;
    }
    if (v103 != 0.0) {
      double v100 = v102 / v103;
    }
    int64_t state = self->_state;
    if (state == 4)
    {
      BOOL v69 = 0;
    }
    else
    {
      if (state == 6)
      {
        int64_t direction = self->_direction;
        if (direction == 6)
        {
          BOOL v69 = 0;
          goto LABEL_152;
        }
        if (direction != 5) {
          goto LABEL_121;
        }
        BOOL v69 = 0;
LABEL_130:
        double v70 = v118 - x;
LABEL_131:
        double v110 = v70 / self->_maxDimension;
        double horizontal = self->_axisFlipper.horizontal;
LABEL_153:
        double v107 = v110 * horizontal;
        goto LABEL_154;
      }
      double v106 = v66 - self->_startDistance;
      if (state == 5)
      {
        BOOL v69 = 0;
LABEL_115:
        double v107 = v106 / self->_maxDimension;
LABEL_154:
        self->_distance = v107;
        goto LABEL_155;
      }
      double v109 = v99 / v98;
      if (v98 == 0.0) {
        double v109 = 0.0;
      }
      if (fabs(v109) < 1.2
        && fabs(v98) > 8.0
        && fabs(v104) < 1.2
        && fabs(v102) > 8.0
        && *(void *)&v98 >> 63 == *(void *)&v102 >> 63)
      {
LABEL_129:
        BOOL v69 = 0;
        *(_OWORD *)&self->_int64_t state = xmmword_21C036420;
        goto LABEL_130;
      }
      if (fabs(v101) < 0.8
        && fabs(v99) > 4.0
        && fabs(v100) < 0.8
        && fabs(v103) > 4.0
        && *(void *)&v99 >> 63 == *(void *)&v103 >> 63)
      {
LABEL_137:
        BOOL v69 = 0;
        *(int64x2_t *)&self->_int64_t state = vdupq_n_s64(6uLL);
        goto LABEL_152;
      }
      double v112 = fabs(v106);
      BOOL v113 = [(SCRCGestureFactory *)self usesAbsoluteDistanceForPinch];
      double v114 = fabs(v66);
      if (v113) {
        double v115 = 7.8;
      }
      else {
        double v115 = v114 / 2.75;
      }
      BOOL v90 = v112 <= v115;
      double v116 = fabs(v97);
      if (!v90 && v116 < 750.0 / (v114 + 25.0) + 4.0)
      {
        BOOL v69 = 0;
        self->_int64_t state = 5;
        goto LABEL_115;
      }
      if (v66 <= 17.0 || v116 <= 650.0 / v114 + 4.0)
      {
        BOOL v69 = v112 > 7.8 || v116 > 12.0;
        goto LABEL_155;
      }
      BOOL v69 = 0;
      self->_int64_t state = 4;
    }
    double v107 = v97 / 360.0;
    goto LABEL_154;
  }
  if (fingerCount != 1)
  {
    if (fingerCount < 3) {
      goto LABEL_121;
    }
    if (self->_state == 6)
    {
      int64_t v68 = self->_direction;
      if (v68 != 6)
      {
        if (v68 != 5) {
          goto LABEL_121;
        }
        BOOL v69 = 0;
        double v70 = v118 - self->_finger[0].lastDownPoint.x;
        goto LABEL_131;
      }
      BOOL v69 = 0;
      double y = self->_finger[0].lastDownPoint.y;
LABEL_152:
      double v110 = (v117 - y) / self->_maxDimension;
      double horizontal = self->_axisFlipper.vertical;
      goto LABEL_153;
    }
    double x = self->_finger[0].lastDownPoint.x;
    double y = self->_finger[0].lastDownPoint.y;
    double v80 = self->_finger[0].mostRecentTouchPoint.x - x;
    double v81 = self->_finger[0].mostRecentTouchPoint.y - y;
    double v82 = v81 / v80;
    if (v80 == 0.0) {
      double v82 = 0.0;
    }
    double v83 = fabs(v82);
    if (v81 == 0.0) {
      double v84 = 0.0;
    }
    else {
      double v84 = v80 / v81;
    }
    double v85 = self->_finger[1].mostRecentTouchPoint.x - self->_finger[1].lastDownPoint.x;
    double v86 = self->_finger[1].mostRecentTouchPoint.y - self->_finger[1].lastDownPoint.y;
    double v87 = v85 / v86;
    if (v86 == 0.0) {
      double v87 = 0.0;
    }
    if (v83 >= 1.2) {
      goto LABEL_75;
    }
    double v88 = v86 / v85;
    if (v85 == 0.0) {
      double v88 = 0.0;
    }
    if (fabs(v80) <= 8.0
      || ((double v89 = fabs(v85), fabs(v88) < 1.2) ? (v90 = v89 <= 8.0) : (v90 = 1),
          !v90 ? (BOOL v91 = *(void *)&v80 >> 63 == *(void *)&v85 >> 63) : (BOOL v91 = 0),
          !v91))
    {
LABEL_75:
      if (fabs(v84) >= 0.8) {
        goto LABEL_121;
      }
      BOOL v69 = 0;
      if (fabs(v81) <= 4.0) {
        goto LABEL_155;
      }
      double v92 = fabs(v86);
      if (fabs(v87) >= 0.8 || v92 <= 4.0) {
        goto LABEL_155;
      }
      if (*(void *)&v81 >> 63 != *(void *)&v86 >> 63) {
        goto LABEL_121;
      }
      goto LABEL_137;
    }
    goto LABEL_129;
  }
  -[SCRCGestureFactory _updateStartWithPoint:time:](self, "_updateStartWithPoint:time:", v118, v117, v119);
  int64_t v53 = self->_state;
  if (v53 != 2 && self->_finger[0].normalizedVelocityPerSample.average > self->_flickVelocityThreshold)
  {
    int64_t v53 = 3;
    self->_int64_t state = 3;
  }
  double maxDimension = self->_maxDimension;
  self->_distance = self->_finger[0].distancePerSample.average / maxDimension;
  double v55 = self->_finger[0].lastDownPoint.x;
  double v56 = self->_finger[0].lastDownPoint.y;
  double v57 = self->_finger[0].mostRecentTouchPoint.x - v55;
  double v58 = self->_finger[0].mostRecentTouchPoint.y - v56;
  if (v57 == 0.0) {
    double v59 = 0.0;
  }
  else {
    double v59 = v58 / v57;
  }
  double v60 = hypot(self->_finger[0].mostRecentTouchPoint.x - v55, self->_finger[0].mostRecentTouchPoint.y - v56);
  if (!self->_setTrackingTimer)
  {
    if (v53 != 3)
    {
      if (v53 == 2) {
        goto LABEL_48;
      }
      if (v53 != 1) {
        goto LABEL_121;
      }
    }
    double echoWaitTime = 0.0;
    if (!p_dead[361])
    {
      double v72 = fabs(v60);
      double scaledTrackingDistance = self->_scaledTrackingDistance;
      if ((v72 <= scaledTrackingDistance || self->_finger[0].normalizedVelocityPerSample.average <= 0.2)
        && v72 <= scaledTrackingDistance + scaledTrackingDistance)
      {
LABEL_121:
        BOOL v69 = 0;
        goto LABEL_155;
      }
      double echoWaitTime = self->_echoWaitTime;
    }
    self->_setTrackingTimer = 1;
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_trackingTimer, "dispatchAfterDelay:", echoWaitTime, *(void *)&v117);
    goto LABEL_121;
  }
  if (v53 != 2) {
    goto LABEL_121;
  }
LABEL_48:
  if (fabs(v57) > 8.0 && fabs(v59) < 1.2)
  {
    BOOL v69 = 0;
    self->_int64_t direction = 5;
    double v74 = (v118 - v55) / maxDimension;
    double vertical = self->_axisFlipper.horizontal;
    goto LABEL_101;
  }
  BOOL v69 = 0;
  double v96 = v57 / v58;
  if (v58 == 0.0) {
    double v96 = 0.0;
  }
  if (fabs(v58) > 8.0 && fabs(v96) < 0.8)
  {
    BOOL v69 = 0;
    self->_int64_t direction = 6;
    double v74 = (v117 - v56) / maxDimension;
    double vertical = self->_axisFlipper.vertical;
LABEL_101:
    self->_distance = vertical * v74;
    self->_finger[0].CGPoint lastDownPoint = self->_finger[0].mostRecentTouchPoint;
  }
LABEL_155:
  if (!*p_dead && (v69 || (self->_state | 2) != 3))
  {
    p_dead[362] = self->_fingerCount != 1;
    BOOL *p_dead = 1;
  }
  self->_lastTime = v119;

LABEL_160:
}

- (void)_up
{
  if (self->_fingerCount)
  {
    if (self->_fingerCount == 1)
    {
      self->_int64_t direction = 0;
      int64_t state = self->_state;
      if (state == 1)
      {
        [(SCRCTargetSelectorTimer *)self->_trackingTimer cancel];
        self->_setTrackingTimer = 0;
        goto LABEL_19;
      }
      if (state != 3)
      {
        if (state != 2) {
          return;
        }
LABEL_19:
        self->_int64_t state = 0;
        return;
      }
      [(SCRCTargetSelectorTimer *)self->_trackingTimer cancel];
      self->_setTrackingTimer = 0;
      self->_int64_t state = 0;
      double x = self->_finger[0].mostRecentTouchPoint.x;
      double v7 = self->_finger[0].lastDownPoint.x;
      double v8 = self->_finger[0].mostRecentTouchPoint.y - self->_finger[0].lastDownPoint.y;
      double v9 = v8 / (x - v7);
      if (x - v7 == 0.0) {
        double v9 = 0.0;
      }
      double v10 = fabs(v9);
      double v11 = (x - v7) / v8;
      if (v8 == 0.0) {
        double v11 = 0.0;
      }
      if (v10 < 1.2 && vabdd_f64(x, v7) > 3.6)
      {
        self->_tap.dead = 1;
        int64_t xDirection = self->_finger[0].xDirection;
LABEL_27:
        self->_int64_t state = 8;
        self->_int64_t direction = xDirection;
        self->_directionalSlope = v10;
        return;
      }
      double v10 = fabs(v11);
      if (v10 < 0.8 && fabs(v8) > 3.6)
      {
        self->_tap.dead = 1;
        int64_t xDirection = self->_finger[0].yDirection;
        goto LABEL_27;
      }
    }
    else
    {
      int64_t v4 = self->_state;
      switch(v4)
      {
        case 6:
          int64_t v5 = 12;
          break;
        case 5:
          int64_t v5 = 11;
          break;
        case 4:
          int64_t v5 = 10;
          break;
        default:
          return;
      }
      self->_int64_t state = v5;
    }
  }
}

- (void)reset
{
  [(SCRCGestureFactory *)self->_splitFactory reset];
  *(_DWORD *)&self->_unsigned int fingerCount = 0;
  self->_requireUp = 0;
  self->_int64_t state = 0;
  self->_int64_t direction = 0;
  self->_potentialTrackingStartTimestamp = -3061152000.0;
  tapTimer = self->_tapTimer;
  [(SCRCTargetSelectorTimer *)tapTimer cancel];
}

- (void)_resetSplit
{
  *(_WORD *)&self->_split.tapDead = 0;
  self->_split.double fingerDownTime = -3061152000.0;
  self->_split.fingerIdentifier = 0;
  self->_split.BOOL isSplitting = 0;
  self->_split.didNotifdouble y = 0;
}

- ($59F5B3D3FC56264B602E56EF9D3D8816)captureCurrentState
{
  *(_OWORD *)&retstr->var19.double y = 0u;
  *(_OWORD *)&retstr->var20.double y = 0u;
  p_CGPoint mostRecentTouchPoint = &self->_finger[0].mostRecentTouchPoint;
  *(_OWORD *)&retstr->var18.origin.double y = 0u;
  *(_OWORD *)&retstr->var18.size.double height = 0u;
  *(_OWORD *)&retstr->var17.origin.double y = 0u;
  *(_OWORD *)&retstr->var17.size.double height = 0u;
  *(_OWORD *)&retstr->var15.double y = 0u;
  *(_OWORD *)&retstr->var16.double y = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var14.double y = 0u;
  retstr->var10 = 0u;
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  CGPoint v77 = (CGPoint)0;
  memset(v76, 0, 24);
  CGPoint v75 = (CGPoint)0;
  if (!self->_split.active)
  {
    retstr->var0 = self->_state;
    double average = 0.0;
    double distance = 0.0;
    goto LABEL_8;
  }
  splitFactordouble y = self->_splitFactory;
  if (!splitFactory)
  {
    int64_t v7 = 0;
    retstr->var0 = self->_split.state;
    double v8 = 0.0;
    double average = 0.0;
    double distance = 0.0;
LABEL_11:
    char v22 = 0;
    retstr->var1 = v7;
    retstr->var2 = self->_directionalSlope;
    retstr->var3 = v8;
    goto LABEL_29;
  }
  [(SCRCGestureFactory *)splitFactory captureCurrentState];
  int64_t v7 = v67;
  double v8 = v68;
  double average = v69;
  CGPoint v77 = v71;
  double distance = v70;
  *((void *)&v76[0] + 1) = v72;
  *(void *)&v76[1] = v73;
  CGPoint v75 = v74;
  int v11 = BYTE5(p_mostRecentTouchPoint[153].x);
  uint64_t v12 = 4712;
  if (!BYTE5(p_mostRecentTouchPoint[153].x)) {
    uint64_t v12 = 336;
  }
  retstr->var0 = *(int64_t *)((char *)&self->super.isa + v12);
  if (v11) {
    goto LABEL_11;
  }
LABEL_8:
  retstr->var1 = self->_directions[self->_direction];
  retstr->var2 = self->_directionalSlope;
  [(SCRCGestureFactory *)self startLocation];
  double v14 = v13;
  double v16 = v15;
  [(SCRCGestureFactory *)self endLocation];
  double v18 = 1.0 - v14 + v17 + -1.0;
  double v20 = v16 - v19;
  if (v18 == 0.0) {
    double v21 = 90.0;
  }
  else {
    double v21 = atan(fabs(v20 / v18)) * 57.2957795;
  }
  if (v18 < 0.0)
  {
    if (v20 <= 0.0)
    {
      double v23 = 180.0;
    }
    else
    {
      double v23 = 90.0;
      double v21 = 90.0 - v21;
    }
    goto LABEL_19;
  }
  if (v20 <= 0.0)
  {
    double v21 = 90.0 - v21;
    double v23 = 270.0;
LABEL_19:
    double v21 = v21 + v23;
  }
  if (v21 >= 90.0 && v21 <= 270.0) {
    double v21 = v21 + 0.0;
  }
  retstr->var3 = v21;
  if (BYTE5(p_mostRecentTouchPoint[153].x))
  {
    char v22 = 0;
  }
  else
  {
    double average = self->_finger[0].normalizedVelocityPerSample.average;
    double distance = self->_distance;
    char v22 = 1;
  }
LABEL_29:
  retstr->var4 = average;
  retstr->var5 = distance;
  unint64_t fingerCount = self->_fingerCount;
  retstr->var6 = self->_absoluteFingerCount;
  retstr->var7 = fingerCount;
  retstr->var8 = self->_tapCount;
  retstr->var9 = LOBYTE(p_mostRecentTouchPoint[130].y);
  if ((v22 & 1) == 0)
  {
    retstr->var10 = v77;
    *(CGPoint *)&retstr->var11 = p_mostRecentTouchPoint[2];
    retstr->var13 = self->_finger[0].azimuth;
    retstr->var14 = v77;
    retstr->var15 = *(CGPoint *)((char *)v76 + 8);
LABEL_44:
    retstr->var16 = v75;
    goto LABEL_47;
  }
  double width = self->_mainFrame.size.width;
  double height = self->_mainFrame.size.height;
  CGFloat v28 = (height - self->_finger[0].mostRecentTouchPoint.y) / height;
  retstr->var10.double x = self->_finger[0].mostRecentTouchPoint.x / width;
  retstr->var10.double y = v28;
  *(CGPoint *)&retstr->var11 = p_mostRecentTouchPoint[2];
  retstr->var13 = self->_finger[0].azimuth;
  float64x2_t v29 = *(float64x2_t *)MEMORY[0x263F00148];
  uint64_t v30 = 2;
  if (fingerCount < 2) {
    uint64_t v30 = fingerCount;
  }
  if (v30)
  {
    double v31 = (float64x2_t *)p_mostRecentTouchPoint;
    do
    {
      float64x2_t v29 = vaddq_f64(v29, *v31);
      double v31 = (float64x2_t *)((char *)v31 + 1880);
      --v30;
    }
    while (v30);
  }
  if (!fingerCount)
  {
    retstr->var14.double x = v29.f64[0] / width;
    retstr->var14.double y = (height - v29.f64[1]) / height;
    goto LABEL_46;
  }
  retstr->var14.double x = v29.f64[0] / (double)fingerCount / width;
  retstr->var14.double y = (height - v29.f64[1] / (double)fingerCount) / height;
  if (fingerCount != 2)
  {
LABEL_46:
    CGFloat v39 = (height - self->_finger[0].startTouchPoint.y) / height;
    retstr->var15.double x = self->_finger[0].startTouchPoint.x / width;
    retstr->var15.double y = v39;
    goto LABEL_47;
  }
  int64_t v32 = self->_directions[self->_direction];
  double x = self->_finger[0].startTouchPoint.x;
  v78.origin.double y = self->_finger[0].startTouchPoint.y;
  v88.origin.double x = self->_finger[1].startTouchPoint.x;
  v88.origin.double y = self->_finger[1].startTouchPoint.y;
  v78.size.double width = 1.0;
  v78.size.double height = 1.0;
  v88.size.double width = 1.0;
  v88.size.double height = 1.0;
  v78.origin.double x = x;
  CGRect v79 = CGRectUnion(v78, v88);
  if (v32 == 5) {
    double x = v79.origin.x + v79.origin.x / (width - v79.size.width) * v79.size.width;
  }
  int64_t v34 = self->_directions[self->_direction];
  double v35 = self->_mainFrame.size.height;
  v80.origin.double x = self->_finger[0].startTouchPoint.x;
  double y = self->_finger[0].startTouchPoint.y;
  v89.origin.double x = self->_finger[1].startTouchPoint.x;
  v89.origin.double y = self->_finger[1].startTouchPoint.y;
  double v37 = x / self->_mainFrame.size.width;
  v80.size.double width = 1.0;
  v80.size.double height = 1.0;
  v89.size.double width = 1.0;
  v89.size.double height = 1.0;
  v80.origin.double y = y;
  CGRect v81 = CGRectUnion(v80, v89);
  if (v34 == 6) {
    double y = v81.origin.y + v81.origin.y / (v35 - v81.size.height) * v81.size.height;
  }
  CGFloat v38 = (v35 - y) / self->_mainFrame.size.height;
  retstr->var15.double x = v37;
  retstr->var15.double y = v38;
  if (BYTE5(p_mostRecentTouchPoint[153].x)) {
    goto LABEL_44;
  }
LABEL_47:
  if (self->_fingerCount == 2)
  {
    int64_t v40 = self->_directions[self->_direction];
    double v41 = self->_finger[0].mostRecentTouchPoint.x;
    v82.origin.double y = self->_finger[0].mostRecentTouchPoint.y;
    v90.origin.double x = self->_finger[1].mostRecentTouchPoint.x;
    v90.origin.double y = self->_finger[1].mostRecentTouchPoint.y;
    double v42 = self->_mainFrame.size.width;
    v82.size.double width = 1.0;
    v82.size.double height = 1.0;
    v90.size.double width = 1.0;
    v90.size.double height = 1.0;
    v82.origin.double x = v41;
    CGRect v83 = CGRectUnion(v82, v90);
    if (v40 == 5) {
      double v41 = v83.origin.x + v83.origin.x / (v42 - v83.size.width) * v83.size.width;
    }
    int64_t v43 = self->_directions[self->_direction];
    double v44 = self->_mainFrame.size.height;
    v84.origin.double x = self->_finger[0].mostRecentTouchPoint.x;
    double v45 = self->_finger[0].mostRecentTouchPoint.y;
    v91.origin.double x = self->_finger[1].mostRecentTouchPoint.x;
    v91.origin.double y = self->_finger[1].mostRecentTouchPoint.y;
    double v46 = v41 / self->_mainFrame.size.width;
    v84.size.double width = 1.0;
    v84.size.double height = 1.0;
    v91.size.double width = 1.0;
    v91.size.double height = 1.0;
    v84.origin.double y = v45;
    CGRect v85 = CGRectUnion(v84, v91);
    if (v43 == 6) {
      double v45 = v85.origin.y + v85.origin.y / (v44 - v85.size.height) * v85.size.height;
    }
    double v48 = self->_mainFrame.size.width;
    double v47 = self->_mainFrame.size.height;
    retstr->var16.double x = v46;
    retstr->var16.double y = (v44 - v45) / v47;
  }
  else
  {
    double v48 = self->_mainFrame.size.width;
    double v47 = self->_mainFrame.size.height;
    CGFloat v49 = (v47 - self->_finger[0].mostRecentTouchPoint.y) / v47;
    retstr->var16.double x = self->_finger[0].mostRecentTouchPoint.x / v48;
    retstr->var16.double y = v49;
  }
  double v50 = self->_tapFrame.size.height;
  CGFloat v51 = (v47 - (self->_tapFrame.origin.y + v50)) / v47;
  CGFloat v52 = self->_tapFrame.size.width / v48;
  retstr->var17.origin.double x = self->_tapFrame.origin.x / v48;
  retstr->var17.origin.double y = v51;
  retstr->var17.size.double width = v52;
  retstr->var17.size.double height = v50 / v47;
  CGFloat v53 = self->_tapMultiFrame.origin.x / v48;
  double v54 = self->_tapMultiFrame.size.height;
  CGFloat v55 = (v47 - (self->_tapMultiFrame.origin.y + v54)) / v47;
  CGFloat v56 = self->_tapMultiFrame.size.width / v48;
  retstr->var18.origin.double x = v53;
  retstr->var18.origin.double y = v55;
  retstr->var18.size.double width = v56;
  retstr->var18.size.double height = v54 / v47;
  [(SCRCGestureFactory *)self tapFrame];
  CGFloat v57 = v86.origin.x;
  CGFloat v58 = v86.origin.y;
  CGFloat v59 = v86.size.width;
  CGFloat v60 = v86.size.height;
  CGFloat MidX = CGRectGetMidX(v86);
  v87.origin.double x = v57;
  v87.origin.double y = v58;
  v87.size.double width = v59;
  v87.size.double height = v60;
  CGFloat MidY = CGRectGetMidY(v87);
  retstr->var19.double x = MidX;
  retstr->var19.double y = MidY;
  double v64 = self->_mainFrame.size.height;
  double v65 = self->_tapFrame.origin.y;
  double v66 = self->_tapFrame.size.height;
  retstr->var20.double x = (self->_tapFrame.origin.x
                   + self->_tapFrame.origin.x
                   / (self->_mainFrame.size.width - self->_tapFrame.size.width)
                   * self->_tapFrame.size.width)
                  / self->_mainFrame.size.width;
  retstr->var20.double y = (v64 - (v65 + v65 / (v64 - v66) * v66)) / v64;
  retstr->var21 = self->_tap.thisTime - self->_tap.lastTime;
  return result;
}

- (double)directionalSlope
{
  return self->_directionalSlope;
}

- (int64_t)gestureState
{
  uint64_t v2 = 4712;
  if (!self->_split.active) {
    uint64_t v2 = 336;
  }
  return *(int64_t *)((char *)&self->super.isa + v2);
}

- (int64_t)direction
{
  if (self->_split.active) {
    return [(SCRCGestureFactory *)self->_splitFactory direction];
  }
  else {
    return self->_directions[self->_direction];
  }
}

- (double)vector
{
  if (self->_split.active)
  {
    splitFactordouble y = self->_splitFactory;
    [(SCRCGestureFactory *)splitFactory vector];
    return result;
  }
  [(SCRCGestureFactory *)self startLocation];
  double v6 = v5;
  double v8 = v7;
  [(SCRCGestureFactory *)self endLocation];
  double v10 = 1.0 - v6 + v9 + -1.0;
  double v12 = v8 - v11;
  if (v10 == 0.0) {
    double result = 90.0;
  }
  else {
    double result = atan(fabs(v12 / v10)) * 57.2957795;
  }
  if (v10 >= 0.0)
  {
    if (v12 > 0.0) {
      goto LABEL_15;
    }
    double result = 90.0 - result;
    double v13 = 270.0;
  }
  else if (v12 <= 0.0)
  {
    double v13 = 180.0;
  }
  else
  {
    double v13 = 90.0;
    double result = 90.0 - result;
  }
  double result = result + v13;
LABEL_15:
  if (result >= 90.0 && result <= 270.0) {
    return result + 0.0;
  }
  return result;
}

- (double)velocity
{
  if (!self->_split.active) {
    return self->_finger[0].normalizedVelocityPerSample.average;
  }
  [(SCRCGestureFactory *)self->_splitFactory velocity];
  return result;
}

- (double)distance
{
  if (!self->_split.active) {
    return self->_distance;
  }
  [(SCRCGestureFactory *)self->_splitFactory distance];
  return result;
}

- (unint64_t)absoluteFingerCount
{
  return self->_absoluteFingerCount;
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (BOOL)tapIsDown
{
  return self->_tap.isFingerCurrentlyDown;
}

- (CGPoint)rawLocation
{
  if (self->_split.active)
  {
    [(SCRCGestureFactory *)self->_splitFactory rawLocation];
  }
  else
  {
    double v2 = self->_finger[0].mostRecentTouchPoint.x / self->_mainFrame.size.width;
    double v3 = (self->_mainFrame.size.height - self->_finger[0].mostRecentTouchPoint.y) / self->_mainFrame.size.height;
  }
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)firstFingerPressure
{
  return self->_finger[0].pressure;
}

- (double)firstFingerAltitude
{
  return self->_finger[0].altitude;
}

- (double)firstFingerAzimuth
{
  return self->_finger[0].azimuth;
}

- (CGPoint)rawAverageLocation
{
  p_CGPoint mostRecentTouchPoint = &self->_finger[0].mostRecentTouchPoint;
  if (self->_split.active)
  {
    [(SCRCGestureFactory *)self->_splitFactory rawLocation];
  }
  else
  {
    float64x2_t v5 = *(float64x2_t *)MEMORY[0x263F00148];
    unsigned int fingerCount = self->_fingerCount;
    if (fingerCount >= 2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = self->_fingerCount;
    }
    if (v7)
    {
      do
      {
        float64x2_t v5 = vaddq_f64(v5, *(float64x2_t *)p_mostRecentTouchPoint);
        p_CGPoint mostRecentTouchPoint = (CGPoint *)((char *)p_mostRecentTouchPoint + 1880);
        --v7;
      }
      while (v7);
    }
    if (self->_fingerCount) {
      float64x2_t v5 = vdivq_f64(v5, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)fingerCount), 0));
    }
    double v3 = v5.f64[0] / self->_mainFrame.size.width;
    double v4 = (self->_mainFrame.size.height - v5.f64[1]) / self->_mainFrame.size.height;
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)startLocation
{
  if (self->_split.active)
  {
    splitFactordouble y = self->_splitFactory;
    [(SCRCGestureFactory *)splitFactory startLocation];
  }
  else
  {
    if (self->_fingerCount == 2)
    {
      int64_t v6 = self->_directions[self->_direction];
      double x = self->_finger[0].startTouchPoint.x;
      v15.origin.double y = self->_finger[0].startTouchPoint.y;
      v19.origin.double x = self->_finger[1].startTouchPoint.x;
      v19.origin.double y = self->_finger[1].startTouchPoint.y;
      double width = self->_mainFrame.size.width;
      v15.size.double width = 1.0;
      v15.size.double height = 1.0;
      v19.size.double width = 1.0;
      v19.size.double height = 1.0;
      v15.origin.double x = x;
      CGRect v16 = CGRectUnion(v15, v19);
      if (v6 == 5) {
        double x = v16.origin.x + v16.origin.x / (width - v16.size.width) * v16.size.width;
      }
      int64_t v9 = self->_directions[self->_direction];
      double height = self->_mainFrame.size.height;
      v17.origin.double x = self->_finger[0].startTouchPoint.x;
      double y = self->_finger[0].startTouchPoint.y;
      v20.origin.double x = self->_finger[1].startTouchPoint.x;
      v20.origin.double y = self->_finger[1].startTouchPoint.y;
      double v12 = x / self->_mainFrame.size.width;
      v17.size.double width = 1.0;
      v17.size.double height = 1.0;
      v20.size.double width = 1.0;
      v20.size.double height = 1.0;
      v17.origin.double y = y;
      CGRect v18 = CGRectUnion(v17, v20);
      if (v9 == 6) {
        double y = v18.origin.y + v18.origin.y / (height - v18.size.height) * v18.size.height;
      }
      double v5 = (height - y) / self->_mainFrame.size.height;
    }
    else
    {
      double v12 = self->_finger[0].startTouchPoint.x / self->_mainFrame.size.width;
      double v5 = (self->_mainFrame.size.height - self->_finger[0].startTouchPoint.y) / self->_mainFrame.size.height;
    }
    double v4 = v12;
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)endLocation
{
  if (self->_split.active)
  {
    splitFactordouble y = self->_splitFactory;
    [(SCRCGestureFactory *)splitFactory endLocation];
  }
  else
  {
    if (self->_fingerCount == 2)
    {
      int64_t v6 = self->_directions[self->_direction];
      double x = self->_finger[0].mostRecentTouchPoint.x;
      v15.origin.double y = self->_finger[0].mostRecentTouchPoint.y;
      v19.origin.double x = self->_finger[1].mostRecentTouchPoint.x;
      v19.origin.double y = self->_finger[1].mostRecentTouchPoint.y;
      double width = self->_mainFrame.size.width;
      v15.size.double width = 1.0;
      v15.size.double height = 1.0;
      v19.size.double width = 1.0;
      v19.size.double height = 1.0;
      v15.origin.double x = x;
      CGRect v16 = CGRectUnion(v15, v19);
      if (v6 == 5) {
        double x = v16.origin.x + v16.origin.x / (width - v16.size.width) * v16.size.width;
      }
      int64_t v9 = self->_directions[self->_direction];
      double height = self->_mainFrame.size.height;
      v17.origin.double x = self->_finger[0].mostRecentTouchPoint.x;
      double y = self->_finger[0].mostRecentTouchPoint.y;
      v20.origin.double x = self->_finger[1].mostRecentTouchPoint.x;
      v20.origin.double y = self->_finger[1].mostRecentTouchPoint.y;
      double v12 = x / self->_mainFrame.size.width;
      v17.size.double width = 1.0;
      v17.size.double height = 1.0;
      v20.size.double width = 1.0;
      v20.size.double height = 1.0;
      v17.origin.double y = y;
      CGRect v18 = CGRectUnion(v17, v20);
      if (v9 == 6) {
        double y = v18.origin.y + v18.origin.y / (height - v18.size.height) * v18.size.height;
      }
      double v5 = (height - y) / self->_mainFrame.size.height;
    }
    else
    {
      double v12 = self->_finger[0].mostRecentTouchPoint.x / self->_mainFrame.size.width;
      double v5 = (self->_mainFrame.size.height - self->_finger[0].mostRecentTouchPoint.y) / self->_mainFrame.size.height;
    }
    double v4 = v12;
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGRect)tapFrame
{
  double width = self->_mainFrame.size.width;
  double height = self->_mainFrame.size.height;
  double v4 = self->_tapFrame.origin.x / width;
  double v5 = self->_tapFrame.size.height;
  double v6 = (height - (self->_tapFrame.origin.y + v5)) / height;
  double v7 = self->_tapFrame.size.width / width;
  double v8 = v5 / height;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

- (CGRect)multiTapFrame
{
  double width = self->_mainFrame.size.width;
  double height = self->_mainFrame.size.height;
  double v4 = self->_tapMultiFrame.origin.x / width;
  double v5 = self->_tapMultiFrame.size.height;
  double v6 = (height - (self->_tapMultiFrame.origin.y + v5)) / height;
  double v7 = self->_tapMultiFrame.size.width / width;
  double v8 = v5 / height;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

- (CGPoint)tapPoint
{
  [(SCRCGestureFactory *)self tapFrame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)tapPointWeightedToSides
{
  double v2 = (self->_tapFrame.origin.x
      + self->_tapFrame.origin.x
      / (self->_mainFrame.size.width - self->_tapFrame.size.width)
      * self->_tapFrame.size.width)
     / self->_mainFrame.size.width;
  double v3 = (self->_mainFrame.size.height
      - (self->_tapFrame.origin.y
       + self->_tapFrame.origin.y
       / (self->_mainFrame.size.height - self->_tapFrame.size.height)
       * self->_tapFrame.size.height))
     / self->_mainFrame.size.height;
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (double)tapInterval
{
  return self->_tap.thisTime - self->_tap.lastTime;
}

- (id)gestureStateString
{
  return 0;
}

- (CGPoint)splitTapPrimaryFingerPoint
{
  double x = self->_split.primaryFingerLocation.x;
  double y = self->_split.primaryFingerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)thumbRejectionEnabled
{
  return self->_thumbRejectionEnabled;
}

- (void)setThumbRejectionEnabled:(BOOL)a3
{
  self->_thumbRejectionEnabled = a3;
}

- (BOOL)splitFlickEnabled
{
  return self->_splitFlickEnabled;
}

- (void)setSplitFlickEnabled:(BOOL)a3
{
  self->_splitFlickEnabled = a3;
}

- (BOOL)usesAbsoluteDistanceForPinch
{
  return self->_usesAbsoluteDistanceForPinch;
}

- (void)setUsesAbsoluteDistanceForPinch:(BOOL)a3
{
  self->_usesAbsoluteDistanceForPinch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitFactory, 0);
  objc_storeStrong((id *)&self->_gutterUpTimer, 0);
  objc_storeStrong((id *)&self->_tapTimer, 0);
  objc_storeStrong((id *)&self->_trackingTimer, 0);
  objc_destroyWeak((id *)&self->_didBeginSplitGestureDelegate);
  objc_destroyWeak((id *)&self->_canSplitTapDelegate);
  objc_destroyWeak((id *)&self->_splitTapDelegate);
  objc_destroyWeak((id *)&self->_gutterUpDelegate);
  objc_destroyWeak((id *)&self->_tapDelegate);
  objc_destroyWeak((id *)&self->_trackDelegate);
}

@end