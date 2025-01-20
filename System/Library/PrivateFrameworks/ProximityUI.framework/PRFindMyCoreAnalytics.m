@interface PRFindMyCoreAnalytics
+ (BOOL)isInternalBuild;
- (AKAppleIDSession)authSession;
- (BOOL)isRunning;
- (BOOL)receivedfirstSOIRSSI;
- (BOOL)shouldLogEnteredArmsReachEvent;
- (BOOL)shouldLogMotionEvent;
- (BOOL)shouldLogTargetFoundEvent;
- (CARunData)runData;
- (CASessionData)sessionData;
- (NSDictionary)customData;
- (NSNumber)isOwner;
- (NSNumber)numberOfPoses;
- (NSNumber)numberOfRanges;
- (NSNumber)rangeEstimate;
- (NSNumber)traveledDistance;
- (NSNumber)traveledDistanceOfUser;
- (NSString)authHeaderValue;
- (NSURLSession)urlSession;
- (NSUUID)productUUID;
- (NSUUID)runId;
- (NSUUID)sessionId;
- (PRFindMyCoreAnalytics)init;
- (PRPose)oldPreviousPoseOfUser;
- (PRPose)previousPose;
- (PRPose)previousPoseOfUser;
- (PRTargetEstimate)latestTarget;
- (double)startTime;
- (id)eventDictionaryWithEvent:(id)a3;
- (int64_t)eventNumber;
- (void)addLatestTarget:(id)a3;
- (void)configureComplete;
- (void)configureSessionWithProductUUID:(id)a3 withOwner:(id)a4;
- (void)deinit;
- (void)firstArrowFromAoA;
- (void)firstArrowFromRange;
- (void)invalidPoseDetected;
- (void)rangingFailedWithError:(id)a3;
- (void)resetState;
- (void)revokeRangeEstimate;
- (void)sendAnalyticsEvent:(id)a3;
- (void)sendLiveOnAnalytics:(id)a3;
- (void)setAuthHeaderValue:(id)a3;
- (void)setAuthSession:(id)a3;
- (void)setCustomData:(id)a3;
- (void)setEventNumber:(int64_t)a3;
- (void)setIsOwner:(id)a3;
- (void)setLatestTarget:(id)a3;
- (void)setNumberOfPoses:(id)a3;
- (void)setNumberOfRanges:(id)a3;
- (void)setOldPreviousPoseOfUser:(id)a3;
- (void)setPreviousPose:(id)a3;
- (void)setPreviousPoseOfUser:(id)a3;
- (void)setProductUUID:(id)a3;
- (void)setRangeEstimate:(id)a3;
- (void)setReceivedfirstSOIRSSI:(BOOL)a3;
- (void)setRunData:(id)a3;
- (void)setRunId:(id)a3;
- (void)setSessionData:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setShouldLogEnteredArmsReachEvent:(BOOL)a3;
- (void)setShouldLogMotionEvent:(BOOL)a3;
- (void)setShouldLogTargetFoundEvent:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTraveledDistance:(id)a3;
- (void)setTraveledDistanceOfUser:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)start;
- (void)stop;
- (void)targetComputed:(id)a3;
- (void)targetMovingStateChanged:(BOOL)a3;
- (void)targetRevokedWithReason:(unint64_t)a3;
- (void)torchButtonPresented;
- (void)torchChangedState:(BOOL)a3;
- (void)updateSOIRSSI:(double)a3;
- (void)updateTravelDistanceWithPose:(id)a3;
- (void)updateWithRangeEstimate:(id)a3;
@end

@implementation PRFindMyCoreAnalytics

- (PRFindMyCoreAnalytics)init
{
  v23.receiver = self;
  v23.super_class = (Class)PRFindMyCoreAnalytics;
  v2 = [(PRFindMyCoreAnalytics *)&v23 init];
  v3 = v2;
  if (v2)
  {
    [(PRFindMyCoreAnalytics *)v2 resetState];
    v22 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v4 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];

    v21 = (void *)v5;
    v6 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:v5];
    [(PRFindMyCoreAnalytics *)v3 setAuthSession:v6];

    v7 = [(PRFindMyCoreAnalytics *)v3 authSession];
    objc_msgSend(v22, "set_appleIDContext:", v7);

    v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v22];
    [(PRFindMyCoreAnalytics *)v3 setUrlSession:v8];

    id v9 = objc_alloc_init(MEMORY[0x263EFB210]);
    v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    v11 = objc_msgSend(v10, "aa_personID");
    v12 = [v10 credential];
    v13 = [v12 credentialItemForKey:*MEMORY[0x263EFB1D8]];
    v14 = [NSString stringWithFormat:@"%@:%@", v11, v13];
    v15 = [v14 dataUsingEncoding:4];
    v16 = [v15 base64EncodedStringWithOptions:0];

    v17 = [NSString stringWithFormat:@"Basic %@", v16];
    [(PRFindMyCoreAnalytics *)v3 setAuthHeaderValue:v17];

    os_log_t v18 = os_log_create("com.apple.proximity", "itemlocalizer_analytics");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v18;
  }
  return v3;
}

