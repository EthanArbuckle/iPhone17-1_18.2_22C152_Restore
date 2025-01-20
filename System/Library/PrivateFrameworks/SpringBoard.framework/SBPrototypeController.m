@interface SBPrototypeController
+ (SBPrototypeController)sharedInstance;
- (BOOL)_handleKeyHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)_handlePrototypingEvent:(int64_t)a3;
- (BOOL)_shouldSendEvent:(int64_t)a3;
- (BOOL)handleRingerButtonEvent;
- (BOOL)handleRingerSwitchEvent;
- (BOOL)handleVolumeDecreaseEvent;
- (BOOL)handleVolumeIncreaseEvent;
- (SBPrototypeController)init;
- (SBRestartManager)restartManager;
- (SBWindowScene)windowScene;
- (id)rootSettings;
- (void)_acquireRemotePrototypingAssertion;
- (void)_createConnection;
- (void)_invalidateRemotePrototypingAssertion;
- (void)_sendEvent:(int64_t)a3;
- (void)_updateRemoteEditingState;
- (void)killSpringBoard;
- (void)restartSpringBoard;
- (void)setRestartManager:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBPrototypeController

- (id)rootSettings
{
  rootSettings = self->_rootSettings;
  if (!rootSettings)
  {
    v4 = [(_UISettings *)[SBRootSettings alloc] initWithDefaultValues];
    v5 = self->_rootSettings;
    self->_rootSettings = v4;

    rootSettings = self->_rootSettings;
  }
  return rootSettings;
}

+ (SBPrototypeController)sharedInstance
{
  if (sharedInstance___once_11 != -1) {
    dispatch_once(&sharedInstance___once_11, &__block_literal_global_399);
  }
  v2 = (void *)sharedInstance___instance_11;
  return (SBPrototypeController *)v2;
}

void __39__SBPrototypeController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBPrototypeController);
  v1 = (void *)sharedInstance___instance_11;
  sharedInstance___instance_11 = (uint64_t)v0;
}

- (SBPrototypeController)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBPrototypeController;
  v2 = [(SBPrototypeController *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(SBPrototypeController *)v2 _updateKeyHIDEventRouters];
    [(SBPrototypeController *)v3 _updateRemoteEditingState];
    v4 = [MEMORY[0x1E4F94118] sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__SBPrototypeController_init__block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    v5 = v3;
    v11 = v5;
    id v6 = (id)[v4 observeEventDefaultsOnQueue:MEMORY[0x1E4F14428] withBlock:v10];

    +[SBTestRecipeRegistrar registerAllTestRecipes];
    v7 = objc_alloc_init(SBPrototypeDumpingGround);
    dumpingGround = v5->_dumpingGround;
    v5->_dumpingGround = v7;
  }
  return v3;
}

uint64_t __29__SBPrototypeController_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateKeyHIDEventRouters];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateRemoteEditingState];
}

- (void)setWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_windowScene, obj);
    +[SBTestRecipeRegistrar registerWindowScene:obj];
    [(SBPrototypeDumpingGround *)self->_dumpingGround setWindowScene:obj];
  }
}

- (BOOL)handleVolumeIncreaseEvent
{
  return [(SBPrototypeController *)self _handlePrototypingEvent:1];
}

- (BOOL)handleVolumeDecreaseEvent
{
  return [(SBPrototypeController *)self _handlePrototypingEvent:2];
}

- (BOOL)handleRingerSwitchEvent
{
  return [(SBPrototypeController *)self _handlePrototypingEvent:3];
}

- (BOOL)handleRingerButtonEvent
{
  return [(SBPrototypeController *)self _handlePrototypingEvent:4];
}

- (void)restartSpringBoard
{
  v4 = [[SBRestartTransitionRequest alloc] initWithRequester:@"SBPrototypeController" reason:@"Prototyping"];
  v3 = [(SBPrototypeController *)self restartManager];
  [v3 restartWithTransitionRequest:v4];
}

- (void)killSpringBoard
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SBPrototypeController_killSpringBoard__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __40__SBPrototypeController_killSpringBoard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) restartSpringBoard];
}

- (BOOL)_handlePrototypingEvent:(int64_t)a3
{
  BOOL v5 = -[SBPrototypeController _shouldSendEvent:](self, "_shouldSendEvent:");
  if (v5) {
    [(SBPrototypeController *)self _sendEvent:a3];
  }
  return v5;
}

