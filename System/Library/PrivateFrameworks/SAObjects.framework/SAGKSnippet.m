@interface SAGKSnippet
+ (id)snippet;
- (NSArray)pods;
- (SAUIAppPunchOut)appPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppPunchOut:(id)a3;
- (void)setPods:(id)a3;
@end

@implementation SAGKSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
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

- (SAUIAppPunchOut)appPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"appPunchOut");
}

- (void)setAppPunchOut:(id)a3
{
}

- (NSArray)pods
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"pods", v3);
}

- (void)setPods:(id)a3
{
}

@end