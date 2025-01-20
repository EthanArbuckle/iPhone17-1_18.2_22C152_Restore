@interface SBApplicationSceneEntity
- (BOOL)BOOLForProcessSetting:(int64_t)a3;
- (BOOL)_supportsLayoutRole:(int64_t)a3;
- (BOOL)isApplicationSceneEntity;
- (BOOL)isEqual:(id)a3;
- (Class)viewControllerClass;
- (NSSet)actions;
- (SBApplication)application;
- (SBApplicationSceneHandle)sceneHandle;
- (SBProcessSettings)processSettings;
- (id)_initWithSceneHandle:(id)a3;
- (id)copyProcessSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)entityGenerator;
- (id)objectForProcessSetting:(int64_t)a3;
- (int64_t)flagForProcessSetting:(int64_t)a3;
- (unint64_t)hash;
- (void)_initializeWithSceneHandle:(id)a3;
- (void)addActions:(id)a3;
- (void)applyProcessSettings:(id)a3;
- (void)clearProcessSettings;
- (void)removeActions:(id)a3;
- (void)removeAllActions;
- (void)setFlag:(int64_t)a3 forProcessSetting:(int64_t)a4;
- (void)setObject:(id)a3 forProcessSetting:(int64_t)a4;
- (void)translateActivationSettingsToActions;
@end

@implementation SBApplicationSceneEntity

- (SBApplication)application
{
  return [(SBApplicationSceneHandle *)self->_sceneHandle application];
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return a3 == 1;
}

- (void)clearProcessSettings
{
}

id __43__SBApplicationSceneEntity_entityGenerator__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(*(Class *)(a1 + 40)) _initWithSceneHandle:*(void *)(a1 + 32)];
  return v1;
}

- (id)_initWithSceneHandle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBApplicationSceneEntity.m", 54, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];
  }
  v6 = [v5 sceneIdentifier];
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationSceneEntity;
  v7 = [(SBWorkspaceEntity *)&v10 initWithIdentifier:v6 displayChangeSettings:0];

  if (v7) {
    [(SBApplicationSceneEntity *)v7 _initializeWithSceneHandle:v5];
  }

  return v7;
}

- (void)_initializeWithSceneHandle:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_sceneHandle, a3);
  id v5 = objc_alloc_init(SBProcessSettings);
  processSettings = self->_processSettings;
  self->_processSettings = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  actions = self->_actions;
  self->_actions = v7;

  v9 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  objc_super v10 = [v9 info];
  if ([v10 wantsLaunchWithoutPNG]) {
    [(SBWorkspaceEntity *)self setFlag:1 forActivationSetting:7];
  }
  if ([v10 shouldLaunchWithLiveContentASAP]) {
    [(SBWorkspaceEntity *)self setFlag:1 forActivationSetting:10];
  }
  if ([v10 shouldLaunchSuspendedAlways]) {
    [(SBWorkspaceEntity *)self setFlag:1 forActivationSetting:3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processSettings, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

- (BOOL)isApplicationSceneEntity
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(SBApplicationSceneEntity *)self sceneHandle];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (SBApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)translateActivationSettingsToActions
{
  unint64_t v3 = [(SBWorkspaceEntity *)self objectForActivationSetting:5];
  v4 = [(SBApplicationSceneEntity *)self actions];
  id v5 = (void *)[v4 copy];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBApplicationSceneEntity_Actions__translateActivationSettingsToActions__block_invoke;
  v9[3] = &unk_1E6AF9978;
  v9[4] = self;
  id v6 = v3;
  id v10 = v6;
  id v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];
  if (v6 && !*((unsigned char *)v13 + 24))
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42C20]) initWithURL:v6];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      [(SBApplicationSceneEntity *)self addActions:v8];
    }
  }

  _Block_object_dispose(&v12, 8);
}

- (NSSet)actions
{
  return &self->_actions->super;
}

