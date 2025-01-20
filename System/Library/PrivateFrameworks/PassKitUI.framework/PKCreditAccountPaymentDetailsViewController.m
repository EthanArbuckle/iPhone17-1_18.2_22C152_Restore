@interface PKCreditAccountPaymentDetailsViewController
- (BOOL)_showRecurringDay;
- (BOOL)_showRecurringDetailsAmount;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKCreditAccountPaymentDetailsViewController)initWithAccount:(id)a3 payment:(id)a4 paymentWebService:(id)a5 detailViewStyle:(int64_t)a6;
- (PKCreditAccountPaymentDetailsViewController)initWithAccount:(id)a3 payment:(id)a4 paymentWebService:(id)a5 overrideViewStyle:(unint64_t)a6;
- (PKCreditAccountPaymentDetailsViewControllerDelegate)delegate;
- (id)_cancelPaymentCellForTableView:(id)a3;
- (id)_cancellationDateForPayment;
- (id)_hyperlinkFooterView;
- (id)_modifyPaymentCellForTableView:(id)a3;
- (id)_paymentAmountToDisplay;
- (id)_reuseIdentifierForSection:(unint64_t)a3;
- (id)_stringForPaymentFrequency;
- (id)_stringForPaymentPreset;
- (id)_tableView:(id)a3 paymentDetailsCellForPaymentDetailsRowAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 recurringPaymentDetailsCellForPaymentDetailsRowAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 recurringPaymentStatusCellForRowAtIndexPath:(id)a4;
- (id)_tableView:(id)a3 recurringPaymentUpcomingPaymentCellForPaymentDetailsRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_numberOfRecurringPaymentDetailsRows;
- (int64_t)_recurringPaymentDetailsRowTypeForRowAtIndex:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_applyDetailViewStylingToCell:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_cancelPayment:(unint64_t)a3;
- (void)_cancelPaymentSelected:(unint64_t)a3;
- (void)_computeRecurringDetailsRowMap;
- (void)_configureDeletePaymentCell:(id)a3;
- (void)_configureDismissCell:(id)a3;
- (void)_configureLinkCell:(id)a3;
- (void)_modifyPaymentSelected;
- (void)_reportEventForPassIfNecessary:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKCreditAccountPaymentDetailsViewController

