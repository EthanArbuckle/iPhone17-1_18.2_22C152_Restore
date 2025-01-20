@interface SSCAMetalLayerStats
+ (id)totalStatsFromStatsArray:(id)a3 errorOut:(id *)a4;
- (BOOL)includeTimelines;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)debugDescription;
- (SSCAMLDurationStats)frameOnGlassIntervalStats;
- (SSCAMLDurationStats)lateClientPresentStats;
- (SSCAMLDurationStats)lateOnGlassPresentStats;
- (SSCAMetalLayerFrameStats)presentedFrameStats;
- (SSCAMetalLayerFrameStats)skippedFrameStats;
- (SSCAMetalLayerStats)initWithInFlightStats:(id)a3;
- (SignpostAggregation)lateClientPresentStatsAggregation;
- (SignpostAggregation)latePresentOnGlassStatsAggregation;
- (SignpostAggregation)presentedFrameStatsAggregation;
- (SignpostAggregation)skippedFrameStatsAggregation;
- (double)activeSeconds;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (double)totalDurationSeconds;
- (float)durationSeconds;
- (id)_accumulateNewAggregations:(id)a3 skippedFrameStatsAggregation:(id)a4 lateClientPresentStatsAggregation:(id)a5 latePresentOnGlassStatsAggregation:(id)a6 intervalBeginMCT:(unint64_t)a7 intervalEndMCT:(unint64_t)a8 intervalBeginDate:(id)a9 intervalEndDate:(id)a10;
- (id)_initEmpty:(double)a3;
- (id)accumulateFinishedInFlightStats:(id)a3;
- (id)accumulateNewStats:(id)a3;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)intervalCount;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (void)_dropOverallIntervals;
- (void)_updateStatsWithPresentedFrameStatsAggregation:(id)a3 skippedAggregation:(id)a4 lateClientPresentAggregation:(id)a5 lateOnGlassPresentAggregation:(id)a6;
- (void)setEndDate:(id)a3;
- (void)setEndMachContinuousTime:(unint64_t)a3;
- (void)setLateClientPresentStatsAggregation:(id)a3;
- (void)setLatePresentOnGlassStatsAggregation:(id)a3;
- (void)setPresentedFrameStatsAggregation:(id)a3;
- (void)setSkippedFrameStatsAggregation:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartMachContinuousTime:(unint64_t)a3;
@end

@implementation SSCAMetalLayerStats

- (double)startSeconds
{
  unint64_t v3 = [(SSCAMetalLayerStats *)self startMachContinuousTime];
  [(SSCAMetalLayerStats *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSCAMetalLayerStats *)self endMachContinuousTime];
  [(SSCAMetalLayerStats *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSCAMetalLayerStats *)self endMachContinuousTime];
  return v3 - [(SSCAMetalLayerStats *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSCAMetalLayerStats *)self endSeconds];
  double v4 = v3;
  [(SSCAMetalLayerStats *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSCAMetalLayerStats *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSCAMetalLayerStats *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSCAMetalLayerStats *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSCAMetalLayerStats *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSCAMetalLayerStats *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSCAMetalLayerStats *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (BOOL)includeTimelines
{
  return 1;
}

- (void)_updateStatsWithPresentedFrameStatsAggregation:(id)a3 skippedAggregation:(id)a4 lateClientPresentAggregation:(id)a5 lateOnGlassPresentAggregation:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[SSCAMetalLayerFrameStats alloc] initWithSignpostAggregation:v13 parentIntervalStats:self];
  presentedFrameStats = self->_presentedFrameStats;
  self->_presentedFrameStats = v14;

  _durationStat(v13, kSSCAMLFPGroup_PresentedFrameIntervals, kSSCAMLFPType_TimeOnGlass);
  v16 = (SSCAMLDurationStats *)objc_claimAutoreleasedReturnValue();

  frameOnGlassIntervalStats = self->_frameOnGlassIntervalStats;
  self->_frameOnGlassIntervalStats = v16;

  v18 = [[SSCAMetalLayerFrameStats alloc] initWithSignpostAggregation:v12 parentIntervalStats:self];
  skippedFrameStats = self->_skippedFrameStats;
  self->_skippedFrameStats = v18;

  _durationStat(v11, kSSCAMLFPGroup_LateClientDrawablePresents, kSSCAMLFPType_Lateness);
  v20 = (SSCAMLDurationStats *)objc_claimAutoreleasedReturnValue();

  lateClientPresentStats = self->_lateClientPresentStats;
  self->_lateClientPresentStats = v20;

  _durationStat(v10, kSSCAMLFPGroup_LateOnGlassPresents, kSSCAMLFPType_Lateness);
  v22 = (SSCAMLDurationStats *)objc_claimAutoreleasedReturnValue();

  lateOnGlassPresentStats = self->_lateOnGlassPresentStats;
  self->_lateOnGlassPresentStats = v22;
}

- (id)_initEmpty:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSCAMetalLayerStats;
  id result = [(SSCAMetalLayerStats *)&v5 init];
  if (result)
  {
    *(_OWORD *)((char *)result + 88) = xmmword_1A45C25E0;
    *((double *)result + 15) = a3;
  }
  return result;
}

