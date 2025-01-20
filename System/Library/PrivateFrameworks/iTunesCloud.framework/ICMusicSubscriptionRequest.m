@interface ICMusicSubscriptionRequest
- (ICMusicSubscriptionRequest)initWithStoreRequestContext:(id)a3 requestType:(int64_t)a4 requestingOfflineSlot:(BOOL)a5;
- (id)_bagKeyForRequestType:(int64_t)a3;
- (void)execute;
@end

@implementation ICMusicSubscriptionRequest

- (void).cxx_destruct
{
}

- (id)_bagKeyForRequestType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    self = *off_1E5AC6CD8[a3];
  }
  return self;
}

- (void)execute
{
  uint64_t v3 = +[ICURLBagProvider sharedBagProvider];
  storeRequestContext = self->_storeRequestContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke;
  v5[3] = &unk_1E5ACD950;
  v5[4] = self;
  [v3 getBagForRequestContext:storeRequestContext withCompletionHandler:v5];
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 finishWithError:v6];
  }
  else
  {
    v8 = [v7 _bagKeyForRequestType:v7[39]];
    v9 = [v5 urlForBagKey:v8];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F18D50] requestWithURL:v9];
      [v10 setHTTPMethod:@"POST"];
      [v10 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      [v10 setValue:@"true" forHTTPHeaderField:@"x-apple-use-amd"];
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = __Block_byref_object_copy_;
      v30 = __Block_byref_object_dispose_;
      id v31 = [MEMORY[0x1E4F1CA60] dictionary];
      v11 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
      v12 = [v11 deviceGUID];

      if (v12) {
        [(id)v27[5] setObject:v12 forKey:@"guid"];
      }
      v13 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
      int v14 = [v13 isWatch];

      if (v14)
      {
        v15 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
        v16 = [v15 pairedDeviceMediaGUID];

        if (v16) {
          [(id)v27[5] setObject:v16 forKey:@"companion-guid"];
        }
      }
      uint64_t v17 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v17 + 320))
      {
        [(id)v27[5] setObject:MEMORY[0x1E4F1CC38] forKey:@"isRequestingSlot"];
        uint64_t v17 = *(void *)(a1 + 32);
      }
      v18 = [*(id *)(v17 + 304) identityStore];
      v19 = [*(id *)(*(void *)(a1 + 32) + 304) identity];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_17;
      v23[3] = &unk_1E5AC6CB8;
      v23[4] = *(void *)(a1 + 32);
      id v20 = v10;
      id v24 = v20;
      v25 = &v26;
      [v18 getPropertiesForUserIdentity:v19 completionHandler:v23];

      _Block_object_dispose(&v26, 8);
    }
    else
    {
      v21 = *(void **)(a1 + 32);
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v21 finishWithError:v22];
    }
  }
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v8;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get user identity properties. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_18;
    v26[3] = &unk_1E5AC6C68;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v27 = v9;
    uint64_t v28 = v10;
    id v29 = 0;
    v11 = (void (**)(void, void))MEMORY[0x1A6240BF0](v26);
    v12 = [v5 DSID];
    uint64_t v13 = [v12 unsignedLongLongValue];

    id v24 = 0;
    id v25 = 0;
    BOOL v14 = +[ICADIUtilities generateMachineDataForAccountID:-1 returningMachineIDData:&v25 otpData:0 error:&v24];
    id v15 = v25;
    id v16 = v24;
    if (v14)
    {
      uint64_t v17 = +[ICMusicSubscriptionFairPlayController sharedController];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_33;
      v21[3] = &unk_1E5AC6C90;
      uint64_t v18 = *(void *)(a1 + 48);
      v21[4] = *(void *)(a1 + 32);
      uint64_t v23 = v18;
      v22 = v11;
      [v17 generateSubscriptionBagRequestWithAccountUniqueIdentifier:v13 transactionType:312 machineIDData:v15 completionHandler:v21];
    }
    else
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v20;
        __int16 v32 = 2114;
        id v33 = v16;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to generate machine data for subscription request. err=%{public}@", buf, 0x16u);
      }

      v11[2](v11, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    }
  }
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:100 options:0 error:0];
  if (v3) {
    [*(id *)(a1 + 32) setHTTPBody:v3];
  }
  v4 = [[ICStoreURLRequest alloc] initWithURLRequest:*(void *)(a1 + 32) requestContext:*(void *)(*(void *)(a1 + 40) + 304)];
  id v5 = +[ICURLSessionManager defaultSession];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_2;
  v7[3] = &unk_1E5ACAF80;
  id v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  [v5 enqueueDataRequest:v4 withCompletionHandler:v7];
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_33(void *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@  failed to generate subscription bag sync data. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    v7 = [v5 base64EncodedStringWithOptions:0];
    if (v7) {
      [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v7 forKey:@"sbsync"];
    }
    goto LABEL_7;
  }
LABEL_8:
  (*(void (**)(void))(a1[5] + 16))();
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v5 = [a2 parsedBodyDictionary];
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription_Oversize");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received subscription response %{public}@", buf, 0x16u);
    }

    uint64_t v8 = [v5 objectForKey:@"statusCode"];
    if (objc_opt_respondsToSelector())
    {
      int v9 = [v8 intValue];
      if (!v9)
      {
        uint64_t v10 = ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(v5);
        if (v10)
        {
          __int16 v11 = +[ICMusicSubscriptionFairPlayController sharedController];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __37__ICMusicSubscriptionRequest_execute__block_invoke_28;
          v16[3] = &unk_1E5AC7288;
          id v12 = *(void **)(a1 + 40);
          v16[4] = *(void *)(a1 + 32);
          id v17 = v12;
          [v11 importSubscriptionKeyBagData:v10 completionHandler:v16];

LABEL_14:
          return;
        }
        BOOL v14 = *(void **)(a1 + 32);
        id v15 = 0;
LABEL_13:
        [v14 finishWithError:v15];
        goto LABEL_14;
      }
    }
    else
    {
      int v9 = -7102;
    }
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICStoreServerError" code:v9 userInfo:0];
    BOOL v14 = v13;
    id v15 = v10;
    goto LABEL_13;
  }
  v4 = *(void **)(a1 + 32);

  objc_msgSend(v4, "finishWithError:");
}

void __37__ICMusicSubscriptionRequest_execute__block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to import subscription keybag. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  [*(id *)(a1 + 32) finishWithError:v4];
}

- (ICMusicSubscriptionRequest)initWithStoreRequestContext:(id)a3 requestType:(int64_t)a4 requestingOfflineSlot:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicSubscriptionRequest;
  __int16 v10 = [(ICRequestOperation *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_storeRequestContext, a3);
    v11->_requestType = a4;
    v11->_requestingOfflineSlot = a5;
  }

  return v11;
}

@end