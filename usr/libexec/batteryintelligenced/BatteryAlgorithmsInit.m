@interface BatteryAlgorithmsInit
+ (id)sharedInstance;
- (BOOL)fullDataInitNeeded;
- (BatteryAlgorithmsInit)init;
- (NSDictionary)battData;
- (NSDictionary)fullInitData;
- (NSMutableDictionary)dailyData;
- (NSMutableDictionary)deviceState;
- (NSMutableDictionary)obcData;
- (NSMutableDictionary)preInitData;
- (NSMutableDictionary)sbcData;
- (NSMutableDictionary)smcKeys;
- (id)getDeviceModel;
- (void)fullInitDataRead;
@end

@implementation BatteryAlgorithmsInit

+ (id)sharedInstance
{
  if (qword_1000395C8 != -1) {
    dispatch_once(&qword_1000395C8, &stru_1000305C8);
  }
  v2 = (void *)qword_1000395C0;

  return v2;
}

- (id)getDeviceModel
{
  size_t size = 0;
  int v2 = sysctlbyname("hw.targettype", 0, &size, 0, 0);
  if (v2)
  {
    int v8 = v2;
    uint64_t v9 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v8;
      v10 = "Failed to read size (%d).";
      v11 = v9;
      uint32_t v12 = 8;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
LABEL_14:
    v6 = 0;
    goto LABEL_6;
  }
  v3 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v3)
  {
    uint64_t v13 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Failed to malloc.";
      v11 = v13;
      uint32_t v12 = 2;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v4 = v3;
  int v5 = sysctlbyname("hw.targettype", v3, &size, 0, 0);
  if (v5)
  {
    int v14 = v5;
    v15 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to read value (%d).", buf, 8u);
    }
    v6 = 0;
  }
  else
  {
    v6 = +[NSString stringWithUTF8String:v4];
  }
  free(v4);
LABEL_6:

  return v6;
}

- (BatteryAlgorithmsInit)init
{
  v41.receiver = self;
  v41.super_class = (Class)BatteryAlgorithmsInit;
  int v2 = [(BatteryAlgorithmsInit *)&v41 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.batteryintelligence", "BatteryAlgoInputs");
    v4 = (void *)qword_1000395D0;
    qword_1000395D0 = (uint64_t)v3;

    int v5 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting BatteryAlgorithmsInit", buf, 2u);
    }
    uint64_t v6 = sub_100016ECC();
    battData = v2->_battData;
    v2->_battData = (NSDictionary *)v6;

    int v8 = [(BatteryAlgorithmsInit *)v2 battData];
    uint64_t v9 = +[NSMutableDictionary dictionary];
    v10 = [v8 objectForKey:@"BatteryData"];
    v40 = [v8 objectForKey:@"ChargerData"];
    v11 = [v10 objectForKey:@"LifetimeData"];
    uint32_t v12 = [v10 objectForKey:@"AlgoChemID"];
    v39 = [v10 objectForKey:@"Serial"];
    uint64_t v13 = [v8 objectForKey:@"CycleCount"];
    int v14 = [v40 objectForKey:@"VacVoltageLimit"];
    v15 = [v11 objectForKey:@"TimeAtHighSoc"];
    v16 = [v11 objectForKey:@"TotalOperatingTime"];
    [(NSMutableDictionary *)v9 setObject:v13 forKeyedSubscript:@"CycleCount"];
    [(NSMutableDictionary *)v9 setObject:v14 forKeyedSubscript:@"VacVoltageLimit"];
    [(NSMutableDictionary *)v9 setObject:v12 forKeyedSubscript:@"AlgoChemID"];
    [(NSMutableDictionary *)v9 setObject:v15 forKeyedSubscript:@"TimeAtHighSoc"];
    [(NSMutableDictionary *)v9 setObject:v39 forKeyedSubscript:@"Serial"];
    [(NSMutableDictionary *)v9 setObject:v16 forKeyedSubscript:@"TotalOperatingTime"];

    smcKeys = v2->_smcKeys;
    v2->_smcKeys = v9;

    uint64_t v18 = +[NSMutableDictionary dictionary];
    deviceState = v2->_deviceState;
    v2->_deviceState = (NSMutableDictionary *)v18;

    *(void *)buf = 0;
    int v20 = IOPSGetBatteryHealthState();
    if (v20)
    {
      int v21 = v20;
      v22 = qword_1000395D0;
      if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 67109120;
        int v46 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Error fetching battery health state: %d", v45, 8u);
      }
      BOOL v23 = 1;
    }
    else
    {
      id v24 = *(id *)buf;
      v25 = [v24 objectForKeyedSubscript:@"IOPSBatteryHealthState"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v26 = [v25 intValue];

        BOOL v23 = v26 != 4;
      }
      else
      {
        v27 = qword_1000395D0;
        if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Battery health info was not returned", v45, 2u);
        }

        BOOL v23 = 0;
      }
    }
    v28 = +[NSNumber numberWithBool:v23];
    [(NSMutableDictionary *)v2->_deviceState setObject:v28 forKeyedSubscript:@"BatteryAuthPass"];

    v29 = [(BatteryAlgorithmsInit *)v2 getDeviceModel];
    [(NSMutableDictionary *)v2->_deviceState setObject:v29 forKeyedSubscript:@"DeviceType"];

    id v30 = objc_alloc((Class)NSMutableDictionary);
    v43[0] = @"smcData";
    v31 = [(BatteryAlgorithmsInit *)v2 smcKeys];
    v43[1] = @"systemState";
    v44[0] = v31;
    v32 = [(BatteryAlgorithmsInit *)v2 deviceState];
    v44[1] = v32;
    v33 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    v34 = (NSMutableDictionary *)[v30 initWithDictionary:v33];
    preInitData = v2->_preInitData;
    v2->_preInitData = v34;

    v36 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Done BatteryAlgorithmsInit", buf, 2u);
    }
    v37 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001E9F4();
  }

  return v2;
}

- (void)fullInitDataRead
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002694;
  block[3] = &unk_1000305F0;
  block[4] = self;
  if (qword_1000395D8 != -1) {
    dispatch_once(&qword_1000395D8, block);
  }
}

- (NSMutableDictionary)smcKeys
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)deviceState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)sbcData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)obcData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)dailyData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)battData
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)preInitData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)fullInitData
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)fullDataInitNeeded
{
  return self->_fullDataInitNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullInitData, 0);
  objc_storeStrong((id *)&self->_preInitData, 0);
  objc_storeStrong((id *)&self->_battData, 0);
  objc_storeStrong((id *)&self->_dailyData, 0);
  objc_storeStrong((id *)&self->_obcData, 0);
  objc_storeStrong((id *)&self->_sbcData, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);

  objc_storeStrong((id *)&self->_smcKeys, 0);
}

@end