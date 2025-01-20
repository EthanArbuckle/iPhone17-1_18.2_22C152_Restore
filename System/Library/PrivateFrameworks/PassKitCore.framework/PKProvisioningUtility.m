@interface PKProvisioningUtility
- (PKProvisioningUtility)init;
- (PKProvisioningUtility)initWithDestinationWebService:(id)a3 managingWebService:(id)a4;
- (PKProvisioningUtilityDataHelper)dataProvider;
- (void)_downloadAndIngestPassesFoPasses:(id)a3 response:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8;
- (void)_requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 downloadPasses:(BOOL)a6 resolveEnableRequirements:(BOOL)a7 onStartPassDownload:(id)a8 sid:(id)a9 completion:(id)a10;
- (void)_updateRequirementsRequestForSuperEasyProvisioning:(id)a3 sid:(id)a4 completion:(id)a5;
- (void)downloadAndIngestPassForPassURL:(id)a3 deviceCredential:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8;
- (void)downloadAndIngestPassesForResponse:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 ingestionProperties:(id)a5 sid:(id)a6 completion:(id)a7;
- (void)downloadMoreInfoItemsFrom:(id)a3 metadata:(id)a4 sid:(id)a5 completion:(id)a6;
- (void)ingestProvisioningPassData:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 moreInfoURLs:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8;
- (void)nonceWithSID:(id)a3 completion:(id)a4;
- (void)requestEligibility:(id)a3 sid:(id)a4 completion:(id)a5;
- (void)requestProvisioning:(id)a3 completion:(id)a4;
- (void)requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 onStartPassDownload:(id)a6 completion:(id)a7;
- (void)requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 onStartPassDownload:(id)a6 sid:(id)a7 requireZoneCreationSuccess:(BOOL)a8 completion:(id)a9;
- (void)requestProvisioning:(id)a3 sid:(id)a4 completion:(id)a5;
- (void)requestRequirements:(id)a3 sid:(id)a4 completion:(id)a5;
- (void)setDataProvider:(id)a3;
- (void)updateProvisioningRequestForEnableRequirements:(id)a3 externalizedAuth:(id)a4 sid:(id)a5 completion:(id)a6;
@end

@implementation PKProvisioningUtility

- (PKProvisioningUtility)init
{
  return 0;
}

- (PKProvisioningUtility)initWithDestinationWebService:(id)a3 managingWebService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningUtility;
  v9 = [(PKProvisioningUtility *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationWebService, a3);
    objc_storeStrong((id *)&v10->_managingWebService, a4);
  }

  return v10;
}

- (void)requestRequirements:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke;
    v16[3] = &unk_1E56DEFE8;
    v16[4] = &v17;
    uint64_t v11 = PKBeginBackgroundTask(@"com.apple.passbook.cardRequirements", v16);
    v18[3] = v11;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_2;
    v12[3] = &unk_1E56EB8E8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v10;
    v15 = &v17;
    [(PKProvisioningUtility *)self _updateRequirementsRequestForSuperEasyProvisioning:v13 sid:v9 completion:v12];

    _Block_object_dispose(&v17, 8);
  }
}

void __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    PKEndBackgroundTask(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

void __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_3;
  v6[3] = &unk_1E56EB8C0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 requirementsForRequest:v2 completion:v6];
}

void __60__PKProvisioningUtility_requestRequirements_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (a2 == 1 && v12)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
    v9();
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKWebServiceErrorDomain" code:5 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_8:
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v11)
  {
    PKEndBackgroundTask(v11);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)_updateRequirementsRequestForSuperEasyProvisioning:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 paymentCredential];
  if ([v10 couldSupportSuperEasyProvisioning]
    && ([v10 state],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 hasNonce],
        v11,
        (v12 & 1) == 0))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91__PKProvisioningUtility__updateRequirementsRequestForSuperEasyProvisioning_sid_completion___block_invoke;
    v13[3] = &unk_1E56D9550;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    [(PKProvisioningUtility *)self nonceWithSID:v15 completion:v13];
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __91__PKProvisioningUtility__updateRequirementsRequestForSuperEasyProvisioning_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) state];
    [v7 setNonce:v5];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2080;
      char v12 = "-[PKProvisioningUtility _updateRequirementsRequestForSuperEasyProvisioning:sid:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "[%@] %s - Failed to get nonce for serial provisioning. Returning with error %@", (uint8_t *)&v9, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)requestEligibility:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = v10;
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke;
    aBlock[3] = &unk_1E56EB938;
    aBlock[4] = self;
    id v12 = v10;
    id v20 = v12;
    __int16 v13 = _Block_copy(aBlock);
    id v14 = [v8 nonce];
    if (v14)
    {
    }
    else if ([v8 requiresNonce])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_3;
      v15[3] = &unk_1E56EB960;
      id v16 = v8;
      id v17 = v13;
      id v18 = v12;
      [(PKProvisioningUtility *)self nonceWithSID:v9 completion:v15];

LABEL_7:
      goto LABEL_8;
    }
    (*((void (**)(void *, id))v13 + 2))(v13, v8);
    goto LABEL_7;
  }
LABEL_8:
}

void __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_2;
  v4[3] = &unk_1E56EB910;
  id v5 = *(id *)(a1 + 40);
  [v3 eligibilityForRequest:a2 completion:v4];
}

void __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  id v8 = v7;
  if (a2 == 1 && v11)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
    v9();
    goto LABEL_8;
  }
  if (v7)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKWebServiceErrorDomain" code:5 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_8:
}

uint64_t __59__PKProvisioningUtility_requestEligibility_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v6();
  }
  else
  {
    [*(id *)(a1 + 32) setNonce:a2];
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
}

- (void)requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 onStartPassDownload:(id)a6 completion:(id)a7
{
}

- (void)requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 onStartPassDownload:(id)a6 sid:(id)a7 requireZoneCreationSuccess:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v21 = [[PKPaymentCloudStoreZoneCreationManager alloc] initWithWebService:self->_destinationWebService];
  objc_initWeak(&location, self);
  v22 = [v15 eligibilityResponse];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __154__PKProvisioningUtility_requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_onStartPassDownload_sid_requireZoneCreationSuccess_completion___block_invoke;
  v29[3] = &unk_1E56EB988;
  BOOL v37 = a8;
  objc_copyWeak(&v36, &location);
  id v23 = v15;
  id v30 = v23;
  id v24 = v16;
  id v31 = v24;
  id v25 = v17;
  id v32 = v25;
  id v26 = v18;
  id v34 = v26;
  id v27 = v19;
  id v33 = v27;
  id v28 = v20;
  id v35 = v28;
  [(PKPaymentCloudStoreZoneCreationManager *)v21 triggerCloudStoreZoneCreationIfNeededForEligibilityResponse:v22 completion:v29];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __154__PKProvisioningUtility_requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_onStartPassDownload_sid_requireZoneCreationSuccess_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 88)) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    [WeakRetained _requestProvisioning:*(void *)(a1 + 32) externalizedAuth:*(void *)(a1 + 40) cloudStoreCoordinatorDelegate:*(void *)(a1 + 48) downloadPasses:1 resolveEnableRequirements:1 onStartPassDownload:*(void *)(a1 + 64) sid:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  }
}

