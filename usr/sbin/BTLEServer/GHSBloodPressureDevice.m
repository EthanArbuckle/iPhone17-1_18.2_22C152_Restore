@interface GHSBloodPressureDevice
- (BOOL)extractHealthObservationBloodPressureStatusWithStream:(id)a3 timestamp:(id)a4;
- (BOOL)extractHealthObservationBloodPressureWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5;
- (BOOL)extractHealthObservationHeartRateWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5;
- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8;
- (GHSBloodPressureDevice)initWithProperties:(id)a3 healthStore:(id)a4;
- (void)healthDataSyncBloodPressuresWithSystolicBP:(double)a3 systolicBPUnit:(id)a4 diastolicBP:(double)a5 diastolicBPUnit:(id)a6 startTime:(id)a7 endTime:(id)a8;
- (void)healthDataSyncHeartRate:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6;
@end

@implementation GHSBloodPressureDevice

- (GHSBloodPressureDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
  v9 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];
  v10 = +[HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, 0);

  v15.receiver = self;
  v15.super_class = (Class)GHSBloodPressureDevice;
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
    int v23 = 141559299;
    uint64_t v24 = 1752392040;
    __int16 v25 = 2113;
    v26 = v19;
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 1024;
    unsigned int v30 = a5;
    __int16 v31 = 1024;
    int v32 = v10;
    __int16 v33 = 1024;
    unsigned int v34 = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handle live health observation for peripheral \"%{private, mask.hash}@\": classType %u, observationType %u, userId %u, observationId %u", (uint8_t *)&v23, 0x2Eu);
  }
  if (v12 == 7)
  {
    if (a5 == 150020)
    {
      BOOL v20 = 1;
      if ([(GHSBloodPressureDevice *)self extractHealthObservationBloodPressureWithStream:v14 timestamp:v15 isLive:1])
      {
        goto LABEL_18;
      }
    }
  }
  else if (v12 == 5)
  {
    if (a5 == 8410608
      && [(GHSBloodPressureDevice *)self extractHealthObservationBloodPressureStatusWithStream:v14 timestamp:v15])
    {
      BOOL v20 = 1;
      goto LABEL_18;
    }
  }
  else if (v12 == 1 && a5 == 149546)
  {
    BOOL v20 = 1;
    if ([(GHSBloodPressureDevice *)self extractHealthObservationHeartRateWithStream:v14 timestamp:v15 isLive:1])
    {
      goto LABEL_18;
    }
  }
  v21 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10007659C(v21, self);
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
    int v21 = 141558275;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2113;
    uint64_t v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle stored health observation for peripheral \"%{private, mask.hash}@\"", (uint8_t *)&v21, 0x16u);
  }
  if (v10 == 7)
  {
    if (a5 != 150020
      || ![(GHSBloodPressureDevice *)self extractHealthObservationBloodPressureWithStream:v12 timestamp:v13 isLive:0])
    {
      goto LABEL_11;
    }
LABEL_10:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  if (v10 == 1
    && a5 == 149546
    && [(GHSBloodPressureDevice *)self extractHealthObservationHeartRateWithStream:v12 timestamp:v13 isLive:0])
  {
    goto LABEL_10;
  }
LABEL_11:
  v19 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006D98C(v19, self);
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)healthDataSyncBloodPressuresWithSystolicBP:(double)a3 systolicBPUnit:(id)a4 diastolicBP:(double)a5 diastolicBPUnit:(id)a6 startTime:(id)a7 endTime:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  BOOL v18 = [(GHSBluetoothDevice *)self debugLoggingEnabled];
  LODWORD(a7) = [v18 BOOLValue];

  if (a7)
  {
    v19 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      double v49 = a3;
      __int16 v50 = 2112;
      id v51 = v14;
      __int16 v52 = 2112;
      id v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync systolicBP=%f, unit=%@, date=%@", buf, 0x20u);
    }
    BOOL v20 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      double v49 = a5;
      __int16 v50 = 2112;
      id v51 = v15;
      __int16 v52 = 2112;
      id v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync diastolicBP=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  int v21 = [(GHSBluetoothDevice *)self peripheral];
  uint64_t v22 = [v21 customProperty:@"UpdateHealth"];
  unsigned __int8 v23 = [v22 isEqualToString:@"1"];

  if (v23)
  {
    uint64_t v24 = +[HKUnit unitFromString:v14];
    v42 = +[HKQuantity quantityWithUnit:v24 doubleValue:a3];

    id v44 = v14;
    +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
    id v45 = v17;
    v41 = id v25 = v16;
    v26 = +[HKUnit unitFromString:v15];
    uint64_t v27 = +[HKQuantity quantityWithUnit:v26 doubleValue:a5];

    +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];
    int v28 = v43 = v15;
    __int16 v29 = [(GHSBluetoothDevice *)self hkDevice];
    unsigned int v30 = +[HKQuantitySample quantitySampleWithType:v41 quantity:v42 startDate:v16 endDate:v45 device:v29 metadata:0];

    __int16 v31 = [(GHSBluetoothDevice *)self hkDevice];
    int v32 = (void *)v27;
    __int16 v33 = +[HKQuantitySample quantitySampleWithType:v28 quantity:v27 startDate:v25 endDate:v45 device:v31 metadata:0];

    unsigned int v34 = +[HKCorrelationType correlationTypeForIdentifier:HKCorrelationTypeIdentifierBloodPressure];
    v35 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, v33, 0);
    v36 = [(GHSBluetoothDevice *)self hkDevice];
    v37 = +[HKCorrelation correlationWithType:v34 startDate:v25 endDate:v45 objects:v35 device:v36 metadata:0];

    v38 = [(GHSBluetoothDevice *)self hkStore];
    v47 = v37;
    v39 = +[NSArray arrayWithObjects:&v47 count:1];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100067738;
    v46[3] = &unk_1000B13F8;
    v46[4] = self;
    [v38 saveObjects:v39 withCompletion:v46];

    id v14 = v44;
    id v15 = v43;

    id v16 = v25;
    id v17 = v45;
  }
  else
  {
    v40 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }
}

