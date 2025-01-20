@interface SHSheetRemoteScene
- (BOOL)isActive;
- (NSArray)customizationGroups;
- (SFCollaborationCloudSharingRequest)cloudShareRequest;
- (SHSheetRemoteScene)initWithSession:(id)a3;
- (SHSheetRemoteSceneDelegate)delegate;
- (SHSheetSession)session;
- (SHSheetUIServiceClientContext)sessionContext;
- (_SWCollaborationShareOptions)collaborationOptions;
- (_UISceneHostingController)hostingController;
- (id)_dataRepresentationForCollaborationShareOptions:(id)a3;
- (id)collaborationCreateSharingURLCompletionHandler;
- (id)createSceneSettings;
- (int64_t)hostProcessType;
- (int64_t)presentationStyle;
- (void)activate;
- (void)clientIsReady;
- (void)invalidate;
- (void)presentCollaborationParticipantsViewControllerForCloudSharingRequest:(id)a3 completionHandler:(id)a4;
- (void)receivedAction:(id)a3;
- (void)sendAction:(id)a3;
- (void)setCloudShareRequest:(id)a3;
- (void)setCollaborationCreateSharingURLCompletionHandler:(id)a3;
- (void)setCollaborationOptions:(id)a3;
- (void)setCustomizationGroups:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostProcessType:(int64_t)a3;
- (void)setHostingController:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSessionContext:(id)a3;
- (void)setupSceneHosting;
- (void)updateWithChange:(id)a3;
- (void)updateWithSessionContext:(id)a3;
@end

@implementation SHSheetRemoteScene

- (SHSheetRemoteScene)initWithSession:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHSheetRemoteScene;
  v5 = [(SHSheetRemoteScene *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_session, v4);
    uint64_t v7 = [v4 createClientContext];
    sessionContext = v6->_sessionContext;
    v6->_sessionContext = (SHSheetUIServiceClientContext *)v7;

    v9 = [v4 activityViewController];
    v6->_presentationStyle = SHSheetPresentationControllerPresentationStyle(v9);
  }
  return v6;
}

- (void)activate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "scene %@ activating", (uint8_t *)&v4, 0xCu);
  }

  [(SHSheetRemoteScene *)self setupSceneHosting];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "scene %@ invalidating", (uint8_t *)&v4, 0xCu);
  }

  [(SHSheetRemoteScene *)self setHostingController:0];
}

- (id)createSceneSettings
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SHSheetRemoteScene_createSceneSettings__block_invoke;
  v4[3] = &unk_1E5A21930;
  v4[4] = self;
  v2 = +[SHSheetRemoteSceneSettings settingsWithConfigurationBlock:v4];
  return v2;
}

void __41__SHSheetRemoteScene_createSceneSettings__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 sessionContext];
  [v4 setSessionContext:v5];

  objc_msgSend(v4, "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "presentationStyle"));
  objc_msgSend(v4, "setHostProcessType:", objc_msgSend(*(id *)(a1 + 32), "hostProcessType"));
  id v6 = [*(id *)(a1 + 32) customizationGroups];
  [v4 setCustomizationGroups:v6];
}

- (void)setupSceneHosting
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_hostingController)
  {
    v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "scene %@ setting up scene hosting", buf, 0xCu);
    }

    v20 = [MEMORY[0x1E4F96408] identityForAngelJobLabel:@"com.apple.sharinguiservice"];
    id v4 = objc_alloc(MEMORY[0x1E4FB2268]);
    v5 = objc_opt_new();
    id v6 = (_UISceneHostingController *)[v4 initWithProcessIdentity:v20 sceneSpecification:v5];
    hostingController = self->_hostingController;
    self->_hostingController = v6;

    [(_UISceneHostingController *)self->_hostingController setDelegate:self];
    v8 = self->_hostingController;
    v9 = objc_opt_new();
    [(_UISceneHostingController *)v8 setActivationController:v9];

    id SFUIShareSheetRemoteSettingsHelperClass = getSFUIShareSheetRemoteSettingsHelperClass();
    objc_super v11 = self->_hostingController;
    v12 = [(SHSheetRemoteScene *)self sessionContext];
    int64_t v13 = [(SHSheetRemoteScene *)self hostProcessType];
    int64_t v14 = [(SHSheetRemoteScene *)self presentationStyle];
    v15 = [(SHSheetRemoteScene *)self customizationGroups];
    v16 = [(SHSheetRemoteScene *)self collaborationOptions];
    v17 = [(SHSheetRemoteScene *)self _dataRepresentationForCollaborationShareOptions:v16];
    v18 = [(SHSheetRemoteScene *)self cloudShareRequest];
    [SFUIShareSheetRemoteSettingsHelperClass updateHostingController:v11 withContext:v12 hostProcessType:v13 hostPresentationStyle:v14 optionGroups:v15 collaborationOptionsData:v17 cloudShareRequest:v18];

    v19 = [(SHSheetRemoteScene *)self delegate];
    [v19 sceneDidBecomeActive:self];
  }
}

- (void)updateWithSessionContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SHSheetRemoteScene_updateWithSessionContext___block_invoke;
  v6[3] = &unk_1E5A21558;
  id v7 = v4;
  id v5 = v4;
  [(SHSheetRemoteScene *)self updateWithChange:v6];
}

