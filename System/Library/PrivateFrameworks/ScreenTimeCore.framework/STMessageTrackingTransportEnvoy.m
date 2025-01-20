@interface STMessageTrackingTransportEnvoy
+ (id)_retryIntervalForNumberOfAttempts:(int64_t)a3;
- (OS_dispatch_queue)queue;
- (STMessageTrackingTransportEnvoy)initWithTransportService:(id)a3 messageLedger:(id)a4 queue:(id)a5;
- (STTransportEnvoyDelegate)delegate;
- (STTransportService)transportService;
- (STTransportServiceMessageLedger)messageLedger;
- (id)intervalUntilNextRetryAttempt;
- (id)retryFailedMessages;
- (id)sendMessageEnvelope:(id)a3;
- (int64_t)failMessagesStuckInSentState;
- (int64_t)purgeExpiredMessages;
- (void)setDelegate:(id)a3;
- (void)transportService:(id)a3 didReceiveMessage:(id)a4;
- (void)transportService:(id)a3 didSendMessageWithIdentifier:(id)a4 result:(id)a5;
@end

@implementation STMessageTrackingTransportEnvoy

- (STMessageTrackingTransportEnvoy)initWithTransportService:(id)a3 messageLedger:(id)a4 queue:(id)a5
{
  v8 = (STTransportService *)a3;
  v9 = (STTransportServiceMessageLedger *)a4;
  v10 = (OS_dispatch_queue *)a5;
  v18.receiver = self;
  v18.super_class = (Class)STMessageTrackingTransportEnvoy;
  v11 = [(STMessageTrackingTransportEnvoy *)&v18 init];
  transportService = v11->_transportService;
  v11->_transportService = v8;
  v13 = v8;

  [(STTransportService *)v11->_transportService setDelegate:v11];
  messageLedger = v11->_messageLedger;
  v11->_messageLedger = v9;
  v15 = v9;

  queue = v11->_queue;
  v11->_queue = v10;

  return v11;
}

- (id)sendMessageEnvelope:(id)a3
{
  id v4 = a3;
  v5 = [v4 message];
  v6 = [v4 addresses];

  v7 = +[STLog familyMessaging];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v14 = v5;
    __int16 v15 = 2082;
    v16 = "-[STMessageTrackingTransportEnvoy sendMessageEnvelope:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v2]       >>> message: %{private}@, %{public}s", buf, 0x16u);
  }

  v8 = [(STMessageTrackingTransportEnvoy *)self transportService];
  v9 = [v8 sendMessage:v5 toAddresses:v6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004AD58;
  v12[3] = &unk_1002FCC78;
  v12[4] = self;
  v10 = [v9 then:v12];

  return v10;
}

- (id)retryFailedMessages
{
  v2 = +[STLog familyMessaging];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[STMessageTrackingTransportEnvoy retryFailedMessages]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", (uint8_t *)&buf, 0xCu);
  }

  v3 = [(STMessageTrackingTransportEnvoy *)self messageLedger];
  id v4 = objc_opt_new();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10004B3C4;
  v36[3] = &unk_1002FCCA0;
  p_long long buf = &buf;
  id v5 = v4;
  id v37 = v5;
  [v3 enumerateItemsWithState:3 usingBlock:v36];
  v29 = v5;
  id v6 = [v5 count];
  if (v6)
  {
    v7 = +[STLog messageTrackingTransportEnvoy];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 136446466;
      v40 = "-[STMessageTrackingTransportEnvoy retryFailedMessages]";
      __int16 v41 = 2050;
      id v42 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nRetrying to send %{public}lu messages", v39, 0x16u);
    }

    v8 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v29;
    id v9 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v13 = [v3 addressesFromItem:v12 inState:3];
          v14 = [v12 message];
          __int16 v15 = +[STLog familyMessaging];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v14 identifier];
            id v17 = [v13 count];
            *(_DWORD *)v39 = 136446723;
            v40 = "-[STMessageTrackingTransportEnvoy retryFailedMessages]";
            __int16 v41 = 2113;
            id v42 = v16;
            __int16 v43 = 2050;
            id v44 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nRetrying message: %{private}@ to %{public}lu addresses", v39, 0x20u);
          }
          objc_super v18 = [v12 itemWithUpdatedStatusForAddresses:v13 usingBlock:&stru_1002FCCE0];
          v19 = [v14 identifier];
          [v3 setItem:v18 forMessageIdentifier:v19];

          v20 = [(STMessageTrackingTransportEnvoy *)self transportService];
          v21 = [v20 sendMessage:v14 toAddresses:v13];

          [v8 addObject:v21];
        }
        id v9 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v9);
    }

    v22 = [(STMessageTrackingTransportEnvoy *)self queue];
    v23 = +[STPromise onQueue:v22 all:v8];
    v24 = [v23 then];
    ((void (**)(void, Block_layout *))v24)[2](v24, &stru_1002FCD20);
    v25 = (STPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = +[STLog familyMessaging];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 136446210;
      v40 = "-[STMessageTrackingTransportEnvoy retryFailedMessages]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nNo messages to retry sending", v39, 0xCu);
    }

    v27 = [STPromise alloc];
    v8 = +[STResult success];
    v22 = [(STMessageTrackingTransportEnvoy *)self queue];
    v25 = [(STPromise *)v27 initWithResolution:v8 onQueue:v22];
  }

  _Block_object_dispose(&buf, 8);
  return v25;
}

