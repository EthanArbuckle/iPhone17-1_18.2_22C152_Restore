@interface PKOrderPhysicalCardController
- (CNPostalAddress)shippingAddress;
- (NSArray)artworkOptions;
- (NSString)nameOnCard;
- (PKOrderPhysicalCardController)initWithAccountService:(id)a3 paymentWebService:(id)a4 paymentPass:(id)a5 account:(id)a6 accountUser:(id)a7 orderReason:(unint64_t)a8 context:(int64_t)a9 currentPhysicalCard:(id)a10;
- (PKPaymentPass)paymentPass;
- (PKPhysicalCardArtworkOption)selectedArtworkOption;
- (PKSetupFlowControllerProtocol)parentFlowController;
- (id)_paymentRequest;
- (id)_priceForRequestingPhysicalCard;
- (int64_t)paymentSetupContext;
- (unint64_t)featureIdentifier;
- (void)completeOrderPhysicalCardWithApplePayTrustSignature:(id)a3 completion:(id)a4;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)setArtworkOptions:(id)a3;
- (void)setNameOnCard:(id)a3;
- (void)setParentFlowController:(id)a3;
- (void)setSelectedArtworkOption:(id)a3;
- (void)setShippingAddress:(id)a3;
- (void)startOrderPhysicalCardWithCompletion:(id)a3;
- (void)updateCustomizationOptionsWithCompletion:(id)a3;
@end

@implementation PKOrderPhysicalCardController

- (PKOrderPhysicalCardController)initWithAccountService:(id)a3 paymentWebService:(id)a4 paymentPass:(id)a5 account:(id)a6 accountUser:(id)a7 orderReason:(unint64_t)a8 context:(int64_t)a9 currentPhysicalCard:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)PKOrderPhysicalCardController;
  v19 = [(PKOrderPhysicalCardController *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accountService, a3);
    objc_storeStrong((id *)&v20->_paymentWebService, a4);
    objc_storeStrong((id *)&v20->_paymentPass, a5);
    objc_storeStrong((id *)&v20->_account, a6);
    objc_storeStrong((id *)&v20->_accountUser, a7);
    v20->_orderReason = a8;
    v20->_featureIdentifier = [(PKAccount *)v20->_account feature];
    v20->_paymentSetupContext = a9;
    objc_storeStrong((id *)&v20->_physicalCardToReplace, a10);
  }

  return v20;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  parentFlowController = self->_parentFlowController;
  if (parentFlowController)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__PKOrderPhysicalCardController_nextViewControllerWithCompletion___block_invoke;
    v7[3] = &unk_1E59D5740;
    v7[4] = self;
    id v8 = v4;
    [(PKSetupFlowControllerProtocol *)parentFlowController nextViewControllerWithCompletion:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __66__PKOrderPhysicalCardController_nextViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
}

