@interface PKAccountBillPaymentPayLaterViewController
- (PKAccountBillPaymentObserver)observer;
- (PKAccountBillPaymentPayLaterViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 billPaymentController:(id)a5 transactionSource:(id)a6 suggestionList:(id)a7 selectedAmount:(id)a8;
- (double)_payButtonTopPadding;
- (double)_sideMargin;
- (id)_addBankAccountInformationViewController;
- (id)_dateForRow:(int64_t)a3;
- (id)_dateStringForRow:(int64_t)a3 formatter:(id)a4;
- (id)_interestForSelectedDate:(id)a3;
- (id)_stripTimeFromDate:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)presentationSceneIdentifierForAccountBillPaymentController:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_accountDidChange:(id)a3;
- (void)_dismissViewControllerWithSuccess:(BOOL)a3;
- (void)_payOnButtonTapped:(id)a3;
- (void)_performBillPaymentWithAmount:(id)a3 scheduledDate:(id)a4 billPaymentSuggestedAmountDataEvent:(id)a5;
- (void)_presentAddBankAccount;
- (void)_presentAlertControllerForError:(id)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_updateLabelText;
- (void)accountBillPaymentController:(id)a3 hasChangedState:(unint64_t)a4 error:(id)a5 updatedAccount:(id)a6;
- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4;
- (void)addBankAccountInformationViewControllerDidFinish:(id)a3;
- (void)billPaymentPayInterestDescriptionViewHasTappedLearnMore:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setObserver:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountBillPaymentPayLaterViewController

- (PKAccountBillPaymentPayLaterViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 billPaymentController:(id)a5 transactionSource:(id)a6 suggestionList:(id)a7 selectedAmount:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v70 = a6;
  id v69 = a7;
  id v68 = a8;
  v71.receiver = self;
  v71.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  v18 = [(PKAccountBillPaymentPayLaterViewController *)&v71 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    id v66 = v17;
    id v67 = v16;
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_accountUserCollection, a4);
    objc_storeStrong((id *)&v19->_transactionSource, a6);
    objc_storeStrong((id *)&v19->_billPaymentCoordinator, a5);
    [(PKAccountBillPaymentController *)v19->_billPaymentCoordinator setDelegate:v19];
    objc_storeStrong((id *)&v19->_suggestionList, a7);
    objc_storeStrong((id *)&v19->_selectedAmount, a8);
    v65 = [(PKAccount *)v19->_account creditDetails];
    v20 = [v65 accountSummary];
    uint64_t v21 = [v20 remainingStatementBalance];
    remainingStatementBalance = v19->_remainingStatementBalance;
    v19->_remainingStatementBalance = (NSDecimalNumber *)v21;

    v23 = [v15 creditDetails];
    v24 = [v23 rates];
    uint64_t v25 = [v24 aprForPurchases];
    apr = v19->_apr;
    v19->_apr = (NSDecimalNumber *)v25;

    v19->_currentPickerViewRow[0] = -1;
    id v27 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v28 = *MEMORY[0x1E4F1C318];
    uint64_t v29 = [v27 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    productCalendar = v19->_productCalendar;
    v19->_productCalendar = (NSCalendar *)v29;

    v31 = v19->_productCalendar;
    v32 = [v15 creditDetails];
    v33 = [v32 productTimeZone];
    [(NSCalendar *)v31 setTimeZone:v33];

    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v28];
    localCalendar = v19->_localCalendar;
    v19->_localCalendar = (NSCalendar *)v34;

    v36 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatterDayOfWeek = v19->_dateFormatterDayOfWeek;
    v19->_dateFormatterDayOfWeek = v36;

    v38 = v19->_dateFormatterDayOfWeek;
    v39 = [v15 creditDetails];
    v40 = [v39 productTimeZone];
    [(NSDateFormatter *)v38 setTimeZone:v40];

    v41 = v19->_dateFormatterDayOfWeek;
    v42 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v41 setLocale:v42];

    [(NSDateFormatter *)v19->_dateFormatterDayOfWeek setLocalizedDateFormatFromTemplate:@"EEEE, MMMM d"];
    [(NSDateFormatter *)v19->_dateFormatterDayOfWeek setFormattingContext:2];
    v43 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v43;

    v45 = v19->_dateFormatter;
    v46 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v45 setLocale:v46];

    v47 = v19->_dateFormatter;
    v48 = [v15 creditDetails];
    v49 = [v48 productTimeZone];
    [(NSDateFormatter *)v47 setTimeZone:v49];

    [(NSDateFormatter *)v19->_dateFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
    id v50 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v50 setDay:1];
    v51 = v19->_productCalendar;
    v52 = [MEMORY[0x1E4F1C9C8] date];
    v53 = [(NSCalendar *)v51 dateByAddingComponents:v50 toDate:v52 options:0];

    uint64_t v54 = [(PKAccountBillPaymentPayLaterViewController *)v19 _stripTimeFromDate:v53];
    minDate = v19->_minDate;
    v19->_minDate = (NSDate *)v54;

    v56 = [v20 paymentDueDate];
    if (!v56 || [v15 isClosedAndChargedOff])
    {
      uint64_t v57 = PKEndOfNextMonth();

      v56 = (void *)v57;
    }
    uint64_t v58 = [(PKAccountBillPaymentPayLaterViewController *)v19 _stripTimeFromDate:v56];
    maxDate = v19->_maxDate;
    v19->_maxDate = (NSDate *)v58;

    if (!v19->_maxDate) {
      objc_storeStrong((id *)&v19->_maxDate, v19->_minDate);
    }
    v60 = -[NSCalendar components:fromDate:toDate:options:](v19->_productCalendar, "components:fromDate:toDate:options:", 16, v19->_minDate);
    v19->_numDays = [v60 day] + 1;

    v61 = [(PKAccountBillPaymentPayLaterViewController *)v19 navigationItem];
    id v62 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v62 configureWithTransparentBackground];
    [v61 setStandardAppearance:v62];
    v63 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v63 addObserver:v19 selector:sel__accountDidChange_ name:*MEMORY[0x1E4F85BF8] object:0];

    id v17 = v66;
    id v16 = v67;
  }

  return v19;
}