- (SSCAMetalLayerStats)initWithInFlightStats:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SSCAMetalLayerStats;
  objc_super v5 = [(SSCAMetalLayerStats *)&v29 init];
  v6 = v5;
  if (v5)
  {
    v5->_intervalCount = 1;
    v5->_startMachContinuousTime = [v4 intervalBeginMCT];
    uint64_t v7 = [v4 intervalBeginDate];
    startDate = v6->_startDate;
    v6->_startDate = (NSDate *)v7;

    v6->_endMachContinuousTime = [v4 intervalEndMCT];
    uint64_t v9 = [v4 intervalEndDate];
    endDate = v6->_endDate;
    v6->_endDate = (NSDate *)v9;

    [v4 timebaseRatio];
    v6->_timebaseRatio = v11;
    id v12 = [v4 presentedFrameStatsAggregation];
    id v13 = [v4 skippedFrameStatsAggregation];
    v14 = [v4 lateClientPresentStatsAggregation];
    v15 = [v4 latePresentOnGlassStatsAggregation];
    [(SSCAMetalLayerStats *)v6 _updateStatsWithPresentedFrameStatsAggregation:v12 skippedAggregation:v13 lateClientPresentAggregation:v14 lateOnGlassPresentAggregation:v15];

    v16 = [v4 presentedFrameStatsAggregation];
    uint64_t v17 = [v16 copy];
    presentedFrameStatsAggregation = v6->_presentedFrameStatsAggregation;
    v6->_presentedFrameStatsAggregation = (SignpostAggregation *)v17;

    v19 = [v4 skippedFrameStatsAggregation];
    uint64_t v20 = [v19 copy];
    skippedFrameStatsAggregation = v6->_skippedFrameStatsAggregation;
    v6->_skippedFrameStatsAggregation = (SignpostAggregation *)v20;

    v22 = [v4 lateClientPresentStatsAggregation];
    uint64_t v23 = [v22 copy];
    lateClientPresentStatsAggregation = v6->_lateClientPresentStatsAggregation;
    v6->_lateClientPresentStatsAggregation = (SignpostAggregation *)v23;

    v25 = [v4 latePresentOnGlassStatsAggregation];
    uint64_t v26 = [v25 copy];
    latePresentOnGlassStatsAggregation = v6->_latePresentOnGlassStatsAggregation;
    v6->_latePresentOnGlassStatsAggregation = (SignpostAggregation *)v26;
  }
  return v6;
}

- (void)_dropOverallIntervals
{
  double v3 = [(SSCAMetalLayerStats *)self presentedFrameStatsAggregation];
  [v3 dropRawIntervals];

  id v4 = [(SSCAMetalLayerStats *)self skippedFrameStatsAggregation];
  [v4 dropRawIntervals];

  objc_super v5 = [(SSCAMetalLayerStats *)self lateClientPresentStatsAggregation];
  [v5 dropRawIntervals];

  id v6 = [(SSCAMetalLayerStats *)self latePresentOnGlassStatsAggregation];
  [v6 dropRawIntervals];
}

