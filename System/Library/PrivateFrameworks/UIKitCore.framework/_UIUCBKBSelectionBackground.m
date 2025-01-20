@interface _UIUCBKBSelectionBackground
- (BOOL)showButtonShape;
- (CGSize)intrinsicContentSize;
- (_UIUCBKBSelectionBackground)initWithFrame:(CGRect)a3;
- (void)_updateBackgroundProvidingView;
- (void)layoutSubviews;
- (void)setShowButtonShape:(BOOL)a3;
@end

@implementation _UIUCBKBSelectionBackground

- (_UIUCBKBSelectionBackground)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIUCBKBSelectionBackground;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIUCBKBSelectionBackground *)v3 _updateBackgroundProvidingView];
  }
  return v4;
}

- (void)setShowButtonShape:(BOOL)a3
{
  if (self->_showButtonShape != a3)
  {
    self->_showButtonShape = a3;
    [(_UIUCBKBSelectionBackground *)self _updateBackgroundProvidingView];
  }
}

- (void)_updateBackgroundProvidingView
{
  BOOL showButtonShape = self->_showButtonShape;
  backgroundProvidingView = self->_backgroundProvidingView;
  if (showButtonShape)
  {
    if (!backgroundProvidingView)
    {
      objc_super v6 = [UIView alloc];
      v7 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v8 = self->_backgroundProvidingView;
      self->_backgroundProvidingView = v7;

      [(UIView *)self->_backgroundProvidingView _setContinuousCornerRadius:4.0];
      v9 = [(UIView *)self layer];
      [v9 setAllowsGroupBlending:0];

      v10 = self->_backgroundProvidingView;
      [(UIView *)self addSubview:v10];
    }
  }
  else
  {
    [(UIView *)backgroundProvidingView removeFromSuperview];
    v5 = self->_backgroundProvidingView;
    self->_backgroundProvidingView = 0;
  }
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_backgroundProvidingView, "setFrame:");
  v3 = +[UIKeyboardImpl activeInstance];
  v4 = [v3 _inheritedRenderConfig];
  int v5 = [v4 lightKeyboard];

  if (v5)
  {
    objc_super v6 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorGray_Percent55")];
    [(UIView *)self->_backgroundProvidingView setBackgroundColor:v6];

    id v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A008]];
    v7 = [(UIView *)self->_backgroundProvidingView layer];
    [v7 setCompositingFilter:v9];
  }
  else
  {
    v8 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBColorKeyGrayKeyDarkBackground")];
    [(UIView *)self->_backgroundProvidingView setBackgroundColor:v8];

    id v9 = [(UIView *)self->_backgroundProvidingView layer];
    [v9 setCompositingFilter:0];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 36.0;
  double v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)showButtonShape
{
  return self->_showButtonShape;
}

- (void).cxx_destruct
{
}

@end