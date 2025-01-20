@interface SAEmailSend
+ (id)send;
- (BOOL)requiresResponse;
- (SAEmailEmail)email;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEmail:(id)a3;
@end

@implementation SAEmailSend

- (id)groupIdentifier
{
  return @"com.apple.ace.email";
}

- (id)encodedClassName
{
  return @"Send";
}

+ (id)send
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAEmailEmail)email
{
  return (SAEmailEmail *)AceObjectAceObjectForProperty(self, @"email");
}

- (void)setEmail:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end