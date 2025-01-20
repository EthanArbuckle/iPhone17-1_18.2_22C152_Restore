void sub_100004A7C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@ provider failed to process signal request error %@", (uint8_t *)&v9, 0x16u);
    }

    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = v3;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = 0;
  }
  sub_100004B64(v5, v7, v6);
}

void sub_100004B64(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [a1 managerObjectFactory];
    id v8 = [v7 managerObject];

    [v8 handleProviderError:v6 forMessageID:v5];
  }
}

void sub_100004CF4(uint64_t a1)
{
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@ provider stopped", (uint8_t *)&v7, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = [v3 managerObjectFactory];
    id v5 = [v4 managerObject];

    [v5 handleProviderStopped];
  }
}

void sub_100004E74(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@ failed to start the provider, error %@", (uint8_t *)&v8, 0x16u);
    }

    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v3;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = 0;
  }
  sub_100004F5C(v5, v6);
}

void sub_100004F5C(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    v4 = [a1 managerObjectFactory];
    id v5 = [v4 managerObject];

    [v5 handleProviderError:v3];
  }
}

void sub_100005318(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = [a1 managerObjectFactory];
    id v4 = [v3 managerObject];

    [v4 handleProviderInstallationStatus:a2];
  }
}

void sub_100005764(id a1)
{
  qword_1000121D8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEAppPushPluginDriver];

  _objc_release_x1();
}

void sub_100005800(id a1)
{
  qword_1000121C8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEAppPushPluginManager];

  _objc_release_x1();
}

uint64_t start()
{
  v1 = sub_1000075E0();
  if (v1)
  {
    id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.neagent"];
    objc_setProperty_atomic(v1, v3, v2, 16);

    if (!objc_getProperty(v1, v4, 16, 1))
    {
      __int16 v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315138;
        v12 = "com.apple.neagent";
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create an XPC listener for service %s", (uint8_t *)&v11, 0xCu);
      }

      exit(1);
    }
    [objc_getProperty(v1, v5, 16, 1) setDelegate:v1];
    [objc_getProperty(v1, v6, 16, 1) resume];
    uint64_t v7 = +[LSApplicationWorkspace defaultWorkspace];
    [v7 addObserver:v1];
  }
  int v8 = +[NSRunLoop mainRunLoop];
  [v8 run];

  return 0;
}

void sub_100005DA8(void *a1, const char *a2, uint64_t a3)
{
  if (a1 && objc_getProperty(a1, a2, 56, 1))
  {
    Property = (void (**)(id, void, const char *))objc_getProperty(a1, v6, 56, 1);
    Property[2](Property, a3, a2);
    objc_setProperty_atomic_copy(a1, v8, 0, 56);
  }
}

void sub_100006278(void *a1, const char *a2)
{
  id Property = (id)a1[4];
  if (Property) {
    id Property = objc_getProperty(Property, a2, 48, 1);
  }
  id v5 = Property;
  uint64_t v6 = SOAuthorizationOperationFetchNetworkCredentials;
  id v7 = (id)a1[4];
  if (v7) {
    id v7 = objc_getProperty(v7, v4, 32, 1);
  }
  uint64_t v8 = a1[5];
  id v9 = v7;
  __int16 v10 = objc_opt_new();
  [v5 beginAuthorizationWithOperation:v6 url:v9 httpHeaders:v8 httpBody:v10];

  v12 = (void *)a1[4];
  if (v12)
  {
    v13 = (void *)a1[6];
    objc_setProperty_atomic_copy(v12, v11, v13, 56);
  }
}

