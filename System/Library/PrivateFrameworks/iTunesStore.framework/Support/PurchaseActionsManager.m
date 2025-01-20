@interface PurchaseActionsManager
+ (id)sharedInstance;
+ (void)registerInstallAttributionDatabaseCleanTask;
+ (void)registerInstallAttributionPingbackRetryTask;
+ (void)unregisterInstallAttributionPingbackRetryTask;
- (PurchaseActionsManager)init;
- (void)deletePurchaseIntentsForApp:(id)a3;
- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4;
- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4;
- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3;
- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4;
- (void)insertInstallAttributionParams:(id)a3 overrideCampaignLimit:(BOOL)a4 completionHandler:(id)a5;
- (void)insertInstallAttributionPingback:(id)a3;
- (void)insertPurchaseIntent:(id)a3;
- (void)removeInstallAttributionParamsBeforeDate:(id)a3;
- (void)removeInstallAttributionParamsForApp:(id)a3;
- (void)removeInstallAttributionPingbackForApp:(id)a3;
- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3;
- (void)resetTimestampsForApp:(id)a3;
- (void)sendPendingPingbacks;
- (void)setAppBundleIdForCurrentInstallSheet:(id)a3;
- (void)setPingbackPendingForApp:(id)a3;
@end

@implementation PurchaseActionsManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AA4D0;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100402000 != -1) {
    dispatch_once(&qword_100402000, block);
  }
  v2 = (void *)qword_100401FF8;

  return v2;
}

- (PurchaseActionsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PurchaseActionsManager;
  v2 = [(PurchaseActionsManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PurchaseActionsDatabase);
    database = v2->_database;
    v2->_database = v3;
  }
  return v2;
}

- (void)deletePurchaseIntentsForApp:(id)a3
{
}

- (void)getPurchaseIntentsForApp:(id)a3 completionHandler:(id)a4
{
}

- (void)insertPurchaseIntent:(id)a3
{
}

- (void)resetTimestampsForApp:(id)a3
{
}

- (void)setAppBundleIdForCurrentInstallSheet:(id)a3
{
  id v5 = a3;
  bundleIdForCurrentInstallSheet = self->_bundleIdForCurrentInstallSheet;
  p_bundleIdForCurrentInstallSheet = &self->_bundleIdForCurrentInstallSheet;
  id v8 = v5;
  if (!-[NSString isEqualToString:](bundleIdForCurrentInstallSheet, "isEqualToString:")) {
    objc_storeStrong((id *)p_bundleIdForCurrentInstallSheet, a3);
  }
}

- (void)insertInstallAttributionParams:(id)a3 overrideCampaignLimit:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!a4)
  {
    id v11 = objc_alloc_init((Class)ISLoadURLBagOperation);
    v12 = +[ISOperationQueue mainQueue];
    id v43 = v11;
    v13 = +[NSArray arrayWithObjects:&v43 count:1];
    [v12 addOperations:v13 waitUntilFinished:1];

    if ([v11 success])
    {
      v14 = [v11 URLBag];
      v15 = [v14 valueForKey:@"install-attribution-max-campaign-id"];

      if (v15 && [v15 integerValue])
      {
        uint64_t v10 = (uint64_t)[v15 integerValue];
LABEL_19:

        goto LABEL_20;
      }
LABEL_18:
      uint64_t v10 = 100;
      goto LABEL_19;
    }
    v15 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v15)
    {
      v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v37 = 138543362;
      id v38 = (id)objc_opt_class();
      id v19 = v38;
      LODWORD(v34) = 12;
      v33 = &v37;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_18;
      }
      v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v37, v34);
      free(v20);
      v33 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_18;
  }
  uint64_t v10 = 100;
LABEL_20:
  v21 = objc_msgSend(v8, "campaignId", v33);
  uint64_t v22 = (uint64_t)[v21 integerValue];

  if (a4 || v22 <= v10 && v22 >= 1)
  {
    database = self->_database;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001AAA98;
    v35[3] = &unk_1003A9048;
    id v36 = v9;
    [(PurchaseActionsDatabase *)database insertInstallAttributionParams:v8 completionHandler:v35];
    v24 = v36;
    goto LABEL_24;
  }
  v25 = +[SSLogConfig sharediTunesStoreConfig];
  if (!v25)
  {
    v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  v28 = [v25 OSLogObject];
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    v27 &= 2u;
  }
  if (!v27) {
    goto LABEL_36;
  }
  v29 = objc_opt_class();
  int v37 = 138543874;
  id v38 = v29;
  __int16 v39 = 2050;
  uint64_t v40 = v22;
  __int16 v41 = 2050;
  uint64_t v42 = v10;
  id v30 = v29;
  LODWORD(v34) = 32;
  v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v37, v34);
    free(v31);
    SSFileLog();
