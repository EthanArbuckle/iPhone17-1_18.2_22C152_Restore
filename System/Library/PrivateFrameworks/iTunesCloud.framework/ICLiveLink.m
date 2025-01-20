@interface ICLiveLink
+ (ICLiveLink)linkWithIdentity:(id)a3;
+ (ICLiveLink)linkWithSessionIdentifier:(id)a3 identity:(id)a4;
- (BOOL)expectingToJoinAsInitiator;
- (BOOL)isExpectingToJoinWithStartItem;
- (BOOL)isStarted;
- (BOOL)isStarting;
- (BOOL)processingAction;
- (BOOL)receivedDisconnectionNotice;
- (ICLiveLink)initWithSharedListeningSessionIdentifier:(id)a3 identity:(id)a4;
- (ICLiveLinkDelegate)delegate;
- (ICLiveLinkIdentity)clientSpecifiedIdentity;
- (ICLiveLinkIdentity)identity;
- (ICLiveLinkPlaybackCoordinatorMedium)playbackCoordinatorMedium;
- (ICSharedListeningConnectionController)connectionController;
- (ICSharedListeningQueue)queue;
- (NSArray)participants;
- (NSMutableArray)pendingActions;
- (NSMutableDictionary)pendingRequests;
- (NSString)deferredReconnectReason;
- (NSString)expectingToJoinStartItemIdentifier;
- (NSString)forcedReconnectReason;
- (NSString)identifier;
- (NSString)sessionKey;
- (NSURL)invitationURL;
- (OS_dispatch_queue)delegateQueue;
- (id)_participantForAction:(id)a3;
- (id)_participantForParticipantID:(int64_t)a3;
- (id)participantForParticipantUUID:(id)a3;
- (int64_t)currentRetryCount;
- (int64_t)localParticipantServerID;
- (int64_t)maxRetries;
- (int64_t)maxRetryWaitPeriod;
- (os_unfair_lock_s)lock;
- (void)_didReceiveAddItemsAction:(id)a3 completion:(id)a4;
- (void)_didReceiveCurrentItemChangeAction:(id)a3 completion:(id)a4;
- (void)_didReceiveCurrentItemTransitionAction:(id)a3 completion:(id)a4;
- (void)_didReceiveMoveItemAction:(id)a3 completion:(id)a4;
- (void)_didReceiveParticipantChangeAction:(id)a3 completion:(id)a4;
- (void)_didReceivePlayNowQueueItemsAction:(id)a3 completion:(id)a4;
- (void)_didReceivePlaybackSyncAction:(id)a3 completion:(id)a4;
- (void)_didReceivePluginErrorMessage:(id)a3;
- (void)_didReceiveQueueSyncAction:(id)a3 completion:(id)a4;
- (void)_didReceiveReactionAction:(id)a3 completion:(id)a4;
- (void)_didReceiveRemoveItemAction:(id)a3 completion:(id)a4;
- (void)_didReceiveReplaceQueueItemsAction:(id)a3 completion:(id)a4;
- (void)_didReceiveServerNoticeAction:(id)a3 completion:(id)a4;
- (void)_emitSessionEventIfNeededForAction:(id)a3 disconnectedParticipant:(id)a4;
- (void)_handlePotentiallyRecoverableError:(id)a3;
- (void)_handleReceivedMessage:(id)a3;
- (void)_handleUpdatedParticipantQuery:(id)a3;
- (void)_handleUpdatedQueue:(id)a3 playbackControlSettings:(id)a4 serverQueueContext:(id)a5;
- (void)_performClientInfoExchangeAndInitializeQueue;
- (void)_processPendingActions;
- (void)_storeTraceID:(id)a3 completion:(id)a4;
- (void)_updateParticipantsWithReason:(id)a3 completion:(id)a4;
- (void)_updatePlaybackControlSettingsWithReason:(id)a3 completion:(id)a4;
- (void)_updateQueueWithReason:(id)a3 completion:(id)a4;
- (void)beginSynchronizedPlaybackWithAVCFPlaybackCoordinator:(void *)a3;
- (void)beginSynchronizedPlaybackWithAVPlaybackCoordinator:(id)a3;
- (void)broadcastDirectCurrentItemChangedToItemIdentifier:(id)a3;
- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4;
- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4;
- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4;
- (void)connectionControllerConnectionDidStart:(id)a3;
- (void)dealloc;
- (void)endSynchronizedPlayback;
- (void)expectingToJoinWithStartItem:(id)a3 asInitiator:(BOOL)a4;
- (void)fetchPlaybackSyncStateForMediumWithCompletion:(id)a3;
- (void)fetchPlaybackSyncStateWithCompletion:(id)a3;
- (void)receivedCurrentItemIdentifier:(id)a3 fromParticipant:(id)a4;
- (void)receivedEvent:(id)a3;
- (void)reconnectWithReason:(id)a3 options:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)sendPlaybackSyncPayload:(id)a3;
- (void)setConnectionController:(id)a3;
- (void)setCurrentRetryCount:(int64_t)a3;
- (void)setDeferredReconnectReason:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpectingToJoinAsInitiator:(BOOL)a3;
- (void)setExpectingToJoinStartItemIdentifier:(id)a3;
- (void)setForcedReconnectReason:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxRetries:(int64_t)a3;
- (void)setMaxRetryWaitPeriod:(int64_t)a3;
- (void)setPendingActions:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setPlaybackCoordinatorMedium:(id)a3;
- (void)setProcessingAction:(BOOL)a3;
- (void)setReceivedDisconnectionNotice:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStarting:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)updateWithIdentity:(id)a3;
@end

@implementation ICLiveLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectingToJoinStartItemIdentifier, 0);
  objc_storeStrong((id *)&self->_deferredReconnectReason, 0);
  objc_storeStrong((id *)&self->_forcedReconnectReason, 0);
  objc_storeStrong((id *)&self->_clientSpecifiedIdentity, 0);
  objc_storeStrong((id *)&self->_connectionController, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_playbackCoordinatorMedium, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

- (void)setExpectingToJoinAsInitiator:(BOOL)a3
{
  self->_expectingToJoinAsInitiator = a3;
}

- (BOOL)expectingToJoinAsInitiator
{
  return self->_expectingToJoinAsInitiator;
}

- (void)setExpectingToJoinStartItemIdentifier:(id)a3
{
}

- (NSString)expectingToJoinStartItemIdentifier
{
  return self->_expectingToJoinStartItemIdentifier;
}

- (void)setMaxRetryWaitPeriod:(int64_t)a3
{
  self->_maxRetryWaitPeriod = a3;
}

- (int64_t)maxRetryWaitPeriod
{
  return self->_maxRetryWaitPeriod;
}

- (void)setMaxRetries:(int64_t)a3
{
  self->_maxRetries = a3;
}

- (int64_t)maxRetries
{
  return self->_maxRetries;
}

- (void)setCurrentRetryCount:(int64_t)a3
{
  self->_currentRetryCount = a3;
}

- (int64_t)currentRetryCount
{
  return self->_currentRetryCount;
}

- (void)setReceivedDisconnectionNotice:(BOOL)a3
{
  self->_receivedDisconnectionNotice = a3;
}

- (BOOL)receivedDisconnectionNotice
{
  return self->_receivedDisconnectionNotice;
}

- (void)setDeferredReconnectReason:(id)a3
{
}

- (NSString)deferredReconnectReason
{
  return self->_deferredReconnectReason;
}

- (void)setForcedReconnectReason:(id)a3
{
}

- (NSString)forcedReconnectReason
{
  return self->_forcedReconnectReason;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (int64_t)localParticipantServerID
{
  return self->_localParticipantServerID;
}

- (ICLiveLinkIdentity)clientSpecifiedIdentity
{
  return self->_clientSpecifiedIdentity;
}

- (void)setConnectionController:(id)a3
{
}

- (ICSharedListeningConnectionController)connectionController
{
  return self->_connectionController;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setPlaybackCoordinatorMedium:(id)a3
{
}

- (ICLiveLinkPlaybackCoordinatorMedium)playbackCoordinatorMedium
{
  return self->_playbackCoordinatorMedium;
}

- (void)setProcessingAction:(BOOL)a3
{
  self->_processingAction = a3;
}

- (BOOL)processingAction
{
  return self->_processingAction;
}

- (void)setPendingActions:(id)a3
{
}

- (NSMutableArray)pendingActions
{
  return self->_pendingActions;
}

- (void)setPendingRequests:(id)a3
{
}

- (NSMutableDictionary)pendingRequests
{
  return self->_pendingRequests;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSString)sessionKey
{
  return self->_sessionKey;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setDelegate:(id)a3
{
}

- (ICLiveLinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICLiveLinkDelegate *)WeakRetained;
}

- (void)_handlePotentiallyRecoverableError:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = self->_starting || self->_started;
  uint64_t v6 = [(ICLiveLink *)self currentRetryCount];
  [(ICLiveLink *)self setCurrentRetryCount:(v6 + 1) % ([(ICLiveLink *)self maxRetries] + 1)];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    int64_t v7 = [(ICLiveLink *)self maxRetries];
    v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v24 = self;
      __int16 v25 = 2114;
      int64_t v26 = (int64_t)v4;
      __int16 v27 = 1024;
      BOOL v28 = v6 < v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "ILL %p: QRConnection encountered error %{public}@, willRetry: %{BOOL}u", buf, 0x1Cu);
    }

    v9 = [(ICLiveLink *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v10 = [(ICLiveLink *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke;
      block[3] = &unk_1E5AC8828;
      id v19 = v9;
      v20 = self;
      id v21 = v4;
      BOOL v22 = v6 < v7;
      dispatch_async(v10, block);
    }
    if (v6 >= v7)
    {
      if ([(ICLiveLink *)self isStarted]) {
        [(ICLiveLink *)self stop];
      }
    }
    else
    {
      if (v6 >= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v6;
      }
      int64_t v12 = v11 << v6;
      int64_t v13 = [(ICLiveLink *)self maxRetryWaitPeriod];
      if (v12 >= v13) {
        int64_t v14 = v13;
      }
      else {
        int64_t v14 = v12;
      }
      v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = v14;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "ILL %p: QRConnection will retry connection after %ld seconds.", buf, 0x16u);
      }

      dispatch_time_t v16 = dispatch_time(0, 1000000000 * v14);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke_211;
      v17[3] = &unk_1E5ACCD30;
      v17[4] = self;
      v17[5] = v6;
      dispatch_after(v16, MEMORY[0x1E4F14428], v17);
    }
  }
}

uint64_t __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didEncounterError:*(void *)(a1 + 48) willRetry:*(unsigned __int8 *)(a1 + 56)];
}

void __49__ICLiveLink__handlePotentiallyRecoverableError___block_invoke_211(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40) + 1;
    int v6 = 134218496;
    int64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = [v3 maxRetries];
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ILL %p: QRConnection retry attempt %ld (max attempts: %ld)", (uint8_t *)&v6, 0x20u);
  }

  BOOL v5 = [*(id *)(a1 + 32) connectionController];
  [v5 start];
}

