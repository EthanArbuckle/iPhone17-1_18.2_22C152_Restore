@interface UIStatusBarActivityItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)shadowPadding;
- (double)updateContentsAndWidth;
- (id)accessibilityHUDRepresentation;
- (int64_t)_activityIndicatorStyle;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)setVisible:(BOOL)a3;
@end

@implementation UIStatusBarActivityItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  int slowActivity = self->_slowActivity;
  unsigned int v7 = *(unsigned __int8 *)(v5 + 2272);
  int v8 = (v7 >> 1) & 1;
  BOOL result = slowActivity != v8;
  if (slowActivity != v8)
  {
    self->_int slowActivity = (v7 & 2) != 0;
    unsigned int v7 = *(unsigned __int8 *)(v5 + 2272);
  }
  BOOL v10 = (v7 >> 2) & 1;
  if (self->_syncActivity != v10)
  {
    self->_syncActivity = v10;
    return 1;
  }
  return result;
}

- (int64_t)_activityIndicatorStyle
{
  v3 = [(UIStatusBarItemView *)self foregroundStyle];
  int64_t v4 = [v3 activityIndicatorStyleWithSyncActivity:self->_syncActivity];

  return v4;
}

- (void)_startAnimating
{
  if ([(UIStatusBarItemView *)self isVisible]
    && ![(UIActivityIndicatorView *)self->_activityIndicator isAnimating])
  {
    [(UIStatusBarItemView *)self beginDisablingRasterization];
    activityIndicator = self->_activityIndicator;
    [(UIActivityIndicatorView *)activityIndicator startAnimating];
  }
}

- (void)_stopAnimating
{
  if (![(UIStatusBarItemView *)self isVisible]
    && [(UIActivityIndicatorView *)self->_activityIndicator isAnimating])
  {
    [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
    [(UIActivityIndicatorView *)self->_accessibilityHUDIndicator stopAnimating];
    [(UIStatusBarItemView *)self endDisablingRasterization];
  }
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarActivityItemView;
  -[UIStatusBarItemView setVisible:](&v5, sel_setVisible_);
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopAnimating object:0];
  if (v3)
  {
    [(UIStatusBarActivityItemView *)self _startAnimating];
  }
  else
  {
    +[UIView _currentAnimationDuration];
    -[UIStatusBarActivityItemView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stopAnimating, 0);
  }
}

- (double)updateContentsAndWidth
{
  int64_t v3 = [(UIStatusBarActivityItemView *)self _activityIndicatorStyle];
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    double v5 = 0.0;
    if ([(UIActivityIndicatorView *)activityIndicator activityIndicatorViewStyle] == v3) {
      goto LABEL_7;
    }
    activityIndicator = self->_activityIndicator;
  }
  [(UIView *)activityIndicator removeFromSuperview];
  v6 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:v3];
  unsigned int v7 = self->_activityIndicator;
  self->_activityIndicator = v6;

  [(UIView *)self->_activityIndicator frame];
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self bounds];
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", 0.0, floor((v12 - v11) * 0.5), v9, v11);
  [(UIView *)self addSubview:self->_activityIndicator];
  v13 = [(UIStatusBarItemView *)self foregroundStyle];
  if ([v13 usesVerticalLayout]) {
    double v9 = v11;
  }

  [(UIStatusBarItemView *)self adjustFrameToNewSize:v9];
  double v5 = v14;
LABEL_7:
  v15 = [(UIStatusBarItemView *)self foregroundStyle];
  v16 = [v15 tintColor];

  [(UIActivityIndicatorView *)self->_activityIndicator setColor:v16];
  v17 = (double *)((char *)&unk_186B9C260 + 8 * !self->_slowActivity);
  if (self->_syncActivity) {
    v17 = (double *)((char *)&unk_186B9C250 + 8 * !self->_slowActivity);
  }
  [(UIActivityIndicatorView *)self->_activityIndicator setAnimationDuration:*v17];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopAnimating object:0];
  [(UIStatusBarActivityItemView *)self _startAnimating];

  return v5;
}

- (double)shadowPadding
{
  double result = 0.0;
  if (!self->_syncActivity)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIStatusBarActivityItemView;
    [(UIStatusBarItemView *)&v3 shadowPadding];
  }
  return result;
}

- (id)accessibilityHUDRepresentation
{
  if ([(UIStatusBarActivityItemView *)self _activityIndicatorStyle] == 6)
  {
    accessibilityHUDIndicator = self->_accessibilityHUDIndicator;
    if (!accessibilityHUDIndicator)
    {
      int64_t v4 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:101];
      double v5 = self->_accessibilityHUDIndicator;
      self->_accessibilityHUDIndicator = v4;

      v6 = self->_accessibilityHUDIndicator;
      unsigned int v7 = +[UIColor colorWithWhite:0.25 alpha:1.0];
      [(UIActivityIndicatorView *)v6 setColor:v7];

      accessibilityHUDIndicator = self->_accessibilityHUDIndicator;
    }
    [(UIActivityIndicatorView *)accessibilityHUDIndicator setAnimationDuration:dbl_186B9C260[!self->_slowActivity]];
    if ([(UIActivityIndicatorView *)self->_activityIndicator isAnimating]
      && ![(UIActivityIndicatorView *)self->_accessibilityHUDIndicator isAnimating])
    {
      [(UIActivityIndicatorView *)self->_accessibilityHUDIndicator startAnimating];
    }
    double v8 = [[UIAccessibilityHUDItem alloc] initWithCustomView:self->_accessibilityHUDIndicator];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityHUDIndicator, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end