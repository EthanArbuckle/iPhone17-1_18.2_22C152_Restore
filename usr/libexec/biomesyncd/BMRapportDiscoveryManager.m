@interface BMRapportDiscoveryManager
- (BMRapportDiscoveryManager)initWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5;
- (NSArray)devices;
- (id)deviceWithIdentifier:(id)a3;
- (id)localDevice;
- (id)newDiscoveryClients;
- (void)ignoreDevice:(id)a3;
- (void)invalidate;
- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4;
- (void)rapportClient:(id)a3 didLoseDevice:(id)a4;
- (void)startWithCompletion:(id)a3;
- (void)stop;
@end

@implementation BMRapportDiscoveryManager

- (BMRapportDiscoveryManager)initWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMRapportDiscoveryManager;
  v12 = [(BMRapportDiscoveryManager *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeWeak((id *)&v13->_delegate, v10);
    uint64_t v14 = objc_opt_new();
    devices = v13->_devices;
    v13->_devices = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    unsupportedDevices = v13->_unsupportedDevices;
    v13->_unsupportedDevices = (NSMutableDictionary *)v16;
  }
  return v13;
}

- (id)newDiscoveryClients
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated) {
    return 0;
  }
  v4 = +[BMRapportClient clientForSameAccountDiscoveryWithServiceName:@"com.apple.biomesyncd.rapport" delegate:self queue:self->_queue];
  v5 = v4;
  if (!v4)
  {
    v5 = +[NSNull null];
  }
  v10[0] = v5;
  v6 = +[BMRapportClient clientForSharedHomeDiscoveryWithServiceName:@"com.apple.biomesyncd.rapport" delegate:self queue:self->_queue];
  v7 = v6;
  if (!v6)
  {
    v7 = +[NSNull null];
  }
  v10[1] = v7;
  v8 = +[NSArray arrayWithObjects:v10 count:2];
  v3 = [v8 _pas_filteredArrayWithTest:&stru_10006CD60];

  if (!v6) {
  if (!v4)
  }

  return v3;
}

- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v6 = [v5 bm_companionLinkDeviceIdentifier];
    if (v6)
    {
      v7 = [v5 model];

      if (v7)
      {
        v8 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v6];
        if (v8)
        {
        }
        else
        {
          id v10 = [(NSMutableDictionary *)self->_unsupportedDevices objectForKeyedSubscript:v6];

          if (!v10)
          {
            id v11 = [[BMRapportDevice alloc] initWithRPCompanionLinkDevice:v5];
            uint64_t v12 = [(BMRapportDevice *)v11 serviceTypes];
            if (v12
              && (v13 = (void *)v12,
                  [(BMRapportDevice *)v11 serviceTypes],
                  uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v15 = [v14 containsObject:self->_serviceName],
                  v14,
                  v13,
                  (v15 & 1) == 0))
            {
              [(NSMutableDictionary *)self->_unsupportedDevices setObject:v11 forKeyedSubscript:v6];
            }
            else
            {
              id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              if ([WeakRetained discoveryManager:self supportsDevice:v11])
              {
                [(NSMutableDictionary *)self->_devices setObject:v11 forKeyedSubscript:v6];
                v17 = __biome_log_for_category();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  v18 = [(BMRapportDevice *)v11 shortenedRapportIdentifier];
                  int v19 = 138412290;
                  v20 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: discovered device %@", (uint8_t *)&v19, 0xCu);
                }
                [WeakRetained discoveryManager:self didDiscoverDevice:v11];
              }
              else
              {
                [(NSMutableDictionary *)self->_unsupportedDevices setObject:v11 forKeyedSubscript:v6];
              }
            }
          }
        }
        goto LABEL_11;
      }
      id v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100044A84((uint64_t)v5, v9);
      }
    }
    else
    {
      id v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100044A0C((uint64_t)v5, v9);
      }
    }

LABEL_11:
  }
}

