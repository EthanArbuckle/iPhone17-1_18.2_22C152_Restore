@interface SiriAnalyticsLargeMessageStorage
- (SiriAnalyticsLargeMessageStorage)initWithApplicationIdentifier:(id)a3 processor:(id)a4 runtimeQueue:(id)a5;
- (void)enqueueLargeMessageObjectFromPath:(id)a3 messageWrapper:(id)a4 requestIdentifier:(id)a5 completion:(id)a6;
@end

@implementation SiriAnalyticsLargeMessageStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_runtimeQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 messageWrapper:(id)a4 requestIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0558;
  id v27 = v13;
  id v14 = v13;
  v15 = _Block_copy(aBlock);
  runtimeQueue = self->_runtimeQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_2;
  v21[3] = &unk_1E5AC0628;
  v21[4] = self;
  id v22 = v11;
  id v24 = v10;
  id v25 = v15;
  id v23 = v12;
  id v17 = v10;
  id v18 = v15;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(runtimeQueue, v21);
}

uint64_t __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

void __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) processWithUploadEvent:*(void *)(a1 + 40) requestIdentifier:*(void *)(a1 + 48)];
  if ([v2 determinationMade])
  {
    if (![v2 suppressed])
    {
      v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_3;
      v10[3] = &unk_1E5AC06C8;
      id v11 = *(id *)(a1 + 56);
      id v14 = *(id *)(a1 + 64);
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 32);
      id v12 = v8;
      uint64_t v13 = v9;
      dispatch_async(v7, v10);

      goto LABEL_7;
    }
    uint64_t v3 = *(void *)(a1 + 64);
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 64);
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = 4;
  }
  v6 = [v4 errorWithDomain:@"com.apple.siri.analytics" code:v5 userInfo:0];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);

LABEL_7:
}

void __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:*(void *)(a1 + 32)];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v26 = 0;
  v4 = [v2 readDataUpToLength:0x8000 error:&v26];
  id v5 = v26;
  BOOL v6 = v5 != 0;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v10 = v4;
    while ([v10 length])
    {
      [v3 appendData:v10];
      id v26 = 0;
      v4 = [v2 readDataUpToLength:0x8000 error:&v26];
      id v8 = v26;

      BOOL v6 = v8 != 0;
      if (v4)
      {
        id v10 = v4;
        if (!v8) {
          continue;
        }
      }
      goto LABEL_6;
    }
    [v2 closeFile];
    id v8 = 0;
    v4 = v10;
    goto LABEL_18;
  }
  id v8 = v5;
LABEL_6:
  [v2 closeFile];
  if (!v6)
  {
LABEL_18:
    id v11 = *(void **)(a1 + 40);
    id v12 = objc_alloc_init(MEMORY[0x1E4FA0408]);
    [v11 setContent:v12];

    uint64_t v13 = [*(id *)(a1 + 40) content];
    id v14 = (void *)[v3 copy];
    [v13 setDataPayload:v14];

    v15 = [*(id *)(a1 + 40) wrapAsAnyEvent];
    v16 = [MEMORY[0x1E4F618E0] sharedLogger];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_6;
    v22[3] = &unk_1E5AC0588;
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = *(void **)(a1 + 56);
    id v23 = v18;
    uint64_t v24 = v19;
    id v25 = v20;
    [v16 reportDataUploadEvent:v15 application:v17 completion:v22];

    goto LABEL_19;
  }
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v9 = SiriAnalyticsLogContextStorage;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStorage, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v28 = "-[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:requestIdentifier:completi"
          "on:]_block_invoke_3";
    __int16 v29 = 2112;
    uint64_t v30 = v21;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_error_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_ERROR, "%s Error while reading file from path %@ : %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_19:
}

void __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v4 = SiriAnalyticsLogContextStorage;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStorage, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v14 = "-[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:requestIdentifier:comple"
            "tion:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s Error while writing file at path: %@ to FBF with error: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStorage, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[SiriAnalyticsLargeMessageStorage enqueueLargeMessageObjectFromPath:messageWrapper:requestIdentifier:completi"
          "on:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_INFO, "%s Successfully wrote file to FBF at path: %@", buf, 0x16u);
  }
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_7;
  v10[3] = &unk_1E5AC0718;
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __114__SiriAnalyticsLargeMessageStorage_enqueueLargeMessageObjectFromPath_messageWrapper_requestIdentifier_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (SiriAnalyticsLargeMessageStorage)initWithApplicationIdentifier:(id)a3 processor:(id)a4 runtimeQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SiriAnalyticsLargeMessageStorage;
  id v12 = [(SiriAnalyticsLargeMessageStorage *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_applicationIdentifier, a3);
    objc_storeStrong((id *)&v13->_processor, a4);
    id v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.siri.analytics.storage.blob", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_runtimeQueue, a5);
  }

  return v13;
}

@end