- (void)requestProvisioning:(id)a3 completion:(id)a4
{
}

- (void)requestProvisioning:(id)a3 sid:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PKProvisioningUtility_requestProvisioning_sid_completion___block_invoke;
  v10[3] = &unk_1E56EB9B0;
  id v11 = v8;
  id v9 = v8;
  [(PKProvisioningUtility *)self _requestProvisioning:a3 externalizedAuth:0 cloudStoreCoordinatorDelegate:0 downloadPasses:0 resolveEnableRequirements:0 onStartPassDownload:0 sid:a4 completion:v10];
}

void __60__PKProvisioningUtility_requestProvisioning_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 provisioningResponse];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)_requestProvisioning:(id)a3 externalizedAuth:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 downloadPasses:(BOOL)a6 resolveEnableRequirements:(BOOL)a7 onStartPassDownload:(id)a8 sid:(id)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v33 = a5;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_initWeak(location, self);
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__41;
  v64[4] = __Block_byref_object_dispose__41;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__41;
  v62[4] = __Block_byref_object_dispose__41;
  id v63 = [[PKProvisionedPassBundle alloc] _init];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke;
  v55[3] = &unk_1E56EBA00;
  BOOL v61 = a7;
  objc_copyWeak(&v60, location);
  id v21 = v15;
  id v56 = v21;
  id v22 = v16;
  id v57 = v22;
  id v23 = v18;
  id v58 = v23;
  v59 = v64;
  [(PKAsyncUnaryOperationComposer *)v20 addOperation:v55];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_72;
  v50[3] = &unk_1E56EBA50;
  id v24 = v21;
  id v51 = v24;
  objc_copyWeak(&v54, location);
  id v25 = v23;
  id v52 = v25;
  v53 = v64;
  [(PKAsyncUnaryOperationComposer *)v20 addOperation:v50];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_3;
  v46[3] = &unk_1E56E3958;
  v46[4] = self;
  id v26 = v24;
  id v47 = v26;
  v48 = v64;
  v49 = v62;
  [(PKAsyncUnaryOperationComposer *)v20 addOperation:v46];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_5;
  v39[3] = &unk_1E56EBAC8;
  BOOL v45 = a6;
  id v27 = v17;
  id v42 = v27;
  v43 = v62;
  v39[4] = self;
  id v28 = v33;
  id v40 = v28;
  id v29 = v25;
  id v41 = v29;
  v44 = v64;
  [(PKAsyncUnaryOperationComposer *)v20 addOperation:v39];
  id v30 = [MEMORY[0x1E4F1CA98] null];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_7;
  v35[3] = &unk_1E56E2AE0;
  id v31 = v19;
  id v36 = v31;
  BOOL v37 = v62;
  v38 = v64;
  id v32 = [(PKAsyncUnaryOperationComposer *)v20 evaluateWithInput:v30 completion:v35];

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v60);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  objc_destroyWeak(location);
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(unsigned char *)(a1 + 72))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2;
    v15[3] = &unk_1E56EB9D8;
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 56);
    id v16 = v13;
    uint64_t v19 = v14;
    id v18 = v8;
    id v17 = v6;
    [WeakRetained updateProvisioningRequestForEnableRequirements:v10 externalizedAuth:v11 sid:v13 completion:v15];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Provisioning controller failed to update provisioning request with error %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[6] + 16))();
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_72(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) nonce];

  if (v8)
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2_73;
    v13[3] = &unk_1E56EBA28;
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 48);
    id v14 = v11;
    uint64_t v17 = v12;
    uint64_t v16 = v7;
    id v15 = v6;
    [WeakRetained nonceWithSID:v10 completion:v13];
  }
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_2_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 && !v5) {
    [*(id *)(a1 + 32) setNonce:a2];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_4;
  v12[3] = &unk_1E56EBA78;
  id v13 = v6;
  id v14 = v7;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v10 = v6;
  id v11 = v7;
  [v9 provisionPassesWithRequest:v8 completion:v12];
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if (a2 == 1) {
    [*(id *)(*(void *)(a1[7] + 8) + 40) setProvisioningResponse:a3];
  }
  else {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) provisioningResponse];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_6;
    v16[3] = &unk_1E56EBAA0;
    long long v19 = *(_OWORD *)(a1 + 64);
    id v18 = v10;
    id v17 = v8;
    [v12 downloadAndIngestPassesForResponse:v13 cloudStoreCoordinatorDelegate:v14 ingestionProperties:0 sid:v15 completion:v16];
  }
  else
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_6(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v13 = v5;

  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    BOOL v12 = *(void *)(*(void *)(a1[7] + 8) + 40) != 0;
  }
  else {
    BOOL v12 = 1;
  }
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], v12);
}

