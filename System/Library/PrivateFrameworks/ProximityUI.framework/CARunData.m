@interface CARunData
- (BOOL)torchButtonPresented;
- (BOOL)torchTurnedOff;
- (BOOL)torchTurnedOn;
- (CARunData)init;
- (NSDictionary)armsReachEvent;
- (NSDictionary)firstPoseEvent;
- (NSDictionary)firstRangeEvent;
- (NSDictionary)firstTargetFoundEvent;
- (NSDictionary)firstTargetFoundFromAoAEvent;
- (NSDictionary)firstTargetFoundFromRangeEvent;
- (NSDictionary)startEvent;
- (NSDictionary)stopEvent;
- (NSNumber)isOwner;
- (NSNumber)numberOfAoARevokes;
- (NSNumber)numberOfErrorEvents;
- (NSNumber)numberOfHighResidualRevokes;
- (NSNumber)numberOfInvalidPoseEvents;
- (NSNumber)numberOfMotionEvents;
- (NSNumber)numberOfRangeRevokes;
- (NSNumber)numberOfStraightPathRevokes;
- (NSNumber)numberOfTargetFoundEvents;
- (NSNumber)numberOfTargetMotionRevokes;
- (NSNumber)numberOfTargetRevokedEvents;
- (NSNumber)numberOfVIORevokes;
- (NSUUID)productUUID;
- (double)firstSOIRSSI;
- (void)aoaRevoke:(id)a3;
- (void)error:(id)a3;
- (void)firstPose:(id)a3;
- (void)firstRange:(id)a3;
- (void)highResidualRevoke:(id)a3;
- (void)invalidPose:(id)a3;
- (void)logData;
- (void)motion:(id)a3;
- (void)rangeRevoke:(id)a3;
- (void)setArmsReachEvent:(id)a3;
- (void)setFirstPoseEvent:(id)a3;
- (void)setFirstRangeEvent:(id)a3;
- (void)setFirstSOIRSSI:(double)a3;
- (void)setFirstTargetFoundEvent:(id)a3;
- (void)setFirstTargetFoundFromAoAEvent:(id)a3;
- (void)setFirstTargetFoundFromRangeEvent:(id)a3;
- (void)setIsOwner:(id)a3;
- (void)setNumberOfAoARevokes:(id)a3;
- (void)setNumberOfErrorEvents:(id)a3;
- (void)setNumberOfHighResidualRevokes:(id)a3;
- (void)setNumberOfInvalidPoseEvents:(id)a3;
- (void)setNumberOfMotionEvents:(id)a3;
- (void)setNumberOfRangeRevokes:(id)a3;
- (void)setNumberOfStraightPathRevokes:(id)a3;
- (void)setNumberOfTargetFoundEvents:(id)a3;
- (void)setNumberOfTargetMotionRevokes:(id)a3;
- (void)setNumberOfTargetRevokedEvents:(id)a3;
- (void)setNumberOfVIORevokes:(id)a3;
- (void)setProductUUID:(id)a3;
- (void)setStartEvent:(id)a3;
- (void)setStopEvent:(id)a3;
- (void)setTorchButtonPresented:(BOOL)a3;
- (void)setTorchTurnedOff:(BOOL)a3;
- (void)setTorchTurnedOn:(BOOL)a3;
- (void)straightPathRevoke:(id)a3;
- (void)targetFound:(id)a3;
- (void)targetFoundFromAoA:(id)a3;
- (void)targetFoundFromRange:(id)a3;
- (void)targetMotionRevoke:(id)a3;
- (void)targetRevoked:(id)a3;
- (void)vioRevoke:(id)a3;
@end

@implementation CARunData

- (CARunData)init
{
  v17.receiver = self;
  v17.super_class = (Class)CARunData;
  v2 = [(CARunData *)&v17 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfMotionEvents:v3];

    v4 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfTargetFoundEvents:v4];

    v5 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfTargetRevokedEvents:v5];

    v6 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfInvalidPoseEvents:v6];

    v7 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfErrorEvents:v7];

    v8 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfVIORevokes:v8];

    v9 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfTargetMotionRevokes:v9];

    v10 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfRangeRevokes:v10];

    v11 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfAoARevokes:v11];

    v12 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfStraightPathRevokes:v12];

    v13 = [NSNumber numberWithInt:0];
    [(CARunData *)v2 setNumberOfHighResidualRevokes:v13];

    [(CARunData *)v2 setFirstSOIRSSI:100.0];
    [(CARunData *)v2 setTorchButtonPresented:0];
    [(CARunData *)v2 setTorchTurnedOn:0];
    [(CARunData *)v2 setTorchTurnedOff:0];
    os_log_t v14 = os_log_create("com.apple.proximity", "itemlocalizer_CARunData");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v14;
  }
  return v2;
}

