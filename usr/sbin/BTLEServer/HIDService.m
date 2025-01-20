@interface HIDService
+ (id)UUID;
- (BOOL)allInputReportsReady;
- (BOOL)isPowerManagementBasedOnDisplayState;
- (BOOL)pmIsSuspended;
- (CBCharacteristic)accessoryCategoryCharacteristic;
- (CBCharacteristic)hidControlPointCharacteristic;
- (CBCharacteristic)hidInformationCharacteristic;
- (CBCharacteristic)reportMapCharacteristic;
- (CUSystemMonitor)systemMonitor;
- (HIDBluetoothDevice)hidDevice;
- (HIDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (IONotificationPort)pmNotificationPort;
- (NSMapTable)reportInfoMap;
- (id)characteristicForReportID:(unsigned int)a3 reportType:(int)a4;
- (id)hidDeviceProperties;
- (id)reportTypeToString:(int)a3;
- (int)readReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (int)writeReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 withResponse:(BOOL)a6 error:(id *)a7;
- (unint64_t)numReports;
- (unsigned)pmNotifier;
- (unsigned)pmService;
- (void)authDidSucceedNotification:(id)a3;
- (void)createHIDDeviceIfEverythingReady;
- (void)createReportInfo:(id)a3;
- (void)dealloc;
- (void)deregisterForPowerManagementEvents;
- (void)destroyHIDDevice;
- (void)enterSuspendModeIfNeeded:(int64_t)a3;
- (void)exitSuspendModeIfNeeded;
- (void)handlePowerManagementNotification:(unsigned int)a3 notificationID:(int64_t)a4;
- (void)hidDeviceDesiredConnectionParametersDidChange;
- (void)hidDeviceDidStop;
- (void)notifyDidStartIfEverythingReady;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)registerForPowerManagementEvents;
- (void)screenStateChanged:(BOOL)a3;
- (void)setAccessoryCategoryCharacteristic:(id)a3;
- (void)setHidControlPointCharacteristic:(id)a3;
- (void)setHidDevice:(id)a3;
- (void)setHidInformationCharacteristic:(id)a3;
- (void)setNumReports:(unint64_t)a3;
- (void)setPmIsSuspended:(BOOL)a3;
- (void)setPmNotificationPort:(IONotificationPort *)a3;
- (void)setPmNotifier:(unsigned int)a3;
- (void)setPmService:(unsigned int)a3;
- (void)setReportInfoMap:(id)a3;
- (void)setReportMapCharacteristic:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)signalCommandCondition:(id)a3 error:(id)a4;
- (void)start;
- (void)stop;
- (void)writeControlPointCommand:(unsigned __int8)a3;
@end

@implementation HIDService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDHumanInterfaceDeviceServiceString];
}

- (HIDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)HIDService;
  v5 = [(ClientService *)&v10 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setIsPrimary:1];
    [(ClientService *)v6 setPriority:2];
    uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
    reportInfoMap = v6->_reportInfoMap;
    v6->_reportInfoMap = (NSMapTable *)v7;

    [(HIDService *)v6 setPmService:0];
    [(HIDService *)v6 setPmNotifier:0];
  }
  return v6;
}

- (void)start
{
  v13.receiver = self;
  v13.super_class = (Class)HIDService;
  [(ClientService *)&v13 start];
  v3 = +[CBUUID UUIDWithString:CBUUIDReportMapCharacteristicString];
  v14[0] = v3;
  v4 = +[CBUUID UUIDWithString:CBUUIDReportCharacteristicString];
  v14[1] = v4;
  v5 = +[CBUUID UUIDWithString:CBUUIDHIDControlPointCharacteristicString];
  v14[2] = v5;
  v6 = +[CBUUID UUIDWithString:CBUUIDHIDInformationCharacteristicString];
  v14[3] = v6;
  uint64_t v7 = +[CBUUID UUIDWithString:@"D31D8DEA-47DB-4796-A6B9-E38909CB34FF"];
  v14[4] = v7;
  v8 = +[CBUUID UUIDWithString:CBUUIDBootKeyboardInputReportCharacteristicString];
  v14[5] = v8;
  v9 = +[CBUUID UUIDWithString:CBUUIDBootMouseInputReportCharacteristicString];
  v14[6] = v9;
  objc_super v10 = +[NSArray arrayWithObjects:v14 count:7];

  v11 = [(ClientService *)self peripheral];
  v12 = [(ClientService *)self service];
  [v11 discoverCharacteristics:v10 forService:v12];
}

- (void)stop
{
  [(HIDService *)self deregisterForPowerManagementEvents];
  [(HIDService *)self destroyHIDDevice];
  v3.receiver = self;
  v3.super_class = (Class)HIDService;
  [(ClientService *)&v3 stop];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HIDService;
  [(HIDService *)&v4 dealloc];
}