- (void)dealloc
{
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    [(CLInUseAssertion *)CLInUse invalidate];
    v4 = self->_CLInUse;
    self->_CLInUse = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  [(PKAccountBillPaymentPayLaterViewController *)&v5 dealloc];
}

- (void)loadView
{
  v41.receiver = self;
  v41.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  [(PKAccountBillPaymentPayLaterViewController *)&v41 loadView];
  [(PKAccount *)self->_account feature];
  uint64_t v3 = PKUIGetMinScreenWidthType();
  uint64_t v4 = PKLocalizedFeatureString();
  v40 = (void *)v4;
  if (v3 || PKIsVision())
  {
    objc_super v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    payLaterTitleLabel = self->_payLaterTitleLabel;
    self->_payLaterTitleLabel = v5;

    [(UILabel *)self->_payLaterTitleLabel setTextAlignment:1];
    [(UILabel *)self->_payLaterTitleLabel setText:v4];
    v7 = self->_payLaterTitleLabel;
    v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2980], (void *)*MEMORY[0x1E4FB27B8], 32770, 0);
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)self->_payLaterTitleLabel setNumberOfLines:0];
    [(UILabel *)self->_payLaterTitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  }
  else
  {
    [(PKAccountBillPaymentPayLaterViewController *)self setTitle:v4];
  }
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  whenToPayQuestionLabel = self->_whenToPayQuestionLabel;
  self->_whenToPayQuestionLabel = v9;

  [(UILabel *)self->_whenToPayQuestionLabel setTextAlignment:1];
  v11 = self->_whenToPayQuestionLabel;
  v12 = [(PKAccount *)self->_account creditDetails];
  v13 = [v12 currencyCode];
  v14 = PKFormattedCurrencyStringFromNumber();
  id v15 = PKLocalizedFeatureString();
  -[UILabel setText:](v11, "setText:", v15, v14);

  id v16 = self->_whenToPayQuestionLabel;
  id v17 = (void *)*MEMORY[0x1E4FB28C8];
  v18 = (void *)*MEMORY[0x1E4FB2790];
  v19 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
  [(UILabel *)v16 setFont:v19];

  [(UILabel *)self->_whenToPayQuestionLabel setNumberOfLines:0];
  [(UILabel *)self->_whenToPayQuestionLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  v20 = objc_alloc_init(_PKContinuousPickerView);
  datePicker = self->_datePicker;
  self->_datePicker = &v20->super;

  [(UIPickerView *)self->_datePicker setDelegate:self];
  [(UIPickerView *)self->_datePicker setDataSource:self];
  v22 = [[PKAccountBillPaymentPayInterestDescriptionView alloc] initWithAccount:self->_account];
  interestDescriptionView = self->_interestDescriptionView;
  self->_interestDescriptionView = v22;

  v24 = [(PKAccount *)self->_account creditDetails];
  uint64_t v25 = [v24 accountSummary];
  v26 = [v25 paymentDueDate];

  if ([(PKAccount *)self->_account showBillPaymentInterest]) {
    [(PKAccountBillPaymentPayInterestDescriptionView *)self->_interestDescriptionView setInterestChargeDate:v26];
  }
  [(PKAccountBillPaymentPayInterestDescriptionView *)self->_interestDescriptionView setDelegate:self];
  PKCreateLargeSolidButton();
  id v27 = (PKLegacyButtonInterface *)objc_claimAutoreleasedReturnValue();
  payOnButton = self->_payOnButton;
  self->_payOnButton = v27;

  uint64_t v29 = self->_payOnButton;
  v30 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKLegacyButtonInterface *)v29 setTintColor:v30];

  v31 = self->_payOnButton;
  v32 = +[PKAccountBillPaymentViewController backgroundColor];
  [(PKLegacyButtonInterface *)v31 updateTitleColorWithColor:v32];

  v33 = [(PKLegacyButtonInterface *)self->_payOnButton titleLabel];
  uint64_t v34 = PKFontForDefaultDesign(v17, v18, 2, 0);
  v35 = objc_msgSend(v34, "pk_fixedWidthFont");
  [v33 setFont:v35];

  -[PKLegacyButtonInterface setContentEdgeInsets:](self->_payOnButton, "setContentEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
  v36 = [(PKLegacyButtonInterface *)self->_payOnButton titleLabel];
  [v36 setAdjustsFontSizeToFitWidth:1];

  [(PKLegacyButtonInterface *)self->_payOnButton addTarget:self action:sel__payOnButtonTapped_ forControlEvents:64];
  [(PKLegacyButtonInterface *)self->_payOnButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
  v37 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  v38 = +[PKAccountBillPaymentViewController backgroundColor];
  [v37 setBackgroundColor:v38];

  [v37 addSubview:self->_payLaterTitleLabel];
  [v37 addSubview:self->_whenToPayQuestionLabel];
  [v37 addSubview:self->_datePicker];
  [v37 addSubview:self->_payOnButton];
  [v37 addSubview:self->_interestDescriptionView];
  [(PKAccountBillPaymentPayLaterViewController *)self _updateLabelText];
  v39 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  [v39 setAccessibilityIdentifier:*MEMORY[0x1E4F85798]];
}

- (void)viewWillLayoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  [(PKAccountBillPaymentPayLaterViewController *)&v53 viewWillLayoutSubviews];
  uint64_t v3 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PKAccountBillPaymentPayLaterViewController *)self _sideMargin];
  double v13 = v12;
  [v3 safeAreaInsets];
  double v15 = v14;
  [v3 safeAreaInsets];
  v54.origin.x = v13 + v5;
  v54.origin.y = v7 + v15;
  double v16 = v9 - (v13 + v13);
  v54.size.height = v11 - (v15 + v17);
  double v49 = v13 + v5;
  double v50 = v7 + v15;
  v54.size.width = v16;
  CGFloat rect = v54.size.height;
  CGRectGetMinY(v54);
  double v51 = v9;
  if (self->_payLaterTitleLabel)
  {
    PKUIGetMinScreenWidthType();
    -[UILabel sizeThatFits:](self->_payLaterTitleLabel, "sizeThatFits:", v16, 3.40282347e38);
    PKRectCenteredXInRect();
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v22 = v5;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    -[UILabel setFrame:](self->_payLaterTitleLabel, "setFrame:");
    v55.origin.x = v19;
    v55.origin.y = v21;
    v55.size.width = v24;
    double v5 = v22;
    v55.size.height = v26;
    double MaxY = CGRectGetMaxY(v55);
  }
  else
  {
    double MaxY = 20.0;
  }
  double v44 = v5;
  [(UILabel *)self->_whenToPayQuestionLabel frame];
  -[UILabel sizeThatFits:](self->_whenToPayQuestionLabel, "sizeThatFits:", v16, 3.40282347e38);
  PKRectCenteredXInRect();
  CGFloat v47 = v29;
  CGFloat v48 = v28;
  CGFloat v45 = v31;
  CGFloat v46 = v30;
  -[UILabel setFrame:](self->_whenToPayQuestionLabel, "setFrame:");
  [(PKLegacyButtonInterface *)self->_payOnButton frame];
  -[PKLegacyButtonInterface sizeThatFits:](self->_payOnButton, "sizeThatFits:", v16, 3.40282347e38);
  if (v32 >= 50.0) {
    double v33 = v32;
  }
  else {
    double v33 = 50.0;
  }
  v56.origin.x = v49;
  v56.origin.y = v50;
  v56.size.width = v16;
  v56.size.height = rect;
  CGFloat v34 = CGRectGetMaxY(v56) - v33 + -50.0 + -5.0;
  -[PKLegacyButtonInterface setFrame:](self->_payOnButton, "setFrame:", v49, v34, v16, v33);
  [(PKAccountBillPaymentPayInterestDescriptionView *)self->_interestDescriptionView frame];
  -[PKAccountBillPaymentPayInterestDescriptionView sizeThatFits:](self->_interestDescriptionView, "sizeThatFits:", v16, 3.40282347e38);
  v57.origin.x = v49;
  v57.origin.y = v34;
  v57.size.width = v16;
  v57.size.height = v33;
  CGRectGetMinY(v57);
  [(PKAccountBillPaymentPayLaterViewController *)self _payButtonTopPadding];
  PKRectCenteredXInRect();
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  -[PKAccountBillPaymentPayInterestDescriptionView setFrame:](self->_interestDescriptionView, "setFrame:");
  [(UIPickerView *)self->_datePicker frame];
  v58.origin.y = v47;
  v58.origin.x = v48;
  v58.size.height = v45;
  v58.size.width = v46;
  CGFloat v43 = CGRectGetMaxY(v58) + 20.0;
  v59.origin.x = v36;
  v59.origin.y = v38;
  v59.size.width = v40;
  v59.size.height = v42;
  -[UIPickerView setFrame:](self->_datePicker, "setFrame:", v44, v43, v51, CGRectGetMinY(v59) - v43);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  [(PKAccountBillPaymentPayLaterViewController *)&v6 viewWillDisappear:a3];
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    [(CLInUseAssertion *)CLInUse invalidate];
    double v5 = self->_CLInUse;
    self->_CLInUse = 0;
  }
}