- (void)motion:(id)a3
{
  v4 = NSNumber;
  id v6 = [(CARunData *)self numberOfMotionEvents];
  v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CARunData *)self setNumberOfMotionEvents:v5];
}

- (void)targetFound:(id)a3
{
  id v8 = a3;
  v4 = [(CARunData *)self firstTargetFoundEvent];

  if (!v4) {
    [(CARunData *)self setFirstTargetFoundEvent:v8];
  }
  v5 = NSNumber;
  id v6 = [(CARunData *)self numberOfTargetFoundEvents];
  v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CARunData *)self setNumberOfTargetFoundEvents:v7];
}

- (void)targetFoundFromRange:(id)a3
{
  id v5 = a3;
  v4 = [(CARunData *)self firstTargetFoundFromRangeEvent];

  if (!v4) {
    [(CARunData *)self setFirstTargetFoundFromRangeEvent:v5];
  }
}

- (void)targetFoundFromAoA:(id)a3
{
  id v5 = a3;
  v4 = [(CARunData *)self firstTargetFoundFromAoAEvent];

  if (!v4) {
    [(CARunData *)self setFirstTargetFoundFromAoAEvent:v5];
  }
}

- (void)targetRevoked:(id)a3
{
  v4 = NSNumber;
  id v6 = [(CARunData *)self numberOfTargetRevokedEvents];
  id v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CARunData *)self setNumberOfTargetRevokedEvents:v5];
}

- (void)vioRevoke:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = NSNumber;
  id v5 = [(CARunData *)self numberOfVIORevokes];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(CARunData *)self setNumberOfVIORevokes:v6];

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CARunData *)self numberOfVIORevokes];
    v9[0] = 67109120;
    v9[1] = [v8 intValue];
    _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "VIO Revoke %d", (uint8_t *)v9, 8u);
  }
}

- (void)targetMotionRevoke:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = NSNumber;
  id v5 = [(CARunData *)self numberOfTargetMotionRevokes];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(CARunData *)self setNumberOfTargetMotionRevokes:v6];

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CARunData *)self numberOfTargetMotionRevokes];
    v9[0] = 67109120;
    v9[1] = [v8 intValue];
    _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Target Motion Revoke %d", (uint8_t *)v9, 8u);
  }
}

- (void)rangeRevoke:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = NSNumber;
  id v5 = [(CARunData *)self numberOfRangeRevokes];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(CARunData *)self setNumberOfRangeRevokes:v6];

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CARunData *)self numberOfRangeRevokes];
    v9[0] = 67109120;
    v9[1] = [v8 intValue];
    _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Range Revoke %d", (uint8_t *)v9, 8u);
  }
}

- (void)aoaRevoke:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = NSNumber;
  id v5 = [(CARunData *)self numberOfAoARevokes];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(CARunData *)self setNumberOfAoARevokes:v6];

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CARunData *)self numberOfAoARevokes];
    v9[0] = 67109120;
    v9[1] = [v8 intValue];
    _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "AoA Revoke %d", (uint8_t *)v9, 8u);
  }
}

- (void)straightPathRevoke:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = NSNumber;
  id v5 = [(CARunData *)self numberOfStraightPathRevokes];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(CARunData *)self setNumberOfStraightPathRevokes:v6];

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CARunData *)self numberOfStraightPathRevokes];
    v9[0] = 67109120;
    v9[1] = [v8 intValue];
    _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Straight Path Revoke %d", (uint8_t *)v9, 8u);
  }
}

- (void)highResidualRevoke:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = NSNumber;
  id v5 = [(CARunData *)self numberOfHighResidualRevokes];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  [(CARunData *)self setNumberOfHighResidualRevokes:v6];

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CARunData *)self numberOfHighResidualRevokes];
    v9[0] = 67109120;
    v9[1] = [v8 intValue];
    _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "High Residual Revoke %d", (uint8_t *)v9, 8u);
  }
}

