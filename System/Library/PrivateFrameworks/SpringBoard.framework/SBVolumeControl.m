@interface SBVolumeControl
+ (BOOL)_isVolumeChangeAllowedForState:(id)a3 error:(id *)a4;
+ (BOOL)_isVolumeManagedForCategory:(id)a3;
- (BOOL)_displaysVolumeForCategory:(id)a3;
- (BOOL)_isCategoryAlwaysHidden:(id)a3;
- (BOOL)_isHUDDisplayableForCategory:(id)a3 outReason:(id *)a4;
- (BOOL)_isHUDDisplayableForLastEventCategoryWithReason:(id *)a3;
- (BOOL)_isHUDDisplayableWithReason:(id *)a3;
- (BOOL)_isVolumeHUDVisible;
- (BOOL)canChangeVolumeForActiveCategory:(id)a3 isAudioSessionPlaying:(BOOL)a4;
- (BOOL)elasticHUDViewControllerCanBePresented:(id)a3 withReason:(id *)a4;
- (BOOL)elasticValueViewController:(id)a3 updateCurrentValue:(float)a4;
- (NSString)lastDisplayedCategory;
- (SBControlCenterController)controlCenterController;
- (SBVolumeControl)initWithHUDController:(id)a3 ringerControl:(id)a4 telephonyManager:(id)a5 conferenceManager:(id)a6;
- (float)_buttonRepeatDelay;
- (float)_effectiveVolume;
- (float)_getMediaVolumeForIAP;
- (float)volumeStepDown;
- (float)volumeStepUp;
- (id)_avscOperationsQueue;
- (id)acquireVolumeHUDHiddenAssertionForReason:(id)a3;
- (id)existingVolumeHUDViewController;
- (id)presentedVolumeHUDViewController;
- (void)_configureVolumeStepDeltaForVolumeHUDViewController:(id)a3;
- (void)_dispatchAVSystemControllerAsync:(id)a3;
- (void)_dispatchAVSystemControllerSync:(id)a3;
- (void)_effectiveVolumeChanged:(id)a3;
- (void)_presentVolumeHUDWithVolume:(float)a3;
- (void)_processZStackParticipantSettings:(id)a3;
- (void)_resetMediaServerConnection;
- (void)_setMediaVolumeForIAP:(float)a3;
- (void)_someSceneWillConnect:(id)a3;
- (void)_updateEffectiveVolume:(float)a3;
- (void)addAlwaysHiddenCategory:(id)a3;
- (void)cancelVolumeEvent;
- (void)changeVolumeByDelta:(float)a3;
- (void)clearAlwaysHiddenCategories;
- (void)controlCenterWillPresent;
- (void)decreaseVolume;
- (void)elasticHUDViewControllerRequestsDismissal:(id)a3;
- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4;
- (void)hideVolumeHUDIfVisible;
- (void)increaseVolume;
- (void)removeAlwaysHiddenCategory:(id)a3;
- (void)setActiveCategoryVolume:(float)a3;
- (void)setControlCenterController:(id)a3;
- (void)setVolume:(float)a3 forCategory:(id)a4;
- (void)toggleMute;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4;
@end

@implementation SBVolumeControl

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
}

- (void)_processZStackParticipantSettings:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = [a3 audioCategoriesDisablingVolumeHUD];
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v4);
    v5 = [(SBVolumeControl *)self lastDisplayedCategory];
    if (SBFAudioCategoriesDisablingVolumeHUDIncludesCategory())
    {
      v6 = SBLogAudioControl();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412802;
        v8 = self;
        __int16 v9 = 2114;
        v10 = v5;
        __int16 v11 = 2114;
        v12 = v4;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%@ Hiding Volume HUD if visible; lastDisplayedCategory='%{public}@', audioCategoriesDisablingVolumeHUD=%{public}@",
          (uint8_t *)&v7,
          0x20u);
      }

      [(SBVolumeControl *)self hideVolumeHUDIfVisible];
    }
  }
}

- (NSString)lastDisplayedCategory
{
  return self->_lastDisplayedCategory;
}

