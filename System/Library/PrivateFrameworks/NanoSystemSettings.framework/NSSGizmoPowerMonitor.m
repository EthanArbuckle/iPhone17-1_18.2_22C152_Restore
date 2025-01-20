@interface NSSGizmoPowerMonitor
+ (id)sharedMonitor;
- (BOOL)_droppedFromLastNotifiedLevel:(int64_t)a3;
- (BOOL)_powerStatusNotifierEnabled;
- (BOOL)_shouldPostNotificationForPowerLevel:(int64_t)a3;
- (BOOL)forceEnabledOverride;
- (BOOL)substantialChangeFromLastNotifiedLevel:(int64_t)a3;
- (HKSPSleepSettings)sleepSettings;
- (HKSPSleepStore)sleepStore;
- (NPSManager)npsManager;
- (NSDictionary)powerSourceDescription;
- (NSSGizmoPowerMonitor)init;
- (OS_dispatch_queue)workQueue;
- (SFClient)sfClient;
- (id)_activeNRDevice;
- (id)levels;
- (id)sleepSchedulePredicate;
- (int64_t)lastKnownPowerLevelBeforeGoingOffCharger;
- (int64_t)substantialChange;
- (void)_beginMonitoringForPowerUpdates;
- (void)_beginMonitoringOnWristState;
- (void)_loadSleepSettingsFrom:(id)a3;
- (void)_postNotificationForLowPowerModeAutoDisabled:(unint64_t)a3;
- (void)_postNotificationForPowerLevel:(int64_t)a3;
- (void)_processOffChargerState;
- (void)_registerForSleepSettingsChanges;
- (void)_removedFromChargerNotification;
- (void)_setLevels:(id)a3;
- (void)_stopMonitoringForPowerUpdates;
- (void)_stopMonitoringOnWristState;
- (void)_updatePowerSourceDescription;
- (void)_updateSettings;
- (void)addLevel:(int64_t)a3;
- (void)processBatteryUpdate;
- (void)processLowPowerModeAutoDisableUpdateType:(unint64_t)a3;
- (void)resetLevels;
- (void)setLastKnownPowerLevelBeforeGoingOffCharger:(int64_t)a3;
- (void)setNpsManager:(id)a3;
- (void)setPowerSourceDescription:(id)a3;
- (void)setSfClient:(id)a3;
- (void)setSleepSettings:(id)a3;
- (void)setSleepStore:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)sleepStore:(id)a3 sleepModeOnDidChange:(BOOL)a4;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
@end

@implementation NSSGizmoPowerMonitor

+ (id)sharedMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017C84;
  block[3] = &unk_100034DF8;
  block[4] = a1;
  if (qword_10003E7A0 != -1) {
    dispatch_once(&qword_10003E7A0, block);
  }
  v2 = (void *)qword_10003E798;
  return v2;
}

- (NSSGizmoPowerMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)NSSGizmoPowerMonitor;
  v2 = [(NSSGizmoPowerMonitor *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanosystemsettings.gizmoPowerMonitoring", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v2->_psNotifyTokenAnyPowerSource = -1;
    objc_initWeak(&location, v2);
    v6 = v2->_workQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100017DCC;
    v8[3] = &unk_100034E70;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)processBatteryUpdate
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017F6C;
  block[3] = &unk_100034AE0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_activeNRDevice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  dispatch_queue_t v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];

  return v5;
}

