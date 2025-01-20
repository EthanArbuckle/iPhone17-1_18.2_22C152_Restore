@interface UKChinaSKU
+ (BOOL)isChina;
@end

@implementation UKChinaSKU

+ (BOOL)isChina
{
  v2 = MGGetStringAnswer();
  uint64_t v3 = [v2 caseInsensitiveCompare:@"CH"];
  char v4 = MGGetBoolAnswer();
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

@end