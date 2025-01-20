@interface SHSheetCustomSceneViewController
+ (FBSceneWorkspace)sceneWorkspace;
- (FBScene)scene;
- (RBSProcessIdentity)processIdentity;
- (SHSheetCustomSceneViewController)initWithProcessIdentity:(id)a3;
- (UIScenePresenter)scenePresenter;
- (UIView)sceneView;
- (void)_setupScene;
- (void)_tearDownScene;
- (void)dealloc;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation SHSheetCustomSceneViewController

+ (FBSceneWorkspace)sceneWorkspace
{
  if (sceneWorkspace_onceToken_0 != -1) {
    dispatch_once(&sceneWorkspace_onceToken_0, &__block_literal_global_42);
  }
  v2 = (void *)sceneWorkspace_sceneWorkspace_0;
  return (FBSceneWorkspace *)v2;
}

void __50__SHSheetCustomSceneViewController_sceneWorkspace__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getFBSceneWorkspaceClass_softClass_0;
  uint64_t v8 = getFBSceneWorkspaceClass_softClass_0;
  if (!getFBSceneWorkspaceClass_softClass_0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getFBSceneWorkspaceClass_block_invoke_0;
    v4[3] = &unk_1E5A216E8;
    v4[4] = &v5;
    __getFBSceneWorkspaceClass_block_invoke_0((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [[v1 alloc] initWithIdentifier:@"com.apple.sharinguiservice.customscene"];
  v3 = (void *)sceneWorkspace_sceneWorkspace_0;
  sceneWorkspace_sceneWorkspace_0 = v2;
}

- (SHSheetCustomSceneViewController)initWithProcessIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetCustomSceneViewController;
  v6 = [(SHSheetCustomSceneViewController *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_processIdentity, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SHSheetCustomSceneViewController *)self _tearDownScene];
  v3.receiver = self;
  v3.super_class = (Class)SHSheetCustomSceneViewController;
  [(SHSheetCustomSceneViewController *)&v3 dealloc];
}

- (void)_tearDownScene
{
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  [(FBScene *)self->_scene setDelegate:0];
  [(FBScene *)self->_scene removeObserver:self];
  [(FBScene *)self->_scene invalidate];
  scene = self->_scene;
  self->_scene = 0;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SHSheetCustomSceneViewController;
  [(SHSheetCustomSceneViewController *)&v3 viewDidLayoutSubviews];
  [(SHSheetCustomSceneViewController *)self _setupScene];
}

- (void)_setupScene
{
  objc_super v3 = NSString;
  v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v3 stringWithFormat:@"scene::SharingUI::%@", v4];

  scene = self->_scene;
  if (!scene)
  {
    uint64_t v7 = [(id)objc_opt_class() sceneWorkspace];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__SHSheetCustomSceneViewController__setupScene__block_invoke;
    v20[3] = &unk_1E5A23680;
    id v21 = v5;
    v22 = self;
    uint64_t v8 = [v7 createScene:v20];
    objc_super v9 = self->_scene;
    self->_scene = v8;

    [(FBScene *)self->_scene setDelegate:self];
    [(FBScene *)self->_scene addObserver:self];
    v10 = self->_scene;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__SHSheetCustomSceneViewController__setupScene__block_invoke_2;
    v19[3] = &unk_1E5A22248;
    v19[4] = self;
    [(FBScene *)v10 configureParameters:v19];
    v11 = [(FBScene *)self->_scene uiPresentationManager];
    v12 = [v11 createPresenterWithIdentifier:@"default"];
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = v12;

    [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_23_0];
    [(UIScenePresenter *)self->_scenePresenter activate];
    v14 = [(UIScenePresenter *)self->_scenePresenter presentationView];
    v15 = [(SHSheetCustomSceneViewController *)self view];
    [v15 insertSubview:v14 atIndex:0];

    v16 = [(SHSheetCustomSceneViewController *)self view];
    [v16 setNeedsLayout];

    [(UIView *)v14 setClipsToBounds:1];
    v17 = [(UIView *)v14 layer];
    [v17 setName:@"Scene View"];

    sceneView = self->_sceneView;
    self->_sceneView = v14;

    scene = self->_scene;
  }
  [(FBScene *)scene activateWithTransitionContext:0];
}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIdentifier:v3];
  id v5 = +[FBSSceneSpecification specification];
  [v4 setSpecification:v5];

  v6 = FBSSceneClientIdentity;
  id v8 = [*(id *)(a1 + 40) processIdentity];
  uint64_t v7 = [v6 identityForProcessIdentity:v8];
  [v4 setClientIdentity:v7];
}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SHSheetCustomSceneViewController__setupScene__block_invoke_3;
  v3[3] = &unk_1E5A22220;
  v3[4] = *(void *)(a1 + 32);
  id v2 = a2;
  [v2 updateSettingsWithBlock:v3];
  [v2 updateClientSettingsWithBlock:&__block_literal_global_16];
}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) view];
  [v4 frame];
  objc_msgSend(v3, "setFrame:");

  [v3 setInterfaceOrientation:1];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v5 = (void *)getFBDisplayManagerClass_softClass_0;
  uint64_t v12 = getFBDisplayManagerClass_softClass_0;
  if (!getFBDisplayManagerClass_softClass_0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getFBDisplayManagerClass_block_invoke_0;
    v8[3] = &unk_1E5A216E8;
    v8[4] = &v9;
    __getFBDisplayManagerClass_block_invoke_0((uint64_t)v8);
    id v5 = (void *)v10[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  uint64_t v7 = [v6 mainConfiguration];
  [v3 setDisplayConfiguration:v7];

  [v3 setForeground:1];
}

uint64_t __47__SHSheetCustomSceneViewController__setupScene__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setPreferredInterfaceOrientation:1];
}

void __47__SHSheetCustomSceneViewController__setupScene__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
  [v2 setBackgroundColorWhileHosting:0];
  [v2 setBackgroundColorWhileNotHosting:0];
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = (FBScene *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_scene == v6)
  {
    if (v7)
    {
      uint64_t v9 = share_sheet_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = v8;
        _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "sceneDidDeactivate error:%@", (uint8_t *)&v10, 0xCu);
      }
    }
    [(SHSheetCustomSceneViewController *)self _setupScene];
  }
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
}

@end