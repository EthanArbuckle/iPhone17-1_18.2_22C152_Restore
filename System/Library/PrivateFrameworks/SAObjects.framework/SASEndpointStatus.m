@interface SASEndpointStatus
+ (id)endpointStatus;
- (BOOL)confirmed;
- (BOOL)requiresResponse;
- (NSNumber)endpointConfirmationTimestamp;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfirmed:(BOOL)a3;
- (void)setEndpointConfirmationTimestamp:(id)a3;
@end

@implementation SASEndpointStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"EndpointStatus";
}

+ (id)endpointStatus
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)confirmed
{
  return AceObjectBoolForProperty(self, @"confirmed");
}

- (void)setConfirmed:(BOOL)a3
{
}

- (NSNumber)endpointConfirmationTimestamp
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"endpointConfirmationTimestamp"];
}

- (void)setEndpointConfirmationTimestamp:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end