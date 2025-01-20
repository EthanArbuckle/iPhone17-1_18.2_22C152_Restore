@interface GHSService
+ (id)UUID;
- (BOOL)getDebugLoggingEnabled;
- (CBCharacteristic)featuresCharacteristic;
- (CBCharacteristic)ghsControlPointCharacteristic;
- (CBCharacteristic)liveObservationCharacteristic;
- (CBCharacteristic)observationScheduleChangedCharacteristic;
- (CBCharacteristic)racpCharacteristic;
- (CBCharacteristic)storedObservationCharacteristic;
- (GHSBluetoothDevice)ghsDevice;
- (GHSService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSTimer)connectionIdleTimer;
- (id)ghsDeviceProperties;
- (void)abortRACPRequest;
- (void)connectionIdleTimeout;
- (void)consentDidFail:(id)a3;
- (void)consentDidSucceed:(id)a3;
- (void)createGHSDeviceIfReady;
- (void)deleteAllStoredObservation;
- (void)extractGHSControlPointResponse;
- (void)extractHealthObservationBodySegmentFromData:(id)a3 isLive:(BOOL)a4;
- (void)extractHealthSensorFeatures;
- (void)extractLiveHealthObservation;
- (void)extractObservationScheduleChanged;
- (void)extractRACPResponse;
- (void)extractStoredHealthObservation;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)retrieveLastStoredObservation;
- (void)retrieveStoredObservationsAfterRecordNumber:(unsigned int)a3;
- (void)setConnectionIdleTimer:(id)a3;
- (void)setFeaturesCharacteristic:(id)a3;
- (void)setGhsControlPointCharacteristic:(id)a3;
- (void)setGhsDevice:(id)a3;
- (void)setLiveObservationCharacteristic:(id)a3;
- (void)setObservationScheduleChangedCharacteristic:(id)a3;
- (void)setRacpCharacteristic:(id)a3;
- (void)setStoredObservationCharacteristic:(id)a3;
- (void)start;
- (void)startLiveHealthObservation;
- (void)stop;
- (void)stopLiveHealthObservation;
@end

@implementation GHSService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDGenericHealthSensorServiceString];
}

- (GHSService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)GHSService;
  v5 = [(ClientService *)&v10 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setIsPrimary:1];
    [(ClientService *)v6 setPriority:7];
    [(ClientService *)v6 setStartTimeout:0.0];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"consentDidSucceed:" name:@"UserDataServiceConsentDidSucceedNotification" object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v6 selector:"consentDidFail:" name:@"UserDataServiceConsentDidFailNotification" object:0];

    v6->_isExtraLoggingEnabled = [(GHSService *)v6 getDebugLoggingEnabled];
  }
  return v6;
}

- (void)start
{
  v20.receiver = self;
  v20.super_class = (Class)GHSService;
  [(ClientService *)&v20 start];
  self->_isRACPInProgress = 0;
  self->_currentRACPOpCode = -1;
  v3 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  liveObservationData = self->_liveObservationData;
  self->_liveObservationData = v3;

  v5 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  storedObservationData = self->_storedObservationData;
  self->_storedObservationData = v5;

  self->_lastSyncedRecordNum = 0;
  v7 = [(ClientService *)self manager];
  v8 = +[CBUUID UUIDWithString:CBUUIDUserDataServiceString];
  v9 = [v7 clientServiceForUUID:v8];

  self->_isUDSConsentGranted = v9 == 0;
  objc_super v10 = +[CBUUID UUIDWithString:CBUUIDHealthSensorFeaturesCharacteristicString];
  v21[0] = v10;
  v11 = +[CBUUID UUIDWithString:CBUUIDLiveHealthObservationsCharacteristicString];
  v21[1] = v11;
  v12 = +[CBUUID UUIDWithString:CBUUIDStoredHealthObservationsCharacteristicString];
  v21[2] = v12;
  v13 = +[CBUUID UUIDWithString:CBUUIDRACPCharacteristicString];
  v21[3] = v13;
  v14 = +[CBUUID UUIDWithString:CBUUIDGHSControlPointCharacteristicString];
  v21[4] = v14;
  v15 = +[CBUUID UUIDWithString:CBUUIDObservationScheduleChangedCharacteristicString];
  v21[5] = v15;
  v16 = +[NSArray arrayWithObjects:v21 count:6];

  v17 = [(ClientService *)self peripheral];
  v18 = [(ClientService *)self service];
  [v17 discoverCharacteristics:v16 forService:v18];

  v19 = +[NSTimer scheduledTimerWithTimeInterval:self target:"connectionIdleTimeout" selector:0 userInfo:0 repeats:30.0];
  [(GHSService *)self setConnectionIdleTimer:v19];
}

- (void)stop
{
  self->_isRACPInProgress = 0;
  self->_isUDSConsentGranted = 0;
  self->_currentRACPOpCode = -1;
  liveObservationData = self->_liveObservationData;
  self->_liveObservationData = 0;

  storedObservationData = self->_storedObservationData;
  self->_storedObservationData = 0;

  v5 = [(GHSService *)self connectionIdleTimer];
  [v5 invalidate];

  [(GHSService *)self setConnectionIdleTimer:0];
  v6.receiver = self;
  v6.super_class = (Class)GHSService;
  [(ClientService *)&v6 stop];
}

- (void)consentDidSucceed:(id)a3
{
  v4 = [a3 object];
  v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    v7 = [v4 name];
    int v8 = 141558275;
    uint64_t v9 = 1752392040;
    __int16 v10 = 2113;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "UDS consent succeeded for peripheral \"%{private, mask.hash}@\"", (uint8_t *)&v8, 0x16u);
  }
  self->_isUDSConsentGranted = 1;
  [(GHSService *)self createGHSDeviceIfReady];
}

- (void)consentDidFail:(id)a3
{
  v3 = [a3 object];
  v4 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006EF1C(v4);
  }
}

