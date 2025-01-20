@interface MRCompanionConnectionController
- (BOOL)_shouldAttemptToDiscoverAndConnectToCompanion;
- (MRAVEndpoint)companionEndpoint;
- (MRCompanionConnectionController)init;
- (MRCompanionConnectionControllerDelegate)delegate;
- (id)debugDescription;
- (void)_handleCompanionDeviceConnectedNotification:(id)a3;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_maybeAttemptToDiscoverAndConnectToCompanionWithReason:(id)a3;
- (void)setCompanionEndpoint:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRCompanionConnectionController

- (MRCompanionConnectionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRCompanionConnectionController;
  v2 = [(MRCompanionConnectionController *)&v7 init];
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0, 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100101E38;
    block[3] = &unk_100415CC8;
    v6 = v2;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

- (void)setCompanionEndpoint:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  p_companionEndpoint = &v6->_companionEndpoint;
  if (v6->_companionEndpoint)
  {
    v8 = _MRLogForCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v9 = *p_companionEndpoint;
    *(_DWORD *)buf = 138544130;
    CFStringRef v22 = @"MRDCompanionConnectionController";
    __int16 v23 = 2114;
    CFStringRef v24 = @"companionEndpoint";
    __int16 v25 = 2112;
    v26 = v9;
    __int16 v27 = 2112;
    id v28 = v5;
    v10 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    v11 = v8;
    uint32_t v12 = 42;
  }
  else
  {
    v8 = _MRLogForCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    CFStringRef v22 = @"MRDCompanionConnectionController";
    __int16 v23 = 2114;
    CFStringRef v24 = @"companionEndpoint";
    __int16 v25 = 2112;
    v26 = (MRAVEndpoint *)v5;
    v10 = "Set: %{public}@ setting %{public}@ to <%@>";
    v11 = v8;
    uint32_t v12 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  if (v5)
  {
    objc_storeStrong((id *)&v6->_companionEndpoint, a3);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001022BC;
    v17[3] = &unk_1004158D8;
    v17[4] = v6;
    id v18 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
  }
  else
  {
    v13 = +[MRIDSCompanionConnection sharedManager];
    unsigned int v14 = [v13 isConnected];

    if (v14)
    {
      dispatch_time_t v15 = dispatch_time(0, 30000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100102258;
      block[3] = &unk_100415CC8;
      void block[4] = v6;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    if (*p_companionEndpoint)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100102268;
      v19[3] = &unk_100415CC8;
      v19[4] = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);
    }
    v16 = *p_companionEndpoint;
    *p_companionEndpoint = 0;
  }
  objc_sync_exit(v6);
}

- (void)_handleCompanionDeviceConnectedNotification:(id)a3
{
}

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [v4 object];
  objc_super v7 = [(MRCompanionConnectionController *)v5 companionEndpoint];
  v8 = [v7 externalDevice];

  if (v8 == v6)
  {
    v9 = [v4 userInfo];
    v10 = [v9 objectForKeyedSubscript:kMRExternalDeviceConnectionStateUserInfoKey];
    unsigned int v11 = [v10 intValue];

    if (v11 == 3)
    {
      uint32_t v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_time_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRCompanionConnectionController] CompanionEndpoint disconnected because externalDevice connection state", v15, 2u);
      }

      v13 = (NSError *)[objc_alloc((Class)NSError) initWithMRError:104];
      lastConnectionAttemptError = v5->_lastConnectionAttemptError;
      v5->_lastConnectionAttemptError = v13;

      [(MRCompanionConnectionController *)v5 setCompanionEndpoint:0];
      [(MRCompanionConnectionController *)v5 _maybeAttemptToDiscoverAndConnectToCompanionWithReason:@"Reconnect"];
    }
  }

  objc_sync_exit(v5);
}

