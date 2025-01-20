@interface SDSharedRemoteTextInputClient
+ (id)sharedClient;
- (NSDictionary)currentPayload;
- (OS_dispatch_queue)dispatchQueue;
- (SDSharedRemoteTextInputClient)init;
- (id)_updatedSessionInfoWithAppIcon:(id)a3;
- (void)_ensureStarted;
- (void)_logEvent:(unint64_t)a3 stopClock:(BOOL)a4;
- (void)_rtiHandleEventWithData:(id)a3;
- (void)_rtiHandleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)_rtiHandleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)_startClockWithResetIfNeeded;
- (void)_stopClock:(unint64_t)a3;
- (void)activate;
- (void)addDelegate:(id)a3;
- (void)handleTextInputData:(id)a3;
- (void)handleUsername:(id)a3 password:(id)a4;
- (void)invalidate;
- (void)removeAllDelegates;
- (void)removeDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SDSharedRemoteTextInputClient

+ (id)sharedClient
{
  if (qword_10097FFF0 != -1) {
    dispatch_once(&qword_10097FFF0, &stru_1008CD5A8);
  }
  v2 = (void *)qword_10097FFF8;

  return v2;
}

- (SDSharedRemoteTextInputClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDSharedRemoteTextInputClient;
  v2 = [(SDSharedRemoteTextInputClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_ensureStarted
{
  if (!self->_rtiClient)
  {
    if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = (SFRemoteTextInputClient *)objc_alloc_init((Class)SFRemoteTextInputClient);
    rtiClient = self->_rtiClient;
    self->_rtiClient = v3;

    [(SFRemoteTextInputClient *)self->_rtiClient setDispatchQueue:self->_dispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000FFB34;
    v7[3] = &unk_1008CB660;
    v7[4] = self;
    [(SFRemoteTextInputClient *)self->_rtiClient setEventHandler:v7];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000FFB40;
    v6[3] = &unk_1008CD5D0;
    v6[4] = self;
    [(SFRemoteTextInputClient *)self->_rtiClient setTextInputDidBegin:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000FFBA0;
    v5[3] = &unk_1008CD5D0;
    v5[4] = self;
    [(SFRemoteTextInputClient *)self->_rtiClient setTextInputDidEnd:v5];
    [(SFRemoteTextInputClient *)self->_rtiClient activate];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FFC24;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSDictionary)currentPayload
{
  return (NSDictionary *)[(SFRemoteTextInputClient *)self->_rtiClient currentPayload];
}

- (void)invalidate
{
  if (dword_100967A98 <= 50 && (dword_100967A98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDSharedRemoteTextInputClient *)self removeAllDelegates];
  [(SDSharedRemoteTextInputClient *)self _stopClock:3];
  if (self->_rtiClient)
  {
    if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SFRemoteTextInputClient *)self->_rtiClient invalidate];
    rtiClient = self->_rtiClient;
    self->_rtiClient = 0;
  }
}

- (void)addDelegate:(id)a3
{
  id v8 = a3;
  if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v8;
    LogPrintF();
  }
  delegates = self->_delegates;
  if (!delegates)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_super v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }
  -[NSMutableSet addObject:](delegates, "addObject:", v8, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100967A98 <= 30)
  {
    if (dword_100967A98 != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      id v6 = v4;
      LogPrintF();
      id v4 = v7;
    }
  }
  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v4, v6);
}

- (void)removeAllDelegates
{
  [(NSMutableSet *)self->_delegates removeAllObjects];
  delegates = self->_delegates;
  self->_delegates = 0;
}

- (void)handleTextInputData:(id)a3
{
}

- (void)handleUsername:(id)a3 password:(id)a4
{
}

- (void)_rtiHandleEventWithData:(id)a3
{
  id v4 = a3;
  if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize()))
  {
    id v7 = SFTextInputDataLogString();
    LogPrintF();
  }
  delegates = self->_delegates;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100100018;
  v8[3] = &unk_1008CD5F8;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableSet *)delegates enumerateObjectsUsingBlock:v8];
}

- (void)_rtiHandleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v6 = a4;
  if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v9 = a3;
    LogPrintF();
  }
  [(SDSharedRemoteTextInputClient *)self _startClockWithResetIfNeeded];
  delegates = self->_delegates;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10010017C;
  v10[3] = &unk_1008CD620;
  id v11 = v6;
  unint64_t v12 = a3;
  id v8 = v6;
  [(NSMutableSet *)delegates enumerateObjectsUsingBlock:v10];
}

- (void)_rtiHandleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v6 = a4;
  if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v9 = a3;
    LogPrintF();
  }
  -[SDSharedRemoteTextInputClient _stopClock:](self, "_stopClock:", 2, v9);
  delegates = self->_delegates;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001002E4;
  v10[3] = &unk_1008CD620;
  id v11 = v6;
  unint64_t v12 = a3;
  id v8 = v6;
  [(NSMutableSet *)delegates enumerateObjectsUsingBlock:v10];
}

- (void)_logEvent:(unint64_t)a3 stopClock:(BOOL)a4
{
  sessionClock = self->_sessionClock;
  if (sessionClock)
  {
    BOOL v6 = a4;
    [(NSDate *)sessionClock timeIntervalSinceNow];
    [(NSDate *)self->_sessionClock timeIntervalSinceNow];
    if (v6)
    {
      if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v7 = self->_sessionClock;
      self->_sessionClock = 0;

      overrunTimer = self->_overrunTimer;
      if (overrunTimer)
      {
        v10 = overrunTimer;
        dispatch_source_cancel(v10);
        unint64_t v9 = self->_overrunTimer;
        self->_overrunTimer = 0;
      }
    }
  }
}

- (void)_startClockWithResetIfNeeded
{
  if (self->_sessionClock) {
    [(SDSharedRemoteTextInputClient *)self _stopClock:4];
  }
  if (dword_100967A98 <= 30 && (dword_100967A98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = +[NSDate date];
  sessionClock = self->_sessionClock;
  self->_sessionClock = v3;

  overrunTimer = self->_overrunTimer;
  if (overrunTimer)
  {
    BOOL v6 = overrunTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_overrunTimer;
    self->_overrunTimer = 0;
  }
  id v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  unint64_t v9 = self->_overrunTimer;
  self->_overrunTimer = v8;

  v10 = self->_overrunTimer;
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
  unint64_t v12 = self->_overrunTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100100604;
  handler[3] = &unk_1008CA4B8;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_overrunTimer);
}

- (void)_stopClock:(unint64_t)a3
{
}

- (id)_updatedSessionInfoWithAppIcon:(id)a3
{
  id v3 = a3;

  return v3;
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
  objc_storeStrong((id *)&self->_sessionClock, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_storeStrong((id *)&self->_overrunTimer, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

@end