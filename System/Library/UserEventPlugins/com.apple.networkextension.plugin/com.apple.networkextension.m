void NENetworkRelayMonitorStart()
{
  NSObject *v0;
  id v1;
  uint8_t v2[16];

  v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_DEFAULT, "starting networkrelay monitor", v2, 2u);
  }

  v1 = +[NRLaunchEventMonitor copySharedMonitor];
  [v1 start];
}

id sub_4678()
{
  self;
  if (qword_8A98 != -1) {
    dispatch_once(&qword_8A98, &stru_8340);
  }
  v0 = (void *)qword_8A90;

  return v0;
}

void sub_46D0(id a1)
{
  qword_8A90 = objc_alloc_init(NEUserEventAgentNetworkDetection);

  _objc_release_x1();
}

void sub_470C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  val = sub_4678();
  if (val) {
    BOOL v6 = a1 == 1;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    val[3] = a2;
    if (xpc_dictionary_get_BOOL(v5, "init"))
    {
      v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Registering for notifications and initializing nehelper", buf, 2u);
      }

      sub_4880(val);
    }
  }
}

void sub_4880(id val)
{
  int out_token = -1;
  objc_initWeak(&location, val);
  xpc_event_provider_get_queue();
}

void sub_4A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4A68(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    int64_t v3 = a2;
    switch(a2)
    {
      case 0u:
        if (ne_session_on_demand_configs_present() & 1) != 0 || (ne_session_always_on_vpn_configs_present()) {
          goto LABEL_37;
        }
        v4 = ne_log_obj();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v15 = inputNotification2String();
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Not generating a %s event because no configurations are present that need to react to network changes", buf, 0xCu);
        }
        goto LABEL_45;
      case 1u:
        if ((ne_session_on_demand_configs_present() & 1) != 0
          || (ne_session_content_filter_configs_present() & 1) != 0
          || (ne_session_always_on_vpn_configs_present() & 1) != 0
          || (ne_session_dns_proxy_configs_present() & 1) != 0
          || (ne_session_dns_settings_configs_present() & 1) != 0
          || (ne_session_path_controller_configs_present() & 1) != 0
          || (ne_session_app_vpn_configs_present() & 1) != 0
          || (ne_session_local_communication_configs_present() & 1) != 0
          || (ne_session_relay_configs_present() & 1) != 0)
        {
          char v5 = 1;
          goto LABEL_18;
        }
        if (*(unsigned char *)(a1 + 8))
        {
          char v5 = 0;
LABEL_18:
          *(unsigned char *)(a1 + 8) = v5;
          int v6 = ne_session_vod_evaluate_connection_present();
          v7 = *(NSObject **)(a1 + 48);
          if (v6)
          {
            if (!v7) {
              xpc_event_provider_get_queue();
            }
          }
          else if (v7)
          {
            dispatch_source_cancel(v7);
            v10 = *(void **)(a1 + 48);
            *(void *)(a1 + 48) = 0;
          }
LABEL_37:
          v11 = ne_log_obj();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v15 = inputNotification2String();
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Generating a %s event", buf, 0xCu);
          }

          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_int64(v12, "network-origin-notification", v3);
          xpc_event_provider_token_fire();
        }
        v4 = ne_log_obj();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v15 = inputNotification2String();
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Not generating a %s event because no configurations are present that need active sessions", buf, 0xCu);
        }
LABEL_45:

        break;
      case 2u:
        if (ne_session_always_on_vpn_configs_present() & 1) != 0 || (ne_session_dns_proxy_configs_present()) {
          goto LABEL_37;
        }
        v4 = ne_log_obj();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v15 = inputNotification2String();
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Not generating a %s event because no configurations are present that need to react to changes in the installed captive network plugins", buf, 0xCu);
        }
        goto LABEL_45;
      case 4u:
        sub_5C10();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          id v8 = v13;
          objc_sync_enter(v8);
          v9 = ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Current NE file handles: ", buf, 2u);
          }

          [v8 iterateFileHandlesWithBlock:&stru_84E8];
          objc_sync_exit(v8);
        }

        return;
      case 6u:
        if (!ne_session_vod_evaluate_connection_present()) {
          return;
        }
        goto LABEL_37;
      default:
        goto LABEL_37;
    }
  }
}

void sub_4EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_4EEC(uint64_t a1)
{
  return sub_4A68(*(void *)(a1 + 32), 6);
}

void sub_4EF8(uint64_t a1)
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136315138;
    uint64_t v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Received notification %s", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_4A68((uint64_t)WeakRetained, *(_DWORD *)(a1 + 48));
}

void sub_4FB8(uint64_t a1)
{
}

