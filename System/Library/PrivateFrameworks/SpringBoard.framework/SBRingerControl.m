@interface SBRingerControl
- (BOOL)_accessibilityIsRingerMuted;
- (BOOL)_isRingerUIDisplayableWithReason:(void *)a1;
- (SBControlCenterController)controlCenterController;
- (double)volume;
- (id)_avscOperationsQueue;
- (id)_ringerUICoordinator;
- (id)bannerManager;
- (id)initWithBannerManager:(void *)a3 soundController:;
- (id)observeRingerMutedWithBlock:(id)a3;
- (id)previewRingerStateForReason:(id)a3;
- (id)soundForRingerMuted:(BOOL)a3;
- (uint64_t)_handleRingerAlertPreviewingEvent:(uint64_t)result;
- (uint64_t)isRingerHUDVisible;
- (uint64_t)isRingerMuted;
- (uint64_t)setVolume:(uint64_t)result;
- (void)_avsc_setRingerMuted:(void *)a3 reason:(int)a4 clientType:;
- (void)_dismissRingerAlertElement:(void *)a3 forReason:;
- (void)_dismissRingerHUDViewController:(void *)a3 forReason:;
- (void)_playSoundForRingerMuted:(void *)a1;
- (void)_setRingerMuted:(uint64_t)a1;
- (void)_updateRingerAlertPreviewingState;
- (void)activateRingerHUD:(uint64_t)a3 withInitialVolume:(uint64_t)a4 fromSource:(float)a5 forPreviewing:;
- (void)activateRingerHUDForMuteChange:(uint64_t)a1;
- (void)activateRingerHUDForMuteChange:(uint64_t)a3 forPreviewing:;
- (void)activateRingerHUDForVolumeChangeWithInitialVolume:(uint64_t)a1;
- (void)buttonReleased;
- (void)cache:(id)a3 didUpdateRingerMuted:(BOOL)a4;
- (void)completeSetupWithRingerMuted:(BOOL)a3;
- (void)controlCenterWillPresent;
- (void)dismissRingerHUD;
- (void)nudgeUp:(id *)a1;
- (void)ringerAlertElementWantsToBeDismissed:(id)a3 forReason:(id)a4;
- (void)ringerAlertElementWantsToBePresented:(id)a3;
- (void)ringerAlertElementWantsToResetAutomaticInvalidationTimer:(id)a3;
- (void)ringerHUDViewControllerWantsToBeDismissed:(id)a3;
- (void)ringerHUDViewControllerWantsToBePresented:(id)a3;
- (void)setControlCenterController:(id)a3;
- (void)setRingerMuted:(BOOL)a3 withFeedback:(BOOL)a4 reason:(id)a5 clientType:(unsigned int)a6;
- (void)setRingerMuted:(uint64_t)a3 reason:;
- (void)setVolume:(float)a3 forKeyPress:;
@end

@implementation SBRingerControl

- (id)initWithBannerManager:(void *)a3 soundController:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!a1) {
    goto LABEL_6;
  }
  if (v5)
  {
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel_initWithBannerManager_soundController_, a1, @"SBRingerControl.m", 68, @"Invalid parameter not satisfying: %@", @"bannerManager" object file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:sel_initWithBannerManager_soundController_, a1, @"SBRingerControl.m", 69, @"Invalid parameter not satisfying: %@", @"soundController" object file lineNumber description];

LABEL_4:
  v14.receiver = a1;
  v14.super_class = (Class)SBRingerControl;
  v8 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v8;
  if (v8)
  {
    objc_storeWeak(v8 + 4, v5);
    objc_storeStrong(a1 + 5, a3);
    uint64_t v9 = +[SBAVSystemControllerCache sharedInstance];
    id v10 = a1[1];
    a1[1] = (id)v9;

    [a1[1] addObserver:a1];
    *((unsigned char *)a1 + 24) = 1;
  }
LABEL_6:

  return a1;
}

- (void)completeSetupWithRingerMuted:(BOOL)a3
{
  self->_ringerMuted = !a3;
  -[SBRingerControl _setRingerMuted:]((uint64_t)self, a3);
}

