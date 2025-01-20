@interface PGGraphMemoryContainsAssetsFromEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphMemoryContainsAssetsFromEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end