@interface SLDShareableContentService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
+ (void)setupInterface:(id)a3;
- (BOOL)_connShouldAllowBackgroundCollaboration:(id)a3;
- (BOOL)allowsConnection:(id)a3;
- (BOOL)isLayoutMonitorReady;
- (BOOL)populateInitiatorMetadata:(id)a3 name:(id)a4 email:(id)a5;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSUserActivity)activity;
- (OS_dispatch_queue)queue;
- (SLDShareableContentService)init;
- (id)_applicationIdentifierForConnection:(id)a3;
- (id)retrieveShareableContentBlock;
- (id)visibleApplicationForSceneIdentifier:(id)a3;
- (id)visibleApplications;
- (void)dealloc;
- (void)fetchAsynchronousLPMetadataFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)fetchShareableContentFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 requestedTypeIdentifier:(id)a5 requestedItemProviderIndex:(int64_t)a6 responseHandler:(id)a7;
- (void)fetchShareableContentMetadataFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)launchApplicationWithBundleIdentifier:(id)a3 forActions:(id)a4 completionHandler:(id)a5;
- (void)loadRepresentationFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 requestedTypeIdentifier:(id)a5 requestedItemProviderIndex:(int64_t)a6 completionHandler:(id)a7;
- (void)performAction:(id)a3 onApplicationWithBundleIdentifier:(id)a4;
- (void)populateInitiatorMetadata:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)presentMessageComposeSheetForSceneIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveAsynchronousLPMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)retrieveShareableContentMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)setActivity:(id)a3;
- (void)setIsLayoutMonitorReady:(BOOL)a3;
- (void)setRetrieveShareableContentBlock:(id)a3;
- (void)shareCollaborationData:(id)a3 faceTimeConversationUUID:(id)a4 completionHandler:(id)a5;
@end

@implementation SLDShareableContentService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC46C78;
}

+ (void)setupInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v6 forSelector:sel_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion_ argumentIndex:0 ofReply:1];
}

+ (id)sharedService
{
  if (sharedService_onceToken_3 != -1) {
    dispatch_once(&sharedService_onceToken_3, &__block_literal_global_10);
  }
  v2 = (void *)sharedService_sService_3;
  return v2;
}

uint64_t __43__SLDShareableContentService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDShareableContentService);
  uint64_t v1 = sharedService_sService_3;
  sharedService_sService_3 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SLDShareableContentService)init
{
  v16.receiver = self;
  v16.super_class = (Class)SLDShareableContentService;
  v2 = [(SLDShareableContentService *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SharedWithYou.SLDShareableContentService", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    objc_initWeak(&location, v2);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __34__SLDShareableContentService_init__block_invoke;
    v13 = &unk_1E58A97B0;
    objc_copyWeak(&v14, &location);
    [v6 setTransitionHandler:&v10];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F62940], "monitorWithConfiguration:", v6, v10, v11, v12, v13);
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__SLDShareableContentService_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v10 = objc_loadWeakRetained(&to);
  uint64_t v11 = [v10 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SLDShareableContentService_init__block_invoke_2;
  block[3] = &unk_1E58A9788;
  id v14 = v8;
  id v12 = v8;
  objc_copyWeak(&v15, &to);
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&to);
}

void __34__SLDShareableContentService_init__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v1 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if ([WeakRetained isLayoutMonitorReady])
    {
    }
    else
    {
      id v2 = objc_loadWeakRetained(v1);
      v3 = [v2 retrieveShareableContentBlock];

      if (v3)
      {
        dispatch_queue_t v4 = SLShareableContentLogHandle();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "Layout monitor is now ready.", buf, 2u);
        }

        id v5 = objc_loadWeakRetained(v1);
        [v5 setIsLayoutMonitorReady:1];

        id v6 = objc_loadWeakRetained(v1);
        id v7 = [v6 retrieveShareableContentBlock];
        v7[2]();

        id v8 = objc_loadWeakRetained(v1);
        [v8 setRetrieveShareableContentBlock:0];
      }
    }
  }
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SLDShareableContentService;
  [(SLDShareableContentService *)&v3 dealloc];
}

