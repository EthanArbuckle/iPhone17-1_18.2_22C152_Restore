@interface PKPendingProvisioning
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsCredential:(id)a3;
- (BOOL)representsPass:(id)a3;
- (BOOL)shouldAutoProvision;
- (NSDate)createdAt;
- (NSString)uniqueIdentifier;
- (PKPendingProvisioning)initWithCoder:(id)a3;
- (PKPendingProvisioning)initWithUniqueIdentifier:(id)a3 status:(int64_t)a4;
- (PKSecureElementProvisioningState)provisioningState;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credential;
- (id)description;
- (id)type;
- (int64_t)status;
- (unint64_t)provisioningAttemptCounter;
- (void)_copyIntoPendingProvision:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCanRetryProvisioning:(BOOL)a3;
- (void)setCreatedAt:(id)a3;
- (void)setProvisioningAttemptCounter:(unint64_t)a3;
- (void)setProvisioningState:(id)a3;
- (void)setShouldAutoProvision:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation PKPendingProvisioning

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingProvisioning;
  return [(PKPendingProvisioning *)&v3 init];
}

- (PKPendingProvisioning)initWithUniqueIdentifier:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPendingProvisioning;
  v7 = [(PKPendingProvisioning *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v8;

    v7->_status = a4;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    createdAt = v7->_createdAt;
    v7->_createdAt = (NSDate *)v10;

    v7->_shouldAutoProvision = 0;
  }

  return v7;
}

- (id)type
{
  return @"Unknown";
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  v7 = [(PKPendingProvisioning *)self type];
  [v6 appendFormat:@"type: '%@'; ", v7];

  [v6 appendFormat:@"id: '%@'; ", self->_uniqueIdentifier];
  unint64_t v8 = self->_status - 1;
  if (v8 > 4) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E56E2898[v8];
  }
  [v6 appendFormat:@"status: '%@'; ", v9];
  objc_msgSend(v6, "appendFormat:", @"provisioningAttemptCounter: '%lu'; ", self->_provisioningAttemptCounter);
  [v6 appendFormat:@">"];
  uint64_t v10 = [NSString stringWithString:v6];

  return v10;
}

- (void)setCanRetryProvisioning:(BOOL)a3
{
  self->_provisioningAttemptCounter = a3 - 1;
}

- (BOOL)representsCredential:(id)a3
{
  return 0;
}

- (BOOL)representsPass:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    id v6 = (void *)v5[2];
    v7 = self->_uniqueIdentifier;
    unint64_t v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_16;
      }
    }
    v11 = [(PKPendingProvisioning *)self type];
    v12 = [v5 type];
    v7 = v11;
    objc_super v13 = v12;
    v9 = v13;
    if (v7 == v13)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      if (v7 && v13) {
        LOBYTE(v10) = [(NSString *)v7 isEqualToString:v13];
      }
    }

    goto LABEL_15;
  }
  LOBYTE(v10) = 0;
LABEL_17:

  return v10;
}

- (id)credential
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingProvisioning)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPendingProvisioning;
  v5 = [(PKPendingProvisioning *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = PKPendingProvisioningStatusFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdAt_timeIntervalSince1970"];
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v9;

    v5->_shouldAutoProvision = [v4 decodeBoolForKey:@"shouldAutoProvision"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningState"];
    provisioningState = v5->_provisioningState;
    v5->_provisioningState = (PKSecureElementProvisioningState *)v11;

    v5->_provisioningAttemptCounter = [v4 decodeIntegerForKey:@"provisioningAttemptCounter"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v7 = a3;
  [v7 encodeObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  unint64_t v5 = self->_status - 1;
  if (v5 > 4) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56E2898[v5];
  }
  [v7 encodeObject:v6 forKey:@"status"];
  [v7 encodeObject:self->_createdAt forKey:@"createdAt_timeIntervalSince1970"];
  [v7 encodeBool:self->_shouldAutoProvision forKey:@"shouldAutoProvision"];
  [v7 encodeObject:self->_provisioningState forKey:@"provisioningState"];
  [v7 encodeInteger:self->_provisioningAttemptCounter forKey:@"provisioningAttemptCounter"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
  [(PKPendingProvisioning *)self _copyIntoPendingProvision:v4];
  return v4;
}

- (void)_copyIntoPendingProvision:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  unint64_t v5 = a3;
  uint64_t v6 = [(NSString *)uniqueIdentifier copy];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_status;
  uint64_t v8 = [(NSDate *)self->_createdAt copy];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  *((unsigned char *)v5 + 8) = self->_shouldAutoProvision;
  v5[5] = self->_provisioningAttemptCounter;
  id v10 = [(PKSecureElementProvisioningState *)self->_provisioningState createDivergentState];
  id v11 = (id)v5[6];
  v5[6] = v10;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (BOOL)shouldAutoProvision
{
  return self->_shouldAutoProvision;
}

- (void)setShouldAutoProvision:(BOOL)a3
{
  self->_shouldAutoProvision = a3;
}

- (unint64_t)provisioningAttemptCounter
{
  return self->_provisioningAttemptCounter;
}

- (void)setProvisioningAttemptCounter:(unint64_t)a3
{
  self->_provisioningAttemptCounter = a3;
}

- (PKSecureElementProvisioningState)provisioningState
{
  return self->_provisioningState;
}

- (void)setProvisioningState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningState, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end