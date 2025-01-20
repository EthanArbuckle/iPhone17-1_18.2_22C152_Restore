@interface SYDocumentWorkflowsClient
+ (BOOL)_verifyFeatureFlagWithError:(id *)a3;
+ (id)_createUnableToPerformRequestErrorWithCode:(int64_t)a3;
- (BOOL)canPerformRequest:(id)a3 withError:(id *)a4;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)processingQueue;
- (SYDocumentWorkflowsClient)init;
- (void)_createConnectionIfNecessary;
- (void)_dispatchRequestWithCompletion:(id)a3;
- (void)_invalidateConnection;
- (void)canPerformRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4;
- (void)fetchUserActivityForDocumentIndexKey:(id)a3 completion:(id)a4;
- (void)hasLastModifiedDocumentForFileAtURL:(id)a3 completion:(id)a4;
- (void)hasLastModifiedDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4;
- (void)hasOriginalDocumentForFileAtURL:(id)a3 completion:(id)a4;
- (void)hasOriginalDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4;
- (void)openLastModifiedDocumentForFileAtURL:(id)a3 completion:(id)a4;
- (void)openLastModifiedDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4;
- (void)openOriginalDocumentForFileAtURL:(id)a3 completion:(id)a4;
- (void)openOriginalDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4;
- (void)performRequest:(id)a3 completion:(id)a4;
- (void)performRequest:(id)a3 withCompletion:(id)a4;
- (void)performRequest:(id)a3 withErrorHandler:(id)a4 completion:(id)a5;
- (void)saveUserActivity:(id)a3 forDocumentIndexKey:(id)a4 sourceBundleIdentifier:(id)a5 completion:(id)a6;
- (void)setConnection:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)unlinkDocumentsWithRelatedUniqueidentifiers:(id)a3 completion:(id)a4;
- (void)updateLinkedDocumentsWithCompletion:(id)a3;
@end

@implementation SYDocumentWorkflowsClient

- (SYDocumentWorkflowsClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYDocumentWorkflowsClient;
  v2 = [(SYDocumentWorkflowsClient *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowsClient", v3);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (BOOL)_verifyFeatureFlagWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v4 = SYIsReturnToSenderEnabled();
  BOOL v5 = v4;
  if (a3 && (v4 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Feature is not available.";
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    *a3 = [v6 errorWithDomain:@"com.apple.synapse" code:-127 userInfo:v7];
  }
  return v5;
}

+ (id)_createUnableToPerformRequestErrorWithCode:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  BOOL v5 = _SYBundle();
  v6 = [v5 localizedStringForKey:@"Unable to perform request." value:@"Unable to perform request." table:@"Localizable"];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v4 errorWithDomain:@"com.apple.synapse" code:a3 userInfo:v7];

  return v8;
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_INFO, "Document Workflows client deallocated.", buf, 2u);
  }

  [(SYDocumentWorkflowsClient *)self _invalidateConnection];
  v4.receiver = self;
  v4.super_class = (Class)SYDocumentWorkflowsClient;
  [(SYDocumentWorkflowsClient *)&v4 dealloc];
}

- (void)fetchUserActivityForDocumentIndexKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke;
  v16[3] = &unk_1E64640E0;
  id v8 = v7;
  id v17 = v8;
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v16);
  id v15 = 0;
  char v10 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v15];
  id v11 = v15;
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_2;
    v12[3] = &unk_1E6464130;
    v14 = v9;
    id v13 = v6;
    [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v12];
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

uint64_t __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_3;
    v5[3] = &unk_1E6464108;
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [a2 fetchUserActivityForDocumentIndexKey:v3 completion:v5];
  }
  else
  {
    objc_super v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __77__SYDocumentWorkflowsClient_fetchUserActivityForDocumentIndexKey_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 userActivity];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)saveUserActivity:(id)a3 forDocumentIndexKey:(id)a4 sourceBundleIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke;
  v24[3] = &unk_1E6463968;
  id v14 = v13;
  id v25 = v14;
  id v15 = (void (**)(void, void, void))MEMORY[0x1C8769940](v24);
  id v23 = 0;
  char v16 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v23];
  id v17 = v23;
  if (v16)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_2;
    v18[3] = &unk_1E6464158;
    v22 = v15;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v18];
  }
  else
  {
    ((void (**)(void, void, id))v15)[2](v15, 0, v17);
  }
}

