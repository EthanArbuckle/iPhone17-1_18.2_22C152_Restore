@interface SSCAMetalLayerClientSession
- (BOOL)includeTimelines;
- (NSArray)resourceUsageIntervalTimeline;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)coreAnalyticsEvent;
- (NSMutableArray)mutableResourceSnapshotTimeline;
- (NSMutableDictionary)mutableLayerIDToLayerSession;
- (NSString)bundleID;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)debugDescription;
- (NSString)processName;
- (SSCAMetalLayerClientResourceUsageInterval)overallResourceUsageInterval;
- (SSCAMetalLayerClientResourceUsageSnapshot)earliestSnapshot;
- (SSCAMetalLayerClientResourceUsageSnapshot)latestSnapshot;
- (SSCAMetalLayerClientSession)initWithPID:(int)a3 includeTimelines:(BOOL)a4 timebaseRatio:(double)a5;
- (SSGameSessionInterval)gameSession;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)_clientSessionFromLayerSessionDict:(id)a3 filteredResourceUsageSnapshots:(id)a4;
- (id)_dictionaryRepresentation:(BOOL)a3;
- (id)_metalLayerSessionForID:(unint64_t)a3 timebaseRatio:(double)a4;
- (id)clientSessionFilteredToStartDate:(id)a3 endDate:(id)a4 errorOut:(id *)a5;
- (id)clientSessionFilteredToStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 errorOut:(id *)a5;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (int)processID;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (void)_handleResourceSnapshot:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setEarliestSnapshot:(id)a3;
- (void)setGameSession:(id)a3;
- (void)setLatestSnapshot:(id)a3;
- (void)setMutableResourceSnapshotTimeline:(id)a3;
- (void)setProcessID:(int)a3;
- (void)setProcessName:(id)a3;
@end

@implementation SSCAMetalLayerClientSession

