@interface PKRecipientPickerViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)_hasHeaderForSection:(unint64_t)a3;
- (BOOL)_isRecipientTextViewEmpty;
- (BOOL)_showFamilySuggestions;
- (BOOL)_showNearby;
- (BOOL)_showRecentSuggestions;
- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKNearbyPeerPaymentViewProvider)nearbyViewProvider;
- (PKRecipientPickerViewController)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 peerPaymentSendFlowType:(int64_t)a5;
- (PKRecipientPickerViewController)initWithTransactionSourceCollection:(id)a3 peerPaymentSendFlowType:(int64_t)a4;
- (PKRecipientPickerViewControllerDelegate)delegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_recipientForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_composeAddressKindFromCounterpartHandle:(id)a3;
- (void)_addRecipient:(id)a3;
- (void)_addRecipientFromContactProperty:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_clearRecipientTextView;
- (void)_configureCell:(id)a3 withContact:(id)a4;
- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4;
- (void)_generateSuggestions;
- (void)_keyboardWillChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_nextBarButtonPressed:(id)a3;
- (void)_removeAllRecipients;
- (void)_showNearbyAmountEntry;
- (void)_showNextScreenWithRecipient:(id)a3;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updateNextBarButtonItem;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeResults:(id)a3 taskID:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)dealloc;
- (void)finishedTaskWithID:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setNearbyViewProvider:(id)a3;
- (void)setPerformingAction:(BOOL)a3;
- (void)setUpNavigationBar;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKRecipientPickerViewController

- (PKRecipientPickerViewController)initWithTransactionSourceCollection:(id)a3 peerPaymentSendFlowType:(int64_t)a4
{
  return [(PKRecipientPickerViewController *)self initWithTransactionSourceCollection:a3 familyCollection:0 peerPaymentSendFlowType:a4];
}

