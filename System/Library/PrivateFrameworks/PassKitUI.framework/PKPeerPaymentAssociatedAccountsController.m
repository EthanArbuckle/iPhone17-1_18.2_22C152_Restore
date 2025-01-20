@interface PKPeerPaymentAssociatedAccountsController
- (PKPeerPaymentAssociatedAccountsController)initWithFamilyCollection:(id)a3 avatarManager:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6;
- (PKPeerPaymentAssociatedAccountsController)initWithFamilyMembers:(id)a3;
- (void)_peerPaymentAccountChanged:(id)a3;
- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5;
- (void)presentAssociatedAccountsFlowWithPresentationContext:(id)a3 fromNavigationController:(id)a4;
@end

@implementation PKPeerPaymentAssociatedAccountsController

- (PKPeerPaymentAssociatedAccountsController)initWithFamilyMembers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x1E4F84708]);
        v13 = objc_msgSend(v12, "initWithFAFamilyMember:", v11, (void)v22);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:v5];
  v15 = [PKContactAvatarManager alloc];
  v16 = [MEMORY[0x1E4F845E8] defaultContactResolver];
  id v17 = objc_alloc_init(MEMORY[0x1E4F84A88]);
  v18 = [(PKContactAvatarManager *)v15 initWithContactResolver:v16 paymentDataProvider:v17];

  id v19 = objc_alloc_init(MEMORY[0x1E4F848A0]);
  v20 = [(PKPeerPaymentAssociatedAccountsController *)self initWithFamilyCollection:v14 avatarManager:v18 passLibraryDataProvider:v19 context:3];

  return v20;
}

- (PKPeerPaymentAssociatedAccountsController)initWithFamilyCollection:(id)a3 avatarManager:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentAssociatedAccountsController;
  v14 = [(PKPeerPaymentAssociatedAccountsController *)&v23 init];
  if (v14)
  {
    v15 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v14->_paymentService;
    v14->_paymentService = v15;

    uint64_t v17 = [MEMORY[0x1E4F84E00] sharedInstance];
    peerPaymentService = v14->_peerPaymentService;
    v14->_peerPaymentService = (PKPeerPaymentService *)v17;

    uint64_t v19 = [(PKPeerPaymentService *)v14->_peerPaymentService account];
    account = v14->_account;
    v14->_account = (PKPeerPaymentAccount *)v19;

    objc_storeStrong((id *)&v14->_familyCollection, a3);
    objc_storeStrong((id *)&v14->_avatarManager, a4);
    v14->_context = a6;
    objc_storeStrong((id *)&v14->_passLibraryDataProvider, a5);
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v14 selector:sel__peerPaymentAccountChanged_ name:*MEMORY[0x1E4F87CB0] object:v14->_peerPaymentService];
  }
  return v14;
}