- (void)healthDataSyncHeartRate:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6
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
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync heartRate=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  id v16 = [(GHSBluetoothDevice *)self peripheral];
  id v17 = [v16 customProperty:@"UpdateHealth"];
  unsigned __int8 v18 = [v17 isEqualToString:@"1"];

  if (v18)
  {
    v19 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    BOOL v20 = +[HKUnit unitFromString:v10];
    int v21 = +[HKQuantity quantityWithUnit:v20 doubleValue:a3];

    uint64_t v22 = [(GHSBluetoothDevice *)self hkDevice];
    unsigned __int8 v23 = +[HKQuantitySample quantitySampleWithType:v19 quantity:v21 startDate:v11 endDate:v12 device:v22 metadata:0];

    uint64_t v24 = [(GHSBluetoothDevice *)self hkStore];
    int v28 = v23;
    id v25 = +[NSArray arrayWithObjects:&v28 count:1];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100067A8C;
    v27[3] = &unk_1000B13F8;
    v27[4] = self;
    [v24 saveObjects:v25 withCompletion:v27];
  }
  else
  {
    v26 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }
}

- (BOOL)extractHealthObservationBloodPressureWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v70 = 0;
  if ([v7 readUint8:&v70])
  {
    v9 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [(GHSBluetoothDevice *)self peripheral];
      id v12 = [v11 name];
      *(_DWORD *)buf = 141558531;
      uint64_t v72 = 1752392040;
      __int16 v73 = 2113;
      v74 = v12;
      __int16 v75 = 1024;
      int v76 = v70;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Compound observation for peripheral \"%{private, mask.hash}@\": numOfObservations %u", buf, 0x1Cu);
    }
  }
  unsigned int v69 = 0;
  __int16 v68 = 0;
  unsigned int v67 = 0;
  unsigned __int16 v66 = 0;
  int v65 = 0;
  __int16 v64 = 0;
  unsigned __int8 v63 = 0;
  if (!v70)
  {
    char v14 = 1;
    goto LABEL_51;
  }
  CFStringRef v56 = 0;
  unsigned int v13 = 0;
  CFStringRef v57 = 0;
  char v14 = 1;
  do
  {
    int v62 = -1;
    if ([v7 readUint32:&v62])
    {
      id v15 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        id v17 = [(GHSBluetoothDevice *)self peripheral];
        unsigned __int8 v18 = [v17 name];
        *(_DWORD *)buf = 141558531;
        uint64_t v72 = 1752392040;
        __int16 v73 = 2113;
        v74 = v18;
        __int16 v75 = 1024;
        int v76 = v62;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Compound observation for peripheral \"%{private, mask.hash}@\": observationType %d", buf, 0x1Cu);
      }
    }
    unsigned int v19 = [v7 readUint8:&v63];
    BOOL v20 = qword_1000CD178;
    if (v19 && v63 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = v20;
        uint64_t v22 = [(GHSBluetoothDevice *)self peripheral];
        unsigned __int8 v23 = [v22 name];
        *(_DWORD *)buf = 141558531;
        uint64_t v72 = 1752392040;
        __int16 v73 = 2113;
        v74 = v23;
        __int16 v75 = 1024;
        int v76 = v63;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Compound observation for peripheral \"%{private, mask.hash}@\": observationClassType %d", buf, 0x1Cu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10007674C(&v60, v61, v20);
      }
      char v14 = 0;
    }
    switch(v62)
    {
      case 150023:
        if (([v7 readUint16:&v64] & 1) == 0)
        {
          double v30 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            v42 = v30;
            id v43 = [(GHSBluetoothDevice *)self peripheral];
            id v44 = [v43 name];
            *(_DWORD *)buf = 141558275;
            uint64_t v72 = 1752392040;
            __int16 v73 = 2113;
            v74 = v44;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\": unit parse failed", buf, 0x16u);
          }
        }
        if (([v7 readUint32:&v65] & 1) == 0)
        {
          __int16 v31 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            id v32 = v31;
            __int16 v33 = [(GHSBluetoothDevice *)self peripheral];
            id v34 = [v33 name];
            *(_DWORD *)buf = 141558275;
            uint64_t v72 = 1752392040;
            __int16 v73 = 2113;
            v74 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\" value parse failed", buf, 0x16u);
          }
        }
        goto LABEL_46;
      case 150022:
        if ([v7 readUint16:&v66])
        {
          CFStringRef v27 = @"mmHg";
          if (v66 == 3872) {
            goto LABEL_33;
          }
          int v28 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            v48 = v28;
            double v49 = [(GHSBluetoothDevice *)self peripheral];
            __int16 v50 = [v49 name];
            *(_DWORD *)buf = 141558531;
            uint64_t v72 = 1752392040;
            __int16 v73 = 2113;
            v74 = v50;
            __int16 v75 = 1024;
            int v76 = v66;
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\": diastolicBP invalid Unit %d", buf, 0x1Cu);
          }
        }
        CFStringRef v27 = v56;
