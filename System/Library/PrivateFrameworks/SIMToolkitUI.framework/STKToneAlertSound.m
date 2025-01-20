@interface STKToneAlertSound
- (STKToneAlertSound)initWithType:(int64_t)a3 duration:(double)a4;
- (void)_reallyPlaySound;
- (void)_reallyStopSound;
@end

@implementation STKToneAlertSound

- (STKToneAlertSound)initWithType:(int64_t)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STKToneAlertSound;
  result = [(STKBaseSound *)&v6 initWithDuration:a4];
  if (result) {
    result->_alertType = a3;
  }
  return result;
}

- (void)_reallyPlaySound
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(STKBaseSound *)self playsOnce];
  v4 = (void *)[objc_alloc(MEMORY[0x263F7FC70]) initWithType:self->_alertType];
  [v4 setVibrationIdentifier:*MEMORY[0x263F7FD78]];
  [v4 setShouldRepeat:!v3];
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x263F7FC68] alertWithConfiguration:v4];
  alert = self->_alert;
  self->_alert = v5;

  v7 = STKCommonLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_alert;
    *(_DWORD *)buf = 134218240;
    v14 = self;
    __int16 v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_221DC0000, v7, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Tone sound: %p", buf, 0x16u);
  }

  v9 = self->_alert;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__STKToneAlertSound__reallyPlaySound__block_invoke;
  v10[3] = &unk_2645F49B0;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [(TLAlert *)v9 playWithCompletionHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __37__STKToneAlertSound__reallyPlaySound__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = STKCommonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 134218498;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_221DC0000, v6, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Tone sound completion fired:  type:%ld, error:%{public}@", (uint8_t *)&v10, 0x20u);
  }

  id v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sync_stopSound");

  objc_sync_exit(v8);
}

- (void)_reallyStopSound
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  alert = self->_alert;
  if (alert)
  {
    if (!self->_finishedSoundNormally)
    {
      v4 = STKCommonLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 134217984;
        objc_super v6 = self;
        _os_log_impl(&dword_221DC0000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Actually stopping TL sound explicitly.", (uint8_t *)&v5, 0xCu);
      }

      [(TLAlert *)self->_alert stop];
      alert = self->_alert;
    }
    self->_alert = 0;
  }
}

- (void).cxx_destruct
{
}

@end