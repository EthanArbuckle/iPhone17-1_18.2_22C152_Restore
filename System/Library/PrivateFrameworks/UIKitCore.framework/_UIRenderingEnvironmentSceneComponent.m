@interface _UIRenderingEnvironmentSceneComponent
- (NSString)description;
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (_UIRenderingEnvironmentSceneComponent)initWithScene:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_invalidateTraitOverrides;
- (void)_setScene:(id)a3;
@end

@implementation _UIRenderingEnvironmentSceneComponent

- (id)_settingsDiffActionsForScene:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (UITraitCollection)_traitOverrides
{
  currentAttributes = self->_currentAttributes;
  if (currentAttributes)
  {
    traitOverrides = self->_traitOverrides;
    if (!traitOverrides)
    {
      v5 = +[UITraitCollection traitCollectionWithObject:currentAttributes forTrait:objc_opt_class()];
      v6 = self->_traitOverrides;
      self->_traitOverrides = v5;

      traitOverrides = self->_traitOverrides;
    }
    v7 = traitOverrides;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (_UIRenderingEnvironmentSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRenderingEnvironmentSceneComponent;
  v5 = [(_UIRenderingEnvironmentSceneComponent *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    -[_UIRenderingEnvironmentSceneComponent _invalidateTraitOverrides]((uint64_t)v6);
  }

  return v6;
}

- (void)_setScene:(id)a3
{
}

- (void)_invalidateTraitOverrides
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v3 = [WeakRetained _FBSScene];
  id v4 = [v3 settings];
  id v8 = [v4 displayConfiguration];

  v5 = *(void **)(a1 + 24);
  if (!v8)
  {
    v6 = 0;
    goto LABEL_7;
  }
  if (!v5 || ([v5 refersToSameDisplayConfiguration:v8] & 1) == 0)
  {
    v6 = [[_UIRenderingEnvironmentAttributes alloc] initWithDisplayConfiguration:v8];
    v5 = *(void **)(a1 + 24);
LABEL_7:
    *(void *)(a1 + 24) = v6;

    v7 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRenderingEnvironmentSceneComponent;
  v3 = [(_UIRenderingEnvironmentSceneComponent *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v4, "appendFormat:", @" scene=%p", WeakRetained);

  if (self->_currentAttributes) {
    [v4 appendFormat:@" attributes=%@", self->_currentAttributes];
  }
  return (NSString *)v4;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAttributes, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
}

@end