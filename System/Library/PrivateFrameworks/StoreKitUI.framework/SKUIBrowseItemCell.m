@interface SKUIBrowseItemCell
- (BOOL)hasBlueBackgroundWhenSelected;
- (BOOL)showTopBorder;
- (NSString)subtitle;
- (NSString)title;
- (SKUIBrowseItemCell)initWithFrame:(CGRect)a3;
- (UIImage)decorationImage;
- (void)_reloadHighlightState;
- (void)layoutSubviews;
- (void)setDecorationImage:(id)a3;
- (void)setHasBlueBackgroundWhenSelected:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowTopBorder:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIBrowseItemCell

- (SKUIBrowseItemCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseItemCell initWithFrame:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIBrowseItemCell;
  v8 = -[SKUIBrowseItemCell initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    v11 = v8->_titleLabel;
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v8->_titleLabel setNumberOfLines:1];
    [(SKUIBrowseItemCell *)v8 addSubview:v8->_titleLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v8->_subtitleLabel;
    v8->_subtitleLabel = v13;

    v15 = v8->_subtitleLabel;
    v16 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v8->_subtitleLabel setNumberOfLines:1];
    v17 = v8->_subtitleLabel;
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v17 setTextColor:v18];

    [(SKUIBrowseItemCell *)v8 addSubview:v8->_subtitleLabel];
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    borderView = v8->_borderView;
    v8->_borderView = v19;

    v21 = v8->_borderView;
    v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)v21 setBackgroundColor:v22];

    [(SKUIBrowseItemCell *)v8 addSubview:v8->_borderView];
    [(SKUIBrowseItemCell *)v8 setSemanticContentAttribute:storeSemanticContentAttribute()];
  }
  return v8;
}

- (void)setDecorationImage:(id)a3
{
  p_decorationImage = &self->_decorationImage;
  id v11 = a3;
  if (v11)
  {
    objc_storeStrong((id *)&self->_decorationImage, a3);
    decorationImageView = self->_decorationImageView;
    if (decorationImageView)
    {
      [(UIImageView *)decorationImageView setImage:*p_decorationImage];
    }
    else
    {
      v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_decorationImage];
      v10 = self->_decorationImageView;
      self->_decorationImageView = v9;

      [(SKUIBrowseItemCell *)self addSubview:self->_decorationImageView];
    }
  }
  else
  {
    v7 = *p_decorationImage;
    *p_decorationImage = 0;

    [(UIImageView *)self->_decorationImageView removeFromSuperview];
    v8 = self->_decorationImageView;
    self->_decorationImageView = 0;
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_titleLabel setText:v6];
    [(SKUIBrowseItemCell *)self setNeedsLayout];
  }
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_subtitleLabel text];
  char v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_subtitleLabel setText:v6];
    [(SKUIBrowseItemCell *)self setNeedsLayout];
  }
}