- (void)rapportClient:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v8 = [v7 bm_companionLinkDeviceIdentifier];
    id v9 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v8];
    if (v9)
    {
    }
    else
    {
      id v10 = [(NSMutableDictionary *)self->_unsupportedDevices objectForKeyedSubscript:v8];

      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = self->_discoveryClients;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v22 + 1) + 8 * i);
          if (v16 != v6)
          {
            v17 = [v16 activeDevices:v22];
            unsigned int v18 = [v17 containsObject:v7];

            if (v18)
            {
              id WeakRetained = __biome_log_for_category();
              if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v27 = v7;
                _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: already discovered by other connection to rapport %@", buf, 0xCu);
              }
              goto LABEL_20;
            }
          }
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v11 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v8];
    [(NSMutableDictionary *)self->_devices setObject:0 forKeyedSubscript:v8];
    [(NSMutableDictionary *)self->_unsupportedDevices setObject:0 forKeyedSubscript:v8];
    if (v11)
    {
      int v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = [(NSArray *)v11 shortenedRapportIdentifier];
        *(_DWORD *)buf = 138412290;
        id v27 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: lost device %@", buf, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained discoveryManager:self didLoseDevice:v11];
LABEL_20:
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)ignoreDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (!self->_invalidated)
    {
      unsupportedDevices = self->_unsupportedDevices;
      id v6 = [v4 rapportIdentifier];
      id v7 = [(NSMutableDictionary *)unsupportedDevices objectForKeyedSubscript:v6];

      if (!v7)
      {
        devices = self->_devices;
        id v9 = [v4 rapportIdentifier];
        id v10 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v9];

        if (v10)
        {
          id v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = [v4 shortenedRapportIdentifier];
            int v18 = 138412290;
            int v19 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: ignore device %@", (uint8_t *)&v18, 0xCu);
          }
          id v13 = self->_devices;
          uint64_t v14 = [v4 rapportIdentifier];
          [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v14];

          unsigned __int8 v15 = self->_unsupportedDevices;
          id v16 = [v4 rapportIdentifier];
          [(NSMutableDictionary *)v15 setObject:v4 forKeyedSubscript:v16];

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained discoveryManager:self didLoseDevice:v4];
        }
      }
    }
  }
}

- (NSArray)devices
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(NSMutableDictionary *)self->_devices allValues];
  }

  return (NSArray *)v3;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_discoveryClients firstObject];
    id v7 = [v6 localDevice];
    v8 = [v7 bm_companionLinkDeviceIdentifier];
    unsigned int v9 = [v8 isEqual:v4];

    if (v9) {
      [(BMRapportDiscoveryManager *)self localDevice];
    }
    else {
    id v5 = [(NSMutableDictionary *)self->_devices objectForKeyedSubscript:v4];
    }
  }

  return v5;
}

- (id)localDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    v3 = 0;
  }
  else
  {
    id v4 = [BMRapportDevice alloc];
    id v5 = [(NSArray *)self->_discoveryClients firstObject];
    id v6 = [v5 localDevice];
    v3 = [(BMRapportDevice *)v4 initWithRPCompanionLinkDevice:v6];
  }

  return v3;
}

- (void)startWithCompletion:(id)a3
{
  id v4 = (void (**)(id, NSObject *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"BMRappportDiscoveryManager has been invalidated";
    id v5 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v6 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:4 userInfo:v5];
    v4[2](v4, v6);
  }
  else
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: start", buf, 2u);
    }

    id v5 = (id)objc_opt_new();
    id v6 = dispatch_group_create();
    discoveryClients = self->_discoveryClients;
    if (!discoveryClients)
    {
      unsigned int v9 = [(BMRapportDiscoveryManager *)self newDiscoveryClients];
      id v10 = self->_discoveryClients;
      self->_discoveryClients = v9;

      discoveryClients = self->_discoveryClients;
    }
    int v18 = self;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = discoveryClients;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          dispatch_group_enter(v6);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10000F0B0;
          v23[3] = &unk_10006CD88;
          id v24 = v5;
          long long v25 = v6;
          [v16 activateWithCompletion:v23];
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v13);
    }

    if (v4)
    {
      queue = v18->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F0F4;
      block[3] = &unk_10006CDB0;
      id v5 = v5;
      id v20 = v5;
      v21 = v18;
      long long v22 = v4;
      dispatch_group_notify(v6, queue, block);
    }
  }
}

- (void)stop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: stop", buf, 2u);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_discoveryClients;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) invalidate:v10];
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }

    discoveryClients = self->_discoveryClients;
    self->_discoveryClients = 0;
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: invalidate", buf, 2u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = self->_discoveryClients;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) invalidate:v12];
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v6);
    }

    discoveryClients = self->_discoveryClients;
    self->_discoveryClients = 0;

    unsupportedDevices = self->_unsupportedDevices;
    self->_unsupportedDevices = 0;

    devices = self->_devices;
    self->_devices = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryClients, 0);
  objc_storeStrong((id *)&self->_unsupportedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end