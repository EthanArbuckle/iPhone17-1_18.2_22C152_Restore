@interface CDRapportDiscovery
- (CDRapportDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (id)invalidationHandler;
- (void)_activated;
- (void)_handleDeviceFound:(id)a3;
- (void)_invalidated;
- (void)_startDiscoveryTimer;
- (void)activate;
- (void)invalidate;
- (void)resetDiscoveryTimer;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CDRapportDiscovery

- (CDRapportDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDRapportDiscovery;
  v2 = [(CDRapportDiscovery *)&v5 init];
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
  block[2] = sub_100013580;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013608;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)resetDiscoveryTimer
{
  [(BSContinuousMachTimer *)self->_discoveryTimer cancel];

  [(CDRapportDiscovery *)self _startDiscoveryTimer];
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
  rapportClient = self->_rapportClient;
  self->_rapportClient = v3;

  [(RPCompanionLinkClient *)self->_rapportClient setRssiThreshold:-75];
  objc_super v5 = self->_rapportClient;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013768;
  v8[3] = &unk_100034E60;
  v8[4] = self;
  [(RPCompanionLinkClient *)v5 setDeviceFoundHandler:v8];
  [(RPCompanionLinkClient *)self->_rapportClient setDispatchQueue:self->_dispatchQueue];
  [(RPCompanionLinkClient *)self->_rapportClient setControlFlags:0x82004113800];
  v6 = self->_rapportClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013774;
  v7[3] = &unk_100034878;
  v7[4] = self;
  [(RPCompanionLinkClient *)v6 activateWithCompletion:v7];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    [(RPCompanionLinkClient *)self->_rapportClient invalidate];
    rapportClient = self->_rapportClient;
    self->_rapportClient = 0;

    [(BSContinuousMachTimer *)self->_discoveryTimer invalidate];
    discoveryTimer = self->_discoveryTimer;
    self->_discoveryTimer = 0;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v7 = self->_invalidationHandler;
      self->_invalidationHandler = 0;
    }
    self->_invalidateDone = 1;
    v8 = sub_100013840();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Discovery invalidated.", v9, 2u);
    }
  }
}

- (void)_handleDeviceFound:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_super v5 = [v4 idsDeviceIdentifier];
  if (v5)
  {
    if (self->_deviceFoundHandler)
    {
      if (([v4 statusFlags] & 0x40000000) != 0)
      {
        v6 = (void (*)(void))*((void *)self->_deviceFoundHandler + 2);
        goto LABEL_10;
      }
      if (([v4 statusFlags] & 0x200000) != 0)
      {
        v6 = (void (*)(void))*((void *)self->_deviceFoundHandler + 2);
LABEL_10:
        v6();
      }
    }
  }
  else
  {
    id v7 = sub_100013840();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002213C((uint64_t)v4, v7);
    }
  }
}

- (void)_startDiscoveryTimer
{
  v3 = sub_100013840();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting discovery timer.", buf, 2u);
  }

  discoveryTimer = self->_discoveryTimer;
  if (!discoveryTimer)
  {
    objc_super v5 = (BSContinuousMachTimer *)[objc_alloc((Class)BSContinuousMachTimer) initWithIdentifier:@"CDRapportDiscovery.discoveryTimer"];
    v6 = self->_discoveryTimer;
    self->_discoveryTimer = v5;

    discoveryTimer = self->_discoveryTimer;
  }
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013B38;
  v8[3] = &unk_100034A38;
  v8[4] = self;
  [(BSContinuousMachTimer *)discoveryTimer scheduleWithFireInterval:dispatchQueue leewayInterval:v8 queue:30.0 handler:1.0];
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryTimer, 0);

  objc_storeStrong((id *)&self->_rapportClient, 0);
}

@end