- (void)firstPose:(id)a3
{
  id v5 = a3;
  v4 = [(CARunData *)self firstPoseEvent];

  if (!v4) {
    [(CARunData *)self setFirstPoseEvent:v5];
  }
}

- (void)firstRange:(id)a3
{
  id v5 = a3;
  v4 = [(CARunData *)self firstRangeEvent];

  if (!v4) {
    [(CARunData *)self setFirstRangeEvent:v5];
  }
}

- (void)invalidPose:(id)a3
{
  v4 = NSNumber;
  id v6 = [(CARunData *)self numberOfInvalidPoseEvents];
  id v5 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CARunData *)self setNumberOfInvalidPoseEvents:v5];
}

- (void)error:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSNumber;
  id v6 = [(CARunData *)self numberOfErrorEvents];
  v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CARunData *)self setNumberOfErrorEvents:v7];

  v19[0] = @"status";
  id v8 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v19[1] = @"errorDescription";
  v20[0] = v8;
  uint64_t v9 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v20[1] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
  v12 = [(CARunData *)self productUUID];
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    v13 = [(CARunData *)self productUUID];
    os_log_t v14 = [v13 UUIDString];
    [v11 setObject:v14 forKeyedSubscript:@"ProductUUID"];
  }
  v15 = [(CARunData *)self isOwner];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    objc_super v17 = [(CARunData *)self isOwner];
    [v11 setObject:v17 forKeyedSubscript:@"IsOwner"];
  }
  id v18 = v11;
  AnalyticsSendEventLazy();
}

id __19__CARunData_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logData
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  v3 = [(CARunData *)self startEvent];
  if (!v3) {
    return;
  }
  id v4 = [(CARunData *)self stopEvent];

  if (!v4) {
    return;
  }
  id v5 = [(CARunData *)self startEvent];
  id v6 = [v5 objectForKeyedSubscript:@"timeElapsed"];
  [v6 doubleValue];
  double v8 = v7;

  uint64_t v9 = [(CARunData *)self stopEvent];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"timeElapsed"];
  [v10 doubleValue];
  double v140 = v11;

  v12 = [(CARunData *)self firstRangeEvent];

  if (v12)
  {
    v13 = [(CARunData *)self firstRangeEvent];
    os_log_t v14 = [v13 objectForKeyedSubscript:@"rangeEstimate"];
    [v14 doubleValue];
    double v137 = v15;

    BOOL v16 = [(CARunData *)self firstRangeEvent];
    objc_super v17 = [v16 objectForKeyedSubscript:@"timeElapsed"];
    [v17 doubleValue];
    double v19 = v18;

    v20 = [(CARunData *)self firstRangeEvent];
    v21 = [v20 objectForKeyedSubscript:@"traveledDistanceOfUser"];
    [v21 doubleValue];
    double v23 = v22;
    v24 = [(CARunData *)self startEvent];
    v25 = [v24 objectForKeyedSubscript:@"traveledDistanceOfUser"];
    [v25 doubleValue];
    double v135 = v19 - v8;
    double v130 = v23 - v26;
  }
  else
  {
    double v135 = -1.0;
    double v137 = -1.0;
    double v130 = -1.0;
  }
  v27 = [(CARunData *)self firstPoseEvent];

  if (v27)
  {
    v28 = [(CARunData *)self firstPoseEvent];
    v29 = [v28 objectForKeyedSubscript:@"timeElapsed"];
    [v29 doubleValue];
    double v133 = v30 - v8;
  }
  else
  {
    double v133 = -1.0;
  }
  v31 = [(CARunData *)self armsReachEvent];

  if (v31)
  {
    v32 = [(CARunData *)self armsReachEvent];
    v33 = [v32 objectForKeyedSubscript:@"timeElapsed"];
    [v33 doubleValue];
    double v35 = v34;

    v36 = [(CARunData *)self armsReachEvent];
    v37 = [v36 objectForKeyedSubscript:@"traveledDistance"];
    [v37 doubleValue];
    double v39 = v38;
    v40 = [(CARunData *)self startEvent];
    v41 = [v40 objectForKeyedSubscript:@"traveledDistance"];
    [v41 doubleValue];
    double v43 = v42;

    v44 = [(CARunData *)self armsReachEvent];
    v45 = [v44 objectForKeyedSubscript:@"straightLineDistance"];
    [v45 doubleValue];
    double v128 = v46;
    double v131 = v35 - v8;
    double v129 = v39 - v43;
  }
  else
  {
    double v131 = -1.0;
    double v128 = -1.0;
    double v129 = -1.0;
  }
  v47 = [(CARunData *)self firstTargetFoundEvent];

  if (v47)
  {
    v48 = [(CARunData *)self firstTargetFoundEvent];
    v49 = [v48 objectForKeyedSubscript:@"timeElapsed"];
    [v49 doubleValue];
    double v51 = v50;

    v52 = [(CARunData *)self firstTargetFoundEvent];
    v53 = [v52 objectForKeyedSubscript:@"rangeEstimate"];
    [v53 doubleValue];
    double v55 = v54;

    v56 = [(CARunData *)self firstTargetFoundEvent];
    v57 = [v56 objectForKeyedSubscript:@"traveledDistance"];
    [v57 doubleValue];
    double v59 = v58;
    v60 = [(CARunData *)self startEvent];
    v61 = [v60 objectForKeyedSubscript:@"traveledDistance"];
    [v61 doubleValue];
    double v63 = v62;

    v64 = [(CARunData *)self firstTargetFoundEvent];
    v65 = [v64 objectForKeyedSubscript:@"straightLineDistance"];
    [v65 doubleValue];
    double v67 = v66;
    double v68 = v51 - v8;
    double v69 = v59 - v63;
  }
  else
  {
    double v68 = -1.0;
    double v55 = -1.0;
    double v69 = -1.0;
    double v67 = -1.0;
  }
  v70 = [(CARunData *)self firstTargetFoundFromRangeEvent];
  if (v70)
  {

    goto LABEL_18;
  }
  v71 = [(CARunData *)self firstTargetFoundFromAoAEvent];

  if (v71)
  {
LABEL_18:
    v72 = [(CARunData *)self firstTargetFoundFromRangeEvent];

    if (v72)
    {
      v73 = [(CARunData *)self firstTargetFoundFromAoAEvent];

      if (v73)
      {
        v74 = [(CARunData *)self firstTargetFoundFromRangeEvent];
        v75 = [v74 objectForKeyedSubscript:@"timeElapsed"];
        [v75 doubleValue];
        double v77 = v76;
        v78 = [(CARunData *)self firstTargetFoundFromAoAEvent];
        v79 = [v78 objectForKeyedSubscript:@"timeElapsed"];
        [v79 doubleValue];
        double v81 = v77 - v80;
      }
      else
      {
        double v81 = 1000.0;
      }
    }
    else
    {
      double v81 = -1000.0;
    }
    goto LABEL_24;
  }
  double v81 = -10000.0;
