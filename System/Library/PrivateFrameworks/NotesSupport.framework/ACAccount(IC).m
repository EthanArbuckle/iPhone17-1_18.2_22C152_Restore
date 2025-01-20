@interface ACAccount(IC)
- (BOOL)ic_hasPersonaIdentifier;
- (uint64_t)ic_hasICloudEmailAddress;
- (uint64_t)ic_isBasicAccountClass;
- (uint64_t)ic_isFullAccountClass;
- (uint64_t)ic_isICloudNotesAccount;
- (uint64_t)ic_isManagedAppleID;
- (uint64_t)ic_isNotesEnabled;
- (uint64_t)ic_isNotesMigrated;
- (uint64_t)ic_isPrimaryAppleAccount;
- (uint64_t)ic_shouldCreateSeparatePersistentStore;
- (uint64_t)ic_supportsHTMLNotes;
- (uint64_t)ic_supportsModernNotes;
- (void)ic_hasICloudEmailAddress;
@end

@implementation ACAccount(IC)

- (uint64_t)ic_hasICloudEmailAddress
{
  v2 = [a1 displayAccount];
  v3 = [v2 dataclassProperties];

  if (v3)
  {
    v4 = [a1 accountType];
    v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263EFAE58]];

    if (v6)
    {
      int v7 = objc_msgSend(v2, "aa_needsEmailConfiguration");
      v8 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(ACAccount(IC) *)v7 ic_hasICloudEmailAddress];
      }

      uint64_t v9 = v7 ^ 1u;
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        [(ACAccount(IC) *)(uint64_t)v2 ic_hasICloudEmailAddress];
      }

      uint64_t v9 = 0;
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(ACAccount(IC) *)(uint64_t)v2 ic_hasICloudEmailAddress];
    }

    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)ic_hasPersonaIdentifier
{
  uint64_t v2 = objc_opt_class();
  v3 = [a1 accountPropertyForKey:*MEMORY[0x263EFADE0]];
  v4 = ICDynamicCast(v2, (uint64_t)v3);

  BOOL v5 = [v4 length] != 0;
  return v5;
}

- (uint64_t)ic_isManagedAppleID
{
  uint64_t result = objc_msgSend(a1, "ic_isICloudNotesAccount");
  if (result)
  {
    return objc_msgSend(a1, "aa_isManagedAppleID");
  }
  return result;
}

- (uint64_t)ic_supportsModernNotes
{
  uint64_t result = [a1 isProvisionedForDataclass:*MEMORY[0x263EFACE8]];
  if (result)
  {
    uint64_t result = objc_msgSend(a1, "ic_isICloudNotesAccount");
    if (result) {
      return objc_msgSend(a1, "ic_isBasicAccountClass") ^ 1;
    }
  }
  return result;
}

- (uint64_t)ic_supportsHTMLNotes
{
  uint64_t result = [a1 isProvisionedForDataclass:*MEMORY[0x263EFACE8]];
  if (result)
  {
    if (objc_msgSend(a1, "ic_isICloudNotesAccount"))
    {
      return objc_msgSend(a1, "ic_hasICloudEmailAddress");
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)ic_isNotesMigrated
{
  uint64_t result = objc_msgSend(a1, "ic_isICloudNotesAccount");
  if (result)
  {
    return objc_msgSend(a1, "aa_isNotesMigrated");
  }
  return result;
}

- (uint64_t)ic_isPrimaryAppleAccount
{
  uint64_t result = objc_msgSend(a1, "ic_isICloudNotesAccount");
  if (result)
  {
    uint64_t v3 = *MEMORY[0x263F25618];
    return objc_msgSend(a1, "aa_isAccountClass:", v3);
  }
  return result;
}

- (uint64_t)ic_isNotesEnabled
{
  return [a1 isEnabledForDataclass:*MEMORY[0x263EFACE8]];
}

- (uint64_t)ic_isICloudNotesAccount
{
  v1 = [a1 accountType];
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263EFAE58]];

  return v3;
}

- (uint64_t)ic_shouldCreateSeparatePersistentStore
{
  if ((objc_msgSend(a1, "ic_isPrimaryAppleAccount") & 1) != 0
    || !objc_msgSend(a1, "ic_isICloudNotesAccount"))
  {
    return 0;
  }
  return objc_msgSend(a1, "ic_isFullAccountClass");
}

- (uint64_t)ic_isFullAccountClass
{
  return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x263F25610]);
}

- (uint64_t)ic_isBasicAccountClass
{
  return objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x263F25608]);
}

- (void)ic_hasICloudEmailAddress
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Returning NO for ic_hasICloudEmailAddress, because this is not an iCloud account: %@", (uint8_t *)&v2, 0xCu);
}

@end