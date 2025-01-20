@interface _UICollectionViewSourcePrivateLocalObject
- (NSIndexPath)indexPath;
- (UICollectionView)collectionView;
- (_UICollectionViewSourcePrivateLocalObject)initWithIndexPath:(id)a3 collectionView:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setIndexPath:(id)a3;
@end

@implementation _UICollectionViewSourcePrivateLocalObject

- (_UICollectionViewSourcePrivateLocalObject)initWithIndexPath:(id)a3 collectionView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewSourcePrivateLocalObject;
  v9 = [(_UICollectionViewSourcePrivateLocalObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexPath, a3);
    objc_storeWeak((id *)&v10->_collectionView, v8);
  }

  return v10;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end