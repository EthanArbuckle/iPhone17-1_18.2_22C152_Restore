@interface CyclingPowerService
+ (id)UUID;
- ($871CC4E288729A363A5AD5845BFA35DE)featureFlags;
- (BOOL)isDistributed;
- (BOOL)isSensorLocationLeft;
- (BOOL)isSensorLocationRight;
- (BOOL)matchesDistributedService:(id)a3;
- (BOOL)sendDuplicateReadingsAsZero;
- (BOOL)sendZeroForDuplicates;
- (BOOL)supportsHKQuantityType:(id)a3;
- (CBCharacteristic)cyclingPowerControlPointCharacteristic;
- (CBCharacteristic)cyclingPowerFeatureCharacteristic;
- (CBCharacteristic)cyclingPowerMeasurementCharacteristic;
- (CBCharacteristic)cyclingPowerSensorLocationCharacteristic;
- (CBCharacteristic)cyclingPowerVectorCharacteristic;
- (HKDevice)comboHKDevice;
- (HKQuantityDatum)lastDistributedDatum;
- (double)powerBalanceForValue:(double)a3 otherService:(id)a4 otherValue:(double)a5;
- (double)wheelDiameterInInches;
- (id)getDeviceInformationService;
- (id)originatingHKDevice;
- (id)sensorLocationSideString;
- (id)sensorLocationString;
- (id)updateComboString:(id)a3 withValue:(id)a4;
- (void)collectData:(BOOL)a3;
- (void)createDistributedHKDeviceWithSecondary:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readWheelSize;
- (void)receiveDeviceInfoUpdateNotification:(id)a3;
- (void)setComboHKDevice:(id)a3;
- (void)setCyclingPowerControlPointCharacteristic:(id)a3;
- (void)setCyclingPowerFeatureCharacteristic:(id)a3;
- (void)setCyclingPowerMeasurementCharacteristic:(id)a3;
- (void)setCyclingPowerSensorLocationCharacteristic:(id)a3;
- (void)setCyclingPowerVectorCharacteristic:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setLastDistributedDatum:(id)a3;
- (void)setSendZeroForDuplicates:(BOOL)a3;
- (void)setWheelDiameterInInches:(double)a3;
- (void)start;
- (void)updateForSensorLocation;
- (void)updateZeroDuplicateValues;
- (void)updatedCadenceMeasurementValueForRevolutions:(unsigned __int16)a3 andCrankEventTime:(unsigned __int16)a4 timeStamp:(id)a5;
- (void)updatedFeatureCharacteristicValue;
- (void)updatedMeasurementCharacteristicValue:(id)a3 at:(id)a4;
- (void)updatedPowerMeasurementValue:(id *)a3 timeStamp:(id)a4;
- (void)updatedSensorLocationCharacteristicValue;
- (void)updatedSpeedMeasurementValueForRevolutions:(unsigned int)a3 andWheelEventTime:(unsigned __int16)a4 timeStamp:(id)a5;
- (void)updatedVectorCharacteristicValue;
@end

@implementation CyclingPowerService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDCyclingPowerServiceString];
}

- (void)updateZeroDuplicateValues
{
}

- (void)readWheelSize
{
  v3 = [(ClientService *)self peripheral];
  v4 = [v3 customProperty:@"wheelCircumferenceMM"];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSNumberFormatter);
    [v5 setNumberStyle:1];
    v6 = [v5 numberFromString:v4];
    v7 = v6;
    if (v6)
    {
      self->_wheelDiameterInInches = (double)(int)[v6 intValue] * 0.0125318853;
    }
    else
    {
      v8 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006E480(v8, self);
      }
    }
  }
}

- (BOOL)sendDuplicateReadingsAsZero
{
  return 1;
}

- (void)start
{
  v11.receiver = self;
  v11.super_class = (Class)CyclingPowerService;
  [(FitnessService *)&v11 start];
  self->_wheelDiameterInInches = 26.0;
  [(CyclingPowerService *)self readWheelSize];
  [(CyclingPowerService *)self updateZeroDuplicateValues];
  v3 = +[CBUUID UUIDWithString:CBUUIDSensorLocation];
  v12[0] = v3;
  v4 = +[CBUUID UUIDWithString:@"0x2A65"];
  v12[1] = v4;
  id v5 = +[CBUUID UUIDWithString:@"0x2A66"];
  v12[2] = v5;
  v6 = +[CBUUID UUIDWithString:@"0x2A63"];
  v12[3] = v6;
  v7 = +[CBUUID UUIDWithString:@"0x2A64"];
  v12[4] = v7;
  v8 = +[NSArray arrayWithObjects:v12 count:5];

  v9 = [(ClientService *)self peripheral];
  v10 = [(ClientService *)self service];
  [v9 discoverCharacteristics:v8 forService:v10];
}

- (BOOL)supportsHKQuantityType:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:HKQuantityTypeIdentifierCyclingPower];

  if ((v6 & 1) == 0)
  {
    v8 = [v4 identifier];
    if ([v8 isEqualToString:HKQuantityTypeIdentifierCyclingSpeed])
    {
    }
    else
    {
      v9 = [v4 identifier];
      unsigned __int8 v10 = [v9 isEqualToString:HKQuantityTypeIdentifierDistanceCycling];

      if ((v10 & 1) == 0)
      {
        v13 = [v4 identifier];
        unsigned int v14 = [v13 isEqualToString:HKQuantityTypeIdentifierCyclingCadence];

        if (!v14)
        {
          BOOL v7 = 0;
          goto LABEL_8;
        }
        int v11 = 8;
        goto LABEL_7;
      }
    }
    int v11 = 4;
LABEL_7:
    BOOL v7 = (*(_DWORD *)&self->_sendZeroForDuplicates & v11) != 0;
    goto LABEL_8;
  }
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (void)collectData:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v6 = @"ON";
    }
    else {
      CFStringRef v6 = @"OFF";
    }
    BOOL v7 = v5;
    v8 = [(ClientService *)self peripheral];
    v9 = [v8 name];
    int v13 = 138412546;
    CFStringRef v14 = v6;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "collectData:%@ for “%@”", (uint8_t *)&v13, 0x16u);
  }
  unsigned __int8 v10 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  [(FitnessService *)self setNotify:v3 forCharacteristic:v10];

  int v11 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
  [(FitnessService *)self setNotify:v3 forCharacteristic:v11];

  v12 = [(CyclingPowerService *)self cyclingPowerControlPointCharacteristic];
  [(FitnessService *)self setNotify:v3 forCharacteristic:v12];
}

- (id)getDeviceInformationService
{
  v2 = [(ClientService *)self manager];
  BOOL v3 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
  id v4 = [v2 clientServiceForUUID:v3];

  return v4;
}

