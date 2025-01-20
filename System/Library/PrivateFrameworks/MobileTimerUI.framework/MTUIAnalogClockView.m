@interface MTUIAnalogClockView
+ (BOOL)doesFaceHaveShadow;
+ (BOOL)hasOverHourHandDot;
+ (BOOL)hasOverSecondHandDot;
+ (BOOL)isClockRegistered:(id)a3;
+ (BOOL)shouldCacheImageOnDiskForType:(int)a3 dayTime:(BOOL)a4;
+ (CGPoint)handRotationalCenterForHand:(int64_t)a3;
+ (CGPoint)shadowRotationalCenterForHand:(int64_t)a3;
+ (CGSize)clockSize;
+ (CGSize)sizeForStyle:(int64_t)a3;
+ (Class)classForStyle:(int64_t)a3;
+ (UIEdgeInsets)insetsForStyle:(int64_t)a3;
+ (UIEdgeInsets)shadowInsets;
+ (double)antialiasPaddingRatio;
+ (double)faceRadius;
+ (double)hourHandLength;
+ (double)hourHandWidth;
+ (double)minuteHandLength;
+ (double)minuteHandWidth;
+ (double)numeralInset;
+ (double)overHourHandDotSize;
+ (double)overSecondHandDotSize;
+ (double)secondHandLength;
+ (double)secondHandMainLength;
+ (double)secondHandOverhangLength;
+ (double)secondHandWidth;
+ (id)analogClockWithStyle:(int64_t)a3;
+ (id)cacheTopLevelPath;
+ (id)cacheVersionHash;
+ (id)cacheVersionedPath;
+ (id)clockFaceForDaytime:(BOOL)a3;
+ (id)clockFaceForDaytime:(BOOL)a3 ignoreCache:(BOOL)a4;
+ (id)clockHand:(int64_t)a3 daytime:(BOOL)a4;
+ (id)dayTimeFaceColor;
+ (id)dayTimeHourHandColor;
+ (id)dayTimeMinuteHandColor;
+ (id)dayTimeOverHourHandDotColor;
+ (id)dayTimeSecondHandColor;
+ (id)dayTimeTextColor;
+ (id)imageCacheNameForType:(int)a3 daytime:(BOOL)a4;
+ (id)imageForType:(int)a3 dayTime:(BOOL)a4 generation:(id)a5;
+ (id)imageForType:(int)a3 dayTime:(BOOL)a4 generation:(id)a5 ignoreCache:(BOOL)a6;
+ (id)imageInBundleForName:(id)a3;
+ (id)makeClockFaceForDaytime:(BOOL)a3;
+ (id)makeClockHand:(int64_t)a3 daytime:(BOOL)a4;
+ (id)makeDotImageSize:(double)a3 color:(id)a4;
+ (id)makeOverSecondHandDotImage;
+ (id)nightTimeFaceColor;
+ (id)nightTimeHourHandColor;
+ (id)nightTimeMinuteHandColor;
+ (id)nightTimeOverHourHandDotColor;
+ (id)nightTimeSecondHandColor;
+ (id)nightTimeTextColor;
+ (id)numeralFont;
+ (id)overHourHandDotForDayTime:(BOOL)a3;
+ (id)overHourHandDotImageForDaytime:(BOOL)a3;
+ (id)overSecondHandDotColor;
+ (id)overSecondHandDotImage;
+ (id)resourcePath;
+ (id)shadowInfoAtIndex:(unint64_t)a3;
+ (int64_t)style;
+ (void)initialize;
+ (void)registerClock:(id)a3;
+ (void)registerSweepingClock:(id)a3;
+ (void)registerTickingClock:(id)a3;
+ (void)unregisterClock:(id)a3;
+ (void)unregisterSweepingClock:(id)a3;
+ (void)unregisterTickingClock:(id)a3;
+ (void)updateFlutterForAllTicking;
+ (void)updateTimeForAllSweeping;
+ (void)updateTimeForAllTicking;
- (BOOL)isNighttime;
- (BOOL)isStarted;
- (CGSize)intrinsicContentSize;
- (MTUIAnalogClockView)init;
- (NSDate)time;
- (NSTimeZone)timeZone;
- (UIImageView)faceView;
- (double)coarseUpdateInterval;
- (double)updateInterval;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)runMode;
- (int64_t)style;
- (void)handleLocaleChange;
- (void)redrawSecondHand;
- (void)setFrame:(CGRect)a3;
- (void)setHandAngle:(double)a3 forHandIndex:(int64_t)a4;
- (void)setHandTransformForHandIndex:(int64_t)a3;
- (void)setNighttime:(BOOL)a3;
- (void)setRunMode:(int64_t)a3;
- (void)setTime:(id)a3;
- (void)setTime:(id)a3 animated:(BOOL)a4;
- (void)setTimeZone:(id)a3;
- (void)start;
- (void)stop;
- (void)updateFlutter;
- (void)updateTime;
- (void)updateTimeAnimated:(BOOL)a3;
- (void)updateTimeContinuously:(int64_t)a3;
@end

@implementation MTUIAnalogClockView

+ (Class)classForStyle:(int64_t)a3
{
  v3 = (void *)__classMap;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

+ (void)initialize
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    *(long long *)((char *)&xmmword_26AB0C270 + 8) = 0u;
    *(long long *)((char *)&xmmword_26AB0C290 + 8) = 0u;
    *(long long *)((char *)&xmmword_26AB0C2B0 + 8) = 0u;
    *(_OWORD *)algn_26AB0C2A8 = 0u;
    unk_26AB0C288 = 0u;
    unk_26AB0C268 = 0u;
    *(long long *)((char *)&__transformCache + 8) = 0u;
    *(void *)&__transformCache = 0x3FF0000000000000;
    *((void *)&xmmword_26AB0C270 + 1) = 0x3FF0000000000000;
    qword_26AB0C2A0 = 0x3FF0000000000000;
    qword_26AB0C2C8 = 0x3FF0000000000000;
    __sweepUpdateInterval = 0x47EFFFFFE0000000;
    __sweepCoarseUpdateInterval = 0x47EFFFFFE0000000;
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)__classMap;
    __classMap = (uint64_t)v3;

    [(id)__classMap setObject:objc_opt_class() forKeyedSubscript:&unk_26E929ED0];
    v5 = [MEMORY[0x263F08850] defaultManager];
    v6 = [a1 cacheTopLevelPath];
    if ([v6 length])
    {
      v7 = [v5 contentsOfDirectoryAtPath:v6 error:0];
      v8 = [a1 cacheVersionHash];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v14, "length", (void)v16))
            {
              if (([v14 isEqualToString:v8] & 1) == 0)
              {
                v15 = [v6 stringByAppendingPathComponent:v14];
                [v5 removeItemAtPath:v15 error:0];
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
    }
  }
}

