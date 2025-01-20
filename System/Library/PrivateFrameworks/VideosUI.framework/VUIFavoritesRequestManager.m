@interface VUIFavoritesRequestManager
+ (id)sharedInstance;
+ (void)getFavoriteTeamsIgnoringCache:(BOOL)a3 completion:(id)a4;
- (NSMutableDictionary)ongoingEntityIDOperationDictionary;
- (VUIFavoritesRequestManager)init;
- (id)_init;
- (void)sendRequestForEntityID:(id)a3 teamName:(id)a4 action:(unint64_t)a5 fireBackgroundEvent:(BOOL)a6;
- (void)setOngoingEntityIDOperationDictionary:(id)a3;
@end

@implementation VUIFavoritesRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1) {
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

void __44__VUIFavoritesRequestManager_sharedInstance__block_invoke()
{
  id v0 = [[VUIFavoritesRequestManager alloc] _init];
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIFavoritesRequestManager;
  v2 = [(VUIFavoritesRequestManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingEntityIDOperationDictionary = v2->_ongoingEntityIDOperationDictionary;
    v2->_ongoingEntityIDOperationDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (VUIFavoritesRequestManager)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unimplemented", @"-[VUIFavoritesRequestManager init] not supported, use +sharedInstance instead", 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)sendRequestForEntityID:(id)a3 teamName:(id)a4 action:(unint64_t)a5 fireBackgroundEvent:(BOOL)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [(NSMutableDictionary *)self->_ongoingEntityIDOperationDictionary objectForKey:v10];
  v13 = v12;
  if (v12 && ([v12 isCancelled] & 1) == 0)
  {
    uint64_t v21 = [v13 action];
    uint64_t v22 = 1;
    if (a5 == 1) {
      uint64_t v22 = 2;
    }
    if (a5 == 2) {
      uint64_t v22 = 0;
    }
    if (v21 != v22)
    {
      [v13 cancel];
      [(NSMutableDictionary *)self->_ongoingEntityIDOperationDictionary removeObjectForKey:v10];
    }
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB5168]);
    v30[0] = v10;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    uint64_t v16 = 1;
    if (a5 == 1) {
      uint64_t v16 = 2;
    }
    if (a5 == 2) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v16;
    }
    v18 = (void *)[v14 initWithAction:v17 ids:v15];

    if (v18)
    {
      objc_initWeak(&location, v18);
      objc_initWeak(&from, self);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke;
      v23[3] = &unk_1E6DF41C0;
      objc_copyWeak(&v25, &location);
      v26[1] = (id)a5;
      BOOL v27 = a6;
      objc_copyWeak(v26, &from);
      id v19 = v10;
      id v24 = v19;
      [v18 setCompletionBlock:v23];
      [(NSMutableDictionary *)self->_ongoingEntityIDOperationDictionary setValue:v18 forKey:v19];
      v20 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
      [v20 addOperation:v18];

      objc_destroyWeak(v26);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [WeakRetained error];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, @"Error");

  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 56)];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, @"Action");

  objc_super v6 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v6, @"FireBackgroundEvent");

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke_2;
  block[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained ongoingEntityIDOperationDictionary];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VUIFavoritesRequestDidFinishNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

+ (void)getFavoriteTeamsIgnoringCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4FB5160] defaultManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke;
    v7[3] = &unk_1E6DF4210;
    id v8 = v5;
    [v6 getFavoritesIgnoringCache:v4 completion:v7];
  }
}

void __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v14 = [v13 ID];

          if (v14)
          {
            v15 = [v13 ID];
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v20 = __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke_2;
    uint64_t v21 = &unk_1E6DF41E8;
    id v16 = *(id *)(a1 + 32);
    id v22 = v7;
    id v23 = v16;
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    id v18 = v7;
    if (objc_msgSend(v17, "isMainThread", v19[0], 3221225472)) {
      v20((uint64_t)v19);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v19);
    }
  }
}

void __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (NSMutableDictionary)ongoingEntityIDOperationDictionary
{
  return self->_ongoingEntityIDOperationDictionary;
}

- (void)setOngoingEntityIDOperationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sendRequestForEntityID:(os_log_t)log teamName:action:fireBackgroundEvent:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIFavoritesRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end