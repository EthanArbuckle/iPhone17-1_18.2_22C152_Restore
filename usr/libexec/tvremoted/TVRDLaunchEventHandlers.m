@interface TVRDLaunchEventHandlers
+ (id)sharedInstance;
- (BOOL)requestedModuleEnablement;
- (void)_enableTVRemoteControlCenterModule;
- (void)_setupDistnotedHandlers;
- (void)_setupNotificationHandlers;
- (void)_setupNotifydHandlers;
- (void)setRequestedModuleEnablement:(BOOL)a3;
- (void)setupHandlers;
@end

@implementation TVRDLaunchEventHandlers

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

void __41__TVRDLaunchEventHandlers_sharedInstance__block_invoke(id a1)
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(TVRDLaunchEventHandlers);

  _objc_release_x1();
}

- (void)setupHandlers
{
  [(TVRDLaunchEventHandlers *)self _setupNotifydHandlers];
  [(TVRDLaunchEventHandlers *)self _setupDistnotedHandlers];

  [(TVRDLaunchEventHandlers *)self _setupNotificationHandlers];
}

- (void)_setupNotificationHandlers
{
  v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up NSNotification handlers", v5, 2u);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_enableTVRemoteControlCenterModule" name:TVRXManagedConfigManagerTVRemoteAllowedTVAdded object:0];
}

- (void)_setupDistnotedHandlers
{
  v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up com.apple.distnoted.matching handlers", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke;
  handler[3] = &unk_10001C770;
  objc_copyWeak(&v6, buf);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string && !strcmp("tvremote.applicationRegistered", string))
  {
    v5 = _TVRDXPCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received an application registered LaunchEvent", buf, 2u);
    }

    id v6 = xpc_dictionary_get_value(v3, "UserInfo");
    v7 = v6;
    if (!v6 || xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_23;
    }
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v9 = v8;
    if (!v8)
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    v10 = [v8 objectForKeyedSubscript:@"bundleIDs"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      WeakRetained = _TVRDXPCLog();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
        __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke_cold_1(WeakRetained);
      }
      goto LABEL_20;
    }
    v11 = [v9 objectForKeyedSubscript:@"isPlaceholder"];
    unsigned __int8 v12 = [v11 BOOLValue];

    if ((v12 & 1) == 0)
    {
      if ([v10 containsObject:@"com.apple.TVRemote"])
      {
        v13 = _TVRDXPCLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = 0;
          v14 = "TVRemote application registered";
          v15 = (uint8_t *)&v18;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if ([v10 containsObject:@"com.apple.Remote"])
      {
        v13 = _TVRDXPCLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = 0;
          v14 = "iTunes Remote application registered";
          v15 = (uint8_t *)&v17;
          goto LABEL_18;
        }
LABEL_19:

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        [WeakRetained _enableTVRemoteControlCenterModule];
LABEL_20:
      }
    }

    goto LABEL_22;
  }
LABEL_24:
}