- (double)startSeconds
{
  unint64_t v3 = [(SSCAMetalLayerClientSession *)self startMachContinuousTime];
  [(SSCAMetalLayerClientSession *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSCAMetalLayerClientSession *)self endMachContinuousTime];
  [(SSCAMetalLayerClientSession *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSCAMetalLayerClientSession *)self endMachContinuousTime];
  return v3 - [(SSCAMetalLayerClientSession *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSCAMetalLayerClientSession *)self endSeconds];
  double v4 = v3;
  [(SSCAMetalLayerClientSession *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSCAMetalLayerClientSession *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSCAMetalLayerClientSession *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSCAMetalLayerClientSession *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSCAMetalLayerClientSession *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSCAMetalLayerClientSession *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSCAMetalLayerClientSession *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (SSCAMetalLayerClientSession)initWithPID:(int)a3 includeTimelines:(BOOL)a4 timebaseRatio:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SSCAMetalLayerClientSession;
  v8 = [(SSCAMetalLayerClientSession *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_processID = a3;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableLayerIDToLayerSession = v9->_mutableLayerIDToLayerSession;
    v9->_mutableLayerIDToLayerSession = v10;

    v9->_includeTimelines = a4;
    v9->_timebaseRatio = a5;
    if ([(SSCAMetalLayerClientSession *)v9 includeTimelines])
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      mutableResourceSnapshotTimeline = v9->_mutableResourceSnapshotTimeline;
      v9->_mutableResourceSnapshotTimeline = v12;
    }
  }
  return v9;
}

- (SSCAMetalLayerClientResourceUsageInterval)overallResourceUsageInterval
{
  double v3 = [SSCAMetalLayerClientResourceUsageInterval alloc];
  double v4 = [(SSCAMetalLayerClientSession *)self earliestSnapshot];
  double v5 = [(SSCAMetalLayerClientSession *)self latestSnapshot];
  v6 = [(SSCAMetalLayerClientResourceUsageInterval *)v3 initWithStartSnapshot:v4 endSnapshot:v5];

  return v6;
}

- (id)_metalLayerSessionForID:(unint64_t)a3 timebaseRatio:(double)a4
{
  v7 = [(SSCAMetalLayerClientSession *)self mutableLayerIDToLayerSession];
  v8 = [NSNumber numberWithUnsignedLongLong:a3];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    v9 = [[SSCAMetalLayerSession alloc] initWithID:a3 includeTimelines:[(SSCAMetalLayerClientSession *)self includeTimelines] timebaseRatio:a4];
    v10 = [(SSCAMetalLayerClientSession *)self mutableLayerIDToLayerSession];
    v11 = [NSNumber numberWithUnsignedLongLong:a3];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }

  return v9;
}

- (id)_dictionaryRepresentation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  double v5 = _timeIntervalDict(self);
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[SSCAMetalLayerClientSession processID](self, "processID"));
  [v5 setObject:v6 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_ProcessID];

  uint64_t v7 = [(SSCAMetalLayerClientSession *)self processName];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"Unknown";
  }
  [v5 setObject:v9 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_ProcessName];

  uint64_t v10 = [(SSCAMetalLayerClientSession *)self bundleID];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"Unknown";
  }
  [v5 setObject:v12 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_BundleID];

  uint64_t v13 = [(SSCAMetalLayerClientSession *)self bundleVersion];
  v14 = (void *)v13;
  if (v13) {
    objc_super v15 = (__CFString *)v13;
  }
  else {
    objc_super v15 = @"Unknown";
  }
  [v5 setObject:v15 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_BundleVersion];

  uint64_t v16 = [(SSCAMetalLayerClientSession *)self bundleShortVersion];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"Unknown";
  }
  [v5 setObject:v18 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_BundleShortVersion];

  v19 = [(SSCAMetalLayerClientSession *)self gameSession];

  if (v19)
  {
    v20 = [(SSCAMetalLayerClientSession *)self gameSession];
    v21 = [v20 dictionaryRepresentation];
    [v5 setObject:v21 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_GameSession];
  }
  v22 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v25 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
    v26 = [v25 allValues];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v50 + 1) + 8 * i) _dictionaryRepresentation:v3];
          [v24 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v28);
    }

    [v5 setObject:v24 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_LayerSessions];
  }
  if (v3)
  {
    v32 = [(SSCAMetalLayerClientSession *)self resourceSnapshotTimeline];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      v34 = [(SSCAMetalLayerClientSession *)self resourceUsageIntervalTimeline];
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v36 = v34;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v47 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * j), "dictionaryRepresentation", (void)v46);
            [v35 addObject:v41];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v38);
      }

      [v5 setObject:v35 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_ResourceUsageIntervals];
    }
  }
  v42 = [(SSCAMetalLayerClientSession *)self overallResourceUsageInterval];
  v43 = v42;
  if (v42)
  {
    v44 = [v42 dictionaryRepresentation];
    [v5 setObject:v44 forKeyedSubscript:kSSCAMetalLayerClientSessionKey_OverallResourceUsageInterval];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  return [(SSCAMetalLayerClientSession *)self _dictionaryRepresentation:1];
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerClientSession *)self jsonDescription:3];
}

