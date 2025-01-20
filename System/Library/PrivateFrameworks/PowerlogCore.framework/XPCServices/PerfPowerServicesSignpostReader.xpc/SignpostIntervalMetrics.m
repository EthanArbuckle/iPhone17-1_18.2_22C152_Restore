@interface SignpostIntervalMetrics
- (SignpostIntervalMetrics)initWithBeginSnapshot:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5;
- (id)getMetricDictionary;
- (void)updateSummary:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5;
@end

@implementation SignpostIntervalMetrics

- (SignpostIntervalMetrics)initWithBeginSnapshot:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v53.receiver = self;
  v53.super_class = (Class)SignpostIntervalMetrics;
  v11 = [(SignpostIntervalMetrics *)&v53 init];
  if (v11)
  {
    v12 = [v8 metrics];
    v13 = [v9 metrics];
    v14 = v13;
    if (v12 && v13)
    {
      v15 = [v13 cpuTimeNsec];
      [v15 doubleValue];
      double v17 = v16;
      v18 = [v12 cpuTimeNsec];
      [v18 doubleValue];
      v11->cpuTimeSec = (v17 - v19) / 1000000000.0;

      v20 = [v14 dirtyMemoryLifetimePeakKB];
      [v20 doubleValue];
      double v22 = v21;

      v23 = [v12 dirtyMemoryLifetimePeakKB];
      [v23 doubleValue];
      double v25 = v24;

      if (v22 >= v25) {
        double v26 = v22;
      }
      else {
        double v26 = v25;
      }
      v11->peakMemoryKB = v26;
      v27 = [v14 dirtyMemoryKB];
      [v27 doubleValue];
      double v29 = v28;
      v30 = [v12 dirtyMemoryKB];
      [v30 doubleValue];
      v11->averageMemoryKB = (v29 + v31) * 0.5;

      v32 = [v14 storageDirtiedKB];
      [v32 doubleValue];
      double v34 = v33;
      v35 = [v12 storageDirtiedKB];
      [v35 doubleValue];
      v11->diskLogicalWritesKB = v34 - v36;

      uint64_t v37 = [v12 cpuInstructionsKI];
      if (!v37
        || (v38 = (void *)v37,
            [v14 cpuInstructionsKI],
            v39 = objc_claimAutoreleasedReturnValue(),
            v39,
            v38,
            !v39))
      {
        v11->cpuInstructionsKI = 0.0;
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_13;
      }
      v40 = [v14 cpuInstructionsKI];
      [v40 doubleValue];
      double v42 = v41;
      v43 = [v12 cpuInstructionsKI];
      [v43 doubleValue];
      v11->cpuInstructionsKI = v42 - v44;
    }
    if (v10)
    {
LABEL_11:
      v45 = [v10 glitches];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100003768;
      v51[3] = &unk_100014438;
      v46 = v11;
      v52 = v46;
      [v45 enumerateObjectsUsingBlock:v51];

      [v10 durationSeconds];
      v46[7] = (float)(v47 * 1000.0);

LABEL_14:
      *(_OWORD *)&v11->countInstances = xmmword_100010490;
      [v8 startMs];
      v11->prevStartMs = v48;
      [v9 endMs];
      v11->prevEndMs = v49;

      goto LABEL_15;
    }
LABEL_13:
    v11->hitchDuration = 0.0;
    v11->animationDuration = 0.0;
    goto LABEL_14;
  }
LABEL_15:

  return v11;
}

- (void)updateSummary:(id)a3 endSnapshot:(id)a4 animationInterval:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 metrics];
  v12 = [v9 metrics];
  v13 = v12;
  ++self->countInstances;
  if (v11 && v12)
  {
    v14 = [v12 dirtyMemoryKB];
    [v14 doubleValue];
    double v16 = v15;
    double v17 = [v11 dirtyMemoryKB];
    [v17 doubleValue];
    double v19 = (v16 + v18) * 0.5;

    v20 = [v13 cpuTimeNsec];
    [v20 doubleValue];
    double v22 = v21;
    v23 = [v11 cpuTimeNsec];
    [v23 doubleValue];
    self->cpuTimeSec = self->cpuTimeSec + (v22 - v24) / 1000000000.0;

    double peakMemoryKB = self->peakMemoryKB;
    double v26 = [v13 dirtyMemoryLifetimePeakKB];
    [v26 doubleValue];
    double v28 = v27;

    double v29 = [v11 dirtyMemoryLifetimePeakKB];
    [v29 doubleValue];
    double v31 = v30;

    if (v28 >= v31) {
      double v32 = v28;
    }
    else {
      double v32 = v31;
    }
    if (peakMemoryKB >= v32) {
      double v32 = peakMemoryKB;
    }
    double v33 = self->averageMemoryKB + (v19 - self->averageMemoryKB) / (double)self->countInstances;
    self->double peakMemoryKB = v32;
    self->averageMemoryKB = v33;
    double v34 = [v13 storageDirtiedKB];
    [v34 doubleValue];
    double v36 = v35;
    uint64_t v37 = [v11 storageDirtiedKB];
    [v37 doubleValue];
    self->diskLogicalWritesKB = self->diskLogicalWritesKB + v36 - v38;
  }
  if (v10)
  {
    v39 = [v10 glitches];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100003A94;
    v48[3] = &unk_100014438;
    v48[4] = self;
    [v39 enumerateObjectsUsingBlock:v48];

    [v10 durationSeconds];
    self->animationDuration = self->animationDuration + (float)(v40 * 1000.0);
  }
  double prevStartMs = self->prevStartMs;
  [v8 startMs];
  if (prevStartMs <= v42)
  {
    double prevEndMs = self->prevEndMs;
    [v8 startMs];
    if (prevEndMs > v45) {
      ++self->countIntervalOverlaps;
    }
    double v46 = self->prevEndMs;
    [v9 endMs];
    if (v46 >= v43) {
      double v43 = v46;
    }
  }
  else
  {
    [v9 endMs];
  }
  self->double prevEndMs = v43;
  [v8 startMs];
  self->double prevStartMs = v47;
}

- (id)getMetricDictionary
{
  v13[0] = @"cpuTime";
  v3 = +[NSNumber numberWithDouble:self->cpuTimeSec];
  v14[0] = v3;
  v13[1] = @"peakMemory";
  v4 = +[NSNumber numberWithDouble:self->peakMemoryKB];
  v14[1] = v4;
  v13[2] = @"averageMemory";
  v5 = +[NSNumber numberWithDouble:self->averageMemoryKB];
  v14[2] = v5;
  v13[3] = @"diskIO";
  v6 = +[NSNumber numberWithDouble:self->diskLogicalWritesKB];
  v14[3] = v6;
  v13[4] = @"hitchDuration";
  v7 = +[NSNumber numberWithDouble:self->hitchDuration];
  v14[4] = v7;
  v13[5] = @"animationDuration";
  id v8 = +[NSNumber numberWithDouble:self->animationDuration];
  v14[5] = v8;
  v13[6] = @"countInstances";
  id v9 = +[NSNumber numberWithDouble:(double)self->countInstances];
  v14[6] = v9;
  v13[7] = @"countIntervalOverlaps";
  id v10 = +[NSNumber numberWithDouble:(double)self->countIntervalOverlaps];
  v14[7] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

@end