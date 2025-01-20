@interface SASTGridItem
+ (id)gridItem;
- (NSArray)gridCells;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGridCells:(id)a3;
@end

@implementation SASTGridItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"GridItem";
}

+ (id)gridItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)gridCells
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"gridCells", v3);
}

- (void)setGridCells:(id)a3
{
}

@end