@interface SignpostFrameLifetimeInterval
+ (id)_frameSeedForLifetimeIntervalBegin:(id)a3;
- (BOOL)_hasDisplayID;
- (BOOL)_isLongMCT:(unint64_t)a3 expectedFrameLatency:(unsigned __int8)a4;
- (BOOL)frameLatencyIsLong;
- (BOOL)frameStallSkipRequest;
- (BOOL)hidLatencyIsLong;
- (BOOL)lifetimeIsLong;
- (BOOL)mayBeFirstFrame;
- (BOOL)renderIntervalIsLong;
- (NSArray)commits;
- (NSArray)skippedRenders;
- (NSDictionary)pidToContextInfoArrayDict;
- (NSNumber)displayIDNum;
- (NSSet)contributingPIDs;
- (SignpostContextInfo)contextInfoForHIDInput;
- (SignpostContextInfo)earliestTimeContextInfo;
- (SignpostFrameLatencyInterval)frameLatencyInterval;
- (SignpostFrameLifetimeInterval)initWithInterval:(id)a3 contextArray:(id)a4 hidLatencyInterval:(id)a5 renderInterval:(id)a6 frameLatencyInterval:(id)a7 frameSeedToSkippedRenderIntervals:(id)a8;
- (SignpostFrameLifetimeInterval)initWithInterval:(id)a3 contextArray:(id)a4 renderInterval:(id)a5 frameSeedToSkippedRenderIntervals:(id)a6;
- (SignpostFrameOverrunInterval)discrepancyFrameOverrunInactiveDisplayInterval;
- (SignpostFrameOverrunInterval)frameOverrunInactiveDisplayInterval;
- (SignpostFrameOverrunInterval)frameOverrunInterval;
- (SignpostFrameOverrunInterval)userVisibleGlitchInterval;
- (SignpostHIDLatencyInterval)hidLatencyInterval;
- (SignpostRenderServerRenderInterval)renderInterval;
- (SignpostSupportTimeInterval)previousFrameOnScreenInterval;
- (id)_glitchIntervalWithRoundingUp:(BOOL)a3 previousMCT:(unint64_t)a4;
- (id)_inProcessGlitchIntervalWithRoundingUp:(BOOL)a3 targetMCT:(unint64_t)a4 previousMCT:(unint64_t)a5;
- (id)overrunIntervalOfType:(unint64_t)a3 contributingPID:(id)a4;
- (id)overrunIntervalOfType:(unint64_t)a3 overrunClass:(unint64_t)a4 maybeFirstFrame:(BOOL)a5 contributingPID:(id)a6;
- (id)pidToContextIDtoContextFrameLifetimeDict;
- (unint64_t)_overrunBeginMCT;
- (unint64_t)displayRefreshIntervalDurationMachTime;
- (unint64_t)inProcessAnimationDisplayTargetMCT;
- (unint64_t)inProcessAnimationDisplayTargetMCTForContributingPID:(id)a3;
- (unint64_t)missedVBLCount;
- (unint64_t)previousFramePresentationMCT;
- (unint64_t)previousFramePresentationMCTForContributingPID:(id)a3;
- (unsigned)_displayID;
- (unsigned)bufferCount;
- (unsigned)frameSeed;
- (unsigned)nextFrameBufferCount;
- (unsigned)previousFrameBufferCount;
- (unsigned)swapID;
- (void)setCommits:(id)a3;
- (void)setLifetimeIsLong:(BOOL)a3;
- (void)setNextFrameBufferCount:(unsigned __int8)a3;
- (void)setPreviousFrameBufferCount:(unsigned __int8)a3;
@end

@implementation SignpostFrameLifetimeInterval