- (void)_updatePowerSourceDescription
{
  v3 = (const void *)IOPSCopyPowerSourcesByType();
  dispatch_queue_t v4 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  v17 = [v4 valueForProperty:NRDevicePropertyName];

  if (v3)
  {
    v15 = self;
    CFArrayRef cf = IOPSCopyPowerSourcesList(v3);
    CFIndex Count = CFArrayGetCount(cf);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v7);
        IOPSGetPowerSourceDescription(v3, ValueAtIndex);
        id v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v10 = [(NSDictionary *)v9 objectForKeyedSubscript:@"Accessory Category"];
        objc_super v11 = [(NSDictionary *)v9 objectForKeyedSubscript:@"Name"];
        v12 = NSSLogForType();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v10;
          __int16 v20 = 2112;
          v21 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Processing power source %@ %@", buf, 0x16u);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v10 isEqualToString:@"Watch"]
          && [v11 isEqualToString:v17])
        {
          break;
        }

        if (v6 == ++v7) {
          goto LABEL_14;
        }
      }
      v13 = NSSLogForType();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Found power source for active watch.", buf, 2u);
      }

      powerSourceDescription = v15->_powerSourceDescription;
      v15->_powerSourceDescription = v9;
    }
LABEL_14:
    CFRelease(cf);
    CFRelease(v3);
  }
}

- (void)_postNotificationForPowerLevel:(int64_t)a3
{
  if ([(NSSGizmoPowerMonitor *)self _powerStatusNotifierEnabled]
    || [(NSSGizmoPowerMonitor *)self forceEnabledOverride])
  {
    if ([(NSSGizmoPowerMonitor *)self _shouldPostNotificationForPowerLevel:a3])
    {
      v5 = [(NSSGizmoPowerMonitor *)self levels];
      CFIndex v6 = +[NSNumber numberWithInteger:a3];
      unsigned __int8 v7 = [v5 containsObject:v6];

      if ((v7 & 1) == 0)
      {
        [(NSSGizmoPowerMonitor *)self addLevel:a3];
        [(NSSGizmoPowerMonitor *)self setLastKnownPowerLevelBeforeGoingOffCharger:a3];
        id v11 = +[NSSUserNotificationManager sharedInstance];
        v8 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
        id v9 = [v8 valueForProperty:NRDevicePropertyName];

        v10 = +[NSNumber numberWithLong:a3];
        [v11 postBatteryNotificationForWatch:v9 withValue:v10];
      }
    }
  }
}

- (BOOL)_powerStatusNotifierEnabled
{
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v4 = kSFPowerSourceStatusDomain;
  v5 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v6 = [v3 initWithDomain:v4 pairedDevice:v5];

  id v7 = [v6 synchronize];
  unsigned int v8 = [v6 BOOLForKey:kSFPowerSourceStatusFeatureKey];
  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    if (v8) {
      CFStringRef v10 = @"YES";
    }
    int v12 = 138412290;
    CFStringRef v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Power status notifier enabled: %@", (uint8_t *)&v12, 0xCu);
  }

  return v8;
}

- (void)_processOffChargerState
{
  powerSourceDescription = self->_powerSourceDescription;
  self->_powerSourceDescription = 0;

  [(NSSGizmoPowerMonitor *)self _updatePowerSourceDescription];
  if (self->_powerSourceDescription)
  {
    uint64_t v4 = NSSLogForType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_powerSourceDescription;
      int v9 = 138412290;
      CFStringRef v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Processing off charger state %@", (uint8_t *)&v9, 0xCu);
    }

    id v6 = [(NSDictionary *)self->_powerSourceDescription objectForKeyedSubscript:@"Current Capacity"];
    id v7 = [(NSDictionary *)self->_powerSourceDescription objectForKeyedSubscript:@"Is Charging"];
    if (([v7 BOOLValue] & 1) != 0
      || !-[NSSGizmoPowerMonitor substantialChangeFromLastNotifiedLevel:](self, "substantialChangeFromLastNotifiedLevel:", [v6 integerValue]))
    {
      if ([v7 BOOLValue]
        && -[NSSGizmoPowerMonitor _droppedFromLastNotifiedLevel:](self, "_droppedFromLastNotifiedLevel:", [v6 integerValue]))
      {
        unsigned int v8 = NSSLogForType();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v9) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Watch still on charger, but level dropped. Removing last posted notification", (uint8_t *)&v9, 2u);
        }

        [(NSSGizmoPowerMonitor *)self _removedFromChargerNotification];
      }
    }
    else
    {
      [(NSSGizmoPowerMonitor *)self _removedFromChargerNotification];
      [(NSSGizmoPowerMonitor *)self _stopMonitoringForPowerUpdates];
      [(NSSGizmoPowerMonitor *)self _stopMonitoringOnWristState];
    }
  }
}

