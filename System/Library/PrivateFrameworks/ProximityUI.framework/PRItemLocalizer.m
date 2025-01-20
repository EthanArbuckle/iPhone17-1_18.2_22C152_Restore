@interface PRItemLocalizer
+ (BOOL)isInternalBuild;
- (BOOL)commonConfigure:(id)a3;
- (BOOL)configureForDeviceWithId:(id)a3;
- (BOOL)configureForItem:(id)a3;
- (BOOL)deviceIsMoving;
- (BOOL)firstAoAArrow;
- (BOOL)firstRangeArrow;
- (BOOL)pathIsDegenerate;
- (BOOL)requiresLowerRangingFrequency;
- (BOOL)startWithDevicePoseProvider:(id)a3 error:(id *)a4;
- (BOOL)stop:(id *)a3;
- (BOOL)targetIsMoving;
- (BatchSolution)lastSolution;
- (BatchSolution)performLocationFiltering:(SEL)a3;
- (CMMotionActivityManager)deviceActivityManager;
- (NSDictionary)configurationParameters;
- (NSMutableArray)trajectory;
- (NSNumber)isOwner;
- (NSOperationQueue)activityQueue;
- (NSTimer)movementTimer;
- (NSUUID)productUUID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)estimatorQueue;
- (OS_dispatch_queue)proximityQueue;
- (PRCompanionRangingSession)session;
- (PRDevicePoseProvider)poseProvider;
- (PRFindMyCoreAnalytics)analytics;
- (PRItemLocalizer)initWithDelegate:(id)a3 queue:(id)a4;
- (PRItemLocalizerDataRecorder)dataRecorder;
- (PRItemLocalizerDelegate)delegate;
- (PRRemoteDevice)remoteDevice;
- (PRRoseSolution)latestProximity;
- (double)previousVIOPoseTime;
- (id).cxx_construct;
- (id)estimatorInputForProximity:(id)a3;
- (id)performRangeFilteringWithVIO:(id)a3;
- (id)performRangeFilteringWithoutVIO:(id)a3 targetMoving:(BOOL)a4 deviceMoving:(BOOL)a5;
- (id)produceBlendedRangeEstimateForPose:(id)a3;
- (id)saveData;
- (unint64_t)trajectoryIndexForTime:(double)a3;
- (void)analyticsLogTorchButtonPresented;
- (void)analyticsLogTorchChangedState:(BOOL)a3;
- (void)dealloc;
- (void)deleteTrajectoryWaypointsBeforeTime:(double)a3;
- (void)devicePoseUpdated:(id)a3;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)discardData;
- (void)invalidPoseDetected;
- (void)logAndPresentSolution:(BatchSolution *)a3 withTimeStamp:(double)a4;
- (void)logEstimatorInput:(id)a3;
- (void)logRangeEstimate:(id)a3;
- (void)logTargetEstimates:(id)a3;
- (void)logTargetIsMovingChange:(BOOL)a3;
- (void)performFilteringWithEstimatorInput:(id)a3 targetMoving:(BOOL)a4 deviceMoving:(BOOL)a5;
- (void)presentRangeEstimate:(id)a3;
- (void)presentTargetEstimate:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4;
- (void)remoteDeviceDidMove;
- (void)reset;
- (void)revokeTargetEstimate:(unint64_t)a3;
- (void)revokeTargetEstimateWithLastSolution:(BatchSolution *)a3;
- (void)sendItemLocalizerChangedActivity:(unint64_t)a3;
- (void)sendItemLocalizerChangedState:(unint64_t)a3;
- (void)sendPRItemState:(unint64_t)a3;
- (void)setActivityQueue:(id)a3;
- (void)setAnalytics:(id)a3;
- (void)setConfigurationParameters:(id)a3;
- (void)setDataRecorder:(id)a3;
- (void)setDegeneratePath:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDeviceActivityManager:(id)a3;
- (void)setDeviceIsMoving:(BOOL)a3;
- (void)setEstimatorQueue:(id)a3;
- (void)setFirstAoAArrow:(BOOL)a3;
- (void)setFirstRangeArrow:(BOOL)a3;
- (void)setIsOwner:(id)a3;
- (void)setLastSolution:(BatchSolution *)a3;
- (void)setLatestProximity:(id)a3;
- (void)setMovementTimer:(id)a3;
- (void)setPathIsDegenerate:(BOOL)a3;
- (void)setPoseProvider:(id)a3;
- (void)setPreviousVIOPoseTime:(double)a3;
- (void)setProductUUID:(id)a3;
- (void)setProximityQueue:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setRequiresLowerRangingFrequency:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setTargetIsMoving:(BOOL)a3;
- (void)setTrajectory:(id)a3;
- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4;
@end

@implementation PRItemLocalizer

+ (BOOL)isInternalBuild
{
  if (+[PRItemLocalizer isInternalBuild]::onceToken != -1) {
    dispatch_once(&+[PRItemLocalizer isInternalBuild]::onceToken, &__block_literal_global_1);
  }
  return +[PRItemLocalizer isInternalBuild]::isInternalBuild;
}

uint64_t __34__PRItemLocalizer_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[PRItemLocalizer isInternalBuild]::isInternalBuild = result;
  return result;
}

- (PRItemLocalizer)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PRItemLocalizer.mm", 171, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PRItemLocalizer.mm", 172, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PRItemLocalizer;
  v10 = [(PRItemLocalizer *)&v21 init];
  v11 = v10;
  if (v10)
  {
    [(PRItemLocalizer *)v10 setDelegate:v7];
    [(PRItemLocalizer *)v11 setDelegateQueue:v9];
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.findmy.ranging", 0);
    [(PRItemLocalizer *)v11 setProximityQueue:v12];

    *(void *)&v11->_clientState = 1;
    v11->_lastSuccessfulCompanionCommunicationOrInitMachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
    id v13 = objc_alloc(MEMORY[0x263F623C0]);
    v14 = [(PRItemLocalizer *)v11 proximityQueue];
    v15 = (void *)[v13 initWithDelegate:v11 queue:v14];
    [(PRItemLocalizer *)v11 setSession:v15];

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.findmy.itemlocalizer", 0);
    [(PRItemLocalizer *)v11 setEstimatorQueue:v16];

    v17 = [MEMORY[0x263EFF980] arrayWithCapacity:512];
    [(PRItemLocalizer *)v11 setTrajectory:v17];

    operator new();
  }

  return 0;
}

- (BOOL)configureForDeviceWithId:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 UUIDString];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "ItemLocalizer configuring for item %@", buf, 0xCu);
  }
  if ([(id)objc_opt_class() isInternalBuild])
  {
    dispatch_queue_t v12 = @"deviceId";
    id v13 = v5;
    id v7 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v8 = [(PRItemLocalizer *)self analytics];
    [v8 setCustomData:v7];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F623D0]) initWithCompanionUUID:v4];
  [(PRItemLocalizer *)self setRemoteDevice:v9];

  BOOL v10 = [(PRItemLocalizer *)self commonConfigure:0];
  return v10;
}

- (BOOL)configureForItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 uuid];
  v6 = [v4 productUUID];
  [(PRItemLocalizer *)self setProductUUID:v6];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isOwned"));
  [(PRItemLocalizer *)self setIsOwner:v7];

  -[PRItemLocalizer setRequiresLowerRangingFrequency:](self, "setRequiresLowerRangingFrequency:", [v4 requiresLowerRangingFrequency]);
  int v8 = [v4 isOwned];
  v9 = [(PRItemLocalizer *)self productUUID];

  BOOL v10 = self->_logger;
  BOOL v11 = os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      id v12 = [v5 UUIDString];
      id v13 = [(PRItemLocalizer *)self productUUID];
      uint64_t v14 = [v13 UUIDString];
      v15 = (void *)v14;
      uint64_t v16 = "true";
      int v22 = 138412802;
      uint64_t v23 = (uint64_t)v12;
      if (v8) {
        uint64_t v16 = "false";
      }
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      __int16 v26 = 2080;
      v27 = v16;
      _os_log_impl(&dword_230EC1000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "ItemLocalizer configuring for item %@ with productUUID %@, isUT: %s", (uint8_t *)&v22, 0x20u);
    }
  }
  else if (v11)
  {
    uint64_t v17 = [v5 UUIDString];
    v18 = (void *)v17;
    v19 = "true";
    if (v8) {
      v19 = "false";
    }
    int v22 = 138412546;
    uint64_t v23 = v17;
    __int16 v24 = 2080;
    uint64_t v25 = (uint64_t)v19;
    _os_log_impl(&dword_230EC1000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "ItemLocalizer configuring for item %@ with no productUUID, isUT: %s", (uint8_t *)&v22, 0x16u);
  }
  BOOL v20 = [(PRItemLocalizer *)self configureForDeviceWithId:v5];

  return v20;
}