+ (id)cacheTopLevelPath
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [(id)*MEMORY[0x263F1D020] userLibraryDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"Caches"];
  v5 = [v2 bundleIdentifier];
  v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

+ (id)cacheVersionedPath
{
  id v3 = [a1 cacheTopLevelPath];
  v4 = [a1 cacheVersionHash];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (id)cacheVersionHash
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)cacheVersionHash___cacheDirectoryHash;
  if (!cacheVersionHash___cacheDirectoryHash)
  {
    id v3 = (__CFString *)MGCopyAnswer();
    if (![(__CFString *)v3 length])
    {

      id v3 = @"1A001a";
    }
    id v4 = [@"MobileTimerCache" stringByAppendingString:v3];
    uint64_t v5 = [v4 cStringUsingEncoding:4];
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v5, objc_msgSend(v4, "length"));
    id v6 = objc_claimAutoreleasedReturnValue();
    CC_SHA1((const void *)[v6 bytes], objc_msgSend(v6, "length"), md);
    uint64_t v7 = [MEMORY[0x263F089D8] stringWithCapacity:40];
    v8 = (void *)cacheVersionHash___cacheDirectoryHash;
    cacheVersionHash___cacheDirectoryHash = v7;

    for (uint64_t i = 0; i != 20; ++i)
      objc_msgSend((id)cacheVersionHash___cacheDirectoryHash, "appendFormat:", @"%02x", md[i]);

    v2 = (void *)cacheVersionHash___cacheDirectoryHash;
  }

  return v2;
}

+ (void)updateTimeForAllTicking
{
  v2 = (void *)MEMORY[0x237DF2D50](a1, a2);
  [(id)__flutterClocks removeAllObjects];
  [(id)__tickingClocks enumerateObjectsUsingBlock:&__block_literal_global_3];
  [(id)__flutterTimer invalidate];
  id v3 = (void *)__flutterTimer;
  __flutterTimer = 0;

  if ([(id)__flutterClocks count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF910]);
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA20]) initWithFireDate:v4 interval:objc_opt_class() target:sel_updateFlutterForAllTicking selector:0 userInfo:1 repeats:0.0333333333];
    id v6 = (void *)__flutterTimer;
    __flutterTimer = v5;

    uint64_t v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v7 addTimer:__flutterTimer forMode:*MEMORY[0x263EFF478]];

    v8 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v8 addTimer:__flutterTimer forMode:*MEMORY[0x263F1D798]];
  }
}

void __46__MTUIAnalogClockView_updateTimeForAllTicking__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 updateTime];
  if ([v2 runMode] == 1) {
    [(id)__flutterClocks addObject:v2];
  }
}

+ (void)updateFlutterForAllTicking
{
  id v2 = (void *)MEMORY[0x237DF2D50](a1, a2);
  [(id)__flutterClocks enumerateObjectsUsingBlock:&__block_literal_global_79];
}

uint64_t __49__MTUIAnalogClockView_updateFlutterForAllTicking__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateFlutter];
}

+ (void)updateTimeForAllSweeping
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF910]);
  [v2 timeIntervalSinceDate:__lastCoarseSweepUpdateTime];
  if (v3 > 0.0 && v3 < *(double *)&__sweepCoarseUpdateInterval)
  {
    uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v11 = [v10 components:192 fromDate:v2];

    double v12 = (double)[v11 second];
    uint64_t v13 = [v11 minute];
    [v2 timeIntervalSinceReferenceDate];
    long double v15 = modf(v14, &__y);
    float v16 = fmod((v15 + v12) * 0.104719755, 6.28318531);
    __float2 v17 = __sincosf_stret(v16);
    *(double *)&__transformCache = v17.__cosval;
    *((double *)&__transformCache + 1) = v17.__sinval;
    *(double *)&xmmword_26AB0C270 = (float)-v17.__sinval;
    *((double *)&xmmword_26AB0C270 + 1) = v17.__cosval;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = (id)__sweepingClocks;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * v22++) updateTimeContinuously:v13];
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v20);
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = (id)__sweepingClocks;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v9++), "updateTime", (void)v23);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v7);
    }

    objc_storeStrong((id *)&__lastCoarseSweepUpdateTime, v2);
  }
}

+ (BOOL)isClockRegistered:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 runMode];
  if (v4 > 2) {
    char v5 = 0;
  }
  else {
    char v5 = [(id)*off_264C73F68[v4] containsObject:v3];
  }

  return v5;
}

+ (void)registerClock:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [v5 runMode];
  if (v4 >= 2)
  {
    if (v4 == 2) {
      [a1 registerSweepingClock:v5];
    }
  }
  else
  {
    [a1 registerTickingClock:v5];
  }
}

+ (void)registerTickingClock:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)__tickingClocks;
  id v15 = v3;
  if (!__tickingClocks)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v6 = (void *)__tickingClocks;
    __tickingClocks = (uint64_t)v5;

    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v8 = (void *)__flutterClocks;
    __flutterClocks = (uint64_t)v7;

    id v3 = v15;
    unint64_t v4 = (void *)__tickingClocks;
  }
  [v4 addObject:v3];
  if (!__tickTimer)
  {
    id v9 = objc_alloc(MEMORY[0x263EFFA20]);
    uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:1.0];
    uint64_t v11 = [v9 initWithFireDate:v10 interval:objc_opt_class() target:sel_updateTimeForAllTicking selector:0 userInfo:1 repeats:1.0];
    double v12 = (void *)__tickTimer;
    __tickTimer = v11;

    uint64_t v13 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v13 addTimer:__tickTimer forMode:*MEMORY[0x263EFF478]];

    long double v14 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v14 addTimer:__tickTimer forMode:*MEMORY[0x263F1D798]];
  }
}

+ (void)registerSweepingClock:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  long long v25 = v3;
  if (!__sweepingClocks)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v6 = (void *)__sweepingClocks;
    __sweepingClocks = (uint64_t)v5;

    [v25 updateInterval];
    __sweepUpdateInterval = v7;
    id v3 = (id)[v25 coarseUpdateInterval];
    id v4 = v25;
    __sweepCoarseUpdateInterval = v8;
  }
  if (v4)
  {
    [(id)__sweepingClocks addObject:v4];
    [v25 updateInterval];
    double v10 = v9;
    [(id)__sweepTimer timeInterval];
    if (v10 < v11)
    {
      [(id)__sweepTimer invalidate];
      double v12 = (void *)__sweepTimer;
      __sweepTimer = 0;

      [v25 updateInterval];
      __sweepUpdateInterval = v13;
    }
    id v3 = (id)[v25 coarseUpdateInterval];
    id v4 = v25;
    if (v14 < *(double *)&__sweepCoarseUpdateInterval)
    {
      id v3 = (id)[v25 coarseUpdateInterval];
      id v4 = v25;
      __sweepCoarseUpdateInterval = v15;
    }
  }
  if (!__sweepTimer)
  {
    uint64_t v16 = [MEMORY[0x263EFF910] distantPast];
    __float2 v17 = (void *)__lastCoarseSweepUpdateTime;
    __lastCoarseSweepUpdateTime = v16;

    id v18 = objc_alloc(MEMORY[0x263EFFA20]);
    uint64_t v19 = [MEMORY[0x263EFF910] date];
    uint64_t v20 = [v19 dateByAddingTimeInterval:*(double *)&__sweepUpdateInterval];
    uint64_t v21 = [v18 initWithFireDate:v20 interval:objc_opt_class() target:sel_updateTimeForAllSweeping selector:0 userInfo:1 repeats:*(double *)&__sweepUpdateInterval];
    uint64_t v22 = (void *)__sweepTimer;
    __sweepTimer = v21;

    long long v23 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v23 addTimer:__sweepTimer forMode:*MEMORY[0x263EFF478]];

    long long v24 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v24 addTimer:__sweepTimer forMode:*MEMORY[0x263F1D798]];

    id v4 = v25;
  }

  MEMORY[0x270F9A758](v3, v4);
}