- (void)setShowTopBorder:(BOOL)a3
{
  self->_showTopBorder = a3;
  topBorderView = self->_topBorderView;
  if (a3)
  {
    if (!topBorderView)
    {
      char v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v6 = self->_topBorderView;
      self->_topBorderView = v5;

      v7 = self->_topBorderView;
      v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
      [(UIView *)v7 setBackgroundColor:v8];

      v9 = self->_topBorderView;
      [(SKUIBrowseItemCell *)self addSubview:v9];
    }
  }
  else if (topBorderView)
  {
    [(UIView *)topBorderView removeFromSuperview];
    v10 = self->_topBorderView;
    self->_topBorderView = 0;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIBrowseItemCell;
  [(SKUIBrowseItemCell *)&v4 setHighlighted:a3];
  [(SKUIBrowseItemCell *)self _reloadHighlightState];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIBrowseItemCell;
  [(SKUIBrowseItemCell *)&v4 setSelected:a3];
  [(SKUIBrowseItemCell *)self _reloadHighlightState];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)SKUIBrowseItemCell;
  [(SKUIBrowseItemCell *)&v37 layoutSubviews];
  [(SKUIBrowseItemCell *)self bounds];
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  double height = v38.size.height;
  double v7 = CGRectGetMaxX(v38) + -15.0;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  decorationImageView = self->_decorationImageView;
  if (decorationImageView)
  {
    [(UIImageView *)decorationImageView frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v14 = v7 - v10;
    CGFloat v15 = y + (height - v12) * 0.5;
    v16 = self->_decorationImageView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v14, v15, v10, v12, x, y, width, height);
    -[UIImageView setFrame:](v16, "setFrame:");
    v39.origin.double x = v14;
    v39.origin.double y = v15;
    v39.size.double width = v11;
    v39.size.double height = v13;
    double v7 = CGRectGetMinX(v39) + -10.0;
  }
  if (ShouldReverseLayoutDirection) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  [(UILabel *)self->_subtitleLabel sizeToFit];
  [(UILabel *)self->_subtitleLabel frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v22 = v7 - v18;
  CGFloat v23 = y + (height - v20) * 0.5;
  subtitleLabel = self->_subtitleLabel;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v22, v23, v18, v20, x, y, width, height);
  -[UILabel setFrame:](subtitleLabel, "setFrame:");
  [(UILabel *)self->_subtitleLabel setTextAlignment:v17];
  v40.origin.double x = v22;
  v40.origin.double y = v23;
  v40.size.double width = v19;
  v40.size.double height = v21;
  CGFloat v25 = CGRectGetMinX(v40) + -10.0;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel frame];
  titleLabel = self->_titleLabel;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x + 15.0, y + (height - v26) * 0.5, v25 - x + -15.0, v26, x, y, width, height);
  -[UILabel setFrame:](titleLabel, "setFrame:");
  [(UILabel *)self->_titleLabel setTextAlignment:v17];
  [(UIView *)self->_borderView frame];
  v28 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v28 scale];
  CGFloat v30 = 1.0 / v29;

  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  CGFloat MaxY = CGRectGetMaxY(v41);
  borderView = self->_borderView;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, MaxY - v30, width + -15.0, v30, x, y, width, height);
  -[UIView setFrame:](borderView, "setFrame:");
  [(UIView *)self->_topBorderView frame];
  v33 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v33 scale];
  CGFloat v35 = 1.0 / v34;

  topBorderView = self->_topBorderView;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 0.0, width + -15.0, v35, x, y, width, height);
  -[UIView setFrame:](topBorderView, "setFrame:");
}

- (void)_reloadHighlightState
{
  BOOL hasBlueBackgroundWhenSelected = self->_hasBlueBackgroundWhenSelected;
  char v4 = [(SKUIBrowseItemCell *)self isHighlighted];
  char v5 = v4;
  if (hasBlueBackgroundWhenSelected)
  {
    if ((v4 & 1) != 0 || [(SKUIBrowseItemCell *)self isSelected])
    {
      titleLabel = self->_titleLabel;
      double v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)titleLabel setTextColor:v7];

      subtitleLabel = self->_subtitleLabel;
      v9 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)subtitleLabel setTextColor:v9];

      uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.298039216 green:0.631372549 blue:1.0 alpha:1.0];
      goto LABEL_9;
    }
    double v12 = self->_titleLabel;
    CGFloat v13 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v12 setTextColor:v13];

    CGFloat v14 = self->_subtitleLabel;
    CGFloat v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v14 setTextColor:v15];

    CGFloat v11 = (void *)MEMORY[0x1E4FB1618];
  }
  else
  {
    CGFloat v11 = (void *)MEMORY[0x1E4FB1618];
    if (v5)
    {
      uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
      goto LABEL_9;
    }
  }
  uint64_t v10 = [v11 whiteColor];
LABEL_9:
  v16 = (void *)v10;
  [(SKUIBrowseItemCell *)self setBackgroundColor:v10];

  borderView = self->_borderView;
  if ([(SKUIBrowseItemCell *)self isHighlighted]) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = [(SKUIBrowseItemCell *)self isSelected];
  }
  [(UIView *)borderView setHidden:v18];
  topBorderView = self->_topBorderView;
  if ([(SKUIBrowseItemCell *)self isHighlighted]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = [(SKUIBrowseItemCell *)self isSelected];
  }

  [(UIView *)topBorderView setHidden:v20];
}

- (UIImage)decorationImage
{
  return self->_decorationImage;
}

- (BOOL)showTopBorder
{
  return self->_showTopBorder;
}

- (BOOL)hasBlueBackgroundWhenSelected
{
  return self->_hasBlueBackgroundWhenSelected;
}

- (void)setHasBlueBackgroundWhenSelected:(BOOL)a3
{
  self->_BOOL hasBlueBackgroundWhenSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationImage, 0);
  objc_storeStrong((id *)&self->_decorationImageView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrowseItemCell initWithFrame:]";
}

@end