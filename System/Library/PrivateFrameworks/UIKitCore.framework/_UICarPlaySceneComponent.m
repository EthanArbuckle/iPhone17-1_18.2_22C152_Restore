@interface _UICarPlaySceneComponent
- (BOOL)blackWallpaperModeEnabled;
- (BOOL)disableFiveRowKeyboards;
- (UICarPlayApplicationSceneSettings)carPlaySceneSettings;
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (_UICarPlaySceneComponent)initWithScene:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_invalidateTraitOverrides;
- (void)_setScene:(id)a3;
@end

@implementation _UICarPlaySceneComponent

- (_UICarPlaySceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UICarPlaySceneComponent;
  v5 = [(_UICarPlaySceneComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (UITraitCollection)_traitOverrides
{
  if ([(_UICarPlaySceneComponent *)self blackWallpaperModeEnabled])
  {
    v2 = self;
    v3 = +[UITraitCollection traitCollectionWithNSIntegerValue:1 forTrait:v2];
  }
  else
  {
    v3 = 0;
  }
  return (UITraitCollection *)v3;
}

- (void)_invalidateTraitOverrides
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [WeakRetained _componentDidUpdateTraitOverrides:self];
  }
}

- (UICarPlayApplicationSceneSettings)carPlaySceneSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v3 = [WeakRetained _FBSScene];
  id v4 = [v3 settings];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  return (UICarPlayApplicationSceneSettings *)v8;
}

- (BOOL)disableFiveRowKeyboards
{
  v2 = [(_UICarPlaySceneComponent *)self carPlaySceneSettings];
  char v3 = [v2 disableFiveRowKeyboards];

  return v3;
}

- (BOOL)blackWallpaperModeEnabled
{
  v2 = [(_UICarPlaySceneComponent *)self carPlaySceneSettings];
  char v3 = [v2 blackWallpaperModeEnabled];

  return v3;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end