- (PKCreditAccountPaymentDetailsViewController)initWithAccount:(id)a3 payment:(id)a4 paymentWebService:(id)a5 overrideViewStyle:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v66.receiver = self;
  v66.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  v14 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v66, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 5);
  v15 = v14;
  if (v14)
  {
    unint64_t v63 = a6;
    id v64 = v13;
    v65 = v12;
    p_account = (id *)&v14->_account;
    objc_storeStrong((id *)&v14->_account, a3);
    v15->_featureIdentifier = [v11 feature];
    p_payment = (id *)&v15->_payment;
    objc_storeStrong((id *)&v15->_payment, a4);
    v18 = [v11 creditDetails];
    v19 = [v18 accountSummary];
    uint64_t v20 = [v19 paymentDueDate];
    paymentDueDate = v15->_paymentDueDate;
    v15->_paymentDueDate = (NSDate *)v20;

    v22 = [(PKAccountPayment *)v15->_payment scheduleDetails];
    uint64_t v23 = [v22 preset];

    int v24 = [(PKAccountPayment *)v15->_payment isRecurring];
    char v25 = [(PKAccountPayment *)v15->_payment isOnHoldForAccount:*p_account];
    char v26 = [(PKAccountPayment *)v15->_payment isBeforeNextCycleForAccount:*p_account];
    if (v24) {
      BOOL v27 = [*p_payment state] == 4;
    }
    else {
      BOOL v27 = 0;
    }
    unint64_t v28 = v23 & 0xFFFFFFFFFFFFFFFELL;
    v15->_BOOL isFailedRecurringPayment = v27;
    if ([*p_payment willSkipFirstPaymentForAccount:*p_account])
    {
      BOOL v29 = 0;
      v15->_showStatusSection = 1;
    }
    else
    {
      BOOL isFailedRecurringPayment = v15->_isFailedRecurringPayment;
      BOOL v31 = !isFailedRecurringPayment;
      v15->_showStatusSection = isFailedRecurringPayment;
      char v32 = v24 ^ 1;
      if (!v31) {
        char v32 = 1;
      }
      BOOL v29 = (v32 & 1) == 0 && !v15->_isFailedRecurringPayment;
    }
    v15->_showUpcomingPaymentSection = v29;
    if (v28 == 2) {
      char v33 = v25 & (v26 ^ 1);
    }
    else {
      char v33 = 0;
    }
    v15->_isPaymentAmountPending = v33;
    objc_storeStrong((id *)&v15->_paymentWebService, a5);
    v15->_viewStyle = v63;
    v34 = [*p_account creditDetails];
    v35 = [v34 currencyCode];
    uint64_t v36 = PKMutableNumberFormatterForCurrencyCode();
    currencyFormatter = v15->_currencyFormatter;
    v15->_currencyFormatter = (NSNumberFormatter *)v36;

    v38 = [v11 creditDetails];
    v39 = [v38 productTimeZone];

    v40 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    productDateFormatter = v15->_productDateFormatter;
    v15->_productDateFormatter = v40;

    [(NSDateFormatter *)v15->_productDateFormatter setTimeZone:v39];
    [(NSDateFormatter *)v15->_productDateFormatter setLocalizedDateFormatFromTemplate:@"M/d/yyyy"];
    id v12 = v65;
    if (![v65 isRecurring]) {
      goto LABEL_21;
    }
    v42 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    productDayFormatter = v15->_productDayFormatter;
    v15->_productDayFormatter = v42;

    [(NSDateFormatter *)v15->_productDayFormatter setTimeZone:v39];
    v44 = [v65 scheduleDetails];
    uint64_t v45 = [v44 frequency];

    if ((v45 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v46 = @"EEEE";
    }
    else
    {
      if (v45 != 6)
      {
LABEL_21:
        v47 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        localTimeFormatter = v15->_localTimeFormatter;
        v15->_localTimeFormatter = v47;

        v49 = v15->_localTimeFormatter;
        v50 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
        [(NSDateFormatter *)v49 setLocale:v50];

        [(NSDateFormatter *)v15->_localTimeFormatter setLocalizedDateFormatFromTemplate:@"j:mm a z"];
        v51 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        localCancellationDateFormatter = v15->_localCancellationDateFormatter;
        v15->_localCancellationDateFormatter = v51;

        v53 = v15->_localCancellationDateFormatter;
        v54 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
        [(NSDateFormatter *)v53 setLocale:v54];

        [(NSDateFormatter *)v15->_localCancellationDateFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
        v55 = [(PKCreditAccountPaymentDetailsViewController *)v15 navigationItem];
        objc_msgSend(v55, "pkui_setupScrollEdgeChromelessAppearance");
        objc_msgSend(v55, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
        v56 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        productPaymentMonthFormatter = v15->_productPaymentMonthFormatter;
        v15->_productPaymentMonthFormatter = v56;

        [(NSDateFormatter *)v15->_productPaymentMonthFormatter setTimeZone:v39];
        [(NSDateFormatter *)v15->_productPaymentMonthFormatter setLocalizedDateFormatFromTemplate:@"MMMM"];
        v58 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        productPaymentDateFormatter = v15->_productPaymentDateFormatter;
        v15->_productPaymentDateFormatter = v58;

        [(NSDateFormatter *)v15->_productPaymentDateFormatter setTimeZone:v39];
        [(NSDateFormatter *)v15->_productPaymentDateFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
        v60 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
        localizedDayNumberFormatter = v15->_localizedDayNumberFormatter;
        v15->_localizedDayNumberFormatter = v60;

        [(PKCreditAccountPaymentDetailsViewController *)v15 _computeRecurringDetailsRowMap];
        id v13 = v64;
        goto LABEL_22;
      }
      v46 = @"d";
    }
    [(NSDateFormatter *)v15->_productDayFormatter setLocalizedDateFormatFromTemplate:v46];
    goto LABEL_21;
  }
LABEL_22:

  return v15;
}

- (PKCreditAccountPaymentDetailsViewController)initWithAccount:(id)a3 payment:(id)a4 paymentWebService:(id)a5 detailViewStyle:(int64_t)a6
{
  return [(PKCreditAccountPaymentDetailsViewController *)self initWithAccount:a3 payment:a4 paymentWebService:a5 overrideViewStyle:a6 == 2];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  [(PKSectionTableViewController *)&v28 viewDidLoad];
  v3 = [(PKCreditAccountPaymentDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"LinkCellReuseIdentifier"];
  uint64_t v4 = objc_opt_class();
  v5 = [(PKCreditAccountPaymentDetailsViewController *)self _reuseIdentifierForSection:0];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  v7 = [(PKCreditAccountPaymentDetailsViewController *)self _reuseIdentifierForSection:3];
  [v3 registerClass:v6 forCellReuseIdentifier:v7];

  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setEstimatedRowHeight:50.0];
  v8 = [(PKCreditAccountPaymentDetailsViewController *)self navigationController];
  v9 = [v8 viewControllers];
  v10 = [v9 firstObject];
  int v11 = PKEqualObjects();

  if (v11)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
    id v13 = [(PKCreditAccountPaymentDetailsViewController *)self navigationItem];
    [v13 setLeftBarButtonItem:v12];
  }
  unint64_t viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    uint64_t v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v3 setBackgroundColor:v23];

    v15 = [v3 backgroundView];
    int v24 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v15 setBackgroundColor:v24];

LABEL_10:
    goto LABEL_11;
  }
  if (viewStyle == 1)
  {
    v15 = PKBridgeAppearanceGetAppearanceSpecifier();
    v16 = [v15 backgroundColor];
    [v3 setBackgroundColor:v16];

    v17 = [v3 backgroundView];
    v18 = [v15 backgroundColor];
    [v17 setBackgroundColor:v18];

    v19 = [v15 tableViewSeparatorColor];
    [v3 setSeparatorColor:v19];

    uint64_t v20 = [v15 tintColor];
    [v3 setSectionIndexColor:v20];

    v21 = [v15 foregroundColor];
    [v3 setSectionIndexBackgroundColor:v21];

    if ([v15 hasDarkAppearance]) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    [v3 setIndicatorStyle:v22];
    goto LABEL_10;
  }
LABEL_11:
  [(PKAccountPayment *)self->_payment isRecurring];
  char v25 = [(PKCreditAccountPaymentDetailsViewController *)self navigationItem];
  char v26 = PKLocalizedFeatureString();
  [v25 setTitle:v26];

  BOOL v27 = [(PKCreditAccountPaymentDetailsViewController *)self view];
  [v27 setAccessibilityIdentifier:*MEMORY[0x1E4F857B0]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  [(PKCreditAccountPaymentDetailsViewController *)&v5 viewDidAppear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A0];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKCreditAccountPaymentDetailsViewController *)self _reportEventForPassIfNecessary:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  [(PKCreditAccountPaymentDetailsViewController *)&v5 viewDidDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKCreditAccountPaymentDetailsViewController *)self _reportEventForPassIfNecessary:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  [(PKCreditAccountPaymentDetailsViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKCreditAccountPaymentDetailsViewController *)self tableView];
  uint64_t v4 = [(PKCreditAccountPaymentDetailsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)_computeRecurringDetailsRowMap
{
  if ([(PKAccountPayment *)self->_payment isRecurring])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = [NSNumber numberWithInteger:0];
    [v12 setObject:&unk_1EF2B9558 forKeyedSubscript:v3];

    if ([(PKCreditAccountPaymentDetailsViewController *)self _showRecurringDetailsAmount])
    {
      uint64_t v4 = [NSNumber numberWithInteger:1];
      [v12 setObject:&unk_1EF2B9570 forKeyedSubscript:v4];

      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 1;
    }
    uint64_t v6 = v5 + 1;
    v7 = [NSNumber numberWithInteger:v5];
    [v12 setObject:&unk_1EF2B9588 forKeyedSubscript:v7];

    if ([(PKCreditAccountPaymentDetailsViewController *)self _showRecurringDay])
    {
      v8 = [NSNumber numberWithInteger:v5 + 1];
      [v12 setObject:&unk_1EF2B95A0 forKeyedSubscript:v8];

      uint64_t v6 = v5 + 2;
    }
    v9 = [NSNumber numberWithInteger:v6];
    [v12 setObject:&unk_1EF2B95B8 forKeyedSubscript:v9];

    v10 = (NSDictionary *)[v12 copy];
    recurringDetailsRowMap = self->_recurringDetailsRowMap;
    self->_recurringDetailsRowMap = v10;
  }
}

