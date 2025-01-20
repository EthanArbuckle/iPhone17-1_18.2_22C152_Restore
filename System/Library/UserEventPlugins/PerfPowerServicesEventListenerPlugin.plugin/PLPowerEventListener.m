@interface PLPowerEventListener
+ (BOOL)hasAOD;
+ (BOOL)hasBaseband;
+ (BOOL)hasDCP;
+ (BOOL)isiPhone;
+ (BOOL)nonUIBuild;
+ (BOOL)supportsLPM;
+ (id)valueForMobileGestaltCapability:(id)a3;
- (BOOL)registerForIOMFBNotifications;
- (BOOL)registerForIOService:(unsigned int)a3 withCallback:(void *)a4;
- (BOOL)setupBacklightService;
- (OS_dispatch_queue)AODNotificationQueue;
- (OS_dispatch_queue)LPMNotificationQueue;
- (PLPowerEventListener)initWithQueue:(id)a3;
- (__IOMobileFramebuffer)frameBuffer;
- (id)getCurrentSupplementalDataForInterface:(char *)a3;
- (id)wakeReason;
- (unsigned)rootDomainConnect;
- (void)LPMStatusChanged:(id)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)batteryStatusChanged:(id)a3;
- (void)bucketize:(unsigned int)a3;
- (void)dealloc;
- (void)logAggdNetstatsForInterface:(char *)a3 WithCurrStats:(if_packet_stats *)a4 WithPrevStats:(if_packet_stats *)a5;
- (void)logBrightnessBuckets;
- (void)logCANetstatsForInterface:(char *)a3 WithCurrStats:(if_packet_stats *)a4 WithPrevStats:(if_packet_stats *)a5;
- (void)logNetworkSupplementalStatsForInterface:(char *)a3;
- (void)logSupStats;
- (void)setAODNotificationQueue:(id)a3;
- (void)setFrameBuffer:(__IOMobileFramebuffer *)a3;
- (void)setLPMNotificationQueue:(id)a3;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setupBatterySaverModeForNotification:(id)a3;
- (void)systemPoweredOn;
- (void)validateCurrentStatistics:(if_packet_stats *)a3 withPrevious:(if_packet_stats *)a4;
@end

@implementation PLPowerEventListener

+ (BOOL)hasDCP
{
  if (qword_13D20 != -1) {
    dispatch_once(&qword_13D20, &stru_10518);
  }
  return byte_13D18;
}

+ (id)valueForMobileGestaltCapability:(id)a3
{
  v3 = (const void *)MGCopyAnswerWithError();
  id result = (id)CFMakeCollectable(v3);
  qword_13D28 = (uint64_t)result;
  return result;
}

+ (BOOL)isiPhone
{
  if (qword_13D38 != -1) {
    dispatch_once(&qword_13D38, &stru_10538);
  }
  return byte_13D30;
}

+ (BOOL)hasAOD
{
  if (qword_13D48 != -1) {
    dispatch_once(&qword_13D48, &stru_10558);
  }
  return byte_13D40;
}

+ (BOOL)hasBaseband
{
  if (qword_13D58 != -1) {
    dispatch_once(&qword_13D58, &stru_10578);
  }
  return byte_13D50;
}

+ (BOOL)nonUIBuild
{
  if (qword_13D68 != -1) {
    dispatch_once(&qword_13D68, &stru_10598);
  }
  return byte_13D60;
}

+ (BOOL)supportsLPM
{
  if (qword_13D78 != -1) {
    dispatch_once(&qword_13D78, &stru_105B8);
  }
  return byte_13D70;
}

