@interface _UILongPressClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
+ (BOOL)requiresForceCapability;
- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)allowsFeedback;
- (BOOL)cancelsTouchesInView;
- (BOOL)clicksUpAutomaticallyAfterTimeout;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)hasExceededAllowableMovement;
- (BOOL)reachedClickDownThreshold;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (NSString)description;
- (UIView)view;
- (_UIClickInteractionDriverDelegate)delegate;
- (_UILongPressClickInteractionDriver)init;
- (_UITouchDurationObservingGestureRecognizer)gestureRecognizer;
- (double)allowableMovement;
- (double)clickDownDuration;
- (double)clickTimeoutDuration;
- (double)forceMultiplier;
- (double)maximumEffectProgress;
- (double)touchDuration;
- (unint64_t)behavior;
- (unint64_t)inputPrecision;
- (void)_asyncGestureBegan;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleGestureRecognizer:(id)a3;
- (void)_notifyDelegateOfUpdatedClickDownProgress:(double)a3 forceAdjustedClickDownDuration:(double)a4;
- (void)_updateForActiveGestureRecognizer;
- (void)_updateTimeoutDebugUI:(double)a3;
- (void)cancelInteraction;
- (void)setAllowableMovement:(double)a3;
- (void)setBehavior:(unint64_t)a3;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setClickDownDuration:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setForceMultiplier:(double)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setReachedClickDownThreshold:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation _UILongPressClickInteractionDriver

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_gestureRecognizerFailed:(id)a3
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];

  if (v8 != v6) {
    goto LABEL_2;
  }
  v10 = [v7 name];
  v11 = [v6 name];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    v13 = [v6 view];
    v14 = [v7 view];
    if (v13 == v14) {
      char v9 = 1;
    }
    else {
      char v9 = [v13 isDescendantOfView:v14];
    }

    goto LABEL_10;
  }
  if (self->_delegateImplements.shouldDelayGesture)
  {
    v13 = [(_UILongPressClickInteractionDriver *)self delegate];
    char v9 = [v13 clickDriver:self shouldDelayGestureRecognizer:v7];
LABEL_10:

    goto LABEL_11;
  }
