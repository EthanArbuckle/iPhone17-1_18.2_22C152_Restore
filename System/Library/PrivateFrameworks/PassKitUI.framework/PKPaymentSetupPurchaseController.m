@interface PKPaymentSetupPurchaseController
- (BOOL)acceptedTerms;
- (PKPaymentSetupPurchaseController)initWithProvisioningController:(id)a3 context:(int64_t)a4 purchaseControllerDelegate:(id)a5 product:(id)a6 provisioningMetadata:(id)a7;
- (RemoteUIController)termsController;
- (id)paymentRequestForAmount:(id)a3;
- (id)paymentRequestForProduct:(id)a3 serviceProviderProduct:(id)a4 productItem:(id)a5;
- (void)presentAddCardAlert:(id)a3;
- (void)presentTermsAndConditionsWithCompletion:(id)a3;
- (void)presetPaymentRequest:(id)a3 forResultType:(int64_t)a4;
- (void)setAcceptedTerms:(BOOL)a3;
- (void)setTermsController:(id)a3;
@end

@implementation PKPaymentSetupPurchaseController

- (PKPaymentSetupPurchaseController)initWithProvisioningController:(id)a3 context:(int64_t)a4 purchaseControllerDelegate:(id)a5 product:(id)a6 provisioningMetadata:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentSetupPurchaseController;
  v17 = [(PKPaymentSetupPurchaseController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_product, a6);
    objc_storeStrong((id *)&v18->_provisioningController, a3);
    v18->_setupContext = a4;
    objc_storeStrong((id *)&v18->_purchaseControllerDelegate, a5);
    objc_storeStrong((id *)&v18->_provisioningMethodMetadata, a7);
  }

  return v18;
}

- (void)presentAddCardAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 merchantCapabilities] & 0xC;
  v6 = [v4 supportedNetworks];
  uint64_t v7 = [v6 count];
  v8 = PKLocalizedPaymentString(&cfstr_SetupPurchaseP.isa);
  v26 = PKLocalizedPaymentString(&cfstr_SetupPurchaseA_1.isa);
  if (v7 == 1)
  {
    v9 = @"SETUP_PURCHASE_ADD_SPECIFIC_CARD_ALERT_MESSAGE";
    if (v5 == 8)
    {
      v9 = @"SETUP_PURCHASE_ADD_SPECIFIC_DEBIT_CARD_ALERT_MESSAGE";
      v10 = @"SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_SPECIFIC_DEBIT_CARD_ACTION";
    }
    else
    {
      v10 = @"SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_SPECIFIC_CARD_ACTION";
    }
    v11 = v9;
    v12 = [v6 objectAtIndexedSubscript:0];
    PKPaymentCredentialTypeForPaymentNetworkName();

    id v13 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    id v14 = PKLocalizedPaymentString(v11, &stru_1EF1B4C70.isa, v13);

    id v15 = v10;
    id v16 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    v17 = PKLocalizedPaymentString(v15, &stru_1EF1B4C70.isa, v16);
  }
  else
  {
    if (v5 == 8)
    {
      id v14 = PKLocalizedPaymentString(&cfstr_SetupPurchaseA_6.isa);
      v18 = @"SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_DEBIT_CARD_ACTION";
    }
    else
    {
      id v14 = PKLocalizedPaymentString(&cfstr_SetupPurchaseA_7.isa);
      v18 = @"SETUP_PURCHASE_ADD_PAYMENT_METHOD_ADD_CARD_ACTION";
    }
    v17 = PKLocalizedPaymentString(&v18->isa);
  }
  v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v14 preferredStyle:1];
  if (self->_setupContext == 4)
  {
    objc_super v20 = [MEMORY[0x1E4FB1410] actionWithTitle:v17 style:0 handler:&__block_literal_global_208];
    [v19 addAction:v20];
  }
  else
  {
    v21 = [v4 supportedNetworks];
    v22 = (void *)MEMORY[0x1E4FB1410];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_2;
    v28[3] = &unk_1E59CB218;
    id v29 = v21;
    v30 = self;
    id v23 = v21;
    v24 = [v22 actionWithTitle:v17 style:0 handler:v28];
    [v19 addAction:v24];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_8;
  v27[3] = &unk_1E59CB1F0;
  v27[4] = self;
  v25 = [MEMORY[0x1E4FB1410] actionWithTitle:v26 style:1 handler:v27];
  [v19 addAction:v25];

  [(PKPaymentSetupPurchaseControllerDelegate *)self->_purchaseControllerDelegate presentViewController:v19 animated:1 completion:0];
}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke()
{
  id v2 = [NSString stringWithFormat:@"%@%@", @"shoebox://", *MEMORY[0x1E4F87F60]];
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v1 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  [v0 openURL:v1 configuration:0 completionHandler:0];
}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F84D50] sharedService];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v2];
  [v3 setAllowedPaymentNetworks:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 24) showSpinner:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_3;
  v6[3] = &unk_1E59CDC80;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v5 preflightWithCompletion:v6];
}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:8 provisioningController:*(void *)(a1 + 32) groupsController:0];
    id v7 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:8];
    [(PKPaymentSetupDismissibleNavigationController *)v7 useStandardPlatformPresentationStyle];
    objc_initWeak(&location, *(id *)(a1 + 40));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_4;
    v15[3] = &unk_1E59CA870;
    v15[4] = *(void *)(a1 + 40);
    uint64_t v8 = v7;
    id v16 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_6;
    v12[3] = &unk_1E59CB010;
    objc_copyWeak(&v14, &location);
    v9 = v8;
    id v13 = v9;
    +[PKProvisioningFlowBridge startProvisionToPurchaseFlowWithNavController:v9 context:v6 onFirstViewControllerShown:v15 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 24) showSpinner:0];
    if (v5)
    {
      id v10 = v5;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v10;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_7;
    v11[3] = &unk_1E59CA7D0;
    v11[4] = *(void *)(a1 + 40);
    PKAlertForDisplayableErrorWithHandlers(v10, 0, v11, 0);
    v9 = (PKPaymentSetupDismissibleNavigationController *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(a1 + 40) + 24) presentViewController:v9 animated:1 completion:0];
  }
}

