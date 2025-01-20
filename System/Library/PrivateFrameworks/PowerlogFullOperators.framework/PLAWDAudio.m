@interface PLAWDAudio
+ (id)entryAggregateDefinitionAwdAudio;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (NSDate)startTime;
- (PLEntryNotificationOperatorComposition)audioRailCallback;
- (void)finalizeAudioTable;
- (void)handleAudioRailCallback:(id)a3;
- (void)resetAudioTable;
- (void)setAudioRailCallback:(id)a3;
- (void)setStartTime:(id)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDAudio

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdAudio;
  if (!plAwdAudio)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDAudio alloc] initWithOperator:v4];

    v6 = (void *)plAwdAudio;
    plAwdAudio = (uint64_t)v5;

    v3 = (void *)plAwdAudio;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"AudioMetrics";
  v2 = [a1 entryAggregateDefinitionAwdAudio];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionAwdAudio
{
  v28[4] = *MEMORY[0x263EF8340];
  v27[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v25[0] = *MEMORY[0x263F5F880];
  v25[1] = v2;
  v26[0] = &unk_26E5466E0;
  v26[1] = MEMORY[0x263EFFA80];
  v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v17;
  v27[1] = *MEMORY[0x263F5F870];
  v23[0] = @"AudioRouting";
  v16 = [MEMORY[0x263F5F650] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v24[0] = v15;
  v23[1] = @"AudioVolume";
  v14 = [MEMORY[0x263F5F650] sharedInstance];
  v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v24[1] = v3;
  v23[2] = @"AudioPower";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v24[2] = v5;
  v23[3] = @"AudioTime";
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v24[3] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  v28[1] = v8;
  v27[2] = *MEMORY[0x263F5F828];
  v21 = &unk_26E5466F0;
  uint64_t v19 = *MEMORY[0x263F5F820];
  v20 = &unk_26E5466F0;
  v9 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v28[2] = v10;
  v27[3] = *MEMORY[0x263F5F830];
  v18[0] = @"AudioTime";
  v18[1] = @"AudioPower";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v28[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];

  return v12;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  if ([v4 longValue] == 2031626)
  {
    [(PLAWDAudio *)self resetAudioTable];
    v5 = [MEMORY[0x263EFF910] monotonicDate];
    [(PLAWDAudio *)self setStartTime:v5];
  }
  id v6 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v6 addObject:v4];
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  if ([v4 longValue] == 2031626) {
    [(PLAWDAudio *)self setAudioRailCallback:0];
  }
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  id v6 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    v8 = (void *)plAwdAudio;
    plAwdAudio = 0;

    [(PLAWDAudio *)self setAudioRailCallback:0];
  }
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  if (v8)
  {
    v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    v10 = [MEMORY[0x263EFF910] monotonicDate];
    [v9 timeIntervalSince1970];
    double v12 = v11;
    [v10 timeIntervalSince1970];
    double v14 = v13;

    if ([v6 longValue] == 2031626)
    {
      [(PLAWDAudio *)self finalizeAudioTable];
      uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AudioMetrics"];
      v16 = [(PLAWDAuxMetrics *)self operator];
      v17 = [v16 storage];
      v58 = (void *)v15;
      uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14 - v12);

      v63 = (void *)v18;
      uint64_t v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
      v20 = objc_opt_new();
      v62 = v20;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v21 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__PLAWDAudio_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v21;
        if (submitDataToAWDServer_withAwdConn__defaultOnce_3 != -1) {
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_3, block);
        }
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled_3)
        {
          v22 = [NSString stringWithFormat:@"results=%@\naggregatedResults=%@", v18, v19];
          v23 = (void *)MEMORY[0x263F5F638];
          v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m"];
          v25 = [v24 lastPathComponent];
          v26 = [NSString stringWithUTF8String:"-[PLAWDAudio submitDataToAWDServer:withAwdConn:]"];
          [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:131];

          v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          v20 = v62;
        }
      }
      v59 = v8;
      v60 = self;
      id v61 = v7;
      v72[0] = 0;
      v72[1] = 0;
      int v73 = 0;
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id obj = v19;
      uint64_t v28 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      if (!v28)
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v64 = 0;
        goto LABEL_25;
      }
      uint64_t v29 = v28;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v64 = 0;
      uint64_t v32 = *(void *)v67;
      while (1)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v67 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v35 = [v34 objectForKeyedSubscript:@"AudioRouting"];
          [v35 doubleValue];
          double v37 = v36;

          if (v37 == 2.0)
          {
            v38 = [v34 objectForKeyedSubscript:@"AudioTime"];
            [v38 doubleValue];
            uint64_t v30 = (v39 + (double)v30);

            v40 = [v34 objectForKeyedSubscript:@"AudioPower"];
            [v40 doubleValue];
            uint64_t v31 = (v41 + (double)v31);

            v42 = [v34 objectForKeyedSubscript:@"AudioVolume"];
            [v42 doubleValue];
            unsigned int v44 = (int)v43;

            v45 = [v34 objectForKeyedSubscript:@"AudioTime"];
            [v45 doubleValue];
            *((_DWORD *)v72 + v44) = v46;
          }
          else
          {
            v47 = [v34 objectForKeyedSubscript:@"AudioRouting"];
            [v47 doubleValue];
            double v49 = v48;

            if (v49 != 1.0) {
              continue;
            }
            v50 = [v34 objectForKeyedSubscript:@"AudioTime"];
            [v50 doubleValue];
            LODWORD(v64) = (v51 + (double)v64);

            v52 = [v34 objectForKeyedSubscript:@"AudioPower"];
            [v52 doubleValue];
            HIDWORD(v64) = (v53 + (double)HIDWORD(v64));

            v54 = [v34 objectForKeyedSubscript:@"AudioVolume"];
            [v54 doubleValue];

            v45 = [v34 objectForKeyedSubscript:@"AudioTime"];
            [v45 doubleValue];
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
        if (!v29)
        {
LABEL_25:

          [v62 setAudioHeadsetDuration:v30];
          [v62 setAudioHeadsetPowerMicroWatt:v31];
          [v62 setAudioSpeakerDuration:v64];
          [v62 setAudioSpeakerPowerMicroWatt:HIDWORD(v64)];
          [v62 setAudioVolumeLevelDurations:v72 count:5];
          v8 = v59;
          [v59 setMetric:v62];

          id v7 = v61;
          self = v60;
          goto LABEL_26;
        }
      }
    }
    char v55 = 0;
  }
  else
  {
LABEL_26:
    [(PLAWDAudio *)self resetAudioTable];
    v56 = [MEMORY[0x263EFF910] monotonicDate];
    [(PLAWDAudio *)self setStartTime:v56];

    char v55 = [v7 submitMetric:v8];
  }

  return v55;
}

