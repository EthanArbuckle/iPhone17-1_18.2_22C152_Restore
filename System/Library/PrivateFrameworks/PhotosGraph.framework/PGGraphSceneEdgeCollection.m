@interface PGGraphSceneEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphSceneEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end