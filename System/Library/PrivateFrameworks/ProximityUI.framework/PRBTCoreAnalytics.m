@interface PRBTCoreAnalytics
+ (BOOL)isInternalBuild;
- (AKAppleIDSession)authSession;
- (BOOL)isRunning;
- (BOOL)shouldLogEnteredArmsReachEvent;
- (BOOL)shouldLogMotionEvent;
- (BOOL)shouldLogProximityLevelFoundEvent;
- (CABTRunData)runData;
- (CABTSessionData)sessionData;
- (NSDictionary)customData;
- (NSNumber)btRssiEstimate;
- (NSNumber)numberOfMeasurements;
- (NSNumber)numberOfPoses;
- (NSNumber)traveledDistance;
- (NSString)authHeaderValue;
- (NSURLSession)urlSession;
- (NSUUID)productUUID;
- (NSUUID)runId;
- (NSUUID)sessionId;
- (PRBTCoreAnalytics)init;
- (PRBTProximityMeasurement)latestProximityLevel;
- (double)startTime;
- (id)eventDictionaryWithEvent:(id)a3;
- (int64_t)eventNumber;
- (void)addLatestProximityLevel:(id)a3;
- (void)configureComplete:(int)a3;
- (void)configureSession:(BOOL)a3 withProductUUID:(id)a4;
- (void)deinit;
- (void)invalidPoseDetected;
- (void)rangingFailedWithError:(id)a3;
- (void)resetState;
- (void)revokeProximityLevel;
- (void)sendAnalyticsEvent:(id)a3;
- (void)sendLiveOnAnalytics:(id)a3;
- (void)setAuthHeaderValue:(id)a3;
- (void)setAuthSession:(id)a3;
- (void)setBtRssiEstimate:(id)a3;
- (void)setCustomData:(id)a3;
- (void)setEventNumber:(int64_t)a3;
- (void)setLatestProximityLevel:(id)a3;
- (void)setNumberOfMeasurements:(id)a3;
- (void)setNumberOfPoses:(id)a3;
- (void)setProductUUID:(id)a3;
- (void)setRunData:(id)a3;
- (void)setRunId:(id)a3;
- (void)setSessionData:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setShouldLogEnteredArmsReachEvent:(BOOL)a3;
- (void)setShouldLogMotionEvent:(BOOL)a3;
- (void)setShouldLogProximityLevelFoundEvent:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTraveledDistance:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)start;
- (void)stop;
- (void)targetMovingStateChanged:(BOOL)a3;
- (void)updateWithProximityLevel:(id)a3;
- (void)updateWithRssiMeasurement:(id)a3;
@end

@implementation PRBTCoreAnalytics

- (PRBTCoreAnalytics)init
{
  v23.receiver = self;
  v23.super_class = (Class)PRBTCoreAnalytics;
  v2 = [(PRBTCoreAnalytics *)&v23 init];
  v3 = v2;
  if (v2)
  {
    [(PRBTCoreAnalytics *)v2 resetState];
    v22 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v4 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];

    v21 = (void *)v5;
    v6 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:v5];
    [(PRBTCoreAnalytics *)v3 setAuthSession:v6];

    v7 = [(PRBTCoreAnalytics *)v3 authSession];
    objc_msgSend(v22, "set_appleIDContext:", v7);

    v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v22];
    [(PRBTCoreAnalytics *)v3 setUrlSession:v8];

    id v9 = objc_alloc_init(MEMORY[0x263EFB210]);
    v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    v11 = objc_msgSend(v10, "aa_personID");
    v12 = [v10 credential];
    v13 = [v12 credentialItemForKey:*MEMORY[0x263EFB1D8]];
    v14 = [NSString stringWithFormat:@"%@:%@", v11, v13];
    v15 = [v14 dataUsingEncoding:4];
    v16 = [v15 base64EncodedStringWithOptions:0];

    v17 = [NSString stringWithFormat:@"Basic %@", v16];
    [(PRBTCoreAnalytics *)v3 setAuthHeaderValue:v17];

    os_log_t v18 = os_log_create("com.apple.proximity", "btlocalizer_analytics");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v18;
  }
  return v3;
}

