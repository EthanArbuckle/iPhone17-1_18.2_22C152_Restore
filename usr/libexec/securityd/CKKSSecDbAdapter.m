@interface CKKSSecDbAdapter
- (BOOL)dispatchSyncWithConnection:(__OpaqueSecDbConnection *)a3 readWriteTxion:(BOOL)a4 block:(id)a5;
- (BOOL)insideSQLTransaction;
- (CKKSSecDbAdapter)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3;
- (void)dispatchSyncWithSQLTransaction:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CKKSSecDbAdapter

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)insideSQLTransaction
{
  off_10035CA00();
  return *v2;
}

- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  CFTypeRef cf = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B2904;
  v9[3] = &unk_1002F8FA0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_10000CBA4(0, 1, 0, (uint64_t)&cf, (uint64_t)v9);
  if (cf)
  {
    v7 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v13 = cf;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "error getting database connection, major problems ahead: %@", buf, 0xCu);
    }

    CFTypeRef v8 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v8);
    }
  }
}

- (void)dispatchSyncWithSQLTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  CFTypeRef cf = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B2B34;
  v9[3] = &unk_1002F8FA0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_10000CBA4(1, 1, 0, (uint64_t)&cf, (uint64_t)v9);
  if (cf)
  {
    v7 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v13 = cf;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "error getting database connection, major problems ahead: %@", buf, 0xCu);
    }

    CFTypeRef v8 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v8);
    }
  }
}

- (BOOL)dispatchSyncWithConnection:(__OpaqueSecDbConnection *)a3 readWriteTxion:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  CFTypeRef cf = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B2CBC;
  v15[3] = &unk_1002F8F78;
  if (v5) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 3;
  }
  BOOL v17 = v5;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  BOOL v11 = sub_1001381F8((uint64_t)a3, v9, &cf, (uint64_t)v15);
  if (cf)
  {
    v12 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v20 = cf;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "error doing database transaction, major problems ahead: %@", buf, 0xCu);
    }

    CFTypeRef v13 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v13);
    }
  }

  return v11;
}

- (CKKSSecDbAdapter)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSSecDbAdapter;
  id v6 = [(CKKSSecDbAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end