- (void)updateCustomizationOptionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Updating physical card customization options...", buf, 2u);
  }

  v6 = dispatch_group_create();
  *(void *)buf = 0;
  v37 = buf;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__27;
  v40 = __Block_byref_object_dispose__27;
  id v41 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F84388]);
  id v8 = [(PKAccount *)self->_account accountIdentifier];
  [v7 setAccountIdentifier:v8];

  v9 = [(PKAccount *)self->_account accountBaseURL];
  [v7 setBaseURL:v9];

  v10 = [(PKAccountUser *)self->_accountUser altDSID];
  [v7 setAccountUserAltDSID:v10];

  dispatch_group_enter(v6);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  paymentWebService = self->_paymentWebService;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke;
  v30[3] = &unk_1E59D5790;
  v32 = v34;
  v30[4] = self;
  v33 = buf;
  v12 = v6;
  v31 = v12;
  [(PKPaymentWebService *)paymentWebService customizePhysicalCardWithRequest:v7 completion:v30];
  id v13 = objc_alloc_init(MEMORY[0x1E4F842D8]);
  v14 = [(PKAccount *)self->_account accountIdentifier];
  [v13 setAccountIdentifier:v14];

  v15 = [(PKAccount *)self->_account accountBaseURL];
  [v13 setBaseURL:v15];

  dispatch_group_enter(v12);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  id v16 = self->_paymentWebService;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_20;
  v24[3] = &unk_1E59D57B8;
  v24[4] = self;
  objc_super v26 = v28;
  v27 = buf;
  id v17 = v12;
  id v25 = v17;
  [(PKPaymentWebService *)v16 accountUserInfoWithRequest:v13 completion:v24];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_23;
  block[3] = &unk_1E59D57E0;
  v21 = v34;
  v22 = v28;
  id v23 = buf;
  block[4] = self;
  id v20 = v4;
  id v18 = v4;
  dispatch_group_notify(v17, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(buf, 8);
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D5768;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v17 = v7;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v16 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    LOBYTE(v2) = *(void *)(a1 + 40) == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v3 = [*(id *)(a1 + 32) priceOptions];
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    id v6 = [*(id *)(a1 + 32) nameOptions];
    uint64_t v7 = [v6 firstObject];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(void **)(v8 + 104);
    *(void *)(v8 + 104) = v7;

    uint64_t v10 = [*(id *)(a1 + 32) artworkOptions];
    uint64_t v11 = *(void *)(a1 + 48);
    v12 = *(void **)(v11 + 112);
    *(void *)(v11 + 112) = v10;

    uint64_t v13 = [*(id *)(*(void *)(a1 + 48) + 112) firstObject];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void **)(v14 + 120);
    *(void *)(v14 + 120) = v13;
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    id v17 = *(id *)(a1 + 40);
    uint64_t v15 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }

  id v18 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    uint64_t v20 = *(void *)(a1 + 40);
    int v21 = 138543618;
    v22 = v19;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Updated physical card customization options %{public}@, error: %@", (uint8_t *)&v21, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2_21;
  block[3] = &unk_1E59D5768;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v17 = v7;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v16 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_2_21(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    LOBYTE(v2) = *(void *)(a1 + 40) == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v3 = [*(id *)(a1 + 32) primaryUser];
    uint64_t v4 = [v3 postalAddresses];
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 value];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(v7 + 128);
    *(void *)(v7 + 128) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(id *)(a1 + 40);
    uint64_t v3 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  long long v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Updated physical card customization options %{public}@, error: %@", (uint8_t *)&v14, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __74__PKOrderPhysicalCardController_updateCustomizationOptionsWithCompletion___block_invoke_23(void *a1)
{
  if (a1[5])
  {
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(*(void *)(a1[8] + 8) + 40), [*(id *)(a1[4] + 24) feature], 0, 0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)startOrderPhysicalCardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Starting physical card order...", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59D58A8;
  aBlock[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    paymentWebService = self->_paymentWebService;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_5;
    v10[3] = &unk_1E59D58D0;
    id v11 = v7;
    [v8 paymentWebService:paymentWebService deviceMetadataWithFields:251 completion:v10];
  }
  else
  {
    (*((void (**)(void *, void))v7 + 2))(v7, 0);
  }
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E59D5808;
  id v4 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v27 = v4;
  id v5 = a2;
  id v6 = _Block_copy(aBlock);
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F84E58]) initWithActionType:5];
    [v7 setReason:*(void *)(*(void *)(a1 + 32) + 40)];
    [v7 setNameOnCard:*(void *)(*(void *)(a1 + 32) + 104)];
    id v8 = [*(id *)(a1 + 32) _priceForRequestingPhysicalCard];
    [v7 setPriceOption:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 8);
    id v11 = [*(id *)(v9 + 48) identifier];
    v12 = [*(id *)(*(void *)(a1 + 32) + 24) accountIdentifier];
    uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 32) altDSID];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_27;
    v24[3] = &unk_1E59D5858;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = &v25;
    v24[4] = v14;
    uint64_t v25 = v6;
    id v16 = v6;
    [v10 beginPhysicalCardAction:v7 onPhysicalCardWithIdentifier:v11 forAccountWithIdentifier:v12 accountUserAltDSID:v13 deviceMetadata:v5 completion:v24];

    id v5 = (id)v13;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F84E60]);
    [v7 setReason:*(void *)(*(void *)(a1 + 32) + 40)];
    [v7 setNameOnCard:*(void *)(*(void *)(a1 + 32) + 104)];
    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 120) identifier];
    [v7 setArtworkIdentifier:v17];

    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(void **)(v18 + 8);
    id v11 = [*(id *)(v18 + 24) accountIdentifier];
    v12 = [*(id *)(*(void *)(a1 + 32) + 32) altDSID];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_3;
    v22[3] = &unk_1E59D5880;
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v15 = &v23;
    v22[4] = v20;
    __int16 v23 = v6;
    id v21 = v6;
    [v19 beginPhysicalCardRequestWithOrder:v7 forAccountWithIdentifier:v11 accountUserAltDSID:v12 deviceMetadata:v5 completion:v22];
  }
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v9)
  {
    uint64_t v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      v19 = @"YES";
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Received Apple Pay Trust signature request %{public}@, error: %@", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v14 = [*(id *)(a1 + 32) _paymentRequest];
    [v14 setApplePayTrustSignatureRequest:v9];
    uint64_t v15 = *(void *)(a1 + 40);
    if (!v15) {
      goto LABEL_7;
    }
    id v16 = *(void (**)(void))(v15 + 16);
LABEL_6:
    v16();
LABEL_7:

    goto LABEL_8;
  }
  if (!v10)
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_8;
    }
    uint64_t v14 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v12, [*(id *)(*(void *)(a1 + 32) + 24) feature], 0, 0);
    id v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a4);
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void, id, void))(v17 + 16))(v17, 0, v10, 0);
  }
