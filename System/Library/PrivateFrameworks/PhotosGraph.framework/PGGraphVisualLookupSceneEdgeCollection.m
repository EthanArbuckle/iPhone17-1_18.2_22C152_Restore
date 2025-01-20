@interface PGGraphVisualLookupSceneEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphVisualLookupSceneEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end