- (id)entityGenerator
{
  v2 = self->_sceneHandle;
  uint64_t v3 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SBApplicationSceneEntity_entityGenerator__block_invoke;
  v11[3] = &unk_1E6B0C150;
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  v4 = v2;
  id v5 = (void *)MEMORY[0x1D948C7A0](v11);
  v9 = (void *)MEMORY[0x1D948C7A0](v5, v6, v7, v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBApplicationSceneEntity;
  id v4 = [(SBWorkspaceEntity *)&v6 copyWithZone:a3];
  [v4 _initializeWithSceneHandle:self->_sceneHandle];
  [v4 applyProcessSettings:self->_processSettings];
  [v4 addActions:self->_actions];
  return v4;
}

- (void)addActions:(id)a3
{
  if (a3) {
    -[NSMutableSet unionSet:](self->_actions, "unionSet:");
  }
}

- (void)applyProcessSettings:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && !self->_processSettings)
  {
    id v5 = objc_alloc_init(SBProcessSettings);
    processSettings = self->_processSettings;
    self->_processSettings = v5;

    id v4 = v7;
  }
  [(SBProcessSettings *)self->_processSettings applyProcessSettings:v4];
}

- (id)objectForProcessSetting:(int64_t)a3
{
  return [(SBProcessSettings *)self->_processSettings objectForProcessSetting:a3];
}

- (BOOL)BOOLForProcessSetting:(int64_t)a3
{
  return [(SBProcessSettings *)self->_processSettings BOOLForProcessSetting:a3];
}

- (void)removeAllActions
{
}

- (void)setObject:(id)a3 forProcessSetting:(int64_t)a4
{
  id v6 = a3;
  id v9 = v6;
  if (v6 && !self->_processSettings)
  {
    id v7 = objc_alloc_init(SBProcessSettings);
    processSettings = self->_processSettings;
    self->_processSettings = v7;

    id v6 = v9;
  }
  [(SBProcessSettings *)self->_processSettings setObject:v6 forProcessSetting:a4];
}

- (void)setFlag:(int64_t)a3 forProcessSetting:(int64_t)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !self->_processSettings)
  {
    id v7 = objc_alloc_init(SBProcessSettings);
    processSettings = self->_processSettings;
    self->_processSettings = v7;
  }
  id v9 = self->_processSettings;
  [(SBProcessSettings *)v9 setFlag:a3 forProcessSetting:a4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SBApplicationSceneEntity *)self sceneHandle];
    id v7 = [v5 sceneHandle];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

void __73__SBApplicationSceneEntity_Actions__translateActivationSettingsToActions__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 UIActionType] == 6) {
    [*(id *)(a1 + 32) setFlag:1 forActivationSetting:41];
  }
  if (*(void *)(a1 + 40) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [v4 url];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 isEqual:*(void *)(a1 + 40)];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
}

- (int64_t)flagForProcessSetting:(int64_t)a3
{
  processSettings = self->_processSettings;
  if (processSettings) {
    return [(SBProcessSettings *)processSettings flagForProcessSetting:a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)copyProcessSettings
{
  return (id)[(SBProcessSettings *)self->_processSettings copy];
}

- (void)removeActions:(id)a3
{
  if (a3) {
    -[NSMutableSet minusSet:](self->_actions, "minusSet:");
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationSceneEntity;
  id v5 = [(SBWorkspaceEntity *)&v10 descriptionBuilderWithMultilinePrefix:v4];
  processSettings = self->_processSettings;
  if (processSettings && ![(SBProcessSettings *)processSettings isEmpty]
    || [(NSMutableSet *)self->_actions count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__SBApplicationSceneEntity_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E6AF5290;
    v8[4] = self;
    id v9 = v5;
    [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];
  }
  return v5;
}

id __66__SBApplicationSceneEntity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 56) isEmpty] & 1) == 0) {
    id v2 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 56) withName:@"processSettings" skipIfNil:1];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  [v3 appendArraySection:v4 withName:@"actions" skipIfEmpty:1];

  return (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 40) withName:@"sceneHandle"];
}

- (SBProcessSettings)processSettings
{
  return self->_processSettings;
}

- (Class)viewControllerClass
{
  return 0;
}

@end