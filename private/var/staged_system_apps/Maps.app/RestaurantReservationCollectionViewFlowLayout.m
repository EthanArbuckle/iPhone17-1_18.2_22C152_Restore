@interface RestaurantReservationCollectionViewFlowLayout
- (BOOL)dimUnselected;
- (NSSet)dimmableIndexPaths;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)setDimUnselected:(BOOL)a3;
- (void)setDimmableIndexPaths:(id)a3;
@end

@implementation RestaurantReservationCollectionViewFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)RestaurantReservationCollectionViewFlowLayout;
  v4 = -[RestaurantReservationCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v25, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v20 = self;
  v5 = [(RestaurantReservationCollectionViewFlowLayout *)self collectionView];
  v6 = [v5 indexPathsForSelectedItems];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v11);
        v13 = [v12 indexPath];
        if (([v6 containsObject:v13] & 1) != 0
          || [v12 representedElementCategory] == (id)1)
        {

          double v14 = 1.0;
        }
        else
        {
          v15 = [(RestaurantReservationCollectionViewFlowLayout *)v20 dimmableIndexPaths];
          v16 = [v12 indexPath];
          unsigned int v17 = [v15 containsObject:v16];

          double v14 = 1.0;
          if (v17)
          {
            if ([(RestaurantReservationCollectionViewFlowLayout *)v20 dimUnselected]) {
              double v14 = 0.200000003;
            }
            else {
              double v14 = 1.0;
            }
          }
        }
        [v12 setAlpha:v14];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v18 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      id v9 = v18;
    }
    while (v18);
  }

  return v7;
}

- (BOOL)dimUnselected
{
  return self->_dimUnselected;
}

- (void)setDimUnselected:(BOOL)a3
{
  self->_dimUnselected = a3;
}

- (NSSet)dimmableIndexPaths
{
  return self->_dimmableIndexPaths;
}

- (void)setDimmableIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end