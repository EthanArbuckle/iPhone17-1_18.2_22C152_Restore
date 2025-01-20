@interface _UIEdgeFeedbackGenerator
+ (Class)_configurationClass;
- (BOOL)_isCloseToEdge;
- (BOOL)_isOvershot;
- (BOOL)_valueIsOvershot:(double)a3;
- (_UIEdgeFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4;
- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3;
- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4;
- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4;
- (_UIFeedbackContinuousPlayable)_playingContinuousFeedback;
- (double)_closeToEdgeUpdateTime;
- (double)_effectiveDistance;
- (double)_lastValueUpdateTime;
- (double)_previousValue;
- (double)_previousValueUpdateTime;
- (double)_value;
- (double)_velocity;
- (double)distance;
- (double)extentBeyondDistance;
- (float)_percentBeyondDistance;
- (id)_stats_key;
- (int64_t)_lastState;
- (int64_t)_state;
- (int64_t)axis;
- (void)_animationEnded;
- (void)_animationStarted;
- (void)_animationStartedUsingTimeout:(BOOL)a3;
- (void)_cancelStopAnimatingTimeout;
- (void)_deactivate;
- (void)_positionUpdated:(double)a3 withVelocity:(double)a4 atLocation:(CGPoint)a5;
- (void)_setCloseToEdge:(BOOL)a3;
- (void)_setCloseToEdgeUpdateTime:(double)a3;
- (void)_setLastState:(int64_t)a3;
- (void)_setLastValueUpdateTime:(double)a3;
- (void)_setPlayingContinuousFeedback:(id)a3;
- (void)_setPreviousValue:(double)a3;
- (void)_setPreviousValueUpdateTime:(double)a3;
- (void)_setState:(int64_t)a3;
- (void)_setValue:(double)a3;
- (void)_setVelocity:(double)a3;
- (void)_stopAnimatingWithTimeout:(double)a3;
- (void)_updateCloseToEdge;
- (void)positionUpdated:(double)a3;
- (void)positionUpdated:(double)a3 atLocation:(CGPoint)a4;
- (void)setAxis:(int64_t)a3;
- (void)setDistance:(double)a3;
- (void)setExtentBeyondDistance:(double)a3;
- (void)userInteractionCancelled;
- (void)userInteractionCancelledAtLocation:(CGPoint)a3;
- (void)userInteractionEnded;
- (void)userInteractionEndedAtLocation:(CGPoint)a3;
- (void)userInteractionStarted;
- (void)userInteractionStartedAtLocation:(CGPoint)a3;
@end

@implementation _UIEdgeFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIEdgeFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIEdgeFeedbackGenerator;
  v4 = [(UIFeedbackGenerator *)&v8 initWithConfiguration:a3 view:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(_UIEdgeFeedbackGenerator *)v4 _edgeConfiguration];
    -[_UIEdgeFeedbackGenerator setAxis:](v5, "setAxis:", [v6 _defaultAxis]);
  }
  return v5;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingContinuousFeedback, 0);
  objc_storeStrong((id *)&self->_feedbackEngine, 0);
}

- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3
{
  return [(_UIEdgeFeedbackGenerator *)self initWithStyle:a3 view:0];
}

- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  v6 = _viewFromCoordinateSpace(a4);
  v7 = [(_UIEdgeFeedbackGenerator *)self initWithStyle:a3 view:v6];

  return v7;
}

- (_UIEdgeFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "verticalScrollConfiguration");
      goto LABEL_7;
    case 1:
      uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "horizontalScrollConfiguration");
      goto LABEL_7;
    case 2:
      uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "sliderConfiguration");
      goto LABEL_7;
    case 3:
      uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "swipePresentationConfiguration");
LABEL_7:
      objc_super v8 = (void *)v7;
      break;
    default:
      objc_super v8 = 0;
      break;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIEdgeFeedbackGenerator;
  v9 = [(UIFeedbackGenerator *)&v11 initWithConfiguration:v8 view:v6];

  return v9;
}

