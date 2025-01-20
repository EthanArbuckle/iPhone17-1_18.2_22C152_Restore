@interface PLBatteryUIResponseTypePausedCharging
- (BOOL)externalConnected;
- (BOOL)isCharging;
- (BOOL)isFixedCharge;
- (BOOL)wasCameraStreaming;
- (BOOL)wasTLCWithCameraStreaming;
- (NSDate)cleanEnergyChargingDeadline;
- (NSDate)end;
- (NSDate)smartChargingDeadline;
- (NSDate)start;
- (NSMutableDictionary)resultDictionary;
- (NSNumber)currentChargeLevel;
- (NSNumber)fixedChargingLimit;
- (NSString)chargingStateIntervalsEntryKey;
- (PLBatteryUIResponderService)responderService;
- (PLCoreStorage)storage;
- (PLEntry)lastCameraStreamingEntry;
- (PLEntry)lastConnectedEntry;
- (PLEntry)lastEntry;
- (PLEntry)lastSmartChargingEntry;
- (PLEntry)lastTLCWithCameraStreamingEntry;
- (PowerUISmartChargeClient)cleanEnergyChargingClient;
- (PowerUISmartChargeClient)smartChargingClient;
- (_PLTimeIntervalRange)range;
- (id)dependencies;
- (id)result;
- (int)configureState:(id)a3;
- (int)getState:(signed __int16)a3;
- (int)intervalStateCEC;
- (int)intervalStateChargingSpeed;
- (int)intervalStateFixedCharging;
- (int)intervalStateSmartCharging;
- (int)intervalStateTLC;
- (int)pausedChargingState;
- (void)configure:(id)a3;
- (void)configureCameraStreaming;
- (void)configureTLCWithCameraStreaming;
- (void)getCameraStreamingState;
- (void)getChargingData;
- (void)getTLCWithCameraStreamingState;
- (void)result;
- (void)run;
- (void)setChargingPausedStates;
- (void)setChargingStateIntervalsEntryKey:(id)a3;
- (void)setCleanEnergyChargingClient:(id)a3;
- (void)setCleanEnergyChargingDeadline:(id)a3;
- (void)setCurrentChargeLevel:(id)a3;
- (void)setCurrentlyChargingStates;
- (void)setEnd:(id)a3;
- (void)setExternalConnected:(BOOL)a3;
- (void)setFixedChargingLimit:(id)a3;
- (void)setIntervalStateCEC:(int)a3;
- (void)setIntervalStateChargingSpeed:(int)a3;
- (void)setIntervalStateFixedCharging:(int)a3;
- (void)setIntervalStateSmartCharging:(int)a3;
- (void)setIntervalStateTLC:(int)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setIsFixedCharge:(BOOL)a3;
- (void)setLastCameraStreamingEntry:(id)a3;
- (void)setLastConnectedEntry:(id)a3;
- (void)setLastEntry:(id)a3;
- (void)setLastSmartChargingEntry:(id)a3;
- (void)setLastTLCWithCameraStreamingEntry:(id)a3;
- (void)setPausedChargingState:(int)a3;
- (void)setRange:(_PLTimeIntervalRange)a3;
- (void)setResponderService:(id)a3;
- (void)setResultDictionary:(id)a3;
- (void)setSmartChargingClient:(id)a3;
- (void)setSmartChargingDeadline:(id)a3;
- (void)setStart:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTerminatedChargingStates;
- (void)setWasCameraStreaming:(BOOL)a3;
- (void)setWasTLCWithCameraStreaming:(BOOL)a3;
@end

@implementation PLBatteryUIResponseTypePausedCharging

- (id)dependencies
{
  return 0;
}

- (void)getChargingData
{
  v2 = [a1 start];
  v3 = [a1 end];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1E4220000, v4, v5, "After monotonic conversion Query Range start=%@, end=%@", v6, v7, v8, v9, v10);
}

