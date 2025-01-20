@interface PKHideMyEmailManager
- (BOOL)_isHSA2Enabled;
- (PKHideMyEmailManager)init;
- (id)_primaryAccount;
- (id)_primaryAccountAltDSID;
- (id)forwardingEmailForPrimaryAccount;
- (void)bestDomainForAppIdentifier:(id)a3 completion:(id)a4;
- (void)createHideMyEmailAddressWithKey:(id)a3 completion:(id)a4;
- (void)findHideMyEmailAddressWithKey:(id)a3 completion:(id)a4;
- (void)isAvailable:(id)a3;
- (void)registerHideMyEmailAddressWithKey:(id)a3 originIdentifier:(id)a4 merchantIdentifier:(id)a5 isWebPayment:(BOOL)a6 completion:(id)a7;
@end

@implementation PKHideMyEmailManager

- (PKHideMyEmailManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKHideMyEmailManager;
  v2 = [(PKHideMyEmailManager *)&v6 init];
  if (v2)
  {
    v3 = (AKPrivateEmailController *)objc_alloc_init(MEMORY[0x1E4F4F080]);
    controller = v2->_controller;
    v2->_controller = v3;

    v2->_isAvailable = 0;
  }
  return v2;
}

- (void)isAvailable:(id)a3
{
  v4 = (void (**)(id, BOOL, void))a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PaymentSheetHME feature flag not enabled!", buf, 2u);
    }

    unint64_t isAvailable = 2;
    self->_unint64_t isAvailable = 2;
    goto LABEL_7;
  }
  unint64_t isAvailable = self->_isAvailable;
  if (isAvailable)
  {
LABEL_7:
    v4[2](v4, isAvailable == 1, 0);
    goto LABEL_8;
  }
  objc_super v6 = (void *)MEMORY[0x1E4F59BB8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PKHideMyEmailManager_isAvailable___block_invoke;
  v8[3] = &unk_1E56DEA80;
  v8[4] = self;
  v9 = v4;
  [v6 requestFeatureWithId:@"mail.hide-my-email.create" completion:v8];

LABEL_8:
}

void __36__PKHideMyEmailManager_isAvailable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [v5 canUse];
    uint64_t v8 = 1;
    if (!v7) {
      uint64_t v8 = 2;
    }
    *(void *)(*(void *)(a1 + 32) + 16) = v8;
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 canUse], 0);
    if (([v5 canUse] & 1) == 0)
    {
      v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Hide My Email feature not available!", (uint8_t *)&v11, 2u);
      }
    }
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to check for HME feature. %@", (uint8_t *)&v11, 0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 16) = 2;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)createHideMyEmailAddressWithKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKHideMyEmailManager *)self _primaryAccountAltDSID];
  v9 = v8;
  if (v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke;
    v15[3] = &unk_1E56DEAF8;
    v15[4] = self;
    id v16 = v8;
    id v17 = v6;
    id v18 = v7;
    id v10 = v7;
    [(PKHideMyEmailManager *)self findHideMyEmailAddressWithKey:v17 completion:v15];

    int v11 = v16;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_45;
    block[3] = &unk_1E56D8360;
    id v14 = v7;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    int v11 = v14;
  }
}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_2;
  v4[3] = &unk_1E56DEAD0;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v2 fetchPrivateEmailForAltDSID:v1 withKey:v3 completion:v4];
}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_3;
  block[3] = &unk_1E56DEAA8;
  id v11 = v5;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_3(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = a1[6];
    id v6 = [v2 privateEmailAddress];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Create hide my email address failed with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __67__PKHideMyEmailManager_createHideMyEmailAddressWithKey_completion___block_invoke_45(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"DSID required to register new HME address";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v4 = [v2 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v3];

  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Create hide my email address failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerHideMyEmailAddressWithKey:(id)a3 originIdentifier:(id)a4 merchantIdentifier:(id)a5 isWebPayment:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(PKHideMyEmailManager *)self _primaryAccountAltDSID];
  if (v16)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke;
    v22[3] = &unk_1E56DEB70;
    id v17 = &v28;
    id v28 = v15;
    id v23 = v12;
    id v24 = v16;
    BOOL v29 = a6;
    id v25 = v13;
    id v26 = v14;
    v27 = self;
    id v18 = v15;
    [(PKHideMyEmailManager *)self findHideMyEmailAddressWithKey:v23 completion:v22];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_52;
    v20[3] = &unk_1E56D8360;
    id v17 = &v21;
    id v21 = v15;
    id v19 = v15;
    dispatch_async(MEMORY[0x1E4F14428], v20);
  }
}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_2;
    block[3] = &unk_1E56D83D8;
    id v15 = *(id *)(a1 + 72);
    id v14 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v4 = v15;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4F078]);
    if (*(unsigned char *)(a1 + 80)) {
      int v6 = (void *)MEMORY[0x1E4F4EEA0];
    }
    else {
      int v6 = (void *)MEMORY[0x1E4F4EE98];
    }
    v4 = (void *)[v5 initWithKey:*(void *)(a1 + 32) altDSID:*(void *)(a1 + 40) originType:*v6 originIdentifier:*(void *)(a1 + 48)];
    [v4 setMetadataString:*(void *)(a1 + 56)];
    id v7 = *(void **)(*(void *)(a1 + 64) + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_3;
    v8[3] = &unk_1E56DEB48;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 72);
    [v7 registerPrivateEmailWithContext:v4 completion:v8];
  }
}

