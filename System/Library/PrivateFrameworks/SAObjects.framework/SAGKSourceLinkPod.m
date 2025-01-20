@interface SAGKSourceLinkPod
+ (id)sourceLinkPod;
- (NSString)linkText;
- (SAUIAppPunchOut)punchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLinkText:(id)a3;
- (void)setPunchOut:(id)a3;
@end

@implementation SAGKSourceLinkPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"SourceLinkPod";
}

+ (id)sourceLinkPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)linkText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"linkText"];
}

- (void)setLinkText:(id)a3
{
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchOut");
}

- (void)setPunchOut:(id)a3
{
}

@end