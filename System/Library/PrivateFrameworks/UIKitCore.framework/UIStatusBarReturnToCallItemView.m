@interface UIStatusBarReturnToCallItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)neededSizeForImageSet:(id)a3;
- (id)_appBundleIdentifier;
- (int64_t)buttonType;
- (void)layoutSubviews;
@end

@implementation UIStatusBarReturnToCallItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [v6 doubleHeightStatus];
  v8 = [(UILabel *)self->_textLabel text];
  char v9 = [v8 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    textLabel = self->_textLabel;
    if (!v7 || textLabel)
    {
      [(UILabel *)textLabel setText:v7];
    }
    else
    {
      v11 = objc_alloc_init(UILabel);
      v12 = self->_textLabel;
      self->_textLabel = v11;

      v13 = [(UIStatusBarItemView *)self foregroundStyle];
      v14 = [v13 textFontForStyle:4];
      [(UILabel *)self->_textLabel setFont:v14];

      v15 = +[UIColor whiteColor];
      [(UILabel *)self->_textLabel setTextColor:v15];

      [(UILabel *)self->_textLabel setTextAlignment:1];
      [(UIView *)self addSubview:self->_textLabel];
      [(UILabel *)self->_textLabel setText:v7];
      v16 = [(UIStatusBarItemView *)self layoutManager];
      [(UIStatusBarButtonActionItemView *)self updateContentsAndWidth];
      objc_msgSend(v16, "itemView:sizeChangedBy:", self);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarReturnToCallItemView;
  BOOL v17 = [(UIStatusBarItemView *)&v19 updateForNewData:v6 actions:v4];

  return v17;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarReturnToCallItemView;
  [(UIStatusBarButtonActionItemView *)&v19 layoutSubviews];
  [(UIView *)self bounds];
  if (self->_textLabel)
  {
    double v6 = v3;
    double v7 = v4;
    double v8 = v5;
    char v9 = [(UIStatusBarItemView *)self foregroundStyle];
    [v9 height];
    double v11 = v10;

    double v12 = v6 + (v7 - v11) * 0.5;
    -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v11, v8);
    double v14 = v13;
    v15 = [(UIStatusBarAppIconItemView *)self contentsImage];
    v16 = [v15 image];
    [v16 size];
    double v18 = v17 + 8.0;

    -[UILabel setFrame:](self->_textLabel, "setFrame:", v12, v18, v11, v14);
  }
}

- (double)neededSizeForImageSet:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarReturnToCallItemView;
  [(UIStatusBarItemView *)&v10 neededSizeForImageSet:a3];
  double v5 = v4;
  [(UIView *)self bounds];
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v8 = v7 + 8.0;
  if (v7 <= 0.0) {
    double v8 = -0.0;
  }
  return v5 + v8;
}

- (id)_appBundleIdentifier
{
  return @"com.apple.mobilephone";
}

- (int64_t)buttonType
{
  return 2;
}

- (void).cxx_destruct
{
}

@end