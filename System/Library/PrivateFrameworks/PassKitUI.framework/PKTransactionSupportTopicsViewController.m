@interface PKTransactionSupportTopicsViewController
- (BOOL)shouldShowSupportLink:(id)a3;
- (PKTransactionSupportTopicsViewController)initWithAccount:(id)a3 transaction:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8;
- (void)_cancelPaymentWithFallbackTopic:(id)a3;
- (void)_cancelTapped;
- (void)_fetchSupportTopics;
- (void)_openBusinessChatForTopic:(id)a3;
- (void)_openBusinessChatWithContext:(id)a3;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 dismissAfter:(BOOL)a5;
- (void)_redirectUserToLegacyReportIssue;
- (void)_reloadSectionControllerWithTopics:(id)a3;
- (void)_setBarButtonSpinnerHidden:(BOOL)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)deselectCells;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)openBusinessChatForTopic:(id)a3;
- (void)reloadItem:(id)a3 animated:(BOOL)a4;
- (void)showExplanationForTopic:(id)a3;
- (void)showMerchantDetailsForTransaction;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKTransactionSupportTopicsViewController

- (PKTransactionSupportTopicsViewController)initWithAccount:(id)a3 transaction:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v28 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKTransactionSupportTopicsViewController;
  v18 = [(PKPaymentSetupOptionsViewController *)&v29 initWithProvisioningController:0 context:0 delegate:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_transaction, a4);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a5);
    objc_storeStrong((id *)&v19->_familyCollection, a6);
    objc_storeStrong((id *)&v19->_accountUserCollection, a7);
    uint64_t v20 = [(NSSet *)v19->_physicalCards copy];
    physicalCards = v19->_physicalCards;
    v19->_physicalCards = (NSSet *)v20;

    v19->_loadingTopics = 0;
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v19];
    paymentService = v19->_paymentService;
    v19->_paymentService = (PKPaymentService *)v22;

    v24 = [(PKTransactionSupportTopicsViewController *)v19 navigationItem];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v19 action:sel__cancelTapped];
    [v24 setLeftBarButtonItem:v25];

    [v24 setBackButtonDisplayMode:2];
    v26 = PKLocalizedPaymentString(&cfstr_TransactionDet_20.isa);
    [v24 setTitle:v26];
  }
  return v19;
}

- (void)_fetchSupportTopics
{
  self->_loadingTopics = 1;
  [(PKTransactionSupportTopicsViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  id v3 = objc_alloc_init(MEMORY[0x1E4F84368]);
  v4 = [(PKAccount *)self->_account accountBaseURL];
  [v3 setBaseURL:v4];

  v5 = [(PKAccount *)self->_account accountIdentifier];
  [v3 setAccountIdentifier:v5];

  [v3 setTransaction:self->_transaction];
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x1E4F84D50] sharedService];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke;
  v7[3] = &unk_1E59CEC78;
  objc_copyWeak(&v8, &location);
  [v6 supportTopicsWithRequest:v3 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __63__PKTransactionSupportTopicsViewController__fetchSupportTopics__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1376) = 0;
    id v15 = WeakRetained;
    [WeakRetained _setNeedsUpdateContentUnavailableConfiguration];
    id v3 = [*(id *)(a1 + 32) topics];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) topics];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        id v6 = [*(id *)(a1 + 32) topics];
        [v15 _reloadSectionControllerWithTopics:v6];
      }
      else
      {
        id v6 = [v15[164] accountUserForTransaction:v15[161]];
        id v7 = v15[163];
        id v8 = [v6 altDSID];
        v9 = [v7 familyMemberForAltDSID:v8];

        uint64_t v10 = [v15[161] transactionType];
        if ((unint64_t)(v10 - 13) < 2)
        {
          uint64_t v11 = 11;
        }
        else if (v10 == 7)
        {
          if ([v15[161] adjustmentTypeReason] == 3) {
            uint64_t v11 = 12;
          }
          else {
            uint64_t v11 = 13;
          }
        }
        else if (v10 == 10)
        {
          uint64_t v11 = 9;
        }
        else
        {
          uint64_t v11 = 5;
        }
        v12 = [PKBusinessChatTransactionDisputeContext alloc];
        v13 = [v15[162] paymentPass];
        id v14 = [(PKBusinessChatTransactionDisputeContext *)v12 initWithPaymentPass:v13 transaction:v15[161] account:v15[160] accountUser:v6 familyMember:v9 physicalCards:v15[165] intent:v11];

        [v15 _openBusinessChatWithContext:v14];
      }
    }
    else
    {
      [v15 _redirectUserToLegacyReportIssue];
    }
    WeakRetained = v15;
  }
}