- (void)resetState
{
  v3 = (double *)MEMORY[0x263EF89A8];
  v4 = +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
  [(PRFindMyCoreAnalytics *)self setPreviousPose:v4];

  uint64_t v5 = +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  [(PRFindMyCoreAnalytics *)self setPreviousPoseOfUser:v5];

  v6 = +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  [(PRFindMyCoreAnalytics *)self setOldPreviousPoseOfUser:v6];

  [(PRFindMyCoreAnalytics *)self setShouldLogTargetFoundEvent:1];
  [(PRFindMyCoreAnalytics *)self setShouldLogMotionEvent:1];
  [(PRFindMyCoreAnalytics *)self setShouldLogEnteredArmsReachEvent:1];
  [(PRFindMyCoreAnalytics *)self setReceivedfirstSOIRSSI:0];
  v7 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  [(PRFindMyCoreAnalytics *)self setRangeEstimate:v7];

  v8 = [NSNumber numberWithInt:0];
  [(PRFindMyCoreAnalytics *)self setTraveledDistance:v8];

  id v9 = [NSNumber numberWithInt:0];
  [(PRFindMyCoreAnalytics *)self setTraveledDistanceOfUser:v9];

  v10 = [NSNumber numberWithInt:0];
  [(PRFindMyCoreAnalytics *)self setNumberOfPoses:v10];

  v11 = [NSNumber numberWithInt:0];
  [(PRFindMyCoreAnalytics *)self setNumberOfRanges:v11];

  [(PRFindMyCoreAnalytics *)self setLatestTarget:0];
}

- (id)eventDictionaryWithEvent:(id)a3
{
  v42[10] = *MEMORY[0x263EF8340];
  id v40 = a3;
  v4 = [(PRFindMyCoreAnalytics *)self sessionId];

  if (v4)
  {
    uint64_t v5 = NSNumber;
    double MachTimeSeconds = PRCommonGetMachTimeSeconds();
    [(PRFindMyCoreAnalytics *)self startTime];
    v38 = [v5 numberWithDouble:MachTimeSeconds - v7];
    v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRFindMyCoreAnalytics eventNumber](self, "eventNumber"));
    v8 = NSNumber;
    id v9 = [(PRFindMyCoreAnalytics *)self previousPose];
    [v9 pose];
    float32x4_t v11 = vmulq_f32(v10, v10);
    v11.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).u64[0];
    v11.f32[0] = sqrtf(v11.f32[0]);
    uint64_t v36 = [v8 numberWithFloat:*(double *)v11.i64];

    [(PRFindMyCoreAnalytics *)self setEventNumber:[(PRFindMyCoreAnalytics *)self eventNumber] + 1];
    v41[0] = @"sessionId";
    v12 = [(PRFindMyCoreAnalytics *)self sessionId];
    v13 = [v12 UUIDString];
    v42[0] = v13;
    v41[1] = @"eventNumber";
    v14 = [v39 stringValue];
    v42[1] = v14;
    v42[2] = v38;
    v41[2] = @"timeElapsed";
    v41[3] = @"traveledDistance";
    v15 = [(PRFindMyCoreAnalytics *)self traveledDistance];
    v42[3] = v15;
    v41[4] = @"traveledDistanceOfUser";
    v16 = [(PRFindMyCoreAnalytics *)self traveledDistanceOfUser];
    v42[4] = v16;
    v42[5] = v36;
    v41[5] = @"straightLineDistance";
    v41[6] = @"rangeEstimate";
    v17 = [(PRFindMyCoreAnalytics *)self rangeEstimate];
    v42[6] = v17;
    v41[7] = @"numberOfRanges";
    os_log_t v18 = [(PRFindMyCoreAnalytics *)self numberOfRanges];
    v42[7] = v18;
    v41[8] = @"numberOfPoses";
    uint64_t v19 = [(PRFindMyCoreAnalytics *)self numberOfPoses];
    v41[9] = @"eventType";
    v42[8] = v19;
    v42[9] = v40;
    v20 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:10];

    v21 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v20];
    v22 = [(PRFindMyCoreAnalytics *)self runId];
    LOBYTE(v19) = v22 == 0;

    if ((v19 & 1) == 0)
    {
      objc_super v23 = [(PRFindMyCoreAnalytics *)self runId];
      v24 = [v23 UUIDString];
      [v21 setObject:v24 forKeyedSubscript:@"runId"];
    }
    v25 = [(PRFindMyCoreAnalytics *)self customData];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      v27 = [(PRFindMyCoreAnalytics *)self customData];
      [v21 addEntriesFromDictionary:v27];
    }
    v28 = [(PRFindMyCoreAnalytics *)self productUUID];
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      v30 = [(PRFindMyCoreAnalytics *)self productUUID];
      v31 = [v30 UUIDString];
      [v21 setObject:v31 forKeyedSubscript:@"ProductUUID"];
    }
    v32 = [(PRFindMyCoreAnalytics *)self isOwner];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
      v34 = [(PRFindMyCoreAnalytics *)self isOwner];
      [v21 setObject:v34 forKeyedSubscript:@"IsOwner"];
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)sendAnalyticsEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Logging event %@", (uint8_t *)&v6, 0xCu);
    }
    [(PRFindMyCoreAnalytics *)self sendLiveOnAnalytics:v4];
  }
}

