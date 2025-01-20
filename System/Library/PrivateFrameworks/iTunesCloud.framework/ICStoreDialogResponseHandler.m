@interface ICStoreDialogResponseHandler
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICStoreDialogResponseHandler)init;
- (ICStoreDialogResponseHandler)initWithCoder:(id)a3;
- (ICStoreDialogResponseHandler)initWithConfiguration:(id)a3;
- (unint64_t)hash;
- (void)_handleAuthenticationStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6;
- (void)_handleBuyButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5;
- (void)_handleDefaultStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6;
- (void)_handleFamilyPermissionButtonAction:(id)a3 usingRequestContext:(id)a4 completion:(id)a5;
- (void)_handleGotoButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)handleButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5;
- (void)handleStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5;
- (void)handleStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6;
@end

@implementation ICStoreDialogResponseHandler

- (ICStoreDialogResponseHandler)init
{
  v3 = objc_alloc_init(ICStoreDialogResponseHandlerConfiguration);
  v4 = [(ICStoreDialogResponseHandler *)self initWithConfiguration:v3];

  return v4;
}

- (ICStoreDialogResponseHandler)initWithConfiguration:(id)a3
{
  v4 = (ICStoreDialogResponseHandlerConfiguration *)a3;
  v7.receiver = self;
  v7.super_class = (Class)ICStoreDialogResponseHandler;
  v5 = [(ICStoreDialogResponseHandler *)&v7 init];
  if (v5)
  {
    if (!v4) {
      v4 = objc_alloc_init(ICStoreDialogResponseHandlerConfiguration);
    }
    v5->_allowsHandlingNonAuthenticationDialogs = [(ICStoreDialogResponseHandlerConfiguration *)v4 allowsHandlingNonAuthenticationDialogs];
    v5->_shouldRecordLastAuthenticationDialogResponseTime = [(ICStoreDialogResponseHandlerConfiguration *)v4 shouldRecordLastAuthenticationDialogResponseTime];
  }

  return v5;
}

- (void)_handleFamilyPermissionButtonAction:(id)a3 usingRequestContext:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 URLString];
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    v12 = +[ICUserIdentityStore defaultIdentityStore];
    v13 = [v8 identity];
    id v29 = 0;
    v14 = [v12 DSIDForUserIdentity:v13 outError:&v29];
    id v15 = v29;

    if (v14)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
      id v28 = v15;
      v17 = objc_msgSend(v16, "ic_storeAccountForStoreAccountID:error:", v14, &v28);
      id v18 = v28;

      if (v17)
      {
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x2050000000;
        v19 = (void *)getAPRequestHandlerClass_softClass;
        uint64_t v33 = getAPRequestHandlerClass_softClass;
        if (!getAPRequestHandlerClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v35 = __getAPRequestHandlerClass_block_invoke;
          v36 = &unk_1E5ACD4F0;
          v37 = &v30;
          __getAPRequestHandlerClass_block_invoke((uint64_t)&buf);
          v19 = (void *)v31[3];
        }
        id v20 = v19;
        _Block_object_dispose(&v30, 8);
        if (v20)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __99__ICStoreDialogResponseHandler__handleFamilyPermissionButtonAction_usingRequestContext_completion___block_invoke;
          v26[3] = &unk_1E5ACAC90;
          id v27 = v9;
          [v20 addRequestWithURL:v11 account:v17 completion:v26];
        }
        else
        {
          v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "Failed to load APRequestHandler class - assuming not available on this platform", (uint8_t *)&buf, 2u);
          }

          v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
          (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v25);
        }
      }
      else
      {
        v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "Failed to resolve account for family permissions dialog. err=%{public}@", (uint8_t *)&buf, 0xCu);
        }

        (*((void (**)(id, void, id))v9 + 2))(v9, 0, v18);
      }

      id v15 = v18;
    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "Failed to resolve identity for family permissions dialog. err=%{public}@", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, void, id))v9 + 2))(v9, 0, v15);
    }
  }
  else
  {
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "missing action URL in family permissions button action - skipping", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

void __99__ICStoreDialogResponseHandler__handleFamilyPermissionButtonAction_usingRequestContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Family permissions request completed with err=%{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    id v10 = v3;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v8 = [v6 errorWithDomain:@"ICError" code:0 userInfo:v7];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
  }
}