- (void)createDistributedHKDeviceWithSecondary:(id)a3
{
  v63 = (CyclingPowerService *)a3;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2050000000;
  id v4 = (void *)qword_1000CD050;
  uint64_t v68 = qword_1000CD050;
  if (!qword_1000CD050)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10001DDD0;
    v70 = &unk_1000B11E0;
    *(void *)v71 = &v65;
    sub_10001DDD0((uint64_t)buf);
    id v4 = (void *)v66[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v65, 8);
  v62 = self;
  unsigned int v6 = [(CyclingPowerService *)self isSensorLocationLeft];
  BOOL v7 = v63;
  if (v6) {
    BOOL v7 = self;
  }
  v8 = v7;
  unsigned int v9 = [(CyclingPowerService *)self isSensorLocationLeft];
  unsigned __int8 v10 = v63;
  if (!v9) {
    unsigned __int8 v10 = self;
  }
  v64 = v10;
  int v11 = [(ClientService *)v8 peripheral];
  v12 = [v11 name];
  int v13 = [(ClientService *)v64 peripheral];
  CFStringRef v14 = [v13 name];
  v61 = +[NSString stringWithFormat:@"%@/%@", v12, v14];

  __int16 v15 = [(ClientService *)v8 peripheral];
  v16 = [v15 hkDevice];
  v17 = [v16 manufacturer];
  v18 = v17;
  if (v17)
  {
    id v60 = v17;
  }
  else
  {
    v19 = [(ClientService *)v64 peripheral];
    v20 = [v19 hkDevice];
    id v60 = [v20 manufacturer];
  }
  v21 = [(ClientService *)v8 peripheral];
  v22 = [v21 hkDevice];
  v23 = [v22 model];
  v24 = v23;
  if (v23)
  {
    id v59 = v23;
  }
  else
  {
    v25 = [(ClientService *)v64 peripheral];
    v26 = [v25 hkDevice];
    id v59 = [v26 model];
  }
  v27 = [(ClientService *)v8 peripheral];
  v28 = [v27 hkDevice];
  v29 = [v28 hardwareVersion];
  v30 = v29;
  if (v29)
  {
    id v58 = v29;
  }
  else
  {
    v31 = [(ClientService *)v64 peripheral];
    v32 = [v31 hkDevice];
    id v58 = [v32 hardwareVersion];
  }
  v33 = [(ClientService *)v8 peripheral];
  v34 = [v33 hkDevice];
  v35 = [v34 firmwareVersion];
  v36 = v35;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    v38 = [(ClientService *)v64 peripheral];
    v39 = [v38 hkDevice];
    id v37 = [v39 firmwareVersion];
  }
  if (v5)
  {
    id v40 = [v5 alloc];
    v41 = [(ClientService *)v8 peripheral];
    v42 = [v41 identifier];
    v43 = [v42 UUIDString];
    v44 = [(ClientService *)v64 peripheral];
    v45 = [v44 identifier];
    v46 = [v45 UUIDString];
    v47 = +[NSString stringWithFormat:@"%@/%@", v43, v46];
    id v48 = [v40 initWithName:v61 manufacturer:v60 model:v59 hardwareVersion:v58 firmwareVersion:v37 softwareVersion:0 localIdentifier:v47 UDIDeviceIdentifier:0];

    v49 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v49;
      v51 = [v48 name];
      v52 = [v48 manufacturer];
      v53 = [v48 model];
      v54 = [v48 hardwareVersion];
      v55 = [v48 firmwareVersion];
      v56 = [v48 localIdentifier];
      *(_DWORD *)buf = 138413570;
      *(void *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v52;
      *(_WORD *)&buf[22] = 2112;
      v70 = v53;
      *(_WORD *)v71 = 2112;
      *(void *)&v71[2] = v54;
      __int16 v72 = 2112;
      v73 = v55;
      __int16 v74 = 2112;
      v75 = v56;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Created distributed HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", buf, 0x3Eu);
    }
    [(CyclingPowerService *)v62 setComboHKDevice:v48];
    [(CyclingPowerService *)v63 setComboHKDevice:v48];
  }
  else
  {
    v57 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006E558((uint64_t)v61, v57);
    }
  }
}

- (id)updateComboString:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    if ([v6 containsString:@"/"]
      || [v7 isEqualToString:v6])
    {
      id v8 = v6;
    }
    else
    {
      if ([(CyclingPowerService *)self isSensorLocationLeft]) {
        id v11 = v7;
      }
      else {
        id v11 = v6;
      }
      if ([(CyclingPowerService *)self isSensorLocationLeft]) {
        id v12 = v6;
      }
      else {
        id v12 = v7;
      }
      id v8 = +[NSString stringWithFormat:@"%@/%@", v11, v12];
    }
  }
  else
  {
    id v8 = v7;
  }
  unsigned int v9 = v8;

  return v9;
}

- (void)receiveDeviceInfoUpdateNotification:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CyclingPowerService;
  [(FitnessService *)&v52 receiveDeviceInfoUpdateNotification:v4];
  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_10006E690(v5, v4, self);
  }
  id v6 = [v4 name];
  if (![v6 isEqualToString:@"DeviceInformationUpdate"]) {
    goto LABEL_29;
  }
  id v7 = [(ClientService *)self peripheral];
  id v8 = [v7 identifier];
  unsigned int v9 = [v8 UUIDString];
  unsigned __int8 v10 = [v4 userInfo];
  id v11 = [v10 valueForKey:@"UUID"];
  unsigned int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    int v13 = [v4 userInfo];
    CFStringRef v14 = [v13 valueForKey:@"PnP"];

    if (v14) {
      [(CyclingPowerService *)self updateZeroDuplicateValues];
    }
    __int16 v15 = [v4 userInfo];
    v16 = [v15 valueForKey:@"ModelNumber"];

    if (v16)
    {
      [(CyclingPowerService *)self updateZeroDuplicateValues];
      if (self->fDistributedPower)
      {
        v17 = [(CyclingPowerService *)self comboHKDevice];

        if (v17)
        {
          v18 = [(CyclingPowerService *)self comboHKDevice];
          [v18 _setModel:v16];
        }
      }
    }
    v19 = [v4 userInfo];
    v20 = [v19 valueForKey:@"FirmwareRevision"];

    if (v20)
    {
      if (self->fDistributedPower)
      {
        v21 = [(CyclingPowerService *)self comboHKDevice];

        if (v21)
        {
          v22 = [(CyclingPowerService *)self comboHKDevice];
          v23 = [(CyclingPowerService *)self comboHKDevice];
          v24 = [v23 firmwareVersion];
          v25 = [(CyclingPowerService *)self updateComboString:v24 withValue:v20];
          [v22 _setFirmwareVersion:v25];
        }
      }
    }
    v26 = [v4 userInfo];
    v27 = [v26 valueForKey:@"HardwareRevision"];

    if (v27)
    {
      if (self->fDistributedPower)
      {
        v28 = [(CyclingPowerService *)self comboHKDevice];

        if (v28)
        {
          v29 = [(CyclingPowerService *)self comboHKDevice];
          v30 = [(CyclingPowerService *)self comboHKDevice];
          v31 = [v30 hardwareVersion];
          v32 = [(CyclingPowerService *)self updateComboString:v31 withValue:v27];
          [v29 _setHardwareVersion:v32];
        }
      }
    }
    v33 = [v4 userInfo];
    id v6 = [v33 valueForKey:@"ManufacturerName"];

    if (v6)
    {
      [(CyclingPowerService *)self updateZeroDuplicateValues];
      if (self->fDistributedPower)
      {
        v34 = [(CyclingPowerService *)self comboHKDevice];

        if (v34)
        {
          v35 = [(CyclingPowerService *)self comboHKDevice];
          [v35 _setManufacturer:v6];
        }
      }
    }
    if (self->fDistributedPower
      && ([(CyclingPowerService *)self comboHKDevice],
          v36 = objc_claimAutoreleasedReturnValue(),
          v36,
          v36))
    {
      id v37 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        log = v37;
        v51 = [(CyclingPowerService *)self comboHKDevice];
        v46 = [v51 name];
        v50 = [(CyclingPowerService *)self comboHKDevice];
        v38 = [v50 manufacturer];
        v49 = [(CyclingPowerService *)self comboHKDevice];
        v39 = [v49 model];
        v47 = [(CyclingPowerService *)self comboHKDevice];
        id v40 = [v47 hardwareVersion];
        v41 = [(CyclingPowerService *)self comboHKDevice];
        v42 = [v41 firmwareVersion];
        v43 = [(CyclingPowerService *)self comboHKDevice];
        v44 = [v43 localIdentifier];
        *(_DWORD *)buf = 138413570;
        v54 = v46;
        __int16 v55 = 2112;
        v56 = v38;
        __int16 v57 = 2112;
        id v58 = v39;
        __int16 v59 = 2112;
        id v60 = v40;
        __int16 v61 = 2112;
        v62 = v42;
        __int16 v63 = 2112;
        v64 = v44;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updated distributed HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", buf, 0x3Eu);
      }
    }
    else
    {
      v45 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_10006E5D0(v45, self);
      }
    }
LABEL_29:
  }
}

- (void)updateForSensorLocation
{
  if (self->fFeatureCharacteristicRead && self->fSensorLocationCharacteristicRead && self->fDistributedPower)
  {
    BOOL v3 = [(CyclingPowerService *)self comboHKDevice];

    if (!v3)
    {
      id v4 = +[FitnessDeviceManager instance];
      id v7 = [v4 findMatchingDistributedFitnessService:self];

      id v5 = v7;
      if (v7 && v7->fFeatureCharacteristicRead && v7->fSensorLocationCharacteristicRead)
      {
        if ([(CyclingPowerService *)self isSensorLocationLeft])
        {
          v7->fIsSecondary = 1;
          id v6 = self;
        }
        else
        {
          self->fIsSecondary = 1;
          id v6 = v7;
        }
        -[CyclingPowerService createDistributedHKDeviceWithSecondary:](v6, "createDistributedHKDeviceWithSecondary:");
        id v5 = v7;
      }
    }
  }
}

