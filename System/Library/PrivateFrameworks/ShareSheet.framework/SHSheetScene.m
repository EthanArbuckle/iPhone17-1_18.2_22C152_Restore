@interface SHSheetScene
+ (FBSceneWorkspace)sceneWorkspace;
- (BOOL)_viewClipsToBounds;
- (BOOL)activeUpdate;
- (BOOL)foreground;
- (BOOL)isActive;
- (BOOL)needsFenceAnimation;
- (CGRect)framePortrait;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBScene)scene;
- (SHSheetScene)initWithSession:(id)a3;
- (SHSheetSceneDelegate)delegate;
- (SHSheetSession)session;
- (SHSheetUIServiceClientContext)sessionContext;
- (UIEdgeInsets)safeAreaInsetsPortrait;
- (UIScenePresenter)scenePresenter;
- (UIView)sceneView;
- (_UISheetPresentationControllerConfiguration)_sheetConfiguration;
- (id)fenceCompletionHandler;
- (int64_t)hostProcessType;
- (int64_t)interfaceOrientation;
- (int64_t)presentationStyle;
- (int64_t)userInterfaceStyle;
- (void)_configureSceneSettings:(id)a3;
- (void)_didUpdateApplicationState:(id)a3;
- (void)_registerForApplicationStateChangeNotification;
- (void)_setSheetConfiguration:(id)a3;
- (void)_setViewClipsToBounds:(BOOL)a3;
- (void)_unregisterForApplicationStateChangeNotification;
- (void)_updateSettingsWithFence:(id)a3 transitionCoordinator:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)resetContext;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sendAction:(id)a3;
- (void)setActiveUpdate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setFenceCompletionHandler:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setFramePortrait:(CGRect)a3;
- (void)setHostProcessType:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setNeedsFenceAnimation:(BOOL)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSafeAreaInsetsPortrait:(UIEdgeInsets)a3;
- (void)setSessionContext:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)updateWithChange:(id)a3;
- (void)updateWithChange:(id)a3 transitionCoordinator:(id)a4;
- (void)updateWithSessionContext:(id)a3;
@end

@implementation SHSheetScene

