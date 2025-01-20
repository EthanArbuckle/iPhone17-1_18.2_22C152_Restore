@interface BKAccelerometerInterface
+ (id)sharedInstance;
- (BKAccelerometerInterface)init;
- (NSString)description;
- (id)_lock_existingClientForSendRight:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_handleAccelerometerRequestForPort:(id)a3 auditToken:(id *)a4 updateBlock:(id)a5;
- (void)_lock_clearSystemAppOrientationClient;
- (void)_lock_systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5;
- (void)_updateSettings;
- (void)bksAccelerometerClientRequestedAccelerometerEvents:(id)a3 updateInterval:(double)a4 xThreshold:(float)a5 yThreshold:(float)a6 zThreshold:(float)a7 auditToken:(id *)a8;
- (void)bksAccelerometerClientRequestedOrientationEvents:(id)a3 enabled:(BOOL)a4 passiveEvents:(BOOL)a5 auditToken:(id *)a6;
- (void)clientDied:(id)a3;
- (void)dealloc;
- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6;
- (void)systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5;
@end

@implementation BKAccelerometerInterface

- (void)_updateSettings
{
  [(NSLock *)self->_lock lock];
  self->_double lock_samplingInterval = 0.0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v3 = self->_lock_accelerometerClients;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v4)
  {
    char v6 = 0;
    float v8 = 0.0;
    double v9 = 0.0;
    goto LABEL_50;
  }
  id v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v33;
  float v8 = 0.0;
  double v9 = 0.0;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      [v11 accelerometerUpdateInterval:v32];
      if (v12 > 0.0)
      {
        double lock_samplingInterval = self->_lock_samplingInterval;
        if (lock_samplingInterval <= 0.0 || v12 < lock_samplingInterval)
        {
          if (lock_samplingInterval <= 0.0) {
            double v9 = v12;
          }
          else {
            double v9 = self->_lock_samplingInterval;
          }
          self->_double lock_samplingInterval = v12;
        }
        else if (lock_samplingInterval == v9 || v12 < v9)
        {
          double v9 = v12;
        }
      }
      [v11 xThreshold];
      if (v16 > 0.0)
      {
        if (v16 >= v8) {
          float v17 = v8;
        }
        else {
          float v17 = v16;
        }
        if (v8 > 0.0) {
          float v8 = v17;
        }
        else {
          float v8 = v16;
        }
      }
      [v11 yThreshold];
      if (v18 >= v8) {
        float v19 = v8;
      }
      else {
        float v19 = v18;
      }
      if (v8 <= 0.0) {
        float v19 = v18;
      }
      if (v18 > 0.0) {
        float v20 = v19;
      }
      else {
        float v20 = v8;
      }
      [v11 zThreshold];
      if (v21 <= 0.0)
      {
        float v8 = v20;
        if (v6) {
          goto LABEL_41;
        }
      }
      else
      {
        float v8 = v21;
        if (v20 > 0.0 && v21 >= v20) {
          float v8 = v20;
        }
        if (v6)
        {
LABEL_41:
          char v6 = 1;
          continue;
        }
      }
      if ([v11 wantsOrientationEvents]) {
        char v6 = [v11 passiveOrientationEvents] ^ 1;
      }
      else {
        char v6 = 0;
      }
    }
    id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
  }
  while (v5);
LABEL_50:

  double v22 = self->_lock_samplingInterval;
  if (v22 >= 0.0) {
    double v23 = self->_lock_samplingInterval;
  }
  else {
    double v23 = 0.0;
  }
  if (v9 >= 0.0) {
    double v24 = v9;
  }
  else {
    double v24 = 0.0;
  }
  if (v24 / v23 > 1.25 && v24 / v23 < 1.75) {
    double v25 = v23 * 0.5;
  }
  else {
    double v25 = v23;
  }
  if (v22 < 0.0 || v24 / v23 > 1.25 && v24 / v23 < 1.75) {
    self->_double lock_samplingInterval = v25;
  }
  [(NSLock *)self->_lock unlock];
  lock_orientationManager = self->_lock_orientationManager;
  if (lock_orientationManager)
  {
    queue = lock_orientationManager->_queue;
    block = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_10001AEB4;
    v39 = &unk_1000F8C30;
    v40 = lock_orientationManager;
    double v41 = v25;
    dispatch_async(queue, &block);
    v28 = self->_lock_orientationManager;
    if (v28)
    {
      v29 = v28->_queue;
      block = _NSConcreteStackBlock;
      uint64_t v37 = 3221225472;
      v38 = sub_10001AE2C;
      v39 = &unk_1000F8A20;
      v40 = v28;
      *(float *)&double v41 = v8;
      dispatch_async(v29, &block);
      v30 = self->_lock_orientationManager;
      if (v30)
      {
        v31 = v30->_queue;
        block = _NSConcreteStackBlock;
        uint64_t v37 = 3221225472;
        v38 = sub_10001ACC0;
        v39 = &unk_1000F8A48;
        v40 = v30;
        LOBYTE(v41) = v6;
        dispatch_async(v31, &block);
      }
    }
  }
}

