@interface W5PeerStatusRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerStatusRequest)initWithPeer:(id)a3 reply:(id)a4;
- (W5PeerStatusRequestPayload)requestPayload;
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

@implementation W5PeerStatusRequest

- (W5PeerStatusRequest)initWithPeer:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)W5PeerStatusRequest;
  v9 = [(W5PeerStatusRequest *)&v18 init];
  v10 = v9;
  if (v7 && v9 && (objc_storeStrong((id *)&v9->_peer, a3), v8))
  {
    id v11 = objc_retainBlock(v8);
    id reply = v10->_reply;
    v10->_id reply = v11;

    identifier = v10->_identifier;
    v10->_discoveryFlags = 1;
    v10->_identifier = (NSString *)@"com.apple.wifi.peer.connectionState";

    v14 = objc_alloc_init(W5PeerStatusRequestPayload);
    requestPayload = v10->_requestPayload;
    v10->_requestPayload = v14;

    v16 = [(W5PeerStatusRequest *)v10 _currentVersion];
    [(W5PeerStatusRequestPayload *)v10->_requestPayload setVersion:v16];
  }
  else
  {

    v16 = sub_10009756C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      v20 = "-[W5PeerStatusRequest initWithPeer:reply:]";
      __int16 v21 = 2080;
      v22 = "W5PeerStatusRequest.m";
      __int16 v23 = 1024;
      int v24 = 48;
      _os_log_send_and_compose_impl();
    }
    v10 = 0;
  }

  return v10;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 error];

  if (v5)
  {
    v6 = [(W5PeerStatusRequest *)self reply];
    id v7 = [v4 error];
    ((void (**)(void, void *, void))v6)[2](v6, v7, 0);
  }
  else
  {
    v6 = [v4 payload];
    id v7 = [v6 peerStatus];
    id v8 = [v6 status];
    v9 = sub_10009756C();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == (id)1 && v7)
    {
      if (v10)
      {
        int v16 = 136315906;
        v17 = "-[W5PeerStatusRequest handleResponse:]";
        __int16 v18 = 2080;
        int v19 = "W5PeerStatusRequest.m";
        __int16 v20 = 1024;
        int v21 = 62;
        __int16 v22 = 2114;
        id v23 = v7;
        _os_log_send_and_compose_impl();
      }

      id v11 = [(W5PeerStatusRequest *)self reply];
      ((void (**)(void, void, void *))v11)[2](v11, 0, v7);
    }
    else
    {
      if (v10)
      {
        [(W5PeerStatusRequest *)self peer];
        int v16 = 136315906;
        v17 = "-[W5PeerStatusRequest handleResponse:]";
        __int16 v18 = 2080;
        int v19 = "W5PeerStatusRequest.m";
        __int16 v20 = 1024;
        int v21 = 65;
        __int16 v22 = 2114;
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      id v11 = [(W5PeerStatusRequest *)self reply];
      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v15 = @"W5PeerStatusResponseUndefinedError";
      v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      v13 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:15 userInfo:v12];
      ((void (**)(void, void *, void))v11)[2](v11, v13, 0);
    }
  }
}

- (id)_currentVersion
{
  return &off_1000EADB0;
}

- (int64_t)controlFlags
{
  v2 = [(W5PeerStatusRequest *)self peer];
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

- (W5PeerStatusRequestPayload)requestPayload
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