- (int64_t)_recurringPaymentDetailsRowTypeForRowAtIndex:(int64_t)a3
{
  recurringDetailsRowMap = self->_recurringDetailsRowMap;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSDictionary *)recurringDetailsRowMap objectForKeyedSubscript:v4];

  if (v5) {
    int64_t v6 = [v5 integerValue];
  }
  else {
    int64_t v6 = 6;
  }

  return v6;
}

- (int64_t)_numberOfRecurringPaymentDetailsRows
{
  if (![(PKAccountPayment *)self->_payment isRecurring]) {
    return 0;
  }
  if ([(PKCreditAccountPaymentDetailsViewController *)self _showRecurringDetailsAmount]) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 4;
  }
  return v3
       - ([(PKCreditAccountPaymentDetailsViewController *)self _showRecurringDay] ^ 1);
}

- (BOOL)_showRecurringDetailsAmount
{
  v2 = [(PKAccountPayment *)self->_payment scheduleDetails];
  BOOL v3 = [v2 preset] == 1;

  return v3;
}

- (BOOL)_showRecurringDay
{
  v2 = [(PKAccountPayment *)self->_payment scheduleDetails];
  uint64_t v3 = [v2 frequency];

  return (unint64_t)(v3 - 4) < 3;
}

- (id)_stringForPaymentPreset
{
  v2 = [(PKAccountPayment *)self->_payment scheduleDetails];
  uint64_t v3 = [v2 preset];

  if ((unint64_t)(v3 - 1) > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = PKLocalizedFeatureString();
  }

  return v4;
}

- (id)_stringForPaymentFrequency
{
  v2 = [(PKAccountPayment *)self->_payment scheduleDetails];
  uint64_t v3 = [v2 frequency];

  if ((unint64_t)(v3 - 4) > 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = PKLocalizedFeatureString();
  }

  return v4;
}

- (id)_paymentAmountToDisplay
{
  uint64_t v3 = [(PKAccountPayment *)self->_payment scheduleDetails];
  uint64_t v4 = [v3 preset];

  uint64_t v5 = [MEMORY[0x1E4F28C28] zero];
  int64_t v6 = [(PKAccount *)self->_account creditDetails];
  v7 = [v6 accountSummary];

  if (self->_isPaymentAmountPending) {
    goto LABEL_2;
  }
  switch(v4)
  {
    case 3:
      uint64_t v14 = [v7 remainingStatementBalance];
      break;
    case 2:
      uint64_t v14 = [v7 remainingMinimumPayment];
      break;
    case 1:
      v10 = [v7 adjustedBalance];
      int v11 = [(PKAccountPayment *)self->_payment currencyAmount];
      id v12 = [v11 amount];

      if ([v5 compare:v10] == -1)
      {
        id v13 = v12;
      }
      else
      {
        id v13 = [MEMORY[0x1E4F28C28] zero];
      }
      v15 = v13;

      if (!v15) {
        goto LABEL_2;
      }
      goto LABEL_17;
    default:
      goto LABEL_2;
  }
  v15 = (void *)v14;
  if (!v14)
  {
LABEL_2:
    v8 = PKLocalizedFeatureString();
    goto LABEL_3;
  }
LABEL_17:
  v8 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:v15];

LABEL_3:

  return v8;
}

- (void)_cancelButtonPressed:(id)a3
{
  uint64_t v4 = [(PKCreditAccountPaymentDetailsViewController *)self presentingViewController];
  id v6 = v4;
  if (v4)
  {
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    uint64_t v5 = [(PKCreditAccountPaymentDetailsViewController *)self navigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)_reuseIdentifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Section-%zd", a3);
}

- (id)_cancellationDateForPayment
{
  uint64_t v3 = [(PKAccount *)self->_account creditDetails];
  uint64_t v4 = [v3 productTimeZone];

  uint64_t v5 = [(PKAccountPayment *)self->_payment paymentDate];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    int v11 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    [v8 setTimeZone:v4];
    v9 = [v8 components:28 fromDate:v5];
    v10 = [v8 dateFromComponents:v9];
    int v11 = [v10 dateByAddingTimeInterval:-60.0];
  }

  return v11;
}