- (void)createReportInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 value];
  v6 = +[DataInputStream inputStreamWithData:v5];

  __int16 v17 = 0;
  if ([v6 readUint8:(char *)&v17 + 1]
    && [v6 readUint8:&v17])
  {
    LOBYTE(v17) = v17 - 1;
    uint64_t v7 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v17;
      v15 = v7;
      v16 = [(HIDService *)self reportTypeToString:v14];
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      __int16 v20 = 1024;
      int v21 = HIBYTE(v17);
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Found %@ report for ID #%u", buf, 0x12u);
    }
    v8 = [HIDReportInfo alloc];
    v9 = [(HIDReportInfo *)v8 initWithID:HIBYTE(v17) type:v17];
    reportInfoMap = self->_reportInfoMap;
    v11 = [v4 characteristic];
    [(NSMapTable *)reportInfoMap setObject:v9 forKey:v11];

    if (!(_BYTE)v17)
    {
      v12 = [(ClientService *)self peripheral];
      objc_super v13 = [v4 characteristic];
      [v12 setNotifyValue:1 forCharacteristic:v13];
    }
    [(HIDService *)self createHIDDeviceIfEverythingReady];
  }
}

- (id)hidDeviceProperties
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  id v4 = [(ClientService *)self manager];
  v5 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
  v6 = [v4 clientServiceForUUID:v5];

  if (v6)
  {
    if ([v6 hasIDs])
    {
      uint64_t v7 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v6 vendorIDSource]);
      [v3 setObject:v7 forKeyedSubscript:@"VendorIDSource"];

      v8 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v6 vendorID]);
      [v3 setObject:v8 forKeyedSubscript:@"VendorID"];

      v9 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v6 productID]);
      [v3 setObject:v9 forKeyedSubscript:@"ProductID"];

      objc_super v10 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v6 productVersion]);
      [v3 setObject:v10 forKeyedSubscript:@"VersionNumber"];
    }
    v11 = [v6 firmwareRevision];

    if (v11)
    {
      v12 = [v6 firmwareRevision];
      objc_super v13 = [v12 stringByReplacingOccurrencesOfString:&stru_1000B5230 withString:&stru_1000B2890];
      [v3 setObject:v13 forKeyedSubscript:@"kBTFirmwareRevisionKey"];
    }
    uint64_t v14 = [v6 hardwareRevision];

    if (v14)
    {
      v15 = [v6 hardwareRevision];
      v16 = [v15 stringByReplacingOccurrencesOfString:&stru_1000B5230 withString:&stru_1000B2890];
      [v3 setObject:v16 forKeyedSubscript:@"kBTHardwareRevisionKey"];
    }
    __int16 v17 = [v6 serialNumber];

    if (v17)
    {
      v18 = [v6 serialNumber];
      v19 = [v18 stringByReplacingOccurrencesOfString:&stru_1000B5230 withString:&stru_1000B2890];
      [v3 setObject:v19 forKeyedSubscript:@"SerialNumber"];
    }
    __int16 v20 = [v6 modelNumber];

    if (v20)
    {
      int v21 = [v6 modelNumber];
      v22 = [v21 stringByReplacingOccurrencesOfString:&stru_1000B5230 withString:&stru_1000B2890];
      [v3 setObject:v22 forKeyedSubscript:@"ModelNumber"];
    }
    v23 = [v6 manufacturerName];

    if (v23)
    {
      v24 = [v6 manufacturerName];
      v25 = [v24 stringByReplacingOccurrencesOfString:&stru_1000B5230 withString:&stru_1000B2890];
      [v3 setObject:v25 forKeyedSubscript:@"Manufacturer"];
    }
  }

  v26 = [(HIDService *)self hidInformationCharacteristic];
  v27 = [v26 value];
  v28 = +[DataInputStream inputStreamWithData:v27 byteOrder:1];

  LOWORD(v56[0]) = 0;
  unsigned __int8 v55 = 0;
  [v28 readUint16:v56];
  if ([v28 readUint8:&v55])
  {
    v29 = +[NSNumber numberWithUnsignedChar:v55];
    [v3 setObject:v29 forKeyedSubscript:@"CountryCode"];
  }
  v56[0] = 0;
  v56[1] = 0;
  v30 = [(ClientService *)self peripheral];
  v31 = [v30 identifier];
  [v31 getUUIDBytes:v56];

  v32 = +[NSNumber numberWithUnsignedInt:LODWORD(v56[0])];
  [v3 setObject:v32 forKeyedSubscript:@"LocationID"];

  v33 = [(ClientService *)self peripheral];
  v34 = [v33 identifier];
  v35 = [v34 UUIDString];
  [v3 setObject:v35 forKeyedSubscript:@"PhysicalDeviceUniqueID"];

  v36 = [(ClientService *)self peripheral];
  v37 = [v36 name];

  if (v37)
  {
    v38 = [(ClientService *)self peripheral];
    v39 = [v38 name];
    [v3 setObject:v39 forKeyedSubscript:@"Product"];
  }
  v40 = [(HIDService *)self reportMapCharacteristic];
  v41 = [v40 value];
  [v3 setObject:v41 forKeyedSubscript:@"ReportDescriptor"];

  [v3 setObject:@"BluetoothLowEnergy" forKeyedSubscript:@"Transport"];
  [v3 setObject:&off_1000B7D58 forKeyedSubscript:@"RequestTimeout"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"HIDVirtualDevice"];
  v42 = [(ClientService *)self manager];
  v43 = +[CBUUID UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
  v44 = [v42 clientServiceForUUID:v43];

  if (v44)
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Authenticated"];
    v45 = +[NSNotificationCenter defaultCenter];
    v46 = [(ClientService *)self peripheral];
    [v45 addObserver:self selector:"authDidSucceedNotification:" name:@"AuthenticationServiceAuthDidSucceedNotification" object:v46];
  }
  else
  {
    v47 = [(ClientService *)self peripheral];
    unsigned int v48 = [v47 hasTag:@"needsMFiAuthentication4.0"];

    if (v48) {
      [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Authenticated"];
    }
  }
  v49 = [(HIDService *)self accessoryCategoryCharacteristic];

  if (v49)
  {
    v50 = [(HIDService *)self accessoryCategoryCharacteristic];
    v51 = [v50 value];
    v52 = +[DataInputStream inputStreamWithData:v51];

    LOBYTE(v56[0]) = 0;
    if ([v52 readUint8:v56])
    {
      v53 = +[NSNumber numberWithUnsignedChar:LOBYTE(v56[0])];
      [v3 setObject:v53 forKeyedSubscript:@"IAPHIDAccessoryCategory"];
    }
  }

  return v3;
}

