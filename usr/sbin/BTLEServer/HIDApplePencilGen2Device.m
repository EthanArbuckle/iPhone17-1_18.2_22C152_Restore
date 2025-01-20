@interface HIDApplePencilGen2Device
+ (BOOL)hasWirelessCharging;
+ (unint64_t)btClockMask;
- (BOOL)accdPairingFinished;
- (HIDApplePencilGen2Device)initWithProperties:(id)a3 reports:(id)a4;
- (HIDApplePencilGen2Device)initWithProperties:(id)a3 reports:(id)a4 loggingIdentifier:(id)a5;
- (HIDChargerNotifier)chargerNotifier;
- (HIDTimestampSync)timestampSync;
- (NSDictionary)properties;
- (NSDictionary)userDevices;
- (NSString)connectionUUID;
- (OS_dispatch_source)timer;
- (float)preferredInterval;
- (id)desiredConnectionParameters;
- (id)deviceMgntUserDevice;
- (id)forceUserDevice;
- (id)newDeviceMgntDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newForceDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newTouchDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newUserDevices:(id)a3;
- (id)newWakeDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (int)maxPeripheralLatency;
- (int)preferredPeripheralLatency;
- (int)stictionCollection;
- (int64_t)authStatus;
- (void)authCompleted:(BOOL)a3;
- (void)authFailureNotification;
- (void)authSuccessNotification;
- (void)chargeStateCollection:(BOOL)a3;
- (void)chargerStateChanged:(unsigned __int8)a3;
- (void)handleAnalyticsData:(unsigned __int8)a3 data:(const void *)a4 length:(unint64_t)a5;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
- (void)maybeQueryOOBPAndSendStatus;
- (void)notifyPencilOnChargerState:(BOOL)a3;
- (void)pairingInfoCompleted;
- (void)piconetClockNotification:(id)a3;
- (void)publishProperties;
- (void)setAccdPairingFinished:(BOOL)a3;
- (void)setAuthStatus:(int64_t)a3;
- (void)setChargerNotifier:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setMaxPeripheralLatency:(int)a3;
- (void)setPreferredInterval:(float)a3;
- (void)setPreferredPeripheralLatency:(int)a3;
- (void)setProperties:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimestampSync:(id)a3;
- (void)setUserDevices:(id)a3;
- (void)start;
- (void)startCollectionTimer;
- (void)stictionCollectionGate;
- (void)stictionCollectionRestartTimer:(double)a3;
- (void)stop;
- (void)stopCollectionTimer;
- (void)unpublishProperties;
@end

@implementation HIDApplePencilGen2Device

+ (unint64_t)btClockMask
{
  return 0xFFFFFFLL;
}

+ (BOOL)hasWirelessCharging
{
  return 1;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)HIDApplePencilGen2Device;
  [(HIDApplePencilDevice *)&v3 start];
  [(HIDChargerNotifier *)self->_chargerNotifier start];
  [(HIDApplePencilGen2Device *)self startCollectionTimer];
}

- (HIDApplePencilGen2Device)initWithProperties:(id)a3 reports:(id)a4
{
  return [(HIDApplePencilGen2Device *)self initWithProperties:a3 reports:a4 loggingIdentifier:@"Pencil2"];
}

- (HIDApplePencilGen2Device)initWithProperties:(id)a3 reports:(id)a4 loggingIdentifier:(id)a5
{
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HIDApplePencilGen2Device;
  v10 = [(HIDApplePencilDevice *)&v26 initWithProperties:v9 reports:a4 loggingIdentifier:a5];
  v12 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  LODWORD(v11) = 15.0;
  [(HIDApplePencilGen2Device *)v10 setPreferredInterval:v11];
  [(HIDApplePencilGen2Device *)v12 setPreferredPeripheralLatency:6];
  [(HIDApplePencilGen2Device *)v12 setMaxPeripheralLatency:100];
  v13 = -[HIDTimestampSync initWithBtClockMask:]([HIDTimestampSync alloc], "initWithBtClockMask:", [(id)objc_opt_class() btClockMask]);
  timestampSync = v12->_timestampSync;
  v12->_timestampSync = v13;

  if (!v12->_timestampSync) {
    goto LABEL_5;
  }
  v15 = [HIDChargerNotifier alloc];
  v16 = [(HIDApplePencilDevice *)v12 queue];
  v17 = [(HIDChargerNotifier *)v15 initWithQueue:v16];
  chargerNotifier = v12->_chargerNotifier;
  v12->_chargerNotifier = v17;

  v19 = v12->_chargerNotifier;
  if (v19)
  {
    [(HIDChargerNotifier *)v19 setDelegate:v12];
    objc_storeStrong((id *)&v12->_properties, a3);
    v12->_authStatus = 0;
    v12->_accdPairingFinished = 0;
    v20 = +[NSNotificationCenter defaultCenter];
    v21 = [(HIDBluetoothDevice *)v12 peripheral];
    [v20 addObserver:v12 selector:"authSuccessNotification" name:@"AuthenticationServiceAuthDidSucceedNotification" object:v21];

    v22 = +[NSNotificationCenter defaultCenter];
    v23 = [(HIDBluetoothDevice *)v12 peripheral];
    [v22 addObserver:v12 selector:"authFailureNotification" name:@"AuthenticationServiceAuthDidFailNotification" object:v23];

    v24 = v12;
  }
  else
  {
LABEL_5:
    v24 = 0;
  }

  return v24;
}

