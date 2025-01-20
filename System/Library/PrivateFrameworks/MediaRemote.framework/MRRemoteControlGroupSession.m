@interface MRRemoteControlGroupSession
- (BOOL)canHandleJoinRequests;
- (BOOL)canManageParticipants;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalSession;
- (BOOL)isPlaceholder;
- (MRGroupSessionDelegate)delegate;
- (MRGroupSessionParticipant)host;
- (MRGroupSessionParticipant)localParticipant;
- (MRGroupSessionToken)joinToken;
- (MRGroupSessionXPCConnection)connection;
- (MRRemoteControlGroupSession)initWithIdentifier:(id)a3 delegate:(id)a4;
- (NSData)synchronizedMetadata;
- (NSHashTable)optimisticApprovedPendingParticipants;
- (NSHashTable)optimisticDeniedPendingParticipants;
- (NSHashTable)optimisticRemovedParticipants;
- (NSMapTable)memberMap;
- (NSMapTable)participantMap;
- (NSMapTable)pendingParticipantMap;
- (NSSet)members;
- (NSSet)participants;
- (NSSet)pendingParticipants;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedSessionName;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (id)assertSessionManagementScreenVisible;
- (id)memberForIdentifier:(id)a3;
- (id)participantForIdentifier:(id)a3;
- (id)pendingParticipantForIdentifier:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (unsigned)routeType;
- (void)approvePendingParticipant:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)denyPendingParticipant:(id)a3 completion:(id)a4;
- (void)initializeConnection;
- (void)notifyDelegateOfInvalidation:(id)a3;
- (void)parseInitialState:(id)a3;
- (void)parseParticipants:(id)a3 local:(id *)a4 host:(id *)a5 parsed:(id *)a6;
- (void)removeAllParticipantsWithCompletion:(id)a3;
- (void)removeParticipant:(id)a3 completion:(id)a4;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didConnectWithInitialState:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didUpdateMembers:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHost:(id)a3;
- (void)setJoinToken:(id)a3;
- (void)setLocalParticipant:(id)a3;
- (void)setMemberMap:(id)a3;
- (void)setMembers:(id)a3;
- (void)setOptimisticApprovedPendingParticipants:(id)a3;
- (void)setOptimisticDeniedPendingParticipants:(id)a3;
- (void)setOptimisticRemovedParticipants:(id)a3;
- (void)setParticipantMap:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingParticipantMap:(id)a3;
- (void)setPendingParticipants:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSynchronizedMetadata:(id)a3;
- (void)updateParticipantsForOptimisticStateChange;
@end

@implementation MRRemoteControlGroupSession

- (MRRemoteControlGroupSession)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MRRemoteControlGroupSession;
  v8 = [(MRRemoteControlGroupSession *)&v32 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_state = 0;
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    participantMap = v8->_participantMap;
    v8->_participantMap = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    memberMap = v8->_memberMap;
    v8->_memberMap = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pendingParticipantMap = v8->_pendingParticipantMap;
    v8->_pendingParticipantMap = (NSMapTable *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:2];
    optimisticApprovedPendingParticipants = v8->_optimisticApprovedPendingParticipants;
    v8->_optimisticApprovedPendingParticipants = (NSHashTable *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:2];
    optimisticDeniedPendingParticipants = v8->_optimisticDeniedPendingParticipants;
    v8->_optimisticDeniedPendingParticipants = (NSHashTable *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:2];
    optimisticRemovedParticipants = v8->_optimisticRemovedParticipants;
    v8->_optimisticRemovedParticipants = (NSHashTable *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = MRGroupSessionSubsystemGetQueue();
    dispatch_queue_t v25 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRRemoteControlGroupSession.queue", v23, v24);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = MRGroupSessionSubsystemGetNotificationQueue();
    dispatch_queue_t v29 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRRemoteControlGroupSession.callbackQueue", v27, v28);
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v29;

    [(MRRemoteControlGroupSession *)v8 initializeConnection];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRRemoteControlGroupSession;
  [(MRRemoteControlGroupSession *)&v4 dealloc];
}

- (void)initializeConnection
{
  objc_initWeak(&location, self);
  v3 = [MRGroupSessionXPCConnection alloc];
  objc_super v4 = [MEMORY[0x1E4F77A40] proxyWithObject:self protocol:&unk_1EE6A6F50];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke;
  v9[3] = &unk_1E57D12D0;
  objc_copyWeak(&v10, &location);
  v5 = [(MRGroupSessionXPCConnection *)v3 initWithClientObject:v4 invalidationHandler:v9];
  connection = self->_connection;
  self->_connection = v5;

  uint64_t v7 = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_3;
  v8[3] = &unk_1E57D7440;
  v8[4] = self;
  [(MRGroupSessionXPCConnection *)v7 sendMessage:v8];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_2;
    block[3] = &unk_1E57D0518;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MRGroupSessionError", 1, @"XPC invalidated.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 notifyDelegateOfInvalidation:v2];
}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_4;
  v6[3] = &unk_1E57D9638;
  v6[4] = *(void *)(a1 + 32);
  [v4 connectToSession:v5 reply:v6];
}

