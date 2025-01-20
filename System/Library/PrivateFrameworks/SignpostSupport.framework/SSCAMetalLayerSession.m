@interface SSCAMetalLayerSession
- (BOOL)includeTimelines;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableArray)mutableConfigurationTimeline;
- (NSMutableArray)mutableOnGlassDrawableIntervalTimeline;
- (NSMutableArray)mutableStatsTimeline;
- (NSString)debugDescription;
- (SSCAMetalLayerSession)initWithID:(unint64_t)a3 includeTimelines:(BOOL)a4 timebaseRatio:(double)a5;
- (SSCAMetalLayerStats)totalSessionStats;
- (SSInflightCAMetalLayerIntervalStats)inFlightStats;
- (SSOnGlassCAMetalDrawableStats)cachedStats;
- (SSOnGlassCAMetalDrawableStats)onGlassDrawableIntervalStats;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)_dictionaryRepresentation:(BOOL)a3;
- (id)_ingestAggregation:(id)a3 timebaseRatio:(double)a4 parentClientSession:(id)a5 parentAccumulator:(id)a6;
- (id)_ingestConfigurationInterval:(id)a3;
- (id)_ingestOnGlassDrawableInterval:(id)a3;
- (id)_sessionFromFilteredResults:(id)a3 configurationTimeline:(id)a4 errorOut:(id *)a5;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (id)layerSessionFilteredToStartDate:(id)a3 endDate:(id)a4 errorOut:(id *)a5;
- (id)layerSessionFilteredToStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 errorOut:(id *)a5;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)layerID;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (void)setCachedStats:(id)a3;
- (void)setInFlightStats:(id)a3;
- (void)setMutableOnGlassDrawableIntervalTimeline:(id)a3;
@end

@implementation SSCAMetalLayerSession

- (double)startSeconds
{
  unint64_t v3 = [(SSCAMetalLayerSession *)self startMachContinuousTime];
  [(SSCAMetalLayerSession *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSCAMetalLayerSession *)self endMachContinuousTime];
  [(SSCAMetalLayerSession *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSCAMetalLayerSession *)self endMachContinuousTime];
  return v3 - [(SSCAMetalLayerSession *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSCAMetalLayerSession *)self endSeconds];
  double v4 = v3;
  [(SSCAMetalLayerSession *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSCAMetalLayerSession *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSCAMetalLayerSession *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSCAMetalLayerSession *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSCAMetalLayerSession *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSCAMetalLayerSession *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSCAMetalLayerSession *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (SSCAMetalLayerSession)initWithID:(unint64_t)a3 includeTimelines:(BOOL)a4 timebaseRatio:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SSCAMetalLayerSession;
  v8 = [(SSCAMetalLayerSession *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_includeTimelines = a4;
    v8->_layerID = a3;
    v8->_timebaseRatio = a5;
    if ([(SSCAMetalLayerSession *)v8 includeTimelines])
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      mutableStatsTimeline = v9->_mutableStatsTimeline;
      v9->_mutableStatsTimeline = v10;
    }
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableConfigurationTimeline = v9->_mutableConfigurationTimeline;
    v9->_mutableConfigurationTimeline = v12;
  }
  return v9;
}

- (SSOnGlassCAMetalDrawableStats)onGlassDrawableIntervalStats
{
  double v3 = [(SSCAMetalLayerSession *)self cachedStats];

  if (!v3)
  {
    double v4 = [(SSCAMetalLayerSession *)self onGlassDrawableIntervalTimeline];

    if (v4)
    {
      double v5 = [SSOnGlassCAMetalDrawableStats alloc];
      v6 = [(SSCAMetalLayerSession *)self onGlassDrawableIntervalTimeline];
      v7 = [(SSOnGlassCAMetalDrawableStats *)v5 initWithOnGlassDrawableIntervals:v6];
      [(SSCAMetalLayerSession *)self setCachedStats:v7];
    }
  }
  v8 = [(SSCAMetalLayerSession *)self cachedStats];

  return (SSOnGlassCAMetalDrawableStats *)v8;
}

- (id)_ingestConfigurationInterval:(id)a3
{
  id v4 = a3;
  double v5 = [[SSCAMetalLayerConfiguration alloc] initWithInterval:v4];

  v6 = [(SSCAMetalLayerSession *)self mutableConfigurationTimeline];
  v7 = [v6 lastObject];

  if (v7 && [v7 hasEqualConfiguration:v5])
  {
    [v7 updateTimeRange:v5];
  }
  else
  {
    v8 = [(SSCAMetalLayerSession *)self mutableConfigurationTimeline];
    [v8 addObject:v5];
  }
  return 0;
}

- (id)_ingestOnGlassDrawableInterval:(id)a3
{
  id v4 = a3;
  double v5 = [[SSCAMetalLayerOnGlassDrawableInterval alloc] initWithSignpostInterval:v4];

  if (v5)
  {
    v6 = [(SSCAMetalLayerSession *)self mutableOnGlassDrawableIntervalTimeline];

    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(SSCAMetalLayerSession *)self setMutableOnGlassDrawableIntervalTimeline:v7];
    }
    v8 = [(SSCAMetalLayerSession *)self mutableOnGlassDrawableIntervalTimeline];
    [v8 addObject:v5];

    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:@"Malformed on-glass CAMetalDrawable interval"];
  }

  return v9;
}

