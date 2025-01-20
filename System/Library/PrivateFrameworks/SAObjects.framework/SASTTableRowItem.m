@interface SASTTableRowItem
+ (id)tableRowItem;
- (NSArray)columnValues;
- (SAUIDecoratedText)title;
- (SAUINanoImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setColumnValues:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASTTableRowItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"TableRowItem";
}

+ (id)tableRowItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)columnValues
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"columnValues", v3);
}

- (void)setColumnValues:(id)a3
{
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
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