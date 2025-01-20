@interface TVRStandardTouchProcessor
- (void)_tap:(id)a3;
- (void)_touchpadClickVirtualizerTimerFired:(id)a3;
- (void)setTouchpadView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TVRStandardTouchProcessor

- (void)setTouchpadView:(id)a3
{
  id v4 = a3;
  v5 = [(TVRTouchProcessor *)self touchpadView];
  [v5 removeGestureRecognizer:self->_tapGestureRecognizer];

  v9.receiver = self;
  v9.super_class = (Class)TVRStandardTouchProcessor;
  [(TVRTouchProcessor *)&v9 setTouchpadView:v4];
  if (v4)
  {
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (!tapGestureRecognizer)
    {
      v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__tap_];
      v8 = self->_tapGestureRecognizer;
      self->_tapGestureRecognizer = v7;

      [(UITapGestureRecognizer *)self->_tapGestureRecognizer setCancelsTouchesInView:0];
      [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelaysTouchesBegan:0];
      [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelaysTouchesEnded:0];
      tapGestureRecognizer = self->_tapGestureRecognizer;
    }
    [v4 addGestureRecognizer:tapGestureRecognizer];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  clickVirtualizerTimer = self->_clickVirtualizerTimer;
  id v7 = a4;
  id v8 = a3;
  [(NSTimer *)clickVirtualizerTimer invalidate];
  objc_super v9 = [v8 anyObject];
  self->_clickVirtualizerState = 1;
  v10 = [(TVRTouchProcessor *)self touchpadView];
  [v9 preciseLocationInView:v10];
  self->_touchBeganLocation.x = v11;
  self->_touchBeganLocation.y = v12;

  v13 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__touchpadClickVirtualizerTimerFired_ selector:0 userInfo:0 repeats:0.25];
  v14 = self->_clickVirtualizerTimer;
  self->_clickVirtualizerTimer = v13;

  v15.receiver = self;
  v15.super_class = (Class)TVRStandardTouchProcessor;
  [(TVRTouchProcessor *)&v15 touchesBegan:v8 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 anyObject];
  objc_super v9 = [(TVRTouchProcessor *)self touchpadView];
  [v8 preciseLocationInView:v9];
  double v12 = hypot(v10 - self->_touchBeganLocation.x, v11 - self->_touchBeganLocation.y);
  if (_TVRCGetTouchToSelectTravelDistance_onceToken != -1) {
    dispatch_once(&_TVRCGetTouchToSelectTravelDistance_onceToken, &__block_literal_global_321);
  }
  if ((__hasCachedTouchToSelectTravelDistance & 1) == 0)
  {
    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v14 = [v13 objectForKey:@"TouchToSelectTravelDistance"];

    if (v14) {
      [v14 doubleValue];
    }
    else {
      double v15 = 10.0;
    }
    __cachedTouchToSelectTravelDistance = *(void *)&v15;
    __hasCachedTouchToSelectTravelDistance = 1;
  }
  if (self->_clickVirtualizerState == 1 && v12 > *(double *)&__cachedTouchToSelectTravelDistance) {
    self->_clickVirtualizerState = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)TVRStandardTouchProcessor;
  [(TVRTouchProcessor *)&v17 touchesMoved:v6 withEvent:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSTimer *)self->_clickVirtualizerTimer invalidate];
  id v8 = [v6 anyObject];
  objc_super v9 = [(TVRTouchProcessor *)self touchpadView];
  [v8 preciseLocationInView:v9];
  double v12 = hypot(v10 - self->_touchBeganLocation.x, v11 - self->_touchBeganLocation.y);
  if (_TVRCGetTouchToSelectTravelDistance_onceToken != -1) {
    dispatch_once(&_TVRCGetTouchToSelectTravelDistance_onceToken, &__block_literal_global_321);
  }
  if ((__hasCachedTouchToSelectTravelDistance & 1) == 0)
  {
    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v14 = [v13 objectForKey:@"TouchToSelectTravelDistance"];

    if (v14) {
      [v14 doubleValue];
    }
    else {
      double v15 = 10.0;
    }
    __cachedTouchToSelectTravelDistance = *(void *)&v15;
    __hasCachedTouchToSelectTravelDistance = 1;
  }
  int64_t clickVirtualizerState = self->_clickVirtualizerState;
  if (clickVirtualizerState == 1)
  {
    if (v12 <= *(double *)&__cachedTouchToSelectTravelDistance)
    {
      self->_int64_t clickVirtualizerState = 0;
      [(TVRTouchProcessor *)self sendPressBegan:1];
      goto LABEL_13;
    }
  }
  else if (clickVirtualizerState == 2)
  {
    self->_int64_t clickVirtualizerState = 0;
LABEL_13:
    [(TVRTouchProcessor *)self sendPressEnded:1];
  }
  v17.receiver = self;
  v17.super_class = (Class)TVRStandardTouchProcessor;
  [(TVRTouchProcessor *)&v17 touchesEnded:v6 withEvent:v7];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  clickVirtualizerTimer = self->_clickVirtualizerTimer;
  id v7 = a4;
  id v8 = a3;
  [(NSTimer *)clickVirtualizerTimer invalidate];
  v9.receiver = self;
  v9.super_class = (Class)TVRStandardTouchProcessor;
  [(TVRTouchProcessor *)&v9 touchesCancelled:v8 withEvent:v7];
}

- (void)_touchpadClickVirtualizerTimerFired:(id)a3
{
  if (self->_clickVirtualizerState == 1)
  {
    self->_int64_t clickVirtualizerState = 2;
    [(TVRTouchProcessor *)self sendPressBegan:1];
  }
}

- (void)_tap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(TVRTouchProcessor *)self markCurrentTouchToBeCancelled];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickVirtualizerTimer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end