@interface PGGraphWeekdayNodeCollection
+ (Class)nodeClass;
@end

@implementation PGGraphWeekdayNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end