- (BOOL)commonConfigure:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_clientState == 1)
  {
    self->_clientState = 2;
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_CONFIGURING commonConfigure", buf, 2u);
    }
    v6 = [MEMORY[0x263F08C38] UUID];
    *(void *)buf = 0;
    uint64_t v31 = 0;
    [v6 getUUIDBytes:buf];
    int8x8_t v7 = vceqz_s8(*(int8x8_t *)buf);
    if (v7.i8[0]) {
      buf[0] = 1;
    }
    if (v7.i8[1]) {
      buf[1] = 1;
    }
    if (v7.i8[2]) {
      buf[2] = 1;
    }
    if (v7.i8[3]) {
      buf[3] = 1;
    }
    if (v7.i8[4]) {
      uint8_t buf[4] = 1;
    }
    if (v7.i8[5]) {
      buf[5] = 1;
    }
    if (v7.i8[6]) {
      buf[6] = 1;
    }
    if (v7.i8[7]) {
      buf[7] = 1;
    }
    int v8 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:8];
    uint64_t v9 = [(PRItemLocalizer *)self remoteDevice];
    [(id)v9 setRoseMACAddress:v8];

    [(PRItemLocalizer *)self setConfigurationParameters:v4];
    BOOL v10 = [(PRItemLocalizer *)self configurationParameters];
    LOBYTE(v9) = v10 == 0;

    if ((v9 & 1) != 0
      || ([(PRItemLocalizer *)self configurationParameters],
          BOOL v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = PRSetRoseGlobalConfigParams(),
          v11,
          (v12 & 1) != 0))
    {
      id v13 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v14 = [(PRItemLocalizer *)self configurationParameters];
      v15 = [v13 dictionaryWithDictionary:v14];

      BOOL v16 = [(PRItemLocalizer *)self requiresLowerRangingFrequency];
      uint64_t v17 = self->_logger;
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_230EC1000, v17, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting gatt ranging to true", v29, 2u);
        }
        v19 = [NSNumber numberWithBool:1];
        [v15 setObject:v19 forKeyedSubscript:@"GattRanging"];
      }
      else
      {
        if (v18)
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_230EC1000, v17, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting gatt ranging to false", v29, 2u);
        }
        v19 = [NSNumber numberWithBool:0];
        [v15 setObject:v19 forKeyedSubscript:@"GattRanging"];
      }

      [(PRItemLocalizer *)self setConfigurationParameters:v15];
      self->_rangingState = 2;
      int v22 = [(PRItemLocalizer *)self session];
      uint64_t v23 = [(PRItemLocalizer *)self remoteDevice];
      __int16 v24 = [(PRItemLocalizer *)self configurationParameters];
      [v22 configureForCompanionRanging:v23 options:v24];

      uint64_t v25 = [(PRItemLocalizer *)self analytics];
      __int16 v26 = [(PRItemLocalizer *)self productUUID];
      v27 = [(PRItemLocalizer *)self isOwner];
      [v25 configureSessionWithProductUUID:v26 withOwner:v27];

      BOOL v21 = 1;
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v20 = self->_logger;
    BOOL v21 = 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EC1000, v20, OS_LOG_TYPE_DEFAULT, "#companion-retry Unexpected call to configure", buf, 2u);
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (BOOL)startWithDevicePoseProvider:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "ItemLocalizer start with pose provider %@", buf, 0xCu);
  }
  if (self->_clientState == 3)
  {
    self->_clientState = 4;
    int v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_RANGING startWithDevicePoseProvider", buf, 2u);
    }
    [(PRItemLocalizer *)self setPoseProvider:v6];
    uint64_t v9 = [(PRItemLocalizer *)self poseProvider];
    [v9 setDelegate:self];

    [(PRItemLocalizer *)self reset];
    [(PRItemLocalizer *)self setFirstRangeArrow:0];
    [(PRItemLocalizer *)self setFirstAoAArrow:0];
    [(PRItemLocalizer *)self setPreviousVIOPoseTime:0.0];
    objc_initWeak((id *)buf, self);
    BOOL v10 = [(PRItemLocalizer *)self estimatorQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke;
    block[3] = &unk_264BC1B80;
    objc_copyWeak(&v27, (id *)buf);
    dispatch_async(v10, block);

    [(PRItemLocalizer *)self setDeviceIsMoving:1];
    BOOL v11 = [(PRItemLocalizer *)self deviceActivityManager];
    char v12 = [(PRItemLocalizer *)self activityQueue];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke_2;
    __int16 v24 = &unk_264BC1C70;
    objc_copyWeak(&v25, (id *)buf);
    [v11 startActivityUpdatesToQueue:v12 withHandler:&v21];

    id v13 = [(PRItemLocalizer *)self analytics];
    [v13 start];

    [(PRItemLocalizer *)self sendItemLocalizerChangedActivity:1];
    if (self->_rangingState == 3)
    {
      uint64_t v14 = [(PRItemLocalizer *)self session];
      v15 = [(PRItemLocalizer *)self remoteDevice];
      int v16 = [v14 startCompanionRanging:v15 options:0 error:a4];

      if (!v16)
      {
        [(PRItemLocalizer *)self didFailWithError:*a4];
        BOOL v18 = 0;
        goto LABEL_13;
      }
      uint64_t v17 = [(PRItemLocalizer *)self dataRecorder];
      [v17 start];

      self->_rangingState = 4;
    }
    BOOL v18 = 1;
LABEL_13:
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  v19 = self->_logger;
  BOOL v18 = 0;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EC1000, v19, OS_LOG_TYPE_DEFAULT, "#companion-retry Unexpected call to start", buf, 2u);
    BOOL v18 = 0;
  }
LABEL_14:

  return v18;
}

void __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    objc_loadWeakRetained(v1);
    operator new();
  }
}

void __53__PRItemLocalizer_startWithDevicePoseProvider_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    int v7 = [v3 stationary];
    int v8 = v6[3];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        __int16 v13 = 0;
        BOOL v10 = "#itemlocalizerActivity stationary now";
        BOOL v11 = (uint8_t *)&v13;
LABEL_8:
        _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      LOWORD(v12) = 0;
      BOOL v10 = "#itemlocalizerActivity NON-stationary now";
      BOOL v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
    objc_msgSend(v6, "setDeviceIsMoving:", v7 ^ 1u, v12);
    goto LABEL_10;
  }
  id v6 = 0;
LABEL_10:
}

- (BOOL)stop:(id *)a3
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "ItemLocalizer stop", (uint8_t *)buf, 2u);
  }
  if (self->_clientState == 4)
  {
    id v6 = [(PRItemLocalizer *)self poseProvider];
    [v6 setDelegate:0];

    int v7 = [(PRItemLocalizer *)self analytics];
    [v7 stop];

    int v8 = self->_logger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_CONFIGURED stop", (uint8_t *)buf, 2u);
    }
    self->_clientState = 3;
    [(PRItemLocalizer *)self reset];
    objc_initWeak(buf, self);
    BOOL v9 = [(PRItemLocalizer *)self estimatorQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__PRItemLocalizer_stop___block_invoke;
    block[3] = &unk_264BC1B80;
    objc_copyWeak(&v20, buf);
    dispatch_async(v9, block);

    BOOL v10 = [(PRItemLocalizer *)self deviceActivityManager];
    [v10 stopActivityUpdates];

    [(PRItemLocalizer *)self sendItemLocalizerChangedActivity:2];
    if (self->_rangingState == 4)
    {
      BOOL v11 = [(PRItemLocalizer *)self session];
      uint64_t v12 = [(PRItemLocalizer *)self remoteDevice];
      int v13 = [v11 stopCompanionRanging:v12 error:a3];

      if (!v13)
      {
        int v16 = self->_logger;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v18 = 0;
          _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "#companion-retry Failed to stop - triggering retry", v18, 2u);
        }
        [(PRItemLocalizer *)self didFailWithError:*a3];
        BOOL v14 = 0;
        goto LABEL_15;
      }
      self->_rangingState = 3;
    }
    BOOL v14 = 1;
LABEL_15:
    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
    return v14;
  }
  v15 = self->_logger;
  BOOL v14 = 0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230EC1000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry Unexpected call to stop", (uint8_t *)buf, 2u);
    return 0;
  }
  return v14;
}

void __24__PRItemLocalizer_stop___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    objc_loadWeakRetained(v1);
    operator new();
  }
}

- (void)presentTargetEstimate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 vector];
    float v18 = v6;
    [v4 vector];
    float v17 = v7;
    [v4 vector];
    float v16 = v8;
    objc_msgSend(v4, "uncertainty", v9);
    float v11 = v10;
    [v4 weight];
    float v13 = v12;
    [v4 timestamp];
    *(_DWORD *)buf = 134219264;
    double v20 = v18;
    __int16 v21 = 2048;
    double v22 = v17;
    __int16 v23 = 2048;
    double v24 = v16;
    __int16 v25 = 2048;
    double v26 = v11;
    __int16 v27 = 2048;
    double v28 = v13;
    __int16 v29 = 2048;
    uint64_t v30 = v14;
    _os_log_impl(&dword_230EC1000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Sending target to delegate: (%f, %f, %f), uncertainty = %f, weight = %f, time %f", buf, 0x3Eu);
  }

  [(PRItemLocalizer *)self updateDelegateWithSelector:sel_didUpdateItemPosition_ object:v4];
  v15 = [(PRItemLocalizer *)self analytics];
  [v15 targetComputed:v4];
}

- (void)revokeTargetEstimateWithLastSolution:(BatchSolution *)a3
{
  begin = a3->BatchSolutionList.__begin_;
  if (begin == a3->BatchSolutionList.__end_)
  {
    [(PRItemLocalizer *)self revokeTargetEstimate:2];
  }
  else
  {
    int v5 = *((_DWORD *)begin + 40);
    if (v5)
    {
      if (v5 == 2)
      {
        if (a3->solutionStatus == 5)
        {
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)float v11 = 0;
            _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Revoke Straight path solution", v11, 2u);
          }
        }
        float v7 = self;
        uint64_t v8 = 4;
      }
      else
      {
        if (v5 != 1) {
          return;
        }
        if (a3->solutionStatus == 5)
        {
          float v6 = self->_logger;
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Revoke SA solution due to multipath", buf, 2u);
          }
        }
        float v7 = self;
        uint64_t v8 = 2;
      }
    }
    else
    {
      if (a3->solutionStatus == 5)
      {
        uint64_t v9 = self->_logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)float v12 = 0;
          _os_log_impl(&dword_230EC1000, v9, OS_LOG_TYPE_DEFAULT, "Revoke AoA solution due to multipath", v12, 2u);
        }
      }
      float v7 = self;
      uint64_t v8 = 3;
    }
    [(PRItemLocalizer *)v7 revokeTargetEstimate:v8];
  }
}

- (void)revokeTargetEstimate:(unint64_t)a3
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Revoking item position. Sending nil to delegate", buf, 2u);
  }
  [(PRItemLocalizer *)self updateDelegateWithSelector:sel_didUpdateItemPosition_ object:0];
  float v6 = [(PRItemLocalizer *)self analytics];
  [v6 targetRevokedWithReason:a3];

  *(_OWORD *)__p = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  [(PRItemLocalizer *)self setLastSolution:&v7];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)presentRangeEstimate:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double MachTimeSeconds = PRCommonGetMachTimeSeconds();
  [v4 timestamp];
  if (MachTimeSeconds - v6 <= 2.0)
  {
    id v9 = v4;
    [v9 range];
    if (v10 >= 0.0)
    {
      double v20 = self->_logger;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        [v9 range];
        int v25 = 134217984;
        double v26 = v24;
        _os_log_impl(&dword_230EC1000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Sending range to delegate: %f", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      float v11 = [PRProximity alloc];
      [v9 timestamp];
      double v13 = v12;
      [v9 azimuth];
      int v15 = v14;
      [v9 elevation];
      LODWORD(v17) = v16;
      LODWORD(v18) = v15;
      v19 = [(PRProximity *)v11 initWithTime:v13 range:0.0 azimuth:v18 elevation:v17];

      double v20 = self->_logger;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        [v9 range];
        float v22 = v21;
        [(PRProximity *)v19 range];
        int v25 = 134218240;
        double v26 = v22;
        __int16 v27 = 2048;
        double v28 = v23;
        _os_log_impl(&dword_230EC1000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "PresentRangeEstimate overriding negative range = %f. Sending range = %f to delegate", (uint8_t *)&v25, 0x16u);
      }
      id v9 = v19;
    }

    [(PRItemLocalizer *)self updateDelegateWithSelector:sel_didUpdateRangeEstimate_ object:v9];
  }
  else
  {
    long long v7 = self->_logger;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      [v4 timestamp];
      int v25 = 134218240;
      double v26 = MachTimeSeconds;
      __int16 v27 = 2048;
      double v28 = v8;
      _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Not presenting too stale range estimate to the delegate, current time = %f, range estimate time = %f", (uint8_t *)&v25, 0x16u);
    }

    id v9 = [(PRItemLocalizer *)self analytics];
    [v9 revokeRangeEstimate];
  }
}

- (id)saveData
{
  v2 = [(PRItemLocalizer *)self dataRecorder];
  id v3 = [v2 stopAndSave];

  return v3;
}

- (void)discardData
{
  id v2 = [(PRItemLocalizer *)self dataRecorder];
  [v2 stopAndDiscard];
}

