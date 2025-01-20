@interface RMDummyDataProvider
- (BOOL)isRunning;
- (OS_dispatch_queue)producerQueue;
- (OS_dispatch_queue)receiverQueue;
- (OS_dispatch_source)producerTimer;
- (RMDummyDataProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4;
- (RMDummyDataProviderConfiguration)configuration;
- (id)startProducingDataWithCallback:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setProducerQueue:(id)a3;
- (void)setProducerTimer:(id)a3;
- (void)setReceiverQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)stopProducingData;
@end

@implementation RMDummyDataProvider

- (RMDummyDataProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RMDummyDataProvider;
  v8 = [(RMDummyDataProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(RMDummyDataProvider *)v8 setConfiguration:v6];
    [(RMDummyDataProvider *)v9 setReceiverQueue:v7];
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v11 = dispatch_queue_create("RMDummyDataProviderQueue", v10);
    [(RMDummyDataProvider *)v9 setProducerQueue:v11];
  }
  return v9;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  [(RMDummyDataProvider *)self setRunning:1];
  v5 = [(RMDummyDataProvider *)self producerQueue];
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v5);
  [(RMDummyDataProvider *)self setProducerTimer:v6];

  id v7 = [(RMDummyDataProvider *)self producerTimer];
  dispatch_source_set_timer(v7, 0, [(RMDummyDataProviderConfiguration *)self->_configuration intervalInNanoSeconds], 0);

  v8 = [(RMDummyDataProvider *)self producerTimer];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10000D254;
  v15 = &unk_100024D88;
  v16 = self;
  id v17 = v4;
  id v9 = v4;
  dispatch_source_set_event_handler(v8, &v12);

  v10 = [(RMDummyDataProvider *)self producerTimer];
  dispatch_resume(v10);

  return 0;
}

- (void)stopProducingData
{
  [(RMDummyDataProvider *)self setRunning:0];
  v3 = [(RMDummyDataProvider *)self producerTimer];
  dispatch_source_cancel(v3);

  [(RMDummyDataProvider *)self setProducerTimer:0];
}

- (OS_dispatch_queue)producerQueue
{
  return self->_producerQueue;
}

- (void)setProducerQueue:(id)a3
{
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (RMDummyDataProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)producerTimer
{
  return self->_producerTimer;
}

- (void)setProducerTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_producerTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_receiverQueue, 0);

  objc_storeStrong((id *)&self->_producerQueue, 0);
}

@end