LABEL_33:
        if (([v7 readUint32:&v67] & 1) == 0)
        {
          __int16 v29 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            v39 = v29;
            v40 = [(GHSBluetoothDevice *)self peripheral];
            v41 = [v40 name];
            *(_DWORD *)buf = 141558275;
            uint64_t v72 = 1752392040;
            __int16 v73 = 2113;
            v74 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\" diastolicBP parse failed", buf, 0x16u);
          }
        }
        CFStringRef v56 = v27;
        goto LABEL_46;
      case 150021:
        if ([v7 readUint16:&v68])
        {
          CFStringRef v24 = @"mmHg";
          if (v68 == 3872) {
            goto LABEL_24;
          }
          id v25 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            id v45 = v25;
            v46 = [(GHSBluetoothDevice *)self peripheral];
            v47 = [v46 name];
            *(_DWORD *)buf = 141558531;
            uint64_t v72 = 1752392040;
            __int16 v73 = 2113;
            v74 = v47;
            __int16 v75 = 1024;
            int v76 = v66;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\": systolicBP invalid Unit %d", buf, 0x1Cu);
          }
        }
        CFStringRef v24 = v57;
LABEL_24:
        if (([v7 readUint32:&v69] & 1) == 0)
        {
          v26 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            v36 = v26;
            v37 = [(GHSBluetoothDevice *)self peripheral];
            v38 = [v37 name];
            *(_DWORD *)buf = 141558275;
            uint64_t v72 = 1752392040;
            __int16 v73 = 2113;
            v74 = v38;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\" systolicBP parse failed", buf, 0x16u);
          }
        }
        CFStringRef v57 = v24;
        goto LABEL_46;
    }
    v35 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10007670C(&v58, v59, v35);
    }
    char v14 = 0;
