@interface HIDAppleSiriRemoteDevice
+ (id)getAudioHIDReportDescriptor;
+ (id)getButtonsHIDReportDescriptor:(unsigned __int16)a3;
+ (id)getDeviceManagementHIDReportDescriptor;
+ (id)getInertialHIDReportDescriptor;
+ (id)getInfraredHIDReportDescriptor;
+ (id)getProximityHIDReportDescriptor;
+ (id)getRadioHIDReportDescriptor;
+ (id)getTouchHIDReportDescriptor;
+ (id)properties:(id)a3 locationIdOffset:(unsigned int)a4 hidDescriptor:(id)a5 extendedData:(id)a6;
- (BOOL)firstButton;
- (BOOL)matchInstanceIDInHidEventDriver:(unsigned int)a3;
- (DoAPAudioRelay)doapAudioRelay;
- (HIDAppleSiriRemoteDevice)initWithProperties:(id)a3 reports:(id)a4;
- (IONotificationPort)notificationPort;
- (NSDate)lastAudioDate;
- (NSDictionary)properties;
- (NSMutableArray)audioBuffer;
- (NSMutableArray)cachedButtonsAndTimestamps;
- (NSMutableData)inertialData;
- (NSMutableData)touchData;
- (NSMutableSet)pathIDs;
- (NSString)serialNumber;
- (OS_dispatch_group)groupDeviceManagement;
- (OS_dispatch_group)groupInertial;
- (OS_dispatch_group)groupInit;
- (OS_dispatch_group)groupProximity;
- (OS_dispatch_group)groupStart;
- (OS_dispatch_group)groupTouch;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)doapAudioStart;
- (OS_dispatch_semaphore)doapAudioStop;
- (OS_dispatch_semaphore)gotDeviceExtendedInfoReport;
- (OS_dispatch_semaphore)sentHostReadyReport;
- (id)audio;
- (id)buttons;
- (id)desiredConnectionParameters;
- (id)deviceManagement;
- (id)inertial;
- (id)infrared;
- (id)proximity;
- (id)radio;
- (id)touch;
- (int)connectedStandbyToken;
- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7;
- (int)latency;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7;
- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7 error:(id *)a8;
- (unint64_t)inputReportTimestamp;
- (unsigned)amdNotification;
- (unsigned)buttonData;
- (unsigned)buttonInterestNotification;
- (unsigned)deviceMgtNotification;
- (unsigned)instanceID;
- (unsigned)productID;
- (unsigned)proximityData;
- (void)appleMultitouchDeviceArrived:(unsigned int)a3;
- (void)clearAppleMultitouchDeviceNotification;
- (void)clearButtonInterestNotification;
- (void)clearDeviceManagementNotification;
- (void)dealloc;
- (void)demultiplexInputReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5;
- (void)deviceMgtDriverArrived:(unsigned int)a3;
- (void)doapAudioDidStop:(id)a3;
- (void)doapAudioWillStart:(id)a3;
- (void)extractButtonDataFromReport:(char *)a3 buttonIndex:(unsigned __int8)a4;
- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleButtonData;
- (void)handleDeviceManagementData:(char *)a3 dataLength:(int64_t)a4;
- (void)handleInertialData;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
- (void)handleInputReportDataV1:(id)a3 reportID:(unsigned __int8)a4;
- (void)handleInputReportDataV2:(id)a3 reportID:(unsigned __int8)a4;
- (void)handleProximityData;
- (void)handleTouchData;
- (void)logHwFwVersions;
- (void)logTouchData;
- (void)sendButtonDataToUserDevice:(unsigned __int16)a3 withTimestamp:(unint64_t)a4;
- (void)setAmdNotification:(unsigned int)a3;
- (void)setAudio:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setButtonData:(unsigned __int16)a3;
- (void)setButtonInterestNotification:(unsigned int)a3;
- (void)setButtons:(id)a3;
- (void)setCachedButtonsAndTimestamps:(id)a3;
- (void)setConnectedStandbyToken:(int)a3;
- (void)setDeviceManagement:(id)a3;
- (void)setDeviceMgtNotification:(unsigned int)a3;
- (void)setDoapAudioRelay:(id)a3;
- (void)setDoapAudioStart:(id)a3;
- (void)setDoapAudioStop:(id)a3;
- (void)setFirstButton:(BOOL)a3;
- (void)setInertial:(id)a3;
- (void)setInfrared:(id)a3;
- (void)setInputReportTimestamp:(unint64_t)a3;
- (void)setLastAudioDate:(id)a3;
- (void)setLatency:(int)a3;
- (void)setNormalPeripheralLatency;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setProximity:(id)a3;
- (void)setProximityData:(unsigned __int8)a3;
- (void)setQueue:(id)a3;
- (void)setRadio:(id)a3;
- (void)setSleepPeripheralLatency;
- (void)setTouch:(id)a3;
- (void)setZeroPeripheralLatency;
- (void)start;
- (void)stop;
- (void)verifyButtonDriverOpenedByEventSystem:(unsigned int)a3;
- (void)waitForSiriAudioToStop:(id)a3;
@end

@implementation HIDAppleSiriRemoteDevice

+ (id)getTouchHIDReportDescriptor
{
  v4[0] = xmmword_10008A4E0;
  *(_OWORD *)((char *)v4 + 15) = *(long long *)((char *)&xmmword_10008A4E0 + 15);
  v2 = +[NSData dataWithBytes:v4 length:31];

  return v2;
}

+ (id)getButtonsHIDReportDescriptor:(unsigned __int16)a3
{
  if ((a3 & 0xFFFE) == 0x314)
  {
    *(_OWORD *)v8 = xmmword_10008A51F;
    *(_OWORD *)&v8[16] = unk_10008A52F;
    *(void *)&v8[31] = 0xC00102B201950680;
    long long v6 = xmmword_10008A4FF;
    long long v7 = unk_10008A50F;
    uint64_t v3 = 71;
  }
  else
  {
    long long v6 = xmmword_10008A546;
    long long v7 = unk_10008A556;
    *(_OWORD *)v8 = xmmword_10008A566;
    *(void *)&v8[15] = 0xC00102B201950680;
    uint64_t v3 = 55;
  }
  v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, v3, v6, v7, *(_OWORD *)v8, *(_OWORD *)&v8[16], *(void *)&v8[32]);

  return v4;
}

+ (id)getInertialHIDReportDescriptor
{
  long long v4 = xmmword_10008A57D;
  v5[0] = unk_10008A58D;
  *(_OWORD *)((char *)v5 + 15) = unk_10008A59C;
  v2 = +[NSData dataWithBytes:&v4 length:47];

  return v2;
}

+ (id)getInfraredHIDReportDescriptor
{
  v4[0] = xmmword_10008A5AC;
  *(_OWORD *)((char *)v4 + 15) = *(long long *)((char *)&xmmword_10008A5AC + 15);
  v2 = +[NSData dataWithBytes:v4 length:31];

  return v2;
}

+ (id)getAudioHIDReportDescriptor
{
  v4[0] = xmmword_10008A5CB;
  *(_OWORD *)((char *)v4 + 15) = *(long long *)((char *)&xmmword_10008A5CB + 15);
  v2 = +[NSData dataWithBytes:v4 length:31];

  return v2;
}

+ (id)getRadioHIDReportDescriptor
{
  v4[0] = xmmword_10008A5EA;
  *(_OWORD *)((char *)v4 + 15) = *(long long *)((char *)&xmmword_10008A5EA + 15);
  v2 = +[NSData dataWithBytes:v4 length:31];

  return v2;
}

+ (id)getDeviceManagementHIDReportDescriptor
{
  long long v4 = xmmword_10008A609;
  *(_OWORD *)v5 = unk_10008A619;
  *(_DWORD *)&v5[15] = -1073675598;
  v2 = +[NSData dataWithBytes:&v4 length:35];

  return v2;
}

+ (id)getProximityHIDReportDescriptor
{
  v4[0] = xmmword_10008A62C;
  v4[1] = unk_10008A63C;
  char v5 = -64;
  v2 = +[NSData dataWithBytes:v4 length:33];

  return v2;
}

+ (id)properties:(id)a3 locationIdOffset:(unsigned int)a4 hidDescriptor:(id)a5 extendedData:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 mutableCopy];
  v13 = v12;
  if (v10) {
    [v12 setObject:v10 forKeyedSubscript:@"ReportDescriptor"];
  }
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:@"ExtendedData"];
  }
  v14 = [v9 objectForKeyedSubscript:@"LocationID"];
  v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 unsignedLongValue] + a4);
  [v13 setObject:v15 forKeyedSubscript:@"LocationID"];

  return v13;
}