LABEL_2:
  char v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];

  if (v8 != v7)
  {
LABEL_2:
    char v9 = 0;
    goto LABEL_3;
  }
  char v11 = [v6 _isGestureType:2];
  char v9 = 1;
  if (([v6 _isGestureType:4] & 1) == 0 && (v11 & 1) == 0)
  {
    if (self->_delegateImplements.shouldBeDelayedByGesture)
    {
      int v12 = [(_UILongPressClickInteractionDriver *)self delegate];
      char v9 = [v12 clickDriver:self shouldBeDelayedByGestureRecognizer:v6];

      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v9;
}

- (_UITouchDurationObservingGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (_UIClickInteractionDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickInteractionDriverDelegate *)WeakRetained;
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
    id v7 = [v6 view];
    [v7 removeGestureRecognizer:v6];

    id v8 = objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      self->_currentState = 1;
      id v9 = objc_loadWeakRetained((id *)&self->_view);
      [v9 addGestureRecognizer:v6];
    }
    v5 = obj;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateImplements.didUpdateHighlightProgress = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldDelayGesture = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldBeDelayedByGesture = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setAllowableMovement:(double)a3
{
  id v4 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  [v4 setAllowableMovement:a3];
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (_UILongPressClickInteractionDriver)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UILongPressClickInteractionDriver;
  v2 = [(_UILongPressClickInteractionDriver *)&v7 init];
  if (v2)
  {
    v3 = [[_UITouchDurationObservingGestureRecognizer alloc] initWithTarget:v2 action:sel__handleGestureRecognizer_];
    [(UIGestureRecognizer *)v3 setAllowedTouchTypes:&unk_1ED3EF740];
    [(UIGestureRecognizer *)v3 setName:@"com.apple.UIKit.longPressClickDriverPrimary"];
    int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_LongPressClickInteractionDriverClickMinimumTouchDuration, @"LongPressClickInteractionDriverClickMinimumTouchDuration");
    double v5 = *(double *)&qword_1EB256F90;
    if (v4) {
      double v5 = 0.15;
    }
    [(_UITouchDurationObservingGestureRecognizer *)v3 setMinimumDurationRequired:v5];
    [(UIGestureRecognizer *)v3 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v3 setDelegate:v2];
    [(_UILongPressClickInteractionDriver *)v2 setGestureRecognizer:v3];
    [(_UILongPressClickInteractionDriver *)v2 setCancelsTouchesInView:1];
  }
  return v2;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  unint64_t behavior = self->_behavior;
  if (behavior == 2)
  {
    LOBYTE(v10) = [v7 _originatesFromPointerEvent];
  }
  else if (behavior == 1)
  {
    int v10 = [v7 _originatesFromPointerEvent] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

- (double)allowableMovement
{
  v2 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  [v2 allowableMovement];
  double v4 = v3;

  return v4;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 0;
}

- (NSString)description
{
  unint64_t v3 = [(_UILongPressClickInteractionDriver *)self behavior];
  if (v3 > 2) {
    double v4 = 0;
  }
  else {
    double v4 = off_1E52E8410[v3];
  }
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; unint64_t behavior = %@>",
                       objc_opt_class(),
                       self,
                       v4);
}

+ (BOOL)requiresForceCapability
{
  return 0;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 1;
}

- (double)maximumEffectProgress
{
  [(_UILongPressClickInteractionDriver *)self clickTimeoutDuration];
  double v4 = v3;
  [(_UILongPressClickInteractionDriver *)self clickDownDuration];
  return v4 / v5;
}

- (double)touchDuration
{
  v2 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  [v2 touchDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)hasExceededAllowableMovement
{
  v2 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  char v3 = [v2 hasExceededAllowableMovement];

  return v3;
}

- (void)cancelInteraction
{
  char v3 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  [v3 setEnabled:0];

  id v4 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  [v4 setEnabled:1];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = [(_UILongPressClickInteractionDriver *)self view];
  if (v5)
  {
    id v6 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
    [v6 locationInView:v5];
    double v8 = v7;
    double v10 = v9;

    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4, v8, v10);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v15 = v12;
  double v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (unint64_t)inputPrecision
{
  v2 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  if (v2) {
    unint64_t v3 = v2[23];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)allowsFeedback
{
  return 1;
}

- (double)clickDownDuration
{
  int v3 = _AXSForceTouchTimeDuration();
  if (v3 == 2)
  {
    int v8 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256FD8, @"LongPressClickInteractionDriverClickDownDurationShortAX");
    double result = *(double *)&qword_1EB256FE0;
    BOOL v6 = v8 == 0;
    double v7 = 0.3;
  }
  else if (v3)
  {
    if (!self) {
      goto LABEL_11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    double v10 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained traitCollection];
    }
    else {
    double v11 = +[UIDevice currentDevice];
    }
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1)
    {
      int v13 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256FA8, @"LongPressClickInteractionDriverClickDownDurationPad");
      double result = *(double *)&qword_1EB256FB0;
      BOOL v6 = v13 == 0;
      double v7 = 0.325;
    }
    else
    {
LABEL_11:
      int v14 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_904, @"LongPressClickInteractionDriverClickDownDuration");
      double result = *(double *)&qword_1EB256FA0;
      BOOL v6 = v14 == 0;
      double v7 = 0.4;
    }
  }
  else
  {
    int v4 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256FC8, @"LongPressClickInteractionDriverClickDownDurationAX");
    double result = *(double *)&qword_1EB256FD0;
    BOOL v6 = v4 == 0;
    double v7 = 0.5;
  }
  if (!v6) {
    return v7;
  }
  return result;
}