void __51__MRRemoteControlGroupSession_initializeConnection__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 152);
    *(void *)(v7 + 152) = 0;

    [*(id *)(a1 + 32) notifyDelegateOfInvalidation:v6];
  }
  else
  {
    uint64_t v9 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 134217984;
      uint64_t v12 = v10;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Connected.", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) parseInitialState:v5];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRRemoteControlGroupSession *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      id v6 = v4->_identifier;
      uint64_t v7 = identifier;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (NSString)description
{
  v3 = [(MRGroupSessionToken *)self->_joinToken hostInfo];
  id v4 = [NSString alloc];
  uint64_t v5 = objc_opt_class();
  id v6 = [(MRRemoteControlGroupSession *)self identifier];
  uint64_t v7 = [v3 displayName];
  v8 = MRGroupSessionRouteTypeDescription([v3 routeType]);
  char v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MRRemoteControlGroupSession isPlaceholder](self, "isPlaceholder"));
  uint64_t v10 = [v9 stringValue];
  int v11 = (void *)[v4 initWithFormat:@"<%@: identifier=%@, name=%@, route=%@, placeholder=%@>", v5, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (void)notifyDelegateOfInvalidation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRRemoteControlGroupSession *)self delegate];
  if (v5)
  {
    id v6 = [(MRRemoteControlGroupSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MRRemoteControlGroupSession_notifyDelegateOfInvalidation___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v8 = v5;
    char v9 = self;
    id v10 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __60__MRRemoteControlGroupSession_notifyDelegateOfInvalidation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didInvalidateWithError:*(void *)(a1 + 48)];
}

- (BOOL)isLocalSession
{
  id v2 = [(MRRemoteControlGroupSession *)self identifier];
  v3 = +[MRAVLocalEndpoint sharedLocalEndpoint];
  id v4 = [v3 groupSessionInfo];
  uint64_t v5 = [v4 identifier];
  if (v2 == v5) {
    char v6 = 1;
  }
  else {
    char v6 = [v2 isEqual:v5];
  }

  return v6;
}

- (BOOL)canManageParticipants
{
  v3 = [(MRRemoteControlGroupSession *)self localParticipant];
  if ([(MRRemoteControlGroupSession *)self isLocalSession])
  {
    LOBYTE(v4) = 1;
  }
  else if (v3)
  {
    int v4 = [v3 isGuest] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)canHandleJoinRequests
{
  if ([(MRRemoteControlGroupSession *)self isLocalSession]) {
    return 1;
  }
  int v4 = [(MRGroupSessionToken *)self->_joinToken equivalentMediaIdentifier];
  BOOL v3 = v4 != 0;

  return v3;
}

- (NSString)localizedSessionName
{
  BOOL v3 = [(MRRemoteControlGroupSession *)self host];
  int v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 identity];
    char v6 = [v5 displayName];
    uint64_t v7 = MRGroupSessionRouteMakeName(v6, [(MRRemoteControlGroupSession *)self routeType]);
  }
  else
  {
    uint64_t v5 = [(MRGroupSessionToken *)self->_joinToken hostInfo];
    uint64_t v7 = [v5 localizedSessionName];
  }

  return (NSString *)v7;
}

- (unsigned)routeType
{
  id v2 = [(MRGroupSessionToken *)self->_joinToken hostInfo];
  unsigned __int8 v3 = [v2 routeType];

  return v3;
}

- (MRGroupSessionToken)joinToken
{
  if ([(MRRemoteControlGroupSession *)self isPlaceholder]) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = self->_joinToken;
  }

  return v3;
}

- (int64_t)state
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MRRemoteControlGroupSession_state__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__MRRemoteControlGroupSession_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (NSData)synchronizedMetadata
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__45;
  int v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MRRemoteControlGroupSession_synchronizedMetadata__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

void __51__MRRemoteControlGroupSession_synchronizedMetadata__block_invoke(uint64_t a1)
{
}

- (NSSet)members
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__45;
  int v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__MRRemoteControlGroupSession_members__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __38__MRRemoteControlGroupSession_members__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  unsigned __int8 v3 = v2;
  if (!v2)
  {
    unsigned __int8 v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (!v2)
  {
  }
}

- (NSSet)participants
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__45;
  int v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MRRemoteControlGroupSession_participants__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __43__MRRemoteControlGroupSession_participants__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  unsigned __int8 v3 = v2;
  if (!v2)
  {
    unsigned __int8 v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (!v2)
  {
  }
}

- (NSSet)pendingParticipants
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__45;
  int v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MRRemoteControlGroupSession_pendingParticipants__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __50__MRRemoteControlGroupSession_pendingParticipants__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  unsigned __int8 v3 = v2;
  if (!v2)
  {
    unsigned __int8 v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v4 = v3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (!v2)
  {
  }
}

- (MRGroupSessionParticipant)host
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__45;
  int v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MRRemoteControlGroupSession_host__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRGroupSessionParticipant *)v4;
}

