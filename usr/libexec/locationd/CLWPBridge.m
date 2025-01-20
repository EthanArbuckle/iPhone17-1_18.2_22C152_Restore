@interface CLWPBridge
- (BOOL)startTrackingZone:(id)a3 forStates:(int64_t)a4 transitionHandler:(id)a5;
- (CLWPBridge)initWithQueue:(id)a3;
- (id)stateHandler;
- (id)updateHandler;
- (void)_didTransitionZoneWithData:(id)a3 trueMajor:(id)a4 trueMinor:(id)a5 state:(int64_t)a6;
- (void)dealloc;
- (void)deviceScannerDidUpdateState:(id)a3;
- (void)registerForStateUpdates:(id)a3;
- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5;
- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)setStateHandler:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)startScanForBeaconTypes:(int64_t)a3 updateHandler:(id)a4;
- (void)stopScan;
- (void)stopTrackingZone:(id)a3;
- (void)stopTrackingZones;
- (void)unregisterForStateUpdates;
- (void)updateState;
- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5;
- (void)zoneTracker:(id)a3 enteredZoneInfo:(id)a4;
- (void)zoneTracker:(id)a3 exitedZone:(id)a4;
- (void)zoneTrackerDidUpdateState:(id)a3;
@end

@implementation CLWPBridge

- (CLWPBridge)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLWPBridge;
  v4 = [(CLWPBridge *)&v7 init];
  if (v4)
  {
    v5 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    v4->_instanceLock = v5;
    [(NSRecursiveLock *)v5 setName:@"com.apple.location.wpbridge"];
    v4->_state = 0;
    v4->_scanner = (WPDeviceScanner *)[objc_alloc((Class)WPDeviceScanner) initWithDelegate:v4 queue:a3];
    v4->_zonesAndHandlers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_tracker = (WPZoneTracker *)[objc_alloc((Class)WPZoneTracker) initWithDelegate:v4 queue:a3];
  }
  return v4;
}

- (void)dealloc
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  [(WPZoneTracker *)self->_tracker invalidate];

  self->_tracker = 0;
  self->_zonesAndHandlers = 0;
  [(CLWPBridge *)self setUpdateHandler:0];
  [(WPDeviceScanner *)self->_scanner invalidate];

  self->_scanner = 0;
  [(CLWPBridge *)self setStateHandler:0];
  [(NSRecursiveLock *)self->_instanceLock unlock];

  self->_instanceLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWPBridge;
  [(CLWPBridge *)&v3 dealloc];
}

- (void)registerForStateUpdates:(id)a3
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  [(CLWPBridge *)self setStateHandler:a3];
  if ([(CLWPBridge *)self stateHandler])
  {
    v5 = [(CLWPBridge *)self stateHandler];
    v5[2](v5, self->_state);
  }
  instanceLock = self->_instanceLock;

  [(NSRecursiveLock *)instanceLock unlock];
}

- (void)unregisterForStateUpdates
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  [(CLWPBridge *)self setStateHandler:0];
  instanceLock = self->_instanceLock;

  [(NSRecursiveLock *)instanceLock unlock];
}

- (void)startScanForBeaconTypes:(int64_t)a3 updateHandler:(id)a4
{
  char v5 = a3;
  [(NSRecursiveLock *)self->_instanceLock lock];
  [(CLWPBridge *)self setUpdateHandler:a4];
  id v7 = +[NSMutableArray array];
  id v8 = v7;
  if (v5)
  {
    CFStringRef v9 = @"WPPuckCompany";
  }
  else
  {
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    CFStringRef v9 = @"WPPuckBeaconNoRanging";
  }
  [v7 addObject:v9];
LABEL_6:
  v10 = +[NSDictionary dictionaryWithObjectsAndKeys:v8, @"kPuckTypes", 0];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321A10);
  }
  v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2081;
    v17 = [(NSString *)[(NSDictionary *)v10 description] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Scanner starting for beacons\", \"matching\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  [(WPDeviceScanner *)self->_scanner unregisterAllDeviceChanges];
  [(WPDeviceScanner *)self->_scanner registerForDevicesMatching:v10 options:0];
  [(NSRecursiveLock *)self->_instanceLock unlock];
}

- (void)stopScan
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321A10);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Scanner stopping\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLWPBridge *)self setUpdateHandler:0];
  [(WPDeviceScanner *)self->_scanner unregisterAllDeviceChanges];
  [(NSRecursiveLock *)self->_instanceLock unlock];
}

- (void)deviceScannerDidUpdateState:(id)a3
{
}