void __169__PKProvisioningUtility__requestProvisioning_externalizedAuth_cloudStoreCoordinatorDelegate_downloadPasses_resolveEnableRequirements_onStartPassDownload_sid_completion___block_invoke_7(void *a1)
{
  uint64_t v2 = a1[4];
  id v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) provisioningResponse];
  if (v4) {
    uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)updateProvisioningRequestForEnableRequirements:(id)a3 externalizedAuth:(id)a4 sid:(id)a5 completion:(id)a6
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (v13)
  {
    uint64_t v14 = [v10 eligibilityResponse];
    uint64_t v15 = (void *)v14;
    if (!v10 || !v14)
    {
      id v23 = PKLogFacilityTypeGetObject(0x27uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v94) = 138412290;
        *(void *)((char *)&v94 + 4) = v12;
        _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request missing request or eligibilityResponse", (uint8_t *)&v94, 0xCu);
      }

      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:0 userInfo:0];
      v13[2](v13, 0, v16);
      goto LABEL_31;
    }
    uint64_t v16 = [(PKPaymentWebService *)self->_destinationWebService targetDevice];
    id v40 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    *(void *)&long long v94 = 0;
    *((void *)&v94 + 1) = &v94;
    uint64_t v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__41;
    v97 = __Block_byref_object_dispose__41;
    id v98 = 0;
    if ([v15 shouldGenerateAuxiliaryCapabilities]
      && (PKPrioritizeAuxiliaryCapabilityGenerationEnabled() || ([v15 hasEnableRequirements] & 1) == 0))
    {
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke;
      v85[3] = &unk_1E56E9290;
      id v86 = v12;
      id v87 = v16;
      id v88 = v10;
      id v89 = v15;
      v90 = &v94;
      [(PKAsyncUnaryOperationComposer *)v40 addOperation:v85];

      id v24 = v86;
    }
    else
    {
      if (![v15 hasEnableRequirements])
      {
        ((void (**)(id, id, void *))v13)[2](v13, v10, 0);
LABEL_30:
        _Block_object_dispose(&v94, 8);

LABEL_31:
        goto LABEL_32;
      }
      char v36 = [v15 shouldGenerateFidoKey];
      int v39 = [v15 shouldSignFidoChallenge];
      id v17 = [(PKPaymentWebService *)self->_destinationWebService targetDevice];
      id v18 = [v17 deviceName];
      char v19 = [v18 isEqualToString:@"Apple Watch"];

      if (v11) {
        char v20 = 1;
      }
      else {
        char v20 = v19;
      }
      if ((v20 & 1) == 0 && ((v39 ^ 1) & 1) == 0)
      {
        id v21 = PKLogFacilityTypeGetObject(0x27uLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request missing externalized auth", (uint8_t *)&buf, 0xCu);
        }

        id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:0 userInfo:0];
        v13[2](v13, 0, v22);
        goto LABEL_29;
      }
      if ([v15 shouldGenerateTransactionKey])
      {
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_86;
        v78[3] = &unk_1E56EBB40;
        id v25 = v12;
        id v79 = v25;
        id v80 = v15;
        id v26 = v16;
        id v81 = v26;
        v82 = self;
        id v27 = v10;
        id v83 = v27;
        v84 = &v94;
        [(PKAsyncUnaryOperationComposer *)v40 addOperation:v78];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2;
        v73[3] = &unk_1E56DF888;
        id v74 = v25;
        id v75 = v26;
        id v76 = v27;
        v77 = &v94;
        [(PKAsyncUnaryOperationComposer *)v40 addOperation:v73];
      }
      id v28 = [v15 fidoProfile];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v92 = 0x2020000000;
      char v93 = 0;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_95;
      v69[3] = &unk_1E56E0F90;
      id v29 = v16;
      id v70 = v29;
      id v30 = v28;
      id v71 = v30;
      p_long long buf = &buf;
      [(PKAsyncUnaryOperationComposer *)v40 addOperation:v69];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_4;
      v58[3] = &unk_1E56EBBE0;
      char v67 = v36;
      id v65 = &buf;
      id v31 = v12;
      id v59 = v31;
      id v37 = v29;
      id v60 = v37;
      id v24 = v30;
      id v61 = v24;
      id v32 = v15;
      id v62 = v32;
      id v63 = v11;
      id v33 = v10;
      char v68 = v39;
      id v64 = v33;
      v66 = &v94;
      [(PKAsyncUnaryOperationComposer *)v40 addOperation:v58];
      if ([v32 shouldGenerateISO18013EncryptionKey])
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_105;
        v53[3] = &unk_1E56DF888;
        id v54 = v31;
        id v55 = v37;
        id v56 = v33;
        id v57 = &v94;
        [(PKAsyncUnaryOperationComposer *)v40 addOperation:v53];
      }
      if (objc_msgSend(v32, "shouldGenerateLongTermPrivacyKey", v37))
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_110;
        v47[3] = &unk_1E56E9290;
        id v48 = v31;
        id v49 = v38;
        id v50 = v32;
        id v51 = v33;
        id v52 = &v94;
        [(PKAsyncUnaryOperationComposer *)v40 addOperation:v47];
      }
      _Block_object_dispose(&buf, 8);
    }

    id v34 = [MEMORY[0x1E4F1CA98] null];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_114;
    v41[3] = &unk_1E56EBCA8;
    v46 = &v94;
    id v42 = v12;
    id v43 = v10;
    id v44 = v16;
    BOOL v45 = v13;
    id v35 = [(PKAsyncUnaryOperationComposer *)v40 evaluateWithInput:v34 completion:v41];

    id v22 = v42;
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v41 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate auxiliary capabilities", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector())
  {
    id v12 = [*(id *)(a1 + 48) subCredentialIdentifier];
    if (v12)
    {
      id v28 = v9;
      id v29 = v7;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = [*(id *)(a1 + 56) auxiliaryCapabilitySignatures];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if ([v18 type] == 9)
            {
              char v19 = [[PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata alloc] initWithSubcredentialIdentifier:v12];
              char v20 = [*(id *)(a1 + 48) identityAccountKeyIdentifier];
              [(PKPassAuxiliaryCapabilitySignatureIdentityAccountKeyCreationMetadata *)v19 setExistingAccountKeyIdentifier:v20];

              [v18 setKeyCreationMetadata:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v15);
      }

      id v7 = v29;
      id v9 = v28;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v22 = [*(id *)(a1 + 56) auxiliaryCapabilityDecryptions];
    [v21 addObjectsFromArray:v22];

    id v23 = [*(id *)(a1 + 56) auxiliaryCapabilitySignatures];
    [v21 addObjectsFromArray:v23];

    id v24 = *(void **)(a1 + 40);
    id v25 = (void *)[v21 copy];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_81;
    v30[3] = &unk_1E56EBAF0;
    id v26 = *(id *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 64);
    id v31 = v26;
    uint64_t v34 = v27;
    id v33 = v9;
    id v32 = v8;
    [v24 generateAuxiliaryCapabilitiesForRequirements:v25 completion:v30];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_81(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setAuxiliaryCapabilities:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v8 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v24 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate transaction key", buf, 0xCu);
  }

  id v12 = [*(id *)(a1 + 40) transactionKeyInformation];
  if (!v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v17;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request missing transaction key information", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v9[2](v9, v8, 1);
    goto LABEL_10;
  }
  id v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_89;
  v18[3] = &unk_1E56EBB18;
  id v15 = *(id *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 72);
  id v19 = v15;
  uint64_t v22 = v16;
  id v21 = v9;
  id v20 = v8;
  [v13 paymentWebService:v14 generateTransactionKeyWithParameters:v12 withCompletion:v18];

LABEL_10:
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_89(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = *(void **)(a1 + 32);
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = [v12 lastObject];
  [v10 setTransactionKey:v14];

  [*(id *)(a1 + 32) setTransactionKeyCertificateChain:v12];
  [*(id *)(a1 + 32) setSubCredentialIdentifier:v13];

  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = [v11 hexEncoding];

  uint64_t v17 = [v16 uppercaseString];
  [v15 setApplicationIdentifier:v17];

  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v9;
  id v20 = v9;

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v20 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate SE encryption key", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector())
  {
    id v12 = *(void **)(a1 + 40);
    id v13 = [*(id *)(a1 + 48) subCredentialIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_93;
    v16[3] = &unk_1E56EBB68;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    id v17 = v14;
    uint64_t v20 = v15;
    id v19 = v9;
    id v18 = v8;
    [v12 generateSEEncryptionCertificateForSubCredentialId:v13 completion:v16];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setSeBlobDeviceEncryptionCertificate:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v8 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_95(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) relyingPartyIdentifier];
    id v10 = [*(id *)(a1 + 40) accountHash];
    uint64_t v11 = [*(id *)(a1 + 40) keyHash];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_3;
    v12[3] = &unk_1E56EA6D0;
    uint64_t v15 = *(void *)(a1 + 48);
    id v14 = v7;
    id v13 = v6;
    [v8 checkFidoKeyPresenceForRelyingParty:v9 relyingPartyAccountHash:v10 fidoKeyHash:v11 completion:v12];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

uint64_t __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_3(void *a1, char a2)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(unsigned char *)(a1 + 96))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v11 = PKLogFacilityTypeGetObject(0x27uLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v44 = v13;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request skipping fido key generation because key already exists.", buf, 0xCu);
      }

      goto LABEL_11;
    }
    if (v12)
    {
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v44 = v24;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate fido key", buf, 0xCu);
    }

    if (objc_opt_respondsToSelector())
    {
      uint64_t v25 = *(void **)(a1 + 40);
      id v26 = [*(id *)(a1 + 48) relyingPartyIdentifier];
      uint64_t v27 = [*(id *)(a1 + 48) accountHash];
      id v28 = [*(id *)(a1 + 56) fidoChallenge];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_100;
      v38[3] = &unk_1E56EBB90;
      uint64_t v29 = *(void *)(a1 + 64);
      id v39 = *(id *)(a1 + 72);
      id v40 = *(id *)(a1 + 32);
      id v42 = v9;
      id v41 = v8;
      [v25 createFidoKeyForRelyingParty:v26 relyingPartyAccountHash:v27 challenge:v28 externalizedAuth:v29 completion:v38];

      uint64_t v23 = v39;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (*(unsigned char *)(a1 + 97))
  {
    id v14 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v44 = v15;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate fido challenge", buf, 0xCu);
    }

    if (objc_opt_respondsToSelector())
    {
      id v31 = *(void **)(a1 + 40);
      id v30 = [*(id *)(a1 + 48) relyingPartyIdentifier];
      uint64_t v16 = [*(id *)(a1 + 48) accountHash];
      id v17 = [*(id *)(a1 + 48) keyHash];
      id v18 = [*(id *)(a1 + 56) fidoChallenge];
      id v19 = [*(id *)(a1 + 72) subCredentialIdentifier];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_104;
      v32[3] = &unk_1E56EBBB8;
      uint64_t v20 = *(void *)(a1 + 64);
      id v21 = *(id *)(a1 + 72);
      uint64_t v22 = *(void *)(a1 + 88);
      id v33 = v21;
      uint64_t v37 = v22;
      id v34 = *(id *)(a1 + 32);
      id v36 = v9;
      id v35 = v8;
      [v31 signWithFidoKeyForRelyingParty:v30 relyingPartyAccountHash:v16 fidoKeyHash:v17 challenge:v18 publicKeyIdentifier:v19 externalizedAuth:v20 completion:v32];

      uint64_t v23 = v33;
LABEL_16:

      goto LABEL_18;
    }
LABEL_17:
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
    goto LABEL_18;
  }
LABEL_11:
  (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
LABEL_18:
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_100(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = *(void **)(a1 + 32);
  id v10 = a3;
  [v9 setFidoKey:a2];
  [*(id *)(a1 + 32) setFidoAttestation:v10];

  uint64_t v11 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138412546;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request createFidoKeyForRelyingParty returned error %@", (uint8_t *)&v13, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_104(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [*(id *)(a1 + 32) setFidoSignedChallenge:a2];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  id v7 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request signWithFidoKeyForRelyingParty returned error %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_105(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate ISO18013 encryption key", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector())
  {
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = [*(id *)(a1 + 48) subCredentialIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_108;
    v16[3] = &unk_1E56EBC08;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    id v17 = v14;
    uint64_t v20 = v15;
    id v19 = v9;
    id v18 = v8;
    [v12 generateISOEncryptionCertificateForSubCredentialId:v13 completion:v16];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_108(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  id v9 = a3;
  [v8 setIsoDeviceEncryptionAttestation:a2];
  [*(id *)(a1 + 32) setIsoDeviceEncryptionAuthorization:v9];

  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v12 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_110(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request should generate LTPK", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector())
  {
    id v12 = [*(id *)(a1 + 48) credentialAuthorityIdentifier];
    uint64_t v13 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_113;
    v16[3] = &unk_1E56EBB68;
    id v14 = *(id *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64);
    id v17 = v14;
    uint64_t v20 = v15;
    id v19 = v9;
    id v18 = v8;
    [v13 longTermPrivacyKeyForCredentialGroupIdentifier:v12 reuseExisting:1 completion:v16];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_113(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setLongTermPrivacyKey:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v8 != 0);
}

void __104__PKProvisioningUtility_updateProvisioningRequestForEnableRequirements_externalizedAuth_sid_completion___block_invoke_2_114(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = ([a4 isCanceled] & 1) == 0 && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) == 0;
  uint64_t v6 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = @"N";
    if (v5) {
      id v9 = @"Y";
    }
    int v13 = 138412803;
    uint64_t v14 = v7;
    __int16 v15 = 2113;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Update provisioning request updated request to %{private}@, success: %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v10 = [*(id *)(a1 + 40) subCredentialIdentifier];
  if (v10) {
    char v11 = v5;
  }
  else {
    char v11 = 1;
  }
  if (v11 & 1) == 0 && (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 48) deleteKeyMaterialForSubCredentialId:v10];
  }
  if (v5) {
    uint64_t v12 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v12 = 0;
  }
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v12, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
}

- (void)downloadAndIngestPassesForResponse:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 ingestionProperties:(id)a5 sid:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v16 downloadablePasses];
  [(PKProvisioningUtility *)self _downloadAndIngestPassesFoPasses:v17 response:v16 cloudStoreCoordinatorDelegate:v15 ingestionProperties:v14 sid:v13 completion:v12];
}

- (void)downloadAndIngestPassForPassURL:(id)a3 deviceCredential:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = [[PKPaymentProvisioningPassData alloc] initWithPassURL:v19];

  [(PKPaymentProvisioningPassData *)v20 setDeviceCredential:v18];
  [(PKPaymentProvisioningPassData *)v20 setWillProvisionWithAuthenticationDisabled:1];
  v22[0] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [(PKProvisioningUtility *)self _downloadAndIngestPassesFoPasses:v21 response:0 cloudStoreCoordinatorDelegate:v17 ingestionProperties:v16 sid:v15 completion:v14];
}

- (void)_downloadAndIngestPassesFoPasses:(id)a3 response:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v38 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v30 = a8;
  id v15 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v16 = [v14 firstObject];
  id v32 = [v16 passURL];

  id v37 = [[PKProvisionedPassBundle alloc] _init];
  [v37 setProvisioningResponse:v38];
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__41;
  v64[4] = __Block_byref_object_dispose__41;
  id v65 = 0;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v18 = [v14 reverseObjectEnumerator];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v61;
    id obj = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v61 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke;
        v59[3] = &unk_1E56E0F90;
        v59[4] = self;
        v59[5] = v22;
        v59[6] = v64;
        -[PKAsyncUnaryOperationComposer addOperation:](v15, "addOperation:", v59, v30);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_3;
        v47[3] = &unk_1E56EBC80;
        id v48 = v32;
        uint64_t v49 = v22;
        id v50 = self;
        id v51 = v35;
        id v52 = v38;
        id v53 = v34;
        id v54 = v33;
        id v55 = v37;
        id v56 = v36;
        id v57 = v17;
        id v58 = v64;
        [(PKAsyncUnaryOperationComposer *)v15 addOperation:v47];
      }
      id v18 = obj;
      uint64_t v19 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v19);
  }

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_128;
  v45[3] = &unk_1E56E9040;
  id v23 = v38;
  id v46 = v23;
  [(PKAsyncUnaryOperationComposer *)v15 addOperation:v45];
  uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2_130;
  v39[3] = &unk_1E56EBCA8;
  id v25 = v17;
  id v40 = v25;
  id v26 = v37;
  id v41 = v26;
  id v27 = v36;
  id v42 = v27;
  id v28 = v30;
  id v43 = v28;
  uint64_t v44 = v64;
  id v29 = [(PKAsyncUnaryOperationComposer *)v15 evaluateWithInput:v24 completion:v39];

  _Block_object_dispose(v64, 8);
}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
  id v9 = [*(id *)(a1 + 40) passURL];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2;
  v13[3] = &unk_1E56EBC30;
  int8x16_t v14 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v10 = *(void *)(a1 + 48);
  id v16 = v7;
  uint64_t v17 = v10;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 passAtURL:v9 completion:v13];
}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    [*(id *)(a1 + 32) setSecureElementPass:v4];
    BOOL v5 = [*(id *)(*(void *)(a1 + 40) + 8) verificationRecordForPass:v8];
    [*(id *)(*(void *)(a1 + 40) + 8) removeVerificationRequestRecord:v5];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:0 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v5 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0);
}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) passURL];

  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v22 = *(void **)(a1 + 48);
  if (v8 == v9)
  {
    id v11 = [*(id *)(a1 + 64) moreInfoURLs];
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_4;
  v23[3] = &unk_1E56EBC58;
  BOOL v32 = v8 == v9;
  id v14 = *(id *)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 40);
  id v24 = v14;
  uint64_t v25 = v15;
  id v26 = *(id *)(a1 + 96);
  id v16 = *(id *)(a1 + 104);
  uint64_t v17 = *(void *)(a1 + 112);
  id v27 = v16;
  uint64_t v31 = v17;
  id v18 = *(id *)(a1 + 80);
  id v29 = v6;
  id v30 = v7;
  id v28 = v18;
  id v19 = v6;
  id v20 = v7;
  [v22 ingestProvisioningPassData:v21 cloudStoreCoordinatorDelegate:v10 moreInfoURLs:v11 ingestionProperties:v12 sid:v13 completion:v23];
  if (v8 == v9) {
}
  }

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a6;
  if (*(unsigned char *)(a1 + 96))
  {
    [*(id *)(a1 + 32) setExpressModeSetupOptional:a3];
    [*(id *)(a1 + 32) setExpressEnabled:a4];
    [*(id *)(a1 + 32) setAmpEnrollmentAvailable:a5];
  }
  uint64_t v13 = [*(id *)(a1 + 40) secureElementPass];

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 48), "pk_safelyAddObjectsFromArray:", v11);
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a6);
    goto LABEL_7;
  }
  if (v12) {
    goto LABEL_6;
  }
  id v14 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 64);
    id v16 = [*(id *)(a1 + 40) passURL];
    int v20 = 138412546;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    id v23 = v16;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "[%@] Error: No secure element pass found for %@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:0 userInfo:0];
  uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