- (id)_hyperlinkFooterView
{
  hyperlinkFooterView = self->_hyperlinkFooterView;
  if (!hyperlinkFooterView)
  {
    uint64_t v4 = PKLocalizedFeatureString();
    uint64_t v5 = PKLocalizedFeatureString();
    BOOL v6 = PKStringWithValidatedFormat();
    objc_initWeak(&location, self->_account);
    objc_initWeak(&from, self);
    id v7 = objc_alloc_init(PKFooterHyperlinkView);
    v8 = self->_hyperlinkFooterView;
    self->_hyperlinkFooterView = v7;

    v9 = self->_hyperlinkFooterView;
    v10 = PKAttributedStringByAddingLinkToSubstring(v6, v5, 0);
    -[PKFooterHyperlinkView setAttributedText:](v9, "setAttributedText:", v10, v5);

    int v11 = self->_hyperlinkFooterView;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke;
    v16[3] = &unk_1E59D7D18;
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    [(PKFooterHyperlinkView *)v11 setAction:v16];
    if (self->_viewStyle == 1)
    {
      id v12 = self->_hyperlinkFooterView;
      id v13 = PKBridgeAppearanceGetAppearanceSpecifier();
      uint64_t v14 = [v13 footerHyperlinkColor];
      [(PKFooterHyperlinkView *)v12 setLinkTextColor:v14];
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    hyperlinkFooterView = self->_hyperlinkFooterView;
  }

  return hyperlinkFooterView;
}

void __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = v6;
  if (v6 && WeakRetained)
  {
    v8 = [v6 creditDetails];
    v9 = [v8 termsIdentifier];

    if (v9)
    {
      uint64_t v10 = 4 * (*(void *)(*(void *)(a1 + 32) + 1128) == 1);
      int v11 = [PKAccountTermsAndConditionsController alloc];
      id v12 = [MEMORY[0x1E4F84D50] sharedService];
      uint64_t v13 = [(PKAccountTermsAndConditionsController *)v11 initWithAccount:v7 webService:v12 context:v10 termsIdentifier:v9];
      uint64_t v14 = (void *)WeakRetained[143];
      WeakRetained[143] = v13;

      v15 = (void *)WeakRetained[143];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke_2;
      v16[3] = &unk_1E59CB9C8;
      objc_copyWeak(&v17, v4);
      [v15 termsViewControllerWithCompletion:v16];
      objc_destroyWeak(&v17);
    }
  }
}

void __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      v8 = [WeakRetained navigationController];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else if (v9)
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      return [(PKAccountPayment *)self->_payment isRecurring] ^ 1;
    case 1uLL:
      payment = self->_payment;
      return [(PKAccountPayment *)payment isRecurring];
    case 2uLL:
      uint64_t v6 = 1218;
      return *((unsigned char *)&self->super.super.super.super.super.isa + v6) != 0;
    case 3uLL:
      uint64_t v6 = 1217;
      return *((unsigned char *)&self->super.super.super.super.super.isa + v6) != 0;
    case 4uLL:
      if ([(PKAccountPayment *)self->_payment state] != 1) {
        goto LABEL_5;
      }
      BOOL result = !self->_isFailedRecurringPayment;
      break;
    default:
LABEL_5:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)_applyDetailViewStylingToCell:(id)a3
{
  id v4 = a3;
  unint64_t viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    id v14 = v4;
    id v12 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v14 setBackgroundColor:v12];
  }
  else
  {
    if (viewStyle != 1) {
      goto LABEL_6;
    }
    id v14 = v4;
    uint64_t v6 = [v4 textLabel];
    id v7 = PKBridgeAppearanceGetAppearanceSpecifier();
    v8 = [v7 textColor];
    [v6 setTextColor:v8];

    id v9 = [v14 detailTextLabel];
    uint64_t v10 = PKBridgeAppearanceGetAppearanceSpecifier();
    int v11 = [v10 altTextColor];
    [v9 setTextColor:v11];

    id v12 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v13 = [v12 foregroundColor];
    [v14 setBackgroundColor:v13];
  }
  id v4 = v14;
LABEL_6:
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKCreditAccountPaymentDetailsViewController *)self view];
  [v3 setNeedsLayout];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]);
  uint64_t v7 = [v5 row];
  switch(v6)
  {
    case 1uLL:
      BOOL v8 = [(PKCreditAccountPaymentDetailsViewController *)self _recurringPaymentDetailsRowTypeForRowAtIndex:v7] == 5;
      break;
    case 3uLL:
      if (self->_cancellingPayment) {
        goto LABEL_7;
      }
      BOOL v8 = [v5 row] == 1;
      break;
    case 4uLL:
      BOOL v8 = !self->_cancellingPayment;
      break;
    default:
LABEL_7:
      BOOL v9 = 0;
      goto LABEL_12;
  }
  BOOL v9 = v8;
LABEL_12:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 2)
  {
    id v4 = PKLocalizedFeatureString();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (!v5) {
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    if (self->_isPaymentAmountPending)
    {
      BOOL v8 = PKLocalizedFeatureString();
      goto LABEL_10;
    }
LABEL_5:
    unint64_t v6 = [(PKCreditAccountPaymentDetailsViewController *)self _cancellationDateForPayment];
    if (v6)
    {
      uint64_t v7 = [(NSDateFormatter *)self->_localTimeFormatter stringFromDate:v6];
      uint64_t v10 = [(NSDateFormatter *)self->_localCancellationDateFormatter stringFromDate:v6];
      BOOL v8 = PKLocalizedFeatureString();
    }
    else
    {
      BOOL v8 = 0;
    }

    goto LABEL_10;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 3)
  {
    if (!self->_isFailedRecurringPayment) {
      goto LABEL_3;
    }
  }
  else if (v5 != 4)
  {
LABEL_3:
    unint64_t v6 = 0;
    goto LABEL_6;
  }
  unint64_t v6 = [(PKCreditAccountPaymentDetailsViewController *)self _hyperlinkFooterView];
LABEL_6:

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  switch([(PKSectionTableViewController *)self sectionForIndex:a4])
  {
    case 0uLL:
      int64_t result = 3;
      break;
    case 1uLL:
      int64_t result = [(PKCreditAccountPaymentDetailsViewController *)self _numberOfRecurringPaymentDetailsRows];
      break;
    case 2uLL:
      int64_t result = 2;
      break;
    case 3uLL:
      if (self->_isFailedRecurringPayment) {
        int64_t result = 2;
      }
      else {
        int64_t result = 1;
      }
      break;
    case 4uLL:
      int64_t result = 1;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _tableView:v6 paymentDetailsCellForPaymentDetailsRowAtIndexPath:v7];
      goto LABEL_8;
    case 1uLL:
      uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _tableView:v6 recurringPaymentDetailsCellForPaymentDetailsRowAtIndexPath:v7];
      goto LABEL_8;
    case 2uLL:
      uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _tableView:v6 recurringPaymentUpcomingPaymentCellForPaymentDetailsRowAtIndexPath:v7];
      goto LABEL_8;
    case 3uLL:
      uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _tableView:v6 recurringPaymentStatusCellForRowAtIndexPath:v7];
      goto LABEL_8;
    case 4uLL:
      uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _cancelPaymentCellForTableView:v6];
