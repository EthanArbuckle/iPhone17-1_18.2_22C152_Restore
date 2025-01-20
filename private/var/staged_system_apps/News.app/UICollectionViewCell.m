@interface UICollectionViewCell
- (BOOL)fr_isSwipeable;
- (id)fr_parentCollectionView;
@end

@implementation UICollectionViewCell

- (BOOL)fr_isSwipeable
{
  return 0;
}

- (id)fr_parentCollectionView
{
  objc_opt_class();
  v3 = [(UICollectionViewCell *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  v4 = FCDynamicCast();

  return v4;
}

@end