- (void)resetState
{
  [(PRBTCoreAnalytics *)self setShouldLogProximityLevelFoundEvent:1];
  [(PRBTCoreAnalytics *)self setShouldLogMotionEvent:1];
  [(PRBTCoreAnalytics *)self setShouldLogEnteredArmsReachEvent:1];
  v3 = [NSNumber numberWithDouble:-200.0];
  [(PRBTCoreAnalytics *)self setBtRssiEstimate:v3];

  v4 = [NSNumber numberWithInt:0];
  [(PRBTCoreAnalytics *)self setTraveledDistance:v4];

  uint64_t v5 = [NSNumber numberWithInt:0];
  [(PRBTCoreAnalytics *)self setNumberOfPoses:v5];

  v6 = [NSNumber numberWithInt:0];
  [(PRBTCoreAnalytics *)self setNumberOfMeasurements:v6];

  [(PRBTCoreAnalytics *)self setLatestProximityLevel:0];
}

- (id)eventDictionaryWithEvent:(id)a3
{
  v33[9] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PRBTCoreAnalytics *)self sessionId];

  if (v5)
  {
    v6 = NSNumber;
    double MachTimeSeconds = PRCommonGetMachTimeSeconds();
    [(PRBTCoreAnalytics *)self startTime];
    v31 = [v6 numberWithDouble:MachTimeSeconds - v8];
    v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[PRBTCoreAnalytics eventNumber](self, "eventNumber"));
    v29 = [NSNumber numberWithFloat:0.0];
    [(PRBTCoreAnalytics *)self setEventNumber:[(PRBTCoreAnalytics *)self eventNumber] + 1];
    v32[0] = @"sessionId";
    id v9 = [(PRBTCoreAnalytics *)self sessionId];
    v10 = [v9 UUIDString];
    v33[0] = v10;
    v32[1] = @"eventNumber";
    v11 = [v30 stringValue];
    v33[1] = v11;
    v33[2] = v31;
    v32[2] = @"timeElapsed";
    v32[3] = @"traveledDistance";
    v12 = [(PRBTCoreAnalytics *)self traveledDistance];
    v33[3] = v12;
    v33[4] = v29;
    v32[4] = @"straightLineDistance";
    v32[5] = @"btRssiEstimate";
    uint64_t v13 = [(PRBTCoreAnalytics *)self btRssiEstimate];
    v33[5] = v13;
    v32[6] = @"numberOfMeasurements";
    v14 = [(PRBTCoreAnalytics *)self numberOfMeasurements];
    v33[6] = v14;
    v32[7] = @"numberOfPoses";
    v15 = [(PRBTCoreAnalytics *)self numberOfPoses];
    v32[8] = @"eventType";
    v33[7] = v15;
    v33[8] = v4;
    v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:9];

    v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v16];
    os_log_t v18 = [(PRBTCoreAnalytics *)self runId];
    LOBYTE(v13) = v18 == 0;

    if ((v13 & 1) == 0)
    {
      v19 = [(PRBTCoreAnalytics *)self runId];
      v20 = [v19 UUIDString];
      [v17 setObject:v20 forKeyedSubscript:@"runId"];
    }
    v21 = [(PRBTCoreAnalytics *)self customData];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      objc_super v23 = [(PRBTCoreAnalytics *)self customData];
      [v17 addEntriesFromDictionary:v23];
    }
    v24 = [(PRBTCoreAnalytics *)self productUUID];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      v26 = [(PRBTCoreAnalytics *)self productUUID];
      v27 = [v26 UUIDString];
      [v17 setObject:v27 forKeyedSubscript:@"ProductUUID"];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
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
    [(PRBTCoreAnalytics *)self sendLiveOnAnalytics:v4];
  }
}

- (void)configureSession:(BOOL)a3 withProductUUID:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  int v6 = [MEMORY[0x263F08C38] UUID];
  [(PRBTCoreAnalytics *)self setSessionId:v6];

  [(PRBTCoreAnalytics *)self setEventNumber:0];
  [(PRBTCoreAnalytics *)self setStartTime:PRCommonGetMachTimeSeconds()];
  [(PRBTCoreAnalytics *)self setProductUUID:v11];
  id v7 = objc_alloc_init(CABTSessionData);
  [(PRBTCoreAnalytics *)self setSessionData:v7];

  uint64_t v8 = [(PRBTCoreAnalytics *)self sessionData];
  [v8 setProductUUID:v11];

  id v9 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"Configure"];
  v10 = [(PRBTCoreAnalytics *)self sessionData];
  [v10 configure:v9 withOwner:v4];

  [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v9];
}

- (void)configureComplete:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"ConfigureComplete"];
  uint64_t v5 = [(PRBTCoreAnalytics *)self sessionData];
  [v5 configureComplete:v6 withTxPower:v3];

  [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v6];
}

