@interface BKTetherController
+ (id)sharedInstance;
- (BKTetherController)init;
- (BOOL)_reverseTetheringActive;
- (BOOL)_serviceExists:(__CFString *)a3;
- (BOOL)isOrientationNotificationDisabled;
- (BOOL)isTethered;
- (BOOL)usesDisplayPortTethering;
- (unsigned)_demoCardConnection;
- (void)_handleDemoModeChanged;
- (void)_postDisplayPortNotificationCode:(int)a3;
- (void)_setTetherState:(int)a3;
- (void)dealloc;
- (void)noteInterfaceOrientationChangedWithInterfaceOrientation:(int)a3;
- (void)setDitheringEnabled:(int)a3;
- (void)setOrientationNotificationDisabled:(BOOL)a3;
- (void)updatePreferencesIfNeeded;
@end

@implementation BKTetherController

- (void)setOrientationNotificationDisabled:(BOOL)a3
{
  self->_orientationNotificationsDisabled = a3;
}

- (BOOL)isOrientationNotificationDisabled
{
  return self->_orientationNotificationsDisabled;
}

- (void)updatePreferencesIfNeeded
{
  id v6 = +[BKSDefaults localDefaults];
  if ([(BKTetherController *)self isTethered]
    && ([v6 ignoreTetheringPreferences] & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.backboardd.tetherPrefsNeedUpdate", 0, 0, 1u);
    [v6 setDitheringEnabled:0];
    v4 = +[BKSDefaults externalDefaults];
    v5 = [v4 persistentConnectionDefaults];

    [v5 setForceDemoMaxHBI:300];
    if ([(BKTetherController *)self _reverseTetheringActive]) {
      [v5 setWifiInterfaceName:@"en1"];
    }
  }
}

- (BOOL)_reverseTetheringActive
{
  kern_return_t MatchingServices;
  kern_return_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  io_object_t v13;
  io_object_t v14;
  CFTypeRef v15;
  const void *v16;
  unsigned int v17;
  io_iterator_t existing;
  uint8_t buf[4];
  kern_return_t v21;

  v3 = BKLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Getting State", buf, 2u);
  }

  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:@"/Library/Preferences/SystemConfiguration/rtether.plist"];

  if (!v5) {
    goto LABEL_12;
  }
  existing = 0;
  CFDictionaryRef v6 = IOServiceMatching("IOEthernetInterface");
  if (!v6)
  {
    v9 = BKLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Can't create a service matching dictionary\n";
      v11 = v9;
      v12 = 2;
      goto LABEL_10;
    }
LABEL_11:

LABEL_12:
    LOBYTE(v13) = 0;
    return v13;
  }
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v6, &existing);
  if (MatchingServices)
  {
    v8 = MatchingServices;
    v9 = BKLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v8;
      v10 = "IOServiceGetMatchingServices failed: 0x%x\n";
      v11 = v9;
      v12 = 8;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  while (1)
  {
    v13 = IOIteratorNext(existing);
    if (!v13) {
      break;
    }
    v14 = v13;
    *(_DWORD *)buf = 0;
    if (!IORegistryEntryGetParentEntry(v13, "IOService", (io_registry_entry_t *)buf))
    {
      if (IOObjectConformsTo(*(io_object_t *)buf, "AppleUSBEthernetDevice")
        && (v15 = IORegistryEntrySearchCFProperty(v14, "IOService", @"BSD Name", kCFAllocatorDefault, 0)) != 0)
      {
        v16 = v15;
        v17 = [(BKTetherController *)self _serviceExists:v15];
        CFRelease(v16);
        IOObjectRelease(v14);
        v14 = *(_DWORD *)buf;
        if (v17)
        {
          IOObjectRelease(*(io_object_t *)buf);
          LOBYTE(v13) = 1;
          return v13;
        }
      }
      else
      {
        IOObjectRelease(v14);
        v14 = *(_DWORD *)buf;
      }
    }
    IOObjectRelease(v14);
  }
  return v13;
}