- (unint64_t)trajectoryIndexForTime:(double)a3
{
  int v5 = [(PRItemLocalizer *)self trajectory];
  uint64_t v6 = [v5 count];

  long long v7 = +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", a3);
  double v8 = [(PRItemLocalizer *)self trajectory];
  unint64_t v9 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v6, 1024, &__block_literal_global_46);

  return v9;
}

uint64_t __42__PRItemLocalizer_trajectoryIndexForTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  double v8 = NSNumber;
  [v6 timestamp];
  unint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  float v10 = NSNumber;
  [v7 timestamp];
  float v11 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v12 = [v9 compare:v11];

  return v12;
}

- (void)deleteTrajectoryWaypointsBeforeTime:(double)a3
{
  double v8 = [(PRItemLocalizer *)self estimatorQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(PRItemLocalizer *)self trajectory];
  uint64_t v5 = [v9 count];

  if (v5)
  {
    unint64_t v6 = [(PRItemLocalizer *)self trajectoryIndexForTime:a3];
    if (v6)
    {
      unint64_t v7 = v6 - 1;
      id v10 = [(PRItemLocalizer *)self trajectory];
      objc_msgSend(v10, "removeObjectsInRange:", 0, v7);
    }
  }
}

- (id)estimatorInputForProximity:(id)a3
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  objc_msgSend(v4, "mach_absolute_time_sec");
  unint64_t v6 = -[PRItemLocalizer trajectoryIndexForTime:](self, "trajectoryIndexForTime:");
  if (v6)
  {
    unint64_t v7 = [(PRItemLocalizer *)self trajectory];
    uint64_t v8 = [v7 count];

    if (v6 == v8)
    {
LABEL_4:
      id v9 = 0;
      goto LABEL_16;
    }
    float v23 = [(PRItemLocalizer *)self trajectory];
    float v11 = [v23 objectAtIndex:v6 - 1];

    float v24 = [(PRItemLocalizer *)self trajectory];
    double v13 = [v24 objectAtIndex:v6];

    [v11 timestamp];
    double v26 = v25;
    objc_msgSend(v5, "mach_absolute_time_sec");
    if (v26 != v27)
    {
      [v13 timestamp];
      double v29 = v28;
      objc_msgSend(v5, "mach_absolute_time_sec");
      if (v29 != v30)
      {
        [v13 timestamp];
        double v34 = v33;
        [v11 timestamp];
        if (v34 == v35)
        {
          v103[0] = @"prior";
          v103[1] = @"subsequent";
          v104[0] = v11;
          v104[1] = v13;
          [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];
          id v85 = [MEMORY[0x263EFF940] exceptionWithName:@"TimingErrorException" reason:@"Invalid timestamp found on device pose waypoint" userInfo:objc_claimAutoreleasedReturnValue()];
          objc_exception_throw(v85);
        }
        objc_msgSend(v5, "mach_absolute_time_sec");
        double v37 = v36;
        [v11 timestamp];
        double v39 = v38;
        [v13 timestamp];
        double v41 = v40;
        [v11 timestamp];
        double v43 = v42;
        [v11 pose];
        simd_float4 v96 = v45;
        simd_float4 v99 = v44;
        simd_float4 v90 = v47;
        simd_float4 v92 = v46;
        [v13 pose];
        simd_float4 v88 = v49;
        simd_float4 v89 = v48;
        simd_float4 v86 = v51;
        simd_float4 v87 = v50;
        v48.f32[0] = (v37 - v39) / (v41 - v43);
        float v102 = v48.f32[0];
        v113.columns[1] = v96;
        v113.columns[0] = v99;
        v113.columns[3] = v90;
        v113.columns[2] = v92;
        *(double *)v52.i64 = simd_quaternion(v113);
        float32x4_t v100 = v52;
        v114.columns[1] = v88;
        v114.columns[0] = v89;
        v114.columns[3] = v86;
        v114.columns[2] = v87;
        *(double *)v53.i64 = simd_quaternion(v114);
        float32x4_t v54 = vmulq_f32(v100, v53);
        float32x4_t v55 = (float32x4_t)vextq_s8((int8x16_t)v54, (int8x16_t)v54, 8uLL);
        *(float32x2_t *)v54.f32 = vadd_f32(*(float32x2_t *)v54.f32, *(float32x2_t *)v55.f32);
        v54.f32[0] = vaddv_f32(*(float32x2_t *)v54.f32);
        v55.i64[0] = 0;
        float32x4_t v56 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v54, v55)), 0), (int8x16_t)vnegq_f32(v53), (int8x16_t)v53);
        float v57 = 1.0;
        float v58 = 1.0 - v102;
        float32x4_t v59 = vsubq_f32(v100, v56);
        int8x16_t v60 = (int8x16_t)vmulq_f32(v59, v59);
        float32x4_t v97 = v56;
        float32x4_t v61 = vaddq_f32(v100, v56);
        int8x16_t v62 = (int8x16_t)vmulq_f32(v61, v61);
        float v63 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v60, v60, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL)))));
        float v64 = v63 + v63;
        BOOL v65 = (float)(v63 + v63) == 0.0;
        float v66 = 1.0;
        if (!v65) {
          float v66 = sinf(v64) / v64;
        }
        uint64_t v67 = LODWORD(v66);
        float32x2_t v68 = vrecpe_f32((float32x2_t)LODWORD(v66));
        float32x2_t v69 = vmul_f32(v68, vrecps_f32((float32x2_t)v67, v68));
        LODWORD(v70) = vmul_f32(v69, vrecps_f32((float32x2_t)v67, v69)).u32[0];
        if ((float)(v58 * v64) != 0.0)
        {
          float v93 = v70;
          v69.f32[0] = sinf(v58 * v64);
          float v70 = v93;
          float v57 = v69.f32[0] / (float)(v58 * v64);
        }
        v69.f32[0] = v58 * (float)(v70 * v57);
        float32x4_t v71 = (float32x4_t)vdupq_lane_s32((int32x2_t)v69, 0);
        float v72 = v102;
        float v73 = v64 * v102;
        float v74 = 1.0;
        if (v73 != 0.0)
        {
          float32x4_t v91 = v71;
          float v94 = v70;
          float v75 = sinf(v73);
          float v72 = v102;
          float32x4_t v71 = v91;
          float v70 = v94;
          float v74 = v75 / v73;
        }
        float32x4_t v76 = vmlaq_f32(vmulq_n_f32(v97, (float)(v70 * v74) * v72), v100, v71);
        int8x16_t v77 = (int8x16_t)vmulq_f32(v76, v76);
        float32x2_t v78 = vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v77, v77, 8uLL));
        if (vaddv_f32(v78) == 0.0)
        {
          unint64_t v79 = 0;
        }
        else
        {
          unsigned __int32 v80 = vadd_f32(v78, (float32x2_t)vdup_lane_s32((int32x2_t)v78, 1)).u32[0];
          float32x2_t v81 = vrsqrte_f32((float32x2_t)v80);
          float32x2_t v82 = vmul_f32(v81, vrsqrts_f32((float32x2_t)v80, vmul_f32(v81, v81)));
          unint64_t v79 = vmulq_n_f32(v76, vmul_f32(v82, vrsqrts_f32((float32x2_t)v80, vmul_f32(v82, v82))).f32[0]).u64[0];
        }
        double v101 = *(double *)&v79;
        objc_msgSend(v11, "pose", *(_OWORD *)&v86, *(_OWORD *)&v87, *(_OWORD *)&v88, *(_OWORD *)&v89);
        float32x4_t v98 = v83;
        [v13 pose];
        float32x4_t v95 = v84;
        id v9 = objc_alloc_init(PREstimatorInput);
        objc_msgSend(v5, "mach_absolute_time_sec");
        -[PREstimatorInput setTimestamp:](v9, "setTimestamp:");
        [v11 timestamp];
        -[PREstimatorInput setPriorTimestamp:](v9, "setPriorTimestamp:");
        [v13 timestamp];
        -[PREstimatorInput setSubsequentTimestamp:](v9, "setSubsequentTimestamp:");
        [(PREstimatorInput *)v9 setRotation:v101];
        [(PREstimatorInput *)v9 setTranslation:*(double *)vmlaq_n_f32(v98, vsubq_f32(v95, v98), v102).i64];
        [(PREstimatorInput *)v9 setProximity:v5];
        goto LABEL_15;
      }
    }
    int v14 = self->_logger;
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    objc_msgSend(v5, "mach_absolute_time_sec");
    *(_DWORD *)buf = 134217984;
    uint64_t v106 = v31;
    double v20 = "ItemLocalizer skipping proximity measurement due to pose timestamp equality at time %f";
    float v21 = v14;
    uint32_t v22 = 12;
    goto LABEL_13;
  }
  id v10 = [(PRItemLocalizer *)self trajectory];
  float v11 = [v10 firstObject];

  uint64_t v12 = [(PRItemLocalizer *)self trajectory];
  double v13 = [v12 lastObject];

  id v9 = 0;
  if (!v11 || !v13) {
    goto LABEL_15;
  }
  int v14 = self->_logger;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "mach_absolute_time_sec");
    uint64_t v16 = v15;
    [v11 timestamp];
    uint64_t v18 = v17;
    [v13 timestamp];
    *(_DWORD *)buf = 134218496;
    uint64_t v106 = v16;
    __int16 v107 = 2048;
    uint64_t v108 = v18;
    __int16 v109 = 2048;
    uint64_t v110 = v19;
    double v20 = "ItemLocalizer failed to match sensor inputs at time %f (Measurement is earlier than the first cached pose). Ca"
          "ched pose time range: %f -> %f";
    float v21 = v14;
    uint32_t v22 = 32;
LABEL_13:
    _os_log_impl(&dword_230EC1000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
  }
LABEL_14:

  id v9 = 0;
LABEL_15:

LABEL_16:
  return v9;
}

