@interface PGGraphPersonPresentEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPersonPresentEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end