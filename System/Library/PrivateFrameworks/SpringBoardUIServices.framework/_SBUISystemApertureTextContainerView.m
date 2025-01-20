@interface _SBUISystemApertureTextContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)transitionSize;
- (id)initWithContentLabel:(id *)a1;
- (uint64_t)contentLabel;
- (void)layoutSubviews;
- (void)setTransitionSize:(double)a3;
@end

@implementation _SBUISystemApertureTextContainerView

- (id)initWithContentLabel:(id *)a1
{
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    [v4 bounds];
    v8.receiver = a1;
    v8.super_class = (Class)_SBUISystemApertureTextContainerView;
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

- (void)setTransitionSize:(double)a3
{
  if (a1)
  {
    if (*((double *)a1 + 52) != a3 || *((double *)a1 + 53) != a4)
    {
      *((double *)a1 + 52) = a3;
      *((double *)a1 + 53) = a4;
      return (void *)[a1 setNeedsLayout];
    }
  }
  return a1;
}

- (void)layoutSubviews
{
  v2 = self;
  v13.receiver = self;
  v13.super_class = (Class)_SBUISystemApertureTextContainerView;
  [(_SBUISystemApertureTextContainerView *)&v13 layoutSubviews];
  [(_SBUISystemApertureTextContainerView *)v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (!v2
    || (double width = v2->_transitionSize.width,
        double height = v2->_transitionSize.height,
        v2 = v2->_contentLabel,
        width == 0.0)
    && height == 0.0)
  {
    -[_SBUISystemApertureTextContainerView setBounds:](v2, "setBounds:", v4, v6, v8, v10);
  }
  UIRectGetCenter();
  -[_SBUISystemApertureTextContainerView setCenter:](v2, "setCenter:");
}

- (double)transitionSize
{
  if (a1) {
    return *(double *)(a1 + 416);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)contentLabel
{
  if (result) {
    return *(void *)(result + 408);
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self)
  {
    if (self->_transitionSize.width != 0.0 || self->_transitionSize.height != 0.0)
    {
      double width = self->_transitionSize.width;
      double height = self->_transitionSize.height;
      goto LABEL_7;
    }
    self = (_SBUISystemApertureTextContainerView *)self->_contentLabel;
  }
  -[_SBUISystemApertureTextContainerView sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
LABEL_7:
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)intrinsicContentSize
{
  if (!self) {
    goto LABEL_5;
  }
  double width = self->_transitionSize.width;
  double height = self->_transitionSize.height;
  if (width == 0.0 && height == 0.0)
  {
    self = (_SBUISystemApertureTextContainerView *)self->_contentLabel;
LABEL_5:
    [(_SBUISystemApertureTextContainerView *)self intrinsicContentSize];
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end