- (BOOL)isRunning
{
  v2 = [(PRBTCoreAnalytics *)self runId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)start
{
  [(PRBTCoreAnalytics *)self resetState];
  id v5 = [MEMORY[0x263F08C38] UUID];
  -[PRBTCoreAnalytics setRunId:](self, "setRunId:");

  id v6 = objc_alloc_init(CABTRunData);
  -[PRBTCoreAnalytics setRunData:](self, "setRunData:");

  id v7 = [(PRBTCoreAnalytics *)self productUUID];
  BOOL v3 = [(PRBTCoreAnalytics *)self runData];
  [v3 setProductUUID:v7];

  id v8 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"Start"];
  BOOL v4 = [(PRBTCoreAnalytics *)self runData];
  [v4 start:v8];

  [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v8];
}

- (void)addLatestProximityLevel:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PRBTCoreAnalytics *)self latestProximityLevel];

  if (v5)
  {
    v10 = @"proximityLevel";
    id v6 = NSNumber;
    id v7 = [(PRBTCoreAnalytics *)self latestProximityLevel];
    id v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "proximityLevel"));
    v11[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

    [v4 addEntriesFromDictionary:v9];
  }
}

- (void)stop
{
  if ([(PRBTCoreAnalytics *)self isRunning])
  {
    id v5 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"Stop"];
    -[PRBTCoreAnalytics addLatestProximityLevel:](self, "addLatestProximityLevel:");
    BOOL v3 = [(PRBTCoreAnalytics *)self runData];
    [v3 stop:v5];

    id v4 = [(PRBTCoreAnalytics *)self runData];
    [v4 logData];

    [(PRBTCoreAnalytics *)self setRunData:0];
    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v5];
    [(PRBTCoreAnalytics *)self setRunId:0];
    [(PRBTCoreAnalytics *)self setRunData:0];
  }
}

- (void)deinit
{
  [(PRBTCoreAnalytics *)self stop];
  id v5 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"Deinit"];
  BOOL v3 = [(PRBTCoreAnalytics *)self sessionData];
  [v3 deinit:v5];

  id v4 = [(PRBTCoreAnalytics *)self sessionData];
  [v4 logData];

  [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v5];
}

- (void)invalidPoseDetected
{
  id v4 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"InvalidPose"];
  BOOL v3 = [(PRBTCoreAnalytics *)self runData];
  [v3 invalidPose:v4];

  [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v4];
}

- (void)updateWithProximityLevel:(id)a3
{
  id v8 = a3;
  -[PRBTCoreAnalytics setLatestProximityLevel:](self, "setLatestProximityLevel:");
  if ([(PRBTCoreAnalytics *)self shouldLogProximityLevelFoundEvent])
  {
    id v4 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"ProximityLevelFound"];
    [(PRBTCoreAnalytics *)self addLatestProximityLevel:v4];
    id v5 = [(PRBTCoreAnalytics *)self runData];
    [v5 proximityLevelFound:v4];

    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v4];
    [(PRBTCoreAnalytics *)self setShouldLogProximityLevelFoundEvent:0];
  }
  if ([v8 proximityLevel] == 4
    && [(PRBTCoreAnalytics *)self shouldLogEnteredArmsReachEvent])
  {
    id v6 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"EnteredArmsReach"];
    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v6];
    id v7 = [(PRBTCoreAnalytics *)self runData];
    [v7 setArmsReachEvent:v6];

    [(PRBTCoreAnalytics *)self setShouldLogEnteredArmsReachEvent:0];
  }
}

- (void)revokeProximityLevel
{
  if (![(PRBTCoreAnalytics *)self shouldLogProximityLevelFoundEvent])
  {
    id v4 = [NSNumber numberWithDouble:-200.0];
    -[PRBTCoreAnalytics setBtRssiEstimate:](self, "setBtRssiEstimate:");

    id v5 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"ProximityLevelRevoked"];
    BOOL v3 = [(PRBTCoreAnalytics *)self runData];
    [v3 proximityLevelRevoked:v5];

    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v5];
    [(PRBTCoreAnalytics *)self setShouldLogProximityLevelFoundEvent:1];
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

  v10 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"RangingError"];
  id v11 = v10;
  if (v10)
  {
    [v10 addEntriesFromDictionary:v9];
    if ([(PRBTCoreAnalytics *)self isRunning]) {
      [(PRBTCoreAnalytics *)self runData];
    }
    else {
    v12 = [(PRBTCoreAnalytics *)self sessionData];
    }
    [v12 error:v11];

    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v11];
  }
}

