@interface SBLockScreenNowPlayingController
- (BOOL)_isMediaRecentlyActive;
- (BOOL)isEnabled;
- (BOOL)isNowPlayingActive;
- (SBLockScreenNowPlayingController)initWithMediaController:(id)a3;
- (SBLockScreenNowPlayingControllerDelegate)delegate;
- (double)_timeoutInterval;
- (int64_t)currentState;
- (void)_addObservers;
- (void)_disableTimerFired;
- (void)_invalidateDisableTimer;
- (void)_removeObservers;
- (void)_startDisableTimer;
- (void)_updateNowPlayingPlugin;
- (void)_updateToState:(int64_t)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SBLockScreenNowPlayingController

- (SBLockScreenNowPlayingController)initWithMediaController:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBLockScreenNowPlayingController;
  v6 = [(SBLockScreenNowPlayingController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaController, a3);
    v7->_currentState = 0;
    uint64_t v8 = [MEMORY[0x1E4F5E408] rootSettings];
    testSettings = v7->_testSettings;
    v7->_testSettings = (CSLockScreenSettings *)v8;

    [(CSLockScreenSettings *)v7->_testSettings addKeyObserver:v7];
    objc_initWeak(&location, v7);
    v10 = (void *)MEMORY[0x1E4F941F8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke;
    v16[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v17, &location);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke_2;
    v14[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [v10 recipeWithTitle:@"Show Now Playing" prepareBlock:0 toggleAction:v16 cleanupBlock:v14];
    testRecipe = v7->_testRecipe;
    v7->_testRecipe = (PTToggleTestRecipe *)v11;

    [MEMORY[0x1E4F5E408] registerTestRecipe:v7->_testRecipe];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNowPlayingPlugin];
}

void __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNowPlayingPlugin];
}

- (void)dealloc
{
  [(CSLockScreenSettings *)self->_testSettings removeKeyObserver:self];
  [(PTToggleTestRecipe *)self->_testRecipe invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBLockScreenNowPlayingController *)self _invalidateDisableTimer];
  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenNowPlayingController;
  [(SBLockScreenNowPlayingController *)&v4 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id v5 = SBLogLockScreenNowPlaying();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "setEnabled:true", buf, 2u);
      }

      [(SBLockScreenNowPlayingController *)self _addObservers];
      [(SBLockScreenNowPlayingController *)self _updateNowPlayingPlugin];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "setEnabled:false. Removing Now Playing", v7, 2u);
      }

      [(SBLockScreenNowPlayingController *)self _removeObservers];
      [(SBLockScreenNowPlayingController *)self _invalidateDisableTimer];
      [(SBLockScreenNowPlayingController *)self _updateToState:0];
    }
  }
}

- (BOOL)isNowPlayingActive
{
  return self->_currentState != 0;
}

- (double)_timeoutInterval
{
  v2 = +[SBDefaults localDefaults];
  BOOL v3 = [v2 lockScreenDefaults];
  [v3 nowPlayingTimeout];
  double v5 = v4;

  double result = 480.0;
  if (v5 >= 0.0) {
    return v5;
  }
  return result;
}

- (BOOL)_isMediaRecentlyActive
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBMediaController *)self->_mediaController lastActivityDate];
  double v4 = SBLogLockScreenNowPlaying();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [v3 timeIntervalSince1970];
    int v12 = 134217984;
    uint64_t v13 = (uint64_t)v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "media last activity date is %{time_t}ld", (uint8_t *)&v12, 0xCu);
  }

  if (v3)
  {
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:v3];
    double v8 = v7;

    [(SBLockScreenNowPlayingController *)self _timeoutInterval];
    BOOL v10 = v8 <= v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_addObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateNowPlayingPlugin name:@"SBMediaNowPlayingChangedNotification" object:0];
  [v3 addObserver:self selector:sel__updateNowPlayingPlugin name:@"SBMediaNowPlayingAppChangedNotification" object:0];
  [v3 addObserver:self selector:sel__updateNowPlayingPlugin name:@"SBMediaApplicationActivityDidBeginNotification" object:0];
  [v3 addObserver:self selector:sel__updateNowPlayingPlugin name:@"SBMediaApplicationActivityDidEndNotification" object:0];
}

