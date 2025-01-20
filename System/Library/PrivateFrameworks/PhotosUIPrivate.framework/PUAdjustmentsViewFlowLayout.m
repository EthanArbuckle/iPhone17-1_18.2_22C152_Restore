@interface PUAdjustmentsViewFlowLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (id)nearestIndexPathForVisibleItemAtPoint:(CGPoint)a3;
@end

@implementation PUAdjustmentsViewFlowLayout

- (id)nearestIndexPathForVisibleItemAtPoint:(CGPoint)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = [(PUAdjustmentsViewFlowLayout *)self collectionView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v6, v8, v10, v12);
  v14 = [v13 firstObject];
  v15 = [v14 indexPath];
  int64_t v16 = [(UICollectionViewFlowLayout *)self scrollDirection];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    double v21 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v23, "frame", (void)v34);
        if (v16 == 1)
        {
          double MidX = CGRectGetMidX(*(CGRect *)&v24);
          v40.origin.x = v6;
          v40.origin.y = v8;
          v40.size.width = v10;
          v40.size.height = v12;
          double MidY = CGRectGetMidX(v40);
        }
        else
        {
          double MidX = CGRectGetMidY(*(CGRect *)&v24);
          v41.origin.x = v6;
          v41.origin.y = v8;
          v41.size.width = v10;
          v41.size.height = v12;
          double MidY = CGRectGetMidY(v41);
        }
        double v30 = fabs(MidX - MidY);
        if (v30 < v21)
        {
          uint64_t v31 = [v23 indexPath];

          double v21 = v30;
          v15 = (void *)v31;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v19);
  }

  id v32 = v15;
  return v32;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v6 = [(PUAdjustmentsViewFlowLayout *)self collectionView];
  [v6 frame];
  double v8 = v7;
  double v9 = [(PUAdjustmentsViewFlowLayout *)self collectionView];
  [v9 frame];
  double v11 = v10;

  double v12 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, v8, v11);
  int64_t v13 = [(UICollectionViewFlowLayout *)self scrollDirection];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = 0;
    uint64_t v18 = *(void *)v42;
    double v19 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v14);
        }
        double v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "frame", (void)v41);
        if (v13 == 1)
        {
          double MidX = CGRectGetMidX(*(CGRect *)&v22);
          v48.origin.double x = x;
          v48.origin.double y = y;
          v48.size.width = v8;
          v48.size.height = v11;
          double MidY = CGRectGetMidX(v48);
        }
        else
        {
          double MidX = CGRectGetMidY(*(CGRect *)&v22);
          v49.origin.double x = x;
          v49.origin.double y = y;
          v49.size.width = v8;
          v49.size.height = v11;
          double MidY = CGRectGetMidY(v49);
        }
        double v28 = fabs(MidX - MidY);
        if (v28 < v19)
        {
          id v29 = v21;

          double v19 = v28;
          id v17 = v29;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v16);
  }
  else
  {
    id v17 = 0;
  }

  [v17 frame];
  double v31 = v30;
  double v33 = v32;
  long long v34 = [(PUAdjustmentsViewFlowLayout *)self collectionView];
  [v34 contentInset];
  double v36 = v35;
  double v38 = v37;

  if (v13 == 1) {
    double x = v31 - v38;
  }
  else {
    double y = v33 - v36;
  }

  double v39 = x;
  double v40 = y;
  result.double y = v40;
  result.double x = v39;
  return result;
}

@end