- (BOOL)_shouldSendEvent:(int64_t)a3
{
  v4 = +[SBPlatformController sharedInstance];
  if ([v4 isInternalInstall])
  {
    BOOL v5 = [MEMORY[0x1E4F94118] sharedInstance];
    char v6 = [v5 prototypingServerWantsEvent:a3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)_sendEvent:(int64_t)a3
{
  prototypingUIServerConnection = self->_prototypingUIServerConnection;
  if (!prototypingUIServerConnection)
  {
    [(SBPrototypeController *)self _createConnection];
    prototypingUIServerConnection = self->_prototypingUIServerConnection;
  }
  id v6 = [(NSXPCConnection *)prototypingUIServerConnection remoteObjectProxy];
  [v6 handlePrototypingEvent:a3];
}

- (void)_createConnection
{
  id v3 = objc_alloc(MEMORY[0x1E4F29268]);
  v4 = (NSXPCConnection *)[v3 initWithMachServiceName:*MEMORY[0x1E4F94210] options:4096];
  prototypingUIServerConnection = self->_prototypingUIServerConnection;
  self->_prototypingUIServerConnection = v4;

  id v6 = self->_prototypingUIServerConnection;
  v7 = PTUIServerInterface();
  [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

  v8 = self->_prototypingUIServerConnection;
  v9 = PTUIClientInterface();
  [(NSXPCConnection *)v8 setExportedInterface:v9];

  [(NSXPCConnection *)self->_prototypingUIServerConnection setExportedObject:self];
  v10 = self->_prototypingUIServerConnection;
  [(NSXPCConnection *)v10 resume];
}

- (BOOL)_handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  return 0;
}

- (void)_updateRemoteEditingState
{
  id v3 = +[SBPlatformController sharedInstance];
  int v4 = [v3 isInternalInstall];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F94118] sharedInstance];
    int v6 = [v5 remotePrototypingEnabled];

    if (v6)
    {
      prototypingUIServerConnection = self->_prototypingUIServerConnection;
      if (!prototypingUIServerConnection)
      {
        [(SBPrototypeController *)self _createConnection];
        prototypingUIServerConnection = self->_prototypingUIServerConnection;
      }
      v8 = [(NSXPCConnection *)prototypingUIServerConnection remoteObjectProxy];
      [v8 launchForRemoteEditing];

      [(SBPrototypeController *)self _acquireRemotePrototypingAssertion];
    }
    else
    {
      [(SBPrototypeController *)self _invalidateRemotePrototypingAssertion];
    }
  }
}

- (void)_acquireRemotePrototypingAssertion
{
  if (!self->_remotePrototypingAssertion)
  {
    id v3 = [MEMORY[0x1E4FA6A18] assertionWithBackgroundActivityIdentifier:*MEMORY[0x1E4FA95F0] forPID:getpid() exclusive:1 showsWhenForeground:0];
    remotePrototypingAssertion = self->_remotePrototypingAssertion;
    self->_remotePrototypingAssertion = v3;

    [(SBSBackgroundActivityAssertion *)self->_remotePrototypingAssertion setStatusString:@"Remote Prototyping"];
    objc_initWeak(&location, self);
    BOOL v5 = self->_remotePrototypingAssertion;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke;
    v8[3] = &unk_1E6AF80B8;
    objc_copyWeak(&v9, &location);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke_2;
    v6[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v7, &location);
    [(SBSBackgroundActivityAssertion *)v5 acquireWithHandler:v8 invalidationHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _invalidateRemotePrototypingAssertion];
  }
}

void __59__SBPrototypeController__acquireRemotePrototypingAssertion__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateRemotePrototypingAssertion];
}

- (void)_invalidateRemotePrototypingAssertion
{
  remotePrototypingAssertion = self->_remotePrototypingAssertion;
  if (remotePrototypingAssertion)
  {
    [(SBSBackgroundActivityAssertion *)remotePrototypingAssertion invalidate];
    int v4 = self->_remotePrototypingAssertion;
    self->_remotePrototypingAssertion = 0;
  }
}

- (SBRestartManager)restartManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restartManager);
  return (SBRestartManager *)WeakRetained;
}

- (void)setRestartManager:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_restartManager);
  objc_storeStrong((id *)&self->_remotePrototypingAssertion, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
  objc_storeStrong((id *)&self->_dumpingGround, 0);
  objc_storeStrong((id *)&self->_routingKeysAssertion, 0);
  objc_storeStrong((id *)&self->_prototypingUIServerConnection, 0);
}

@end