@interface _UISystemGestureGateGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (BOOL)_isAllowedToReceiveGESEvents;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (_UISystemGestureGateGestureRecognizer)initWithCoder:(id)a3;
- (_UISystemGestureGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_UISystemGestureGateGestureRecognizer)initWithWindow:(id)a3 type:(unsigned __int8)a4;
- (id)_gateGestureTypeString;
- (void)_cancelTimeoutTimerIfNeeded;
- (void)_notifyWindowNoLongerAwaitingSystemGestureNotification:(id)a3;
- (void)_resetGestureRecognizer;
- (void)_systemGestureStateChanged:(id)a3;
- (void)_timeOut;
- (void)dealloc;
- (void)setDelaysTouchesBegan:(BOOL)a3;
- (void)setDelaysTouchesEnded:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UISystemGestureGateGestureRecognizer

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  if (self->_systemGestureGateType) {
    return [a3 _requiresSystemGesturesToFail];
  }
  else {
    return 0;
  }
}

- (BOOL)_isAllowedToReceiveGESEvents
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((*((unsigned char *)self + 273) & 2) != 0)
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemGestureGate", touchesBegan_withEvent____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [(_UISystemGestureGateGestureRecognizer *)self _gateGestureTypeString];
      v11 = [NSString stringWithFormat:@"Failed to receive system gesture state notification before next touch"];
      *(_DWORD *)buf = 134218498;
      v34 = self;
      __int16 v35 = 2112;
      v36 = v10;
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "<%p> %@: %@", buf, 0x20u);
    }
  }
  if ((*((unsigned char *)self + 273) & 1) == 0) {
    [(UIGestureRecognizer *)self setState:5];
  }
  if ([(UIGestureRecognizer *)self numberOfTouches] >= 2) {
    [(UIGestureRecognizer *)self setState:5];
  }
  if (!self->_systemGestureGateType)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v18 = [v17 view];
          if (v18)
          {
            v19 = (void *)v18;
            while (![v19 _shouldDelayTouchForSystemGestures:v17])
            {
              uint64_t v20 = [v19 superview];

              v19 = (void *)v20;
              if (!v20) {
                goto LABEL_18;
              }
            }
          }
          else
          {
LABEL_18:

            [(UIGestureRecognizer *)self ignoreTouch:v17 forEvent:v7];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }
  }
  if ([(UIGestureRecognizer *)self numberOfTouches])
  {
    if (!self->_delayTimeoutTimer)
    {
      v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      delayTimeoutTimer = self->_delayTimeoutTimer;
      self->_delayTimeoutTimer = v21;

      v23 = self->_delayTimeoutTimer;
      dispatch_time_t v24 = dispatch_time(0, 750000000);
      dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak((id *)buf, self);
      v25 = self->_delayTimeoutTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __64___UISystemGestureGateGestureRecognizer_touchesBegan_withEvent___block_invoke;
      handler[3] = &unk_1E52DC308;
      objc_copyWeak(&v27, (id *)buf);
      dispatch_source_set_event_handler(v25, handler);
      dispatch_activate((dispatch_object_t)self->_delayTimeoutTimer);
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (_UISystemGestureGateGestureRecognizer)initWithWindow:(id)a3 type:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  id v7 = [(UIGestureRecognizer *)&v14 initWithTarget:0 action:0];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__systemGestureStateChanged_ name:0x1ED160120 object:v6];

    *((unsigned char *)v7 + 273) = *((unsigned char *)v7 + 273) & 0xFE | [v6 _systemGestureRecognitionIsPossible];
    [(UIGestureRecognizer *)v7 _setAcceptsFailureRequiments:0];
    v7->_systemGestureGateType = v4;
    if (v4 == 1)
    {
      v13.receiver = v7;
      v13.super_class = (Class)_UISystemGestureGateGestureRecognizer;
      [(UIGestureRecognizer *)&v13 setDelaysTouchesBegan:0];
      v12.receiver = v7;
      v12.super_class = (Class)_UISystemGestureGateGestureRecognizer;
      -[UIGestureRecognizer setDelaysTouchesEnded:](&v12, sel_setDelaysTouchesEnded_, 0, v10.receiver, v10.super_class);
    }
    else
    {
      v11.receiver = v7;
      v11.super_class = (Class)_UISystemGestureGateGestureRecognizer;
      [(UIGestureRecognizer *)&v11 setDelaysTouchesBegan:1];
      -[UIGestureRecognizer setDelaysTouchesEnded:](&v10, sel_setDelaysTouchesEnded_, 1, v7, _UISystemGestureGateGestureRecognizer);
    }
  }

  return v7;
}