- (void)_removedFromChargerNotification
{
  if ([(NSSGizmoPowerMonitor *)self _powerStatusNotifierEnabled]
    || [(NSSGizmoPowerMonitor *)self forceEnabledOverride])
  {
    [(NSSGizmoPowerMonitor *)self resetLevels];
    [(NSSGizmoPowerMonitor *)self setLastKnownPowerLevelBeforeGoingOffCharger:0];
    id v3 = NSSLogForType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Removing last posted charge notification", v5, 2u);
    }

    uint64_t v4 = +[NSSUserNotificationManager sharedInstance];
    [v4 removeLastPostedBatteryNotification];
  }
}

- (void)_beginMonitoringForPowerUpdates
{
  p_psNotifyTokenAnyPowerSource = &self->_psNotifyTokenAnyPowerSource;
  if (self->_psNotifyTokenAnyPowerSource == -1
    && ([(NSSGizmoPowerMonitor *)self _powerStatusNotifierEnabled]
     || [(NSSGizmoPowerMonitor *)self forceEnabledOverride]))
  {
    uint64_t v4 = (OS_os_transaction *)os_transaction_create();
    keepAliveTransaction = self->_keepAliveTransaction;
    self->_keepAliveTransaction = v4;

    workQueue = self->_workQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100018A44;
    handler[3] = &unk_100034E98;
    handler[4] = self;
    uint32_t v7 = notify_register_dispatch("com.apple.system.powersources", p_psNotifyTokenAnyPowerSource, workQueue, handler);
    if (v7)
    {
      uint32_t v8 = v7;
      int v9 = NSSLogForType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Gizmo Power Monitor unable to register for power change notification (%lu).", buf, 0xCu);
      }
    }
  }
}

- (void)_stopMonitoringForPowerUpdates
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018B30;
  block[3] = &unk_100034AE0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_loadSleepSettingsFrom:(id)a3
{
  id v8 = 0;
  uint64_t v4 = [a3 currentSleepSettingsWithError:&v8];
  id v5 = v8;
  sleepSettings = self->_sleepSettings;
  self->_sleepSettings = v4;

  if (v5)
  {
    uint32_t v7 = NSSLogForType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      CFStringRef v10 = "-[NSSGizmoPowerMonitor _loadSleepSettingsFrom:]";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Error loading settings (%{public}@)", buf, 0x16u);
    }
  }
}

- (void)sleepStore:(id)a3 sleepModeOnDidChange:(BOOL)a4
{
  id v5 = a3;
  id v6 = NSSLogForType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[NSSGizmoPowerMonitor sleepStore:sleepModeOnDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  [(NSSGizmoPowerMonitor *)self _loadSleepSettingsFrom:v5];
  [(NSSGizmoPowerMonitor *)self _updateSettings];
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[NSSGizmoPowerMonitor sleepStore:sleepSettingsDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(NSSGizmoPowerMonitor *)self _loadSleepSettingsFrom:self->_sleepStore];
  [(NSSGizmoPowerMonitor *)self _updateSettings];
}

- (void)_updateSettings
{
  if ([(HKSPSleepSettings *)self->_sleepSettings watchSleepFeaturesEnabled]
    && [(HKSPSleepSettings *)self->_sleepSettings chargingReminders])
  {
    if (![(NSSGizmoPowerMonitor *)self _powerStatusNotifierEnabled])
    {
      BOOL v3 = 1;
LABEL_6:
      uint64_t v4 = NSSLogForType();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v5 = @"disabled";
        if (v3) {
          CFStringRef v5 = @"enabled";
        }
        *(_DWORD *)buf = 136315394;
        v16 = "-[NSSGizmoPowerMonitor _updateSettings]";
        __int16 v17 = 2114;
        CFStringRef v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Updating setting to %{public}@", buf, 0x16u);
      }

      id v6 = objc_alloc((Class)NPSDomainAccessor);
      uint64_t v7 = kSFPowerSourceStatusDomain;
      id v8 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
      int v9 = [v6 initWithDomain:v7 pairedDevice:v8];

      uint64_t v10 = kSFPowerSourceStatusFeatureKey;
      [v9 setBool:v3 forKey:kSFPowerSourceStatusFeatureKey];
      uint64_t v11 = kSFPowerChargingMonitoringLevelKeys;
      [v9 setObject:&off_100036778 forKey:kSFPowerChargingMonitoringLevelKeys];
      id v12 = [v9 synchronize];
      npsManager = self->_npsManager;
      v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, 0);
      [(NPSManager *)npsManager synchronizeNanoDomain:v7 keys:v14];

      goto LABEL_13;
    }
  }
  else
  {
    BOOL v3 = [(NSSGizmoPowerMonitor *)self forceEnabledOverride];
    if (v3 != [(NSSGizmoPowerMonitor *)self _powerStatusNotifierEnabled]) {
      goto LABEL_6;
    }
  }
  int v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No change in setting.", buf, 2u);
  }
