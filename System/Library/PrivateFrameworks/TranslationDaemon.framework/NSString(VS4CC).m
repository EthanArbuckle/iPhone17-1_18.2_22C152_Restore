@interface NSString(VS4CC)
+ (__CFString)vs_stringFrom4CC:()VS4CC;
@end

@implementation NSString(VS4CC)

+ (__CFString)vs_stringFrom4CC:()VS4CC
{
  v3 = (__CFString *)VSCreate4CCString(a3);
  return v3;
}

@end