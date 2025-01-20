@interface SULinkControl
- (BOOL)shouldDrawUnderline;
- (id)_label;
- (void)_updateLabel;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setShouldDrawUnderline:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setText:(id)a3;
- (void)sizeToFit;
@end

@implementation SULinkControl

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SULinkControl;
  [(SULinkControl *)&v3 dealloc];
}

- (void)setShouldDrawUnderline:(BOOL)a3
{
  if (self->_shouldDrawUnderline != a3)
  {
    self->_shouldDrawUnderline = a3;
    [(SULinkControl *)self setNeedsDisplay];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(SULinkControl *)self _updateLabel];
  }
}

- (void)setText:(id)a3
{
  id v4 = [(SULinkControl *)self _label];

  [v4 setText:a3];
}

- (void)drawRect:(CGRect)a3
{
  if ([(SULinkControl *)self isHighlighted])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0980392157, 0.300000012), "set");
    id v4 = (void *)MEMORY[0x263F1C478];
    [(SULinkControl *)self bounds];
    v5 = objc_msgSend(v4, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", 255);
    [v5 fill];
  }
  else if (self->_shouldDrawUnderline)
  {
    [(UILabel *)self->_label frame];
    CGFloat x = v14.origin.x;
    CGFloat width = v14.size.width;
    double MaxY = CGRectGetMaxY(v14);
    [(UIColor *)[(UILabel *)self->_label textColor] set];
    v15.size.height = 1.0;
    v15.origin.CGFloat x = x;
    v15.origin.y = MaxY;
    v15.size.CGFloat width = width;
    UIRectFill(v15);
    [(UIColor *)[(UILabel *)self->_label shadowColor] set];
    double v10 = 1.0;
    CGFloat v11 = x;
    CGFloat v12 = width;
    double v9 = MaxY + 1.0;
    UIRectFill(*(CGRect *)&v11);
  }
}

- (void)layoutSubviews
{
  [(SULinkControl *)self bounds];
  label = self->_label;
  CGRect v6 = CGRectInset(v5, 3.0, 3.0);

  -[UILabel setFrame:](label, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SULinkControl;
  -[SULinkControl setHighlighted:](&v6, sel_setHighlighted_);
  id v5 = [(SULinkControl *)self _label];
  [v5 setHighlighted:v3];
  if (v3) {
    [v5 setShadowColor:0];
  }
  else {
    [(SULinkControl *)self _updateLabel];
  }
  [(SULinkControl *)self setNeedsDisplay];
}

- (void)sizeToFit
{
  [(SULinkControl *)self frame];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(SULinkControl *)self _label];
  [v7 sizeToFit];
  [v7 frame];
  double v9 = v8 + 6.0;
  double v11 = v10 + 6.0;

  -[SULinkControl setFrame:](self, "setFrame:", v4, v6, v11, v9);
}

- (id)_label
{
  id result = self->_label;
  if (!result)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    self->_label = v4;
    [(UILabel *)v4 setBackgroundColor:0];
    [(UILabel *)self->_label setOpaque:0];
    [(SULinkControl *)self _updateLabel];
    [(SULinkControl *)self addSubview:self->_label];
    return self->_label;
  }
  return result;
}

- (void)_updateLabel
{
  int64_t style = self->_style;
  if (style == 3)
  {
    -[UILabel setFont:](self->_label, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:13.0]);
    -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", [MEMORY[0x263F1C550] whiteColor]);
    -[UILabel setShadowColor:](self->_label, "setShadowColor:", [MEMORY[0x263F1C550] whiteColor]);
    -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", 0.0, 1.0);
    label = self->_label;
    uint64_t v9 = [MEMORY[0x263F1C550] blackColor];
  }
  else
  {
    if (style == 2)
    {
      -[UILabel setFont:](self->_label, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:14.0]);
      -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", [MEMORY[0x263F1C550] whiteColor]);
      -[UILabel setShadowColor:](self->_label, "setShadowColor:", [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5]);
      -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", 0.0, 1.0);
      label = self->_label;
      double v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.145098039;
      double v7 = 0.196078431;
      double v8 = 0.262745098;
    }
    else if (style == 1)
    {
      -[UILabel setFont:](self->_label, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:13.0]);
      -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", [MEMORY[0x263F1C550] whiteColor]);
      [(UILabel *)self->_label setShadowColor:0];
      label = self->_label;
      double v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.0470588235;
      double v7 = 0.235294118;
      double v8 = 0.964705882;
    }
    else
    {
      -[UILabel setFont:](self->_label, "setFont:", [MEMORY[0x263F1C658] boldSystemFontOfSize:14.0]);
      -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", [MEMORY[0x263F1C550] whiteColor]);
      -[UILabel setShadowColor:](self->_label, "setShadowColor:", [MEMORY[0x263F1C550] whiteColor]);
      -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", 0.0, 1.0);
      label = self->_label;
      double v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.141176471;
      double v7 = 0.219607843;
      double v8 = 0.321568627;
    }
    uint64_t v9 = [v5 colorWithRed:v6 green:v7 blue:v8 alpha:1.0];
  }

  [(UILabel *)label setTextColor:v9];
}

- (BOOL)shouldDrawUnderline
{
  return self->_shouldDrawUnderline;
}

@end