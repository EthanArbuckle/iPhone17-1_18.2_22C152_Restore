@interface BTShareAudioService
- (BTShareAudioService)init;
- (OS_dispatch_queue)dispatchQueue;
- (SDStatusMonitor)statusMonitor;
- (SFSession)sfSession;
- (id)configRequestHandler;
- (id)connectRequestHandler;
- (void)_handleSessionEnded:(id)a3 error:(id)a4;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4;
- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleShareAudioSearchTimeout;
- (void)_invalidate;
- (void)_sfServiceStart;
- (void)activate;
- (void)invalidate;
- (void)setConfigRequestHandler:(id)a3;
- (void)setConnectRequestHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setSfSession:(id)a3;
- (void)setStatusMonitor:(id)a3;
@end

@implementation BTShareAudioService

- (BTShareAudioService)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTShareAudioService;
  v2 = [(BTShareAudioService *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A9A0;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AA98;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    [(BTShareAudioService *)self _handleSessionEnded:self->_sfSession error:0];
    id configRequestHandler = self->_configRequestHandler;
    self->_id configRequestHandler = 0;

    id connectRequestHandler = self->_connectRequestHandler;
    self->_id connectRequestHandler = 0;

    [(SFService *)self->_sfService invalidate];
    sfService = self->_sfService;
    self->_sfService = 0;

    if (dword_100261198 <= 30 && (dword_100261198 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_sfServiceStart
{
  if (dword_100261198 <= 30 && (dword_100261198 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  v3 = (SFService *)objc_alloc_init((Class)SFService);
  sfService = self->_sfService;
  self->_sfService = v3;
  v5 = v3;

  [(SFService *)v5 setDispatchQueue:self->_dispatchQueue];
  [(SFService *)v5 setFixedPIN:@"public"];
  [(SFService *)v5 setIdentifier:@"com.apple.sharing.ShareAudio"];
  [(SFService *)v5 setLabel:@"ShareAudio"];
  [(SFService *)v5 setSessionFlags:2305];
  [(SFService *)v5 setServiceType:21];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005AE00;
  v8[3] = &unk_1002345C0;
  v8[4] = v5;
  v8[5] = self;
  [(SFService *)v5 setSessionStartedHandler:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005AE1C;
  v7[3] = &unk_1002345E8;
  v7[4] = v5;
  v7[5] = self;
  [(SFService *)v5 setSessionEndedHandler:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005AE3C;
  v6[3] = &unk_100232A38;
  v6[4] = v5;
  v6[5] = self;
  [(SFService *)v5 activateWithCompletion:v6];
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (dword_100261198 <= 60)
    {
      if (dword_100261198 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_7;
        }
        sfSession = self->_sfSession;
      }
      v7 = [(SFSession *)sfSession peer];
      v9 = [v5 peer];
      LogPrintF();
    }
  }
  else
  {
    if (dword_100261198 <= 30 && (dword_100261198 != -1 || _LogCategory_Initialize()))
    {
      v8 = [v5 peer];
      LogPrintF();
    }
    [v5 setStatusMonitor:self->_statusMonitor v8];
    objc_storeStrong((id *)&self->_sfSession, a3);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10005B1C0;
    v12[3] = &unk_100234610;
    v12[4] = self;
    [v5 registerRequestID:@"_shAu" options:&off_100244520 handler:v12];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005B1C8;
    v11[3] = &unk_100234610;
    v11[4] = self;
    [v5 registerRequestID:@"_shCf" options:&off_100244548 handler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005B2F4;
    v10[3] = &unk_100234610;
    v10[4] = self;
    [v5 registerRequestID:@"_shCn" options:&off_100244570 handler:v10];
  }
LABEL_7:
}

- (void)_handleSessionEnded:(id)a3 error:(id)a4
{
  v19 = (SFSession *)a3;
  id v6 = a4;
  if (self->_sfSession == v19)
  {
    if (v19)
    {
      sfSession = v19;
      if (dword_100261198 <= 30)
      {
        sfSession = v19;
        if (dword_100261198 != -1 || (int v15 = _LogCategory_Initialize(), sfSession = self->_sfSession, v15))
        {
          v17 = [(SFSession *)sfSession peer];
          id v18 = v6;
          LogPrintF();

          sfSession = self->_sfSession;
        }
      }
    }
    else
    {
      sfSession = 0;
    }
    self->_sfSession = 0;

    [(SFBluetoothPairingSession *)self->_pairingSession invalidate];
    pairingSession = self->_pairingSession;
    self->_pairingSession = 0;

    searchTimer = self->_searchTimer;
    if (searchTimer)
    {
      v10 = searchTimer;
      dispatch_source_cancel(v10);
      v11 = self->_searchTimer;
      self->_searchTimer = 0;
    }
    [(CUBluetoothClient *)self->_searchBTClient invalidate];
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = 0;

    id v13 = objc_retainBlock(self->_responseHandler);
    if (v13)
    {
      v14 = NSErrorF();
      if (dword_100261198 < 91 && (dword_100261198 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void *, void, void))v13 + 2))(v13, v14, 0, 0);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = 0;
    }
  }
}

- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261198 <= 30 && (dword_100261198 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10005B88C;
  v23 = sub_10005B89C;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005B8A4;
  v16[3] = &unk_1002330A0;
  id v18 = &v19;
  id v8 = v7;
  id v17 = v8;
  v9 = objc_retainBlock(v16);
  if (self->_responseHandler)
  {
    uint64_t v13 = NSErrorF();
    v14 = (void *)v20[5];
    v20[5] = v13;
  }
  else
  {
    CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_guestDeviceAddress, v10);
      id v11 = objc_retainBlock(v8);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = v11;
    }
    else
    {
      uint64_t v15 = NSErrorF();
      id responseHandler = (id)v20[5];
      v20[5] = v15;
    }
  }
  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v19, 8);
}

- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SFBluetoothPairingSession *)self->_pairingSession invalidate];
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0;

  id v9 = objc_retainBlock(self->_responseHandler);
  if (v9)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;

    if (v7)
    {
      if (dword_100261198 <= 90 && (dword_100261198 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, id, void, void))v9 + 2))(v9, v7, 0, 0);
    }
    else
    {
      id v11 = self->_sfSession;
      if (v11)
      {
        id v12 = objc_alloc_init((Class)NSMutableDictionary);
        id v13 = [v6 colorCode];
        if (v13)
        {
          v14 = +[NSNumber numberWithInt:v13];
          [v12 setObject:v14 forKeyedSubscript:@"colorCode"];
        }
        id v15 = [v6 productIdentifier];
        if (v15)
        {
          v16 = +[NSNumber numberWithUnsignedInt:v15];
          [v12 setObject:v16 forKeyedSubscript:@"productID"];
        }
        dispatchQueue = self->_dispatchQueue;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10005BC14;
        v19[3] = &unk_100234638;
        v19[4] = v11;
        v19[5] = self;
        v19[6] = v12;
        v19[7] = v9;
        [(SFSession *)v11 appleIDAddProof:v12 dispatchQueue:dispatchQueue completion:v19];
      }
      else
      {
        id v18 = SFErrorF();
        if (dword_100261198 <= 90 && (dword_100261198 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        (*((void (**)(id, void *, void, void))v9 + 2))(v9, v18, 0, 0);
      }
    }
  }
}

- (void)_handleShareAudioSearchTimeout
{
  if (dword_100261198 <= 90 && (dword_100261198 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    v4 = searchTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_searchTimer;
    self->_searchTimer = 0;
  }
  [(CUBluetoothClient *)self->_searchBTClient invalidate];
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0;

  id v7 = objc_retainBlock(self->_responseHandler);
  if (v7)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;
    id v10 = v7;

    id v9 = NSErrorF();
    (*((void (**)(id, void *, void, void))v10 + 2))(v10, v9, 0, 0);

    id v7 = v10;
  }
}

- (id)configRequestHandler
{
  return self->_configRequestHandler;
}

- (void)setConfigRequestHandler:(id)a3
{
}

- (id)connectRequestHandler
{
  return self->_connectRequestHandler;
}

- (void)setConnectRequestHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectRequestHandler, 0);
  objc_storeStrong(&self->_configRequestHandler, 0);
  objc_storeStrong((id *)&self->_searchTimer, 0);
  objc_storeStrong((id *)&self->_searchBTClient, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_headphonesAddress, 0);

  objc_storeStrong((id *)&self->_guestDeviceAddress, 0);
}

@end