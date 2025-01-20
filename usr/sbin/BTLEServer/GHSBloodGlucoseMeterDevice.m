@interface GHSBloodGlucoseMeterDevice
- (BOOL)extractHealthObservationBloodGlucoseWithStream:(id)a3 observationType:(unsigned int)a4 timestamp:(id)a5 isLive:(BOOL)a6;
- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (GHSBloodGlucoseMeterDevice)initWithProperties:(id)a3 healthStore:(id)a4;
- (void)healthDataSyncBloodGlucose:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6;
@end

@implementation GHSBloodGlucoseMeterDevice

- (GHSBloodGlucoseMeterDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, 0);

  v13.receiver = self;
  v13.super_class = (Class)GHSBloodGlucoseMeterDevice;
  v10 = [(GHSBluetoothDevice *)&v13 initWithProperties:v7 healthStore:v6 healthSampleTypes:v9];

  if (v10) {
    v11 = v10;
  }

  return v10;
}

- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  int v10 = a6;
  uint64_t v11 = *(void *)&a5;
  int v12 = a4;
  id v14 = a3;
  id v15 = a8;
  v16 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = [(GHSBluetoothDevice *)self peripheral];
    v19 = [v18 name];
    int v22 = 141559299;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2113;
    v25 = v19;
    __int16 v26 = 1024;
    int v27 = v12;
    __int16 v28 = 1024;
    int v29 = v11;
    __int16 v30 = 1024;
    int v31 = v10;
    __int16 v32 = 1024;
    unsigned int v33 = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handle live health observation for peripheral \"%{private, mask.hash}@\": classType %u, observationType %u, userId %u, observationId %u", (uint8_t *)&v22, 0x2Eu);
  }
  if (v12 != 1
    || ![(GHSBloodGlucoseMeterDevice *)self extractHealthObservationBloodGlucoseWithStream:v14 observationType:v11 timestamp:v15 isLive:1])
  {
    v20 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D8E0(v20, self);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  uint64_t v9 = *(void *)&a5;
  int v10 = a4;
  id v12 = a3;
  id v13 = a8;
  id v14 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    v16 = [(GHSBluetoothDevice *)self peripheral];
    v17 = [v16 name];
    int v21 = 141558275;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2113;
    __int16 v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle stored health observation for peripheral \"%{private, mask.hash}@\"", (uint8_t *)&v21, 0x16u);
  }
  if (v10 == 1
    && [(GHSBloodGlucoseMeterDevice *)self extractHealthObservationBloodGlucoseWithStream:v12 observationType:v9 timestamp:v13 isLive:0])
  {
    BOOL v18 = 1;
  }
  else
  {
    v19 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006D98C(v19, self);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void)healthDataSyncBloodGlucose:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(GHSBluetoothDevice *)self debugLoggingEnabled];
  unsigned int v14 = [v13 BOOLValue];

  if (v14)
  {
    id v15 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      double v30 = a3;
      __int16 v31 = 2112;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync bloodGlucose=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  v16 = [(GHSBluetoothDevice *)self peripheral];
  v17 = [v16 customProperty:@"UpdateHealth"];
  unsigned __int8 v18 = [v17 isEqualToString:@"1"];

  if (v18)
  {
    v19 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];
    v20 = +[HKUnit unitFromString:v10];
    int v21 = +[HKQuantity quantityWithUnit:v20 doubleValue:a3];

    uint64_t v22 = [(GHSBluetoothDevice *)self hkDevice];
    __int16 v23 = +[HKQuantitySample quantitySampleWithType:v19 quantity:v21 startDate:v11 endDate:v12 device:v22 metadata:0];

    __int16 v24 = [(GHSBluetoothDevice *)self hkStore];
    __int16 v28 = v23;
    v25 = +[NSArray arrayWithObjects:&v28 count:1];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100013154;
    v27[3] = &unk_1000B13F8;
    v27[4] = self;
    [v24 saveObjects:v25 withCompletion:v27];
  }
  else
  {
    __int16 v26 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }
}

- (BOOL)extractHealthObservationBloodGlucoseWithStream:(id)a3 observationType:(unsigned int)a4 timestamp:(id)a5 isLive:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4 != 160184)
  {
    BOOL v12 = 1;
    goto LABEL_17;
  }
  unsigned __int16 v21 = 0;
  float v20 = 0.0;
  if ([v9 readUint16:&v21])
  {
    if (v21 == 2130)
    {
      CFStringRef v11 = @"mg/dL";
    }
    else
    {
      if (v21 != 4722)
      {
        v19 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006DBDC(v19, self, &v21);
        }
        BOOL v12 = 0;
        CFStringRef v11 = 0;
        goto LABEL_10;
      }
      CFStringRef v11 = @"mmol/L";
    }
  }
  else
  {
    CFStringRef v11 = 0;
  }
  BOOL v12 = 1;
LABEL_10:
  if (([v9 readIEEEFloat:&v20] & 1) == 0)
  {
    id v13 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DB30(v13, self);
    }
  }
  if (v20 == 0.0)
  {
    unsigned int v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      v16 = [(GHSBluetoothDevice *)self peripheral];
      v17 = [v16 name];
      *(_DWORD *)buf = 141558275;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2113;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", buf, 0x16u);
    }
  }
  else
  {
    [(GHSBloodGlucoseMeterDevice *)self healthDataSyncBloodGlucose:v11 unit:v10 startTime:v10 endTime:v20];
  }
LABEL_17:

  return v12;
}

@end