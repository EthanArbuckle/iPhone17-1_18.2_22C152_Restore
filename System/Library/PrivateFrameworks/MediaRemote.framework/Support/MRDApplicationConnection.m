@interface MRDApplicationConnection
- (MRApplicationConnectionContext)context;
- (MRDApplicationConnection)initWithContext:(id)a3;
- (MRDMediaRemoteClient)invalidationXPCClient;
- (MRExternalDevice)invalidationExternalDevice;
- (MRPlayerPath)invalidationPlayerPath;
- (NSMutableArray)pendingMessages;
- (NSString)identifier;
- (id)clientBoundMessageHandler;
- (id)installInvalidationObserversAndCheckForPostActivationInvalidations;
- (id)serverBoundMessageHandler;
- (os_unfair_lock_s)lock;
- (unint64_t)state;
- (unint64_t)type;
- (void)activate;
- (void)dealloc;
- (void)handleClientBoundMessage:(id)a3;
- (void)handleClientInvalidation:(id)a3;
- (void)handlePlayerInvalidation:(id)a3;
- (void)handleRemoteExternalDeviceInvalidation:(id)a3;
- (void)handleServerBoundMessage:(id)a3;
- (void)handleXPCClientInvalidation:(id)a3;
- (void)invalidate:(id)a3;
- (void)setClientBoundMessageHandler:(id)a3;
- (void)setInvalidationExternalDevice:(id)a3;
- (void)setInvalidationPlayerPath:(id)a3;
- (void)setInvalidationXPCClient:(id)a3;
- (void)setLocalHostedInvalidationPlayerPath:(id)a3;
- (void)setLocalInvalidationXPCClient:(id)a3;
- (void)setRemoteInvalidationExternalDevice:(id)a3;
- (void)setServerBoundMessageHandler:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MRDApplicationConnection

- (MRDApplicationConnection)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDApplicationConnection;
  v6 = [(MRDApplicationConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDApplicationConnection]<%p> dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDApplicationConnection;
  [(MRDApplicationConnection *)&v4 dealloc];
}

- (NSString)identifier
{
  return (NSString *)[(MRApplicationConnectionContext *)self->_context identifier];
}

- (void)handleServerBoundMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state == 1)
  {
    v10 = [(MRDApplicationConnection *)self serverBoundMessageHandler];
    os_unfair_lock_unlock(&self->_lock);
    if (v10)
    {
      ((void (**)(void, MRDApplicationConnection *, id))v10)[2](v10, self, v4);
    }
  }
  else
  {
    if (state)
    {
      v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100330648();
      }
    }
    else
    {
      v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDApplicationConnection]<%p> handleServerBoundMessage - state: .initial -> enqueuing", (uint8_t *)&v12, 0xCu);
      }

      pendingMessages = self->_pendingMessages;
      if (!pendingMessages)
      {
        v8 = +[NSMutableArray array];
        objc_super v9 = self->_pendingMessages;
        self->_pendingMessages = v8;

        pendingMessages = self->_pendingMessages;
      }
      [(NSMutableArray *)pendingMessages addObject:v4];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)handleClientBoundMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state == 1)
  {
    v7 = [(MRDApplicationConnection *)self clientBoundMessageHandler];
    os_unfair_lock_unlock(&self->_lock);
    if (v7)
    {
      ((void (**)(void, MRDApplicationConnection *, id))v7)[2](v7, self, v4);
    }
  }
  else
  {
    if (state)
    {
      v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1003306B0();
      }
    }
    else
    {
      v6 = _MRLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_100330718();
      }
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_state)
  {
    self->_unint64_t state = 1;
    id v5 = self->_pendingMessages;
    pendingMessages = self->_pendingMessages;
    self->_pendingMessages = 0;

    v7 = (void (**)(id, MRDApplicationConnection *, void))objc_retainBlock(self->_serverBoundMessageHandler);
    v8 = [(MRDApplicationConnection *)self installInvalidationObserversAndCheckForPostActivationInvalidations];
    os_unfair_lock_unlock(p_lock);
    if (v8)
    {
      [(MRDApplicationConnection *)self invalidate:v8];
    }
    else
    {
      if (!v7) {
        goto LABEL_17;
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v5;
      id v9 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          int v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v5);
            }
            v7[2](v7, self, *(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
            int v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
    goto LABEL_17;
  }
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10033078C();
  }

  os_unfair_lock_unlock(p_lock);
  id v5 = 0;
LABEL_17:
}