- (void)_effectiveVolumeChanged:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  double v6 = [v5 objectForKey:*MEMORY[0x1E4F74B98]];
  if ([(SBVolumeControl *)self _displaysVolumeForCategory:*(void *)&v6])
  {
    int v7 = [v5 objectForKey:*MEMORY[0x1E4F74BB0]];
    v8 = SBLogAudioControl();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      double v47 = v6;
      __int16 v48 = 2114;
      uint64_t v49 = (uint64_t)v7;
      __int16 v50 = 2048;
      id v51 = v4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "_effectiveVolumeChanged for '%{public}@' for reason: %{public}@/%p", buf, 0x20u);
    }

    unsigned int v9 = [v7 isEqualToString:@"ExplicitVolumeChange"];
    if (v9) {
      int v10 = 1;
    }
    else {
      int v10 = [v7 isEqualToString:@"FullMuteChange"];
    }
    char v11 = [v7 isEqualToString:@"RouteChange"];
    int v12 = [v7 isEqualToString:@"CategoryChange"];
    if ((v10 & 1) != 0 || (v11 & 1) != 0 || v12)
    {
      unsigned int v41 = v9;
      uint64_t v13 = [v5 objectForKey:*MEMORY[0x1E4F74BA8]];
      [v13 floatValue];
      float v15 = v14;

      double v44 = COERCE_DOUBLE([(NSString *)self->_lastEventCategory copy]);
      unint64_t mode = self->_mode;
      objc_storeStrong((id *)&self->_lastEventCategory, *(id *)&v6);
      v17 = self->_lastEventCategory;
      if ([(NSString *)v17 isEqualToString:@"Audio/Video"])
      {
        unint64_t v18 = 1;
      }
      else if ([(NSString *)v17 isEqualToString:@"PhoneCall"])
      {
        unint64_t v18 = 2;
      }
      else if ([(NSString *)v17 isEqualToString:@"Ringtone"])
      {
        unint64_t v18 = 3;
      }
      else if ([(NSString *)v17 isEqualToString:@"RingtonePreview"])
      {
        unint64_t v18 = 3;
      }
      else
      {
        unint64_t v18 = 4;
      }

      self->_unint64_t mode = v18;
      char v19 = BSEqualObjects();
      if (mode != self->_mode)
      {
        v21 = SBLogAudioControl();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSBVolumeMode(mode);
          double v42 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          uint64_t v22 = NSStringFromSBVolumeMode(self->_mode);
          *(_DWORD *)buf = 138543618;
          double v47 = v42;
          __int16 v48 = 2114;
          uint64_t v49 = v22;
          v23 = (void *)v22;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Updating Mode from '%{public}@' -> '%{public}@'", buf, 0x16u);
        }
      }
      if ((v19 & 1) == 0)
      {
        v24 = SBLogAudioControl();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          lastEventCategory = self->_lastEventCategory;
          *(_DWORD *)buf = 138543618;
          double v47 = v44;
          __int16 v48 = 2114;
          uint64_t v49 = (uint64_t)lastEventCategory;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Updating Last Event category from '%{public}@' -> '%{public}@'", buf, 0x16u);
        }
      }
      *(float *)&double v20 = v15;
      [(SBVolumeControl *)self _updateEffectiveVolume:v20];
      v26 = SBLogAudioControl();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v47 = v15;
        _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Caching newEffectiveVolume: %f from AVSystemController", buf, 0xCu);
      }
      int v43 = v10;

      id v45 = 0;
      BOOL v27 = [(SBVolumeControl *)self _isHUDDisplayableWithReason:&v45];
      double v28 = COERCE_DOUBLE(v45);
      if (!v27)
      {
        v29 = SBLogAudioControl();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          double v47 = v28;
          _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "HUD is not displayable; %{public}@", buf, 0xCu);
        }
      }
      v30 = [v5 objectForKey:*MEMORY[0x1E4F74BA0]];
      int v31 = [v30 BOOLValue];

      if ((v43 & v31) == 1)
      {
        v32 = SBLogAudioControl();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "Volume change is explicitly suppressing HUD presentation", buf, 2u);
        }
      }
      if (((v43 ^ 1 | v31) & 1) != 0 || !v27)
      {
        v36 = [(SBVolumeControl *)self presentedVolumeHUDViewController];
        if (v36) {
          BOOL v37 = v27;
        }
        else {
          BOOL v37 = 0;
        }
        if (v37)
        {
          v38 = (NSString *)[(NSString *)self->_lastEventCategory copy];
          lastDisplayedCategory = self->_lastDisplayedCategory;
          self->_lastDisplayedCategory = v38;

          *(float *)&double v40 = v15;
          [v36 noteValueDidChange:v40];
        }
      }
      else
      {
        v33 = (NSString *)[(NSString *)self->_lastEventCategory copy];
        v34 = self->_lastDisplayedCategory;
        self->_lastDisplayedCategory = v33;

        *(float *)&double v35 = v15;
        [(SBVolumeControl *)self _presentVolumeHUDWithVolume:v35];
      }
      if (v43 && self->_mode == 3)
      {
        if (v27) {
          -[SBRingerControl activateRingerHUDForVolumeChangeWithInitialVolume:]((uint64_t)self->_ringerControl, v15);
        }
        -[SBRingerControl setVolume:forKeyPress:]((uint64_t)self->_ringerControl, v41, v15);
      }
    }
  }
  else
  {
    int v7 = SBLogAudioControl();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v47 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "_effectiveVolumeChanged for '%{public}@' but volume category is not displayed by SBVolumeControl", buf, 0xCu);
    }
  }
}

- (BOOL)_displaysVolumeForCategory:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() _isVolumeManagedForCategory:v3];

  return v4;
}

