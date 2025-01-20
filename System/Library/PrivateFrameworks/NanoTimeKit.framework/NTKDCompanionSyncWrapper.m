@interface NTKDCompanionSyncWrapper
- (BOOL)_discardIncomingPartialMessagesIfNeededWithErrorMessage:(id)a3;
- (BOOL)_discardOutgoingPartialMessagesIfNeededWithErrorMessage:(id)a3;
- (BOOL)isPrimary;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NTKDCompanionSyncWrapper)init;
- (NTKDSyncDelegate)delegate;
- (id)_nextMessageToSendForSession:(id)a3;
- (id)_storePartAndReassembleWideLoadIfPossible:(id)a3;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)initAsPrimary:(BOOL)a3;
- (int64_t)_getNextSyncBackoffPeriod;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)_queue_deltaSync;
- (void)_queue_deltaSync_async;
- (void)_queue_requestSync:(int64_t)a3 withBlock:(id)a4;
- (void)_queue_resetSync;
- (void)_reportProgressForMessage:(id)a3 inSession:(id)a4;
- (void)_resetBackoffPeriod;
- (void)dealloc;
- (void)requestDeltaSync;
- (void)requestResetSync;
- (void)resume;
- (void)sendOutOfBandMessage:(id)a3 ofType:(int64_t)a4;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 incomingData:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)suspend;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation NTKDCompanionSyncWrapper

- (NTKDCompanionSyncWrapper)init
{
  return (NTKDCompanionSyncWrapper *)[(NTKDCompanionSyncWrapper *)self initAsPrimary:0];
}

- (id)initAsPrimary:(BOOL)a3
{
  BOOL v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKDCompanionSyncWrapper;
  v4 = [(NTKDCompanionSyncWrapper *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_isPrimary = v3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.pairedsync.faces.NTKSyncBackoffQueue", 0);
    syncSerialQueue = v5->_syncSerialQueue;
    v5->_syncSerialQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.pairedsync.faces.NTKSyncServiceQueue", 0);
    syncServiceQueue = v5->_syncServiceQueue;
    v5->_syncServiceQueue = (OS_dispatch_queue *)v8;

    v10 = (SYService *)[objc_alloc((Class)SYService) initWithService:@"com.apple.private.alloy.clockface.sync" priority:0 asMasterStore:v5->_isPrimary options:0];
    syncService = v5->_syncService;
    v5->_syncService = v10;

    [(SYService *)v5->_syncService setDelegate:v5 queue:v5->_syncServiceQueue];
    uint64_t v28 = IDSSendMessageOptionBypassDuetKey;
    v29 = &__kCFBooleanTrue;
    v12 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [(SYService *)v5->_syncService setOptions:v12];

    uint64_t v13 = +[NSMutableDictionary dictionary];
    rateLimiters = v5->_rateLimiters;
    v5->_rateLimiters = (NSMutableDictionary *)v13;

    v15 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v5->_syncService;
      v16 = v5->_syncServiceQueue;
      *(_DWORD *)buf = 138544130;
      v21 = v5;
      __int16 v22 = 1024;
      BOOL v23 = v3;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "NTKDCompanionSyncWrapper initialized. %{public}@ - isPrimary:%d - _syncServiceQueue:%@ _syncService:%@", buf, 0x26u);
    }
  }
  return v5;
}

- (void)dealloc
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NTKDCompanionSyncWrapper dealloc'ed. %{public}@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NTKDCompanionSyncWrapper;
  [(NTKDCompanionSyncWrapper *)&v4 dealloc];
}

- (void)resume
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resuming companion sync service.", buf, 2u);
  }

  objc_super v4 = [(NTKDCompanionSyncWrapper *)self delegate];
  unsigned __int8 v5 = [v4 companionSyncWrapperCanSendData];

  if (v5)
  {
    self->_resumeWhenSyncRestrictionLifted = 0;
    syncService = self->_syncService;
    id v11 = 0;
    unsigned __int8 v7 = [(SYService *)syncService resume:&v11];
    id v8 = v11;
    if ((v7 & 1) == 0)
    {
      v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000440F8();
      }
    }
  }
  else
  {
    v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "currently under paired sync restriction; will resume later",
        v12,
        2u);
    }

    self->_resumeWhenSyncRestrictionLifted = 1;
  }
}

