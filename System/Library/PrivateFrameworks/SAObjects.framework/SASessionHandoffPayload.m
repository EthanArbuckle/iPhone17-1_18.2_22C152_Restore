@interface SASessionHandoffPayload
+ (id)sessionHandoffPayload;
- (NSData)sessionHandoffData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSessionHandoffData:(id)a3;
@end

@implementation SASessionHandoffPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SessionHandoffPayload";
}

+ (id)sessionHandoffPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)sessionHandoffData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"sessionHandoffData"];
}

- (void)setSessionHandoffData:(id)a3
{
}

@end