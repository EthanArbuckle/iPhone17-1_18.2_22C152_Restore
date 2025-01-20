@interface TKLabelContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)labelText;
- (TKLabelContainerView)initWithFrame:(CGRect)a3;
- (UIColor)labelShadowColor;
- (UIColor)labelTextColor;
- (UIEdgeInsets)labelPaddingInsets;
- (UIFont)labelFont;
- (UIOffset)labelShadowOffset;
- (void)layoutSubviews;
- (void)setLabelFont:(id)a3;
- (void)setLabelPaddingInsets:(UIEdgeInsets)a3;
- (void)setLabelShadowColor:(id)a3;
- (void)setLabelShadowOffset:(UIOffset)a3;
- (void)setLabelText:(id)a3;
- (void)setLabelTextColor:(id)a3;
@end

@implementation TKLabelContainerView

- (TKLabelContainerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TKLabelContainerView;
  v3 = -[TKLabelContainerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(TKLabelContainerView *)v3 setBackgroundColor:v4];
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v6;

    [(UILabel *)v3->_label setBackgroundColor:v4];
    [(TKLabelContainerView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (NSString)labelText
{
  return [(UILabel *)self->_label text];
}

- (void)setLabelText:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_label text];

  id v5 = v6;
  if (v4 != v6)
  {
    [(UILabel *)self->_label setText:v6];
    [(UILabel *)self->_label sizeToFit];
    [(TKLabelContainerView *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (UIFont)labelFont
{
  return [(UILabel *)self->_label font];
}

- (void)setLabelFont:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_label font];

  id v5 = v6;
  if (v4 != v6)
  {
    [(UILabel *)self->_label setFont:v6];
    [(UILabel *)self->_label sizeToFit];
    [(TKLabelContainerView *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (UIColor)labelTextColor
{
  return [(UILabel *)self->_label textColor];
}

- (void)setLabelTextColor:(id)a3
{
}

- (UIColor)labelShadowColor
{
  return [(UILabel *)self->_label shadowColor];
}

- (void)setLabelShadowColor:(id)a3
{
}

- (UIOffset)labelShadowOffset
{
  [(UILabel *)self->_label shadowOffset];
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setLabelShadowOffset:(UIOffset)a3
{
}

- (void)setLabelPaddingInsets:(UIEdgeInsets)a3
{
  if (self->_labelPaddingInsets.left != a3.left
    || self->_labelPaddingInsets.top != a3.top
    || self->_labelPaddingInsets.right != a3.right
    || self->_labelPaddingInsets.bottom != a3.bottom)
  {
    self->_labelPaddingInsets = a3;
    [(TKLabelContainerView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(TKLabelContainerView *)self labelPaddingInsets];
  double v6 = v5;
  double v8 = v7;
  [(UILabel *)self->_label frame];
  double v9 = v8 + v6 + CGRectGetHeight(v12);
  double v10 = width;
  result.height = v9;
  result.CGFloat width = v10;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)TKLabelContainerView;
  [(TKLabelContainerView *)&v24 layoutSubviews];
  [(TKLabelContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TKLabelContainerView *)self safeAreaInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(TKLabelContainerView *)self labelPaddingInsets];
  double v18 = v14 + v17;
  double v20 = v12 + v19;
  double v22 = v16 + v21;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.CGFloat width = v8;
  v25.size.height = v10;
  double v23 = fmax(CGRectGetWidth(v25) - v18 - v22, 0.0);
  [(UILabel *)self->_label frame];
  -[UILabel setFrame:](self->_label, "setFrame:", v18, v20, v23);
}

- (UIEdgeInsets)labelPaddingInsets
{
  double top = self->_labelPaddingInsets.top;
  double left = self->_labelPaddingInsets.left;
  double bottom = self->_labelPaddingInsets.bottom;
  double right = self->_labelPaddingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end