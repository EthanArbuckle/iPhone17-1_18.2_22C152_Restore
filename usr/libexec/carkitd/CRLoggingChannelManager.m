@interface CRLoggingChannelManager
- (CRLoggingChannelManager)initWithSessionStatus:(id)a3;
- (CRLoggingFileReceiver)currentLoggingFileReceiver;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation CRLoggingChannelManager

- (CRLoggingChannelManager)initWithSessionStatus:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLoggingChannelManager;
  v5 = [(CRLoggingChannelManager *)&v7 init];
  if (v5) {
    [v4 addSessionObserver:v5];
  }

  return v5;
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BAEC;
  block[3] = &unk_1000BD5C8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)sessionDidDisconnect:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003BC58;
  v3[3] = &unk_1000BD740;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (CRLoggingFileReceiver)currentLoggingFileReceiver
{
  return self->_currentLoggingFileReceiver;
}

- (void).cxx_destruct
{
}

@end