@interface SBIdleTimerDescriptorFactory
+ (id)disabledIdleTimerDescriptor;
- (BOOL)_isIdleDurationForever:(double)a3;
- (BOOL)_shouldUseAttentionSensor;
- (BOOL)sanitizeDescriptorForLockscreenDefaults:(id)a3;
- (BOOL)sanitizeSettingsAfterInitialSetup:(id)a3;
- (BOOL)sanitizeSettingsAfterSetup:(id)a3 duration:(int64_t)a4;
- (BOOL)sanitizeTotalDuration:(id)a3;
- (BOOL)sanitizeWarnInterval:(id)a3;
- (BOOL)updateIdleTimerSettingsForActiveClientConfiguration:(id)a3;
- (BOOL)updateIdleTimerSettingsForAutoLockTimeout:(id)a3;
- (BOOL)updateIdleTimerSettingsForBatterySaverMode:(id)a3;
- (BOOL)updateIdleTimerSettingsForDefaultWarnInterval:(id)a3;
- (BOOL)updateIdleTimerSettingsForDuration:(int64_t)a3 descriptor:(id)a4;
- (BOOL)updateIdleTimerSettingsForFaceDown:(id)a3;
- (BOOL)updateIdleTimerSettingsForPowerDefaults:(id)a3;
- (BOOL)updateIdleTimerSettingsForPrototypeSettings:(id)a3;
- (BOOL)updateIdleTimerSettingsForSecurityDefaults:(id)a3;
- (BOOL)updateIdleTimerSettingsForTelephony:(id)a3;
- (BOOL)updateIdleTimerSettingsForThermalBlockedMode:(id)a3;
- (BOOL)updateIdleTimerSettingsForUnlockedWithMesa:(id)a3;
- (BOOL)updateIdleTimerSettingsForWarnInterval:(id)a3;
- (BOOL)updateIdleTimerSettingsWithCustomTimeouts:(id)a3 fromBehavior:(id)a4;
- (SBAlertItemsController)_alertItemsController;
- (SBBacklightController)_backlightController;
- (SBConferenceManager)_conferenceManager;
- (SBIdleTimerDescriptorFactory)initWithGlobalStateMonitor:(id)a3;
- (SBIdleTimerSettings)_idleTimerPrototypeSettings;
- (SBLockScreenManager)_lockScreenManager;
- (SBMainWorkspace)_mainWorkspace;
- (SBPrototypeController)_prototypeController;
- (SBTelephonyManager)_telephonyManager;
- (SBUIBiometricResource)_biometricResource;
- (SpringBoard)_springBoard;
- (id)idleTimerDescriptorForBehavior:(id)a3;
- (void)_setAlertItemsController:(id)a3;
- (void)_setBacklightController:(id)a3;
- (void)_setBiometricResource:(id)a3;
- (void)_setConferenceManager:(id)a3;
- (void)_setIdleTimerPrototypeSettings:(id)a3;
- (void)_setLockScreenManager:(id)a3;
- (void)_setMainWorkspace:(id)a3;
- (void)_setPrototypeController:(id)a3;
- (void)_setSpringBoard:(id)a3;
- (void)_setTelephonyManager:(id)a3;
- (void)_updateIdleTimerSettingsWarnInterval:(id)a3 totalInterval:(double)a4;
@end

@implementation SBIdleTimerDescriptorFactory

