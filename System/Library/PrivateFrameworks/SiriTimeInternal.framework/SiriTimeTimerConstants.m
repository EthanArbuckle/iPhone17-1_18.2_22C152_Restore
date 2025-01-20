@interface SiriTimeTimerConstants
+ (double)defaultDuration;
+ (double)maxReformationDuration;
+ (double)maximumDuration;
+ (double)minimumDuration;
@end

@implementation SiriTimeTimerConstants

+ (double)minimumDuration
{
  return 0.0;
}

+ (double)maximumDuration
{
  return 86400.0;
}

+ (double)defaultDuration
{
  return -1.0;
}

+ (double)maxReformationDuration
{
  return 60.0;
}

@end