+ (BOOL)_isVolumeManagedForCategory:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"Audio/Video"] & 1) != 0
      || ([v4 isEqualToString:@"Alarm"] & 1) != 0
      || ([v4 isEqualToString:@"Ringtone"] & 1) != 0
      || ([v4 isEqualToString:@"PhoneCall"] & 1) != 0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = [v4 isEqualToString:@"VoiceCommand"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)presentedVolumeHUDViewController
{
  v2 = [(SBHUDController *)self->_hudController presentedHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  id v3 = [v2 HUDViewController];

  return v3;
}

- (void)_updateEffectiveVolume:(float)a3
{
  p_effectiveVolumeLock = &self->_effectiveVolumeLock;
  os_unfair_lock_lock(&self->_effectiveVolumeLock);
  self->_effectiveVolume = a3;
  os_unfair_lock_unlock(p_effectiveVolumeLock);
}

- (BOOL)_isHUDDisplayableWithReason:(id *)a3
{
  char v5 = [(SBVolumeControl *)self controlCenterController];
  int v6 = [v5 isVisible];
  char v7 = v6;
  if (v6) {
    v8 = @"Control Center is visible";
  }
  else {
    v8 = 0;
  }
  unsigned int v9 = +[SBLockScreenManager sharedInstance];
  int v10 = v9;
  if ((v7 & 1) == 0)
  {
    if ([v9 isUILocked])
    {
      int v12 = [v10 lockScreenEnvironment];
      uint64_t v13 = [v12 backlightController];
      uint64_t v14 = [v13 backlightLuminance];

      if (!v14)
      {
        v8 = @"UI Locked and backlight is fully off";
        goto LABEL_5;
      }
      float v15 = [v10 lockScreenEnvironment];
      v16 = [v15 mediaControlsPresenter];
      [v16 isShowingMediaControls];

      if (![(SBTelephonyManager *)self->_telephonyManager inCall]) {
        [(SBConferenceManager *)self->_conferenceManager inFaceTime];
      }
    }
    BOOL v11 = [(SBVolumeControl *)self _isHUDDisplayableForLastEventCategoryWithReason:a3];
    goto LABEL_12;
  }
LABEL_5:
  BOOL v11 = 0;
  if (a3) {
    *a3 = v8;
  }
LABEL_12:

  return v11;
}

- (SBControlCenterController)controlCenterController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterController);
  return (SBControlCenterController *)WeakRetained;
}

- (BOOL)_isHUDDisplayableForLastEventCategoryWithReason:(id *)a3
{
  lastEventCategory = self->_lastEventCategory;
  return !lastEventCategory
      || [(SBVolumeControl *)self _isHUDDisplayableForCategory:lastEventCategory outReason:a3];
}

- (BOOL)_isHUDDisplayableForCategory:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  if (!SBFAudioCategoriesDisablingVolumeHUDIncludesCategory()
    || ([NSString stringWithFormat:@"Z-stack participant is suppressing the HUD for category '%@'", v6], (char v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = +[SBAssistantController sharedInstanceIfExists];
    unsigned int v9 = v8;
    if (v8
      && [v8 isVisible]
      && ![v9 shouldShowSystemVolumeHUDForCategory:v6])
    {
      char v7 = [NSString stringWithFormat:@"Siri is visible and is suppressing the HUD for category '%@'", v6];

      if (v7) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    int v10 = +[SBWorkspace mainWorkspace];
    BOOL v11 = [v10 inCallPresentationManager];
    int v12 = [v11 disablesSystemVolumeHUDForCategory:v6];

    if (!v12
      || ([NSString stringWithFormat:@"SBInCallPresentationManager is suppressing the HUD for category '%@'", v6], (char v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ([(SBVolumeControl *)self _isCategoryAlwaysHidden:v6])
      {
        char v7 = [NSString stringWithFormat:@"category '%@' is always hidden", v6];
      }
      else
      {
        char v7 = 0;
      }
    }
  }
LABEL_13:
  if (a4) {
    *a4 = v7;
  }

  return v7 == 0;
}

- (SBVolumeControl)initWithHUDController:(id)a3 ringerControl:(id)a4 telephonyManager:(id)a5 conferenceManager:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 115, @"Invalid parameter not satisfying: %@", @"HUDController" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_10:
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 117, @"Invalid parameter not satisfying: %@", @"telephonyManager" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 116, @"Invalid parameter not satisfying: %@", @"ringerControl" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_11:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 118, @"Invalid parameter not satisfying: %@", @"conferenceManager" object file lineNumber description];

LABEL_5:
  v27.receiver = self;
  v27.super_class = (Class)SBVolumeControl;
  v16 = [(SBVolumeControl *)&v27 init];
  if (v16)
  {
    uint64_t v17 = +[SBElasticHUDDomain rootSettings];
    elasticHUDSettings = v16->_elasticHUDSettings;
    v16->_elasticHUDSettings = (SBElasticHUDSettings *)v17;

    [(PTSettings *)v16->_elasticHUDSettings addKeyObserver:v16];
    objc_storeStrong((id *)&v16->_hudController, a3);
    objc_storeStrong((id *)&v16->_ringerControl, a4);
    objc_storeStrong((id *)&v16->_telephonyManager, a5);
    objc_storeStrong((id *)&v16->_conferenceManager, a6);
    v16->_unint64_t mode = 0;
    uint64_t v19 = +[SBAVSystemControllerCache sharedInstance];
    avCache = v16->_avCache;
    v16->_avCache = (SBAVSystemControllerCache *)v19;

    *(_WORD *)&v16->_volumeDownButtonIsDown = 0;
    [(SBVolumeControl *)v16 _resetMediaServerConnection];
    v16->_effectiveVolumeLock._os_unfair_lock_opaque = 0;
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v16 selector:sel__effectiveVolumeChanged_ name:*MEMORY[0x1E4F74B88] object:0];
    [v21 addObserver:v16 selector:sel__serverConnectionDied_ name:*MEMORY[0x1E4F74E30] object:0];
    [v21 addObserver:v16 selector:sel__someSceneWillConnect_ name:*MEMORY[0x1E4F43C98] object:0];
  }
  return v16;
}

- (float)volumeStepUp
{
  [(SBElasticHUDSettings *)self->_elasticHUDSettings volumeStepDelta];
  return result;
}

- (float)volumeStepDown
{
  [(SBElasticHUDSettings *)self->_elasticHUDSettings volumeStepDelta];
  return result;
}

- (BOOL)canChangeVolumeForActiveCategory:(id)a3 isAudioSessionPlaying:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"FindMyPhone"]) {
    char v6 = !a4;
  }
  else {
    char v6 = [(id)objc_opt_class() _isVolumeManagedForCategory:v5];
  }

  return v6;
}

