@interface PGGraphConsolidatedPersonPresentEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphConsolidatedPersonPresentEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end