LABEL_8:
      BOOL v9 = (void *)v8;
      break;
    default:
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (id)_tableView:(id)a3 paymentDetailsCellForPaymentDetailsRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _reuseIdentifierForSection:0];
  BOOL v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  uint64_t v10 = [(PKAccountPayment *)self->_payment paymentStatusDate];
  int v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(PKAccountPayment *)self->_payment paymentDate];
  }
  uint64_t v13 = v12;

  uint64_t v14 = [v6 row];
  switch(v14)
  {
    case 2:
      v15 = PKLocalizedFeatureString();
      id v18 = [(PKAccountPayment *)self->_payment fundingSource];
      v16 = [v18 displayDescription];

      id v17 = (id *)MEMORY[0x1E4F852B0];
      uint64_t v19 = 5;
LABEL_11:
      id v23 = *v17;
      goto LABEL_13;
    case 1:
      v15 = PKLocalizedFeatureString();
      currencyFormatter = self->_currencyFormatter;
      v21 = [(PKAccountPayment *)self->_payment currencyAmount];
      uint64_t v22 = [v21 amount];
      v16 = [(NSNumberFormatter *)currencyFormatter stringFromNumber:v22];

      id v17 = (id *)MEMORY[0x1E4F85228];
      goto LABEL_10;
    case 0:
      v15 = PKLocalizedFeatureString();
      v16 = [(NSDateFormatter *)self->_productDateFormatter stringFromDate:v13];
      id v17 = (id *)MEMORY[0x1E4F85440];
LABEL_10:
      uint64_t v19 = 4;
      goto LABEL_11;
  }
  v16 = 0;
  id v23 = 0;
  v15 = 0;
  uint64_t v19 = 4;
LABEL_13:
  int v24 = [v9 textLabel];
  [v24 setText:v15];

  char v25 = [v9 detailTextLabel];
  [v25 setText:v16];
  [v25 setLineBreakMode:v19];
  [(PKCreditAccountPaymentDetailsViewController *)self _applyDetailViewStylingToCell:v9];
  PKAccessibilityIDCellSet(v9, v23);

  return v9;
}

- (id)_tableView:(id)a3 recurringPaymentDetailsCellForPaymentDetailsRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _reuseIdentifierForSection:0];
  BOOL v9 = [v6 dequeueReusableCellWithIdentifier:v8];

  uint64_t v10 = [v7 row];
  switch([(PKCreditAccountPaymentDetailsViewController *)self _recurringPaymentDetailsRowTypeForRowAtIndex:v10])
  {
    case 0:
      int v11 = PKLocalizedFeatureString();
      id v12 = [(PKCreditAccountPaymentDetailsViewController *)self _stringForPaymentPreset];
      uint64_t v13 = (id *)MEMORY[0x1E4F85B10];
      goto LABEL_6;
    case 1:
      int v11 = PKLocalizedFeatureString();
      currencyFormatter = self->_currencyFormatter;
      v16 = [(PKAccountPayment *)self->_payment currencyAmount];
      id v17 = [v16 amount];
      id v12 = [(NSNumberFormatter *)currencyFormatter stringFromNumber:v17];

      uint64_t v13 = (id *)MEMORY[0x1E4F85228];
      goto LABEL_6;
    case 2:
      int v11 = PKLocalizedFeatureString();
      id v12 = [(PKCreditAccountPaymentDetailsViewController *)self _stringForPaymentFrequency];
      uint64_t v13 = (id *)MEMORY[0x1E4F855B8];
LABEL_6:
      id v14 = *v13;
      goto LABEL_7;
    case 3:
      id v23 = [(PKAccountPayment *)self->_payment scheduleDetails];
      uint64_t v24 = [v23 frequency];

      id v25 = (id)*MEMORY[0x1E4F85448];
      char v26 = v25;
      if ((v24 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        int v11 = PKLocalizedFeatureString();
        productDayFormatter = self->_productDayFormatter;
        objc_super v28 = [(PKAccountPayment *)self->_payment paymentDate];
        id v12 = [(NSDateFormatter *)productDayFormatter stringFromDate:v28];
        BOOL v29 = (id *)MEMORY[0x1E4F85B80];
      }
      else
      {
        if (v24 != 6)
        {
          id v12 = 0;
          id v14 = v25;
          goto LABEL_23;
        }
        int v11 = PKLocalizedFeatureString();
        BOOL v31 = [(PKAccountPayment *)self->_payment scheduleDetails];
        uint64_t v32 = [v31 scheduledDay];

        if (v32)
        {
          localizedDayNumberFormatter = self->_localizedDayNumberFormatter;
          objc_super v28 = [NSNumber numberWithInteger:v32];
          [(NSNumberFormatter *)localizedDayNumberFormatter stringFromNumber:v28];
        }
        else
        {
          v34 = self->_productDayFormatter;
          objc_super v28 = [(PKAccountPayment *)self->_payment paymentDate];
          [(NSDateFormatter *)v34 stringFromDate:v28];
        id v12 = };
        BOOL v29 = (id *)MEMORY[0x1E4F856F0];
      }

      id v14 = *v29;
      if (v11) {
        goto LABEL_7;
      }
LABEL_23:
      int v11 = PKLocalizedFeatureString();
LABEL_7:
      uint64_t v18 = 4;
LABEL_8:
      uint64_t v19 = [v9 textLabel];
      [v19 setText:v11];

      uint64_t v20 = [v9 detailTextLabel];
      [v20 setText:v12];
      [v20 setLineBreakMode:v18];
      [(PKCreditAccountPaymentDetailsViewController *)self _applyDetailViewStylingToCell:v9];
      PKAccessibilityIDCellSet(v9, v14);
      id v21 = v9;

LABEL_9:
      return v21;
    case 4:
      int v11 = PKLocalizedFeatureString();
      v30 = [(PKAccountPayment *)self->_payment fundingSource];
      id v12 = [v30 displayDescription];

      id v14 = (id)*MEMORY[0x1E4F852B0];
      uint64_t v18 = 5;
      goto LABEL_8;
    case 5:
      id v21 = [(PKCreditAccountPaymentDetailsViewController *)self _modifyPaymentCellForTableView:v6];
      goto LABEL_9;
    default:
      id v12 = 0;
      id v14 = 0;
      int v11 = 0;
      goto LABEL_7;
  }
}

