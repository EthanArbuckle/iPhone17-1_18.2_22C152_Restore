@interface UICollectionViewFocusUpdateContext
+ (id)_contextWithContext:(id)a3 collectionView:(id)a4;
+ (id)_contextWithContext:(id)a3 collectionView:(id)a4 cachedPreviouslyFocusedIndexPath:(id)a5;
- (NSIndexPath)nextFocusedIndexPath;
- (NSIndexPath)previouslyFocusedIndexPath;
- (UICollectionView)collectionView;
- (id)_initWithContext:(id)a3 collectionView:(id)a4 cachedPreviouslyFocusedIndexPath:(id)a5;
@end

@implementation UICollectionViewFocusUpdateContext

+ (id)_contextWithContext:(id)a3 collectionView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithContext:v7 collectionView:v6 cachedPreviouslyFocusedIndexPath:0];

  return v8;
}

+ (id)_contextWithContext:(id)a3 collectionView:(id)a4 cachedPreviouslyFocusedIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithContext:v10 collectionView:v9 cachedPreviouslyFocusedIndexPath:v8];

  return v11;
}

- (id)_initWithContext:(id)a3 collectionView:(id)a4 cachedPreviouslyFocusedIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewFocusUpdateContext;
  id v10 = [(UIFocusUpdateContext *)&v15 _initWithContext:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(v10 + 23, v8);
    uint64_t v12 = [v9 copy];
    id v13 = v11[21];
    v11[21] = (id)v12;

    *((unsigned char *)v11 + 160) = v9 != 0;
  }

  return v11;
}

- (NSIndexPath)previouslyFocusedIndexPath
{
  if (!self->_didSetPreviouslyFocusedIndexPath)
  {
    v3 = [(UIFocusUpdateContext *)self previouslyFocusedView];
    if (v3)
    {
      v4 = [(UICollectionViewFocusUpdateContext *)self collectionView];
      v5 = _UICollectionViewCellForView(v4, v3);
      if (v5)
      {
        id v6 = [v4 indexPathForCell:v5];
      }
      else
      {
        id v6 = 0;
      }
      objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, v6);
      if (v5) {
    }
      }
    self->_didSetPreviouslyFocusedIndexPath = 1;
  }
  previouslyFocusedIndexPath = self->_previouslyFocusedIndexPath;
  return previouslyFocusedIndexPath;
}

- (NSIndexPath)nextFocusedIndexPath
{
  if (!self->_didSetNextFocusedIndexPath)
  {
    v3 = [(UIFocusUpdateContext *)self nextFocusedView];
    if (v3)
    {
      v4 = [(UICollectionViewFocusUpdateContext *)self collectionView];
      v5 = _UICollectionViewCellForView(v4, v3);
      if (v5)
      {
        id v6 = [v4 indexPathForCell:v5];
      }
      else
      {
        id v6 = 0;
      }
      objc_storeStrong((id *)&self->_nextFocusedIndexPath, v6);
      if (v5) {
    }
      }
    self->_didSetNextFocusedIndexPath = 1;
  }
  nextFocusedIndexPath = self->_nextFocusedIndexPath;
  return nextFocusedIndexPath;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_nextFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, 0);
}

@end