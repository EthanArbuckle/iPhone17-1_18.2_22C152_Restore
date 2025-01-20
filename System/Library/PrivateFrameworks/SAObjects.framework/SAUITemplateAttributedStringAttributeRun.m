@interface SAUITemplateAttributedStringAttributeRun
+ (id)attributedStringAttributeRun;
- (NSDictionary)attributes;
- (SAUITemplateRange)range;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributes:(id)a3;
- (void)setRange:(id)a3;
@end

@implementation SAUITemplateAttributedStringAttributeRun

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"AttributedStringAttributeRun";
}

+ (id)attributedStringAttributeRun
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)AceObjectProtocolDictionaryForProperty(self, @"attributes", &unk_1EFD72F00);
}

- (void)setAttributes:(id)a3
{
}

- (SAUITemplateRange)range
{
  return (SAUITemplateRange *)AceObjectAceObjectForProperty(self, @"range");
}

- (void)setRange:(id)a3
{
}

@end