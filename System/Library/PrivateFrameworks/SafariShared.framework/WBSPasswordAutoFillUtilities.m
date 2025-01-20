@interface WBSPasswordAutoFillUtilities
+ (BOOL)mayAutoFillPasswordOnHost:(id)a3;
@end

@implementation WBSPasswordAutoFillUtilities

+ (BOOL)mayAutoFillPasswordOnHost:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "safari_highLevelDomainFromHost");
  BOOL v5 = !objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", @"google.com")
    || ([v3 isEqualToString:@"accounts.google.com"] & 1) != 0
    || [v3 isEqualToString:@"myaccount.google.com"];

  return v5;
}

@end