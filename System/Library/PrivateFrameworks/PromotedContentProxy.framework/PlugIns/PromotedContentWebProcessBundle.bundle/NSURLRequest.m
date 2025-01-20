@interface NSURLRequest
- (BOOL)hasRecursiveRequestFlag;
- (BOOL)recursiveRequestFlag;
- (NSNumber)maximumRequestCount;
- (NSString)adIdentifier;
- (int64_t)requestType;
@end

@implementation NSURLRequest

- (NSNumber)maximumRequestCount
{
  return (NSNumber *)+[NSURLProtocol propertyForKey:@"maximumRequestCount" inRequest:self];
}

- (NSString)adIdentifier
{
  return (NSString *)+[NSURLProtocol propertyForKey:@"adIdentifier" inRequest:self];
}

- (BOOL)recursiveRequestFlag
{
  v2 = +[NSURLProtocol propertyForKey:@"com.apple.ap.pc.proxy-is-recursive" inRequest:self];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasRecursiveRequestFlag
{
  v2 = +[NSURLProtocol propertyForKey:@"com.apple.ap.pc.proxy-is-recursive" inRequest:self];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)requestType
{
  v2 = +[NSURLProtocol propertyForKey:@"requestType" inRequest:self];
  BOOL v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

@end