- (void)configureSessionWithProductUUID:(id)a3 withOwner:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08C38] UUID];
  [(PRFindMyCoreAnalytics *)self setSessionId:v7];

  [(PRFindMyCoreAnalytics *)self setEventNumber:0];
  [(PRFindMyCoreAnalytics *)self setStartTime:PRCommonGetMachTimeSeconds()];
  [(PRFindMyCoreAnalytics *)self setProductUUID:v13];
  [(PRFindMyCoreAnalytics *)self setIsOwner:v6];
  uint64_t v8 = objc_alloc_init(CASessionData);
  [(PRFindMyCoreAnalytics *)self setSessionData:v8];

  id v9 = [(PRFindMyCoreAnalytics *)self sessionData];
  [v9 setProductUUID:v13];

  float32x4_t v10 = [(PRFindMyCoreAnalytics *)self sessionData];
  [v10 setIsOwner:v6];

  float32x4_t v11 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"Configure"];
  v12 = [(PRFindMyCoreAnalytics *)self sessionData];
  [v12 configure:v11];

  [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v11];
}

- (void)configureComplete
{
  id v4 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"ConfigureComplete"];
  v3 = [(PRFindMyCoreAnalytics *)self sessionData];
  [v3 configureComplete:v4];

  [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v4];
}

- (BOOL)isRunning
{
  v2 = [(PRFindMyCoreAnalytics *)self runId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)start
{
  [(PRFindMyCoreAnalytics *)self resetState];
  id v6 = [MEMORY[0x263F08C38] UUID];
  -[PRFindMyCoreAnalytics setRunId:](self, "setRunId:");

  id v7 = objc_alloc_init(CARunData);
  -[PRFindMyCoreAnalytics setRunData:](self, "setRunData:");

  id v8 = [(PRFindMyCoreAnalytics *)self productUUID];
  BOOL v3 = [(PRFindMyCoreAnalytics *)self runData];
  [v3 setProductUUID:v8];

  id v9 = [(PRFindMyCoreAnalytics *)self isOwner];
  id v4 = [(PRFindMyCoreAnalytics *)self runData];
  [v4 setIsOwner:v9];

  id v10 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"Start"];
  uint64_t v5 = [(PRFindMyCoreAnalytics *)self runData];
  [v5 start:v10];

  [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v10];
}

