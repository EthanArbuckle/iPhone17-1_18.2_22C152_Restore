@interface BackgroundTaskAgentMonitor
- (BOOL)initNetworkLinkQualityMonitoring;
- (BOOL)initPowerSourceMonitoring;
- (BOOL)isInVoiceCall;
- (BOOL)isPowerPluggedin;
- (BOOL)isRoaming;
- (BOOL)isScreenBlanked;
- (BOOL)pendingNetworkUpdate;
- (BOOL)primaryLinkIsCellular;
- (BOOL)shouldRescheduleTimer;
- (BOOL)systemWillSleep;
- (BackgroundTaskAgentMonitor)initWithTarget:(id)a3 selector:(SEL)a4 queue:(id)a5;
- (NSTimer)networkStabilizationTimer;
- (OS_dispatch_queue)queue;
- (SEL)selector;
- (double)batteryLevel;
- (double)getKernelMonotonicClock;
- (double)lastPowerPluggedinTime;
- (double)lastScreenBlankedTime;
- (double)systemToMonotonicTimeOffset;
- (id)target;
- (int)numAdjustTimeJobs;
- (int)primaryLinkQuality;
- (unsigned)rootDomainConnect;
- (void)cancelNetworkStabilizationTimer;
- (void)dealloc;
- (void)debugPrintMonitorStatus;
- (void)decrementNumAdjustTimeJobs;
- (void)decrementNumJobsNotAllowedDuringVoiceCall;
- (void)decrementNumJobsNotAllowedWhileRoaming;
- (void)decrementNumNetworkJobs;
- (void)decrementNumPowerPluggedinJobs;
- (void)decrementNumScreenBlankedJobs;
- (void)incrementNumAdjustTimeJobs;
- (void)incrementNumJobsNotAllowedDuringVoiceCall;
- (void)incrementNumJobsNotAllowedWhileRoaming;
- (void)incrementNumNetworkJobs;
- (void)incrementNumPowerPluggedinJobs;
- (void)incrementNumScreenBlankedJobs;
- (void)networkStabilizationTimerHandler;
- (void)notifyWhenBatteryLevel:(double)a3;
- (void)processRegistrationNotification;
- (void)rescheduleNetworkStabilizationTimer;
- (void)setIsInVoiceCall:(BOOL)a3;
- (void)setIsScreenBlanked:(BOOL)a3;
- (void)setNetworkStabilizationTimer:(id)a3;
- (void)setPendingNetworkUpdate:(BOOL)a3;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setShouldRescheduleTimer:(BOOL)a3;
- (void)setSystemToMonotonicTimeOffset:(double)a3;
- (void)setSystemWillSleep:(BOOL)a3;
- (void)updateBatteryLevel:(unsigned int)a3;
- (void)updateCallState;
- (void)updateNetworkLinkQuality;
- (void)updatePluggedinState:(unsigned int)a3;
- (void)updateRoamingState;
@end

@implementation BackgroundTaskAgentMonitor

