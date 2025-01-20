@interface SBAlwaysOnTelemetryMetrics
- (SBAlwaysOnTelemetryMetrics)init;
- (_SBMachContinuousStopwatch)_stopWatchForBacklightState:(uint64_t)a1;
- (double)_timeForBacklightState:(uint64_t)a1;
- (id)dataForAnalyticsEvent:(id)a3;
- (id)dataForPowerlogEvent:(id)a3;
- (void)_activateStopWatch:(uint64_t)a1;
- (void)accumulateDiscardHistogram:(id)a3;
- (void)accumulateInvalidationHistogram:(id)a3;
- (void)accumulatePresentationSources:(id)a3;
- (void)accumulateRenderHistogram:(id)a3;
- (void)setBacklightState:(int64_t)a3;
@end

@implementation SBAlwaysOnTelemetryMetrics

- (SBAlwaysOnTelemetryMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBAlwaysOnTelemetryMetrics;
  v2 = [(SBAlwaysOnTelemetryMetrics *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    stopWatches = v2->_stopWatches;
    v2->_stopWatches = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setBacklightState:(int64_t)a3
{
  v5 = -[SBAlwaysOnTelemetryMetrics _stopWatchForBacklightState:]((uint64_t)self, a3);
  -[SBAlwaysOnTelemetryMetrics _activateStopWatch:]((uint64_t)self, v5);

  stateChangeCounts = self->_stateChangeCounts;
  if (stateChangeCounts)
  {
    v7 = NSNumber;
    uint64_t v14 = [NSNumber numberWithInteger:a3];
    v8 = [(NSMutableDictionary *)stateChangeCounts objectForKeyedSubscript:v14];
    v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue") + 1);
    v10 = self->_stateChangeCounts;
    v11 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];

    v12 = (NSMutableDictionary *)v14;
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = self->_stateChangeCounts;
    self->_stateChangeCounts = v13;
  }
}

- (_SBMachContinuousStopwatch)_stopWatchForBacklightState:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v5 = [NSNumber numberWithInteger:a2];
    objc_super v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      objc_super v6 = objc_alloc_init(_SBMachContinuousStopwatch);
      v7 = *(void **)(a1 + 8);
      v8 = [NSNumber numberWithInteger:a2];
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (void)_activateStopWatch:(uint64_t)a1
{
  v4 = a2;
  if (a1)
  {
    v7 = *(unsigned char **)(a1 + 24);
    v5 = (id *)(a1 + 24);
    objc_super v6 = v7;
    if (v7 != v4)
    {
      v10 = v4;
      if (v6)
      {
        uint64_t v8 = mach_continuous_time();
        v6[8] = 0;
        *((void *)v6 + 3) += v8 - *((void *)v6 + 2);
      }
      objc_storeStrong(v5, a2);
      v9 = *v5;
      v4 = v10;
      if (v9)
      {
        v9[8] = 1;
        *((void *)v9 + 2) = mach_continuous_time();
        v4 = v10;
      }
    }
  }
}

- (void)accumulateRenderHistogram:(id)a3
{
  id v55 = a3;
  unint64_t renderedFrameCount = self->_renderedFrameCount;
  self->_unint64_t renderedFrameCount = renderedFrameCount + [v55 totalCount];
  [v55 presentationDuration];
  self->_renderedPartialMinuteCount = (unint64_t)(ceil(v5 / 60.0) + (double)self->_renderedPartialMinuteCount);
  objc_super v6 = [v55 presentationTimeHistogram];
  uint64_t v7 = [v6 count];
  uint64_t v8 = v7;
  switch(v7)
  {
    case 0:
      goto LABEL_11;
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    default:
      if (v7 >= 7)
      {
        uint64_t v9 = 6;
        do
        {
          v10 = [v6 objectAtIndexedSubscript:v9];
          self->_renderedFramesMoreThan6Min += [v10 unsignedIntegerValue];

          ++v9;
        }
        while (v8 != v9);
      }
LABEL_5:
      v11 = [v6 objectAtIndexedSubscript:5];
      self->_renderedFrames5to6Min += [v11 unsignedIntegerValue];

LABEL_6:
      v12 = [v6 objectAtIndexedSubscript:4];
      self->_renderedFrames4to5Min += [v12 unsignedIntegerValue];

LABEL_7:
      v13 = [v6 objectAtIndexedSubscript:3];
      self->_renderedFrames3to4Min += [v13 unsignedIntegerValue];

LABEL_8:
      uint64_t v14 = [v6 objectAtIndexedSubscript:2];
      self->_renderedFrames2to3Min += [v14 unsignedIntegerValue];

LABEL_9:
      v15 = [v6 objectAtIndexedSubscript:1];
      self->_renderedFrames1to2Min += [v15 unsignedIntegerValue];

LABEL_10:
      v16 = [v6 objectAtIndexedSubscript:0];
      self->_renderedFramesLessThan1Min += [v16 unsignedIntegerValue];

LABEL_11:
      minimumAPL = self->_minimumAPL;
      v18 = NSNumber;
      [v55 lowestAPL];
      v19 = objc_msgSend(v18, "numberWithFloat:");
      NSNumberDoubleMin(minimumAPL, v19);
      v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v21 = self->_minimumAPL;
      self->_minimumAPL = v20;

      maximumAPL = self->_maximumAPL;
      v23 = NSNumber;
      [v55 highestAPL];
      v24 = objc_msgSend(v23, "numberWithFloat:");
      NSNumberDoubleMax(maximumAPL, v24);
      v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v26 = self->_maximumAPL;
      self->_maximumAPL = v25;

      [v55 averageAPL];
      float v28 = v27;
      if (self->_averageAPL) {
        averageAPL = self->_averageAPL;
      }
      else {
        averageAPL = (NSNumber *)&unk_1F3348E48;
      }
      [(NSNumber *)averageAPL doubleValue];
      double v31 = v30;
      if ([v55 totalCount])
      {
        v32 = NSNumber;
        unint64_t v33 = [v55 totalCount];
        v34 = [v32 numberWithDouble:(double)v33 / ((double)renderedFrameCount + (double)v33) * v28+ (double)renderedFrameCount / ((double)renderedFrameCount + (double)v33) * v31];
        v35 = self->_averageAPL;
        self->_averageAPL = v34;
      }
      minimumAPLDimming = self->_minimumAPLDimming;
      v37 = NSNumber;
      [v55 lowestAPLDimming];
      v38 = objc_msgSend(v37, "numberWithFloat:");
      NSNumberDoubleMin(minimumAPLDimming, v38);
      v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v40 = self->_minimumAPLDimming;
      self->_minimumAPLDimming = v39;

      maximumAPLDimming = self->_maximumAPLDimming;
      v42 = NSNumber;
      [v55 highestAPLDimming];
      v43 = objc_msgSend(v42, "numberWithFloat:");
      NSNumberDoubleMax(maximumAPLDimming, v43);
      v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v45 = self->_maximumAPLDimming;
      self->_maximumAPLDimming = v44;

      [v55 averageAPLDimming];
      float v47 = v46;
      if (self->_averageAPLDimming) {
        averageAPLDimming = self->_averageAPLDimming;
      }
      else {
        averageAPLDimming = (NSNumber *)&unk_1F3348E48;
      }
      [(NSNumber *)averageAPLDimming doubleValue];
      double v50 = v49;
      if ([v55 totalCount])
      {
        v51 = NSNumber;
        unint64_t v52 = [v55 totalCount];
        v53 = [v51 numberWithDouble:(double)v52 / ((double)renderedFrameCount + (double)v52) * v47+ (double)renderedFrameCount / ((double)renderedFrameCount + (double)v52) * v50];
        v54 = self->_averageAPLDimming;
        self->_averageAPLDimming = v53;
      }

      return;
  }
}

- (void)accumulateInvalidationHistogram:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 totalCount];
  uint64_t v6 = [v4 countLessThan1Min];
  uint64_t v7 = v5 - (v6 + [v4 count1to2Min]);
  uint64_t v8 = v7 - [v4 count2to3Min];
  uint64_t v9 = v8 - [v4 count3to4Min];
  LODWORD(v6) = [v4 count4to5Min];

  unint64_t v10 = self->_invalidatedFramesUpTo3mStale + v7;
  self->_invalidatedFramesUpTo2mStale += v5;
  self->_invalidatedFramesUpTo3mStale = v10;
  unint64_t v11 = self->_invalidatedFramesUpTo5mStale + v9;
  self->_invalidatedFramesUpTo4mStale += v8;
  self->_invalidatedFramesUpTo5mStale = v11;
  self->_invalidatedFramesUpTo6mStale += v9 - v6;
}

