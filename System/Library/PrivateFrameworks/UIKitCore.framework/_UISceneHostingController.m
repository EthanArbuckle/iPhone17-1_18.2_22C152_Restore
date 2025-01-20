@interface _UISceneHostingController
+ (void)initialize;
- (BOOL)isActive;
- (UIViewController)sceneViewController;
- (_UISceneHostingActivationControlling)activationController;
- (_UISceneHostingController)initWithAdvancedConfiguration:(id)a3;
- (_UISceneHostingController)initWithProcessIdentity:(id)a3 sceneSpecification:(id)a4;
- (_UISceneHostingControllerDelegate)delegate;
- (_UISceneHostingIntelligenceSupportHost)intelligenceHostSceneComponent;
- (_UISceneHostingSheetPresentationHostProviding)_remoteSheetProvider;
- (_UISceneHostingView)sceneView;
- (id)_eventDeferringComponent;
- (id)activationStateComponent;
- (id)contentSizePreferenceProvider;
- (id)keyboardSuppressionController;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)traitCollectionReceiver;
- (uint64_t)_fbScene;
- (void)_clientIsReady;
- (void)_prototype_requestSettingsUpdateWithFence:(BOOL)a3;
- (void)_scene:(id)a3 isMovingToParent:(id)a4;
- (void)_updateSceneSettingsFromSettingsProvidersWithFence:(BOOL)a3;
- (void)activate:(id)a3;
- (void)addSettingsProvider:(id)a3;
- (void)addSettingsProvider:(id)a3 atIndexPath:(int64_t)a4;
- (void)beginObservingNotifications;
- (void)createSceneWithConfiguration:(id)a3;
- (void)deactivate:(id)a3;
- (void)dealloc;
- (void)endObservingNotifications;
- (void)invalidate;
- (void)performBlock:(void *)a3 withClientTransitionContext:;
- (void)removeSettingsProvider:(id)a3;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneWillEnterBackground:(id)a3;
- (void)sendAction:(id)a3;
- (void)setActivationController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _UISceneHostingController

- (id)activationStateComponent
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  v3 = fbScene;
  uint64_t v4 = objc_opt_class();
  v5 = [(FBScene *)v3 componentForExtension:v4 ofClass:objc_opt_class()];

  return v5;
}

- (_UISceneHostingIntelligenceSupportHost)intelligenceHostSceneComponent
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  v3 = fbScene;
  uint64_t v4 = objc_opt_class();
  v5 = [(FBScene *)v3 componentForExtension:v4 ofClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  return (_UISceneHostingIntelligenceSupportHost *)v9;
}

- (id)contentSizePreferenceProvider
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  v3 = fbScene;
  uint64_t v4 = objc_opt_class();
  v5 = [(FBScene *)v3 componentForExtension:v4 ofClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_379);
  }
}

- (_UISceneHostingController)initWithAdvancedConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISceneHostingController;
  v5 = [(_UISceneHostingController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [[_UISceneHostingView alloc] initWithSceneHostingController:v5];
    sceneView = v5->_sceneView;
    v5->_sceneView = v6;

    v8 = -[_UISceneHostingViewController initWithSceneHostingController:]([_UISceneHostingViewController alloc], v5);
    sceneViewController = v5->_sceneViewController;
    v5->_sceneViewController = (_UISceneHostingViewController *)v8;

    [(_UISceneHostingController *)v5 createSceneWithConfiguration:v4];
    [(_UISceneHostingController *)v5 setActivationController:0];
    [(_UISceneHostingController *)v5 beginObservingNotifications];
  }

  return v5;
}

- (_UISceneHostingController)initWithProcessIdentity:(id)a3 sceneSpecification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_UISceneHostingControllerAdvancedConfiguration alloc] initWithProcessIdentity:v7];

  [(_UISceneHostingControllerAdvancedConfiguration *)v8 setSceneSpecification:v6];
  id v9 = [(_UISceneHostingController *)self initWithAdvancedConfiguration:v8];

  return v9;
}