- (NSDictionary)coreAnalyticsEvent
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SSCAMetalLayerClientSession *)self processName];

  if (!v3
    || ([(SSCAMetalLayerClientSession *)self layerIDToLayerSession],
        double v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    id v32 = 0;
    goto LABEL_57;
  }
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v6 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
  uint64_t v7 = [v6 allValues];

  v8 = v7;
  uint64_t v138 = [v7 countByEnumeratingWithState:&v144 objects:v149 count:16];
  if (!v138)
  {
    id v12 = 0;
    v11 = 0;
    uint64_t v10 = 0;
    id v32 = 0;
    goto LABEL_54;
  }
  v132 = self;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  v11 = 0;
  id v12 = 0;
  obuint64_t j = *(id *)v145;
  do
  {
    for (uint64_t i = 0; i != v138; ++i)
    {
      if (*(id *)v145 != obj) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v144 + 1) + 8 * i);
      objc_super v15 = [v14 totalSessionStats];

      if (v15)
      {
        uint64_t v16 = [v14 totalSessionStats];
        v17 = [v16 startDate];
        if (!v11) {
          goto LABEL_12;
        }
        uint64_t v18 = [v11 compare:v17];

        if (v18 == 1)
        {
          uint64_t v16 = [v14 totalSessionStats];
          v17 = [v16 startDate];

LABEL_12:
          v11 = v17;
        }
        v19 = [v14 totalSessionStats];
        v20 = [v19 endDate];
        if (v10)
        {
          uint64_t v21 = [v10 compare:v20];

          if (v21 == -1)
          {
            v19 = [v14 totalSessionStats];
            v20 = [v19 endDate];

            goto LABEL_16;
          }
        }
        else
        {
LABEL_16:

          uint64_t v10 = v20;
        }
        v22 = [v14 totalSessionStats];
        uint64_t v23 = [v22 presentedFrameStats];
        unint64_t v24 = [v23 frameCount];

        if (v24)
        {
          v9 += v24;
          if (v12)
          {
            uint64_t v134 = v9;
            v25 = v8;
            v26 = v10;
            uint64_t v27 = v11;
            uint64_t v28 = [v12 totalSessionStats];
            uint64_t v29 = [v28 presentedFrameStats];
            v30 = v12;
            unint64_t v31 = [v29 frameCount];

            if (v31 >= v24)
            {
              id v12 = v30;
            }
            else
            {
              id v12 = v14;
            }
            v11 = v27;
            uint64_t v10 = v26;
            v8 = v25;
            uint64_t v9 = v134;
          }
          else
          {
            id v12 = v14;
          }
        }
        continue;
      }
    }
    uint64_t v138 = [v8 countByEnumeratingWithState:&v144 objects:v149 count:16];
  }
  while (v138);

  id v32 = 0;
  if (v11 && v10)
  {
    if (v12 && (uint64_t v33 = v9, [v12 totalSessionStats], (v34 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v35 = (void *)v34;
      v135 = v12;
      id v36 = [v12 totalSessionStats];
      uint64_t v37 = [v36 presentedFrameStats];
      uint64_t v38 = [v37 frameCount];

      if (v38)
      {
        id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v39 = [(SSCAMetalLayerClientSession *)v132 processName];
        [v32 setObject:v39 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_ProcessName];

        v40 = [(SSCAMetalLayerClientSession *)v132 bundleID];

        if (v40)
        {
          v41 = [(SSCAMetalLayerClientSession *)v132 bundleID];
          [v32 setObject:v41 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_BundleID];
        }
        v42 = [(SSCAMetalLayerClientSession *)v132 bundleVersion];

        if (v42)
        {
          v43 = [(SSCAMetalLayerClientSession *)v132 bundleVersion];
          [v32 setObject:v43 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_BundleVersion];
        }
        v44 = [(SSCAMetalLayerClientSession *)v132 bundleShortVersion];

        if (v44)
        {
          v45 = [(SSCAMetalLayerClientSession *)v132 bundleShortVersion];
          [v32 setObject:v45 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_BundleShortVersion];
        }
        long long v46 = NSNumber;
        long long v47 = [(SSCAMetalLayerClientSession *)v132 layerIDToLayerSession];
        long long v48 = objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
        [v32 setObject:v48 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_LifetimeActiveLayerCount];

        long long v49 = NSNumber;
        v133 = v10;
        [v10 timeIntervalSinceDate:v11];
        long long v50 = objc_msgSend(v49, "numberWithDouble:");
        [v32 setObject:v50 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_ClientLifetimeDurationSec];

        long long v51 = [NSNumber numberWithUnsignedLongLong:v33];
        [v32 setObject:v51 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_TotalPresentedDrawablesCount];

        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v52 = v135;
        long long v53 = [v135 configurationTimeline];
        v54 = (void *)[v53 countByEnumeratingWithState:&v140 objects:v148 count:16];
        if (v54)
        {
          v131 = v32;
          v55 = 0;
          unint64_t v56 = 0;
          unint64_t v57 = 0;
          unint64_t v58 = 0;
          unint64_t v59 = 0;
          id obja = v53;
          uint64_t v139 = *(void *)v141;
          do
          {
            for (uint64_t j = 0; j != v54; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v141 != v139) {
                objc_enumerationMutation(obja);
              }
              v61 = *(void **)(*((void *)&v140 + 1) + 8 * (void)j);
              v62 = [v61 layerName];

              if (v62)
              {
                uint64_t v63 = [v61 layerName];

                v55 = (void *)v63;
              }
              v64 = [v61 heightPixels];

              if (v64)
              {
                v65 = [v61 heightPixels];
                v56 += [v65 unsignedLongLongValue];

                ++v57;
              }
              v66 = [v61 widthPixels];

              if (v66)
              {
                v67 = [v61 widthPixels];
                v58 += [v67 unsignedLongLongValue];

                ++v59;
              }
            }
            v54 = (void *)[obja countByEnumeratingWithState:&v140 objects:v148 count:16];
          }
          while (v54);

          if (v57)
          {
            v68 = [NSNumber numberWithUnsignedLongLong:v56 / v57];
          }
          else
          {
            v68 = 0;
          }
          if (v59)
          {
            v54 = [NSNumber numberWithUnsignedLongLong:v58 / v59];
          }
          else
          {
            v54 = 0;
          }
          long long v52 = v135;
          id v32 = v131;
          if (v68)
          {
            [v131 setObject:v68 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_AverageHeightPixels];
            [v131 setObject:v54 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_AverageWidthPixels];
          }
          if (v55) {
            [v131 setObject:v55 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_LayerName];
          }
        }
        else
        {

          v68 = 0;
          v55 = 0;
        }

        v8 = [v52 totalSessionStats];
        v70 = NSNumber;
        [v8 activeSeconds];
        v71 = objc_msgSend(v70, "numberWithDouble:");
        [v32 setObject:v71 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_ActiveDurationSeconds];

        v72 = NSNumber;
        v73 = [v8 presentedFrameStats];
        v74 = objc_msgSend(v72, "numberWithUnsignedLongLong:", objc_msgSend(v73, "frameCount"));
        [v32 setObject:v74 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedFrameCount];

        v75 = NSNumber;
        v76 = [v8 presentedFrameStats];
        [v76 framesPerSecond];
        v77 = objc_msgSend(v75, "numberWithDouble:");
        [v32 setObject:v77 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedFramesPerSecond];

        v78 = NSNumber;
        v79 = [v8 presentedFrameStats];
        v80 = objc_msgSend(v78, "numberWithUnsignedLongLong:", objc_msgSend(v79, "commandBufferCount"));
        [v32 setObject:v80 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedCommandBufferCount];

        v81 = [v8 skippedFrameStats];
        uint64_t v82 = [v81 frameCount];

        if (v82)
        {
          v83 = NSNumber;
          v84 = [v8 skippedFrameStats];
          v85 = objc_msgSend(v83, "numberWithUnsignedLongLong:", objc_msgSend(v84, "frameCount"));
          [v32 setObject:v85 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_SkippedFrameCount];

          v86 = NSNumber;
          v87 = [v8 skippedFrameStats];
          v88 = objc_msgSend(v86, "numberWithUnsignedLongLong:", objc_msgSend(v87, "commandBufferCount"));
          [v32 setObject:v88 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_SkippedFrameCommandBufferCount];
        }
        v89 = NSNumber;
        v90 = [v8 presentedFrameStats];
        v91 = [v90 totalEndToEndWalltimeStats];
        [v91 totalMs];
        v92 = objc_msgSend(v89, "numberWithDouble:");
        [v32 setObject:v92 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedTotalEndToEndDrawableTotalMs];

        v93 = NSNumber;
        v94 = [v8 presentedFrameStats];
        v95 = [v94 cpuEndToEndWalltimeStats];
        [v95 totalMs];
        v96 = objc_msgSend(v93, "numberWithDouble:");
        [v32 setObject:v96 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedCPUEndToEndDrawableTotalMs];

        v97 = NSNumber;
        v98 = [v8 presentedFrameStats];
        v99 = [v98 gpuEndToEndWalltimeStats];
        [v99 totalMs];
        v100 = objc_msgSend(v97, "numberWithDouble:");
        [v32 setObject:v100 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedGPUEndToEndDrawableTotalMs];

        v101 = NSNumber;
        v102 = [v8 presentedFrameStats];
        v103 = [v102 onGPUWalltimeStats];
        [v103 totalMs];
        v104 = objc_msgSend(v101, "numberWithDouble:");
        [v32 setObject:v104 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedOnGPUTotalMs];

        v105 = NSNumber;
        v106 = [v8 frameOnGlassIntervalStats];
        v107 = objc_msgSend(v105, "numberWithUnsignedLongLong:", objc_msgSend(v106, "durationCount"));
        [v32 setObject:v107 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_OnGlassIntervalCount];

        v108 = NSNumber;
        v109 = [v8 frameOnGlassIntervalStats];
        [v109 totalMs];
        v110 = objc_msgSend(v108, "numberWithDouble:");
        [v32 setObject:v110 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_OnGlassIntervalTotalMs];

        v111 = NSNumber;
        v112 = [v8 presentedFrameStats];
        v113 = [v112 gpuDoneToCompletedWalltimeStats];
        [v113 totalMs];
        v114 = objc_msgSend(v111, "numberWithDouble:");
        [v32 setObject:v114 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_PresentedGPUDoneToCompletedTotalMs];

        v115 = [v8 lateClientPresentStats];
        uint64_t v116 = [v115 durationCount];

        if (v116)
        {
          v117 = NSNumber;
          v118 = [v8 lateClientPresentStats];
          v119 = objc_msgSend(v117, "numberWithUnsignedLongLong:", objc_msgSend(v118, "durationCount"));
          [v32 setObject:v119 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_ClientPresentLatenessCount];

          v120 = NSNumber;
          v121 = [v8 lateClientPresentStats];
          [v121 totalMs];
          v122 = objc_msgSend(v120, "numberWithDouble:");
          [v32 setObject:v122 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_ClientPresentLatenessTotalMs];
        }
        v123 = [v8 lateOnGlassPresentStats];
        uint64_t v124 = [v123 durationCount];

        uint64_t v10 = v133;
        if (v124)
        {
          v125 = NSNumber;
          v126 = [v8 lateOnGlassPresentStats];
          v127 = objc_msgSend(v125, "numberWithUnsignedLongLong:", objc_msgSend(v126, "durationCount"));
          [v32 setObject:v127 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_OnGlassPresentLatenessCount];

          v128 = NSNumber;
          v129 = [v8 lateOnGlassPresentStats];
          [v129 totalMs];
          v130 = objc_msgSend(v128, "numberWithDouble:");
          [v32 setObject:v130 forKeyedSubscript:kSSCAMetalLayerClientSessionCAKey_OnGlassPresentLatenessTotalMs];
        }
        id v12 = v135;
LABEL_54:
      }
      else
      {
        id v32 = 0;
        id v12 = v135;
      }
    }
    else
    {
      id v32 = 0;
    }
  }

LABEL_57:

  return (NSDictionary *)v32;
}