- (void)addLatestTarget:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PRFindMyCoreAnalytics *)self latestTarget];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF9A0];
    id v7 = NSNumber;
    id v8 = [(PRFindMyCoreAnalytics *)self latestTarget];
    [v8 vector];
    id v9 = objc_msgSend(v7, "numberWithFloat:");
    v21[0] = v9;
    id v10 = NSNumber;
    float32x4_t v11 = [(PRFindMyCoreAnalytics *)self latestTarget];
    [v11 vector];
    LODWORD(v12) = HIDWORD(v12);
    id v13 = [v10 numberWithFloat:v12];
    v21[1] = v13;
    v14 = NSNumber;
    v15 = [(PRFindMyCoreAnalytics *)self latestTarget];
    [v15 vector];
    LODWORD(v17) = v16;
    os_log_t v18 = [v14 numberWithFloat:v17];
    v21[2] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    v20 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v19, @"target", 0);

    [v4 addEntriesFromDictionary:v20];
  }
}

- (void)stop
{
  if ([(PRFindMyCoreAnalytics *)self isRunning])
  {
    id v5 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"Stop"];
    -[PRFindMyCoreAnalytics addLatestTarget:](self, "addLatestTarget:");
    BOOL v3 = [(PRFindMyCoreAnalytics *)self runData];
    [v3 stop:v5];

    id v4 = [(PRFindMyCoreAnalytics *)self runData];
    [v4 logData];

    [(PRFindMyCoreAnalytics *)self setRunData:0];
    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v5];
    [(PRFindMyCoreAnalytics *)self setRunId:0];
    [(PRFindMyCoreAnalytics *)self setRunData:0];
  }
}

- (void)deinit
{
  [(PRFindMyCoreAnalytics *)self stop];
  id v5 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"Deinit"];
  BOOL v3 = [(PRFindMyCoreAnalytics *)self sessionData];
  [v3 deinit:v5];

  id v4 = [(PRFindMyCoreAnalytics *)self sessionData];
  [v4 logData];

  [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v5];
}

- (void)invalidPoseDetected
{
  BOOL v3 = (double *)MEMORY[0x263EF89A8];
  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setPreviousPose:](self, "setPreviousPose:");

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setPreviousPoseOfUser:](self, "setPreviousPoseOfUser:");

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setOldPreviousPoseOfUser:](self, "setOldPreviousPoseOfUser:");

  id v8 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"InvalidPose"];
  id v4 = [(PRFindMyCoreAnalytics *)self runData];
  [v4 invalidPose:v8];

  [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v8];
}

- (void)targetComputed:(id)a3
{
  id v6 = a3;
  -[PRFindMyCoreAnalytics setLatestTarget:](self, "setLatestTarget:");
  if ([(PRFindMyCoreAnalytics *)self shouldLogTargetFoundEvent])
  {
    id v4 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"TargetFound"];
    [(PRFindMyCoreAnalytics *)self addLatestTarget:v4];
    id v5 = [(PRFindMyCoreAnalytics *)self runData];
    [v5 targetFound:v4];

    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v4];
    [(PRFindMyCoreAnalytics *)self setShouldLogTargetFoundEvent:0];
  }
}

- (void)targetRevokedWithReason:(unint64_t)a3
{
  if (![(PRFindMyCoreAnalytics *)self shouldLogTargetFoundEvent])
  {
    id v7 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"TargetRevoked"];
    id v5 = [(PRFindMyCoreAnalytics *)self runData];
    [v5 targetRevoked:v7];

    switch(a3)
    {
      case 0uLL:
        id v6 = [(PRFindMyCoreAnalytics *)self runData];
        [v6 vioRevoke:v7];
        goto LABEL_9;
      case 1uLL:
        id v6 = [(PRFindMyCoreAnalytics *)self runData];
        [v6 targetMotionRevoke:v7];
        goto LABEL_9;
      case 2uLL:
        id v6 = [(PRFindMyCoreAnalytics *)self runData];
        [v6 rangeRevoke:v7];
        goto LABEL_9;
      case 3uLL:
        id v6 = [(PRFindMyCoreAnalytics *)self runData];
        [v6 aoaRevoke:v7];
        goto LABEL_9;
      case 4uLL:
        id v6 = [(PRFindMyCoreAnalytics *)self runData];
        [v6 straightPathRevoke:v7];
        goto LABEL_9;
      case 5uLL:
        id v6 = [(PRFindMyCoreAnalytics *)self runData];
        [v6 highResidualRevoke:v7];
LABEL_9:

        break;
      default:
        break;
    }
    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v7];
    [(PRFindMyCoreAnalytics *)self setShouldLogTargetFoundEvent:1];
  }
}

