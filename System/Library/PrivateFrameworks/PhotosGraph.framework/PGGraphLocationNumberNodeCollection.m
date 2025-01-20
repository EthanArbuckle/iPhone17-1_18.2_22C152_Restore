@interface PGGraphLocationNumberNodeCollection
+ (Class)nodeClass;
@end

@implementation PGGraphLocationNumberNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end