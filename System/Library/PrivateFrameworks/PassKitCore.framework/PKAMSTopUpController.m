@interface PKAMSTopUpController
- (AMSURLProtocolDelegate)taskDelegate;
- (id)_bag;
- (void)_executeAMSURLRequestForBagKey:(id)a3 method:(int64_t)a4 parameters:(id)a5 completion:(id)a6;
- (void)requestDTUAvailable:(id)a3;
- (void)requestDTUConfigurationWithCompletion:(id)a3;
- (void)requestPurchaseWithAmount:(id)a3 promotionConfiguration:(id)a4 completion:(id)a5;
- (void)setTaskDelegate:(id)a3;
@end

@implementation PKAMSTopUpController

- (id)_bag
{
  return (id)[MEMORY[0x1E4F4DBD8] bagForProfile:@"Wallet" profileVersion:@"1"];
}

- (void)_executeAMSURLRequestForBagKey:(id)a3 method:(int64_t)a4 parameters:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = [(PKAMSTopUpController *)self _bag];
  v14 = [v13 URLForKey:v12];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F4DE68]) initWithBag:v13];
  [v15 setRequestEncoding:3];
  v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v17 = objc_msgSend(v16, "ams_activeiTunesAccount");

  [v15 setAccount:v17];
  v18 = AMSLogKey();
  [v15 setLogUUID:v18];

  v19 = [v15 requestWithMethod:a4 bagURL:v14 parameters:v11];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__PKAMSTopUpController__executeAMSURLRequestForBagKey_method_parameters_completion___block_invoke;
  v22[3] = &unk_1E56E8F30;
  v22[4] = self;
  id v23 = v10;
  id v20 = v10;
  id v21 = (id)[v19 thenWithBlock:v22];
}

id __84__PKAMSTopUpController__executeAMSURLRequestForBagKey_method_parameters_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F4DE88];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v7 = (void *)[v5 initWithConfiguration:v6];

  v8 = [*(id *)(a1 + 32) taskDelegate];
  [v7 setDelegate:v8];

  v9 = [v7 dataTaskPromiseWithRequest:v4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PKAMSTopUpController__executeAMSURLRequestForBagKey_method_parameters_completion___block_invoke_2;
  v11[3] = &unk_1E56E8F08;
  id v12 = *(id *)(a1 + 40);
  [v9 addFinishBlock:v11];

  return v9;
}

void __84__PKAMSTopUpController__executeAMSURLRequestForBagKey_method_parameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    id v5 = [a2 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestDTUConfigurationWithCompletion:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = @"useApplePayForWalletTopUp";
  v9[1] = @"isForAppleAccountPassDashboard";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKAMSTopUpController_requestDTUConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_1E56D9348;
  id v8 = v4;
  id v6 = v4;
  [(PKAMSTopUpController *)self _executeAMSURLRequestForBagKey:@"addFundsInfoSrv" method:4 parameters:v5 completion:v7];
}

void __62__PKAMSTopUpController_requestDTUConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = 0;
  id v11 = v5;
  id v7 = 0;
  if (a2 && !v5)
  {
    id v8 = [a2 valueForKeyPath:@"data.attributes.info"];
    id v7 = [[PKAppleBalanceDirectTopUpConfiguration alloc] initWithAMSResponseDictionary:v8];
    v9 = [PKAppleBalancePromotionConfiguration alloc];
    id v10 = [v8 PKDictionaryForKey:@"offer"];
    id v6 = [(PKAppleBalancePromotionConfiguration *)v9 initWithAMSOfferDictionary:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPurchaseWithAmount:(id)a3 promotionConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  id v10 = [(PKAMSTopUpController *)self _bag];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithInt:1000];
  v28 = v8;
  id v12 = [v8 decimalNumberByMultiplyingBy:v11];

  v13 = [v12 stringValue];
  id v14 = objc_alloc_init(MEMORY[0x1E4F4DC00]);
  [v14 setParameter:v13 forKey:@"price"];
  [v14 setParameter:v13 forKey:@"amount"];
  v15 = [NSNumber numberWithBool:1];
  [v14 setParameter:v15 forKey:@"addFunds"];

  v16 = [NSNumber numberWithInt:4];
  [v14 setParameter:v16 forKey:*MEMORY[0x1E4F4DA28]];

  if (v9)
  {
    v17 = [v9 programIdentifier];
    [v14 setParameter:v17 forKey:@"programId"];

    v18 = [v9 versionIdentifier];
    [v14 setParameter:v18 forKey:@"versionId"];

    v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "stamp"));
    [v14 setParameter:v19 forKey:@"stamp"];
  }
  id v20 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v21 = objc_msgSend(v20, "ams_activeiTunesAccount");

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F4DDD8]) initWithPurchaseType:0 buyParams:v14];
  [v22 setAccount:v21];
  id v23 = AMSLogKey();
  [v22 setLogUUID:v23];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F4DDF0]) initWithPurchase:v22 bag:v10];
  v25 = [(PKAMSTopUpController *)self taskDelegate];
  [v24 setDelegate:v25];

  v26 = [v24 performPurchase];
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke;
  v30[3] = &unk_1E56E8F58;
  objc_copyWeak(&v32, &location);
  id v27 = v29;
  id v31 = v27;
  [v26 addFinishBlock:v30];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void, void, id))(v7 + 16))(v7, 0, 0, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke_2;
    v9[3] = &unk_1E56D9348;
    id v10 = *(id *)(a1 + 32);
    [WeakRetained _executeAMSURLRequestForBagKey:@"addFundsSuccessSrv" method:2 parameters:0 completion:v9];
  }
}

