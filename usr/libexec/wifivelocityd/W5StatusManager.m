@interface W5StatusManager
- (BOOL)__isSnifferSupported;
- (CWFInterface)corewifi;
- (NSArray)bootArgs;
- (NSOperationQueue)concurrentQueue;
- (W5BluetoothController)bluetooth;
- (W5DatabaseManager)databaseManager;
- (W5DiagnosticsModeManager)diagnosticsModeManager;
- (W5IOPowerManagement)pm;
- (W5IOPowerSource)ps;
- (W5StatusManager)init;
- (W5WiFiInterface)awdl;
- (W5WiFiInterface)nan;
- (W5WiFiInterface)wifi;
- (id)__bluetooth;
- (id)__queryAWDLStatus;
- (id)__queryBluetoothStatus;
- (id)__queryDiagnosticsModes;
- (id)__queryLastHourFaultsStatus;
- (id)__queryLastHourLinkTestsStatus;
- (id)__queryLastHourRecoveriesStatus;
- (id)__queryNetworkStatus;
- (id)__queryPowerStatus;
- (id)__queryStatusIncludingWiFiScanCache:(BOOL)a3;
- (id)__queryWiFiStatusIncludingScanCache:(BOOL)a3;
- (id)__wifi;
- (id)awdlStatus;
- (id)bluetoothStatus;
- (id)cachedStatusWithUUID:(id)a3;
- (id)eventHistory;
- (id)lowBatteryCallback;
- (id)networkStatus;
- (id)powerStatus;
- (id)status;
- (id)updatedAWDLStatusCallback;
- (id)updatedBluetoothCallback;
- (id)updatedBluetoothStatusCallback;
- (id)updatedFaultsCallback;
- (id)updatedLinkTestsCallback;
- (id)updatedNetworkStatusCallback;
- (id)updatedPowerManagementCallback;
- (id)updatedPowerSourceCallback;
- (id)updatedPowerStatusCallback;
- (id)updatedRecoveriesCallback;
- (id)updatedWiFiCallback;
- (id)updatedWiFiStatusCallback;
- (id)wifiStatus;
- (int64_t)__airDropDiscoverableMode;
- (void)__addEvent:(id)a3;
- (void)__forceUpdateTrigger;
- (void)__setupCallbacks;
- (void)__updateStatus;
- (void)__updateStatusCoalesce;
- (void)addEvent:(id)a3;
- (void)clearCachedStatusWithUUID:(id)a3;
- (void)dealloc;
- (void)queryStatusAndReply:(id)a3;
- (void)setDiagnosticsModeManager:(id)a3;
- (void)setLowBatteryCallback:(id)a3;
- (void)setUpdatedAWDLStatusCallback:(id)a3;
- (void)setUpdatedBluetoothCallback:(id)a3;
- (void)setUpdatedBluetoothStatusCallback:(id)a3;
- (void)setUpdatedFaultsCallback:(id)a3;
- (void)setUpdatedLinkTestsCallback:(id)a3;
- (void)setUpdatedNetworkStatusCallback:(id)a3;
- (void)setUpdatedPowerManagementCallback:(id)a3;
- (void)setUpdatedPowerSourceCallback:(id)a3;
- (void)setUpdatedPowerStatusCallback:(id)a3;
- (void)setUpdatedRecoveriesCallback:(id)a3;
- (void)setUpdatedWiFiCallback:(id)a3;
- (void)setUpdatedWiFiStatusCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5StatusManager

- (id)__wifi
{
  if (!self->_wifi)
  {
    v3 = [[W5WiFiInterface alloc] initWithCoreWiFiInterface:self->_corewifi];
    self->_wifi = v3;
    if (v3)
    {
      [(W5StatusManager *)self __setupCallbacks];
      if (self->_isMonitoringEvents) {
        [(W5StatusManager *)self startEventMonitoring];
      }
    }
  }
  return self->_wifi;
}

