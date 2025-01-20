@interface MSDRapportPairingHandler
- (MSDRapportDevice)device;
- (MSDRapportPairingHandler)initWithDevice:(id)a3 andCompletion:(id)a4;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)rpClient;
- (id)completionHandler;
- (id)description;
- (int64_t)retryLeft;
- (void)_activate;
- (void)_fetchPairingSecretFromServer;
- (void)_handleKVStoreResponse:(id)a3;
- (void)_handlePasswordPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_hanldeAuthCompletionWithError:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setDevice:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetryLeft:(int64_t)a3;
- (void)setRpClient:(id)a3;
@end

@implementation MSDRapportPairingHandler

- (MSDRapportPairingHandler)initWithDevice:(id)a3 andCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MSDRapportPairingHandler;
  v8 = [(MSDRapportPairingHandler *)&v33 init];
  v9 = v8;
  if (v8)
  {
    [(MSDRapportPairingHandler *)v8 setCompletionHandler:v7];
    [(MSDRapportPairingHandler *)v9 setDevice:v6];
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MobileStoreDemo.RapportPairingHandler", 0);
    [(MSDRapportPairingHandler *)v9 setQueue:v10];

    [(MSDRapportPairingHandler *)v9 setRetryLeft:1];
    objc_initWeak(&location, v9);
    id v11 = objc_alloc_init((Class)RPCompanionLinkClient);
    [(MSDRapportPairingHandler *)v9 setRpClient:v11];

    v12 = [(MSDRapportPairingHandler *)v9 queue];
    v13 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v13 setDispatchQueue:v12];

    v14 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v14 setControlFlags:1030];

    v15 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v15 setFlags:1];

    v16 = [v6 rpDevice];
    v17 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v17 setDestinationDevice:v16];

    v18 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v18 setPasswordType:2];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100022DD8;
    v30[3] = &unk_100151AC8;
    objc_copyWeak(&v31, &location);
    v19 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v19 setInterruptionHandler:v30];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100022E64;
    v28[3] = &unk_100151AC8;
    objc_copyWeak(&v29, &location);
    v20 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v20 setInvalidationHandler:v28];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100022EF0;
    v26[3] = &unk_100151FF0;
    objc_copyWeak(&v27, &location);
    v21 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v21 setAuthCompletionHandler:v26];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100022F4C;
    v24[3] = &unk_100152018;
    objc_copyWeak(&v25, &location);
    v22 = [(MSDRapportPairingHandler *)v9 rpClient];
    [v22 setPromptForPasswordHandler:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSDRapportPairingHandler *)self device];
    *(_DWORD *)buf = 138543618;
    dispatch_queue_t v10 = self;
    __int16 v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Deallocating handler for device: %{public}@!", buf, 0x16u);
  }
  v5 = [(MSDRapportPairingHandler *)self rpClient];

  if (v5)
  {
    id v6 = [(MSDRapportPairingHandler *)self rpClient];
    [v6 setInvalidationHandler:0];

    id v7 = [(MSDRapportPairingHandler *)self rpClient];
    [v7 invalidate];

    [(MSDRapportPairingHandler *)self setRpClient:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)MSDRapportPairingHandler;
  [(MSDRapportPairingHandler *)&v8 dealloc];
}