- (HIDAppleSiriRemoteDevice)initWithProperties:(id)a3 reports:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CB5C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (byte_1000CD170) {
    kdebug_trace();
  }
  v59.receiver = self;
  v59.super_class = (Class)HIDAppleSiriRemoteDevice;
  v16 = [(HIDBluetoothDevice *)&v59 initWithProperties:v6 reports:v7];
  v17 = v16;
  if (v16)
  {
    int v18 = dword_1000CD000++;
    v16->_instanceID = v18;
    v16->_firstButton = 1;
    id v19 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v6];
    v20 = +[NSNumber numberWithUnsignedInt:v17->_instanceID];
    [v19 setObject:v20 forKeyedSubscript:@"InstanceID"];

    objc_storeStrong((id *)&v17->_properties, v19);
    v21 = [v6 objectForKeyedSubscript:@"ProductID"];
    v17->_productID = (unsigned __int16)[v21 unsignedIntValue];

    uint64_t v22 = [v6 objectForKeyedSubscript:@"SerialNumber"];
    serialNumber = v17->_serialNumber;
    v17->_serialNumber = (NSString *)v22;

    v17->_latency = 0;
    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    audioBuffer = v17->_audioBuffer;
    v17->_audioBuffer = v24;

    v17->_connectedStandbyToken = -1;
    v26 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pathIDs = v17->_pathIDs;
    v17->_pathIDs = v26;

    v28 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:512];
    touchData = v17->_touchData;
    v17->_touchData = v28;

    v30 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:512];
    inertialData = v17->_inertialData;
    v17->_inertialData = v30;

    v32 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cachedButtonsAndTimestamps = v17->_cachedButtonsAndTimestamps;
    v17->_cachedButtonsAndTimestamps = v32;

    dispatch_group_t v34 = dispatch_group_create();
    groupInit = v17->_groupInit;
    v17->_groupInit = (OS_dispatch_group *)v34;

    dispatch_group_t v36 = dispatch_group_create();
    groupStart = v17->_groupStart;
    v17->_groupStart = (OS_dispatch_group *)v36;

    dispatch_group_t v38 = dispatch_group_create();
    groupDeviceManagement = v17->_groupDeviceManagement;
    v17->_groupDeviceManagement = (OS_dispatch_group *)v38;

    dispatch_group_t v40 = dispatch_group_create();
    groupTouch = v17->_groupTouch;
    v17->_groupTouch = (OS_dispatch_group *)v40;

    dispatch_group_t v42 = dispatch_group_create();
    groupInertial = v17->_groupInertial;
    v17->_groupInertial = (OS_dispatch_group *)v42;

    dispatch_group_t v44 = dispatch_group_create();
    groupProximity = v17->_groupProximity;
    v17->_groupProximity = (OS_dispatch_group *)v44;

    BOOL v46 = v17->_groupInit
       && v17->_groupStart
       && v17->_groupDeviceManagement
       && v17->_groupTouch
       && v17->_groupInertial
       && v17->_groupProximity;
    dispatch_semaphore_t v47 = dispatch_semaphore_create(0);
    gotDeviceExtendedInfoReport = v17->_gotDeviceExtendedInfoReport;
    v17->_gotDeviceExtendedInfoReport = (OS_dispatch_semaphore *)v47;

    dispatch_semaphore_t v49 = dispatch_semaphore_create(0);
    sentHostReadyReport = v17->_sentHostReadyReport;
    v17->_sentHostReadyReport = (OS_dispatch_semaphore *)v49;

    dispatch_semaphore_t v51 = dispatch_semaphore_create(1);
    doapAudioStart = v17->_doapAudioStart;
    v17->_doapAudioStart = (OS_dispatch_semaphore *)v51;

    if (!v17->_gotDeviceExtendedInfoReport || !v17->_sentHostReadyReport || !v17->_doapAudioStart) {
      BOOL v46 = 0;
    }
    v53 = [(HIDBluetoothDevice *)v17 allocHIDQueue];
    queue = v17->_queue;
    v17->_queue = v53;

    char v55 = 0;
    if (v46 && v17->_queue)
    {
      v56 = IONotificationPortCreate(kIOMainPortDefault);
      v17->_notificationPort = v56;
      if (v56)
      {
        IONotificationPortSetDispatchQueue(v56, (dispatch_queue_t)v17->_queue);
        dispatch_set_context((dispatch_object_t)v17->_queue, v17);
        dispatch_set_finalizer_f((dispatch_object_t)v17->_queue, (dispatch_function_t)sub_100009520);
        char v55 = 1;
      }
      else
      {
        char v55 = 0;
      }
    }
    if (byte_1000CD170) {
      kdebug_trace();
    }
    if ((v55 & 1) == 0)
    {
      notificationPort = v17->_notificationPort;
      if (notificationPort)
      {
        IONotificationPortDestroy(notificationPort);
        v17->_notificationPort = 0;
      }

      v17 = 0;
    }
  }
  return v17;
}

- (void)dealloc
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CC4C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if (self->_doapAudioRelay) {
    [(HIDAppleSiriRemoteDevice *)self stop];
  }
  v11.receiver = self;
  v11.super_class = (Class)HIDAppleSiriRemoteDevice;
  [(HIDBluetoothDevice *)&v11 dealloc];
}

- (void)stop
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CCC4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  objc_super v11 = [(HIDAppleSiriRemoteDevice *)self doapAudioStart];
  dispatch_semaphore_signal(v11);

  uint64_t v12 = self;
  objc_sync_enter(v12);
  uint64_t v13 = [(HIDAppleSiriRemoteDevice *)v12 doapAudioStop];

  if (v13)
  {
    uint64_t v14 = [(HIDAppleSiriRemoteDevice *)v12 doapAudioStop];
    dispatch_semaphore_signal(v14);
  }
  objc_sync_exit(v12);

  [(HIDAppleSiriRemoteDevice *)v12 setButtonData:0];
  [(HIDAppleSiriRemoteDevice *)v12 handleButtonData];
  if ([(HIDAppleSiriRemoteDevice *)v12 proximityData])
  {
    [(HIDAppleSiriRemoteDevice *)v12 setProximityData:0];
    [(HIDAppleSiriRemoteDevice *)v12 handleProximityData];
  }
  uint64_t v15 = [(HIDAppleSiriRemoteDevice *)v12 doapAudioRelay];
  [v15 invalidate];

  [(HIDAppleSiriRemoteDevice *)v12 setDoapAudioRelay:0];
  v20.receiver = v12;
  v20.super_class = (Class)HIDAppleSiriRemoteDevice;
  [(HIDBluetoothDevice *)&v20 stop];
  id location = 0;
  objc_initWeak(&location, v12);
  v16 = [(HIDAppleSiriRemoteDevice *)v12 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000097DC;
  block[3] = &unk_1000B1240;
  objc_copyWeak(&v18, &location);
  block[4] = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)start
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CD3C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v36.receiver = self;
  v36.super_class = (Class)HIDAppleSiriRemoteDevice;
  [(HIDBluetoothDevice *)&v36 start];
  objc_super v11 = [(HIDAppleSiriRemoteDevice *)self groupDeviceManagement];
  dispatch_group_enter(v11);

  uint64_t v12 = [(HIDAppleSiriRemoteDevice *)self groupTouch];
  dispatch_group_enter(v12);

  uint64_t v13 = [(HIDAppleSiriRemoteDevice *)self groupInertial];
  dispatch_group_enter(v13);

  uint64_t v14 = [(HIDAppleSiriRemoteDevice *)self groupProximity];
  dispatch_group_enter(v14);

  uint64_t v15 = [(HIDAppleSiriRemoteDevice *)self groupInit];
  v16 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A090;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_group_async(v15, v16, block);

  v17 = [(HIDAppleSiriRemoteDevice *)self groupInit];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000A3F4;
  v34[3] = &unk_1000B1268;
  v34[4] = self;
  dispatch_group_async(v17, v16, v34);

  id v18 = [(HIDAppleSiriRemoteDevice *)self groupInit];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000A6D4;
  v33[3] = &unk_1000B1268;
  v33[4] = self;
  dispatch_group_async(v18, v16, v33);

  if ([(HIDAppleSiriRemoteDevice *)self productID] == 788
    || [(HIDAppleSiriRemoteDevice *)self productID] == 789)
  {
    if (byte_1000CD170)
    {
      [(HIDAppleSiriRemoteDevice *)self instanceID];
      kdebug_trace();
    }
    id v19 = [(HIDAppleSiriRemoteDevice *)self groupInertial];
    dispatch_group_leave(v19);

    if (byte_1000CD170)
    {
      [(HIDAppleSiriRemoteDevice *)self instanceID];
      kdebug_trace();
    }
  }
  else
  {
    objc_super v20 = [(HIDAppleSiriRemoteDevice *)self groupInit];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000A9B8;
    v32[3] = &unk_1000B1268;
    v32[4] = self;
    dispatch_group_async(v20, v16, v32);
  }
  v21 = [(HIDAppleSiriRemoteDevice *)self groupInit];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000ABD8;
  v31[3] = &unk_1000B1268;
  v31[4] = self;
  dispatch_group_async(v21, v16, v31);

  uint64_t v22 = [(HIDAppleSiriRemoteDevice *)self groupInit];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000ADF8;
  v30[3] = &unk_1000B1268;
  v30[4] = self;
  dispatch_group_async(v22, v16, v30);

  if ([(HIDAppleSiriRemoteDevice *)self productID] == 614
    || [(HIDAppleSiriRemoteDevice *)self productID] == 621)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v23 = [(HIDAppleSiriRemoteDevice *)self groupStart];
    v24 = [(HIDAppleSiriRemoteDevice *)self queue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000B600;
    v27[3] = &unk_1000B1290;
    objc_copyWeak(&v28, &location);
    dispatch_group_async(v23, v24, v27);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  v25 = [(HIDAppleSiriRemoteDevice *)self groupStart];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000B71C;
  v26[3] = &unk_1000B1268;
  v26[4] = self;
  dispatch_group_async(v25, v16, v26);
}

