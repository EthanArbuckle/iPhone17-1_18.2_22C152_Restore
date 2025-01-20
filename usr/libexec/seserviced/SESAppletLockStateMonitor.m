@interface SESAppletLockStateMonitor
- (void)onEvent:(id)a3 eventPayload:(id)a4;
@end

@implementation SESAppletLockStateMonitor

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C278;
  block[3] = &unk_10040D2C0;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchedAID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end