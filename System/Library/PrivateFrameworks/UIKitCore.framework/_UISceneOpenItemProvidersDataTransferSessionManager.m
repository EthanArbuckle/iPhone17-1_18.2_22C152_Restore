@interface _UISceneOpenItemProvidersDataTransferSessionManager
+ (id)sharedInstance;
- (NSMutableSet)sessions;
- (OS_dispatch_queue)workQueue;
- (_UISceneOpenItemProvidersDataTransferSessionManager)init;
- (void)addSession:(id)a3;
- (void)dataTransferSessionBeganTransfers:(id)a3;
- (void)dataTransferSessionFinishedTransfers:(id)a3;
- (void)setSessions:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation _UISceneOpenItemProvidersDataTransferSessionManager

+ (id)sharedInstance
{
  if (_MergedGlobals_1154 != -1) {
    dispatch_once(&_MergedGlobals_1154, &__block_literal_global_181);
  }
  v2 = (void *)qword_1EB261DB0;
  return v2;
}

- (_UISceneOpenItemProvidersDataTransferSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UISceneOpenItemProvidersDataTransferSessionManager;
  v2 = [(_UISceneOpenItemProvidersDataTransferSessionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.UIKit.OpenItemProvidersActionHandler.TransferSessionWorkQueue", MEMORY[0x1E4F14430]);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)addSession:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(_UISceneOpenItemProvidersDataTransferSessionManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___UISceneOpenItemProvidersDataTransferSessionManager_addSession___block_invoke;
  v7[3] = &unk_1E52D9F98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)dataTransferSessionBeganTransfers:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OpenItemProviders", &dataTransferSessionBeganTransfers____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    dispatch_queue_t v5 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      v7 = [v3 itemCollection];
      id v8 = [v7 UUID];
      v9 = [v8 UUIDString];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "data transfer began for item collection uuid: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)dataTransferSessionFinishedTransfers:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(_UISceneOpenItemProvidersDataTransferSessionManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92___UISceneOpenItemProvidersDataTransferSessionManager_dataTransferSessionFinishedTransfers___block_invoke;
  v7[3] = &unk_1E52D9F98;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSMutableSet)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end