- (void)clearAppleMultitouchDeviceNotification
{
  if ([(HIDAppleSiriRemoteDevice *)self amdNotification])
  {
    IOObjectRelease([(HIDAppleSiriRemoteDevice *)self amdNotification]);
    [(HIDAppleSiriRemoteDevice *)self setAmdNotification:0];
  }
}

- (void)clearDeviceManagementNotification
{
  if ([(HIDAppleSiriRemoteDevice *)self deviceMgtNotification])
  {
    IOObjectRelease([(HIDAppleSiriRemoteDevice *)self deviceMgtNotification]);
    [(HIDAppleSiriRemoteDevice *)self setDeviceMgtNotification:0];
  }
}

- (void)clearButtonInterestNotification
{
  if ([(HIDAppleSiriRemoteDevice *)self buttonInterestNotification])
  {
    IOObjectRelease([(HIDAppleSiriRemoteDevice *)self buttonInterestNotification]);
    [(HIDAppleSiriRemoteDevice *)self setButtonInterestNotification:0];
  }
}

- (BOOL)matchInstanceIDInHidEventDriver:(unsigned int)a3
{
  kern_return_t ParentEntry;
  BOOL v9;
  io_object_t v10;
  kern_return_t v11;
  io_object_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  io_registry_entry_t entry;
  io_registry_entry_t parent;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"SerialNumber", kCFAllocatorDefault, 0);
  if (CFProperty
    && ([(HIDAppleSiriRemoteDevice *)self serialNumber],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:CFProperty],
        v6,
        v7))
  {
    parent = 0;
    ParentEntry = IORegistryEntryGetParentEntry(a3, "IOService", &parent);
    uint64_t v9 = 0;
    uint64_t v10 = parent;
    if (!ParentEntry && parent)
    {
      entry = 0;
      objc_super v11 = IORegistryEntryGetParentEntry(parent, "IOService", &entry);
      uint64_t v9 = 0;
      uint64_t v12 = entry;
      if (!v11 && entry)
      {
        uint64_t v13 = (void *)IORegistryEntryCreateCFProperty(entry, @"InstanceID", kCFAllocatorDefault, 0);
        uint64_t v14 = v13;
        if (v13
          && (uint64_t v15 = [v13 unsignedIntValue],
              v15 == [(HIDAppleSiriRemoteDevice *)self instanceID]))
        {
          v16 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
            sub_10006CE3C(v16, self);
          }
          uint64_t v9 = 1;
        }
        else
        {
          uint64_t v9 = 0;
        }

        uint64_t v12 = entry;
      }
      IOObjectRelease(v12);
      uint64_t v10 = parent;
    }
    IOObjectRelease(v10);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)verifyButtonDriverOpenedByEventSystem:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"DeviceOpenedByEventSystem", kCFAllocatorDefault, 0);
  if ([CFProperty BOOLValue])
  {
    v16 = CFProperty;
    uint64_t v5 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HID event system ready to dispatch keyboard/button events", buf, 2u);
    }
    [(HIDAppleSiriRemoteDevice *)self clearButtonInterestNotification];
    uint64_t v6 = self;
    objc_sync_enter(v6);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unsigned int v7 = [(HIDAppleSiriRemoteDevice *)v6 cachedButtonsAndTimestamps];
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_super v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v11 objectAtIndexedSubscript:0];
          uint64_t v13 = [v11 objectAtIndexedSubscript:1];
          uint64_t v14 = (id)qword_1000CD178;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v15 = [v12 unsignedIntValue];
            *(_DWORD *)buf = 67109120;
            unsigned int v22 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Send cached button 0x%04X", buf, 8u);
          }

          -[HIDAppleSiriRemoteDevice sendButtonDataToUserDevice:withTimestamp:](v6, "sendButtonDataToUserDevice:withTimestamp:", (unsigned __int16)[v12 unsignedIntValue], [v13 unsignedLongLongValue]);
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v8);
    }

    [(HIDAppleSiriRemoteDevice *)v6 setCachedButtonsAndTimestamps:0];
    objc_sync_exit(v6);

    CFProperty = v16;
  }
}

- (void)deviceMgtDriverArrived:(unsigned int)a3
{
  uint64_t v5 = IOIteratorNext(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      if ([(HIDAppleSiriRemoteDevice *)self matchInstanceIDInHidEventDriver:v6])
      {
        unsigned int v7 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
          sub_10006CEC4(v12, v7, self, &v13);
        }
        id v8 = [(HIDBluetoothDevice *)self peripheral];
        uint64_t v9 = +[CBUUID UUIDWithString:@"181E"];
        unsigned int v10 = [v8 isSupportingService:v9];

        if (v10) {
          CFBooleanRef v11 = kCFBooleanTrue;
        }
        else {
          CFBooleanRef v11 = kCFBooleanFalse;
        }
        IORegistryEntrySetCFProperty(v6, @"BondManagement", v11);
      }
      uint64_t v6 = IOIteratorNext(a3);
    }
    while (v6);
  }
}

- (void)appleMultitouchDeviceArrived:(unsigned int)a3
{
  for (io_object_t i = IOIteratorNext(a3); i; io_object_t i = IOIteratorNext(a3))
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(i, "IOService", &parent)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = parent == 0;
    }
    if (!v6 && -[HIDAppleSiriRemoteDevice matchInstanceIDInHidEventDriver:](self, "matchInstanceIDInHidEventDriver:"))
    {
      unsigned int v7 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_10006CF3C(&v8, v9, v7);
      }
      [(HIDAppleSiriRemoteDevice *)self setNormalPeripheralLatency];
    }
  }
}

- (id)desiredConnectionParameters
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CF7C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if ([(HIDBluetoothDevice *)self state] == 2)
  {
    v23.receiver = self;
    v23.super_class = (Class)HIDAppleSiriRemoteDevice;
    CFBooleanRef v11 = [(HIDBluetoothDevice *)&v23 desiredConnectionParameters];
    [v11 setPreferredPeripheralLatency:-[HIDAppleSiriRemoteDevice latency](self, "latency")];
    [v11 setMaxPeripheralLatency:-[HIDAppleSiriRemoteDevice latency](self, "latency")];
    [v11 setMinCELength:6];
    [v11 setMaxDeferment:1];
    LODWORD(v12) = 15.0;
    [v11 setMinInterval:v12];
    LODWORD(v13) = 15.0;
    [v11 setPreferredInterval:v13];
    unsigned int v14 = [(HIDAppleSiriRemoteDevice *)self latency];
    if (v14)
    {
      if (v14 == 199)
      {
        float v15 = (float)(int)([v11 preferredPeripheralLatency] + 1);
        [v11 preferredInterval];
        float v17 = (float)((float)(v16 * v15) * 4.0) + 1.0;
      }
      else
      {
        [v11 preferredInterval];
        float v17 = (float)(v19 * 5.0) * (float)(int)([v11 preferredPeripheralLatency] + 1);
      }
      uint64_t v18 = (int)v17;
    }
    else
    {
      uint64_t v18 = 2000;
    }
    [v11 setTimeout:v18];
    long long v20 = +[NSUserDefaults standardUserDefaults];
    v21 = [v20 objectForKey:@"ConnectionTimeout"];

    if (v21) {
      [v11 setTimeout:[v20 integerForKey:@"ConnectionTimeout"]];
    }
  }
  else
  {
    CFBooleanRef v11 = 0;
  }

  return v11;
}

