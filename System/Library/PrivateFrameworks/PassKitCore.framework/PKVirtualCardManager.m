@interface PKVirtualCardManager
+ (void)isVPANAutoFillSupported:(id)a3;
- (OS_dispatch_queue)virtualCardQueue;
- (PKVirtualCardManager)init;
- (id)urlToPassDetailsForVirtualCard:(id)a3;
- (void)accountVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)activeVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)credentialsForVirtualCard:(id)a3 authorization:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)credentialsForVirtualCard:(id)a3 authorization:(id)a4 options:(unint64_t)a5 merchantHost:(id)a6 completion:(id)a7;
- (void)queryKeychainForVirtualCard:(id)a3;
- (void)setVirtualCardQueue:(id)a3;
- (void)vpanVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4;
@end

@implementation PKVirtualCardManager

- (PKVirtualCardManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKVirtualCardManager;
  v2 = [(PKVirtualCardManager *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(PKInAppPaymentService);
    inAppPaymentService = v2->_inAppPaymentService;
    v2->_inAppPaymentService = v3;

    uint64_t v5 = +[PKAccountService sharedInstance];
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PassKitCore.virtualcardmanager.activecardsqueue", 0);
    virtualCardQueue = v2->_virtualCardQueue;
    v2->_virtualCardQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v9;
  }
  return v2;
}

- (void)activeVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  if (v6)
  {
    if ((unint64_t)PKCurrentPassbookState() >= 2)
    {
      v11 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKVirtualCardManager not returning active virtual cards because Wallet has been deleted.", buf, 2u);
      }

      v6[2](v6, 0);
    }
    else
    {
      dispatch_queue_t v7 = dispatch_group_create();
      *(void *)buf = 0;
      v25 = buf;
      uint64_t v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__66;
      v28 = __Block_byref_object_dispose__66;
      id v29 = 0;
      dispatch_group_enter(v7);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke;
      v21[3] = &unk_1E56DE8D0;
      v23 = buf;
      v8 = v7;
      v22 = v8;
      [(PKVirtualCardManager *)self accountVirtualCardsWithOptions:a3 completion:v21];
      dispatch_group_enter(v8);
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3032000000;
      v19[3] = __Block_byref_object_copy__66;
      v19[4] = __Block_byref_object_dispose__66;
      id v20 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_2;
      v16[3] = &unk_1E56DE8D0;
      v18 = v19;
      v9 = v8;
      v17 = v9;
      [(PKVirtualCardManager *)self vpanVirtualCardsWithOptions:a3 completion:v16];
      virtualCardQueue = self->_virtualCardQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_3;
      block[3] = &unk_1E56F1668;
      v14 = v19;
      v15 = buf;
      v13 = v6;
      dispatch_group_notify(v9, virtualCardQueue, block);

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__PKVirtualCardManager_activeVirtualCardsWithOptions_completion___block_invoke_3(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40) || *(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = v2;
    if (*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      objc_msgSend(v2, "unionSet:");
      id v2 = v6;
    }
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      objc_msgSend(v6, "unionSet:");
      id v2 = v6;
    }
    uint64_t v3 = a1[4];
    id v4 = (void *)[v2 copy];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(a1[4] + 16);
    v5();
  }
}

- (void)accountVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Safari fetching active Apple Cards", buf, 2u);
  }

  if ((~v4 & 3) == 0)
  {
    inAppPaymentService = self->_inAppPaymentService;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke;
    v13[3] = &unk_1E56F1690;
    v13[4] = self;
    id v14 = v6;
    [(PKInAppPaymentService *)inAppPaymentService paymentHardwareStatusWithType:1 completion:v13];
    v9 = v14;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "CVV not requested, querying keychain", buf, 2u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_24;
    v11[3] = &unk_1E56E4710;
    id v12 = v6;
    [(PKVirtualCardManager *)self queryKeychainForVirtualCard:v11];
    v9 = v12;
    goto LABEL_12;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Invalid options when requesting virtual cards", buf, 2u);
  }

  (*((void (**)(id, void))v6 + 2))(v6, 0);
