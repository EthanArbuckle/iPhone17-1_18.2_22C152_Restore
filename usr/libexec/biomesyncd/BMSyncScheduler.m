@interface BMSyncScheduler
- (BMSyncScheduler)initWithRapportSyncEngine:(id)a3 cloudKitSyncEngine:(id)a4 peerStatusTracker:(id)a5 database:(id)a6 queue:(id)a7;
- (BOOL)canPerformCloudKitSyncWithReason:(unint64_t)a3;
- (BOOL)canPerformRapportSyncWithReason:(unint64_t)a3;
- (void)syncAllTransportsNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4;
- (void)syncCloudKitNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
- (void)syncNowIfPolicyAllowsWithReason:(unint64_t)a3 transportType:(unint64_t)a4 activity:(id)a5;
- (void)syncRapportNowIfPolicyAllowsWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (void)syncRapportNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
@end

@implementation BMSyncScheduler

- (BMSyncScheduler)initWithRapportSyncEngine:(id)a3 cloudKitSyncEngine:(id)a4 peerStatusTracker:(id)a5 database:(id)a6 queue:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMSyncScheduler;
  v17 = [(BMSyncScheduler *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rapportSyncEngine, a3);
    objc_storeStrong((id *)&v18->_cloudKitSyncEngine, a4);
    objc_storeStrong((id *)&v18->_peerStatusTracker, a5);
    objc_storeStrong((id *)&v18->_database, a6);
    objc_storeStrong((id *)&v18->_queue, a7);
  }

  return v18;
}

- (void)syncNowIfPolicyAllowsWithReason:(unint64_t)a3 transportType:(unint64_t)a4 activity:(id)a5
{
  id v8 = a5;
  if (a4 == 3)
  {
    [(BMSyncScheduler *)self syncCloudKitNowIfPolicyAllowsWithReason:a3 activity:v8 completionHandler:0];
  }
  else if (a4 == 2)
  {
    [(BMSyncScheduler *)self syncRapportNowIfPolicyAllowsWithReason:a3 activity:v8 completionHandler:0];
  }
  else
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unrecognized transport type (%lu)", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)syncAllTransportsNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4
{
  id v6 = a4;
  v7 = dispatch_group_create();
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "syncNowIfPolicyAllowsWithReason: begin rapport sync", buf, 2u);
  }

  dispatch_group_enter(v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035E6C;
  block[3] = &unk_10006D870;
  block[4] = self;
  unint64_t v23 = a3;
  id v10 = v6;
  id v21 = v10;
  unint64_t v11 = v7;
  v22 = v11;
  dispatch_sync((dispatch_queue_t)queue, block);
  v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "syncNowIfPolicyAllowsWithReason: begin cloudkit sync", buf, 2u);
  }

  dispatch_group_enter(v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100035F10;
  v18[3] = &unk_10006CC98;
  v19 = v11;
  id v13 = v11;
  [(BMSyncScheduler *)self syncCloudKitNowIfPolicyAllowsWithReason:a3 activity:v10 completionHandler:v18];
  id v14 = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100035F18;
  v16[3] = &unk_10006CB58;
  id v17 = v10;
  id v15 = v10;
  dispatch_group_notify(v13, (dispatch_queue_t)v14, v16);
}

