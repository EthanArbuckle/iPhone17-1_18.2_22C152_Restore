@interface CarMetadataConnectionManager
- (BOOL)externalAccessoryIsNavigating;
- (CarMetadataConnectionManager)init;
- (void)_sendUpdates;
- (void)_setNeedsUpdateOfType:(unint64_t)a3;
- (void)navigationListener:(id)a3 didUpdateManeuvers:(id)a4 laneGuidances:(id)a5;
- (void)navigationListener:(id)a3 didUpdatePreconditioningInfo:(id)a4;
- (void)navigationListener:(id)a3 didUpdateRouteGuidance:(id)a4;
- (void)navigationOwnershipChangedToOwner:(unint64_t)a3;
- (void)releaseNavigationOwnership;
- (void)requestNavigationOwnership;
@end

@implementation CarMetadataConnectionManager

- (CarMetadataConnectionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarMetadataConnectionManager;
  v2 = [(CarMetadataConnectionManager *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CarMetadataConnectionManager.Queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = [[CarMetadataNavigationListener alloc] initWithDelegate:v2];
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = v6;

    id v8 = objc_alloc((Class)CPNavigationManager);
    v9 = +[NSBundle mainBundle];
    v10 = [v9 bundleIdentifier];
    v11 = (CPNavigationManager *)[v8 initWithIdentifier:v10 delegate:v2];
    carPlayService = v2->_carPlayService;
    v2->_carPlayService = v11;

    [(CPNavigationManager *)v2->_carPlayService setSupportsAccNav:1];
  }
  return v2;
}

- (void)requestNavigationOwnership
{
}

- (void)releaseNavigationOwnership
{
}

- (BOOL)externalAccessoryIsNavigating
{
  return [(CPNavigationManager *)self->_carPlayService owner] == (id)2;
}

- (void)_setNeedsUpdateOfType:(unint64_t)a3
{
  self->_pendingUpdateTypes |= a3;
  if (!self->_hasPendingUpdates)
  {
    self->_hasPendingUpdates = 1;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007161FC;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_sendUpdates
{
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100716834;
  v44[3] = &unk_1012F6678;
  v44[4] = self;
  v3 = objc_retainBlock(v44);
  int v4 = ((uint64_t (*)(void *, uint64_t))v3[2])(v3, 1);
  int v5 = ((uint64_t (*)(void *, uint64_t))v3[2])(v3, 2);
  int v6 = ((uint64_t (*)(void *, uint64_t))v3[2])(v3, 4);
  pendingRouteGuidance = self->_pendingRouteGuidance;
  if (pendingRouteGuidance && ![(CPRouteGuidance *)pendingRouteGuidance guidanceState]) {
    int v8 = 1;
  }
  else {
    int v8 = v5 | v6;
  }
  v9 = sub_100716848();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    v11 = v10;
    if (v4) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    v42 = v3;
    int v13 = v6;
    objc_super v14 = v12;
    if (v5) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    int v41 = v4;
    int v16 = v5;
    v17 = v15;
    if (v13) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    v19 = v18;
    *(_DWORD *)buf = 138413058;
    *(void *)v46 = v11;
    *(_WORD *)&v46[8] = 2112;
    *(void *)&v46[10] = v14;
    __int16 v47 = 2112;
    v48 = v17;
    __int16 v49 = 2112;
    v50 = v19;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will send new updates: shouldResetRouteGuidance: %@, shouldModifyRouteGuidance: %@, shouldUpdateManeuvers: %@, shouldUpdateLaneGuidance: %@", buf, 0x2Au);

    int v5 = v16;
    int v4 = v41;

    int v6 = v13;
    v3 = v42;
  }
  if (!v8)
  {
    if (!v4) {
      goto LABEL_21;
    }
LABEL_27:
    if (self->_pendingRouteGuidance)
    {
      v21 = sub_100716848();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = self->_pendingRouteGuidance;
        *(_DWORD *)buf = 138412290;
        *(void *)v46 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Modifying route guidance to: %@.", buf, 0xCu);
      }

      carPlayService = self->_carPlayService;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10071689C;
      v43[3] = &unk_1012F66A0;
      v43[4] = self;
      [(CPNavigationManager *)carPlayService modifyRouteGuidance:v43];
      if (v5) {
        goto LABEL_41;
      }
    }
    else
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)v46 = "-[CarMetadataConnectionManager _sendUpdates]";
        *(_WORD *)&v46[8] = 2080;
        *(void *)&v46[10] = "CarMetadataConnectionManager.m";
        __int16 v47 = 1024;
        LODWORD(v48) = 154;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v25 = sub_1005762E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)v46 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      v27 = sub_100716848();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Received a request to modify route guidance, but have no pending update. Ignoring", buf, 2u);
      }

      if (v5) {
        goto LABEL_41;
      }
    }
