@interface PKPendingProvisioningChange
+ (BOOL)supportsSecureCoding;
- (PKPendingProvisioning)pendingProvisioning;
- (PKPendingProvisioningChange)init;
- (PKPendingProvisioningChange)initWithCoder:(id)a3;
- (PKPendingProvisioningChange)initWithType:(unint64_t)a3 pendingProvisioning:(id)a4;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPendingProvisioningChange

- (PKPendingProvisioningChange)init
{
  return 0;
}

- (PKPendingProvisioningChange)initWithType:(unint64_t)a3 pendingProvisioning:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPendingProvisioningChange;
  v8 = [(PKPendingProvisioningChange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_pendingProvisioning, a4);
  }

  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  unint64_t type = self->_type;
  if (type > 3) {
    v8 = &stru_1EE0F5368;
  }
  else {
    v8 = off_1E56E3868[type];
  }
  [v6 appendFormat:@"type: '%@'; ", v8];
  [v6 appendFormat:@"pending: '%@'; ", self->_pendingProvisioning];
  [v6 appendFormat:@">"];
  v9 = [NSString stringWithString:v6];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingProvisioningChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKPendingProvisioningChange;
  v5 = [(PKPendingProvisioningChange *)&v33 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    id v7 = v6;
    v32 = v4;
    if (v6 != @"addition")
    {
      if (v6)
      {
        char v8 = [(__CFString *)v6 isEqualToString:@"addition"];

        if (v8) {
          goto LABEL_5;
        }
        v10 = v7;
        if (v10 != @"update")
        {
          objc_super v11 = v10;
          char v12 = [(__CFString *)v10 isEqualToString:@"update"];

          if ((v12 & 1) == 0)
          {
            v26 = v11;
            if (v26 == @"removeSuccess"
              || (v27 = v26,
                  char v28 = [(__CFString *)v26 isEqualToString:@"removeSuccess"],
                  v27,
                  (v28 & 1) != 0))
            {
              uint64_t v9 = 2;
              goto LABEL_9;
            }
            v29 = v27;
            if (v29 == @"removeFailure"
              || (v30 = v29,
                  int v31 = [(__CFString *)v29 isEqualToString:@"removeFailure"],
                  v30,
                  v31))
            {
              uint64_t v9 = 3;
              goto LABEL_9;
            }
          }
        }
      }
      uint64_t v9 = 1;
      goto LABEL_9;
    }
LABEL_5:
    uint64_t v9 = 0;
LABEL_9:

    v5->_unint64_t type = v9;
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v13, "initWithObjects:", v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    id v4 = v32;
    uint64_t v23 = [v32 decodeObjectOfClasses:v22 forKey:@"pendingProvisioning"];
    pendingProvisioning = v5->_pendingProvisioning;
    v5->_pendingProvisioning = (PKPendingProvisioning *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  if (type > 3) {
    v5 = &stru_1EE0F5368;
  }
  else {
    v5 = off_1E56E3868[type];
  }
  id v6 = a3;
  [v6 encodeObject:v5 forKey:@"type"];
  [v6 encodeObject:self->_pendingProvisioning forKey:@"pendingProvisioning"];
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPendingProvisioning)pendingProvisioning
{
  return self->_pendingProvisioning;
}

- (void).cxx_destruct
{
}

@end