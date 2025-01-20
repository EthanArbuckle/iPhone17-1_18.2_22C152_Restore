@interface PKAccountBillPaymentLearnMoreViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (PKAccountBillPaymentLearnMoreViewController)initWithAccount:(id)a3;
- (id)_customerAgreementAttributedString;
- (void)_reportEventForPassIfNecessary:(id)a3;
- (void)doneButtonTapped;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PKAccountBillPaymentLearnMoreViewController

- (PKAccountBillPaymentLearnMoreViewController)initWithAccount:(id)a3
{
  id v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  v6 = [(PKAccountBillPaymentLearnMoreViewController *)&v48 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    [(PKAccount *)v7->_account feature];
    v8 = [(PKAccountBillPaymentLearnMoreViewController *)v7 navigationItem];
    objc_msgSend(v8, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v8, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v7 action:sel_doneButtonTapped];
    [v8 setRightBarButtonItem:v9];
    uint64_t v10 = PKLocalizedFeatureString();
    titleText = v7->_titleText;
    v7->_titleText = (NSString *)v10;

    uint64_t v12 = PKLocalizedFeatureString();
    subtitleText = v7->_subtitleText;
    v7->_subtitleText = (NSString *)v12;

    uint64_t v14 = PKLocalizedFeatureString();
    customerAgreementLinkText = v7->_customerAgreementLinkText;
    v7->_customerAgreementLinkText = (NSString *)v14;

    v47 = v7->_customerAgreementLinkText;
    uint64_t v16 = PKLocalizedFeatureString();
    customerAgreementText = v7->_customerAgreementText;
    v7->_customerAgreementText = (NSString *)v16;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);
    v20 = PKLocalizedFeatureString();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v19, "setTitle:", v20, v47);

    v21 = PKLocalizedBeekmanString(&cfstr_AccountService_354.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v19 setMessage:v21];

    [v18 addObject:v19];
    v22 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    v23 = PKLocalizedFeatureString();
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v22 setTitle:v23];

    v24 = PKLocalizedBeekmanString(&cfstr_AccountService_356.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v22 setMessage:v24];

    [v18 addObject:v22];
    v25 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    v26 = PKLocalizedFeatureString();
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v25 setTitle:v26];

    v27 = PKLocalizedBeekmanString(&cfstr_AccountService_358.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v25 setMessage:v27];

    [v18 addObject:v25];
    v28 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    v29 = PKLocalizedFeatureString();
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v28 setTitle:v29];

    v30 = PKLocalizedBeekmanString(&cfstr_AccountService_360.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v28 setMessage:v30];

    [v18 addObject:v28];
    v31 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    v32 = PKLocalizedFeatureString();
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v31 setTitle:v32];

    v33 = PKLocalizedFeatureString();
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v31 setMessage:v33];

    [v18 addObject:v31];
    v34 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    v35 = PKLocalizedBeekmanString(&cfstr_AccountService_363.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v34 setTitle:v35];

    v36 = PKLocalizedBeekmanString(&cfstr_AccountService_364.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v34 setMessage:v36];

    [v18 addObject:v34];
    v37 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    v38 = PKLocalizedFeatureString();
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v37 setTitle:v38];

    v39 = PKLocalizedBeekmanString(&cfstr_AccountService_366.isa);
    [(PKAccountBillPaymentLearnMoreSuggestionDescription *)v37 setMessage:v39];

    [v18 addObject:v37];
    uint64_t v40 = [v18 copy];
    suggestionDescriptions = v7->_suggestionDescriptions;
    v7->_suggestionDescriptions = (NSArray *)v40;

    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v43 = PKLocalizedFeatureString();
    [v42 addObject:v43];
    uint64_t v44 = [v42 copy];
    footnotes = v7->_footnotes;
    v7->_footnotes = (NSArray *)v44;
  }
  return v7;
}

