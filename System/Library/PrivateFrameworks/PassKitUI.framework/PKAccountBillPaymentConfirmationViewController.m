@interface PKAccountBillPaymentConfirmationViewController
- (BOOL)_shouldDisplayInterestSummary;
- (BOOL)_shouldShowSetupAutoPayView;
- (PKAccountBillPaymentConfirmationViewController)initWithAccount:(id)a3 paymentPass:(id)a4 scheduledPayments:(id)a5;
- (PKAccountBillPaymentConfirmationViewController)initWithAccount:(id)a3 previousAccountSummary:(id)a4 paymentPass:(id)a5 payments:(id)a6 suggestionList:(id)a7 interestForPaymentTotal:(id)a8 interestForStatementBalance:(id)a9;
- (id)_availableCreditText;
- (id)_trailingInterestMonthMidpoint;
- (id)billPaymentRingView:(id)a3 bottomCurvedTextForSuggestedAmount:(id)a4;
- (id)billPaymentRingView:(id)a3 interestTextForAmount:(id)a4;
- (id)billPaymentRingView:(id)a3 topCurvedTextForSuggestedAmount:(id)a4;
- (id)billPaymentRingViewZeroInterestText:(id)a3;
- (id)disabledBottomCurvedTextForBillPaymentRingView:(id)a3;
- (id)disabledTopCurvedTextForBillPaymentRingView:(id)a3;
- (void)_updateBodyContentViewMessage;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)loadView;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKAccountBillPaymentConfirmationViewController

- (PKAccountBillPaymentConfirmationViewController)initWithAccount:(id)a3 previousAccountSummary:(id)a4 paymentPass:(id)a5 payments:(id)a6 suggestionList:(id)a7 interestForPaymentTotal:(id)a8 interestForStatementBalance:(id)a9
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v51 = a5;
  id v50 = a6;
  id v49 = a7;
  id v48 = a8;
  id v47 = a9;
  v18 = [(PKExplanationViewController *)self init];
  v19 = v18;
  if (v18)
  {
    id v45 = v17;
    id v46 = v16;
    p_account = (id *)&v18->_account;
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_previousAccountSummary, a4);
    objc_storeStrong((id *)&v19->_paymentPass, a5);
    objc_storeStrong((id *)&v19->_payments, a6);
    objc_storeStrong((id *)&v19->_suggestionList, a7);
    objc_storeStrong((id *)&v19->_interestForPaymentTotal, a8);
    objc_storeStrong((id *)&v19->_interestForStatementBalance, a9);
    v21 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v19->_paymentService;
    v19->_paymentService = v21;

    uint64_t v23 = [MEMORY[0x1E4F28C28] zero];
    pendingPaymentsTotal = v19->_pendingPaymentsTotal;
    v19->_pendingPaymentsTotal = (NSDecimalNumber *)v23;

    v19->_isScheduledPayment = 0;
    v19->_hasRecurringPayments = 0;
    uint64_t v25 = [MEMORY[0x1E4F28C28] zero];
    paymentsTotal = v19->_paymentsTotal;
    v19->_paymentsTotal = (NSDecimalNumber *)v25;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v27 = v19->_payments;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [*(id *)(*((void *)&v52 + 1) + 8 * i) currencyAmount];
          v33 = [v32 amount];

          uint64_t v34 = [(NSDecimalNumber *)v19->_paymentsTotal decimalNumberByAdding:v33];
          v35 = v19->_paymentsTotal;
          v19->_paymentsTotal = (NSDecimalNumber *)v34;
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v29);
    }

    v36 = [*p_account creditDetails];
    v37 = [v36 productTimeZone];

    v38 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    productMonthDayFormatter = v19->_productMonthDayFormatter;
    v19->_productMonthDayFormatter = v38;

    [(NSDateFormatter *)v19->_productMonthDayFormatter setTimeZone:v37];
    [(NSDateFormatter *)v19->_productMonthDayFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
    v40 = [*p_account creditDetails];
    v41 = [v40 currencyCode];
    uint64_t v42 = PKMutableNumberFormatterForCurrencyCode();
    amountFormatter = v19->_amountFormatter;
    v19->_amountFormatter = (NSNumberFormatter *)v42;

    id v17 = v45;
    id v16 = v46;
  }

  return v19;
}