LABEL_13:
}

- (BOOL)_shouldPostNotificationForPowerLevel:(int64_t)a3
{
  id v5 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v6 = kSFPowerSourceStatusDomain;
  uint64_t v7 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v8 = [v5 initWithDomain:v6 pairedDevice:v7];

  int v9 = [v8 arrayForKey:kSFPowerChargingMonitoringLevelKeys];
  uint64_t v10 = +[NSNumber numberWithInteger:a3 / 10];
  LOBYTE(v6) = [v9 containsObject:v10];

  return v6;
}

- (id)sleepSchedulePredicate
{
  v2 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/system/currentSleepState"];
  BOOL v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  return v3;
}

- (void)_registerForSleepSettingsChanges
{
  if (!self->_context)
  {
    BOOL v3 = +[_CDClientContext userContext];
    context = self->_context;
    self->_context = v3;

    id v5 = [(NSSGizmoPowerMonitor *)self sleepSchedulePredicate];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001931C;
    v7[3] = &unk_100034FD8;
    v7[4] = self;
    uint64_t v6 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.nanosystemsettingsd.contextstore-registration" contextualPredicate:v5 clientIdentifier:@"com.apple.nanosystemsettingsd.contextstore-registration" callback:v7];

    [(_CDClientContext *)self->_context registerCallback:v6];
  }
}

- (BOOL)forceEnabledOverride
{
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v4 = kSFPowerSourceStatusDomain;
  id v5 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v6 = [v3 initWithDomain:v4 pairedDevice:v5];

  if (MGGetBoolAnswer()) {
    unsigned __int8 v7 = [v6 BOOLForKey:@"forceEnabledOverride"];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (int64_t)lastKnownPowerLevelBeforeGoingOffCharger
{
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v4 = kSFPowerSourceStatusDomain;
  id v5 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v6 = [v3 initWithDomain:v4 pairedDevice:v5];

  id v7 = [v6 integerForKey:@"lastKnownPowerLevelBeforeGoingOffCharger"];
  return (int64_t)v7;
}

- (void)setLastKnownPowerLevelBeforeGoingOffCharger:(int64_t)a3
{
  id v5 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v6 = kSFPowerSourceStatusDomain;
  id v7 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v9 = [v5 initWithDomain:v6 pairedDevice:v7];

  [v9 setInteger:a3 forKey:@"lastKnownPowerLevelBeforeGoingOffCharger"];
  id v8 = [v9 synchronize];
}

- (int64_t)substantialChange
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.nanosystemsettings");
  int64_t result = CFPreferencesGetAppIntegerValue(@"com.apple.nanosystemsettings", @"substantialChangeOverride", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 3;
  }
  return result;
}

- (BOOL)substantialChangeFromLastNotifiedLevel:(int64_t)a3
{
  uint64_t v4 = (char *)[(NSSGizmoPowerMonitor *)self lastKnownPowerLevelBeforeGoingOffCharger]- a3;
  return (uint64_t)v4 > [(NSSGizmoPowerMonitor *)self substantialChange];
}

- (BOOL)_droppedFromLastNotifiedLevel:(int64_t)a3
{
  int64_t v4 = [(NSSGizmoPowerMonitor *)self lastKnownPowerLevelBeforeGoingOffCharger];
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    int v8 = 134218498;
    int64_t v9 = v4;
    if (v4 > a3) {
      CFStringRef v6 = @"YES";
    }
    __int16 v10 = 2048;
    int64_t v11 = a3;
    __int16 v12 = 2112;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: lastKnownPowerLevelBeforeGoingOffCharger (%ld); currentCharge (%ld) = dropped (%@)",
      (uint8_t *)&v8,
      0x20u);
  }

  return v4 > a3;
}

