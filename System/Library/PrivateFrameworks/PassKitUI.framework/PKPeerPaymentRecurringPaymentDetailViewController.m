@interface PKPeerPaymentRecurringPaymentDetailViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)_shouldShowDashboardMessages;
- (BOOL)allowEdits;
- (BOOL)showCancelButton;
- (NSDecimalNumber)maximumAmount;
- (NSDecimalNumber)minimumAmount;
- (PKPeerPaymentRecurringPaymentDetailViewController)initWithRecurringPayment:(id)a3 recipient:(id)a4 mode:(unint64_t)a5 context:(int64_t)a6 peerPaymentController:(id)a7 remoteMessagesComposer:(id)a8;
- (PKPeerPaymentRecurringPaymentDetailViewController)initWithRecurringPayment:(id)a3 recipientAddress:(id)a4 mode:(unint64_t)a5 context:(int64_t)a6 peerPaymentController:(id)a7 remoteMessagesComposer:(id)a8;
- (PKPeerPaymentRecurringPaymentDetailViewControllerDelegate)delegate;
- (id)_composeRecipientForAddress:(id)a3;
- (id)_dashboardMessages;
- (id)_messageForErrorCode:(unint64_t)a3 paymentDate:(id)a4;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_pendingRecurringPayment;
- (id)_recipientName;
- (id)_titleForErrorCode:(unint64_t)a3;
- (unint64_t)mode;
- (void)_authorizeRecurringPaymentWithCompletion:(id)a3;
- (void)_cancelEdits:(id)a3;
- (void)_cancelRecurringPaymentWithCompletion:(id)a3;
- (void)_configureAvatarView;
- (void)_didCompleteSetupFlow;
- (void)_dismissViewController:(id)a3;
- (void)_keyboardWillChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)_pauseRecurringPaymentWithCompletion:(id)a3;
- (void)_processEditsIfNeededWithCompletion:(id)a3;
- (void)_reloadWithPayments:(id)a3;
- (void)_rightBarButtonPressed:(id)a3;
- (void)_setUpNavigationBar;
- (void)_showAlertForError:(id)a3 completion:(id)a4;
- (void)_showConfirmationAlertIfNeededForAction:(unint64_t)a3 completion:(id)a4;
- (void)_updateBarButtonItems;
- (void)_updateCancelSectionFooter;
- (void)_updateDetailSectionFooter;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updatePauseSectionFooter;
- (void)_updateRecurringPaymentsWithCompletion:(id)a3;
- (void)_updateSections;
- (void)_validatePaymentEditsWithCompletion:(id)a3;
- (void)dealloc;
- (void)didSelectAmountSection;
- (void)fundingSourceSectionSelected;
- (void)makeCellFirstResponderWithItem:(id)a3;
- (void)memoIconChooserDidChooseMemo:(id)a3;
- (void)memoIconWasTapped;
- (void)paymentMethodSelectionViewController:(id)a3 didSelectPaymentMethod:(id)a4;
- (void)paymentMethodSelectionViewController:(id)a3 didToggleUseAppleCashBalance:(BOOL)a4;
- (void)paymentSetupDidFinish:(id)a3;
- (void)performAction:(unint64_t)a3 startHandler:(id)a4 completion:(id)a5;
- (void)recurringPaymentsChanged;
- (void)setAllowEdits:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumAmount:(id)a3;
- (void)setMinimumAmount:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)updateFooterForSectionIdentifier:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPeerPaymentRecurringPaymentDetailViewController

- (PKPeerPaymentRecurringPaymentDetailViewController)initWithRecurringPayment:(id)a3 recipientAddress:(id)a4 mode:(unint64_t)a5 context:(int64_t)a6 peerPaymentController:(id)a7 remoteMessagesComposer:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  v17 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _composeRecipientForAddress:a4];
  v18 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self initWithRecurringPayment:v16 recipient:v17 mode:a5 context:a6 peerPaymentController:v15 remoteMessagesComposer:v14];

  return v18;
}