- (void)_redirectUserToLegacyReportIssue
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [PKReportIssueViewController alloc];
  transaction = self->_transaction;
  transactionSourceCollection = self->_transactionSourceCollection;
  id v6 = [(PKTransactionSourceCollection *)transactionSourceCollection paymentPass];
  id v7 = [(PKReportIssueViewController *)v3 initWithTransaction:transaction transactionSourceCollection:transactionSourceCollection paymentPass:v6 familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection bankConnectInstitution:0 physicalCards:self->_physicalCards detailViewStyle:0 context:0];

  id v8 = [(PKTransactionSupportTopicsViewController *)self navigationController];
  if (v8)
  {
    v10[0] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v8 setViewControllers:v9 animated:0];
  }
}

- (void)_reloadSectionControllerWithTopics:(id)a3
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:5 detailViewStyle:0 avatarViewDelegate:self];
    id v6 = [[PKDashboardPaymentTransactionItem alloc] initWithTransactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection transaction:self->_transaction account:self->_account accountUserCollection:self->_accountUserCollection bankConnectInstitution:0];
    id v7 = [PKTransactionSupportTransactionSectionController alloc];
    id v8 = [(PKDynamicCollectionViewController *)self collectionView];
    v31 = v5;
    v9 = [(PKTransactionSupportTransactionSectionController *)v7 initWithTransactionItem:v6 transactionItemPresenter:v5 collectionView:v8];
    transactionSectionController = self->_transactionSectionController;
    self->_transactionSectionController = v9;

    uint64_t v11 = [PKAccountSupportTopicsSectionController alloc];
    account = self->_account;
    v13 = PKLocalizedFeatureString();
    id v14 = [v13 localizedUppercaseString];
    id v15 = [(PKAccountSupportTopicsSectionController *)v11 initWithAccount:account topics:v4 sectionTitle:v14 delegate:self];
    sectionTopicController = self->_sectionTopicController;
    self->_sectionTopicController = v15;

    id v17 = [(PKPaymentTransaction *)self->_transaction merchant];
    id v18 = [v17 rawName];
    if (v18 || ([v17 name], (id v18 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = [v17 displayName];
      id v18 = v18;
      id v20 = v19;
      if (v18 == v20)
      {
      }
      else
      {
        v21 = v20;
        if (!v20)
        {

LABEL_12:
          v27 = [[PKTransactionSupportStatementNameSectionController alloc] initWithMerchantStatementName:v18];
          merchantNameSectionController = self->_merchantNameSectionController;
          self->_merchantNameSectionController = v27;

          objc_super v29 = self->_merchantNameSectionController;
          v33[0] = self->_transactionSectionController;
          v33[1] = v29;
          v33[2] = self->_sectionTopicController;
          v24 = (void *)MEMORY[0x1E4F1C978];
          v25 = v33;
          uint64_t v26 = 3;
          goto LABEL_13;
        }
        char v22 = [v18 isEqualToString:v20];

        if ((v22 & 1) == 0) {
          goto LABEL_12;
        }
      }
    }
    v23 = self->_sectionTopicController;
    v32[0] = self->_transactionSectionController;
    v32[1] = v23;
    v24 = (void *)MEMORY[0x1E4F1C978];
    v25 = v32;
    uint64_t v26 = 2;
LABEL_13:
    v30 = [v24 arrayWithObjects:v25 count:v26];
    [(PKPaymentSetupOptionsViewController *)self setSections:v30 animated:1];

    goto LABEL_14;
  }
  [(PKTransactionSupportTopicsViewController *)self openBusinessChatForTopic:0];
LABEL_14:
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionSupportTopicsViewController;
  [(PKPaymentSetupOptionsViewController *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  id v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v3];
  [(PKTransactionSupportTopicsViewController *)self _fetchSupportTopics];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionSupportTopicsViewController;
  [(PKPaymentSetupOptionsViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKDynamicCollectionViewController *)self collectionView];
  id v4 = [(PKTransactionSupportTopicsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (self->_loadingTopics)
  {
    id v4 = (void *)MEMORY[0x1E4FB1658];
    id v5 = a3;
    id v6 = [v4 loadingConfiguration];
    id v7 = [v6 updatedConfigurationForState:v5];
  }
  else
  {
    id v7 = 0;
  }
  [(PKTransactionSupportTopicsViewController *)self _setContentUnavailableConfiguration:v7];
}

- (void)showExplanationForTopic:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [v11 issueType];
  if (v4 >= 4)
  {
    if (v4 != 4) {
      goto LABEL_6;
    }
    id v6 = [PKReportIssueViewController alloc];
    transaction = self->_transaction;
    transactionSourceCollection = self->_transactionSourceCollection;
    v9 = [(PKTransactionSourceCollection *)transactionSourceCollection paymentPass];
    id v5 = [(PKReportIssueViewController *)v6 initWithTransaction:transaction transactionSourceCollection:transactionSourceCollection paymentPass:v9 familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection bankConnectInstitution:0 physicalCards:self->_physicalCards detailViewStyle:0 context:1];
  }
  else
  {
    id v5 = [[PKAccountSupportTopicExplanationViewController alloc] initWithAccount:self->_account topic:v11 delegate:self];
  }
  uint64_t v10 = [(PKTransactionSupportTopicsViewController *)self navigationController];
  [v10 pushViewController:v5 animated:1];

LABEL_6:
}

- (void)deselectCells
{
  v2.receiver = self;
  v2.super_class = (Class)PKTransactionSupportTopicsViewController;
  [(PKDynamicCollectionViewController *)&v2 deselectCells];
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionSupportTopicsViewController;
  [(PKDynamicCollectionViewController *)&v4 reloadItem:a3 animated:a4];
}

- (BOOL)shouldShowSupportLink:(id)a3
{
  if ([a3 action] != 1) {
    return 1;
  }
  objc_super v4 = [(PKPaymentTransaction *)self->_transaction merchant];
  BOOL v5 = 0;
  if (PKIsPhone() && v4)
  {
    if ([v4 useRawMerchantData])
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = [v4 mapsMerchant];
      BOOL v5 = v6 != 0;
    }
  }

  return v5;
}

- (void)showMerchantDetailsForTransaction
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!self->_loadingMapsViewController)
  {
    id v3 = [(PKPaymentTransaction *)self->_transaction merchant];
    objc_super v4 = [v3 mapsMerchant];
    BOOL v5 = (void *)[v4 identifier];

    if (v5)
    {
      self->_loadingMapsViewController = 1;
      loadingMapsTimer = self->_loadingMapsTimer;
      if (loadingMapsTimer)
      {
        dispatch_source_cancel(loadingMapsTimer);
        id v7 = self->_loadingMapsTimer;
        self->_loadingMapsTimer = 0;
      }
      objc_initWeak(&location, self);
      id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      p_loadingMapsTimer = (dispatch_object_t *)&self->_loadingMapsTimer;
      uint64_t v10 = self->_loadingMapsTimer;
      self->_loadingMapsTimer = v8;

      id v11 = self->_loadingMapsTimer;
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v13 = *p_loadingMapsTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke;
      handler[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v21, &location);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume(*p_loadingMapsTimer);
      id v14 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
      id v15 = [NSNumber numberWithUnsignedLongLong:v5];
      v23[0] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [v14 _setMuids:v16];

      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v14];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_2;
      v18[3] = &unk_1E59D0978;
      objc_copyWeak(v19, &location);
      v19[1] = v5;
      [v17 startWithCompletionHandler:v18];
      objc_destroyWeak(v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[175];
    BOOL v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      objc_super v4 = v5[175];
      v5[175] = 0;

      objc_super v2 = v5;
    }
    [v2 _setBarButtonSpinnerHidden:0];
    objc_super v2 = v5;
  }
}