- (id)_lock_existingClientForSendRight:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100061778;
  float v16 = sub_100061788;
  id v17 = 0;
  lock_accelerometerClients = self->_lock_accelerometerClients;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008500;
  v9[3] = &unk_1000F7698;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(NSMutableSet *)lock_accelerometerClients enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_handleAccelerometerRequestForPort:(id)a3 auditToken:(id *)a4 updateBlock:(id)a5
{
  id v9 = a3;
  id v7 = (void (**)(id, BKAccelerometerClientBKSAccelerometer *))a5;
  [(NSLock *)self->_lock lock];
  float v8 = [(BKAccelerometerInterface *)self _lock_existingClientForSendRight:v9];
  if (!v8)
  {
    float v8 = [(BKHIDEventClient *)[BKAccelerometerClientBKSAccelerometer alloc] initWithPid:BSPIDForAuditToken() sendRight:v9];
    [(BKHIDEventClient *)v8 setDelegate:self];
    if (v8) {
      [(NSMutableSet *)self->_lock_accelerometerClients addObject:v8];
    }
  }
  if (v7) {
    v7[2](v7, v8);
  }
  [(NSLock *)self->_lock unlock];
  [(BKAccelerometerInterface *)self _updateSettings];
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  IOHIDEventGetTimeStamp();
  BSMonotonicReferencedTimeFromMachTime();
  double v7 = v6;
  IOHIDEventGetFloatValue();
  double v9 = v8;
  IOHIDEventGetFloatValue();
  double v11 = v10;
  IOHIDEventGetFloatValue();
  double v13 = v12;
  int IntegerValue = IOHIDEventGetIntegerValue();
  v15 = sub_100012808();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    int v37 = IntegerValue;
    __int16 v38 = 2048;
    double v39 = v9;
    __int16 v40 = 2048;
    double v41 = v11;
    __int16 v42 = 2048;
    double v43 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Acc (type %d): %f %f %f", buf, 0x26u);
  }

  [(NSLock *)self->_lock lock];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  float v16 = self->_lock_accelerometerClients;
  id v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    id v21 = v17;
    uint64_t v22 = *(void *)v32;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v16);
        }
        float v23 = v9;
        *(float *)&double v18 = v23;
        float v24 = v11;
        *(float *)&double v19 = v24;
        float v25 = v13;
        *(float *)&double v20 = v25;
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v26) handleAccelerometerEventWithTimestamp:v7 x:v18 y:v19 z:v20 samplingInterval:self->_lock_samplingInterval];
        v26 = (char *)v26 + 1;
      }
      while (v21 != v26);
      id v21 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v21);
  }

  [(NSLock *)self->_lock unlock];
  if (([(BKSLocalDefaults *)self->_localDefaults disableStudyLogAccelerometerLogging] & 1) == 0)
  {
    studyLog = self->_studyLog;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100061814;
    v29[3] = &unk_1000F7670;
    *(double *)&v29[4] = v9;
    *(double *)&v29[5] = v11;
    *(double *)&v29[6] = v13;
    int v30 = IntegerValue;
    [(SLGNotificationActivatedLogger *)studyLog logBlock:v29 domain:@"com.apple.backboard.hid.accelerometer"];
  }
  return 1;
}

- (void)bksAccelerometerClientRequestedAccelerometerEvents:(id)a3 updateInterval:(double)a4 xThreshold:(float)a5 yThreshold:(float)a6 zThreshold:(float)a7 auditToken:(id *)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001AEE4;
  v8[3] = &unk_1000F7630;
  *(double *)&v8[4] = a4;
  float v9 = a5;
  float v10 = a6;
  float v11 = a7;
  [(BKAccelerometerInterface *)self _handleAccelerometerRequestForPort:a3 auditToken:a8 updateBlock:v8];
}