uint64_t __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [[SYUserActivityWrapper alloc] initWithUserActivity:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_3;
    v7[3] = &unk_1E6463968;
    id v8 = *(id *)(a1 + 56);
    [v3 saveUserActivity:v4 forDocumentIndexKey:v5 sourceBundleIdentifier:v6 completion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __100__SYDocumentWorkflowsClient_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke;
  v23[3] = &unk_1E6464180;
  id v8 = v7;
  id v24 = v8;
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v23);
  if (![v6 count])
  {
    id v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentWorkflowsClient fetchAttributesForDocumentsWithIndexKeys:completion:]();
    }

    id v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    id v15 = @"indexKeys can't be nil or empty";
LABEL_13:
    id v17 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];
    objc_exception_throw(v17);
  }
  if (!v8)
  {
    char v16 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentWorkflowsClient fetchAttributesForDocumentsWithIndexKeys:completion:]();
    }

    id v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    id v15 = @"completion can't be nil";
    goto LABEL_13;
  }
  id v22 = 0;
  char v10 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v22];
  id v11 = v22;
  if (v10)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_26;
    v18[3] = &unk_1E64641A8;
    id v20 = v9;
    id v19 = v6;
    id v21 = v8;
    [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v18];
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, MEMORY[0x1E4F1CBF0], v11);
  }
}

uint64_t __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_26(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2;
    v5[3] = &unk_1E6464180;
    id v6 = *(id *)(a1 + 48);
    [a2 fetchAttributesForDocumentsWithIndexKeys:v3 completion:v5];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __81__SYDocumentWorkflowsClient_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)canPerformRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__SYDocumentWorkflowsClient_canPerformRequest_completion___block_invoke;
  v31[3] = &unk_1E6463968;
  id v7 = v6;
  id v32 = v7;
  id v8 = (void (**)(void, void, void))MEMORY[0x1C8769940](v31);
  id v30 = 0;
  char v9 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v30];
  id v10 = v30;
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v28 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsClient canPerformRequest:completion:]();
      }

      id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unsupported request type" userInfo:0];
      objc_exception_throw(v29);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v5 verifyParameters] & 1) == 0)
    {
      id v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SYDocumentWorkflowsClient canPerformRequest:completion:]((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
      }

      v27 = [(id)objc_opt_class() _createUnableToPerformRequestErrorWithCode:-129];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v27);
    }
    else
    {
      id v11 = [v5 documentIndexKey];
      if (v11)
      {
        v8[2](v8, 1, 0);
      }
      else
      {
        id v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[SYDocumentWorkflowsClient canPerformRequest:completion:]((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);
        }

        id v19 = [(id)objc_opt_class() _createUnableToPerformRequestErrorWithCode:-129];
        ((void (**)(void, void, void *))v8)[2](v8, 0, v19);
      }
    }
  }
  else
  {
    ((void (**)(void, void, id))v8)[2](v8, 0, v10);
  }
}

uint64_t __58__SYDocumentWorkflowsClient_canPerformRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)canPerformRequest:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__4;
  id v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__SYDocumentWorkflowsClient_canPerformRequest_withError___block_invoke;
  v12[3] = &unk_1E6463940;
  uint64_t v14 = &v22;
  uint64_t v15 = &v16;
  id v8 = v7;
  uint64_t v13 = v8;
  [(SYDocumentWorkflowsClient *)self canPerformRequest:v6 completion:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    char v9 = (void *)v17[5];
    if (v9) {
      *a4 = v9;
    }
  }
  char v10 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __57__SYDocumentWorkflowsClient_canPerformRequest_withError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performRequest:(id)a3 withErrorHandler:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SYDocumentWorkflowsClient_performRequest_withErrorHandler_completion___block_invoke;
  v12[3] = &unk_1E64641D0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SYDocumentWorkflowsClient *)self performRequest:a3 completion:v12];
}

