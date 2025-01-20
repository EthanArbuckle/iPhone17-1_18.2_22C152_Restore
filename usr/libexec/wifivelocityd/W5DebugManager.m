@interface W5DebugManager
+ (BOOL)__getEAPOLDebugFlagsEnabled;
+ (BOOL)__setEAPOLDebugFlagsEnabled:(BOOL)a3 error:(id *)a4;
+ (id)__valueForKey:(id)a3 domain:(id)a4;
+ (void)__airplayLoggingEnabledWithQueue:(id)a3 reply:(id)a4;
+ (void)__disableAirPlayLoggingWithQueue:(id)a3 reply:(id)a4;
+ (void)__dnsLoggingEnabledWithQueue:(id)a3 reply:(id)a4;
+ (void)__eapolLoggingEnabledWithQueue:(id)a3 reply:(id)a4;
+ (void)__enableAirPlayLoggingWithQueue:(id)a3 reply:(id)a4;
+ (void)__ios__setWiFiLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__ios_bluetoothLoggingEnabledWithQueue:(id)a3 reply:(id)a4;
+ (void)__ios_setBluetoothLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__ios_wifiLoggingEnabledWithQueue:(id)a3 reply:(id)a4;
+ (void)__mostRecentLogWithSuffix:(id)a3 logPath:(id)a4 queue:(id)a5 reply:(id)a6;
+ (void)__openDirectoryLoggingEnabledWithQueue:(id)a3 reply:(id)a4;
+ (void)__setAirPlayLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__setDHCPLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__setDNSLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__setEAPOLLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__setOpenDirectoryLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5;
+ (void)__setValue:(id)a3 key:(id)a4 domain:(id)a5;
+ (void)__toggleDNSLoggingWithQueue:(id)a3 reply:(id)a4;
+ (void)setOSLogPreferenceLevel:(id)a3 enableOvserizeMessages:(BOOL)a4 subsystem:(id)a5;
- (W5DebugManager)initWithDiagnosticsModeManager:(id)a3 statusManager:(id)a4;
- (id)queryDebugConfigurationAndReturnError:(id *)a3;
- (void)__queryMegaWiFiProfileInstalledAndReply:(id)a3;
- (void)__queryNoLoggingWiFiProfileInstalledAndReply:(id)a3;
- (void)__setMegaWiFiProfileInstalled:(BOOL)a3 reply:(id)a4;
- (void)__setNoLoggingWiFiProfileInstalled:(BOOL)a3 reply:(id)a4;
- (void)dealloc;
- (void)queryAirPlayDebugLoggingAndReply:(id)a3;
- (void)queryBluetoothDebugLoggingAndReply:(id)a3;
- (void)queryDNSDebugLoggingAndReply:(id)a3;
- (void)queryDebugConfigurationAndReply:(id)a3;
- (void)queryDiagnosticsModeAndReply:(id)a3;
- (void)queryEAPOLDebugLoggingAndReply:(id)a3;
- (void)queryOpenDirectoryDebugLoggingAndReply:(id)a3;
- (void)querySTBCAndReply:(id)a3;
- (void)queryWiFiDebugLoggingAndReply:(id)a3;
- (void)setAirPlayDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setBluetoothDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setDHCPDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setDNSDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setDebugConfiguration:(id)a3 reply:(id)a4;
- (void)setDiagnosticsMode:(id)a3 reply:(id)a4;
- (void)setEAPOLDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setOpenDirectoryDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setSTBCEnabled:(BOOL)a3 reply:(id)a4;
- (void)setWiFiDebugLoggingEnabled:(BOOL)a3 reply:(id)a4;
@end

@implementation W5DebugManager

- (W5DebugManager)initWithDiagnosticsModeManager:(id)a3 statusManager:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)W5DebugManager;
  v6 = [(W5DebugManager *)&v9 init];
  if (v6
    && (dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifivelocity.debug", 0), (v6->_queue = (OS_dispatch_queue *)v7) != 0)
    && (v6->_diagnosticsModeManager = (W5DiagnosticsModeManager *)a3) != 0)
  {
    v6->_statusManager = (W5StatusManager *)a4;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)W5DebugManager;
  [(W5DebugManager *)&v4 dealloc];
}

