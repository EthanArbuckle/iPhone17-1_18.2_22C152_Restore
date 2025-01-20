@interface VideosExtrasCarouselCollectionViewFlowLayout
- (unint64_t)indexOfVisibleItem;
- (void)setIndexOfVisibleItem:(unint64_t)a3;
- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation VideosExtrasCarouselCollectionViewFlowLayout

- (void)setIndexOfVisibleItem:(unint64_t)a3
{
}

- (void)setIndexOfVisibleItem:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v16 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v6];

  [v16 frame];
  double v8 = v7;
  v9 = [(VideosExtrasCarouselCollectionViewFlowLayout *)self collectionView];
  [v9 contentOffset];
  double v11 = v10;

  v12 = [(VideosExtrasCarouselCollectionViewFlowLayout *)self collectionView];
  [v12 _effectiveContentInset];
  double v14 = v13;

  v15 = [(VideosExtrasCarouselCollectionViewFlowLayout *)self collectionView];
  objc_msgSend(v15, "setContentOffset:animated:", v4, v8 - v14, v11);
}

- (unint64_t)indexOfVisibleItem
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(VideosExtrasCarouselCollectionViewFlowLayout *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;

  v6 = [(VideosExtrasCarouselCollectionViewFlowLayout *)self collectionView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v5, 0.0, v8, v10);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = v5 + v8 * 0.5;
    uint64_t v15 = *(void *)v23;
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v18 frame];
        if (v19 <= v14)
        {
          v20 = [v18 indexPath];
          unint64_t v16 = [v20 row];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

@end