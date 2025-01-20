@interface SASTLineDetailItem
+ (id)lineDetailItem;
- (SAUIDecoratedText)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTitle:(id)a3;
@end

@implementation SASTLineDetailItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"LineDetailItem";
}

+ (id)lineDetailItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"title");
}

- (void)setTitle:(id)a3
{
}

@end