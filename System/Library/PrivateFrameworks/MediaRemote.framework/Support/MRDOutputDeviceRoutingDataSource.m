@interface MRDOutputDeviceRoutingDataSource
- (BOOL)currentRouteSupportsVolumeControl;
- (BOOL)resetPickedRouteForSource:(unsigned int)a3;
- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4;
- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)unpickAirPlayRoutes;
- (MRDOutputDeviceRoutingDataSource)init;
- (id)_activeSystemContext;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoute;
- (id)pickedRouteForCategory:(id)a3;
- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4;
- (unsigned)discoveryMode;
- (unsigned)externalScreenType;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRDOutputDeviceRoutingDataSource

- (MRDOutputDeviceRoutingDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRDOutputDeviceRoutingDataSource;
  v2 = [(MRDAVRoutingDataSource *)&v8 init];
  if (v2)
  {
    v3 = (AVOutputDeviceDiscoverySession *)[objc_alloc(off_100475D78()) initWithDeviceFeatures:1];
    discoverySession = v2->_discoverySession;
    v2->_discoverySession = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activeReconnaissanceSessions = v2->_activeReconnaissanceSessions;
    v2->_activeReconnaissanceSessions = v5;
  }
  return v2;
}

- (unsigned)discoveryMode
{
  v2 = (char *)[(AVOutputDeviceDiscoverySession *)self->_discoverySession discoveryMode];
  if ((unint64_t)(v2 - 1) > 2) {
    return 0;
  }
  else {
    return dword_1003C53F0[(void)(v2 - 1)];
  }
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  if (a3 - 1 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1003C5400[a3 - 1];
  }
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription();
    int v7 = 138543362;
    objc_super v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[ODDSRouting] Setting system discovery mode to %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(AVOutputDeviceDiscoverySession *)self->_discoverySession setDiscoveryMode:v4];
}

- (unsigned)externalScreenType
{
  return 0;
}

- (BOOL)currentRouteSupportsVolumeControl
{
  v2 = [(MRDOutputDeviceRoutingDataSource *)self _activeSystemContext];
  v3 = [v2 outputDevice];

  LOBYTE(v2) = [v3 canSetVolume];
  return (char)v2;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return [(MRDOutputDeviceRoutingDataSource *)self pickableRoutesForCategory:a3 source:0];
}

- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(AVOutputDeviceDiscoverySession *)self->_discoverySession availableOutputDevices];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[MRDAVOutputDeviceRoute alloc] initWithAVOutputDevice:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)pickedRoute
{
  return [(MRDOutputDeviceRoutingDataSource *)self pickedRouteForCategory:@"MediaPlayback" source:0];
}

- (id)pickedRouteForCategory:(id)a3
{
  return [(MRDOutputDeviceRoutingDataSource *)self pickedRouteForCategory:a3 source:0];
}

- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4
{
  id v5 = [MRDAVOutputDeviceRoute alloc];
  v6 = [(MRDOutputDeviceRoutingDataSource *)self _activeSystemContext];
  id v7 = [v6 outputDevice];
  id v8 = [(MRDAVOutputDeviceRoute *)v5 initWithAVOutputDevice:v7];

  return v8;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4
{
  return [(MRDOutputDeviceRoutingDataSource *)self setPickedRoute:a3 withPassword:a4 forSource:0];
}

- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 uniqueIdentifier];
  if (v8)
  {
    v10 = off_100475D80();

    if (v10)
    {
      v11 = off_100475D80();
      v46 = v11;
      id v47 = v8;
      v10 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[ODDSRouting] Setting picked system route to: %{public}@ with password \"%@\"", buf, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [(MRDOutputDeviceRoutingDataSource *)self _activeSystemContext];
    long long v14 = [v7 avOutputDevice];
    long long v15 = _MRLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[ODDSRouting] Route is an output device-based route. Setting the following device on the output context: %{public}@", buf, 0xCu);
    }

    [v13 setOutputDevice:v14 options:v10];
LABEL_23:
    BOOL v20 = 1;
    goto LABEL_24;
  }
  if (v9 && ([v7 isSpeakerRoute] & 1) == 0)
  {
    int v40 = 0;
    v21 = MRComputeBaseRouteUID();
    v22 = _MRLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[ODDSRouting] Route is not an output device-based route. Beginning search for device matching UID \"%{public}@\"", buf, 0xCu);
    }

    id v23 = objc_alloc((Class)MRAVReconnaissanceSession);
    v45 = v21;
    v24 = +[NSArray arrayWithObjects:&v45 count:1];
    id v25 = [v23 initWithOutputDeviceUIDs:v24 outputDeviceGroupID:0 features:1];

    [v25 setUseWeakMatching:1];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v42 = sub_1000583B0;
    v43 = sub_1000583C0;
    v26 = self;
    v44 = v26;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_1000583B0;
    v38[4] = sub_1000583C0;
    id v27 = v25;
    id v39 = v27;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    v31 = sub_1000583C8;
    v32 = &unk_100417D38;
    v35 = v38;
    int v37 = v40;
    id v33 = v10;
    id v34 = v7;
    v36 = buf;
    [v27 beginSearchWithTimeout:&v29 completion:5.0];
    -[NSMutableArray addObject:](v26->_activeReconnaissanceSessions, "addObject:", v27, v29, v30, v31, v32);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_23;
  }
  if ([v7 isSpeakerRoute])
  {
    long long v16 = [(objc_class *)off_100475D88() sharedSystemScreenContext];
    v17 = [(objc_class *)off_100475D88() sharedAudioPresentationOutputContext];
    v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[ODDSRouting] Requested to pick speaker route. Clearing output devices from system screen and system music contexts: %{public}@ %{public}@", buf, 0x16u);
    }

    [v16 setOutputDevice:0 options:0];
    [v17 setOutputDevices:&__NSArray0__struct];

    goto LABEL_23;
  }
  v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10032B498(v19);
  }

  BOOL v20 = 0;
LABEL_24:

  return v20;
}

- (BOOL)resetPickedRouteForSource:(unsigned int)a3
{
  v3 = [(MRDOutputDeviceRoutingDataSource *)self _activeSystemContext];
  [v3 setOutputDevice:0 options:0];

  return 1;
}

- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3
{
  return [(MRDOutputDeviceRoutingDataSource *)self resetPickedRouteForSource:0];
}

- (BOOL)unpickAirPlayRoutes
{
  v2 = [(MRDOutputDeviceRoutingDataSource *)self _activeSystemContext];
  [v2 setOutputDevice:0 options:0];

  return 1;
}

- (id)_activeSystemContext
{
  Class v2 = off_100475D88();

  return [(objc_class *)v2 sharedSystemAudioContext];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeReconnaissanceSessions, 0);

  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end