- (BackgroundTaskAgentMonitor)initWithTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)BackgroundTaskAgentMonitor;
  v8 = [(BackgroundTaskAgentMonitor *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_target = a3;
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v8->_selector = v10;
    v8->_queue = (OS_dispatch_queue *)a5;
    v8->_primaryLinkQuality = 0;
    v8->_primaryLinkIsCellular = 0;
    v8->_networkStabilizationTimer = 0;
    v8->_pendingNetworkUpdate = 0;
    if (![(BackgroundTaskAgentMonitor *)v8 initNetworkLinkQualityMonitoring]) {
      goto LABEL_8;
    }
    v9->_isScreenBlanked = 0;
    v9->_numScreenBlankedJobs = 0;
    v9->_lastScreenBlankedTime = -1.0;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    v16 = sub_4070;
    v17 = &unk_C558;
    v18 = v9;
    notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &v9->_screenBlankedToken, (dispatch_queue_t)v9->_queue, handler);
    v16((uint64_t)handler, v9->_screenBlankedToken);
    if ([(BackgroundTaskAgentMonitor *)v9 initPowerSourceMonitoring])
    {
      v9->_numAdjustTimeJobs = 0;
      double Current = CFAbsoluteTimeGetCurrent();
      [(BackgroundTaskAgentMonitor *)v9 getKernelMonotonicClock];
      v9->_systemToMonotonicTimeOffset = Current - v12;
      v9->_numVoiceCallJobs = 0;
      [(BackgroundTaskAgentMonitor *)v9 updateCallState];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_40C0;
      v14[3] = &unk_C4B0;
      v14[4] = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
      v9->_roamStateChanged = 0;
      [(BackgroundTaskAgentMonitor *)v9 updateRoamingState];
      v9->systemPowerPortRef = 0;
      v9->rootDomainConnect = IORegisterForSystemPower(v9, &v9->systemPowerPortRef, (IOServiceInterestCallback)sub_43D0, &v9->pmNotifier);
      IONotificationPortSetDispatchQueue(v9->systemPowerPortRef, (dispatch_queue_t)a5);
      *(_WORD *)&v9->_systemWillSleep = 256;
    }
    else
    {
LABEL_8:

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  IODeregisterForSystemPower(&self->pmNotifier);
  systemPowerPortRef = self->systemPowerPortRef;
  if (systemPowerPortRef)
  {
    IONotificationPortDestroy(systemPowerPortRef);
    self->systemPowerPortRef = 0;
  }
  IOServiceClose(self->rootDomainConnect);
  self->rootDomainConnect = 0;
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  self->_dynamicStore = 0;
  batteryIONotifyPort = self->_batteryIONotifyPort;
  if (batteryIONotifyPort)
  {
    IONotificationPortDestroy(batteryIONotifyPort);
    self->_batteryIONotifyPort = 0;
  }
  io_object_t batteryNotificationRef = self->_batteryNotificationRef;
  if (batteryNotificationRef)
  {
    IOObjectRelease(batteryNotificationRef);
    self->_io_object_t batteryNotificationRef = 0;
  }
  io_object_t batteryEntry = self->_batteryEntry;
  if (batteryEntry)
  {
    IOObjectRelease(batteryEntry);
    self->_io_object_t batteryEntry = 0;
  }
  int screenBlankedToken = self->_screenBlankedToken;
  if (screenBlankedToken) {
    notify_cancel(screenBlankedToken);
  }
  self->_int screenBlankedToken = 0;
  int powerPluggedinToken = self->_powerPluggedinToken;
  if (powerPluggedinToken) {
    notify_cancel(powerPluggedinToken);
  }
  self->_int powerPluggedinToken = 0;
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveEveryObserver();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(BackgroundTaskAgentMonitor *)self cancelNetworkStabilizationTimer];
  v11.receiver = self;
  v11.super_class = (Class)BackgroundTaskAgentMonitor;
  [(BackgroundTaskAgentMonitor *)&v11 dealloc];
}

- (void)notifyWhenBatteryLevel:(double)a3
{
  self->_batteryNotificationThreshold = a3;
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_6C4C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)incrementNumNetworkJobs
{
}

- (void)decrementNumNetworkJobs
{
}

- (void)incrementNumScreenBlankedJobs
{
}

- (void)decrementNumScreenBlankedJobs
{
}

- (void)incrementNumPowerPluggedinJobs
{
}

- (void)decrementNumPowerPluggedinJobs
{
}

- (void)incrementNumAdjustTimeJobs
{
}

- (void)decrementNumAdjustTimeJobs
{
}

- (void)incrementNumJobsNotAllowedDuringVoiceCall
{
}

- (void)decrementNumJobsNotAllowedDuringVoiceCall
{
}

- (void)incrementNumJobsNotAllowedWhileRoaming
{
}

- (void)decrementNumJobsNotAllowedWhileRoaming
{
}

- (void)debugPrintMonitorStatus
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_6CC0(self);
  }
}

