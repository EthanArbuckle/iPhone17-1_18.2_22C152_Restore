@interface PGGraphLocationStreetNodeCollection
+ (Class)nodeClass;
@end

@implementation PGGraphLocationStreetNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end