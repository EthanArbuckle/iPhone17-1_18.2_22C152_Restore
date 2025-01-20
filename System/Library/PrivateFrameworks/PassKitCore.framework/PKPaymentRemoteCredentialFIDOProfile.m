@interface PKPaymentRemoteCredentialFIDOProfile
- (BOOL)isEqual:(id)a3;
- (NSData)keyHash;
- (NSString)accountHash;
- (NSString)relyingPartyIdentifier;
- (PKPaymentRemoteCredentialFIDOProfile)init;
- (PKPaymentRemoteCredentialFIDOProfile)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PKPaymentRemoteCredentialFIDOProfile

- (PKPaymentRemoteCredentialFIDOProfile)init
{
  return [(PKPaymentRemoteCredentialFIDOProfile *)self initWithDictionary:0];
}

- (PKPaymentRemoteCredentialFIDOProfile)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPaymentRemoteCredentialFIDOProfile;
    v5 = [(PKPaymentRemoteCredentialFIDOProfile *)&v18 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"relyingPartyIdentifier"];
      uint64_t v7 = [v6 copy];
      relyingPartyIdentifier = v5->_relyingPartyIdentifier;
      v5->_relyingPartyIdentifier = (NSString *)v7;

      v9 = [v4 objectForKeyedSubscript:@"accountHash"];
      uint64_t v10 = [v9 copy];
      accountHash = v5->_accountHash;
      v5->_accountHash = (NSString *)v10;

      v12 = (void *)MEMORY[0x1E4F1C9B8];
      v13 = [v4 objectForKeyedSubscript:@"keyHash"];
      uint64_t v14 = [v12 dataWithHexEncodedString:v13];
      keyHash = v5->_keyHash;
      v5->_keyHash = (NSData *)v14;
    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentRemoteCredentialFIDOProfile *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v18.receiver = self;
      v18.super_class = (Class)PKPaymentRemoteCredentialFIDOProfile;
      if (![(PKPaymentRemoteCredentialFIDOProfile *)&v18 isEqual:v5]) {
        goto LABEL_18;
      }
      relyingPartyIdentifier = v5->_relyingPartyIdentifier;
      uint64_t v7 = self->_relyingPartyIdentifier;
      v8 = relyingPartyIdentifier;
      if (v7 == v8)
      {
      }
      else
      {
        v9 = v8;
        if (!v7 || !v8) {
          goto LABEL_17;
        }
        BOOL v10 = [(NSString *)v7 isEqualToString:v8];

        if (!v10) {
          goto LABEL_18;
        }
      }
      accountHash = v5->_accountHash;
      uint64_t v7 = self->_accountHash;
      v13 = accountHash;
      if (v7 == v13)
      {

LABEL_22:
        keyHash = self->_keyHash;
        v17 = v5->_keyHash;
        if (keyHash && v17) {
          char v11 = -[NSData isEqual:](keyHash, "isEqual:");
        }
        else {
          char v11 = keyHash == v17;
        }
        goto LABEL_19;
      }
      v9 = v13;
      if (v7 && v13)
      {
        BOOL v14 = [(NSString *)v7 isEqualToString:v13];

        if (v14) {
          goto LABEL_22;
        }
LABEL_18:
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_relyingPartyIdentifier];
  [v3 safelyAddObject:self->_accountHash];
  [v3 safelyAddObject:self->_keyHash];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"relyingPartyIdentifier: '%@'; ", self->_relyingPartyIdentifier];
  [v3 appendFormat:@"accountHash: '%@'; ", self->_accountHash];
  [v3 appendFormat:@"keyHash: '%@'; ", self->_keyHash];
  [v3 appendFormat:@">"];
  unint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end