- (void)accumulateDiscardHistogram:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 totalCount];
  uint64_t v6 = [v4 countLessThan1Min];
  uint64_t v7 = v5 - (v6 + [v4 count1to2Min]);
  uint64_t v8 = v7 - [v4 count2to3Min];
  uint64_t v9 = v8 - [v4 count3to4Min];
  LODWORD(v6) = [v4 count4to5Min];

  unint64_t v10 = self->_discardedFramesUpTo3mStale + v7;
  self->_discardedFramesUpTo2mStale += v5;
  self->_discardedFramesUpTo3mStale = v10;
  unint64_t v11 = self->_discardedFramesUpTo5mStale + v9;
  self->_discardedFramesUpTo4mStale += v8;
  self->_discardedFramesUpTo5mStale = v11;
  self->_discardedFramesUpTo6mStale += v9 - v6;
}

- (void)accumulatePresentationSources:(id)a3
{
  id v4 = a3;
  presentationSources = self->_presentationSources;
  id v8 = v4;
  if (!presentationSources)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v7 = self->_presentationSources;
    self->_presentationSources = v6;

    id v4 = v8;
    presentationSources = self->_presentationSources;
  }
  [(NSMutableSet *)presentationSources unionSet:v4];
}

- (id)dataForPowerlogEvent:(id)a3
{
  v52[31] = *MEMORY[0x1E4F143B8];
  if (![a3 isEqualToString:@"FlipbookStatistics"])
  {
    v20 = 0;
    goto LABEL_25;
  }
  double v4 = -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 4);
  double v5 = v4 + -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 2);
  double v6 = v5 + -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 3);
  v51[0] = @"contentIdentifiers";
  uint64_t v7 = [(NSMutableSet *)self->_presentationSources allObjects];
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  double v50 = (void *)v7;
  if (v7) {
    uint64_t v8 = v7;
  }
  v52[0] = v8;
  v51[1] = @"invalidatedFramesUpTo2mStale";
  double v49 = [NSNumber numberWithUnsignedInteger:self->_invalidatedFramesUpTo2mStale];
  v52[1] = v49;
  v51[2] = @"invalidatedFramesUpTo3mStale";
  v48 = [NSNumber numberWithUnsignedInteger:self->_invalidatedFramesUpTo3mStale];
  v52[2] = v48;
  v51[3] = @"invalidatedFramesUpTo4mStale";
  float v47 = [NSNumber numberWithUnsignedInteger:self->_invalidatedFramesUpTo4mStale];
  v52[3] = v47;
  v51[4] = @"invalidatedFramesUpTo5mStale";
  float v46 = [NSNumber numberWithUnsignedInteger:self->_invalidatedFramesUpTo5mStale];
  v52[4] = v46;
  v51[5] = @"invalidatedFramesUpTo6mStale";
  v45 = [NSNumber numberWithUnsignedInteger:self->_invalidatedFramesUpTo6mStale];
  v52[5] = v45;
  v51[6] = @"discardedFramesUpTo2mStale";
  v44 = [NSNumber numberWithUnsignedInteger:self->_discardedFramesUpTo2mStale];
  v52[6] = v44;
  v51[7] = @"discardedFramesUpTo3mStale";
  v43 = [NSNumber numberWithUnsignedInteger:self->_discardedFramesUpTo3mStale];
  v52[7] = v43;
  v51[8] = @"discardedFramesUpTo4mStale";
  v42 = [NSNumber numberWithUnsignedInteger:self->_discardedFramesUpTo4mStale];
  v52[8] = v42;
  v51[9] = @"discardedFramesUpTo5mStale";
  v41 = [NSNumber numberWithUnsignedInteger:self->_discardedFramesUpTo5mStale];
  v52[9] = v41;
  v51[10] = @"discardedFramesUpTo6mStale";
  v40 = [NSNumber numberWithUnsignedInteger:self->_discardedFramesUpTo6mStale];
  v52[10] = v40;
  v51[11] = @"renderedFramesLessThan1Min";
  v39 = [NSNumber numberWithUnsignedInteger:self->_renderedFramesLessThan1Min];
  v52[11] = v39;
  v51[12] = @"renderedFrames1to2Min";
  v38 = [NSNumber numberWithUnsignedInteger:self->_renderedFrames1to2Min];
  v52[12] = v38;
  v51[13] = @"renderedFrames2to3Min";
  v37 = [NSNumber numberWithUnsignedInteger:self->_renderedFrames2to3Min];
  v52[13] = v37;
  v51[14] = @"renderedFrames3to4Min";
  v36 = [NSNumber numberWithUnsignedInteger:self->_renderedFrames3to4Min];
  v52[14] = v36;
  v51[15] = @"renderedFrames4to5Min";
  v35 = [NSNumber numberWithUnsignedInteger:self->_renderedFrames4to5Min];
  v52[15] = v35;
  v51[16] = @"renderedFrames5to6Min";
  v34 = [NSNumber numberWithUnsignedInteger:self->_renderedFrames5to6Min];
  v52[16] = v34;
  v51[17] = @"renderedFramesMoreThan6Min";
  unint64_t v33 = [NSNumber numberWithUnsignedInteger:self->_renderedFramesMoreThan6Min];
  v52[17] = v33;
  v51[18] = @"renderedFrameCount";
  v32 = [NSNumber numberWithUnsignedInteger:self->_renderedFrameCount];
  v52[18] = v32;
  v51[19] = @"renderedPartialMinuteCount";
  double v31 = [NSNumber numberWithUnsignedInteger:self->_renderedPartialMinuteCount];
  v52[19] = v31;
  v51[20] = @"millisecondsDisplayOff";
  double v30 = objc_msgSend(NSNumber, "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 0) * 1000.0);
  v52[20] = v30;
  v51[21] = @"millisecondsDisplayOn";
  v29 = objc_msgSend(NSNumber, "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 5) * 1000.0);
  v52[21] = v29;
  v51[22] = @"millisecondsDisplayDimmed";
  float v28 = objc_msgSend(NSNumber, "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 6) * 1000.0);
  v52[22] = v28;
  v51[23] = @"millisecondsShowingAOT";
  float v27 = [NSNumber numberWithDouble:v6 * 1000.0];
  v52[23] = v27;
  v51[24] = @"millisecondsSuppressed";
  v26 = objc_msgSend(NSNumber, "numberWithDouble:", -[SBAlwaysOnTelemetryMetrics _timeForBacklightState:]((uint64_t)self, 1) * 1000.0);
  v52[24] = v26;
  v51[25] = @"averageAPL";
  uint64_t averageAPL = (uint64_t)self->_averageAPL;
  uint64_t v25 = averageAPL;
  if (!averageAPL)
  {
    uint64_t averageAPL = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)averageAPL;
  v52[25] = averageAPL;
  v51[26] = @"minimumAPL";
  minimumAPL = self->_minimumAPL;
  uint64_t v11 = (uint64_t)minimumAPL;
  if (!minimumAPL)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = v11;
  v52[26] = v11;
  v51[27] = @"maximumAPL";
  maximumAPL = self->_maximumAPL;
  v13 = maximumAPL;
  if (!maximumAPL)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11, v24);
  }
  v52[27] = v13;
  v51[28] = @"averageAPLDimming";
  averageAPLDimming = self->_averageAPLDimming;
  v15 = averageAPLDimming;
  if (!averageAPLDimming)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v52[28] = v15;
  v51[29] = @"minimumAPLDimming";
  minimumAPLDimming = self->_minimumAPLDimming;
  v17 = minimumAPLDimming;
  if (!minimumAPLDimming)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v52[29] = v17;
  v51[30] = @"maximumAPLDimming";
  maximumAPLDimming = self->_maximumAPLDimming;
  v19 = maximumAPLDimming;
  if (!maximumAPLDimming)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v52[30] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v52, v51, 31, v22);
  if (maximumAPLDimming)
  {
    if (minimumAPLDimming) {
      goto LABEL_18;
    }
  }
  else
  {

    if (minimumAPLDimming)
    {
LABEL_18:
      if (averageAPLDimming) {
        goto LABEL_19;
      }
      goto LABEL_30;
    }
  }

  if (averageAPLDimming)
  {
LABEL_19:
    if (maximumAPL) {
      goto LABEL_20;
    }
LABEL_31:

    if (minimumAPL) {
      goto LABEL_21;
    }
LABEL_32:

    goto LABEL_21;
  }
