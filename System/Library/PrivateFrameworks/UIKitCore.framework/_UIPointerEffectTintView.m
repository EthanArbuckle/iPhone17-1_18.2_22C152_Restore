@interface _UIPointerEffectTintView
- (BOOL)isDisabled;
- (BOOL)isPressed;
- (_UIPointerEffectTintView)initWithTintColorMatrixProvider:(id)a3;
- (void)_updateAlpha;
- (void)_updateBackgroundEffects;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)setDisabled:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
@end

@implementation _UIPointerEffectTintView

- (_UIPointerEffectTintView)initWithTintColorMatrixProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIPointerEffectTintView;
  v5 = -[UIVisualEffectView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id tintColorMatrixProvider = v5->_tintColorMatrixProvider;
    v5->_id tintColorMatrixProvider = (id)v6;

    [(_UIPointerEffectTintView *)v5 _updateBackgroundEffects];
    [(_UIPointerEffectTintView *)v5 _updateAlpha];
    [(UIView *)v5 setUserInteractionEnabled:0];
    v8 = [(UIView *)v5 layer];
    [v8 setAllowsHitTesting:0];
  }
  return v5;
}

- (void)_updateAlpha
{
  BOOL v3 = [(_UIPointerEffectTintView *)self isDisabled];
  double v4 = 0.0;
  if (!v3)
  {
    [(_UIPointerEffectTintView *)self isPressed];
    PSContentOverlayIntensityForLuminanceAndUsage();
  }
  [(UIView *)self setAlpha:v4];
}

- (void)_updateBackgroundEffects
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (*((void (**)(void))self->_tintColorMatrixProvider + 2))();
  double v4 = v3;
  if (v3) {
    [v3 CAColorMatrixValue];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  v5 = +[UIColorEffect _colorEffectCAMatrix:v7];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(UIVisualEffectView *)self setBackgroundEffects:v6];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(_UIPointerEffectTintView *)self _updateAlpha];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(_UIPointerEffectTintView *)self _updateAlpha];
  }
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  self->_luminance = a4;
  [(_UIPointerEffectTintView *)self _updateBackgroundEffects];
  [(_UIPointerEffectTintView *)self _updateAlpha];
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (void).cxx_destruct
{
}

@end