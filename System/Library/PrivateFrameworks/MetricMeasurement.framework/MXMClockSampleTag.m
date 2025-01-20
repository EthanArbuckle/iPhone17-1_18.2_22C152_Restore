@interface MXMClockSampleTag
+ (MXMClockSampleTag)absoluteTime;
+ (MXMClockSampleTag)continuousTime;
+ (id)root;
@end

@implementation MXMClockSampleTag

+ (id)root
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDNString:@"clock.time"];
  return v2;
}

+ (MXMClockSampleTag)absoluteTime
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDNString:@"clock.time.absolute"];
  return (MXMClockSampleTag *)v2;
}

+ (MXMClockSampleTag)continuousTime
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDNString:@"clock.time.continuous"];
  return (MXMClockSampleTag *)v2;
}

@end