- (id)idleTimerDescriptorForBehavior:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 idleTimerMode] == 3)
  {
    v5 = [(id)objc_opt_class() disabledIdleTimerDescriptor];
    BOOL v6 = [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForThermalBlockedMode:v5];
    v7 = SBLogIdleTimer();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8) {
        goto LABEL_43;
      }
      *(_DWORD *)v28 = 138543618;
      *(void *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2048;
      *(void *)&v28[14] = v4;
      id v9 = *(id *)&v28[4];
      v10 = "idleTimerDescriptorForBehavior: <%{public}@: 0x%p> disabled proposed SBFIdleTimerModeDisabled but it was ove"
            "rriden due to thermal block";
    }
    else
    {
      if (!v8) {
        goto LABEL_43;
      }
      *(_DWORD *)v28 = 138543618;
      *(void *)&v28[4] = objc_opt_class();
      *(_WORD *)&v28[12] = 2048;
      *(void *)&v28[14] = v4;
      id v9 = *(id *)&v28[4];
      v10 = "idleTimerDescriptorForBehavior: <%{public}@: 0x%p> returning disabled idle timer descriptor because behavior"
            " provider proposed SBFIdleTimerModeDisabled";
    }
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, v10, v28, 0x16u);
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v4;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    v7 = v13;

    if (v7)
    {
      v14 = SBLogIdleTimer();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 138543362;
        *(void *)&v28[4] = v7;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "idleTimerDescriptorForBehavior: %{public}@", v28, 0xCu);
      }
    }
    else
    {
      v7 = +[SBIdleTimerBehavior behaviorForBehaviorProvider:v12];
      v14 = SBLogIdleTimer();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 138543874;
        *(void *)&v28[4] = objc_opt_class();
        *(_WORD *)&v28[12] = 2048;
        *(void *)&v28[14] = v12;
        *(_WORD *)&v28[22] = 2114;
        v29 = v7;
        id v15 = *(id *)&v28[4];
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "idleTimerDescriptorForBehavior: <%{public}@: 0x%p> behavior: %{public}@", v28, 0x20u);
      }
    }

    uint64_t v16 = [v7 idleTimerDuration];
    uint64_t v17 = [v7 idleTimerMode];
    BOOL v19 = [v7 idleWarnMode] == 2 && v17 != 3;
    v5 = [[SBIdleTimerDescriptor alloc] initWithTimerMode:v17 warnInterval:0.0 totalInterval:0.0];
    if (v16 == 3)
    {
      [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForDuration:3 descriptor:v5];
    }
    else
    {
      [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForSecurityDefaults:v5];
      [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForAutoLockTimeout:v5];
      [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForTelephony:v5];
      [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForPrototypeSettings:v5];
      [(SBIdleTimerDescriptorFactory *)self sanitizeSettingsAfterInitialSetup:v5];
      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        if (v16 == 13)
        {
          v20 = [(SBIdleTimerDescriptorFactory *)self _idleTimerPrototypeSettings];
          [v20 unlockedIdleTimerCap];
          double v22 = v21;

          [(SBIdleTimerDescriptor *)v5 totalInterval];
          if (v22 < v23) {
            double v23 = v22;
          }
          -[SBIdleTimerDescriptor setTotalInterval:](v5, "setTotalInterval:", v23, *(_OWORD *)v28, *(void *)&v28[16], v29);
        }
        else
        {
          [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForPowerDefaults:v5];
          [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForDefaultWarnInterval:v5];
          [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsWithCustomTimeouts:v5 fromBehavior:v7];
          [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForUnlockedWithMesa:v5];
        }
        if (!-[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForBatterySaverMode:](self, "updateIdleTimerSettingsForBatterySaverMode:", v5, *(void *)v28, *(void *)&v28[8]))
        {
          [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForFaceDown:v5];
          [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForWarnInterval:v5];
        }
      }
      else
      {
        [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForDuration:v16 descriptor:v5];
        [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsWithCustomTimeouts:v5 fromBehavior:v7];
        [(SBIdleTimerDescriptorFactory *)self sanitizeDescriptorForLockscreenDefaults:v5];
        [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForDefaultWarnInterval:v5];
      }
      -[SBIdleTimerDescriptorFactory updateIdleTimerSettingsForThermalBlockedMode:](self, "updateIdleTimerSettingsForThermalBlockedMode:", v5, *(void *)v28, *(void *)&v28[8]);
      if ([(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForActiveClientConfiguration:v5])
      {
        [(SBIdleTimerDescriptorFactory *)self updateIdleTimerSettingsForWarnInterval:v5];
      }
      if (!v19)
      {
        [(SBIdleTimerDescriptor *)v5 setWarnInterval:1.79769313e308];
        [(SBIdleTimerDescriptor *)v5 setQuickUnwarnInterval:1.79769313e308];
        [(SBIdleTimerDescriptor *)v5 addAuditReason:@"should not warn"];
      }
      [(SBIdleTimerDescriptorFactory *)self sanitizeSettingsAfterSetup:v5 duration:v16];
      if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 0xC
        && [(SBIdleTimerDescriptorFactory *)self _shouldUseAttentionSensor]
        && [(SBIdleTimerDescriptor *)v5 timerMode] != 3)
      {
        v24 = [(SBIdleTimerDescriptorFactory *)self _prototypeController];
        v25 = [v24 rootSettings];
        v26 = [v25 attentionAwarenessSettings];

        [v26 sampleInterval];
        -[SBIdleTimerDescriptor setSampleInterval:](v5, "setSampleInterval:");
        [(SBIdleTimerDescriptor *)v5 addAuditReason:@"should use attention awareness"];
      }
    }
  }
LABEL_43:

  return v5;
}

