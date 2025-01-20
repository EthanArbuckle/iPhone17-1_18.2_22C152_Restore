@interface PKPassDetailScheduledPaymentsSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (BOOL)_shouldDisplaySection:(id)a3;
- (BOOL)_updateSections;
- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)recurringPayments;
- (NSArray)scheduledPayments;
- (PKPassDetailScheduledPaymentsSectionController)initWithAccount:(id)a3 pass:(id)a4 accountService:(id)a5 delegate:(id)a6;
- (PKPassDetailScheduledPaymentsSectionControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForFooterInSectionIdentifier:(id)a4;
- (id)_accountServiceScheduledPaymentsCellForRowIndex:(int64_t)a3 sectionIdentifier:(id)a4 tableView:(id)a5;
- (id)_dueDateFormatter;
- (id)_dueTimeFormatter;
- (id)_scheduledPaymentCellForPayment:(id)a3 tableView:(id)a4;
- (id)_titleForScheduledPaymentsSection;
- (id)allSectionIdentifiers;
- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (unint64_t)_accountServiceScheduledPaymentsRowTypeForRowIndex:(int64_t)a3 sectionIdentifier:(id)a4;
- (void)_fetchScheduledPaymentsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchScheduledPaymentsAndReloadSections:(id)a3;
- (void)preflight:(id)a3;
- (void)presentSchedulePayments:(id)a3 completion:(id)a4;
- (void)reloadScheduledPayments;
- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3;
- (void)setCurrentSegment:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (void)updateWithAccount:(id)a3;
@end

@implementation PKPassDetailScheduledPaymentsSectionController

- (PKPassDetailScheduledPaymentsSectionController)initWithAccount:(id)a3 pass:(id)a4 accountService:(id)a5 delegate:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPassDetailScheduledPaymentsSectionController;
  v15 = [(PKPaymentPassDetailSectionController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_pass, a4);
    objc_storeStrong((id *)&v16->_accountService, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v21[0] = @"SchedulePaymentsSectionIdentifier";
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    allSectionIdentifiers = v16->_allSectionIdentifiers;
    v16->_allSectionIdentifiers = (NSArray *)v17;

    [(PKPassDetailScheduledPaymentsSectionController *)v16 _updateSections];
    [(PKAccountService *)v16->_accountService registerObserver:v16];
  }

  return v16;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPassDetailScheduledPaymentsSectionController;
  [(PKPassDetailScheduledPaymentsSectionController *)&v3 dealloc];
}

- (void)reloadScheduledPayments
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v3 = [(PKPassDetailScheduledPaymentsSectionController *)self allSectionIdentifiers];
  [WeakRetained reloadSectionIdentifiers:v3];
}

- (BOOL)_updateSections
{
  objc_super v3 = self->_sectionIdentifiers;
  if ([(PKPaymentPassDetailSectionController *)self currentSegment])
  {
    v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    allSectionIdentifiers = self->_allSectionIdentifiers;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PKPassDetailScheduledPaymentsSectionController__updateSections__block_invoke;
    v10[3] = &unk_1E59E03B0;
    v10[4] = self;
    v4 = [(NSArray *)allSectionIdentifiers pk_objectsPassingTest:v10];
  }
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v4;
  v7 = v4;

  char v8 = PKEqualObjects();
  return v8 ^ 1;
}

uint64_t __65__PKPassDetailScheduledPaymentsSectionController__updateSections__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldDisplaySection:a2];
}

- (void)fetchScheduledPaymentsAndReloadSections:(id)a3
{
  id v4 = a3;
  if ([(PKPassDetailScheduledPaymentsSectionController *)self _updateSections])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained recomputeMappedSectionsAndReloadSections:self->_sectionIdentifiers];
  }
  else
  {
    [(PKPassDetailScheduledPaymentsSectionController *)self reloadScheduledPayments];
  }
  id v6 = [(PKAccount *)self->_account accountIdentifier];
  [(PKPassDetailScheduledPaymentsSectionController *)self _fetchScheduledPaymentsWithAccountIdentifier:v6 completion:v4];
}

