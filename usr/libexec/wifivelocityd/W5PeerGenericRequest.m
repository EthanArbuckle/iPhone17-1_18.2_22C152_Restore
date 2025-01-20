@interface W5PeerGenericRequest
- (Class)responsePayloadClass;
- (NSDictionary)requestInfo;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerRequestPayload)requestPayload;
- (id)responseHandler;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setControlFlags:(int64_t)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation W5PeerGenericRequest

- (W5PeerRequestPayload)requestPayload
{
  v3 = objc_alloc_init(W5PeerGenericRequestPayload);
  v4 = [(W5PeerGenericRequest *)self requestInfo];
  [(W5PeerGenericRequestPayload *)v3 setInfo:v4];

  return (W5PeerRequestPayload *)v3;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 error];
  v6 = [v4 payload];
  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 info];
    v13 = [v4 options];
    _os_log_send_and_compose_impl();
  }
  v9 = [(W5PeerGenericRequest *)self responseHandler];

  if (v9)
  {
    v10 = [(W5PeerGenericRequest *)self responseHandler];
    v11 = [v6 info];
    v12 = [v4 options];
    ((void (**)(void, void *, void *, void *))v10)[2](v10, v5, v11, v12);
  }
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class();
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_controlFlags = a3;
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

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_peer, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end