@interface PKAccountAutomaticPaymentsDateViewController
- (BOOL)_shouldShowCollectionView;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (PKAccountAutomaticPaymentsDateViewController)initWithController:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_addBankAccountInformationViewController;
- (id)_footerText;
- (id)tableHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_frequency;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleNext:(id)a3;
- (void)_handlePresentPayment;
- (void)_performPresentPayment;
- (void)_updateNextButtonEnabledIfNecessary;
- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4;
- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4;
- (void)addBankAccountInformationViewControllerDidFinish:(id)a3;
- (void)monthDaySelectionViewController:(id)a3 didSelectDate:(id)a4 day:(int64_t)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountAutomaticPaymentsDateViewController

- (PKAccountAutomaticPaymentsDateViewController)initWithController:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKAccountAutomaticPaymentsDateViewController;
  v6 = [(PKSectionTableViewController *)&v34 initWithStyle:1 numberOfSections:1];
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    uint64_t v9 = [*p_controller account];
    account = v7->_account;
    v7->_account = (PKAccount *)v9;

    v11 = [(PKAccount *)v7->_account creditDetails];
    uint64_t v12 = [v11 productTimeZone];
    productTimeZone = v7->_productTimeZone;
    v7->_productTimeZone = (NSTimeZone *)v12;

    v7->_featureIdentifier = [*p_controller featureIdentifier];
    uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    selectedIndexPath = v7->_selectedIndexPath;
    v7->_selectedIndexPath = (NSIndexPath *)v14;

    date = v7->_date;
    v7->_date = 0;

    v17 = [[PKMonthDayCollectionViewController alloc] initWithDayDelegate:v7 timeZone:v7->_productTimeZone];
    monthDayCollectionViewController = v7->_monthDayCollectionViewController;
    v7->_monthDayCollectionViewController = v17;

    id v19 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v20 = [v19 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    productCalendar = v7->_productCalendar;
    v7->_productCalendar = (NSCalendar *)v20;

    [(NSCalendar *)v7->_productCalendar setTimeZone:v7->_productTimeZone];
    v22 = v7->_productCalendar;
    v23 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v24 = [(NSCalendar *)v22 component:16 fromDate:v23];

    uint64_t v25 = [*p_controller minimumPaymentDayForPreset:3];
    [(PKMonthDayCollectionViewController *)v7->_monthDayCollectionViewController setMinimumDayNumber:v25];
    if (v25 <= v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v25;
    }
    [(PKMonthDayCollectionViewController *)v7->_monthDayCollectionViewController setDayNumber:v26];
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    cardinalDayDateFormatter = v7->_cardinalDayDateFormatter;
    v7->_cardinalDayDateFormatter = v27;

    [(NSDateFormatter *)v7->_cardinalDayDateFormatter setTimeZone:v7->_productTimeZone];
    [(NSDateFormatter *)v7->_cardinalDayDateFormatter setLocalizedDateFormatFromTemplate:@"d"];
    v29 = PKLocalizedFeatureString();
    v30 = v29;
    if (v29) {
      LOBYTE(v29) = [v29 isEqualToString:@"1"];
    }
    v7->_useOrdinalDay = (char)v29;
    v31 = objc_alloc_init(PKAccountAutomaticPaymentsDateFooterView);
    collectionFooterView = v7->_collectionFooterView;
    v7->_collectionFooterView = v31;

    [(PKAccountAutomaticPaymentsDateFooterView *)v7->_collectionFooterView setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
    [(PKAccountAutomaticPaymentsDateFooterView *)v7->_collectionFooterView setCollectionViewController:v7->_monthDayCollectionViewController];
    [(PKSectionTableViewController *)v7 setSkipSetupForReadableContentGuide:1];
  }
  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKAccountAutomaticPaymentsDateViewController;
  [(PKSectionTableViewController *)&v10 viewDidLoad];
  v3 = [(PKAccountAutomaticPaymentsDateViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"dateCellReuseIdentifier"];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  v4 = [(PKAccountAutomaticPaymentsDateViewController *)self tableHeaderView];
  [v3 setTableHeaderView:v4];

  [v3 selectRowAtIndexPath:self->_selectedIndexPath animated:0 scrollPosition:0];
  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = PKLocalizedPaymentString(&cfstr_Next.isa);
  v7 = (void *)[v5 initWithTitle:v6 style:2 target:self action:sel__handleNext_];

  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
  v8 = [(PKAccountAutomaticPaymentsDateViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];
  uint64_t v9 = [(PKAccountAutomaticPaymentsDateViewController *)self view];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85268]];
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKAccountAutomaticPaymentsDateViewController;
  [(PKAccountAutomaticPaymentsDateViewController *)&v16 viewWillLayoutSubviews];
  collectionFooterView = self->_collectionFooterView;
  if ([(PKAccountAutomaticPaymentsDateViewController *)self _shouldShowCollectionView]) {
    monthDayCollectionViewController = self->_monthDayCollectionViewController;
  }
  else {
    monthDayCollectionViewController = 0;
  }
  [(PKAccountAutomaticPaymentsDateFooterView *)collectionFooterView setCollectionViewController:monthDayCollectionViewController];
  id v5 = [(PKAccountAutomaticPaymentsDateFooterView *)self->_collectionFooterView textLabel];
  v6 = [(PKAccountAutomaticPaymentsDateViewController *)self _footerText];
  [v5 setText:v6];

  v7 = [(PKAccountAutomaticPaymentsDateViewController *)self tableView];
  [v7 bounds];
  double v9 = v8;

  [(PKAccountAutomaticPaymentsDateFooterView *)self->_collectionFooterView frame];
  double v11 = v10;
  double v13 = v12;
  -[PKAccountAutomaticPaymentsDateFooterView sizeThatFits:](self->_collectionFooterView, "sizeThatFits:", v9, 0.0);
  -[PKAccountAutomaticPaymentsDateFooterView setFrame:](self->_collectionFooterView, "setFrame:", v11, v13, v14, v15);
  [(PKAccountAutomaticPaymentsDateFooterView *)self->_collectionFooterView layoutIfNeeded];
}

