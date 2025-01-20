@interface SHSRingerControl
- (AVSystemController)_systemController;
- (BOOL)_logFaultCalledForBackground;
- (BOOL)_logFaultCalledForInactive;
- (BOOL)_volumeInitialized;
- (BOOL)appWantsVolumeChangeEvents;
- (BOOL)canChangeRingtoneWithButtons;
- (SHSRingerControl)init;
- (SHSRingerControlDelegate)delegate;
- (float)volume;
- (int64_t)_volumeChangeCoalescingCount;
- (void)_handleEffectiveVolumeDidChangeNotification:(id)a3;
- (void)_handleServerConnectionDiedNotification:(id)a3;
- (void)_setup;
- (void)_tearDown;
- (void)_updateVolume:(float)a3;
- (void)dealloc;
- (void)reload;
- (void)setAppWantsVolumeChangeEvents:(BOOL)a3;
- (void)setCanChangeRingtoneWithButtons:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setVolume:(float)a3;
- (void)set_logFaultCalledForBackground:(BOOL)a3;
- (void)set_logFaultCalledForInactive:(BOOL)a3;
- (void)set_systemController:(id)a3;
- (void)set_volumeChangeCoalescingCount:(int64_t)a3;
- (void)set_volumeInitialized:(BOOL)a3;
@end

@implementation SHSRingerControl

- (BOOL)canChangeRingtoneWithButtons
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[SHSRingerControl canChangeRingtoneWithButtons]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v8, 0xCu);
  }

  LOBYTE(v8) = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"buttons-can-change-ringer-volume", @"com.apple.preferences.sounds", (Boolean *)&v8);
  if ((_BYTE)v8) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  [(SHSRingerControl *)self setAppWantsVolumeChangeEvents:v6];
  __48__SHSRingerControl_canChangeRingtoneWithButtons__block_invoke();
  return v6;
}

- (void)setAppWantsVolumeChangeEvents:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SHSRingerControl *)self _systemController];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setAttribute:v4 forKey:*MEMORY[0x263F54330] error:0];
}

- (AVSystemController)_systemController
{
  return self->__systemController;
}

- (SHSRingerControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHSRingerControl;
  v2 = [(SHSRingerControl *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(SHSRingerControl *)v2 _setup];
    [(SHSRingerControl *)v3 reload];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v6 = "-[SHSRingerControl dealloc]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  [(SHSRingerControl *)self _tearDown];
  __27__SHSRingerControl_dealloc__block_invoke();
  v4.receiver = self;
  v4.super_class = (Class)SHSRingerControl;
  [(SHSRingerControl *)&v4 dealloc];
}

void __27__SHSRingerControl_dealloc__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl dealloc]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_setup
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[SHSRingerControl _setup]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v5 = [MEMORY[0x263F544E0] sharedAVSystemController];
  systemController = self->__systemController;
  self->__systemController = v5;

  uint64_t v7 = (uint64_t *)MEMORY[0x263F54380];
  uint64_t v11 = *MEMORY[0x263F54380];
  int v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  [(AVSystemController *)self->__systemController setAttribute:v8 forKey:*MEMORY[0x263F544A0] error:0];
  uint64_t v9 = *v7;
  uint64_t v10 = [(SHSRingerControl *)self _systemController];
  [v4 addObserver:self selector:sel__handleEffectiveVolumeDidChangeNotification_ name:v9 object:v10];

  [v4 addObserver:self selector:sel__handleServerConnectionDiedNotification_ name:*MEMORY[0x263F54470] object:0];
  __26__SHSRingerControl__setup__block_invoke();
}

void __26__SHSRingerControl__setup__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl _setup]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_tearDown
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[SHSRingerControl _tearDown]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v7, 0xCu);
  }

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [(SHSRingerControl *)self set_volumeInitialized:0];
  uint64_t v5 = *MEMORY[0x263F544A8];
  BOOL v6 = [(SHSRingerControl *)self _systemController];
  [v4 removeObserver:self name:v5 object:v6];

  [v4 removeObserver:self name:*MEMORY[0x263F54470] object:0];
  __29__SHSRingerControl__tearDown__block_invoke();
}

void __29__SHSRingerControl__tearDown__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl _tearDown]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

void __48__SHSRingerControl_canChangeRingtoneWithButtons__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl canChangeRingtoneWithButtons]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)setCanChangeRingtoneWithButtons:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[SHSRingerControl setCanChangeRingtoneWithButtons:]";
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v10, 0xCu);
  }

  BOOL v6 = (const void *)[NSNumber numberWithBool:v3];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"buttons-can-change-ringer-volume", v6, @"com.apple.preferences.sounds", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSynchronize(@"com.apple.preferences.sounds", v7, v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.preferences.sounds.buttons-can-change-ringer-volume.changed", 0, 0, 1u);
  [(SHSRingerControl *)self setAppWantsVolumeChangeEvents:v3];
  __52__SHSRingerControl_setCanChangeRingtoneWithButtons___block_invoke();
}

