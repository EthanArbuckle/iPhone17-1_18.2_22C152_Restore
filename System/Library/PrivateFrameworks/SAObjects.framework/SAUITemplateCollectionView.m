@interface SAUITemplateCollectionView
+ (id)collectionView;
- (NSArray)cells;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCells:(id)a3;
@end

@implementation SAUITemplateCollectionView

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"CollectionView";
}

+ (id)collectionView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)cells
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"cells", v3);
}

- (void)setCells:(id)a3
{
}

@end