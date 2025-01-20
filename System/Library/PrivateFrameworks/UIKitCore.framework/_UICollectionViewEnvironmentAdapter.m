@interface _UICollectionViewEnvironmentAdapter
- (CGSize)contentSize;
- (NSDirectionalEdgeInsets)contentInsets;
- (UICollectionView)_collectionView;
- (_UICollectionViewEnvironmentAdapter)initWithCollectionView:(id)a3;
- (id)createEnvironment;
- (void)setCollectionView:(id)a3;
@end

@implementation _UICollectionViewEnvironmentAdapter

- (_UICollectionViewEnvironmentAdapter)initWithCollectionView:(id)a3
{
  if (!a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UICollectionViewListLayoutSection.m", 80, @"Invalid parameter not satisfying: %@", @"collectionView" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewEnvironmentAdapter;
  v5 = [(_UICollectionViewEnvironmentAdapter *)&v10 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_collectionView, a3);
  }
  return v6;
}

- (CGSize)contentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  [WeakRetained bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  [WeakRetained contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(_UICollectionViewEnvironmentAdapter *)self _collectionView];
  v13 = [v12 traitCollection];
  uint64_t v14 = [v13 layoutDirection];

  if (v14 == 1) {
    double v15 = v11;
  }
  else {
    double v15 = v7;
  }
  if (v14 == 1) {
    double v16 = v7;
  }
  else {
    double v16 = v11;
  }
  double v17 = v5;
  double v18 = v9;
  result.trailing = v16;
  result.bottom = v18;
  result.leading = v15;
  result.top = v17;
  return result;
}

- (id)createEnvironment
{
  double v3 = [_UICollectionLayoutContainer alloc];
  [(_UICollectionViewEnvironmentAdapter *)self contentSize];
  double v5 = v4;
  double v7 = v6;
  [(_UICollectionViewEnvironmentAdapter *)self contentInsets];
  v12 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v3, v5, v7, v8, v9, v10, v11);
  v13 = [(_UICollectionViewEnvironmentAdapter *)self _collectionView];
  uint64_t v14 = [off_1E52D5400 snapshotterForDataSourceBackedView:v13];

  double v15 = [_UICollectionLayoutEnvironment alloc];
  double v16 = [(_UICollectionViewEnvironmentAdapter *)self _collectionView];
  double v17 = [v16 traitCollection];
  double v18 = [v14 snapshot];
  v19 = [(_UICollectionLayoutEnvironment *)v15 initWithContainer:v12 traitCollection:v17 dataSourceSnapshot:v18];

  return v19;
}

- (UICollectionView)_collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end