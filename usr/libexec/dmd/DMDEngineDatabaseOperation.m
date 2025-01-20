@interface DMDEngineDatabaseOperation
- (BOOL)isAsynchronous;
- (DMDConfigurationDatabase)database;
- (DMDEngineDatabaseOperation)init;
- (OS_os_transaction)transaction;
- (void)dealloc;
- (void)main;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDEngineDatabaseOperation

- (void)dealloc
{
  v3 = self->_transaction;
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_2;
  block[3] = &unk_1000CA508;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)DMDEngineDatabaseOperation;
  [(DMDEngineDatabaseOperation *)&v6 dealloc];
}

- (DMDEngineDatabaseOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)DMDEngineDatabaseOperation;
  v2 = [(DMDEngineDatabaseOperation *)&v8 init];
  v3 = v2;
  if (v2)
  {
    id v4 = [(DMDEngineDatabaseOperation *)v2 description];
    [v4 UTF8String];
    uint64_t v5 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;
  }
  return v3;
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)main
{
  id v4 = [(DMDEngineDatabaseOperation *)self database];

  if (!v4)
  {
    objc_super v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DMDEngineDatabaseOperation.m", 42, @"A database must be provided to %@", self object file lineNumber description];
  }
  uint64_t v5 = [(DMDEngineDatabaseOperation *)self database];
  id v6 = [v5 newBackgroundContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004022C;
  v9[3] = &unk_1000C9BE0;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  [v7 performBlockAndWait:v9];
}

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDEngineDatabaseOperation.m", 50, @"%@ must override %@", v6, v7 object file lineNumber description];
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end