+ (void)unregisterClock:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [v5 runMode];
  if (v4 >= 2)
  {
    if (v4 == 2) {
      [a1 unregisterSweepingClock:v5];
    }
  }
  else
  {
    [a1 unregisterTickingClock:v5];
  }
}

+ (void)unregisterTickingClock:(id)a3
{
  [(id)__tickingClocks removeObject:a3];
  if (![(id)__tickingClocks count])
  {
    if (!__sweepingClocks) {
      +[MTUIRenderedHandViewFactory flushAllCaches];
    }
    [(id)__flutterTimer invalidate];
    id v3 = (void *)__flutterTimer;
    __flutterTimer = 0;

    unint64_t v4 = (void *)__flutterClocks;
    __flutterClocks = 0;

    [(id)__tickTimer invalidate];
    id v5 = (void *)__tickTimer;
    __tickTimer = 0;

    uint64_t v6 = (void *)__tickingClocks;
    __tickingClocks = 0;
  }
}

+ (void)unregisterSweepingClock:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(id)__sweepingClocks removeObject:a3];
  if ([(id)__sweepingClocks count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v3 = (id)__sweepingClocks;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v21;
      float v7 = 3.4028e38;
      float v8 = 3.4028e38;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v3);
          }
          double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "updateInterval", (void)v20);
          *(float *)&double v11 = v11;
          float v8 = fminf(v8, *(float *)&v11);
          [v10 coarseUpdateInterval];
          *(float *)&double v12 = v12;
          float v7 = fminf(v7, *(float *)&v12);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v5);
      double v13 = v7;
      double v14 = v8;
    }
    else
    {
      double v13 = 3.40282347e38;
      double v14 = 3.40282347e38;
    }

    __sweepCoarseUpdateInterval = *(void *)&v13;
    [(id)__sweepTimer timeInterval];
    if (vabdd_f64(v14, v18) > 0.000001)
    {
      __sweepUpdateInterval = *(void *)&v14;
      [(id)__sweepTimer invalidate];
      uint64_t v19 = (void *)__sweepTimer;
      __sweepTimer = 0;

      +[MTUIAnalogClockView registerSweepingClock:0];
    }
  }
  else
  {
    if (!__tickingClocks) {
      +[MTUIRenderedHandViewFactory flushAllCaches];
    }
    [(id)__sweepTimer invalidate];
    uint64_t v15 = (void *)__sweepTimer;
    __sweepTimer = 0;

    uint64_t v16 = (void *)__lastCoarseSweepUpdateTime;
    __lastCoarseSweepUpdateTime = 0;

    __float2 v17 = (void *)__sweepingClocks;
    __sweepingClocks = 0;
  }
}

+ (CGSize)sizeForStyle:(int64_t)a3
{
  id v3 = (void *)[a1 classForStyle:a3];

  [v3 clockSize];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (UIEdgeInsets)insetsForStyle:(int64_t)a3
{
  id v3 = (void *)[a1 classForStyle:a3];

  [v3 shadowInsets];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (id)analogClockWithStyle:(int64_t)a3
{
  id v3 = objc_alloc_init((Class)[a1 classForStyle:a3]);

  return v3;
}

+ (double)faceRadius
{
  return 0.0;
}

+ (double)secondHandLength
{
  [a1 secondHandMainLength];
  double v4 = v3;
  [a1 secondHandOverhangLength];
  return v4 + v5;
}

+ (double)secondHandMainLength
{
  [a1 faceRadius];
  return v2 * 0.88;
}

+ (double)secondHandOverhangLength
{
  [a1 faceRadius];
  return v2 * 0.112;
}

+ (double)minuteHandLength
{
  [a1 faceRadius];
  return v2 * 0.938;
}

+ (double)hourHandLength
{
  [a1 faceRadius];
  return v2 * 0.533;
}

+ (double)secondHandWidth
{
  [a1 faceRadius];
  double v4 = v3 * 0.01;
  [a1 antialiasPaddingRatio];
  return v4 * (1.0 / v5);
}

+ (double)minuteHandWidth
{
  [a1 faceRadius];
  double v4 = v3 * 0.036;
  [a1 antialiasPaddingRatio];
  return v4 * (1.0 / v5);
}

+ (double)hourHandWidth
{
  [a1 faceRadius];
  double v4 = v3 * 0.036;
  [a1 antialiasPaddingRatio];
  return v4 * (1.0 / v5);
}

+ (int64_t)style
{
  return -1;
}

+ (id)resourcePath
{
  return 0;
}

+ (id)dayTimeTextColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

+ (id)dayTimeFaceColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (id)nightTimeTextColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (id)nightTimeFaceColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

+ (id)dayTimeOverHourHandDotColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

+ (id)nightTimeOverHourHandDotColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (id)overSecondHandDotColor
{
  return (id)[MEMORY[0x263F1C550] systemOrangeColor];
}

+ (id)dayTimeHourHandColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

+ (id)nightTimeHourHandColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (id)dayTimeMinuteHandColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

+ (id)nightTimeMinuteHandColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (id)dayTimeSecondHandColor
{
  return (id)[MEMORY[0x263F1C550] systemOrangeColor];
}

+ (id)nightTimeSecondHandColor
{
  return (id)[MEMORY[0x263F1C550] systemOrangeColor];
}

+ (double)numeralInset
{
  [a1 faceRadius];
  return v2 * 0.23;
}

+ (id)numeralFont
{
  double v2 = (void *)MEMORY[0x263F1C658];
  [a1 faceRadius];
  double v4 = v3 * 0.25;

  return (id)[v2 _lightSystemFontOfSize:v4];
}

+ (BOOL)doesFaceHaveShadow
{
  return 0;
}

+ (UIEdgeInsets)shadowInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)antialiasPaddingRatio
{
  return 1.0;
}

+ (BOOL)hasOverHourHandDot
{
  return 1;
}

+ (BOOL)hasOverSecondHandDot
{
  return 1;
}

+ (double)overHourHandDotSize
{
  [a1 hourHandWidth];
  return v2 * 3.0;
}

+ (double)overSecondHandDotSize
{
  [a1 secondHandWidth];
  return v2 * 3.0;
}

+ (CGSize)clockSize
{
  [a1 faceRadius];
  double v3 = v2 + v2;
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)shadowInfoAtIndex:(unint64_t)a3
{
  double v3 = [MTUIShadowInfo alloc];
  double v4 = -[MTUIShadowInfo initWithColor:radius:offset:scale:](v3, "initWithColor:radius:offset:scale:", 0, 0.0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), 0.0);

  return v4;
}

