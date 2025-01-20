@interface CABTRunData
- (CABTRunData)init;
- (NSDictionary)armsReachEvent;
- (NSDictionary)firstPoseEvent;
- (NSDictionary)firstProximityLevelFoundEvent;
- (NSDictionary)firstRssiEvent;
- (NSDictionary)startEvent;
- (NSDictionary)stopEvent;
- (NSNumber)numberOfErrorEvents;
- (NSNumber)numberOfInvalidPoseEvents;
- (NSNumber)numberOfMotionEvents;
- (NSNumber)numberOfProximityLevelFoundEvents;
- (NSNumber)numberOfProximityLevelRevokedEvents;
- (NSUUID)productUUID;
- (void)error:(id)a3;
- (void)firstPose:(id)a3;
- (void)firstRssiMeasurement:(id)a3;
- (void)invalidPose:(id)a3;
- (void)logData;
- (void)motion:(id)a3;
- (void)proximityLevelFound:(id)a3;
- (void)proximityLevelRevoked:(id)a3;
- (void)setArmsReachEvent:(id)a3;
- (void)setFirstPoseEvent:(id)a3;
- (void)setFirstProximityLevelFoundEvent:(id)a3;
- (void)setFirstRssiEvent:(id)a3;
- (void)setNumberOfErrorEvents:(id)a3;
- (void)setNumberOfInvalidPoseEvents:(id)a3;
- (void)setNumberOfMotionEvents:(id)a3;
- (void)setNumberOfProximityLevelFoundEvents:(id)a3;
- (void)setNumberOfProximityLevelRevokedEvents:(id)a3;
- (void)setProductUUID:(id)a3;
- (void)setStartEvent:(id)a3;
- (void)setStopEvent:(id)a3;
@end

@implementation CABTRunData

- (CABTRunData)init
{
  v11.receiver = self;
  v11.super_class = (Class)CABTRunData;
  v2 = [(CABTRunData *)&v11 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CABTRunData *)v2 setNumberOfMotionEvents:v3];

    v4 = [NSNumber numberWithInt:0];
    [(CABTRunData *)v2 setNumberOfProximityLevelFoundEvents:v4];

    v5 = [NSNumber numberWithInt:0];
    [(CABTRunData *)v2 setNumberOfProximityLevelRevokedEvents:v5];

    v6 = [NSNumber numberWithInt:0];
    [(CABTRunData *)v2 setNumberOfInvalidPoseEvents:v6];

    v7 = [NSNumber numberWithInt:0];
    [(CABTRunData *)v2 setNumberOfErrorEvents:v7];

    os_log_t v8 = os_log_create("com.apple.proximity", "btlocalizer_CABTRunData");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v8;
  }
  return v2;
}

- (void)motion:(id)a3
{
  v4 = NSNumber;
  id v6 = [(CABTRunData *)self numberOfMotionEvents];
  v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CABTRunData *)self setNumberOfMotionEvents:v5];
}

- (void)proximityLevelFound:(id)a3
{
  id v8 = a3;
  v4 = [(CABTRunData *)self firstProximityLevelFoundEvent];

  if (!v4) {
    [(CABTRunData *)self setFirstProximityLevelFoundEvent:v8];
  }
  v5 = NSNumber;
  id v6 = [(CABTRunData *)self numberOfProximityLevelFoundEvents];
  v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CABTRunData *)self setNumberOfProximityLevelFoundEvents:v7];
}

- (void)proximityLevelRevoked:(id)a3
{
  v4 = NSNumber;
  id v6 = [(CABTRunData *)self numberOfProximityLevelRevokedEvents];
  v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CABTRunData *)self setNumberOfProximityLevelRevokedEvents:v5];
}

- (void)firstPose:(id)a3
{
  id v5 = a3;
  v4 = [(CABTRunData *)self firstPoseEvent];

  if (!v4) {
    [(CABTRunData *)self setFirstPoseEvent:v5];
  }
}

- (void)firstRssiMeasurement:(id)a3
{
  id v5 = a3;
  v4 = [(CABTRunData *)self firstRssiEvent];

  if (!v4) {
    [(CABTRunData *)self setFirstRssiEvent:v5];
  }
}

- (void)invalidPose:(id)a3
{
  v4 = NSNumber;
  id v6 = [(CABTRunData *)self numberOfInvalidPoseEvents];
  id v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CABTRunData *)self setNumberOfInvalidPoseEvents:v5];
}