- (id)newDeviceMgntDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 addEntriesFromDictionary:v6];

  [v7 setObject:&off_1000B7BF8 forKeyedSubscript:@"ExtendedData"];
  v10[0] = xmmword_10008A85A;
  *(_OWORD *)((char *)v10 + 14) = *(long long *)((char *)&xmmword_10008A85A + 14);
  id v8 = [(HIDApplePencilDevice *)self newUserDevice:v7 descriptor:v10 descriptorLength:30 keyholeID:v4];

  return v8;
}

- (id)newForceDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  v5[0] = xmmword_10008A878;
  *(_OWORD *)((char *)v5 + 9) = *(long long *)((char *)&xmmword_10008A878 + 9);
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:25 keyholeID:a4];
}

- (id)newTouchDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  *(_OWORD *)v5 = xmmword_10008A891;
  *(void *)&v5[15] = 0xC002810001000077;
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:23 keyholeID:a4];
}

- (id)newWakeDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  v5[0] = xmmword_10008A8A8;
  *(_OWORD *)((char *)v5 + 12) = *(long long *)((char *)&xmmword_10008A8A8 + 12);
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:28 keyholeID:a4];
}

- (id)forceUserDevice
{
  return [(NSDictionary *)self->_userDevices objectForKeyedSubscript:&off_1000B7770];
}

- (id)deviceMgntUserDevice
{
  return [(NSDictionary *)self->_userDevices objectForKeyedSubscript:&off_1000B7788];
}

- (id)newUserDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDApplePencilGen2Device *)self newDeviceMgntDevice:v4 keyholeID:0];
  id v6 = [(HIDApplePencilGen2Device *)self newTouchDevice:v4 keyholeID:1];
  id v7 = [(HIDApplePencilGen2Device *)self newForceDevice:v4 keyholeID:8];
  id v8 = [(HIDApplePencilGen2Device *)self newWakeDevice:v4 keyholeID:4];

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073030();
    }
    goto LABEL_15;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073064();
    }
    goto LABEL_15;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F9A4();
    }
    goto LABEL_15;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F93C();
    }
LABEL_15:
    double v11 = 0;
    goto LABEL_6;
  }
  v13[0] = &off_1000B7788;
  v13[1] = &off_1000B77A0;
  v14[0] = v5;
  v14[1] = v6;
  v13[2] = &off_1000B77B8;
  v13[3] = &off_1000B7770;
  v14[2] = v8;
  v14[3] = v7;
  id v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  userDevices = self->_userDevices;
  self->_userDevices = v9;

  [(NSDictionary *)self->_userDevices enumerateKeysAndObjectsUsingBlock:&stru_1000B2058];
  double v11 = [(NSDictionary *)self->_userDevices allValues];
LABEL_6:

  return v11;
}

