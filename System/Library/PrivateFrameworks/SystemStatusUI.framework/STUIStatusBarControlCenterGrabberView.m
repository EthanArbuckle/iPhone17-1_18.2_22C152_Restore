@interface STUIStatusBarControlCenterGrabberView
- (BOOL)canBecomeFocused;
- (BOOL)isUserInteractionEnabled;
- (STUIStatusBarControlCenterGrabberView)initWithFrame:(CGRect)a3;
- (void)applyStyleAttributes:(id)a3;
@end

@implementation STUIStatusBarControlCenterGrabberView

- (STUIStatusBarControlCenterGrabberView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarControlCenterGrabberView;
  v3 = -[STUIStatusBarRoundedCornerView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STUIStatusBarControlCenterGrabberView *)v3 setClipsToBounds:1];
  return v3;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 imageTintColor];
  v6 = [v5 colorWithAlphaComponent:0.5];
  [(STUIStatusBarControlCenterGrabberView *)self setBackgroundColor:v6];

  uint64_t v7 = [v4 mode];
  id v10 = [(STUIStatusBarControlCenterGrabberView *)self layer];
  v8 = (void *)MEMORY[0x1E4F3A2E0];
  if (v7 == 2) {
    v8 = (void *)MEMORY[0x1E4F3A2E8];
  }
  v9 = [MEMORY[0x1E4F39BC0] filterWithType:*v8];
  [v10 setCompositingFilter:v9];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

@end