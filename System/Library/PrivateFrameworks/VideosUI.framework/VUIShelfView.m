@interface VUIShelfView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UICollectionView)collectionView;
- (UIView)headerView;
- (void)layoutSubviews;
- (void)setCollectionView:(id)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation VUIShelfView

- (void)setHeaderView:(id)a3
{
  v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    if (headerView) {
      [(UIView *)headerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView) {
      -[VUIShelfView addSubview:](self, "addSubview:");
    }
    [(VUIShelfView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)VUIShelfView;
  [(VUIShelfView *)&v21 layoutSubviews];
  v3 = (void *)MEMORY[0x1E4FB1F48];
  [(VUIShelfView *)self bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v22));
  headerView = self->_headerView;
  if (headerView)
  {
    double v7 = v4;
    double v8 = v5;
    [(VUIShelfView *)self bounds];
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", v9 - (v7 + v8), 1.79769313e308);
    double v11 = v10;
    double v13 = v12;
    v14 = [(VUIShelfView *)self headerView];
    objc_msgSend(v14, "setFrame:", v7, 0.0, v11, v13);

    v15 = [(VUIShelfView *)self collectionView];
    v16 = [(VUIShelfView *)self headerView];
    [v16 frame];
    double MaxY = CGRectGetMaxY(v23);
    [(VUIShelfView *)self bounds];
    double v19 = v18;
    [(VUIShelfView *)self bounds];
    objc_msgSend(v15, "setFrame:", 0.0, MaxY, v19, v20 - v13);
  }
  else
  {
    v15 = [(VUIShelfView *)self collectionView];
    [(VUIShelfView *)self bounds];
    objc_msgSend(v15, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = (void *)MEMORY[0x1E4FB1F48];
  [(VUIShelfView *)self bounds];
  objc_msgSend(v5, "vui_paddingForWindowWidth:", CGRectGetWidth(v18));
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", width - (v6 + v7), 1.79769313e308);
    double v10 = v9 + 0.0;
  }
  else
  {
    double v10 = 0.0;
  }
  double v11 = [(VUIShelfView *)self collectionView];
  double v12 = [v11 collectionViewLayout];

  [v12 computedContentHeight];
  double v14 = v10 + v13;

  double v15 = width;
  double v16 = v14;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end