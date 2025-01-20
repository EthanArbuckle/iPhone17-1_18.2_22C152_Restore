@interface SearchUILayoutFooterView
+ (id)reuseIdentifier;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIView)footerView;
- (void)layoutSubviews;
- (void)setFooterView:(id)a3;
@end

@implementation SearchUILayoutFooterView

+ (id)reuseIdentifier
{
  return @"searchLayoutFooter";
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  v6 = [(SearchUILayoutFooterView *)self footerView];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", width, 0.0);
  double v8 = v7;

  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)setFooterView:(id)a3
{
  v5 = (UIView *)a3;
  footerView = self->_footerView;
  double v7 = v5;
  if (footerView != v5)
  {
    [(UIView *)footerView removeFromSuperview];
    [(SearchUILayoutFooterView *)self addSubview:v7];
    objc_storeStrong((id *)&self->_footerView, a3);
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUILayoutFooterView;
  [(SearchUILayoutFooterView *)&v12 layoutSubviews];
  [(SearchUILayoutFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SearchUILayoutFooterView *)self footerView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
}

@end