- (id)ghsDeviceProperties
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(ClientService *)self manager];
  v5 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
  objc_super v6 = [v4 clientServiceForUUID:v5];

  v7 = [v6 manufacturerName];
  [v3 setObject:v7 forKeyedSubscript:@"ManufacturerName"];

  int v8 = [v6 modelNumber];
  [v3 setObject:v8 forKeyedSubscript:@"ModelNumber"];

  uint64_t v9 = [v6 serialNumber];
  [v3 setObject:v9 forKeyedSubscript:@"SerialNumber"];

  __int16 v10 = [v6 hardwareRevision];
  [v3 setObject:v10 forKeyedSubscript:@"HardwareRevision"];

  v11 = [v6 softwareRevision];
  [v3 setObject:v11 forKeyedSubscript:@"SoftwareRevision"];

  v12 = [v6 firmwareRevision];
  [v3 setObject:v12 forKeyedSubscript:@"FirmwareRevision"];

  v13 = [v6 udiForMedicalDevices];
  [v3 setObject:v13 forKeyedSubscript:@"UDIForMedicalDevices"];

  v14 = [(ClientService *)self peripheral];
  v15 = [v14 identifier];
  v16 = [v15 UUIDString];
  [v3 setObject:v16 forKeyedSubscript:@"UUID"];

  v17 = [(ClientService *)self peripheral];
  v18 = [v17 name];

  if (v18)
  {
    v19 = [(ClientService *)self peripheral];
    objc_super v20 = [v19 name];
    [v3 setObject:v20 forKeyedSubscript:@"kGHSDeviceNameKey"];
  }
  if (self->_deviceType)
  {
    v21 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
    [v3 setObject:v21 forKeyedSubscript:@"kBTDeviceTypeMDCDevSpecKey"];
  }
  else
  {
    v22 = [(GHSService *)self featuresCharacteristic];
    v23 = [v22 value];
    v21 = +[DataInputStream inputStreamWithData:v23 byteOrder:1];

    __int16 v44 = 0;
    [v21 readUint8:(char *)&v44 + 1];
    if ([v21 readUint8:&v44] && (_BYTE)v44)
    {
      unsigned int v25 = 0;
      *(void *)&long long v24 = 141558531;
      long long v40 = v24;
      do
      {
        unsigned int v43 = 0;
        [v21 readUint32:&v43, v40];
        v26 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = [(ClientService *)self peripheral];
          v29 = [v28 name];
          *(_DWORD *)buf = v40;
          uint64_t v46 = 1752392040;
          __int16 v47 = 2113;
          v48 = v29;
          __int16 v49 = 1024;
          unsigned int v50 = v43;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": observationType %u", buf, 0x1Cu);
        }
        v30 = +[NSNumber numberWithUnsignedInt:v43];
        [v3 setObject:v30 forKeyedSubscript:@"kBTObservationTypesMDCCodeKey"];

        ++v25;
      }
      while (v25 < v44);
    }
    if ((v44 & 0x100) != 0 && [v21 readUint8:&v44] && (_BYTE)v44)
    {
      unsigned int v32 = 0;
      *(void *)&long long v31 = 141558787;
      long long v41 = v31;
      do
      {
        LOWORD(v43) = 0;
        unsigned __int8 v42 = 0;
        [v21 readUint16:&v43 v41];
        [v21 readUint8:&v42];
        v33 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          v35 = [(ClientService *)self peripheral];
          v36 = [v35 name];
          *(_DWORD *)buf = v41;
          uint64_t v46 = 1752392040;
          __int16 v47 = 2113;
          v48 = v36;
          __int16 v49 = 1024;
          unsigned int v50 = (unsigned __int16)v43;
          __int16 v51 = 1024;
          int v52 = v42;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": deviceType %u, version %u", buf, 0x22u);
        }
        v37 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v43];
        [v3 setObject:v37 forKeyedSubscript:@"kBTDeviceTypeMDCDevSpecKey"];

        ++v32;
      }
      while (v32 < v44);
    }
  }

  v38 = +[NSNumber numberWithBool:self->_isExtraLoggingEnabled];
  [v3 setObject:v38 forKeyedSubscript:@"kGHSPDebugLoggingEnabledKey"];

  return v3;
}

- (void)createGHSDeviceIfReady
{
  int deviceType = self->_deviceType;
  if (!self->_deviceType)
  {
    uint64_t v8 = [(GHSService *)self featuresCharacteristic];
    if (!v8) {
      return;
    }
    id v39 = (id)v8;
    v2 = [(GHSService *)self featuresCharacteristic];
    uint64_t v9 = [v2 value];
    if (!v9)
    {

      return;
    }
    v3 = (void *)v9;
  }
  objc_super v6 = [(GHSService *)self liveObservationCharacteristic];
  if (v6)
  {
    BOOL isUDSConsentGranted = self->_isUDSConsentGranted;
  }
  else
  {
    __int16 v10 = [(GHSService *)self storedObservationCharacteristic];
    if (v10) {
      BOOL isUDSConsentGranted = self->_isUDSConsentGranted;
    }
    else {
      BOOL isUDSConsentGranted = 0;
    }
  }
  if (deviceType)
  {
    if (!isUDSConsentGranted) {
      return;
    }
  }
  else
  {

    if (!isUDSConsentGranted) {
      return;
    }
  }
  v11 = [(GHSService *)self ghsDeviceProperties];
  v12 = [(GHSService *)self ghsDevice];

  if (!v12)
  {
    v13 = +[GHSBluetoothDevice ghsDeviceWithProperties:v11];
    [(GHSService *)self setGhsDevice:v13];

    v14 = [(GHSService *)self ghsDevice];

    if (v14)
    {
      v15 = [(ClientService *)self peripheral];
      v16 = [(GHSService *)self ghsDevice];
      [v16 setPeripheral:v15];

      v17 = [(ClientService *)self peripheral];
      v18 = [v17 customProperty:@"UserSelectedHealthDataSyncConfig"];

      if (!self->_lastSyncedRecordNum)
      {
        v19 = [(ClientService *)self peripheral];
        objc_super v20 = [v19 customProperty:@"HealthDataSyncLastStoredRecordNumber"];

        if (v20)
        {
          id v21 = objc_alloc_init((Class)NSNumberFormatter);
          [v21 setNumberStyle:1];
          v22 = [v21 numberFromString:v20];
          v23 = v22;
          if (v22)
          {
            self->_lastSyncedRecordNum = [v22 unsignedIntValue];
          }
          else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            sub_10006EFE4();
          }
        }
      }
      unsigned int v32 = [(GHSService *)self liveObservationCharacteristic];

      unsigned int v33 = [v18 isEqualToString:@"HealthDataSyncAlways"];
      if (v32)
      {
        if ((v33 & 1) != 0
          || [v18 isEqualToString:@"HealthDataSyncWithUserConfirm"])
        {
          [(GHSService *)self startLiveHealthObservation];
        }
      }
      else if (v33)
      {
        [(GHSService *)self retrieveStoredObservationsAfterRecordNumber:self->_lastSyncedRecordNum];
      }
      else if ([v18 isEqualToString:@"HealthDataSyncWithUserConfirm"])
      {
        [(GHSService *)self retrieveLastStoredObservation];
      }
      v34 = +[NSNotificationCenter defaultCenter];
      v35 = [(ClientService *)self peripheral];
      [v34 postNotificationName:@"PeerIsUsingBuiltinServiceNotification" object:v35];

      v36 = [(GHSService *)self connectionIdleTimer];
      [v36 invalidate];

      v37 = [(GHSService *)self ghsDevice];
      v38 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "connectionIdleTimeout", 0, 0, (double)[v37 linkIdleTimeout]);
      [(GHSService *)self setConnectionIdleTimer:v38];

      [(ClientService *)self notifyDidStart];
    }
    else
    {
      long long v24 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006EFAC(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
}

- (void)startLiveHealthObservation
{
  uint64_t v3 = [(GHSService *)self liveObservationCharacteristic];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(GHSService *)self ghsControlPointCharacteristic];

    if (v5)
    {
      char v9 = 1;
      objc_super v6 = +[NSData dataWithBytesNoCopy:&v9 length:1 freeWhenDone:0];
      v7 = [(ClientService *)self peripheral];
      uint64_t v8 = [(GHSService *)self ghsControlPointCharacteristic];
      [v7 writeValue:v6 forCharacteristic:v8 type:0];
    }
  }
}

