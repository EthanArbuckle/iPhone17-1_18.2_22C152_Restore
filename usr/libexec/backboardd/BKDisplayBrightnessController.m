@interface BKDisplayBrightnessController
+ (BKDisplayBrightnessController)sharedInstance;
- (BOOL)isALSSupported;
- (BOOL)isAutoBrightnessAvailable;
- (BOOL)isBrightnessLevelControlAvailable;
- (float)brightnessLevel;
- (float)unentitledBrightnessLevel;
- (id)_initWithBrightnessSystem:(id)a3 systemShellSentinel:(id)a4 orientationManager:(id)a5;
- (id)propertyForKey:(id)a3;
- (id)suppressBrightnessNotificationsForReason:(id)a3;
- (int)displayBrightnessCurve;
- (unsigned)backlightArchitectureVersion;
- (void)clientDied:(id)a3;
- (void)dealloc;
- (void)orientationManager:(id)a3 userInterfaceOrientationMayHaveChanged:(int64_t)a4 isDeviceOrientationLocked:(BOOL)a5;
- (void)setAutoBrightnessEnabled:(BOOL)a3;
- (void)setBacklightFeatures:(id)a3 forPID:(int)a4;
- (void)setBacklightLocked:(BOOL)a3 forReason:(id)a4;
- (void)setBrightnessLevel:(float)a3 reason:(id)a4 options:(unint64_t)a5;
- (void)setDisplayBrightnessCurve:(int)a3;
- (void)setMinimumBrightnessLevel:(float)a3 fadeDuration:(float)a4;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)systemShellDidFinishLaunching:(id)a3;
@end

@implementation BKDisplayBrightnessController

- (float)brightnessLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  float brightnessLevel = self->_brightnessLevel;
  os_unfair_lock_unlock(p_lock);
  return brightnessLevel;
}

- (void)setMinimumBrightnessLevel:(float)a3 fadeDuration:(float)a4
{
  if (a3 >= 0.0) {
    float v6 = a3;
  }
  else {
    float v6 = 0.0;
  }
  v7 = BKLogBacklight();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218240;
    double v14 = v6;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting minimum brightness level: %f with fade duration %f", (uint8_t *)&v13, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (a4 <= 0.0)
  {
    *(float *)&double v8 = v6;
    v11 = +[NSNumber numberWithFloat:v8];
    v12 = @"BrightnessMinPhysical";
  }
  else
  {
    *(float *)&double v8 = a4;
    v9 = +[NSNumber numberWithFloat:v8];
    sub_10000B3A0((uint64_t)self, v9, @"DisplayBrightnessFadePeriod");

    *(float *)&double v10 = v6;
    v11 = +[NSNumber numberWithFloat:v10];
    v12 = @"BrightnessMinPhysicalWithFade";
  }
  sub_10000B3A0((uint64_t)self, v11, v12);

  os_unfair_lock_unlock(&self->_lock);
}

+ (BKDisplayBrightnessController)sharedInstance
{
  if (qword_100123148 != -1) {
    dispatch_once(&qword_100123148, &stru_1000F8988);
  }
  v2 = (void *)qword_100123140;

  return (BKDisplayBrightnessController *)v2;
}

- (float)unentitledBrightnessLevel
{
  [(BKDisplayBrightnessController *)self brightnessLevel];
  float v3 = fmaxf(v2, 0.0);
  float v4 = (float)(v3 * 100.0) / 5.0;
  BOOL v5 = v3 < 1.0;
  float v6 = 20.0;
  if (v5) {
    float v6 = v4;
  }
  return (float)(roundf(v6) * 5.0) / 100.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressClientNotificationsAssertion, 0);
  objc_storeStrong((id *)&self->_brightnessSystem, 0);
  objc_storeStrong((id *)&self->_backlightClientPerPID, 0);
  objc_storeStrong((id *)&self->_orientationManagerObserving, 0);
  objc_destroyWeak((id *)&self->_orientationManager);
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_previousBrightnessLevelValue, 0);

  objc_storeStrong((id *)&self->_previousBrightnessLevelKey, 0);
}

- (void)orientationManager:(id)a3 userInterfaceOrientationMayHaveChanged:(int64_t)a4 isDeviceOrientationLocked:(BOOL)a5
{
  id v6 = +[NSNumber numberWithInteger:sub_100094900((uint64_t)a3)];
  [(BKDisplayBrightnessController *)self setProperty:v6 forKey:@"CBUIOrientation"];
}

- (void)systemShellDidFinishLaunching:(id)a3
{
}

