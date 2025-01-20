@interface HIDApplePencilDevice
- (HIDApplePencilDevice)initWithProperties:(id)a3 reports:(id)a4;
- (HIDApplePencilDevice)initWithProperties:(id)a3 reports:(id)a4 loggingIdentifier:(id)a5;
- (HIDKeyholeUserDevice)deviceMgntUserDevice;
- (HIDKeyholeUserDevice)forceUserDevice;
- (NSSet)forceInputReportSet;
- (NSString)loggingIdentifier;
- (OS_dispatch_queue)queue;
- (float)preferredInterval;
- (id)desiredConnectionParameters;
- (id)newDeviceMgntDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newForceDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newInertialSensorDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newRadioDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newUserDevice:(id)a3 descriptor:(void *)a4 descriptorLength:(int64_t)a5 keyholeID:(unsigned __int8)a6;
- (id)newUserDevices:(id)a3;
- (int)preferredPeripheralLatency;
- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (int64_t)btSyncPeriod;
- (void)dealloc;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
- (void)mtWillPowerOn;
- (void)notifyDidStart;
- (void)notifyDidStop;
- (void)piconetClockNotification:(id)a3;
- (void)sendAnalyticsEvent:(id)a3 withPayload:(id)a4;
- (void)setBtSyncPeriod:(int64_t)a3;
- (void)setPreferredInterval:(float)a3;
- (void)setPreferredPeripheralLatency:(int)a3;
- (void)start;
- (void)stop;
@end

@implementation HIDApplePencilDevice

- (id)newUserDevice:(id)a3 descriptor:(void *)a4 descriptorLength:(int64_t)a5 keyholeID:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  v11 = +[NSData dataWithBytes:a4 length:a5];
  v12 = [[HIDKeyholeUserDevice alloc] initWithProperties:v10 hidDescriptor:v11 keyholeID:v6 delegate:self];

  return v12;
}

- (id)newDeviceMgntDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 addEntriesFromDictionary:v6];

  [v7 setObject:&off_1000B7BB0 forKeyedSubscript:@"ExtendedData"];
  v10[0] = 0x1A1000B0AFF0006;
  *(void *)((char *)v10 + 6) = 0xC002B1000B0A01A1;
  id v8 = [(HIDApplePencilDevice *)self newUserDevice:v7 descriptor:v10 descriptorLength:14 keyholeID:v4];

  return v8;
}

- (id)newInertialSensorDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  long long v5 = xmmword_10008A706;
  int v6 = -1073577711;
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:&v5 descriptorLength:20 keyholeID:a4];
}

- (id)newRadioDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  v5[0] = 0x1A100120AFF0006;
  *(void *)((char *)v5 + 6) = 0xC002B100120A01A1;
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:14 keyholeID:a4];
}

- (id)newForceDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  v5[0] = xmmword_10008A728;
  v5[1] = unk_10008A738;
  v6[0] = xmmword_10008A748;
  *(_OWORD *)((char *)v6 + 10) = *(long long *)((char *)&xmmword_10008A748 + 10);
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:58 keyholeID:a4];
}

- (id)newUserDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDApplePencilDevice *)self newDeviceMgntDevice:v4 keyholeID:240];
  id v6 = [(HIDApplePencilDevice *)self newInertialSensorDevice:v4 keyholeID:243];
  id v7 = [(HIDApplePencilDevice *)self newRadioDevice:v4 keyholeID:245];
  id v8 = [(HIDApplePencilDevice *)self newForceDevice:v4 keyholeID:248];

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006ED7C();
    }
    goto LABEL_15;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EDB0();
    }
    goto LABEL_15;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EDE4();
    }
    goto LABEL_15;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EE18();
    }
LABEL_15:
    v9 = 0;
    goto LABEL_6;
  }
  objc_storeStrong((id *)&self->_deviceMgntUserDevice, v5);
  objc_storeStrong((id *)&self->_forceUserDevice, v8);
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v7;
  v11[3] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:4];
LABEL_6:

  return v9;
}