uint64_t __84__PKAMSTopUpController_requestPurchaseWithAmount_promotionConfiguration_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a3 == 0, a2);
  }
  return result;
}

- (void)requestDTUAvailable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    [(PKAsyncUnaryOperationComposer *)v5 addOperation:&__block_literal_global_116];
    id v6 = [(PKAMSTopUpController *)self _bag];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__35;
    v23[4] = __Block_byref_object_dispose__35;
    id v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__35;
    v21[4] = __Block_byref_object_dispose__35;
    id v22 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_86;
    v18[3] = &unk_1E56E0F18;
    id v7 = v6;
    id v19 = v7;
    id v20 = v23;
    [(PKAsyncUnaryOperationComposer *)v5 addOperation:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_3;
    v15[3] = &unk_1E56E0F18;
    id v8 = v7;
    id v16 = v8;
    v17 = v21;
    [(PKAsyncUnaryOperationComposer *)v5 addOperation:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_5;
    v14[3] = &unk_1E56E8FF0;
    v14[4] = v23;
    v14[5] = v21;
    [(PKAsyncUnaryOperationComposer *)v5 addOperation:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_93;
    v13[3] = &unk_1E56E9040;
    v13[4] = self;
    [(PKAsyncUnaryOperationComposer *)v5 addOperation:v13];
    id v9 = [MEMORY[0x1E4F1CA98] null];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_104;
    v11[3] = &unk_1E56E3B10;
    id v12 = v4;
    id v10 = [(PKAsyncUnaryOperationComposer *)v5 evaluateWithInput:v9 completion:v11];

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
  }
}

void __44__PKAMSTopUpController_requestDTUAvailable___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F4DC48] isWalletBiometricsEnabled];
  if ((v7 & 1) == 0)
  {
    id v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Biometrics not enabled for Apple Pay, failing PKAMSTopUpController biometric availability check", v9, 2u);
    }
  }
  v6[2](v6, v5, v7 ^ 1u);
}

void __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_86(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) stringForKey:@"countryCode"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_2;
  v12[3] = &unk_1E56E8FA0;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 valueWithCompletion:v12];
}

uint64_t __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 copy];
  uint64_t v4 = [v3 uppercaseString];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

void __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) arrayForKey:@"apple-pay-classic-networks"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_4;
  v12[3] = &unk_1E56E8FC8;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 valueWithCompletion:v12];
}

uint64_t __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

void __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v11 && (uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) != 0)
  {
    id v13 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Fetching in-app payment passes for countryCode: %@, paymentNetworks: %@", buf, 0x16u);
    }

    id v14 = +[PKPassLibrary sharedInstance];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_91;
    v17[3] = &unk_1E56D8798;
    id v19 = v10;
    id v18 = v8;
    [v14 hasInAppPaymentPassesForNetworks:v15 capabilities:13 issuerCountryCodes:v16 withHandler:v17];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

uint64_t __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_91(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "No eligible in app payment passes, failing PKAMSTopUpController availability check", v5, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_93(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v11 = objc_msgSend(v10, "ams_activeiTunesAccount");

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F4DBF8]) initWithAccount:v11 forSignaturePurpose:0];
  id v13 = [v12 perform];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_2_95;
  v16[3] = &unk_1E56E9018;
  objc_copyWeak(&v19, &location);
  id v14 = v9;
  id v18 = v14;
  id v15 = v8;
  id v17 = v15;
  [v13 resultWithCompletion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_2_95(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"NO";
      if (a2) {
        id v8 = @"YES";
      }
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Fetched AMS biometrics availability with result: %{public}@, error: %@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __44__PKAMSTopUpController_requestDTUAvailable___block_invoke_104(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = [a4 isCanceled];
  id v6 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"YES";
    if (v5) {
      id v7 = @"NO";
    }
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Apple Balance DTU available: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AMSURLProtocolDelegate)taskDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskDelegate);
  return (AMSURLProtocolDelegate *)WeakRetained;
}

- (void)setTaskDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end