- (void)_didReceivePluginErrorMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  BOOL v5 = v4;
  if (!v4 || (v4[24] & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (!v5) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    goto LABEL_18;
  }
  int v7 = *((_DWORD *)v4 + 2);
  __int16 v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  int v6 = v8;
  if (v7 != 10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      if (v5[6])
      {
        unsigned int v9 = v5[2];
        if (v9 >= 0x10) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
LABEL_12:
      unsigned int v9 = 0;
LABEL_14:
      if ((0xEFFFu >> v9))
      {
        __int16 v10 = off_1E5AC8AF0[v9];
        goto LABEL_17;
      }
LABEL_15:
      objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCode-%ld", (int)v9);
      __int16 v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      *(_DWORD *)buf = 134218498;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      int64_t v14 = v10;
      __int16 v15 = 2114;
      dispatch_time_t v16 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "ILL %p: Received error code %@, message %{public}@", buf, 0x20u);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = self;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "ILL %p: Server restart. Will retry connection after termination.", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  [(ICLiveLink *)self setReceivedDisconnectionNotice:1];
  os_unfair_lock_unlock(&self->_lock);
LABEL_19:
}

- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4
{
}

- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  int v6 = [(ICLiveLink *)self forcedReconnectReason];
  int v7 = (void *)[(NSMutableDictionary *)self->_pendingRequests copy];
  [(NSMutableArray *)self->_pendingActions removeAllObjects];
  [(NSMutableDictionary *)self->_pendingRequests removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    __int16 v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICLiveLinkErrorDomain", 8620, v5, @"Connection ended with error.");
  }
  else
  {
    __int16 v8 = 0;
  }
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  __int16 v13 = __61__ICLiveLink_connectionController_connectionDidEndWithError___block_invoke;
  int64_t v14 = &unk_1E5AC8800;
  id v15 = v8;
  id v9 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:&v11];
  if (v5)
  {
    [(ICLiveLink *)self _handlePotentiallyRecoverableError:v5];
  }
  else if (v6)
  {
    __int16 v10 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 100, @"Requested reconnection because %@.", v6, v11, v12, v13, v14, v15);
    [(ICLiveLink *)self _handlePotentiallyRecoverableError:v10];
  }
  else
  {
    [(ICLiveLink *)self stop];
  }
}

uint64_t __61__ICLiveLink_connectionController_connectionDidEndWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a3 + 16))(a3, 0, *(void *)(a1 + 32));
}

- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "ILL %p: Stopping because connection controller encountered fatal error: %{public}@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    __int16 v8 = [(ICLiveLink *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ICLiveLink_connectionController_didEncounterFatalError___block_invoke;
    block[3] = &unk_1E5ACD5C8;
    id v10 = WeakRetained;
    uint64_t v11 = self;
    id v12 = v5;
    dispatch_async(v8, block);
  }
  [(ICLiveLink *)self stop];
}

uint64_t __58__ICLiveLink_connectionController_didEncounterFatalError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didEncounterError:*(void *)(a1 + 48) willRetry:0];
}

- (void)connectionControllerConnectionDidStart:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL started = self->_started;
  uint64_t v6 = [(ICLiveLink *)self currentRetryCount];
  [(ICLiveLink *)self setReceivedDisconnectionNotice:0];
  [(ICLiveLink *)self setStarted:1];
  [(ICLiveLink *)self setStarting:0];
  int v7 = [(ICLiveLink *)self deferredReconnectReason];
  [(ICLiveLink *)self setForcedReconnectReason:0];
  [(ICLiveLink *)self setDeferredReconnectReason:0];
  __int16 v8 = [(ICLiveLink *)self connectionController];
  id v9 = [v8 sessionIdentifier];
  identifier = self->_identifier;
  self->_identifier = v9;

  os_unfair_lock_unlock(p_lock);
  if (!v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (started || (objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v6 < 1 || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_14;
      }
      id v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v30 = self;
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "ILL %p: calling delegate liveLinkDidReconnect", buf, 0xCu);
      }

      __int16 v13 = [(ICLiveLink *)self delegateQueue];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke_203;
      v20 = &unk_1E5ACD4C8;
      int64_t v14 = &v21;
      id v21 = WeakRetained;
      BOOL v22 = self;
      __int16 v15 = &v17;
    }
    else
    {
      id v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v30 = self;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: calling delegate didStartLiveLink", buf, 0xCu);
      }

      __int16 v13 = [(ICLiveLink *)self delegateQueue];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      __int16 v25 = __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke;
      int64_t v26 = &unk_1E5ACD4C8;
      int64_t v14 = &v27;
      id v27 = WeakRetained;
      BOOL v28 = self;
      __int16 v15 = &v23;
    }
    dispatch_async(v13, v15);

LABEL_14:
    [(ICLiveLink *)self _performClientInfoExchangeAndInitializeQueue];

    goto LABEL_15;
  }
  [(ICLiveLink *)self reconnectWithReason:v7 options:0];
LABEL_15:
}

uint64_t __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didStartLiveLink:*(void *)(a1 + 40)];
}

uint64_t __53__ICLiveLink_connectionControllerConnectionDidStart___block_invoke_203(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLinkDidReconnect:*(void *)(a1 + 40)];
}

- (void)_performClientInfoExchangeAndInitializeQueue
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (id *)v3;
  if (v3)
  {
    *(unsigned char *)(v3 + 52) |= 1u;
    *(_DWORD *)(v3 + 48) = 1;
    id v5 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v4, v5);

    uint64_t v6 = v4[2];
    if (v6)
    {
      v6[104] |= 1u;
      *((_DWORD *)v6 + 6) = 8;
    }
  }
  else
  {
    uint64_t v24 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v24);

    uint64_t v6 = 0;
  }

  int v7 = objc_opt_new();
  if (v4) {
    id v8 = v4[2];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  -[_ICLLCommandMessage setClientInfo:]((uint64_t)v9, v7);

  id v10 = [(ICLiveLink *)self connectionController];
  uint64_t v11 = [v10 sessionToken];
  if (v4)
  {
    id v12 = v4[2];
    __int16 v13 = v12;
    if (v12)
    {
      int64_t v14 = (void *)*((void *)v12 + 2);
      goto LABEL_9;
    }
  }
  else
  {
    __int16 v13 = 0;
  }
  int64_t v14 = 0;
LABEL_9:
  id v15 = v14;
  -[_ICLLClientInfoCommand setSharedSessionToken:]((uint64_t)v15, v11);

  id v16 = [(ICLiveLink *)self identity];
  uint64_t v17 = [v16 externalIdentifier];
  if (!v4)
  {
    id v19 = 0;
    goto LABEL_18;
  }
  id v18 = v4[2];
  id v19 = v18;
  if (!v18)
  {
LABEL_18:
    v20 = 0;
    goto LABEL_12;
  }
  v20 = (void *)*((void *)v18 + 2);
LABEL_12:
  id v21 = v20;
  -[_ICLLClientInfoCommand setExternalId:]((uint64_t)v21, v17);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke;
  v27[3] = &unk_1E5ACC7B0;
  v27[4] = self;
  BOOL v22 = (void *)MEMORY[0x1A6240BF0](v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_3;
  v25[3] = &unk_1E5AC87D8;
  v25[4] = self;
  id v26 = v22;
  id v23 = v22;
  [(ICLiveLink *)self sendMessage:v4 completion:v25];
}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_2;
    block[3] = &unk_1E5ACD5C8;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    id v11 = v3;
    dispatch_async(v5, block);
  }
  [*(id *)(a1 + 32) stop];
}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3) {
    goto LABEL_25;
  }
  if (v5)
  {
    uint64_t v7 = (id *)v5[1];
    if (v7)
    {
      id v8 = v7;
      id v9 = v7[4];
      if (!v9 || (v9[20] & 2) == 0) {
        goto LABEL_6;
      }
      int v10 = *((_DWORD *)v9 + 4);

      if (v10 != 1) {
        goto LABEL_12;
      }
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      BOOL v11 = [*(id *)(a1 + 32) currentRetryCount] > 0;
      [*(id *)(a1 + 32) setCurrentRetryCount:0];
      id v12 = (id *)v6[1];
      __int16 v13 = v12;
      if (v12)
      {
        int64_t v14 = v12[4];
        if (v14)
        {
          uint64_t v15 = v14[1];
LABEL_11:
          *(void *)(*(void *)(a1 + 32) + 112) = v15;

          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
          id v16 = *(void **)(a1 + 32);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_4;
          v24[3] = &unk_1E5AC87B0;
          v24[4] = v16;
          id v25 = *(id *)(a1 + 40);
          BOOL v26 = v11;
          [v16 _updateParticipantsWithReason:@"InitialSync" completion:v24];

          goto LABEL_25;
        }
      }
      else
      {
        int64_t v14 = 0;
      }
      uint64_t v15 = 0;
      goto LABEL_11;
    }
  }
  id v9 = 0;
  id v8 = 0;
LABEL_6:

  int v10 = 0;
LABEL_12:
  uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (v10)
    {
      if (v10 == 2)
      {
        id v19 = @"INVALID TOKEN";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCode-%ld", v10);
        id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v19 = @"UNKNOWN";
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v28 = v18;
    __int16 v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "ILL %p: received unexpected status %{public}@ for Client Info. Stopping.", buf, 0x16u);
  }
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = (void *)MEMORY[0x1E4F28C58];
  if (v10)
  {
    if (v10 == 2)
    {
      BOOL v22 = @"INVALID TOKEN";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCode-%ld", v10);
      BOOL v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v22 = @"UNKNOWN";
  }
  id v23 = objc_msgSend(v21, "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 4, @"Unexpected client info status %@", v22);
  (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v23);

LABEL_25:
}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqual:@"ICLiveLinkErrorDomain"])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 8620) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "ILL %p: stopping live link [failed to load initial participants] error=%{public}@", buf, 0x16u);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICLiveLinkErrorDomain", 3, v4, @"Failed to load initial participants");
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_186;
    v12[3] = &unk_1E5AC87B0;
    v12[4] = v7;
    id v13 = *(id *)(a1 + 40);
    char v14 = *(unsigned char *)(a1 + 48);
    [v7 _updateQueueWithReason:@"InitialSync" completion:v12];
  }
LABEL_10:
}

void __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqual:@"ICLiveLinkErrorDomain"])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 8620) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    BOOL v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 134218242;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ILL %p: stopping live link [failed to load initial queue] error=%{public}@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    char v14 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICLiveLinkErrorDomain", 2, v4, @"Failed to load initial queue");
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  else
  {
    uint64_t v7 = @"ResyncAfterRetry";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v7 = @"ResyncAfterConnect";
    }
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = v7;
    uint64_t v10 = [v8 playbackCoordinatorMedium];
    [v10 synchronizePlaybackStateForReason:v9];
  }
LABEL_12:
}

uint64_t __58__ICLiveLink__performClientInfoExchangeAndInitializeQueue__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didEncounterError:*(void *)(a1 + 48) willRetry:0];
}

- (void)_updatePlaybackControlSettingsWithReason:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (id *)v8;
  if (v8)
  {
    *(unsigned char *)(v8 + 52) |= 1u;
    *(_DWORD *)(v8 + 48) = 4;
    uint64_t v10 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v9, v10);

    BOOL v11 = v9[4];
    if (v11)
    {
      v11[48] |= 1u;
      *((_DWORD *)v11 + 8) = 3;
    }
  }
  else
  {
    BOOL v22 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v22);

    BOOL v11 = 0;
  }

  uint64_t v12 = objc_opt_new();
  if (v9) {
    id v13 = v9[4];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = v12;
  if (v14)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery]((uint64_t)v14);
    *((unsigned char *)v14 + 48) |= 1u;
    *((_DWORD *)v14 + 8) = 3;
    objc_storeStrong((id *)v14 + 2, v12);
  }

  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  __int16 v17 = [v16 UUIDString];

  -[_ICLLProtocolMessage setTraceId:]((uint64_t)v9, v17);
  uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = self;
    __int16 v29 = 2114;
    id v30 = v6;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: _updatePlaybackControlSettingsWithReason [requesting] reason=%{public}@ traceID=%{public}@", buf, 0x20u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__ICLiveLink__updatePlaybackControlSettingsWithReason_completion___block_invoke;
  v23[3] = &unk_1E5AC88F0;
  v23[4] = self;
  id v24 = v6;
  id v25 = v17;
  id v26 = v7;
  id v19 = v17;
  id v20 = v6;
  id v21 = v7;
  [(ICLiveLink *)self sendMessage:v9 completion:v23];
}

