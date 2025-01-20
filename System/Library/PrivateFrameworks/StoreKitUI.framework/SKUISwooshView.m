@interface SKUISwooshView
- (BOOL)showsChevronForTitle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)seeAllTitle;
- (NSString)title;
- (SKUISwooshView)initWithFrame:(CGRect)a3;
- (UICollectionView)collectionView;
- (UIColor)titleColor;
- (UIControl)chevronTitleControl;
- (UIControl)seeAllControl;
- (UIEdgeInsets)collectionViewInsets;
- (UIEdgeInsets)contentInsets;
- (id)_seeAllArrowImage;
- (id)seeAllColorForControlState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewInsets:(UIEdgeInsets)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setSeeAllColor:(id)a3 forControlState:(unint64_t)a4;
- (void)setSeeAllTitle:(id)a3;
- (void)setShowsChevronForTitle:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation SKUISwooshView

- (SKUISwooshView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISwooshView initWithFrame:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUISwooshView;
  v8 = -[SKUISwooshView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v10 = (void *)*((void *)v8 + 51);
    *((void *)v8 + 51) = v9;

    v11 = (void *)*((void *)v8 + 51);
    v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [v11 setBackgroundColor:v12];

    [v8 addSubview:*((void *)v8 + 51)];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)(v8 + 424) = *MEMORY[0x1E4FB2848];
    *(_OWORD *)(v8 + 440) = v13;
    *((_OWORD *)v8 + 31) = xmmword_1C1CCBC10;
    *((_OWORD *)v8 + 32) = xmmword_1C1CCBC20;
    uint64_t v14 = [MEMORY[0x1E4FB1618] blackColor];
    v15 = (void *)*((void *)v8 + 60);
    *((void *)v8 + 60) = v14;
  }
  return (SKUISwooshView *)v8;
}

- (UIControl)chevronTitleControl
{
  titleButton = self->_titleButton;
  if (!titleButton)
  {
    v4 = [[SKUILinkButton alloc] initWithArrowStyle:4];
    v5 = self->_titleButton;
    self->_titleButton = v4;

    v6 = self->_titleButton;
    v7 = [(SKUISwooshView *)self backgroundColor];
    [(SKUILinkButton *)v6 setBackgroundColor:v7];

    [(SKUILinkButton *)self->_titleButton setTitleColor:self->_titleColor forState:0];
    v8 = [(SKUILinkButton *)self->_titleButton titleLabel];
    id v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [v8 setFont:v9];

    [(SKUILinkButton *)self->_titleButton setHidden:1];
    titleButton = self->_titleButton;
  }

  return (UIControl *)titleButton;
}

- (id)seeAllColorForControlState:(unint64_t)a3
{
  v4 = [(SKUISwooshView *)self seeAllControl];
  v5 = [v4 titleColorForState:a3];

  return v5;
}

- (UIControl)seeAllControl
{
  seeAllButton = self->_seeAllButton;
  if (!seeAllButton)
  {
    v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    v5 = self->_seeAllButton;
    self->_seeAllButton = v4;

    v6 = self->_seeAllButton;
    v7 = [(SKUISwooshView *)self backgroundColor];
    [(UIButton *)v6 setBackgroundColor:v7];

    v8 = self->_seeAllButton;
    id v9 = [(SKUISwooshView *)self _seeAllArrowImage];
    [v9 size];
    -[UIButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, -(v10 + 5.0), 0.0, 0.0);

    v11 = [(UIButton *)self->_seeAllButton titleLabel];
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [v11 setFont:v12];

    long long v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    [(SKUISwooshView *)self setSeeAllColor:v13 forControlState:0];

    uint64_t v14 = [MEMORY[0x1E4FB1618] blackColor];
    [(SKUISwooshView *)self setSeeAllColor:v14 forControlState:1];

    seeAllButton = self->_seeAllButton;
  }

  return (UIControl *)seeAllButton;
}

- (NSString)seeAllTitle
{
  return [(UIButton *)self->_seeAllButton titleForState:0];
}

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
      -[SKUISwooshView addSubview:](self, "addSubview:");
    }
  }
}