- (BatchSolution)performLocationFiltering:(SEL)a3
{
  id v6 = a4;
  unint64_t v7 = [(PRItemLocalizer *)self estimatorQueue];
  dispatch_assert_queue_V2(v7);

  [(PRItemLocalizer *)self logEstimatorInput:v6];
  [v6 translation];
  float v59 = v8;
  [v6 translation];
  float v58 = v9;
  [v6 translation];
  float v57 = v10;
  [v6 rotation];
  float v54 = v11;
  [v6 rotation];
  float v53 = v12;
  [v6 rotation];
  float v51 = v13;
  [v6 rotation];
  float v49 = v14;
  uint64_t v15 = [v6 proximity];
  uint64_t v16 = objc_msgSend(v15, "antenna_type");
  if ((unint64_t)(v16 - 1) < 4) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }

  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0x3FB999999999999ALL;
  int v67 = 0;
  LOBYTE(v68) = 0;
  char v75 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  double v79 = 0.0;
  uint64_t v18 = [v6 proximity];
  double v60 = v59;
  double v19 = v54;
  double v20 = v53;
  if ((objc_msgSend(v18, "az_valid") & 1) == 0)
  {

    goto LABEL_9;
  }
  float v21 = [v6 proximity];
  int v22 = objc_msgSend(v21, "el_valid");

  if (!v22)
  {
LABEL_9:
    double v27 = [v6 proximity];
    objc_msgSend(v27, "mach_absolute_time_sec");
    uint64_t v29 = v28;
    double v30 = [v6 proximity];
    objc_msgSend(v30, "range_m");
    uint64_t v64 = v29;
    uint64_t v65 = v31;
    uint64_t v66 = 0x3FB999999999999ALL;
    int v67 = v17;
    LOBYTE(v68) = 0;
    char v75 = 0;
    *(double *)&long long v76 = v60;
    *((double *)&v76 + 1) = v58;
    *(double *)&long long v77 = v57;
    *((double *)&v77 + 1) = v54;
    *(double *)&long long v78 = v53;
    *((double *)&v78 + 1) = v51;
    double v79 = v49;
    goto LABEL_12;
  }
  float v23 = [v6 proximity];
  int v24 = objc_msgSend(v23, "multipath_probability_valid");

  if (v24)
  {
    double v25 = [v6 proximity];
    objc_msgSend(v25, "multipath_probability");
    uint64_t v56 = v26;

    uint64_t v55 = 1;
  }
  else
  {
    uint64_t v55 = 0;
    uint64_t v56 = 0;
  }
  double v27 = [v6 proximity];
  objc_msgSend(v27, "mach_absolute_time_sec");
  uint64_t v52 = v32;
  double v30 = [v6 proximity];
  objc_msgSend(v30, "range_m");
  uint64_t v50 = v33;
  double v34 = [v6 proximity];
  objc_msgSend(v34, "el_deg");
  uint64_t v36 = v35;
  double v37 = [v6 proximity];
  objc_msgSend(v37, "az_deg");
  uint64_t v39 = v38;
  double v40 = [v6 proximity];
  objc_msgSend(v40, "sweep_angle_deg");
  uint64_t v42 = v41;
  double v43 = [v6 proximity];
  objc_msgSend(v43, "track_score");
  uint64_t v64 = v52;
  uint64_t v65 = v50;
  uint64_t v66 = 0x3FB999999999999ALL;
  int v67 = v17;
  uint64_t v68 = v36;
  uint64_t v69 = v39;
  uint64_t v70 = 0x4024000000000000;
  uint64_t v71 = v42;
  uint64_t v72 = v44;
  uint64_t v73 = v56;
  uint64_t v74 = v55;
  char v75 = 1;
  *(double *)&long long v76 = v60;
  *((double *)&v76 + 1) = v58;
  *(double *)&long long v77 = v57;
  *((double *)&v77 + 1) = v19;
  *(double *)&long long v78 = v20;
  *((double *)&v78 + 1) = v51;
  double v79 = v49;

LABEL_12:
  if (*(unsigned char *)self->_rangeFilter.__ptr_.__value_)
  {
    double MachTimeSeconds = PRCommonGetMachTimeSeconds();
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::getCurrentState((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)self->_rangeFilter.__ptr_.__value_, (uint64_t)v61);
    double v46 = v62;
    char v47 = MachTimeSeconds - v63 <= 2.0;
  }
  else
  {
    char v47 = 0;
    double v46 = 0.0;
  }
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::setCurrentRangeFilterEstimate((uint64_t)self->_itemLocationFilter.__ptr_.__value_, v46, v47);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)self->_itemLocationFilter.__ptr_.__value_, (uint64_t)&v64, retstr);

  return result;
}

- (id)produceBlendedRangeEstimateForPose:(id)a3
{
  id v4 = a3;
  value = self->_rangeFilter.__ptr_.__value_;
  if (*(unsigned char *)value)
  {
    double CurrentState = RoseSyntheticApertureFiltering::PRRoseRangeFilter::getCurrentState((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)value, (uint64_t)v20);
    unint64_t v7 = self->_itemLocationFilter.__ptr_.__value_;
    objc_msgSend(v4, "timestamp", CurrentState);
    double v9 = v8;
    [v4 pose];
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::updateCurrentBatchSolution((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)v7, v9, v10, &v17);
    if (v17 == 5)
    {
      [v4 pose];
      [v4 timestamp];
      float v14 = [PRProximity alloc];
      [v4 timestamp];
      uint64_t v15 = -[PRProximity initWithTime:range:](v14, "initWithTime:range:");
    }
    else
    {
      float v12 = [PRProximity alloc];
      HIDWORD(v13) = HIDWORD(v21);
      *(float *)&double v13 = v21;
      uint64_t v15 = [(PRProximity *)v12 initWithTime:v22 range:v13];
    }
    float v11 = (void *)v15;
    if (__p)
    {
      double v19 = __p;
      operator delete(__p);
    }
  }
  else
  {
    float v11 = 0;
  }

  return v11;
}

- (void)logEstimatorInput:(id)a3
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 proximity];
  if (objc_msgSend(v5, "az_valid"))
  {
    id v6 = [v4 proximity];
    int v7 = objc_msgSend(v6, "el_valid");

    if (v7)
    {
      double v8 = self->_logger;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        [v4 rotation];
        float v73 = v9;
        [v4 rotation];
        float v69 = v10;
        [v4 rotation];
        float v68 = v11;
        [v4 rotation];
        float v66 = v12;
        [v4 translation];
        float v62 = v13;
        [v4 translation];
        float v61 = v14;
        [v4 translation];
        float v60 = v15;
        char v75 = objc_msgSend(v4, "proximity", v16);
        objc_msgSend(v75, "range_m");
        uint64_t v18 = v17;
        uint64_t v71 = [v4 proximity];
        objc_msgSend(v71, "range_unc_m");
        uint64_t v20 = v19;
        double v63 = [v4 proximity];
        objc_msgSend(v63, "az_deg");
        uint64_t v22 = v21;
        float v23 = [v4 proximity];
        objc_msgSend(v23, "az_unc_deg");
        uint64_t v25 = v24;
        uint64_t v26 = [v4 proximity];
        objc_msgSend(v26, "el_deg");
        uint64_t v28 = v27;
        uint64_t v29 = [v4 proximity];
        objc_msgSend(v29, "el_unc_deg");
        uint64_t v31 = v30;
        uint64_t v32 = [v4 proximity];
        int v33 = objc_msgSend(v32, "antenna_type");
        [v4 timestamp];
        uint64_t v35 = v34;
        uint64_t v36 = [v4 proximity];
        objc_msgSend(v36, "track_score");
        uint64_t v38 = v37;
        uint64_t v39 = [v4 proximity];
        objc_msgSend(v39, "sweep_angle_deg");
        *(_DWORD *)buf = 134222080;
        double v78 = v73;
        __int16 v79 = 2048;
        double v80 = v69;
        __int16 v81 = 2048;
        double v82 = v68;
        __int16 v83 = 2048;
        double v84 = v66;
        __int16 v85 = 2048;
        double v86 = v62;
        __int16 v87 = 2048;
        double v88 = v61;
        __int16 v89 = 2048;
        double v90 = v60;
        __int16 v91 = 2048;
        uint64_t v92 = v18;
        __int16 v93 = 2048;
        uint64_t v94 = v20;
        __int16 v95 = 2048;
        *(void *)simd_float4 v96 = v22;
        *(_WORD *)&v96[8] = 2048;
        *(void *)&v96[10] = v25;
        __int16 v97 = 2048;
        uint64_t v98 = v28;
        __int16 v99 = 2048;
        uint64_t v100 = v31;
        __int16 v101 = 1024;
        int v102 = v33;
        __int16 v103 = 2048;
        uint64_t v104 = v35;
        __int16 v105 = 2048;
        uint64_t v106 = v38;
        __int16 v107 = 2048;
        uint64_t v108 = v40;
        _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Estimator input: quat = (%f, %f, %f, %f), trans = (%f, %f, %f), range_m = %f, range_unc_m = %f, az_deg = %f, az_unc_deg = %f, el_deg = %f, el_unc_deg = %f, antenna = %d, time = %f, track_score = %f, sweep_angle_deg = %f", buf, 0xA8u);
      }
      goto LABEL_8;
    }
  }
  else
  {
  }
  double v8 = self->_logger;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    [v4 rotation];
    float v76 = v41;
    [v4 rotation];
    float v74 = v42;
    [v4 rotation];
    float v72 = v43;
    [v4 rotation];
    float v70 = v44;
    [v4 translation];
    float v67 = v45;
    [v4 translation];
    float v65 = v46;
    [v4 translation];
    float v64 = v47;
    simd_float4 v48 = [v4 proximity];
    objc_msgSend(v48, "range_m");
    uint64_t v50 = v49;
    float v51 = [v4 proximity];
    objc_msgSend(v51, "range_unc_m");
    uint64_t v53 = v52;
    float v54 = [v4 proximity];
    int v55 = objc_msgSend(v54, "antenna_type");
    [v4 timestamp];
    *(_DWORD *)buf = 134220544;
    double v78 = v76;
    __int16 v79 = 2048;
    double v80 = v74;
    __int16 v81 = 2048;
    double v82 = v72;
    __int16 v83 = 2048;
    double v84 = v70;
    __int16 v85 = 2048;
    double v86 = v67;
    __int16 v87 = 2048;
    double v88 = v65;
    __int16 v89 = 2048;
    double v90 = v64;
    __int16 v91 = 2048;
    uint64_t v92 = v50;
    __int16 v93 = 2048;
    uint64_t v94 = v53;
    __int16 v95 = 1024;
    *(_DWORD *)simd_float4 v96 = v55;
    *(_WORD *)&v96[4] = 2048;
    *(void *)&v96[6] = v56;
    _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Estimator input: quat = (%f, %f, %f, %f), trans = (%f, %f, %f), range_m = %f, range_unc_m = %f, antenna = %d, time = %f", buf, 0x6Cu);
  }
LABEL_8:

  float v57 = [(PRItemLocalizer *)self dataRecorder];
  BOOL v58 = v57 == 0;

  if (!v58)
  {
    float v59 = [(PRItemLocalizer *)self dataRecorder];
    [v59 recordEstimatorInput:v4];
  }
}

- (void)logAndPresentSolution:(BatchSolution *)a3 withTimeStamp:(double)a4
{
  id v17 = [MEMORY[0x263EFF980] array];
  begin = a3->BatchSolutionList.__begin_;
  for (i = a3->BatchSolutionList.__end_; begin != i; begin = (BatchSolutionParticle *)((char *)begin + 168))
  {
    double v9 = *((double *)begin + 1);
    double v10 = *((double *)begin + 2);
    *(float *)&double v12 = *(double *)begin;
    float v11 = v9;
    *((float *)&v12 + 1) = v11;
    int verticalState = a3->verticalState;
    if (verticalState == 2) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = verticalState == 1;
    }
    *(float *)&double v9 = *((double *)begin + 9);
    *(float *)&double v10 = *((double *)begin + 10);
    float v15 = +[PRTargetEstimate targetEstimateWithTime:a3->isVerticalResolved vector:v14 uncertainty:a4 weight:v12 isResolved:v9 verticalState:v10];
    [v17 addObject:v15];
  }
  [(PRItemLocalizer *)self logTargetEstimates:v17];
  uint64_t v16 = [v17 objectAtIndex:0];
  [(PRItemLocalizer *)self presentTargetEstimate:v16];
}