LABEL_7:
  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80), *(void *)(a1 + 72), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0);
}

void __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_128(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [*(id *)(a1 + 32) idmsContactInformation];
  if (v7)
  {
    id v8 = +[PKPaymentOptionsRecents defaultInstance];
    [v8 updateRecentsAndKeychainWithContactInformation:v7];
  }
  v6[2](v6, v9, 0);
}

uint64_t __132__PKProvisioningUtility__downloadAndIngestPassesFoPasses_response_cloudStoreCoordinatorDelegate_ingestionProperties_sid_completion___block_invoke_2_130(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)[*(id *)(a1 + 32) copy];
    [v2 setProvisionedPasses:v3];
  }
  id v4 = *(void **)(a1 + 40);
  BOOL v5 = (void *)[*(id *)(a1 + 48) copy];
  [v4 setMoreInfoItems:v5];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v6();
}

- (void)ingestProvisioningPassData:(id)a3 cloudStoreCoordinatorDelegate:(id)a4 moreInfoURLs:(id)a5 ingestionProperties:(id)a6 sid:(id)a7 completion:(id)a8
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v54 = a5;
  id v55 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v14 description];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "[%@] Adding pass data (%@)...", buf, 0x16u);
  }
  int v20 = [v14 secureElementPass];
  uint64_t v21 = self->_destinationWebService;
  __int16 v22 = [(PKPaymentWebService *)v21 targetDevice];
  id v23 = [v22 secureElementIdentifiers];
  uint64_t v24 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v53 = v17;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v134 = __Block_byref_object_copy__41;
  v135 = __Block_byref_object_dispose__41;
  id v136 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__41;
  v131[4] = __Block_byref_object_dispose__41;
  id v132 = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x3032000000;
  v129[3] = __Block_byref_object_copy__41;
  v129[4] = __Block_byref_object_dispose__41;
  id v130 = 0;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3032000000;
  v127[3] = __Block_byref_object_copy__41;
  v127[4] = __Block_byref_object_dispose__41;
  id v128 = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x3032000000;
  v125[3] = __Block_byref_object_copy__41;
  v125[4] = __Block_byref_object_dispose__41;
  id v126 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x2020000000;
  char v124 = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  char v122 = 0;
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke;
  v115[3] = &unk_1E56E9290;
  id v50 = v15;
  id v116 = v50;
  id v25 = v23;
  id v117 = v25;
  id v26 = v20;
  id v118 = v26;
  id v27 = v16;
  id v119 = v27;
  v120 = buf;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v115];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_133;
  v109[3] = &unk_1E56E9290;
  id v28 = v26;
  id v110 = v28;
  id v51 = v25;
  id v111 = v51;
  id v29 = v22;
  id v112 = v29;
  id v30 = v27;
  id v113 = v30;
  v114 = buf;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v109];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_138;
  v102[3] = &unk_1E56EBD70;
  v107 = v129;
  id v52 = v28;
  id v103 = v52;
  id v31 = v29;
  id v104 = v31;
  BOOL v32 = v21;
  v105 = v32;
  id v56 = v55;
  id v106 = v56;
  v108 = v131;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v102];
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_6;
  v98[3] = &unk_1E56E9BA8;
  v100 = v131;
  id v33 = v30;
  id v99 = v33;
  v101 = v129;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v98];
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x2020000000;
  char v97 = 0;
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_144;
  v89[3] = &unk_1E56EBD70;
  long long v94 = v131;
  uint64_t v95 = v96;
  id v34 = v14;
  id v90 = v34;
  id v35 = v33;
  id v91 = v35;
  id v36 = v31;
  id v92 = v36;
  id v37 = v32;
  char v93 = v37;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v89];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_148;
  v77[3] = &unk_1E56EBE10;
  id v83 = v96;
  id v38 = v35;
  id v78 = v38;
  v84 = v129;
  id v39 = v36;
  id v79 = v39;
  v85 = v131;
  id v40 = v34;
  id v80 = v40;
  id v86 = v123;
  id v41 = v37;
  id v81 = v41;
  v82 = self;
  id v87 = v127;
  id v88 = v125;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v77];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_160;
  v71[3] = &unk_1E56EBE38;
  id v75 = v127;
  id v76 = v125;
  id v74 = v131;
  v71[4] = self;
  id v42 = v54;
  id v72 = v42;
  id v43 = v38;
  id v73 = v43;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v71];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3_172;
  v67[3] = &unk_1E56EBE88;
  v69 = v131;
  id v70 = v121;
  id v44 = v43;
  id v68 = v44;
  [(PKAsyncUnaryOperationComposer *)v24 addOperation:v67];
  uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_176;
  v57[3] = &unk_1E56EBEB0;
  long long v61 = buf;
  id v46 = v53;
  id v60 = v46;
  id v47 = v40;
  id v58 = v47;
  long long v62 = v131;
  id v48 = v52;
  id v59 = v48;
  long long v63 = v125;
  id v64 = v123;
  id v65 = v127;
  v66 = v121;
  id v49 = [(PKAsyncUnaryOperationComposer *)v24 evaluateWithInput:v45 completion:v57];

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v123, 8);
  _Block_object_dispose(v125, 8);

  _Block_object_dispose(v127, 8);
  _Block_object_dispose(v129, 8);

  _Block_object_dispose(v131, 8);
  _Block_object_dispose(buf, 8);
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PKDownloadRemoteAssetConfiguration configurationWithCloudStoreDelegate:*(void *)(a1 + 32) seids:*(void *)(a1 + 40)];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2;
  v14[3] = &unk_1E56EBCD0;
  id v9 = *(void **)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  id v17 = v7;
  uint64_t v18 = v11;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  [v9 downloadRemoteAssetsWithConfiguration:v8 completion:v14];
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2(void *a1, int a2, void *a3, float a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a2)
  {
    id v9 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      int v11 = 138413058;
      uint64_t v12 = v10;
      __int16 v13 = 1024;
      int v14 = 1;
      __int16 v15 = 2048;
      double v16 = a4;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Download of remote assets after /enable called completion handler with finished=%i progress=%f error=%@", (uint8_t *)&v11, 0x26u);
    }

    if (v8) {
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_133(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) iso18013BlobsForSecureElementIdentifiers:*(void *)(a1 + 40)];
  if ([v8 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = v10;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to save iso blobs before saving pass", buf, 0xCu);
    }

    int v11 = *(void **)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 32) cardType];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_136;
    v13[3] = &unk_1E56D9488;
    uint64_t v16 = *(void *)(a1 + 64);
    id v15 = v7;
    id v14 = v6;
    [v11 addISO18013Blobs:v8 cardType:v12 completion:v13];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_136(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v3;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v7 = [v5 errorWithDomain:@"PKAddSecureElementPassErrorDomain" code:3 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_138(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) uniqueID];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  char v11 = objc_opt_respondsToSelector();
  uint64_t v12 = *(void **)(a1 + 40);
  if (v11)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 32) paymentPass];
    uint64_t v15 = *(void *)(a1 + 56);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3;
    v28[3] = &unk_1E56EBCF8;
    v30[1] = *(void *)(a1 + 72);
    uint64_t v16 = (id *)v30;
    v30[0] = v7;
    __int16 v17 = &v29;
    id v29 = v6;
    [v12 paymentWebService:v13 addSecureElementPass:v14 properties:v15 completion:v28];
  }
  else
  {
    char v18 = objc_opt_respondsToSelector();
    int v20 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 32) paymentPass];
    if (v18)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4;
      v25[3] = &unk_1E56EBCF8;
      v27[1] = *(void *)(a1 + 72);
      uint64_t v16 = (id *)v27;
      v27[0] = v7;
      __int16 v17 = &v26;
      id v26 = v6;
      [v20 paymentWebService:v19 addPaymentPass:v14 withCompletionHandlerV2:v25];
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_5;
      v21[3] = &unk_1E56EBD20;
      v24[1] = *(void *)(a1 + 72);
      uint64_t v16 = &v22;
      id v22 = *(id *)(a1 + 32);
      __int16 v17 = (id *)v24;
      v24[0] = v7;
      id v23 = v6;
      [v20 paymentWebService:v19 addPaymentPass:v14 withCompletionHandler:v21];

      id v14 = v23;
    }
  }
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_6(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(*(void *)(a1[5] + 8) + 40) devicePrimaryPaymentApplication];

  if (!v8)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Warning: Newly added pass with identifier: %@ has no devicePrimaryPaymentApplication. Here be dragons!", (uint8_t *)&v12, 0x16u);
    }
  }
  v7[2](v7, v6, 0);
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_144(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isCarKeyPass])
  {
    uint64_t v8 = [*(id *)(a1 + 32) deviceCredential];
    if (!v8)
    {
      v7[2](v7, v6, 0);
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) devicePrimaryPaymentApplication];
    uint64_t v10 = [v9 subcredentials];

    uint64_t v11 = [v10 count];
    if (v11 != 1)
    {
      uint64_t v19 = v11;
      int v20 = PKLogFacilityTypeGetObject(0x27uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v38 = v21;
        __int16 v39 = 2048;
        uint64_t v40 = v19;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "[%@] Skipping device credential merge due to constraint failure (serverCredentials count: %lu)", buf, 0x16u);
      }

      v7[2](v7, v6, 0);
      goto LABEL_27;
    }
    int v12 = [v10 anyObject];
    uint64_t v13 = [v8 identifier];
    __int16 v14 = [v12 identifier];
    id v15 = v13;
    id v16 = v14;
    if (v15 == v16)
    {
    }
    else
    {
      __int16 v17 = v16;
      if (!v15 || !v16)
      {

        goto LABEL_20;
      }
      char v18 = [v15 isEqualToString:v16];

      if ((v18 & 1) == 0)
      {
LABEL_20:
        id v27 = PKLogFacilityTypeGetObject(0x27uLL);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *(void *)(a1 + 40);
          id v29 = [v8 identifier];
          id v30 = [v12 identifier];
          *(_DWORD *)long long buf = 138412802;
          uint64_t v38 = v28;
          __int16 v39 = 2112;
          uint64_t v40 = (uint64_t)v29;
          __int16 v41 = 2112;
          id v42 = v30;
          _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "[%@] Skipping device credential merge due to constraint failure (device credential identifier %@ does not match with identifier on pass %@)", buf, 0x20u);

LABEL_24:
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      PKAppletSubcredentialMergeDeviceCredential(v12, v8);
      id v22 = PKLogFacilityTypeGetObject(0x27uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v38 = v23;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v12;
        __int16 v41 = 2112;
        id v42 = v8;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Inflated credential %@ from %@", buf, 0x20u);
      }

      uint64_t v24 = *(void **)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_147;
      v32[3] = &unk_1E56EBD48;
      id v33 = *(id *)(a1 + 40);
      long long v36 = *(_OWORD *)(a1 + 64);
      id v35 = v7;
      id v34 = v6;
      [v24 paymentWebService:v25 updateMetadataOnPass:v26 withCredential:v12 completion:v32];

      goto LABEL_26;
    }
    id v27 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 40);
      id v29 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uniqueID];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v38 = v31;
      __int16 v39 = 2112;
      uint64_t v40 = (uint64_t)v29;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "[%@] Unable to update credential metadata on pass: %@", buf, 0x16u);
      goto LABEL_24;
    }