- (id)tableHeaderView
{
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = PKLocalizedFeatureString();
    id v5 = PKLocalizedFeatureString();
    v6 = [PKTableHeaderView alloc];
    v7 = -[PKTableHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v8 = self->_tableHeaderView;
    self->_tableHeaderView = v7;

    double v9 = [(PKTableHeaderView *)self->_tableHeaderView titleLabel];
    [v9 setText:v4];

    double v10 = [(PKTableHeaderView *)self->_tableHeaderView subtitleLabel];
    [v10 setText:v5];

    [(PKTableHeaderView *)self->_tableHeaderView setTopPadding:5.0];
    [(PKTableHeaderView *)self->_tableHeaderView setBottomPadding:60.0];
    double v11 = self->_tableHeaderView;
    double v12 = [(PKAccountAutomaticPaymentsDateViewController *)self tableView];
    [v12 bounds];
    -[PKTableHeaderView sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
    double v14 = v13;
    double v16 = v15;

    -[PKTableHeaderView setFrame:](self->_tableHeaderView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
    tableHeaderView = self->_tableHeaderView;
  }

  return tableHeaderView;
}

- (void)_handleNext:(id)a3
{
  [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentFrequency:[(PKAccountAutomaticPaymentsDateViewController *)self _frequency]];
  [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentDate:self->_date];
  [(PKAccountAutomaticPaymentsController *)self->_controller setScheduledDay:self->_scheduledDay];
  [(PKAccountAutomaticPaymentsController *)self->_controller setAmount:0];

  [(PKAccountAutomaticPaymentsDateViewController *)self _handlePresentPayment];
}

- (int64_t)_frequency
{
  if ([(NSIndexPath *)self->_selectedIndexPath row]) {
    return 6;
  }
  else {
    return 7;
  }
}

- (BOOL)_shouldShowCollectionView
{
  return [(PKAccountAutomaticPaymentsDateViewController *)self _frequency] == 6;
}

- (void)_handlePresentPayment
{
  v3 = [(PKAccountAutomaticPaymentsController *)self->_controller alertControllerForScheduledDate:self->_date];
  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E4FB1410];
    id v5 = PKLocalizedString(&cfstr_Ok.isa);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    double v9 = __69__PKAccountAutomaticPaymentsDateViewController__handlePresentPayment__block_invoke;
    double v10 = &unk_1E59CCFF0;
    objc_copyWeak(&v11, &location);
    v6 = [v4 actionWithTitle:v5 style:0 handler:&v7];
    objc_msgSend(v3, "addAction:", v6, v7, v8, v9, v10);

    [(PKAccountAutomaticPaymentsDateViewController *)self presentViewController:v3 animated:1 completion:0];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKAccountAutomaticPaymentsDateViewController *)self _performPresentPayment];
  }
}

void __69__PKAccountAutomaticPaymentsDateViewController__handlePresentPayment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _performPresentPayment];
    id WeakRetained = v2;
  }
}