- (SignpostFrameLifetimeInterval)initWithInterval:(id)a3 contextArray:(id)a4 hidLatencyInterval:(id)a5 renderInterval:(id)a6 frameLatencyInterval:(id)a7 frameSeedToSkippedRenderIntervals:(id)a8
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v89 = a5;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v94.receiver = self;
  v94.super_class = (Class)SignpostFrameLifetimeInterval;
  v20 = [(SignpostAnimationSubInterval *)&v94 initWithInterval:v14];
  if (!v20) {
    goto LABEL_57;
  }
  v21 = [v14 beginEvent];
  v22 = [v21 _numberArgumentWithName:@"frame_seed"];

  if (!v22)
  {
    v27 = _signpost_debug_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      [(SignpostFrameLifetimeInterval *)v27 initWithInterval:v29 contextArray:v30 hidLatencyInterval:v31 renderInterval:v32 frameLatencyInterval:v33 frameSeedToSkippedRenderIntervals:v34];
    }

    goto LABEL_53;
  }
  id v84 = a7;
  v20->_frameSeed = [v22 unsignedLongLongValue];

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"));
  v24 = [v19 objectForKeyedSubscript:v23];

  v87 = v24;
  if (!v17)
  {
    if ([v24 count] == 1)
    {
      id v17 = [v24 firstObject];
      if (v17) {
        goto LABEL_4;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_14:
    if (v18)
    {
      int v35 = [v18 frameSeed];
      if (v35 != [(SignpostFrameLifetimeInterval *)v20 frameSeed])
      {
        v26 = _signpost_debug_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.6();
        }
        goto LABEL_52;
      }
    }
    if (v16)
    {
      int v36 = [v16 frameSeed];
      if (v36 != [(SignpostFrameLifetimeInterval *)v20 frameSeed])
      {
        v26 = _signpost_debug_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.5();
        }
        goto LABEL_52;
      }
    }
    v37 = [v14 beginEvent];
    v38 = [v37 _numberArgumentWithName:@"skip_request"];

    if (v38) {
      v20->_frameStallSkipRequest = [v38 unsignedLongLongValue] != 0;
    }

    v39 = [v14 beginEvent];
    v40 = [v39 _numberArgumentWithName:@"buffer_count"];

    if (!v40)
    {
      v26 = _signpost_debug_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        [(SignpostFrameLifetimeInterval *)v26 initWithInterval:v58 contextArray:v59 hidLatencyInterval:v60 renderInterval:v61 frameLatencyInterval:v62 frameSeedToSkippedRenderIntervals:v63];
      }
      goto LABEL_52;
    }
    v20->_bufferCount = [v40 unsignedLongLongValue];

    v41 = [v14 beginEvent];
    v42 = [v41 _numberArgumentWithName:@"refresh_interval"];

    if (!v42)
    {
      v26 = _signpost_debug_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        [(SignpostFrameLifetimeInterval *)v26 initWithInterval:v65 contextArray:v66 hidLatencyInterval:v67 renderInterval:v68 frameLatencyInterval:v69 frameSeedToSkippedRenderIntervals:v70];
      }
      goto LABEL_52;
    }
    v20->_displayRefreshIntervalDurationMachTime = [v42 unsignedLongLongValue];

    v43 = [v14 endEvent];
    v44 = [v43 _numberArgumentWithName:@"prev_frame"];

    if (v44) {
      v20->_previousFramePresentationMCT = [v44 unsignedLongLongValue];
    }

    v45 = [v14 beginEvent];
    v46 = [v45 _numberArgumentWithName:@"presentation_modifier_display_target_mct"];
    v20->_inProcessAnimationDisplayTargetMCT = [v46 unsignedLongLongValue];

    if (v15)
    {
      id v80 = v19;
      id v81 = v18;
      v86 = v16;
      v88 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v82 = v15;
      id obj = v15;
      uint64_t v47 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        v26 = 0;
        uint64_t v85 = *(void *)v91;
        while (2)
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v91 != v85) {
              objc_enumerationMutation(obj);
            }
            v50 = *(void **)(*((void *)&v90 + 1) + 8 * i);
            int v51 = [v50 frameSeed];
            if (v51 != [(SignpostFrameLifetimeInterval *)v20 frameSeed])
            {
              v71 = _signpost_debug_log();
              id v16 = v86;
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
                -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.4();
              }

              id v18 = v81;
              id v15 = v82;
              id v19 = v80;
              goto LABEL_52;
            }
            v52 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v50, "pid"));
            v53 = [(NSDictionary *)v88 objectForKeyedSubscript:v52];
            if (!v53)
            {
              v53 = [MEMORY[0x1E4F1CA48] array];
              [(NSDictionary *)v88 setObject:v53 forKeyedSubscript:v52];
            }
            [v53 addObject:v50];
            if (!v26 || (unint64_t v54 = [v50 earliestMCT], v54 < -[NSObject earliestMCT](v26, "earliestMCT")))
            {
              v55 = v50;

              v26 = v55;
            }
            uint64_t v56 = [v50 earliestMCT];
            if (v56 == [v86 startMachContinuousTime]) {
              objc_storeStrong((id *)&v20->_contextInfoForHIDInput, v50);
            }
          }
          uint64_t v48 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
          if (v48) {
            continue;
          }
          break;
        }
      }
      else
      {
        v26 = 0;
      }

      earliestTimeContextInfo = v20->_earliestTimeContextInfo;
      v20->_earliestTimeContextInfo = (SignpostContextInfo *)v26;
      v74 = v26;

      pidToContextInfoArrayDict = v20->_pidToContextInfoArrayDict;
      v20->_pidToContextInfoArrayDict = v88;

      id v18 = v81;
      id v15 = v82;
      id v16 = v86;
      v24 = v87;
      id v19 = v80;
    }
    objc_storeStrong((id *)&v20->_hidLatencyInterval, v89);
    objc_storeStrong((id *)&v20->_renderInterval, v17);
    objc_storeStrong((id *)&v20->_frameLatencyInterval, v84);
    v20->_swapID = [v14 signpostId];
    v76 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"));
    uint64_t v77 = [v19 objectForKeyedSubscript:v76];
    skippedRenders = v20->_skippedRenders;
    v20->_skippedRenders = (NSArray *)v77;

