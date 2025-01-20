@interface NNMKAccountIdentity
+ (BOOL)supportsSecureCoding;
- (NNMKAccountIdentity)initWithCoder:(id)a3;
- (NSString)accountId;
- (NSString)displayName;
- (NSString)refreshToken;
- (NSString)token;
- (NSString)username;
- (unint64_t)identityType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentityType:(unint64_t)a3;
- (void)setRefreshToken:(id)a3;
- (void)setToken:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation NNMKAccountIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKAccountIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NNMKAccountIdentity;
  v5 = [(NNMKAccountIdentity *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccountIdentifier"];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyUsername"];
    username = v5->_username;
    v5->_username = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyDisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyToken"];
    token = v5->_token;
    v5->_token = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyRefreshToken"];
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyType"];
    v5->_identityType = [v16 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountId = self->_accountId;
  id v5 = a3;
  [v5 encodeObject:accountId forKey:@"kNSCodingKeyAccountIdentifier"];
  [v5 encodeObject:self->_username forKey:@"kNSCodingKeyUsername"];
  [v5 encodeObject:self->_displayName forKey:@"kNSCodingKeyDisplayName"];
  [v5 encodeObject:self->_token forKey:@"kNSCodingKeyToken"];
  [v5 encodeObject:self->_refreshToken forKey:@"kNSCodingKeyRefreshToken"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_identityType];
  [v5 encodeObject:v6 forKey:@"kNSCodingKeyType"];
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
}

- (unint64_t)identityType
{
  return self->_identityType;
}

- (void)setIdentityType:(unint64_t)a3
{
  self->_identityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end