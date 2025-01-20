@interface MRDRoutingDiscoverySession
- (BOOL)devicePresenceDetected;
- (BOOL)onlyDiscoversBluetoothDevices;
- (MRDRoutingDiscoverySession)initWithConfiguration:(id)a3;
- (NSString)clientIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (id)availableEndpoints;
- (id)availableOutputDevices;
- (id)routingContextUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (unsigned)targetAudioSessionID;
- (void)dealloc;
- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4;
- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRDRoutingDiscoverySession

- (MRDRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MRDRoutingDiscoverySession;
  v3 = [(MRDRoutingDiscoverySession *)&v8 initWithConfiguration:a3];
  if (v3)
  {
    if (qword_10047E058 != -1) {
      dispatch_once(&qword_10047E058, &stru_1004194F0);
    }
    objc_storeStrong((id *)&v3->_workerQueue, (id)qword_10047E050);
    v4 = +[MRDMediaRemoteServer server];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000875E0;
    v6[3] = &unk_100415CC8;
    v7 = v3;
    [v4 addMediaRemoteSeverStartedHandler:v6];
  }
  return v3;
}

- (void)dealloc
{
  if (self->_discoveryMode)
  {
    v3 = dispatch_get_global_queue(0, 0);
    dispatch_async(v3, &stru_100419510);
  }
  v4.receiver = self;
  v4.super_class = (Class)MRDRoutingDiscoverySession;
  [(MRDRoutingDiscoverySession *)&v4 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  [(MRDRoutingDiscoverySession *)self discoveryMode];
  v5 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  if ([(MRDRoutingDiscoverySession *)self alwaysAllowUpdates]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = [(MRDRoutingDiscoverySession *)self availableEndpoints];
  id v8 = [v7 count];
  v9 = [(MRDRoutingDiscoverySession *)self availableOutputDevices];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p %@ | %@ | %ldd:%ldd", v4, self, v5, v6, v8, [v9 count]);

  return (NSString *)v10;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  [(MRDRoutingDiscoverySession *)self discoveryMode];
  v5 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
  if ([(MRDRoutingDiscoverySession *)self alwaysAllowUpdates]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = [(MRDRoutingDiscoverySession *)self availableOutputDevices];
  id v8 = [(MRDRoutingDiscoverySession *)self availableEndpoints];
  v9 = +[NSString stringWithFormat:@"<%@: %p> currentDiscoveryMode: %@\nalwaysAllowUpdates: %@\navailableOutputDevices: %@\navailableEndpoints: %@", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)clientIdentifier
{
  return (NSString *)@"mediaremotedirect";
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_discoveryMode == a3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    objc_super v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (id)MRMediaRemoteCopyRouteDiscoveryModeDescription();
      CFStringRef v6 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
      *(_DWORD *)buf = 138412802;
      v11 = obj;
      __int16 v12 = 2114;
      id v13 = v5;
      __int16 v14 = 2114;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDDiscoverySession] %@ setting discoveryMode from %{public}@ to %{public}@", buf, 0x20u);
    }
    obj->_discoveryMode = a3;
    objc_sync_exit(obj);

    workerQueue = obj->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100087B34;
    block[3] = &unk_100415CC8;
    block[4] = obj;
    dispatch_async(workerQueue, block);
  }
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (void)hostedRoutingController:(id)a3 endpointsDidChange:(id)a4
{
  objc_msgSend(a4, "msv_map:", &stru_100419550);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MRDRoutingDiscoverySession *)self notifyEndpointsChanged:v5];
}

- (void)hostedRoutingController:(id)a3 outputDevicesDidChange:(id)a4 forFeature:(unsigned int)a5
{
}

- (unsigned)endpointFeatures
{
  return 8;
}

- (id)availableEndpoints
{
  v2 = [(MRDRoutingDiscoverySession *)self endpointsSnapshot];
  v3 = objc_msgSend(v2, "msv_map:", &stru_100419570);

  return v3;
}

- (id)availableOutputDevices
{
  return [(MRDRoutingDiscoverySession *)self outputDevicesSnapshot];
}

- (BOOL)devicePresenceDetected
{
  v2 = [(MRDRoutingDiscoverySession *)self availableOutputDevices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unsigned)targetAudioSessionID
{
  return 0;
}

- (id)routingContextUID
{
  return 0;
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  return 0;
}

- (void).cxx_destruct
{
}

@end