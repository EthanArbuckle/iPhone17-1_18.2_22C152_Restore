@interface CLKUIClockTimerLink
- (CLKUIClockTimerLink)initWithUpdateHandler:(id)a3;
- (id)updateHandler;
- (int64_t)_updateFrequencyForFPS:(int64_t)a3;
- (void)invalidate;
- (void)setUpdateHandler:(id)a3;
- (void)updateCoordinator;
@end

@implementation CLKUIClockTimerLink

- (CLKUIClockTimerLink)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUIClockTimerLink;
  v5 = [(CLKUIRenderFrequencyLink *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = v6;
  }
  return v5;
}

- (void)updateCoordinator
{
  v14.receiver = self;
  v14.super_class = (Class)CLKUIClockTimerLink;
  [(CLKUIRenderFrequencyLink *)&v14 updateCoordinator];
  v3 = [MEMORY[0x1E4F196B0] sharedInstance];
  [v3 stopUpdatesForToken:self->_timerToken];

  timerToken = self->_timerToken;
  self->_timerToken = 0;

  if (![(CLKUIRenderFrequencyLink *)self isPaused])
  {
    unint64_t v5 = [(CLKUIRenderFrequencyLink *)self preferredFramesPerSecond];
    int64_t v6 = [(CLKUIClockTimerLink *)self _updateFrequencyForFPS:v5];
    if ((v6 & 0x8000000000000000) == 0)
    {
      int64_t v7 = v6;
      v8 = [MEMORY[0x1E4F196B0] sharedInstance];
      id updateHandler = self->_updateHandler;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __40__CLKUIClockTimerLink_updateCoordinator__block_invoke;
      v13[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v13[4] = v5;
      v10 = [v8 startUpdatesWithUpdateFrequency:v7 withHandler:updateHandler identificationLog:v13];
      v11 = self->_timerToken;
      self->_timerToken = v10;

      v12 = [MEMORY[0x1E4F196B0] sharedInstance];
      [v12 setHandler:self->_timerToken wantsCommit:1];
    }
  }
}

uint64_t __40__CLKUIClockTimerLink_updateCoordinator__block_invoke(uint64_t a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"CLKClockTimerLink %ldfps Clock Timer Callback", *(void *)(a1 + 32));
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)CLKUIClockTimerLink;
  [(CLKUIRenderFrequencyLink *)&v5 invalidate];
  if (self->_timerToken)
  {
    v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    [v3 stopUpdatesForToken:self->_timerToken];

    timerToken = self->_timerToken;
    self->_timerToken = 0;
  }
}

- (int64_t)_updateFrequencyForFPS:(int64_t)a3
{
  int64_t v3 = 4;
  uint64_t v4 = -1;
  if (a3 == 30) {
    uint64_t v4 = 3;
  }
  if (a3 != 60) {
    int64_t v3 = v4;
  }
  if (a3 == 15) {
    return 2;
  }
  else {
    return v3;
  }
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);
}

@end