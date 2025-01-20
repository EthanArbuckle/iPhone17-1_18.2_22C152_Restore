@interface UIMutableScenePresentationContext
- (UIScenePresentationContext)_defaultPresentationContext;
- (id)_existingLayerPresentationContextCreatingIfNecessary:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setDefaultPresentationContext:(id)a3;
- (void)_setExclusiveLayerTargetsToInclude:(id)a3;
- (void)_setLayerTargetsToExclude:(id)a3;
- (void)_setMinificationFilterName:(id)a3;
- (void)_setVisibilityPropagationEnabled:(BOOL)a3;
- (void)modifyLayerPresentationOverrideContextForLayerTarget:(id)a3 block:(id)a4;
- (void)removeAllLayerPresentationOverrides;
- (void)removeLayerPresentationOverrideForLayerTarget:(id)a3;
- (void)resetToDefaults;
- (void)setAppearanceStyle:(unint64_t)a3;
- (void)setAsynchronousRenderingOptions:(id)a3;
- (void)setBackgroundColorWhileHosting:(id)a3;
- (void)setBackgroundColorWhileNotHosting:(id)a3;
- (void)setClippingDisabled:(BOOL)a3;
- (void)setHostTransformer:(id)a3;
- (void)setInheritsSecurity:(BOOL)a3;
- (void)setPresentedLayerTypes:(unint64_t)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setShouldPassthroughHitTestEventsIfTransparent:(BOOL)a3;
- (void)setStopsHitTestTransformAccumulation:(BOOL)a3;
- (void)setStopsSecureSuperlayersValidation:(BOOL)a3;
@end

@implementation UIMutableScenePresentationContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UIScenePresentationContext alloc];
  return [(UIScenePresentationContext *)v4 _initWithPresentationContext:self];
}

- (void)setRenderingMode:(unint64_t)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:7];
}

- (void)setResizesHostedContext:(BOOL)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithBool:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:15];
}

- (void)setPresentedLayerTypes:(unint64_t)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:3];
}

- (void)_setVisibilityPropagationEnabled:(BOOL)a3
{
  settings = self->super._settings;
  uint64_t v4 = BSSettingFlagForBool();
  [(BSMutableSettings *)settings setFlag:v4 forSetting:12];
}

- (void)_setLayerTargetsToExclude:(id)a3
{
  settings = self->super._settings;
  if (a3)
  {
    uint64_t v4 = self->super._settings;
    -[BSMutableSettings setObject:forSetting:](v4, "setObject:forSetting:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:11];
  }
}

- (void)_setDefaultPresentationContext:(id)a3
{
  id v5 = (UIScenePresentationContext *)a3;
  defaultPresentationContext = self->super._defaultPresentationContext;
  p_defaultPresentationContext = &self->super._defaultPresentationContext;
  if (defaultPresentationContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_defaultPresentationContext, a3);
    id v5 = v8;
  }
}

- (void)setClippingDisabled:(BOOL)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithBool:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:1];
}

- (void)setAppearanceStyle:(unint64_t)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:2];
}

- (void)setBackgroundColorWhileHosting:(id)a3
{
  settings = self->super._settings;
  if (a3)
  {
    id v4 = self->super._settings;
    -[BSMutableSettings setObject:forSetting:](v4, "setObject:forSetting:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:4];
  }
}

- (void)setBackgroundColorWhileNotHosting:(id)a3
{
  settings = self->super._settings;
  if (a3)
  {
    id v4 = self->super._settings;
    -[BSMutableSettings setObject:forSetting:](v4, "setObject:forSetting:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:5];
  }
}

- (void)setHostTransformer:(id)a3
{
  settings = self->super._settings;
  if (a3)
  {
    id v4 = self->super._settings;
    -[BSMutableSettings setObject:forSetting:](v4, "setObject:forSetting:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:6];
  }
}

- (void)setAsynchronousRenderingOptions:(id)a3
{
  settings = self->super._settings;
  uint64_t v4 = [a3 copy];
  id v6 = (id)v4;
  if (v4)
  {
    [(BSMutableSettings *)settings setObject:v4 forSetting:13];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:13];
  }
}

- (void)setInheritsSecurity:(BOOL)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithBool:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:14];
}

