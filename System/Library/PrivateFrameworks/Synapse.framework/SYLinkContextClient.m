@interface SYLinkContextClient
- (BOOL)_forTesting;
- (NSMutableSet)_pendingCreateLinkCompletionBlocks;
- (NSMutableSet)_pendingFetchLinkCompletionBlocks;
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_clientQueue;
- (SYLinkContextClient)init;
- (SYLinkContextClientDelegate)delegate;
- (SYNotesActivationObserver)_notesObserver;
- (id)_linkContextDictionariesFromDataArray:(id)a3 error:(id *)a4;
- (id)initForTesting:(BOOL)a3;
- (id)testingShouldSendCreateLinkRequest;
- (void)_configureConnectionAndResume;
- (void)_createConnectionIfNeeded;
- (void)_invalidateConnection;
- (void)_processFetchLinkContextsRequestForUserActivity:(id)a3 serviceProxy:(id)a4 completion:(id)a5;
- (void)_sendInitialMessage;
- (void)_sendRequestToCreateLinkWithContentItemData:(id)a3 preferNewDocument:(BOOL)a4 completion:(id)a5;
- (void)_updateObserverAndCreateConnectionIfNeeded;
- (void)createAndShowContextualLinkWithUserActivity:(id)a3 linkPreviewMetadata:(id)a4 preferNewDocument:(BOOL)a5 completion:(id)a6;
- (void)createConnectionWithEndpoint:(id)a3;
- (void)dealloc;
- (void)fetchLinkContextsForUserActivity:(id)a3 completion:(id)a4;
- (void)insertImagesData:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTestingShouldSendCreateLinkRequest:(id)a3;
- (void)set_clientQueue:(id)a3;
- (void)set_connection:(id)a3;
- (void)set_notesObserver:(id)a3;
- (void)userDidRemoveContentItemDatas:(id)a3;
- (void)userEditDidAddContentItemDatas:(id)a3;
- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4;
@end

@implementation SYLinkContextClient

- (void)_updateObserverAndCreateConnectionIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v4 = [(SYLinkContextClient *)self _notesObserver];
  v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
    }
    else if (![(SYLinkContextClient *)self _forTesting])
    {
      objc_initWeak(&location, self);
      v6 = [SYNotesActivationObserver alloc];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke;
      v18 = &unk_1E6463C78;
      objc_copyWeak(&v19, &location);
      v7 = [(SYNotesActivationObserver *)v6 initWithHandler:&v15];
      -[SYLinkContextClient set_notesObserver:](self, "set_notesObserver:", v7, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    if ([(SYLinkContextClient *)self _forTesting]
      || ([(SYLinkContextClient *)self _notesObserver],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isVisible],
          v8,
          v9))
    {
      v10 = [(SYLinkContextClient *)self _connection];

      if (!v10) {
        [(SYLinkContextClient *)self _createConnectionIfNeeded];
      }
      v11 = [(SYLinkContextClient *)self _connection];

      if (v11) {
        [(SYLinkContextClient *)self _sendInitialMessage];
      }
      uint64_t v12 = [(SYLinkContextClient *)self _connection];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [(SYLinkContextClient *)self _notesObserver];

        if (v14) {
          [(SYLinkContextClient *)self set_notesObserver:0];
        }
      }
    }
  }
  else
  {

    if (v5)
    {
      [(SYLinkContextClient *)self set_notesObserver:0];
    }
  }
}

- (SYNotesActivationObserver)_notesObserver
{
  return self->__notesObserver;
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

void __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke_2;
  block[3] = &unk_1E6463AB0;
  block[4] = WeakRetained;
  dispatch_async(v2, block);
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)set_notesObserver:(id)a3
{
}

uint64_t __65__SYLinkContextClient__updateObserverAndCreateConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateObserverAndCreateConnectionIfNeeded];
}

uint64_t __35__SYLinkContextClient_setDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateObserverAndCreateConnectionIfNeeded];
}

- (SYLinkContextClient)init
{
  return (SYLinkContextClient *)[(SYLinkContextClient *)self initForTesting:0];
}