- (void)loadView
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v65.receiver = self;
  v65.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  [(PKAccountBillPaymentLearnMoreViewController *)&v65 loadView];
  v3 = [(PKAccountBillPaymentLearnMoreViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v10 = (UIScrollView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  v51 = v3;
  [v3 addSubview:self->_scrollView];
  uint64_t v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  uint64_t v14 = self->_titleLabel;
  v15 = (NSString *)*MEMORY[0x1E4FB27F0];
  uint64_t v16 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
  [(UILabel *)v14 setFont:v16];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setText:self->_titleText];
  [(UIScrollView *)self->_scrollView addSubview:self->_titleLabel];
  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v17;

  v19 = self->_subtitleLabel;
  v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2998], v15);
  [(UILabel *)v19 setFont:v20];

  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setText:self->_subtitleText];
  [(UIScrollView *)self->_scrollView addSubview:self->_subtitleLabel];
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v21 = self;
  obuint64_t j = self->_suggestionDescriptions;
  uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    v53 = (NSString *)*MEMORY[0x1E4FB2908];
    id v54 = *(id *)v62;
    v24 = (NSString *)*MEMORY[0x1E4FB2950];
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(id *)v62 != v54) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
        v28 = PKFontForDefaultDesign(v53, v15);
        [v27 setFont:v28];

        [v27 setNumberOfLines:0];
        v29 = [v26 title];
        [v27 setText:v29];

        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
        v31 = PKFontForDefaultDesign(v24, v15);
        [v30 setFont:v31];

        [v30 setNumberOfLines:0];
        v32 = [v26 message];
        [v30 setText:v32];

        v33 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel);
        [(PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel *)v33 setTitleLabel:v27];
        [(PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel *)v33 setMessageLabel:v30];
        [(UIScrollView *)v21->_scrollView addSubview:v27];
        [(UIScrollView *)v21->_scrollView addSubview:v30];
        [v56 addObject:v33];
      }
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v23);
  }

  uint64_t v34 = [v56 copy];
  suggestionDescriptionLabels = v21->_suggestionDescriptionLabels;
  v21->_suggestionDescriptionLabels = (NSArray *)v34;

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v55 = v21->_footnotes;
  uint64_t v37 = [(NSArray *)v55 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v58;
    uint64_t v40 = (NSString *)*MEMORY[0x1E4FB28F0];
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v58 != v39) {
          objc_enumerationMutation(v55);
        }
        uint64_t v42 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
        uint64_t v44 = PKFontForDefaultDesign(v40, v15);
        [v43 setFont:v44];

        [v43 setNumberOfLines:0];
        [v43 setText:v42];
        [(UIScrollView *)v21->_scrollView addSubview:v43];
        [v36 addObject:v43];
      }
      uint64_t v38 = [(NSArray *)v55 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v38);
  }

  uint64_t v45 = [v36 copy];
  footnoteLabels = v21->_footnoteLabels;
  v21->_footnoteLabels = (NSArray *)v45;

  uint64_t v47 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", v6, v7, v8, v9);
  customerAgreementTextView = v21->_customerAgreementTextView;
  v21->_customerAgreementTextView = (UITextView *)v47;

  [(UITextView *)v21->_customerAgreementTextView setDelegate:v21];
  [(UITextView *)v21->_customerAgreementTextView setSelectable:1];
  [(UITextView *)v21->_customerAgreementTextView setUserInteractionEnabled:1];
  [(UITextView *)v21->_customerAgreementTextView _setInteractiveTextSelectionDisabled:1];
  -[UITextView setTextContainerInset:](v21->_customerAgreementTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v49 = v21->_customerAgreementTextView;
  v50 = [(PKAccountBillPaymentLearnMoreViewController *)v21 _customerAgreementAttributedString];
  [(UITextView *)v49 setAttributedText:v50];

  [(UIScrollView *)v21->_scrollView addSubview:v21->_customerAgreementTextView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  [(PKAccountBillPaymentLearnMoreViewController *)&v5 viewDidAppear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A0];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKAccountBillPaymentLearnMoreViewController *)self _reportEventForPassIfNecessary:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  [(PKAccountBillPaymentLearnMoreViewController *)&v5 viewDidDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKAccountBillPaymentLearnMoreViewController *)self _reportEventForPassIfNecessary:v4];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v3 = [(PKAccountBillPaymentLearnMoreViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v48 = v8;
  double v9 = 24.0;
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    uint64_t v10 = [v3 readableContentGuide];
    [v10 layoutFrame];
    double v9 = v11;
  }
  [v3 safeAreaInsets];
  [v3 safeAreaInsets];
  double v12 = v5 + v9;
  double v13 = v7 - (v9 + v9);
  [(UILabel *)self->_titleLabel frame];
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
  CGFloat v15 = v14;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, 30.0, v13, v14);
  [(UILabel *)self->_subtitleLabel frame];
  v60.origin.y = 30.0;
  v60.origin.x = v12;
  v60.size.width = v13;
  v60.size.height = v15;
  CGFloat v16 = CGRectGetMaxY(v60) + 15.0;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
  CGFloat v18 = v17;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v12, v16, v13, v17);
  v61.origin.x = v12;
  v61.origin.y = v16;
  v61.size.width = v13;
  v61.size.height = v18;
  double v19 = CGRectGetMaxY(v61) + 15.0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v20 = self->_suggestionDescriptionLabels;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v26 = [v25 titleLabel];
        [v26 frame];
        CGFloat v27 = v19 + 20.0;
        objc_msgSend(v26, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
        CGFloat v29 = v28;
        objc_msgSend(v26, "setFrame:", v12, v27, v13, v28);
        v62.origin.x = v12;
        v62.origin.y = v27;
        v62.size.width = v7 - (v9 + v9);
        v62.size.height = v29;
        double MaxY = CGRectGetMaxY(v62);
        v31 = [v25 messageLabel];
        [v31 frame];
        CGFloat v32 = MaxY + 5.0;
        objc_msgSend(v31, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
        CGFloat v34 = v33;
        objc_msgSend(v31, "setFrame:", v12, v32, v13, v33);
        v63.origin.x = v12;
        v63.origin.y = v32;
        v63.size.width = v7 - (v9 + v9);
        v63.size.height = v34;
        double v19 = CGRectGetMaxY(v63);
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v22);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v35 = self->_footnoteLabels;
  uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        [v40 frame];
        CGFloat v41 = v19 + 15.0;
        objc_msgSend(v40, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
        CGFloat v43 = v42;
        objc_msgSend(v40, "setFrame:", v12, v41, v13, v42);
        v64.origin.x = v12;
        v64.origin.y = v41;
        v64.size.width = v7 - (v9 + v9);
        v64.size.height = v43;
        double v19 = CGRectGetMaxY(v64);
      }
      uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v37);
  }

  [(UITextView *)self->_customerAgreementTextView frame];
  CGFloat v44 = v19 + 20.0;
  -[UITextView sizeThatFits:](self->_customerAgreementTextView, "sizeThatFits:", v13, 1.79769313e308);
  CGFloat v46 = v45;
  -[UITextView setFrame:](self->_customerAgreementTextView, "setFrame:", v12, v44, v13, v45);
  v65.origin.x = v12;
  v65.origin.y = v44;
  v65.size.width = v13;
  v65.size.height = v46;
  CGFloat v47 = CGRectGetMaxY(v65) + 20.0;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, 0.0, v7, v48);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, v47);
}

