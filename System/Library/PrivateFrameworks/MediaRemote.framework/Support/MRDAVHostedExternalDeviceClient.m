@interface MRDAVHostedExternalDeviceClient
- (BOOL)hasAttemptedToConnect;
- (BOOL)hasConnectionAttemptCompleted;
- (MRDAVHostedExternalDeviceClient)initWithConnection:(id)a3;
- (MRDAVHostedExternalDevicePendingClientState)pendingClientState;
- (MRDMediaRemoteClient)xpcClient;
- (MRXPCConnectionMonitor)connectionMonitor;
- (NSArray)discoveryTokens;
- (NSArray)subscribedPlayerPaths;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)discoveryTokenForConfiguration:(id)a3;
- (unint64_t)notifications;
- (unint64_t)registeredCallbacks;
- (unsigned)connectionState;
- (void)_maybeWakeClient;
- (void)_resumeConnectionWithState:(id)a3;
- (void)connectionDidInvalidate:(id)a3;
- (void)connectionDidResume:(id)a3;
- (void)dealloc;
- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4;
- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4;
- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3;
- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4;
- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3;
- (void)hostedExternalDeviceEndpointDidChange:(id)a3;
- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4;
- (void)invalidateWithError:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setConnectionState:(unsigned int)a3;
- (void)setDiscoveryToken:(id)a3 forConfiguration:(id)a4;
- (void)setHasAttemptedToConnect:(BOOL)a3;
- (void)setHasConnectionAttemptCompleted:(BOOL)a3;
- (void)setNotifications:(unint64_t)a3;
- (void)setPendingClientState:(id)a3;
- (void)setRegisteredCallbacks:(unint64_t)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setXpcClient:(id)a3;
@end

@implementation MRDAVHostedExternalDeviceClient

- (MRDAVHostedExternalDeviceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRDAVHostedExternalDeviceClient;
  v6 = [(MRDAVHostedExternalDeviceClient *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_registeredCallbacks = 0;
    v7->_notifications = 0;
    connection = v7->_connection;
    if (connection) {
      [(NSXPCConnection *)connection auditToken];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    uint64_t v9 = sub_100008ACC(v17);
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v9;

    v11 = [MRXPCConnectionMonitor alloc];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [(MRXPCConnectionMonitor *)v11 initWithConnection:v5 label:v13];
    connectionMonitor = v7->_connectionMonitor;
    v7->_connectionMonitor = v14;

    [(MRXPCConnectionMonitor *)v7->_connectionMonitor setDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  id v3 = objc_alloc((Class)NSError);
  id v4 = [v3 initWithDomain:kMRMediaRemoteFrameworkErrorDomain code:123 userInfo:0];
  [(MRDAVHostedExternalDeviceClient *)self invalidateWithError:v4];

  v5.receiver = self;
  v5.super_class = (Class)MRDAVHostedExternalDeviceClient;
  [(MRDAVHostedExternalDeviceClient *)&v5 dealloc];
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  if (self->_connection)
  {
    objc_super v5 = MRLogCategoryConnections();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HostedExternalDeviceClient] %@ Invalidating with error %@", buf, 0x16u);
    }

    v6 = self->_connection;
    connection = self->_connection;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004CFD8;
    v10[3] = &unk_100415CC8;
    v11 = v6;
    v8 = v6;
    [(NSXPCConnection *)connection scheduleSendBarrierBlock:v10];
    uint64_t v9 = self->_connection;
    self->_connection = 0;
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@:%p %@-%d>", objc_opt_class(), self, self->_bundleIdentifier, [(NSXPCConnection *)self->_connection processIdentifier]];
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@ %p {\n", objc_opt_class(), v2];
  [v3 appendFormat:@"  %@-%d\n", v2->_bundleIdentifier, -[NSXPCConnection processIdentifier](v2->_connection, "processIdentifier")];
  BOOL hasAttemptedToConnect = v2->_hasAttemptedToConnect;
  hasAttemptedToConnectDate = v2->_hasAttemptedToConnectDate;
  [(NSDate *)hasAttemptedToConnectDate timeIntervalSinceNow];
  if (hasAttemptedToConnect) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"  hasConnected = %@ (%@ %lf seconds ago)\n", v7, hasAttemptedToConnectDate, -v6];
  BOOL hasConnectionAttemptCompleted = v2->_hasConnectionAttemptCompleted;
  hasConnectionAttemptCompletedDate = v2->_hasConnectionAttemptCompletedDate;
  [(NSDate *)hasConnectionAttemptCompletedDate timeIntervalSinceNow];
  if (hasConnectionAttemptCompleted) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  [v3 appendFormat:@"  hasConnectedCompleted = %@ (%@ %lf seconds ago)\n", v11, hasConnectionAttemptCompletedDate, -v10];
  v12 = (void *)MRExternalDeviceConnectionStateCopyDescription();
  connectionStateDate = v2->_connectionStateDate;
  [(NSDate *)connectionStateDate timeIntervalSinceNow];
  [v3 appendFormat:@"  connectionState = %@ (%@ %lf seconds ago)\n", v12, connectionStateDate, -v14];

  if (v2->_registeredCallbacks)
  {
    id v15 = NSStringFromMRAVDistantExternalDeviceCallbackFlags();
    [v3 appendFormat:@"  registeredCallbacks = %@\n", v15];
  }
  if (v2->_notifications)
  {
    v16 = NSStringFromMRAVDistantExternalDeviceNotificationFlags();
    [v3 appendFormat:@"  registeredNotifications = %@\n", v16];
  }
  if ([(NSArray *)v2->_subscribedPlayerPaths count])
  {
    v17 = MRCreateIndentedDebugDescriptionFromArray();
    [v3 appendFormat:@"  subscribedPlayerPaths = %@", v17];
  }
  if (v2->_pendingClientState)
  {
    objc_super v18 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"  pendingClientState = %@", v18];
  }
  v19 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@"  connectionMonitor = %@", v19];

  [v3 appendFormat:@"}>\n"];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(MRDAVHostedExternalDeviceClient *)self setConnectionState:v4];
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004D360;
  v9[3] = &unk_1004178A0;
  int v11 = v4;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v9];
}

- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D5C0;
  v7[3] = &unk_1004178C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v7];
}

- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004D814;
  v11[3] = &unk_100415A80;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v11];
}

- (void)hostedExternalDeviceEndpointDidChange:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DA0C;
  v7[3] = &unk_1004178C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v7];
}

- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004DC44;
  v9[3] = &unk_1004178A0;
  unsigned int v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v9];
}

- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004DF68;
  v9[3] = &unk_1004178A0;
  float v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v9];
}

- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004E278;
  v9[3] = &unk_1004178F0;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v9];
}

- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E57C;
  v7[3] = &unk_1004178C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v7];
}

- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E804;
  v7[3] = &unk_1004178C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v7];
}

- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004EA8C;
  v7[3] = &unk_1004178C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v7];
}

- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MRDAVHostedExternalDeviceClient *)self _maybeWakeClient];
  connectionMonitor = self->_connectionMonitor;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004ED38;
  v11[3] = &unk_100415A80;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(MRXPCConnectionMonitor *)connectionMonitor canSendMessage:v11];
}

- (void)setHasAttemptedToConnect:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL hasAttemptedToConnect = a3;
  uint64_t v4 = +[NSDate now];
  hasAttemptedToConnectDate = obj->_hasAttemptedToConnectDate;
  obj->_hasAttemptedToConnectDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (BOOL)hasAttemptedToConnect
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL hasAttemptedToConnect = v2->_hasAttemptedToConnect;
  objc_sync_exit(v2);

  return hasAttemptedToConnect;
}

- (void)setConnectionState:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_connectionState = a3;
  uint64_t v4 = +[NSDate now];
  connectionStateDate = obj->_connectionStateDate;
  obj->_connectionStateDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (unsigned)connectionState
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int connectionState = v2->_connectionState;
  objc_sync_exit(v2);

  return connectionState;
}