- (BOOL)canPerformRapportSyncWithReason:(unint64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  +[BMSyncPolicy minimumTimeBetweenSyncsForTransport:2];
  double v6 = v5;
  +[BMSyncPolicy minimumTimeBetweenSyncsAttemptsForTransport:2];
  double v8 = v7;
  v9 = [(BMSyncDevicePeerStatusTracker *)self->_peerStatusTracker lastSyncDateFromAnyDevice];
  id v10 = [(BMSyncDatabase *)self->_database lastRapportSyncAttemptDate];
  unint64_t v11 = +[NSDate now];
  v12 = v11;
  if (!v10)
  {
    double v14 = INFINITY;
    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    double v16 = INFINITY;
    goto LABEL_8;
  }
  [v11 timeIntervalSinceDate:v10];
  double v14 = v13;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  [v12 timeIntervalSinceDate:v9];
  double v16 = v15;
LABEL_8:
  id v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"never";
    int v21 = 138544130;
    if (v9) {
      CFStringRef v19 = v9;
    }
    else {
      CFStringRef v19 = @"never";
    }
    CFStringRef v22 = v19;
    __int16 v23 = 2048;
    if (v10) {
      CFStringRef v18 = v10;
    }
    double v24 = v16;
    __int16 v25 = 2114;
    CFStringRef v26 = v18;
    __int16 v27 = 2048;
    double v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "last sync: %{public}@ (%f ago), last attempt: %{public}@ (%f ago)", (uint8_t *)&v21, 0x2Au);
  }

  if (v9 && v16 < v6 * 0.9 || (BOOL v3 = 1, v10) && v14 < v8 * 0.9) {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)syncRapportNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  double v8 = (_xpc_activity_s *)a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BMSyncDatabase *)self->_database open])
  {
    id v11 = (id)os_transaction_create();
    if ([(BMSyncScheduler *)self canPerformRapportSyncWithReason:a3])
    {
      v12 = +[NSDate now];
      [(BMSyncDatabase *)self->_database setLastRapportSyncAttemptDate:v12];

      if (v8) {
        xpc_activity_set_state(v8, 4);
      }
      [(BMRapportSyncEngine *)self->_rapportSyncEngine startClient];
      rapportSyncEngine = self->_rapportSyncEngine;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000364D4;
      v24[3] = &unk_10006D898;
      v24[4] = self;
      id v11 = v11;
      id v25 = v11;
      id v26 = v9;
      [(BMRapportSyncEngine *)rapportSyncEngine syncNowWithReason:a3 activity:v8 completionHandler:v24];
    }
    else
    {
      CFStringRef v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "skipping rapport sync", buf, 2u);
      }

      CFStringRef v19 = [(BMRapportSyncEngine *)self->_rapportSyncEngine metricsCollector];
      id v20 = [v19 sessionContext];
      int v21 = [v20 sessionID];
      [v19 recordSessionStart:v21 transport:2 reason:2 isReciprocal:0];

      CFStringRef v22 = [v20 sessionID];
      __int16 v23 = [(BMSyncDatabase *)self->_database lastRapportSyncDate];
      [v19 recordSessionEnd:v22 lastSyncDate:v23];

      [(BMSyncDatabase *)self->_database clearCachedStatements];
      if (v9) {
        (*((void (**)(id, void *, void))v9 + 2))(v9, &__NSArray0__struct, 0);
      }
    }
    goto LABEL_18;
  }
  double v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unable to perform Rapport sync now, because database is not currently accessible", buf, 2u);
  }

  unint64_t v15 = [(BMSyncDatabase *)self->_database state];
  if (v9)
  {
    if (v15 == 2) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 3;
    }
    id v11 = +[NSError errorWithDomain:BMSyncErrorDomain code:v16 userInfo:0];
    id v28 = v11;
    id v17 = +[NSArray arrayWithObjects:&v28 count:1];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v17);

LABEL_18:
  }
}

