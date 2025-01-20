@interface SBSSystemApertureScenePresentationSessionClient
- (BSServiceConnection)connection;
- (FBSSceneIdentityToken)identityToken;
- (void)dealloc;
- (void)destroyScene;
- (void)requestScene;
- (void)setConnection:(id)a3;
@end

@implementation SBSSystemApertureScenePresentationSessionClient

- (void)dealloc
{
  if (!self->_connection)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSSystemApertureScenePresentationSessionClient.m" lineNumber:45 description:@"Client must be invalidated before deallocating session"];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSSystemApertureScenePresentationSessionClient;
  [(SBSSystemApertureScenePresentationSessionClient *)&v5 dealloc];
}

- (void)destroyScene
{
  id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  v3 = [(SBSSystemApertureScenePresentationSessionClient *)self identityToken];
  [v4 requestSystemApertureSceneInvalidationWithIdentityToken:v3];
}

- (void)requestScene
{
  id v4 = +[SBSSystemApertureScenePresentationSessionServer activeInstance];

  if (v4)
  {
    objc_super v5 = +[SBSSystemApertureScenePresentationSessionServer activeInstance];

    if (!v5)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"SBSSystemApertureScenePresentationSessionClient.m" lineNumber:80 description:@"In-process Jindo Presentations are not supported"];
    }
    id v14 = +[SBSSystemApertureScenePresentationSessionServer activeInstance];
    [v14 requestSystemApertureSceneForCurrentProcess];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F50BB8];
    v7 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v8 = +[SBSSystemApertureScenePresentationSessionServer identifier];
    v9 = [v6 endpointForMachName:v7 service:v8 instance:0];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v9];
    }
    else
    {
      v10 = 0;
    }
    [v10 configureConnection:&__block_literal_global_45];
    [v10 activate];
    objc_initWeak(&location, self);
    v11 = [v10 remoteTarget];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_14;
    v15[3] = &unk_1E566D9B0;
    objc_copyWeak(&v17, &location);
    id v12 = v10;
    id v16 = v12;
    [v11 requestSystemApertureScene:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = +[SBSSystemApertureScenePresentationSessionServer interface];
  [v4 setInterface:v2];

  v3 = +[SBSSystemApertureScenePresentationSessionServer serviceQuality];
  [v4 setServiceQuality:v3];

  [v4 setInvalidationHandler:&__block_literal_global_13];
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_2()
{
  v0 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2_cold_1(v0);
  }
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v5;
  id v8 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v9);
}

void __63__SBSSystemApertureScenePresentationSessionClient_requestScene__block_invoke_2_15(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 1, a1[4]);
    objc_storeStrong(v3 + 2, a1[5]);
    WeakRetained = v3;
  }
}

- (FBSSceneIdentityToken)identityToken
{
  return self->_identityToken;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
}

@end