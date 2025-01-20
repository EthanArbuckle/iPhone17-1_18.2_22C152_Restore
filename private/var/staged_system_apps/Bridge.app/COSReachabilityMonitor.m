@interface COSReachabilityMonitor
+ (id)sharedMonitor;
- (BOOL)isBluetoothAvailable;
- (BOOL)isConnectedOverWifi;
- (BOOL)isNetworkReachable;
- (COSReachabilityMonitor)init;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)setIsBluetoothAvailable:(BOOL)a3;
- (void)setIsConnectedOverWifi:(BOOL)a3;
- (void)setIsNetworkReachable:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation COSReachabilityMonitor

+ (id)sharedMonitor
{
  if (qword_10029B298 != -1) {
    dispatch_once(&qword_10029B298, &stru_100246EC8);
  }
  v2 = (void *)qword_10029B290;

  return v2;
}

- (COSReachabilityMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)COSReachabilityMonitor;
  v2 = [(COSReachabilityMonitor *)&v4 init];
  if (v2)
  {
    if (sub_10000F67C()) {
      *(_WORD *)(v2 + 25) = 257;
    }
    else {
      *((void *)v2 + 2) = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, (const char *)[@"apple.com" UTF8String]);
    }
    v2[27] = 1;
    v2[24] = 0;
  }
  return (COSReachabilityMonitor *)v2;
}

- (void)startMonitoring
{
  if (sub_10000F67C()) {
    goto LABEL_20;
  }
  reachability = self->_reachability;
  if (!reachability) {
    goto LABEL_20;
  }
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(reachability, &flags))
  {
    v5 = pbb_bridge_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    LOWORD(buf.version) = 0;
    v8 = "SCNetworkReachabilityGetFlags did not get valid state at startup! Assuming we're connected until updated otherwise...";
    v9 = v5;
    uint32_t v10 = 2;
    goto LABEL_9;
  }
  char v4 = flags;
  self->_BOOL isConnectedOverWifi = (flags & 0x40000) == 0;
  self->_BOOL isNetworkReachable = (v4 & 2) != 0;
  v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isNetworkReachable = self->_isNetworkReachable;
    BOOL isConnectedOverWifi = self->_isConnectedOverWifi;
    LODWORD(buf.version) = 67109376;
    HIDWORD(buf.version) = isNetworkReachable;
    LOWORD(buf.info) = 1024;
    *(_DWORD *)((char *)&buf.info + 2) = isConnectedOverWifi;
    v8 = "Reachability Monitor: Network reachability at startup: %d isWifi: %d";
    v9 = v5;
    uint32_t v10 = 14;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&buf, v10);
  }
LABEL_10:

  buf.version = 0;
  memset(&buf.retain, 0, 24);
  buf.info = self;
  if (!SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)sub_100007A70, &buf))
  {
    v13 = pbb_bridge_log();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)v17 = 0;
    v14 = "SCNetworkReachabilitySetCallback returned false, assuming current state";
    goto LABEL_18;
  }
  v11 = self->_reachability;
  Current = CFRunLoopGetCurrent();
  if (!SCNetworkReachabilityScheduleWithRunLoop(v11, Current, kCFRunLoopDefaultMode))
  {
    v13 = pbb_bridge_log();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_WORD *)v17 = 0;
    v14 = "SCNetworkReachabilityScheduleWithRunLoop returned false, assuming current state";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, v17, 2u);
LABEL_19:
  }
LABEL_20:
  v15 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:&_dispatch_main_q options:0];
  manager = self->_manager;
  self->_manager = v15;

  [(COSReachabilityMonitor *)self centralManagerDidUpdateState:self->_manager];
  self->_monitorStarted = 1;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  self->_BOOL isBluetoothAvailable = [a3 state] == (id)5;
  char v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isBluetoothAvailable = self->_isBluetoothAvailable;
    v6[0] = 67109120;
    v6[1] = isBluetoothAvailable;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bluetooth Updated ~ Bluetooth is on: %d", (uint8_t *)v6, 8u);
  }
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_BOOL isNetworkReachable = a3;
}

- (void)setIsConnectedOverWifi:(BOOL)a3
{
  self->_BOOL isConnectedOverWifi = a3;
}

- (BOOL)isNetworkReachable
{
  if (!self->_monitorStarted) {
    [(COSReachabilityMonitor *)self startMonitoring];
  }
  return self->_isNetworkReachable;
}

- (BOOL)isConnectedOverWifi
{
  return self->_isConnectedOverWifi;
}

- (void)dealloc
{
  [(COSReachabilityMonitor *)self stopMonitoring];
  reachability = self->_reachability;
  if (reachability) {
    CFRelease(reachability);
  }
  v4.receiver = self;
  v4.super_class = (Class)COSReachabilityMonitor;
  [(COSReachabilityMonitor *)&v4 dealloc];
}

- (void)stopMonitoring
{
  reachability = self->_reachability;
  if (reachability)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachability, Current, kCFRunLoopDefaultMode);
  }
  [(CBCentralManager *)self->_manager setDelegate:0];
  manager = self->_manager;
  self->_manager = 0;

  self->_monitorStarted = 0;
}

- (BOOL)isBluetoothAvailable
{
  return self->_isBluetoothAvailable;
}

- (void)setIsBluetoothAvailable:(BOOL)a3
{
  self->_BOOL isBluetoothAvailable = a3;
}

- (void).cxx_destruct
{
}

@end