- (void)accountBillPaymentController:(id)a3 hasChangedState:(unint64_t)a4 error:(id)a5 updatedAccount:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = v12;
  self->_performingAction = 0;
  switch(a4)
  {
    case 2uLL:
      [(PKAccountBillPaymentPayLaterViewController *)self _setEnabled:1];
      break;
    case 1uLL:
      if (v12) {
        objc_storeStrong((id *)&self->_account, a6);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      if (objc_opt_respondsToSelector())
      {
        double v15 = [(PKAccountBillPaymentController *)self->_billPaymentCoordinator payments];
        [WeakRetained accountBillPaymentViewController:self didSchedulePayments:v15];
      }
      double v16 = [(PKAccountBillPaymentController *)self->_billPaymentCoordinator payments];
      if ([v16 count])
      {
        double v17 = [(PKTransactionSource *)self->_transactionSource paymentPass];
        double v18 = [[PKAccountBillPaymentConfirmationViewController alloc] initWithAccount:self->_account paymentPass:v17 scheduledPayments:v16];
        objc_initWeak(&location, self);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke;
        v20[3] = &unk_1E59CB268;
        objc_copyWeak(&v22, &location);
        CGFloat v19 = v18;
        CGFloat v21 = v19;
        [(PKAccountBillPaymentConfirmationViewController *)v19 preflightWithCompletion:v20];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      else
      {
        [(PKAccountBillPaymentPayLaterViewController *)self _dismissViewControllerWithSuccess:1];
      }

      break;
    case 0uLL:
      [(PKAccountBillPaymentPayLaterViewController *)self _presentAlertControllerForError:v11];
      break;
  }
}

void __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationController];
    [v3 pushViewController:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v4;
  }
}