- (void)start
{
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)HIDApplePencilDevice;
  [(HIDBluetoothDevice *)&v17 start];
  dispatch_set_context((dispatch_object_t)self->_queue, self);
  dispatch_set_finalizer_f((dispatch_object_t)self->_queue, (dispatch_function_t)[self _notifyDidStop]);
  userDevices = self->_userDevices;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001E910;
  v16[3] = &unk_1000B16C0;
  v16[4] = self;
  [(NSArray *)userDevices enumerateObjectsUsingBlock:v16];
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 integerForKey:@"BTSyncPeriod"];
  if (v5) {
    uint64_t v6 = (uint64_t)v5;
  }
  else {
    uint64_t v6 = 4;
  }
  [(HIDApplePencilDevice *)self setBtSyncPeriod:v6];

  id v7 = [(HIDBluetoothDevice *)self peripheral];
  unsigned int v8 = [v7 hasTag:@"A2538"];

  if (v8)
  {
    v9 = +[NSUserDefaults standardUserDefaults];
    id v10 = [v9 integerForKey:@"BTSyncPeriod"];
    if ((unint64_t)v10 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = (uint64_t)v10;
    }
    [(HIDApplePencilDevice *)self setBtSyncPeriod:v11];
  }
  v12 = +[BTLEXpcServer instance];
  unsigned __int16 v13 = (unsigned __int16)[(HIDApplePencilDevice *)self btSyncPeriod];
  v14 = [(HIDBluetoothDevice *)self peripheral];
  [v12 sendEnableBTSyncMsg:v13 forPeer:v14];

  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"piconetClockNotification:" name:@"PiconetClockNotification" object:0];

  [(HIDApplePencilDevice *)self notifyDidStart];
  kdebug_trace();
}

- (void)notifyDidStart
{
  queue = self->_queue;
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E9C4;
  block[3] = &unk_1000B1268;
  block[4] = self;
  id v4 = queue;
  dispatch_async(notifyQueue, block);
}

- (void)notifyDidStop
{
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EACC;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(notifyQueue, block);
}

- (id)desiredConnectionParameters
{
  v5.receiver = self;
  v5.super_class = (Class)HIDApplePencilDevice;
  v3 = [(HIDBluetoothDevice *)&v5 desiredConnectionParameters];
  [(HIDApplePencilDevice *)self preferredInterval];
  [v3 setMinInterval:];
  [(HIDApplePencilDevice *)self preferredInterval];
  [v3 setPreferredInterval:];
  [v3 setPreferredPeripheralLatency:-[HIDApplePencilDevice preferredPeripheralLatency](self, "preferredPeripheralLatency")];
  [v3 setMaxPeripheralLatency:-[HIDApplePencilDevice preferredPeripheralLatency](self, "preferredPeripheralLatency")];
  [v3 setMinCELength:4];
  [v3 setMaxCELength:4];
  [v3 setMaxDeferment:1];

  return v3;
}

- (HIDApplePencilDevice)initWithProperties:(id)a3 reports:(id)a4
{
  return [(HIDApplePencilDevice *)self initWithProperties:a3 reports:a4 loggingIdentifier:@"Pencil"];
}

- (HIDApplePencilDevice)initWithProperties:(id)a3 reports:(id)a4 loggingIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  kdebug_trace();
  v30.receiver = self;
  v30.super_class = (Class)HIDApplePencilDevice;
  uint64_t v11 = [(HIDBluetoothDevice *)&v30 initWithProperties:v8 reports:v10];

  if (!v11) {
    goto LABEL_8;
  }
  v12 = (NSSet *)[objc_alloc((Class)NSSet) initWithObjects:&off_1000B75C0, &off_1000B75D8, &off_1000B75F0, &off_1000B7608, 0];
  forceInputReportSet = v11->_forceInputReportSet;
  v11->_forceInputReportSet = v12;

  if (!v11->_forceInputReportSet)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EE4C();
    }
    goto LABEL_19;
  }
  v14 = [(HIDBluetoothDevice *)v11 allocHIDQueue];
  queue = v11->_queue;
  v11->_queue = v14;

  if (!v11->_queue)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EE80();
    }
    goto LABEL_19;
  }
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  hostReadySentSemaphore = v11->_hostReadySentSemaphore;
  v11->_hostReadySentSemaphore = (OS_dispatch_semaphore *)v16;

  if (!v11->_hostReadySentSemaphore)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EEB4();
    }
    goto LABEL_19;
  }
  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v20 = +[NSString stringWithFormat:@"com.apple.BTLEServer.%@", v19];

  id v21 = v20;
  dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
  notifyQueue = v11->_notifyQueue;
  v11->_notifyQueue = (OS_dispatch_queue *)v22;

  if (!v11->_notifyQueue)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006EEE8();
    }
    goto LABEL_18;
  }
  v24 = [(HIDApplePencilDevice *)v11 newUserDevices:v8];
  userDevices = v11->_userDevices;
  v11->_userDevices = v24;

  if (!v11->_userDevices)
  {
LABEL_18:

LABEL_19:
    kdebug_trace();
    v28 = 0;
    goto LABEL_9;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)sub_10001EF1C, @"com.apple.hid.sessionFilterPlugin.fireflyManager.willPowerOn", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  LODWORD(v27) = 15.0;
  [(HIDApplePencilDevice *)v11 setPreferredInterval:v27];
  [(HIDApplePencilDevice *)v11 setPreferredPeripheralLatency:10];
  objc_storeStrong((id *)&v11->_loggingIdentifier, a5);

