@interface SEFidoKeySignResult
+ (BOOL)supportsSecureCoding;
+ (id)withRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 fidoAssertion:(id)a6;
- (NSData)fidoAssertion;
- (NSData)fidoKeyHash;
- (NSData)signedChallenge;
- (NSString)relyingParty;
- (NSString)relyingPartyAccountHash;
- (SEFidoKeySignResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEFidoKeySignResult

+ (id)withRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 fidoAssertion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_new();
  v14 = (void *)v13[1];
  v13[1] = v9;
  id v15 = v9;

  v16 = (void *)v13[2];
  v13[2] = v10;
  id v17 = v10;

  v18 = (void *)v13[3];
  v13[3] = v11;
  id v19 = v11;

  v20 = (void *)v13[4];
  v13[4] = v12;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  relyingParty = self->_relyingParty;
  id v5 = a3;
  [v5 encodeObject:relyingParty forKey:@"relyingParty"];
  [v5 encodeObject:self->_relyingPartyAccountHash forKey:@"relyingPartyAccountHash"];
  [v5 encodeObject:self->_fidoKeyHash forKey:@"fidoKeyHash"];
  [v5 encodeObject:self->_fidoAssertion forKey:@"fidoAssertion"];
}

- (SEFidoKeySignResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SEFidoKeySignResult;
  id v5 = [(SEFidoKeySignResult *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingParty"];
    relyingParty = v5->_relyingParty;
    v5->_relyingParty = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyAccountHash"];
    relyingPartyAccountHash = v5->_relyingPartyAccountHash;
    v5->_relyingPartyAccountHash = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoKeyHash"];
    fidoKeyHash = v5->_fidoKeyHash;
    v5->_fidoKeyHash = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoAssertion"];
    fidoAssertion = v5->_fidoAssertion;
    v5->_fidoAssertion = (NSData *)v12;
  }
  return v5;
}

- (NSData)signedChallenge
{
  return self->_fidoAssertion;
}

- (NSString)relyingParty
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)relyingPartyAccountHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)fidoKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)fidoAssertion
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoAssertion, 0);
  objc_storeStrong((id *)&self->_fidoKeyHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
}

@end