- (id)_ingestAggregation:(id)a3 timebaseRatio:(double)a4 parentClientSession:(id)a5 parentAccumulator:(id)a6
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 subsystem];
  v14 = [v10 category];
  objc_super v15 = [v10 name];
  BOOL v16 = +[SSInflightCAMetalLayerIntervalStats isInterestingAggregationSubsystem:v13 category:v14 name:v15];

  if (!v16)
  {
    totalSessionStats = 0;
    goto LABEL_28;
  }
  v17 = [(SSCAMetalLayerSession *)self inFlightStats];

  if (v17
    || (id v49 = 0,
        v22 = [[SSInflightCAMetalLayerIntervalStats alloc] initWithAggregation:v10 parentSession:self timebaseRatio:&v49 errorOut:a4], id v19 = v49, [(SSCAMetalLayerSession *)self setInFlightStats:v22], v22, !v19))
  {
    char v48 = 0;
    v18 = [(SSCAMetalLayerSession *)self inFlightStats];
    id v19 = [v18 ingestAggregation:v10 isFinalizedOut:&v48];

    if (![v19 count])
    {
      if (v48)
      {
        v23 = [(SSCAMetalLayerSession *)self inFlightStats];
        [(SSCAMetalLayerSession *)self setInFlightStats:0];
        v24 = [(SSCAMetalLayerSession *)self totalSessionStats];

        if (v24)
        {
          v25 = [(SSCAMetalLayerSession *)self totalSessionStats];
          totalSessionStats = [v25 accumulateFinishedInFlightStats:v23];

          if ([totalSessionStats count])
          {

            goto LABEL_27;
          }
          v27 = [(SSCAMetalLayerSession *)self totalSessionStats];
          [v27 _dropOverallIntervals];
        }
        else
        {
          v26 = [[SSCAMetalLayerStats alloc] initWithInFlightStats:v23];
          totalSessionStats = self->_totalSessionStats;
          self->_totalSessionStats = v26;
        }

        v28 = [v12 layerStatsProcessingBlock];
        v29 = [v12 processingBlockTargetQueue];
        if ([(SSCAMetalLayerSession *)self includeTimelines] || v28)
        {
          v30 = [[SSCAMetalLayerStats alloc] initWithInFlightStats:v23];
          if (v28)
          {
            if (v29)
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __96__SSCAMetalLayerSession__ingestAggregation_timebaseRatio_parentClientSession_parentAccumulator___block_invoke;
              block[3] = &unk_1E5B40630;
              v47 = v28;
              id v44 = v11;
              v45 = self;
              v46 = v30;
              dispatch_async(v29, block);

              v31 = v47;
            }
            else
            {
              unsigned int v38 = [v11 processID];
              uint64_t v42 = [v11 processName];
              v41 = [v11 bundleID];
              v40 = [v11 bundleVersion];
              [v11 bundleShortVersion];
              v32 = v39 = v30;
              unint64_t v36 = [(SSCAMetalLayerSession *)self layerID];
              v37 = [(SSCAMetalLayerSession *)self configurationTimeline];
              v33 = [v37 lastObject];
              ((void (**)(void, void, uint64_t, void *, void *, void *, unint64_t, void *, SSCAMetalLayerStats *))v28)[2](v28, v38, v42, v41, v40, v32, v36, v33, v39);

              v30 = v39;
              v31 = (void *)v42;
            }
          }
          if ([(SSCAMetalLayerSession *)self includeTimelines])
          {
            v34 = [(SSCAMetalLayerSession *)self mutableStatsTimeline];
            [v34 addObject:v30];
          }
        }
      }
      totalSessionStats = 0;
      goto LABEL_27;
    }
    [(SSCAMetalLayerSession *)self setInFlightStats:0];
    id v20 = v19;
  }
  else
  {
    v50[0] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  }
  totalSessionStats = v20;