- (BOOL)_serviceExists:(__CFString *)a3
{
  v4 = BKLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Looking for Service", buf, 2u);
  }

  unsigned int v5 = getprogname();
  CFStringRef v6 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s-%s", v5, "com.apple.Preferences.reverse-tethering");
  v7 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, v6, 0, 0);
  if (v6) {
    CFRelease(v6);
  }
  if (!v7 || !SCPreferencesLock(v7, 1u) && (SCPreferencesSynchronize(v7), !SCPreferencesLock(v7, 1u)))
  {
    BOOL v17 = 0;
    CFArrayRef v9 = 0;
    int v16 = 1001;
LABEL_22:
    v18 = BKLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "R-Tether Exists - Error Code: %d", buf, 8u);
    }

    goto LABEL_25;
  }
  CFArrayRef v8 = SCNetworkServiceCopyAll(v7);
  CFArrayRef v9 = v8;
  if (v8)
  {
    CFIndex Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_16:
      int v16 = 0;
      BOOL v17 = 0;
    }
    else
    {
      CFIndex v11 = Count;
      CFIndex v12 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v9, v12);
        if (ValueAtIndex)
        {
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
            if (BSDName)
            {
              if (CFEqual(BSDName, a3)) {
                break;
              }
            }
          }
        }
        if (v11 == ++v12) {
          goto LABEL_16;
        }
      }
      v20 = BKLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Service Found", buf, 2u);
      }

      int v16 = 0;
      BOOL v17 = 1;
    }
  }
  else
  {
    BOOL v17 = 0;
    int v16 = 1001;
  }
  if (!SCPreferencesUnlock(v7)) {
    int v16 = SCError();
  }
  if (v16) {
    goto LABEL_22;
  }
LABEL_25:
  if (v9) {
    CFRelease(v9);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v17;
}

- (void)setDitheringEnabled:(int)a3
{
  CFDictionaryRef v4 = IOServiceMatching("AppleH1CLCD");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!MatchingService)
  {
    CFDictionaryRef v6 = IOServiceMatching("AppleM2CLCD");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService)
    {
      CFArrayRef v8 = BKLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFArrayRef v9 = "Couldn't find framebuffer service";
        goto LABEL_12;
      }
LABEL_13:

      return;
    }
  }
  int v7 = IOMobileFramebufferOpen();
  IOObjectRelease(MatchingService);
  if (v7)
  {
    CFArrayRef v8 = BKLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFArrayRef v9 = "Couldn't open framebuffer service";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  int v10 = IOMobileFramebufferSetDebugFlags();
  CFIndex v11 = BKLogCommon();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Couldn't set debug flags", buf, 2u);
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 67109120;
    int v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tether dithering: %d", buf, 8u);
  }
}

- (void)noteInterfaceOrientationChangedWithInterfaceOrientation:(int)a3
{
  kern_return_t v13;
  kern_return_t v14;
  NSObject *v15;
  unsigned int v16;
  uint32_t outputCnt;
  uint64_t input[10];
  uint8_t buf[4];
  kern_return_t v20;

  if ([(BKTetherController *)self usesDisplayPortTethering])
  {
    unsigned int v5 = +[BKDisplayController sharedInstance];
    unsigned __int8 v6 = [v5 displayIsBlanked:0];

    if ((v6 & 1) == 0)
    {
      buf[0] = 0;
      input[0] = (uint64_t)_NSConcreteStackBlock;
      input[1] = 3221225472;
      input[2] = (uint64_t)sub_10001143C;
      input[3] = (uint64_t)&unk_1000F6620;
      memset(&input[4], 0, 24);
      input[7] = (uint64_t)buf;
      input[8] = 0;
      input[9] = 0;
      sub_1000112C0(input);
      switch(a3)
      {
        case 1:
          if (buf[0] == 3) {
            unsigned int v10 = 2;
          }
          else {
            unsigned int v10 = 1;
          }
          BOOL v11 = buf[0] == 1;
          unsigned int v12 = 3;
          goto LABEL_34;
        case 2:
          if (buf[0] == 3) {
            unsigned int v10 = 3;
          }
          else {
            unsigned int v10 = 4;
          }
          BOOL v11 = buf[0] == 1;
          unsigned int v12 = 2;
          goto LABEL_34;
        case 3:
          if (buf[0] == 3) {
            int v16 = 4;
          }
          else {
            int v16 = 2;
          }
          if (buf[0] == 1) {
            uint64_t v7 = 1;
          }
          else {
            uint64_t v7 = v16;
          }
          goto LABEL_37;
        case 4:
          if (buf[0] == 3) {
            unsigned int v10 = 1;
          }
          else {
            unsigned int v10 = 3;
          }
          BOOL v11 = buf[0] == 1;
          unsigned int v12 = 4;
LABEL_34:
          if (v11) {
            uint64_t v7 = v12;
          }
          else {
            uint64_t v7 = v10;
          }
          goto LABEL_37;
        default:
          return;
      }
    }
    uint64_t v7 = 5;
LABEL_37:
    if (v7 != self->_lastOrientationCode)
    {
      if (!self->_orientationNotificationsDisabled) {
        [(BKTetherController *)self _postDisplayPortNotificationCode:v7];
      }
      self->_lastOrientationCode = v7;
    }
    return;
  }
  mach_port_t v8 = [(BKTetherController *)self _demoCardConnection];
  if (!v8) {
    return;
  }
  uint64_t v9 = a3;
  input[0] = 0;
  if (a3 == 4)
  {
    uint64_t v9 = 2;
  }
  else if (a3 != 3)
  {
    if (a3 != 2) {
      goto LABEL_16;
    }
    uint64_t v9 = 1;
  }
  input[0] = v9;
LABEL_16:
  outputCnt = 0;
  v13 = IOConnectCallScalarMethod(v8, 1u, input, 1u, 0, &outputCnt);
  if (v13)
  {
    int v14 = v13;
    v15 = BKLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Demo card rotation failed, result = %08x\n", buf, 8u);
    }
  }
}

