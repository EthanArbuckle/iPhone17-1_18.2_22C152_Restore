@interface W5PeerDiagnosticsRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerDiagnosticsRequest)initWithPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (W5PeerDiagnosticsRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
@end

@implementation W5PeerDiagnosticsRequest

- (W5PeerDiagnosticsRequest)initWithPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)W5PeerDiagnosticsRequest;
  v18 = [(W5PeerDiagnosticsRequest *)&v28 init];
  v19 = v18;
  if (v18
    && (objc_storeStrong((id *)&v18->_peer, a3), v13)
    && (id v20 = objc_retainBlock(v17), reply = v19->_reply, v19->_reply = v20, reply, v17))
  {
    identifier = v19->_identifier;
    v19->_discoveryFlags = 1;
    v19->_identifier = (NSString *)@"com.apple.wifi.peer.peerDiagnostics";

    v23 = objc_alloc_init(W5PeerDiagnosticsRequestPayload);
    requestPayload = v19->_requestPayload;
    v19->_requestPayload = v23;

    v25 = [(W5PeerDiagnosticsRequest *)v19 _currentVersion];
    [(W5PeerDiagnosticsRequestPayload *)v19->_requestPayload setVersion:v25];

    [(W5PeerDiagnosticsRequestPayload *)v19->_requestPayload setConfiguration:v15];
    [(W5PeerDiagnosticsRequestPayload *)v19->_requestPayload setTests:v14];
    [(W5PeerDiagnosticsRequestPayload *)v19->_requestPayload setUuid:v16];
  }
  else
  {

    v27 = sub_10009756C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      v30 = "-[W5PeerDiagnosticsRequest initWithPeer:diagnostics:configuration:uuid:reply:]";
      __int16 v31 = 2080;
      v32 = "W5PeerDiagnosticsRequest.m";
      __int16 v33 = 1024;
      int v34 = 53;
      _os_log_send_and_compose_impl();
    }

    v19 = 0;
  }

  return v19;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 error];

  if (v5)
  {
    v6 = [(W5PeerDiagnosticsRequest *)self reply];
    v7 = [v4 error];
    ((void (**)(void, void *, void))v6)[2](v6, v7, 0);
  }
  else
  {
    v8 = [v4 payload];
    v9 = [v8 results];
    if (!v9)
    {
      v10 = sub_10009756C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v4 payload];
        int v17 = 136315906;
        v18 = "-[W5PeerDiagnosticsRequest handleResponse:]";
        __int16 v19 = 2080;
        id v20 = "W5PeerDiagnosticsRequest.m";
        __int16 v21 = 1024;
        int v22 = 66;
        __int16 v23 = 2114;
        v24 = v11;
        LODWORD(v16) = 38;
        id v15 = &v17;
        _os_log_send_and_compose_impl();
      }
      v12 = [v8 error];
      id v13 = [(W5PeerDiagnosticsRequest *)self reply];
      ((void (**)(void, void *, void))v13)[2](v13, v12, 0);
    }
    id v14 = [(W5PeerDiagnosticsRequest *)self reply];
    ((void (**)(void, void, void *))v14)[2](v14, 0, v9);
  }
}

- (id)_currentVersion
{
  return &off_1000EB980;
}

- (int64_t)controlFlags
{
  v2 = [(W5PeerDiagnosticsRequest *)self peer];
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class();
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (W5PeerDiagnosticsRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_reply, 0);

  objc_storeStrong((id *)&self->_peer, 0);
}

@end