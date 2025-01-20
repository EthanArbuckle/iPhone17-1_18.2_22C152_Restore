@interface BKAppLaunchAssertion
- (BKAppLaunchAssertion)initWithQueue:(id)a3 releaseBlock:(id)a4;
- (OS_dispatch_queue)queue;
- (id)releaseBlock;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKAppLaunchAssertion

- (void)invalidate
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100007120;
  v11 = sub_10000726C;
  id v12 = 0;
  v3 = [(BKAppLaunchAssertion *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015518;
  v6[3] = &unk_100A44058;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (v8[5])
  {
    unsigned int v4 = +[NSThread isMainThread];
    v5 = (void (**)(void))v8[5];
    if (v4) {
      v5[2](v8[5]);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }
  _Block_object_dispose(&v7, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BKAppLaunchAssertion)initWithQueue:(id)a3 releaseBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKAppLaunchAssertion;
  uint64_t v9 = [(BKAppLaunchAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    id v11 = [v8 copy];
    id releaseBlock = v10->_releaseBlock;
    v10->_id releaseBlock = v11;
  }
  return v10;
}

- (void)dealloc
{
  [(BKAppLaunchAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKAppLaunchAssertion;
  [(BKAppLaunchAssertion *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_releaseBlock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)releaseBlock
{
  return self->_releaseBlock;
}

@end