- (void)suspend
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Syspending companion sync", v4, 2u);
  }

  [(SYService *)self->_syncService suspend];
}

- (void)requestResetSync
{
  BOOL v3 = [(NTKDCompanionSyncWrapper *)self delegate];
  unsigned __int8 v4 = [v3 companionSyncWrapperCanSendData];

  if (v4)
  {
    self->_resetSyncRequestedDuringSyncRestriction = 0;
    syncSerialQueue = self->_syncSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030FD4;
    block[3] = &unk_100060A90;
    block[4] = self;
    dispatch_sync(syncSerialQueue, block);
  }
  else
  {
    dispatch_queue_t v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "currently under paired sync restriction; reset sync requests are deferred during sync restriction",
        buf,
        2u);
    }

    self->_resetSyncRequestedDuringSyncRestriction = 1;
  }
}

- (void)requestDeltaSync
{
  syncSerialQueue = self->_syncSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031050;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_sync(syncSerialQueue, block);
}

- (void)sendOutOfBandMessage:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v7 encodeInteger:a4 forKey:@"com.apple.nanotimekit.messageType"];
  [v7 encodeObject:v6 forKey:@"com.apple.nanotimekit.message"];
  syncService = self->_syncService;
  v9 = [v7 encodedData];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031164;
  v11[3] = &unk_100062130;
  id v12 = v6;
  int64_t v13 = a4;
  id v10 = v6;
  [(SYService *)syncService sendData:v9 options:0 completion:v11];
}

- (void)_queue_resetSync
{
  if (self->_resetSyncRequested)
  {
    v2 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "reset sync ongoing, incoming request ignored", v3, 2u);
    }
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100031404;
    v4[3] = &unk_100060A90;
    v4[4] = self;
    [(NTKDCompanionSyncWrapper *)self _queue_requestSync:0 withBlock:v4];
  }
}

- (void)_queue_deltaSync
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000314F8;
  v2[3] = &unk_100060A90;
  v2[4] = self;
  [(NTKDCompanionSyncWrapper *)self _queue_requestSync:1 withBlock:v2];
}

- (void)_queue_deltaSync_async
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000315EC;
  v2[3] = &unk_100060A90;
  v2[4] = self;
  [(NTKDCompanionSyncWrapper *)self _queue_requestSync:1 withBlock:v2];
}

- (void)_queue_requestSync:(int64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_syncFailureCount < 2)
  {
    if (!a3) {
      self->_resetSyncRequested = 1;
    }
    (*((void (**)(id))v6 + 2))(v6);
  }
  else
  {
    if (self->_syncBackoffOngoing)
    {
      if (a3)
      {
        if (a3 == 1 && self->_resetSyncRequested)
        {
          self->_deltaSyncRequiredAfterBackoff = 1;
          id v8 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v9 = "reset sync under backoff, delta sync delayed";
LABEL_19:
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else if (!self->_resetSyncRequested)
      {
        self->_resetSyncRequiredAfterBackoff = 1;
        id v8 = _NTKLoggingObjectForDomain();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_WORD *)buf = 0;
        v9 = "delta sync under backoff, reset sync delayed";
        goto LABEL_19;
      }
      id v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "delta sync already under backoff, no delta sync requested";
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (!a3) {
      self->_resetSyncRequested = 1;
    }
    self->_syncBackoffOngoing = 1;
    int64_t v10 = [(NTKDCompanionSyncWrapper *)self _getNextSyncBackoffPeriod];
    id v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "backing off for %tu seconds before attempting sync", buf, 0xCu);
    }

    dispatch_time_t v12 = dispatch_time(0, 1000000000 * v10);
    syncSerialQueue = self->_syncSerialQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003195C;
    v14[3] = &unk_100060C08;
    v14[4] = self;
    id v15 = v7;
    dispatch_after(v12, syncSerialQueue, v14);
  }