- (PLPowerEventListener)initWithQueue:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PLPowerEventListener;
  v4 = [(PLPowerEventListener *)&v12 init];
  if (!v4) {
    goto LABEL_16;
  }
  v4->prev_ifmsupp_pstats = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_loggingLock._os_unfair_lock_opaque = 0;
  v5 = IONotificationPortCreate(kIOMasterPortDefault);
  v4->ioNotifyPort = v5;
  IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)a3);
  CFDictionaryRef v6 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
  v4->batteryEntry = MatchingService;
  uint64_t v8 = IOServiceAddInterestNotification(v4->ioNotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)sub_601C, v4, &v4->notificationRef);
  if (!v8)
  {
    v4->systemPowerPortRef = 0;
    v4->rootDomainConnect = IORegisterForSystemPower(v4, &v4->systemPowerPortRef, (IOServiceInterestCallback)sub_60B4, &v4->pmNotifier);
    IONotificationPortSetDispatchQueue(v4->systemPowerPortRef, (dispatch_queue_t)a3);
    if (+[PLPowerEventListener hasAOD])
    {
      v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v4->_AODNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create(0, v9);
      objc_msgSend(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"), "addObserver:", v4);
    }
    if (+[PLPowerEventListener hasDCP])
    {
      if (![(PLPowerEventListener *)v4 registerForIOMFBNotifications])
      {
LABEL_8:
        if (qword_13D10 != -1) {
          dispatch_once(&qword_13D10, &stru_104F8);
        }
        v10 = off_13B50;
        if (os_log_type_enabled((os_log_t)off_13B50, OS_LOG_TYPE_ERROR)) {
          sub_AC0C(v10);
        }
        return 0;
      }
    }
    else if (![(PLPowerEventListener *)v4 setupBacklightService])
    {
      goto LABEL_8;
    }
    if (+[PLPowerEventListener supportsLPM]) {
      [(PLPowerEventListener *)v4 setupBatterySaverModeForNotification:@"com.apple.system.lowpowermode"];
    }
LABEL_16:
    [(PLPowerEventListener *)v4 logSupStats];
    +[NSTimer scheduledTimerWithTimeInterval:v4 target:"logSupStats" selector:0 userInfo:1 repeats:86400.0];
    +[NSTimer scheduledTimerWithTimeInterval:v4 target:"logBrightnessBuckets" selector:0 userInfo:1 repeats:86400.0];
    return v4;
  }
  NSLog(&cfstr_ErrorCallingIo.isa, v8);

  return 0;
}

- (BOOL)setupBacklightService
{
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:1], @"backlight-control"), @"IOPropertyMatch"));
  self->backlightService = MatchingService;
  self->notificationRef = 0;
  uint64_t v4 = IOServiceAddInterestNotification(self->ioNotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)sub_6354, self, &self->notificationRef);
  int v5 = v4;
  if (v4)
  {
    NSLog(&cfstr_ErrorCallingIo_0.isa, v4);
  }
  else
  {
    os_unfair_lock_lock(&self->_loggingLock);
    maxBright = -1;
    minBright = -1;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(self->backlightService, @"IODisplayParameters", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDictionaryRef v7 = CFProperty;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(CFProperty, @"brightness");
      if (Value)
      {
        CFDictionaryRef v9 = Value;
        CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(Value, @"min");
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberSInt32Type, &minBright);
          CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v9, @"max");
          if (v11)
          {
            CFNumberGetValue(v11, kCFNumberSInt32Type, &maxBright);
            CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"value");
            if (v12)
            {
              unsigned int valuePtr = 0;
              CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
              [(PLPowerEventListener *)self bucketize:valuePtr];
            }
          }
        }
      }
      CFRelease(v7);
    }
    os_unfair_lock_unlock(&self->_loggingLock);
  }
  return v5 == 0;
}