- (void)createHIDDeviceIfEverythingReady
{
  id v39 = [(HIDService *)self reportMapCharacteristic];
  uint64_t v3 = [v39 value];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(HIDService *)self hidInformationCharacteristic];
    v6 = [v5 value];
    if (v6 && [(NSMapTable *)self->_reportInfoMap count] == self->_numReports)
    {
      uint64_t v7 = [(HIDService *)self accessoryCategoryCharacteristic];
      if (v7)
      {
        v8 = (void *)v7;
        v9 = [(HIDService *)self accessoryCategoryCharacteristic];
        objc_super v10 = [v9 value];

        if (!v10) {
          return;
        }
      }
      else
      {
      }
      v11 = [(HIDService *)self hidDeviceProperties];
      v12 = [(ClientService *)self peripheral];
      if ([v12 isLinkEncrypted])
      {
        objc_super v13 = [(HIDService *)self hidDevice];

        if (!v13)
        {
          uint64_t v14 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
            sub_1000715D0((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
          }
          int v21 = [(NSMapTable *)self->_reportInfoMap objectEnumerator];
          v22 = [v21 allObjects];
          v23 = +[HIDBluetoothDevice hidDeviceWithProperties:v11 reports:v22];
          [(HIDService *)self setHidDevice:v23];

          v24 = [(HIDService *)self hidDevice];

          if (v24)
          {
            v25 = [(HIDService *)self hidDevice];
            [v25 setService:self];

            v26 = [(ClientService *)self peripheral];
            v27 = [(HIDService *)self hidDevice];
            [v27 setPeripheral:v26];

            v28 = [(HIDService *)self hidDevice];
            v29 = [v28 desiredConnectionParameters];

            v30 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              sub_100071564((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36);
            }
            v37 = [(ClientService *)self manager];
            [v37 clientService:self desiresConnectionParameters:v29];

            v38 = [(HIDService *)self hidDevice];
            [v38 start];
          }
          else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            sub_100071530();
          }
LABEL_24:

          return;
        }
      }
      else
      {
      }
      if ([(HIDService *)self allInputReportsReady]
        && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_10007163C();
      }
      goto LABEL_24;
    }
  }
}

- (void)destroyHIDDevice
{
  uint64_t v3 = [(HIDService *)self hidDevice];

  if (v3)
  {
    reportInfoMap = self->_reportInfoMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003E518;
    v6[3] = &unk_1000B1E68;
    v6[4] = self;
    [(NSMapTable *)reportInfoMap enumerateKeysAndObjectsUsingBlock:v6];
    v5 = [(HIDService *)self hidDevice];
    [v5 stop];
  }
}

