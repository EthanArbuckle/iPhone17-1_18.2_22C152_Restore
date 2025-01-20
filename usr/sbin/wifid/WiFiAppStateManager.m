@interface WiFiAppStateManager
+ (id)sharedWiFiAppStateManager;
- (BOOL)_appUsesBackgroundNetwork:(int)a3;
- (BOOL)_appUsesWiFiNetwork:(int)a3;
- (BOOL)_isMonitoringChangesForBundleID:(__CFString *)a3;
- (BOOL)appInForeground;
- (WiFiAppStateManager)init;
- (id)_getStringOfAppState:(unsigned int)a3;
- (int)_getAppCapabilitiesForBundleID:(int)a3;
- (void)_appStateChanged:(unsigned int)a3 bundleID:(__CFString *)a4 capabilities:(int)a5;
- (void)_applicationStateMonitorHandler:(__CFDictionary *)a3;
- (void)_registerApplication:(__CFString *)a3 capabilities:(int)a4;
- (void)_setApplicationState:(__CFString *)a3 active:(BOOL)a4 underLock:(BOOL)a5 capabilities:(int)a6;
- (void)_unRegisterApplication:(__CFString *)a3;
- (void)dealloc;
- (void)externalAppUnregistered:(__CFDictionary *)a3;
- (void)registerAppReporterCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerAppUnregistrationFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerBundleCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)registerForegroundAppTrackerFunctionPtr:(void *)a3 withContext:(void *)a4;
- (void)scheduleWithQueue:(id)a3;
- (void)setAppInForeground:(BOOL)a3;
- (void)startMonitoringBundleId:(__CFString *)a3;
- (void)stopMonitoringBundleId:(__CFString *)a3;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation WiFiAppStateManager

- (void)_setApplicationState:(__CFString *)a3 active:(BOOL)a4 underLock:(BOOL)a5 capabilities:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v11 = sub_1000246A4(a3);
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null bundleID", @"-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]"];
    }
    goto LABEL_46;
  }
  unsigned int v12 = v11;
  activeApplications = self->_activeApplications;
  if (!activeApplications)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: null active applications", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]"];
    }
    goto LABEL_46;
  }
  if (!self->_backgroundApplications)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null background applications", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]")
    }
    goto LABEL_46;
  }
  if (!v12)
  {
    unsigned int v12 = [+[WiFiUserInteractionMonitor sharedInstance] hasRealTimeAppProperty:a3];
    activeApplications = self->_activeApplications;
  }
  unsigned __int8 Count = CFSetGetCount(activeApplications);
  unsigned __int8 v15 = CFSetGetCount(self->_backgroundApplications);
  v16 = self->_activeApplications;
  if (v8)
  {
    CFSetAddValue(v16, a3);
    backgroundApplications = self->_backgroundApplications;
  }
  else
  {
    CFSetRemoveValue(v16, a3);
    unsigned __int8 v18 = [(WiFiAppStateManager *)self _appUsesBackgroundNetwork:v6];
    backgroundApplications = self->_backgroundApplications;
    if ((v18 & 1) != 0 || v7)
    {
      CFSetAddValue(backgroundApplications, a3);
      goto LABEL_12;
    }
  }
  CFSetRemoveValue(backgroundApplications, a3);