LABEL_57:
    v72 = v20;
    goto LABEL_58;
  }
LABEL_4:
  int v25 = [v17 frameSeed];
  if (v25 == [(SignpostFrameLifetimeInterval *)v20 frameSeed]) {
    goto LABEL_14;
  }
  v26 = _signpost_debug_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.7();
  }
LABEL_52:

LABEL_53:
  v72 = 0;
LABEL_58:

  return v72;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (BOOL)frameLatencyIsLong
{
  v3 = [(SignpostFrameLifetimeInterval *)self frameLatencyInterval];

  if (!v3) {
    return 0;
  }
  if ([(SignpostFrameLifetimeInterval *)self bufferCount] < 2) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [(SignpostFrameLifetimeInterval *)self bufferCount] - 1;
  }
  v6 = [(SignpostFrameLifetimeInterval *)self frameLatencyInterval];
  BOOL v7 = -[SignpostFrameLifetimeInterval _isLongMCT:expectedFrameLatency:](self, "_isLongMCT:expectedFrameLatency:", [v6 durationMachContinuousTime], v4);

  return v7;
}

- (unsigned)bufferCount
{
  return self->_bufferCount;
}

- (SignpostFrameLatencyInterval)frameLatencyInterval
{
  return self->_frameLatencyInterval;
}

+ (id)_frameSeedForLifetimeIntervalBegin:(id)a3
{
  return (id)[a3 _numberArgumentWithName:@"frame_seed"];
}

- (SignpostHIDLatencyInterval)hidLatencyInterval
{
  return self->_hidLatencyInterval;
}