LABEL_21:
}

- (int64_t)_getNextSyncBackoffPeriod
{
  v2 = +[NSUserDefaults standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"SyncBackoffPeriod"];
  unint64_t v4 = (unint64_t)[v3 integerValue];

  if (!v4)
  {
    unint64_t v4 = 60;
LABEL_7:
    unsigned __int8 v5 = +[NSNumber numberWithUnsignedInteger:v4];
    [v2 setObject:v5 forKey:@"SyncBackoffPeriod"];

    goto LABEL_8;
  }
  if (v4 <= 0x707)
  {
    if (2 * v4 >= 0x708) {
      unint64_t v4 = 1800;
    }
    else {
      v4 *= 2;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (void)_resetBackoffPeriod
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"SyncBackoffPeriod"];
}

- (void)_reportProgressForMessage:(id)a3 inSession:(id)a4
{
  id v6 = a3;
  if (([a4 isResetSync] & 1) != 0
    || ([(NTKDCompanionSyncWrapper *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 companionSyncWrapperDidRequestActivePairedSyncSession],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 syncSessionType],
        v8,
        v7,
        v9 == (id)1))
  {
    [v6 progress];
    double v11 = v10;
    dispatch_time_t v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      double v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sync progress: %f", (uint8_t *)&v15, 0xCu);
    }

    int64_t v13 = [(NTKDCompanionSyncWrapper *)self delegate];
    v14 = [v13 companionSyncWrapperDidRequestActivePairedSyncSession];
    [v14 reportProgress:v11];
  }
}

- (id)_nextMessageToSendForSession:(id)a3
{
  id v4 = a3;
  outgoingWideLoadQueue = self->_outgoingWideLoadQueue;
  if (outgoingWideLoadQueue)
  {
    id v6 = [(_OutgoingWideLoadQueue *)outgoingWideLoadQueue dequeueNextPart];
    if (!v6)
    {
      id v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000441D8(v7, v8, v9, v10, v11, v12, v13, v14);
      }

      int v15 = self->_outgoingWideLoadQueue;
      self->_outgoingWideLoadQueue = 0;
    }
    if ([(_OutgoingWideLoadQueue *)self->_outgoingWideLoadQueue isEmpty])
    {
      double v16 = self->_outgoingWideLoadQueue;
      self->_outgoingWideLoadQueue = 0;
    }
    if (v6) {
      goto LABEL_33;
    }
  }
  v18 = [(NTKDCompanionSyncWrapper *)self delegate];
  id v6 = [v18 outgoingSyncSessionGetNextMessage];

  if (!v6) {
    goto LABEL_32;
  }
  *(void *)&long long v19 = 136315394;
  long long v36 = v19;
  while (1)
  {
    v20 = objc_msgSend(v4, "sessionMetadata", v36, *(_OWORD *)buf, *(void *)&buf[16]);
    v21 = [v20 objectForKeyedSubscript:@"receiverSyncVersion"];
    id v22 = [v21 unsignedLongValue];

    uint64_t v23 = (unint64_t)v22 >= 2 ? 102400 : 0;
    id v24 = [v6 payloadSize];
    if ((unint64_t)v22 > 1)
    {
      if ((unint64_t)v24 <= 0x19000) {
        goto LABEL_32;
      }
    }
    else if ((unint64_t)v24 <= 0x465000)
    {
      goto LABEL_32;
    }
    if (NTKPeerDeviceHandlesWideLoads()) {
      break;
    }
    p_super = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v36;
      *(void *)&uint8_t buf[4] = "-[NTKDCompanionSyncWrapper _nextMessageToSendForSession:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      v31 = p_super;
      v32 = "%s: trying to send wide load message %@ to a peer that cannot handle it; dropping it!";
LABEL_30:
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
    }
