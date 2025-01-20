@interface PIVideoPosterFrameAdjustmentController
+ (id)scaleKey;
+ (id)timeKey;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)posterFrameTime;
- (PIVideoPosterFrameAdjustmentController)initWithAdjustment:(id)a3;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setPosterFrameTime:(id *)a3;
@end

@implementation PIVideoPosterFrameAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setPosterFrameTime:(id *)a3
{
  v5 = [NSNumber numberWithLongLong:a3->var0];
  v6 = [(PIAdjustmentController *)self adjustment];
  v7 = +[PIVideoPosterFrameAdjustmentController timeKey];
  [v6 setObject:v5 forKeyedSubscript:v7];

  id v10 = [NSNumber numberWithInt:a3->var1];
  v8 = [(PIAdjustmentController *)self adjustment];
  v9 = +[PIVideoPosterFrameAdjustmentController scaleKey];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)posterFrameTime
{
  id v12 = [(PIAdjustmentController *)self adjustment];
  v5 = +[PIVideoPosterFrameAdjustmentController timeKey];
  v6 = [v12 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 longLongValue];
  v8 = [(PIAdjustmentController *)self adjustment];
  v9 = +[PIVideoPosterFrameAdjustmentController scaleKey];
  id v10 = [v8 objectForKeyedSubscript:v9];
  CMTimeMake((CMTime *)retstr, v7, [v10 intValue]);

  return result;
}

- (PIVideoPosterFrameAdjustmentController)initWithAdjustment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIVideoPosterFrameAdjustmentController;
  return [(PIAdjustmentController *)&v4 initWithAdjustment:a3];
}

+ (id)scaleKey
{
  return @"scale";
}

+ (id)timeKey
{
  return @"time";
}

@end