void sub_100006474(uint64_t a1, const char *a2)
{
  SEL v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 40);
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      if (objc_getProperty(v5, v4, 40, 1))
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v6, 40, 1);
        }
        uint64_t v8 = [Property VPN];
        id v9 = [v8 protocol];

        if (!v9)
        {
          id v11 = *(id *)(a1 + 32);
          if (v11) {
            id v11 = objc_getProperty(v11, v10, 40, 1);
          }
          v12 = [v11 appVPN];
          id v9 = [v12 protocol];

          if (!v9)
          {
            v13 = ne_log_obj();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v21 = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Missing protocol configuration", v21, 2u);
            }

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            id v9 = 0;
          }
        }
        if ([v9 type] == (id)5)
        {
          if ([v9 useExtendedAuthentication])
          {
            v14 = ne_log_obj();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              __int16 v19 = 0;
              v15 = "Extensible SSO is not supported for EAP authentication";
              v16 = (uint8_t *)&v19;
LABEL_26:
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
            }
          }
          else
          {
            if ([v9 authenticationMethod] == (id)1)
            {
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
LABEL_28:

              return;
            }
            v14 = ne_log_obj();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              __int16 v18 = 0;
              v15 = "Extensible SSO is supported only for certificate authentication";
              v16 = (uint8_t *)&v18;
              goto LABEL_26;
            }
          }
        }
        else
        {
          v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            __int16 v20 = 0;
            v15 = "Extensible SSO is supported only for IKEv2";
            v16 = (uint8_t *)&v20;
            goto LABEL_26;
          }
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
        goto LABEL_28;
      }
    }
  }
  v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Bad init message, configuration is missing", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000675C(id a1)
{
  qword_1000121F8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEVPNAuthenticationPluginDriver];

  _objc_release_x1();
}

void sub_1000067F8(id a1)
{
  qword_1000121E8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEVPNPluginManager];

  _objc_release_x1();
}

void sub_100006C24(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v11) bundleIdentifier];
          [v6 addObject:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v9);
    }

    v13 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v14 = *(id *)(a1 + 24);
    os_unfair_lock_unlock(v13);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        __int16 v19 = 0;
        do
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v19);
          if (a2 == 3)
          {
            id v22 = v6;
            if (v20)
            {
              id Property = objc_getProperty(v20, v25, 16, 1);
              block = _NSConcreteStackBlock;
              uint64_t v36 = 3221225472;
              v24 = sub_1000084D0;
              goto LABEL_20;
            }
          }
          else
          {
            if (a2) {
              goto LABEL_22;
            }
            id v22 = v6;
            if (v20)
            {
              id Property = objc_getProperty(v20, v21, 16, 1);
              block = _NSConcreteStackBlock;
              uint64_t v36 = 3221225472;
              v24 = sub_100008518;
LABEL_20:
              v37 = v24;
              v38 = &unk_10000C4C0;
              v39 = v20;
              id v40 = v22;
              dispatch_async(Property, &block);
            }
          }

LABEL_22:
          __int16 v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v17);
    }

    id v5 = v26;
  }
}

void sub_100006F20(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v28 = a1;
  if (a1)
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v13 = [v12 pluginIdentifier:v27];

          if (v13)
          {
            id v14 = [v12 pluginIdentifier];
            [v6 addObject:v14];
          }
          else
          {
            id v14 = ne_log_obj();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = a2;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Got a LSPlugInKitProxy with a nil identifier with event %d", buf, 8u);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v28 + 8));
    id v15 = [*(id *)(v28 + 24) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(v28 + 8));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
          if (a2 == 2)
          {
            id v23 = v6;
            if (v21)
            {
              id Property = objc_getProperty(v21, v26, 16, 1);
              *(void *)buf = _NSConcreteStackBlock;
              uint64_t v40 = 3221225472;
              v25 = sub_1000085A8;
              goto LABEL_24;
            }
          }
          else
          {
            if (a2 != 1) {
              continue;
            }
            id v23 = v6;
            if (v21)
            {
              id Property = objc_getProperty(v21, v22, 16, 1);
              *(void *)buf = _NSConcreteStackBlock;
              uint64_t v40 = 3221225472;
              v25 = sub_100008560;
LABEL_24:
              v41 = v25;
              v42 = &unk_10000C4C0;
              v43 = v21;
              id v44 = v23;
              dispatch_async(Property, buf);
            }
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }

    id v5 = v27;
  }
}