- (id)presentationSceneIdentifierForAccountBillPaymentController:(id)a3
{
  id v3 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  id v4 = [v3 window];
  double v5 = [v4 windowScene];
  objc_super v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  billPaymentCoordinator = self->_billPaymentCoordinator;
  id v8 = a4;
  double v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  double v7 = [v5 arrayWithObjects:&v8 count:1];
  -[PKAccountBillPaymentController setFundingSources:](billPaymentCoordinator, "setFundingSources:", v7, v8, v9);
}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [(PKAccountBillPaymentPayLaterViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

void __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1176);
  *(void *)(v2 + 1176) = 0;

  id v4 = objc_msgSend(*(id *)(a1 + 32), "_dateForRow:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1128), "selectedRowInComponent:", 0));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1008);
  uint64_t v7 = *(void *)(v5 + 1088);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2;
  v8[3] = &unk_1E59CDF18;
  v8[4] = v5;
  [v6 canPerformBillPaymentWithAmount:v7 scheduledDate:v4 completion:v8];
}

void __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = v5;
    [*(id *)(a1 + 32) _payOnButtonTapped:0];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v7 = v5;
    [*(id *)(a1 + 32) _presentAlertControllerForError:v5];
  }
  id v6 = v7;
LABEL_6:
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[PKAccountBillPaymentPayLaterViewController _dateStringForRow:formatter:](self, "_dateStringForRow:formatter:", a4, self->_dateFormatterDayOfWeek, a5);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if (self->_currentPickerViewRow[a5] != a4)
  {
    self->_currentPickerViewRow[a5] = a4;
    [(PKAccountBillPaymentPayLaterViewController *)self _updateLabelText];
  }
}

