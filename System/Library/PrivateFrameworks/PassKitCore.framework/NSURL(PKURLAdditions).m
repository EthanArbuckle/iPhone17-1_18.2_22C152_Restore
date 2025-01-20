@interface NSURL(PKURLAdditions)
- (BOOL)isAppleURL;
@end

@implementation NSURL(PKURLAdditions)

- (BOOL)isAppleURL
{
  v1 = [a1 host];
  if ([v1 caseInsensitiveCompare:@"apple.com"])
  {
    if ([v1 caseInsensitiveCompare:@"applepaydemo.apple.com"]) {
      BOOL v2 = [v1 rangeOfString:@".apple.com" options:13] != 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v2 = 0;
    }
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

@end