id sub_1000075E0()
{
  self;
  if (qword_100012210 != -1) {
    dispatch_once(&qword_100012210, &stru_10000C3F8);
  }
  v0 = (void *)qword_100012208;

  return v0;
}

void sub_100007638(id a1)
{
  NEInitCFTypes();
  v1 = [NEAgentServer alloc];
  if (v1)
  {
    v8.receiver = v1;
    v8.super_class = (Class)NEAgentServer;
    id v2 = [super init];
    if (v2)
    {
      id v3 = objc_alloc_init((Class)NSMutableArray);
      SEL v4 = (void *)v2[3];
      v2[3] = v3;

      id v5 = objc_alloc_init((Class)NSMutableArray);
      id v6 = (void *)v2[4];
      v2[4] = v5;

      *((_DWORD *)v2 + 2) = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  id v7 = (void *)qword_100012208;
  qword_100012208 = (uint64_t)v2;
}

void sub_10000782C(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 16, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000078B8;
    block[3] = &unk_10000C420;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_1000078B8(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24, 1);
  }
  [Property invalidate];
  id v5 = *(id *)(a1 + 32);
  if (v5)
  {
    objc_setProperty_atomic(v5, v4, 0, 24);
    id v5 = *(id *)(a1 + 32);
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 32, 1);
    }
  }
  [v5 invalidate];
  id v8 = *(id *)(a1 + 32);
  if (v8)
  {
    objc_setProperty_atomic(v8, v7, 0, 32);
    id v8 = *(id *)(a1 + 32);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 8, 1);
    }
  }
  [v8 handleCancel];
  id v11 = *(id *)(a1 + 32);
  if (v11)
  {
    objc_setProperty_atomic(v11, v10, 0, 8);
    id v11 = *(id *)(a1 + 32);
    if (v11) {
      id v11 = objc_getProperty(v11, v12, 40, 1);
    }
  }
  [v11 invalidate];
  id v14 = *(void **)(a1 + 32);
  if (v14) {
    objc_setProperty_atomic(v14, v13, 0, 40);
  }
  uint64_t v15 = sub_1000075E0();
  if (v15)
  {
    id v16 = *(id *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v15 + 8));
    [*(id *)(v15 + 24) removeObject:v16];

    os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 8));
  }

  uint64_t v17 = *(void *)(a1 + 32);
  if (!v17 || !*(void *)(v17 + 48))
  {
    id v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "exiting", v19, 2u);
    }

    exit(0);
  }
}

void sub_100007BB8(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 8, 1))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id Property = objc_getProperty(v5, v4, 8, 1);
      uint64_t v7 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v7 = 0;
      id Property = 0;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007CE8;
    v10[3] = &unk_10000C498;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 40);
    [Property handleDisposeWithCompletionHandler:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [objc_alloc((Class)NSError) initWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
}

uint64_t sub_100007CE8(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Dispose complete", v6, 2u);
  }

  SEL v4 = *(void **)(a1 + 32);
  if (v4) {
    objc_setProperty_atomic(v4, v3, 0, 8);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100007E9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(void *)(v2 + 48) = *(void *)(a1 + 64);
  }
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing the delegate", buf, 2u);
  }

  switch(*(void *)(a1 + 72))
  {
    case 1:
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Legacy plugins are not supported on iOS", buf, 2u);
      }

      id v6 = [objc_alloc((Class)NSError) initWithDomain:@"NEAgentErrorDomain" code:2 userInfo:0];
      goto LABEL_23;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      SEL v4 = (objc_class *)objc_opt_class();
      break;
    default:
      SEL v4 = 0;
      break;
  }
  id v8 = [v4 alloc];
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    id Property = objc_getProperty(v12, v7, 16, 1);
    uint64_t v14 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v14 = 0;
    id Property = 0;
  }
  id v16 = [v8 initWithPluginType:v11 pluginClass:v9 pluginInfo:v10 queue:Property factory:v14];
  uint64_t v17 = *(void **)(a1 + 32);
  if (v17) {
    objc_setProperty_atomic(v17, v15, v16, 8);
  }

  kdebug_trace();
  uint64_t v19 = *(void **)(a1 + 32);
  if (v19 && objc_getProperty(v19, v18, 8, 1))
  {
    v21 = *(void **)(a1 + 32);
    if (v21) {
      id v22 = objc_getProperty(v21, v20, 8, 1);
    }
    else {
      id v22 = 0;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000081E8;
    v25[3] = &unk_10000C448;
    id v23 = *(id *)(a1 + 56);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v23;
    [v22 handleInitWithCompletionHandler:v25];
    id v6 = v26;
  }
  else
  {
    id v6 = [objc_alloc((Class)NSError) initWithDomain:@"NEAgentErrorDomain" code:2 userInfo:0];
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "NEAgentSession: failed to create the delegate", buf, 2u);
    }