- (BOOL)_isLongMCT:(unint64_t)a3 expectedFrameLatency:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unint64_t v7 = (unint64_t)(float)((float)[(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime]* 1.1);
  return v7
       + [(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime]* v4 < a3;
}

- (unint64_t)displayRefreshIntervalDurationMachTime
{
  return self->_displayRefreshIntervalDurationMachTime;
}

- (SignpostFrameLifetimeInterval)initWithInterval:(id)a3 contextArray:(id)a4 renderInterval:(id)a5 frameSeedToSkippedRenderIntervals:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 beginEvent];
  id v15 = [v14 _numberArgumentWithName:@"frame_seed"];

  if (v15)
  {
    id v45 = v13;
    id v46 = v11;
    uint64_t v16 = [v15 unsignedLongLongValue];
    uint64_t v17 = [v10 signpostId];
    id v18 = [v10 beginEvent];
    id v19 = [v18 _numberArgumentWithName:@"input_time"];

    if (v19)
    {
      v20 = [SignpostHIDLatencyInterval alloc];
      uint64_t v21 = [v19 unsignedLongLongValue];
      uint64_t v22 = [v10 endMachContinuousTime];
      [v10 timebaseRatio];
      v23 = -[SignpostHIDLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:](v20, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:", v21, v22, v17, v16);
    }
    else
    {
      v23 = 0;
    }

    uint64_t v32 = [SignpostFrameLatencyInterval alloc];
    uint64_t v33 = [v12 endMachContinuousTime];
    uint64_t v34 = [v10 endMachContinuousTime];
    [v10 timebaseRatio];
    int v35 = -[SignpostFrameLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:](v32, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:", v33, v34, v17, v16, 0, 0);
    if (v35)
    {
      id v13 = v45;
      id v11 = v46;
      self = [(SignpostFrameLifetimeInterval *)self initWithInterval:v10 contextArray:v46 hidLatencyInterval:v23 renderInterval:v12 frameLatencyInterval:v35 frameSeedToSkippedRenderIntervals:v45];
      uint64_t v31 = self;
    }
    else
    {
      int v36 = _signpost_debug_log();
      id v13 = v45;
      id v11 = v46;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[SignpostFrameLifetimeInterval initWithInterval:contextArray:renderInterval:frameSeedToSkippedRenderIntervals:](v36, v37, v38, v39, v40, v41, v42, v43);
      }

      uint64_t v31 = 0;
    }
  }
  else
  {
    v23 = _signpost_debug_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[SignpostFrameLifetimeInterval initWithInterval:contextArray:renderInterval:frameSeedToSkippedRenderIntervals:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
    uint64_t v31 = 0;
  }

  return v31;
}

- (void)setLifetimeIsLong:(BOOL)a3
{
  self->_lifetimeIsLong = a3;
}

- (void)setPreviousFrameBufferCount:(unsigned __int8)a3
{
  self->_previousFrameBufferCount = a3;
}

- (BOOL)lifetimeIsLong
{
  return self->_lifetimeIsLong;
}

- (void)setNextFrameBufferCount:(unsigned __int8)a3
{
  self->_nextFrameBufferCount = a3;
}

- (BOOL)hidLatencyIsLong
{
  v3 = [(SignpostFrameLifetimeInterval *)self hidLatencyInterval];

  if (!v3) {
    return 0;
  }
  unsigned int v4 = [(SignpostFrameLifetimeInterval *)self hidLatencyInterval];
  BOOL v5 = -[SignpostFrameLifetimeInterval _isLongMCT:expectedFrameLatency:](self, "_isLongMCT:expectedFrameLatency:", [v4 durationMachContinuousTime], -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commits, 0);
  objc_storeStrong((id *)&self->_contextInfoForHIDInput, 0);
  objc_storeStrong((id *)&self->_earliestTimeContextInfo, 0);
  objc_storeStrong((id *)&self->_frameLatencyInterval, 0);
  objc_storeStrong((id *)&self->_skippedRenders, 0);
  objc_storeStrong((id *)&self->_renderInterval, 0);
  objc_storeStrong((id *)&self->_hidLatencyInterval, 0);

  objc_storeStrong((id *)&self->_pidToContextInfoArrayDict, 0);
}

- (BOOL)renderIntervalIsLong
{
  v3 = [(SignpostFrameLifetimeInterval *)self renderInterval];

  if (!v3) {
    return 0;
  }
  unsigned int v4 = [(SignpostFrameLifetimeInterval *)self renderInterval];
  BOOL v5 = -[SignpostFrameLifetimeInterval _isLongMCT:expectedFrameLatency:](self, "_isLongMCT:expectedFrameLatency:", [v4 durationMachContinuousTime], 1);

  return v5;
}

- (BOOL)mayBeFirstFrame
{
  unint64_t v3 = [(SignpostAnimationSubInterval *)self startMachContinuousTime];
  if (v3 > [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT]
    || (unint64_t v4 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT],
        unint64_t v5 = [(SignpostAnimationSubInterval *)self startMachContinuousTime],
        v4 == v5)
    || (double)[(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime]* 0.5 > (double)(v4 - v5))
  {
    v6 = [(SignpostFrameLifetimeInterval *)self renderInterval];
    uint64_t v7 = [v6 startMachContinuousTime];
    unint64_t v8 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT];

    if (v7 == v8)
    {
      char v9 = 1;
    }
    else
    {
      id v10 = [(SignpostFrameLifetimeInterval *)self renderInterval];
      BOOL v11 = v7 - v8 < [v10 displayRefreshIntervalMachContinuousTime];

      char v9 = !v11;
    }
  }
  else
  {
    char v9 = 0;
  }
  return v9 & 1;
}

- (NSSet)contributingPIDs
{
  unint64_t v3 = [(SignpostFrameLifetimeInterval *)self pidToContextInfoArrayDict];

  if (v3)
  {
    unint64_t v4 = [(SignpostFrameLifetimeInterval *)self pidToContextInfoArrayDict];
    unint64_t v5 = [v4 allKeys];

    if ([v5 count]) {
      unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
    }
    else {
      unint64_t v3 = 0;
    }
  }

  return (NSSet *)v3;
}

