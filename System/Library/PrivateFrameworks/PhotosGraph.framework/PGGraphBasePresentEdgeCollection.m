@interface PGGraphBasePresentEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphBasePresentEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end