- (void)updateWithAccount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_account, a3);
    [(PKPassDetailScheduledPaymentsSectionController *)self fetchScheduledPaymentsAndReloadSections:0];
  }
}

- (void)presentSchedulePayments:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, a3);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke;
  aBlock[3] = &unk_1E59CB268;
  objc_copyWeak(&v25, &location);
  aBlock[4] = self;
  v9 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!self->_loadingAutomaticPayments)
  {
    v10 = [MEMORY[0x1E4F84D50] sharedService];
    int64_t v11 = [(PKPaymentPassDetailSectionController *)self detailViewStyle];
    id v12 = (void *)v11;
    uint64_t v13 = 3;
    if (v11 != 1) {
      uint64_t v13 = 0;
    }
    if (v11 == 2) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = v13;
    }
    v15 = [[PKAccountAutomaticPaymentsController alloc] initWithAccountService:self->_accountService paymentWebService:v10 account:self->_account context:v14];
    [(PKAccountAutomaticPaymentsController *)v15 setDelegate:self];
    [(PKAccountAutomaticPaymentsController *)v15 setAutomaticPayments:self->_recurringPayments];
    v9[2](v9, 1);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_2;
    v18[3] = &unk_1E59E0428;
    objc_copyWeak(v23, &location);
    v16 = v15;
    v19 = v16;
    v21 = v9;
    id v17 = v10;
    id v20 = v17;
    v23[1] = v12;
    v23[2] = (id)v14;
    id v22 = v8;
    [(PKAccountAutomaticPaymentsController *)v16 preflightWithCompletion:v18];

    objc_destroyWeak(v23);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 105) = a2;
    v16 = WeakRetained;
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 136) count];
    id v5 = v16;
    if (!v6)
    {
      uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 144) count];
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
      v9 = objc_msgSend(v8, "cellForRow:inSection:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "count"), @"SchedulePaymentsSectionIdentifier");

      if (v9)
      {
        v10 = [v9 detailTextLabel];
        int64_t v11 = [v10 text];
        uint64_t v12 = [v11 length];

        if (!v12)
        {
          uint64_t v14 = [v9 textLabel];
          v15 = [v14 textColor];

          [v16 showSpinner:a2 inCell:v9 overrideTextColor:v15];
          if (a2) {
            goto LABEL_7;
          }
          goto LABEL_6;
        }
        [v16 showSpinner:a2 inCell:v9 detailText:0];
        if ((a2 & 1) == 0)
        {
LABEL_6:
          id v13 = objc_loadWeakRetained(v16 + 19);
          [v13 reloadRow:v7 inSectionWithSectionIdentifier:@"SchedulePaymentsSectionIdentifier"];
        }
      }
LABEL_7:

      id v5 = v16;
    }
  }
}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_3;
  block[3] = &unk_1E59E0400;
  objc_copyWeak(&v13, (id *)(a1 + 64));
  char v15 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 72);
  id v12 = *(id *)(a1 + 56);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 96) && !*(void *)(a1 + 32))
    {
      objc_super v3 = [*(id *)(a1 + 40) automaticPayments];
      if (![v3 count])
      {
        id v9 = *(void **)(a1 + 40);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_4;
        v10[3] = &unk_1E59E03D8;
        id v11 = *(id *)(a1 + 56);
        id v12 = *(id *)(a1 + 64);
        [v9 nextViewControllerFromViewController:0 withCompletion:v10];

        goto LABEL_6;
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v5 = [PKCreditAccountPaymentDetailsViewController alloc];
      id v6 = WeakRetained[8];
      uint64_t v7 = [v3 firstObject];
      id v4 = [(PKCreditAccountPaymentDetailsViewController *)v5 initWithAccount:v6 payment:v7 paymentWebService:*(void *)(a1 + 48) detailViewStyle:*(void *)(a1 + 80)];

      id v8 = [[PKNavigationController alloc] initWithRootViewController:v4];
      PKPaymentSetupApplyContextAppearance(*(void *)(a1 + 88), v8);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      objc_super v3 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 32), [WeakRetained[8] feature], 0, 0);
      id v4 = (PKCreditAccountPaymentDetailsViewController *)PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }

