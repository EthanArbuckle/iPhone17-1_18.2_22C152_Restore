@interface MTNoContentTableViewCell
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTColorTheme)colorTheme;
- (MTNoContentTableViewCell)init;
- (MTNoContentTableViewCell)initWithReuseIdentifier:(id)a3;
- (MTNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)message;
- (UIEdgeInsets)_layoutMargins;
- (UIEdgeInsets)contentInset;
- (void)layoutSubviews;
- (void)setColorTheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setMessage:(id)a3;
- (void)set_layoutMargins:(UIEdgeInsets)a3;
- (void)setupCell;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTNoContentTableViewCell

+ (id)reuseIdentifier
{
  return @"kMTNoContentTableViewCellReuseIdentifier";
}

- (MTNoContentTableViewCell)init
{
  v3 = [(id)objc_opt_class() reuseIdentifier];
  v4 = [(MTNoContentTableViewCell *)self initWithReuseIdentifier:v3];

  return v4;
}

- (MTNoContentTableViewCell)initWithReuseIdentifier:(id)a3
{
  return [(MTNoContentTableViewCell *)self initWithStyle:0 reuseIdentifier:a3];
}

- (MTNoContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTNoContentTableViewCell;
  v4 = [(MTTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTNoContentTableViewCell *)v4 setSelectionStyle:0];
    -[MTNoContentTableViewCell setSeparatorInset:](v5, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v6 = +[UIColor clearColor];
    [(MTNoContentTableViewCell *)v5 setBackgroundColor:v6];
  }
  return v5;
}

- (void)setupCell
{
  v7.receiver = self;
  v7.super_class = (Class)MTNoContentTableViewCell;
  [(MTTableViewCell *)&v7 setupCell];
  [(MTNoContentTableViewCell *)self bounds];
  +[MTContentUnavailableView messageLabelWithFrame:](MTContentUnavailableView, "messageLabelWithFrame:");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  messageLabel = self->_messageLabel;
  self->_messageLabel = v3;

  [(UILabel *)self->_messageLabel setAutoresizingMask:18];
  v5 = [(MTNoContentTableViewCell *)self message];
  [(UILabel *)self->_messageLabel setText:v5];

  [(UILabel *)self->_messageLabel setAlpha:1.0];
  [(UILabel *)self->_messageLabel setOpaque:1];
  v6 = [(MTNoContentTableViewCell *)self contentView];
  [v6 addSubview:self->_messageLabel];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTNoContentTableViewCell;
  id v4 = a3;
  [(MTNoContentTableViewCell *)&v8 traitCollectionDidChange:v4];
  v5 = [(MTNoContentTableViewCell *)self traitCollection];
  id v6 = [v5 horizontalSizeClass];
  id v7 = [v4 horizontalSizeClass];

  if (v6 != v7) {
    [(MTNoContentTableViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MTNoContentTableViewCell;
  [(MTTableViewCell *)&v17 layoutSubviews];
  v3 = [(MTNoContentTableViewCell *)self contentView];
  [v3 bounds];
  CGRectGetHeight(v18);

  [(UILabel *)self->_messageLabel frame];
  -[UILabel setFrame:](self->_messageLabel, "setFrame:");
  UIUserInterfaceLayoutDirection v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(MTNoContentTableViewCell *)self semanticContentAttribute]];
  [(MTNoContentTableViewCell *)self contentInset];
  double v6 = v5;
  [(MTNoContentTableViewCell *)self contentInset];
  double v8 = v7;
  [(MTNoContentTableViewCell *)self bounds];
  double Width = CGRectGetWidth(v19);
  unsigned int v10 = [(MTNoContentTableViewCell *)self isHorizontallyRegular];
  v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = v12;

  if (v4)
  {
    if ([(MTNoContentTableViewCell *)self isHorizontallyRegular]) {
      double v14 = v8;
    }
    else {
      double v14 = 0.0;
    }
  }
  else
  {
    double v14 = v6;
  }
  double v15 = 0.0;
  if (v10) {
    double v15 = v8;
  }
  double v16 = Width - v6 - v15;
  [(MTNoContentTableViewCell *)self bounds];
  -[UIView setFrame:](self->super._separator, "setFrame:", v14, CGRectGetMaxY(v20) + -24.0 - 1.0 / v13, v16, 1.0 / v13);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTNoContentTableViewCell;
  -[MTNoContentTableViewCell sizeThatFits:](&v6, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 24.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
}

- (void)setColorTheme:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  double v5 = [v9 backgroundColor];
  if (v5)
  {
    [(MTNoContentTableViewCell *)self setBackgroundColor:v5];
  }
  else
  {
    objc_super v6 = +[UIColor whiteColor];
    [(MTNoContentTableViewCell *)self setBackgroundColor:v6];
  }
  double v7 = +[UIColor secondaryTextColorForTheme:v9];
  [(UILabel *)self->_messageLabel setTextColor:v7];

  double v8 = +[UIColor separatorColorForTheme:v9];
  [(UIView *)self->super._separator setBackgroundColor:v8];
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UIEdgeInsets)_layoutMargins
{
  double top = self->__layoutMargins.top;
  double left = self->__layoutMargins.left;
  double bottom = self->__layoutMargins.bottom;
  double right = self->__layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end