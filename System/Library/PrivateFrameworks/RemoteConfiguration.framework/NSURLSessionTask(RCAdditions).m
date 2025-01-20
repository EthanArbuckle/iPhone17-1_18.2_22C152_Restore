@interface NSURLSessionTask(RCAdditions)
- (__CFString)rc_logIdentifier;
@end

@implementation NSURLSessionTask(RCAdditions)

- (__CFString)rc_logIdentifier
{
  v1 = [a1 originalRequest];
  v2 = [v1 description];
  v3 = v2;
  if (!v2) {
    v2 = @"unknown";
  }
  v4 = v2;

  return v4;
}

@end