- (BOOL)initNetworkLinkQualityMonitoring
{
  v26.version = 0;
  memset(&v26.retain, 0, 24);
  v26.info = self;
  BOOL v3 = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.backgroundtaskagent", (SCDynamicStoreCallBack)sub_4900, &v26);
  self->_dynamicStore = v3;
  if (v3)
  {
    SCDynamicStoreSetDispatchQueue(v3, (dispatch_queue_t)[(BackgroundTaskAgentMonitor *)self queue]);
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    uint64_t v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    CFArrayAppendValue(Mutable, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    CFStringRef v7 = SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCEntNetIPv6);
    CFArrayAppendValue(Mutable, v7);
    CFRelease(v7);
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetLinkQuality);
    CFArrayAppendValue(v5, NetworkInterfaceEntity);
    CFRelease(NetworkInterfaceEntity);
    SCDynamicStoreSetNotificationKeys(self->_dynamicStore, Mutable, v5);
    CFRelease(Mutable);
    CFRelease(v5);
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v9) {
      sub_6D68(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    [(BackgroundTaskAgentMonitor *)self updateNetworkLinkQuality];
  }
  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_6DA4(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  return v3 != 0;
}

- (void)rescheduleNetworkStabilizationTimer
{
  [(BackgroundTaskAgentMonitor *)self setPendingNetworkUpdate:1];
  if ([(BackgroundTaskAgentMonitor *)self systemWillSleep])
  {
    [(BackgroundTaskAgentMonitor *)self setShouldRescheduleTimer:1];
  }
  else
  {
    [(BackgroundTaskAgentMonitor *)self cancelNetworkStabilizationTimer];
    [(BackgroundTaskAgentMonitor *)self setNetworkStabilizationTimer:+[NSTimer timerWithTimeInterval:self target:"networkStabilizationTimerHandler" selector:0 userInfo:0 repeats:5.0]];
    [+[NSRunLoop mainRunLoop] addTimer:[(BackgroundTaskAgentMonitor *)self networkStabilizationTimer] forMode:NSDefaultRunLoopMode];
    BOOL v3 = [(BackgroundTaskAgentMonitor *)self networkStabilizationTimer];
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v4) {
      sub_6DE0(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)networkStabilizationTimerHandler
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4AB0;
  block[3] = &unk_C4B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(BackgroundTaskAgentMonitor *)self queue], block);
}

- (void)cancelNetworkStabilizationTimer
{
  self->_networkStabilizationTimer = 0;
}

