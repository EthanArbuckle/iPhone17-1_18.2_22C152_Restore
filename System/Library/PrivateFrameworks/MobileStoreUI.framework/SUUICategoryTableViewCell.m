@interface SUUICategoryTableViewCell
- (CGSize)expectedImageSize;
- (SUUICategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setExpectedImageSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SUUICategoryTableViewCell

- (SUUICategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SUUICategoryTableViewCell;
  v4 = [(SUUICategoryTableViewCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SUUICategoryTableViewCell *)v4 textLabel];
    v7 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v6 setFont:v7];

    v8 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v6 setTextColor:v8];

    v9 = [MEMORY[0x263F825C8] clearColor];
    [v6 setBackgroundColor:v9];

    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v5->_separatorView;
    v5->_separatorView = v10;

    v12 = v5->_separatorView;
    v13 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(SUUICategoryTableViewCell *)v5 addSubview:v5->_separatorView];
    v5->_layoutNeedsLayout = 1;
  }
  return v5;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  if (self->_expectedImageSize.width != a3.width || self->_expectedImageSize.height != a3.height)
  {
    self->_expectedImageSize = a3;
    [(SUUICategoryTableViewCell *)self setNeedsLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUICategoryTableViewCell *)self bounds];
  if (v9 != width || v8 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUICategoryTableViewCell;
  -[SUUICategoryTableViewCell setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUICategoryTableViewCell *)self frame];
  if (v9 != width || v8 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUICategoryTableViewCell;
  -[SUUICategoryTableViewCell setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SUUICategoryTableViewCell;
  [(SUUICategoryTableViewCell *)&v21 layoutSubviews];
  if (self->_layoutNeedsLayout)
  {
    [(SUUICategoryTableViewCell *)self bounds];
    double v4 = v3;
    double v6 = v5;
    v7 = [(SUUICategoryTableViewCell *)self imageView];
    double v8 = [v7 image];

    if (v8)
    {
      [v7 frame];
      double v10 = v9;
      objc_msgSend(v7, "setFrame:", 15.0, (v6 - v11) * 0.5);
      double v12 = v10 + 15.0 + 15.0;
    }
    else
    {
      double width = self->_expectedImageSize.width;
      double v12 = 15.0;
      if (width > 0.0) {
        double v12 = width + 15.0 + 15.0;
      }
    }
    v14 = [(SUUICategoryTableViewCell *)self textLabel];
    objc_super v15 = v14;
    if (v14)
    {
      [v14 sizeToFit];
      [v15 frame];
      objc_msgSend(v15, "setFrame:", v12, (v6 - v16) * 0.5, v4 - v12 + -15.0);
    }
    separatorView = self->_separatorView;
    if (separatorView)
    {
      [(UIView *)separatorView frame];
      v18 = [MEMORY[0x263F82B60] mainScreen];
      [v18 scale];
      double v20 = 1.0 / v19;

      -[UIView setFrame:](self->_separatorView, "setFrame:", 15.0, v6 - v20, v4 + -15.0, v20);
    }
  }
  self->_layoutNeedsLayout = 0;
}

- (CGSize)expectedImageSize
{
  double width = self->_expectedImageSize.width;
  double height = self->_expectedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end