- (void)_performPresentPayment
{
  v3 = [(PKAccountAutomaticPaymentsController *)self->_controller fundingSources];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    controller = self->_controller;
    [(PKAccountAutomaticPaymentsController *)controller performScheduleAutomaticPaymentsFromViewController:self];
  }
  else
  {
    id v7 = [(PKAccountAutomaticPaymentsDateViewController *)self navigationController];
    v6 = [(PKAccountAutomaticPaymentsDateViewController *)self _addBankAccountInformationViewController];
    [v7 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_updateNextButtonEnabledIfNecessary
{
  BOOL v3 = [(PKAccountAutomaticPaymentsController *)self->_controller canPerformScheduleAutomaticPaymentsWithPreset:3 frequency:[(PKAccountAutomaticPaymentsDateViewController *)self _frequency] amount:0 paymentDate:self->_date];
  id v5 = [(PKAccountAutomaticPaymentsDateViewController *)self navigationItem];
  uint64_t v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (id)_footerText
{
  if ([(PKAccountAutomaticPaymentsDateViewController *)self _frequency] == 7)
  {
    BOOL v3 = 0;
  }
  else
  {
    if (self->_useOrdinalDay)
    {
      uint64_t v4 = PKOrdinalStringForInteger();
    }
    else
    {
      productCalendar = self->_productCalendar;
      v6 = [MEMORY[0x1E4F1C9C8] date];
      id v7 = [(NSCalendar *)productCalendar nextDateAfterDate:v6 matchingUnit:16 value:self->_scheduledDay options:2];

      uint64_t v4 = [(NSDateFormatter *)self->_cardinalDayDateFormatter stringFromDate:v7];
    }
    BOOL v3 = PKLocalizedFeatureString();
  }

  return v3;
}

- (void)monthDaySelectionViewController:(id)a3 didSelectDate:(id)a4 day:(int64_t)a5
{
  id v10 = a4;
  if ([(PKAccountAutomaticPaymentsDateViewController *)self _shouldShowCollectionView])
  {
    id v7 = [(PKAccountAutomaticPaymentsController *)self->_controller firstAutomaticPaymentDateForSelectedDate:v10];
    date = self->_date;
    self->_date = v7;

    self->_scheduledDay = a5;
    double v9 = [(PKAccountAutomaticPaymentsDateViewController *)self tableView];
    [v9 reloadData];

    [(PKAccountAutomaticPaymentsDateViewController *)self _updateNextButtonEnabledIfNecessary];
  }
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (([v6 isEqual:self->_selectedIndexPath] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a4);
    [v12 reloadData];
    if ([(PKAccountAutomaticPaymentsDateViewController *)self _shouldShowCollectionView])
    {
      controller = self->_controller;
      uint64_t v8 = [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController selectedDate];
      double v9 = [(PKAccountAutomaticPaymentsController *)controller firstAutomaticPaymentDateForSelectedDate:v8];
      date = self->_date;
      self->_date = v9;

      self->_scheduledDay = [(PKMonthDayCollectionViewController *)self->_monthDayCollectionViewController dayNumber];
    }
    else
    {
      id v11 = self->_date;
      self->_date = 0;
    }
  }
  [v12 deselectRowAtIndexPath:v6 animated:1];
  [(PKAccountAutomaticPaymentsDateViewController *)self _updateNextButtonEnabledIfNecessary];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  selectedIndexPath = self->_selectedIndexPath;
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 isEqual:selectedIndexPath];
  uint64_t v9 = [v6 row];
  id v10 = [v7 dequeueReusableCellWithIdentifier:@"dateCellReuseIdentifier" forIndexPath:v6];

  if (!v9)
  {
    id v11 = (void *)MEMORY[0x1E4F854A8];
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    id v11 = (void *)MEMORY[0x1E4F85740];
LABEL_5:
    id v12 = PKLocalizedFeatureString();
    double v13 = PKLocalizedFeatureString();
    [v10 setAccessibilityIdentifier:*v11];
    goto LABEL_7;
  }
  double v13 = 0;
  id v12 = 0;
LABEL_7:
  double v14 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  [v14 setText:v12];
  [v14 setSecondaryText:v13];
  [v10 setMinimumHeight:60.0];
  double v15 = [v14 textProperties];
  double v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v15 setFont:v16];

  v17 = [v14 secondaryTextProperties];
  v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v17 setFont:v18];

  [v17 setNumberOfLines:0];
  [v10 setContentConfiguration:v14];
  CGRect v19 = [v10 accessoryView];
  if (!v19)
  {
    uint64_t v20 = [v10 traitCollection];
    v21 = PKUICellAccessoryCheckmarkConfiguration(v20);

    v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v21];
    CGRect v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v22];
    [v10 setAccessoryView:v19];
  }
  [v19 setHidden:v8 ^ 1u];
  [v10 setSelectionStyle:0];

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_collectionFooterView;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)_addBankAccountInformationViewController
{
  BOOL v3 = [(PKAccount *)self->_account creditDetails];
  uint64_t v4 = [v3 countryCode];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84550]) initWithType:1];
  id v6 = [[PKAddBankAccountInformationViewController alloc] initWithDelegate:self bankInformation:v5 accountCountryCode:v4 featureAccount:self->_account];
  id v7 = [(PKAccountAutomaticPaymentsController *)self->_controller fundingSources];
  -[PKAddBankAccountInformationViewController setOfferKeychainPreFill:](v6, "setOfferKeychainPreFill:", [v7 count] == 0);

  int v8 = [[PKNavigationController alloc] initWithRootViewController:v6];
  [(PKNavigationController *)v8 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v8 setModalPresentationStyle:2];
  }

  return v8;
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __108__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(a1 + 32) + 1104);
  v3[0] = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 setFundingSources:v2];
}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  uint64_t v4 = [(PKAccountAutomaticPaymentsDateViewController *)self navigationController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __97__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1104) fundingSources];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _performPresentPayment];
  }
}

- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didFailWithError___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __105__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didFailWithError___block_invoke(uint64_t a1)
{
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 32), [*(id *)(*(void *)(a1 + 40) + 1112) feature], 0, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
  [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_collectionFooterView, 0);
  objc_storeStrong((id *)&self->_cardinalDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayCollectionViewController, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end