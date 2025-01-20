@interface SASTPropertyListItem
+ (id)propertyListItem;
- (NSArray)decoratedValues;
- (NSArray)values;
- (NSString)alignment;
- (NSString)title;
- (SAUIDecoratedText)decoratedTitle;
- (SAUINanoImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setDecoratedTitle:(id)a3;
- (void)setDecoratedValues:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation SASTPropertyListItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"PropertyListItem";
}

+ (id)propertyListItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (SAUIDecoratedText)decoratedTitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedTitle");
}

- (void)setDecoratedTitle:(id)a3
{
}

- (NSArray)decoratedValues
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"decoratedValues", v3);
}

- (void)setDecoratedValues:(id)a3
{
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSArray)values
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"values"];
}

- (void)setValues:(id)a3
{
}

@end