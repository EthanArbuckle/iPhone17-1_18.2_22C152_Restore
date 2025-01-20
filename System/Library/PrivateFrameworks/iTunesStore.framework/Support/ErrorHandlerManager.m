@interface ErrorHandlerManager
+ (id)errorHandlerManager;
+ (void)connectHandlerWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)resolveSessionWithMessage:(id)a3 connection:(id)a4;
- (ErrorHandlerManager)init;
- (id)_clientForConnection:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_connectHandlerWithMessage:(id)a3 connection:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5;
- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
- (void)_resolveSessionWithMessage:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)openSession:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation ErrorHandlerManager

- (ErrorHandlerManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ErrorHandlerManager;
  v2 = [(ErrorHandlerManager *)&v6 init];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"com.apple.itunesstored.ErrorHandlerManager.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);

    id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"com.apple.itunesstored.ErrorHandlerManager.completion.%p", v2);
    v2->_completionQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v4 UTF8String], 0);

    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_clientDisconnectNotification:" name:@"XPCClientDisconnectNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"XPCClientDisconnectNotification" object:0];
  completionQueue = self->_completionQueue;
  if (completionQueue) {
    dispatch_release(completionQueue);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)ErrorHandlerManager;
  [(ErrorHandlerManager *)&v5 dealloc];
}

+ (id)errorHandlerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001881E0;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401FB8 != -1) {
    dispatch_once(&qword_100401FB8, block);
  }
  return (id)qword_100401FB0;
}

- (void)openSession:(id)a3 withCompletionBlock:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100188280;
  block[3] = &unk_1003A7080;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

+ (void)observeXPCServer:(id)a3
{
  [a3 addObserver:a1 selector:"connectHandlerWithMessage:connection:" forMessage:96];

  [a3 addObserver:a1 selector:"resolveSessionWithMessage:connection:" forMessage:97];
}

+ (void)connectHandlerWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [a1 errorHandlerManager];

  [v6 _connectHandlerWithMessage:a3 connection:a4];
}

+ (void)resolveSessionWithMessage:(id)a3 connection:(id)a4
{
  id v6 = [a1 errorHandlerManager];

  [v6 _resolveSessionWithMessage:a3 connection:a4];
}

- (void)_clientDisconnectNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100188798;
  v4[3] = &unk_1003A3380;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (id)_clientForConnection:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  clients = self->_clients;
  id v5 = [(NSMutableArray *)clients countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v15;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v15 != v7) {
      objc_enumerationMutation(clients);
    }
    v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
    id v10 = [v9 copyInputConnection];
    id v11 = v10;
    if (v10) {
      xpc_release(v10);
    }
    if (v11 == a3 && v9 != 0) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)clients countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_connectHandlerWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100188D70;
  v4[3] = &unk_1003A7B38;
  v4[4] = a4;
  v4[5] = self;
  void v4[6] = a3;
  [(ErrorHandlerManager *)self _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.ErrorHandlerManager");
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001896DC;
  block[3] = &unk_1003A3438;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.ErrorHandlerManager");
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001897FC;
  block[3] = &unk_1003A68C8;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_resolveSessionWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001898F4;
  v4[3] = &unk_1003A3410;
  v4[4] = self;
  v4[5] = a4;
  void v4[6] = a3;
  [(ErrorHandlerManager *)self _handleMessage:a3 connection:a4 withBlock:v4];
}

@end