LABEL_23:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1000081E8(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = 0;
  }
  else
  {
    SEL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NEAgentSession: failed to initialize the delegate", v12, 2u);
    }

    id v3 = [objc_alloc((Class)NSError) initWithDomain:@"NEAgentErrorDomain" code:2 userInfo:0];
  }
  kdebug_trace();
  id Property = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v5, 40, 1);
  }
  uint64_t v9 = [Property endpoint];
  id v10 = *(id *)(a1 + 32);
  if (v10) {
    id v10 = objc_getProperty(v10, v8, 8, 1);
  }
  uint64_t v11 = [v10 uuids];
  (*(void (**)(uint64_t, id, void *, void *))(v7 + 16))(v7, v3, v9, v11);
}

void sub_1000084C0(uint64_t a1, const char *a2)
{
}

void sub_1000084C8(uint64_t a1, const char *a2)
{
}

id sub_1000084D0(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);

  return [Property handleAppsUninstalled:v4];
}

id sub_100008518(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);

  return [Property handleAppsUpdateBegins:v4];
}

id sub_100008560(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);

  return [Property handleAppsUpdateEnding:v4];
}

id sub_1000085A8(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);

  return [Property handleAppsUpdateEnds:v4];
}

uint64_t NEInitCFTypes()
{
  return _NEInitCFTypes();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t ne_log_obj()
{
  return _ne_log_obj();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

id objc_msgSend_VPN(void *a1, const char *a2, ...)
{
  return [a1 VPN];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_appVPN(void *a1, const char *a2, ...)
{
  return [a1 appVPN];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_driverInterface(void *a1, const char *a2, ...)
{
  return [a1 driverInterface];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_extensionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionIdentifier];
}

id objc_msgSend_handleCancel(void *a1, const char *a2, ...)
{
  return [a1 handleCancel];
}

id objc_msgSend_handleProviderStopped(void *a1, const char *a2, ...)
{
  return [a1 handleProviderStopped];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_machOUUIDs(void *a1, const char *a2, ...)
{
  return [a1 machOUUIDs];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_managerInterface(void *a1, const char *a2, ...)
{
  return [a1 managerInterface];
}

id objc_msgSend_managerObject(void *a1, const char *a2, ...)
{
  return [a1 managerObject];
}

id objc_msgSend_managerObjectFactory(void *a1, const char *a2, ...)
{
  return [a1 managerObjectFactory];
}

id objc_msgSend_pluginIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pluginIdentifier];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sendExtensionFailed(void *a1, const char *a2, ...)
{
  return [a1 sendExtensionFailed];
}

id objc_msgSend_sendTimerEvent(void *a1, const char *a2, ...)
{
  return [a1 sendTimerEvent];
}

id objc_msgSend_serverAddress(void *a1, const char *a2, ...)
{
  return [a1 serverAddress];
}

id objc_msgSend_sessionContext(void *a1, const char *a2, ...)
{
  return [a1 sessionContext];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_useExtendedAuthentication(void *a1, const char *a2, ...)
{
  return [a1 useExtendedAuthentication];
}

id objc_msgSend_uuids(void *a1, const char *a2, ...)
{
  return [a1 uuids];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 valueForHTTPHeaderField:];
}