LABEL_13:
}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 canDecryptBAAEncryptedData];
  char v4 = PKLogFacilityTypeGetObject(0xEuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Device supports CVV AutoFill, fetching credentials from database", buf, 2u);
    }

    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_16;
    v12[3] = &unk_1E56DD728;
    dispatch_queue_t v7 = &v13;
    id v8 = *(id *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v8;
    [v6 accountsWithPassLocallyProvisionedWithCompletion:v12];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Device does not support CVV AutoFill, fallback to keychain", buf, 2u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_22;
    v10[3] = &unk_1E56E4710;
    dispatch_queue_t v7 = &v11;
    v9 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v9 queryKeychainForVirtualCard:v10];
  }
}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_16(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 count];
  if (a3 || !v6)
  {
    v32 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "Device does not have account with pass provisioned locally, fallback to keychain", buf, 2u);
    }

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_20;
    v41[3] = &unk_1E56E4710;
    v33 = *(void **)(a1 + 32);
    id v42 = *(id *)(a1 + 40);
    [v33 queryKeychainForVirtualCard:v41];
    id v7 = v42;
  }
  else
  {
    uint64_t v35 = a1;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v36 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      uint64_t v37 = *(void *)v49;
      id v38 = v8;
      do
      {
        uint64_t v12 = 0;
        uint64_t v39 = v10;
        do
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
          if ([v13 type] == 1
            && [v13 state] == 1
            && [v13 supportsShowVirtualCard])
          {
            uint64_t v40 = v12;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v14 = [v13 creditDetails];
            v15 = [v14 virtualCards];

            uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v45;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v45 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                  if ([v20 state] == 1)
                  {
                    v21 = [v20 keychainVirtualCard];
                    v22 = [v21 keychainCardCredentials];
                    [v20 setKeychainCardCredentials:v22];

                    uint64_t v23 = [v13 feature];
                    id v29 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_DISPLAY_NAME", v23, 0, v24, v25, v26, v27, v28, v34);
                    [v20 setDisplayName:v29];

                    [v20 setRequiresAuthentication:1];
                    [v7 addObject:v20];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v17);
            }

            uint64_t v11 = v37;
            id v8 = v38;
            uint64_t v10 = v39;
            uint64_t v12 = v40;
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v10);
    }

    uint64_t v30 = *(void *)(v35 + 40);
    v31 = (void *)[v7 copy];
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);

    id v5 = v36;
  }
}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

void __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

uint64_t __66__PKVirtualCardManager_accountVirtualCardsWithOptions_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialsForVirtualCard:(id)a3 authorization:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
}

- (void)credentialsForVirtualCard:(id)a3 authorization:(id)a4 options:(unint64_t)a5 merchantHost:(id)a6 completion:(id)a7
{
  char v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void *, void))a7;
  uint64_t v16 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Safari fetching virtual card credentials", buf, 2u);
  }

  if (v15)
  {
    if (!v13 || (v9 & 3) == 1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Fetching keychain card credentials", buf, 2u);
      }

      uint64_t v18 = [v12 keychainCardCredentials];
      v15[2](v15, v18, 0);
    }
    else if ((v9 & 3) == 3)
    {
      inAppPaymentService = self->_inAppPaymentService;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke;
      v19[3] = &unk_1E56F16E0;
      id v20 = v12;
      v21 = self;
      id v22 = v13;
      uint64_t v24 = v15;
      id v23 = v14;
      [(PKInAppPaymentService *)inAppPaymentService paymentHardwareStatusWithType:1 completion:v19];
    }
    else
    {
      v15[2](v15, 0, 0);
    }
  }
}

void __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke(uint64_t a1, void *a2)
{
  if (![a2 canDecryptBAAEncryptedData])
  {
    unint64_t v9 = [*(id *)(a1 + 32) type];
    if (v9 < 2)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Hardware does not support decrypting virtual card, fallback to Keychain", buf, 2u);
      }

      uint64_t v11 = *(void *)(a1 + 64);
      id v12 = [*(id *)(a1 + 32) keychainCardCredentials];
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);

      return;
    }
    if (v9 != 2) {
      return;
    }
    id v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "Error: Hardware does not support decrypting virtual card.";
LABEL_17:
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_18:

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  id v3 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Decrypting virtual card for Safari", buf, 2u);
  }

  uint64_t v4 = [*(id *)(a1 + 32) type];
  switch(v4)
  {
    case 0:
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v13 = "Cannot retrieve credentials for PKVirtualCard with unknown type";
        goto LABEL_17;
      }
      goto LABEL_18;
    case 2:
      id v14 = +[PKPaymentWebService sharedService];
      BOOL v15 = PKVirtualCardEnabledWithWebService(v14);

      if (!v15) {
        return;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Card is of VPAN type: Using Payment Service", buf, 2u);
      }

      if (os_variant_has_internal_ui() && PKVirtualCardFakeCredentialsEnabled())
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKVirtualCardFakeCredentialsEnabled is true: Providing demo credentials to Safari", buf, 2u);
        }

        if (PKVirtualCardFakeCredentialsWithDelayEnabled()) {
          int64_t v16 = 1000000000 * (int)(arc4random_uniform(4u) + 3);
        }
        else {
          int64_t v16 = 0;
        }
        dispatch_time_t v21 = dispatch_time(0, v16);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_28;
        block[3] = &unk_1E56D8A18;
        id v25 = *(id *)(a1 + 32);
        id v26 = *(id *)(a1 + 64);
        dispatch_after(v21, MEMORY[0x1E4F14428], block);

        id v8 = v25;
      }
      else
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 24);
        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_2;
        v22[3] = &unk_1E56F16B8;
        id v23 = *(id *)(a1 + 64);
        [v18 vpanCardCredentialsForVirtualCard:v17 authorization:v19 merchantHost:v20 completion:v22];
        id v8 = v23;
      }
      break;
    case 1:
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 16);
      uint64_t v7 = *(void *)(a1 + 48);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_25;
      v27[3] = &unk_1E56F16B8;
      id v28 = *(id *)(a1 + 64);
      [v6 cardCredentialsForVirtualCard:v5 authorization:v7 action:2 completion:v27];
      id v8 = v28;
      break;
    default:
      return;
  }
}

