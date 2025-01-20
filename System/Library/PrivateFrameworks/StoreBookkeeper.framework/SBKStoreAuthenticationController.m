@interface SBKStoreAuthenticationController
+ (id)lastFailedSyncAccountIdentifier;
+ (id)lastFailedSyncAccountName;
+ (id)lastSyncedAccountIdentifier;
+ (id)lastSyncedAccountName;
+ (void)clearLastSyncnedAccount;
- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4;
- (BOOL)shouldAuthenticate;
- (BOOL)shouldForceAuthenticationForTransaction:(id)a3;
- (SBKStoreAuthenticationController)initWithStoreAccount:(id)a3;
- (SSAccount)storeAccount;
- (id)authenticationErrorsForTransaction:(id)a3;
- (void)saveAccountToLastFailedSyncDefaults;
- (void)saveAccountToLastSyncedDefaults;
- (void)setShouldAuthenticate:(BOOL)a3;
@end

@implementation SBKStoreAuthenticationController

- (void).cxx_destruct
{
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (SSAccount)storeAccount
{
  return self->_storeAccount;
}

- (void)saveAccountToLastFailedSyncDefaults
{
  v3 = +[SBKPreferences storeBookkeeperPreferences];
  v4 = [(SBKStoreAuthenticationController *)self storeAccount];
  v5 = [v4 accountName];
  [v3 setObject:v5 forKey:@"SBKSync.SyncFailureLastAccountName"];

  id v8 = +[SBKPreferences storeBookkeeperPreferences];
  v6 = [(SBKStoreAuthenticationController *)self storeAccount];
  v7 = [v6 uniqueIdentifier];
  [v8 setObject:v7 forKey:@"SBKSync.SyncFailureLastAccountIdentifier"];
}

- (void)saveAccountToLastSyncedDefaults
{
  v3 = +[SBKPreferences storeBookkeeperPreferences];
  v4 = [(SBKStoreAuthenticationController *)self storeAccount];
  v5 = [v4 accountName];
  [v3 setObject:v5 forKey:@"SBKSync.LastAccountName"];

  id v8 = +[SBKPreferences storeBookkeeperPreferences];
  v6 = [(SBKStoreAuthenticationController *)self storeAccount];
  v7 = [v6 uniqueIdentifier];
  [v8 setObject:v7 forKey:@"SBKSync.LastAccountIdentifier"];
}

- (id)authenticationErrorsForTransaction:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SBKStoreAuthenticationController *)self storeAccount];
  v6 = [v5 accountName];

  v7 = [(SBKStoreAuthenticationController *)self storeAccount];
  id v8 = [v7 uniqueIdentifier];

  v9 = [(id)objc_opt_class() lastSyncedAccountName];
  v10 = [(id)objc_opt_class() lastSyncedAccountIdentifier];
  if (v10)
  {
    v11 = os_log_create("com.apple.amp.StoreBookkeeper", "Store");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        int v17 = 138412802;
        v18 = v10;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_22B807000, v11, OS_LOG_TYPE_DEFAULT, "AccountIdentifier mismatch: %@ vs %@ [transaction = %@]", (uint8_t *)&v17, 0x20u);
      }

      uint64_t v13 = +[SBKStoreError storeAccountMismatchErrorWithPreviousStoreAccountName:v9 currentStoreAccountName:v6 transaction:v4 underlyingError:0];
    }
    else
    {
      if (v12)
      {
        int v17 = 138412546;
        v18 = v10;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_22B807000, v11, OS_LOG_TYPE_DEFAULT, "No longer logged in Use Alert %@ [transaction = %@]", (uint8_t *)&v17, 0x16u);
      }

      uint64_t v13 = +[SBKStoreError storeLoggedOutErrorWithPreviousStoreAccountName:v9 transaction:v4 underlyingError:0];
    }
  }
  else
  {
    v14 = os_log_create("com.apple.amp.StoreBookkeeper", "Store");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      v18 = v8;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22B807000, v14, OS_LOG_TYPE_DEFAULT, "First Use Alert %@ [transaction = %@]", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v13 = +[SBKStoreError noStoreAccountErrorWithTransaction:v4 underlyingError:0];
  }
  v15 = (void *)v13;

  return v15;
}

- (BOOL)shouldForceAuthenticationForTransaction:(id)a3
{
  id v4 = a3;
  if ([(SBKStoreAuthenticationController *)self shouldAuthenticate])
  {
    v5 = [(SBKStoreAuthenticationController *)self authenticationErrorsForTransaction:v4];
    v6 = v5;
    if (v5)
    {
      if (([v5 code] & 0xFFFFFFFFFFFFFFFDLL) == 0xFFFFFFFFFFFFFC14) {
        char v7 = -1;
      }
      else {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(SBKStoreAuthenticationController *)self shouldAuthenticate])
  {
    char v7 = os_log_create("com.apple.amp.StoreBookkeeper", "Store");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_22B807000, v7, OS_LOG_TYPE_DEFAULT, "Doesn't matter what the DISD is set to since authentication is forced for transaction: %@", (uint8_t *)&v14, 0xCu);
    }

    BOOL v8 = 1;
  }
  else
  {
    v9 = [(SBKStoreAuthenticationController *)self storeAccount];
    v10 = [v9 uniqueIdentifier];

    uint64_t v11 = [(id)objc_opt_class() lastSyncedAccountIdentifier];
    BOOL v12 = (void *)v11;
    if (v10 && v11 && ([v10 isEqual:v11] & 1) != 0
      || [(SBKStoreAuthenticationController *)self shouldForceAuthenticationForTransaction:v6])
    {
      BOOL v8 = 1;
    }
    else if (a4)
    {
      [(SBKStoreAuthenticationController *)self authenticationErrorsForTransaction:v6];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (SBKStoreAuthenticationController)initWithStoreAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKStoreAuthenticationController;
  id v6 = [(SBKStoreAuthenticationController *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeAccount, a3);
  }

  return v7;
}

+ (id)lastFailedSyncAccountName
{
  v2 = +[SBKPreferences storeBookkeeperPreferences];
  v3 = [v2 objectForKey:@"SBKSync.SyncFailureLastAccountName" withDefaultValue:0];

  return v3;
}

+ (id)lastFailedSyncAccountIdentifier
{
  v2 = NSNumber;
  v3 = +[SBKPreferences storeBookkeeperPreferences];
  id v4 = [v3 objectForKey:@"SBKSync.SyncFailureLastAccountIdentifier" withDefaultValue:0];
  id v5 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));

  return v5;
}

+ (id)lastSyncedAccountName
{
  v2 = +[SBKPreferences storeBookkeeperPreferences];
  v3 = [v2 objectForKey:@"SBKSync.LastAccountName" withDefaultValue:0];

  return v3;
}

+ (id)lastSyncedAccountIdentifier
{
  v2 = NSNumber;
  v3 = +[SBKPreferences storeBookkeeperPreferences];
  id v4 = [v3 objectForKey:@"SBKSync.LastAccountIdentifier" withDefaultValue:0];
  id v5 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));

  return v5;
}

+ (void)clearLastSyncnedAccount
{
  v2 = +[SBKPreferences storeBookkeeperPreferences];
  [v2 setObject:0 forKey:@"SBKSync.LastAccountName"];

  id v3 = +[SBKPreferences storeBookkeeperPreferences];
  [v3 setObject:0 forKey:@"SBKSync.LastAccountIdentifier"];
}

@end