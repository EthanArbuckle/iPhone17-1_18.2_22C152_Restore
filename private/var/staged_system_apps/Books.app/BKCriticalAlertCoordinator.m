@interface BKCriticalAlertCoordinator
- (BKCriticalAlertCoordinator)init;
- (BOOL)criticalAlertCoordinatorIsPresentingCriticalAlert;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (id)criticalAlertCoordinatorHoldPresentingCriticalAlertAssertion;
- (unint64_t)holdCriticalAlertCount;
- (void)invokeAfterCriticalAlertDismisses:(id)a3;
- (void)setHoldCriticalAlertCount:(unint64_t)a3;
@end

@implementation BKCriticalAlertCoordinator

- (id)criticalAlertCoordinatorHoldPresentingCriticalAlertAssertion
{
  v3 = [(BKCriticalAlertCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E7CC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = [BKCriticalAlertAssertion alloc];
  v5 = [(BKCriticalAlertCoordinator *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E594;
  v8[3] = &unk_100A43D60;
  v8[4] = self;
  v6 = [(BKCriticalAlertAssertion *)v4 initWithQueue:v5 assertionIsInvalidBlock:v8];

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)invokeAfterCriticalAlertDismisses:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(BKCriticalAlertCoordinator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007857C;
  block[3] = &unk_100A44058;
  block[4] = self;
  void block[5] = &v12;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v13 + 24))
  {
    id v6 = objc_retainBlock(v4);
    v7 = v6;
    if (v6) {
      (*((void (**)(id))v6 + 2))(v6);
    }
  }
  else
  {
    v8 = [(BKCriticalAlertCoordinator *)self group];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001E3D70;
    v9[3] = &unk_100A442B8;
    id v10 = v4;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v9);

    v7 = v10;
  }

  _Block_object_dispose(&v12, 8);
}

- (BKCriticalAlertCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKCriticalAlertCoordinator;
  v2 = [(BKCriticalAlertCoordinator *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iBooks.BKCriticalAlertCoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v5;
  }
  return v2;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (BOOL)criticalAlertCoordinatorIsPresentingCriticalAlert
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(BKCriticalAlertCoordinator *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E3E94;
  v5[3] = &unk_100A44058;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unint64_t)holdCriticalAlertCount
{
  return self->_holdCriticalAlertCount;
}

- (void)setHoldCriticalAlertCount:(unint64_t)a3
{
  self->_holdCriticalAlertCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end