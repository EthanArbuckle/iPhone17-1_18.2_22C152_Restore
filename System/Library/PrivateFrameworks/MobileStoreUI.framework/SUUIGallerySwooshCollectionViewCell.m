@interface SUUIGallerySwooshCollectionViewCell
- (NSString)title;
- (UIView)contentChildView;
- (void)layoutSubviews;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentChildView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIGallerySwooshCollectionViewCell

- (void)setColoringWithColorScheme:(id)a3
{
  uint64_t v4 = [a3 primaryTextColor];
  p_uint64_t titleColor = &self->_titleColor;
  uint64_t titleColor = (uint64_t)self->_titleColor;
  if (titleColor != v4)
  {
    id obj = (id)v4;
    uint64_t titleColor = [(id)titleColor isEqual:v4];
    uint64_t v4 = (uint64_t)obj;
    if ((titleColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleColor, obj);
      titleLabel = self->_titleLabel;
      if (*p_titleColor)
      {
        uint64_t titleColor = -[UILabel setTextColor:](titleLabel, "setTextColor:");
      }
      else
      {
        v8 = [MEMORY[0x263F825C8] colorWithWhite:0.235294118 alpha:1.0];
        [(UILabel *)titleLabel setTextColor:v8];
      }
      uint64_t v4 = (uint64_t)obj;
    }
  }
  MEMORY[0x270F9A758](titleColor, v4);
}

- (void)setContentChildView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentChildView = &self->_contentChildView;
  contentChildView = self->_contentChildView;
  v9 = v5;
  if (contentChildView != v5)
  {
    if ([(UIView *)contentChildView isDescendantOfView:self]) {
      [(UIView *)*p_contentChildView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentChildView, a3);
    [(SUUIGallerySwooshCollectionViewCell *)self setNeedsLayout];
    v5 = *p_contentChildView;
  }
  if (v5 && ![(UIView *)v5 isDescendantOfView:self])
  {
    v8 = [(SUUIGallerySwooshCollectionViewCell *)self contentView];
    [v8 addSubview:*p_contentChildView];
    [(SUUIGallerySwooshCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v16)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        v9 = [(SUUIGallerySwooshCollectionViewCell *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        v12 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          v14 = [MEMORY[0x263F825C8] colorWithWhite:0.235294118 alpha:1.0];
          [(UILabel *)v12 setTextColor:v14];
        }
        v15 = [(SUUIGallerySwooshCollectionViewCell *)self contentView];
        [v15 addSubview:self->_titleLabel];

        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v13 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIGallerySwooshCollectionViewCell *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SUUIGallerySwooshCollectionViewCell;
  [(SUUIGallerySwooshCollectionViewCell *)&v19 layoutSubviews];
  v3 = [(SUUIGallerySwooshCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double MaxY = CGRectGetMaxY(v20);
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    CGFloat v15 = v14;
    CGFloat v16 = MaxY - v14;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v16, v9);
    v21.origin.x = 0.0;
    v21.origin.y = v16;
    v21.size.width = v9;
    v21.size.height = v15;
    double MaxY = CGRectGetMinY(v21) + -6.0;
  }
  contentChildView = self->_contentChildView;
  if (contentChildView)
  {
    [(UIView *)contentChildView frame];
    -[UIView setFrame:](self->_contentChildView, "setFrame:", 0.0, MaxY - v18);
  }
}

- (UIView)contentChildView
{
  return self->_contentChildView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_contentChildView, 0);
}

@end