void __66__ICLiveLink__updatePlaybackControlSettingsWithReason_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = a1[7];
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
    goto LABEL_18;
  }
  if (!v5 || (uint64_t v8 = (id *)v5[4]) == 0)
  {
    BOOL v11 = 0;
    uint64_t v9 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  id v10 = v8[2];
  BOOL v11 = v10;
  if (!v10)
  {
LABEL_20:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = (void *)*((void *)v10 + 1);
LABEL_8:
  id v13 = v12;

  id v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink_Oversize");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[6];
    int v22 = 134218754;
    uint64_t v23 = v15;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v17;
    __int16 v28 = 2114;
    id v29 = v13;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: _updatePlaybackControlSettingsWithReason [received response] reason=%{public}@ traceID=%{public}@ settings=%{public}@", (uint8_t *)&v22, 0x2Au);
  }

  if (v13)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 2, @"received no playback control settings in response");
    id v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = a1[4];
      int v22 = 134217984;
      uint64_t v23 = v20;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "ILL %p: received no playback control settings in response", (uint8_t *)&v22, 0xCu);
    }
  }
  uint64_t v21 = a1[7];
  if (v21) {
    (*(void (**)(uint64_t, id, void *))(v21 + 16))(v21, v13, v18);
  }

LABEL_18:
}

- (void)_updateQueueWithReason:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (id *)v8;
  if (v8)
  {
    *(unsigned char *)(v8 + 52) |= 1u;
    *(_DWORD *)(v8 + 48) = 4;
    id v10 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v9, v10);

    BOOL v11 = v9[4];
    if (v11)
    {
      v11[48] |= 1u;
      *((_DWORD *)v11 + 8) = 1;
    }
  }
  else
  {
    int v22 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v22);

    BOOL v11 = 0;
  }

  uint64_t v12 = objc_opt_new();
  if (v9) {
    id v13 = v9[4];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = v12;
  if (v14)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery]((uint64_t)v14);
    *((unsigned char *)v14 + 48) |= 1u;
    *((_DWORD *)v14 + 8) = 1;
    objc_storeStrong((id *)v14 + 5, v12);
  }

  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v17 = [v16 UUIDString];

  -[_ICLLProtocolMessage setTraceId:]((uint64_t)v9, v17);
  uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v28 = self;
    __int16 v29 = 2114;
    id v30 = v6;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateQueueWithReason [requesting] reason=%{public}@ traceID=%{public}@", buf, 0x20u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__ICLiveLink__updateQueueWithReason_completion___block_invoke;
  v23[3] = &unk_1E5AC88F0;
  v23[4] = self;
  id v24 = v6;
  id v25 = v17;
  id v26 = v7;
  id v19 = v17;
  id v20 = v6;
  id v21 = v7;
  [(ICLiveLink *)self sendMessage:v9 completion:v23];
}

void __48__ICLiveLink__updateQueueWithReason_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = a1[7];
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
    goto LABEL_24;
  }
  if (v5)
  {
    id v8 = v5[4];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = (void *)*((void *)v8 + 5);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = 0;
LABEL_7:
  BOOL v11 = v10;

  if (v11) {
    uint64_t v12 = (void *)v11[2];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  id v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink_Oversize");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[6];
    int v30 = 134218754;
    uint64_t v31 = v15;
    __int16 v32 = 2114;
    uint64_t v33 = v16;
    __int16 v34 = 2114;
    uint64_t v35 = v17;
    __int16 v36 = 2114;
    id v37 = v13;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateQueueWithReason [received response] reason=%{public}@ traceID=%{public}@ queue=%{public}@", (uint8_t *)&v30, 0x2Au);
  }

  if (!v13)
  {
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 2, @"received no queue in response");
    id v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = a1[4];
      int v30 = 134217984;
      uint64_t v31 = v28;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "ILL %p: received no queue in response.", (uint8_t *)&v30, 0xCu);
    }
    goto LABEL_21;
  }
  uint64_t v18 = (void *)a1[4];
  if (v11) {
    id v19 = (void *)v11[1];
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;
  if (!v5 || (id v21 = (id *)v5[4]) == 0)
  {
    id v24 = 0;
    int v22 = 0;
    goto LABEL_30;
  }
  int v22 = v21;
  id v23 = v21[5];
  id v24 = v23;
  if (!v23)
  {
LABEL_30:
    id v25 = 0;
    goto LABEL_18;
  }
  id v25 = (void *)*((void *)v23 + 3);
LABEL_18:
  id v26 = v25;
  [v18 _handleUpdatedQueue:v13 playbackControlSettings:v20 serverQueueContext:v26];

  uint64_t v27 = 0;
LABEL_21:

  uint64_t v29 = a1[7];
  if (v29) {
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v27);
  }

LABEL_24:
}

- (void)_updateParticipantsWithReason:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (id *)v8;
  if (v8)
  {
    *(unsigned char *)(v8 + 52) |= 1u;
    *(_DWORD *)(v8 + 48) = 4;
    id v10 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v9, v10);

    BOOL v11 = v9[4];
    if (v11)
    {
      v11[48] |= 1u;
      *((_DWORD *)v11 + 8) = 4;
    }
  }
  else
  {
    int v22 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v22);

    BOOL v11 = 0;
  }

  uint64_t v12 = objc_opt_new();
  if (v9) {
    id v13 = v9[4];
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  id v15 = v12;
  if (v14)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery]((uint64_t)v14);
    *((unsigned char *)v14 + 48) |= 1u;
    *((_DWORD *)v14 + 8) = 4;
    objc_storeStrong((id *)v14 + 1, v12);
  }

  uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v17 = [v16 UUIDString];

  -[_ICLLProtocolMessage setTraceId:]((uint64_t)v9, v17);
  uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = self;
    __int16 v29 = 2114;
    id v30 = v6;
    __int16 v31 = 2114;
    __int16 v32 = v17;
    _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateParticipantsWithReason [requesting] reason=%{public}@ traceID=%{public}@", buf, 0x20u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__ICLiveLink__updateParticipantsWithReason_completion___block_invoke;
  v23[3] = &unk_1E5AC88F0;
  v23[4] = self;
  id v24 = v6;
  id v25 = v17;
  id v26 = v7;
  id v19 = v17;
  id v20 = v6;
  id v21 = v7;
  [(ICLiveLink *)self sendMessage:v9 completion:v23];
}

void __55__ICLiveLink__updateParticipantsWithReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
    goto LABEL_21;
  }
  if (!v5)
  {
    uint64_t v9 = 0;
    goto LABEL_23;
  }
  id v8 = v5[4];
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_23:
    id v10 = 0;
    goto LABEL_7;
  }
  id v10 = (void *)*((void *)v8 + 1);
LABEL_7:
  BOOL v11 = v10;

  uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink_Oversize");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    if (v11) {
      uint64_t v16 = (void *)v11[1];
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;
    int v24 = 134218754;
    uint64_t v25 = v14;
    __int16 v26 = 2114;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    uint64_t v29 = v15;
    __int16 v30 = 2114;
    id v31 = v17;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: _updateParticipantsWithReason [received response] reason=%{public}@ traceID=%{public}@ participants=%{public}@", (uint8_t *)&v24, 0x2Au);
  }
  if (v11) {
    uint64_t v18 = (void *)v11[1];
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    [*(id *)(a1 + 32) _handleUpdatedParticipantQuery:v11];
    id v20 = 0;
  }
  else
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICLiveLinkErrorDomain", 3, @"received no participants in response");
    id v21 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      int v24 = 134217984;
      uint64_t v25 = v22;
      _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "ILL %p: received no participants in response.", (uint8_t *)&v24, 0xCu);
    }
  }
  uint64_t v23 = *(void *)(a1 + 56);
  if (v23) {
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v20);
  }

LABEL_21:
}

- (void)_storeTraceID:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ICLiveLink.m", 1337, @"Invalid parameter not satisfying: %@", @"traceID" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"ICLiveLink.m", 1338, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_pendingRequests objectForKeyedSubscript:v13];

  if (v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ICLiveLink.m", 1340, @"Attempted to overwrite completion handler for traceID %@", v13 object file lineNumber description];
  }
  uint64_t v9 = (void *)MEMORY[0x1A6240BF0](v7);
  [(NSMutableDictionary *)self->_pendingRequests setObject:v9 forKeyedSubscript:v13];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_processPendingActions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSMutableArray *)self->_pendingActions count];
  if (v5 < 1 || self->_processingAction)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
    self->_processingAction = 1;
  }
  id v7 = [(NSMutableArray *)self->_pendingActions firstObject];
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      id v29 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEBUG, "ILL %p: _processPendingActions: [processing action] action=%p", buf, 0x16u);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F77968]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __36__ICLiveLink__processPendingActions__block_invoke;
    v23[3] = &unk_1E5AC8EA0;
    SEL v25 = a2;
    v23[4] = self;
    id v10 = v7;
    id v24 = v10;
    BOOL v11 = (void *)[v9 initWithDeallocHandler:v23];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __36__ICLiveLink__processPendingActions__block_invoke_2;
    v18[3] = &unk_1E5AC8788;
    id v19 = v11;
    id v20 = self;
    id v12 = v10;
    id v21 = v12;
    SEL v22 = a2;
    id v13 = v11;
    uint64_t v14 = (void (**)(void))MEMORY[0x1A6240BF0](v18);
    if (v12 && (*((unsigned char *)v12 + 148) & 2) != 0)
    {
      switch(*((_DWORD *)v12 + 4))
      {
        case 0:
          break;
        case 1:
          [(ICLiveLink *)self _didReceivePlaybackSyncAction:v12 completion:v14];
          goto LABEL_14;
        case 2:
          [(ICLiveLink *)self _didReceiveAddItemsAction:v12 completion:v14];
          goto LABEL_14;
        case 3:
          [(ICLiveLink *)self _didReceiveRemoveItemAction:v12 completion:v14];
          goto LABEL_14;
        case 4:
          [(ICLiveLink *)self _didReceiveMoveItemAction:v12 completion:v14];
          goto LABEL_14;
        case 5:
          [(ICLiveLink *)self _didReceiveCurrentItemChangeAction:v12 completion:v14];
          goto LABEL_14;
        case 6:
          [(ICLiveLink *)self _didReceiveReactionAction:v12 completion:v14];
          goto LABEL_14;
        case 7:
          [(ICLiveLink *)self _didReceiveParticipantChangeAction:v12 completion:v14];
          goto LABEL_14;
        case 8:
          [(ICLiveLink *)self _didReceiveServerNoticeAction:v12 completion:v14];
          goto LABEL_14;
        case 9:
          uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v27 = self;
          __int16 v28 = 2114;
          id v29 = v12;
          uint64_t v16 = "ILL %p: Received ClientInfo action with no matching completion %{public}@";
          goto LABEL_12;
        case 0xA:
          [(ICLiveLink *)self _didReceiveReplaceQueueItemsAction:v12 completion:v14];
          goto LABEL_14;
        case 0xB:
          [(ICLiveLink *)self _didReceivePlayNowQueueItemsAction:v12 completion:v14];
          goto LABEL_14;
        case 0xC:
          [(ICLiveLink *)self _didReceiveCurrentItemTransitionAction:v12 completion:v14];
          goto LABEL_14;
        case 0xD:
          [(ICLiveLink *)self _didReceiveQueueSyncAction:v12 completion:v14];
          goto LABEL_14;
        default:
          uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v27 = self;
          __int16 v28 = 2114;
          id v29 = v12;
          uint64_t v16 = "ILL %p: Received unknown action %{public}@";
          goto LABEL_12;
      }
    }
    uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = self;
      __int16 v28 = 2114;
      id v29 = v12;
      uint64_t v16 = "ILL %p: Received invalid action %{public}@";
LABEL_12:
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
    }
LABEL_13:

    v14[2](v14);
LABEL_14:
  }
  else if (v7)
  {
    id v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      id v29 = v7;
      __int16 v30 = 2048;
      uint64_t v31 = v5;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEBUG, "ILL %p: _processPendingActions: [action already in flight] action=%p pendingActionCount=%ld", buf, 0x20u);
    }
  }
}

void __36__ICLiveLink__processPendingActions__block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[4];
  id v7 = v2;
  if (!v3) {
    goto LABEL_5;
  }
  if ((*(unsigned char *)(v3 + 148) & 2) == 0)
  {
    LODWORD(v3) = 0;
LABEL_5:
    char v6 = off_1E5AC8A80[v3];
    goto LABEL_7;
  }
  LODWORD(v3) = *(_DWORD *)(v3 + 16);
  if (v3 < 0xE) {
    goto LABEL_5;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"UnknownAction-%ld", (int)v3);
  char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v7;