- (PKAccountBillPaymentConfirmationViewController)initWithAccount:(id)a3 paymentPass:(id)a4 scheduledPayments:(id)a5
{
  id v8 = a5;
  v9 = [(PKAccountBillPaymentConfirmationViewController *)self initWithAccount:a3 previousAccountSummary:0 paymentPass:a4 payments:v8 suggestionList:0 interestForPaymentTotal:0 interestForStatementBalance:0];
  v10 = v9;
  if (v9)
  {
    v9->_isScheduledPayment = 1;
    v11 = [v8 firstObject];
    uint64_t v12 = [v11 paymentDate];
    scheduledDate = v10->_scheduledDate;
    v10->_scheduledDate = (NSDate *)v12;
  }
  return v10;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  [(PKExplanationViewController *)&v6 loadView];
  v3 = [[PKBillPaymentRingView alloc] initWithSuggestedAmountList:self->_suggestionList delegate:self dataSource:self];
  v4 = [[PKAccountBillPaymentCheckmarkRingView alloc] initWithRingView:v3];
  checkmarkRingView = self->_checkmarkRingView;
  self->_checkmarkRingView = v4;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  [(PKExplanationViewController *)&v34 viewDidLoad];
  uint64_t v3 = [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:self->_paymentsTotal];
  [(PKAccount *)self->_account feature];
  v4 = [(PKExplanationViewController *)self explanationView];
  v33 = (void *)v3;
  if (self->_isScheduledPayment)
  {
    v5 = [(NSDateFormatter *)self->_productMonthDayFormatter stringFromDate:self->_scheduledDate];
    uint64_t v6 = PKLocalizedFeatureString();
    uint64_t v30 = v3;
    v7 = PKLocalizedFeatureString();
    objc_msgSend(v4, "showCheckmark:animated:", 0, 0, v30, v5);
  }
  else
  {
    uint64_t v31 = v3;
    uint64_t v6 = PKLocalizedFeatureString();
    v7 = PKLocalizedFeatureString();
    id v8 = [(PKAccountBillPaymentConfirmationViewController *)self _availableCreditText];
    if ([v8 length])
    {
      v9 = [v7 stringByAppendingString:@" "];
      uint64_t v10 = [v9 stringByAppendingString:v8];
      v11 = (void *)v10;
      if (v10) {
        uint64_t v12 = (void *)v10;
      }
      else {
        uint64_t v12 = v8;
      }
      id v13 = v12;
      v14 = v7;
      uint64_t v15 = v6;
      id v16 = v13;

      id v17 = v16;
      uint64_t v6 = v15;
      v7 = v17;
    }
    [v4 setTopLogoPadding:32.0];
    [v4 setBodyViewPadding:35.0];
    [v4 setTitleAccessoriesEnabled:0];
    [v4 setHeroView:self->_checkmarkRingView];
    [v4 setHeroViewSizeThatFitsOverride:&__block_literal_global_24];
  }
  v32 = (void *)v6;
  v18 = [(PKAccountBillPaymentCheckmarkRingView *)self->_checkmarkRingView ringView];
  [v18 setAmount:self->_paymentsTotal animated:0];
  [v18 setIsSmall:1];
  [v18 completeInitialDisplayAnimated:0];
  v19 = [(PKAccountBillPaymentCheckmarkRingView *)self->_checkmarkRingView checkmarkLayer];
  id v20 = [v18 currentStartColor];
  objc_msgSend(v19, "setColor:animated:", objc_msgSend(v20, "CGColor"), 0);

  [v4 setTitleText:v6];
  [v4 setBodyText:v7];
  [v4 setShowPrivacyView:0];
  v21 = [(PKAccountBillPaymentConfirmationViewController *)self navigationItem];
  [v21 setLeftBarButtonItem:0];
  [v21 setHidesBackButton:1];
  v22 = [v4 dockView];
  uint64_t v23 = [v22 primaryButton];
  v24 = [v23 titleLabel];
  uint64_t v25 = [MEMORY[0x1E4FB1618] labelColor];
  [v23 setTintColor:v25];

  v26 = [(PKAccountBillPaymentConfirmationViewController *)self view];
  v27 = [v26 backgroundColor];
  [v23 updateTitleColorWithColor:v27];

  objc_msgSend(v23, "setContentEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
  uint64_t v28 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 2, 0);
  [v24 setFont:v28];
  uint64_t v29 = PKLocalizedFeatureString();
  [v23 setTitle:v29 forState:0];

  [v24 setAdjustsFontSizeToFitWidth:1];
}

