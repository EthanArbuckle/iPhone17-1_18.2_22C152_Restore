@interface SESPeerIdentity
+ (id)withOTPeerIdentity:(id)a3;
+ (id)withPeerIdentifier:(id)a3 peerData:(id)a4;
- (NSData)peerData;
- (NSData)peerIdentifier;
- (id)asOTPeerIdentity;
@end

@implementation SESPeerIdentity

+ (id)withPeerIdentifier:(id)a3 peerData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

+ (id)withOTPeerIdentity:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 peerIdentifier];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [v3 peerData];

  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (id)asOTPeerIdentity
{
  id v3 = objc_opt_new();
  [v3 setPeerData:self->_peerData];
  [v3 setPeerIdentifier:self->_peerIdentifier];
  return v3;
}

- (NSData)peerIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)peerData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerData, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
}

@end