+ (id)sharedInstance
{
  if (qword_100122FF8 != -1) {
    dispatch_once(&qword_100122FF8, &stru_1000F7610);
  }
  v2 = (void *)qword_100122FF0;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_studyLog, 0);
  objc_storeStrong(&self->_lock_orientationManagerObservationAssertion, 0);
  objc_storeStrong((id *)&self->_lock_orientationManager, 0);
  objc_storeStrong((id *)&self->_lock_systemAppOrientationClient, 0);
  objc_storeStrong((id *)&self->_lock_accelerometerClients, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  BOOL v6 = a6;
  [(NSLock *)self->_lock lock];
  lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;
  if (lock_systemAppOrientationClient)
  {
    [(BKAccelerometerClient *)lock_systemAppOrientationClient handleOrientationEvent:a4 orientationLocked:v6];
  }
  else
  {
    mach_absolute_time();
    uint64_t DeviceOrientationEventWithUsage = IOHIDEventCreateDeviceOrientationEventWithUsage();
    if (DeviceOrientationEventWithUsage)
    {
      float v11 = (const void *)DeviceOrientationEventWithUsage;
      double v12 = +[BKHIDSystemInterface sharedInstance];
      double v13 = +[BKHIDUnknownSender unknownSenderInfo];
      [v12 postEvent:v11 fromSender:v13];

      CFRelease(v11);
    }
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)_lock_systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  double v8 = BKHIDEventRoutingGetClientConnectionManager();
  id v9 = [v8 pidForBundleID:v7];

  if (v7 && (int)v9 >= 1 && v5)
  {
    p_lock_systemAppOrientationClient = (id *)&self->_lock_systemAppOrientationClient;
    if ([(BKHIDEventClient *)self->_lock_systemAppOrientationClient pid] != v9)
    {
      [(BKAccelerometerInterface *)self _lock_clearSystemAppOrientationClient];
      float v11 = [(BKHIDEventClient *)[BKAccelerometerClientUIApp alloc] initWithPid:v9 sendRight:0];
      [(BKHIDEventClient *)v11 setDelegate:self];
      [(BKAccelerometerClient *)v11 setWantsOrientationEvents:1];
      [(NSMutableSet *)self->_lock_accelerometerClients addObject:v11];
      objc_storeStrong((id *)&self->_lock_systemAppOrientationClient, v11);
      uint64_t v16 = 0;
      BOOL v12 = sub_100094E9C((uint64_t)self->_lock_orientationManager, (uint64_t)&v16);
      double v13 = BKLogOrientationDevice();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *p_lock_systemAppOrientationClient;
        v15 = BSDeviceOrientationDescription();
        *(_DWORD *)buf = 138543874;
        id v18 = v14;
        __int16 v19 = 2114;
        double v20 = v15;
        __int16 v21 = 1024;
        BOOL v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "systemAppSetOrientationEventsClient:%{public}@ currentOrientation:%{public}@ orientationLocked:%{BOOL}u", buf, 0x1Cu);
      }
      if (v16) {
        [*p_lock_systemAppOrientationClient handleOrientationEvent:v16 orientationLocked:v12];
      }
    }
  }
  else
  {
    [(BKAccelerometerInterface *)self _lock_clearSystemAppOrientationClient];
  }
}

- (void)_lock_clearSystemAppOrientationClient
{
  if (self->_lock_systemAppOrientationClient)
  {
    -[NSMutableSet removeObject:](self->_lock_accelerometerClients, "removeObject:");
    [(BKHIDEventClient *)self->_lock_systemAppOrientationClient invalidate];
    lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;
    self->_lock_systemAppOrientationClient = 0;
  }
}

