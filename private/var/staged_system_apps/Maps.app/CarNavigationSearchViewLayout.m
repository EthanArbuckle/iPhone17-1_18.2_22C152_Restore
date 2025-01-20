@interface CarNavigationSearchViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (CarNavigationSearchViewLayout)init;
- (double)preferredHeightForItemCount:(unint64_t)a3 availableSize:(CGSize)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)getNumberOfRows:(unint64_t *)a3 itemSize:(CGSize *)a4 forItemCount:(unint64_t)a5 availableSize:(CGSize)a6;
- (void)prepareLayout;
@end

@implementation CarNavigationSearchViewLayout

- (CarNavigationSearchViewLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)CarNavigationSearchViewLayout;
  v2 = [(CarNavigationSearchViewLayout *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
    layoutAttributes = v2->_layoutAttributes;
    v2->_layoutAttributes = (NSMapTable *)v3;
  }
  return v2;
}

- (CGSize)collectionViewContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v5 = [(CarNavigationSearchViewLayout *)self collectionView];
  [v5 bounds];
  BOOL v8 = height != v7 || width != v6;

  return v8;
}

- (void)prepareLayout
{
  v24.receiver = self;
  v24.super_class = (Class)CarNavigationSearchViewLayout;
  [(CarNavigationSearchViewLayout *)&v24 prepareLayout];
  [(NSMapTable *)self->_layoutAttributes removeAllObjects];
  uint64_t v3 = [(CarNavigationSearchViewLayout *)self collectionView];
  id v4 = [v3 numberOfItemsInSection:0];

  unint64_t v23 = 0;
  v5 = [(CarNavigationSearchViewLayout *)self collectionView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double v21 = 0.0;
  double v22 = 0.0;
  -[CarNavigationSearchViewLayout getNumberOfRows:itemSize:forItemCount:availableSize:](self, "getNumberOfRows:itemSize:forItemCount:availableSize:", &v23, &v21, v4, v7, v9);
  -[CarNavigationSearchViewLayout preferredHeightForItemCount:availableSize:](self, "preferredHeightForItemCount:availableSize:", v4, v7, v9);
  self->_contentSize.double width = v7;
  self->_contentSize.double height = v10;
  if (v23 && v4)
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    double v13 = v21;
    double v14 = v22;
    double v15 = v10 * -0.5 + v9 * 0.5;
    do
    {
      char v16 = 1;
      double v17 = 0.0;
      do
      {
        v18 = +[NSIndexPath indexPathForItem:v11 inSection:0];
        v19 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v18];
        [v19 setFrame:v17, v15, v13, v14];
        [(NSMapTable *)self->_layoutAttributes setObject:v19 forKey:v18];
        double v20 = v21;
        ++v11;

        if ((v16 & 1) == 0) {
          break;
        }
        char v16 = 0;
        double v17 = v17 + v20 + 8.0;
      }
      while (v11 < (unint64_t)v4);
      if (++v12 >= v23) {
        break;
      }
      double v15 = v15 + v22 + 8.0;
    }
    while (v11 < (unint64_t)v4);
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return [(NSMapTable *)self->_layoutAttributes objectForKey:a3];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = +[NSMutableArray arrayWithCapacity:[(NSMapTable *)self->_layoutAttributes count]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v9 = [(NSMapTable *)self->_layoutAttributes objectEnumerator];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v14 frame];
        v28.origin.CGFloat x = v15;
        v28.origin.CGFloat y = v16;
        v28.size.CGFloat width = v17;
        v28.size.CGFloat height = v18;
        v27.origin.CGFloat x = x;
        v27.origin.CGFloat y = y;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        if (CGRectIntersectsRect(v27, v28)) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v19 = [v8 copy];

  return v19;
}

- (double)preferredHeightForItemCount:(unint64_t)a3 availableSize:(CGSize)a4
{
  uint64_t v6 = 0;
  double v7 = 0.0;
  unint64_t v5 = 0;
  -[CarNavigationSearchViewLayout getNumberOfRows:itemSize:forItemCount:availableSize:](self, "getNumberOfRows:itemSize:forItemCount:availableSize:", &v5, &v6, a3, a4.width, a4.height);
  return (double)(v5 - 1) * 8.0 + (double)v5 * v7;
}

- (void)getNumberOfRows:(unint64_t *)a3 itemSize:(CGSize *)a4 forItemCount:(unint64_t)a5 availableSize:(CGSize)a6
{
  double v6 = (double)a5 * 0.5;
  unint64_t v7 = vcvtpd_u64_f64(v6);
  double v8 = floor(a6.width + -8.0) * 0.5;
  double v9 = (a6.height + (double)(v7 - 1) * -8.0) / (double)(unint64_t)ceil(v6);
  if (v8 < v9) {
    double v9 = v8;
  }
  if (a3) {
    *a3 = v7;
  }
  if (a4)
  {
    a4->CGFloat width = v8;
    a4->CGFloat height = v9;
  }
}

- (void).cxx_destruct
{
}

@end