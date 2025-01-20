@interface NNMKInitialSyncProgressTracker
+ (double)syncTimeout;
- (BOOL)isTrackingInitialSync;
- (BOOL)isWaitingForAccounts;
- (BOOL)isWaitingForMessageContent;
- (BOOL)isWaitingForMessageHeaders;
- (BOOL)timeoutCanceledForAccounts;
- (BOOL)timeoutCanceledForMessageContent;
- (BOOL)timeoutCanceledForMessageHeaders;
- (BOOL)trackingInitialSync;
- (BOOL)trackingInitialSyncContent;
- (NNMKInitialSyncProgressTrackerDelegate)delegate;
- (NNMKSyncStateManager)syncStateManager;
- (NSMutableSet)initialSyncMessageIdsOfContentToAck;
- (NSMutableSet)initialSyncMessageIdsToSyncContent;
- (OS_dispatch_queue)executionQueue;
- (double)initialSyncProgress;
- (unint64_t)initialSyncMessagesCount;
- (void)_handleInitialSyncCompleted;
- (void)cancelTimeout;
- (void)finishedSendingInitialSyncContentToPairedDevice;
- (void)incrementProgressBy:(double)a3;
- (void)initialSyncTimedOut;
- (void)resetFlags;
- (void)setDelegate:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setInitialSyncMessageIdsOfContentToAck:(id)a3;
- (void)setInitialSyncMessageIdsToSyncContent:(id)a3;
- (void)setInitialSyncMessagesCount:(unint64_t)a3;
- (void)setInitialSyncProgress:(double)a3;
- (void)setIsWaitingForAccounts:(BOOL)a3;
- (void)setIsWaitingForMessageContent:(BOOL)a3;
- (void)setIsWaitingForMessageHeaders:(BOOL)a3;
- (void)setSyncStateManager:(id)a3;
- (void)setTimeoutCanceledForAccounts:(BOOL)a3;
- (void)setTimeoutCanceledForMessageContent:(BOOL)a3;
- (void)setTimeoutCanceledForMessageHeaders:(BOOL)a3;
- (void)setTrackingInitialSync:(BOOL)a3;
- (void)setTrackingInitialSyncContent:(BOOL)a3;
- (void)startSyncTimeoutForAccounts;
- (void)startSyncTimeoutForMessageContent;
- (void)startSyncTimeoutForMessageHeaders;
- (void)startTrackingInitialSync;
- (void)syncCompleted;
- (void)syncFailedWithError:(id)a3;
- (void)updateProgressWithAccountsArrivedInPairedDevice;
- (void)updateProgressWithAccountsSent;
- (void)updateProgressWithContentCompletelySyncedForMessageId:(id)a3;
- (void)updateProgressWithMessageContentArrivedInPairedDevice:(id)a3;
- (void)updateProgressWithMessageContentDownloadFailed:(id)a3;
- (void)updateProgressWithMessageHeadersArrivedInPairedDevice;
- (void)updateProgressWithMessageHeadersSent:(id)a3;
@end

@implementation NNMKInitialSyncProgressTracker

- (void)startTrackingInitialSync
{
  v3 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Started tracking initial sync", v4, 2u);
  }
  *(_WORD *)&self->_trackingInitialSync = 257;
  self->_initialSyncProgress = 0.0;
  [(NNMKSyncStateManager *)self->_syncStateManager reportInitialSyncProgress:0.0];
  [(NNMKInitialSyncProgressTracker *)self startSyncTimeoutForAccounts];
  self->_isWaitingForAccounts = 1;
}

- (void)updateProgressWithAccountsSent
{
  if (self->_trackingInitialSync)
  {
    v3 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Accounts sent to paired device", v4, 2u);
    }
    [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.05];
    [(NNMKInitialSyncProgressTracker *)self startSyncTimeoutForMessageHeaders];
    self->_isWaitingForMessageHeaders = 1;
  }
}

- (void)updateProgressWithAccountsArrivedInPairedDevice
{
  if (self->_trackingInitialSync)
  {
    v3 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Accounts arrived in paired device", v4, 2u);
    }
    [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.1];
  }
}