- (void)setSleepPeripheralLatency
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006CFF4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  CFBooleanRef v11 = [(HIDAppleSiriRemoteDevice *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C240;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(v11, block);
}

- (void)setNormalPeripheralLatency
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006D06C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  CFBooleanRef v11 = [(HIDAppleSiriRemoteDevice *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C3A0;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(v11, block);
}

- (void)setZeroPeripheralLatency
{
  uint64_t v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006D0E4(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  CFBooleanRef v11 = [(HIDAppleSiriRemoteDevice *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C56C;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async(v11, block);
}

- (void)sendButtonDataToUserDevice:(unsigned __int16)a3 withTimestamp:(unint64_t)a4
{
  uint64_t v5 = a3;
  if ([(HIDAppleSiriRemoteDevice *)self firstButton] && byte_1000CD170)
  {
    [(HIDAppleSiriRemoteDevice *)self instanceID];
    kdebug_trace();
  }
  if ([(HIDBluetoothDevice *)self state] < 3
    || (unsigned int v7 = [(HIDBluetoothDevice *)self state], !v5) && v7 == 3)
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedShort:v5];
    uint64_t v9 = +[SLGLog sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000C7C4;
    v17[3] = &unk_1000B12B8;
    id v18 = v8;
    id v10 = v8;
    [v9 logBlock:v17];

    if ([(HIDAppleSiriRemoteDevice *)self productID] == 788
      || [(HIDAppleSiriRemoteDevice *)self productID] == 789)
    {
      uint8_t report = -5;
      *(_WORD *)report_1 = v5;
      CFBooleanRef v11 = [(HIDAppleSiriRemoteDevice *)self buttons];
      double v12 = v11;
      uint64_t v13 = a4;
      CFIndex v14 = 3;
    }
    else
    {
      uint8_t report = -6;
      report_1[0] = v5;
      CFBooleanRef v11 = [(HIDAppleSiriRemoteDevice *)self buttons];
      double v12 = v11;
      uint64_t v13 = a4;
      CFIndex v14 = 2;
    }
    IOHIDUserDeviceHandleReportWithTimeStamp(v11, v13, &report, v14);
  }
  if ([(HIDAppleSiriRemoteDevice *)self firstButton])
  {
    if (byte_1000CD170)
    {
      [(HIDAppleSiriRemoteDevice *)self instanceID];
      kdebug_trace();
    }
    [(HIDAppleSiriRemoteDevice *)self setFirstButton:0];
  }
}

- (void)handleButtonData
{
  uint64_t v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006D15C(v3, self);
  }
  uint64_t v4 = [(HIDAppleSiriRemoteDevice *)self cachedButtonsAndTimestamps];

  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(HIDAppleSiriRemoteDevice *)v5 cachedButtonsAndTimestamps];

    if (v6)
    {
      unsigned int v7 = (id)qword_1000CD178;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v14 = [(HIDAppleSiriRemoteDevice *)v5 buttonData];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cache button 0x%04X", buf, 8u);
      }

      uint64_t v8 = [(HIDAppleSiriRemoteDevice *)v5 cachedButtonsAndTimestamps];
      uint64_t v9 = +[NSNumber numberWithUnsignedShort:[(HIDAppleSiriRemoteDevice *)v5 buttonData]];
      id v10 = +[NSNumber numberWithUnsignedLongLong:[(HIDAppleSiriRemoteDevice *)v5 inputReportTimestamp]];
      v12[1] = v10;
      CFBooleanRef v11 = +[NSArray arrayWithObjects:v12 count:2];
      [v8 addObject:v11];
    }
    else
    {
      [(HIDAppleSiriRemoteDevice *)v5 sendButtonDataToUserDevice:[(HIDAppleSiriRemoteDevice *)v5 buttonData] withTimestamp:[(HIDAppleSiriRemoteDevice *)v5 inputReportTimestamp]];
    }
    objc_sync_exit(v5);
  }
  else
  {
    [(HIDAppleSiriRemoteDevice *)self sendButtonDataToUserDevice:[(HIDAppleSiriRemoteDevice *)self buttonData] withTimestamp:[(HIDAppleSiriRemoteDevice *)self inputReportTimestamp]];
  }
}

- (void)handleProximityData
{
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    uint64_t v3 = [(HIDAppleSiriRemoteDevice *)self groupProximity];
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v4 = +[NSNumber numberWithUnsignedChar:[(HIDAppleSiriRemoteDevice *)self proximityData]];
    uint64_t v5 = +[SLGLog sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000CBB8;
    v9[3] = &unk_1000B12B8;
    id v10 = v4;
    id v6 = v4;
    [v5 logBlock:v9];

    report[0] = 1;
    report[1] = [(HIDAppleSiriRemoteDevice *)self proximityData];
    unsigned int v7 = [(HIDAppleSiriRemoteDevice *)self proximity];
    IOHIDUserDeviceHandleReportWithTimeStamp(v7, [(HIDAppleSiriRemoteDevice *)self inputReportTimestamp], report, 2);
  }
}

- (void)handleTouchData
{
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    id v3 = [(HIDAppleSiriRemoteDevice *)self touchData];
    uint64_t v4 = (const uint8_t *)[v3 bytes];

    int v5 = *v4;
    if (v5 == 96 && byte_1000CD170 != 0)
    {
      [(HIDAppleSiriRemoteDevice *)self instanceID];
      kdebug_trace();
    }
    unsigned int v7 = [(HIDAppleSiriRemoteDevice *)self groupTouch];
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v8 = [(HIDAppleSiriRemoteDevice *)self touch];
    uint64_t v9 = [(HIDAppleSiriRemoteDevice *)self inputReportTimestamp];
    id v10 = [(HIDAppleSiriRemoteDevice *)self touchData];
    IOHIDUserDeviceHandleReportWithTimeStamp(v8, v9, v4, (CFIndex)[v10 length]);

    if (v5 == 96 && byte_1000CD170)
    {
      [(HIDAppleSiriRemoteDevice *)self instanceID];
      kdebug_trace();
    }
    [(HIDAppleSiriRemoteDevice *)self logTouchData];
  }
}

- (void)logTouchData
{
  id v3 = [(HIDAppleSiriRemoteDevice *)self touchData];
  uint64_t v4 = (unsigned __int8 *)[v3 bytes];

  int v5 = [(HIDAppleSiriRemoteDevice *)self touchData];
  if ([v5 length] == (id)12)
  {

    goto LABEL_4;
  }
  id v6 = [(HIDAppleSiriRemoteDevice *)self touchData];
  id v7 = [v6 length];

  if (v7 == (id)19)
  {
LABEL_4:
    unsigned __int8 v8 = v4[11];
    uint64_t v9 = [(HIDAppleSiriRemoteDevice *)self touchData];
    if ([v9 length] == (id)19) {
      int v64 = v4[18] & 7;
    }
    else {
      int v64 = 0;
    }

    if ((v4[11] & 8) != 0) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = 2;
    }
    CFBooleanRef v11 = [(HIDAppleSiriRemoteDevice *)self touchData];
    if ([v11 length] == (id)19)
    {
      if ((v4[18] & 8) != 0) {
        char v12 = 1;
      }
      else {
        char v12 = 2;
      }
      unsigned __int8 v61 = v12;
    }
    else
    {
      unsigned __int8 v61 = 0;
    }

    unsigned int v13 = v4[2];
    int v14 = v4[3];
    unint64_t v15 = [(HIDAppleSiriRemoteDevice *)self inputReportTimestamp];
    uint64_t v16 = qword_1000CD010;
    float v17 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
    int v18 = v8 & 7;
    uint64_t v19 = (v13 >> 1) | (v14 << 7);
    if ([v17 count])
    {
    }
    else
    {

      unint64_t v20 = 0;
      unsigned int v66 = 0;
      if (v18 == 3 || v64 == 3) {
        goto LABEL_22;
      }
    }
    unint64_t v20 = v15 - v16;
    unsigned int v66 = v19 - dword_1000CD018;
    if (v19 < dword_1000CD018) {
      unsigned int v66 = (v19 | 0x8000) - dword_1000CD018;
    }
LABEL_22:
    unint64_t v63 = v20;
    int v65 = v8 & 7;
    unsigned int v21 = dword_1000CD008;
    if (!dword_1000CD008)
    {
      mach_timebase_info((mach_timebase_info_t)&dword_1000CD004);
      unsigned int v21 = dword_1000CD008;
    }
    uint64_t v62 = dword_1000CD004;
    dword_1000CD018 = v19;
    qword_1000CD010 = [(HIDAppleSiriRemoteDevice *)self inputReportTimestamp];
    if (v18 == 4) {
      goto LABEL_36;
    }
    if (v18 == 3)
    {
      unsigned int v22 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
      objc_super v23 = +[NSNumber numberWithUnsignedChar:v10];
      unsigned int v24 = [v22 containsObject:v23];

      if (v24)
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006D268();
        }
        goto LABEL_36;
      }
      dispatch_group_t v34 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
      v35 = +[NSNumber numberWithUnsignedChar:v10];
      [v34 addObject:v35];
    }
    else
    {
      dispatch_group_t v34 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
      v35 = +[NSNumber numberWithUnsignedChar:v10];
      [v34 removeObject:v35];
    }