- (id)_tableView:(id)a3 recurringPaymentUpcomingPaymentCellForPaymentDetailsRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _reuseIdentifierForSection:0];
  BOOL v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  uint64_t v10 = [v6 row];
  if (v10 == 1)
  {
    int v11 = PKLocalizedFeatureString();
    id v12 = [(PKCreditAccountPaymentDetailsViewController *)self _paymentAmountToDisplay];
    v16 = (id *)MEMORY[0x1E4F85228];
  }
  else
  {
    int v11 = 0;
    id v12 = 0;
    id v13 = 0;
    if (v10) {
      goto LABEL_6;
    }
    int v11 = PKLocalizedFeatureString();
    productDateFormatter = self->_productDateFormatter;
    v15 = [(PKAccountPayment *)self->_payment paymentDate];
    id v12 = [(NSDateFormatter *)productDateFormatter stringFromDate:v15];

    v16 = (id *)MEMORY[0x1E4F85440];
  }
  id v13 = *v16;
LABEL_6:
  id v17 = [v9 textLabel];
  [v17 setText:v11];

  uint64_t v18 = [v9 detailTextLabel];
  [v18 setText:v12];

  [(PKCreditAccountPaymentDetailsViewController *)self _applyDetailViewStylingToCell:v9];
  PKAccessibilityIDCellSet(v9, v13);

  return v9;
}

- (id)_tableView:(id)a3 recurringPaymentStatusCellForRowAtIndexPath:(id)a4
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 row] == 1)
  {
    id v7 = [v6 dequeueReusableCellWithIdentifier:@"LinkCellReuseIdentifier"];
    [(PKCreditAccountPaymentDetailsViewController *)self _configureDismissCell:v7];
  }
  else
  {
    uint64_t v8 = [(PKCreditAccountPaymentDetailsViewController *)self _reuseIdentifierForSection:3];
    id v57 = v6;
    BOOL v9 = [v6 dequeueReusableCellWithIdentifier:v8];

    uint64_t v10 = [(PKAccountPayment *)self->_payment scheduleDetails];
    [v10 preset];

    unint64_t viewStyle = self->_viewStyle;
    if (viewStyle == 1)
    {
      id v14 = PKBridgeAppearanceGetAppearanceSpecifier();
      v15 = [v14 foregroundColor];
      [v9 setBackgroundColor:v15];

      v16 = PKBridgeAppearanceGetAppearanceSpecifier();
      uint64_t v13 = [v16 textColor];

      id v17 = PKBridgeAppearanceGetAppearanceSpecifier();
      uint64_t v58 = [v17 altTextColor];
    }
    else
    {
      if (viewStyle == 2)
      {
        id v12 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
        [v9 setBackgroundColor:v12];
      }
      uint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v58 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    v55 = v9;
    if (self->_isFailedRecurringPayment)
    {
      uint64_t v18 = PKLocalizedFeatureString();
      v61 = PKLocalizedFeatureString();
      uint64_t v62 = PKLocalizedFeatureString();
      [MEMORY[0x1E4FB1618] redColor];
      uint64_t v20 = v19 = (void *)v13;
    }
    else
    {
      uint64_t v19 = [(PKAccountPayment *)self->_payment paymentDate];
      id v21 = PKLocalizedFeatureString();
      [(NSDateFormatter *)self->_productPaymentMonthFormatter stringFromDate:v19];
      uint64_t v22 = v59 = v13;
      uint64_t v18 = PKStringWithValidatedFormat();
      id v23 = PKLocalizedFeatureString();
      v53 = -[NSDateFormatter stringFromDate:](self->_productPaymentDateFormatter, "stringFromDate:", v19, v22);
      uint64_t v62 = PKStringWithValidatedFormat();

      uint64_t v20 = v59;
      v61 = 0;
    }

    uint64_t v24 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2908]];
    id v25 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v24 size:17.0];
    id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v28 = *MEMORY[0x1E4FB0700];
    v67[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v27 = v67[0];
    v67[1] = v28;
    v68[0] = v25;
    v68[1] = v20;
    v60 = (void *)v20;
    BOOL v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
    v56 = (void *)v18;
    v54 = (void *)[v26 initWithString:v18 attributes:v29];

    v30 = (uint64_t *)MEMORY[0x1E4FB0738];
    if (v61)
    {
      uint64_t v31 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];

      uint64_t v32 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v31 size:17.0];

      id v33 = objc_alloc_init(MEMORY[0x1E4FB0848]);
      [v33 setParagraphSpacingBefore:2.0];
      id v34 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v35 = *v30;
      v65[0] = v27;
      v65[1] = v35;
      v66[0] = v32;
      v66[1] = v33;
      v65[2] = v28;
      v66[2] = v58;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
      v37 = (void *)[v34 initWithDictionary:v36];

      v38 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v61 attributes:v37];
      [v54 appendAttributedString:v38];

      uint64_t v24 = (void *)v31;
      id v25 = (void *)v32;
      id v7 = v55;
      v39 = v54;
    }
    else
    {
      v39 = v54;
      id v7 = v55;
    }
    v40 = (void *)v62;
    if (v62)
    {
      uint64_t v41 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];

      uint64_t v42 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v41 size:15.0];

      id v43 = objc_alloc_init(MEMORY[0x1E4FB0848]);
      [v43 setParagraphSpacingBefore:6.0];
      id v44 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v45 = *MEMORY[0x1E4FB0738];
      v63[0] = v27;
      v63[1] = v45;
      v64[0] = v42;
      v64[1] = v43;
      v63[2] = v28;
      v46 = (void *)v58;
      v64[2] = v58;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
      v48 = (void *)[v44 initWithDictionary:v47];

      v49 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v62 attributes:v48];
      [v39 appendAttributedString:v49];

      uint64_t v24 = (void *)v41;
      v40 = (void *)v62;
      id v25 = (void *)v42;
      id v6 = v57;
    }
    else
    {
      id v6 = v57;
      v46 = (void *)v58;
    }
    v50 = objc_msgSend(v7, "textLabel", v53);
    [v50 setAttributedText:v39];

    v51 = [v7 textLabel];
    [v51 setNumberOfLines:0];

    PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F85A58]);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  [a3 deselectRowAtIndexPath:v7 animated:1];
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  switch(v6)
  {
    case 1uLL:
      if (-[PKCreditAccountPaymentDetailsViewController _recurringPaymentDetailsRowTypeForRowAtIndex:](self, "_recurringPaymentDetailsRowTypeForRowAtIndex:", [v7 row]) == 5)-[PKCreditAccountPaymentDetailsViewController _modifyPaymentSelected](self, "_modifyPaymentSelected"); {
      break;
      }
    case 3uLL:
      if ([v7 row] == 1) {
        [(PKCreditAccountPaymentDetailsViewController *)self _cancelPayment:3];
      }
      break;
    case 4uLL:
      [(PKCreditAccountPaymentDetailsViewController *)self _cancelPaymentSelected:4];
      break;
  }
}