- (void)createSceneWithConfiguration:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_fbScene)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"_UISceneHostingController.m" lineNumber:100 description:@"A scene already exists!"];
  }
  id v6 = [v5 sceneWorkspace];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __58___UISceneHostingController_createSceneWithConfiguration___block_invoke;
  v32[3] = &unk_1E52FE0E0;
  id v7 = v5;
  id v33 = v7;
  v8 = [v6 createScene:v32];
  fbScene = self->_fbScene;
  self->_fbScene = v8;

  [(FBScene *)self->_fbScene setDelegate:self];
  [(_UISceneHostingView *)self->_sceneView setPresentedScene:self->_fbScene];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = objc_msgSend(v7, "additionalExtensions", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        [(FBScene *)self->_fbScene addExtension:*(void *)(*((void *)&v28 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v12);
  }

  v15 = [(_UISceneHostingController *)self contentSizePreferenceProvider];
  [v15 setContentSizePreferenceReceiver:self->_sceneViewController];

  v16 = [(_UISceneHostingController *)self _remoteSheetProvider];
  [v16 _setTargetViewController:self->_sceneViewController];

  v17 = [(FBScene *)self->_fbScene _relationshipManagementHostComponent];
  v18 = [(_UISceneHostingController *)self _eventDeferringComponent];
  [v17 addObserver:v18];

  v19 = [(FBScene *)self->_fbScene _relationshipManagementHostComponent];
  [v19 addObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_opt_respondsToSelector();

  [(_UISceneHostingController *)self addSettingsProvider:self->_sceneView];
  id v21 = objc_loadWeakRetained((id *)&self->_delegate);
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    [(_UISceneHostingController *)self addSettingsProvider:v23];
  }
  v24 = [v7 sceneSpecification];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [v24 userActivity];
    userActivity = self->_userActivity;
    self->_userActivity = v25;
  }
  [(FBScene *)self->_fbScene updateSettings:&__block_literal_global_19_0];
}

- (UIViewController)sceneViewController
{
  return (UIViewController *)self->_sceneViewController;
}

- (void)sendAction:(id)a3
{
  id v9 = a3;
  if ([(FBScene *)self->_fbScene isActive])
  {
    fbScene = self->_fbScene;
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(FBScene *)fbScene sendActions:v5];
  }
  else
  {
    queuedActions = self->_queuedActions;
    if (!queuedActions)
    {
      id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v8 = self->_queuedActions;
      self->_queuedActions = v7;

      queuedActions = self->_queuedActions;
    }
    [(NSMutableArray *)queuedActions addObject:v9];
  }
}

- (void)performBlock:(void *)a3 withClientTransitionContext:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));

    if (v6 && WeakRetained)
    {
      v8 = [(id)UIApp _systemAnimationFenceExemptQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __70___UISceneHostingController_performBlock_withClientTransitionContext___block_invoke;
      v9[3] = &unk_1E52E3298;
      id v10 = v6;
      uint64_t v11 = a1;
      uint64_t v12 = v5;
      [v8 performAsync:v9];
    }
    else
    {
      v5[2](v5);
    }
  }
}

- (void)invalidate
{
  [(FBScene *)self->_fbScene invalidate];
  [(_UISceneHostingController *)self endObservingNotifications];
  [(_UISceneHostingActivationHandle *)self->_activationHandle invalidate];
  activationHandle = self->_activationHandle;
  self->_activationHandle = 0;

  [(_UISceneHostingActivationControlling *)self->_activationController endManagingHostedSceneActivationForHostingController:self];
  activationController = self->_activationController;
  self->_activationController = 0;
}

- (void)dealloc
{
  [(_UISceneHostingController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UISceneHostingController;
  [(_UISceneHostingController *)&v3 dealloc];
}

- (void)_updateSceneSettingsFromSettingsProvidersWithFence:(BOOL)a3
{
  fbScene = self->_fbScene;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80___UISceneHostingController__updateSceneSettingsFromSettingsProvidersWithFence___block_invoke;
  v4[3] = &unk_1E52FE108;
  v4[4] = self;
  BOOL v5 = a3;
  [(FBScene *)fbScene _performUpdateWithoutActivation:v4];
}

- (void)_clientIsReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UISceneHostingController *)self delegate];
    [v5 clientIsReady];
  }
}

- (void)_prototype_requestSettingsUpdateWithFence:(BOOL)a3
{
  if (self)
  {
    *(void *)&a3 = !self->_fencesDisabled && a3;
    [(_UISceneHostingController *)self _updateSceneSettingsFromSettingsProvidersWithFence:a3];
  }
}

