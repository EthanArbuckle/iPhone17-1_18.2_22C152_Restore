@interface APMetricPreparedDataServerDelivery
- (APBackoffTimer)backoffTimer;
- (APMetricHTTPDelivery)httpDelivery;
- (APMetricStoringEC)storage;
- (APSequentialProcessor)processor;
- (APStorageManager)metricsFileManager;
- (BOOL)_sendRequest:(id)a3;
- (BOOL)_uploadFile:(id)a3;
- (NSEnumerator)files;
- (OS_dispatch_queue)queue;
- (void)_backoffTimerReset;
- (void)_backoffTimerScheduleNextLevel;
- (void)_continueProcessing;
- (void)backoffTimerFired;
- (void)setBackoffTimer:(id)a3;
- (void)setFiles:(id)a3;
- (void)setHttpDelivery:(id)a3;
- (void)setMetricsFileManager:(id)a3;
- (void)setProcessor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation APMetricPreparedDataServerDelivery

- (void)backoffTimerFired
{
}

- (void)_continueProcessing
{
  objc_initWeak(&location, self);
  v3 = [(APMetricPreparedDataServerDelivery *)self processor];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011C3DC;
  v4[3] = &unk_1002364E8;
  objc_copyWeak(&v5, &location);
  sub_1001244D8(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_uploadFile:(id)a3
{
  id v4 = a3;
  id v5 = [(APMetricPreparedDataServerDelivery *)self metricsFileManager];
  id v15 = 0;
  v6 = [v5 fileForReadingAtKeyPath:v4 error:&v15];
  id v7 = v15;

  if (v7)
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to open metrics data file: %{public}@", buf, 0xCu);
    }
LABEL_11:
    char v11 = 0;
    goto LABEL_12;
  }
  v8 = [v6 nextObject];
  if (!v8)
  {
    v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to read data from %{public}@", buf, 0xCu);
    }

    v13 = [(APMetricPreparedDataServerDelivery *)self metricsFileManager];
    [v13 removeObjectAtPath:v4 error:0];

    goto LABEL_11;
  }
  unsigned int v9 = [(APMetricPreparedDataServerDelivery *)self _sendRequest:v8];
  if (v9)
  {
    v10 = [(APMetricPreparedDataServerDelivery *)self metricsFileManager];
    [v10 removeObjectAtPath:v4 error:0];
  }
  char v11 = v9 ^ 1;
LABEL_12:

  return v11;
}

- (BOOL)_sendRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(APMetricPreparedDataServerDelivery *)self httpDelivery];
  id v15 = 0;
  v6 = [v5 sendHTTPDeliveryRequest:v4 error:&v15];

  id v7 = v15;
  if (v7)
  {
    id v8 = [v7 code];
    unsigned int v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error (%ld) attempting to send metrics data: %{public}@", buf, 0x16u);
    }

    goto LABEL_5;
  }
  char v11 = (char *)[v6 statusCode];
  if ((unint64_t)(v11 - 200) <= 0x63)
  {
    [(APMetricPreparedDataServerDelivery *)self _backoffTimerReset];
LABEL_13:
    BOOL v10 = 1;
    goto LABEL_14;
  }
  v12 = v11;
  if (v11 != (char *)503 && (unint64_t)(v11 - 400) > 0xC7)
  {
    v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received unknown status code from response (%ld)!", buf, 0xCu);
    }

    goto LABEL_13;
  }
LABEL_5:
  [(APMetricPreparedDataServerDelivery *)self _backoffTimerScheduleNextLevel];
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (void)_backoffTimerScheduleNextLevel
{
  v3 = [(APMetricPreparedDataServerDelivery *)self backoffTimer];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)APBackoffTimer) initWithSchedule:0 name:@"Prepared Data"];
    [(APMetricPreparedDataServerDelivery *)self setBackoffTimer:v4];

    id v5 = [(APMetricPreparedDataServerDelivery *)self backoffTimer];
    [v5 setDelegate:self];
  }
  v6 = [(APMetricPreparedDataServerDelivery *)self backoffTimer];
  id v7 = [(APMetricPreparedDataServerDelivery *)self queue];
  unsigned __int8 v8 = [v6 scheduleNextLevelWithQueue:v7];

  if ((v8 & 1) == 0)
  {
    unsigned int v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: Couldn't schedule Backoff Timer for Metric Data Server.", v10, 2u);
    }
  }
}

- (void)_backoffTimerReset
{
  v3 = [(APMetricPreparedDataServerDelivery *)self backoffTimer];
  [v3 reset];

  [(APMetricPreparedDataServerDelivery *)self setBackoffTimer:0];
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

- (APMetricHTTPDelivery)httpDelivery
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_httpDelivery);

  return (APMetricHTTPDelivery *)WeakRetained;
}

- (void)setHttpDelivery:(id)a3
{
}

- (NSEnumerator)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (APBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
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
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_destroyWeak((id *)&self->_httpDelivery);
  objc_destroyWeak((id *)&self->_storage);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end