void __35__MRRemoteControlGroupSession_host__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && [*(id *)(a1 + 32) isLocalSession])
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 112);
    unsigned __int8 v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v3, v2);
  }
}

- (MRGroupSessionParticipant)localParticipant
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__45;
  int v11 = __Block_byref_object_dispose__45;
  id v12 = 0;
  unsigned __int8 v3 = [(MRRemoteControlGroupSession *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MRRemoteControlGroupSession_localParticipant__block_invoke;
  v6[3] = &unk_1E57D0590;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRGroupSessionParticipant *)v4;
}

void __47__MRRemoteControlGroupSession_localParticipant__block_invoke(uint64_t a1)
{
}

- (id)memberForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__45;
  v16 = __Block_byref_object_dispose__45;
  id v17 = 0;
  uint64_t v5 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRRemoteControlGroupSession_memberForIdentifier___block_invoke;
  block[3] = &unk_1E57D1C88;
  id v10 = v4;
  int v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__MRRemoteControlGroupSession_memberForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)participantForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__45;
  v16 = __Block_byref_object_dispose__45;
  id v17 = 0;
  id v5 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MRRemoteControlGroupSession_participantForIdentifier___block_invoke;
  block[3] = &unk_1E57D1C88;
  id v10 = v4;
  int v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__MRRemoteControlGroupSession_participantForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) participantMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)pendingParticipantForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__45;
  v16 = __Block_byref_object_dispose__45;
  id v17 = 0;
  id v5 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRRemoteControlGroupSession_pendingParticipantForIdentifier___block_invoke;
  block[3] = &unk_1E57D1C88;
  id v10 = v4;
  int v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__MRRemoteControlGroupSession_pendingParticipantForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) pendingParticipantMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)approvePendingParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] pendingParticipantMap];
  uint64_t v3 = [a1[5] identifier];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = [MRCodableGroupSessionParticipant alloc];
    id v6 = [v4 identifier];
    id v7 = [v4 identity];
    id v8 = -[MRCodableGroupSessionParticipant initWithIdentifier:identity:connected:guest:hidden:](v5, "initWithIdentifier:identity:connected:guest:hidden:", v6, v7, 1, [v4 isGuest], objc_msgSend(v4, "isHidden"));

    [(MRCodableGroupSessionParticipant *)v8 setPending:0];
    id v9 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = a1[4];
      id v11 = a1[5];
      *(_DWORD *)buf = 134218242;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Set optimistic state for approved participant %@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, a1[4]);
    id v12 = [a1[4] optimisticApprovedPendingParticipants];
    id v13 = [MROptimisticState alloc];
    uint64_t v14 = [a1[4] queue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_373;
    v23[3] = &unk_1E57D9660;
    objc_copyWeak(&v24, (id *)buf);
    uint64_t v15 = [(MROptimisticState *)v13 initWithInitialState:0 expectedState:v8 timeout:v14 queue:v23 timeoutHandler:15.0];
    [v12 addObject:v15];

    [a1[4] updateParticipantsForOptimisticStateChange];
    v16 = a1[4];
    id v17 = (void *)v16[19];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_375;
    v20[3] = &unk_1E57D9688;
    v20[4] = v16;
    id v21 = v4;
    id v22 = a1[6];
    [v17 sendMessage:v20];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v18 = (void (**)(id, void *))a1[6];
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MRGroupSessionError", 8, @"Pending participant no longer available.");
    v18[2](v18, v19);
  }
}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_373(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained participantMap];
    id v7 = [v3 expectedState];
    id v8 = [v7 identifier];
    id v9 = [v6 objectForKey:v8];

    if (!v9)
    {
      id v10 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_373_cold_1((uint64_t)v5, v3);
      }
    }
    id v11 = [v5 optimisticApprovedPendingParticipants];
    [v11 removeObject:v3];

    [v5 updateParticipantsForOptimisticStateChange];
  }
}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_375(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 session:v5 approvePendingParticipant:a1[5] reply:a1[6]];
}

- (void)denyPendingParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] pendingParticipantMap];
  id v3 = [a1[5] identifier];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[4];
      id v7 = a1[5];
      *(_DWORD *)buf = 134218242;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Set optimistic state for denied participant %@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, a1[4]);
    id v8 = [a1[4] optimisticDeniedPendingParticipants];
    id v9 = [MROptimisticState alloc];
    id v10 = a1[5];
    id v11 = [a1[4] queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_379;
    v20[3] = &unk_1E57D9660;
    objc_copyWeak(&v21, (id *)buf);
    id v12 = [(MROptimisticState *)v9 initWithInitialState:v10 expectedState:0 timeout:v11 queue:v20 timeoutHandler:5.0];
    [v8 addObject:v12];

    [a1[4] updateParticipantsForOptimisticStateChange];
    id v13 = a1[4];
    uint64_t v14 = (void *)v13[19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_380;
    v17[3] = &unk_1E57D9688;
    v17[4] = v13;
    id v18 = v4;
    id v19 = a1[6];
    [v14 sendMessage:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v15 = (void (**)(id, void *))a1[6];
    v16 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MRGroupSessionError", 8, @"Pending participant no longer available.");
    v15[2](v15, v16);
  }
}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_379(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained pendingParticipantMap];
    id v7 = [v3 initialState];
    id v8 = [v7 identifier];
    id v9 = [v6 objectForKey:v8];

    if (v9)
    {
      id v10 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_379_cold_1((uint64_t)v5, v3);
      }
    }
    id v11 = [v5 optimisticDeniedPendingParticipants];
    [v11 removeObject:v3];

    [v5 updateParticipantsForOptimisticStateChange];
  }
}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_380(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 session:v5 denyPendingParticipant:a1[5] reply:a1[6]];
}

