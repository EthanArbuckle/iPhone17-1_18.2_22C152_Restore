@interface ICACAccountVerificationOperation
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation ICACAccountVerificationOperation

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling dialog request %{public}@", buf, 0x16u);
  }

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4DE30]) initWithRequest:v7];
  v11 = [v10 present];
  id v15 = 0;
  v12 = [v11 resultWithError:&v15];
  id v13 = v15;

  if (!v12)
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v13;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to present dialog. err=%{public}@", buf, 0x16u);
    }
  }
  v8[2](v8, v12, v13);
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(ICUserVerificationOperation *)self verificationRequest];
  v6 = [v5 verificationContext];
  id v7 = v6;
  if (!v4)
  {
    v8 = [v6 identityStore];
    [v8 _reloadForExternalChange];
  }
  uint64_t v9 = [(ICUserVerificationOperation *)self responseHandler];
  v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, BOOL, id))(v9 + 16))(v9, v4 == 0, v4);
  }
  v11.receiver = self;
  v11.super_class = (Class)ICACAccountVerificationOperation;
  [(ICAsyncOperation *)&v11 finishWithError:v4];
}

- (void)execute
{
  v2 = self;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [(ICUserVerificationOperation *)self verificationRequest];
  id v4 = [v3 verificationContext];
  double v5 = [v4 ACAccount];
  v6 = [v4 ACAccountStore];
  unint64_t v7 = [v4 interactionLevel];
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 5) {
      uint64_t v9 = @"unknown";
    }
    else {
      uint64_t v9 = off_1E5AC7F48[v7];
    }
    v10 = v9;
    *(_DWORD *)buf = 138543874;
    v62 = v2;
    __int16 v63 = 2114;
    v64 = v10;
    __int16 v65 = 2114;
    double v66 = v5;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing %{public}@ authentication for account %{public}@", buf, 0x20u);
  }
  if (v5 != 0.0 && v6)
  {
    if (v7 == 1)
    {
      uint64_t v16 = 1;
    }
    else
    {
      if (v7 == 4)
      {
        objc_super v11 = [*(id *)&v5 username];
        if ([v11 length])
        {
          v12 = objc_msgSend(*(id *)&v5, "ic_DSID");
          uint64_t v13 = [v12 longLongValue];

          if (v13)
          {
            [(ICACAccountVerificationOperation *)v2 finishWithError:0];
            goto LABEL_59;
          }
        }
        else
        {
        }
      }
      v17 = +[ICDefaults standardDefaults];
      int v18 = [v17 shouldForceSilentAuthentications];

      if (v18)
      {
        id v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v2;
          _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Overriding interaction level to be silent-only based on debug settings", buf, 0xCu);
        }

        unint64_t v7 = 1;
        uint64_t v16 = 1;
      }
      else if (v7 - 3 >= 2)
      {
        if (v7 == 5)
        {
          uint64_t v20 = +[ICDefaults standardDefaults];
          v21 = [v20 lastAllowedInteractiveAuthenticationTime];

          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v23 = v22;
          [v21 timeIntervalSinceReferenceDate];
          uint64_t v16 = v23 - v24 <= 86400.0;

          unint64_t v7 = 5;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 2;
      }
    }
    v25 = +[ICDeviceInfo currentDeviceInfo];
    v56 = v6;
    v57 = v3;
    if (![v25 isAudioAccessory] || v16)
    {
      if (v16 != 1) {
        goto LABEL_32;
      }
    }
    else
    {
      if ([*(id *)&v5 isActive])
      {
        uint64_t v16 = 0;
LABEL_32:
        id v26 = +[ICDefaults standardDefaults];
        v27 = [MEMORY[0x1E4F1C9C8] date];
        [v26 setLastAllowedInteractiveAuthenticationTime:v27];
        goto LABEL_46;
      }
      v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v2;
        _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Overriding interaction level to be silent-only for secondary account", buf, 0xCu);
      }
    }
    if (execute_sOnceToken != -1) {
      dispatch_once(&execute_sOnceToken, &__block_literal_global_18671);
    }
    uint64_t v29 = objc_msgSend(*(id *)&v5, "ic_DSID");
    v30 = (void *)v29;
    v31 = &unk_1EF640960;
    if (v29) {
      v31 = (void *)v29;
    }
    id v26 = v31;

    v27 = [(id)execute_sLastSilentReauthenticationAttemptPerDSID objectForKey:v26];
    v32 = [MEMORY[0x1E4F1C9C8] now];
    v33 = v32;
    if (v27)
    {
      [(ICStoreRequestContext *)v32 timeIntervalSinceDate:v27];
      if (v34 < 60.0)
      {
        v35 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          [(ICStoreRequestContext *)v33 timeIntervalSinceReferenceDate];
          double v37 = v36;
          [(__CFString *)v27 timeIntervalSinceReferenceDate];
          *(_DWORD *)buf = 138543874;
          v62 = v2;
          __int16 v63 = 2114;
          v64 = v27;
          __int16 v65 = 2048;
          double v66 = v37 - v38;
          _os_log_impl(&dword_1A2D01000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Skipping silent authentication attempt due to throttling. last attempt was at %{public}@ (%.2fs ago)", buf, 0x20u);
        }

        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = *MEMORY[0x1E4F28228];
        v60 = @"Not allowing silent authentication because one was recently attempted already";
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        v41 = [v39 errorWithDomain:@"ICError" code:-7402 userInfo:v40];
        [(ICACAccountVerificationOperation *)v2 finishWithError:v41];
        goto LABEL_58;
      }
    }
    [(id)execute_sLastSilentReauthenticationAttemptPerDSID setObject:v33 forKey:v26];

    uint64_t v16 = 1;
    v3 = v57;
