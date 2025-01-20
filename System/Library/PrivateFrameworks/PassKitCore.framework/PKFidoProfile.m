@interface PKFidoProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProfile:(id)a3;
- (NSString)accountHash;
- (NSString)keyHash;
- (NSString)relyingPartyIdentifier;
- (PKFidoProfile)initWithCoder:(id)a3;
- (PKFidoProfile)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountHash:(id)a3;
- (void)setKeyHash:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
@end

@implementation PKFidoProfile

- (PKFidoProfile)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKFidoProfile;
    v5 = [(PKFidoProfile *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 PKStringForKey:@"relyingPartyIdentifier"];
      relyingPartyIdentifier = v5->_relyingPartyIdentifier;
      v5->_relyingPartyIdentifier = (NSString *)v6;

      uint64_t v8 = [v4 PKStringForKey:@"accountHash"];
      accountHash = v5->_accountHash;
      v5->_accountHash = (NSString *)v8;

      uint64_t v10 = [v4 PKStringForKey:@"keyHash"];
      keyHash = v5->_keyHash;
      v5->_keyHash = (NSString *)v10;
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

- (PKFidoProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFidoProfile;
  v5 = [(PKFidoProfile *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountHash"];
    accountHash = v5->_accountHash;
    v5->_accountHash = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyHash"];
    keyHash = v5->_keyHash;
    v5->_keyHash = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  id v5 = a3;
  [v5 encodeObject:relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_accountHash forKey:@"accountHash"];
  [v5 encodeObject:self->_keyHash forKey:@"keyHash"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"relyingPartyIdentifier: %@; ", self->_relyingPartyIdentifier];
  [v3 appendFormat:@"accountHash: %@; ", self->_accountHash];
  [v3 appendFormat:@"keyHash: %@; ", self->_keyHash];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKFidoProfile *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKFidoProfile *)self isEqualToProfile:v5];

  return v6;
}

- (BOOL)isEqualToProfile:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_relyingPartyIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    LOBYTE(v10) = 0;
    goto LABEL_21;
  }
  BOOL v10 = [(NSString *)v6 isEqualToString:v7];

  if (v10)
  {
LABEL_10:
    v11 = (void *)v4[2];
    BOOL v6 = self->_accountHash;
    v12 = v11;
    if (v6 == v12)
    {

LABEL_16:
      keyHash = self->_keyHash;
      objc_super v14 = (void *)v4[3];
      BOOL v6 = keyHash;
      v15 = v14;
      if (v6 == v15)
      {
        LOBYTE(v10) = 1;
        uint64_t v8 = v6;
      }
      else
      {
        uint64_t v8 = v15;
        LOBYTE(v10) = 0;
        if (v6 && v15) {
          LOBYTE(v10) = [(NSString *)v6 isEqualToString:v15];
        }
      }
      goto LABEL_21;
    }
    uint64_t v8 = v12;
    LOBYTE(v10) = 0;
    if (v6 && v12)
    {
      BOOL v10 = [(NSString *)v6 isEqualToString:v12];

      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
LABEL_21:
  }
LABEL_22:

  return v10;
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKFidoProfile allocWithZone:](PKFidoProfile, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_relyingPartyIdentifier copyWithZone:a3];
  relyingPartyIdentifier = v5->_relyingPartyIdentifier;
  v5->_relyingPartyIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_accountHash copyWithZone:a3];
  accountHash = v5->_accountHash;
  v5->_accountHash = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_keyHash copyWithZone:a3];
  keyHash = v5->_keyHash;
  v5->_keyHash = (NSString *)v10;

  return v5;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (void)setAccountHash:(id)a3
{
}

- (NSString)keyHash
{
  return self->_keyHash;
}

- (void)setKeyHash:(id)a3
{
}

@end