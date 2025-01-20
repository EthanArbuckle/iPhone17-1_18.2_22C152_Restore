@interface SAUIErrorSnippet
+ (id)errorSnippet;
- (NSString)message;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMessage:(id)a3;
@end

@implementation SAUIErrorSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ErrorSnippet";
}

+ (id)errorSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)message
{
  return (NSString *)[(AceObject *)self propertyForKey:@"message"];
}

- (void)setMessage:(id)a3
{
}

@end