- (double)clickTimeoutDuration
{
  int v2 = _AXSForceTouchTimeDuration();
  if (v2)
  {
    if (v2 == 1)
    {
      int v8 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256FB8, @"LongPressClickInteractionDriverClickTimeoutDuration");
      double result = *(double *)&qword_1EB256FC0;
      BOOL v5 = v8 == 0;
      double v6 = 0.725;
    }
    else
    {
      if (v2 != 2) {
        return result;
      }
      int v4 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256FF8, @"LongPressClickInteractionDriverClickTimeoutDurationShortAX");
      double result = *(double *)&qword_1EB257000;
      BOOL v5 = v4 == 0;
      double v6 = 0.3;
    }
  }
  else
  {
    int v7 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256FE8, @"LongPressClickInteractionDriverClickTimeoutDurationAX");
    double result = *(double *)&qword_1EB256FF0;
    BOOL v5 = v7 == 0;
    double v6 = 1.1;
  }
  if (!v5) {
    return v6;
  }
  return result;
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4 = a3;
  unint64_t currentState = self->_currentState;
  double v6 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  uint64_t v7 = [v6 state];

  if ((unint64_t)(v7 - 4) >= 2)
  {
    if (v7 == 1)
    {
      objc_initWeak(&location, self);
      int v8 = [(_UILongPressClickInteractionDriver *)self delegate];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63___UILongPressClickInteractionDriver__handleGestureRecognizer___block_invoke;
      v9[3] = &unk_1E52E83F0;
      objc_copyWeak(&v10, &location);
      [v8 clickDriver:self shouldBegin:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
    if (v7 != 3)
    {
      [(_UILongPressClickInteractionDriver *)self _updateForActiveGestureRecognizer];
      goto LABEL_9;
    }
    if (currentState == 3) {
      handleEvent(stateMachineSpec_0, self->_currentState, 2, (uint64_t)self, (uint64_t *)&self->_currentState);
    }
  }
  handleEvent(stateMachineSpec_0, self->_currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
LABEL_9:
}

- (void)_asyncGestureBegan
{
  [(_UILongPressClickInteractionDriver *)self setReachedClickDownThreshold:0];
  [(_UILongPressClickInteractionDriver *)self setForceMultiplier:1.0];
  handleEvent(stateMachineSpec_0, self->_currentState, 0, (uint64_t)self, (uint64_t *)&self->_currentState);
  [(_UILongPressClickInteractionDriver *)self _updateForActiveGestureRecognizer];
}

- (void)_updateForActiveGestureRecognizer
{
  int v3 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
  id v4 = v3;
  unint64_t currentState = self->_currentState;
  if (currentState == 1) {
    goto LABEL_26;
  }
  v34 = v3;
  uint64_t v6 = [v3 state];
  id v4 = v34;
  if (v6 != 2) {
    goto LABEL_26;
  }
  [v34 touchDuration];
  double v8 = v7;
  [v34 touchForce];
  double v10 = v9;
  double v11 = [v34 _allActiveTouches];
  uint64_t v12 = [v11 anyObject];
  int v13 = [v12 _isPointerTouch];

  if (!v13)
  {
    int v17 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257048, @"ClickAutoTriggerForceThreshold");
    double v18 = *(double *)&qword_1EB257050;
    if (v17) {
      double v18 = 4.0;
    }
    if (v10 >= v18)
    {
      int v20 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257058, @"ClickAutoTriggerMinPressDuration");
      double v21 = *(double *)&qword_1EB257060;
      if (v20) {
        double v21 = 0.05;
      }
      BOOL v19 = v8 >= v21;
    }
    else
    {
      BOOL v19 = 0;
    }
    [(_UILongPressClickInteractionDriver *)self setReachedClickDownThreshold:v19];
    [(_UILongPressClickInteractionDriver *)self forceMultiplier];
    double v15 = v22;
    int v16 = 0;
    goto LABEL_14;
  }
  [(_UILongPressClickInteractionDriver *)self setReachedClickDownThreshold:0];
  if (_os_feature_enabled_impl())
  {
    [(_UILongPressClickInteractionDriver *)self forceMultiplier];
    double v15 = v14;
    int v16 = 1;
LABEL_14:
    _forceMultiplierFromForce(v16);
    if (v15 >= v23) {
      double v23 = v15;
    }
    [(_UILongPressClickInteractionDriver *)self setForceMultiplier:v23];
  }
  [(_UILongPressClickInteractionDriver *)self clickDownDuration];
  double v25 = v24;
  [(_UILongPressClickInteractionDriver *)self forceMultiplier];
  double v27 = v8 / (v25 / v26);
  -[_UILongPressClickInteractionDriver _notifyDelegateOfUpdatedClickDownProgress:forceAdjustedClickDownDuration:](self, "_notifyDelegateOfUpdatedClickDownProgress:forceAdjustedClickDownDuration:", v27);
  [(_UILongPressClickInteractionDriver *)self clickTimeoutDuration];
  double v29 = v28;
  [(_UILongPressClickInteractionDriver *)self forceMultiplier];
  double v31 = v30;
  BOOL v32 = [(_UILongPressClickInteractionDriver *)self clicksUpAutomaticallyAfterTimeout];
  if (currentState == 3 && v32 && v8 > v29 / v31)
  {
    handleEvent(stateMachineSpec_0, self->_currentState, 2, (uint64_t)self, (uint64_t *)&self->_currentState);
    [(_UILongPressClickInteractionDriver *)self _updateTimeoutDebugUI:v8];
LABEL_25:
    id v4 = v34;
    goto LABEL_26;
  }
  id v4 = v34;
  if (currentState <= 2)
  {
    if (v27 >= 1.0
      || (BOOL v33 = [(_UILongPressClickInteractionDriver *)self reachedClickDownThreshold],
          id v4 = v34,
          v33))
    {
      handleEvent(stateMachineSpec_0, self->_currentState, 1, (uint64_t)self, (uint64_t *)&self->_currentState);
      goto LABEL_25;
    }
  }
LABEL_26:
}

