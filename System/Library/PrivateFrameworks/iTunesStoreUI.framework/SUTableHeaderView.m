@interface SUTableHeaderView
- (NSString)subtitle;
- (NSString)title;
- (SUTableHeaderView)initWithFrame:(CGRect)a3;
- (UIColor)bottomBorderColor;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (UIEdgeInsets)edgeInsets;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (int64_t)index;
- (int64_t)style;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBottomBorderColor:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setIndex:(int64_t)a3;
- (void)setShadowColor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)sizeToFit;
@end

@implementation SUTableHeaderView

- (SUTableHeaderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUTableHeaderView;
  v3 = -[SUTableHeaderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    *(_OWORD *)&v3->_edgeInsets.top = xmmword_227924260;
    *(_OWORD *)&v3->_edgeInsets.bottom = xmmword_227924260;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    v4->_subtitleLabel = v5;
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:14.0]);
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    -[UILabel setShadowColor:](v4->_subtitleLabel, "setShadowColor:", [MEMORY[0x263F1C550] whiteColor]);
    -[UILabel setShadowOffset:](v4->_subtitleLabel, "setShadowOffset:", 0.0, 1.0);
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", [MEMORY[0x263F1C550] colorWithRed:0.298039216 green:0.337254902 blue:0.423529412 alpha:1.0]);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    v4->_titleLabel = v6;
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    -[UILabel setFont:](v4->_titleLabel, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0]);
    -[UILabel setShadowColor:](v4->_titleLabel, "setShadowColor:", [MEMORY[0x263F1C550] whiteColor]);
    -[UILabel setShadowOffset:](v4->_titleLabel, "setShadowOffset:", 0.0, 1.0);
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", [MEMORY[0x263F1C550] colorWithRed:0.298039216 green:0.337254902 blue:0.423529412 alpha:1.0]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUTableHeaderView;
  [(SUTableHeaderView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  if (self->_bottomBorderColor)
  {
    [(SUTableHeaderView *)self bounds];
    uint64_t v5 = v4;
    double v7 = v6;
    [(UIColor *)self->_bottomBorderColor set];
    uint64_t v9 = 0;
    double v10 = 1.0;
    uint64_t v11 = v5;
    double v8 = v7 + -1.0;
    UIRectFill(*(CGRect *)&v9);
  }
}

- (void)layoutSubviews
{
  [(SUTableHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel frame];
  double v12 = v11;
  p_edgeInsets = &self->_edgeInsets;
  double left = self->_edgeInsets.left;
  double v30 = v14;
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  double MaxX = CGRectGetMaxX(v32);
  double right = self->_edgeInsets.right;
  [(UILabel *)self->_subtitleLabel frame];
  double v17 = v16;
  double v18 = self->_edgeInsets.left;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  double v19 = CGRectGetMaxX(v33) - self->_edgeInsets.right - v18;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v19, 1.79769313e308);
  double v21 = v20;
  if ([(SUTableHeaderView *)self title] && [(SUTableHeaderView *)self subtitle])
  {
    uint64_t v22 = 0;
    double v12 = 4.0;
    double v17 = v30 + 4.0 + -2.0;
  }
  else
  {
    if ([(SUTableHeaderView *)self title])
    {
      double v12 = 5.0;
    }
    else if ([(SUTableHeaderView *)self subtitle])
    {
      double v17 = 1.0;
    }
    uint64_t v22 = 1;
  }
  if (self->_style == 1)
  {
    double v23 = v17 + 6.0;
    double v24 = v12 + 6.0;
  }
  else
  {
    double v23 = v17 + 10.0;
    double v24 = v12 + 10.0;
    if (self->_index)
    {
      double v24 = v12;
      double v23 = v17;
    }
  }
  double v25 = v23 + p_edgeInsets->top;
  double v26 = v24 + p_edgeInsets->top;
  [(UILabel *)self->_subtitleLabel setTextAlignment:v22];
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v18, v25, v19, v21);
  titleLabel = self->_titleLabel;

  -[UILabel setFrame:](titleLabel, "setFrame:", left, v26, MaxX - right - left, v30);
}

- (void)sizeToFit
{
  [(SUTableHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(SUTableHeaderView *)self layoutIfNeeded];
  if ([(SUTableHeaderView *)self title] && [(SUTableHeaderView *)self subtitle])
  {
    [(UILabel *)self->_titleLabel frame];
    double v10 = v9 + 4.0 + -2.0;
    [(UILabel *)self->_subtitleLabel frame];
    double v12 = 3.0;
LABEL_8:
    double v15 = v10 + v11 + v12;
    goto LABEL_9;
  }
  if ([(SUTableHeaderView *)self title])
  {
    [(UILabel *)self->_titleLabel frame];
    double v10 = v13;
    double v12 = 7.0;
    double v11 = 5.0;
    goto LABEL_8;
  }
  if ([(SUTableHeaderView *)self subtitle])
  {
    [(UILabel *)self->_subtitleLabel frame];
    double v10 = v14;
    double v12 = 5.0;
    double v11 = 1.0;
    goto LABEL_8;
  }
  double v15 = 0.0;
LABEL_9:
  if (self->_style == 1)
  {
    double v15 = v15 + 10.0;
  }
  else if (!self->_index)
  {
    double v15 = v15 + 10.0;
  }
  double v16 = v15 + self->_edgeInsets.top + self->_edgeInsets.bottom;

  -[SUTableHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v16);
}

- (void)setBottomBorderColor:(id)a3
{
  bottomBorderColor = self->_bottomBorderColor;
  if (bottomBorderColor != a3)
  {

    self->_bottomBorderColor = (UIColor *)a3;
    [(SUTableHeaderView *)self setNeedsDisplay];
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(SUTableHeaderView *)self setNeedsDisplay];
  }
}

- (void)setIndex:(int64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    [(SUTableHeaderView *)self setNeedsDisplay];
  }
}

- (void)setShadowColor:(id)a3
{
  -[UILabel setShadowColor:](self->_subtitleLabel, "setShadowColor:");
  titleLabel = self->_titleLabel;

  [(UILabel *)titleLabel setShadowColor:a3];
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:");
  if ([a3 length]) {
    [(SUTableHeaderView *)self addSubview:self->_subtitleLabel];
  }
  else {
    [(UILabel *)self->_subtitleLabel removeFromSuperview];
  }

  [(SUTableHeaderView *)self setNeedsLayout];
}

- (void)setSubtitleFont:(id)a3
{
  [(UILabel *)self->_subtitleLabel setFont:a3];

  [(SUTableHeaderView *)self setNeedsLayout];
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:");
  titleLabel = self->_titleLabel;

  [(UILabel *)titleLabel setTextColor:a3];
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:");
  if ([a3 length]) {
    [(SUTableHeaderView *)self addSubview:self->_titleLabel];
  }
  else {
    [(UILabel *)self->_titleLabel removeFromSuperview];
  }

  [(SUTableHeaderView *)self setNeedsLayout];
}

- (void)setTitleFont:(id)a3
{
  [(UILabel *)self->_titleLabel setFont:a3];

  [(SUTableHeaderView *)self setNeedsLayout];
}

- (UIColor)shadowColor
{
  return [(UILabel *)self->_titleLabel shadowColor];
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (UIFont)subtitleFont
{
  return [(UILabel *)self->_subtitleLabel font];
}

- (UIColor)textColor
{
  return [(UILabel *)self->_titleLabel textColor];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (UIFont)titleFont
{
  return [(UILabel *)self->_titleLabel font];
}

- (UIColor)bottomBorderColor
{
  return self->_bottomBorderColor;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)index
{
  return self->_index;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end