- (void)firstArrowFromRange
{
  id v4 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"TargetFoundFromRange"];
  BOOL v3 = [(PRFindMyCoreAnalytics *)self runData];
  [v3 targetFoundFromRange:v4];
}

- (void)firstArrowFromAoA
{
  id v4 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"TargetFoundFromAoA"];
  BOOL v3 = [(PRFindMyCoreAnalytics *)self runData];
  [v3 targetFoundFromAoA:v4];
}

- (void)torchButtonPresented
{
  id v2 = [(PRFindMyCoreAnalytics *)self runData];
  [v2 setTorchButtonPresented:1];
}

- (void)torchChangedState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PRFindMyCoreAnalytics *)self runData];
  id v5 = v4;
  if (v3) {
    [v4 setTorchTurnedOn:1];
  }
  else {
    [v4 setTorchTurnedOff:1];
  }
}

- (void)rangingFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v13 = v4;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
  id v7 = [v6 stringValue];
  id v8 = [v13 localizedDescription];
  id v9 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v7, @"status", v8, @"errorDescription", 0);

  id v10 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"RangingError"];
  float32x4_t v11 = v10;
  if (v10)
  {
    [v10 addEntriesFromDictionary:v9];
    if ([(PRFindMyCoreAnalytics *)self isRunning]) {
      [(PRFindMyCoreAnalytics *)self runData];
    }
    else {
    double v12 = [(PRFindMyCoreAnalytics *)self sessionData];
    }
    [v12 error:v11];

    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v11];
  }
}

- (void)updateTravelDistanceWithPose:(id)a3
{
  id v42 = a3;
  id v4 = [(PRFindMyCoreAnalytics *)self previousPose];
  [v4 pose];
  float32x4_t v40 = v5;

  id v6 = [(PRFindMyCoreAnalytics *)self previousPoseOfUser];
  [v6 pose];
  float32x4_t v39 = v7;

  id v8 = [(PRFindMyCoreAnalytics *)self oldPreviousPoseOfUser];
  [v8 pose];
  float32x4_t v38 = v9;

  [v42 pose];
  float32x4_t v41 = v10;
  float32x4_t v11 = NSNumber;
  double v12 = [(PRFindMyCoreAnalytics *)self traveledDistance];
  [v12 floatValue];
  float32x4_t v13 = vsubq_f32(v40, v41);
  float32x4_t v14 = vmulq_f32(v13, v13);
  *(float *)&double v16 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0])+ v15;
  double v17 = [v11 numberWithFloat:v16];
  [(PRFindMyCoreAnalytics *)self setTraveledDistance:v17];

  [(PRFindMyCoreAnalytics *)self setPreviousPose:v42];
  os_log_t v18 = NSNumber;
  uint64_t v19 = [(PRFindMyCoreAnalytics *)self numberOfPoses];
  v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "intValue") + 1);
  [(PRFindMyCoreAnalytics *)self setNumberOfPoses:v20];

  float32x4_t v21 = vsubq_f32(v39, v41);
  float32x4_t v22 = vmulq_f32(v21, v21);
  float v23 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]);
  float32x4_t v24 = vsubq_f32(v38, v41);
  float32x4_t v25 = vmulq_f32(v24, v24);
  *(void *)&double v26 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).u64[0];
  *(float *)&double v26 = sqrtf(*(float *)&v26);
  if (v23 > 0.5 && *(float *)&v26 > 0.5)
  {
    v28 = NSNumber;
    BOOL v29 = [(PRFindMyCoreAnalytics *)self traveledDistanceOfUser];
    [v29 floatValue];
    *(float *)&double v31 = v23 + v30;
    v32 = [v28 numberWithFloat:v31];
    [(PRFindMyCoreAnalytics *)self setTraveledDistanceOfUser:v32];

    BOOL v33 = [(PRFindMyCoreAnalytics *)self previousPoseOfUser];
    [(PRFindMyCoreAnalytics *)self setOldPreviousPoseOfUser:v33];

    [(PRFindMyCoreAnalytics *)self setPreviousPoseOfUser:v42];
  }
  v34 = [(PRFindMyCoreAnalytics *)self numberOfPoses];
  int v35 = [v34 intValue];

  if (v35 == 1)
  {
    uint64_t v36 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"FirstPose"];
    v37 = [(PRFindMyCoreAnalytics *)self runData];
    [v37 firstPose:v36];

    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v36];
  }
}

