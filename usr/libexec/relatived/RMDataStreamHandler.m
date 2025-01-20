@interface RMDataStreamHandler
- (BOOL)endpoint:(id)a3 shouldStartStreamingDataToReceiver:(id)a4;
- (RMDataStreamHandler)initWithEndpoint:(id)a3 isInternal:(BOOL)a4;
- (void)dealloc;
- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6;
- (void)endpoint:(id)a3 didReceiveStreamingRequest:(id)a4 withData:(id)a5;
- (void)endpointShouldStopStreamingData:(id)a3;
@end

@implementation RMDataStreamHandler

- (RMDataStreamHandler)initWithEndpoint:(id)a3 isInternal:(BOOL)a4
{
  v7 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)RMDataStreamHandler;
  v8 = [(RMDataStreamHandler *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpoint, a3);
    sub_100015E24(v7, v9);
    v9->_isInternal = a4;
    v9->_dataProviderStreaming = 0;
  }

  return v9;
}

- (void)dealloc
{
  if (self)
  {
    [(RBSProcessMonitor *)self->_processMonitor invalidate];
    sub_10000261C((uint64_t)self, 0);
    endpoint = self->_endpoint;
  }
  else
  {
    [0 invalidate];
    sub_10000261C(0, 0);
    endpoint = 0;
  }
  sub_100015E24((id *)&endpoint->super.isa, 0);
  sub_1000025EC((uint64_t)self, 0);
  v4.receiver = self;
  v4.super_class = (Class)RMDataStreamHandler;
  [(RMDataStreamHandler *)&v4 dealloc];
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  v14 = (RMConnectionEndpoint *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!self) {
    goto LABEL_8;
  }
  for (i = self->_endpoint; i != v14; i = 0)
  {
    id v12 = (id)sub_100016540();
LABEL_8:
    ;
  }
}