- (id)assertSessionManagementScreenVisible
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__45;
  __int16 v24 = __Block_byref_object_dispose__45;
  id v25 = 0;
  id v5 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke;
  block[3] = &unk_1E57D0590;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_sync(v5, block);

  v26[0] = @"MRGroupSessionEventOptionEventType";
  v26[1] = @"MRGroupSessionEventOptionSessionIdentifier";
  uint64_t v6 = v21[5];
  v27[0] = &unk_1EE66F2E8;
  v27[1] = v6;
  v26[2] = @"MRGroupSessionEventOptionAssertionIdentifier";
  v27[2] = v4;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_386;
  v16[3] = &unk_1E57D96B0;
  id v8 = v4;
  id v17 = v8;
  id v18 = &v20;
  MRGroupSessionSendEvent(v7, v16);
  id v9 = [MRGroupSessionAssertion alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_388;
  v13[3] = &unk_1E57D0590;
  uint64_t v15 = &v20;
  id v10 = v8;
  id v14 = v10;
  id v11 = [(MRGroupSessionAssertion *)v9 initWithCancellationHandler:v13];

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke(uint64_t a1)
{
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_386(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0xCuLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_386_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Began assertion %@ for session with identifier: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_388(uint64_t a1)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MRGroupSessionEventOptionEventType";
  v10[1] = @"MRGroupSessionEventOptionSessionIdentifier";
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v11[0] = &unk_1EE66F300;
  v11[1] = v3;
  v10[2] = @"MRGroupSessionEventOptionAssertionIdentifier";
  v11[2] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_391;
  v7[3] = &unk_1E57D96B0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  MRGroupSessionSendEvent(v4, v7);
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_391(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _MRLogForCategory(0xCuLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_391_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Ended assertion %@ for session with identifier: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)removeAllParticipantsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MRRemoteControlGroupSession *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke;
  v7[3] = &unk_1E57D03B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 152);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E57D96D8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 sendMessage:v3];
}

void __67__MRRemoteControlGroupSession_removeAllParticipantsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 session:v5 removeAllParticipantsWithReply:*(void *)(a1 + 40)];
}

- (void)removeParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MRRemoteControlGroupSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] participantMap];
  id v3 = [a1[5] identifier];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    id v5 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[4];
      id v7 = a1[5];
      *(_DWORD *)buf = 134218242;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Set optimistic state for removed participant %@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, a1[4]);
    id v8 = [a1[4] optimisticRemovedParticipants];
    id v9 = [MROptimisticState alloc];
    id v10 = a1[5];
    uint64_t v11 = [a1[4] queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_392;
    v18[3] = &unk_1E57D9660;
    objc_copyWeak(&v19, (id *)buf);
    id v12 = [(MROptimisticState *)v9 initWithInitialState:v10 expectedState:0 timeout:v11 queue:v18 timeoutHandler:5.0];
    [v8 addObject:v12];

    [a1[4] updateParticipantsForOptimisticStateChange];
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  id v13 = a1[4];
  id v14 = (void *)v13[19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_393;
  v15[3] = &unk_1E57D9688;
  v15[4] = v13;
  id v16 = a1[5];
  id v17 = a1[6];
  [v14 sendMessage:v15];
}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_392(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained participantMap];
    id v7 = [v3 initialState];
    id v8 = [v7 identifier];
    id v9 = [v6 objectForKey:v8];

    if (v9)
    {
      id v10 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_392_cold_1((uint64_t)v5, v3);
      }
    }
    uint64_t v11 = [v5 optimisticRemovedParticipants];
    [v11 removeObject:v3];

    [v5 updateParticipantsForOptimisticStateChange];
  }
}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_393(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) identifier];
  [v4 session:v6 removeParticipant:v5 reply:*(void *)(a1 + 48)];
}

