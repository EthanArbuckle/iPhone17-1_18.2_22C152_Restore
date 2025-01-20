@interface _UIBarBackgroundShadowContentImageView
- (BOOL)applyTintColorToBackgroundColor;
- (_UIBarBackgroundShadowContentImageView)initWithFrame:(CGRect)a3;
- (void)_applyTintColorToBackgroundIfNecessary;
- (void)setApplyTintColorToBackgroundColor:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation _UIBarBackgroundShadowContentImageView

- (void)setApplyTintColorToBackgroundColor:(BOOL)a3
{
  self->_applyTintColorToBackgroundColor = a3;
  [(_UIBarBackgroundShadowContentImageView *)self _applyTintColorToBackgroundIfNecessary];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBarBackgroundShadowContentImageView;
  [(UIImageView *)&v3 tintColorDidChange];
  [(_UIBarBackgroundShadowContentImageView *)self _applyTintColorToBackgroundIfNecessary];
}

- (void)_applyTintColorToBackgroundIfNecessary
{
  if (self->_applyTintColorToBackgroundColor)
  {
    id v3 = [(UIView *)self tintColor];
    [(UIImageView *)self setBackgroundColor:v3];
  }
}

- (_UIBarBackgroundShadowContentImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIBarBackgroundShadowContentImageView;
  id v3 = -[UIImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsEdgeAntialiasing:1];
  }
  return v4;
}

- (BOOL)applyTintColorToBackgroundColor
{
  return self->_applyTintColorToBackgroundColor;
}

@end