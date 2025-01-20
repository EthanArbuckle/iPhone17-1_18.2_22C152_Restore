@interface W5PeerSensingListener
- (BOOL)handleClientRequest:(id)a3;
- (BOOL)performSensing:(id)a3 error:(id *)a4;
- (CWFInterface)interface;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5PeerSensingListener)initWithInterface:(id)a3;
- (id)_responseDictionaryWithSuccess:(BOOL)a3 errorString:(id)a4;
- (void)setInterface:(id)a3;
@end

@implementation W5PeerSensingListener

- (W5PeerSensingListener)initWithInterface:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerSensingListener;
  v6 = [(W5PeerSensingListener *)&v10 init];
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_interface, a3), !v7->_interface))
  {

    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5PeerSensingListener initWithInterface:]";
      __int16 v13 = 2080;
      v14 = "W5PeerSensingListener.m";
      __int16 v15 = 1024;
      int v16 = 35;
      _os_log_send_and_compose_impl();
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(W5PeerSensingResponsePayload);
  v6 = [v4 options];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)CWFSensingParameters);
    v8 = [v4 options];
    v9 = [v8 objectForKeyedSubscript:@"numberOfReports"];
    [v7 setNumberOfReports:objc_msgSend(v9, "intValue")];

    objc_super v10 = [v4 options];
    int v11 = [v10 objectForKeyedSubscript:@"placeLabels"];
    [v7 setPlaceLabels:v11];

    v12 = [v4 options];
    __int16 v13 = [v12 objectForKeyedSubscript:@"activityLabels"];
    [v7 setActivityLabels:v13];

    v14 = [v4 options];
    __int16 v15 = [v14 objectForKeyedSubscript:@"submitMetric"];
    [v7 setSubmitMetric:[v15 intValue] != 0];

    int v16 = sub_10009756C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [v7 description];
      int v24 = 136315906;
      v25 = "-[W5PeerSensingListener handleClientRequest:]";
      __int16 v26 = 2080;
      v27 = "W5PeerSensingListener.m";
      __int16 v28 = 1024;
      int v29 = 58;
      __int16 v30 = 2114;
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    id v23 = 0;
    BOOL v17 = [(W5PeerSensingListener *)self performSensing:v7 error:&v23];
    id v18 = v23;
    [(W5PeerSensingResponsePayload *)v5 setResult:v17];
    v19 = [v18 localizedDescription];

    [(W5PeerSensingResponsePayload *)v5 setErrorStr:v19];
    v20 = [v4 handler];
    ((void (**)(void, W5PeerSensingResponsePayload *, void))v20)[2](v20, v5, 0);
  }
  else
  {
    v21 = sub_10009756C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315650;
      v25 = "-[W5PeerSensingListener handleClientRequest:]";
      __int16 v26 = 2080;
      v27 = "W5PeerSensingListener.m";
      __int16 v28 = 1024;
      int v29 = 45;
      _os_log_send_and_compose_impl();
    }

    [(W5PeerSensingResponsePayload *)v5 setResult:0];
    [(W5PeerSensingResponsePayload *)v5 setErrorStr:@"empty request dictionary"];
    id v7 = [v4 handler];
    (*((void (**)(id, W5PeerSensingResponsePayload *, void))v7 + 2))(v7, v5, 0);
  }

  return v6 != 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.performSensing";
}

- (Class)requestPayloadClass
{
  return 0;
}

- (BOOL)performSensing:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(W5PeerSensingListener *)self interface];
    v12 = [v8 networkName];
    _os_log_send_and_compose_impl();
  }
  v9 = [(W5PeerSensingListener *)self interface];
  objc_super v10 = [v9 performSensingWithParameters:v6 error:a4];

  return v10 != 0;
}

- (id)_responseDictionaryWithSuccess:(BOOL)a3 errorString:(id)a4
{
  BOOL v4 = a3;
  id v5 = (__CFString *)a4;
  if (v5) {
    int v6 = 1;
  }
  else {
    int v6 = v4;
  }
  if (v6) {
    id v7 = v5;
  }
  else {
    id v7 = @"unknown error";
  }
  v12[0] = @"result";
  v8 = v5;
  v9 = +[NSNumber numberWithBool:v4];
  v12[1] = @"error";
  v13[0] = v9;
  v13[1] = v7;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end