- (PKPeerPaymentRecurringPaymentDetailViewController)initWithRecurringPayment:(id)a3 recipient:(id)a4 mode:(unint64_t)a5 context:(int64_t)a6 peerPaymentController:(id)a7 remoteMessagesComposer:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id obj = a8;
  id v18 = a8;
  v88.receiver = self;
  v88.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  v19 = [(PKDynamicCollectionViewController *)&v88 init];
  v20 = v19;
  if (v19)
  {
    id v85 = v17;
    p_recurringPayment = (id *)&v19->_recurringPayment;
    objc_storeStrong((id *)&v19->_recurringPayment, a3);
    objc_storeStrong((id *)&v20->_recipient, a4);
    v22 = [MEMORY[0x1E4F84898] sharedInstance];
    id v86 = v15;
    v23 = [v15 fundingSource];
    v24 = [v23 fpanIdentifier];
    uint64_t v25 = [v22 passWithFPANIdentifier:v24];
    selectedPass = v20->_selectedPass;
    v20->_selectedPass = (PKPaymentPass *)v25;

    v20->_unint64_t mode = a5;
    v20->_context = a6;
    objc_storeStrong((id *)&v20->_peerPaymentController, a7);
    v27 = objc_alloc_init(PKAvatarView);
    avatarView = v20->_avatarView;
    v20->_avatarView = v27;

    v84 = [(PKPeerPaymentController *)v20->_peerPaymentController account];
    v29 = [v84 recurringPaymentsFeatureDescriptor];
    v30 = (PKPeerPaymentRequest *)objc_alloc_init(MEMORY[0x1E4F84DF0]);
    paymentRequest = v20->_paymentRequest;
    v20->_paymentRequest = v30;

    v32 = v20->_paymentRequest;
    v33 = [v29 merchantIdentifier];
    [(PKPeerPaymentRequest *)v32 setMerchantIdentifier:v33];

    v34 = v20->_paymentRequest;
    v35 = [v29 supportedNetworks];
    [(PKPeerPaymentRequest *)v34 setSupportedNetworks:v35];

    -[PKPeerPaymentRequest setMerchantCapabilities:](v20->_paymentRequest, "setMerchantCapabilities:", [v29 merchantCapabilities]);
    v36 = v20->_paymentRequest;
    v37 = (void *)MEMORY[0x1E4F1CAD0];
    v38 = [(PKPeerPaymentController *)v20->_peerPaymentController account];
    v39 = [v38 countryCode];
    v40 = [v37 setWithObject:v39];
    [(PKPeerPaymentRequest *)v36 setSupportedCountries:v40];

    if (v18)
    {
      objc_storeStrong((id *)&v20->_remoteMessagesComposer, obj);
      [(PKPeerPaymentRemoteMessagesComposer *)v20->_remoteMessagesComposer setActionType:2];
    }
    else
    {
      v41 = [[PKPeerPaymentRemoteMessagesComposer alloc] initWithPeerPaymentController:v20->_peerPaymentController presentingViewController:v20 actionType:2 sourceType:0];
      remoteMessagesComposer = v20->_remoteMessagesComposer;
      v20->_remoteMessagesComposer = v41;
    }
    uint64_t v43 = [MEMORY[0x1E4F84E00] sharedInstance];
    peerPaymentService = v20->_peerPaymentService;
    v20->_peerPaymentService = (PKPeerPaymentService *)v43;

    [(PKPeerPaymentService *)v20->_peerPaymentService registerObserver:v20];
    [(PKDynamicCollectionViewController *)v20 setUseItemIdentityWhenUpdating:1];
    unint64_t mode = v20->_mode;
    if (!mode || mode == 2)
    {
      v20->_allowEdits = 0;
    }
    else if (mode == 1)
    {
      v20->_allowEdits = 1;
      v46 = [MEMORY[0x1E4F84898] sharedInstance];
      v47 = [v84 associatedPassUniqueID];
      v48 = [v46 passWithUniqueID:v47];
      v49 = [v48 paymentPass];

      objc_msgSend(*p_recurringPayment, "setUsesAppleCashBalance:", (objc_msgSend(v49, "settings") & 0x800) == 0);
    }
    v50 = [PKPeerPaymentRecurringPaymentDetailAmountSectionController alloc];
    v51 = [*p_recurringPayment amount];
    v52 = [*p_recurringPayment currency];
    uint64_t v53 = [(PKPeerPaymentRecurringPaymentDetailAmountSectionController *)v50 initWithAmount:v51 currency:v52 delegate:v20];
    amountSectionController = v20->_amountSectionController;
    v20->_amountSectionController = (PKPeerPaymentRecurringPaymentDetailAmountSectionController *)v53;

    v55 = [PKDashboardMessageSectionController alloc];
    v56 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v20 _dashboardMessages];
    uint64_t v57 = [(PKDashboardMessageSectionController *)v55 initWithMessages:v56 delegate:v20];
    messageSectionController = v20->_messageSectionController;
    v20->_messageSectionController = (PKDashboardMessageSectionController *)v57;

    v59 = [PKPeerPaymentRecurringPaymentDetailSectionController alloc];
    id v60 = *p_recurringPayment;
    v61 = [v29 productTimeZone];
    uint64_t v62 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)v59 initWithRecurringPayment:v60 productTimeZone:v61 mode:v20->_mode delegate:v20];
    detailSectionController = v20->_detailSectionController;
    v20->_detailSectionController = (PKPeerPaymentRecurringPaymentDetailSectionController *)v62;

    v64 = v20->_detailSectionController;
    v65 = [v29 frequencyOptions];
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)v64 setFrequencyOptions:v65];

    [(PKPeerPaymentRecurringPaymentDetailSectionController *)v20->_detailSectionController setIsEditable:v20->_allowEdits];
    v66 = [PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController alloc];
    v67 = [*p_recurringPayment fundingSource];
    v68 = [v67 name];
    uint64_t v69 = -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController initWithFundingSource:useAppleCashBalance:delegate:](v66, "initWithFundingSource:useAppleCashBalance:delegate:", v68, [*p_recurringPayment usesAppleCashBalance], v20);
    fundingSourceSectionController = v20->_fundingSourceSectionController;
    v20->_fundingSourceSectionController = (PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *)v69;

    [(PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *)v20->_fundingSourceSectionController setIsEditable:v20->_allowEdits];
    if ((PKIsVision() & 1) == 0)
    {
      char v71 = [*p_recurringPayment actions];
      uint64_t v72 = [*p_recurringPayment status];
      if (v71)
      {
        v73 = [[PKPeerPaymentRecurringPaymentDetailActionSectionController alloc] initWithAction:1 delegate:v20];
        pauseSectionController = v20->_pauseSectionController;
        v20->_pauseSectionController = v73;

        [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)v20->_pauseSectionController setStatus:v72];
      }
      if ((v71 & 2) != 0)
      {
        v75 = [[PKPeerPaymentRecurringPaymentDetailActionSectionController alloc] initWithAction:2 delegate:v20];
        cancelSectionController = v20->_cancelSectionController;
        v20->_cancelSectionController = v75;

        [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)v20->_cancelSectionController setStatus:v72];
      }
    }
    v77 = [PKPeerPaymentRecurringPaymentMemoSectionController alloc];
    v78 = [*p_recurringPayment memo];
    v79 = [(CNComposeRecipient *)v20->_recipient contact];
    uint64_t v80 = [(PKPeerPaymentRecurringPaymentMemoSectionController *)v77 initWithRecurringPaymentMemo:v78 contact:v79 delegate:v20];
    memoSectionController = v20->_memoSectionController;
    v20->_memoSectionController = (PKPeerPaymentRecurringPaymentMemoSectionController *)v80;

    [(PKPeerPaymentRecurringPaymentMemoSectionController *)v20->_memoSectionController setIsEditable:v20->_allowEdits];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v20 _updateSections];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v20 _setUpNavigationBar];
    v82 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v82 addObserver:v20 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v82 addObserver:v20 selector:sel__keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v82 addObserver:v20 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

    id v15 = v86;
    id v17 = v85;
  }

  return v20;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  [(PKPeerPaymentRecurringPaymentDetailViewController *)&v4 dealloc];
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateBarButtonItems];
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    [(PKPeerPaymentRecurringPaymentDetailViewController *)self _setUpNavigationBar];
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  [(PKDynamicCollectionViewController *)&v4 viewDidLoad];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self _configureAvatarView];
  v3 = [(PKDynamicCollectionViewController *)self collectionView];
  [v3 setKeyboardDismissMode:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  [(PKDynamicCollectionViewController *)&v7 viewWillAppear:a3];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self _setUpNavigationBar];
  uint64_t v4 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self overrideUserInterfaceStyle];
  v5 = [(PKDynamicCollectionViewController *)self collectionView];
  if (v4 == 2) {
    +[PKPeerPaymentTheme backgroundColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v6];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  [(PKDynamicCollectionViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self view];
  uint64_t v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v3 bounds];
  if (self->_keyboardVisible) {
    double v13 = fmax(v11 + v12 - self->_keyboardFrame.origin.y, 0.0);
  }
  else {
    double v13 = 0.0;
  }
  objc_msgSend(v4, "setContentInset:", v6, v8, v13, v10);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentRecurringPaymentDetailViewController;
  [(PKPeerPaymentRecurringPaymentDetailViewController *)&v10 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      double v9 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _pendingRecurringPayment];
      [v8 recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:v9];
    }
  }
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v4 = *(double *)(v2 + 1136);
  CGFloat v3 = *(double *)(v2 + 1144);
  CGFloat v6 = *(double *)(v2 + 1152);
  CGFloat v5 = *(double *)(v2 + 1160);
  *(unsigned char *)(v2 + 1168) = 1;
  char v7 = *(void **)(a1 + 40);
  if (v7)
  {
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  id v16 = [*(id *)(a1 + 32) view];
  id v17 = [v16 window];

  id v18 = *(double **)(a1 + 32);
  v19 = v18 + 142;
  if (v17)
  {
    v20 = [v18 view];
    objc_msgSend(v17, "convertRect:fromWindow:", 0, v9, v11, v13, v15);
    objc_msgSend(v20, "convertRect:fromView:", 0);
    *(void *)v19 = v21;
    *((void *)v19 + 1) = v22;
    *((void *)v19 + 2) = v23;
    *((void *)v19 + 3) = v24;
  }
  else
  {
    double *v19 = v9;
    v18[143] = v11;
    v18[144] = v13;
    v18[145] = v15;
  }
  v27.origin.x = v4;
  v27.origin.y = v3;
  v27.size.width = v6;
  v27.size.height = v5;
  BOOL v25 = !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1136), v27);

  return v25;
}

- (void)_keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __73__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __73__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(double **)(a1 + 32);
  CGFloat v4 = v2[142];
  CGFloat v3 = v2[143];
  CGFloat v6 = v2[144];
  CGFloat v5 = v2[145];
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 40) CGRectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v2 = *(double **)(a1 + 32);
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v15 = [v2 view];
  id v16 = [v15 window];

  id v17 = *(double **)(a1 + 32);
  id v18 = v17 + 142;
  if (v16)
  {
    v19 = [v17 view];
    objc_msgSend(v16, "convertRect:fromWindow:", 0, v8, v10, v12, v14);
    objc_msgSend(v19, "convertRect:fromView:", 0);
    *(void *)id v18 = v20;
    *((void *)v18 + 1) = v21;
    *((void *)v18 + 2) = v22;
    *((void *)v18 + 3) = v23;
  }
  else
  {
    double *v18 = v8;
    v17[143] = v10;
    v17[144] = v12;
    v17[145] = v14;
  }
  v26.origin.x = v4;
  v26.origin.y = v3;
  v26.size.width = v6;
  v26.size.height = v5;
  BOOL v24 = !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1136), v26);

  return v24;
}

- (void)_keyboardWillHide:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E59CADE0;
  v3[4] = self;
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateLayoutForKeyboardAction:v3];
}

