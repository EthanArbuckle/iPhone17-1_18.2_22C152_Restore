@interface SBBiometricMonitorUI
- (BOOL)_isDeferredMatchStateUpdatePending;
- (BOOL)_isDeferredPresenceDetectStateUpdatePending;
- (SBBiometricMonitorDataSource)dataSource;
- (SBBiometricMonitorUI)init;
- (SBWindowScene)windowScene;
- (void)_cancelDeferredUpdateMatchState;
- (void)_cancelDeferredUpdatePresenceDetectState;
- (void)_deferredUpdateMatchState;
- (void)_deferredUpdatePresenceDetectState;
- (void)_doDeferredMatchStateUpdate;
- (void)_doDeferredPresenceDetectUpdate;
- (void)_updateMatchState;
- (void)_updatePresenceDetectState;
- (void)biometricMonitorDataSourceMatchingEnded:(id)a3;
- (void)biometricMonitorDataSourceMatchingFailed:(id)a3;
- (void)biometricMonitorDataSourceMatchingStarted:(id)a3;
- (void)biometricMonitorDataSourceMatchingSucceeded:(id)a3;
- (void)biometricMonitorDataSourcePoseUpdated:(id)a3;
- (void)biometricMonitorDataSourcePresenceDetectionEnded:(id)a3;
- (void)biometricMonitorDataSourcePresenceDetectionFailed:(id)a3;
- (void)biometricMonitorDataSourcePresenceDetectionStarted:(id)a3;
- (void)biometricMonitorDataSourcePresenceDetectionSucceeded:(id)a3;
- (void)disable;
- (void)enable;
- (void)setDataSource:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBBiometricMonitorUI

- (SBBiometricMonitorUI)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBBiometricMonitorUI;
  v2 = [(SBBiometricMonitorUI *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SBBiometricMonitorUI *)v2 setDataSource:0];
  }
  return v3;
}

- (void)setDataSource:(id)a3
{
  objc_super v5 = (SBBiometricMonitorDataSource *)a3;
  dataSource = self->_dataSource;
  p_dataSource = &self->_dataSource;
  if (dataSource != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_dataSource, a3);
    objc_super v5 = v8;
  }
}

- (void)enable
{
  if (!self->_enabled)
  {
    [(SBBiometricMonitorDataSource *)self->_dataSource addObserver:self];
    v3 = objc_alloc_init(SBBiometricMonitorViewController);
    debugViewController = self->_debugViewController;
    self->_debugViewController = v3;

    [(SBBiometricMonitorUI *)self _updateMatchState];
    [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
    objc_super v5 = [SBSecureWindow alloc];
    v6 = [(SBBiometricMonitorUI *)self windowScene];
    v7 = [(SBWindow *)v5 initWithWindowScene:v6 role:@"SBTraitsParticipantRoleBiometricMonitorUI" debugName:@"SBBiometricMonitorUI"];
    debugWindow = self->_debugWindow;
    self->_debugWindow = v7;

    [(UIWindow *)self->_debugWindow setLevel:*MEMORY[0x1E4F43CF8] + 250.0 + -5.0];
    [(UIWindow *)self->_debugWindow setAlpha:0.8];
    [(UIWindow *)self->_debugWindow setRootViewController:self->_debugViewController];
    [(UIWindow *)self->_debugWindow setHidden:0];
    v9 = [(UIWindow *)self->_debugWindow layer];
    [v9 setAllowsHitTesting:0];

    [(UIWindow *)self->_debugWindow setUserInteractionEnabled:0];
    v10 = self->_debugWindow;
    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIWindow *)v10 setBackgroundColor:v11];

    self->_enabled = 1;
  }
}

- (void)disable
{
  if (self->_enabled)
  {
    [(SBBiometricMonitorDataSource *)self->_dataSource removeObserver:self];
    debugViewController = self->_debugViewController;
    self->_debugViewController = 0;

    [(UIWindow *)self->_debugWindow setRootViewController:0];
    debugWindow = self->_debugWindow;
    self->_debugWindow = 0;

    self->_enabled = 0;
  }
}

- (void)_updateMatchState
{
  id v3 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  objc_msgSend(v3, "setMatchState:", -[SBBiometricMonitorDataSource matchRunning](self->_dataSource, "matchRunning"));
}