- (BOOL)updateIdleTimerSettingsForThermalBlockedMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor isThermalBlocked];
  if (v5)
  {
    [v4 totalInterval];
    double v7 = v6;
    [v4 warnInterval];
    double v9 = v8;
    if (BSFloatEqualToFloat())
    {
      double v10 = 20.0;
      double v11 = 30.0;
    }
    else
    {
      double v11 = 30.0;
      if (v7 <= 30.0) {
        double v11 = v7;
      }
      double v12 = v11 + -10.0;
      if (v9 <= v11 + -10.0) {
        double v12 = v9;
      }
      if (v12 >= 2.0) {
        double v10 = v12;
      }
      else {
        double v10 = 2.0;
      }
    }
    [v4 setTotalInterval:v11];
    [v4 setWarnInterval:v10];
    if ([v4 timerMode] == 3) {
      [v4 setTimerMode:1];
    }
    v13 = SBIdleTimerIntervalToNSString(30.0);
    v14 = SBIdleTimerIntervalToNSString(10.0);
    [v4 addAuditReason:@"thermally blocked - applying max total interval: %@ and max warn interval: %@ thermal block limits", v13, v14];
  }
  return v5;
}

- (BOOL)updateIdleTimerSettingsWithCustomTimeouts:(id)a3 fromBehavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 customIdleExpirationTimeout];
  double v9 = v8;
  char IsZero = BSFloatIsZero();
  if ((IsZero & 1) == 0)
  {
    if ([(SBIdleTimerDescriptorFactory *)self _isIdleDurationForever:v9])
    {
      [v6 setTotalInterval:1.79769313e308];
      double v11 = SBIdleTimerIntervalToNSString(v9);
      [v6 addAuditReason:@"customIdleExpirationTimeout (%@) lt 0", v11];
    }
    else
    {
      [v6 setTotalInterval:v9];
      if ([v7 idleWarnMode] == 1)
      {
        [v6 setWarnInterval:0.0];
        double v12 = @"Setting totalInterval to custom customIdleExpirationTimeout gte 0";
LABEL_15:
        [v6 addAuditReason:v12];
        goto LABEL_16;
      }
      [v6 addAuditReason:@"Setting totalInterval to custom customIdleExpirationTimeout gte 0"];
    }
    [v7 customIdleWarningTimeout];
    double v14 = v13;
    if ((BSFloatIsZero() & 1) == 0 && (BSFloatGreaterThanFloat() & 1) == 0)
    {
      if ([(SBIdleTimerDescriptorFactory *)self _isIdleDurationForever:v14])
      {
        [v6 setWarnInterval:1.79769313e308];
        id v15 = SBIdleTimerIntervalToNSString(v14);
        [v6 addAuditReason:@"customIdleWarningTimeout (%@) lt 0", v15];
      }
      else
      {
        [v6 setWarnInterval:v14];
        [v6 addAuditReason:@"Setting warnInterval to custom customIdleWarningTimeout"];
      }
      [v6 warnInterval];
      if (v16 == 1.79769313e308)
      {
        [v6 totalInterval];
        if (v17 == 1.79769313e308)
        {
          [v6 setTimerMode:3];
          double v12 = @"warnInterval is <never> and totalInterval is <never>";
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:

  return IsZero ^ 1;
}

- (BOOL)updateIdleTimerSettingsForWarnInterval:(id)a3
{
  id v4 = a3;
  if ([v4 shouldWarn]
    && ([v4 warnInterval], BSFloatGreaterThanOrEqualToFloat()))
  {
    [v4 totalInterval];
    -[SBIdleTimerDescriptorFactory _updateIdleTimerSettingsWarnInterval:totalInterval:](self, "_updateIdleTimerSettingsWarnInterval:totalInterval:", v4);
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForUnlockedWithMesa:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIdleTimerDescriptorFactory *)self _mainWorkspace];
  int v6 = [(id)v5 isSpringBoardActive];

  id v7 = [(SBIdleTimerDescriptorFactory *)self _biometricResource];
  LODWORD(v5) = [v7 hasBiometricAuthenticationCapabilityEnabled];

  [v4 totalInterval];
  int v8 = v6 & ~BSFloatEqualToFloat() & v5;
  if (v8 == 1)
  {
    [v4 totalInterval];
    double v10 = v9 * 0.5;
    double v11 = 30.0;
    if (v10 >= 30.0) {
      double v11 = v10;
    }
    [v4 setTotalInterval:v11];
    double v12 = SBIdleTimerIntervalToNSString(v10);
    double v13 = SBIdleTimerIntervalToNSString(30.0);
    objc_msgSend(v4, "addAuditReason:", @"sbIsActive and mesaEnabled are YES; calculating totalInterval as half (%@) or MIN_TOTAL_INTERVAL_HOMESCREEN_MESA (%@), whichever is greater",
      v12,
      v13);
  }
  return v8;
}

- (BOOL)updateIdleTimerSettingsForTelephony:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIdleTimerDescriptorFactory *)self _telephonyManager];
  int v6 = [(SBIdleTimerDescriptorFactory *)self _conferenceManager];
  if ([v5 isInEmergencyCallbackMode])
  {
    [v4 setTotalInterval:1.79769313e308];
    [v4 setWarnInterval:1.79769313e308];
    [v4 setTimerMode:3];
    [v4 addAuditReason:@"SBTelephonyManager is in emergency call"];
    BOOL v7 = 1;
  }
  else
  {
    int v8 = [v5 inCallUsingSpeakerOrReceiver];
    int v9 = [v6 activeFaceTimeCallExists];
    double v10 = [(SBIdleTimerDescriptorFactory *)self _lockScreenManager];
    double v11 = v10;
    if (v10)
    {
      BOOL v7 = 0;
      if (![v10 isUILocked] && v8 | v9)
      {
        [v4 setTotalInterval:1.79769313e308];
        if (v8) {
          [v4 addAuditReason:@"normal call"];
        }
        if (v9) {
          [v4 addAuditReason:@"FaceTime call"];
        }
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (BOOL)updateIdleTimerSettingsForSecurityDefaults:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor dontLockEver];
  if (v5)
  {
    [v4 setTotalInterval:1.79769313e308];
    [v4 setWarnInterval:1.79769313e308];
    [v4 setTimerMode:3];
    [v4 addAuditReason:@"securityDefaults dontLockEver is YES"];
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForPrototypeSettings:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIdleTimerDescriptorFactory *)self _idleTimerPrototypeSettings];
  int v6 = [v5 disableIdleTimer];

  if (v6)
  {
    [v4 setTotalInterval:1.79769313e308];
    [v4 setWarnInterval:1.79769313e308];
    [v4 setTimerMode:3];
    [v4 addAuditReason:@"SBIdleTimerSettings disableIdleTimer is YES"];
  }

  return v6;
}

