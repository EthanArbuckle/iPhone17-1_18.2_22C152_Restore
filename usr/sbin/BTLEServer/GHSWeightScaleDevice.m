@interface GHSWeightScaleDevice
- (BOOL)extractHealthObservationBodyHeightWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5;
- (BOOL)extractHealthObservationBodyMassIndexWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5;
- (BOOL)extractHealthObservationBodyMassWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5;
- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (GHSWeightScaleDevice)initWithProperties:(id)a3 healthStore:(id)a4;
- (void)healthDataSyncBodyMeasurement:(double)a3 measurementType:(id)a4 unit:(id)a5 startTime:(id)a6 endTime:(id)a7;
@end

@implementation GHSWeightScaleDevice

- (GHSWeightScaleDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
  v9 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight];
  v10 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex];
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, 0);

  v15.receiver = self;
  v15.super_class = (Class)GHSWeightScaleDevice;
  v12 = [(GHSBluetoothDevice *)&v15 initWithProperties:v7 healthStore:v6 healthSampleTypes:v11];

  if (v12) {
    v13 = v12;
  }

  return v12;
}

- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  int v10 = a6;
  int v12 = a4;
  id v14 = a3;
  id v15 = a8;
  v16 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = [(GHSBluetoothDevice *)self peripheral];
    v19 = [v18 name];
    int v24 = 141559299;
    uint64_t v25 = 1752392040;
    __int16 v26 = 2113;
    v27 = v19;
    __int16 v28 = 1024;
    int v29 = v12;
    __int16 v30 = 1024;
    unsigned int v31 = a5;
    __int16 v32 = 1024;
    int v33 = v10;
    __int16 v34 = 1024;
    unsigned int v35 = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handle live health observation for peripheral \"%{private, mask.hash}@\": classType %u, observationType %u, userId %u, observationId %u", (uint8_t *)&v24, 0x2Eu);
  }
  if (v12 == 1)
  {
    switch(a5)
    {
      case 0x2E150u:
        BOOL v20 = 1;
        if ([(GHSWeightScaleDevice *)self extractHealthObservationBodyMassIndexWithStream:v14 timestamp:v15 isLive:1])
        {
          goto LABEL_18;
        }
        break;
      case 0x2E144u:
        BOOL v20 = 1;
        if ([(GHSWeightScaleDevice *)self extractHealthObservationBodyHeightWithStream:v14 timestamp:v15 isLive:1])
        {
          goto LABEL_18;
        }
        break;
      case 0x2E140u:
        BOOL v20 = 1;
        if ([(GHSWeightScaleDevice *)self extractHealthObservationBodyMassWithStream:v14 timestamp:v15 isLive:1])
        {
          goto LABEL_18;
        }
        break;
      default:
        v21 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_1000760E8(v21);
        }
        break;
    }
  }
  v22 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100073A18(v22);
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  int v10 = a4;
  id v12 = a3;
  id v13 = a8;
  id v14 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    v16 = [(GHSBluetoothDevice *)self peripheral];
    v17 = [v16 name];
    int v22 = 141558275;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2113;
    uint64_t v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle stored health observation for peripheral \"%{private, mask.hash}@\"", (uint8_t *)&v22, 0x16u);
  }
  if (v10 != 1) {
    goto LABEL_15;
  }
  if (a5 == 188752)
  {
    if (![(GHSWeightScaleDevice *)self extractHealthObservationBodyMassIndexWithStream:v12 timestamp:v13 isLive:0])goto LABEL_15; {
    goto LABEL_12;
    }
  }
  if (a5 == 188740)
  {
    if (![(GHSWeightScaleDevice *)self extractHealthObservationBodyHeightWithStream:v12 timestamp:v13 isLive:0])goto LABEL_15; {
LABEL_12:
    }
    BOOL v18 = 1;
    goto LABEL_18;
  }
  if (a5 != 188736)
  {
    v19 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10007623C(v19);
    }
    goto LABEL_15;
  }
  if ([(GHSWeightScaleDevice *)self extractHealthObservationBodyMassWithStream:v12 timestamp:v13 isLive:0])
  {
    goto LABEL_12;
  }