LABEL_12:
  unsigned __int8 v19 = CFSetGetCount(self->_activeApplications);
  unsigned __int8 v20 = CFSetGetCount(self->_backgroundApplications);
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s %d bgBefore=%d bgAfter=%d fgBefore=%d fgAfter=%d", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]", 401, v15, v20, Count, v19);
  }
  if (Count == v19)
  {
    int v22 = 0;
LABEL_16:
    if (v15 >= v20) {
      int v23 = 8;
    }
    else {
      int v23 = 4;
    }
    if (v15 == v20) {
      int v24 = v22;
    }
    else {
      int v24 = v23;
    }
    if (self->_queue)
    {
      if (self->_callbackFunction)
      {
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        uint64_t v36 = 0;
        CFTypeRef v25 = CFRetain(a3);
        v34[3] = (uint64_t)v25;
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100023DA8;
        block[3] = &unk_1002426F0;
        int v32 = v24;
        block[4] = self;
        block[5] = &v33;
        dispatch_async(queue, block);
        _Block_object_dispose(&v33, 8);
      }
    }
    else
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: No queue", "-[WiFiAppStateManager _setApplicationState:active:underLock:capabilities:]")
      }
    }
    return;
  }
  if (Count >= v19)
  {
    [(WiFiAppStateManager *)self setAppInForeground:0];
    v28 = self->_queue;
    if (v28)
    {
      int v22 = 2;
      if (self->_appReporterCallbackFunction && v12)
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10015EF0C;
        v37[3] = &unk_1002426C8;
        int v38 = 0;
        v37[4] = self;
        dispatch_async(v28, v37);
        int v22 = 2;
      }
      goto LABEL_16;
    }
  }
  else
  {
    [(WiFiAppStateManager *)self setAppInForeground:1];
    v27 = self->_queue;
    if (v27)
    {
      int v22 = 1;
      if (self->_appReporterCallbackFunction && v12)
      {
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10015EEA4;
        v39[3] = &unk_1002426C8;
        unsigned int v40 = v12;
        v39[4] = self;
        dispatch_async(v27, v39);
        int v22 = 1;
      }
      goto LABEL_16;
    }
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:@"%s: Nil queue" message:3];
  }
LABEL_46:
}

- (void)_applicationStateMonitorHandler:(__CFDictionary *)a3
{
  value = 0;
  unsigned int valuePtr = 0;
  v41 = 0;
  unsigned int v40 = 0;
  v39 = 0;
  unsigned int v38 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3052000000;
  uint64_t v35 = sub_100022D38;
  uint64_t v36 = sub_100022C2C;
  uint64_t v37 = 0;
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null userInfo", @"-[WiFiAppStateManager _applicationStateMonitorHandler:]"];
    }
    goto LABEL_57;
  }
  if (!self->_queue)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: Nil queue", "-[WiFiAppStateManager _applicationStateMonitorHandler:]"];
    }
    goto LABEL_57;
  }
  if (CFDictionaryGetValueIfPresent(a3, BKSApplicationStateProcessIDKey, (const void **)&value)) {
    BOOL v5 = value == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
  }
  if (!valuePtr)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: pidForStateChange(%d)", "-[WiFiAppStateManager _applicationStateMonitorHandler:]", valuePtr];
    }
    goto LABEL_57;
  }
  uint64_t v6 = CFDictionaryGetValue(a3, BKSApplicationStateDisplayIDKey);
  if (!v6)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _applicationStateMonitorHandler:]");
    }
    goto LABEL_57;
  }
  applications = self->_applications;
  if (!applications)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, @"%s: null applications", @"-[WiFiAppStateManager _applicationStateMonitorHandler:]"];
    }
    goto LABEL_57;
  }
  if (CFDictionaryGetValueIfPresent(applications, v6, (const void **)&v41))
  {
    if (v41) {
      CFNumberGetValue((CFNumberRef)v41, kCFNumberIntType, &v40);
    }
  }
  else
  {
    uint64_t v8 = [(WiFiAppStateManager *)self _getAppCapabilitiesForBundleID:valuePtr];
    unsigned int v40 = v8;
    [(WiFiAppStateManager *)self _registerApplication:v6 capabilities:v8];
  }
  if (!CFDictionaryGetValueIfPresent(a3, BKSApplicationStateKey, (const void **)&v39))
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: Null BKSApplicationStateKey", @"-[WiFiAppStateManager _applicationStateMonitorHandler:]"];
    }