LABEL_7:
  [v2 handleFailureInMethod:v4, v5, @"ICLiveLink.m", 1249, @"LiveLink action completion handler not called: %@", v6 object file lineNumber description];
}

uint64_t __36__ICLiveLink__processPendingActions__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disarm];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  if ([*(id *)(*(void *)(a1 + 40) + 72) count])
  {
    v2 = [*(id *)(*(void *)(a1 + 40) + 72) firstObject];
    if (*(void **)(a1 + 48) != v2)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"ICLiveLink.m", 1257, @"Unexpected state (pending actions dequeued while processing) action=%@ firstAction=%@", *(void *)(a1 + 48), v2 object file lineNumber description];
    }
    [*(id *)(*(void *)(a1 + 40) + 72) removeObjectAtIndex:0];
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 9) = 0;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 72) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218496;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEBUG, "ILL %p: _processPendingActions: [completed action] action=%p pendingActionCount=%ld", buf, 0x20u);
  }

  return [*(id *)(a1 + 40) _processPendingActions];
}

- (id)_participantForParticipantID:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_participants;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "serverID", (void)v15) == a3)
        {
          uint64_t v13 = [v12 copy];

          id v9 = (void *)v13;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)_participantForAction:(id)a3
{
  if (a3) {
    a3 = (id)*((void *)a3 + 1);
  }
  return [(ICLiveLink *)self _participantForParticipantID:a3];
}

- (void)_handleUpdatedQueue:(id)a3 playbackControlSettings:(id)a4 serverQueueContext:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = [[ICSharedListeningQueue alloc] initWithProtobuf:v10 serverQueueContext:v8 liveLink:self playbackControlSettings:v9];

  os_unfair_lock_lock(&self->_lock);
  int64_t v12 = [(ICSharedListeningQueue *)self->_queue serverRevision];
  uint64_t v13 = [(ICSharedListeningQueue *)v11 serverRevision];
  BOOL v14 = [(ICSharedListeningQueue *)self->_queue isAutoPlayEnabled];
  BOOL v15 = [(ICSharedListeningQueue *)v11 isAutoPlayEnabled];
  int v16 = [(ICSharedListeningQueue *)self->_queue isAutoPlayAvailable];
  int v17 = [(ICSharedListeningQueue *)v11 isAutoPlayAvailable];
  int v18 = v17;
  if (v13 > v12 || ((v14 ^ v15) & 1) != 0 || v16 != v17)
  {
    objc_storeStrong((id *)&self->_queue, v11);
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219520;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      int64_t v29 = v12;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      __int16 v32 = 1024;
      int v33 = v16;
      __int16 v34 = 1024;
      int v35 = v18;
      __int16 v36 = 1024;
      BOOL v37 = v14;
      __int16 v38 = 1024;
      BOOL v39 = v15;
      _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "ILL %p: _handleUpdatedQueue [serverRevision:(%ld --> %ld), isAutoPlayAvailable:(%{BOOL}u --> %{BOOL}u), isAutoPlayEnabled:(%{BOOL}u --> %{BOOL}u)]", buf, 0x38u);
    }

    id v19 = [(ICLiveLink *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v21 = [(ICLiveLink *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__ICLiveLink__handleUpdatedQueue_playbackControlSettings_serverQueueContext___block_invoke;
      block[3] = &unk_1E5ACD5C8;
      id v19 = v19;
      uint64_t v23 = v19;
      id v24 = self;
      SEL v25 = v11;
      dispatch_async(v21, block);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      int64_t v29 = v12;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "ILL %p: _handleUpdatedQueue dropping queue update [client already has newer revision] currentRevision=%ld updatedRevision=%ld", buf, 0x20u);
    }
  }
}

uint64_t __77__ICLiveLink__handleUpdatedQueue_playbackControlSettings_serverQueueContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didUpdateQueue:*(void *)(a1 + 48)];
}

- (void)_handleUpdatedParticipantQuery:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v5 = (void *)*((void *)a3 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke;
  v16[3] = &unk_1E5AC8760;
  v16[4] = self;
  v16[5] = a2;
  uint64_t v7 = objc_msgSend(v6, "msv_map:", v16);

  os_unfair_lock_lock(&self->_lock);
  if (self->_localParticipantServerID)
  {
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_participants];
    objc_storeStrong((id *)&self->_participants, v7);
    os_unfair_lock_unlock(&self->_lock);
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    if (([v8 isEqual:v9] & 1) == 0)
    {
      id v10 = [(ICLiveLink *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        __int16 v11 = [(ICLiveLink *)self delegateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_3;
        block[3] = &unk_1E5ACD5C8;
        id v13 = v10;
        BOOL v14 = self;
        id v15 = v7;
        dispatch_async(v11, block);
      }
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      int v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "ILL %p: Dropping participants [waiting for clientInfo] %{public}@", buf, 0x16u);
    }
  }
}

id __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [ICLiveLinkIdentity alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_2;
  v8[3] = &unk_1E5AC8738;
  id v9 = v3;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  id v6 = [(ICLiveLinkIdentity *)v4 _initWithBlock:v8];

  return v6;
}

uint64_t __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didUpdateParticipants:*(void *)(a1 + 48)];
}

void __45__ICLiveLink__handleUpdatedParticipantQuery___block_invoke_2(void *a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = a1[4];
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  [v16 setServerID:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = (void *)a1[4];
  if (v6) {
    id v6 = (void *)v6[3];
  }
  uint64_t v7 = v6;
  id v8 = (void *)[v5 initWithUUIDString:v7];

  if (!v8)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = a1[5];
    uint64_t v12 = a1[6];
    BOOL v14 = (void *)a1[4];
    if (v14) {
      BOOL v14 = (void *)v14[3];
    }
    id v15 = v14;
    [v11 handleFailureInMethod:v12, v13, @"ICLiveLink.m", 1143, @"Received invalid UUID from server: %@", v15 object file lineNumber description];
  }
  [v16 setIdentifier:v8];
  id v9 = (void *)a1[4];
  if (v9) {
    id v9 = (void *)v9[2];
  }
  long long v10 = v9;
  [v16 setExternalIdentifier:v10];
}

- (void)_handleReceivedMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4) {
    Class isa = v4[5].isa;
  }
  else {
    Class isa = 0;
  }
  uint64_t v7 = isa;

  if (!v7) {
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_lock);
  pendingRequests = self->_pendingRequests;
  Class v9 = v5 ? v5[5].isa : 0;
  long long v10 = v9;
  __int16 v11 = [(NSMutableDictionary *)pendingRequests objectForKeyedSubscript:v10];

  uint64_t v12 = self->_pendingRequests;
  Class v13 = v5 ? v5[5].isa : 0;
  BOOL v14 = v13;
  [(NSMutableDictionary *)v12 setObject:0 forKeyedSubscript:v14];

  os_unfair_lock_unlock(&self->_lock);
  if (v11)
  {
    ((void (**)(void, NSObject *, void))v11)[2](v11, v5, 0);
  }
  else
  {
LABEL_11:
    if (v5 && (BYTE4(v5[6].isa) & 1) != 0)
    {
      switch(LODWORD(v5[6].isa))
      {
        case 0:
        case 1:
        case 4:
          goto LABEL_13;
        case 2:
          id v15 = v5[1].isa;
          id v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            int v17 = 134218242;
            int v18 = self;
            __int16 v19 = 2114;
            uint64_t v20 = v15;
            _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEBUG, "ILL %p: _handleReceivedMessage enqueuing action: %{public}@", (uint8_t *)&v17, 0x16u);
          }

          os_unfair_lock_lock(&self->_lock);
          [(NSMutableArray *)self->_pendingActions addObject:v15];
          os_unfair_lock_unlock(&self->_lock);
          [(ICLiveLink *)self _processPendingActions];
          goto LABEL_15;
        case 3:
          id v15 = v5[3].isa;
          [(ICLiveLink *)self _didReceivePluginErrorMessage:v15];
          goto LABEL_15;
        default:
          break;
      }
    }
    else
    {
LABEL_13:
      id v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 134218242;
        int v18 = self;
        __int16 v19 = 2114;
        uint64_t v20 = v5;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "ILL %p: Received unhandled message %{public}@", (uint8_t *)&v17, 0x16u);
      }
LABEL_15:
    }
  }
}

- (void)_emitSessionEventIfNeededForAction:(id)a3 disconnectedParticipant:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || !*((unsigned char *)v6 + 144))
  {
    long long v10 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    if (v6) {
      __int16 v11 = (void *)*((void *)v6 + 10);
    }
    else {
      __int16 v11 = 0;
    }
    uint64_t v12 = v11;
    int v19 = 134218242;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    int64_t v22 = (int64_t)v12;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ParticipantChangeAction with displayNotice=NO %{public}@", (uint8_t *)&v19, 0x16u);
LABEL_16:

    goto LABEL_22;
  }
  os_unfair_lock_lock(&self->_lock);
  int64_t localParticipantServerID = self->_localParticipantServerID;
  uint64_t v9 = *((void *)v6 + 1);
  os_unfair_lock_unlock(&self->_lock);
  if (v9 == localParticipantServerID)
  {
    long long v10 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218240;
      uint64_t v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = localParticipantServerID;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ParticipantChangeAction for the local participant: %lld", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_22;
  }
  Class v13 = (unsigned int *)*((id *)v6 + 10);
  if (v13 && (v13[7] & 2) != 0)
  {
    uint64_t v14 = v13[6];
    switch((int)v14)
    {
      case 1:
        break;
      case 2:
        uint64_t v14 = 4;
        goto LABEL_13;
      case 3:
        uint64_t v14 = 2;
        break;
      case 4:
        uint64_t v14 = 3;
        goto LABEL_13;
      case 5:
        uint64_t v14 = 5;
        goto LABEL_13;
      default:
        goto LABEL_12;
    }

    id v15 = [(ICLiveLink *)self _participantForAction:v6];
  }
  else
  {
LABEL_12:
    uint64_t v14 = 0;
LABEL_13:

    id v15 = v7;
  }
  long long v10 = v15;
  if (v15)
  {
    uint64_t v12 = [[ICLiveLinkSessionEvent alloc] initWithKind:v14];
    id v16 = +[ICLiveLinkEvent eventWithSessionEvent:v12 participant:v10];
    [(ICLiveLink *)self receivedEvent:v16];

    goto LABEL_16;
  }
  int v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int64_t v18 = *((void *)v6 + 1);
    int v19 = 134218240;
    uint64_t v20 = self;
    __int16 v21 = 2048;
    int64_t v22 = v18;
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "ILL %p: Received Participant Join/Connect for unknown participant ID = %ld", (uint8_t *)&v19, 0x16u);
  }

  long long v10 = 0;
LABEL_22:
}

- (void)_didReceiveServerNoticeAction:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = (id *)*((id *)v6 + 17)) != 0)
  {
    uint64_t v9 = v8;
    if (*((unsigned char *)v6 + 144))
    {
      long long v10 = [ICLiveLinkCustomEvent alloc];
      id v11 = v9[1];
      uint64_t v12 = [(ICLiveLinkCustomEvent *)v10 initWithLocalizedMessage:v11];

      Class v13 = [(ICLiveLink *)self _participantForAction:v6];
      uint64_t v14 = +[ICLiveLinkEvent eventWithCustomEvent:v12 participant:v13];

      [(ICLiveLink *)self receivedEvent:v14];
      v7[2](v7);
    }
    else
    {
      id v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 134218242;
        int64_t v18 = self;
        __int16 v19 = 2114;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "ILL %p: Received ServerNoticeAction with displayNotice=NO %{public}@", (uint8_t *)&v17, 0x16u);
      }

      v7[2](v7);
    }
  }
  else
  {
    id v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218242;
      int64_t v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = (id *)v6;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ServerNoticeAction %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v7[2](v7);
    uint64_t v9 = 0;
  }
}

