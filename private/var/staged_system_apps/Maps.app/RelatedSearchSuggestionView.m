@interface RelatedSearchSuggestionView
- (BOOL)showCloseButton;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (MapsThemeButton)closeButton;
- (UIScrollView)scrollView;
- (UIVisualEffectView)blurView;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAlpha:(double)a3;
- (void)setAlpha:(double)a3 animated:(BOOL)a4;
- (void)setBlurView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setShowCloseButton:(BOOL)a3;
@end

@implementation RelatedSearchSuggestionView

- (void)setAlpha:(double)a3
{
}

- (void)setAlpha:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(RelatedSearchSuggestionView *)self alpha];
  if (v7 != a3)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100B6C484;
    v12[3] = &unk_1012E69C0;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    v8 = objc_retainBlock(v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B6C540;
    v11[3] = &unk_1012E7D28;
    v11[4] = self;
    v9 = objc_retainBlock(v11);
    [(RelatedSearchSuggestionView *)self endEditing:1];
    [(RelatedSearchSuggestionView *)self setUserInteractionEnabled:0];
    if (v4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100B6C54C;
      v10[3] = &unk_1012E5D08;
      v10[4] = self;
      +[UIView performWithoutAnimation:v10];
      +[UIView animateWithDuration:v8 animations:v9 completion:0.25];
    }
    else
    {
      ((void (*)(void *))v8[2])(v8);
      ((void (*)(void *, uint64_t))v9[2])(v9, 1);
    }
  }
}

- (void)setShowCloseButton:(BOOL)a3
{
  if (self->_showCloseButton != a3)
  {
    self->_showCloseButton = a3;
    [(RelatedSearchSuggestionView *)self setNeedsLayout];
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width = a3.width;
  [(RelatedSearchSuggestionView *)self intrinsicContentSize];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(RelatedSearchSuggestionView *)self safeAreaInsets];
  double v3 = v2 + 49.0;
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.CGFloat width = v4;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)RelatedSearchSuggestionView;
  [(RelatedSearchSuggestionView *)&v3 safeAreaInsetsDidChange];
  [(RelatedSearchSuggestionView *)self invalidateIntrinsicContentSize];
  [(RelatedSearchSuggestionView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)RelatedSearchSuggestionView;
  [(RelatedSearchSuggestionView *)&v28 layoutSubviews];
  [(RelatedSearchSuggestionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blurView);
  [WeakRetained setFrame:v4, v6, v8, v10];

  [(RelatedSearchSuggestionView *)self bounds];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  if (CGRectGetHeight(v29) > 49.0)
  {
    [(RelatedSearchSuggestionView *)self safeAreaInsets];
    double height = height - v16;
  }
  if (self->_showCloseButton)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_closeButton);
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    double width = width - (v23 + 30.0);
    id v26 = objc_loadWeakRetained((id *)&self->_closeButton);
    [v26 setFrame:v19 + width + 15.0, v21 + round((height - v25) * 0.5), v23, v25];
  }
  id v27 = objc_loadWeakRetained((id *)&self->_scrollView);
  [v27 setFrame:CGRectMake(x, y, width, height)];
}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

- (UIVisualEffectView)blurView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blurView);

  return (UIVisualEffectView *)WeakRetained;
}

- (void)setBlurView:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (MapsThemeButton)closeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closeButton);

  return (MapsThemeButton *)WeakRetained;
}

- (void)setCloseButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_closeButton);
  objc_destroyWeak((id *)&self->_scrollView);

  objc_destroyWeak((id *)&self->_blurView);
}

@end