LABEL_8:
  kdebug_trace();
  v28 = v11;
LABEL_9:

  return v28;
}

- (void)stop
{
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)HIDApplePencilDevice;
  [(HIDBluetoothDevice *)&v5 stop];
  [(NSArray *)self->_userDevices enumerateObjectsUsingBlock:&stru_1000B1700];
  queue = self->_queue;
  self->_queue = 0;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  kdebug_trace();
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.hid.sessionFilterPlugin.fireflyManager.willPowerOn", 0);
  v4.receiver = self;
  v4.super_class = (Class)HIDApplePencilDevice;
  [(HIDBluetoothDevice *)&v4 dealloc];
}

- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  id v10 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HIDApplePencilDevice;
  int v11 = [(HIDBluetoothDevice *)&v24 setReportData:v10 reportID:v8 reportType:v7 error:a6];
  id v12 = v10;
  unsigned __int16 v13 = (unsigned __int8 *)[v12 bytes];
  if (!v11)
  {
    v14 = v13;
    v15 = [(HIDApplePencilDevice *)self forceUserDevice];
    if ([v15 keyholeID] == v8)
    {
      id v16 = [v12 length];

      if ((unint64_t)v16 >= 2)
      {
        int v17 = *v14;
        if (v17 == 124)
        {
          v19 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Firefly] Restarting BTSync", v23, 2u);
          }
          v20 = +[BTLEXpcServer instance];
          unsigned __int16 v21 = (unsigned __int16)[(HIDApplePencilDevice *)self btSyncPeriod];
          dispatch_queue_t v22 = [(HIDBluetoothDevice *)self peripheral];
          [v20 sendEnableBTSyncMsg:v21 forPeer:v22];
        }
        else if (v17 == 64 && v14[1] == 1)
        {
          dispatch_semaphore_signal((dispatch_semaphore_t)self->_hostReadySentSemaphore);
        }
      }
    }
    else
    {
    }
  }

  return v11;
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [(HIDApplePencilDevice *)self forceInputReportSet];
  id v10 = +[NSNumber numberWithUnsignedChar:v6];
  int v11 = [v9 member:v10];

  if (v11)
  {
    id v12 = (char *)[v8 length];
    unsigned __int16 v13 = (char *)&v15 - ((unint64_t)(v12 + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, (size_t)(v12 + 1));
    *unsigned __int16 v13 = v6;
    [v8 getBytes:v13 + 1 length:v12];
    kdebug_trace();
    v14 = [(HIDApplePencilDevice *)self forceUserDevice];
    [v14 handleInputReport:v13 reportLength:v12 + 1 timestamp:a5];
  }
}

- (void)sendAnalyticsEvent:(id)a3 withPayload:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)piconetClockNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [v4 description];
    *(_DWORD *)unsigned __int16 v13 = 136315138;
    *(void *)&v13[4] = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Firefly] piconetClockNotification: %s", v13, 0xCu);
  }
  v13[0] = 119;
  id v8 = [v4 userInfo:v13];
  id v9 = [v8 objectForKeyedSubscript:@"PiconetClockUserInfoKey"];
  *(_DWORD *)&v13[1] = [v9 unsignedIntegerValue];

  id v10 = [v4 userInfo];
  int v11 = [v10 objectForKeyedSubscript:@"PiconetPhaseClockUserInfoKey"];
  *(_DWORD *)&v13[5] = [v11 unsignedIntegerValue];

  kdebug_trace();
  id v12 = [(HIDApplePencilDevice *)self forceUserDevice];
  [v12 handleInputReport:v13 reportLength:9];
}

- (void)mtWillPowerOn
{
  LODWORD(v2) = 15.0;
  [(HIDApplePencilDevice *)self setPreferredInterval:v2];
  [(HIDApplePencilDevice *)self setPreferredPeripheralLatency:4];

  [(HIDBluetoothDevice *)self notifyDesiredConnectionParametersDidChange];
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

- (HIDKeyholeUserDevice)forceUserDevice
{
  return self->_forceUserDevice;
}

- (HIDKeyholeUserDevice)deviceMgntUserDevice
{
  return self->_deviceMgntUserDevice;
}

- (NSSet)forceInputReportSet
{
  return self->_forceInputReportSet;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)btSyncPeriod
{
  return self->_btSyncPeriod;
}

- (void)setBtSyncPeriod:(int64_t)a3
{
  self->_btSyncPeriod = a3;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_forceInputReportSet, 0);
  objc_storeStrong((id *)&self->_deviceMgntUserDevice, 0);
  objc_storeStrong((id *)&self->_forceUserDevice, 0);
  objc_storeStrong((id *)&self->_hostReadySentSemaphore, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong((id *)&self->_userDevices, 0);
}

@end