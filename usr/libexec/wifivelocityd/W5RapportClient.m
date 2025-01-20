@interface W5RapportClient
- (BOOL)_configureDiscoveryClient;
- (BOOL)isDiscoveringDevices;
- (OS_dispatch_queue)queue;
- (RPCompanionLinkClient)discoveryClient;
- (RPCompanionLinkClient)localDeviceClient;
- (W5RapportClient)init;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)sendMessageToDevice:(id)a3 request:(id)a4;
- (void)_handleDeviceFound:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_invalidateRapportClient;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveringDevices:(BOOL)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setLocalDeviceClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)startDiscoveringDevices;
- (void)stopDiscoveryingDevices;
@end

@implementation W5RapportClient

- (W5RapportClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)W5RapportClient;
  v2 = [(W5RapportClient *)&v8 init];
  if (v2)
  {
    if (+[W5FeatureAvailability diagnosticsModeEnabled])
    {
      dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifi.W5RapportClient", 0);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v3;

      if (v2->_queue)
      {
        v2->_discoveringDevices = 0;
        return v2;
      }
    }
    else
    {
      v6 = sub_10009756C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        v10 = "-[W5RapportClient init]";
        __int16 v11 = 2080;
        v12 = "W5RapportClient.m";
        __int16 v13 = 1024;
        int v14 = 59;
        _os_log_send_and_compose_impl();
      }
    }
  }

  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    v10 = "-[W5RapportClient init]";
    __int16 v11 = 2080;
    v12 = "W5RapportClient.m";
    __int16 v13 = 1024;
    int v14 = 72;
    _os_log_send_and_compose_impl();
  }

  return 0;
}

- (BOOL)_configureDiscoveryClient
{
  dispatch_queue_t v3 = [(W5RapportClient *)self discoveryClient];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = objc_alloc_init((Class)RPCompanionLinkClient);
    BOOL v4 = v5 != 0;
    if (v5)
    {
      v6 = [(W5RapportClient *)self queue];
      [v5 setDispatchQueue:v6];

      [v5 setControlFlags:((unint64_t)[v5 controlFlags] | 0x818126)];
      [v5 setServiceType:@"com.apple.wifivelocityd.rapportWake"];
      objc_initWeak(&location, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10004BDB0;
      v14[3] = &unk_1000DE8C0;
      objc_copyWeak(&v15, &location);
      [v5 setInvalidationHandler:v14];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10004BEAC;
      v12[3] = &unk_1000DE910;
      v12[4] = self;
      objc_copyWeak(&v13, &location);
      [v5 setDeviceFoundHandler:v12];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10004BFD0;
      v10[3] = &unk_1000DE938;
      objc_copyWeak(&v11, &location);
      [v5 setDeviceLostHandler:v10];
      [v5 setDeviceChangedHandler:&stru_1000DE978];
      [v5 setLocalDeviceUpdatedHandler:&stru_1000DE9B8];
      v7 = sub_10009756C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        v18 = "-[W5RapportClient _configureDiscoveryClient]";
        __int16 v19 = 2080;
        v20 = "W5RapportClient.m";
        __int16 v21 = 1024;
        int v22 = 125;
        _os_log_send_and_compose_impl();
      }

      [(W5RapportClient *)self setDiscoveryClient:v5];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_super v8 = sub_10009756C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        v18 = "-[W5RapportClient _configureDiscoveryClient]";
        __int16 v19 = 2080;
        v20 = "W5RapportClient.m";
        __int16 v21 = 1024;
        int v22 = 85;
        _os_log_send_and_compose_impl();
      }
    }
  }
  return v4;
}

- (void)_invalidateRapportClient
{
  dispatch_queue_t v3 = [(W5RapportClient *)self discoveryClient];
  [v3 invalidate];

  [(W5RapportClient *)self setDiscoveryClient:0];
}

- (void)_handleDeviceFound:(id)a3
{
  id v4 = a3;
  id v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 statusFlags];
    [v4 statusFlags];
    v6 = [v4 serviceTypes];
    [v6 containsObject:@"com.apple.wifivelocityd.rapportWake"];
    if (v4)
    {
      [v4 operatingSystemVersion];
      uint64_t v7 = v17;
      [v4 operatingSystemVersion];
      uint64_t v8 = v15;
      [v4 operatingSystemVersion];
      uint64_t v9 = v13;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    v20 = +[NSString stringWithFormat:@"%ld.%ld.%ld", v7, v8, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19];
    _os_log_send_and_compose_impl();
  }
  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v4);
  }
}

