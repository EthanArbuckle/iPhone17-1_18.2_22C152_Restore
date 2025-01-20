@interface ICMusicRestoreRequest
- (ICMusicRestoreRequest)initWithRequestContext:(id)a3 parameters:(id)a4;
- (id)_serializedBodyDataWithAccountID:(id)a3;
- (void)cancel;
- (void)execute;
- (void)performRestoreRequestWithCompletionHandler:(id)a3;
@end

@implementation ICMusicRestoreRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (id)_serializedBodyDataWithAccountID:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = +[ICDeviceInfo currentDeviceInfo];
  v7 = [v6 deviceName];

  if (v7) {
    [v5 setObject:v7 forKey:@"device-name"];
  }
  v8 = +[ICDeviceInfo currentDeviceInfo];
  v9 = [v8 deviceGUID];

  if (v9) {
    [v5 setObject:v9 forKey:@"guid"];
  }
  v10 = +[ICDeviceInfo currentDeviceInfo];
  v11 = [v10 serialNumber];

  if (v11) {
    [v5 setObject:v11 forKey:@"serial-number"];
  }
  unsigned int v46 = 0;
  id v45 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v46, &v45);
  id v13 = v45;
  if (ContextIdentifierForFolderPath)
  {
    id v44 = 0;
    id v43 = v13;
    BOOL v14 = ICFairPlayCopyKeyBagSyncDataWithContextID(v46, [v4 unsignedLongLongValue], 1, &v44, &v43);
    id v15 = v44;
    id v16 = v43;

    v41 = v15;
    if (v14)
    {
      [v5 setObject:v15 forKey:@"kbsync"];
    }
    else
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v49 = self;
        __int16 v50 = 2114;
        id v51 = 0;
        __int16 v52 = 2114;
        id v53 = v16;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Copying keybag sync data for path %{public}@ failed with error: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v49 = self;
      __int16 v50 = 2114;
      id v51 = v13;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Getting context ID failed with error: %{public}@", buf, 0x16u);
    }

    v41 = 0;
    id v16 = v13;
  }
  v40 = v16;
  requestParameters = self->_requestParameters;
  if (requestParameters)
  {
    v37 = v9;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = [(ICMusicRestoreRequestParameters *)requestParameters adamID];
    v22 = [(ICMusicRestoreRequestParameters *)self->_requestParameters flavor];
    v23 = [(ICMusicRestoreRequestParameters *)self->_requestParameters storeFrontID];
    [(ICMusicRestoreRequestParameters *)self->_requestParameters mediaKind];
    v24 = v36 = v11;
    [(ICMusicRestoreRequestParameters *)self->_requestParameters accountID];
    v38 = v5;
    v39 = v7;
    v26 = id v25 = v4;
    [(ICMusicRestoreRequestParameters *)self->_requestParameters title];
    v28 = v27 = self;
    v29 = [(ICMusicRestoreRequestParameters *)v27->_requestParameters matchStatus];
    v30 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, @"item-id", v22, @"flavor", v23, @"store-front-id", v24, @"kind", v26, @"account-id", v28, @"title", v29, @"match-status", 0);

    self = v27;
    id v4 = v25;
    v5 = v38;
    v7 = v39;

    v11 = v36;
    v47 = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v38 setValue:v31 forKey:@"items"];

    v9 = v37;
  }
  id v42 = 0;
  v32 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v42];
  id v33 = v42;

  if (!v32)
  {
    v34 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v49 = self;
      __int16 v50 = 2114;
      id v51 = v33;
      _os_log_impl(&dword_1A2D01000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Serializing request body failed with error: %{public}@", buf, 0x16u);
    }
  }

  return v32;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)ICMusicRestoreRequest;
  [(ICMusicRestoreRequest *)&v4 cancel];
  v3 = +[ICURLSessionManager defaultSession];
  [v3 cancelRequest:self->_storeURLRequest];
}

- (void)execute
{
  v3 = +[ICDeviceInfo currentDeviceInfo];
  if ([v3 isIPhone]) {
    goto LABEL_4;
  }
  objc_super v4 = +[ICDeviceInfo currentDeviceInfo];
  if ([v4 isIPad])
  {

LABEL_4:
LABEL_5:
    v5 = +[ICURLBagProvider sharedBagProvider];
    requestContext = self->_requestContext;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__ICMusicRestoreRequest_execute__block_invoke;
    v10[3] = &unk_1E5ACD950;
    v10[4] = self;
    [v5 getBagForRequestContext:requestContext withCompletionHandler:v10];

    return;
  }
  v7 = +[ICDeviceInfo currentDeviceInfo];
  char v8 = [v7 isIPod];

  if (v8) {
    goto LABEL_5;
  }
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
  [(ICRequestOperation *)self finishWithError:v9];
}