- (void)setCollectionViewInsets:(UIEdgeInsets)a3
{
  if (self->_collectionViewInsets.left != a3.left
    || self->_collectionViewInsets.top != a3.top
    || self->_collectionViewInsets.right != a3.right
    || self->_collectionViewInsets.bottom != a3.bottom)
  {
    self->_collectionViewInsets = a3;
    [(SKUISwooshView *)self setNeedsLayout];
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v14 = a3;
  v4 = [v14 backgroundColor];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v7 = v6;

  [(SKUISwooshView *)self setBackgroundColor:v7];
  v8 = [v14 primaryTextColor];
  if (v8)
  {
    [(SKUISwooshView *)self setSeeAllColor:v8 forControlState:0];
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    [(SKUISwooshView *)self setSeeAllColor:v9 forControlState:0];
  }
  double v10 = [v14 highlightedTextColor];
  if (v10)
  {
    [(SKUISwooshView *)self setSeeAllColor:v10 forControlState:1];
  }
  else
  {
    v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(SKUISwooshView *)self setSeeAllColor:v11 forControlState:1];
  }
  v12 = [v14 secondaryTextColor];
  if (!v12)
  {
    v12 = [v14 primaryTextColor];
    if (!v12)
    {
      v12 = [MEMORY[0x1E4FB1618] blackColor];
    }
  }
  [(SKUISwooshView *)self setTitleColor:v12];

  [(UICollectionView *)self->_collectionView setBackgroundColor:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    [v13 setBackgroundColor:v7];
    [(UICollectionView *)self->_collectionView reloadData];
  }
}

- (void)setSeeAllColor:(id)a3 forControlState:(unint64_t)a4
{
  id v6 = a3;
  id v9 = [(SKUISwooshView *)self seeAllControl];
  v7 = [(SKUISwooshView *)self _seeAllArrowImage];
  v8 = SKUITintedImage(v7, 0, v6);
  [v9 setImage:v8 forState:a4];

  [v9 setTitleColor:v6 forState:a4];
}

- (void)setSeeAllTitle:(id)a3
{
  id v7 = a3;
  id v4 = [(SKUISwooshView *)self seeAllTitle];
  if (v4 != v7 && ([v4 isEqualToString:v7] & 1) == 0)
  {
    v5 = [(SKUISwooshView *)self seeAllControl];
    [v5 setTitle:v7 forState:0];
    [v5 sizeToFit];
    seeAllButton = self->_seeAllButton;
    if (v7) {
      [(SKUISwooshView *)self addSubview:seeAllButton];
    }
    else {
      [(UIButton *)seeAllButton removeFromSuperview];
    }
    [(SKUISwooshView *)self setNeedsLayout];
  }
}

- (void)setShowsChevronForTitle:(BOOL)a3
{
  if (self->_showsChevronForTitle != a3)
  {
    id v5 = [(SKUISwooshView *)self title];
    [(SKUISwooshView *)self setTitle:0];
    self->_showsChevronForTitle = a3;
    [(SKUISwooshView *)self setTitle:v5];
  }
}

- (void)setTitle:(id)a3
{
  id v14 = a3;
  if ([(SKUISwooshView *)self showsChevronForTitle])
  {
    id v4 = [(SKUILinkButton *)self->_titleButton titleForState:0];
    if (v4 != v14 && ([v4 isEqualToString:v14] & 1) == 0)
    {
      if (v14)
      {
        id v5 = [(SKUISwooshView *)self chevronTitleControl];
        [v5 setHidden:0];
        [v5 setTitle:v14 forState:0];
        [(SKUISwooshView *)self addSubview:v5];
      }
      else
      {
        [(SKUILinkButton *)self->_titleButton setHidden:1];
        [(SKUILinkButton *)self->_titleButton setTitle:0 forState:0];
      }
LABEL_14:
      [(SKUISwooshView *)self setNeedsLayout];
    }
  }
  else
  {
    id v4 = [(UILabel *)self->_titleLabel text];
    if (v4 != v14 && ([v4 isEqualToString:v14] & 1) == 0)
    {
      titleLabel = self->_titleLabel;
      if (v14)
      {
        if (!titleLabel)
        {
          id v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
          v8 = self->_titleLabel;
          self->_titleLabel = v7;

          id v9 = self->_titleLabel;
          double v10 = [(SKUISwooshView *)self backgroundColor];
          [(UILabel *)v9 setBackgroundColor:v10];

          v11 = self->_titleLabel;
          v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
          [(UILabel *)v11 setFont:v12];

          [(UILabel *)self->_titleLabel setTextColor:self->_titleColor];
          [(SKUISwooshView *)self addSubview:self->_titleLabel];
          titleLabel = self->_titleLabel;
        }
        -[UILabel setText:](titleLabel, "setText:");
      }
      else
      {
        [(UILabel *)titleLabel removeFromSuperview];
        long long v13 = self->_titleLabel;
        self->_titleLabel = 0;
      }
      goto LABEL_14;
    }
  }
}