- (id)_clientSessionFromLayerSessionDict:(id)a3 filteredResourceUsageSnapshots:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    uint64_t v9 = [SSCAMetalLayerClientSession alloc];
    uint64_t v10 = [(SSCAMetalLayerClientSession *)self processID];
    [(SSCAMetalLayerClientSession *)self timebaseRatio];
    v11 = -[SSCAMetalLayerClientSession initWithPID:includeTimelines:timebaseRatio:](v9, "initWithPID:includeTimelines:timebaseRatio:", v10, 1);
    objc_storeStrong(v11 + 8, a3);
    id v12 = [(SSCAMetalLayerClientSession *)self processName];
    [v11 setProcessName:v12];

    objc_msgSend(v11, "setProcessID:", -[SSCAMetalLayerClientSession processID](self, "processID"));
    uint64_t v13 = [(SSCAMetalLayerClientSession *)self bundleID];
    [v11 setBundleID:v13];

    v14 = [(SSCAMetalLayerClientSession *)self bundleVersion];
    [v11 setBundleVersion:v14];

    objc_super v15 = [(SSCAMetalLayerClientSession *)self bundleShortVersion];
    [v11 setBundleShortVersion:v15];

    [v11 setMutableResourceSnapshotTimeline:v8];
    uint64_t v16 = [v8 firstObject];
    [v11 setEarliestSnapshot:v16];

    v17 = [v8 lastObject];
    [v11 setLatestSnapshot:v17];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)clientSessionFilteredToStartDate:(id)a3 endDate:(id)a4 errorOut:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = self;
  uint64_t v33 = v8;
  unsigned int v10 = _dateRangeIntersectionWithValidation(self, v8, v9, a5);
  v11 = 0;
  if (v10 >= 2 && v10 != 6)
  {
    if (v10 == 3)
    {
      v11 = self;
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x3032000000;
      long long v46 = __Block_byref_object_copy__3;
      long long v47 = __Block_byref_object_dispose__3;
      id v48 = 0;
      uint64_t v13 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __81__SSCAMetalLayerClientSession_clientSessionFilteredToStartDate_endDate_errorOut___block_invoke;
      v38[3] = &unk_1E5B40658;
      id v14 = v8;
      id v39 = v14;
      id v15 = v9;
      id v40 = v15;
      v42 = &v43;
      id v31 = v12;
      id v41 = v31;
      [v13 enumerateKeysAndObjectsUsingBlock:v38];
      id v30 = v9;

      uint64_t v16 = (void *)v44[5];
      if (v16)
      {
        v11 = 0;
        if (a5) {
          *a5 = v16;
        }
      }
      else
      {
        v17 = [(SSCAMetalLayerClientSession *)self resourceSnapshotTimeline];
        BOOL v18 = [v17 count] == 0;

        if (v18)
        {
          id v19 = 0;
        }
        else
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v20 = [(SSCAMetalLayerClientSession *)self resourceSnapshotTimeline];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v49 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v35 != v22) {
                  objc_enumerationMutation(v20);
                }
                unint64_t v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if (v14)
                {
                  v25 = [*(id *)(*((void *)&v34 + 1) + 8 * i) snapshotDate];
                  BOOL v26 = [v25 compare:v14] == -1;

                  if (v26) {
                    continue;
                  }
                }
                if (v15)
                {
                  uint64_t v27 = [v24 snapshotDate];
                  BOOL v28 = [v15 compare:v27] == -1;

                  if (v28) {
                    goto LABEL_21;
                  }
                }
                objc_msgSend(v19, "addObject:", v24, v30);
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v49 count:16];
            }
            while (v21);
          }
