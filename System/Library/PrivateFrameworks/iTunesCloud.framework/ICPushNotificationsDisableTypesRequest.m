@interface ICPushNotificationsDisableTypesRequest
- (ICPushNotificationsDisableTypesRequest)initWithRequestContext:(id)a3 notificationType:(id)a4;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICPushNotificationsDisableTypesRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_notificationType, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)execute
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    notificationType = self->_notificationType;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    __int16 v10 = 2114;
    v11 = notificationType;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Disabling push notifications for type %{public}@", buf, 0x16u);
  }

  v5 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke;
  v7[3] = &unk_1E5ACD950;
  v7[4] = self;
  [v5 getBagForRequestContext:requestContext withCompletionHandler:v7];
}

void __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v7;
      __int16 v29 = 2114;
      id v30 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    v8 = [a2 dictionaryForBagKey:@"push-notification-types"];
    v9 = [v8 objectForKey:@"remove-push-notification-type-url"];
    if (v9)
    {
      v25 = v8;
      __int16 v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      v11 = [MEMORY[0x1E4F18D50] requestWithURL:v10];
      [v11 setHTTPMethod:@"POST"];
      [v11 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      v13 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
      v14 = [v13 deviceGUID];

      if (v14)
      {
        v15 = [*(id *)(*(void *)(a1 + 32) + 304) deviceInfo];
        v16 = [v15 deviceGUID];
        [v12 setObject:v16 forKey:@"guid"];
      }
      [v12 setObject:*(void *)(*(void *)(a1 + 32) + 312) forKey:@"notification-type"];
      v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:100 options:0 error:0];
      if (v17) {
        [v11 setHTTPBody:v17];
      }
      v18 = [[ICStoreURLRequest alloc] initWithURLRequest:v11 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
      v19 = [*(id *)(a1 + 32) progress];
      v20 = [(ICURLRequest *)v18 progress];
      [v19 addChild:v20 withPendingUnitCount:100];

      v21 = +[ICURLSessionManager defaultSession];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke_18;
      v26[3] = &unk_1E5ACD928;
      v26[4] = *(void *)(a1 + 32);
      [v21 enqueueDataRequest:v18 withCompletionHandler:v26];

      v8 = v25;
    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v23;
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing remove-push-notification-type-url url in bag - skipping", buf, 0xCu);
      }

      v24 = *(void **)(a1 + 32);
      __int16 v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v24 finishWithError:v10];
    }
  }
}

void __49__ICPushNotificationsDisableTypesRequest_execute__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ removePushNotification request failed. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    v6 = [a2 parsedBodyDictionary];
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removePushNotification request returned response %{public}@", (uint8_t *)&v13, 0x16u);
    }

    __int16 v10 = [[ICPushNotificationsResponse alloc] initWithResponseDictionary:v6];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 320);
    *(void *)(v11 + 320) = v10;
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ICPushNotificationsDisableTypesRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __76__ICPushNotificationsDisableTypesRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 320), a2);
  }
  return result;
}

- (ICPushNotificationsDisableTypesRequest)initWithRequestContext:(id)a3 notificationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICPushNotificationsDisableTypesRequest;
  v8 = [(ICRequestOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    requestContext = v8->_requestContext;
    v8->_requestContext = (ICStoreRequestContext *)v9;

    uint64_t v11 = [v7 copy];
    notificationType = v8->_notificationType;
    v8->_notificationType = (NSString *)v11;
  }
  return v8;
}

@end