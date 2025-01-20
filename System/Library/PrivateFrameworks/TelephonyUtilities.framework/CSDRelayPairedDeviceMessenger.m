@interface CSDRelayPairedDeviceMessenger
- (CSDRelayPairedDeviceMessenger)initWithQueue:(id)a3;
- (NSMutableSet)identifiersWaitingForAcknowledgement;
- (OS_dispatch_queue)queue;
- (id)_sendMessageOptionsWithTimeout:(double)a3 wantsAcknowledgement:(BOOL)a4;
- (void)_retryReliableMessageWithIdentifierIfNecessary:(id)a3 message:(id)a4 timeout:(double)a5 maximumRetryAttempts:(unint64_t)a6;
- (void)dealloc;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(id)a3 timeout:(double)a4 wantsAcknowledgement:(BOOL)a5 maximumRetryAttempts:(unint64_t)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 wantsAcknowledgement:(BOOL)a4 completionHandler:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setIdentifiersWaitingForAcknowledgement:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSDRelayPairedDeviceMessenger

- (CSDRelayPairedDeviceMessenger)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSDRelayPairedDeviceMessenger;
  v6 = [(CSDRelayPairedDeviceMessenger *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = +[NSMutableSet set];
    identifiersWaitingForAcknowledgement = v7->_identifiersWaitingForAcknowledgement;
    v7->_identifiersWaitingForAcknowledgement = (NSMutableSet *)v8;

    v10 = +[CSDRelayIDSService sharedInstance];
    [v10 addServiceDelegate:v7 queue:v7->_queue];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[CSDRelayIDSService sharedInstance];
  [v3 removeServiceDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRelayPairedDeviceMessenger;
  [(CSDRelayPairedDeviceMessenger *)&v4 dealloc];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  uint64_t v8 = [(CSDRelayPairedDeviceMessenger *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BCED0;
  v10[3] = &unk_100504F10;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = [(CSDRelayPairedDeviceMessenger *)self queue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000BD108;
  v18[3] = &unk_100506C18;
  BOOL v22 = a6;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  dispatch_async(v14, v18);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = (CSDMessagingRelayMessage *)a6;
  id v10 = a5;
  id v11 = +[IDSDestination destinationWithURI:v9];
  id v12 = +[CSDRelayIDSService sharedInstance];
  id v13 = [v12 deviceForFromID:v9];

  v14 = [[CSDMessagingRelayMessage alloc] initWithData:v10];
  if (v13)
  {
    unsigned int v15 = [v13 isDefaultPairedDevice];
    id v16 = sub_100008DCC();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        v18 = [(CSDMessagingRelayMessage *)v14 typeString];
        *(_DWORD *)buf = 138413058;
        v29 = v18;
        __int16 v30 = 2112;
        v31 = v11;
        __int16 v32 = 2112;
        v33 = v13;
        __int16 v34 = 2112;
        v35 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Incoming message of type %@ from destination %@ device %@: %@", buf, 0x2Au);
      }
      id v19 = +[TUCallCenter sharedInstance];
      id v20 = [v19 queue];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000BD4EC;
      v24[3] = &unk_1005053D0;
      v24[4] = self;
      v25 = v14;
      id v26 = v11;
      id v27 = v13;
      dispatch_async(v20, v24);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412546;
        v29 = v14;
        __int16 v30 = 2112;
        v31 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Received message %@ from device %@ but it is not the default paired device", buf, 0x16u);
      }
    }
  }
  else
  {
    id v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = +[CSDRelayIDSService sharedInstance];
      v23 = [v22 devices];
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] No device found for fromID %@. All devices: %@", buf, 0x16u);
    }
  }
}

- (id)_sendMessageOptionsWithTimeout:(double)a3 wantsAcknowledgement:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = +[NSMutableDictionary dictionaryWithCapacity:3];
  id v7 = +[NSNumber numberWithDouble:a3];
  [v6 setObject:v7 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  uint64_t v8 = IDSSendMessageOptionForceLocalDeliveryKey;
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionForceLocalDeliveryKey];
  id v9 = +[NSNumber numberWithBool:v4];
  [v6 setObject:v9 forKeyedSubscript:IDSSendMessageOptionWantsClientAcknowledgementKey];

  if (+[IDSDevice pairedDeviceUniqueIDOverrideExists])
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Removing IDSSendMessageOptionForceLocalDeliveryKey key from sendMessage options because pairedDeviceUniqueIDOverride exists", v13, 2u);
    }

    [v6 removeObjectForKey:v8];
  }
  id v11 = [v6 copy];

  return v11;
}

- (void)_retryReliableMessageWithIdentifierIfNecessary:(id)a3 message:(id)a4 timeout:(double)a5 maximumRetryAttempts:(unint64_t)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = [(CSDRelayPairedDeviceMessenger *)self queue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(CSDRelayPairedDeviceMessenger *)self identifiersWaitingForAcknowledgement];
  unsigned __int8 v14 = [v13 containsObject:v10];

  if (v14)
  {
    unsigned int v15 = [(CSDRelayPairedDeviceMessenger *)self identifiersWaitingForAcknowledgement];
    [v15 removeObject:v10];

    id v16 = sub_100008DCC();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (a6)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        BOOL v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Retrying message send with identifier: %@", buf, 0xCu);
      }

      [(CSDRelayPairedDeviceMessenger *)self sendMessage:v11 timeout:1 wantsAcknowledgement:a6 - 1 maximumRetryAttempts:0 completionHandler:a5];
    }
    else
    {
      if (v17)
      {
        id v19 = [v11 type];
        if (v19 >= 0x39)
        {
          id v20 = +[NSString stringWithFormat:@"(unknown: %i)", v19];
        }
        else
        {
          id v20 = off_100506C88[(int)v19];
        }
        *(_DWORD *)buf = 138412546;
        BOOL v22 = v20;
        __int16 v23 = 2112;
        v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Not attempting retry since we are out of retry attempts for %@ message with identifier: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not attempting retry since message is no longer waiting for acknowledgement: %@", buf, 0xCu);
    }
  }
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)sendMessage:(id)a3 wantsAcknowledgement:(BOOL)a4 completionHandler:(id)a5
{
  double v5 = 15.0;
  if (a4) {
    double v5 = 30.0;
  }
  -[CSDRelayPairedDeviceMessenger sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:](self, "sendMessage:timeout:wantsAcknowledgement:maximumRetryAttempts:completionHandler:", a3, v5);
}

- (void)sendMessage:(id)a3 timeout:(double)a4 wantsAcknowledgement:(BOOL)a5 maximumRetryAttempts:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  unsigned __int8 v14 = [(CSDRelayPairedDeviceMessenger *)self queue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BDA2C;
  v17[3] = &unk_100506C68;
  double v20 = a4;
  BOOL v22 = a5;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  unint64_t v21 = a6;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(v14, v17);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)identifiersWaitingForAcknowledgement
{
  return self->_identifiersWaitingForAcknowledgement;
}

- (void)setIdentifiersWaitingForAcknowledgement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersWaitingForAcknowledgement, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end