- (void)stopLiveHealthObservation
{
  uint64_t v3 = [(GHSService *)self liveObservationCharacteristic];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(GHSService *)self ghsControlPointCharacteristic];

    if (v5)
    {
      char v9 = 2;
      objc_super v6 = +[NSData dataWithBytesNoCopy:&v9 length:1 freeWhenDone:0];
      v7 = [(ClientService *)self peripheral];
      uint64_t v8 = [(GHSService *)self ghsControlPointCharacteristic];
      [v7 writeValue:v6 forCharacteristic:v8 type:0];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  char v9 = v8;
  if (a5) {
    goto LABEL_50;
  }
  v66 = v8;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  __int16 v10 = [a4 characteristics];
  id v11 = [v10 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (!v11) {
    goto LABEL_37;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v68;
  uint64_t v65 = CBUUIDHealthSensorFeaturesCharacteristicString;
  uint64_t v63 = CBUUIDStoredHealthObservationsCharacteristicString;
  uint64_t v64 = CBUUIDLiveHealthObservationsCharacteristicString;
  uint64_t v61 = CBUUIDGHSControlPointCharacteristicString;
  uint64_t v62 = CBUUIDRACPCharacteristicString;
  uint64_t v60 = CBUUIDObservationScheduleChangedCharacteristicString;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v68 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      v16 = [(GHSService *)self featuresCharacteristic];
      if (v16)
      {
      }
      else
      {
        v17 = [v15 UUID];
        v18 = +[CBUUID UUIDWithString:v65];
        unsigned int v19 = [v17 isEqual:v18];

        if (v19)
        {
          [(GHSService *)self setFeaturesCharacteristic:v15];
          [v66 readValueForCharacteristic:v15];
          continue;
        }
      }
      objc_super v20 = [(GHSService *)self liveObservationCharacteristic];
      if (v20)
      {
      }
      else
      {
        id v21 = [v15 UUID];
        v22 = +[CBUUID UUIDWithString:v64];
        unsigned int v23 = [v21 isEqual:v22];

        if (v23)
        {
          [(GHSService *)self setLiveObservationCharacteristic:v15];
          goto LABEL_19;
        }
      }
      long long v24 = [(GHSService *)self storedObservationCharacteristic];
      if (v24)
      {

        goto LABEL_21;
      }
      uint64_t v25 = [v15 UUID];
      uint64_t v26 = +[CBUUID UUIDWithString:v63];
      unsigned int v27 = [v25 isEqual:v26];

      if (v27)
      {
        [(GHSService *)self setStoredObservationCharacteristic:v15];
LABEL_19:
        if (([v15 properties] & 0x10) == 0)
        {
LABEL_33:
          if (([v15 properties] & 0x20) == 0) {
            continue;
          }
        }
        [v66 setNotifyValue:1 forCharacteristic:v15];
        continue;
      }
LABEL_21:
      uint64_t v28 = [(GHSService *)self racpCharacteristic];
      if (v28)
      {

        goto LABEL_25;
      }
      uint64_t v29 = [v15 UUID];
      uint64_t v30 = +[CBUUID UUIDWithString:v62];
      unsigned int v31 = [v29 isEqual:v30];

      if (v31)
      {
        [(GHSService *)self setRacpCharacteristic:v15];
        goto LABEL_33;
      }
LABEL_25:
      unsigned int v32 = [(GHSService *)self ghsControlPointCharacteristic];
      if (v32)
      {

        goto LABEL_29;
      }
      unsigned int v33 = [v15 UUID];
      v34 = +[CBUUID UUIDWithString:v61];
      unsigned int v35 = [v33 isEqual:v34];

      if (v35)
      {
        [(GHSService *)self setGhsControlPointCharacteristic:v15];
        goto LABEL_33;
      }
LABEL_29:
      v36 = [(GHSService *)self observationScheduleChangedCharacteristic];
      if (v36)
      {

        continue;
      }
      v37 = [v15 UUID];
      v38 = +[CBUUID UUIDWithString:v60];
      unsigned int v39 = [v37 isEqual:v38];

      if (v39)
      {
        [(GHSService *)self setObservationScheduleChangedCharacteristic:v15];
        goto LABEL_33;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v67 objects:v79 count:16];
  }
  while (v12);
LABEL_37:

  if (!self->_deviceType)
  {
    long long v40 = [(ClientService *)self peripheral];
    long long v41 = [v40 customProperty:@"GHSDeviceType"];

    if (v41)
    {
      id v42 = objc_alloc_init((Class)NSNumberFormatter);
      [v42 setNumberStyle:1];
      unsigned int v43 = [v42 numberFromString:v41];
      __int16 v44 = v43;
      if (v43)
      {
        self->_int deviceType = (unsigned __int16)[v43 intValue];
        v45 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = v45;
          __int16 v47 = [(ClientService *)self peripheral];
          v48 = [v47 name];
          int deviceType = self->_deviceType;
          *(_DWORD *)buf = 138544131;
          CFStringRef v72 = @"GHSDeviceType";
          __int16 v73 = 2160;
          uint64_t v74 = 1752392040;
          __int16 v75 = 2113;
          v76 = v48;
          __int16 v77 = 1024;
          int v78 = deviceType;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Read property \"%{public}@\" from \"%{private, mask.hash}@\" = “%d”", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_10006F0CC();
      }
    }
  }
  unsigned int v50 = [(GHSService *)self liveObservationCharacteristic];
  if (v50)
  {

    char v9 = v66;
    goto LABEL_49;
  }
  __int16 v51 = [(GHSService *)self storedObservationCharacteristic];

  char v9 = v66;
  if (v51)
  {
LABEL_49:
    [(GHSService *)self createGHSDeviceIfReady];
  }
  else
  {
    int v52 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F094(v52, v53, v54, v55, v56, v57, v58, v59);
    }
  }
LABEL_50:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v17 = v7;
    id v8 = [(GHSService *)self featuresCharacteristic];

    if (v8 == v17)
    {
      [(GHSService *)self extractHealthSensorFeatures];
      [(GHSService *)self createGHSDeviceIfReady];
    }
    else
    {
      id v9 = [(GHSService *)self liveObservationCharacteristic];

      if (v9 == v17)
      {
        [(GHSService *)self extractLiveHealthObservation];
      }
      else
      {
        id v10 = [(GHSService *)self storedObservationCharacteristic];

        if (v10 == v17)
        {
          [(GHSService *)self extractStoredHealthObservation];
        }
        else
        {
          id v11 = [(GHSService *)self racpCharacteristic];

          if (v11 == v17)
          {
            [(GHSService *)self extractRACPResponse];
          }
          else
          {
            id v12 = [(GHSService *)self observationScheduleChangedCharacteristic];

            if (v12 == v17)
            {
              [(GHSService *)self extractObservationScheduleChanged];
            }
            else
            {
              id v13 = [(GHSService *)self ghsControlPointCharacteristic];

              if (v13 == v17) {
                [(GHSService *)self extractGHSControlPointResponse];
              }
            }
          }
        }
      }
    }
    v14 = [(GHSService *)self connectionIdleTimer];
    [v14 invalidate];

    v15 = [(GHSService *)self ghsDevice];
    v16 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "connectionIdleTimeout", 0, 0, (double)[v15 linkIdleTimeout]);
    [(GHSService *)self setConnectionIdleTimer:v16];

    id v7 = v17;
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006F17C();
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F224();
    }
    id v11 = [(GHSService *)self racpCharacteristic];

    if (v11 == v9)
    {
      self->_currentRACPOpCode = -1;
      self->_isRACPInProgress = 0;
    }
  }
}