- (void)_scene:(id)a3 isMovingToParent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 _windowHostingScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);

  if (v6 != WeakRetained)
  {
    objc_storeWeak((id *)&self->_parentScene, v6);
    v8 = *(id *)(__UILogGetCategoryCachedImpl("UISceneHosting", &_scene_isMovingToParent____s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v9 = NSString;
        id v10 = self;
        uint64_t v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        uint64_t v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10];
      }
      else
      {
        uint64_t v13 = @"(nil)";
      }
      uint64_t v14 = v13;
      id v15 = v5;
      if (v15)
      {
        v16 = NSString;
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
      }
      else
      {
        v19 = @"(nil)";
      }

      *(_DWORD *)buf = 138412546;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v19;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%@ Scene hosting view is moving to parent %@", buf, 0x16u);
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      [(_UISceneHostingActivationControlling *)self->_activationController hostingController:self isMovingToParentScene:v6];
    }
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "UIActionType", (void)v15) == 56)
        {
          id v13 = v12;
          [v13 performActionForSceneController:self];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)sceneContentStateDidChange:(id)a3
{
  if ([a3 contentState] == 2 && (*(unsigned char *)&self->_flags & 1) == 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    [(_UISceneHostingController *)self _clientIsReady];
  }
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queuedActions = self->_queuedActions;
  if (queuedActions)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = queuedActions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          fbScene = self->_fbScene;
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
          [(FBScene *)fbScene sendActions:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v13 = self->_queuedActions;
    self->_queuedActions = 0;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    [(_UISceneHostingActivationControlling *)self->_activationController activationHandleDidUpdate:self->_activationHandle forHostingController:self];
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    -[_UISceneHostingActivationControlling activationHandleDidUpdate:forHostingController:](self->_activationController, "activationHandleDidUpdate:forHostingController:", self->_activationHandle);
  }
}

- (void)addSettingsProvider:(id)a3
{
}

- (void)addSettingsProvider:(id)a3 atIndexPath:(int64_t)a4
{
  id v6 = a3;
  settingsProviders = self->_settingsProviders;
  id v10 = v6;
  if (!settingsProviders)
  {
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v9 = self->_settingsProviders;
    self->_settingsProviders = v8;

    id v6 = v10;
    settingsProviders = self->_settingsProviders;
  }
  if (a4 < 0) {
    [(NSPointerArray *)settingsProviders addPointer:v6];
  }
  else {
    [(NSPointerArray *)settingsProviders insertPointer:v6 atIndex:a4];
  }
}

- (void)removeSettingsProvider:(id)a3
{
  id v5 = a3;
  if ([(NSPointerArray *)self->_settingsProviders count])
  {
    unint64_t v4 = 0;
    do
    {
      if ([(NSPointerArray *)self->_settingsProviders pointerAtIndex:v4] == v5) {
        [(NSPointerArray *)self->_settingsProviders removePointerAtIndex:v4];
      }
      ++v4;
    }
    while (v4 < [(NSPointerArray *)self->_settingsProviders count]);
  }
}

- (void)setActivationController:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (_UISceneHostingActivationControlling *)a3;
  if (v4)
  {
    id v5 = v4;
    if (self->_activationController == v4) {
      goto LABEL_13;
    }
  }
  else
  {
    id v5 = objc_opt_new();
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", &setActivationController____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v11 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        uint64_t v12 = NSString;
        id v13 = self;
        long long v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        long long v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];
      }
      else
      {
        long long v16 = @"(nil)";
      }
      long long v17 = v16;
      id v18 = v5;
      if (v18)
      {
        uint64_t v19 = NSString;
        uint64_t v20 = (objc_class *)objc_opt_class();
        id v21 = NSStringFromClass(v20);
        __int16 v22 = [v19 stringWithFormat:@"<%@: %p>", v21, v18];
      }
      else
      {
        __int16 v22 = @"(nil)";
      }

      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      v26 = v22;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "%@ Using %@ for activation control", buf, 0x16u);
    }
  }
  [(_UISceneHostingActivationHandle *)self->_activationHandle invalidate];
  [v5 endManagingHostedSceneActivationForHostingController:self];
  objc_storeStrong((id *)&self->_activationController, v5);
  uint64_t v7 = (_UISceneHostingActivationHandle *)-[_UISceneHostingActivationHandle initWithActivationTarget:]((id *)[_UISceneHostingActivationHandle alloc], self);
  activationHandle = self->_activationHandle;
  self->_activationHandle = v7;

  if (objc_opt_respondsToSelector()) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v9;
  if (objc_opt_respondsToSelector()) {
    char v10 = 4;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v10;
  [v5 beginManagingHostedSceneActivationUsingHandle:self->_activationHandle forHostingController:self];
LABEL_13:
}