- (BOOL)allowsConnection:(id)a3
{
  id v3 = a3;
  char IsEntitledForShareableContent = SLDConnectionIsEntitledForShareableContent(v3);
  if ((IsEntitledForShareableContent & 1) == 0)
  {
    id v5 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SLDShareableContentService allowsConnection:]((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return IsEntitledForShareableContent;
}

- (id)visibleApplications
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(SLDShareableContentService *)self layoutMonitor];
  dispatch_queue_t v4 = [v3 currentLayout];
  id v5 = [v4 elements];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [MEMORY[0x1E4F29268] currentConnection];
        v13 = [v11 bundleIdentifier];
        id v14 = [(SLDShareableContentService *)self _applicationIdentifierForConnection:v12];
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          objc_super v16 = SLShareableContentLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [v11 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            v30 = v17;
            v18 = v16;
            os_log_type_t v19 = OS_LOG_TYPE_INFO;
            v20 = "[VisibleApplications] Skipping element for %@ because it's from the process requesting shareable content";
LABEL_16:
            _os_log_impl(&dword_19BE17000, v18, v19, v20, buf, 0xCu);
          }
        }
        else
        {
          v21 = [v11 bundleIdentifier];
          int v22 = [v21 isEqualToString:@"com.apple.purplebuddy"];

          if (v22)
          {
            objc_super v16 = SLShareableContentLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = [v11 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              v30 = v17;
              v18 = v16;
              os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
              v20 = "[VisibleApplications] Skipping element for %@ as Purple Buddy is not a valid source of shareable content";
              goto LABEL_16;
            }
          }
          else
          {
            if ([v11 isUIApplicationElement])
            {
              [v24 addObject:v11];
              goto LABEL_18;
            }
            objc_super v16 = SLShareableContentLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = [v11 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              v30 = v17;
              v18 = v16;
              os_log_type_t v19 = OS_LOG_TYPE_INFO;
              v20 = "[VisibleApplications] Skipping element for %@ because it's not a UI application element";
              goto LABEL_16;
            }
          }
        }

LABEL_18:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
  }

  return v24;
}

- (id)visibleApplicationForSceneIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(SLDShareableContentService *)self visibleApplications];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 identifier];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)launchApplicationWithBundleIdentifier:(id)a3 forActions:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F625F8]];
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F625E0]];
    uint64_t v11 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v10];
    id v12 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke;
    v14[3] = &unk_1E58A8D58;
    id v15 = v7;
    id v16 = v9;
    [v12 openApplication:v15 withOptions:v11 completion:v14];
  }
  else
  {
    int v13 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDShareableContentService launchApplicationWithBundleIdentifier:forActions:completionHandler:](v13);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SLShareableContentLogHandle();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "Application launch succeeded for bundle identifier: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }
}

- (void)performAction:(id)a3 onApplicationWithBundleIdentifier:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 action];
  v9[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(SLDShareableContentService *)self launchApplicationWithBundleIdentifier:v6 forActions:v8 completionHandler:0];
}

