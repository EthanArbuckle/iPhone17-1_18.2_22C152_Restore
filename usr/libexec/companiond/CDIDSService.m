@interface CDIDSService
- (CDIDSService)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)messageReceivedHandler;
- (void)_activated;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)sendMessage:(int64_t)a3 toUsernames:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDispatchQueue:(id)a3;
- (void)setMessageReceivedHandler:(id)a3;
@end

@implementation CDIDSService

- (CDIDSService)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDIDSService;
  v2 = [(CDIDSService *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B698;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B720;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.companion.auth"];
  idsService = self->_idsService;
  self->_idsService = v3;

  [(IDSService *)self->_idsService addDelegate:self queue:self->_dispatchQueue];
  objc_super v5 = sub_10001B7CC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS service activated.", v6, 2u);
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    idsService = self->_idsService;
    self->_idsService = 0;

    id messageReceivedHandler = self->_messageReceivedHandler;
    self->_id messageReceivedHandler = 0;

    self->_invalidateDone = 1;
    objc_super v5 = sub_10001B7CC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDS service invalidated.", v6, 2u);
    }
  }
}

- (void)sendMessage:(int64_t)a3 toUsernames:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B964;
  block[3] = &unk_100035140;
  v11 = self;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = sub_10001B7CC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS incomingMessage: account=%@, incomingMessage=%@, fromID=%@", (uint8_t *)&v18, 0x20u);
  }

  v14 = NSDictionaryGetNSNumber();
  id v15 = [v14 copy];
  id v16 = [v15 integerValue];

  id messageReceivedHandler = (void (**)(id, id))self->_messageReceivedHandler;
  if (messageReceivedHandler) {
    messageReceivedHandler[2](messageReceivedHandler, v16);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = sub_10001B7CC();
  id v15 = v14;
  if (v9)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138413058;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 1024;
      int v21 = 1;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "IDS didSendWithSuccess: account=%@, identifier=%@, success=%d, error=%@", (uint8_t *)&v16, 0x26u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138413058;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 1024;
    int v21 = 0;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "IDS failed to send: account=%@, identifier=%@, success=%d, error=%@", (uint8_t *)&v16, 0x26u);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)messageReceivedHandler
{
  return self->_messageReceivedHandler;
}

- (void)setMessageReceivedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end