void sub_4FC4(id a1)
{
  qword_8AA0 = objc_alloc_init(NEUserEventAgentNetworkBlockedObserver);

  _objc_release_x1();
}

void sub_5000(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Got local network blocked notification: pid: %@, uuid: %@, bundle_id: %@", buf, 0x20u);
  }

  if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_string)
  {
    v11 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v9)];
    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
    v11 = 0;
    if (!v7) {
      goto LABEL_9;
    }
  }
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_uint64)
  {
    uint64_t value = xpc_uint64_get_value(v7);
    if (v8
      && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_uuid
      && (bytes = xpc_uuid_get_bytes(v8),
          uint64_t v33 = 0,
          memset(buf, 0, sizeof(buf)),
          proc_pidinfo(value, 17, 1uLL, buf, 56) == 56)
      && uuid_compare(bytes, buf))
    {
      memset(out, 0, sizeof(out));
      uuid_unparse(bytes, out);
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v27 = 67109378;
        int v28 = value;
        __int16 v29 = 2080;
        v30 = out;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "LocalNetwork: PID %u does not match UUID %s, is delegating traffic", v27, 0x12u);
      }
    }
    else
    {
      uint64_t v15 = (void *)NECopySigningIdentifierForPID();
      if (v15)
      {
        v16 = ne_log_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v15;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "LocalNetwork: found bundle id %@ by PID", buf, 0xCu);
        }

        v17 = v15;
        v11 = v17;
      }

      if (!v8) {
        goto LABEL_24;
      }
    }
    goto LABEL_23;
  }
LABEL_9:
  uint64_t value = 0;
  if (!v8) {
    goto LABEL_24;
  }
LABEL_23:
  if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_uuid)
  {
LABEL_24:
    id v18 = 0;
    goto LABEL_34;
  }
  v19 = xpc_uuid_get_bytes(v8);
  memset(buf, 0, 37);
  uuid_unparse(v19, (char *)buf);
  id v18 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v19];
  v20 = (void *)NEHelperCacheCopySigningIdentifierMapping();
  v21 = v20;
  if (v20 && xpc_get_type(v20) == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v23 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v21)];
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uuid_string_t out = 138412546;
      *(void *)&out[4] = v23;
      *(_WORD *)&out[12] = 2080;
      *(void *)&out[14] = buf;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "LocalNetwork: found bundle id %@ by UUID %s", (uint8_t *)out, 0x16u);
    }

    v22 = v11;
  }
  else
  {
    v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uuid_string_t out = 136315138;
      *(void *)&out[4] = buf;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "LocalNetwork: did not find bundle ID for UUID %s", (uint8_t *)out, 0xCu);
    }
    uint64_t v23 = (uint64_t)v11;
  }

  v11 = v23;
LABEL_34:
  v25 = ne_log_obj();
  v26 = v25;
  if (v11)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Found bundle ID: %@", buf, 0xCu);
    }

    v26 = +[NEConfigurationManager sharedManager];
    [v26 showLocalNetworkAlertForApp:v11 pid:value uuid:v18 query:0 hasEntitlement:0 completionQueue:*(void *)(a1 + 32) handler:&stru_83C8];
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "Failed to find bundle ID, ignoring", buf, 2u);
  }
}

void sub_5524(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Prompt response says: %u", (uint8_t *)v4, 8u);
  }
}

void init_networkextension()
{
  v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_DEFAULT, "Initializing NetworkExtension event agent plugin", buf, 2u);
  }
  int out_token = -1;
  uint32_t v1 = notify_register_check("com.apple.networkextension.disable-restrictions", &out_token);
  if (v1)
  {
    uint32_t v2 = v1;
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "com.apple.networkextension.disable-restrictions";
      __int16 v16 = 1024;
      uint32_t v17 = v2;
      _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }
  int out_token = -1;
  uint32_t v4 = notify_register_check("com.apple.networkextension.fallback-default", &out_token);
  if (v4)
  {
    uint32_t v5 = v4;
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "com.apple.networkextension.fallback-default";
      __int16 v16 = 1024;
      uint32_t v17 = v5;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }
  int out_token = -1;
  uint32_t v7 = notify_register_check("com.apple.networkextension.disable-nexus", &out_token);
  if (v7)
  {
    uint32_t v8 = v7;
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "com.apple.networkextension.disable-nexus";
      __int16 v16 = 1024;
      uint32_t v17 = v8;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }
  int out_token = -1;
  uint32_t v10 = notify_register_check("com.apple.networkextension.uuidcache", &out_token);
  if (v10)
  {
    uint32_t v11 = v10;
    xpc_object_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "com.apple.networkextension.uuidcache";
      __int16 v16 = 1024;
      uint32_t v17 = v11;
      _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification: %u", buf, 0x12u);
    }
  }
  NEUserEventAgentNetworkDetectionStart();
  NEFileHandleMaintainerStart();
  NENetworkRelayMonitorStart();
  NEUserEventAgentNetworkBlockedObserverStart();
}