- (id)initForTesting:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SYLinkContextClient;
  v4 = [(SYLinkContextClient *)&v13 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    pendingCreateLinkCompletionBlocks = v4->__pendingCreateLinkCompletionBlocks;
    v4->__pendingCreateLinkCompletionBlocks = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    pendingFetchLinkCompletionBlocks = v4->__pendingFetchLinkCompletionBlocks;
    v4->__pendingFetchLinkCompletionBlocks = (NSMutableSet *)v7;

    int v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.synapse.LinkContextClient", v9);
    clientQueue = v4->__clientQueue;
    v4->__clientQueue = (OS_dispatch_queue *)v10;

    v4->__forTesting = a3;
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  v4 = [(SYLinkContextClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SYLinkContextClient_setDelegate___block_invoke;
  block[3] = &unk_1E6463AB0;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)dealloc
{
  v3 = [(SYLinkContextClient *)self _connection];
  [v3 invalidate];

  [(SYLinkContextClient *)self set_connection:0];
  v4.receiver = self;
  v4.super_class = (Class)SYLinkContextClient;
  [(SYLinkContextClient *)&v4 dealloc];
}

- (void)_sendInitialMessage
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1C2C5F000, v2, v3, "LinkContextClient: proxy doesn't respond to selector: %@", v4, v5, v6, v7, v8);
}

void __42__SYLinkContextClient__sendInitialMessage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__SYLinkContextClient__sendInitialMessage__block_invoke_cold_1();
  }
}

- (void)createAndShowContextualLinkWithUserActivity:(id)a3 linkPreviewMetadata:(id)a4 preferNewDocument:(BOOL)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 129, @"Invalid parameter not satisfying: %@", @"userActivity" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 130, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  LODWORD(v15) = SYIsLinkableUserActivity(v11);
  uint64_t v16 = [v11 _uniqueIdentifier];
  v17 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self;
    if (v15) {
      v18 = @"Y";
    }
    else {
      v18 = @"N";
    }
    [v11 _linkContextInfo];
    uint64_t v15 = v28 = (char)v15;
    *(_DWORD *)buf = 138413058;
    if (v15) {
      id v19 = @"Y";
    }
    else {
      id v19 = @"N";
    }
    v39 = v16;
    if (v12) {
      v20 = @"Y";
    }
    else {
      v20 = @"N";
    }
    __int16 v40 = 2112;
    v41 = v18;
    self = v29;
    __int16 v42 = 2112;
    v43 = v19;
    __int16 v44 = 2112;
    v45 = v20;
    _os_log_impl(&dword_1C2C5F000, v17, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Create contextual link with user activity %@, is linkable: %@, has link context: %@, has link preview: %@", buf, 0x2Au);

    LOBYTE(v15) = v28;
  }

  v21 = [(SYLinkContextClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke;
  block[3] = &unk_1E6463FF0;
  char v36 = (char)v15;
  id v31 = v11;
  id v32 = v12;
  id v34 = v16;
  id v35 = v14;
  BOOL v37 = a5;
  v33 = self;
  id v22 = v16;
  id v23 = v14;
  id v24 = v12;
  id v25 = v11;
  dispatch_async(v21, block);
}

void __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = [v2 bundleIdentifier];
    uint64_t v4 = (void *)v3;
    uint64_t v5 = &stru_1F1E16740;
    if (v3) {
      uint64_t v5 = (__CFString *)v3;
    }
    uint64_t v6 = v5;

    uint64_t v7 = [[SYContentItem alloc] initWithUserActivity:*(void *)(a1 + 32) sourceAppID:v6 sourceAppName:0 identifier:0];
    [(SYContentItem *)v7 setLinkPreviewMetadata:*(void *)(a1 + 40)];
    id v25 = 0;
    uint8_t v8 = [(SYContentItem *)v7 dataRepresentationWithError:&v25];
    id v9 = v25;

    if (v8)
    {
      dispatch_queue_t v10 = (void *)[*(id *)(a1 + 64) copy];
      id v11 = [*(id *)(a1 + 48) _pendingCreateLinkCompletionBlocks];
      id v12 = (void *)MEMORY[0x1C8769940](v10);
      [v11 addObject:v12];

      uint64_t v13 = *(unsigned __int8 *)(a1 + 73);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_2;
      v21[3] = &unk_1E6463FC8;
      v14 = *(void **)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 48);
      id v22 = v15;
      uint64_t v23 = v16;
      id v24 = v10;
      id v17 = v10;
      [v14 _sendRequestToCreateLinkWithContentItemData:v8 preferNewDocument:v13 completion:v21];

      goto LABEL_10;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"User activity is not linkable.";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v9 = [v18 errorWithDomain:@"com.apple.synapse" code:-126 userInfo:v19];
  }
  v20 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_10:
}

