@interface PGGraphMomentNextEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphMomentNextEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end