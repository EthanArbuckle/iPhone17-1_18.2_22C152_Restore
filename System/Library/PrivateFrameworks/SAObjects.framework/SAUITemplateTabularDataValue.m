@interface SAUITemplateTabularDataValue
+ (id)tabularDataValue;
- (BOOL)highlighted;
- (NSArray)themeImages;
- (NSDictionary)attributedTexts;
- (SAUIImageResource)image;
- (SAUITemplateAttributedString)attributedText;
- (double)imagePointHeight;
- (double)imagePointWidth;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributedText:(id)a3;
- (void)setAttributedTexts:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImagePointHeight:(double)a3;
- (void)setImagePointWidth:(double)a3;
- (void)setThemeImages:(id)a3;
@end

@implementation SAUITemplateTabularDataValue

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataValue";
}

+ (id)tabularDataValue
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUITemplateAttributedString)attributedText
{
  return (SAUITemplateAttributedString *)AceObjectAceObjectForProperty(self, @"attributedText");
}

- (void)setAttributedText:(id)a3
{
}

- (NSDictionary)attributedTexts
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"attributedTexts", v3);
}

- (void)setAttributedTexts:(id)a3
{
}

- (BOOL)highlighted
{
  return AceObjectBoolForProperty(self, @"highlighted");
}

- (void)setHighlighted:(BOOL)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (double)imagePointHeight
{
  return AceObjectDoubleForProperty(self, @"imagePointHeight");
}

- (void)setImagePointHeight:(double)a3
{
}

- (double)imagePointWidth
{
  return AceObjectDoubleForProperty(self, @"imagePointWidth");
}

- (void)setImagePointWidth:(double)a3
{
}

- (NSArray)themeImages
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"themeImages", v3);
}

- (void)setThemeImages:(id)a3
{
}

@end