- (void)signalCommandCondition:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 commandCondition];
  [v7 lock];

  [v6 setCommandPending:0];
  [v6 setCommandError:v5];

  v8 = [v6 commandCondition];
  [v8 signal];

  id v9 = [v6 commandCondition];

  [v9 unlock];
}

- (BOOL)isPowerManagementBasedOnDisplayState
{
  v2 = [(ClientService *)self peripheral];
  unsigned __int8 v3 = [v2 hasTag:@"A2538"];

  return v3;
}

- (void)registerForPowerManagementEvents
{
  if ([(HIDService *)self isPowerManagementBasedOnDisplayState])
  {
    unsigned __int8 v3 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for display state instead of system sleep state", buf, 2u);
    }
    id v4 = objc_alloc_init((Class)CUSystemMonitor);
    [(HIDService *)self setSystemMonitor:v4];

    id v5 = [(HIDService *)self systemMonitor];
    [v5 setDispatchQueue:&_dispatch_main_q];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003E894;
    v9[3] = &unk_1000B1290;
    objc_copyWeak(&v10, (id *)buf);
    id v6 = [(HIDService *)self systemMonitor];
    [v6 setScreenOnChangedHandler:v9];

    uint64_t v7 = [(HIDService *)self systemMonitor];
    [v7 activateWithCompletion:0];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(HIDService *)self setPmService:IORegisterForSystemPower(self, &self->_pmNotificationPort, (IOServiceInterestCallback)j__objc_msgSend_handlePowerManagementNotification_notificationID_, &self->_pmNotifier)];
    v8 = [(HIDService *)self pmNotificationPort];
    IONotificationPortSetDispatchQueue(v8, (dispatch_queue_t)&_dispatch_main_q);
  }
}

- (void)deregisterForPowerManagementEvents
{
  if ([(HIDService *)self isPowerManagementBasedOnDisplayState])
  {
    unsigned __int8 v3 = [(HIDService *)self systemMonitor];
    [v3 invalidate];

    [(HIDService *)self setSystemMonitor:0];
  }
  else if ([(HIDService *)self pmService])
  {
    IODeregisterForSystemPower(&self->_pmNotifier);
    IONotificationPortDestroy([(HIDService *)self pmNotificationPort]);
    io_connect_t v4 = [(HIDService *)self pmService];
    IOServiceClose(v4);
  }
}

