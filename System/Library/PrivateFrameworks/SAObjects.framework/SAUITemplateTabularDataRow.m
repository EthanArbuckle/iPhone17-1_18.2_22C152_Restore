@interface SAUITemplateTabularDataRow
+ (id)tabularDataRow;
- (NSArray)actions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActions:(id)a3;
@end

@implementation SAUITemplateTabularDataRow

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataRow";
}

+ (id)tabularDataRow
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)actions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"actions", v3);
}

- (void)setActions:(id)a3
{
}

@end