+ (CGPoint)handRotationalCenterForHand:(int64_t)a3
{
  if (a3 == 2)
  {
    [a1 secondHandOverhangLength];
    double v5 = v7;
    [a1 secondHandOverhangLength];
    double v9 = v8;
    [a1 secondHandMainLength];
    double v11 = v9 + v10;
  }
  else
  {
    if (a3 == 1)
    {
      [a1 minuteHandWidth];
      double v5 = v12;
      [a1 minuteHandLength];
    }
    else
    {
      if (a3)
      {
        double v14 = *MEMORY[0x263F00148];
        double v13 = *(double *)(MEMORY[0x263F00148] + 8);
        goto LABEL_10;
      }
      [a1 hourHandWidth];
      double v5 = v4;
      [a1 hourHandLength];
    }
    double v11 = v6 + v6;
  }
  double v13 = 1.0 - v5 / v11;
  double v14 = 0.5;
LABEL_10:
  result.y = v13;
  result.x = v14;
  return result;
}

+ (CGPoint)shadowRotationalCenterForHand:(int64_t)a3
{
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)updateInterval
{
  return 0.0333333351;
}

- (double)coarseUpdateInterval
{
  return 5.0;
}

+ (id)imageCacheNameForType:(int)a3 daytime:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      double v9 = @"face-nighttime";
      double v10 = @"face-daytime";
      goto LABEL_16;
    case 1:
    case 2:
    case 3:
      if (a4) {
        double v5 = @"-daytime";
      }
      else {
        double v5 = @"-nighttime";
      }
      if (MTUIMainScreenScale() <= 1.0) {
        double v6 = @".png";
      }
      else {
        double v6 = @"@2x.png";
      }
      double v7 = [(__CFString *)v5 stringByAppendingString:v6];
      double v8 = [(__CFString *)GeneratedBitmapHandNames[a3 - 1] stringByAppendingString:v7];

      break;
    case 4:
      double v9 = @"middledot-nighttime";
      double v10 = @"middledot-daytime";
LABEL_16:
      if (a4) {
        double v13 = v10;
      }
      else {
        double v13 = v9;
      }
      if (MTUIMainScreenScale() <= 1.0) {
        double v11 = @".png";
      }
      else {
        double v11 = @"@2x.png";
      }
      double v12 = v13;
      goto LABEL_23;
    case 5:
      if (MTUIMainScreenScale() <= 1.0) {
        double v11 = @".png";
      }
      else {
        double v11 = @"@2x.png";
      }
      double v12 = @"reddot";
LABEL_23:
      double v8 = [(__CFString *)v12 stringByAppendingString:v11];
      break;
    default:
      double v8 = 0;
      break;
  }

  return v8;
}

+ (BOOL)shouldCacheImageOnDiskForType:(int)a3 dayTime:(BOOL)a4
{
  return 1;
}

+ (id)imageForType:(int)a3 dayTime:(BOOL)a4 generation:(id)a5
{
  return (id)[a1 imageForType:*(void *)&a3 dayTime:a4 generation:a5 ignoreCache:0];
}

+ (id)imageForType:(int)a3 dayTime:(BOOL)a4 generation:(id)a5 ignoreCache:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  double v10 = (void (**)(void))a5;
  uint64_t v11 = [a1 style];
  uint64_t v12 = 100;
  if (!v7) {
    uint64_t v12 = 0;
  }
  double v13 = [NSNumber numberWithUnsignedInteger:v12 + v8 + 1000 * v11];
  double v14 = MTImageCache();
  uint64_t v15 = [v14 objectForKey:v13];
  if (v15) {
    BOOL v16 = !v6;
  }
  else {
    BOOL v16 = 0;
  }
  if (!v16)
  {
    if (![a1 shouldCacheImageOnDiskForType:v8 dayTime:v7])
    {
      uint64_t v28 = v10[2](v10);

      uint64_t v15 = (void *)v28;
      if (!v28) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    BOOL v30 = v6;
    __float2 v17 = [a1 cacheVersionedPath];
    double v18 = [a1 resourcePath];
    uint64_t v19 = [v17 stringByAppendingPathComponent:v18];

    id v20 = a1;
    long long v21 = v19;
    long long v22 = [v20 imageCacheNameForType:v8 daytime:v7];
    long long v23 = [v19 stringByAppendingPathComponent:v22];

    id v24 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v23];

    if (v10)
    {
      LOBYTE(v6) = v30;
      if (!v24)
      {
        uint64_t v25 = v10[2](v10);
        if (v25)
        {
          long long v26 = (void *)v25;
          long long v27 = dispatch_get_global_queue(-2, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __67__MTUIAnalogClockView_imageForType_dayTime_generation_ignoreCache___block_invoke;
          block[3] = &unk_264C73EE8;
          id v32 = v21;
          id v24 = v26;
          id v33 = v24;
          id v34 = v23;
          dispatch_async(v27, block);
        }
        else
        {
          id v24 = 0;
        }
      }
    }
    else
    {
      LOBYTE(v6) = v30;
    }

    uint64_t v15 = v24;
    if (v24)
    {
LABEL_17:
      if (!v6) {
        [v14 setObject:v15 forKey:v13];
      }
    }
  }
LABEL_19:

  return v15;
}

void __67__MTUIAnalogClockView_imageForType_dayTime_generation_ignoreCache___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x263F08850] defaultManager];
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", *(void *)(a1 + 32), 0);

  UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 writeToFile:*(void *)(a1 + 48) atomically:1];
}

