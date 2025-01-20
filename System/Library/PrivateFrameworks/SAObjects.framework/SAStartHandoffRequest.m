@interface SAStartHandoffRequest
+ (id)startHandoffRequest;
- (BOOL)requiresResponse;
- (NSData)handoffData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHandoffData:(id)a3;
@end

@implementation SAStartHandoffRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartHandoffRequest";
}

+ (id)startHandoffRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)handoffData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"handoffData"];
}

- (void)setHandoffData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end