- (BOOL)updateIdleTimerSettingsForPowerDefaults:(id)a3
{
  id v4 = a3;
  if ([(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor dontDimOrLockOnAC]
    && [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor isOnACPower])
  {
    [v4 setTotalInterval:1.79769313e308];
    [v4 setWarnInterval:1.79769313e308];
    [v4 setTimerMode:3];
    [v4 addAuditReason:@"idleTimerDefaults dontDimOrLockWhileConnectedToPower is YES and device is on AC"];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForFaceDown:(id)a3
{
  id v4 = a3;
  if ([(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor isFaceDownOnTable]
    && ([v4 totalInterval], (BSFloatEqualToFloat() & 1) == 0))
  {
    [v4 totalInterval];
    [v4 setTotalInterval:v6 * 0.25];
    objc_msgSend(v4, "addAuditReason:", @"facedown on a table - reducing total time by the factor %g", 0x3FD0000000000000);
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForDefaultWarnInterval:(id)a3
{
  id v4 = a3;
  [v4 totalInterval];
  double v6 = v5;
  int v7 = BSFloatGreaterThanFloat();
  if (v7) {
    [(SBIdleTimerDescriptorFactory *)self _updateIdleTimerSettingsWarnInterval:v4 totalInterval:v6];
  }

  return v7;
}

- (BOOL)updateIdleTimerSettingsForBatterySaverMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor isBatterySaverModeActive];
  if (v5)
  {
    [v4 totalInterval];
    double v7 = v6;
    [v4 warnInterval];
    double v9 = 30.0;
    if (v7 <= 30.0) {
      double v9 = v7;
    }
    float v10 = v9;
    double v11 = v10;
    double v12 = v10 + -10.0;
    if (v8 > v12) {
      double v8 = v12;
    }
    float v13 = v8;
    if (v13 >= 2.0) {
      float v14 = v13;
    }
    else {
      float v14 = 2.0;
    }
    [v4 setTotalInterval:v11];
    double v15 = v14;
    [v4 setWarnInterval:v15];
    [v4 addAuditReason:@"isBatterySaverModeActive is YES"];
    if (BSFloatLessThanFloat())
    {
      [v4 setWarnInterval:v11 * 0.666666667];
      double v16 = SBIdleTimerIntervalToNSString(v15);
      double v17 = SBIdleTimerIntervalToNSString(10.0);
      [v4 addAuditReason:@"isBatterySaverModeActive is YES and warnInterval (%@) lt MAX_WARNING_INTERVAL_DELTA_BATTERY_SAVER (%@)", v16, v17];
    }
  }

  return v5;
}

- (BOOL)updateIdleTimerSettingsForAutoLockTimeout:(id)a3
{
  id v5 = a3;
  double v6 = [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor autoLockTimeout];
  double v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    double v9 = v8;
    if (BSFloatLessThanOrEqualToFloat())
    {
      [v5 setTotalInterval:v9];
      v3 = SBIdleTimerIntervalToNSString(v9);
      float v10 = SBIdleTimerIntervalToNSString(3600.0);
      [v5 addAuditReason:@"MCFeatureAutoLockTime (%@) is lte MAX (%@)", v3, v10];
    }
    else
    {
      [v5 setTotalInterval:1.79769313e308];
      [v5 setWarnInterval:1.79769313e308];
      v3 = SBIdleTimerIntervalToNSString(v9);
      float v10 = SBIdleTimerIntervalToNSString(3600.0);
      [v5 addAuditReason:@"MCFeatureAutoLockTime (%@) is gt MAX (%@)", v3, v10];
    }

LABEL_19:
    goto LABEL_20;
  }
  if (__sb__runningInSpringBoard())
  {
    int v11 = SBFEffectiveDeviceClass();
    double v12 = 60.0;
    if (v11 == 2) {
      double v12 = 300.0;
    }
    [v5 setTotalInterval:v12];
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v3 userInterfaceIdiom];
    double v14 = 60.0;
    if (v13 == 1) {
      double v14 = 300.0;
    }
    [v5 setTotalInterval:v14];
  }
  int v15 = __sb__runningInSpringBoard();
  char v16 = v15;
  if (v15)
  {
    BOOL v17 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v17 = [v3 userInterfaceIdiom] == 1;
  }
  double v18 = 60.0;
  if (v17) {
    double v18 = 300.0;
  }
  BOOL v19 = SBIdleTimerIntervalToNSString(v18);
  objc_msgSend(v5, "addAuditReason:", @"ERROR: MCFeatureAutoLockTime is <nil>; setting totalInterval to DEFAULT: %@",
    v19);

  if ((v16 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_20:

  return 1;
}

- (BOOL)updateIdleTimerSettingsForActiveClientConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor aggregateClientConfiguration];
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 disableTimerSetting];
    float v8 = [v6 maxExpirationTimeoutSettings];
    double v9 = [v6 minExpirationTimeoutSettings];
    BOOL v10 = v7 != 0;
    if (!v7
      || ([v4 setTimerMode:3],
          [v4 setTotalInterval:1.79769313e308],
          [v4 setWarnInterval:1.79769313e308],
          [v4 addAuditReason:@"Active client configuration: [%@]", v6],
          v8)
      && (unint64_t v11 = [v8 highestPrecedence], v11 >= objc_msgSend(v7, "precedence")))
    {
      double v12 = [v6 resolvedExpirationTimeoutRange];
      [v12 lowerTimeout];
      double v14 = v13;
      [v12 upperTimeout];
      double v16 = v15;
      [v4 totalInterval];
      if (v9 && BSFloatLessThanFloat())
      {
        if (BSFloatLessThanOrEqualToFloat())
        {
          [v4 setTotalInterval:v14];
          BOOL v17 = SBIdleTimerIntervalToNSString(v14);
          double v18 = SBIdleTimerIntervalToNSString(3600.0);
          [v4 addAuditReason:@"MinExpirationTimeoutFromService (%@) is lte MAX_TOTAL_INTERVAL (%@)", v17, v18];
        }
        else
        {
          [v4 setTotalInterval:1.79769313e308];
          [v4 setWarnInterval:1.79769313e308];
          BOOL v17 = SBIdleTimerIntervalToNSString(v14);
          double v18 = SBIdleTimerIntervalToNSString(3600.0);
          [v4 addAuditReason:@"MinExpirationTimeoutFromService (%@) is gt MAX_TOTAL_INTERVAL (%@)", v17, v18];
        }

        BOOL v10 = 1;
      }
      [v4 totalInterval];
      if (v8)
      {
        double v20 = v19;
        if (BSFloatGreaterThanFloat())
        {
          [v4 setTotalInterval:v16];
          if ([v4 timerMode] == 3)
          {
            [v4 setWarnInterval:v20 * 0.666666667];
            [v4 setTimerMode:1];
          }
          double v21 = SBIdleTimerIntervalToNSString(v14);
          double v22 = SBIdleTimerIntervalToNSString(3600.0);
          objc_msgSend(v4, "addAuditReason:", @"MaxExpirationTimeoutFromService", v21, v22);

          BOOL v10 = 1;
        }
      }
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)sanitizeSettingsAfterSetup:(id)a3 duration:(int64_t)a4
{
  id v5 = a3;
  [v5 addAuditReason:@"after setup"];
  [v5 totalInterval];
  if (BSFloatEqualToFloat())
  {
    [v5 warnInterval];
    if (BSFloatEqualToFloat())
    {
      if (__sb__runningInSpringBoard())
      {
        int v6 = SBFEffectiveDeviceClass();
        double v7 = 40.0;
        if (v6 == 2) {
          double v7 = 280.0;
        }
        [v5 setWarnInterval:v7];
      }
      else
      {
        float v8 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v9 = [v8 userInterfaceIdiom];
        double v10 = 40.0;
        if (v9 == 1) {
          double v10 = 280.0;
        }
        [v5 setWarnInterval:v10];
      }
      [v5 addAuditReason:@"after setup, setting default warn interval"];
    }
  }
  [v5 warnInterval];
  double v12 = v11;
  if ([v5 shouldWarn])
  {
    if ([v5 timerMode] == 2)
    {
      [v5 setTimerMode:1];
      [v5 addAuditReason:@"after setup, timer mode was: Manual"];
    }
  }
  else if (BSFloatLessThanOrEqualToFloat())
  {
    [v5 setWarnInterval:1.79769313e308];
    double v13 = SBIdleTimerIntervalToNSString(v12);
    [v5 addAuditReason:@"after setup, warnInterval was %@", v13];
  }
  int v14 = [v5 shouldWarn];
  [v5 totalInterval];
  if (v14) {
    [v5 warnInterval];
  }
  if (a4 == 14 || BSFloatEqualToFloat())
  {
    [v5 setTotalInterval:1.79769313e308];
    [v5 addAuditReason:@"after setup, should not expire"];
  }
  if (([v5 shouldWarn] & 1) == 0 && BSFloatEqualToFloat())
  {
    [v5 setTimerMode:3];
    [v5 addAuditReason:@"after setup, shouldWarn is NO and expireInterval is <never>"];
  }
  [v5 warnInterval];
  if (BSFloatEqualToFloat())
  {
    [v5 totalInterval];
    if (BSFloatEqualToFloat())
    {
      [v5 setTimerMode:3];
      [v5 addAuditReason:@"after setup, warnInterval is <never> and totalInterval is <never>"];
    }
  }

  return 0;
}

- (BOOL)sanitizeSettingsAfterInitialSetup:(id)a3
{
  id v3 = a3;
  [v3 totalInterval];
  double v5 = v4;
  [v3 warnInterval];
  double v7 = v6;
  if ((BSFloatLessThanFloat() & 1) != 0 || BSFloatIsZero())
  {
    if (__sb__runningInSpringBoard())
    {
      int v8 = SBFEffectiveDeviceClass();
      double v9 = 60.0;
      if (v8 == 2) {
        double v9 = 300.0;
      }
      [v3 setTotalInterval:v9];
    }
    else
    {
      double v10 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v11 = [v10 userInterfaceIdiom];
      double v12 = 60.0;
      if (v11 == 1) {
        double v12 = 300.0;
      }
      [v3 setTotalInterval:v12];
    }
    if (__sb__runningInSpringBoard())
    {
      int v13 = SBFEffectiveDeviceClass();
      double v14 = 40.0;
      if (v13 == 2) {
        double v14 = 280.0;
      }
      [v3 setWarnInterval:v14];
    }
    else
    {
      double v15 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v16 = [v15 userInterfaceIdiom];
      double v17 = 40.0;
      if (v16 == 1) {
        double v17 = 280.0;
      }
      [v3 setWarnInterval:v17];
    }
    if ([v3 timerMode] != 3) {
      [v3 setTimerMode:1];
    }
    double v18 = SBIdleTimerIntervalToNSString(v5);
    double v19 = SBIdleTimerIntervalToNSString(v7);
    [v3 addAuditReason:@"totalInterval (%@) and/or warnInterval (%@) is not sane", v18, v19];

    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)_updateIdleTimerSettingsWarnInterval:(id)a3 totalInterval:(double)a4
{
  id v6 = a3;
  [v6 totalInterval];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (BSFloatLessThanOrEqualToFloat())
    {
      objc_msgSend(v6, "setWarnInterval:");
      [v6 setQuickUnwarnInterval:a4 * 0.666666667 + a4 * 0.666666667 * 0.1];
      double v5 = SBIdleTimerIntervalToNSString(a4);
      objc_msgSend(v6, "addAuditReason:", @"totalInterval (%@) lte 30; applying factor (%g) to calculate warnInterval",
        v5,
        0x3FE5555555555555);
    }
    else
    {
      objc_msgSend(v6, "setWarnInterval:");
      [v6 setQuickUnwarnInterval:a4 + -20.0 + 2.0];
      double v5 = SBIdleTimerIntervalToNSString(a4);
      objc_msgSend(v6, "addAuditReason:", @"totalInterval (%@) lte 30; subtracting delta (%g) to calculate warnInterval",
        v5,
        0x4034000000000000);
    }
  }
}

- (SBTelephonyManager)_telephonyManager
{
  override_telephonyManager = self->_override_telephonyManager;
  if (override_telephonyManager)
  {
    id v3 = override_telephonyManager;
  }
  else
  {
    id v3 = +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:0];
  }
  return v3;
}

- (BOOL)_shouldUseAttentionSensor
{
  id v3 = [(SBIdleTimerDescriptorFactory *)self _prototypeController];
  double v4 = [v3 rootSettings];
  double v5 = [v4 attentionAwarenessSettings];

  if ([v5 shouldUseAttentionSensor])
  {
    if ([(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor disableAttentionAwareness]) {
      int v6 = 2;
    }
    else {
      int v6 = 3;
    }
  }
  else
  {
    int v6 = 1;
  }
  if (self->_previousShouldUseAttentionSensorAccess != v6)
  {
    self->_previousShouldUseAttentionSensorAccess = v6;
    if (v6 == 3)
    {
      double v7 = SBLogIdleTimer();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = 0;
        int v8 = "_shouldUseAttentionSensor: YES";
        double v9 = (uint8_t *)&v13;
        double v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_16:
        _os_log_impl(&dword_1D85BA000, v10, v11, v8, v9, 2u);
      }
    }
    else if (v6 == 2)
    {
      double v7 = SBLogIdleTimer();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v8 = "_shouldUseAttentionSensor: NO because SBDisableAttentionAwareness is set";
        double v9 = buf;
        goto LABEL_15;
      }
    }
    else
    {
      double v7 = SBLogIdleTimer();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        int v8 = "_shouldUseAttentionSensor: NO because not supported on this hardware, turned off in accessibility or turned"
             " off by managed config";
        double v9 = (uint8_t *)&v15;
LABEL_15:
        double v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_16;
      }
    }
  }
  return v6 == 3;
}