- (void)billPaymentPayInterestDescriptionViewHasTappedLearnMore:(id)a3
{
  id v6 = [[PKAccountBillPaymentLearnMoreViewController alloc] initWithAccount:self->_account];
  id v4 = [[PKNavigationController alloc] initWithRootViewController:v6];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v4 setModalPresentationStyle:3];
    id v5 = [(PKAccountBillPaymentPayLaterViewController *)self navigationController];
    [v5 presentViewController:v4 withTransition:8 completion:0];
  }
  else
  {
    id v5 = [(PKAccountBillPaymentPayLaterViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return self->_numDays;
}

- (void)_performBillPaymentWithAmount:(id)a3 scheduledDate:(id)a4 billPaymentSuggestedAmountDataEvent:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_CLInUse)
  {
    id v11 = (void *)MEMORY[0x1E4F1E5E8];
    id v12 = PKPassKitCoreBundle();
    double v13 = (CLInUseAssertion *)[v11 newAssertionForBundle:v12 withReason:@"Perform Account Service Future Payment"];
    CLInUse = self->_CLInUse;
    self->_CLInUse = v13;
  }
  if (self->_performingAction)
  {
    double v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      double v17 = "-[PKAccountBillPaymentPayLaterViewController _performBillPaymentWithAmount:scheduledDate:billPaymentSuggeste"
            "dAmountDataEvent:]";
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    self->_performingAction = 1;
    [(PKAccountBillPaymentPayLaterViewController *)self _setEnabled:0];
    [(PKAccountBillPaymentController *)self->_billPaymentCoordinator performBillPaymentActionWithAmount:v8 scheduledDate:v9 billPaymentSuggestedAmountDataEvent:v10];
  }
}