BOOL __71__PKPeerPaymentRecurringPaymentDetailViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1136);
  *(unsigned char *)(v1 + 1168) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1136);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *uint64_t v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1136);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1144);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1152);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1160);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self viewIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        double v7 = (void *)MEMORY[0x1E4FB1EB0];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __84__PKPeerPaymentRecurringPaymentDetailViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E59CA7D0;
        id v9 = v6;
        [v7 _animateUsingDefaultTimingWithOptions:134 animations:v8 completion:0];
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __84__PKPeerPaymentRecurringPaymentDetailViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateSections
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PKPeerPaymentRecurringPaymentDetailViewController__updateSections__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __68__PKPeerPaymentRecurringPaymentDetailViewController__updateSections__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v14 = WeakRetained;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v14[132] status] == 2) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    id v3 = [MEMORY[0x1E4FB1618] labelColor];
    }
    uint64_t v4 = v14;
    if (v14[157] == (id)1)
    {
      [v14[149] setHideAmount:1];
      [v2 addObject:v14[147]];
      uint64_t v4 = v14;
    }
    if ([v4 _shouldShowDashboardMessages])
    {
      id v5 = v14[148];
      uint64_t v6 = [v14 _dashboardMessages];
      [v5 updateWithMessages:v6 currentMessageIndex:0];

      [v2 addObject:v14[148]];
    }
    [v14[149] updateWithRecurringPayment:v14[132]];
    [v14[149] setIsEditable:*((unsigned __int8 *)v14 + 1232)];
    [v14[149] setTitleColor:v3];
    [v2 addObject:v14[149]];
    if (v14[157] == (id)2)
    {
      [v14[149] setHideAmount:0];
      id v7 = v14[150];
      CGRect v8 = [v14[132] fundingSource];
      id v9 = [v8 name];
      [v7 setFundingSource:v9];

      objc_msgSend(v14[150], "setUseAppleCashBalance:", objc_msgSend(v14[132], "usesAppleCashBalance"));
      [v14[150] setIsEditable:*((unsigned __int8 *)v14 + 1232)];
      [v14[150] setTitleColor:v3];
      [v2 addObject:v14[150]];
    }
    [v14[153] setIsEditable:*((unsigned __int8 *)v14 + 1232)];
    [v14[153] setMemoTextColor:v3];
    id v10 = v14[153];
    double v11 = [v14[132] memo];
    [v10 setRecurringPaymentMemo:v11];

    [v2 addObject:v14[153]];
    double v12 = v14;
    id v13 = v14[151];
    if (v13 && !*((unsigned char *)v14 + 1232))
    {
      objc_msgSend(v13, "setStatus:", objc_msgSend(v14[132], "status"));
      [v2 addObject:v14[151]];
      double v12 = v14;
    }
    if (v12[152]) {
      objc_msgSend(v2, "addObject:");
    }
    [v14 setSections:v2 animated:1];
    [v14 _updateDetailSectionFooter];
    [v14 _updatePauseSectionFooter];
    [v14 _updateCancelSectionFooter];

    id WeakRetained = v14;
  }
}

- (id)_composeRecipientForAddress:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [(PKAvatarView *)self->_avatarView descriptorForRequiredKeys];
    CGRect v8 = (void *)v7;
    if (v7)
    {
      v27[0] = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v6 addObjectsFromArray:v9];
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v5 keysToFetch:v6];
    double v11 = [v10 contactForHandle:v4];
    double v12 = [MEMORY[0x1E4F84D50] sharedService];
    id v13 = [v12 context];
    double v14 = [v13 configuration];
    double v15 = [v14 contactFormatConfiguration];

    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v15];
    if ([v16 emailAddressIsValid:v4])
    {
      uint64_t v17 = 0;
    }
    else
    {
      [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
      CGRect v26 = v12;
      v19 = v11;
      uint64_t v20 = v10;
      uint64_t v21 = v8;
      uint64_t v22 = v6;
      v24 = id v23 = v5;
      if ([v16 phoneNumberIsValid:v24 forCountryCode:0]) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = 5;
      }

      id v5 = v23;
      uint64_t v6 = v22;
      CGRect v8 = v21;
      id v10 = v20;
      double v11 = v19;
      double v12 = v26;
    }
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:v11 address:v4 kind:v17];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_configureAvatarView
{
  id v4 = [(CNComposeRecipient *)self->_recipient contact];
  if (v4)
  {
    [(PKAvatarView *)self->_avatarView setShowsName:self->_mode == 2];
    [(PKAvatarView *)self->_avatarView setContact:v4];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v3 setContactType:0];
    [(PKAvatarView *)self->_avatarView setContact:v3];
  }
}

- (void)_setUpNavigationBar
{
  id v4 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self navigationItem];
  [v4 setBackButtonDisplayMode:2];
  if (self->_context != 9)
  {
    id v3 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self navigationItem];
    [v3 setTitleView:self->_avatarView];
  }
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateBarButtonItems];
}

- (void)_updateBarButtonItems
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__PKPeerPaymentRecurringPaymentDetailViewController__updateBarButtonItems__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __74__PKPeerPaymentRecurringPaymentDetailViewController__updateBarButtonItems__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v20 = WeakRetained;
    if (*((unsigned char *)WeakRetained + 1121))
    {
      id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v2 startAnimating];
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v2];

      BOOL v4 = 0;
      id v5 = 0;
      uint64_t v6 = 0;
LABEL_29:
      [v3 setEnabled:v4];
      id v18 = [v20 navigationItem];
      [v18 setRightBarButtonItem:v3];
      if (v5) {
        v19 = v5;
      }
      else {
        v19 = 0;
      }
      [v18 setLeftBarButtonItem:v19];
      [v18 setHidesBackButton:v5 != 0];

      id WeakRetained = v20;
      goto LABEL_33;
    }
    id v7 = WeakRetained[157];
    if (v7 != (id)2)
    {
      if (v7 == (id)1)
      {
        uint64_t v6 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_0.isa);
        CGRect v8 = [v20[149] amount];
        id v9 = [v8 amount];

        BOOL v4 = v9 && [v20[155] compare:v9] != 1 && objc_msgSend(v20[156], "compare:", v9) != -1;
        if (*((unsigned char *)v20 + 1233))
        {
          id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
          double v14 = PKLocalizedString(&cfstr_Cancel.isa);
          id v5 = (void *)[v13 initWithTitle:v14 style:0 target:v20 action:sel__dismissViewController_];
        }
        else
        {
          id v5 = 0;
        }
        uint64_t v12 = 2;
        goto LABEL_25;
      }
LABEL_10:
      id v5 = 0;
      id v3 = 0;
      uint64_t v6 = 0;
      BOOL v4 = 1;
      goto LABEL_29;
    }
    if (PKIsVision()) {
      goto LABEL_10;
    }
    if (*((unsigned char *)v20 + 1232))
    {
      uint64_t v6 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_1.isa);
      id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
      double v11 = PKLocalizedString(&cfstr_Cancel.isa);
      id v5 = (void *)[v10 initWithTitle:v11 style:0 target:v20 action:sel__cancelEdits_];
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v6 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_2.isa);
      double v15 = v20;
      if (!*((unsigned char *)v20 + 1233))
      {
        uint64_t v12 = 0;
        id v5 = 0;
        goto LABEL_21;
      }
      id v16 = objc_alloc(MEMORY[0x1E4FB14A8]);
      double v11 = PKLocalizedString(&cfstr_Cancel.isa);
      id v5 = (void *)[v16 initWithTitle:v11 style:0 target:v20 action:sel__dismissViewController_];
      uint64_t v12 = 0;
    }

    double v15 = v20;
LABEL_21:
    uint64_t v17 = [v15[149] amount];
    id v9 = [v17 amount];

    BOOL v4 = v9 && [v20[155] compare:v9] != 1 && objc_msgSend(v20[156], "compare:", v9) != -1;
LABEL_25:

    if (v6 && [v20[132] status] != 2) {
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v6 style:v12 target:v20 action:sel__rightBarButtonPressed_];
    }
    else {
      id v3 = 0;
    }
    goto LABEL_29;
  }
LABEL_33:
}

- (void)_updateDetailSectionFooter
{
  objc_initWeak(&location, self);
  if (self->_mode == 1)
  {
    id v3 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController startDate];
    BOOL v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v5 = [v4 isDateInToday:v3];

    detailSectionController = self->_detailSectionController;
    if (v5)
    {
      switch([(PKPeerPaymentRecurringPaymentDetailSectionController *)detailSectionController frequency])
      {
        case 1uLL:
        case 2uLL:
          goto LABEL_4;
        case 3uLL:
          double v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          uint64_t v12 = [v11 component:16 fromDate:v3];

          PKOrdinalStringForInteger();
          id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString();
          if (v12 > 28) {
            CGRect v8 = {;
          }
            PKLocalizedPeerPaymentRecurringString(&cfstr_CreateFrequenc_2.isa, &stru_1EF1B5310.isa, v7, v8);
          }
          else {
            CGRect v8 = {;
          }
            PKLocalizedPeerPaymentRecurringString(&cfstr_CreateFrequenc_1.isa, &stru_1EF1B5310.isa, v7, v8);
          }
          goto LABEL_10;
        case 4uLL:
          id v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_CreateFrequenc_3.isa);
          break;
        default:
          goto LABEL_7;
      }
    }
    else
    {
      switch([(PKPeerPaymentRecurringPaymentDetailSectionController *)detailSectionController frequency])
      {
        case 1uLL:
        case 2uLL:
LABEL_4:
          PKLocalizedWeekdaySpecificStringKeyForKey();
          id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          CGRect v8 = PKMediumDateString();
          uint64_t v9 = PKLocalizedPeerPaymentRecurringString(v7, &stru_1EF1B4C70.isa, v8);
          goto LABEL_17;
        case 3uLL:
          id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          uint64_t v14 = [v13 component:16 fromDate:v3];

          PKOrdinalStringForInteger();
          id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKMediumDateString();
          if (v14 > 28) {
            CGRect v8 = {;
          }
            PKLocalizedPeerPaymentRecurringString(&cfstr_CreateFrequenc_7.isa, &stru_1EF1B5310.isa, v7, v8);
          }
          else {
            CGRect v8 = {;
          }
            PKLocalizedPeerPaymentRecurringString(&cfstr_CreateFrequenc_6.isa, &stru_1EF1B5310.isa, v7, v8);
          }
          uint64_t v9 = LABEL_10:;
LABEL_17:
          id v10 = (void *)v9;

          goto LABEL_18;
        case 4uLL:
          PKMediumDateString();
          id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          id v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_CreateFrequenc_8.isa, &stru_1EF1B4C70.isa, v7);
LABEL_18:

          break;
        default:
LABEL_7:
          id v10 = 0;
          break;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  [(PKDynamicListSectionController *)self->_detailSectionController setFooterText:v10];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPeerPaymentRecurringPaymentDetailViewController__updateDetailSectionFooter__block_invoke;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v16, &location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __79__PKPeerPaymentRecurringPaymentDetailViewController__updateDetailSectionFooter__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v2 = [WeakRetained[149] identifiers];
    id v3 = [v2 firstObject];
    [v4 reconfigureHeaderAndFooterForSectionIdentifier:v3];

    id WeakRetained = v4;
  }
}