- (void)parseParticipants:(id)a3 local:(id *)a4 host:(id *)a5 parsed:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void *)[v9 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "isLocal", (void)v18))
        {
          id v17 = v16;
          *a4 = v17;
          [v10 removeObject:v17];
        }
        if ([v16 isHost]) {
          *a5 = v16;
        }
        if ([v16 isHidden]) {
          [v10 removeObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  *a6 = (id)[v10 copy];
}

- (void)parseInitialState:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58 = [v4 objectForKeyedSubscript:@"_MRGroupSessionStateInitialSyncKey"];
  int64_t v53 = [v58 integerValue];
  self->_state = v53;
  id v5 = [v4 objectForKeyedSubscript:@"_MRGroupSessionPlaceholderInitialSyncKey"];
  id v6 = v5;
  if (v5) {
    self->_placeholder = [v5 BOOLValue];
  }
  v57 = v6;
  id v7 = [MRGroupSessionToken alloc];
  id v8 = [v4 objectForKeyedSubscript:@"_MRGroupSessionTokenInitialSyncKey"];
  id v9 = [(MRGroupSessionToken *)v7 initWithData:v8];
  joinToken = self->_joinToken;
  self->_joinToken = v9;

  id v11 = [v4 objectForKeyedSubscript:@"_MRGroupSessionParticipantsInitialSyncKey"];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        id v17 = [(MRRemoteControlGroupSession *)self participantMap];
        long long v18 = [v16 identifier];
        [v17 setObject:v16 forKey:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v82 objects:v88 count:16];
    }
    while (v13);
  }
  v59 = v4;
  long long v19 = [v4 objectForKeyedSubscript:@"_MRGroupSessionPendingParticipantsInitialSyncKey"];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v78 objects:v87 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v79 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v78 + 1) + 8 * j);
        id v25 = [(MRRemoteControlGroupSession *)self pendingParticipantMap];
        uint64_t v26 = [v24 identifier];
        [v25 setObject:v24 forKey:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v21);
  }
  if (v19)
  {
    __int16 v27 = v19;
  }
  else
  {
    __int16 v27 = [MEMORY[0x1E4F1CAD0] set];
  }
  pendingParticipants = self->_pendingParticipants;
  self->_pendingParticipants = v27;

  id v76 = 0;
  id v77 = 0;
  id v75 = 0;
  [(MRRemoteControlGroupSession *)self parseParticipants:v11 local:&v77 host:&v76 parsed:&v75];
  id v29 = v77;
  id v56 = v77;
  id v30 = v76;
  id v55 = v76;
  id v31 = v75;
  id v32 = v31;
  if (v31)
  {
    v33 = (NSSet *)v31;
  }
  else
  {
    v33 = [MEMORY[0x1E4F1CAD0] set];
  }
  participants = self->_participants;
  self->_participants = v33;

  objc_storeStrong((id *)&self->_localParticipant, v29);
  objc_storeStrong((id *)&self->_host, v30);
  v35 = [v59 objectForKeyedSubscript:@"_MRGroupSessionMembersInitialSyncKey"];
  v36 = v35;
  v60 = v32;
  if (v35)
  {
    id v37 = v35;
  }
  else
  {
    id v37 = [MEMORY[0x1E4F1CAD0] set];
  }
  v38 = v37;

  long long v74 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  obuint64_t j = v38;
  id v39 = v38;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v72 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = *(void **)(*((void *)&v71 + 1) + 8 * k);
        v45 = [(MRRemoteControlGroupSession *)self memberMap];
        v46 = [v44 identifier];
        [v45 setObject:v44 forKey:v46];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v71 objects:v86 count:16];
    }
    while (v41);
  }

  objc_storeStrong((id *)&self->_members, obj);
  v47 = v60;
  uint64_t v48 = [v60 count];
  uint64_t v49 = [v39 count];
  uint64_t v50 = [v19 count];
  v51 = [(MRRemoteControlGroupSession *)self delegate];
  if (v51)
  {
    v52 = [(MRRemoteControlGroupSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MRRemoteControlGroupSession_parseInitialState___block_invoke;
    block[3] = &unk_1E57D9700;
    id v62 = v51;
    v63 = self;
    int64_t v67 = v53;
    BOOL v68 = v49 != 0;
    id v64 = v39;
    BOOL v69 = v48 != 0;
    id v65 = v60;
    BOOL v70 = v50 != 0;
    v47 = v60;
    id v66 = v19;
    dispatch_async(v52, block);
  }
}

uint64_t __49__MRRemoteControlGroupSession_parseInitialState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) groupSessionDidConnect:*(void *)(a1 + 40)];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didChangeState:*(void *)(a1 + 72)];
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didUpdateMembers:*(void *)(a1 + 48)];
    }
  }
  if (*(unsigned char *)(a1 + 81))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didUpdateParticipants:*(void *)(a1 + 56)];
    }
  }
  if (*(unsigned char *)(a1 + 82))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 64);
      return [v3 groupSession:v4 didUpdatePendingParticipants:v5];
    }
  }
  return result;
}

