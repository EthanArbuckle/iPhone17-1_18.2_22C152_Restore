@interface WBSRecentlyDeletedAlertConfiguration
+ (id)_alertTitleForFailingToRecoverMultipleAccountsWithCredentialTypes:(int64_t)a3;
+ (id)_alertTitleForFailingToRecoverSingleAccountWithCredentialTypes:(int64_t)a3;
+ (id)alertTitleForFailingToRecoverAccounts:(id)a3;
@end

@implementation WBSRecentlyDeletedAlertConfiguration

+ (id)alertTitleForFailingToRecoverAccounts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [*(id *)(*((void *)&v12 + 1) + 8 * i) credentialTypes];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v4 count] == 1) {
    [a1 _alertTitleForFailingToRecoverSingleAccountWithCredentialTypes:v7];
  }
  else {
  v10 = [a1 _alertTitleForFailingToRecoverMultipleAccountsWithCredentialTypes:v7];
  }

  return v10;
}

+ (id)_alertTitleForFailingToRecoverMultipleAccountsWithCredentialTypes:(int64_t)a3
{
  if (a3 == 3)
  {
    id v4 = @"Passwords was unable to recover these passkeys and passwords.";
  }
  else if (a3 == 2)
  {
    id v4 = @"Passwords was unable to recover these passkeys.";
  }
  else
  {
    id v4 = @"Passwords was unable to recover these passwords.";
  }
  uint64_t v5 = _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return v5;
}

+ (id)_alertTitleForFailingToRecoverSingleAccountWithCredentialTypes:(int64_t)a3
{
  if (a3 == 3)
  {
    id v4 = @"Passwords was unable to recover this passkey and password.";
  }
  else if (a3 == 2)
  {
    id v4 = @"Passwords was unable to recover this passkey.";
  }
  else
  {
    id v4 = @"Passwords was unable to recover this password.";
  }
  uint64_t v5 = _WBSLocalizedString(v4, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  return v5;
}

@end