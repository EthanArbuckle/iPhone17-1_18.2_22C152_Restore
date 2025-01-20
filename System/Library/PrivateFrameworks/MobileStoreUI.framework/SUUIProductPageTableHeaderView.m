@interface SUUIProductPageTableHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (UIEdgeInsets)contentInsets;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIProductPageTableHeaderView

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SUUIProductPageTableHeaderView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIProductPageTableHeaderView *)self title];
  v5 = v4;
  if (v4 != v15 && ([v4 isEqualToString:v15] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        v10 = [(SUUIProductPageTableHeaderView *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_titleLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
        [(UILabel *)v11 setFont:v12];

        v13 = self->_titleLabel;
        v14 = [MEMORY[0x263F825C8] blackColor];
        [(UILabel *)v13 setTextColor:v14];

        [(SUUIProductPageTableHeaderView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setHidden:0];
      [(UILabel *)self->_titleLabel setText:v15];
      [(UILabel *)self->_titleLabel sizeToFit];
      [(SUUIProductPageTableHeaderView *)self setNeedsLayout];
    }
    else
    {
      [(UILabel *)titleLabel setHidden:1];
    }
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SUUIProductPageTableHeaderView *)self bounds];
  [(UILabel *)self->_titleLabel frame];
  titleLabel = self->_titleLabel;
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  titleLabel = self->_titleLabel;
  id v5 = a3;
  [(UILabel *)titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageTableHeaderView;
  [(SUUIProductPageTableHeaderView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UILabel *)self->_titleLabel frame];
  double v5 = v4 + self->_contentInsets.bottom + self->_contentInsets.top;
  double v7 = v6 + self->_contentInsets.left + self->_contentInsets.right;
  result.height = v5;
  result.width = v7;
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