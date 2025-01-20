@interface MRDGroupSessionPushMessenger
- (IDSFirewall)firewall;
- (IDSService)service;
- (MRDGroupSessionPushMessenger)initWithService:(id)a3 handle:(id)a4 queue:(id)a5 messageHandler:(id)a6 errorHandler:(id)a7;
- (NSArray)allowedDestinations;
- (NSString)handle;
- (OS_dispatch_queue)queue;
- (id)errorHandler;
- (id)messageHandler;
- (void)_updateAllowedDestinations:(id)a3;
- (void)sendMessage:(id)a3 toDestinations:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setAllowedDestinations:(id)a3;
- (void)setFirewall:(id)a3;
- (void)updateAllowedDestinations:(id)a3;
@end

@implementation MRDGroupSessionPushMessenger

- (MRDGroupSessionPushMessenger)initWithService:(id)a3 handle:(id)a4 queue:(id)a5 messageHandler:(id)a6 errorHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MRDGroupSessionPushMessenger;
  v18 = [(MRDGroupSessionPushMessenger *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_service, a3);
    objc_storeStrong((id *)&v19->_handle, a4);
    objc_storeStrong((id *)&v19->_queue, a5);
    id v20 = objc_retainBlock(v16);
    id messageHandler = v19->_messageHandler;
    v19->_id messageHandler = v20;

    id v22 = objc_retainBlock(v17);
    id errorHandler = v19->_errorHandler;
    v19->_id errorHandler = v22;

    id v24 = objc_alloc_init((Class)IDSServiceDelegateProperties);
    [v24 setWantsCrossAccountMessaging:1];
    [v13 addDelegate:v19 withDelegateProperties:v24 queue:v15];
    v25 = +[MRUserSettings currentSettings];
    unsigned int v26 = [v25 supportGroupSessionOfframp];

    if (v26)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100149A04;
      v28[3] = &unk_10041E680;
      v29 = v19;
      [v13 retrieveFirewallWithQueue:v15 completion:v28];
    }
  }

  return v19;
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MRDGroupSessionPushMessenger *)self service];
  uint64_t v25 = IDSSendMessageOptionFromIDKey;
  v9 = [(MRDGroupSessionPushMessenger *)self handle];
  unsigned int v26 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v15 = 0;
  id v16 = 0;
  [v8 sendMessage:v6 toDestinations:v7 priority:300 options:v10 identifier:&v16 error:&v15];
  id v11 = v16;
  id v12 = v15;

  id v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[MRDGroupSessionPushMessenger] Sent push message: %@ with identifier: %@, to: %@. Error: %@", buf, 0x2Au);
  }

  if (v12)
  {
    id v14 = [(MRDGroupSessionPushMessenger *)self errorHandler];
    ((void (**)(void, id))v14)[2](v14, v12);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[MRDGroupSessionPushMessenger] Receive push message: %@ with context: %@, from: %@", (uint8_t *)&v15, 0x20u);
  }

  id v14 = [(MRDGroupSessionPushMessenger *)self messageHandler];
  ((void (**)(void, id, id))v14)[2](v14, v11, v10);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  int v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v17 = 138413058;
    id v18 = v12;
    __int16 v19 = 1024;
    BOOL v20 = v10;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[MRDGroupSessionPushMessenger] Sending of: %@ success: %{BOOL}u, error: %@, context: %@", (uint8_t *)&v17, 0x26u);
  }

  if (v13)
  {
    id v16 = [(MRDGroupSessionPushMessenger *)self errorHandler];
    ((void (**)(void, id))v16)[2](v16, v13);
  }
}

- (void)updateAllowedDestinations:(id)a3
{
  id v4 = a3;
  v5 = [(MRDGroupSessionPushMessenger *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100149F84;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateAllowedDestinations:(id)a3
{
  id v4 = a3;
  v5 = [(MRDGroupSessionPushMessenger *)self queue];
  dispatch_assert_queue_V2(v5);

  [(MRDGroupSessionPushMessenger *)self setAllowedDestinations:v4];
  id v6 = [(MRDGroupSessionPushMessenger *)self firewall];

  if (v6)
  {
    id v7 = objc_msgSend(v4, "msv_compactMap:", &stru_10041E6C0);
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[MRDGroupSessionPushMessenger] Update firewall entries: %{public}@", buf, 0xCu);
    }

    v9 = [(MRDGroupSessionPushMessenger *)self firewall];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10014A18C;
    v10[3] = &unk_100415F80;
    v10[4] = self;
    [v9 replaceDonatedEntriesWithEntries:v7 withCompletion:v10];
  }
}

- (IDSService)service
{
  return self->_service;
}

- (NSString)handle
{
  return self->_handle;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (IDSFirewall)firewall
{
  return self->_firewall;
}

- (void)setFirewall:(id)a3
{
}

- (NSArray)allowedDestinations
{
  return self->_allowedDestinations;
}

- (void)setAllowedDestinations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedDestinations, 0);
  objc_storeStrong((id *)&self->_firewall, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end