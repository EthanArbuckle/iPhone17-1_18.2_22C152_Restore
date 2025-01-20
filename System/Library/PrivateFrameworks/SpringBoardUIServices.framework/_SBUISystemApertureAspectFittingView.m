@interface _SBUISystemApertureAspectFittingView
- (CGSize)explicitIntrinsicSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)contentContainer;
- (id)initWithContentView:(id *)a1;
- (id)setContentContainer:(id *)result;
- (uint64_t)contentView;
- (void)layoutSubviews;
- (void)setExplicitIntrinsicSize:(CGSize)a3;
@end

@implementation _SBUISystemApertureAspectFittingView

- (id)initWithContentView:(id *)a1
{
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    [v4 bounds];
    v8.receiver = a1;
    v8.super_class = (Class)_SBUISystemApertureAspectFittingView;
    v6 = (id *)objc_msgSendSuper2(&v8, sel_initWithFrame_);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 51, a2);
      [a1 addSubview:v5];
    }
  }

  return a1;
}

- (id)setContentContainer:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 52, a2);
  }
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_SBUISystemApertureAspectFittingView;
  [(_SBUISystemApertureAspectFittingView *)&v13 layoutSubviews];
  [(_SBUISystemApertureAspectFittingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self) {
    contentView = self->_contentView;
  }
  else {
    contentView = 0;
  }
  v12 = contentView;
  -[UIView setBounds:](v12, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  -[UIView setCenter:](v12, "setCenter:");
}

- (uint64_t)contentView
{
  if (result) {
    return *(void *)(result + 408);
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != 0.0 && a3.height != 0.0)
  {
    [(_SBUISystemApertureAspectFittingView *)self explicitIntrinsicSize];
    double v8 = v7;
    double v9 = v6;
    if (v7 == 0.0 && v6 == 0.0)
    {
      if (self) {
        contentView = self->_contentView;
      }
      else {
        contentView = 0;
      }
      -[UIView sizeThatFits:](contentView, "sizeThatFits:", width, height);
      double v8 = v11;
      double v9 = v12;
    }
    if (!BSSizeLessThanSize() || v8 == 0.0 && v9 == 0.0)
    {
      double height = v9;
      double width = v8;
    }
    else
    {
      double v13 = v8 / width;
      if (v8 / width < v9 / height) {
        double v13 = v9 / height;
      }
      double v14 = 1.0 / v13;
      double width = v8 * v14;
      double height = v9 * v14;
    }
  }
  double v15 = width;
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(_SBUISystemApertureAspectFittingView *)self explicitIntrinsicSize];
  if (v3 == 0.0 && v4 == 0.0)
  {
    if (self) {
      contentView = self->_contentView;
    }
    else {
      contentView = 0;
    }
    [(UIView *)contentView intrinsicContentSize];
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)explicitIntrinsicSize
{
  double width = self->_explicitIntrinsicSize.width;
  double height = self->_explicitIntrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExplicitIntrinsicSize:(CGSize)a3
{
  self->_explicitIntrinsicSize = a3;
}

- (id)contentContainer
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 52);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end