LABEL_6:
  }
}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t, void))(v3 + 16);
  id v5 = a2;
  v4(v3, 0);
  id v6 = [[PKNavigationController alloc] initWithRootViewController:v5];

  if ([(UIViewController *)v6 pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v6 setModalPresentationStyle:2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAccount *)self->_account accountIdentifier];
  id v6 = v4;
  id v7 = v5;
  if (v7 == v6)
  {
  }
  else
  {
    id v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_9;
    }
    int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_9;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PKPassDetailScheduledPaymentsSectionController_scheduledPaymentsChangedForAccountIdentifier___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_9:
}

uint64_t __95__PKPassDetailScheduledPaymentsSectionController_scheduledPaymentsChangedForAccountIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchScheduledPaymentsAndReloadSections:0];
}

- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3
{
  return self->_presentationSceneIdentifier;
}

- (id)allSectionIdentifiers
{
  return self->_allSectionIdentifiers;
}

- (void)setCurrentSegment:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassDetailScheduledPaymentsSectionController;
  [(PKPaymentPassDetailSectionController *)&v4 setCurrentSegment:a3];
  [(PKPassDetailScheduledPaymentsSectionController *)self _updateSections];
}

- (id)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return [a3 isAppleCardPass];
}

- (void)preflight:(id)a3
{
  self->_loadingPayments = 1;
  [(PKPassDetailScheduledPaymentsSectionController *)self fetchScheduledPaymentsAndReloadSections:a3];
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  unint64_t v7 = -[PKPassDetailScheduledPaymentsSectionController _accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:](self, "_accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:", [a3 row], v6);

  return !self->_loadingPayments || v7 == 3;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  if (PKEqualObjects())
  {
    objc_super v4 = [(PKPassDetailScheduledPaymentsSectionController *)self _titleForScheduledPaymentsSection];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  if (!PKEqualObjects()) {
    goto LABEL_13;
  }
  id v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [v5 accountSummary];

  unint64_t v7 = [v6 remainingStatementBalance];
  id v8 = [v6 paymentDueDate];
  int v9 = [v6 currentStatement];
  [(PKAccount *)self->_account feature];
  int v10 = 1;
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    BOOL v11 = !v8 || v9 == 0;
    if (!v11
      && ![(NSArray *)self->_recurringPayments count]
      && objc_msgSend(v7, "pk_isPositiveNumber"))
    {
      int IsSingular = PKHourOfDateIsSingular();
      id v13 = @"ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY";
      if (IsSingular) {
        id v13 = @"ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY_HOUR_ONE";
      }
      long long v14 = v13;
      char v15 = [(PKPassDetailScheduledPaymentsSectionController *)self _dueDateFormatter];
      v16 = [v15 stringFromDate:v8];

      id v17 = [(PKPassDetailScheduledPaymentsSectionController *)self _dueTimeFormatter];
      v18 = [v17 stringFromDate:v8];

      uint64_t v3 = PKLocalizedFeatureString();

      int v10 = 0;
    }
  }

  if (v10) {
LABEL_13:
  }
    uint64_t v3 = 0;

  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PKAccount *)self->_account creditDetails];
  unint64_t v7 = [v6 accountSummary];

  id v8 = [v7 adjustedBalance];
  if (v8)
  {
    int v9 = [MEMORY[0x1E4F28C28] zero];
    BOOL v10 = [v8 compare:v9] == 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  if (PKEqualObjects())
  {
    uint64_t v11 = [(NSArray *)self->_recurringPayments count];
    NSUInteger v12 = [(NSArray *)self->_scheduledPayments count];
    if (v11 <= 0) {
      uint64_t v11 = !self->_loadingPayments;
    }
    int64_t v13 = v12 + v10 + v11;
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = -[PKPassDetailScheduledPaymentsSectionController _accountServiceScheduledPaymentsCellForRowIndex:sectionIdentifier:tableView:](self, "_accountServiceScheduledPaymentsCellForRowIndex:sectionIdentifier:tableView:", [a4 row], v8, v9);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  [a3 deselectRowAtIndexPath:v17 animated:1];
  if (PKStoreDemoModeEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didSelectInDemoMode];
  }
  else
  {
    uint64_t v10 = [v17 row];
    switch([(PKPassDetailScheduledPaymentsSectionController *)self _accountServiceScheduledPaymentsRowTypeForRowIndex:v10 sectionIdentifier:v8])
    {
      case 0uLL:
        id WeakRetained = [(NSArray *)self->_recurringPayments objectAtIndexedSubscript:v10];
        uint64_t v11 = (id *)MEMORY[0x1E4F86BB8];
        goto LABEL_7;
      case 1uLL:
        id WeakRetained = [(NSArray *)self->_scheduledPayments objectAtIndexedSubscript:v10 - [(NSArray *)self->_recurringPayments count]];
        uint64_t v11 = (id *)MEMORY[0x1E4F86BC0];
LABEL_7:
        id v12 = *v11;
        if (WeakRetained)
        {
          id v13 = objc_loadWeakRetained((id *)&self->_delegate);
          [v13 didSelectPayment:WeakRetained];
        }
        goto LABEL_12;
      case 2uLL:
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        [v14 didSelectSchedulePayments];

        char v15 = (id *)MEMORY[0x1E4F86BC8];
        goto LABEL_11;
      case 3uLL:
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        [v16 didSelectMakePayment];

        char v15 = (id *)MEMORY[0x1E4F86BD0];
LABEL_11:
        id v12 = *v15;
        id WeakRetained = 0;
LABEL_12:
        if (v12)
        {
          [(PKPaymentPassDetailSectionController *)self reportPassDetailsAnalyticsForTappedRowTag:v12 additionalAnalytics:0 pass:self->_pass];
        }
        break;
      default:
        id WeakRetained = 0;
        break;
    }
  }
}