+ (id)makeClockFaceForDaytime:(BOOL)a3
{
  v85[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    double v4 = [a1 dayTimeFaceColor];
    [a1 dayTimeTextColor];
  }
  else
  {
    double v4 = [a1 nightTimeFaceColor];
    [a1 nightTimeTextColor];
  uint64_t v5 = };
  [a1 shadowInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [a1 clockSize];
  double v15 = v14;
  CGFloat v17 = v16;
  double v18 = *MEMORY[0x263F00148];
  double v19 = *(double *)(MEMORY[0x263F00148] + 8);
  int v20 = [a1 doesFaceHaveShadow];
  double v21 = MTUIMainScreenScale();
  v87.width = v15;
  v87.height = v17;
  UIGraphicsBeginImageContextWithOptions(v87, 0, v21);
  double v22 = v9 + v18;
  double v23 = v17;
  double v24 = v7 + v19;
  double v25 = v9 + v13;
  double v26 = v22;
  double v27 = v15;
  double v28 = v15 - v25;
  double v29 = v23 - (v7 + v11);
  double v79 = v24;
  UIRectGetCenter();
  double v74 = v31;
  double v75 = v30;
  if (v20)
  {
    double v77 = v11 + v29 + v79 + 1.0;
    for (uint64_t i = 4; i != -1; --i)
    {
      id v33 = [a1 shadowInfoAtIndex:i];
      id v34 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v26, v79, v28, v29);
      CGAffineTransformMakeTranslation(&v83, 0.0, -v77);
      [v34 applyTransform:&v83];
      [v33 scale];
      CGFloat v36 = v27 * (1.0 - v35) * 0.5;
      [v33 scale];
      CGAffineTransformMakeTranslation(&v82, v36, -((1.0 - v37) * v23) * 0.5);
      [v34 applyTransform:&v82];
      [v33 scale];
      CGFloat v39 = v38;
      [v33 scale];
      CGAffineTransformMakeScale(&v81, v39, v40);
      [v34 applyTransform:&v81];
      [v33 offset];
      CGFloat v42 = v41;
      double v43 = v27;
      CGFloat v45 = v77 + v44;
      CurrentContext = UIGraphicsGetCurrentContext();
      [v33 radius];
      double v47 = v26;
      double v48 = v23;
      double v50 = v49;
      id v51 = [v33 color];
      v52 = (CGColor *)[v51 CGColor];
      v88.width = v42;
      v88.height = v45;
      double v27 = v43;
      CGFloat v53 = v50;
      double v23 = v48;
      double v26 = v47;
      CGContextSetShadowWithColor(CurrentContext, v88, v53, v52);

      [v34 fill];
    }
  }
  v54 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v26, v79, v28, v29);
  v55 = UIGraphicsGetCurrentContext();
  CGContextSetShadowWithColor(v55, *MEMORY[0x263F001B0], 0.0, 0);
  v78 = v4;
  [v4 setFill];
  ty = v54;
  [v54 fill];
  [a1 faceRadius];
  double v57 = v56;
  [a1 numeralInset];
  double v59 = v57 - v58;
  v60 = [a1 numeralFont];
  uint64_t v61 = *MEMORY[0x263F1C238];
  uint64_t v62 = *MEMORY[0x263F1C240];
  double v63 = -1.04719755;
  for (uint64_t j = 1; j != 13; ++j)
  {
    id v65 = objc_alloc(MEMORY[0x263F086A0]);
    v66 = [NSNumber numberWithInteger:j];
    v67 = [v66 stringValue];
    v84[0] = v61;
    v84[1] = v62;
    v85[0] = v60;
    v85[1] = v5;
    [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
    v69 = v68 = (void *)v5;
    v70 = (void *)[v65 initWithString:v67 attributes:v69];

    uint64_t v5 = (uint64_t)v68;
    [v70 size];
    __double2 v71 = __sincos_stret(v63);
    v80[0] = v75 + v59 * v71.__cosval;
    v80[1] = v59 * v71.__sinval + v74;
    [a1 adjustNumberalCenter:v80 forNumeralIndex:j];
    UIRectCenteredAboutPointScale();
    objc_msgSend(v70, "drawInRect:");
    double v63 = v63 + 0.523598776;
  }
  v72 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v72;
}

+ (id)clockFaceForDaytime:(BOOL)a3
{
  return (id)[a1 clockFaceForDaytime:a3 ignoreCache:0];
}

+ (id)clockFaceForDaytime:(BOOL)a3 ignoreCache:(BOOL)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__MTUIAnalogClockView_clockFaceForDaytime_ignoreCache___block_invoke;
  v6[3] = &__block_descriptor_41_e14___UIImage_8__0l;
  v6[4] = a1;
  BOOL v7 = a3;
  double v4 = [a1 imageForType:0 dayTime:a3 generation:v6 ignoreCache:a4];

  return v4;
}

uint64_t __55__MTUIAnalogClockView_clockFaceForDaytime_ignoreCache___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeClockFaceForDaytime:*(unsigned __int8 *)(a1 + 40)];
}

+ (id)makeClockHand:(int64_t)a3 daytime:(BOOL)a4
{
  double v6 = 0.0;
  switch(a3)
  {
    case -1:
    case 3:
      BOOL v7 = MTLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[MTUIAnalogClockView makeClockHand:daytime:](a3, v7);
      }

      goto LABEL_5;
    case 0:
      if (a4) {
        [a1 dayTimeHourHandColor];
      }
      else {
      double v8 = [a1 nightTimeHourHandColor];
      }
      [a1 hourHandLength];
      double v9 = v10;
      [a1 hourHandWidth];
      goto LABEL_18;
    case 1:
      if (a4) {
        [a1 dayTimeMinuteHandColor];
      }
      else {
      double v8 = [a1 nightTimeMinuteHandColor];
      }
      [a1 minuteHandLength];
      double v9 = v12;
      [a1 minuteHandWidth];
      goto LABEL_18;
    case 2:
      if (a4) {
        [a1 dayTimeSecondHandColor];
      }
      else {
      double v8 = [a1 nightTimeSecondHandColor];
      }
      [a1 secondHandLength];
      double v9 = v13;
      [a1 secondHandWidth];
LABEL_18:
      double v6 = v11;
      break;
    default:
LABEL_5:
      double v8 = 0;
      double v9 = 0.0;
      break;
  }
  v21.width = v6;
  v21.height = v9;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  double v14 = [MEMORY[0x263F1C478] bezierPath];
  double v15 = v14;
  if (a3 == 2) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  [v14 setLineCapStyle:v16];
  [a1 antialiasPaddingRatio];
  [v15 setLineWidth:v6 * v17];
  objc_msgSend(v15, "moveToPoint:", v6 * 0.5, v6);
  objc_msgSend(v15, "addLineToPoint:", v6 * 0.5, v9 - v6);
  [v8 setStroke];
  [v15 stroke];
  double v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

+ (id)clockHand:(int64_t)a3 daytime:(BOOL)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__MTUIAnalogClockView_clockHand_daytime___block_invoke;
  v6[3] = &__block_descriptor_49_e14___UIImage_8__0l;
  v6[4] = a1;
  void v6[5] = a3;
  BOOL v7 = a4;
  double v4 = [a1 imageForType:(a3 + 1) dayTime:a4 generation:v6];

  return v4;
}

uint64_t __41__MTUIAnalogClockView_clockHand_daytime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeClockHand:*(void *)(a1 + 40) daytime:*(unsigned __int8 *)(a1 + 48)];
}