- (void)_setupNotifydHandlers
{
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up com.apple.notifyd.matching handlers", buf, 2u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __48__TVRDLaunchEventHandlers__setupNotifydHandlers__block_invoke;
  handler[3] = &unk_10001C798;
  void handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

void __48__TVRDLaunchEventHandlers__setupNotifydHandlers__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    id v4 = string;
    if (!strcmp("tvremote.TapToSetupUsed", string))
    {
      unsigned __int8 v12 = _TVRDXPCLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received tvremote.TapToSetupUsed LaunchEvent", v24, 2u);
      }

      CFPropertyListRef v13 = CFPreferencesCopyValue(@"atvSetupCompleted", @"com.apple.Sharing", @"mobile", kCFPreferencesCurrentHost);
      if (v13)
      {
        v14 = v13;
        BOOL v15 = CFGetInt64() != 0;
        CFRelease(v14);
      }
      else
      {
        BOOL v15 = 0;
      }
      v16 = _TVRDXPCLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 67109120;
        *(_DWORD *)&v24[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Value for atvSetupCompleted is %d", v24, 8u);
      }

      if (v15) {
        goto LABEL_37;
      }
    }
    else
    {
      if (!strcmp("tvremote.ContinuityKeyBoardEnabled", v4))
      {
        v9 = _TVRDXPCLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          v11 = "Received tvremote.ContinuityKeyBoardEnabled LaunchEvent";
          goto LABEL_22;
        }
LABEL_23:

LABEL_37:
        [*(id *)(a1 + 32) _enableTVRemoteControlCenterModule:*(void *)v24];
        return;
      }
      if (!strcmp("tvremote.connectionRequested", v4))
      {
        v9 = _TVRDXPCLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          v11 = "Received tvremote.connectionRequested LaunchEvent";
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      if (!strcmp("tvremote.dataMigrationFinished", v4))
      {
        __int16 v18 = _TVRDXPCLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received tvremote.dataMigrationFinished LaunchEvent", v24, 2u);
        }

        v19 = +[LSApplicationWorkspace defaultWorkspace];
        unsigned int v20 = [v19 applicationIsInstalled:@"com.apple.TVRemote"];

        v21 = +[LSApplicationWorkspace defaultWorkspace];
        unsigned int v22 = [v21 applicationIsInstalled:@"com.apple.Remote"];

        v23 = _TVRDXPCLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v24 = 67109376;
          *(_DWORD *)&v24[4] = v20;
          *(_WORD *)&v24[8] = 1024;
          *(_DWORD *)&v24[10] = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Value for remoteAppInstalled is %d, iTunesRemoteAppInstalled is %d", v24, 0xEu);
        }

        if ((v20 | v22) == 1) {
          goto LABEL_37;
        }
      }
      else
      {
        if (!strcmp("tvremote.airplayTVAdded", v4) || !strcmp("tvremote.appleTVAdded", v4))
        {
          __int16 v17 = _TVRDXPCLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v24 = 136315138;
            *(void *)&v24[4] = v4;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received %s LaunchEvent", v24, 0xCu);
          }

          goto LABEL_37;
        }
        if (strcmp("tvremote.mdmProfileInstalled", v4)) {
          return;
        }
        v5 = _TVRDXPCLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v24 = 136315138;
          *(void *)&v24[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received %s LaunchEvent", v24, 0xCu);
        }

        id v6 = +[TVRXManagedConfigManager sharedInstance];
        [v6 refreshState];

        v7 = +[TVRXManagedConfigManager sharedInstance];
        unsigned int v8 = [v7 isManagedConfigProfileInstalled];

        v9 = _TVRDXPCLog();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v10)
          {
            *(_WORD *)v24 = 0;
            v11 = "MDM Profile installed with MCFeatureTVRemoteAllowedTVs";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, v24, 2u);
            goto LABEL_23;
          }
          goto LABEL_23;
        }
        if (v10)
        {
          *(_WORD *)v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MDM Profile installed but did not include MCFeatureTVRemoteAllowedTVs", v24, 2u);
        }
      }
    }
  }
}

- (void)_enableTVRemoteControlCenterModule
{
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling TVRemote module if necessary", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke;
  block[3] = &unk_10001C7E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) requestedModuleEnablement];
  id v3 = _TVRDXPCLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "There is an existing request to enable TVRemote CC module in progress. Ignoring this request", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client requested enabling TVRemote module in Control Center", buf, 2u);
  }

  if (GestaltGetDeviceClass() == 3)
  {
    v5 = [objc_alloc((Class)CCSIconElementRequest) initWithIntent:2 moduleIdentifier:@"com.apple.control-center.AppleTVRemoteModule" containerBundleIdentifier:@"com.apple.TVRemoteUIService" moduleSize:0];
  }
  else
  {
    if (GestaltGetDeviceClass() != 1) {
      return;
    }
    v5 = [objc_alloc((Class)CCSIconElementRequest) initWithIntent:2 controlKind:@"com.apple.TVRemoteUIService.widget.button" controlType:2 extensionBundleIdentifier:@"com.apple.TVRemoteUIService.TVRemoteWidget" containerBundleIdentifier:@"com.apple.TVRemoteUIService" size:0];
  }
  id v3 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) setRequestedModuleEnablement:1];
    id v6 = +[CCSControlCenterService sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_56;
    v7[3] = &unk_10001C7C0;
    v7[4] = *(void *)(a1 + 32);
    [v6 handleIconElementRequest:v3 completionHandler:v7];

LABEL_12:
  }
}

void __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_56(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    v7 = _TVRDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      unsigned int v8 = "Successfully added TVRemote module to Control Center";
      v9 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    id v10 = [v5 code];
    v11 = _TVRDXPCLog();
    v7 = v11;
    if (v10 == (id)5)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        unsigned int v8 = "TVRemote module already exists in Control Center";
        v9 = (uint8_t *)&v12;
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_56_cold_1((uint64_t)v6, v7);
    }
  }

  [*(id *)(a1 + 32) setRequestedModuleEnablement:0];
}

- (BOOL)requestedModuleEnablement
{
  return self->_requestedModuleEnablement;
}

- (void)setRequestedModuleEnablement:(BOOL)a3
{
  self->_requestedModuleEnablement = a3;
}

void __50__TVRDLaunchEventHandlers__setupDistnotedHandlers__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "bundleIDs is not an NSArray", v1, 2u);
}

void __61__TVRDLaunchEventHandlers__enableTVRemoteControlCenterModule__block_invoke_56_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add TVRemote module to Control Center %{public}@", (uint8_t *)&v2, 0xCu);
}

@end