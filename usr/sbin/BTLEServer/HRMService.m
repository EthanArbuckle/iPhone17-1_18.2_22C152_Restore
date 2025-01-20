@interface HRMService
+ (id)UUID;
- (BOOL)_isFitnessClassicDevice;
- (BOOL)_updateHealthEnabled;
- (BOOL)supportsHKQuantityType:(id)a3;
- (CBCharacteristic)bodySensorLocationCharacteristic;
- (CBCharacteristic)heartRateMeasurementCharacteristic;
- (HKQuantityType)hkQuantityType;
- (HRMService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSArray)_alwaysCollectQuantityTypes;
- (void)collectData:(BOOL)a3;
- (void)didUpdateBodySensorLocation:(id)a3;
- (void)didUpdateHeartRateMeasurement:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)refreshUpdateHealthEnabledStatus;
- (void)setBodySensorLocationCharacteristic:(id)a3;
- (void)setHeartRateMeasurementCharacteristic:(id)a3;
- (void)setHkQuantityType:(id)a3;
- (void)set_alwaysCollectQuantityTypes:(id)a3;
- (void)set_isFitnessClassicDevice:(BOOL)a3;
- (void)set_updateHealthEnabled:(BOOL)a3;
- (void)start;
@end

@implementation HRMService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDHeartRateServiceString];
}

- (HRMService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)HRMService;
  v5 = [(FitnessService *)&v16 initWithManager:a3 peripheral:a4 service:a5];
  v6 = [(ClientService *)v5 peripheral];
  -[HRMService set_isFitnessClassicDevice:](v5, "set_isFitnessClassicDevice:", [v6 hasTag:@"FitnessClassic"]);

  v7 = +[FitnessDeviceManager instance];
  if ([v7 workoutInSession]) {
    goto LABEL_5;
  }
  unsigned __int8 v8 = [(HRMService *)v5 _isFitnessClassicDevice];

  if ((v8 & 1) == 0)
  {
    v9 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    v21 = v9;
    v10 = +[NSArray arrayWithObjects:&v21 count:1];
    [(HRMService *)v5 set_alwaysCollectQuantityTypes:v10];

    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v11;
      v12 = [(HRMService *)v5 _alwaysCollectQuantityTypes];
      v13 = [(ClientService *)v5 peripheral];
      v14 = [v13 name];
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Always collect quantity types: %@ for peripheral %@", buf, 0x16u);

LABEL_5:
    }
  }
  [(HRMService *)v5 refreshUpdateHealthEnabledStatus];
  return v5;
}

- (void)refreshUpdateHealthEnabledStatus
{
  v3 = [(ClientService *)self peripheral];
  v4 = [v3 customProperty:@"UpdateHealth"];
  -[HRMService set_updateHealthEnabled:](self, "set_updateHealthEnabled:", [v4 isEqualToString:@"1"]);

  if (![(HRMService *)self _updateHealthEnabled]
    && ![(HRMService *)self _isFitnessClassicDevice])
  {
    v5 = [(HRMService *)self _alwaysCollectQuantityTypes];
    id v6 = [v5 count];

    if (v6)
    {
      v7 = objc_opt_new();
      [(HRMService *)self set_alwaysCollectQuantityTypes:v7];

      [(FitnessService *)self stop];
    }
  }
}

- (void)start
{
  v9.receiver = self;
  v9.super_class = (Class)HRMService;
  [(FitnessService *)&v9 start];
  if (_os_feature_enabled_impl())
  {
    v3 = +[FitnessService hkQuantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    [(HRMService *)self setHkQuantityType:v3];

    v4 = +[CBUUID UUIDWithString:CBUUIDHeartRateMeasurementCharacteristicString];
    v10[0] = v4;
    v5 = +[CBUUID UUIDWithString:CBUUIDBodySensorLocationCharacteristicString];
    v10[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v10 count:2];

    v7 = [(ClientService *)self peripheral];
    unsigned __int8 v8 = [(ClientService *)self service];
    [v7 discoverCharacteristics:v6 forService:v8];
  }
}

- (BOOL)supportsHKQuantityType:(id)a3
{
  v4 = [a3 identifier];
  v5 = [(HRMService *)self hkQuantityType];
  id v6 = [v5 identifier];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  return v7;
}

- (void)collectData:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v6 = @"ON";
    }
    else {
      CFStringRef v6 = @"OFF";
    }
    unsigned __int8 v7 = v5;
    unsigned __int8 v8 = [(ClientService *)self peripheral];
    objc_super v9 = [v8 name];
    int v13 = 138412546;
    CFStringRef v14 = v6;
    __int16 v15 = 2112;
    objc_super v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "collectData:%@ for “%@”", (uint8_t *)&v13, 0x16u);
  }
  v10 = [(HRMService *)self heartRateMeasurementCharacteristic];
  unsigned int v11 = [v10 isNotifying];

  if (v11 != v3)
  {
    v12 = [(HRMService *)self heartRateMeasurementCharacteristic];
    [(FitnessService *)self setNotify:v3 forCharacteristic:v12];
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v32 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071B2C(v10, v8, v9);
    }
    goto LABEL_27;
  }
  id v31 = v8;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unsigned int v11 = [v8 characteristics];
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v35;
    uint64_t v15 = CBUUIDHeartRateMeasurementCharacteristicString;
    uint64_t v33 = CBUUIDBodySensorLocationCharacteristicString;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v18 = [(HRMService *)self heartRateMeasurementCharacteristic];
        if (v18)
        {
        }
        else
        {
          __int16 v19 = [v17 UUID];
          v20 = +[CBUUID UUIDWithString:v15];
          unsigned int v21 = [v19 isEqual:v20];

          if (v21)
          {
            [(HRMService *)self setHeartRateMeasurementCharacteristic:v17];
            continue;
          }
        }
        v22 = [(HRMService *)self bodySensorLocationCharacteristic];
        if (v22)
        {
        }
        else
        {
          v23 = [v17 UUID];
          v24 = +[CBUUID UUIDWithString:v33];
          unsigned int v25 = [v23 isEqual:v24];

          if (v25)
          {
            [(HRMService *)self setBodySensorLocationCharacteristic:v17];
            if (([v17 properties] & 2) != 0) {
              [v32 readValueForCharacteristic:v17];
            }
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }

  v26 = [(HRMService *)self heartRateMeasurementCharacteristic];

  if (!v26)
  {
    v27 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071AE8(v27);
    }
  }
  v28 = [(HRMService *)self bodySensorLocationCharacteristic];

  if (!v28)
  {
    v29 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071AA4(v29);
    }
  }
  [(ClientService *)self notifyDidStart];
  v30 = +[FitnessDeviceManager instance];
  [v30 registerFitnessService:self];

  id v9 = 0;
  id v8 = v31;
