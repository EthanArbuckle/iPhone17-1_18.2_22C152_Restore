@interface ACAccountStore
- (id)syd_accountForCurrentPersonaWithError:(id *)a3;
- (id)syd_accountForPersonaIdentifier:(id)a3 error:(id *)a4;
- (id)syd_accountIdentifierForCurrentPersona;
@end

@implementation ACAccountStore

- (id)syd_accountForPersonaIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = SYDGetAccountsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100033ACC();
  }

  uint64_t v29 = ACAccountTypeIdentifierAppleAccount;
  v8 = +[NSArray arrayWithObjects:&v29 count:1];
  id v27 = 0;
  v9 = [(ACAccountStore *)self accountsWithAccountTypeIdentifiers:v8 error:&v27];
  id v10 = v27;

  if (v10)
  {
    v11 = SYDGetAccountsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100033A58();
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "personaIdentifier", (void)v23);
        unsigned int v18 = [v17 isEqualToString:v6];

        if (v18)
        {
          id v13 = v16;
          goto LABEL_17;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (a4) {
    *a4 = v10;
  }
  v19 = SYDGetAccountsLog();
  v20 = v19;
  if (v13)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1000339A4((uint64_t)v6, v13, v20);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    sub_100033930();
  }

  id v21 = v13;
  return v21;
}

- (id)syd_accountForCurrentPersonaWithError:(id *)a3
{
  v5 = SYDGetAccountsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100033C08(v5);
  }

  if (sub_10000AD74())
  {
    id v6 = +[UMUserPersona currentPersona];
    v7 = [v6 userPersonaUniqueString];

    id v13 = 0;
    v8 = [(ACAccountStore *)self syd_accountForPersonaIdentifier:v7 error:&v13];
    id v9 = v13;
    if (v9)
    {
      id v10 = SYDGetAccountsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100033B40();
      }
    }
    if (a3) {
      *a3 = v9;
    }
  }
  else
  {
    v11 = SYDGetAccountsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100033BC4(v11);
    }

    v8 = [(ACAccountStore *)self aa_primaryAppleAccount];
  }
  return v8;
}

- (id)syd_accountIdentifierForCurrentPersona
{
  v2 = [(ACAccountStore *)self syd_accountForCurrentPersonaWithError:0];
  v3 = [v2 identifier];

  return v3;
}

@end