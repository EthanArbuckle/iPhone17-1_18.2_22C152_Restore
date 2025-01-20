@interface WPPeerTrackingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)peerTrackingDictionary;
- (NSUUID)peerUUID;
- (WPPeerTrackingRequest)init;
- (WPPeerTrackingRequest)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)clientType;
- (void)encodeWithCoder:(id)a3;
- (void)setClientType:(unsigned __int8)a3;
- (void)setPeerTrackingDictionary:(id)a3;
- (void)setPeerUUID:(id)a3;
@end

@implementation WPPeerTrackingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WPPeerTrackingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)WPPeerTrackingRequest;
  v2 = [(WPPeerTrackingRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    peerTrackingDictionary = v2->_peerTrackingDictionary;
    v2->_peerTrackingDictionary = (NSDictionary *)MEMORY[0x263EFFA78];

    v3->_clientType = 27;
  }
  return v3;
}

- (WPPeerTrackingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPPeerTrackingRequest;
  v5 = [(WPPeerTrackingRequest *)&v11 init];
  if (v5)
  {
    v5->_clientType = [v4 decodeIntegerForKey:@"kClientType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPeerUUID"];
    peerUUID = v5->_peerUUID;
    v5->_peerUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPeerTrackingData"];
    peerTrackingDictionary = v5->_peerTrackingDictionary;
    v5->_peerTrackingDictionary = (NSDictionary *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPPeerTrackingRequest clientType](self, "clientType"), @"kClientType");
  v5 = [(WPPeerTrackingRequest *)self peerUUID];
  [v4 encodeObject:v5 forKey:@"kPeerUUID"];

  id v6 = [(WPPeerTrackingRequest *)self peerTrackingDictionary];
  [v4 encodeObject:v6 forKey:@"kPeerTrackingData"];
}

- (id)description
{
  v2 = NSString;
  v3 = [(WPPeerTrackingRequest *)self peerUUID];
  id v4 = [v2 stringWithFormat:@"peer tracking request for UUID %@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WPPeerTrackingRequest *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    int v7 = [(WPPeerTrackingRequest *)v6 clientType];
    if (v7 == [(WPPeerTrackingRequest *)self clientType])
    {
      uint64_t v8 = [(WPPeerTrackingRequest *)v6 peerUUID];
      v9 = [(WPPeerTrackingRequest *)self peerUUID];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(WPPeerTrackingRequest *)self peerUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

- (NSUUID)peerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPeerUUID:(id)a3
{
}

- (NSDictionary)peerTrackingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerTrackingDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrackingDictionary, 0);
  objc_storeStrong((id *)&self->_peerUUID, 0);
}

@end