- (void)_handleGotoButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 subtarget];
  if (v10
    && (v11 = (void *)v10,
        [v7 subtarget],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"background"],
        v12,
        v11,
        !v13))
  {
    id v20 = [v7 subtarget];
    int v21 = [v20 hasPrefix:@"account"];

    if (!v21)
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v7 subtarget];
        *(_DWORD *)long long buf = 138543362;
        id v28 = v23;
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "unknown Goto button action subtarget %{public}@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
  else
  {
    v14 = [v7 URLString];
    if (v14)
    {
      id v15 = (void *)MEMORY[0x1E4F18D50];
      v16 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
      v17 = [v15 requestWithURL:v16];

      id v18 = [[ICStoreURLRequest alloc] initWithURLRequest:v17 requestContext:v8];
      v19 = +[ICURLSessionManager unlimitedHighPrioritySession];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __98__ICStoreDialogResponseHandler__handleGotoButtonAction_usingRequestContext_withCompletionHandler___block_invoke;
      v25[3] = &unk_1E5AC9D80;
      id v26 = v9;
      [v19 enqueueDataRequest:v18 withCompletionHandler:v25];
    }
    else
    {
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "missing action URL in Goto button action - skipping", buf, 2u);
      }

      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void __98__ICStoreDialogResponseHandler__handleGotoButtonAction_usingRequestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    if ([a2 statusCode] == 200)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleBuyButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 buyParams];
  uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v26 = v9;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Performing Buy button action with params %{public}@", buf, 0xCu);
  }

  v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "ic_queryParametersDictionaryFromString:", v9);
  id v12 = [v11 objectForKey:@"sagaId"];

  if (v12)
  {
    int v13 = [(ICMediaRedownloadRequest *)[ICMatchRedownloadRequest alloc] initWithRequestContext:v7 redownloadParametersString:v9];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E5AC94A8;
    v14 = &v24;
    id v24 = v8;
    id v15 = v8;
    v16 = v23;
  }
  else
  {
    int v13 = [[ICBuyProductRequest alloc] initWithRequestContext:v7 buyParametersString:v9 includeKeybagSyncData:0];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke_20;
    int v21 = &unk_1E5AC94D0;
    v14 = &v22;
    id v22 = v8;
    id v17 = v8;
    v16 = &v18;
  }
  -[ICMediaRedownloadRequest performRequestWithResponseHandler:](v13, "performRequestWithResponseHandler:", v16, v18, v19, v20, v21);
}

void __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "Failed to perform buy button action. err=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__ICStoreDialogResponseHandler__handleBuyButtonAction_usingRequestContext_withCompletionHandler___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Failed to perform buy button action. err=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleAuthenticationStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (self->_shouldRecordLastAuthenticationDialogResponseTime)
  {
    int v13 = +[ICDefaults standardDefaults];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v13, "setLastAuthenticationDialogResponseTime:");
  }
  if (v11
    && ([v11 authenticationProvider],
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    id v15 = [v11 authenticationProvider];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E5ACAB00;
    id v17 = v10;
    id v18 = v11;
    uint64_t v19 = self;
    id v20 = v12;
    [v15 performAuthenticationUsingRequestContext:v18 withCompletionHandler:v16];
  }
  else
  {
    [(ICStoreDialogResponseHandler *)self _handleDefaultStoreDialogResponse:v10 usingRequestContext:v11 withDialogTimeout:v12 withCompletionHandler:a5];
  }
}

void __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  char v3 = a2;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 || !a2)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v11();
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = [*(id *)(a1 + 32) buttons];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        if ([v10 type] == 1) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v12 = [v10 action];

      if (!v12) {
        goto LABEL_17;
      }
      int v13 = *(void **)(a1 + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_2;
      v21[3] = &unk_1E5ACC698;
      id v22 = v13;
      v14 = (void *)[v22 copyWithBlock:v21];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_3;
      v17[3] = &unk_1E5AC9480;
      id v15 = *(void **)(a1 + 48);
      id v16 = *(id *)(a1 + 56);
      char v20 = v3;
      id v18 = 0;
      id v19 = v16;
      [v15 handleButtonAction:v12 usingRequestContext:v14 withCompletionHandler:v17];
    }
    else
    {
LABEL_11:

LABEL_17:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setStoreDialogResponseHandler:0];
  id v4 = [ICURLResponseAuthenticationProvider alloc];
  id v6 = [*(id *)(a1 + 32) authenticationProvider];
  id v5 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:](v4, "initWithUserInteractionLevel:", [v6 interactionLevel]);
  [v3 setAuthenticationProvider:v5];
}