- (BOOL)getDebugLoggingEnabled
{
  v2 = (void *)CFPreferencesCopyAppValue(@"GHSP", @"com.apple.MobileBluetooth.debug");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 objectForKey:@"GHSPEnableLogging"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v4 = [v3 BOOLValue];
    }
    else {
      unsigned __int8 v4 = 0;
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)extractGHSControlPointResponse
{
  v2 = [(GHSService *)self ghsControlPointCharacteristic];
  uint64_t v3 = [v2 value];
  unsigned __int8 v4 = +[DataInputStream inputStreamWithData:v3];

  unsigned __int8 v14 = 0;
  if ([v4 readUint8:&v14])
  {
    v5 = qword_1000CD178;
    if (v14 == 128)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GHS control point success response received", v13, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_10006F2CC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)extractHealthSensorFeatures
{
  uint64_t v3 = [(GHSService *)self liveObservationCharacteristic];
  unsigned __int8 v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  __int16 v23 = 0;
  [v5 readUint8:(char *)&v23 + 1];
  if ([v5 readUint8:&v23]) {
    BOOL v7 = v23 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    unsigned int v8 = 0;
    *(void *)&long long v6 = 141558531;
    long long v19 = v6;
    do
    {
      int v22 = 0;
      [v5 readUint32:&v22 v19];
      uint64_t v9 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        uint64_t v11 = [(ClientService *)self peripheral];
        uint64_t v12 = [v11 name];
        *(_DWORD *)buf = v19;
        uint64_t v25 = 1752392040;
        __int16 v26 = 2113;
        unsigned int v27 = v12;
        __int16 v28 = 1024;
        int v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": observationType %u", buf, 0x1Cu);
      }
      ++v8;
    }
    while (v8 < v23);
  }
  if ((v23 & 0x100) != 0 && [v5 readUint8:&v23] && (_BYTE)v23)
  {
    unsigned int v14 = 0;
    *(void *)&long long v13 = 141558787;
    long long v20 = v13;
    do
    {
      LOWORD(v22) = 0;
      unsigned __int8 v21 = 0;
      [v5 readUint16:&v22 v20];
      [v5 readUint8:&v21];
      v15 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        id v17 = [(ClientService *)self peripheral];
        v18 = [v17 name];
        *(_DWORD *)buf = v20;
        uint64_t v25 = 1752392040;
        __int16 v26 = 2113;
        unsigned int v27 = v18;
        __int16 v28 = 1024;
        int v29 = (unsigned __int16)v22;
        __int16 v30 = 1024;
        int v31 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Health Sensor Features for peripheral \"%{private, mask.hash}@\": deviceType %u, version %u", buf, 0x22u);
      }
      ++v14;
    }
    while (v14 < v23);
  }
}

- (void)extractHealthObservationBodySegmentFromData:(id)a3 isLive:(BOOL)a4
{
  BOOL v104 = a4;
  id v102 = a3;
  unsigned __int8 v4 = +[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:");
  unsigned __int8 v115 = 0;
  unsigned __int16 v114 = 0;
  unsigned __int16 v113 = 0;
  unsigned int v111 = 0;
  unsigned int v112 = -1;
  unsigned __int8 v110 = 0;
  v103 = +[NSDate date];
  if ([v4 readUint8:&v115])
  {
    v5 = (id)qword_1000CD178;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        long long v6 = "Live";
      }
      else {
        long long v6 = "Stored";
      }
      BOOL v7 = [(ClientService *)self peripheral];
      unsigned int v8 = [v7 name];
      *(_DWORD *)buf = 136315907;
      v117 = v6;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v8;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v115;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": classType %u", buf, 0x26u);
    }
  }
  if ([v4 readUint16:&v114])
  {
    uint64_t v9 = (id)qword_1000CD178;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        uint64_t v10 = "Live";
      }
      else {
        uint64_t v10 = "Stored";
      }
      uint64_t v11 = [(ClientService *)self peripheral];
      uint64_t v12 = [v11 name];
      *(_DWORD *)buf = 136315907;
      v117 = v10;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v12;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v114;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": len %u", buf, 0x26u);
    }
  }
  if ([v4 readUint16:&v113])
  {
    long long v13 = (id)qword_1000CD178;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        unsigned int v14 = "Live";
      }
      else {
        unsigned int v14 = "Stored";
      }
      v15 = [(ClientService *)self peripheral];
      v16 = [v15 name];
      *(_DWORD *)buf = 136315907;
      v117 = v14;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v16;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v113;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": flags %u", buf, 0x26u);
    }
  }
  if (v113)
  {
    if ([v4 readUint32:&v112])
    {
      v18 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104) {
          long long v19 = "Live";
        }
        else {
          long long v19 = "Stored";
        }
        long long v20 = v18;
        unsigned __int8 v21 = [(ClientService *)self peripheral];
        int v22 = [v21 name];
        *(_DWORD *)buf = 136315907;
        v117 = v19;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v22;
        __int16 v122 = 1024;
        *(_DWORD *)v123 = v112;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": observationType %d", buf, 0x26u);
      }
    }
  }
  else
  {
    id v17 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F304(v104, &v113, v17);
    }
  }
  char v23 = v113;
  if ((v113 & 2) != 0)
  {
    id v24 = objc_alloc_init((Class)NSMutableData);
    [v4 readNumBytes:9 toData:v24];
    uint64_t v25 = [(ClientService *)self manager];
    __int16 v26 = +[CBUUID UUIDWithString:CBUUIDElapsedTimeServiceString];
    unsigned int v27 = [v25 clientServiceForUUID:v26];

    if (v27)
    {
      uint64_t v28 = [v27 dateWithElapsedTimeData:v24];

      int v29 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104) {
          __int16 v30 = "Live";
        }
        else {
          __int16 v30 = "Stored";
        }
        int v31 = v29;
        unsigned int v32 = [(ClientService *)self peripheral];
        unsigned int v33 = [v32 name];
        *(_DWORD *)buf = 136315907;
        v117 = v30;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v33;
        __int16 v122 = 2112;
        *(void *)v123 = v24;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": timeData %@", buf, 0x2Au);
      }
    }
    else
    {
      v34 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        if (v104) {
          v98 = "Live";
        }
        else {
          v98 = "Stored";
        }
        v99 = v34;
        v100 = [(ClientService *)self peripheral];
        v101 = [v100 name];
        *(_DWORD *)buf = 136315907;
        v117 = v98;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v101;
        __int16 v122 = 2112;
        *(void *)v123 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%s Health Observation for peripheral \"%{private, mask.hash}@\": timeData %@ without ETS", buf, 0x2Au);
      }
      uint64_t v28 = (uint64_t)v103;
    }

    char v23 = v113;
    v103 = (void *)v28;
    if ((v113 & 4) == 0)
    {
LABEL_33:
      if ((v23 & 8) == 0) {
        goto LABEL_34;
      }
      goto LABEL_52;
    }
  }
  else if ((v113 & 4) == 0)
  {
    goto LABEL_33;
  }
  int v109 = 0;
  if ([v4 readUint32:&v109])
  {
    unsigned int v35 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        v36 = "Live";
      }
      else {
        v36 = "Stored";
      }
      v37 = v35;
      v38 = [(ClientService *)self peripheral];
      unsigned int v39 = [v38 name];
      *(_DWORD *)buf = 136315907;
      v117 = v36;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v39;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v109;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": measurementDuration %u", buf, 0x26u);
    }
  }
  char v23 = v113;
  if ((v113 & 8) == 0)
  {
LABEL_34:
    if ((v23 & 0x10) == 0) {
      goto LABEL_65;
    }
    goto LABEL_59;
  }