- (void)populateInitiatorMetadata:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  int v11 = [v9 collaborationMetadata];
  if (v11)
  {
    uint64_t v12 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_19BE17000, v12, OS_LOG_TYPE_DEFAULT, "Populating initiator name and handle from custom collaboration metadata: %@", buf, 0xCu);
    }

    uint64_t v13 = [v11 initiatorHandle];
    [v8 setInitiatorHandle:v13];

    id v14 = [v11 initiatorNameComponents];
    [v8 setInitiatorNameComponents:v14];

    v10[2](v10, 1, 0);
    goto LABEL_13;
  }
  id v15 = [v9 fileURL];
  if (v15)
  {

LABEL_8:
    long long v17 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = [v9 fileURL];
      long long v19 = [v9 containerSetupInfo];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_19BE17000, v17, OS_LOG_TYPE_DEFAULT, "Populating initiator name and handle from initiator metadata (fileURL: %@, containerSetupInfo: %@", buf, 0x16u);
    }
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v20 = (void *)getCSCloudSharingClass_softClass;
    uint64_t v31 = getCSCloudSharingClass_softClass;
    if (!getCSCloudSharingClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getCSCloudSharingClass_block_invoke;
      v33 = &unk_1E58A88B0;
      v34 = &v28;
      __getCSCloudSharingClass_block_invoke((uint64_t)buf);
      v20 = (void *)v29[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v28, 8);
    int v22 = [v9 fileURL];
    v23 = [v9 containerSetupInfo];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke;
    v25[3] = &unk_1E58A9800;
    v25[4] = self;
    long long v27 = v10;
    id v26 = v8;
    [v21 userNameAndEmail:v22 containerSetupInfo:v23 completionHandler:v25];

    goto LABEL_13;
  }
  id v16 = [v9 containerSetupInfo];

  if (v16) {
    goto LABEL_8;
  }
  id v24 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v24, OS_LOG_TYPE_DEFAULT, "Not populating initiator name and handle for shareable content with no collaborative representations", buf, 2u);
  }

  v10[2](v10, 1, 0);
LABEL_13:
}

void __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) queue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke_2;
  v17[3] = &unk_1E58A97D8;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v22 = v11;
  v17[4] = v12;
  id v18 = v13;
  id v19 = v7;
  id v20 = v8;
  id v21 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, v17);
}

uint64_t __82__SLDShareableContentService_populateInitiatorMetadata_request_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = [*(id *)(a1 + 32) populateInitiatorMetadata:*(void *)(a1 + 40) name:*(void *)(a1 + 48) email:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

- (BOOL)populateInitiatorMetadata:(id)a3 name:(id)a4 email:(id)a5
{
  id v7 = a3;
  unint64_t v8 = (unint64_t)a4;
  BOOL v9 = (v8 | (unint64_t)a5) != 0;
  if (v8 | (unint64_t)a5)
  {
    [v7 setInitiatorHandle:a5];
    if (v8)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28F38]);
      id v11 = [v10 personNameComponentsFromString:v8];
      [v7 setInitiatorNameComponents:v11];
    }
  }

  return v9;
}

- (void)fetchShareableContentMetadataFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [SLFetchShareableContentMetadataAction alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v16[3] = &unk_1E58A9850;
  id v18 = self;
  id v19 = v10;
  id v17 = v8;
  id v12 = v10;
  id v13 = v8;
  id v14 = [(SLShareableContentAction *)v11 initWithSceneIdentifier:v9 responseHandler:v16];
  id v15 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v9;
    _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_DEFAULT, "Fetching shareable content metadata for scene: %{public}@", buf, 0xCu);
  }

  [(SLDShareableContentService *)self performAction:v14 onApplicationWithBundleIdentifier:v13];
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 metadata];
  id v8 = [v6 initiatorRequest];

  if (!v7)
  {
    id v12 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1();
    }

    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  id v9 = [v7 bundleIdentifier];
  char v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if ((v10 & 1) == 0)
  {
    id v14 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_2(a1 + 32, v14, v15, v16, v17, v18, v19, v20);
    }

    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v13();
    goto LABEL_11;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_81;
  v21[3] = &unk_1E58A9828;
  id v11 = *(void **)(a1 + 40);
  id v22 = *(id *)(a1 + 32);
  id v24 = *(id *)(a1 + 48);
  id v23 = v7;
  [v11 populateInitiatorMetadata:v23 request:v8 completionHandler:v21];