- (BOOL)registerForIOMFBNotifications
{
  uint64_t v11 = 0;
  if (IOMobileFramebufferGetMainDisplay()) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v11 == 0;
  }
  BOOL v4 = !v3;
  if (v3)
  {
    if (qword_13D10 != -1) {
      dispatch_once(&qword_13D10, &stru_104F8);
    }
    uint64_t v8 = off_13B50;
    if (os_log_type_enabled((os_log_t)off_13B50, OS_LOG_TYPE_ERROR)) {
      sub_ACA0(v8);
    }
  }
  else
  {
    if (qword_13D10 != -1) {
      dispatch_once(&qword_13D10, &stru_104F8);
    }
    int v5 = off_13B50;
    if (os_log_type_enabled((os_log_t)off_13B50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFNumberRef v10 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "IOMFB initializing", v10, 2u);
    }
    RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource();
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
    IOMobileFramebufferEnablePowerNotifications();
    [(PLPowerEventListener *)self setFrameBuffer:v11];
  }
  return v4;
}

- (void)setupBatterySaverModeForNotification:(id)a3
{
  int out_token = -1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6764;
  block[3] = &unk_10478;
  block[4] = self;
  if (qword_13D80 != -1) {
    dispatch_once(&qword_13D80, block);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_67A8;
  v5[3] = &unk_105E0;
  v5[4] = self;
  v5[5] = a3;
  notify_register_dispatch((const char *)[a3 UTF8String], &out_token, (dispatch_queue_t)-[PLPowerEventListener LPMNotificationQueue](self, "LPMNotificationQueue"), v5);
}

- (void)dealloc
{
  ioNotifyPort = self->ioNotifyPort;
  if (ioNotifyPort)
  {
    IONotificationPortDestroy(ioNotifyPort);
    self->ioNotifyPort = 0;
  }
  io_object_t notificationRef = self->notificationRef;
  if (notificationRef)
  {
    IOObjectRelease(notificationRef);
    self->io_object_t notificationRef = 0;
  }
  io_object_t batteryEntry = self->batteryEntry;
  if (batteryEntry)
  {
    IOObjectRelease(batteryEntry);
    self->io_object_t batteryEntry = 0;
  }
  IODeregisterForSystemPower(&self->pmNotifier);
  systemPowerPortRef = self->systemPowerPortRef;
  if (systemPowerPortRef) {
    IONotificationPortDestroy(systemPowerPortRef);
  }
  io_connect_t rootDomainConnect = self->rootDomainConnect;
  if (rootDomainConnect)
  {
    IOServiceClose(rootDomainConnect);
    self->io_connect_t rootDomainConnect = 0;
  }
  if (+[PLPowerEventListener hasDCP] && self->_frameBuffer)
  {
    IOMobileFramebufferDisablePowerNotifications();
    CFRelease(self->_frameBuffer);
  }
  if (+[PLPowerEventListener hasAOD]) {
    objc_msgSend(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"), "removeObserver:", self);
  }
  io_object_t backlightService = self->backlightService;
  if (backlightService)
  {
    IOObjectRelease(backlightService);
    self->io_object_t backlightService = 0;
  }
  wranglerMatchPortRef = self->wranglerMatchPortRef;
  if (wranglerMatchPortRef) {
    IONotificationPortDestroy(wranglerMatchPortRef);
  }
  io_object_t wranglerIterator = self->wranglerIterator;
  if (wranglerIterator) {
    IOObjectRelease(wranglerIterator);
  }

  v11.receiver = self;
  v11.super_class = (Class)PLPowerEventListener;
  [(PLPowerEventListener *)&v11 dealloc];
}

- (void)logSupStats
{
  int v5 = 0;
  if (!getifaddrs(&v5))
  {
    BOOL v3 = v5;
    if (v5)
    {
      do
      {
        ifa_addr = v3->ifa_addr;
        if (ifa_addr && v3->ifa_data && (v3->ifa_flags & 8) == 0 && ifa_addr->sa_family == 18) {
          [(PLPowerEventListener *)self logNetworkSupplementalStatsForInterface:v3->ifa_name];
        }
        BOOL v3 = v3->ifa_next;
      }
      while (v3);
      if (v5) {
        freeifaddrs(v5);
      }
    }
  }
}

- (id)getCurrentSupplementalDataForInterface:(char *)a3
{
  memset(v22, 0, 224);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  size_t v23 = 712;
  *(_OWORD *)v24 = xmmword_CD30;
  int v26 = 5;
  unsigned int v25 = if_nametoindex(a3);
  if (sysctl(v24, 6u, &v4, &v23, 0, 0) == -1) {
    return 0;
  }
  else {
    return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v22, 256, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18,
  }
             v19,
             v20,
             v21);
}

- (void)validateCurrentStatistics:(if_packet_stats *)a3 withPrevious:(if_packet_stats *)a4
{
  if (a4->var0 > a3->var0
    || a4->var1 > a3->var1
    || a4->var2 > a3->var2
    || a4->var3 > a3->var3
    || a4->var4 > a3->var4
    || a4->var5 > a3->var5
    || a4->var6 > a3->var6
    || a4->var7 > a3->var7
    || a4->var8 > a3->var8
    || a4->var9 > a3->var9
    || a4->var10 > a3->var10
    || a4->var11 > a3->var11
    || a4->var12 > a3->var12
    || a4->var13 > a3->var13
    || a4->var15 > a3->var15
    || a4->var16 > a3->var16
    || a4->var17 > a3->var17
    || a4->var18 > a3->var18
    || a4->var19 > a3->var19
    || a4->var20 > a3->var20
    || a4->var21 > a3->var21
    || a4->var22 > a3->var22)
  {
    NSLog(&cfstr_NetworkSupplem.isa, a2);
    *(_OWORD *)a4->var23 = 0u;
    *(_OWORD *)&a4->var23[2] = 0u;
    *(_OWORD *)&a4->var19 = 0u;
    *(_OWORD *)&a4->var21 = 0u;
    *(_OWORD *)&a4->var15 = 0u;
    *(_OWORD *)&a4->var17 = 0u;
    *(_OWORD *)&a4->var14[2] = 0u;
    *(_OWORD *)&a4->var14[4] = 0u;
    *(_OWORD *)&a4->var12 = 0u;
    *(_OWORD *)a4->var14 = 0u;
    *(_OWORD *)&a4->var8 = 0u;
    *(_OWORD *)&a4->var10 = 0u;
    *(_OWORD *)&a4->var4 = 0u;
    *(_OWORD *)&a4->var6 = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    *(_OWORD *)&a4->var2 = 0u;
  }
}

- (void)logNetworkSupplementalStatsForInterface:(char *)a3
{
  id v5 = -[PLPowerEventListener getCurrentSupplementalDataForInterface:](self, "getCurrentSupplementalDataForInterface:");
  if (v5)
  {
    long long v6 = v5;
    long long v7 = +[NSString stringWithCString:a3 encoding:4];
    id v8 = [(NSMutableDictionary *)self->prev_ifmsupp_pstats objectForKey:v7];
    if (v8)
    {
      long long v9 = v8;
      id v10 = [v6 bytes];
      id v11 = [v9 bytes];
      [(PLPowerEventListener *)self validateCurrentStatistics:v10 withPrevious:v11];
      [(PLPowerEventListener *)self logAggdNetstatsForInterface:a3 WithCurrStats:v10 WithPrevStats:v11];
    }
    prev_ifmsupp_pstats = self->prev_ifmsupp_pstats;
    [(NSMutableDictionary *)prev_ifmsupp_pstats setObject:v6 forKey:v7];
  }
  else
  {
    NSLog(&cfstr_NetworkSupplem_0.isa, a3);
  }
}

- (void)logAggdNetstatsForInterface:(char *)a3 WithCurrStats:(if_packet_stats *)a4 WithPrevStats:(if_packet_stats *)a5
{
  id v8 = +[NSMutableDictionary dictionary];
  if (a4->var0 != a5->var0) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4->var0 - a5->var0), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpBadFormat", a3) forKeyedSubscript];
  }
  unint64_t var1 = a4->var1;
  unint64_t v10 = a5->var1;
  if (var1 != v10) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var1 - v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpUnspecv6", a3) forKeyedSubscript];
  }
  unint64_t var2 = a4->var2;
  unint64_t v12 = a5->var2;
  if (var2 != v12) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var2 - v12), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpSynFin", a3) forKeyedSubscript];
  }
  unint64_t var3 = a4->var3;
  unint64_t v14 = a5->var3;
  if (var3 != v14) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var3 - v14), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpBadFormatIPSec", a3) forKeyedSubscript];
  }
  unint64_t var4 = a4->var4;
  unint64_t v16 = a5->var4;
  if (var4 != v16) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var4 - v16), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpNoConnNoList", a3) forKeyedSubscript];
  }
  unint64_t var5 = a4->var5;
  unint64_t v18 = a5->var5;
  if (var5 != v18) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var5 - v18), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpNoConnList", a3) forKeyedSubscript];
  }
  unint64_t var6 = a4->var6;
  unint64_t v20 = a5->var6;
  if (var6 != v20) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var6 - v20), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpListBadSyn", a3) forKeyedSubscript];
  }
  unint64_t var7 = a4->var7;
  unint64_t v22 = a5->var7;
  if (var7 != v22) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var7 - v22), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpICMP6Unreach", a3) forKeyedSubscript];
  }
  unint64_t var8 = a4->var8;
  unint64_t v24 = a5->var8;
  if (var8 != v24) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var8 - v24), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpDeprecate6", a3) forKeyedSubscript];
  }
  unint64_t var9 = a4->var9;
  unint64_t v26 = a5->var9;
  if (var9 != v26) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var9 - v26), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpRstInSynRcv", a3) forKeyedSubscript];
  }
  unint64_t var10 = a4->var10;
  unint64_t v28 = a5->var10;
  if (var10 != v28) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var10 - v28), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpOOOPkt", a3) forKeyedSubscript];
  }
  unint64_t var11 = a4->var11;
  unint64_t v30 = a5->var11;
  if (var11 != v30) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var11 - v30), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpDOSPkt", a3) forKeyedSubscript];
  }
  unint64_t var12 = a4->var12;
  unint64_t v32 = a5->var12;
  if (var12 != v32) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var12 - v32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpCleanup", a3) forKeyedSubscript];
  }
  unint64_t var13 = a4->var13;
  unint64_t v34 = a5->var13;
  if (var13 != v34) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var13 - v34), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.tcpSynWindow", a3) forKeyedSubscript];
  }
  unint64_t var15 = a4->var15;
  unint64_t v36 = a5->var15;
  if (var15 != v36) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var15 - v36), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpPortUnreach", a3) forKeyedSubscript];
  }
  unint64_t var16 = a4->var16;
  unint64_t v38 = a5->var16;
  if (var16 != v38) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var16 - v38), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpFaithPrefix", a3) forKeyedSubscript];
  }
  unint64_t var17 = a4->var17;
  unint64_t v40 = a5->var17;
  if (var17 != v40) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var17 - v40), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpPort0", a3) forKeyedSubscript];
  }
  unint64_t var18 = a4->var18;
  unint64_t v42 = a5->var18;
  if (var18 != v42) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var18 - v42), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpBadLength", a3) forKeyedSubscript];
  }
  unint64_t var19 = a4->var19;
  unint64_t v44 = a5->var19;
  if (var19 != v44) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var19 - v44), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpBadChksum", a3) forKeyedSubscript];
  }
  unint64_t var20 = a4->var20;
  unint64_t v46 = a5->var20;
  if (var20 != v46) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var20 - v46), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpBadMcast", a3) forKeyedSubscript];
  }
  unint64_t var21 = a4->var21;
  unint64_t v48 = a5->var21;
  if (var21 != v48) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", var21 - v48), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpCleanup", a3) forKeyedSubscript];
  }
  unint64_t var22 = a4->var22;
  unint64_t v50 = a5->var22;
  unint64_t v51 = var22 - v50;
  if (var22 != v50) {
    [v8 setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v51), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.power.netstats.%s.udpBadIPSec", a3) forKeyedSubscript];
  }
  if (objc_msgSend(v8, "count", v51))
  {
    ADClientBatchKeys();
  }
}