+ (FBSceneWorkspace)sceneWorkspace
{
  if (sceneWorkspace_onceToken != -1) {
    dispatch_once(&sceneWorkspace_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sceneWorkspace_sceneWorkspace;
  return (FBSceneWorkspace *)v2;
}

void __30__SHSheetScene_sceneWorkspace__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getFBSceneWorkspaceClass_softClass;
  uint64_t v8 = getFBSceneWorkspaceClass_softClass;
  if (!getFBSceneWorkspaceClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getFBSceneWorkspaceClass_block_invoke;
    v4[3] = &unk_1E5A216E8;
    v4[4] = &v5;
    __getFBSceneWorkspaceClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [[v1 alloc] initWithIdentifier:@"com.apple.sharinguiservice"];
  v3 = (void *)sceneWorkspace_sceneWorkspace;
  sceneWorkspace_sceneWorkspace = v2;
}

- (SHSheetScene)initWithSession:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SHSheetScene;
  uint64_t v5 = [(SHSheetScene *)&v28 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    uint64_t v7 = [v4 createClientContext];
    sessionContext = v6->_sessionContext;
    v6->_sessionContext = (SHSheetUIServiceClientContext *)v7;

    v9 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
    [v9 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;

    if (v15 >= v17) {
      double v18 = v17;
    }
    else {
      double v18 = v15;
    }
    if (v15 >= v17) {
      double v19 = v15;
    }
    else {
      double v19 = v17;
    }
    v6->_framePortrait.origin.x = v11;
    v6->_framePortrait.origin.y = v13;
    v6->_framePortrait.size.width = v18;
    v6->_framePortrait.size.height = v19;
    v20 = [v4 activityViewController];
    v21 = [v20 traitCollection];
    v6->_userInterfaceStyle = [v21 userInterfaceStyle];

    v22 = [v4 activityViewController];
    v6->_presentationStyle = SHSheetPresentationControllerPresentationStyle(v22);

    v6->_interfaceOrientation = 1;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v23 = (void *)getFBDisplayManagerClass_softClass;
    uint64_t v33 = getFBDisplayManagerClass_softClass;
    if (!getFBDisplayManagerClass_softClass)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __getFBDisplayManagerClass_block_invoke;
      v29[3] = &unk_1E5A216E8;
      v29[4] = &v30;
      __getFBDisplayManagerClass_block_invoke((uint64_t)v29);
      v23 = (void *)v31[3];
    }
    id v24 = v23;
    _Block_object_dispose(&v30, 8);
    uint64_t v25 = [v24 mainConfiguration];
    displayConfiguration = v6->_displayConfiguration;
    v6->_displayConfiguration = (FBSDisplayConfiguration *)v25;

    v6->_hostProcessType = 0;
    v6->_foreground = 1;
    [(SHSheetScene *)v6 _registerForApplicationStateChangeNotification];
  }

  return v6;
}

- (void)dealloc
{
  [(SHSheetScene *)self _unregisterForApplicationStateChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)SHSheetScene;
  [(SHSheetScene *)&v3 dealloc];
}

- (BOOL)isActive
{
  uint64_t v2 = [(SHSheetScene *)self scene];
  char v3 = [v2 isActive];

  return v3;
}

- (UIView)sceneView
{
  return (UIView *)[(UIScenePresenter *)self->_scenePresenter presentationView];
}

- (void)activate
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (([(FBScene *)self->_scene isActive] & 1) == 0)
  {
    if (!self->_scene)
    {
      char v3 = share_sheet_log();
      id v4 = share_sheet_log();
      uint64_t v5 = [(SHSheetScene *)self session];
      v6 = [v5 activityViewController];
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v4, v6);

      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SetupScene", " enableTelemetry=YES ", buf, 2u);
      }

      uint64_t v8 = share_sheet_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "setting up new scene", buf, 2u);
      }

      v9 = NSString;
      double v10 = [(SHSheetScene *)self session];
      CGFloat v11 = [v10 identifier];
      double v12 = [v9 stringWithFormat:@"scene::SharingUI::%@", v11];

      CGFloat v13 = [(id)objc_opt_class() sceneWorkspace];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __24__SHSheetScene_activate__block_invoke;
      v27[3] = &unk_1E5A221F8;
      id v28 = v12;
      id v14 = v12;
      double v15 = [v13 createScene:v27];
      scene = self->_scene;
      self->_scene = v15;

      [(FBScene *)self->_scene setDelegate:self];
      [(FBScene *)self->_scene addObserver:self];
      double v17 = self->_scene;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __24__SHSheetScene_activate__block_invoke_2;
      v26[3] = &unk_1E5A22248;
      v26[4] = self;
      [(FBScene *)v17 configureParameters:v26];
      double v18 = [(FBScene *)self->_scene uiPresentationManager];
      double v19 = [v18 createPresenterWithIdentifier:@"default"];
      scenePresenter = self->_scenePresenter;
      self->_scenePresenter = v19;

      [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_20];
      [(UIScenePresenter *)self->_scenePresenter activate];
    }
    v21 = share_sheet_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_scene;
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v22;
      _os_log_impl(&dword_1A0AD8000, v21, OS_LOG_TYPE_DEFAULT, "activating scene:%@", buf, 0xCu);
    }

    [(FBScene *)self->_scene activateWithTransitionContext:0];
    v23 = [(SHSheetScene *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      uint64_t v25 = [(SHSheetScene *)self delegate];
      [v25 sceneDidBecomeActive:self];
    }
  }
}

void __24__SHSheetScene_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentifier:v2];
  id v4 = +[FBSSceneSpecification specification];
  [v3 setSpecification:v4];

  id v6 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:@"com.apple.sharinguiservice"];
  uint64_t v5 = [FBSSceneClientIdentity identityForProcessIdentity:v6];
  [v3 setClientIdentity:v5];
}

uint64_t __24__SHSheetScene_activate__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __24__SHSheetScene_activate__block_invoke_3;
  v3[3] = &unk_1E5A22220;
  v3[4] = *(void *)(a1 + 32);
  return [a2 updateSettingsWithBlock:v3];
}

