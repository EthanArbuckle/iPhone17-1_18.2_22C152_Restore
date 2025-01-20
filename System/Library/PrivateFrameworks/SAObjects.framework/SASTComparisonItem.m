@interface SASTComparisonItem
+ (id)comparisonItem;
- (SASTComparisonEntity)firstItem;
- (SASTComparisonEntity)secondItem;
- (SAUIDecoratedText)footnote;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFirstItem:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setSecondItem:(id)a3;
@end

@implementation SASTComparisonItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ComparisonItem";
}

+ (id)comparisonItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTComparisonEntity)firstItem
{
  return (SASTComparisonEntity *)AceObjectAceObjectForProperty(self, @"firstItem");
}

- (void)setFirstItem:(id)a3
{
}

- (SAUIDecoratedText)footnote
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"footnote");
}

- (void)setFootnote:(id)a3
{
}

- (SASTComparisonEntity)secondItem
{
  return (SASTComparisonEntity *)AceObjectAceObjectForProperty(self, @"secondItem");
}

- (void)setSecondItem:(id)a3
{
}

@end