uint64_t __72__SYDocumentWorkflowsClient_performRequest_withErrorHandler_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)performRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SYDocumentWorkflowsClient_performRequest_withCompletion___block_invoke;
  v8[3] = &unk_1E6463968;
  id v9 = v6;
  id v7 = v6;
  [(SYDocumentWorkflowsClient *)self performRequest:a3 completion:v8];
}

uint64_t __59__SYDocumentWorkflowsClient_performRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke;
  v16[3] = &unk_1E6463968;
  id v17 = v7;
  id v8 = v7;
  id v9 = (void *)MEMORY[0x1C8769940](v16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2;
  v12[3] = &unk_1E6464220;
  id v14 = self;
  id v15 = v9;
  id v13 = v6;
  id v10 = v9;
  id v11 = v6;
  [(SYDocumentWorkflowsClient *)self canPerformRequest:v11 completion:v12];
}

uint64_t __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_34;
    v8[3] = &unk_1E6464130;
    id v6 = *(void **)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    [v6 _dispatchRequestWithCompletion:v8];
  }
  else
  {
    id v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_34(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_35;
    v6[3] = &unk_1E64641F8;
    id v7 = v4;
    id v8 = *(id *)(a1 + 40);
    [v7 performWithServiceProxy:a2 completion:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_35_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)hasOriginalDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke;
  v21[3] = &unk_1E6464248;
  id v8 = v7;
  id v23 = v8;
  id v9 = v6;
  id v22 = v9;
  id v10 = (void (**)(void, void, void))MEMORY[0x1C8769940](v21);
  id v20 = 0;
  char v11 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v20];
  id v12 = v20;
  if (v11)
  {
    id v19 = 0;
    id v13 = +[SYDocumentAttributes documentAttributesForFileAtURL:v9 error:&v19];
    id v14 = v19;
    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_38;
      v15[3] = &unk_1E6464270;
      uint64_t v18 = v10;
      id v16 = v9;
      id v17 = v13;
      [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v15];
    }
    else
    {
      ((void (**)(void, void, id))v10)[2](v10, 0, v14);
    }
  }
  else
  {
    ((void (**)(void, void, id))v10)[2](v10, 0, v12);
  }
}

void __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(void *)(a1 + 40))
  {
    id v6 = a3;
    id v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) path];
      id v9 = [v5 originalFileURL];
      id v10 = [v9 path];
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Original document of: %@, is: %@", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412290;
      int v11 = v5;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "Asking for original document of: %@", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_39;
    v8[3] = &unk_1E6463B08;
    id v9 = *(id *)(a1 + 48);
    [v3 hasOriginalDocumentForFileAtURL:v6 withAttributes:v7 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __72__SYDocumentWorkflowsClient_hasOriginalDocumentForFileAtURL_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hasOriginalDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v15[3] = &unk_1E6463B08;
  id v16 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1C8769940](v15);
  id v10 = [v8 indexKey];

  v17[0] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke_2;
  v13[3] = &unk_1E6464180;
  id v14 = v9;
  id v12 = v9;
  [(SYDocumentWorkflowsClient *)self fetchAttributesForDocumentsWithIndexKeys:v11 completion:v13];
}