- (void)_didReceiveReplaceQueueItemsAction:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = v6[16]) != 0)
  {
    uint64_t v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke;
    v12[3] = &unk_1E5ACB550;
    id v16 = v7;
    id v10 = v9;
    id v13 = v10;
    uint64_t v14 = self;
    id v15 = v6;
    [(ICLiveLink *)self _updateQueueWithReason:@"ServerAction[ReplaceQueueItems]" completion:v12];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ReplaceQueueItemsAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    id v10 = 0;
  }
}

void __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4 || (id v5 = *(id *)(v4 + 24)) == 0)
    {
      id v6 = *(void **)(a1 + 32);
      if (v6) {
        id v6 = (void *)v6[2];
      }
      id v7 = v6;
      uint64_t v8 = [v7 firstObject];
      uint64_t v9 = (void *)v8;
      if (v8) {
        id v10 = *(void **)(v8 + 24);
      }
      else {
        id v10 = 0;
      }
      id v5 = v10;

      id v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        uint64_t v26 = v12;
        __int16 v27 = 2114;
        id v28 = v5;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ReplaceQueueItemsAction without preferredPlayItemId, using first itemId: %{public}@", buf, 0x16u);
      }
    }
    id v13 = [*(id *)(a1 + 40) participants];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke_130;
    v23[3] = &unk_1E5AC8710;
    id v24 = *(id *)(a1 + 48);
    uint64_t v14 = objc_msgSend(v13, "msv_firstWhere:", v23);

    [*(id *)(a1 + 40) receivedCurrentItemIdentifier:v5 fromParticipant:v14];
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15 && *(unsigned char *)(v15 + 144))
    {
      id v16 = [[ICLiveLinkQueueEventContentReplaced alloc] initWithStartItemIdentifier:v5];
      int v17 = +[ICLiveLinkQueueEvent queueEventWithContentReplaced:v16];
      int64_t v18 = [*(id *)(a1 + 40) _participantForAction:*(void *)(a1 + 48)];
      __int16 v19 = +[ICLiveLinkEvent eventWithQueueEvent:v17 participant:v18];

      [*(id *)(a1 + 40) receivedEvent:v19];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v22 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        uint64_t v26 = v21;
        __int16 v27 = 2114;
        id v28 = v22;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "ILL %p: Received ReplaceQueueItemsAction with displayNotice=NO %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

BOOL __60__ICLiveLink__didReceiveReplaceQueueItemsAction_completion___block_invoke_130(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverID];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
  return v3 == v4;
}

- (void)_didReceiveRemoveItemAction:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (uint64_t v8 = (id *)*((id *)v6 + 15)) != 0)
  {
    uint64_t v9 = v8;
    if (*((unsigned char *)v6 + 144))
    {
      id v10 = [ICLiveLinkQueueEventContentRemoved alloc];
      id v11 = v9[1];
      uint64_t v12 = [(ICLiveLinkQueueEventContentRemoved *)v10 initWithItemIdentifier:v11];

      id v13 = +[ICLiveLinkQueueEvent queueEventWithContentRemoved:v12];
      uint64_t v14 = [(ICLiveLink *)self _participantForAction:v6];
      uint64_t v15 = +[ICLiveLinkEvent eventWithQueueEvent:v13 participant:v14];

      [(ICLiveLink *)self receivedEvent:v15];
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = self;
        __int16 v21 = 2114;
        int64_t v22 = v9;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: Received RemoveItemAction with displayNotice=NO %{public}@", buf, 0x16u);
      }
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__ICLiveLink__didReceiveRemoveItemAction_completion___block_invoke;
    v17[3] = &unk_1E5ACAC90;
    int64_t v18 = v7;
    [(ICLiveLink *)self _updateQueueWithReason:@"ServerAction[RemoveItem]" completion:v17];
  }
  else
  {
    id v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      int64_t v22 = (id *)v6;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid RemoveItemAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    uint64_t v9 = 0;
  }
}

uint64_t __53__ICLiveLink__didReceiveRemoveItemAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didReceiveReactionAction:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (uint64_t v8 = (id *)*((id *)v6 + 14)) != 0)
  {
    uint64_t v9 = v8;
    if (*((unsigned char *)v6 + 144))
    {
      id v10 = [ICLiveLinkReactionEvent alloc];
      id v11 = v9[2];
      id v12 = v9[3];
      id v13 = v9[1];
      uint64_t v14 = [(ICLiveLinkReactionEvent *)v10 initWithReaction:v11 reactionIdentifier:v12 itemIdentifier:v13];

      uint64_t v15 = [(ICLiveLink *)self _participantForAction:v6];
      id v16 = +[ICLiveLinkEvent eventWithReactionEvent:v14 participant:v15];

      [(ICLiveLink *)self receivedEvent:v16];
      v7[2](v7);
    }
    else
    {
      int v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 134218242;
        uint64_t v20 = self;
        __int16 v21 = 2114;
        int64_t v22 = v9;
        _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "ILL %p: Received ReactionAction with displayNotice=NO %{public}@", (uint8_t *)&v19, 0x16u);
      }

      v7[2](v7);
    }
  }
  else
  {
    int64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134218242;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      int64_t v22 = (id *)v6;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ReactionAction %{public}@", (uint8_t *)&v19, 0x16u);
    }

    v7[2](v7);
    uint64_t v9 = 0;
  }
}

- (void)_didReceiveQueueSyncAction:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    uint64_t v8 = (id *)v6[13];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = v8[2];
      id v11 = v9[1];
      id v12 = v9[3];
      [(ICLiveLink *)self _handleUpdatedQueue:v10 playbackControlSettings:v11 serverQueueContext:v12];

      if (*((unsigned char *)v6 + 144))
      {
        id v13 = v6[7];
        if (v13)
        {
          os_log_t v14 = (os_log_t)v13;
          uint64_t v15 = [ICLiveLinkQueueEventContentUpdatedMessage alloc];
          id v16 = v14[2].isa;
          int v17 = v14[1].isa;
          int64_t v18 = [(ICLiveLinkQueueEventContentUpdatedMessage *)v15 initWithLocalizedTitle:v16 localizedMessage:v17];

          int v19 = +[ICLiveLinkQueueEvent queueEventWithContentUpdatedMessage:v18];
          uint64_t v20 = [(ICLiveLink *)self _participantForAction:v6];
          __int16 v21 = +[ICLiveLinkEvent eventWithQueueEvent:v19 participant:v20];

          [(ICLiveLink *)self receivedEvent:v21];
LABEL_11:

          goto LABEL_15;
        }
        os_log_t v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        int v24 = 134218242;
        SEL v25 = self;
        __int16 v26 = 2114;
        __int16 v27 = v9;
        int64_t v22 = "ILL %p: Received QueueSyncAction with displayNotice=YES but no DisplayMessage %{public}@";
      }
      else
      {
        os_log_t v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        int v24 = 134218242;
        SEL v25 = self;
        __int16 v26 = 2114;
        __int16 v27 = v9;
        int64_t v22 = "ILL %p: Received QueueSyncAction with displayNotice=NO %{public}@";
      }
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v24, 0x16u);
      goto LABEL_11;
    }
  }
  uint64_t v23 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v24 = 134218242;
    SEL v25 = self;
    __int16 v26 = 2114;
    __int16 v27 = v6;
    _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid QueueSyncAction %{public}@", (uint8_t *)&v24, 0x16u);
  }

  uint64_t v9 = 0;
LABEL_15:
  v7[2](v7);
}

- (void)_didReceivePlayNowQueueItemsAction:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = v6[11]) != 0)
  {
    uint64_t v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke;
    v12[3] = &unk_1E5ACB550;
    id v16 = v7;
    id v10 = v9;
    id v13 = v10;
    os_log_t v14 = self;
    uint64_t v15 = v6;
    [(ICLiveLink *)self _updateQueueWithReason:@"ServerAction[PlayNowQueueItems]" completion:v12];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid PlayNowQueueItemsAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    id v10 = 0;
  }
}

void __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4 || (id v5 = *(id *)(v4 + 24)) == 0)
    {
      id v6 = *(void **)(a1 + 32);
      if (v6) {
        id v6 = (void *)v6[1];
      }
      id v7 = v6;
      uint64_t v8 = [v7 firstObject];
      uint64_t v9 = (void *)v8;
      if (v8) {
        id v10 = *(void **)(v8 + 24);
      }
      else {
        id v10 = 0;
      }
      id v5 = v10;

      id v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "ILL %p: Received PlayNowQueueItemsAction without preferredPlayItemId, using first itemId: %{public}@", buf, 0x16u);
      }
    }
    id v13 = [*(id *)(a1 + 40) participants];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_118;
    v38[3] = &unk_1E5AC8710;
    id v39 = *(id *)(a1 + 48);
    os_log_t v14 = objc_msgSend(v13, "msv_firstWhere:", v38);

    [*(id *)(a1 + 40) receivedCurrentItemIdentifier:v5 fromParticipant:v14];
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15 && *(unsigned char *)(v15 + 144))
    {
      uint64_t v34 = 0;
      int v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v41 = __Block_byref_object_copy__12471;
      v42 = __Block_byref_object_dispose__12472;
      id v43 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x3032000000;
      uint64_t v31 = __Block_byref_object_copy__12471;
      __int16 v32 = __Block_byref_object_dispose__12472;
      id v33 = 0;
      id v16 = *(void **)(a1 + 32);
      if (v16) {
        id v16 = (void *)v16[1];
      }
      int v17 = v16;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_119;
      v27[3] = &unk_1E5AC86E8;
      v27[4] = &v34;
      void v27[5] = buf;
      v27[6] = &v28;
      int64_t v18 = objc_msgSend(v17, "msv_map:", v27);

      __int16 v19 = [ICLiveLinkQueueEventContentPlayedNow alloc];
      uint64_t v20 = [(ICLiveLinkQueueEventContentPlayedNow *)v19 initWithItemIdentifiers:v18 containerKind:v35[3] containerIdentifier:*(void *)(*(void *)&buf[8] + 40) containerMediaIdentifier:v29[5] startItemIdentifier:v5];
      uint64_t v21 = +[ICLiveLinkQueueEvent queueEventWithContentPlayedNow:v20];
      int64_t v22 = [*(id *)(a1 + 40) _participantForAction:*(void *)(a1 + 48)];
      uint64_t v23 = +[ICLiveLinkEvent eventWithQueueEvent:v21 participant:v22];

      [*(id *)(a1 + 40) receivedEvent:v23];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      int v24 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "ILL %p: Received PlayNowQueueItemsAction with displayNotice=NO %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

BOOL __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverID];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
  return v3 == v4;
}

id __60__ICLiveLink__didReceivePlayNowQueueItemsAction_completion___block_invoke_119(void *a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(*(void *)(a1[4] + 8) + 24)) {
    goto LABEL_22;
  }
  if (v3)
  {
    id v5 = v3[2];
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)*((void *)v5 + 3);
      goto LABEL_5;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = 0;