- (void)_stopAnimatingWithTimeout:(double)a3
{
  [(_UIEdgeFeedbackGenerator *)self _cancelStopAnimatingTimeout];
  [(_UIEdgeFeedbackGenerator *)self performSelector:sel__animationEnded withObject:0 afterDelay:a3];
}

- (void)_cancelStopAnimatingTimeout
{
}

- (void)userInteractionStartedAtLocation:(CGPoint)a3
{
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    if ([(_UIEdgeFeedbackGenerator *)self _state] == 2
      || [(_UIEdgeFeedbackGenerator *)self _state] == 3)
    {
      [(_UIEdgeFeedbackGenerator *)self _cancelStopAnimatingTimeout];
      [(_UIEdgeFeedbackGenerator *)self _animationEnded];
    }
    [(_UIEdgeFeedbackGenerator *)self _setLastState:0];
    [(_UIEdgeFeedbackGenerator *)self _setValue:2.22507386e-308];
    [(_UIEdgeFeedbackGenerator *)self _setPreviousValue:2.22507386e-308];
    [(_UIEdgeFeedbackGenerator *)self _setLastValueUpdateTime:2.22507386e-308];
    [(_UIEdgeFeedbackGenerator *)self _setPreviousValueUpdateTime:2.22507386e-308];
    [(_UIEdgeFeedbackGenerator *)self _setState:1];
  }
}

- (void)userInteractionStarted
{
}

- (void)userInteractionEndedAtLocation:(CGPoint)a3
{
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
    if ([(_UIEdgeFeedbackGenerator *)self _state] == 1)
    {
      [(_UIEdgeFeedbackGenerator *)self _animationStartedUsingTimeout:1];
    }
  }
}

- (void)userInteractionEnded
{
}

- (void)userInteractionCancelledAtLocation:(CGPoint)a3
{
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
    if ([(_UIEdgeFeedbackGenerator *)self _state] == 1)
    {
      [(_UIEdgeFeedbackGenerator *)self _deactivate];
    }
  }
}

- (void)userInteractionCancelled
{
}

- (void)_deactivate
{
  [(_UIEdgeFeedbackGenerator *)self _cancelStopAnimatingTimeout];
  [(_UIEdgeFeedbackGenerator *)self _setState:0];
  [(_UIEdgeFeedbackGenerator *)self _setCloseToEdge:0];
}

- (void)_animationStarted
{
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    [(_UIEdgeFeedbackGenerator *)self _animationStartedUsingTimeout:0];
  }
}

- (void)_animationStartedUsingTimeout:(BOOL)a3
{
  if (a3)
  {
    [(_UIEdgeFeedbackGenerator *)self _setState:3];
    [(_UIEdgeFeedbackGenerator *)self _stopAnimatingWithTimeout:0.2];
  }
  else
  {
    [(_UIEdgeFeedbackGenerator *)self _setState:2];
  }
}

- (void)_animationEnded
{
  if ([(UIFeedbackGenerator *)self _isEnabled]
    && ([(_UIEdgeFeedbackGenerator *)self _state] == 2
     || [(_UIEdgeFeedbackGenerator *)self _state] == 3))
  {
    [(_UIEdgeFeedbackGenerator *)self _deactivate];
  }
}

