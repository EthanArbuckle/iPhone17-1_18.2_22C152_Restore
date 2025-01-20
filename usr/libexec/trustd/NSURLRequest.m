@interface NSURLRequest
- (id)taskId;
@end

@implementation NSURLRequest

- (id)taskId
{
  v2 = [(NSURLRequest *)self allHTTPHeaderFields];
  v3 = [v2 objectForKey:@"X-Apple-Request-UUID"];

  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end