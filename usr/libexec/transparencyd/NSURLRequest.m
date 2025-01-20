@interface NSURLRequest
- (id)kt_requestId;
@end

@implementation NSURLRequest

- (id)kt_requestId
{
  v2 = [(NSURLRequest *)self allHTTPHeaderFields];
  v3 = [v2 objectForKey:off_1003264F0];

  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end