@interface SBSystemNotesBackgroundView
- (SBSystemNotesBackgroundView)initWithFrame:(CGRect)a3;
- (id)_backgroundColorFromSettings:(id)a3;
- (void)_updateTintView;
- (void)dealloc;
@end

@implementation SBSystemNotesBackgroundView

- (SBSystemNotesBackgroundView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBSystemNotesBackgroundView;
  v3 = -[SBSystemNotesBackgroundView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[SBSystemNotesSettingsDomain rootSettings];
    uint64_t v5 = [v4 appearanceSettings];
    appearanceSettings = v3->_appearanceSettings;
    v3->_appearanceSettings = (SBSystemNotesAppearanceSettings *)v5;

    [(PTSettings *)v3->_appearanceSettings addKeyObserver:v3];
    [(SBSystemNotesBackgroundView *)v3 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v9, v11, v13);
    tintView = v3->_tintView;
    v3->_tintView = (UIView *)v15;

    [(SBSystemNotesBackgroundView *)v3 _updateTintView];
    [(SBSystemNotesBackgroundView *)v3 addSubview:v3->_tintView];
    v17 = [MEMORY[0x1E4F427D8] effectWithStyle:7];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v17];
    backgroundEffectView = v3->_backgroundEffectView;
    v3->_backgroundEffectView = (UIVisualEffectView *)v18;

    -[UIVisualEffectView setFrame:](v3->_backgroundEffectView, "setFrame:", v8, v10, v12, v14);
    [(UIVisualEffectView *)v3->_backgroundEffectView setAutoresizingMask:18];
    [(SBSystemNotesBackgroundView *)v3 addSubview:v3->_backgroundEffectView];
  }
  return v3;
}

- (void)_updateTintView
{
  tintView = self->_tintView;
  id v3 = [(SBSystemNotesBackgroundView *)self _backgroundColorFromSettings:self->_appearanceSettings];
  [(UIView *)tintView setBackgroundColor:v3];
}

- (id)_backgroundColorFromSettings:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F428B8];
  id v4 = a3;
  [v4 platterTintRed];
  double v6 = v5;
  [v4 platterTintGreen];
  double v8 = v7;
  [v4 platterTintBlue];
  double v10 = v9;
  [v4 platterTintAlpha];
  double v12 = v11;

  return (id)[v3 colorWithRed:v6 green:v8 blue:v10 alpha:v12];
}

- (void)dealloc
{
  [(PTSettings *)self->_appearanceSettings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesBackgroundView;
  [(SBSystemNotesBackgroundView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
}

@end