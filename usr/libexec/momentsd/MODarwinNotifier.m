@interface MODarwinNotifier
- (MODarwinNotifier)initWithName:(id)a3;
- (MODarwinNotifier)initWithUniverse:(id)a3;
- (void)checkLockedState;
- (void)checkManagedConfiguration;
- (void)handleBatteryNotification:(unsigned int)a3;
- (void)onBatteryStatusChanged:(unsigned int)a3 andMessageType:(unsigned int)a4 andMessageArgument:(void *)a5;
- (void)onDisable;
- (void)onEnable;
- (void)onMatchedBatteries:(unsigned int)a3;
- (void)toggle:(BOOL)a3;
@end

@implementation MODarwinNotifier

- (void)handleBatteryNotification:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", kCFAllocatorDefault, 0);
  v5 = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", kCFAllocatorDefault, 0);
  if (CFProperty) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  v37 = CFProperty;
  v38 = v5;
  if (v6)
  {
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MODarwinNotifier handleBatteryNotification:]();
    }

    float v8 = -1.0;
  }
  else
  {
    unsigned int v9 = [v5 intValue:CFProperty:v5];
    int v10 = [CFProperty intValue];
    if (v9) {
      int v11 = v9;
    }
    else {
      int v11 = 100;
    }
    float v12 = (float)v10 * 100.0 / (float)v11;
    float v8 = fmaxf(fminf(v12, 100.0), 0.0);
  }
  v13 = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalConnected", kCFAllocatorDefault, 0);
  v14 = v13;
  if (v13)
  {
    unsigned int v15 = [v13 BOOLValue];
  }
  else
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MODarwinNotifier handleBatteryNotification:]();
    }

    unsigned int v15 = 0;
  }
  v17 = (void *)IORegistryEntryCreateCFProperty(a3, @"AdapterDetails", kCFAllocatorDefault, 0);
  v18 = [v17 objectForKeyedSubscript:@"Description"];
  v19 = v18;
  CFStringRef v20 = @"Unknown";
  if (v18)
  {
    if ([(__CFString *)v18 hasPrefix:@"batt"])
    {
      CFStringRef v20 = @"None";
    }
    else if ([(__CFString *)v19 hasPrefix:@"usb"])
    {
      CFStringRef v20 = @"USB";
    }
    else if ([(__CFString *)v19 hasPrefix:@"external"])
    {
      CFStringRef v20 = @"External";
    }
    else if ([(__CFString *)v19 hasSuffix:@"arcas"])
    {
      CFStringRef v20 = @"Arcas";
    }
  }
  else
  {
    v19 = @"Unknown";
  }
  v21 = (void *)IORegistryEntryCreateCFProperty(a3, @"FullyCharged", kCFAllocatorDefault, 0);
  v22 = v21;
  if (v21)
  {
    unsigned int v23 = [v21 BOOLValue];
  }
  else
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MODarwinNotifier handleBatteryNotification:]();
    }

    unsigned int v23 = 0;
  }
  p_isIHAEnabled = &self->managedConfigurationState.isIHAEnabled;
  int v26 = *((unsigned __int8 *)&self->lockedState + 4);
  BOOL v27 = v8 == *(float *)&self->managedConfigurationState.isIHAEnabled && v15 == v26;
  if (!v27
    || (LOBYTE(v26) = v15, v23 != *((unsigned __int8 *)&self->lockedState + 5))
    || (LOBYTE(v26) = v15, v20 != *(const __CFString **)((char *)&self->batteryState.batteryLevel + 1))
    || (LOBYTE(v26) = v15, v19 != *(__CFString **)((char *)&self->batteryState.chargerType + 1)))
  {
    *(float *)p_isIHAEnabled = v8;
    *((unsigned char *)&self->lockedState + 3) = v26;
    *((unsigned char *)&self->lockedState + 4) = v15;
    *((unsigned char *)&self->lockedState + 5) = v23;
    v28 = *(void **)((char *)&self->batteryState.batteryLevel + 1);
    *(void *)((char *)&self->batteryState.batteryLevel + 1) = v20;

    objc_storeStrong((id *)((char *)&self->batteryState.chargerType + 1), v19);
    v40[0] = @"batteryLevel";
    LODWORD(v29) = *(_DWORD *)p_isIHAEnabled;
    v30 = +[NSNumber numberWithFloat:v29];
    v41[0] = v30;
    v40[1] = @"batteryWasConnected";
    v31 = +[NSNumber numberWithBool:*((unsigned __int8 *)&self->lockedState + 3)];
    v41[1] = v31;
    v40[2] = @"stateOnCharger";
    v32 = +[NSNumber numberWithBool:*((unsigned __int8 *)&self->lockedState + 4)];
    v41[2] = v32;
    v40[3] = @"batteryCharged";
    v33 = +[NSNumber numberWithBool:*((unsigned __int8 *)&self->lockedState + 5)];
    uint64_t v34 = *(void *)((char *)&self->batteryState.batteryLevel + 1);
    uint64_t v35 = *(uint64_t *)((char *)&self->batteryState.chargerType + 1);
    v41[3] = v33;
    v41[4] = v34;
    v40[4] = @"chargerType";
    v40[5] = @"adapterDescription";
    v41[5] = v35;
    v36 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:6];

    [(MONotifier *)self notifyAndPersist:4 withPayload:v36];
  }
}

