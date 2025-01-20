@interface SBWallpaperLegibilitySettingsProvider
- (SBFLegibilitySettingsProviderDelegate)delegate;
- (SBWallpaperLegibilitySettingsProvider)initWithVariant:(int64_t)a3;
- (_UILegibilitySettings)legibilitySettings;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4;
@end

@implementation SBWallpaperLegibilitySettingsProvider

- (SBWallpaperLegibilitySettingsProvider)initWithVariant:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBWallpaperLegibilitySettingsProvider;
  v4 = [(SBWallpaperLegibilitySettingsProvider *)&v7 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, 0);
    v5->_variant = a3;
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[SBWallpaperController sharedInstance];
  [v3 removeObserver:self forVariant:self->_variant];

  v4.receiver = self;
  v4.super_class = (Class)SBWallpaperLegibilitySettingsProvider;
  [(SBWallpaperLegibilitySettingsProvider *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = +[SBWallpaperController sharedInstance];
    int64_t variant = self->_variant;
    if (obj) {
      [v6 addObserver:self forVariant:variant];
    }
    else {
      [v6 removeObserver:self forVariant:variant];
    }

    v5 = obj;
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  v3 = +[SBWallpaperController sharedInstance];
  objc_super v4 = [v3 legibilitySettingsForVariant:self->_variant];

  return (_UILegibilitySettings *)v4;
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (self->_variant == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained providerLegibilitySettingsChanged:self];
  }
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (self->_variant == a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained providerLegibilitySettingsChanged:self];
  }
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFLegibilitySettingsProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end