LABEL_24:
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v146 = v81;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Time between first range arrow and first aoa arrow (s) = %f", buf, 0xCu);
  }
  v83 = [(CARunData *)self stopEvent];
  v84 = [v83 objectForKeyedSubscript:@"traveledDistance"];
  [v84 doubleValue];
  double v86 = v85;
  v87 = [(CARunData *)self startEvent];
  v88 = [v87 objectForKeyedSubscript:@"traveledDistance"];
  [v88 doubleValue];
  double v90 = v89;

  v91 = (void *)MEMORY[0x263EFF9A0];
  v143[0] = @"NumberOfMotionEvents";
  v139 = [(CARunData *)self numberOfMotionEvents];
  v144[0] = v139;
  v143[1] = @"NumberOfTargetFoundEvents";
  v120 = [(CARunData *)self numberOfTargetFoundEvents];
  v144[1] = v120;
  v143[2] = @"NumberOfTargetRevokedEvents";
  v119 = [(CARunData *)self numberOfTargetRevokedEvents];
  v144[2] = v119;
  v143[3] = @"NumberOfInvalidPoseEvents";
  v118 = [(CARunData *)self numberOfInvalidPoseEvents];
  v144[3] = v118;
  v143[4] = @"NumberOfErrorEvents";
  v117 = [(CARunData *)self numberOfErrorEvents];
  v144[4] = v117;
  v143[5] = @"NumberOfVIORevokes";
  v122 = [(CARunData *)self numberOfVIORevokes];
  v144[5] = v122;
  v143[6] = @"NumberOfTargetMotionRevokes";
  v121 = [(CARunData *)self numberOfTargetMotionRevokes];
  v144[6] = v121;
  v143[7] = @"NumberOfRangeRevokes";
  v123 = [(CARunData *)self numberOfRangeRevokes];
  v144[7] = v123;
  v143[8] = @"NumberOfAoARevokes";
  v124 = [(CARunData *)self numberOfAoARevokes];
  v144[8] = v124;
  v143[9] = @"NumberOfStraightPathRevokes";
  v126 = [(CARunData *)self numberOfStraightPathRevokes];
  v144[9] = v126;
  v143[10] = @"NumberOfHighResidualRevokes";
  v127 = [(CARunData *)self numberOfHighResidualRevokes];
  v144[10] = v127;
  v143[11] = @"TorchButtonPresented";
  v125 = objc_msgSend(NSNumber, "numberWithBool:", -[CARunData torchButtonPresented](self, "torchButtonPresented"));
  v144[11] = v125;
  v143[12] = @"TorchTurnedOn";
  v116 = objc_msgSend(NSNumber, "numberWithBool:", -[CARunData torchTurnedOn](self, "torchTurnedOn"));
  v144[12] = v116;
  v143[13] = @"TorchTurnedOff";
  v115 = objc_msgSend(NSNumber, "numberWithBool:", -[CARunData torchTurnedOff](self, "torchTurnedOff"));
  v144[13] = v115;
  v143[14] = @"TimeToFirstRange";
  v114 = [NSNumber numberWithDouble:v135];
  v144[14] = v114;
  v143[15] = @"TimeToFirstPose";
  v136 = [NSNumber numberWithDouble:v133];
  v144[15] = v136;
  v143[16] = @"TimeToFirstArrow";
  v113 = [NSNumber numberWithDouble:v68];
  v144[16] = v113;
  v143[17] = @"TimeToArmsReach";
  v108 = [NSNumber numberWithDouble:v131];
  v144[17] = v108;
  v143[18] = @"RunDuration";
  v134 = [NSNumber numberWithDouble:v140 - v8];
  v144[18] = v134;
  v143[19] = @"TimeBetweenRangeAndAoAArrows";
  v132 = [NSNumber numberWithDouble:v81];
  v144[19] = v132;
  v143[20] = @"FirstRange";
  v112 = [NSNumber numberWithDouble:v137];
  v144[20] = v112;
  v143[21] = @"RangeAtFirstArrow";
  v138 = [NSNumber numberWithDouble:v55];
  v144[21] = v138;
  v143[22] = @"FinalRange";
  v111 = [(CARunData *)self stopEvent];
  v110 = [v111 objectForKeyedSubscript:@"rangeEstimate"];
  v144[22] = v110;
  v143[23] = @"EnteredArmsReach";
  v109 = [NSNumber numberWithBool:v31 != 0];
  v144[23] = v109;
  v143[24] = @"TotalDistanceMoved";
  v92 = [NSNumber numberWithDouble:v86 - v90];
  v144[24] = v92;
  v143[25] = @"DistanceMovedToFirstArrow";
  v93 = [NSNumber numberWithDouble:v69];
  v144[25] = v93;
  v143[26] = @"StraightLineDistanceToFirstArrow";
  v94 = [NSNumber numberWithDouble:v67];
  v144[26] = v94;
  v143[27] = @"DistanceMovedToArmsReach";
  v95 = [NSNumber numberWithDouble:v129];
  v144[27] = v95;
  v143[28] = @"DistanceMovedByUserToFirstRange";
  v96 = [NSNumber numberWithDouble:v130];
  v144[28] = v96;
  v143[29] = @"StraightLineDistanceToArmsReach";
  v97 = [NSNumber numberWithDouble:v128];
  v98 = v91;
  v144[29] = v97;
  v143[30] = @"FirstSOIRSSI";
  v99 = NSNumber;
  [(CARunData *)self firstSOIRSSI];
  v100 = objc_msgSend(v99, "numberWithDouble:");
  v144[30] = v100;
  v101 = [NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:31];
  v141 = [v98 dictionaryWithDictionary:v101];

  v102 = [(CARunData *)self productUUID];
  LOBYTE(v98) = v102 == 0;

  if ((v98 & 1) == 0)
  {
    v103 = [(CARunData *)self productUUID];
    v104 = [v103 UUIDString];
    [v141 setObject:v104 forKeyedSubscript:@"ProductUUID"];
  }
  v105 = [(CARunData *)self isOwner];
  BOOL v106 = v105 == 0;

  if (!v106)
  {
    v107 = [(CARunData *)self isOwner];
    [v141 setObject:v107 forKeyedSubscript:@"IsOwner"];
  }
  id v142 = v141;
  AnalyticsSendEventLazy();
}

