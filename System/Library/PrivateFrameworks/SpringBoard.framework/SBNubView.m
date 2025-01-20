@interface SBNubView
+ (double)contentHeight;
+ (double)height;
+ (double)hitTestPadding;
+ (double)hitTestWidth;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (SBDeviceApplicationSceneHandle)deviceApplicationSceneHandle;
- (SBNubView)initWithCoder:(id)a3;
- (SBNubView)initWithDeviceApplicationSceneHandle:(id)a3;
- (SBNubView)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)contentView;
- (void)_updateNubViewBackgroundColor;
- (void)_updateNubViewOverrideUserInterfaceStyleAndBackgroundColor;
- (void)dealloc;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBNubView

+ (double)hitTestWidth
{
  return 76.0;
}

+ (double)height
{
  if (height_onceToken != -1) {
    dispatch_once(&height_onceToken, &__block_literal_global_60);
  }
  return *(double *)&height___height;
}

- (SBNubView)initWithDeviceApplicationSceneHandle:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBNubView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[SBNubView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_deviceApplicationSceneHandle, a3);
    v11->_highlighted = 0;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
    nubView = v11->_nubView;
    v11->_nubView = (UIView *)v12;

    [(UIView *)v11->_nubView _setCornerRadius:2.5];
    [(UIView *)v11->_nubView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBNubView *)v11 addSubview:v11->_nubView];
    [(SBNubView *)v11 _updateNubViewOverrideUserInterfaceStyleAndBackgroundColor];
    v14 = [(UIView *)v11->_nubView widthAnchor];
    v15 = [v14 constraintEqualToConstant:36.0];
    [v15 setActive:1];

    v16 = [(UIView *)v11->_nubView heightAnchor];
    v17 = [v16 constraintEqualToConstant:5.0];
    [v17 setActive:1];

    v18 = [(UIView *)v11->_nubView centerXAnchor];
    v19 = [(SBNubView *)v11 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(UIView *)v11->_nubView centerYAnchor];
    v22 = [(SBNubView *)v11 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    [(SBDeviceApplicationSceneHandle *)v11->_deviceApplicationSceneHandle addObserver:v11];
  }

  return v11;
}

- (SBNubView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"%s is not a valid initializer. You must call -[%@ initWithDeviceApplicationSceneHandle:].", "-[SBNubView initWithNibName:bundle:]", v8 format];

  return [(SBNubView *)self initWithDeviceApplicationSceneHandle:0];
}

- (void)dealloc
{
  [(UIApplicationSceneClientSettingsDiffInspector *)self->_applicationSceneClientSettingsDiffInspector removeAllObservers];
  [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBNubView;
  [(SBNubView *)&v3 dealloc];
}

- (UIView)contentView
{
  return self->_nubView;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBNubView;
  id v4 = a3;
  [(SBNubView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(SBNubView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(SBNubView *)self _updateNubViewOverrideUserInterfaceStyleAndBackgroundColor];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4F43ED8];
  [(id)objc_opt_class() height];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (SBNubView)initWithCoder:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = a3;
  uint64_t v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBNubView;
  double v9 = [(SBNubView *)&v11 initWithCoder:v6];

  return v9;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  applicationSceneClientSettingsDiffInspector = self->_applicationSceneClientSettingsDiffInspector;
  if (!applicationSceneClientSettingsDiffInspector)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    v13 = self->_applicationSceneClientSettingsDiffInspector;
    self->_applicationSceneClientSettingsDiffInspector = v12;

    v14 = self->_applicationSceneClientSettingsDiffInspector;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __75__SBNubView_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18 = &unk_1E6AF85E0;
    objc_copyWeak(&v19, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v14 observeStatusBarStyleWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    applicationSceneClientSettingsDiffInspector = self->_applicationSceneClientSettingsDiffInspector;
  }
  objc_msgSend(v9, "evaluateWithInspector:context:", applicationSceneClientSettingsDiffInspector, 0, v15, v16, v17, v18);
}

void __75__SBNubView_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateNubViewOverrideUserInterfaceStyleAndBackgroundColor];
    id WeakRetained = v2;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(SBNubView *)self _updateNubViewBackgroundColor];
  }
}

+ (double)hitTestPadding
{
  return 20.0;
}

uint64_t __19__SBNubView_height__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  height___height = v1;
  return result;
}

+ (double)contentHeight
{
  return 5.0;
}

- (void)_updateNubViewBackgroundColor
{
  if (self->_highlighted) {
    [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  else {
  double v3 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  }
  double v4 = [(UIView *)self->_nubView backgroundColor];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F4F840] settingsWithMass:2.0 stiffness:400.0 damping:45.0];
    uint64_t v7 = (void *)MEMORY[0x1E4F4F898];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SBNubView__updateNubViewBackgroundColor__block_invoke;
    v8[3] = &unk_1E6AF5290;
    v8[4] = self;
    id v9 = v3;
    [v7 animateWithSettings:v6 actions:v8];
  }
}

uint64_t __42__SBNubView__updateNubViewBackgroundColor__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)_updateNubViewOverrideUserInterfaceStyleAndBackgroundColor
{
  double v3 = [(SBNubView *)self deviceApplicationSceneHandle];
  double v4 = [v3 sceneIfExists];
  id v7 = [v4 clientSettings];

  if (v7)
  {
    nubView = self->_nubView;
    if (_SBStatusBarColorStyleFromStyle([v7 statusBarModernStyle]) == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    [(UIView *)nubView _setOverrideUserInterfaceStyle:v6];
  }
  [(SBNubView *)self _updateNubViewBackgroundColor];
}

- (SBDeviceApplicationSceneHandle)deviceApplicationSceneHandle
{
  return self->_deviceApplicationSceneHandle;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_nubView, 0);
  objc_storeStrong((id *)&self->_applicationSceneClientSettingsDiffInspector, 0);
}

@end