LABEL_22:
    if (!v6) {
      goto LABEL_52;
    }
    goto LABEL_44;
  }
  v20 = sub_100716848();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Resetting route guidance.", buf, 2u);
  }

  [(CPNavigationManager *)self->_carPlayService resetRouteGuidance];
  if (v4) {
    goto LABEL_27;
  }
LABEL_21:
  if (!v5) {
    goto LABEL_22;
  }
LABEL_41:
  v28 = sub_100716848();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [(NSArray *)self->_pendingManeuvers count];
    v30 = [(NSArray *)self->_pendingManeuvers valueForKey:@"_maps_description"];
    v31 = [v30 componentsJoinedByString:@"\n\n"];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v46 = v29;
    *(_WORD *)&v46[4] = 2112;
    *(void *)&v46[6] = v31;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Modifying to %d maneuvers:\n%@", buf, 0x12u);
  }
  [(CPNavigationManager *)self->_carPlayService setManeuvers:self->_pendingManeuvers];
  if (v6)
  {
LABEL_44:
    v32 = sub_100716848();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      pendingLaneGuidances = self->_pendingLaneGuidances;
      v34 = pendingLaneGuidances;
      v35 = v34;
      if (v34)
      {
        if ([(NSArray *)v34 count])
        {
          v36 = [(NSArray *)v35 componentsJoinedByString:@", "];
          v37 = +[NSString stringWithFormat:@"<%p> [%@]", v35, v36];
        }
        else
        {
          v37 = +[NSString stringWithFormat:@"<%p> (empty)", v35];
        }
      }
      else
      {
        v37 = @"<nil>";
      }

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v46 = pendingLaneGuidances;
      *(_WORD *)&v46[4] = 2112;
      *(void *)&v46[6] = v37;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Modifying to %d lane guidances: %@.", buf, 0x12u);
    }
    [(CPNavigationManager *)self->_carPlayService setLaneGuidances:self->_pendingLaneGuidances];
  }
LABEL_52:
  self->_hasPendingUpdates = 0;
  v38 = self->_pendingRouteGuidance;
  self->_pendingRouteGuidance = 0;

  pendingManeuvers = self->_pendingManeuvers;
  self->_pendingManeuvers = 0;

  v40 = self->_pendingLaneGuidances;
  self->_pendingLaneGuidances = 0;

  self->_pendingUpdateTypes = 0;
}

- (void)navigationListener:(id)a3 didUpdateRouteGuidance:(id)a4
{
  id v5 = a4;
  int v6 = sub_100716848();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    [v5 guidanceState];
    v7 = NSStringFromCPGuidanceState();
    *(_DWORD *)buf = 134218242;
    id v15 = v5;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "navigationListener:didUpdateRouteGuidance: <%p, state: %@>", buf, 0x16u);
  }
  id v8 = [v5 copy];

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100716D44;
  v11[3] = &unk_1012E6690;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)navigationListener:(id)a3 didUpdateManeuvers:(id)a4 laneGuidances:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_100716848();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    id v20 = [v7 count];
    __int16 v21 = 2048;
    id v22 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "navigationListener:didUpdateManeuvers:laneGuidances: maneuver count: %lu laneGuidance count: %lu", buf, 0x16u);
  }

  id v10 = [objc_alloc((Class)NSArray) initWithArray:v7 copyItems:1];
  id v11 = [objc_alloc((Class)NSArray) initWithArray:v8 copyItems:1];

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100716F78;
  block[3] = &unk_1012E9340;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)navigationListener:(id)a3 didUpdatePreconditioningInfo:(id)a4
{
  id v5 = a4;
  int v6 = sub_100716848();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "navigationListener:didUpdatePreconditioningInfo: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10071710C;
  v9[3] = &unk_1012E5D58;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  int v4 = sub_100015DB4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 >= 3)
    {
      int v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315650;
        id v10 = "NSString *NSStringFromCARNavigationOwner(CARNavigationOwner)";
        __int16 v11 = 2080;
        id v12 = "CarMetadataConnectionManager.m";
        __int16 v13 = 1024;
        int v14 = 41;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        id v7 = sub_1005762E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v8 = +[NSThread callStackSymbols];
          int v9 = 138412290;
          id v10 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
        }
      }
      id v5 = 0;
    }
    else
    {
      id v5 = off_1012F6700[a3];
    }
    int v9 = 138412290;
    id v10 = (const char *)v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Navigation owner changed to: %@", (uint8_t *)&v9, 0xCu);
  }

  if (a3 == 2) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1012F66C0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLaneGuidances, 0);
  objc_storeStrong((id *)&self->_pendingManeuvers, 0);
  objc_storeStrong((id *)&self->_pendingRouteGuidance, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_carPlayService, 0);
}

@end