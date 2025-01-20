@interface PBBridgeResponsePerformanceMonitor
+ (id)shareMonitor;
- (NSArray)remoteMeasurements;
- (NSDictionary)remoteMacroActivities;
- (NSDictionary)remoteMilestones;
- (NSMutableArray)measurements;
- (NSMutableDictionary)macroActivities;
- (NSMutableDictionary)milestones;
- (NSMutableString)logBuffer;
- (double)endMacroActivity:(id)a3 beginTime:(double)a4;
- (void)_logLocalMeasurements:(BOOL)a3;
- (void)_logMacroActivitiesLocal:(BOOL)a3;
- (void)_logMeasurements;
- (void)_logMilestones;
- (void)addMeasurement:(double)a3 timeSent:(double)a4 activityType:(id)a5 activityIdentifier:(id)a6;
- (void)addMilestone:(double)a3 activityType:(id)a4 activityIdentifier:(id)a5;
- (void)beginMacroActivity:(id)a3 beginTime:(double)a4;
- (void)beginMonitorTransaction;
- (void)endMonitorTransaction;
- (void)setLogBuffer:(id)a3;
- (void)setRemoteMacroActivities:(id)a3;
- (void)setRemoteMeasurements:(id)a3;
- (void)setRemoteMilestones:(id)a3;
@end

@implementation PBBridgeResponsePerformanceMonitor

+ (id)shareMonitor
{
  if (shareMonitor_onceToken != -1) {
    dispatch_once(&shareMonitor_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)shareMonitor___shareMonitor;
  return v2;
}

uint64_t __50__PBBridgeResponsePerformanceMonitor_shareMonitor__block_invoke()
{
  shareMonitor___shareMonitor = objc_alloc_init(PBBridgeResponsePerformanceMonitor);
  return MEMORY[0x270F9A758]();
}

- (void)beginMonitorTransaction
{
  if (!self->_measurements)
  {
    v3 = [MEMORY[0x263EFF980] array];
    measurements = self->_measurements;
    self->_measurements = v3;
  }
  if (!self->_macroActivities)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    macroActivities = self->_macroActivities;
    self->_macroActivities = v5;
  }
  if (!self->_milestones)
  {
    self->_milestones = [MEMORY[0x263EFF9A0] dictionary];
    MEMORY[0x270F9A758]();
  }
}

- (void)endMonitorTransaction
{
  v3 = [MEMORY[0x263F089D8] string];
  logBuffer = self->_logBuffer;
  self->_logBuffer = v3;

  [(PBBridgeResponsePerformanceMonitor *)self _logMeasurements];
  [(PBBridgeResponsePerformanceMonitor *)self _logMacroActivitiesLocal:1];
  if (self->_remoteMacroActivities) {
    [(PBBridgeResponsePerformanceMonitor *)self _logMacroActivitiesLocal:0];
  }
  if (!self->_remoteMilestones) {
    [(PBBridgeResponsePerformanceMonitor *)self _logMilestones];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Pair-Performance-Report-%f.txt", CFAbsoluteTimeGetCurrent());
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableString *)self->_logBuffer writeToFile:v5 atomically:1 encoding:4 error:0];
  [(NSMutableArray *)self->_measurements removeAllObjects];
  [(NSMutableDictionary *)self->_macroActivities removeAllObjects];
  [(NSMutableDictionary *)self->_milestones removeAllObjects];
}