- (void)clientDied:(id)a3
{
  lock = self->_lock;
  BOOL v5 = (BKAccelerometerClient *)a3;
  [(NSLock *)lock lock];
  [(BKHIDEventClient *)v5 invalidate];
  [(NSMutableSet *)self->_lock_accelerometerClients removeObject:v5];
  lock_systemAppOrientationClient = self->_lock_systemAppOrientationClient;

  if (lock_systemAppOrientationClient == v5) {
    [(BKAccelerometerInterface *)self _lock_clearSystemAppOrientationClient];
  }
  [(NSLock *)self->_lock unlock];

  [(BKAccelerometerInterface *)self _updateSettings];
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  lock_orientationManager = self->_lock_orientationManager;
  if (lock_orientationManager)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    queue = lock_orientationManager->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100094324;
    v12[3] = &unk_1000F8EA0;
    v12[4] = lock_orientationManager;
    v12[5] = &v13;
    dispatch_sync(queue, v12);
    BOOL v6 = *((unsigned char *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [v3 appendBool:v6 withName:@"eventsEnabled"];
  id v8 = [v3 appendObject:self->_lock_accelerometerClients withName:@"clients"];
  id v9 = [v3 appendObject:self->_lock_systemAppOrientationClient withName:@"systemAppOrientationClient"];
  float v10 = [v3 build];

  return (NSString *)v10;
}

- (void)systemAppSetOrientationEventsClient:(id)a3 wantsOrientationEvents:(BOOL)a4 auditToken:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(NSLock *)self->_lock lock];
  id v9 = BKLogOrientationDevice();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "systemAppSetOrientationEventsClient:%{public}@ wantsOrientationEvents:%{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  [(BKAccelerometerInterface *)self _lock_systemAppSetOrientationEventsClient:v8 wantsOrientationEvents:v6 auditToken:a5];
  [(NSLock *)self->_lock unlock];
  [(BKAccelerometerInterface *)self _updateSettings];
}

- (void)bksAccelerometerClientRequestedOrientationEvents:(id)a3 enabled:(BOOL)a4 passiveEvents:(BOOL)a5 auditToken:(id *)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061C50;
  v6[3] = &unk_1000F7650;
  BOOL v7 = a4;
  BOOL v8 = a5;
  [(BKAccelerometerInterface *)self _handleAccelerometerRequestForPort:a3 auditToken:a6 updateBlock:v6];
}

- (void)dealloc
{
  id v4 = +[NSString stringWithFormat:@"this object should not be deallocated"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2048;
    BOOL v13 = self;
    __int16 v14 = 2114;
    CFStringRef v15 = @"BKAccelerometerInterface.m";
    __int16 v16 = 1024;
    int v17 = 90;
    __int16 v18 = 2114;
    __int16 v19 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (BKAccelerometerInterface)init
{
  v25.receiver = self;
  v25.super_class = (Class)BKAccelerometerInterface;
  v2 = [(BKAccelerometerInterface *)&v25 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    BOOL v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    lock_accelerometerClients = v2->_lock_accelerometerClients;
    v2->_lock_accelerometerClients = v5;

    uint64_t v7 = sub_10001C32C();
    lock_orientationManager = v2->_lock_orientationManager;
    v2->_lock_orientationManager = (BKOrientationManager *)v7;

    uint64_t v9 = sub_100095730((id *)&v2->_lock_orientationManager->super.isa, v2);
    id lock_orientationManagerObservationAssertion = v2->_lock_orientationManagerObservationAssertion;
    v2->_id lock_orientationManagerObservationAssertion = (id)v9;

    uint64_t v11 = (uint64_t)v2->_lock_orientationManager;
    uint64_t v12 = sub_100094DAC(v11);
    BOOL v13 = v2->_lock_orientationManager;
    if (v13)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 0;
      queue = v13->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100094E78;
      block[3] = &unk_1000F8EA0;
      block[4] = v13;
      block[5] = &v27;
      dispatch_sync(queue, block);
      BOOL v15 = *((unsigned char *)v28 + 24) != 0;
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      BOOL v15 = 0;
    }
    [(BKAccelerometerInterface *)v2 orientationManager:v11 deviceOrientationMayHaveChanged:v12 changeSource:0 isDeviceOrientationLocked:v15];
    uint64_t v16 = +[BKSDefaults localDefaults];
    localDefaults = v2->_localDefaults;
    v2->_localDefaults = (BKSLocalDefaults *)v16;

    id v18 = objc_alloc((Class)SLGNotificationActivatedLogger);
    id v19 = objc_alloc((Class)SLGActivatableLogger);
    double v20 = +[SLGLog sharedInstance];
    id v21 = [v19 initWithLogger:v20];
    BOOL v22 = (SLGNotificationActivatedLogger *)[v18 initWithLogger:v21];
    studyLog = v2->_studyLog;
    v2->_studyLog = v22;

    [(SLGNotificationActivatedLogger *)v2->_studyLog addBeginNotification:@"SBStudyLogBeginCameraButtonLogging" endNotification:@"SBStudyLogEndCameraButtonLogging"];
  }
  return v2;
}

@end