LABEL_36:
    objc_super v36 = [(HIDAppleSiriRemoteDevice *)self touchData];
    BOOL v37 = [v36 length] == (id)19;

    if (v37 && v64 != 4)
    {
      if (v64 == 3)
      {
        dispatch_group_t v38 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
        v39 = +[NSNumber numberWithUnsignedChar:v61];
        unsigned int v40 = [v38 containsObject:v39];

        if (v40)
        {
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_10006D268();
          }
        }
        else
        {
          v43 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
          dispatch_group_t v44 = +[NSNumber numberWithUnsignedChar:v61];
          [v43 addObject:v44];
        }
      }
      else
      {
        v41 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
        dispatch_group_t v42 = +[NSNumber numberWithUnsignedChar:v61];
        [v41 removeObject:v42];
      }
    }
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = sub_10000D6E0;
    v73 = sub_10000D6F0;
    id v74 = 0;
    v77[0] = @"touch";
    v45 = [(HIDAppleSiriRemoteDevice *)self touchData];
    BOOL v46 = [v45 description];
    v78[0] = v46;
    v77[1] = @"fwTimestampMs";
    dispatch_semaphore_t v47 = +[NSNumber numberWithUnsignedInt:v19];
    v78[1] = v47;
    v77[2] = @"fwTimestampDeltaMs";
    v48 = +[NSNumber numberWithUnsignedInt:v66];
    unint64_t v49 = v63 * v62 / v21;
    v78[2] = v48;
    v77[3] = @"inputReportDeltaMs";
    v50 = +[NSNumber numberWithUnsignedLongLong:v49 / 0xF4240];
    v78[3] = v50;
    v77[4] = @"numTouches";
    dispatch_semaphore_t v51 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
    v52 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v51 count]);
    v78[4] = v52;
    id v74 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:5];

    v53 = +[SLGLog sharedInstance];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10000D708;
    v67[3] = &unk_1000B12E0;
    v67[4] = &v69;
    [v53 logBlock:v67];

    v54 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
    BOOL v55 = [v54 count] == 0;

    if (!v55)
    {
      if (15 * (((double)v66 + 7.5) / 0xF) < 0x10)
      {
        BOOL v58 = v64 == 3 || v65 == 3 || v49 >= 0x989680;
        if (!v58 || v49 >= 0x1406F40)
        {
          objc_super v59 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v60 = v70[5];
            *(_DWORD *)buf = 138412290;
            uint64_t v76 = v60;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Delayed multitouch data: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        v56 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006D1E8((uint64_t)&v70, v56);
        }
      }
    }
    _Block_object_dispose(&v69, 8);

    return;
  }
  id v25 = objc_alloc((Class)NSMutableString);
  v26 = [(HIDAppleSiriRemoteDevice *)self touchData];
  id v27 = [v25 initWithFormat:@"{length = %lu, bytes = 0x", [v26 length]];

  id v28 = [(HIDAppleSiriRemoteDevice *)self touchData];
  id v29 = [v28 length];

  if (v29)
  {
    unint64_t v30 = 0;
    do
    {
      [v27 appendFormat:@"%02x", v4[v30]];
      v31 = [(HIDAppleSiriRemoteDevice *)self touchData];
      ++v30;
      id v32 = [v31 length];
    }
    while (v30 < (unint64_t)v32);
  }
  [v27 appendString:@"}"];
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = sub_10000D6E0;
  v73 = sub_10000D6F0;
  id v74 = 0;
  CFStringRef v79 = @"touch";
  id v80 = v27;
  id v74 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v33 = +[SLGLog sharedInstance];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10000D6F8;
  v68[3] = &unk_1000B12E0;
  v68[4] = &v69;
  [v33 logBlock:v68];

  _Block_object_dispose(&v69, 8);
}

- (void)handleInertialData
{
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    id v3 = [(HIDAppleSiriRemoteDevice *)self groupInertial];
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v4 = [(HIDAppleSiriRemoteDevice *)self inertial];

    if (v4)
    {
      int v5 = [(HIDAppleSiriRemoteDevice *)self inertialData];
      id v6 = [v5 description];

      id v7 = +[SLGLog sharedInstance];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000D89C;
      v14[3] = &unk_1000B12B8;
      id v15 = v6;
      id v8 = v6;
      [v7 logBlock:v14];

      uint64_t v9 = [(HIDAppleSiriRemoteDevice *)self inertial];
      uint64_t v10 = [(HIDAppleSiriRemoteDevice *)self inputReportTimestamp];
      id v11 = [(HIDAppleSiriRemoteDevice *)self inertialData];
      char v12 = (const uint8_t *)[v11 bytes];
      unsigned int v13 = [(HIDAppleSiriRemoteDevice *)self inertialData];
      IOHIDUserDeviceHandleReportWithTimeStamp(v9, v10, v12, (CFIndex)[v13 length]);
    }
  }
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  if ([(HIDBluetoothDevice *)self state] > 2) {
    return;
  }
  id v7 = [(HIDAppleSiriRemoteDevice *)self doapAudioRelay];

  if (!v7) {
    return;
  }
  unsigned int v8 = [(HIDAppleSiriRemoteDevice *)self productID];
  if (v8 - 788 >= 2)
  {
    if (v8 == 621 && !a4) {
      goto LABEL_14;
    }
  }
  else if (a3 && a4 >= 5 && !a3[4])
  {
LABEL_14:
    uint64_t v16 = +[SLGLog sharedInstance];
    [v16 logBlock:&stru_1000B1320];

    char v12 = self;
    objc_sync_enter(v12);
    float v17 = [(HIDAppleSiriRemoteDevice *)v12 doapAudioStop];

    if (v17)
    {
      int v18 = [(HIDAppleSiriRemoteDevice *)v12 doapAudioStop];
      dispatch_semaphore_signal(v18);
    }
    uint64_t v19 = [(HIDAppleSiriRemoteDevice *)v12 audioBuffer];
    [v19 removeAllObjects];

    objc_sync_exit(v12);
    goto LABEL_19;
  }
  if (a3 && a4 >= 1)
  {
    uint64_t v9 = +[NSDate date];
    [(HIDAppleSiriRemoteDevice *)self setLastAudioDate:v9];

    uint64_t v10 = +[NSData dataWithBytes:a3 length:a4];
    id v11 = +[SLGLog sharedInstance];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000DBC8;
    v22[3] = &unk_1000B12B8;
    char v12 = v10;
    objc_super v23 = v12;
    [v11 logBlock:v22];

    unsigned int v13 = self;
    objc_sync_enter(v13);
    int v14 = [(HIDAppleSiriRemoteDevice *)v13 audioBuffer];

    if (v14)
    {
      id v15 = [(HIDAppleSiriRemoteDevice *)v13 audioBuffer];
      [v15 addObject:v12];
    }
    else
    {
      id v15 = [(HIDAppleSiriRemoteDevice *)v13 doapAudioRelay];
      [v15 sendAudioFrame:v12];
    }

    objc_sync_exit(v13);
LABEL_19:
  }
  unsigned int v20 = [(HIDAppleSiriRemoteDevice *)self productID];
  if (v20 == 621 || v20 == 614)
  {
    unsigned int v21 = [(HIDAppleSiriRemoteDevice *)self pathIDs];
    [v21 removeAllObjects];
  }
}

- (void)handleDeviceManagementData:(char *)a3 dataLength:(int64_t)a4
{
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    id v7 = [(HIDAppleSiriRemoteDevice *)self groupDeviceManagement];
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    device = [(HIDAppleSiriRemoteDevice *)self deviceManagement];
    uint64_t v8 = mach_absolute_time();
    IOHIDUserDeviceHandleReportWithTimeStamp(device, v8, (const uint8_t *)a3, a4);
  }
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  [(HIDAppleSiriRemoteDevice *)self setInputReportTimestamp:a5];
  unsigned int v9 = [(HIDAppleSiriRemoteDevice *)self productID];
  if (v9 - 788 < 2)
  {
    [(HIDAppleSiriRemoteDevice *)self handleInputReportDataV2:v8 reportID:v6];
  }
  else if (v9 == 621 || v9 == 614)
  {
    [(HIDAppleSiriRemoteDevice *)self handleInputReportDataV1:v8 reportID:v6];
  }
  else
  {
    uint64_t v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D2D0(v10, self);
    }
  }
}