LABEL_11:
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_81(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_81_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchAsynchronousLPMetadataFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [SLFetchAsynchronousLPMetadataAction alloc];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke;
  uint64_t v19 = &unk_1E58A9878;
  id v20 = v8;
  id v21 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = [(SLShareableContentAction *)v11 initWithSceneIdentifier:v9 responseHandler:&v16];
  uint64_t v15 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v9;
    _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous content metadata for scene: %{public}@", buf, 0xCu);
  }

  -[SLDShareableContentService performAction:onApplicationWithBundleIdentifier:](self, "performAction:onApplicationWithBundleIdentifier:", v14, v13, v16, v17, v18, v19);
}

void __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [a2 metadata];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    id v8 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchShareableContentFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 requestedTypeIdentifier:(id)a5 requestedItemProviderIndex:(int64_t)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v12 length])
  {
    id v16 = v12;
    if (v16)
    {
LABEL_3:
      uint64_t v17 = [[SLFetchShareableContentAction alloc] initWithSceneIdentifier:v13 requestedTypeIdentifier:v14 requestedItemProviderIndex:a6 responseHandler:v15];
      [(SLDShareableContentService *)self performAction:v17 onApplicationWithBundleIdentifier:v16];

      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v18 = [(SLDShareableContentService *)self visibleApplicationForSceneIdentifier:v13];
    id v16 = [v18 bundleIdentifier];

    if (v16) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[SLDShareableContentService fetchShareableContentFromBundleIdentifier:sceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:]((uint64_t)v13, self);
  }

  (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
LABEL_8:
}

- (void)retrieveShareableContentMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SLDShareableContentService *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v15[3] = &unk_1E58A9940;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a1[4] length] && objc_msgSend(a1[5], "length"))
  {
    uint64_t v2 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      id v4 = a1[5];
      *(_DWORD *)buf = 138412546;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "Fetching shareable content from bundle identifier: %@ scene identifier: %@", buf, 0x16u);
    }

    id v6 = a1[5];
    id v5 = a1[6];
    id v7 = a1[4];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_87;
    v16[3] = &unk_1E58A98A0;
    id v17 = a1[7];
    [v5 fetchShareableContentMetadataFromBundleIdentifier:v7 sceneIdentifier:v6 completion:v16];
  }
  else
  {
    objc_initWeak((id *)buf, a1[6]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2;
    aBlock[3] = &unk_1E58A9918;
    objc_copyWeak(&v15, (id *)buf);
    id v12 = a1[4];
    id v13 = a1[5];
    id v14 = a1[7];
    id v8 = (void (**)(void))_Block_copy(aBlock);
    if ([a1[6] isLayoutMonitorReady])
    {
      v8[2](v8);
    }
    else
    {
      id v9 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "Layout monitor is not ready, waiting to fetch shareable content.", (uint8_t *)&v10, 2u);
      }

      [a1[6] setRetrieveShareableContentBlock:v8];
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_copyWeak(&to, a1 + 7);
  uint64_t v2 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v15 = v3;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "Fetching shareable content matching bundle identifier: %@ scene identifier: %@", buf, 0x16u);
  }

  id v5 = objc_loadWeakRetained(&to);
  id v6 = [v5 visibleApplications];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_89;
  v9[3] = &unk_1E58A98C8;
  id v10 = a1[4];
  id v11 = a1[5];
  objc_copyWeak(&v12, &to);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_98;
  v7[3] = &unk_1E58A98F0;
  id v8 = a1[6];
  objc_msgSend(v6, "sl_mapAsynchronously:completionHandler:", v9, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&to);
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 bundleIdentifier];
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    int v9 = [v8 isEqualToString:v7] ^ 1;
  }
  else {
    int v9 = 0;
  }
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = [v5 identifier];
    LODWORD(v10) = [v10 isEqualToString:v11] ^ 1;
  }
  if ([v7 length]) {
    char v12 = v9;
  }
  else {
    char v12 = 1;
  }
  if (v12 & 1) != 0 || (v10)
  {
    id v15 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = @"YES";
      if (v9) {
        id v17 = @"NO";
      }
      else {
        id v17 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      id v21 = v5;
      __int16 v22 = 2112;
      id v23 = v17;
      if (v10) {
        __int16 v16 = @"NO";
      }
      __int16 v24 = 2112;
      long long v25 = v16;
      _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_INFO, "Skipping fetching shareable content for layout element: %@ layoutElementMatchesBundleIdentifier: %@ layoutElementMatchesSceneIdentifier: %@", buf, 0x20u);
    }

    v6[2](v6, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v14 = [v5 identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_90;
    v18[3] = &unk_1E58A98A0;
    id v19 = v6;
    [WeakRetained fetchShareableContentMetadataFromBundleIdentifier:v7 sceneIdentifier:v14 completion:v18];
  }
}

