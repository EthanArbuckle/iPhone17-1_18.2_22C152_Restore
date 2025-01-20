@interface SAGuidanceGuideSnippet
+ (id)guideSnippet;
- (NSArray)domainSnippets;
- (NSArray)intentEnabledAppSnippets;
- (NSString)headerText;
- (SAUIAppPunchOut)appStorePunchOut;
- (SAUIButton)appPunchOutButton;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppPunchOutButton:(id)a3;
- (void)setAppStorePunchOut:(id)a3;
- (void)setDomainSnippets:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setIntentEnabledAppSnippets:(id)a3;
@end

@implementation SAGuidanceGuideSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"GuideSnippet";
}

+ (id)guideSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIButton)appPunchOutButton
{
  return (SAUIButton *)AceObjectAceObjectForProperty(self, @"appPunchOutButton");
}

- (void)setAppPunchOutButton:(id)a3
{
}

- (SAUIAppPunchOut)appStorePunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"appStorePunchOut");
}

- (void)setAppStorePunchOut:(id)a3
{
}

- (NSArray)domainSnippets
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"domainSnippets", v3);
}

- (void)setDomainSnippets:(id)a3
{
}

- (NSString)headerText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headerText"];
}

- (void)setHeaderText:(id)a3
{
}

- (NSArray)intentEnabledAppSnippets
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"intentEnabledAppSnippets", v3);
}

- (void)setIntentEnabledAppSnippets:(id)a3
{
}

@end