void __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint8_t v8 = @"N";
    int v14 = 138412802;
    if (a2) {
      uint8_t v8 = @"Y";
    }
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Finished request to create contextual link for activity %@, success: %@, error: %@", (uint8_t *)&v14, 0x20u);
  }

  id v9 = [*(id *)(a1 + 40) _pendingCreateLinkCompletionBlocks];
  dispatch_queue_t v10 = (void *)MEMORY[0x1C8769940](*(void *)(a1 + 48));
  int v11 = [v9 containsObject:v10];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 40) _pendingCreateLinkCompletionBlocks];
    uint64_t v13 = (void *)MEMORY[0x1C8769940](*(void *)(a1 + 48));
    [v12 removeObject:v13];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  }
}

- (void)_sendRequestToCreateLinkWithContentItemData:(id)a3 preferNewDocument:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 182, @"Invalid parameter not satisfying: %@", @"contentItemData" object file lineNumber description];
  }
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.notes.activity.create-link"];
  v24[0] = @"SYContentItemData";
  v24[1] = @"SYLinkPreferNewDocument";
  v25[0] = v9;
  id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  v25[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v11 setUserInfo:v13];

  int v14 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Sending request to create link.", buf, 2u);
  }

  uint64_t v15 = [(SYLinkContextClient *)self testingShouldSendCreateLinkRequest];

  if (v15
    && ([(SYLinkContextClient *)self testingShouldSendCreateLinkRequest],
        __int16 v16 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
        int v17 = ((uint64_t (**)(void, void *))v16)[2](v16, v11),
        v16,
        !v17))
  {
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    __int16 v18 = SYSystemPaperActivationMethodAddHighlight;
    if (v6) {
      __int16 v18 = SYSystemPaperActivationMethodNewHighlight;
    }
    +[SYSystemPaperAnalytics logActivationEvent:*v18];
    if (SYIsPhone() && SYIsQuickNoteOnPhoneEnabled())
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke;
      v22[3] = &unk_1E6464018;
      v22[4] = self;
      v22[5] = a2;
      +[SYNotesActivationCommandInAppImpl setFetchPresenterViewControllerInvocationBlock:v22];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_2;
    v20[3] = &unk_1E6463EC8;
    v20[4] = self;
    id v21 = v10;
    +[SYNotesActivationCommand activateWithMetaActivity:v11 completion:v20];
  }
}

id __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    id v5 = [v4 presentingViewControllerForLinkContextClient:*(void *)(a1 + 32)];

    if (!v5)
    {
      BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SYLinkContextClient.m", 206, @"Invalid parameter not satisfying: %@", @"presentingViewController != nil" object file lineNumber description];
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) _clientQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_3;
    v5[3] = &unk_1E6463BA8;
    id v6 = v3;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

uint64_t __96__SYLinkContextClient__sendRequestToCreateLinkWithContentItemData_preferNewDocument_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)fetchLinkContextsForUserActivity:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 232, @"Invalid parameter not satisfying: %@", @"queryActivity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 233, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = [(SYLinkContextClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke;
  block[3] = &unk_1E6463740;
  void block[4] = self;
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _createConnectionIfNeeded];
  id v2 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 40) _uniqueIdentifier];
    uint64_t v4 = [*(id *)(a1 + 32) _connection];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "LinkContextClient: fetchLinkContexts started for activity: %@, connection: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  id v5 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_56;
  v7[3] = &unk_1E64638F0;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = buf;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v7];

  if (v6) {
    [*(id *)(a1 + 32) _processFetchLinkContextsRequestForUserActivity:*(void *)(a1 + 40) serviceProxy:v6 completion:*(void *)(a1 + 48)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(buf, 8);
}

void __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_56(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_56_cold_1((uint64_t)v4, a1);
  }
}

- (void)_processFetchLinkContextsRequestForUserActivity:(id)a3 serviceProxy:(id)a4 completion:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 262, @"Invalid parameter not satisfying: %@", @"serviceProxy" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 261, @"Invalid parameter not satisfying: %@", @"queryActivity" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_12:
  id v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 263, @"Invalid parameter not satisfying: %@", @"originalCompletion" object file lineNumber description];

