@interface SASTCardItem
+ (id)cardItem;
- (SAUIColor)backgroundColor;
- (SAUIColor)labelTextColor;
- (SAUIColor)titleBackgroundColor;
- (SAUIColor)titleTextColor;
- (SAUIDecoratedText)footnote;
- (SAUIDecoratedText)label;
- (SAUIDecoratedText)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundColor:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleBackgroundColor:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation SASTCardItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"CardItem";
}

+ (id)cardItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIColor)backgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
}

- (SAUIDecoratedText)footnote
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"footnote");
}

- (void)setFootnote:(id)a3
{
}

- (SAUIDecoratedText)label
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"label");
}

- (void)setLabel:(id)a3
{
}

- (SAUIColor)labelTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"labelTextColor");
}

- (void)setLabelTextColor:(id)a3
{
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"title");
}

- (void)setTitle:(id)a3
{
}

- (SAUIColor)titleBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"titleBackgroundColor");
}

- (void)setTitleBackgroundColor:(id)a3
{
}

- (SAUIColor)titleTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"titleTextColor");
}

- (void)setTitleTextColor:(id)a3
{
}

@end