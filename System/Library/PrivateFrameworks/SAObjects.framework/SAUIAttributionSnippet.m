@interface SAUIAttributionSnippet
+ (id)attributionSnippet;
- (BOOL)showKeyLine;
- (SAUIAppPunchOut)appPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppPunchOut:(id)a3;
- (void)setShowKeyLine:(BOOL)a3;
@end

@implementation SAUIAttributionSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AttributionSnippet";
}

+ (id)attributionSnippet
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

- (BOOL)showKeyLine
{
  return AceObjectBoolForProperty(self, @"showKeyLine");
}

- (void)setShowKeyLine:(BOOL)a3
{
}

@end