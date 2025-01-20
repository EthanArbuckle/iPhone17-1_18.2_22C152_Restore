@interface RMAudioListenerPoseProvider
- (OS_dispatch_queue)receiverQueue;
- (RMAudioListenerPoseProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4;
- (RMAudioListenerPoseProviderConfiguration)configuration;
- (id)startProducingDataWithCallback:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setReceiverQueue:(id)a3;
- (void)stopProducingData;
@end

@implementation RMAudioListenerPoseProvider

- (RMAudioListenerPoseProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RMAudioListenerPoseProvider;
  v8 = [(RMAudioListenerPoseProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(RMAudioListenerPoseProvider *)v8 setConfiguration:v6];
    [(RMAudioListenerPoseProvider *)v9 setReceiverQueue:v7];
    atomic_store(0, (unsigned __int8 *)&v9->isRunning);
  }

  return v9;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024B20);
  }
  v5 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "startProducingData: %{private}p", buf, 0xCu);
  }
  id v6 = [(RMAudioListenerPoseProvider *)self configuration];
  id v7 = [v6 tempestOptions];

  v8 = [(RMAudioListenerPoseProvider *)self configuration];
  id v9 = [v8 forceSessionRestart];

  v10 = +[RMAudioListenerPoseEngine sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006EFC;
  v14[3] = &unk_100024B00;
  v14[4] = self;
  id v15 = v4;
  id v11 = v4;
  v12 = [v10 startProducingDataForObject:self tempestOptions:v7 forceSessionRestart:v9 callback:v14];

  if (!v12) {
    atomic_store(1u, (unsigned __int8 *)&self->isRunning);
  }

  return v12;
}

- (void)stopProducingData
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024B20);
  }
  v3 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134283521;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopProducingData: %{private}p", (uint8_t *)&v5, 0xCu);
  }
  id v4 = +[RMAudioListenerPoseEngine sharedInstance];
  [v4 stopProducingDataForObject:self];

  atomic_store(0, (unsigned __int8 *)&self->isRunning);
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (RMAudioListenerPoseProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end