- (PKRecipientPickerViewController)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 peerPaymentSendFlowType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v61.receiver = self;
  v61.super_class = (Class)PKRecipientPickerViewController;
  v11 = [(PKRecipientPickerViewController *)&v61 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v12->_familyCollection, a4);
    v12->_peerPaymentSendFlowType = a5;
    if (a5 == 2)
    {
      uint64_t v13 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecipientPicke.isa);
    }
    else
    {
      if (a5 != 1)
      {
LABEL_7:
        uint64_t v15 = [MEMORY[0x1E4F845E8] defaultContactResolver];
        contactResolver = v12->_contactResolver;
        v12->_contactResolver = (PKContactResolver *)v15;

        currentTaskID = v12->_currentTaskID;
        v12->_currentTaskID = 0;

        autocompleteResults = v12->_autocompleteResults;
        v12->_autocompleteResults = 0;

        v19 = (double *)MEMORY[0x1E4F1DB28];
        CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
        v12->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
        v12->_keyboardFrame.size = v20;
        v12->_keyboardVisible = 0;
        v21 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        containerView = v12->_containerView;
        v12->_containerView = v21;

        v23 = (CNComposeRecipientTextView *)objc_alloc_init(MEMORY[0x1E4F5A160]);
        recipientTextView = v12->_recipientTextView;
        v12->_recipientTextView = v23;

        [(CNComposeRecipientTextView *)v12->_recipientTextView setDelegate:v12];
        [(CNComposeRecipientTextView *)v12->_recipientTextView setMaxRecipients:1];
        v25 = [(CNComposeRecipientTextView *)v12->_recipientTextView textView];
        [v25 setKeyboardAppearance:1];

        [(CNComposeRecipientTextView *)v12->_recipientTextView setAccessibilityIdentifier:*MEMORY[0x1E4F858C0]];
        v26 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E4F5A0E8]);
        resultsViewController = v12->_resultsViewController;
        v12->_resultsViewController = v26;

        [(CNAutocompleteResultsTableViewController *)v12->_resultsViewController setDelegate:v12];
        uint64_t v28 = [objc_alloc(MEMORY[0x1E4F5A108]) initWithAutocompleteSearchType:1];
        searchManager = v12->_searchManager;
        v12->_searchManager = (CNAutocompleteSearchManager *)v28;

        [(CNAutocompleteSearchManager *)v12->_searchManager setShouldIncludeGroupResults:0];
        [(CNAutocompleteSearchManager *)v12->_searchManager setFetchDelegate:v12];
        currentRecipientText = v12->_currentRecipientText;
        v12->_currentRecipientText = (NSString *)&stru_1EF1B5B50;

        id v31 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
        id v32 = objc_alloc(MEMORY[0x1E4FB1568]);
        double v33 = *v19;
        double v34 = v19[1];
        double v35 = v19[2];
        double v36 = v19[3];
        uint64_t v37 = objc_msgSend(v32, "initWithFrame:collectionViewLayout:", v31, *v19, v34, v35, v36);
        suggestionsView = v12->_suggestionsView;
        v12->_suggestionsView = (UICollectionView *)v37;

        [(UICollectionView *)v12->_suggestionsView setDataSource:v12];
        [(UICollectionView *)v12->_suggestionsView setDelegate:v12];
        uint64_t v39 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionType:3 transactionSourceCollection:v9 paymentDataProvider:0];
        transactionFetcher = v12->_transactionFetcher;
        v12->_transactionFetcher = (PKDashboardTransactionFetcher *)v39;

        [(PKDashboardTransactionFetcher *)v12->_transactionFetcher setDelegate:v12];
        v41 = -[PKDashboardTitleHeaderView initWithFrame:]([PKDashboardTitleHeaderView alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleHeaderView = v12->_sampleHeaderView;
        v12->_sampleHeaderView = v41;

        v43 = -[PKThumbnailCollectionViewCell initWithFrame:]([PKThumbnailCollectionViewCell alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleThumbnailCell = v12->_sampleThumbnailCell;
        v12->_sampleThumbnailCell = v43;

        v45 = -[PKNearbyPeerPaymentEntryCollectionViewCell initWithFrame:]([PKNearbyPeerPaymentEntryCollectionViewCell alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleNearbyCell = v12->_sampleNearbyCell;
        v12->_sampleNearbyCell = v45;

        v47 = -[PKNearbyPeerPaymentEntryCollectionViewHeaderView initWithFrame:]([PKNearbyPeerPaymentEntryCollectionViewHeaderView alloc], "initWithFrame:", v33, v34, v35, v36);
        sampleNearbyHeaderView = v12->_sampleNearbyHeaderView;
        v12->_sampleNearbyHeaderView = v47;

        v49 = [MEMORY[0x1E4F84D50] sharedService];
        v50 = [v49 context];
        v51 = [v50 configuration];
        v52 = [v51 contactFormatConfiguration];

        uint64_t v53 = [objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v52];
        contactFormatValidator = v12->_contactFormatValidator;
        v12->_contactFormatValidator = (PKContactFormatValidator *)v53;

        v55 = [MEMORY[0x1E4F84E10] sharedService];
        uint64_t v56 = [objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:v55];
        peerPaymentController = v12->_peerPaymentController;
        v12->_peerPaymentController = (PKPeerPaymentController *)v56;

        v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v58 addObserver:v12 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
        [v58 addObserver:v12 selector:sel__keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
        [v58 addObserver:v12 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
        [(PKRecipientPickerViewController *)v12 setOverrideUserInterfaceStyle:2];
        [(PKRecipientPickerViewController *)v12 _generateSuggestions];
        v59 = [MEMORY[0x1E4F84E10] sharedService];
        [v59 prewarmDeviceScoreForEndpoint:*MEMORY[0x1E4F87C70] recipientAddress:0 quoteDestinationType:1];
        [v59 prewarmDeviceScoreForEndpoint:*MEMORY[0x1E4F87C68] recipientAddress:0 quoteDestinationType:1];

        goto LABEL_8;
      }
      uint64_t v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentWal.isa);
    }
    title = v12->_title;
    v12->_title = (NSString *)v13;

    goto LABEL_7;
  }
LABEL_8:

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F84E10] sharedService];
  [v3 unloadDeviceScoreForEndpoint:*MEMORY[0x1E4F87C70] recipientAddress:0 quoteDestinationType:1];
  [v3 unloadDeviceScoreForEndpoint:*MEMORY[0x1E4F87C68] recipientAddress:0 quoteDestinationType:1];

  v4.receiver = self;
  v4.super_class = (Class)PKRecipientPickerViewController;
  [(PKRecipientPickerViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKRecipientPickerViewController;
  [(PKRecipientPickerViewController *)&v7 viewWillAppear:a3];
  [(PKRecipientPickerViewController *)self setUpNavigationBar];
  objc_super v4 = [(CNComposeRecipientTextView *)self->_recipientTextView text];
  char v5 = [v4 isEqualToString:self->_currentRecipientText];

  if ((v5 & 1) == 0)
  {
    v6 = [(CNComposeRecipientTextView *)self->_recipientTextView textView];
    [v6 setText:self->_currentRecipientText];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKRecipientPickerViewController;
  [(PKRecipientPickerViewController *)&v12 viewDidAppear:a3];
  [(CNComposeRecipientTextView *)self->_recipientTextView becomeFirstResponder];
  if (self->_peerPaymentSendFlowType == 1)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87000];
    uint64_t v6 = *MEMORY[0x1E4F869F0];
    uint64_t v7 = *MEMORY[0x1E4F86730];
    v13[0] = *MEMORY[0x1E4F864C8];
    v13[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F86AA0];
    v14[0] = v6;
    v14[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F86A10];
    v13[2] = *MEMORY[0x1E4F86308];
    v13[3] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86A28];
    v14[2] = *MEMORY[0x1E4F864A0];
    v14[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
    [v4 subject:v5 sendEvent:v11];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKRecipientPickerViewController;
  [(PKRecipientPickerViewController *)&v12 viewDidDisappear:a3];
  if (self->_peerPaymentSendFlowType == 1)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87000];
    uint64_t v6 = *MEMORY[0x1E4F869F0];
    uint64_t v7 = *MEMORY[0x1E4F86730];
    v13[0] = *MEMORY[0x1E4F864C8];
    v13[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F86AA0];
    v14[0] = v6;
    v14[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F86A10];
    v13[2] = *MEMORY[0x1E4F86308];
    v13[3] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86A28];
    v14[2] = *MEMORY[0x1E4F864A8];
    v14[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
    [v4 subject:v5 sendEvent:v11];
  }
}

- (void)loadView
{
  v17.receiver = self;
  v17.super_class = (Class)PKRecipientPickerViewController;
  [(PKRecipientPickerViewController *)&v17 loadView];
  v3 = [(PKRecipientPickerViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 addSubview:self->_containerView];
  recipientTextView = self->_recipientTextView;
  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(CNComposeRecipientTextView *)recipientTextView setBackgroundColor:v6];

  uint64_t v7 = [(CNAutocompleteResultsTableViewController *)self->_resultsViewController view];
  uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  [(UIView *)self->_containerView addSubview:self->_recipientTextView];
  [(UIView *)self->_containerView addSubview:v7];
  [(CNAutocompleteResultsTableViewController *)self->_resultsViewController didMoveToParentViewController:self];
  [(PKRecipientPickerViewController *)self addChildViewController:self->_resultsViewController];
  suggestionsView = self->_suggestionsView;
  uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)suggestionsView setBackgroundColor:v10];

  [(UICollectionView *)self->_suggestionsView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardRecipientPickerSuggestionsThumbnailCellIdentifier"];
  v11 = self->_suggestionsView;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = *MEMORY[0x1E4FB2770];
  [(UICollectionView *)v11 registerClass:v12 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"PKDashboardRecipientPickerNearbyHeaderIdentifier"];
  [(UICollectionView *)self->_suggestionsView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardRecipientPickerNearbyCellIdentifier"];
  [(UICollectionView *)self->_suggestionsView registerClass:objc_opt_class() forSupplementaryViewOfKind:v13 withReuseIdentifier:@"PKDashboardRecipientPickerFamilySuggestionsTitleIdentifier"];
  [(UICollectionView *)self->_suggestionsView registerClass:objc_opt_class() forSupplementaryViewOfKind:v13 withReuseIdentifier:@"PKDashboardRecipientPickerSuggestionsTitleIdentifier"];
  -[UICollectionView setContentInset:](self->_suggestionsView, "setContentInset:", 8.0, 16.0, 8.0, 16.0);
  v14 = [(PKRecipientPickerViewController *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 == 1) {
    [(UICollectionView *)self->_suggestionsView setKeyboardDismissMode:1];
  }
  [(UIView *)self->_containerView addSubview:self->_suggestionsView];
  v16 = [(PKRecipientPickerViewController *)self view];
  [v16 setAccessibilityIdentifier:*MEMORY[0x1E4F858C8]];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(PKRecipientPickerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])double v11 = v11 - self->_keyboardFrame.size.height; {
  -[UIView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
  }
  [(UIView *)self->_containerView setPreservesSuperviewLayoutMargins:1];
  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView bounds];
  double v13 = v12;
  double v15 = v14;
  recipientTextView = self->_recipientTextView;
  [(UIView *)self->_containerView safeAreaInsets];
  double v18 = v17;
  [MEMORY[0x1E4F5A160] preferredHeight];
  -[CNComposeRecipientTextView setFrame:](recipientTextView, "setFrame:", 0.0, v18, v13, v19);
  CGSize v20 = self->_recipientTextView;
  v21 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentWal_0.isa);
  [(CNComposeRecipientTextView *)v20 setLabel:v21];

  v22 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  uint64_t v23 = [v22 count];

  BOOL v24 = [(PKRecipientPickerViewController *)self _isRecipientTextViewEmpty];
  v25 = [(CNAutocompleteResultsTableViewController *)self->_resultsViewController view];
  [(UIView *)self->_containerView safeAreaInsets];
  double v27 = v26;
  [(CNComposeRecipientTextView *)self->_recipientTextView frame];
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  double MaxY = CGRectGetMaxY(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  objc_msgSend(v25, "setFrame:", 0.0, MaxY, v13, v27 + v15 - CGRectGetMaxY(v39));
  if (v23) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v24;
  }
  if (v23) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = !v24;
  }
  [v25 setHidden:v33];
  suggestionsView = self->_suggestionsView;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v36 = CGRectGetMaxY(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  v42.size.CGFloat height = v27 + v15 - CGRectGetMaxY(v41);
  v42.origin.CGFloat x = 0.0;
  v42.origin.CGFloat y = v36;
  v42.size.CGFloat width = v13;
  CGRect v43 = CGRectInset(v42, 4.0, 0.0);
  -[UICollectionView setFrame:](suggestionsView, "setFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  [(UICollectionView *)self->_suggestionsView setHidden:v34];
  v37.receiver = self;
  v37.super_class = (Class)PKRecipientPickerViewController;
  [(PKRecipientPickerViewController *)&v37 viewDidLayoutSubviews];
}

- (void)setUpNavigationBar
{
  [(PKRecipientPickerViewController *)self setTitle:self->_title];
  v3 = [(PKRecipientPickerViewController *)self navigationController];
  id v10 = [v3 navigationBar];

  [v10 setOverrideUserInterfaceStyle:2];
  double v4 = [(PKRecipientPickerViewController *)self navigationItem];
  [v4 setBackButtonDisplayMode:2];
  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  double v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentWal_1.isa);
  double v7 = (void *)[v5 initWithTitle:v6 style:2 target:self action:sel__nextBarButtonPressed_];

  [v4 setRightBarButtonItem:v7];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
  [(PKRecipientPickerViewController *)self _updateNextBarButtonItem];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped_];
  double v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setTintColor:v9];

  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  [v4 setLeftBarButtonItem:v8];
}