- (id)_accumulateNewAggregations:(id)a3 skippedFrameStatsAggregation:(id)a4 lateClientPresentStatsAggregation:(id)a5 latePresentOnGlassStatsAggregation:(id)a6 intervalBeginMCT:(unint64_t)a7 intervalEndMCT:(unint64_t)a8 intervalBeginDate:(id)a9 intervalEndDate:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v52 = a9;
  id v51 = a10;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v50 = a8;
  if (v16)
  {
    v21 = [(SSCAMetalLayerStats *)self presentedFrameStatsAggregation];

    if (v21)
    {
      v22 = [(SSCAMetalLayerStats *)self presentedFrameStatsAggregation];
      uint64_t v23 = [v22 addAggregation:v16];

      BOOL v24 = v23 == 0;
      if (v23)
      {
        [v20 addObject:v23];
        BOOL v24 = 0;
      }
    }
    else
    {
      uint64_t v23 = (void *)[v16 copy];
      [(SSCAMetalLayerStats *)self setPresentedFrameStatsAggregation:v23];
      BOOL v24 = 1;
    }

    if (v17)
    {
LABEL_9:
      v25 = [(SSCAMetalLayerStats *)self skippedFrameStatsAggregation];

      if (v25)
      {
        uint64_t v26 = [(SSCAMetalLayerStats *)self skippedFrameStatsAggregation];
        v27 = [v26 addAggregation:v17];

        if (v27)
        {
          [v20 addObject:v27];
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        v27 = (void *)[v17 copy];
        [(SSCAMetalLayerStats *)self setSkippedFrameStatsAggregation:v27];
      }
      BOOL v24 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v24 = 0;
    if (v17) {
      goto LABEL_9;
    }
  }
LABEL_15:
  if (!v18) {
    goto LABEL_22;
  }
  v28 = [(SSCAMetalLayerStats *)self lateClientPresentStatsAggregation];

  if (!v28)
  {
    v30 = (void *)[v18 copy];
    [(SSCAMetalLayerStats *)self setLateClientPresentStatsAggregation:v30];
    goto LABEL_20;
  }
  objc_super v29 = [(SSCAMetalLayerStats *)self lateClientPresentStatsAggregation];
  v30 = [v29 addAggregation:v18];

  if (!v30)
  {
LABEL_20:
    BOOL v24 = 1;
    goto LABEL_21;
  }
  [v20 addObject:v30];
LABEL_21:

LABEL_22:
  if (!v19) {
    goto LABEL_29;
  }
  v31 = [(SSCAMetalLayerStats *)self latePresentOnGlassStatsAggregation];

  if (!v31)
  {
    v33 = (void *)[v19 copy];
    [(SSCAMetalLayerStats *)self setLatePresentOnGlassStatsAggregation:v33];
    goto LABEL_27;
  }
  v32 = [(SSCAMetalLayerStats *)self latePresentOnGlassStatsAggregation];
  v33 = [v32 addAggregation:v19];

  if (!v33)
  {
LABEL_27:
    BOOL v24 = 1;
    goto LABEL_28;
  }
  [v20 addObject:v33];
LABEL_28:

LABEL_29:
  if ([v20 count])
  {
    id v34 = v20;
  }
  else
  {
    unint64_t v35 = [(SSCAMetalLayerStats *)self startMachContinuousTime];
    if (v35 >= a7) {
      unint64_t v36 = a7;
    }
    else {
      unint64_t v36 = v35;
    }
    if (v35 + 1 >= 2) {
      unint64_t v37 = v36;
    }
    else {
      unint64_t v37 = a7;
    }
    [(SSCAMetalLayerStats *)self setStartMachContinuousTime:v37];
    unint64_t v38 = [(SSCAMetalLayerStats *)self endMachContinuousTime];
    if (v38 <= v50) {
      unint64_t v39 = v50;
    }
    else {
      unint64_t v39 = v38;
    }
    if (v38 + 1 >= 2) {
      unint64_t v40 = v39;
    }
    else {
      unint64_t v40 = v50;
    }
    [(SSCAMetalLayerStats *)self setEndMachContinuousTime:v40];
    v41 = [(SSCAMetalLayerStats *)self startDate];
    v42 = _getEarliestDate(v41, v52);
    [(SSCAMetalLayerStats *)self setStartDate:v42];

    v43 = [(SSCAMetalLayerStats *)self endDate];
    v44 = _getLatestDate(v43, v51);
    [(SSCAMetalLayerStats *)self setEndDate:v44];

    if (v24)
    {
      v45 = [(SSCAMetalLayerStats *)self presentedFrameStatsAggregation];
      v46 = [(SSCAMetalLayerStats *)self skippedFrameStatsAggregation];
      v47 = [(SSCAMetalLayerStats *)self lateClientPresentStatsAggregation];
      v48 = [(SSCAMetalLayerStats *)self latePresentOnGlassStatsAggregation];
      [(SSCAMetalLayerStats *)self _updateStatsWithPresentedFrameStatsAggregation:v45 skippedAggregation:v46 lateClientPresentAggregation:v47 lateOnGlassPresentAggregation:v48];

      id v34 = 0;
      ++self->_intervalCount;
    }
    else
    {
      id v34 = 0;
    }
  }

  return v34;
}

- (id)accumulateFinishedInFlightStats:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 presentedFrameStatsAggregation];
  id v6 = [v4 skippedFrameStatsAggregation];
  uint64_t v7 = [v4 lateClientPresentStatsAggregation];
  v8 = [v4 latePresentOnGlassStatsAggregation];
  uint64_t v9 = [v4 intervalBeginMCT];
  uint64_t v10 = [v4 intervalEndMCT];
  double v11 = [v4 intervalBeginDate];
  id v12 = [v4 intervalEndDate];

  id v13 = [(SSCAMetalLayerStats *)self _accumulateNewAggregations:v5 skippedFrameStatsAggregation:v6 lateClientPresentStatsAggregation:v7 latePresentOnGlassStatsAggregation:v8 intervalBeginMCT:v9 intervalEndMCT:v10 intervalBeginDate:v11 intervalEndDate:v12];

  return v13;
}

