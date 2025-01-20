@interface SSInflightCAMetalLayerIntervalStats
+ (BOOL)isInterestingAggregationSubsystem:(id)a3 category:(id)a4 name:(id)a5;
- (NSDate)intervalBeginDate;
- (NSDate)intervalEndDate;
- (SSCAMetalLayerSession)parentSession;
- (SSInflightCAMetalLayerIntervalStats)initWithAggregation:(id)a3 parentSession:(id)a4 timebaseRatio:(double)a5 errorOut:(id *)a6;
- (SignpostAggregation)lateClientPresentStatsAggregation;
- (SignpostAggregation)latePresentOnGlassStatsAggregation;
- (SignpostAggregation)presentedFrameStatsAggregation;
- (SignpostAggregation)skippedFrameStatsAggregation;
- (double)timebaseRatio;
- (id)_checkCollision:(id)a3 existing:(id)a4 label:(id)a5;
- (id)_checkLatenessAggregation:(id)a3 existing:(id)a4 groupName:(id)a5 label:(id)a6;
- (id)_checkPresentedFramesAggregation:(id)a3;
- (id)_checkSkippedFramesAggregation:(id)a3;
- (id)_ingestLateClientPresentAggregation:(id)a3;
- (id)_ingestLatePresentOnGlassAggregation:(id)a3;
- (id)_ingestPresentedFramesAggregation:(id)a3;
- (id)_ingestSkippedFramesAggregation:(id)a3;
- (id)_missingGroupError:(id)a3 label:(id)a4;
- (id)_missingGroupMeasuredValueError:(id)a3 groupName:(id)a4 label:(id)a5;
- (id)ingestAggregation:(id)a3 isFinalizedOut:(BOOL *)a4;
- (unint64_t)intervalBeginMCT;
- (unint64_t)intervalEndMCT;
- (void)_checkAggregation:(id)a3 forGroupName:(id)a4 withMeasuredValues:(id)a5 label:(id)a6 accumulatedErrors:(id)a7;
- (void)_checkFrameStatsAggregation:(id)a3 existing:(id)a4 label:(id)a5 accumulatedErrors:(id)a6;
- (void)setLateClientPresentStatsAggregation:(id)a3;
- (void)setLatePresentOnGlassStatsAggregation:(id)a3;
- (void)setPresentedFrameStatsAggregation:(id)a3;
- (void)setSkippedFrameStatsAggregation:(id)a3;
@end

@implementation SSInflightCAMetalLayerIntervalStats

- (SSInflightCAMetalLayerIntervalStats)initWithAggregation:(id)a3 parentSession:(id)a4 timebaseRatio:(double)a5 errorOut:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SSInflightCAMetalLayerIntervalStats;
  v12 = [(SSInflightCAMetalLayerIntervalStats *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_parentSession, v11);
    v14 = [v10 rawIntervals];
    v15 = [v14 firstObject];

    v13->_intervalBeginMCT = [v15 startMachContinuousTime];
    v13->_intervalEndMCT = [v15 endMachContinuousTime];
    uint64_t v16 = [v15 beginDate];
    intervalBeginDate = v13->_intervalBeginDate;
    v13->_intervalBeginDate = (NSDate *)v16;

    uint64_t v18 = [v15 endDate];
    intervalEndDate = v13->_intervalEndDate;
    v13->_intervalEndDate = (NSDate *)v18;

    v13->_timebaseRatio = a5;
    if (a6) {
      *a6 = 0;
    }
  }
  return v13;
}

+ (BOOL)isInterestingAggregationSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [a3 isEqualToString:kSSCAMLFramePacingSubsystem]
    && [v7 isEqualToString:kSSCAMLFramePacingCategory]
    && (([v8 isEqualToString:kSSCAMLFramePacingPresentedFrameStatsName] & 1) != 0
     || ([v8 isEqualToString:kSSCAMLFramePacingSkippedFrameStatsName] & 1) != 0
     || ([v8 isEqualToString:kSSCAMLFramePacingLateClientPresentStatsName] & 1) != 0
     || [v8 isEqualToString:kSSCAMLFramePacingLateOnGlassStatsName]);

  return v9;
}

- (id)_checkCollision:(id)a3 existing:(id)a4 label:(id)a5
{
  if (a4)
  {
    v5 = [NSString stringWithFormat:@"Collision on %@ aggregation", a5];
    v6 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_missingGroupError:(id)a3 label:(id)a4
{
  v4 = [NSString stringWithFormat:@"Aggregation for %@ missing group '%@'", a4, a3];
  v5 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:v4];

  return v5;
}

- (id)_missingGroupMeasuredValueError:(id)a3 groupName:(id)a4 label:(id)a5
{
  v5 = [NSString stringWithFormat:@"Aggregation for %@, group '%@', missing values for '%@'", a5, a4, a3];
  v6 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:v5];

  return v6;
}