uint64_t __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) showSpinner:0];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v3 presentViewController:v2 animated:1 completion:&__block_literal_global_103];
}

void __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_6(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[3] paymentSetupDidFinish:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

uint64_t __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_7(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return [v3 showKeyPad];
  }
  return result;
}

uint64_t __56__PKPaymentSetupPurchaseController_presentAddCardAlert___block_invoke_8(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return [v3 showKeyPad];
  }
  return result;
}

- (void)presetPaymentRequest:(id)a3 forResultType:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 2)
  {
    if (a4 == 9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke;
      v12[3] = &unk_1E59CA7D0;
      void v12[4] = self;
      id v7 = PKCreateAlertControllerForWalletUninstalled(v12);
      [(PKPaymentSetupPurchaseControllerDelegate *)self->_purchaseControllerDelegate presentViewController:v7 animated:1 completion:0];

      goto LABEL_7;
    }
    if (a4 != 5)
    {
      [(PKPaymentSetupPurchaseControllerDelegate *)self->_purchaseControllerDelegate showSpinner:1];
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke_2;
      v8[3] = &unk_1E59CBA18;
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      [(PKPaymentSetupPurchaseController *)self presentTermsAndConditionsWithCompletion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
  }
  [(PKPaymentSetupPurchaseController *)self presentAddCardAlert:v6];
LABEL_7:
}

uint64_t __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
    return [v3 showKeyPad];
  }
  return result;
}

void __71__PKPaymentSetupPurchaseController_presetPaymentRequest_forResultType___block_invoke_2(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained[3] showSpinner:0];
    WeakRetained = v6;
    if (a2)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:*(void *)(a1 + 32)];
      [v5 setDelegate:v6[3]];
      [v5 _setPrivateDelegate:v6[3]];
      [v5 presentWithCompletion:0];

      WeakRetained = v6;
    }
  }
}