- (id)sensorLocationString
{
  if ((self->fSensorLocation - 5) > 3u) {
    return @"Unsupported";
  }
  else {
    return off_1000B1698[(char)(self->fSensorLocation - 5)];
  }
}

- (void)updatedSensorLocationCharacteristicValue
{
  BOOL v3 = [(CyclingPowerService *)self cyclingPowerSensorLocationCharacteristic];
  id v4 = [v3 value];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = [(CyclingPowerService *)self cyclingPowerSensorLocationCharacteristic];
    id v7 = [v6 value];
    [(FitnessService *)self readBytesFromNSData:v7 into:&self->fSensorLocation startingAt:0 length:1 info:@"Cycling Power Sensor Location Characteristic Value"];

    id v8 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = v8;
      unsigned __int8 v10 = [(CyclingPowerService *)self sensorLocationString];
      id v11 = [(ClientService *)self peripheral];
      unsigned int v12 = [v11 name];
      int v14 = 138412546;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "updatedSensorLocationCharacteristicValue:%@ for “%@”", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    int v13 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006E794(v13, self);
    }
  }
  self->fSensorLocationCharacteristicRead = 1;
  [(CyclingPowerService *)self updateForSensorLocation];
}

- (void)updatedFeatureCharacteristicValue
{
  BOOL v3 = [(CyclingPowerService *)self cyclingPowerFeatureCharacteristic];
  id v4 = [v3 value];
  id v5 = [v4 length];

  if ((unint64_t)v5 > 3)
  {
    unsigned int v8 = 4;
  }
  else
  {
    id v6 = [(CyclingPowerService *)self cyclingPowerFeatureCharacteristic];
    id v7 = [v6 value];
    unsigned int v8 = [v7 length];

    if (v8 <= 2)
    {
      unsigned int v9 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006E898(v9, self);
      }
    }
  }
  unsigned __int8 v10 = [(CyclingPowerService *)self cyclingPowerFeatureCharacteristic];
  id v11 = [v10 value];
  [(FitnessService *)self readBytesFromNSData:v11 into:&self->_sendZeroForDuplicates startingAt:0 length:v8 info:@"Cycling Power Feature Characteristic Value"];

  self->fDistributedPower = (*(_DWORD *)&self->_sendZeroForDuplicates & 0x200000) != 0;
  unsigned int v12 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    int v14 = [(ClientService *)self peripheral];
    uint64_t v15 = [v14 name];
    __int16 v16 = (void *)v15;
    if (self->fDistributedPower) {
      CFStringRef v17 = &stru_1000B2890;
    }
    else {
      CFStringRef v17 = @"NON-";
    }
    CFStringRef v18 = @"YES";
    int v19 = *(_DWORD *)&self->_sendZeroForDuplicates;
    *(_DWORD *)v21 = 138413058;
    *(void *)&v21[4] = v15;
    if ((v19 & 4) != 0) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    *(void *)&v21[14] = v17;
    *(_WORD *)&v21[12] = 2112;
    *(_WORD *)&v21[22] = 2112;
    CFStringRef v22 = v20;
    if ((v19 & 8) == 0) {
      CFStringRef v18 = @"NO";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "“%@” Features - %@DISTRIBUTED POWER:YES SPEED:%@ CADENCE:%@", v21, 0x2Au);
  }
  self->fFeatureCharacteristicRead = 1;
  [(CyclingPowerService *)self updateForSensorLocation];
  [(FitnessService *)self featuresReadComplete];
}

- (BOOL)isDistributed
{
  return self->fDistributedPower;
}

- (BOOL)matchesDistributedService:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![v5 isDistributed]) {
      goto LABEL_14;
    }
    if (![(CyclingPowerService *)self isDistributed]) {
      goto LABEL_14;
    }
    id v6 = [v5 peripheral];
    id v7 = [v6 identifier];
    unsigned int v8 = [v7 UUIDString];
    unsigned int v9 = [(ClientService *)self peripheral];
    unsigned __int8 v10 = [v9 identifier];
    id v11 = [v10 UUIDString];
    unsigned __int8 v12 = [v8 isEqualToString:v11];

    if (v12) {
      goto LABEL_14;
    }
    unsigned int v13 = [(FitnessService *)self vendorID];
    if (v13 == [v5 vendorID]
      && (unsigned int v14 = -[FitnessService productID](self, "productID"), v14 == [v5 productID]))
    {
      switch(self->fSensorLocation)
      {
        case 5u:
          if (v5[113] != 6) {
            goto LABEL_14;
          }
          goto LABEL_9;
        case 6u:
          if (v5[113] != 5) {
            goto LABEL_14;
          }
          goto LABEL_9;
        case 7u:
          if (v5[113] != 8) {
            goto LABEL_14;
          }
LABEL_9:
          BOOL v15 = 1;
          break;
        case 8u:
          BOOL v15 = v5[113] == 7;
          break;
        default:
          goto LABEL_14;
      }
    }
    else
    {
LABEL_14:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)updatedSpeedMeasurementValueForRevolutions:(unsigned int)a3 andWheelEventTime:(unsigned __int16)a4 timeStamp:(id)a5
{
  unsigned int v5 = a4;
  id v8 = a5;
  unsigned int v9 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    v27 = v9;
    v28 = [(ClientService *)self peripheral];
    v29 = [v28 name];
    int v30 = 138413570;
    v31 = v29;
    __int16 v32 = 1024;
    *(_DWORD *)v33 = a3;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = a3;
    *(_WORD *)v34 = 1024;
    *(_DWORD *)&v34[2] = v5;
    *(_WORD *)v35 = 1024;
    *(_DWORD *)&v35[2] = v5;
    LOWORD(v36[0]) = 2048;
    *(double *)((char *)v36 + 2) = (double)v5 * 0.00048828125;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement SPEED, CumWheelRev:%d (0x%08X) last Wheel Event Time:%d (0x%04X) (%f in sec)", (uint8_t *)&v30, 0x2Eu);
  }
  p_lastPowerMeasurementReading = &self->lastPowerMeasurementReading;
  if (*(_DWORD *)&self->lastPowerMeasurementReading.accumulated_torque
    || LOWORD(self->lastPowerMeasurementReading.wheel_revolution_data))
  {
    uint64_t v11 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierCyclingSpeed];
    uint64_t v12 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling];
    if (v11 | v12)
    {
      int wheel_revolution_data_low = LOWORD(self->lastPowerMeasurementReading.wheel_revolution_data);
      BOOL v14 = __OFSUB__(v5, wheel_revolution_data_low);
      int v15 = v5 - wheel_revolution_data_low;
      if (v15 < 0 != v14) {
        v15 += 0x10000;
      }
      if (v15)
      {
        double v16 = (double)v15 * 0.00048828125;
        double v17 = self->_wheelDiameterInInches
            * ((double)(int)(a3 - *(_DWORD *)&self->lastPowerMeasurementReading.accumulated_torque)
             * 3.14159265);
        double v18 = v17 / v16 * 0.0568181818;
        if (v18 >= 0.0 && v18 < 200.0)
        {
          v26 = +[NSDate dateWithTimeInterval:v8 sinceDate:-v16];
          if (v11 && [(FitnessService *)self isCollectingHKQuantityType:v11])
          {
            [(FitnessService *)self recordDatum:v26 start:v8 end:v11 quantityType:v18];
            [(FitnessService *)self storeDatumsForQuantityType:v11];
          }
          if (v12 && [(FitnessService *)self isCollectingHKQuantityType:v12])
          {
            [(FitnessService *)self recordDatum:v26 start:v8 end:v12 quantityType:v17 * 0.0254];
            [(FitnessService *)self storeDatumsForQuantityType:v12];
          }
        }
        else
        {
          CFStringRef v20 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            CFStringRef v22 = [(ClientService *)self peripheral];
            __int16 v23 = [v22 name];
            int v24 = *(_DWORD *)&p_lastPowerMeasurementReading->accumulated_torque;
            int v25 = LOWORD(p_lastPowerMeasurementReading->wheel_revolution_data);
            int v30 = 138413570;
            v31 = v23;
            __int16 v32 = 2048;
            *(double *)v33 = v18;
            *(_WORD *)&v33[8] = 1024;
            *(_DWORD *)v34 = a3;
            *(_WORD *)&v34[4] = 1024;
            *(_DWORD *)v35 = v5;
            *(_WORD *)&v35[4] = 1024;
            v36[0] = v24;
            LOWORD(v36[1]) = 1024;
            *(_DWORD *)((char *)&v36[1] + 2) = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "“%@” Invalid speed detected:%f rpm rev count=0x%08X timestamp=0x%04X previous rev count=0x%08X timestamp=0x%04X", (uint8_t *)&v30, 0x2Eu);
          }
        }
      }
      else if (self->fCurrentDataIsDuplicate {
             && [(CyclingPowerService *)self sendDuplicateReadingsAsZero])
      }
      {
        if ([(FitnessService *)self isCollectingHKQuantityType:v11])
        {
          [(FitnessService *)self recordDatum:v8 start:v8 end:v11 quantityType:0.0];
          [(FitnessService *)self storeDatumsForQuantityType:v11];
        }
        if (v12 && [(FitnessService *)self isCollectingHKQuantityType:v12])
        {
          [(FitnessService *)self recordDatum:v8 start:v8 end:v12 quantityType:0.0];
          [(FitnessService *)self storeDatumsForQuantityType:v12];
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_10006E960();
    }
  }
}

