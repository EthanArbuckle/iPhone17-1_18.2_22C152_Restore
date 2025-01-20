@interface SASTColumnDataListItem
+ (id)columnDataListItem;
- (NSArray)decoratedRows;
- (NSString)rowLayout;
- (SASTTemplateAction)action;
- (SAUIDecoratedText)title;
- (SAUINanoImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setDecoratedRows:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setRowLayout:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SASTColumnDataListItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ColumnDataListItem";
}

+ (id)columnDataListItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (NSArray)decoratedRows
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"decoratedRows", v3);
}

- (void)setDecoratedRows:(id)a3
{
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

- (NSString)rowLayout
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rowLayout"];
}

- (void)setRowLayout:(id)a3
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