- (void)_keyboardWillShow:(id)a3
{
  double v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PKRecipientPickerViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKRecipientPickerViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __53__PKRecipientPickerViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v4 = *(double *)(v2 + 1024);
  CGFloat v3 = *(double *)(v2 + 1032);
  CGFloat v6 = *(double *)(v2 + 1040);
  CGFloat v5 = *(double *)(v2 + 1048);
  *(unsigned char *)(v2 + 1056) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  double v7 = *(void **)(a1 + 40);
  double v9 = (void *)(v8 + 1024);
  if (v7)
  {
    [v7 CGRectValue];
    *double v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)double v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1040) = v14;
  }
  v16.origin.CGFloat x = v4;
  v16.origin.CGFloat y = v3;
  v16.size.CGFloat width = v6;
  v16.size.CGFloat height = v5;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1024), v16);
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
      v6[2] = __55__PKRecipientPickerViewController__keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKRecipientPickerViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __55__PKRecipientPickerViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 128;
  CGFloat v4 = *((double *)v2 + 128);
  CGFloat v5 = *((double *)v2 + 129);
  CGFloat v6 = *((double *)v2 + 130);
  CGFloat v7 = *((double *)v2 + 131);
  [*(id *)(a1 + 40) CGRectValue];
  void *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.CGFloat x = v4;
  v13.origin.CGFloat y = v5;
  v13.size.CGFloat width = v6;
  v13.size.CGFloat height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1024), v13);
}