void NEFileHandleMaintainerStart()
{
  sub_5C10();
  if (objc_claimAutoreleasedReturnValue())
  {
    v0 = @"com.apple.networkextension.file-descriptor-maintainer";
    uint32_t v1 = @"com.apple.networkextension.file-descriptor-maintainer";
    [@"com.apple.networkextension.file-descriptor-maintainer" UTF8String];
    xpc_event_provider_create();
  }
}

void NEUserEventAgentNetworkDetectionStart()
{
  sub_4678();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = @"com.apple.networkextension.network-detection";
  if (v2)
  {
    uint32_t v1 = @"com.apple.networkextension.network-detection";
    [@"com.apple.networkextension.network-detection" UTF8String];
    xpc_event_provider_create();
  }
}

void NEUserEventAgentNetworkBlockedObserverStart()
{
  self;
  if (qword_8AA8 != -1) {
    dispatch_once(&qword_8AA8, &stru_8388);
  }
  uint32_t v4 = (id)qword_8AA0;
  if (v4)
  {
    v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v1 = dispatch_queue_create("NEUserEventAgentNetworkBlockedObserver", v0);

    id v2 = +[NEConfigurationManager sharedManager];
    [v2 repopulateNetworkPrivacyConfigurationResetAll:0];

    uint64_t v3 = v1;
    v4[1] = network_config_local_network_blocked_observer_create();
  }
}

id sub_5C10()
{
  self;
  if (qword_8AB8 != -1) {
    dispatch_once(&qword_8AB8, &stru_8430);
  }
  v0 = (void *)qword_8AB0;

  return v0;
}

void sub_5C68(id a1)
{
  qword_8AB0 = objc_alloc_init(NEUserEventAgentFileHandleMaintainer);

  _objc_release_x1();
}

void sub_5CA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  sub_5C10();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v11)
  {
    id v7 = v11;
    objc_sync_enter(v7);
    uint32_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = a1;
      __int16 v14 = 2048;
      uint64_t v15 = a2;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "File Handle Maintainer got a %ld action with token %llu", buf, 0x16u);
    }

    if (a1 == 1)
    {
      *((void *)v7 + 3) = a2;
      int int64 = xpc_dictionary_get_int64(v6, "nesm-pid");
      if (int64 >= 1)
      {
        uint32_t v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = int64;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Got nesessionmanager pid %d", buf, 8u);
        }

        sub_5EAC((uint64_t)v7, int64);
        sub_6210(v7);
      }
      [v7 resetFileHandlesFromEvent:v6];
      sub_62F0(v7);
      *((unsigned char *)v7 + 8) = 1;
    }
    objc_sync_exit(v7);
  }
}

void sub_5E88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5EAC(uint64_t a1, int a2)
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 32);
    if (v4
      && (id v5 = v4, handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32)), v5, handle == a2))
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Not setting the PID state because the PID didn't change", buf, 2u);
      }
    }
    else
    {
      if (*(_DWORD *)(a1 + 12) == -1 && notify_register_check("com.apple.nesessionmanager", (int *)(a1 + 12)))
      {
        uint32_t v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "com.apple.nesessionmanager";
          _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification", buf, 0xCu);
        }

        *(_DWORD *)(a1 + 12) = -1;
      }
      int v9 = *(_DWORD *)(a1 + 12);
      if (v9 != -1)
      {
        uint32_t v10 = notify_set_state(v9, a2);
        if (v10)
        {
          uint32_t v11 = v10;
          xpc_object_t v12 = ne_log_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "com.apple.nesessionmanager";
            __int16 v20 = 1024;
            uint32_t v21 = v11;
            _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to set the %s notification state: %u", buf, 0x12u);
          }

          notify_cancel(*(_DWORD *)(a1 + 12));
          *(_DWORD *)(a1 + 12) = -1;
        }
      }
      uint32_t v13 = notify_post("com.apple.nesessionmanager");
      if (v13)
      {
        uint32_t v14 = v13;
        uint64_t v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v19 = "com.apple.nesessionmanager";
          __int16 v20 = 1024;
          uint32_t v21 = v14;
          _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to post the %s notification: %u", buf, 0x12u);
        }
      }
      __int16 v16 = *(NSObject **)(a1 + 32);
      if (v16)
      {
        dispatch_source_cancel(v16);
        uint32_t v17 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = 0;
      }
      if (a2 >= 1) {
        xpc_event_provider_get_queue();
      }
    }
  }
}

