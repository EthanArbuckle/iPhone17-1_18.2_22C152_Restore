@interface MRDSystemEndpointControllerHelper
+ (void)fetchActiveEndpointOnQueue:(id)a3 withCompletion:(id)a4;
- (MRAVEndpoint)activeEndpoint;
- (MRDAVSystemEndpointController)controller;
- (MRDSystemEndpointControllerHelper)initWithSystemEndpointController:(id)a3;
- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo;
- (OS_dispatch_queue)workerQueue;
- (id)lastFetchAttemptToken;
- (void)_handleActiveSystemEndpointDidChange:(id)a3;
- (void)_handleDeviceInfoDidChange:(id)a3;
- (void)_initialize;
- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:(id)a3 fromCurrentActiveEndpoint:(id)a4 withLocalDeviceInfo:(id)a5;
- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:(id)a3 fromCurrentActiveEndpoint:(id)a4 withDeviceInfo:(id)a5 previousDeviceInfo:(id)a6;
- (void)_onWorkerQueue_reevaluate;
- (void)_onWorkerQueue_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5;
- (void)_reevaluate;
- (void)_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5;
- (void)setActiveEndpoint:(id)a3;
- (void)setEndpointInfo:(id)a3;
- (void)setLastFetchAttemptToken:(id)a3;
@end

@implementation MRDSystemEndpointControllerHelper

- (MRDSystemEndpointControllerHelper)initWithSystemEndpointController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRDSystemEndpointControllerHelper;
  v6 = [(MRDSystemEndpointControllerHelper *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.MRDSystemEndpointControllerHelper", v8);
    workerQueue = v7->_workerQueue;
    v7->_workerQueue = (OS_dispatch_queue *)v9;

    dispatch_time_t v11 = dispatch_time(0, 3000000000);
    v12 = [(MRDSystemEndpointControllerHelper *)v7 workerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100140BA8;
    block[3] = &unk_100415CC8;
    v15 = v7;
    dispatch_after(v11, v12, block);
  }
  return v7;
}

- (void)_initialize
{
  v3 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  dispatch_assert_queue_V2(v3);

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleActiveSystemEndpointDidChange:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleDeviceInfoDidChange:" name:kMRDeviceInfoDidChangeNotification object:0];

  [(MRDSystemEndpointControllerHelper *)self _reevaluate];
}

- (void)_handleActiveSystemEndpointDidChange:(id)a3
{
}

- (void)_handleDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "mr_origin");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend(v4, "mr_deviceInfo");
  v6 = objc_msgSend(v4, "mr_previousDeviceInfo");

  if (([v14 isLocal] & 1) == 0)
  {
    v7 = [(MRDSystemEndpointControllerHelper *)self activeEndpoint];
    id v8 = [v7 origin];
    if (v14 == v8)
    {
    }
    else
    {
      unsigned __int8 v9 = [v14 isEqual:v8];

      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
    }
  }
  id v10 = [v5 parentGroupID];
  id v11 = [v6 parentGroupID];
  if (v10 == v11)
  {
  }
  else
  {
    v12 = v11;
    unsigned __int8 v13 = [v10 isEqual:v11];

    if (v13) {
      goto LABEL_11;
    }
    id v10 = [(MRDSystemEndpointControllerHelper *)self activeEndpoint];
    [(MRDSystemEndpointControllerHelper *)self _reevaluateWithEndpoint:v10 deviceInfo:v5 previousDeviceInfo:v6];
  }

LABEL_11:
}

- (void)setActiveEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(MRAVEndpoint *)v5->_activeEndpoint debugName];
    id v8 = [v4 debugName];
    int v12 = 138412546;
    unsigned __int8 v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDSystemEndpointControllerHelper] ActiveEndpoint changed from <%@> to <%@>", (uint8_t *)&v12, 0x16u);
  }
  activeEndpoint = v5->_activeEndpoint;
  v5->_activeEndpoint = (MRAVEndpoint *)v4;
  id v10 = v4;

  objc_sync_exit(v5);
  id v11 = [v10 deviceInfo];
  [(MRDSystemEndpointControllerHelper *)v5 _reevaluateWithEndpoint:v10 deviceInfo:v11 previousDeviceInfo:0];
}

- (MRAVEndpoint)activeEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (void)_reevaluate
{
  v3 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141030;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onWorkerQueue_reevaluate
{
  v3 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSDate now];
  [(MRDSystemEndpointControllerHelper *)self setLastFetchAttemptToken:v4];
  id v5 = objc_opt_class();
  v6 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100141128;
  v8[3] = &unk_10041D368;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v5 fetchActiveEndpointOnQueue:v6 withCompletion:v8];
}