- (void)updatedCadenceMeasurementValueForRevolutions:(unsigned __int16)a3 andCrankEventTime:(unsigned __int16)a4 timeStamp:(id)a5
{
  unsigned int v5 = a4;
  int v6 = a3;
  id v8 = a5;
  unsigned int v9 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    int v19 = v9;
    CFStringRef v20 = [(ClientService *)self peripheral];
    v21 = [v20 name];
    int v28 = 138413570;
    v29 = v21;
    __int16 v30 = 1024;
    *(_DWORD *)v31 = v6;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v6;
    *(_WORD *)__int16 v32 = 1024;
    *(_DWORD *)&v32[2] = v5;
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v5;
    *(_WORD *)v34 = 2048;
    *(double *)&v34[2] = (double)v5 * 0.0009765625;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement CADENCE, CrankRev:%d (0x%04X) last Crank Event Time:%d (0x%04X) (%f in sec)", (uint8_t *)&v28, 0x2Eu);
  }
  p_lastPowerMeasurementReading = &self->lastPowerMeasurementReading;
  if (HIWORD(self->lastPowerMeasurementReading.wheel_revolution_data)
    || self->lastPowerMeasurementReading.last_wheel_event_time)
  {
    uint64_t v11 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierCyclingCadence];
    if (v11)
    {
      if ([(FitnessService *)self isCollectingHKQuantityType:v11])
      {
        int last_wheel_event_time = self->lastPowerMeasurementReading.last_wheel_event_time;
        BOOL v13 = __OFSUB__(v5, last_wheel_event_time);
        int v14 = v5 - last_wheel_event_time;
        if (v14 < 0 != v13) {
          v14 += 0x10000;
        }
        if (v14)
        {
          int v15 = v6 - HIWORD(self->lastPowerMeasurementReading.wheel_revolution_data);
          if (v15 >= 1)
          {
            double v16 = (double)v14 * 0.0009765625;
            double v17 = (double)v15 * 60.0 / v16;
            if (v17 < 0.0 || v17 >= 500.0)
            {
              CFStringRef v22 = (void *)qword_1000CD178;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
              {
                __int16 v23 = v22;
                int v24 = [(ClientService *)self peripheral];
                int v25 = [v24 name];
                int wheel_revolution_data_high = HIWORD(p_lastPowerMeasurementReading->wheel_revolution_data);
                int v27 = p_lastPowerMeasurementReading->last_wheel_event_time;
                int v28 = 138413570;
                v29 = v25;
                __int16 v30 = 2048;
                *(double *)v31 = v17;
                *(_WORD *)&v31[8] = 1024;
                *(_DWORD *)__int16 v32 = v6;
                *(_WORD *)&v32[4] = 1024;
                *(_DWORD *)v33 = v5;
                *(_WORD *)&v33[4] = 1024;
                *(_DWORD *)v34 = wheel_revolution_data_high;
                *(_WORD *)&v34[4] = 1024;
                *(_DWORD *)&unsigned char v34[6] = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "“%@” Invalid cadence detected:%f rpm rev count=0x%04X timestamp=0x%04X previous rev count=0x%04X timestamp=0x%04X", (uint8_t *)&v28, 0x2Eu);
              }
            }
            else
            {
              double v18 = +[NSDate dateWithTimeInterval:v8 sinceDate:-v16];
              [(FitnessService *)self recordDatum:v18 start:v8 end:v11 quantityType:v17];
              [(FitnessService *)self storeDatumsForQuantityType:v11];
            }
          }
        }
        else if (self->fCurrentDataIsDuplicate {
               && [(CyclingPowerService *)self sendDuplicateReadingsAsZero])
        }
        {
          [(FitnessService *)self recordDatum:v8 start:v8 end:v11 quantityType:0.0];
          [(FitnessService *)self storeDatumsForQuantityType:v11];
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_10006E9C8();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_10006E994();
    }
  }
}

- (BOOL)isSensorLocationLeft
{
  return (self->fSensorLocation & 0xFD) == 5;
}

- (BOOL)isSensorLocationRight
{
  int fSensorLocation = self->fSensorLocation;
  return fSensorLocation == 6 || fSensorLocation == 8;
}

- (id)sensorLocationSideString
{
  if ([(CyclingPowerService *)self isSensorLocationLeft]) {
    return @"Left";
  }
  if ([(CyclingPowerService *)self isSensorLocationRight]) {
    return @"Right";
  }
  return @"-";
}

- (double)powerBalanceForValue:(double)a3 otherService:(id)a4 otherValue:(double)a5
{
  id v8 = a4;
  if (a3 + a5 <= 0.0) {
    goto LABEL_9;
  }
  if (![(CyclingPowerService *)self isSensorLocationLeft]
    || ![v8 isSensorLocationRight])
  {
    if ([(CyclingPowerService *)self isSensorLocationRight]
      && [v8 isSensorLocationLeft])
    {
      double v9 = a5 * 100.0;
      goto LABEL_8;
    }
LABEL_9:
    double v10 = 50.0;
    goto LABEL_10;
  }
  double v9 = a3 * 100.0;
LABEL_8:
  double v10 = v9 / (a3 + a5);
LABEL_10:

  return v10;
}

- (id)originatingHKDevice
{
  if ([(CyclingPowerService *)self isDistributed]
    && ([(CyclingPowerService *)self comboHKDevice],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(CyclingPowerService *)self comboHKDevice];
  }
  else
  {
    unsigned int v5 = [(ClientService *)self peripheral];
    id v4 = [v5 hkDevice];
  }

  return v4;
}

