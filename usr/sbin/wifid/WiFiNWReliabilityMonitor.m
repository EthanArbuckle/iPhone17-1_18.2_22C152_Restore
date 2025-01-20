@interface WiFiNWReliabilityMonitor
- (WiFiNWReliabilityMonitor)initWithManagerQueue:(id)a3;
- (void)_cleanup;
- (void)_evaluationComplete:(unint64_t)a3;
- (void)dealloc;
- (void)ingestLQMUpdate:(id)a3;
- (void)processRoamEvent:(__WiFiNetwork *)a3;
- (void)terminateNetworkReliabilityEvaluation;
- (void)waitForNetworkToBeReliableWithTimeout:(__WiFiNetwork *)a3 withTimeout:(unint64_t)a4 withMgrCallback:(id)a5;
@end

@implementation WiFiNWReliabilityMonitor

- (WiFiNWReliabilityMonitor)initWithManagerQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiNWReliabilityMonitor;
  v6 = [(WiFiNWReliabilityMonitor *)&v11 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_sharedMgrQueue, a3);
  if (!v7->_sharedMgrQueue
    || (v7->_metrics = 1,
        *(_WORD *)&v7->_isEvalInProgress = 0,
        +[NSMutableArray array],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        sessions = v7->_sessions,
        v7->_sessions = (NSMutableArray *)v8,
        sessions,
        !v7->_sessions))
  {
LABEL_4:

    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(WiFiNWReliabilityMonitor *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)WiFiNWReliabilityMonitor;
  [(WiFiNWReliabilityMonitor *)&v3 dealloc];
}

- (void)waitForNetworkToBeReliableWithTimeout:(__WiFiNetwork *)a3 withTimeout:(unint64_t)a4 withMgrCallback:(id)a5
{
  id v8 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  id v9 = [v8 copy];
  id mgrCallback = self->_mgrCallback;
  self->_id mgrCallback = v9;

  self->_isEvalInProgress = 1;
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: kickstarting network reliability learning", "-[WiFiNWReliabilityMonitor waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:]")];
  }
  v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_sharedMgrQueue);
  timer = self->_timer;
  self->_timer = v12;

  v14 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002584C;
  handler[3] = &unk_10023E9B8;
  handler[4] = self;
  dispatch_source_set_cancel_handler(v14, handler);
  v15 = [[WiFiNWReliabilityMonitorSession alloc] initWithNetworkRecord:a3 withMetrics:self->_metrics withMaxSamples:20 withMinSampleThresh:16];
  if (v15)
  {
    [(NSMutableArray *)self->_sessions insertObject:v15 atIndex:0];
    objc_storeStrong((id *)&self->_activeSession, v15);
    v16 = +[NSDate date];
    learningStartTimestamp = self->_learningStartTimestamp;
    self->_learningStartTimestamp = v16;

    v18 = self->_timer;
    dispatch_time_t v19 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v18, v19, 0x2540BE400uLL, 0xE8D4A51000uLL);
    v20 = self->_timer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002585C;
    v21[3] = &unk_10023E9E0;
    v21[4] = self;
    v21[5] = &v23;
    v21[6] = a4;
    dispatch_source_set_event_handler(v20, v21);
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  else
  {
    v24[3] = 2;
    [(WiFiNWReliabilityMonitor *)self _evaluationComplete:2];
  }

  _Block_object_dispose(&v23, 8);
}

- (void)terminateNetworkReliabilityEvaluation
{
}

- (void)_cleanup
{
  if (self->_isEvalInProgress)
  {
    self->_isEvalInProgress = 0;
    timer = self->_timer;
    if (timer) {
      dispatch_source_cancel(timer);
    }
    [(NSMutableArray *)self->_sessions removeAllObjects];
    activeSession = self->_activeSession;
    if (activeSession)
    {
      self->_activeSession = 0;
    }
  }
}

- (void)_evaluationComplete:(unint64_t)a3
{
  if (self->_isEvalInProgress)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: network reliability evaluation complete with result:%lu", "-[WiFiNWReliabilityMonitor _evaluationComplete:]", a3];
    }
    [(WiFiNWReliabilityMonitor *)self _cleanup];
    id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    if (a3 != 3 && mgrCallback)
    {
      mgrCallback[2](mgrCallback, a3);
      id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    }
    self->_id mgrCallback = 0;
  }
}

- (void)processRoamEvent:(__WiFiNetwork *)a3
{
  if (self->_isEvalInProgress)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: received roam event", "-[WiFiNWReliabilityMonitor processRoamEvent:]")
    }
    activeSession = self->_activeSession;
    self->_activeSession = 0;

    v7 = [[WiFiNWReliabilityMonitorSession alloc] initWithNetworkRecord:a3 withMetrics:self->_metrics withMaxSamples:20 withMinSampleThresh:16];
    if (v7)
    {
      obj = v7;
      [(NSMutableArray *)self->_sessions insertObject:v7 atIndex:0];
      objc_storeStrong((id *)&self->_activeSession, obj);
      self->_isRoamHappended = 1;
    }
    _objc_release_x2();
  }
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isEvalInProgress)
  {
    activeSession = self->_activeSession;
    id v8 = v5;
    if (activeSession)
    {
      id v4 = [(WiFiNWReliabilityMonitorSession *)activeSession ingestLQMUpdate:v5];
    }
    else
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: active session is null, unexpected", "-[WiFiNWReliabilityMonitor ingestLQMUpdate:]")
      }
    }
    id v5 = v8;
  }

  _objc_release_x1(v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mgrCallback, 0);
  objc_storeStrong((id *)&self->_learningStartTimestamp, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_sharedMgrQueue, 0);
}

@end