- (void)updateNetworkLinkQuality
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFStringRef NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  uint64_t v5 = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCEntNetIPv6);
  CFArrayAppendValue(Mutable, v5);
  uint64_t v6 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFStringRef v7 = (const __CFString *)kSCEntNetCommCenter;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetCommCenter);
  CFArrayAppendValue(v6, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  CFStringRef v9 = (const __CFString *)kSCEntNetLinkQuality;
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetLinkQuality);
  CFArrayAppendValue(v6, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  CFDictionaryRef v11 = SCDynamicStoreCopyMultiple(self->_dynamicStore, Mutable, v6);
  CFRelease(Mutable);
  CFRelease(v6);
  if (NetworkGlobalEntity) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    BOOL v13 = 0;
    LODWORD(Value) = 0;
    goto LABEL_7;
  }
  Value = (__CFString *)CFDictionaryGetValue(v11, NetworkGlobalEntity);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_720C(NetworkGlobalEntity, Value);
  }
  CFStringRef entity = v7;
  if (Value)
  {
    CFTypeID v17 = CFGetTypeID(Value);
    if (v17 == CFDictionaryGetTypeID())
    {
      uint64_t v18 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, kSCDynamicStorePropNetPrimaryInterface);
      CFStringRef v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, kSCDynamicStorePropNetPrimaryService);
      LODWORD(Value) = 1;
    }
    else
    {
      CFStringRef v19 = 0;
      uint64_t v18 = 0;
      LODWORD(Value) = 0;
    }
  }
  else
  {
    CFStringRef v19 = 0;
    uint64_t v18 = 0;
  }
  CFRelease(NetworkGlobalEntity);
  if (!v18 || !v19)
  {
    uint64_t v20 = (void *)CFDictionaryGetValue(v11, v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_716C(v5, v20);
      if (v20)
      {
LABEL_30:
        CFDictionaryRef v35 = v11;
        uint64_t v21 = v18;
        int v22 = (int)Value;
        Value = (__CFString *)v9;
        CFTypeID v23 = CFGetTypeID(v20);
        BOOL v12 = v23 == CFDictionaryGetTypeID();
        CFStringRef v9 = Value;
        LODWORD(Value) = v22;
        uint64_t v18 = v21;
        CFDictionaryRef v11 = v35;
        if (v12)
        {
          uint64_t v18 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v20, kSCDynamicStorePropNetPrimaryInterface);
          CFStringRef v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v20, kSCDynamicStorePropNetPrimaryService);
          LODWORD(Value) = 1;
        }
      }
    }
    else if (v20)
    {
      goto LABEL_30;
    }
  }
  CFRelease(v5);
  BOOL v13 = 0;
  if (v18 && v19)
  {
    CFStringRef v24 = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v19, entity);
    CFStringRef v25 = v9;
    CFStringRef v26 = v24;
    v27 = CFDictionaryGetValue(v11, v24);
    CFRelease(v26);
    BOOL v13 = v27 != 0;
    v28 = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v18, v25);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_70F0(v28);
    }
    v29 = (void *)CFDictionaryGetValue(v11, v28);
    CFRelease(v28);
    if (v29)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_7074(v29);
      }
      CFTypeID v30 = CFGetTypeID(v29);
      if (v30 == CFDictionaryGetTypeID())
      {
        v31 = CFDictionaryGetValue((CFDictionaryRef)v29, v25);
        CFTypeID v32 = CFGetTypeID(v31);
        if (v32 == CFNumberGetTypeID())
        {
          int valuePtr = 0;
          CFNumberGetValue((CFNumberRef)v31, kCFNumberIntType, &valuePtr);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_6FF0(&valuePtr);
          }
          int v33 = valuePtr;
          if ((valuePtr - 51) >= 0x32)
          {
            if ((valuePtr + 1) >= 0x34)
            {
              BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v33 == -2)
              {
                if (v34) {
                  sub_6EE8(v18);
                }
              }
              else if (v34)
              {
                sub_6F70(v33);
              }
            }
          }
          else
          {
            LODWORD(Value) = 2;
          }
        }
      }
    }
  }
LABEL_7:
  [(BackgroundTaskAgentMonitor *)self updateRoamingState];
  [(BackgroundTaskAgentMonitor *)self setPendingNetworkUpdate:0];
  if (Value != self->_primaryLinkQuality || self->_primaryLinkIsCellular != v13 || self->_roamStateChanged)
  {
    self->_primaryLinkQuality = (int)Value;
    self->_primaryLinkIsCellular = v13;
    self->_roamStateChanged = 0;
    if (self->_numNetworkJobs >= 1)
    {
      if (self->_selector) {
        SEL selector = self->_selector;
      }
      else {
        SEL selector = 0;
      }
      [self->_target performSelector:selector withObject:0];
    }
  }
  [+[NSNotificationCenter defaultCenter] postNotificationName:@"kBTANetworkHasStabilized" object:0];
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    if (!v11) {
      return;
    }
    goto LABEL_22;
  }
  sub_6E58(v13, (int)Value);
  if (v11) {
LABEL_22:
  }
    CFRelease(v11);
}