- (void)logCANetstatsForInterface:(char *)a3 WithCurrStats:(if_packet_stats *)a4 WithPrevStats:(if_packet_stats *)a5
{
  if (a4->var0 != a5->var0) {
    AnalyticsSendEventLazy();
  }
  if (a4->var1 != a5->var1) {
    AnalyticsSendEventLazy();
  }
  if (a4->var2 != a5->var2) {
    AnalyticsSendEventLazy();
  }
  if (a4->var3 != a5->var3) {
    AnalyticsSendEventLazy();
  }
  if (a4->var4 != a5->var4) {
    AnalyticsSendEventLazy();
  }
  if (a4->var5 != a5->var5) {
    AnalyticsSendEventLazy();
  }
  if (a4->var6 != a5->var6) {
    AnalyticsSendEventLazy();
  }
  if (a4->var7 != a5->var7) {
    AnalyticsSendEventLazy();
  }
  if (a4->var8 != a5->var8) {
    AnalyticsSendEventLazy();
  }
  if (a4->var9 != a5->var9) {
    AnalyticsSendEventLazy();
  }
  if (a4->var10 != a5->var10) {
    AnalyticsSendEventLazy();
  }
  if (a4->var11 != a5->var11) {
    AnalyticsSendEventLazy();
  }
  if (a4->var12 != a5->var12) {
    AnalyticsSendEventLazy();
  }
  if (a4->var13 != a5->var13) {
    AnalyticsSendEventLazy();
  }
  if (a4->var15 != a5->var15) {
    AnalyticsSendEventLazy();
  }
  if (a4->var16 != a5->var16) {
    AnalyticsSendEventLazy();
  }
  if (a4->var17 != a5->var17) {
    AnalyticsSendEventLazy();
  }
  if (a4->var18 != a5->var18) {
    AnalyticsSendEventLazy();
  }
  if (a4->var19 != a5->var19) {
    AnalyticsSendEventLazy();
  }
  if (a4->var20 != a5->var20) {
    AnalyticsSendEventLazy();
  }
  if (a4->var21 != a5->var21) {
    AnalyticsSendEventLazy();
  }
  if (a4->var22 != a5->var22) {
    AnalyticsSendEventLazy();
  }
}