- (void)_cancelPaymentSelected:(unint64_t)a3
{
  if (!self->_cancellingPayment)
  {
    objc_initWeak(&location, self);
    [(PKAccountPayment *)self->_payment isRecurring];
    unint64_t v5 = PKLocalizedFeatureString();
    unint64_t v6 = PKLocalizedFeatureString();
    id v7 = PKLocalizedFeatureString();
    uint64_t v8 = PKLocalizedFeatureString();
    BOOL v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PKCreditAccountPaymentDetailsViewController__cancelPaymentSelected___block_invoke;
    v13[3] = &unk_1E59D7D40;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    int v11 = [v10 actionWithTitle:v7 style:2 handler:v13];
    [v9 addAction:v11];

    id v12 = [MEMORY[0x1E4FB1410] actionWithTitle:v8 style:1 handler:0];
    [v9 addAction:v12];

    [(PKCreditAccountPaymentDetailsViewController *)self presentViewController:v9 animated:1 completion:0];
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
}

void __70__PKCreditAccountPaymentDetailsViewController__cancelPaymentSelected___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _cancelPayment:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_modifyPaymentSelected
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = PKLocalizedString(&cfstr_GenericFeature.isa);
  id v8 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:1];

  unint64_t v5 = (void *)MEMORY[0x1E4FB1410];
  unint64_t v6 = PKLocalizedString(&cfstr_GenericFeature_0.isa);
  id v7 = [v5 actionWithTitle:v6 style:1 handler:0];
  [v8 addAction:v7];

  [(PKCreditAccountPaymentDetailsViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (id)_cancelPaymentCellForTableView:(id)a3
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"LinkCellReuseIdentifier"];
  [(PKCreditAccountPaymentDetailsViewController *)self _configureDeletePaymentCell:v4];
  PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E4F85340]);

  return v4;
}

- (id)_modifyPaymentCellForTableView:(id)a3
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"LinkCellReuseIdentifier"];
  [(PKCreditAccountPaymentDetailsViewController *)self _configureLinkCell:v4];
  [(PKAccountPayment *)self->_payment isRecurring];
  unint64_t v5 = [v4 textLabel];
  unint64_t v6 = PKLocalizedFeatureString();
  [v5 setText:v6];

  PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E4F856E8]);

  return v4;
}

- (void)_configureDeletePaymentCell:(id)a3
{
  id v12 = a3;
  id v4 = [v12 textLabel];
  if (self->_cancellingPayment)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    [v12 setAccessoryView:v5];
    unint64_t v6 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v4 setTextColor:v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1618] redColor];
    [v4 setTextColor:v7];

    [v12 setAccessoryView:0];
  }
  [(PKAccountPayment *)self->_payment isRecurring];
  id v8 = PKLocalizedFeatureString();
  [v4 setText:v8];

  unint64_t viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v12 setBackgroundColor:v10];
  }
  else
  {
    if (viewStyle != 1) {
      goto LABEL_9;
    }
    uint64_t v10 = PKBridgeAppearanceGetAppearanceSpecifier();
    int v11 = [v10 foregroundColor];
    [v12 setBackgroundColor:v11];
  }
LABEL_9:
  PKAccessibilityIDCellSet(v12, (void *)*MEMORY[0x1E4F85340]);
}

- (void)_configureDismissCell:(id)a3
{
  id v13 = a3;
  id v4 = [v13 textLabel];
  if (self->_cancellingPayment)
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    [v13 setAccessoryView:v5];
    unint64_t v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [v4 setTextColor:v6];
  }
  else
  {
    id v7 = [(PKCreditAccountPaymentDetailsViewController *)self tableView];
    id v8 = [v7 tintColor];
    [v4 setTextColor:v8];

    [v13 setAccessoryView:0];
  }
  BOOL v9 = PKLocalizedFeatureString();
  [v4 setText:v9];

  unint64_t viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    int v11 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v13 setBackgroundColor:v11];
  }
  else
  {
    if (viewStyle != 1) {
      goto LABEL_9;
    }
    int v11 = PKBridgeAppearanceGetAppearanceSpecifier();
    id v12 = [v11 foregroundColor];
    [v13 setBackgroundColor:v12];
  }
LABEL_9:
  PKAccessibilityIDCellSet(v13, (void *)*MEMORY[0x1E4F85488]);
}

