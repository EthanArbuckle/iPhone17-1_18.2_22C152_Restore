@interface SAUITemplateAttributedString
+ (id)attributedString;
- (NSArray)attributeRuns;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributeRuns:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAUITemplateAttributedString

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"AttributedString";
}

+ (id)attributedString
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)attributeRuns
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"attributeRuns", v3);
}

- (void)setAttributeRuns:(id)a3
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