- (void)addAlwaysHiddenCategory:(id)a3
{
  char v4 = (__CFString *)a3;
  id v5 = v4;
  if (!v4 || (v10 = v4, uint64_t v6 = [(__CFString *)v4 length], v5 = v10, !v6))
  {

    id v5 = @"com.apple.springboard.volumeControl.HUDCategories.all";
  }
  alwaysHiddenCategories = self->_alwaysHiddenCategories;
  BOOL v11 = v5;
  if (!alwaysHiddenCategories)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unsigned int v9 = self->_alwaysHiddenCategories;
    self->_alwaysHiddenCategories = v8;

    id v5 = v11;
    alwaysHiddenCategories = self->_alwaysHiddenCategories;
  }
  [(NSMutableSet *)alwaysHiddenCategories addObject:v5];
}

- (void)toggleMute
{
  if (MGGetBoolAnswer())
  {
    MGGetBoolAnswer();
LABEL_3:
    BOOL v3 = [(SBAVSystemControllerCache *)self->_avCache isFullyMuted];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __29__SBVolumeControl_toggleMute__block_invoke;
    v5[3] = &__block_descriptor_33_e28_v16__0__AVSystemController_8l;
    BOOL v6 = !v3;
    [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v5];
    return;
  }
  int v4 = MGGetBoolAnswer();
  if (!MGGetBoolAnswer() || v4) {
    goto LABEL_3;
  }
}

void __29__SBVolumeControl_toggleMute__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithBool:v3];
  [v4 setAttribute:v5 forKey:*MEMORY[0x1E4F74BD0] error:0];
}

- (float)_effectiveVolume
{
  p_effectiveVolumeLock = &self->_effectiveVolumeLock;
  os_unfair_lock_lock(&self->_effectiveVolumeLock);
  float effectiveVolume = self->_effectiveVolume;
  os_unfair_lock_unlock(p_effectiveVolumeLock);
  return effectiveVolume;
}

- (void)setVolume:(float)a3 forCategory:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    unsigned int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 225, @"Invalid parameter not satisfying: %@", @"category" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__SBVolumeControl_setVolume_forCategory___block_invoke;
  v10[3] = &unk_1E6AF7D68;
  float v12 = a3;
  id v11 = v7;
  id v8 = v7;
  [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v10];
}

uint64_t __41__SBVolumeControl_setVolume_forCategory___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  return [a2 setVolumeTo:*(void *)(a1 + 32) forCategory:a3];
}

- (void)increaseVolume
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [(SBVolumeControl *)self _buttonRepeatDelay];
  float v4 = v3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  [(SBVolumeControl *)self volumeStepUp];
  -[SBVolumeControl changeVolumeByDelta:](self, "changeVolumeByDelta:");
  v6[0] = *MEMORY[0x1E4F1C4B0];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(SBVolumeControl *)self performSelector:sel_increaseVolume withObject:0 afterDelay:v5 inModes:v4];

  self->_debounce = 0;
}

- (void)decreaseVolume
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [(SBVolumeControl *)self _buttonRepeatDelay];
  float v4 = v3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
  [(SBVolumeControl *)self volumeStepDown];
  *(float *)&double v6 = -v5;
  [(SBVolumeControl *)self changeVolumeByDelta:v6];
  v8[0] = *MEMORY[0x1E4F1C4B0];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(SBVolumeControl *)self performSelector:sel_decreaseVolume withObject:0 afterDelay:v7 inModes:v4];

  self->_debounce = 0;
}

- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = +[SBLockScreenManager sharedInstance];
  int v8 = [v7 isUILocked];
  unsigned int v9 = [(SBVolumeControl *)self presentedVolumeHUDViewController];
  if (a3 == 103)
  {
    float v12 = SBLogButtonsVolume();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = "up";
      if (v4) {
        id v13 = "down";
      }
      *(_DWORD *)buf = 136446210;
      objc_super v27 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBVolumeControl -- volume decrement -- button state: %{public}s", buf, 0xCu);
    }

    if (v4)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
      self->_BOOL volumeDownButtonIsDown = 1;
      self->_debounce = 1;
      [(SBVolumeControl *)self decreaseVolume];
    }
    else
    {
      self->_BOOL volumeDownButtonIsDown = 0;
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
    }
    if (self->_volumeDownButtonIsDown)
    {
      if (![(SBVolumeControl *)self _isHUDDisplayableForLastEventCategoryWithReason:0])goto LABEL_29; {
      BOOL volumeDownButtonIsDown = self->_volumeDownButtonIsDown;
      }
    }
    else
    {
      BOOL volumeDownButtonIsDown = 0;
    }
    [v9 noteButtonDownWasHit:volumeDownButtonIsDown];
    if (!v8) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  if (a3 == 102)
  {
    int v10 = SBLogButtonsVolume();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = "up";
      if (v4) {
        id v11 = "down";
      }
      *(_DWORD *)buf = 136446210;
      objc_super v27 = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBVolumeControl -- volume increment -- button state: %{public}s", buf, 0xCu);
    }

    if (v4)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
      self->_BOOL volumeUpButtonIsDown = 1;
      self->_debounce = 1;
      [(SBVolumeControl *)self increaseVolume];
    }
    else
    {
      self->_BOOL volumeUpButtonIsDown = 0;
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
    }
    if (self->_volumeUpButtonIsDown)
    {
      if (![(SBVolumeControl *)self _isHUDDisplayableForLastEventCategoryWithReason:0])goto LABEL_29; {
      BOOL volumeUpButtonIsDown = self->_volumeUpButtonIsDown;
      }
    }
    else
    {
      BOOL volumeUpButtonIsDown = 0;
    }
    [v9 noteButtonUpWasHit:volumeUpButtonIsDown];