- (void)_configureLinkCell:(id)a3
{
  id v10 = a3;
  id v4 = [v10 textLabel];
  unint64_t v5 = [(PKCreditAccountPaymentDetailsViewController *)self tableView];
  unint64_t v6 = [v5 tintColor];
  [v4 setTextColor:v6];

  [v10 setAccessoryView:0];
  unint64_t viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    id v8 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v10 setBackgroundColor:v8];
  }
  else
  {
    if (viewStyle != 1) {
      goto LABEL_6;
    }
    id v8 = PKBridgeAppearanceGetAppearanceSpecifier();
    BOOL v9 = [v8 foregroundColor];
    [v10 setBackgroundColor:v9];
  }
LABEL_6:
}

- (void)_cancelPayment:(unint64_t)a3
{
  if (!self->_cancellingPayment)
  {
    self->_cancellingPayment = 1;
    unint64_t v5 = self->_payment;
    if (a3 == 4)
    {
      unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 4));
      BOOL v9 = [(PKCreditAccountPaymentDetailsViewController *)self tableView];
      id v8 = [v9 cellForRowAtIndexPath:v6];

      [(PKCreditAccountPaymentDetailsViewController *)self _configureDeletePaymentCell:v8];
    }
    else
    {
      if (a3 != 3)
      {
        unint64_t v6 = 0;
        goto LABEL_8;
      }
      unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 1, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 3));
      id v7 = [(PKCreditAccountPaymentDetailsViewController *)self tableView];
      id v8 = [v7 cellForRowAtIndexPath:v6];

      [(PKCreditAccountPaymentDetailsViewController *)self _configureDismissCell:v8];
    }

LABEL_8:
    id v10 = [(PKAccountPayment *)v5 referenceIdentifier];
    id v11 = objc_alloc_init(MEMORY[0x1E4F842F8]);
    id v12 = [(PKAccount *)self->_account accountIdentifier];
    [v11 setAccountIdentifier:v12];

    id v13 = [(PKAccount *)self->_account accountBaseURL];
    [v11 setBaseURL:v13];

    [v11 setPaymentReferenceIdentifier:v10];
    objc_initWeak(&location, self);
    paymentWebService = self->_paymentWebService;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke;
    v17[3] = &unk_1E59D7DB8;
    v17[4] = self;
    objc_copyWeak(v20, &location);
    v15 = v5;
    uint64_t v18 = v15;
    id v16 = v6;
    id v19 = v16;
    v20[1] = (id)a3;
    [(PKPaymentWebService *)paymentWebService cancelPaymentWithRequest:v11 completion:v17];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F84270] sharedInstance];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 1088);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v14[2] = __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_2;
  v14[3] = &unk_1E59D7D90;
  objc_copyWeak(v19, (id *)(a1 + 56));
  id v9 = v5;
  id v15 = v9;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v10;
  uint64_t v17 = v11;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(void **)(a1 + 64);
  id v18 = v12;
  v19[1] = v13;
  [v7 updateScheduledPaymentsWithAccount:v8 completion:v14];

  objc_destroyWeak(v19);
}

void __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_3;
  block[3] = &unk_1E59D7D68;
  objc_copyWeak(v17, (id *)(a1 + 64));
  id v12 = *(id *)(a1 + 32);
  id v13 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v14 = v5;
  uint64_t v15 = v6;
  id v8 = v7;
  id v9 = *(void **)(a1 + 72);
  id v16 = v8;
  v17[1] = v9;
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v17);
}

void __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v16 = WeakRetained;
    if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
    {
      id v10 = WeakRetained + 154;
      id v11 = objc_loadWeakRetained(WeakRetained + 154);
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        [*(id *)(a1 + 48) setState:3];
        id v13 = objc_loadWeakRetained(v10);
        [v13 paymentDetailsViewController:v16 didCancelPayment:*(void *)(a1 + 48)];
      }
      id v4 = [v16 navigationController];
      id v8 = [v4 topViewController];
      if (v8 == v16
        || ([v16 parentViewController],
            id v14 = (id *)objc_claimAutoreleasedReturnValue(),
            v14,
            v8 == v14))
      {
        id v15 = (id)[v4 popViewControllerAnimated:1];
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 56) + 1216) = 0;
      id v3 = [WeakRetained tableView];
      id v4 = [v3 cellForRowAtIndexPath:*(void *)(a1 + 64)];

      uint64_t v5 = *(void *)(a1 + 80);
      if (v5 == 4)
      {
        uint64_t v6 = [v16 tableView];
        id v7 = [v6 cellForRowAtIndexPath:*(void *)(a1 + 64)];

        [v16 _configureDeletePaymentCell:v7];
      }
      else if (v5 == 3)
      {
        [v16 _configureDismissCell:v4];
      }
      id v8 = +[PKAccountFlowController displayableErrorForError:*(void *)(a1 + 40) featureIdentifier:v16[138] genericErrorTitle:0 genericErrorMessage:0];
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      [v16 presentViewController:v9 animated:1 completion:0];
    }
    id WeakRetained = v16;
  }
}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  id v8 = a3;
  id v4 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForAccount:self->_account];
  if (v8 && v4)
  {
    uint64_t v5 = (void *)[v8 mutableCopy];
    [v5 setObject:*MEMORY[0x1E4F86250] forKey:*MEMORY[0x1E4F86730]];
    uint64_t v6 = (void *)MEMORY[0x1E4F843E0];
    id v7 = (void *)[v5 copy];
    [v6 subject:v4 sendEvent:v7];
  }
}

- (PKCreditAccountPaymentDetailsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCreditAccountPaymentDetailsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hyperlinkFooterView, 0);
  objc_storeStrong((id *)&self->_productPaymentDateFormatter, 0);
  objc_storeStrong((id *)&self->_productPaymentMonthFormatter, 0);
  objc_storeStrong((id *)&self->_localCancellationDateFormatter, 0);
  objc_storeStrong((id *)&self->_localTimeFormatter, 0);
  objc_storeStrong((id *)&self->_productDayFormatter, 0);
  objc_storeStrong((id *)&self->_productDateFormatter, 0);
  objc_storeStrong((id *)&self->_localizedDayNumberFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_recurringDetailsRowMap, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end