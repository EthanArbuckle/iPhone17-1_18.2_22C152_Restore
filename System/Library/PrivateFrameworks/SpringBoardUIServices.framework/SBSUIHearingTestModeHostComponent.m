@interface SBSUIHearingTestModeHostComponent
- (NSString)identifier;
- (NSTimer)disableHearingTestModeAfterDelayWhenBackgroundTimer;
- (SBSUIHearingTestModeHostComponent)init;
- (SBSUIHearingTestModeHostComponentDelegate)delegate;
- (int64_t)hearingTestMode;
- (void)_updateHearingTestMode;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableHearingTestModeAfterDelayWhenBackgroundTimer:(id)a3;
- (void)setHearingTestMode:(int64_t)a3;
@end

@implementation SBSUIHearingTestModeHostComponent

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = SBLogHearingTestMode();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_DEFAULT, "Host Component did receive scene settings updates with context: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  [(SBSUIHearingTestModeHostComponent *)self _updateHearingTestMode];
}

- (void)_updateHearingTestMode
{
  v3 = [(FBSSceneComponent *)self scene];
  v4 = [v3 clientSettings];
  uint64_t v5 = [v4 hearingTestMode];

  int v6 = [v3 isValid];
  int64_t v7 = 0;
  if (v6 && v5)
  {
    id v8 = objc_msgSend(v3, "settings", 0);
    int v9 = [v8 isForeground];

    if (v9)
    {
      [(NSTimer *)self->_disableHearingTestModeAfterDelayWhenBackgroundTimer invalidate];
      [(SBSUIHearingTestModeHostComponent *)self setDisableHearingTestModeAfterDelayWhenBackgroundTimer:0];
      int64_t v7 = v5;
    }
    else
    {
      int64_t v7 = [(SBSUIHearingTestModeHostComponent *)self hearingTestMode];
      if (v7 == 1)
      {
        int v10 = [(SBSUIHearingTestModeHostComponent *)self disableHearingTestModeAfterDelayWhenBackgroundTimer];

        if (!v10)
        {
          objc_initWeak(&location, self);
          id v11 = (void *)MEMORY[0x1E4F1CB00];
          uint64_t v13 = MEMORY[0x1E4F143A8];
          uint64_t v14 = 3221225472;
          v15 = __59__SBSUIHearingTestModeHostComponent__updateHearingTestMode__block_invoke;
          v16 = &unk_1E5CCD618;
          objc_copyWeak(&v17, &location);
          __int16 v12 = [v11 scheduledTimerWithTimeInterval:0 repeats:&v13 block:150.0];
          -[SBSUIHearingTestModeHostComponent setDisableHearingTestModeAfterDelayWhenBackgroundTimer:](self, "setDisableHearingTestModeAfterDelayWhenBackgroundTimer:", v12, v13, v14, v15, v16);

          objc_destroyWeak(&v17);
          objc_destroyWeak(&location);
        }
        int64_t v7 = 1;
      }
    }
  }
  [(SBSUIHearingTestModeHostComponent *)self setHearingTestMode:v7];
}

- (void)setHearingTestMode:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_hearingTestMode != a3)
  {
    self->_hearingTestMode = a3;
    v4 = SBLogHearingTestMode();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = SBSHearingTestModeDescription();
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Host component post changes in hearing test mode through delegate: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    int v6 = [(SBSUIHearingTestModeHostComponent *)self delegate];
    [v6 hearingTestModeHostComponentDidChangeActiveState:self];
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v9 containsProperty:sel_hearingTestMode])
  {
    __int16 v12 = SBLogHearingTestMode();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_DEFAULT, "Host Component did receive client scene settings updates with clientSettingsDiff: %@, oldSettings: %@, transitionContext: %@", (uint8_t *)&v13, 0x20u);
    }

    [(SBSUIHearingTestModeHostComponent *)self _updateHearingTestMode];
  }
}

- (void)setDelegate:(id)a3
{
}

- (SBSUIHearingTestModeHostComponent)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSUIHearingTestModeHostComponent;
  v2 = [(SBSUIHearingTestModeHostComponent *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableHearingTestModeAfterDelayWhenBackgroundTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __59__SBSUIHearingTestModeHostComponent__updateHearingTestMode__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v5 isValid]) {
    [WeakRetained setHearingTestMode:0];
  }
  id v4 = [WeakRetained disableHearingTestModeAfterDelayWhenBackgroundTimer];

  if (v4 == v5) {
    [WeakRetained setDisableHearingTestModeAfterDelayWhenBackgroundTimer:0];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = SBLogHearingTestMode();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Host Component did receive scene invalidation", v5, 2u);
  }

  [(SBSUIHearingTestModeHostComponent *)self _updateHearingTestMode];
}

- (SBSUIHearingTestModeHostComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSUIHearingTestModeHostComponentDelegate *)WeakRetained;
}

- (int64_t)hearingTestMode
{
  return self->_hearingTestMode;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSTimer)disableHearingTestModeAfterDelayWhenBackgroundTimer
{
  return self->_disableHearingTestModeAfterDelayWhenBackgroundTimer;
}

- (void)setDisableHearingTestModeAfterDelayWhenBackgroundTimer:(id)a3
{
}

@end