- (void)setClientBoundMessageHandler:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state)
  {
    id v4 = objc_retainBlock(v8);
    id clientBoundMessageHandler = self->_clientBoundMessageHandler;
    self->_id clientBoundMessageHandler = v4;
  }
  id v6 = objc_retainBlock(v8);
  id v7 = self->_clientBoundMessageHandler;
  self->_id clientBoundMessageHandler = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServerBoundMessageHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = objc_retainBlock(v5);

  id serverBoundMessageHandler = self->_serverBoundMessageHandler;
  self->_id serverBoundMessageHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_type = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 2)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v5 = (void (**)(id, MRDApplicationConnection *, id))objc_retainBlock(self->_clientBoundMessageHandler);
    id v6 = (void (**)(id, MRDApplicationConnection *, id))objc_retainBlock(self->_serverBoundMessageHandler);
    self->_unint64_t state = 2;
    id clientBoundMessageHandler = self->_clientBoundMessageHandler;
    self->_id clientBoundMessageHandler = 0;

    id serverBoundMessageHandler = self->_serverBoundMessageHandler;
    self->_id serverBoundMessageHandler = 0;

    id v9 = objc_alloc((Class)MRInvalidateApplicationConnectionMessage);
    id v10 = [(MRDApplicationConnection *)self context];
    id v11 = [v9 initWithConnectionContext:v10 error:v4];

    if ([v4 code] == (id)181)
    {
      CFStringRef v12 = @"ClosedByClient";
    }
    else if ([v4 code] == (id)182)
    {
      CFStringRef v12 = @"ClosedByServer";
    }
    else
    {
      CFStringRef v12 = @"error";
    }
    long long v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v21 = self;
      __int16 v22 = 2112;
      CFStringRef v23 = v12;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDApplicationConnection]<%p> invalidate - reason: %@, error: %@", buf, 0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      long long v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MRDApplicationConnection]<%p> invalidate - notify client", buf, 0xCu);
      }

      v5[2](v5, self, v11);
    }
    if (v6)
    {
      long long v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDApplicationConnection]<%p> invalidate - notify server", buf, 0xCu);
      }

      v6[2](v6, self, v11);
    }
    qos_class_t v16 = qos_class_self();
    v17 = dispatch_get_global_queue(v16, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100148950;
    v18[3] = &unk_1004158D8;
    v18[4] = self;
    v19 = (__CFString *)v12;
    dispatch_async(v17, v18);
  }
}