- (void)_updatePauseSectionFooter
{
  if (self->_pauseSectionController)
  {
    objc_initWeak(&location, self);
    if ([(PKPeerPaymentRecurringPayment *)self->_recurringPayment status] == 2)
    {
      id v3 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _recipientName];
      BOOL v4 = PKLocalizedPeerPaymentRecurringString(&cfstr_PauseSectionFo.isa, &stru_1EF1B4C70.isa, v3);
    }
    else
    {
      BOOL v4 = 0;
    }
    [(PKDynamicListSectionController *)self->_pauseSectionController setFooterText:v4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PKPeerPaymentRecurringPaymentDetailViewController__updatePauseSectionFooter__block_invoke;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __78__PKPeerPaymentRecurringPaymentDetailViewController__updatePauseSectionFooter__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    [WeakRetained reloadDataForSection:WeakRetained[151] animated:1];
    id v2 = [v4[151] identifiers];
    id v3 = [v2 firstObject];
    [v4 reconfigureHeaderAndFooterForSectionIdentifier:v3];

    id WeakRetained = v4;
  }
}

- (void)_updateCancelSectionFooter
{
  if (self->_cancelSectionController)
  {
    objc_initWeak(&location, self);
    if ([(PKPeerPaymentRecurringPayment *)self->_recurringPayment status] == 1)
    {
      id v3 = PKLocalizedPeerPaymentRecurringString(&cfstr_CancelSectionF.isa);
    }
    else
    {
      id v3 = 0;
    }
    [(PKDynamicListSectionController *)self->_cancelSectionController setFooterText:v3];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __79__PKPeerPaymentRecurringPaymentDetailViewController__updateCancelSectionFooter__block_invoke;
    v4[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);

    objc_destroyWeak(&location);
  }
}

void __79__PKPeerPaymentRecurringPaymentDetailViewController__updateCancelSectionFooter__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v2 = [WeakRetained[152] identifiers];
    id v3 = [v2 firstObject];
    [v4 reconfigureHeaderAndFooterForSectionIdentifier:v3];

    id WeakRetained = v4;
  }
}

- (void)_cancelEdits:(id)a3
{
  id v4 = a3;
  self->_allowEdits = 0;
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKPeerPaymentRecurringPaymentDetailViewController__cancelEdits___block_invoke;
  v6[3] = &unk_1E59CB088;
  objc_copyWeak(&v7, &location);
  [(PKPeerPaymentService *)peerPaymentService recurringPaymentsWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__PKPeerPaymentRecurringPaymentDetailViewController__cancelEdits___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _reloadWithPayments:v5];
  }
}

- (void)_dismissViewController:(id)a3
{
  id v3 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_rightBarButtonPressed:(id)a3
{
  id v4 = a3;
  if (self->_performingAction) {
    goto LABEL_2;
  }
  [(PKPeerPaymentRecurringPaymentDetailViewController *)self setShowActivityIndicator:1];
  self->_performingAction = 1;
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_6;
    v19[3] = &unk_1E59CB100;
    objc_copyWeak(&v20, &location);
    [(PKPeerPaymentRecurringPaymentDetailViewController *)self _processEditsIfNeededWithCompletion:v19];
    uint64_t v14 = &v20;
    goto LABEL_10;
  }
  if (mode != 1)
  {
    self->_performingAction = 0;
    [(PKPeerPaymentRecurringPaymentDetailViewController *)self setShowActivityIndicator:0];
    goto LABEL_2;
  }
  if (self->_context == 9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained) {
      goto LABEL_2;
    }
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      goto LABEL_2;
    }
    objc_initWeak(&location, self);
    id v10 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _pendingRecurringPayment];
    recurringPayment = self->_recurringPayment;
    self->_recurringPayment = v10;

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    id v13 = self->_recurringPayment;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke;
    v24[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v25, &location);
    [v12 stageRecurringPayment:v13 completion:v24];

    uint64_t v14 = &v25;
LABEL_10:
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
    goto LABEL_2;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_2;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  double v15 = (void (**)(void))_Block_copy(aBlock);
  id v16 = [(PKPeerPaymentController *)self->_peerPaymentController recipient];

  if (v16)
  {
    v15[2](v15);
  }
  else
  {
    remoteMessagesComposer = self->_remoteMessagesComposer;
    id v18 = [(CNComposeRecipient *)self->_recipient address];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_5;
    v21[3] = &unk_1E59CA9F8;
    uint64_t v22 = v15;
    [(PKPeerPaymentRemoteMessagesComposer *)remoteMessagesComposer validateRecipientWithAddress:v18 completion:v21];
  }
LABEL_2:
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1120] = 0;
    id v2 = WeakRetained;
    [WeakRetained setShowActivityIndicator:0];
    id WeakRetained = v2;
  }
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) _pendingRecurringPayment];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1056);
  *(void *)(v3 + 1056) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1104);
  uint64_t v7 = *(void *)(v5 + 1056);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_3;
  v8[3] = &unk_1E59CB100;
  objc_copyWeak(&v9, &location);
  [v6 presentRemoteMessageComposerWithRecurringPayment:v7 overViewController:v5 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_3(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_4;
  v3[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(unsigned char *)(a1 + 40))
    {
      [WeakRetained _didCompleteSetupFlow];
    }
    else
    {
      uint64_t v3 = [WeakRetained presentingViewController];
      [v3 dismissViewControllerAnimated:1 completion:0];
    }
    v4[1120] = 0;
    [v4 setShowActivityIndicator:0];
    id WeakRetained = v4;
  }
}

uint64_t __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_5(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __76__PKPeerPaymentRecurringPaymentDetailViewController__rightBarButtonPressed___block_invoke_6(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (a2)
    {
      WeakRetained[1232] ^= 1u;
      [WeakRetained _updateSections];
      [v4 _updateBarButtonItems];
      id WeakRetained = v4;
    }
    WeakRetained[1120] = 0;
    [v4 setShowActivityIndicator:0];
    id WeakRetained = v4;
  }
}