- (void)activate
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSDRapportPairingHandler *)self device];
    *(_DWORD *)buf = 138543618;
    v9 = self;
    __int16 v10 = 2114;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating handler for device: %{public}@!", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v5 = [(MSDRapportPairingHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002325C;
  block[3] = &unk_100151AC8;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_activate
{
  v3 = [(MSDRapportPairingHandler *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  v4 = [(MSDRapportPairingHandler *)self rpClient];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002338C;
  v5[3] = &unk_100151FF0;
  objc_copyWeak(&v6, &location);
  [v4 activateWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_hanldeAuthCompletionWithError:(id)a3
{
  id v4 = a3;
  v5 = [(MSDRapportPairingHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100068600();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000C9FA8((uint64_t)self, v4);
    }

    id v7 = [v4 localizedDescription];
    objc_super v8 = +[NSError errorDomainMSDWithCode:3727741107 message:@"Cannot authenticate demo peer." reason:v7];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Authentication successfully completed!", (uint8_t *)&v11, 0xCu);
    }
    objc_super v8 = 0;
  }

  v9 = [(MSDRapportPairingHandler *)self completionHandler];

  if (v9)
  {
    __int16 v10 = [(MSDRapportPairingHandler *)self completionHandler];
    ((void (**)(void, void *))v10)[2](v10, v8);
  }
}

- (void)_handlePasswordPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  id v7 = [(MSDRapportPairingHandler *)self queue];
  dispatch_assert_queue_V2(v7);

  objc_super v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v18 = a3;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MSDRapportPairingHandler: Pairing secret requested with flags: %d throttle: %d", buf, 0xEu);
  }

  int64_t v9 = 1000000000;
  if ((a3 & 0x20000) != 0 && a4 >= 1)
  {
    __int16 v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v18 = self;
      *(_WORD *)&v18[8] = 1024;
      int v19 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Authentication needs to be throttled: %d", buf, 0x12u);
    }

    int64_t v9 = 1000000000 * a4 + 1000000000;
  }
  if ((a3 & 0x10000) != 0)
  {
    int v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Pairing secret provided was incorrect!", buf, 0xCu);
    }

    [(MSDRapportPairingHandler *)self setRetryLeft:(char *)[(MSDRapportPairingHandler *)self retryLeft] - 1];
  }
  if ([(MSDRapportPairingHandler *)self retryLeft] < 1)
  {
    v14 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
    [(MSDRapportPairingHandler *)self _hanldeAuthCompletionWithError:v14];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    dispatch_time_t v12 = dispatch_time(0, v9);
    v13 = [(MSDRapportPairingHandler *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023950;
    block[3] = &unk_100151AC8;
    objc_copyWeak(&v16, (id *)buf);
    dispatch_after(v12, v13, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_fetchPairingSecretFromServer
{
  v3 = [(MSDRapportPairingHandler *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    dispatch_time_t v12 = self;
    __int16 v13 = 2048;
    int64_t v14 = [(MSDRapportPairingHandler *)self retryLeft];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching pairing secret from server with retry left: %ld", buf, 0x16u);
  }

  v5 = objc_alloc_init(MSDKVStoreRequest);
  objc_initWeak((id *)buf, self);
  [(MSDKVStoreRequest *)v5 setIsPost:0];
  id v6 = [(MSDRapportPairingHandler *)self device];
  id v7 = [v6 identifier];
  [(MSDKVStoreRequest *)v5 setKey:v7];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023B8C;
  v9[3] = &unk_100152068;
  objc_copyWeak(&v10, (id *)buf);
  [(MSDServerRequest *)v5 setCompletion:v9];
  objc_super v8 = +[MSDServerRequestHandler sharedInstance];
  [v8 handleRequestAsync:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_handleKVStoreResponse:(id)a3
{
  id v4 = a3;
  v5 = [(MSDRapportPairingHandler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 value];
  id v7 = [v4 error];

  objc_super v8 = sub_100068600();
  int64_t v9 = v8;
  if (v7 || !v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CA03C((uint64_t)self, v7);
    }

    [(MSDRapportPairingHandler *)self setRetryLeft:(char *)[(MSDRapportPairingHandler *)self retryLeft] - 1];
    if ([(MSDRapportPairingHandler *)self retryLeft] < 1) {
      [(MSDRapportPairingHandler *)self _hanldeAuthCompletionWithError:v7];
    }
    else {
      [(MSDRapportPairingHandler *)self _fetchPairingSecretFromServer];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      dispatch_time_t v12 = self;
      __int16 v13 = 2114;
      int64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Found pairing secret: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v10 = [(MSDRapportPairingHandler *)self rpClient];
    [v10 tryPassword:v6];
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@[%p]>", v4, self];

  return v5;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (MSDRapportDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RPCompanionLinkClient)rpClient
{
  return self->_rpClient;
}

- (void)setRpClient:(id)a3
{
}

- (int64_t)retryLeft
{
  return self->_retryLeft;
}

- (void)setRetryLeft:(int64_t)a3
{
  self->_retryLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end