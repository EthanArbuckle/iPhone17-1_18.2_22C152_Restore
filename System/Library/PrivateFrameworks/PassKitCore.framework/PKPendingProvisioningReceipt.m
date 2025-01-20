@interface PKPendingProvisioningReceipt
+ (BOOL)supportsSecureCoding;
+ (id)failedReceiptWithPendingProvisioning:(id)a3 error:(id)a4;
+ (id)remoteSuccessReceiptWithPendingProvisioning:(id)a3;
+ (id)successReceiptWithPendingProvisioning:(id)a3 passUniqueID:(id)a4;
- (NSError)error;
- (NSString)identifier;
- (NSString)passUniqueID;
- (PKPendingProvisioning)pendingProvisioning;
- (PKPendingProvisioningReceipt)initWithCoder:(id)a3;
- (double)createdAt;
- (id)_initWithPendingProvisioning:(id)a3 type:(int64_t)a4 passUniqueID:(id)a5 error:(id)a6;
- (id)description;
- (id)initForDatabase;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAt:(double)a3;
- (void)setError:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setPendingProvisioning:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKPendingProvisioningReceipt

+ (id)failedReceiptWithPendingProvisioning:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PKPendingProvisioningReceipt alloc] _initWithPendingProvisioning:v6 type:2 passUniqueID:0 error:v5];

  return v7;
}

+ (id)successReceiptWithPendingProvisioning:(id)a3 passUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PKPendingProvisioningReceipt alloc] _initWithPendingProvisioning:v6 type:1 passUniqueID:v5 error:0];

  return v7;
}

+ (id)remoteSuccessReceiptWithPendingProvisioning:(id)a3
{
  id v3 = a3;
  id v4 = [[PKPendingProvisioningReceipt alloc] _initWithPendingProvisioning:v3 type:1 passUniqueID:0 error:0];

  return v4;
}

- (id)_initWithPendingProvisioning:(id)a3 type:(int64_t)a4 passUniqueID:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPendingProvisioningReceipt;
  v13 = [(PKPendingProvisioningReceipt *)&v26 init];
  if (v13)
  {
    v14 = [v10 provisioningState];
    v15 = [v14 sid];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      v17 = [v10 uniqueIdentifier];
    }
    identifier = v13->_identifier;
    v13->_identifier = v17;

    v13->_type = a4;
    objc_storeStrong((id *)&v13->_passUniqueID, a5);
    objc_storeStrong((id *)&v13->_error, a6);
    v13->_createdAt = CFAbsoluteTimeGetCurrent();
    uint64_t v19 = [v10 copy];
    pendingProvisioning = v13->_pendingProvisioning;
    v13->_pendingProvisioning = (PKPendingProvisioning *)v19;

    id v21 = [NSString alloc];
    v22 = v13->_identifier;
    v23 = [(PKPendingProvisioning *)v13->_pendingProvisioning uniqueIdentifier];
    v24 = (void *)[v21 initWithFormat:@"Receipt-%@-%@", v22, v23];

    [(PKPendingProvisioning *)v13->_pendingProvisioning setUniqueIdentifier:v24];
    [(PKPendingProvisioning *)v13->_pendingProvisioning setStatus:4];
  }
  return v13;
}

- (id)initForDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PKPendingProvisioningReceipt;
  return [(PKPendingProvisioningReceipt *)&v3 init];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@"id: '%@'; ", self->_identifier];
  int64_t type = self->_type;
  v8 = &stru_1EE0F5368;
  if (type == 2) {
    v8 = @"failed";
  }
  if (type == 1) {
    v9 = @"provisioned";
  }
  else {
    v9 = v8;
  }
  [v6 appendFormat:@"type: '%@'; ", v9];
  if (self->_passUniqueID) {
    [v6 appendFormat:@"passUniqueID: '%@'; ", self->_passUniqueID];
  }
  if (self->_error) {
    [v6 appendFormat:@"error: '%@'; ", self->_error];
  }
  objc_msgSend(v6, "appendFormat:", @"createdAt: '%lu'; ", (unint64_t)self->_createdAt);
  [v6 appendFormat:@"pending: '%@'; ", self->_pendingProvisioning];
  [v6 appendFormat:@">"];
  id v10 = (void *)[v6 copy];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingProvisioningReceipt)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPendingProvisioningReceipt;
  id v5 = [(PKPendingProvisioningReceipt *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_int64_t type = PKPendingProvisioningReceiptTypeFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueID"];
    passUniqueID = v5->_passUniqueID;
    v5->_passUniqueID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdAt"];
    [v13 doubleValue];
    v5->_createdAt = v14;

    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v15, "initWithObjects:", v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"pendingProvisioning"];
    pendingProvisioning = v5->_pendingProvisioning;
    v5->_pendingProvisioning = (PKPendingProvisioning *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v9 = a3;
  [v9 encodeObject:identifier forKey:@"identifier"];
  int64_t type = self->_type;
  uint64_t v6 = &stru_1EE0F5368;
  if (type == 2) {
    uint64_t v6 = @"failed";
  }
  if (type == 1) {
    id v7 = @"provisioned";
  }
  else {
    id v7 = v6;
  }
  [v9 encodeObject:v7 forKey:@"type"];
  [v9 encodeObject:self->_passUniqueID forKey:@"passUniqueID"];
  [v9 encodeObject:self->_error forKey:@"error"];
  v8 = [NSNumber numberWithDouble:self->_createdAt];
  [v9 encodeObject:v8 forKey:@"createdAt"];

  [v9 encodeObject:self->_pendingProvisioning forKey:@"pendingProvisioning"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (double)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(double)a3
{
  self->_createdAt = a3;
}

- (PKPendingProvisioning)pendingProvisioning
{
  return self->_pendingProvisioning;
}

- (void)setPendingProvisioning:(id)a3
{
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_pendingProvisioning, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end