- (id)wakeReason
{
  size_t v4 = 256;
  memset(v5, 0, sizeof(v5));
  if ((sysctlbyname("kern.wakereason", v5, &v4, 0, 0) & 0x80000000) == 0) {
    return [+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5) stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  }
  BOOL v3 = __error();
  NSLog(&cfstr_CouldNotGetWak.isa, *v3);
  return @"<unknown>";
}

- (void)systemPoweredOn
{
  id v3 = [(PLPowerEventListener *)self wakeReason];
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:v3 forKey:@"PLDeviceDidWakeSystemReason"];
  id v5 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v5 postNotificationName:@"PLDeviceDidWakeNotification" object:self userInfo:v4];
}

- (void)batteryStatusChanged:(id)a3
{
  id v4 = +[NSDictionary dictionaryWithObject:a3 forKey:@"PLBatteryStatusPropertiesKey"];
  id v5 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v5 postNotificationName:@"PLBatteryStatusDidChangeNotification" object:self userInfo:v4];
}

- (void)LPMStatusChanged:(id)a3
{
  id v4 = +[NSDictionary dictionaryWithObject:a3 forKey:@"PLLPMStatusDidChangeNotification"];
  id v5 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v5 postNotificationName:@"PLLPMStatusDidChangeNotification" object:self userInfo:v4];
}