- (void)syncRapportNowIfPolicyAllowsWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = (_xpc_activity_s *)a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(BMSyncDatabase *)self->_database open])
  {
    id v14 = (id)os_transaction_create();
    if ([(BMSyncScheduler *)self canPerformRapportSyncWithReason:a4])
    {
      unint64_t v15 = +[NSDate now];
      [(BMSyncDatabase *)self->_database setLastRapportSyncAttemptDate:v15];

      if (v11) {
        xpc_activity_set_state(v11, 4);
      }
      [(BMRapportSyncEngine *)self->_rapportSyncEngine startClient];
      rapportSyncEngine = self->_rapportSyncEngine;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10003695C;
      v27[3] = &unk_10006D898;
      v27[4] = self;
      id v14 = v14;
      id v28 = v14;
      id v29 = v12;
      [(BMRapportSyncEngine *)rapportSyncEngine syncNowWithDevices:v10 reason:a4 activity:v11 completionHandler:v27];
    }
    else
    {
      int v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "skipping filtered rapport sync", buf, 2u);
      }

      CFStringRef v22 = [(BMRapportSyncEngine *)self->_rapportSyncEngine metricsCollector];
      __int16 v23 = [v22 sessionContext];
      double v24 = [v23 sessionID];
      [v22 recordSessionStart:v24 transport:2 reason:2 isReciprocal:0];

      id v25 = [v23 sessionID];
      id v26 = [(BMSyncDatabase *)self->_database lastRapportSyncDate];
      [v22 recordSessionEnd:v25 lastSyncDate:v26];

      [(BMSyncDatabase *)self->_database clearCachedStatements];
      if (v12) {
        (*((void (**)(id, void *, void))v12 + 2))(v12, &__NSArray0__struct, 0);
      }
    }
    goto LABEL_18;
  }
  id v17 = __biome_log_for_category();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to perform filtered Rapport sync now, because database is not currently accessible", buf, 2u);
  }

  unint64_t v18 = [(BMSyncDatabase *)self->_database state];
  if (v12)
  {
    if (v18 == 2) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 3;
    }
    id v14 = +[NSError errorWithDomain:BMSyncErrorDomain code:v19 userInfo:0];
    id v31 = v14;
    id v20 = +[NSArray arrayWithObjects:&v31 count:1];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v20);

LABEL_18:
  }
}

- (BOOL)canPerformCloudKitSyncWithReason:(unint64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  +[BMSyncPolicy minimumTimeBetweenSyncsForTransport:3];
  double v6 = v5;
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100036BF0;
  unint64_t v18 = sub_100036C00;
  id v19 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100036C08;
  v13[3] = &unk_10006D710;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync((dispatch_queue_t)queue, v13);
  double v8 = +[NSDate now];
  id v9 = v8;
  if (v15[5])
  {
    [v8 timeIntervalSinceDate:];
    BOOL v11 = v15[5] == 0;
  }
  else
  {
    BOOL v11 = 1;
    double v10 = INFINITY;
  }
  BOOL v3 = v10 >= v6 * 0.9 || v11;

  _Block_object_dispose(&v14, 8);
  return v3;
}

- (void)syncCloudKitNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  double v8 = (_xpc_activity_s *)a4;
  id v9 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036F54;
  block[3] = &unk_10006D8C0;
  block[4] = self;
  id v12 = v9;
  id v27 = v12;
  id v28 = &v29;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((unsigned char *)v30 + 24))
  {
    double v13 = (void *)os_transaction_create();
    if ([(BMSyncScheduler *)self canPerformCloudKitSyncWithReason:a3])
    {
      uint64_t v14 = self->_queue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000370B4;
      v25[3] = &unk_10006CB58;
      v25[4] = self;
      dispatch_sync((dispatch_queue_t)v14, v25);
      if (v8) {
        xpc_activity_set_state(v8, 4);
      }
      cloudKitSyncEngine = self->_cloudKitSyncEngine;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100037120;
      v20[3] = &unk_10006D8E8;
      v20[4] = self;
      unint64_t v24 = a3;
      int v21 = v8;
      id v22 = v13;
      id v23 = v12;
      [(BMCloudKitSyncEngine *)cloudKitSyncEngine startWithCompletionBlock:v20];
    }
    else
    {
      uint64_t v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "skipping cloudkit sync", buf, 2u);
      }

      id v17 = self->_queue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100037444;
      v18[3] = &unk_10006CB58;
      void v18[4] = self;
      dispatch_sync((dispatch_queue_t)v17, v18);
      if (v12) {
        (*((void (**)(id, void *, void))v12 + 2))(v12, &__NSArray0__struct, 0);
      }
    }
  }
  _Block_object_dispose(&v29, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_peerStatusTracker, 0);
  objc_storeStrong((id *)&self->_cloudKitSyncEngine, 0);

  objc_storeStrong((id *)&self->_rapportSyncEngine, 0);
}

@end