@interface STMessageTrackingTransportService
+ (int64_t)_ledgerItemStateForSendMessageResult:(id)a3;
- (OS_dispatch_queue)queue;
- (STMessageTrackingTransport)transport;
- (STMessageTrackingTransportService)initWithTransport:(id)a3 returnAddressProvider:(id)a4 messageLedger:(id)a5 queue:(id)a6;
- (STTransportServiceDelegate)delegate;
- (STTransportServiceMessageLedger)messageLedger;
- (STTransportServiceReturnAddressProvider)returnAddressProvider;
- (id)sendMessage:(id)a3 toAddresses:(id)a4;
- (void)setDelegate:(id)a3;
- (void)stopTrackingMessageWithIdentifier:(id)a3;
- (void)transport:(id)a3 didDeliverMessageWithIdentifier:(id)a4 toMessageAddress:(id)a5;
- (void)transport:(id)a3 didReceiveMessage:(id)a4;
- (void)transport:(id)a3 didSendMessageWithIdentifier:(id)a4 result:(id)a5;
- (void)transport:(id)a3 willSendMessage:(id)a4 errorsByAddress:(id)a5;
@end

@implementation STMessageTrackingTransportService

- (STMessageTrackingTransportService)initWithTransport:(id)a3 returnAddressProvider:(id)a4 messageLedger:(id)a5 queue:(id)a6
{
  STTransportServiceReturnAddressProvider *returnAddressProvider;
  STTransportServiceReturnAddressProvider *v18;
  STTransportServiceMessageLedger *messageLedger;
  STTransportServiceMessageLedger *v20;
  OS_dispatch_queue *queue;
  objc_super v23;

  v10 = (STMessageTrackingTransport *)a3;
  v11 = (STTransportServiceReturnAddressProvider *)a4;
  v12 = (STTransportServiceMessageLedger *)a5;
  v13 = (OS_dispatch_queue *)a6;
  v23.receiver = self;
  v23.super_class = (Class)STMessageTrackingTransportService;
  v14 = [(STMessageTrackingTransportService *)&v23 init];
  transport = v14->_transport;
  v14->_transport = v10;
  v16 = v10;

  [(STMessageTrackingTransport *)v14->_transport setDelegate:v14];
  returnAddressProvider = v14->_returnAddressProvider;
  v14->_returnAddressProvider = v11;
  v18 = v11;

  messageLedger = v14->_messageLedger;
  v14->_messageLedger = v12;
  v20 = v12;

  queue = v14->_queue;
  v14->_queue = v13;

  return v14;
}