- (void)_accountDidChange:(id)a3
{
  if (self->_account)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F84270], "sharedInstance", a3);
    id v5 = [(PKAccount *)self->_account accountIdentifier];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke;
    v6[3] = &unk_1E59CB1C8;
    v6[4] = self;
    [v4 accountWithIdentifier:v5 completion:v6];
  }
}

void __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke_2(uint64_t a1)
{
}

- (void)_payOnButtonTapped:(id)a3
{
  [(PKAccountBillPaymentPayLaterViewController *)self _setEnabled:0];
  id v4 = [(PKAccountBillPaymentPayLaterViewController *)self _dateForRow:[(UIPickerView *)self->_datePicker selectedRowInComponent:0]];
  billPaymentCoordinator = self->_billPaymentCoordinator;
  selectedAmount = self->_selectedAmount;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PKAccountBillPaymentPayLaterViewController__payOnButtonTapped___block_invoke;
  v8[3] = &unk_1E59CDC80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(PKAccountBillPaymentController *)billPaymentCoordinator canPerformBillPaymentWithAmount:selectedAmount scheduledDate:v7 completion:v8];
}

void __65__PKAccountBillPaymentPayLaterViewController__payOnButtonTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v14 = v5;
  if (a2)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 984) accountIdentifier];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 984) creditDetails];
    id v8 = [v7 accountSummary];
    id v9 = [v8 currentStatement];
    id v10 = [v9 identifier];

    id v11 = [*(id *)(*(void *)(a1 + 32) + 1016) billPaymentSelectedSuggestedAmountDataEventForAmount:*(void *)(*(void *)(a1 + 32) + 1088) accountIdentifier:v6 statementIdentifier:v10];
    [*(id *)(a1 + 32) _performBillPaymentWithAmount:*(void *)(*(void *)(a1 + 32) + 1088) scheduledDate:*(void *)(a1 + 40) billPaymentSuggestedAmountDataEvent:v11];
  }
  else
  {
    id v12 = v5;
    double v13 = *(void **)(a1 + 32);
    if (v12) {
      [v13 _presentAlertControllerForError:v12];
    }
    else {
      [v13 _presentAddBankAccount];
    }
    [*(id *)(a1 + 32) _setEnabled:1];
  }
}

