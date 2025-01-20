@interface _UIKeyShortcutHUDSearchButton
- (BOOL)isSearching;
- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3;
- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3;
- (UICollectionView)collectionView;
- (UICollectionViewCellRegistration)searchCellRegistration;
- (UICollectionViewDiffableDataSource)dataSource;
- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager;
- (_UIKeyShortcutHUDIndexPath)searchButtonIndexPath;
- (_UIKeyShortcutHUDSearchButton)initWithFrame:(CGRect)a3;
- (_UIKeyShortcutHUDSearchButtonDelegate)delegate;
- (_UIKeyShortcutHUDToolbarViewController)toolbarVC;
- (id)_collectionViewLayout;
- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3;
- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3;
- (void)_configureCollectionView;
- (void)_setupSubviews;
- (void)performActionForSelectingCellAtIndexPath:(id)a3;
- (void)setCollectionViewManager:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchCellRegistration:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setToolbarVC:(id)a3;
@end

@implementation _UIKeyShortcutHUDSearchButton

- (_UIKeyShortcutHUDSearchButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDSearchButton;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_UIKeyShortcutHUDSearchButton *)v3 _setupSubviews];
    [(_UIKeyShortcutHUDSearchButton *)v4 _configureCollectionView];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = [UICollectionView alloc];
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_UIKeyShortcutHUDSearchButton *)self _collectionViewLayout];
  v13 = -[UICollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v12, v5, v7, v9, v11);
  collectionView = self->_collectionView;
  self->_collectionView = v13;

  [(UIView *)self->_collectionView setAutoresizingMask:18];
  v15 = self->_collectionView;
  [(UIView *)self addSubview:v15];
}

- (void)_configureCollectionView
{
  objc_initWeak(&location, self);
  v3 = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke;
  v13[3] = &unk_1E530B288;
  objc_copyWeak(&v14, &location);
  double v4 = +[UICollectionViewCellRegistration registrationWithCellClass:v3 configurationHandler:v13];

  double v5 = [UICollectionViewDiffableDataSource alloc];
  collectionView = self->_collectionView;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_3;
  v11[3] = &unk_1E52EEF90;
  id v7 = v4;
  id v12 = v7;
  double v8 = [(UICollectionViewDiffableDataSource *)v5 initWithCollectionView:collectionView cellProvider:v11];
  dataSource = self->_dataSource;
  self->_dataSource = v8;

  objc_storeStrong((id *)&self->_searchCellRegistration, v4);
  double v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  [v10 appendSectionsWithIdentifiers:&unk_1ED3F14C8];
  [v10 appendItemsWithIdentifiers:&unk_1ED3F14E0];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v10 animatingDifferences:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)_collectionViewLayout
{
  v2 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  v3 = [off_1E52D2B08 fractionalHeightDimension:1.0];
  double v4 = [off_1E52D2B30 sizeWithWidthDimension:v2 heightDimension:v3];

  double v5 = [off_1E52D2B20 itemWithLayoutSize:v4];
  double v6 = [off_1E52D2B08 fractionalWidthDimension:1.0];
  id v7 = [off_1E52D2B08 fractionalHeightDimension:1.0];
  double v8 = [off_1E52D2B30 sizeWithWidthDimension:v6 heightDimension:v7];

  double v9 = [off_1E52D2B18 horizontalGroupWithLayoutSize:v8 subitem:v5 count:1];
  double v10 = +[UIKeyShortcutHUDMetrics currentMetrics];
  [v10 toolbarContentInset];
  double v12 = v11;

  objc_msgSend(v9, "setContentInsets:", v12, v12, v12, 0.0);
  v13 = [off_1E52D2B28 sectionWithGroup:v9];
  id v14 = [[UICollectionViewCompositionalLayout alloc] initWithSection:v13];

  return v14;
}

- (void)performActionForSelectingCellAtIndexPath:(id)a3
{
  id v4 = [(_UIKeyShortcutHUDSearchButton *)self delegate];
  [v4 searchButtonDidPress:self];
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)shouldPersistSelectionForCellAtIndexPath:(id)a3
{
  return 0;
}

- (id)indexPathsForCellsUsingSeparatorAtIndexPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
}

- (id)indexPathsForSeparatorsUsedByCellAtIndexPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
}

- (_UIKeyShortcutHUDIndexPath)searchButtonIndexPath
{
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v4 = +[_UIKeyShortcutHUDIndexPath hudIndexPathWithClient:self indexPath:v3];

  return (_UIKeyShortcutHUDIndexPath *)v4;
}

- (void)setSearching:(BOOL)a3
{
  if (self->_searching != a3)
  {
    BOOL v3 = a3;
    self->_searching = a3;
    collectionView = self->_collectionView;
    double v5 = [(_UIKeyShortcutHUDSearchButton *)self searchButtonIndexPath];
    double v6 = [v5 indexPath];
    id v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v6];

    id v7 = +[UIKeyShortcutHUDMetrics currentMetrics];
    double v8 = v7;
    if (v3) {
      [v7 searchHUDTextColor];
    }
    else {
    double v9 = [v7 standardHUDTextColor];
    }
    [v10 setSearchIconColor:v9];
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewManager);
  return (_UIKeyShortcutHUDCollectionViewManager *)WeakRetained;
}

- (void)setCollectionViewManager:(id)a3
{
}

- (_UIKeyShortcutHUDSearchButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDSearchButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIKeyShortcutHUDToolbarViewController)toolbarVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbarVC);
  return (_UIKeyShortcutHUDToolbarViewController *)WeakRetained;
}

- (void)setToolbarVC:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (UICollectionViewCellRegistration)searchCellRegistration
{
  return self->_searchCellRegistration;
}

- (void)setSearchCellRegistration:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_searchCellRegistration, 0);
  objc_destroyWeak((id *)&self->_toolbarVC);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionViewManager);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end