- (void)setRemoteInvalidationExternalDevice:(id)a3
{
  id v4 = (MRExternalDevice *)a3;
  os_unfair_lock_lock(&self->_lock);
  invalidationExternalDevice = self->_invalidationExternalDevice;
  self->_invalidationExternalDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocalHostedInvalidationPlayerPath:(id)a3
{
  id v4 = (MRPlayerPath *)a3;
  os_unfair_lock_lock(&self->_lock);
  invalidationPlayerPath = self->_invalidationPlayerPath;
  self->_invalidationPlayerPath = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocalInvalidationXPCClient:(id)a3
{
  id v4 = (MRDMediaRemoteClient *)a3;
  os_unfair_lock_lock(&self->_lock);
  invalidationXPCClient = self->_invalidationXPCClient;
  self->_invalidationXPCClient = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)installInvalidationObserversAndCheckForPostActivationInvalidations
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = self->_invalidationExternalDevice;
  id v4 = self->_invalidationPlayerPath;
  id v5 = self->_invalidationXPCClient;
  if (v4)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"handleClientInvalidation:" name:kMRMediaRemoteNowPlayingApplicationDidUnregister object:0];

    id v7 = [(MRPlayerPath *)v4 player];

    if (v7)
    {
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"handlePlayerInvalidation:" name:kMRMediaRemoteNowPlayingPlayerDidUnregister object:0];
    }
    id v9 = +[MRDMediaRemoteServer server];
    id v10 = [v9 nowPlayingServer];
    id v11 = [v10 queryExistingPlayerPath:v4];

    if ([v11 error])
    {
      id v12 = [objc_alloc((Class)NSError) initWithMRError:178];

      goto LABEL_15;
    }
  }
  if (v3
    && (+[NSNotificationCenter defaultCenter],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        [v13 addObserver:self selector:"handleRemoteExternalDeviceInvalidation:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:v3], v13, (-[MRExternalDevice isConnected](v3, "isConnected") & 1) == 0))
  {
    id v18 = objc_alloc((Class)NSError);
    uint64_t v19 = 176;
  }
  else
  {
    if (!v5) {
      goto LABEL_11;
    }
    long long v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"handleXPCClientInvalidation:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:v5];

    long long v15 = +[MRDMediaRemoteServer server];
    qos_class_t v16 = [v15 allClients];
    unsigned __int8 v17 = [v16 containsObject:v5];

    if (v17)
    {
LABEL_11:
      id v12 = 0;
      goto LABEL_15;
    }
    id v18 = objc_alloc((Class)NSError);
    uint64_t v19 = 179;
  }
  id v12 = [v18 initWithMRError:v19];
LABEL_15:

  return v12;
}

- (void)handleXPCClientInvalidation:(id)a3
{
  id v4 = [objc_alloc((Class)NSError) initWithMRError:179];
  [(MRDApplicationConnection *)self invalidate:v4];
}

- (void)handleRemoteExternalDeviceInvalidation:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_invalidationExternalDevice;
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = [(MRExternalDevice *)v5 isConnected];

  if ((p_lock & 1) == 0)
  {
    id v6 = [objc_alloc((Class)NSError) initWithMRError:176];
    [(MRDApplicationConnection *)self invalidate:v6];
  }
}

- (void)handleClientInvalidation:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetPlayerPathFromUserInfo();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  id v5 = [(MRPlayerPath *)self->_invalidationPlayerPath client];
  unint64_t type = self->_type;
  os_unfair_lock_unlock(&self->_lock);
  id v7 = [v12 origin];
  if ([v7 isLocallyHosted])
  {
    id v8 = [v12 client];
    unsigned int v9 = [v8 isEqual:v5];

    if (!v9) {
      goto LABEL_8;
    }
    id v10 = objc_alloc((Class)NSError);
    if (type == 1) {
      uint64_t v11 = 178;
    }
    else {
      uint64_t v11 = 179;
    }
    id v7 = [v10 initWithMRError:v11];
    [(MRDApplicationConnection *)self invalidate:v7];
  }

LABEL_8:
}

- (void)handlePlayerInvalidation:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetPlayerPathFromUserInfo();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  id v5 = [(MRPlayerPath *)self->_invalidationPlayerPath client];
  id v6 = [(MRPlayerPath *)self->_invalidationPlayerPath player];
  os_unfair_lock_unlock(&self->_lock);
  id v7 = [v11 origin];
  if ([v7 isLocallyHosted])
  {
    id v8 = [v11 client];
    if ([v8 isEqual:v5])
    {
      unsigned int v9 = [v11 player];
      unsigned int v10 = [v9 isEqual:v6];

      if (!v10) {
        goto LABEL_7;
      }
      id v7 = [objc_alloc((Class)NSError) initWithMRError:178];
      [(MRDApplicationConnection *)self invalidate:v7];
    }
    else
    {
    }
  }

LABEL_7:
}

- (MRApplicationConnectionContext)context
{
  return self->_context;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)serverBoundMessageHandler
{
  return self->_serverBoundMessageHandler;
}

- (id)clientBoundMessageHandler
{
  return self->_clientBoundMessageHandler;
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (unint64_t)state
{
  return self->_state;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (MRDMediaRemoteClient)invalidationXPCClient
{
  return self->_invalidationXPCClient;
}

- (void)setInvalidationXPCClient:(id)a3
{
}

- (MRExternalDevice)invalidationExternalDevice
{
  return self->_invalidationExternalDevice;
}

- (void)setInvalidationExternalDevice:(id)a3
{
}

- (MRPlayerPath)invalidationPlayerPath
{
  return self->_invalidationPlayerPath;
}

- (void)setInvalidationPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationPlayerPath, 0);
  objc_storeStrong((id *)&self->_invalidationExternalDevice, 0);
  objc_storeStrong((id *)&self->_invalidationXPCClient, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong(&self->_clientBoundMessageHandler, 0);
  objc_storeStrong(&self->_serverBoundMessageHandler, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end