- (void)_setRingerMuted:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned __int8 *)(a1 + 24) != a2)
  {
    v4 = SBLogRingerHUD();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 24);
      v10[0] = 67109376;
      v10[1] = v5;
      __int16 v11 = 1024;
      int v12 = a2;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBRingerControl _setRingerMuted: %{BOOL}u -> %{BOOL}u", (uint8_t *)v10, 0xEu);
    }

    *(unsigned char *)(a1 + 24) = a2;
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = [NSNumber numberWithBool:a2];
    v8 = [v6 dictionaryWithObject:v7 forKey:@"SBRingerChangedRingerMutedUserInfoKey"];

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"SBRingerChangedNotification" object:0 userInfo:v8];
  }
}

- (void)setRingerMuted:(uint64_t)a3 reason:
{
  if (a1) {
    return (void *)[a1 setRingerMuted:a2 withFeedback:1 reason:a3 clientType:1];
  }
  return a1;
}

- (void)setRingerMuted:(BOOL)a3 withFeedback:(BOOL)a4 reason:(id)a5 clientType:(unsigned int)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  if (v7) {
    -[SBRingerControl _playSoundForRingerMuted:](self, v8);
  }
  -[SBRingerControl _avsc_setRingerMuted:reason:clientType:]((id *)&self->super.isa, v8, v10, a6);
}

- (void)_playSoundForRingerMuted:(void *)a1
{
  if (a1)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        return;
      }
    }
    else
    {
      int v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 == 1) {
        return;
      }
    }
    v4 = (void *)a1[5];
    id v7 = [a1 soundForRingerMuted:a2];
    [v4 playSoundWithDefaultEnvironment:v7];
  }
}

- (void)_avsc_setRingerMuted:(void *)a3 reason:(int)a4 clientType:
{
  id v7 = a3;
  BOOL v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__avsc_setRingerMuted_reason_clientType_, a1, @"SBRingerControl.m", 425, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
    }
    uint64_t v9 = -[SBRingerControl _avscOperationsQueue](a1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SBRingerControl__avsc_setRingerMuted_reason_clientType___block_invoke;
    block[3] = &unk_1E6AF7A98;
    char v14 = a2;
    id v12 = v8;
    int v13 = a4;
    dispatch_async(v9, block);
  }
}

- (uint64_t)isRingerMuted
{
  if (result) {
    return [*(id *)(result + 8) isRingerMuted];
  }
  return result;
}

- (uint64_t)isRingerHUDVisible
{
  uint64_t v1 = a1;
  if (a1)
  {
    unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v1 = (WeakRetained | *(void *)(v1 + 64)) != 0;
  }
  return v1;
}

- (void)activateRingerHUDForMuteChange:(uint64_t)a1
{
  if (a1) {
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, a2 ^ 1u, 0, 0, -1.0);
  }
}

- (void)activateRingerHUDForMuteChange:(uint64_t)a3 forPreviewing:
{
  if (a1) {
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, a2 ^ 1u, 0, a3, -1.0);
  }
}

- (void)activateRingerHUD:(uint64_t)a3 withInitialVolume:(uint64_t)a4 fromSource:(float)a5 forPreviewing:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v10 = SBLogRingerHUD();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = @"tone";
      if (!a2) {
        __int16 v11 = @"silent";
      }
      *(_DWORD *)buf = 138543362;
      v32 = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBRingerControl activateRingerHUD: %{public}@", buf, 0xCu);
    }

    v28 = 0;
    BOOL v12 = -[SBRingerControl _isRingerUIDisplayableWithReason:]((void *)a1, &v28);
    int v13 = v28;
    if (!v12)
    {
      v17 = SBLogRingerHUD();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v13;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "SBRingerControl HUD is not displayable; %{public}@",
          buf,
          0xCu);
      }

      -[SBRingerControl dismissRingerHUD](a1);
      goto LABEL_51;
    }
    BOOL v14 = +[SBSoundPreferences vibrateWhenSilent];
    BOOL v15 = +[SBSoundPreferences vibrateWhenRinging];
    v16 = +[SBLockScreenManager sharedInstance];
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
        if (([v16 isUILocked] & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_20;
      }
      if (!v14 && !v15 && [v16 isUILocked])
      {
LABEL_20:
        v29 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
        v18 = [NSNumber numberWithBool:1];
        v30 = v18;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        [v16 unlockUIFromSource:16 withOptions:v20];

LABEL_21:
      }
    }
    else
    {
      v18 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v18 userInterfaceIdiom] != 1 && (v14 || v15)) {
        goto LABEL_21;
      }
      char v19 = [v16 isUILocked];

      if (v19) {
        goto LABEL_20;
      }
    }
