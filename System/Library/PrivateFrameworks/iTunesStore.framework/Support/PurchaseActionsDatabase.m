@interface PurchaseActionsDatabase
+ (BOOL)_setupDatabase:(id)a3;
- (PurchaseActionsDatabase)init;
- (PurchaseActionsDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4;
- (void)deletePurchaseIntentsForApp:(id)a3;
- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4;
- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4;
- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3;
- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4;
- (void)incrementPingbackRetryCountForApp:(id)a3;
- (void)insertInstallAttributionParams:(id)a3 completionHandler:(id)a4;
- (void)insertInstallAttributionPingback:(id)a3;
- (void)insertPurchaseIntent:(id)a3;
- (void)modifyUsingTransactionBlock:(id)a3;
- (void)readAsyncUsingTransactionBlock:(id)a3;
- (void)readUsingTransactionBlock:(id)a3;
- (void)removeInstallAttributionParamsBeforeDate:(id)a3;
- (void)removeInstallAttributionParamsForApp:(id)a3;
- (void)removeInstallAttributionPingbackForApp:(id)a3;
- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3;
- (void)resetTimestampsForApp:(id)a3;
- (void)setPingbackPendingForApp:(id)a3;
@end

@implementation PurchaseActionsDatabase

- (PurchaseActionsDatabase)init
{
  v3 = +[PurchaseActionsDatabaseSchema databasePath];
  v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];

  v5 = [(PurchaseActionsDatabase *)self initWithDatabaseURL:v4 readOnly:0];
  return v5;
}

- (PurchaseActionsDatabase)initWithDatabaseURL:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PurchaseActionsDatabase;
  v7 = [(PurchaseActionsDatabase *)&v11 init];
  if (v7)
  {
    v8 = (SSSQLiteDatabase *)[objc_alloc((Class)SSSQLiteDatabase) initWithDatabaseURL:v6 readOnly:v4 protectionType:NSFileProtectionCompleteUntilFirstUserAuthentication];
    database = v7->_database;
    v7->_database = v8;

    if (!v4) {
      [(SSSQLiteDatabase *)v7->_database setSetupBlock:&stru_1003A5948];
    }
  }

  return v7;
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B55DC;
  v7[3] = &unk_1003A3240;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v7];
}

- (void)readAsyncUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B56E8;
  v7[3] = &unk_1003A31F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database dispatchBlockAsync:v7];
}

- (void)readUsingTransactionBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B578C;
  v7[3] = &unk_1003A3240;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v7];
}

- (void)deletePurchaseIntentsForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B58A0;
    v6[3] = &unk_1003A5998;
    id v7 = v5;
    [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v6];
  }
}

- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B5AFC;
    v8[3] = &unk_1003A5A10;
    id v9 = v6;
    id v10 = v7;
    [(PurchaseActionsDatabase *)self readAsyncUsingTransactionBlock:v8];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)insertPurchaseIntent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B5F64;
    v6[3] = &unk_1003A5998;
    id v7 = v4;
    [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v6];
  }
}

- (void)resetTimestampsForApp:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NSDate date];
    [v5 timeIntervalSince1970];
    id v7 = +[NSNumber numberWithLongLong:(uint64_t)v6];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B63B8;
    v9[3] = &unk_1003A5A88;
    id v10 = v4;
    id v11 = v7;
    id v8 = v7;
    [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v9];
  }
}

- (void)insertInstallAttributionParams:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v6)
  {
    *(void *)&long long v19 = 0;
    *((void *)&v19 + 1) = &v19;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B6C9C;
    v16[3] = &unk_1003A5AB0;
    id v17 = v6;
    v18 = &v19;
    [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v16];
    if (v7) {
      v7[2](v7, *(unsigned __int8 *)(*((void *)&v19 + 1) + 24));
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      LODWORD(v19) = 138543362;
      *(void *)((char *)&v19 + 4) = objc_opt_class();
      id v12 = *(id *)((char *)&v19 + 4);
      LODWORD(v15) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v19, v15);
        free(v13);
        SSFileLog();
      }
    }
    else
    {
    }
  }
}

- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    id v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v12 = v19;
      LODWORD(v14) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_14:

        v7[2](v7, 0);
        goto LABEL_15;
      }
      id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v18, v14);
      free(v13);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B711C;
  v15[3] = &unk_1003A5A10;
  id v16 = v6;
  id v17 = v7;
  [(PurchaseActionsDatabase *)self readAsyncUsingTransactionBlock:v15];

LABEL_15:
}

- (void)removeInstallAttributionParamsForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B7758;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

- (void)removeInstallAttributionParamsBeforeDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B7AB4;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

- (void)insertInstallAttributionPingback:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B7E1C;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    int v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v12 = v19;
      LODWORD(v14) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_14:

        v7[2](v7, 0);
        goto LABEL_15;
      }
      id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v18, v14);
      free(v13);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B8328;
  v15[3] = &unk_1003A5A10;
  id v16 = v6;
  id v17 = v7;
  [(PurchaseActionsDatabase *)self readAsyncUsingTransactionBlock:v15];

LABEL_15:
}

- (void)setPingbackPendingForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B8948;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B8B48;
  v5[3] = &unk_1003A5B00;
  id v6 = a3;
  id v4 = v6;
  [(PurchaseActionsDatabase *)self readAsyncUsingTransactionBlock:v5];
}

- (void)removeInstallAttributionPingbackForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B914C;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B94A8;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

- (void)incrementPingbackRetryCountForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    unsigned int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      LODWORD(v12) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v15, v12);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B9810;
  v13[3] = &unk_1003A5998;
  id v14 = v4;
  [(PurchaseActionsDatabase *)self modifyUsingTransactionBlock:v13];
  id v6 = v14;
LABEL_14:
}

+ (BOOL)_setupDatabase:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B9A54;
  v6[3] = &unk_1003A5B28;
  int v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void).cxx_destruct
{
}

@end