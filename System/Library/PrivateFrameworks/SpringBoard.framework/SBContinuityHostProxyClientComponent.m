@interface SBContinuityHostProxyClientComponent
- (void)_setSceneRenderingEnvironmentParticipant:(id)a3;
- (void)continuitySessionDidUpdateScreenRecordingState:(id)a3;
- (void)invalidate;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneManager:(id)a3 didUpdateUserInterfaceStyle:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6;
- (void)sceneWillInvalidate:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation SBContinuityHostProxyClientComponent

- (void)setScene:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuityHostProxyClientComponent;
  [(FBSSceneComponent *)&v9 setScene:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SBContinuityHostProxyClientComponent_setScene___block_invoke;
  block[3] = &unk_1E6AF4A70;
  block[4] = self;
  block[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBContinuityHostProxyClientComponent_setScene___block_invoke_2;
  v7[3] = &unk_1E6B09CC0;
  v7[4] = self;
  v5 = [MEMORY[0x1E4F62890] injectorWithConfigurator:v7];
  openAppInstanceInjector = self->_openAppInstanceInjector;
  self->_openAppInstanceInjector = v5;
}

void __49__SBContinuityHostProxyClientComponent_setScene___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isValid])
  {
    v2 = +[SBSceneManagerCoordinator sharedInstance];
    v3 = [*(id *)(a1 + 32) scene];
    v4 = [v3 settings];
    v5 = [v4 displayIdentity];
    uint64_t v6 = [v2 sceneManagerForDisplayIdentity:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addUserInterfaceStyleObserver:");
    objc_msgSend(*(id *)(a1 + 32), "sceneManager:didUpdateUserInterfaceStyle:withAnimationSettings:fence:", *(void *)(*(void *)(a1 + 32) + 24), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "userInterfaceStyle"), 0, 0);
    id v17 = [(id)SBApp sceneRenderingEnvironmentManager];
    if (!v17)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SBContinuityHostProxyClientComponent.m", 47, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];
    }
    objc_super v9 = *(void **)(a1 + 32);
    v10 = [v9 scene];
    v11 = [v10 loggingIdentifier];
    v12 = [*(id *)(a1 + 32) scene];
    v13 = [v12 settings];
    v14 = [v13 displayConfiguration];
    v15 = [v17 registerParticipantForSceneWithIdentifier:v11 displayConfiguration:v14];
    [v9 _setSceneRenderingEnvironmentParticipant:v15];
  }
}

void __49__SBContinuityHostProxyClientComponent_setScene___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F96478];
  id v10 = a2;
  uint64_t v4 = getpid();
  v5 = [*(id *)(a1 + 32) clientScene];
  uint64_t v6 = [v5 identityToken];
  uint64_t v7 = _UIVisibilityEnvironmentForSceneIdentityToken();
  v8 = [v3 targetWithPid:v4 environmentIdentifier:v7];
  [v10 setTarget:v8];

  [v10 setDomain:@"com.apple.frontboard"];
  objc_super v9 = [MEMORY[0x1E4F629E0] serviceName];
  [v10 setService:v9];

  [v10 setInstance:*MEMORY[0x1E4FA6F18]];
}

- (void)invalidate
{
  sceneManager = self->_sceneManager;
  if (sceneManager)
  {
    [(SBSceneManager *)sceneManager removeUserInterfaceStyleObserver:self];
    uint64_t v4 = self->_sceneManager;
    self->_sceneManager = 0;
  }
  [(BSServiceConnectionEndpointInjector *)self->_openAppInstanceInjector invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SBContinuityHostProxyClientComponent;
  [(FBSSceneComponent *)&v5 invalidate];
}

- (void)_setSceneRenderingEnvironmentParticipant:(id)a3
{
  objc_super v5 = (SBSceneRenderingEnvironmentParticipant *)a3;
  sceneRenderingEnvironmentParticipant = self->_sceneRenderingEnvironmentParticipant;
  if (sceneRenderingEnvironmentParticipant != v5)
  {
    [(SBSceneRenderingEnvironmentParticipant *)sceneRenderingEnvironmentParticipant invalidate];
    objc_storeStrong((id *)&self->_sceneRenderingEnvironmentParticipant, a3);
    uint64_t v7 = [(FBSSceneComponent *)self clientScene];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__SBContinuityHostProxyClientComponent__setSceneRenderingEnvironmentParticipant___block_invoke;
    v8[3] = &unk_1E6B09CE8;
    objc_super v9 = v5;
    [v7 updateClientSettings:v8];
  }
}

void __81__SBContinuityHostProxyClientComponent__setSceneRenderingEnvironmentParticipant___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 renderingEnvironmentIdentifier];
  [v3 setHostProxySceneRenderingEnvironmentIdentifier:v4];
}