LABEL_5:
  id v8 = v7;

  if ([v8 length])
  {
    if (v4)
    {
      id v9 = v4[2];
      id v10 = v9;
      if (v9)
      {
        id v11 = (void *)*((void *)v9 + 1);
        goto LABEL_9;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = 0;
LABEL_9:
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v11);

    if (v4)
    {
      uint64_t v12 = v4[2];
      if (v12)
      {
        if (v12[11])
        {
          uint64_t v13 = (v12[10] - 1);
          if (v13 <= 3)
          {
            uint64_t v14 = v13 + 1;
LABEL_20:
            *(void *)(*(void *)(a1[4] + 8) + 24) = v14;

            objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v14 = 0;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  if (v4) {
    id v15 = v4[3];
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (void)_didReceivePlaybackSyncAction:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    id v8 = (id *)v6[12];
    if (v8)
    {
      id v9 = v8;
      if ((_BYTE)v8[4])
      {
        int v10 = *((_DWORD *)v8 + 4);
        if (v10 == 2)
        {
          id v11 = @"ICLiveLinkTransportControlStateKey";
          uint64_t v12 = &OBJC_IVAR____ICLLPlaybackSyncAction__transportControlState;
LABEL_8:
          id v13 = *(id *)((char *)v8 + *v12);
          uint64_t v14 = [v13 dataUsingEncoding:4];

          if (v14)
          {
            id v26 = 0;
            id v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:0 error:&v26];
            id v23 = v26;
            if (v23)
            {
              id v16 = v15;
              int v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                uint64_t v30 = self;
                __int16 v31 = 2114;
                __int16 v32 = v9;
                _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, "ILL %p: Could not construct payload for sync message %{public}@", buf, 0x16u);
              }
            }
            else
            {
              playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
              __int16 v27 = v11;
              uint64_t v28 = v15;
              __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
              [(ICLiveLinkPlaybackCoordinatorMedium *)playbackCoordinatorMedium handlePlaybackSyncPayload:v19];

              if (![(ICLiveLinkPlaybackCoordinatorMedium *)self->_playbackCoordinatorMedium isCoordinatorSuspended]|| ((_BYTE)v9[4] & 1) == 0|| *((_DWORD *)v9 + 4) != 2|| !_NSIsNSDictionary())
              {
                goto LABEL_20;
              }
              id v16 = v15;
              id v20 = v15;
              int v17 = [v20 objectForKeyedSubscript:@"Identifier"];
              uint64_t v21 = [(ICLiveLink *)self participants];
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = __55__ICLiveLink__didReceivePlaybackSyncAction_completion___block_invoke;
              v24[3] = &unk_1E5AC8710;
              uint64_t v25 = v6;
              int64_t v22 = objc_msgSend(v21, "msv_firstWhere:", v24);

              [(ICLiveLink *)self receivedCurrentItemIdentifier:v17 fromParticipant:v22];
            }

            id v15 = v16;
LABEL_20:

            goto LABEL_24;
          }
          goto LABEL_13;
        }
        if (v10 == 1)
        {
          id v11 = @"ICLiveLinkPlaybackSyncParticipantStateKey";
          uint64_t v12 = &OBJC_IVAR____ICLLPlaybackSyncAction__participantState;
          goto LABEL_8;
        }
      }
LABEL_13:
      uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v30 = self;
        __int16 v31 = 2114;
        __int16 v32 = v9;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "ILL %p: No payload for sync message %{public}@", buf, 0x16u);
      }
      goto LABEL_24;
    }
  }
  uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v30 = self;
    __int16 v31 = 2114;
    __int16 v32 = v6;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid PlaybackSyncAction %{public}@", buf, 0x16u);
  }
  id v9 = 0;
LABEL_24:

  v7[2](v7);
}

BOOL __55__ICLiveLink__didReceivePlaybackSyncAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverID];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
  return v3 == v4;
}

- (void)_didReceiveParticipantChangeAction:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    id v8 = v6[10];
    if (v8)
    {
      id v9 = v8;
      if ((*((unsigned char *)v8 + 28) & 2) != 0)
      {
        int v10 = *((_DWORD *)v8 + 6);
        if (v10 == 4 || v10 == 2)
        {
          uint64_t v12 = [(ICLiveLink *)self _participantForAction:v6];
          if (v12)
          {
            id v13 = v12;
            playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
            id v15 = [v12 identifier];
            [(ICLiveLinkPlaybackCoordinatorMedium *)playbackCoordinatorMedium removeParticipant:v15];

LABEL_15:
            int64_t v18 = (void *)v9[2];
            if (v18)
            {
              id v19 = v18;
              [(ICLiveLink *)self _handleUpdatedParticipantQuery:v19];
              [(ICLiveLink *)self _emitSessionEventIfNeededForAction:v6 disconnectedParticipant:v13];
              v7[2](v7);
            }
            else
            {
              v21[0] = MEMORY[0x1E4F143A8];
              v21[1] = 3221225472;
              v21[2] = __60__ICLiveLink__didReceiveParticipantChangeAction_completion___block_invoke;
              v21[3] = &unk_1E5ACB550;
              v21[4] = self;
              int64_t v22 = v6;
              id v23 = v13;
              int v24 = v7;
              [(ICLiveLink *)self _updateParticipantsWithReason:@"ParticipantChangeAction" completion:v21];
            }
            goto LABEL_22;
          }
          id v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            int v17 = (id *)v6[1];
            *(_DWORD *)buf = 134218240;
            id v26 = self;
            __int16 v27 = 2048;
            uint64_t v28 = v17;
            _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Received Participant Leave/Disconnect for unknown participant ID = %ld", buf, 0x16u);
          }
        }
      }
      id v13 = 0;
      goto LABEL_15;
    }
  }
  id v20 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    id v26 = self;
    __int16 v27 = 2114;
    uint64_t v28 = v6;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid ParticipantChangeAction %{public}@", buf, 0x16u);
  }

  v7[2](v7);
  id v9 = 0;
LABEL_22:
}

uint64_t __60__ICLiveLink__didReceiveParticipantChangeAction_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _emitSessionEventIfNeededForAction:*(void *)(a1 + 40) disconnectedParticipant:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

- (void)_didReceiveMoveItemAction:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = v6[8]) != 0)
  {
    id v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ICLiveLink__didReceiveMoveItemAction_completion___block_invoke;
    v12[3] = &unk_1E5ACB550;
    id v13 = v6;
    uint64_t v14 = self;
    id v10 = v9;
    id v15 = v10;
    id v16 = v7;
    [(ICLiveLink *)self _updateQueueWithReason:@"ServerAction[MoveItem]" completion:v12];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v18 = self;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid MoveItemAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    id v10 = 0;
  }
}

void __51__ICLiveLink__didReceiveMoveItemAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 144))
  {
    uint64_t v3 = [ICLiveLinkQueueEventContentReordered alloc];
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4) {
      uint64_t v4 = (void *)v4[1];
    }
    id v5 = v4;
    uint64_t v12 = [(ICLiveLinkQueueEventContentReordered *)v3 initWithItemIdentifier:v5];

    id v6 = +[ICLiveLinkQueueEvent queueEventWithContentReordered:v12];
    id v7 = [*(id *)(a1 + 40) _participantForAction:*(void *)(a1 + 32)];
    id v8 = +[ICLiveLinkEvent eventWithQueueEvent:v6 participant:v7];

    [*(id *)(a1 + 40) receivedEvent:v8];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: Received MoveItemAction with displayNotice=NO %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_didReceiveCurrentItemTransitionAction:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = (id *)v6[6]) != 0)
  {
    id v9 = v8;
    uint64_t v10 = (void (**)(void))v8[2];
    uint64_t v11 = (id *)v9[1];
    uint64_t v12 = [(ICLiveLink *)self participants];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__ICLiveLink__didReceiveCurrentItemTransitionAction_completion___block_invoke;
    v16[3] = &unk_1E5AC8710;
    uint64_t v17 = v6;
    id v13 = objc_msgSend(v12, "msv_firstWhere:", v16);

    uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      __int16 v19 = self;
      __int16 v20 = 2114;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: [received current item transition - INFORMATIONAL ONLY] fromItemID=%{public}@ toItemID=%{public}@ originator=%{public}@", buf, 0x2Au);
    }

    v7[2](v7);
    id v7 = v10;
  }
  else
  {
    __int16 v15 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v19 = self;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid CurrentItemTransitionAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    id v9 = 0;
  }
}

BOOL __64__ICLiveLink__didReceiveCurrentItemTransitionAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverID];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
  return v3 == v4;
}

- (void)_didReceiveCurrentItemChangeAction:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = (id *)v6[5]) != 0)
  {
    id v9 = v8;
    uint64_t v10 = (id *)v8[1];
    uint64_t v11 = [(ICLiveLink *)self participants];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__ICLiveLink__didReceiveCurrentItemChangeAction_completion___block_invoke;
    v20[3] = &unk_1E5AC8710;
    uint64_t v12 = v6;
    uint64_t v21 = v12;
    id v13 = objc_msgSend(v11, "msv_firstWhere:", v20);

    uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v23 = self;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      __int16 v27 = v13;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "ILL %p: [received current item change] currentItemIdentifier=%{public}@ originator=%{public}@", buf, 0x20u);
    }

    [(ICLiveLink *)self receivedCurrentItemIdentifier:v10 fromParticipant:v13];
    if (*((unsigned char *)v12 + 144))
    {
      __int16 v15 = [[ICLiveLinkPlaybackEvent alloc] initWithKind:4];
      uint64_t v16 = [(ICLiveLink *)self _participantForAction:v12];
      uint64_t v17 = +[ICLiveLinkEvent eventWithPlaybackEvent:v15 participant:v16];

      [(ICLiveLink *)self receivedEvent:v17];
      v7[2](v7);
    }
    else
    {
      int64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v23 = self;
        __int16 v24 = 2114;
        uint64_t v25 = v9;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "ILL %p: Received CurrentItemChangeAction with displayNotice=NO %{public}@", buf, 0x16u);
      }

      v7[2](v7);
    }
  }
  else
  {
    __int16 v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v23 = self;
      __int16 v24 = 2114;
      uint64_t v25 = v6;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid CurrentItemChangeAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    id v9 = 0;
  }
}

BOOL __60__ICLiveLink__didReceiveCurrentItemChangeAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverID];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 8);
  }
  return v3 == v4;
}

- (void)_didReceiveAddItemsAction:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  id v7 = (void (**)(void))a4;
  if (v6 && (id v8 = v6[3]) != 0)
  {
    id v9 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke;
    v12[3] = &unk_1E5ACB550;
    id v13 = v6;
    uint64_t v14 = self;
    id v10 = v9;
    id v15 = v10;
    uint64_t v16 = v7;
    [(ICLiveLink *)self _updateQueueWithReason:@"ServerAction[AddItems]" completion:v12];
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = v6;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "ILL %p: Received invalid AddItemsAction %{public}@", buf, 0x16u);
    }

    v7[2](v7);
    id v10 = 0;
  }
}

void __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && *(unsigned char *)(v4 + 144))
  {
    uint64_t v23 = 0;
    __int16 v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__12471;
    uint64_t v29 = __Block_byref_object_dispose__12472;
    id v30 = 0;
    uint64_t v17 = 0;
    int64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    __int16 v20 = __Block_byref_object_copy__12471;
    uint64_t v21 = __Block_byref_object_dispose__12472;
    id v22 = 0;
    id v5 = *(void **)(a1 + 48);
    if (v5) {
      id v5 = (void *)v5[1];
    }
    id v6 = v5;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke_96;
    v16[3] = &unk_1E5AC86E8;
    void v16[4] = &v23;
    v16[5] = buf;
    void v16[6] = &v17;
    id v7 = objc_msgSend(v6, "msv_map:", v16);

    id v8 = [ICLiveLinkQueueEventContentAdded alloc];
    id v9 = [(ICLiveLinkQueueEventContentAdded *)v8 initWithItemIdentifiers:v7 containerKind:v24[3] containerIdentifier:*(void *)(*(void *)&buf[8] + 40) containerMediaIdentifier:v18[5]];
    id v10 = +[ICLiveLinkQueueEvent queueEventWithContentAdded:v9];
    uint64_t v11 = [*(id *)(a1 + 40) _participantForAction:*(void *)(a1 + 32)];
    uint64_t v12 = +[ICLiveLinkEvent eventWithQueueEvent:v10 participant:v11];

    [*(id *)(a1 + 40) receivedEvent:v12];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v13 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "ILL %p: Received AddItemsAction with displayNotice=NO %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id __51__ICLiveLink__didReceiveAddItemsAction_completion___block_invoke_96(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(*(void *)(a1[4] + 8) + 24)) {
    goto LABEL_22;
  }
  if (v3)
  {
    id v5 = v3[2];
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)*((void *)v5 + 3);
      goto LABEL_5;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = 0;