LABEL_25:

    v7[2](v7, v6, 0);
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  v7[2](v7, v6, 0);
LABEL_29:
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_147(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  BOOL v5 = PKLogFacilityTypeGetObject(0x27uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = [v4 uniqueID];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      __int16 v14 = v8;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Updated credential metadata on pass: %@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = [*(id *)(*(void *)(a1[7] + 8) + 40) uniqueID];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Failed to update credential metadata on pass: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_148(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (PKTargetDeviceSupportsExpress(*(void **)(a1 + 40)))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_149;
      aBlock[3] = &unk_1E56EBDC0;
      uint64_t v63 = *(void *)(a1 + 88);
      id v57 = *(id *)(a1 + 40);
      id v58 = *(id *)(a1 + 32);
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 96);
      id v59 = v10;
      uint64_t v64 = v11;
      id v12 = *(id *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 104);
      id v60 = v12;
      uint64_t v65 = v13;
      id v14 = v9;
      id v62 = v14;
      id v47 = v8;
      id v61 = v47;
      id v48 = (void (**)(void))_Block_copy(aBlock);
      unsigned int v15 = [*(id *)(a1 + 48) willProvisionWithAuthenticationDisabled];
      id v16 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) devicePrimaryContactlessPaymentApplication];
      uint64_t v17 = [v16 paymentNetworkIdentifier];

      int v18 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) hasAssociatedPeerPaymentAccount];
      uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) devicePaymentApplications];
      unsigned int v20 = objc_msgSend(v19, "pk_hasObjectPassingTest:", &__block_literal_global_130);

      uint64_t v21 = PKLogFacilityTypeGetObject(0x27uLL);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v15 && v20)
      {
        if (v22)
        {
          uint64_t v23 = *(void *)(a1 + 32);
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v67 = v23;
          __int16 v68 = 2112;
          uint64_t v69 = v24;
          _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to set pass %@ as express", buf, 0x16u);
        }

        uint64_t v25 = v48;
        v48[2](v48);
        goto LABEL_29;
      }
      if ((unint64_t)(v17 - 1) > 0x62)
      {
        if (v22)
        {
          uint64_t v36 = *(void *)(a1 + 32);
          uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          *(_DWORD *)long long buf = 138413058;
          uint64_t v67 = v36;
          __int16 v68 = 2112;
          uint64_t v69 = v37;
          __int16 v70 = 2048;
          uint64_t v71 = v15;
          __int16 v72 = 2048;
          uint64_t v73 = v20;
          id v35 = "[%@] Unable to attempt to set pass %@ as express (applet provisioned as express: %ld, pass supports express %ld)";
          uint64_t v38 = v21;
          uint32_t v39 = 42;
LABEL_27:
          _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, v35, buf, v39);
        }
      }
      else
      {
        if (v22)
        {
          uint64_t v32 = *(void *)(a1 + 32);
          uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v67 = v32;
          __int16 v68 = 2112;
          uint64_t v69 = v33;
          _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "[%@] Checking if open loop pass %@ is in supported market", buf, 0x16u);
        }

        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138412290;
            uint64_t v67 = v34;
            id v35 = "[%@] PKPaymentProvisioningController: Peer payment pass does not support automatic express enablement";