LABEL_57:
    goto LABEL_44;
  }
  CFNumberGetValue((CFNumberRef)v39, kCFNumberIntType, &v38);
  unsigned int v9 = v38;
  CFTypeRef v10 = CFRetain(v6);
  v33[5] = (uint64_t)v10;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014404;
  block[3] = &unk_100242678;
  BOOL v30 = v9 != 1;
  BOOL v31 = v9 == 8;
  unsigned int v29 = v40;
  block[4] = self;
  block[5] = &v32;
  dispatch_async(queue, block);
  if ([(WiFiAppStateManager *)self _appUsesWiFiNetwork:v40]
    || [+[WiFiUserInteractionMonitor sharedInstance] hasRealTimeAppProperty:v6])
  {
    [(WiFiAppStateManager *)self _appStateChanged:v38 bundleID:v6 capabilities:v40];
  }
  if ([(WiFiAppStateManager *)self _isMonitoringChangesForBundleID:v6]
    && self->_bundleCallbackFunction)
  {
    unsigned int v12 = self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10015ED70;
    v26[3] = &unk_1002426A0;
    v26[4] = self;
    v26[5] = v6;
    unsigned int v27 = v38;
    dispatch_async(v12, v26);
  }
  unsigned int v13 = v38;
  if (v38 == 1)
  {
    [(WiFiAppStateManager *)self _unRegisterApplication:v6];
    unsigned int v13 = v38;
  }
  if (v13 - 1 < 2 || v13 == 4)
  {
    foregroundAppBundleIDs = self->_foregroundAppBundleIDs;
    if (foregroundAppBundleIDs)
    {
      if ([(NSMutableArray *)foregroundAppBundleIDs containsObject:v6])
      {
        [(NSMutableArray *)self->_foregroundAppBundleIDs removeObject:v6];
        if (self->_fgAppTrackerCallbackContext)
        {
          if (self->_fgAppTrackerCallbackFunction && self->_queue)
          {
            uint64_t v22 = 0;
            int v23 = &v22;
            uint64_t v24 = 0x2020000000;
            id v25 = 0;
            if ([(NSMutableArray *)self->_foregroundAppBundleIDs count])
            {
              id v18 = [[-[NSMutableArray lastObject](self->_foregroundAppBundleIDs) copy];
              v23[3] = (uint64_t)v18;
            }
            unsigned __int8 v15 = self->_queue;
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_10015ED84;
            v20[3] = &unk_100242650;
            v20[4] = self;
            v20[5] = &v22;
            v16 = v20;
            goto LABEL_43;
          }
        }
      }
    }
  }
  else if (v13 == 8)
  {
    v14 = self->_foregroundAppBundleIDs;
    if (v14
      || (v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
          (self->_foregroundAppBundleIDs = v14) != 0))
    {
      if (([(NSMutableArray *)v14 containsObject:v6] & 1) == 0) {
        [(NSMutableArray *)self->_foregroundAppBundleIDs addObject:v6];
      }
    }
    if (self->_fgAppTrackerCallbackContext && self->_fgAppTrackerCallbackFunction && self->_queue)
    {
      uint64_t v22 = 0;
      int v23 = &v22;
      uint64_t v24 = 0x2020000000;
      id v25 = (id)0xAAAAAAAAAAAAAAAALL;
      id v25 = [[-[NSMutableArray lastObject](self->_foregroundAppBundleIDs) copy];
      unsigned __int8 v15 = self->_queue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000810C;
      v21[3] = &unk_100242650;
      v21[4] = self;
      v21[5] = &v22;
      v16 = v21;
LABEL_43:
      dispatch_async(v15, v16);
      _Block_object_dispose(&v22, 8);
    }
  }
LABEL_44:
  _Block_object_dispose(&v32, 8);
}

- (BOOL)_appUsesWiFiNetwork:(int)a3
{
  return (a3 & 6) != 0;
}

- (BOOL)_isMonitoringChangesForBundleID:(__CFString *)a3
{
  if (a3)
  {
    CFSetRef bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor)
    {
      CFSetRef bundleIdsToMonitor = (const __CFSet *)CFSetGetCount(bundleIdsToMonitor);
      if (bundleIdsToMonitor) {
        LOBYTE(bundleIdsToMonitor) = CFSetContainsValue(self->_bundleIdsToMonitor, a3) != 0;
      }
    }
  }
  else
  {
    LOBYTE(bundleIdsToMonitor) = 0;
  }
  return (char)bundleIdsToMonitor;
}

