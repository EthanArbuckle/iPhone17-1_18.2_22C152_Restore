@interface _UICollectionViewListCellVisualProvider
- (BOOL)canFocusProgrammatically;
- (UIView)accessoryManagerContainerView;
- (_UICollectionViewListCellVisualProvider)initWithListCell:(id)a3;
- (int64_t)defaultFocusStyle;
@end

@implementation _UICollectionViewListCellVisualProvider

- (UIView)accessoryManagerContainerView
{
  return (UIView *)self->_cell;
}

- (BOOL)canFocusProgrammatically
{
  return 0;
}

- (int64_t)defaultFocusStyle
{
  return 0;
}

- (_UICollectionViewListCellVisualProvider)initWithListCell:(id)a3
{
  v5 = (UICollectionViewListCell *)a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UICollectionViewListCellVisualProvider.m", 26, @"Invalid parameter not satisfying: %@", @"cell" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewListCellVisualProvider;
  v6 = [(_UICollectionViewListCellVisualProvider *)&v10 init];
  v7 = v6;
  if (v6) {
    v6->_cell = v5;
  }

  return v7;
}

@end