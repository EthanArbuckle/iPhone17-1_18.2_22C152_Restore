@interface UIKBFocusVCView
- (BOOL)_isEligibleForFocusGivenAlpha;
- (BOOL)isEligibleForFocusWithZeroAlpha;
- (id)preferredFocusedView;
- (void)setIsEligibleForFocusWithZeroAlpha:(BOOL)a3;
@end

@implementation UIKBFocusVCView

- (BOOL)_isEligibleForFocusGivenAlpha
{
  if ([(UIKBFocusVCView *)self isEligibleForFocusWithZeroAlpha]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBFocusVCView;
  return [(UIView *)&v4 _isEligibleForFocusGivenAlpha];
}

- (id)preferredFocusedView
{
  v2 = [(UIView *)self nextResponder];
  v3 = __UIFocusEnvironmentPreferredFocusedView(v2, 0);

  return v3;
}

- (BOOL)isEligibleForFocusWithZeroAlpha
{
  return self->_isEligibleForFocusWithZeroAlpha;
}

- (void)setIsEligibleForFocusWithZeroAlpha:(BOOL)a3
{
  self->_isEligibleForFocusWithZeroAlpha = a3;
}

@end