- (void)sceneManager:(id)a3 didUpdateUserInterfaceStyle:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [(FBSSceneComponent *)self clientScene];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__SBContinuityHostProxyClientComponent_sceneManager_didUpdateUserInterfaceStyle_withAnimationSettings_fence___block_invoke;
  v14[3] = &unk_1E6B09D10;
  id v16 = v10;
  int64_t v17 = a4;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  [v11 updateClientSettings:v14];
}

void __109__SBContinuityHostProxyClientComponent_sceneManager_didUpdateUserInterfaceStyle_withAnimationSettings_fence___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 setHostProxyUserInterfaceStyle:a1[6]];
  if (a1[4]) {
    objc_msgSend(v5, "setAnimationSettings:");
  }
  if (a1[5]) {
    objc_msgSend(v5, "setAnimationFence:");
  }
}

- (void)continuitySessionDidUpdateScreenRecordingState:(id)a3
{
  id v4 = a3;
  id v5 = SBLogContinuitySession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SBContinuityHostProxyClientComponent *)self continuitySessionDidUpdateScreenRecordingState:v5];
  }

  uint64_t v6 = [(FBSSceneComponent *)self clientScene];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__SBContinuityHostProxyClientComponent_continuitySessionDidUpdateScreenRecordingState___block_invoke;
  v8[3] = &unk_1E6B09CE8;
  id v9 = v4;
  id v7 = v4;
  [v6 updateClientSettings:v8];
}

void __87__SBContinuityHostProxyClientComponent_continuitySessionDidUpdateScreenRecordingState___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHostProxyIsCapturingContentForAdditionalRenderingDestination:", objc_msgSend(v2, "isActivelyScreenRecording"));
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a4;
  id v7 = [v6 settings];
  id v16 = [v7 displayConfiguration];

  v8 = [v6 previousSettings];

  id v9 = [v8 displayConfiguration];

  id v10 = v16;
  if (v16 != v9)
  {
    v11 = [(id)SBApp sceneRenderingEnvironmentManager];
    if (!v11)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"SBContinuityHostProxyClientComponent.m", 112, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];
    }
    id v12 = [(FBSSceneComponent *)self clientScene];
    id v13 = [v12 loggingIdentifier];
    v14 = [v11 registerParticipantForSceneWithIdentifier:v13 displayConfiguration:v16];
    [(SBContinuityHostProxyClientComponent *)self _setSceneRenderingEnvironmentParticipant:v14];

    id v10 = v16;
  }
}

- (void)sceneWillInvalidate:(id)a3
{
  [(SBSceneRenderingEnvironmentParticipant *)self->_sceneRenderingEnvironmentParticipant invalidate];
  sceneRenderingEnvironmentParticipant = self->_sceneRenderingEnvironmentParticipant;
  self->_sceneRenderingEnvironmentParticipant = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneRenderingEnvironmentParticipant, 0);
  objc_storeStrong((id *)&self->_openAppInstanceInjector, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)continuitySessionDidUpdateScreenRecordingState:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 clientScene];
  id v6 = [v5 identifier];
  int v7 = 138543618;
  v8 = v6;
  __int16 v9 = 1024;
  int v10 = [a2 isActivelyScreenRecording];
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Scene %{public}@ notified the session actively recording: %{BOOL}u", (uint8_t *)&v7, 0x12u);
}

@end