@interface BTPipeManager
- (BOOL)invalidated;
- (BOOL)isPoweredOn;
- (BOOL)isServer;
- (BOOL)pipeRegistered;
- (BTPipeManager)initWithDelegate:(id)a3 isServer:(BOOL)a4;
- (BTPipeManagerDelegate)delegate;
- (CBScalablePipeManager)pipeManager;
- (NSMutableDictionary)pipes;
- (id)pipeForPeerID:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerEndpoint;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsPoweredOn:(BOOL)a3;
- (void)setIsServer:(BOOL)a3;
- (void)setPipeManager:(id)a3;
- (void)setPipeRegistered:(BOOL)a3;
- (void)setPipes:(id)a3;
@end

@implementation BTPipeManager

- (BTPipeManager)initWithDelegate:(id)a3 isServer:(BOOL)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BTPipeManager;
  v7 = [(BTPipeManager *)&v17 init];
  if (v7)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Initializing (%p)", buf, 0xCu);
    }
    v7->_isServer = a4;
    uint64_t v9 = objc_opt_new();
    pipes = v7->_pipes;
    v7->_pipes = (NSMutableDictionary *)v9;

    objc_storeWeak((id *)&v7->_delegate, v6);
    id v11 = objc_alloc((Class)CBScalablePipeManager);
    v12 = +[MagicSwitchEnabler sharedInstance];
    v13 = [v12 workQueue];
    v14 = (CBScalablePipeManager *)[v11 initWithDelegate:v7 queue:v13];
    pipeManager = v7->_pipeManager;
    v7->_pipeManager = v14;
  }
  return v7;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(BTPipeManager *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)BTPipeManager;
  [(BTPipeManager *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    objc_super v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Invalidating (%p)", (uint8_t *)&v6, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (self->_pipeRegistered)
    {
      v4 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        v7 = (BTPipeManager *)@"com.apple.qs.ms";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Telling CoreBluetooth to unregister endpoint (%@)", (uint8_t *)&v6, 0xCu);
      }
      [(CBScalablePipeManager *)self->_pipeManager unregisterEndpoint:@"com.apple.qs.ms"];
    }
    [(CBScalablePipeManager *)self->_pipeManager setDelegate:0];
    pipeManager = self->_pipeManager;
    self->_pipeManager = 0;
  }
}

- (id)pipeForPeerID:(id)a3
{
  return [(NSMutableDictionary *)self->_pipes objectForKeyedSubscript:a3];
}

