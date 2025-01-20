@interface PGGraphROIEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphROIEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end