LABEL_22:
    BOOL v21 = 1;
    uint64_t v22 = SBFEffectiveArtworkSubtype();
    if (v22 > 2795)
    {
      if (v22 != 2868 && v22 != 2796) {
        goto LABEL_32;
      }
    }
    else if (v22 != 2556 && v22 != 2622)
    {
      goto LABEL_32;
    }
    v23 = (SBRingerAlertElement *)*(id *)(a1 + 64);
    BOOL v21 = v23 != 0;
    if (v23)
    {
      unint64_t WeakRetained = v23;
      if ([(SBRingerAlertElement *)v23 source] != a3)
      {
        -[SBRingerControl _dismissRingerAlertElement:forReason:](a1, WeakRetained, @"Ringer source has changed");
        -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, a2, a3, a4, a5);
LABEL_50:

LABEL_51:
        return;
      }
      [(SBRingerAlertElement *)WeakRetained setActivatedForPreviewing:a4];
LABEL_34:
      if ([(SBRingerAlertElement *)WeakRetained isPresented])
      {
        if (![(SBRingerAlertElement *)WeakRetained isPresented])
        {
LABEL_41:
          if (a5 <= 0.0) {
            a5 = *(float *)(a1 + 28);
          }
          [(SBRingerAlertElement *)WeakRetained setRingerSilent:a2 == 0];
          if (!v21)
          {
            *(float *)&double v26 = a5;
            [(SBRingerAlertElement *)WeakRetained setVolume:0 animated:a3 == 1 forKeyPress:v26];
          }
          if (a3) {
            uint64_t v27 = 0;
          }
          else {
            uint64_t v27 = a4 ^ 1;
          }
          [(SBRingerAlertElement *)WeakRetained presentForMuteChange:v27];
          goto LABEL_50;
        }
        unsigned int v25 = (a2 == 0) ^ [(SBRingerAlertElement *)WeakRetained isRingerSilent] ^ 1;
      }
      else
      {
        LOBYTE(v25) = 0;
      }
      if (a3 == 1 && (v25 & 1) == 0) {
        -[SBRingerControl _playSoundForRingerMuted:]((void *)a1, a2 == 0);
      }
      goto LABEL_41;
    }
    unint64_t WeakRetained = [[SBRingerAlertElement alloc] initWithSource:a3 ringerSilent:a2 == 0 forPreviewing:a4];
    objc_storeStrong((id *)(a1 + 64), WeakRetained);
    [(SBRingerAlertElement *)WeakRetained setDelegate:a1];
    if (WeakRetained) {
      goto LABEL_34;
    }
LABEL_32:
    unint64_t WeakRetained = (SBRingerAlertElement *)objc_loadWeakRetained((id *)(a1 + 48));
    if (!WeakRetained)
    {
      unint64_t WeakRetained = [[SBRingerHUDViewController alloc] initWithActivatedForPreviewing:a4];
      objc_storeWeak((id *)(a1 + 48), WeakRetained);
      [(SBRingerAlertElement *)WeakRetained setDelegate:a1];
      BOOL v21 = 0;
    }
    goto LABEL_34;
  }
}

- (void)activateRingerHUDForVolumeChangeWithInitialVolume:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 8) isRingerMuted] ^ 1;
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, v4, 1, 0, a2);
  }
}

- (BOOL)_isRingerUIDisplayableWithReason:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v3 = [a1 controlCenterController];
  uint64_t v4 = v3;
  if (v3 && [v3 isPresented])
  {
    int v5 = [v4 viewController];
    if ([v5 includesVisiblyUnobscuredModuleWithIdentifier:@"com.apple.control-center.MuteModule"])uint64_t v6 = @"Control Center with visible Mute Module presented"; {
    else
    }
      uint64_t v6 = 0;

    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  if (a2) {
LABEL_10:
  }
    *a2 = v6;
LABEL_11:
  BOOL v7 = v6 == 0;

  return v7;
}

- (void)dismissRingerHUD
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      -[SBRingerControl _dismissRingerHUDViewController:forReason:](a1, WeakRetained, @"SBRingerControlBannerRevocationReasonDismiss");
      id WeakRetained = v6;
    }
    v3 = *(void **)(a1 + 64);
    if (v3)
    {
      id v4 = v3;
      int v5 = NSStringFromSelector(sel_dismissRingerHUD);
      -[SBRingerControl _dismissRingerAlertElement:forReason:](a1, v4, v5);

      id WeakRetained = v6;
    }
  }
}