LABEL_8:
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2_28;
  block[3] = &unk_1E59D5830;
  id v23 = v11;
  id v24 = v15;
  id v16 = *(void **)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  id v26 = v12;
  id v28 = v14;
  id v29 = v16;
  id v27 = v13;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  id v21 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_2_28(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 72), *(id *)(a1 + 56));
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    goto LABEL_18;
  }
  if ([*(id *)(a1 + 64) count]) {
    BOOL v2 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_18:
    v3();
    return;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 64);
  id v5 = (id)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", (void)v9) == 1)
        {
          id v5 = v8;
          goto LABEL_22;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_4;
  block[3] = &unk_1E59D5830;
  id v23 = v11;
  id v24 = v15;
  id v16 = *(void **)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  id v26 = v12;
  id v28 = v14;
  id v29 = v16;
  id v27 = v13;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  id v21 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 80);
LABEL_8:
      uint64_t v6 = *(uint64_t (**)(void))(v3 + 16);
      goto LABEL_11;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 64), *(id *)(a1 + 56));
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 80);
    if (v4) {
      BOOL v5 = v2 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (!v5) {
      goto LABEL_8;
    }
    uint64_t v6 = *(uint64_t (**)(void))(v3 + 16);
  }
LABEL_11:

  return v6();
}

void __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_6;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __70__PKOrderPhysicalCardController_startOrderPhysicalCardWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)completeOrderPhysicalCardWithApplePayTrustSignature:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Completing physical card order...", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke;
  aBlock[3] = &unk_1E59D58F8;
  aBlock[4] = self;
  id v9 = v7;
  id v18 = v9;
  long long v10 = _Block_copy(aBlock);
  id v11 = v10;
  physicalCardRequest = self->_physicalCardRequest;
  if (physicalCardRequest)
  {
    [(PKAccountService *)self->_accountService completePhysicalCardRequest:physicalCardRequest withSignature:v6 completion:v10];
  }
  else
  {
    replacePhysicalCardRequest = self->_replacePhysicalCardRequest;
    if (replacePhysicalCardRequest)
    {
      accountService = self->_accountService;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_36;
      v15[3] = &unk_1E59D5920;
      id v16 = v10;
      [(PKAccountService *)accountService completePhysicalCardActionRequest:replacePhysicalCardRequest withSignature:v6 completion:v15];
    }
  }
}

