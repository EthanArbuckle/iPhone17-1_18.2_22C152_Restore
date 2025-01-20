@interface GHSThermometerDevice
- (BOOL)extractHealthObservationBodyTemperatureWithStream:(id)a3 observationType:(unsigned int)a4 timestamp:(id)a5 isLive:(BOOL)a6;
- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (GHSThermometerDevice)initWithProperties:(id)a3 healthStore:(id)a4;
- (void)healthDataSyncBodyTemperature:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6 sensorLocType:(int64_t)a7;
@end

@implementation GHSThermometerDevice

- (GHSThermometerDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, 0);

  v13.receiver = self;
  v13.super_class = (Class)GHSThermometerDevice;
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
    || ![(GHSThermometerDevice *)self extractHealthObservationBodyTemperatureWithStream:v14 observationType:v11 timestamp:v15 isLive:1])
  {
    v20 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073A18(v20);
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
    && [(GHSThermometerDevice *)self extractHealthObservationBodyTemperatureWithStream:v12 observationType:v9 timestamp:v13 isLive:0])
  {
    BOOL v18 = 1;
  }
  else
  {
    v19 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073AC0(v19);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void)healthDataSyncBodyTemperature:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6 sensorLocType:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(GHSBluetoothDevice *)self debugLoggingEnabled];
  unsigned int v16 = [v15 BOOLValue];

  if (v16)
  {
    v17 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      double v36 = a3;
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync bodyTemperature=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  BOOL v18 = [(GHSBluetoothDevice *)self peripheral];
  v19 = [v18 customProperty:@"UpdateHealth"];
  unsigned __int8 v20 = [v19 isEqualToString:@"1"];

  if (v20)
  {
    int v21 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature];
    uint64_t v22 = +[HKUnit unitFromString:v12];
    __int16 v23 = +[HKQuantity quantityWithUnit:v22 doubleValue:a3];

    unsigned int v33 = HKMetadataKeyBodyTemperatureSensorLocation;
    __int16 v24 = +[NSNumber numberWithInteger:a7];
    v34 = v24;
    v25 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

    __int16 v26 = [(GHSBluetoothDevice *)self hkDevice];
    int v27 = +[HKQuantitySample quantitySampleWithType:v21 quantity:v23 startDate:v13 endDate:v14 device:v26 metadata:v25];

    __int16 v28 = [(GHSBluetoothDevice *)self hkStore];
    __int16 v32 = v27;
    int v29 = +[NSArray arrayWithObjects:&v32 count:1];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004D72C;
    v31[3] = &unk_1000B13F8;
    v31[4] = self;
    [v28 saveObjects:v29 withCompletion:v31];
  }
  else
  {
    __int16 v30 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }
}

- (BOOL)extractHealthObservationBodyTemperatureWithStream:(id)a3 observationType:(unsigned int)a4 timestamp:(id)a5 isLive:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  if ((int)a4 > 188423)
  {
    if ((int)a4 > 188451)
    {
      switch(a4)
      {
        case 0x2E024u:
          uint64_t v11 = 1;
          goto LABEL_26;
        case 0x2E028u:
          uint64_t v11 = 5;
          goto LABEL_26;
        case 0x2E030u:
          uint64_t v11 = 8;
          goto LABEL_26;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x2E008u:
          uint64_t v11 = 6;
          goto LABEL_26;
        case 0x2E00Cu:
          uint64_t v11 = 3;
          goto LABEL_26;
        case 0x2E010u:
          uint64_t v11 = 4;
          goto LABEL_26;
      }
    }
LABEL_44:
    BOOL v18 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073B68(v18, self);
    }
    BOOL v13 = 0;
    goto LABEL_40;
  }
  uint64_t v11 = 2;
  if ((int)a4 > 150387)
  {
    switch(a4)
    {
      case 0x24B74u:
        goto LABEL_26;
      case 0x24B78u:
        uint64_t v11 = 9;
        goto LABEL_26;
      case 0x2E004u:
        uint64_t v11 = 7;
        goto LABEL_26;
    }
    goto LABEL_44;
  }
  if (a4 != 150344)
  {
    if (a4 == 150352)
    {
      uint64_t v11 = 10;
    }
    else if (a4 != 150364)
    {
      goto LABEL_44;
    }
  }
LABEL_26:
  __int16 v20 = 0;
  float v19 = 0.0;
  if ([v9 readUint16:&v20])
  {
    if (v20 == 4416)
    {
      CFStringRef v12 = @"degF";
    }
    else
    {
      if (v20 != 6048)
      {
        v17 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100073D74(v17, self);
        }
        BOOL v13 = 0;
        CFStringRef v12 = 0;
        goto LABEL_33;
      }
      CFStringRef v12 = @"degC";
    }
  }
  else
  {
    CFStringRef v12 = 0;
  }
  BOOL v13 = 1;
LABEL_33:
  if (([v9 readIEEEFloat:&v19] & 1) == 0)
  {
    id v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073CCC(v14);
    }
  }
  if (v19 == 0.0)
  {
    id v15 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073C24(v15);
    }
  }
  else
  {
    [(GHSThermometerDevice *)self healthDataSyncBodyTemperature:v12 unit:v10 startTime:v10 endTime:v11 sensorLocType:v19];
  }
LABEL_40:

  return v13;
}

@end