@interface SBMainDisplayRootWindowScenePresentationBinder
+ (id)sharedInstance;
- (SBRootSceneWindow)rootWindow;
- (id)_init;
- (id)assertDisconnectionFromRenderServerForReason:(id)a3;
- (void)_disconnectFromRenderServer;
- (void)_reconnectToRenderServer;
@end

@implementation SBMainDisplayRootWindowScenePresentationBinder

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_0 != -1) {
    dispatch_once(&sharedInstance___onceToken_0, &__block_literal_global_364);
  }
  v2 = (void *)sharedInstance___instance_10;
  return v2;
}

void __64__SBMainDisplayRootWindowScenePresentationBinder_sharedInstance__block_invoke()
{
  id v0 = [[SBMainDisplayRootWindowScenePresentationBinder alloc] _init];
  v1 = (void *)sharedInstance___instance_10;
  sharedInstance___instance_10 = (uint64_t)v0;
}

- (id)_init
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"SBRootSceneWindow-%@-%p", v5, self];

  v7 = [SBRootSceneWindow alloc];
  v8 = [MEMORY[0x1E4F62420] mainConfiguration];
  v9 = [(UIRootSceneWindow *)v7 initWithDisplayConfiguration:v8];

  v13.receiver = self;
  v13.super_class = (Class)SBMainDisplayRootWindowScenePresentationBinder;
  v10 = [(SBRootWindowScenePresentationBinder *)&v13 initWithIdentifier:v6 priority:-10 appearanceStyle:0 rootWindow:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_rootWindow, v9);
  }

  return v11;
}

- (id)assertDisconnectionFromRenderServerForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_disconnectionAssertions)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    disconnectionAssertions = self->_disconnectionAssertions;
    self->_disconnectionAssertions = v5;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SBMainDisplayRootWindowScenePresentationBinder_assertDisconnectionFromRenderServerForReason___block_invoke;
  v12[3] = &unk_1E6AF4940;
  v12[4] = self;
  v8 = (void *)[v7 initWithIdentifier:@"RenderServerDisconnect" forReason:v4 queue:MEMORY[0x1E4F14428] invalidationBlock:v12];

  [(NSMutableArray *)self->_disconnectionAssertions addObject:v8];
  if ([(NSMutableArray *)self->_disconnectionAssertions count] == 1)
  {
    v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_disconnectionAssertions;
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "disconnect from renderserver:%{public}@", buf, 0xCu);
    }

    [(SBMainDisplayRootWindowScenePresentationBinder *)self _disconnectFromRenderServer];
  }
  return v8;
}

uint64_t __95__SBMainDisplayRootWindowScenePresentationBinder_assertDisconnectionFromRenderServerForReason___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 144) removeObject:a2];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) count];
  if (!result)
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "reconnect to renderserver", v5, 2u);
    }

    return [*(id *)(a1 + 32) _reconnectToRenderServer];
  }
  return result;
}

- (void)_disconnectFromRenderServer
{
  if (self->_disconnectedFromScene)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBMainDisplayRootWindowScenePresentationBinder.m", 78, @"Invalid parameter not satisfying: %@", @"_disconnectedFromScene == nil" object file lineNumber description];
  }
  [(_UIRootWindow *)self->_rootWindow setHidden:1];
  v3 = [(SBRootSceneWindow *)self->_rootWindow windowScene];
  disconnectedFromScene = self->_disconnectedFromScene;
  self->_disconnectedFromScene = v3;

  rootWindow = self->_rootWindow;
  [(SBRootSceneWindow *)rootWindow setWindowScene:0];
}

- (void)_reconnectToRenderServer
{
  if (self->_disconnectedFromScene)
  {
    -[SBRootSceneWindow setWindowScene:](self->_rootWindow, "setWindowScene:");
    disconnectedFromScene = self->_disconnectedFromScene;
    self->_disconnectedFromScene = 0;
  }
  rootWindow = self->_rootWindow;
  [(_UIRootWindow *)rootWindow setHidden:0];
}

- (SBRootSceneWindow)rootWindow
{
  return self->_rootWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectedFromScene, 0);
  objc_storeStrong((id *)&self->_disconnectionAssertions, 0);
  objc_storeStrong((id *)&self->_rootWindow, 0);
}

@end