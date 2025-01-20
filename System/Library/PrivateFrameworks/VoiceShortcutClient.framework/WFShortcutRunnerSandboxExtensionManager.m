@interface WFShortcutRunnerSandboxExtensionManager
+ (WFShortcutRunnerSandboxExtensionManager)sharedManager;
- (BOOL)requestSandboxExtensionForRunningActionWithAccessResources:(id)a3 error:(id *)a4;
- (BOOL)retakeResignedExtensionsWithReason:(id)a3 error:(id *)a4;
- (NSMutableSet)issuedExtensionHandlers;
- (NSMutableSet)issuedExtensionsAccessResources;
- (NSMutableSet)resignedExtensionsAccessResources;
- (WFShortcutRunnerSandboxExtensionManager)init;
- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3;
- (id)requestExtensionTokensForAccessResources:(id)a3 rejectedAccessResources:(id *)a4 error:(id *)a5;
- (id)synchronousRemoteDataStoreWithErrorHandler:(id)a3;
- (void)performWithSandboxExtensions:(id)a3 asynchronousBlock:(id)a4;
- (void)performWithSandboxExtensions:(id)a3 synchronousBlock:(id)a4;
- (void)requestExtensionTokensForAccessResources:(id)a3 completion:(id)a4;
- (void)requestSandboxExtensionForRunningActionWithAccessResources:(id)a3 completion:(id)a4;
- (void)requestSandboxExtensionForToolKitIndexingWithCompletionHandler:(id)a3;
- (void)resignIssuedExtensionsWithReason:(id)a3;
- (void)temporaryRequestSandboxExtensionWithBlock:(id)a3;
@end

@implementation WFShortcutRunnerSandboxExtensionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resignedExtensionsAccessResources, 0);
  objc_storeStrong((id *)&self->_issuedExtensionHandlers, 0);
  objc_storeStrong((id *)&self->_issuedExtensionsAccessResources, 0);
}

- (NSMutableSet)resignedExtensionsAccessResources
{
  return self->_resignedExtensionsAccessResources;
}

- (NSMutableSet)issuedExtensionHandlers
{
  return self->_issuedExtensionHandlers;
}

- (NSMutableSet)issuedExtensionsAccessResources
{
  return self->_issuedExtensionsAccessResources;
}

- (void)requestSandboxExtensionForToolKitIndexingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6079C90;
  id v5 = v4;
  id v11 = v5;
  v6 = [(WFShortcutRunnerSandboxExtensionManager *)self asynchronousRemoteDataStoreWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E60784D0;
  id v9 = v5;
  id v7 = v5;
  [v6 requestSandboxExtensionForToolKitIndexingWithCompletion:v8];
}

uint64_t __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_197);
  uint64_t v8 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E6078C68;
  id v12 = v7;
  id v9 = *(void (**)(uint64_t, id, id, void *, void))(v8 + 16);
  id v10 = v7;
  v9(v8, v6, v5, v11, 0);
}

uint64_t __106__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForToolKitIndexingWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_200];
}

- (void)temporaryRequestSandboxExtensionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[WFShortcutRunnerSandboxExtensionRequest all];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__WFShortcutRunnerSandboxExtensionManager_temporaryRequestSandboxExtensionWithBlock___block_invoke;
  v7[3] = &unk_1E60784A8;
  id v8 = v4;
  id v6 = v4;
  [(WFShortcutRunnerSandboxExtensionManager *)self performWithSandboxExtensions:v5 asynchronousBlock:v7];
}

uint64_t __85__WFShortcutRunnerSandboxExtensionManager_temporaryRequestSandboxExtensionWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)requestSandboxExtensionForRunningActionWithAccessResources:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_error___block_invoke;
  aBlock[3] = &unk_1E6078C68;
  aBlock[4] = self;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v6];
  id v9 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
  [v8 minusSet:v9];

  if ([v8 count])
  {
    id v18 = 0;
    id v10 = [(WFShortcutRunnerSandboxExtensionManager *)self requestExtensionTokensForAccessResources:v8 rejectedAccessResources:&v18 error:a4];
    id v11 = v18;
    BOOL v12 = v10 != 0;
    if (v10)
    {
      v13 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_197);
      v14 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
      [v14 unionSet:v6];

      v15 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
      [v15 minusSet:v11];

      v16 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionHandlers];
      [v16 unionSet:v13];
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  v7[2](v7);
  return v12;
}

void __108__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_error___block_invoke(uint64_t a1)
{
}