LABEL_5:
  id v8 = v7;

  if ([v8 length])
  {
    if (v4)
    {
      id v9 = v4[2];
      id v10 = v9;
      if (v9)
      {
        uint64_t v11 = (void *)*((void *)v9 + 1);
        goto LABEL_9;
      }
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = 0;
LABEL_9:
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v11);

    if (v4)
    {
      uint64_t v12 = v4[2];
      if (v12)
      {
        if (v12[11])
        {
          uint64_t v13 = (v12[10] - 1);
          if (v13 <= 3)
          {
            uint64_t v14 = v13 + 1;
LABEL_20:
            *(void *)(*(void *)(a1[4] + 8) + 24) = v14;

            objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v14 = 0;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  if (v4) {
    id v15 = v4[3];
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  uint64_t v12 = a3;
  id v6 = a4;
  if (v12) {
    id v7 = (void *)v12[5];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  if (![v8 length])
  {
    id v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];

    -[_ICLLProtocolMessage setTraceId:]((uint64_t)v12, v10);
    id v8 = v10;
  }
  [(ICLiveLink *)self _storeTraceID:v8 completion:v6];
  uint64_t v11 = [(ICLiveLink *)self connectionController];
  [v11 sendMessage:v12];
}

- (void)sendPlaybackSyncPayload:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
  }
  id v7 = objc_opt_new();
  -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

  id v8 = objc_opt_new();
  if (v6) {
    id v9 = v6[2];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = v8;
  if (v10)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v10);
    *((unsigned char *)v10 + 104) |= 1u;
    *((_DWORD *)v10 + 6) = 1;
    objc_storeStrong((id *)v10 + 9, v8);
  }

  if (v6 && (uint64_t v12 = (id *)v6[2]) != 0)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v12[9];
    if (v14)
    {
      v14[32] |= 1u;
      *((_DWORD *)v14 + 4) = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
  }

  id v15 = [v4 objectForKeyedSubscript:@"ICLiveLinkTransportControlStateKey"];

  if (v15)
  {
    id v16 = [v4 objectForKeyedSubscript:@"ICLiveLinkTransportControlStateKey"];
    id v37 = 0;
    uint64_t v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v16 options:0 error:&v37];
    id v18 = v37;
    if (v18)
    {
      uint64_t v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        id v39 = self;
        __int16 v40 = 2114;
        id v41 = v18;
        __int16 v42 = 2114;
        id v43 = v16;
        __int16 v20 = "ILL %p: Serialization failed with error %{public}@ for transport control state %{public}@";
LABEL_19:
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x20u);
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    id v22 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
    if (v6 && (uint64_t v23 = (id *)v6[2]) != 0)
    {
      __int16 v24 = v23;
      uint64_t v25 = v23[9];
      if (v25)
      {
        v25[32] |= 1u;
        *((_DWORD *)v25 + 4) = 2;
      }
    }
    else if (!v6)
    {
      __int16 v27 = 0;
      goto LABEL_48;
    }
    id v26 = v6[2];
    __int16 v27 = v26;
    if (v26)
    {
      uint64_t v28 = (void *)*((void *)v26 + 9);
      goto LABEL_27;
    }
LABEL_48:
    uint64_t v28 = 0;
LABEL_27:
    uint64_t v29 = v28;
    uint64_t v19 = v22;
    if (v29)
    {
      -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload]((uint64_t)v29);
      v29[32] |= 1u;
      *((_DWORD *)v29 + 4) = 2;
      uint64_t v30 = 24;
LABEL_40:
      objc_storeStrong((id *)&v29[v30], v22);
      goto LABEL_41;
    }
    goto LABEL_41;
  }
  uint64_t v21 = [v4 objectForKeyedSubscript:@"ICLiveLinkPlaybackSyncParticipantStateKey"];

  if (v21)
  {
    id v16 = [v4 objectForKeyedSubscript:@"ICLiveLinkPlaybackSyncParticipantStateKey"];
    id v36 = 0;
    uint64_t v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v16 options:0 error:&v36];
    id v18 = v36;
    if (v18)
    {
      uint64_t v19 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        id v39 = self;
        __int16 v40 = 2114;
        id v41 = v18;
        __int16 v42 = 2114;
        id v43 = v16;
        __int16 v20 = "ILL %p: Serialization failed with error %{public}@ for participant state %{public}@";
        goto LABEL_19;
      }
LABEL_42:

      goto LABEL_43;
    }
    id v22 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
    if (v6 && (uint64_t v31 = (id *)v6[2]) != 0)
    {
      __int16 v32 = v31;
      uint64_t v33 = v31[9];
      if (v33)
      {
        v33[32] |= 1u;
        *((_DWORD *)v33 + 4) = 1;
      }
    }
    else if (!v6)
    {
      __int16 v27 = 0;
      goto LABEL_51;
    }
    id v34 = v6[2];
    __int16 v27 = v34;
    if (v34)
    {
      int v35 = (void *)*((void *)v34 + 9);
      goto LABEL_38;
    }
LABEL_51:
    int v35 = 0;
LABEL_38:
    uint64_t v29 = v35;
    uint64_t v19 = v22;
    if (v29)
    {
      -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload]((uint64_t)v29);
      v29[32] |= 1u;
      *((_DWORD *)v29 + 4) = 1;
      uint64_t v30 = 8;
      goto LABEL_40;
    }
LABEL_41:

    goto LABEL_42;
  }
  id v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    id v39 = self;
    __int16 v40 = 2114;
    id v41 = v4;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ILL %p: Playback sync payload had no recognized key. Payload: %{public}@", buf, 0x16u);
  }
LABEL_43:

  [(ICLiveLink *)self sendMessage:v6 completion:&__block_literal_global_91];
}

- (void)receivedEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICLiveLink *)self delegate];
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2048;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v4;
    id v7 = v16;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "ILL %p: receivedEvent delegate=<%{public}@ %p> event=%{public}@", buf, 0x2Au);
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(ICLiveLink *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__ICLiveLink_receivedEvent___block_invoke;
    block[3] = &unk_1E5ACD5C8;
    id v10 = v5;
    id v11 = self;
    id v12 = v4;
    dispatch_async(v8, block);
  }
}

uint64_t __28__ICLiveLink_receivedEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didReceiveEvent:*(void *)(a1 + 48)];
}

- (void)receivedCurrentItemIdentifier:(id)a3 fromParticipant:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(ICSharedListeningQueue *)self->_queue itemForIdentifier:v7];
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ICLiveLink.m", 618, @"Received current item ID not in queue: %@", v7 object file lineNumber description];
  }
  id v10 = [(ICLiveLink *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(ICLiveLink *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke;
    block[3] = &unk_1E5ACD640;
    id v12 = (id *)v20;
    v20[0] = v10;
    v20[1] = self;
    uint64_t v13 = &v21;
    id v21 = v9;
    id v22 = v8;
    dispatch_async(v11, block);

    uint64_t v14 = v22;
LABEL_7:

    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [(ICLiveLink *)self delegateQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke_2;
    v16[3] = &unk_1E5ACD5C8;
    id v12 = (id *)v17;
    v17[0] = v10;
    v17[1] = self;
    uint64_t v13 = &v18;
    id v18 = v9;
    dispatch_async(v14, v16);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didReceiveDirectCurrentItemChanged:*(void *)(a1 + 48) fromParticipant:*(void *)(a1 + 56)];
}

uint64_t __60__ICLiveLink_receivedCurrentItemIdentifier_fromParticipant___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) liveLink:*(void *)(a1 + 40) didReceiveDirectCurrentItemChanged:*(void *)(a1 + 48)];
}

- (id)participantForParticipantUUID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = self->_participants;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v16);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      participants = self->_participants;
      *(_DWORD *)buf = 134218498;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = participants;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "ILL %p: Failed to find participant with UUID: %{public}@, in participants: %{public}@", buf, 0x20u);
    }
  }

  return v7;
}

- (void)fetchPlaybackSyncStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 4;
    id v7 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v6, v7);

    uint64_t v8 = v6[4];
    if (v8)
    {
      v8[48] |= 1u;
      *((_DWORD *)v8 + 8) = 2;
    }
  }
  else
  {
    uint64_t v13 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v13);

    uint64_t v8 = 0;
  }

  id v9 = objc_opt_new();
  if (v6) {
    id v10 = v6[4];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  -[_ICLLQueryMessage setPlaybackSyncState:]((uint64_t)v11, v9);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke;
  v14[3] = &unk_1E5AC87D8;
  v14[4] = self;
  id v15 = v4;
  id v12 = v4;
  [(ICLiveLink *)self sendMessage:v6 completion:v14];
}

void __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      id v8 = v5[4];
      id v9 = v8;
      if (v8)
      {
        id v10 = (void *)*((void *)v8 + 3);
LABEL_7:
        id v11 = v10;

        id v12 = *(NSObject **)(*(void *)(a1 + 32) + 88);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke_2;
        v15[3] = &unk_1E5ACD2F0;
        id v13 = *(id *)(a1 + 40);
        id v16 = v11;
        id v17 = v13;
        id v14 = v11;
        dispatch_async(v12, v15);

        goto LABEL_8;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
LABEL_8:
}

uint64_t __51__ICLiveLink_fetchPlaybackSyncStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchPlaybackSyncStateForMediumWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 4;
    uint64_t v7 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:]((uint64_t)v6, v7);

    id v8 = v6[4];
    if (v8)
    {
      v8[48] |= 1u;
      *((_DWORD *)v8 + 8) = 2;
    }
  }
  else
  {
    id v26 = objc_opt_new();
    -[_ICLLProtocolMessage setQuery:](0, v26);

    id v8 = 0;
  }

  id v9 = objc_opt_new();
  if (v6) {
    id v10 = v6[4];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  -[_ICLLQueryMessage setPlaybackSyncState:]((uint64_t)v11, v9);

  if (self->_expectingToJoinStartItemIdentifier)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      expectingToJoinStartItemIdentifier = self->_expectingToJoinStartItemIdentifier;
      BOOL expectingToJoinAsInitiator = self->_expectingToJoinAsInitiator;
      *(_DWORD *)buf = 134218498;
      uint64_t v30 = self;
      __int16 v31 = 2114;
      __int16 v32 = expectingToJoinStartItemIdentifier;
      __int16 v33 = 1024;
      BOOL v34 = expectingToJoinAsInitiator;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: fetchPlaybackSyncStateForMedium [first AV sync] initialAVSyncStartItem=%{public}@ initialAVSyncInitiator=%{BOOL}u", buf, 0x1Cu);
    }

    if (v6 && (v15 = self->_expectingToJoinStartItemIdentifier, (id v16 = (id *)v6[4]) != 0))
    {
      id v17 = v16;
      long long v18 = (id *)v16[3];
      long long v19 = v18;
      if (v18) {
        objc_storeStrong(v18 + 2, v15);
      }
    }
    else if (!v6)
    {
      goto LABEL_22;
    }
    BOOL v20 = self->_expectingToJoinAsInitiator;
    id v21 = (id *)v6[4];
    if (v21)
    {
      __int16 v22 = v21;
      id v23 = v21[3];
      if (v23)
      {
        v23[44] |= 1u;
        v23[40] = v20;
      }
      goto LABEL_17;
    }
LABEL_22:
    id v23 = 0;
    __int16 v22 = 0;
LABEL_17:

    __int16 v24 = self->_expectingToJoinStartItemIdentifier;
    self->_expectingToJoinStartItemIdentifier = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke;
  v27[3] = &unk_1E5AC87D8;
  v27[4] = self;
  id v28 = v4;
  id v25 = v4;
  [(ICLiveLink *)self sendMessage:v6 completion:v27];
}

void __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      id v8 = v5[4];
      id v9 = v8;
      if (v8)
      {
        id v10 = (void *)*((void *)v8 + 3);
LABEL_7:
        id v11 = v10;

        id v12 = *(NSObject **)(*(void *)(a1 + 32) + 88);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke_2;
        v15[3] = &unk_1E5ACD2F0;
        id v13 = *(id *)(a1 + 40);
        id v16 = v11;
        id v17 = v13;
        id v14 = v11;
        dispatch_async(v12, v15);

        goto LABEL_8;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
LABEL_8:
}