uint64_t __48__PLAWDAudio_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_3 = result;
  return result;
}

- (void)finalizeAudioTable
{
  uint64_t v3 = *MEMORY[0x263F5F8A0];
  id v36 = [MEMORY[0x263F5F8C0] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F980]];
  id v4 = [(PLAWDAuxMetrics *)self operator];
  v5 = [v4 storage];
  id v6 = [v5 lastEntryForKey:v36];

  id v7 = [v6 objectForKeyedSubscript:@"Active"];
  LODWORD(v5) = [v7 BOOLValue];

  if (v5)
  {
    uint64_t v8 = [MEMORY[0x263F5F8C0] entryKeyForType:v3 andName:*MEMORY[0x263F5F978]];
    v9 = [(PLAWDAuxMetrics *)self operator];
    v10 = [v9 storage];
    v35 = (void *)v8;
    v34 = [v10 lastEntryForKey:v8];

    uint64_t v11 = [MEMORY[0x263F5F8C0] entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"Audio"];
    double v12 = [(PLAWDAuxMetrics *)self operator];
    double v13 = [v12 storage];
    v33 = (void *)v11;
    double v14 = [v13 lastEntryForKey:v11];

    uint64_t v15 = [MEMORY[0x263EFF910] monotonicDate];
    v16 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AudioMetrics"];
    v17 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v16];
    [v15 timeIntervalSince1970];
    double v19 = v18;
    v20 = [v14 entryDate];
    [v20 timeIntervalSince1970];
    double v22 = v19 - v21;

    v23 = [v6 objectForKeyedSubscript:@"HeadphonesConnected"];
    LOBYTE(v11) = [v23 BOOLValue];

    if (v11)
    {
      uint64_t v24 = 1;
    }
    else
    {
      v25 = [v6 objectForKeyedSubscript:@"HeadsetHasInput"];
      [v25 BOOLValue];

      uint64_t v24 = 2;
    }
    v26 = [NSNumber numberWithInt:v24];
    [v17 setObject:v26 forKeyedSubscript:@"AudioRouting"];

    v27 = NSNumber;
    uint64_t v28 = [v34 objectForKeyedSubscript:@"Volume"];
    [v28 doubleValue];
    uint64_t v30 = [v27 numberWithDouble:(v29 + -1.0) / 20.0];
    [v17 setObject:v30 forKeyedSubscript:@"AudioVolume"];

    uint64_t v31 = [NSNumber numberWithDouble:v22];
    [v17 setObject:v31 forKeyedSubscript:@"AudioTime"];

    uint64_t v32 = [(PLAWDAuxMetrics *)self operator];
    [v32 logEntry:v17];
  }
}

