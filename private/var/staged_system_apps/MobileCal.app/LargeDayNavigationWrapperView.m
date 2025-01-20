@interface LargeDayNavigationWrapperView
- (LargeDayNavigationWrapperView)initWithNavigationView:(id)a3;
- (void)layoutSubviews;
@end

@implementation LargeDayNavigationWrapperView

- (LargeDayNavigationWrapperView)initWithNavigationView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LargeDayNavigationWrapperView;
  v6 = -[LargeDayNavigationWrapperView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationView, a3);
    [(LargeDayNavigationWrapperView *)v7 addSubview:v7->_navigationView];
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LargeDayNavigationWrapperView;
  [(LargeDayNavigationWrapperView *)&v3 layoutSubviews];
  [(LargeDayNavigationWrapperView *)self bounds];
  -[UIView setFrame:](self->_navigationView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end