- (void)_doDeferredMatchStateUpdate
{
  self->_deferredMatchUpdatePending = 0;
}

- (void)_updatePresenceDetectState
{
  id v3 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  objc_msgSend(v3, "setPresenceDetectState:", -[SBBiometricMonitorDataSource presenceDetectRunning](self->_dataSource, "presenceDetectRunning"));
}

- (void)_doDeferredPresenceDetectUpdate
{
  self->_deferredPresenceDetectUpdatePending = 0;
}

- (void)_deferredUpdateMatchState
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdateMatchState];
  self->_deferredMatchUpdatePending = 1;
  [(SBBiometricMonitorUI *)self performSelector:sel__doDeferredMatchStateUpdate withObject:0 afterDelay:1.0];
}

- (BOOL)_isDeferredMatchStateUpdatePending
{
  return self->_deferredMatchUpdatePending;
}

- (void)_cancelDeferredUpdateMatchState
{
  self->_deferredMatchUpdatePending = 0;
}

- (void)_deferredUpdatePresenceDetectState
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdateMatchState];
  self->_deferredPresenceDetectUpdatePending = 1;
  [(SBBiometricMonitorUI *)self performSelector:sel__doDeferredPresenceDetectUpdate withObject:0 afterDelay:1.0];
}

- (BOOL)_isDeferredPresenceDetectStateUpdatePending
{
  return self->_deferredPresenceDetectUpdatePending;
}

- (void)_cancelDeferredUpdatePresenceDetectState
{
  self->_deferredPresenceDetectUpdatePending = 0;
}

- (void)biometricMonitorDataSourceMatchingStarted:(id)a3
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdateMatchState];
  v4 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  [v4 setMatchState:1];

  [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
}

- (void)biometricMonitorDataSourceMatchingFailed:(id)a3
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdateMatchState];
  v4 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  [v4 setMatchState:3];

  [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
  [(SBBiometricMonitorUI *)self _deferredUpdateMatchState];
}

- (void)biometricMonitorDataSourceMatchingSucceeded:(id)a3
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdateMatchState];
  v4 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  [v4 setMatchState:2];

  [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
  [(SBBiometricMonitorUI *)self _deferredUpdateMatchState];
}

- (void)biometricMonitorDataSourceMatchingEnded:(id)a3
{
  if (![(SBBiometricMonitorUI *)self _isDeferredMatchStateUpdatePending]) {
    [(SBBiometricMonitorUI *)self _updateMatchState];
  }
  if (![(SBBiometricMonitorUI *)self _isDeferredPresenceDetectStateUpdatePending])
  {
    [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
  }
}

- (void)biometricMonitorDataSourcePresenceDetectionStarted:(id)a3
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdatePresenceDetectState];
  [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
}

- (void)biometricMonitorDataSourcePresenceDetectionFailed:(id)a3
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdatePresenceDetectState];
  v4 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  [v4 setPresenceDetectState:3];

  [(SBBiometricMonitorUI *)self _deferredUpdatePresenceDetectState];
}

- (void)biometricMonitorDataSourcePresenceDetectionSucceeded:(id)a3
{
  [(SBBiometricMonitorUI *)self _cancelDeferredUpdatePresenceDetectState];
  v4 = [(SBBiometricMonitorViewController *)self->_debugViewController monitorView];
  [v4 setPresenceDetectState:2];

  [(SBBiometricMonitorUI *)self _deferredUpdatePresenceDetectState];
}

- (void)biometricMonitorDataSourcePresenceDetectionEnded:(id)a3
{
  if (![(SBBiometricMonitorUI *)self _isDeferredPresenceDetectStateUpdatePending])
  {
    [(SBBiometricMonitorUI *)self _updatePresenceDetectState];
  }
}

- (void)biometricMonitorDataSourcePoseUpdated:(id)a3
{
  debugViewController = self->_debugViewController;
  id v4 = a3;
  id v5 = [(SBBiometricMonitorViewController *)debugViewController monitorView];
  LODWORD(debugViewController) = [v4 poseIsMarginal];

  [v5 setPoseState:debugViewController];
}

- (SBBiometricMonitorDataSource)dataSource
{
  return self->_dataSource;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_debugViewController, 0);
  objc_storeStrong((id *)&self->_debugWindow, 0);
}

@end