- (void)_registerApplication:(__CFString *)a3 capabilities:(int)a4
{
  int valuePtr = a4;
  if (a3)
  {
    CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      applications = self->_applications;
      if (applications)
      {
        CFDictionaryAddValue(applications, a3, v7);
      }
      else
      {
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:3 message:@"%s: null _applications" arguments:("-[WiFiAppStateManager _registerApplication:capabilities:]")];
        }
      }
      CFRelease(v7);
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3 message:@"%s: null capabilitiesRef" args:("-[WiFiAppStateManager _registerApplication:capabilities:]")];
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null bundleID", @"-[WiFiAppStateManager _registerApplication:capabilities:]"];
    }
  }
}

- (int)_getAppCapabilitiesForBundleID:(int)a3
{
  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    uint64_t v5 = *(void *)&a3;
    id v6 = [(BKSApplicationStateMonitor *)applicationStateMonitor bundleInfoValueForKey:@"SBUsesNetwork" PID:*(void *)&a3];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        LODWORD(v6) = [v6 unsignedIntValue];
      }
      else {
        LODWORD(v6) = 0;
      }
    }
    id v7 = [(BKSApplicationStateMonitor *)self->_applicationStateMonitor bundleInfoValueForKey:@"UIRequiresPersistentWiFi" PID:v5];
    if (v7)
    {
      uint64_t v8 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v8 BOOLValue]) {
          LODWORD(v6) = v6 | 2;
        }
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null _applicationStateMonitor", @"-[WiFiAppStateManager _getAppCapabilitiesForBundleID:]"];
    }
    LODWORD(v6) = 0;
  }
  return (int)v6;
}

- (void)setAppInForeground:(BOOL)a3
{
  self->_appInForeground = a3;
}

- (void)_appStateChanged:(unsigned int)a3 bundleID:(__CFString *)a4 capabilities:(int)a5
{
  if (a4)
  {
    switch(a3)
    {
      case 1u:
      case 2u:
      case 4u:
        id v6 = a4;
        uint64_t v7 = 0;
        goto LABEL_5;
      case 8u:
        id v6 = a4;
        uint64_t v7 = 1;
LABEL_5:
        [(WiFiAppStateManager *)self _setApplicationState:v6 active:v7 underLock:0 capabilities:*(void *)&a5];
        break;
      default:
        return;
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null bundleID", "-[WiFiAppStateManager _appStateChanged:bundleID:capabilities:]")
    }
  }
}

+ (id)sharedWiFiAppStateManager
{
  if (qword_10027DBE8 != -1) {
    dispatch_once(&qword_10027DBE8, &stru_100242600);
  }
  return (id)qword_10027DBE0;
}

- (void)scheduleWithQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();

  CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)sub_10015E844, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unscheduleFromQueue:(id)a3
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationUnregistered", 0);
  self->_queue = 0;
}

- (WiFiAppStateManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WiFiAppStateManager;
  v2 = [(WiFiAppStateManager *)&v13 init];
  if (!v2)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: failed in super-init", @"-[WiFiAppStateManager init]"];
    }
    goto LABEL_25;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v2->_applications = Mutable;
  if (!Mutable)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null _applications" args:("-[WiFiAppStateManager init]", nil)];
    }
    goto LABEL_25;
  }
  CFMutableSetRef v4 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_activeApplications = v4;
  if (!v4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null _activeApplications", @"-[WiFiAppStateManager init]"];
    }
    goto LABEL_25;
  }
  CFMutableSetRef v5 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_backgroundApplications = v5;
  if (!v5)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null _backgroundApplications", "-[WiFiAppStateManager init]")
    }
    goto LABEL_25;
  }
  CFMutableSetRef v6 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_appsInForeground = v6;
  if (!v6)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: null _appsInForeground", "-[WiFiAppStateManager init]"];
    }
    goto LABEL_25;
  }
  if (!objc_opt_class())
  {
LABEL_26:

    return 0;
  }
  uint64_t v7 = (BKSApplicationStateMonitor *)[objc_alloc((Class)BKSApplicationStateMonitor) initWithBundleIDs:0 states:9];
  v2->_applicationStateMonitor = v7;
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null _applicationStateMonitor", @"-[WiFiAppStateManager init]"];
    }
    goto LABEL_25;
  }
  CFMutableSetRef v8 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v2->_CFSetRef bundleIdsToMonitor = v8;
  if (!v8)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null _bundleIdsToMonitor", @"-[WiFiAppStateManager init]"];
    }
