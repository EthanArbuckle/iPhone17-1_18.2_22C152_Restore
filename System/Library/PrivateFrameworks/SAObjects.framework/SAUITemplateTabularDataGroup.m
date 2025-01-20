@interface SAUITemplateTabularDataGroup
+ (id)tabularDataGroup;
- (NSArray)items;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setItems:(id)a3;
@end

@implementation SAUITemplateTabularDataGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataGroup";
}

+ (id)tabularDataGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"items", v3);
}

- (void)setItems:(id)a3
{
}

@end