- (void)requestSandboxExtensionForRunningActionWithAccessResources:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] setWithSet:a3];
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
  [v7 minusSet:v8];

  os_unfair_lock_unlock(&self->_lock);
  if ([v7 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __113__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_completion___block_invoke;
    v10[3] = &unk_1E6078480;
    id v12 = v6;
    void v10[4] = self;
    id v11 = v7;
    [(WFShortcutRunnerSandboxExtensionManager *)self requestExtensionTokensForAccessResources:v11 completion:v10];
  }
  else
  {
    id v9 = objc_opt_new();
    (*((void (**)(id, void *, void))v6 + 2))(v6, v9, 0);
  }
}

void __113__WFShortcutRunnerSandboxExtensionManager_requestSandboxExtensionForRunningActionWithAccessResources_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v6 = objc_msgSend(v10, "if_compactMap:", &__block_literal_global_197);
    id v7 = objc_opt_new();
    [v7 unionSet:*(void *)(a1 + 40)];
    [v7 minusSet:v5];
    id v8 = [*(id *)(a1 + 32) issuedExtensionsAccessResources];
    [v8 unionSet:v7];

    id v9 = [*(id *)(a1 + 32) issuedExtensionHandlers];
    [v9 unionSet:v6];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)requestExtensionTokensForAccessResources:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:]";
      __int16 v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_DEFAULT, "%s Sandbox Extensions for shortcut execution needed. Requesting sandbox extensions for resources: %{public}@", buf, 0x16u);
    }

    id v9 = getWFVoiceShortcutClientLogObject();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    id v11 = getWFVoiceShortcutClientLogObject();
    id v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RequestSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke;
    v19[3] = &unk_1E6079C90;
    id v13 = v7;
    id v20 = v13;
    v14 = [(WFShortcutRunnerSandboxExtensionManager *)self asynchronousRemoteDataStoreWithErrorHandler:v19];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke_2;
    v15[3] = &unk_1E6078458;
    v16 = v6;
    os_signpost_id_t v18 = v10;
    id v17 = v13;
    [v14 requestSandboxExtensionForAccessResources:v16 completion:v15];
  }
  else
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

uint64_t __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_completion___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  os_signpost_id_t v10 = v9;
  if (v7)
  {
    id v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[4];
      int v21 = 136315394;
      v22 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:]_block_invoke_2";
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      id v13 = "%s Received sandbox extensions tokens for resources: %{public}@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
LABEL_7:
      _os_log_impl(&dword_1B3C5C000, v14, v15, v13, (uint8_t *)&v21, v16);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    id v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = a1[4];
      int v21 = 136315650;
      v22 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:completion:]_block_invoke";
      __int16 v23 = 2114;
      uint64_t v24 = v17;
      __int16 v25 = 2114;
      v26 = v10;
      id v13 = "%s Failed to request sandbox extensions for access resources %{public}@ with error %{public}@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
      goto LABEL_7;
    }
LABEL_8:
  }
  os_signpost_id_t v18 = getWFVoiceShortcutClientLogObject();
  v19 = v18;
  os_signpost_id_t v20 = a1[6];
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v19, OS_SIGNPOST_INTERVAL_END, v20, "RequestSandboxExtension", "", (uint8_t *)&v21, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (id)requestExtensionTokensForAccessResources:(id)a3 rejectedAccessResources:(id *)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  if ([v8 count])
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__10312;
    v41 = __Block_byref_object_dispose__10313;
    id v42 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__10312;
    v35 = __Block_byref_object_dispose__10313;
    id v36 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__10312;
    v29 = __Block_byref_object_dispose__10313;
    id v30 = 0;
    id v9 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:error:]";
      __int16 v45 = 2114;
      v46 = v8;
      _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_DEFAULT, "%s Sandbox Extensions for shortcut execution needed. Requesting sandbox extensions for resources: %{public}@", buf, 0x16u);
    }

    os_signpost_id_t v10 = getWFVoiceShortcutClientLogObject();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    uint64_t v12 = getWFVoiceShortcutClientLogObject();
    id v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v8;
      _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RequestSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke;
    v24[3] = &unk_1E6079890;
    v24[4] = &v25;
    v14 = [(WFShortcutRunnerSandboxExtensionManager *)self synchronousRemoteDataStoreWithErrorHandler:v24];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke_2;
    v19[3] = &unk_1E6078430;
    os_signpost_id_t v20 = v8;
    int v21 = &v37;
    v22 = &v31;
    __int16 v23 = &v25;
    [v14 requestSandboxExtensionForAccessResources:v20 completion:v19];

    if (a4) {
      *a4 = (id) v32[5];
    }
    if (a5) {
      *a5 = (id) v26[5];
    }
    os_log_type_t v15 = getWFVoiceShortcutClientLogObject();
    uint32_t v16 = v15;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v16, OS_SIGNPOST_INTERVAL_END, v11, "RequestSandboxExtension", "", buf, 2u);
    }

    id v17 = (id)v38[5];
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke(uint64_t a1, void *a2)
{
}

