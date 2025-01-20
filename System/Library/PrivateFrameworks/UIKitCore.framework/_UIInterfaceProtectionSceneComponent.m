@interface _UIInterfaceProtectionSceneComponent
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (_UIInterfaceProtectionSceneComponent)initWithScene:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (uint64_t)underAppProtection;
- (void)_invalidateTraitOverrides;
- (void)_setScene:(id)a3;
- (void)setUnderAppProtection:(uint64_t)a1;
@end

@implementation _UIInterfaceProtectionSceneComponent

- (id)_settingsDiffActionsForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (UITraitCollection)_traitOverrides
{
  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    v4 = +[UITraitCollection _traitCollectionWithInterfaceProtectionState:[(UISceneSystemProtectionManager *)self->_protectionManager isUserAuthenticationEnabled]];
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (_UIInterfaceProtectionSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIInterfaceProtectionSceneComponent;
  v5 = [(_UIInterfaceProtectionSceneComponent *)&v9 init];
  if (v5)
  {
    v6 = (UISceneSystemProtectionManager *)-[UISceneSystemProtectionManager _init]([UISceneSystemProtectionManager alloc]);
    protectionManager = v5->_protectionManager;
    v5->_protectionManager = v6;

    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v5;
}

- (void)_setScene:(id)a3
{
}

- (uint64_t)underAppProtection
{
  if (result) {
    return [*(id *)(result + 16) isUserAuthenticationEnabled];
  }
  return result;
}

- (void)setUnderAppProtection:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if ([*(id *)(a1 + 16) isUserAuthenticationEnabled] != a2)
    {
      uint64_t v4 = *(void *)(a1 + 16);
      if (v4) {
        *(unsigned char *)(v4 + 8) = v2;
      }
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [v6 postNotificationName:@"UISceneSystemProtectionDidChangeNotification" object:WeakRetained];
    }
  }
}

- (void)_invalidateTraitOverrides
{
  if (a1)
  {
    char v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [WeakRetained _componentDidUpdateTraitOverrides:a1];
    }
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_protectionManager, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
}

@end