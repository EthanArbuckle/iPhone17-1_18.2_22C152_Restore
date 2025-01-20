@interface ICUpdateAutomaticDownloadMediaKindsRequest
+ (NSSet)automaticDownloadMediaKindsForMusic;
- (ICUpdateAutomaticDownloadMediaKindsRequest)initWithRequestContext:(id)a3 mediaKindsToAdd:(id)a4 mediaKindsToRemove:(id)a5;
- (void)execute;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
@end

@implementation ICUpdateAutomaticDownloadMediaKindsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaKindsToRemove, 0);
  objc_storeStrong((id *)&self->_mediaKindsToAdd, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ handling dialog request %{public}@", buf, 0x16u);
  }

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F4DE30]) initWithRequest:v6];
  v10 = [v9 present];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__ICUpdateAutomaticDownloadMediaKindsRequest_handleDialogRequest_completion___block_invoke;
  v12[3] = &unk_1E5ACC2A0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 addFinishBlock:v12];
}

void __77__ICUpdateAutomaticDownloadMediaKindsRequest_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = objc_msgSend(v5, "msv_description");
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ dialog task complete error=%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ dialog task complete", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ handling authentication request %{public}@", buf, 0x16u);
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4DBC8]) initWithRequest:v6];
  v10 = [v9 performAuthentication];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ICUpdateAutomaticDownloadMediaKindsRequest_handleAuthenticateRequest_completion___block_invoke;
  v12[3] = &unk_1E5ACC278;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 addFinishBlock:v12];
}