- (void)updateProgressWithMessageHeadersSent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_trackingInitialSync)
  {
    v5 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      int v13 = 134217984;
      uint64_t v14 = [v4 count];
      _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Message headers will be sent. (Message count: %lu)", (uint8_t *)&v13, 0xCu);
    }
    [(NNMKInitialSyncProgressTracker *)self cancelTimeout];
    self->_initialSyncMessagesCount = [v4 count];
    v7 = (void *)MEMORY[0x263EFF9C0];
    v8 = +[NNMKMessage messageIdsFromMessages:v4];
    v9 = [v7 setWithArray:v8];
    initialSyncMessageIdsToSyncContent = self->_initialSyncMessageIdsToSyncContent;
    self->_initialSyncMessageIdsToSyncContent = v9;

    v11 = (NSMutableSet *)[(NSMutableSet *)self->_initialSyncMessageIdsToSyncContent mutableCopy];
    initialSyncMessageIdsOfContentToAck = self->_initialSyncMessageIdsOfContentToAck;
    self->_initialSyncMessageIdsOfContentToAck = v11;

    if ([(NSMutableSet *)self->_initialSyncMessageIdsToSyncContent count])
    {
      [(NNMKInitialSyncProgressTracker *)self startSyncTimeoutForMessageContent];
      self->_isWaitingForMessageContent = 1;
    }
    else
    {
      [(NNMKInitialSyncProgressTracker *)self finishedSendingInitialSyncContentToPairedDevice];
    }
  }
  [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.05];
}

- (void)updateProgressWithMessageHeadersArrivedInPairedDevice
{
  if ([(NNMKInitialSyncProgressTracker *)self isTrackingInitialSync])
  {
    v3 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Message headers arrived in paired device", v4, 2u);
    }
    [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.1];
  }
}

- (void)updateProgressWithMessageContentArrivedInPairedDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableSet *)self->_initialSyncMessageIdsOfContentToAck containsObject:v4])
  {
    v5 = [(NNMKInitialSyncProgressTracker *)self delegate];
    v6 = [v5 currentDeviceRegistry];
    v7 = [v6 syncedMessageForMessageWithId:v4];

    if ([v7 isContentCompletelySynced])
    {
      v8 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v4;
        _os_log_impl(&dword_23D3DF000, v8, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Content Download for message. (%{public}@)", (uint8_t *)&v9, 0xCu);
      }
      [(NSMutableSet *)self->_initialSyncMessageIdsOfContentToAck removeObject:v4];
      [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.4 / (double)self->_initialSyncMessagesCount];
    }
  }
}

- (void)updateProgressWithMessageContentDownloadFailed:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableSet *)self->_initialSyncMessageIdsOfContentToAck containsObject:v4])
  {
    v5 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Content Download failed for message. (%{public}@)", (uint8_t *)&v6, 0xCu);
    }
    [(NNMKInitialSyncProgressTracker *)self updateProgressWithContentCompletelySyncedForMessageId:v4];
    [(NSMutableSet *)self->_initialSyncMessageIdsOfContentToAck removeObject:v4];
    [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.4 / (double)self->_initialSyncMessagesCount];
  }
}

- (void)updateProgressWithContentCompletelySyncedForMessageId:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableSet *)self->_initialSyncMessageIdsToSyncContent containsObject:v4])
  {
    v5 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Content completely synced for message. (%{public}@)", (uint8_t *)&v6, 0xCu);
    }
    [(NSMutableSet *)self->_initialSyncMessageIdsToSyncContent removeObject:v4];
    [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.2 / (double)self->_initialSyncMessagesCount];
    if (![(NSMutableSet *)self->_initialSyncMessageIdsToSyncContent count]) {
      [(NNMKInitialSyncProgressTracker *)self finishedSendingInitialSyncContentToPairedDevice];
    }
  }
}

- (void)finishedSendingInitialSyncContentToPairedDevice
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_trackingInitialSync && self->_trackingInitialSyncContent)
  {
    v3 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSNumber;
      BOOL trackingInitialSyncContent = self->_trackingInitialSyncContent;
      int v6 = v3;
      id v7 = [v4 numberWithBool:trackingInitialSyncContent];
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Finished sending initial content to paired device. Waiting for ack... _trackingInitialSyncContent: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(NNMKInitialSyncProgressTracker *)self cancelTimeout];
    uint64_t v8 = [(NNMKInitialSyncProgressTracker *)self delegate];
    [v8 trackerDidFinishSendingInitialSyncContentToPairedDevice:self];

    [(NNMKSyncStateManager *)self->_syncStateManager reportInitialSyncDidCompleteSending];
    self->_BOOL trackingInitialSyncContent = 0;
  }
}

