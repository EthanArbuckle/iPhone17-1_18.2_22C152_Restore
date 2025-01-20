@interface BKCriticalAlertAssertion
- (BKCriticalAlertAssertion)initWithQueue:(id)a3 assertionIsInvalidBlock:(id)a4;
- (OS_dispatch_queue)queue;
- (id)assertionIsInvalidBlock;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKCriticalAlertAssertion

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BC40;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BKCriticalAlertAssertion)initWithQueue:(id)a3 assertionIsInvalidBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKCriticalAlertAssertion;
  v9 = [(BKCriticalAlertAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    id v11 = [v8 copy];
    id assertionIsInvalidBlock = v10->_assertionIsInvalidBlock;
    v10->_id assertionIsInvalidBlock = v11;
  }
  return v10;
}

- (void)dealloc
{
  [(BKCriticalAlertAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKCriticalAlertAssertion;
  [(BKCriticalAlertAssertion *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assertionIsInvalidBlock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)assertionIsInvalidBlock
{
  return self->_assertionIsInvalidBlock;
}

@end