- (void)queryDebugConfigurationAndReply:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100037B5C;
  v4[3] = &unk_1000DDC08;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)queryDebugConfigurationAndReturnError:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = sub_1000383EC;
  v23 = sub_1000383FC;
  uint64_t v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = sub_1000383EC;
  v17 = sub_1000383FC;
  uint64_t v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000388A0;
  v12[3] = &unk_1000DE540;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[4] = v5;
  [(W5DebugManager *)self queryDebugConfigurationAndReply:v12];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v26 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v7 = (id)v14[5];
  id v8 = (id)v20[5];
  if (a3)
  {
    objc_super v9 = (void *)v14[5];
    if (v9) {
      *a3 = v9;
    }
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)setDebugConfiguration:(id)a3 reply:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038978;
  block[3] = &unk_1000DDC58;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)queryWiFiDebugLoggingAndReply:(id)a3
{
}

- (void)setWiFiDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

- (void)queryBluetoothDebugLoggingAndReply:(id)a3
{
}

- (void)setBluetoothDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

- (void)querySTBCAndReply:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)setSTBCEnabled:(BOOL)a3 reply:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)queryDiagnosticsModeAndReply:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000394A8;
  v6[3] = &unk_1000DDC08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

- (void)setDiagnosticsMode:(id)a3 reply:(id)a4
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000395B4;
  block[3] = &unk_1000DDC58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(global_queue, block);
}

- (void)queryEAPOLDebugLoggingAndReply:(id)a3
{
}

- (void)setEAPOLDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

- (void)setDHCPDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

- (void)queryDNSDebugLoggingAndReply:(id)a3
{
}

- (void)setDNSDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

- (void)queryAirPlayDebugLoggingAndReply:(id)a3
{
}

- (void)setAirPlayDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

- (void)queryOpenDirectoryDebugLoggingAndReply:(id)a3
{
}

- (void)setOpenDirectoryDebugLoggingEnabled:(BOOL)a3 reply:(id)a4
{
}

+ (void)setOSLogPreferenceLevel:(id)a3 enableOvserizeMessages:(BOOL)a4 subsystem:(id)a5
{
  BOOL v5 = a4;
  id v7 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", +[NSString stringWithFormat:@"/Library/Preferences/Logging/Subsystems/%@.plist", a5], 0);
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setDictionary:+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v7)];
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setDictionary:[v8 objectForKeyedSubscript:@"DEFAULT-OPTIONS"]];
  id v10 = +[NSMutableDictionary dictionary];
  [v10 setDictionary:[v8 objectForKeyedSubscript:@"Level"]];
  [v10 setObject:a3 forKeyedSubscript:@"Enable"];
  [v10 setObject:a3 forKeyedSubscript:@"Persist"];
  v11 = &kCFBooleanTrue;
  if (!v5) {
    v11 = &kCFBooleanFalse;
  }
  [v9 setObject:*v11 forKeyedSubscript:@"Enable-Oversize-Messages"];
  [v9 setObject:v10 forKeyedSubscript:@"Level"];
  [v8 setObject:v9 forKeyedSubscript:@"DEFAULT-OPTIONS"];

  [v8 writeToURL:v7 atomically:1];
}

+ (void)__ios_wifiLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039924;
  block[3] = &unk_1000DE1E0;
  block[4] = a4;
  dispatch_async(global_queue, block);
}

+ (void)__ios__setWiFiLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039AC8;
  block[3] = &unk_1000DE590;
  BOOL v10 = a3;
  block[4] = a1;
  void block[5] = a5;
  dispatch_async(global_queue, block);
}

