@interface PRRangingSession
+ (unint64_t)computeLocalDeviceIndex:(id)a3 sessionParticipants:(id)a4;
- (BOOL)isReady;
- (BOOL)isValid;
- (NSMutableSet)sessionParticipants;
- (OS_dispatch_queue)delegateQueue;
- (PRPeer)localPeer;
- (PRPeer)rangedPeer;
- (PRRangingSession)init;
- (PRRangingSessionDelegate)delegate;
- (id)rangingConfigurationWithDeviceIndex:(unint64_t)a3;
- (id)remoteObject;
- (void)connectToDaemon;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)handleInterruption;
- (void)handleInvalidation;
- (void)invalidate;
- (void)invokeDelegateBlock:(id)a3;
- (void)pushCollaborationData:(id)a3;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)requestInitialCollaborationDataWithCompletionHandler:(id)a3;
- (void)sendDataToPeers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setRangedPeer:(id)a3;
- (void)setSessionParticipants:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)startRangingWithPeer:(id)a3;
- (void)stopRangingWithPeer:(id)a3;
@end

@implementation PRRangingSession

- (PRRangingSession)init
{
  v16.receiver = self;
  v16.super_class = (Class)PRRangingSession;
  v2 = [(PRRangingSession *)&v16 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.nearbyd", "RangingSession");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = objc_alloc_init(PRRangingDevice);
    rangingDevice = v2->_rangingDevice;
    v2->_rangingDevice = v5;

    v7 = [PRPeer alloc];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(PRPeer *)v7 initWithUUID:v8];
    localPeer = v2->_localPeer;
    v2->_localPeer = (PRPeer *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v12 = [(PRPeer *)v2->_localPeer uuid];
    uint64_t v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);
    sessionParticipants = v2->_sessionParticipants;
    v2->_sessionParticipants = (NSMutableSet *)v13;

    *(_WORD *)&v2->_isReady = 256;
    [(PRRangingSession *)v2 connectToDaemon];
  }
  return v2;
}

- (void)startRangingWithPeer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = (uint64_t)v4;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "startRangingWithPeer: %@", buf, 0xCu);
  }
  if (!self->_isReady)
  {
    uint64_t v8 = *MEMORY[0x1E4F28588];
    v11[0] = *MEMORY[0x1E4F28568];
    v11[1] = v8;
    v12[0] = @"Failed to start ranging.";
    v12[1] = @"Service not ready.";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v7 = PRErrorWithCodeAndUserInfo(999, v9);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained rangingSession:self didFailWithError:v7];

LABEL_9:
    goto LABEL_10;
  }
  if ([(NSMutableSet *)self->_sessionParticipants count] == 2)
  {
    v6 = self->_logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = 2;
      _os_log_impl(&dword_19DFF5000, v6, OS_LOG_TYPE_DEFAULT, "ARKitParticipantsCount = %ld. Resuming session.", buf, 0xCu);
    }
    [(PRRangingSession *)self setRangedPeer:v4];
    v7 = [(PRRangingSession *)self remoteObject];
    [v7 resume];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)stopRangingWithPeer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "stopRangingWithPeer: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)pushCollaborationData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 sendingPeer];
  int v6 = [v5 uuid];

  if (([(NSMutableSet *)self->_sessionParticipants containsObject:v6] & 1) == 0)
  {
    [(NSMutableSet *)self->_sessionParticipants addObject:v6];
    id v7 = [(PRPeer *)self->_localPeer uuid];
    unint64_t v8 = +[PRRangingSession computeLocalDeviceIndex:v7 sessionParticipants:self->_sessionParticipants];

    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      localPeer = self->_localPeer;
      id v11 = logger;
      v12 = [(PRPeer *)localPeer uuid];
      sessionParticipants = self->_sessionParticipants;
      *(_DWORD *)buf = 134218498;
      unint64_t v22 = v8;
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 2112;
      v26 = sessionParticipants;
      _os_log_impl(&dword_19DFF5000, v11, OS_LOG_TYPE_DEFAULT, "Local device index is: %lu, local UUID: %@, participants: %@", buf, 0x20u);
    }
    uint64_t v14 = [(PRRangingSession *)self rangingConfigurationWithDeviceIndex:v8];
    objc_initWeak((id *)buf, self);
    uint64_t v15 = [(PRRangingSession *)self remoteObject];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__PRRangingSession_pushCollaborationData___block_invoke;
    v19[3] = &unk_1E5999C50;
    objc_copyWeak(&v20, (id *)buf);
    [v15 runWithConfiguration:v14 reply:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  objc_super v16 = [[PRRemoteDevice alloc] initWithCompanionUUID:v6];
  v17 = [(PRRangingSession *)self remoteObject];
  v18 = [v4 data];
  [v17 receivedData:v18 fromPeer:v16];
}