- (void)_notifyDelegateOfUpdatedClickDownProgress:(double)a3 forceAdjustedClickDownDuration:(double)a4
{
  if (self->_delegateImplements.didUpdateHighlightProgress)
  {
    if ([(_UILongPressClickInteractionDriver *)self clicksUpAutomaticallyAfterTimeout])
    {
      double v7 = [(_UILongPressClickInteractionDriver *)self gestureRecognizer];
      [v7 minimumDurationRequired];
      double v9 = v8;

      double v10 = a3 + -1.0;
      double v11 = fmax(fmin((a3 - v9 / a4) / (1.0 - v9 / a4), 1.0), 0.0);
      if (a3 + -1.0 < 0.0) {
        double v10 = 0.0;
      }
      double v12 = v10 + v11;
    }
    else
    {
      double v12 = fmax(fmin(a3 / (pow(1.0 - a3, 3.4000001) + a3), 1.0), 0.0);
    }
    id v13 = [(_UILongPressClickInteractionDriver *)self delegate];
    [v13 clickDriver:self didUpdateHighlightProgress:v12];
  }
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_updateTimeoutDebugUI:(double)a3
{
  BOOL v5 = +[_UIPointerSettingsDomain rootSettings];
  int v6 = [v5 showMenuPressDuration];

  if (v6)
  {
    if (!_updateTimeoutDebugUI____triggerTime)
    {
      uint64_t v7 = objc_opt_new();
      double v8 = (void *)_updateTimeoutDebugUI____triggerTime;
      _updateTimeoutDebugUI____triggerTime = v7;

      [(id)_updateTimeoutDebugUI____triggerTime setTextAlignment:1];
      double v9 = +[UIColor redColor];
      [(id)_updateTimeoutDebugUI____triggerTime setBackgroundColor:v9];

      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setCenter:", 20.0, 50.0);
      double v10 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:40.0 weight:*(double *)off_1E52D6BF0];
      [(id)_updateTimeoutDebugUI____triggerTime setFont:v10];

      double v11 = [(id)_updateTimeoutDebugUI____triggerTime layer];
      [v11 setCornerRadius:13.0];

      uint64_t v12 = *MEMORY[0x1E4F39EA8];
      id v13 = [(id)_updateTimeoutDebugUI____triggerTime layer];
      [v13 setCornerCurve:v12];

      id v14 = +[UIColor whiteColor];
      uint64_t v15 = [v14 CGColor];
      int v16 = [(id)_updateTimeoutDebugUI____triggerTime layer];
      [v16 setBorderColor:v15];

      int v17 = [(id)_updateTimeoutDebugUI____triggerTime layer];
      [v17 setBorderWidth:2.0];

      [(id)_updateTimeoutDebugUI____triggerTime setClipsToBounds:1];
      double v18 = [(_UILongPressClickInteractionDriver *)self view];
      BOOL v19 = [v18 window];
      [v19 addSubview:_updateTimeoutDebugUI____triggerTime];
    }
    int v20 = &xmmword_186B92000;
    LODWORD(v20) = llround(a3 * 1000.0);
    double v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ims", v20);
    [(id)_updateTimeoutDebugUI____triggerTime setText:v21];

    [(id)_updateTimeoutDebugUI____triggerTime sizeToFit];
    [(id)_updateTimeoutDebugUI____triggerTime bounds];
    double v22 = (void *)_updateTimeoutDebugUI____triggerTime;
    objc_msgSend(v22, "setBounds:");
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setClickDownDuration:(double)a3
{
  self->_clickDownDuration = a3;
}

- (double)forceMultiplier
{
  return self->_forceMultiplier;
}

- (void)setForceMultiplier:(double)a3
{
  self->_forceMultiplier = a3;
}

- (BOOL)reachedClickDownThreshold
{
  return self->_reachedClickDownThreshold;
}

- (void)setReachedClickDownThreshold:(BOOL)a3
{
  self->_reachedClickDownThreshold = a3;
}

@end