- (void)_processEditsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = (void (**)(void, void))v4;
  if (self->_allowEdits)
  {
    objc_initWeak(&location, self);
    id v6 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _pendingRecurringPayment];
    uint64_t v7 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment memo];
    id v8 = v7;
    if (v7) {
      id v30 = v7;
    }
    else {
      id v30 = objc_alloc_init(MEMORY[0x1E4F84DE8]);
    }

    id v9 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment fundingSource];
    id v10 = [v9 fpanIdentifier];
    double v11 = [v6 fundingSource];
    id v12 = [v11 fpanIdentifier];
    id v13 = v10;
    id v14 = v12;
    double v15 = v14;
    if (v13 == v14)
    {
    }
    else
    {
      if (!v13 || !v14)
      {

LABEL_15:
        int v18 = 1;
LABEL_16:

        v19 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment amount];
        id v20 = [v6 amount];
        if (![v19 compare:v20])
        {
          uint64_t v21 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment upcomingPaymentDates];
          uint64_t v22 = [v21 firstObject];
          id v23 = [v6 startDate];
          if (PKEqualObjects())
          {
            uint64_t v24 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment frequency];
            if (v24 == [v6 frequency])
            {
              id v25 = [v6 memo];
              char v29 = PKEqualObjects();

              if (v29)
              {
                if (!v18)
                {
                  if (v5) {
                    v5[2](v5, 1);
                  }
                  goto LABEL_26;
                }
                CGRect v26 = v31;
                v31[0] = MEMORY[0x1E4F143A8];
                v31[1] = 3221225472;
                v31[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_4;
                v31[3] = &unk_1E59CAE30;
                CGRect v27 = &v33;
                objc_copyWeak(&v33, &location);
                v32 = v5;
                v31[4] = v6;
                [(PKPeerPaymentRecurringPaymentDetailViewController *)self _validatePaymentEditsWithCompletion:v31];
                v28 = (id *)&v32;
LABEL_25:

                objc_destroyWeak(v27);
LABEL_26:

                objc_destroyWeak(&location);
                goto LABEL_27;
              }
LABEL_24:
              CGRect v26 = v34;
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke;
              v34[3] = &unk_1E59CAE58;
              CGRect v27 = &v36;
              objc_copyWeak(&v36, &location);
              v35 = v5;
              v34[4] = v6;
              v34[5] = self;
              [(PKPeerPaymentRecurringPaymentDetailViewController *)self _validatePaymentEditsWithCompletion:v34];
              v28 = (id *)&v35;
              goto LABEL_25;
            }
          }
        }
        goto LABEL_24;
      }
      int v16 = [v13 isEqualToString:v14];

      if (!v16) {
        goto LABEL_15;
      }
    }
    int v17 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment usesAppleCashBalance];
    int v18 = v17 ^ [v6 usesAppleCashBalance];
    goto LABEL_16;
  }
  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
LABEL_27:
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (a2 & 1) != 0)
  {
    id v6 = [*(id *)(a1 + 32) fundingSource];
    uint64_t v7 = [v6 fpanIdentifier];
    id v8 = [*(id *)(*(void *)(a1 + 40) + 1080) primaryAccountIdentifier];
    id v9 = v7;
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      double v11 = v10;
      if (v9 && v10)
      {
        char v12 = [v9 isEqualToString:v10];

        if (v12) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      id v14 = *(void **)(a1 + 32);
      id v6 = [MEMORY[0x1E4F84DE0] fundingSourceWithPass:*((void *)WeakRetained + 135)];
      [v14 setFundingSource:v6];
    }

LABEL_14:
    objc_msgSend(*((id *)WeakRetained + 137), "updatePreservePeerPaymentBalanceSetting:", objc_msgSend(*(id *)(a1 + 32), "usesAppleCashBalance") ^ 1);
    double v15 = (void *)*((void *)WeakRetained + 138);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_2;
    v18[3] = &unk_1E59CAE30;
    objc_copyWeak(&v21, v4);
    id v20 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 32);
    [v15 presentRemoteMessageComposerWithRecurringPayment:v16 overViewController:v17 completion:v18];

    objc_destroyWeak(&v21);
    goto LABEL_15;
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
  }
LABEL_15:
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_2(id *a1, int a2)
{
  id v4 = a1 + 6;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2) {
      objc_storeStrong(WeakRetained + 132, a1[4]);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_3;
    block[3] = &unk_1E59CAE08;
    objc_copyWeak(&v10, v4);
    id v9 = a1[5];
    char v11 = a2;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v10);
  }
  else
  {
    uint64_t v7 = (void (**)(id, void))a1[5];
    if (v7) {
      v7[2](v7, 0);
    }
  }
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v4 = [WeakRetained presentedViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    uint64_t v3 = v6;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(unsigned __int8 *)(a1 + 48));
      uint64_t v3 = v6;
    }
  }
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_4(id *a1, char a2)
{
  id v4 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && (a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_5;
    v7[3] = &unk_1E59CAE30;
    objc_copyWeak(&v10, v4);
    id v9 = a1[5];
    id v8 = a1[4];
    [WeakRetained _authorizeRecurringPaymentWithCompletion:v7];

    objc_destroyWeak(&v10);
  }
  else
  {
    id v6 = (void (**)(id, void))a1[5];
    if (v6) {
      v6[2](v6, 0);
    }
  }
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__processEditsIfNeededWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  uint64_t v7 = WeakRetained;
  if (WeakRetained && a2)
  {
    objc_storeStrong(WeakRetained + 132, *(id *)(a1 + 32));
    uint64_t v5 = v7;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id *))(v6 + 16))(v6, a2, v5);
    uint64_t v5 = v7;
  }
}

- (void)_validatePaymentEditsWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CAD18;
  aBlock[4] = self;
  id v5 = v4;
  id v44 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  if (self->_selectedPass)
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
  else
  {
    id v30 = [MEMORY[0x1E4F84898] sharedInstance];
    id v8 = [v30 _defaultPaymentPassForPaymentRequest:self->_paymentRequest];
    uint64_t v9 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment status];
    id v10 = @"DEBIT_CARD_REQUIRED_MESSAGE_EDIT_SELECT_CARD";
    if (!v8) {
      id v10 = @"DEBIT_CARD_REQUIRED_MESSAGE_EDIT_NO_CARDS";
    }
    char v11 = @"DEBIT_CARD_REQUIRED_MESSAGE_RESUME_SELECT_CARD";
    if (v8)
    {
      char v12 = @"DEBIT_CARD_REQUIRED_ACTION_CONTINUE";
    }
    else
    {
      char v11 = @"DEBIT_CARD_REQUIRED_MESSAGE_RESUME_NO_CARDS";
      char v12 = @"DEBIT_CARD_REQUIRED_ACTION_ADD_CARD";
    }
    if (v9 == 2) {
      id v10 = v11;
    }
    v31 = v5;
    uint64_t v13 = v10;
    int IsBridge = PKPaymentSetupContextIsBridge();
    double v15 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v16 = v12;
    uint64_t v17 = PKLocalizedPeerPaymentRecurringString(&cfstr_DebitCardRequi_5.isa);
    PKDeviceSpecificLocalizedStringKeyForKey(v13, IsBridge);
    int v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v19 = PKLocalizedPeerPaymentRecurringString(v18);
    id v20 = [v15 alertControllerWithTitle:v17 message:v19 preferredStyle:1];

    id v21 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v22 = PKLocalizedPeerPaymentRecurringString(v16);

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_3;
    v38[3] = &unk_1E59CAE80;
    id v39 = v8;
    v40 = self;
    id v41 = v7;
    id v23 = v31;
    id v42 = v23;
    id v24 = v8;
    id v25 = [v21 actionWithTitle:v22 style:0 handler:v38];

    CGRect v26 = (void *)MEMORY[0x1E4FB1410];
    CGRect v27 = PKLocalizedPeerPaymentRecurringString(&cfstr_DebitCardRequi_6.isa);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_4;
    v36[3] = &unk_1E59CB150;
    id v37 = v23;
    v28 = [v26 actionWithTitle:v27 style:1 handler:v36];

    [v20 addAction:v25];
    [v20 addAction:v28];
    [v20 setPreferredAction:v25];
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_5;
    block[3] = &unk_1E59CB010;
    objc_copyWeak(&v34, &location);
    id v33 = v20;
    id v29 = v20;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

    id v5 = v31;
  }
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1104);
  id v4 = [*(id *)(v2 + 1072) address];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E59CA9F8;
  id v6 = *(id *)(a1 + 40);
  [v3 validateRecipientWithAddress:v4 completion:v5];
}

uint64_t __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_3(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = (id *)a1[5];
  if (v3)
  {
    objc_storeStrong(v2 + 135, v3);
    id v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
  else
  {
    [v2 _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
    uint64_t result = a1[7];
    if (result)
    {
      id v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  return result;
}

uint64_t __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __89__PKPeerPaymentRecurringPaymentDetailViewController__validatePaymentEditsWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
    id WeakRetained = v3;
  }
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v8 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v10[3] = &unk_1E59CAEA8;
      v10[4] = v3;
      id v11 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v10];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      id v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      id v9 = [v3 navigationController];
      [v9 presentViewController:v8 animated:1 completion:0];
    }
  }
}