id __20__CARunData_logData__block_invoke(uint64_t a1)
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

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
}

- (NSDictionary)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
}

- (NSDictionary)firstTargetFoundEvent
{
  return self->_firstTargetFoundEvent;
}

- (void)setFirstTargetFoundEvent:(id)a3
{
}

- (NSDictionary)firstRangeEvent
{
  return self->_firstRangeEvent;
}

- (void)setFirstRangeEvent:(id)a3
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

- (NSDictionary)firstTargetFoundFromRangeEvent
{
  return self->_firstTargetFoundFromRangeEvent;
}

- (void)setFirstTargetFoundFromRangeEvent:(id)a3
{
}

- (NSDictionary)firstTargetFoundFromAoAEvent
{
  return self->_firstTargetFoundFromAoAEvent;
}

- (void)setFirstTargetFoundFromAoAEvent:(id)a3
{
}

- (NSNumber)numberOfMotionEvents
{
  return self->_numberOfMotionEvents;
}

- (void)setNumberOfMotionEvents:(id)a3
{
}

- (NSNumber)numberOfTargetFoundEvents
{
  return self->_numberOfTargetFoundEvents;
}

- (void)setNumberOfTargetFoundEvents:(id)a3
{
}

- (NSNumber)numberOfTargetRevokedEvents
{
  return self->_numberOfTargetRevokedEvents;
}