- (void)updateParticipantsForOptimisticStateChange
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRRemoteControlGroupSession *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v63 = self;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> updateParticipantsForOptimisticStateChange.", buf, 0xCu);
  }

  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = [(MRRemoteControlGroupSession *)self participantMap];
  id v7 = [v6 objectEnumerator];
  id v8 = [v7 allObjects];
  id v9 = [v5 setWithArray:v8];

  id v10 = (void *)[(NSSet *)self->_pendingParticipants mutableCopy];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = [(MRRemoteControlGroupSession *)self optimisticApprovedPendingParticipants];
  uint64_t v12 = [v11 allObjects];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v57 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long v18 = [v17 expectedState];
        [v10 removeObject:v18];

        long long v19 = [v17 expectedState];
        [v9 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v14);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v20 = [(MRRemoteControlGroupSession *)self optimisticDeniedPendingParticipants];
  uint64_t v21 = [v20 allObjects];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = [*(id *)(*((void *)&v52 + 1) + 8 * j) initialState];
        [v10 removeObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v23);
  }

  id v50 = 0;
  id v51 = 0;
  id v49 = 0;
  [(MRRemoteControlGroupSession *)self parseParticipants:v9 local:&v51 host:&v50 parsed:&v49];
  id v27 = v51;
  id v28 = v50;
  id v29 = v49;
  id v30 = v49;
  BOOL v31 = [(NSSet *)self->_participants isEqualToSet:v30];
  if (!v31) {
    objc_storeStrong((id *)&self->_participants, v29);
  }
  BOOL v32 = [(NSSet *)self->_pendingParticipants isEqualToSet:v10];
  if (!v32)
  {
    v33 = (NSSet *)[v10 copy];
    pendingParticipants = self->_pendingParticipants;
    self->_pendingParticipants = v33;
  }
  BOOL v35 = !v32;
  BOOL v36 = !v31;
  id v37 = [(MRRemoteControlGroupSession *)self delegate];
  v38 = [(MRRemoteControlGroupSession *)self callbackQueue];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __73__MRRemoteControlGroupSession_updateParticipantsForOptimisticStateChange__block_invoke;
  v42[3] = &unk_1E57D9728;
  BOOL v47 = v36;
  id v43 = v37;
  v44 = self;
  BOOL v48 = v35;
  id v45 = v30;
  id v46 = v10;
  id v39 = v10;
  id v40 = v30;
  id v41 = v37;
  dispatch_async(v38, v42);
}

uint64_t __73__MRRemoteControlGroupSession_updateParticipantsForOptimisticStateChange__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 64))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v2 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(v1 + 40);
        uint64_t v4 = *(void *)(v1 + 48);
        int v8 = 134218242;
        uint64_t v9 = v3;
        __int16 v10 = 2112;
        uint64_t v11 = v4;
        _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdateParticipants: %@.", (uint8_t *)&v8, 0x16u);
      }

      uint64_t result = [*(id *)(v1 + 32) groupSession:*(void *)(v1 + 40) didUpdateParticipants:*(void *)(v1 + 48)];
    }
  }
  if (*(unsigned char *)(v1 + 65))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = _MRLogForCategory(0xCuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(v1 + 40);
        uint64_t v7 = *(void *)(v1 + 56);
        int v8 = 134218242;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdatePendingParticipants: %@.", (uint8_t *)&v8, 0x16u);
      }

      return [*(id *)(v1 + 32) groupSession:*(void *)(v1 + 40) didUpdatePendingParticipants:*(void *)(v1 + 56)];
    }
  }
  return result;
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  uint64_t v6 = [(MRRemoteControlGroupSession *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke;
  v7[3] = &unk_1E57D2098;
  void v7[4] = self;
  void v7[5] = a4;
  dispatch_async(v6, v7);
}

void __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    uint64_t v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update state %ld.", buf, 0x16u);
  }

  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke_403;
    block[3] = &unk_1E57D4358;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    dispatch_async(v6, block);
  }
}

uint64_t __54__MRRemoteControlGroupSession_session_didChangeState___block_invoke_403(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didChangeState:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MRRemoteControlGroupSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v74 = v3;
    __int16 v75 = 2112;
    uint64_t v76 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update participants %@.", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) participantMap];
  [v5 removeAllObjects];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(a1 + 32) participantMap];
        uint64_t v13 = [v11 identifier];
        [v12 setObject:v11 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v8);
  }

  uint64_t v14 = (void *)[*(id *)(a1 + 40) mutableCopy];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) optimisticApprovedPendingParticipants];
  __int16 v16 = [v15 allObjects];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        uint64_t v22 = *(void **)(a1 + 40);
        uint64_t v23 = [v21 expectedState];
        LODWORD(v22) = [v22 containsObject:v23];

        if (v22)
        {
          uint64_t v24 = [*(id *)(a1 + 32) optimisticApprovedPendingParticipants];
          [v24 removeObject:v21];
        }
        else
        {
          uint64_t v24 = [v21 expectedState];
          [v14 addObject:v24];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v18);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v25 = [*(id *)(a1 + 32) optimisticRemovedParticipants];
  uint64_t v26 = [v25 allObjects];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        BOOL v31 = *(void **)(*((void *)&v58 + 1) + 8 * k);
        BOOL v32 = *(void **)(a1 + 40);
        v33 = [v31 initialState];
        LOBYTE(v32) = [v32 containsObject:v33];

        if (v32)
        {
          v34 = [v31 initialState];
          BOOL v35 = v14;
          BOOL v36 = v34;
        }
        else
        {
          BOOL v35 = [*(id *)(a1 + 32) optimisticRemovedParticipants];
          v34 = v35;
          BOOL v36 = v31;
        }
        [v35 removeObject:v36];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v28);
  }

  id v37 = *(void **)(a1 + 32);
  id v56 = 0;
  id v57 = 0;
  id v55 = 0;
  [v37 parseParticipants:v14 local:&v57 host:&v56 parsed:&v55];
  id v38 = v57;
  id v39 = v57;
  id v40 = v56;
  id v41 = v56;
  id v42 = v55;
  id v43 = v55;
  id v44 = *(id *)(*(void *)(a1 + 32) + 32);
  if (v44 == v43)
  {
  }
  else
  {
    id v45 = v44;
    int v46 = [v44 isEqual:v43];

    if (!v46)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v38);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v40);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v42);
