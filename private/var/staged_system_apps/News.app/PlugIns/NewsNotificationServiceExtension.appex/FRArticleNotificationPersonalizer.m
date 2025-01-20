@interface FRArticleNotificationPersonalizer
- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FRArticleNotificationPersonalizer)init;
- (FRArticleNotificationPersonalizer)initWithAppConfigurationManager:(id)a3 feedPersonalizerFactory:(id)a4;
- (void)sortItems:(id)a3 completion:(id)a4;
@end

@implementation FRArticleNotificationPersonalizer

- (FRArticleNotificationPersonalizer)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRArticleNotificationPersonalizer init]";
    __int16 v7 = 2080;
    v8 = "FRArticleNotificationPersonalizer.m";
    __int16 v9 = 1024;
    int v10 = 45;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRArticleNotificationPersonalizer init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FRArticleNotificationPersonalizer)initWithAppConfigurationManager:(id)a3 feedPersonalizerFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001EBC4();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001EAE4();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRArticleNotificationPersonalizer;
  __int16 v9 = [(FRArticleNotificationPersonalizer *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_feedPersonalizerFactory, a4);
  }

  return v10;
}

- (void)sortItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)FCFileCoordinatedTodayPrivateDataTransactionQueue);
  __int16 v9 = FCURLForTodayPrivateDataTransactionQueue();
  id v10 = [v8 initWithFileURL:v9];

  id v11 = objc_alloc((Class)FCFileCoordinatedTodayDropbox);
  objc_super v12 = FCURLForTodayDropbox();
  id v13 = [v11 initWithFileURL:v12];

  id v14 = [objc_alloc((Class)FCReadablePrivateDataStorage) initWithDropbox:v13 transactionQueue:v10];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1000044D0;
  v34[4] = sub_1000044E0;
  id v35 = 0;
  v15 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_1000044D0;
  v32[4] = sub_1000044E0;
  id v33 = 0;
  v16 = [(FRArticleNotificationPersonalizer *)self appConfigurationManager];
  dispatch_group_enter(v15);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000044E8;
  v29[3] = &unk_100028C10;
  v31 = v32;
  v17 = v15;
  v30 = v17;
  [v16 fetchAppConfigurationIfNeededWithCompletion:v29];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100004538;
  v28[3] = &unk_100028C38;
  v28[4] = v34;
  [v14 readPrivateDataSyncWithAccessor:v28];
  v18 = FCDispatchQueueForQualityOfService();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004580;
  block[3] = &unk_100028C88;
  block[4] = self;
  id v23 = v16;
  v26 = v34;
  v27 = v32;
  id v24 = v6;
  id v25 = v7;
  id v19 = v7;
  id v20 = v6;
  id v21 = v16;
  dispatch_group_notify(v17, v18, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);

  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end