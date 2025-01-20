@interface SDAutoUnlockPairingSession
- (BOOL)useAttestedProtocol;
- (NSString)deviceID;
- (NSUUID)sessionID;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_source)responseTimer;
- (SDAutoUnlockAKSSession)aksSession;
- (SDAutoUnlockPairingSession)init;
- (SDAutoUnlockPairingSession)initWithDevice:(id)a3 sessionID:(id)a4;
- (SDAutoUnlockSessionDelegate)delegate;
- (SDUnlockTransport)transport;
- (id)dataFromUUID:(id)a3;
- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4;
- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4 useProxy:(BOOL)a5 senderID:(id)a6;
- (int64_t)pairingAKSSession;
- (void)handleTimerFired;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6;
- (void)invalidate;
- (void)invalidateResponseTimer;
- (void)restartResponseTimer:(unint64_t)a3;
- (void)setAksSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setPairingAKSSession:(int64_t)a3;
- (void)setResponseTimer:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionQueue:(id)a3;
@end

@implementation SDAutoUnlockPairingSession

- (SDAutoUnlockPairingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAutoUnlockPairingSession;
  v2 = [(SDAutoUnlockPairingSession *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharingd.auto-unlock.pairing-session-queue", 0);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (SDAutoUnlockPairingSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SDAutoUnlockPairingSession *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceID, a3);
    objc_storeStrong((id *)&v10->_sessionID, a4);
    if (v10->_sessionID)
    {
      v11 = +[SDAutoUnlockTransport sharedTransport];
      v12 = [(NSUUID *)v10->_sessionID UUIDString];
      [v11 addClient:v10 forIdentifer:v12];
    }
    v13 = +[SDUnlockIDSController sharedController];
    [v13 addDelegate:v10];
  }
  return v10;
}

- (void)invalidate
{
  dispatch_queue_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating %@", (uint8_t *)&v11, 0xCu);
  }
  [(SDAutoUnlockPairingSession *)self invalidateResponseTimer];
  objc_super v6 = [(SDAutoUnlockPairingSession *)self sessionID];

  if (v6)
  {
    id v7 = +[SDAutoUnlockTransport sharedTransport];
    id v8 = [(SDAutoUnlockPairingSession *)self sessionID];
    v9 = [v8 UUIDString];
    [v7 removeClientForIdentifier:v9];
  }
  v10 = +[SDUnlockIDSController sharedController];
  [v10 removeDelegate:self];
}

- (SDUnlockTransport)transport
{
  if ([(SDAutoUnlockPairingSession *)self useAttestedProtocol]) {
    +[SDUnlockIDSController sharedController];
  }
  else {
  v2 = +[SDAutoUnlockTransport sharedTransport];
  }

  return (SDUnlockTransport *)v2;
}

- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4
{
  return [(SDAutoUnlockPairingSession *)self wrapPayload:a3 withType:a4 useProxy:0 senderID:0];
}

- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4 useProxy:(BOOL)a5 senderID:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a3;
  v12 = objc_opt_new();
  [v12 setVersion:1];
  [v12 setPayload:v11];

  [v12 setMessageType:v7];
  if (v6) {
    [v12 setUseProxy:1];
  }
  if (v10)
  {
    id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    v14 = [(SDAutoUnlockPairingSession *)self dataFromUUID:v13];
    [v12 setSenderID:v14];
  }
  v15 = [(SDAutoUnlockPairingSession *)self sessionID];

  if (v15)
  {
    v16 = [(SDAutoUnlockPairingSession *)self sessionID];
    v17 = [(SDAutoUnlockPairingSession *)self dataFromUUID:v16];
    [v12 setSessionID:v17];
  }
  v18 = [v12 data];

  return v18;
}

- (id)dataFromUUID:(id)a3
{
  dispatch_queue_t v3 = a3;
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    [a3 getUUIDBytes:v5];
    dispatch_queue_t v3 = +[NSData dataWithBytes:v5 length:16];
  }

  return v3;
}

- (void)restartResponseTimer:(unint64_t)a3
{
  v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting response timer", buf, 2u);
  }

  BOOL v6 = [(SDAutoUnlockPairingSession *)self responseTimer];

  if (!v6)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v7 = &_dispatch_main_q;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001C470;
    v11[3] = &unk_1008CA3B0;
    objc_copyWeak(&v12, (id *)buf);
    id v8 = sub_1001B1B10(0, &_dispatch_main_q, v11);
    [(SDAutoUnlockPairingSession *)self setResponseTimer:v8];

    v9 = [(SDAutoUnlockPairingSession *)self responseTimer];
    dispatch_resume(v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  id v10 = [(SDAutoUnlockPairingSession *)self responseTimer];
  sub_1001B1BC4(v10, a3);
}

- (void)invalidateResponseTimer
{
  dispatch_queue_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidateResponseTimer", v6, 2u);
  }

  v4 = [(SDAutoUnlockPairingSession *)self responseTimer];

  if (v4)
  {
    v5 = [(SDAutoUnlockPairingSession *)self responseTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockPairingSession *)self setResponseTimer:0];
  }
}

- (void)handleTimerFired
{
  dispatch_queue_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Response timer fired", v7, 2u);
  }

  uint64_t v4 = SFAutoUnlockErrorDomain;
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  CFStringRef v9 = @"Request failure";
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  BOOL v6 = +[NSError errorWithDomain:v4 code:103 userInfo:v5];
  [(SDAutoUnlockPairingSession *)self notifyDelegateWithError:v6];
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001C75C;
  v14[3] = &unk_1008CA3D8;
  unsigned __int16 v18 = a5;
  id v15 = v10;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, v14);
}

- (SDAutoUnlockSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAutoUnlockSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (int64_t)pairingAKSSession
{
  return self->_pairingAKSSession;
}

- (void)setPairingAKSSession:(int64_t)a3
{
  self->_pairingAKSSession = a3;
}

- (BOOL)useAttestedProtocol
{
  return self->_useAttestedProtocol;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (SDAutoUnlockAKSSession)aksSession
{
  return self->_aksSession;
}

- (void)setAksSession:(id)a3
{
}

- (OS_dispatch_source)responseTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponseTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_aksSession, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end