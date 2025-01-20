@interface W5PeerDebugConfigurationRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerDebugConfigurationRequest)initWithPeer:(id)a3 type:(unint64_t)a4 debugConfiguration:(id)a5 reply:(id)a6;
- (W5PeerDebugRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (unint64_t)type;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
@end

@implementation W5PeerDebugConfigurationRequest

- (W5PeerDebugConfigurationRequest)initWithPeer:(id)a3 type:(unint64_t)a4 debugConfiguration:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)W5PeerDebugConfigurationRequest;
  v14 = [(W5PeerDebugConfigurationRequest *)&v24 init];
  v15 = v14;
  if (v11 && v14 && (objc_storeStrong((id *)&v14->_peer, a3), v13))
  {
    id v16 = objc_retainBlock(v13);
    id reply = v15->_reply;
    v15->_id reply = v16;

    v15->_type = a4;
    v15->_discoveryFlags = 1;
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)@"com.apple.wifi.peer.debugConfiguration";

    v19 = objc_alloc_init(W5PeerDebugRequestPayload);
    requestPayload = v15->_requestPayload;
    v15->_requestPayload = v19;

    v21 = [(W5PeerDebugConfigurationRequest *)v15 _currentVersion];
    [(W5PeerDebugRequestPayload *)v15->_requestPayload setVersion:v21];

    [(W5PeerDebugRequestPayload *)v15->_requestPayload setRequestType:v15->_type];
    if (v12) {
      [(W5PeerDebugRequestPayload *)v15->_requestPayload setConfiguration:v12];
    }
  }
  else
  {

    v23 = sub_10009756C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315650;
      v26 = "-[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]";
      __int16 v27 = 2080;
      v28 = "W5PeerDebugConfigurationRequest.m";
      __int16 v29 = 1024;
      int v30 = 58;
      _os_log_send_and_compose_impl();
    }

    v15 = 0;
  }

  return v15;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  id v9 = [v4 error];
  v5 = [v4 payload];

  if (v9 || (id)[(W5PeerDebugConfigurationRequest *)self type] != (id)1)
  {
    v6 = 0;
  }
  else
  {
    v6 = [v5 configuration];
  }
  v7 = [(W5PeerDebugConfigurationRequest *)self reply];

  if (v7)
  {
    v8 = [(W5PeerDebugConfigurationRequest *)self reply];
    ((void (**)(void, id, void *))v8)[2](v8, v9, v6);
  }
}

- (id)_currentVersion
{
  return &off_1000EAD98;
}

- (int64_t)controlFlags
{
  v2 = [(W5PeerDebugConfigurationRequest *)self peer];
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

- (unint64_t)type
{
  return self->_type;
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

- (W5PeerDebugRequestPayload)requestPayload
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