@interface SAIntentGroupDetailLabelTemplateComponent
+ (id)detailLabelTemplateComponent;
- (NSString)detailText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDetailText:(id)a3;
@end

@implementation SAIntentGroupDetailLabelTemplateComponent

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"DetailLabelTemplateComponent";
}

+ (id)detailLabelTemplateComponent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)detailText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"detailText"];
}

- (void)setDetailText:(id)a3
{
}

@end