LABEL_4:
  uint64_t v12 = [(SYLinkContextClient *)self _clientQueue];
  dispatch_assert_queue_V2(v12);

  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = (void *)[v11 copy];
    int v14 = [(SYLinkContextClient *)self _pendingFetchLinkCompletionBlocks];
    uint64_t v15 = (void *)MEMORY[0x1C8769940](v13);
    [v14 addObject:v15];

    id v16 = [[SYUserActivityIdentifierInfo alloc] initWithUserActivity:v9];
    id v17 = [v9 _uniqueIdentifier];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke;
    v26[3] = &unk_1E6464068;
    v26[4] = self;
    id v27 = v17;
    id v28 = v13;
    id v18 = v13;
    id v19 = v17;
    [v10 fetchLinkContextsDataForUserActivityInfo:v16 completion:v26];
  }
  else
  {
    uint64_t v20 = os_log_create("com.apple.synapse", "LinkContext");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SYLinkContextClient _processFetchLinkContextsRequestForUserActivity:serviceProxy:completion:]((int)v10, sel_fetchLinkContextsDataForUserActivityInfo_completion_);
    }

    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Error communicating with remote service. The service doesn't have the expected interface.";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v16 = [v21 errorWithDomain:@"com.apple.synapse" code:-124 userInfo:v22];

    (*((void (**)(id, void, SYUserActivityIdentifierInfo *))v11 + 2))(v11, 0, v16);
  }
}

void __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2;
  block[3] = &unk_1E6464040;
  id v11 = v5;
  id v12 = a1[5];
  id v13 = v6;
  id v14 = a1[4];
  id v15 = a1[6];
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  os_log_t v3 = os_log_create("com.apple.synapse", "LinkContext");
  id v4 = v3;
  if (v2)
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextClient: fetchLinkContexts finished for activity: %@, found contexts: %ld", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2_cold_1(a1, v4);
  }

  id v8 = [*(id *)(a1 + 56) _pendingFetchLinkCompletionBlocks];
  id v9 = (void *)MEMORY[0x1C8769940](*(void *)(a1 + 64));
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      id v13 = *(void **)(a1 + 56);
      id v18 = v11;
      id v14 = [v13 _linkContextDictionariesFromDataArray:v12 error:&v18];
      id v15 = v18;

      id v11 = v15;
    }
    else
    {
      id v14 = 0;
    }
    id v16 = [*(id *)(a1 + 56) _pendingFetchLinkCompletionBlocks];
    id v17 = (void *)MEMORY[0x1C8769940](*(void *)(a1 + 64));
    [v16 removeObject:v17];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (id)_linkContextDictionariesFromDataArray:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = SYSupportedLinkContextInfoClasses();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    __int16 v21 = a4;
    id v10 = 0;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      uint64_t v12 = 0;
      id v13 = v10;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v12);
        id v23 = v13;
        id v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v14 error:&v23];
        id v10 = v23;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = *MEMORY[0x1E4F28568];
          uint64_t v29 = @"Invalid link context data, not a dictionary.";
          id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          uint64_t v18 = [v16 errorWithDomain:@"com.apple.synapse" code:-125 userInfo:v17];

          id v19 = os_log_create("com.apple.synapse", "LinkContext");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[SYLinkContextClient _linkContextDictionariesFromDataArray:error:]();
          }

          id v10 = (id)v18;
LABEL_15:
          a4 = v21;

          uint64_t v6 = 0;
          goto LABEL_16;
        }
        [v6 addObject:v15];
        if (!v15) {
          goto LABEL_15;
        }

        ++v12;
        id v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    a4 = v21;
  }
  else
  {
    id v10 = 0;
  }
LABEL_16:

  if (a4) {
    *a4 = v10;
  }

  return v6;
}

- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SYLinkContextClient *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityData:v6];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 _linkContextInfo];
      id v13 = [(SYLinkContextClient *)self delegate];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke;
      v15[3] = &unk_1E6464090;
      id v16 = v12;
      id v17 = v7;
      id v14 = v12;
      [v13 userWillAddLinkWithActivity:v11 completion:v15];
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 40))
  {
    if (SYIsLinkableUserActivity(v5))
    {
      id v7 = [v5 _linkContextInfo];
      if (!v7 || [*(id *)(a1 + 32) isEqualToDictionary:v7])
      {
        uint64_t v8 = os_log_create("com.apple.synapse", "LinkContext");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_2(v5, v8);
        }
      }
      char v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = [v9 bundleIdentifier];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = &stru_1F1E16740;
      if (v10) {
        uint64_t v12 = (__CFString *)v10;
      }
      id v13 = v12;

      id v14 = [[SYContentItem alloc] initWithUserActivity:v5 sourceAppID:v13 sourceAppName:0 identifier:0];
      [(SYContentItem *)v14 setLinkPreviewMetadata:v6];
      id v19 = 0;
      id v15 = [(SYContentItem *)v14 dataRepresentationWithError:&v19];
      id v16 = v19;
      if (v16)
      {
        id v17 = os_log_create("com.apple.synapse", "LinkContext");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 40);
      if (v18) {
        (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
      }
    }
  }
}

- (void)userDidRemoveContentItemDatas:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SYLinkContextClient *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          id v14 = [SYContentItem alloc];
          id v15 = -[SYContentItem initWithData:error:](v14, "initWithData:error:", v13, 0, (void)v17);
          if (v15) {
            [v7 addObject:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v16 = [(SYLinkContextClient *)self delegate];
    [v16 userDidRemoveContentItems:v7];
  }
}

- (void)userEditDidAddContentItemDatas:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SYLinkContextClient *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          id v14 = [SYContentItem alloc];
          id v15 = -[SYContentItem initWithData:error:](v14, "initWithData:error:", v13, 0, (void)v17);
          if (v15) {
            [v7 addObject:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v16 = [(SYLinkContextClient *)self delegate];
    [v16 userEditDidAddContentItems:v7];
  }
}

- (void)insertImagesData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 422, @"Invalid parameter not satisfying: %@", @"imagesData" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SYLinkContextClient.m", 423, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = [(SYLinkContextClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SYLinkContextClient_insertImagesData_completion___block_invoke;
  block[3] = &unk_1E64640B8;
  long long v17 = self;
  id v18 = v9;
  id v16 = v7;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(v10, block);
}

void __51__SYLinkContextClient_insertImagesData_completion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.notes.activity.insert-image"];
  uint64_t v3 = *(void *)(a1 + 32);
  id v12 = @"SYContentItemData";
  v13[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v2 setUserInfo:v4];

  id v5 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Sending request to insert %lu images.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SYLinkContextClient_insertImagesData_completion___block_invoke_85;
  v8[3] = &unk_1E6463EC8;
  id v7 = *(id *)(a1 + 48);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v7;
  +[SYNotesActivationCommand activateWithMetaActivity:v2 completion:v8];
}

void __51__SYLinkContextClient_insertImagesData_completion___block_invoke_85(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) _clientQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__SYLinkContextClient_insertImagesData_completion___block_invoke_2;
    v5[3] = &unk_1E6463BA8;
    id v6 = v3;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

uint64_t __51__SYLinkContextClient_insertImagesData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

- (void)_createConnectionIfNeeded
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 _connection];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_DEBUG, "LinkContextClient: Create new connection if needed: %@", v4, 0xCu);
}

- (void)_configureConnectionAndResume
{
  id v4 = [(SYLinkContextClient *)self _connection];

  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SYLinkContextClient.m" lineNumber:464 description:@"the XPC connection is unexpectedly nil"];
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__SYLinkContextClient__configureConnectionAndResume__block_invoke;
  v16[3] = &unk_1E64637D0;
  objc_copyWeak(&v17, &location);
  uint64_t v5 = [(SYLinkContextClient *)self _connection];
  [v5 setInvalidationHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__SYLinkContextClient__configureConnectionAndResume__block_invoke_94;
  v14[3] = &unk_1E64637D0;
  objc_copyWeak(&v15, &location);
  id v6 = [(SYLinkContextClient *)self _connection];
  [v6 setInterruptionHandler:v14];

  id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E28560];
  id v8 = [(SYLinkContextClient *)self _connection];
  [v8 setRemoteObjectInterface:v7];

  id v9 = [(SYLinkContextClient *)self _connection];
  [v9 setExportedObject:self];

  uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2AAC8];
  uint64_t v11 = [(SYLinkContextClient *)self _connection];
  [v11 setExportedInterface:v10];

  id v12 = [(SYLinkContextClient *)self _connection];
  [v12 resume];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __52__SYLinkContextClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Connection was invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

