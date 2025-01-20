@interface _UIActivityIndicatorViewStyleView
- (BOOL)animating;
- (BOOL)hidesWhenStopped;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIActivityIndicatorProvider)provider;
- (UIColor)color;
- (_UIActivityIndicatorViewStyleView)initWithProvider:(id)a3;
- (int64_t)activityIndicatorViewStyle;
- (void)setActivityIndicatorViewStyle:(int64_t)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setHidesWhenStopped:(BOOL)a3;
@end

@implementation _UIActivityIndicatorViewStyleView

- (_UIActivityIndicatorViewStyleView)initWithProvider:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIActivityIndicatorViewStyleView;
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v7 = a3;
  v8 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, v3, v4, v5, v6);
  objc_storeWeak((id *)&v8->_provider, v7);

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 30.0;
  double v4 = 30.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)activityIndicatorViewStyle
{
  return self->_activityIndicatorViewStyle;
}

- (void)setActivityIndicatorViewStyle:(int64_t)a3
{
  self->_activityIndicatorViewStyle = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)hidesWhenStopped
{
  return self->_hidesWhenStopped;
}

- (void)setHidesWhenStopped:(BOOL)a3
{
  self->_hidesWhenStopped = a3;
}

- (UIActivityIndicatorProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (UIActivityIndicatorProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_color, 0);
}

@end