LABEL_36:
      id v50 = [*(id *)(a1 + 32) delegate];
      if (v50 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v51 = [*(id *)(a1 + 32) callbackQueue];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke_404;
        v52[3] = &unk_1E57D1B18;
        v52[4] = *(void *)(a1 + 32);
        id v53 = v43;
        id v54 = v50;
        dispatch_async(v51, v52);
      }
      goto LABEL_41;
    }
  }
  id v47 = *(id *)(*(void *)(a1 + 32) + 104);
  BOOL v48 = v47;
  if (v47 == v41)
  {

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v38);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v40);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v42);
    goto LABEL_41;
  }
  int v49 = [v47 isEqual:v41];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v38);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v40);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v42);
  if (!v49) {
    goto LABEL_36;
  }
LABEL_41:
}

uint64_t __61__MRRemoteControlGroupSession_session_didUpdateParticipants___block_invoke_404(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdateParticipants: %@.", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) groupSession:*(void *)(a1 + 32) didUpdateParticipants:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  id v5 = a4;
  int v6 = [(MRRemoteControlGroupSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v66 = v3;
    __int16 v67 = 2112;
    uint64_t v68 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update pending participants %@.", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) pendingParticipantMap];
  [v5 removeAllObjects];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v12 = [*(id *)(a1 + 32) pendingParticipantMap];
        uint64_t v13 = [v11 identifier];
        [v12 setObject:v11 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v8);
  }

  id v14 = (id)[*(id *)(a1 + 40) mutableCopy];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) optimisticApprovedPendingParticipants];
  __int16 v16 = [v15 allObjects];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        uint64_t v22 = [v21 expectedState];
        int v23 = [v14 containsObject:v22];

        if (v23)
        {
          uint64_t v24 = [v21 expectedState];
          [v14 removeObject:v24];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v18);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v25 = [*(id *)(a1 + 32) optimisticDeniedPendingParticipants];
  uint64_t v26 = [v25 allObjects];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        BOOL v31 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        BOOL v32 = [v31 initialState];
        char v33 = [v14 containsObject:v32];

        if (v33)
        {
          v34 = [v31 initialState];
          BOOL v35 = v14;
          BOOL v36 = v34;
        }
        else
        {
          BOOL v35 = [*(id *)(a1 + 32) optimisticDeniedPendingParticipants];
          v34 = v35;
          BOOL v36 = v31;
        }
        [v35 removeObject:v36];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v28);
  }

  id v37 = *(id *)(*(void *)(a1 + 32) + 48);
  if (v37 == v14)
  {

    uint64_t v45 = [v14 copy];
    uint64_t v46 = *(void *)(a1 + 32);
    id v43 = *(id *)(v46 + 48);
    *(void *)(v46 + 48) = v45;
LABEL_35:

    goto LABEL_36;
  }
  id v38 = v37;
  char v39 = [v37 isEqual:v14];

  uint64_t v40 = [v14 copy];
  uint64_t v41 = *(void *)(a1 + 32);
  id v42 = *(void **)(v41 + 48);
  *(void *)(v41 + 48) = v40;

  if ((v39 & 1) == 0)
  {
    id v43 = [*(id *)(a1 + 32) delegate];
    if (v43 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v44 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke_405;
      block[3] = &unk_1E57D1B18;
      void block[4] = *(void *)(a1 + 32);
      id v48 = v14;
      id v43 = v43;
      id v49 = v43;
      dispatch_async(v44, block);
    }
    goto LABEL_35;
  }
LABEL_36:
}

