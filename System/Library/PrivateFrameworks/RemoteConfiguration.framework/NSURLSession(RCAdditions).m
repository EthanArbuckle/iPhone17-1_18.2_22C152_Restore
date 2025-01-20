@interface NSURLSession(RCAdditions)
- (__CFString)rc_logIdentifier;
@end

@implementation NSURLSession(RCAdditions)

- (__CFString)rc_logIdentifier
{
  v1 = [a1 configuration];
  v2 = [v1 identifier];
  v3 = v2;
  if (!v2) {
    v2 = @"unknown";
  }
  v4 = v2;

  return v4;
}

@end