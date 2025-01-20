@interface CHRemotePowerLoggingRequestHandler
- (OS_dispatch_queue)loggingQueue;
- (void)handleRequest:(id)a3;
@end

@implementation CHRemotePowerLoggingRequestHandler

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_10000F8E8;
  v11[4] = sub_10000F8F8;
  id v12 = 0;
  v5 = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F900;
  block[3] = &unk_100024C20;
  id v8 = v4;
  v9 = self;
  v10 = v11;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v11, 8);
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void).cxx_destruct
{
}

@end