- (void)syncCompleted
{
  if ([(NNMKInitialSyncProgressTracker *)self isTrackingInitialSync])
  {
    v3 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Initial sync finished. Reporting to PairedSync...", v4, 2u);
    }
    [(NNMKInitialSyncProgressTracker *)self incrementProgressBy:0.1];
    [(NNMKSyncStateManager *)self->_syncStateManager reportInitialSyncDidComplete];
    [(NNMKInitialSyncProgressTracker *)self _handleInitialSyncCompleted];
  }
}

- (void)syncFailedWithError:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NNMKInitialSyncProgressTracker *)self isTrackingInitialSync])
  {
    v5 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKInitialSyncProgressTracker syncFailedWithError:](v5);
    }
    syncStateManager = self->_syncStateManager;
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = v4;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v9 = [v7 errorWithDomain:@"com.apple.NanoMail.InitialSyncError" code:1 userInfo:v8];
    [(NNMKSyncStateManager *)syncStateManager reportInitialSyncDidFailWithError:v9];

    [(NNMKInitialSyncProgressTracker *)self _handleInitialSyncCompleted];
  }
}

- (void)incrementProgressBy:(double)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_trackingInitialSync)
  {
    double v4 = self->_initialSyncProgress + a3;
    if (v4 > 1.0) {
      double v4 = 1.0;
    }
    self->_double initialSyncProgress = v4;
    -[NNMKSyncStateManager reportInitialSyncProgress:](self->_syncStateManager, "reportInitialSyncProgress:");
    v5 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      double initialSyncProgress = self->_initialSyncProgress;
      int v7 = 134217984;
      double v8 = initialSyncProgress;
      _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Reported (%.2f).", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleInitialSyncCompleted
{
  [(NNMKInitialSyncProgressTracker *)self cancelTimeout];
  self->_trackingInitialSync = 0;
  self->_double initialSyncProgress = 0.0;
  self->_initialSyncMessagesCount = 0;
  initialSyncMessageIdsToSyncContent = self->_initialSyncMessageIdsToSyncContent;
  self->_initialSyncMessageIdsToSyncContent = 0;

  initialSyncMessageIdsOfContentToAck = self->_initialSyncMessageIdsOfContentToAck;
  self->_initialSyncMessageIdsOfContentToAck = 0;
}

- (BOOL)isTrackingInitialSync
{
  return self->_trackingInitialSync;
}

- (void)startSyncTimeoutForAccounts
{
  self->_timeoutCanceledForAccounts = 0;
  objc_initWeak(&location, self);
  [(id)objc_opt_class() syncTimeout];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NNMKInitialSyncProgressTracker_startSyncTimeoutForAccounts__block_invoke;
  block[3] = &unk_264E9A6B0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_after(v4, executionQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__NNMKInitialSyncProgressTracker_startSyncTimeoutForAccounts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 13))
  {
    id v3 = WeakRetained;
    [WeakRetained initialSyncTimedOut];
    id WeakRetained = v3;
  }
}

- (void)startSyncTimeoutForMessageHeaders
{
  self->_timeoutCanceledForMessageHeaders = 0;
  objc_initWeak(&location, self);
  [(id)objc_opt_class() syncTimeout];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageHeaders__block_invoke;
  block[3] = &unk_264E9A6B0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_after(v4, executionQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageHeaders__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 14))
  {
    id v3 = WeakRetained;
    [WeakRetained initialSyncTimedOut];
    id WeakRetained = v3;
  }
}

- (void)startSyncTimeoutForMessageContent
{
  self->_timeoutCanceledForMessageContent = 0;
  objc_initWeak(&location, self);
  [(id)objc_opt_class() syncTimeout];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageContent__block_invoke;
  block[3] = &unk_264E9A6B0;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_after(v4, executionQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__NNMKInitialSyncProgressTracker_startSyncTimeoutForMessageContent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 15))
  {
    id v3 = WeakRetained;
    [WeakRetained initialSyncTimedOut];
    id WeakRetained = v3;
  }
}

- (void)cancelTimeout
{
  *(_WORD *)&self->_timeoutCanceledForAccounts = 257;
  self->_timeoutCanceledForMessageContent = 1;
  [(NNMKInitialSyncProgressTracker *)self resetFlags];
}

- (void)resetFlags
{
  *(_WORD *)&self->_isWaitingForAccounts = 0;
  self->_isWaitingForMessageContent = 0;
}

