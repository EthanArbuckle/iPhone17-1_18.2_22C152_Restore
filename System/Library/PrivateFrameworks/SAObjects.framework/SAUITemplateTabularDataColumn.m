@interface SAUITemplateTabularDataColumn
+ (id)tabularDataColumn;
- (NSArray)values;
- (NSNumber)minimumWidth;
- (NSNumber)rightMargin;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMinimumWidth:(id)a3;
- (void)setRightMargin:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation SAUITemplateTabularDataColumn

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataColumn";
}

+ (id)tabularDataColumn
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)minimumWidth
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"minimumWidth"];
}

- (void)setMinimumWidth:(id)a3
{
}

- (NSNumber)rightMargin
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"rightMargin"];
}

- (void)setRightMargin:(id)a3
{
}

- (NSArray)values
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"values", v3);
}

- (void)setValues:(id)a3
{
}

@end