@interface SAUITemplateLabel
+ (id)label;
- (NSDictionary)attributedTexts;
- (SAUITemplateAttributedString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributedTexts:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAUITemplateLabel

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"Label";
}

+ (id)label
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)attributedTexts
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"attributedTexts", v3);
}

- (void)setAttributedTexts:(id)a3
{
}

- (SAUITemplateAttributedString)text
{
  return (SAUITemplateAttributedString *)AceObjectAceObjectForProperty(self, @"text");
}

- (void)setText:(id)a3
{
}

@end