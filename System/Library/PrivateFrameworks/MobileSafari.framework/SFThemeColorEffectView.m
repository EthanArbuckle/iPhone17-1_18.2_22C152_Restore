@interface SFThemeColorEffectView
- (BOOL)_needsBlur;
- (NSString)_groupName;
- (SFThemeColorBarTheme)theme;
- (SFThemeColorEffectView)initWithEffect:(id)a3;
- (UIView)contentView;
- (UIVisualEffect)effect;
- (double)themeColorVisibility;
- (void)_applyTheme;
- (void)_setGroupName:(id)a3;
- (void)_updateFillColor;
- (void)setEffect:(id)a3;
- (void)setTheme:(id)a3;
- (void)setThemeColorVisibility:(double)a3;
@end

@implementation SFThemeColorEffectView

uint64_t __37__SFThemeColorEffectView__applyTheme__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFillColor];
}

- (UIView)contentView
{
  return [(UIVisualEffectView *)self->_effectView contentView];
}

- (void)setTheme:(id)a3
{
  v5 = (SFThemeColorBarTheme *)a3;
  if (self->_theme != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_theme, a3);
    [(SFThemeColorEffectView *)self _applyTheme];
    v5 = v6;
  }
}

- (void)_applyTheme
{
  if ([(SFThemeColorEffectView *)self _needsBlur])
  {
    [(SFThemeColorBarTheme *)self->_theme applyBackdropEffectsToView:self->_effectView];
    v3 = [(SFThemeColorBarTheme *)self->_theme themeColor];
    v4 = [v3 colorWithAlphaComponent:1.0];
    [(UIView *)self->_darkeningView setBackgroundColor:v4];

    [(UIView *)self->_darkeningView setHidden:v3 == 0];
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    [(UIVisualEffectView *)self->_effectView setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
    [(UIVisualEffectView *)self->_effectView setContentEffects:v5];
    [(UIView *)self->_darkeningView setHidden:1];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SFThemeColorEffectView__applyTheme__block_invoke;
  v6[3] = &unk_1E54E9858;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
}

- (void)setThemeColorVisibility:(double)a3
{
  if (self->_themeColorVisibility != a3)
  {
    BOOL v5 = [(SFThemeColorEffectView *)self _needsBlur];
    self->_themeColorVisibility = a3;
    if (v5 == [(SFThemeColorEffectView *)self _needsBlur])
    {
      [(SFThemeColorEffectView *)self _updateFillColor];
    }
    else
    {
      [(SFThemeColorEffectView *)self _applyTheme];
    }
  }
}

- (BOOL)_needsBlur
{
  if (self->_themeColorVisibility < 1.0) {
    return 1;
  }
  v2 = [(SFThemeColorBarTheme *)self->_theme themeColor];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_updateFillColor
{
  id v5 = [(SFThemeColorBarTheme *)self->_theme themeColor];
  if (v5)
  {
    BOOL v3 = objc_msgSend(v5, "colorWithAlphaComponent:", _SFInterpolate(0.85, 1.0, self->_themeColorVisibility));
    v4 = [(UIVisualEffectView *)self->_effectView contentView];
    [v4 setBackgroundColor:v3];
  }
}

- (SFThemeColorEffectView)initWithEffect:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFThemeColorEffectView;
  id v5 = -[SFThemeColorEffectView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    darkeningView = v5->_darkeningView;
    v5->_darkeningView = v6;

    [(UIView *)v5->_darkeningView setAutoresizingMask:18];
    v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A070]];
    v9 = [(UIView *)v5->_darkeningView layer];
    [v9 setCompositingFilter:v8];

    [(SFThemeColorEffectView *)v5 addSubview:v5->_darkeningView];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
    effectView = v5->_effectView;
    v5->_effectView = (UIVisualEffectView *)v10;

    [(UIVisualEffectView *)v5->_effectView setAutoresizingMask:18];
    [(SFThemeColorEffectView *)v5 addSubview:v5->_effectView];
    v12 = [(SFThemeColorEffectView *)v5 layer];
    [v12 setAllowsGroupBlending:0];

    v13 = v5;
  }

  return v5;
}

- (UIVisualEffect)effect
{
  return [(UIVisualEffectView *)self->_effectView effect];
}

- (void)setEffect:(id)a3
{
}

- (NSString)_groupName
{
  return (NSString *)[(UIVisualEffectView *)self->_effectView _groupName];
}

- (void)_setGroupName:(id)a3
{
}

- (SFThemeColorBarTheme)theme
{
  return self->_theme;
}

- (double)themeColorVisibility
{
  return self->_themeColorVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_darkeningView, 0);
}

@end