@interface APMetricPreparedUnsignedDataProcessor
- (APMetricStoringEC)storage;
- (APSequentialProcessor)processor;
- (APStorageManager)metricsFileManager;
- (OS_dispatch_queue)queue;
- (void)_processNextFile:(id)a3 completionHandler:(id)a4;
- (void)_signFile:(id)a3 usingSigningAuthority:(id)a4 completionHandler:(id)a5;
- (void)setMetricsFileManager:(id)a3;
- (void)setProcessor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation APMetricPreparedUnsignedDataProcessor

- (void)_processNextFile:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc((Class)APSigningAuthority);
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  id v11 = [v8 initWithPoolName:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001142EC;
  v14[3] = &unk_100236510;
  objc_copyWeak(&v17, &location);
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [v11 setupWithCompletion:1 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_signFile:(id)a3 usingSigningAuthority:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void))a5;
  id v11 = (void *)os_transaction_create();
  id v12 = [(APMetricPreparedUnsignedDataProcessor *)self metricsFileManager];
  id v33 = 0;
  id v13 = [v12 fileForReadingAtKeyPath:v8 error:&v33];
  id v14 = v33;

  if (!v14)
  {
    id v16 = [v13 nextObject];
    id v17 = v16;
    if (v16)
    {
      id v32 = 0;
      id v18 = [v16 buildSignatureUsingSigningAuthority:v9 error:&v32];
      id v19 = v32;
      if (v19
        || ([v17 signature],
            v22 = objc_claimAutoreleasedReturnValue(),
            id v23 = [v22 length],
            v22,
            !v23))
      {
        APSimulateCrashNoKillProcess();
      }
      else
      {
        uint64_t v24 = +[APMetricStorage_private signedPathFromUnsigned:v8];
        v25 = [(APMetricPreparedUnsignedDataProcessor *)self metricsFileManager];
        id v31 = 0;
        v29 = (void *)v24;
        v26 = [v25 fileForWritingAtKeyPath:v24 error:&v31];
        id v27 = v31;

        id v30 = v27;
        [v26 addObject:v17 error:&v30];
        id v19 = v30;

        [v26 close];
        if (self && self->_fileProcessedBlock) {
          (*((void (**)(void))self->_fileProcessedBlock + 2))();
        }
        if (v19)
        {
          v28 = APLogForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v35 = v19;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to save a file: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v28 = [(APMetricPreparedUnsignedDataProcessor *)self metricsFileManager];
          [v28 removeObjectAtPath:v8 error:0];
        }
      }
      id v14 = v19;
      if (!v10) {
        goto LABEL_24;
      }
    }
    else
    {
      v20 = APLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to read data from %{public}@", buf, 0xCu);
      }

      v21 = [(APMetricPreparedUnsignedDataProcessor *)self metricsFileManager];
      [v21 removeObjectAtPath:v8 error:0];

      id v19 = 0;
      id v14 = 0;
      if (!v10) {
        goto LABEL_24;
      }
    }
    v10[2](v10);
    id v14 = v19;
LABEL_24:

    goto LABEL_25;
  }
  id v15 = APLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to open metrics data file: %{public}@", buf, 0xCu);
  }

  if (v10) {
    v10[2](v10);
  }
LABEL_25:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (APMetricStoringEC)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  return (APMetricStoringEC *)WeakRetained;
}

- (void)setStorage:(id)a3
{
}

- (APSequentialProcessor)processor
{
  return self->_processor;
}

- (void)setProcessor:(id)a3
{
}

- (APStorageManager)metricsFileManager
{
  return self->_metricsFileManager;
}

- (void)setMetricsFileManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsFileManager, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_fileProcessedBlock, 0);
}

@end