- (void)handleInputReportDataV1:(id)a3 reportID:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = (char *)[v6 length];
  id v8 = v7 + 1;
  unsigned int v9 = (char *)&v12 - ((unint64_t)(v7 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, (size_t)(v7 + 1));
  *unsigned int v9 = v4;
  [v6 getBytes:v9 + 1 length:[v6 length]];

  switch(v4)
  {
    case 96:
      uint64_t v10 = [(HIDAppleSiriRemoteDevice *)self touchData];
      [v10 setLength:0];

      id v11 = [(HIDAppleSiriRemoteDevice *)self touchData];
      [v11 appendBytes:v9 length:v8];

      [(HIDAppleSiriRemoteDevice *)self handleTouchData];
      break;
    case 224:
      [(HIDAppleSiriRemoteDevice *)self handleDeviceManagementData:v9 dataLength:v8];
      break;
    case 252:
      [(HIDAppleSiriRemoteDevice *)self demultiplexInputReport:v9 reportLength:v8 reportID:252];
      break;
    default:
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006D368();
      }
      break;
  }
}

- (void)handleInputReportDataV2:(id)a3 reportID:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = v6;
  switch(v4)
  {
    case 250:
      id v8 = [v6 length];
      __chkstk_darwin();
      uint64_t v10 = &v22[-v9];
      bzero(&v22[-v9], (size_t)v8);
      [v7 getBytes:v10 length:v8];
      [(HIDAppleSiriRemoteDevice *)self handleAudioData:v10 dataLength:v8];
      break;
    case 251:
      unsigned __int16 v24 = 0;
      [v6 getBytes:&v24 length:2];
      [(HIDAppleSiriRemoteDevice *)self setButtonData:v24];
      [(HIDAppleSiriRemoteDevice *)self handleButtonData];
      break;
    case 252:
      uint64_t v16 = [(HIDAppleSiriRemoteDevice *)self touchData];
      [v16 setLength:0];

      char v23 = -5;
      float v17 = [(HIDAppleSiriRemoteDevice *)self touchData];
      [v17 appendBytes:&v23 length:1];

      int v18 = [(HIDAppleSiriRemoteDevice *)self touchData];
      [v18 appendData:v7];

      [(HIDAppleSiriRemoteDevice *)self handleTouchData];
      break;
    case 253:
      if ([v6 length] == (id)1)
      {
        [v7 getBytes:&self->_proximityData length:1];
        [(HIDAppleSiriRemoteDevice *)self handleProximityData];
      }
      break;
    case 254:
      uint64_t v19 = (char *)[v6 length] + 1;
      __chkstk_darwin();
      unsigned int v21 = &v22[-v20];
      bzero(&v22[-v20], (size_t)v19);
      unsigned char *v21 = -32;
      [v7 getBytes:v21 + 1 length:[v7 length]];
      [(HIDAppleSiriRemoteDevice *)self handleDeviceManagementData:v21 dataLength:v19];
      break;
    default:
      if (v4 == 96)
      {
        id v11 = (char *)[v6 length] + 1;
        __chkstk_darwin();
        unsigned int v13 = &v22[-v12];
        bzero(&v22[-v12], (size_t)v11);
        unsigned char *v13 = 96;
        [v7 getBytes:v13 + 1 length:[v7 length]];
        int v14 = [(HIDAppleSiriRemoteDevice *)self touchData];
        [v14 setLength:0];

        id v15 = [(HIDAppleSiriRemoteDevice *)self touchData];
        [v15 appendBytes:v13 length:v11];

        [(HIDAppleSiriRemoteDevice *)self handleTouchData];
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_10006D368();
      }
      break;
  }
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7
{
  return [(HIDAppleSiriRemoteDevice *)self setReport:a3 reportLength:a4 reportID:*(void *)&a5 reportType:*(void *)&a6 keyholeID:a7 error:0];
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9 = a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v15 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    id v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
    __int16 v28 = 1024;
    int v29 = v9;
    __int16 v30 = 1024;
    int v31 = v11;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld", buf, 0x28u);
  }
  int v16 = -536870206;
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    BOOL v17 = a4 > 0 && a3 == 0;
    if (!v17 && v11 <= 0xFF)
    {
      if (v9 == 241 && [(HIDAppleSiriRemoteDevice *)self latency] == 199)
      {
        int v16 = -536870173;
      }
      else
      {
        int v18 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
        if (byte_1000CD170)
        {
          [(HIDAppleSiriRemoteDevice *)self instanceID];
          kdebug_trace();
        }
        int v16 = [(HIDBluetoothDevice *)self setReportData:v18 reportID:v9 reportType:v10 error:a8];
        if (byte_1000CD170)
        {
          [(HIDAppleSiriRemoteDevice *)self instanceID];
          kdebug_trace();
        }

        if (!v16)
        {
          unsigned int v22 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            id v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
            __int16 v28 = 1024;
            int v29 = v9;
            __int16 v30 = 1024;
            int v31 = v11;
            __int16 v32 = 1024;
            int v33 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s keyholeID 0x%02x reportID 0x%02x reportType %d success", buf, 0x1Eu);
          }
          return 0;
        }
      }
    }
  }
  else
  {
    int v16 = -536870185;
  }
  uint64_t v19 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316418;
    id v27 = "-[HIDAppleSiriRemoteDevice setReport:reportLength:reportID:reportType:keyholeID:error:]";
    __int16 v28 = 1024;
    int v29 = v9;
    __int16 v30 = 1024;
    int v31 = v11;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    __int16 v36 = 1024;
    int v37 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld failure 0x%08X", buf, 0x2Eu);
    if (!a8) {
      return v16;
    }
  }
  else if (!a8)
  {
    return v16;
  }
  if (!*a8)
  {
    uint64_t v20 = +[NSString stringWithFormat:@"keyholeID 0x%02x reportID 0x%02x reportType %d reportLength %ld", v9, v11, v10, a4];
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    id v25 = v20;
    unsigned int v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a8 = +[NSError errorWithDomain:NSMachErrorDomain code:v16 userInfo:v21];
  }
  return v16;
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6 keyholeID:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  unsigned int v13 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      int64_t v15 = *a4;
    }
    else {
      int64_t v15 = 0;
    }
    *(_DWORD *)buf = 136316162;
    v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
    __int16 v51 = 1024;
    int v52 = v7;
    __int16 v53 = 1024;
    int v54 = v9;
    __int16 v55 = 1024;
    int v56 = v8;
    __int16 v57 = 2048;
    int64_t v58 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s keyholeID 0x%02x reportID 0x%02x reportType %d length %ld", buf, 0x28u);
  }
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    int v14 = -536870206;
    if (a3 && a4)
    {
      if (*a4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v14 = -536870168;
      }
      else if (*a4 < 1)
      {
        int v14 = -536870169;
      }
      else if (v7 == 241 && [(HIDAppleSiriRemoteDevice *)self latency] == 199)
      {
        int v14 = -536870173;
      }
      else
      {
        if (byte_1000CD170)
        {
          [(HIDAppleSiriRemoteDevice *)self instanceID];
          kdebug_trace();
        }
        v48[0] = -16;
        v48[1] = v9;
        int v16 = +[NSData dataWithBytesNoCopy:v48 length:2 freeWhenDone:0];
        BOOL v17 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
        {
          int64_t v43 = *a4;
          *(_DWORD *)buf = 136316162;
          v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
          __int16 v51 = 1024;
          int v52 = v7;
          __int16 v53 = 1024;
          int v54 = v9;
          __int16 v55 = 1024;
          int v56 = v8;
          __int16 v57 = 2048;
          int64_t v58 = v43;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s PART 1 SET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld", buf, 0x28u);
        }
        int v14 = [(HIDBluetoothDevice *)self setReportData:v16 reportID:240 reportType:v8 error:0];
        if (byte_1000CD170)
        {
          [(HIDAppleSiriRemoteDevice *)self instanceID];
          kdebug_trace();
        }
        int v18 = qword_1000CD178;
        if (v14)
        {
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            int64_t v19 = *a4;
            *(_DWORD *)buf = 136316418;
            v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
            __int16 v51 = 1024;
            int v52 = v7;
            __int16 v53 = 1024;
            int v54 = v9;
            __int16 v55 = 1024;
            int v56 = v8;
            __int16 v57 = 2048;
            int64_t v58 = v19;
            __int16 v59 = 1024;
            int v60 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s PART 1 SET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld failure 0x%08X", buf, 0x2Eu);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
            sub_10006D4C4(v18, v20, v21, v22, v23, v24, v25, v26);
          }
          if (byte_1000CD170)
          {
            [(HIDAppleSiriRemoteDevice *)self instanceID];
            kdebug_trace();
          }
          id v27 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
          {
            int64_t v44 = *a4;
            *(_DWORD *)buf = 136316162;
            v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
            __int16 v51 = 1024;
            int v52 = v7;
            __int16 v53 = 1024;
            int v54 = v9;
            __int16 v55 = 1024;
            int v56 = v8;
            __int16 v57 = 2048;
            int64_t v58 = v44;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s PART 2 GET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld", buf, 0x28u);
          }
          id v47 = 0;
          int v14 = [(HIDBluetoothDevice *)self getReportData:&v47 reportID:v7 reportType:v8 error:0];
          id v46 = v47;
          if (byte_1000CD170)
          {
            [(HIDAppleSiriRemoteDevice *)self instanceID];
            kdebug_trace();
          }
          __int16 v28 = qword_1000CD178;
          if (v14)
          {
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
            {
              int64_t v45 = *a4;
              *(_DWORD *)buf = 136316418;
              v50 = "-[HIDAppleSiriRemoteDevice getReport:reportLength:reportID:reportType:keyholeID:]";
              __int16 v51 = 1024;
              int v52 = v7;
              __int16 v53 = 1024;
              int v54 = v9;
              __int16 v55 = 1024;
              int v56 = v8;
              __int16 v57 = 2048;
              int64_t v58 = v45;
              __int16 v59 = 1024;
              int v60 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s PART 2 GET keyholeID 0x%02x reportID 0x%02x reportType %d length %ld failure 0x%08X", buf, 0x2Eu);
            }
            int v29 = v46;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              sub_10006D44C(v28, v30, v31, v32, v33, v34, v35, v36);
            }
            int v29 = v46;
            [v46 getBytes:a3 length:*a4];
            if (*a3 == v9)
            {
              unint64_t v37 = *a4;
              id v38 = [v46 length];
              int v14 = 0;
              if (v37 >= (unint64_t)v38) {
                int64_t v39 = (int64_t)v38;
              }
              else {
                int64_t v39 = v37;
              }
              *a4 = v39;
            }
            else
            {
              unsigned int v40 = qword_1000CD178;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
                sub_10006D3D0((uint64_t)a3, v9, v40);
              }
              int v14 = -536870160;
            }
          }
        }
      }
    }
  }
  else
  {
    int v14 = -536870185;
  }
  if (v9 == 219 && v7 == 241)
  {
    v41 = [(HIDAppleSiriRemoteDevice *)self gotDeviceExtendedInfoReport];
    dispatch_semaphore_signal(v41);

    if (byte_1000CD170)
    {
      [(HIDAppleSiriRemoteDevice *)self instanceID];
      kdebug_trace();
    }
  }
  return v14;
}