- (id)paymentRequestForAmount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata depositType];
  id v6 = @"SETUP_PURCHASE_REFUNDABLE_SERVICE_FEE_ITEM_LABEL";
  if (v5 == 2) {
    id v6 = @"SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_ITEM_LABEL";
  }
  if (v5 == 1) {
    id v7 = @"SETUP_PURCHASE_REFUNDABLE_DEPOSIT_ITEM_LABEL";
  }
  else {
    id v7 = v6;
  }
  id v8 = v4;
  id v9 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata depositAmount];
  uint64_t v10 = (uint64_t)v8;
  if (v9)
  {
    v11 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v12 = [v11 compare:v9];

    uint64_t v10 = (uint64_t)v8;
    if (v12 == -1)
    {
      uint64_t v10 = [v8 decimalNumberByAdding:v9];
    }
  }
  id v13 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata digitalIssuanceMetadata];
  id v14 = objc_alloc_init(MEMORY[0x1E4F84838]);
  id v15 = [v13 action];
  [v14 setItemDescription:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v17 = [v13 serviceProviderDict];
  v18 = (void *)[v16 initWithDictionary:v17];

  [v18 setObject:v10 forKey:*MEMORY[0x1E4F87D38]];
  [v14 setServiceProviderData:v18];
  v19 = [v13 serviceProviderIdentifier];
  [v14 setServiceProviderIdentifier:v19];

  v44 = v18;
  v45 = (void *)v10;
  if (self->_setupContext == 4 && PKIsAltAccountPairedOrPairing())
  {
    objc_super v20 = PKPairedOrPairingDevice();
    uint64_t v21 = PKSerialNumberFromNRDevice();
  }
  else
  {
    uint64_t v21 = 0;
  }
  v43 = (void *)v21;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F84FF0]) initWithServiceProviderOrder:v14 targetDeviceSerialNumber:v21];
  id v23 = [v13 serviceProviderAcceptedNetworks];
  [v22 setSupportedNetworks:v23];

  v24 = [v13 serviceProviderCapabilities];
  [v22 setMerchantCapabilities:PKMerchantCapabilityFromStrings()];

  v25 = [v13 serviceProviderCountryCode];
  [v22 setCountryCode:v25];

  v26 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata currency];
  [v22 setCurrencyCode:v26];

  v27 = [v13 serviceProviderSupportedCountries];
  [v22 setSupportedCountries:v27];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  id v29 = (void *)MEMORY[0x1E4F84CE0];
  v30 = PKLocalizedPaymentString(&cfstr_SetupPurchaseT_0.isa);
  v46 = v8;
  v31 = [v29 summaryItemWithLabel:v30 amount:v8];

  [v28 addObject:v31];
  if (v9)
  {
    v32 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v33 = [v32 compare:v9];

    if (v33 == -1)
    {
      v34 = (void *)MEMORY[0x1E4F84CE0];
      v35 = PKLocalizedPaymentString(&v7->isa);
      v36 = [v34 summaryItemWithLabel:v35 amount:v9];

      [v28 addObject:v36];
    }
  }
  v37 = [v13 serviceProviderLocalizedDisplayName];
  v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    id v39 = [(PKPaymentSetupProduct *)self->_product displayName];
  }
  v40 = v39;

  v41 = [MEMORY[0x1E4F84CE0] summaryItemWithLabel:v40 amount:v45];
  [v28 addObject:v41];
  [v22 setPaymentSummaryItems:v28];

  return v22;
}