- (int)getState:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v32 = v3;
    _os_log_debug_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEBUG, "Get state for type: %d", buf, 8u);
  }

  uint64_t v6 = NSString;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  uint64_t v8 = v7;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  double v11 = v9 + v10;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  uint64_t v13 = v12;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  v16 = [v6 stringWithFormat:@"((timestamp BETWEEN %f AND %f) OR (%@ BETWEEN %f AND %f)) AND %@=\"%hd\", v8, *(void *)&v11, @"timestampEnd", v13, v14 + v15, @"intervalType"", v3];
  v17 = [(PLBatteryUIResponseTypePausedCharging *)self storage];
  v18 = [(PLBatteryUIResponseTypePausedCharging *)self chargingStateIntervalsEntryKey];
  v30 = v16;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v20 = [v17 lastEntryForKey:v18 withFilters:v19];
  [(PLBatteryUIResponseTypePausedCharging *)self setLastEntry:v20];

  v21 = [(PLBatteryUIResponseTypePausedCharging *)self lastEntry];

  v22 = PLLogCommon();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v22, OS_LOG_TYPE_INFO, "Entry exists in last 24hrs.", buf, 2u);
    }

    if (v3 == 8)
    {
      v24 = [(PLBatteryUIResponseTypePausedCharging *)self lastEntry];
      v25 = [v24 objectForKeyedSubscript:@"chargeLimitTargetSoC"];

      if (v25)
      {
        v26 = [(PLBatteryUIResponseTypePausedCharging *)self lastEntry];
        v27 = [v26 objectForKeyedSubscript:@"chargeLimitTargetSoC"];
        [(PLBatteryUIResponseTypePausedCharging *)self setFixedChargingLimit:v27];
      }
    }
    v22 = [(PLBatteryUIResponseTypePausedCharging *)self lastEntry];
    int v28 = [(PLBatteryUIResponseTypePausedCharging *)self configureState:v22];
  }
  else if (v23)
  {
    *(_WORD *)buf = 0;
    int v28 = 1;
    _os_log_impl(&dword_1E4220000, v22, OS_LOG_TYPE_INFO, "No entries in 24hr time range", buf, 2u);
  }
  else
  {
    int v28 = 1;
  }

  return v28;
}

- (int)configureState:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypePausedCharging configureState:]9();
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = [v4 objectForKeyedSubscript:@"timestampEnd"];

  if (v9)
  {
    double v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypePausedCharging configureState:]8(v4);
    }

    double v11 = [v4 objectForKeyedSubscript:@"timestampEnd"];
    [v11 timeIntervalSince1970];
    double v13 = v12;

    double v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypePausedCharging configureState:]7();
    }

    double v15 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];

    v16 = PLLogCommon();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v17) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]6(self);
      }

      v18 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
      v19 = [v18 objectForKeyedSubscript:@"timestamp"];
      [v19 doubleValue];
      double v21 = v20;

      v22 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
      BOOL v23 = [v22 objectForKeyedSubscript:@"timestampEnd"];

      v24 = PLLogCommon();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v25) {
          -[PLBatteryUIResponseTypePausedCharging configureState:]5();
        }

        v26 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
        v27 = [v26 objectForKeyedSubscript:@"timestampEnd"];
        [v27 timeIntervalSince1970];
        double v29 = v28;

        v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryUIResponseTypePausedCharging configureState:]4();
        }

        int v31 = 1;
        if (v21 > v13 || v29 < v8) {
          goto LABEL_76;
        }
      }
      else
      {
        if (v25) {
          -[PLBatteryUIResponseTypePausedCharging configureState:]3();
        }

        if (v21 > v13)
        {
          int v31 = 1;
          goto LABEL_76;
        }
      }
    }
    else
    {
      if (v17) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]2();
      }
    }
    int v31 = 4;
    goto LABEL_76;
  }
  int v32 = [v4 objectForKeyedSubscript:@"intervalType"];
  __int16 v33 = [v32 intValue];

  v34 = PLLogCommon();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v80 = v33;
    _os_log_debug_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEBUG, "Entry is open: %d", buf, 8u);
  }

  int v31 = 1;
  switch(v33)
  {
    case 2:
      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.6();
      }

      [(PLBatteryUIResponseTypePausedCharging *)self setSmartChargingDeadline:0];
      id v36 = objc_alloc(MEMORY[0x1E4F928B0]);
      v37 = (void *)[v36 initWithClientName:*MEMORY[0x1E4F928C0]];
      [(PLBatteryUIResponseTypePausedCharging *)self setSmartChargingClient:v37];

      v38 = [(PLBatteryUIResponseTypePausedCharging *)self smartChargingClient];
      id v78 = 0;
      v39 = [v38 fullChargeDeadline:&v78];
      id v40 = v78;

      if (v40)
      {
        v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.5();
        }
      }
      else
      {
        [(PLBatteryUIResponseTypePausedCharging *)self setSmartChargingDeadline:v39];
      }
      v75 = PLLogCommon();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.4(self);
      }
      goto LABEL_74;
    case 3:
      v47 = PLLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]1();
      }

      v48 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v49 = [v4 entryDate];
      [v48 timeIntervalSinceDate:v49];
      double v51 = v50;

      v52 = PLLogCommon();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]0(v52, v53, v54, v55, v56, v57, v58, v59);
      }
      if (v51 >= 960.0 || v51 <= 0.0) {
        int v61 = 1;
      }
      else {
        int v61 = 2;
      }
      if (v51 >= 960.0) {
        int v31 = 3;
      }
      else {
        int v31 = v61;
      }

      goto LABEL_76;
    case 7:
      v42 = PLLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.9();
      }

      [(PLBatteryUIResponseTypePausedCharging *)self setCleanEnergyChargingDeadline:0];
      id v43 = objc_alloc(MEMORY[0x1E4F928B0]);
      v44 = (void *)[v43 initWithClientName:*MEMORY[0x1E4F928C0]];
      [(PLBatteryUIResponseTypePausedCharging *)self setCleanEnergyChargingClient:v44];

      v45 = [(PLBatteryUIResponseTypePausedCharging *)self cleanEnergyChargingClient];
      id v77 = 0;
      v39 = [v45 cecFullChargeDeadline:&v77];
      id v40 = v77;

      if (v40)
      {
        v46 = PLLogCommon();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[PLBatteryUIResponseTypePausedCharging configureState:].cold.8();
        }
      }
      else
      {
        [(PLBatteryUIResponseTypePausedCharging *)self setCleanEnergyChargingDeadline:v39];
      }
      v75 = PLLogCommon();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:].cold.7(self);
      }