void __52__SHSRingerControl_setCanChangeRingtoneWithButtons___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl setCanChangeRingtoneWithButtons:]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)reload
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[SHSRingerControl reload]";
    _os_log_impl(&dword_237305000, v3, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  [(SHSRingerControl *)self set_volumeInitialized:0];
  float v7 = 0.0;
  objc_super v4 = [(SHSRingerControl *)self _systemController];
  [v4 getVolume:&v7 forCategory:@"RingtonePreview"];

  uint64_t v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[SHSRingerControl reload]";
    __int16 v10 = 2048;
    double v11 = v7;
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: Retrieved AVSystemController volume: %f.", buf, 0x16u);
  }

  if (![(SHSRingerControl *)self _volumeInitialized])
  {
    *(float *)&double v6 = v7;
    [(SHSRingerControl *)self _updateVolume:v6];
  }
  __26__SHSRingerControl_reload__block_invoke();
}

void __26__SHSRingerControl_reload__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl reload]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)setVolume:(float)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SHSRingerControl setVolume:]";
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start.", buf, 0xCu);
  }

  double v6 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v7 = [v6 applicationState];

  switch(v7)
  {
    case 0:
      CFStringRef v8 = SHSLogForCategory(1uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        float volume = self->_volume;
        int64_t v13 = [(SHSRingerControl *)self _volumeChangeCoalescingCount];
        *(_DWORD *)buf = 136315906;
        v25 = "-[SHSRingerControl setVolume:]";
        __int16 v26 = 2048;
        double v27 = volume;
        __int16 v28 = 2048;
        double v29 = a3;
        __int16 v30 = 2048;
        int64_t v31 = v13;
        _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "%s: (current: %f, newVolume: %f, coalescingCount: %ld).", buf, 0x2Au);
      }
      goto LABEL_13;
    case 1:
      if ([(SHSRingerControl *)self _logFaultCalledForInactive])
      {
        CFStringRef v8 = SHSLogForCategory(1uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          float v16 = self->_volume;
          int64_t v17 = [(SHSRingerControl *)self _volumeChangeCoalescingCount];
          *(_DWORD *)buf = 136315906;
          v25 = "-[SHSRingerControl setVolume:]";
          __int16 v26 = 2048;
          double v27 = v16;
          __int16 v28 = 2048;
          double v29 = a3;
          __int16 v30 = 2048;
          int64_t v31 = v17;
          double v11 = "%s: Called while application state is 'Inactive' (current: %f, newVolume: %f, coalescingCount: %ld).";
          goto LABEL_22;
        }
LABEL_13:

        break;
      }
      v15 = SHSLogForCategory(1uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        float v18 = self->_volume;
        int64_t v19 = [(SHSRingerControl *)self _volumeChangeCoalescingCount];
        *(_DWORD *)buf = 136315906;
        v25 = "-[SHSRingerControl setVolume:]";
        __int16 v26 = 2048;
        double v27 = v18;
        __int16 v28 = 2048;
        double v29 = a3;
        __int16 v30 = 2048;
        int64_t v31 = v19;
        _os_log_fault_impl(&dword_237305000, v15, OS_LOG_TYPE_FAULT, "%s: Called while application state is 'Inactive' (current: %f, newVolume: %f, coalescingCount: %ld).", buf, 0x2Au);
      }

      [(SHSRingerControl *)self set_logFaultCalledForInactive:1];
      break;
    case 2:
      if ([(SHSRingerControl *)self _logFaultCalledForBackground])
      {
        CFStringRef v8 = SHSLogForCategory(1uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          float v9 = self->_volume;
          int64_t v10 = [(SHSRingerControl *)self _volumeChangeCoalescingCount];
          *(_DWORD *)buf = 136315906;
          v25 = "-[SHSRingerControl setVolume:]";
          __int16 v26 = 2048;
          double v27 = v9;
          __int16 v28 = 2048;
          double v29 = a3;
          __int16 v30 = 2048;
          int64_t v31 = v10;
          double v11 = "%s: Called while application state is 'Background' (current: %f, newVolume: %f, coalescingCount: %ld).";
LABEL_22:
          _os_log_error_impl(&dword_237305000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x2Au);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      uint64_t v14 = SHSLogForCategory(1uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        float v20 = self->_volume;
        int64_t v21 = [(SHSRingerControl *)self _volumeChangeCoalescingCount];
        *(_DWORD *)buf = 136315906;
        v25 = "-[SHSRingerControl setVolume:]";
        __int16 v26 = 2048;
        double v27 = v20;
        __int16 v28 = 2048;
        double v29 = a3;
        __int16 v30 = 2048;
        int64_t v31 = v21;
        _os_log_fault_impl(&dword_237305000, v14, OS_LOG_TYPE_FAULT, "%s: Called while application state is 'Background' (current: %f, newVolume: %f, coalescingCount: %ld).", buf, 0x2Au);
      }

      [(SHSRingerControl *)self set_logFaultCalledForBackground:1];
      break;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __30__SHSRingerControl_setVolume___block_invoke_27;
  v22[3] = &unk_264CD0248;
  v22[4] = self;
  float v23 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v22);
  __30__SHSRingerControl_setVolume___block_invoke();
}

