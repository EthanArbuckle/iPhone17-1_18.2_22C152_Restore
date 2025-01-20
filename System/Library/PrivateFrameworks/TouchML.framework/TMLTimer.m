@interface TMLTimer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (void)initializeJSContext:(id)a3;
- (BOOL)repeats;
- (BOOL)running;
- (NSString)runLoopMode;
- (double)interval;
- (double)tolerance;
- (id)block;
- (void)fire;
- (void)setBlock:(id)a3;
- (void)setInterval:(double)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRunLoopMode:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setTolerance:(double)a3;
- (void)start;
- (void)stop;
- (void)timerFired:(id)a3;
- (void)tmlDispose;
@end

@implementation TMLTimer

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return objc_msgSend_isEqualToString_(a3, a2, v3, @"running") ^ 1;
}

- (void)tmlDispose
{
  objc_msgSend_invalidate(self->_timer, a2, v2);
  timer = self->_timer;
  self->_timer = 0;

  v5.receiver = self;
  v5.super_class = (Class)TMLTimer;
  [&v5 tmlDispose];
}

- (void)setRunning:(BOOL)a3
{
  if (self->_running == a3) {
    return;
  }
  if (!a3)
  {
    objc_msgSend_invalidate(self->_timer, a2, v3);
    timer = self->_timer;
    self->_timer = 0;
    goto LABEL_7;
  }
  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], a2, self->_interval, self, sel_timerFired_, 0, self->_repeats);
  objc_super v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v6 = self->_timer;
  self->_timer = v5;

  objc_msgSend_setTolerance_(self->_timer, v7, self->_tolerance);
  runLoopMode = self->_runLoopMode;
  if (runLoopMode && (objc_msgSend_isEqualToString_(runLoopMode, v8, v9, *MEMORY[0x263EFF478]) & 1) == 0)
  {
    timer = objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v8, v9);
    objc_msgSend_addTimer_forMode_(timer, v12, v13, self->_timer, self->_runLoopMode);
LABEL_7:
  }
  objc_msgSend_willChangeValueForKey_(self, v8, v9, @"running");
  self->_running = self->_timer != 0;
  objc_msgSend_didChangeValueForKey_(self, v14, v15, @"running");
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)timerFired:(id)a3
{
  id v7 = a3;
  if (!self->_repeats) {
    objc_msgSend_stop(self, v4, v5);
  }
  block = (void (**)(void))self->_block;
  if (block) {
    block[2]();
  }
  else {
    objc_msgSend_emitTMLSignal_withArguments_(self, v4, v5, @"fired", 0);
  }
}

- (void)start
{
  if (self->_running)
  {
    objc_msgSend_invalidate(self->_timer, a2, v2);
    timer = self->_timer;
    self->_timer = 0;

    self->_running = 0;
  }
  MEMORY[0x270F9A6D0](self, sel_setRunning_, v2);
}

- (void)stop
{
}

- (void)fire
{
}

+ (void)initializeJSContext:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_239864EA4;
  v7[3] = &unk_264DAE010;
  v7[4] = a1;
  id v3 = a3;
  v4 = (void *)MEMORY[0x23ECA7DD0](v7);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, @"timer");
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (double)interval
{
  return self->_interval;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (void)setTolerance:(double)a3
{
  self->_tolerance = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (NSString)runLoopMode
{
  return self->_runLoopMode;
}

- (void)setRunLoopMode:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoopMode, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end