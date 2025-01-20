@interface PISlomoAdjustmentController
+ (id)endKey;
+ (id)endScaleKey;
+ (id)rateKey;
+ (id)startKey;
+ (id)startScaleKey;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4;
- (double)rate;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setEndTime:(id *)a3;
- (void)setRate:(double)a3;
- (void)setStartTime:(id *)a3;
@end

@implementation PISlomoAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4
{
  id v5 = a3;
  v6 = +[PISlomoAdjustmentController rateKey];
  BOOL v7 = [(PIAdjustmentController *)self isSettingEqual:v5 forKey:v6];

  if (v7)
  {
    v8 = [(PIAdjustmentController *)[PISlomoAdjustmentController alloc] initWithAdjustment:v5];
    memset(&v20, 0, sizeof(v20));
    [(PISlomoAdjustmentController *)self startTime];
    [(PISlomoAdjustmentController *)self endTime];
    CMTimeRangeFromTimeToTime(&v20, &start, &end);
    memset(&v17, 0, sizeof(v17));
    if (v8)
    {
      [(PISlomoAdjustmentController *)v8 startTime];
      [(PISlomoAdjustmentController *)v8 endTime];
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
      memset(&v15, 0, sizeof(v15));
    }
    CMTimeRangeFromTimeToTime(&v17, &v16, &v15);
    memset(&v14, 0, sizeof(v14));
    CMTime lhs = v20.start;
    CMTime rhs = v17.start;
    CMTimeSubtract(&v14, &lhs, &rhs);
    CMTime lhs = v14;
    if (fabs(CMTimeGetSeconds(&lhs)) >= 0.002)
    {
      BOOL v9 = 0;
    }
    else
    {
      memset(&lhs, 0, sizeof(lhs));
      CMTime rhs = v20.duration;
      CMTime duration = v17.duration;
      CMTimeSubtract(&lhs, &rhs, &duration);
      CMTime rhs = lhs;
      BOOL v9 = fabs(CMTimeGetSeconds(&rhs)) < 0.002;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setRate:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  v4 = [(PIAdjustmentController *)self adjustment];
  id v5 = +[PISlomoAdjustmentController rateKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (double)rate
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PISlomoAdjustmentController rateKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.25;
  }

  return v6;
}

- (void)setEndTime:(id *)a3
{
  if (a3->var2)
  {
    v8 = [NSNumber numberWithLongLong:a3->var0];
    BOOL v9 = [(PIAdjustmentController *)self adjustment];
    v10 = +[PISlomoAdjustmentController endKey];
    [v9 setObject:v8 forKeyedSubscript:v10];

    id v12 = [NSNumber numberWithInt:a3->var1];
    double v6 = [(PIAdjustmentController *)self adjustment];
    v11 = +[PISlomoAdjustmentController endScaleKey];
    [v6 setObject:v12 forKeyedSubscript:v11];
  }
  else
  {
    v4 = [(PIAdjustmentController *)self adjustment];
    double v5 = +[PISlomoAdjustmentController endKey];
    [v4 setObject:0 forKeyedSubscript:v5];

    id v12 = [(PIAdjustmentController *)self adjustment];
    double v6 = +[PISlomoAdjustmentController endScaleKey];
    [v12 setObject:0 forKeyedSubscript:v6];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
{
  double v5 = [(PIAdjustmentController *)self adjustment];
  double v6 = +[PISlomoAdjustmentController endKey];
  id v13 = [v5 objectForKeyedSubscript:v6];

  BOOL v7 = [(PIAdjustmentController *)self adjustment];
  v8 = +[PISlomoAdjustmentController endScaleKey];
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (v13) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v11 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, [v13 longLongValue], objc_msgSend(v9, "intValue"));
  }

  return result;
}

- (void)setStartTime:(id *)a3
{
  if (a3->var2)
  {
    v8 = [NSNumber numberWithLongLong:a3->var0];
    BOOL v9 = [(PIAdjustmentController *)self adjustment];
    BOOL v10 = +[PISlomoAdjustmentController startKey];
    [v9 setObject:v8 forKeyedSubscript:v10];

    id v12 = [NSNumber numberWithInt:a3->var1];
    double v6 = [(PIAdjustmentController *)self adjustment];
    uint64_t v11 = +[PISlomoAdjustmentController startScaleKey];
    [v6 setObject:v12 forKeyedSubscript:v11];
  }
  else
  {
    v4 = [(PIAdjustmentController *)self adjustment];
    double v5 = +[PISlomoAdjustmentController startKey];
    [v4 setObject:0 forKeyedSubscript:v5];

    id v12 = [(PIAdjustmentController *)self adjustment];
    double v6 = +[PISlomoAdjustmentController startScaleKey];
    [v12 setObject:0 forKeyedSubscript:v6];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  double v5 = [(PIAdjustmentController *)self adjustment];
  double v6 = +[PISlomoAdjustmentController startKey];
  id v13 = [v5 objectForKeyedSubscript:v6];

  BOOL v7 = [(PIAdjustmentController *)self adjustment];
  v8 = +[PISlomoAdjustmentController startScaleKey];
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (v13) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v11 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, [v13 longLongValue], objc_msgSend(v9, "intValue"));
  }

  return result;
}

+ (id)rateKey
{
  return @"rate";
}

+ (id)endScaleKey
{
  return @"endScale";
}

+ (id)endKey
{
  return @"end";
}

+ (id)startScaleKey
{
  return @"startScale";
}

+ (id)startKey
{
  return @"start";
}

@end