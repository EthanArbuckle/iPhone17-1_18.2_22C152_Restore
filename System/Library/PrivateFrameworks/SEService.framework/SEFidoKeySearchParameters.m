@interface SEFidoKeySearchParameters
+ (BOOL)supportsSecureCoding;
+ (id)withRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5;
- (NSData)fidoKeyHash;
- (NSString)relyingParty;
- (NSString)relyingPartyAccountHash;
- (SEFidoKeySearchParameters)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEFidoKeySearchParameters

+ (id)withRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = (void *)v10[1];
  v10[1] = v7;
  id v12 = v7;

  v13 = (void *)v10[2];
  v10[2] = v8;
  id v14 = v8;

  v15 = (void *)v10[3];
  v10[3] = v9;

  return v10;
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
}

- (SEFidoKeySearchParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SEFidoKeySearchParameters;
  id v5 = [(SEFidoKeySearchParameters *)&v13 init];
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
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"relyingParty %@ rpAccountHash %@ keyHash %@", self->_relyingParty, self->_relyingPartyAccountHash, self->_fidoKeyHash];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidoKeyHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyAccountHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
}

@end