LABEL_74:

      goto LABEL_75;
    case 8:
      v62 = PLLogCommon();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]();
      }

      uint64_t v63 = [(PLBatteryUIResponseTypePausedCharging *)self fixedChargingLimit];
      if (!v63) {
        goto LABEL_75;
      }
      v64 = (void *)v63;
      uint64_t v65 = [(PLBatteryUIResponseTypePausedCharging *)self currentChargeLevel];
      if (!v65)
      {

        goto LABEL_75;
      }
      v66 = (void *)v65;
      v67 = [(PLBatteryUIResponseTypePausedCharging *)self fixedChargingLimit];
      [v67 doubleValue];
      double v69 = v68;
      v70 = [(PLBatteryUIResponseTypePausedCharging *)self currentChargeLevel];
      [v70 doubleValue];
      double v72 = v71;

      if (v69 >= v72)
      {
LABEL_75:
        int v31 = 3;
        goto LABEL_76;
      }
      v73 = PLLogCommon();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]();
      }

      int v31 = 5;
LABEL_76:

      return v31;
    case 9:
      if (![MEMORY[0x1E4F92A10] supportsSlowCharging]) {
        goto LABEL_76;
      }
      v74 = PLLogCommon();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIResponseTypePausedCharging configureState:]();
      }

      goto LABEL_75;
    default:
      goto LABEL_76;
  }
}

- (void)getCameraStreamingState
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  uint64_t v5 = v4;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  double v8 = v6 + v7;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  uint64_t v10 = v9;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  double v13 = [v3 stringWithFormat:@"((timestamp BETWEEN %f AND %f) AND (%@ BETWEEN %f AND %f)) AND %@=\"%hd\", v5, *(void *)&v8, @"timestampEnd", v10, v11 + v12, @"intervalType"", 4];
  double v14 = [(PLBatteryUIResponseTypePausedCharging *)self storage];
  double v15 = [(PLBatteryUIResponseTypePausedCharging *)self chargingStateIntervalsEntryKey];
  v22[0] = v13;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  BOOL v17 = [v14 lastEntryForKey:v15 withFilters:v16];
  [(PLBatteryUIResponseTypePausedCharging *)self setLastCameraStreamingEntry:v17];

  v18 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];

  v19 = PLLogCommon();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_INFO, "Camera Streaming Entry exists in last 24hrs.", buf, 2u);
    }

    [(PLBatteryUIResponseTypePausedCharging *)self configureCameraStreaming];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_INFO, "No Camera Streaming entries in 24hr time range", buf, 2u);
    }
  }
}