LABEL_27:

    v33 = [(NTKDCompanionSyncWrapper *)self delegate];
    id v6 = [v33 outgoingSyncSessionGetNextMessage];

    if (!v6) {
      goto LABEL_32;
    }
  }
  v25 = [[_OutgoingWideLoadQueue alloc] initWithWideLoadMessage:v6 maxPartSize:v23];
  __int16 v26 = self->_outgoingWideLoadQueue;
  self->_outgoingWideLoadQueue = v25;

  v27 = self->_outgoingWideLoadQueue;
  if (!v27)
  {
    p_super = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v36;
      *(void *)&uint8_t buf[4] = "-[NTKDCompanionSyncWrapper _nextMessageToSendForSession:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      v31 = p_super;
      v32 = "%s: cannot create a wide load queue for outgoing message %@; dropping it!";
      goto LABEL_30;
    }
    goto LABEL_27;
  }
  uint64_t v28 = [(_OutgoingWideLoadQueue *)v27 dequeueNextPart];
  if (!v28)
  {
    v29 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v36;
      *(void *)&uint8_t buf[4] = "-[NTKDCompanionSyncWrapper _nextMessageToSendForSession:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: cannot retrieve the first partial message from a wide load queue for outgoing message %@; dropping it!",
        buf,
        0x16u);
    }

    p_super = &self->_outgoingWideLoadQueue->super;
    self->_outgoingWideLoadQueue = 0;
    goto LABEL_27;
  }
  v34 = (void *)v28;

  id v6 = v34;
LABEL_32:
LABEL_33:

  return v6;
}

- (id)_storePartAndReassembleWideLoadIfPossible:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    int64_t v17 = "-[NTKDCompanionSyncWrapper _storePartAndReassembleWideLoadIfPossible:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: store partial message %@", (uint8_t *)&v16, 0x16u);
  }

  id v6 = [v4 wideLoadId];
  p_super = [(NSMutableDictionary *)self->_incomingWideLoadQueues objectForKeyedSubscript:v6];
  if (p_super)
  {
LABEL_8:
    if ([p_super addIncomingPart:v4])
    {
      if (![p_super isFull])
      {
        uint64_t v13 = 0;
        goto LABEL_19;
      }
      uint64_t v13 = [p_super getWideLoad];
      if (v13)
      {
LABEL_17:
        [(NSMutableDictionary *)self->_incomingWideLoadQueues setObject:0 forKeyedSubscript:v6];
LABEL_19:
        goto LABEL_20;
      }
      uint64_t v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000442C8(p_super);
      }
    }
    else
    {
      uint64_t v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10004435C();
      }
      uint64_t v13 = 0;
    }

    goto LABEL_17;
  }
  uint64_t v8 = [[_IncomingWideLoadQueue alloc] initWithPartialMessageTemplate:v4];
  if (v8)
  {
    p_super = &v8->super;
    incomingWideLoadQueues = self->_incomingWideLoadQueues;
    if (!incomingWideLoadQueues)
    {
      uint64_t v10 = +[NSMutableDictionary dictionary];
      uint64_t v11 = self->_incomingWideLoadQueues;
      self->_incomingWideLoadQueues = v10;

      incomingWideLoadQueues = self->_incomingWideLoadQueues;
    }
    [(NSMutableDictionary *)incomingWideLoadQueues setObject:p_super forKeyedSubscript:v6];
    goto LABEL_8;
  }
  p_super = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
    sub_100044250();
  }
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (BOOL)_discardIncomingPartialMessagesIfNeededWithErrorMessage:(id)a3
{
  id v18 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v16 = self;
  id v4 = [(NSMutableDictionary *)self->_incomingWideLoadQueues allValues];
  id v17 = [v4 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v17)
  {
    uint64_t v5 = *(void *)v20;
    id v6 = v17;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v7);
        uint64_t v9 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = [v8 wideLoadId];
          uint64_t v11 = [v8 partsExpected];
          int64_t v12 = v11 - (unsigned char *)[v8 partsAdded];
          id v13 = [v8 partsExpected];
          *(_DWORD *)buf = 136316162;
          id v24 = "-[NTKDCompanionSyncWrapper _discardIncomingPartialMessagesIfNeededWithErrorMessage:]";
          __int16 v25 = 2112;
          id v26 = v18;
          __int16 v27 = 2112;
          uint64_t v28 = v10;
          __int16 v29 = 2048;
          int64_t v30 = v12;
          __int16 v31 = 2048;
          id v32 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: %@; discarding incoming queue for id %@ that still has %lu/%lu messages left",
            buf,
            0x34u);
        }
        id v7 = (char *)v7 + 1;
      }
      while (v6 != v7);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v33 count:16];
    }
    while (v6);
  }

  incomingWideLoadQueues = v16->_incomingWideLoadQueues;
  v16->_incomingWideLoadQueues = 0;

  return v17 != 0;
}