- (id)_interestForSelectedDate:(id)a3
{
  id v4 = a3;
  interestCalculator = self->_interestCalculator;
  if (!interestCalculator)
  {
    id v6 = [MEMORY[0x1E4F845C8] configurationWithCreditAccount:self->_account];
    [v6 setCalculationMethod:1];
    id v7 = (PKCompoundInterestCalculator *)[objc_alloc(MEMORY[0x1E4F845C0]) initWithConfiguration:v6];
    id v8 = self->_interestCalculator;
    self->_interestCalculator = v7;

    id v9 = [(PKTransactionSource *)self->_transactionSource transactionSourceIdentifiers];
    accountUserCollection = self->_accountUserCollection;
    if (accountUserCollection)
    {
      id v11 = [(PKAccountUserCollection *)accountUserCollection transactionSourceIdentifiers];
      if (v11)
      {
        uint64_t v12 = [v9 setByAddingObjectsFromSet:v11];

        id v9 = (void *)v12;
      }
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    id v14 = [v6 periodStartDate];
    double v15 = [v6 periodEndDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke;
    v19[3] = &unk_1E59CE000;
    v19[4] = self;
    [v13 approvedTransactionsForTransactionSourceIdentifiers:v9 withTransactionSource:0 withBackingData:1 startDate:v14 endDate:v15 limit:0 completion:v19];

    interestCalculator = self->_interestCalculator;
  }
  int v16 = [(PKCompoundInterestCalculator *)interestCalculator configuration];
  [v16 updateWithCreditAccount:self->_account];

  double v17 = [(PKCompoundInterestCalculator *)self->_interestCalculator compoundInterestForPaymentOfAmount:self->_selectedAmount onDate:v4];

  return v17;
}

void __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1160) configuration];
  id v3 = [*(id *)(a1 + 40) allObjects];
  [v2 setPeriodTransactions:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateLabelText];
}

- (double)_payButtonTopPadding
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 35.0;
  if (!v2) {
    return 20.0;
  }
  return result;
}

- (double)_sideMargin
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 44.0;
  if (v2 < 5) {
    double result = 24.0;
  }
  if (!v2) {
    return 16.0;
  }
  return result;
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  [v5 setUserInteractionEnabled:v3];

  [(UIPickerView *)self->_datePicker setUserInteractionEnabled:v3];
  [(PKLegacyButtonInterface *)self->_payOnButton setEnabled:v3];
  [(PKLegacyButtonInterface *)self->_payOnButton setShowSpinner:v3 ^ 1];
  [(PKAccountBillPaymentPayLaterViewController *)self _setNavigationBarEnabled:v3];
  id v6 = [(PKAccountBillPaymentPayLaterViewController *)self navigationItem];
  id v7 = [v6 backBarButtonItem];
  [v7 setEnabled:v3];

  id v8 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  [v8 setNeedsLayout];
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(PKAccountBillPaymentPayLaterViewController *)self navigationController];
  id v5 = [v9 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  id v6 = [v9 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  id v7 = [(PKAccountBillPaymentPayLaterViewController *)self navigationItem];
  [v7 setHidesBackButton:v3 ^ 1 animated:1];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];
}

- (id)_dateForRow:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:a3];
  id v6 = [(NSCalendar *)self->_productCalendar dateByAddingComponents:v5 toDate:self->_minDate options:0];

  return v6;
}

- (id)_dateStringForRow:(int64_t)a3 formatter:(id)a4
{
  id v6 = a4;
  id v7 = [(PKAccountBillPaymentPayLaterViewController *)self _dateForRow:a3];
  id v8 = [v6 stringFromDate:v7];

  return v8;
}

- (id)_stripTimeFromDate:(id)a3
{
  id v4 = [(NSCalendar *)self->_productCalendar components:28 fromDate:a3];
  id v5 = [(NSCalendar *)self->_productCalendar dateFromComponents:v4];

  return v5;
}