- (void)_dismissRingerAlertElement:(void *)a3 forReason:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    BOOL v7 = [v5 assertion];
    if ([v7 isValid])
    {
      BOOL v8 = SBLogRingerHUD();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBRingerControl dismiss ringer alert element, reason: %@", (uint8_t *)&v10, 0xCu);
      }

      [v7 invalidateWithReason:v6];
    }
    id v9 = *(id *)(a1 + 64);
    if (v9 == v5)
    {
      *(void *)(a1 + 64) = 0;
    }
  }
}

- (void)nudgeUp:(id *)a1
{
  if (a1)
  {
    -[SBRingerControl _ringerUICoordinator](a1);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 nudgeUp:a2];
  }
}

- (id)_ringerUICoordinator
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v3 = WeakRetained;
    if (!WeakRetained) {
      id v3 = v1[8];
    }
    uint64_t v1 = (id *)v3;
  }
  return v1;
}

- (void)buttonReleased
{
  if (a1)
  {
    -[SBRingerControl _ringerUICoordinator](a1);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    [v1 buttonReleased];
  }
}

- (void)_dismissRingerHUDViewController:(void *)a3 forReason:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    BOOL v7 = SBLogRingerHUD();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBRingerControl _dismissRingerHUDViewController; reason: %@",
        (uint8_t *)&v13,
        0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v9 = (void *)MEMORY[0x1E4F4F5E8];
    int v10 = [v6 requesterIdentifier];

    id v11 = [v9 identificationWithRequesterIdentifier:v10];
    id v12 = (id)[WeakRetained revokePresentablesWithIdentification:v11 reason:v5 options:0 userInfo:0 error:0];
  }
}

- (void)setVolume:(float)a3 forKeyPress:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = SBLogRingerHUD();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      double v10 = a3;
      __int16 v11 = 1024;
      int v12 = a2;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBRingerControl setVolume:%.2f forKeyPress:%{BOOL}d", (uint8_t *)&v9, 0x12u);
    }

    *(float *)(a1 + 28) = a3;
    BOOL v7 = -[SBRingerControl _ringerUICoordinator]((id *)a1);
    LODWORD(v8) = *(_DWORD *)(a1 + 28);
    [v7 setVolume:1 animated:a2 forKeyPress:v8];
  }
}

- (void)cache:(id)a3 didUpdateRingerMuted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = SBLogRingerHUD();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBRingerControl cache:didUpdateRingerMuted:%{BOOL}u", (uint8_t *)v8, 8u);
  }

  -[SBRingerControl _setRingerMuted:]((uint64_t)self, v4);
  if (SBUIHasHIDRingerSwitch())
  {
    if (!self) {
      return;
    }
LABEL_8:
    -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:]((uint64_t)self, v4 ^ 1, 0, 0, -1.0);
    return;
  }
  char v7 = -[SBRingerControl isRingerHUDVisible]((uint64_t)self);
  if (self && (v7 & 1) != 0) {
    goto LABEL_8;
  }
}

- (void)controlCenterWillPresent
{
  if (-[SBRingerControl isRingerHUDVisible]((uint64_t)self)
    && !-[SBRingerControl _isRingerUIDisplayableWithReason:](self, 0))
  {
    -[SBRingerControl dismissRingerHUD]((uint64_t)self);
  }
}

- (void)ringerHUDViewControllerWantsToBePresented:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isActivatedForPreviewing])
  {
    uint64_t v11 = *MEMORY[0x1E4FA7F98];
    v12[0] = &unk_1F3349F08;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    id v5 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bannerManager);
  id v10 = 0;
  char v7 = [WeakRetained postPresentable:v4 withOptions:0 userInfo:v5 error:&v10];

  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = SBLogRingerHUD();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBRingerControl ringerHUDViewControllerWantsToBePresented:](v8, v9);
    }
  }
}

- (void)ringerHUDViewControllerWantsToBeDismissed:(id)a3
{
  id v4 = a3;
  if (([v4 isActivatedForPreviewing] & 1) == 0) {
    -[SBRingerControl _dismissRingerHUDViewController:forReason:]((uint64_t)self, v4, @"SBRingerControlBannerRevocationReasonTimer");
  }
}

