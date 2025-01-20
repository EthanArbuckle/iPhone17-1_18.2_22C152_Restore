@interface ICMusicAccountNotificationsSettingsRequestOperation
- (ICMusicAccountNotificationsSettingsRequestOperation)initWithRequestContext:(id)a3 withRequestMethod:(int64_t)a4;
- (ICMusicAccountNotificationsSettingsRequestOperation)initWithRequestContext:(id)a3 withRequestMethod:(int64_t)a4 andBodyDictionary:(id)a5;
- (void)cancel;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICMusicAccountNotificationsSettingsRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyDictionary, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_storeURLRequest, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)ICMusicAccountNotificationsSettingsRequestOperation;
  [(ICMusicAccountNotificationsSettingsRequestOperation *)&v4 cancel];
  v3 = +[ICURLSessionManager highPrioritySession];
  [v3 cancelRequest:self->_storeURLRequest];
}

- (void)execute
{
  v3 = +[ICUserIdentityStore defaultIdentityStore];
  objc_super v4 = +[ICUserIdentity activeAccount];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke;
  v5[3] = &unk_1E5ACAFF0;
  v5[4] = self;
  [v3 getPropertiesForUserIdentity:v4 completionHandler:v5];
}

void __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
  {
    v5 = +[ICURLBagProvider sharedBagProvider];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 312);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_2;
    v9[3] = &unk_1E5ACD950;
    v9[4] = v6;
    [v5 getBagForRequestContext:v7 withCompletionHandler:v9];
  }
  else
  {
    objc_super v4 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
    [v4 finishWithError:v8];
  }
}

void __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = [a2 dictionaryForBagKey:@"musicFriends"];
    objc_super v4 = v3;
    if (*(void *)(*(void *)(a1 + 32) + 336)) {
      v5 = @"setPushNotificationSettings";
    }
    else {
      v5 = @"getPushNotificationSettings";
    }
    uint64_t v6 = [v3 objectForKey:v5];
    uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    if (!v7)
    {
      v21 = *(void **)(a1 + 32);
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v21 finishWithError:v22];

LABEL_20:
      return;
    }
    id v8 = (void *)v7;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "ic_queryParametersDictionaryFromString:", @"v=2");
    [v9 addEntriesFromDictionary:v10];

    v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "ic_queryParametersDictionaryFromString:", @"serviceId=com.apple.Music");
    [v9 addEntriesFromDictionary:v11];

    v12 = objc_msgSend(v8, "ic_URLByAppendingQueryParameters:", v9);

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v12];
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 336) == 1)
    {
      uint64_t v15 = *(void *)(v14 + 344);
      id v26 = 0;
      v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:&v26];
      v17 = (ICStoreURLRequest *)v26;
      v18 = v17;
      if (!v16 || v17)
      {
        v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 344);
          *(_DWORD *)buf = 138543618;
          v28 = v18;
          __int16 v29 = 2114;
          uint64_t v30 = v24;
          _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "Failed to serialize body data. error=%{public}@, bodyDictionary=%{public}@", buf, 0x16u);
        }

        [*(id *)(a1 + 32) finishWithError:v18];
        goto LABEL_19;
      }
      [v13 setHTTPBody:v16];
      [v13 setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

      v19 = @"POST";
    }
    else
    {
      v19 = @"GET";
    }
    [v13 setHTTPMethod:v19];
    v18 = [[ICStoreURLRequest alloc] initWithURLRequest:v13 requestContext:*(void *)(*(void *)(a1 + 32) + 312)];
    v16 = +[ICURLSessionManager defaultSession];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_29;
    v25[3] = &unk_1E5ACD928;
    v25[4] = *(void *)(a1 + 32);
    [v16 enqueueDataRequest:v18 withCompletionHandler:v25];
LABEL_19:

    goto LABEL_20;
  }
  v20 = *(void **)(a1 + 32);

  objc_msgSend(v20, "finishWithError:");
}

uint64_t __62__ICMusicAccountNotificationsSettingsRequestOperation_execute__block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [ICMusicAccountNotificationsSettingsResponse alloc];
  v5 = [v3 parsedBodyDictionary];

  uint64_t v6 = [(ICMusicAccountNotificationsSettingsResponse *)v4 initWithResponseDictionary:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 328);
  *(void *)(v7 + 328) = v6;

  id v9 = *(void **)(a1 + 32);

  return [v9 finish];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__ICMusicAccountNotificationsSettingsRequestOperation_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __89__ICMusicAccountNotificationsSettingsRequestOperation_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 328), a2);
}

- (ICMusicAccountNotificationsSettingsRequestOperation)initWithRequestContext:(id)a3 withRequestMethod:(int64_t)a4 andBodyDictionary:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(ICRequestOperation *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    v12->_requestMethod = a4;
    objc_storeStrong((id *)&v12->_bodyDictionary, a5);
  }

  return v12;
}

- (ICMusicAccountNotificationsSettingsRequestOperation)initWithRequestContext:(id)a3 withRequestMethod:(int64_t)a4
{
  id v7 = a3;
  id v8 = [(ICRequestOperation *)self init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_requestContext, a3);
    v9->_requestMethod = a4;
  }

  return v9;
}

@end