- (void)setHasConnectionAttemptCompleted:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL hasConnectionAttemptCompleted = a3;
  uint64_t v4 = +[NSDate now];
  hasConnectionAttemptCompletedDate = obj->_hasConnectionAttemptCompletedDate;
  obj->_hasConnectionAttemptCompletedDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (BOOL)hasConnectionAttemptCompleted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL hasConnectionAttemptCompleted = v2->_hasConnectionAttemptCompleted;
  objc_sync_exit(v2);

  return hasConnectionAttemptCompleted;
}

- (id)discoveryTokenForConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_discoveryTokens objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setDiscoveryToken:(id)a3 forConfiguration:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = v13;
  discoveryTokens = v7->_discoveryTokens;
  if (!discoveryTokens)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    BOOL v11 = v7->_discoveryTokens;
    v7->_discoveryTokens = v10;

    discoveryTokens = v7->_discoveryTokens;
    id v8 = v13;
  }
  [(NSMutableDictionary *)discoveryTokens setObject:v8 forKeyedSubscript:v6];
  if (!v13)
  {
    id v12 = [(MRDAVHostedExternalDevicePendingClientState *)v7->_pendingClientState discoverySessionConfigurationsResults];
    [v12 setObject:0 forKeyedSubscript:v6];
  }
  objc_sync_exit(v7);
}

- (NSArray)discoveryTokens
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_discoveryTokens allValues];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)connectionDidResume:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = v4;
  objc_sync_enter(v5);
  id v6 = v5[13];
  id v7 = v5[13];
  v5[13] = 0;

  objc_sync_exit(v5);
  [v5 _resumeConnectionWithState:v6];

  objc_sync_exit(v5);
}

- (void)connectionDidInvalidate:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_super v5 = objc_alloc_init(MRDAVHostedExternalDevicePendingClientState);
  pendingClientState = v4->_pendingClientState;
  v4->_pendingClientState = v5;

  objc_sync_exit(v4);
}