LABEL_21:
        }
        if (!objc_msgSend(v19, "count", v30))
        {

          id v19 = 0;
        }
        v11 = [(SSCAMetalLayerClientSession *)v32 _clientSessionFromLayerSessionDict:v31 filteredResourceUsageSnapshots:v19];
      }
      _Block_object_dispose(&v43, 8);

      id v9 = v30;
    }
  }

  return v11;
}

void __81__SSCAMetalLayerClientSession_clientSessionFilteredToStartDate_endDate_errorOut___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v10 + 40);
  v11 = [a3 layerSessionFilteredToStartDate:v8 endDate:v9 errorOut:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    *a4 = 1;
  }
  else {
    [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v7];
  }
}

- (id)clientSessionFilteredToStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 errorOut:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = _mctIntersectionWithValidation(self, a3, a4, a5);
  uint64_t v10 = 0;
  if (v9 >= 2 && v9 != 6)
  {
    if (v9 == 3)
    {
      uint64_t v10 = self;
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v33 = 0;
      long long v34 = &v33;
      uint64_t v35 = 0x3032000000;
      long long v36 = __Block_byref_object_copy__3;
      long long v37 = __Block_byref_object_dispose__3;
      id v38 = 0;
      id v12 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __79__SSCAMetalLayerClientSession_clientSessionFilteredToStartMCT_endMCT_errorOut___block_invoke;
      v28[3] = &unk_1E5B40680;
      unint64_t v31 = a3;
      unint64_t v32 = a4;
      id v30 = &v33;
      id v13 = v11;
      id v29 = v13;
      [v12 enumerateKeysAndObjectsUsingBlock:v28];

      id v14 = (void *)v34[5];
      if (v14)
      {
        uint64_t v10 = 0;
        if (a5) {
          *a5 = v14;
        }
      }
      else
      {
        id v15 = [(SSCAMetalLayerClientSession *)self resourceSnapshotTimeline];
        BOOL v16 = [v15 count] == 0;

        if (v16)
        {
          id v17 = 0;
        }
        else
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          BOOL v18 = [(SSCAMetalLayerClientSession *)self resourceSnapshotTimeline];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v39 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v25 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if ([v22 snapshotMCT] >= a3)
                {
                  if ([v22 snapshotMCT] > a4) {
                    goto LABEL_19;
                  }
                  [v17 addObject:v22];
                }
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v39 count:16];
            }
            while (v19);
          }