void __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_2;
  block[3] = &unk_1E59CF3E0;
  id v15 = v7;
  id v16 = v9;
  long long v10 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = v8;
  id v19 = v10;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    if (!v2)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 24), *(id *)(a1 + 56));
      goto LABEL_6;
    }
  }
  else if (!v2)
  {
    goto LABEL_6;
  }
  uint64_t v2 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v2, [*(id *)(*(void *)(a1 + 48) + 24) feature], 0, 0);
LABEL_6:
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"YES";
    uint64_t v5 = *(void *)(a1 + 40);
    if (!*(void *)(a1 + 32)) {
      id v4 = @"NO";
    }
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Completed physical card order %{public}@, error: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, *(void *)(a1 + 32), v2);
  }
}

void __96__PKOrderPhysicalCardController_completeOrderPhysicalCardWithApplePayTrustSignature_completion___block_invoke_36(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v7;
    id v11 = (id)[v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "state", (void)v15) == 1)
          {
            id v11 = v14;
            goto LABEL_12;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_paymentRequest
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F84BE8]);
  [v3 setRequestType:4];
  [v3 setClientCallbackTimeout:65.0];
  [v3 setConfirmationStyle:1];
  id v4 = PKLocalizedFeatureString();
  [v3 setLocalizedErrorMessage:v4];

  uint64_t v5 = PKLocalizedFeatureString();
  [v3 setLocalizedAuthorizingTitle:v5];

  uint64_t v6 = [(PKOrderPhysicalCardController *)self _priceForRequestingPhysicalCard];
  id v7 = [v6 amount];

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28C28] zero];
    id v9 = [(PKAccount *)self->_account creditDetails];
    id v10 = [v9 currencyCode];
    id v7 = PKCurrencyAmountCreate(v8, v10);
  }
  id v11 = [v7 currency];
  [v3 setCurrencyCode:v11];

  uint64_t v12 = [v7 amount];
  id v13 = (void *)MEMORY[0x1E4F84CE0];
  id v14 = PKLocalizedFeatureString();
  long long v15 = [v13 summaryItemWithLabel:v14 amount:v12];

  v19[0] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v3 setPaymentSummaryItems:v16];

  long long v17 = [MEMORY[0x1E4F28C28] zero];
  LODWORD(v14) = [v12 isEqualToNumber:v17];

  if (v14) {
    [v3 setSuppressTotal:1];
  }

  return v3;
}

- (id)_priceForRequestingPhysicalCard
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_priceOptions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "reason", (void)v11) == self->_orderReason)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)paymentSetupContext
{
  return self->_paymentSetupContext;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
}

- (NSArray)artworkOptions
{
  return self->_artworkOptions;
}

- (void)setArtworkOptions:(id)a3
{
}

- (PKPhysicalCardArtworkOption)selectedArtworkOption
{
  return self->_selectedArtworkOption;
}

- (void)setSelectedArtworkOption:(id)a3
{
}

- (CNPostalAddress)shippingAddress
{
  return self->_shippingAddress;
}

- (void)setShippingAddress:(id)a3
{
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_selectedArtworkOption, 0);
  objc_storeStrong((id *)&self->_artworkOptions, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_replacePhysicalCardRequest, 0);
  objc_storeStrong((id *)&self->_physicalCardRequest, 0);
  objc_storeStrong((id *)&self->_priceOptions, 0);
  objc_storeStrong((id *)&self->_physicalCardToReplace, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end