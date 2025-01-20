@interface SACancelCrossDeviceRequest
- (BOOL)cancelAssociatedRequests;
- (BOOL)requiresResponse;
- (NSString)requestId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCancelAssociatedRequests:(BOOL)a3;
- (void)setRequestId:(id)a3;
@end

@implementation SACancelCrossDeviceRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CancelCrossDeviceRequest";
}

- (BOOL)cancelAssociatedRequests
{
  return AceObjectBoolForProperty(self, @"cancelAssociatedRequests");
}

- (void)setCancelAssociatedRequests:(BOOL)a3
{
}

- (NSString)requestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestId"];
}

- (void)setRequestId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end