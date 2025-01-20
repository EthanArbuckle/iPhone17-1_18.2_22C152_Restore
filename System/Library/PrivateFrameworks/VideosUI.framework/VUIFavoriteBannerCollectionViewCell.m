@interface VUIFavoriteBannerCollectionViewCell
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIFavoriteBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (VUIFavoriteBannerLayout)bannerLayout;
- (VUIFavoriteBannerView)bannerView;
- (double)width;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBannerLayout:(id)a3;
- (void)setBannerView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation VUIFavoriteBannerCollectionViewCell

- (VUIFavoriteBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUIFavoriteBannerCollectionViewCell;
  v3 = -[VUIFocusableCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    bannerView = v3->_bannerView;
    v3->_bannerView = 0;

    bannerLayout = v4->_bannerLayout;
    v4->_bannerLayout = 0;

    [(VUIFavoriteBannerCollectionViewCell *)v4 setAutoresizingMask:1];
    [(VUIFocusableCollectionViewCell *)v4 setAllowsFocus:1];
  }
  return v4;
}

- (void)setBannerView:(id)a3
{
  v5 = (VUIFavoriteBannerView *)a3;
  p_bannerView = &self->_bannerView;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    v16 = v5;
    [(VUIFavoriteBannerView *)bannerView removeFromSuperview];
    objc_storeStrong((id *)&self->_bannerView, a3);
    [(VUIFavoriteBannerView *)*p_bannerView setContentMode:3];
    [(VUIFavoriteBannerView *)*p_bannerView setAutoresizingMask:18];
    objc_super v8 = *p_bannerView;
    v9 = [(VUIFavoriteBannerLayout *)self->_bannerLayout backgroundColor];
    [(VUIFavoriteBannerView *)v8 setBackgroundColor:v9];

    v10 = [(VUIFavoriteBannerCollectionViewCell *)self contentView];
    [v10 addSubview:*p_bannerView];

    v11 = [(VUIFavoriteBannerCollectionViewCell *)self contentView];
    v12 = [v11 layer];
    v13 = (void *)MEMORY[0x1E4FB3C70];
    [(VUIFavoriteBannerLayout *)self->_bannerLayout borderRadii];
    objc_msgSend(v13, "radiusFromCornerRadii:");
    objc_msgSend(v12, "setCornerRadius:");

    v14 = [(VUIFavoriteBannerCollectionViewCell *)self contentView];
    v15 = [v14 layer];
    [v15 setMasksToBounds:1];

    [(VUIFavoriteBannerCollectionViewCell *)self setNeedsLayout];
    v5 = v16;
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)VUIFavoriteBannerCollectionViewCell;
  [(VUIFavoriteBannerCollectionViewCell *)&v11 layoutSubviews];
  [(VUIFavoriteBannerCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[VUIFavoriteBannerView setFrame:](self->_bannerView, "setFrame:");
  -[VUIFavoriteBannerView setFrame:](self->_bannerView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)intrinsicContentSize
{
  -[VUIFavoriteBannerCollectionViewCell sizeThatFits:](self, "sizeThatFits:", self->_width, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0) {
    a3.width = self->_width;
  }
  -[VUIFavoriteBannerView sizeThatFits:](self->_bannerView, "sizeThatFits:", a3.width, 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
  [(VUIFavoriteBannerCollectionViewCell *)self invalidateIntrinsicContentSize];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    bannerView = self->_bannerView;
    [(VUIFavoriteBannerView *)bannerView setHighlighted:v3];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)VUIFavoriteBannerCollectionViewCell;
  [(VUIFocusableCollectionViewCell *)&v4 prepareForReuse];
  bannerLayout = self->_bannerLayout;
  self->_bannerLayout = 0;

  [(VUIFavoriteBannerView *)self->_bannerView prepareForCellReuse];
}

- (VUIFavoriteBannerView)bannerView
{
  return self->_bannerView;
}

- (VUIFavoriteBannerLayout)bannerLayout
{
  return self->_bannerLayout;
}

- (void)setBannerLayout:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerLayout, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end