uint64_t __61__PKAccountBillPaymentConfirmationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:");

  return PKSizeScaleAspectFit();
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  [(PKAccountBillPaymentConfirmationViewController *)&v5 viewDidAppear:a3];
  if (self->_isScheduledPayment)
  {
    v4 = [(PKExplanationViewController *)self explanationView];
    [v4 setShowCheckmark:1];
  }
  else
  {
    v4 = [(PKAccountBillPaymentCheckmarkRingView *)self->_checkmarkRingView checkmarkLayer];
    [v4 setRevealed:1 animated:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  [(PKAccountBillPaymentConfirmationViewController *)&v6 viewWillDisappear:a3];
  if (!self->_hasPerformedCategoryAnimation && !self->_isScheduledPayment)
  {
    paymentService = self->_paymentService;
    objc_super v5 = [(PKPaymentPass *)self->_paymentPass uniqueID];
    [(PKPaymentService *)paymentService recomputeCategoryVisualizationMangitudesForPassUniqueID:v5 style:2];

    self->_hasPerformedCategoryAnimation = 1;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [MEMORY[0x1E4F84270] sharedInstance];
  objc_super v6 = [(PKAccount *)self->_account accountIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E59CB060;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 scheduledPaymentsWithAccountIdentifier:v6 includeFailedRecurringPayments:1 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[133];
    objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v32 + 1) + 8 * i) referenceIdentifier];
          if ([v11 length]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v8);
    }
    v27 = v5;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v26 = a1;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          v18 = [v17 scheduleDetails];
          if (*((unsigned char *)v3 + 1169)) {
            char v19 = 1;
          }
          else {
            char v19 = [v17 isRecurring];
          }
          *((unsigned char *)v3 + 1169) = v19;
          if ([v17 state] == 1 && objc_msgSend(v18, "frequency") == 1)
          {
            id v20 = [v17 referenceIdentifier];
            char v21 = [v27 containsObject:v20];

            if ((v21 & 1) == 0)
            {
              v22 = [v17 currencyAmount];
              uint64_t v23 = [v22 amount];

              uint64_t v24 = [v3[141] decimalNumberByAdding:v23];
              id v25 = v3[141];
              v3[141] = (id)v24;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v14);
    }

    [v3 _updateBodyContentViewMessage];
    (*(void (**)(void))(*(void *)(v26 + 40) + 16))();
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  if ([(PKAccountBillPaymentConfirmationViewController *)self _shouldShowSetupAutoPayView])
  {
    id v4 = [PKAccountAutomaticPaymentsController alloc];
    objc_super v5 = [MEMORY[0x1E4F84270] sharedInstance];
    id v6 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v7 = [(PKAccountAutomaticPaymentsController *)v4 initWithAccountService:v5 paymentWebService:v6 account:self->_account context:0];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PKAccountBillPaymentConfirmationViewController_explanationViewDidSelectContinue___block_invoke;
    v9[3] = &unk_1E59CCCE8;
    v9[4] = self;
    [(PKAccountAutomaticPaymentsController *)v7 nextViewControllerFromViewController:0 withCompletion:v9];
  }
  else
  {
    id v8 = [(PKAccountBillPaymentConfirmationViewController *)self presentingViewController];
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
}

void __83__PKAccountBillPaymentConfirmationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v6;
    [v3 setShowSetupPrompt:1];
    [v3 setShowCancelButton:0];
    id v4 = [v3 navigationItem];
    [v4 setHidesBackButton:1];

    objc_super v5 = [*(id *)(a1 + 32) navigationController];
    [v5 pushViewController:v3 animated:1];

    PKAppleCardSetAutopayPromptPresented();
  }
  else
  {
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)billPaymentRingView:(id)a3 topCurvedTextForSuggestedAmount:(id)a4
{
  return 0;
}

- (id)billPaymentRingView:(id)a3 bottomCurvedTextForSuggestedAmount:(id)a4
{
  return 0;
}

- (id)disabledTopCurvedTextForBillPaymentRingView:(id)a3
{
  return 0;
}

- (id)disabledBottomCurvedTextForBillPaymentRingView:(id)a3
{
  return 0;
}

- (id)billPaymentRingView:(id)a3 interestTextForAmount:(id)a4
{
  return 0;
}