- (void)setShouldPassthroughHitTestEventsIfTransparent:(BOOL)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithBool:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:16];
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithBool:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:17];
}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  settings = self->super._settings;
  id v4 = [NSNumber numberWithBool:a3];
  [(BSMutableSettings *)settings setObject:v4 forSetting:18];
}

- (void)modifyLayerPresentationOverrideContextForLayerTarget:(id)a3 block:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"UIScenePresentationContext.m", 539, @"Invalid parameter not satisfying: %@", @"layerTarget" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"UIScenePresentationContext.m", 540, @"Invalid parameter not satisfying: %@", @"modifyBlock" object file lineNumber description];

LABEL_3:
  v10 = [(UIMutableScenePresentationContext *)self _existingLayerPresentationContextCreatingIfNecessary:1];
  v11 = [v10 objectForKey:v7];
  v12 = (UIMutableSceneLayerPresentationContext *)[v11 mutableCopy];

  if (!v12) {
    v12 = objc_alloc_init(UIMutableSceneLayerPresentationContext);
  }
  ((void (**)(void, UIMutableSceneLayerPresentationContext *))v9)[2](v9, v12);
  v13 = UIScenePresentationLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
  {
    v15 = UIScenePresentationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = NSNumber;
      v18 = [v10 objectForKey:v7];
      v19 = [v17 numberWithBool:BSEqualObjects()];
      v20 = [v10 objectForKey:v7];
      *(_DWORD *)buf = 138412802;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_debug_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEBUG, "modify default LAYER presentation context (equal? %@), prevContext: %@, newContext: %@", buf, 0x20u);
    }
  }
  v16 = (void *)[(UIMutableSceneLayerPresentationContext *)v12 copy];
  if ([v16 _isEqualToDefaultContext]) {
    [v10 removeObjectForKey:v7];
  }
  else {
    [v10 setObject:v16 forKey:v7];
  }
}

- (void)removeLayerPresentationOverrideForLayerTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(UIMutableScenePresentationContext *)self _existingLayerPresentationContextCreatingIfNecessary:0];
  [v5 removeObjectForKey:v4];
}

- (void)removeAllLayerPresentationOverrides
{
  id v2 = [(UIMutableScenePresentationContext *)self _existingLayerPresentationContextCreatingIfNecessary:0];
  [v2 removeAllObjects];
}

- (void)resetToDefaults
{
}

- (void)_setMinificationFilterName:(id)a3
{
  settings = self->super._settings;
  if (a3)
  {
    id v4 = self->super._settings;
    -[BSMutableSettings setObject:forSetting:](v4, "setObject:forSetting:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:8];
  }
}

- (UIScenePresentationContext)_defaultPresentationContext
{
  return self->super._defaultPresentationContext;
}

- (void)_setExclusiveLayerTargetsToInclude:(id)a3
{
  settings = self->super._settings;
  if (a3)
  {
    id v4 = self->super._settings;
    -[BSMutableSettings setObject:forSetting:](v4, "setObject:forSetting:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [(BSMutableSettings *)settings setObject:v5 forSetting:10];
  }
}

- (id)_existingLayerPresentationContextCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BSMutableSettings *)self->super._settings objectForSetting:9];
  id v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v3;
  }
  id v8 = v5;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    settings = self->super._settings;
    if (v9)
    {
      id v8 = (void *)v9;
      [(BSMutableSettings *)settings setObject:v9 forSetting:9];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [(BSMutableSettings *)settings setObject:v11 forSetting:9];

      id v8 = 0;
    }
  }

  return v8;
}

@end