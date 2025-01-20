@interface PKAddSecureElementPassConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRequiredDataForProvisioning;
- (NSData)analyticsArchivedParentToken;
- (NSString)issuerIdentifier;
- (NSString)localizedDescription;
- (PKAddSecureElementPassConfiguration)initWithCoder:(id)a3;
- (PKAddSecureElementPassConfiguration)initWithType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)configurationType;
- (unint64_t)allowManagedAppleID;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsArchivedParentToken:(id)a3;
- (void)setIssuerIdentifier:(NSString *)issuerIdentifier;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)updateAllowManagedAppleIDWithConfiguration:(id)a3;
- (void)updateAllowManagedAppleIDWithEntitlements:(id)a3;
@end

@implementation PKAddSecureElementPassConfiguration

- (void)updateAllowManagedAppleIDWithEntitlements:(id)a3
{
  id v7 = a3;
  if ([v7 secureElementPassProvisioningForMAIDs])
  {
    unint64_t v4 = 1;
    v5 = v7;
  }
  else
  {
    char v6 = [v7 passesAllAccess];
    v5 = v7;
    if (v6) {
      goto LABEL_6;
    }
    unint64_t v4 = 2;
  }
  self->_allowManagedAppleID = v4;
LABEL_6:
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (PKAddSecureElementPassConfiguration)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassConfiguration;
  result = [(PKAddSecureElementPassConfiguration *)&v5 init];
  if (result) {
    result->_configurationType = a3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsArchivedParentToken, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t configurationType = self->_configurationType;
  id v8 = a3;
  [v8 encodeInteger:configurationType forKey:@"configurationType"];
  [v8 encodeObject:self->_issuerIdentifier forKey:@"issuerIdentifier"];
  [v8 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  unint64_t allowManagedAppleID = self->_allowManagedAppleID;
  char v6 = @"true";
  if (allowManagedAppleID != 1) {
    char v6 = 0;
  }
  if (allowManagedAppleID == 2) {
    id v7 = @"false";
  }
  else {
    id v7 = v6;
  }
  [v8 encodeObject:v7 forKey:@"allowManagedAppleID"];
}

- (PKAddSecureElementPassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAddSecureElementPassConfiguration;
  objc_super v5 = [(PKAddSecureElementPassConfiguration *)&v14 init];
  if (v5)
  {
    v5->_int64_t configurationType = [v4 decodeIntegerForKey:@"configurationType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerIdentifier"];
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowManagedAppleID"];
    if ([v10 isEqualToString:@"true"])
    {
      uint64_t v11 = 1;
    }
    else
    {
      int v12 = [v10 isEqualToString:@"false"];
      uint64_t v11 = 2;
      if (!v12) {
        uint64_t v11 = 0;
      }
    }
    v5->_unint64_t allowManagedAppleID = v11;
  }
  return v5;
}

- (BOOL)hasRequiredDataForProvisioning
{
  return 1;
}

- (void)updateAllowManagedAppleIDWithConfiguration:(id)a3
{
  self->_unint64_t allowManagedAppleID = [a3 allowManagedAppleID];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(PKAddSecureElementPassConfiguration *)self _extendableDescription:v3];
  [v3 appendFormat:@">"];
  return v3;
}

- (void)_extendableDescription:(id)a3
{
  int64_t configurationType = self->_configurationType;
  id v8 = a3;
  objc_msgSend(v8, "appendFormat:", @"configurationType: '%lu'; ", configurationType);
  [v8 appendFormat:@"issuerIdentifier: '%@'; ", self->_issuerIdentifier];
  [v8 appendFormat:@"localizedDescription: '%@'; ", self->_localizedDescription];
  unint64_t allowManagedAppleID = self->_allowManagedAppleID;
  uint64_t v6 = @"true";
  if (allowManagedAppleID != 1) {
    uint64_t v6 = 0;
  }
  if (allowManagedAppleID == 2) {
    id v7 = @"false";
  }
  else {
    id v7 = v6;
  }
  [v8 appendFormat:@"allowManagedAppleID: '%@'; ", v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[3] = self->_configurationType;
  uint64_t v6 = [(NSString *)self->_issuerIdentifier copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[4] = self->_allowManagedAppleID;
  return v5;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(NSString *)issuerIdentifier
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
}

- (unint64_t)allowManagedAppleID
{
  return self->_allowManagedAppleID;
}

- (NSData)analyticsArchivedParentToken
{
  return self->_analyticsArchivedParentToken;
}

- (void)setAnalyticsArchivedParentToken:(id)a3
{
}

@end