- (void)presentAssociatedAccountsFlowWithPresentationContext:(id)a3 fromNavigationController:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    account = self->_account;
    if (account)
    {
      if ([(PKPeerPaymentAccount *)account supportsFamilySharing])
      {
        objc_storeStrong((id *)&self->_navigationController, a4);
        p_presentationContext = (id *)&self->_presentationContext;
        objc_storeStrong((id *)&self->_presentationContext, a3);
        id v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = *p_presentationContext;
          *(_DWORD *)buf = 138412290;
          id v77 = v12;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Presenting peer payment associated account view with configuration %@", buf, 0xCu);
        }

        id v13 = [*p_presentationContext member];
        uint64_t v14 = [*p_presentationContext setupType];
        if (v13)
        {
          uint64_t v15 = v14;
          v16 = [v13 altDSID];
          uint64_t v17 = [(PKPeerPaymentAccount *)self->_account peerPaymentAccountWithAltDSID:v16];
          uint64_t v74 = [(PKPeerPaymentAccount *)self->_account accountInvitationWithAltDSID:v16];
          if (v17 | v74)
          {
            if (v17)
            {
              v18 = [*p_presentationContext transaction];
              if (v18)
              {
                v71 = v16;
                uint64_t v72 = v17;
                uint64_t v19 = [[PKPeerPaymentAssociatedAccountControllerDoneTapHelper alloc] initWithNavigationController:self->_navigationController];
                doneTapHelper = self->_doneTapHelper;
                self->_doneTapHelper = v19;

                v21 = [[PKPeerPaymentAssociatedAccountViewController alloc] initWithFamilyMember:v13 familyCollection:self->_familyCollection account:self->_account context:self->_context];
                long long v22 = [(PKPeerPaymentAssociatedAccountViewController *)v21 navigationItem];
                objc_super v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self->_doneTapHelper action:sel_doneTapped];
                [v22 setRightBarButtonItem:v23];

                long long v24 = [(PKPeerPaymentAssociatedAccountViewController *)v21 familyMemberTransactionViewController];
                v73 = v18;
                long long v25 = [v24 transactionViewControllerForTransaction:v18];
                v26 = [v25 navigationItem];
                uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self->_doneTapHelper action:sel_doneTapped];
                [v26 setRightBarButtonItem:v27];

                if (v21) {
                  BOOL v28 = v24 == 0;
                }
                else {
                  BOOL v28 = 1;
                }
                int v30 = !v28 && v25 != 0;
                BOOL v31 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
                if (v30 == 1)
                {
                  if (v31)
                  {
                    *(_DWORD *)buf = 138412290;
                    id v77 = v73;
                    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Presenting associated account transaction %@", buf, 0xCu);
                  }

                  v32 = objc_alloc_init(PKNavigationController);
                  v75[0] = v21;
                  v75[1] = v24;
                  v75[2] = v25;
                  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
                  [(PKNavigationController *)v32 setViewControllers:v11];
                  v33 = v25;
                  uint64_t v34 = v72;
                }
                else
                {
                  v70 = v25;
                  if (v31)
                  {
                    *(_DWORD *)buf = 138412290;
                    id v77 = v73;
                    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Cannot presenting associated account transaction for a nil view controllers %@", buf, 0xCu);
                  }
                  v32 = 0;
                  uint64_t v34 = v17;
                  v33 = v70;
                }

                v16 = v71;
                uint64_t v17 = v34;
                v18 = v73;
              }
              else
              {
                v32 = [[PKPeerPaymentAssociatedAccountViewController alloc] initWithFamilyMember:v13 familyCollection:self->_familyCollection account:self->_account context:self->_context];
                int v30 = 0;
              }
            }
            else
            {
              v60 = (void *)MEMORY[0x1E4FB1418];
              v61 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_3.isa);
              v62 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_4.isa);
              v32 = [v60 alertControllerWithTitle:v61 message:v62 preferredStyle:1];

              v63 = (void *)MEMORY[0x1E4FB1410];
              v64 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
              v65 = [v63 actionWithTitle:v64 style:0 handler:0];
              [(PKNavigationController *)v32 addAction:v65];

              int v30 = 1;
            }
          }
          else
          {
            v52 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
            int v53 = [v52 isOrganizer];

            if (v53)
            {
              if (v15 == 1)
              {
                v66 = [PKPeerPaymentAddAssociatedAccountViewController alloc];
                familyCollection = self->_familyCollection;
                v68 = [MEMORY[0x1E4F84E10] sharedService];
                int v30 = 1;
                v69 = [(PKPeerPaymentAddAssociatedAccountViewController *)v66 initWithFamilyMember:v13 familyCollection:familyCollection webService:v68 passLibraryDataProvider:self->_passLibraryDataProvider delegate:self context:self->_context setupType:1];

                v32 = [[PKNavigationController alloc] initWithRootViewController:v69];
                [(PKNavigationController *)v32 setModalInPresentation:1];
              }
              else if (v15)
              {
                int v30 = 0;
                v32 = 0;
              }
              else
              {
                v32 = [[PKPeerPaymentTurnOnAssociatedAccountViewController alloc] initWithFamilyMember:v13 familyCollection:self->_familyCollection delegate:self passLibraryDataProvider:self->_passLibraryDataProvider context:self->_context setupType:0];
                int v30 = 0;
              }
            }
            else
            {
              v54 = (void *)MEMORY[0x1E4FB1418];
              v55 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentCan.isa);
              v56 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentCan_0.isa);
              int v30 = 1;
              v32 = [v54 alertControllerWithTitle:v55 message:v56 preferredStyle:1];

              v57 = (void *)MEMORY[0x1E4FB1410];
              v58 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
              v59 = [v57 actionWithTitle:v58 style:0 handler:0];
              [(PKNavigationController *)v32 addAction:v59];
            }
          }

          if (v32)
          {
            if (v30)
            {
              [v8 presentViewController:v32 animated:1 completion:0];
LABEL_60:

              goto LABEL_61;
            }
LABEL_59:
            [v8 pushViewController:v32 animated:1];
            goto LABEL_60;
          }
        }
        else
        {
          v32 = [[PKPeerPaymentFamilyCircleViewController alloc] initWithFamilyCollection:self->_familyCollection avatarManager:self->_avatarManager passLibraryDataProvider:self->_passLibraryDataProvider context:self->_context];
          if (v32) {
            goto LABEL_59;
          }
          id v13 = 0;
        }
      }
      else
      {
        v36 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v36, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", buf, 2u);
        }

        v37 = (void *)MEMORY[0x1E4FB1418];
        v38 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea.isa);
        v39 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea_0.isa);
        id v13 = [v37 alertControllerWithTitle:v38 message:v39 preferredStyle:1];

        v40 = (void *)MEMORY[0x1E4FB1410];
        v41 = PKLocalizedString(&cfstr_Ok.isa);
        v42 = [v40 actionWithTitle:v41 style:0 handler:0];

        [v13 addAction:v42];
        [v8 presentViewController:v13 animated:1 completion:0];
      }
    }
    else
    {
      v35 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v35, OS_LOG_TYPE_DEFAULT, "There is no peer payment account. Guide user to setup apple cash prior to viewing children.", buf, 2u);
      }

      if (PKPassbookIsCurrentlyDeletedByUser())
      {
        id v13 = PKCreateAlertControllerForWalletUninstalled(0);
      }
      else
      {
        int HasDisabledPeerPayment = PKUserHasDisabledPeerPayment();
        BOOL v44 = HasDisabledPeerPayment == 0;
        if (HasDisabledPeerPayment) {
          v45 = @"PEER_PAYMENT_ERROR_APPLE_CASH_REENABLE_TITLE";
        }
        else {
          v45 = @"PEER_PAYMENT_ERROR_APPLE_CASH_NOT_ENABLED_TITLE";
        }
        if (v44) {
          v46 = @"PEER_PAYMENT_ERROR_APPLE_CASH_NOT_ENABLED_MESSAGE";
        }
        else {
          v46 = @"PEER_PAYMENT_ERROR_APPLE_CASH_REENABLE_MESSAGE";
        }
        v47 = PKLocalizedPeerPaymentLexingtonString(&v45->isa);
        v48 = PKLocalizedPeerPaymentLexingtonString(&v46->isa);
        id v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v47 message:v48 preferredStyle:1];
        v49 = (void *)MEMORY[0x1E4FB1410];
        v50 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_5.isa);
        v51 = [v49 actionWithTitle:v50 style:0 handler:&__block_literal_global_103];

        [v13 addAction:v51];
      }
      [v8 presentViewController:v13 animated:1 completion:0];
    }
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Error: no navigation controller defined.", buf, 2u);
    }
  }