- (void)logTargetEstimates:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v9 = self->_logger;
        if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
        {
          [v8 vector];
          float v25 = v10;
          [v8 vector];
          float v24 = v11;
          [v8 vector];
          float v23 = v12;
          [v8 uncertainty];
          float v14 = v13;
          [v8 weight];
          float v16 = v15;
          [v8 timestamp];
          uint64_t v18 = v17;
          uint64_t v19 = [v8 verticalState];
          *(_DWORD *)buf = 134219520;
          double v31 = v25;
          __int16 v32 = 2048;
          double v33 = v24;
          __int16 v34 = 2048;
          double v35 = v23;
          __int16 v36 = 2048;
          double v37 = v14;
          __int16 v38 = 2048;
          double v39 = v16;
          __int16 v40 = 2048;
          uint64_t v41 = v18;
          __int16 v42 = 2048;
          uint64_t v43 = v19;
          _os_log_impl(&dword_230EC1000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Target: estimate = (%f, %f, %f), uncertainty = %f, weight = %f, time %f, verticalState %lu", buf, 0x48u);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v44 count:16];
    }
    while (v5);
  }

  uint64_t v20 = [(PRItemLocalizer *)self dataRecorder];
  BOOL v21 = v20 == 0;

  if (!v21)
  {
    uint64_t v22 = [(PRItemLocalizer *)self dataRecorder];
    [v22 recordTargetEstimates:v4];
  }
}

- (void)logRangeEstimate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 range];
    float v7 = v6;
    [v4 timestamp];
    int v12 = 134218240;
    double v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_230EC1000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "RangeEstimator output: range = %f, time %f", (uint8_t *)&v12, 0x16u);
  }

  double v9 = [(PRItemLocalizer *)self dataRecorder];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    float v11 = [(PRItemLocalizer *)self dataRecorder];
    [v11 recordRangeEstimate:v4];
  }
}

- (void)logTargetIsMovingChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "TargetMovingState = %d", (uint8_t *)v10, 8u);
  }
  uint64_t v6 = [(PRItemLocalizer *)self analytics];
  [(id)v6 targetMovingStateChanged:v3];

  float v7 = [(PRItemLocalizer *)self dataRecorder];
  LOBYTE(v6) = v7 == 0;

  if ((v6 & 1) == 0)
  {
    double MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
    double v9 = [(PRItemLocalizer *)self dataRecorder];
    [v9 recordTargetMovingStateChanged:v3 atTime:MachContinuousTimeSeconds];
  }
}

- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4
{
  id v6 = a4;
  float v7 = [(PRItemLocalizer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(PRItemLocalizer *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PRItemLocalizer_updateDelegateWithSelector_object___block_invoke;
    block[3] = &unk_264BC1BF8;
    id v10 = v7;
    SEL v12 = a3;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __53__PRItemLocalizer_updateDelegateWithSelector_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)devicePoseUpdated:(id)a3
{
  id v4 = a3;
  [(PRItemLocalizer *)self updateDelegateWithSelector:sel_willIntegrateDevicePose_ object:v4];
  uint64_t v5 = [(PRItemLocalizer *)self analytics];
  [v5 updateTravelDistanceWithPose:v4];

  id v6 = [(PRItemLocalizer *)self dataRecorder];
  [v6 recordPoseMeasurement:v4];

  LOBYTE(v6) = [(PRItemLocalizer *)self targetIsMoving];
  BOOL v7 = [(PRItemLocalizer *)self deviceIsMoving];
  objc_initWeak(&location, self);
  uint64_t v8 = [(PRItemLocalizer *)self estimatorQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PRItemLocalizer_devicePoseUpdated___block_invoke;
  block[3] = &unk_264BC1CB8;
  objc_copyWeak(&v13, &location);
  char v14 = (char)v6;
  BOOL v15 = v7;
  id v11 = v4;
  SEL v12 = self;
  id v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__PRItemLocalizer_devicePoseUpdated___block_invoke(uint64_t x0_0)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = (id *)(x0_0 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(x0_0 + 48));

  if (!WeakRetained) {
    return;
  }
  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 trajectory];
  [v5 addObject:*(void *)(x0_0 + 32)];

  id v6 = [v4 latestProximity];
  BOOL v7 = [v4 estimatorInputForProximity:v6];

  if (v7)
  {
    [v4 performFilteringWithEstimatorInput:v7 targetMoving:*(unsigned __int8 *)(x0_0 + 56) deviceMoving:*(unsigned __int8 *)(x0_0 + 57)];
    [*(id *)(x0_0 + 32) timestamp];
    objc_msgSend(*(id *)(x0_0 + 40), "setPreviousVIOPoseTime:");
    [v4 setLatestProximity:0];
  }
  else
  {
    [*(id *)(x0_0 + 32) timestamp];
    double v9 = v8;
    [*(id *)(x0_0 + 40) previousVIOPoseTime];
    if (v9 - v10 >= 0.5)
    {
      [*(id *)(x0_0 + 32) pose];
      *(double *)&long long v11 = simd_quaternion(v42);
      long long v24 = v11;
      [*(id *)(x0_0 + 32) pose];
      long long v23 = v12;
      id v13 = *(id *)(*(void *)(x0_0 + 40) + 24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(x0_0 + 32) timestamp];
        *(_DWORD *)buf = 134219776;
        *(double *)&uint8_t buf[4] = *(float *)&v24;
        *(_WORD *)&buf[12] = 2048;
        *(double *)double v31 = *((float *)&v24 + 1);
        *(_WORD *)&v31[8] = 2048;
        *(double *)&uint64_t v32 = *((float *)&v24 + 2);
        __int16 v33 = 2048;
        *(double *)__int16 v34 = *((float *)&v24 + 3);
        *(_WORD *)&v34[8] = 2048;
        *(double *)&v34[10] = *(float *)&v23;
        __int16 v35 = 2048;
        double v36 = *((float *)&v23 + 1);
        __int16 v37 = 2048;
        double v38 = *((float *)&v23 + 2);
        __int16 v39 = 2048;
        uint64_t v40 = v14;
        _os_log_impl(&dword_230EC1000, v13, OS_LOG_TYPE_DEFAULT, "VIO pose: quat = (%f, %f, %f, %f), trans = (%f, %f, %f), time = %f", buf, 0x52u);
      }

      [*(id *)(x0_0 + 32) timestamp];
      objc_msgSend(*(id *)(x0_0 + 40), "setPreviousVIOPoseTime:");
    }
  }
  BOOL v15 = objc_msgSend(v4, "produceBlendedRangeEstimateForPose:", *(void *)(x0_0 + 32), v23);
  if (v15)
  {
    [v4 logRangeEstimate:v15];
    [v4 presentRangeEstimate:v15];
  }
  uint64_t v16 = (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *)v4[1];
  [*(id *)(x0_0 + 32) timestamp];
  double v18 = v17;
  [*(id *)(x0_0 + 32) pose];
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::updateCurrentBatchSolution(v16, v18, v19, buf);
  if (*(_DWORD *)buf != 5)
  {
    uint64_t v22 = *(void **)(x0_0 + 40);
    if (v22)
    {
      [v22 lastSolution];
    }
    else
    {
      *(_OWORD *)__p = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
    }
    [v4 revokeTargetEstimateWithLastSolution:&v27];
    uint64_t v20 = __p[0];
    if (!__p[0]) {
      goto LABEL_20;
    }
    BOOL v21 = &v27;
    goto LABEL_19;
  }
  if (buf[12])
  {
    *(void *)float v25 = *(void *)buf;
    *(void *)&v25[5] = *(void *)&buf[5];
    memset(v26, 0, 24);
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(v26, *(const void **)&v31[2], v32, 0xCF3CF3CF3CF3CF3DLL * ((v32 - *(void *)&v31[2]) >> 3));
    v26[3] = *(void *)&v34[6];
    [*(id *)(x0_0 + 32) timestamp];
    objc_msgSend(v4, "logAndPresentSolution:withTimeStamp:", v25);
    uint64_t v20 = (void *)v26[0];
    if (v26[0])
    {
      BOOL v21 = (long long *)v25;
LABEL_19:
      *((void *)v21 + 3) = v20;
      operator delete(v20);
    }
  }
LABEL_20:
  [v4 updateDelegateWithSelector:sel_didUpdateDevicePose_ object:*(void *)(x0_0 + 32)];
  if (*(void *)&v31[2])
  {
    uint64_t v32 = *(uint64_t *)&v31[2];
    operator delete(*(void **)&v31[2]);
  }
}

- (void)setDegeneratePath:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(PRItemLocalizer *)self pathIsDegenerate] != a3)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Informing delegate that degenerate path state changed to %d", (uint8_t *)v7, 8u);
    }
    [(PRItemLocalizer *)self setPathIsDegenerate:v3];
    id v6 = [NSNumber numberWithBool:v3];
    [(PRItemLocalizer *)self updateDelegateWithSelector:sel_pathIsDegenerate_ object:v6];
  }
}