- (void)endpoint:(id)a3 didReceiveStreamingRequest:(id)a4 withData:(id)a5
{
  v8 = (RMConnectionEndpoint *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (self) {
    endpoint = self->_endpoint;
  }
  else {
    endpoint = 0;
  }
  if (endpoint != v8)
  {
    sub_100016664();
LABEL_41:
    dispatch_once(&qword_10002C9E0, &stru_100024EB0);
LABEL_6:
    id v42 = 0;
    v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:qword_10002C9D8 fromData:v11 error:&v42];
    id v14 = v42;
    id v15 = objc_alloc((Class)NSUUID);
    v16 = [v13 objectForKeyedSubscript:@"Identifier"];
    id v17 = [v15 initWithUUIDString:v16];

    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024F70);
    }
    v18 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Identifier: %@", buf, 0xCu);
    }
    v19 = [v13 objectForKeyedSubscript:@"Interval"];
    v41 = v17;
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024F70);
    }
    v20 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Interval: %@", buf, 0xCu);
    }
    if (self && self->_dataProviderStreaming)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024F70);
      }
      v21 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Received a new streaming request while the previous streaming is still active", buf, 2u);
      }
      [(RMDataStreamHandler *)self endpointShouldStopStreamingData:v8];
    }
    sub_10000260C((uint64_t)self, 0);
    if (self->_isInternal)
    {
      if ([v9 isEqualToString:@"kRMStartStreamingDummyData"])
      {
        id v40 = v14;
        v22 = -[RMDummyDataProviderConfiguration initWithUniqueIdentifier:updateInterval:]([RMDummyDataProviderConfiguration alloc], "initWithUniqueIdentifier:updateInterval:", v41, [v19 unsignedLongLongValue]);
        v23 = [RMDummyDataProvider alloc];
        sub_100015A04((uint64_t)v8);
        v24 = (RMAudioListenerPoseProviderConfiguration *)objc_claimAutoreleasedReturnValue();
        v25 = [(RMDummyDataProvider *)v23 initWithConfiguration:v22 receiverQueue:v24];
        sub_10000260C((uint64_t)self, v25);

LABEL_37:
        id v14 = v40;
        goto LABEL_38;
      }
      if ([v9 isEqualToString:@"kRMStartStreamingAudioListenerPose"])
      {
        id v40 = v14;
        v22 = [v13 objectForKeyedSubscript:@"TempestOptions"];
        v31 = [v13 objectForKeyedSubscript:@"ForceSessionRestart"];
        id v32 = [v31 BOOLValue];

        v24 = [[RMAudioListenerPoseProviderConfiguration alloc] initWithUniqueIdentifier:v41 tempestOptions:v22 forceSessionRestart:v32];
        v33 = [RMAudioListenerPoseProvider alloc];
        v34 = sub_100015A04((uint64_t)v8);
        v35 = [(RMAudioListenerPoseProvider *)v33 initWithConfiguration:v24 receiverQueue:v34];
        sub_10000260C((uint64_t)self, v35);

        goto LABEL_37;
      }
LABEL_38:

      goto LABEL_39;
    }
    if ([v9 isEqualToString:@"kRMStartStreamingHeadphoneMotion"])
    {
      id v40 = v14;
      v27 = [v13 objectForKeyedSubscript:@"lowLatency"];
      char v28 = [v27 BOOLValue];

      v29 = [RMHeadphoneMotionProvider alloc];
      sub_100015A04((uint64_t)v8);
      v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue();
      v30 = sub_10000B538((id *)&v29->super.isa, v22, v28);
    }
    else if ([v9 isEqualToString:@"kRMStartStreamingHeadphoneActivity"])
    {
      id v40 = v14;
      v36 = [RMHeadphoneActivityProvider alloc];
      sub_100015A04((uint64_t)v8);
      v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue();
      v30 = sub_1000071F4((id *)&v36->super.isa, v22);
    }
    else
    {
      if (![v9 isEqualToString:@"kRMStartStreamingHeadphoneStatus"]) {
        goto LABEL_38;
      }
      id v40 = v14;
      v37 = [v13 objectForKeyedSubscript:kCMHeadphoneRequireActivitySupport];
      id v38 = [v37 BOOLValue];

      v39 = [RMHeadphoneStatusProvider alloc];
      sub_100015A04((uint64_t)v8);
      v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue();
      v30 = [(RMHeadphoneStatusProvider *)v39 initWithReceiverQueue:v22 requireActivitySupport:v38];
    }
    v24 = (RMAudioListenerPoseProviderConfiguration *)v30;
    sub_10000260C((uint64_t)self, v30);
    goto LABEL_37;
  }
  if (v10)
  {
    if (qword_10002C9E0 == -1) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024F70);
  }
  v26 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Configuration message doesn't contain any data", buf, 2u);
  }
LABEL_39:
}