- (void)notifyDidStartIfEverythingReady
{
  id v6 = [(HIDService *)self hidDevice];
  if ([v6 state] == 2)
  {
    unsigned int v3 = [(HIDService *)self allInputReportsReady];

    if (v3)
    {
      io_connect_t v4 = +[NSNotificationCenter defaultCenter];
      id v5 = [(ClientService *)self peripheral];
      [v4 postNotificationName:@"PeerIsUsingBuiltinServiceNotification" object:v5];

      [(ClientService *)self notifyDidStart];
    }
  }
  else
  {
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v53 = a3;
  if (!a5)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [a4 characteristics];
    id v8 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v56;
      uint64_t v51 = CBUUIDReportMapCharacteristicString;
      uint64_t v11 = CBUUIDReportCharacteristicString;
      uint64_t v49 = CBUUIDHIDControlPointCharacteristicString;
      uint64_t v48 = CBUUIDHIDInformationCharacteristicString;
      uint64_t v50 = CBUUIDBootKeyboardInputReportCharacteristicString;
      uint64_t v47 = CBUUIDBootMouseInputReportCharacteristicString;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v13 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v12);
          uint64_t v14 = [(HIDService *)self reportMapCharacteristic];
          if (v14)
          {
          }
          else
          {
            uint64_t v15 = [v13 UUID];
            uint64_t v16 = +[CBUUID UUIDWithString:v51];
            unsigned int v17 = [v15 isEqual:v16];

            if (v17)
            {
              [(HIDService *)self setReportMapCharacteristic:v13];
              [v53 discoverDescriptorsForCharacteristic:v13];
LABEL_25:
              uint64_t v33 = [(ClientService *)self peripheral];
              if ([v33 isLinkEncrypted])
              {
                uint64_t v34 = [v13 value];

                if (v34) {
                  goto LABEL_39;
                }
              }
              else
              {
              }
              [v53 readValueForCharacteristic:v13];
              goto LABEL_39;
            }
          }
          uint64_t v18 = [v13 UUID];
          uint64_t v19 = +[CBUUID UUIDWithString:v11];
          unsigned int v20 = [v18 isEqual:v19];

          if (v20)
          {
            ++self->_numReports;
            [v53 discoverDescriptorsForCharacteristic:v13];
            goto LABEL_39;
          }
          int v21 = [(HIDService *)self hidControlPointCharacteristic];
          if (v21)
          {
          }
          else
          {
            v22 = [v13 UUID];
            v23 = +[CBUUID UUIDWithString:v49];
            unsigned int v24 = [v22 isEqual:v23];

            if (v24)
            {
              [(HIDService *)self setHidControlPointCharacteristic:v13];
              [(HIDService *)self registerForPowerManagementEvents];
              goto LABEL_39;
            }
          }
          v25 = [(HIDService *)self hidInformationCharacteristic];
          if (v25)
          {
          }
          else
          {
            v26 = [v13 UUID];
            v27 = +[CBUUID UUIDWithString:v48];
            unsigned int v28 = [v26 isEqual:v27];

            if (v28)
            {
              [(HIDService *)self setHidInformationCharacteristic:v13];
              goto LABEL_25;
            }
          }
          v29 = [(HIDService *)self accessoryCategoryCharacteristic];
          if (v29)
          {
          }
          else
          {
            v30 = [v13 UUID];
            uint64_t v31 = +[CBUUID UUIDWithString:@"D31D8DEA-47DB-4796-A6B9-E38909CB34FF"];
            unsigned int v32 = [v30 isEqual:v31];

            if (v32)
            {
              [(HIDService *)self setAccessoryCategoryCharacteristic:v13];
              goto LABEL_25;
            }
          }
          uint64_t v35 = [v13 UUID];
          uint64_t v36 = +[CBUUID UUIDWithString:v50];
          unsigned int v37 = [v35 isEqual:v36];

          if (v37)
          {
            v38 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Detected keyboard LE HID", buf, 2u);
            }
            id v39 = v53;
            CFStringRef v40 = @"IsLEKeyboard";
          }
          else
          {
            v41 = [v13 UUID];
            v42 = +[CBUUID UUIDWithString:v47];
            unsigned int v43 = [v41 isEqual:v42];

            if (!v43) {
              goto LABEL_39;
            }
            v44 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Detected mouse LE HID", buf, 2u);
            }
            id v39 = v53;
            CFStringRef v40 = @"IsLEMouse";
          }
          [v39 tag:v40];
LABEL_39:
          v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v9);
    }

    v45 = [(HIDService *)self reportMapCharacteristic];

    if (!v45 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000716D8();
    }
    if (!self->_numReports && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000716A4();
    }
    v46 = [(HIDService *)self hidInformationCharacteristic];

    if (!v46 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071670();
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMapTable *)self->_reportInfoMap objectForKey:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    if ([v9 commandPending] == (id)1)
    {
      uint64_t v11 = (void *)qword_1000CD178;
      if (v8)
      {
        if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
        {
LABEL_17:
          [(HIDService *)self signalCommandCondition:v10 error:v8];
          goto LABEL_30;
        }
        v12 = v11;
        objc_super v13 = -[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]);
        int v33 = 138412802;
        uint64_t v34 = v13;
        __int16 v35 = 1024;
        unsigned int v36 = [v10 ID];
        __int16 v37 = 2112;
        id v38 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error getting %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
        {
          v25 = v11;
          v26 = -[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]);
          unsigned int v27 = [v10 ID];
          unsigned int v28 = [v7 value];
          int v33 = 138412802;
          uint64_t v34 = v26;
          __int16 v35 = 1024;
          unsigned int v36 = v27;
          __int16 v37 = 2112;
          id v38 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Did get %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);
        }
        v12 = [v7 value];
        [v10 setCommandValue:v12];
      }

      goto LABEL_17;
    }
    if (v8)
    {
      uint64_t v18 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v18;
        unsigned int v20 = -[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]);
        int v33 = 138412802;
        uint64_t v34 = v20;
        __int16 v35 = 1024;
        unsigned int v36 = [v10 ID];
        __int16 v37 = 2112;
        id v38 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error updating %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);
      }
    }
    else
    {
      id v21 = [v7 valueTimestamp];
      if (!v21) {
        id v21 = (id)mach_absolute_time();
      }
      v22 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
      {
        v29 = v22;
        v30 = -[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]);
        unsigned int v31 = [v10 ID];
        unsigned int v32 = [v7 value];
        int v33 = 138412802;
        uint64_t v34 = v30;
        __int16 v35 = 1024;
        unsigned int v36 = v31;
        __int16 v37 = 2112;
        id v38 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Updated %@ report for ID #%u: %@", (uint8_t *)&v33, 0x1Cu);
      }
      if (byte_1000CD170) {
        kdebug_trace();
      }
      v23 = [(HIDService *)self hidDevice];
      unsigned int v24 = [v7 value];
      [v23 handleInputReportData:v24 reportID:[v10 ID] timestamp:v21];
    }
  }
  else
  {
    id v14 = [(HIDService *)self reportMapCharacteristic];
    if (v14 == v7)
    {
      BOOL v17 = 0;
    }
    else
    {
      id v15 = [(HIDService *)self hidInformationCharacteristic];
      if (v15 == v7)
      {
        BOOL v17 = 0;
      }
      else
      {
        id v16 = [(HIDService *)self accessoryCategoryCharacteristic];
        BOOL v17 = v16 != v7;
      }
    }

    if (!v8 && !v17) {
      [(HIDService *)self createHIDDeviceIfEverythingReady];
    }
  }