- (void)configureCameraStreaming
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(PLBatteryUIResponseTypePausedCharging *)self setWasCameraStreaming:0];
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];
    int v42 = 138412290;
    double v43 = *(double *)&v4;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Camera Entry:%@", (uint8_t *)&v42, 0xCu);
  }
  uint64_t v5 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];
  double v6 = [v5 objectForKeyedSubscript:@"timestampEnd"];

  if (!v6) {
    goto LABEL_19;
  }
  double v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"timestamp"];
    uint64_t v10 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];
    double v11 = [v10 objectForKeyedSubscript:@"timestampEnd"];
    int v42 = 138412546;
    double v43 = *(double *)&v9;
    __int16 v44 = 2112;
    double v45 = *(double *)&v11;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "Last Camera Streaming Entry was opened at %@ and closed at %@", (uint8_t *)&v42, 0x16u);
  }
  double v12 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];
  double v13 = [v12 objectForKeyedSubscript:@"timestamp"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [(PLBatteryUIResponseTypePausedCharging *)self lastCameraStreamingEntry];
  BOOL v17 = [v16 objectForKeyedSubscript:@"timestampEnd"];
  [v17 timeIntervalSince1970];
  double v19 = v18;

  BOOL v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v42 = 134218240;
    double v43 = v15;
    __int16 v44 = 2048;
    double v45 = v19;
    _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, "Converted values to doubles: start: %f and end: %f", (uint8_t *)&v42, 0x16u);
  }

  double v21 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];

  v22 = PLLogCommon();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      v24 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
      int v42 = 138412290;
      double v43 = *(double *)&v24;
      _os_log_impl(&dword_1E4220000, v22, OS_LOG_TYPE_INFO, "Connected Entry:%@", (uint8_t *)&v42, 0xCu);
    }
    BOOL v25 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
    v26 = [v25 objectForKeyedSubscript:@"timestamp"];
    [v26 doubleValue];
    double v28 = v27;

    double v29 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
    v30 = [v29 objectForKeyedSubscript:@"timestampEnd"];

    int v31 = PLLogCommon();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_INFO, "Closed External Connected Entry", (uint8_t *)&v42, 2u);
      }

      __int16 v33 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
      v34 = [v33 objectForKeyedSubscript:@"timestampEnd"];
      [v34 timeIntervalSince1970];
      double v36 = v35;

      v37 = PLLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        int v42 = 134218240;
        double v43 = v28;
        __int16 v44 = 2048;
        double v45 = v36;
        _os_log_impl(&dword_1E4220000, v37, OS_LOG_TYPE_INFO, "start: %f, end: %f", (uint8_t *)&v42, 0x16u);
      }

      if (v28 <= v19 && v36 >= v15) {
LABEL_18:
      }
        [(PLBatteryUIResponseTypePausedCharging *)self setWasCameraStreaming:1];
    }
    else
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_INFO, "Open External Connected Entry", (uint8_t *)&v42, 2u);
      }

      if (v28 <= v19) {
        goto LABEL_18;
      }
    }
LABEL_19:
    v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      BOOL v38 = [(PLBatteryUIResponseTypePausedCharging *)self wasCameraStreaming];
      int v42 = 67109120;
      LODWORD(v43) = v38;
      v39 = "Was Camera Streaming: %d";
      id v40 = v22;
      uint32_t v41 = 8;
LABEL_23:
      _os_log_impl(&dword_1E4220000, v40, OS_LOG_TYPE_INFO, v39, (uint8_t *)&v42, v41);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v23)
  {
    LOWORD(v42) = 0;
    v39 = "No External Connected Entry exists in last 24hrs";
    id v40 = v22;
    uint32_t v41 = 2;
    goto LABEL_23;
  }
LABEL_24:
}