- (id)intervalUntilNextRetryAttempt
{
  v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[STMessageTrackingTransportEnvoy intervalUntilNextRetryAttempt]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  v11 = sub_10004B724;
  v12 = sub_10004B734;
  id v13 = 0;
  id v4 = [(STMessageTrackingTransportEnvoy *)self messageLedger];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004B73C;
  v8[3] = &unk_1002FCD48;
  v8[4] = &buf;
  [v4 enumerateItemsWithState:3 usingBlock:v8];

  id v5 = *(void **)(*((void *)&buf + 1) + 40);
  if (v5)
  {
    id v6 = +[STMessageTrackingTransportEnvoy _retryIntervalForNumberOfAttempts:](STMessageTrackingTransportEnvoy, "_retryIntervalForNumberOfAttempts:", [v5 integerValue]);
  }
  else
  {
    id v6 = 0;
  }
  _Block_object_dispose(&buf, 8);

  return v6;
}

+ (id)_retryIntervalForNumberOfAttempts:(int64_t)a3
{
  id v4 = +[STLog familyMessaging];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    v7 = "+[STMessageTrackingTransportEnvoy _retryIntervalForNumberOfAttempts:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", (uint8_t *)&v6, 0xCu);
  }

  if ((unint64_t)a3 > 5) {
    return &off_10030FEC8;
  }
  else {
    return (id)qword_1002FCDB0[a3];
  }
}

- (int64_t)purgeExpiredMessages
{
  v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    v24 = "-[STMessageTrackingTransportEnvoy purgeExpiredMessages]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", buf, 0xCu);
  }

  id v4 = [(STMessageTrackingTransportEnvoy *)self messageLedger];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004BC14;
  v21[3] = &unk_1002FCD70;
  id v5 = (id)objc_opt_new();
  id v22 = v5;
  [v4 enumerateItemsUsingBlock:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "removeItemWithMessageIdentifier:", v12, (void)v17);
        v14 = [(STMessageTrackingTransportEnvoy *)self transportService];
        [v14 stopTrackingMessageWithIdentifier:v12];
      }
      v9 += (int64_t)v8;
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  __int16 v15 = +[STLog familyMessaging];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446466;
    v24 = "-[STMessageTrackingTransportEnvoy purgeExpiredMessages]";
    __int16 v25 = 2050;
    int64_t v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nPurged %{public}ld expired messages", buf, 0x16u);
  }

  return v9;
}

- (int64_t)failMessagesStuckInSentState
{
  v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    __int16 v25 = "-[STMessageTrackingTransportEnvoy failMessagesStuckInSentState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", buf, 0xCu);
  }

  id v4 = [(STMessageTrackingTransportEnvoy *)self messageLedger];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004BF54;
  v22[3] = &unk_1002FCD70;
  id v5 = (id)objc_opt_new();
  id v23 = v5;
  [v4 enumerateItemsWithState:2 usingBlock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "itemWithUpdatedStatusUsingBlock:", &stru_1002FCD90, (void)v18);
        v14 = [v12 message];
        __int16 v15 = [v14 identifier];
        [v4 setItem:v13 forMessageIdentifier:v15];
      }
      v9 += (int64_t)v8;
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  v16 = +[STLog familyMessaging];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446466;
    __int16 v25 = "-[STMessageTrackingTransportEnvoy failMessagesStuckInSentState]";
    __int16 v26 = 2050;
    int64_t v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nFailed %{public}ld stuck messages", buf, 0x16u);
  }

  return v9;
}

- (void)transportService:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v6 = +[STLog familyMessaging];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 message];
    id v8 = [v7 identifier];
    int v10 = 136446467;
    v11 = "-[STMessageTrackingTransportEnvoy transportService:didReceiveMessage:]";
    __int16 v12 = 2113;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nDid receive message: %{private}@", (uint8_t *)&v10, 0x16u);
  }
  int64_t v9 = [(STMessageTrackingTransportEnvoy *)self delegate];
  [v9 transportEnvoy:self didReceiveMessage:v5];
}

- (void)transportService:(id)a3 didSendMessageWithIdentifier:(id)a4 result:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  int64_t v9 = +[STLog familyMessaging];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446210;
    __int16 v12 = "-[STMessageTrackingTransportEnvoy transportService:didSendMessageWithIdentifier:result:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s", (uint8_t *)&v11, 0xCu);
  }

  int v10 = [(STMessageTrackingTransportEnvoy *)self delegate];
  [v10 transportEnvoy:self didSendMessageWithIdentifier:v8 result:v7];
}

- (STTransportEnvoyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STTransportEnvoyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STTransportService)transportService
{
  return (STTransportService *)objc_getProperty(self, a2, 16, 1);
}

- (STTransportServiceMessageLedger)messageLedger
{
  return (STTransportServiceMessageLedger *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageLedger, 0);
  objc_storeStrong((id *)&self->_transportService, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end