@interface MRDIDSDiscoverySession
- (BOOL)reloadScheduled;
- (IDSService)idsService;
- (MRDIDSDiscoverySession)init;
- (NSString)debugDescription;
- (OS_dispatch_queue)workerQueue;
- (id)availableOutputDevices;
- (unsigned)discoveryMode;
- (void)_onWorkerQueue_reload;
- (void)_onWorkerQueue_scheduleReload;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setIdsService:(id)a3;
- (void)setReloadScheduled:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation MRDIDSDiscoverySession

- (MRDIDSDiscoverySession)init
{
  v3 = +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:16];
  v11.receiver = self;
  v11.super_class = (Class)MRDIDSDiscoverySession;
  v4 = [(MRDIDSDiscoverySession *)&v11 initWithConfiguration:v3];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.mediaremote.%@", objc_opt_class()];
    v6 = (const char *)[v5 UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    workerQueue = v4->_workerQueue;
    v4->_workerQueue = (OS_dispatch_queue *)v8;
  }
  return v4;
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@ %p {\n", objc_opt_class(), v2];
  v4 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  [v3 appendFormat:@"  discoveryMode = %@\n", v4];

  id v5 = [(IDSService *)v2->_idsService devices];
  v6 = MRCreateIndentedDebugDescriptionFromArray();
  [v3 appendFormat:@"  idsService = %@\n", v6];

  v7 = [(MRDIDSDiscoverySession *)v2 availableOutputDevices];
  dispatch_queue_t v8 = MRCreateIndentedDebugDescriptionFromArray();
  [v3 appendFormat:@"  outputDevices = %@\n", v8];

  [v3 appendString:@"}>"];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  idsService = v4->_idsService;
  if (a3)
  {
    if (!idsService)
    {
      uint64_t v6 = +[IDSService mr_sharedIDSService];
      v7 = v4->_idsService;
      v4->_idsService = (IDSService *)v6;

      [(IDSService *)v4->_idsService addDelegate:v4 queue:v4->_workerQueue];
    }
  }
  else
  {
    [(IDSService *)idsService removeDelegate:v4];
    dispatch_queue_t v8 = v4->_idsService;
    v4->_idsService = 0;
  }
  v4->_discoveryMode = a3;
  workerQueue = v4->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F164;
  block[3] = &unk_100415CC8;
  block[4] = v4;
  dispatch_async(workerQueue, block);
  objc_sync_exit(v4);
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (id)availableOutputDevices
{
  return [(MRDIDSDiscoverySession *)self outputDevicesSnapshot];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)_onWorkerQueue_reload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v3 = [(IDSService *)self->_idsService devices];
  objc_msgSend(v3, "msv_map:", &stru_100418218);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(MRDIDSDiscoverySession *)self notifyOutputDevicesChanged:v4];
}

- (void)_onWorkerQueue_scheduleReload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  if (!self->_reloadScheduled)
  {
    self->_reloadScheduled = 1;
    dispatch_time_t v3 = dispatch_time(0, 500000000);
    workerQueue = self->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005F300;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)workerQueue, block);
  }
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (BOOL)reloadScheduled
{
  return self->_reloadScheduled;
}

- (void)setReloadScheduled:(BOOL)a3
{
  self->_reloadScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end