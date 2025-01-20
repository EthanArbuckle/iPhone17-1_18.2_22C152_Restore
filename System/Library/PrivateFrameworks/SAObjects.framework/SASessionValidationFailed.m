@interface SASessionValidationFailed
+ (id)sessionValidationFailed;
- (BOOL)requiresResponse;
- (NSString)errorCode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setErrorCode:(id)a3;
@end

@implementation SASessionValidationFailed

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SessionValidationFailed";
}

+ (id)sessionValidationFailed
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)errorCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"errorCode"];
}

- (void)setErrorCode:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end