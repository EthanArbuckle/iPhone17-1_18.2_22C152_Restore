@interface SAIntentGroupLabelTemplateComponent
+ (id)labelTemplateComponent;
- (NSString)labelTemplateComponentStyle;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLabelTemplateComponentStyle:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAIntentGroupLabelTemplateComponent

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"LabelTemplateComponent";
}

+ (id)labelTemplateComponent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)labelTemplateComponentStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"labelTemplateComponentStyle"];
}

- (void)setLabelTemplateComponentStyle:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end