- (void)_keyboardWillHide:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PKRecipientPickerViewController__keyboardWillHide___block_invoke;
  v3[3] = &unk_1E59CADE0;
  v3[4] = self;
  [(PKRecipientPickerViewController *)self _updateLayoutForKeyboardAction:v3];
}

BOOL __53__PKRecipientPickerViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1024);
  *(unsigned char *)(v1 + 1056) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1024);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *uint64_t v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1024);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1032);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1040);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1048);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKRecipientPickerViewController *)self viewIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __66__PKRecipientPickerViewController__updateLayoutForKeyboardAction___block_invoke;
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

uint64_t __66__PKRecipientPickerViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_nextBarButtonPressed:(id)a3
{
  uint64_t v4 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  id v5 = [v4 firstObject];

  [(PKRecipientPickerViewController *)self _showNextScreenWithRecipient:v5];
}

- (void)_cancelButtonTapped:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKRecipientPickerViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  if (self->_peerPaymentSendFlowType == 1)
  {
    id v5 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v6 = *MEMORY[0x1E4F87000];
    uint64_t v7 = *MEMORY[0x1E4F869F0];
    uint64_t v8 = *MEMORY[0x1E4F86730];
    v14[0] = *MEMORY[0x1E4F864C8];
    v14[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F86AA0];
    v15[0] = v7;
    v15[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86380];
    uint64_t v11 = *MEMORY[0x1E4F86120];
    v14[2] = *MEMORY[0x1E4F86308];
    v14[3] = v11;
    uint64_t v12 = *MEMORY[0x1E4F86128];
    v15[2] = v10;
    v15[3] = v12;
    v14[4] = *MEMORY[0x1E4F86A10];
    v15[4] = *MEMORY[0x1E4F86A28];
    CGRect v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
    [v5 subject:v6 sendEvent:v13];
  }
}

- (void)_updateNextBarButtonItem
{
  long long v3 = [(PKRecipientPickerViewController *)self navigationItem];
  id v10 = [v3 rightBarButtonItem];

  uint64_t v4 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(CNComposeRecipientTextView *)self->_recipientTextView maxRecipients];

  BOOL v7 = [(PKRecipientPickerViewController *)self _isRecipientTextViewEmpty];
  BOOL v9 = v5 == v6 && v7 && !self->_performingAction;
  [v10 setEnabled:v9];
}

- (void)_addRecipientFromContactProperty:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 contact];
  uint64_t v5 = [v13 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = [v13 value];
  uint64_t v8 = (void *)v7;
  if (isKindOfClass)
  {
    uint64_t v9 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:v4 address:v8 kind:v9];
    [(PKRecipientPickerViewController *)self _addRecipient:v12];

    goto LABEL_7;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10)
  {
    uint64_t v11 = [v13 value];
    uint64_t v8 = [v11 stringValue];

    uint64_t v9 = 1;
    if (v8) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)_addRecipient:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      char v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) address];
      uint64_t v11 = [v4 address];
      uint64_t v12 = [v10 caseInsensitiveCompare:v11];

      if (!v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    [(CNComposeRecipientTextView *)self->_recipientTextView addRecipient:v4];
    uint64_t v5 = [(PKRecipientPickerViewController *)self view];
    [v5 setNeedsLayout];
  }
}

- (BOOL)_isRecipientTextViewEmpty
{
  uint64_t v2 = [(CNComposeRecipientTextView *)self->_recipientTextView text];
  long long v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  LOBYTE(v2) = [v4 length] == 0;
  return (char)v2;
}

- (void)_clearRecipientTextView
{
  currentRecipientText = self->_currentRecipientText;
  self->_currentRecipientText = 0;

  recipientTextView = self->_recipientTextView;

  [(CNComposeRecipientTextView *)recipientTextView clearText];
}

- (unint64_t)_composeAddressKindFromCounterpartHandle:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([(PKContactFormatValidator *)self->_contactFormatValidator emailAddressIsValid:v4])
    {
      unint64_t v5 = 0;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
      if ([(PKContactFormatValidator *)self->_contactFormatValidator phoneNumberIsValid:v6 forCountryCode:0])unint64_t v5 = 1; {
      else
      }
        unint64_t v5 = 5;
    }
  }
  else
  {
    unint64_t v5 = 5;
  }

  return v5;
}