+ (id)makeDotImageSize:(double)a3 color:(id)a4
{
  float v6 = a3;
  CGFloat v7 = roundf(v6);
  CGFloat v8 = (v7 - a3) * 0.5;
  id v9 = a4;
  v17.width = v7;
  v17.height = v7;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  v18.origin.x = v8;
  v18.origin.y = v8;
  v18.size.width = a3;
  v18.size.height = a3;
  double MidX = CGRectGetMidX(v18);
  v19.origin.x = v8;
  v19.origin.y = v8;
  v19.size.width = a3;
  v19.size.height = a3;
  double MidY = CGRectGetMidY(v19);
  id v12 = objc_alloc_init(MEMORY[0x263F1C478]);
  v20.origin.x = v8;
  v20.origin.y = v8;
  v20.size.width = a3;
  v20.size.height = a3;
  objc_msgSend(v12, "moveToPoint:", CGRectGetMidX(v20), 0.0);
  [a1 antialiasPaddingRatio];
  objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v13 * a3 * 0.5, 4.71238898, 10.9955743);
  [v12 closePath];
  [v9 setFill];

  [v12 fill];
  double v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

+ (id)overHourHandDotImageForDaytime:(BOOL)a3
{
  [a1 overHourHandDotSize];
  double v6 = v5;
  if (a3) {
    [a1 dayTimeOverHourHandDotColor];
  }
  else {
  CGFloat v7 = [a1 nightTimeOverHourHandDotColor];
  }
  CGFloat v8 = [a1 makeDotImageSize:v7 color:v6];

  return v8;
}

+ (id)overHourHandDotForDayTime:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__MTUIAnalogClockView_overHourHandDotForDayTime___block_invoke;
  v5[3] = &__block_descriptor_41_e14___UIImage_8__0l;
  v5[4] = a1;
  BOOL v6 = a3;
  id v3 = [a1 imageForType:4 dayTime:a3 generation:v5];

  return v3;
}

uint64_t __49__MTUIAnalogClockView_overHourHandDotForDayTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) overHourHandDotImageForDaytime:*(unsigned __int8 *)(a1 + 40)];
}

+ (id)makeOverSecondHandDotImage
{
  [a1 overSecondHandDotSize];
  double v4 = v3;
  double v5 = [a1 overSecondHandDotColor];
  BOOL v6 = [a1 makeDotImageSize:v5 color:v4];

  return v6;
}

+ (id)overSecondHandDotImage
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__MTUIAnalogClockView_overSecondHandDotImage__block_invoke;
  v4[3] = &__block_descriptor_40_e14___UIImage_8__0l;
  v4[4] = a1;
  double v2 = [a1 imageForType:5 dayTime:0 generation:v4];

  return v2;
}

uint64_t __45__MTUIAnalogClockView_overSecondHandDotImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeOverSecondHandDotImage];
}

+ (id)imageInBundleForName:(id)a3
{
  double v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  double v5 = [v3 bundleForClass:objc_opt_class()];
  BOOL v6 = [MEMORY[0x263F1C6B0] imageNamed:v4 inBundle:v5];

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(id)objc_opt_class() clockSize];
  v8.receiver = self;
  v8.super_class = (Class)MTUIAnalogClockView;
  -[MTUIAnalogClockView setFrame:](&v8, sel_setFrame_, x, y, v6, v7);
}

- (MTUIAnalogClockView)init
{
  v39.receiver = self;
  v39.super_class = (Class)MTUIAnalogClockView;
  double v2 = -[MTUIAnalogClockView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v2)
  {
    double v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_handleLocaleChange name:*MEMORY[0x263EFF458] object:0];

    v2->_runMode = -1;
    id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
    uint64_t v5 = [v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    double v7 = objc_opt_class();
    uint64_t v8 = [v7 clockFaceForDaytime:1];
    faceDayImage = v2->_faceDayImage;
    v2->_faceDayImage = (UIImage *)v8;

    uint64_t v10 = [v7 clockFaceForDaytime:0];
    faceNightImage = v2->_faceNightImage;
    v2->_faceNightImage = (UIImage *)v10;

    v2->_nighttime = 0;
    uint64_t v12 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v2->_faceDayImage];
    faceView = v2->_faceView;
    v2->_faceView = (UIImageView *)v12;

    [(MTUIAnalogClockView *)v2 addSubview:v2->_faceView];
    int v14 = [v7 doesFaceHaveShadow];
    [v7 clockSize];
    if (v14) {
      [v7 shadowInsets];
    }
    UIRectGetCenter();
    double v16 = v15;
    double v18 = v17;
    for (uint64_t i = 0; ; ++i)
    {
      CGRect v20 = [v7 clockHand:i daytime:1];
      CGSize v21 = [MTUIBitmapHandView alloc];
      [v7 handRotationalCenterForHand:i];
      uint64_t v22 = -[MTUIBitmapHandView initWithImage:rotationalCenter:](v21, "initWithImage:rotationalCenter:", v20);
      double v23 = v2->_dayHands[i];
      v2->_dayHands[i] = (UIView *)v22;

      [(MTUIAnalogClockView *)v2 addSubview:v2->_dayHands[i]];
      -[UIView setCenter:](v2->_dayHands[i], "setCenter:", v16, v18);
      if (i == 2) {
        break;
      }
      double v24 = [v7 clockHand:i daytime:0];

      double v25 = [MTUIBitmapHandView alloc];
      [v7 handRotationalCenterForHand:i];
      uint64_t v26 = -[MTUIBitmapHandView initWithImage:rotationalCenter:](v25, "initWithImage:rotationalCenter:", v24);
      double v27 = v2->_nightHands[i];
      v2->_nightHands[i] = (UIView *)v26;

      [(MTUIAnalogClockView *)v2 addSubview:v2->_nightHands[i]];
      -[UIView setCenter:](v2->_nightHands[i], "setCenter:", v16, v18);
      [(UIView *)v2->_nightHands[i] setHidden:1];
    }
    if ([v7 hasOverHourHandDot])
    {
      double v28 = [v7 overHourHandDotForDayTime:1];
      uint64_t v29 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v28];
      middleDotDadouble y = v2->_middleDotDay;
      v2->_middleDotDadouble y = (UIImageView *)v29;

      [(MTUIAnalogClockView *)v2 insertSubview:v2->_middleDotDay belowSubview:v2->_dayHands[2]];
      -[UIImageView setCenter:](v2->_middleDotDay, "setCenter:", v16, v18);
      double v31 = [v7 overHourHandDotForDayTime:0];

      uint64_t v32 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v31];
      middleDotNight = v2->_middleDotNight;
      v2->_middleDotNight = (UIImageView *)v32;

      [(MTUIAnalogClockView *)v2 insertSubview:v2->_middleDotNight belowSubview:v2->_dayHands[2]];
      -[UIImageView setCenter:](v2->_middleDotNight, "setCenter:", v16, v18);
      [(UIImageView *)v2->_middleDotNight setHidden:1];
    }
    if ([v7 hasOverSecondHandDot])
    {
      id v34 = [v7 overSecondHandDotImage];
      uint64_t v35 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v34];
      middleRedDot = v2->_middleRedDot;
      v2->_middleRedDot = (UIImageView *)v35;

      -[UIImageView setCenter:](v2->_middleRedDot, "setCenter:", v16, v18);
      [(MTUIAnalogClockView *)v2 addSubview:v2->_middleRedDot];
    }
    double v37 = v2;
  }

  return v2;
}

