@interface MXMOSSignpostSampleTag
+ (MXMOSSignpostSampleTag)animationFrameCount;
+ (MXMOSSignpostSampleTag)animationFrameRate;
+ (MXMOSSignpostSampleTag)animationGlitchTimeRatio;
+ (MXMOSSignpostSampleTag)animationGlitchesTotalDuration;
+ (MXMOSSignpostSampleTag)animationNonFirstFrameGlitchTimeRatioAdjusted;
+ (MXMOSSignpostSampleTag)animationNonFirstFrameGlitchesTotalDuration;
+ (MXMOSSignpostSampleTag)animationNonFirstFrameNumberOfGlitches;
+ (MXMOSSignpostSampleTag)animationNumberOfGlitches;
+ (MXMOSSignpostSampleTag)duration;
+ (MXMOSSignpostSampleTag)telemetryNumber1;
+ (MXMOSSignpostSampleTag)telemetryNumber2;
+ (MXMOSSignpostSampleTag)timestamp;
@end

@implementation MXMOSSignpostSampleTag

+ (MXMOSSignpostSampleTag)timestamp
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.timestamp"];
  return v2;
}

+ (MXMOSSignpostSampleTag)duration
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.duration"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationFrameCount
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.frame.count"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationFrameRate
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.frame.rate"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationGlitchTimeRatio
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.hitch.time.ratio"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationNumberOfGlitches
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.hitch.number"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationGlitchesTotalDuration
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.hitches.total.duration"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationNonFirstFrameGlitchTimeRatioAdjusted
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.hitch.non_first_frame.time.ratio.adjusted"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationNonFirstFrameNumberOfGlitches
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.hitch.non_first_frame.number"];
  return v2;
}

+ (MXMOSSignpostSampleTag)animationNonFirstFrameGlitchesTotalDuration
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.animation.hitches.non_first_frame.total.duration"];
  return v2;
}

+ (MXMOSSignpostSampleTag)telemetryNumber1
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.telemetry.number.1"];
  return v2;
}

+ (MXMOSSignpostSampleTag)telemetryNumber2
{
  v2 = [(MXMSampleTag *)[MXMOSSignpostSampleTag alloc] initWithDNString:@"os_signpost.telemetry.number.2"];
  return v2;
}

@end