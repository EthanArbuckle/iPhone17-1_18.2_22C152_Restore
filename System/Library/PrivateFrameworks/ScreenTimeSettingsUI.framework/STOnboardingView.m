@interface STOnboardingView
- (STOnboardingView)initWithTopInset:(double)a3;
- (UIEdgeInsets)safeAreaInsets;
- (double)topInset;
- (void)setTopInset:(double)a3;
@end

@implementation STOnboardingView

- (STOnboardingView)initWithTopInset:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STOnboardingView;
  v4 = [(STOnboardingView *)&v6 init];
  [(STOnboardingView *)v4 setTopInset:a3];
  return v4;
}

- (UIEdgeInsets)safeAreaInsets
{
  v13.receiver = self;
  v13.super_class = (Class)STOnboardingView;
  [(STOnboardingView *)&v13 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(STOnboardingView *)self topInset];
  double v10 = v4;
  double v11 = v6;
  double v12 = v8;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

@end