@interface PGGraphPersonProximityEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPersonProximityEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end