LABEL_52:
  LOWORD(v109) = 0;
  if ([v4 readUint16:&v109])
  {
    long long v40 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        long long v41 = "Live";
      }
      else {
        long long v41 = "Stored";
      }
      id v42 = v40;
      unsigned int v43 = [(ClientService *)self peripheral];
      __int16 v44 = [v43 name];
      *(_DWORD *)buf = 136315907;
      v117 = v41;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v44;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = (unsigned __int16)v109;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": measurementStatus %u", buf, 0x26u);
    }
  }
  if ((v113 & 0x10) != 0)
  {
LABEL_59:
    if ([v4 readUint32:&v111])
    {
      v45 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104) {
          uint64_t v46 = "Live";
        }
        else {
          uint64_t v46 = "Stored";
        }
        __int16 v47 = v45;
        v48 = [(ClientService *)self peripheral];
        __int16 v49 = [v48 name];
        *(_DWORD *)buf = 136315907;
        v117 = v46;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v49;
        __int16 v122 = 1024;
        *(_DWORD *)v123 = v111;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": observationId %u", buf, 0x26u);
      }
    }
  }
LABEL_65:
  if ((v113 & 0x20) != 0)
  {
    if ([v4 readUint8:&v110])
    {
      unsigned int v50 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        if (v104) {
          __int16 v51 = "Live";
        }
        else {
          __int16 v51 = "Stored";
        }
        int v52 = v50;
        uint64_t v53 = [(ClientService *)self peripheral];
        uint64_t v54 = [v53 name];
        *(_DWORD *)buf = 136315907;
        v117 = v51;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v54;
        __int16 v122 = 1024;
        *(_DWORD *)v123 = v110;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": userId %u", buf, 0x26u);
      }
    }
  }
  unsigned __int16 v55 = v113;
  if ((v113 & 0x40) != 0)
  {
    LOBYTE(v107) = 0;
    int v109 = 0;
    if ([v4 readUint8:&v107])
    {
      uint64_t v56 = (id)qword_1000CD178;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        if (v104) {
          uint64_t v57 = "Live";
        }
        else {
          uint64_t v57 = "Stored";
        }
        uint64_t v58 = [(ClientService *)self peripheral];
        uint64_t v59 = [v58 name];
        *(_DWORD *)buf = 136315907;
        v117 = v57;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v59;
        __int16 v122 = 1024;
        *(_DWORD *)v123 = v107;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);
      }
    }
    if ((_BYTE)v107)
    {
      unsigned int v60 = 0;
      if (v104) {
        uint64_t v61 = "Live";
      }
      else {
        uint64_t v61 = "Stored";
      }
      do
      {
        if ([v4 readUint32:&v109])
        {
          uint64_t v62 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v63 = v62;
            uint64_t v64 = [(ClientService *)self peripheral];
            uint64_t v65 = [v64 name];
            *(_DWORD *)buf = 136315907;
            v117 = v61;
            __int16 v118 = 2160;
            uint64_t v119 = 1752392040;
            __int16 v120 = 2113;
            v121 = v65;
            __int16 v122 = 1024;
            *(_DWORD *)v123 = v109;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": derivedObservationId %u", buf, 0x26u);
          }
        }
        ++v60;
      }
      while (v60 < v107);
    }
    unsigned __int16 v55 = v113;
    if ((v113 & 0x80) == 0)
    {
LABEL_74:
      if ((v55 & 0x100) == 0) {
        goto LABEL_75;
      }
      goto LABEL_109;
    }
  }
  else if ((v113 & 0x80) == 0)
  {
    goto LABEL_74;
  }
  LOBYTE(v107) = 0;
  int v109 = 0;
  if ([v4 readUint8:&v107])
  {
    v66 = (id)qword_1000CD178;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        long long v67 = "Live";
      }
      else {
        long long v67 = "Stored";
      }
      long long v68 = [(ClientService *)self peripheral];
      long long v69 = [v68 name];
      *(_DWORD *)buf = 136315907;
      v117 = v67;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v69;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v107;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);
    }
  }
  if ((_BYTE)v107)
  {
    unsigned int v70 = 0;
    if (v104) {
      v71 = "Live";
    }
    else {
      v71 = "Stored";
    }
    do
    {
      if ([v4 readUint32:&v109])
      {
        CFStringRef v72 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v73 = v72;
          uint64_t v74 = [(ClientService *)self peripheral];
          __int16 v75 = [v74 name];
          *(_DWORD *)buf = 136315907;
          v117 = v71;
          __int16 v118 = 2160;
          uint64_t v119 = 1752392040;
          __int16 v120 = 2113;
          v121 = v75;
          __int16 v122 = 1024;
          *(_DWORD *)v123 = v109;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": derivedObservationId %u", buf, 0x26u);
        }
      }
      ++v70;
    }
    while (v70 < v107);
  }
  unsigned __int16 v55 = v113;
  if ((v113 & 0x100) == 0)
  {
LABEL_75:
    if ((v55 & 0x200) == 0) {
      goto LABEL_140;
    }
    goto LABEL_125;
  }
