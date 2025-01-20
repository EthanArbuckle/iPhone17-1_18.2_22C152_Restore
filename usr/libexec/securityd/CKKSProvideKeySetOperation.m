@interface CKKSProvideKeySetOperation
- (CKKSProvideKeySetOperation)initWithIntendedZoneIDs:(id)a3;
- (NSDictionary)keysets;
- (NSOperation)startDependency;
- (NSSet)intendedZoneIDs;
- (OS_dispatch_queue)queue;
- (void)provideKeySets:(id)a3;
- (void)setKeysets:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartDependency:(id)a3;
@end

@implementation CKKSProvideKeySetOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDependency, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_intendedZoneIDs, 0);

  objc_storeStrong((id *)&self->_keysets, 0);
}

- (void)setStartDependency:(id)a3
{
}

- (NSOperation)startDependency
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (NSSet)intendedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setKeysets:(id)a3
{
}

- (NSDictionary)keysets
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)provideKeySets:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSProvideKeySetOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B3058;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (CKKSProvideKeySetOperation)initWithIntendedZoneIDs:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKKSProvideKeySetOperation;
  id v6 = [(CKKSGroupOperation *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intendedZoneIDs, a3);
    keysets = v7->_keysets;
    v7->_keysets = 0;

    uint64_t v9 = +[NSBlockOperation blockOperationWithBlock:&stru_1002F8FE8];
    startDependency = v7->_startDependency;
    v7->_startDependency = (NSOperation *)v9;

    [(NSOperation *)v7->_startDependency setName:@"key-set-provided"];
    dispatch_queue_t v11 = dispatch_queue_create("key-set-queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    [(CKKSGroupOperation *)v7 addDependency:v7->_startDependency];
  }

  return v7;
}

@end