- (void)performFilteringWithEstimatorInput:(id)a3 targetMoving:(BOOL)a4 deviceMoving:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = v8;
  if (a4)
  {
    double v10 = [v8 proximity];
    id v11 = [(PRItemLocalizer *)self performRangeFilteringWithoutVIO:v10 targetMoving:1 deviceMoving:v5];

    goto LABEL_30;
  }
  [(PRItemLocalizer *)self performLocationFiltering:v8];
  if (LODWORD(v44[0]) == 3)
  {
    [(PRItemLocalizer *)self setDegeneratePath:1];
    [(PRItemLocalizer *)self lastSolution];
    [(PRItemLocalizer *)self revokeTargetEstimateWithLastSolution:v28];
    uint64_t v22 = v29;
    if (!v29) {
      goto LABEL_28;
    }
    uint64_t v30 = v29;
LABEL_27:
    operator delete(v22);
    goto LABEL_28;
  }
  if (LODWORD(v44[0]) == 6)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "RESET_FROM_HIGH_RESIDUALS detected: Resetting VIO & estimators.", buf, 2u);
    }
    [(PRItemLocalizer *)self lastSolution];
    double v18 = v32;
    float v19 = v33;
    if (v32)
    {
      __int16 v33 = v32;
      operator delete(v32);
    }
    if (v18 != v19)
    {
      uint64_t v20 = self->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v20, OS_LOG_TYPE_DEFAULT, "Revoke solution due to high residual reset", buf, 2u);
      }
    }
    [(PRItemLocalizer *)self setDegeneratePath:0];
    BOOL v21 = [(PRItemLocalizer *)self poseProvider];
    [v21 reset];

    [(PRItemLocalizer *)self reset];
    [(PRItemLocalizer *)self revokeTargetEstimate:5];
    goto LABEL_28;
  }
  if (LODWORD(v44[0]) != 5)
  {
    [(PRItemLocalizer *)self setDegeneratePath:0];
    [(PRItemLocalizer *)self lastSolution];
    [(PRItemLocalizer *)self revokeTargetEstimateWithLastSolution:&v25];
    uint64_t v22 = v26;
    if (!v26) {
      goto LABEL_28;
    }
    long long v27 = v26;
    goto LABEL_27;
  }
  v39[0] = v44[0];
  *(void *)((char *)v39 + 5) = *(void *)((char *)v44 + 5);
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(&v40, v45, (uint64_t)v46, 0xCF3CF3CF3CF3CF3DLL * ((v46 - (unsigned char *)v45) >> 3));
  uint64_t v43 = v47;
  long long v12 = [v9 proximity];
  objc_msgSend(v12, "mach_absolute_time_sec");
  -[PRItemLocalizer logAndPresentSolution:withTimeStamp:](self, "logAndPresentSolution:withTimeStamp:", v39);

  if (v40)
  {
    uint64_t v41 = v40;
    operator delete(v40);
  }
  [(PRItemLocalizer *)self setDegeneratePath:0];
  v34[0] = v44[0];
  *(void *)((char *)v34 + 5) = *(void *)((char *)v44 + 5);
  __p = 0;
  double v36 = 0;
  uint64_t v37 = 0;
  std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(&__p, v45, (uint64_t)v46, 0xCF3CF3CF3CF3CF3DLL * ((v46 - (unsigned char *)v45) >> 3));
  uint64_t v38 = v47;
  [(PRItemLocalizer *)self setLastSolution:v34];
  if (__p)
  {
    double v36 = __p;
    operator delete(__p);
  }
  [(PRItemLocalizer *)self lastSolution];
  int v13 = *((_DWORD *)v32 + 40);
  __int16 v33 = v32;
  operator delete(v32);
  if (v13)
  {
    if (v13 == 1 && ![(PRItemLocalizer *)self firstRangeArrow])
    {
      [(PRItemLocalizer *)self setFirstRangeArrow:1];
      uint64_t v14 = [(PRItemLocalizer *)self analytics];
      [v14 firstArrowFromRange];

      BOOL v15 = self->_logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "First arrow from SA";
LABEL_34:
        _os_log_impl(&dword_230EC1000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
      }
    }
  }
  else if (![(PRItemLocalizer *)self firstAoAArrow])
  {
    [(PRItemLocalizer *)self setFirstAoAArrow:1];
    long long v24 = [(PRItemLocalizer *)self analytics];
    [v24 firstArrowFromAoA];

    BOOL v15 = self->_logger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "First arrow from AoA";
      goto LABEL_34;
    }
  }
LABEL_28:
  id v23 = [(PRItemLocalizer *)self performRangeFilteringWithVIO:v9];
  if (v45)
  {
    float v46 = v45;
    operator delete(v45);
  }
LABEL_30:
}

- (void)reset
{
  objc_initWeak(&location, self);
  BOOL v3 = [(PRItemLocalizer *)self estimatorQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__PRItemLocalizer_reset__block_invoke;
  v4[3] = &unk_264BC1B80;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __24__PRItemLocalizer_reset__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    objc_loadWeakRetained(v1);
    operator new();
  }
}

- (void)invalidPoseDetected
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "invalidPoseDetected: Resetting location estimator", v8, 2u);
  }
  [(PRItemLocalizer *)self lastSolution];
  id v4 = v9;
  id v5 = v10;
  if (v9)
  {
    double v10 = v9;
    operator delete(v9);
  }
  if (v4 != v5)
  {
    id v6 = self->_logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Revoke solution due to VIO reset", v8, 2u);
    }
  }
  [(PRItemLocalizer *)self reset];
  [(PRItemLocalizer *)self revokeTargetEstimate:0];
  BOOL v7 = [(PRItemLocalizer *)self analytics];
  [v7 invalidPoseDetected];
}

- (void)didReceiveNewSolutions:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = [v4 count];
    _os_log_impl(&dword_230EC1000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Received %d solutions from Proximity", buf, 8u);
  }

  self->_lastSuccessfulCompanionCommunicationOrInitdouble MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
  uint64_t v6 = [v4 indexOfObjectPassingTest:&__block_literal_global_70];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = [v4 objectAtIndex:v6];
    if (objc_msgSend(v7, "az_valid") && objc_msgSend(v7, "el_valid"))
    {
      id v8 = self->_logger;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "range_m");
        uint64_t v10 = v9;
        objc_msgSend(v7, "az_deg");
        uint64_t v12 = v11;
        objc_msgSend(v7, "el_deg");
        uint64_t v14 = v13;
        objc_msgSend(v7, "mach_absolute_time_sec");
        uint64_t v16 = v15;
        objc_msgSend(v7, "track_score");
        uint64_t v18 = v17;
        int v19 = objc_msgSend(v7, "previous_solution_is_bad");
        objc_msgSend(v7, "sweep_angle_deg");
        *(_DWORD *)buf = 134219520;
        uint64_t v58 = v10;
        __int16 v59 = 2048;
        uint64_t v60 = v12;
        __int16 v61 = 2048;
        uint64_t v62 = v14;
        __int16 v63 = 2048;
        uint64_t v64 = v16;
        __int16 v65 = 2048;
        uint64_t v66 = v18;
        __int16 v67 = 1024;
        int v68 = v19;
        __int16 v69 = 2048;
        uint64_t v70 = v20;
        BOOL v21 = "Found raw measurement with range_m %f m, az_deg %f deg, el_deg %f deg for time %f, track score %f, prev_so"
              "lution_is_bad %d, sweep_angle_deg %f";
        uint64_t v22 = v8;
        uint32_t v23 = 68;
LABEL_10:
        _os_log_impl(&dword_230EC1000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else
    {
      id v8 = self->_logger;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "range_m");
        uint64_t v25 = v24;
        objc_msgSend(v7, "mach_absolute_time_sec");
        *(_DWORD *)buf = 134218240;
        uint64_t v58 = v25;
        __int16 v59 = 2048;
        uint64_t v60 = v26;
        BOOL v21 = "Found raw measurement with range_m %f m for time %f";
        uint64_t v22 = v8;
        uint32_t v23 = 22;
        goto LABEL_10;
      }
    }

    objc_msgSend(v7, "range_m");
    if (v27 <= -0.5)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
        -[PRItemLocalizer didReceiveNewSolutions:](logger);
      }
    }
    else
    {
      if (objc_msgSend(v7, "az_valid") && objc_msgSend(v7, "el_valid"))
      {
        long long v28 = [PRProximity alloc];
        objc_msgSend(v7, "mach_absolute_time_sec");
        double v30 = v29;
        objc_msgSend(v7, "range_m");
        double v32 = v31;
        objc_msgSend(v7, "az_deg");
        double v34 = v33;
        objc_msgSend(v7, "el_deg");
        *(float *)&double v35 = v32;
        *(float *)&double v36 = v34;
        *(float *)&double v38 = v37;
        uint64_t v39 = [(PRProximity *)v28 initWithTime:v30 range:v35 azimuth:v36 elevation:v38];
      }
      else
      {
        uint64_t v41 = [PRProximity alloc];
        objc_msgSend(v7, "mach_absolute_time_sec");
        double v43 = v42;
        objc_msgSend(v7, "range_m");
        *(float *)&double v45 = v44;
        uint64_t v39 = [(PRProximity *)v41 initWithTime:v43 range:v45];
      }
      float v46 = (void *)v39;
      [(PRItemLocalizer *)self updateDelegateWithSelector:sel_willIntegrateProximity_ object:v39];
      uint64_t v47 = [(PRItemLocalizer *)self analytics];
      [v47 updateWithRangeEstimate:v46];

      if (objc_msgSend(v7, "soi_rssi_valid"))
      {
        simd_float4 v48 = [(PRItemLocalizer *)self analytics];
        objc_msgSend(v7, "soi_rssi_dbm");
        objc_msgSend(v48, "updateSOIRSSI:");
      }
      uint64_t v49 = [(PRItemLocalizer *)self dataRecorder];
      [v49 recordProximityMeasurement:v7];

      LOBYTE(v49) = [(PRItemLocalizer *)self targetIsMoving];
      BOOL v50 = [(PRItemLocalizer *)self deviceIsMoving];
      objc_initWeak((id *)buf, self);
      float v51 = [(PRItemLocalizer *)self estimatorQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__PRItemLocalizer_didReceiveNewSolutions___block_invoke_73;
      block[3] = &unk_264BC1D00;
      objc_copyWeak(&v54, (id *)buf);
      id v53 = v7;
      char v55 = (char)v49;
      BOOL v56 = v50;
      dispatch_async(v51, block);

      objc_destroyWeak(&v54);
      objc_destroyWeak((id *)buf);
    }
  }
}

BOOL __42__PRItemLocalizer_didReceiveNewSolutions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 variant]) {
    BOOL v3 = [v2 variant] == 2;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

void __42__PRItemLocalizer_didReceiveNewSolutions___block_invoke_73(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "mach_absolute_time_sec");
    objc_msgSend(v4, "deleteTrajectoryWaypointsBeforeTime:");
    id v5 = [v4 latestProximity];

    if (v5)
    {
      uint64_t v6 = v4[3];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Unprocessed proximity measurement found. Using non-vio range filtering", v13, 2u);
      }
      BOOL v7 = [v4 latestProximity];
      id v8 = [v4 performRangeFilteringWithoutVIO:v7 targetMoving:*(unsigned __int8 *)(a1 + 48) deviceMoving:*(unsigned __int8 *)(a1 + 49)];

      [v4 logRangeEstimate:v8];
      [v4 presentRangeEstimate:v8];
      [v4 setLatestProximity:0];
    }
    uint64_t v9 = [v4 estimatorInputForProximity:*(void *)(a1 + 32)];
    if (v9)
    {
      [v4 performFilteringWithEstimatorInput:v9 targetMoving:*(unsigned __int8 *)(a1 + 48) deviceMoving:*(unsigned __int8 *)(a1 + 49)];
      uint64_t v10 = [v4 trajectory];
      uint64_t v11 = [v10 lastObject];
      uint64_t v12 = [v4 produceBlendedRangeEstimateForPose:v11];

      if (v12)
      {
        [v4 logRangeEstimate:v12];
        [v4 presentRangeEstimate:v12];
      }
    }
    else
    {
      [v4 setLatestProximity:*(void *)(a1 + 32)];
    }
  }
}

- (id)performRangeFilteringWithoutVIO:(id)a3 targetMoving:(BOOL)a4 deviceMoving:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = objc_msgSend(v8, "antenna_type") - 1;
  if (v9 < 4) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = 0;
  }
  objc_msgSend(v8, "mach_absolute_time_sec");
  double v12 = v11;
  objc_msgSend(v8, "range_m");
  v18[0] = v12;
  v18[1] = v13;
  v18[2] = 0.1;
  int v19 = v10;
  RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithoutVIO((uint64_t)self->_rangeFilter.__ptr_.__value_, v18, v6, v5, (uint64_t)&v17);
  uint64_t v14 = [PRProximity alloc];
  objc_msgSend(v8, "mach_absolute_time_sec");
  uint64_t v15 = -[PRProximity initWithTime:range:](v14, "initWithTime:range:");

  return v15;
}