void __114__WFShortcutRunnerSandboxExtensionManager_requestExtensionTokensForAccessResources_rejectedAccessResources_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7)
  {
    os_signpost_id_t v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[4];
      int v26 = 136315394;
      uint64_t v27 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:e"
            "rror:]_block_invoke_2";
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      id v13 = "%s Received sandbox extensions tokens for resources: %{public}@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
LABEL_7:
      _os_log_impl(&dword_1B3C5C000, v14, v15, v13, (uint8_t *)&v26, v16);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    os_signpost_id_t v11 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = a1[4];
      int v26 = 136315650;
      uint64_t v27 = "-[WFShortcutRunnerSandboxExtensionManager requestExtensionTokensForAccessResources:rejectedAccessResources:e"
            "rror:]_block_invoke";
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      __int16 v30 = 2114;
      id v31 = v10;
      id v13 = "%s Failed to request sandbox extensions for access resources %{public}@ with error %{public}@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
      goto LABEL_7;
    }
LABEL_8:
  }
  uint64_t v18 = *(void *)(a1[5] + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v7;
  id v20 = v7;

  uint64_t v21 = *(void *)(a1[6] + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v8;
  id v23 = v8;

  uint64_t v24 = *(void *)(a1[7] + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v10;
}

- (id)synchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[VCVoiceShortcutClient standardClient];
  id v5 = [v4 synchronousRemoteDataStoreWithErrorHandler:v3];

  return v5;
}

- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[VCVoiceShortcutClient standardClient];
  id v5 = [v4 asynchronousRemoteDataStoreWithErrorHandler:v3];

  return v5;
}

- (BOOL)retakeResignedExtensionsWithReason:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__WFShortcutRunnerSandboxExtensionManager_retakeResignedExtensionsWithReason_error___block_invoke;
  aBlock[3] = &unk_1E6078C68;
  aBlock[4] = self;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  id v8 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(WFShortcutRunnerSandboxExtensionManager *)self resignedExtensionsAccessResources];
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = "-[WFShortcutRunnerSandboxExtensionManager retakeResignedExtensionsWithReason:error:]";
    __int16 v26 = 2114;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_DEFAULT, "%s Retaking resigned extensions with reason: %{public}@, taking extensions for: %@", buf, 0x20u);
  }
  id v10 = [(WFShortcutRunnerSandboxExtensionManager *)self resignedExtensionsAccessResources];
  id v21 = 0;
  id v22 = 0;
  os_signpost_id_t v11 = [(WFShortcutRunnerSandboxExtensionManager *)self requestExtensionTokensForAccessResources:v10 rejectedAccessResources:&v22 error:&v21];
  id v12 = v22;
  id v13 = v21;

  uint64_t v14 = [v12 count];
  if (v14)
  {
    if (a4 && v13) {
      *a4 = v13;
    }
    os_log_type_t v15 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "-[WFShortcutRunnerSandboxExtensionManager retakeResignedExtensionsWithReason:error:]";
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl(&dword_1B3C5C000, v15, OS_LOG_TYPE_DEFAULT, "%s The following access resources were rejected when requesting sandbox extensions for resign extensions: %@, error: %@", buf, 0x20u);
    }
  }
  else
  {
    os_log_type_t v15 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_197);
    uint32_t v16 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionHandlers];
    [v16 unionSet:v15];

    uint64_t v17 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
    uint64_t v18 = [(WFShortcutRunnerSandboxExtensionManager *)self resignedExtensionsAccessResources];
    [v17 unionSet:v18];

    v19 = [(WFShortcutRunnerSandboxExtensionManager *)self resignedExtensionsAccessResources];
    [v19 removeAllObjects];
  }
  v7[2](v7);

  return v14 == 0;
}

void __84__WFShortcutRunnerSandboxExtensionManager_retakeResignedExtensionsWithReason_error___block_invoke(uint64_t a1)
{
}

- (void)resignIssuedExtensionsWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
    int v13 = 136315650;
    uint64_t v14 = "-[WFShortcutRunnerSandboxExtensionManager resignIssuedExtensionsWithReason:]";
    __int16 v15 = 2114;
    id v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1B3C5C000, v6, OS_LOG_TYPE_DEFAULT, "%s Resigning issued extensions with reason: %{public}@, issued extensions: %@", (uint8_t *)&v13, 0x20u);
  }
  id v8 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionHandlers];
  [v8 enumerateObjectsUsingBlock:&__block_literal_global_144];

  id v9 = [(WFShortcutRunnerSandboxExtensionManager *)self resignedExtensionsAccessResources];
  id v10 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
  [v9 unionSet:v10];

  os_signpost_id_t v11 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionHandlers];
  [v11 removeAllObjects];

  id v12 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
  [v12 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __76__WFShortcutRunnerSandboxExtensionManager_resignIssuedExtensionsWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 longLongValue];
  return MEMORY[0x1F40CDE50](v2);
}