- (SBPrototypeController)_prototypeController
{
  override_prototypeController = self->_override_prototypeController;
  if (override_prototypeController)
  {
    id v3 = override_prototypeController;
  }
  else
  {
    id v3 = +[SBPrototypeController sharedInstance];
  }
  return v3;
}

- (SBMainWorkspace)_mainWorkspace
{
  override_mainWorkspace = self->_override_mainWorkspace;
  if (override_mainWorkspace)
  {
    id v3 = override_mainWorkspace;
  }
  else
  {
    id v3 = +[SBMainWorkspace sharedInstance];
  }
  return v3;
}

- (SBLockScreenManager)_lockScreenManager
{
  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
  {
    id v3 = override_lockScreenManager;
  }
  else
  {
    id v3 = +[SBLockScreenManager sharedInstanceIfExists];
  }
  return v3;
}

- (SBIdleTimerSettings)_idleTimerPrototypeSettings
{
  override_idleTimerPrototypeSettings = self->_override_idleTimerPrototypeSettings;
  if (override_idleTimerPrototypeSettings)
  {
    id v3 = override_idleTimerPrototypeSettings;
  }
  else
  {
    id v3 = +[SBIdleTimerDomain rootSettings];
  }
  return v3;
}

- (SBConferenceManager)_conferenceManager
{
  override_conferenceManager = self->_override_conferenceManager;
  if (override_conferenceManager)
  {
    id v3 = override_conferenceManager;
  }
  else
  {
    id v3 = +[SBConferenceManager sharedInstance];
  }
  return v3;
}

