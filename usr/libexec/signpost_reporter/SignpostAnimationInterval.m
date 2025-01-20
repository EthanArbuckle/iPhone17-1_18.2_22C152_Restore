@interface SignpostAnimationInterval
- (id)coreAnalyticsPayload;
- (id)signpostType;
@end

@implementation SignpostAnimationInterval

- (id)signpostType
{
  return @"AnimationInterval";
}

- (id)coreAnalyticsPayload
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostAnimationInterval;
  v3 = [(SignpostAnimationInterval *)&v8 coreAnalyticsPayload];
  if (v3)
  {
    [(SignpostAnimationInterval *)self glitchTimeRatio];
    v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v4 forKeyedSubscript:@"FrameRate"];

    [(SignpostAnimationInterval *)self glitchTimeRatioMsPerS];
    v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"HitchMsPerSec"];

    [(SignpostAnimationInterval *)self nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS];
    v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"NonFirstFrameHitchAdjustedMsPerSec"];
  }

  return v3;
}

@end