- (void)stop
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(HIDChargerNotifier *)self->_chargerNotifier stop];
  chargerNotifier = self->_chargerNotifier;
  self->_chargerNotifier = 0;

  [(HIDApplePencilGen2Device *)self unpublishProperties];
  [(HIDApplePencilGen2Device *)self stopCollectionTimer];
  v5.receiver = self;
  v5.super_class = (Class)HIDApplePencilGen2Device;
  [(HIDApplePencilDevice *)&v5 stop];
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [v8 length];
  id v10 = v8;
  double v11 = (unsigned __int8 *)[v10 bytes];
  v34 = v10;
  if ([v10 length] && *v11 == 189)
  {
    unint64_t v12 = (unint64_t)v9 - 1;
    if (v9 != (id)1)
    {
      v13 = (uint64_t *)(v11 + 1);
      v33 = (char *)&v39 + 3;
      while (1)
      {
        uint64_t v39 = 0;
        if (v12 <= 7) {
          break;
        }
        uint64_t v16 = *v13;
        v15 = v13 + 1;
        unsigned __int16 v14 = v16;
        uint64_t v39 = v16;
        unint64_t v17 = (unsigned __int16)((v16 & 0xF00 | BYTE2(v16)) - 1);
        if (v12 - 8 < v17)
        {
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100073120();
          }
          goto LABEL_16;
        }
        unint64_t v35 = v12 - 8;
        unint64_t v37 = v17;
        id v38 = 0;
        id v18 = [objc_alloc((Class)NSMutableData) initWithCapacity:v17 + 13];
        [v18 appendBytes:(char *)&v39 + 7 length:1];
        if ((*(_DWORD *)((unsigned char *)&v39 + 3) & 0x80000000) == 0)
        {
          [v18 appendBytes:v33 length:4];
          v19 = [(HIDApplePencilGen2Device *)self timestampSync];
          id v38 = [v19 applyTimestampOffset:x0 precise:x1];

          [v18 appendBytes:&v38 length:8];
        }
        unsigned int v20 = (v14 >> 12) & 0xFFFFF00F | (16 * v14);
        [v18 appendBytes:v15 length:v17];
        v21 = v15;
        int v22 = 0;
        v36 = (void *)((char *)v21 + v17);
        do
        {
          if ((v20 >> v22))
          {
            id v23 = v18;
            -[HIDApplePencilGen2Device handleAnalyticsData:data:length:](self, "handleAnalyticsData:data:length:", v22, [v23 bytes], [v23 length]);
            userDevices = self->_userDevices;
            v25 = +[NSNumber numberWithUnsignedChar:v22];
            objc_super v26 = [(NSDictionary *)userDevices objectForKeyedSubscript:v25];
            id v27 = v23;
            [v26 handleInputReport:[v27 bytes] reportLength:[v27 length] timestamp:a5];

            -[HIDApplePencilGen2Device checkAndLogHostInputReportCollision:reportID:](self, "checkAndLogHostInputReportCollision:reportID:", v22, *(unsigned __int8 *)[v27 bytes]);
          }
          ++v22;
        }
        while (v22 != 12);
        unint64_t v12 = v35 - v37;

        v13 = v36;
        if (v35 == v37) {
          goto LABEL_16;
        }
      }
      v32 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100073098(v12, v32);
      }
    }
  }
  else
  {
    v28 = self->_userDevices;
    v29 = +[NSNumber numberWithUnsignedChar:v6];
    v30 = [(NSDictionary *)v28 objectForKeyedSubscript:v29];
    id v31 = v10;
    [v30 handleInputReport:[v31 bytes] reportLength:[v31 length] timestamp:a5];
  }
LABEL_16:
}

- (void)handleAnalyticsData:(unsigned __int8)a3 data:(const void *)a4 length:(unint64_t)a5
{
  if (!a3 && a5 == 5 && *(unsigned char *)a4 == 68)
  {
    uint64_t v6 = *(unsigned int *)((char *)a4 + 1);
    CFStringRef v10 = @"TimeOn0_1C";
    id v7 = +[NSNumber numberWithUnsignedInt:v6];
    double v11 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    [(HIDApplePencilDevice *)self sendAnalyticsEvent:@"com.apple.MConnector.ExcessCharge.0_1C" withPayload:v8];
    id v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_1000731A0(v6, v9);
    }
  }
}

- (void)piconetClockNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100073218(v5, v4);
  }
  uint64_t v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"PiconetClockUserInfoKey"];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [v4 userInfo];
  CFStringRef v10 = [v9 objectForKeyedSubscript:@"PiconetPhaseClockUserInfoKey"];
  id v11 = [v10 unsignedIntegerValue];

  unint64_t v12 = [(HIDApplePencilGen2Device *)self timestampSync];
  [v12 processTimestampSync:v8 phase:v11];
}