uint64_t __68__MRRemoteControlGroupSession_session_didUpdatePendingParticipants___block_invoke_405(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Notify didUpdatePendingParticipants: %@.", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) groupSession:*(void *)(a1 + 32) didUpdatePendingParticipants:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 didUpdateMembers:(id)a4
{
  id v5 = a4;
  int v6 = [(MRRemoteControlGroupSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = v3;
    __int16 v30 = 2112;
    uint64_t v31 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update members %@.", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  id v5 = [*(id *)(a1 + 32) memberMap];
  [v5 removeAllObjects];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) memberMap];
        uint64_t v13 = [v11 identifier];
        [v12 setObject:v11 forKey:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  id v14 = [*(id *)(a1 + 32) delegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v15 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke_406;
    block[3] = &unk_1E57D1B18;
    id v16 = v14;
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(a1 + 40);
    id v20 = v16;
    uint64_t v21 = v17;
    id v22 = v18;
    dispatch_async(v15, block);
  }
}

uint64_t __56__MRRemoteControlGroupSession_session_didUpdateMembers___block_invoke_406(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didUpdateMembers:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(MRRemoteControlGroupSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v3;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Update synchronized metadata.", buf, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke_409;
    block[3] = &unk_1E57D1B18;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v10 = v6;
    uint64_t v11 = v7;
    id v12 = v8;
    dispatch_async(v5, block);
  }
}

uint64_t __69__MRRemoteControlGroupSession_session_didUpdateSynchronizedMetadata___block_invoke_409(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didUpdateSynchronizedMetadata:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(MRRemoteControlGroupSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> invalidated %@.", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) optimisticRemovedParticipants];
  [v5 removeAllObjects];

  id v6 = [*(id *)(a1 + 32) optimisticApprovedPendingParticipants];
  [v6 removeAllObjects];

  id v7 = [*(id *)(a1 + 32) optimisticDeniedPendingParticipants];
  [v7 removeAllObjects];

  uint64_t v8 = [*(id *)(a1 + 32) delegate];
  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 32) setConnection:0];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke_410;
    block[3] = &unk_1E57D1B18;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    dispatch_async(v9, block);
  }
}

uint64_t __62__MRRemoteControlGroupSession_session_didInvalidateWithError___block_invoke_410(uint64_t a1)
{
  return [*(id *)(a1 + 32) groupSession:*(void *)(a1 + 40) didInvalidateWithError:*(void *)(a1 + 48)];
}

- (void)session:(id)a3 didConnectWithInitialState:(id)a4
{
  id v5 = a4;
  id v6 = [(MRRemoteControlGroupSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MRRemoteControlGroupSession_session_didConnectWithInitialState___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __66__MRRemoteControlGroupSession_session_didConnectWithInitialState___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] <%p> Connected after initialization", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) parseInitialState:*(void *)(a1 + 40)];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setParticipants:(id)a3
{
}

- (NSMapTable)participantMap
{
  return self->_participantMap;
}

- (void)setParticipantMap:(id)a3
{
}

- (void)setPendingParticipants:(id)a3
{
}

- (NSMapTable)pendingParticipantMap
{
  return self->_pendingParticipantMap;
}

- (void)setPendingParticipantMap:(id)a3
{
}

- (void)setMembers:(id)a3
{
}

- (NSMapTable)memberMap
{
  return self->_memberMap;
}

- (void)setMemberMap:(id)a3
{
}

- (NSHashTable)optimisticApprovedPendingParticipants
{
  return self->_optimisticApprovedPendingParticipants;
}

- (void)setOptimisticApprovedPendingParticipants:(id)a3
{
}

- (NSHashTable)optimisticDeniedPendingParticipants
{
  return self->_optimisticDeniedPendingParticipants;
}

- (void)setOptimisticDeniedPendingParticipants:(id)a3
{
}

- (NSHashTable)optimisticRemovedParticipants
{
  return self->_optimisticRemovedParticipants;
}

- (void)setOptimisticRemovedParticipants:(id)a3
{
}

- (void)setHost:(id)a3
{
}

- (void)setLocalParticipant:(id)a3
{
}

- (void)setJoinToken:(id)a3
{
}

- (void)setSynchronizedMetadata:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (MRGroupSessionXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (MRGroupSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRGroupSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_synchronizedMetadata, 0);
  objc_storeStrong((id *)&self->_joinToken, 0);
  objc_storeStrong((id *)&self->_localParticipant, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_optimisticRemovedParticipants, 0);
  objc_storeStrong((id *)&self->_optimisticDeniedPendingParticipants, 0);
  objc_storeStrong((id *)&self->_optimisticApprovedPendingParticipants, 0);
  objc_storeStrong((id *)&self->_memberMap, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_pendingParticipantMap, 0);
  objc_storeStrong((id *)&self->_pendingParticipants, 0);
  objc_storeStrong((id *)&self->_participantMap, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __68__MRRemoteControlGroupSession_approvePendingParticipant_completion___block_invoke_373_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 expectedState];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v3, v4, "[MRGroupSession] <%p> Approved participant %@ not found after timeout.", v5, v6, v7, v8, v9);
}

void __65__MRRemoteControlGroupSession_denyPendingParticipant_completion___block_invoke_379_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 initialState];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v3, v4, "[MRGroupSession] <%p> Denied participant %@ still found after timeout.", v5, v6, v7, v8, v9);
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_386_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6_2(&dword_194F3C000, v0, v1, "[MRGroupSession] Failed to assert %@ for session with identifier: %@: %@");
}

void __67__MRRemoteControlGroupSession_assertSessionManagementScreenVisible__block_invoke_391_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_6_2(&dword_194F3C000, v0, v1, "[MRGroupSession] Failed to end assertion %@ for session with identifier: %@: %@");
}

void __60__MRRemoteControlGroupSession_removeParticipant_completion___block_invoke_392_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 initialState];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_0(&dword_194F3C000, v3, v4, "[MRGroupSession] <%p> Removed participant %@ still found after timeout.", v5, v6, v7, v8, v9);
}

@end