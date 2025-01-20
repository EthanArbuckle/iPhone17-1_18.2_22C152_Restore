@interface PGGraphBirthdayEventEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphBirthdayEventEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end