+ (BOOL)__setEAPOLDebugFlagsEnabled:(BOOL)a3 error:(id *)a4
{
  int v5 = a3;
  dispatch_time_t v6 = SCPreferencesCreate(kCFAllocatorDefault, (CFStringRef)[+[NSProcessInfo processInfo] processName], @"com.apple.eapolclient.plist");
  id v7 = v6;
  if (v6 && SCPreferencesLock(v6, 1u))
  {
    if (SCPreferencesSetValue(v7, @"LogFlags", +[NSNumber numberWithInt:(v5 << 31 >> 31)])&& SCPreferencesCommitChanges(v7)&& SCPreferencesApplyChanges(v7))
    {
      int v8 = 0;
    }
    else
    {
      int v8 = SCError();
    }
    SCPreferencesUnlock(v7);
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    int v8 = SCError();
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (v8)
  {
    NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v11 = @"err";
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainSystemConfiguration, v8, +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
  }
LABEL_10:
  if (v7) {
    CFRelease(v7);
  }
  return v8 == 0;
}

+ (BOOL)__getEAPOLDebugFlagsEnabled
{
  v2 = SCPreferencesCreate(kCFAllocatorDefault, (CFStringRef)[+[NSProcessInfo processInfo] processName], @"com.apple.eapolclient.plist");
  if (!v2) {
    return 0;
  }
  v3 = v2;
  BOOL v4 = [[SCPreferencesGetValue(v2, @"LogFlags") intValue] == -1];
  CFRelease(v3);
  return v4;
}

+ (void)__eapolLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100039E8C;
  v7[3] = &unk_1000DDC08;
  v7[4] = a1;
  v7[5] = a4;
  dispatch_async(global_queue, v7);
}

+ (void)__setEAPOLLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039FD4;
  block[3] = &unk_1000DE590;
  BOOL v10 = a3;
  block[4] = a1;
  void block[5] = a5;
  dispatch_async(global_queue, block);
}

+ (void)__toggleDNSLoggingWithQueue:(id)a3 reply:(id)a4
{
}

+ (void)__dnsLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A164;
  block[3] = &unk_1000DE1E0;
  block[4] = a4;
  dispatch_async(global_queue, block);
}

+ (void)__setDNSLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A3A4;
  v5[3] = &unk_1000DE5B8;
  BOOL v6 = a3;
  v5[4] = a1;
  v5[5] = a4;
  v5[6] = a5;
  [a1 __dnsLoggingEnabledWithQueue:a4 reply:v5];
}

+ (void)__setDHCPLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  if (a3) {
    BOOL v6 = "IPConfiguration: verbose mode enabled";
  }
  else {
    BOOL v6 = "IPConfiguration: verbose mode disabled";
  }
  if (a3) {
    CFStringRef v7 = @"1";
  }
  else {
    CFStringRef v7 = @"0";
  }
  syslog(2, v6);
  v8[0] = @"setverbose";
  v8[1] = v7;
  +[NSTask runTaskWithLaunchPath:arguments:reply:](NSTask, "runTaskWithLaunchPath:arguments:reply:", @"/usr/sbin/ipconfig", +[NSArray arrayWithObjects:v8 count:2], a5);
}

+ (void)__mostRecentLogWithSuffix:(id)a3 logPath:(id)a4 queue:(id)a5 reply:(id)a6
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v9 = +[NSMutableData data];
  BOOL v10 = dispatch_io_create_with_path(0, (const char *)[a4 UTF8String], 0, 0, (dispatch_queue_t)&_dispatch_main_q, &stru_1000DE5F8);
  dispatch_io_set_high_water(v10, 0x3E8uLL);
  io_handler[0] = _NSConcreteStackBlock;
  io_handler[1] = 3221225472;
  io_handler[2] = sub_10003A650;
  io_handler[3] = &unk_1000DE620;
  io_handler[7] = a6;
  io_handler[8] = v12;
  io_handler[4] = v10;
  io_handler[5] = v9;
  io_handler[6] = a3;
  dispatch_io_read(v10, 0, 0xFFFFFFFFFFFFFFFFLL, (dispatch_queue_t)&_dispatch_main_q, io_handler);
  _Block_object_dispose(v12, 8);
}

+ (void)__openDirectoryLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A8F0;
  v4[3] = &unk_1000DE648;
  v4[4] = a3;
  v4[5] = a4;
  +[W5DebugManager __mostRecentLogWithSuffix:&off_1000EFDF8 logPath:@"/var/log/opendirectoryd.log" queue:a3 reply:v4];
}

+ (void)__setOpenDirectoryLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  CFStringRef v8 = @"set";
  CFStringRef v9 = @"log";
  if (a3) {
    CFStringRef v6 = @"debug";
  }
  else {
    CFStringRef v6 = @"off";
  }
  CFStringRef v10 = v6;
  CFStringRef v7 = +[NSArray arrayWithObjects:&v8 count:3];
  +[NSTask runTaskWithLaunchPath:@"/usr/bin/odutil", v7, a5, v8, v9 arguments reply];
}