- (BOOL)_discardOutgoingPartialMessagesIfNeededWithErrorMessage:(id)a3
{
  id v4 = a3;
  outgoingWideLoadQueue = self->_outgoingWideLoadQueue;
  p_outgoingWideLoadQueue = &self->_outgoingWideLoadQueue;
  id v6 = outgoingWideLoadQueue;
  if (outgoingWideLoadQueue)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000443D4((uint64_t)v4, (id *)p_outgoingWideLoadQueue, v8);
    }

    uint64_t v9 = *p_outgoingWideLoadQueue;
    *p_outgoingWideLoadQueue = 0;

    uint64_t v10 = *p_outgoingWideLoadQueue;
  }
  else
  {
    uint64_t v10 = 0;
  }
  *p_outgoingWideLoadQueue = 0;

  return v6 != 0;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  id v6 = [(NTKDCompanionSyncWrapper *)self delegate];
  unsigned int v7 = [v6 companionSyncWrapperCanSendData];

  if (v7)
  {
    if (![v5 syncSessionType])
    {
LABEL_7:
      [(NTKDCompanionSyncWrapper *)self requestResetSync];
      goto LABEL_11;
    }
    BOOL resetSyncRequestedDuringSyncRestriction = self->_resetSyncRequestedDuringSyncRestriction;
    uint64_t v9 = _NTKLoggingObjectForDomain();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (resetSyncRequestedDuringSyncRestriction)
    {
      if (v10)
      {
        uint64_t v11 = [v5 sessionIdentifier];
        int v13 = 138412290;
        uint64_t v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_resetSyncRequestedDuringSyncRestriction is YES, force to request reset sync. PSYServiceSyncSession sessionID = (%@)", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_7;
    }
    if (v10)
    {
      int64_t v12 = [v5 sessionIdentifier];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "requesting delta sync. PSYServiceSyncSession sessionID = (%@)", (uint8_t *)&v13, 0xCu);
    }
    [(NTKDCompanionSyncWrapper *)self requestDeltaSync];
  }
