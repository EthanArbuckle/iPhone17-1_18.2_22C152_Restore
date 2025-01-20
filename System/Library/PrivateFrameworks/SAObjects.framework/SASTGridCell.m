@interface SASTGridCell
+ (id)gridCell;
- (SAUIDecoratedText)subTitle;
- (SAUIDecoratedText)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASTGridCell

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"GridCell";
}

+ (id)gridCell
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)subTitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"subTitle");
}

- (void)setSubTitle:(id)a3
{
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"title");
}

- (void)setTitle:(id)a3
{
}

@end