uint64_t __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __89__SYDocumentWorkflowsClient_hasOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openOriginalDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke;
  v18[3] = &unk_1E6464298;
  id v8 = v7;
  id v20 = v8;
  id v9 = v6;
  id v19 = v9;
  id v10 = (void (**)(void, void, void))MEMORY[0x1C8769940](v18);
  id v17 = 0;
  int v11 = +[SYDocumentAttributes documentAttributesForFileAtURL:v9 error:&v17];
  id v12 = v17;
  if (v11)
  {
    __int16 v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v9 path];
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_INFO, "Opening original document of: %@", buf, 0xCu);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke_41;
    v15[3] = &unk_1E6463968;
    id v16 = v10;
    [(SYDocumentWorkflowsClient *)self openOriginalDocumentForFileWithDocumentAttributes:v11 completion:v15];
  }
  else
  {
    ((void (**)(void, void, id))v10)[2](v10, 0, v12);
  }
}

void __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) path];
      int v8 = 138412802;
      id v9 = v7;
      __int16 v10 = 1024;
      int v11 = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "Original document for: %@, was opened successfully: %d, error: %@", (uint8_t *)&v8, 0x1Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __73__SYDocumentWorkflowsClient_openOriginalDocumentForFileAtURL_completion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openOriginalDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = objc_alloc_init(SYReturnToDocumentRequest);
  [(SYReturnToDocumentRequest *)v8 setDocumentAttributes:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __90__SYDocumentWorkflowsClient_openOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v10[3] = &unk_1E6463968;
  id v11 = v6;
  id v9 = v6;
  [(SYDocumentWorkflowsClient *)self performRequest:v8 completion:v10];
}

uint64_t __90__SYDocumentWorkflowsClient_openOriginalDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hasLastModifiedDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke;
  v21[3] = &unk_1E64642C0;
  id v8 = v7;
  id v23 = v8;
  id v9 = v6;
  id v22 = v9;
  __int16 v10 = (void (**)(void, void, void))MEMORY[0x1C8769940](v21);
  id v20 = 0;
  id v11 = +[SYDocumentAttributes documentAttributesForFileAtURL:v9 error:&v20];
  id v12 = v20;
  if (v11)
  {
    id v19 = 0;
    char v13 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v19];
    id v14 = v19;
    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_44;
      v15[3] = &unk_1E6464270;
      uint64_t v18 = v10;
      id v16 = v9;
      id v17 = v11;
      [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v15];
    }
    else
    {
      ((void (**)(void, void, id))v10)[2](v10, 0, v14);
    }
  }
  else
  {
    ((void (**)(void, void, id))v10)[2](v10, 0, v12);
  }
}

void __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(void *)(a1 + 40))
  {
    id v6 = a3;
    id v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) path];
      id v9 = [v5 fileURL];
      __int16 v10 = [v9 path];
      int v11 = 138478083;
      id v12 = v8;
      __int16 v13 = 2113;
      id v14 = v10;
      _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Last modified document of: %{private}@, is: %{private}@", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_44(id *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [a1[4] path];
      *(_DWORD *)buf = 138477827;
      int v11 = v5;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "Asking for last modified document of: %{private}@", buf, 0xCu);
    }
    id v6 = [a1[5] indexKey];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_45;
    v7[3] = &unk_1E64642E8;
    id v8 = a1[4];
    id v9 = a1[6];
    [v3 hasLastModifiedDocument:v6 completion:v7];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __76__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileAtURL_completion___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 fileURL];
  id v8 = [v7 path];
  id v9 = [*(id *)(a1 + 32) path];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    int v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [*(id *)(a1 + 32) path];
      int v14 = 138477827;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "Last modified document is the requested fileURL: %{private}@", (uint8_t *)&v14, 0xCu);
    }
    __int16 v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    __int16 v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v13();
}

- (void)hasLastModifiedDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v16[3] = &unk_1E6464310;
  id v8 = v7;
  id v17 = v8;
  id v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v16);
  id v15 = 0;
  char v10 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v15];
  id v11 = v15;
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2;
    v12[3] = &unk_1E6464130;
    int v14 = v9;
    id v13 = v6;
    [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v12];
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