void __24__SHSheetScene_activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) _configureSceneSettings:v4];
  }
  [v4 setInterfaceOrientationMode:2];
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
  id v3 = [*(id *)(a1 + 32) displayConfiguration];
  [v4 setDisplayConfiguration:v3];

  [v4 setForeground:1];
}

void __24__SHSheetScene_activate__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setAppearanceStyle:2];
  [v2 setBackgroundColorWhileHosting:0];
  [v2 setBackgroundColorWhileNotHosting:0];
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_scene)
  {
    id v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      scene = self->_scene;
      int v7 = 138412290;
      uint64_t v8 = scene;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "invalidating scene:%@", (uint8_t *)&v7, 0xCu);
    }

    [(UIScenePresenter *)self->_scenePresenter invalidate];
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

    [(FBScene *)self->_scene setDelegate:0];
    [(FBScene *)self->_scene removeObserver:self];
    [(FBScene *)self->_scene invalidate];
    id v6 = self->_scene;
    self->_scene = 0;
  }
}

- (void)_registerForApplicationStateChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__didUpdateApplicationState_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel__didUpdateApplicationState_ name:*MEMORY[0x1E4FB2628] object:0];
}

- (void)_unregisterForApplicationStateChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2628] object:0];
}

- (void)_didUpdateApplicationState:(id)a3
{
}

- (void)_setSheetConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = self->__sheetConfiguration;
  int v7 = (_UISheetPresentationControllerConfiguration *)v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      char v9 = [(_UISheetPresentationControllerConfiguration *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->__sheetConfiguration, a3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__SHSheetScene__setSheetConfiguration___block_invoke;
    v10[3] = &unk_1E5A22220;
    CGFloat v11 = v8;
    [(SHSheetScene *)self _updateSettingsWithFence:v10 transitionCoordinator:0];
  }
LABEL_8:
}

void __39__SHSheetScene__setSheetConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setSheetConfiguration:*(void *)(a1 + 32)];
  }
}

- (_UISheetPresentationControllerConfiguration)_sheetConfiguration
{
  return self->__sheetConfiguration;
}

- (void)setSessionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetScene *)self sessionContext];
  id v6 = (SHSheetUIServiceClientContext *)v4;
  CGFloat v11 = v6;
  if (v5 == v6)
  {

    sessionContext = v11;
LABEL_8:

    uint64_t v8 = v11;
    goto LABEL_9;
  }
  if ((v6 != 0) == (v5 == 0))
  {

    uint64_t v8 = v11;
    goto LABEL_7;
  }
  BOOL v7 = [(SHSheetUIServiceClientContext *)v5 isEqual:v6];

  uint64_t v8 = v11;
  if (!v7)
  {
LABEL_7:
    double v10 = v8;
    sessionContext = self->_sessionContext;
    self->_sessionContext = v10;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setSafeAreaInsetsPortrait:(UIEdgeInsets)a3
{
  if (a3.left != self->_safeAreaInsetsPortrait.left
    || a3.top != self->_safeAreaInsetsPortrait.top
    || a3.right != self->_safeAreaInsetsPortrait.right
    || a3.bottom != self->_safeAreaInsetsPortrait.bottom)
  {
    self->_safeAreaInsetsPortrait = a3;
    [(SHSheetScene *)self setNeedsFenceAnimation:1];
  }
}

- (void)setFramePortrait:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_framePortrait))
  {
    self->_framePortrait.origin.CGFloat x = x;
    self->_framePortrait.origin.CGFloat y = y;
    self->_framePortrait.size.CGFloat width = width;
    self->_framePortrait.size.CGFloat height = height;
    [(SHSheetScene *)self setNeedsFenceAnimation:1];
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3) {
    self->_userInterfaceStyle = a3;
  }
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3) {
    self->_presentationStyle = a3;
  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    [(SHSheetScene *)self setNeedsFenceAnimation:1];
  }
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = (FBSDisplayConfiguration *)a3;
  displayConfiguration = self->_displayConfiguration;
  p_displayConfiguration = &self->_displayConfiguration;
  if (displayConfiguration != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_displayConfiguration, a3);
    id v5 = v8;
  }
}

- (void)setHostProcessType:(int64_t)a3
{
  int64_t hostProcessType = self->_hostProcessType;
  if (hostProcessType != a3 && hostProcessType <= 0) {
    self->_int64_t hostProcessType = a3;
  }
}

