@interface MRDRoutingContinuityManager
- (BOOL)shouldIgnorePredictedRoutesSync;
- (MRAVEndpoint)activeSystemEndpoint;
- (MRDRoutingContinuityManager)init;
- (MSVTimer)pausePredictedRoutesTimer;
- (id)_calculateDesiredPredictedRouteOutputDeviceUIDs;
- (void)_pausePredicatedRoutesSync;
- (void)_reevaluatePredictedRoutes;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setPausePredictedRoutesTimer:(id)a3;
- (void)setShouldIgnorePredictedRoutesSync:(BOOL)a3;
@end

@implementation MRDRoutingContinuityManager

- (MRDRoutingContinuityManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)MRDRoutingContinuityManager;
  v2 = [(MRDRoutingContinuityManager *)&v25 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = kMRMediaRemoteActiveSystemEndpointDidChangeNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100067D68;
    v23[3] = &unk_100418568;
    v5 = v2;
    v24 = v5;
    id v6 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v23];

    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = kMRDeviceInfoDidChangeNotification;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100067DFC;
    v21[3] = &unk_100418568;
    v9 = v5;
    v22 = v9;
    id v10 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v21];

    v11 = +[NSNotificationCenter defaultCenter];
    uint64_t v12 = MRAVOutputContextModificationRequestToClearPredictedRoutesNotifications;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100067E04;
    v19[3] = &unk_100418568;
    v13 = v9;
    v20 = v13;
    id v14 = [v11 addObserverForName:v12 object:0 queue:0 usingBlock:v19];

    v15 = +[MRDMediaRemoteServer server];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100067E60;
    v17[3] = &unk_100415CC8;
    v18 = v13;
    [v15 addMediaRemoteSeverStartedHandler:v17];
  }
  return v2;
}

- (void)setActiveSystemEndpoint:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_activeSystemEndpoint = (id *)&v6->_activeSystemEndpoint;
  activeSystemEndpoint = v6->_activeSystemEndpoint;
  v9 = (MRAVEndpoint *)v5;
  id v10 = activeSystemEndpoint;
  if (v10 == v9)
  {
  }
  else
  {
    v11 = v10;
    unsigned __int8 v12 = [(MRAVEndpoint *)v9 isEqual:v10];

    if ((v12 & 1) == 0)
    {
      if (v6->_endpointOutputDevicesDidChangeToken)
      {
        v13 = +[NSNotificationCenter defaultCenter];
        [v13 removeObserver:v6->_endpointOutputDevicesDidChangeToken];

        id endpointOutputDevicesDidChangeToken = v6->_endpointOutputDevicesDidChangeToken;
        v6->_id endpointOutputDevicesDidChangeToken = 0;
      }
      v15 = [*p_activeSystemEndpoint debugName];

      if (v15)
      {
        v16 = _MRLogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = [*p_activeSystemEndpoint debugName];
          v20 = [(MRAVEndpoint *)v9 debugName];
          *(_DWORD *)buf = 138544130;
          id v30 = v18;
          __int16 v31 = 2114;
          CFStringRef v32 = @"activeSystemEndpoint";
          __int16 v33 = 2112;
          v34 = v19;
          __int16 v35 = 2112;
          v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);
        }
      }
      else
      {
        v16 = _MRLogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          v23 = [(MRAVEndpoint *)v9 debugName];
          *(_DWORD *)buf = 138543874;
          id v30 = v22;
          __int16 v31 = 2114;
          CFStringRef v32 = @"activeSystemEndpoint";
          __int16 v33 = 2112;
          v34 = v23;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
        }
      }

      objc_storeStrong((id *)&v6->_activeSystemEndpoint, a3);
      if (*p_activeSystemEndpoint)
      {
        v24 = +[NSNotificationCenter defaultCenter];
        objc_super v25 = v6->_activeSystemEndpoint;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100068264;
        v28[3] = &unk_100418568;
        v28[4] = v6;
        uint64_t v26 = [v24 addObserverForName:MRAVEndpointOutputDevicesDidChangeNotification object:v25 queue:0 usingBlock:v28];
        id v27 = v6->_endpointOutputDevicesDidChangeToken;
        v6->_id endpointOutputDevicesDidChangeToken = (id)v26;
      }
      [(MRDRoutingContinuityManager *)v6 _reevaluatePredictedRoutes];
    }
  }
  objc_sync_exit(v6);
}