+ (id)__valueForKey:(id)a3 domain:(id)a4
{
  id result = (id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  if (result)
  {
    return result;
  }
  return result;
}

+ (void)__setValue:(id)a3 key:(id)a4 domain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);

  CFPreferencesAppSynchronize((CFStringRef)a5);
}

+ (void)__ios_bluetoothLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
  unsigned int v6 = [[[a1 __valueForKey:@"ShouldLog" domain:@"com.apple.wirelessproxd.debug"] BOOLValue];
  unsigned int v7 = [[objc_msgSend(a1, "__valueForKey:domain:", @"DiagnosticMode", @"com.apple.MobileBluetooth.debug") BOOLValue];
  unsigned int v8 = [[objc_msgSend(a1, "__valueForKey:domain:", @"DefaultLevel", @"com.apple.MobileBluetooth.debug") isEqualToString:@"Info"];
  unsigned int v9 = [[[a1 __valueForKey:@"HCITraces" domain:@"com.apple.MobileBluetooth.debug"] objectForKey:@"StackDebugEnabled"] isEqualToString:@"TRUE"];
  unsigned int v10 = [[[a1 __valueForKey:@"LE" domain:@"com.apple.MobileBluetooth.debug"] objectForKey:@"DebugLevel"] isEqualToString:@"Info"];
  if (a4)
  {
    CFStringRef v11 = (void (*)(id, void, void))*((void *)a4 + 2);
    v11(a4, 0, v6 & v7 & v8 & v9 & v10);
  }
}

+ (void)__ios_setBluetoothLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  [a1 __setValue:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3, a4) key:@"ShouldLog" domain:@"com.apple.wirelessproxd.debug"];
  [a1 __setValue:[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6) key:@"DiagnosticMode" domain:@"com.apple.MobileBluetooth.debug"];
  BOOL v8 = !v6;
  if (v6) {
    CFStringRef v9 = @"Info";
  }
  else {
    CFStringRef v9 = @"Error";
  }
  if (v8) {
    CFStringRef v10 = @"FALSE";
  }
  else {
    CFStringRef v10 = @"TRUE";
  }
  [a1 __setValue:v9 key:@"DefaultLevel" domain:@"com.apple.MobileBluetooth.debug"];
  CFStringRef v13 = @"StackDebugEnabled";
  CFStringRef v14 = v10;
  [a1 __setValue:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1) key:@"HCITraces" domain:@"com.apple.MobileBluetooth.debug"];
  CFStringRef v11 = @"DebugLevel";
  CFStringRef v12 = v9;
  [a1 __setValue:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1) key:@"LE" domain:@"com.apple.MobileBluetooth.debug"];
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

+ (void)__enableAirPlayLoggingWithQueue:(id)a3 reply:(id)a4
{
}

+ (void)__disableAirPlayLoggingWithQueue:(id)a3 reply:(id)a4
{
}

+ (void)__setAirPlayLoggingEnabled:(BOOL)a3 queue:(id)a4 reply:(id)a5
{
  if (a3) {
    +[W5DebugManager __enableAirPlayLoggingWithQueue:a4 reply:a5];
  }
  else {
    +[W5DebugManager __disableAirPlayLoggingWithQueue:a4 reply:a5];
  }
}

+ (void)__airplayLoggingEnabledWithQueue:(id)a3 reply:(id)a4
{
}

- (void)__queryMegaWiFiProfileInstalledAndReply:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B2BC;
  block[3] = &unk_1000DE1E0;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__setMegaWiFiProfileInstalled:(BOOL)a3 reply:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B480;
  v4[3] = &unk_1000DE670;
  BOOL v5 = a3;
  v4[4] = a4;
  [(W5DebugManager *)self __queryMegaWiFiProfileInstalledAndReply:v4];
}

- (void)__queryNoLoggingWiFiProfileInstalledAndReply:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B668;
  block[3] = &unk_1000DE1E0;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

- (void)__setNoLoggingWiFiProfileInstalled:(BOOL)a3 reply:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B82C;
  v4[3] = &unk_1000DE670;
  BOOL v5 = a3;
  v4[4] = a4;
  [(W5DebugManager *)self __queryNoLoggingWiFiProfileInstalledAndReply:v4];
}

@end