void __42__PRRangingSession_pushCollaborationData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v8 = WeakRetained[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = NSNumber;
      v10 = v8;
      id v11 = [v9 numberWithBool:a2];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_19DFF5000, v10, OS_LOG_TYPE_DEFAULT, "reply to runWithConfiguration. Success: %@, Error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)invokeDelegateBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(PRRangingSession *)self isValid])
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue) {
      dispatch_async(delegateQueue, v4);
    }
    else {
      v4[2](v4);
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "session has been invalidated, dropping delegate block", v7, 2u);
    }
  }
}

- (void)requestInitialCollaborationDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "requesting initial collaboration data", buf, 2u);
  }
  int v6 = [(PRRangingSession *)self remoteObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PRRangingSession_requestInitialCollaborationDataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5999C78;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 requestInitialCollaborationDataWithCompletionHandler:v8];
}

void __73__PRRangingSession_requestInitialCollaborationDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PRCollaborationData alloc];
  id v5 = [*(id *)(a1 + 32) localPeer];
  int v6 = [(PRCollaborationData *)v4 initWithData:v3 sendingPeer:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "Invalidating ranging session %p", (uint8_t *)&v5, 0xCu);
  }
  [(PRRangingSession *)self setValid:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)connectToDaemon
{
  id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nearbyd.xpc.aided" options:4096];
  connection = self->_connection;
  self->_connection = v3;

  int v5 = self->_connection;
  int v6 = PRMakeAidedRangingClientXPCInterface();
  [(NSXPCConnection *)v5 setExportedInterface:v6];

  uint64_t v7 = self->_connection;
  unint64_t v8 = [[PRRangingClientExportedObject alloc] initWithRangingClient:self];
  [(NSXPCConnection *)v7 setExportedObject:v8];

  id v9 = self->_connection;
  v10 = PRMakeAidedRangingServerXPCInterface();
  [(NSXPCConnection *)v9 setRemoteObjectInterface:v10];

  objc_initWeak(&location, self);
  id v11 = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__PRRangingSession_connectToDaemon__block_invoke;
  v17[3] = &unk_1E5999CA0;
  objc_copyWeak(&v18, &location);
  [(NSXPCConnection *)v11 setInterruptionHandler:v17];
  int v12 = self->_connection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__PRRangingSession_connectToDaemon__block_invoke_2;
  v15[3] = &unk_1E5999CA0;
  objc_copyWeak(&v16, &location);
  [(NSXPCConnection *)v12 setInvalidationHandler:v15];
  [(NSXPCConnection *)self->_connection resume];
  uint64_t v13 = [(PRRangingSession *)self remoteObject];
  __int16 v14 = [(PRRangingDevice *)self->_rangingDevice clientInfo];
  [v13 connectWithClientInfo:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __35__PRRangingSession_connectToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleInterruption];
}

void __35__PRRangingSession_connectToDaemon__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleInvalidation];
}

- (void)handleInterruption
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v5 = logger;
    int v6 = [(NSXPCConnection *)connection debugDescription];
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19DFF5000, v5, OS_LOG_TYPE_DEFAULT, "connection was interrupted: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [(PRRangingSession *)self remoteObject];
  unint64_t v8 = [(PRRangingDevice *)self->_rangingDevice clientInfo];
  [v7 connectWithClientInfo:v8];
}