- (void)updatedPowerMeasurementValue:(id *)a3 timeStamp:(id)a4
{
  id v6 = a4;
  id v7 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierCyclingPower];
  if (v7 && [(FitnessService *)self isCollectingHKQuantityType:v7])
  {
    id v8 = +[FitnessDeviceManager instance];
    double v9 = [v8 findMatchingDistributedFitnessService:self];

    if ([(CyclingPowerService *)self isDistributed])
    {
      if (v9)
      {
        double v10 = [(CyclingPowerService *)self comboHKDevice];

        if (v10)
        {
          p_lastDistributedDatum = &self->_lastDistributedDatum;
          if (!self->_lastDistributedDatum) {
            goto LABEL_42;
          }
          uint64_t v12 = [v9 lastDistributedDatum];
          if (v12)
          {
            BOOL v13 = (void *)v12;
            int v14 = [v9 lastDistributedDatum];
            int v15 = [v14 dateInterval];
            double v16 = [v15 startDate];
            [v6 timeIntervalSinceDate:v16];
            double v18 = fabs(v17);

            if (v18 < 1.5)
            {
              int v19 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
              [v19 _value];
              double v21 = v20;
              CFStringRef v22 = [v9 lastDistributedDatum];
              __int16 v23 = [v22 quantity];
              [v23 _value];
              [(CyclingPowerService *)self powerBalanceForValue:v9 otherService:v21 otherValue:v24];
              uint64_t v26 = v25;

              int v27 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
              [v27 _value];
              double v29 = v28;
              __int16 v30 = [v9 lastDistributedDatum];
              v31 = [v30 quantity];
              [v31 _value];
              double v33 = v29 + v32;

              if (v33 < 0.0 || v33 >= 5000.0)
              {
                v71 = (void *)qword_1000CD178;
                if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
                {
                  logb = v71;
                  v171 = [(ClientService *)self peripheral];
                  v143 = [v171 name];
                  v165 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
                  [v165 _value];
                  uint64_t v135 = v134;
                  v146 = [(CyclingPowerService *)self sensorLocationSideString];
                  v155 = [v9 lastDistributedDatum];
                  v150 = [v155 quantity];
                  [v150 _value];
                  uint64_t v137 = v136;
                  v138 = [v9 peripheral];
                  v139 = [v138 name];
                  [v9 sensorLocationSideString];
                  *(_DWORD *)buf = 138414082;
                  v173 = v143;
                  __int16 v174 = 2048;
                  *(void *)v175 = v135;
                  *(_WORD *)&v175[8] = 2114;
                  *(void *)&v175[10] = v146;
                  *(_WORD *)&v175[18] = 2048;
                  *(void *)&v175[20] = v137;
                  __int16 v176 = 2112;
                  uint64_t v177 = (uint64_t)v139;
                  v179 = __int16 v178 = 2114;
                  v140 = (void *)v179;
                  __int16 v180 = 2048;
                  double v181 = v33;
                  __int16 v182 = 2048;
                  uint64_t v183 = v26;
                  _os_log_error_impl((void *)&_mh_execute_header, logb, OS_LOG_TYPE_ERROR, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f (INVALID VALUE) balance:%f", buf, 0x52u);
                }
              }
              else
              {
                v34 = [v9 lastDistributedDatum];
                v35 = [v34 dateInterval];
                v36 = [v35 startDate];
                id v37 = [(FitnessService *)self createDatum:v36 start:v6 end:v7 quantityType:v33];

                [(FitnessService *)self recordDatum:v37 forType:v7];
                v38 = [(CyclingPowerService *)self comboHKDevice];
                [(FitnessService *)self storeDatumsForQuantityType:v7 usingHKDevice:v38];

                v39 = (void *)qword_1000CD178;
                if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
                {
                  log = v39;
                  v170 = [(ClientService *)self peripheral];
                  v142 = [v170 name];
                  v164 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
                  [v164 _value];
                  uint64_t v129 = v128;
                  v145 = [(CyclingPowerService *)self sensorLocationSideString];
                  v154 = [v9 lastDistributedDatum];
                  v149 = [v154 quantity];
                  [v149 _value];
                  uint64_t v131 = v130;
                  v141 = [v9 peripheral];
                  v132 = [v141 name];
                  [v9 sensorLocationSideString];
                  *(_DWORD *)buf = 138414082;
                  v173 = v142;
                  __int16 v174 = 2048;
                  *(void *)v175 = v129;
                  *(_WORD *)&v175[8] = 2114;
                  *(void *)&v175[10] = v145;
                  *(_WORD *)&v175[18] = 2048;
                  *(void *)&v175[20] = v131;
                  __int16 v176 = 2112;
                  uint64_t v177 = (uint64_t)v132;
                  v179 = __int16 v178 = 2114;
                  v133 = (void *)v179;
                  __int16 v180 = 2048;
                  double v181 = v33;
                  __int16 v182 = 2048;
                  uint64_t v183 = v26;
                  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f balance:%f", buf, 0x52u);
                }
              }
              [v9 setLastDistributedDatum:0];
              goto LABEL_42;
            }
          }
          v56 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
          [v56 _value];
          double v58 = v57 + v57;

          if (v58 < 0.0 || v58 >= 5000.0)
          {
            v66 = (void *)qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
            {
LABEL_42:
              uint64_t v72 = [(FitnessService *)self createDatum:v6 start:v6 end:v7 quantityType:(double)*((__int16 *)&a3->var0 + 1)];
              v73 = *p_lastDistributedDatum;
              *p_lastDistributedDatum = (HKQuantityDatum *)v72;

              __int16 v74 = [v9 lastDistributedDatum];

              if (v74)
              {
                v75 = [v9 lastDistributedDatum];
                v76 = [v75 dateInterval];
                v77 = [v76 startDate];
                [v6 timeIntervalSinceDate:v77];
                double v79 = fabs(v78);

                if (v79 >= 1.5)
                {
                  v102 = (void *)qword_1000CD178;
                  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
                    sub_10006EBC0(v102, self, (id *)&self->_lastDistributedDatum);
                  }
                }
                else
                {
                  v80 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
                  [v80 _value];
                  double v82 = v81;
                  v83 = [v9 lastDistributedDatum];
                  v84 = [v83 quantity];
                  [v84 _value];
                  [(CyclingPowerService *)self powerBalanceForValue:v9 otherService:v82 otherValue:v85];
                  uint64_t v87 = v86;

                  v88 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
                  [v88 _value];
                  double v90 = v89;
                  v91 = [v9 lastDistributedDatum];
                  v92 = [v91 quantity];
                  [v92 _value];
                  double v94 = v90 + v93;

                  if (v94 < 0.0 || v94 >= 5000.0)
                  {
                    v103 = (void *)qword_1000CD178;
                    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
                    {
                      logd = v103;
                      v169 = [(ClientService *)self peripheral];
                      v148 = [v169 name];
                      v163 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
                      [v163 _value];
                      uint64_t v120 = v119;
                      v121 = [(CyclingPowerService *)self sensorLocationSideString];
                      v153 = [v9 lastDistributedDatum];
                      v122 = [v153 quantity];
                      [v122 _value];
                      uint64_t v124 = v123;
                      v125 = [v9 peripheral];
                      v126 = [v125 name];
                      v127 = [v9 sensorLocationSideString];
                      *(_DWORD *)buf = 138414082;
                      v173 = v148;
                      __int16 v174 = 2048;
                      *(void *)v175 = v120;
                      *(_WORD *)&v175[8] = 2114;
                      *(void *)&v175[10] = v121;
                      *(_WORD *)&v175[18] = 2048;
                      *(void *)&v175[20] = v124;
                      __int16 v176 = 2112;
                      uint64_t v177 = (uint64_t)v126;
                      __int16 v178 = 2114;
                      uint64_t v179 = (uint64_t)v127;
                      __int16 v180 = 2048;
                      double v181 = v94;
                      __int16 v182 = 2048;
                      uint64_t v183 = v87;
                      _os_log_error_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_ERROR, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f (INVALID VALUE) balance:%f", buf, 0x52u);
                    }
                  }
                  else
                  {
                    v95 = [v9 lastDistributedDatum];
                    v96 = [v95 dateInterval];
                    v97 = [v96 startDate];
                    v98 = [(FitnessService *)self createDatum:v97 start:v6 end:v7 quantityType:v94];

                    [(FitnessService *)self recordDatum:v98 forType:v7];
                    v99 = [(CyclingPowerService *)self comboHKDevice];
                    [(FitnessService *)self storeDatumsForQuantityType:v7 usingHKDevice:v99];

                    v100 = (void *)qword_1000CD178;
                    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
                    {
                      logc = v100;
                      v168 = [(ClientService *)self peripheral];
                      v144 = [v168 name];
                      v162 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
                      [v162 _value];
                      uint64_t v112 = v111;
                      v113 = [(CyclingPowerService *)self sensorLocationSideString];
                      v152 = [v9 lastDistributedDatum];
                      v147 = [v152 quantity];
                      [v147 _value];
                      uint64_t v115 = v114;
                      v116 = [v9 peripheral];
                      v117 = [v116 name];
                      v118 = [v9 sensorLocationSideString];
                      *(_DWORD *)buf = 138414082;
                      v173 = v144;
                      __int16 v174 = 2048;
                      *(void *)v175 = v112;
                      *(_WORD *)&v175[8] = 2114;
                      *(void *)&v175[10] = v113;
                      *(_WORD *)&v175[18] = 2048;
                      *(void *)&v175[20] = v115;
                      __int16 v176 = 2112;
                      uint64_t v177 = (uint64_t)v117;
                      __int16 v178 = 2114;
                      uint64_t v179 = (uint64_t)v118;
                      __int16 v180 = 2048;
                      double v181 = v94;
                      __int16 v182 = 2048;
                      uint64_t v183 = v87;
                      _os_log_debug_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f balance:%f", buf, 0x52u);
                    }
                  }
                  v104 = *p_lastDistributedDatum;
                  *p_lastDistributedDatum = 0;

                  [v9 setLastDistributedDatum:0];
                }
              }
              else
              {
                v101 = (void *)qword_1000CD178;
                if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
                  sub_10006EAB4(v101, self, (id *)&self->_lastDistributedDatum);
                }
              }
              goto LABEL_56;
            }
            v64 = v66;
            v167 = [(ClientService *)self peripheral];
            uint64_t v67 = [v167 name];
            uint64_t v68 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
            [v68 _value];
            uint64_t v70 = v69;
            uint64_t v65 = [(CyclingPowerService *)self sensorLocationSideString];
            *(_DWORD *)buf = 138413314;
            v173 = v67;
            __int16 v174 = 2048;
            *(void *)v175 = v70;
            *(_WORD *)&v175[8] = 2114;
            *(void *)&v175[10] = v65;
            *(_WORD *)&v175[18] = 2048;
            *(double *)&v175[20] = v58;
            __int16 v176 = 2048;
            uint64_t v177 = 0x4049000000000000;
            _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "“%@” READ CP Measurement POWER distributed single unit doubling qty:%f (%{public}@) -> %f (INVALID VALUE) balance = %f", buf, 0x34u);
          }
          else
          {
            __int16 v59 = [(HKQuantityDatum *)*p_lastDistributedDatum dateInterval];
            id v60 = [v59 startDate];
            __int16 v61 = [(HKQuantityDatum *)*p_lastDistributedDatum dateInterval];
            v62 = [v61 endDate];
            v166 = [(FitnessService *)self createDatum:v60 start:v62 end:v7 quantityType:v58];

            __int16 v63 = (void *)qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
            {
              loga = v63;
              v161 = [(ClientService *)self peripheral];
              v151 = [v161 name];
              v105 = [(HKQuantityDatum *)*p_lastDistributedDatum quantity];
              [v105 _value];
              uint64_t v107 = v106;
              v108 = [(CyclingPowerService *)self sensorLocationSideString];
              v109 = [v166 quantity];
              [v109 _value];
              *(_DWORD *)buf = 138413314;
              v173 = v151;
              __int16 v174 = 2048;
              *(void *)v175 = v107;
              *(_WORD *)&v175[8] = 2114;
              *(void *)&v175[10] = v108;
              *(_WORD *)&v175[18] = 2048;
              *(void *)&v175[20] = v110;
              __int16 v176 = 2048;
              uint64_t v177 = 0x4049000000000000;
              _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed single unit doubling qty:%f (%{public}@) -> %f balance = %f", buf, 0x34u);
            }
            v64 = v166;
            [(FitnessService *)self recordDatum:v166 forType:v7];
            uint64_t v65 = [(CyclingPowerService *)self comboHKDevice];
            [(FitnessService *)self storeDatumsForQuantityType:v7 usingHKDevice:v65];
          }

          goto LABEL_42;
        }
      }
    }
    if (self->fCurrentDataIsDuplicate
      && [(CyclingPowerService *)self sendDuplicateReadingsAsZero])
    {
      int v40 = 0;
      int v41 = 1;
    }
    else
    {
      int v40 = *((__int16 *)&a3->var0 + 1);
      if ((unsigned __int16)(*((_WORD *)&a3->var0 + 1) >> 3) > 0x270u)
      {
        v53 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006E9FC(v53, self);
        }
        goto LABEL_56;
      }
      int v41 = 0;
    }
    [(FitnessService *)self recordDatum:v6 start:v6 end:v7 quantityType:(double)v40];
    [(FitnessService *)self storeDatumsForQuantityType:v7];
    __int16 var0 = (__int16)a3->var0;
    v43 = (void *)qword_1000CD178;
    BOOL v44 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG);
    if (var0)
    {
      if (v44)
      {
        LOBYTE(v45) = a3->var1;
        double v54 = (double)v45 * 0.5;
        v46 = v43;
        v47 = [(ClientService *)self peripheral];
        id v48 = [v47 name];
        CFStringRef v55 = &stru_1000B2890;
        *(_DWORD *)buf = 138413058;
        __int16 v174 = 1024;
        v173 = v48;
        if (v41) {
          CFStringRef v55 = @"DUPLICATE";
        }
        *(_DWORD *)v175 = v40;
        *(_WORD *)&v175[4] = 2114;
        *(void *)&v175[6] = v55;
        *(_WORD *)&v175[14] = 2048;
        *(double *)&v175[16] = v54;
        v50 = "“%@” READ CP Measurement POWER non-distributed qty:%d %{public}@ balance:%f";
        v51 = v46;
        uint32_t v52 = 38;
        goto LABEL_30;
      }
    }
    else if (v44)
    {
      v46 = v43;
      v47 = [(ClientService *)self peripheral];
      id v48 = [v47 name];
      CFStringRef v49 = &stru_1000B2890;
      *(_DWORD *)buf = 138412802;
      v173 = v48;
      if (v41) {
        CFStringRef v49 = @"DUPLICATE";
      }
      __int16 v174 = 1024;
      *(_DWORD *)v175 = v40;
      *(_WORD *)&v175[4] = 2114;
      *(void *)&v175[6] = v49;
      v50 = "“%@” READ CP Measurement POWER non-distributed qty:%d %{public}@ (no balance data)";
      v51 = v46;
      uint32_t v52 = 28;
LABEL_30:
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, v50, buf, v52);
    }