uint64_t __133__ICStoreDialogResponseHandler__handleAuthenticationStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_handleDefaultStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [[ICUserNotificationBuilder alloc] initWithStoreDialog:v10];
  [(ICUserNotificationBuilder *)v13 setTimeoutInterval:a5];
  uint64_t v14 = [(ICUserNotificationBuilder *)v13 createCFUserNotification];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = +[ICUserNotificationManager sharedManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __126__ICStoreDialogResponseHandler__handleDefaultStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E5AC9458;
    uint64_t v23 = v15;
    v19[4] = self;
    id v22 = v12;
    id v20 = v10;
    id v21 = v11;
    [v16 displayUserNotification:v15 withCompletionHandler:v19];
  }
  else
  {
    id v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      long long v25 = self;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create user notification", buf, 0xCu);
    }

    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v18);
  }
}

void __126__ICStoreDialogResponseHandler__handleDefaultStoreDialogResponse_usingRequestContext_withDialogTimeout_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (!v5)
  {
    uint64_t v8 = ICUserNotificationGetResponseButton(*(void **)(a1 + 40), (char)a2);
    uint64_t v9 = v8;
    if (v8)
    {
      if ([v8 type] != 2)
      {
        id v18 = *(void **)(a1 + 32);
        id v19 = [v9 action];
        [v18 handleButtonAction:v19 usingRequestContext:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];

        goto LABEL_15;
      }
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v20 = 138543362;
        uint64_t v21 = v11;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ User cancelled the dialog", (uint8_t *)&v20, 0xCu);
      }

      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = -7004;
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v20 = 138543618;
        uint64_t v21 = v16;
        __int16 v22 = 2048;
        id v23 = a2;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find user notification button for responseFlags %lu", (uint8_t *)&v20, 0x16u);
      }

      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = 0;
    }
    id v17 = [v13 errorWithDomain:@"ICError" code:v14 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v17);

LABEL_15:
    goto LABEL_16;
  }
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v20 = 138543618;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to display user notification. err=%{public}@", (uint8_t *)&v20, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_16:
}

- (void)encodeWithCoder:(id)a3
{
  BOOL allowsHandlingNonAuthenticationDialogs = self->_allowsHandlingNonAuthenticationDialogs;
  id v5 = a3;
  [v5 encodeBool:allowsHandlingNonAuthenticationDialogs forKey:@"allowsHandlingNonAuthenticationDialogs"];
  [v5 encodeBool:self->_shouldRecordLastAuthenticationDialogResponseTime forKey:@"shouldRecordLastAuthenticationDialogResponseTime"];
}

