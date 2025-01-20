@interface PGGraphFrequentLocationInEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphFrequentLocationInEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end