- (void)getTLCWithCameraStreamingState
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  uint64_t v5 = v4;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  double v8 = v6 + v7;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  uint64_t v10 = v9;
  [(PLBatteryUIResponseTypePausedCharging *)self range];
  double v13 = [v3 stringWithFormat:@"((timestamp BETWEEN %f AND %f) AND (%@ BETWEEN %f AND %f)) AND %@=\"%hd\", v5, *(void *)&v8, @"timestampEnd", v10, v11 + v12, @"intervalType"", 6];
  double v14 = [(PLBatteryUIResponseTypePausedCharging *)self storage];
  double v15 = [(PLBatteryUIResponseTypePausedCharging *)self chargingStateIntervalsEntryKey];
  v22[0] = v13;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  BOOL v17 = [v14 lastEntryForKey:v15 withFilters:v16];
  [(PLBatteryUIResponseTypePausedCharging *)self setLastTLCWithCameraStreamingEntry:v17];

  double v18 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];

  double v19 = PLLogCommon();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_INFO, "TLC with Camera Streaming Entry exists in last 24hrs.", buf, 2u);
    }

    [(PLBatteryUIResponseTypePausedCharging *)self configureTLCWithCameraStreaming];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_INFO, "No TLC with Camera Streaming entries in 24hr time range", buf, 2u);
    }
  }
}

- (void)configureTLCWithCameraStreaming
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(PLBatteryUIResponseTypePausedCharging *)self setWasTLCWithCameraStreaming:0];
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];
    int v42 = 138412290;
    double v43 = *(double *)&v4;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "TLC with Camera Entry:%@", (uint8_t *)&v42, 0xCu);
  }
  uint64_t v5 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];
  double v6 = [v5 objectForKeyedSubscript:@"timestampEnd"];

  if (!v6) {
    goto LABEL_19;
  }
  double v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"timestamp"];
    uint64_t v10 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];
    double v11 = [v10 objectForKeyedSubscript:@"timestampEnd"];
    int v42 = 138412546;
    double v43 = *(double *)&v9;
    __int16 v44 = 2112;
    double v45 = *(double *)&v11;
    _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_INFO, "Last TLC with Camera Streaming Entry was opened at %@ and closed at %@", (uint8_t *)&v42, 0x16u);
  }
  double v12 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];
  double v13 = [v12 objectForKeyedSubscript:@"timestamp"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [(PLBatteryUIResponseTypePausedCharging *)self lastTLCWithCameraStreamingEntry];
  BOOL v17 = [v16 objectForKeyedSubscript:@"timestampEnd"];
  [v17 timeIntervalSince1970];
  double v19 = v18;

  BOOL v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v42 = 134218240;
    double v43 = v15;
    __int16 v44 = 2048;
    double v45 = v19;
    _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, "Converted values to doubles: start: %f and end: %f", (uint8_t *)&v42, 0x16u);
  }

  double v21 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];

  v22 = PLLogCommon();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      v24 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
      int v42 = 138412290;
      double v43 = *(double *)&v24;
      _os_log_impl(&dword_1E4220000, v22, OS_LOG_TYPE_INFO, "Connected Entry:%@", (uint8_t *)&v42, 0xCu);
    }
    BOOL v25 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
    v26 = [v25 objectForKeyedSubscript:@"timestamp"];
    [v26 doubleValue];
    double v28 = v27;

    double v29 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
    v30 = [v29 objectForKeyedSubscript:@"timestampEnd"];

    int v31 = PLLogCommon();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_INFO, "Closed External Connected Entry", (uint8_t *)&v42, 2u);
      }

      __int16 v33 = [(PLBatteryUIResponseTypePausedCharging *)self lastConnectedEntry];
      v34 = [v33 objectForKeyedSubscript:@"timestampEnd"];
      [v34 timeIntervalSince1970];
      double v36 = v35;

      v37 = PLLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        int v42 = 134218240;
        double v43 = v28;
        __int16 v44 = 2048;
        double v45 = v36;
        _os_log_impl(&dword_1E4220000, v37, OS_LOG_TYPE_INFO, "start: %f, end: %f", (uint8_t *)&v42, 0x16u);
      }

      if (v28 <= v19 && v36 >= v15) {
LABEL_18:
      }
        [(PLBatteryUIResponseTypePausedCharging *)self setWasTLCWithCameraStreaming:1];
    }
    else
    {
      if (v32)
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1E4220000, v31, OS_LOG_TYPE_INFO, "Open External Connected Entry", (uint8_t *)&v42, 2u);
      }

      if (v28 <= v19) {
        goto LABEL_18;
      }
    }
LABEL_19:
    v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      BOOL v38 = [(PLBatteryUIResponseTypePausedCharging *)self wasTLCWithCameraStreaming];
      int v42 = 67109120;
      LODWORD(v43) = v38;
      v39 = "Was TLC with Camera Streaming: %d";
      id v40 = v22;
      uint32_t v41 = 8;
