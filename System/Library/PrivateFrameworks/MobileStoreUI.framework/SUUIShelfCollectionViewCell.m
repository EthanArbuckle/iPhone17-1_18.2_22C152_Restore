@interface SUUIShelfCollectionViewCell
+ (double)maximumPerspectiveHeightForSize:(CGSize)a3;
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (UICollectionView)collectionView;
- (UIEdgeInsets)contentInset;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setRendersWithParallax:(BOOL)a3;
- (void)setRendersWithPerspective:(BOOL)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)updateForChangedDistanceFromVanishingPoint;
@end

@implementation SUUIShelfCollectionViewCell

- (void)setCollectionView:(id)a3
{
  v5 = (UICollectionView *)a3;
  p_collectionView = &self->_collectionView;
  collectionView = self->_collectionView;
  v11 = v5;
  if (collectionView != v5)
  {
    if ([(UICollectionView *)collectionView isDescendantOfView:self]) {
      [(UICollectionView *)*p_collectionView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_collectionView, a3);
    [(UICollectionView *)*p_collectionView setSemanticContentAttribute:[(SUUIShelfCollectionViewCell *)self semanticContentAttribute]];
    [(SUUIShelfCollectionViewCell *)self setNeedsLayout];
    v5 = *p_collectionView;
  }
  if (v5 && ([(UICollectionView *)v5 isDescendantOfView:self] & 1) == 0)
  {
    v8 = [(SUUIShelfCollectionViewCell *)self contentView];
    v9 = *p_collectionView;
    v10 = [(SUUIShelfCollectionViewCell *)self backgroundColor];
    [(UICollectionView *)v9 setBackgroundColor:v10];

    [v8 addSubview:*p_collectionView];
    [(SUUIShelfCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIShelfCollectionViewCell;
  -[SUUIShelfCollectionViewCell setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(UICollectionView *)self->_collectionView setSemanticContentAttribute:a3];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIShelfCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  if (self->_rendersWithPerspective != a3)
  {
    self->_rendersWithPerspective = a3;
    [(SUUIShelfCollectionViewCell *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)setRendersWithParallax:(BOOL)a3
{
  if (self->_rendersWithParallax != a3)
  {
    self->_rendersWithParallax = a3;
    [(SUUIShelfCollectionViewCell *)self updateForChangedDistanceFromVanishingPoint];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 backgroundColor];
  [(SUUIShelfCollectionViewCell *)self setBackgroundColor:v5];

  v6.receiver = self;
  v6.super_class = (Class)SUUIShelfCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 applyLayoutAttributes:v4];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SUUIShelfCollectionViewCell;
  [(SUUICollectionViewCell *)&v23 layoutSubviews];
  v3 = [(SUUIShelfCollectionViewCell *)self contentView];
  [v3 bounds];
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v7 = v6 + left;
  double v9 = v8 + top;
  double v11 = v10 - (left + self->_contentInset.right);
  double v13 = v12 - (top + self->_contentInset.bottom);

  [(UICollectionView *)self->_collectionView frame];
  v25.origin.x = v14;
  v25.origin.y = v15;
  double v17 = v16;
  v25.size.height = v18;
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  v25.size.width = v17;
  if (!CGRectEqualToRect(v24, v25))
  {
    [(UICollectionView *)self->_collectionView contentOffset];
    double v20 = v19;
    double v22 = v21;
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v7, v9, v11, v13);
    if (v11 == v17) {
      -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", v20, v22);
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  [(UICollectionView *)collectionView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIShelfCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  if (self->_rendersWithParallax) {
    SUUICollectionViewUpdatePerspectiveCells(self->_collectionView, 0);
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void).cxx_destruct
{
}

@end