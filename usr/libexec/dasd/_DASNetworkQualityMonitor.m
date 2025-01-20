@interface _DASNetworkQualityMonitor
+ (id)monitorForInterface:(int64_t)a3 interfaceSubtype:(int64_t)a4 onChange:(id)a5;
- (NWNetworkOfInterest)noi;
- (NWNetworkOfInterestManager)noiManager;
- (OS_dispatch_queue)noiManagerQueue;
- (_DASNetworkQualityMonitor)initWithInterface:(int64_t)a3 interfaceSubtype:(int64_t)a4 onChange:(id)a5;
- (id)callback;
- (int64_t)interface;
- (int64_t)interfaceSubtype;
- (int64_t)linkQuality;
- (int64_t)quality;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCallback:(id)a3;
- (void)setInterface:(int64_t)a3;
- (void)setInterfaceSubtype:(int64_t)a3;
- (void)setNoi:(id)a3;
- (void)setNoiManager:(id)a3;
- (void)setNoiManagerQueue:(id)a3;
- (void)setQuality:(int64_t)a3;
@end

@implementation _DASNetworkQualityMonitor

- (_DASNetworkQualityMonitor)initWithInterface:(int64_t)a3 interfaceSubtype:(int64_t)a4 onChange:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_DASNetworkQualityMonitor;
  v9 = [(_DASNetworkQualityMonitor *)&v17 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.duetknowledgecollector.networkQualityMonitorQueue", 0);
    noiManagerQueue = v9->_noiManagerQueue;
    v9->_noiManagerQueue = (OS_dispatch_queue *)v10;

    v12 = (NWNetworkOfInterestManager *)objc_alloc_init((Class)NWNetworkOfInterestManager);
    noiManager = v9->_noiManager;
    v9->_noiManager = v12;

    [(NWNetworkOfInterestManager *)v9->_noiManager setQueue:v9->_noiManagerQueue];
    [(NWNetworkOfInterestManager *)v9->_noiManager setDelegate:v9];
    if (a4)
    {
      v9->_interfaceSubtype = a4;
      [(NWNetworkOfInterestManager *)v9->_noiManager trackNOIAnyForInterfaceSubtype:a4 options:0];
    }
    else
    {
      v9->_interface = a3;
      [(NWNetworkOfInterestManager *)v9->_noiManager trackNOIAnyForInterfaceType:a3 options:0];
    }
    id v14 = objc_retainBlock(v8);
    id callback = v9->_callback;
    v9->_id callback = v14;
  }
  return v9;
}

+ (id)monitorForInterface:(int64_t)a3 interfaceSubtype:(int64_t)a4 onChange:(id)a5
{
  id v7 = a5;
  id v8 = [objc_alloc((Class)objc_opt_class()) initWithInterface:a3 interfaceSubtype:a4 onChange:v7];

  return v8;
}

- (int64_t)linkQuality
{
  return (int64_t)[(NWNetworkOfInterest *)self->_noi linkQuality];
}

- (void)didStartTrackingNOI:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!self->_noi)
  {
    if ([v5 interface] == self->_interface
      || [v6 interfaceSubtype] == self->_interfaceSubtype)
    {
      objc_storeStrong((id *)&self->_noi, a3);
      id v7 = +[_DASDaemonLogger logForCategory:@"nw"];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        noi = self->_noi;
        int v14 = 138412546;
        v15 = noi;
        __int16 v16 = 2048;
        id v17 = [(NWNetworkOfInterest *)noi linkQuality];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving noi: %@ (%ld)", (uint8_t *)&v14, 0x16u);
      }

      [(NWNetworkOfInterest *)self->_noi addObserver:self forKeyPath:@"linkQuality" options:1 context:0];
    }
    else
    {
      v9 = +[_DASDaemonLogger logForCategory:@"nw"];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        dispatch_queue_t v10 = (NWNetworkOfInterest *)[v6 interface];
        id v11 = [v6 interfaceSubtype];
        int64_t interface = self->_interface;
        int64_t interfaceSubtype = self->_interfaceSubtype;
        int v14 = 134218752;
        v15 = v10;
        __int16 v16 = 2048;
        id v17 = v11;
        __int16 v18 = 2048;
        int64_t v19 = interface;
        __int16 v20 = 2048;
        int64_t v21 = interfaceSubtype;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Interface and subtype (%ld, %ld) do not match expected (%ld, %ld)", (uint8_t *)&v14, 0x2Au);
      }
    }
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_noi])
  {
    [(NWNetworkOfInterest *)self->_noi removeObserver:self forKeyPath:@"linkQuality"];
    noi = self->_noi;
    self->_noi = 0;
  }
  else
  {
    v6 = +[_DASDaemonLogger logForCategory:@"nw"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Stopped tracking noi %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_DASNetworkQualityMonitor *)self didStopTrackingNOI:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  int64_t interface = self->_interface;
  noiManager = self->_noiManager;
  if (interface) {
    [(NWNetworkOfInterestManager *)noiManager trackNOIAnyForInterfaceType:interface options:0];
  }
  else {
    [(NWNetworkOfInterestManager *)noiManager trackNOIAnyForInterfaceSubtype:self->_interfaceSubtype options:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  unsigned __int8 v8 = [v7 isEqual:self->_noi];
  v9 = +[_DASDaemonLogger logForCategory:@"nw"];
  dispatch_queue_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = +[NSNumber numberWithInteger:[(NWNetworkOfInterest *)self->_noi interface]];
      long long v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 interfaceSubtype]);
      long long v13 = +[NSNumber numberWithInteger:[(NWNetworkOfInterest *)self->_noi linkQuality]];
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2112;
      int64_t v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Link Quality for %@/%@ is now %@", (uint8_t *)&v14, 0x20u);
    }
    (*((void (**)(void))self->_callback + 2))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Unexpected noi %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (OS_dispatch_queue)noiManagerQueue
{
  return self->_noiManagerQueue;
}

- (void)setNoiManagerQueue:(id)a3
{
}

- (int64_t)interface
{
  return self->_interface;
}

- (void)setInterface:(int64_t)a3
{
  self->_int64_t interface = a3;
}

- (int64_t)interfaceSubtype
{
  return self->_interfaceSubtype;
}

- (void)setInterfaceSubtype:(int64_t)a3
{
  self->_int64_t interfaceSubtype = a3;
}

- (NWNetworkOfInterestManager)noiManager
{
  return self->_noiManager;
}

- (void)setNoiManager:(id)a3
{
}

- (NWNetworkOfInterest)noi
{
  return self->_noi;
}

- (void)setNoi:(id)a3
{
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_noi, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);

  objc_storeStrong((id *)&self->_noiManagerQueue, 0);
}

@end