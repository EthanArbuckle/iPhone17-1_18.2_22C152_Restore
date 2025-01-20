@interface VUIDebugContainerView
- (UICollectionView)collectionView;
- (void)layoutSubviews;
- (void)setCollectionView:(id)a3;
@end

@implementation VUIDebugContainerView

- (void)setCollectionView:(id)a3
{
  v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  v7 = v5;
  if (collectionView != v5)
  {
    [(UICollectionView *)collectionView removeFromSuperview];
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView) {
      -[VUIDebugContainerView addSubview:](self, "addSubview:");
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDebugContainerView;
  [(VUIDebugContainerView *)&v3 layoutSubviews];
  [(VUIDebugContainerView *)self bounds];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
}

@end