void __108__PKPeerPaymentRecurringPaymentDetailViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:self->_context];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];

  return v5;
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v3 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_authorizeRecurringPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController amount];
  objc_initWeak(&location, self);
  BOOL v6 = [(PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *)self->_fundingSourceSectionController useAppleCashBalance];
  if (v6) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [(PKPeerPaymentController *)self->_peerPaymentController updatePreservePeerPaymentBalanceSetting:!v6];
  [(PKPeerPaymentController *)self->_peerPaymentController selectMode:1];
  peerPaymentController = self->_peerPaymentController;
  selectedPass = self->_selectedPass;
  id v10 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment identifier];
  unint64_t v11 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController frequency];
  char v12 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController startDate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v14[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke;
  v14[3] = &unk_1E59CAF70;
  objc_copyWeak(&v16, &location);
  id v13 = v4;
  id v15 = v13;
  [(PKPeerPaymentController *)peerPaymentController quoteWithAmount:v5 source:3 requestToken:0 alternateFundingSource:selectedPass preserveCurrentBalance:v7 recurringPaymentIdentifier:v10 frequency:v11 startDate:v12 threshold:0 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: quoteWithAmount successful", buf, 2u);
      }

      unint64_t v11 = (void *)WeakRetained[137];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_165;
      v16[3] = &unk_1E59CAF48;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      id v17 = *(id *)(a1 + 32);
      [v11 performQuote:v7 completion:v16];

      objc_destroyWeak(&v18);
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_2;
      v13[3] = &unk_1E59CAF20;
      id v14 = *(id *)(a1 + 32);
      char v15 = 0;
      [WeakRetained _showAlertForError:v8 completion:v13];
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
}

void __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_165(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v18 = a2;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: performQuote completed with success: %d", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11)
      {
        uint64_t v12 = *(void (**)(void))(v11 + 16);
LABEL_11:
        v12();
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (v8)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      id v14[2] = __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_166;
      v14[3] = &unk_1E59CAF20;
      id v15 = *(id *)(a1 + 32);
      char v16 = 0;
      [WeakRetained _showAlertForError:v8 completion:v14];

      goto LABEL_12;
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    uint64_t v12 = *(void (**)(void))(v13 + 16);
    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_166(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __94__PKPeerPaymentRecurringPaymentDetailViewController__authorizeRecurringPaymentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_showConfirmationAlertIfNeededForAction:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    id v21 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v22 = PKLocalizedPeerPaymentRecurringString(&cfstr_CancelAlertTit.isa);
    id v23 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _recipientName];
    id v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_CancelAlertMes.isa, &stru_1EF1B4C70.isa, v23);
    uint64_t v11 = [v21 alertControllerWithTitle:v22 message:v24 preferredStyle:1];

    id v25 = (void *)MEMORY[0x1E4FB1410];
    CGRect v26 = PKLocalizedPeerPaymentRecurringString(&cfstr_CancelAlertCon.isa);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_3;
    v37[3] = &unk_1E59CB150;
    id v14 = &v38;
    id v27 = v6;
    id v38 = v27;
    char v16 = [v25 actionWithTitle:v26 style:2 handler:v37];

    v28 = (void *)MEMORY[0x1E4FB1410];
    id v29 = PKLocalizedPeerPaymentRecurringString(&cfstr_CancelAlertCan.isa);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_4;
    v35[3] = &unk_1E59CB150;
    uint64_t v19 = &v36;
    id v36 = v27;
    id v20 = [v28 actionWithTitle:v29 style:1 handler:v35];

    [v11 addAction:v16];
    [v11 addAction:v20];
  }
  else
  {
    if (a3 != 1 || [(PKPeerPaymentRecurringPayment *)self->_recurringPayment status] != 1) {
      goto LABEL_8;
    }
    id v7 = (void *)MEMORY[0x1E4FB1418];
    id v8 = PKLocalizedPeerPaymentRecurringString(&cfstr_PauseAlertTitl.isa);
    id v9 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _recipientName];
    id v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_PauseAlertMess.isa, &stru_1EF1B4C70.isa, v9);
    uint64_t v11 = [v7 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v13 = PKLocalizedPeerPaymentRecurringString(&cfstr_PauseAlertConf.isa);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke;
    v41[3] = &unk_1E59CB150;
    id v14 = &v42;
    id v15 = v6;
    id v42 = v15;
    char v16 = [v12 actionWithTitle:v13 style:0 handler:v41];

    id v17 = (void *)MEMORY[0x1E4FB1410];
    int v18 = PKLocalizedPeerPaymentRecurringString(&cfstr_PauseAlertCanc.isa);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_2;
    v39[3] = &unk_1E59CB150;
    uint64_t v19 = &v40;
    id v40 = v15;
    id v20 = [v17 actionWithTitle:v18 style:1 handler:v39];

    [v11 addAction:v16];
    [v11 addAction:v20];
    [v11 setPreferredAction:v16];
  }

  if (v11)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_5;
    block[3] = &unk_1E59CB010;
    objc_copyWeak(&v33, &location);
    id v32 = v11;
    id v30 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

    goto LABEL_10;
  }
LABEL_8:
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
LABEL_10:
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __104__PKPeerPaymentRecurringPaymentDetailViewController__showConfirmationAlertIfNeededForAction_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
    id WeakRetained = v3;
  }
}

- (id)_recipientName
{
  id v3 = [(CNComposeRecipient *)self->_recipient contact];
  id v4 = [v3 givenName];

  if (!v4)
  {
    id v4 = [(CNComposeRecipient *)self->_recipient address];
  }

  return v4;
}

- (void)_showAlertForError:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F84D80] displayableErrorForError:a3];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke;
  v10[3] = &unk_1E59CB038;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F843E0] pageTagForAppleCashSenderError:*(void *)(a1 + 32)];
    [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:v3];
    id v4 = *(void **)(a1 + 32);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke_2;
    id v15 = &unk_1E59CAD18;
    id v5 = v3;
    id v16 = v5;
    id v17 = *(id *)(a1 + 40);
    id v10 = PKAlertForDisplayableErrorWithHandlers(v4, 0, &v12, 0);
    if (v10)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v10, 1, 0, v12, v13, v14, v15, v16);
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v6, v7, v8, v9);
      }
    }
  }
}

uint64_t __83__PKPeerPaymentRecurringPaymentDetailViewController__showAlertForError_completion___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F843E0] reportAppleCashSenderErrorPage:*(void *)(a1 + 32) buttonTag:*MEMORY[0x1E4F866D8]];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_didCompleteSetupFlow
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__PKPeerPaymentRecurringPaymentDetailViewController__didCompleteSetupFlow__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __74__PKPeerPaymentRecurringPaymentDetailViewController__didCompleteSetupFlow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained presentingViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PKPeerPaymentRecurringPaymentDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E59CB060;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(PKPeerPaymentService *)peerPaymentService updateRecurringPaymentsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __92__PKPeerPaymentRecurringPaymentDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_6;
  }
  if (v6)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: Failed to update recurring payments with error %@", (uint8_t *)&v13, 0xCu);
    }

LABEL_6:
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      uint64_t v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  [WeakRetained _reloadWithPayments:v5];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v11 = *(void (**)(void))(v12 + 16);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_reloadWithPayments:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_mode == 2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        uint64_t v12 = [v11 identifier];
        int v13 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment identifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v15 = v11;

      if (!v15) {
        goto LABEL_14;
      }
      id v5 = v16;
      if ([v15 status])
      {
        objc_storeStrong((id *)&self->_recurringPayment, v11);
        [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateSections];
        [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateBarButtonItems];
        goto LABEL_16;
      }
    }
    else
    {
LABEL_10:

      id v15 = 0;
LABEL_14:
      id v5 = v16;
    }
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PKPeerPaymentRecurringPaymentDetailViewController__reloadWithPayments___block_invoke;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v18, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
LABEL_16:
  }
}

void __73__PKPeerPaymentRecurringPaymentDetailViewController__reloadWithPayments___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

- (id)_pendingRecurringPayment
{
  id v3 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment fundingSource];
  if (self->_selectedPass)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F84DE0], "fundingSourceWithPass:");

    id v3 = (void *)v4;
  }
  id v5 = (void *)[(PKPeerPaymentRecurringPayment *)self->_recurringPayment copy];
  id v6 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController amount];
  uint64_t v7 = [v6 amount];
  [v5 setAmount:v7];

  uint64_t v8 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController startDate];
  [v5 setStartDate:v8];

  objc_msgSend(v5, "setFrequency:", -[PKPeerPaymentRecurringPaymentDetailSectionController frequency](self->_detailSectionController, "frequency"));
  uint64_t v9 = [(PKPeerPaymentRecurringPaymentMemoSectionController *)self->_memoSectionController recurringPaymentMemo];
  [v5 setMemo:v9];

  [v5 setFundingSource:v3];
  objc_msgSend(v5, "setUsesAppleCashBalance:", -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController useAppleCashBalance](self->_fundingSourceSectionController, "useAppleCashBalance"));

  return v5;
}

