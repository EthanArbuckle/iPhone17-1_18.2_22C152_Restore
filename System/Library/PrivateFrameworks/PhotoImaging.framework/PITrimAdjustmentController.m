@interface PITrimAdjustmentController
+ (id)endKey;
+ (id)endScaleKey;
+ (id)startKey;
+ (id)startScaleKey;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setEndTime:(id *)a3;
- (void)setStartTime:(id *)a3;
@end

@implementation PITrimAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setEndTime:(id *)a3
{
  if (a3->var2)
  {
    v8 = [NSNumber numberWithLongLong:a3->var0];
    v9 = [(PIAdjustmentController *)self adjustment];
    v10 = +[PITrimAdjustmentController endKey];
    [v9 setObject:v8 forKeyedSubscript:v10];

    id v12 = [NSNumber numberWithInt:a3->var1];
    v6 = [(PIAdjustmentController *)self adjustment];
    v11 = +[PITrimAdjustmentController endScaleKey];
    [v6 setObject:v12 forKeyedSubscript:v11];
  }
  else
  {
    v4 = [(PIAdjustmentController *)self adjustment];
    v5 = +[PITrimAdjustmentController endKey];
    [v4 setObject:0 forKeyedSubscript:v5];

    id v12 = [(PIAdjustmentController *)self adjustment];
    v6 = +[PITrimAdjustmentController endScaleKey];
    [v12 setObject:0 forKeyedSubscript:v6];
  }
}

- (void)setStartTime:(id *)a3
{
  if (a3->var2)
  {
    v8 = [NSNumber numberWithLongLong:a3->var0];
    v9 = [(PIAdjustmentController *)self adjustment];
    v10 = +[PITrimAdjustmentController startKey];
    [v9 setObject:v8 forKeyedSubscript:v10];

    id v12 = [NSNumber numberWithInt:a3->var1];
    v6 = [(PIAdjustmentController *)self adjustment];
    v11 = +[PITrimAdjustmentController startScaleKey];
    [v6 setObject:v12 forKeyedSubscript:v11];
  }
  else
  {
    v4 = [(PIAdjustmentController *)self adjustment];
    v5 = +[PITrimAdjustmentController startKey];
    [v4 setObject:0 forKeyedSubscript:v5];

    id v12 = [(PIAdjustmentController *)self adjustment];
    v6 = +[PITrimAdjustmentController startScaleKey];
    [v12 setObject:0 forKeyedSubscript:v6];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
{
  v5 = [(PIAdjustmentController *)self adjustment];
  v6 = +[PITrimAdjustmentController endKey];
  id v13 = [v5 objectForKeyedSubscript:v6];

  v7 = [(PIAdjustmentController *)self adjustment];
  v8 = +[PITrimAdjustmentController endScaleKey];
  v9 = [v7 objectForKeyedSubscript:v8];

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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  v5 = [(PIAdjustmentController *)self adjustment];
  v6 = +[PITrimAdjustmentController startKey];
  id v13 = [v5 objectForKeyedSubscript:v6];

  v7 = [(PIAdjustmentController *)self adjustment];
  v8 = +[PITrimAdjustmentController startScaleKey];
  v9 = [v7 objectForKeyedSubscript:v8];

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