- (void)bucketize:(unsigned int)a3
{
  if (minBright == -1 || maxBright == -1)
  {
    if ((byte_13DF0 & 1) == 0)
    {
      NSLog(&cfstr_BucketizeError.isa, a2, *(void *)&a3, minBright, maxBright);
      byte_13DF0 = 1;
    }
  }
  else if ((dword_13B58 & a3) != 0xFFFFFFFF)
  {
    int Bucket = makeBucket(a3, dword_13B58);
    int v6 = Bucket;
    int v7 = dword_13B58;
    if (dword_13B58 == -1)
    {
      dword_13B58 = Bucket;
      qword_13D90[Bucket] = +[NSDate date];
      int v7 = dword_13B58;
    }
    if (a3 == -1 || v6 != v7)
    {
      [qword_13D90[v7] timeIntervalSinceNow];
      double v9 = fabs(v8);
      uint64_t v10 = dword_13B58;
      bucketSeconds[dword_13B58] = v9 + bucketSeconds[dword_13B58];
      *(double *)&qword_13E88 = v9 + *(double *)&qword_13E88;

      qword_13D90[v6] = +[NSDate date];
      dword_13B58 = v6;
    }
  }
}

- (void)logBrightnessBuckets
{
  p_loggingLock = &self->_loggingLock;
  os_unfair_lock_lock(&self->_loggingLock);
  [(PLPowerEventListener *)self bucketize:0xFFFFFFFFLL];
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = 0;
  int v6 = &qword_13E30;
  do
  {
    uint64_t v7 = v5 + 10;
    double v8 = +[NSString stringWithFormat:@"com.apple.power.backlight.values.%03d_%03d", v5, v5 + 10];
    double v9 = *(double *)v6++;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9), v8);
    uint64_t v5 = v7;
  }
  while (v7 != 100);
  ADClientBatchKeys();
  qword_13E88 = 0;
  xmmword_13E68 = 0u;
  unk_13E78 = 0u;
  xmmword_13E48 = 0u;
  unk_13E58 = 0u;
  *(_OWORD *)bucketSeconds = 0u;
  unk_13E38 = 0u;

  os_unfair_lock_unlock(p_loggingLock);
}