- (ICStoreDialogResponseHandler)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ICStoreDialogResponseHandlerConfiguration);
  -[ICStoreDialogResponseHandlerConfiguration setAllowsHandlingNonAuthenticationDialogs:](v5, "setAllowsHandlingNonAuthenticationDialogs:", [v4 decodeBoolForKey:@"allowsHandlingNonAuthenticationDialogs"]);
  uint64_t v6 = [v4 decodeBoolForKey:@"shouldRecordLastAuthenticationDialogResponseTime"];

  [(ICStoreDialogResponseHandlerConfiguration *)v5 setShouldRecordLastAuthenticationDialogResponseTime:v6];
  uint64_t v7 = [(ICStoreDialogResponseHandler *)self initWithConfiguration:v5];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICStoreDialogResponseHandler *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if (![(ICStoreDialogResponseHandler *)v4 isMemberOfClass:objc_opt_class()] {
         || !self->_allowsHandlingNonAuthenticationDialogs == v4->_allowsHandlingNonAuthenticationDialogs)
  }
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = !self->_shouldRecordLastAuthenticationDialogResponseTime ^ v4->_shouldRecordLastAuthenticationDialogResponseTime;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v17 = v14 + v13;
  uint64_t v58 = __ROR8__(v17, 32);
  uint64_t v59 = v16 ^ __ROR8__(v15, 43);
  uint64_t v54 = v16 ^ v11;
  uint64_t v56 = v17 ^ __ROR8__(v13, 47);

  uint64_t v60 = self->_allowsHandlingNonAuthenticationDialogs | 0xC00000000000000;
  unint64_t v18 = v60 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)self->_shouldRecordLastAuthenticationDialogResponseTime << 32);
  uint64_t v19 = (v54 + v56) ^ __ROR8__(v56, 51);
  uint64_t v20 = v58 + (v18 ^ v59);
  uint64_t v21 = __ROR8__(v18 ^ v59, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v54 + v56, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  unint64_t v55 = v22 ^ v18;
  uint64_t v57 = v24 ^ __ROR8__(v19, 47);
  unint64_t v25 = ((v22 ^ v18) + v57) ^ __ROR8__(v57, 51);
  unint64_t v26 = __ROR8__(v24, 32) + (v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000));
  uint64_t v27 = __ROR8__(v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000), 48);
  unint64_t v28 = (v26 ^ v27) + __ROR8__(v55 + v57, 32);
  unint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  unint64_t v30 = v26 + v25;
  unint64_t v31 = v30 ^ __ROR8__(v25, 47);
  unint64_t v32 = (v28 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000)) + v31;
  uint64_t v33 = v32 ^ __ROR8__(v31, 51);
  unint64_t v34 = (__ROR8__(v30, 32) ^ 0xFFLL) + v29;
  uint64_t v35 = __ROR8__(v29, 48);
  uint64_t v36 = __ROR8__(v32, 32) + (v34 ^ v35);
  uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  unint64_t v38 = v33 + v34;
  uint64_t v39 = v38 ^ __ROR8__(v33, 47);
  uint64_t v40 = v39 + v36;
  uint64_t v41 = v40 ^ __ROR8__(v39, 51);
  uint64_t v42 = __ROR8__(v38, 32) + v37;
  uint64_t v43 = __ROR8__(v37, 48);
  uint64_t v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  uint64_t v46 = v41 + v42;
  uint64_t v47 = v46 ^ __ROR8__(v41, 47);
  uint64_t v48 = v47 + v44;
  uint64_t v49 = v48 ^ __ROR8__(v47, 51);
  uint64_t v50 = __ROR8__(v46, 32) + v45;
  uint64_t v51 = __ROR8__(v45, 48);
  uint64_t v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  return (v49 + v50) ^ __ROR8__(v49, 47) ^ v52 ^ __ROR8__(v49 + v50, 32) ^ v52 ^ __ROR8__(v50 ^ v51, 43);
}

- (void)handleStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withDialogTimeout:(double)a5 withCompletionHandler:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 type];
  int v14 = v13;
  if (self->_allowsHandlingNonAuthenticationDialogs || v13 == 1)
  {
    if (v13 == 1)
    {
      [(ICStoreDialogResponseHandler *)self _handleAuthenticationStoreDialogResponse:v10 usingRequestContext:v11 withDialogTimeout:v12 withCompletionHandler:a5];
    }
    else if (!v13)
    {
      [(ICStoreDialogResponseHandler *)self _handleDefaultStoreDialogResponse:v10 usingRequestContext:v11 withDialogTimeout:v12 withCompletionHandler:a5];
    }
  }
  else
  {
    uint64_t v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      uint64_t v19 = self;
      __int16 v20 = 1024;
      int v21 = v14;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Not handling dialog response because its not allowed for dialog type %d", (uint8_t *)&v18, 0x12u);
    }

    if (v12) {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
}

- (void)handleStoreDialogResponse:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)handleButtonAction:(id)a3 usingRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    switch([v8 type])
    {
      case 0:
        goto LABEL_6;
      case 1:
        [(ICStoreDialogResponseHandler *)self _handleBuyButtonAction:v8 usingRequestContext:v9 withCompletionHandler:v10];
        break;
      case 2:
      case 3:
      case 4:
        [(ICStoreDialogResponseHandler *)self _handleGotoButtonAction:v8 usingRequestContext:v9 withCompletionHandler:v10];
        break;
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
        id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          int v12 = 134217984;
          uint64_t v13 = [v8 type];
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_FAULT, "unexpected dialog button action type %ld", (uint8_t *)&v12, 0xCu);
        }

        goto LABEL_6;
      case 11:
        [(ICStoreDialogResponseHandler *)self _handleFamilyPermissionButtonAction:v8 usingRequestContext:v9 completion:v10];
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_6:
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end