- (void)chargerStateChanged:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  objc_super v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(HIDApplePencilDevice *)self loggingIdentifier];
    id v8 = +[HIDChargerNotifier stateToStr:v3];
    int v20 = 138412546;
    v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ received HID charger notification: %@", (uint8_t *)&v20, 0x16u);
  }
  if (v3 == 3)
  {
    id v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring no accessories notification", (uint8_t *)&v20, 2u);
    }
  }
  else
  {
    CFStringRef v10 = +[NSUserDefaults standardUserDefaults];
    unsigned int v11 = [v10 BOOLForKey:@"enableBTSyncBeforeConnectionParametersUpdate"];

    if (v11)
    {
      v13 = +[BTLEXpcServer instance];
      unsigned __int16 v14 = (unsigned __int16)[(HIDApplePencilDevice *)self btSyncPeriod];
      v15 = [(HIDBluetoothDevice *)self peripheral];
      [v13 sendEnableBTSyncMsg:v14 forPeer:v15];
    }
    BOOL v16 = v3 == 1;
    BOOL v17 = v3 == 1;
    LODWORD(v12) = 1110704128;
    if (v16)
    {
      uint64_t v18 = 1;
    }
    else
    {
      *(float *)&double v12 = 15.0;
      uint64_t v18 = 6;
    }
    if (v16) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 100;
    }
    [(HIDApplePencilGen2Device *)self setPreferredInterval:v12];
    [(HIDApplePencilGen2Device *)self setPreferredPeripheralLatency:v18];
    [(HIDApplePencilGen2Device *)self setMaxPeripheralLatency:v19];
    [(HIDBluetoothDevice *)self notifyDesiredConnectionParametersDidChange];
    [(HIDApplePencilGen2Device *)self notifyPencilOnChargerState:v17];
    [(HIDApplePencilGen2Device *)self chargeStateCollection:v17];
  }
}

- (void)notifyPencilOnChargerState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() hasWirelessCharging])
  {
    objc_super v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      uint64_t v7 = [(HIDApplePencilDevice *)self loggingIdentifier];
      id v8 = (void *)v7;
      id v9 = "detached";
      if (v3) {
        id v9 = "attached";
      }
      *(_DWORD *)unsigned int v11 = 138412546;
      *(void *)&v11[4] = v7;
      __int16 v12 = 2080;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ notifying pencil that wireless charging is %s", v11, 0x16u);
    }
    v11[0] = -64;
    v11[1] = v3;
    CFStringRef v10 = [(HIDApplePencilGen2Device *)self deviceMgntUserDevice];
    [v10 setReport:v11 reportLength:2 reportID:192 reportType:2];
  }
}

- (void)chargeStateCollection:(BOOL)a3
{
  BOOL v3 = a3;
  memset(v25, 0, sizeof(v25));
  uint64_t v16 = 512;
  objc_super v5 = [(NSDictionary *)self->_userDevices objectForKeyedSubscript:&off_1000B7788];
  unsigned int v6 = [v5 getReport:v25 reportLength:&v16 reportID:35 reportType:2];

  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    sub_100073330();
    if (v6) {
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    goto LABEL_7;
  }
  if (v16 > 1)
  {
    LOBYTE(v7) = BYTE1(v25[0]);
    double v8 = fmin((double)v7, 100.0);
    v23[0] = @"ChargeState";
    id v9 = +[NSNumber numberWithDouble:v8];
    v23[1] = @"AttachState";
    v24[0] = v9;
    CFStringRef v10 = +[NSNumber numberWithBool:v3];
    v24[1] = v10;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

    [(HIDApplePencilDevice *)self sendAnalyticsEvent:@"com.apple.MConnector.ChargeState" withPayload:v11];
    __int16 v12 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
    {
      LOBYTE(v13) = BYTE1(v25[0]);
      double v14 = (double)v13;
      v15 = "detached";
      *(_DWORD *)buf = 134218498;
      double v18 = v8;
      if (v3) {
        v15 = "attached";
      }
      __int16 v19 = 2048;
      double v20 = v14;
      __int16 v21 = 2080;
      __int16 v22 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "chargeStateCollection: battery level %lf%% (raw: %lf%%) when %s", buf, 0x20u);
    }

    return;
  }
LABEL_7:
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_1000732C8();
  }
}

