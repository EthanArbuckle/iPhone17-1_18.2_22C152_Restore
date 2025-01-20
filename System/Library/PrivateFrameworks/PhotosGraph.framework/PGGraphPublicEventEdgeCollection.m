@interface PGGraphPublicEventEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPublicEventEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end