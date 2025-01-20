@interface MRDActiveMediaRouteBiomeDonor
- (BMMediaRoute)lastASEEvent;
- (MRAVEndpoint)activeSystemEndpoint;
- (MRDActiveMediaRouteBiomeDonor)init;
- (OS_dispatch_queue)donationQueue;
- (OS_dispatch_queue)queue;
- (id)mediaRouteEventForType:(int)a3 endpoint:(id)a4;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleActiveSystemEndpointOutputDevicesDidChangeNotification:(id)a3;
- (void)donateActiveEndpointOfType:(int)a3;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setDonationQueue:(id)a3;
- (void)setLastASEEvent:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRDActiveMediaRouteBiomeDonor

- (MRDActiveMediaRouteBiomeDonor)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRDActiveMediaRouteBiomeDonor;
  v2 = [(MRDActiveMediaRouteBiomeDonor *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremote.MRDActiveMediaRouteBiomeDonor", v3);
    [(MRDActiveMediaRouteBiomeDonor *)v2 setQueue:v4];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MRDActiveMediaRouteBiomeDonor.Donations", v6);
    [(MRDActiveMediaRouteBiomeDonor *)v2 setDonationQueue:v7];

    v8 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    [(MRDActiveMediaRouteBiomeDonor *)v2 setActiveSystemEndpoint:v8];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
  }
  return v2;
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].AMRBD _handleActiveSystemEndpointDidChangeNotification: %@", buf, 0xCu);
    }

    v9 = [v4 userInfo];
    v10 = [v9 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];

    objc_super v11 = [(MRDActiveMediaRouteBiomeDonor *)self queue];
    id v12 = v10;
    MRAVEndpointResolveActiveSystemEndpointWithType();
  }
}

- (void)_handleActiveSystemEndpointOutputDevicesDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    v17 = [v4 userInfo];
    unsigned int v7 = [v17 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey];
    v16 = [(MRDActiveMediaRouteBiomeDonor *)self activeSystemEndpoint];
    [v16 localizedName];
    v8 = id v15 = v4;
    id v14 = [(MRDActiveMediaRouteBiomeDonor *)self activeSystemEndpoint];
    v9 = [v14 outputDevices];
    v10 = objc_msgSend(v9, "msv_map:", &stru_10041E9D0);
    objc_super v11 = [(MRDActiveMediaRouteBiomeDonor *)self activeSystemEndpoint];
    id v12 = [v11 resolvedOutputDevices];
    v13 = objc_msgSend(v12, "msv_map:", &stru_10041E9F0);
    *(_DWORD *)buf = 138413314;
    v19 = v6;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].AMRBD got %@ for %@ - %@ (%@ -> %@)", buf, 0x34u);

    id v4 = v15;
  }

  [(MRDActiveMediaRouteBiomeDonor *)self donateActiveEndpointOfType:1];
}

- (void)setActiveSystemEndpoint:(id)a3
{
  v5 = (MRAVEndpoint *)a3;
  v6 = self->_activeSystemEndpoint;
  if (v6 == v5)
  {
  }
  else
  {
    unsigned int v7 = v6;
    unsigned __int8 v8 = [(MRAVEndpoint *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      v9 = self->_activeSystemEndpoint;
      objc_storeStrong((id *)&self->_activeSystemEndpoint, a3);
      v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412546;
        v18 = v9;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].AMRBD set ASE from %@ to %@", (uint8_t *)&v17, 0x16u);
      }

      if (v9)
      {
        objc_super v11 = +[NSNotificationCenter defaultCenter];
        [v11 removeObserver:self name:MRAVEndpointDidAddOutputDeviceNotification object:v9];

        id v12 = +[NSNotificationCenter defaultCenter];
        [v12 removeObserver:self name:MRAVEndpointDidChangeOutputDeviceNotification object:v9];

        v13 = +[NSNotificationCenter defaultCenter];
        [v13 removeObserver:self name:MRAVEndpointDidRemoveOutputDeviceNotification object:v9];
      }
      if (v5)
      {
        id v14 = +[NSNotificationCenter defaultCenter];
        [v14 addObserver:self selector:"_handleActiveSystemEndpointOutputDevicesDidChangeNotification:" name:MRAVEndpointDidAddOutputDeviceNotification object:v5];

        id v15 = +[NSNotificationCenter defaultCenter];
        [v15 addObserver:self selector:"_handleActiveSystemEndpointOutputDevicesDidChangeNotification:" name:MRAVEndpointDidChangeOutputDeviceNotification object:v5];

        v16 = +[NSNotificationCenter defaultCenter];
        [v16 addObserver:self selector:"_handleActiveSystemEndpointOutputDevicesDidChangeNotification:" name:MRAVEndpointDidRemoveOutputDeviceNotification object:v5];
      }
      [(MRDActiveMediaRouteBiomeDonor *)self donateActiveEndpointOfType:1];
    }
  }
}

- (void)donateActiveEndpointOfType:(int)a3
{
  v5 = [(MRDActiveMediaRouteBiomeDonor *)self donationQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100151BE4;
  v6[3] = &unk_1004176D0;
  int v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (id)mediaRouteEventForType:(int)a3 endpoint:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = [v5 groupLeader];
  int v7 = [v6 uid];

  uint64_t v8 = [v5 isLocalEndpoint] ^ 1;
  v9 = [v5 resolvedOutputDevices];

  v10 = objc_msgSend(v9, "msv_map:", &stru_10041EA30);
  id v11 = objc_alloc((Class)BMMediaRoute);
  id v12 = +[NSNumber numberWithBool:v8];
  id v13 = [v11 initWithRouteType:v4 groupLeaderOutputDeviceID:v7 isRemoteControl:v12 outputDevices:v10];

  return v13;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)donationQueue
{
  return self->_donationQueue;
}

- (void)setDonationQueue:(id)a3
{
}

- (MRAVEndpoint)activeSystemEndpoint
{
  return self->_activeSystemEndpoint;
}

- (BMMediaRoute)lastASEEvent
{
  return self->_lastASEEvent;
}

- (void)setLastASEEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastASEEvent, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpoint, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end