void __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_3;
  v9[3] = &unk_1E59CE838;
  objc_copyWeak(v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  v12[1] = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(v12);
}

void __77__PKTransactionSupportTopicsViewController_showMerchantDetailsForTransaction__block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained[175];
    if (v4)
    {
      dispatch_source_cancel(v4);
      id v5 = v3[175];
      v3[175] = 0;
    }
    *((unsigned char *)v3 + 1393) = 0;
    [v3 _setBarButtonSpinnerHidden:1];
    if (*(void *)(a1 + 32)
      || ([*(id *)(a1 + 40) mapItems],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 count],
          v10,
          !v11))
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 56);
        id v8 = *(void **)(a1 + 32);
        if (v8)
        {
          v9 = [v8 localizedDescription];
        }
        else
        {
          v9 = @"no map items.";
        }
        int v23 = 134218242;
        uint64_t v24 = v7;
        __int16 v25 = 2112;
        uint64_t v26 = v9;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKTransactionHistoryViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v23, 0x16u);
        if (v8) {
      }
        }
      id v17 = (void *)MEMORY[0x1E4FB1418];
      id v18 = PKLocalizedPaymentString(&cfstr_DashboardMapsM.isa);
      v19 = [v17 alertControllerWithTitle:0 message:v18 preferredStyle:1];

      id v20 = (void *)MEMORY[0x1E4FB1410];
      id v21 = PKLocalizedPaymentString(&cfstr_DashboardMapsM_0.isa);
      char v22 = [v20 actionWithTitle:v21 style:0 handler:0];
      [v19 addAction:v22];

      [v3 presentViewController:v19 animated:1 completion:0];
    }
    else
    {
      dispatch_time_t v12 = [PKMerchantMapViewController alloc];
      v13 = [*(id *)(a1 + 40) mapItems];
      id v14 = [v13 firstObject];
      id v15 = [(PKMerchantMapViewController *)v12 initWithMapItem:v14];

      id v16 = [v3 navigationController];
      [v16 pushViewController:v15 animated:1];
    }
  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 dismissAfter:(BOOL)a5
{
  uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v8 = (void *)MEMORY[0x1E4FB1410];
  v9 = PKLocalizedPaymentString(&cfstr_TransactionDet_21.isa);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PKTransactionSupportTopicsViewController__presentAlertWithTitle_message_dismissAfter___block_invoke;
  v11[3] = &unk_1E59D09A0;
  BOOL v12 = a5;
  v11[4] = self;
  id v10 = [v8 actionWithTitle:v9 style:0 handler:v11];
  [v7 addAction:v10];

  [(PKTransactionSupportTopicsViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __88__PKTransactionSupportTopicsViewController__presentAlertWithTitle_message_dismissAfter___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) presentingViewController];
    [v1 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)openBusinessChatForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentTransaction *)self->_transaction accountIdentifier];
  if (!v5) {
    goto LABEL_8;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  uint64_t v8 = [v7 businessChatIdentifier];
  if (!v8) {
    goto LABEL_7;
  }
  v9 = (void *)v8;
  id v10 = [(PKPaymentTransaction *)self->_transaction payments];
  if (![v10 count])
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v11 = [(PKPaymentTransaction *)self->_transaction payments];
  BOOL v12 = [v11 firstObject];
  int v13 = [v12 isCurrentlyCancellable];

  if (!v13)
  {
LABEL_8:
    [(PKTransactionSupportTopicsViewController *)self _openBusinessChatForTopic:v4];
    goto LABEL_9;
  }
  self->_cancelingPayment = 1;
  [(PKTransactionSupportTopicsViewController *)self _setBarButtonSpinnerHidden:0];
  id v14 = (void *)MEMORY[0x1E4FB1418];
  id v15 = PKLocalizedFeatureString();
  id v16 = PKLocalizedFeatureString();
  id v17 = [v14 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  v19 = PKLocalizedFeatureString();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke;
  v31[3] = &unk_1E59CB218;
  v31[4] = self;
  id v20 = v4;
  id v32 = v20;
  id v21 = [v18 actionWithTitle:v19 style:2 handler:v31];
  [v17 addAction:v21];

  char v22 = (void *)MEMORY[0x1E4FB1410];
  int v23 = PKLocalizedFeatureString();
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2;
  id v28 = &unk_1E59CB218;
  objc_super v29 = self;
  id v30 = v20;
  uint64_t v24 = [v22 actionWithTitle:v23 style:1 handler:&v25];
  objc_msgSend(v17, "addAction:", v24, v25, v26, v27, v28, v29);

  [(PKTransactionSupportTopicsViewController *)self presentViewController:v17 animated:1 completion:0];
LABEL_9:
}

uint64_t __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPaymentWithFallbackTopic:*(void *)(a1 + 40)];
}

