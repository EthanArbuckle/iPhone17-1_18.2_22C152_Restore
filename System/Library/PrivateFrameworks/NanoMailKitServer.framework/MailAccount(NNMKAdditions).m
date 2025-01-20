@interface MailAccount(NNMKAdditions)
+ (id)nano_activeMailAccounts;
- (NNMKAccount)nano_account;
- (id)_emailAddressStringsFromObjects:()NNMKAdditions;
- (id)nano_accountId;
- (id)nano_emailAddressesAndAliasesList;
@end

@implementation MailAccount(NNMKAdditions)

- (id)nano_accountId
{
  v1 = objc_msgSend(a1, "nano_account");
  v2 = [v1 accountId];

  return v2;
}

- (NNMKAccount)nano_account
{
  v2 = objc_alloc_init(NNMKAccount);
  v3 = [a1 uniqueID];
  [(NNMKAccount *)v2 setLocalId:v3];

  v4 = [a1 parentAccountIdentifier];
  [(NNMKAccount *)v2 setParentAccountIdentifier:v4];

  uint64_t v5 = [a1 displayName];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_26F11E918;
  }
  [(NNMKAccount *)v2 setDisplayName:v7];

  if ([a1 supportsArchiving]) {
    uint64_t v8 = [a1 shouldArchiveByDefault];
  }
  else {
    uint64_t v8 = 0;
  }
  [(NNMKAccount *)v2 setShouldArchive:v8];
  v9 = objc_msgSend(a1, "nano_emailAddressesAndAliasesList");
  [(NNMKAccount *)v2 setEmailAddresses:v9];

  [(NNMKAccount *)v2 setSourceType:0];
  v10 = [a1 persistentAccount];
  v11 = [v10 username];
  [(NNMKAccount *)v2 setUsername:v11];

  v12 = [(id)objc_opt_class() accountTypeIdentifier];
  [(NNMKAccount *)v2 setTypeIdentifier:v12];

  v13 = [a1 accountPropertyForKey:@"NNMKEmailAddressTokenKey"];
  [(NNMKAccount *)v2 setEmailAddressToken:v13];

  v14 = [a1 accountPropertyForKey:@"NNMKPCCEmailAddressKey"];
  [(NNMKAccount *)v2 setPccEmailAddress:v14];

  v15 = [a1 defaultEmailAddress];
  [(NNMKAccount *)v2 setDefaultEmailAddress:v15];

  v16 = +[NNMKAccount generateAccountIdForAccount:v2];
  [(NNMKAccount *)v2 setAccountId:v16];

  return v2;
}

- (id)nano_emailAddressesAndAliasesList
{
  v2 = [a1 emailAddressesAndAliasesList];
  v3 = [a1 _emailAddressStringsFromObjects:v2];

  return v3;
}

- (id)_emailAddressStringsFromObjects:()NNMKAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "ea_uncommentedAddress", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)nano_activeMailAccounts
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = 0;
  v0 = [MEMORY[0x263F553B0] activeAccountsWithError:&v14];
  id v1 = v14;
  v2 = 0;
  if (!v1)
  {
    v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v0, "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v0;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            objc_msgSend(v2, "addObject:", v8, (void)v10);
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v5);
    }
  }
  return v2;
}

@end