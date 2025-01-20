@interface BFFImageContainerView
- (BFFImageContainerView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation BFFImageContainerView

- (BFFImageContainerView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)BFFImageContainerView;
  result = -[BFFImageContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (result)
  {
    result->_preferredSize.CGFloat width = width;
    result->_preferredSize.CGFloat height = height;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v3 = [(BFFImageContainerView *)self subviews];
  id v12 = [v3 firstObject];

  [(BFFImageContainerView *)self bounds];
  if (v12)
  {
    double v5 = v4;
    [v12 frame];
    double v7 = v6;
    double v9 = v8;
    [(BFFImageContainerView *)self bounds];
    float v11 = (v10 - v7) * 0.5;
    objc_msgSend(v12, "setFrame:", floorf(v11), v5 - v9, v7, v9);
  }
}

@end