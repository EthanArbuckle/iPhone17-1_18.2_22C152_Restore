@interface SMDateUtility
+ (id)date;
@end

@implementation SMDateUtility

+ (id)date
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

@end