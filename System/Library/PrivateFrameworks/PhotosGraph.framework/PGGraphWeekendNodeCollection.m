@interface PGGraphWeekendNodeCollection
+ (Class)nodeClass;
@end

@implementation PGGraphWeekendNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end