- (W5WiFiInterface)wifi
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004D944;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (W5WiFiInterface *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__bluetooth
{
  if (!self->_bluetooth)
  {
    v3 = objc_alloc_init(W5BluetoothController);
    self->_bluetooth = v3;
    if ([(W5BluetoothController *)v3 isAvailable])
    {
      [(W5StatusManager *)self __setupCallbacks];
      if (self->_isMonitoringEvents) {
        [(W5StatusManager *)self startEventMonitoring];
      }
    }
  }
  return self->_bluetooth;
}

- (W5BluetoothController)bluetooth
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004DAE4;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (W5BluetoothController *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (W5StatusManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)W5StatusManager;
  v2 = [(W5StatusManager *)&v12 init];
  if (!v2) {
    goto LABEL_12;
  }
  v3 = dispatch_queue_create("com.apple.wifivelocity.status", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  if (!v3) {
    goto LABEL_12;
  }
  dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  v2->_concurrentQueue = v4;
  if (!v4) {
    goto LABEL_12;
  }
  [(NSOperationQueue *)v4 setMaxConcurrentOperationCount:-1];
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v2->_eventHistory = v5;
  if (!v5) {
    goto LABEL_12;
  }
  +[CWFInterface setLogRedactionDisabled:1];
  uint64_t v6 = (CWFInterface *)[objc_alloc((Class)CWFInterface) initWithServiceType:1];
  v2->_corewifi = v6;
  [(CWFInterface *)v6 resume];
  v7 = objc_alloc_init(W5IOPowerManagement);
  v2->_pm = v7;
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = objc_alloc_init(W5IOPowerSource);
  v2->_ps = v8;
  if (v8
    && (v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        (v2->_cachedStatusUUIDMap = v9) != 0)
    && ((v2->_bootArgs = (NSArray *)[sub_100096F80() copy],
         !+[W5FeatureAvailability diagnosticsModeEnabled])
     || (v10 = +[W5DatabaseManager sharedObject],
         (v2->_databaseManager = v10) != 0)))
  {
    v2->_diagnosticsModeManager = 0;
    [(W5StatusManager *)v2 __setupCallbacks];
  }
  else
  {
LABEL_12:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  forceUpdateTimer = self->_forceUpdateTimer;
  if (forceUpdateTimer)
  {
    dispatch_source_cancel(forceUpdateTimer);
    dispatch_release((dispatch_object_t)self->_forceUpdateTimer);
  }
  coalesceUpdateTimer = self->_coalesceUpdateTimer;
  if (coalesceUpdateTimer)
  {
    dispatch_source_cancel(coalesceUpdateTimer);
    dispatch_release((dispatch_object_t)self->_coalesceUpdateTimer);
  }

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v6.receiver = self;
  v6.super_class = (Class)W5StatusManager;
  [(W5StatusManager *)&v6 dealloc];
}

- (void)setUpdatedWiFiStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiStatusCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004DE74;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedAWDLStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedAWDLStatusCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004DF70;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedNetworkStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedNetworkStatusCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E06C;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedBluetoothStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothStatusCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E168;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedPowerStatusCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerStatusCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E264;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedWiFiCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E360;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedPowerManagementCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerManagementCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E45C;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedPowerSourceCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerSourceCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E558;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setLowBatteryCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_lowBatteryCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E654;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedBluetoothCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E750;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedFaultsCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedFaultsCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E84C;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedLinkTestsCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedLinkTestsCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E948;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setUpdatedRecoveriesCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedRecoveriesCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004EA44;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)queryStatusAndReply:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004EB10;
  v4[3] = &unk_1000DDFB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)status
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004EC70;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)wifiStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004EDB8;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)awdlStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004EF00;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)bluetoothStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004F044;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)networkStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004F188;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)powerStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004F2CC;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)cachedStatusWithUUID:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_10004D928;
  uint64_t v11 = sub_10004D938;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F414;
  block[3] = &unk_1000DEA78;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)clearCachedStatusWithUUID:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F518;
  v4[3] = &unk_1000DDC30;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (id)eventHistory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_10004D928;
  v10 = sub_10004D938;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004F658;
  v5[3] = &unk_1000DD980;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F720;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F814;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__forceUpdateTrigger
{
  if (!self->_forceUpdateTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    self->_forceUpdateTimer = v3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004F988;
    handler[3] = &unk_1000DDC80;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
    forceUpdateTimer = self->_forceUpdateTimer;
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(forceUpdateTimer, v5, 0x2540BE400uLL, 0);
    dispatch_resume((dispatch_object_t)self->_forceUpdateTimer);
  }
}