- (id)sendMessage:(id)a3 toAddresses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STMessageTrackingTransportService *)self messageLedger];
  v9 = +[STLog familyMessaging];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = (unint64_t)[v6 contentType] - 1;
    if (v10 > 4) {
      CFStringRef v11 = @"Unknown";
    }
    else {
      CFStringRef v11 = off_1002FCF30[v10];
    }
    v12 = [v6 identifier];
    *(_DWORD *)buf = 136446979;
    v41 = "-[STMessageTrackingTransportService sendMessage:toAddresses:]";
    __int16 v42 = 2114;
    CFStringRef v43 = v11;
    __int16 v44 = 2114;
    v45 = v12;
    __int16 v46 = 2113;
    id v47 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nSending message \nmessage.contentType: %{public}@ \nmessage.identifier: %{public}@ \nmessage ledger: %{private}@", buf, 0x2Au);
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10004C8E4;
  v37[3] = &unk_1002FCE10;
  id v13 = v8;
  id v38 = v13;
  v14 = (__CFString *)v6;
  v39 = v14;
  v15 = objc_retainBlock(v37);
  v16 = [(__CFString *)v14 identifier];
  v17 = [v13 fetchItemWithMessageIdentifier:v16];

  if (v17)
  {
    v18 = [v17 itemWithUpdatedStatusUsingBlock:&stru_1002FCE30];
  }
  else
  {
    v18 = [[STTransportServiceMessageLedgerItem alloc] initWithMessage:v14 addresses:v7];
  }
  v19 = [(__CFString *)v14 identifier];
  [v13 setItem:v18 forMessageIdentifier:v19];

  v20 = [(STMessageTrackingTransportService *)self returnAddressProvider];
  v21 = [v20 returnAddress];

  v22 = +[STLog familyMessaging];
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(__CFString *)v14 identifier];
      *(_DWORD *)buf = 136447235;
      v41 = "-[STMessageTrackingTransportService sendMessage:toAddresses:]";
      __int16 v42 = 2113;
      CFStringRef v43 = v14;
      __int16 v44 = 2114;
      v45 = v24;
      __int16 v46 = 2113;
      id v47 = v7;
      __int16 v48 = 2113;
      v49 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nSending message: %{private}@ withIdentifier: %{public}@ \n toAddress: %{private}@: fromAddress: %{private}@:", buf, 0x34u);
    }
    id v25 = [(STMessageTrackingTransportService *)self transport];
    v26 = [v25 sendMessage:v14 toAddresses:v7 fromAddress:v21];
    v27 = [v26 catch];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10004CA4C;
    v32[3] = &unk_1002FCE58;
    v33 = v14;
    v36 = v15;
    v34 = v18;
    id v35 = v7;
    ((void (**)(void, void *))v27)[2](v27, v32);
    v28 = (STPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100261A28(v23);
    }

    ((void (*)(void *, STTransportServiceMessageLedgerItem *, id))v15[2])(v15, v18, v7);
    id v29 = objc_alloc((Class)NSError);
    id v25 = [v29 initWithDomain:STErrorDomain code:27 userInfo:0];
    v30 = [STPromise alloc];
    v26 = +[STResult failure:v25];
    v27 = [(STMessageTrackingTransportService *)self queue];
    v28 = [(STPromise *)v30 initWithResolution:v26 onQueue:v27];
  }

  return v28;
}

- (void)transport:(id)a3 willSendMessage:(id)a4 errorsByAddress:(id)a5
{
  id v7 = a5;
  v8 = [a4 identifier];
  v9 = [(STMessageTrackingTransportService *)self messageLedger];
  uint64_t v10 = [v9 fetchItemWithMessageIdentifier:v8];
  if (v10)
  {
    CFStringRef v11 = (void *)v10;
    v12 = objc_opt_new();
    id v13 = [v11 statusesByAddress];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004CC88;
    v19[3] = &unk_1002FCE80;
    id v20 = v7;
    id v14 = v8;
    id v21 = v14;
    id v22 = v12;
    id v15 = v12;
    [v13 enumerateKeysAndObjectsUsingBlock:v19];

    v16 = [STTransportServiceMessageLedgerItem alloc];
    v17 = [v11 message];
    v18 = [(STTransportServiceMessageLedgerItem *)v16 initWithMessage:v17 statusesByAddress:v15];

    [v9 setItem:v18 forMessageIdentifier:v14];
  }
  else
  {
    v18 = +[STLog familyMessaging];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100261B3C();
    }
  }
}

- (void)transport:(id)a3 didSendMessageWithIdentifier:(id)a4 result:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004D03C;
  v20[3] = &unk_1002FCEA8;
  id v21 = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004D100;
  v18[3] = &unk_1002FC888;
  id v9 = v21;
  id v19 = v9;
  [v8 evaluateWithSuccess:v20 failure:v18];
  uint64_t v10 = [(STMessageTrackingTransportService *)self messageLedger];
  uint64_t v11 = +[STMessageTrackingTransportService _ledgerItemStateForSendMessageResult:v8];
  v12 = [v10 fetchItemWithMessageIdentifier:v9];
  if (v12)
  {
    id v13 = v12;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004D16C;
    v17[3] = &unk_1002FCEC8;
    v17[4] = v11;
    id v14 = [v12 itemWithUpdatedStatusUsingBlock:v17];

    [v10 setItem:v14 forMessageIdentifier:v9];
    id v15 = [(STMessageTrackingTransportService *)self delegate];
    [v15 transportService:self didSendMessageWithIdentifier:v9 result:v8];

    [v10 removeItemWithMessageIdentifier:v9];
    v16 = [(STMessageTrackingTransportService *)self transport];
    [v16 stopTrackingMessageWithIdentifier:v9];
  }
  else
  {
    id v14 = +[STLog familyMessaging];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100261C40(v11, (uint64_t)v9, v14);
    }
  }
}