- (BOOL)_shouldShowDashboardMessages
{
  uint64_t v3 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment status];
  uint64_t v4 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment lastExecutedTransaction];
  id v5 = v4;
  if ((unint64_t)(v3 - 3) <= 1 && [v4 status] == 3) {
    int v6 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment lastExecutedTransactionAppearsInHistory] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_dashboardMessages
{
  uint64_t v3 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment lastExecutedTransaction];
  uint64_t v4 = [v3 errorCode];
  id v5 = [v3 executionDate];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v7 = objc_alloc_init(PKDashboardPassMessage);
  uint64_t v8 = [v3 identifier];
  [(PKDashboardPassMessage *)v7 setIdentifier:v8];

  uint64_t v9 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _titleForErrorCode:v4];
  [(PKDashboardPassMessage *)v7 setTitle:v9];

  uint64_t v10 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self _messageForErrorCode:v4 paymentDate:v5];
  [(PKDashboardPassMessage *)v7 setMessage:v10];

  if ([v3 exceedsAppleCashLimits])
  {
    uint64_t v11 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorLe.isa);
    [(PKDashboardPassMessage *)v7 setButtonTitle:v11];

    [(PKDashboardPassMessage *)v7 setActionOnButtonPress:&__block_literal_global_2];
  }
  uint64_t v12 = PKPassKitUIBundle();
  int v13 = [v12 URLForResource:@"MessageAlert" withExtension:@"pdf"];

  double v14 = PKUIScreenScale();
  id v15 = PKUIImageFromPDF(v13, 45.0, 45.0, v14);
  [(PKDashboardPassMessage *)v7 setImage:v15];
  [v6 addObject:v7];
  id v16 = (void *)[v6 copy];

  return v16;
}

void __71__PKPeerPaymentRecurringPaymentDetailViewController__dashboardMessages__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/en-us/HT207884"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

- (id)_titleForErrorCode:(unint64_t)a3
{
  if (a3 == 40338) {
    uint64_t v3 = @"PAYMENT_ERROR_PAYMENT_PAUSED_TITLE";
  }
  else {
    uint64_t v3 = @"PAYMENT_ERROR_PROBLEM_WITH_PAYMENT_TITLE";
  }
  uint64_t v4 = PKLocalizedPeerPaymentRecurringString(&v3->isa);

  return v4;
}

- (id)_messageForErrorCode:(unint64_t)a3 paymentDate:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0x9D91uLL:
    case 0x9D99uLL:
      uint64_t v7 = [(CNComposeRecipient *)self->_recipient contact];
      uint64_t v8 = [v7 givenName];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(CNComposeRecipient *)self->_recipient address];
      }
      uint64_t v11 = v10;

      double v14 = PKMediumDayAndMonthStringFromDate();
      uint64_t v12 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorIn.isa, &stru_1EF1B5770.isa, v14, v11);

      goto LABEL_15;
    case 0x9D92uLL:
      uint64_t v12 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorCo.isa);
      goto LABEL_16;
    case 0x9D93uLL:
      goto LABEL_8;
    case 0x9D94uLL:
      uint64_t v11 = PKMediumDayAndMonthStringFromDate();
      PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorCa_0.isa, &stru_1EF1B4C70.isa, v11);
      goto LABEL_14;
    case 0x9D95uLL:
      uint64_t v11 = PKMediumDayAndMonthStringFromDate();
      PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorRe.isa, &stru_1EF1B4C70.isa, v11);
      goto LABEL_14;
    case 0x9D96uLL:
      uint64_t v11 = PKMediumDayAndMonthStringFromDate();
      PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorHi.isa, &stru_1EF1B4C70.isa, v11);
      goto LABEL_14;
    case 0x9D97uLL:
      uint64_t v11 = PKMediumDayAndMonthStringFromDate();
      PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorGe.isa, &stru_1EF1B4C70.isa, v11);
      goto LABEL_14;
    case 0x9D98uLL:
      goto LABEL_7;
    default:
      if (a3 - 40305 >= 2)
      {
        if (a3 == 40311)
        {
LABEL_7:
          uint64_t v11 = PKMediumDayAndMonthStringFromDate();
          PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorCa.isa, &stru_1EF1B4C70.isa, v11);
        }
        else
        {
LABEL_8:
          uint64_t v11 = PKMediumDayAndMonthStringFromDate();
          PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorGe_0.isa, &stru_1EF1B4C70.isa, v11);
        }
      }
      else
      {
        uint64_t v11 = PKMediumDayAndMonthStringFromDate();
        PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorSe.isa, &stru_1EF1B4C70.isa, v11);
      }
      uint64_t v12 = LABEL_14:;
LABEL_15:

LABEL_16:
      return v12;
  }
}

- (void)makeCellFirstResponderWithItem:(id)a3
{
  id v3 = [(PKDynamicCollectionViewController *)self cellForItem:a3];
  if ([v3 canBecomeFirstResponder]) {
    [v3 becomeFirstResponder];
  }
}

- (void)updateFooterForSectionIdentifier:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)self->_detailSectionController identifiers];
  id v5 = [v4 firstObject];
  int v6 = [v13 isEqualToString:v5];

  if (v6)
  {
    [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateDetailSectionFooter];
  }
  else
  {
    uint64_t v7 = [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)self->_pauseSectionController identifiers];
    uint64_t v8 = [v7 firstObject];
    int v9 = [v13 isEqualToString:v8];

    if (v9)
    {
      [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updatePauseSectionFooter];
    }
    else
    {
      id v10 = [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)self->_cancelSectionController identifiers];
      uint64_t v11 = [v10 firstObject];
      int v12 = [v13 isEqualToString:v11];

      if (v12) {
        [(PKPeerPaymentRecurringPaymentDetailViewController *)self _updateCancelSectionFooter];
      }
    }
  }
}

- (void)performAction:(unint64_t)a3 startHandler:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_performingAction)
  {
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = PKPeerPaymentRecurringPaymentActionToString();
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: performing %@ action", buf, 0xCu);
    }
    self->_performingAction = 1;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke;
    v13[3] = &unk_1E59CAF98;
    objc_copyWeak(v16, (id *)buf);
    id v14 = v8;
    v16[1] = (id)a3;
    id v15 = v10;
    [(PKPeerPaymentRecurringPaymentDetailViewController *)self _showConfirmationAlertIfNeededForAction:a3 completion:v13];

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
}

void __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        (*(void (**)(void))(v6 + 16))();
      }
      uint64_t v7 = *(void *)(a1 + 56);
      if (v7 == 2)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        id v11[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_3;
        v11[3] = &unk_1E59CB128;
        id v8 = &v13;
        objc_copyWeak(&v13, v4);
        id v12 = *(id *)(a1 + 40);
        [WeakRetained _cancelRecurringPaymentWithCompletion:v11];
        id v9 = v12;
        goto LABEL_11;
      }
      if (v7 == 1)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        id v14[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_2;
        v14[3] = &unk_1E59CB128;
        id v8 = &v16;
        objc_copyWeak(&v16, v4);
        id v15 = *(id *)(a1 + 40);
        [WeakRetained _pauseRecurringPaymentWithCompletion:v14];
        id v9 = v15;
LABEL_11:

        objc_destroyWeak(v8);
        goto LABEL_12;
      }
    }
    WeakRetained[1120] = 0;
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
LABEL_12:
}

void __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1120) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      id v3 = v5;
    }
  }
}

void __91__PKPeerPaymentRecurringPaymentDetailViewController_performAction_startHandler_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1120) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      id v3 = v5;
    }
  }
}

- (void)_pauseRecurringPaymentWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  switch([(PKPeerPaymentRecurringPayment *)self->_recurringPayment status])
  {
    case 1:
    case 3:
      peerPaymentService = self->_peerPaymentService;
      uint64_t v6 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment identifier];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      id v14[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke;
      v14[3] = &unk_1E59CAFC0;
      uint64_t v7 = &v16;
      objc_copyWeak(&v16, &location);
      id v15 = v4;
      [(PKPeerPaymentService *)peerPaymentService performRecurringPaymentAction:1 identifier:v6 completion:v14];

      id v8 = (id *)&v15;
      goto LABEL_4;
    case 2:
    case 4:
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_2;
      v11[3] = &unk_1E59CB0D8;
      uint64_t v7 = &v13;
      objc_copyWeak(&v13, &location);
      id v12 = v4;
      [(PKPeerPaymentRecurringPaymentDetailViewController *)self _validatePaymentEditsWithCompletion:v11];
      id v8 = (id *)&v12;
LABEL_4:

      objc_destroyWeak(v7);
      break;
    default:
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        recurringPayment = self->_recurringPayment;
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = recurringPayment;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: Unable to perform action, recurring payment is in an ineligible state: %@", buf, 0xCu);
      }

      if (v4) {
        v4[2](v4);
      }
      break;
  }
  objc_destroyWeak(&location);
}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained _showAlertForError:v6 completion:*(void *)(a1 + 32)];
      goto LABEL_7;
    }
    objc_storeStrong(WeakRetained + 132, a2);
    *((unsigned char *)v8 + 1232) = 0;
    [v8 _updateSections];
    [v8 _updateBarButtonItems];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