- (BOOL)_shouldDisplaySection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaymentPassDetailSectionController *)self detailViewStyle] != 2
    && +[PKCreditAccountController shouldDisplayScheduledPaymentsWithAccount:self->_account andPass:self->_pass];
  BOOL v6 = PKEqualObjects() & v5;

  return v6;
}

- (id)_dueDateFormatter
{
  dueDateFormatter = self->_dueDateFormatter;
  if (!dueDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    BOOL v5 = self->_dueDateFormatter;
    self->_dueDateFormatter = v4;

    BOOL v6 = self->_dueDateFormatter;
    unint64_t v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v6 setLocale:v7];

    [(NSDateFormatter *)self->_dueDateFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
    [(NSDateFormatter *)self->_dueDateFormatter setFormattingContext:1];
    dueDateFormatter = self->_dueDateFormatter;
  }

  return dueDateFormatter;
}

- (id)_dueTimeFormatter
{
  dueTimeFormatter = self->_dueTimeFormatter;
  if (!dueTimeFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    BOOL v5 = self->_dueTimeFormatter;
    self->_dueTimeFormatter = v4;

    BOOL v6 = self->_dueTimeFormatter;
    unint64_t v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v6 setLocale:v7];

    [(NSDateFormatter *)self->_dueTimeFormatter setLocalizedDateFormatFromTemplate:@"j:mm a"];
    [(NSDateFormatter *)self->_dueTimeFormatter setFormattingContext:1];
    dueTimeFormatter = self->_dueTimeFormatter;
  }

  return dueTimeFormatter;
}

- (id)_titleForScheduledPaymentsSection
{
  [(PKAccount *)self->_account feature];

  return (id)PKLocalizedFeatureString();
}