LABEL_27:

LABEL_28:

  return totalSessionStats;
}

void __96__SSCAMetalLayerSession__ingestAggregation_timebaseRatio_parentClientSession_parentAccumulator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = [*(id *)(a1 + 32) processID];
  id v10 = [*(id *)(a1 + 32) processName];
  id v4 = [*(id *)(a1 + 32) bundleID];
  double v5 = [*(id *)(a1 + 32) bundleVersion];
  v6 = [*(id *)(a1 + 32) bundleShortVersion];
  uint64_t v7 = [*(id *)(a1 + 40) layerID];
  v8 = [*(id *)(a1 + 40) configurationTimeline];
  v9 = [v8 lastObject];
  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, uint64_t, void *, void))(v2 + 16))(v2, v3, v10, v4, v5, v6, v7, v9, *(void *)(a1 + 48));
}

- (id)_dictionaryRepresentation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  double v5 = _timeIntervalDict(self);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerSession layerID](self, "layerID"));
  [v5 setObject:v6 forKeyedSubscript:kSSCAMLSessionKey_LayerID];

  uint64_t v7 = [(SSCAMetalLayerSession *)self totalSessionStats];

  if (v7)
  {
    v8 = [(SSCAMetalLayerSession *)self totalSessionStats];
    v9 = [v8 dictionaryRepresentation];
    [v5 setObject:v9 forKeyedSubscript:kSSCAMLSessionKey_TotalSessionStats];
  }
  id v10 = [(SSCAMetalLayerSession *)self configurationTimeline];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v13 = [(SSCAMetalLayerSession *)self configurationTimeline];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v15);
    }

    [v5 setObject:v12 forKeyedSubscript:kSSCAMLSessionKey_ConfigurationTimeline];
  }
  if (v3)
  {
    id v19 = [(SSCAMetalLayerSession *)self statsTimeline];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v22 = [(SSCAMetalLayerSession *)self statsTimeline];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [*(id *)(*((void *)&v45 + 1) + 8 * j) dictionaryRepresentation];
            [v21 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v54 count:16];
        }
        while (v24);
      }

      [v5 setObject:v21 forKeyedSubscript:kSSCAMLSessionKey_StatsTimeline];
    }
    v28 = [(SSCAMetalLayerSession *)self onGlassDrawableIntervalTimeline];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v31 = [(SSCAMetalLayerSession *)self onGlassDrawableIntervalTimeline];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v42;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v42 != v34) {
              objc_enumerationMutation(v31);
            }
            unint64_t v36 = [*(id *)(*((void *)&v41 + 1) + 8 * k) dictionaryRepresentation];
            [v30 addObject:v36];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v33);
      }

      [v5 setObject:v30 forKeyedSubscript:kSSCAMLSessionKey_OnGlassDrawableTimeline];
    }
  }
  v37 = [(SSCAMetalLayerSession *)self onGlassDrawableIntervalStats];

  if (v37)
  {
    unsigned int v38 = [(SSCAMetalLayerSession *)self onGlassDrawableIntervalStats];
    v39 = [v38 dictionaryRepresentation];
    [v5 setObject:v39 forKeyedSubscript:kSSCAMLSessionKey_OnGlassDrawableStats];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  return [(SSCAMetalLayerSession *)self _dictionaryRepresentation:1];
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerSession *)self jsonDescription:3];
}

