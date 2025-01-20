@interface PGPIPRemoteObjectSceneController
+ (id)sharedSceneWorkspace;
- (BOOL)isInvalidated;
- (PGPIPRemoteObjectSceneController)initWithRemoteObject:(id)a3 requestedSceneIdentifier:(id)a4 affectsAppLifeCycle:(BOOL)a5;
- (UIView)sceneView;
- (void)_performAnimationWithType:(int64_t)a3 initialSpringVelocity:(double)a4 animations:(id)a5 completion:(id)a6;
- (void)activateIfNeeded;
- (void)dealloc;
- (void)invalidate;
- (void)setForeground:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)updateInterfaceOrientation;
- (void)updateSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5;
@end

@implementation PGPIPRemoteObjectSceneController

+ (id)sharedSceneWorkspace
{
  if (sharedSceneWorkspace_onceToken != -1) {
    dispatch_once(&sharedSceneWorkspace_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedSceneWorkspace_shared;

  return v2;
}

uint64_t __56__PGPIPRemoteObjectSceneController_sharedSceneWorkspace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F624B0]) initWithIdentifier:@"com.apple.pegasus.pictureinpicture"];
  uint64_t v1 = sharedSceneWorkspace_shared;
  sharedSceneWorkspace_shared = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (PGPIPRemoteObjectSceneController)initWithRemoteObject:(id)a3 requestedSceneIdentifier:(id)a4 affectsAppLifeCycle:(BOOL)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PGPIPRemoteObjectSceneController;
  v9 = [(PGPIPRemoteObjectSceneController *)&v34 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v9->_remoteObject, v7);
    v11 = [(id)objc_opt_class() sharedSceneWorkspace];
    v12 = [v11 sceneWithIdentifier:v8];
    v13 = v12;
    if (v12)
    {
      v14 = v12;
      scene = v10->_scene;
      v10->_scene = v14;
LABEL_9:

      goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x1E4F963E8];
    v17 = (void *)MEMORY[0x1E4F963F8];
    v18 = [v7 pictureInPictureApplication];
    v19 = objc_msgSend(v17, "identifierWithPid:", objc_msgSend(v18, "processIdentifier"));
    id v33 = 0;
    v20 = [v16 handleForIdentifier:v19 error:&v33];
    scene = (FBScene *)v33;

    if (v20)
    {
      v21 = [v20 identity];
      v22 = [FBSSceneClientIdentity identityForProcessIdentity:v21];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke;
      v30[3] = &unk_1E610D1B8;
      id v31 = v22;
      id v32 = v8;
      id v23 = v22;
      uint64_t v24 = [v11 createScene:v30];
      v25 = v10->_scene;
      v10->_scene = (FBScene *)v24;

      uint64_t v26 = [v7 sourceSceneSettingsInterfaceOrientation];
      v27 = v10->_scene;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_2;
      v29[3] = &__block_descriptor_40_e35_v16__0__FBSMutableSceneParameters_8l;
      v29[4] = v26;
      [(FBScene *)v27 configureParameters:v29];
    }
    else
    {
      v21 = PGLogCommon();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      _PGLogMethodProem(v10, 1);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v36 = v23;
      __int16 v37 = 2112;
      v38 = scene;
      _os_log_error_impl(&dword_1B5645000, v21, OS_LOG_TYPE_ERROR, "%@ not able to create scene, RBSProcessHandle look up failed with error: %@", buf, 0x16u);
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

void __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setClientIdentity:v3];
  [v4 setIdentifier:*(void *)(a1 + 40)];
  v5 = objc_alloc_init(PGPIPRemoteObjectSceneSpecification);
  [v4 setSpecification:v5];
}

uint64_t __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_3;
  v3[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 updateSettingsWithBlock:v3];
}

void __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setInterfaceOrientation:v2];
  uint64_t v3 = [MEMORY[0x1E4F62420] mainConfiguration];
  [v4 setDisplayConfiguration:v3];

  [v4 setInterfaceOrientationMode:2];
  [v4 setInterruptionPolicy:1];
}

- (UIView)sceneView
{
  sceneView = self->_sceneView;
  if (!sceneView)
  {
    scenePresenter = self->_scenePresenter;
    if (!scenePresenter)
    {
      v5 = [(FBScene *)self->_scene uiPresentationManager];
      v6 = [MEMORY[0x1E4F29128] UUID];
      id v7 = [v6 UUIDString];
      id v8 = [v5 createPresenterWithIdentifier:v7];
      v9 = self->_scenePresenter;
      self->_scenePresenter = v8;

      scenePresenter = self->_scenePresenter;
    }
    [(UIScenePresenter *)scenePresenter modifyPresentationContext:&__block_literal_global_117];
    [(UIScenePresenter *)self->_scenePresenter activate];
    v10 = [(UIScenePresenter *)self->_scenePresenter presentationView];
    v11 = self->_sceneView;
    self->_sceneView = v10;

    sceneView = self->_sceneView;
  }

  return sceneView;
}

void __45__PGPIPRemoteObjectSceneController_sceneView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
}