uint64_t __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__SLDShareableContentService_retrieveShareableContentMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "Fetched shareable content metadata for on screen applications: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAsynchronousLPMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SLDShareableContentService *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v15[3] = &unk_1E58A9940;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a1[4] length] && objc_msgSend(a1[5], "length"))
  {
    uint64_t v2 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      id v4 = a1[5];
      *(_DWORD *)buf = 138412546;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous content from bundle identifier: %@ scene identifier: %@", buf, 0x16u);
    }

    id v6 = a1[5];
    id v5 = a1[6];
    id v7 = a1[4];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_100;
    v16[3] = &unk_1E58A9968;
    id v17 = a1[7];
    [v5 fetchAsynchronousLPMetadataFromBundleIdentifier:v7 sceneIdentifier:v6 completion:v16];
  }
  else
  {
    objc_initWeak((id *)buf, a1[6]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2;
    aBlock[3] = &unk_1E58A9918;
    objc_copyWeak(&v15, (id *)buf);
    id v12 = a1[4];
    id v13 = a1[5];
    id v14 = a1[7];
    id v8 = (void (**)(void))_Block_copy(aBlock);
    if ([a1[6] isLayoutMonitorReady])
    {
      v8[2](v8);
    }
    else
    {
      id v9 = SLShareableContentLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "Layout monitor is not ready, waiting to fetch shareable content.", (uint8_t *)&v10, 2u);
      }

      [a1[6] setRetrieveShareableContentBlock:v8];
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_copyWeak(&to, a1 + 7);
  uint64_t v2 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v15 = v3;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous content matching bundle identifier: %@ scene identifier: %@", buf, 0x16u);
  }

  id v5 = objc_loadWeakRetained(&to);
  id v6 = [v5 visibleApplications];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_102;
  v9[3] = &unk_1E58A9990;
  id v10 = a1[4];
  id v11 = a1[5];
  objc_copyWeak(&v12, &to);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_105;
  v7[3] = &unk_1E58A98F0;
  id v8 = a1[6];
  objc_msgSend(v6, "sl_mapAsynchronously:completionHandler:", v9, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&to);
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 bundleIdentifier];
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    int v9 = [v8 isEqualToString:v7] ^ 1;
  }
  else {
    int v9 = 0;
  }
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = [v5 identifier];
    LODWORD(v10) = [v10 isEqualToString:v11] ^ 1;
  }
  if ([v7 length]) {
    char v12 = v9;
  }
  else {
    char v12 = 1;
  }
  if (v12 & 1) != 0 || (v10)
  {
    id v15 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = @"YES";
      if (v9) {
        id v17 = @"NO";
      }
      else {
        id v17 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      id v21 = v5;
      __int16 v22 = 2112;
      id v23 = v17;
      if (v10) {
        __int16 v16 = @"NO";
      }
      __int16 v24 = 2112;
      long long v25 = v16;
      _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_DEFAULT, "Skipping fetching asynchronous content for layout element: %@ layoutElementMatchesBundleIdentifier: %@ layoutElementMatchesSceneIdentifier: %@", buf, 0x20u);
    }

    v6[2](v6, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v14 = [v5 identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_103;
    v18[3] = &unk_1E58A9968;
    id v19 = v6;
    [WeakRetained fetchAsynchronousLPMetadataFromBundleIdentifier:v7 sceneIdentifier:v14 completion:v18];
  }
}