- (id)billPaymentRingViewZeroInterestText:(id)a3
{
  return &stru_1EF1B5B50;
}

- (void)_updateBodyContentViewMessage
{
  uint64_t v38 = [(PKCreditAccountSummary *)self->_previousAccountSummary paymentDueDate];
  BOOL v3 = [(PKAccountBillPaymentConfirmationViewController *)self _shouldDisplayInterestSummary];
  id v4 = (void *)v38;
  if (!v3) {
    goto LABEL_30;
  }
  previousAccountSummary = self->_previousAccountSummary;
  if (!previousAccountSummary || v38 == 0) {
    goto LABEL_30;
  }
  uint64_t v7 = [(PKCreditAccountSummary *)previousAccountSummary remainingMinimumPayment];
  id v8 = [v7 decimalNumberBySubtracting:self->_pendingPaymentsTotal];

  uint64_t v9 = [v8 decimalNumberBySubtracting:self->_paymentsTotal];

  id v10 = [(PKCreditAccountSummary *)self->_previousAccountSummary remainingStatementBalance];
  v11 = [v10 decimalNumberBySubtracting:self->_pendingPaymentsTotal];

  id v12 = [v11 decimalNumberBySubtracting:self->_paymentsTotal];

  [(PKAccount *)self->_account feature];
  int v36 = [(NSDecimalNumber *)self->_interestForPaymentTotal pk_isPositiveNumber];
  int v13 = [(NSDecimalNumber *)self->_interestForStatementBalance pk_isPositiveNumber];
  LODWORD(v11) = objc_msgSend(v9, "pk_isPositiveNumber");
  v37 = v12;
  int v14 = objc_msgSend(v12, "pk_isPositiveNumber");
  int IsSingular = PKHourOfDateIsSingular();
  id v16 = PKMediumDayAndLongMonthStringFromDate();
  id v17 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v38 dateStyle:0 timeStyle:1];
  if (v11)
  {
    v18 = [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:v9];
    long long v34 = v17;
    long long v35 = v16;
    long long v33 = v18;
    char v19 = PKLocalizedFeatureString();
    id v20 = @"exclamationmark.triangle";
LABEL_8:
    char v21 = v9;
    v22 = v37;
LABEL_23:

    goto LABEL_24;
  }
  if (v14)
  {
    if (v13)
    {
      uint64_t v23 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_WITH_TRAILING_INTEREST";
      uint64_t v24 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_WITH_TRAILING_INTEREST_HOUR_ONE";
    }
    else
    {
      if (!v36)
      {
        v18 = 0;
LABEL_22:
        v22 = v37;
        [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:v37];
        long long v34 = v17;
        long long v33 = v35 = v16;
        char v19 = PKLocalizedFeatureString();

        id v20 = @"exclamationmark.triangle";
        char v21 = v9;
        goto LABEL_23;
      }
      uint64_t v23 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_NO_TRAILING_INTEREST";
      uint64_t v24 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_NO_TRAILING_INTEREST_HOUR_ONE";
    }
    if (IsSingular) {
      uint64_t v23 = v24;
    }
    v18 = v23;
    goto LABEL_22;
  }
  if ((v36 & v13) == 1)
  {
    v18 = [(PKAccountBillPaymentConfirmationViewController *)self _trailingInterestMonthMidpoint];
    if (v18)
    {
      id v25 = [(PKAccount *)self->_account productTimeZone];
      uint64_t v26 = PKEndOfNextMonthAndTimeZone();

      v27 = PKMonthStringFromDate();
      PKMediumDayAndLongMonthStringFromDate();
      long long v34 = v33 = v27;
      char v19 = PKLocalizedFeatureString();

      id v20 = @"info.circle";
    }
    else
    {
      char v19 = 0;
      id v20 = 0;
    }
    goto LABEL_8;
  }
  char v19 = 0;
  id v20 = 0;
  char v21 = v9;
  v22 = v37;