- (void)performWithSandboxExtensions:(id)a3 synchronousBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  id v8 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v12 = [v6 accessResourceClassNames];
    int v13 = (void *)[v12 mutableCopy];
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformWithSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);
  }
  uint64_t v14 = [v6 accessResourceClassNames];
  __int16 v15 = (void *)[v14 mutableCopy];

  os_unfair_lock_lock(&self->_lock);
  id v16 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
  [v15 minusSet:v16];

  os_unfair_lock_unlock(&self->_lock);
  if ([v15 count])
  {
    __int16 v17 = [v6 accessResourceClassNames];
    id v24 = 0;
    id v25 = 0;
    uint64_t v18 = [(WFShortcutRunnerSandboxExtensionManager *)self requestExtensionTokensForAccessResources:v17 rejectedAccessResources:&v25 error:&v24];
    id v19 = v25;
    id v20 = v24;

    id v21 = objc_msgSend(v18, "if_compactMap:", &__block_literal_global_197);
    v7[2](v7, v19, v20);

    [v21 enumerateObjectsUsingBlock:&__block_literal_global_200];
    id v22 = getWFVoiceShortcutClientLogObject();
    id v23 = v22;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v23, OS_SIGNPOST_INTERVAL_END, v9, "PerformWithSandboxExtension", "", buf, 2u);
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)performWithSandboxExtensions:(id)a3 asynchronousBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v12 = [v6 accessResourceClassNames];
    int v13 = (void *)[v12 mutableCopy];
    *(_DWORD *)buf = 138412290;
    id v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformWithSandboxExtension", "classNames=%{signpost.description:attribute}@", buf, 0xCu);
  }
  uint64_t v14 = [v6 accessResourceClassNames];
  __int16 v15 = (void *)[v14 mutableCopy];

  os_unfair_lock_lock(&self->_lock);
  id v16 = [(WFShortcutRunnerSandboxExtensionManager *)self issuedExtensionsAccessResources];
  [v15 minusSet:v16];

  os_unfair_lock_unlock(&self->_lock);
  if ([v15 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_2;
    v17[3] = &unk_1E60783E8;
    os_signpost_id_t v19 = v9;
    id v18 = v7;
    [(WFShortcutRunnerSandboxExtensionManager *)self requestExtensionTokensForAccessResources:v15 completion:v17];
  }
  else
  {
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, &__block_literal_global_139);
  }
}

void __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  os_signpost_id_t v9 = objc_msgSend(a2, "if_compactMap:", &__block_literal_global_197);
  id v10 = getWFVoiceShortcutClientLogObject();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PerformWithSandboxExtension", "", buf, 2u);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_140;
  v16[3] = &unk_1E6078C68;
  id v17 = v9;
  uint64_t v14 = *(void (**)(uint64_t, id, id, void *))(v13 + 16);
  id v15 = v9;
  v14(v13, v8, v7, v16);
}

uint64_t __90__WFShortcutRunnerSandboxExtensionManager_performWithSandboxExtensions_asynchronousBlock___block_invoke_140(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_200];
}

- (WFShortcutRunnerSandboxExtensionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFShortcutRunnerSandboxExtensionManager;
  uint64_t v2 = [(WFShortcutRunnerSandboxExtensionManager *)&v12 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    issuedExtensionsAccessResources = v3->_issuedExtensionsAccessResources;
    v3->_issuedExtensionsAccessResources = (NSMutableSet *)v4;

    uint64_t v6 = objc_opt_new();
    issuedExtensionHandlers = v3->_issuedExtensionHandlers;
    v3->_issuedExtensionHandlers = (NSMutableSet *)v6;

    uint64_t v8 = objc_opt_new();
    resignedExtensionsAccessResources = v3->_resignedExtensionsAccessResources;
    v3->_resignedExtensionsAccessResources = (NSMutableSet *)v8;

    id v10 = v3;
  }

  return v3;
}

+ (WFShortcutRunnerSandboxExtensionManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_10329);
  }
  uint64_t v2 = (void *)sharedManager_result;
  return (WFShortcutRunnerSandboxExtensionManager *)v2;
}

uint64_t __56__WFShortcutRunnerSandboxExtensionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFShortcutRunnerSandboxExtensionManager);
  uint64_t v1 = sharedManager_result;
  sharedManager_result = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end