- (void)handleAudioRailCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F5F8A0];
  id v6 = [MEMORY[0x263F5F8C0] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F980]];
  id v7 = [(PLAWDAuxMetrics *)self operator];
  uint64_t v8 = [v7 storage];
  v9 = [v8 lastEntriesForKey:v6 count:2 withFilters:0];

  v10 = [MEMORY[0x263F5F8C0] entryKeyForType:v5 andName:*MEMORY[0x263F5F978]];
  uint64_t v11 = [(PLAWDAuxMetrics *)self operator];
  double v12 = [v11 storage];
  double v13 = [v12 lastEntriesForKey:v10 count:2 withFilters:0];

  if ((unint64_t)[v9 count] < 2 || (unint64_t)objc_msgSend(v13, "count") < 2) {
    goto LABEL_32;
  }
  v76 = v10;
  v77 = v6;
  id v78 = v4;
  double v14 = [v4 objectForKey:@"entry"];
  uint64_t v15 = [(PLAWDAuxMetrics *)self operator];
  v16 = [v15 storage];
  v17 = [v14 entryKey];
  v83 = v14;
  double v18 = objc_msgSend(v16, "entryForKey:withID:", v17, objc_msgSend(v14, "entryID") - 1);

  double v19 = [v9 objectAtIndexedSubscript:0];
  v20 = [v9 objectAtIndexedSubscript:1];
  double v21 = [v13 objectAtIndexedSubscript:0];
  double v22 = [v13 objectAtIndexedSubscript:1];
  v75 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AudioMetrics"];
  v81 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v75];
  v82 = v18;
  v23 = [v18 entryDate];
  [v23 timeIntervalSince1970];
  double v25 = v24;
  v26 = [v19 entryDate];
  [v26 timeIntervalSince1970];
  double v28 = v27;

  v79 = v19;
  int v73 = v21;
  uint64_t v74 = v20;
  if (v25 >= v28)
  {
    id v37 = v19;
    id v80 = v22;
    if (![MEMORY[0x263F5F640] debugEnabled]) {
      goto LABEL_19;
    }
    uint64_t v38 = objc_opt_class();
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = __38__PLAWDAudio_handleAudioRailCallback___block_invoke_64;
    v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v85[4] = v38;
    if (handleAudioRailCallback__defaultOnce_62 != -1) {
      dispatch_once(&handleAudioRailCallback__defaultOnce_62, v85);
    }
    if (!handleAudioRailCallback__classDebugEnabled_63) {
      goto LABEL_19;
    }
    uint64_t v31 = [NSString stringWithFormat:@"Output changed"];
    double v39 = (void *)MEMORY[0x263F5F638];
    v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m"];
    double v41 = [v40 lastPathComponent];
    v42 = [NSString stringWithUTF8String:"-[PLAWDAudio handleAudioRailCallback:]"];
    [v39 logMessage:v31 fromFile:v41 fromFunction:v42 fromLineNumber:238];

    id v36 = PLLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[PLAWDDisplay startMetricCollection:]();
    }
  }
  else
  {
    id v29 = v20;
    id v80 = v21;
    if (![MEMORY[0x263F5F640] debugEnabled]) {
      goto LABEL_18;
    }
    uint64_t v30 = objc_opt_class();
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __38__PLAWDAudio_handleAudioRailCallback___block_invoke;
    v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v86[4] = v30;
    if (handleAudioRailCallback__defaultOnce != -1) {
      dispatch_once(&handleAudioRailCallback__defaultOnce, v86);
    }
    if (!handleAudioRailCallback__classDebugEnabled)
    {
LABEL_18:
      id v37 = v29;
      goto LABEL_19;
    }
    uint64_t v31 = [NSString stringWithFormat:@"Routing changed"];
    uint64_t v32 = (void *)MEMORY[0x263F5F638];
    v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m"];
    v34 = [v33 lastPathComponent];
    v35 = [NSString stringWithUTF8String:"-[PLAWDAudio handleAudioRailCallback:]"];
    [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:234];

    id v36 = PLLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[PLAWDDisplay startMetricCollection:]();
    }
    id v37 = v29;
  }

