@interface MTUICollectionCellAnalogClockView
+ (BOOL)shouldCacheImageOnDiskForType:(int)a3 dayTime:(BOOL)a4;
+ (CGPoint)handRotationalCenterForHand:(int64_t)a3;
+ (double)faceRadius;
+ (double)hourHandLength;
+ (double)hourHandWidth;
+ (double)minuteHandLength;
+ (double)minuteHandWidth;
+ (double)overHourHandDotSize;
+ (double)overSecondHandDotSize;
+ (double)secondHandMainLength;
+ (double)secondHandOverhangLength;
+ (double)secondHandWidth;
+ (id)makeClockFaceForDaytime:(BOOL)a3;
+ (int64_t)style;
- (double)coarseUpdateInterval;
- (double)updateInterval;
@end

@implementation MTUICollectionCellAnalogClockView

+ (int64_t)style
{
  return 1;
}

+ (double)faceRadius
{
  return 62.5;
}

+ (double)hourHandLength
{
  return 33.0;
}

+ (double)minuteHandLength
{
  return 57.0;
}

+ (double)secondHandMainLength
{
  return 56.0;
}

+ (double)secondHandOverhangLength
{
  return MTUIRoundToPixel(7.5);
}

+ (double)minuteHandWidth
{
  return MTUIRoundToPixel(2.5);
}

+ (double)hourHandWidth
{
  return MTUIRoundToPixel(2.5);
}

+ (double)secondHandWidth
{
  return 1.0;
}

+ (double)overHourHandDotSize
{
  return 6.0;
}

+ (double)overSecondHandDotSize
{
  return 3.0;
}

+ (CGPoint)handRotationalCenterForHand:(int64_t)a3
{
  double v3 = 1.0;
  double v4 = 0.5;
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      [a1 secondHandOverhangLength];
      double v7 = v6;
      [a1 secondHandOverhangLength];
      double v9 = v8;
      [a1 secondHandMainLength];
      double v3 = 1.0 - v7 / (v9 + v10);
    }
    else
    {
      double v4 = *MEMORY[0x263F00148];
      double v3 = *(double *)(MEMORY[0x263F00148] + 8);
    }
  }
  double v11 = v4;
  result.y = v3;
  result.x = v11;
  return result;
}

+ (BOOL)shouldCacheImageOnDiskForType:(int)a3 dayTime:(BOOL)a4
{
  return 0;
}

+ (id)makeClockFaceForDaytime:(BOOL)a3
{
  if (a3) {
    double v4 = @"White";
  }
  else {
    double v4 = @"Black";
  }
  v5 = [@"MTAnalogClockCollectionCell" stringByAppendingString:v4];
  double v6 = (void *)MEMORY[0x263F50758];
  double v7 = [MEMORY[0x263EFF960] currentLocale];
  double v8 = [v7 localeIdentifier];
  double v9 = [v6 numberingSystemForLocaleID:v8];

  if ([v9 isEqualToString:@"arab"])
  {
    double v10 = @"Arabic";
  }
  else
  {
    if (![v9 isEqualToString:@"deva"]) {
      goto LABEL_9;
    }
    double v10 = @"Devanagari";
  }
  uint64_t v11 = [v5 stringByAppendingString:v10];

  v5 = (void *)v11;
LABEL_9:
  v12 = [a1 imageInBundleForName:v5];

  return v12;
}

- (double)updateInterval
{
  return 0.075;
}

- (double)coarseUpdateInterval
{
  return 2.5;
}

@end