LABEL_109:
  LOBYTE(v107) = 0;
  int v109 = 0;
  if ([v4 readUint8:&v107])
  {
    v76 = (id)qword_1000CD178;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      if (v104) {
        __int16 v77 = "Live";
      }
      else {
        __int16 v77 = "Stored";
      }
      int v78 = [(ClientService *)self peripheral];
      v79 = [v78 name];
      *(_DWORD *)buf = 136315907;
      v117 = v77;
      __int16 v118 = 2160;
      uint64_t v119 = 1752392040;
      __int16 v120 = 2113;
      v121 = v79;
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v107;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);
    }
  }
  if ((_BYTE)v107)
  {
    unsigned int v80 = 0;
    if (v104) {
      v81 = "Live";
    }
    else {
      v81 = "Stored";
    }
    do
    {
      if ([v4 readUint32:&v109])
      {
        v82 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          v83 = v82;
          v84 = [(ClientService *)self peripheral];
          v85 = [v84 name];
          *(_DWORD *)buf = 136315907;
          v117 = v81;
          __int16 v118 = 2160;
          uint64_t v119 = 1752392040;
          __int16 v120 = 2113;
          v121 = v85;
          __int16 v122 = 1024;
          *(_DWORD *)v123 = v109;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%s Health Observation for peripheral \"%{private, mask.hash}@\": IsMemberOfObservationId %u", buf, 0x26u);
        }
      }
      ++v80;
    }
    while (v80 < v107);
  }
  if ((v113 & 0x200) != 0)
  {
LABEL_125:
    unsigned __int8 v108 = 0;
    int v109 = 0;
    unsigned __int16 v107 = 0;
    char v106 = 0;
    id v86 = objc_alloc_init((Class)NSMutableData);
    if ([v4 readUint8:&v108])
    {
      v87 = (id)qword_1000CD178;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        if (v104) {
          v88 = "Live";
        }
        else {
          v88 = "Stored";
        }
        v89 = [(ClientService *)self peripheral];
        v90 = [v89 name];
        *(_DWORD *)buf = 136315907;
        v117 = v88;
        __int16 v118 = 2160;
        uint64_t v119 = 1752392040;
        __int16 v120 = 2113;
        v121 = v90;
        __int16 v122 = 1024;
        *(_DWORD *)v123 = v108;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%s Health Observation TLVs for peripheral \"%{private, mask.hash}@\": numOfItems %u", buf, 0x26u);
      }
    }
    if (v108)
    {
      unsigned int v91 = 0;
      if (v104) {
        v92 = "Live";
      }
      else {
        v92 = "Stored";
      }
      do
      {
        [v4 readUint32:&v109];
        [v4 readUint16:&v107];
        [v4 readUint8:&v106];
        [v4 readNumBytes:v114 toData:v86];
        v93 = (id)qword_1000CD178;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = [(ClientService *)self peripheral];
          v95 = [v94 name];
          *(_DWORD *)buf = 136316419;
          v117 = v92;
          __int16 v118 = 2160;
          uint64_t v119 = 1752392040;
          __int16 v120 = 2113;
          v121 = v95;
          __int16 v122 = 1024;
          *(_DWORD *)v123 = v91;
          *(_WORD *)&v123[4] = 1024;
          *(_DWORD *)&v123[6] = v109;
          __int16 v124 = 1024;
          int v125 = v107;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%s Health Observation TLVs for peripheral \"%{private, mask.hash}@\": item # %u type %d length %d", buf, 0x32u);
        }
        ++v91;
      }
      while (v91 < v108);
    }
  }
LABEL_140:
  v96 = [(GHSService *)self ghsDevice];
  v97 = v96;
  if (v104) {
    [v96 handleLiveHealthObservationsData:v4 observationClassType:v115 observationType:v112 userID:v110 observationID:v111 timestamp:v103];
  }
  else {
    [v96 handleStoredHealthObservationsData:v4 observationClassType:v115 observationType:v112 userID:v110 observationID:v111 timestamp:v103];
  }
}

- (void)extractLiveHealthObservation
{
  uint64_t v3 = [(GHSService *)self liveObservationCharacteristic];
  unsigned __int8 v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4 byteOrder:1];

  long long v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v6;
    unsigned int v8 = [(ClientService *)self peripheral];
    uint64_t v9 = [v8 name];
    *(_DWORD *)buf = 141558531;
    uint64_t v24 = 1752392040;
    __int16 v25 = 2113;
    uint64_t v26 = (uint64_t)v9;
    __int16 v27 = 2112;
    *(void *)uint64_t v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Live Health Observation for peripheral \"%{private, mask.hash}@\": rawDataBytes %@", buf, 0x20u);
  }
  uint64_t v10 = [(GHSService *)self liveObservationCharacteristic];
  uint64_t v11 = [v10 value];
  unsigned int v12 = [v11 length];

  unsigned __int8 v22 = 0;
  if ([v5 readUint8:&v22])
  {
    unsigned int v13 = v22;
    uint64_t v14 = v12 - 1;
    v15 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      id v17 = [(ClientService *)self peripheral];
      uint64_t v18 = [v17 name];
      long long v19 = (void *)v18;
      long long v20 = "Y";
      *(_DWORD *)buf = 141559555;
      uint64_t v24 = 1752392040;
      __int16 v25 = 2113;
      if (v13) {
        unsigned __int8 v21 = "Y";
      }
      else {
        unsigned __int8 v21 = "N";
      }
      uint64_t v26 = v18;
      if ((v13 & 2) == 0) {
        long long v20 = "N";
      }
      __int16 v27 = 1024;
      *(_DWORD *)uint64_t v28 = v22;
      *(_WORD *)&v28[4] = 2080;
      *(void *)&v28[6] = v21;
      __int16 v29 = 2080;
      __int16 v30 = v20;
      __int16 v31 = 1024;
      unsigned int v32 = v13 >> 2;
      __int16 v33 = 1024;
      int v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Live Health Observation for peripheral \"%{private, mask.hash}@\": header %u, firstSeg %s, lastSeg %s, segCount %u, len %u", buf, 0x3Cu);
    }
    if (v13) {
      [(NSMutableData *)self->_liveObservationData setLength:0];
    }
    [v5 readNumBytes:v14 toData:self->_liveObservationData];
    if ((v13 & 2) != 0) {
      [(GHSService *)self extractHealthObservationBodySegmentFromData:self->_liveObservationData isLive:1];
    }
  }
}

- (void)extractStoredHealthObservation
{
  uint64_t v3 = [(GHSService *)self storedObservationCharacteristic];
  unsigned __int8 v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4 byteOrder:1];

  if (self->_isExtraLoggingEnabled)
  {
    long long v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = v6;
      unsigned int v8 = [(ClientService *)self peripheral];
      uint64_t v9 = [v8 name];
      *(_DWORD *)buf = 141558531;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2113;
      uint64_t v31 = (uint64_t)v9;
      __int16 v32 = 2112;
      *(void *)__int16 v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": rawDataBytes %@", buf, 0x20u);
    }
  }
  unsigned __int8 v27 = 0;
  unsigned int v26 = 0;
  uint64_t v10 = [(GHSService *)self storedObservationCharacteristic];
  uint64_t v11 = [v10 value];
  unsigned int v12 = [v11 length];

  if ([v5 readUint8:&v27])
  {
    unsigned int v13 = v27;
    uint64_t v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = [(ClientService *)self peripheral];
      uint64_t v17 = [v16 name];
      uint64_t v18 = (void *)v17;
      long long v19 = "Y";
      *(_DWORD *)buf = 141559299;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2113;
      if (v13) {
        long long v20 = "Y";
      }
      else {
        long long v20 = "N";
      }
      uint64_t v31 = v17;
      if ((v13 & 2) == 0) {
        long long v19 = "N";
      }
      __int16 v32 = 1024;
      *(_DWORD *)__int16 v33 = v27;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = v20;
      __int16 v34 = 2080;
      unsigned int v35 = v19;
      __int16 v36 = 1024;
      unsigned int v37 = v13 >> 2;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": header %u, firstSeg %s, lastSeg %s, segCount %u", buf, 0x36u);
    }
    if (v13)
    {
      if ([v5 readUint32:&v26])
      {
        unsigned __int8 v22 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          char v23 = v22;
          uint64_t v24 = [(ClientService *)self peripheral];
          __int16 v25 = [v24 name];
          *(_DWORD *)buf = 141558531;
          uint64_t v29 = 1752392040;
          __int16 v30 = 2113;
          uint64_t v31 = (uint64_t)v25;
          __int16 v32 = 1024;
          *(_DWORD *)__int16 v33 = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": recordNum %u", buf, 0x1Cu);
        }
        self->_lastSyncedRecordNum = v26;
      }
      [(NSMutableData *)self->_storedObservationData setLength:0];
      uint64_t v21 = v12 - 5;
    }
    else
    {
      uint64_t v21 = v12 - 1;
    }
    [v5 readNumBytes:v21 toData:self->_storedObservationData];
    if ((v13 & 2) != 0) {
      [(GHSService *)self extractHealthObservationBodySegmentFromData:self->_storedObservationData isLive:0];
    }
  }
}