LABEL_26:
            uint64_t v38 = v21;
            uint32_t v39 = 12;
            goto LABEL_27;
          }
        }
        else
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 24));

          if (WeakRetained)
          {
            id v41 = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 24));
            uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_158;
            v49[3] = &unk_1E56EBDE8;
            id v43 = *(id *)(a1 + 32);
            uint64_t v44 = *(void *)(a1 + 80);
            id v50 = v43;
            uint64_t v45 = *(void *)(a1 + 112);
            uint64_t v54 = v44;
            uint64_t v55 = v45;
            uint64_t v25 = v48;
            id v52 = v48;
            id v53 = v14;
            id v51 = v47;
            [v41 verifyPassIsSupportedForExpressInLocalMarket:v42 completion:v49];

LABEL_29:
            goto LABEL_30;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138412290;
            uint64_t v67 = v46;
            id v35 = "[%@] PKPaymentProvisioningController: nil dataProvider, cannot verify support for automatic express enablement";
            goto LABEL_26;
          }
        }
      }

      (*((void (**)(id, id, void))v14 + 2))(v14, v47, 0);
      uint64_t v25 = v48;
      goto LABEL_29;
    }
    uint64_t v26 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v31 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v67 = v30;
      __int16 v68 = 2112;
      uint64_t v69 = v31;
      id v29 = "[%@] Skipping express ingestion logic. Target device (%@) does not support express";
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v26 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v67 = v27;
      __int16 v68 = 2112;
      uint64_t v69 = v28;
      id v29 = "[%@] Unable to attempt to set pass %@ as express (precondition not satisfied)";