uint64_t __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_2_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112__SLDShareableContentService_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SLShareableContentLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "Fetched asynchronous content metadata for on screen applications: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 firstObject];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

- (void)loadRepresentationFromBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 requestedTypeIdentifier:(id)a5 requestedItemProviderIndex:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke;
  v16[3] = &unk_1E58A99B8;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(SLDShareableContentService *)self fetchShareableContentFromBundleIdentifier:a3 sceneIdentifier:v15 requestedTypeIdentifier:a5 requestedItemProviderIndex:a6 responseHandler:v16];
}

void __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 result];
  if (!v6)
  {
    int v7 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)presentMessageComposeSheetForSceneIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SLDShareableContentService *)self visibleApplicationForSceneIdentifier:v6];
  if (v8)
  {
    uint64_t v9 = [SLSendShareableContentAction alloc];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke;
    __int16 v16 = &unk_1E58A99E0;
    id v17 = v6;
    id v18 = v7;
    id v10 = [(SLShareableContentAction *)v9 initWithSceneIdentifier:v17 responseHandler:&v13];
    id v11 = objc_msgSend(v8, "bundleIdentifier", v13, v14, v15, v16);
    [(SLDShareableContentService *)self performAction:v10 onApplicationWithBundleIdentifier:v11];
  }
  else
  {
    id v12 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SLDShareableContentService presentMessageComposeSheetForSceneIdentifier:completion:](self);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)shareCollaborationData:(id)a3 faceTimeConversationUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F29268] currentConnection];
  BOOL v12 = [(SLDShareableContentService *)self _connShouldAllowBackgroundCollaboration:v11];

  uint64_t v13 = SLDaemonLogHandle();
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDShareableContentService shareCollaborationData:faceTimeConversationUUID:completionHandler:](v14);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BE17000, v14, OS_LOG_TYPE_INFO, "Initiating process has background collaboration entitlement, proceeding to initiate collaboration", buf, 2u);
    }
    v29 = v10;

    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F29230]) initWithActivityType:@"com.apple.Messages.BackgroundCollaboration"];
    [(SLDShareableContentService *)self setActivity:v15];

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v8 forKeyedSubscript:@"shud"];
    [v14 setObject:v9 forKeyedSubscript:@"FaceTimeUUID"];
    id v16 = [v14 copy];
    id v17 = [(SLDShareableContentService *)self activity];
    [v17 setUserInfo:v16];

    id v18 = SLDaemonLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v14;
      _os_log_impl(&dword_19BE17000, v18, OS_LOG_TYPE_INFO, "Initiating collaboration via messages using userInfoDictionary %@", buf, 0xCu);
    }

    id v32 = 0;
    id v19 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:@"com.apple.MobileSMS" error:&v32];
    id v20 = v32;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v19;
      __int16 v22 = objc_opt_new();
      uint64_t v33 = *MEMORY[0x1E4F625F8];
      uint64_t v34 = MEMORY[0x1E4F1CC38];
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      [v22 setFrontBoardOptions:v23];
      [(SLDShareableContentService *)self activity];
      id v28 = v8;
      v25 = id v24 = v20;
      [v25 becomeCurrent];

      uint64_t v26 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      long long v27 = [(SLDShareableContentService *)self activity];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke;
      v30[3] = &unk_1E58A9A08;
      v30[4] = self;
      id v31 = v29;
      [v26 openUserActivity:v27 usingApplicationRecord:v21 configuration:v22 completionHandler:v30];

      id v10 = v29;
      id v20 = v24;
      id v8 = v28;
    }
    else
    {
      __int16 v22 = SLDaemonLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BE17000, v22, OS_LOG_TYPE_DEFAULT, "Did not find LSApplicationRecord for messages, cannot launch user activity to initiate background collaboration", buf, 2u);
      }
    }
  }
}