- (id)accumulateNewStats:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 presentedFrameStatsAggregation];
  id v6 = [v4 skippedFrameStatsAggregation];
  uint64_t v7 = [v4 lateClientPresentStatsAggregation];
  v8 = [v4 latePresentOnGlassStatsAggregation];
  uint64_t v9 = [v4 startMachContinuousTime];
  uint64_t v10 = [v4 endMachContinuousTime];
  double v11 = [v4 startDate];
  id v12 = [v4 endDate];

  id v13 = [(SSCAMetalLayerStats *)self _accumulateNewAggregations:v5 skippedFrameStatsAggregation:v6 lateClientPresentStatsAggregation:v7 latePresentOnGlassStatsAggregation:v8 intervalBeginMCT:v9 intervalEndMCT:v10 intervalBeginDate:v11 intervalEndDate:v12];

  return v13;
}

- (double)totalDurationSeconds
{
  [(SSCAMetalLayerStats *)self durationSeconds];
  return v2;
}

- (double)activeSeconds
{
  uint64_t v3 = [(SSCAMetalLayerStats *)self presentedFrameStatsAggregation];
  if (v3
    && (id v4 = (void *)v3, v5 = [(SSCAMetalLayerStats *)self intervalCount], v4, v5 >= 2))
  {
    id v6 = [(SSCAMetalLayerStats *)self presentedFrameStatsAggregation];
    [v6 durationSeconds];
    double v8 = v7;

    return v8;
  }
  else
  {
    [(SSCAMetalLayerStats *)self totalDurationSeconds];
  }
  return result;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = _timeIntervalDict(self);
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerStats intervalCount](self, "intervalCount"));
  [v3 setObject:v4 forKeyedSubscript:kSSCAMLStatsKey_IntervalCount];

  unint64_t v5 = NSNumber;
  [(SSCAMetalLayerStats *)self totalDurationSeconds];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:kSSCAMLStatsKey_TotalDurationSeconds];

  double v7 = NSNumber;
  [(SSCAMetalLayerStats *)self activeSeconds];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:kSSCAMLStatsKey_ActiveSeconds];

  uint64_t v9 = [(SSCAMetalLayerStats *)self presentedFrameStats];
  uint64_t v10 = [v9 dictionaryRepresentation];
  [v3 setObject:v10 forKeyedSubscript:kSSCAMLStatsKey_PresentedFrame];

  double v11 = [(SSCAMetalLayerStats *)self skippedFrameStats];
  id v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:kSSCAMLStatsKey_SkippedFrameStats];

  id v13 = [(SSCAMetalLayerStats *)self frameOnGlassIntervalStats];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:kSSCAMLStatsKey_FrameOnGlassIntervalStats];

  v15 = [(SSCAMetalLayerStats *)self lateClientPresentStats];
  id v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:kSSCAMLStatsKey_LateClientPresentStats];

  id v17 = [(SSCAMetalLayerStats *)self lateOnGlassPresentStats];
  id v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:kSSCAMLStatsKey_LateOnGlassPresents];

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerStats *)self jsonDescription:3];
}