- (void)ringerAlertElementWantsToBePresented:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assertion];
  char v6 = [v5 isValid];

  if ((v6 & 1) == 0)
  {
    char v7 = [(id)SBApp systemApertureControllerForMainDisplay];
    id v8 = [v7 registerElement:v4];
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __56__SBRingerControl_ringerAlertElementWantsToBePresented___block_invoke;
    int v12 = &unk_1E6AFFF18;
    objc_copyWeak(&v13, &location);
    [v8 addInvalidationBlock:&v9];
    objc_msgSend(v4, "setAssertion:", v8, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __56__SBRingerControl_ringerAlertElementWantsToBePresented___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBCameraHardwareButton setForegroundPendingRemovalCameraShutterButtonPIDs:]((uint64_t)WeakRetained, 0);
}

- (void)ringerAlertElementWantsToBeDismissed:(id)a3 forReason:(id)a4
{
}

- (void)ringerAlertElementWantsToResetAutomaticInvalidationTimer:(id)a3
{
  id v3 = [a3 alertHost];
  id v4 = [v3 alertAssertion];

  [v4 resetAutomaticInvalidationTimer];
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

- (id)soundForRingerMuted:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1004;
  }
  else {
    uint64_t v3 = 1005;
  }
  return (id)[MEMORY[0x1E4FA79C8] soundWithFeedbackEventType:v3];
}

- (id)previewRingerStateForReason:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    char v6 = v5;
    char v7 = 0;
    uint64_t v8 = SBFEffectiveArtworkSubtype();
    if (v8 > 2795)
    {
      if (v8 != 2868 && v8 != 2796)
      {
LABEL_11:

        return v7;
      }
    }
    else if (v8 != 2556 && v8 != 2622)
    {
      goto LABEL_11;
    }
    objc_initWeak(&location, self);
    compoundPreviewAssertion = self->_compoundPreviewAssertion;
    if (!compoundPreviewAssertion)
    {
      uint64_t v10 = [SBSystemActionCompoundPreviewAssertion alloc];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __47__SBRingerControl_previewRingerStateForReason___block_invoke;
      v17[3] = &unk_1E6AFFF40;
      objc_copyWeak(&v18, &location);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__SBRingerControl_previewRingerStateForReason___block_invoke_2;
      v15[3] = &unk_1E6AFB5B8;
      objc_copyWeak(&v16, &location);
      uint64_t v11 = (SBSystemActionCompoundPreviewAssertion *)-[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v10, @"RingerControl", v17, v15);
      int v12 = self->_compoundPreviewAssertion;
      self->_compoundPreviewAssertion = v11;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      compoundPreviewAssertion = self->_compoundPreviewAssertion;
    }
    char v7 = -[SBSystemActionCompoundPreviewAssertion acquireForReason:]((uint64_t)compoundPreviewAssertion, v6);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBRingerControl *)a2 previewRingerStateForReason:(uint64_t)v14];
  }
  [v14 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __47__SBRingerControl_previewRingerStateForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBRingerControl _updateRingerAlertPreviewingState]((uint64_t)WeakRetained);
}

- (void)_updateRingerAlertPreviewingState
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 64);
    id v10 = v2;
    if (v2)
    {
      uint64_t v3 = [v2 alertHost];
      id WeakRetained = [v3 alertAssertion];

      unsigned int v5 = -[SBSystemActionCompoundPreviewAssertion state](*(void *)(a1 + 56));
      if (v5)
      {
        char v6 = (objc_class *)objc_opt_class();
        char v7 = NSStringFromClass(v6);
        [WeakRetained setAutomaticallyInvalidatable:0 lockingWithKey:v7 reason:@"Previewing"];
      }
      else
      {
        [WeakRetained invalidateWithReason:@"Stop previewing"];
      }
      [v10 setPreviewing:v5 & 1];
      [v10 setUrgent:HIBYTE(v5) & 1];
      [v10 setExpanding:(v5 >> 8) & 1];
      [v10 setProminent:HIWORD(v5) & 1];
    }
    else
    {
      unsigned int v8 = -[SBSystemActionCompoundPreviewAssertion state](*(void *)(a1 + 56));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v9 = [WeakRetained view];
      objc_msgSend(v9, "sb_setInflated:", (v8 >> 8) & 1);

      if (v8)
      {
        -[SBRingerControl activateRingerHUD:withInitialVolume:fromSource:forPreviewing:](a1, [*(id *)(a1 + 8) isRingerMuted] ^ 1, 0, 1, -1.0);
      }
      else if (WeakRetained)
      {
        -[SBRingerControl _dismissRingerHUDViewController:forReason:](a1, WeakRetained, @"SBRingerControlBannerRevocationReasonDismiss");
      }
    }
  }
}