- (BOOL)registerForIOService:(unsigned int)a3 withCallback:(void *)a4
{
  uint64_t v4 = *(void *)&a3;
  self->io_object_t notificationRef = 0;
  uint64_t v5 = IOServiceAddInterestNotification(self->ioNotifyPort, a3, "IOGeneralInterest", (IOServiceInterestCallback)a4, self, &self->notificationRef);
  int v6 = v5;
  if (v5) {
    NSLog(&cfstr_ErrorCallingIo_1.isa, v4, v5);
  }
  return v6 == 0;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if (+[PLPowerEventListener hasAOD])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_9368;
    v7[3] = &unk_10630;
    v7[4] = self;
    v7[5] = a4;
    dispatch_async_and_wait((dispatch_queue_t)[(PLPowerEventListener *)self AODNotificationQueue], v7);
  }
}

- (unsigned)rootDomainConnect
{
  return self->rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->io_connect_t rootDomainConnect = a3;
}

- (OS_dispatch_queue)LPMNotificationQueue
{
  return self->_LPMNotificationQueue;
}

- (void)setLPMNotificationQueue:(id)a3
{
  self->_LPMNotificationQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_queue)AODNotificationQueue
{
  return self->_AODNotificationQueue;
}

- (void)setAODNotificationQueue:(id)a3
{
  self->_AODNotificationQueue = (OS_dispatch_queue *)a3;
}

- (__IOMobileFramebuffer)frameBuffer
{
  return self->_frameBuffer;
}

- (void)setFrameBuffer:(__IOMobileFramebuffer *)a3
{
  self->_frameBuffer = a3;
}

@end