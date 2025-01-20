@interface SBLockScreenTimerDialView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBLockScreenTimerDialView)initWithSymbolFont:(id)a3;
- (UIFont)font;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (id)_newDialViewConfiguredForSettingsAndFont;
- (void)setFont:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
@end

@implementation SBLockScreenTimerDialView

- (SBLockScreenTimerDialView)initWithSymbolFont:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLockScreenTimerDialView;
  v6 = -[SBLockScreenTimerDialView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_font, a3);
    v8 = [MEMORY[0x263F1CCD0] sharedInstanceForStyle:1];
    [(SBLockScreenTimerDialView *)v7 setLegibilitySettings:v8];
  }
  return v7;
}

- (id)_newDialViewConfiguredForSettingsAndFont
{
  v3 = self->_legibilitySettings;
  v4 = [(_UILegibilitySettings *)v3 primaryColor];
  font = self->_font;
  if (font) {
    [(UIFont *)font pointSize];
  }
  else {
    [MEMORY[0x263F1C658] defaultFontSize];
  }
  v6 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:weight:scale:", 4, 1);
  v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"timer" withConfiguration:v6];
  v8 = [v7 imageWithTintColor:v4 renderingMode:2];

  id v9 = objc_alloc(MEMORY[0x263F79730]);
  [v8 size];
  v12 = objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, v10, v11);
  [v12 updateForChangedSettings:v3 options:2 image:v8 strength:self->_strength];
  [v12 setTintColor:v4];

  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SBUILegibilityView *)self->_dialView frame];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setFont:(id)a3
{
  id v7 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(SBUILegibilityView *)self->_dialView removeFromSuperview];
    double v5 = [(SBLockScreenTimerDialView *)self _newDialViewConfiguredForSettingsAndFont];
    dialView = self->_dialView;
    self->_dialView = v5;

    [(SBLockScreenTimerDialView *)self addSubview:self->_dialView];
  }
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
  -[SBUILegibilityView setStrength:](self->_dialView, "setStrength:");
}

- (void)setLegibilitySettings:(id)a3
{
  id v7 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBUILegibilityView *)self->_dialView removeFromSuperview];
    double v5 = [(SBLockScreenTimerDialView *)self _newDialViewConfiguredForSettingsAndFont];
    dialView = self->_dialView;
    self->_dialView = v5;

    [(SBLockScreenTimerDialView *)self addSubview:self->_dialView];
  }
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIFont)font
{
  return self->_font;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_dialView, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end