LABEL_29:
    if (!v8) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  id v14 = SBLogButtonsVolume();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    SB_NSStringFromUIPressType();
    id v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    objc_super v27 = v15;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBVolumeControl -- unknown volume press: %{public}@", buf, 0xCu);
  }
  if (v8)
  {
LABEL_30:
    unint64_t v18 = [v7 lockScreenEnvironment];
    uint64_t v19 = [v18 backlightController];
    char v20 = [v19 isInScreenOffMode];

    if ((v20 & 1) == 0)
    {
      v21 = +[SBIdleTimerGlobalCoordinator sharedInstance];
      uint64_t v22 = NSString;
      v23 = SB_NSStringFromUIPressType();
      v24 = [v22 stringWithFormat:@"SBVolumeButton:%@", v23];
      [v21 resetIdleTimerForReason:v24];
    }
  }
LABEL_34:
  if (!v4)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke;
    v25[3] = &unk_1E6AF7D90;
    v25[4] = self;
    [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v25];
  }
}

void __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__SBVolumeControl_handleVolumeButtonWithType_down___block_invoke_2(uint64_t a1)
{
}

- (void)cancelVolumeEvent
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  float v3 = (void *)MEMORY[0x1E4FBA8A8];
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
}

- (void)removeAlwaysHiddenCategory:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  float v5 = v4;
  if (!v4 || (id v7 = v4, v6 = [(__CFString *)v4 length], v5 = v7, !v6))
  {

    float v5 = @"com.apple.springboard.volumeControl.HUDCategories.all";
  }
  int v8 = v5;
  [(NSMutableSet *)self->_alwaysHiddenCategories removeObject:v5];
}

- (void)clearAlwaysHiddenCategories
{
}

- (id)existingVolumeHUDViewController
{
  v2 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  float v3 = [v2 HUDViewController];

  return v3;
}

- (void)hideVolumeHUDIfVisible
{
  id v2 = [(SBHUDController *)self->_hudController presentedHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  [v2 dismiss];
}

- (id)acquireVolumeHUDHiddenAssertionForReason:(id)a3
{
  id v4 = a3;
  [(SBVolumeControl *)self cancelVolumeEvent];
  float v5 = [(SBHUDController *)self->_hudController acquireHUDHiddenAssertionForIdentifier:*MEMORY[0x1E4FA7058] withReason:v4];

  return v5;
}

- (void)setActiveCategoryVolume:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__SBVolumeControl_setActiveCategoryVolume___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__AVSystemController_8l;
  float v4 = a3;
  [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v3];
}

uint64_t __43__SBVolumeControl_setActiveCategoryVolume___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setActiveCategoryVolumeTo:a3];
}

- (void)setControlCenterController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterController);
  if (WeakRetained != obj)
  {
    [WeakRetained removeObserver:self];
    objc_storeWeak((id *)&self->_controlCenterController, obj);
    [obj addObserver:self];
  }
}

- (void)_setMediaVolumeForIAP:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__SBVolumeControl__setMediaVolumeForIAP___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__AVSystemController_8l;
  float v4 = a3;
  [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v3];
}

void __41__SBVolumeControl__setMediaVolumeForIAP___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 volumeCategoryForAudioCategory:@"MediaPlayback"];
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  [v3 setVolumeTo:v5 forCategory:v4];
}

- (float)_getMediaVolumeForIAP
{
  uint64_t v5 = 0;
  uint64_t v6 = (float *)&v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SBVolumeControl__getMediaVolumeForIAP__block_invoke;
  v4[3] = &unk_1E6AF7DD8;
  v4[4] = &v5;
  [(SBVolumeControl *)self _dispatchAVSystemControllerSync:v4];
  float v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__SBVolumeControl__getMediaVolumeForIAP__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 volumeCategoryForAudioCategory:@"MediaPlayback"];
  [v3 getVolume:*(void *)(*(void *)(a1 + 32) + 8) + 24 forCategory:v4];
}

- (BOOL)_isCategoryAlwaysHidden:(id)a3
{
  if ([(NSMutableSet *)self->_alwaysHiddenCategories containsObject:a3]) {
    return 1;
  }
  alwaysHiddenCategories = self->_alwaysHiddenCategories;
  return [(NSMutableSet *)alwaysHiddenCategories containsObject:@"com.apple.springboard.volumeControl.HUDCategories.all"];
}

