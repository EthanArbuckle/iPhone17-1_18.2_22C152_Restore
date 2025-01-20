@interface SKSubscriptionValidationTokens
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSubscriptionValidationTokens:(id)a3;
- (NSString)encryptionValidationToken;
- (NSString)subscriptionValidationToken;
- (SKSubscriptionValidationTokens)initWithCoder:(id)a3;
- (SKSubscriptionValidationTokens)initWithSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKSubscriptionValidationTokens

- (SKSubscriptionValidationTokens)initWithSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKSubscriptionValidationTokens;
  v8 = [(SKSubscriptionValidationTokens *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    subscriptionValidationToken = v8->_subscriptionValidationToken;
    v8->_subscriptionValidationToken = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    encryptionValidationToken = v8->_encryptionValidationToken;
    v8->_encryptionValidationToken = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SKSubscriptionValidationTokens *)self subscriptionValidationToken];
  id v6 = [(SKSubscriptionValidationTokens *)self encryptionValidationToken];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; subscriptionValidationToken = \"%@\", encryptionValidationToken = \"%@\">",
    v4,
    self,
    v5,
  id v7 = v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SKSubscriptionValidationTokens *)self isEqualToSubscriptionValidationTokens:v4];

  return v5;
}

- (BOOL)isEqualToSubscriptionValidationTokens:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 subscriptionValidationToken];
  if ((v5 || self->_subscriptionValidationToken)
    && ([v4 subscriptionValidationToken],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:self->_subscriptionValidationToken],
        v6,
        v5,
        !v7))
  {
    char v10 = 0;
  }
  else
  {
    v8 = [v4 encryptionValidationToken];
    if (v8 || self->_encryptionValidationToken)
    {
      uint64_t v9 = [v4 encryptionValidationToken];
      char v10 = [v9 isEqualToString:self->_encryptionValidationToken];
    }
    else
    {
      char v10 = 1;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(SKSubscriptionValidationTokens *)self subscriptionValidationToken];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(SKSubscriptionValidationTokens *)self encryptionValidationToken];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subscriptionValidationToken = self->_subscriptionValidationToken;
  id v5 = a3;
  [v5 encodeObject:subscriptionValidationToken forKey:@"subscriptionToken"];
  [v5 encodeObject:self->_encryptionValidationToken forKey:@"encryptionToken"];
}

- (SKSubscriptionValidationTokens)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionToken"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionToken"];

  int v7 = [(SKSubscriptionValidationTokens *)self initWithSubscriptionValidationToken:v5 encryptionValidationToken:v6];
  return v7;
}

- (NSString)subscriptionValidationToken
{
  return self->_subscriptionValidationToken;
}

- (NSString)encryptionValidationToken
{
  return self->_encryptionValidationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionValidationToken, 0);
  objc_storeStrong((id *)&self->_subscriptionValidationToken, 0);
}

@end