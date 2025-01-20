@interface ACAccountStore(SSExtensions)
+ (id)_accountTypesCache;
- (id)_correspondingAccountWithAccountTypeIdentifier:()SSExtensions forAccount:error:;
- (id)_ss_accountTypeWithIdentifier:()SSExtensions error:;
- (uint64_t)_ss_IDMSAccountForAccount:()SSExtensions error:;
- (uint64_t)_ss_appleAuthenticationAccountForAccount:()SSExtensions error:;
- (uint64_t)_ss_iCloudAccountForAccount:()SSExtensions error:;
- (uint64_t)_ss_iTunesAccountForAccount:()SSExtensions error:;
@end

@implementation ACAccountStore(SSExtensions)

- (id)_ss_accountTypeWithIdentifier:()SSExtensions error:
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _accountTypesCache];
  v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v8 = [a1 accountTypeWithAccountTypeIdentifier:v6];
    v9 = [(id)objc_opt_class() _accountTypesCache];
    [v9 setObject:v8 forKey:v6];

    if (a4)
    {
      if (!v8)
      {
        v10 = [NSString stringWithFormat:@"Failed to load an ACAccountType for %@", v6];
        SSError(@"SSAccountErrorDomain", 2, 0, (uint64_t)v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v8 = 0;
      }
    }
  }

  return v8;
}

+ (id)_accountTypesCache
{
  if (_accountTypesCache_ss_once_token___COUNTER__ != -1) {
    dispatch_once(&_accountTypesCache_ss_once_token___COUNTER__, &__block_literal_global_13);
  }
  v0 = (void *)_accountTypesCache_ss_once_object___COUNTER__;
  return v0;
}

- (uint64_t)_ss_appleAuthenticationAccountForAccount:()SSExtensions error:
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F17760] forAccount:a3 error:a4];
}

- (uint64_t)_ss_iCloudAccountForAccount:()SSExtensions error:
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F17750] forAccount:a3 error:a4];
}

- (uint64_t)_ss_IDMSAccountForAccount:()SSExtensions error:
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F177E0] forAccount:a3 error:a4];
}

- (uint64_t)_ss_iTunesAccountForAccount:()SSExtensions error:
{
  return [a1 _correspondingAccountWithAccountTypeIdentifier:*MEMORY[0x1E4F17890] forAccount:a3 error:a4];
}

- (id)_correspondingAccountWithAccountTypeIdentifier:()SSExtensions forAccount:error:
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(a1, "_ss_accountTypeWithIdentifier:error:", v8, a5);
  if (v10)
  {
    v11 = [a1 accountsWithAccountType:v10];
    v12 = objc_msgSend(v9, "_ss_altDSID");
    v13 = objc_msgSend(v9, "_ss_DSID");
    v14 = [v9 username];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96__ACAccountStore_SSExtensions___correspondingAccountWithAccountTypeIdentifier_forAccount_error___block_invoke;
    v25[3] = &unk_1E5BAAC68;
    id v15 = v12;
    id v26 = v15;
    id v16 = v13;
    id v27 = v16;
    id v17 = v14;
    id v28 = v17;
    uint64_t v18 = objc_msgSend(v11, "_ss_firstObjectPassingTest:", v25);
    v19 = (void *)v18;
    if (a5 && !v18)
    {
      v20 = NSString;
      objc_msgSend(v9, "_ss_hashedDescription");
      v21 = v24 = v11;
      v22 = [v20 stringWithFormat:@"Unable to find a corresponding account. accountTypeIdentifier = %@ | account = %@", v8, v21];

      v11 = v24;
      SSError(@"SSAccountErrorDomain", 1, 0, (uint64_t)v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end