LABEL_19:
  double v43 = [v83 entryDate];
  [v43 timeIntervalSince1970];
  double v45 = v44;
  uint64_t v46 = [v82 entryDate];
  v47 = [(PLAWDAudio *)self startTime];
  double v48 = [(id)v46 laterDate:v47];
  [v48 timeIntervalSince1970];
  double v50 = v49;

  double v51 = [v37 objectForKeyedSubscript:@"HeadphonesConnected"];
  LOBYTE(v46) = [v51 BOOLValue];

  if (v46)
  {
    uint64_t v52 = 1;
  }
  else
  {
    double v53 = [v37 objectForKeyedSubscript:@"HeadsetHasInput"];
    [v53 BOOLValue];

    uint64_t v52 = 2;
  }
  v54 = [v37 objectForKeyedSubscript:@"Active"];
  int v55 = [v54 BOOLValue];

  v56 = v79;
  if (v55)
  {
    v57 = [NSNumber numberWithInt:v52];
    [v81 setObject:v57 forKeyedSubscript:@"AudioRouting"];

    v58 = NSNumber;
    v59 = [v80 objectForKeyedSubscript:@"Volume"];
    [v59 doubleValue];
    id v61 = [v58 numberWithDouble:(v60 + -1.0) / 20.0];
    [v81 setObject:v61 forKeyedSubscript:@"AudioVolume"];

    v62 = [NSNumber numberWithDouble:v45 - v50];
    [v81 setObject:v62 forKeyedSubscript:@"AudioTime"];

    v63 = [(PLAWDAuxMetrics *)self operator];
    [v63 logEntry:v81];
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v64 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__PLAWDAudio_handleAudioRailCallback___block_invoke_70;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v64;
    if (handleAudioRailCallback__defaultOnce_68 != -1) {
      dispatch_once(&handleAudioRailCallback__defaultOnce_68, block);
    }
    if (handleAudioRailCallback__classDebugEnabled_69)
    {
      v65 = NSString;
      long long v66 = [v79 objectForKeyedSubscript:@"Active"];
      long long v67 = [v65 stringWithFormat:@"No update required, currActive = %@\nAudio writes: %@\n%@\n-------------", v66, v81, v37, v73, v74];

      long long v68 = (void *)MEMORY[0x263F5F638];
      long long v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m"];
      v70 = [v69 lastPathComponent];
      v71 = [NSString stringWithUTF8String:"-[PLAWDAudio handleAudioRailCallback:]"];
      [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:258];

      v72 = PLLogCommon();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }

      v56 = v79;
    }
  }

  id v6 = v77;
  id v4 = v78;
  v10 = v76;
LABEL_32:
}

uint64_t __38__PLAWDAudio_handleAudioRailCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleAudioRailCallback__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDAudio_handleAudioRailCallback___block_invoke_64(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleAudioRailCallback__classDebugEnabled_63 = result;
  return result;
}

uint64_t __38__PLAWDAudio_handleAudioRailCallback___block_invoke_70(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleAudioRailCallback__classDebugEnabled_69 = result;
  return result;
}

- (void)resetAudioTable
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AudioMetrics"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDAudio;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (PLEntryNotificationOperatorComposition)audioRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAudioRailCallback:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_audioRailCallback, 0);
}

@end