- (void)extractButtonDataFromReport:(char *)a3 buttonIndex:(unsigned __int8)a4
{
  [(HIDAppleSiriRemoteDevice *)self setButtonData:a3[a4] & 0xBF];

  [(HIDAppleSiriRemoteDevice *)self handleButtonData];
}

- (void)demultiplexInputReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5
{
  [(HIDAppleSiriRemoteDevice *)self setButtonData:0];
  uint64_t v8 = [(HIDAppleSiriRemoteDevice *)self touchData];
  [v8 setLength:0];

  uint64_t v9 = [(HIDAppleSiriRemoteDevice *)self inertialData];
  [v9 setLength:0];

  if (a3)
  {
    unsigned int v10 = a3[1];
    switch(v10 >> 5)
    {
      case 0u:
        goto LABEL_4;
      case 1u:
        [(HIDAppleSiriRemoteDevice *)self setProximityData:(a3[2] >> 6) & 1];
        [(HIDAppleSiriRemoteDevice *)self handleProximityData];
LABEL_4:
        int v11 = (v10 >> 2) & 3;
        [(HIDAppleSiriRemoteDevice *)self extractButtonDataFromReport:a3 buttonIndex:2];
        if ((v10 & 0x10) != 0 && v11)
        {
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_10006D53C();
          }
        }
        else
        {
          char v28 = -5;
          char v27 = 1;
          char v26 = 2;
          int64_t v13 = 3;
          switch(v10 & 3)
          {
            case 1u:
              int v14 = [(HIDAppleSiriRemoteDevice *)self touchData];
              [v14 appendBytes:&v28 length:1];

              int64_t v15 = [(HIDAppleSiriRemoteDevice *)self touchData];
              [v15 appendBytes:a3 + 3 length:11];
              int64_t v13 = 14;
              goto LABEL_23;
            case 2u:
              int v16 = [(HIDAppleSiriRemoteDevice *)self touchData];
              [v16 appendBytes:&v28 length:1];

              int64_t v15 = [(HIDAppleSiriRemoteDevice *)self touchData];
              [v15 appendBytes:a3 + 3 length:18];
              int64_t v13 = 21;
LABEL_23:

              [(HIDAppleSiriRemoteDevice *)self handleTouchData];
              goto LABEL_24;
            case 3u:
              uint64_t v21 = [(HIDAppleSiriRemoteDevice *)self touchData];
              [v21 appendBytes:&v28 length:1];

              uint64_t v22 = [(HIDAppleSiriRemoteDevice *)self touchData];
              [v22 appendBytes:a3 + 3 length:a4 - 3];

              [(HIDAppleSiriRemoteDevice *)self handleTouchData];
              return;
            default:
LABEL_24:
              if ((v10 & 0x10) != 0)
              {
                [(HIDAppleSiriRemoteDevice *)self handleAudioData:&a3[v13] dataLength:a4 - v13];
                int64_t v13 = a4;
              }
              if ((v11 - 2) >= 2)
              {
                if (!v11) {
                  return;
                }
                BOOL v17 = [(HIDAppleSiriRemoteDevice *)self inertialData];
                int v18 = v17;
                int64_t v19 = &v27;
              }
              else
              {
                BOOL v17 = [(HIDAppleSiriRemoteDevice *)self inertialData];
                int v18 = v17;
                int64_t v19 = &v26;
              }
              [v17 appendBytes:v19 length:1];

              uint64_t v20 = [(HIDAppleSiriRemoteDevice *)self inertialData];
              [v20 appendBytes:&a3[v13] length:a4 - v13];

              [(HIDAppleSiriRemoteDevice *)self handleInertialData];
              break;
          }
        }
        return;
      case 6u:
        if (a4 < 3) {
          return;
        }
        id v23 = +[NSData dataWithBytes:a3 + 2 length:a4 - 2];
        -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:](self, "handleInputReportDataV1:reportID:", v23, 224, v23);
        goto LABEL_19;
      case 7u:
        if (a4 == 5)
        {
          if ([(HIDAppleSiriRemoteDevice *)self productID] != 621) {
            return;
          }
          [(HIDAppleSiriRemoteDevice *)self extractButtonDataFromReport:a3 buttonIndex:2];
          uint64_t v12 = a3 + 4;
        }
        else
        {
          if (a4 != 4 || [(HIDAppleSiriRemoteDevice *)self productID] != 614) {
            return;
          }
          [(HIDAppleSiriRemoteDevice *)self extractButtonDataFromReport:a3 buttonIndex:2];
          uint64_t v12 = a3 + 3;
        }
        id v25 = +[NSData dataWithBytes:v12 length:1];
        -[HIDAppleSiriRemoteDevice handleInputReportDataV1:reportID:](self, "handleInputReportDataV1:reportID:", v25, 96, v25);
LABEL_19:

        break;
      default:
        return;
    }
  }
}

