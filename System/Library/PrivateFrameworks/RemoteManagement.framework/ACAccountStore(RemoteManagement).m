@interface ACAccountStore(RemoteManagement)
+ (id)rm_defaultStore;
- (id)_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()RemoteManagement;
- (id)_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()RemoteManagement altDSID:;
- (id)rm_RemoteManagementAccounts;
- (id)rm_remoteManagementAccountForAltDSID:()RemoteManagement;
- (id)rm_remoteManagementAccountForDSID:()RemoteManagement;
- (id)rm_remoteManagementAccountForEnrollmentURL:()RemoteManagement;
- (id)rm_remoteManagementAccountForIdentifier:()RemoteManagement;
- (id)rm_remoteManagementAccountForProfileIdentifier:()RemoteManagement;
- (uint64_t)rm_RemoteManagementAccountType;
- (uint64_t)rm_iCloudAccountForRemoteManagingAccount;
- (uint64_t)rm_iCloudAccountForRemoteManagingAccountWithAltDSID:()RemoteManagement;
- (uint64_t)rm_iTunesAccountForRemoteManagingAccount;
- (uint64_t)rm_iTunesAccountForRemoteManagingAccountWithAltDSID:()RemoteManagement;
@end

@implementation ACAccountStore(RemoteManagement)

+ (id)rm_defaultStore
{
  if (objc_opt_respondsToSelector())
  {
    id v0 = [MEMORY[0x263EFB210] defaultStore];
  }
  else
  {
    if (rm_defaultStore_onceToken != -1) {
      dispatch_once(&rm_defaultStore_onceToken, &__block_literal_global);
    }
    id v0 = (id)rm_defaultStore_defaultStore;
  }

  return v0;
}

- (uint64_t)rm_RemoteManagementAccountType
{
  return [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF90]];
}

- (id)rm_RemoteManagementAccounts
{
  v2 = objc_msgSend(a1, "rm_RemoteManagementAccountType");
  v3 = [a1 accountsWithAccountType:v2];

  return v3;
}

- (uint64_t)rm_iCloudAccountForRemoteManagingAccount
{
  return objc_msgSend(a1, "_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:", *MEMORY[0x263EFAE58]);
}

- (uint64_t)rm_iCloudAccountForRemoteManagingAccountWithAltDSID:()RemoteManagement
{
  return objc_msgSend(a1, "_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", *MEMORY[0x263EFAE58], a3);
}

- (uint64_t)rm_iTunesAccountForRemoteManagingAccount
{
  return objc_msgSend(a1, "_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:", *MEMORY[0x263EFB000]);
}

- (uint64_t)rm_iTunesAccountForRemoteManagingAccountWithAltDSID:()RemoteManagement
{
  return objc_msgSend(a1, "_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", *MEMORY[0x263EFB000], a3);
}

- (id)_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()RemoteManagement
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "rm_RemoteManagementAccounts");
  v6 = [v5 firstObject];

  if (v6)
  {
    v7 = objc_msgSend(v6, "rm_altDSID");
    v8 = objc_msgSend(a1, "_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", v4, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_rm_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()RemoteManagement altDSID:
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25[0] = v6;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  id v23 = 0;
  v9 = [a1 accountsWithAccountTypeIdentifiers:v8 preloadedProperties:0 error:&v23];
  id v10 = v23;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v9;
  id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "aa_altDSID", (void)v19);
        char v17 = [v16 isEqualToString:v7];

        if (v17)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)rm_remoteManagementAccountForAltDSID:()RemoteManagement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(a1, "rm_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "rm_altDSID", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)rm_remoteManagementAccountForDSID:()RemoteManagement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(a1, "rm_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "rm_DSID", (void)v13);
        char v11 = [v10 isEqualToNumber:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)rm_remoteManagementAccountForIdentifier:()RemoteManagement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(a1, "rm_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)rm_remoteManagementAccountForEnrollmentURL:()RemoteManagement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(a1, "rm_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "rm_enrollmentURL", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)rm_remoteManagementAccountForProfileIdentifier:()RemoteManagement
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(a1, "rm_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "rm_enrollmentURL", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end