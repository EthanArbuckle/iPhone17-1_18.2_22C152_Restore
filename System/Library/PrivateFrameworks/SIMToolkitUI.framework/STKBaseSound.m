@interface STKBaseSound
- (BOOL)isPlaying;
- (BOOL)playsOnce;
- (STKBaseSound)initWithDuration:(double)a3;
- (double)duration;
- (void)_sync_playSound;
- (void)_sync_stopSound;
- (void)dealloc;
- (void)playSound;
- (void)stopSound;
@end

@implementation STKBaseSound

- (STKBaseSound)initWithDuration:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)STKBaseSound;
  v4 = [(STKBaseSound *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_duration = a3;
    v4->_BOOL playsOnce = BSFloatLessThanOrEqualToFloat();
    v6 = STKCommonLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL playsOnce = v5->_playsOnce;
      *(_DWORD *)buf = 134218496;
      v11 = v5;
      __int16 v12 = 2048;
      double v13 = a3;
      __int16 v14 = 1024;
      BOOL v15 = playsOnce;
      _os_log_impl(&dword_221DC0000, v6, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Created sound with duration: %f, playsOnce: %d", buf, 0x1Cu);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = STKCommonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Dealloc.", buf, 0xCu);
  }

  [(STKBaseSound *)self stopSound];
  v4.receiver = self;
  v4.super_class = (Class)STKBaseSound;
  [(STKBaseSound *)&v4 dealloc];
}

- (void)playSound
{
  obj = self;
  objc_sync_enter(obj);
  [(STKBaseSound *)obj _sync_playSound];
  objc_sync_exit(obj);
}

- (void)stopSound
{
  obj = self;
  objc_sync_enter(obj);
  [(STKBaseSound *)obj _sync_stopSound];
  objc_sync_exit(obj);
}

- (void)_sync_playSound
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(STKBaseSound *)self _sync_stopSound];
  if (!self->_isPlaying)
  {
    v3 = STKCommonLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v14 = self;
      _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Playing sound.", buf, 0xCu);
    }

    self->_isPlaying = 1;
    [(STKBaseSound *)self _reallyPlaySound];
    if (!self->_playsOnce)
    {
      objc_super v4 = STKCommonLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        double duration = self->_duration;
        *(_DWORD *)buf = 134218240;
        __int16 v14 = self;
        __int16 v15 = 2048;
        double v16 = duration;
        _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Scheduling sound stop timer with interval duration: %f.", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v6 = (void *)MEMORY[0x263F29CF0];
      double v7 = self->_duration;
      v8 = dispatch_get_global_queue(33, 0);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __31__STKBaseSound__sync_playSound__block_invoke;
      v11[3] = &unk_2645F4988;
      v11[4] = self;
      objc_copyWeak(&v12, (id *)buf);
      objc_super v9 = [v6 scheduledTimerWithFireInterval:v8 queue:v11 handler:v7];
      timer = self->_timer;
      self->_timer = v9;

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __31__STKBaseSound__sync_playSound__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = STKCommonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_221DC0000, v2, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Stop timer fired!.", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stopSound];
}

- (void)_sync_stopSound
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_isPlaying)
  {
    uint64_t v3 = STKCommonLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = self;
      _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Stopping sound explicitly.", (uint8_t *)&v5, 0xCu);
    }

    [(STKBaseSound *)self _reallyStopSound];
    self->_isPlaying = 0;
    [(BSTimer *)self->_timer cancel];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)playsOnce
{
  return self->_playsOnce;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void).cxx_destruct
{
}

@end