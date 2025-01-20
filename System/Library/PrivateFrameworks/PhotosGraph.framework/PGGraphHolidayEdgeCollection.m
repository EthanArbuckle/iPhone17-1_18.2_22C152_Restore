@interface PGGraphHolidayEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphHolidayEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end