- (void)_handleDeviceLost:(id)a3
{
  id v4 = a3;
  id v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v4);
  }
}

- (void)startDiscoveringDevices
{
  if (self->_discoveringDevices)
  {
    v2 = sub_10009756C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
      __int16 v10 = 2080;
      uint64_t v11 = "W5RapportClient.m";
      __int16 v12 = 1024;
      int v13 = 164;
      _os_log_send_and_compose_impl();
    }
LABEL_11:

    return;
  }
  unsigned __int8 v4 = [(W5RapportClient *)self _configureDiscoveryClient];
  v2 = sub_10009756C();
  BOOL v5 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (v5)
    {
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
      __int16 v10 = 2080;
      uint64_t v11 = "W5RapportClient.m";
      __int16 v12 = 1024;
      int v13 = 169;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_11;
  }
  if (v5)
  {
    *(_DWORD *)id location = 136315650;
    *(void *)&location[4] = "-[W5RapportClient startDiscoveringDevices]";
    __int16 v10 = 2080;
    uint64_t v11 = "W5RapportClient.m";
    __int16 v12 = 1024;
    int v13 = 173;
    _os_log_send_and_compose_impl();
  }

  self->_discoveringDevices = 1;
  objc_initWeak((id *)location, self);
  v6 = [(W5RapportClient *)self discoveryClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004C7B8;
  v7[3] = &unk_1000DE9E0;
  objc_copyWeak(&v8, (id *)location);
  [v6 activateWithCompletion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)location);
}

- (void)stopDiscoveryingDevices
{
  BOOL discoveringDevices = self->_discoveringDevices;
  unsigned __int8 v4 = sub_10009756C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (discoveringDevices)
  {
    if (v5) {
      _os_log_send_and_compose_impl();
    }

    [(W5RapportClient *)self _invalidateRapportClient];
    self->_BOOL discoveringDevices = 0;
  }
  else
  {
    if (v5) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (id)sendMessageToDevice:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)RPCompanionLinkClient);
  [v7 setDestinationDevice:v5];
  id v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id location = 136316162;
    *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]";
    __int16 v26 = 2080;
    v27 = "W5RapportClient.m";
    __int16 v28 = 1024;
    int v29 = 204;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v5;
    LODWORD(v20) = 48;
    uint64_t v19 = location;
    _os_log_send_and_compose_impl();
  }

  uint64_t v9 = [v5 model];
  if ([v9 containsString:@"Mac"])
  {
  }
  else
  {
    __int16 v10 = [v6 peer];
    uint64_t v11 = [v10 model];
    unsigned __int8 v12 = [v11 containsString:@"Mac"];

    if ((v12 & 1) == 0) {
      [v7 setServiceType:@"com.apple.wifivelocityd.rapportWake"];
    }
  }
  BOOL v13 = (((unint64_t)[v6 controlFlags:v19, v20] & 1) == 0);
  unint64_t v14 = (unint64_t)[v7 controlFlags];
  uint64_t v15 = 6291712;
  if (v13) {
    uint64_t v15 = 4227334;
  }
  [v7 setControlFlags:v15 | v14];
  [v7 setInvalidationHandler:&stru_1000DEA00];
  objc_initWeak((id *)location, v7);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004CE1C;
  v21[3] = &unk_1000DEA50;
  objc_copyWeak(&v24, (id *)location);
  id v16 = v6;
  id v22 = v16;
  id v17 = v5;
  id v23 = v17;
  [v7 activateWithCompletion:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)location);

  return 0;
}

- (BOOL)isDiscoveringDevices
{
  return self->_discoveringDevices;
}

- (void)setDiscoveringDevices:(BOOL)a3
{
  self->_BOOL discoveringDevices = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (RPCompanionLinkClient)localDeviceClient
{
  return self->_localDeviceClient;
}

- (void)setLocalDeviceClient:(id)a3
{
}

- (RPCompanionLinkClient)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_localDeviceClient, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);

  objc_storeStrong(&self->_deviceFoundHandler, 0);
}

@end