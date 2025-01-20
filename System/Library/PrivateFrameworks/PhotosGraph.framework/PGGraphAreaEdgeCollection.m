@interface PGGraphAreaEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphAreaEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end