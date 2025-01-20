@interface COSRegistryDispatcher
- (COSRegistryDispatcher)initWithBecameReadyCompletion:(id)a3 andTimeout:(double)a4;
- (OS_dispatch_source)timer;
- (id)clientBlock;
- (void)invalidate;
- (void)nanoRegistryBecameActive;
- (void)nanoRegistryStatusChanged:(id)a3;
- (void)setClientBlock:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation COSRegistryDispatcher

- (COSRegistryDispatcher)initWithBecameReadyCompletion:(id)a3 andTimeout:(double)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)COSRegistryDispatcher;
  id v7 = [(COSRegistryDispatcher *)&v27 init];
  if (v7)
  {
    id v8 = [v6 copy];
    v9 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v8;

    v10 = +[NRPairedDeviceRegistry sharedInstance];
    id v11 = [v10 status];

    if (v11 == (id)2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100117CDC;
      block[3] = &unk_1002438A0;
      v12 = &v26;
      id v26 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v13 = pbb_bridge_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = +[NSNumber numberWithUnsignedInteger:v11];
        *(_DWORD *)buf = 138412290;
        v29 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(COSRegistryBecameActiveDispatcher) NR is not ready (State was %@). Waiting for NR...", buf, 0xCu);
      }
      v15 = +[NSNotificationCenter defaultCenter];
      [v15 addObserver:v7 selector:"nanoRegistryStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

      dispatch_source_t v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v17 = (void *)*((void *)v7 + 1);
      *((void *)v7 + 1) = v16;

      v18 = *((void *)v7 + 1);
      double v19 = a4 * 1000000000.0;
      dispatch_time_t v20 = dispatch_time(0, (uint64_t)v19);
      dispatch_source_set_timer(v18, v20, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v19 * 0.1 * 1000000000.0));
      v21 = *((void *)v7 + 1);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100117D60;
      v23[3] = &unk_1002438A0;
      v12 = &v24;
      id v24 = v7;
      dispatch_source_set_event_handler(v21, v23);
      dispatch_source_set_cancel_handler(*((dispatch_source_t *)v7 + 1), &stru_100247918);
      dispatch_resume(*((dispatch_object_t *)v7 + 1));
    }
  }
  return (COSRegistryDispatcher *)v7;
}

- (void)nanoRegistryStatusChanged:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKey:NRPairedDeviceRegistryStatusKey];

  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(COSRegistryBecameActiveDispatcher) NR Status Changed to %@", (uint8_t *)&v8, 0xCu);
  }

  if (v5 && [v5 integerValue] == (id)2)
  {
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:NRPairedDeviceRegistryStatusDidChange object:0];

    [(COSRegistryDispatcher *)self nanoRegistryBecameActive];
  }
}

- (void)nanoRegistryBecameActive
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  clientBlock = (void (**)(id, void))self->_clientBlock;
  if (clientBlock) {
    clientBlock[2](clientBlock, 0);
  }
  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(COSRegistryBecameActiveDispatcher) NR became ready. Firing!", v7, 2u);
  }
}

- (void)invalidate
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NRPairedDeviceRegistryStatusDidChange object:0];

  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(COSRegistryBecameActiveDispatcher) Invalidated!", v7, 2u);
  }
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (id)clientBlock
{
  return self->_clientBlock;
}

- (void)setClientBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientBlock, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end