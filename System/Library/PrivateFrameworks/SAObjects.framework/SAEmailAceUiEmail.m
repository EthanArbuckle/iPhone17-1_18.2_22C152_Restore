@interface SAEmailAceUiEmail
+ (id)aceUiEmail;
- (NSNumber)read;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRead:(id)a3;
@end

@implementation SAEmailAceUiEmail

- (id)groupIdentifier
{
  return @"com.apple.ace.email";
}

- (id)encodedClassName
{
  return @"AceUiEmail";
}

+ (id)aceUiEmail
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)read
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"read"];
}

- (void)setRead:(id)a3
{
}

@end