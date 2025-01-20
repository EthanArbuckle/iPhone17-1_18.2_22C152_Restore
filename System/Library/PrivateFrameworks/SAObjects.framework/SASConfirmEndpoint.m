@interface SASConfirmEndpoint
+ (id)confirmEndpoint;
- (BOOL)requiresResponse;
- (NSNumber)endpointConfirmationTimestamp;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEndpointConfirmationTimestamp:(id)a3;
@end

@implementation SASConfirmEndpoint

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ConfirmEndpoint";
}

+ (id)confirmEndpoint
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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
  return 1;
}

@end