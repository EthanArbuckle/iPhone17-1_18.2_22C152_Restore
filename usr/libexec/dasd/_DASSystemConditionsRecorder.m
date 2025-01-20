@interface _DASSystemConditionsRecorder
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASSystemConditionsRecorder)init;
- (void)recordBatteryStatus;
- (void)recordForKeyPaths:(id)a3;
- (void)recordMotionStatus;
- (void)recordNetworkStatus;
- (void)recordPowerManagementStatus;
- (void)setContext:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASSystemConditionsRecorder

- (void)recordForKeyPaths:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E2FC;
  v7[3] = &unk_100175570;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)recordPowerManagementStatus
{
  id v18 = +[NSMutableDictionary dictionary];
  context = self->_context;
  id v4 = +[_CDContextQueries keyPathForThermalPressureLevel];
  v5 = [(_CDContext *)context objectForKeyedSubscript:v4];
  [v18 setObject:v5 forKeyedSubscript:@"ThermalPressure"];

  id v6 = self->_context;
  v7 = +[_CDContextQueries keyPathForInUseStatus];
  id v8 = [(_CDContext *)v6 objectForKeyedSubscript:v7];
  [v18 setObject:v8 forKeyedSubscript:@"UserActivityStatus"];

  v9 = self->_context;
  v10 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/system/peakPowerPressureLevel"];
  v11 = [(_CDContext *)v9 objectForKeyedSubscript:v10];
  [v18 setObject:v11 forKeyedSubscript:@"PeakPowerPressure"];

  v12 = self->_context;
  v13 = +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus];
  v14 = [(_CDContext *)v12 objectForKeyedSubscript:v13];
  [v18 setObject:v14 forKeyedSubscript:@"EnergyBudget"];

  v15 = +[_DASGridDataManager sharedInstance];
  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isHighCarbonImpactWindow]);
  [v18 setObject:v16 forKeyedSubscript:@"CarbonImpactWindow"];

  v17 = +[_DASPPSDataManager sharedInstance];
  [v17 sendDataToPPS:v18 subsystem:@"BackgroundProcessing" category:@"SystemConditionsPowerManagement"];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A94C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3EF0 != -1) {
    dispatch_once(&qword_1001C3EF0, block);
  }
  v2 = (void *)qword_1001C3EE8;

  return v2;
}

- (_DASSystemConditionsRecorder)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DASSystemConditionsRecorder;
  v2 = [(_DASSystemConditionsRecorder *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[_CDClientContext userContext];
    context = v2->_context;
    v2->_context = (_CDContext *)v3;

    os_log_t v5 = os_log_create("com.apple.duetactivityscheduler", "systemconditionrecorder");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.duetactivityscheduler.systemConditionsRecorder", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)recordNetworkStatus
{
  id v13 = +[NSMutableDictionary dictionary];
  id v3 = +[_CDNetworkContext wifiQuality:self->_context];
  id v4 = +[_CDNetworkContext cellQuality:self->_context];
  os_log_t v5 = +[NSNumber numberWithInteger:v3];
  [v13 setObject:v5 forKeyedSubscript:@"WifiQuality"];

  id v6 = +[NSNumber numberWithInteger:v4];
  [v13 setObject:v6 forKeyedSubscript:@"CellQuality"];

  context = self->_context;
  id v8 = +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus];
  dispatch_queue_t v9 = [(_CDContext *)context objectForKeyedSubscript:v8];
  [v13 setObject:v9 forKeyedSubscript:@"DataBudget"];

  v10 = +[_DASInternetSharingPolicy policyInstance];
  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 enabled]);
  [v13 setObject:v11 forKeyedSubscript:@"InternetSharingOn"];

  objc_super v12 = +[_DASPPSDataManager sharedInstance];
  [v12 sendDataToPPS:v13 subsystem:@"BackgroundProcessing" category:@"SystemConditionsNetwork"];
}

- (void)recordMotionStatus
{
  id v23 = +[NSMutableDictionary dictionary];
  context = self->_context;
  id v4 = +[_CDContextQueries keyPathForMotionState];
  os_log_t v5 = [(_CDContext *)context objectForKeyedSubscript:v4];
  id v6 = [v5 integerValue];

  v7 = self->_context;
  id v8 = +[_CDContextQueries keyPathForCallInProgressStatus];
  dispatch_queue_t v9 = [(_CDContext *)v7 objectForKeyedSubscript:v8];
  LOBYTE(v7) = [v9 BOOLValue];

  v10 = self->_context;
  v11 = +[_CDContextQueries keyPathForCarplayConnectedStatus];
  objc_super v12 = [(_CDContext *)v10 objectForKeyedSubscript:v11];
  unsigned __int8 v13 = [v12 BOOLValue];

  v14 = self->_context;
  v15 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/car/isConnected"];
  v16 = [(_CDContext *)v14 objectForKeyedSubscript:v15];
  unsigned __int8 v17 = [v16 BOOLValue];

  id v18 = self->_context;
  v19 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/maps/navigationInProgress"];
  v20 = [(_CDContext *)v18 objectForKeyedSubscript:v19];
  unsigned __int8 v21 = [v20 BOOLValue];

  if ((v7 & 1) != 0
    || (v13 & 1) != 0
    || (v17 & 1) != 0
    || (v21 & 1) != 0
    || v6 != (id)_DASMotionStateAny && v6 != (id)_DASMotionStateStationary)
  {
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:@"InUseOrMotion"];
  }
  [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:@"InUseOrMotion"];
  v22 = +[_DASPPSDataManager sharedInstance];
  [v22 sendDataToPPS:v23 subsystem:@"BackgroundProcessing" category:@"SystemConditionsInUseOrMotion"];
}

- (void)recordBatteryStatus
{
  context = self->_context;
  id v4 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v22 = [(_CDContext *)context objectForKeyedSubscript:v4];

  os_log_t v5 = +[NSMutableDictionary dictionary];
  id v6 = self->_context;
  v7 = +[_CDContextQueries keyPathForBatteryLevel];
  id v8 = [(_CDContext *)v6 objectForKeyedSubscript:v7];
  [v5 setObject:v8 forKeyedSubscript:@"BatteryLevel"];

  dispatch_queue_t v9 = self->_context;
  v10 = +[_CDContextQueries keyPathForPluginStatus];
  v11 = [(_CDContext *)v9 objectForKeyedSubscript:v10];
  [v5 setObject:v11 forKeyedSubscript:@"IsPluggedIn"];

  objc_super v12 = self->_context;
  unsigned __int8 v13 = +[_CDContextQueries keyPathForLowPowerModeStatus];
  v14 = [(_CDContext *)v12 objectForKeyedSubscript:v13];
  [v5 setObject:v14 forKeyedSubscript:@"LowPowerMode"];

  v15 = +[_CDContextQueries batteryAdapterIsWirelessKey];
  v16 = [v22 objectForKeyedSubscript:v15];
  [v5 setObject:v16 forKeyedSubscript:@"IsWireless"];

  unsigned __int8 v17 = +[_CDContextQueries batteryIsChargingKey];
  id v18 = [v22 objectForKeyedSubscript:v17];
  [v5 setObject:v18 forKeyedSubscript:@"IsCharging"];

  v19 = +[_CDContextQueries batteryAdapterTypeKey];
  v20 = [v22 objectForKeyedSubscript:v19];
  [v5 setObject:v20 forKeyedSubscript:@"AdapterType"];

  unsigned __int8 v21 = +[_DASPPSDataManager sharedInstance];
  [v21 sendDataToPPS:v5 subsystem:@"BackgroundProcessing" category:@"SystemConditionsBattery"];
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end