- (id)_accountServiceScheduledPaymentsCellForRowIndex:(int64_t)a3 sectionIdentifier:(id)a4 tableView:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(PKPassDetailScheduledPaymentsSectionController *)self _accountServiceScheduledPaymentsRowTypeForRowIndex:a3 sectionIdentifier:a4];
  unint64_t v10 = v9;
  if (v9 > 1)
  {
    [(PKAccount *)self->_account feature];
    if (v10 != 2)
    {
      if (![(NSArray *)self->_scheduledPayments count]) {
        [(NSArray *)self->_recurringPayments count];
      }
      id v22 = PKLocalizedFeatureString();
      uint64_t v23 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v22 forTableView:v8];
      goto LABEL_13;
    }
    id v14 = PKLocalizedFeatureString();
    char v15 = PKLocalizedFeatureString();
    uint64_t v16 = 1;
    id v17 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v14 detailText:v15 cellStyle:1 forTableView:v8];
    v18 = v17;
    if (self->_loadingAutomaticPayments)
    {
      v19 = [v17 detailTextLabel];
      [v19 setText:0];

      id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v20 startAnimating];
      if (self->_loadingAutomaticPayments)
      {
        v21 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
        uint64_t v16 = 0;
LABEL_26:
        v30 = [v18 textLabel];
        [v30 setTextColor:v21];

        [v18 setAccessoryType:v16];
        [v18 setAccessoryView:v20];

        v24 = (void *)MEMORY[0x1E4F859C8];
        goto LABEL_27;
      }
      uint64_t v16 = 0;
    }
    else
    {
      id v20 = 0;
    }
    v27 = [(PKPaymentPassDetailSectionController *)self primaryTextColor];
    v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [MEMORY[0x1E4FB1618] labelColor];
    }
    v21 = v29;

    goto LABEL_26;
  }
  if (v9)
  {
    scheduledPayments = self->_scheduledPayments;
    int64_t v12 = a3 - [(NSArray *)self->_recurringPayments count];
    recurringPayments = scheduledPayments;
  }
  else
  {
    recurringPayments = self->_recurringPayments;
    int64_t v12 = a3;
  }
  id v22 = [(NSArray *)recurringPayments objectAtIndexedSubscript:v12];
  uint64_t v23 = [(PKPassDetailScheduledPaymentsSectionController *)self _scheduledPaymentCellForPayment:v22 tableView:v8];
LABEL_13:
  v18 = (void *)v23;

  v24 = (void *)MEMORY[0x1E4F858D8];
  id v25 = (void *)MEMORY[0x1E4F857B0];
  v26 = (void *)MEMORY[0x1E4F85B28];
  if (v10 == 1) {
    v26 = (void *)MEMORY[0x1E4F85968];
  }
  if (v10 != 3) {
    id v25 = v26;
  }
  if (v10) {
    v24 = v25;
  }
LABEL_27:
  [v18 setAccessibilityIdentifier:*v24];

  return v18;
}

- (double)tableView:(id)a3 heightForFooterInSectionIdentifier:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)_scheduledPaymentCellForPayment:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [a4 dequeueReusableCellWithIdentifier:@"scheduledPaymentCell"];
  if (!v7)
  {
    unint64_t v7 = [[PKAccountScheduledPaymentCell alloc] initWithStyle:1 reuseIdentifier:@"scheduledPaymentCell"];
    id v8 = [(PKPaymentPassDetailSectionController *)self primaryTextColor];
    [(PKAccountScheduledPaymentCell *)v7 setTitleColor:v8];
  }
  [(PKAccountScheduledPaymentCell *)v7 setPayment:v6 forAccount:self->_account];

  return v7;
}