- (int64_t)style
{
  double v2 = objc_opt_class();

  return [v2 style];
}

- (CGSize)intrinsicContentSize
{
  double v2 = objc_opt_class();

  [v2 clockSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setHandTransformForHandIndex:(int64_t)a3
{
  v16[4] = xmmword_26AB0C290;
  v16[5] = *(_OWORD *)&qword_26AB0C2A0;
  v16[6] = xmmword_26AB0C2B0;
  v16[7] = unk_26AB0C2C0;
  v16[0] = __transformCache;
  v16[1] = unk_26AB0C260;
  v16[2] = xmmword_26AB0C270;
  v16[3] = unk_26AB0C280;
  uint64_t v5 = [(UIView *)self->_dayHands[a3] layer];
  [v5 setTransform:v16];

  long long v12 = xmmword_26AB0C290;
  long long v13 = *(_OWORD *)&qword_26AB0C2A0;
  long long v14 = xmmword_26AB0C2B0;
  long long v15 = unk_26AB0C2C0;
  long long v8 = __transformCache;
  long long v9 = unk_26AB0C260;
  long long v10 = xmmword_26AB0C270;
  long long v11 = unk_26AB0C280;
  double v6 = [(UIView *)self->_nightHands[a3] layer];
  v7[4] = v12;
  v7[5] = v13;
  v7[6] = v14;
  v7[7] = v15;
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  v7[3] = v11;
  [v6 setTransform:v7];
}

- (void)updateTimeContinuously:(int64_t)a3
{
}

- (void)setHandAngle:(double)a3 forHandIndex:(int64_t)a4
{
  float v6 = fmod(a3, 6.28318531);
  __float2 v7 = __sincosf_stret(v6);
  *(double *)&__transformCache = v7.__cosval;
  *((double *)&__transformCache + 1) = v7.__sinval;
  *(double *)&xmmword_26AB0C270 = (float)-v7.__sinval;
  *((double *)&xmmword_26AB0C270 + 1) = v7.__cosval;

  [(MTUIAnalogClockView *)self setHandTransformForHandIndex:a4];
}

- (void)updateFlutter
{
  flutterIndedouble x = self->_flutterIndex;
  if ((int)flutterIndex > 2)
  {
    [(id)__flutterTimer invalidate];
    uint64_t v5 = (void *)__flutterTimer;
    __flutterTimer = 0;
  }
  else
  {
    double seconds = self->_seconds;
    self->_flutterIndedouble x = flutterIndex + 1;
    double v4 = (seconds + updateFlutter_flutterAmounts[flutterIndex]) * 0.0174532925 * 6.0;
    [(MTUIAnalogClockView *)self setHandAngle:2 forHandIndex:v4];
  }
}

- (void)setNighttime:(BOOL)a3
{
  if (self->_nighttime != a3)
  {
    self->_nighttime = a3;
    faceView = self->_faceView;
    uint64_t v5 = &OBJC_IVAR___MTUIAnalogClockView__faceDayImage;
    if (a3) {
      uint64_t v5 = &OBJC_IVAR___MTUIAnalogClockView__faceNightImage;
    }
    [(UIImageView *)faceView setImage:*(Class *)((char *)&self->super.super.super.isa + *v5)];
    uint64_t v6 = 0;
    nightHands = self->_nightHands;
    do
    {
      if (nightHands[v6])
      {
        [(UIView *)self->_dayHands[v6] setHidden:self->_nighttime];
        [(UIView *)nightHands[v6] setHidden:!self->_nighttime];
      }
      ++v6;
    }
    while (v6 != 3);
    [(UIImageView *)self->_middleDotDay setHidden:self->_nighttime];
    [(UIImageView *)self->_middleDotNight setHidden:!self->_nighttime];
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"AnalogClockDidChangeNighttimeNotification" object:self];
  }
}

- (void)updateTime
{
}

- (void)updateTimeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v5 = self->_time;
  [(MTUIAnalogClockView *)self setTime:v16 animated:v3];
  if (v5)
  {
    [(NSDate *)self->_time timeIntervalSinceDate:v5];
    if (v6 > 0.0 && v6 < 300.0)
    {
      __float2 v7 = [(NSCalendar *)self->_calendar components:32 fromDate:v5];
      uint64_t v8 = [v7 hour];

      long long v9 = [(NSCalendar *)self->_calendar components:32 fromDate:v16];
      uint64_t v10 = [v9 hour];

      if (v10) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = v8 == 23;
      }
      if (v11)
      {
        long long v13 = [MEMORY[0x263F08A00] defaultCenter];
        long long v14 = v13;
        long long v15 = @"AnalogClockDidCrossMidnightNotification";
      }
      else
      {
        if (v10 != 12 || v8 != 11) {
          goto LABEL_16;
        }
        long long v13 = [MEMORY[0x263F08A00] defaultCenter];
        long long v14 = v13;
        long long v15 = @"AnalogClockDidCrossNoonNotification";
      }
      [v13 postNotificationName:v15 object:self];
    }
  }
LABEL_16:
}

- (int64_t)hour
{
  double v2 = [(NSCalendar *)self->_calendar components:32 fromDate:self->_time];
  int64_t v3 = [v2 hour];

  return v3;
}

- (int64_t)minute
{
  double v2 = [(NSCalendar *)self->_calendar components:64 fromDate:self->_time];
  int64_t v3 = [v2 minute];

  return v3;
}

- (void)setTime:(id)a3
{
}

