@interface AutomaticVehicleSelectionTask
+ (int64_t)creationPreference;
- (AutomaticVehicleSelectionTask)initWithPlatformController:(id)a3;
- (BOOL)_isAccessoryCarPlayConnected:(id)a3;
- (id)_vehicleForIdentifier:(id)a3;
- (void)_handleAccessoryConnect:(id)a3;
- (void)_handleAccessoryDisconnect:(id)a3;
- (void)_selectVehicleAndForceRerouteIfNeeded:(id)a3;
- (void)_updateGarage:(id)a3;
- (void)_updateVehicleSelectionIfNeeded;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
@end

@implementation AutomaticVehicleSelectionTask

- (void)_updateGarage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051830;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateVehicleSelectionIfNeeded
{
  if ((GEOConfigGetBOOL() & 1) != 0 || (GEOConfigGetBOOL() & 1) == 0)
  {
    id v7 = sub_1000519B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "AutomaticVehicleSelectionTask: ignoring callback because vehicle deselection is disabled";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v3 = +[EAAccessoryManager sharedAccessoryManager];
    id v4 = [v3 connectedAccessories];

    id v5 = [v4 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v5)
    {
      id v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v32;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([(AutomaticVehicleSelectionTask *)self _isAccessoryCarPlayConnected:v10])
          {
            uint64_t v11 = [v10 serialNumber];

            id v7 = v11;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    if (GEOConfigGetBOOL()) {
      BOOL v13 = v7 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {

      id v7 = @"CarDisplaySim";
      goto LABEL_25;
    }
    if (v7)
    {
LABEL_25:
      v14 = [(AutomaticVehicleSelectionTask *)self _vehicleForIdentifier:v7];
      v15 = [v14 identifier];
      if (v15)
      {
      }
      else
      {
        v16 = [(VGVirtualGarage *)self->_garage selectedVehicle];
        v17 = [v16 identifier];

        if (!v17)
        {
          v22 = sub_1000519B4();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v7;
            v30 = "AutomaticVehicleSelectionTask: user connected to CarPlay and the head unit (%@) does not match any sav"
                  "ed vehicles, no vehicle is selected at the moment so we can safely ignore this call.";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
          }
LABEL_42:

LABEL_47:
          goto LABEL_48;
        }
      }
      v18 = [v14 identifier];
      v19 = [(VGVirtualGarage *)self->_garage selectedVehicle];
      v20 = [v19 identifier];
      unsigned int v21 = [v18 isEqualToString:v20];

      if (v21)
      {
        v22 = sub_1000519B4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [v14 displayName];
          *(_DWORD *)buf = 138412546;
          v36 = v7;
          __int16 v37 = 2112;
          v38 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: user connected to a head unit (%@) and its underlying vehicle (%@) is already selected. Ignoring this call.", buf, 0x16u);
        }
        goto LABEL_42;
      }
      if (!self->_isNavigating || (GEOConfigGetBOOL() & 1) != 0)
      {
        v24 = sub_1000519B4();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v25)
          {
            v26 = [v14 identifier];
            v27 = [v14 displayName];
            *(_DWORD *)buf = 138412802;
            v36 = v7;
            __int16 v37 = 2112;
            v38 = v26;
            __int16 v39 = 2112;
            v40 = v27;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: user connected to CarPlay HU (%@) that is paired or disambiguated to vehicle: <%@, %@>. We'll select it automatically.", buf, 0x20u);
          }
          v28 = self;
          v29 = v14;
        }
        else
        {
          if (v25)
          {
            *(_DWORD *)buf = 138412290;
            v36 = v7;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: user connected to CarPlay (identifier: %@) but there is no associated vehicle for this head unit. It is either a new vehicle that was not yet disambiguated or a nonEV -> we'll deselect the currently selected vehicle", buf, 0xCu);
          }

          v28 = self;
          v29 = 0;
        }
        [(AutomaticVehicleSelectionTask *)v28 _selectVehicleAndForceRerouteIfNeeded:v29];
        goto LABEL_47;
      }
      v22 = sub_1000519B4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        v30 = "AutomaticVehicleSelectionTask: user is navigating and EVRoutingShouldSelectVehiclesDuringNavigation is dis"
              "abled so we'll ignore connection to a HU: %@";
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    id v7 = sub_1000519B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "AutomaticVehicleSelectionTask: we have disconnected from CarPlay (there was no accessory that supports CarPl"
            "ay and has a serialNumber), but we will keep the current selection.";
      goto LABEL_15;
    }
  }
LABEL_48:
}

- (AutomaticVehicleSelectionTask)initWithPlatformController:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AutomaticVehicleSelectionTask;
  id v5 = [(AutomaticVehicleSelectionTask *)&v19 init];
  if (v5)
  {
    [v4 addObserver:v5];
    id v6 = [v4 currentSession];
    objc_opt_class();
    v5->_isNavigating = objc_opt_isKindOfClass() & 1;

    id v7 = +[VGVirtualGarageService sharedService];
    [v7 registerObserver:v5];

    objc_initWeak(&location, v5);
    uint64_t v8 = +[VGVirtualGarageService sharedService];
    BOOL v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_10002097C;
    v16 = &unk_1012E65A8;
    objc_copyWeak(&v17, &location);
    [v8 virtualGarageGetGarageWithReply:&v13];

    v9 = +[EAAccessoryManager sharedAccessoryManager];
    [v9 registerForLocalNotifications];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"_handleAccessoryConnect:" name:EAAccessoryDidConnectNotification object:0];

    uint64_t v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v5 selector:"_handleAccessoryDisconnect:" name:EAAccessoryDidDisconnectNotification object:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)_selectVehicleAndForceRerouteIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000519B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 displayName];
    if (self->_isNavigating) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    uint64_t v8 = v7;
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AutomaticVehicleSelectionTask: will select vehicle: %@ and forceReroute: %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = +[VGVirtualGarageService sharedService];
  [v9 virtualGarageSelectVehicle:v4];

  if (self->_isNavigating)
  {
    v10 = +[MNNavigationService sharedService];
    [v10 forceReroute];
  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  self->_isNavigating = isKindOfClass & 1;
}

- (void)_handleAccessoryConnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000519B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AutomaticVehicleSelectionTask: _handleAccessoryConnect: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006A4FA0;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_handleAccessoryDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000519B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AutomaticVehicleSelectionTask: _handleAccessoryDisconnect: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006A511C;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (id)_vehicleForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(VGVirtualGarage *)self->_garage vehicles];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 iapIdentifier];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_isAccessoryCarPlayConnected:(id)a3
{
  id v3 = a3;
  if (([v3 supportsCarPlay] & 1) != 0
    || ([v3 supportsWirelessCarPlay] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 supportsUSBCarPlay];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end