LABEL_56:
  }
}

- (void)updatedMeasurementCharacteristicValue:(id)a3 at:(id)a4
{
  id v5 = a4;
  v66[0] = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  id v6 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  id v7 = [v6 value];
  unint64_t v8 = [(FitnessService *)self readBytesFromNSData:v7 into:&v64 startingAt:0 length:2 info:@"CPM - status flags"];

  double v9 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  double v10 = [v9 value];
  uint64_t v11 = (char *)[(FitnessService *)self readBytesFromNSData:v10 into:(char *)&v64 + 2 startingAt:v8 length:2 info:@"CPM - instantaneous power"]+ v8;

  __int16 v12 = v64;
  if (v64)
  {
    double v20 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
    double v21 = [v20 value];
    uint64_t v11 = &v11[[(FitnessService *)self readBytesFromNSData:v21 into:(char *)&v64 + 4 startingAt:v11 length:1 info:@"CPM - power balance"]];

    __int16 v12 = v64;
    if ((v64 & 4) == 0)
    {
LABEL_3:
      if ((v12 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((v64 & 4) == 0)
  {
    goto LABEL_3;
  }
  CFStringRef v22 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  __int16 v23 = [v22 value];
  uint64_t v11 = &v11[[(FitnessService *)self readBytesFromNSData:v23 into:(char *)&v64 + 6 startingAt:v11 length:2 info:@"CPM - accumulated torque"]];

  __int16 v12 = v64;
  if ((v64 & 0x10) == 0)
  {
LABEL_4:
    __int16 v13 = v12;
    if ((v12 & 0x20) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    __int16 v19 = v13;
    if ((v13 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_9:
  double v24 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  uint64_t v25 = [v24 value];
  uint64_t v26 = &v11[[(FitnessService *)self readBytesFromNSData:v25 into:(char *)&v64 + 8 startingAt:v11 length:4 info:@"CPM - wheel revolutions"]];

  int v27 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  double v28 = [v27 value];
  uint64_t v11 = &v26[[(FitnessService *)self readBytesFromNSData:v28 into:(unint64_t)&v64 | 0xC startingAt:v26 length:2 info:@"CPM - wheel event time"]];

  __int16 v13 = v64;
  if ((v64 & 0x20) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  int v14 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  int v15 = [v14 value];
  double v16 = &v11[[(FitnessService *)self readBytesFromNSData:v15 into:(unint64_t)&v64 | 0xE startingAt:v11 length:2 info:@"CPM - crank revolutions"]];

  double v17 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  double v18 = [v17 value];
  uint64_t v11 = &v16[[(FitnessService *)self readBytesFromNSData:v18 into:&v65 startingAt:v16 length:2 info:@"CPM - crank event time"]];

  __int16 v19 = v64;
  if ((v64 & 0x40) != 0)
  {
LABEL_11:
    double v29 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
    __int16 v30 = [v29 value];
    v31 = &v11[[(FitnessService *)self readBytesFromNSData:v30 into:(char *)&v65 + 2 startingAt:v11 length:2 info:@"CPM - extreme force magnitude max"]];

    double v32 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
    double v33 = [v32 value];
    uint64_t v11 = &v31[[(FitnessService *)self readBytesFromNSData:v33 into:(char *)&v65 + 4 startingAt:v31 length:2 info:@"CPM - extreme force magnitude min"]];

    __int16 v19 = v64;
  }
LABEL_12:
  if ((v19 & 0x80) != 0)
  {
    v39 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
    int v40 = [v39 value];
    int v41 = &v11[[(FitnessService *)self readBytesFromNSData:v40 into:(char *)&v65 + 6 startingAt:v11 length:2 info:@"CPM - extreme torque magnitude max"]];

    v42 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
    v43 = [v42 value];
    uint64_t v11 = &v41[[(FitnessService *)self readBytesFromNSData:v43 into:(char *)&v65 + 8 startingAt:v41 length:2 info:@"CPM - extreme torque magnitude min"]];

    __int16 v19 = v64;
    if ((v64 & 0x100) == 0)
    {
LABEL_14:
      if ((v19 & 0x200) == 0) {
        goto LABEL_15;
      }
      goto LABEL_25;
    }
  }
  else if ((v19 & 0x100) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)buf = 0;
  BOOL v44 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  unint64_t v45 = [v44 value];
  uint64_t v11 = &v11[[(FitnessService *)self readBytesFromNSData:v45 into:buf startingAt:v11 length:4 info:@"CPM - extreme angles"]];

  WORD5(v65) = *(_WORD *)buf & 0xFFF;
  WORD6(v65) = (*(_DWORD *)buf >> 12) & 0xFFF;
  __int16 v19 = v64;
  if ((v64 & 0x200) == 0)
  {
LABEL_15:
    if ((v19 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
LABEL_25:
  v46 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  v47 = [v46 value];
  uint64_t v11 = &v11[[(FitnessService *)self readBytesFromNSData:v47 into:(char *)&v65 + 14 startingAt:v11 length:2 info:@"CPM - top dead spot angle"]];

  __int16 v19 = v64;
  if ((v64 & 0x400) == 0)
  {
LABEL_16:
    if ((v19 & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_26:
  id v48 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
  CFStringRef v49 = [v48 value];
  uint64_t v11 = &v11[[(FitnessService *)self readBytesFromNSData:v49 into:v66 startingAt:v11 length:2 info:@"CPM - bottom dead spot angle"]];

  if ((v64 & 0x800) != 0)
  {
LABEL_17:
    v34 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
    v35 = [v34 value];
    [(FitnessService *)self readBytesFromNSData:v35 into:(char *)v66 + 2 startingAt:v11 length:2 info:@"CPM - accumulated energy"];
  }
LABEL_18:
  if (WORD1(v64) == *((unsigned __int16 *)&self->lastPowerMeasurementReading.cycling_power_status_flags + 1))
  {
    int v36 = *(_DWORD *)&self->_sendZeroForDuplicates & 0xC;
    BOOL v37 = v36 != 0;
    p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
    self->fCurrentDataIsDuplicate = v37;
    if ((v12 & 0x10) == 0)
    {
      if ((v13 & 0x20) == 0) {
        goto LABEL_21;
      }
      goto LABEL_36;
    }
    if (v36 && DWORD2(v64) == *(_DWORD *)&self->lastPowerMeasurementReading.accumulated_torque)
    {
      BOOL v37 = WORD6(v64) == LOWORD(self->lastPowerMeasurementReading.wheel_revolution_data);
      goto LABEL_35;
    }
  }
  else
  {
    p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
    self->fCurrentDataIsDuplicate = 0;
    if ((v12 & 0x10) == 0)
    {
      if ((v13 & 0x20) == 0) {
        goto LABEL_43;
      }
      goto LABEL_39;
    }
  }
  BOOL v37 = 0;
LABEL_35:
  BOOL *p_fCurrentDataIsDuplicate = v37;
  if ((v13 & 0x20) == 0)
  {
LABEL_21:
    if (!v37) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
LABEL_36:
  if (!v37) {
    goto LABEL_40;
  }
  if (HIWORD(v64) == HIWORD(self->lastPowerMeasurementReading.wheel_revolution_data))
  {
    BOOL v37 = (unsigned __int16)v65 == self->lastPowerMeasurementReading.last_wheel_event_time;
    goto LABEL_40;
  }
LABEL_39:
  BOOL v37 = 0;
LABEL_40:
  BOOL *p_fCurrentDataIsDuplicate = v37;
  if (!v37)
  {
LABEL_43:
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = 0;
    goto LABEL_44;
  }
LABEL_41:
  if (!self->firstDuplicateEventTimeStamp)
  {
    v50 = (NSDate *)v5;
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = v50;
LABEL_44:
  }
  if (*p_fCurrentDataIsDuplicate
    && [(CyclingPowerService *)self sendZeroForDuplicates]
    && ([v5 timeIntervalSinceDate:self->firstDuplicateEventTimeStamp], v52 < 1.5))
  {
    int v53 = 0;
  }
  else
  {
    if ((v12 & 0x10) != 0) {
      [(CyclingPowerService *)self updatedSpeedMeasurementValueForRevolutions:DWORD2(v64) andWheelEventTime:WORD6(v64) timeStamp:v5];
    }
    if ((v13 & 0x20) != 0) {
      [(CyclingPowerService *)self updatedCadenceMeasurementValueForRevolutions:HIWORD(v64) andCrankEventTime:(unsigned __int16)v65 timeStamp:v5];
    }
    [(CyclingPowerService *)self updatedPowerMeasurementValue:&v64 timeStamp:v5];
    int v53 = 1;
  }
  double v54 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    log = v54;
    __int16 v63 = [(ClientService *)self peripheral];
    v56 = [v63 name];
    int v57 = SWORD1(v64);
    if ((v12 & 0x10) != 0) {
      CFStringRef v58 = @"✓";
    }
    else {
      CFStringRef v58 = &stru_1000B2890;
    }
    if ((v13 & 0x20) != 0) {
      CFStringRef v59 = @"✓";
    }
    else {
      CFStringRef v59 = &stru_1000B2890;
    }
    BOOL v60 = *p_fCurrentDataIsDuplicate;
    [v5 timeIntervalSinceDate:self->firstDuplicateEventTimeStamp];
    *(_DWORD *)buf = 138413826;
    uint64_t v68 = v56;
    __int16 v69 = 1024;
    int v70 = v57;
    __int16 v71 = 2112;
    CFStringRef v72 = v58;
    __int16 v73 = 2112;
    CFStringRef v74 = v59;
    __int16 v75 = 1024;
    BOOL v76 = v60;
    __int16 v77 = 2048;
    uint64_t v78 = v61;
    __int16 v79 = 1024;
    int v80 = v53;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "“%@” Measurement - POWER:%d SPEED:%@ CADENCE:%@ duplicate:%d secondsSinceFirstDuplicate:%f sending:%d", buf, 0x3Cu);
  }
  long long v55 = v65;
  *(_OWORD *)&self->lastPowerMeasurementReading.cycling_power_status_flags = v64;
  *(_OWORD *)&self->lastPowerMeasurementReading.int last_wheel_event_time = v55;
  *(_DWORD *)&self->lastPowerMeasurementReading.min_angle = v66[0];
}

- (void)updatedVectorCharacteristicValue
{
  int v19 = 0;
  uint64_t v18 = 0;
  BOOL v3 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
  id v4 = [v3 value];
  id v5 = [(FitnessService *)self readBytesFromNSData:v4 into:&v18 startingAt:0 length:1 info:@"CPV - status flags"];

  char v6 = v18;
  if (v18)
  {
    double v9 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
    double v10 = [v9 value];
    uint64_t v11 = &v5[[(FitnessService *)self readBytesFromNSData:v10 into:(char *)&v18 + 2 startingAt:v5 length:2 info:@"CPV - crank revolutions"]];

    __int16 v12 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
    __int16 v13 = [v12 value];
    id v5 = &v11[[(FitnessService *)self readBytesFromNSData:v13 into:(char *)&v18 + 4 startingAt:v11 length:2 info:@"CPV - crank time"]];

    char v6 = v18;
    if ((v18 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_3;
  }
  int v14 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
  int v15 = [v14 value];
  id v5 = &v5[[(FitnessService *)self readBytesFromNSData:v15 into:(char *)&v18 + 6 startingAt:v5 length:2 info:@"CPV - first crank measurement angle"]];

  char v6 = v18;
  if ((v18 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      return;
    }
    goto LABEL_5;
  }
LABEL_9:
  double v16 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
  double v17 = [v16 value];
  id v5 = &v5[[(FitnessService *)self readBytesFromNSData:v17 into:&v19 startingAt:v5 length:2 info:@"CPV - instantaneous force magnitude array"]];

  if ((v18 & 8) == 0) {
    return;
  }
LABEL_5:
  id v7 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
  unint64_t v8 = [v7 value];
  [(FitnessService *)self readBytesFromNSData:v8 into:(char *)&v19 + 2 startingAt:v5 length:2 info:@"CPV - instantaneous torque magnitude array"];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v38 = a3;
  if (!a5)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    unint64_t v8 = [a4 characteristics];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v41;
      uint64_t v39 = CBUUIDSensorLocation;
      do
      {
        __int16 v12 = 0;
        do
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v12);
          int v14 = [(CyclingPowerService *)self cyclingPowerSensorLocationCharacteristic];
          if (v14)
          {
          }
          else
          {
            int v15 = [v13 UUID];
            double v16 = +[CBUUID UUIDWithString:v39];
            unsigned int v17 = [v15 isEqual:v16];

            if (v17)
            {
              [(CyclingPowerService *)self setCyclingPowerSensorLocationCharacteristic:v13];
LABEL_15:
              [(FitnessService *)self setNotify:1 forCharacteristic:v13];
              [v38 readValueForCharacteristic:v13];
              goto LABEL_29;
            }
          }
          uint64_t v18 = [(CyclingPowerService *)self cyclingPowerFeatureCharacteristic];
          if (v18)
          {
          }
          else
          {
            int v19 = [v13 UUID];
            double v20 = +[CBUUID UUIDWithString:@"0x2A65"];
            unsigned int v21 = [v19 isEqual:v20];

            if (v21)
            {
              [(CyclingPowerService *)self setCyclingPowerFeatureCharacteristic:v13];
              goto LABEL_15;
            }
          }
          CFStringRef v22 = [(CyclingPowerService *)self cyclingPowerControlPointCharacteristic];
          if (v22)
          {
          }
          else
          {
            __int16 v23 = [v13 UUID];
            double v24 = +[CBUUID UUIDWithString:@"0x2A66"];
            unsigned int v25 = [v23 isEqual:v24];

            if (v25)
            {
              [(CyclingPowerService *)self setCyclingPowerControlPointCharacteristic:v13];
LABEL_28:
              [(FitnessService *)self setNotify:0 forCharacteristic:v13];
              goto LABEL_29;
            }
          }
          uint64_t v26 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];
          if (v26)
          {
          }
          else
          {
            int v27 = [v13 UUID];
            double v28 = +[CBUUID UUIDWithString:@"0x2A63"];
            unsigned int v29 = [v27 isEqual:v28];

            if (v29)
            {
              [(CyclingPowerService *)self setCyclingPowerMeasurementCharacteristic:v13];
              goto LABEL_28;
            }
          }
          __int16 v30 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];
          if (v30)
          {

            goto LABEL_29;
          }
          v31 = [v13 UUID];
          double v32 = +[CBUUID UUIDWithString:@"0x2A64"];
          unsigned int v33 = [v31 isEqual:v32];

          if (v33)
          {
            [(CyclingPowerService *)self setCyclingPowerVectorCharacteristic:v13];
            goto LABEL_28;
          }
LABEL_29:
          __int16 v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v10);
    }

    [(ClientService *)self notifyDidStart];
    v34 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];

    if (!v34 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006ED48();
    }
    v35 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];

    if (!v35 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006ED14();
    }
    int v36 = [(CyclingPowerService *)self cyclingPowerFeatureCharacteristic];

    if (!v36 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006ECE0();
    }
    BOOL v37 = [(CyclingPowerService *)self cyclingPowerControlPointCharacteristic];

    if (!v37 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006ECAC();
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v15 = v7;
    id v8 = [(CyclingPowerService *)self cyclingPowerSensorLocationCharacteristic];

    if (v8 == v15)
    {
      [(CyclingPowerService *)self updatedSensorLocationCharacteristicValue];
    }
    else
    {
      id v9 = [(CyclingPowerService *)self cyclingPowerFeatureCharacteristic];

      if (v9 == v15)
      {
        [(CyclingPowerService *)self updatedFeatureCharacteristicValue];
      }
      else
      {
        id v10 = [(CyclingPowerService *)self cyclingPowerControlPointCharacteristic];

        if (v10 == v15)
        {
          [(CyclingPowerService *)self updatedControlPointCharacteristicValue];
        }
        else
        {
          id v11 = [(CyclingPowerService *)self cyclingPowerMeasurementCharacteristic];

          if (v11 == v15)
          {
            __int16 v13 = [v15 value];
            int v14 = +[NSDate now];
            [(CyclingPowerService *)self updatedMeasurementCharacteristicValue:v13 at:v14];
          }
          else
          {
            id v12 = [(CyclingPowerService *)self cyclingPowerVectorCharacteristic];

            id v7 = v15;
            if (v12 != v15) {
              goto LABEL_13;
            }
            [(CyclingPowerService *)self updatedVectorCharacteristicValue];
          }
        }
      }
    }
    id v7 = v15;
  }
LABEL_13:
}

- (CBCharacteristic)cyclingPowerMeasurementCharacteristic
{
  return self->_cyclingPowerMeasurementCharacteristic;
}

- (void)setCyclingPowerMeasurementCharacteristic:(id)a3
{
}

- (CBCharacteristic)cyclingPowerVectorCharacteristic
{
  return self->_cyclingPowerVectorCharacteristic;
}

- (void)setCyclingPowerVectorCharacteristic:(id)a3
{
}

- (CBCharacteristic)cyclingPowerFeatureCharacteristic
{
  return self->_cyclingPowerFeatureCharacteristic;
}

- (void)setCyclingPowerFeatureCharacteristic:(id)a3
{
}

- (CBCharacteristic)cyclingPowerSensorLocationCharacteristic
{
  return self->_cyclingPowerSensorLocationCharacteristic;
}

- (void)setCyclingPowerSensorLocationCharacteristic:(id)a3
{
}

- (CBCharacteristic)cyclingPowerControlPointCharacteristic
{
  return self->_cyclingPowerControlPointCharacteristic;
}

- (void)setCyclingPowerControlPointCharacteristic:(id)a3
{
}

- ($871CC4E288729A363A5AD5845BFA35DE)featureFlags
{
  return *($871CC4E288729A363A5AD5845BFA35DE *)&self->_sendZeroForDuplicates;
}

- (void)setFeatureFlags:(id)a3
{
  *($871CC4E288729A363A5AD5845BFA35DE *)&self->_sendZeroForDuplicates = a3;
}

- (double)wheelDiameterInInches
{
  return self->_wheelDiameterInInches;
}

- (void)setWheelDiameterInInches:(double)a3
{
  self->_wheelDiameterInInches = a3;
}

- (HKQuantityDatum)lastDistributedDatum
{
  return self->_lastDistributedDatum;
}

- (void)setLastDistributedDatum:(id)a3
{
}

- (HKDevice)comboHKDevice
{
  return self->_comboHKDevice;
}

- (void)setComboHKDevice:(id)a3
{
}

- (BOOL)sendZeroForDuplicates
{
  return self->lastPowerMeasurementReading.bottom_dead_spot_angle;
}

- (void)setSendZeroForDuplicates:(BOOL)a3
{
  LOBYTE(self->lastPowerMeasurementReading.bottom_dead_spot_angle) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comboHKDevice, 0);
  objc_storeStrong((id *)&self->_lastDistributedDatum, 0);
  objc_storeStrong((id *)&self->_cyclingPowerControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerSensorLocationCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerFeatureCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerVectorCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerMeasurementCharacteristic, 0);

  objc_storeStrong((id *)&self->firstDuplicateEventTimeStamp, 0);
}

@end