- (void)error:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSNumber;
  id v6 = [(CABTRunData *)self numberOfErrorEvents];
  v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CABTRunData *)self setNumberOfErrorEvents:v7];

  v16[0] = @"status";
  id v8 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v16[1] = @"errorDescription";
  v17[0] = v8;
  uint64_t v9 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v17[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  objc_super v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
  v12 = [(CABTRunData *)self productUUID];
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    v13 = [(CABTRunData *)self productUUID];
    v14 = [v13 UUIDString];
    [v11 setObject:v14 forKeyedSubscript:@"ProductUUID"];
  }
  id v15 = v11;
  AnalyticsSendEventLazy();
}

id __21__CABTRunData_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logData
{
  v81[15] = *MEMORY[0x263EF8340];
  v3 = [(CABTRunData *)self startEvent];
  if (v3)
  {
    id v4 = [(CABTRunData *)self stopEvent];

    if (v4)
    {
      id v5 = [(CABTRunData *)self startEvent];
      id v6 = [v5 objectForKeyedSubscript:@"timeElapsed"];
      [v6 doubleValue];
      double v8 = v7;

      uint64_t v9 = [(CABTRunData *)self stopEvent];
      v10 = [v9 objectForKeyedSubscript:@"timeElapsed"];
      [v10 doubleValue];
      double v76 = v11;

      v12 = [(CABTRunData *)self firstRssiEvent];

      if (v12)
      {
        v13 = [(CABTRunData *)self firstRssiEvent];
        v14 = [v13 objectForKeyedSubscript:@"btRssiEstimate"];
        [v14 doubleValue];
        double v75 = v15;

        v16 = [(CABTRunData *)self firstRssiEvent];
        v17 = [v16 objectForKeyedSubscript:@"timeElapsed"];
        [v17 doubleValue];
        double v19 = v18 - v8;
      }
      else
      {
        double v19 = -1.0;
        double v75 = -200.0;
      }
      v20 = [(CABTRunData *)self firstPoseEvent];

      if (v20)
      {
        v21 = [(CABTRunData *)self firstPoseEvent];
        v22 = [v21 objectForKeyedSubscript:@"timeElapsed"];
        [v22 doubleValue];
        double v24 = v23 - v8;
      }
      else
      {
        double v24 = -1.0;
      }
      v25 = [(CABTRunData *)self armsReachEvent];

      if (v25)
      {
        v26 = [(CABTRunData *)self armsReachEvent];
        v27 = [v26 objectForKeyedSubscript:@"timeElapsed"];
        [v27 doubleValue];
        double v29 = v28;

        v30 = [(CABTRunData *)self armsReachEvent];
        v31 = [v30 objectForKeyedSubscript:@"traveledDistance"];
        [v31 doubleValue];
        double v33 = v32;
        v34 = [(CABTRunData *)self startEvent];
        v35 = [v34 objectForKeyedSubscript:@"traveledDistance"];
        [v35 doubleValue];
        double v37 = v36;

        v38 = [(CABTRunData *)self armsReachEvent];
        v39 = [v38 objectForKeyedSubscript:@"straightLineDistance"];
        [v39 doubleValue];
        double v41 = v40;
        double v42 = v29 - v8;
        double v43 = v33 - v37;
      }
      else
      {
        double v42 = -1.0;
        double v43 = -1.0;
        double v41 = -1.0;
      }
      v44 = [(CABTRunData *)self stopEvent];
      v45 = [v44 objectForKeyedSubscript:@"traveledDistance"];
      [v45 doubleValue];
      double v47 = v46;
      v48 = [(CABTRunData *)self startEvent];
      v49 = [v48 objectForKeyedSubscript:@"traveledDistance"];
      [v49 doubleValue];
      double v51 = v50;

      v52 = (void *)MEMORY[0x263EFF9A0];
      v80[0] = @"NumberOfMotionEvents";
      v78 = [(CABTRunData *)self numberOfMotionEvents];
      v81[0] = v78;
      v80[1] = @"NumberOfLevelFoundEvents";
      v73 = [(CABTRunData *)self numberOfProximityLevelFoundEvents];
      v81[1] = v73;
      v80[2] = @"NumberOfRevokes";
      v72 = [(CABTRunData *)self numberOfProximityLevelRevokedEvents];
      v81[2] = v72;
      v80[3] = @"NumberOfInvalidPoseEvents";
      v71 = [(CABTRunData *)self numberOfInvalidPoseEvents];
      v81[3] = v71;
      v80[4] = @"NumberOfErrorEvents";
      v70 = [(CABTRunData *)self numberOfErrorEvents];
      v81[4] = v70;
      v80[5] = @"TimeToFirstMeasurement";
      v69 = [NSNumber numberWithDouble:v19];
      v81[5] = v69;
      v80[6] = @"TimeToFirstPose";
      v74 = [NSNumber numberWithDouble:v24];
      v81[6] = v74;
      v80[7] = @"TimeToArmsReach";
      uint64_t v53 = [NSNumber numberWithDouble:v42];
      double v54 = v76 - v8;
      v77 = (void *)v53;
      v81[7] = v53;
      v80[8] = @"RunDuration";
      v68 = [NSNumber numberWithDouble:v54];
      v81[8] = v68;
      v80[9] = @"FirstRSSI";
      v55 = [NSNumber numberWithDouble:v75];
      v81[9] = v55;
      v80[10] = @"FinalRSSI";
      v56 = [(CABTRunData *)self stopEvent];
      v57 = [v56 objectForKeyedSubscript:@"btRssiEstimate"];
      v81[10] = v57;
      v80[11] = @"EnteredArmsReach";
      v58 = [NSNumber numberWithBool:v25 != 0];
      v81[11] = v58;
      v80[12] = @"TotalDistanceMoved";
      v59 = [NSNumber numberWithDouble:v47 - v51];
      v60 = v52;
      v81[12] = v59;
      v80[13] = @"DistanceMovedToArmsReach";
      v61 = [NSNumber numberWithDouble:v43];
      v81[13] = v61;
      v80[14] = @"StraightLineDistanceToArmsReach";
      v62 = [NSNumber numberWithDouble:v41];
      v81[14] = v62;
      uint64_t v63 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:15];
      v64 = [v60 dictionaryWithDictionary:v63];

      v65 = [(CABTRunData *)self productUUID];
      LOBYTE(v63) = v65 == 0;

      if ((v63 & 1) == 0)
      {
        v66 = [(CABTRunData *)self productUUID];
        v67 = [v66 UUIDString];
        [v64 setObject:v67 forKeyedSubscript:@"ProductUUID"];
      }
      id v79 = v64;
      AnalyticsSendEventLazy();
    }
  }
}