uint64_t __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_28(uint64_t a1)
{
  id v2 = +[PKVirtualCardCredentials demoVPANCredentials];
  objc_msgSend(v2, "setCardType:", objc_msgSend(*(id *)(a1 + 32), "credentialType"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __96__PKVirtualCardManager_credentialsForVirtualCard_authorization_options_merchantHost_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)urlToPassDetailsForVirtualCard:(id)a3
{
  id v3 = a3;
  if (+[PKWalletVisibility isWalletVisible])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v4 setScheme:@"wallet"];
    [v4 setHost:@"virtualCard"];
    uint64_t v5 = [v3 identifier];

    uint64_t v6 = [@"/" stringByAppendingFormat:@"%@/%@", v5, @"details"];
    [v4 setPath:v6];

    uint64_t v7 = [v4 URL];
  }
  else
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"prefs:root=PASSBOOK&path="];
    [v4 appendString:@"virtualCard"];
    [v4 appendString:@"/"];
    id v8 = [v3 identifier];

    [v4 appendString:v8];
    [v4 appendString:@"/"];
    [v4 appendString:@"details"];
    unint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v10 = (void *)[v4 copy];
    uint64_t v7 = [v9 URLWithString:v10];
  }
  return v7;
}

+ (void)isVPANAutoFillSupported:(id)a3
{
  if (a3)
  {
    uint64_t v5 = (void (**)(id, BOOL))a3;
    id v3 = +[PKPaymentWebService sharedService];
    BOOL v4 = PKVirtualCardEnabledWithWebService(v3) && PKSecureElementIsAvailable() != 0;

    v5[2](v5, v4);
  }
}

- (void)vpanVirtualCardsWithOptions:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = +[PKPaymentWebService sharedService];
  BOOL v8 = PKVirtualCardEnabledWithWebService(v7);

  if (!v8)
  {
LABEL_8:
    v6[2](v6, 0);
    goto LABEL_9;
  }
  unint64_t v9 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Safari fetching active VPAN virtual cards", buf, 2u);
  }

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Invalid options for VPAN virtual card request: Need to request PrimaryAccountNumber", buf, 2u);
    }

    goto LABEL_8;
  }
  if (os_variant_has_internal_ui() && PKVirtualCardFakeVirtualCardsEnabled())
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKVirtualCardFakeVirtualCardsEnabled is true: Providing demo virtual cards to Safari", buf, 2u);
    }

    uint64_t v10 = +[PKVirtualCard demoVPANVirtualCards];
    ((void (**)(id, void *))v6)[2](v6, v10);
  }
  else
  {
    inAppPaymentService = self->_inAppPaymentService;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke;
    v12[3] = &unk_1E56F1690;
    v12[4] = self;
    id v13 = v6;
    [(PKInAppPaymentService *)inAppPaymentService paymentHardwareStatusWithType:1 completion:v12];
  }
LABEL_9:
}

void __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 canDecryptBAAEncryptedData])
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke_2;
    v6[3] = &unk_1E56F1708;
    id v7 = *(id *)(a1 + 40);
    [v3 virtualCardsWithActiveVPAN:v6];
  }
  else
  {
    char v4 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Error: Hardware does not support VPAN virtual cards.", v5, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __63__PKVirtualCardManager_vpanVirtualCardsWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get VPAN virtual cards %@", (uint8_t *)&v9, 0xCu);
    }

    BOOL v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    BOOL v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)queryKeychainForVirtualCard:(id)a3
{
  id v4 = a3;
  accountService = self->_accountService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PKVirtualCardManager_queryKeychainForVirtualCard___block_invoke;
  v7[3] = &unk_1E56E4710;
  id v8 = v4;
  id v6 = v4;
  [(PKAccountService *)accountService virtualCardsInKeychainWithCompletion:v7];
}

void __52__PKVirtualCardManager_queryKeychainForVirtualCard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 isValidFromKeychain] && objc_msgSend(v10, "state") == 1) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = (void *)[v4 copy];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Virtual card does not have credentials stored in Keychain", v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (OS_dispatch_queue)virtualCardQueue
{
  return self->_virtualCardQueue;
}

- (void)setVirtualCardQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCardQueue, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_inAppPaymentService, 0);
}

@end