- (void)setIsScreenBlanked:(BOOL)a3
{
  if (self->_isScreenBlanked != a3)
  {
    BOOL v3 = a3;
    self->_isScreenBlanked = a3;
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        sub_72AC(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      double Current = CFAbsoluteTimeGetCurrent();
    }
    else
    {
      double Current = -1.0;
      if (v5) {
        sub_72E8(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    self->_lastScreenBlankedTime = Current;
    if (self->_numScreenBlankedJobs >= 1)
    {
      if (self->_selector) {
        SEL selector = self->_selector;
      }
      else {
        SEL selector = 0;
      }
      [self->_target performSelector:selector withObject:0];
    }
  }
}

- (BOOL)initPowerSourceMonitoring
{
  kern_return_t v14;

  self->_isPowerPluggedin = 0;
  self->_numPowerPluggedinJobs = 0;
  self->_lastPowerPluggedinTime = -1.0;
  self->_batteryNotificationThreshold = 101.0;
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_73A4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_batteryIONotifyPort = v11;
  IONotificationPortSetDispatchQueue(v11, (dispatch_queue_t)[(BackgroundTaskAgentMonitor *)self queue]);
  CFDictionaryRef v12 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v12);
  self->_io_object_t batteryEntry = MatchingService;
  uint64_t v14 = IOServiceAddInterestNotification(self->_batteryIONotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)sub_5234, self, &self->_batteryNotificationRef);
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_7324(v14);
    }
  }
  else
  {
    [(BackgroundTaskAgentMonitor *)self updateBatteryLevel:self->_batteryEntry];
    [(BackgroundTaskAgentMonitor *)self updatePluggedinState:self->_batteryEntry];
  }
  return v14 == 0;
}

- (void)updateBatteryLevel:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", kCFAllocatorDefault, 0);
  uint64_t v6 = (void *)IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", kCFAllocatorDefault, 0);
  uint64_t v7 = v6;
  if (CFProperty) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (!CFProperty)
    {
      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    [v6 doubleValue];
    double v22 = v21 * 100.0;
    [CFProperty doubleValue];
    self->_batteryLevel = v22 / v23;
  }
  CFRelease(CFProperty);
  if (v7) {
LABEL_8:
  }
    CFRelease(v7);
LABEL_9:
  if (self->_batteryLevel >= self->_batteryNotificationThreshold)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v9) {
      sub_7420(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    SEL selector = self->_selector;
    p_SEL selector = &self->_selector;
    SEL v17 = selector;
    p_selector[15] = (SEL)0x4059400000000000;
    if (selector) {
      SEL v20 = v17;
    }
    else {
      SEL v20 = 0;
    }
    [(id)*(p_selector - 1) performSelector:v20 withObject:0];
  }
}

