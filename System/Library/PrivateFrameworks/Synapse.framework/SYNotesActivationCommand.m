@interface SYNotesActivationCommand
+ (BOOL)remotePresentationEnabled;
+ (Class)_iOSImpl;
+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5;
+ (void)activateWithMetaActivity:(id)a3 completion:(id)a4;
+ (void)activateWithNoteIdentifier:(id)a3 completion:(id)a4;
+ (void)setRemotePresentationEnabled:(BOOL)a3;
- (SYNotesActivationCommand)init;
- (SYNotesActivationRequest)activationRequest;
- (void)_loadDataFromFileURLs:(id)a3 withCompletion:(id)a4;
- (void)activateWithCompletion:(id)a3;
- (void)setActivationRequest:(id)a3;
@end

@implementation SYNotesActivationCommand

+ (void)setRemotePresentationEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (SYIsPhone())
  {
    SYRemotePresentationEnabled = a3;
    v5 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = SYRemotePresentationEnabled;
      _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "System Paper remote presentation enabled: %d", (uint8_t *)v6, 8u);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SYNotesActivationCommand setRemotePresentationEnabled:](a2, v5);
    }
  }
}

+ (BOOL)remotePresentationEnabled
{
  return SYRemotePresentationEnabled;
}

+ (void)activateWithMetaActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_iOSImpl"), "activateWithMetaActivity:completion:", v7, v6);
}

+ (void)activateWithNoteIdentifier:(id)a3 completion:(id)a4
{
}

+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_iOSImpl"), "activateWithDomainIdentifier:noteIdentifier:completion:", v10, v9, v8);
}

+ (Class)_iOSImpl
{
  if (SYIsPhone() && !SYRemotePresentationEnabled)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v2 BOOLForKey:@"SYEnableSystemPaperRemoteAlert"];
  }
  v3 = objc_opt_class();
  return (Class)v3;
}

- (SYNotesActivationCommand)init
{
  v6.receiver = self;
  v6.super_class = (Class)SYNotesActivationCommand;
  v2 = [(SYNotesActivationCommand *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.synapse.dataLoadingQueue", 0);
    dataLoadingQueue = v2->__dataLoadingQueue;
    v2->__dataLoadingQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.notes.activity.insert-data"];
  objc_super v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __51__SYNotesActivationCommand_activateWithCompletion___block_invoke;
  v34[3] = &unk_1E6464608;
  id v7 = v5;
  id v35 = v7;
  id v8 = v6;
  id v36 = v8;
  v37 = self;
  id v9 = v4;
  id v38 = v9;
  id v10 = (void (**)(void))MEMORY[0x1C8769940](v34);
  v11 = [(SYNotesActivationCommand *)self activationRequest];
  v12 = [v11 urls];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = [(SYNotesActivationCommand *)self activationRequest];
    v15 = [v14 urls];
    [v8 setObject:v15 forKeyedSubscript:@"SYContentItemURLs"];
  }
  v16 = [(SYNotesActivationCommand *)self activationRequest];
  v17 = [v16 imagesData];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [(SYNotesActivationCommand *)self activationRequest];
    v20 = [v19 imagesData];
    [v8 setObject:v20 forKeyedSubscript:@"SYContentItemImageData"];
  }
  v21 = [(SYNotesActivationCommand *)self activationRequest];
  v22 = [v21 imageFileURLs];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    v24 = [(SYNotesActivationCommand *)self activationRequest];
    v25 = [v24 imageFileURLs];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_14;
    v31 = &unk_1E6463A60;
    id v32 = v8;
    v33 = v10;
    [(SYNotesActivationCommand *)self _loadDataFromFileURLs:v25 withCompletion:&v28];
  }
  v26 = [(SYNotesActivationCommand *)self activationRequest];
  int v27 = [v26 shouldAutoInsertLinkToCurrentActivity];

  if (v27) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SYAutoInsertLinkToCurrentUserActivity"];
  }
  if (!v23) {
    v10[2](v10);
  }
}

uint64_t __51__SYNotesActivationCommand_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.synapse", "NotesActivation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 activityType];
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 134218498;
    id v8 = v3;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_INFO, "Performing Notes activation with meta activity: %p:%@, userInfo: %@", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(a1 + 32) setUserInfo:*(void *)(a1 + 40)];
  return [(id)objc_opt_class() activateWithMetaActivity:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
}

void __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_2;
  block[3] = &unk_1E6463740;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__SYNotesActivationCommand_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F1CA48] array];
    id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SYContentItemImageData"];
    if (v3) {
      [v2 addObjectsFromArray:v3];
    }
    [v2 addObjectsFromArray:*(void *)(a1 + 32)];
    id v4 = (void *)[v2 copy];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:@"SYContentItemImageData"];
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

- (void)_loadDataFromFileURLs:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SYNotesActivationCommand.m", 161, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  dataLoadingQueue = self->__dataLoadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SYNotesActivationCommand__loadDataFromFileURLs_withCompletion___block_invoke;
  block[3] = &unk_1E6463BA8;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dataLoadingQueue, block);
}

void __65__SYNotesActivationCommand__loadDataFromFileURLs_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v14 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = os_log_create("com.apple.synapse", "NotesActivation");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          __int16 v9 = [v7 path];
          *(_DWORD *)buf = 138412290;
          v21 = v9;
          _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_INFO, "Loading image data from file URL: %@", buf, 0xCu);
        }
        id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
        if (v10) {
          [v2 addObject:v10];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  uint64_t v11 = *(void *)(v14 + 40);
  uint64_t v12 = v2;
  uint64_t v13 = (void *)[v2 copy];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
}

- (SYNotesActivationRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationRequest, 0);
  objc_storeStrong((id *)&self->__dataLoadingQueue, 0);
}

+ (void)setRemotePresentationEnabled:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
}

@end