uint64_t __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) indexKey];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3;
    v5[3] = &unk_1E6464310;
    id v6 = *(id *)(a1 + 40);
    [v3 hasLastModifiedDocument:v4 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __93__SYDocumentWorkflowsClient_hasLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openLastModifiedDocumentForFileAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke;
  v17[3] = &unk_1E6464298;
  id v19 = v7;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  char v10 = (void *)MEMORY[0x1C8769940](v17);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_46;
  v13[3] = &unk_1E6464338;
  id v15 = self;
  id v16 = v10;
  id v14 = v8;
  id v11 = v8;
  id v12 = v10;
  +[SYDocumentAttributes fetchDocumentAttributesForFileAtURL:v11 completion:v13];
}

void __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) path];
      int v8 = 138412802;
      id v9 = v7;
      __int16 v10 = 1024;
      int v11 = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "Last modified document for: %@, was opened successfully: %d, error: %@", (uint8_t *)&v8, 0x1Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412290;
      __int16 v10 = v5;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_INFO, "Opening last modified document of: %@", buf, 0xCu);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_47;
    v7[3] = &unk_1E6463968;
    id v6 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v6 openLastModifiedDocumentForFileWithDocumentAttributes:v3 completion:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __77__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileAtURL_completion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openLastModifiedDocumentForFileWithDocumentAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke;
  v16[3] = &unk_1E6463968;
  id v8 = v7;
  id v17 = v8;
  id v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v16);
  id v15 = 0;
  char v10 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v15];
  id v11 = v15;
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2;
    v12[3] = &unk_1E6464130;
    uint64_t v14 = v9;
    id v13 = v6;
    [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v12];
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

uint64_t __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) indexKey];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3;
    v5[3] = &unk_1E6463968;
    id v6 = *(id *)(a1 + 40);
    [v3 openLastModifiedDocument:v4 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __94__SYDocumentWorkflowsClient_openLastModifiedDocumentForFileWithDocumentAttributes_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateLinkedDocumentsWithCompletion:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke;
  v12[3] = &unk_1E6463968;
  id v5 = v4;
  id v13 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x1C8769940](v12);
  id v11 = 0;
  char v7 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v11];
  id v8 = v11;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_2;
    v9[3] = &unk_1E6464360;
    char v10 = v6;
    [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v9];
  }
  else
  {
    ((void (**)(void, void, id))v6)[2](v6, 0, v8);
  }
}