- (void)_updateCloseToEdge
{
  if ([(_UIEdgeFeedbackGenerator *)self _isOvershot]) {
    goto LABEL_8;
  }
  [(_UIEdgeFeedbackGenerator *)self _effectiveDistance];
  double v4 = v3;
  if (v3 < 1.0)
  {
    v5 = self;
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  double value = self->_value;
  double v8 = value >= v4 - value ? v4 - value : self->_value;
  v9 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
  [v9 minDistanceFromEdge];
  double v11 = v10;

  if (v8 < v11)
  {
LABEL_8:
    v5 = self;
    uint64_t v6 = 1;
    goto LABEL_9;
  }
  if (self->_previousValue == 2.22507386e-308) {
    return;
  }
  double v12 = self->_value + self->_velocity * 0.3;
  double extentBeyondDistance = self->_extentBeyondDistance;
  double v14 = v4 + extentBeyondDistance;
  double v15 = -extentBeyondDistance;
  if (v12 <= v15) {
    double v12 = v15;
  }
  if (v14 <= v12) {
    double v12 = v14;
  }
  BOOL v16 = [(_UIEdgeFeedbackGenerator *)self _valueIsOvershot:v12];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v18 = v17;
  if (!v16 && self->_state == 1 && [(_UIEdgeFeedbackGenerator *)self _isCloseToEdge]) {
    BOOL v16 = v18 - self->_closeToEdgeUpdateTime < 1.0;
  }
  else {
    self->_closeToEdgeUpdateTime = v18;
  }
  v5 = self;
  uint64_t v6 = v16;
LABEL_9:
  [(_UIEdgeFeedbackGenerator *)v5 _setCloseToEdge:v6];
}

- (void)_setCloseToEdge:(BOOL)a3
{
  if (self->_closeToEdge != a3)
  {
    self->_closeToEdge = a3;
    if (a3) {
      [(UIFeedbackGenerator *)self activateWithCompletionBlock:0];
    }
    else {
      [(UIFeedbackGenerator *)self deactivate];
    }
  }
}

- (double)_effectiveDistance
{
  double distance = self->_distance;
  if (distance <= 0.0)
  {
    int64_t axis = self->_axis;
    if (axis == 1)
    {
      double v4 = [(UIFeedbackGenerator *)self view];
      [v4 bounds];
      double Width = CGRectGetWidth(v8);
      goto LABEL_6;
    }
    double distance = 0.0;
    if (axis == 2)
    {
      double v4 = [(UIFeedbackGenerator *)self view];
      [v4 bounds];
      double Width = CGRectGetHeight(v7);
LABEL_6:
      double distance = Width;
    }
  }
  return distance;
}

- (void)_setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    if (state == 1)
    {
      uint64_t v6 = [(_UIEdgeFeedbackGenerator *)self _playingContinuousFeedback];
      [v6 stop];

      [(_UIEdgeFeedbackGenerator *)self _setPlayingContinuousFeedback:0];
      CGRect v7 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
      CGRect v8 = [v7 userInteractingReleaseFeedback];

      if (self->_value != 2.22507386e-308
        && [(_UIEdgeFeedbackGenerator *)self _isOvershot]
        && !self->_playedOvershotThresholdFeedback
        && v8 != 0)
      {
        double v10 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
        double v11 = [v10 userInteractingReleaseFeedbackUpdateBlock];

        if (v11)
        {
          uint64_t v12 = [v8 copy];

          v13 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
          double v14 = [v13 userInteractingReleaseFeedbackUpdateBlock];
          [(_UIEdgeFeedbackGenerator *)self _percentBeyondDistance];
          v14[2](v14, v12, v15);

          CGRect v8 = (void *)v12;
        }
        -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v8, 1.79769313e308, 1.79769313e308);
      }
    }
    self->_int64_t state = a3;
    if (!a3) {
      self->_playedOvershotThresholdFeedback = 0;
    }
  }
}

- (BOOL)_valueIsOvershot:(double)a3
{
  if (self->_extentBeyondDistance <= 0.0)
  {
    if (fabs(a3) > 2.22044605e-16)
    {
      [(_UIEdgeFeedbackGenerator *)self _effectiveDistance];
      return vabdd_f64(a3, v6) <= 2.22044605e-16;
    }
  }
  else if (a3 >= 0.0)
  {
    [(_UIEdgeFeedbackGenerator *)self _effectiveDistance];
    return v4 < a3;
  }
  return 1;
}

- (BOOL)_isOvershot
{
  return [(_UIEdgeFeedbackGenerator *)self _valueIsOvershot:self->_value];
}

- (float)_percentBeyondDistance
{
  double value = self->_value;
  if (value >= 0.0)
  {
    [(_UIEdgeFeedbackGenerator *)self _effectiveDistance];
    double v4 = value - v5;
  }
  else
  {
    double v4 = -value;
  }
  return v4 / self->_extentBeyondDistance;
}