LABEL_61:
}

void __123__PKPeerPaymentAssociatedAccountsController_presentAssociatedAccountsFlowWithPresentationContext_fromNavigationController___block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5
{
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v22 = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountsController addPeerPaymentAssociatedAccountSetupCompletedWithSucess: called", v22, 2u);
  }

  if (!v7)
  {
    [(UINavigationController *)self->_navigationController dismissViewControllerAnimated:1 completion:0];
    goto LABEL_17;
  }
  if (v9) {
    objc_storeStrong((id *)&self->_account, a4);
  }
  account = self->_account;
  id v13 = [v10 altDSID];
  uint64_t v14 = [(PKPeerPaymentAccount *)account peerPaymentAccountWithAltDSID:v13];

  if (v14)
  {
    uint64_t v15 = [[PKPeerPaymentAssociatedAccountViewController alloc] initWithFamilyMember:v10 familyCollection:self->_familyCollection account:self->_account context:self->_context];
  }
  else
  {
    if (!self->_context)
    {
      v16 = 0;
      goto LABEL_12;
    }
    uint64_t v15 = [[PKPeerPaymentFamilyCircleViewController alloc] initWithFamilyCollection:self->_familyCollection avatarManager:self->_avatarManager passLibraryDataProvider:self->_passLibraryDataProvider context:self->_context];
  }
  v16 = v15;
LABEL_12:
  uint64_t v17 = [(UINavigationController *)self->_navigationController viewControllers];
  v18 = (void *)[v17 mutableCopy];

  uint64_t v19 = [v18 lastObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v18 removeLastObject];
  }
  if (v16) {
    [v18 addObject:v16];
  }
  navigationController = self->_navigationController;
  v21 = (void *)[v18 copy];
  [(UINavigationController *)navigationController setViewControllers:v21];

  [(UINavigationController *)self->_navigationController dismissViewControllerAnimated:1 completion:0];
LABEL_17:
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke;
  v4[3] = &unk_1E59CE240;
  v4[4] = self;
  [(PKPeerPaymentService *)peerPaymentService updateAccountWithCompletion:v4];
}

void __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __72__PKPeerPaymentAssociatedAccountsController__peerPaymentAccountChanged___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_doneTapHelper, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end