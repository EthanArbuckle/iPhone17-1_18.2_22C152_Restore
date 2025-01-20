@interface W5PeerSnifferRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerSnifferRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 duration:(double)a5 uuid:(id)a6 channels:(id)a7 config:(id)a8 reply:(id)a9;
- (W5PeerSnifferRequestPayload)requestPayload;
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

@implementation W5PeerSnifferRequest

- (W5PeerSnifferRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 duration:(double)a5 uuid:(id)a6 channels:(id)a7 config:(id)a8 reply:(id)a9
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)W5PeerSnifferRequest;
  v22 = [(W5PeerSnifferRequest *)&v33 init];
  v23 = v22;
  if (!v17
    || !v22
    || (objc_storeStrong((id *)&v22->_peer, a3), !v21)
    || (id v24 = objc_retainBlock(v21), reply = v23->_reply, v23->_reply = v24, reply, a4 == 1)
    && (!v19 || (unint64_t)[v19 count] > 2))
  {

    v31 = sub_10009756C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 136315650;
      v35 = "-[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]";
      __int16 v36 = 2080;
      v37 = "W5PeerSnifferRequest.m";
      __int16 v38 = 1024;
      int v39 = 63;
      _os_log_send_and_compose_impl();
    }
    v23 = 0;
    goto LABEL_9;
  }
  identifier = v23->_identifier;
  v23->_discoveryFlags = 1;
  v23->_identifier = (NSString *)@"com.apple.wifi.peer.runSniffer";

  v27 = objc_alloc_init(W5PeerSnifferRequestPayload);
  requestPayload = v23->_requestPayload;
  v23->_requestPayload = v27;

  v29 = [(W5PeerSnifferRequest *)v23 _currentVersion];
  [(W5PeerSnifferRequestPayload *)v23->_requestPayload setVersion:v29];

  [(W5PeerSnifferRequestPayload *)v23->_requestPayload setChannels:v19];
  [(W5PeerSnifferRequestPayload *)v23->_requestPayload setDuration:a5];
  [(W5PeerSnifferRequestPayload *)v23->_requestPayload setUuid:v18];
  [(W5PeerSnifferRequestPayload *)v23->_requestPayload setType:a4];
  [(W5PeerSnifferRequestPayload *)v23->_requestPayload setNoAutoStop:0];
  if (v20)
  {
    v30 = [v20 objectForKey:@"noAutoStop"];
    -[W5PeerSnifferRequestPayload setNoAutoStop:](v23->_requestPayload, "setNoAutoStop:", [v30 BOOLValue]);

    v31 = [v20 objectForKey:@"rotationInterval"];
    [(W5PeerSnifferRequestPayload *)v23->_requestPayload setRotationInterval:[v31 integerValue]];
LABEL_9:
  }
  return v23;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 error];

  if (v5)
  {
    v6 = [(W5PeerSnifferRequest *)self reply];
    v7 = [v4 error];
    v6[2](v6, v7, 0, 0, 0);
  }
  else
  {
    v6 = [v4 payload];
    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315906;
      v26 = "-[W5PeerSnifferRequest handleResponse:]";
      __int16 v27 = 2080;
      v28 = "W5PeerSnifferRequest.m";
      __int16 v29 = 1024;
      int v30 = 76;
      __int16 v31 = 2048;
      id v32 = [v6 status];
      LODWORD(v22) = 38;
      id v21 = &v25;
      _os_log_send_and_compose_impl();
    }

    if ([v6 status] == (id)1)
    {
      uint64_t v9 = [v6 filePaths];
      if (v9
        && (v10 = (void *)v9,
            [v6 uuid],
            v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            v11))
      {
        v12 = sub_10009756C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v6 filePaths];
          v14 = [v6 uuid];
          int v25 = 138543618;
          v26 = v13;
          __int16 v27 = 2114;
          v28 = v14;
          _os_log_send_and_compose_impl();
        }
        v7 = [(W5PeerSnifferRequest *)self reply];
        v15 = [v6 filePaths];
        v16 = [v6 uuid];
        ((void (**)(void, void, void, void *, void *))v7)[2](v7, 0, 0, v15, v16);
      }
      else
      {
        v7 = [(W5PeerSnifferRequest *)self reply];
        v7[2](v7, 0, 0, 0, 0);
      }
    }
    else
    {
      id v17 = sub_10009756C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(W5PeerSnifferRequest *)self peer];
        int v25 = 138543362;
        v26 = v18;
        _os_log_send_and_compose_impl();
      }
      v7 = [(W5PeerSnifferRequest *)self reply];
      NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v24 = @"W5PeerSnifferResponseUndefinedError";
      id v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v20 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:13 userInfo:v19];
      ((void (**)(void, void *, void, void, void))v7)[2](v7, v20, 0, 0, 0);
    }
  }
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class();
}

- (id)_currentVersion
{
  return &off_1000EAD80;
}

- (int64_t)controlFlags
{
  v2 = [(W5PeerSnifferRequest *)self peer];
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
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

- (W5PeerSnifferRequestPayload)requestPayload
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