- (void)startCollectionTimer
{
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_1000733A0();
  }
  BOOL v3 = [(HIDApplePencilDevice *)self queue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(HIDApplePencilGen2Device *)self setTimer:v4];

  objc_super v5 = [(HIDApplePencilGen2Device *)self timer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10004AA0C;
  handler[3] = &unk_1000B1268;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);

  unsigned int v6 = [(HIDApplePencilGen2Device *)self timer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004AA14;
  v8[3] = &unk_1000B1268;
  v8[4] = self;
  dispatch_source_set_cancel_handler(v6, v8);

  [(HIDApplePencilGen2Device *)self stictionCollectionRestartTimer:10.0];
  unint64_t v7 = [(HIDApplePencilGen2Device *)self timer];
  dispatch_resume(v7);
}

- (void)stopCollectionTimer
{
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_1000733E0();
  }
  BOOL v3 = [(HIDApplePencilGen2Device *)self timer];
  dispatch_source_cancel(v3);
}

- (void)stictionCollectionRestartTimer:(double)a3
{
  source = [(HIDApplePencilGen2Device *)self timer];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)stictionCollectionGate
{
  BOOL v3 = +[NSString stringWithFormat:@"stictionCollectionGateLastTimeStamp"];
  dispatch_time_t v4 = +[NSUserDefaults standardUserDefaults];
  [v4 doubleForKey:v3];
  double v6 = v5;

  unint64_t v7 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100073508(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = +[NSDate date];
  [v15 timeIntervalSince1970];
  double v17 = v16;
  double v18 = v16 - v6;
  __int16 v19 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100073498(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  if (v6 == 0.0 || v18 < 0.0 || v18 > 86400.0)
  {
    int v28 = [(HIDApplePencilGen2Device *)self stictionCollection];
    v29 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_100073420(v28, v29);
    }
    v30 = +[NSUserDefaults standardUserDefaults];
    [v30 setDouble:v3 forKey:v17];

    id v31 = qword_1000CD178;
    double v27 = 86400.0;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 134217984;
      double v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "stictionCollectionGate: set timestamp of stiction collection = %lf", (uint8_t *)&v32, 0xCu);
    }
  }
  else
  {
    double v27 = 86400.0 - v18;
  }
  [(HIDApplePencilGen2Device *)self stictionCollectionRestartTimer:v27];
}

- (int)stictionCollection
{
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  memset(v22, 0, sizeof(v22));
  uint64_t v17 = 512;
  BYTE4(v16) = 0;
  LODWORD(v16) = 3389;
  BOOL v3 = -[NSDictionary objectForKeyedSubscript:](self->_userDevices, "objectForKeyedSubscript:", &off_1000B7788, v16);
  int v4 = [v3 setReport:&v16 reportLength:5 reportID:61 reportType:2];

  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    sub_100073658();
    if (v4) {
      return v4;
    }
  }
  else if (v4)
  {
    return v4;
  }
  double v5 = [(NSDictionary *)self->_userDevices objectForKeyedSubscript:&off_1000B7788];
  int v4 = [v5 getReport:v22 reportLength:&v17 reportID:62 reportType:2];

  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    sub_1000735E8();
    if (v4) {
      return v4;
    }
  }
  else if (v4)
  {
    return v4;
  }
  if (v17 < 17) {
    return -536870911;
  }
  int v6 = *(_DWORD *)((char *)v22 + 13);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  memset(v22, 0, sizeof(v22));
  uint64_t v17 = 512;
  unint64_t v7 = [(NSDictionary *)self->_userDevices objectForKeyedSubscript:&off_1000B77B8];
  int v4 = [v7 getReport:v22 reportLength:&v17 reportID:208 reportType:2];

  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    sub_100073578();
    if (v4) {
      return v4;
    }
  }
  else if (v4)
  {
    return v4;
  }
  if (v17 < 6) {
    return -536870911;
  }
  double v8 = (double)(v6 + WORD2(v22[0]));
  double v9 = (double)WORD2(v22[0]);
  v20[0] = @"StictionLifetime";
  uint64_t v10 = +[NSNumber numberWithDouble:v8];
  v20[1] = @"StictionSinceBoot";
  v21[0] = v10;
  uint64_t v11 = +[NSNumber numberWithDouble:v9];
  v21[1] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  [(HIDApplePencilDevice *)self sendAnalyticsEvent:@"com.apple.stylus2.motion" withPayload:v12];
  uint64_t v13 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "stictionCollection: Lifetime Stiction   = %lf", buf, 0xCu);
  }
  uint64_t v14 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "stictionCollection: Stiction since Boot = %lf", buf, 0xCu);
  }

  return 0;
}