void sub_6210(void *a1)
{
  if (a1)
  {
    dispatch_queue_t v1 = a1;
    objc_sync_enter(v1);
    if (v1[8])
    {
      id v2 = ne_log_obj();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Sending file handles to nesessionmanager", v3, 2u);
      }

      [v1 createEvent];
      objc_claimAutoreleasedReturnValue();
      xpc_event_provider_token_fire();
    }
    objc_sync_exit(v1);
  }
}

void sub_62D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_62F0(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_6398;
    v2[3] = &unk_84A8;
    v2[4] = v1;
    [v1 iterateFileHandlesWithBlock:v2];
    objc_sync_exit(v1);
  }
}

void sub_6384(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_6398(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 launchOwnerWhenReadable])
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "File Handle Maintainer listening for readable events on %@", buf, 0xCu);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_64D0;
    v9[3] = &unk_8480;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = v6;
    id v7 = objc_msgSend(v5, "handle", _NSConcreteStackBlock, 3221225472, sub_64D0, &unk_8480);
    [v7 setReadabilityHandler:v9];
  }
  return 1;
}

void sub_64D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "File Handle Maintainer got a readable event on %@, launching owner", buf, 0xCu);
  }

  [v3 setReadabilityHandler:0];
  dispatch_time(0, 1000000000);
  xpc_event_provider_get_queue();
}

uint64_t sub_663C(uint64_t a1)
{
  return sub_62F0(*(void *)(a1 + 32));
}

void sub_6644(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "nesessionmanager(%d) exited", (uint8_t *)v6, 8u);
  }

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  sub_5EAC(*(void *)(a1 + 32), 0);
  if ((ne_session_manager_has_active_sessions() & 1) != 0
    || (ne_session_dns_proxy_configs_present() & 1) != 0
    || (ne_session_content_filter_configs_present() & 1) != 0
    || (ne_session_always_on_vpn_configs_present() & 1) != 0
    || ne_session_local_communication_configs_present())
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "nesessionmanager exited with active sessions, re-launching nesessionmanager to clear agent status", (uint8_t *)v6, 2u);
    }

    sub_6210(*(void **)(a1 + 32));
    sub_4678();
    if (objc_claimAutoreleasedReturnValue()) {
      xpc_event_provider_get_queue();
    }
  }
  objc_sync_exit(v4);
}

void sub_6810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_6830(id a1, NEFileHandle *a2)
{
  id v2 = a2;
  int v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "    %@", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

uint64_t NECopySigningIdentifierForPID()
{
  return _NECopySigningIdentifierForPID();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return _NEHelperCacheCopySigningIdentifierMapping();
}

uint64_t NEHelperInit()
{
  return _NEHelperInit();
}

uint64_t NERepeatingEventCreate()
{
  return _NERepeatingEventCreate();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t inputNotification2String()
{
  return _inputNotification2String();
}

uint64_t ne_log_obj()
{
  return _ne_log_obj();
}

uint64_t ne_session_always_on_vpn_configs_present()
{
  return _ne_session_always_on_vpn_configs_present();
}

uint64_t ne_session_app_vpn_configs_present()
{
  return _ne_session_app_vpn_configs_present();
}

uint64_t ne_session_content_filter_configs_present()
{
  return _ne_session_content_filter_configs_present();
}

uint64_t ne_session_dns_proxy_configs_present()
{
  return _ne_session_dns_proxy_configs_present();
}

uint64_t ne_session_dns_settings_configs_present()
{
  return _ne_session_dns_settings_configs_present();
}

uint64_t ne_session_local_communication_configs_present()
{
  return _ne_session_local_communication_configs_present();
}

uint64_t ne_session_manager_has_active_sessions()
{
  return _ne_session_manager_has_active_sessions();
}

uint64_t ne_session_on_demand_configs_present()
{
  return _ne_session_on_demand_configs_present();
}

uint64_t ne_session_path_controller_configs_present()
{
  return _ne_session_path_controller_configs_present();
}

uint64_t ne_session_relay_configs_present()
{
  return _ne_session_relay_configs_present();
}

uint64_t ne_session_vod_evaluate_connection_present()
{
  return _ne_session_vod_evaluate_connection_present();
}

uint64_t ne_tracker_check_info_changed()
{
  return _ne_tracker_check_info_changed();
}

uint64_t network_config_local_network_blocked_observer_create()
{
  return _network_config_local_network_blocked_observer_create();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return _xpc_uuid_get_bytes(xuuid);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_copySharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 copySharedMonitor];
}

id objc_msgSend_createEvent(void *a1, const char *a2, ...)
{
  return [a1 createEvent];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_launchOwnerWhenReadable(void *a1, const char *a2, ...)
{
  return [a1 launchOwnerWhenReadable];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}