LABEL_12:
      _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    }
  }

  (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
LABEL_30:
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_149(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  char v2 = PKGymKitConflictsWithPass(*(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void **)(a1 + 32));
  id v3 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    BOOL v5 = [*(id *)(a1 + 48) description];
    int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v5;
    __int16 v28 = 1024;
    int v29 = v6;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Pass data:%@ has optional express mode:%d", buf, 0x1Cu);
  }
  id v7 = *(void **)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) paymentPass];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_150;
    v20[3] = &unk_1E56E9268;
    uint64_t v23 = *(void *)(a1 + 96);
    id v22 = *(id *)(a1 + 72);
    id v21 = *(id *)(a1 + 64);
    [v7 paymentWebService:v12 handlePotentialExpressPass:v13 withCompletionHandler:v20];

    uint64_t v11 = v22;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) paymentPass];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_154;
    v16[3] = &unk_1E56EBD98;
    uint64_t v19 = *(void *)(a1 + 88);
    id v18 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 64);
    [v8 paymentWebService:v9 canHandlePotentialExpressPass:v10 withCompletionHandler:v16];

    uint64_t v11 = v18;
LABEL_7:

    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Ignoring express setup - Missing paymentWebService:canHandlePotentialExpressPass:withCompletionHandler: from target device:%@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_154(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2 != 0;
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], 0);
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_156(uint64_t a1, void *a2)
{
  return [a2 supportsExpress];
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_158(void *a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PKLogFacilityTypeGetObject(0x27uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Attempting to set open loop pass %@ as express", (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(*(void *)(a1[9] + 8) + 40) safelyAddObject:v5];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = a1[4];
      uint64_t v11 = *(void *)(*(void *)(a1[8] + 8) + 40);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Open loop pass %@ is not in supported market, skipping attempt to set pass as express", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_160(void *a1, uint64_t a2, void *a3, void *a4)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(*(void *)(a1[7] + 8) + 40) serialNumber];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_1EE0F5368;
  }
  uint64_t v11 = v10;

  if ((*(void *)(*(void *)(a1[8] + 8) + 40)
     || ([*(id *)(*(void *)(a1[9] + 8) + 40) removeAllObjects],
         *(void *)(*(void *)(a1[8] + 8) + 40)))
    && ![*(id *)(*(void *)(a1[9] + 8) + 40) count])
  {
    uint64_t v13 = [*(id *)(*(void *)(a1[8] + 8) + 40) allObjects];
    uint64_t v14 = [v13 componentsJoinedByString:@","];
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    else {
      uint64_t v16 = &stru_1EE0F5368;
    }
    id v17 = v16;

    v30[0] = @"automaticExpressModes";
    v30[1] = @"passSerialNumber";
    v31[0] = v17;
    v31[1] = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  }
  else
  {
    __int16 v28 = @"passSerialNumber";
    int v29 = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  }
  id v18 = (void *)a1[4];
  uint64_t v19 = a1[5];
  uint64_t v20 = a1[6];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_170;
  v24[3] = &unk_1E56E99F0;
  uint64_t v21 = a1[9];
  id v26 = v7;
  uint64_t v27 = v21;
  id v25 = v6;
  id v22 = v6;
  id v23 = v7;
  [v18 downloadMoreInfoItemsFrom:v19 metadata:v12 sid:v20 completion:v24];
}

uint64_t __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_2_170(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_3_172(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PKAMPEnrollmentManager sharedManager];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) paymentPass];
  char v10 = [v8 shouldOfferAMPEnrollmentForPaymentPass:v9];

  if (v10)
  {
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) paymentPass];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4_174;
    v12[3] = &unk_1E56EBE60;
    long long v16 = *(_OWORD *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    id v15 = v7;
    id v14 = v6;
    [v8 enrollmentStatusForPaymentPass:v11 completion:v12 progress:0];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_4_174(void *a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1[7] + 8) + 40) devicePrimaryBarcodePaymentApplication];
  uint64_t v7 = [v6 paymentNetworkIdentifier];
  BOOL v10 = a2 == 1 && v7 == 123 && v5 == 0;
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v10;
  uint64_t v11 = PKLogFacilityTypeGetObject(0x27uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[4];
    int v13 = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 1024;
    int v17 = v13;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "[%@] AMP offer should be presented:%d (%@)", (uint8_t *)&v14, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __130__PKProvisioningUtility_ingestProvisioningPassData_cloudStoreCoordinatorDelegate_moreInfoURLs_ingestionProperties_sid_completion___block_invoke_176(void *a1)
{
  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    char v2 = *(void (**)(void))(a1[6] + 16);
    v2();
  }
  else
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = *(void *)(*(void *)(a1[8] + 8) + 40);
    if (!v4) {
      uint64_t v4 = a1[5];
    }
    [v3 setSecureElementPass:v4];
    uint64_t v5 = a1[6];
    uint64_t v6 = [*(id *)(*(void *)(a1[9] + 8) + 40) count];
    if (v6) {
      id v7 = (id)[*(id *)(*(void *)(a1[9] + 8) + 40) copy];
    }
    else {
      id v7 = 0;
    }
    (*(void (**)(uint64_t, id, void, BOOL, void, void))(v5 + 16))(v5, v7, *(unsigned __int8 *)(*(void *)(a1[10] + 8) + 24), [*(id *)(*(void *)(a1[11] + 8) + 40) count] != 0, *(unsigned __int8 *)(*(void *)(a1[12] + 8) + 24), 0);
    if (v6)
    {
    }
  }
}