- (id)levels
{
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v4 = kSFPowerSourceStatusDomain;
  id v5 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v6 = [v3 initWithDomain:v4 pairedDevice:v5];

  id v7 = [v6 objectForKey:@"power-levels"];

  return v7;
}

- (void)_setLevels:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Setting levels to %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = objc_alloc((Class)NPSDomainAccessor);
  uint64_t v7 = kSFPowerSourceStatusDomain;
  int v8 = [(NSSGizmoPowerMonitor *)self _activeNRDevice];
  id v9 = [v6 initWithDomain:v7 pairedDevice:v8];

  __int16 v10 = [v4 allObjects];
  [v9 setObject:v10 forKey:@"power-levels"];

  id v11 = [v9 synchronize];
}

- (void)addLevel:(int64_t)a3
{
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithInteger:a3];
    int v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Adding level %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v7 = [(NSSGizmoPowerMonitor *)self levels];
  id v8 = [v7 mutableCopy];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  id v11 = v10;

  int v12 = +[NSNumber numberWithInteger:a3];
  [v11 addObject:v12];

  [(NSSGizmoPowerMonitor *)self _setLevels:v11];
}

- (void)resetLevels
{
  id v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "GizmoPowerMonitor: Resetting levels.", v4, 2u);
  }

  [(NSSGizmoPowerMonitor *)self _setLevels:0];
}

- (void)processLowPowerModeAutoDisableUpdateType:(unint64_t)a3
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019BA0;
  block[3] = &unk_100035000;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(workQueue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_postNotificationForLowPowerModeAutoDisabled:(unint64_t)a3
{
  id v4 = +[NSSUserNotificationManager sharedInstance];
  [v4 postLowPowerModeAutoDisabledNotification:a3];
}

- (void)_beginMonitoringOnWristState
{
  id v3 = objc_alloc_init((Class)SFClient);
  [(NSSGizmoPowerMonitor *)self setSfClient:v3];

  id v4 = [(NSSGizmoPowerMonitor *)self workQueue];
  id v5 = [(NSSGizmoPowerMonitor *)self sfClient];
  [v5 setDispatchQueue:v4];

  objc_initWeak(&location, self);
  id v6 = [(NSSGizmoPowerMonitor *)self sfClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  id v7[2] = sub_100019EBC;
  v7[3] = &unk_100035028;
  objc_copyWeak(&v8, &location);
  [v6 monitorPairedWatchWristStateWithCompletionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_stopMonitoringOnWristState
{
}

- (NSDictionary)powerSourceDescription
{
  return self->_powerSourceDescription;
}

- (void)setPowerSourceDescription:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
}

- (HKSPSleepSettings)sleepSettings
{
  return self->_sleepSettings;
}

- (void)setSleepSettings:(id)a3
{
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (void)setNpsManager:(id)a3
{
}

- (SFClient)sfClient
{
  return self->_sfClient;
}

- (void)setSfClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfClient, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_powerSourceDescription, 0);
  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end