uint64_t __69__PKTransactionSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _openBusinessChatForTopic:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1392) = 0;
  return result;
}

- (void)_setBarButtonSpinnerHidden:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(PKTransactionSupportTopicsViewController *)self navigationItem];
    [v4 setRightBarButtonItem:0];

    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = 0;
  }
  else
  {
    id v6 = self->_activityIndicator;
    if (!v6)
    {
      uint64_t v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      uint64_t v8 = self->_activityIndicator;
      self->_activityIndicator = v7;

      id v6 = self->_activityIndicator;
    }
    [(UIActivityIndicatorView *)v6 startAnimating];
    id v10 = [(PKTransactionSupportTopicsViewController *)self navigationItem];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicator];
    [(UIActivityIndicatorView *)v10 setRightBarButtonItem:v9];

    activityIndicator = v10;
  }
}

- (void)_cancelPaymentWithFallbackTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentTransaction *)self->_transaction payments];
  id v6 = [v5 firstObject];

  id v7 = objc_alloc_init(MEMORY[0x1E4F842F8]);
  uint64_t v8 = [(PKAccount *)self->_account accountIdentifier];
  [v7 setAccountIdentifier:v8];

  v9 = [(PKAccount *)self->_account accountBaseURL];
  [v7 setBaseURL:v9];

  id v10 = [v6 referenceIdentifier];
  [v7 setPaymentReferenceIdentifier:v10];

  objc_initWeak(&location, self);
  paymentWebService = self->_paymentWebService;
  if (!paymentWebService)
  {
    BOOL v12 = [MEMORY[0x1E4F84D50] sharedService];
    int v13 = self->_paymentWebService;
    self->_paymentWebService = v12;

    paymentWebService = self->_paymentWebService;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke;
  v15[3] = &unk_1E59D09F0;
  objc_copyWeak(&v17, &location);
  id v14 = v4;
  id v16 = v14;
  [(PKPaymentWebService *)paymentWebService cancelPaymentWithRequest:v7 completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Cancel Payment => %@:%@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_82;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_82(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1392) = 0;
    [WeakRetained _setBarButtonSpinnerHidden:1];
    if (*(void *)(a1 + 32))
    {
      id v4 = (void *)MEMORY[0x1E4FB1418];
      id v5 = PKLocalizedFeatureString();
      id v6 = PKLocalizedFeatureString();
      id v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

      id v8 = (void *)MEMORY[0x1E4FB1410];
      v9 = PKLocalizedFeatureString();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_2;
      v17[3] = &unk_1E59CB218;
      v17[4] = v3;
      id v18 = *(id *)(a1 + 40);
      id v10 = [v8 actionWithTitle:v9 style:0 handler:v17];
      [v7 addAction:v10];

      id v11 = (void *)MEMORY[0x1E4FB1410];
      id v12 = PKLocalizedFeatureString();
      int v13 = [v11 actionWithTitle:v12 style:1 handler:0];
      [v7 addAction:v13];

      [v3 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      id v14 = v3[161];
      [v14 setTransactionStatus:5];
      __int16 v15 = [v14 transactionSourceIdentifier];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_3;
      v16[3] = &unk_1E59D09C8;
      v16[4] = v3;
      [v7 insertOrUpdatePaymentTransaction:v14 forTransactionSourceIdentifier:v15 completion:v16];
    }
  }
}

uint64_t __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openBusinessChatForTopic:*(void *)(a1 + 40)];
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_4;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__PKTransactionSupportTopicsViewController__cancelPaymentWithFallbackTopic___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = [v1 presentingViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_openBusinessChatForTopic:(id)a3
{
  id v11 = a3;
  id v4 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserForTransaction:self->_transaction];
  familyCollection = self->_familyCollection;
  id v6 = [v4 altDSID];
  id v7 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v6];

  if (!v11) {
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F84290]) initWithOtherTopicForAccount:self->_account];
  }
  id v8 = [PKBusinessChatTransactionDisputeContext alloc];
  v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  id v10 = [(PKBusinessChatTransactionDisputeContext *)v8 initWithPaymentPass:v9 transaction:self->_transaction account:self->_account accountUser:v4 familyMember:v7 physicalCards:self->_physicalCards topic:v11];

  [(PKTransactionSupportTopicsViewController *)self _openBusinessChatWithContext:v10];
}

- (void)_openBusinessChatWithContext:(id)a3
{
  id v4 = a3;
  if (!self->_businessChatController)
  {
    id v5 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v5;
  }
  objc_initWeak(&location, self);
  id v7 = self->_businessChatController;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke;
  v8[3] = &unk_1E59CB240;
  objc_copyWeak(&v9, &location);
  [(PKBusinessChatController *)v7 openBusinessChatWithContext:v4 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __73__PKTransactionSupportTopicsViewController__openBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v5 = WeakRetained;
    if (v3)
    {
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      id v4 = [WeakRetained presentingViewController];
      [v4 dismissViewControllerAnimated:1 completion:0];
    }

    id WeakRetained = v5;
  }
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PKTransactionSupportTopicsViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__PKTransactionSupportTopicsViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1304), obj);
    [*(id *)(a1 + 40) reloadDataForSection:*(void *)(*(void *)(a1 + 40) + 1352) animated:1];
  }
}

- (void)_cancelTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingMapsTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_merchantNameSectionController, 0);
  objc_storeStrong((id *)&self->_transactionSectionController, 0);
  objc_storeStrong((id *)&self->_sectionTopicController, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end