- (void)scanner:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  id v7 = [[-[CLWPBridge updateHandler](self, "updateHandler") copy];
  if (v7)
  {
    id v8 = (void (**)(void, void, void))v7;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_101373454;
    v16[3] = &unk_102300F58;
    v16[4] = &v17;
    [objc_msgSend(a5, "objectForKey:", @"kPuckTypes") enumerateObjectsUsingBlock:v16];
    id v9 = [a5 objectForKey:@"kPuckID"];
    v10 = [NSMutableDictionary dictionaryWithObjectsAndKeys:v9, @"beaconID", [NSNumber numberWithInteger:v18[3]], @"typeMask", [a5 objectForKey:@"kPuckRSSI"], @"rssi", [a5 objectForKey:@"kPuckTx"], @"tx", [NSDate date], @"discovered", [a5 objectForKey:@"kPuckAdvertisingChannel"], @"channel", 0];
    if ((v18[3] & 3) != 0)
    {
      id v11 = [a5 objectForKey:@"kPuckCompanyUUID"];
      if (v11) {
        [(NSMutableDictionary *)v10 setObject:v11 forKey:@"proximityUUID"];
      }
      id v12 = [a5 objectForKey:@"kPuckCompanyMajor"];
      if (v12) {
        [(NSMutableDictionary *)v10 setObject:v12 forKey:@"major"];
      }
      id v13 = [a5 objectForKey:@"kPuckCompanyMinor"];
      if (v13) {
        [(NSMutableDictionary *)v10 setObject:v13 forKey:@"minor"];
      }
    }
    id v14 = [a5 objectForKey:@"kPuckConfig"];
    if (v14) {
      [(NSMutableDictionary *)v10 setObject:v14 forKey:@"config"];
    }
    _Block_object_dispose(&v17, 8);
    [(NSRecursiveLock *)self->_instanceLock unlock];
    ((void (**)(void, NSMutableDictionary *, void))v8)[2](v8, v10, 0);
  }
  else
  {
    instanceLock = self->_instanceLock;
    [(NSRecursiveLock *)instanceLock unlock];
  }
}

- (void)scanner:(id)a3 didFailToRegisterDevices:(id)a4 withError:(id)a5
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  id v7 = (void (**)(id, void, id))[self updateHandler];
  [(NSRecursiveLock *)self->_instanceLock unlock];
  if (v7)
  {
    v7[2](v7, 0, a5);
  }
}

- (BOOL)startTrackingZone:(id)a3 forStates:(int64_t)a4 transitionHandler:(id)a5
{
  if (a4)
  {
    char v6 = a4;
    [(NSRecursiveLock *)self->_instanceLock lock];
    if (a5)
    {
      id v9 = _Block_copy(a5);
      [(NSMutableDictionary *)self->_zonesAndHandlers setObject:v9 forKey:a3];
      _Block_release(v9);
    }
    id v10 = [a3 advertisementData];
    if (v10)
    {
      id v11 = +[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", [a3 advertisementData]), @"ZTZonesArray");
      id v12 = v11;
      if (v6) {
        id v13 = &__kCFBooleanTrue;
      }
      else {
        id v13 = &__kCFBooleanFalse;
      }
      [(NSMutableDictionary *)v11 setObject:v13 forKey:@"ZTZoneEntry"];
      if ((v6 & 2) != 0) {
        id v14 = &__kCFBooleanTrue;
      }
      else {
        id v14 = &__kCFBooleanFalse;
      }
      [(NSMutableDictionary *)v12 setObject:v14 forKey:@"ZTZoneExit"];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102321A10);
      }
      v15 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 68289283;
        v17[1] = 0;
        __int16 v18 = 2082;
        uint64_t v19 = "";
        __int16 v20 = 2081;
        id v21 = [[-[NSMutableDictionary description](v12, "description") UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Tracker registering zone\", \"zone\":%{private, location:escape_only}s}", (uint8_t *)v17, 0x1Cu);
      }
      [(WPZoneTracker *)self->_tracker registerForZoneChangesMatching:v12];
      [(NSRecursiveLock *)self->_instanceLock unlock];
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return (char)v10;
}

- (void)stopTrackingZone:(id)a3
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  __int16 v5 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", [a3 advertisementData]), @"ZTZonesArray", 0);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321A10);
  }
  char v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2081;
    id v12 = [(NSString *)[(NSDictionary *)v5 description] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"@iB: Tracker unregistering zone\", \"zone\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  [(WPZoneTracker *)self->_tracker unregisterForZoneChanges:v5];
  [(NSMutableDictionary *)self->_zonesAndHandlers removeObjectForKey:a3];
  [(NSRecursiveLock *)self->_instanceLock unlock];
}

