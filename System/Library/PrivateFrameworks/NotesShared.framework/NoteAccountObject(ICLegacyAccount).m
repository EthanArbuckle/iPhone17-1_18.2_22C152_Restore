@interface NoteAccountObject(ICLegacyAccount)
- (BOOL)isExchangeAccount;
- (BOOL)isIMAPAccount;
- (BOOL)isLocalAccount;
- (BOOL)supportsAttachments;
- (id)emailAddress;
- (id)localizedAttachmentsNotSupportedReason;
- (id)localizedName;
- (uint64_t)compare:()ICLegacyAccount;
- (uint64_t)enabled;
- (uint64_t)hasAnyCustomFolders;
- (uint64_t)isManaged;
- (uint64_t)legacyAccountType;
- (void)emailAddress;
@end

@implementation NoteAccountObject(ICLegacyAccount)

- (id)localizedName
{
  if ([a1 accountType]) {
    [a1 name];
  }
  else {
  v2 = +[ICAccount localizedLocalAccountName];
  }
  return v2;
}

- (uint64_t)enabled
{
  return 1;
}

- (uint64_t)legacyAccountType
{
  uint64_t result = [a1 accountType];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (id)emailAddress
{
  v2 = [MEMORY[0x1E4F179C8] defaultStore];
  v3 = [a1 accountIdentifier];
  v4 = [v2 accountWithIdentifier:v3];

  if (!v4)
  {
    v5 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(NoteAccountObject(ICLegacyAccount) *)(uint64_t)a1 emailAddress];
    }
  }
  v6 = [v4 username];

  return v6;
}

- (BOOL)supportsAttachments
{
  return [a1 accountType] != 2;
}

- (BOOL)isIMAPAccount
{
  return [a1 accountType] == 1;
}

- (BOOL)isExchangeAccount
{
  return [a1 accountType] == 2;
}

- (BOOL)isLocalAccount
{
  return [a1 accountType] == 0;
}

- (uint64_t)isManaged
{
  v2 = [a1 accountIdentifier];
  uint64_t v3 = [v2 length];

  if (!v3) {
    return 0;
  }
  v4 = [MEMORY[0x1E4F836D8] sharedInstance];
  v5 = [a1 accountIdentifier];
  uint64_t v6 = [v4 isManagedACAccountWithIdentifier:v5];

  return v6;
}

- (id)localizedAttachmentsNotSupportedReason
{
  if ([a1 accountType] == 2)
  {
    v1 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Exchange accounts don’t support attachments." value:@"Exchange accounts don’t support attachments." table:0 allowSiri:1];
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (uint64_t)hasAnyCustomFolders
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "folders", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) isCustomFolder])
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)compare:()ICLegacyAccount
{
  id v4 = a3;
  v5 = ICProtocolCast();
  if (v5)
  {
    long long v6 = [a1 name];
    long long v7 = [v5 name];
    uint64_t v8 = [v6 localizedCaseInsensitiveCompare:v7];
  }
  else
  {
    long long v6 = ICProtocolCast();
    if (v6)
    {
      uint64_t v8 = -1;
    }
    else
    {
      long long v9 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(NoteAccountObject(ICLegacyAccount) *)(uint64_t)a1 compare:v9];
      }

      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (void)emailAddress
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "No apple account found for note account %@", (uint8_t *)&v2, 0xCu);
}

- (void)compare:()ICLegacyAccount .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v6 = (objc_class *)objc_opt_class();
  long long v7 = NSStringFromClass(v6);
  uint64_t v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  int v10 = 138412802;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  v13 = v7;
  __int16 v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Trying to compare an %@ with a non-%@: %@", (uint8_t *)&v10, 0x20u);
}

@end