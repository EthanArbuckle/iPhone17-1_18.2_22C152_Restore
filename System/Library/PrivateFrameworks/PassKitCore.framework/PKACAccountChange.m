@interface PKACAccountChange
+ (BOOL)supportsSecureCoding;
- (BOOL)accountManagedStateChanged;
- (BOOL)accountOrderChanged;
- (BOOL)accountStorefrontChanged;
- (BOOL)enablementOfRelevantDataclassesChanged;
- (BOOL)enablementOfUbiquityDataclassChanged;
- (BOOL)enablementOfWalletDataclassChanged;
- (PKACAccountChange)initWithChangeType:(int)a3 event:(int64_t)a4 newAccount:(id)a5 oldAccount:(id)a6;
- (PKACAccountChange)initWithChangeType:(int)a3 newAccount:(id)a4 oldAccount:(id)a5;
- (PKACAccountChange)initWithCoder:(id)a3;
- (id)description;
- (int64_t)_operationTypeForChangeType:(int)a3 newAccount:(id)a4 oldAccount:(id)a5;
- (int64_t)event;
- (int64_t)operation;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKACAccountChange

- (PKACAccountChange)initWithChangeType:(int)a3 newAccount:(id)a4 oldAccount:(id)a5
{
  return [(PKACAccountChange *)self initWithChangeType:*(void *)&a3 event:0 newAccount:a4 oldAccount:a5];
}

- (PKACAccountChange)initWithChangeType:(int)a3 event:(int64_t)a4 newAccount:(id)a5 oldAccount:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v43.receiver = self;
  v43.super_class = (Class)PKACAccountChange;
  v12 = [(PKACAccountChange *)&v43 init];
  if (!v12)
  {
LABEL_25:
    v40 = v12;
    goto LABEL_26;
  }
  if (v10) {
    v13 = v10;
  }
  else {
    v13 = v11;
  }
  id v14 = v13;
  v15 = [v14 accountType];
  v16 = [v15 identifier];
  v17 = (void *)*MEMORY[0x1E4F17750];
  id v18 = v16;
  id v19 = v17;
  if (v18 == v19)
  {
    uint64_t v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v20 = v19;
  if (v18 && v19)
  {
    char v21 = [v18 isEqualToString:v19];

    if (v21)
    {
      uint64_t v22 = 0;
LABEL_19:
      v12->_type = v22;
      v12->_operation = [(PKACAccountChange *)v12 _operationTypeForChangeType:v8 newAccount:v10 oldAccount:v11];
      v12->_event = a4;
      uint64_t v28 = *MEMORY[0x1E4F17628];
      char v29 = [v10 isEnabledForDataclass:*MEMORY[0x1E4F17628]];
      v12->_enablementOfWalletDataclassChanged = v29 ^ [v11 isEnabledForDataclass:v28];
      uint64_t v30 = *MEMORY[0x1E4F17640];
      char v31 = [v10 isEnabledForDataclass:*MEMORY[0x1E4F17640]];
      v12->_enablementOfUbiquityDataclassChanged = v31 ^ [v11 isEnabledForDataclass:v30];
      LOBYTE(v30) = objc_msgSend(v10, "aa_isManagedAppleID");
      v12->_accountManagedStateChanged = v30 ^ objc_msgSend(v11, "aa_isManagedAppleID");
      uint64_t v32 = *MEMORY[0x1E4F4BF38];
      char v33 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
      v12->_accountOrderChanged = v33 ^ objc_msgSend(v11, "aa_isAccountClass:", v32);
      v34 = objc_msgSend(v10, "ams_storefront");
      v35 = objc_msgSend(v11, "ams_storefront");
      id v36 = v34;
      id v37 = v35;
      v38 = v37;
      if (v36 == v37)
      {
        char v39 = 0;
      }
      else
      {
        char v39 = 1;
        if (v36 && v37) {
          char v39 = [v36 isEqualToString:v37] ^ 1;
        }
      }

      v12->_accountStorefrontChanged = v39;
      goto LABEL_25;
    }
  }
  else
  {
  }
  v15 = [v14 accountType];
  v23 = [v15 identifier];
  v24 = (void *)*MEMORY[0x1E4F17890];
  id v18 = v23;
  id v25 = v24;
  if (v18 == v25)
  {
    uint64_t v22 = 1;
    goto LABEL_18;
  }
  v26 = v25;
  if (v18 && v25)
  {
    char v27 = [v18 isEqualToString:v25];

    if (v27)
    {
      uint64_t v22 = 1;
      goto LABEL_19;
    }
  }
  else
  {
  }
  v42 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v14;
    _os_log_impl(&dword_190E10000, v42, OS_LOG_TYPE_DEFAULT, "Error: attempted to initialize PKACAccountChange for unknown account type %@", buf, 0xCu);
  }

  v40 = 0;
