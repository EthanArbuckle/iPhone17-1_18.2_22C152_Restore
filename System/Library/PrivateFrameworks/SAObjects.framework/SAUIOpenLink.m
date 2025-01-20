@interface SAUIOpenLink
+ (id)openLink;
- (BOOL)requiresResponse;
- (NSURL)ref;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRef:(id)a3;
@end

@implementation SAUIOpenLink

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"OpenLink";
}

+ (id)openLink
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)ref
{
  return (NSURL *)AceObjectURLForProperty(self, @"ref");
}

- (void)setRef:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end