- (void)updateWithRangeEstimate:(id)a3
{
  id v4 = a3;
  float32x4_t v5 = NSNumber;
  id v16 = v4;
  [v4 range];
  id v6 = objc_msgSend(v5, "numberWithFloat:");
  [(PRFindMyCoreAnalytics *)self setRangeEstimate:v6];

  float32x4_t v7 = NSNumber;
  id v8 = [(PRFindMyCoreAnalytics *)self numberOfRanges];
  float32x4_t v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
  [(PRFindMyCoreAnalytics *)self setNumberOfRanges:v9];

  float32x4_t v10 = [(PRFindMyCoreAnalytics *)self numberOfRanges];
  LODWORD(v9) = [v10 intValue];

  if (v9 == 1)
  {
    float32x4_t v11 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"FirstRange"];
    double v12 = [(PRFindMyCoreAnalytics *)self runData];
    [v12 firstRange:v11];

    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v11];
  }
  [v16 range];
  if (v13 <= 0.9144 && [(PRFindMyCoreAnalytics *)self shouldLogEnteredArmsReachEvent])
  {
    float32x4_t v14 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"EnteredArmsReach"];
    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v14];
    float v15 = [(PRFindMyCoreAnalytics *)self runData];
    [v15 setArmsReachEvent:v14];

    [(PRFindMyCoreAnalytics *)self setShouldLogEnteredArmsReachEvent:0];
  }
}

- (void)updateSOIRSSI:(double)a3
{
  if (![(PRFindMyCoreAnalytics *)self receivedfirstSOIRSSI])
  {
    [(PRFindMyCoreAnalytics *)self setReceivedfirstSOIRSSI:1];
    id v5 = [(PRFindMyCoreAnalytics *)self runData];
    [v5 logFirstSOIRSSI:a3];
  }
}

- (void)revokeRangeEstimate
{
  id v3 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  -[PRFindMyCoreAnalytics setRangeEstimate:](self, "setRangeEstimate:");
}

- (void)targetMovingStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"status", 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  float32x4_t v7 = [(PRFindMyCoreAnalytics *)self eventDictionaryWithEvent:@"TargetMoving"];
  if (v3)
  {
    if (![(PRFindMyCoreAnalytics *)self shouldLogMotionEvent]) {
      goto LABEL_5;
    }
    [v7 addEntriesFromDictionary:v9];
    id v8 = [(PRFindMyCoreAnalytics *)self runData];
    [v8 motion:v7];

    [(PRFindMyCoreAnalytics *)self sendAnalyticsEvent:v7];
  }
  [(PRFindMyCoreAnalytics *)self setShouldLogMotionEvent:!v3];
LABEL_5:
}

+ (BOOL)isInternalBuild
{
  if (+[PRFindMyCoreAnalytics isInternalBuild]::onceToken != -1) {
    dispatch_once(&+[PRFindMyCoreAnalytics isInternalBuild]::onceToken, &__block_literal_global_3);
  }
  return +[PRFindMyCoreAnalytics isInternalBuild]::isInternalBuild;
}

uint64_t __40__PRFindMyCoreAnalytics_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[PRFindMyCoreAnalytics isInternalBuild]::isInternalBuild = result;
  return result;
}

- (void)sendLiveOnAnalytics:(id)a3
{
  id v4 = a3;
  char v5 = [(id)objc_opt_class() isInternalBuild];
  if (v4) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if (v6)
  {
    float32x4_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    [v7 setObject:@"com.apple.proximity.findmy.itemlocalizer.event" forKeyedSubscript:@"eventName"];
    [v7 addEntriesFromDictionary:v4];
    if ([MEMORY[0x263F08900] isValidJSONObject:v7])
    {
      id v8 = [NSURL URLWithString:@"https://gateway.icloud.com/acsnservice/metrics"];
      id v9 = [MEMORY[0x263F089E0] requestWithURL:v8];
      [v9 setHTTPMethod:@"POST"];
      id v20 = 0;
      float32x4_t v10 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:1 error:&v20];
      id v11 = v20;
      if (v11)
      {
        NSLog(&cfstr_LiveonAnalytic.isa);
      }
      else
      {
        [v9 setHTTPBody:v10];
        double v12 = [(PRFindMyCoreAnalytics *)self authHeaderValue];
        [v9 setValue:v12 forHTTPHeaderField:@"Authorization"];

        float v13 = [(PRFindMyCoreAnalytics *)self urlSession];
        uint64_t v15 = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        double v17 = __45__PRFindMyCoreAnalytics_sendLiveOnAnalytics___block_invoke;
        os_log_t v18 = &unk_264BC1B58;
        id v19 = v7;
        float32x4_t v14 = [v13 dataTaskWithRequest:v9 completionHandler:&v15];

        objc_msgSend(v14, "resume", v15, v16, v17, v18);
      }
    }
  }
}