+ (int64_t)_ledgerItemStateForSendMessageResult:(id)a3
{
  if ([a3 type]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (void)transport:(id)a3 didDeliverMessageWithIdentifier:(id)a4 toMessageAddress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[STLog familyMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446723;
    id v29 = "-[STMessageTrackingTransportService transport:didDeliverMessageWithIdentifier:toMessageAddress:]";
    __int16 v30 = 2114;
    id v31 = v9;
    __int16 v32 = 2113;
    id v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: Did deliver message identifier: %{public}@ - to address: %{private}@", buf, 0x20u);
  }

  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_10004D4F4;
  id v25 = &unk_1002FCEF0;
  id v12 = v8;
  id v26 = v12;
  v27 = self;
  id v13 = objc_retainBlock(&v22);
  id v14 = [(STMessageTrackingTransportService *)self messageLedger];
  uint64_t v15 = [v14 fetchItemWithMessageIdentifier:v9];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = +[NSSet setWithObject:v10];
    v18 = [v16 itemWithUpdatedStatusForAddresses:v17 usingBlock:&stru_1002FCF10];

    id v19 = +[STLog familyMessaging];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v29 = "-[STMessageTrackingTransportService transport:didDeliverMessageWithIdentifier:toMessageAddress:]";
      __int16 v30 = 2114;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: Did fully deliver message identifier: %{public}@", buf, 0x16u);
    }

    id v20 = +[STLog familyMessaging];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v29 = "-[STMessageTrackingTransportService transport:didDeliverMessageWithIdentifier:toMessageAddress:]";
      __int16 v30 = 2114;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: Did fully deliver message identifier: %{public}@", buf, 0x16u);
    }

    [v14 removeItemWithMessageIdentifier:v9];
    ((void (*)(void ***, id))v13[2])(v13, v9);
  }
  else
  {
    id v21 = +[STLog familyMessaging];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100261D60();
    }

    ((void (*)(void ***, id))v13[2])(v13, v9);
  }
}

- (void)stopTrackingMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[STLog familyMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[STMessageTrackingTransportService stopTrackingMessageWithIdentifier:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: Stop tracking message with identifier: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(STMessageTrackingTransportService *)self transport];
  [v6 stopTrackingMessageWithIdentifier:v4];
}

- (void)transport:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v6 = +[STLog familyMessaging];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 message];
    id v8 = [v7 identifier];
    int v16 = 136446466;
    v17 = "-[STMessageTrackingTransportService transport:didReceiveMessage:]";
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: Did receive message identifier: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  __int16 v9 = [(STMessageTrackingTransportService *)self delegate];
  [v9 transportService:self didReceiveMessage:v5];

  id v10 = [(STMessageTrackingTransportService *)self messageLedger];
  uint64_t v11 = [v5 message];
  id v12 = [v11 identifier];
  [v10 removeItemWithMessageIdentifier:v12];

  id v13 = [(STMessageTrackingTransportService *)self transport];
  id v14 = [v5 message];
  uint64_t v15 = [v14 identifier];
  [v13 stopTrackingMessageWithIdentifier:v15];
}

- (STTransportServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STTransportServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STMessageTrackingTransport)transport
{
  return (STMessageTrackingTransport *)objc_getProperty(self, a2, 16, 1);
}

- (STTransportServiceReturnAddressProvider)returnAddressProvider
{
  return (STTransportServiceReturnAddressProvider *)objc_getProperty(self, a2, 24, 1);
}

- (STTransportServiceMessageLedger)messageLedger
{
  return (STTransportServiceMessageLedger *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageLedger, 0);
  objc_storeStrong((id *)&self->_returnAddressProvider, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end