- (id)paymentRequestForProduct:(id)a3 serviceProviderProduct:(id)a4 productItem:(id)a5
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [v6 amount];
  uint64_t v8 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata depositAmount];
  uint64_t v9 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata depositType];
  uint64_t v10 = @"SETUP_PURCHASE_REFUNDABLE_SERVICE_FEE_ITEM_LABEL";
  if (v9 == 2) {
    uint64_t v10 = @"SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_ITEM_LABEL";
  }
  if (v9 == 1) {
    uint64_t v10 = @"SETUP_PURCHASE_REFUNDABLE_DEPOSIT_ITEM_LABEL";
  }
  p_isa = &v10->isa;
  v65 = (void *)v8;
  if (v8)
  {
    v11 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v12 = [v11 compare:v8];

    if (v12 == -1)
    {
      uint64_t v13 = [v7 decimalNumberByAdding:v8];

      id v7 = (void *)v13;
    }
  }
  id v14 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata digitalIssuanceMetadata];
  id v15 = objc_alloc_init(MEMORY[0x1E4F84838]);
  id v16 = [v14 action];
  [v15 setItemDescription:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v18 = [v14 serviceProviderDict];
  v19 = (void *)[v17 initWithDictionary:v18];

  [v19 setObject:v7 forKey:*MEMORY[0x1E4F87D38]];
  v67[0] = @"identifier";
  objc_super v20 = [v6 identifier];
  v67[1] = @"amount";
  v68[0] = v20;
  v68[1] = v7;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];

  v61 = (void *)v21;
  uint64_t v66 = v21;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  objc_msgSend(v19, "setObject:forKey:");
  v62 = v19;
  [v15 setServiceProviderData:v19];
  v22 = [v14 serviceProviderIdentifier];
  [v15 setServiceProviderIdentifier:v22];

  v64 = v7;
  if (self->_setupContext == 4 && PKIsAltAccountPairedOrPairing())
  {
    id v23 = PKPairedOrPairingDevice();
    uint64_t v24 = PKSerialNumberFromNRDevice();
  }
  else
  {
    uint64_t v24 = 0;
  }
  v63 = v15;
  v59 = (void *)v24;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F84FF0]) initWithServiceProviderOrder:v15 targetDeviceSerialNumber:v24];
  v26 = [v14 serviceProviderAcceptedNetworks];
  [v25 setSupportedNetworks:v26];

  v27 = [v14 serviceProviderCapabilities];
  [v25 setMerchantCapabilities:PKMerchantCapabilityFromStrings()];

  v28 = [v14 serviceProviderCountryCode];
  [v25 setCountryCode:v28];

  id v29 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata currency];
  [v25 setCurrencyCode:v29];

  v30 = [v14 serviceProviderSupportedCountries];
  [v25 setSupportedCountries:v30];

  v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  v32 = [v6 localizedDisplayName];
  id v33 = [v6 localizedDescription];
  v34 = v33;
  v58 = v32;
  if (v33)
  {
    uint64_t v35 = [v33 length];

    if (v35)
    {
      id v36 = v32;
      id v37 = v34;
      if (v36 == v37)
      {
      }
      else
      {
        v38 = v37;
        if (!v36)
        {

LABEL_30:
          [NSString stringWithFormat:@"%@ - %@", v36, v38];
          goto LABEL_20;
        }
        int v39 = [v36 isEqualToString:v37];

        if (!v39) {
          goto LABEL_30;
        }
      }
    }
  }
  [NSString stringWithFormat:@"%@", v32, v56];
  v40 = LABEL_20:;
  v41 = (void *)MEMORY[0x1E4F84CE0];
  v42 = v6;
  v43 = [v6 amount];
  v44 = [v41 summaryItemWithLabel:v40 amount:v43];

  [v31 addObject:v44];
  if (v65)
  {
    v45 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v46 = [v45 compare:v65];

    if (v46 == -1)
    {
      v47 = (void *)MEMORY[0x1E4F84CE0];
      v48 = PKLocalizedPaymentString(p_isa);
      v49 = [v47 summaryItemWithLabel:v48 amount:v65];

      [v31 addObject:v49];
    }
  }
  v50 = [v14 serviceProviderLocalizedDisplayName];
  v51 = v50;
  if (v50)
  {
    id v52 = v50;
  }
  else
  {
    id v52 = [(PKPaymentSetupProduct *)self->_product displayName];
  }
  v53 = v52;

  v54 = [MEMORY[0x1E4F84CE0] summaryItemWithLabel:v53 amount:v64];
  [v31 addObject:v54];
  [v25 setPaymentSummaryItems:v31];

  return v25;
}