- (void)logHwFwVersions
{
  if ([(HIDBluetoothDevice *)self state] <= 2)
  {
    id location = 0;
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    int v4 = [(HIDAppleSiriRemoteDevice *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F198;
    block[3] = &unk_1000B1240;
    objc_copyWeak(&v6, &location);
    block[4] = self;
    dispatch_after(v3, v4, block);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)doapAudioWillStart:(id)a3
{
  id v4 = a3;
  if ([(HIDBluetoothDevice *)self state] < 3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v8 = [(HIDAppleSiriRemoteDevice *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F50C;
    v9[3] = &unk_1000B1348;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    int v5 = +[NSString stringWithFormat:@"Apple Siri Remote stopped (disconnected)"];
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    int v14 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v7 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870185 userInfo:v6];

    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(HIDBluetoothDevice *)self state] >= 3)
  {
    int v5 = +[NSString stringWithFormat:@"Apple Siri Remote stopped (disconnected)"];
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    int64_t v45 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v7 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870185 userInfo:v6];

    v4[2](v4, v7);
    uint64_t v8 = [(HIDAppleSiriRemoteDevice *)self doapAudioStart];
    dispatch_semaphore_signal(v8);

    goto LABEL_18;
  }
  uint64_t v9 = [(HIDAppleSiriRemoteDevice *)self lastAudioDate];
  [v9 timeIntervalSinceNow];
  double v11 = fabs(v10);

  if (v11 >= 0.105)
  {
    id v25 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      char v26 = v25;
      char v27 = [(HIDAppleSiriRemoteDevice *)self lastAudioDate];
      [v27 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = fabs(v28) * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Have not received audio data for %f ms. Stop Siri session.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v12 = [(HIDAppleSiriRemoteDevice *)self doapAudioStop];

  if (v12)
  {
    NSErrorUserInfoKey v13 = [(HIDAppleSiriRemoteDevice *)self lastAudioDate];
    [v13 timeIntervalSinceNow];
    double v15 = v14;

    int v16 = [(HIDAppleSiriRemoteDevice *)self doapAudioStop];
    dispatch_time_t v17 = dispatch_time(0, 1000000 * vcvtpd_s64_f64((v15 + 0.105) * 1000.0));
    intptr_t v18 = dispatch_semaphore_wait(v16, v17);

    int64_t v19 = qword_1000CD178;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        uint64_t v21 = v19;
        uint64_t v22 = [(HIDAppleSiriRemoteDevice *)self lastAudioDate];
        [v22 timeIntervalSinceNow];
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = fabs(v23) * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received Siri audio data %f ms ago.", buf, 0xCu);
      }
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      id v24 = [(HIDAppleSiriRemoteDevice *)self queue];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10000FFF0;
      v38[3] = &unk_1000B1348;
      objc_copyWeak(&v40, (id *)buf);
      int64_t v39 = v4;
      dispatch_async(v24, v38);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
      goto LABEL_18;
    }
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received empty audio input report. Stop Siri session.", buf, 2u);
    }
LABEL_17:
    v4[2](v4, 0);
    uint64_t v35 = self;
    objc_sync_enter(v35);
    [(HIDAppleSiriRemoteDevice *)v35 setDoapAudioStop:0];
    id v36 = objc_alloc_init((Class)NSMutableArray);
    [(HIDAppleSiriRemoteDevice *)v35 setAudioBuffer:v36];

    objc_sync_exit(v35);
    unint64_t v37 = [(HIDAppleSiriRemoteDevice *)v35 doapAudioStart];
    dispatch_semaphore_signal(v37);

    goto LABEL_18;
  }
  int v29 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006D6AC(v29);
  }
  NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
  CFStringRef v42 = @"No doapAudioStop semaphore";
  uint64_t v30 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  uint64_t v31 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870165 userInfo:v30];

  v4[2](v4, v31);
  uint64_t v32 = [(HIDAppleSiriRemoteDevice *)self doapAudioStart];
  dispatch_semaphore_signal(v32);

  uint64_t v33 = self;
  objc_sync_enter(v33);
  id v34 = objc_alloc_init((Class)NSMutableArray);
  [(HIDAppleSiriRemoteDevice *)v33 setAudioBuffer:v34];

  objc_sync_exit(v33);
LABEL_18:
}

- (void)doapAudioDidStop:(id)a3
{
  id v4 = a3;
  if ([(HIDBluetoothDevice *)self state] < 3)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v9 = [(HIDAppleSiriRemoteDevice *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010240;
    v10[3] = &unk_1000B1348;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    int v5 = +[NSString stringWithFormat:@"Apple Siri Remote stopped (disconnected)"];
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    double v15 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v7 = +[NSError errorWithDomain:NSMachErrorDomain code:-536870185 userInfo:v6];

    (*((void (**)(id, void *))v4 + 2))(v4, v7);
    uint64_t v8 = [(HIDAppleSiriRemoteDevice *)self doapAudioStart];
    dispatch_semaphore_signal(v8);
  }
}

- (int)latency
{
  return self->_latency;
}

- (void)setLatency:(int)a3
{
  self->_latency = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSMutableArray)cachedButtonsAndTimestamps
{
  return self->_cachedButtonsAndTimestamps;
}

- (void)setCachedButtonsAndTimestamps:(id)a3
{
}

- (unsigned)buttonData
{
  return self->_buttonData;
}

- (void)setButtonData:(unsigned __int16)a3
{
  self->_buttonData = a3;
}

- (unsigned)proximityData
{
  return self->_proximityData;
}

- (void)setProximityData:(unsigned __int8)a3
{
  self->_proximityData = a3;
}

- (NSMutableSet)pathIDs
{
  return self->_pathIDs;
}

- (NSMutableData)touchData
{
  return self->_touchData;
}

- (NSMutableData)inertialData
{
  return self->_inertialData;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (unint64_t)inputReportTimestamp
{
  return self->_inputReportTimestamp;
}

- (void)setInputReportTimestamp:(unint64_t)a3
{
  self->_inputReportTimestamp = a3;
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (BOOL)firstButton
{
  return self->_firstButton;
}

- (void)setFirstButton:(BOOL)a3
{
  self->_firstButton = a3;
}

- (int)connectedStandbyToken
{
  return self->_connectedStandbyToken;
}

- (void)setConnectedStandbyToken:(int)a3
{
  self->_connectedStandbyToken = a3;
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastAudioDate:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDoapAudioStart:(id)a3
{
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDoapAudioStop:(id)a3
{
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAudioBuffer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_group)groupInit
{
  return self->_groupInit;
}

- (OS_dispatch_group)groupStart
{
  return self->_groupStart;
}

- (OS_dispatch_group)groupDeviceManagement
{
  return self->_groupDeviceManagement;
}

- (OS_dispatch_group)groupTouch
{
  return self->_groupTouch;
}

- (OS_dispatch_group)groupInertial
{
  return self->_groupInertial;
}

- (OS_dispatch_group)groupProximity
{
  return self->_groupProximity;
}

- (OS_dispatch_semaphore)sentHostReadyReport
{
  return self->_sentHostReadyReport;
}

- (OS_dispatch_semaphore)gotDeviceExtendedInfoReport
{
  return self->_gotDeviceExtendedInfoReport;
}

- (id)deviceManagement
{
  return self->_deviceManagement;
}

- (void)setDeviceManagement:(id)a3
{
}

- (id)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- (id)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (id)inertial
{
  return self->_inertial;
}

- (void)setInertial:(id)a3
{
}

- (id)infrared
{
  return self->_infrared;
}

- (void)setInfrared:(id)a3
{
}

- (id)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (id)radio
{
  return self->_radio;
}

- (void)setRadio:(id)a3
{
}

- (id)proximity
{
  return self->_proximity;
}

- (void)setProximity:(id)a3
{
}

- (unsigned)amdNotification
{
  return self->_amdNotification;
}

- (void)setAmdNotification:(unsigned int)a3
{
  self->_amdNotification = a3;
}

- (unsigned)deviceMgtNotification
{
  return self->_deviceMgtNotification;
}

- (void)setDeviceMgtNotification:(unsigned int)a3
{
  self->_deviceMgtNotification = a3;
}

- (unsigned)buttonInterestNotification
{
  return self->_buttonInterestNotification;
}

- (void)setButtonInterestNotification:(unsigned int)a3
{
  self->_buttonInterestNotification = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proximity, 0);
  objc_storeStrong(&self->_radio, 0);
  objc_storeStrong(&self->_audio, 0);
  objc_storeStrong(&self->_infrared, 0);
  objc_storeStrong(&self->_inertial, 0);
  objc_storeStrong(&self->_buttons, 0);
  objc_storeStrong(&self->_touch, 0);
  objc_storeStrong(&self->_deviceManagement, 0);
  objc_storeStrong((id *)&self->_gotDeviceExtendedInfoReport, 0);
  objc_storeStrong((id *)&self->_sentHostReadyReport, 0);
  objc_storeStrong((id *)&self->_groupProximity, 0);
  objc_storeStrong((id *)&self->_groupInertial, 0);
  objc_storeStrong((id *)&self->_groupTouch, 0);
  objc_storeStrong((id *)&self->_groupDeviceManagement, 0);
  objc_storeStrong((id *)&self->_groupStart, 0);
  objc_storeStrong((id *)&self->_groupInit, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_doapAudioStop, 0);
  objc_storeStrong((id *)&self->_doapAudioStart, 0);
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_inertialData, 0);
  objc_storeStrong((id *)&self->_touchData, 0);
  objc_storeStrong((id *)&self->_pathIDs, 0);

  objc_storeStrong((id *)&self->_cachedButtonsAndTimestamps, 0);
}

@end