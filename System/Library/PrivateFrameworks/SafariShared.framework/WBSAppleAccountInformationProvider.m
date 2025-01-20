@interface WBSAppleAccountInformationProvider
- (BOOL)isSafariSyncEnabled;
- (int64_t)appleAccountSecurityState;
- (unint64_t)_primaryAppleAccountSecurityLevel;
- (void)getAppleAccountSecurityStateWithCompletion:(id)a3;
@end

@implementation WBSAppleAccountInformationProvider

- (int64_t)appleAccountSecurityState
{
  int64_t result = (int64_t)NSClassFromString(&cfstr_Akaccountmanag.isa);
  if (result)
  {
    unint64_t v4 = [(WBSAppleAccountInformationProvider *)self _primaryAppleAccountSecurityLevel];
    int64_t v5 = 1;
    if (v4 == 4) {
      int64_t v5 = 2;
    }
    if (v4) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unint64_t)_primaryAppleAccountSecurityLevel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179D0]);
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  unint64_t v4 = objc_msgSend(v3, "aa_altDSID");

  int64_t v5 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v6 = [v5 authKitAccountWithAltDSID:v4];
  unint64_t v7 = [v5 securityLevelForAccount:v6];

  return v7;
}

- (BOOL)isSafariSyncEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179D0]);
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  char v4 = [v3 isEnabledForDataclass:*MEMORY[0x1E4F17538]];

  return v4;
}

- (void)getAppleAccountSecurityStateWithCompletion:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, int64_t))a3 + 2))(v5, [(WBSAppleAccountInformationProvider *)self appleAccountSecurityState]);
}

@end