- (void)updatePluggedinState:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalConnected", kCFAllocatorDefault, 0);
  int isPowerPluggedin = self->_isPowerPluggedin;
  unsigned int v6 = [CFProperty intValue];
  int v7 = v6 == 1;
  self->_int isPowerPluggedin = v7;
  if (isPowerPluggedin != v7)
  {
    unsigned int v8 = v6;
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v8 == 1)
    {
      if (v9) {
        sub_7494(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      double Current = CFAbsoluteTimeGetCurrent();
    }
    else
    {
      double Current = -1.0;
      if (v9) {
        sub_74D0(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    self->_lastPowerPluggedinTime = Current;
    if (self->_numPowerPluggedinJobs >= 1)
    {
      if (self->_selector) {
        SEL selector = self->_selector;
      }
      else {
        SEL selector = 0;
      }
      [self->_target performSelector:selector withObject:0];
    }
  }
}

- (double)getKernelMonotonicClock
{
  int v14 = 0;
  size_t v13 = 4;
  if ((byte_D93C & 1) == 0)
  {
    if (sysctlnametomib("kern.monotonicclock", dword_D940, (size_t *)&dword_D930))
    {
      BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      double v10 = -1.0;
      if (v2) {
        sub_7638(v2, v3, v4, v5, v6, v7, v8, v9);
      }
      return v10;
    }
    byte_D93C = 1;
  }
  if (sysctl(dword_D940, dword_D930, &v14, &v13, 0, 0))
  {
    double v10 = -1.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_7590();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_750C(&v14);
    }
    LODWORD(v11) = v14;
    return (double)v11 + 0.5;
  }
  return v10;
}

- (void)setIsInVoiceCall:(BOOL)a3
{
  if (self->_isInVoiceCall != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5) {
        sub_7674(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    else if (v5)
    {
      sub_76B0(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    self->_isInVoiceCall = v3;
    if (self->_numVoiceCallJobs >= 1)
    {
      if (self->_selector) {
        SEL selector = self->_selector;
      }
      else {
        SEL selector = 0;
      }
      [self->_target performSelector:selector withObject:0];
    }
  }
}

- (void)updateCallState
{
  BOOL v3 = (void *)CTCopyCurrentCalls();
  id v4 = v3;
  if (!v3 || ![v3 count]) {
    goto LABEL_10;
  }
  [v3 objectAtIndex:0];
  int Status = CTCallGetStatus();
  if ((Status - 1) < 4)
  {
    uint64_t v6 = self;
    uint64_t v7 = 1;
LABEL_11:
    [(BackgroundTaskAgentMonitor *)v6 setIsInVoiceCall:v7];
    return;
  }
  if (Status == 5 || Status == 0)
  {
LABEL_10:
    uint64_t v6 = self;
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v9) {
    sub_76EC(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

- (void)updateRoamingState
{
  BOOL isRoaming = self->_isRoaming;
  int Status = (const void *)CTRegistrationGetStatus();
  if (Status && CFEqual(Status, kCTRegistrationStatusRegisteredRoaming))
  {
    self->_BOOL isRoaming = 1;
    if (!isRoaming && self->_numRoamJobs)
    {
      self->_roamStateChanged = 1;
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v5) {
        sub_7764(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  else
  {
    self->_BOOL isRoaming = 0;
    if (isRoaming && self->_numRoamJobs != 0)
    {
      self->_roamStateChanged = 1;
      BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v14) {
        sub_7728(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
}

- (void)processRegistrationNotification
{
  [(BackgroundTaskAgentMonitor *)self updateRoamingState];
  if (self->_roamStateChanged)
  {
    if (self->_isRoaming)
    {
      id target = self->_target;
      if (self->_selector) {
        SEL selector = self->_selector;
      }
      else {
        SEL selector = 0;
      }
      [target performSelector:selector withObject:0];
    }
    else
    {
      [(BackgroundTaskAgentMonitor *)self rescheduleNetworkStabilizationTimer];
    }
  }
}

- (int)primaryLinkQuality
{
  return self->_primaryLinkQuality;
}

- (BOOL)primaryLinkIsCellular
{
  return self->_primaryLinkIsCellular;
}

- (BOOL)isScreenBlanked
{
  return self->_isScreenBlanked;
}

- (double)lastScreenBlankedTime
{
  return self->_lastScreenBlankedTime;
}

- (BOOL)isPowerPluggedin
{
  return self->_isPowerPluggedin;
}

- (double)lastPowerPluggedinTime
{
  return self->_lastPowerPluggedinTime;
}

- (BOOL)isInVoiceCall
{
  return self->_isInVoiceCall;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isRoaming
{
  return self->_isRoaming;
}

- (BOOL)pendingNetworkUpdate
{
  return self->_pendingNetworkUpdate;
}

- (void)setPendingNetworkUpdate:(BOOL)a3
{
  self->_pendingNetworkUpdate = a3;
}

- (BOOL)systemWillSleep
{
  return self->_systemWillSleep;
}

- (void)setSystemWillSleep:(BOOL)a3
{
  self->_systemWillSleep = a3;
}

- (BOOL)shouldRescheduleTimer
{
  return self->_shouldRescheduleTimer;
}

- (void)setShouldRescheduleTimer:(BOOL)a3
{
  self->_shouldRescheduleTimer = a3;
}

- (id)target
{
  return self->_target;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (NSTimer)networkStabilizationTimer
{
  return self->_networkStabilizationTimer;
}

- (void)setNetworkStabilizationTimer:(id)a3
{
  self->_networkStabilizationTimer = (NSTimer *)a3;
}

- (int)numAdjustTimeJobs
{
  return self->_numAdjustTimeJobs;
}

- (double)systemToMonotonicTimeOffset
{
  return self->_systemToMonotonicTimeOffset;
}

- (void)setSystemToMonotonicTimeOffset:(double)a3
{
  self->_systemToMonotonicTimeOffset = a3;
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (unsigned)rootDomainConnect
{
  return self->rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->rootDomainConnect = a3;
}

@end