- (void)extractRACPResponse
{
  __int16 v30 = 0;
  uint64_t v3 = [(GHSService *)self racpCharacteristic];
  unsigned __int8 v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4 byteOrder:1];

  if (([v5 readUint8:(char *)&v30 + 1] & 1) == 0)
  {
    long long v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F468(v6);
    }
  }
  if ([v5 readUint8:&v30]) {
    BOOL v7 = v30 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    unsigned int v8 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      char v23 = v8;
      uint64_t v24 = [(ClientService *)self peripheral];
      __int16 v25 = [v24 name];
      *(_DWORD *)buf = 141558787;
      uint64_t v32 = 1752392040;
      __int16 v33 = 2113;
      __int16 v34 = v25;
      __int16 v35 = 1024;
      int v36 = HIBYTE(v30);
      __int16 v37 = 1024;
      int v38 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "RACP response for peripheral \"%{private, mask.hash}@\": opCode %u, operator %u", buf, 0x22u);
    }
  }
  if (HIBYTE(v30) == 5)
  {
    if (self->_currentRACPOpCode != 4)
    {
LABEL_22:
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006F3A8();
      }
      goto LABEL_32;
    }
    self->_currentRACPOpCode = -1;
    self->_isRACPInProgress = 0;
    int v29 = 0;
    if ([v5 readUint32:&v29])
    {
      v15 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        uint64_t v17 = [(ClientService *)self peripheral];
        uint64_t v18 = [v17 name];
        *(_DWORD *)buf = 141558531;
        uint64_t v32 = 1752392040;
        __int16 v33 = 2113;
        __int16 v34 = v18;
        __int16 v35 = 1024;
        int v36 = v29;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "RACP response for peripheral \"%{private, mask.hash}@\": numOfRecord %d", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (HIBYTE(v30) != 6)
    {
      if (HIBYTE(v30) == 8 && self->_currentRACPOpCode == 7)
      {
        self->_currentRACPOpCode = -1;
        self->_isRACPInProgress = 0;
        int v29 = 0;
        if ([v5 readUint32:&v29])
        {
          uint64_t v9 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = v9;
            uint64_t v11 = [(ClientService *)self peripheral];
            unsigned int v12 = [v11 name];
            *(_DWORD *)buf = 141558531;
            uint64_t v32 = 1752392040;
            __int16 v33 = 2113;
            __int16 v34 = v12;
            __int16 v35 = 1024;
            int v36 = v29;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RACP response for peripheral \"%{private, mask.hash}@\": retrieved numOfRecord %d", buf, 0x1Cu);
          }
        }
        unsigned int v13 = [(ClientService *)self peripheral];
        uint64_t v14 = +[NSString stringWithFormat:@"%d", self->_lastSyncedRecordNum];
        [v13 setCustomProperty:@"HealthDataSyncLastStoredRecordNumber" value:v14];

        goto LABEL_32;
      }
      goto LABEL_22;
    }
    LOBYTE(v29) = 0;
    unsigned __int8 v28 = 0;
    if ([v5 readUint8:&v29] && v29 == self->_currentRACPOpCode)
    {
      if ([v5 readUint8:&v28])
      {
        if (v28)
        {
          long long v19 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            long long v20 = v19;
            uint64_t v21 = [(ClientService *)self peripheral];
            unsigned __int8 v22 = [v21 name];
            *(_DWORD *)buf = 141558787;
            uint64_t v32 = 1752392040;
            __int16 v33 = 2113;
            __int16 v34 = v22;
            __int16 v35 = 1024;
            int v36 = v29;
            __int16 v37 = 1024;
            int v38 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "RACP for peripheral \"%{private, mask.hash}@\" failed: opCode %d responseCode %d", buf, 0x22u);
          }
        }
        else if (self->_currentRACPOpCode == 1)
        {
          unsigned int v26 = [(ClientService *)self peripheral];
          unsigned __int8 v27 = +[NSString stringWithFormat:@"%d", self->_lastSyncedRecordNum];
          [v26 setCustomProperty:@"HealthDataSyncLastStoredRecordNumber" value:v27];
        }
        self->_currentRACPOpCode = -1;
        self->_isRACPInProgress = 0;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_10006F3A8();
    }
  }
LABEL_32:
}

- (void)retrieveStoredObservationsAfterRecordNumber:(unsigned int)a3
{
  unsigned __int8 v4 = (void *)qword_1000CD178;
  if (self->_isRACPInProgress)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F510(v4);
    }
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = v4;
      BOOL v7 = [(ClientService *)self peripheral];
      unsigned int v8 = [v7 name];
      int v20 = 141558275;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2113;
      char v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Request stored observation for peripheral \"%{private, mask.hash}@\"", (uint8_t *)&v20, 0x16u);
    }
    self->_isRACPInProgress = 1;
    self->_currentRACPOpCode = 7;
    if (v5) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 1;
    }
    uint64_t v10 = +[DataOutputStream outputStreamWithByteOrder:1];
    [v10 writeUint8:self->_currentRACPOpCode];
    [v10 writeUint8:v9];
    if (v5)
    {
      [v10 writeUint8:1];
      [v10 writeUint32:v5];
    }
    uint64_t v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = v11;
      unsigned int v13 = [(ClientService *)self peripheral];
      uint64_t v14 = [v13 name];
      v15 = [v10 data];
      id v16 = [v15 length];
      int v20 = 141559043;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2113;
      char v23 = v14;
      __int16 v24 = 1024;
      int v25 = v9;
      __int16 v26 = 1024;
      int v27 = v5;
      __int16 v28 = 2048;
      id v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "RACP Retrieve for peripheral \"%{private, mask.hash}@\" operator: %d | recordNum: %d | total len: %lu", (uint8_t *)&v20, 0x2Cu);
    }
    uint64_t v17 = [(ClientService *)self peripheral];
    uint64_t v18 = [v10 data];
    long long v19 = [(GHSService *)self racpCharacteristic];
    [v17 writeValue:v18 forCharacteristic:v19 type:0];
  }
}