LABEL_36:
  }
  if (!v9) {
    goto LABEL_25;
  }
  v32 = +[NSString stringWithFormat:@"Campaign id must be between 0 and %li", v10];
  v24 = SSError();

  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v24);
LABEL_24:

LABEL_25:
}

- (void)getInstallAttributionParamsForApp:(id)a3 completionHandler:(id)a4
{
}

- (void)removeInstallAttributionParamsForApp:(id)a3
{
}

- (void)removeInstallAttributionParamsBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  *(_DWORD *)v12 = 138543618;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2114;
  *(void *)&v12[14] = v4;
  id v9 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  [(PurchaseActionsDatabase *)self->_database removeInstallAttributionParamsBeforeDate:v4];
}

+ (void)registerInstallAttributionDatabaseCleanTask
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 604800);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001AAE04;
  v5[3] = &unk_1003A45D8;
  id v6 = v3;
  id v7 = a1;
  id v4 = v3;
  xpc_activity_register("com.apple.itunesstored.PurchaseActionManager.IAParamsClean", XPC_ACTIVITY_CHECK_IN, v5);
}

- (void)insertInstallAttributionPingback:(id)a3
{
}

- (void)getInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4
{
}

- (void)setPingbackPendingForApp:(id)a3
{
  int64_t v4 = 1000000000;
  [(PurchaseActionsDatabase *)self->_database setPingbackPendingForApp:a3];
  if ((SSDebugShouldDisableInstallAttributionPingbackDelay() & 1) == 0) {
    int64_t v4 = 1000000000 * (arc4random_uniform(0x1C20u) + 1);
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AB6E0;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  +[PurchaseActionsManager registerInstallAttributionPingbackRetryTask];
}

- (void)getPendingInstallAttributionPingbacksWithCompletionHandler:(id)a3
{
}

- (void)removeInstallAttributionPingbackForApp:(id)a3
{
}

- (void)removeNonPendingInstallAttributionPingbacksBeforeDate:(id)a3
{
}

- (void)sendPendingPingbacks
{
  id v3 = objc_alloc_init((Class)ISLoadURLBagOperation);
  int64_t v4 = +[ISOperationQueue mainQueue];
  id v19 = v3;
  dispatch_time_t v5 = +[NSArray arrayWithObjects:&v19 count:1];
  [v4 addOperations:v5 waitUntilFinished:1];

  if (![v3 success])
  {
    id v7 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v7 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v12 = v18;
      LODWORD(v15) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_16:
        uint64_t v8 = 10;
        goto LABEL_17;
      }
      uint64_t v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v17, v15);
      free(v13);
      SSFileLog();
    }

    goto LABEL_16;
  }
  id v6 = [v3 URLBag];
  id v7 = [v6 valueForKey:@"install-attribution-max-ping-back-attempts"];

  if (!v7 || ![v7 integerValue]) {
    goto LABEL_16;
  }
  uint64_t v8 = (uint64_t)[v7 integerValue];
LABEL_17:

  database = self->_database;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001AB98C;
  v16[3] = &unk_1003A9098;
  v16[4] = self;
  v16[5] = v8;
  [(PurchaseActionsDatabase *)database getPendingInstallAttributionPingbacksWithCompletionHandler:v16];
}

+ (void)registerInstallAttributionPingbackRetryTask
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, 86400);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001AC1E0;
  v5[3] = &unk_1003A45D8;
  id v6 = v3;
  id v7 = a1;
  id v4 = v3;
  xpc_activity_register("com.apple.itunesstored.PurchaseActionManager.IAPingbackRetry", XPC_ACTIVITY_CHECK_IN, v5);
}

+ (void)unregisterInstallAttributionPingbackRetryTask
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdForCurrentInstallSheet, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end