LABEL_11:
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4 = a3;
  if (self->_resumeWhenSyncRestrictionLifted)
  {
    id v7 = v4;
    id v5 = [(NTKDCompanionSyncWrapper *)self delegate];
    unsigned int v6 = [v5 companionSyncWrapperCanSendData];

    id v4 = v7;
    if (v6)
    {
      [(NTKDCompanionSyncWrapper *)self resume];
      id v4 = v7;
    }
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [(NTKDCompanionSyncWrapper *)self delegate];
  unsigned __int8 v9 = [v8 companionSyncWrapperCanSendData];

  BOOL v10 = _NTKLoggingObjectForDomain();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      unint64_t v12 = [v7 isResetSync];
      uint64_t v13 = [v7 isSending];
      uint64_t v14 = [v7 identifier];
      int v23 = 134218498;
      unint64_t v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Companion sync starting session. isResetSync: %lu, isSending: %lu, id: %{public}@", (uint8_t *)&v23, 0x20u);
    }
    [v7 setDelegate:self];
    [v7 setSerializer:self];
    [v7 setTargetQueue:self->_syncServiceQueue];
    int v15 = [v7 sessionMetadata];
    int v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

    if ([v7 isSending])
    {
      [v16 setObject:&off_100064058 forKey:@"senderSyncVersion"];
      [v7 setSessionMetadata:v16];
      id v17 = [(NTKDCompanionSyncWrapper *)self delegate];
      objc_msgSend(v17, "outgoingSyncSessionDidStart:", objc_msgSend(v7, "isResetSync"));

      id v18 = [[_RateLimiter alloc] initWithRate:307200];
      rateLimiters = self->_rateLimiters;
      long long v20 = [v7 identifier];
      [(NSMutableDictionary *)rateLimiters setObject:v18 forKeyedSubscript:v20];
    }
    else
    {
      [v16 setObject:&off_100064058 forKey:@"receiverSyncVersion"];
      [v7 setSessionMetadata:v16];
      id v18 = [(NTKDCompanionSyncWrapper *)self delegate];
      -[_RateLimiter incomingSyncSessionDidStart:](v18, "incomingSyncSessionDidStart:", [v7 isResetSync]);
    }
  }
  else
  {
    if (v11)
    {
      long long v21 = [v7 identifier];
      int v23 = 138412290;
      unint64_t v24 = (unint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Companion sync won't start session. It can't send data. SYSession ID = (%@)", (uint8_t *)&v23, 0xCu);
    }
    if (a5) {
      *a5 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.pairedsync.faces" code:302 userInfo:0];
    }
  }

  return v9;
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000444C0();
  }

  syncSerialQueue = self->_syncSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032A5C;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_sync(syncSerialQueue, block);
}

- (void)service:(id)a3 incomingData:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = a4;
  id v20 = 0;
  id v9 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v8 error:&v20];

  id v10 = v20;
  id v11 = [v9 decodeIntegerForKey:@"com.apple.nanotimekit.messageType"];
  unint64_t v12 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.nanotimekit.message"];
  uint64_t v13 = _NTKLoggingObjectForDomain();
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v22 = v11;
      __int16 v23 = 2112;
      unint64_t v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "incoming out of band data -- messageType: %lu, message: %@", buf, 0x16u);
    }

    if (v11 == (id)3)
    {
      NTKUpNextFileRadarWithData();
      goto LABEL_15;
    }
    if (v11 == (id)2)
    {
      NTKPhotosConfirmMemoryWasViewed();
      goto LABEL_15;
    }
    if (v11 == (id)1)
    {
      int v15 = [(NTKDCompanionSyncWrapper *)self delegate];
      if ([v15 companionSyncWrapperCanSendData])
      {
        BOOL resetSyncRequested = self->_resetSyncRequested;

        if (!resetSyncRequested)
        {
          id v17 = [(NTKDCompanionSyncWrapper *)self delegate];
          [v17 incomingLibraryValidationMessage:v12];

LABEL_15:
          v7[2](v7, 1, 0);
          goto LABEL_16;
        }
      }
      else
      {
      }
      id v18 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "library validation rejected -- paired sync ongoing", buf, 2u);
      }

      id v19 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.pairedsync.faces" code:303 userInfo:0];
      ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v19);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100044528();
    }

    v7[2](v7, 0, 0);
  }