- (void)setForeground:(BOOL)a3
{
  if (self->_foreground != a3) {
    self->_foreground = a3;
  }
}

- (void)sendAction:(id)a3
{
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v4 = [(SHSheetScene *)self scene];
  [v4 sendActions:v5];
}

- (void)updateWithSessionContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SHSheetScene_updateWithSessionContext___block_invoke;
  v6[3] = &unk_1E5A222B0;
  id v7 = v4;
  id v5 = v4;
  [(SHSheetScene *)self updateWithChange:v6];
}

uint64_t __41__SHSheetScene_updateWithSessionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSessionContext:*(void *)(a1 + 32)];
}

- (void)updateWithChange:(id)a3
{
}

- (void)updateWithChange:(id)a3 transitionCoordinator:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void (**)(id, SHSheetScene *, unsigned char *))a3;
  [(SHSheetScene *)self setActiveUpdate:1];
  char v17 = 0;
  v7[2](v7, self, &v17);

  BOOL v8 = 0;
  if (!v17) {
    BOOL v8 = [(SHSheetScene *)self needsFenceAnimation];
  }
  char v9 = share_sheet_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412290;
    double v19 = v10;
    _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "scene update change with fenceAnimation:%@", buf, 0xCu);
  }
  if (v8)
  {
    CGFloat v11 = [(SHSheetScene *)self fenceCompletionHandler];
    [(SHSheetScene *)self setFenceCompletionHandler:0];
    if (v11)
    {
      double v12 = (void *)MEMORY[0x1E4F39CF8];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke;
      v15[3] = &unk_1E5A21760;
      id v16 = v11;
      [v12 addCommitHandler:v15 forPhase:5];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_3;
    v14[3] = &unk_1E5A22220;
    v14[4] = self;
    [(SHSheetScene *)self _updateSettingsWithFence:v14 transitionCoordinator:v6];
  }
  else
  {
    CGFloat v11 = [(SHSheetScene *)self scene];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_4;
    v13[3] = &unk_1E5A222D8;
    v13[4] = self;
    [v11 performUpdate:v13];
  }

  [(SHSheetScene *)self setNeedsFenceAnimation:0];
  [(SHSheetScene *)self setActiveUpdate:0];
}

void __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_2;
  block[3] = &unk_1E5A21760;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) _configureSceneSettings:v3];
  }
}

void __55__SHSheetScene_updateWithChange_transitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) _configureSceneSettings:v3];
  }
}

- (void)_updateSettingsWithFence:(id)a3 transitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SHSheetScene *)self scene];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SHSheetScene__updateSettingsWithFence_transitionCoordinator___block_invoke;
  v11[3] = &unk_1E5A22300;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 updateSettingsWithTransitionBlock:v11];
}

id __63__SHSheetScene__updateSettingsWithFence_transitionCoordinator___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled])
  {
    id v2 = *(void **)(a1 + 32);
    if (v2)
    {
      id v3 = (void *)MEMORY[0x1E4F627E0];
      [v2 transitionDuration];
      objc_msgSend(v3, "settingsWithDuration:");
    }
    else
    {
      [MEMORY[0x1E4FB1EB0] _currentAnimationSettings];
    id v4 = };
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [MEMORY[0x1E4FB1458] transitionContext];
  [v5 setAnimationSettings:v4];
  id v6 = [MEMORY[0x1E4FB1B70] _synchronizedDrawingFence];
  [v5 setAnimationFence:v6];

  return v5;
}

- (void)_configureSceneSettings:(id)a3
{
  id v8 = a3;
  [(SHSheetScene *)self safeAreaInsetsPortrait];
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:");
  objc_msgSend(v8, "setUserInterfaceStyle:", -[SHSheetScene userInterfaceStyle](self, "userInterfaceStyle"));
  [(SHSheetScene *)self framePortrait];
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setPresentationStyle:", -[SHSheetScene presentationStyle](self, "presentationStyle"));
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v8, "setApplicationState:", objc_msgSend(v4, "applicationState"));

  id v5 = [(SHSheetScene *)self sessionContext];
  [v8 setSessionContext:v5];

  objc_msgSend(v8, "setInterfaceOrientation:", -[SHSheetScene interfaceOrientation](self, "interfaceOrientation"));
  id v6 = [(SHSheetScene *)self displayConfiguration];

  if (v6)
  {
    id v7 = [(SHSheetScene *)self displayConfiguration];
    [v8 setDisplayConfiguration:v7];
  }
  objc_msgSend(v8, "setHostProcessType:", -[SHSheetScene hostProcessType](self, "hostProcessType"));
  objc_msgSend(v8, "setForeground:", -[SHSheetScene foreground](self, "foreground"));
}

