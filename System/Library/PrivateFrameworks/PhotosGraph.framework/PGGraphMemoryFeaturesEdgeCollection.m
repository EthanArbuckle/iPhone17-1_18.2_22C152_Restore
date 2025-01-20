@interface PGGraphMemoryFeaturesEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphMemoryFeaturesEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end