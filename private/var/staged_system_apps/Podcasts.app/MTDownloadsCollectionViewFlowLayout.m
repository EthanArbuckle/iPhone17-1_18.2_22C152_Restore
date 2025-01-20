@interface MTDownloadsCollectionViewFlowLayout
- (CGSize)collectionViewContentSize;
@end

@implementation MTDownloadsCollectionViewFlowLayout

- (CGSize)collectionViewContentSize
{
  v3 = [(MTDownloadsCollectionViewFlowLayout *)self collectionView];
  v4 = [v3 traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)2)
  {
    v14.receiver = self;
    v14.super_class = (Class)MTDownloadsCollectionViewFlowLayout;
    [(MTDownloadsCollectionViewFlowLayout *)&v14 collectionViewContentSize];
  }
  else
  {
    v8 = [(MTDownloadsCollectionViewFlowLayout *)self collectionView];
    [v8 contentInset];
    double v10 = v9;

    v11 = [(MTDownloadsCollectionViewFlowLayout *)self collectionView];
    [v11 bounds];
    double v12 = CGRectGetHeight(v16) - v10 + -20.0;

    v13.receiver = self;
    v13.super_class = (Class)MTDownloadsCollectionViewFlowLayout;
    [(MTDownloadsCollectionViewFlowLayout *)&v13 collectionViewContentSize];
    if (v12 >= v7) {
      double v7 = v12;
    }
  }
  result.height = v7;
  result.width = v6;
  return result;
}

@end