LABEL_7:
}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_3;
    v7[3] = &unk_1E59CB0D8;
    objc_copyWeak(&v9, v4);
    id v8 = *(id *)(a1 + 32);
    [WeakRetained _authorizeRecurringPaymentWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_4;
    v7[3] = &unk_1E59CB0D8;
    objc_copyWeak(&v9, v4);
    id v8 = *(id *)(a1 + 32);
    [WeakRetained _updateRecurringPaymentsWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained || a2)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *((void *)WeakRetained + 132);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentDetailViewController: Manually updating recurring payment status for recurring payment: %@", buf, 0xCu);
    }

    id v8 = (void *)*((void *)WeakRetained + 139);
    id v9 = [*((id *)WeakRetained + 132) identifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_249;
    v11[3] = &unk_1E59CAFE8;
    objc_copyWeak(&v13, v4);
    id v12 = *(id *)(a1 + 32);
    [v8 updateRecurringPaymentStatus:1 identifier:v9 completion:v11];

    objc_destroyWeak(&v13);
  }
}

void __90__PKPeerPaymentRecurringPaymentDetailViewController__pauseRecurringPaymentWithCompletion___block_invoke_249(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 132, a2);
    [v5 _updateSections];
    [v5 _updateBarButtonItems];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)_cancelRecurringPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  uint64_t v6 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke;
  v8[3] = &unk_1E59CAFC0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [(PKPeerPaymentService *)peerPaymentService performRecurringPaymentAction:2 identifier:v6 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      [WeakRetained _showAlertForError:v4 completion:*(void *)(a1 + 32)];
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke_2;
      v8[3] = &unk_1E59CB128;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      id v9 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], v8);

      objc_destroyWeak(&v10);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

void __91__PKPeerPaymentRecurringPaymentDetailViewController__cancelRecurringPaymentWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained navigationController];
  id v3 = (id)[v2 popViewControllerAnimated:1];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)memoIconWasTapped
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPeerPaymentRecurringPaymentDetailViewController_memoIconWasTapped__block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __70__PKPeerPaymentRecurringPaymentDetailViewController_memoIconWasTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    uint64_t v3 = [WeakRetained overrideUserInterfaceStyle];
    id v4 = [PKMemoIconChooserViewController alloc];
    id v5 = [v10[153] recurringPaymentMemo];
    uint64_t v6 = [(PKMemoIconChooserViewController *)v4 initWithDelegate:v10 memo:v5 context:*(void *)(*(void *)(a1 + 32) + 1064)];

    [(PKMemoIconChooserViewController *)v6 setOverrideUserInterfaceStyle:v3];
    uint64_t v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
    [(PKNavigationController *)v7 setOverrideUserInterfaceStyle:v3];
    id v8 = *(void **)(a1 + 32);
    if (v8[133] == 9)
    {
      if (PKIsPad())
      {
        uint64_t v9 = 0;
        goto LABEL_8;
      }
      id v8 = *(void **)(a1 + 32);
    }
    if (!objc_msgSend(v8, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
LABEL_9:
      [v10 presentViewController:v7 animated:1 completion:0];

      id WeakRetained = v10;
      goto LABEL_10;
    }
    uint64_t v9 = 16;
LABEL_8:
    [(PKNavigationController *)v7 setModalPresentationStyle:v9];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)memoIconChooserDidChooseMemo:(id)a3
{
  [(PKPeerPaymentRecurringPaymentMemoSectionController *)self->_memoSectionController setRecurringPaymentMemoWithTextSuggestion:a3];
  [(PKDynamicCollectionViewController *)self reloadDataForSection:self->_memoSectionController animated:1];
  memoSectionController = self->_memoSectionController;

  [(PKPeerPaymentRecurringPaymentMemoSectionController *)memoSectionController requestBecomeFirstResponder];
}

- (void)fundingSourceSectionSelected
{
  if (self->_paymentRequest)
  {
    uint64_t v3 = [(PKPeerPaymentRecurringPayment *)self->_recurringPayment fundingSource];
    id v4 = [v3 fpanIdentifier];

    if (!self->_selectedPass)
    {
      if ([v4 length])
      {
        id v5 = [MEMORY[0x1E4F84898] sharedInstance];
        uint64_t v6 = [v5 passWithFPANIdentifier:v4];
        selectedPass = self->_selectedPass;
        self->_selectedPass = v6;
      }
    }
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__PKPeerPaymentRecurringPaymentDetailViewController_fundingSourceSectionSelected__block_invoke;
    v8[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __81__PKPeerPaymentRecurringPaymentDetailViewController_fundingSourceSectionSelected__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [PKPaymentMethodSelectionViewController alloc];
    uint64_t v2 = *((void *)WeakRetained + 136);
    uint64_t v3 = *((void *)WeakRetained + 135);
    id v4 = [*((id *)WeakRetained + 132) fundingSource];
    id v5 = [v4 name];
    uint64_t v6 = [*((id *)WeakRetained + 132) fundingSource];
    uint64_t v7 = [v6 fpanIdentifier];
    id v8 = -[PKPaymentMethodSelectionViewController initWithPaymentRequest:selectedPass:paymentMethodName:paymentMethodIdentifier:allowAppleCashToggle:useAppleCashBalance:viewStyle:delegate:](v1, "initWithPaymentRequest:selectedPass:paymentMethodName:paymentMethodIdentifier:allowAppleCashToggle:useAppleCashBalance:viewStyle:delegate:", v2, v3, v5, v7, 1, [*((id *)WeakRetained + 150) useAppleCashBalance], 0, WeakRetained);

    id v9 = [WeakRetained navigationController];
    [v9 pushViewController:v8 animated:1];
  }
}

- (void)paymentMethodSelectionViewController:(id)a3 didSelectPaymentMethod:(id)a4
{
  id v16 = a4;
  uint64_t v6 = [(PKPaymentPass *)self->_selectedPass uniqueID];
  uint64_t v7 = [v16 uniqueID];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

LABEL_11:
    goto LABEL_12;
  }
  id v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

LABEL_10:
    objc_storeStrong((id *)&self->_selectedPass, a4);
    fundingSourceSectionController = self->_fundingSourceSectionController;
    id v8 = [(PKPaymentPass *)self->_selectedPass localizedDescription];
    [(PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *)fundingSourceSectionController setFundingSource:v8];
    goto LABEL_11;
  }
  char v12 = [v8 isEqualToString:v9];

  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_12:
  id v14 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self navigationController];
  id v15 = (id)[v14 popViewControllerAnimated:1];
}

- (void)paymentMethodSelectionViewController:(id)a3 didToggleUseAppleCashBalance:(BOOL)a4
{
}

- (void)didSelectAmountSection
{
  if (self->_mode == 1)
  {
    id v3 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self navigationController];
    id v2 = (id)[v3 popViewControllerAnimated:1];
  }
}

- (void)recurringPaymentsChanged
{
  objc_initWeak(&location, self);
  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PKPeerPaymentRecurringPaymentDetailViewController_recurringPaymentsChanged__block_invoke;
  v4[3] = &unk_1E59CB088;
  objc_copyWeak(&v5, &location);
  [(PKPeerPaymentService *)peerPaymentService recurringPaymentsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __77__PKPeerPaymentRecurringPaymentDetailViewController_recurringPaymentsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _reloadWithPayments:v5];
  }
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v2 = [(PKPeerPaymentRecurringPaymentDetailViewController *)self overrideUserInterfaceStyle] == 2;
  int64_t v3 = v2;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (BOOL)allowEdits
{
  return self->_allowEdits;
}

- (void)setAllowEdits:(BOOL)a3
{
  self->_allowEdits = a3;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (PKPeerPaymentRecurringPaymentDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentRecurringPaymentDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_memoSectionController, 0);
  objc_storeStrong((id *)&self->_cancelSectionController, 0);
  objc_storeStrong((id *)&self->_pauseSectionController, 0);
  objc_storeStrong((id *)&self->_fundingSourceSectionController, 0);
  objc_storeStrong((id *)&self->_detailSectionController, 0);
  objc_storeStrong((id *)&self->_messageSectionController, 0);
  objc_storeStrong((id *)&self->_amountSectionController, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_remoteMessagesComposer, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_storeStrong((id *)&self->_recipient, 0);

  objc_storeStrong((id *)&self->_recurringPayment, 0);
}

@end