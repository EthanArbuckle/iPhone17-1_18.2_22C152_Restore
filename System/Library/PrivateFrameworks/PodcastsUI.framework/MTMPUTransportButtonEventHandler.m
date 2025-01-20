@interface MTMPUTransportButtonEventHandler
- (BOOL)shouldFakeEnabled;
- (BOOL)shouldForceTrackingEnabled;
- (BOOL)supportsTapWhenDisabled;
- (MTMPUTransportButtonEventHandler)init;
- (UIControl)button;
- (double)minimumLongPressDuration;
- (id)performHitTestingBlock:(id)a3;
- (void)_clearLongPressTimer;
- (void)_longPressTimerAction;
- (void)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setButton:(id)a3;
- (void)setMinimumLongPressDuration:(double)a3;
- (void)setSupportsTapWhenDisabled:(BOOL)a3;
@end

@implementation MTMPUTransportButtonEventHandler

- (MTMPUTransportButtonEventHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTMPUTransportButtonEventHandler;
  result = [(MTMPUTransportButtonEventHandler *)&v3 init];
  if (result) {
    result->_minimumLongPressDuration = 0.75;
  }
  return result;
}

- (void)dealloc
{
  [(MTMPUTransportButtonEventHandler *)self _clearLongPressTimer];
  v3.receiver = self;
  v3.super_class = (Class)MTMPUTransportButtonEventHandler;
  [(MTMPUTransportButtonEventHandler *)&v3 dealloc];
}

- (void)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v6 = WeakRetained;
  if (!self->_longPressTimer
    && [WeakRetained isEnabled]
    && ([v6 allControlEvents] & 0x3000000) != 0)
  {
    objc_initWeak(&location, self);
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    longPressTimer = self->_longPressTimer;
    self->_longPressTimer = v7;

    v9 = self->_longPressTimer;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(self->_minimumLongPressDuration * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v11 = self->_longPressTimer;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__MTMPUTransportButtonEventHandler_beginTrackingWithTouch_withEvent___block_invoke;
    v12[3] = &unk_1E6E1F938;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v11, v12);
    dispatch_resume((dispatch_object_t)self->_longPressTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __69__MTMPUTransportButtonEventHandler_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _longPressTimerAction];
    id WeakRetained = v2;
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  if (self->_longPress)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    [WeakRetained sendActionsForControlEvents:0x2000000];

    self->_longPress = 0;
  }

  [(MTMPUTransportButtonEventHandler *)self _clearLongPressTimer];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  [(MTMPUTransportButtonEventHandler *)self _clearLongPressTimer];
  BOOL longPress = self->_longPress;
  p_button = &self->_button;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v8 = WeakRetained;
  if (longPress)
  {
    [WeakRetained sendActionsForControlEvents:0x2000000];

    self->_BOOL longPress = 0;
  }
  else
  {
    int v9 = [WeakRetained isTouchInside];

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_button);
      [v10 sendActionsForControlEvents:0x800000];
    }
  }
}

- (id)performHitTestingBlock:(id)a3
{
  if (self->_shouldFakeEnabled || !self->_supportsTapWhenDisabled)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 1;
    self->_shouldFakeEnabled = 1;
  }
  id result = (id)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  if (v4) {
    self->_shouldFakeEnabled = 0;
  }
  return result;
}

- (BOOL)shouldFakeEnabled
{
  return self->_shouldFakeEnabled;
}

- (BOOL)shouldForceTrackingEnabled
{
  return self->_supportsTapWhenDisabled;
}

- (void)_longPressTimerAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  if ([WeakRetained isTracking])
  {
    self->_BOOL longPress = 1;
    [WeakRetained sendActionsForControlEvents:0x1000000];
  }
}

- (void)_clearLongPressTimer
{
  longPressTimer = self->_longPressTimer;
  if (longPressTimer)
  {
    dispatch_source_cancel(longPressTimer);
    int v4 = self->_longPressTimer;
    self->_longPressTimer = 0;
  }
}

- (UIControl)button
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);

  return (UIControl *)WeakRetained;
}

- (void)setButton:(id)a3
{
}

- (double)minimumLongPressDuration
{
  return self->_minimumLongPressDuration;
}

- (void)setMinimumLongPressDuration:(double)a3
{
  self->_minimumLongPressDuration = a3;
}

- (BOOL)supportsTapWhenDisabled
{
  return self->_supportsTapWhenDisabled;
}

- (void)setSupportsTapWhenDisabled:(BOOL)a3
{
  self->_supportsTapWhenDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);

  objc_storeStrong((id *)&self->_longPressTimer, 0);
}

@end