void __52__SYLinkContextClient__configureConnectionAndResume__block_invoke_94(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "LinkContextClient: Connection was interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

- (void)_invalidateConnection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 _connection];
  uint64_t v5 = [a1 _pendingCreateLinkCompletionBlocks];
  uint64_t v6 = [v5 count];
  id v7 = [a1 _pendingFetchLinkCompletionBlocks];
  int v8 = 138412802;
  id v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = [v7 count];
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "LinkContextClient: Invalidating connection: %@, pending createLink blocks: %ld, fetchLink blocks: %ld", (uint8_t *)&v8, 0x20u);
}

void __44__SYLinkContextClient__invalidateConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateObserverAndCreateConnectionIfNeeded];
}

- (void)createConnectionWithEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYLinkContextClient *)self _clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SYLinkContextClient_createConnectionWithEndpoint___block_invoke;
  v7[3] = &unk_1E64637F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __52__SYLinkContextClient_createConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  [v2 invalidate];

  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", v3);

  id v4 = [*(id *)(a1 + 32) _connection];
  uint64_t v5 = [*(id *)(a1 + 32) _clientQueue];
  [v4 _setQueue:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 _configureConnectionAndResume];
}

- (SYLinkContextClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYLinkContextClientDelegate *)WeakRetained;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
}

- (NSMutableSet)_pendingCreateLinkCompletionBlocks
{
  return self->__pendingCreateLinkCompletionBlocks;
}

- (NSMutableSet)_pendingFetchLinkCompletionBlocks
{
  return self->__pendingFetchLinkCompletionBlocks;
}

- (void)set_clientQueue:(id)a3
{
}

- (id)testingShouldSendCreateLinkRequest
{
  return self->_testingShouldSendCreateLinkRequest;
}

- (void)setTestingShouldSendCreateLinkRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testingShouldSendCreateLinkRequest, 0);
  objc_storeStrong((id *)&self->__notesObserver, 0);
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__pendingFetchLinkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->__pendingCreateLinkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__SYLinkContextClient__sendInitialMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C2C5F000, v0, v1, "LinkContextClient: Error creating remote service proxy: %@", v2, v3, v4, v5, v6);
}

void __116__SYLinkContextClient_createAndShowContextualLinkWithUserActivity_linkPreviewMetadata_preferNewDocument_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C2C5F000, v0, v1, "LinkContextClient: Request to create link failed: %@", v2, v3, v4, v5, v6);
}

void __67__SYLinkContextClient_fetchLinkContextsForUserActivity_completion___block_invoke_56_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a2 + 32) _connection];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v3, v4, "LinkContextClient: Error creating remote service proxy: %@, connection: %@", v5, v6, v7, v8, v9);
}

- (void)_processFetchLinkContextsRequestForUserActivity:(int)a1 serviceProxy:(SEL)aSelector completion:.cold.1(int a1, SEL aSelector)
{
  uint64_t v2 = NSStringFromSelector(aSelector);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v3, v4, "LinkContextClient: service proxy: %@, doesn't respond to selector: %@", v5, v6, v7, v8, v9);
}

void __95__SYLinkContextClient__processFetchLinkContextsRequestForUserActivity_serviceProxy_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "LinkContextClient: fetchLinkContexts FAILED for activity: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_linkContextDictionariesFromDataArray:error:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  id v1 = v0;
  OUTLINED_FUNCTION_4(&dword_1C2C5F000, v2, v3, "LinkContextClient: Error decoding link context data, not a dictionary: %@", v4, v5, v6, v7, v8);
}

void __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C2C5F000, v0, v1, "LinkContextClient: error creating data for contentItem %@", v2, v3, v4, v5, v6);
}

void __66__SYLinkContextClient_userWillAddLinkWithActivityData_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 activityType];
  uint64_t v5 = [a1 title];
  uint8_t v6 = [a1 _linkContextInfo];
  uint64_t v7 = [v6 allKeys];
  int v8 = 138413058;
  uint8_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  id v15 = v7;
  _os_log_debug_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_DEBUG, "LinkContextClient: link context info wasn't added or updated for userActivity: %@, type: %@, title: %@, contextInfo keys: %@", (uint8_t *)&v8, 0x2Au);
}

@end