- (void)_checkAggregation:(id)a3 forGroupName:(id)a4 withMeasuredValues:(id)a5 label:(id)a6 accumulatedErrors:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [a3 groupNameToGroupDict];
  v17 = [v16 objectForKeyedSubscript:v12];

  if (v17)
  {
    id v30 = v14;
    v31 = v15;
    id v18 = v12;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v13;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * v23);
          v25 = [v17 measuredValueTypeToMeasuredValueDict];
          v26 = [v25 objectForKeyedSubscript:v24];

          if (!v26)
          {
            v27 = [(SSInflightCAMetalLayerIntervalStats *)self _missingGroupMeasuredValueError:v24 groupName:v18 label:v30];
            [v31 addObject:v27];
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v21);
    }

    id v12 = v18;
    id v13 = v29;
    id v14 = v30;
    id v15 = v31;
  }
  else
  {
    v28 = [(SSInflightCAMetalLayerIntervalStats *)self _missingGroupError:v12 label:v14];
    [v15 addObject:v28];
  }
}

- (void)_checkFrameStatsAggregation:(id)a3 existing:(id)a4 label:(id)a5 accumulatedErrors:(id)a6
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(SSInflightCAMetalLayerIntervalStats *)self _checkCollision:v12 existing:a4 label:v11];
  if (v13) {
    [v10 addObject:v13];
  }

  id v14 = kSSCAMLFPGroup_Frames;
  v16[0] = kSSCAMLFPType_TotalEndToEndWalltime;
  v16[1] = kSSCAMLFPType_CPUEndToEndWalltime;
  v16[2] = kSSCAMLFPType_GPUEndToEndWalltime;
  v16[3] = kSSCAMLFPType_TotalOnGPUWalltime;
  v16[4] = kSSCAMLFPType_GPUDoneToCompletion;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
  [(SSInflightCAMetalLayerIntervalStats *)self _checkAggregation:v12 forGroupName:v14 withMeasuredValues:v15 label:v11 accumulatedErrors:v10];

  [(SSInflightCAMetalLayerIntervalStats *)self _checkAggregation:v12 forGroupName:kSSCAMLFPGroup_FrameCommandBuffers withMeasuredValues:MEMORY[0x1E4F1CBF0] label:v11 accumulatedErrors:v10];
}

- (id)_checkPresentedFramesAggregation:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(SSInflightCAMetalLayerIntervalStats *)self presentedFrameStatsAggregation];
  [(SSInflightCAMetalLayerIntervalStats *)self _checkFrameStatsAggregation:v5 existing:v7 label:@"presented frame stats" accumulatedErrors:v6];

  id v8 = kSSCAMLFPGroup_PresentedFrameIntervals;
  v13[0] = kSSCAMLFPType_TimeOnGlass;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(SSInflightCAMetalLayerIntervalStats *)self _checkAggregation:v5 forGroupName:v8 withMeasuredValues:v9 label:@"frame-on-glass interval stats" accumulatedErrors:v6];

  if ([v6 count]) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (id)_ingestPresentedFramesAggregation:(id)a3
{
  id v4 = a3;
  id v5 = [(SSInflightCAMetalLayerIntervalStats *)self _checkPresentedFramesAggregation:v4];
  if ([v5 count])
  {
    id v6 = v5;
  }
  else
  {
    [(SSInflightCAMetalLayerIntervalStats *)self setPresentedFrameStatsAggregation:v4];
    id v6 = 0;
  }

  return v6;
}

- (id)_checkSkippedFramesAggregation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(SSInflightCAMetalLayerIntervalStats *)self skippedFrameStatsAggregation];
  [(SSInflightCAMetalLayerIntervalStats *)self _checkFrameStatsAggregation:v5 existing:v7 label:@"skipped frame stats" accumulatedErrors:v6];

  if ([v6 count]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)_ingestSkippedFramesAggregation:(id)a3
{
  id v4 = a3;
  id v5 = [(SSInflightCAMetalLayerIntervalStats *)self _checkSkippedFramesAggregation:v4];
  if ([v5 count])
  {
    id v6 = v5;
  }
  else
  {
    [(SSInflightCAMetalLayerIntervalStats *)self setSkippedFrameStatsAggregation:v4];
    id v6 = 0;
  }

  return v6;
}

- (id)_checkLatenessAggregation:(id)a3 existing:(id)a4 groupName:(id)a5 label:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v13 = a5;
  id v14 = a4;
  id v15 = objc_alloc_init(v12);
  uint64_t v16 = [(SSInflightCAMetalLayerIntervalStats *)self _checkCollision:v10 existing:v14 label:v11];

  if (v16) {
    [v15 addObject:v16];
  }

  v21[0] = kSSCAMLFPType_Lateness;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(SSInflightCAMetalLayerIntervalStats *)self _checkAggregation:v10 forGroupName:v13 withMeasuredValues:v17 label:v11 accumulatedErrors:v15];

  if ([v15 count]) {
    id v18 = v15;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  return v19;
}