- (void)_logLocalMeasurements:(BOOL)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  v4 = @"Remote";
  if (a3)
  {
    v4 = @"Local";
    uint64_t v5 = 8;
  }
  else
  {
    uint64_t v5 = 32;
  }
  if (a3) {
    uint64_t v6 = 40;
  }
  else {
    uint64_t v6 = 16;
  }
  v7 = v4;
  id v8 = *(id *)((char *)&self->super.isa + v5);
  id v128 = *(id *)((char *)&self->super.isa + v6);
  if ([v8 count])
  {
    PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v9, v10, v11, v12, v13, v14, v115);
    uint64_t v122 = (uint64_t)v7;
    PBBAddToBufferAndLog(self->_logBuffer, @"Statistics for %@ Pairing Run:", v15, v16, v17, v18, v19, v20, (uint64_t)v7);
    PBBAddToBufferAndLog(self->_logBuffer, @"\tActivity, Identifier, RTT, OWD, LocalMessageSentTime", v21, v22, v23, v24, v25, v26, v116);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v121 = v8;
    id obj = v8;
    uint64_t v27 = [obj countByEnumeratingWithState:&v130 objects:v134 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v129 = 0;
      uint64_t v126 = 0;
      v127 = 0;
      v29 = 0;
      v30 = 0;
      v124 = 0;
      uint64_t v125 = *(void *)v131;
      double v31 = 0.0;
      double v32 = 0.0;
      double v33 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v131 != v125) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          v36 = [v35 identifier];
          v37 = [v128 objectForKey:v36];

          if (v37)
          {
            [v37 timeEnded];
            double v39 = v38;
            [v35 timeStarted];
            double v41 = v39 - v40;
            [v124 timeDelta];
            if (v41 > v42)
            {
              [v37 setTimeDelta:v41];
              id v43 = v37;

              v124 = v43;
            }
            if (!v30 || ([v30 timeDelta], v41 < v44))
            {
              [v37 setTimeDelta:v41];
              id v45 = v37;

              v30 = v45;
            }
            double v32 = v32 + v41;
            ++v129;
          }
          v46 = self;
          logBuffer = self->_logBuffer;
          v48 = [v35 activityType];
          uint64_t v49 = [v35 identifier];
          [v35 timeDelta];
          [v35 timeStarted];
          PBBAddToBufferAndLog(logBuffer, @"\t%@, %@, %f, %f, %f", v50, v51, v52, v53, v54, v55, (uint64_t)v48);

          v56 = [v35 activityType];
          LOBYTE(v49) = [v56 isEqualToString:@"PBBGMessageIDTellGizmoToUpdateProgressState"];

          if (v49)
          {
            self = v46;
          }
          else
          {
            [v35 timeDelta];
            double v58 = v57;
            id v59 = v127;
            [v127 timeDelta];
            if (v58 > v60)
            {
              id v61 = v35;

              id v59 = v61;
            }
            self = v46;
            v127 = v59;
            if (!v29 || ([v29 timeDelta], v58 < v62))
            {
              id v63 = v35;

              v29 = v63;
            }
            ++v126;
            [v35 timeDelta];
            double v33 = v33 + v64;
          }
          [v35 timeDelta];
          double v31 = v31 + v65;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v130 objects:v134 count:16];
      }
      while (v28);
    }
    else
    {
      uint64_t v129 = 0;
      v127 = 0;
      v29 = 0;
      v124 = 0;
      v30 = 0;
    }

    PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v66, v67, v68, v69, v70, v71, v117);
    PBBAddToBufferAndLog(self->_logBuffer, @"Round-Trip Delay Time", v72, v73, v74, v75, v76, v77, v118);
    v7 = (__CFString *)v122;
    if (v127) {
      PBBAddToBufferAndLog(self->_logBuffer, @"Longest %@ RTT Measurement: %@", v78, v79, v80, v81, v82, v83, v122);
    }
    if (v29) {
      PBBAddToBufferAndLog(self->_logBuffer, @"Shortest %@ RTT Measurement: %@", v78, v79, v80, v81, v82, v83, v122);
    }
    v84 = self->_logBuffer;
    [obj count];
    [obj count];
    PBBAddToBufferAndLog(v84, @"Average %@ RTT: %f (Total %f across %d runs).", v85, v86, v87, v88, v89, v90, v122);
    PBBAddToBufferAndLog(self->_logBuffer, @"(Without Sync Messages) Average %@ RTT: %f (Total %f across %d runs).", v91, v92, v93, v94, v95, v96, v122);
    id v8 = v121;
    if (v129)
    {
      PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v97, v98, v99, v100, v101, v102, v119);
      PBBAddToBufferAndLog(self->_logBuffer, @"One-Way Delay Time (Only correct if time sync is accurate)", v103, v104, v105, v106, v107, v108, v120);
      if (v124) {
        PBBAddToBufferAndLog(self->_logBuffer, @"Longest %@ OWD Measurement: %@", v109, v110, v111, v112, v113, v114, v122);
      }
      if (v30) {
        PBBAddToBufferAndLog(self->_logBuffer, @"Shortest %@ OWD Measurement: %@", v109, v110, v111, v112, v113, v114, v122);
      }
      PBBAddToBufferAndLog(self->_logBuffer, @"Average %@ OWD Time: %f (Total %f across %d runs).", v109, v110, v111, v112, v113, v114, v122);
    }
  }
}

- (void)_logMeasurements
{
  [(PBBridgeResponsePerformanceMonitor *)self _logLocalMeasurements:1];
  if (self->_remoteMeasurements)
  {
    [(PBBridgeResponsePerformanceMonitor *)self _logLocalMeasurements:0];
  }
}

- (void)_logMacroActivitiesLocal:(BOOL)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v4 = @"Remote";
  if (a3)
  {
    v4 = @"Local";
    uint64_t v5 = 24;
  }
  else
  {
    uint64_t v5 = 48;
  }
  uint64_t v6 = v4;
  id v7 = *(id *)((char *)&self->super.isa + v5);
  if ([v7 count])
  {
    PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v8, v9, v10, v11, v12, v13, v40);
    double v42 = v6;
    PBBAddToBufferAndLog(self->_logBuffer, @"Other %@ Activities: ", v14, v15, v16, v17, v18, v19, (uint64_t)v6);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v20 = [v7 allValues];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          logBuffer = self->_logBuffer;
          uint64_t v27 = [v25 activityType];
          [v25 timeDelta];
          PBBAddToBufferAndLog(logBuffer, @"\t Activity: %@ time: %f", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v22);
    }

    PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v34, v35, v36, v37, v38, v39, v41);
    uint64_t v6 = v42;
  }
}