- (void)_showNextScreenWithRecipient:(id)a3
{
  id v4 = a3;
  if (!self->_performingAction)
  {
    [(PKRecipientPickerViewController *)self setPerformingAction:1];
    if (self->_peerPaymentSendFlowType == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 3;
    }
    uint64_t v6 = [[PKPeerPaymentRemoteMessagesComposer alloc] initWithPeerPaymentController:self->_peerPaymentController presentingViewController:self actionType:v5 sourceType:1];
    objc_initWeak(&location, self);
    uint64_t v7 = [v4 address];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PKRecipientPickerViewController__showNextScreenWithRecipient___block_invoke;
    v9[3] = &unk_1E59D4888;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = v6;
    char v10 = v8;
    id v11 = v4;
    uint64_t v12 = self;
    [(PKPeerPaymentRemoteMessagesComposer *)v8 validateRecipientWithAddress:v7 completion:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

id __64__PKRecipientPickerViewController__showNextScreenWithRecipient___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id result = objc_loadWeakRetained((id *)(a1 + 56));
    if (!result) {
      return result;
    }
    id v4 = result;
    uint64_t v5 = [result navigationController];
    uint64_t v6 = [[PKAmountKeypadViewController alloc] initWithRemoteMessagesComposer:*(void *)(a1 + 32) recipient:*(void *)(a1 + 40) sendFlowType:*(void *)(*(void *)(a1 + 48) + 992) familyCollection:*(void *)(*(void *)(a1 + 48) + 984)];
    [v5 pushViewController:v6 animated:1];
  }
  else
  {
    [*(id *)(a1 + 48) _updateNextBarButtonItem];
  }
  uint64_t v7 = *(void **)(a1 + 48);

  return (id)[v7 setPerformingAction:0];
}

- (void)_showNearbyAmountEntry
{
  v21[5] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  nearbyViewProvider = self->_nearbyViewProvider;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __57__PKRecipientPickerViewController__showNearbyAmountEntry__block_invoke;
  long long v16 = &unk_1E59CD6F8;
  objc_copyWeak(&v18, &location);
  double v17 = self;
  id v4 = [(PKNearbyPeerPaymentViewProvider *)nearbyViewProvider amountEntryViewWithInitialAmount:0 initialMemo:0 dismissAction:&v13];
  -[PKRecipientPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0, v13, v14, v15, v16);
  if (self->_peerPaymentSendFlowType == 1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v6 = *MEMORY[0x1E4F869F0];
    uint64_t v7 = *MEMORY[0x1E4F86730];
    v20[0] = *MEMORY[0x1E4F864C8];
    v20[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F86AA0];
    v21[0] = v6;
    v21[1] = v8;
    uint64_t v9 = *MEMORY[0x1E4F86380];
    uint64_t v10 = *MEMORY[0x1E4F86120];
    v20[2] = *MEMORY[0x1E4F86308];
    v20[3] = v10;
    uint64_t v11 = *MEMORY[0x1E4F869A8];
    v21[2] = v9;
    v21[3] = v11;
    v20[4] = *MEMORY[0x1E4F86A10];
    v21[4] = *MEMORY[0x1E4F86A28];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
    [v5 subject:*MEMORY[0x1E4F87000] sendEvent:v12];
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __57__PKRecipientPickerViewController__showNearbyAmountEntry__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    long long v3 = (void *)MEMORY[0x1E4F84E00];
    id v4 = a2;
    uint64_t v5 = [v3 sharedInstance];
    [v5 presentSenderFlowWithHost:0 userInfo:v4 completion:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained delegate];
  [v6 recipientPickerViewControllerRequestsDismissViewController:*(void *)(a1 + 32)];
}

- (void)setPerformingAction:(BOOL)a3
{
  if (self->_performingAction != a3)
  {
    self->_performingAction = a3;
    [(PKRecipientPickerViewController *)self _updateNextBarButtonItem];
  }
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a4;
  uint64_t v7 = [v5 whitespaceCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if (![v8 length]) {
    goto LABEL_11;
  }
  id v9 = [(PKContactResolver *)self->_contactResolver contactForHandle:v8];
  unint64_t v10 = [(PKRecipientPickerViewController *)self _composeAddressKindFromCounterpartHandle:v8];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    if (v10 == 1)
    {
      uint64_t v11 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v8];
      uint64_t v12 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v11];
      long long v15 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      [v9 setPhoneNumbers:v13];

      goto LABEL_7;
    }
    if (!v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v8];
      v16[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v9 setEmailAddresses:v12];
LABEL_7:
    }
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:v9 address:v8 kind:v10];
  if (v14)
  {
    [(PKRecipientPickerViewController *)self _clearRecipientTextView];
    [(PKRecipientPickerViewController *)self _addRecipient:v14];
  }

LABEL_11:
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (self->_currentTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentTaskID = self->_currentTaskID;
    self->_currentTaskID = 0;
  }
  autocompleteResults = self->_autocompleteResults;
  self->_autocompleteResults = 0;

  id v9 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  uint64_t v10 = [v9 count];

  if (v10 == [(CNComposeRecipientTextView *)self->_recipientTextView maxRecipients]
    && [v6 length])
  {
    [(PKRecipientPickerViewController *)self _clearRecipientTextView];
  }
  else
  {
    uint64_t v11 = [(CNComposeRecipientTextView *)self->_recipientTextView text];
    currentRecipientText = self->_currentRecipientText;
    self->_currentRecipientText = v11;

    [(PKRecipientPickerViewController *)self _updateNextBarButtonItem];
    if ([(PKRecipientPickerViewController *)self _isRecipientTextViewEmpty])
    {
      [(CNAutocompleteResultsTableViewController *)self->_resultsViewController setRecipients:0];
      if (!v10) {
        [(UICollectionView *)self->_suggestionsView reloadData];
      }
    }
    uint64_t v13 = [(PKRecipientPickerViewController *)self view];
    [v13 setNeedsLayout];

    id v14 = objc_alloc_init(MEMORY[0x1E4F5A060]);
    long long v15 = [(CNAutocompleteSearchManager *)self->_searchManager searchForText:v6 withAutocompleteFetchContext:v14 consumer:self];
    long long v16 = self->_currentTaskID;
    self->_currentTaskID = v15;
  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v7 = objc_alloc_init(getCNContactPickerViewControllerClass());
  [v7 setDelegate:self];
  [v7 setModalPresentationStyle:2];
  [v7 setOverrideUserInterfaceStyle:2];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
  [v7 setPredicateForEnablingContact:v4];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count + phoneNumbers.@count) == 1"];
  [v7 setPredicateForSelectionOfContact:v5];

  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(property == 'emailAddresses') OR (property == 'phoneNumbers')"];
  [v7 setPredicateForSelectionOfProperty:v6];

  [(PKRecipientPickerViewController *)self setEditing:0];
  [(PKRecipientPickerViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  [(CNComposeRecipientTextView *)self->_recipientTextView frame];
  -[CNComposeRecipientTextView setFrame:](self->_recipientTextView, "setFrame:");
  id v5 = [(PKRecipientPickerViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)_removeAllRecipients
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v3 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(CNComposeRecipientTextView *)self->_recipientTextView removeRecipient:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKRecipientPickerViewController *)self _removeAllRecipients];
  [(PKRecipientPickerViewController *)self _addRecipientFromContactProperty:v6];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PKRecipientPickerViewController *)self _removeAllRecipients];
  [v7 dismissViewControllerAnimated:1 completion:0];

  PKComposeRecipientFromContact(v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  long long v8 = v9;
  if (v9)
  {
    [(PKRecipientPickerViewController *)self _addRecipient:v9];
    long long v8 = v9;
  }
}