- (void)activateIfNeeded
{
  if ([(FBScene *)self->_scene isValid])
  {
    if (([(FBScene *)self->_scene isActive] & 1) == 0)
    {
      scene = self->_scene;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __52__PGPIPRemoteObjectSceneController_activateIfNeeded__block_invoke;
      v4[3] = &unk_1E610D240;
      v4[4] = self;
      [(FBScene *)scene performUpdate:v4];
    }
  }
}

uint64_t __52__PGPIPRemoteObjectSceneController_activateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40), *(double *)(*(void *)(a1 + 32) + 48));
}

- (void)updateInterfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteObject);
  uint64_t v4 = [WeakRetained sourceSceneSettingsInterfaceOrientation];

  id v8 = [(FBScene *)self->_scene settings];
  if ([v8 interfaceOrientation] == v4)
  {
  }
  else
  {
    int v5 = [(FBScene *)self->_scene isValid];

    if (v5)
    {
      char v6 = [(FBScene *)self->_scene isActive];
      scene = self->_scene;
      if (v6)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke_2;
        v9[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
        v9[4] = v4;
        [(FBScene *)scene updateSettings:v9];
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke;
        v10[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
        v10[4] = v4;
        [(FBScene *)scene performUpdate:v10];
      }
    }
  }
}

uint64_t __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInterfaceOrientation:*(void *)(a1 + 32)];
}

uint64_t __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInterfaceOrientation:*(void *)(a1 + 32)];
}

- (void)updateSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5
{
  self->_currentFrame.size = a3;
  self->_currentFrame.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  if ([(FBScene *)self->_scene isActive])
  {
    id v8 = [(FBScene *)self->_scene settings];
    int v9 = [v8 isForeground];

    if (v9)
    {
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x3032000000;
      v12[3] = __Block_byref_object_copy__2;
      v12[4] = __Block_byref_object_dispose__2;
      id v13 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke;
      v11[3] = &unk_1E610D2B0;
      v11[4] = self;
      v11[5] = v12;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_3;
      v10[3] = &unk_1E610D2D8;
      v10[4] = v12;
      [(PGPIPRemoteObjectSceneController *)self _performAnimationWithType:a4 initialSpringVelocity:v11 animations:v10 completion:a5];
      _Block_object_dispose(v12, 8);
    }
  }
}

void __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_2;
  v7[3] = &unk_1E610D288;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v2;
  uint64_t v9 = v5;
  v7[4] = v3;
  id v6 = v2;
  [v4 performUpdate:v7];
}

void __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "setFrame:", *(double *)(a1[4] + 24), *(double *)(a1[4] + 32), *(double *)(a1[4] + 40), *(double *)(a1[4] + 48));
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v7 = v5;
  [v7 setAnimationFence:v6];
  [v7 setAnimationSettings:a1[5]];
}

void __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA99D5F0]();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)_performAnimationWithType:(int64_t)a3 initialSpringVelocity:(double)a4 animations:(id)a5 completion:(id)a6
{
  id v10 = a5;
  uint64_t v9 = (void (**)(id, uint64_t))a6;
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:animations:completion:", v10, v9, a4);
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E4F42FF0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v10, v9);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E4F42FF0], "PG_performWithoutAnimation:", v10);
      v9[2](v9, 1);
      break;
  }
}

- (void)setForeground:(BOOL)a3
{
  int v3 = a3;
  id v8 = [(FBScene *)self->_scene settings];
  if ([v8 isForeground] == v3)
  {
  }
  else
  {
    int v5 = [(FBScene *)self->_scene isValid];

    if (v5)
    {
      if (v3 && ([(FBScene *)self->_scene isActive] & 1) == 0)
      {
        scene = self->_scene;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke;
        v11[3] = &unk_1E610D300;
        char v12 = v3;
        v11[4] = self;
        [(FBScene *)scene performUpdate:v11];
      }
      else
      {
        uint64_t v6 = self->_scene;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke_2;
        v9[3] = &unk_1E610D328;
        char v10 = v3;
        v9[4] = self;
        [(FBScene *)v6 updateSettings:v9];
      }
    }
  }
}

void __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setForeground:v3];
  objc_msgSend(v4, "setFrame:", *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40), *(double *)(*(void *)(a1 + 32) + 48));
}

void __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setForeground:v3];
  objc_msgSend(v4, "setFrame:", *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40), *(double *)(*(void *)(a1 + 32) + 48));
}

- (BOOL)isInvalidated
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setInvalidated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  if (![(PGPIPRemoteObjectSceneController *)self isInvalidated])
  {
    [(PGPIPRemoteObjectSceneController *)self setInvalidated:1];
    id v4 = self->_scene;
    uint64_t v3 = v4;
    BSDispatchMain();
  }
}

uint64_t __46__PGPIPRemoteObjectSceneController_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateSettings:&__block_literal_global_124];
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

uint64_t __46__PGPIPRemoteObjectSceneController_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)dealloc
{
  [(PGPIPRemoteObjectSceneController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PGPIPRemoteObjectSceneController;
  [(PGPIPRemoteObjectSceneController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_destroyWeak((id *)&self->_remoteObject);
}

@end