LABEL_25:
    goto LABEL_26;
  }
  applicationStateMonitor = v2->_applicationStateMonitor;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005650;
  v12[3] = &unk_100242628;
  v12[4] = v2;
  [(BKSApplicationStateMonitor *)applicationStateMonitor setHandler:v12];
  return v2;
}

- (void)externalAppUnregistered:(__CFDictionary *)a3
{
  if (self->_unregisteredCallbackContext && a3 && self->_unregisteredCallbackFunction)
  {
    if (self->_queue)
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      CFTypeRef v7 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      CFTypeRef v7 = CFRetain(a3);
      queue = self->_queue;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10015EC3C;
      v5[3] = &unk_100242650;
      v5[4] = self;
      v5[5] = v6;
      dispatch_async(queue, v5);
      _Block_object_dispose(v6, 8);
    }
  }
}

- (void)dealloc
{
  applications = self->_applications;
  if (applications)
  {
    CFRelease(applications);
    self->_applications = 0;
  }
  activeApplications = self->_activeApplications;
  if (activeApplications)
  {
    CFRelease(activeApplications);
    self->_activeApplications = 0;
  }
  backgroundApplications = self->_backgroundApplications;
  if (backgroundApplications)
  {
    CFRelease(backgroundApplications);
    self->_backgroundApplications = 0;
  }
  appsInForeground = self->_appsInForeground;
  if (appsInForeground)
  {
    CFRelease(appsInForeground);
    self->_appsInForeground = 0;
  }
  CFSetRef bundleIdsToMonitor = self->_bundleIdsToMonitor;
  if (bundleIdsToMonitor)
  {
    CFRelease(bundleIdsToMonitor);
    self->_CFSetRef bundleIdsToMonitor = 0;
  }
  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    [(BKSApplicationStateMonitor *)applicationStateMonitor invalidate];
    unsigned int v9 = self->_applicationStateMonitor;
    if (v9)
    {
      CFRelease(v9);
      self->_applicationStateMonitor = 0;
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)WiFiAppStateManager;
  [(WiFiAppStateManager *)&v10 dealloc];
}

- (void)registerCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_callbackContext = a4;
  self->_callbackFunction = a3;
}

- (void)registerBundleCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_bundleCallbackContext = a4;
  self->_bundleCallbackFunction = a3;
}

- (void)registerAppUnregistrationFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_unregisteredCallbackContext = a4;
  self->_unregisteredCallbackFunction = a3;
}

- (void)registerForegroundAppTrackerFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_fgAppTrackerCallbackContext = a4;
  self->_fgAppTrackerCallbackFunction = a3;
}

- (void)registerAppReporterCallbackFunctionPtr:(void *)a3 withContext:(void *)a4
{
  self->_appReporterCallbackContext = a4;
  self->_appReporterCallbackFunction = a3;
}

- (void)_unRegisterApplication:(__CFString *)a3
{
  if (a3)
  {
    applications = self->_applications;
    if (applications)
    {
      CFDictionaryRemoveValue(applications, a3);
      return;
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s: null _applications", "-[WiFiAppStateManager _unRegisterApplication:]"];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null bundleID" args:("-[WiFiAppStateManager _unRegisterApplication:]")];
    }
  }
}

- (id)_getStringOfAppState:(unsigned int)a3
{
  if (a3 - 1 > 7) {
    return @"WiFiApplicationStateUnknown";
  }
  else {
    return off_100242710[a3 - 1];
  }
}

- (BOOL)_appUsesBackgroundNetwork:(int)a3
{
  return (a3 >> 3) & 1;
}

- (void)startMonitoringBundleId:(__CFString *)a3
{
  if (a3)
  {
    CFSetRef bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor) {
      CFSetAddValue(bundleIdsToMonitor, a3);
    }
  }
}

- (void)stopMonitoringBundleId:(__CFString *)a3
{
  if (a3)
  {
    CFSetRef bundleIdsToMonitor = self->_bundleIdsToMonitor;
    if (bundleIdsToMonitor) {
      CFSetRemoveValue(bundleIdsToMonitor, a3);
    }
  }
}

- (BOOL)appInForeground
{
  return self->_appInForeground;
}

@end