void __45__PRFindMyCoreAnalytics_sendLiveOnAnalytics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = [v6 statusCode];
  char v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"eventType"];
  NSLog(&cfstr_UrlRequestResp.isa, v4, v5);
}

- (NSDictionary)customData
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCustomData:(id)a3
{
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSUUID)runId
{
  return self->_runId;
}

- (void)setRunId:(id)a3
{
}

- (int64_t)eventNumber
{
  return self->_eventNumber;
}

- (void)setEventNumber:(int64_t)a3
{
  self->_eventNumber = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
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

- (PRPose)previousPose
{
  return self->_previousPose;
}

- (void)setPreviousPose:(id)a3
{
}

- (PRPose)previousPoseOfUser
{
  return self->_previousPoseOfUser;
}

- (void)setPreviousPoseOfUser:(id)a3
{
}

- (PRPose)oldPreviousPoseOfUser
{
  return self->_oldPreviousPoseOfUser;
}

- (void)setOldPreviousPoseOfUser:(id)a3
{
}

- (PRTargetEstimate)latestTarget
{
  return self->_latestTarget;
}

- (void)setLatestTarget:(id)a3
{
}

- (NSNumber)rangeEstimate
{
  return self->_rangeEstimate;
}

- (void)setRangeEstimate:(id)a3
{
}

- (NSNumber)traveledDistance
{
  return self->_traveledDistance;
}

- (void)setTraveledDistance:(id)a3
{
}

- (NSNumber)traveledDistanceOfUser
{
  return self->_traveledDistanceOfUser;
}

- (void)setTraveledDistanceOfUser:(id)a3
{
}

- (NSNumber)numberOfPoses
{
  return self->_numberOfPoses;
}

- (void)setNumberOfPoses:(id)a3
{
}

- (NSNumber)numberOfRanges
{
  return self->_numberOfRanges;
}

- (void)setNumberOfRanges:(id)a3
{
}

- (BOOL)shouldLogTargetFoundEvent
{
  return self->_shouldLogTargetFoundEvent;
}

- (void)setShouldLogTargetFoundEvent:(BOOL)a3
{
  self->_shouldLogTargetFoundEvent = a3;
}

- (BOOL)shouldLogMotionEvent
{
  return self->_shouldLogMotionEvent;
}

- (void)setShouldLogMotionEvent:(BOOL)a3
{
  self->_shouldLogMotionEvent = a3;
}

- (BOOL)shouldLogEnteredArmsReachEvent
{
  return self->_shouldLogEnteredArmsReachEvent;
}

- (void)setShouldLogEnteredArmsReachEvent:(BOOL)a3
{
  self->_shouldLogEnteredArmsReachEvent = a3;
}

- (BOOL)receivedfirstSOIRSSI
{
  return self->_receivedfirstSOIRSSI;
}

- (void)setReceivedfirstSOIRSSI:(BOOL)a3
{
  self->_receivedfirstSOIRSSI = a3;
}

- (AKAppleIDSession)authSession
{
  return self->_authSession;
}

- (void)setAuthSession:(id)a3
{
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSString)authHeaderValue
{
  return self->_authHeaderValue;
}

- (void)setAuthHeaderValue:(id)a3
{
}

- (CASessionData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
}

- (CARunData)runData
{
  return self->_runData;
}

- (void)setRunData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runData, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_authHeaderValue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_numberOfRanges, 0);
  objc_storeStrong((id *)&self->_numberOfPoses, 0);
  objc_storeStrong((id *)&self->_traveledDistanceOfUser, 0);
  objc_storeStrong((id *)&self->_traveledDistance, 0);
  objc_storeStrong((id *)&self->_rangeEstimate, 0);
  objc_storeStrong((id *)&self->_latestTarget, 0);
  objc_storeStrong((id *)&self->_oldPreviousPoseOfUser, 0);
  objc_storeStrong((id *)&self->_previousPoseOfUser, 0);
  objc_storeStrong((id *)&self->_previousPose, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_runId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end