- (void)resetContext
{
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a4;
  if (v6 && self->_scene == a3)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SHSheetScene sceneDidDeactivate:withError:]((uint64_t)v6, v7);
    }

    [(SHSheetScene *)self activate];
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v7;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "did receive actions:%@ from scene:%@", buf, 0x16u);
  }
  v29 = v6;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    unint64_t v13 = 0x1E5A20000uLL;
    unint64_t v14 = 0x1E5A20000uLL;
    uint64_t v30 = self;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          if ([v17 type] == 10)
          {
            double v18 = [(SHSheetScene *)self session];
            [v18 activityViewController];
            uint64_t v19 = v11;
            uint64_t v20 = v12;
            unint64_t v21 = v13;
            id v22 = v9;
            char v24 = v23 = v14;
            [v24 _endDelayingPresentation];

            unint64_t v14 = v23;
            id v9 = v22;
            unint64_t v13 = v21;
            uint64_t v12 = v20;
            uint64_t v11 = v19;
            self = v30;
          }
          uint64_t v25 = [(SHSheetScene *)self delegate];
          [v25 scene:self didReceiveAction:v17];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = v16;
            uint64_t v25 = [(SHSheetScene *)self delegate];
            [v25 scene:self didReceiveMetadataUpdateAction:v26];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = v16;
              uint64_t v25 = [(SHSheetScene *)self delegate];
              [v25 scene:self didReceiveSuggestionAction:v27];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_19;
              }
              id v28 = v16;
              uint64_t v25 = [(SHSheetScene *)self delegate];
              [v25 scene:self didReceiveDraggingAction:v28];
            }
          }
        }

LABEL_19:
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v6 = share_sheet_log();
  id v7 = share_sheet_log();
  id v8 = [(SHSheetScene *)self session];
  id v9 = [v8 activityViewController];
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v7, v9);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v6, OS_SIGNPOST_INTERVAL_END, v10, "SetupScene", " enableTelemetry=YES ", v11, 2u);
  }
}

- (BOOL)_viewClipsToBounds
{
  return self->_viewClipsToBounds;
}

- (void)_setViewClipsToBounds:(BOOL)a3
{
  self->_viewClipsToBounds = a3;
}

- (SHSheetSceneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetSceneDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetUIServiceClientContext)sessionContext
{
  return self->_sessionContext;
}

- (CGRect)framePortrait
{
  double x = self->_framePortrait.origin.x;
  double y = self->_framePortrait.origin.y;
  double width = self->_framePortrait.size.width;
  double height = self->_framePortrait.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortrait
{
  double top = self->_safeAreaInsetsPortrait.top;
  double left = self->_safeAreaInsetsPortrait.left;
  double bottom = self->_safeAreaInsetsPortrait.bottom;
  double right = self->_safeAreaInsetsPortrait.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (id)fenceCompletionHandler
{
  return self->_fenceCompletionHandler;
}

- (void)setFenceCompletionHandler:(id)a3
{
}

- (SHSheetSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (SHSheetSession *)WeakRetained;
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (BOOL)activeUpdate
{
  return self->_activeUpdate;
}

- (void)setActiveUpdate:(BOOL)a3
{
  self->_activeUpdate = a3;
}

- (BOOL)needsFenceAnimation
{
  return self->_needsFenceAnimation;
}

- (void)setNeedsFenceAnimation:(BOOL)a3
{
  self->_needsFenceAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong(&self->_fenceCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__sheetConfiguration, 0);
}

- (void)sceneDidDeactivate:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "scene did deactivate with error:%@", (uint8_t *)&v2, 0xCu);
}

@end