LABEL_27:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v12 = [(HRMService *)self heartRateMeasurementCharacteristic];
    if (v12 == v9)
    {
      uint64_t v14 = [(HRMService *)self heartRateMeasurementCharacteristic];
      uint64_t v15 = [v14 value];

      if (v15)
      {
        objc_super v16 = [(HRMService *)self heartRateMeasurementCharacteristic];
        v17 = [v16 value];
        [(HRMService *)self didUpdateHeartRateMeasurement:v17];
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v13 = [(HRMService *)self bodySensorLocationCharacteristic];
    if (v13 != v9)
    {

      goto LABEL_13;
    }
    v18 = [(HRMService *)self bodySensorLocationCharacteristic];
    __int16 v19 = [v18 value];

    if (!v19) {
      goto LABEL_13;
    }
    objc_super v16 = [(HRMService *)self bodySensorLocationCharacteristic];
    v17 = [v16 value];
    [(HRMService *)self didUpdateBodySensorLocation:v17];
LABEL_12:

    goto LABEL_13;
  }
  unsigned int v11 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100071BF0(v11, v9, v10);
  }
LABEL_13:
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071CB4(v10, v8, v9);
    }
  }
}

- (void)didUpdateHeartRateMeasurement:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] > 1)
  {
    CFStringRef v6 = +[NSDate now];
    char v15 = 0;
    [v4 getBytes:&v15 length:1];
    unsigned __int16 v14 = 0;
    if (v15) {
      [v4 getBytes:&v14 range:1, 2];
    }
    else {
      unsigned __int16 v14 = *((unsigned __int8 *)[v4 bytes] + 1);
    }
    id v7 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_100071E14(&v14, v7);
    }
    if (v14)
    {
      if ([(HRMService *)self _updateHealthEnabled])
      {
        LOWORD(v8) = v14;
        double v9 = (double)v8;
        id v10 = [(HRMService *)self hkQuantityType];
        [(FitnessService *)self recordDatum:v6 start:v6 end:v10 quantityType:v9];

        unsigned int v11 = [(HRMService *)self hkQuantityType];
        [(FitnessService *)self storeDatumsForQuantityType:v11];
      }
    }
    else
    {
      id v12 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring invalid HR value", v13, 2u);
      }
    }
  }
  else
  {
    v5 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100071D78(v5, v4);
    }
  }
}

- (void)didUpdateBodySensorLocation:(id)a3
{
  id v4 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    CFStringRef v6 = [a3 debugDescription];
    int v7 = 138412290;
    unint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HRM Service: Updated body sensor location: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (CBCharacteristic)heartRateMeasurementCharacteristic
{
  return self->_heartRateMeasurementCharacteristic;
}

- (void)setHeartRateMeasurementCharacteristic:(id)a3
{
}

- (CBCharacteristic)bodySensorLocationCharacteristic
{
  return self->_bodySensorLocationCharacteristic;
}

- (void)setBodySensorLocationCharacteristic:(id)a3
{
}

- (HKQuantityType)hkQuantityType
{
  return self->_hkQuantityType;
}

- (void)setHkQuantityType:(id)a3
{
}

- (NSArray)_alwaysCollectQuantityTypes
{
  return self->__alwaysCollectQuantityTypes;
}

- (void)set_alwaysCollectQuantityTypes:(id)a3
{
}

- (BOOL)_updateHealthEnabled
{
  return self->__updateHealthEnabled;
}

- (void)set_updateHealthEnabled:(BOOL)a3
{
  self->__updateHealthEnabled = a3;
}

- (BOOL)_isFitnessClassicDevice
{
  return self->__isFitnessClassicDevice;
}

- (void)set_isFitnessClassicDevice:(BOOL)a3
{
  self->__isFitnessClassicDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alwaysCollectQuantityTypes, 0);
  objc_storeStrong((id *)&self->_hkQuantityType, 0);
  objc_storeStrong((id *)&self->_bodySensorLocationCharacteristic, 0);

  objc_storeStrong((id *)&self->_heartRateMeasurementCharacteristic, 0);
}

@end