LABEL_16:
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, void *))a4;
  id v9 = [(NTKDCompanionSyncWrapper *)self _nextMessageToSendForSession:v7];
  if (v9)
  {
    rateLimiters = self->_rateLimiters;
    id v11 = [v7 identifier];
    unint64_t v12 = [(NSMutableDictionary *)rateLimiters objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = [v9 payloadSize];
      if (v13) {
        uint64_t v14 = (uint64_t)v13;
      }
      else {
        uint64_t v14 = 100;
      }
      [v12 wait];
      [v12 addBytes:v14];
    }
    else
    {
      id v18 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000445DC(v7, v18);
      }
    }
    if ((v8[2](v8, v9) & 1) == 0)
    {
      id v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100044598(v19);
      }
    }
    unsigned int v17 = 1;
  }
  else
  {
    if ([v7 isSending])
    {
      int v15 = [(NTKDCompanionSyncWrapper *)self delegate];
      int v16 = [v15 companionSyncWrapperDidRequestActivePairedSyncSession];
      [v16 syncDidCompleteSending];
    }
    unsigned int v17 = 2;
  }
  [(NTKDCompanionSyncWrapper *)self _reportProgressForMessage:v9 inSession:v7];
  id v20 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    long long v21 = [v7 identifier];
    int v23 = 134218498;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sessionStateResult: %ld, messageToSend: %@, session id: %@", (uint8_t *)&v23, 0x20u);
  }
  return v17;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = _NTKLoggingObjectForDomain();
  id v34 = v8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    id v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Companion Sync session applying changes with session id: %@", buf, 0xCu);

    id v8 = v34;
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v9;
  id v13 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    v33 = v10;
    uint64_t v15 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        unsigned int v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v17;
        }
        else
        {
          id v20 = [v8 serializer];
          long long v21 = [v20 dataFromChange:v17];

          uint64_t v22 = objc_opt_class();
          id v36 = 0;
          id v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v22 fromData:v21 error:&v36];
          id v23 = v36;
          if (v23)
          {
            __int16 v31 = v23;
            id v32 = _NTKLoggingObjectForDomain();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100044670();
            }

LABEL_30:
            uint64_t v30 = 0;
            goto LABEL_31;
          }
        }
        if ([v19 isPartial])
        {
          id v24 = [(NTKDCompanionSyncWrapper *)self _storePartAndReassembleWideLoadIfPossible:v19];
        }
        else
        {
          id v24 = v19;
        }
        long long v21 = v24;
        if (v24)
        {
          __int16 v25 = [(NTKDCompanionSyncWrapper *)self delegate];
          unsigned int v26 = [v25 incomingSyncSessionApplyMessage:v21];

          __int16 v27 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = LogBool();
            *(_DWORD *)buf = 138412546;
            id v42 = v21;
            __int16 v43 = 2112;
            v44 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "apply sync mesage: %@, success=%@", buf, 0x16u);

            id v8 = v34;
          }

          NTKSubmitSyncMessage();
          if (!v26) {
            goto LABEL_30;
          }
          [(NTKDCompanionSyncWrapper *)self _reportProgressForMessage:v19 inSession:v8];
        }
        else
        {
          __int16 v29 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v19;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "received partial sync message %@", buf, 0xCu);
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    uint64_t v30 = 1;
LABEL_31:
    id v10 = v33;
  }
  else
  {
    uint64_t v30 = 1;
  }

  v10[2](v10, v30, 0);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v6 = a3;
  id v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 identifier];
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset request received for sync session with id %@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [(NTKDCompanionSyncWrapper *)self delegate];
  unsigned __int8 v10 = [v9 incomingSyncSessionResetDataStoreWithError:a4];

  return v10;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSending])
  {
    if ([(NTKDCompanionSyncWrapper *)self _discardOutgoingPartialMessagesIfNeededWithErrorMessage:@"Session did end"])
    {
      uint64_t v8 = +[NSError errorWithDomain:kNTKSyncErrorDomain code:1 userInfo:0];
      id v9 = (void *)v8;
      if (v7) {
        unsigned __int8 v10 = v7;
      }
      else {
        unsigned __int8 v10 = (void *)v8;
      }
      id v11 = v10;

      id v7 = v11;
    }
    else
    {
      id v9 = 0;
    }
    id v14 = v7;
    rateLimiters = self->_rateLimiters;
    id v7 = [v6 identifier];
    [(NSMutableDictionary *)rateLimiters setObject:0 forKeyedSubscript:v7];
  }
  else
  {
    if (![(NTKDCompanionSyncWrapper *)self _discardIncomingPartialMessagesIfNeededWithErrorMessage:@"Session did end"])
    {
      id v9 = 0;
      goto LABEL_16;
    }
    uint64_t v12 = +[NSError errorWithDomain:kNTKSyncErrorDomain code:2 userInfo:0];
    id v9 = (void *)v12;
    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = (void *)v12;
    }
    id v14 = v13;
  }

  id v7 = v14;
