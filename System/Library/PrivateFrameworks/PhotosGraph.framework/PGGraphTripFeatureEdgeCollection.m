@interface PGGraphTripFeatureEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphTripFeatureEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end