LABEL_30:
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = [(NSMapTable *)self->_reportInfoMap objectForKey:a4];
  id v9 = v8;
  if (v8 && [v8 commandPending] == (id)2)
  {
    uint64_t v10 = (void *)qword_1000CD178;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = v10;
        v12 = -[HIDService reportTypeToString:](self, "reportTypeToString:", [v9 type]);
        int v13 = 138412802;
        id v14 = v12;
        __int16 v15 = 1024;
        unsigned int v16 = [v9 ID];
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error setting %@ report for ID #%u: %@", (uint8_t *)&v13, 0x1Cu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
    {
      sub_10007170C(v10, v9, self);
    }
    [(HIDService *)self signalCommandCondition:v9 error:v7];
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = [(NSMapTable *)self->_reportInfoMap objectForKey:a4];
  if (v8)
  {
    id v9 = (void *)qword_1000CD178;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = v9;
        uint64_t v11 = -[HIDService reportTypeToString:](self, "reportTypeToString:", [v8 type]);
        int v13 = 138412802;
        id v14 = v11;
        __int16 v15 = 1024;
        unsigned int v16 = [v8 ID];
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error starting notifications on %@ report for ID #%u: %@", (uint8_t *)&v13, 0x1Cu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_1000717C0(v9, v8, self);
      }
      v12 = [(HIDService *)self hidDevice];

      if (!v12) {
        [(HIDService *)self createHIDDeviceIfEverythingReady];
      }
      [(HIDService *)self notifyDidStartIfEverythingReady];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v26 = a3;
  id v7 = a4;
  id v8 = v7;
  if (a5) {
    goto LABEL_22;
  }
  id v9 = [v7 UUID];
  uint64_t v10 = +[CBUUID UUIDWithString:CBUUIDReportCharacteristicString];
  unsigned int v11 = [v9 isEqual:v10];

  if (!v11) {
    goto LABEL_22;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v12 = [v8 descriptors];
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v13)
  {

    goto LABEL_20;
  }
  id v14 = v13;
  v25 = v8;
  char v15 = 0;
  uint64_t v16 = *(void *)v29;
  uint64_t v17 = CBUUIDReportReferenceDescriptorString;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      unsigned int v20 = [v19 UUID];
      id v21 = +[CBUUID UUIDWithString:v17];
      unsigned int v22 = [v20 isEqual:v21];

      if (v22)
      {
        v23 = [(ClientService *)self peripheral];
        if ([v23 isLinkEncrypted])
        {
          unsigned int v24 = [v19 value];

          if (v24)
          {
            [(HIDService *)self createReportInfo:v19];
LABEL_14:
            char v15 = 1;
            continue;
          }
        }
        else
        {
        }
        [v26 readValueForDescriptor:v19];
        goto LABEL_14;
      }
    }
    id v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v14);

  id v8 = v25;
  if (v15) {
    goto LABEL_22;
  }
LABEL_20:
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100071874();
  }
LABEL_22:
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v11 = v7;
    id v8 = [v7 UUID];
    id v9 = +[CBUUID UUIDWithString:CBUUIDReportReferenceDescriptorString];
    unsigned int v10 = [v8 isEqual:v9];

    id v7 = v11;
    if (v10)
    {
      [(HIDService *)self createReportInfo:v11];
      id v7 = v11;
    }
  }
}

- (void)hidDeviceDidStop
{
}

