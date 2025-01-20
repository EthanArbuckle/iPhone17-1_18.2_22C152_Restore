@interface SBPressPrecedenceArbiter
- (BOOL)_shouldArbitrateLockAndVolumeHardwareButtonPriorities;
- (NSArray)hardwareButtons;
- (SBPressPrecedenceArbiter)initWithHomeButtonType:(int64_t)a3;
- (unint64_t)_currentButtonPriority;
- (void)_applyButtonPriority:(unint64_t)a3;
- (void)_updateButtonPrioritiesForNotification:(id)a3;
- (void)_updateButtonPriority;
- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4;
- (void)setHardwareButtons:(id)a3;
@end

@implementation SBPressPrecedenceArbiter

- (SBPressPrecedenceArbiter)initWithHomeButtonType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBPressPrecedenceArbiter;
  v4 = [(SBPressPrecedenceArbiter *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_volumeAndLockButtonPriority = -1;
    v4->_homeButtonType = a3;
    BOOL v6 = [(SBPressPrecedenceArbiter *)v4 _shouldArbitrateLockAndVolumeHardwareButtonPriorities];
    v7 = SBLogButtonsCombo();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "volume/lock precedence arbitration is enabled on this device", v11, 2u);
      }

      v7 = +[SBAVSystemControllerCache sharedInstance];
      [v7 addObserver:v5];
      v5->_isAudioPlayingSomewhere = [v7 isAudioSessionPlaying];
      [(SBPressPrecedenceArbiter *)v5 _updateButtonPrioritiesForNotification:0];
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:v5 selector:sel__updateButtonPrioritiesForNotification_ name:*MEMORY[0x1E4FA7A38] object:0];
      [v9 addObserver:v5 selector:sel__updateButtonPrioritiesForNotification_ name:@"SBFrontmostDisplayChangedNotification" object:0];
      [v9 addObserver:v5 selector:sel__updateButtonPrioritiesForNotification_ name:*MEMORY[0x1E4FA7A18] object:0];
      [v9 addObserver:v5 selector:sel__updateButtonPrioritiesForNotification_ name:*MEMORY[0x1E4FA7A10] object:0];
      [v9 addObserver:v5 selector:sel__updateButtonPrioritiesForNotification_ name:@"SBApplicationsRegisteredForVolumeButtonEventsChangedNotification" object:0];
      [v9 addObserver:v5 selector:sel__updateButtonPrioritiesForNotification_ name:@"SBApplicationsRegisteredForLockButtonEventsChangedNotification" object:0];
    }
    else if (v8)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "volume/lock precedence arbitration is disabled on this device", v11, 2u);
    }
  }
  return v5;
}

- (void)setHardwareButtons:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtons, a3);
  unint64_t volumeAndLockButtonPriority = self->_volumeAndLockButtonPriority;
  [(SBPressPrecedenceArbiter *)self _applyButtonPriority:volumeAndLockButtonPriority];
}

- (BOOL)_shouldArbitrateLockAndVolumeHardwareButtonPriorities
{
  if (self->_homeButtonType == 2) {
    return 0;
  }
  else {
    return MGGetBoolAnswer();
  }
}

- (void)_updateButtonPriority
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBPressPrecedenceArbiter *)self _currentButtonPriority];
  v4 = SBLogButtonsCombo();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > 2) {
      v5 = @"<unknown>";
    }
    else {
      v5 = off_1E6AFB3E0[v3];
    }
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "lock/volume priority is:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (v3 != self->_volumeAndLockButtonPriority) {
    [(SBPressPrecedenceArbiter *)self _applyButtonPriority:v3];
  }
}

- (void)_updateButtonPrioritiesForNotification:(id)a3
{
}

uint64_t __67__SBPressPrecedenceArbiter__updateButtonPrioritiesForNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonPriority];
}

- (void)_applyButtonPriority:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_unint64_t volumeAndLockButtonPriority = a3;
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_hardwareButtons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "preemptablePressGestureRecognizers", (void)v14);
        [v4 addObjectsFromArray:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  unint64_t volumeAndLockButtonPriority = self->_volumeAndLockButtonPriority;
  objc_super v12 = &unk_1F3347A30;
  if (volumeAndLockButtonPriority != 2) {
    objc_super v12 = 0;
  }
  if (volumeAndLockButtonPriority == 1) {
    v13 = &unk_1F3347A18;
  }
  else {
    v13 = v12;
  }
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_setPressTypesWithPrecedence_, v13, (void)v14);
}

- (unint64_t)_currentButtonPriority
{
  unint64_t v3 = +[SBLockScreenManager sharedInstanceIfExists];
  int v4 = [v3 isUILocked];

  v5 = +[SBBacklightController sharedInstance];
  int v6 = [v5 screenIsOn];

  uint64_t v7 = +[SBWorkspace mainWorkspace];
  uint64_t v8 = [v7 transientOverlayPresentationManager];
  int v9 = [v8 hasActivePresentation];

  if (v4)
  {
    unint64_t v10 = 1;
    if (!(v6 | v9)) {
      unint64_t v10 = 2;
    }
    if (self->_isAudioPlayingSomewhere) {
      return v10;
    }
    else {
      return 2;
    }
  }
  else
  {
    objc_super v12 = [(id)SBApp appsRegisteredForLockButtonEvents];
    v13 = [v12 firstObject];

    long long v14 = [(id)SBApp appsRegisteredForVolumeEvents];
    long long v15 = [v14 firstObject];

    unsigned int v16 = SBWorkspaceUnlockedEnvironmentLayoutStateHasMatchingApplication(v13) ^ 1;
    if (v13) {
      BOOL v17 = v13 == v15;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17) {
      unint64_t v11 = v16;
    }
    else {
      unint64_t v11 = 1;
    }
  }
  return v11;
}

- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4
{
  self->_isAudioPlayingSomewhere = a4;
  [(SBPressPrecedenceArbiter *)self _updateButtonPriority];
}

- (NSArray)hardwareButtons
{
  return self->_hardwareButtons;
}

- (void).cxx_destruct
{
}

@end