LABEL_19:
        }
        if (![v17 count])
        {

          id v17 = 0;
        }
        uint64_t v10 = [(SSCAMetalLayerClientSession *)self _clientSessionFromLayerSessionDict:v13 filteredResourceUsageSnapshots:v17];
      }
      _Block_object_dispose(&v33, 8);
    }
  }

  return v10;
}

void __79__SSCAMetalLayerClientSession_clientSessionFilteredToStartMCT_endMCT_errorOut___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v10 + 40);
  id v11 = [a3 layerSessionFilteredToStartMCT:v8 endMCT:v9 errorOut:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
  else {
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
  }
}

- (NSDate)startDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v2 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) startDate];
        v6 = _getEarliestDate(v9, v10);

        ++v8;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSDate)endDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v2 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) endDate];
        v6 = _getLatestDate(v9, v10);

        ++v8;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (unint64_t)startMachContinuousTime
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v2 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) startMachContinuousTime];
        if (v6 >= v9) {
          unint64_t v10 = v9;
        }
        else {
          unint64_t v10 = v6;
        }
        if (v6 + 1 >= 2) {
          unint64_t v6 = v10;
        }
        else {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)endMachContinuousTime
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  float v2 = [(SSCAMetalLayerClientSession *)self layerIDToLayerSession];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    unint64_t v7 = -1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) endMachContinuousTime];
        if (v7 <= v9) {
          unint64_t v10 = v9;
        }
        else {
          unint64_t v10 = v7;
        }
        if (v7 + 1 >= 2) {
          unint64_t v7 = v10;
        }
        else {
          unint64_t v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = -1;
  }

  return v7;
}

