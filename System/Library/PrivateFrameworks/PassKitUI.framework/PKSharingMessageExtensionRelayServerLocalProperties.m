@interface PKSharingMessageExtensionRelayServerLocalProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCheckedStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharingMessageExtensionRelayServerLocalProperties:(id)a3;
- (NSData)analyticsSessionToken;
- (NSString)passUniqueIdentifier;
- (PKPartialShareInvitation)partialInvite;
- (PKSharingMessageExtensionRelayServerLocalProperties)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsSessionToken:(id)a3;
- (void)setHasCheckedStatus:(BOOL)a3;
- (void)setPartialInvite:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
@end

@implementation PKSharingMessageExtensionRelayServerLocalProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMessageExtensionRelayServerLocalProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSharingMessageExtensionRelayServerLocalProperties;
  v5 = [(PKSharingMessageExtensionRelayServerLocalProperties *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partialInvite"];
    partialInvite = v5->_partialInvite;
    v5->_partialInvite = (PKPartialShareInvitation *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasCheckedStatus"];
    v5->_hasCheckedStatus = [v8 BOOLValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsSessionToken"];
    analyticsSessionToken = v5->_analyticsSessionToken;
    v5->_analyticsSessionToken = (NSData *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  partialInvite = self->_partialInvite;
  id v6 = a3;
  [v6 encodeObject:partialInvite forKey:@"partialInvite"];
  v5 = [NSNumber numberWithBool:self->_hasCheckedStatus];
  [v6 encodeObject:v5 forKey:@"hasCheckedStatus"];

  [v6 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v6 encodeObject:self->_analyticsSessionToken forKey:@"analyticsSessionToken"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"partialInvite: '%@'; ", self->_partialInvite];
  v7 = [NSNumber numberWithBool:self->_hasCheckedStatus];
  [v6 appendFormat:@"hasCheckedStatus: '%@'; ", v7];

  if (self->_analyticsSessionToken) {
    v8 = @"Yes";
  }
  else {
    v8 = @"No";
  }
  [v6 appendFormat:@"hasAnalyticsSessionToken: '%@'; ", v8];
  [v6 appendFormat:@">"];
  uint64_t v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_partialInvite];
  [v3 safelyAddObject:self->_analyticsSessionToken];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKSharingMessageExtensionRelayServerLocalProperties *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSharingMessageExtensionRelayServerLocalProperties *)self isEqualToSharingMessageExtensionRelayServerLocalProperties:v5];

  return v6;
}

- (BOOL)isEqualToSharingMessageExtensionRelayServerLocalProperties:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (PKEqualObjects() && self->_hasCheckedStatus == v4[8]) {
    char v5 = PKEqualObjects();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (PKPartialShareInvitation)partialInvite
{
  return self->_partialInvite;
}

- (void)setPartialInvite:(id)a3
{
}

- (BOOL)hasCheckedStatus
{
  return self->_hasCheckedStatus;
}

- (void)setHasCheckedStatus:(BOOL)a3
{
  self->_hasCheckedStatus = a3;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSData)analyticsSessionToken
{
  return self->_analyticsSessionToken;
}

- (void)setAnalyticsSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSessionToken, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_partialInvite, 0);
}

@end