- (void)_updateLabelText
{
  [(PKAccount *)self->_account feature];
  NSInteger v3 = [(UIPickerView *)self->_datePicker selectedRowInComponent:0];
  id v11 = [(PKAccountBillPaymentPayLaterViewController *)self _dateForRow:v3];
  id v4 = -[PKAccountBillPaymentPayLaterViewController _interestForSelectedDate:](self, "_interestForSelectedDate:");
  id v5 = [(PKAccountBillPaymentPayLaterViewController *)self _dateStringForRow:v3 formatter:self->_dateFormatter];
  id v6 = [(PKAccount *)self->_account creditDetails];
  id v7 = [v6 currencyCode];
  id v8 = PKFormattedCurrencyStringFromNumber();

  id v9 = PKLocalizedFeatureString();
  -[PKLegacyButtonInterface setTitle:forState:](self->_payOnButton, "setTitle:forState:", v9, 0, v8, v5);
  [(PKLegacyButtonInterface *)self->_payOnButton sizeToFit];
  if ([(PKAccount *)self->_account showBillPaymentInterest]) {
    [(PKAccountBillPaymentPayInterestDescriptionView *)self->_interestDescriptionView setInterest:v4];
  }
  [(PKAccountBillPaymentPayInterestDescriptionView *)self->_interestDescriptionView setSelectedPaymentDate:v11];
  id v10 = [(PKAccountBillPaymentPayLaterViewController *)self view];
  [v10 setNeedsLayout];
}

- (void)_presentAddBankAccount
{
  id v4 = [(PKAccountBillPaymentPayLaterViewController *)self _addBankAccountInformationViewController];
  [v4 setOfferKeychainPreFill:1];
  NSInteger v3 = [[PKNavigationController alloc] initWithRootViewController:v4];
  [(PKNavigationController *)v3 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v3 setModalPresentationStyle:2];
  }
  [(PKAccountBillPaymentPayLaterViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (id)_addBankAccountInformationViewController
{
  addBankAccountViewController = self->_addBankAccountViewController;
  if (!addBankAccountViewController)
  {
    id v4 = [PKAddBankAccountInformationViewController alloc];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84550]) initWithType:1];
    id v6 = [(PKAccount *)self->_account creditDetails];
    id v7 = [v6 countryCode];
    id v8 = [(PKAddBankAccountInformationViewController *)v4 initWithDelegate:self bankInformation:v5 accountCountryCode:v7 featureAccount:self->_account];
    id v9 = self->_addBankAccountViewController;
    self->_addBankAccountViewController = v8;

    addBankAccountViewController = self->_addBankAccountViewController;
  }

  return addBankAccountViewController;
}

- (void)_dismissViewControllerWithSuccess:(BOOL)a3
{
  id v3 = [(PKAccountBillPaymentPayLaterViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentAlertControllerForError:(id)a3
{
  account = self->_account;
  id v5 = a3;
  id v7 = +[PKAccountFlowController displayableErrorForError:v5 featureIdentifier:[(PKAccount *)account feature] genericErrorTitle:0 genericErrorMessage:0];

  id v6 = +[PKAccountBillPaymentViewController alertControllerForDisplayableError:v7];
  if (v6) {
    [(PKAccountBillPaymentPayLaterViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  [(PKAccountBillPaymentPayLaterViewController *)self _setEnabled:1];
}

- (PKAccountBillPaymentObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (PKAccountBillPaymentObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_addBankAccountViewController, 0);
  objc_storeStrong((id *)&self->_interestDescriptionView, 0);
  objc_storeStrong((id *)&self->_interestCalculator, 0);
  objc_storeStrong((id *)&self->_whenToPayQuestionLabel, 0);
  objc_storeStrong((id *)&self->_payLaterTitleLabel, 0);
  objc_storeStrong((id *)&self->_payOnButton, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalance, 0);
  objc_storeStrong((id *)&self->_selectedAmount, 0);
  objc_storeStrong((id *)&self->_localCalendar, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_localDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatterDayOfWeek, 0);
  objc_storeStrong((id *)&self->_maxDate, 0);
  objc_storeStrong((id *)&self->_minDate, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_billPaymentCoordinator, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_CLInUse, 0);
}

@end