@interface _UISceneOpenItemProvidersDataTransferSession
- (NSArray)itemProviders;
- (PBItemCollection)itemCollection;
- (_DUIDragContinuation)continuation;
- (_UIDataTransferMonitor)monitor;
- (_UISceneOpenItemProvidersDataTransferSession)initWithItemProviders:(id)a3 itemCollection:(id)a4 continuation:(id)a5;
- (_UISceneOpenItemProvidersDataTransferSessionDelegate)delegate;
- (void)dataTransferMonitorBeganTransfers:(id)a3;
- (void)dataTransferMonitorFinishedTransfers:(id)a3;
- (void)didFinishSendingRequests;
- (void)setContinuation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemCollection:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setMonitor:(id)a3;
@end

@implementation _UISceneOpenItemProvidersDataTransferSession

- (_UISceneOpenItemProvidersDataTransferSession)initWithItemProviders:(id)a3 itemCollection:(id)a4 continuation:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_UISceneOpenItemProvidersDataTransferSession;
  v12 = [(_UISceneOpenItemProvidersDataTransferSession *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemProviders, a3);
    objc_storeStrong((id *)&v13->_itemCollection, a4);
    v14 = objc_alloc_init(_UIDataTransferMonitor);
    monitor = v13->_monitor;
    v13->_monitor = v14;

    [(_UIDataTransferMonitor *)v13->_monitor setDelegate:v13];
    objc_storeStrong((id *)&v13->_continuation, a5);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v16 = v13->_itemProviders;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20++), "setDataTransferDelegate:", v13->_monitor, (void)v22);
        }
        while (v18 != v20);
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
  }
  return v13;
}

- (void)didFinishSendingRequests
{
  v3 = [(_UISceneOpenItemProvidersDataTransferSession *)self itemCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72___UISceneOpenItemProvidersDataTransferSession_didFinishSendingRequests__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 waitForItemRequestsDeliveryCompletion:v4];
}

- (void)dataTransferMonitorBeganTransfers:(id)a3
{
  id v4 = [(_UISceneOpenItemProvidersDataTransferSession *)self delegate];
  [v4 dataTransferSessionBeganTransfers:self];
}

- (void)dataTransferMonitorFinishedTransfers:(id)a3
{
  id v4 = [(_UISceneOpenItemProvidersDataTransferSession *)self delegate];
  [v4 dataTransferSessionFinishedTransfers:self];
}

- (_UISceneOpenItemProvidersDataTransferSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISceneOpenItemProvidersDataTransferSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIDataTransferMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
}

- (_DUIDragContinuation)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuation, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end