- (void)initialSyncTimedOut
{
  if (self->_trackingInitialSync)
  {
    if (self->_isWaitingForMessageContent)
    {
      id v3 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_DEFAULT, "Initial sync progress - MobileMail took too long to download the content for all the messages for the initial sync. We're ignoring the next content downloads for the sake of reporting to PairedSync. Notifying paired watch that we're done sending content...", buf, 2u);
      }
    }
    if (self->_isWaitingForAccounts)
    {
      dispatch_time_t v4 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Initial sync progress - MobileMail took too long to reply with accounts.", v9, 2u);
      }
    }
    if (self->_isWaitingForMessageHeaders)
    {
      v5 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v8 = 0;
        _os_log_impl(&dword_23D3DF000, v5, OS_LOG_TYPE_DEFAULT, "Initial sync progress - MobileMail took too long to reply with message headers.", v8, 2u);
      }
    }
    int v6 = qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Initial sync progress - Initial sync timed out. Forcing completion and reporting to PairedSync.", v7, 2u);
    }
    [(NSMutableSet *)self->_initialSyncMessageIdsToSyncContent removeAllObjects];
    [(NSMutableSet *)self->_initialSyncMessageIdsOfContentToAck removeAllObjects];
    [(NNMKInitialSyncProgressTracker *)self finishedSendingInitialSyncContentToPairedDevice];
    [(NNMKInitialSyncProgressTracker *)self cancelTimeout];
  }
}

+ (double)syncTimeout
{
  return 30.0;
}

- (NNMKInitialSyncProgressTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNMKInitialSyncProgressTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NNMKSyncStateManager)syncStateManager
{
  return self->_syncStateManager;
}

- (void)setSyncStateManager:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (BOOL)trackingInitialSync
{
  return self->_trackingInitialSync;
}

- (void)setTrackingInitialSync:(BOOL)a3
{
  self->_trackingInitialSync = a3;
}

- (BOOL)trackingInitialSyncContent
{
  return self->_trackingInitialSyncContent;
}

- (void)setTrackingInitialSyncContent:(BOOL)a3
{
  self->_BOOL trackingInitialSyncContent = a3;
}

- (double)initialSyncProgress
{
  return self->_initialSyncProgress;
}

- (void)setInitialSyncProgress:(double)a3
{
  self->_double initialSyncProgress = a3;
}

- (unint64_t)initialSyncMessagesCount
{
  return self->_initialSyncMessagesCount;
}

- (void)setInitialSyncMessagesCount:(unint64_t)a3
{
  self->_initialSyncMessagesCount = a3;
}

- (NSMutableSet)initialSyncMessageIdsToSyncContent
{
  return self->_initialSyncMessageIdsToSyncContent;
}

- (void)setInitialSyncMessageIdsToSyncContent:(id)a3
{
}

- (NSMutableSet)initialSyncMessageIdsOfContentToAck
{
  return self->_initialSyncMessageIdsOfContentToAck;
}

- (void)setInitialSyncMessageIdsOfContentToAck:(id)a3
{
}

- (BOOL)isWaitingForAccounts
{
  return self->_isWaitingForAccounts;
}

- (void)setIsWaitingForAccounts:(BOOL)a3
{
  self->_isWaitingForAccounts = a3;
}

- (BOOL)isWaitingForMessageHeaders
{
  return self->_isWaitingForMessageHeaders;
}

- (void)setIsWaitingForMessageHeaders:(BOOL)a3
{
  self->_isWaitingForMessageHeaders = a3;
}

- (BOOL)isWaitingForMessageContent
{
  return self->_isWaitingForMessageContent;
}

- (void)setIsWaitingForMessageContent:(BOOL)a3
{
  self->_isWaitingForMessageContent = a3;
}

- (BOOL)timeoutCanceledForAccounts
{
  return self->_timeoutCanceledForAccounts;
}

- (void)setTimeoutCanceledForAccounts:(BOOL)a3
{
  self->_timeoutCanceledForAccounts = a3;
}

- (BOOL)timeoutCanceledForMessageHeaders
{
  return self->_timeoutCanceledForMessageHeaders;
}

- (void)setTimeoutCanceledForMessageHeaders:(BOOL)a3
{
  self->_timeoutCanceledForMessageHeaders = a3;
}

- (BOOL)timeoutCanceledForMessageContent
{
  return self->_timeoutCanceledForMessageContent;
}

- (void)setTimeoutCanceledForMessageContent:(BOOL)a3
{
  self->_timeoutCanceledForMessageContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncMessageIdsOfContentToAck, 0);
  objc_storeStrong((id *)&self->_initialSyncMessageIdsToSyncContent, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncStateManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)syncFailedWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Initial sync progress - Initial sync failed. Reporting to PairedSync...", v1, 2u);
}

@end