void __30__SHSRingerControl_setVolume___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl setVolume:]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

float __30__SHSRingerControl_setVolume___block_invoke_27(uint64_t a1)
{
  int v1 = *(float **)(a1 + 32);
  float result = v1[3];
  if (result != *(float *)(a1 + 40))
  {
    objc_msgSend(v1, "set_volumeChangeCoalescingCount:", objc_msgSend(*(id *)(a1 + 32), "_volumeChangeCoalescingCount") + 1);
    dispatch_time_t v4 = dispatch_time(0, 70000000);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __30__SHSRingerControl_setVolume___block_invoke_2;
    v5[3] = &unk_264CD0248;
    v5[4] = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x263EF83A0], v5);
    float result = *(float *)(a1 + 40);
    *(float *)(*(void *)(a1 + 32) + 12) = result;
  }
  return result;
}

void __30__SHSRingerControl_setVolume___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "set_volumeChangeCoalescingCount:", objc_msgSend(*(id *)(a1 + 32), "_volumeChangeCoalescingCount") - 1);
  if (![*(id *)(a1 + 32) _volumeChangeCoalescingCount])
  {
    v2 = SHSLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      double v3 = *(float *)(a1 + 40);
      int v13 = 136315394;
      uint64_t v14 = "-[SHSRingerControl setVolume:]_block_invoke_2";
      __int16 v15 = 2048;
      double v16 = v3;
      _os_log_impl(&dword_237305000, v2, OS_LOG_TYPE_DEFAULT, "%s: Setting AVSystemController volume to: %f.", (uint8_t *)&v13, 0x16u);
    }

    dispatch_time_t v4 = [*(id *)(a1 + 32) _systemController];
    LODWORD(v5) = *(_DWORD *)(*(void *)(a1 + 32) + 12);
    [v4 setVolumeTo:@"RingtonePreview" forCategory:v5];

    int v6 = [*(id *)(a1 + 32) delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      CFStringRef v8 = SHSLogForCategory(1uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        float v9 = [*(id *)(a1 + 32) delegate];
        double v10 = *(float *)(a1 + 40);
        int v13 = 136315650;
        uint64_t v14 = "-[SHSRingerControl setVolume:]_block_invoke";
        __int16 v15 = 2114;
        double v16 = *(double *)&v9;
        __int16 v17 = 2048;
        double v18 = v10;
        _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "%s: Calling delegate %{public}@ with new volume value: %f.", (uint8_t *)&v13, 0x20u);
      }
      double v11 = [*(id *)(a1 + 32) delegate];
      LODWORD(v12) = *(_DWORD *)(*(void *)(a1 + 32) + 12);
      objc_msgSend(v11, "ringerControl:volumeValueDidChange:", v12);
    }
  }
}

- (void)_updateVolume:(float)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[SHSRingerControl _updateVolume:]";
    __int16 v15 = 2048;
    double v16 = a3;
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start (volume %f).", (uint8_t *)&v13, 0x16u);
  }

  float v6 = self->_volume - a3;
  if (v6 < 0.0) {
    float v6 = -v6;
  }
  if (v6 > 0.00000011921)
  {
    [(SHSRingerControl *)self set_volumeInitialized:1];
    self->_float volume = a3;
    char v7 = [(SHSRingerControl *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      float v9 = SHSLogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = [(SHSRingerControl *)self delegate];
        int v13 = 136315650;
        uint64_t v14 = "-[SHSRingerControl _updateVolume:]";
        __int16 v15 = 2114;
        double v16 = *(double *)&v10;
        __int16 v17 = 2048;
        double v18 = a3;
        _os_log_impl(&dword_237305000, v9, OS_LOG_TYPE_DEFAULT, "%s: Calling delegate %{public}@ with new volume value: %f.", (uint8_t *)&v13, 0x20u);
      }
      double v11 = [(SHSRingerControl *)self delegate];
      *(float *)&double v12 = a3;
      [v11 ringerControl:self volumeValueDidChange:v12];
    }
  }
  __34__SHSRingerControl__updateVolume___block_invoke();
}