- (void)onBatteryStatusChanged:(unsigned int)a3 andMessageType:(unsigned int)a4 andMessageArgument:(void *)a5
{
  if (a4 == -536723200) {
    -[MODarwinNotifier handleBatteryNotification:](self, "handleBatteryNotification:", *(void *)&a3, *(void *)&a4, a5);
  }
}

- (MODarwinNotifier)initWithUniverse:(id)a3
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(MODarwinNotifier *)self initWithName:v5];

  return v6;
}

- (MODarwinNotifier)initWithName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MODarwinNotifier;
  v3 = [(MONotifier *)&v9 initWithName:a3];
  v4 = v3;
  if (v3)
  {
    *(_WORD *)(v3 + 33) = 0;
    *(_WORD *)(v3 + 35) = 0;
    *(_DWORD *)(v3 + 41) = -1082130432;
    *(_WORD *)(v3 + 45) = 0;
    v3[47] = 0;
    v5 = *(void **)(v3 + 49);
    *(void *)(v3 + 49) = &stru_1002D2AC8;

    BOOL v6 = *(void **)(v4 + 57);
    *(void *)(v4 + 57) = &stru_1002D2AC8;

    *(_DWORD *)(v4 + 65) = -1;
    *(_DWORD *)(v4 + 69) = -1;
    *(_DWORD *)(v4 + 73) = -1;
    *(_DWORD *)(v4 + 77) = 0;
    *(void *)(v4 + 81) = 0;
    v7 = v4;
  }

  return (MODarwinNotifier *)v4;
}

- (void)onEnable
{
}

- (void)onDisable
{
}

- (void)toggle:(BOOL)a3
{
  v4 = (int *)((char *)&self->batteryState.adapterDescription + 5);
  int v5 = *(_DWORD *)((char *)&self->batteryState.adapterDescription + 5);
  if (a3)
  {
    if (v5 < 0 && &MCEffectiveSettingsChangedNotification)
    {
      BOOL v6 = (const char *)[MCEffectiveSettingsChangedNotification UTF8String];
      v7 = [(MONotifier *)self queue];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = __27__MODarwinNotifier_toggle___block_invoke;
      handler[3] = &unk_1002CB9A8;
      handler[4] = self;
      notify_register_dispatch(v6, v4, v7, handler);
    }
    if (*(int *)((unsigned char *)&self->_registerForLockedState + 1) < 0)
    {
      float v8 = [(MONotifier *)self queue];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __27__MODarwinNotifier_toggle___block_invoke_2;
      v26[3] = &unk_1002CB9A8;
      v26[4] = self;
      notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", (int *)((char *)&self->_registerForLockedState + 1), v8, v26);
    }
    if ((*(_DWORD *)((unsigned char *)&self->batteryState.adapterDescription + 1) & 0x80000000) != 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)checkLockedState_bounce, kMobileKeyBagLockStatusNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      int v10 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)checkLockedState_bounce, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      *(_DWORD *)((char *)&self->batteryState.adapterDescription + 1) = 1;
    }
    if (!*(int *)((char *)&self->_managedConfigurationToken + 1))
    {
      io_iterator_t notification = 0;
      IONotificationPortRef v11 = IONotificationPortCreate(kIOMainPortDefault);
      *(void *)((char *)&self->_sysDiagnoseToken + 1) = v11;
      if (v11)
      {
        float v12 = v11;
        v13 = [(MONotifier *)self queue];
        IONotificationPortSetDispatchQueue(v12, v13);

        v14 = *(IONotificationPort **)((char *)&self->_sysDiagnoseToken + 1);
        CFDictionaryRef v15 = IOServiceMatching("IOPMPowerSource");
        LODWORD(v13) = IOServiceAddMatchingNotification(v14, "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)onMatchedBatteries_bounce, self, &notification);
        v16 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
        v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[MODarwinNotifier toggle:]();
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Registered for battery status changes: added matching notification", v24, 2u);
          }

          [(MODarwinNotifier *)self onMatchedBatteries:notification];
        }
        IOObjectRelease(notification);
      }
      else
      {
        unsigned int v23 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[MODarwinNotifier toggle:]();
        }
      }
    }
    [(MODarwinNotifier *)self checkManagedConfiguration];
    [(MODarwinNotifier *)self checkLockedState];
  }
  else
  {
    if ((v5 & 0x80000000) == 0)
    {
      notify_cancel(v5);
      int *v4 = -1;
    }
    int v18 = *(int *)((char *)&self->_registerForLockedState + 1);
    if ((v18 & 0x80000000) == 0)
    {
      notify_cancel(v18);
      *(int *)((char *)&self->_registerForLockedState + 1) = -1;
    }
    if ((*(_DWORD *)((unsigned char *)&self->batteryState.adapterDescription + 1) & 0x80000000) == 0)
    {
      v19 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v19, self, kMobileKeyBagLockStatusNotification, 0);
      CFStringRef v20 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v20, self, @"com.apple.mobile.keybagd.first_unlock", 0);
      *(_DWORD *)((char *)&self->batteryState.adapterDescription + 1) = -1;
    }
    io_object_t v21 = *(int *)((char *)&self->_managedConfigurationToken + 1);
    if (v21)
    {
      IOObjectRelease(v21);
      *(int *)((char *)&self->_managedConfigurationToken + 1) = 0;
    }
    v22 = *(IONotificationPort **)((char *)&self->_sysDiagnoseToken + 1);
    if (v22)
    {
      IONotificationPortDestroy(v22);
      *(void *)((char *)&self->_sysDiagnoseToken + 1) = 0;
    }
  }
}

