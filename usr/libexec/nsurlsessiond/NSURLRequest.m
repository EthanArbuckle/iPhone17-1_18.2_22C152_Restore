@interface NSURLRequest
- (BOOL)_nsurlsessionproxy_isSafeRequest;
@end

@implementation NSURLRequest

- (BOOL)_nsurlsessionproxy_isSafeRequest
{
  v2 = [(NSURLRequest *)self URL];
  v3 = [v2 scheme];
  v4 = [v3 lowercaseString];

  if ([v4 isEqualToString:@"http"]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"https"];
  }

  return v5;
}

@end