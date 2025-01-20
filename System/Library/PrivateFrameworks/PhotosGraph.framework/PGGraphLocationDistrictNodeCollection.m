@interface PGGraphLocationDistrictNodeCollection
+ (Class)nodeClass;
@end

@implementation PGGraphLocationDistrictNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end