- (id)performRangeFilteringWithVIO:(id)a3
{
  id v4 = a3;
  [v4 translation];
  float v31 = v5;
  [v4 translation];
  float v30 = v6;
  [v4 translation];
  float v29 = v7;
  [v4 rotation];
  float v28 = v8;
  [v4 rotation];
  float v27 = v9;
  [v4 rotation];
  float v26 = v10;
  [v4 rotation];
  double v13 = objc_msgSend(v4, "proximity", v11, v12);
  uint64_t v14 = objc_msgSend(v13, "antenna_type");
  if ((unint64_t)(v14 - 1) < 4) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }

  uint64_t v16 = [v4 proximity];
  objc_msgSend(v16, "mach_absolute_time_sec");
  uint64_t v18 = v17;
  int v19 = [v4 proximity];
  objc_msgSend(v19, "range_m");
  v33[0] = v18;
  v33[1] = v20;
  v33[2] = 0x3FB999999999999ALL;
  int v34 = v15;
  char v35 = 0;
  char v36 = 0;
  double v37 = v31;
  double v38 = v30;
  double v39 = v29;
  double v40 = v28;
  double v41 = v27;
  double v42 = v26;
  double v43 = v25;

  RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithVIO((uint64_t)self->_rangeFilter.__ptr_.__value_, (uint64_t)v33, (uint64_t)v32);
  BOOL v21 = [PRProximity alloc];
  uint64_t v22 = [v4 proximity];
  objc_msgSend(v22, "mach_absolute_time_sec");
  uint32_t v23 = -[PRProximity initWithTime:range:](v21, "initWithTime:range:");

  return v23;
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateUnknown", buf, 2u);
      }
      goto LABEL_4;
    case 1uLL:
      BOOL v21 = self->_logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v21, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateNotReady", buf, 2u);
      }
      uint64_t v6 = 1;
      break;
    case 2uLL:
      float v7 = self->_logger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v7, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateReady", buf, 2u);
      }
      if (!self->_rangingState) {
        self->_rangingState = 1;
      }
      float v8 = self->_logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int clientState = self->_clientState;
        *(_DWORD *)buf = 67109120;
        int v31 = clientState;
        _os_log_impl(&dword_230EC1000, v8, OS_LOG_TYPE_DEFAULT, "#companion-retry rangingServiceDidUpdateState PRRangingServiceStateReady _clientState=%i", buf, 8u);
      }
      if ((self->_clientState - 2) <= 2 && self->_rangingState == 1)
      {
        float v10 = self->_logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230EC1000, v10, OS_LOG_TYPE_DEFAULT, "#companion-retry Configuring due to client state", buf, 2u);
        }
        uint64_t v11 = [(PRItemLocalizer *)self session];
        uint64_t v12 = [(PRItemLocalizer *)self remoteDevice];
        double v13 = [(PRItemLocalizer *)self configurationParameters];
        [v11 configureForCompanionRanging:v12 options:v13];

        self->_rangingState = 2;
      }
      uint64_t v14 = self->_logger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v6 = 2;
        _os_log_impl(&dword_230EC1000, v14, OS_LOG_TYPE_DEFAULT, "#companion-retry sending PRItemLocalizerStateReady to client", buf, 2u);
      }
      else
      {
        uint64_t v6 = 2;
      }
      break;
    case 3uLL:
      uint64_t v22 = self->_logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v22, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateError", buf, 2u);
      }
      uint32_t v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      float v29 = @"Received RangingServiceStateError";
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      float v25 = [v23 errorWithDomain:*MEMORY[0x263F623D8] code:999 userInfo:v24];

      [(PRItemLocalizer *)self didFailWithError:v25];
      uint64_t v6 = 3;
      break;
    case 4uLL:
      int v15 = self->_logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRangingServiceStateOff", buf, 2u);
      }
      uint64_t v16 = self->_logger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = self->_clientState;
        *(_DWORD *)buf = 67109120;
        int v31 = v17;
        _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "#companion-retry rangingServiceDidUpdateState PRRangingServiceStateOff _clientState=%i", buf, 8u);
      }
      if ((self->_clientState - 1) <= 3)
      {
        uint64_t v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = *MEMORY[0x263F08320];
        float v27 = @"Received RangingServiceStateOff after at least attempting to config";
        int v19 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        uint64_t v20 = [v18 errorWithDomain:*MEMORY[0x263F623D8] code:999 userInfo:v19];

        [(PRItemLocalizer *)self didFailWithError:v20];
      }
      uint64_t v6 = 4;
      break;
    default:
LABEL_4:
      uint64_t v6 = 0;
      break;
  }
  -[PRItemLocalizer sendItemLocalizerChangedState:](self, "sendItemLocalizerChangedState:", v6, a4);
}

- (void)sendPRItemState:(unint64_t)a3
{
  float v5 = [(PRItemLocalizer *)self delegateQueue];
  if (v5)
  {
    uint64_t v6 = [(PRItemLocalizer *)self delegateQueue];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__PRItemLocalizer_sendPRItemState___block_invoke;
    v9[3] = &unk_264BC1BD0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    id v10 = WeakRetained;
    dispatch_async(v6, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __35__PRItemLocalizer_sendPRItemState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    float v5 = v4[3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry Remote item changed state: %lu", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) itemChangedState:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = 0;
  }
}

- (void)sendItemLocalizerChangedActivity:(unint64_t)a3
{
  float v5 = [(PRItemLocalizer *)self delegateQueue];
  if (v5)
  {
    uint64_t v6 = [(PRItemLocalizer *)self delegateQueue];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__PRItemLocalizer_sendItemLocalizerChangedActivity___block_invoke;
    v9[3] = &unk_264BC1BD0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    id v10 = WeakRetained;
    dispatch_async(v6, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __52__PRItemLocalizer_sendItemLocalizerChangedActivity___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    float v5 = v4[3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer changed activity: %lu", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) itemLocalizerChangedActivity:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = 0;
  }
}

- (void)sendItemLocalizerChangedState:(unint64_t)a3
{
  float v5 = [(PRItemLocalizer *)self delegateQueue];
  if (v5)
  {
    uint64_t v6 = [(PRItemLocalizer *)self delegateQueue];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__PRItemLocalizer_sendItemLocalizerChangedState___block_invoke;
    v9[3] = &unk_264BC1BD0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    id v10 = WeakRetained;
    dispatch_async(v6, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __49__PRItemLocalizer_sendItemLocalizerChangedState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    float v5 = v4[3];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer changed state: %lu", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) itemLocalizerChangedState:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = 0;
  }
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  uint64_t v13 = v3;
  uint64_t v14 = v4;
  switch(a3)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        uint64_t v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusUnknown";
        int v7 = (uint8_t *)&v12;
        goto LABEL_12;
      }
      break;
    case 1uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        uint64_t v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusDidStart";
        int v7 = (uint8_t *)&v11;
        goto LABEL_12;
      }
      break;
    case 2uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        uint64_t v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusStopped";
        int v7 = (uint8_t *)&v10;
        goto LABEL_12;
      }
      break;
    case 3uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        uint64_t v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusInvalidated";
        int v7 = (uint8_t *)&v9;
        goto LABEL_12;
      }
      break;
    case 4uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        uint64_t v6 = "#companion-retry ItemLocalizer received PRRangingRequestStatusFailedToStart";
        int v7 = (uint8_t *)&v8;
LABEL_12:
        _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
      break;
    default:
      return;
  }
}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(PRItemLocalizer *)self remoteDevice];
  __int16 v8 = [v7 UUID];
  __int16 v9 = [v6 UUID];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    switch(a4)
    {
      case 0:
        logger = self->_logger;
        if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        __int16 v12 = "#companion-retry ItemLocalizer received PRRemoteDeviceStateUnknown";
        goto LABEL_18;
      case 1:
        uint64_t v13 = self->_logger;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230EC1000, v13, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received PRRemoteDeviceStateReady", buf, 2u);
        }
        if (self->_rangingState == 2)
        {
          self->_rangingState = 3;
          self->_lastSuccessfulCompanionCommunicationOrInitdouble MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
          uint64_t v14 = [(PRItemLocalizer *)self analytics];
          [v14 configureComplete];
        }
        int v15 = self->_logger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int clientState = self->_clientState;
          *(_DWORD *)buf = 67109120;
          int v29 = clientState;
          _os_log_impl(&dword_230EC1000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry remoteDeviceDidChangeState _clientState=%i", buf, 8u);
        }
        int v17 = self->_clientState;
        if (v17 == 4)
        {
          int v19 = self->_logger;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230EC1000, v19, OS_LOG_TYPE_DEFAULT, "#companion-retry Restarting ranging on PRRemoteDeviceStateReady.", buf, 2u);
          }
          uint64_t v20 = [(PRItemLocalizer *)self session];
          BOOL v21 = [(PRItemLocalizer *)self remoteDevice];
          id v27 = 0;
          char v22 = [v20 startCompanionRanging:v21 options:0 error:&v27];
          id v23 = v27;

          if (v22)
          {
            self->_rangingState = 4;
            uint64_t v24 = self->_logger;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_230EC1000, v24, OS_LOG_TYPE_DEFAULT, "#companion-retry Sending PRItemStateReconnected", buf, 2u);
            }
            [(PRItemLocalizer *)self sendPRItemState:3];
          }
          else
          {
            float v25 = self->_logger;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_230EC1000, v25, OS_LOG_TYPE_DEFAULT, "Failed to restart ranging on PRRemoteDeviceStateReady.", buf, 2u);
            }
            uint64_t v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F623D8] code:301 userInfo:0];
            [(PRItemLocalizer *)self didFailWithError:v26];
          }
        }
        else if (v17 == 2)
        {
          self->_int clientState = 3;
          uint64_t v18 = self->_logger;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_230EC1000, v18, OS_LOG_TYPE_DEFAULT, "#companion-retry Setting _clientState to LOCALIZER_CLIENT_CONFIGURED remoteDeviceDidChangeState", buf, 2u);
          }
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            __int16 v12 = "#companion-retry Sending PRItemStateFindable";
LABEL_18:
            _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
          }
LABEL_19:
          [(PRItemLocalizer *)self sendPRItemState:a4];
        }
        break;
      case 2:
        [(PRItemLocalizer *)self remoteDeviceDidMove];
        break;
      case 3:
        [(PRItemLocalizer *)self sendPRItemState:6];
        break;
      default:
        break;
    }
  }
}