+ (BOOL)_isVolumeChangeAllowedForState:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_13;
  }
  if ([v6 isLocked]
    && ([v7 isHostingAppOnLockScreen] & 1) == 0
    && ([v7 isAudioPlayingSomewhere] & 1) == 0
    && ([v7 isCallOrFaceTimeActive] & 1) == 0
    && ([v7 isShowingLockScreenMediaControls] & 1) == 0)
  {
    if (!a4) {
      goto LABEL_13;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v20[0] = @"state";
    v20[1] = v17;
    v21[0] = v7;
    v21[1] = @"SpringBoard can't change the volume because the device is locked, no app is being hosted on the lock screen, and no audio is playing anywhere.";
    float v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v13 = v16;
    uint64_t v14 = 1;
LABEL_12:
    *a4 = [v13 errorWithDomain:@"com.apple.springboard.volumeControl.state" code:v14 userInfo:v12];

LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  if ([v7 currentRouteHasVolumeControl])
  {
    BOOL v8 = 1;
    goto LABEL_14;
  }
  char v9 = [v7 isFullyMuted];
  BOOL v8 = v9;
  if (a4 && (v9 & 1) == 0)
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v18[0] = @"state";
    v18[1] = v11;
    v19[0] = a1;
    v19[1] = @"SpringBoard can change the volume only if the current route has volume control, or if we're fully muted..";
    float v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v13 = v10;
    uint64_t v14 = 2;
    goto LABEL_12;
  }
LABEL_14:

  return v8;
}

- (void)changeVolumeByDelta:(float)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [NSString stringWithUTF8String:"-[SBVolumeControl changeVolumeByDelta:]"];
    [v22 handleFailureInFunction:v23 file:@"SBVolumeControl.m" lineNumber:538 description:@"this call must be made on the main thread"];
  }
  ++changeVolumeByDelta__volumeChangeSessionId;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [v5 description];

  uint64_t v7 = +[SBLockScreenManager sharedInstanceIfExists];
  if (v7)
  {
    BOOL v8 = +[SBCoverSheetPresentationManager sharedInstance];
    char v9 = [(id)SBApp authenticationController];
    [(SBVolumeControl *)self _effectiveVolume];
    if (!self->_debounce)
    {
      float v11 = v10;
      if ((BSFloatLessThanOrEqualToFloat() & 1) == 0 && (BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
      {
        float v12 = [(SBVolumeControl *)self presentedVolumeHUDViewController];
        *(float *)&double v13 = fminf(fmaxf(v11 + a3, 0.0), 1.0);
        [v12 noteValueWillDeltaStepToValue:v13];
      }
    }
    if ([v7 isUILocked])
    {
      if (![v9 isAuthenticated])
      {
        char v14 = 1;
        goto LABEL_16;
      }
      if (([v9 hasPasscodeSet] & 1) == 0)
      {
        char v14 = [v8 hasBeenDismissedSinceKeybagLock] ^ 1;
        goto LABEL_16;
      }
    }
    char v14 = 0;
LABEL_16:
    id v15 = [v7 lockScreenEnvironment];
    v16 = [v15 applicationHoster];
    char v17 = [v16 isHostingAnApp];

    unint64_t v18 = [v7 lockScreenEnvironment];
    uint64_t v19 = [v18 mediaControlsPresenter];
    char v20 = [v19 isShowingMediaControls];

    BOOL v21 = [(SBTelephonyManager *)self->_telephonyManager inCall]
       || [(SBConferenceManager *)self->_conferenceManager inFaceTime];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__SBVolumeControl_changeVolumeByDelta___block_invoke;
    v24[3] = &unk_1E6AF7E28;
    v24[4] = self;
    id v25 = v6;
    float v26 = a3;
    BOOL v27 = v21;
    char v28 = v14;
    char v29 = v17;
    char v30 = v20;
    [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v24];

    goto LABEL_20;
  }
  BOOL v8 = SBLogAudioControl();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(SBVolumeControl *)(uint64_t)v6 changeVolumeByDelta:a3];
  }
LABEL_20:
}

