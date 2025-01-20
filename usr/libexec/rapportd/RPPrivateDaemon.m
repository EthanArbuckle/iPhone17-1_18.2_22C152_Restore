@interface RPPrivateDaemon
+ (id)sharedPrivateDaemon;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (OS_dispatch_queue)dispatchQueue;
- (RPPrivateDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_processAnnouncementPtr:(const char *)a3 end:(const char *)a4;
- (void)_processAnswerPtr:(const char *)a3 end:(const char *)a4;
- (void)_processPacketPtr:(const char *)a3 end:(const char *)a4;
- (void)_processProbePtr:(const char *)a3 end:(const char *)a4;
- (void)_processQueryPtr:(const char *)a3 end:(const char *)a4;
- (void)_processResponsePtr:(const char *)a3 end:(const char *)a4;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)addAdvertiser:(id)a3 completion:(id)a4;
- (void)addDiscovery:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)removeAdvertiser:(id)a3 completion:(id)a4;
- (void)removeDiscovery:(id)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPPrivateDaemon

+ (id)sharedPrivateDaemon
{
  if (qword_100142F90 != -1) {
    dispatch_once(&qword_100142F90, &stru_100124938);
  }
  v2 = (void *)qword_100142F88;

  return v2;
}

- (RPPrivateDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPPrivateDaemon;
  v2 = [(RPPrivateDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    objc_storeStrong(&gRPPrivateDaemon, v3);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v24 = 0;
  id v17 = [(NSMutableSet *)self->_xpcConnections count];
  NSAppendPrintF();
  id v4 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_xpcConnections;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, v17);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "direct", v18))
        {
          NSAppendPrintF();
          id v10 = v4;
        }
        else
        {
          v11 = [v9 xpcCnx];
          id v18 = [v11 processIdentifier];
          NSAppendPrintF();
          id v10 = v4;

          id v4 = v11;
        }

        v12 = [v9 activatedAdvertiser];
        if (v12)
        {
          CUDescriptionWithLevel();
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF();
          id v13 = v10;

          id v10 = v13;
        }

        v14 = [v9 activatedDiscovery];
        if (v14)
        {
          CUDescriptionWithLevel();
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF();
          id v15 = v10;

          id v10 = v15;
        }

        NSAppendPrintF();
        id v4 = v10;
      }
      id v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009FC74;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009FDC4;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    [(RPPrivateDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_update
{
  if (self->_prefPrivateDiscoveryEnabled) {
    [(RPPrivateDaemon *)self _ensureStarted];
  }
  else {
    [(RPPrivateDaemon *)self _ensureStopped];
  }
}

- (void)_processPacketPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 0)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
LABEL_27:
      LogPrintF();
    }
  }
  else
  {
    char v5 = *a3;
    id v4 = a3 + 1;
    switch(v5 & 0x1F)
    {
      case 1:
        -[RPPrivateDaemon _processProbePtr:end:](self, "_processProbePtr:end:", v4);
        break;
      case 2:
        -[RPPrivateDaemon _processResponsePtr:end:](self, "_processResponsePtr:end:", v4);
        break;
      case 3:
        -[RPPrivateDaemon _processAnnouncementPtr:end:](self, "_processAnnouncementPtr:end:", v4);
        break;
      case 4:
        -[RPPrivateDaemon _processQueryPtr:end:](self, "_processQueryPtr:end:", v4);
        break;
      case 5:
        -[RPPrivateDaemon _processAnswerPtr:end:](self, "_processAnswerPtr:end:", v4);
        break;
      default:
        if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize())) {
          goto LABEL_27;
        }
        break;
    }
  }
}

- (void)_processProbePtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 31 || a4 - a3 - 32 <= 3)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize())) {
      goto LABEL_14;
    }
  }
  else
  {
    if (a4 - (a3 + 36) > 63)
    {
      if (dword_100142570 > 30 || dword_100142570 == -1 && !_LogCategory_Initialize()) {
        return;
      }
LABEL_16:
      LogPrintF();
      return;
    }
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
LABEL_14:
      goto LABEL_16;
    }
  }
}

- (void)_processResponsePtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 31)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize())) {
      goto LABEL_13;
    }
  }
  else
  {
    if (a4 - (a3 + 32) > 95)
    {
      if (dword_100142570 > 30 || dword_100142570 == -1 && !_LogCategory_Initialize()) {
        return;
      }
LABEL_15:
      LogPrintF();
      return;
    }
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
LABEL_13:
      goto LABEL_15;
    }
  }
}

- (void)_processAnnouncementPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 31 || a4 - a3 - 32 <= 3)
  {
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize())) {
      goto LABEL_14;
    }
  }
  else
  {
    if (a4 - (a3 + 36) > 63)
    {
      if (dword_100142570 > 30 || dword_100142570 == -1 && !_LogCategory_Initialize()) {
        return;
      }
LABEL_16:
      LogPrintF();
      return;
    }
    if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
    {
LABEL_14:
      goto LABEL_16;
    }
  }
}

- (void)_processQueryPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 > 31)
  {
    if (dword_100142570 > 30 || dword_100142570 == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    LogPrintF();
    return;
  }
  if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_11;
  }
}

- (void)_processAnswerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 > 31)
  {
    if (dword_100142570 > 30 || dword_100142570 == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    LogPrintF();
    return;
  }
  if (dword_100142570 <= 30 && (dword_100142570 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_11;
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (void)addAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0878;
  block[3] = &unk_100124960;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)removeAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A09FC;
  block[3] = &unk_100124960;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)addDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0C1C;
  block[3] = &unk_100124960;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)removeDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0DA0;
  block[3] = &unk_100124960;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(RPPrivateXPCConnection);
  [(RPPrivateXPCConnection *)v6 setDaemon:self];
  [(RPPrivateXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  [(RPPrivateXPCConnection *)v6 setXpcCnx:v5];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  [v5 _setQueue:self->_dispatchQueue];
  id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPPrivateDiscoveryXPCDaemonInterface];
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A10C8;
  v13[3] = &unk_1001219D0;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPPrivateDiscoveryXPCClientInterface];
  [v5 setRemoteObjectInterface:v11];

  [v5 resume];
  if (dword_100142570 <= 20 && (dword_100142570 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_100142570 <= 20)
  {
    if (dword_100142570 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      id v5 = [v4 xpcCnx];
      id v7 = [v5 processIdentifier];
      LogPrintF();

      id v4 = v8;
    }
  }
  [v4 xpcConnectionInvalidated:v7];
  [(NSMutableSet *)self->_xpcConnections removeObject:v8];
  [(RPPrivateDaemon *)self _update];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_xpcConnections, 0);
}

@end