LABEL_24:
  long long v28 = [(PKExplanationViewController *)self explanationView];
  if ([v19 length])
  {
    messageContentView = self->_messageContentView;
    if (!messageContentView)
    {
      long long v30 = objc_alloc_init(PKAccountBillPaymentMessageContentView);
      long long v31 = self->_messageContentView;
      self->_messageContentView = v30;

      [v28 setBodyView:self->_messageContentView];
      messageContentView = self->_messageContentView;
    }
    [(PKAccountBillPaymentMessageContentView *)messageContentView setMessage:v19];
    [(PKAccountBillPaymentMessageContentView *)self->_messageContentView setSystemImage:v20];
    [v28 setNeedsLayout];
  }
  else
  {
    [v28 setBodyView:0];
    long long v32 = self->_messageContentView;
    self->_messageContentView = 0;
  }
  id v4 = (void *)v38;
LABEL_30:
}

- (BOOL)_shouldDisplayInterestSummary
{
  int v3 = [(PKAccount *)self->_account showBillPaymentInterestSummary];
  if (v3) {
    LOBYTE(v3) = !self->_isScheduledPayment;
  }
  return v3;
}

- (id)_availableCreditText
{
  int v3 = [(NSArray *)self->_payments pk_firstObjectPassingTest:&__block_literal_global_93];
  id v4 = [v3 expectedCreditReleaseDate];
  objc_super v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [v5 accountSummary];
  uint64_t v7 = [v6 availableCredit];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28C28] zero];
    BOOL v9 = [v8 compare:v7] == -1 || -[PKAccount state](self->_account, "state") == 1;
  }
  else
  {
    BOOL v9 = [(PKAccount *)self->_account state] == 1;
  }
  if ([(PKAccount *)self->_account hideBillPaymentHoldTime]) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v9;
  }
  if (v10 || v4 == 0)
  {
    id v12 = 0;
    goto LABEL_25;
  }
  int v13 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v14 = PKDateRangeNumberOfIntervalsForUnit();
  if ((unint64_t)(v14 - 1) > 4)
  {
    if ((unint64_t)(v14 - 6) > 3)
    {
      if ((unint64_t)(v14 - 10) > 7)
      {
        id v12 = 0;
        goto LABEL_24;
      }
      id v16 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_CREDIT_RELEASE_HOLD_2";
    }
    else
    {
      id v16 = @"ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_CREDIT_RELEASE_HOLD_1";
    }
    id v12 = PKDynamicLocalizedAppleCardString(&v16->isa);
  }
  else
  {
    uint64_t v15 = PKMediumDayAndLongMonthStringFromDate();
    id v12 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_57.isa, &cfstr_1_1.isa, v15);
  }
LABEL_24:

LABEL_25:

  return v12;
}

BOOL __70__PKAccountBillPaymentConfirmationViewController__availableCreditText__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 expectedCreditReleaseDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_trailingInterestMonthMidpoint
{
  BOOL v3 = [(PKCreditAccountSummary *)self->_previousAccountSummary balanceSummary];
  id v4 = [v3 openingDate];
  uint64_t v5 = [v3 closingDate];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v8 = PKDatesMidpoint();
    id v9 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    BOOL v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v11 = [(PKAccount *)self->_account creditDetails];
    id v12 = [v11 productTimeZone];
    [v10 setTimeZone:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v13 setMonth:-2];
    uint64_t v14 = [v10 dateByAddingComponents:v13 toDate:v8 options:0];
  }

  return v14;
}

- (BOOL)_shouldShowSetupAutoPayView
{
  int v3 = PKBroadwayAutopayPrompt2024Enabled();
  if (v3)
  {
    if (self->_hasRecurringPayments || [(PKAccount *)self->_account feature] != 2)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      int v3 = [(PKAccount *)self->_account supportsScheduleRecurringPayments];
      if (v3)
      {
        int v3 = +[PKCreditAccountController shouldDisplayScheduledPaymentsWithAccount:self->_account andPass:self->_paymentPass];
        if (v3)
        {
          id v4 = [(PKAccount *)self->_account creditDetails];
          uint64_t v5 = [v4 accountSummary];
          uint64_t v6 = [v5 balanceStatus];

          if (v6 == 2) {
            LOBYTE(v3) = 1;
          }
          else {
            LOBYTE(v3) = PKAppleCardAutopayPromptPresented() ^ 1;
          }
        }
      }
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkRingView, 0);
  objc_storeStrong((id *)&self->_messageContentView, 0);
  objc_storeStrong((id *)&self->_productMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_pendingPaymentsTotal, 0);
  objc_storeStrong((id *)&self->_paymentsTotal, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_interestForStatementBalance, 0);
  objc_storeStrong((id *)&self->_interestForPaymentTotal, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_previousAccountSummary, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end