void __39__SBVolumeControl_changeVolumeByDelta___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v5 = [v4 activeCategoryName];
  uint64_t v6 = [v4 isAudioSessionPlaying];
  if ([*(id *)(a1 + 32) canChangeVolumeForActiveCategory:v5 isAudioSessionPlaying:v6])
  {
    uint64_t v7 = objc_alloc_init(SBVolumeControlState);
    [(SBVolumeControlState *)v7 setAudioPlayingSomewhere:v6];
    [(SBVolumeControlState *)v7 setCallOrFaceTimeActive:*(unsigned __int8 *)(a1 + 52)];
    -[SBVolumeControlState setFullyMuted:](v7, "setFullyMuted:", [v4 isFullyMuted]);
    -[SBVolumeControlState setRingerMuted:](v7, "setRingerMuted:", -[SBRingerControl isRingerMuted](*(void *)(*(void *)(a1 + 32) + 24)));
    -[SBVolumeControlState setCurrentRouteHasVolumeControl:](v7, "setCurrentRouteHasVolumeControl:", [v3 currentRouteHasVolumeControl]);
    [(SBVolumeControlState *)v7 setActiveVolumeCategoryName:v5];
    [(SBVolumeControlState *)v7 setLocked:*(unsigned __int8 *)(a1 + 53)];
    [(SBVolumeControlState *)v7 setHostingAppOnLockScreen:*(unsigned __int8 *)(a1 + 54)];
    [(SBVolumeControlState *)v7 setShowingLockScreenMediaControls:*(unsigned __int8 *)(a1 + 55)];
    id v27 = 0;
    char v8 = [(id)objc_opt_class() _isVolumeChangeAllowedForState:v7 error:&v27];
    char v9 = (SBVolumeControlState *)v27;
    id v10 = v5;
    if (([v10 isEqualToString:@"Audio/Video"] & 1) != 0
      || ([v10 isEqualToString:@"PhoneCall"] & 1) != 0
      || ([v10 isEqualToString:@"Ringtone"] & 1) == 0
      && ([v10 isEqualToString:@"RingtonePreview"] & 1) == 0)
    {
    }
    else
    {

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__SBVolumeControl_changeVolumeByDelta___block_invoke_123;
      block[3] = &unk_1E6AF7E00;
      block[4] = *(void *)(a1 + 32);
      int v26 = *(_DWORD *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    char v14 = SBLogAudioControl();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v15)
      {
        uint64_t v16 = *(void *)(a1 + 40);
        double v17 = *(float *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v29 = v16;
        __int16 v30 = 2048;
        double v31 = v17;
        __int16 v32 = 2114;
        v33 = v7;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Attempting to change volume by delta %f for state '%{public}@'", buf, 0x20u);
      }

      if (([v3 changeActiveCategoryVolume:*(float *)(a1 + 48) > 0.0] & 1) == 0)
      {
        char v14 = SBLogAudioControl();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __39__SBVolumeControl_changeVolumeByDelta___block_invoke_cold_1(a1, (float *)(a1 + 48), v14);
        }
        goto LABEL_22;
      }
      char v14 = SBLogAudioControl();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        double v24 = *(float *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v23;
        __int16 v30 = 2048;
        double v31 = v24;
        char v20 = "(%{public}@)Volume Change by delta '%f' was Accepted";
        BOOL v21 = v14;
        uint32_t v22 = 22;
        goto LABEL_19;
      }
    }
    else if (v15)
    {
      uint64_t v18 = *(void *)(a1 + 40);
      double v19 = *(float *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v18;
      __int16 v30 = 2048;
      double v31 = v19;
      __int16 v32 = 2114;
      v33 = v9;
      char v20 = "(%{public}@)Volume Change by delta '%f' was Denied; reason: %{public}@";
      BOOL v21 = v14;
      uint32_t v22 = 32;
LABEL_19:
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
LABEL_22:

    goto LABEL_23;
  }
  SBLogAudioControl();
  uint64_t v7 = (SBVolumeControlState *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    double v12 = *(float *)(a1 + 48);
    double v13 = (SBVolumeControlState *)[v5 copy];
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v11;
    __int16 v30 = 2048;
    double v31 = v12;
    __int16 v32 = 2114;
    v33 = v13;
    _os_log_impl(&dword_1D85BA000, &v7->super, OS_LOG_TYPE_DEFAULT, "(%{public}@)Volume Change by delta '%f' was Denied; reason: active category '%{public}@' is not managed by SBVolumeControl",
      buf,
      0x20u);
  }
LABEL_23:
}

void __39__SBVolumeControl_changeVolumeByDelta___block_invoke_123(uint64_t a1)
{
}

- (float)_buttonRepeatDelay
{
  return flt_1D8FD07A0[!self->_debounce];
}

- (void)_presentVolumeHUDWithVolume:(float)a3
{
  if (self->_mode == 3) {
    return;
  }
  uint64_t v5 = *MEMORY[0x1E4FA7058];
  uint64_t v6 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  uint64_t v7 = [v6 HUDViewController];
  if (v6)
  {
    char v8 = v6;
  }
  else
  {
    char v9 = +[SBElasticValueViewControllerFactory factoryWithVolumeDataSource:self];
    id v10 = [[SBElasticHUDViewController alloc] initWithFactory:v9];

    [(SBElasticHUDViewController *)v10 setDelegate:self];
    [(SBVolumeControl *)self _configureVolumeStepDeltaForVolumeHUDViewController:v10];
    id v12 = [(SBHUDController *)self->_hudController HUDSessionForViewController:v10 identifier:v5];

    char v8 = v12;
    uint64_t v7 = v10;
  }
  id v13 = v8;
  [v8 presentWithDismissalInterval:0 animated:60.0];
  *(float *)&double v11 = a3;
  [v7 noteValueDidChange:v11];
  if (!v6)
  {
    if (self->_volumeUpButtonIsDown)
    {
      if (!self->_volumeDownButtonIsDown) {
        goto LABEL_11;
      }
    }
    else if (!self->_volumeDownButtonIsDown)
    {
      goto LABEL_12;
    }
    [v7 noteButtonDownWasHit:1];
    if (self->_volumeUpButtonIsDown) {
LABEL_11:
    }
      [v7 noteButtonUpWasHit:1];
  }
LABEL_12:
}

- (void)_configureVolumeStepDeltaForVolumeHUDViewController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  float v12 = 0.0;
  id v4 = (void *)MEMORY[0x1E4F74F68];
  id v5 = a3;
  uint64_t v6 = [v4 sharedInstance];
  int v7 = [v6 getVolumeButtonDelta:0 outVolumeDelta:&v12];

  float v8 = v12;
  char v9 = SBLogAudioControl();
  id v10 = v9;
  if (v7 || v8 <= 0.0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(SBVolumeControl *)&v12 _configureVolumeStepDeltaForVolumeHUDViewController:v10];
    }

    [(SBElasticHUDSettings *)self->_elasticHUDSettings volumeStepDelta];
    float v12 = v11;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Configuring volume HUD with volume delta: %f", buf, 0xCu);
    }

    float v11 = v12;
  }
  [v5 setButtonStepCount:vcvtas_u32_f32(1.0 / v11)];
}