- (void)_handleDemoModeChanged
{
  if ([(BKTetherController *)self usesDisplayPortTethering])
  {
    [(BKTetherController *)self _setTetherState:0];
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"BKTetherControllerTetherStateChangedNotification" object:self];

    CFDictionaryRef v4 = BKLogDetailed();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v6 = [(BKTetherController *)self isTethered];
      CFStringRef v7 = @"not tethered";
      if (v6) {
        CFStringRef v7 = @"tethered";
      }
      int v8 = 138412290;
      CFStringRef v9 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "DEMO MODE CHANGED: Now %@", (uint8_t *)&v8, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.backboardd.tetherStateChanged", 0, 0, 1u);
  }
}

- (BOOL)usesDisplayPortTethering
{
  if (qword_100123028 != -1) {
    dispatch_once(&qword_100123028, &stru_1000F7798);
  }
  return byte_100123020;
}

- (BOOL)isTethered
{
  if (self->_tetherState) {
    return self->_tetherState == 1;
  }
  if (![(BKTetherController *)self usesDisplayPortTethering])
  {
    mach_port_t v9 = [(BKTetherController *)self _demoCardConnection];
    if (v9)
    {
      uint64_t input = 0;
      uint32_t outputCnt = 0;
      if (IOConnectCallScalarMethod(v9, 0, &input, 1u, 0, &outputCnt)) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
    }
    else
    {
      uint64_t v10 = 2;
    }
    unsigned int v6 = self;
    goto LABEL_15;
  }
  v3 = +[BKSDefaults externalDefaults];
  CFDictionaryRef v4 = [v3 lockdownDefaults];
  unsigned int v5 = [v4 tetheredDisplayPortMode];

  unsigned int v6 = self;
  if (!v5)
  {
    uint64_t v10 = 2;
LABEL_15:
    [(BKTetherController *)v6 _setTetherState:v10];
    return self->_tetherState == 1;
  }
  [(BKTetherController *)self _setTetherState:1];
  if (BSGetDeviceType() == 2) {
    uint64_t v7 = 9;
  }
  else {
    uint64_t v7 = 8;
  }
  [(BKTetherController *)self _postDisplayPortNotificationCode:v7];
  int v8 = sub_10001C32C();
  [(BKTetherController *)self noteInterfaceOrientationChangedWithInterfaceOrientation:sub_1000039E8((uint64_t)v8)];

  return self->_tetherState == 1;
}