LABEL_46:

    id v26 = objc_alloc_init(MEMORY[0x1E4F4DBB0]);
    [v26 setAllowServerDialogs:v7 != 1];
    [v26 setAuthenticationType:v16];
    [v26 setEnableAccountCreation:v7 == 4];
    [v26 setCanMakeAccountActive:v7 == 4];
    [v26 setIgnoreAccountConversion:v7 == 1];
    v27 = [v4 debugReason];
    if (![(__CFString *)v27 length])
    {

      v27 = @"This action requires authentication to proceed";
    }
    [v26 setDebugReason:v27];
    v33 = [v3 storeRequestContext];
    if (!v33)
    {
      v42 = objc_msgSend(*(id *)&v5, "ic_DSID");
      if ([v42 longLongValue])
      {
        v43 = objc_msgSend(*(id *)&v5, "ic_DSID");
        v44 = +[ICUserIdentity specificAccountWithDSID:v43];
      }
      else
      {
        v44 = +[ICUserIdentity activeAccount];
      }

      v33 = [[ICStoreRequestContext alloc] initWithIdentity:v44];
    }
    v40 = [[ICAMSBagAdapter alloc] initWithRequestContext:v33];
    v45 = (void *)[objc_alloc(MEMORY[0x1E4F4DBC8]) initWithAccount:*(void *)&v5 options:v26 bag:v40];
    v41 = v45;
    if (v7 != 1) {
      [v45 setDelegate:v2];
    }
    v46 = [v41 performAuthentication];
    if (([*(id *)&v5 isActive] & 1) == 0)
    {
      [v46 promiseWithTimeout:3.0];
      id v55 = v26;
      v47 = v40;
      v48 = v33;
      v49 = v27;
      v50 = v4;
      double v51 = v5;
      v52 = v2;
      uint64_t v54 = v53 = v25;

      v46 = (void *)v54;
      v25 = v53;
      v2 = v52;
      double v5 = v51;
      id v4 = v50;
      v27 = v49;
      v33 = v48;
      v40 = v47;
      id v26 = v55;
    }
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __43__ICACAccountVerificationOperation_execute__block_invoke_16;
    v58[3] = &unk_1E5AC9550;
    v58[4] = v2;
    [v46 addFinishBlock:v58];

LABEL_58:
    v6 = v56;
    v3 = v57;
    goto LABEL_59;
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v2;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ No account provided - skipping verification", buf, 0xCu);
  }

  id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
  [(ICACAccountVerificationOperation *)v2 finishWithError:v15];

LABEL_59:
}

void __43__ICACAccountVerificationOperation_execute__block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = objc_msgSend(v4, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Authentication task complete error=%{public}@", buf, 0x16u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    id v13 = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v10 = [v9 errorWithDomain:@"ICError" code:-7403 userInfo:v6];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Authentication task complete", buf, 0xCu);
    }
    v10 = 0;
  }

  [*(id *)(a1 + 32) finishWithError:v10];
}

uint64_t __43__ICACAccountVerificationOperation_execute__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  uint64_t v1 = execute_sLastSilentReauthenticationAttemptPerDSID;
  execute_sLastSilentReauthenticationAttemptPerDSID = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end