- (void)_logMilestones
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if ([(NSMutableDictionary *)self->_milestones count])
  {
    PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v3, v4, v5, v6, v7, v8, v36);
    PBBAddToBufferAndLog(self->_logBuffer, @"Local Milestones: ", v9, v10, v11, v12, v13, v14, v37);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v15 = [(NSMutableDictionary *)self->_milestones allValues];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          logBuffer = self->_logBuffer;
          uint64_t v22 = [v20 activityType];
          uint64_t v23 = [v20 identifier];
          [v20 timeEnded];
          PBBAddToBufferAndLog(logBuffer, @"\t Milestone: %@ (%@) time ended: %f", v24, v25, v26, v27, v28, v29, (uint64_t)v22);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v17);
    }

    PBBAddToBufferAndLog(self->_logBuffer, &stru_26CC94B60, v30, v31, v32, v33, v34, v35, v38);
  }
}

- (void)addMeasurement:(double)a3 timeSent:(double)a4 activityType:(id)a5 activityIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  [(PBBridgeResponsePerformanceMonitor *)self beginMonitorTransaction];
  uint64_t v12 = objc_alloc_init(PBBProtoPerformanceResult);
  [(PBBProtoPerformanceResult *)v12 setTimeDelta:a3];
  [(PBBProtoPerformanceResult *)v12 setTimeStarted:a4];
  [(PBBProtoPerformanceResult *)v12 setActivityType:v11];

  [(PBBProtoPerformanceResult *)v12 setIdentifier:v10];
  [(NSMutableArray *)self->_measurements addObject:v12];
}

- (void)addMilestone:(double)a3 activityType:(id)a4 activityIdentifier:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  [(PBBridgeResponsePerformanceMonitor *)self beginMonitorTransaction];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(PBBProtoPerformanceResult);
    [(PBBProtoPerformanceResult *)v9 setTimeEnded:a3];
    [(PBBProtoPerformanceResult *)v9 setActivityType:v10];
    [(PBBProtoPerformanceResult *)v9 setIdentifier:v8];
    [(NSMutableDictionary *)self->_milestones setObject:v9 forKey:v8];
  }
}

- (void)beginMacroActivity:(id)a3 beginTime:(double)a4
{
  id v7 = a3;
  [(PBBridgeResponsePerformanceMonitor *)self beginMonitorTransaction];
  if (v7)
  {
    uint64_t v6 = objc_alloc_init(PBBProtoPerformanceResult);
    [(PBBProtoPerformanceResult *)v6 setTimeStarted:a4];
    [(PBBProtoPerformanceResult *)v6 setActivityType:v7];
    [(PBBProtoPerformanceResult *)v6 setIdentifier:&stru_26CC94B60];
    [(NSMutableDictionary *)self->_macroActivities setObject:v6 forKey:v7];
  }
}

- (double)endMacroActivity:(id)a3 beginTime:(double)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_macroActivities objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    [v7 setTimeEnded:a4];
    [v8 timeEnded];
    double v10 = v9;
    [v8 timeStarted];
    double v12 = v10 - v11;
    [v8 setTimeDelta:v12];
    [(NSMutableDictionary *)self->_macroActivities setObject:v8 forKey:v6];
  }
  else
  {
    uint64_t v13 = pbb_shared_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_21C445000, v13, OS_LOG_TYPE_DEFAULT, "Tried to end un-started Activity (%@)", (uint8_t *)&v15, 0xCu);
    }

    double v12 = -1.0;
  }

  return v12;
}

- (NSMutableArray)measurements
{
  return self->_measurements;
}

- (NSMutableDictionary)milestones
{
  return self->_milestones;
}

- (NSMutableDictionary)macroActivities
{
  return self->_macroActivities;
}

- (NSArray)remoteMeasurements
{
  return self->_remoteMeasurements;
}

- (void)setRemoteMeasurements:(id)a3
{
}

- (NSDictionary)remoteMilestones
{
  return self->_remoteMilestones;
}

- (void)setRemoteMilestones:(id)a3
{
}

- (NSDictionary)remoteMacroActivities
{
  return self->_remoteMacroActivities;
}

- (void)setRemoteMacroActivities:(id)a3
{
}

- (NSMutableString)logBuffer
{
  return self->_logBuffer;
}

- (void)setLogBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logBuffer, 0);
  objc_storeStrong((id *)&self->_remoteMacroActivities, 0);
  objc_storeStrong((id *)&self->_remoteMilestones, 0);
  objc_storeStrong((id *)&self->_remoteMeasurements, 0);
  objc_storeStrong((id *)&self->_macroActivities, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
}

@end