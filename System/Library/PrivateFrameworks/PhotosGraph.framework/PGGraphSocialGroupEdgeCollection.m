@interface PGGraphSocialGroupEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphSocialGroupEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end