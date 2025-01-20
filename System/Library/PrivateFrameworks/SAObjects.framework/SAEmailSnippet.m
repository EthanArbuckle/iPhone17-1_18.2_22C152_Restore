@interface SAEmailSnippet
+ (id)snippet;
- (NSArray)emails;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEmails:(id)a3;
@end

@implementation SAEmailSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.email";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)emails
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"emails", v3);
}

- (void)setEmails:(id)a3
{
}

@end