LABEL_16:
  int v16 = [(NTKDCompanionSyncWrapper *)self delegate];
  unsigned int v17 = [v16 companionSyncWrapperDidRequestActivePairedSyncSession];

  if (v17
    && (![v17 syncSessionType] && (objc_msgSend(v6, "isResetSync") & 1) != 0
     || [v17 syncSessionType] == (id)1 && (objc_msgSend(v6, "isResetSync") & 1) == 0))
  {
    id v18 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v17 sessionIdentifier];
      *(_DWORD *)buf = 138412290;
      v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "paired sync session ended with id: %@", buf, 0xCu);
    }
    if (!v7)
    {
      [v17 syncDidComplete];
LABEL_31:
      id v20 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v6 identifier];
        *(_DWORD *)buf = 138412290;
        v35 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sync session ended with id: %@", buf, 0xCu);
      }
      uint64_t v21 = 1;
      goto LABEL_34;
    }
    [v17 syncDidFailWithError:v7];
  }
  else if (!v7)
  {
    goto LABEL_31;
  }
  id v20 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1000446D8((uint64_t)v7, v6);
  }
  uint64_t v21 = 0;
LABEL_34:

  unsigned int v23 = [v6 isSending];
  id v24 = [(NTKDCompanionSyncWrapper *)self delegate];
  __int16 v25 = v24;
  if (v23) {
    [v24 outgoingSyncSessionDidEnd:v21 withError:v7];
  }
  else {
    [v24 incomingSyncSessionDidEnd:v21 withError:v7];
  }

  syncSerialQueue = self->_syncSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033980;
  block[3] = &unk_100060C58;
  id v27 = v7;
  id v31 = v27;
  id v32 = self;
  id v28 = v6;
  id v33 = v28;
  dispatch_sync(syncSerialQueue, block);
  if ([v28 isSending])
  {
    __int16 v29 = objc_opt_new();
    objc_msgSend(v29, "setIsResetSync:", objc_msgSend(v28, "isResetSync"));
    objc_msgSend(v29, "setChangesSent:", objc_msgSend(v28, "sentChangeCount"));
    objc_msgSend(v29, "setBytesSent:", objc_msgSend(v28, "sentChangeByteCount"));
    [v29 setDidSucceed:v21];
    NTKSubmitSyncSession();
  }
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didSwitchFromPairingID:%@ toPairingID:%@", buf, 0x16u);
  }

  if (v8)
  {
    [(NTKDCompanionSyncWrapper *)self _discardIncomingPartialMessagesIfNeededWithErrorMessage:@"Switching to a new pairing ID"];
    [(NTKDCompanionSyncWrapper *)self _discardOutgoingPartialMessagesIfNeededWithErrorMessage:@"Switching to a new pairing ID"];
    syncSerialQueue = self->_syncSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033B9C;
    block[3] = &unk_100060A90;
    void block[4] = self;
    dispatch_sync(syncSerialQueue, block);
    [(NTKDCompanionSyncWrapper *)self resume];
  }
}

- (id)dataFromChange:(id)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v4 = a3;
  id v9 = 0;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];

  id v6 = v9;
  if (!v5)
  {
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100044774();
    }
  }
  return v5;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NTKDSyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKDSyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rateLimiters, 0);
  objc_storeStrong((id *)&self->_incomingWideLoadQueues, 0);
  objc_storeStrong((id *)&self->_outgoingWideLoadQueue, 0);
  objc_storeStrong((id *)&self->_syncSerialQueue, 0);
  objc_storeStrong((id *)&self->_syncServiceQueue, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
}

@end