- (void)hidDeviceDesiredConnectionParametersDidChange
{
  unsigned int v3 = [(HIDService *)self hidDevice];
  io_connect_t v4 = [v3 desiredConnectionParameters];

  id v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_1000718A8((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v12 = [(ClientService *)self manager];
  [v12 clientService:self desiresConnectionParameters:v4];
}

- (int)readReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  int v8 = a4;
  int v11 = -536870212;
  v12 = [(HIDService *)self characteristicForReportID:a4 reportType:*(void *)&a5];
  if (v12)
  {
    id v13 = [(NSMapTable *)self->_reportInfoMap objectForKey:v12];
    id v14 = v13;
    if (v13)
    {
      char v15 = [v13 commandCondition];
      [v15 lock];

      if ([v14 isValid])
      {
        uint64_t v16 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v24 = v16;
          v25 = [(HIDService *)self reportTypeToString:v7];
          int v26 = 138412546;
          unsigned int v27 = v25;
          __int16 v28 = 1024;
          int v29 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Getting %@ report for ID #%u", (uint8_t *)&v26, 0x12u);
        }
        [v14 setCommandPending:1];
        uint64_t v17 = [(ClientService *)self peripheral];
        [v17 readValueForCharacteristic:v12];

        id v18 = [v14 commandCondition];
        uint64_t v19 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
        unsigned int v20 = [v18 waitUntilDate:v19];

        if (v20)
        {
          id v21 = [v14 commandError];

          if (v21)
          {
            if (a6)
            {
              *a6 = [v14 commandError];
            }
          }
          else
          {
            [v14 commandValue];
            int v11 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          [v14 setCommandPending:0];
          int v11 = -536870186;
        }
      }
      unsigned int v22 = [v14 commandCondition];
      [v22 unlock];
    }
    else
    {
      int v11 = -536870160;
    }
  }
  else
  {
    int v11 = -536870160;
  }

  return v11;
}

- (int)writeReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 withResponse:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  int v12 = -536870212;
  id v13 = a3;
  id v14 = [(HIDService *)self characteristicForReportID:v10 reportType:v9];
  if (v14)
  {
    char v15 = [(NSMapTable *)self->_reportInfoMap objectForKey:v14];
    uint64_t v16 = v15;
    if (!v15)
    {
      int v12 = -536870160;
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v17 = [v15 commandCondition];
    [v17 lock];

    if (![v16 isValid]) {
      goto LABEL_16;
    }
    id v18 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v24 = v18;
      v25 = [(HIDService *)self reportTypeToString:v9];
      int v29 = 138412802;
      long long v30 = v25;
      __int16 v31 = 1024;
      int v32 = v10;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Setting %@ report for ID #%u: %@", (uint8_t *)&v29, 0x1Cu);

      if (v8) {
        goto LABEL_6;
      }
    }
    else if (v8)
    {
LABEL_6:
      [v16 setCommandPending:2];
      uint64_t v19 = [(ClientService *)self peripheral];
      [v19 writeValue:v13 forCharacteristic:v14 type:0];

      unsigned int v20 = [v16 commandCondition];
      id v21 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
      unsigned int v22 = [v20 waitUntilDate:v21];

      if (v22)
      {
        v23 = [v16 commandError];

        if (v23)
        {
          if (a7)
          {
            *a7 = [v16 commandError];
          }
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      [v16 setCommandPending:0];
      int v12 = -536870186;
LABEL_16:
      unsigned int v27 = [v16 commandCondition];
      [v27 unlock];

      goto LABEL_17;
    }
    int v26 = [(ClientService *)self peripheral];
    [v26 writeValue:v13 forCharacteristic:v14 type:1];

LABEL_15:
    int v12 = 0;
    goto LABEL_16;
  }
  int v12 = -536870160;
LABEL_18:

  return v12;
}

- (void)handlePowerManagementNotification:(unsigned int)a3 notificationID:(int64_t)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
    case 1u:
      [(HIDService *)self enterSuspendModeIfNeeded:a4];
      break;
    case 2u:
    case 9u:
      [(HIDService *)self exitSuspendModeIfNeeded];
      break;
    default:
      return;
  }
}

- (void)enterSuspendModeIfNeeded:(int64_t)a3
{
  if ([(HIDService *)self pmIsSuspended])
  {
    io_connect_t v5 = [(HIDService *)self pmService];
    IOAllowPowerChange(v5, a3);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_100071914();
    }
    [(HIDService *)self setPmIsSuspended:1];
    [(HIDService *)self writeControlPointCommand:0];
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100040244;
    v7[3] = &unk_1000B1E90;
    v7[4] = self;
    v7[5] = a3;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)exitSuspendModeIfNeeded
{
  if ([(HIDService *)self pmIsSuspended])
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_100071954();
    }
    [(HIDService *)self setPmIsSuspended:0];
    [(HIDService *)self writeControlPointCommand:1];
  }
}

- (void)writeControlPointCommand:(unsigned __int8)a3
{
  unsigned __int8 v7 = a3;
  unint64_t v4 = +[NSData dataWithBytes:&v7 length:1];
  io_connect_t v5 = [(ClientService *)self peripheral];
  dispatch_time_t v6 = [(HIDService *)self hidControlPointCharacteristic];
  [v5 writeValue:v4 forCharacteristic:v6 type:1];
}