- (void)retrieveLastStoredObservation
{
  uint64_t v3 = (void *)qword_1000CD178;
  if (self->_isRACPInProgress)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F5B8(v3);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v4 = v3;
      uint64_t v5 = [(ClientService *)self peripheral];
      long long v6 = [v5 name];
      int v17 = 141558275;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2113;
      int v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Request last stored observation for peripheral \"%{private, mask.hash}@\"", (uint8_t *)&v17, 0x16u);
    }
    self->_isRACPInProgress = 1;
    self->_currentRACPOpCode = 1;
    BOOL v7 = +[DataOutputStream outputStreamWithByteOrder:1];
    [v7 writeUint8:self->_currentRACPOpCode];
    [v7 writeUint8:6];
    unsigned int v8 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [(ClientService *)self peripheral];
      uint64_t v11 = [v10 name];
      unsigned int v12 = [v7 data];
      id v13 = [v12 length];
      int v17 = 141558787;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2113;
      int v20 = v11;
      __int16 v21 = 1024;
      int v22 = 6;
      __int16 v23 = 2048;
      id v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RACP Retrieve for peripheral \"%{private, mask.hash}@\" operator: %d | total len: %lu", (uint8_t *)&v17, 0x26u);
    }
    uint64_t v14 = [(ClientService *)self peripheral];
    v15 = [v7 data];
    id v16 = [(GHSService *)self racpCharacteristic];
    [v14 writeValue:v15 forCharacteristic:v16 type:0];
  }
}

- (void)deleteAllStoredObservation
{
  if (self->_isRACPInProgress)
  {
    uint64_t v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F660(v3);
    }
  }
  else
  {
    self->_isRACPInProgress = 1;
    self->_currentRACPOpCode = 2;
    unsigned __int8 v4 = +[DataOutputStream outputStreamWithByteOrder:1];
    [v4 writeUint8:2];
    [v4 writeUint8:1];
    uint64_t v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = v5;
      BOOL v7 = [(ClientService *)self peripheral];
      unsigned int v8 = [v7 name];
      uint64_t v9 = [v4 data];
      int v13 = 141558787;
      uint64_t v14 = 1752392040;
      __int16 v15 = 2113;
      id v16 = v8;
      __int16 v17 = 1024;
      int v18 = 1;
      __int16 v19 = 2048;
      id v20 = [v9 length];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RACP Delelte for peripheral \"%{private, mask.hash}@\" operator: %d | total len: %lu", (uint8_t *)&v13, 0x26u);
    }
    uint64_t v10 = [(ClientService *)self peripheral];
    uint64_t v11 = [v4 data];
    unsigned int v12 = [(GHSService *)self racpCharacteristic];
    [v10 writeValue:v11 forCharacteristic:v12 type:0];
  }
}

- (void)abortRACPRequest
{
  self->_isRACPInProgress = 1;
  self->_currentRACPOpCode = 3;
  uint64_t v3 = +[DataOutputStream outputStreamWithByteOrder:1];
  [v3 writeUint8:3];
  [v3 writeUint8:0];
  unsigned __int8 v4 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    long long v6 = [(ClientService *)self peripheral];
    BOOL v7 = [v6 name];
    unsigned int v8 = [v3 data];
    int v12 = 141558787;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2113;
    __int16 v15 = v7;
    __int16 v16 = 1024;
    int v17 = 0;
    __int16 v18 = 2048;
    id v19 = [v8 length];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RACP Abort for peripheral \"%{private, mask.hash}@\" operator: %d | total len: %lu", (uint8_t *)&v12, 0x26u);
  }
  uint64_t v9 = [(ClientService *)self peripheral];
  uint64_t v10 = [v3 data];
  uint64_t v11 = [(GHSService *)self racpCharacteristic];
  [v9 writeValue:v10 forCharacteristic:v11 type:0];
}

- (void)extractObservationScheduleChanged
{
  uint64_t v11 = 0;
  float v10 = 0.0;
  uint64_t v3 = [(GHSService *)self observationScheduleChangedCharacteristic];
  unsigned __int8 v4 = [v3 value];
  uint64_t v5 = +[DataInputStream inputStreamWithData:v4 byteOrder:1];

  [v5 readUint32:(char *)&v11 + 4];
  [v5 readIEEEFloat:&v11];
  [v5 readIEEEFloat:&v10];
  long long v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v6;
    unsigned int v8 = [(ClientService *)self peripheral];
    uint64_t v9 = [v8 name];
    *(_DWORD *)buf = 141559043;
    uint64_t v13 = 1752392040;
    __int16 v14 = 2113;
    __int16 v15 = v9;
    __int16 v16 = 1024;
    int v17 = HIDWORD(v11);
    __int16 v18 = 2048;
    double v19 = *(float *)&v11;
    __int16 v20 = 2048;
    double v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Observation schedule changed for peripheral \"%{private, mask.hash}@\" observationType %d measurementPeriod %f updateInterval %f", buf, 0x30u);
  }
}

- (void)connectionIdleTimeout
{
  uint64_t v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006F708(v3);
  }
  [(GHSService *)self stop];
  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = [(ClientService *)self peripheral];
  [v4 postNotificationName:@"PeerDidIdleTimeoutNotification" object:v5];
}

- (CBCharacteristic)featuresCharacteristic
{
  return self->_featuresCharacteristic;
}

- (void)setFeaturesCharacteristic:(id)a3
{
}

- (CBCharacteristic)liveObservationCharacteristic
{
  return self->_liveObservationCharacteristic;
}

- (void)setLiveObservationCharacteristic:(id)a3
{
}

- (CBCharacteristic)storedObservationCharacteristic
{
  return self->_storedObservationCharacteristic;
}

- (void)setStoredObservationCharacteristic:(id)a3
{
}

- (CBCharacteristic)racpCharacteristic
{
  return self->_racpCharacteristic;
}

- (void)setRacpCharacteristic:(id)a3
{
}

- (CBCharacteristic)ghsControlPointCharacteristic
{
  return self->_ghsControlPointCharacteristic;
}

- (void)setGhsControlPointCharacteristic:(id)a3
{
}

- (CBCharacteristic)observationScheduleChangedCharacteristic
{
  return self->_observationScheduleChangedCharacteristic;
}

- (void)setObservationScheduleChangedCharacteristic:(id)a3
{
}

- (GHSBluetoothDevice)ghsDevice
{
  return self->_ghsDevice;
}

- (void)setGhsDevice:(id)a3
{
}

- (NSTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (void)setConnectionIdleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong((id *)&self->_ghsDevice, 0);
  objc_storeStrong((id *)&self->_observationScheduleChangedCharacteristic, 0);
  objc_storeStrong((id *)&self->_ghsControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_racpCharacteristic, 0);
  objc_storeStrong((id *)&self->_storedObservationCharacteristic, 0);
  objc_storeStrong((id *)&self->_liveObservationCharacteristic, 0);
  objc_storeStrong((id *)&self->_featuresCharacteristic, 0);
  objc_storeStrong((id *)&self->_storedObservationData, 0);

  objc_storeStrong((id *)&self->_liveObservationData, 0);
}

@end