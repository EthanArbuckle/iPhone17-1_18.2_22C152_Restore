@interface SAGKWebLinkPod
+ (id)webLinkPod;
- (NSArray)links;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLinks:(id)a3;
@end

@implementation SAGKWebLinkPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"WebLinkPod";
}

+ (id)webLinkPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)links
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"links", v3);
}

- (void)setLinks:(id)a3
{
}

@end