- (void)__updateStatusCoalesce
{
  if (!self->_coalesceUpdateTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    self->_coalesceUpdateTimer = v3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004FB4C;
    handler[3] = &unk_1000DDC80;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
    coalesceUpdateTimer = self->_coalesceUpdateTimer;
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(coalesceUpdateTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_coalesceUpdateTimer);
  }
}

- (int64_t)__airDropDiscoverableMode
{
  int64_t result = [+[NSFileManager defaultManager] contentsAtPath:@"/var/mobile/Library/Preferences/com.apple.sharingd.plist"];
  if (result)
  {
    id v3 = [[+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", result, 0, 0, 0) objectForKey:@"DiscoverableMode"];
    if ([v3 isEqualToString:@"Contacts Only"])
    {
      return 1;
    }
    else if ([v3 isEqualToString:@"Everyone"])
    {
      return 2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)__isSnifferSupported
{
  id v2 = [(W5StatusManager *)self __wifi];
  if (v2)
  {
    LOBYTE(v2) = [v2 isSnifferSupported];
  }
  return (char)v2;
}

- (id)__queryPowerStatus
{
  id v3 = objc_alloc_init((Class)W5PowerStatus);
  [v3 setPowerSourceType:-[W5IOPowerSource powerSourceType](self->_ps, "powerSourceType")];
  [v3 setBatteryWarningLevel:-[W5IOPowerSource batteryWarningLevel](self->_ps, "batteryWarningLevel")];
  [(W5IOPowerSource *)self->_ps internalBatteryLevel];
  [v3 setInternalBatteryLevel:];
  [v3 setPowerStateCaps:-[W5IOPowerManagement caps](self->_pm, "caps")];
  return v3;
}

- (id)__queryAWDLStatus
{
  id v3 = objc_alloc_init((Class)W5AWDLStatus);
  id v4 = [(W5StatusManager *)self __wifi];
  id v5 = [(CWFInterface *)self->_corewifi AWDL];
  [v3 setMacAddress:[v5 MACAddress]];
  [v3 setHardwareMACAddress:[v5 hardwareMACAddress]];
  [v3 setInterfaceName:[v5 interfaceName]];
  [v3 setPower:[v5 powerOn]];
  [v3 setIpv6Addresses:[v5 IPv6Addresses]];
  [v3 setIsAWDLRealTimeMode:[v4 isAWDLRealTimeMode]];
  [v3 setAwdlSyncEnabled:-[CWFInterface AWDLSyncEnabled](self->_corewifi, "AWDLSyncEnabled")];
  [v3 setAwdlSyncState:-[CWFInterface AWDLSyncState](self->_corewifi, "AWDLSyncState")];
  [v3 setAwdlSyncChannelSequence:-[CWFInterface AWDLSyncChannelSequence](self->_corewifi, "AWDLSyncChannelSequence")];
  [v3 setAwdlStrategy:-[CWFInterface AWDLStrategy](self->_corewifi, "AWDLStrategy")];
  [v3 setAwdlElectionParameters:-[CWFInterface AWDLElectionParameters](self->_corewifi, "AWDLElectionParameters")];
  [v3 setAwdlMasterChannel:-[CWFInterface AWDLMasterChannel](self->_corewifi, "AWDLMasterChannel")];
  [v3 setAwdlSecondaryMasterChannel:-[CWFInterface AWDLSecondaryMasterChannel](self->_corewifi, "AWDLSecondaryMasterChannel")];
  [v3 setAwdlOpMode:-[CWFInterface AWDLOpMode](self->_corewifi, "AWDLOpMode")];
  [v3 setAwdlSyncParameters:-[CWFInterface AWDLSyncParameters](self->_corewifi, "AWDLSyncParameters")];
  [v3 setAwdlSidecarDiagnostics:-[CWFInterface AWDLSidecarDiagnostics](self->_corewifi, "AWDLSidecarDiagnostics")];
  [v3 setAirDropDiscoverableMode:-[W5StatusManager __airDropDiscoverableMode](self, "__airDropDiscoverableMode")];
  return v3;
}

- (id)__queryBluetoothStatus
{
  id v3 = objc_alloc_init((Class)W5BluetoothStatus);
  id v4 = [(W5StatusManager *)self __bluetooth];
  [v3 setAddress:[v4 address]];
  [v3 setPowerOn:[v4 powerOn]];
  [v3 setIsDiscoverable:[v4 isDiscoverable]];
  [v3 setIsConnectable:[v4 isConnectable]];
  [v3 setIsScanning:[v4 isScanning]];
  [v3 setDevices:[v4 devices]];
  return v3;
}

- (id)__queryNetworkStatus
{
  id v3 = objc_alloc_init((Class)W5NetworkStatus);
  [v3 setPrimaryIPv4InterfaceName:-[CWFInterface globalIPv4InterfaceName](self->_corewifi, "globalIPv4InterfaceName")];
  [v3 setPrimaryIPv4ServiceName:-[CWFInterface globalIPv4NetworkServiceName](self->_corewifi, "globalIPv4NetworkServiceName")];
  [v3 setPrimaryIPv4ServiceID:-[CWFInterface globalIPv4NetworkServiceID](self->_corewifi, "globalIPv4NetworkServiceID")];
  [v3 setPrimaryIPv6InterfaceName:-[CWFInterface globalIPv6InterfaceName](self->_corewifi, "globalIPv6InterfaceName")];
  [v3 setPrimaryIPv6ServiceName:-[CWFInterface globalIPv6NetworkServiceName](self->_corewifi, "globalIPv6NetworkServiceName")];
  [v3 setPrimaryIPv6ServiceID:-[CWFInterface globalIPv6NetworkServiceID](self->_corewifi, "globalIPv6NetworkServiceID")];
  [v3 setPrimaryIPv4Addresses:-[CWFInterface globalIPv4Addresses](self->_corewifi, "globalIPv4Addresses")];
  [v3 setPrimaryIPv6Addresses:-[CWFInterface globalIPv6Addresses](self->_corewifi, "globalIPv6Addresses")];
  [v3 setPrimaryIPv4Router:-[CWFInterface globalIPv4RouterAddress](self->_corewifi, "globalIPv4RouterAddress")];
  [v3 setPrimaryIPv4Router:-[CWFInterface globalIPv6RouterAddress](self->_corewifi, "globalIPv6RouterAddress")];
  [v3 setPrimaryDNSAddresses:-[CWFInterface globalDNSServerAddresses](self->_corewifi, "globalDNSServerAddresses")];
  [v3 setIsAppleReachable:-[CWFInterface reachabilityFlags](self->_corewifi, "reachabilityFlags")];
  return v3;
}

- (id)__queryDiagnosticsModes
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSArray *)[(W5DiagnosticsModeManager *)self->_diagnosticsModeManager allDiagnostics] filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"SELF.state >= %d AND SELF.state <= %d", 3, 10]];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 timestampFor:3];
        if (v10
          && [(NSDateComponents *)[+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") components:16 fromDate:v10 toDate:+[NSDate date] options:0] day] <= 7)
        {
          [v3 addObject:v9];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)__queryWiFiStatusIncludingScanCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)W5WiFiStatus);
  id v6 = [(W5StatusManager *)self __wifi];
  [v5 setMacAddress:-[CWFInterface MACAddress](self->_corewifi, "MACAddress")];
  [v5 setHardwareMACAddress:-[CWFInterface hardwareMACAddress](self->_corewifi, "hardwareMACAddress")];
  [v5 setCapabilities:-[CWFInterface capabilities](self->_corewifi, "capabilities")];
  [v5 setInterfaceName:-[CWFInterface interfaceName](self->_corewifi, "interfaceName")];
  [v5 setPowerOn:-[CWFInterface powerOn](self->_corewifi, "powerOn")];
  [v5 setPower:-[CWFInterface powerState](self->_corewifi, "powerState")];
  [v5 setOpMode:-[CWFInterface opMode](self->_corewifi, "opMode")];
  [v5 setSsid:-[CWFInterface SSID](self->_corewifi, "SSID")];
  [v5 setEapolControlMode:-[CWFInterface EAP8021XControlMode](self->_corewifi, "EAP8021XControlMode")];
  [v5 setEapolSupplicantState:-[CWFInterface EAP8021XSupplicantState](self->_corewifi, "EAP8021XSupplicantState")];
  [v5 setSsidString:-[CWFInterface networkName](self->_corewifi, "networkName")];
  [v5 setBssid:-[CWFInterface BSSID](self->_corewifi, "BSSID")];
  [v5 setSecurity:[v6 security]];
  [(CWFInterface *)self->_corewifi txRate];
  [v5 setTxRate:];
  [v5 setRssi:-[CWFInterface RSSI](self->_corewifi, "RSSI")];
  [v5 setCca:-[CWFInterface CCA](self->_corewifi, "CCA")];
  [v5 setNoise:-[CWFInterface noise](self->_corewifi, "noise")];
  [v5 setPhyMode:-[CWFInterface PHYMode](self->_corewifi, "PHYMode")];
  [v5 setChannel:[v6 channel]];
  [v5 setLinkQualityUpdates:[v6 linkQualityUpdates]];
  [v5 setSupportedChannels:[v6 supportedChannels]];
  [v5 setCountryCode:-[CWFInterface countryCode](self->_corewifi, "countryCode")];
  [v5 setMcsIndex:-[CWFInterface MCSIndex](self->_corewifi, "MCSIndex")];
  [v5 setGuardInterval:-[CWFInterface guardInterval](self->_corewifi, "guardInterval")];
  [v5 setNumberOfSpacialStreams:-[CWFInterface numberOfSpatialStreams](self->_corewifi, "numberOfSpatialStreams")];
  [v5 setNetworkServiceID:-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID")];
  [v5 setIpv4ConfigMethod:[v6 ipv4ConfigMethod]];
  [v5 setIpv6ConfigMethod:[v6 ipv6ConfigMethod]];
  [v5 setIpv4Addresses:-[CWFInterface IPv4Addresses](self->_corewifi, "IPv4Addresses")];
  [v5 setIpv4RouterAddress:-[CWFInterface IPv4RouterAddress](self->_corewifi, "IPv4RouterAddress")];
  [v5 setIpv6Addresses:-[CWFInterface IPv6Addresses](self->_corewifi, "IPv6Addresses")];
  [v5 setIpv6RouterAddress:-[CWFInterface IPv6RouterAddress](self->_corewifi, "IPv6RouterAddress")];
  [v5 setDnsAddresses:-[CWFInterface DNSServerAddresses](self->_corewifi, "DNSServerAddresses")];
  [v5 setLastJoinedScanResult:[v6 currentNetwork]];
  [v5 setLastJoinedPreferredNetwork:[v6 currentPreferredNetwork]];
  [v5 setSmartCCADesenseSupported:[v6 smartCCADesenseSupported]];
  [v5 setSmartCCADesenseUSBPresence:[v6 smartCCADesenseUSBPresence]];
  [v5 setIsSnifferSupported:-[W5StatusManager __isSnifferSupported](self, "__isSnifferSupported")];
  if (v3) {
    [v5 setCachedScanResults:[v6 scanCache:1]];
  }
  return v5;
}

- (id)__queryLastHourFaultsStatus
{
  id v2 = [objc_alloc((Class)W5SummaryFaults) initWithSummaryFaults:-[W5DatabaseManager fetchLastHourFaults](self->_databaseManager, "fetchLastHourFaults")];

  return v2;
}

- (id)__queryLastHourLinkTestsStatus
{
  id v2 = [objc_alloc((Class)W5SummaryLinkTests) initWithSummaryLinkTests:-[W5DatabaseManager fetchLastHourLinkTests](self->_databaseManager, "fetchLastHourLinkTests")];

  return v2;
}

- (id)__queryLastHourRecoveriesStatus
{
  id v2 = [objc_alloc((Class)W5SummaryRecoveries) initWithSummaryRecoveries:-[W5DatabaseManager fetchLastHourRecoveries](self->_databaseManager, "fetchLastHourRecoveries")];

  return v2;
}

- (id)__queryStatusIncludingWiFiScanCache:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)W5Status);
  [v5 setWifi:-[W5StatusManager __queryWiFiStatusIncludingScanCache:](self, "__queryWiFiStatusIncludingScanCache:", v3)];
  [v5 setAwdl:-[W5StatusManager __queryAWDLStatus](self, "__queryAWDLStatus")];
  [v5 setBluetooth:-[W5StatusManager __queryBluetoothStatus](self, "__queryBluetoothStatus")];
  [v5 setNetwork:-[W5StatusManager __queryNetworkStatus](self, "__queryNetworkStatus")];
  [v5 setDiagnosticsModes:-[W5StatusManager __queryDiagnosticsModes](self, "__queryDiagnosticsModes")];
  [v5 setPower:-[W5StatusManager __queryPowerStatus](self, "__queryPowerStatus")];
  [v5 setLastHrFaults:-[W5StatusManager __queryLastHourFaultsStatus](self, "__queryLastHourFaultsStatus")];
  [v5 setLastHrLinkTests:-[W5StatusManager __queryLastHourLinkTestsStatus](self, "__queryLastHourLinkTestsStatus")];
  [v5 setLastHrRecoveries:-[W5StatusManager __queryLastHourRecoveriesStatus](self, "__queryLastHourRecoveriesStatus")];
  return v5;
}