id __22__CABTRunData_logData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (NSDictionary)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
}

- (NSDictionary)firstProximityLevelFoundEvent
{
  return self->_firstProximityLevelFoundEvent;
}

- (void)setFirstProximityLevelFoundEvent:(id)a3
{
}

- (NSDictionary)firstRssiEvent
{
  return self->_firstRssiEvent;
}

- (void)setFirstRssiEvent:(id)a3
{
}

- (NSDictionary)firstPoseEvent
{
  return self->_firstPoseEvent;
}

- (void)setFirstPoseEvent:(id)a3
{
}

- (NSDictionary)stopEvent
{
  return self->_stopEvent;
}

- (void)setStopEvent:(id)a3
{
}

- (NSDictionary)armsReachEvent
{
  return self->_armsReachEvent;
}

- (void)setArmsReachEvent:(id)a3
{
}

- (NSNumber)numberOfMotionEvents
{
  return self->_numberOfMotionEvents;
}

- (void)setNumberOfMotionEvents:(id)a3
{
}

- (NSNumber)numberOfProximityLevelFoundEvents
{
  return self->_numberOfProximityLevelFoundEvents;
}

- (void)setNumberOfProximityLevelFoundEvents:(id)a3
{
}

- (NSNumber)numberOfProximityLevelRevokedEvents
{
  return self->_numberOfProximityLevelRevokedEvents;
}

- (void)setNumberOfProximityLevelRevokedEvents:(id)a3
{
}

- (NSNumber)numberOfErrorEvents
{
  return self->_numberOfErrorEvents;
}

- (void)setNumberOfErrorEvents:(id)a3
{
}

- (NSNumber)numberOfInvalidPoseEvents
{
  return self->_numberOfInvalidPoseEvents;
}

- (void)setNumberOfInvalidPoseEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfInvalidPoseEvents, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_numberOfProximityLevelRevokedEvents, 0);
  objc_storeStrong((id *)&self->_numberOfProximityLevelFoundEvents, 0);
  objc_storeStrong((id *)&self->_numberOfMotionEvents, 0);
  objc_storeStrong((id *)&self->_armsReachEvent, 0);
  objc_storeStrong((id *)&self->_stopEvent, 0);
  objc_storeStrong((id *)&self->_firstPoseEvent, 0);
  objc_storeStrong((id *)&self->_firstRssiEvent, 0);
  objc_storeStrong((id *)&self->_firstProximityLevelFoundEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end