- (void)_resumeConnectionWithState:(id)a3
{
  id v4 = a3;
  objc_super v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v88 = v4;
    __int16 v89 = 2112;
    v90 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HostedExternalDeviceClient] Restoring state %@ for %@", buf, 0x16u);
  }

  if ([v4 connectionState])
  {
    id v6 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    id v7 = [v4 connectionState];
    id v8 = [v4 connectionStateError];
    [v6 hostedExternalDeviceConnectionStateDidChange:v7 withError:v8];
  }
  id v9 = [v4 deviceInfo];

  if (v9)
  {
    id v10 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    BOOL v11 = [v4 deviceInfo];
    [v10 hostedExternalDeviceDeviceInfoDidChange:v11];
  }
  id v12 = [v4 endpoint];

  if (v12)
  {
    id v13 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    double v14 = [v4 endpoint];
    [v13 hostedExternalDeviceEndpointDidChange:v14];
  }
  id v15 = [v4 outputDeviceModifications];

  if (v15)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v16 = [v4 outputDeviceModifications];
    v17 = [v16 addedOutputDevices];

    id v18 = [v17 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v81;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v81 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * (void)v21);
          v23 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
          [v23 hostedExternalDeviceDidAddOutputDevice:v22];

          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v80 objects:v86 count:16];
      }
      while (v19);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v24 = [v4 outputDeviceModifications];
    v25 = [v24 changedOutputDevices];

    id v26 = [v25 countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v77;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v77 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v76 + 1) + 8 * (void)v29);
          v31 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
          [v31 hostedExternalDeviceDidChangeOutputDevice:v30];

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v27);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v32 = [v4 outputDeviceModifications];
    v33 = [v32 removedOutputDevices];

    id v34 = [v33 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v73;
      do
      {
        v37 = 0;
        do
        {
          if (*(void *)v73 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v72 + 1) + 8 * (void)v37);
          v39 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
          [v39 hostedExternalDeviceDidRemoveOutputDevice:v38];

          v37 = (char *)v37 + 1;
        }
        while (v35 != v37);
        id v35 = [v33 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v35);
    }
  }
  v40 = [v4 discoverySessionConfigurationsResults];

  if (v40)
  {
    v41 = [v4 discoverySessionConfigurationsResults];
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10004FBAC;
    v71[3] = &unk_100417918;
    v71[4] = self;
    [v41 enumerateKeysAndObjectsUsingBlock:v71];
  }
  v42 = [v4 outputDeviceVolumeCapabilities];

  if (v42)
  {
    v43 = [v4 outputDeviceVolumeCapabilities];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10004FC2C;
    v68[3] = &unk_100417968;
    id v69 = v4;
    v70 = self;
    [v43 enumerateKeysAndObjectsUsingBlock:v68];
  }
  v44 = [v4 volumeCapabilities];

  if (v44)
  {
    v45 = [v4 volumeCapabilities];
    id v46 = [v45 unsignedIntValue];

    v47 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v47 hostedExternalDeviceVolumeCapabilitiesDidChange:v46 forOutputDevice:0];
  }
  v48 = [v4 outputDeviceVolume];

  if (v48)
  {
    v49 = [v4 outputDeviceVolume];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10004FD7C;
    v65[3] = &unk_100417968;
    id v66 = v4;
    v67 = self;
    [v49 enumerateKeysAndObjectsUsingBlock:v65];
  }
  v50 = [v4 volume];

  if (v50)
  {
    v51 = [v4 volume];
    [v51 floatValue];
    int v53 = v52;

    v54 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    LODWORD(v55) = v53;
    [v54 hostedExternalDeviceVolumeDidChange:0 forOutputDevice:v55];
  }
  v56 = [v4 outputDeviceMute];

  if (v56)
  {
    v57 = [v4 outputDeviceMute];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10004FED4;
    v62[3] = &unk_100417968;
    id v63 = v4;
    v64 = self;
    [v57 enumerateKeysAndObjectsUsingBlock:v62];
  }
  v58 = [v4 isMuted];

  if (v58)
  {
    v59 = [v4 volume];
    id v60 = [v59 BOOLValue];

    v61 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v61 hostedExternalDeviceIsMutedDidChange:v60 forOutputDevice:0];
  }
}

- (void)_maybeWakeClient
{
  xpcClient = self->_xpcClient;
  if (!xpcClient)
  {
    id v4 = +[MRDMediaRemoteServer server];
    objc_msgSend(v4, "clientForPID:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
    objc_super v5 = (MRDMediaRemoteClient *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_xpcClient;
    self->_xpcClient = v5;

    xpcClient = self->_xpcClient;
  }
  id v7 = +[MRPlayerPath anyPlayerPath];
  unsigned int v8 = [(MRDMediaRemoteClient *)xpcClient notificationRequiresTaskAssertionForPlayerPath:v7];

  if (v8)
  {
    id v9 = self->_xpcClient;
    id v10 = +[MRUserSettings currentSettings];
    [v10 wakingPlayerPathAssertionDuration];
    -[MRDMediaRemoteClient takeAssertion:forReason:duration:](v9, "takeAssertion:forReason:duration:", 4, @"WakingPlayerPathNotification");
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)registeredCallbacks
{
  return self->_registeredCallbacks;
}

- (void)setRegisteredCallbacks:(unint64_t)a3
{
  self->_registeredCallbacks = a3;
}

- (unint64_t)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(unint64_t)a3
{
  self->_notifications = a3;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
}

- (MRDAVHostedExternalDevicePendingClientState)pendingClientState
{
  return self->_pendingClientState;
}

- (void)setPendingClientState:(id)a3
{
}

- (MRXPCConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (MRDMediaRemoteClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_pendingClientState, 0);
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_discoveryTokens, 0);
  objc_storeStrong((id *)&self->_connectionStateDate, 0);
  objc_storeStrong((id *)&self->_hasConnectionAttemptCompletedDate, 0);

  objc_storeStrong((id *)&self->_hasAttemptedToConnectDate, 0);
}

@end