- (MRAVEndpoint)activeSystemEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeSystemEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (id)_calculateDesiredPredictedRouteOutputDeviceUIDs
{
  v3 = +[MRDMediaRemoteServer server];
  uint64_t v4 = [v3 deviceInfo];

  id v5 = MRTransactionPacket_ptr;
  id v6 = +[MRUserSettings currentSettings];
  if (![v6 supportTopologyHealing])
  {

    goto LABEL_11;
  }
  unsigned int v7 = [v4 isAirPlayActive];

  if (!v7)
  {
LABEL_11:
    id v21 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = [v4 leaderDeviceInfo];
  v9 = [v8 groupedDevices];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100068748;
  v44[3] = &unk_100418590;
  id v10 = v4;
  id v45 = v10;
  v11 = objc_msgSend(v9, "msv_compactMap:", v44);

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000687DC;
  v42[3] = &unk_1004185B8;
  id v12 = v10;
  id v43 = v12;
  v13 = sub_1000687DC((uint64_t)v42);
  if (v13 || [v11 count])
  {
    id v14 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    v15 = [v14 outputDevices];

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100068948;
    v40[3] = &unk_100417940;
    id v16 = v12;
    id v41 = v16;
    v17 = objc_msgSend(v15, "msv_firstWhere:", v40);

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000689CC;
    v38[3] = &unk_100417940;
    id v18 = v16;
    id v39 = v18;
    v19 = objc_msgSend(v15, "msv_firstWhere:", v38);

    v20 = objc_msgSend(v15, "msv_compactMap:", &stru_1004185D8);
    id v21 = objc_alloc_init((Class)NSMutableArray);
    if ([v18 supportsTwoHop])
    {
      [v21 addObjectsFromArray:v11];
      if (v13) {
        [v21 addObject:v13];
      }
      if (v17)
      {
        [v21 addObjectsFromArray:v20];
      }
      else
      {
        v23 = [v18 deviceUID];
        [v21 addObject:v23];
      }
      id v5 = MRTransactionPacket_ptr;
    }
    else
    {
      id v5 = MRTransactionPacket_ptr;
      if (!v19)
      {
        [v21 addObjectsFromArray:v11];
        if (v13) {
          [v21 addObject:v13];
        }
        id v22 = [v18 deviceUID];
        [v21 addObject:v22];
      }
    }
  }
  else
  {
    id v21 = 0;
  }

LABEL_20:
  v24 = [v5[8] currentSettings];
  unsigned int v25 = [v24 supportRoutingContinuity];

  if (v25)
  {
    uint64_t v26 = [(MRDRoutingContinuityManager *)self activeSystemEndpoint];
    unsigned __int8 v27 = [v26 isLocalEndpoint];

    if ((v27 & 1) == 0)
    {
      v28 = [(MRDRoutingContinuityManager *)self activeSystemEndpoint];
      v29 = [v28 resolvedOutputDevices];
      __int16 v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      __int16 v35 = sub_100068A38;
      v36 = &unk_100417940;
      id v37 = v4;
      id v30 = objc_msgSend(v29, "msv_filter:", &v33);
      uint64_t v31 = objc_msgSend(v30, "msv_compactMap:", &stru_1004185F8, v33, v34, v35, v36);

      id v21 = (id)v31;
    }
  }

  return v21;
}

- (void)_reevaluatePredictedRoutes
{
  if (![(MRDRoutingContinuityManager *)self shouldIgnorePredictedRoutesSync])
  {
    v3 = [(MRDRoutingContinuityManager *)self _calculateDesiredPredictedRouteOutputDeviceUIDs];
    id v4 = objc_alloc((Class)NSSet);
    id v5 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    id v6 = [v5 predictedOutputDeviceUIDs];
    id v7 = [v4 initWithArray:v6];

    id v8 = [objc_alloc((Class)NSSet) initWithArray:v3];
    if (v7 == v8)
    {
    }
    else
    {
      unsigned __int8 v9 = [v7 isEqual:v8];

      if ((v9 & 1) == 0)
      {
        id v10 = objc_alloc((Class)MRRequestDetails);
        v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        id v13 = [v10 initWithName:@"Set predicted routes when being airplayed to by a group" requestID:0 reason:v12];

        id v14 = [objc_alloc((Class)MRGroupTopologyModificationRequest) initWithRequestDetails:v13 type:3 outputDeviceUIDs:v3];
        [v14 setShouldModifyPredictedRoutes:1];
        v15 = +[MRAVLocalEndpoint sharedLocalEndpoint];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100068C94;
        v17[3] = &unk_100415F80;
        id v18 = v13;
        id v16 = v13;
        [v15 modifyTopologyWithRequest:v14 withReplyQueue:&_dispatch_main_q completion:v17];
      }
    }
  }
}

- (void)_pausePredicatedRoutesSync
{
  v3 = MRLogCategoryDiscovery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = 0x4024000000000000;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDRoutingContinuityManager] Pausing PredictedRoutesSync for %lf seconds...", buf, 0xCu);
  }

  id v4 = self;
  objc_sync_enter(v4);
  id v5 = objc_alloc((Class)MSVTimer);
  id v6 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100068EDC;
  v8[3] = &unk_100415CC8;
  v8[4] = v4;
  id v7 = [v5 initWithInterval:&_dispatch_main_q queue:v8 block:10.0];
  [(MRDRoutingContinuityManager *)v4 setPausePredictedRoutesTimer:v7];

  objc_sync_exit(v4);
}

- (void)setPausePredictedRoutesTimer:(id)a3
{
  id v4 = (MSVTimer *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  pausePredictedRoutesTimer = v5->_pausePredictedRoutesTimer;
  v5->_pausePredictedRoutesTimer = v4;

  objc_sync_exit(v5);

  [(MRDRoutingContinuityManager *)v5 _reevaluatePredictedRoutes];
}

- (MSVTimer)pausePredictedRoutesTimer
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pausePredictedRoutesTimer;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)shouldIgnorePredictedRoutesSync
{
  v2 = [(MRDRoutingContinuityManager *)self pausePredictedRoutesTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setShouldIgnorePredictedRoutesSync:(BOOL)a3
{
  self->_shouldIgnorePredictedRoutesSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausePredictedRoutesTimer, 0);
  objc_storeStrong(&self->_endpointOutputDevicesDidChangeToken, 0);

  objc_storeStrong((id *)&self->_activeSystemEndpoint, 0);
}

@end