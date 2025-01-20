@interface STUIStatusBarRadarView
- (BOOL)canBecomeFocused;
- (BOOL)isUserInteractionEnabled;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarRadarView)initWithFrame:(CGRect)a3;
- (id)accessibilityUserInputLabels;
- (void)_updateTintColor;
- (void)applyStyleAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation STUIStatusBarRadarView

- (STUIStatusBarRadarView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarRadarView;
  v3 = -[STUIStatusBarImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(STUIStatusBarRadarView *)v3 layer];
    [v5 setCornerRadius:12.0];

    v6 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v7 = (id)[(STUIStatusBarRadarView *)v4 registerForTraitChanges:v6 withAction:sel__updateTintColor];

    [(STUIStatusBarRadarView *)v4 _updateTintColor];
  }
  return v4;
}

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
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarRadarView;
  [(STUIStatusBarImageView *)&v4 applyStyleAttributes:a3];
  [(STUIStatusBarRadarView *)self _updateTintColor];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];

  if (v5 == self)
  {
    v6 = [MEMORY[0x1E4FB1618] _carSystemFocusColor];
    [(STUIStatusBarRadarView *)self setBackgroundColor:v6];
  }
  else
  {
    [(STUIStatusBarRadarView *)self setBackgroundColor:0];
  }
  [(STUIStatusBarRadarView *)self _updateTintColor];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 24.0;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateTintColor
{
  int v4 = [(STUIStatusBarRadarView *)self isFocused];
  if (v4)
  {
    double v2 = [(STUIStatusBarRadarView *)self traitCollection];
    if ([v2 userInterfaceStyle] == 1)
    {

LABEL_7:
      uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
      goto LABEL_9;
    }
  }
  v5 = [(STUIStatusBarRadarView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v4) {
  if (v6 == 2)
  }
    goto LABEL_7;
  uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
LABEL_9:
  id v8 = (id)v7;
  [(STUIStatusBarRadarView *)self setTintColor:v7];
}

- (id)accessibilityUserInputLabels
{
  v7[2] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v3 = [v2 localizedStringForKey:@"Radar" value:@"Radar" table:0];
  v7[0] = v3;
  int v4 = [v2 localizedStringForKey:@"Bug" value:@"Bug" table:0];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

@end