uint64_t __47__SHSheetRemoteScene_updateWithSessionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSessionContext:*(void *)(a1 + 32)];
}

- (void)updateWithChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, SHSheetRemoteScene *))a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "scene %@ will update", buf, 0xCu);
  }

  v4[2](v4, self);
  id SFUIShareSheetRemoteSettingsHelperClass = getSFUIShareSheetRemoteSettingsHelperClass();
  id v7 = [(SHSheetRemoteScene *)self hostingController];
  v8 = [(SHSheetRemoteScene *)self sessionContext];
  int64_t v9 = [(SHSheetRemoteScene *)self hostProcessType];
  int64_t v10 = [(SHSheetRemoteScene *)self presentationStyle];
  objc_super v11 = [(SHSheetRemoteScene *)self customizationGroups];
  v12 = [(SHSheetRemoteScene *)self collaborationOptions];
  int64_t v13 = [(SHSheetRemoteScene *)self _dataRepresentationForCollaborationShareOptions:v12];
  int64_t v14 = [(SHSheetRemoteScene *)self cloudShareRequest];
  [SFUIShareSheetRemoteSettingsHelperClass updateHostingController:v7 withContext:v8 hostProcessType:v9 hostPresentationStyle:v10 optionGroups:v11 collaborationOptionsData:v13 cloudShareRequest:v14];
}

- (void)setHostProcessType:(int64_t)a3
{
  int64_t hostProcessType = self->_hostProcessType;
  if (hostProcessType != a3 && hostProcessType <= 0) {
    self->_int64_t hostProcessType = a3;
  }
}

- (void)receivedAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (SHSheetRemoteScene *)a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "scene %@ received action: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    if ([(SHSheetRemoteScene *)v6 type] == 10)
    {
      id v7 = [(SHSheetRemoteScene *)self session];
      v8 = [v7 activityViewController];
      [v8 _endDelayingPresentation];
    }
    int64_t v9 = [(SHSheetRemoteScene *)self delegate];
    [v9 scene:self didReceiveAction:v6];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    int64_t v9 = [(SHSheetRemoteScene *)self delegate];
    [v9 scene:self didReceiveMetadataUpdateAction:v6];
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    int64_t v9 = [(SHSheetRemoteScene *)self delegate];
    [v9 scene:self didReceiveSuggestionAction:v6];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    int64_t v9 = [(SHSheetRemoteScene *)self delegate];
    [v9 scene:self didReceiveOptionUpdateAction:v6];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v10 = v4;
    int64_t v9 = [(SHSheetRemoteScene *)self delegate];
    objc_super v11 = [(SHSheetRemoteScene *)v10 collaborationOptions];

    [v9 scene:self didReceiveCollaborationOptionUpdateAction:v11];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v9 = v4;
      [(SHSheetRemoteScene *)self setCloudShareRequest:0];
      v12 = [(SHSheetRemoteScene *)self collaborationCreateSharingURLCompletionHandler];

      if (v12)
      {
        int64_t v13 = [(SHSheetRemoteScene *)self collaborationCreateSharingURLCompletionHandler];
        int64_t v14 = [v9 result];
        ((void (**)(void, void *))v13)[2](v13, v14);

        [(SHSheetRemoteScene *)self setCollaborationCreateSharingURLCompletionHandler:0];
      }
      else
      {
        v15 = share_sheet_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[SHSheetRemoteScene receivedAction:](v15);
        }
      }
    }
    else
    {
      int64_t v9 = share_sheet_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        uint64_t v17 = v4;
        _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "scene receieved unsupported action:%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
LABEL_14:
}

- (void)clientIsReady
{
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteScene clientIsReady", v4, 2u);
  }

  self->_isActive = 1;
}

- (void)sendAction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "scene %@ will send action:%@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(SHSheetRemoteScene *)self hostingController];
  [v6 sendAction:v4];
}

- (void)presentCollaborationParticipantsViewControllerForCloudSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "Request collaboration participants view presentation from the remote", buf, 2u);
  }

  [(SHSheetRemoteScene *)self setCollaborationCreateSharingURLCompletionHandler:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__SHSheetRemoteScene_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E5A21558;
  id v11 = v6;
  id v9 = v6;
  [(SHSheetRemoteScene *)self updateWithChange:v10];
}

uint64_t __109__SHSheetRemoteScene_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCloudShareRequest:*(void *)(a1 + 32)];
}

- (id)_dataRepresentationForCollaborationShareOptions:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:*MEMORY[0x1E4F284E8]];

  id v6 = [v5 encodedData];

  return v6;
}

- (SHSheetSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (SHSheetSession *)WeakRetained;
}

- (SHSheetRemoteSceneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetRemoteSceneDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (SHSheetUIServiceClientContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)hostProcessType
{
  return self->_hostProcessType;
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
}

- (_SWCollaborationShareOptions)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
}

- (SFCollaborationCloudSharingRequest)cloudShareRequest
{
  return self->_cloudShareRequest;
}

- (void)setCloudShareRequest:(id)a3
{
}

- (id)collaborationCreateSharingURLCompletionHandler
{
  return self->_collaborationCreateSharingURLCompletionHandler;
}

- (void)setCollaborationCreateSharingURLCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_collaborationCreateSharingURLCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cloudShareRequest, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

- (void)receivedAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Received collaboration participants sharing update with no completion handler", v1, 2u);
}

@end