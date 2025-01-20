@interface TVPPlaybackUtilities
+ (double)playedThresholdTimeForDuration:(double)a3;
+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4;
+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4 playedThreshold:(id)a5;
+ (int64_t)blueDotStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6;
+ (int64_t)blueDotStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6 respectPlayCount:(BOOL)a7;
@end

@implementation TVPPlaybackUtilities

+ (double)playedThresholdTimeForDuration:(double)a3
{
  double v3 = 0.0;
  if (a3 != 0.0 && a3 > 0.0 && a3 != 3.40282347e38)
  {
    if (a3 < 10.0) {
      return a3;
    }
    if (a3 >= 900.0)
    {
      if (a3 >= 1800.0)
      {
        if (a3 >= 3900.0)
        {
          if (a3 >= 6000.0)
          {
            double v5 = -660.0;
            return a3 + v5;
          }
          unint64_t v6 = 0xC07E000000000000;
        }
        else
        {
          unint64_t v6 = 0xC06E000000000000;
        }
        double v5 = *(double *)&v6;
      }
      else
      {
        double v5 = -180.0;
      }
    }
    else
    {
      double v5 = -10.0;
    }
    return a3 + v5;
  }
  return v3;
}

+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4
{
  [a1 suggestedBookmarkTimeForElapsedTime:0 duration:a3 playedThreshold:a4];
  return result;
}

+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4 playedThreshold:(id)a5
{
  id v8 = a5;
  v9 = v8;
  double v10 = 0.0;
  if (a4 != 0.0 && a3 >= 15.0 && a4 > 0.0 && a4 != 3.40282347e38)
  {
    if (v8 && (objc_msgSend(v8, "doubleValue", 3.40282347e38), v11 > 0.0))
    {
      [v9 doubleValue];
      double v13 = fmin(a4, v12);
    }
    else
    {
      [a1 playedThresholdTimeForDuration:a4];
    }
    if (v13 <= a3) {
      double v10 = 0.0;
    }
    else {
      double v10 = a3;
    }
  }

  return v10;
}

+ (int64_t)blueDotStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6
{
  return [a1 blueDotStateForDuration:a5 elapsedTime:a6 hasBeenPlayed:1 playCount:a3 respectPlayCount:a4];
}

+ (int64_t)blueDotStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6 respectPlayCount:(BOOL)a7
{
  if (!a6 || a7)
  {
    int64_t v8 = 2 * (a6 != 0);
    if (a6 || !a5) {
      return v8;
    }
    if (a4 < 15.0) {
      return 0;
    }
  }
  else if (a4 < 15.0)
  {
    return 2;
  }
  objc_msgSend(a1, "playedThresholdTimeForDuration:", a5, a3);
  int64_t v8 = 2;
  if (v9 > a4) {
    return 1;
  }
  return v8;
}

@end