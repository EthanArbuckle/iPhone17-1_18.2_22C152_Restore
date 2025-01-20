@interface CDDeviceDiscovery
- (CDDeviceDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (void)_activated;
- (void)_invalidated;
- (void)_startRapportDiscovery;
- (void)_startRapportListener;
- (void)activate;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)startDiscovery;
@end

@implementation CDDeviceDiscovery

- (CDDeviceDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDDeviceDiscovery;
  v2 = [(CDDeviceDiscovery *)&v5 init];
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
  block[2] = sub_100012EC4;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012F4C;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)startDiscovery
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012FC8;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(CDDeviceDiscovery *)self _startRapportListener];
  v3 = sub_10001304C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device discovery activated.", v4, 2u);
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    [(CDRapportListener *)self->_rapportListener invalidate];
    rapportListener = self->_rapportListener;
    self->_rapportListener = 0;

    [(CDRapportDiscovery *)self->_rapportDiscovery invalidate];
    rapportDiscovery = self->_rapportDiscovery;
    self->_rapportDiscovery = 0;

    self->_invalidateDone = 1;
    v6 = sub_10001304C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device discovery invalidated.", v7, 2u);
    }
  }
}

- (void)_startRapportListener
{
  v3 = objc_alloc_init(CDRapportListener);
  rapportListener = self->_rapportListener;
  self->_rapportListener = v3;

  [(CDRapportListener *)self->_rapportListener setDispatchQueue:self->_dispatchQueue];
  objc_super v5 = self->_rapportListener;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000131FC;
  v6[3] = &unk_100034E18;
  v6[4] = self;
  [(CDRapportListener *)v5 setDeviceFoundHandler:v6];
  [(CDRapportListener *)self->_rapportListener activate];
}

- (void)_startRapportDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  rapportDiscovery = self->_rapportDiscovery;
  if (rapportDiscovery)
  {
    [(CDRapportDiscovery *)rapportDiscovery resetDiscoveryTimer];
  }
  else
  {
    v4 = objc_alloc_init(CDRapportDiscovery);
    objc_super v5 = self->_rapportDiscovery;
    self->_rapportDiscovery = v4;

    [(CDRapportDiscovery *)self->_rapportDiscovery setDispatchQueue:self->_dispatchQueue];
    v6 = self->_rapportDiscovery;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100013348;
    v9[3] = &unk_100034E18;
    v9[4] = self;
    [(CDRapportDiscovery *)v6 setDeviceFoundHandler:v9];
    v7 = self->_rapportDiscovery;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000133CC;
    v8[3] = &unk_1000347D8;
    v8[4] = self;
    [(CDRapportDiscovery *)v7 setInvalidationHandler:v8];
    [(CDRapportDiscovery *)self->_rapportDiscovery activate];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rapportListener, 0);

  objc_storeStrong((id *)&self->_rapportDiscovery, 0);
}

@end