- (void)remoteDeviceDidMove
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Setting targetIsMoving = YES", (uint8_t *)buf, 2u);
  }
  [(PRItemLocalizer *)self setTargetIsMoving:1];
  [(PRItemLocalizer *)self sendPRItemState:4];
  [(PRItemLocalizer *)self lastSolution];
  uint64_t v4 = v11;
  float v5 = v12;
  if (v11)
  {
    __int16 v12 = v11;
    operator delete(v11);
  }
  if (v4 != v5)
  {
    id v6 = self->_logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Revoke solution due to target motion", (uint8_t *)buf, 2u);
    }
  }
  [(PRItemLocalizer *)self revokeTargetEstimate:1];
  [(PRItemLocalizer *)self reset];
  [(PRItemLocalizer *)self logTargetIsMovingChange:[(PRItemLocalizer *)self targetIsMoving]];
  int v7 = [(PRItemLocalizer *)self movementTimer];
  [v7 invalidate];

  objc_initWeak(buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke;
  block[3] = &unk_264BC1B80;
  objc_copyWeak(&v9, buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

void __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    uint64_t v4 = (void *)MEMORY[0x263EFFA20];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    _DWORD v7[2] = __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke_2;
    v7[3] = &unk_264BC1BA8;
    id v5 = v3;
    id v8 = v5;
    id v6 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:2.5];
    [v5 setMovementTimer:v6];
  }
}

void __38__PRItemLocalizer_remoteDeviceDidMove__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_230EC1000, v4, OS_LOG_TYPE_DEFAULT, "Setting targetIsMoving = NO", v5, 2u);
  }
  [*(id *)(a1 + 32) setTargetIsMoving:0];
  objc_msgSend(*(id *)(a1 + 32), "logTargetIsMovingChange:", objc_msgSend(*(id *)(a1 + 32), "targetIsMoving"));
  [*(id *)(a1 + 32) sendPRItemState:5];
}

- (void)didFailWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PRItemLocalizer *)self analytics];
  [v5 rangingFailedWithError:v4];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v23 = *(double *)&v4;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "#companion-retry received didFailWithError error:%@", buf, 0xCu);
  }
  if ([v4 code] == 300)
  {
    [(PRItemLocalizer *)self updateDelegateWithSelector:sel_didFailWithError_ object:v4];
  }
  else
  {
    int v7 = self->_logger;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 code];
      *(_DWORD *)buf = 134217984;
      double v23 = *(double *)&v8;
      _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "#companion-retry ItemLocalizer received error code %lld", buf, 0xCu);
    }

    if ([v4 code] == 302)
    {
      id v9 = self->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v9, OS_LOG_TYPE_DEFAULT, "#companion-retry sending PRItemStateReconnecting", buf, 2u);
      }
      [(PRItemLocalizer *)self sendPRItemState:2];
    }
    int v10 = [(PRItemLocalizer *)self session];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      uint64_t v18 = self->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EC1000, v18, OS_LOG_TYPE_DEFAULT, "#companion-retry not attempting to retry - current session is nil and a new one is scheduled", buf, 2u);
      }
    }
    else
    {
      __int16 v12 = [(PRItemLocalizer *)self session];
      [v12 invalidate];

      [(PRItemLocalizer *)self setSession:0];
      self->_rangingState = 0;
      objc_initWeak(&location, self);
      uint64_t v13 = NomininalRetryTimeMilliseconds;
      double v14 = PRCommonGetMachContinuousTimeSeconds()
          - self->_lastSuccessfulCompanionCommunicationOrInitMachContinuousTimeSeconds;
      if (v14 > *(double *)&RetryTimeStartBackoffSeconds)
      {
        uint64_t v13 = BackoffRetryTimeMilliseconds;
        int v15 = self->_logger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v23 = v14;
          _os_log_impl(&dword_230EC1000, v15, OS_LOG_TYPE_DEFAULT, "#companion-retry Attempting retry at the backoff rate.  It has been %lf seconds since last successful configure or init.  ", buf, 0xCu);
        }
      }
      dispatch_time_t v16 = dispatch_time(0, 1000000 * v13);
      int v17 = [(PRItemLocalizer *)self proximityQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__PRItemLocalizer_didFailWithError___block_invoke;
      block[3] = &unk_264BC1D28;
      void block[4] = self;
      objc_copyWeak(&v20, &location);
      dispatch_after(v16, v17, block);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

void __36__PRItemLocalizer_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_230EC1000, v2, OS_LOG_TYPE_DEFAULT, "#companion-retry PRCompanionRangingSession initWithDelegate", v8, 2u);
  }
  id v3 = objc_alloc(MEMORY[0x263F623C0]);
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 proximityQueue];
  id v6 = (void *)[v3 initWithDelegate:v4 queue:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSession:v6];
}

- (void)dealloc
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Destructing PRItemLocalizer and invalidating nearbyd XCP connection.", buf, 2u);
  }
  id v4 = [(PRItemLocalizer *)self session];
  [v4 invalidate];

  id v5 = [(PRItemLocalizer *)self movementTimer];
  [v5 invalidate];

  id v6 = [(PRItemLocalizer *)self analytics];
  [v6 deinit];

  v7.receiver = self;
  v7.super_class = (Class)PRItemLocalizer;
  [(PRItemLocalizer *)&v7 dealloc];
}

- (void)analyticsLogTorchButtonPresented
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "PRItemLocalizer logging external TorchButtonPresented event", v5, 2u);
  }
  id v4 = [(PRItemLocalizer *)self analytics];
  [v4 torchButtonPresented];
}

- (void)analyticsLogTorchChangedState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"off";
    if (v3) {
      id v6 = @"on";
    }
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "PRItemLocalizer logging external TorchChangedState event with state = %@", (uint8_t *)&v8, 0xCu);
  }
  objc_super v7 = [(PRItemLocalizer *)self analytics];
  [v7 torchChangedState:v3];
}

- (PRItemLocalizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRItemLocalizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRDevicePoseProvider)poseProvider
{
  return self->_poseProvider;
}

- (void)setPoseProvider:(id)a3
{
}

- (PRCompanionRangingSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (PRRemoteDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
}

- (NSDictionary)configurationParameters
{
  return self->_configurationParameters;
}

- (void)setConfigurationParameters:(id)a3
{
}

- (OS_dispatch_queue)proximityQueue
{
  return self->_proximityQueue;
}

- (void)setProximityQueue:(id)a3
{
}

- (BOOL)requiresLowerRangingFrequency
{
  return self->_requiresLowerRangingFrequency;
}

- (void)setRequiresLowerRangingFrequency:(BOOL)a3
{
  self->_requiresLowerRangingFrequency = a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)estimatorQueue
{
  return self->_estimatorQueue;
}

- (void)setEstimatorQueue:(id)a3
{
}

- (NSMutableArray)trajectory
{
  return self->_trajectory;
}

- (void)setTrajectory:(id)a3
{
}

- (PRRoseSolution)latestProximity
{
  return self->_latestProximity;
}

- (void)setLatestProximity:(id)a3
{
}

- (BatchSolution)lastSolution
{
  *(void *)&retstr->solutionStatus = *(void *)&self->_lastSolution.solutionStatus;
  *(void *)(&retstr->isVerticalResolved + 1) = *(void *)(&self->_lastSolution.isVerticalResolved + 1);
  retstr->BatchSolutionList.__end_ = 0;
  retstr->BatchSolutionList.__end_cap_.__value_ = 0;
  retstr->BatchSolutionList.__begin_ = 0;
  uint64_t result = (BatchSolution *)std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(&retstr->BatchSolutionList.__begin_, self->_lastSolution.BatchSolutionList.__begin_, (uint64_t)self->_lastSolution.BatchSolutionList.__end_, 0xCF3CF3CF3CF3CF3DLL* ((self->_lastSolution.BatchSolutionList.__end_- self->_lastSolution.BatchSolutionList.__begin_) >> 3));
  retstr->lastTestStatisticValue = self->_lastSolution.lastTestStatisticValue;
  return result;
}

- (void)setLastSolution:(BatchSolution *)a3
{
  uint64_t v5 = *(void *)(&a3->isVerticalResolved + 1);
  *(void *)&self->_lastSolution.solutionStatus = *(void *)&a3->solutionStatus;
  *(void *)(&self->_lastSolution.isVerticalResolved + 1) = v5;
  if (&self->_lastSolution != a3) {
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>((char *)&self->_lastSolution.BatchSolutionList, (char *)a3->BatchSolutionList.__begin_, (uint64_t)a3->BatchSolutionList.__end_, 0xCF3CF3CF3CF3CF3DLL * ((a3->BatchSolutionList.__end_ - a3->BatchSolutionList.__begin_) >> 3));
  }
  self->_lastSolution.lastTestStatisticValue = a3->lastTestStatisticValue;
}

- (BOOL)firstRangeArrow
{
  return self->_firstRangeArrow;
}

- (void)setFirstRangeArrow:(BOOL)a3
{
  self->_firstRangeArrow = a3;
}

- (BOOL)firstAoAArrow
{
  return self->_firstAoAArrow;
}

- (void)setFirstAoAArrow:(BOOL)a3
{
  self->_firstAoAArrow = a3;
}

- (double)previousVIOPoseTime
{
  return self->_previousVIOPoseTime;
}

- (void)setPreviousVIOPoseTime:(double)a3
{
  self->_previousVIOPoseTime = a3;
}

- (BOOL)targetIsMoving
{
  return self->_targetIsMoving;
}

- (void)setTargetIsMoving:(BOOL)a3
{
  self->_targetIsMoving = a3;
}

- (BOOL)deviceIsMoving
{
  return self->_deviceIsMoving;
}

- (void)setDeviceIsMoving:(BOOL)a3
{
  self->_deviceIsMoving = a3;
}

- (BOOL)pathIsDegenerate
{
  return self->_pathIsDegenerate;
}

- (void)setPathIsDegenerate:(BOOL)a3
{
  self->_pathIsDegenerate = a3;
}

- (NSTimer)movementTimer
{
  return self->_movementTimer;
}

- (void)setMovementTimer:(id)a3
{
}

- (CMMotionActivityManager)deviceActivityManager
{
  return self->_deviceActivityManager;
}

- (void)setDeviceActivityManager:(id)a3
{
}

- (NSOperationQueue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (PRFindMyCoreAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (PRItemLocalizerDataRecorder)dataRecorder
{
  return self->_dataRecorder;
}

- (void)setDataRecorder:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_lastSolution.BatchSolutionList.__begin_;
  if (begin)
  {
    self->_lastSolution.BatchSolutionList.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_dataRecorder, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_deviceActivityManager, 0);
  objc_storeStrong((id *)&self->_movementTimer, 0);
  objc_storeStrong((id *)&self->_latestProximity, 0);
  objc_storeStrong((id *)&self->_trajectory, 0);
  objc_storeStrong((id *)&self->_estimatorQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_proximityQueue, 0);
  objc_storeStrong((id *)&self->_configurationParameters, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_poseProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  value = self->_rangeFilter.__ptr_.__value_;
  self->_rangeFilter.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::operator()[abi:ne180100]((uint64_t)&self->_rangeFilter, (uint64_t)value);
  }
  std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter>::reset[abi:ne180100]((RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **)&self->_itemLocationFilter, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 50) = 0;
  *((unsigned char *)self + 204) = 0;
  *((_DWORD *)self + 52) = 0;
  *((unsigned char *)self + 212) = 0;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)didReceiveNewSolutions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230EC1000, log, OS_LOG_TYPE_ERROR, "Ignoring too negative range measurement", v1, 2u);
}

@end