@interface SAUITemplateTabularData
+ (id)tabularData;
- (BOOL)allowContentScrolling;
- (BOOL)showHeaderDivider;
- (NSArray)columns;
- (NSArray)rowStyleRules;
- (NSNumber)minimumRowHeight;
- (NSString)layoutStyle;
- (SAUITemplateItem)footerItem;
- (SAUITemplateItem)headerItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAllowContentScrolling:(BOOL)a3;
- (void)setColumns:(id)a3;
- (void)setFooterItem:(id)a3;
- (void)setHeaderItem:(id)a3;
- (void)setLayoutStyle:(id)a3;
- (void)setMinimumRowHeight:(id)a3;
- (void)setRowStyleRules:(id)a3;
- (void)setShowHeaderDivider:(BOOL)a3;
@end

@implementation SAUITemplateTabularData

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularData";
}

+ (id)tabularData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)allowContentScrolling
{
  return AceObjectBoolForProperty(self, @"allowContentScrolling");
}

- (void)setAllowContentScrolling:(BOOL)a3
{
}

- (NSArray)columns
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"columns", v3);
}

- (void)setColumns:(id)a3
{
}

- (SAUITemplateItem)footerItem
{
  return (SAUITemplateItem *)AceObjectAceObjectForProperty(self, @"footerItem");
}

- (void)setFooterItem:(id)a3
{
}

- (SAUITemplateItem)headerItem
{
  return (SAUITemplateItem *)AceObjectAceObjectForProperty(self, @"headerItem");
}

- (void)setHeaderItem:(id)a3
{
}

- (NSString)layoutStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"layoutStyle"];
}

- (void)setLayoutStyle:(id)a3
{
}

- (NSNumber)minimumRowHeight
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"minimumRowHeight"];
}

- (void)setMinimumRowHeight:(id)a3
{
}

- (NSArray)rowStyleRules
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"rowStyleRules", v3);
}

- (void)setRowStyleRules:(id)a3
{
}

- (BOOL)showHeaderDivider
{
  return AceObjectBoolForProperty(self, @"showHeaderDivider");
}

- (void)setShowHeaderDivider:(BOOL)a3
{
}

@end