- (id)_sessionFromFilteredResults:(id)a3 configurationTimeline:(id)a4 errorOut:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ([v10 count] || objc_msgSend(v9, "count"))
  {
    uint64_t v11 = +[SSCAMetalLayerStats totalStatsFromStatsArray:v9 errorOut:a5];
    if (v11)
    {
      id v12 = [SSCAMetalLayerSession alloc];
      unint64_t v13 = [(SSCAMetalLayerSession *)self layerID];
      [(SSCAMetalLayerSession *)self timebaseRatio];
      uint64_t v14 = -[SSCAMetalLayerSession initWithID:includeTimelines:timebaseRatio:](v12, "initWithID:includeTimelines:timebaseRatio:", v13, 1);
      objc_storeStrong(v14 + 3, v11);
      objc_storeStrong(v14 + 6, a3);
      objc_storeStrong(v14 + 7, a4);
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)layerSessionFilteredToStartDate:(id)a3 endDate:(id)a4 errorOut:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = _dateRangeIntersectionWithValidation(self, v8, v9, a5);
  uint64_t v11 = 0;
  if (v10 >= 2 && v10 != 6)
  {
    if (v10 == 3)
    {
      uint64_t v11 = self;
    }
    else
    {
      id v12 = [(SSCAMetalLayerSession *)self configurationTimeline];
      id v20 = 0;
      unint64_t v13 = _intervalsIntersectingDateRange(v8, v9, v12, 0, &v20);
      id v14 = v20;

      if (a5 && v14)
      {
        uint64_t v11 = 0;
        *a5 = v14;
      }
      else
      {
        uint64_t v15 = [(SSCAMetalLayerSession *)self statsTimeline];
        id v19 = 0;
        uint64_t v16 = _intervalsIntersectingDateRange(v8, v9, v15, 1, &v19);
        id v17 = v19;

        if (a5 && v17)
        {
          uint64_t v11 = 0;
          *a5 = v17;
        }
        else
        {
          uint64_t v11 = [(SSCAMetalLayerSession *)self _sessionFromFilteredResults:v16 configurationTimeline:v13 errorOut:a5];
        }
      }
    }
  }

  return v11;
}

- (id)layerSessionFilteredToStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 errorOut:(id *)a5
{
  unsigned int v9 = _mctIntersectionWithValidation(self, a3, a4, a5);
  unsigned int v10 = 0;
  if (v9 >= 2 && v9 != 6)
  {
    if (v9 == 3)
    {
      unsigned int v10 = self;
    }
    else
    {
      uint64_t v11 = [(SSCAMetalLayerSession *)self configurationTimeline];
      id v12 = _intervalsIntersectingMCTInterval(a3, a4, v11, 0, a5);

      unint64_t v13 = [(SSCAMetalLayerSession *)self statsTimeline];
      id v14 = _intervalsIntersectingMCTInterval(a3, a4, v13, 1, a5);

      unsigned int v10 = [(SSCAMetalLayerSession *)self _sessionFromFilteredResults:v14 configurationTimeline:v12 errorOut:a5];
    }
  }

  return v10;
}

- (NSDate)startDate
{
  uint64_t v2 = [(SSCAMetalLayerSession *)self totalSessionStats];
  BOOL v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  uint64_t v2 = [(SSCAMetalLayerSession *)self totalSessionStats];
  BOOL v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  uint64_t v2 = [(SSCAMetalLayerSession *)self totalSessionStats];
  unint64_t v3 = [v2 startMachContinuousTime];

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  uint64_t v2 = [(SSCAMetalLayerSession *)self totalSessionStats];
  unint64_t v3 = [v2 endMachContinuousTime];

  return v3;
}

- (unint64_t)layerID
{
  return self->_layerID;
}

- (SSCAMetalLayerStats)totalSessionStats
{
  return self->_totalSessionStats;
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (SSInflightCAMetalLayerIntervalStats)inFlightStats
{
  return self->_inFlightStats;
}

- (void)setInFlightStats:(id)a3
{
}

- (NSMutableArray)mutableStatsTimeline
{
  return self->_mutableStatsTimeline;
}

- (NSMutableArray)mutableConfigurationTimeline
{
  return self->_mutableConfigurationTimeline;
}

- (NSMutableArray)mutableOnGlassDrawableIntervalTimeline
{
  return self->_mutableOnGlassDrawableIntervalTimeline;
}

- (void)setMutableOnGlassDrawableIntervalTimeline:(id)a3
{
}

- (SSOnGlassCAMetalDrawableStats)cachedStats
{
  return self->_cachedStats;
}

- (void)setCachedStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStats, 0);
  objc_storeStrong((id *)&self->_mutableOnGlassDrawableIntervalTimeline, 0);
  objc_storeStrong((id *)&self->_mutableConfigurationTimeline, 0);
  objc_storeStrong((id *)&self->_mutableStatsTimeline, 0);
  objc_storeStrong((id *)&self->_inFlightStats, 0);

  objc_storeStrong((id *)&self->_totalSessionStats, 0);
}

@end