- (void)handleInvalidation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v5 = logger;
    int v6 = [(NSXPCConnection *)connection debugDescription];
    int v7 = 138412290;
    unint64_t v8 = v6;
    _os_log_impl(&dword_19DFF5000, v5, OS_LOG_TYPE_DEFAULT, "connection was invalidated: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)remoteObject
{
  connection = self->_connection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__PRRangingSession_remoteObject__block_invoke;
  v5[3] = &unk_1E5999CC8;
  v5[4] = self;
  id v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __32__PRRangingSession_remoteObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19DFF5000, v4, OS_LOG_TYPE_DEFAULT, "Error getting remote object proxy %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sendDataToPeers:(id)a3
{
  id v4 = a3;
  int v5 = [PRCollaborationData alloc];
  id v6 = [(PRRangingSession *)self localPeer];
  uint64_t v7 = [(PRCollaborationData *)v5 initWithData:v4 sendingPeer:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__PRRangingSession_sendDataToPeers___block_invoke;
  v9[3] = &unk_1E5999CF0;
  v9[4] = self;
  v10 = v7;
  unint64_t v8 = v7;
  [(PRRangingSession *)self invokeDelegateBlock:v9];
}

void __36__PRRangingSession_sendDataToPeers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 rangingSession:*(void *)(a1 + 32) didOutputCollaborationData:*(void *)(a1 + 40)];
}

- (void)didFailWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "ranging session failed with error %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(PRRangingSession *)self delegate];
  [v6 rangingSession:self didFailWithError:v4];
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "ranging service updated state %ld", (uint8_t *)&v9, 0xCu);
  }
  if (a3 == 3)
  {
    int v7 = PRErrorWithCodeAndUserInfo(999, 0);
    id v8 = [(PRRangingSession *)self delegate];
    [v8 rangingSession:self didFailWithError:v7];

    self->_isReady = 0;
  }
  else
  {
    self->_isReady = a3 == 2;
  }
}

- (void)didReceiveNewSolutions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "received new solutions", buf, 2u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __43__PRRangingSession_didReceiveNewSolutions___block_invoke;
        v12[3] = &unk_1E5999CF0;
        v12[4] = v11;
        v12[5] = self;
        [(PRRangingSession *)self invokeDelegateBlock:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
}

void __43__PRRangingSession_didReceiveNewSolutions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "range_m");
  double v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "range_unc_m");
  id v9 = +[PRRangeMeasurement measurementWithRange:v3 uncertainty:v4];
  objc_msgSend(*(id *)(a1 + 32), "mach_absolute_time_sec");
  int v5 = +[PRRelativePosition relativePositionWithTimestamp:range:azimuth:elevation:](PRRelativePosition, "relativePositionWithTimestamp:range:azimuth:elevation:", v9, 0, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 rangedPeer];
  [WeakRetained rangingSession:v7 didMeasurePeer:v8 atRelativePosition:v5];
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "ranging request updated status: %ld", (uint8_t *)&v5, 0xCu);
  }
}

+ (unint64_t)computeLocalDeviceIndex:(id)a3 sessionParticipants:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"UUIDString" ascending:1];
  v16[0] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v11 = [v7 sortedArrayUsingDescriptors:v10];
  unint64_t v12 = 0;
  while ([v11 count] > v12)
  {
    long long v13 = [v11 objectAtIndex:v12];
    char v14 = [v13 isEqual:v6];

    ++v12;
    if (v14)
    {
      unint64_t v12 = v12;
      goto LABEL_6;
    }
  }
  unint64_t v12 = 0;
LABEL_6:

  objc_sync_exit(v8);
  return v12;
}

- (id)rangingConfigurationWithDeviceIndex:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"MultiSessionDevIndex";
  double v3 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (PRRangingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRRangingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (PRPeer)localPeer
{
  return (PRPeer *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)sessionParticipants
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionParticipants:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (PRPeer)rangedPeer
{
  return (PRPeer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRangedPeer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangedPeer, 0);
  objc_storeStrong((id *)&self->_sessionParticipants, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rangingDevice, 0);
  objc_storeStrong((id *)&self->_localPeer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end