- (void)_fetchScheduledPaymentsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = (void (**)(void))a4;
  if (PKStoreDemoModeEnabled())
  {
    p_loadingPayments = &self->_loadingPayments;
    self->_loadingPayments = 1;
    [(PKPassDetailScheduledPaymentsSectionController *)self reloadScheduledPayments];
LABEL_4:
    id v9 = objc_alloc_init(MEMORY[0x1E4F84208]);
    unint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    [v9 setReferenceIdentifier:v11];

    int64_t v12 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v12 UUIDString];
    [v9 setClientReferenceIdentifier:v13];

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F84218]) initWithType:1];
    char v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    [v14 setIdentifier:v16];

    [v14 setAccountSuffix:@"2354"];
    id v17 = objc_alloc_init(MEMORY[0x1E4F84210]);
    [v17 setName:@"Bank of America"];
    [v14 setFundingDetails:v17];
    [v9 setFundingSource:v14];
    id v18 = objc_alloc_init(MEMORY[0x1E4F84220]);
    [v18 setFrequency:7];
    [v18 setPreset:3];
    v19 = [MEMORY[0x1E4F1C9C8] date];
    id v20 = PKEndOfMonth();
    [v18 setScheduledDate:v20];

    [v9 setScheduleDetails:v18];
    v21 = [MEMORY[0x1E4F1C9C8] date];
    id v22 = PKEndOfMonth();
    [v9 setPaymentDate:v22];

    [v9 setState:1];
    v32[0] = v9;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    recurringPayments = self->_recurringPayments;
    self->_recurringPayments = v23;

    BOOL *p_loadingPayments = 0;
    [(PKPassDetailScheduledPaymentsSectionController *)self reloadScheduledPayments];
    if (v6) {
      v6[2](v6);
    }

    goto LABEL_7;
  }
  int v8 = PKUIOnlyDemoModeEnabled();
  p_loadingPayments = &self->_loadingPayments;
  self->_loadingPayments = 1;
  [(PKPassDetailScheduledPaymentsSectionController *)self reloadScheduledPayments];
  if (v8) {
    goto LABEL_4;
  }
  account = self->_account;
  if (account && ([(PKAccount *)account accessLevel] | 2) != 2)
  {
    objc_initWeak(&location, self);
    accountService = self->_accountService;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke;
    v28[3] = &unk_1E59CB060;
    objc_copyWeak(&v30, &location);
    id v29 = v6;
    [(PKAccountService *)accountService scheduledPaymentsWithAccountIdentifier:v27 includeFailedRecurringPayments:1 completion:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else if (v6)
  {
    v6[2](v6);
  }
LABEL_7:
}

void __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke_2;
  v9[3] = &unk_1E59D11A8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 104) = 0;
    if (!*(void *)(a1 + 32) && *(void *)(a1 + 40))
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v11, "isRecurring", (void)v23)) {
              id v12 = v4;
            }
            else {
              id v12 = v5;
            }
            [v12 addObject:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v8);
      }

      uint64_t v13 = [v4 copy];
      id v14 = (void *)v3[17];
      v3[17] = v13;

      uint64_t v15 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_241);
      uint64_t v16 = (void *)v3[18];
      v3[18] = v15;

      id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"paymentDate" ascending:1];
      id v18 = (void *)v3[18];
      id v27 = v17;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      uint64_t v20 = [v18 sortedArrayUsingDescriptors:v19];
      v21 = (void *)v3[18];
      v3[18] = v20;
    }
    objc_msgSend(v3, "reloadScheduledPayments", (void)v23);
    uint64_t v22 = *(void *)(a1 + 48);
    if (v22) {
      (*(void (**)(void))(v22 + 16))();
    }
  }
}

BOOL __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 scheduleDetails];
  BOOL v3 = [v2 frequency] != 1;

  return v3;
}

- (unint64_t)_accountServiceScheduledPaymentsRowTypeForRowIndex:(int64_t)a3 sectionIdentifier:(id)a4
{
  recurringPayments = self->_recurringPayments;
  id v7 = a4;
  uint64_t v8 = [(NSArray *)recurringPayments count];
  int64_t v9 = [(NSArray *)self->_scheduledPayments count];
  int v10 = PKEqualObjects();

  if (!v10) {
    return 3;
  }
  int64_t v11 = a3 - v8;
  if (a3 - v8 < v9) {
    return v11 >= 0;
  }
  if (v11 == v9 && v8 == 0 && !self->_loadingPayments) {
    return 2;
  }
  else {
    return 3;
  }
}

- (NSArray)recurringPayments
{
  return self->_recurringPayments;
}

- (NSArray)scheduledPayments
{
  return self->_scheduledPayments;
}

- (PKPassDetailScheduledPaymentsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassDetailScheduledPaymentsSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduledPayments, 0);
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_dueTimeFormatter, 0);
  objc_storeStrong((id *)&self->_dueDateFormatter, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end