void __47__SBRingerControl_previewRingerStateForReason___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !a3)
  {
    unsigned int v5 = WeakRetained;
    [WeakRetained[8] pop];
    id WeakRetained = v5;
  }
}

- (uint64_t)_handleRingerAlertPreviewingEvent:(uint64_t)result
{
  if (result)
  {
    if (!a2) {
      return [*(id *)(result + 64) pop];
    }
  }
  return result;
}

- (id)observeRingerMutedWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBRingerControl.m", 401, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char v7 = [MEMORY[0x1E4F28F08] mainQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke;
  v17[3] = &unk_1E6AFFF68;
  id v18 = v5;
  id v8 = v5;
  uint64_t v9 = [v6 addObserverForName:@"SBRingerChangedNotification" object:0 queue:v7 usingBlock:v17];

  id v10 = objc_alloc(MEMORY[0x1E4F4F838]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke_2;
  v15[3] = &unk_1E6AF4940;
  id v16 = v9;
  id v11 = v9;
  int v12 = (void *)[v10 initWithIdentifier:@"RingerMuteObservation" forReason:@"ObserverToken" invalidationBlock:v15];

  return v12;
}

uint64_t __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"SBRingerChangedRingerMutedUserInfoKey"];
  [v4 BOOLValue];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void __47__SBRingerControl_observeRingerMutedWithBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
}

- (id)_avscOperationsQueue
{
  if (a1)
  {
    id v2 = a1;
    id v3 = a1[2];
    if (!v3)
    {
      id v4 = [a1[1] avscOperationsWorkloop];
      if (!v4)
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:sel__avscOperationsQueue object:v2 file:@"SBRingerControl.m" lineNumber:417 description:@"Must use the AVSC cache's target workloop"];
      }
      id v5 = [MEMORY[0x1E4F4F730] serial];
      char v6 = [v5 serviceClass:25 relativePriority:2];
      char v7 = [v6 targetQueue:v4];

      uint64_t v8 = BSDispatchQueueCreate();
      id v9 = v2[2];
      v2[2] = (id)v8;

      id v3 = v2[2];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __58__SBRingerControl__avsc_setRingerMuted_reason_clientType___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F74F68] sharedInstance];
  int v3 = [v2 setSilentMode:*(unsigned __int8 *)(a1 + 44) untilTime:0 reason:*(void *)(a1 + 32) clientType:*(unsigned int *)(a1 + 40)];
  id v4 = SBLogRingerHUD();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(a1 + 44);
      int v7 = *(_DWORD *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 67109634;
      int v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Set ringer muted=%{BOOL}u for client '%u' with reason: '%{public}@'", (uint8_t *)&v12, 0x18u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v9 = *(unsigned __int8 *)(a1 + 44);
    int v10 = *(_DWORD *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 67109634;
    int v13 = v9;
    __int16 v14 = 1024;
    int v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_fault_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_FAULT, "Failed to set ringer muted=%{BOOL}u for client '%u' with reason: '%{public}@'", (uint8_t *)&v12, 0x18u);
  }
}

- (id)bannerManager
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (double)volume
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 28);
  return result;
}

- (uint64_t)setVolume:(uint64_t)result
{
  if (result) {
    *(float *)(result + 28) = a2;
  }
  return result;
}

- (SBControlCenterController)controlCenterController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterController);
  return (SBControlCenterController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlCenterController);
  objc_storeStrong((id *)&self->_ringerAlertElement, 0);
  objc_storeStrong((id *)&self->_compoundPreviewAssertion, 0);
  objc_destroyWeak((id *)&self->_ringerHUDViewController);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_destroyWeak((id *)&self->_bannerManager);
  objc_storeStrong((id *)&self->_avscOperationsQueue, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
}

- (BOOL)_accessibilityIsRingerMuted
{
  if (self) {
    LOBYTE(self) = [(SBAVSystemControllerCache *)self->_avCache isRingerMuted];
  }
  return (char)self;
}

- (void)ringerHUDViewControllerWantsToBePresented:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to post Ringer HUD: %@", (uint8_t *)&v4, 0xCu);
}

- (void)previewRingerStateForReason:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  int v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  int v15 = @"SBRingerControl.m";
  __int16 v16 = 1024;
  int v17 = 376;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end