- (void)setNumberOfTargetRevokedEvents:(id)a3
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

- (NSNumber)numberOfVIORevokes
{
  return self->_numberOfVIORevokes;
}

- (void)setNumberOfVIORevokes:(id)a3
{
}

- (NSNumber)numberOfTargetMotionRevokes
{
  return self->_numberOfTargetMotionRevokes;
}

- (void)setNumberOfTargetMotionRevokes:(id)a3
{
}

- (NSNumber)numberOfRangeRevokes
{
  return self->_numberOfRangeRevokes;
}

- (void)setNumberOfRangeRevokes:(id)a3
{
}

- (NSNumber)numberOfAoARevokes
{
  return self->_numberOfAoARevokes;
}

- (void)setNumberOfAoARevokes:(id)a3
{
}

- (NSNumber)numberOfStraightPathRevokes
{
  return self->_numberOfStraightPathRevokes;
}

- (void)setNumberOfStraightPathRevokes:(id)a3
{
}

- (NSNumber)numberOfHighResidualRevokes
{
  return self->_numberOfHighResidualRevokes;
}

- (void)setNumberOfHighResidualRevokes:(id)a3
{
}

- (double)firstSOIRSSI
{
  return self->_firstSOIRSSI;
}

- (void)setFirstSOIRSSI:(double)a3
{
  self->_firstSOIRSSI = a3;
}

- (BOOL)torchButtonPresented
{
  return self->_torchButtonPresented;
}

- (void)setTorchButtonPresented:(BOOL)a3
{
  self->_torchButtonPresented = a3;
}

- (BOOL)torchTurnedOn
{
  return self->_torchTurnedOn;
}

- (void)setTorchTurnedOn:(BOOL)a3
{
  self->_torchTurnedOn = a3;
}

- (BOOL)torchTurnedOff
{
  return self->_torchTurnedOff;
}

- (void)setTorchTurnedOff:(BOOL)a3
{
  self->_torchTurnedOff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfHighResidualRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfStraightPathRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfAoARevokes, 0);
  objc_storeStrong((id *)&self->_numberOfRangeRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfTargetMotionRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfVIORevokes, 0);
  objc_storeStrong((id *)&self->_numberOfInvalidPoseEvents, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_numberOfTargetRevokedEvents, 0);
  objc_storeStrong((id *)&self->_numberOfTargetFoundEvents, 0);
  objc_storeStrong((id *)&self->_numberOfMotionEvents, 0);
  objc_storeStrong((id *)&self->_firstTargetFoundFromAoAEvent, 0);
  objc_storeStrong((id *)&self->_firstTargetFoundFromRangeEvent, 0);
  objc_storeStrong((id *)&self->_armsReachEvent, 0);
  objc_storeStrong((id *)&self->_stopEvent, 0);
  objc_storeStrong((id *)&self->_firstPoseEvent, 0);
  objc_storeStrong((id *)&self->_firstRangeEvent, 0);
  objc_storeStrong((id *)&self->_firstTargetFoundEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end