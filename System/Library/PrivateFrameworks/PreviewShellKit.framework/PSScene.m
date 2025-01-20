@interface PSScene
- (FBScene)scene;
- (NSString)sceneIdentifier;
- (PSScene)initWithScene:(id)a3;
- (PSSceneSettings)sceneSettings;
- (void)updateSceneSettings:(id)a3 with:(id)a4;
@end

@implementation PSScene

- (PSScene)initWithScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSScene;
  v6 = [(PSScene *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scene, a3);
  }

  return v7;
}

- (NSString)sceneIdentifier
{
  return (NSString *)[(FBScene *)self->_scene identifier];
}

- (PSSceneSettings)sceneSettings
{
  v2 = [(FBScene *)self->_scene settings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F61078]) initWithSettings:v2];

    v2 = (void *)v3;
  }
  v4 = [[PSSceneSettings alloc] initWithSettings:v2];

  return v4;
}

- (void)updateSceneSettings:(id)a3 with:(id)a4
{
  id v6 = a4;
  v7 = [a3 settings];
  id v8 = (id)[v7 copyResettingInterruptionPolicy];

  [(FBScene *)self->_scene updateSettings:v8 withTransitionContext:v6];
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
}

@end