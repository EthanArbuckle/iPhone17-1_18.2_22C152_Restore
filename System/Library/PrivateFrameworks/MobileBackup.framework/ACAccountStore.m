@interface ACAccountStore
- (id)mb_accountForPersonaIdentifier:(id)a3;
@end

@implementation ACAccountStore

- (id)mb_accountForPersonaIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[ACAccountStore(MBPersonaHelpers) mb_accountForPersonaIdentifier:]", "ACAccountStore+MBPersonaHelpers.m", 15, "personaIdentifier");
  }
  v5 = v4;
  v6 = [(ACAccountStore *)self accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount];
  [(ACAccountStore *)self accountsWithAccountType:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "personaIdentifier", (void)v15);
        unsigned __int8 v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_12;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

@end