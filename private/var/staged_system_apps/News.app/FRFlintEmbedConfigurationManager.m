@interface FRFlintEmbedConfigurationManager
- (BOOL)hasLoaded;
- (FCFlintResourceManager)resourceManager;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FREmbedConfigurationOperation)operation;
- (FRFlintEmbedConfiguration)loadedConfiguration;
- (FRFlintEmbedConfigurationManager)initWithConfigurationManager:(id)a3 resourceManager:(id)a4;
- (NFUnfairLock)lock;
- (id)embedForType:(id)a3;
- (id)operationForConfigurationManager:(id)a3 resourceManager:(id)a4;
- (void)fetchEmbedConfigurationWithCompletion:(id)a3;
- (void)loadEmbedDataWithCompletion:(id)a3;
- (void)setOperation:(id)a3;
@end

@implementation FRFlintEmbedConfigurationManager

- (FRFlintEmbedConfigurationManager)initWithConfigurationManager:(id)a3 resourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FRFlintEmbedConfigurationManager;
  v9 = [(FRFlintEmbedConfigurationManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_resourceManager, a4);
    v11 = (NFUnfairLock *)[objc_alloc((Class)NFUnfairLock) initWithOptions:1];
    lock = v10->_lock;
    v10->_lock = v11;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100056848;
    v14[3] = &unk_1000C5680;
    v15 = v10;
    +[FCTaskScheduler scheduleLowPriorityBlock:v14];
  }
  return v10;
}

- (void)fetchEmbedConfigurationWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100018B40;
  v31 = sub_100018A28;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100018B40;
  v25 = sub_100018A28;
  id v26 = 0;
  v5 = [(FRFlintEmbedConfigurationManager *)self lock];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100056C30;
  v20[3] = &unk_1000C94D0;
  v20[4] = self;
  v20[5] = &v27;
  v20[6] = &v21;
  [v5 performWithLockSync:v20];

  if (v28[5])
  {
    v4[2](v4);
  }
  else
  {
    if (!v22[5])
    {
      v6 = [(FRFlintEmbedConfigurationManager *)self appConfigurationManager];
      id v7 = [(FRFlintEmbedConfigurationManager *)self resourceManager];
      uint64_t v8 = [(FRFlintEmbedConfigurationManager *)self operationForConfigurationManager:v6 resourceManager:v7];
      v9 = (void *)v22[5];
      v22[5] = v8;

      v10 = FCDefaultLog;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(FRFlintEmbedConfigurationManager *)self operation];
        v12 = [v11 shortOperationDescription];
        *(_DWORD *)buf = 134218242;
        v34 = self;
        __int16 v35 = 2114;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "embed configuration manager=%p will fetch embed configuration with operation %{public}@", buf, 0x16u);
      }
      v13 = +[NSOperationQueue fc_sharedConcurrentQueue];
      [v13 addOperation:v22[5]];

      v14 = [(FRFlintEmbedConfigurationManager *)self lock];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100056C9C;
      v19[3] = &unk_1000C9408;
      v19[4] = self;
      v19[5] = &v21;
      [v14 performWithLockSync:v19];
    }
    objc_initWeak((id *)buf, self);
    v15 = (void *)v22[5];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100056CAC;
    v16[3] = &unk_1000C94F8;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    [v15 addCompletionHandler:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

- (id)embedForType:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100018B40;
  objc_super v16 = sub_100018A28;
  id v17 = 0;
  v5 = [(FRFlintEmbedConfigurationManager *)self lock];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100056E64;
  v9[3] = &unk_1000C8EA8;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performWithLockSync:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)loadEmbedDataWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100056F64;
  v5[3] = &unk_1000C9520;
  id v6 = a3;
  id v4 = v6;
  [(FRFlintEmbedConfigurationManager *)self fetchEmbedConfigurationWithCompletion:v5];
}

- (id)operationForConfigurationManager:(id)a3 resourceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[FREmbedConfigurationOperation alloc] initWithAppConfigManager:v6 andResourceManager:v7];
  [(FREmbedConfigurationOperation *)v8 setRelativePriority:1];
  [(FREmbedConfigurationOperation *)v8 setQualityOfService:25];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000570A4;
  v10[3] = &unk_1000C9548;
  objc_copyWeak(&v11, &location);
  [(FREmbedConfigurationOperation *)v8 setEmbedFetchCompletionBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (FRFlintEmbedConfiguration)loadedConfiguration
{
  return self->_loadedConfiguration;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (FREmbedConfigurationOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_loadedConfiguration, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);

  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end