- (void)pairingInfoCompleted
{
  BOOL v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    double v5 = [(HIDApplePencilDevice *)self loggingIdentifier];
    int v6 = 138412290;
    unint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ received pairing info", (uint8_t *)&v6, 0xCu);
  }
  self->_accdPairingFinished = 1;
  [(HIDApplePencilGen2Device *)self maybeQueryOOBPAndSendStatus];
}

- (id)desiredConnectionParameters
{
  v5.receiver = self;
  v5.super_class = (Class)HIDApplePencilGen2Device;
  BOOL v3 = [(HIDApplePencilDevice *)&v5 desiredConnectionParameters];
  [(HIDApplePencilGen2Device *)self preferredInterval];
  [v3 setMinInterval:];
  [(HIDApplePencilGen2Device *)self preferredInterval];
  [v3 setPreferredInterval:];
  [v3 setPreferredPeripheralLatency:-[HIDApplePencilGen2Device preferredPeripheralLatency](self, "preferredPeripheralLatency")];
  [v3 setMaxPeripheralLatency:-[HIDApplePencilGen2Device maxPeripheralLatency](self, "maxPeripheralLatency")];
  [v3 setTimeout:2000];

  return v3;
}

- (void)authSuccessNotification
{
  BOOL v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    objc_super v5 = [(HIDApplePencilDevice *)self loggingIdentifier];
    *(_DWORD *)buf = 138412290;
    double v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ authSuccessNotification", buf, 0xCu);
  }
  int v6 = [(HIDApplePencilDevice *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B36C;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)authFailureNotification
{
  BOOL v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    objc_super v5 = [(HIDApplePencilDevice *)self loggingIdentifier];
    *(_DWORD *)buf = 138412290;
    double v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ authFailureNotification", buf, 0xCu);
  }
  int v6 = [(HIDApplePencilDevice *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B4A8;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)authCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    unint64_t v7 = [(HIDApplePencilDevice *)self loggingIdentifier];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ authCompleted: %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
  [(HIDChargerNotifier *)self->_chargerNotifier setBTAuthState:v3];
  int64_t v8 = 1;
  if (!v3) {
    int64_t v8 = 2;
  }
  self->_authStatus = v8;
  [(HIDApplePencilGen2Device *)self maybeQueryOOBPAndSendStatus];
  if (v3) {
    [(HIDApplePencilGen2Device *)self publishProperties];
  }
}

- (void)maybeQueryOOBPAndSendStatus
{
  BOOL v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    objc_super v5 = [(HIDApplePencilDevice *)self loggingIdentifier];
    int64_t authStatus = self->_authStatus;
    BOOL accdPairingFinished = self->_accdPairingFinished;
    buf[0] = 138412802;
    *(void *)&buf[1] = v5;
    LOWORD(buf[3]) = 1024;
    *(_DWORD *)((char *)&buf[3] + 2) = authStatus;
    HIWORD(buf[4]) = 1024;
    buf[5] = accdPairingFinished;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ _int64_t authStatus = %u, _accdPairingFinished = %u", (uint8_t *)buf, 0x18u);
  }
  if (self->_authStatus == 1 && self->_accdPairingFinished)
  {
    int64_t v8 = [(HIDApplePencilGen2Device *)self deviceMgntUserDevice];

    if (v8)
    {
      memset((char *)buf + 1, 0, 32);
      LOBYTE(buf[0]) = 65;
      uint64_t v19 = 33;
      int v9 = [(HIDApplePencilGen2Device *)self deviceMgntUserDevice];
      unsigned int v10 = [v9 getReport:buf reportLength:&v19 reportID:65 reportType:2];

      if (!v10 && (v19 == 33 || v19 == 17))
      {
        __int16 v11 = +[NSData dataWithBytes:(char *)buf + 1 length:v19 - 1];
        BOOL v12 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
          sub_100073740((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
        }
        [(HIDChargerNotifier *)self->_chargerNotifier setPairingData:v11];
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_1000736D8();
      }
    }
  }
}

- (void)publishProperties
{
  BOOL v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    objc_super v5 = [(HIDApplePencilDevice *)self loggingIdentifier];
    int v6 = [(HIDApplePencilGen2Device *)self properties];
    *(_DWORD *)buf = 138412546;
    long long v33 = v5;
    __int16 v34 = 2112;
    long long v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ publishing device with properties: %@", buf, 0x16u);
  }
  [(HIDApplePencilGen2Device *)self unpublishProperties];
  unint64_t v7 = [(HIDApplePencilGen2Device *)self properties];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"PhysicalDeviceUniqueID"];

  int v9 = +[ACCTransportClient sharedClient];
  long long v29 = (void *)v8;
  unsigned int v10 = [v9 createConnectionWithType:2 andIdentifier:v8];
  [(HIDApplePencilGen2Device *)self setConnectionUUID:v10];

  __int16 v11 = [(HIDApplePencilGen2Device *)self connectionUUID];

  if (!v11 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_1000737AC();
  }
  BOOL v12 = +[ACCTransportClient sharedClient];
  uint64_t v13 = [(HIDApplePencilGen2Device *)self connectionUUID];
  long long v28 = [v12 createEndpointWithTransportType:3 andProtocol:1 andIdentifier:0 andDataOutHandler:0 forConnectionWithUUID:v13 publishConnection:0];

  v31[0] = @"Apple Pencil";
  v30[0] = kACCInfo_Name;
  v30[1] = kACCInfo_Manufacturer;
  long long v27 = [(HIDApplePencilGen2Device *)self properties];
  long long v26 = [v27 objectForKeyedSubscript:@"Manufacturer"];
  v31[1] = v26;
  v30[2] = kACCInfo_Model;
  uint64_t v14 = [(HIDApplePencilGen2Device *)self properties];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"ModelNumber"];
  v31[2] = v15;
  v30[3] = kACCInfo_SerialNumber;
  uint64_t v16 = [(HIDApplePencilGen2Device *)self properties];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"SerialNumber"];
  v31[3] = v17;
  v30[4] = kACCInfo_HardwareVersion;
  uint64_t v18 = [(HIDApplePencilGen2Device *)self properties];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"kBTHardwareRevisionKey"];
  v31[4] = v19;
  v30[5] = kACCInfo_FirmwareVersionActive;
  uint64_t v20 = [(HIDApplePencilGen2Device *)self properties];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"kBTFirmwareRevisionKey"];
  v31[5] = v21;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];

  long long v23 = +[ACCTransportClient sharedClient];
  [v23 setAccessoryInfo:v22 forEndpointWithUUID:v28];

  long long v24 = +[ACCTransportClient sharedClient];
  long long v25 = [(HIDApplePencilGen2Device *)self connectionUUID];
  [v24 publishConnectionWithUUID:v25];
}

