@interface W5PeerSnifferListener
- (BOOL)handleClientRequest:(id)a3;
- (CWFInterface)interface;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5PeerSnifferListener)initWithInterface:(id)a3 snifferManager:(id)a4;
- (W5WiFiSniffManager)snifferManager;
- (id)_runSnifferOnChannels:(id)a3 interface:(id)a4 duration:(double)a5 noAutoStop:(BOOL)a6 rotationInternal:(int64_t)a7 uuid:(id)a8;
- (void)setInterface:(id)a3;
- (void)setSnifferManager:(id)a3;
- (void)stopSnifferWithUUID:(id)a3 interface:(id)a4;
@end

@implementation W5PeerSnifferListener

- (W5PeerSnifferListener)initWithInterface:(id)a3 snifferManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)W5PeerSnifferListener;
  v9 = [(W5PeerSnifferListener *)&v13 init];
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_interface, a3), !v10->_interface)
    || (objc_storeStrong((id *)&v10->_snifferManager, a4), !v10->_snifferManager))
  {

    v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      v15 = "-[W5PeerSnifferListener initWithInterface:snifferManager:]";
      __int16 v16 = 2080;
      v17 = "W5PeerSnifferListener.m";
      __int16 v18 = 1024;
      int v19 = 43;
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
  v6 = [v5 version];
  id v7 = [v6 integerValue];

  id v8 = objc_alloc_init(W5PeerSnifferResponsePayload);
  [(W5PeerSnifferResponsePayload *)v8 setVersion:&off_1000EAD38];
  if (v7 == (id)1)
  {
    id v9 = [v5 type];
    v10 = [v5 channels];
    [v5 duration];
    double v12 = v11;
    objc_super v13 = [v5 uuid];
    if (v9 == (id)2)
    {
      __int16 v18 = sub_10009756C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543362;
        v26 = v13;
        LODWORD(v24) = 12;
        v23 = &v25;
        _os_log_send_and_compose_impl();
      }

      [(W5PeerSnifferListener *)self stopSnifferWithUUID:v13 interface:self->_interface];
      [(W5PeerSnifferResponsePayload *)v8 setStatus:1];
    }
    else if (v9 == (id)1 && v10)
    {
      int v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543362;
        v26 = v10;
        LODWORD(v24) = 12;
        v23 = &v25;
        _os_log_send_and_compose_impl();
      }

      if (!v13)
      {
        objc_super v13 = +[NSUUID UUID];
        v15 = sub_10009756C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138543362;
          v26 = v13;
          LODWORD(v24) = 12;
          v23 = &v25;
          _os_log_send_and_compose_impl();
        }
      }
      id v16 = [v5 noAutoStop:v23, v24];
      if (v16) {
        id v17 = [v5 rotationInterval];
      }
      else {
        id v17 = 0;
      }
      int v19 = [(W5PeerSnifferListener *)self _runSnifferOnChannels:v10 interface:self->_interface duration:v16 noAutoStop:v17 rotationInternal:v13 uuid:v12];
      [(W5PeerSnifferResponsePayload *)v8 setStatus:1];
      [(W5PeerSnifferResponsePayload *)v8 setFilePaths:v19];
      [(W5PeerSnifferResponsePayload *)v8 setUuid:v13];
      v20 = sub_10009756C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136316162;
        v26 = "-[W5PeerSnifferListener handleClientRequest:]";
        __int16 v27 = 2080;
        v28 = "W5PeerSnifferListener.m";
        __int16 v29 = 1024;
        int v30 = 83;
        __int16 v31 = 2114;
        v32 = v13;
        __int16 v33 = 2114;
        v34 = v19;
        LODWORD(v24) = 48;
        v23 = &v25;
        _os_log_send_and_compose_impl();
      }
    }
  }
  [v4 handler:v23, v24];
  v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, W5PeerSnifferResponsePayload *, void))v21)[2](v21, v8, 0);

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class();
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.runSniffer";
}

- (id)_runSnifferOnChannels:(id)a3 interface:(id)a4 duration:(double)a5 noAutoStop:(BOOL)a6 rotationInternal:(int64_t)a7 uuid:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_100012B00;
  v39[4] = sub_100012B10;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100012B00;
  v35 = sub_100012B10;
  id v36 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100012B18;
  v21[3] = &unk_1000DD498;
  BOOL v30 = a6;
  id v17 = v16;
  id v22 = v17;
  double v28 = a5;
  int64_t v29 = a7;
  id v18 = v15;
  int v25 = v37;
  v26 = v39;
  id v23 = v18;
  uint64_t v24 = self;
  __int16 v27 = &v31;
  [v14 enumerateObjectsUsingBlock:v21];
  id v19 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  return v19;
}

- (void)stopSnifferWithUUID:(id)a3 interface:(id)a4
{
  v6 = (char *)a3;
  id v7 = a4;
  id v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v6;
    _os_log_send_and_compose_impl();
  }

  snifferManager = self->_snifferManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000133F0;
  v15[3] = &unk_1000DD4C0;
  v10 = v6;
  id v16 = v10;
  [(W5WiFiSniffManager *)snifferManager cancelRequestWithUUID:v10 reply:v15];
  id v14 = 0;
  [v7 setUserAutoJoinDisabled:0 error:&v14];
  id v11 = v14;
  double v12 = sub_10009756C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v7 userAutoJoinDisabled];
    int v17 = 136316418;
    id v18 = "-[W5PeerSnifferListener stopSnifferWithUUID:interface:]";
    __int16 v19 = 2080;
    v20 = "W5PeerSnifferListener.m";
    __int16 v21 = 1024;
    int v22 = 176;
    __int16 v23 = 1024;
    int v24 = 0;
    __int16 v25 = 1024;
    unsigned int v26 = v13;
    __int16 v27 = 2114;
    id v28 = v11;
    _os_log_send_and_compose_impl();
  }
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (W5WiFiSniffManager)snifferManager
{
  return self->_snifferManager;
}

- (void)setSnifferManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snifferManager, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end