- (void)doneButtonTapped
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKAccountBillPaymentLearnMoreViewController *)self dismissViewControllerWithTransition:9 completion:0];
  }
  else
  {
    [(PKAccountBillPaymentLearnMoreViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PKAccount *)self->_account creditDetails];
  double v11 = [v10 termsIdentifier];

  if (v11)
  {
    double v12 = [PKAccountTermsAndConditionsController alloc];
    account = self->_account;
    double v14 = [MEMORY[0x1E4F84D50] sharedService];
    CGFloat v15 = [(PKAccountTermsAndConditionsController *)v12 initWithAccount:account webService:v14 context:0 termsIdentifier:v11];
    termsController = self->_termsController;
    self->_termsController = v15;

    objc_initWeak(location, self);
    double v17 = self->_termsController;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __98__PKAccountBillPaymentLearnMoreViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v21[3] = &unk_1E59CB9C8;
    objc_copyWeak(&v22, location);
    [(PKAccountTermsAndConditionsController *)v17 termsViewControllerWithCompletion:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    CGFloat v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = [(PKAccount *)self->_account accountIdentifier];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Error: Account: %@ is missing terms and conditions. Using the value in the pass instead.", (uint8_t *)location, 0xCu);
    }
  }

  return 0;
}

void __98__PKAccountBillPaymentLearnMoreViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      id v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (id)_customerAgreementAttributedString
{
  if ([(NSString *)self->_customerAgreementText length])
  {
    NSUInteger v3 = [(NSString *)self->_customerAgreementText length];
    double v4 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EF1B5B50];
    uint64_t v5 = [(NSString *)self->_customerAgreementText rangeOfString:self->_customerAgreementLinkText];
    uint64_t v7 = v6;
    id v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27F0]);
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_customerAgreementText];
    uint64_t v10 = [MEMORY[0x1E4FB1618] linkColor];
    objc_msgSend(v9, "pk_addLinkURL:toRange:withColor:isUnderlined:", v4, v5, v7, v10, 0);

    double v11 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    double v12 = (void *)[v11 mutableCopy];

    [v12 setLineBreakMode:0];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v12, 0, v3);
    uint64_t v13 = *MEMORY[0x1E4FB0700];
    double v14 = [MEMORY[0x1E4FB1618] labelColor];
    objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, v3);

    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v8, 0, v3);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  scrollView = self->_scrollView;
  id v4 = [(PKAccountBillPaymentLearnMoreViewController *)self navigationItem];
  [(UIScrollView *)scrollView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:v4];
}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  id v8 = a3;
  id v4 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForAccount:self->_account];
  if (v8 && v4)
  {
    uint64_t v5 = (void *)[v8 mutableCopy];
    [v5 setObject:*MEMORY[0x1E4F86240] forKey:*MEMORY[0x1E4F86730]];
    uint64_t v6 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v7 = (void *)[v5 copy];
    [v6 subject:v4 sendEvent:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customerAgreementTextView, 0);
  objc_storeStrong((id *)&self->_footnoteLabels, 0);
  objc_storeStrong((id *)&self->_suggestionDescriptionLabels, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_customerAgreementLinkText, 0);
  objc_storeStrong((id *)&self->_customerAgreementText, 0);
  objc_storeStrong((id *)&self->_footnotes, 0);
  objc_storeStrong((id *)&self->_suggestionDescriptions, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end