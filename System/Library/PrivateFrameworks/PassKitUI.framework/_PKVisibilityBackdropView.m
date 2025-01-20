@interface _PKVisibilityBackdropView
- (_PKVisibilityBackdropView)initWithFrame:(CGRect)a3 privateStyle:(int64_t)a4;
- (_PKVisibilityBackdropViewDelegate)delegate;
- (double)pkui_visibility;
- (int64_t)pkui_preferredBackdropStyle;
- (void)_pkui_setVisibility:(double)a3 animated:(BOOL)a4;
- (void)_updateStyleIfNecessary;
- (void)dealloc;
- (void)pkui_commitBackdropSettings;
- (void)pkui_setVisibility:(double)a3 animated:(BOOL)a4;
- (void)pkui_updateBackdropSettings;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _PKVisibilityBackdropView

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PKVisibilityBackdropView;
  [(_PKVisibilityBackdropView *)&v4 traitCollectionDidChange:a3];
  [(_PKVisibilityBackdropView *)self _updateStyleIfNecessary];
}

- (_PKVisibilityBackdropView)initWithFrame:(CGRect)a3 privateStyle:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_PKVisibilityBackdropView;
  v5 = -[_UIBackdropView initWithFrame:privateStyle:](&v9, sel_initWithFrame_privateStyle_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_pkui_accessibilitySettingsDidChange_ name:*MEMORY[0x1E4FB2428] object:0];
    [v7 addObserver:v6 selector:sel_pkui_accessibilitySettingsDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
    [(_PKVisibilityBackdropView *)v6 pkui_commitBackdropSettings];
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_storeWeak((id *)p_delegate, v5);

  if (WeakRetained != v5 || v5 == 0 || WeakRetained == 0) {
    [(_PKVisibilityBackdropView *)self _updateStyleIfNecessary];
  }
}

- (void)pkui_commitBackdropSettings
{
  self->_updatingBackdropSettings = 0;
  v3 = (void *)MEMORY[0x1E4FB1FE8];
  objc_super v4 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:self->_style];
  id v5 = objc_msgSend(v3, "pkui_createTransparentSettingsFromSettings:", v4);

  [(_UIBackdropView *)self transitionToSettings:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56___PKVisibilityBackdropView_pkui_commitBackdropSettings__block_invoke;
  v10[3] = &unk_1E59CA7D0;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
  double visibility = self->_visibility;
  self->_visibilityAnimationTarget = 0.0;
  self->_double visibility = 0.0;
  self->_animationCounter = 0;
  ++self->_styleToken;
  char v7 = [(_PKVisibilityBackdropView *)self isHidden];
  BOOL v8 = 0;
  if ((v7 & 1) == 0)
  {
    [(_PKVisibilityBackdropView *)self alpha];
    BOOL v8 = v9 > 0.0 && visibility > 0.0;
  }
  [(_PKVisibilityBackdropView *)self _pkui_setVisibility:v8 animated:visibility];
}

- (void)_pkui_setVisibility:(double)a3 animated:(BOOL)a4
{
  self->_double visibility = a3;
  if (!self->_updatingBackdropSettings)
  {
    unsigned int animationCounter = self->_animationCounter;
    if (animationCounter)
    {
      if (vabdd_f64(a3, self->_visibilityAnimationTarget) >= 0.05 || a4) {
        goto LABEL_7;
      }
    }
    else
    {
      if (a4)
      {
LABEL_7:
        self->_unsigned int animationCounter = animationCounter + 1;
        self->_visibilityAnimationTarget = a3;
        objc_initWeak(&location, self);
        unsigned int styleToken = self->_styleToken;
        char v7 = (void *)MEMORY[0x1E4FB1EB0];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke;
        v12[3] = &unk_1E59CA7D0;
        v12[4] = self;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_2;
        v9[3] = &unk_1E59DC678;
        objc_copyWeak(&v10, &location);
        unsigned int v11 = styleToken;
        objc_msgSend(v7, "pkui_animateUsingOptions:animations:completion:", 6, v12, v9);
        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
        return;
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_5;
      v8[3] = &unk_1E59CA7D0;
      v8[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    }
  }
}

- (void)_updateStyleIfNecessary
{
  int64_t v3 = [(_PKVisibilityBackdropView *)self pkui_preferredBackdropStyle];
  if (self->_style != v3)
  {
    self->_style = v3;
    [(_PKVisibilityBackdropView *)self pkui_updateBackdropSettings];
  }
}

- (int64_t)pkui_preferredBackdropStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_super v4 = [(_PKVisibilityBackdropView *)self traitCollection];
    uint64_t style = [WeakRetained visibilityBackdropView:self preferredStyleForTraitCollection:v4];
  }
  else
  {
    uint64_t style = self->_style;
  }

  return style;
}

- (void)pkui_updateBackdropSettings
{
  if (!self->_updatingBackdropSettings)
  {
    self->_updatingBackdropSettings = 1;
    [(_UIBackdropView *)self transitionComplete];
    [(_PKVisibilityBackdropView *)self pkui_commitBackdropSettings];
  }
}

- (void)pkui_setVisibility:(double)a3 animated:(BOOL)a4
{
  if (self->_visibility != fmax(fmin(a3, 1.0), 0.0)) {
    -[_PKVisibilityBackdropView _pkui_setVisibility:animated:](self, "_pkui_setVisibility:animated:", a4);
  }
}

- (void)dealloc
{
  if (!self->_updatingBackdropSettings) {
    [(_UIBackdropView *)self transitionComplete];
  }
  v3.receiver = self;
  v3.super_class = (Class)_PKVisibilityBackdropView;
  [(_UIBackdropView *)&v3 dealloc];
}

- (double)pkui_visibility
{
  return self->_visibility;
}

- (_PKVisibilityBackdropViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_PKVisibilityBackdropViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end