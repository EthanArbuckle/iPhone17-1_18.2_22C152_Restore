@interface ParkedCarItemSource
- (ParkedCarItemSource)init;
- (id)allItems;
- (void)assignItem:(id)a3;
- (void)dealloc;
- (void)parkedCarManager:(id)a3 didAddParkedCar:(id)a4;
- (void)parkedCarManager:(id)a3 didRemoveParkedCar:(id)a4;
- (void)parkedCarManager:(id)a3 didUpdateParkedCar:(id)a4;
@end

@implementation ParkedCarItemSource

- (ParkedCarItemSource)init
{
  v12.receiver = self;
  v12.super_class = (Class)ParkedCarItemSource;
  v2 = [(ParkedCarItemSource *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ParkedCarItemSource.lock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    v6 = +[ParkedCarManager sharedManager];
    v7 = [v6 parkedCar];

    if (v7)
    {
      v8 = [[ParkedCarPersonalizedItem alloc] initWithParkedCar:v7];
      [(ParkedCarItemSource *)v2 assignItem:v8];
    }
    v9 = +[ParkedCarManager sharedManager];
    [v9 addParkedCarObserver:v2];

    v10 = v2;
  }

  return v2;
}

- (id)allItems
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100104400;
  v10 = sub_100104A70;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033C4C;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)assignItem:(id)a3
{
  id v4 = a3;
  lockQueue = self->_lockQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100BCABD8;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lockQueue, v7);
}

- (void)dealloc
{
  id v3 = +[ParkedCarManager sharedManager];
  [v3 removeParkedCarObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarItemSource;
  [(ParkedCarItemSource *)&v4 dealloc];
}

- (void)parkedCarManager:(id)a3 didRemoveParkedCar:(id)a4
{
  -[ParkedCarItemSource assignItem:](self, "assignItem:", 0, a4);

  [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
}

- (void)parkedCarManager:(id)a3 didAddParkedCar:(id)a4
{
  id v5 = a4;
  id v6 = [[ParkedCarPersonalizedItem alloc] initWithParkedCar:v5];

  [(ParkedCarItemSource *)self assignItem:v6];
  [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
}

- (void)parkedCarManager:(id)a3 didUpdateParkedCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100104400;
  v21 = sub_100104A70;
  id v22 = 0;
  lockQueue = self->_lockQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100BCAEA0;
  v16[3] = &unk_1012E73F0;
  v16[4] = self;
  v16[5] = &v17;
  dispatch_sync(lockQueue, v16);
  if (!v18[5]
    || ([v7 coordinate],
        double v10 = v9,
        double v12 = v11,
        [(id)v18[5] coordinate],
        vabdd_f64(v10, v14) >= 0.00000000999999994)
    || vabdd_f64(v12, v13) >= 0.00000000999999994)
  {
    v15 = [[ParkedCarPersonalizedItem alloc] initWithParkedCar:v7];
    [(ParkedCarItemSource *)self assignItem:v15];
    [(PersonalizedItemSource *)self _notifyObserversItemsDidChange];
  }
  _Block_object_dispose(&v17, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end