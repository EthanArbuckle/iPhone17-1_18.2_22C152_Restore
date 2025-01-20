@interface SAIntentGroupTextSnippetTemplate
+ (id)textSnippetTemplate;
- (BOOL)showsDisclosureIndicator;
- (NSArray)labelComponents;
- (NSString)alignment;
- (NSString)detailText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setLabelComponents:(id)a3;
- (void)setShowsDisclosureIndicator:(BOOL)a3;
@end

@implementation SAIntentGroupTextSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"TextSnippetTemplate";
}

+ (id)textSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (NSString)detailText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"detailText"];
}

- (void)setDetailText:(id)a3
{
}

- (NSArray)labelComponents
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"labelComponents", v3);
}

- (void)setLabelComponents:(id)a3
{
}

- (BOOL)showsDisclosureIndicator
{
  return AceObjectBoolForProperty(self, @"showsDisclosureIndicator");
}

- (void)setShowsDisclosureIndicator:(BOOL)a3
{
}

@end