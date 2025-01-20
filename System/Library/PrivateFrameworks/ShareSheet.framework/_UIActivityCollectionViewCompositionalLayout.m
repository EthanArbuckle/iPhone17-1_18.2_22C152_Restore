@interface _UIActivityCollectionViewCompositionalLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
@end

@implementation _UIActivityCollectionViewCompositionalLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = [(_UIActivityCollectionViewCompositionalLayout *)self collectionView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v18.origin.CGFloat x = v9;
  v18.origin.CGFloat y = v11;
  v18.size.CGFloat width = v13;
  v18.size.CGFloat height = v15;
  double v16 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  return vabdd_f64(v16, CGRectGetWidth(v19)) >= 0.00000011920929;
}

@end