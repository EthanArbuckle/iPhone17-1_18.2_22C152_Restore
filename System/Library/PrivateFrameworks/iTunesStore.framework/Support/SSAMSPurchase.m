@interface SSAMSPurchase
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPurchase:(id)a3;
- (BOOL)isPreauthenticated;
- (NSNumber)accountIdentifier;
- (NSString)mediaType;
- (SSAMSPurchase)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setPreauthenticated:(BOOL)a3;
@end

@implementation SSAMSPurchase

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSAMSPurchase;
  id v4 = a3;
  [(SSAMSPurchase *)&v7 encodeWithCoder:v4];
  v5 = [(SSAMSPurchase *)self accountIdentifier];
  [v4 encodeObject:v5 forKey:@"accountIdentifier"];

  v6 = [(SSAMSPurchase *)self mediaType];
  [v4 encodeObject:v6 forKey:@"mediaType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated"), @"preauthenticated");
}

- (SSAMSPurchase)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSAMSPurchase;
  v5 = [(SSAMSPurchase *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v8;

    v5->_preauthenticated = [v4 decodeBoolForKey:@"preauthenticated"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)SSAMSPurchase;
  unint64_t v3 = [(SSAMSPurchase *)&v10 hash];
  id v4 = [(SSAMSPurchase *)self accountIdentifier];
  unint64_t v5 = (unint64_t)[v4 hash];
  uint64_t v6 = [(SSAMSPurchase *)self mediaType];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];
  unint64_t v8 = v7 ^ [(SSAMSPurchase *)self isPreauthenticated] ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SSAMSPurchase *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(SSAMSPurchase *)self isEqualToPurchase:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPurchase:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SSAMSPurchase *)self uniqueIdentifier];
  BOOL v6 = [v4 uniqueIdentifier];
  if ([v5 isEqualToNumber:v6])
  {
    unint64_t v7 = [(SSAMSPurchase *)self accountIdentifier];
    unint64_t v8 = [v4 accountIdentifier];
    if ([v7 isEqualToNumber:v8])
    {
      v9 = [(SSAMSPurchase *)self mediaType];
      objc_super v10 = [v4 mediaType];
      if ([v9 isEqualToString:v10])
      {
        unsigned int v11 = [(SSAMSPurchase *)self isPreauthenticated];
        unsigned int v12 = v11 ^ [v4 isPreauthenticated] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (BOOL)isPreauthenticated
{
  return self->_preauthenticated;
}

- (void)setPreauthenticated:(BOOL)a3
{
  self->_preauthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end