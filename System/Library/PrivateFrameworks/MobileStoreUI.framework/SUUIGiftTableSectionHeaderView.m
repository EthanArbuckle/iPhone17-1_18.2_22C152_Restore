@interface SUUIGiftTableSectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)label;
- (UIEdgeInsets)contentInsets;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setLabel:(id)a3;
@end

@implementation SUUIGiftTableSectionHeaderView

- (NSString)label
{
  return [(UILabel *)self->_label text];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SUUIGiftTableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setLabel:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIGiftTableSectionHeaderView *)self label];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    label = self->_label;
    if (v15)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_label;
        self->_label = v6;

        v8 = self->_label;
        v9 = [(SUUIGiftTableSectionHeaderView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_label;
        v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:15.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_label;
        v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(UILabel *)self->_label setTextAlignment:4];
        [(SUUIGiftTableSectionHeaderView *)self addSubview:self->_label];
        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      [(UILabel *)self->_label sizeToFit];
    }
    else
    {
      [(UILabel *)label removeFromSuperview];
      v14 = self->_label;
      self->_label = 0;
    }
    [(SUUIGiftTableSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIGiftTableSectionHeaderView *)self bounds];
  [(UILabel *)self->_label frame];
  label = self->_label;
  -[UILabel setFrame:](label, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [(UILabel *)label setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIGiftTableSectionHeaderView;
  [(SUUIGiftTableSectionHeaderView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v5 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.width, a3.height);
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 22.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 24.0;
  }
  double v8 = v7 + self->_contentInsets.top + self->_contentInsets.bottom;
  double v9 = width;
  result.height = v8;
  result.CGFloat width = v9;
  return result;
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

- (void).cxx_destruct
{
}

@end