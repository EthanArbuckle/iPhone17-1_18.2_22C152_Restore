@interface SUUIProductPageTableExpandableHeaderView
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)actionString;
- (NSString)title;
- (SUUIColorScheme)colorScheme;
- (UIColor)bottomBorderColor;
- (UIColor)topBorderColor;
- (void)layoutSubviews;
- (void)setActionString:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomBorderColor:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopBorderColor:(id)a3;
@end

@implementation SUUIProductPageTableExpandableHeaderView

- (NSString)actionString
{
  return [(UILabel *)self->_actionLabel text];
}

- (UIColor)bottomBorderColor
{
  return [(UIView *)self->_bottomBorderView backgroundColor];
}

- (void)setActionString:(id)a3
{
  id v17 = a3;
  id v4 = [(SUUIProductPageTableExpandableHeaderView *)self actionString];
  if (v4 != v17 && ([v4 isEqualToString:v17] & 1) == 0)
  {
    uint64_t v5 = [v17 length];
    actionLabel = self->_actionLabel;
    if (v5)
    {
      if (!actionLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_actionLabel;
        self->_actionLabel = v7;

        v9 = self->_actionLabel;
        v10 = [(SUUIProductPageTableExpandableHeaderView *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_actionLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [(UILabel *)v11 setFont:v12];

        v13 = self->_actionLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v14)
        {
          [(UILabel *)v13 setTextColor:v14];
        }
        else
        {
          v16 = [(SUUIProductPageTableExpandableHeaderView *)self tintColor];
          [(UILabel *)v13 setTextColor:v16];
        }
        [(SUUIProductPageTableExpandableHeaderView *)self addSubview:self->_actionLabel];
        actionLabel = self->_actionLabel;
      }
      [(UILabel *)actionLabel setText:v17];
      [(UILabel *)self->_actionLabel sizeToFit];
    }
    else
    {
      [(UILabel *)actionLabel removeFromSuperview];
      v15 = self->_actionLabel;
      self->_actionLabel = 0;
    }
    [(SUUIProductPageTableExpandableHeaderView *)self setNeedsLayout];
  }
}

- (void)setBottomBorderColor:(id)a3
{
  id v4 = a3;
  bottomBorderView = self->_bottomBorderView;
  id v9 = v4;
  if (v4)
  {
    if (!bottomBorderView)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      v7 = self->_bottomBorderView;
      self->_bottomBorderView = v6;

      [(SUUIProductPageTableExpandableHeaderView *)self addSubview:self->_bottomBorderView];
      bottomBorderView = self->_bottomBorderView;
    }
    [(UIView *)bottomBorderView setBackgroundColor:v9];
  }
  else
  {
    [(UIView *)bottomBorderView removeFromSuperview];
    v8 = self->_bottomBorderView;
    self->_bottomBorderView = 0;
  }
}

- (void)setColorScheme:(id)a3
{
  uint64_t v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    actionLabel = self->_actionLabel;
    v8 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v8)
    {
      [(UILabel *)actionLabel setTextColor:v8];
    }
    else
    {
      id v9 = [(SUUIProductPageTableExpandableHeaderView *)self tintColor];
      [(UILabel *)actionLabel setTextColor:v9];
    }
    titleLabel = self->_titleLabel;
    v11 = [(SUUIColorScheme *)*p_colorScheme secondaryTextColor];
    if (v11)
    {
      [(UILabel *)titleLabel setTextColor:v11];
    }
    else
    {
      v12 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)titleLabel setTextColor:v12];
    }
    uint64_t v5 = v13;
  }
}

- (void)setTitle:(id)a3
{
  id v17 = a3;
  id v4 = [(SUUIProductPageTableExpandableHeaderView *)self title];
  if (v4 != v17 && ([v4 isEqualToString:v17] & 1) == 0)
  {
    uint64_t v5 = [v17 length];
    titleLabel = self->_titleLabel;
    if (v5)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        id v9 = self->_titleLabel;
        v10 = [(SUUIProductPageTableExpandableHeaderView *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_titleLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
        [(UILabel *)v11 setFont:v12];

        v13 = self->_titleLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v14)
        {
          [(UILabel *)v13 setTextColor:v14];
        }
        else
        {
          v16 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v13 setTextColor:v16];
        }
        [(SUUIProductPageTableExpandableHeaderView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v17];
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v15 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIProductPageTableExpandableHeaderView *)self setNeedsLayout];
  }
}

- (void)setTopBorderColor:(id)a3
{
  id v4 = a3;
  topBorderView = self->_topBorderView;
  id v9 = v4;
  if (v4)
  {
    if (!topBorderView)
    {
      v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      v7 = self->_topBorderView;
      self->_topBorderView = v6;

      [(SUUIProductPageTableExpandableHeaderView *)self addSubview:self->_topBorderView];
      topBorderView = self->_topBorderView;
    }
    [(UIView *)topBorderView setBackgroundColor:v9];
  }
  else
  {
    [(UIView *)topBorderView removeFromSuperview];
    v8 = self->_topBorderView;
    self->_topBorderView = 0;
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (UIColor)topBorderColor
{
  return [(UIView *)self->_topBorderView backgroundColor];
}

- (void)layoutSubviews
{
  [(SUUIProductPageTableExpandableHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  bottomBorderView = self->_bottomBorderView;
  v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  double v10 = v6 - 1.0 / v9;
  double v11 = v4 + -15.0;
  v12 = [MEMORY[0x263F82B60] mainScreen];
  [v12 scale];
  -[UIView setFrame:](bottomBorderView, "setFrame:", 15.0, v10, v11, 1.0 / v13);

  -[UIView setFrame:](self->_topBorderView, "setFrame:", 15.0, 0.0, v11, 1.0);
  actionLabel = self->_actionLabel;
  if (actionLabel)
  {
    [(UILabel *)actionLabel frame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v19 = v11 - v15;
    float v20 = (v6 - v17) * 0.5;
    CGFloat v21 = (float)(floorf(v20) + 1.0);
    -[UILabel setFrame:](self->_actionLabel, "setFrame:", v19, v21);
    v28.origin.x = v19;
    v28.origin.y = v21;
    v28.size.width = v16;
    v28.size.height = v18;
    double v11 = CGRectGetMinX(v28) + -10.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    float v24 = (v6 - v23) * 0.5;
    double v25 = floorf(v24);
    v26 = self->_titleLabel;
    -[UILabel setFrame:](v26, "setFrame:", 15.0, v25, v11 + -15.0);
  }
}

- (void)setBackgroundColor:(id)a3
{
  actionLabel = self->_actionLabel;
  id v5 = a3;
  [(UILabel *)actionLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageTableExpandableHeaderView;
  [(SUUIProductPageTableExpandableHeaderView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.height = v3;
  return result;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
}

@end