- (void)_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10014129C;
  v15[3] = &unk_1004162F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_onWorkerQueue_reevaluateWithEndpoint:(id)a3 deviceInfo:(id)a4 previousDeviceInfo:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(MRDAVSystemEndpointController *)self->_controller activeOutputDeviceUID];
  id v12 = +[MRDMediaRemoteServer server];
  id v13 = [v12 deviceInfo];

  uint64_t v14 = [v13 deviceUID];
  if (v14)
  {
    v15 = (void *)v14;
    id v16 = +[MRUserSettings currentSettings];
    unsigned int v17 = [v16 supportNativeToAirPlayASERetargetting];

    if (v17) {
      [(MRDSystemEndpointControllerHelper *)self _onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:v11 fromCurrentActiveEndpoint:v20 withLocalDeviceInfo:v13];
    }
  }
  id v18 = +[MRUserSettings currentSettings];
  unsigned int v19 = [v18 supportASERetargetting];

  if (v19) {
    [(MRDSystemEndpointControllerHelper *)self _onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:v11 fromCurrentActiveEndpoint:v20 withDeviceInfo:v8 previousDeviceInfo:v9];
  }
}

- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForNativeOrAirPlayback:(id)a3 fromCurrentActiveEndpoint:(id)a4 withLocalDeviceInfo:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MRDSystemEndpointControllerHelper *)self workerQueue];
  dispatch_assert_queue_V2(v10);

  if (!v13 || [v9 containsDevice:v13])
  {
    if (([v9 isAirPlayActive] & 1) == 0
      && ([v8 isRemoteEndpoint] & 1) != 0)
    {
      CFStringRef v11 = @"Retarget back to local since AirPlay stopped";
LABEL_14:
      id v12 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v13 reason:v11];
      [(MRDAVSystemEndpointController *)self->_controller updateSystemEndpointForRequest:v12 event:9 completion:0];

      goto LABEL_15;
    }
    if ([v9 isAirPlayActive]
      && ([v9 parentGroupContainsDiscoverableGroupLeader] & 1) == 0
      && ([v8 isRemoteEndpoint] & 1) != 0)
    {
      CFStringRef v11 = @"Retarget back to local since hijacked by UGL";
      goto LABEL_14;
    }
    if ([v9 isAirPlayActive]
      && [v9 parentGroupContainsDiscoverableGroupLeader]
      && ([v8 isRemoteEndpoint] & 1) == 0)
    {
      CFStringRef v11 = @"Retarget to remote since DGL AirPlay started";
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)_onWorkerQueue_maybeRetargetActiveOutputDeviceUIDForRemoteEndpointChanges:(id)a3 fromCurrentActiveEndpoint:(id)a4 withDeviceInfo:(id)a5 previousDeviceInfo:(id)a6
{
  id v9 = a3;
  if (a5 && a6)
  {
    id v16 = v9;
    id v10 = a6;
    id v11 = [a5 parentGroupID];
    id v12 = [v10 parentGroupID];

    id v13 = v12;
    if (v11 == v13)
    {
    }
    else
    {
      uint64_t v14 = v13;
      unsigned __int8 v15 = [v11 isEqual:v13];

      id v9 = v16;
      if (v15) {
        goto LABEL_8;
      }
      id v11 = [objc_alloc((Class)MRUpdateActiveSystemEndpointRequest) initWithOutputDeviceUID:v16 reason:@"Retarget to new endpoint because group leader changed"];
      [(MRDAVSystemEndpointController *)self->_controller updateSystemEndpointForRequest:v11 event:9 completion:0];
    }

    id v9 = v16;
  }
LABEL_8:
}

+ (void)fetchActiveEndpointOnQueue:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  [v7 setDiscoveryMode:3];
  id v8 = +[NSDate date];
  id v9 = +[NSUUID UUID];
  id v10 = [v9 UUIDString];

  id v11 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"MRDSystemEndpointControllerHelper.fetchActiveEndpointOnQueue", v10];
  id v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100141904;
  v22[3] = &unk_1004198C8;
  id v23 = v7;
  v24 = @"MRDSystemEndpointControllerHelper.fetchActiveEndpointOnQueue";
  id v13 = v10;
  id v25 = v13;
  id v26 = v8;
  id v27 = v5;
  id v28 = v6;
  id v14 = v6;
  id v15 = v5;
  id v16 = v8;
  id v17 = v7;
  id v20 = v13;
  v21 = objc_retainBlock(v22);
  id v18 = v21;
  id v19 = v13;
  MRAVEndpointResolveActiveSystemEndpointWithTimeout();
}

- (MRDAVSystemEndpointController)controller
{
  return self->_controller;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo
{
  return self->_endpointInfo;
}

- (void)setEndpointInfo:(id)a3
{
}

- (id)lastFetchAttemptToken
{
  return self->_lastFetchAttemptToken;
}

- (void)setLastFetchAttemptToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastFetchAttemptToken, 0);
  objc_storeStrong((id *)&self->_endpointInfo, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_activeEndpoint, 0);
}

@end