uint64_t __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_4;
  v10[3] = &unk_1E56DEB20;
  id v11 = v5;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = a1[6];
  id v7 = a1[7];
  id v15 = v6;
  id v16 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Register hide my email address succeeded for key: %@, originId: %@, merchantId: %@", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v8 = *(void *)(a1 + 72);
    id v9 = [*(id *)(a1 + 32) privateEmailAddress];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, *(void *)(a1 + 64));
  }
  else
  {
    if (v4)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      int v14 = 138413058;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Register hide my email address failed with key: %@, originId: %@, merchantId: %@, and error: %@", (uint8_t *)&v14, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __118__PKHideMyEmailManager_registerHideMyEmailAddressWithKey_originIdentifier_merchantIdentifier_isWebPayment_completion___block_invoke_52(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"DSID required to register new HME address";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v4 = [v2 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v3];

  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Register hide my email address failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)findHideMyEmailAddressWithKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKHideMyEmailManager *)self _primaryAccountAltDSID];
  if (v8)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F4F078]) initWithKey:v6 altDSID:v8];
    controller = self->_controller;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke;
    v14[3] = &unk_1E56DEBC0;
    id v15 = v6;
    id v16 = v7;
    id v11 = v7;
    [(AKPrivateEmailController *)controller lookupPrivateEmailWithContext:v9 completion:v14];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_53;
    block[3] = &unk_1E56D8360;
    id v13 = v7;
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v11 = v13;
  }
}

void __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_2;
  v10[3] = &unk_1E56DEB98;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Look up hide my email address succeeded for key: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = [*(id *)(a1 + 32) privateEmailAddress];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, *(void *)(a1 + 48));
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Look up hide my email address miss with key: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __65__PKHideMyEmailManager_findHideMyEmailAddressWithKey_completion___block_invoke_53(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"DSID required to register new HME address";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v4 = [v2 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v3];

  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Find hide my email address failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)bestDomainForAppIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  int v6 = (Class (__cdecl *)())getSFSafariCredentialStoreClass[0];
  id v7 = a3;
  Class v8 = v6();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKHideMyEmailManager_bestDomainForAppIdentifier_completion___block_invoke;
  v10[3] = &unk_1E56D8D50;
  id v11 = v5;
  id v9 = v5;
  [(objc_class *)v8 bestDomainForAppID:v7 completionHandler:v10];
}

void __62__PKHideMyEmailManager_bestDomainForAppIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Could not find associated domain for bundleId:", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isHSA2Enabled
{
  id v3 = [(PKHideMyEmailManager *)self _primaryAccount];
  if (objc_msgSend(v3, "aa_isManagedAppleID"))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F4EF40] sharedInstance];
    int v6 = [(PKHideMyEmailManager *)self _primaryAccount];
    BOOL v4 = (unint64_t)[v5 securityLevelForAccount:v6] > 3;
  }
  return v4;
}

- (id)_primaryAccount
{
  uint64_t v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v3 = [v2 primaryAuthKitAccount];

  return v3;
}

- (id)_primaryAccountAltDSID
{
  uint64_t v2 = [(PKHideMyEmailManager *)self _primaryAccount];
  id v3 = [v2 accountPropertyForKey:@"altDSID"];

  return v3;
}

- (id)forwardingEmailForPrimaryAccount
{
  id v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  BOOL v4 = [(PKHideMyEmailManager *)self _primaryAccount];
  id v5 = [v3 forwardingEmailForAccount:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end