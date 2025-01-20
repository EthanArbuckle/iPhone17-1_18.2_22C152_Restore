@interface TransitDirectionsStopCell
+ (Class)stepViewClass;
@end

@implementation TransitDirectionsStopCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class();
}

@end