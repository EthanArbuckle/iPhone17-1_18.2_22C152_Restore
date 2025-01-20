@interface PGGraphPlaceBusinessEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphPlaceBusinessEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end