id __27__MODarwinNotifier_toggle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkManagedConfiguration];
}

id __27__MODarwinNotifier_toggle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notify:0 withPayload:0];
}

- (void)onMatchedBatteries:(unsigned int)a3
{
  kern_return_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12;
  unsigned char v13[15];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;

  uint64_t v5 = IOIteratorNext(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      v7 = IOServiceAddInterestNotification(*(IONotificationPortRef *)((char *)&self->_sysDiagnoseToken + 1), v6, "IOGeneralInterest", (IOServiceInterestCallback)onBatteryStatusChanged_bounce, self, (io_object_t *)((char *)&self->_managedConfigurationToken + 1));
      float v8 = _mo_log_facility_get_os_log(&MOLogFacilityDarwin);
      objc_super v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(MODarwinNotifier *)&v12 onMatchedBatteries:v9];
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&self->_managedConfigurationToken + 1)];
          IONotificationPortRef v11 = *(void *)((char *)&self->_sysDiagnoseToken + 1);
          *(_DWORD *)buf = 138412546;
          CFDictionaryRef v15 = v10;
          v16 = 2048;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Added interest notification for battery %@ with port %p", buf, 0x16u);
        }
        [(MODarwinNotifier *)self handleBatteryNotification:v6];
      }
      IOObjectRelease(v6);
      uint64_t v6 = IOIteratorNext(a3);
    }
    while (v6);
  }
}

- (void)checkManagedConfiguration
{
  v3 = +[MCProfileConnection sharedConnection];
  id v4 = [v3 isDiagnosticSubmissionAllowed];

  uint64_t v5 = +[MCProfileConnection sharedConnection];
  id v6 = [v5 isHealthDataSubmissionAllowed];

  if (__PAIR64__(*((unsigned __int8 *)&self->super._enabled + 2), *((unsigned __int8 *)&self->super._enabled + 1)) != __PAIR64__(v6, v4))
  {
    *(&self->super._enabled + 1) = (char)v4;
    *(&self->super._enabled + 2) = (char)v6;
    v10[0] = @"optInDNU";
    v7 = +[NSNumber numberWithBool:v4];
    v11[0] = v7;
    v10[1] = @"optInIHA";
    float v8 = +[NSNumber numberWithBool:v6];
    v11[1] = v8;
    objc_super v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    [(MONotifier *)self notifyAndPersist:1 withPayload:v9];
  }
}

- (void)checkLockedState
{
  v3 = &self->super._enabled + 3;
  unsigned int v4 = *((unsigned __int8 *)&self->super._enabled + 4);
  if (MKBDeviceFormattedForContentProtection())
  {
    BOOL v5 = MKBDeviceUnlockedSinceBoot() == 1;
    unsigned int v6 = MKBGetDeviceLockState();
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = 0;
    }
    else
    {
      unsigned int v7 = 1u >> (8 * v6);
      if (v6 > 2) {
        unsigned int v7 = v4;
      }
    }
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v5 = 1;
    BOOL v8 = 1;
  }
  if (*v3 != v5)
  {
    BOOL *v3 = v5;
    CFStringRef v15 = @"wasUnlocked";
    objc_super v9 = +[NSNumber numberWithBool:v5];
    v16 = v9;
    int v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [(MONotifier *)self notifyAndPersist:3 withPayload:v10];
  }
  if (v3[1] != v8)
  {
    v3[1] = v8;
    CFStringRef v13 = @"stateUnlocked";
    IONotificationPortRef v11 = +[NSNumber numberWithBool:v8];
    v14 = v11;
    float v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [(MONotifier *)self notifyAndPersist:2 withPayload:v12];
  }
}

- (void).cxx_destruct
{
  p_isIHAEnabled = &self->managedConfigurationState.isIHAEnabled;

  v3 = (void *)*((void *)p_isIHAEnabled + 2);
}

- (void)toggle:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't create notification port", v2, v3, v4, v5, v6);
}

- (void)toggle:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't add matching notification", v2, v3, v4, v5, v6);
}

- (void)onMatchedBatteries:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to add interest notification for battery", buf, 2u);
}

- (void)handleBatteryNotification:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Cannot find charged status", v2, v3, v4, v5, v6);
}

- (void)handleBatteryNotification:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Cannot find connected status", v2, v3, v4, v5, v6);
}

- (void)handleBatteryNotification:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Cannot find current or maximum capacity", v2, v3, v4, v5, v6);
}

@end