- (void)consumeResults:(id)a3 taskID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!self->_currentTaskID || objc_msgSend(v6, "isEqualToNumber:"))
  {
    autocompleteResults = self->_autocompleteResults;
    if (autocompleteResults)
    {
      id v9 = [(NSArray *)autocompleteResults arrayByAddingObjectsFromArray:v12];
    }
    else
    {
      id v9 = (NSArray *)v12;
    }
    long long v10 = self->_autocompleteResults;
    self->_autocompleteResults = v9;

    [(CNAutocompleteResultsTableViewController *)self->_resultsViewController setRecipients:self->_autocompleteResults];
    long long v11 = [(PKRecipientPickerViewController *)self view];
    [v11 setNeedsLayout];
  }
}

- (void)finishedTaskWithID:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToNumber:self->_currentTaskID])
  {
    if (!self->_autocompleteResults) {
      [(PKRecipientPickerViewController *)self consumeResults:MEMORY[0x1E4F1CBF0] taskID:v5];
    }
    currentTaskID = self->_currentTaskID;
    self->_currentTaskID = 0;
  }
}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v9 = a4;
  if (self->_currentTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentTaskID = self->_currentTaskID;
    self->_currentTaskID = 0;
  }
  [(PKRecipientPickerViewController *)self _clearRecipientTextView];
  [(CNComposeRecipientTextView *)self->_recipientTextView setAccessibilityIdentifier:@"AppleCash.RecipientPicker.TextView"];
  [(PKRecipientPickerViewController *)self _addRecipient:v9];
  autocompleteResults = self->_autocompleteResults;
  self->_autocompleteResults = 0;

  long long v8 = [(PKRecipientPickerViewController *)self view];
  [v8 setNeedsLayout];
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(CNComposeRecipientTextView *)self->_recipientTextView clearText];
  id v6 = [v5 contact];
  if (!v6)
  {
    long long v10 = [v5 address];
    if (!v10)
    {
      id v7 = 0;
      goto LABEL_13;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v11 setNamePrefix:v10];
    [v11 setContactType:0];
    uint64_t v12 = [v5 kind];
    if (v12 == 1)
    {
      uint64_t v13 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v10];
      id v14 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v13];
      id v17 = v14;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      [v11 setPhoneNumbers:v15];
    }
    else
    {
      if (v12)
      {
LABEL_12:
        id v7 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v11];

LABEL_13:
        if (!v7) {
          goto LABEL_4;
        }
        goto LABEL_3;
      }
      uint64_t v13 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v10];
      v18[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v11 setEmailAddresses:v14];
    }

    goto LABEL_12;
  }
  id v7 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v6];
  if (v7)
  {
LABEL_3:
    [v7 setOverrideUserInterfaceStyle:2];
    [v7 setAllowsEditing:0];
    uint64_t v16 = *MEMORY[0x1E4F1AEB0];
    long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v7 setDisplayedPropertyKeys:v8];

    id v9 = [(PKRecipientPickerViewController *)self navigationController];
    [v9 pushViewController:v7 animated:1];
  }
LABEL_4:
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a5;
  id v8 = [v6 labelColor];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (BOOL)_showFamilySuggestions
{
  return self->_peerPaymentSendFlowType == 2 && [(NSArray *)self->_suggestedFamilyRecipients count] != 0;
}

- (BOOL)_showRecentSuggestions
{
  return [(NSArray *)self->_suggestedFamilyRecipients count] <= 4
      && [(NSArray *)self->_suggestedRecipients count] != 0;
}

- (BOOL)_showNearby
{
  long long v3 = [MEMORY[0x1E4F84E00] sharedInstance];
  uint64_t v4 = [v3 account];

  BOOL v5 = PKCashDeviceTapEnabled()
    && [v4 supportsDeviceTap]
    && self->_peerPaymentSendFlowType == 1;

  return v5;
}

- (void)_generateSuggestions
{
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__49;
  v30 = __Block_byref_object_dispose__49;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 992) == 2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 32) + 984) familyMembers];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v9 = [v8 contact];
          if (v9 && ([v8 isMe] & 1) == 0)
          {
            long long v10 = [v9 identifier];
            if (([(id)v27[5] containsObject:v10] & 1) == 0)
            {
              id v11 = PKComposeRecipientFromContact(v9);
              if (v11)
              {
                [(id)v27[5] addObject:v10];
                [v3 addObject:v11];
              }
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v5);
    }

    uint64_t v12 = [v3 copy];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 1144);
    *(void *)(v13 + 1144) = v12;

    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 1144) count] >= 5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_167;
      block[3] = &unk_1E59CA7D0;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
      goto LABEL_20;
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v15 = [*(id *)(v2 + 976) transactionSourceIdentifiers];
  id v3 = [v15 anyObject];

  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v17 = [v16 dateByAddingUnit:8 value:-6 toDate:v4 options:0];

  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(void **)(v18 + 1120);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_2;
  v20[3] = &unk_1E59DBA80;
  v20[4] = v18;
  void v20[5] = &v26;
  [v19 peerPaymentCounterpartHandlesForTransactionSourceIdentifier:v3 startDate:v17 endDate:v4 completion:v20];

