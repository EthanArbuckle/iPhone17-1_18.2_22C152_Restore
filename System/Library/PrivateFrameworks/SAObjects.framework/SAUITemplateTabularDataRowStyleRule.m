@interface SAUITemplateTabularDataRowStyleRule
+ (id)tabularDataRowStyleRule;
- (NSNumber)minimumHeight;
- (NSNumber)rowCount;
- (NSNumber)rowStartIndex;
- (NSNumber)showTopBorder;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMinimumHeight:(id)a3;
- (void)setRowCount:(id)a3;
- (void)setRowStartIndex:(id)a3;
- (void)setShowTopBorder:(id)a3;
@end

@implementation SAUITemplateTabularDataRowStyleRule

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataRowStyleRule";
}

+ (id)tabularDataRowStyleRule
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)minimumHeight
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"minimumHeight"];
}

- (void)setMinimumHeight:(id)a3
{
}

- (NSNumber)rowCount
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"rowCount"];
}

- (void)setRowCount:(id)a3
{
}

- (NSNumber)rowStartIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"rowStartIndex"];
}

- (void)setRowStartIndex:(id)a3
{
}

- (NSNumber)showTopBorder
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"showTopBorder"];
}

- (void)setShowTopBorder:(id)a3
{
}

@end