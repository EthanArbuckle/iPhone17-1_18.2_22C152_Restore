@interface SASTSubheaderItem
+ (id)subheaderItem;
- (SAUIDecoratedText)leftText;
- (SAUIDecoratedText)rightText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLeftText:(id)a3;
- (void)setRightText:(id)a3;
@end

@implementation SASTSubheaderItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"SubheaderItem";
}

+ (id)subheaderItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)leftText
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"leftText");
}

- (void)setLeftText:(id)a3
{
}

- (SAUIDecoratedText)rightText
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"rightText");
}

- (void)setRightText:(id)a3
{
}

@end