- (void)unpublishProperties
{
  BOOL v3 = [(HIDApplePencilGen2Device *)self connectionUUID];

  if (v3)
  {
    int v4 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = v4;
      int v6 = [(HIDApplePencilDevice *)self loggingIdentifier];
      int v9 = 138412290;
      unsigned int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ unpublishing device properties", (uint8_t *)&v9, 0xCu);
    }
    unint64_t v7 = +[ACCTransportClient sharedClient];
    uint64_t v8 = [(HIDApplePencilGen2Device *)self connectionUUID];
    [v7 destroyConnectionWithUUID:v8];
  }
}

- (float)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(float)a3
{
  self->_preferredInterval = a3;
}

- (int)preferredPeripheralLatency
{
  return self->_preferredPeripheralLatency;
}

- (void)setPreferredPeripheralLatency:(int)a3
{
  self->_preferredPeripheralLatency = a3;
}

- (int)maxPeripheralLatency
{
  return self->_maxPeripheralLatency;
}

- (void)setMaxPeripheralLatency:(int)a3
{
  self->_maxPeripheralLatency = a3;
}

- (NSDictionary)userDevices
{
  return self->_userDevices;
}

- (void)setUserDevices:(id)a3
{
}

- (HIDTimestampSync)timestampSync
{
  return self->_timestampSync;
}

- (void)setTimestampSync:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (HIDChargerNotifier)chargerNotifier
{
  return self->_chargerNotifier;
}

- (void)setChargerNotifier:(id)a3
{
}

- (int64_t)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int64_t)a3
{
  self->_int64_t authStatus = a3;
}

- (BOOL)accdPairingFinished
{
  return self->_accdPairingFinished;
}

- (void)setAccdPairingFinished:(BOOL)a3
{
  self->_BOOL accdPairingFinished = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_chargerNotifier, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_timestampSync, 0);

  objc_storeStrong((id *)&self->_userDevices, 0);
}

@end