- (void)setTitleColor:(id)a3
{
  if (self->_titleColor != a3)
  {
    id v6 = a3;
    id v4 = (UIColor *)[v6 copy];
    titleColor = self->_titleColor;
    self->_titleColor = v4;

    [(SKUILinkButton *)self->_titleButton setTitleColor:self->_titleColor forState:0];
    [(UILabel *)self->_titleLabel setTextColor:v6];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SKUISwooshView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 - self->_contentInsets.right;
  double top = self->_contentInsets.top;
  seeAllButton = self->_seeAllButton;
  uint64_t v10 = MEMORY[0x1E4F1DB10];
  if (seeAllButton)
  {
    [(UIButton *)seeAllButton frame];
    -[UIButton sizeThatFits:](self->_seeAllButton, "sizeThatFits:", *(double *)(v10 + 16), *(double *)(v10 + 24));
    double v12 = v11;
    double v14 = v13 + 5.0;
    CGFloat v15 = v7 - (v13 + 5.0);
    v16 = self->_seeAllButton;
    [(UIButton *)v16 bounds];
    -[UIButton contentRectForBounds:](v16, "contentRectForBounds:");
    -[UIButton titleRectForContentRect:](v16, "titleRectForContentRect:");
    -[UIButton setImageEdgeInsets:](self->_seeAllButton, "setImageEdgeInsets:", 2.0, v17 + 5.0, 0.0, 0.0);
    double v36 = v15;
    v40.origin.double x = v15;
    v40.origin.double y = top;
    v40.size.double width = v14;
    v40.size.double height = v12;
    double v7 = CGRectGetMinX(v40) + -5.0;
    double v18 = top;
  }
  else
  {
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v36 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v19 = self->_titleButton;
  v37 = v19;
  if (v19 && (int v20 = [(SKUILinkButton *)v19 isHidden], v21 = (UILabel *)v37, !v20)
    || (v22 = self->_titleLabel, v37, (v21 = v22) != 0))
  {
    v38 = v21;
    [(UILabel *)v21 frame];
    double v35 = v14;
    double v23 = v6;
    double v24 = v4;
    double left = self->_contentInsets.left;
    -[UILabel sizeThatFits:](v38, "sizeThatFits:", *(double *)(v10 + 16), *(double *)(v10 + 24));
    CGFloat v28 = v27;
    if (v26 >= v7 - left) {
      double v29 = v7 - left;
    }
    else {
      double v29 = v26;
    }
    -[UILabel setFrame:](v38, "setFrame:", left, top, v29, v27);
    v41.origin.double x = left;
    v41.origin.double y = top;
    v41.size.double width = v29;
    v41.size.double height = v28;
    double v18 = CGRectGetMaxY(v41) - v12 + -2.0;
    v42.origin.double x = left;
    double v4 = v24;
    double v6 = v23;
    double v14 = v35;
    v42.origin.double y = top;
    v42.size.double width = v29;
    v42.size.double height = v28;
    double top = CGRectGetMaxY(v42) + 10.0;
  }
  else
  {
    v38 = 0;
  }
  -[UIButton setFrame:](self->_seeAllButton, "setFrame:", v36, v18, v14, v12);
  collectionView = self->_collectionView;
  if (collectionView)
  {
    [(UICollectionView *)collectionView frame];
    CGFloat v31 = self->_contentInsets.left + self->_collectionViewInsets.left;
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v31, top + self->_collectionViewInsets.top, v4 - self->_contentInsets.right - self->_collectionViewInsets.right - v31);
  }
  v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v32 scale];
  double v34 = 1.0 / v33;

  -[UIView setFrame:](self->_borderView, "setFrame:", 15.0, v6 - v34, v4 + -15.0, v34);
}

- (void)setBackgroundColor:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  [(UICollectionView *)collectionView setBackgroundColor:v5];
  [(UIButton *)self->_seeAllButton setBackgroundColor:v5];
  [(SKUILinkButton *)self->_titleButton setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUISwooshView;
  [(SKUISwooshView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = self->_contentInsets.bottom + self->_contentInsets.top;
  titleButton = self->_titleButton;
  if (titleButton && ([(SKUILinkButton *)titleButton isHidden] & 1) == 0)
  {
    titleLabel = self->_titleButton;
    goto LABEL_6;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
LABEL_6:
    objc_msgSend(titleLabel, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    double v5 = v5 + v8;
  }
  collectionView = self->_collectionView;
  if (collectionView)
  {
    [(UICollectionView *)collectionView frame];
    double v5 = v5 + v10 + self->_collectionViewInsets.top + self->_collectionViewInsets.bottom;
  }
  if (self->_titleLabel && self->_collectionView) {
    double v5 = v5 + 10.0;
  }
  double v11 = width;
  double v12 = v5;
  result.double height = v12;
  result.CGFloat width = v11;
  return result;
}

- (id)_seeAllArrowImage
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v3 = [MEMORY[0x1E4FB1818] imageNamed:@"ChevronSeeAll" inBundle:v2];

  return v3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UIEdgeInsets)collectionViewInsets
{
  double top = self->_collectionViewInsets.top;
  double left = self->_collectionViewInsets.left;
  double bottom = self->_collectionViewInsets.bottom;
  double right = self->_collectionViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)showsChevronForTitle
{
  return self->_showsChevronForTitle;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISwooshView initWithFrame:]";
}

@end