- (void)_handleResourceSnapshot:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SSCAMetalLayerClientSession *)self earliestSnapshot];

  if (!v4) {
    [(SSCAMetalLayerClientSession *)self setEarliestSnapshot:v6];
  }
  [(SSCAMetalLayerClientSession *)self setLatestSnapshot:v6];
  if ([(SSCAMetalLayerClientSession *)self includeTimelines])
  {
    uint64_t v5 = [(SSCAMetalLayerClientSession *)self mutableResourceSnapshotTimeline];
    [v5 addObject:v6];
  }
}

- (NSArray)resourceUsageIntervalTimeline
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(SSCAMetalLayerClientSession *)self includeTimelines]
    && ([(SSCAMetalLayerClientSession *)self resourceSnapshotTimeline],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = [v3 count],
        v3,
        v4 >= 2))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v7 = [(SSCAMetalLayerClientSession *)self mutableResourceSnapshotTimeline];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        long long v13 = v10;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
          if (v13)
          {
            long long v15 = [[SSCAMetalLayerClientResourceUsageInterval alloc] initWithStartSnapshot:v13 endSnapshot:v14];
            if (v15) {
              [v6 addObject:v15];
            }
          }
          id v10 = v14;

          ++v12;
          long long v13 = v10;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    if ([v6 count]) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (NSMutableArray)mutableResourceSnapshotTimeline
{
  return self->_mutableResourceSnapshotTimeline;
}

- (void)setMutableResourceSnapshotTimeline:(id)a3
{
}

- (SSGameSessionInterval)gameSession
{
  return self->_gameSession;
}

- (void)setGameSession:(id)a3
{
}

- (NSMutableDictionary)mutableLayerIDToLayerSession
{
  return self->_mutableLayerIDToLayerSession;
}

- (SSCAMetalLayerClientResourceUsageSnapshot)earliestSnapshot
{
  return self->_earliestSnapshot;
}

- (void)setEarliestSnapshot:(id)a3
{
}

- (SSCAMetalLayerClientResourceUsageSnapshot)latestSnapshot
{
  return self->_latestSnapshot;
}

- (void)setLatestSnapshot:(id)a3
{
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSnapshot, 0);
  objc_storeStrong((id *)&self->_earliestSnapshot, 0);
  objc_storeStrong((id *)&self->_mutableLayerIDToLayerSession, 0);
  objc_storeStrong((id *)&self->_gameSession, 0);
  objc_storeStrong((id *)&self->_mutableResourceSnapshotTimeline, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

@end