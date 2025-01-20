@interface PGGraphPOIEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPOIEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end