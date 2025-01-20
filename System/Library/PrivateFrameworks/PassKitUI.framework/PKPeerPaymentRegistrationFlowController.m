@interface PKPeerPaymentRegistrationFlowController
- (NSString)senderAddress;
- (PKCurrencyAmount)currencyAmount;
- (PKPaymentSetupDelegate)setupDelegate;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentRegistrationFlowController)initWithAccount:(id)a3 currencyAmount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 setupDelegate:(id)a7;
- (PKPeerPaymentRegistrationFlowController)initWithUserInfo:(id)a3 setupDelegate:(id)a4;
- (unint64_t)state;
- (void)preflightWithCompletion:(id)a3;
@end

@implementation PKPeerPaymentRegistrationFlowController

- (PKPeerPaymentRegistrationFlowController)initWithAccount:(id)a3 currencyAmount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 setupDelegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v17 = [(PKPeerPaymentRegistrationFlowController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_currencyAmount, a4);
    v18->_state = a5;
    objc_storeStrong((id *)&v18->_senderAddress, a6);
    objc_storeWeak((id *)&v18->_setupDelegate, v16);
  }

  return v18;
}

- (PKPeerPaymentRegistrationFlowController)initWithUserInfo:(id)a3 setupDelegate:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v8 = [(PKPeerPaymentRegistrationFlowController *)&v26 init];
  if (!v8) {
    goto LABEL_14;
  }
  v9 = [v6 objectForKey:@"account"];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:0];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *MEMORY[0x1E4F284E8];
    id v27 = 0;
    uint64_t v13 = [v10 decodeTopLevelObjectOfClass:v11 forKey:v12 error:&v27];
    id v14 = v27;
    [v10 finishDecoding];
    if (v13) {
      goto LABEL_10;
    }
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 description];
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Could not unarchive peer payment account data with error:%@", buf, 0xCu);
    }
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with peer payment account data.", buf, 2u);
    }
  }
  uint64_t v13 = 0;
LABEL_10:

  account = v8->_account;
  v8->_account = (PKPeerPaymentAccount *)v13;

  v18 = [v6 objectForKey:@"amount"];
  v19 = [v6 objectForKey:@"currency"];
  if ([(NSString *)v19 length] && v18)
  {
    uint64_t v20 = PKCurrencyAmountCreate(v18, v19);
    currencyAmount = v8->_currencyAmount;
    v8->_currencyAmount = (PKCurrencyAmount *)v20;
  }
  uint64_t v22 = [v6 objectForKey:@"senderAddress"];
  senderAddress = v8->_senderAddress;
  v8->_senderAddress = (NSString *)v22;

  v24 = [v6 objectForKey:@"state"];
  v8->_state = [v24 unsignedIntegerValue];

  objc_storeWeak((id *)&v8->_setupDelegate, v7);
LABEL_14:

  return v8;
}

- (void)preflightWithCompletion:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (self->_account)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F84BB8]);
      id v6 = [MEMORY[0x1E4F84D50] sharedService];
      id v7 = (void *)[v5 initWithWebService:v6];

      v8 = (void *)[objc_alloc(MEMORY[0x1E4F84D90]) initWithPeerPaymentAccount:self->_account];
      [v8 setAmount:self->_currencyAmount];
      [v8 setFlowState:self->_state];
      [v8 setPendingPaymentSenderAddress:self->_senderAddress];
      if (v8)
      {
        v17[0] = v8;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke;
        v12[3] = &unk_1E59D2210;
        id v13 = v7;
        id v14 = self;
        id v15 = v4;
        [v13 associateCredentials:v9 withCompletionHandler:v12];

        id v10 = v13;
      }
      else
      {
        uint64_t v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Could not create peer payment credential.", buf, 2u);
        }

        id v10 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:0];
        [v10 setModalInPresentation:1];
        (*((void (**)(id, id))v4 + 2))(v4, v10);
      }
    }
    else
    {
      id v7 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:0];
      [v7 setModalInPresentation:1];
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

void __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D4298;
  char v15 = a2;
  id v11 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64) && !*(void *)(a1 + 32))
  {
    id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(a1 + 40) context:0];
    [(PKPaymentSetupNavigationController *)v5 setPaymentSetupMode:1];
    [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
    [(PKPaymentSetupNavigationController *)v5 setAllowsManualEntry:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 40));
    [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:WeakRetained];

    [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_3;
    v7[3] = &unk_1E59CF408;
    v8 = v5;
    id v9 = *(id *)(a1 + 56);
    id v4 = v5;
    [(PKPaymentSetupNavigationController *)v4 preflightWithCompletion:v7];
  }
  else
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(a1 + 32) description];
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Peer Payment associateCredential failed for local device with error:%@", buf, 0xCu);
    }
    id v4 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:*(void *)(a1 + 32)];
    [(PKPaymentSetupNavigationController *)v4 setModalInPresentation:1];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __67__PKPeerPaymentRegistrationFlowController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalInPresentation:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (PKPaymentSetupDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end