- (void)activate:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, id))a3;
  if (v5)
  {
    id v6 = (id)objc_opt_new();
    v5[2](v5, v6);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [(FBScene *)self->_fbScene settings];
  uint64_t v8 = [v7 displayConfiguration];

  if (!v8)
  {
    char v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneHosting", &_MergedGlobals_1153) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sceneView = self->_sceneView;
      uint64_t v11 = v9;
      uint64_t v12 = [(UIView *)sceneView superview];
      *(_DWORD *)buf = 138412290;
      v34 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Scene hosting view's superview: %@", buf, 0xCu);
    }
    id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneHosting", &qword_1EB261D90) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = self->_sceneView;
      long long v15 = v13;
      long long v16 = [(UIView *)v14 window];
      *(_DWORD *)buf = 138412290;
      v34 = v16;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Scene hosting view's window: %@", buf, 0xCu);
    }
    long long v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneHosting", &qword_1EB261D98) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = self->_sceneView;
      uint64_t v19 = v17;
      uint64_t v20 = [(UIView *)v18 window];
      id v21 = [v20 _remoteContentParent];
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Scene hosting view's parent environment: %@", buf, 0xCu);
    }
    __int16 v22 = *(id *)(__UILogGetCategoryCachedImpl("UISceneHosting", &qword_1EB261DA0) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [(FBScene *)self->_fbScene parentScene];
      if (v23)
      {
        uint64_t v24 = NSString;
        __int16 v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        uint64_t v27 = [v24 stringWithFormat:@"<%@: %p>", v26, v23];
      }
      else
      {
        uint64_t v27 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v34 = v27;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "Parent scene: %@", buf, 0xCu);
    }
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v29 = [(FBScene *)self->_fbScene description];
    [v28 handleFailureInMethod:a2, self, @"_UISceneHostingController.m", 393, @"Activating a _UISceneHostingController's scene with a nil display configuration is not supported: %@", v29 object file lineNumber description];
  }
  userActivity = self->_userActivity;
  if (userActivity)
  {
    if (!v6)
    {
      id v6 = (id)objc_opt_new();
      userActivity = self->_userActivity;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __38___UISceneHostingController_activate___block_invoke;
    v31[3] = &unk_1E52FE130;
    v31[4] = self;
    id v6 = v6;
    id v32 = v6;
    +[UISActivityContinuationAction buildWithUserActivity:userActivity completion:v31];
  }
  else
  {
    [(FBScene *)self->_fbScene activateWithTransitionContext:v6];
  }
}

- (void)deactivate:(id)a3
{
  if (a3)
  {
    unint64_t v4 = (void (**)(void))a3;
    id v5 = (id)objc_opt_new();
    v4[2](v4);
  }
  else
  {
    id v5 = 0;
  }
  [(FBScene *)self->_fbScene deactivateWithTransitionContext:v5];
}

- (BOOL)isActive
{
  return [(FBScene *)self->_fbScene isActive];
}

- (void)beginObservingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_sceneWillEnterBackground_ name:@"UISceneDidEnterBackgroundNotification" object:0];
}

- (void)endObservingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UISceneDidEnterBackgroundNotification" object:0];
}

- (void)sceneWillEnterBackground:(id)a3
{
  unint64_t v4 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  id v16 = v4;
  id v6 = WeakRetained;
  if (v16 == v6)
  {

LABEL_7:
    id v8 = objc_loadWeakRetained((id *)&self->_parentScene);
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      id v13 = [(_UISceneHostingController *)self activationStateComponent];
      long long v14 = [v13 foregroundAssertionForReason:@"snapshotting"];

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54___UISceneHostingController_sceneWillEnterBackground___block_invoke;
      v17[3] = &unk_1E52D9F70;
      id v18 = v14;
      id v15 = v14;
      [v12 _performAfterSystemSnapshotsComplete:v17];
    }
    return;
  }
  if (v16 && v6)
  {
    char v7 = [v16 isEqual:v6];

    if ((v7 & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
}

- (uint64_t)_fbScene
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (_UISceneHostingView)sceneView
{
  return self->_sceneView;
}

- (_UISceneHostingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISceneHostingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UISceneHostingActivationControlling)activationController
{
  return self->_activationController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_fbScene, 0);
  objc_storeStrong((id *)&self->_activationHandle, 0);
  objc_storeStrong((id *)&self->_activationController, 0);
  objc_storeStrong((id *)&self->_queuedActions, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_settingsProviders, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_destroyWeak((id *)&self->_parentScene);
}

- (_UISceneHostingSheetPresentationHostProviding)_remoteSheetProvider
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  id v3 = fbScene;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FBScene *)v3 componentForExtension:v4 ofClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  return (_UISceneHostingSheetPresentationHostProviding *)v9;
}

- (id)_eventDeferringComponent
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  id v3 = fbScene;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FBScene *)v3 componentForExtension:v4 ofClass:objc_opt_class()];

  return v5;
}

- (id)traitCollectionReceiver
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  id v3 = fbScene;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FBScene *)v3 componentForExtension:v4 ofClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)keyboardSuppressionController
{
  if (self) {
    fbScene = self->_fbScene;
  }
  else {
    fbScene = 0;
  }
  id v3 = fbScene;
  uint64_t v4 = [(FBScene *)v3 _keyboardHostComponent];

  return v4;
}

@end