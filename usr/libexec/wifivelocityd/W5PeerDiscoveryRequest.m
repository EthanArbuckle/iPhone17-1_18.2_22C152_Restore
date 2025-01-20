@interface W5PeerDiscoveryRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerDiscoveryRequest:(id)a3;
- (NSUUID)uuid;
- (W5PeerDiscoveryConfiguration)configuration;
- (W5PeerDiscoveryRequest)initWithConfiguration:(id)a3 uuid:(id)a4 handler:(id)a5;
- (id)description;
- (id)handler;
- (unint64_t)hash;
- (void)setConfiguration:(id)a3;
- (void)setHandler:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5PeerDiscoveryRequest

- (W5PeerDiscoveryRequest)initWithConfiguration:(id)a3 uuid:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)W5PeerDiscoveryRequest;
  v12 = [(W5PeerDiscoveryRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_uuid, a4);
    id v14 = objc_retainBlock(v11);
    id handler = v13->_handler;
    v13->_id handler = v14;
  }
  return v13;
}

- (id)description
{
  v3 = +[NSMutableString stringWithCapacity:0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ : %p ", v5, self];

  v6 = [(W5PeerDiscoveryRequest *)self uuid];
  v7 = [v6 UUIDString];
  [v3 appendFormat:@"UUID='%@' ", v7];

  v8 = [(W5PeerDiscoveryRequest *)self configuration];
  [v3 appendFormat:@"configuration='%@'", v8];

  [v3 appendString:@">"];
  id v9 = [v3 copy];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (W5PeerDiscoveryRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(W5PeerDiscoveryRequest *)self isEqualToPeerDiscoveryRequest:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToPeerDiscoveryRequest:(id)a3
{
  id v4 = a3;
  v5 = [(W5PeerDiscoveryRequest *)self uuid];
  BOOL v6 = [v4 uuid];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(W5PeerDiscoveryRequest *)self uuid];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (W5PeerDiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end