LABEL_15:
  BOOL v20 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100076194(v20);
  }
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (void)healthDataSyncBodyMeasurement:(double)a3 measurementType:(id)a4 unit:(id)a5 startTime:(id)a6 endTime:(id)a7
{
  id v12 = (NSString *)a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(GHSBluetoothDevice *)self debugLoggingEnabled];
  unsigned int v17 = [v16 BOOLValue];

  if (v17)
  {
    if (HKQuantityTypeIdentifierBodyMass == v12)
    {
      BOOL v18 = @"BodyMass";
    }
    else if (HKQuantityTypeIdentifierHeight == v12)
    {
      BOOL v18 = @"BodyHeight";
    }
    else
    {
      BOOL v18 = HKQuantityTypeIdentifierBodyMassIndex == v12 ? @"BodyMassIndex" : @"Unknown";
    }
    v19 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v34 = v18;
      __int16 v35 = 2048;
      double v36 = a3;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync %@=%f, unit=%@, date=%@", buf, 0x2Au);
    }
  }
  BOOL v20 = [(GHSBluetoothDevice *)self peripheral];
  v21 = [v20 customProperty:@"UpdateHealth"];
  unsigned __int8 v22 = [v21 isEqualToString:@"1"];

  if (v22)
  {
    uint64_t v23 = +[HKQuantityType quantityTypeForIdentifier:v12];
    if (v13) {
      +[HKUnit unitFromString:v13];
    }
    else {
    uint64_t v25 = +[HKUnit countUnit];
    }
    __int16 v26 = +[HKQuantity quantityWithUnit:v25 doubleValue:a3];

    v27 = [(GHSBluetoothDevice *)self hkDevice];
    __int16 v28 = +[HKQuantitySample quantitySampleWithType:v23 quantity:v26 startDate:v14 endDate:v15 device:v27 metadata:0];

    int v29 = [(GHSBluetoothDevice *)self hkStore];
    __int16 v32 = v28;
    __int16 v30 = +[NSArray arrayWithObjects:&v32 count:1];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10006473C;
    v31[3] = &unk_1000B13F8;
    v31[4] = self;
    [v29 saveObjects:v30 withCompletion:v31];
  }
  else
  {
    __int16 v24 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }
}

- (BOOL)extractHealthObservationBodyMassWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v17 = 0;
  float v16 = 0.0;
  if (![v7 readUint16:&v17])
  {
    CFStringRef v9 = 0;
    goto LABEL_7;
  }
  if (v17 == 1731)
  {
    CFStringRef v9 = @"g";
    goto LABEL_7;
  }
  if (v17 == 1760)
  {
    CFStringRef v9 = @"lb";
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  id v15 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_1000762E8(v15);
  }
  BOOL v10 = 0;
  CFStringRef v9 = 0;
LABEL_8:
  if (([v7 readIEEEFloat:&v16] & 1) == 0)
  {
    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073CCC(v11);
    }
    if (v17 == 1731)
    {
      BOOL v10 = 0;
      float v12 = v16 * 1000.0;
      float v16 = v16 * 1000.0;
      goto LABEL_15;
    }
    BOOL v10 = 0;
  }
  float v12 = v16;
LABEL_15:
  if (v12 == 0.0)
  {
    id v13 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073C24(v13);
    }
  }
  else
  {
    [(GHSWeightScaleDevice *)self healthDataSyncBodyMeasurement:HKQuantityTypeIdentifierBodyMass measurementType:v9 unit:v8 startTime:v8 endTime:v12];
  }

  return v10;
}

- (BOOL)extractHealthObservationBodyHeightWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v17 = 0;
  float v16 = 0.0;
  if (![v7 readUint16:&v17])
  {
    CFStringRef v9 = 0;
    goto LABEL_7;
  }
  if (v17 == 1297)
  {
    CFStringRef v9 = @"m";
    goto LABEL_7;
  }
  if (v17 == 1376)
  {
    CFStringRef v9 = @"in";
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  id v15 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_1000762E8(v15);
  }
  BOOL v10 = 0;
  CFStringRef v9 = 0;
LABEL_8:
  if (([v7 readIEEEFloat:&v16] & 1) == 0)
  {
    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073CCC(v11);
    }
    if (v17 == 1297)
    {
      BOOL v10 = 0;
      float v12 = v16 / 100.0;
      float v16 = v16 / 100.0;
      goto LABEL_15;
    }
    BOOL v10 = 0;
  }
  float v12 = v16;
LABEL_15:
  if (v12 == 0.0)
  {
    id v13 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073C24(v13);
    }
  }
  else
  {
    [(GHSWeightScaleDevice *)self healthDataSyncBodyMeasurement:HKQuantityTypeIdentifierHeight measurementType:v9 unit:v8 startTime:v8 endTime:v12];
  }

  return v10;
}

- (BOOL)extractHealthObservationBodyMassIndexWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v16 = 0;
  float v15 = 0.0;
  unsigned int v9 = [v7 readUint16:&v16];
  if (v16 == 7747) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = v9;
  }
  if (v10 == 1)
  {
    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_1000762E8(v11);
    }
  }
  if (([v7 readIEEEFloat:&v15] & 1) == 0)
  {
    float v12 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073CCC(v12);
    }
  }
  if (v15 == 0.0)
  {
    id v13 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073C24(v13);
    }
  }
  else
  {
    [(GHSWeightScaleDevice *)self healthDataSyncBodyMeasurement:HKQuantityTypeIdentifierBodyMassIndex measurementType:0 unit:v8 startTime:v8 endTime:v15];
  }

  return v10 ^ 1;
}

@end