- (void)downloadMoreInfoItemsFrom:(id)a3 metadata:(id)a4 sid:(id)a5 completion:(id)a6
{
  v59[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v41 = a5;
  id v37 = a6;
  queue = dispatch_queue_create("itemsQueue", 0);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (PKShowFakeMoreInfo())
  {
    uint64_t v11 = [PKPaymentSetupMoreInfoItem alloc];
    v58[0] = @"title";
    v58[1] = @"body";
    v59[0] = @"Fake Title 1";
    v59[1] = @"Fake Body";
    v58[2] = @"linkURL";
    v58[3] = @"linkText";
    v59[2] = @"wallet.apple.com";
    v59[3] = @"Fake Link 1";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:4];
    int v13 = [(PKPaymentSetupMoreInfoItem *)v11 initWithMoreInfoDictionary:v12];

    [v42 addObject:v13];
    int v14 = [PKPaymentSetupMoreInfoItem alloc];
    v56[0] = @"title";
    v56[1] = @"body";
    v57[0] = @"Fake Title 2";
    v57[1] = @"Fake Body";
    v56[2] = @"linkURL";
    v56[3] = @"linkText";
    v57[2] = @"wallet.apple.com";
    v57[3] = @"Fake Link 2";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
    __int16 v16 = [(PKPaymentSetupMoreInfoItem *)v14 initWithMoreInfoDictionary:v15];

    [v42 addObject:v16];
  }
  if (v10) {
    int v17 = v10;
  }
  else {
    int v17 = (void *)MEMORY[0x1E4F1CC08];
  }
  __int16 v18 = (void *)[v17 mutableCopy];
  int IsAvailable = PKPearlIsAvailable();
  uint64_t v20 = 2;
  if (IsAvailable) {
    uint64_t v20 = 3;
  }
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v20);
  [v18 setObject:v21 forKeyedSubscript:@"authType"];

  id v22 = [NSNumber numberWithDouble:PKScreenScale()];
  id v23 = [v22 description];
  [v18 setObject:v23 forKeyedSubscript:@"screenScale"];

  uint64_t v24 = PKOSVersion();
  [v18 setObject:v24 forKeyedSubscript:@"osVersion"];

  id v25 = PKDeviceClass();
  [v18 setObject:v25 forKeyedSubscript:@"deviceClass"];

  uint64_t v36 = v18;
  id v26 = (void *)[v18 copy];

  uint64_t v27 = dispatch_group_create();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v9;
  uint64_t v28 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v52;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v51 + 1) + 8 * v31);
        dispatch_group_enter(v27);
        destinationWebService = self->_destinationWebService;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke;
        v46[3] = &unk_1E56EBED8;
        id v47 = queue;
        id v48 = v42;
        id v49 = v27;
        id v50 = v41;
        [(PKPaymentWebService *)destinationWebService moreInfoItemAtURL:v32 withMetadata:v26 completion:v46];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v29);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_220;
  block[3] = &unk_1E56D83D8;
  id v44 = v42;
  id v45 = v37;
  id v34 = v42;
  id v35 = v37;
  dispatch_group_notify(v27, queue, block);
}

void __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_2;
    v11[3] = &unk_1E56D8AB8;
    id v7 = *(NSObject **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v5;
    id v14 = *(id *)(a1 + 48);
    uint64_t v8 = v11;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __dispatch_async_ar_block_invoke_11;
    __int16 v16 = &unk_1E56D8360;
    id v17 = v8;
    dispatch_async(v7, block);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)block = 138412546;
      *(void *)&void block[4] = v10;
      *(_WORD *)&block[12] = 2112;
      *(void *)&block[14] = v6;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Failed to download more info url with error: %@", block, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  char v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

uint64_t __75__PKProvisioningUtility_downloadMoreInfoItemsFrom_metadata_sid_completion___block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)nonceWithSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    destinationWebService = self->_destinationWebService;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PKProvisioningUtility_nonceWithSID_completion___block_invoke;
    v10[3] = &unk_1E56EBF00;
    id v12 = v7;
    id v11 = v6;
    [(PKPaymentWebService *)destinationWebService paymentProvisioningNonceOfType:0 completion:v10];
  }
}

void __49__PKProvisioningUtility_nonceWithSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 nonce];
  id v7 = (void *)v6;
  if (v5 || !v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "[%@] [PKProvisioningUtility nonceWithCompletion]: failed with error: %@.", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (PKProvisioningUtilityDataHelper)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (PKProvisioningUtilityDataHelper *)WeakRetained;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_managingWebService, 0);
  objc_storeStrong((id *)&self->_destinationWebService, 0);
}

@end