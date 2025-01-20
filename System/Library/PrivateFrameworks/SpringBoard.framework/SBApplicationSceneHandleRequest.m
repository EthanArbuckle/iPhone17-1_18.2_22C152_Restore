@interface SBApplicationSceneHandleRequest
+ (id)defaultRequestForApplication:(id)a3 sceneIdentity:(id)a4 displayIdentity:(id)a5;
+ (id)defaultSceneSpecificationForDisplayIdentity:(id)a3;
- (FBSDisplayIdentity)displayIdentity;
- (FBSSceneDefinition)sceneDefinition;
- (FBScene)existingScene;
- (SBApplication)application;
- (SBApplicationSceneHandleRequest)initWithApplication:(id)a3 sceneDefinition:(id)a4 displayIdentity:(id)a5;
- (void)setApplication:(id)a3;
- (void)setDisplayIdentity:(id)a3;
- (void)setExistingScene:(id)a3;
- (void)setSceneDefinition:(id)a3;
@end

@implementation SBApplicationSceneHandleRequest

- (void)setExistingScene:(id)a3
{
}

+ (id)defaultRequestForApplication:(id)a3 sceneIdentity:(id)a4 displayIdentity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 defaultSceneSpecificationForDisplayIdentity:v10];
  v12 = [v8 _dataStore];
  v13 = [v9 identifier];
  v14 = [v12 sceneStoreForIdentifier:v13 creatingIfNecessary:0];

  if (v14)
  {
    v15 = [v14 objectForKey:@"sceneSessionRole"];
    v16 = v15;
    if (v15 && [v15 isEqualToString:*MEMORY[0x1E4F43C90]])
    {
      uint64_t v17 = [MEMORY[0x1E4F42D30] specification];

      v11 = (void *)v17;
    }
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F629B0]);
  [v18 setIdentity:v9];
  v19 = FBSSceneClientIdentity;
  v20 = [v8 info];
  v21 = [v20 processIdentity];
  v22 = [v19 identityForProcessIdentity:v21];
  [v18 setClientIdentity:v22];

  [v18 setSpecification:v11];
  v23 = (void *)[objc_alloc((Class)a1) initWithApplication:v8 sceneDefinition:v18 displayIdentity:v10];

  return v23;
}

- (SBApplicationSceneHandleRequest)initWithApplication:(id)a3 sceneDefinition:(id)a4 displayIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBApplicationSceneHandleRequest;
  v12 = [(SBApplicationSceneHandleRequest *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    uint64_t v14 = [v10 copy];
    sceneDefinition = v13->_sceneDefinition;
    v13->_sceneDefinition = (FBSSceneDefinition *)v14;

    uint64_t v16 = [v11 copy];
    displayIdentity = v13->_displayIdentity;
    v13->_displayIdentity = (FBSDisplayIdentity *)v16;
  }
  return v13;
}

+ (id)defaultSceneSpecificationForDisplayIdentity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [v3 expectsSecureRendering];
  uint64_t v5 = objc_msgSend(v3, "sb_displayWindowingMode");
  if (v4)
  {
    v6 = (id *)0x1E4F42740;
    goto LABEL_10;
  }
  if (v5 != 1)
  {
    if (v5 == 2)
    {
      v6 = (id *)0x1E4F42750;
      goto LABEL_10;
    }
    v7 = SBLogWorkspace();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v10 = _SBFLoggingMethodProem();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_error_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] asked for a display we don't really know about. falling back to default spec: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  v6 = (id *)0x1E4F42788;
LABEL_10:
  id v8 = [*v6 specification];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDefinition, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_existingScene, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (FBSSceneDefinition)sceneDefinition
{
  return self->_sceneDefinition;
}

- (SBApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (FBScene)existingScene
{
  return self->_existingScene;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void)setDisplayIdentity:(id)a3
{
}

- (void)setSceneDefinition:(id)a3
{
}

@end