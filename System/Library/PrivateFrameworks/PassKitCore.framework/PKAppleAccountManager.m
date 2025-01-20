@interface PKAppleAccountManager
+ (id)sharedInstance;
- (ACAccountStore)accountStore;
- (PKAppleAccountInformation)appleAccountInformation;
- (id)_aidaAccount;
- (id)_primaryAppleAccount;
- (void)_renewAppleAccountSilently:(BOOL)a3 completion:(id)a4;
- (void)renewAppleAccountWithCompletionHandler:(id)a3;
- (void)silentlyRenewAppleAccountWithCompletionHandler:(id)a3;
@end

@implementation PKAppleAccountManager

+ (id)sharedInstance
{
  if (_MergedGlobals_224 != -1) {
    dispatch_once(&_MergedGlobals_224, &__block_literal_global_85);
  }
  v2 = (void *)qword_1EB402DE8;
  return v2;
}

- (PKAppleAccountInformation)appleAccountInformation
{
  v3 = objc_alloc_init(PKAppleAccountInformation);
  v4 = [(PKAppleAccountManager *)self _aidaAccount];
  v5 = [(PKAppleAccountManager *)self _primaryAppleAccount];
  v6 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v7 = [v6 primaryAuthKitAccount];
  v8 = [v6 altDSIDForAccount:v7];
  [(PKAppleAccountInformation *)v3 setAidaAlternateDSID:v8];

  v9 = objc_msgSend(v4, "aida_tokenForService:", @"com.apple.gs.pb.auth");
  [(PKAppleAccountInformation *)v3 setAidaToken:v9];

  v10 = [v5 username];
  [(PKAppleAccountInformation *)v3 setAppleID:v10];

  v11 = objc_msgSend(v5, "aa_personID");
  [(PKAppleAccountInformation *)v3 setAaDSID:v11];

  v12 = objc_msgSend(v5, "aa_altDSID");
  [(PKAppleAccountInformation *)v3 setAaAlternateDSID:v12];

  -[PKAppleAccountInformation setIsSandboxAccount:](v3, "setIsSandboxAccount:", objc_msgSend(v5, "aa_isSandboxAccount"));
  v13 = objc_msgSend(v5, "aa_firstName");
  [(PKAppleAccountInformation *)v3 setFirstName:v13];

  v14 = objc_msgSend(v5, "aa_lastName");
  [(PKAppleAccountInformation *)v3 setLastName:v14];

  v15 = objc_msgSend(v5, "aa_primaryEmail");
  [(PKAppleAccountInformation *)v3 setPrimaryEmailAddress:v15];

  v16 = [v5 creationDate];
  [(PKAppleAccountInformation *)v3 setCreationDate:v16];

  -[PKAppleAccountInformation setIsManagedAppleAccount:](v3, "setIsManagedAppleAccount:", objc_msgSend(v5, "aa_isManagedAppleID"));
  -[PKAppleAccountInformation setIsWalletEnabledOnManagedAppleAccount:](v3, "setIsWalletEnabledOnManagedAppleAccount:", [v5 isEnabledForDataclass:*MEMORY[0x1E4F17628]]);
  unint64_t v17 = objc_msgSend(v5, "aa_ageCategory");
  if (v17 > 9) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = qword_191674AE0[v17];
  }
  [(PKAppleAccountInformation *)v3 setAgeCategory:v18];
  if (PKSimulateIsManagedAccount())
  {
    v19 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Simulating Managed Account (MAID) because of debug preference", v21, 2u);
    }

    [(PKAppleAccountInformation *)v3 setIsManagedAppleAccount:1];
    if (PKSimulateWalletDisabledForManagedAccount()) {
      [(PKAppleAccountInformation *)v3 setIsWalletEnabledOnManagedAppleAccount:0];
    }
  }

  return v3;
}

- (id)_primaryAppleAccount
{
  v2 = [(PKAppleAccountManager *)self accountStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (id)_aidaAccount
{
  v2 = [(PKAppleAccountManager *)self accountStore];
  v3 = objc_msgSend(v2, "aida_accountForPrimaryiCloudAccount");

  return v3;
}

- (ACAccountStore)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

void __39__PKAppleAccountManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKAppleAccountManager);
  v1 = (void *)qword_1EB402DE8;
  qword_1EB402DE8 = (uint64_t)v0;
}

- (void)renewAppleAccountWithCompletionHandler:(id)a3
{
}

- (void)silentlyRenewAppleAccountWithCompletionHandler:(id)a3
{
}

- (void)_renewAppleAccountSilently:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v24[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(PKAppleAccountManager *)self _aidaAccount];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKAppleAccountManager__renewAppleAccountSilently_completion___block_invoke;
  aBlock[3] = &unk_1E56E4DE8;
  id v8 = v6;
  aBlock[4] = self;
  id v21 = v8;
  v9 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  v10 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v4)
    {
      if (v11)
      {
        *(_WORD *)v19 = 0;
        v12 = "Device has Grandslam account, silently asking accounts to renew the Wallet token";
LABEL_11:
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v12, v19, 2u);
      }
    }
    else if (v11)
    {
      *(_WORD *)v19 = 0;
      v12 = "Device has Grandslam account, asking accounts to renew the Wallet token";
      goto LABEL_11;
    }

    v22 = @"com.apple.gs.pb.auth";
    v23[0] = @"Services";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v24[0] = v16;
    v23[1] = *MEMORY[0x1E4F17A40];
    unint64_t v17 = [NSNumber numberWithInt:v4 ^ 1];
    v24[1] = v17;
    v23[2] = *MEMORY[0x1E4F17A30];
    uint64_t v18 = [NSNumber numberWithBool:v4];
    v24[2] = v18;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

    v15 = [(PKAppleAccountManager *)self accountStore];
    [v15 renewCredentialsForAccount:v7 options:v14 completion:v9];
    goto LABEL_13;
  }
  if (v11)
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Device doesn't have a Grandslam account, renewing the Apple Account to create one", v19, 2u);
  }

  uint64_t v13 = [(PKAppleAccountManager *)self _primaryAppleAccount];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(PKAppleAccountManager *)self accountStore];
    [v15 renewCredentialsForAccount:v14 force:1 reason:0 completion:v9];
LABEL_13:

    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Device doesn't have a primary Apple Account", v19, 2u);
  }

  v9[2](v9, 2, 0);
  v14 = 0;
LABEL_14:
}

void __63__PKAppleAccountManager__renewAppleAccountSilently_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 localizedDescription];
      int v10 = 138412290;
      BOOL v11 = v7;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error renewing apple account credential: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    v9 = [*(id *)(a1 + 32) appleAccountInformation];
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);
  }
}

- (void).cxx_destruct
{
}

@end