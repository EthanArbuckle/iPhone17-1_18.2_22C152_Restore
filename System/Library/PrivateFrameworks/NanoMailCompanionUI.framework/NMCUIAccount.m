@interface NMCUIAccount
- (ACAccount)acAccount;
- (BOOL)_isIcloud;
- (BOOL)directPushNotificationsSupported;
- (BOOL)enabled;
- (NMCUIAccount)initWithACAccount:(id)a3;
- (NMCUIAccount)initWithNNMKAccount:(id)a3;
- (NNMKAccount)nnmkAccount;
- (NSString)accountTypeIdentifier;
- (NSString)displayName;
- (NSString)emailAddress;
- (NSString)identifier;
- (NSString)username;
- (id)rootAccount:(id)a3;
- (void)setAcAccount:(id)a3;
- (void)setNnmkAccount:(id)a3;
@end

@implementation NMCUIAccount

- (NMCUIAccount)initWithACAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMCUIAccount;
  v5 = [(NMCUIAccount *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NMCUIAccount *)v5 setAcAccount:v4];
  }

  return v6;
}

- (NMCUIAccount)initWithNNMKAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMCUIAccount;
  v5 = [(NMCUIAccount *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NMCUIAccount *)v5 setNnmkAccount:v4];
  }

  return v6;
}

- (NSString)displayName
{
  if (self->_acAccount)
  {
    v2 = -[NMCUIAccount rootAccount:](self, "rootAccount:");
    v3 = [v2 accountDescription];
  }
  else
  {
    nnmkAccount = self->_nnmkAccount;
    if (nnmkAccount)
    {
      v3 = [(NNMKAccount *)nnmkAccount displayName];
    }
    else
    {
      v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (NSString)identifier
{
  acAccount = self->_acAccount;
  if (acAccount)
  {
    nnmkAccount = [(ACAccount *)acAccount identifier];
  }
  else
  {
    nnmkAccount = self->_nnmkAccount;
    if (nnmkAccount)
    {
      nnmkAccount = [nnmkAccount accountId];
    }
  }

  return (NSString *)nnmkAccount;
}

- (NSString)accountTypeIdentifier
{
  acAccount = self->_acAccount;
  if (acAccount)
  {
    id v4 = [(ACAccount *)acAccount accountType];
    v5 = [v4 identifier];
  }
  else
  {
    nnmkAccount = self->_nnmkAccount;
    if (nnmkAccount)
    {
      v5 = [(NNMKAccount *)nnmkAccount typeIdentifier];
    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)emailAddress
{
  acAccount = self->_acAccount;
  if (acAccount)
  {
    id v4 = [(ACAccount *)acAccount username];
  }
  else
  {
    nnmkAccount = self->_nnmkAccount;
    if (nnmkAccount)
    {
      v6 = [(NNMKAccount *)nnmkAccount defaultEmailAddress];
      v7 = v6;
      if (v6)
      {
        id v4 = v6;
      }
      else
      {
        objc_super v8 = [(NNMKAccount *)self->_nnmkAccount emailAddresses];
        id v4 = [v8 firstObject];
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (NSString)username
{
  acAccount = self->_acAccount;
  if (acAccount || (acAccount = self->_nnmkAccount) != 0)
  {
    acAccount = [acAccount username];
  }

  return (NSString *)acAccount;
}

- (BOOL)enabled
{
  acAccount = self->_acAccount;
  if (acAccount)
  {
    uint64_t v4 = *MEMORY[0x263EFACB8];
    LOBYTE(nnmkAccount) = [(ACAccount *)acAccount isEnabledForDataclass:v4];
  }
  else
  {
    nnmkAccount = self->_nnmkAccount;
    if (nnmkAccount)
    {
      nnmkAccount = (NNMKAccount *)[(NNMKAccount *)nnmkAccount standaloneState];
      if (nnmkAccount != (NNMKAccount *)1) {
        LOBYTE(nnmkAccount) = [(NNMKAccount *)self->_nnmkAccount standaloneState] == 2;
      }
    }
  }
  return (char)nnmkAccount;
}

- (BOOL)directPushNotificationsSupported
{
  if (self->_acAccount)
  {
    LOBYTE(nnmkAccount) = [(NMCUIAccount *)self _isIcloud];
  }
  else
  {
    nnmkAccount = self->_nnmkAccount;
    if (nnmkAccount) {
      LOBYTE(nnmkAccount) = [(NNMKAccount *)nnmkAccount directPushNotificationsSupported];
    }
  }
  return (char)nnmkAccount;
}

- (BOOL)_isIcloud
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [(NMCUIAccount *)self accountTypeIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263EFAF10]];

  if (!v4) {
    goto LABEL_22;
  }
  acAccount = self->_acAccount;
  if (acAccount)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    v6 = (void *)getMailAccountEmailAddressesSymbolLoc_ptr;
    uint64_t v32 = getMailAccountEmailAddressesSymbolLoc_ptr;
    if (!getMailAccountEmailAddressesSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __getMailAccountEmailAddressesSymbolLoc_block_invoke;
      v27 = &unk_264B98ED0;
      v28 = &v29;
      __getMailAccountEmailAddressesSymbolLoc_block_invoke((uint64_t)&v24);
      v6 = (void *)v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v6)
    {
      soft_BPSCellHightlightColor_cold_1();
      __break(1u);
    }
    uint64_t v7 = [(ACAccount *)acAccount accountPropertyForKey:*v6];
    objc_super v8 = (void *)v7;
    v9 = (void *)MEMORY[0x263EFFA68];
    if (v7) {
      v9 = (void *)v7;
    }
    id v10 = v9;

    goto LABEL_11;
  }
  nnmkAccount = self->_nnmkAccount;
  if (!nnmkAccount)
  {
LABEL_22:
    LOBYTE(v13) = 0;
    return v13;
  }
  id v10 = [(NNMKAccount *)nnmkAccount emailAddresses];
LABEL_11:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2050000000;
        v17 = (void *)getNNMKAccountClass_softClass;
        uint64_t v32 = getNNMKAccountClass_softClass;
        if (!getNNMKAccountClass_softClass)
        {
          uint64_t v24 = MEMORY[0x263EF8330];
          uint64_t v25 = 3221225472;
          v26 = __getNNMKAccountClass_block_invoke;
          v27 = &unk_264B98ED0;
          v28 = &v29;
          __getNNMKAccountClass_block_invoke((uint64_t)&v24);
          v17 = (void *)v30[3];
        }
        id v18 = v17;
        _Block_object_dispose(&v29, 8);
        if (objc_msgSend(v18, "isiCloudEmailAddress:", v16, (void)v20))
        {
          LOBYTE(v13) = 1;
          goto LABEL_24;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v33 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  return v13;
}

- (id)rootAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 parentAccount];
  if (v5)
  {
    id v6 = [(NMCUIAccount *)self rootAccount:v5];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

- (ACAccount)acAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAcAccount:(id)a3
{
}

- (NNMKAccount)nnmkAccount
{
  return (NNMKAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNnmkAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nnmkAccount, 0);

  objc_storeStrong((id *)&self->_acAccount, 0);
}

@end