uint64_t __60__ICLiveLink_fetchPlaybackSyncStateForMediumWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (BOOL)isExpectingToJoinWithStartItem
{
  return self->_expectingToJoinStartItemIdentifier != 0;
}

- (ICSharedListeningQueue)queue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_queue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)participants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_participants;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (ICLiveLinkIdentity)identity
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_participants;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = v4;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "serverID", (void)v13) == self->_localParticipantServerID) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v11 = self->_clientSpecifiedIdentity;
LABEL_12:
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)expectingToJoinWithStartItem:(id)a3 asInitiator:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSString *)a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "ILL %p: expectingToJoin startItem=%{public}@ asInitiator=%{BOOL}u", (uint8_t *)&v9, 0x1Cu);
  }

  expectingToJoinStartItemIdentifier = self->_expectingToJoinStartItemIdentifier;
  self->_expectingToJoinStartItemIdentifier = v6;

  self->_BOOL expectingToJoinAsInitiator = v4;
}

- (void)updateWithIdentity:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(ICLiveLinkIdentity *)self->_clientSpecifiedIdentity externalIdentifier];
  uint64_t v6 = [v4 externalIdentifier];
  if (v5 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = [v5 isEqual:v6];
  }

  uint64_t v8 = (ICLiveLinkIdentity *)[v4 copy];
  clientSpecifiedIdentity = self->_clientSpecifiedIdentity;
  self->_clientSpecifiedIdentity = v8;

  BOOL started = self->_started;
  __int16 v11 = [(ICLiveLinkIdentity *)self->_clientSpecifiedIdentity externalIdentifier];
  os_unfair_lock_unlock(&self->_lock);
  if (started && (v7 & 1) == 0)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 134218242;
      __int16 v32 = self;
      __int16 v33 = 2114;
      BOOL v34 = v11;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "ILL %p: Notifying server of updated externalID: %{public}@", (uint8_t *)&v31, 0x16u);
    }

    uint64_t v13 = objc_opt_new();
    BOOL v14 = (id *)v13;
    if (v13)
    {
      *(unsigned char *)(v13 + 52) |= 1u;
      *(_DWORD *)(v13 + 48) = 1;
      uint64_t v15 = objc_opt_new();
      -[_ICLLProtocolMessage setCommand:]((uint64_t)v14, v15);

      long long v16 = v14[2];
      if (v16)
      {
        v16[104] |= 1u;
        *((_DWORD *)v16 + 6) = 8;
      }
    }
    else
    {
      uint64_t v30 = objc_opt_new();
      -[_ICLLProtocolMessage setCommand:](0, v30);

      long long v16 = 0;
    }

    id v17 = objc_opt_new();
    if (v14) {
      id v18 = v14[2];
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
    -[_ICLLCommandMessage setClientInfo:]((uint64_t)v19, v17);

    BOOL v20 = [(ICLiveLink *)self connectionController];
    id v21 = [v20 sessionToken];
    if (v14)
    {
      id v22 = v14[2];
      id v23 = v22;
      if (v22)
      {
        __int16 v24 = (void *)*((void *)v22 + 2);
        goto LABEL_16;
      }
    }
    else
    {
      id v23 = 0;
    }
    __int16 v24 = 0;
LABEL_16:
    id v25 = v24;
    -[_ICLLClientInfoCommand setSharedSessionToken:]((uint64_t)v25, v21);

    if (v14)
    {
      id v26 = v14[2];
      uint64_t v27 = v26;
      if (v26)
      {
        id v28 = (void *)*((void *)v26 + 2);
LABEL_19:
        id v29 = v28;
        -[_ICLLClientInfoCommand setExternalId:]((uint64_t)v29, v11);

        [(ICLiveLink *)self sendMessage:v14 completion:&__block_literal_global_76];
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    id v28 = 0;
    goto LABEL_19;
  }
LABEL_20:
}

- (void)broadcastDirectCurrentItemChangedToItemIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (id *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 52) |= 1u;
    *(_DWORD *)(v5 + 48) = 1;
    char v7 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:]((uint64_t)v6, v7);

    uint64_t v8 = v6[2];
    if (v8)
    {
      v8[104] |= 1u;
      *((_DWORD *)v8 + 6) = 5;
    }
  }
  else
  {
    id v18 = objc_opt_new();
    -[_ICLLProtocolMessage setCommand:](0, v18);

    uint64_t v8 = 0;
  }

  int v9 = objc_opt_new();
  if (v6) {
    id v10 = v6[2];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  id v12 = v9;
  if (v11)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand]((uint64_t)v11);
    *((unsigned char *)v11 + 104) |= 1u;
    *((_DWORD *)v11 + 6) = 5;
    objc_storeStrong((id *)v11 + 4, v9);
  }

  if (v6 && (uint64_t v13 = (id *)v6[2]) != 0)
  {
    BOOL v14 = v13;
    uint64_t v15 = (id *)v13[4];
    long long v16 = v15;
    if (v15) {
      objc_storeStrong(v15 + 1, a3);
    }
  }
  else
  {
    long long v16 = 0;
    BOOL v14 = 0;
  }

  id v17 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "ILL %p: broadcastDirectCurrentItemChangedToItemIdentifier itemId=%{public}@", buf, 0x16u);
  }

  [(ICLiveLink *)self sendMessage:v6 completion:&__block_literal_global_12587];
}

- (void)endSynchronizedPlayback
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "ILL %p: ending playback sync", (uint8_t *)&v5, 0xCu);
  }

  [(ICLiveLinkPlaybackCoordinatorMedium *)self->_playbackCoordinatorMedium clearCoordinationMediumDelegate];
  playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
  self->_playbackCoordinatorMedium = 0;
}

- (void)beginSynchronizedPlaybackWithAVCFPlaybackCoordinator:(void *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "ILL %p: failed to begin playback sync with AVCFPlaybackCoordinator [ICLiveLink compiled without AVCFPlaybackCoordinator.h]", (uint8_t *)&v5, 0xCu);
  }
}

- (void)beginSynchronizedPlaybackWithAVPlaybackCoordinator:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_playbackCoordinatorMedium) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
  id v6 = [(ICLiveLinkPlaybackCoordinatorMedium *)playbackCoordinatorMedium playbackCoordinator];

  if (v6 != v4)
  {

LABEL_5:
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "ILL %p: beginning playback sync with coordinator: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v8 = [[ICLinkLinkAVPlaybackCoordinatorMedium alloc] initWithPlaybackCoordinator:v4 liveLink:self];
    playbackCoordinatorMedium = self->_playbackCoordinatorMedium;
    self->_playbackCoordinatorMedium = &v8->super;
    goto LABEL_8;
  }
  int v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "ILL %p: already syncing playback with coordinator: %{public}@", (uint8_t *)&v10, 0x16u);
  }

LABEL_8:
}

- (void)reconnectWithReason:(id)a3 options:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "ILL %p: forcing reconnect because: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [(ICLiveLink *)self forcedReconnectReason];

  if (v7)
  {
    [(ICLiveLink *)self setDeferredReconnectReason:v5];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [(ICLiveLink *)self setCurrentRetryCount:0];
    [(ICLiveLink *)self setForcedReconnectReason:v5];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v8 = [(ICLiveLink *)self connectionController];
    [v8 stop];
  }
}

- (void)stop
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL started = self->_started;
  [(ICLiveLink *)self setStarted:0];
  [(ICLiveLink *)self setStarting:0];
  id v5 = [(ICLiveLink *)self connectionController];
  [v5 stop];

  [(ICLiveLink *)self setConnectionController:0];
  [(ICLiveLink *)self setForcedReconnectReason:0];
  [(ICLiveLink *)self setDeferredReconnectReason:0];
  os_unfair_lock_unlock(p_lock);
  if (started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(ICLiveLink *)self delegateQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __18__ICLiveLink_stop__block_invoke;
      v8[3] = &unk_1E5ACD4C8;
      id v9 = WeakRetained;
      int v10 = self;
      dispatch_async(v7, v8);
    }
  }
}

uint64_t __18__ICLiveLink_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didStopLiveLink:*(void *)(a1 + 40)];
}

- (void)start
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(ICLiveLink *)self isStarted])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ICLiveLink.m" lineNumber:372 description:@"Attempted to start an already started live link"];
  }
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    BOOL v20 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "ILL %p: Starting.", (uint8_t *)&v19, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(ICLiveLink *)self setStarting:1];
  id v6 = [(ICLiveLink *)self connectionController];

  if (!v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileipod"];
    int v8 = [v7 BOOLForKey:@"forceExternalQR"];

    if (v8)
    {
      id v9 = [(ICLiveLink *)self identifier];
      int v10 = [(ICLiveLink *)self clientSpecifiedIdentity];
      __int16 v11 = [MEMORY[0x1E4F28B50] mainBundle];
      id v12 = [v11 bundleIdentifier];
    }
    else
    {
      int v13 = [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.itunescloud.quic.inprocess"];
      id v9 = [(ICLiveLink *)self identifier];
      int v10 = [(ICLiveLink *)self clientSpecifiedIdentity];
      __int16 v11 = [MEMORY[0x1E4F28B50] mainBundle];
      id v12 = [v11 bundleIdentifier];
      if (v13)
      {
        uint64_t v14 = +[ICSharedListeningConnectionController sharedListeningConnectionWithSessionIdentifier:v9 identity:v10 bundleID:v12];
LABEL_11:
        uint64_t v15 = (void *)v14;
        [(ICLiveLink *)self setConnectionController:v14];

        long long v16 = [(ICLiveLink *)self connectionController];
        [v16 setDelegate:self];

        id v17 = [(ICLiveLink *)self connectionController];
        [v17 start];

        goto LABEL_12;
      }
    }
    uint64_t v14 = +[ICSharedListeningConnectionController externalSharedListeningConnectionWithSessionIdentifier:v9 identity:v10 bundleID:v12];
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(p_lock);
}

- (NSURL)invitationURL
{
  uint64_t v2 = [(ICLiveLink *)self connectionController];
  id v3 = [v2 inviteURL];

  return (NSURL *)v3;
}

- (BOOL)isStarted
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "ILL %p: Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICLiveLink;
  [(ICLiveLink *)&v4 dealloc];
}

- (ICLiveLink)initWithSharedListeningSessionIdentifier:(id)a3 identity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ICLiveLink;
  int v8 = [(ICLiveLink *)&v27 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    clientSpecifiedIdentity = v8->_clientSpecifiedIdentity;
    v8->_clientSpecifiedIdentity = (ICLiveLinkIdentity *)v11;

    v8->_currentRetryCount = 0;
    v8->_BOOL started = 0;
    *(_WORD *)&v8->_starting = 0;
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileipod"];
    uint64_t v14 = [v13 integerForKey:@"LiveLinkMaxRetries"];

    uint64_t v15 = 3;
    if (v14 > 3) {
      uint64_t v15 = v14;
    }
    v8->_maxRetries = v15;
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileipod"];
    uint64_t v17 = [v16 integerForKey:@"LiveLinkMaxRetryWaitPeriod"];

    uint64_t v18 = 2;
    if (v17 > 2) {
      uint64_t v18 = v17;
    }
    v8->_maxRetryWaitPeriod = v18;
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingRequests = v8->_pendingRequests;
    v8->_pendingRequests = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    pendingActions = v8->_pendingActions;
    v8->_pendingActions = (NSMutableArray *)v21;

    id v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.amp.MediaServices.LiveLink.delegateQueue", v23);
    delegateQueue = v8->_delegateQueue;
    v8->_delegateQueue = (OS_dispatch_queue *)v24;
  }
  return v8;
}

+ (ICLiveLink)linkWithSessionIdentifier:(id)a3 identity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ICLiveLink alloc] initWithSharedListeningSessionIdentifier:v6 identity:v5];

  return v7;
}

+ (ICLiveLink)linkWithIdentity:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[ICLiveLink alloc] initWithSharedListeningSessionIdentifier:0 identity:v3];

  return v4;
}

@end