+ (id)totalStatsFromStatsArray:(id)a3 errorOut:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [SSCAMetalLayerStats alloc];
    double v7 = [v5 firstObject];
    [v7 timebaseRatio];
    id v8 = -[SSCAMetalLayerStats _initEmpty:](v6, "_initEmpty:");

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(v8, "accumulateNewStats:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          if ([v14 count])
          {
            if (a4)
            {
              *a4 = [v14 firstObject];
            }

            goto LABEL_17;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ([v8 intervalCount])
    {
      id v15 = [v8 startDate];
      if (!v15)
      {
LABEL_18:

        goto LABEL_20;
      }
      id v16 = [v8 endDate];

      if (v16)
      {
        id v15 = v8;
        goto LABEL_18;
      }
    }
LABEL_17:
    id v15 = 0;
    goto LABEL_18;
  }
  id v15 = 0;
LABEL_20:

  return v15;
}

- (unint64_t)intervalCount
{
  return self->_intervalCount;
}

- (SSCAMetalLayerFrameStats)presentedFrameStats
{
  return self->_presentedFrameStats;
}

- (SSCAMetalLayerFrameStats)skippedFrameStats
{
  return self->_skippedFrameStats;
}

- (SSCAMLDurationStats)frameOnGlassIntervalStats
{
  return self->_frameOnGlassIntervalStats;
}

- (SSCAMLDurationStats)lateClientPresentStats
{
  return self->_lateClientPresentStats;
}

- (SSCAMLDurationStats)lateOnGlassPresentStats
{
  return self->_lateOnGlassPresentStats;
}

- (SignpostAggregation)presentedFrameStatsAggregation
{
  return self->_presentedFrameStatsAggregation;
}

- (void)setPresentedFrameStatsAggregation:(id)a3
{
}

- (SignpostAggregation)skippedFrameStatsAggregation
{
  return self->_skippedFrameStatsAggregation;
}

- (void)setSkippedFrameStatsAggregation:(id)a3
{
}

- (SignpostAggregation)lateClientPresentStatsAggregation
{
  return self->_lateClientPresentStatsAggregation;
}

- (void)setLateClientPresentStatsAggregation:(id)a3
{
}

- (SignpostAggregation)latePresentOnGlassStatsAggregation
{
  return self->_latePresentOnGlassStatsAggregation;
}

- (void)setLatePresentOnGlassStatsAggregation:(id)a3
{
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (void)setStartMachContinuousTime:(unint64_t)a3
{
  self->_startMachContinuousTime = a3;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)setEndMachContinuousTime:(unint64_t)a3
{
  self->_endMachContinuousTime = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_latePresentOnGlassStatsAggregation, 0);
  objc_storeStrong((id *)&self->_lateClientPresentStatsAggregation, 0);
  objc_storeStrong((id *)&self->_skippedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_presentedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_lateOnGlassPresentStats, 0);
  objc_storeStrong((id *)&self->_lateClientPresentStats, 0);
  objc_storeStrong((id *)&self->_frameOnGlassIntervalStats, 0);
  objc_storeStrong((id *)&self->_skippedFrameStats, 0);

  objc_storeStrong((id *)&self->_presentedFrameStats, 0);
}

@end