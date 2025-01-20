@interface SBFBackdropLegibilitySettingsProvider
- (SBFBackdropLegibilitySettingsProvider)initWithBackdropView:(id)a3;
- (SBFLegibilitySettingsProviderDelegate)delegate;
- (_UILegibilitySettings)legibilitySettings;
- (void)backdropViewDidChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SBFBackdropLegibilitySettingsProvider

- (SBFBackdropLegibilitySettingsProvider)initWithBackdropView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFBackdropLegibilitySettingsProvider;
  v6 = [(SBFBackdropLegibilitySettingsProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backdropView, a3);
    legibilitySettings = v7->_legibilitySettings;
    v7->_legibilitySettings = 0;

    objc_storeWeak((id *)&v7->_delegate, 0);
  }

  return v7;
}

- (void)dealloc
{
  [(SBFBackdropLegibilitySettingsProvider *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SBFBackdropLegibilitySettingsProvider;
  [(SBFBackdropLegibilitySettingsProvider *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    backdropView = self->_backdropView;
    if (obj)
    {
      [(_UIBackdropView *)backdropView addObserver:self];
      [(SBFBackdropLegibilitySettingsProvider *)self backdropViewDidChange:self->_backdropView];
    }
    else
    {
      [(_UIBackdropView *)backdropView removeObserver:self];
    }
    id v5 = obj;
  }
}

- (void)backdropViewDidChange:(id)a3
{
  v4 = [a3 inputSettings];
  id v10 = [v4 colorSettings];

  if (v10)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F43228]);
    v6 = [v10 color];
    v7 = (_UILegibilitySettings *)[v5 initWithContentColor:v6];
    legibilitySettings = self->_legibilitySettings;
    self->_legibilitySettings = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained providerLegibilitySettingsChanged:self];
  }
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFLegibilitySettingsProviderDelegate *)WeakRetained;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end