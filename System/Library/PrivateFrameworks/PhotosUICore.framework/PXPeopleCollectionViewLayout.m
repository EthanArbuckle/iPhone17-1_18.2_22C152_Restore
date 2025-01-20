@interface PXPeopleCollectionViewLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (unint64_t)firstVisibleCellIndex;
- (void)setFirstVisibleCellIndex:(unint64_t)a3;
@end

@implementation PXPeopleCollectionViewLayout

- (void)setFirstVisibleCellIndex:(unint64_t)a3
{
  self->_firstVisibleCellIndex = a3;
}

- (unint64_t)firstVisibleCellIndex
{
  return self->_firstVisibleCellIndex;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  double v5 = (double)[(PXPeopleCollectionViewLayout *)self firstVisibleCellIndex];
  if (v5 == 1.84467441e19)
  {
    v6 = [(PXPeopleCollectionViewLayout *)self collectionView];
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(UICollectionViewFlowLayout *)self collectionViewContentSize];
    double v16 = v15;
    v24.origin.x = v8;
    v24.origin.CGFloat y = v10;
    v24.size.width = v12;
    v24.size.height = v14;
    double v17 = v16 - CGRectGetWidth(v24);
  }
  else
  {
    [(UICollectionViewFlowLayout *)self itemSize];
    double v19 = v18;
    [(UICollectionViewFlowLayout *)self minimumLineSpacing];
    double v17 = (v20 + v19) * v5;
  }
  double v21 = v17;
  double v22 = y;
  result.CGFloat y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  [(UICollectionViewFlowLayout *)self minimumLineSpacing];
  double v7 = v6;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v9 = v7 + v8;
  if (x - (double)(unint64_t)(x / (v7 + v8)) * (v7 + v8) <= v8 * 0.5) {
    unint64_t v10 = (unint64_t)(x / (v7 + v8));
  }
  else {
    unint64_t v10 = (unint64_t)(x / (v7 + v8)) + 1;
  }
  double v11 = [(PXPeopleCollectionViewLayout *)self collectionView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [v11 contentSize];
  double v21 = v20;
  v30.origin.double x = v13;
  v30.origin.CGFloat y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  CGFloat Width = CGRectGetWidth(v30);
  v31.origin.double x = v13;
  v31.origin.CGFloat y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  v32.size.height = CGRectGetHeight(v31);
  v32.origin.CGFloat y = 0.0;
  v32.origin.double x = x;
  v32.size.width = Width;
  double v23 = CGRectGetMaxX(v32) - v21;
  if (v23 < 0.0) {
    double v23 = -v23;
  }
  if (v23 >= v27)
  {
    double v24 = v9 * (double)v10;
  }
  else
  {
    v33.origin.double x = v13;
    v33.origin.CGFloat y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    double v24 = v21 - CGRectGetWidth(v33);
    unint64_t v10 = -1;
  }
  [(PXPeopleCollectionViewLayout *)self setFirstVisibleCellIndex:v10];

  double v25 = v24;
  double v26 = y;
  result.CGFloat y = v26;
  result.double x = v25;
  return result;
}

@end