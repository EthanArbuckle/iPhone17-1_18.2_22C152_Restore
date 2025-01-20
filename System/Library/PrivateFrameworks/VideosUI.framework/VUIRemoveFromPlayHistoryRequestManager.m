@interface VUIRemoveFromPlayHistoryRequestManager
+ (id)sharedInstance;
- (NSMutableDictionary)ongoingDeleteIDOperationDictionary;
- (VUIRemoveFromPlayHistoryRequestManager)init;
- (id)_init;
- (void)sendRequestForDeleteID:(id)a3 isContinueWatching:(BOOL)a4;
- (void)setOngoingDeleteIDOperationDictionary:(id)a3;
@end

@implementation VUIRemoveFromPlayHistoryRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_2 != -1) {
    dispatch_once(&sharedInstance___onceToken_2, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance___instance_0;
  return v2;
}

void __56__VUIRemoveFromPlayHistoryRequestManager_sharedInstance__block_invoke()
{
  id v0 = [[VUIRemoveFromPlayHistoryRequestManager alloc] _init];
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIRemoveFromPlayHistoryRequestManager;
  v2 = [(VUIRemoveFromPlayHistoryRequestManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingDeleteIDOperationDictionary = v2->_ongoingDeleteIDOperationDictionary;
    v2->_ongoingDeleteIDOperationDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (VUIRemoveFromPlayHistoryRequestManager)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unimplemented", @"-[VUIRemoveFromPlayHistoryRequestManager init] not supported, use +sharedInstance instead", 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)sendRequestForDeleteID:(id)a3 isContinueWatching:(BOOL)a4
{
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_ongoingDeleteIDOperationDictionary objectForKey:v6];
  v8 = v7;
  if (!v7 || [v7 isCancelled])
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB5148]) initWithItemID:v6];
    if (v9)
    {
      objc_initWeak(&location, v9);
      objc_initWeak(&from, self);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke;
      v15 = &unk_1E6DF57F0;
      objc_copyWeak(&v17, &location);
      id v10 = v6;
      id v16 = v10;
      objc_copyWeak(&v18, &from);
      BOOL v19 = a4;
      [v9 setCompletionBlock:&v12];
      -[NSMutableDictionary setValue:forKey:](self->_ongoingDeleteIDOperationDictionary, "setValue:forKey:", v9, v10, v12, v13, v14, v15);
      v11 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
      [v11 addOperation:v9];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", *(void *)(a1 + 32), @"CanonicalID");
  v4 = [WeakRetained error];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, @"Error");

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke_2;
  v7[3] = &unk_1E6DF4A58;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 56);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __84__VUIRemoveFromPlayHistoryRequestManager_sendRequestForDeleteID_isContinueWatching___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained ongoingDeleteIDOperationDictionary];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = v4;
  if (*(unsigned char *)(a1 + 56)) {
    id v5 = @"VUIClearFromPlayHistoryRequestDidFinishNotification";
  }
  else {
    id v5 = @"VUIRemoveFromPlayHistoryRequestDidFinishNotification";
  }
  [v4 postNotificationName:v5 object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)ongoingDeleteIDOperationDictionary
{
  return self->_ongoingDeleteIDOperationDictionary;
}

- (void)setOngoingDeleteIDOperationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sendRequestForDeleteID:(os_log_t)log isContinueWatching:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIRemoveFromPlayHistoryRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end