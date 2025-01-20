@interface NNMKAccount
+ (BOOL)isiCloudEmailAddress:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)generateAccountIdForAccount:(id)a3;
+ (id)generateIdentifierFromEmailsAddresses:(id)a3;
+ (id)inboxesFromAccounts:(id)a3;
- (BOOL)_isGmail;
- (BOOL)_isHotmail;
- (BOOL)_isiCloud;
- (BOOL)areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)maySupportStandaloneMode;
- (BOOL)shouldArchive;
- (BOOL)supportsCloudNotifications;
- (NNMKAccount)initWithCoder:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)mailboxes;
- (NSString)accountId;
- (NSString)defaultEmailAddress;
- (NSString)displayName;
- (NSString)emailAddressToken;
- (NSString)localId;
- (NSString)parentAccountIdentifier;
- (NSString)pccEmailAddress;
- (NSString)typeIdentifier;
- (NSString)username;
- (id)description;
- (unint64_t)sourceType;
- (unint64_t)standaloneState;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setDefaultEmailAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddressToken:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setLocalId:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setParentAccountIdentifier:(id)a3;
- (void)setPccEmailAddress:(id)a3;
- (void)setShouldArchive:(BOOL)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setStandaloneState:(unint64_t)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation NNMKAccount

- (NSString)accountId
{
  accountId = self->_accountId;
  if (accountId)
  {
    v3 = accountId;
  }
  else
  {
    v3 = [(id)objc_opt_class() generateAccountIdForAccount:self];
  }
  return v3;
}

- (void)setUsername:(id)a3
{
}

- (void)setTypeIdentifier:(id)a3
{
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (void)setShouldArchive:(BOOL)a3
{
  self->_shouldArchive = a3;
}

- (void)setPccEmailAddress:(id)a3
{
}

- (void)setParentAccountIdentifier:(id)a3
{
}

- (void)setLocalId:(id)a3
{
}

- (void)setEmailAddresses:(id)a3
{
}

- (void)setEmailAddressToken:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setDefaultEmailAddress:(id)a3
{
}

- (void)setAccountId:(id)a3
{
}

- (NSString)localId
{
  localId = self->_localId;
  if (localId) {
    v3 = localId;
  }
  else {
    v3 = &stru_26F11E918;
  }
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_defaultEmailAddress, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_parentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_localId, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

+ (id)generateAccountIdForAccount:(id)a3
{
  return (id)[a3 localId];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKAccount)initWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NNMKAccount;
  v5 = [(NNMKAccount *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccountId"];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyLocalId"];
    localId = v5->_localId;
    v5->_localId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyDisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyShouldArchive"];
    v5->_shouldArchive = [v12 BOOLValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySourceType"];
    v5->_sourceType = [v13 unsignedIntegerValue];

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kNSCodingKeyEmailAddresses"];
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v17;

    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"kNSCodingKeyMailboxes"];
    mailboxes = v5->_mailboxes;
    v5->_mailboxes = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyUsername"];
    username = v5->_username;
    v5->_username = (NSString *)v24;

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyStandaloneState"];
    v5->_standaloneState = [v26 unsignedIntegerValue];

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyDefaultEmailAddress"];
    defaultEmailAddress = v5->_defaultEmailAddress;
    v5->_defaultEmailAddress = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyTypeIdentifier"];
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(NNMKAccount *)self accountId];
  [v8 encodeObject:v4 forKey:@"kNSCodingKeyAccountId"];

  [v8 encodeObject:self->_localId forKey:@"kNSCodingKeyLocalId"];
  [v8 encodeObject:self->_displayName forKey:@"kNSCodingKeyDisplayName"];
  v5 = [NSNumber numberWithBool:self->_shouldArchive];
  [v8 encodeObject:v5 forKey:@"kNSCodingKeyShouldArchive"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_sourceType];
  [v8 encodeObject:v6 forKey:@"kNSCodingKeySourceType"];

  [v8 encodeObject:self->_emailAddresses forKey:@"kNSCodingKeyEmailAddresses"];
  [v8 encodeObject:self->_mailboxes forKey:@"kNSCodingKeyMailboxes"];
  [v8 encodeObject:self->_username forKey:@"kNSCodingKeyUsername"];
  v7 = [NSNumber numberWithUnsignedInteger:self->_standaloneState];
  [v8 encodeObject:v7 forKey:@"kNSCodingKeyStandaloneState"];

  [v8 encodeObject:self->_defaultEmailAddress forKey:@"kNSCodingKeyDefaultEmailAddress"];
  [v8 encodeObject:self->_typeIdentifier forKey:@"kNSCodingKeyTypeIdentifier"];
}

+ (id)inboxesFromAccounts:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v11 = objc_msgSend(v10, "mailboxes", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if ([v16 type] == 1) {
                [v4 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)generateIdentifierFromEmailsAddresses:(id)a3
{
  return (id)[a3 componentsJoinedByString:@"#"];
}

- (BOOL)maySupportStandaloneMode
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(NNMKAccount *)self emailAddresses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) lowercaseString];
        char v8 = [v7 containsString:@"@gmail.com"];

        if (v8)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)supportsCloudNotifications
{
  if ([(NNMKAccount *)self _isHotmail]) {
    return 1;
  }
  return [(NNMKAccount *)self _isGmail];
}

