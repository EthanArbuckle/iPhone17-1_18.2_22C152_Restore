@interface PLSensorAgent
+ (BOOL)shouldLogRearLux;
+ (id)entryEventPointDefinitionALS;
+ (id)entryEventPointDefinitionActivity;
+ (id)entryEventPointDefinitionOrientation;
+ (id)entryEventPointDefinitionPocketState;
+ (id)entryEventPointDefinitionProximity;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)firstProximityEvent;
- (BrightnessSystemClient)brightnessSystemClient;
- (CMDeviceOrientationManager)deviceOrientationManager;
- (CMMotionActivityManager)motionActivityManager;
- (CMPocketStateManager)pocketStateManager;
- (NSOperationQueue)operationQueue;
- (PLSensorAgent)init;
- (PLStateTrackingComposition)stateTracker;
- (PLTimer)proximityTimer;
- (__IOHIDEventSystemClient)proximityHIDClient;
- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4;
- (void)handleMotionActivityManagerNotification:(id)a3;
- (void)handleOrientationManagerNotification:(id)a3;
- (void)handlePocketStateManagerNotification:(int64_t)a3;
- (void)initTaskOperatorDependancies;
- (void)logEventPointALS:(id)a3;
- (void)logEventPointActivity:(id)a3;
- (void)logEventPointDeviceOrientation:(id)a3;
- (void)logEventPointPocketState:(id)a3;
- (void)logEventPointProximity:(id)a3;
- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)setBrightnessSystemClient:(id)a3;
- (void)setDeviceOrientationManager:(id)a3;
- (void)setFirstProximityEvent:(BOOL)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPocketStateManager:(id)a3;
- (void)setProximityHIDClient:(__IOHIDEventSystemClient *)a3;
- (void)setProximityTimer:(id)a3;
- (void)setStateTracker:(id)a3;
@end

@implementation PLSensorAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSensorAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"MotionActivity";
  objc_super v2 = +[PLSensorAgent entryEventPointDefinitionActivity];
  v10[0] = v2;
  v9[1] = @"DeviceOrientation";
  v3 = +[PLSensorAgent entryEventPointDefinitionOrientation];
  v10[1] = v3;
  v9[2] = @"PocketState";
  v4 = +[PLSensorAgent entryEventPointDefinitionPocketState];
  v10[2] = v4;
  v9[3] = @"Proximity";
  v5 = +[PLSensorAgent entryEventPointDefinitionProximity];
  v10[3] = v5;
  v9[4] = @"ALS";
  v6 = +[PLSensorAgent entryEventPointDefinitionALS];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

+ (id)entryEventPointDefinitionActivity
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F1160;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F92CE8];
  v14[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Stationary";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"Confidence";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionOrientation
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1160;
  v12[1] = MEMORY[0x1E4F1CC38];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Orientation";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionPocketState
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1160;
  v12[1] = MEMORY[0x1E4F1CC38];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"State";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionProximity
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F1160;
  v12[1] = MEMORY[0x1E4F1CC38];
  void v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"State";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionALS
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F1170;
  v14[1] = MEMORY[0x1E4F1CC38];
  void v13[2] = *MEMORY[0x1E4F92CE8];
  v14[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Lux";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"RearLux";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

- (PLSensorAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLSensorAgent;
  uint64_t v2 = [(PLAgent *)&v7 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    v5 = [(PLOperator *)v2 workQueue];
    [(NSOperationQueue *)v2->_operationQueue setUnderlyingQueue:v5];

    v2->_firstProximityEvent = 0;
  }
  return v2;
}

- (void)initTaskOperatorDependancies
{
  v3 = [MEMORY[0x1E4F92A50] sharedInstance];
  stateTracker = self->_stateTracker;
  self->_stateTracker = v3;

  v5 = (CMPocketStateManager *)objc_alloc_init(MEMORY[0x1E4F22268]);
  pocketStateManager = self->_pocketStateManager;
  self->_pocketStateManager = v5;

  objc_super v7 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E4F22220]);
  motionActivityManager = self->_motionActivityManager;
  self->_motionActivityManager = v7;

  v9 = (CMDeviceOrientationManager *)objc_alloc_init(MEMORY[0x1E4F221E8]);
  deviceOrientationManager = self->_deviceOrientationManager;
  self->_deviceOrientationManager = v9;

  self->_proximityHIDClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  v11 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
  brightnessSystemClient = self->_brightnessSystemClient;
  self->_brightnessSystemClient = v11;

  v13 = self->_motionActivityManager;
  v14 = [(PLSensorAgent *)self operationQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke;
  v29[3] = &unk_1E69310C0;
  v29[4] = self;
  [(CMMotionActivityManager *)v13 startActivityUpdatesToQueue:v14 withHandler:v29];

  v15 = self->_deviceOrientationManager;
  v16 = [(PLSensorAgent *)self operationQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_2;
  v28[3] = &unk_1E69310E8;
  v28[4] = self;
  [(CMDeviceOrientationManager *)v15 startDeviceOrientationUpdatesToQueue:v16 withHandler:v28];

  [(CMPocketStateManager *)self->_pocketStateManager setDelegate:self];
  v17 = self->_pocketStateManager;
  v18 = [(PLOperator *)self workQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_3;
  v27[3] = &unk_1E6931110;
  v27[4] = self;
  [(CMPocketStateManager *)v17 queryStateOntoQueue:v18 andMonitorFor:v27 withTimeout:0.0 andHandler:1.0];

  v19 = self->_brightnessSystemClient;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_4;
  v26[3] = &unk_1E692D2C0;
  v26[4] = self;
  [(BrightnessSystemClient *)v19 registerNotificationBlock:v26 forProperties:&unk_1F29EFE30];
  IOHIDEventSystemClientSetMatching();
  v20 = [(PLOperator *)self workQueue];
  IOHIDEventSystemClientScheduleWithDispatchQueue();

  IOHIDEventSystemClientRegisterEventCallback();
  if ([MEMORY[0x1E4F929C0] BOOLForKey:@"EnableALSProximity" ifNotSet:1])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F92A80]);
    v22 = [MEMORY[0x1E4F1C9C8] date];
    v23 = [(PLOperator *)self workQueue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_87;
    v25[3] = &unk_1E692A200;
    v25[4] = self;
    v24 = (void *)[v21 initWithFireDate:v22 withInterval:1 withTolerance:0 repeats:v23 withUserInfo:v25 withQueue:60.0 withBlock:0.0];
    [(PLSensorAgent *)self setProximityTimer:v24];
  }
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleMotionActivityManagerNotification:a2];
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleOrientationManagerNotification:a2];
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handlePocketStateManagerNotification:a2];
}