- (void)__updateStatus
{
  id v3 = [(W5StatusManager *)self __queryStatusIncludingWiFiScanCache:0];
  if (([(W5Status *)self->_updateStatus isEqual:v3] & 1) == 0)
  {
    if ((objc_msgSend(-[W5Status wifi](self->_updateStatus, "wifi"), "isEqual:", objc_msgSend(v3, "wifi")) & 1) == 0&& self->_updatedWiFiStatusCallback)
    {
      id v4 = sub_10009756C();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 856;
        LODWORD(v27) = 28;
        v20 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v5 = objc_alloc_init((Class)W5Event);
      [v5 setEventID:1];
      +[NSDate timeIntervalSinceReferenceDate];
      [v5 setTimestamp:];
      CFStringRef v48 = @"WiFiStatus";
      id v49 = [v3 wifi];
      [v5 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1)];
      (*((void (**)(id, id))self->_updatedWiFiStatusCallback + 2))(self->_updatedWiFiStatusCallback, v5);
    }
    if ((objc_msgSend(-[W5Status awdl](self->_updateStatus, "awdl", v20, v27), "isEqual:", objc_msgSend(v3, "awdl")) & 1) == 0&& self->_updatedAWDLStatusCallback)
    {
      id v6 = sub_10009756C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 868;
        LODWORD(v28) = 28;
        v21 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v7 = objc_alloc_init((Class)W5Event);
      [v7 setEventID:2];
      +[NSDate timeIntervalSinceReferenceDate];
      [v7 setTimestamp:];
      CFStringRef v46 = @"AWDLStatus";
      id v47 = [v3 awdl];
      [v7 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1)]];
      (*((void (**)(id, id))self->_updatedAWDLStatusCallback + 2))(self->_updatedAWDLStatusCallback, v7);
    }
    if ((objc_msgSend(-[W5Status network](self->_updateStatus, "network", v21, v28), "isEqual:", objc_msgSend(v3, "network")) & 1) == 0&& self->_updatedNetworkStatusCallback)
    {
      uint64_t v8 = sub_10009756C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 880;
        LODWORD(v29) = 28;
        v22 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v9 = objc_alloc_init((Class)W5Event);
      [v9 setEventID:4];
      +[NSDate timeIntervalSinceReferenceDate];
      [v9 setTimestamp:];
      CFStringRef v44 = @"NetworkStatus";
      id v45 = [v3 network];
      [v9 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1)];
      (*((void (**)(id, id))self->_updatedNetworkStatusCallback + 2))(self->_updatedNetworkStatusCallback, v9);
    }
    if ((objc_msgSend(-[W5Status bluetooth](self->_updateStatus, "bluetooth", v22, v29), "isEqual:", objc_msgSend(v3, "bluetooth")) & 1) == 0&& self->_updatedBluetoothStatusCallback)
    {
      id v10 = sub_10009756C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 892;
        LODWORD(v30) = 28;
        v23 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v11 = objc_alloc_init((Class)W5Event);
      [v11 setEventID:3];
      +[NSDate timeIntervalSinceReferenceDate];
      [v11 setTimestamp:];
      CFStringRef v42 = @"BluetoothStatus";
      id v43 = [v3 bluetooth];
      [v11 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1)];
      (*((void (**)(id, id))self->_updatedBluetoothStatusCallback + 2))(self->_updatedBluetoothStatusCallback, v11);
    }
    if ((objc_msgSend(-[W5Status power](self->_updateStatus, "power", v23, v30), "isEqual:", objc_msgSend(v3, "power")) & 1) == 0&& self->_updatedPowerStatusCallback)
    {
      long long v12 = sub_10009756C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 904;
        LODWORD(v31) = 28;
        v24 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v13 = objc_alloc_init((Class)W5Event);
      [v13 setEventID:5];
      +[NSDate timeIntervalSinceReferenceDate];
      [v13 setTimestamp:];
      CFStringRef v40 = @"PowerStatus";
      id v41 = [v3 power];
      [v13 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1)];
      (*((void (**)(id, id))self->_updatedPowerStatusCallback + 2))(self->_updatedPowerStatusCallback, v13);
    }
    if ((objc_msgSend(-[W5Status lastHrFaults](self->_updateStatus, "lastHrFaults", v24, v31), "isEqual:", objc_msgSend(v3, "lastHrFaults")) & 1) == 0&& self->_updatedFaultsCallback)
    {
      long long v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 916;
        LODWORD(v32) = 28;
        v25 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v15 = objc_alloc_init((Class)W5Event);
      [v15 setEventID:39];
      +[NSDate timeIntervalSinceReferenceDate];
      [v15 setTimestamp:];
      CFStringRef v38 = @"LastHourFaultsStatus";
      id v39 = [v3 lastHrFaults];
      [v15 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1)];
      (*((void (**)(id, id))self->_updatedFaultsCallback + 2))(self->_updatedFaultsCallback, v15);
    }
    if ((objc_msgSend(-[W5Status lastHrLinkTests](self->_updateStatus, "lastHrLinkTests", v25, v32), "isEqual:", objc_msgSend(v3, "lastHrLinkTests")) & 1) == 0&& self->_updatedLinkTestsCallback)
    {
      v16 = sub_10009756C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 928;
        LODWORD(v33) = 28;
        v26 = &v50;
        _os_log_send_and_compose_impl();
      }
      id v17 = objc_alloc_init((Class)W5Event);
      [v17 setEventID:40];
      +[NSDate timeIntervalSinceReferenceDate];
      [v17 setTimestamp:];
      CFStringRef v36 = @"LastHourLinkTestsStatus";
      id v37 = [v3 lastHrLinkTests];
      [v17 setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1)];
      (*((void (**)(id, id))self->_updatedLinkTestsCallback + 2))(self->_updatedLinkTestsCallback, v17);
    }
    if ((objc_msgSend(-[W5Status lastHrRecoveries](self->_updateStatus, "lastHrRecoveries", v26, v33), "isEqual:", objc_msgSend(v3, "lastHrRecoveries")) & 1) == 0&& self->_updatedRecoveriesCallback)
    {
      v18 = sub_10009756C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 136315650;
        v51 = "-[W5StatusManager __updateStatus]";
        __int16 v52 = 2080;
        v53 = "W5StatusManager.m";
        __int16 v54 = 1024;
        int v55 = 940;
        _os_log_send_and_compose_impl();
      }
      id v19 = objc_alloc_init((Class)W5Event);
      [v19 setEventID:41];
      +[NSDate timeIntervalSinceReferenceDate];
      [v19 setTimestamp:];
      CFStringRef v34 = @"LastHourRecoveriesStatus";
      id v35 = [v3 lastHrRecoveries];
      [v19 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1)];
      (*((void (**)(id, id))self->_updatedRecoveriesCallback + 2))(self->_updatedRecoveriesCallback, v19);
    }

    self->_updateStatus = (W5Status *)[v3 copy];
  }
}