- (void)positionUpdated:(double)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    if (self->_state)
    {
      [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
      if (self->_value != a3)
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v10 = v9;
        double lastValueUpdateTime = self->_lastValueUpdateTime;
        if (lastValueUpdateTime == 2.22507386e-308)
        {
          double v14 = 0.0;
        }
        else
        {
          double previousValueUpdateTime = self->_previousValueUpdateTime;
          double value = self->_value;
          if (previousValueUpdateTime == 2.22507386e-308) {
            double v14 = (a3 - value) / (v10 - lastValueUpdateTime);
          }
          else {
            double v14 = (value - self->_previousValue) / (lastValueUpdateTime - previousValueUpdateTime);
          }
          -[_UIEdgeFeedbackGenerator _setPreviousValueUpdateTime:](self, "_setPreviousValueUpdateTime:");
        }
        [(_UIEdgeFeedbackGenerator *)self _setLastValueUpdateTime:v10];
        -[_UIEdgeFeedbackGenerator _positionUpdated:withVelocity:atLocation:](self, "_positionUpdated:withVelocity:atLocation:", a3, v14, x, y);
      }
    }
  }
}

- (void)positionUpdated:(double)a3
{
}

- (void)_positionUpdated:(double)a3 withVelocity:(double)a4 atLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  if (![(UIFeedbackGenerator *)self _isEnabled] || self->_value == a3 || !self->_state) {
    return;
  }
  BOOL v10 = [(_UIEdgeFeedbackGenerator *)self _isOvershot];
  double previousValue = self->_previousValue;
  double value = self->_value;
  if (previousValue == 2.22507386e-308 || value == 2.22507386e-308) {
    int v14 = 0;
  }
  else {
    int v14 = (value > previousValue) ^ (value < a3);
  }
  -[_UIEdgeFeedbackGenerator _setPreviousValue:](self, "_setPreviousValue:");
  [(_UIEdgeFeedbackGenerator *)self _setValue:a3];
  [(_UIEdgeFeedbackGenerator *)self _setVelocity:a4];
  [(_UIEdgeFeedbackGenerator *)self _updateCloseToEdge];
  BOOL v15 = [(_UIEdgeFeedbackGenerator *)self _isOvershot];
  BOOL v16 = v15;
  if (self->_previousValue == 2.22507386e-308) {
    BOOL v17 = v15;
  }
  else {
    BOOL v17 = v10;
  }
  int64_t state = self->_state;
  switch(state)
  {
    case 3:
      [(_UIEdgeFeedbackGenerator *)self _stopAnimatingWithTimeout:0.2];
LABEL_24:
      v29 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
      v30 = [v29 animatingThresholdFeedback];

      if (!v17 && v16 && !self->_playedOvershotThresholdFeedback && v30)
      {
        v31 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
        v32 = [v31 animatingThresholdFeedbackUpdateBlock];

        if (v32)
        {
          uint64_t v33 = [v30 copy];

          v34 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
          v35 = [v34 animatingThresholdFeedbackUpdateBlock];
          v35[2](v35, v33, a4);

          v30 = (void *)v33;
        }
        -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v30, x, y);
        self->_playedOvershotThresholdFeedback = 1;
      }
      if ((self->_lastState & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v36 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
        v37 = [v36 animatingMaximumExtentFeedback];

        if (v37) {
          int v38 = v14;
        }
        else {
          int v38 = 0;
        }
        if (v38 == 1)
        {
          v39 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
          v40 = [v39 animatingMaximumExtentFeedbackUpdateBlock];

          if (v40)
          {
            uint64_t v41 = [v37 copy];

            v42 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
            v43 = [v42 animatingMaximumExtentFeedbackUpdateBlock];
            v43[2](v43, v41, a4);

            v37 = (void *)v41;
          }
          -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v37, x, y);
        }
        v30 = v37;
      }
      goto LABEL_49;
    case 2:
      goto LABEL_24;
    case 1:
      if (v15
        && ([(_UIEdgeFeedbackGenerator *)self _edgeConfiguration],
            v19 = objc_claimAutoreleasedReturnValue(),
            [v19 userInteractingBeyondEdgeFeedbackUpdateBlock],
            v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v20))
      {
        v21 = [(_UIEdgeFeedbackGenerator *)self _playingContinuousFeedback];

        if (!v21)
        {
          v22 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
          v23 = [v22 userInteractingBeyondEdgeFeedback];
          [(_UIEdgeFeedbackGenerator *)self _setPlayingContinuousFeedback:v23];
        }
        v24 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
        v25 = [v24 userInteractingBeyondEdgeFeedbackUpdateBlock];
        v26 = [(_UIEdgeFeedbackGenerator *)self _playingContinuousFeedback];
        [(_UIEdgeFeedbackGenerator *)self _percentBeyondDistance];
        ((void (**)(void, void *, double))v25)[2](v25, v26, v27);

        if (!v21)
        {
          v28 = [(_UIEdgeFeedbackGenerator *)self _playingContinuousFeedback];
          -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v28, x, y);
        }
      }
      else
      {
        v44 = [(_UIEdgeFeedbackGenerator *)self _playingContinuousFeedback];
        [v44 stop];

        [(_UIEdgeFeedbackGenerator *)self _setPlayingContinuousFeedback:0];
      }
      v45 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
      v30 = [v45 userInteractingThresholdFeedback];

      if (v30)
      {
        if (v17 || !v16 || self->_playedOvershotThresholdFeedback)
        {
          if (v17 && !v16 && self->_playedOvershotThresholdFeedback) {
            self->_playedOvershotThresholdFeedback = 0;
          }
        }
        else
        {
          v46 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
          v47 = [v46 userInteractingThresholdFeedbackUpdateBlock];

          if (v47)
          {
            uint64_t v48 = [v30 copy];

            v49 = [(_UIEdgeFeedbackGenerator *)self _edgeConfiguration];
            v50 = [v49 userInteractingThresholdFeedbackUpdateBlock];
            v50[2](v50, v48, a4);

            v30 = (void *)v48;
          }
          -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v30, x, y);
          self->_playedOvershotThresholdFeedback = 1;
        }
      }
