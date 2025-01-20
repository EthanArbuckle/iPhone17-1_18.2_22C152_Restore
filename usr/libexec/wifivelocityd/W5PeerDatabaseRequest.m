@interface W5PeerDatabaseRequest
- (Class)responsePayloadClass;
- (NSFetchRequest)fetch;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerDatabaseRequest)initWithPeer:(id)a3 fetch:(id)a4 reply:(id)a5;
- (W5PeerDatabaseRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setFetch:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
@end

@implementation W5PeerDatabaseRequest

- (W5PeerDatabaseRequest)initWithPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)W5PeerDatabaseRequest;
  v12 = [(W5PeerDatabaseRequest *)&v22 init];
  v13 = v12;
  if (v9 && v12 && (objc_storeStrong((id *)&v12->_peer, a3), v10) && (objc_storeStrong((id *)&v13->_fetch, a4), v11))
  {
    id v14 = objc_retainBlock(v11);
    id reply = v13->_reply;
    v13->_id reply = v14;

    identifier = v13->_identifier;
    v13->_discoveryFlags = 1;
    v13->_identifier = (NSString *)@"com.apple.wifi.peer.dbQuery";

    v17 = objc_alloc_init(W5PeerDatabaseRequestPayload);
    requestPayload = v13->_requestPayload;
    v13->_requestPayload = v17;

    v19 = [(W5PeerDatabaseRequest *)v13 _currentVersion];
    [(W5PeerDatabaseRequestPayload *)v13->_requestPayload setVersion:v19];

    [(W5PeerDatabaseRequestPayload *)v13->_requestPayload setFetchRequest:v13->_fetch];
  }
  else
  {

    v21 = sub_10009756C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315138;
      v24 = "-[W5PeerDatabaseRequest initWithPeer:fetch:reply:]";
      _os_log_send_and_compose_impl();
    }

    v13 = 0;
  }

  return v13;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 error];

  if (!v5)
  {
    v6 = [v4 payload];
    v7 = [v6 fetchedResults];
    if ([v6 status] == (id)1)
    {
      v8 = sub_10009756C();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          int v23 = 136316162;
          v24 = "-[W5PeerDatabaseRequest handleResponse:]";
          __int16 v25 = 2080;
          v26 = "W5PeerDatabaseRequest.m";
          __int16 v27 = 1024;
          int v28 = 69;
          __int16 v29 = 2080;
          v30 = "-[W5PeerDatabaseRequest handleResponse:]";
          __int16 v31 = 2048;
          id v32 = [v7 count];
          _os_log_send_and_compose_impl();
        }

        id v10 = [(W5PeerDatabaseRequest *)self reply];
        ((void (**)(void, void, void *))v10)[2](v10, 0, v7);
        goto LABEL_15;
      }
      if (v9)
      {
        v15 = [(W5PeerDatabaseRequest *)self peer];
        int v23 = 136316162;
        v24 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v25 = 2080;
        v26 = "W5PeerDatabaseRequest.m";
        __int16 v27 = 1024;
        int v28 = 72;
        __int16 v29 = 2080;
        v30 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v31 = 2112;
        id v32 = v15;
        LODWORD(v18) = 48;
        v17 = &v23;
        _os_log_send_and_compose_impl();
      }
      id v10 = [(W5PeerDatabaseRequest *)self reply];
      NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v22 = @"W5NoErr";
      v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v14 = 0;
    }
    else
    {
      id v11 = sub_10009756C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(W5PeerDatabaseRequest *)self peer];
        int v23 = 136316162;
        v24 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v25 = 2080;
        v26 = "W5PeerDatabaseRequest.m";
        __int16 v27 = 1024;
        int v28 = 76;
        __int16 v29 = 2080;
        v30 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v31 = 2112;
        id v32 = v12;
        LODWORD(v18) = 48;
        v17 = &v23;
        _os_log_send_and_compose_impl();
      }
      id v10 = [(W5PeerDatabaseRequest *)self reply];
      NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v20 = @"W5PeerDatabaseResponseUndefinedError";
      v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v14 = 14;
    }
    v16 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error", v14, v13, v17, v18 code userInfo];
    ((void (**)(void, void *, void))v10)[2](v10, v16, 0);

LABEL_15:
    goto LABEL_16;
  }
  v6 = [(W5PeerDatabaseRequest *)self reply];
  v7 = [v4 error];
  ((void (**)(void, void *, void))v6)[2](v6, v7, 0);
LABEL_16:
}

- (id)_currentVersion
{
  return &off_1000EAD68;
}

- (int64_t)controlFlags
{
  v2 = [(W5PeerDatabaseRequest *)self peer];
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

- (NSFetchRequest)fetch
{
  return self->_fetch;
}

- (void)setFetch:(id)a3
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

- (W5PeerDatabaseRequestPayload)requestPayload
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
  objc_storeStrong((id *)&self->_fetch, 0);

  objc_storeStrong((id *)&self->_peer, 0);
}

@end