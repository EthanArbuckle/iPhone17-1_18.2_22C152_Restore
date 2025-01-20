@interface PGGraphAnniversaryEventEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphAnniversaryEventEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end