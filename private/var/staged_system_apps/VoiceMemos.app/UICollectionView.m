@interface UICollectionView
- (id)indexPathForSelectedItem;
- (void)scrollToTop;
@end

@implementation UICollectionView

- (id)indexPathForSelectedItem
{
  v2 = [(UICollectionView *)self indexPathsForSelectedItems];
  v3 = [v2 firstObject];

  return v3;
}

- (void)scrollToTop
{
}

@end