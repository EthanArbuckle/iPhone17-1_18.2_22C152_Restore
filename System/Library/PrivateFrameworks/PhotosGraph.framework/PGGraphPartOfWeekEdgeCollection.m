@interface PGGraphPartOfWeekEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPartOfWeekEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end