void __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "Opened user activity for collaboration success: %@ error: %@", buf, 0x16u);
  }

  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  id v9 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke_124;
  v12[3] = &unk_1E58A8AA0;
  id v10 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  dispatch_after(v8, v9, v12);
}

uint64_t __96__SLDShareableContentService_shareCollaborationData_faceTimeConversationUUID_completionHandler___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_connShouldAllowBackgroundCollaboration:(id)a3
{
  id v3 = [MEMORY[0x1E4F4F7F8] processHandleForNSXPCConnection:a3];
  if (v3) {
    char v4 = 0;
  }
  else {
    char v4 = [0 hasEntitlement:@"com.apple.private.sociallayer.background-collaboration"];
  }

  return v4;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  id v5 = (void *)MEMORY[0x1E4F223F8];
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  id v12 = 0;
  id v6 = [v5 bundleRecordForAuditToken:v13 error:&v12];
  id v7 = v12;
  dispatch_time_t v8 = [v6 applicationIdentifier];

  if (!v8)
  {
    id v9 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SLDShareableContentService _applicationIdentifierForConnection:]();
    }
  }
  id v10 = [v6 applicationIdentifier];

  return v10;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (id)retrieveShareableContentBlock
{
  return self->_retrieveShareableContentBlock;
}

- (void)setRetrieveShareableContentBlock:(id)a3
{
}

- (BOOL)isLayoutMonitorReady
{
  return self->_isLayoutMonitorReady;
}

- (void)setIsLayoutMonitorReady:(BOOL)a3
{
  self->_isLayoutMonitorReady = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_retrieveShareableContentBlock, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)allowsConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchApplicationWithBundleIdentifier:(os_log_t)log forActions:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "launchApplicationWithBundleIdentifier: bundleIdentifier is nil, cannot call openApplication", v1, 2u);
}

void __97__SLDShareableContentService_launchApplicationWithBundleIdentifier_forActions_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "Application launch failed for %{public}@: %{public}@");
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "Failed to get shareable content for scene in %{public}@: %{public}@");
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __107__SLDShareableContentService_fetchShareableContentMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_81_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "Failed to populate metadata for scene in %{public}@: %{public}@");
}

void __105__SLDShareableContentService_fetchAsynchronousLPMetadataFromBundleIdentifier_sceneIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "Failed to fetch asynchronous shareable content for scene in %{public}@: %{public}@");
}

- (void)fetchShareableContentFromBundleIdentifier:(uint64_t)a1 sceneIdentifier:(void *)a2 requestedTypeIdentifier:requestedItemProviderIndex:responseHandler:.cold.1(uint64_t a1, void *a2)
{
  id v7 = [a2 visibleApplications];
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void __154__SLDShareableContentService_loadRepresentationFromBundleIdentifier_sceneIdentifier_requestedTypeIdentifier_requestedItemProviderIndex_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "Failed to load representation for content in scene %{public}@: %{public}@");
}

- (void)presentMessageComposeSheetForSceneIdentifier:(void *)a1 completion:.cold.1(void *a1)
{
  id v6 = [a1 visibleApplications];
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

void __86__SLDShareableContentService_presentMessageComposeSheetForSceneIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Failed to present message compose sheet for sending content attached to scene identifier: %@", v2, v3, v4, v5, 2u);
}

- (void)shareCollaborationData:(os_log_t)log faceTimeConversationUUID:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "Initiating process does not have background collaboration entitlement, so not initiating collaboration", v1, 2u);
}

- (void)_applicationIdentifierForConnection:.cold.1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);
}

@end