- (BOOL)_shouldAttemptToDiscoverAndConnectToCompanion
{
  dispatch_time_t v3 = +[MRIDSCompanionConnection sharedManager];
  if (![v3 isConnected])
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  companionEndpoint = self->_companionEndpoint;
  if (!companionEndpoint)
  {
    if (!self->_isDiscovering)
    {
      BOOL v7 = !self->_isConnecting;
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  id v5 = [(MRAVEndpoint *)companionEndpoint externalDevice];
  if (v5)
  {
    v6 = [(MRAVEndpoint *)self->_companionEndpoint externalDevice];
    BOOL v7 = [v6 connectionState] == 3 && !self->_isDiscovering && !self->_isConnecting;
  }
  else
  {
    BOOL v7 = !self->_isDiscovering && !self->_isConnecting;
  }

LABEL_16:
  return v7;
}

- (void)_maybeAttemptToDiscoverAndConnectToCompanionWithReason:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if ([(MRCompanionConnectionController *)v6 _shouldAttemptToDiscoverAndConnectToCompanion])
  {
    objc_storeStrong((id *)&v6->_lastConnectionAttemptReason, a3);
    uint64_t v7 = +[NSDate date];
    lastConnectionAttemptDate = v6->_lastConnectionAttemptDate;
    v6->_lastConnectionAttemptDate = (NSDate *)v7;

    lastConnectionAttemptError = v6->_lastConnectionAttemptError;
    v6->_lastConnectionAttemptError = 0;

    v6->_isDiscovering = 1;
    v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRCompanionConnectionController] Attempting to discover and connect to companion because <%@>", buf, 0xCu);
    }

    unsigned int v11 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Persistent Companion Connection: %@", v5];
    id v13 = &_dispatch_main_q;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001027B4;
    v14[3] = &unk_10041BC30;
    v14[4] = v6;
    id v15 = v5;
    [v11 searchEndpointsForCompanionWithTimeout:v12 reason:&_dispatch_main_q queue:v14 completion:30.0];
  }
  else
  {
    unsigned int v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10032ED9C((uint64_t)v5, v11);
    }
  }

  objc_sync_exit(v6);
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc((Class)NSMutableString);
  v12.receiver = v2;
  v12.super_class = (Class)MRCompanionConnectionController;
  id v4 = [(MRCompanionConnectionController *)&v12 description];
  id v5 = [v3 initWithFormat:@"%@\n { Endpoint = %@", v4, v2->_companionEndpoint];

  companionEndpoint = v2->_companionEndpoint;
  if (companionEndpoint)
  {
    uint64_t v7 = [(MRAVEndpoint *)companionEndpoint externalDevice];
    [v7 connectionState];
    v8 = (void *)MRExternalDeviceConnectionStateCopyDescription();
    [v5 appendFormat:@"\nExternalDevice = %@", v8];
  }
  if (v2->_isDiscovering) {
    [v5 appendFormat:@"\nisDiscovering=YES"];
  }
  if (v2->_isConnecting) {
    [v5 appendFormat:@"\nisConnecting=YES"];
  }
  if (v2->_lastConnectionAttemptReason) {
    [v5 appendFormat:@"\nConnection Reason = %@", v2->_lastConnectionAttemptReason];
  }
  if (v2->_lastConnectionAttemptDate)
  {
    v9 = +[NSDate date];
    [v9 timeIntervalSinceDate:v2->_lastConnectionAttemptDate];
    objc_msgSend(v5, "appendFormat:", @"\nConnection attempted <%lf> seconds ago", v10);
  }
  if (v2->_lastConnectionAttemptError) {
    [v5 appendFormat:@"\nCnnection error = %@", v2->_lastConnectionAttemptError];
  }
  objc_sync_exit(v2);

  return v5;
}

- (MRAVEndpoint)companionEndpoint
{
  return self->_companionEndpoint;
}

- (MRCompanionConnectionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MRCompanionConnectionControllerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionAttemptError, 0);
  objc_storeStrong((id *)&self->_lastConnectionAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastConnectionAttemptReason, 0);

  objc_storeStrong((id *)&self->_companionEndpoint, 0);
}

@end