void __83__ICUpdateAutomaticDownloadMediaKindsRequest_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = objc_msgSend(v5, "msv_description");
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Authentication task complete error=%{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Authentication task complete", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)execute
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mediaKindsToAdd = self->_mediaKindsToAdd;
    mediaKindsToRemove = self->_mediaKindsToRemove;
    *(_DWORD *)buf = 138543874;
    v62 = self;
    __int16 v63 = 2114;
    v64 = mediaKindsToAdd;
    __int16 v65 = 2114;
    v66 = mediaKindsToRemove;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ performing request with media kinds to add: %{public}@, kinds to remove: %{public}@", buf, 0x20u);
  }

  id v6 = [(ICStoreRequestContext *)self->_requestContext identity];
  id v7 = [(ICStoreRequestContext *)self->_requestContext identityStore];
  id v58 = 0;
  v8 = [v7 DSIDForUserIdentity:v6 outError:&v58];
  uint64_t v9 = (NSSet *)v58;
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = [(ICStoreRequestContext *)self->_requestContext identity];
      *(_DWORD *)buf = 138543874;
      v62 = self;
      __int16 v63 = 2114;
      v64 = v12;
      __int16 v65 = 2114;
      v66 = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to lookup account ID for user identity %{public}@. err=%{public}@", buf, 0x20u);
    }
    [(ICRequestOperation *)self finishWithError:v10];
    goto LABEL_45;
  }
  if (v8)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
    id v57 = 0;
    __int16 v14 = objc_msgSend(v13, "ic_storeAccountForStoreAccountID:error:", v8, &v57);
    v10 = (NSSet *)v57;

    if (!v14)
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [(ICStoreRequestContext *)self->_requestContext identity];
        *(_DWORD *)buf = 138543874;
        v62 = self;
        __int16 v63 = 2114;
        v64 = v20;
        __int16 v65 = 2114;
        v66 = v10;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to lookup account for user identity %{public}@. err=%{public}@", buf, 0x20u);
      }
      [(ICRequestOperation *)self finishWithError:v10];
      goto LABEL_44;
    }
    v46 = v10;
    v15 = objc_msgSend(v14, "ams_automaticDownloadKinds");
    uint64_t v16 = v15;
    v47 = v14;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C978] array];
    }
    v21 = v17;

    v22 = (void *)[(NSSet *)v21 mutableCopy];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v23 = self->_mediaKindsToRemove;
    uint64_t v24 = [(NSSet *)v23 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v54 != v26) {
            objc_enumerationMutation(v23);
          }
          [v22 removeObject:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        }
        uint64_t v25 = [(NSSet *)v23 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v25);
    }
    v45 = v21;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v28 = self->_mediaKindsToAdd;
    uint64_t v29 = [(NSSet *)v28 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          if ((objc_msgSend(v22, "containsObject:", v33, v45) & 1) == 0) {
            [v22 addObject:v33];
          }
        }
        uint64_t v30 = [(NSSet *)v28 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v30);
    }

    v34 = v22;
    v35 = v45;
    if (v45 == v34)
    {

      v10 = v46;
      __int16 v14 = v47;
    }
    else
    {
      char v36 = [(NSSet *)v45 isEqual:v34];

      v10 = v46;
      __int16 v14 = v47;
      if ((v36 & 1) == 0)
      {
        v37 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v62 = self;
          __int16 v63 = 2114;
          v64 = v45;
          __int16 v65 = 2114;
          v66 = v34;
          _os_log_impl(&dword_1A2D01000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating media kinds from %{public}@ --> %{public}@", buf, 0x20u);
        }

        v38 = (void *)MEMORY[0x1E4F4DBD8];
        v39 = [MEMORY[0x1E4F4DBD0] bagSubProfile];
        v40 = [MEMORY[0x1E4F4DBD0] bagSubProfileVersion];
        v41 = [v38 bagForProfile:v39 profileVersion:v40];

        v35 = v45;
        __int16 v14 = v47;
        v42 = (void *)[objc_alloc(MEMORY[0x1E4F4DBD0]) initWithEnabledMediaKinds:v34 account:v47 bag:v41 presentationDelegate:self];
        v43 = [v42 perform];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __53__ICUpdateAutomaticDownloadMediaKindsRequest_execute__block_invoke;
        v48[3] = &unk_1E5ACC250;
        v48[4] = self;
        [v43 resultWithCompletion:v48];

        v10 = v46;
LABEL_43:

LABEL_44:
LABEL_45:

        goto LABEL_46;
      }
    }
    v44 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl(&dword_1A2D01000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ No change in media types - finishing", buf, 0xCu);
    }

    [(ICRequestOperation *)self finishWithError:0];
    goto LABEL_43;
  }
  uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v62 = self;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ No active account so nothing to do", buf, 0xCu);
  }

  [(ICRequestOperation *)self finishWithError:0];
LABEL_46:
}

void __53__ICUpdateAutomaticDownloadMediaKindsRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = objc_msgSend(v6, "msv_description");
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ AMSAutomaticDownloadKindsSetTask completed with result %{public}@ error=%{public}@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", 0, v6, @"AMSAutomaticDownloadKindsSetTask failed");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ AMSAutomaticDownloadKindsSetTask completed with result %{public}@", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v11 = 0;
  }
  [*(id *)(a1 + 32) finishWithError:v11];
}

- (ICUpdateAutomaticDownloadMediaKindsRequest)initWithRequestContext:(id)a3 mediaKindsToAdd:(id)a4 mediaKindsToRemove:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICUpdateAutomaticDownloadMediaKindsRequest;
  uint64_t v11 = [(ICRequestOperation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    requestContext = v11->_requestContext;
    v11->_requestContext = (ICStoreRequestContext *)v12;

    uint64_t v14 = [v9 copy];
    mediaKindsToAdd = v11->_mediaKindsToAdd;
    v11->_mediaKindsToAdd = (NSSet *)v14;

    uint64_t v16 = [v10 copy];
    mediaKindsToRemove = v11->_mediaKindsToRemove;
    v11->_mediaKindsToRemove = (NSSet *)v16;
  }
  return v11;
}

+ (NSSet)automaticDownloadMediaKindsForMusic
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"music-video", @"song", 0);
}

@end