- (void)_systemGestureStateChanged:(id)a3
{
  id v14 = a3;
  int v4 = [v14 object];
  char v5 = [v4 _systemGestureRecognitionIsPossible];
  char v6 = v5;
  char v7 = *((unsigned char *)self + 273);
  if ((v7 & 1) != 0 && (v5 & 1) == 0)
  {
    if ((*((unsigned char *)self + 273) & 2) != 0)
    {
      *((unsigned char *)self + 273) &= ~2u;
      v8 = [(UIGestureRecognizer *)self view];
      v9 = [v8 _window];
      [(_UISystemGestureGateGestureRecognizer *)self _notifyWindowNoLongerAwaitingSystemGestureNotification:v9];
    }
    objc_super v10 = [v14 userInfo];
    objc_super v11 = [v10 valueForKey:0x1ED160140];
    int v12 = [v11 BOOLValue];

    if (v12) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 5;
    }
    [(UIGestureRecognizer *)self setState:v13];
    char v7 = *((unsigned char *)self + 273);
  }
  *((unsigned char *)self + 273) = v7 & 0xFE | v6;
}

- (void)_resetGestureRecognizer
{
  *((unsigned char *)self + 273) &= ~2u;
  self->_lastTouchTime = 0.0;
  v3 = [(UIGestureRecognizer *)self view];
  int v4 = [v3 _window];
  [(_UISystemGestureGateGestureRecognizer *)self _notifyWindowNoLongerAwaitingSystemGestureNotification:v4];

  [(_UISystemGestureGateGestureRecognizer *)self _cancelTimeoutTimerIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  [(UIGestureRecognizer *)&v5 _resetGestureRecognizer];
}

- (void)_cancelTimeoutTimerIfNeeded
{
  delayTimeoutTimer = self->_delayTimeoutTimer;
  if (delayTimeoutTimer)
  {
    dispatch_source_cancel(delayTimeoutTimer);
    int v4 = self->_delayTimeoutTimer;
    self->_delayTimeoutTimer = 0;
  }
}

- (void)_notifyWindowNoLongerAwaitingSystemGestureNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = [(UIGestureRecognizer *)self _activeEvents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 _windowNoLongerAwaitingSystemGestureNotification:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v7 touchesForGestureRecognizer:self];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([*(id *)(*((void *)&v27 + 1) + 8 * v12) phase] < 3) {
        goto LABEL_22;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (*((unsigned char *)self + 273))
  {
    *((unsigned char *)self + 273) |= 2u;
    self->_lastTouchTime = CACurrentMediaTime();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    uint64_t v13 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v8);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
          uint64_t v18 = [(UIGestureRecognizer *)self view];
          v19 = [v18 _window];
          if (v17) {
            uint64_t v20 = *(void **)(v17 + 360);
          }
          else {
            uint64_t v20 = 0;
          }
          id v21 = v20;
          [v7 _addWindowAwaitingLatentSystemGestureNotification:v19 deliveredToEventWindow:v21];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v22 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        uint64_t v14 = v22;
      }
      while (v22);
    }
LABEL_22:

    goto LABEL_23;
  }
  [(UIGestureRecognizer *)self setState:5];
LABEL_23:
}

- (_UISystemGestureGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return 0;
}

- (_UISystemGestureGateGestureRecognizer)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1ED160120 object:0];

  [(_UISystemGestureGateGestureRecognizer *)self _cancelTimeoutTimerIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  [(UIGestureRecognizer *)&v4 dealloc];
}

- (void)setDelaysTouchesBegan:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesBegan___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = a3;
  if (setDelaysTouchesBegan__once != -1) {
    dispatch_once(&setDelaysTouchesBegan__once, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  [(UIGestureRecognizer *)&v5 setDelaysTouchesBegan:v3];
}

- (void)setDelaysTouchesEnded:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesEnded___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v7 = a3;
  if (setDelaysTouchesEnded__once != -1) {
    dispatch_once(&setDelaysTouchesEnded__once, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  [(UIGestureRecognizer *)&v5 setDelaysTouchesEnded:v3];
}

- (void)_timeOut
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("SystemGestureGate", &_timeOut___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_super v4 = v3;
      objc_super v5 = [(_UISystemGestureGateGestureRecognizer *)self _gateGestureTypeString];
      id v6 = [NSString stringWithFormat:@"System gesture gate timed out."];
      int v7 = 134218498;
      id v8 = self;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "<%p> %@: %@", (uint8_t *)&v7, 0x20u);
    }
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return [a3 _requiresSystemGesturesToFail];
}

- (id)_gateGestureTypeString
{
  if (self->_systemGestureGateType) {
    v2 = @"Gesture";
  }
  else {
    v2 = @"Touch";
  }
  BOOL v3 = v2;
  return v3;
}

- (void).cxx_destruct
{
}

@end