uint64_t __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleBrightnessClientNotification:a2 withValue:a3];
}

void __45__PLSensorAgent_initTaskOperatorDependancies__block_invoke_87(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateTracker];
  v3 = [v2 getCurrState:4];

  if (([v3 BOOLValue] & 1) == 0)
  {
    [*(id *)(a1 + 32) setFirstProximityEvent:1];
    BKSHIDServicesRequestProximityStatusEvent();
    v4 = PLLogSensor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Requested Proximity Status from BackBoardServices", buf, 2u);
    }

    v5 = [*(id *)(a1 + 32) brightnessSystemClient];
    [v5 setProperty:MEMORY[0x1E4F1CC38] forKey:@"ActivateALS"];

    v6 = PLLogSensor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Activated CoreBrightness ALS", v7, 2u);
    }
  }
}

- (void)logEventPointALS:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ALS"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDeviceOrientation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"DeviceOrientation"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointActivity:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MotionActivity"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointPocketState:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PocketState"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointProximity:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"Proximity"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [a3 isEqual:@"Lux"];
  if (v6 && v7)
  {
    v8 = [(PLSensorAgent *)self stateTracker];
    v9 = [v8 getCurrState:4];

    if (([v9 BOOLValue] & 1) == 0)
    {
      v10 = [(PLSensorAgent *)self brightnessSystemClient];
      [v10 setProperty:MEMORY[0x1E4F1CC28] forKey:@"ActivateALS"];

      if (+[PLSensorAgent shouldLogRearLux])
      {
        uint64_t v18 = 0;
        *(void *)&long long buf = &v21;
        *((void *)&buf + 1) = &v20;
        v17 = &v22;
        uint64_t v19 = 0x4E0000001;
        v11 = [(PLOperator *)self workQueue];
        ApplePhotonDetectorServicesGetLux();
      }
      v14 = @"Lux";
      id v15 = v6;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      [(PLSensorAgent *)self logEventPointALS:v12];

      v13 = PLLogSensor();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "Received ALS event (display-off) Front: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

+ (BOOL)shouldLogRearLux
{
  int v2 = [MEMORY[0x1E4F92A38] isiPhone];
  if (v2) {
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 102040, 102041, 0);
  }
  return v2;
}

- (void)handleOrientationManagerNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLLogSensor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      int v12 = [v4 orientation];
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Device orientation event: %d", buf, 8u);
    }

    if ([v4 orientation] == 5)
    {
      uint64_t v6 = 0;
    }
    else if ([v4 orientation] == 6)
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 2;
    }
    int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6, @"Orientation");
    v10 = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [(PLSensorAgent *)self logEventPointDeviceOrientation:v8];
  }
}

- (void)handleMotionActivityManagerNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLLogSensor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Device activity event: %@", buf, 0xCu);
    }

    if ([v4 confidence] >= 1)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "stationary", @"Stationary"));
      v9[1] = @"Confidence";
      v10[0] = v6;
      int v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "confidence"));
      v10[1] = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
      [(PLSensorAgent *)self logEventPointActivity:v8];
    }
  }
}

- (void)handlePocketStateManagerNotification:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = PLLogSensor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109120;
    int v11 = a3;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Pocket state event: %d", buf, 8u);
  }

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"State");
  uint64_t v9 = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [(PLSensorAgent *)self logEventPointPocketState:v7];
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  if (a3) {
    [(PLSensorAgent *)self handlePocketStateManagerNotification:a4];
  }
}

- (BOOL)firstProximityEvent
{
  return self->_firstProximityEvent;
}

- (void)setFirstProximityEvent:(BOOL)a3
{
  self->_firstProximityEvent = a3;
}

- (PLTimer)proximityTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProximityTimer:(id)a3
{
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateTracker:(id)a3
{
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return (BrightnessSystemClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBrightnessSystemClient:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (CMPocketStateManager)pocketStateManager
{
  return (CMPocketStateManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPocketStateManager:(id)a3
{
}

- (CMMotionActivityManager)motionActivityManager
{
  return (CMMotionActivityManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMotionActivityManager:(id)a3
{
}

- (CMDeviceOrientationManager)deviceOrientationManager
{
  return (CMDeviceOrientationManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceOrientationManager:(id)a3
{
}

- (__IOHIDEventSystemClient)proximityHIDClient
{
  return self->_proximityHIDClient;
}

- (void)setProximityHIDClient:(__IOHIDEventSystemClient *)a3
{
  self->_proximityHIDClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrientationManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_proximityTimer, 0);
}

@end