LABEL_30:

  if (!maximumAPL) {
    goto LABEL_31;
  }
LABEL_20:
  if (!minimumAPL) {
    goto LABEL_32;
  }
LABEL_21:
  if (!v25) {

  }
LABEL_25:
  return v20;
}

- (double)_timeForBacklightState:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  v2 = *(void **)(a1 + 8);
  uint64_t v3 = [NSNumber numberWithInteger:a2];
  double v4 = [v2 objectForKeyedSubscript:v3];
  double v5 = -[_SBMachContinuousStopwatch activeTime]((uint64_t)v4);

  return v5;
}

- (id)dataForAnalyticsEvent:(id)a3
{
  if ([a3 isEqualToString:@"com.apple.springboard.alwayson.flipbookstatistics"])
  {
    double v4 = [(SBAlwaysOnTelemetryMetrics *)self dataForPowerlogEvent:@"FlipbookStatistics"];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageAPLDimming, 0);
  objc_storeStrong((id *)&self->_maximumAPLDimming, 0);
  objc_storeStrong((id *)&self->_minimumAPLDimming, 0);
  objc_storeStrong((id *)&self->_averageAPL, 0);
  objc_storeStrong((id *)&self->_maximumAPL, 0);
  objc_storeStrong((id *)&self->_minimumAPL, 0);
  objc_storeStrong((id *)&self->_presentationSources, 0);
  objc_storeStrong((id *)&self->_activeStopWatch, 0);
  objc_storeStrong((id *)&self->_stateChangeCounts, 0);
  objc_storeStrong((id *)&self->_stopWatches, 0);
}

@end