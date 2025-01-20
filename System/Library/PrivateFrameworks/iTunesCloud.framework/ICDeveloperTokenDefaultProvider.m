@interface ICDeveloperTokenDefaultProvider
+ (BOOL)supportsSecureCoding;
+ (ICDeveloperTokenDefaultProvider)sharedProvider;
- (BOOL)isEqual:(id)a3;
- (ICDeveloperTokenDefaultProvider)init;
- (ICDeveloperTokenDefaultProvider)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)_fetchDeveloperTokenWithClientInfo:(id)a3;
- (void)fetchDeveloperTokenForClientInfo:(id)a3 completionHandler:(id)a4;
- (void)invalidateCachedDeveloperTokenForClientInfo:(id)a3 completionHandler:(id)a4;
@end

@implementation ICDeveloperTokenDefaultProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);

  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
}

- (void)_fetchDeveloperTokenWithClientInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching developer token with clientInfo %{public}@", buf, 0x16u);
  }

  v6 = [[ICDeveloperTokenFetchRequest alloc] initWithClientInfo:v4 options:0];
  [(ICDeveloperTokenFetchRequest *)v6 setClientType:0];
  requestOperationQueue = self->_requestOperationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke;
  v9[3] = &unk_1E5AC77D0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ICDeveloperTokenFetchRequest *)v6 performRequestOnOperationQueue:requestOperationQueue withResponseHandler:v9];
}

void __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = [v7 count];
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ developer token fetch completed for clientInfo %{public}@ with %lu handlers", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke_6;
  v13[3] = &unk_1E5AC77A8;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v7 enumerateObjectsUsingBlock:v13];
}

uint64_t __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)invalidateCachedDeveloperTokenForClientInfo:(id)a3 completionHandler:(id)a4
{
}

- (void)fetchDeveloperTokenForClientInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v14 = (id)[a3 copy];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_pendingCompletionHandlers objectForKeyedSubscript:v14];

  if (v8)
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_pendingCompletionHandlers objectForKeyedSubscript:v14];
    uint64_t v10 = (void *)MEMORY[0x1A6240BF0](v6);

    [v9 addObject:v10];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->_pendingCompletionHandlers setObject:v11 forKeyedSubscript:v14];

    id v12 = [(NSMutableDictionary *)self->_pendingCompletionHandlers objectForKeyedSubscript:v14];
    __int16 v13 = (void *)MEMORY[0x1A6240BF0](v6);

    [v12 addObject:v13];
    os_unfair_lock_unlock(&self->_lock);
    [(ICDeveloperTokenDefaultProvider *)self _fetchDeveloperTokenWithClientInfo:v14];
  }
}

- (ICDeveloperTokenDefaultProvider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICDeveloperTokenDefaultProvider;
  return [(ICDeveloperTokenDefaultProvider *)&v4 init];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (ICDeveloperTokenDefaultProvider *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ([(ICDeveloperTokenDefaultProvider *)self isMemberOfClass:v5]) {
      char v6 = [(ICDeveloperTokenDefaultProvider *)v4 isMemberOfClass:v5];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (ICDeveloperTokenDefaultProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICDeveloperTokenDefaultProvider;
  v2 = [(ICDeveloperTokenDefaultProvider *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingCompletionHandlers = v3->_pendingCompletionHandlers;
    v3->_pendingCompletionHandlers = (NSMutableDictionary *)v4;

    char v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    requestOperationQueue = v3->_requestOperationQueue;
    v3->_requestOperationQueue = v6;

    [(NSOperationQueue *)v3->_requestOperationQueue setName:@"com.apple.iTunesCloud.ICDeveloperTokenDefaultProvider.operationQueue"];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (ICDeveloperTokenDefaultProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_4482);
  }
  v2 = (void *)sharedProvider___sharedProvider;

  return (ICDeveloperTokenDefaultProvider *)v2;
}

uint64_t __49__ICDeveloperTokenDefaultProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(ICDeveloperTokenDefaultProvider);
  uint64_t v1 = sharedProvider___sharedProvider;
  sharedProvider___sharedProvider = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end