- (SBUIBiometricResource)_biometricResource
{
  override_biometricResource = self->_override_biometricResource;
  if (override_biometricResource)
  {
    id v3 = override_biometricResource;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FA7C68] sharedInstance];
  }
  return v3;
}

+ (id)disabledIdleTimerDescriptor
{
  v2 = [[SBIdleTimerDescriptor alloc] initWithTimerMode:3 warnInterval:1.79769313e308 totalInterval:1.79769313e308];
  return v2;
}

- (SBIdleTimerDescriptorFactory)initWithGlobalStateMonitor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerDescriptorFactory;
  int v6 = [(SBIdleTimerDescriptorFactory *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stateMonitor, a3);
  }

  return v7;
}

- (BOOL)sanitizeTotalDuration:(id)a3
{
  id v3 = a3;
  [v3 totalInterval];
  double v5 = v4;
  int IsZero = BSFloatIsZero();
  if (IsZero)
  {
    if (__sb__runningInSpringBoard())
    {
      int v7 = SBFEffectiveDeviceClass();
      double v8 = 60.0;
      if (v7 == 2) {
        double v8 = 300.0;
      }
      [v3 setTotalInterval:v8];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v10 = [v9 userInterfaceIdiom];
      double v11 = 60.0;
      if (v10 == 1) {
        double v11 = 300.0;
      }
      [v3 setTotalInterval:v11];
    }
    double v12 = SBIdleTimerIntervalToNSString(v5);
    [v3 addAuditReason:@"totalInterval (%@) is float equals to 0", v12];
  }
  return IsZero;
}

