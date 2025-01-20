@interface NROSTransactionLogger
+ (id)sharedInstance;
+ (void)createKeepAliveFile;
+ (void)deleteKeepAliveFile;
- (NROSTransactionLogger)init;
- (NSMutableDictionary)outstandingTransactions;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)masterTransaction;
- (id)addTransaction:(id)a3;
- (void)dumpTransactions:(id)a3 isAdded:(BOOL)a4;
- (void)removeTransaction:(id)a3;
- (void)setMasterTransaction:(id)a3;
- (void)setOutstandingTransactions:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation NROSTransactionLogger

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001130C;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A1068 != -1) {
    dispatch_once(&qword_1001A1068, block);
  }
  v2 = (void *)qword_1001A1060;

  return v2;
}

- (NROSTransactionLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)NROSTransactionLogger;
  v2 = [(NROSTransactionLogger *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    outstandingTransactions = v2->_outstandingTransactions;
    v2->_outstandingTransactions = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nanoregistryd.NROSTransaction", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)dumpTransactions:(id)a3 isAdded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [@"NROSTransaction transactions: " mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v8 = self->_outstandingTransactions;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    if (v4) {
      CFStringRef v12 = @"+";
    }
    else {
      CFStringRef v12 = @"-";
    }
    CFStringRef v20 = v12;
    char v13 = 1;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [(NSMutableDictionary *)self->_outstandingTransactions objectForKeyedSubscript:v15];
        if ((v13 & 1) == 0) {
          [v7 appendString:@", "];
        }
        if (v6 && [v15 isEqual:v6]) {
          [v7 appendString:v20];
        }
        if (v16) {
          [v7 appendString:v16];
        }

        char v13 = 0;
      }
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      char v13 = 0;
    }
    while (v10);
  }

  v17 = nr_daemon_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    v19 = nr_daemon_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (id)addTransaction:(id)a3
{
  id v4 = a3;
  v5 = +[NSValue valueWithNonretainedObject:v4];
  id v6 = [v4 name];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000116E4;
  block[3] = &unk_100165868;
  block[4] = self;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);

  return 0;
}

- (void)removeTransaction:(id)a3
{
  v5 = +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:");
  id v6 = v5;
  if (a3)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011884;
    v8[3] = &unk_100165530;
    v8[4] = self;
    id v9 = v5;
    dispatch_async((dispatch_queue_t)queue, v8);
  }
}

+ (void)createKeepAliveFile
{
  v2 = [@"/var/mobile/Library/DeviceRegistry.state" stringByAppendingPathComponent:@"KeepAlive"];
  uint64_t v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  if ((v4 & 1) == 0)
  {
    v5 = +[NSFileManager defaultManager];
    id v19 = 0;
    unsigned __int8 v6 = [v5 createDirectoryAtPath:@"/var/mobile/Library/DeviceRegistry.state" withIntermediateDirectories:1 attributes:0 error:&v19];
    id v7 = v19;

    if (v6)
    {
      id v8 = +[NSData data];
      id v18 = v7;
      unsigned __int8 v9 = [v8 writeToFile:v2 options:268435457 error:&v18];
      id v10 = v18;

      if (v9) {
        goto LABEL_16;
      }
      uint64_t v11 = [v10 domain];
      if ([v11 isEqualToString:NSCocoaErrorDomain])
      {
        id v12 = [v10 code];

        if (v12 == (id)516) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      v16 = nr_daemon_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v17)
      {
LABEL_16:
        id v7 = v10;
        goto LABEL_17;
      }
      v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000F6618(v10);
      }
      id v7 = v10;
    }
    else
    {
      id v13 = nr_daemon_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (!v14)
      {
LABEL_17:

        goto LABEL_18;
      }
      v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000F66A0(v7, v15);
      }
    }

    goto LABEL_17;
  }
LABEL_18:
}

+ (void)deleteKeepAliveFile
{
  v2 = [@"/var/mobile/Library/DeviceRegistry.state" stringByAppendingPathComponent:@"KeepAlive"];
  uint64_t v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v2 isDirectory:0];

  if (v4)
  {
    v5 = +[NSFileManager defaultManager];
    id v13 = 0;
    unsigned __int8 v6 = [v5 removeItemAtPath:v2 error:&v13];
    id v7 = v13;

    if ((v6 & 1) == 0)
    {
      id v8 = [v7 domain];
      if ([v8 isEqualToString:NSCocoaErrorDomain])
      {
        id v9 = [v7 code];

        if (v9 == (id)4) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      id v10 = nr_daemon_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        id v12 = nr_daemon_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000F674C(v7);
        }
      }
    }
LABEL_11:
  }
}

- (NSMutableDictionary)outstandingTransactions
{
  return self->_outstandingTransactions;
}

- (void)setOutstandingTransactions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_transaction)masterTransaction
{
  return self->_masterTransaction;
}

- (void)setMasterTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_outstandingTransactions, 0);
}

@end