@interface _SBKeyboardServiceSceneResolver
- (SBSystemUIScenesCoordinator)systemUIScenesCoordinator;
- (id)sceneForSceneIdentityToken:(id)a3 inProcess:(int)a4;
- (void)setSystemUIScenesCoordinator:(id)a3;
@end

@implementation _SBKeyboardServiceSceneResolver

- (id)sceneForSceneIdentityToken:(id)a3 inProcess:(int)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v7 = [MEMORY[0x1E4F62490] sharedInstance];
  id v21 = [v7 sceneFromIdentityToken:v6];

  v8 = (void *)v17[5];
  if (!v8)
  {
    systemUIScenesCoordinator = self->_systemUIScenesCoordinator;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72___SBKeyboardServiceSceneResolver_sceneForSceneIdentityToken_inProcess___block_invoke;
    v12[3] = &unk_1E6AF4E50;
    int v15 = a4;
    id v13 = v6;
    v14 = &v16;
    [(SBSystemUIScenesCoordinator *)systemUIScenesCoordinator enumerateScenesWithBlock:v12];

    v8 = (void *)v17[5];
  }
  id v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (SBSystemUIScenesCoordinator)systemUIScenesCoordinator
{
  return self->_systemUIScenesCoordinator;
}

- (void)setSystemUIScenesCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end