LABEL_23:
      _os_log_impl(&dword_1E4220000, v40, OS_LOG_TYPE_INFO, v39, (uint8_t *)&v42, v41);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v23)
  {
    LOWORD(v42) = 0;
    v39 = "No External Connected Entry exists in last 24hrs";
    id v40 = v22;
    uint32_t v41 = 2;
    goto LABEL_23;
  }
LABEL_24:
}

- (void)configure:(id)a3
{
  [(PLBatteryUIResponseTypePausedCharging *)self setPausedChargingState:100];
  [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateTLC:1];
  [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateSmartCharging:1];
  [(PLBatteryUIResponseTypePausedCharging *)self getChargingData];
  [(PLBatteryUIResponseTypePausedCharging *)self getCameraStreamingState];
  [(PLBatteryUIResponseTypePausedCharging *)self getTLCWithCameraStreamingState];
  [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateFixedCharging:[(PLBatteryUIResponseTypePausedCharging *)self getState:8]];
  uint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypePausedCharging configure:].cold.5(self);
  }

  if ([MEMORY[0x1E4F92A10] supportsSlowCharging])
  {
    [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateChargingSpeed:[(PLBatteryUIResponseTypePausedCharging *)self getState:9]];
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIResponseTypePausedCharging configure:].cold.4(self);
    }
  }
  [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateSmartCharging:[(PLBatteryUIResponseTypePausedCharging *)self getState:2]];
  double v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypePausedCharging configure:](self);
  }

  [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateCEC:[(PLBatteryUIResponseTypePausedCharging *)self getState:7]];
  double v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypePausedCharging configure:](self);
  }

  [(PLBatteryUIResponseTypePausedCharging *)self setIntervalStateTLC:[(PLBatteryUIResponseTypePausedCharging *)self getState:3]];
  double v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIResponseTypePausedCharging configure:](self);
  }
}

- (void)setCurrentlyChargingStates
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Setting Currently Charging States", v2, v3, v4, v5, v6);
}

- (void)setChargingPausedStates
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Unknown reason for pause, surfacing normal charging string", v2, v3, v4, v5, v6);
}

- (void)setTerminatedChargingStates
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Unknown reason", v2, v3, v4, v5, v6);
}

- (void)run
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Charge is at 100", v2, v3, v4, v5, v6);
}

- (id)result
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PLBatteryUIResponseTypePausedCharging *)self setResultDictionary:v3];

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[PLBatteryUIResponseTypePausedCharging pausedChargingState](self, "pausedChargingState"));
  uint64_t v5 = [(PLBatteryUIResponseTypePausedCharging *)self resultDictionary];
  [v5 setObject:v4 forKeyedSubscript:@"PLBatteryUIPausedChargingStateKey"];

  uint8_t v6 = [(PLBatteryUIResponseTypePausedCharging *)self currentChargeLevel];
  double v7 = [(PLBatteryUIResponseTypePausedCharging *)self resultDictionary];
  [v7 setObject:v6 forKeyedSubscript:@"PLBatteryUIPausedChargingCurrentPercentageKey"];

  double v8 = [(PLBatteryUIResponseTypePausedCharging *)self fixedChargingLimit];

  if (v8)
  {
    uint64_t v9 = [(PLBatteryUIResponseTypePausedCharging *)self fixedChargingLimit];
    uint64_t v10 = [(PLBatteryUIResponseTypePausedCharging *)self resultDictionary];
    [v10 setObject:v9 forKeyedSubscript:@"PLBatteryUIPausedChargingFixedChargeLimitKey"];
  }
  double v11 = [(PLBatteryUIResponseTypePausedCharging *)self smartChargingDeadline];

  double v12 = PLLogCommon();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13) {
      -[PLBatteryUIResponseTypePausedCharging result].cold.4(self);
    }

    double v12 = [(PLBatteryUIResponseTypePausedCharging *)self smartChargingDeadline];
    double v14 = [(PLBatteryUIResponseTypePausedCharging *)self resultDictionary];
    [v14 setObject:v12 forKeyedSubscript:@"PLBatteryUIScheduleOBCKey"];
  }
  else if (v13)
  {
    -[PLBatteryUIResponseTypePausedCharging result]();
  }

  double v15 = [(PLBatteryUIResponseTypePausedCharging *)self cleanEnergyChargingDeadline];

  v16 = PLLogCommon();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    if (v17) {
      -[PLBatteryUIResponseTypePausedCharging result](self);
    }

    v16 = [(PLBatteryUIResponseTypePausedCharging *)self cleanEnergyChargingDeadline];
    double v18 = [(PLBatteryUIResponseTypePausedCharging *)self resultDictionary];
    [v18 setObject:v16 forKeyedSubscript:@"PLBatteryUIScheduleCECKey"];
  }
  else if (v17)
  {
    -[PLBatteryUIResponseTypePausedCharging result]();
  }

  double v19 = [(PLBatteryUIResponseTypePausedCharging *)self resultDictionary];
  return v19;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setResponderService:(id)a3
{
}