- (BOOL)areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NNMKAccount *)self typeIdentifier];

  if (v5)
  {
    if ([(NNMKAccount *)self _isiCloud])
    {
      return 1;
    }
    else if ([(NNMKAccount *)self _isHotmail])
    {
      return v3;
    }
    else
    {
      BOOL v6 = 0;
      if ([(NNMKAccount *)self _isGmail] && v3)
      {
        char v8 = [(NNMKAccount *)self emailAddressToken];
        BOOL v6 = v8 != 0;
      }
    }
  }
  else
  {
    uint64_t v7 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR)) {
      -[NNMKAccount areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:](v7, self);
    }
    return 0;
  }
  return v6;
}

- (BOOL)_isiCloud
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NNMKAccount *)self typeIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263EFAF10]];

  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [(NNMKAccount *)self emailAddresses];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (+[NNMKAccount isiCloudEmailAddress:*(void *)(*((void *)&v10 + 1) + 8 * i)])
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)isiCloudEmailAddress:(id)a3
{
  id v3 = a3;
  int v4 = [v3 lowercaseString];
  if ([v4 containsString:@"@me.com"])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 lowercaseString];
    if ([v6 containsString:@"@icloud.com"])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v7 = [v3 lowercaseString];
      char v5 = [v7 containsString:@"@mac.com"];
    }
  }

  return v5;
}

- (BOOL)_isGmail
{
  v2 = [(NNMKAccount *)self typeIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x263EFAEE8]];

  return v3;
}

- (BOOL)_isHotmail
{
  v2 = [(NNMKAccount *)self typeIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x263EFAEF8]];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = [(NNMKAccount *)self accountId];
  char v8 = [v6 accountId];
  if (v7 != v8)
  {
    char v3 = [(NNMKAccount *)self accountId];
    int v4 = [v6 accountId];
    if (![v3 isEqualToString:v4])
    {
      BOOL v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  unint64_t v10 = [(NNMKAccount *)self sourceType];
  BOOL v9 = v10 == [v6 sourceType];
  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (id)description
{
  char v3 = NSString;
  int v4 = [(NNMKAccount *)self accountId];
  char v5 = [v3 stringWithFormat:@"[Id: %@, Display Name: %@, Should Archive: %d, Email Addresses: %@, Parent Id: %@, Standalone state: %lu]", v4, self->_displayName, self->_shouldArchive, self->_emailAddresses, self->_parentAccountIdentifier, self->_standaloneState];

  return v5;
}

- (NSString)parentAccountIdentifier
{
  return self->_parentAccountIdentifier;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)shouldArchive
{
  return self->_shouldArchive;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)defaultEmailAddress
{
  return self->_defaultEmailAddress;
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (unint64_t)standaloneState
{
  return self->_standaloneState;
}

- (void)setStandaloneState:(unint64_t)a3
{
  self->_standaloneState = a3;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (void)initWithCoder:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "NNMKAccount entity is unable to decode some of the fields (possible Message.framework API changes): %{public}@", buf, 0xCu);
}

- (void)areStandaloneNotificationsEnabledWithCloudNotificationsEnabled:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = a1;
  int v4 = [a2 localId];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "Missing typeIdentifier for accountId: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end