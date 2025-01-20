@interface STUIStatusBarFocusableImageView
- (BOOL)canBecomeFocused;
- (BOOL)isUserInteractionEnabled;
- (UIColor)focusedImageTintColor;
- (void)applyStyleAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFocusedImageTintColor:(id)a3;
@end

@implementation STUIStatusBarFocusableImageView

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarFocusableImageView;
  id v4 = a3;
  [(STUIStatusBarImageView *)&v7 applyStyleAttributes:v4];
  objc_msgSend(v4, "imageTintColor", v7.receiver, v7.super_class);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

  unfocusedTintColor = self->_unfocusedTintColor;
  self->_unfocusedTintColor = v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v6 = [a3 nextFocusedItem];
  if (v6 == self)
  {
    v5 = [(STUIStatusBarFocusableImageView *)self focusedImageTintColor];
    [(STUIStatusBarFocusableImageView *)self setTintColor:v5];
  }
  else
  {
    [(STUIStatusBarFocusableImageView *)self setTintColor:self->_unfocusedTintColor];
  }
}

- (UIColor)focusedImageTintColor
{
  return self->_focusedImageTintColor;
}

- (void)setFocusedImageTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedImageTintColor, 0);
  objc_storeStrong((id *)&self->_unfocusedTintColor, 0);
}

@end