- (PLEntry)lastSmartChargingEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastSmartChargingEntry:(id)a3
{
}

- (int)intervalStateSmartCharging
{
  return self->_intervalStateSmartCharging;
}

- (void)setIntervalStateSmartCharging:(int)a3
{
  self->_intervalStateSmartCharging = a3;
}

- (PowerUISmartChargeClient)smartChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSmartChargingClient:(id)a3
{
}

- (NSDate)smartChargingDeadline
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSmartChargingDeadline:(id)a3
{
}

- (PowerUISmartChargeClient)cleanEnergyChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCleanEnergyChargingClient:(id)a3
{
}

- (int)intervalStateCEC
{
  return self->_intervalStateCEC;
}

- (void)setIntervalStateCEC:(int)a3
{
  self->_intervalStateCEC = a3;
}

- (NSDate)cleanEnergyChargingDeadline
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCleanEnergyChargingDeadline:(id)a3
{
}

- (PLEntry)lastCameraStreamingEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastCameraStreamingEntry:(id)a3
{
}

- (BOOL)wasCameraStreaming
{
  return self->_wasCameraStreaming;
}

- (void)setWasCameraStreaming:(BOOL)a3
{
  self->_wasCameraStreaming = a3;
}

- (PLEntry)lastTLCWithCameraStreamingEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastTLCWithCameraStreamingEntry:(id)a3
{
}

- (BOOL)wasTLCWithCameraStreaming
{
  return self->_wasTLCWithCameraStreaming;
}

- (void)setWasTLCWithCameraStreaming:(BOOL)a3
{
  self->_wasTLCWithCameraStreaming = a3;
}

- (PLEntry)lastEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastEntry:(id)a3
{
}

- (int)intervalStateTLC
{
  return self->_intervalStateTLC;
}

- (void)setIntervalStateTLC:(int)a3
{
  self->_intervalStateTLC = a3;
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEnd:(id)a3
{
}

- (_PLTimeIntervalRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_PLTimeIntervalRange)a3
{
  _PLTimeIntervalRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (PLCoreStorage)storage
{
  return (PLCoreStorage *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStorage:(id)a3
{
}

- (BOOL)isFixedCharge
{
  return self->_isFixedCharge;
}

- (void)setIsFixedCharge:(BOOL)a3
{
  self->_isFixedCharge = a3;
}

- (int)intervalStateFixedCharging
{
  return self->_intervalStateFixedCharging;
}

- (void)setIntervalStateFixedCharging:(int)a3
{
  self->_intervalStateFixedCharging = a3;
}

- (NSNumber)fixedChargingLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFixedChargingLimit:(id)a3
{
}

- (int)intervalStateChargingSpeed
{
  return self->_intervalStateChargingSpeed;
}

- (void)setIntervalStateChargingSpeed:(int)a3
{
  self->_intervalStateChargingSpeed = a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (BOOL)externalConnected
{
  return self->_externalConnected;
}

- (void)setExternalConnected:(BOOL)a3
{
  self->_externalConnected = a3;
}

- (NSNumber)currentChargeLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentChargeLevel:(id)a3
{
}

- (PLEntry)lastConnectedEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastConnectedEntry:(id)a3
{
}

- (NSString)chargingStateIntervalsEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setChargingStateIntervalsEntryKey:(id)a3
{
}

- (int)pausedChargingState
{
  return self->_pausedChargingState;
}

- (void)setPausedChargingState:(int)a3
{
  self->_pausedChargingState = a3;
}

- (NSMutableDictionary)resultDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResultDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_chargingStateIntervalsEntryKey, 0);
  objc_storeStrong((id *)&self->_lastConnectedEntry, 0);
  objc_storeStrong((id *)&self->_currentChargeLevel, 0);
  objc_storeStrong((id *)&self->_fixedChargingLimit, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_lastEntry, 0);
  objc_storeStrong((id *)&self->_lastTLCWithCameraStreamingEntry, 0);
  objc_storeStrong((id *)&self->_lastCameraStreamingEntry, 0);
  objc_storeStrong((id *)&self->_cleanEnergyChargingDeadline, 0);
  objc_storeStrong((id *)&self->_cleanEnergyChargingClient, 0);
  objc_storeStrong((id *)&self->_smartChargingDeadline, 0);
  objc_storeStrong((id *)&self->_smartChargingClient, 0);
  objc_storeStrong((id *)&self->_lastSmartChargingEntry, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)configureState:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Entry discharging", v2, v3, v4, v5, v6);
}

- (void)configureState:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open Fixed Limit Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open Slow Charging Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 smartChargingDeadline];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4220000, v2, v3, "Smart Charge Deadline: %@", v4, v5, v6, v7, v8);
}

