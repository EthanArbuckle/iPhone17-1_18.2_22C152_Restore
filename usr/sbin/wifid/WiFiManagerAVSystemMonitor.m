@interface WiFiManagerAVSystemMonitor
- (OS_dispatch_queue)queue;
- (__WiFiManager)manager;
- (void)AVSystemMonitorCb;
- (void)dealloc;
- (void)dispatchAVSystemMonitorCallback:(id)a3;
- (void)dispatchAVSystemServerDiedCallback:(id)a3;
- (void)setAVSystemMonitorCb:(void *)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoringAVSystem;
- (void)stopMonitoringAVSystem;
@end

@implementation WiFiManagerAVSystemMonitor

- (void)dispatchAVSystemMonitorCallback:(id)a3
{
  id v6 = [a3 userInfo];
  id v7 = [v6 objectForKey:AVSystemController_VoicePromptStyleDidChangeNotificationParameter];
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: Voice Prompt Style Changed = %@", "-[WiFiManagerAVSystemMonitor dispatchAVSystemMonitorCallback:]", v7 message];
  }
  if ([(WiFiManagerAVSystemMonitor *)self AVSystemMonitorCb])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D828C;
    block[3] = &unk_10023EC30;
    block[4] = self;
    block[5] = v7;
    dispatch_async((dispatch_queue_t)[(WiFiManagerAVSystemMonitor *)self queue], block);
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:4 message:"AVSystemMonitorCb is NULL!"];
    }
  }
}

- (void)dispatchAVSystemServerDiedCallback:(id)a3
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: AVSystemServerDied %@", "-[WiFiManagerAVSystemMonitor dispatchAVSystemServerDiedCallback:]", a3 message];
  }
  [(WiFiManagerAVSystemMonitor *)self startMonitoringAVSystem];
}

- (void)startMonitoringAVSystem
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiManagerAVSystemMonitor startMonitoringAVSystem]"];
  }
  v5 = +[NSNotificationCenter defaultCenter];
  id v6 = +[AVSystemController sharedAVSystemController];
  if (!v5)
  {
    v12 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v13 = "nc is NULL!";
LABEL_16:
      [v12 WFLog:4 message:v13];
    }
LABEL_17:
    goto LABEL_11;
  }
  id v7 = v6;
  if (!v6)
  {
    v12 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      v13 = "sharedController is NULL!";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v15[0] = AVSystemController_VoicePromptStyleDidChangeNotification;
  v15[1] = AVSystemController_ServerConnectionDiedNotification;
  v8 = +[NSArray arrayWithObjects:v15 count:2];
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v9 = [v7 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v14];
  if (v9)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: Successfully subscribed to all necessary AVSystemController notifications: %@", "-[WiFiManagerAVSystemMonitor startMonitoringAVSystem]", v8 message];
    }
  }
  else if (qword_10027DD68)
  {
    [(id)qword_10027DD68 WFLog:4, "%s: Failed to subscribe to AVSystemController notifications due to error: %@", "-[WiFiManagerAVSystemMonitor startMonitoringAVSystem]", v14 message];
  }
  [(NSNotificationCenter *)v5 addObserver:self selector:"dispatchAVSystemMonitorCallback:" name:AVSystemController_VoicePromptStyleDidChangeNotification object:v7];
  [(NSNotificationCenter *)v5 addObserver:self selector:"dispatchAVSystemServerDiedCallback:" name:AVSystemController_ServerConnectionDiedNotification object:v7];
LABEL_11:
}

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)WiFiManagerAVSystemMonitor;
  [(WiFiManagerAVSystemMonitor *)&v4 dealloc];
}

- (void)stopMonitoringAVSystem
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)AVSystemMonitorCb
{
  return self->_AVSystemMonitorCb;
}

- (void)setAVSystemMonitorCb:(void *)a3
{
  self->_AVSystemMonitorCb = a3;
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

@end