- (void)stopTrackingZones
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  [(WPZoneTracker *)self->_tracker unregisterAllZoneChanges];
  [(NSMutableDictionary *)self->_zonesAndHandlers removeAllObjects];
  instanceLock = self->_instanceLock;

  [(NSRecursiveLock *)instanceLock unlock];
}

- (void)_didTransitionZoneWithData:(id)a3 trueMajor:(id)a4 trueMinor:(id)a5 state:(int64_t)a6
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  id v11 = [(NSMutableDictionary *)self->_zonesAndHandlers copy];
  [(NSRecursiveLock *)self->_instanceLock unlock];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1013739B4;
  v12[3] = &unk_1023219A0;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  [v11 enumerateKeysAndObjectsUsingBlock:v12];
}

- (void)zoneTrackerDidUpdateState:(id)a3
{
}

- (void)zoneTracker:(id)a3 enteredZoneInfo:(id)a4
{
  id v6 = [a4 objectForKeyedSubscript:WPZoneTrackerKeyZone];
  id v7 = [NSNumber numberWithInteger:[objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyMajor), "integerValue") integerValue]];
  int v8 = [NSNumber numberWithInteger:][objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", WPZoneTrackerKeyMinor), "integerValue")];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321A10);
  }
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    v10[0] = 68289283;
    v10[1] = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2081;
    id v14 = [objc_msgSend(v6, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"iB: Tracker entered zone\", \"zone\":%{private, location:escape_only}s}", (uint8_t *)v10, 0x1Cu);
  }
  [(CLWPBridge *)self _didTransitionZoneWithData:v6 trueMajor:v7 trueMinor:v8 state:1];
}

- (void)zoneTracker:(id)a3 exitedZone:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321A10);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2081;
    id v11 = [[objc_msgSend(a4, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"iB: Tracker exited zone\", \"zone\":%{private, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  [(CLWPBridge *)self _didTransitionZoneWithData:a4 trueMajor:0 trueMinor:0 state:2];
}

- (void)zoneTracker:(id)a3 didFailToRegisterZones:(id)a4 withError:(id)a5
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  id v8 = [(NSMutableDictionary *)self->_zonesAndHandlers copy];
  [(NSRecursiveLock *)self->_instanceLock unlock];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102321A10);
  }
  __int16 v9 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380931;
    id v17 = [[objc_msgSend(a4, "description") UTF8String];
    __int16 v18 = 2081;
    id v19 = [[objc_msgSend(a5, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Warning Tracker failed to register zones,%{private}s with error,%{private}s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102321A10);
    }
    int v12 = 136380931;
    id v13 = [[objc_msgSend(a4, "description") UTF8String];
    __int16 v14 = 2081;
    id v15 = [[objc_msgSend(a5, "description") UTF8String];
    __int16 v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWPBridge zoneTracker:didFailToRegisterZones:withError:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10137405C;
  v11[3] = &unk_1023219F0;
  v11[4] = v8;
  v11[5] = a5;
  [objc_msgSend(a4, "objectForKey:", @"ZTZonesArray") enumerateObjectsUsingBlock:v11];
  sub_100C846B4(@"not-associated-with-client", 2);
}

- (void)updateState
{
  [(NSRecursiveLock *)self->_instanceLock lock];
  if (([(WPDeviceScanner *)self->_scanner state] == (id)3
     || [(WPDeviceScanner *)self->_scanner state] == (id)2)
    && ([(WPZoneTracker *)self->_tracker state] == (id)3
     || [(WPZoneTracker *)self->_tracker state] == (id)2))
  {
    if ([(WPDeviceScanner *)self->_scanner state] == (id)2)
    {
      int64_t v3 = 2;
    }
    else if ([(WPZoneTracker *)self->_tracker state] == (id)2)
    {
      int64_t v3 = 2;
    }
    else
    {
      int64_t v3 = 1;
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  if (v3 == self->_state)
  {
    instanceLock = self->_instanceLock;
    [(NSRecursiveLock *)instanceLock unlock];
  }
  else
  {
    self->_state = v3;
    __int16 v5 = (void (**)(id, int64_t))[self stateHandler];
    [(NSRecursiveLock *)self->_instanceLock unlock];
    if (v5)
    {
      v5[2](v5, v3);
    }
  }
}

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

@end