LABEL_49:

      int64_t state = self->_state;
      break;
  }
  [(_UIEdgeFeedbackGenerator *)self _setLastState:state];
}

- (id)_stats_key
{
  return @"edge";
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_double distance = a3;
}

- (int64_t)axis
{
  return self->_axis;
}

- (double)extentBeyondDistance
{
  return self->_extentBeyondDistance;
}

- (void)setExtentBeyondDistance:(double)a3
{
  self->_double extentBeyondDistance = a3;
}

- (BOOL)_isCloseToEdge
{
  return self->_closeToEdge;
}

- (double)_closeToEdgeUpdateTime
{
  return self->_closeToEdgeUpdateTime;
}

- (void)_setCloseToEdgeUpdateTime:(double)a3
{
  self->_closeToEdgeUpdateTime = a3;
}

- (double)_value
{
  return self->_value;
}

- (void)_setValue:(double)a3
{
  self->_double value = a3;
}

- (double)_previousValue
{
  return self->_previousValue;
}

- (void)_setPreviousValue:(double)a3
{
  self->_double previousValue = a3;
}

- (int64_t)_lastState
{
  return self->_lastState;
}

- (void)_setLastState:(int64_t)a3
{
  self->_lastState = a3;
}

- (double)_lastValueUpdateTime
{
  return self->_lastValueUpdateTime;
}

- (void)_setLastValueUpdateTime:(double)a3
{
  self->_double lastValueUpdateTime = a3;
}

- (double)_previousValueUpdateTime
{
  return self->_previousValueUpdateTime;
}

- (void)_setPreviousValueUpdateTime:(double)a3
{
  self->_double previousValueUpdateTime = a3;
}

- (double)_velocity
{
  return self->_velocity;
}

- (void)_setVelocity:(double)a3
{
  self->_velocitdouble y = a3;
}

- (_UIFeedbackContinuousPlayable)_playingContinuousFeedback
{
  return self->_playingContinuousFeedback;
}

- (void)_setPlayingContinuousFeedback:(id)a3
{
}

- (int64_t)_state
{
  return self->_state;
}

@end