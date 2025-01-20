@interface W5PeerStatusListener
- (BOOL)handleClientRequest:(id)a3;
- (CWFInterface)interface;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5PeerStatusListener)initWithInterface:(id)a3 statusManager:(id)a4;
- (W5StatusManager)statusManager;
- (id)_connectionInfo;
- (int64_t)currentVersion;
- (void)setInterface:(id)a3;
- (void)setStatusManager:(id)a3;
@end

@implementation W5PeerStatusListener

- (W5PeerStatusListener)initWithInterface:(id)a3 statusManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)W5PeerStatusListener;
  v9 = [(W5PeerStatusListener *)&v13 init];
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_interface, a3), !v10->_interface)
    || (objc_storeStrong((id *)&v10->_statusManager, a4), !v10->_statusManager))
  {

    v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      v15 = "-[W5PeerStatusListener initWithInterface:statusManager:]";
      __int16 v16 = 2080;
      v17 = "W5PeerStatusListener.m";
      __int16 v18 = 1024;
      int v19 = 42;
      _os_log_send_and_compose_impl();
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 payload];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 version];
    id v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316418;
      v20 = "-[W5PeerStatusListener handleClientRequest:]";
      __int16 v21 = 2080;
      v22 = "W5PeerStatusListener.m";
      __int16 v23 = 1024;
      int v24 = 53;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      v28 = v6;
      __int16 v29 = 2114;
      v30 = v7;
      LODWORD(v18) = 58;
      v17 = &v19;
      _os_log_send_and_compose_impl();
    }

    v9 = objc_alloc_init(W5PeerStatusResponsePayload);
    v10 = +[NSNumber numberWithInteger:[(W5PeerStatusListener *)self currentVersion]];
    [(W5PeerStatusResponsePayload *)v9 setVersion:v10];

    [(W5PeerStatusResponsePayload *)v9 setStatus:1];
    if ([v7 integerValue] == (id)1)
    {
      v11 = [(W5PeerStatusListener *)self statusManager];
      v12 = [v11 status];
      [(W5PeerStatusResponsePayload *)v9 setPeerStatus:v12];
    }
    [v4 handler:v17, v18];
    objc_super v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, W5PeerStatusResponsePayload *, void))v13)[2](v13, v9, 0);
  }
  else
  {
    int v14 = [(W5PeerStatusListener *)self _connectionInfo];
    id v7 = +[W5PeerSimpleResponsePayload payloadFromDictionary:v14];

    v15 = [v4 handler];
    ((void (**)(void, void *, void))v15)[2](v15, v7, 0);
  }
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.connectionState";
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)_connectionInfo
{
  v3 = [(W5PeerStatusListener *)self statusManager];
  id v4 = [v3 networkStatus];

  v5 = self->_interface;
  if (v5)
  {
    v6 = [v4 primaryIPv4Addresses];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = [v4 primaryIPv4Addresses];
      v42 = [v8 objectAtIndexedSubscript:0];
    }
    else
    {
      v42 = &stru_1000E06F0;
    }
    v9 = [v4 primaryIPv4Router];

    if (v9)
    {
      v41 = [v4 primaryIPv4Router];
    }
    else
    {
      v41 = &stru_1000E06F0;
    }
    v10 = [v4 primaryIPv6Addresses];
    id v11 = [v10 count];

    if (v11)
    {
      v12 = [v4 primaryIPv6Addresses];
      v40 = [v12 objectAtIndexedSubscript:0];
    }
    else
    {
      v40 = &stru_1000E06F0;
    }
    objc_super v13 = [v4 primaryIPv6Router];

    if (v13)
    {
      v39 = [v4 primaryIPv6Router];
    }
    else
    {
      v39 = &stru_1000E06F0;
    }
    BOOL v34 = ([v4 isAppleReachable] & 2) != 0
       && ([v4 isAppleReachable] & 4) == 0;
    v43[0] = @"networkName";
    uint64_t v14 = [(CWFInterface *)v5 networkName];
    if (v14)
    {
      CFStringRef v15 = [(CWFInterface *)v5 networkName];
    }
    else
    {
      CFStringRef v15 = &stru_1000E06F0;
    }
    v33 = (__CFString *)v15;
    v44[0] = v15;
    v43[1] = @"bssid";
    v37 = [(CWFInterface *)v5 BSSID];
    v38 = (void *)v14;
    v35 = v4;
    if (v37)
    {
      CFStringRef v16 = [(CWFInterface *)v5 BSSID];
    }
    else
    {
      CFStringRef v16 = @"00:00:00:00:00:00";
    }
    v32 = (__CFString *)v16;
    v44[1] = v16;
    v44[2] = &stru_1000E06F0;
    v43[2] = @"operatingBand";
    v43[3] = @"rssi";
    uint64_t v17 = +[NSNumber numberWithInteger:[(CWFInterface *)v5 RSSI]];
    uint64_t v18 = (void *)v17;
    if (v17)
    {
      uint64_t v17 = +[NSNumber numberWithInteger:[(CWFInterface *)v5 RSSI]];
    }
    v31 = (void *)v17;
    v44[3] = v17;
    v43[4] = @"cca";
    uint64_t v19 = +[NSNumber numberWithUnsignedInteger:[(CWFInterface *)v5 CCA]];
    v20 = (void *)v19;
    v36 = v18;
    if (v19)
    {
      uint64_t v19 = +[NSNumber numberWithUnsignedInteger:[(CWFInterface *)v5 CCA]];
    }
    v30 = (void *)v19;
    v44[4] = v19;
    v43[5] = @"channel";
    __int16 v21 = [(CWFInterface *)v5 channel];
    v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 channel]);
    v44[5] = v22;
    v43[6] = @"channelWidth";
    __int16 v23 = [(CWFInterface *)v5 channel];
    int v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v23 width]);
    v44[6] = v24;
    v43[7] = @"txRate";
    [(CWFInterface *)v5 txRate];
    __int16 v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v44[7] = v25;
    v43[8] = @"rxRate";
    [(CWFInterface *)v5 rxRate];
    id v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v44[8] = v26;
    v44[9] = &off_1000F08A0;
    v43[9] = @"txFail";
    v43[10] = @"txFrames";
    v44[10] = &off_1000F08A0;
    v44[11] = &off_1000F08A0;
    v43[11] = @"packetLoss";
    v43[12] = @"ipv4Address";
    v44[12] = v42;
    v43[13] = @"ipv4Gateway";
    v43[14] = @"ipv6Address";
    v44[13] = v41;
    v44[14] = v40;
    v44[15] = v39;
    v43[15] = @"ipv6Gateway";
    v43[16] = @"knownNetwork";
    v44[16] = &off_1000EBA10;
    v44[17] = &off_1000EBA28;
    v43[17] = @"securityType";
    v43[18] = @"internetConnected";
    __int16 v27 = +[NSNumber numberWithBool:v34];
    v43[19] = @"speed";
    v44[18] = v27;
    v44[19] = &stru_1000E06F0;
    v28 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:20];

    if (v20) {
    if (v36)
    }

    if (v37) {
    id v4 = v35;
    }
    if (v38) {
  }
    }
  else
  {
    v28 = &__NSDictionary0__struct;
    v40 = &stru_1000E06F0;
    v41 = &stru_1000E06F0;
    v42 = &stru_1000E06F0;
    v39 = &stru_1000E06F0;
  }

  return v28;
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (W5StatusManager)statusManager
{
  return self->_statusManager;
}

- (void)setStatusManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusManager, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end