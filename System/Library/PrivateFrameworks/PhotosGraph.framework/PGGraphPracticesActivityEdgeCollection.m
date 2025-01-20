@interface PGGraphPracticesActivityEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPracticesActivityEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end