- (void)presentTermsAndConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void, void))v4;
  if (self->_acceptedTerms)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
  else
  {
    id v6 = [(PKPaymentSetupProduct *)self->_product termsURL];
    if (v6)
    {
      if (!self->_termsController)
      {
        id v7 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
        termsController = self->_termsController;
        self->_termsController = v7;

        [(RemoteUIController *)self->_termsController setDelegate:self];
      }
      [(PKPaymentSetupPurchaseControllerDelegate *)self->_purchaseControllerDelegate resignFirstResponder];
      uint64_t v9 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
      uint64_t v10 = objc_alloc_init(PKPortraitNavigationController);
      [(PKPortraitNavigationController *)v10 setModalInPresentation:1];
      [(RemoteUIController *)self->_termsController setNavigationController:v10];
      v11 = [(RemoteUIController *)self->_termsController loader];
      uint64_t v12 = [v9 context];
      objc_msgSend(v11, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

      objc_initWeak(&location, self);
      uint64_t v13 = self->_termsController;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke;
      v15[3] = &unk_1E59DDEA0;
      objc_copyWeak(&v19, &location);
      id v14 = v10;
      id v16 = v14;
      v18 = v5;
      id v17 = v6;
      [(RemoteUIController *)v13 loadURL:v17 postBody:0 completion:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v5[2](v5, 1, 0);
    }
  }
}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E59D6580;
  objc_copyWeak(&v12, a1 + 7);
  char v13 = a2;
  id v8 = a1[4];
  id v11 = a1[6];
  id v9 = a1[5];
  id v10 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v12);
}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained && WeakRetained[3])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      PKPaymentSetupApplyContextAppearance((uint64_t)WeakRetained[2], *(void **)(a1 + 32));
      int v5 = objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts");
      char v6 = v5;
      if (v5)
      {
        [*(id *)(a1 + 32) setModalPresentationStyle:3];
        [v4[3] presentViewController:*(void *)(a1 + 32) withTransition:1 completion:0];
      }
      else
      {
        [v4[3] presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
      }
      id v10 = v4[7];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_3;
      v16[3] = &unk_1E59CC738;
      objc_copyWeak(&v18, v2);
      char v19 = v6;
      id v17 = *(id *)(a1 + 56);
      [v10 setHandlerForElementName:@"agree" handler:v16];
      id v11 = v4[7];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_4;
      v12[3] = &unk_1E59CC738;
      objc_copyWeak(&v14, v2);
      char v15 = v6;
      id v13 = *(id *)(a1 + 56);
      [v11 setHandlerForElementName:@"disagree" handler:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&v18);
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) localizedDescription];
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v8;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@ with error: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setAcceptedTerms:1];
    v3 = (void *)v4[3];
    if (*(unsigned char *)(a1 + 48)) {
      [v3 dismissViewControllerWithTransition:1 completion:0];
    }
    else {
      [v3 dismissViewControllerAnimated:1 completion:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }
}

void __76__PKPaymentSetupPurchaseController_presentTermsAndConditionsWithCompletion___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[3];
    if (*(unsigned char *)(a1 + 48)) {
      [v3 dismissViewControllerWithTransition:2 completion:0];
    }
    else {
      [v3 dismissViewControllerAnimated:1 completion:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (objc_opt_respondsToSelector()) {
    [v4[3] showKeyPad];
  }
}

- (BOOL)acceptedTerms
{
  return self->_acceptedTerms;
}

- (void)setAcceptedTerms:(BOOL)a3
{
  self->_acceptedTerms = a3;
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setTermsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_purchaseControllerDelegate, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end