uint64_t __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_3;
    v4[3] = &unk_1E6463968;
    id v5 = *(id *)(a1 + 32);
    [a2 updateLinkedDocumentsWithCompletion:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

uint64_t __65__SYDocumentWorkflowsClient_updateLinkedDocumentsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unlinkDocumentsWithRelatedUniqueidentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke;
  v18[3] = &unk_1E6463968;
  id v8 = v7;
  id v19 = v8;
  id v9 = (void (**)(void, void, void))MEMORY[0x1C8769940](v18);
  id v17 = 0;
  char v10 = [(id)objc_opt_class() _verifyFeatureFlagWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    if ([v6 count])
    {
      __int16 v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      id v13 = [v12 allObjects];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_2;
      v14[3] = &unk_1E6464130;
      id v16 = v9;
      id v6 = v13;
      id v15 = v6;
      [(SYDocumentWorkflowsClient *)self _dispatchRequestWithCompletion:v14];
    }
    else
    {
      v9[2](v9, 1, 0);
    }
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

uint64_t __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_3;
    v5[3] = &unk_1E6463968;
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [a2 unlinkDocumentsWithRelatedUniqueIdentifiers:v3 completion:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __84__SYDocumentWorkflowsClient_unlinkDocumentsWithRelatedUniqueidentifiers_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_dispatchRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDocumentWorkflowsClient *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E6463BA8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createConnectionIfNecessary];
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2;
  __int16 v12 = &unk_1E6463EC8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v3;
  id v4 = [v2 remoteObjectProxyWithErrorHandler:&v9];

  if (v4)
  {
    (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4, 0, v5);
  }
  else
  {
    id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_msgSend((id)objc_opt_class(), "_createUnableToPerformRequestErrorWithCode:", -124, v9, v10, v11, v12);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  __int16 v12 = [(id)objc_opt_class() _createUnableToPerformRequestErrorWithCode:-124];
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
}

- (void)_createConnectionIfNecessary
{
  v39[5] = *MEMORY[0x1E4F143B8];
  id v3 = [(SYDocumentWorkflowsClient *)self connection];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v5 = +[SYDocumentWorkflowsService serviceName];
    uint64_t v6 = (void *)[v4 initWithMachServiceName:v5 options:0];
    [(SYDocumentWorkflowsClient *)self setConnection:v6];

    uint64_t v7 = [(SYDocumentWorkflowsClient *)self connection];
    uint64_t v8 = [(SYDocumentWorkflowsClient *)self processingQueue];
    [v7 _setQueue:v8];

    uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2D620];
    uint64_t v10 = [(SYDocumentWorkflowsClient *)self connection];
    [v10 setRemoteObjectInterface:v9];

    uint64_t v11 = [(SYDocumentWorkflowsClient *)self connection];
    __int16 v12 = [v11 remoteObjectInterface];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v39[2] = objc_opt_class();
    v39[3] = objc_opt_class();
    v39[4] = objc_opt_class();
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:5];
    id v15 = [v13 setWithArray:v14];
    [v12 setClasses:v15 forSelector:sel_fetchAttributesForDocumentsWithIndexKeys_completion_ argumentIndex:0 ofReply:1];

    id v16 = [(SYDocumentWorkflowsClient *)self connection];
    id v17 = [v16 remoteObjectInterface];
    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    id v20 = [v18 setWithArray:v19];
    [v17 setClasses:v20 forSelector:sel_hasLastModifiedDocument_completion_ argumentIndex:0 ofReply:1];

    id v21 = [(SYDocumentWorkflowsClient *)self connection];
    id v22 = [v21 remoteObjectInterface];
    id v23 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    char v25 = [v23 setWithArray:v24];
    [v22 setClasses:v25 forSelector:sel_fetchUserActivityForDocumentIndexKey_completion_ argumentIndex:0 ofReply:1];

    objc_initWeak(&location, self);
    uint64_t v26 = [(SYDocumentWorkflowsClient *)self connection];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke;
    v34[3] = &unk_1E64637D0;
    objc_copyWeak(&v35, &location);
    [v26 setInvalidationHandler:v34];

    v27 = [(SYDocumentWorkflowsClient *)self connection];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke_127;
    id v32 = &unk_1E64637D0;
    objc_copyWeak(&v33, &location);
    [v27 setInterruptionHandler:&v29];

    v28 = [(SYDocumentWorkflowsClient *)self connection];
    [v28 resume];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

void __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_INFO, "Connection to service was invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

void __57__SYDocumentWorkflowsClient__createConnectionIfNecessary__block_invoke_127(uint64_t a1)
{
  v2 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_INFO, "Connection to service was interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

- (void)_invalidateConnection
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)fetchAttributesForDocumentsWithIndexKeys:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C2C5F000, v0, v1, "indexKeys can't be nil or empty.", v2, v3, v4, v5, v6);
}

- (void)fetchAttributesForDocumentsWithIndexKeys:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C2C5F000, v0, v1, "completion can't be nil.", v2, v3, v4, v5, v6);
}

- (void)canPerformRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canPerformRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canPerformRequest:completion:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C2C5F000, v0, v1, "Unsupported request type.", v2, v3, v4, v5, v6);
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to perform request: %@, error: %@");
}

void __55__SYDocumentWorkflowsClient_performRequest_completion___block_invoke_2_35_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Invoking request: %@, failed with error: %@");
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1C2C5F000, v0, v1, "Service is not available.", v2, v3, v4, v5, v6);
}

void __60__SYDocumentWorkflowsClient__dispatchRequestWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end