- (BOOL)sanitizeWarnInterval:(id)a3
{
  id v3 = a3;
  [v3 warnInterval];
  double v5 = v4;
  int IsZero = BSFloatIsZero();
  if (IsZero)
  {
    if (__sb__runningInSpringBoard())
    {
      int v7 = SBFEffectiveDeviceClass();
      double v8 = 40.0;
      if (v7 == 2) {
        double v8 = 280.0;
      }
      [v3 setWarnInterval:v8];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v10 = [v9 userInterfaceIdiom];
      double v11 = 40.0;
      if (v10 == 1) {
        double v11 = 280.0;
      }
      [v3 setWarnInterval:v11];
    }
    double v12 = SBIdleTimerIntervalToNSString(v5);
    [v3 addAuditReason:@"warnInterval (%@) is float equals to 0", v12];
  }
  return IsZero;
}

- (BOOL)sanitizeDescriptorForLockscreenDefaults:(id)a3
{
  id v4 = a3;
  [v4 totalInterval];
  double v6 = v5;
  int v7 = BSFloatGreaterThanOrEqualToFloat();
  if (v7)
  {
    [(SBIdleTimerGlobalStateMonitor *)self->_stateMonitor minimumLockscreenIdleTime];
    if (v6 >= v8) {
      double v8 = v6;
    }
    [v4 setTotalInterval:v8];
    objc_super v9 = SBIdleTimerIntervalToNSString(v6);
    [v4 addAuditReason:@"totalInterval (%@) is gte 0", v9];
  }
  return v7;
}