- (BOOL)endpoint:(id)a3 shouldStartStreamingDataToReceiver:(id)a4
{
  id v10 = (RMConnectionEndpoint *)a3;
  id v11 = a4;
  if (self) {
    endpoint = self->_endpoint;
  }
  else {
    endpoint = 0;
  }
  if (endpoint != v10)
  {
    sub_100016788();
LABEL_28:
    dispatch_once(&qword_10002C538, &stru_100024F70);
LABEL_12:
    v18 = v6[168];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      endpointName = self->_endpointName;
      *(_DWORD *)buf = 138543362;
      *(void *)(v5 + 4) = endpointName;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Data stream started on endpoint: %{public}@", buf, 0xCu);
    }
    BOOL v21 = !self->_isInternal;
    v22 = self->_endpointName;
    v41[0] = @"client";
    v41[1] = @"tracking";
    v42[0] = v22;
    v42[1] = &__kCFBooleanTrue;
    v41[2] = @"eventType";
    v23 = v22;
    v24 = +[NSNumber numberWithLong:v21];
    v42[2] = v24;
    v25 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];

    if (p_cache[167] != (void *)-1) {
      dispatch_once(&qword_10002C538, &stru_100024F70);
    }
    v26 = v6[168];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)(v5 + 4) = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sending PowerLog event: %{private}@", buf, 0xCu);
    }
    PLLogRegisteredEvent();
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000EA64;
    v37[3] = &unk_100024F00;
    id v38 = v10;
    v27 = v4;
    v39 = v27;
    id v28 = v11;
    id v40 = v28;
    v29 = +[RBSProcessMonitor monitorWithConfiguration:v37];
    sub_10000261C((uint64_t)self, v29);

    dataProvider = self->_dataProvider;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000EF3C;
    v35[3] = &unk_100024F28;
    id v36 = v28;
    v31 = [(RMDataProvider *)dataProvider startProducingDataWithCallback:v35];
    BOOL v32 = v31 == 0;
    if (!v31) {
      self->_dataProviderStreaming = 1;
    }

    goto LABEL_26;
  }
  if (self)
  {
    v13 = self->_dataProvider;
    if (v13)
    {
      objc_super v4 = v13;
      v5 = buf;
      id v14 = sub_100008DC8((id *)&v10->super.isa);
      objc_setProperty_nonatomic_copy(self, v15, v14, 24);

      p_cache = &OBJC_METACLASS___RMHeadphoneActivityProvider.cache;
      v6 = &OBJC_METACLASS___RMHeadphoneActivityProvider.cache;
      if (!self->_endpointName)
      {
        objc_setProperty_nonatomic_copy(self, v16, @"unknown", 24);
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100024F70);
        }
        id v17 = qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138477827;
          id v44 = v10;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Failed to determine the endpoint name for endpoint: %{private}@", buf, 0xCu);
        }
      }
      self->_startTime = sub_10000CF5C();
      if (qword_10002C538 == -1) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024F70);
  }
  v33 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Streaming can't start because no dataProvider has been initialized!", buf, 2u);
  }
  BOOL v32 = 0;
LABEL_26:

  return v32;
}

- (void)endpointShouldStopStreamingData:(id)a3
{
  v5 = (RMConnectionEndpoint *)a3;
  v6 = v5;
  if (self) {
    endpoint = self->_endpoint;
  }
  else {
    endpoint = 0;
  }
  if (endpoint == v5)
  {
    p_cache = &OBJC_METACLASS___RMHeadphoneActivityProvider.cache;
    if (qword_10002C538 == -1) {
      goto LABEL_5;
    }
  }
  else
  {
    sub_1000168AC();
  }
  dispatch_once(&qword_10002C538, &stru_100024F70);
LABEL_5:
  v8 = (void *)qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      endpointName = self->_endpointName;
    }
    else {
      endpointName = 0;
    }
    *(_DWORD *)buf = 138543362;
    BOOL v21 = endpointName;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Data stream stopped on endpoint: %{public}@", buf, 0xCu);
  }
  if (self)
  {
    BOOL v11 = !self->_isInternal;
    id v12 = self->_endpointName;
  }
  else
  {
    id v12 = 0;
    BOOL v11 = 1;
  }
  v18[0] = @"client";
  v18[1] = @"tracking";
  v19[0] = v12;
  v19[1] = &__kCFBooleanFalse;
  v18[2] = @"eventType";
  v13 = v12;
  id v14 = +[NSNumber numberWithLong:v11];
  v19[2] = v14;
  SEL v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  if (p_cache[167] != (void *)-1) {
    dispatch_once(&qword_10002C538, &stru_100024F70);
  }
  v16 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    BOOL v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending PowerLog event: %{private}@", buf, 0xCu);
  }
  PLLogRegisteredEvent();
  if (self && self->_isInternal || (AnalyticsSendEventLazy(), self))
  {
    [(RBSProcessMonitor *)self->_processMonitor invalidate];
    sub_10000261C((uint64_t)self, 0);
    dataProvider = self->_dataProvider;
  }
  else
  {
    [0 invalidate];
    sub_10000261C(0, 0);
    dataProvider = 0;
  }
  [(RMDataProvider *)dataProvider stopProducingData];
  if (self) {
    self->_dataProviderStreaming = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_endpointName, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end