- (id)_ingestLateClientPresentAggregation:(id)a3
{
  id v4 = a3;
  id v5 = [(SSInflightCAMetalLayerIntervalStats *)self lateClientPresentStatsAggregation];
  id v6 = [(SSInflightCAMetalLayerIntervalStats *)self _checkLatenessAggregation:v4 existing:v5 groupName:kSSCAMLFPGroup_LateClientDrawablePresents label:@"late client drawable present stats"];

  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    [(SSInflightCAMetalLayerIntervalStats *)self setLateClientPresentStatsAggregation:v4];
    id v7 = 0;
  }

  return v7;
}

- (id)_ingestLatePresentOnGlassAggregation:(id)a3
{
  id v4 = a3;
  id v5 = [(SSInflightCAMetalLayerIntervalStats *)self latePresentOnGlassStatsAggregation];
  id v6 = [(SSInflightCAMetalLayerIntervalStats *)self _checkLatenessAggregation:v4 existing:v5 groupName:kSSCAMLFPGroup_LateOnGlassPresents label:@"late on-glass present stats"];

  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    [(SSInflightCAMetalLayerIntervalStats *)self setLatePresentOnGlassStatsAggregation:v4];
    id v7 = 0;
  }

  return v7;
}

- (id)ingestAggregation:(id)a3 isFinalizedOut:(BOOL *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 rawIntervals];
  id v8 = [v7 firstObject];

  uint64_t v9 = [v8 startMachContinuousTime];
  if (v9 != [(SSInflightCAMetalLayerIntervalStats *)self intervalBeginMCT]
    || (uint64_t v10 = [v8 endMachContinuousTime],
        v10 != [(SSInflightCAMetalLayerIntervalStats *)self intervalEndMCT]))
  {
    id v14 = NSString;
    id v15 = [v6 name];
    uint64_t v16 = [v14 stringWithFormat:@"Aggregation '%@': Misaligned aggregation intervals: %llu -> %llu (aggregation) vs. %llu -> %llu (stats)", v15, objc_msgSend(v8, "startMachContinuousTime"), objc_msgSend(v8, "endMachContinuousTime"), -[SSInflightCAMetalLayerIntervalStats intervalBeginMCT](self, "intervalBeginMCT"), -[SSInflightCAMetalLayerIntervalStats intervalEndMCT](self, "intervalEndMCT")];

    v17 = [MEMORY[0x1E4F28C58] errorWithCode:11 description:v16];
    v26[0] = v17;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

    goto LABEL_7;
  }
  *a4 = 0;
  id v11 = [v6 name];
  int v12 = [v11 isEqualToString:kSSCAMLFramePacingPresentedFrameStatsName];

  if (!v12)
  {
    id v19 = [v6 name];
    int v20 = [v19 isEqualToString:kSSCAMLFramePacingSkippedFrameStatsName];

    if (v20)
    {
      uint64_t v21 = [(SSInflightCAMetalLayerIntervalStats *)self _ingestSkippedFramesAggregation:v6];
    }
    else
    {
      uint64_t v22 = [v6 name];
      int v23 = [v22 isEqualToString:kSSCAMLFramePacingLateClientPresentStatsName];

      if (v23)
      {
        uint64_t v21 = [(SSInflightCAMetalLayerIntervalStats *)self _ingestLateClientPresentAggregation:v6];
      }
      else
      {
        uint64_t v24 = [v6 name];
        int v25 = [v24 isEqualToString:kSSCAMLFramePacingLateOnGlassStatsName];

        if (!v25)
        {
          id v13 = 0;
          goto LABEL_7;
        }
        uint64_t v21 = [(SSInflightCAMetalLayerIntervalStats *)self _ingestLatePresentOnGlassAggregation:v6];
      }
    }
    id v13 = (void *)v21;
    goto LABEL_7;
  }
  id v13 = [(SSInflightCAMetalLayerIntervalStats *)self _ingestPresentedFramesAggregation:v6];
  if (![v13 count]) {
    *a4 = 1;
  }
LABEL_7:

  return v13;
}

- (SSCAMetalLayerSession)parentSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);

  return (SSCAMetalLayerSession *)WeakRetained;
}

- (unint64_t)intervalBeginMCT
{
  return self->_intervalBeginMCT;
}

- (unint64_t)intervalEndMCT
{
  return self->_intervalEndMCT;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (NSDate)intervalBeginDate
{
  return self->_intervalBeginDate;
}

- (NSDate)intervalEndDate
{
  return self->_intervalEndDate;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latePresentOnGlassStatsAggregation, 0);
  objc_storeStrong((id *)&self->_lateClientPresentStatsAggregation, 0);
  objc_storeStrong((id *)&self->_skippedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_presentedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_intervalEndDate, 0);
  objc_storeStrong((id *)&self->_intervalBeginDate, 0);

  objc_destroyWeak((id *)&self->_parentSession);
}

@end