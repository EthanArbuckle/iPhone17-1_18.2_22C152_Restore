@interface SUUIBrowseItemCell
- (BOOL)hasBlueBackgroundWhenSelected;
- (BOOL)showTopBorder;
- (NSString)subtitle;
- (NSString)title;
- (SUUIBrowseItemCell)initWithFrame:(CGRect)a3;
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

@implementation SUUIBrowseItemCell

- (SUUIBrowseItemCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SUUIBrowseItemCell;
  v3 = -[SUUIBrowseItemCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = v3->_titleLabel;
    v7 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(SUUIBrowseItemCell *)v3 addSubview:v3->_titleLabel];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v8;

    v10 = v3->_subtitleLabel;
    v11 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v3->_subtitleLabel setNumberOfLines:1];
    v12 = v3->_subtitleLabel;
    v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v12 setTextColor:v13];

    [(SUUIBrowseItemCell *)v3 addSubview:v3->_subtitleLabel];
    v14 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView = v3->_borderView;
    v3->_borderView = v14;

    v16 = v3->_borderView;
    v17 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
    [(UIView *)v16 setBackgroundColor:v17];

    [(SUUIBrowseItemCell *)v3 addSubview:v3->_borderView];
    [(SUUIBrowseItemCell *)v3 setSemanticContentAttribute:storeSemanticContentAttribute()];
  }
  return v3;
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
      v9 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:*p_decorationImage];
      v10 = self->_decorationImageView;
      self->_decorationImageView = v9;

      [(SUUIBrowseItemCell *)self addSubview:self->_decorationImageView];
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
    [(SUUIBrowseItemCell *)self setNeedsLayout];
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
    [(SUUIBrowseItemCell *)self setNeedsLayout];
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
      char v5 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      id v6 = self->_topBorderView;
      self->_topBorderView = v5;

      v7 = self->_topBorderView;
      v8 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
      [(UIView *)v7 setBackgroundColor:v8];

      v9 = self->_topBorderView;
      [(SUUIBrowseItemCell *)self addSubview:v9];
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
  v4.super_class = (Class)SUUIBrowseItemCell;
  [(SUUIBrowseItemCell *)&v4 setHighlighted:a3];
  [(SUUIBrowseItemCell *)self _reloadHighlightState];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIBrowseItemCell;
  [(SUUIBrowseItemCell *)&v4 setSelected:a3];
  [(SUUIBrowseItemCell *)self _reloadHighlightState];
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)SUUIBrowseItemCell;
  [(SUUIBrowseItemCell *)&v32 layoutSubviews];
  [(SUUIBrowseItemCell *)self bounds];
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  double v7 = CGRectGetMaxX(v33) + -15.0;
  int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  decorationImageView = self->_decorationImageView;
  if (decorationImageView)
  {
    [(UIImageView *)decorationImageView frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v14 = v7 - v10;
    CGFloat v15 = y + (height - v12) * 0.5;
    [(UIImageView *)self->_decorationImageView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v14, v15, v10, v12, x, y, width, height)];
    v34.origin.double x = v14;
    v34.origin.double y = v15;
    v34.size.double width = v11;
    v34.size.double height = v13;
    double v7 = CGRectGetMinX(v34) + -10.0;
  }
  if (ShouldReverseLayoutDirection) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 0;
  }
  [(UILabel *)self->_subtitleLabel sizeToFit];
  [(UILabel *)self->_subtitleLabel frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v21 = v7 - v17;
  CGFloat v22 = y + (height - v19) * 0.5;
  [(UILabel *)self->_subtitleLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v21, v22, v17, v19, x, y, width, height)];
  [(UILabel *)self->_subtitleLabel setTextAlignment:v16];
  v35.origin.double x = v21;
  v35.origin.double y = v22;
  v35.size.double width = v18;
  v35.size.double height = v20;
  CGFloat v23 = CGRectGetMinX(v35) + -10.0;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel frame];
  [(UILabel *)self->_titleLabel setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(x + 15.0, y + (height - v24) * 0.5, v23 - x + -15.0, v24, x, y, width, height)];
  [(UILabel *)self->_titleLabel setTextAlignment:v16];
  [(UIView *)self->_borderView frame];
  v25 = [MEMORY[0x263F82B60] mainScreen];
  [v25 scale];
  CGFloat v27 = 1.0 / v26;

  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = height;
  CGFloat MaxY = CGRectGetMaxY(v36);
  [(UIView *)self->_borderView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, MaxY - v27, width + -15.0, v27, x, y, width, height)];
  [(UIView *)self->_topBorderView frame];
  v29 = [MEMORY[0x263F82B60] mainScreen];
  [v29 scale];
  CGFloat v31 = 1.0 / v30;

  [(UIView *)self->_topBorderView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 0.0, width + -15.0, v31, x, y, width, height)];
}

- (void)_reloadHighlightState
{
  BOOL hasBlueBackgroundWhenSelected = self->_hasBlueBackgroundWhenSelected;
  char v4 = [(SUUIBrowseItemCell *)self isHighlighted];
  char v5 = v4;
  if (hasBlueBackgroundWhenSelected)
  {
    if ((v4 & 1) != 0 || [(SUUIBrowseItemCell *)self isSelected])
    {
      titleLabel = self->_titleLabel;
      double v7 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)titleLabel setTextColor:v7];

      subtitleLabel = self->_subtitleLabel;
      v9 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)subtitleLabel setTextColor:v9];

      uint64_t v10 = [MEMORY[0x263F825C8] colorWithRed:0.298039216 green:0.631372549 blue:1.0 alpha:1.0];
      goto LABEL_9;
    }
    double v12 = self->_titleLabel;
    CGFloat v13 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)v12 setTextColor:v13];

    CGFloat v14 = self->_subtitleLabel;
    CGFloat v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v14 setTextColor:v15];

    CGFloat v11 = (void *)MEMORY[0x263F825C8];
  }
  else
  {
    CGFloat v11 = (void *)MEMORY[0x263F825C8];
    if (v5)
    {
      uint64_t v10 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
      goto LABEL_9;
    }
  }
  uint64_t v10 = [v11 whiteColor];
LABEL_9:
  uint64_t v16 = (void *)v10;
  [(SUUIBrowseItemCell *)self setBackgroundColor:v10];

  borderView = self->_borderView;
  if ([(SUUIBrowseItemCell *)self isHighlighted]) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = [(SUUIBrowseItemCell *)self isSelected];
  }
  [(UIView *)borderView setHidden:v18];
  topBorderView = self->_topBorderView;
  if ([(SUUIBrowseItemCell *)self isHighlighted]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = [(SUUIBrowseItemCell *)self isSelected];
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

@end