LABEL_26:

  return v40;
}

- (BOOL)enablementOfRelevantDataclassesChanged
{
  return self->_enablementOfWalletDataclassChanged || self->_enablementOfUbiquityDataclassChanged;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKACAccountChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKACAccountChange;
  v5 = [(PKACAccountChange *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operation"];
    v5->_operation = [v7 integerValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
    v5->_event = [v8 integerValue];

    v5->_enablementOfWalletDataclassChanged = [v4 decodeBoolForKey:@"walletDataclassChanged"];
    v5->_enablementOfUbiquityDataclassChanged = [v4 decodeBoolForKey:@"ubiquityDataclassChanged"];
    v5->_accountManagedStateChanged = [v4 decodeBoolForKey:@"managedStateChanged"];
    v5->_accountOrderChanged = [v4 decodeBoolForKey:@"orderChanged"];
    v5->_accountStorefrontChanged = [v4 decodeBoolForKey:@"storefrontChanged"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t type = self->_type;
  id v9 = a3;
  v6 = [v4 numberWithInteger:type];
  [v9 encodeObject:v6 forKey:@"type"];

  v7 = [NSNumber numberWithInteger:self->_operation];
  [v9 encodeObject:v7 forKey:@"operation"];

  uint64_t v8 = [NSNumber numberWithInteger:self->_event];
  [v9 encodeObject:v8 forKey:@"event"];

  [v9 encodeBool:self->_enablementOfWalletDataclassChanged forKey:@"walletDataclassChanged"];
  [v9 encodeBool:self->_enablementOfUbiquityDataclassChanged forKey:@"ubiquityDataclassChanged"];
  [v9 encodeBool:self->_accountManagedStateChanged forKey:@"managedStateChanged"];
  [v9 encodeBool:self->_accountOrderChanged forKey:@"orderChanged"];
  [v9 encodeBool:self->_accountStorefrontChanged forKey:@"storefrontChanged"];
}

- (id)description
{
  id result = (id)NSString;
  int64_t type = self->_type;
  if (type)
  {
    if (type != 1)
    {
LABEL_23:
      __break(1u);
      return result;
    }
    v5 = @"itunesstore";
  }
  else
  {
    v5 = @"appleaccount";
  }
  unint64_t operation = self->_operation;
  if (operation >= 4) {
    goto LABEL_23;
  }
  unint64_t event = self->_event;
  if (event >= 3) {
    goto LABEL_23;
  }
  uint64_t v8 = off_1E56F3AC8[operation];
  id v9 = off_1E56F3AE8[event];
  if (self->_enablementOfWalletDataclassChanged) {
    objc_super v10 = @"YES";
  }
  else {
    objc_super v10 = @"NO";
  }
  if (self->_enablementOfUbiquityDataclassChanged) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  if (self->_accountManagedStateChanged) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  if (self->_accountOrderChanged) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (self->_accountStorefrontChanged) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"type: %@, operation: %@, event: %@, wallet dataclass changed: %@, ubiquity dataclass changed: %@, managed state changed: %@, order changed: %@, storefront changed: %@", v5, v8, v9, v10, v11, v12, v13, v14];
}

- (int64_t)_operationTypeForChangeType:(int)a3 newAccount:(id)a4 oldAccount:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int64_t type = self->_type;
  if (type == 1)
  {
    uint64_t v15 = (a3 - 1);
    if (v15 <= 2) {
      int64_t v14 = v15 + 1;
    }
    else {
      int64_t v14 = 0;
    }
  }
  else if (type)
  {
    int64_t v14 = 0;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F4BF38];
    int v12 = objc_msgSend(v8, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
    int v13 = objc_msgSend(v9, "aa_isAccountClass:", v11);
    if (((v12 ^ 1) & 1) != 0 || v13)
    {
      uint64_t v16 = 3;
      if (((v12 ^ 1) & v13) == 0) {
        uint64_t v16 = 0;
      }
      if ((v12 & v13) != 0) {
        int64_t v14 = 2;
      }
      else {
        int64_t v14 = v16;
      }
    }
    else
    {
      int64_t v14 = 1;
    }
  }

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)operation
{
  return self->_operation;
}

- (int64_t)event
{
  return self->_event;
}

- (BOOL)enablementOfWalletDataclassChanged
{
  return self->_enablementOfWalletDataclassChanged;
}

- (BOOL)enablementOfUbiquityDataclassChanged
{
  return self->_enablementOfUbiquityDataclassChanged;
}

- (BOOL)accountManagedStateChanged
{
  return self->_accountManagedStateChanged;
}

- (BOOL)accountOrderChanged
{
  return self->_accountOrderChanged;
}

- (BOOL)accountStorefrontChanged
{
  return self->_accountStorefrontChanged;
}

@end