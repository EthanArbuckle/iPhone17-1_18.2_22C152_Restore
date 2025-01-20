@interface _UIStatusBarRadarView
- (BOOL)canBecomeFocused;
- (BOOL)isUserInteractionEnabled;
- (CGSize)intrinsicContentSize;
- (_UIStatusBarRadarView)initWithFrame:(CGRect)a3;
- (id)_tintColor;
- (void)_updateTintColor;
- (void)applyStyleAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation _UIStatusBarRadarView

- (_UIStatusBarRadarView)initWithFrame:(CGRect)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarRadarView;
  v3 = -[_UIStatusBarImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setCornerRadius:12.0];

    v10[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [(UIView *)v4 registerForTraitChanges:v6 withAction:sel__updateTintColor];
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
  v4.super_class = (Class)_UIStatusBarRadarView;
  [(_UIStatusBarImageView *)&v4 applyStyleAttributes:a3];
  [(_UIStatusBarRadarView *)self _updateTintColor];
}

- (void)_updateTintColor
{
  id v3 = [(_UIStatusBarRadarView *)self _tintColor];
  [(UIView *)self setTintColor:v3];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];

  if (v5 == self)
  {
    v6 = +[UIColor _carSystemFocusColor];
    [(UIImageView *)self setBackgroundColor:v6];
  }
  else
  {
    [(UIImageView *)self setBackgroundColor:0];
  }
  [(_UIStatusBarRadarView *)self _updateTintColor];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 24.0;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_tintColor
{
  BOOL v4 = [(UIView *)self isFocused];
  if (v4)
  {
    double v2 = [(UIView *)self traitCollection];
    if ([v2 userInterfaceStyle] == 1)
    {

LABEL_7:
      id v7 = +[UIColor whiteColor];
      goto LABEL_9;
    }
  }
  v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v4) {
  if (v6 == 2)
  }
    goto LABEL_7;
  id v7 = +[UIColor blackColor];
LABEL_9:
  return v7;
}

@end