@interface BIMGUtility
+ (BOOL)isiPhone;
@end

@implementation BIMGUtility

+ (BOOL)isiPhone
{
  v2 = (void *)MGGetStringAnswer();
  unsigned __int8 v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

@end