LABEL_46:
    ++v13;
  }
  while (v13 < v70);
  if (v69 && v67)
  {
    [(GHSBloodPressureDevice *)self healthDataSyncBloodPressuresWithSystolicBP:v57 systolicBPUnit:v56 diastolicBP:v8 diastolicBPUnit:v8 startTime:(double)v69 endTime:(double)v67];
    goto LABEL_53;
  }
LABEL_51:
  id v51 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v52 = v51;
    id v53 = [(GHSBluetoothDevice *)self peripheral];
    v54 = [v53 name];
    *(_DWORD *)buf = 141558275;
    uint64_t v72 = 1752392040;
    __int16 v73 = 2113;
    v74 = v54;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", buf, 0x16u);
  }
LABEL_53:

  return v14 & 1;
}

- (BOOL)extractHealthObservationBloodPressureStatusWithStream:(id)a3 timestamp:(id)a4
{
  id v5 = a3;
  unsigned __int8 v24 = 0;
  if ([v5 readUint8:&v24])
  {
    id v7 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      v9 = [(GHSBluetoothDevice *)self peripheral];
      id v10 = [v9 name];
      *(_DWORD *)buf = 141558531;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2113;
      int v28 = v10;
      __int16 v29 = 1024;
      int v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Status for peripheral \"%{private, mask.hash}@\": numOfObservations %u", buf, 0x1Cu);
    }
  }
  int v22 = 0;
  int v23 = 0;
  if (v24)
  {
    unsigned int v11 = 0;
    *(void *)&long long v6 = 141558531;
    long long v21 = v6;
    do
    {
      if (objc_msgSend(v5, "readUint32:", &v23, v21))
      {
        id v12 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = v12;
          char v14 = [(GHSBluetoothDevice *)self peripheral];
          id v15 = [v14 name];
          *(_DWORD *)buf = v21;
          uint64_t v26 = 1752392040;
          __int16 v27 = 2113;
          int v28 = v15;
          __int16 v29 = 1024;
          int v30 = v23;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Status for peripheral \"%{private, mask.hash}@\": %d", buf, 0x1Cu);
        }
      }
      if ([v5 readUint32:&v22])
      {
        id v16 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = v16;
          unsigned __int8 v18 = [(GHSBluetoothDevice *)self peripheral];
          unsigned int v19 = [v18 name];
          *(_DWORD *)buf = v21;
          uint64_t v26 = 1752392040;
          __int16 v27 = 2113;
          int v28 = v19;
          __int16 v29 = 1024;
          int v30 = v22;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Status for peripheral \"%{private, mask.hash}@\": %d", buf, 0x1Cu);
        }
      }
      ++v11;
    }
    while (v11 < v24);
  }

  return 1;
}

- (BOOL)extractHealthObservationHeartRateWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int16 v18 = 0;
  unsigned int v17 = 0;
  if (![v7 readUint16:&v18])
  {
LABEL_6:
    CFStringRef v9 = 0;
    goto LABEL_7;
  }
  if (v18 != 2720)
  {
    id v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100076838(v10, self, &v18);
    }
    goto LABEL_6;
  }
  CFStringRef v9 = @"bpm";
LABEL_7:
  if (([v7 readUint32:&v17] & 1) == 0)
  {
    unsigned int v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      unsigned int v13 = [(GHSBluetoothDevice *)self peripheral];
      char v14 = [v13 name];
      *(_DWORD *)buf = 141558275;
      uint64_t v20 = 1752392040;
      __int16 v21 = 2113;
      int v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Observation value for peripheral \"%{private, mask.hash}@\": parse failed", buf, 0x16u);
    }
  }
  if (v17)
  {
    [(GHSBloodPressureDevice *)self healthDataSyncHeartRate:v9 unit:v8 startTime:v8 endTime:(double)v17];
  }
  else
  {
    id v15 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10007678C(v15, self);
    }
  }

  return 1;
}

@end