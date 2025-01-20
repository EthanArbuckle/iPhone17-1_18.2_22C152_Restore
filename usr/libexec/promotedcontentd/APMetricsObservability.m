@interface APMetricsObservability
- (APObservabilitySignalMonitoring)signalMonitor;
- (OS_dispatch_queue)queue;
- (void)_batchClosedWithBatchLifetime:(double)a3 batchID:(id)a4 eventsCount:(int64_t)a5;
- (void)_batchDequeuedWithWaitingTime:(double)a3 queueLength:(int64_t)a4 batchID:(id)a5;
- (void)_batchEnqueuedWithQueueLength:(int64_t)a3;
- (void)_payloadUploadFailureWithType:(int64_t)a3 code:(int64_t)a4 batchInfos:(id)a5;
- (void)_payloadUploadSuccessForBatchInfos:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSignalMonitor:(id)a3;
@end

@implementation APMetricsObservability

- (void)_batchClosedWithBatchLifetime:(double)a3 batchID:(id)a4 eventsCount:(int64_t)a5
{
  id v8 = a4;
  v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218498;
    double v12 = a3;
    __int16 v13 = 2048;
    int64_t v14 = a5;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Batch closed lifetime: %f, events count: %ld BatchID: %{public}@", (uint8_t *)&v11, 0x20u);
  }

  v10 = [(APMetricsObservability *)self signalMonitor];
  [v10 batchClosedWithBatchLifetime:a5 eventsCount:a3];
}

- (void)_batchDequeuedWithWaitingTime:(double)a3 queueLength:(int64_t)a4 batchID:(id)a5
{
  id v8 = a5;
  v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218498;
    double v12 = a3;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Batch dequeued waiting time: %f, queue length: %ld, batch ID: %{public}@", (uint8_t *)&v11, 0x20u);
  }

  v10 = [(APMetricsObservability *)self signalMonitor];
  [v10 batchDequeuedWithWaitingTime:a4 queueLength:v8 batchID:a3];
}

- (void)_batchEnqueuedWithQueueLength:(int64_t)a3
{
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Batch enqueued, queue length: %ld", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(APMetricsObservability *)self signalMonitor];
  [v6 batchEnqueuedWithQueueLength:a3];
}

- (void)_payloadUploadFailureWithType:(int64_t)a3 code:(int64_t)a4 batchInfos:(id)a5
{
  id v8 = a5;
  v9 = (void *)os_transaction_create();
  v10 = [(APMetricsObservability *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118E1C;
  block[3] = &unk_100236698;
  int64_t v17 = a3;
  int64_t v18 = a4;
  id v14 = v8;
  __int16 v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);
}

- (void)_payloadUploadSuccessForBatchInfos:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = [(APMetricsObservability *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001190A8;
  block[3] = &unk_100236608;
  id v10 = v4;
  id v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (APObservabilitySignalMonitoring)signalMonitor
{
  return self->_signalMonitor;
}

- (void)setSignalMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_signalMonitor, 0);
}

@end