- (void)configureState:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Smart Charge Deadline Error: %@", v2, v3, v4, v5, v6);
}

- (void)configureState:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open Smart Charging Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:(void *)a1 .cold.7(void *a1)
{
  uint64_t v1 = [a1 cleanEnergyChargingDeadline];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4220000, v2, v3, "Clean Energy Charge Deadline: %@", v4, v5, v6, v7, v8);
}

- (void)configureState:.cold.8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Clean Energy Charge Deadline Error: %@", v1, 0xCu);
}

- (void)configureState:.cold.9()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open Clean Energy Charging Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configureState:.cold.11()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open TLC Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:.cold.12()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No External Connected Entry exists in last 24hrs", v2, v3, v4, v5, v6);
}

- (void)configureState:.cold.13()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Open External Connected Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:.cold.14()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  _os_log_debug_impl(&dword_1E4220000, v0, OS_LOG_TYPE_DEBUG, "start: %f, end: %f", v1, 0x16u);
}

- (void)configureState:.cold.15()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Closed External Connected Entry", v2, v3, v4, v5, v6);
}

- (void)configureState:(void *)a1 .cold.16(void *a1)
{
  uint64_t v1 = [a1 lastConnectedEntry];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4220000, v2, v3, "Connected Entry:%@", v4, v5, v6, v7, v8);
}

- (void)configureState:.cold.17()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_0();
  _os_log_debug_impl(&dword_1E4220000, v0, OS_LOG_TYPE_DEBUG, "Converted values to doubles: start: %f and end: %f", v1, 0x16u);
}

- (void)configureState:(void *)a1 .cold.18(void *a1)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:@"timestamp"];
  uint64_t v3 = [a1 objectForKeyedSubscript:@"timestampEnd"];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1E4220000, v4, v5, "Last entry was opened at %@ and closed at %@", v6, v7, v8, v9, v10);
}

- (void)configureState:.cold.19()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Entry: %@", v2, v3, v4, v5, v6);
}

- (void)configure:(void *)a1 .cold.1(void *a1)
{
  [a1 intervalStateTLC];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "TLC Interval State set to: %d", v3, v4, v5, v6, v7);
}

- (void)configure:(void *)a1 .cold.2(void *a1)
{
  [a1 intervalStateCEC];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Clean Energy Charging Interval State set to: %d", v3, v4, v5, v6, v7);
}

- (void)configure:(void *)a1 .cold.3(void *a1)
{
  [a1 intervalStateSmartCharging];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Smart Charging Interval State set to: %d", v3, v4, v5, v6, v7);
}

- (void)configure:(void *)a1 .cold.4(void *a1)
{
  [a1 intervalStateChargingSpeed];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Interval State Charging Speed State set to: %d", v3, v4, v5, v6, v7);
}

- (void)configure:(void *)a1 .cold.5(void *a1)
{
  [a1 intervalStateFixedCharging];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1E4220000, v1, v2, "Fixed Charging Interval State set to: %d", v3, v4, v5, v6, v7);
}

- (void)result
{
  uint64_t v1 = [a1 smartChargingDeadline];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_1E4220000, v2, v3, "Adding Smart Charge Deadline to response: %@", v4, v5, v6, v7, v8);
}

@end