- (BOOL)_isVolumeHUDVisible
{
  float v2 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isVisible];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_someSceneWillConnect:(id)a3
{
  id v12 = a3;
  id v5 = [v12 object];
  uint64_t v6 = [(SBHUDController *)self->_hudController windowScene];
  int v7 = (void *)v6;
  if (!v5 || v5 != (void *)v6)
  {
LABEL_5:

    return;
  }
  float v8 = [v5 zStackResolver];
  if (v8)
  {
    char v9 = v8;
    id v10 = [v8 addObserver:self ofParticipantWithIdentifier:30];
    [(SBVolumeControl *)self _processZStackParticipantSettings:v10];

    goto LABEL_5;
  }
  float v11 = [NSString stringWithFormat:@"The connected window scene should have a zStackResolver"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBVolumeControl *)a2 _someSceneWillConnect:(uint64_t)v11];
  }
  [v11 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_resetMediaServerConnection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__SBVolumeControl__resetMediaServerConnection__block_invoke;
  v2[3] = &unk_1E6AF7D90;
  v2[4] = self;
  [(SBVolumeControl *)self _dispatchAVSystemControllerAsync:v2];
}

void __46__SBVolumeControl__resetMediaServerConnection__block_invoke(uint64_t a1, void *a2)
{
  int v8 = 0;
  id v3 = a2;
  [v3 getActiveCategoryVolume:&v8 andName:0];
  LODWORD(v4) = v8;
  [*(id *)(a1 + 32) _updateEffectiveVolume:v4];
  int v7 = 0;
  [v3 getVolume:&v7 forCategory:@"Ringtone"];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SBVolumeControl__resetMediaServerConnection__block_invoke_2;
  block[3] = &unk_1E6AF7E00;
  block[4] = *(void *)(a1 + 32);
  int v6 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__SBVolumeControl__resetMediaServerConnection__block_invoke_2(uint64_t a1)
{
}

- (id)_avscOperationsQueue
{
  avscOperationsQueue = self->_avscOperationsQueue;
  if (!avscOperationsQueue)
  {
    id v5 = [(SBAVSystemControllerCache *)self->_avCache avscOperationsWorkloop];
    if (!v5)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBVolumeControl.m" lineNumber:843 description:@"Must use the AVSC cache's target workloop"];
    }
    int v6 = [MEMORY[0x1E4F4F730] serial];
    int v7 = [v6 serviceClass:25 relativePriority:1];
    int v8 = [v7 targetQueue:v5];

    char v9 = (OS_dispatch_queue *)BSDispatchQueueCreate();
    id v10 = self->_avscOperationsQueue;
    self->_avscOperationsQueue = v9;

    avscOperationsQueue = self->_avscOperationsQueue;
  }
  return avscOperationsQueue;
}

- (void)_dispatchAVSystemControllerAsync:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 851, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  int v6 = [(SBVolumeControl *)self _avscOperationsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SBVolumeControl__dispatchAVSystemControllerAsync___block_invoke;
  block[3] = &unk_1E6AF5300;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __52__SBVolumeControl__dispatchAVSystemControllerAsync___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_dispatchAVSystemControllerSync:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBVolumeControl.m", 858, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  int v6 = [(SBVolumeControl *)self _avscOperationsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBVolumeControl__dispatchAVSystemControllerSync___block_invoke;
  block[3] = &unk_1E6AF5300;
  id v10 = v5;
  id v7 = v5;
  dispatch_async_and_wait(v6, block);
}

void __51__SBVolumeControl__dispatchAVSystemControllerSync___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)controlCenterWillPresent
{
  id v2 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  [v2 dismiss];
}

- (BOOL)elasticValueViewController:(id)a3 updateCurrentValue:(float)a4
{
  return 1;
}

- (BOOL)elasticHUDViewControllerCanBePresented:(id)a3 withReason:(id *)a4
{
  return [(SBVolumeControl *)self _isHUDDisplayableWithReason:a4];
}

- (void)elasticHUDViewControllerRequestsDismissal:(id)a3
{
  id v3 = [(SBHUDController *)self->_hudController presentedHUDControllerForIdentifier:*MEMORY[0x1E4FA7058]];
  [v3 dismissAnimated:0];
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlCenterController);
  objc_storeStrong((id *)&self->_lastDisplayedCategory, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_avscOperationsQueue, 0);
  objc_storeStrong((id *)&self->_lastEventCategory, 0);
  objc_storeStrong((id *)&self->_alwaysHiddenCategories, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_conferenceManager, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_elasticHUDSettings, 0);
  objc_storeStrong((id *)&self->_hudController, 0);
}

- (void)changeVolumeByDelta:(float)a3 .cold.1(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "(%{public}@)Volume Change by delta '%f' was Denied; reason: SBLockScreenManager not initialized",
    (uint8_t *)&v3,
    0x16u);
}

double __39__SBVolumeControl_changeVolumeByDelta___block_invoke_cold_1(uint64_t a1, float *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *a2;
  int v6 = 138543874;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  double v9 = v4;
  __int16 v10 = 2114;
  float v11 = @"Active Category volume change came back false.";
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "(%{public}@)Volume Change by delta '%f' was Denied; reason: %{public}@",
    (uint8_t *)&v6,
    0x20u);
  return result;
}

- (double)_configureVolumeStepDeltaForVolumeHUDViewController:(os_log_t)log .cold.1(float *a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = *a1;
  int v5 = 134218240;
  double v6 = v3;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve valid volume delta (%f) with result: %d", (uint8_t *)&v5, 0x12u);
  return result;
}

- (void)_someSceneWillConnect:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  __int16 v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  float v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBVolumeControl.m";
  __int16 v16 = 1024;
  int v17 = 724;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end