@interface _InvertibleFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
@end

@implementation _InvertibleFlowLayout

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_InvertibleFlowLayout;
  v3 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setInvalidateFlowLayoutDelegateMetrics:1];
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

@end