- (void)clientDied:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 pid];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [(BSMutableIntegerMap *)self->_backlightClientPerPID removeObjectForKey:v5];
  [v4 invalidate];

  sub_100092270((uint64_t)self);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setBacklightFeatures:(id)a3 forPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  backlightClientPerPID = self->_backlightClientPerPID;
  if (!backlightClientPerPID)
  {
    double v8 = (BSMutableIntegerMap *)objc_opt_new();
    v9 = self->_backlightClientPerPID;
    self->_backlightClientPerPID = v8;

    backlightClientPerPID = self->_backlightClientPerPID;
  }
  double v10 = [(BSMutableIntegerMap *)backlightClientPerPID objectForKey:(int)v4];
  if (v10
    || (double v10 = [(BKHIDEventClient *)[BKBacklightClient alloc] initWithPid:v4 sendRight:0 queue:&_dispatch_main_q], [(BKHIDEventClient *)v10 setDelegate:self], [(BSMutableIntegerMap *)self->_backlightClientPerPID setObject:v10 forKey:(int)v4], v10))
  {
    objc_storeStrong((id *)(&v10->super._terminating + 1), a3);
  }
  sub_100092270((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setBacklightLocked:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v17[0] = @"FreezeBrightnessEnable";
  v7 = +[NSNumber numberWithBool:v4];
  v18[0] = v7;
  v17[1] = @"FreezeBrightnessRequestors";
  id v16 = v6;
  double v8 = +[NSArray arrayWithObjects:&v16 count:1];
  v17[2] = @"FreezeBrightnessPeriod";
  v18[1] = v8;
  v18[2] = &off_100103730;
  v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  double v10 = BKLogBacklight();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v4) {
      CFStringRef v11 = @"YES";
    }
    int v12 = 138412546;
    CFStringRef v13 = v11;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Locking backlight to current value: %@ for reason: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(BKDisplayBrightnessController *)self setProperty:v9 forKey:@"FreezeBrightness"];
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  sub_10000B3A0((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)propertyForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [(BrightnessSystem *)self->_brightnessSystem copyPropertyForKey:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (int)displayBrightnessCurve
{
  float v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LODWORD(v2) = v2->_brightnessLevelCurve;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setDisplayBrightnessCurve:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100092AAC((uint64_t)self, v3, 1);

  os_unfair_lock_unlock(p_lock);
}

- (void)setAutoBrightnessEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = +[BKSDefaults localDefaults];
  [v4 setALSEnabled:v3];

  uint64_t v5 = BKDefaultKeyALSEnabled;

  sub_100082B64(v5);
}

- (BOOL)isALSSupported
{
  float v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = [(BrightnessSystem *)v2->_brightnessSystem isAlsSupported];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isBrightnessLevelControlAvailable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BrightnessSystem *)self->_brightnessSystem copyPropertyForKey:@"CBBrightnessControlAvailable"];
  unsigned __int8 v5 = [v4 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isAutoBrightnessAvailable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BrightnessSystem *)self->_brightnessSystem copyPropertyForKey:@"CBAutoBrightnessAvailable"];
  unsigned __int8 v5 = [v4 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setBrightnessLevel:(float)a3 reason:(id)a4 options:(unint64_t)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v10 = v9;
  if (self && (self->_brightnessLevel != a3 || self->_previousBrightnessLevelOptions != a5))
  {
    CFStringRef v11 = BKLogBacklight();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    if (!a5)
    {
      __int16 v14 = @"none";
      goto LABEL_13;
    }
    id v12 = objc_alloc_init((Class)NSMutableArray);
    CFStringRef v13 = v12;
    if (a5)
    {
      [v12 addObject:@"commit"];
      if ((a5 & 4) == 0)
      {
LABEL_8:
        if ((a5 & 2) == 0) {
          goto LABEL_9;
        }
        goto LABEL_36;
      }
    }
    else if ((a5 & 4) == 0)
    {
      goto LABEL_8;
    }
    [v13 addObject:@"notifyClients"];
    if ((a5 & 2) == 0)
    {
LABEL_9:
      if ((a5 & 8) == 0)
      {
LABEL_11:
        __int16 v14 = [v13 componentsJoinedByString:@", "];

LABEL_13:
        *(_DWORD *)buf = 134218498;
        *(double *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v10;
        __int16 v29 = 2112;
        v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "brightness change:%g reason:%{public}@ options:%@", buf, 0x20u);

LABEL_14:
        if ((a5 & 2) != 0)
        {
          *(float *)&double v15 = a3;
          id v16 = +[NSNumber numberWithFloat:v15, @"Brightness"];
          v27[1] = @"Commit";
          *(void *)buf = v16;
          v17 = +[NSNumber numberWithBool:a5 & 1];
          *(void *)&buf[8] = v17;
          v18 = +[NSDictionary dictionaryWithObjects:buf forKeys:v27 count:2];

          if ((a5 & 8) != 0) {
            v19 = @"DisplayInitialBrightness";
          }
          else {
            v19 = @"DisplayBrightness";
          }
          if (!BSEqualObjects() || (BSEqualObjects() & 1) == 0)
          {
            previousBrightnessLevelKey = self->_previousBrightnessLevelKey;
            self->_previousBrightnessLevelKey = &v19->isa;

            objc_storeStrong((id *)&self->_previousBrightnessLevelValue, v18);
            sub_10000B3A0((uint64_t)self, v18, v19);
          }
        }
        int notificationToken = self->_notificationToken;
        if (notificationToken == -1)
        {
          if (notify_register_check("UIBacklightLevelChangedNotification", &self->_notificationToken))
          {
LABEL_30:
            self->_float brightnessLevel = a3;
            self->_previousBrightnessLevelOptions = a5;
            goto LABEL_31;
          }
          int notificationToken = self->_notificationToken;
        }
        float v22 = fmaxf(a3, 0.0);
        float v23 = (float)(v22 * 100.0) / 5.0;
        BOOL v24 = v22 < 1.0;
        float v25 = 20.0;
        if (v24) {
          float v25 = v23;
        }
        notify_set_state(notificationToken, (unint64_t)(float)((float)((float)(roundf(v25) * 5.0) / 100.0) * 1000000.0));
        if ((a5 & 4) != 0)
        {
          unint64_t v26 = (unint64_t)(float)(a3 * 1000000.0);
          if (self->_previousDarwinNotificationBrightnessLevel != v26
            && ([(BSCompoundAssertion *)self->_suppressClientNotificationsAssertion isActive] & 1) == 0)
          {
            notify_post("UIBacklightLevelChangedNotification");
            self->_previousDarwinNotificationBrightnessLevel = v26;
          }
        }
        goto LABEL_30;
      }
LABEL_10:
      [v13 addObject:@"setInitialLevel"];
      goto LABEL_11;
    }
LABEL_36:
    [v13 addObject:@"notifyBrightnessSystem"];
    if ((a5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_31:

  os_unfair_lock_unlock(p_lock);
}

- (unsigned)backlightArchitectureVersion
{
  float v2 = [(BKDisplayBrightnessController *)self propertyForKey:@"DisplayBackLightArchitecture"];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v5 = v4;
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }
  id v6 = v5;

  unsigned __int8 v7 = [v6 unsignedCharValue];
  return v7;
}

- (id)suppressBrightnessNotificationsForReason:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [(BSCompoundAssertion *)self->_suppressClientNotificationsAssertion acquireForReason:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_suppressClientNotificationsAssertion invalidate];
  [(BSInvalidatable *)self->_orientationManagerObserving invalidate];
  int notificationToken = self->_notificationToken;
  if (notificationToken != -1) {
    notify_cancel(notificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)BKDisplayBrightnessController;
  [(BKDisplayBrightnessController *)&v4 dealloc];
}

- (id)_initWithBrightnessSystem:(id)a3 systemShellSentinel:(id)a4 orientationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BKDisplayBrightnessController;
  id v12 = [(BKDisplayBrightnessController *)&v30 init];
  uint64_t v13 = (uint64_t)v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_int notificationToken = -1;
    objc_storeStrong((id *)&v12->_brightnessSystem, a3);
    uint64_t v14 = +[BSCompoundAssertion assertionWithIdentifier:@"BKDisplayBrightnessController suppress-darwin-notifications"];
    double v15 = *(void **)(v13 + 104);
    *(void *)(v13 + 104) = v14;

    *(_DWORD *)(v13 + 16) = 1;
    id v16 = +[BKSDefaults localDefaults];
    id v17 = [v16 brightnessCurve];

    os_unfair_lock_lock((os_unfair_lock_t)(v13 + 8));
    sub_100092AAC(v13, (uint64_t)v17, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 8));
    objc_initWeak(&location, (id)v13);
    v18 = *(void **)(v13 + 96);
    BOOL v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    unint64_t v26 = sub_1000933E8;
    v27 = &unk_1000F89B0;
    objc_copyWeak(&v28, &location);
    [v18 registerNotificationBlock:&v24];
    [v13 setBacklightLocked:1 forReason:@"BKSystemApplicationBacklightLockReason" v24, v25, v26, v27];
    uint64_t v19 = [v10 addSystemShellObserver:v13 reason:@"display brightness startup lock"];
    v20 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v19;

    objc_storeWeak((id *)(v13 + 64), v11);
    uint64_t v21 = sub_100095730((id *)v11, (void *)v13);
    float v22 = *(void **)(v13 + 72);
    *(void *)(v13 + 72) = v21;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return (id)v13;
}

@end