- (void)_setTetherState:(int)a3
{
  if (self->_tetherState != a3)
  {
    if ([(BKTetherController *)self usesDisplayPortTethering])
    {
      if (a3 == 1)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100063E9C, @"com.apple.backboardd.deviceinterfaceorientation", 0, CFNotificationSuspensionBehaviorDrop);
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100063E9C, @"com.apple.springboard.hasBlankedScreen", 0, CFNotificationSuspensionBehaviorDrop);
      }
      else if (self->_tetherState == 1)
      {
        unsigned int v6 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(v6, self, @"com.apple.backboardd.deviceinterfaceorientation", 0);
        CFNotificationCenterRemoveObserver(v6, self, @"com.apple.springboard.hasBlankedScreen", 0);
        self->_lastOrientationCode = -1;
      }
    }
    self->_tetherState = a3;
  }
}

- (void)_postDisplayPortNotificationCode:(int)a3
{
  CFDictionaryRef v4 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"com.apple.mobile.demo.mode-%d", *(void *)&a3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 1u);
  unsigned int v6 = BKLogDetailed();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "DEMO MODE NOTIFICATION: %d", buf, 8u);
  }
}

- (unsigned)_demoCardConnection
{
  kern_return_t v11;
  mach_port_t mainPort[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;

  p_demoCardConnection = &self->_demoCardConnection;
  unsigned int result = self->_demoCardConnection;
  if (!result)
  {
    *(void *)mainPort = 0;
    if (IOMainPort(0, &mainPort[1]))
    {
      CFDictionaryRef v4 = BKLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        int v14 = "-[BKTetherController _demoCardConnection]";
        unsigned int v5 = "%s IOMainPort failed";
LABEL_5:
        unsigned int v6 = v4;
        uint32_t v7 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    CFDictionaryRef v8 = IOServiceMatching("AppleTetheredDevice");
    if (v8)
    {
      if (IOServiceGetMatchingServices(mainPort[1], v8, mainPort))
      {
        CFDictionaryRef v4 = BKLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          int v14 = "-[BKTetherController _demoCardConnection]";
          unsigned int v5 = "%s IOServiceGetMatchingServices failed";
          goto LABEL_5;
        }
LABEL_14:

        return 0;
      }
      io_service_t v9 = IOIteratorNext(mainPort[0]);
      if (v9)
      {
        io_object_t v10 = v9;
        BOOL v11 = IOServiceOpen(v9, mach_task_self_, 0, p_demoCardConnection);
        IOObjectRelease(v10);
        if (!v11) {
          return *p_demoCardConnection;
        }
        CFDictionaryRef v4 = BKLogCommon();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315394;
        int v14 = "-[BKTetherController _demoCardConnection]";
        v15 = 2082;
        int v16 = "AppleTetheredDevice";
        unsigned int v5 = "%s IOServiceOpen failed for class '%{public}s'";
      }
      else
      {
        CFDictionaryRef v4 = BKLogCommon();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315394;
        int v14 = "-[BKTetherController _demoCardConnection]";
        v15 = 2082;
        int v16 = "AppleTetheredDevice";
        unsigned int v5 = "%s No %{public}s instance found";
      }
    }
    else
    {
      CFDictionaryRef v4 = BKLogCommon();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315394;
      int v14 = "-[BKTetherController _demoCardConnection]";
      v15 = 2082;
      int v16 = "AppleTetheredDevice";
      unsigned int v5 = "%s IOServiceMatching failed for %{public}s";
    }
    unsigned int v6 = v4;
    uint32_t v7 = 22;
    goto LABEL_13;
  }
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)BKTetherController;
  [(BKTetherController *)&v4 dealloc];
}

- (BKTetherController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKTetherController;
  v2 = [(BKTetherController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    if ([(BKTetherController *)v2 usesDisplayPortTethering])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_100064380, @"com.apple.mobile.demo_mode_changed", 0, CFNotificationSuspensionBehaviorDrop);
      v3->_lastOrientationCode = -1;
    }
    if ([(BKTetherController *)v3 isTethered])
    {
      unsigned int v5 = +[BKSDefaults localDefaults];
      id v6 = [v5 isDitheringEnabled];

      [(BKTetherController *)v3 setDitheringEnabled:v6];
    }
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100123018 != -1) {
    dispatch_once(&qword_100123018, &stru_1000F7778);
  }
  v2 = (void *)qword_100123010;

  return v2;
}

@end