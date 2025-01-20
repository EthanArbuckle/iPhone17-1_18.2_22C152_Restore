@interface SUNavigationButton
- (CGRect)_accessoryViewRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)accessoryViewInsets;
- (UIView)accessoryView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewInsets:(UIEdgeInsets)a3;
@end

@implementation SUNavigationButton

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationButton;
  [(UINavigationButton *)&v3 dealloc];
}

- (void)setAccessoryView:(id)a3
{
  accessoryView = self->_accessoryView;
  if (accessoryView != a3)
  {
    [(UIView *)accessoryView removeFromSuperview];

    v6 = (UIView *)a3;
    self->_accessoryView = v6;
    if (v6)
    {
      [(SUNavigationButton *)self addSubview:v6];
    }
  }
}

- (void)setAccessoryViewInsets:(UIEdgeInsets)a3
{
  if (self->_accessoryViewInsets.left != a3.left
    || self->_accessoryViewInsets.top != a3.top
    || self->_accessoryViewInsets.right != a3.right
    || self->_accessoryViewInsets.bottom != a3.bottom)
  {
    self->_accessoryViewInsets = a3;
    [(SUNavigationButton *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  if (self->_accessoryView)
  {
    [(SUNavigationButton *)self bounds];
    -[SUNavigationButton contentRectForBounds:](self, "contentRectForBounds:");
    accessoryView = self->_accessoryView;
    -[SUNavigationButton _accessoryViewRectForContentRect:](self, "_accessoryViewRectForContentRect:");
    -[UIView setFrame:](accessoryView, "setFrame:");
  }
  v4.receiver = self;
  v4.super_class = (Class)SUNavigationButton;
  [(UINavigationButton *)&v4 layoutSubviews];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUNavigationButton;
  -[UINavigationButton sizeThatFits:](&v13, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    [(UIView *)accessoryView frame];
    if (v7 < v10 + self->_accessoryViewInsets.top + self->_accessoryViewInsets.bottom) {
      double v7 = v10 + self->_accessoryViewInsets.top + self->_accessoryViewInsets.bottom;
    }
    double v5 = v5 + v9 + self->_accessoryViewInsets.left + self->_accessoryViewInsets.right;
  }
  double v11 = v5;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SUNavigationButton;
  -[SUNavigationButton titleRectForContentRect:](&v24, sel_titleRectForContentRect_);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (self->_accessoryView)
  {
    -[SUNavigationButton _accessoryViewRectForContentRect:](self, "_accessoryViewRectForContentRect:", x, y, width, height);
    double v16 = v15;
    [(SUNavigationButton *)self titleEdgeInsets];
    double v18 = x + v17;
    double v19 = v16 - (x + v17);
    if (v12 >= v19) {
      double v12 = v19;
    }
    float v20 = (v19 - v12) * 0.5;
    double v8 = v18 + floorf(v20);
  }
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v8;
  return result;
}

- (CGRect)_accessoryViewRectForContentRect:(CGRect)a3
{
  double y = a3.origin.y;
  double top = self->_accessoryViewInsets.top;
  double left = self->_accessoryViewInsets.left;
  CGFloat v6 = a3.origin.x + left;
  CGFloat v7 = y + top;
  CGFloat v8 = a3.size.width - (left + self->_accessoryViewInsets.right);
  CGFloat v9 = a3.size.height - (top + self->_accessoryViewInsets.bottom);
  [(UIView *)self->_accessoryView frame];
  double v11 = v10;
  double v13 = v12;
  v19.origin.double x = v6;
  v19.origin.double y = v7;
  v19.size.double width = v8;
  v19.size.double height = v9;
  double v14 = CGRectGetMaxX(v19) - v11;
  float v15 = (v9 - v13) * 0.5;
  double v16 = y + floorf(v15);
  double v17 = v11;
  double v18 = v13;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v14;
  return result;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIEdgeInsets)accessoryViewInsets
{
  double top = self->_accessoryViewInsets.top;
  double left = self->_accessoryViewInsets.left;
  double bottom = self->_accessoryViewInsets.bottom;
  double right = self->_accessoryViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end