@interface XPCTransactionController
+ (id)sharedInstance;
- (BOOL)isInTransaction;
- (NSMutableArray)openTransactions;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)beginTransactionWithIdentifier:(id)a3;
- (void)endTransaction:(id)a3;
@end

@implementation XPCTransactionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openTransactions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSMutableArray)openTransactions
{
  return self->_openTransactions;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)endTransaction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006E28;
  v7[3] = &unk_100020FB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (BOOL)isInTransaction
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006F20;
  v5[3] = &unk_100020FD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)beginTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100007070;
  v17 = sub_100007080;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007088;
  block[3] = &unk_100020F88;
  v11 = self;
  v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)XPCTransactionController;
  v2 = [(XPCTransactionController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storebookkeeperd.XPCTransactionController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableArray array];
    openTransactions = v2->_openTransactions;
    v2->_openTransactions = (NSMutableArray *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007440;
  block[3] = &unk_1000208F8;
  void block[4] = a1;
  if (qword_100027870 != -1) {
    dispatch_once(&qword_100027870, block);
  }
  v2 = (void *)qword_100027868;
  return v2;
}

@end