- (BOOL)updateIdleTimerSettingsForDuration:(int64_t)a3 descriptor:(id)a4
{
  id v6 = a4;
  if ([v6 timerMode] == 3)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 0;
    switch(a3)
    {
      case 0:
      case 1:
        double v8 = 6.0;
        goto LABEL_16;
      case 2:
        double v8 = 2.0;
        goto LABEL_16;
      case 3:
        objc_super v9 = [(id)SBApp accidentalActivationMitigationSessionCoordinator];
        uint64_t v10 = [v9 currentSession];
        [v10 duration];
        objc_msgSend(v6, "setTotalInterval:");

        [v6 setWarnInterval:0.01];
        goto LABEL_17;
      case 4:
        double v8 = 10.0;
        goto LABEL_16;
      case 5:
        double v8 = 15.0;
        goto LABEL_16;
      case 6:
      case 7:
        double v8 = 20.0;
        goto LABEL_16;
      case 8:
        double v8 = 120.0;
        goto LABEL_16;
      case 9:
        double v8 = 25.0;
        goto LABEL_16;
      case 10:
        double v8 = 30.0;
        goto LABEL_16;
      case 11:
        double v8 = 8.0;
        goto LABEL_16;
      case 13:
        double v11 = [(SBIdleTimerDescriptorFactory *)self _idleTimerPrototypeSettings];
        [v11 unlockedIdleTimerCap];
        double v13 = v12;

        [v6 totalInterval];
        if (v13 < v8) {
          double v8 = v13;
        }
LABEL_16:
        [v6 setTotalInterval:v8];
        goto LABEL_17;
      case 14:
        [v6 setTotalInterval:1.79769313e308];
        [v6 setTimerMode:3];
LABEL_17:
        double v14 = NSStringFromIdleTimerDuration();
        [v6 addAuditReason:@"duration is %@", v14];

        BOOL v7 = 1;
        break;
      default:
        break;
    }
  }

  return v7;
}

- (SBBacklightController)_backlightController
{
  override_backlightController = self->_override_backlightController;
  if (override_backlightController)
  {
    id v3 = override_backlightController;
  }
  else
  {
    id v3 = +[SBBacklightController sharedInstance];
  }
  return v3;
}

- (BOOL)_isIdleDurationForever:(double)a3
{
  if (a3 == 1.79769313e308) {
    return 1;
  }
  else {
    return BSFloatLessThanFloat();
  }
}

- (void)_setBacklightController:(id)a3
{
}

- (void)_setPrototypeController:(id)a3
{
}

- (void)_setIdleTimerPrototypeSettings:(id)a3
{
}

- (void)_setLockScreenManager:(id)a3
{
}

- (void)_setMainWorkspace:(id)a3
{
}

- (void)_setBiometricResource:(id)a3
{
}

- (void)_setTelephonyManager:(id)a3
{
}

- (void)_setConferenceManager:(id)a3
{
}

- (SpringBoard)_springBoard
{
  return self->_springBoard;
}

- (void)_setSpringBoard:(id)a3
{
}

- (SBAlertItemsController)_alertItemsController
{
  return self->_alertItemsController;
}

- (void)_setAlertItemsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_springBoard, 0);
  objc_storeStrong((id *)&self->_override_backlightController, 0);
  objc_storeStrong((id *)&self->_override_conferenceManager, 0);
  objc_storeStrong((id *)&self->_override_telephonyManager, 0);
  objc_storeStrong((id *)&self->_override_biometricResource, 0);
  objc_storeStrong((id *)&self->_override_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_idleTimerPrototypeSettings, 0);
  objc_storeStrong((id *)&self->_override_prototypeController, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
}

@end