- (void)_removeObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBMediaNowPlayingChangedNotification" object:0];
  [v3 removeObserver:self name:@"SBMediaNowPlayingAppChangedNotification" object:0];
  [v3 removeObserver:self name:@"SBMediaApplicationActivityDidBeginNotification" object:0];
  [v3 removeObserver:self name:@"SBMediaApplicationActivityDidEndNotification" object:0];
}

- (void)_updateNowPlayingPlugin
{
  if ([(SBMediaController *)self->_mediaController isPlaying]
    || [(SBMediaController *)self->_mediaController isApplicationActivityActive]
    || ([(CSLockScreenSettings *)self->_testSettings showNowPlaying] & 1) != 0
    || [(PTToggleTestRecipe *)self->_testRecipe isOn])
  {
    id v3 = SBLogLockScreenNowPlaying();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = 2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "media is playing. Showing Now Playing.", buf, 2u);
    }
    else
    {
      uint64_t v4 = 2;
    }
    goto LABEL_8;
  }
  if (![(SBMediaController *)self->_mediaController isPaused]
    || ![(SBLockScreenNowPlayingController *)self _isMediaRecentlyActive])
  {
    BOOL v5 = [(SBMediaController *)self->_mediaController isPaused];
    id v3 = SBLogLockScreenNowPlaying();
    BOOL v6 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        __int16 v10 = 0;
        double v7 = "media is paused but NOT recently active. Removing Now Playing.";
        double v8 = (uint8_t *)&v10;
LABEL_19:
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else if (v6)
    {
      __int16 v9 = 0;
      double v7 = "media is not playing and not paused. Removing Now Playing.";
      double v8 = (uint8_t *)&v9;
      goto LABEL_19;
    }
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  id v3 = SBLogLockScreenNowPlaying();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "media is paused and recently active. Showing Now Playing and starting disable timer.", v11, 2u);
  }
  uint64_t v4 = 1;
LABEL_8:

  [(SBLockScreenNowPlayingController *)self _updateToState:v4];
}

- (void)_updateToState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    if (a3 == 1) {
      [(SBLockScreenNowPlayingController *)self _startDisableTimer];
    }
    else {
      [(SBLockScreenNowPlayingController *)self _invalidateDisableTimer];
    }
    id v4 = [(SBLockScreenNowPlayingController *)self delegate];
    [v4 nowPlayingController:self didChangeToState:self->_currentState];
  }
}

- (void)_startDisableTimer
{
  [(SBLockScreenNowPlayingController *)self _invalidateDisableTimer];
  id v3 = objc_alloc(MEMORY[0x1E4F89D38]);
  [(SBLockScreenNowPlayingController *)self _timeoutInterval];
  id v4 = (PCPersistentTimer *)objc_msgSend(v3, "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", @"com.apple.springboard.nowplaying", self, sel__disableTimerFired, 0);
  disableTimer = self->_disableTimer;
  self->_disableTimer = v4;

  BOOL v6 = self->_disableTimer;
  id v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(PCPersistentTimer *)v6 scheduleInRunLoop:v7];
}

- (void)_invalidateDisableTimer
{
  [(PCPersistentTimer *)self->_disableTimer invalidate];
  disableTimer = self->_disableTimer;
  self->_disableTimer = 0;
}

- (void)_disableTimerFired
{
  id v3 = SBLogLockScreenNowPlaying();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "disable timer fired, removing Now Playing", v4, 2u);
  }

  [(SBLockScreenNowPlayingController *)self _updateToState:0];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (SBLockScreenNowPlayingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenNowPlayingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testRecipe, 0);
  objc_storeStrong((id *)&self->_testSettings, 0);
  objc_storeStrong((id *)&self->_disableTimer, 0);
  objc_storeStrong((id *)&self->_mediaController, 0);
}

@end