void __32__ICMusicRestoreRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 finishWithError:v6];
  }
  else if ([v7 isCancelled])
  {
    char v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
    [v8 finishWithError:v9];
  }
  else
  {
    v10 = [v5 dictionaryForBagKey:@"p2-content-restore"];
    if (v10 && (_NSIsNSDictionary() & 1) != 0)
    {
      v11 = [[ICMusicRestoreBagConfiguration alloc] initWithServerConfiguration:v10];
      v12 = [(ICMusicRestoreBagConfiguration *)v11 allowedKinds];
      if ([v12 containsObject:@"song"])
      {
        id v13 = [(ICMusicRestoreBagConfiguration *)v11 allowedMatchStatus];
        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 328) matchStatus];
        id v15 = (void *)v14;
        if (v13 && v14 && ([v13 containsObject:v14] & 1) == 0)
        {
          v26 = _ICLogCategoryDefault();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v13;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = [v15 longLongValue];
            _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_ERROR, "StoreMatchStatus is not in acceptable list - allowedMatchStatus=%{public}@, itemMatchStatus=%lld", buf, 0x16u);
          }

          v27 = *(void **)(a1 + 32);
          v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
          [v27 finishWithError:v28];
        }
        else
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v37 = __Block_byref_object_copy__10822;
          v38 = __Block_byref_object_dispose__10823;
          id v39 = [(ICMusicRestoreBagConfiguration *)v11 restoreURL];
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            id v16 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
            v17 = [*(id *)(*(void *)(a1 + 32) + 304) identityStore];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __32__ICMusicRestoreRequest_execute__block_invoke_44;
            v29[3] = &unk_1E5AC83F8;
            id v18 = v16;
            uint64_t v19 = *(void *)(a1 + 32);
            id v30 = v18;
            uint64_t v31 = v19;
            v34 = buf;
            v32 = v11;
            id v33 = v5;
            [v17 getPropertiesForUserIdentity:v18 completionHandler:v29];
          }
          else
          {
            v24 = _ICLogCategoryDefault();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v35 = 0;
              _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "Error reading restore URL from bag", v35, 2u);
            }

            id v25 = *(void **)(a1 + 32);
            id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
            [v25 finishWithError:v18];
          }

          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = @"song";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "Asset type %{public}@ is not present in allowed restore kinds (%{public}@)", buf, 0x16u);
        }

        v23 = *(void **)(a1 + 32);
        id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
        [v23 finishWithError:v13];
      }
    }
    else
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "Error reading restore configuration from bag", buf, 2u);
      }

      v21 = *(void **)(a1 + 32);
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v21 finishWithError:v11];
    }
  }
}

void __32__ICMusicRestoreRequest_execute__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v43 = v23;
      __int16 v44 = 2114;
      id v45 = v7;
      _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "Could not get properties for %{public}@, error=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v7];
  }
  else
  {
    char v8 = [v5 DSID];
    id v9 = [v5 username];
    if (v9 && v8)
    {
      v10 = [MEMORY[0x1E4F1C9C8] date];
      v11 = [MEMORY[0x1E4F18D50] requestWithURL:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      v12 = [MEMORY[0x1E4F1CA60] dictionary];
      v38 = +[ICDeviceInfo currentDeviceInfo];
      uint64_t v13 = [v38 serialNumber];
      if (v13)
      {
        [v12 setObject:v13 forKey:@"serial-number"];
        uint64_t v14 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "ic_URLByAppendingQueryParameters:", v12);
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
      v37 = (void *)v13;
      int v17 = [*(id *)(a1 + 48) shouldGZip];
      id v18 = [*(id *)(a1 + 40) _serializedBodyDataWithAccountID:v8];
      uint64_t v19 = v18;
      v36 = v12;
      if (v17 && [v18 length])
      {
        v20 = MSVGzipCompressData();
        if ([v20 length])
        {
          id v35 = v20;

          v21 = @"gzip";
          uint64_t v19 = v35;
        }
        else
        {
          v21 = 0;
        }

        v12 = v36;
      }
      else
      {
        v21 = 0;
      }
      if ([v19 length])
      {
        [v11 setCachePolicy:1];
        [v11 setHTTPBody:v19];
        [v11 setHTTPMethod:@"POST"];
        if (v21) {
          [v11 setValue:v21 forHTTPHeaderField:@"Content-Encoding"];
        }
        [v11 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
        [v11 setValue:@"com.apple.atc" forHTTPHeaderField:@"X-Apple-Issuing-Process"];
        v26 = [[ICStoreURLRequest alloc] initWithURLRequest:v11 requestContext:*(void *)(*(void *)(a1 + 40) + 304)];
        uint64_t v27 = *(void *)(a1 + 40);
        v28 = *(void **)(v27 + 312);
        *(void *)(v27 + 312) = v26;

        v29 = +[ICURLSessionManager defaultSession];
        uint64_t v30 = *(void *)(a1 + 40);
        uint64_t v31 = *(void *)(v30 + 312);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __32__ICMusicRestoreRequest_execute__block_invoke_62;
        v39[3] = &unk_1E5AC8C90;
        v39[4] = v30;
        id v40 = v10;
        id v41 = *(id *)(a1 + 56);
        [v29 enqueueDataRequest:v31 withCompletionHandler:v39];

        v12 = v36;
      }
      else
      {
        v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_ERROR, "Error serializing request body data", buf, 2u);
        }

        id v33 = *(void **)(a1 + 40);
        v34 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7005 userInfo:0];
        [v33 finishWithError:v34];
      }
    }
    else
    {
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v43 = v9;
        __int16 v44 = 2114;
        id v45 = v8;
        _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "Invalid userName (%{public}@), DSID (%{public}@)", buf, 0x16u);
      }

      id v25 = *(void **)(a1 + 40);
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      [v25 finishWithError:v10];
    }
  }
}

void __32__ICMusicRestoreRequest_execute__block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v9 = [a2 parsedBodyDictionary];
  id v6 = [[ICMediaRedownloadResponse alloc] initWithResponseDictionary:v9 requestDate:*(void *)(a1 + 40) urlBag:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 320);
  *(void *)(v7 + 320) = v6;

  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)performRestoreRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__ICMusicRestoreRequest_performRestoreRequestWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

void __68__ICMusicRestoreRequest_performRestoreRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  *(void *)(v2 + 312) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 320);
  *(void *)(v4 + 320) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 304);
  *(void *)(v8 + 304) = 0;
}

- (ICMusicRestoreRequest)initWithRequestContext:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicRestoreRequest;
  id v9 = [(ICRequestOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestContext, a3);
    objc_storeStrong((id *)&v10->_requestParameters, a4);
  }

  return v10;
}

@end