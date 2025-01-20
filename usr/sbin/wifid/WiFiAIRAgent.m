@interface WiFiAIRAgent
+ (id)sharedInstance;
- (BOOL)isInterfaceRankingInProgress;
- (id)_initPrivate;
- (unint64_t)convertFromNWReliabilityMonitorResult:(unint64_t)a3;
- (void)_evaluationComplete:(unint64_t)a3;
- (void)_userInteractivityChangedCallback:(unint64_t)a3;
- (void)ingestLQMUpdate:(id)a3;
- (void)processRoamEvent:(__WiFiNetwork *)a3;
- (void)setWiFiManagerQueue:(id)a3;
- (void)terminateRequest;
- (void)waitForConfirmationWithTimeout:(__WiFiNetwork *)a3 withBssEnvironment:(int)a4 withMgrCallback:(id)a5;
@end

@implementation WiFiAIRAgent

+ (id)sharedInstance
{
  if (_os_feature_enabled_impl())
  {
    v2 = +[WiFiUserInteractionMonitor sharedInstance];

    if (v2)
    {
      if (qword_10027D578 != -1) {
        dispatch_once(&qword_10027D578, &stru_10023EA48);
      }
    }
  }
  v3 = (void *)qword_10027D580;

  return v3;
}

- (id)_initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiAIRAgent;
  id result = [(WiFiAIRAgent *)&v3 init];
  if (result) {
    *((_WORD *)result + 12) = 0;
  }
  return result;
}

- (void)setWiFiManagerQueue:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)&self->_sharedMgrQueue, a3);
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s without managerQueue", @"-[WiFiAIRAgent setWiFiManagerQueue:]"];
    }
  }
}

- (void)_userInteractivityChangedCallback:(unint64_t)a3
{
  sharedMgrQueue = self->_sharedMgrQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002679C;
  v4[3] = &unk_10023EA70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(sharedMgrQueue, v4);
}

- (unint64_t)convertFromNWReliabilityMonitorResult:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_1001CB210[a3 - 1];
  }
}

- (void)waitForConfirmationWithTimeout:(__WiFiNetwork *)a3 withBssEnvironment:(int)a4 withMgrCallback:(id)a5
{
  id v8 = a5;
  id v9 = [v8 copy];
  id mgrCallback = self->_mgrCallback;
  self->_id mgrCallback = v9;

  self->_isEvalInProgress = 1;
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: AIR agent received a request", @"-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]"];
  }
  if (!self->_sharedMgrQueue)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: managerQueue is not SET", "-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]")
    }
    goto LABEL_11;
  }
  if ((a4 & 0xFFFFFFFD) != 4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: not a multi-AP environment", @"-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]"];
    }
    v19 = self;
    uint64_t v20 = 3;
    goto LABEL_18;
  }
  v12 = +[WiFiUserInteractionMonitor sharedInstance];
  unsigned __int8 v13 = [v12 isRealTimeAppActive];

  if ((v13 & 1) == 0)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: no realtime app active", "-[WiFiAIRAgent waitForConfirmationWithTimeout:withBssEnvironment:withMgrCallback:]");
    }
    v19 = self;
    uint64_t v20 = 4;
    goto LABEL_18;
  }
  v14 = +[WiFiUserInteractionMonitor sharedInstance];
  [v14 registerStateChangeCallback:&stru_10023EAB0 withCallbackContext:self];

  self->_cbRegisteredWithUserActivity = 1;
  v15 = [[WiFiNWReliabilityMonitor alloc] initWithManagerQueue:self->_sharedMgrQueue];
  monitor = self->_monitor;
  self->_monitor = v15;

  v17 = self->_monitor;
  if (!v17)
  {
LABEL_11:
    v19 = self;
    uint64_t v20 = 2;
LABEL_18:
    [(WiFiAIRAgent *)v19 _evaluationComplete:v20];
    goto LABEL_19;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100026BB4;
  v23[3] = &unk_10023EAD8;
  v23[4] = self;
  [(WiFiNWReliabilityMonitor *)v17 waitForNetworkToBeReliableWithTimeout:a3 withTimeout:60 withMgrCallback:v23];
LABEL_19:
}

- (void)terminateRequest
{
  [(WiFiNWReliabilityMonitor *)self->_monitor terminateNetworkReliabilityEvaluation];

  [(WiFiAIRAgent *)self _evaluationComplete:6];
}

- (void)_evaluationComplete:(unint64_t)a3
{
  if (self->_isEvalInProgress)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: AIR agent request complete with result:%lu", "-[WiFiAIRAgent _evaluationComplete:]", a3];
    }
    self->_isEvalInProgress = 0;
    if (self->_cbRegisteredWithUserActivity)
    {
      id v6 = +[WiFiUserInteractionMonitor sharedInstance];
      [v6 unregisterStateChangeCallback:self];

      self->_cbRegisteredWithUserActivity = 0;
    }
    monitor = self->_monitor;
    if (monitor)
    {
      self->_monitor = 0;
    }
    id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    if (mgrCallback)
    {
      if (a3 != 6)
      {
        mgrCallback[2](mgrCallback, a3);
        id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
      }
      self->_id mgrCallback = 0;
    }
  }
}

- (BOOL)isInterfaceRankingInProgress
{
  return self->_isEvalInProgress;
}

- (void)processRoamEvent:(__WiFiNetwork *)a3
{
  if ([(WiFiAIRAgent *)self isInterfaceRankingInProgress])
  {
    monitor = self->_monitor;
    if (monitor)
    {
      [(WiFiNWReliabilityMonitor *)monitor processRoamEvent:a3];
    }
  }
}

- (void)ingestLQMUpdate:(id)a3
{
  id v5 = a3;
  if ([(WiFiAIRAgent *)self isInterfaceRankingInProgress])
  {
    monitor = self->_monitor;
    if (monitor) {
      [(WiFiNWReliabilityMonitor *)monitor ingestLQMUpdate:v5];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mgrCallback, 0);
  objc_storeStrong((id *)&self->_sharedMgrQueue, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end