- (void)__addEvent:(id)a3
{
  [(NSMutableArray *)self->_eventHistory addObject:a3];
  if ((unint64_t)[(NSMutableArray *)self->_eventHistory count] >= 0x65)
  {
    eventHistory = self->_eventHistory;
    [(NSMutableArray *)eventHistory removeObjectAtIndex:0];
  }
}

- (void)addEvent:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051348;
  v4[3] = &unk_1000DDC30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)__setupCallbacks
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000515F4;
  v10[3] = &unk_1000DEAA0;
  v10[4] = self;
  [(W5WiFiInterface *)self->_wifi setUpdatedWiFiCallback:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000516D0;
  v9[3] = &unk_1000DEAA0;
  v9[4] = self;
  [(W5BluetoothController *)self->_bluetooth setUpdatedBluetoothCallback:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000517AC;
  v8[3] = &unk_1000DEAA0;
  v8[4] = self;
  [(W5IOPowerManagement *)self->_pm setUpdatedPowerManagementCallback:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100051888;
  v7[3] = &unk_1000DEAA0;
  v7[4] = self;
  [(W5IOPowerSource *)self->_ps setUpdatedPowerSourceCallback:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100051964;
  v6[3] = &unk_1000DEAA0;
  v6[4] = self;
  [(W5IOPowerSource *)self->_ps setLowBatteryCallback:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100051A40;
  v5[3] = &unk_1000DEAA0;
  v5[4] = self;
  [(W5DatabaseManager *)self->_databaseManager setUpdatedFaultsCallback:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051B1C;
  v4[3] = &unk_1000DEAA0;
  v4[4] = self;
  [(W5DatabaseManager *)self->_databaseManager setUpdatedLinkTestsCallback:v4];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100051BF8;
  v3[3] = &unk_1000DEAA0;
  v3[4] = self;
  [(W5DatabaseManager *)self->_databaseManager setUpdatedRecoveriesCallback:v3];
}

- (CWFInterface)corewifi
{
  return (CWFInterface *)objc_getProperty(self, a2, 80, 1);
}

- (W5WiFiInterface)awdl
{
  return (W5WiFiInterface *)objc_getProperty(self, a2, 64, 1);
}

- (W5WiFiInterface)nan
{
  return (W5WiFiInterface *)objc_getProperty(self, a2, 72, 1);
}

- (W5IOPowerManagement)pm
{
  return (W5IOPowerManagement *)objc_getProperty(self, a2, 104, 1);
}

- (W5IOPowerSource)ps
{
  return (W5IOPowerSource *)objc_getProperty(self, a2, 112, 1);
}

- (W5DatabaseManager)databaseManager
{
  return (W5DatabaseManager *)objc_getProperty(self, a2, 120, 1);
}

- (W5DiagnosticsModeManager)diagnosticsModeManager
{
  return (W5DiagnosticsModeManager *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDiagnosticsModeManager:(id)a3
{
}

- (id)updatedWiFiStatusCallback
{
  return self->_updatedWiFiStatusCallback;
}

- (id)updatedAWDLStatusCallback
{
  return self->_updatedAWDLStatusCallback;
}

- (id)updatedNetworkStatusCallback
{
  return self->_updatedNetworkStatusCallback;
}

- (id)updatedBluetoothStatusCallback
{
  return self->_updatedBluetoothStatusCallback;
}

- (id)updatedPowerStatusCallback
{
  return self->_updatedPowerStatusCallback;
}

- (id)updatedWiFiCallback
{
  return self->_updatedWiFiCallback;
}

- (id)updatedBluetoothCallback
{
  return self->_updatedBluetoothCallback;
}

- (id)updatedPowerManagementCallback
{
  return self->_updatedPowerManagementCallback;
}

- (id)updatedPowerSourceCallback
{
  return self->_updatedPowerSourceCallback;
}

- (id)lowBatteryCallback
{
  return self->_lowBatteryCallback;
}

- (id)updatedFaultsCallback
{
  return self->_updatedFaultsCallback;
}

- (id)updatedLinkTestsCallback
{
  return self->_updatedLinkTestsCallback;
}

- (id)updatedRecoveriesCallback
{
  return self->_updatedRecoveriesCallback;
}

- (NSOperationQueue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (NSArray)bootArgs
{
  return self->_bootArgs;
}

@end