LABEL_20:
  _Block_object_dispose(&v26, 8);
}

uint64_t __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_167(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1136);
  *(void *)(v2 + 1136) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 1128);

  return [v4 reloadData];
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_7;
    block[3] = &unk_1E59CA7D0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_19;
  }
  v21 = [MEMORY[0x1E4FADC50] sharedPrivacyManager];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v3;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v30;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(*((void *)&v29 + 1) + 8 * v9);
      if (![v10 length])
      {

        id v14 = 0;
LABEL_14:
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_3;
        v26[3] = &unk_1E59DBA30;
        uint64_t v16 = *(void *)(a1 + 40);
        v26[4] = *(void *)(a1 + 32);
        v26[5] = v10;
        uint64_t v28 = v16;
        id v27 = v4;
        [v5 addOperation:v26];

        goto LABEL_15;
      }
      int v11 = [v10 containsString:@"@"];
      id v12 = objc_alloc(MEMORY[0x1E4FADBD8]);
      uint64_t v13 = v12;
      if (v11)
      {
        id v14 = (void *)[v12 initWithType:3 value:v10];
      }
      else
      {
        long long v15 = PKBestGuessNormalizedPhoneNumber();
        id v14 = (void *)[v13 initWithType:2 value:v15];
      }
      if (!v14 || ([v21 isIncomingCommunicationBlockedForHandle:v14] & 1) == 0) {
        goto LABEL_14;
      }
LABEL_15:

      ++v9;
    }
    while (v7 != v9);
    uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v7);
LABEL_17:

  id v17 = [MEMORY[0x1E4F1CA98] null];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_5;
  v24[3] = &unk_1E59DBA58;
  v24[4] = *(void *)(a1 + 32);
  id v25 = v4;
  id v18 = v4;
  id v19 = (id)[v5 evaluateWithInput:v17 completion:v24];

  id v3 = v20;
LABEL_19:
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_3(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  id v10 = *(void **)(v8 + 1112);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_4;
  v14[3] = &unk_1E59DBA08;
  int v11 = (void *)a1[6];
  uint64_t v18 = a1[7];
  v14[4] = v8;
  void v14[5] = v9;
  id v16 = v6;
  id v17 = v7;
  id v15 = v11;
  id v12 = v6;
  id v13 = v7;
  [v10 contactForHandle:v9 withCompletion:v14];
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [v3 identifier];
    if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) containsObject:v4] & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v4];
      uint64_t v5 = [*(id *)(a1 + 32) _composeAddressKindFromCounterpartHandle:*(void *)(a1 + 40)];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:v7 address:*(void *)(a1 + 40) kind:v5];
      [*(id *)(a1 + 48) addObject:v6];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_6;
  v2[3] = &unk_1E59CA870;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1136);
  *(void *)(v3 + 1136) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1128);

  return [v5 reloadData];
}

uint64_t __55__PKRecipientPickerViewController__generateSuggestions__block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1136);
  *(void *)(v2 + 1136) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 1128);

  return [v4 reloadData];
}

- (void)_configureCell:(id)a3 withContact:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 identifier];
  [v5 setIdentifier:v7];

  [v5 setWantsCustomAppearance:1];
  uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v8];

  uint64_t v9 = [v5 avatarView];
  if (v6)
  {
    v17[0] = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v11 setContactType:0];
    id v16 = v11;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  [v9 setContacts:v10];
  [v9 frame];
  objc_msgSend(v9, "setFrame:");
  [v5 showAvatarView:1];
  id v12 = [v6 emailAddresses];
  id v13 = [v12 firstObject];
  id v14 = [v13 value];

  id v15 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v14 contact:v6];
  [v5 setTitle:v15];
}

- (BOOL)_hasHeaderForSection:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v5 = [(PKRecipientPickerViewController *)self _showRecentSuggestions]
      || [(PKRecipientPickerViewController *)self _showFamilySuggestions];
    return [(PKRecipientPickerViewController *)self _showNearby] && v5;
  }
  else if (a3 == 1)
  {
    return [(PKRecipientPickerViewController *)self _showRecentSuggestions];
  }
  else if (a3)
  {
    return 0;
  }
  else
  {
    return [(PKRecipientPickerViewController *)self _showFamilySuggestions];
  }
}

- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4
{
  id v8 = a3;
  if (a4 == 1)
  {
    uint64_t v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentWal_2.isa);
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecipientPicke_0.isa);
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  [v8 setTitle:v6];
  [v8 setTitleStyle:4];
  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  [v8 setTitleColor:v7];

  [v8 setHorizontalInset:0.0];
}

- (id)_recipientForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (!v5)
  {
    id v6 = &OBJC_IVAR___PKRecipientPickerViewController__suggestedFamilyRecipients;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    id v6 = &OBJC_IVAR___PKRecipientPickerViewController__suggestedRecipients;
LABEL_5:
    id v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "objectAtIndex:", objc_msgSend(v4, "row"));
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)*MEMORY[0x1E4FB2770];
  id v12 = v9;
  id v13 = v11;
  if (v13 == v12)
  {
  }
  else
  {
    id v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_12;
    }
    int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_12;
    }
  }
  uint64_t v16 = [v10 section];
  if (v16 == 2)
  {
    id v17 = [v8 dequeueReusableSupplementaryViewOfKind:v12 withReuseIdentifier:@"PKDashboardRecipientPickerNearbyHeaderIdentifier" forIndexPath:v10];
    goto LABEL_16;
  }
  if (v16 == 1)
  {
    id v17 = [v8 dequeueReusableSupplementaryViewOfKind:v12 withReuseIdentifier:@"PKDashboardRecipientPickerSuggestionsTitleIdentifier" forIndexPath:v10];
    uint64_t v18 = self;
    id v19 = v17;
    uint64_t v20 = 1;
    goto LABEL_15;
  }
  if (v16)
  {
LABEL_12:
    id v17 = 0;
    goto LABEL_16;
  }
  id v17 = [v8 dequeueReusableSupplementaryViewOfKind:v12 withReuseIdentifier:@"PKDashboardRecipientPickerFamilySuggestionsTitleIdentifier" forIndexPath:v10];
  uint64_t v18 = self;
  id v19 = v17;
  uint64_t v20 = 0;
