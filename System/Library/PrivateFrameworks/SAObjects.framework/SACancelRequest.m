@interface SACancelRequest
+ (id)cancelRequest;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)clientCancellationCode;
- (void)setClientCancellationCode:(int64_t)a3;
@end

@implementation SACancelRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CancelRequest";
}

+ (id)cancelRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)clientCancellationCode
{
  return AceObjectIntegerForProperty(self, @"clientCancellationCode");
}

- (void)setClientCancellationCode:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end