- (void)setTime:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  p_time = (id *)&self->_time;
  BOOL v8 = [(NSDate *)self->_time isEqualToDate:v22];
  id v9 = v22;
  if (!v8)
  {
    id v10 = v22;
    if (*p_time != v22)
    {
      objc_storeStrong((id *)&self->_time, a3);
      id v10 = *p_time;
    }
    BOOL v11 = [(NSCalendar *)self->_calendar components:224 fromDate:v10];
    uint64_t v12 = [v11 hour];
    uint64_t v13 = [v11 minute];
    double v14 = (double)[v11 second];
    int64_t runMode = self->_runMode;
    if (runMode == 2)
    {
      if (v4)
      {
        [*p_time timeIntervalSinceReferenceDate];
        double v14 = modf(v16, &__y) + v14;
      }
    }
    else if (runMode == 1)
    {
      double v14 = v14 + 0.15;
      self->_double seconds = v14;
    }
    self->_flutterIndedouble x = 0;
    double v17 = (double)v12;
    if (self->_runMode == 2)
    {
      double v18 = v14 / 60.0 + (double)v13;
      double v19 = v14 * 0.104719755;
      double v20 = v18 * 0.104719755;
      double v21 = (v18 / 60.0 + v17) * 0.523598776;
    }
    else
    {
      double v19 = v14 * 0.104719755;
      double v20 = (double)v13 * 0.104719755;
      double v21 = v20 / 12.0 + v17 * 0.523598776;
    }
    [(MTUIAnalogClockView *)self setHandAngle:2 forHandIndex:v19];
    [(MTUIAnalogClockView *)self setHandAngle:1 forHandIndex:v20];
    [(MTUIAnalogClockView *)self setHandAngle:0 forHandIndex:v21];
    [(MTUIAnalogClockView *)self setNighttime:(unint64_t)(v12 - 18) < 0xFFFFFFFFFFFFFFF4];

    id v9 = v22;
  }

  MEMORY[0x270F9A758](v8, v9);
}

- (NSTimeZone)timeZone
{
  return [(NSCalendar *)self->_calendar timeZone];
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(NSCalendar *)self->_calendar timeZone];
  char v5 = [v4 isEqualToTimeZone:v6];

  if ((v5 & 1) == 0)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v6];
    if (self->_runMode != -1)
    {
      if (self->_time)
      {
        self->_minuteHourAnimationTriggered = 0;
        if ([(MTUIAnalogClockView *)self isStarted])
        {
          [(MTUIAnalogClockView *)self stop];
          [(MTUIAnalogClockView *)self start];
        }
        else
        {
          [(MTUIAnalogClockView *)self updateTimeAnimated:0];
        }
      }
    }
  }
}

- (BOOL)isStarted
{
  return +[MTUIAnalogClockView isClockRegistered:self];
}

- (void)start
{
  if (![(MTUIAnalogClockView *)self isStarted])
  {
    [(MTUIAnalogClockView *)self updateTimeAnimated:0];
    +[MTUIAnalogClockView registerClock:self];
    [(MTUIAnalogClockView *)self updateTimeAnimated:1];
  }
}

- (void)stop
{
}

- (void)handleLocaleChange
{
  int64_t v3 = [(id)objc_opt_class() clockFaceForDaytime:1 ignoreCache:1];
  faceDayImage = self->_faceDayImage;
  self->_faceDayImage = v3;

  char v5 = [(id)objc_opt_class() clockFaceForDaytime:0 ignoreCache:1];
  faceNightImage = self->_faceNightImage;
  self->_faceNightImage = v5;

  faceView = self->_faceView;
  if (self->_nighttime) {
    uint64_t v8 = 424;
  }
  else {
    uint64_t v8 = 416;
  }
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.isa + v8);

  [(UIImageView *)faceView setImage:v9];
}

- (void)redrawSecondHand
{
  int64_t v3 = objc_opt_class();
  int64_t v4 = 1000 * [(MTUIAnalogClockView *)self style];
  char v5 = [NSNumber numberWithUnsignedInteger:v4 + 103];
  id v6 = MTImageCache();
  [v6 removeObjectForKey:v5];

  __float2 v7 = [v3 cacheVersionedPath];
  uint64_t v8 = [v3 resourcePath];
  uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

  double v28 = [v3 imageCacheNameForType:3 daytime:1];
  uint64_t v10 = objc_msgSend(v9, "stringByAppendingPathComponent:");
  BOOL v11 = [MEMORY[0x263F08850] defaultManager];
  double v27 = (void *)v10;
  objc_msgSend(v11, "_web_removeFileOnlyAtPath:", v10);

  uint64_t v12 = self->_dayHands[2];
  [(UIView *)v12 removeFromSuperview];
  uint64_t v13 = [v3 clockHand:2 daytime:1];
  double v14 = [MTUIBitmapHandView alloc];
  [v3 handRotationalCenterForHand:2];
  long long v15 = -[MTUIBitmapHandView initWithImage:rotationalCenter:](v14, "initWithImage:rotationalCenter:", v13);
  objc_storeStrong((id *)&self->_dayHands[2], v15);
  [(UIView *)v12 center];
  -[MTUIBitmapHandView setCenter:](v15, "setCenter:");
  if (v12)
  {
    [(UIView *)v12 transform];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
  }
  v33[0] = v34;
  v33[1] = v35;
  v33[2] = v36;
  [(MTUIBitmapHandView *)v15 setTransform:v33];
  [(MTUIAnalogClockView *)self addSubview:v15];
  if ([v3 hasOverSecondHandDot])
  {
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v4 | 5];
    double v17 = MTImageCache();
    uint64_t v26 = (void *)v16;
    [v17 removeObjectForKey:v16];

    double v18 = [v3 imageCacheNameForType:5 daytime:0];
    double v19 = [v9 stringByAppendingPathComponent:v18];
    double v20 = [MEMORY[0x263F08850] defaultManager];
    objc_msgSend(v20, "_web_removeFileOnlyAtPath:", v19);

    double v21 = self->_middleRedDot;
    [(UIImageView *)v21 removeFromSuperview];
    id v22 = [v3 overSecondHandDotImage];
    double v23 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v22];
    middleRedDot = self->_middleRedDot;
    self->_middleRedDot = v23;

    [(UIImageView *)v21 center];
    -[UIImageView setCenter:](self->_middleRedDot, "setCenter:");
    if (v21)
    {
      [(UIImageView *)v21 transform];
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v30 = 0u;
    }
    double v25 = self->_middleRedDot;
    v29[0] = v30;
    v29[1] = v31;
    v29[2] = v32;
    [(UIImageView *)v25 setTransform:v29];
    [(MTUIAnalogClockView *)self addSubview:self->_middleRedDot];
  }
}

- (int64_t)runMode
{
  return self->_runMode;
}

- (void)setRunMode:(int64_t)a3
{
  self->_int64_t runMode = a3;
}

- (UIImageView)faceView
{
  return self->_faceView;
}

- (NSDate)time
{
  return self->_time;
}

- (BOOL)isNighttime
{
  return self->_nighttime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_middleRedDot, 0);
  objc_storeStrong((id *)&self->_middleDotNight, 0);
  objc_storeStrong((id *)&self->_middleDotDay, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_nightHands[i], 0);
  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_dayHands[j], 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_faceNightImage, 0);

  objc_storeStrong((id *)&self->_faceDayImage, 0);
}

+ (void)makeClockHand:(uint64_t)a1 daytime:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_235CF1000, a2, OS_LOG_TYPE_DEBUG, "Tried to make clock hand of type %ld", (uint8_t *)&v2, 0xCu);
}

@end