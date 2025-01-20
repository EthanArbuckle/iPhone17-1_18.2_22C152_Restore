@interface MTSeparatorFooterView
+ (double)heightForSeparatorInsets:(UIEdgeInsets)a3;
- (CGRect)floatingRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTSeparatorFooterView)initWithReuseIdentifier:(id)a3;
- (UIEdgeInsets)separatorInsets;
- (UIView)dividerView;
- (void)layoutSubviews;
- (void)setDividerView:(id)a3;
- (void)setFloatingRect:(CGRect)a3;
- (void)setSeparatorInsets:(UIEdgeInsets)a3;
@end

@implementation MTSeparatorFooterView

+ (double)heightForSeparatorInsets:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  double top = a3.top;
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  return bottom + top + 1.0 / v7;
}

- (MTSeparatorFooterView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTSeparatorFooterView;
  v3 = [(MTSeparatorFooterView *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)UIView);
    [(MTSeparatorFooterView *)v3 setBackgroundView:v4];

    [(MTSeparatorFooterView *)v3 setPreservesSuperviewLayoutMargins:1];
    v5 = [(MTSeparatorFooterView *)v3 contentView];
    double v6 = [(MTSeparatorFooterView *)v3 dividerView];
    [v5 addSubview:v6];
  }
  return v3;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  if (self->_separatorInsets.left != a3.left
    || self->_separatorInsets.top != a3.top
    || self->_separatorInsets.right != a3.right
    || self->_separatorInsets.bottom != a3.bottom)
  {
    self->_separatorInsets = a3;
    [(MTSeparatorFooterView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)MTSeparatorFooterView;
  [(MTSeparatorFooterView *)&v14 layoutSubviews];
  [(MTSeparatorFooterView *)self separatorInsets];
  double v4 = v3;
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  double v8 = 1.0 / v7;
  v9 = [(MTSeparatorFooterView *)self contentView];
  [v9 bounds];
  double v10 = CGRectGetWidth(v15) - v4;

  if ([(MTSeparatorFooterView *)self mt_isRTL]) {
    double v4 = 0.0;
  }
  [(MTSeparatorFooterView *)self separatorInsets];
  double v12 = v11;
  v13 = [(MTSeparatorFooterView *)self dividerView];
  [v13 setFrame:v4, v12, v10, v8];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = objc_opt_class();
  [(MTSeparatorFooterView *)self separatorInsets];
  [v5 heightForSeparatorInsets:];
  double v7 = v6;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (UIView)dividerView
{
  dividerView = self->_dividerView;
  if (!dividerView)
  {
    double v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_dividerView;
    self->_dividerView = v4;

    double v6 = +[UIColor dividerColor];
    [(UIView *)self->_dividerView setBackgroundColor:v6];

    dividerView = self->_dividerView;
  }

  return dividerView;
}

- (UIEdgeInsets)separatorInsets
{
  double top = self->_separatorInsets.top;
  double left = self->_separatorInsets.left;
  double bottom = self->_separatorInsets.bottom;
  double right = self->_separatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)floatingRect
{
  double x = self->_floatingRect.origin.x;
  double y = self->_floatingRect.origin.y;
  double width = self->_floatingRect.size.width;
  double height = self->_floatingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFloatingRect:(CGRect)a3
{
  self->_floatingRect = a3;
}

- (void)setDividerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end