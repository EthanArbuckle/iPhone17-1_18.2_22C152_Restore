@interface SLSWActionDispatcher
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (SLSWActionDispatcher)initWithQueue:(id)a3;
- (id)bundleIDForProcess:(id)a3 error:(id *)a4;
- (void)_sendAction:(id)a3 toProcess:(id)a4 completion:(id)a5;
- (void)dispatchAction:(id)a3 toProcess:(id)a4 completion:(id)a5;
- (void)dispatchAction:(id)a3 withAssertionForProcess:(id)a4 completion:(id)a5;
@end

@implementation SLSWActionDispatcher

- (SLSWActionDispatcher)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLSWActionDispatcher;
  v6 = [(SLSWActionDispatcher *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    v8 = SLDGlobalWorkloop();
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.sociallayerd.SLSWActionDispatcher", 0, v8);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (id)bundleIDForProcess:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F96430] predicateMatchingIdentity:v5];
  id v16 = 0;
  v7 = [MEMORY[0x1E4F963E8] handleForPredicate:v6 error:&v16];
  id v8 = v16;
  if (v7)
  {
    id v9 = [v7 bundle];
    v10 = [v9 identifier];
    goto LABEL_10;
  }
  v11 = SLDaemonLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v5;
    __int16 v21 = 2112;
    v22 = v6;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_error_impl(&dword_19BE17000, v11, OS_LOG_TYPE_ERROR, "Failed to get bundle ID from process identity: %@, predicate: %@, error: %@", buf, 0x20u);
  }

  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
LABEL_7:
      id v9 = v9;
      v10 = 0;
      *a4 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    objc_super v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v13 = [NSString stringWithFormat:@"Failed to get bundle ID from process identity: %@", v5];
    v18 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v9 = [v12 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v14];

    if (a4) {
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (void)dispatchAction:(id)a3 withAssertionForProcess:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke;
  v10[3] = &unk_1E58A8D30;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(SLSWActionDispatcher *)self _sendAction:a3 toProcess:a4 completion:v10];
}

void __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v20 = 0;
    id v8 = +[SLRBSAssertion assertionWithType:pid:error:](SLRBSAssertion, "assertionWithType:pid:error:", 0, [v5 pid], &v20);
    id v9 = v20;
    if (v8 && ([v8 isValid] & 1) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else if (!v9)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      v24[0] = @"We were able to launch the target app, but we failed to acquire the required RB assertion.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v9 = [v10 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v11];
    }
  }
  else
  {
    if (v6)
    {
      id v12 = v6;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28228];
      v22 = @"Unable to launch app for a universal link.";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v12 = [v13 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v14];
    }
    v15 = [*(id *)(a1 + 32) callbackQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke_2;
    v17[3] = &unk_1E58A8AA0;
    id v16 = *(id *)(a1 + 40);
    id v18 = v12;
    id v19 = v16;
    id v9 = v12;
    dispatch_async(v15, v17);

    id v8 = v19;
  }
}

uint64_t __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)dispatchAction:(id)a3 toProcess:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke;
  v10[3] = &unk_1E58A8D58;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(SLSWActionDispatcher *)self _sendAction:a3 toProcess:a4 completion:v10];
}

void __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v8 = 0;
  }
  else if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = @"Unable to launch app for a universal link.";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v8 = [v9 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v10];
  }
  id v11 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke_2;
  block[3] = &unk_1E58A8AA0;
  id v12 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v12;
  id v13 = v8;
  dispatch_async(v11, block);
}

uint64_t __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendAction:(id)a3 toProcess:(id)a4 completion:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v26 = 0;
  id v11 = [(SLSWActionDispatcher *)self bundleIDForProcess:v9 error:&v26];
  id v12 = v26;
  if (v11)
  {
    id v13 = [v8 sourceBSAction];
    if (v13)
    {
      v14 = [MEMORY[0x1E4F1CA60] dictionary];
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F625F8]];
      v31 = v13;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F625E0]];

      id v16 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v14];
      uint64_t v17 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
      id v18 = SLDaemonLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SLSWActionDispatcher _sendAction:toProcess:completion:]";
        __int16 v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_19BE17000, v18, OS_LOG_TYPE_DEFAULT, "[%s] Launching app with bundleIdentifier: %{public}@", buf, 0x16u);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke;
      v23[3] = &unk_1E58A8D58;
      id v24 = v11;
      id v25 = v10;
      [v17 openApplication:v24 withOptions:v16 completion:v23];
    }
    else
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28228];
      uint64_t v21 = [NSString stringWithFormat:@"Unable to retrieve a BSAction for: %@", v8];
      v33[0] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v14 = [v20 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v22];

      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
    }
  }
  else
  {
    id v19 = SLDaemonLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SLSWActionDispatcher _sendAction:toProcess:completion:]((uint64_t)v8, (uint64_t)v9, v19);
    }

    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
  }
}

void __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = SLDaemonLogHandle();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v9;
    _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "Application launch succeeded for bundle identifier: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)_sendAction:(uint64_t)a1 toProcess:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19BE17000, a2, a3, "Could not send action (%@) without a bundle ID for process (%@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19BE17000, a2, a3, "Application launch failed for %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end