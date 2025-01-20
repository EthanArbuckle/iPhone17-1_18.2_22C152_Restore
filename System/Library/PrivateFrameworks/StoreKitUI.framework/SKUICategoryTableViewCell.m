@interface SKUICategoryTableViewCell
- (CGSize)expectedImageSize;
- (SKUICategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setExpectedImageSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SKUICategoryTableViewCell

- (SKUICategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICategoryTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICategoryTableViewCell;
  v7 = [(SKUICategoryTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(SKUICategoryTableViewCell *)v7 textLabel];
    v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v9 setFont:v10];

    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v9 setTextColor:v11];

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v12];

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v8->_separatorView;
    v8->_separatorView = v13;

    v15 = v8->_separatorView;
    v16 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(SKUICategoryTableViewCell *)v8 addSubview:v8->_separatorView];
    v8->_layoutNeedsLayout = 1;
  }
  return v8;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  if (self->_expectedImageSize.width != a3.width || self->_expectedImageSize.height != a3.height)
  {
    self->_expectedImageSize = a3;
    [(SKUICategoryTableViewCell *)self setNeedsLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SKUICategoryTableViewCell *)self bounds];
  if (v9 != width || v8 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUICategoryTableViewCell;
  -[SKUICategoryTableViewCell setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SKUICategoryTableViewCell *)self frame];
  if (v9 != width || v8 != height) {
    self->_layoutNeedsLayout = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUICategoryTableViewCell;
  -[SKUICategoryTableViewCell setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SKUICategoryTableViewCell;
  [(SKUICategoryTableViewCell *)&v21 layoutSubviews];
  if (self->_layoutNeedsLayout)
  {
    [(SKUICategoryTableViewCell *)self bounds];
    double v4 = v3;
    double v6 = v5;
    v7 = [(SKUICategoryTableViewCell *)self imageView];
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
    v14 = [(SKUICategoryTableViewCell *)self textLabel];
    v15 = v14;
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
      objc_super v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
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

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICategoryTableViewCell initWithStyle:reuseIdentifier:]";
}

@end