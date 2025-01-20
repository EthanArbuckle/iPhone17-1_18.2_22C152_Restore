@interface CRLiOSInspectorDividerView
+ (UIColor)defaultDividerColor;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CRLiOSInspectorDividerView)initWithFrame:(CGRect)a3;
- (UIColor)dividerColor;
- (UIView)divider;
- (void)layoutSubviews;
- (void)setDivider:(id)a3;
- (void)setDividerColor:(id)a3;
@end

@implementation CRLiOSInspectorDividerView

+ (UIColor)defaultDividerColor
{
  return +[UIColor clearColor];
}

- (CRLiOSInspectorDividerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSInspectorDividerView;
  v3 = -[CRLiOSInspectorDividerView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    divider = v3->_divider;
    v3->_divider = v4;

    v6 = [(id)objc_opt_class() defaultDividerColor];
    [(UIView *)v3->_divider setBackgroundColor:v6];

    [(CRLiOSInspectorDividerView *)v3 addSubview:v3->_divider];
  }
  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CRLiOSInspectorDividerView;
  [(CRLiOSInspectorDividerView *)&v17 layoutSubviews];
  [(CRLiOSInspectorDividerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = +[UIApplication sharedApplication];
  v12 = [v11 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory) {
    double v14 = 2.0;
  }
  else {
    double v14 = 0.5;
  }
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double v15 = CGRectGetWidth(v18) - 16.0 - 16.0;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (CGRectGetHeight(v19) == v14) {
    -[UIView setFrame:](self->_divider, "setFrame:", 16.0, 0.0, v15, v14);
  }
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  if (CGRectGetHeight(v20) <= 1.0) {
    double v16 = v14;
  }
  else {
    double v16 = 8.0;
  }
  -[UIView setFrame:](self->_divider, "setFrame:", 16.0, v16, v15, v14);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5 = 16.0;
  result.height = v5;
  return result;
}

- (UIColor)dividerColor
{
  return [(UIView *)self->_divider backgroundColor];
}

- (void)setDividerColor:(id)a3
{
}

- (UIView)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end