@interface SASTStockComparisonItem
+ (id)stockComparisonItem;
- (NSString)stockValueFacet;
- (SAUIDecoratedText)subtitle;
- (SAUIDecoratedText)title;
- (SAUIDecoratedText)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStockValueFacet:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASTStockComparisonItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"StockComparisonItem";
}

+ (id)stockComparisonItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)stockValueFacet
{
  return (NSString *)[(AceObject *)self propertyForKey:@"stockValueFacet"];
}

- (void)setStockValueFacet:(id)a3
{
}

- (SAUIDecoratedText)subtitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"subtitle");
}

- (void)setSubtitle:(id)a3
{
}

- (SAUIDecoratedText)title
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"title");
}

- (void)setTitle:(id)a3
{
}

- (SAUIDecoratedText)value
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"value");
}

- (void)setValue:(id)a3
{
}

@end