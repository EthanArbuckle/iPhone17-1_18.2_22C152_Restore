@interface VUIUpNextRequestManager
+ (id)sharedInstance;
- (NSMutableDictionary)ongoingCanonicalIDOperationDictionary;
- (VUIUpNextRequestManager)init;
- (id)_init;
- (void)_postUpNextRequestFinishedNotificationForCanonicalId:(id)a3 userInfo:(id)a4;
- (void)sendRequestForCanonicalID:(id)a3 action:(unint64_t)a4 confirmationShouldWaitCompletion:(BOOL)a5;
- (void)setOngoingCanonicalIDOperationDictionary:(id)a3;
@end

@implementation VUIUpNextRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_5 != -1) {
    dispatch_once(&sharedInstance___onceToken_5, &__block_literal_global_43);
  }
  v2 = (void *)sharedInstance___instance_3;
  return v2;
}

void __41__VUIUpNextRequestManager_sharedInstance__block_invoke()
{
  id v0 = [[VUIUpNextRequestManager alloc] _init];
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = (uint64_t)v0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIUpNextRequestManager;
  v2 = [(VUIUpNextRequestManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingCanonicalIDOperationDictionary = v2->_ongoingCanonicalIDOperationDictionary;
    v2->_ongoingCanonicalIDOperationDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (VUIUpNextRequestManager)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unimplemented", @"-[VUIUpNextRequestManager init] not supported, use +sharedInstance instead", 0 reason userInfo];
  objc_exception_throw(v2);
}

- (void)sendRequestForCanonicalID:(id)a3 action:(unint64_t)a4 confirmationShouldWaitCompletion:(BOOL)a5
{
  id v7 = a3;
  v8 = [(NSMutableDictionary *)self->_ongoingCanonicalIDOperationDictionary objectForKey:v7];
  v9 = v8;
  if (v8 && ([v8 isCancelled] & 1) == 0)
  {
    if ([v9 action] != a4)
    {
      [v9 cancel];
      [(NSMutableDictionary *)self->_ongoingCanonicalIDOperationDictionary removeObjectForKey:v7];
    }
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB51B0]) initWithAction:a4 canonicalID:v7 caller:0];
    if (v10)
    {
      objc_initWeak(&location, v10);
      objc_initWeak(&from, self);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke;
      v13[3] = &unk_1E6DF65E0;
      objc_copyWeak(&v15, &location);
      objc_copyWeak(&v16, &from);
      id v11 = v7;
      id v14 = v11;
      [v10 setCompletionBlock:v13];
      [(NSMutableDictionary *)self->_ongoingCanonicalIDOperationDictionary setValue:v10 forKey:v11];
      v12 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
      [v12 addOperation:v10];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [WeakRetained error];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, @"Error");

  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "action"));
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, @"Action");

  id v6 = objc_loadWeakRetained(a1 + 6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_2;
  block[3] = &unk_1E6DF6728;
  block[4] = v6;
  id v10 = a1[4];
  id v11 = WeakRetained;
  id v7 = WeakRetained;
  objc_copyWeak(&v13, a1 + 6);
  id v12 = v3;
  id v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_2(id *a1)
{
  id v2 = [a1[4] ongoingCanonicalIDOperationDictionary];
  [v2 removeObjectForKey:a1[5]];

  if ([a1[6] action] == 1
    && (+[VUIFeaturesConfiguration sharedInstance],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 upNextConfig],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 upNextRefreshCallDelayAfterRemoveFromUpNext],
        v4,
        v3,
        v5 >= 1))
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000 * v5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_3;
    block[3] = &unk_1E6DF3F90;
    objc_copyWeak(&v13, a1 + 8);
    id v11 = a1[5];
    id v12 = a1[7];
    dispatch_after(v6, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v13);
  }
  else
  {
    id v7 = a1[4];
    id v8 = a1[5];
    id v9 = a1[7];
    [v7 _postUpNextRequestFinishedNotificationForCanonicalId:v8 userInfo:v9];
  }
}

void __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _postUpNextRequestFinishedNotificationForCanonicalId:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)_postUpNextRequestFinishedNotificationForCanonicalId:(id)a3 userInfo:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultCenter];
  [v8 postNotificationName:@"VUIUpNextRequestDidFinishNotification" object:v7 userInfo:v6];

  id v9 = [MEMORY[0x1E4F28C40] defaultCenter];
  objc_msgSend(v9, "vui_postNotificationName:object:userInfo:", @"com.apple.VideosUI.UpNextRequestDidFinishNotification", v7, v6);
}

- (NSMutableDictionary)ongoingCanonicalIDOperationDictionary
{
  return self->_ongoingCanonicalIDOperationDictionary;
}

- (void)setOngoingCanonicalIDOperationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sendRequestForCanonicalID:(os_log_t)log action:confirmationShouldWaitCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIUpNextRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end