@interface MRDGroupSessionJoinResponse
- (MRDGroupSessionJoinResponse)initWithNearbyGroup:(id)a3 publicSigningKeyData:(id)a4 joinToken:(id)a5;
- (MRGroupSessionToken)joinToken;
- (NSData)publicSigningKeyData;
- (NSString)sessionIdentifier;
- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup;
@end

@implementation MRDGroupSessionJoinResponse

- (MRDGroupSessionJoinResponse)initWithNearbyGroup:(id)a3 publicSigningKeyData:(id)a4 joinToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRDGroupSessionJoinResponse;
  v12 = [(MRDGroupSessionJoinResponse *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v9 identifier];
    sessionIdentifier = v12->_sessionIdentifier;
    v12->_sessionIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_nearbyGroup, a3);
    objc_storeStrong((id *)&v12->_publicSigningKeyData, a4);
    objc_storeStrong((id *)&v12->_joinToken, a5);
  }

  return v12;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup
{
  return self->_nearbyGroup;
}

- (NSData)publicSigningKeyData
{
  return self->_publicSigningKeyData;
}

- (MRGroupSessionToken)joinToken
{
  return self->_joinToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinToken, 0);
  objc_storeStrong((id *)&self->_publicSigningKeyData, 0);
  objc_storeStrong((id *)&self->_nearbyGroup, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end