void __34__SHSRingerControl__updateVolume___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl _updateVolume:]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_handleEffectiveVolumeDidChangeNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315138;
    __int16 v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s Start.", (uint8_t *)&v27, 0xCu);
  }

  float v6 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v7 = [v6 applicationState] == 1;

  if (v7)
  {
    char v8 = SHSLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315138;
      __int16 v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
      float v9 = "%s: App is not active, ignoring.";
LABEL_11:
      _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v27, 0xCu);
    }
  }
  else if ([(SHSRingerControl *)self canChangeRingtoneWithButtons])
  {
    char v8 = [v4 userInfo];
    double v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F54398]];
    uint64_t v11 = [v10 isEqualToString:@"ExplicitVolumeChange"];
    double v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F54388]];
    if ([v12 isEqualToString:@"RingtonePreview"]) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = [v12 isEqualToString:@"Ringtone"];
    }
    uint64_t v14 = SHSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [NSNumber numberWithBool:v11];
      double v16 = [NSNumber numberWithBool:v13];
      int v27 = 136315906;
      __int16 v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
      __int16 v29 = 2114;
      id v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      __int16 v33 = 2114;
      v34 = v12;
      _os_log_impl(&dword_237305000, v14, OS_LOG_TYPE_DEFAULT, "%s: Is volume change '%{public}@', is ringtone related category '%{public}@', category '%{public}@'.", (uint8_t *)&v27, 0x2Au);
    }
    if (v11)
    {
      __int16 v17 = [(SHSRingerControl *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        uint64_t v19 = SHSLogForCategory(1uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(sel_ringerControlDidObserveEffectiveSystemVolumeChange_);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          int64_t v21 = [(SHSRingerControl *)self delegate];
          int v27 = 136315650;
          __int16 v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
          __int16 v29 = 2114;
          id v30 = v20;
          __int16 v31 = 2114;
          uint64_t v32 = v21;
          _os_log_impl(&dword_237305000, v19, OS_LOG_TYPE_DEFAULT, "%s: Calling '%{public}@' delegate %{public}@.", (uint8_t *)&v27, 0x20u);
        }
        v22 = [(SHSRingerControl *)self delegate];
        [v22 ringerControlDidObserveEffectiveSystemVolumeChange:self];
      }
      if (v13)
      {
        float v23 = [v8 objectForKey:*MEMORY[0x263F54390]];
        [v23 floatValue];
        int v25 = v24;

        LODWORD(v26) = v25;
        [(SHSRingerControl *)self _updateVolume:v26];
      }
    }
  }
  else
  {
    char v8 = SHSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315138;
      __int16 v28 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]";
      float v9 = "%s: 'Change with Buttons' is not active, ignoring.";
      goto LABEL_11;
    }
  }

  __64__SHSRingerControl__handleEffectiveVolumeDidChangeNotification___block_invoke();
}

void __64__SHSRingerControl__handleEffectiveVolumeDidChangeNotification___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl _handleEffectiveVolumeDidChangeNotification:]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_handleServerConnectionDiedNotification:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    BOOL v7 = "-[SHSRingerControl _handleServerConnectionDiedNotification:]";
    _os_log_impl(&dword_237305000, v5, OS_LOG_TYPE_DEFAULT, "%s: Start.", (uint8_t *)&v6, 0xCu);
  }

  [(SHSRingerControl *)self _tearDown];
  [(SHSRingerControl *)self _setup];
  [(SHSRingerControl *)self reload];
  __60__SHSRingerControl__handleServerConnectionDiedNotification___block_invoke();
}

void __60__SHSRingerControl__handleServerConnectionDiedNotification___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = SHSLogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[SHSRingerControl _handleServerConnectionDiedNotification:]_block_invoke";
    _os_log_impl(&dword_237305000, v0, OS_LOG_TYPE_DEFAULT, "%s: Finish.", (uint8_t *)&v1, 0xCu);
  }
}

- (SHSRingerControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSRingerControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)appWantsVolumeChangeEvents
{
  return self->_appWantsVolumeChangeEvents;
}

- (void)set_systemController:(id)a3
{
}

- (int64_t)_volumeChangeCoalescingCount
{
  return self->__volumeChangeCoalescingCount;
}

- (void)set_volumeChangeCoalescingCount:(int64_t)a3
{
  self->__volumeChangeCoalescingCount = a3;
}

- (BOOL)_volumeInitialized
{
  return self->__volumeInitialized;
}

- (void)set_volumeInitialized:(BOOL)a3
{
  self->__volumeInitialized = a3;
}

- (BOOL)_logFaultCalledForInactive
{
  return self->__logFaultCalledForInactive;
}

- (void)set_logFaultCalledForInactive:(BOOL)a3
{
  self->__logFaultCalledForInactive = a3;
}

- (BOOL)_logFaultCalledForBackground
{
  return self->__logFaultCalledForBackground;
}

- (void)set_logFaultCalledForBackground:(BOOL)a3
{
  self->__logFaultCalledForBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__systemController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end