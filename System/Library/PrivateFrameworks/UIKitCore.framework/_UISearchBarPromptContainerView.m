@interface _UISearchBarPromptContainerView
- (BOOL)_isKnownUISearchBarComponentContainer;
- (BOOL)useMini;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)contentInset;
- (UILabel)promptLabel;
- (id)description;
- (int64_t)barMetrics;
- (void)layoutSubviews;
- (void)setBarMetrics:(int64_t)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setPromptLabel:(id)a3;
@end

@implementation _UISearchBarPromptContainerView

- (BOOL)useMini
{
  return self->_barMetrics == 102;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(UILabel *)self->_promptLabel text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    BOOL v7 = [(_UISearchBarPromptContainerView *)self useMini];
    double v8 = 22.0;
    if (!v7) {
      double v8 = 34.0;
    }
  }
  else
  {
    double v8 = 0.0;
  }
  double v9 = width;
  result.height = v8;
  result.CGFloat width = v9;
  return result;
}

- (void)layoutSubviews
{
  v3 = [(UILabel *)self->_promptLabel text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    [(UIView *)self bounds];
    double top = self->_contentInset.top;
    double left = self->_contentInset.left;
    CGFloat v8 = v7 + left;
    CGFloat v10 = v9 + top;
    double v31 = v9 + top;
    double v32 = v7 + left;
    double v12 = v11 - (left + self->_contentInset.right);
    double v14 = v13 - (top + self->_contentInset.bottom);
    [(UIView *)self->_promptLabel sizeToFit];
    [(UIView *)self->_promptLabel frame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v34.origin.x = v8;
    v34.origin.y = v10;
    v34.size.CGFloat width = v12;
    v34.size.height = v14;
    CGRectGetWidth(v34);
    v35.origin.x = v16;
    v35.origin.y = v18;
    v35.size.CGFloat width = v20;
    v35.size.height = v22;
    CGRectGetWidth(v35);
    UIFloorToViewScale(self);
    double v24 = v23;
    if ([(_UISearchBarPromptContainerView *)self useMini]) {
      double v25 = 3.0;
    }
    else {
      double v25 = 12.0;
    }
    v36.origin.x = v24;
    v36.origin.y = v18;
    v36.size.CGFloat width = v20;
    v36.size.height = v22;
    double Height = CGRectGetHeight(v36);
    [(UILabel *)self->_promptLabel _baselineOffsetFromBottom];
    double v28 = v27;
    v37.origin.y = v31;
    v37.origin.x = v32;
    v37.size.CGFloat width = v12;
    v37.size.height = v14;
    double MaxY = CGRectGetMaxY(v37);
    promptLabel = self->_promptLabel;
    -[UILabel setFrame:](promptLabel, "setFrame:", v24, v28 - Height + MaxY - v25, v20, v22);
  }
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarPromptContainerView;
  v3 = [(UIView *)&v16 description];
  if (os_variant_has_internal_diagnostics())
  {
    v5 = [(UILabel *)self->_promptLabel text];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      double v7 = [(UILabel *)self->_promptLabel text];
      uint64_t v8 = [v3 stringByAppendingFormat:@" %@", v7];

      v3 = (void *)v8;
    }
    int64_t barMetrics = self->_barMetrics;
    if (barMetrics)
    {
      CGFloat v10 = _UIBarMetricsDebugDescription(barMetrics);
      uint64_t v11 = [v3 stringByAppendingFormat:@" %@", v10];

      v3 = (void *)v11;
    }
    double top = self->_contentInset.top;
    double left = self->_contentInset.left;
    double right = self->_contentInset.right;
    if (left != 0.0 || top != 0.0 || right != 0.0 || self->_contentInset.bottom != 0.0)
    {
      uint64_t v15 = [v3 stringByAppendingFormat:@" contentInset={%g, %g, %g, %g}", *(void *)&top, *(void *)&left, *(void *)&self->_contentInset.bottom, *(void *)&right];

      v3 = (void *)v15;
    }
  }
  return v3;
}

- (int64_t)barMetrics
{
  return self->_barMetrics;
}

- (void)setBarMetrics:(int64_t)a3
{
  self->_int64_t barMetrics = a3;
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

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)_isKnownUISearchBarComponentContainer
{
  return 1;
}

@end