- (void)screenStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  io_connect_t v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v6 = "suspend (screen off)";
    if (v3) {
      dispatch_time_t v6 = "exit suspend (screen on)";
    }
    int v7 = 136446210;
    BOOL v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen state changed, sending HID control point command %{public}s", (uint8_t *)&v7, 0xCu);
  }
  [(HIDService *)self writeControlPointCommand:v3];
}

- (void)authDidSucceedNotification:(id)a3
{
  id v4 = a3;
  io_connect_t v5 = [v4 userInfo];
  id v10 = [v5 objectForKeyedSubscript:@"AuthenticationServiceCertClassUserInfoKey"];

  dispatch_time_t v6 = [v4 userInfo];

  int v7 = [v6 objectForKeyedSubscript:@"AuthenticationServiceAuthVersionKey"];

  if ((int)[v7 intValue] <= 2 && (!v10 || objc_msgSend(v10, "unsignedIntValue")))
  {
    BOOL v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = [(ClientService *)self peripheral];
    [v8 postNotificationName:@"AuthenticationServiceAuthDidFailNotification" object:v9];
  }
}

- (BOOL)allInputReportsReady
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  reportInfoMap = self->_reportInfoMap;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100040630;
  v5[3] = &unk_1000B1EB8;
  v5[4] = &v6;
  [(NSMapTable *)reportInfoMap enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)characteristicForReportID:(unsigned int)a3 reportType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10004085C;
  reportInfoMap = self->_reportInfoMap;
  unsigned int v20 = sub_10004086C;
  id v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100040874;
  v13[3] = &unk_1000B1EE0;
  unsigned int v14 = a3;
  int v15 = a4;
  v13[4] = &v16;
  [(NSMapTable *)reportInfoMap enumerateKeysAndObjectsUsingBlock:v13];
  uint64_t v8 = (void *)v17[5];
  if (!v8)
  {
    char v9 = (id)qword_1000CD178;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(HIDService *)self reportTypeToString:v4];
      sub_100071994(v10, buf, a3, v9);
    }

    uint64_t v8 = (void *)v17[5];
  }
  id v11 = v8;
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)reportTypeToString:(int)a3
{
  if (a3 > 2) {
    return @"unknown";
  }
  else {
    return *(&off_1000B1F00 + a3);
  }
}

- (CBCharacteristic)reportMapCharacteristic
{
  return self->_reportMapCharacteristic;
}

- (void)setReportMapCharacteristic:(id)a3
{
}

- (CBCharacteristic)hidControlPointCharacteristic
{
  return self->_hidControlPointCharacteristic;
}

- (void)setHidControlPointCharacteristic:(id)a3
{
}

- (CBCharacteristic)hidInformationCharacteristic
{
  return self->_hidInformationCharacteristic;
}

- (void)setHidInformationCharacteristic:(id)a3
{
}

- (CBCharacteristic)accessoryCategoryCharacteristic
{
  return self->_accessoryCategoryCharacteristic;
}

- (void)setAccessoryCategoryCharacteristic:(id)a3
{
}

- (NSMapTable)reportInfoMap
{
  return self->_reportInfoMap;
}

- (void)setReportInfoMap:(id)a3
{
}

- (unint64_t)numReports
{
  return self->_numReports;
}

- (void)setNumReports:(unint64_t)a3
{
  self->_numReports = a3;
}

- (HIDBluetoothDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
}

- (unsigned)pmService
{
  return self->_pmService;
}

- (void)setPmService:(unsigned int)a3
{
  self->_pmService = a3;
}

- (IONotificationPort)pmNotificationPort
{
  return self->_pmNotificationPort;
}

- (void)setPmNotificationPort:(IONotificationPort *)a3
{
  self->_pmNotificationPort = a3;
}

- (unsigned)pmNotifier
{
  return self->_pmNotifier;
}

- (void)setPmNotifier:(unsigned int)a3
{
  self->_pmNotifier = a3;
}

- (BOOL)pmIsSuspended
{
  return self->_pmIsSuspended;
}

- (void)setPmIsSuspended:(BOOL)a3
{
  self->_pmIsSuspended = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_hidDevice, 0);
  objc_storeStrong((id *)&self->_reportInfoMap, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryCharacteristic, 0);
  objc_storeStrong((id *)&self->_hidInformationCharacteristic, 0);
  objc_storeStrong((id *)&self->_hidControlPointCharacteristic, 0);

  objc_storeStrong((id *)&self->_reportMapCharacteristic, 0);
}

@end