- (void)updateWithRssiMeasurement:(id)a3
{
  id v11 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(int)objc_msgSend(v11, "rssi"));
  [(PRBTCoreAnalytics *)self setBtRssiEstimate:v4];

  id v5 = NSNumber;
  id v6 = [(PRBTCoreAnalytics *)self numberOfMeasurements];
  id v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(PRBTCoreAnalytics *)self setNumberOfMeasurements:v7];

  id v8 = [(PRBTCoreAnalytics *)self numberOfMeasurements];
  LODWORD(v7) = [v8 intValue];

  if (v7 == 1)
  {
    id v9 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"FirstRssiMeasurement"];
    v10 = [(PRBTCoreAnalytics *)self runData];
    [v10 firstRssiMeasurement:v9];

    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v9];
  }
}

- (void)targetMovingStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"status", 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(PRBTCoreAnalytics *)self eventDictionaryWithEvent:@"TargetMoving"];
  if (v3)
  {
    if (![(PRBTCoreAnalytics *)self shouldLogMotionEvent]) {
      goto LABEL_5;
    }
    [v7 addEntriesFromDictionary:v9];
    id v8 = [(PRBTCoreAnalytics *)self runData];
    [v8 motion:v7];

    [(PRBTCoreAnalytics *)self sendAnalyticsEvent:v7];
  }
  [(PRBTCoreAnalytics *)self setShouldLogMotionEvent:!v3];
LABEL_5:
}

+ (BOOL)isInternalBuild
{
  if (+[PRBTCoreAnalytics isInternalBuild]::onceToken != -1) {
    dispatch_once(&+[PRBTCoreAnalytics isInternalBuild]::onceToken, &__block_literal_global);
  }
  return +[PRBTCoreAnalytics isInternalBuild]::isInternalBuild;
}

uint64_t __36__PRBTCoreAnalytics_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[PRBTCoreAnalytics isInternalBuild]::isInternalBuild = result;
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
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    [v7 setObject:@"com.apple.proximity.findmy.btlocalizer.event" forKeyedSubscript:@"eventName"];
    [v7 addEntriesFromDictionary:v4];
    if ([MEMORY[0x263F08900] isValidJSONObject:v7])
    {
      id v8 = [NSURL URLWithString:@"https://gateway.icloud.com/acsnservice/metrics"];
      id v9 = [MEMORY[0x263F089E0] requestWithURL:v8];
      [v9 setHTTPMethod:@"POST"];
      id v20 = 0;
      v10 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:1 error:&v20];
      id v11 = v20;
      if (v11)
      {
        NSLog(&cfstr_LiveonAnalytic.isa);
      }
      else
      {
        [v9 setHTTPBody:v10];
        v12 = [(PRBTCoreAnalytics *)self authHeaderValue];
        [v9 setValue:v12 forHTTPHeaderField:@"Authorization"];

        id v13 = [(PRBTCoreAnalytics *)self urlSession];
        uint64_t v15 = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        v17 = __41__PRBTCoreAnalytics_sendLiveOnAnalytics___block_invoke;
        os_log_t v18 = &unk_264BC1B58;
        id v19 = v7;
        v14 = [v13 dataTaskWithRequest:v9 completionHandler:&v15];

        objc_msgSend(v14, "resume", v15, v16, v17, v18);
      }
    }
  }
}

void __41__PRBTCoreAnalytics_sendLiveOnAnalytics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (PRBTProximityMeasurement)latestProximityLevel
{
  return self->_latestProximityLevel;
}

- (void)setLatestProximityLevel:(id)a3
{
}

- (NSNumber)btRssiEstimate
{
  return self->_btRssiEstimate;
}

- (void)setBtRssiEstimate:(id)a3
{
}

- (NSNumber)traveledDistance
{
  return self->_traveledDistance;
}

- (void)setTraveledDistance:(id)a3
{
}

- (NSNumber)numberOfPoses
{
  return self->_numberOfPoses;
}

- (void)setNumberOfPoses:(id)a3
{
}

- (NSNumber)numberOfMeasurements
{
  return self->_numberOfMeasurements;
}

- (void)setNumberOfMeasurements:(id)a3
{
}

- (BOOL)shouldLogProximityLevelFoundEvent
{
  return self->_shouldLogProximityLevelFoundEvent;
}

- (void)setShouldLogProximityLevelFoundEvent:(BOOL)a3
{
  self->_shouldLogProximityLevelFoundEvent = a3;
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

- (CABTSessionData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
}

- (CABTRunData)runData
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
  objc_storeStrong((id *)&self->_numberOfMeasurements, 0);
  objc_storeStrong((id *)&self->_numberOfPoses, 0);
  objc_storeStrong((id *)&self->_traveledDistance, 0);
  objc_storeStrong((id *)&self->_btRssiEstimate, 0);
  objc_storeStrong((id *)&self->_latestProximityLevel, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_runId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end