- (void)registerEndpoint
{
  objc_super v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    CFStringRef v5 = @"com.apple.qs.ms";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Telling CoreBluetooth to register endpoint (%@)", (uint8_t *)&v4, 0xCu);
  }
  self->_pipeRegistered = 1;
  [(CBScalablePipeManager *)self->_pipeManager registerEndpoint:@"com.apple.qs.ms" type:self->_isServer priority:1];
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  if (([(CBScalablePipeManager *)self->_pipeManager isEqual:a3] & 1) == 0)
  {
    int v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", buf, 2u);
    }
  }
  int64_t v5 = (int64_t)[(CBScalablePipeManager *)self->_pipeManager state];
  int v6 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    sub_100003A04(v5);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe manager did update state (%@)", buf, 0xCu);
  }
  if (v5 < 4)
  {
    *(_WORD *)&self->_pipeRegistered = 0;
    if ([(NSMutableDictionary *)self->_pipes count])
    {
      uint64_t v9 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        pipes = self->_pipes;
        *(_DWORD *)buf = 138412290;
        v25 = pipes;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Notifying delegate all pipes disconnected for pipes: (%@)", buf, 0xCu);
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = self->_pipes;
      id v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            objc_super v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pipes, "objectForKeyedSubscript:", v16, (void)v19);
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained pipe:v17 didDisconnectFromPeer:v16];
          }
          id v13 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      [(NSMutableDictionary *)self->_pipes removeAllObjects];
    }
  }
  else
  {
    if (!self->_pipeRegistered) {
      [(BTPipeManager *)self registerEndpoint];
    }
    if (v5 == 5) {
      self->_isPoweredOn = 1;
    }
  }
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (([(CBScalablePipeManager *)self->_pipeManager isEqual:a3] & 1) == 0)
  {
    v10 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v13, 2u);
    }
  }
  if (([v8 isEqualToString:@"com.apple.qs.ms"] & 1) == 0)
  {
    id v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v13, 2u);
    }
  }
  id v12 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did register endpoint: (%@); error: %@",
      (uint8_t *)&v13,
      0x16u);
  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6 = a4;
  if (([(CBScalablePipeManager *)self->_pipeManager isEqual:a3] & 1) == 0)
  {
    v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v10, 2u);
    }
  }
  if (([v6 isEqualToString:@"com.apple.qs.ms"] & 1) == 0)
  {
    id v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v10, 2u);
    }
  }
  id v9 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did unregister endpoint: (%@)", (uint8_t *)&v10, 0xCu);
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6 = a4;
  if (([(CBScalablePipeManager *)self->_pipeManager isEqual:a3] & 1) == 0)
  {
    v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v18, 2u);
    }
  }
  id v8 = [v6 name];
  if (([v8 isEqualToString:@"com.apple.qs.ms"] & 1) == 0)
  {
    id v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v18, 2u);
    }
  }
  int v10 = [v6 peer];
  if (!v10)
  {
    id v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "peer is nil", (uint8_t *)&v18, 2u);
    }
  }
  id v12 = [v10 identifier];
  if (!v12)
  {
    int v13 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "pipe UUID is nil", (uint8_t *)&v18, 2u);
    }
  }
  id v14 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = v14;
    id v16 = [v12 UUIDString];
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    long long v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did connect: (%@); peer: (%@)",
      (uint8_t *)&v18,
      0x16u);
  }
  [(NSMutableDictionary *)self->_pipes setObject:v6 forKeyedSubscript:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pipe:v6 didConnectToPeer:v12];
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (([(CBScalablePipeManager *)self->_pipeManager isEqual:a3] & 1) == 0)
  {
    int v10 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unexpected pipe manager", (uint8_t *)&v21, 2u);
    }
  }
  id v11 = [v8 name];
  if (([v11 isEqualToString:@"com.apple.qs.ms"] & 1) == 0)
  {
    id v12 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint identifier", (uint8_t *)&v21, 2u);
    }
  }
  int v13 = [v8 peer];
  if (!v13)
  {
    id v14 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "peer is nil", (uint8_t *)&v21, 2u);
    }
  }
  __int16 v15 = [v13 identifier];
  if (!v15)
  {
    id v16 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "peerID is nil", (uint8_t *)&v21, 2u);
    }
  }
  objc_super v17 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = v17;
    id v19 = [v15 UUIDString];
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    v24 = v19;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BTPipeManager --- Pipe did disconnect: (%@); peer: (%@); error: (%@)",
      (uint8_t *)&v21,
      0x20u);
  }
  [(NSMutableDictionary *)self->_pipes setObject:0 forKeyedSubscript:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pipe:v8 didDisconnectFromPeer:v15];
}

- (BOOL)isServer
{
  return self->_isServer;
}

- (void)setIsServer:(BOOL)a3
{
  self->_isServer = a3;
}

- (BTPipeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BTPipeManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CBScalablePipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
}

- (BOOL)pipeRegistered
{
  return self->_pipeRegistered;
}

- (void)setPipeRegistered:(BOOL)a3
{
  self->_pipeRegistered = a3;
}

- (BOOL)isPoweredOn
{
  return self->_isPoweredOn;
}

- (void)setIsPoweredOn:(BOOL)a3
{
  self->_isPoweredOn = a3;
}

- (NSMutableDictionary)pipes
{
  return self->_pipes;
}

- (void)setPipes:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipes, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end