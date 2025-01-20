@interface EventDispatcher
+ (id)eventDispatcher;
+ (void)connectEventMonitorWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
- (EventDispatcher)init;
- (void)_addClient:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)dealloc;
- (void)postEventWithName:(id)a3 userInfo:(id)a4;
@end

@implementation EventDispatcher

- (EventDispatcher)init
{
  v4.receiver = self;
  v4.super_class = (Class)EventDispatcher;
  v2 = [(EventDispatcher *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.EventDispatcher", 0);
    v2->_eventMonitors = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)EventDispatcher;
  [(EventDispatcher *)&v4 dealloc];
}

+ (id)eventDispatcher
{
  if (qword_100401E68 != -1) {
    dispatch_once(&qword_100401E68, &stru_1003A6F58);
  }
  return (id)qword_100401E60;
}

- (void)postEventWithName:(id)a3 userInfo:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D23C;
  block[3] = &unk_1003A3410;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

+ (void)connectEventMonitorWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011D528;
  v4[3] = &unk_1003A6F80;
  v4[4] = a4;
  v4[5] = a1;
  v4[6] = a3;
  objc_msgSend(+[EventDispatcher eventDispatcher](EventDispatcher, "eventDispatcher"), "_handleMessage:connection:usingBlock:", a3, a4, v4);
}

+ (void)observeXPCServer:(id)a3
{
}

- (void)_clientDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011D900;
  v6[3] = &unk_1003A3380;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(dispatchQueue, v6);
}

- (void)_addClient:(id)a3
{
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.EventDispatcher");
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011DB64;
  block[3] = &unk_1003A3438;
  block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

@end