LABEL_15:
  [(PKRecipientPickerViewController *)v18 _configureHeaderView:v19 inSection:v20];
LABEL_16:

  return v17;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    int64_t v9 = [(PKRecipientPickerViewController *)self _showNearby];
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4 && [(PKRecipientPickerViewController *)self _showFamilySuggestions])
      {
        uint64_t v7 = 1144;
        if ([(NSArray *)self->_suggestedFamilyRecipients count] <= 7)
        {
LABEL_6:
          suggestedRecipients = *(NSArray **)((char *)&self->super.super.super.isa + v7);
LABEL_20:
          int64_t v9 = (uint64_t)(double)[(NSArray *)suggestedRecipients count];
          goto LABEL_14;
        }
LABEL_21:
        int64_t v9 = 8;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (![(PKRecipientPickerViewController *)self _showRecentSuggestions])
    {
LABEL_13:
      int64_t v9 = 0;
      goto LABEL_14;
    }
    if (![(PKRecipientPickerViewController *)self _showFamilySuggestions]
      || [(NSArray *)self->_suggestedFamilyRecipients count] > 4)
    {
      BOOL v11 = [(PKRecipientPickerViewController *)self _showNearby];
      NSUInteger v12 = [(NSArray *)self->_suggestedRecipients count];
      if (v11)
      {
        if (v12 > 3)
        {
          int64_t v9 = 4;
          goto LABEL_14;
        }
      }
      else if (v12 > 7)
      {
        goto LABEL_21;
      }
      suggestedRecipients = self->_suggestedRecipients;
      goto LABEL_20;
    }
    uint64_t v7 = 1136;
    if ([(NSArray *)self->_suggestedRecipients count] <= 2) {
      goto LABEL_6;
    }
    int64_t v9 = 2;
  }
LABEL_14:

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 section];
  if (v8 >= 2)
  {
    if (v8 == 2)
    {
      int64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"PKDashboardRecipientPickerNearbyCellIdentifier" forIndexPath:v7];
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"PKDashboardRecipientPickerSuggestionsThumbnailCellIdentifier" forIndexPath:v7];
    id v10 = [(PKRecipientPickerViewController *)self _recipientForIndexPath:v7];
    BOOL v11 = [v10 contact];

    [(PKRecipientPickerViewController *)self _configureCell:v9 withContact:v11];
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  unint64_t v5 = [v7 section];
  if (v5 >= 2)
  {
    if (v5 == 2) {
      [(PKRecipientPickerViewController *)self _showNearbyAmountEntry];
    }
  }
  else
  {
    id v6 = [(PKRecipientPickerViewController *)self _recipientForIndexPath:v7];
    if (v6)
    {
      [(PKRecipientPickerViewController *)self _addRecipient:v6];
      [(PKRecipientPickerViewController *)self _showNextScreenWithRecipient:v6];
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v7 bounds];
  double v10 = 75.0;
  if ((v9 + -24.0) * 0.25 < 75.0)
  {
    [v7 bounds];
    double v10 = (v11 + -24.0) * 0.25;
  }
  if ([v8 section] == 2)
  {
    p_sampleNearbyCell = (id *)&self->_sampleNearbyCell;
  }
  else
  {
    p_sampleNearbyCell = (id *)&self->_sampleThumbnailCell;
    [(PKRecipientPickerViewController *)self _configureCell:self->_sampleThumbnailCell withContact:0];
  }
  objc_msgSend(*p_sampleNearbyCell, "sizeThatFits:", v10, 3.40282347e38);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(PKRecipientPickerViewController *)self _hasHeaderForSection:a5])
  {
    if (a5 == 2)
    {
      p_sampleNearbyHeaderView = (void **)&self->_sampleNearbyHeaderView;
    }
    else
    {
      p_sampleNearbyHeaderView = (void **)&self->_sampleHeaderView;
      [(PKRecipientPickerViewController *)self _configureHeaderView:self->_sampleHeaderView inSection:a5];
    }
    double v11 = *p_sampleNearbyHeaderView;
    [v7 bounds];
    objc_msgSend(v11, "sizeThatFits:", v12, 3.40282347e38);
    double v9 = v13;
    double v10 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v15 = v9;
  double v16 = v10;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 8.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 12.0;
  if (a5 == 2) {
    double v5 = 24.0;
  }
  double v6 = 0.0;
  if (a5 != 2) {
    double v6 = 24.0;
  }
  double v7 = 0.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v2 = [(PKRecipientPickerViewController *)self overrideUserInterfaceStyle] == 2;
  int64_t v3 = v2;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (PKRecipientPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKRecipientPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKNearbyPeerPaymentViewProvider)nearbyViewProvider
{
  return self->_nearbyViewProvider;
}

- (void)setNearbyViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyViewProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_sampleNearbyCell, 0);
  objc_storeStrong((id *)&self->_sampleNearbyHeaderView, 0);
  objc_storeStrong((id *)&self->_sampleThumbnailCell, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_suggestedFamilyRecipients, 0);
  objc_storeStrong((id *)&self->_suggestedRecipients, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_currentRecipientText, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_recipientTextView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_autocompleteResults, 0);
  objc_storeStrong((id *)&self->_currentTaskID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end