- (unint64_t)previousFramePresentationMCTForContributingPID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SignpostFrameLifetimeInterval *)self pidToContextInfoArrayDict];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "previousPresentationMCT", (void)v15);
          if (v10 <= v13) {
            unint64_t v10 = v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)inProcessAnimationDisplayTargetMCTForContributingPID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SignpostFrameLifetimeInterval *)self pidToContextInfoArrayDict];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "inProcessAnimationDisplayTargetMCT", (void)v15);
          if (v10 <= v13) {
            unint64_t v10 = v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unsigned)_displayID
{
  unint64_t v3 = [(SignpostFrameLifetimeInterval *)self renderInterval];

  if (v3)
  {
    id v4 = [(SignpostFrameLifetimeInterval *)self renderInterval];
    unsigned int v5 = [v4 displayID];
  }
  else
  {
    v6 = [(SignpostFrameLifetimeInterval *)self skippedRenders];

    if (!v6) {
      return -1;
    }
    id v4 = [(SignpostFrameLifetimeInterval *)self skippedRenders];
    id v7 = [v4 firstObject];
    unsigned int v5 = [v7 displayID];
  }
  return v5;
}

- (BOOL)_hasDisplayID
{
  unint64_t v3 = [(SignpostFrameLifetimeInterval *)self renderInterval];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    unsigned int v5 = [(SignpostFrameLifetimeInterval *)self skippedRenders];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (NSNumber)displayIDNum
{
  if ([(SignpostFrameLifetimeInterval *)self _hasDisplayID])
  {
    unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SignpostFrameLifetimeInterval _displayID](self, "_displayID"));
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (unint64_t)missedVBLCount
{
  unint64_t v3 = [(SignpostAnimationSubInterval *)self durationMachContinuousTime];
  unint64_t v4 = v3
     / [(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime];
  if (v4 >= [(SignpostFrameLifetimeInterval *)self bufferCount]) {
    return v4 - [(SignpostFrameLifetimeInterval *)self bufferCount] + 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)_overrunBeginMCT
{
  uint64_t v3 = [(SignpostFrameLifetimeInterval *)self bufferCount];
  unint64_t v4 = [(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime]* v3;
  if ([(SignpostAnimationSubInterval *)self durationMachContinuousTime] <= v4) {
    return 0;
  }
  unint64_t v5 = v4 - [(SignpostAnimationSubInterval *)self durationMachContinuousTime];
  return v5 + [(SignpostAnimationSubInterval *)self endMachContinuousTime];
}

- (id)_glitchIntervalWithRoundingUp:(BOOL)a3 previousMCT:(unint64_t)a4
{
  if (a4)
  {
    BOOL v6 = a3;
    unint64_t v8 = [(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime];
    uint64_t v9 = [(SignpostFrameLifetimeInterval *)self _overrunBeginMCT];
    if (v9)
    {
      unint64_t v10 = v9;
      unint64_t v11 = v8 + a4;
      if ((unint64_t)v9 <= v8 + a4) {
        id v12 = (SignpostFrameOverrunInterval *)(v8 + a4);
      }
      else {
        id v12 = v9;
      }
      if (!v6
        || [(SignpostFrameLifetimeInterval *)self mayBeFirstFrame]
        || v12 == (SignpostFrameOverrunInterval *)[(SignpostAnimationSubInterval *)self endMachContinuousTime])
      {
        unint64_t v13 = (unint64_t)v12;
      }
      else
      {
        unint64_t v13 = (unint64_t)v12;
        if (v11 < (unint64_t)v10)
        {
          unint64_t v13 = v11;
          if (v11 <= (unint64_t)v12 - v8)
          {
            unint64_t v13 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
            do
              v13 -= v8;
            while (v13 > (unint64_t)v12);
          }
        }
      }
      if (v13 < [(SignpostAnimationSubInterval *)self endMachContinuousTime]
        && (double)v8 * 0.9 <= (double)([(SignpostAnimationSubInterval *)self endMachContinuousTime]- v13))
      {
        long long v15 = [SignpostFrameOverrunInterval alloc];
        unint64_t v16 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
        [(SignpostAnimationSubInterval *)self timebaseRatio];
        uint64_t v9 = -[SignpostFrameOverrunInterval initWithStartMCT:endMCT:timebaseRatio:class:](v15, "initWithStartMCT:endMCT:timebaseRatio:class:", v13, v16, 0);
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_inProcessGlitchIntervalWithRoundingUp:(BOOL)a3 targetMCT:(unint64_t)a4 previousMCT:(unint64_t)a5
{
  BOOL v6 = 0;
  if (a4 && a5)
  {
    unint64_t v9 = [(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime];
    unint64_t v10 = a4 + ([(SignpostFrameLifetimeInterval *)self bufferCount] - 1) * v9;
    unint64_t v11 = (unint64_t)((double)v9 * 0.2);
    if (v10 + v11 >= [(SignpostAnimationSubInterval *)self endMachContinuousTime]) {
      goto LABEL_12;
    }
    unint64_t v12 = v9 + a5 <= v10 ? v10 : v9 + a5;
    if (v12 + v11 >= [(SignpostAnimationSubInterval *)self endMachContinuousTime]) {
      goto LABEL_12;
    }
    unint64_t v13 = [(SignpostAnimationSubInterval *)self startMachContinuousTime];
    if (v12 >= v13 + v9 * [(SignpostFrameLifetimeInterval *)self bufferCount]) {
      goto LABEL_16;
    }
    id v14 = _signpost_debug_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SignpostFrameLifetimeInterval _inProcessGlitchIntervalWithRoundingUp:targetMCT:previousMCT:](self);
    }

    unint64_t v15 = [(SignpostAnimationSubInterval *)self startMachContinuousTime];
    unint64_t v12 = v15 + v9 * [(SignpostFrameLifetimeInterval *)self bufferCount];
    if ((double)[(SignpostAnimationSubInterval *)self endMachContinuousTime]
       + (double)v9 * -0.8 >= (double)v12)
    {
LABEL_16:
      long long v17 = [SignpostFrameOverrunInterval alloc];
      unint64_t v18 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
      [(SignpostAnimationSubInterval *)self timebaseRatio];
      BOOL v6 = -[SignpostFrameOverrunInterval initWithStartMCT:endMCT:timebaseRatio:class:](v17, "initWithStartMCT:endMCT:timebaseRatio:class:", v12, v18, 8);
    }
    else
    {
LABEL_12:
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (SignpostFrameOverrunInterval)frameOverrunInterval
{
  return (SignpostFrameOverrunInterval *)[(SignpostFrameLifetimeInterval *)self overrunIntervalOfType:0 contributingPID:0];
}

- (SignpostFrameOverrunInterval)frameOverrunInactiveDisplayInterval
{
  return (SignpostFrameOverrunInterval *)[(SignpostFrameLifetimeInterval *)self overrunIntervalOfType:1 contributingPID:0];
}

- (SignpostFrameOverrunInterval)userVisibleGlitchInterval
{
  return (SignpostFrameOverrunInterval *)[(SignpostFrameLifetimeInterval *)self overrunIntervalOfType:2 contributingPID:0];
}

- (SignpostFrameOverrunInterval)discrepancyFrameOverrunInactiveDisplayInterval
{
  BOOL v3 = [(SignpostFrameLifetimeInterval *)self mayBeFirstFrame];

  return (SignpostFrameOverrunInterval *)[(SignpostFrameLifetimeInterval *)self overrunIntervalOfType:1 overrunClass:8 maybeFirstFrame:v3 contributingPID:0];
}

- (id)overrunIntervalOfType:(unint64_t)a3 contributingPID:(id)a4
{
  if (a4) {
    uint64_t v6 = 18;
  }
  else {
    uint64_t v6 = 10;
  }
  id v7 = a4;
  unint64_t v8 = [(SignpostFrameLifetimeInterval *)self overrunIntervalOfType:a3 overrunClass:v6 maybeFirstFrame:[(SignpostFrameLifetimeInterval *)self mayBeFirstFrame] contributingPID:v7];

  return v8;
}

- (id)overrunIntervalOfType:(unint64_t)a3 overrunClass:(unint64_t)a4 maybeFirstFrame:(BOOL)a5 contributingPID:(id)a6
{
  BOOL v6 = a5;
  char v7 = a4;
  id v10 = a6;
  if (v10)
  {
    unint64_t v11 = [(SignpostFrameLifetimeInterval *)self contributingPIDs];
    int v12 = [v11 containsObject:v10];

    if (!v12)
    {
      unint64_t v16 = 0;
      goto LABEL_51;
    }
  }
  BOOL v13 = a3 == 2;
  BOOL v14 = [(SignpostFrameLifetimeInterval *)self frameStallSkipRequest];
  if ((v7 & 4) == 0 && v14)
  {
    unint64_t v15 = _signpost_debug_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[SignpostFrameLifetimeInterval overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:](self);
    }
    unint64_t v16 = 0;
    goto LABEL_50;
  }
  if (v10)
  {
    unint64_t v17 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCTForContributingPID:v10];
    if (!v17) {
      unint64_t v17 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT];
    }
    unint64_t v18 = v17;
    if ((v7 & 8) != 0)
    {
      unint64_t v19 = [(SignpostFrameLifetimeInterval *)self inProcessAnimationDisplayTargetMCTForContributingPID:v10];
      if (v19) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v18 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT];
    if ((v7 & 8) != 0)
    {
LABEL_18:
      unint64_t v19 = [(SignpostFrameLifetimeInterval *)self inProcessAnimationDisplayTargetMCT];
LABEL_19:
      unint64_t v15 = [(SignpostFrameLifetimeInterval *)self _inProcessGlitchIntervalWithRoundingUp:a3 == 2 targetMCT:v19 previousMCT:v18];
      if (v7) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  unint64_t v15 = 0;
  if (v7) {
    goto LABEL_21;
  }
LABEL_20:
  if (v6)
  {
LABEL_24:
    unint64_t v16 = 0;
    goto LABEL_32;
  }
LABEL_21:
  if ((v7 & 0x10) == 0 && (v7 & 2) == 0 && !v6) {
    goto LABEL_24;
  }
  if (a3 == 1)
  {
    BOOL v13 = 0;
    goto LABEL_30;
  }
  if (a3)
  {
LABEL_30:
    uint64_t v22 = [(SignpostFrameLifetimeInterval *)self _glitchIntervalWithRoundingUp:v13 previousMCT:v18];
    goto LABEL_31;
  }
  unint64_t v16 = [(SignpostFrameLifetimeInterval *)self _overrunBeginMCT];
  if (!v16) {
    goto LABEL_32;
  }
  uint64_t v20 = [SignpostFrameOverrunInterval alloc];
  unint64_t v21 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
  [(SignpostAnimationSubInterval *)self timebaseRatio];
  uint64_t v22 = -[SignpostFrameOverrunInterval initWithStartMCT:endMCT:timebaseRatio:class:](v20, "initWithStartMCT:endMCT:timebaseRatio:class:", v16, v21, 0);
LABEL_31:
  unint64_t v16 = (void *)v22;
LABEL_32:
  uint64_t v23 = [v16 overrunClass];
  uint64_t v24 = [v15 overrunClass];
  uint64_t v25 = 1;
  if (!v6) {
    uint64_t v25 = 2;
  }
  uint64_t v26 = v23 | v24 | v25;
  if ([(SignpostFrameLifetimeInterval *)self frameStallSkipRequest]) {
    v26 |= 4uLL;
  }
  unint64_t v27 = [v16 durationMachContinuousTime];
  if (v27 < [v15 durationMachContinuousTime])
  {
    uint64_t v28 = v15;

    unint64_t v16 = v28;
  }
  if (v6) {
    goto LABEL_49;
  }
  if ([(SignpostFrameLifetimeInterval *)self bufferCount] != 2
    || [(SignpostFrameLifetimeInterval *)self nextFrameBufferCount] != 2
    || [(SignpostFrameLifetimeInterval *)self previousFrameBufferCount] != 3
    || (v26 & 2) == 0)
  {
    if ((v7 & 2) != 0 || v15) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  double v29 = (double)(unint64_t)[v16 durationMachContinuousTime];
  if ((double)[(SignpostFrameLifetimeInterval *)self displayRefreshIntervalDurationMachTime]* 1.1 >= v29)
  {
    if ((v7 & 0x10) != 0)
    {
      v26 |= 0x10uLL;
      goto LABEL_49;
    }
LABEL_48:

    unint64_t v16 = 0;
  }
LABEL_49:
  [v16 setOverrunType:a3];
  [v16 setOverrunClass:v26];
LABEL_50:

LABEL_51:

  return v16;
}

- (SignpostSupportTimeInterval)previousFrameOnScreenInterval
{
  BOOL v3 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT];
  if (v3)
  {
    uint64_t v4 = [SignpostAnimationSubInterval alloc];
    unint64_t v5 = [(SignpostFrameLifetimeInterval *)self previousFramePresentationMCT];
    unint64_t v6 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
    [(SignpostAnimationSubInterval *)self timebaseRatio];
    BOOL v3 = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](v4, "initWithStartMCT:endMCT:timebaseRatio:", v5, v6);
  }

  return (SignpostSupportTimeInterval *)v3;
}

- (id)pidToContextIDtoContextFrameLifetimeDict
{
  BOOL v3 = [(SignpostFrameLifetimeInterval *)self pidToContextInfoArrayDict];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v6 = [(SignpostFrameLifetimeInterval *)self pidToContextInfoArrayDict];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __73__SignpostFrameLifetimeInterval_pidToContextIDtoContextFrameLifetimeDict__block_invoke;
    BOOL v13 = &unk_1E5B3FFC0;
    BOOL v14 = self;
    id v7 = v5;
    id v15 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:&v10];

    if (objc_msgSend(v7, "count", v10, v11, v12, v13, v14)) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __73__SignpostFrameLifetimeInterval_pidToContextIDtoContextFrameLifetimeDict__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          BOOL v14 = [[SignpostContextFrameLifetime alloc] initWithFrameLifetime:*(void *)(a1 + 32) contextInfo:v13];
          if (v14)
          {
            id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "contextId"));
            [v7 setObject:v14 forKeyedSubscript:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    if ([v7 count]) {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];
    }

    id v6 = v16;
  }
}

- (unsigned)swapID
{
  return self->_swapID;
}

- (unsigned)previousFrameBufferCount
{
  return self->_previousFrameBufferCount;
}

- (BOOL)frameStallSkipRequest
{
  return self->_frameStallSkipRequest;
}

- (unint64_t)previousFramePresentationMCT
{
  return self->_previousFramePresentationMCT;
}

- (NSDictionary)pidToContextInfoArrayDict
{
  return self->_pidToContextInfoArrayDict;
}

- (SignpostRenderServerRenderInterval)renderInterval
{
  return self->_renderInterval;
}

- (NSArray)skippedRenders
{
  return self->_skippedRenders;
}

- (SignpostContextInfo)earliestTimeContextInfo
{
  return self->_earliestTimeContextInfo;
}

- (SignpostContextInfo)contextInfoForHIDInput
{
  return self->_contextInfoForHIDInput;
}

- (NSArray)commits
{
  return self->_commits;
}

- (void)setCommits:(id)a3
{
}

- (unint64_t)inProcessAnimationDisplayTargetMCT
{
  return self->_inProcessAnimationDisplayTargetMCT;
}

- (unsigned)nextFrameBufferCount
{
  return self->_nextFrameBufferCount;
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 hidLatencyInterval:(uint64_t)a5 renderInterval:(uint64_t)a6 frameLatencyInterval:(uint64_t)a7 frameSeedToSkippedRenderIntervals:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 hidLatencyInterval:(uint64_t)a5 renderInterval:(uint64_t)a6 frameLatencyInterval:(uint64_t)a7 frameSeedToSkippedRenderIntervals:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 hidLatencyInterval:(uint64_t)a5 renderInterval:(uint64_t)a6 frameLatencyInterval:(uint64_t)a7 frameSeedToSkippedRenderIntervals:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.4()
{
  OUTLINED_FUNCTION_6();
  [v0 frameSeed];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v1, v2, "ContextInfo frame seed mismatch: %#x vs %#x", v3, v4, v5, v6, v7);
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.5()
{
  OUTLINED_FUNCTION_6();
  [v0 frameSeed];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v1, v2, "HIDLatency frame seed mismatch: %#x vs %#x", v3, v4, v5, v6, v7);
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.6()
{
  OUTLINED_FUNCTION_6();
  [v0 frameSeed];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v1, v2, "FrameLatency frame seed mismatch: %#x vs %#x", v3, v4, v5, v6, v7);
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.7()
{
  OUTLINED_FUNCTION_6();
  [v0 frameSeed];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1A4576000, v1, v2, "RenderInterval frame seed mismatch: %#x vs %#x", v3, v4, v5, v6, v7);
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 renderInterval:(uint64_t)a5 frameSeedToSkippedRenderIntervals:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 renderInterval:(uint64_t)a5 frameSeedToSkippedRenderIntervals:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_inProcessGlitchIntervalWithRoundingUp:(void *)a1 targetMCT:previousMCT:.cold.1(void *a1)
{
  [a1 swapID];
  OUTLINED_FUNCTION_4(&dword_1A4576000, v1, v2, "Discrepancy glitch begin before long_frame start for [SwapID: 0x%x]", v3, v4, v5, v6, 0);
}

- (void)overrunIntervalOfType:(void *)a1 overrunClass:maybeFirstFrame:contributingPID:.cold.1(void *a1)
{
  [a1 swapID];
  OUTLINED_FUNCTION_4(&dword_1A4576000, v1, v2, "frameStallSkipRequest for Swap ID: 0x%x", v3, v4, v5, v6, 0);
}

@end