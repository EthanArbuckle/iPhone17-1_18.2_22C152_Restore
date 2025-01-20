@interface UpdateMigrator
+ (id)sharedInstance;
- (BOOL)performMigration:(unint64_t)a3;
- (UpdateMigrator)init;
- (void)_loadBagAndPerformMigration;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_performMigration;
- (void)_queueMigration:(id)a3;
- (void)dealloc;
- (void)destroyInstance;
- (void)restoreDemotedBundleIdentifiers:(id)a3 options:(id)a4;
@end

@implementation UpdateMigrator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AB0D0;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401D60 != -1) {
    dispatch_once(&qword_100401D60, block);
  }
  v2 = (void *)qword_100401D58;

  return v2;
}

- (UpdateMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)UpdateMigrator;
  v2 = [(UpdateMigrator *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.UpdateMigrator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = ISNetworkTypeChangedNotification;
  v5 = +[ISNetworkObserver sharedInstance];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)UpdateMigrator;
  [(UpdateMigrator *)&v6 dealloc];
}

- (void)destroyInstance
{
  v2 = (void *)qword_100401D58;
  qword_100401D58 = 0;

  dispatch_queue_t v3 = (void *)qword_100401D58;
  qword_100401D58 = 0;
}

- (BOOL)performMigration:(unint64_t)a3
{
  self->_unint64_t updateType = a3;
  uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (v6)
  {
    LODWORD(v37) = 138412290;
    *(void *)((char *)&v37 + 4) = objc_opt_class();
    id v8 = *(id *)((char *)&v37 + 4);
    LODWORD(v36) = 12;
    v35 = &v37;
    v9 = (void *)_os_log_send_and_compose_impl();

    if (!v9) {
      goto LABEL_12;
    }
    v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v37, v36, v37);
    free(v9);
    v35 = v7;
    SSFileLog();
  }

LABEL_12:
  unint64_t updateType = self->_updateType;
  if ((updateType & 2) == 0)
  {
    if ((updateType & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
  v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = objc_msgSend(v11, "shouldLog", v35);
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    v13 &= 2u;
  }
  if (v13)
  {
    v15 = objc_opt_class();
    LODWORD(v37) = 138412290;
    *(void *)((char *)&v37 + 4) = v15;
    id v16 = v15;
    LODWORD(v36) = 12;
    v35 = &v37;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_27;
    }
    v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v37, v36);
    free(v17);
    v35 = v14;
    SSFileLog();
  }

LABEL_27:
  v18 = [[UpdateMigratorPromotionOperation alloc] initWithBundleIdentifiers:&__NSArray0__struct options:&__NSDictionary0__struct];
  [(UpdateMigrator *)self _queueMigration:v18];
  v19 = objc_alloc_init(UpdateMigratorAutoUpdateOperation);
  [(UpdateMigrator *)self _queueMigration:v19];

  unint64_t updateType = self->_updateType;
  if ((updateType & 4) == 0)
  {
LABEL_14:
    if ((updateType & 8) == 0) {
      return 1;
    }
LABEL_40:
    v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27)
    {
      v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    v30 = [v27 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      v29 &= 2u;
    }
    if (v29)
    {
      v31 = objc_opt_class();
      LODWORD(v37) = 138412290;
      *(void *)((char *)&v37 + 4) = v31;
      id v32 = v31;
      LODWORD(v36) = 12;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (!v33)
      {
LABEL_51:

        return 1;
      }
      v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v37, v36);
      free(v33);
      SSFileLog();
    }

    goto LABEL_51;
  }
LABEL_28:
  v20 = +[SSLogConfig sharedDaemonConfig];
  if (!v20)
  {
    v20 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
    v22 &= 2u;
  }
  if (v22)
  {
    v24 = objc_opt_class();
    LODWORD(v37) = 138412290;
    *(void *)((char *)&v37 + 4) = v24;
    id v25 = v24;
    LODWORD(v36) = 12;
    v35 = &v37;
    v26 = (void *)_os_log_send_and_compose_impl();

    if (!v26) {
      goto LABEL_39;
    }
    v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v37, v36);
    free(v26);
    v35 = v23;
    SSFileLog();
  }

LABEL_39:
  if ((self->_updateType & 8) != 0) {
    goto LABEL_40;
  }
  return 1;
}

- (void)restoreDemotedBundleIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
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
  v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_11;
  }
  unsigned int v12 = objc_opt_class();
  id v13 = v12;
  [v6 componentsJoinedByString:@", "];
  int v17 = 138412546;
  v18 = v12;
  __int16 v19 = 2112;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v17, v16);
    free(v14);
    SSFileLog();
LABEL_11:
  }
  v15 = [[UpdateMigratorPromotionOperation alloc] initWithBundleIdentifiers:v6 options:v7];

  [(UpdateMigrator *)self _queueMigration:v15];
}

- (void)_networkTypeChangedNotification:(id)a3
{
  uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    LODWORD(v16) = 138412290;
    *(void *)((char *)&v16 + 4) = objc_opt_class();
    id v8 = *(id *)((char *)&v16 + 4);
    LODWORD(v15) = 12;
    unsigned int v9 = (void *)_os_log_send_and_compose_impl();

    if (!v9) {
      goto LABEL_12;
    }
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v16, v15, v16);
    free(v9);
    SSFileLog();
  }

LABEL_12:
  int v10 = +[ISNetworkObserver sharedInstance];
  id v11 = [v10 networkType];

  if (v11)
  {
    unsigned int v12 = +[NSNotificationCenter defaultCenter];
    uint64_t v13 = ISNetworkTypeChangedNotification;
    v14 = +[ISNetworkObserver sharedInstance];
    [v12 removeObserver:self name:v13 object:v14];

    [(UpdateMigrator *)self _loadBagAndPerformMigration];
  }
}

- (void)_loadBagAndPerformMigration
{
  dispatch_queue_t v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    dispatch_queue_t v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v17 = 138412290;
    id v18 = (id)objc_opt_class();
    id v7 = v18;
    LODWORD(v15) = 12;
    id v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_12;
    }
    int v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v17, v15);
    free(v8);
    SSFileLog();
  }

LABEL_12:
  unsigned int v9 = +[SSURLBagContext contextWithBagType:0];
  int v10 = +[ISURLBagCache sharedCache];
  id v11 = [v10 URLBagForContext:v9];

  if (v11)
  {
    [(UpdateMigrator *)self _performMigration];
  }
  else
  {
    id v12 = [objc_alloc((Class)ISLoadURLBagOperation) initWithBagContext:v9];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000ABDF8;
    v16[3] = &unk_1003A3140;
    v16[4] = self;
    [v12 setCompletionBlock:v16];
    loadURLBagOperation = self->_loadURLBagOperation;
    self->_loadURLBagOperation = (ISLoadURLBagOperation *)v12;
    id v14 = v12;

    [(ISLoadURLBagOperation *)self->_loadURLBagOperation start];
  }
}

- (void)_performMigration
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC054;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_queueMigration:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AC1F8;
  v7[3] = &unk_1003A3268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrations, 0);
  objc_storeStrong((id *)&self->_loadURLBagOperation, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end