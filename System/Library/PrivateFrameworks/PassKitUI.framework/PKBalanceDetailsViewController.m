@interface PKBalanceDetailsViewController
- (BOOL)_shouldDisplayAction;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKBalanceDetailsViewController)initWithBalance:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 associatedAction:(id)a6 paymentDataProvider:(id)a7 webService:(id)a8 style:(int64_t)a9;
- (PKBalanceDetailsViewController)initWithBalance:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 balanceName:(id)a6 currencyCode:(id)a7 associatedAction:(id)a8 paymentDataProvider:(id)a9 webService:(id)a10 style:(int64_t)a11;
- (PKBalanceDetailsViewController)initWithTransitPassProperties:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 associatedAction:(id)a6 paymentDataProvider:(id)a7 webService:(id)a8 style:(int64_t)a9;
- (PKBalanceDetailsViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_numberOfBalanceDetailsRowsEnabled;
- (int64_t)_numberOfBalanceDetailsRowsEnabledForRowType:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_balanceDetailsRowTypeForRowIndex:(int64_t)a3;
- (void)_handleActionSelected;
- (void)_handleReminderAmountChanged:(id)a3;
- (void)_initializeReminderAmounts:(id)a3;
- (void)dealloc;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidCompleteAutoReload:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKBalanceDetailsViewController

- (PKBalanceDetailsViewController)initWithBalance:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 balanceName:(id)a6 currencyCode:(id)a7 associatedAction:(id)a8 paymentDataProvider:(id)a9 webService:(id)a10 style:(int64_t)a11
{
  id v17 = a3;
  id v30 = a4;
  id v18 = a5;
  id v29 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v21 = [v19 type];
  if ((!v19 || v21 == 1 || v21 == 6) && self->_shouldShowReminderSettings)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKBalanceDetailsViewController;
    v22 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v31, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", a11 != 1), 2);
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_currentBalance, a3);
      objc_storeStrong((id *)&v23->_pass, a4);
      objc_storeStrong((id *)&v23->_action, a8);
      objc_storeStrong((id *)&v23->_paymentDataProvider, a9);
      v23->_style = a11;
      objc_storeStrong((id *)&v23->_currencyCode, a7);
      [(PKBalanceDetailsViewController *)v23 _initializeReminderAmounts:v18];
      if (objc_opt_respondsToSelector()) {
        [(PKPaymentDataProvider *)v23->_paymentDataProvider addDelegate:v23];
      }
      v24 = [(PKBalanceDetailsViewController *)v23 navigationItem];
      objc_msgSend(v24, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v24, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
      v25 = PKLocalizedPaymentString(&cfstr_BalanceDetailB.isa);
      [v24 setTitle:v25];
    }
    self = v23;
    v26 = self;
  }
  else
  {
    v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Got invalid action type", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

- (PKBalanceDetailsViewController)initWithTransitPassProperties:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 associatedAction:(id)a6 paymentDataProvider:(id)a7 webService:(id)a8 style:(int64_t)a9
{
  id v28 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = PKLocalizedPaymentString(&cfstr_LowBalanceRemi.isa);
  uint64_t v21 = [v19 balanceAmount];
  v22 = [v21 currency];

  v23 = [v19 balance];

  v24 = PKCurrencyAmountCreate(v23, v22);
  v25 = [v24 formattedStringValue];

  self->_shouldShowReminderSettings = 1;
  v26 = [(PKBalanceDetailsViewController *)self initWithBalance:v25 forPass:v18 balanceReminder:v17 balanceName:v20 currencyCode:v22 associatedAction:v16 paymentDataProvider:v15 webService:v28 style:a9];

  return v26;
}

- (PKBalanceDetailsViewController)initWithBalance:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 associatedAction:(id)a6 paymentDataProvider:(id)a7 webService:(id)a8 style:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  if (v16)
  {
    id obj = a3;
    self->_isPostPaidPass = 0;
    id v18 = a8;
    id v19 = a7;
    id v20 = a6;
    id v21 = a5;
    BOOL v22 = ![v17 isAutoTopUpBalance:v16]
       || ![v17 isAutoTopEnabled]
       || self->_isPostPaidPass;
    self->_shouldShowReminderSettings = v22;
    v23 = [v16 formattedValue];
    v24 = [v16 localizedTitle];
    v25 = [v16 currencyCode];
    v26 = [(PKBalanceDetailsViewController *)self initWithBalance:v23 forPass:v17 balanceReminder:v21 balanceName:v24 currencyCode:v25 associatedAction:v20 paymentDataProvider:v19 webService:v18 style:a9];

    if (v26) {
      objc_storeStrong((id *)&v26->_balance, obj);
    }
    self = v26;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentDataProvider *)self->_paymentDataProvider removeDelegate:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKBalanceDetailsViewController;
  [(PKSectionTableViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKBalanceDetailsViewController;
  [(PKBalanceDetailsViewController *)&v8 viewWillAppear:a3];
  if (self->_style == 1)
  {
    v4 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v4, self);

    v5 = [(PKBalanceDetailsViewController *)self tableView];
    v6 = PKBridgeAppearanceGetAppearanceSpecifier();
    v7 = [v6 tintColor];
    [v5 setTintColor:v7];
  }
}

- (void)_initializeReminderAmounts:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  action = self->_action;
  id v5 = a3;
  v6 = [(PKPaymentPassAction *)action enteredValueItem];
  v7 = [v6 lowBalanceReminderOptions];
  reminderAmounts = self->_reminderAmounts;
  self->_reminderAmounts = v7;

  if ([(NSArray *)self->_reminderAmounts count]
    || ![(PKPaymentPass *)self->_pass needsHardcodedReminderOptions])
  {
    goto LABEL_8;
  }
  if ([(PKPaymentPass *)self->_pass isSuicaPass])
  {
    v9 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:200 exponent:0 isNegative:0];
    v23[0] = v9;
    v10 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:500 exponent:0 isNegative:0];
    v23[1] = v10;
    v11 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:1000 exponent:0 isNegative:0];
    v23[2] = v11;
    v12 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:2000 exponent:0 isNegative:0];
    v23[3] = v12;
    v13 = v23;
  }
  else
  {
    if (![(PKPaymentPass *)self->_pass isChinaTransitCredential]) {
      goto LABEL_8;
    }
    v9 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:5 exponent:0 isNegative:0];
    v22[0] = v9;
    v10 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:10 exponent:0 isNegative:0];
    v22[1] = v10;
    v11 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:15 exponent:0 isNegative:0];
    v22[2] = v11;
    v12 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:20 exponent:0 isNegative:0];
    v22[3] = v12;
    v13 = v22;
  }
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  id v15 = self->_reminderAmounts;
  self->_reminderAmounts = v14;

LABEL_8:
  id v16 = [(NSArray *)self->_reminderAmounts sortedArrayUsingComparator:&__block_literal_global_222];
  id v17 = self->_reminderAmounts;
  self->_reminderAmounts = v16;

  id v18 = self->_reminderAmounts;
  id v19 = [v5 threshold];

  uint64_t v20 = [(NSArray *)v18 indexOfObject:v19];
  if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v21 = 0;
  }
  else {
    unint64_t v21 = v20 + 1;
  }
  self->_selectedReminderAmountIndex = v21;
}

uint64_t __61__PKBalanceDetailsViewController__initializeReminderAmounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_handleReminderAmountChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  if (v5 != self->_selectedReminderAmountIndex)
  {
    v6 = (void *)v5;
    if (v5)
    {
      v7 = [(NSArray *)self->_reminderAmounts objectAtIndexedSubscript:v5 - 1];
    }
    else
    {
      v7 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F84A48]) initWithThreshold:v7 isEnabled:v6 != 0];
      objc_initWeak(&location, self);
      paymentDataProvider = self->_paymentDataProvider;
      balance = self->_balance;
      pass = self->_pass;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke;
      id v17 = &unk_1E59DEA18;
      objc_copyWeak(v19, &location);
      v19[1] = v6;
      id v18 = v4;
      [(PKPaymentDataProvider *)paymentDataProvider setBalanceReminder:v8 forBalance:balance pass:pass completion:&v14];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = WeakRetained;
      if (WeakRetained) {
        objc_msgSend(WeakRetained, "balanceDetailsViewController:didUpdateBalanceReminder:forBalance:", self, v8, self->_balance, v14, v15, v16, v17);
      }

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
}

void __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke(id *a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke_2;
    block[3] = &unk_1E59CFBA8;
    objc_copyWeak(v5, a1 + 5);
    v5[1] = a1[6];
    id v4 = a1[4];
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v5);
  }
}

void __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[145] != *(void *)(a1 + 48))
  {
    v7 = WeakRetained;
    objc_super v3 = [WeakRetained tableView];
    id v4 = [v3 cellForRowAtIndexPath:*(void *)(a1 + 32)];
    [v4 setAccessoryType:3];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v7[145], objc_msgSend(*(id *)(a1 + 32), "section"));
    v6 = [v3 cellForRowAtIndexPath:v5];

    [v6 setAccessoryType:0];
    v7[145] = *(void *)(a1 + 48);

    id WeakRetained = v7;
  }
}

- (void)_handleActionSelected
{
  id v7 = 0;
  uint64_t v8 = 0;
  char v3 = [(PKPaymentPass *)self->_pass canPerformAction:self->_action unableReason:&v8 displayableError:&v7];
  id v4 = v7;
  if ((v3 & 1) != 0 || v8 == 2)
  {
    uint64_t v5 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:self->_action paymentDataProvider:self->_paymentDataProvider];
    [(PKPerformActionViewController *)v5 setDelegate:self];
    [(PKPerformActionViewController *)v5 setWebService:self->_webService];
    v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
    [(PKNavigationController *)v6 setSupportedInterfaceOrientations:2];
    [(PKBalanceDetailsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    uint64_t v5 = +[PKPerformActionViewController alertControllerForUnableReason:v8 action:self->_action displayableError:v4 addCardActionHandler:0];
    [(PKBalanceDetailsViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (self->_shouldShowReminderSettings)
      {
        NSUInteger v4 = [(NSArray *)self->_reminderAmounts count];
        if (v4) {
          LOBYTE(v4) = [(PKPaymentDataProvider *)self->_paymentDataProvider apiVersion] > 1;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKBalanceDetailsViewController;
  [(PKBalanceDetailsViewController *)&v5 viewWillLayoutSubviews];
  char v3 = [(PKBalanceDetailsViewController *)self tableView];
  NSUInteger v4 = [(PKBalanceDetailsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKBalanceDetailsViewController *)self view];
  [v3 setNeedsLayout];
}

- (unint64_t)_balanceDetailsRowTypeForRowIndex:(int64_t)a3
{
  char v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  do
  {
    unint64_t v8 = v6;
    v7 += [(PKBalanceDetailsViewController *)self _numberOfBalanceDetailsRowsEnabledForRowType:v6];
    if (v5) {
      break;
    }
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while (v7 <= a3);
  if (v7 <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

- (int64_t)_numberOfBalanceDetailsRowsEnabled
{
  if ([(PKBalanceDetailsViewController *)self _shouldDisplayAction]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_numberOfBalanceDetailsRowsEnabledForRowType:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 == 1) {
    return [(PKBalanceDetailsViewController *)self _shouldDisplayAction];
  }
  return 0;
}

- (BOOL)_shouldDisplayAction
{
  if (!self->_action || PKPassbookIsCurrentlyDeletedByUser()) {
    return 0;
  }
  PKPaymentPassActivationState v3 = [(PKPaymentPass *)self->_pass activationState];
  BOOL v4 = [(PKPaymentPassAction *)self->_action type] != 1 || v3 - 1 >= 2;
  if (!v4 || ([(PKPaymentPassAction *)self->_action unavailableActionBehavior] & 2) != 0) {
    return 0;
  }
  if (self->_style != 1) {
    return 1;
  }

  return PKIsAltAccountPairedOrPairing();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 1) {
    return [(NSArray *)self->_reminderAmounts count] + 1;
  }
  if (v5) {
    return 0;
  }

  return [(PKBalanceDetailsViewController *)self _numberOfBalanceDetailsRowsEnabled];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  if (v7)
  {
    unint64_t v8 = v7;
    [v7 setAccessoryType:0];
  }
  else
  {
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"cell"];
  }
  uint64_t v9 = [v6 row];
  uint64_t v10 = [v6 section];

  unint64_t v11 = [(PKSectionTableViewController *)self sectionForIndex:v10];
  if (v11 == 1)
  {
    if (v9 < 1)
    {
      id v18 = PKLocalizedPaymentString(&cfstr_LowBalanceRemi_1.isa);
    }
    else
    {
      uint64_t v15 = [(NSArray *)self->_reminderAmounts objectAtIndexedSubscript:v9 - 1];
      id v16 = PKCurrencyAmountCreate(v15, self->_currencyCode);
      id v17 = [v16 formattedStringValue];

      id v18 = PKLocalizedPaymentString(&cfstr_LowBalanceRemi_0.isa, &stru_1EF1B4C70.isa, v17);
    }
    id v19 = [v8 textLabel];
    [v19 setText:v18];

    uint64_t v20 = [v8 detailTextLabel];
    [v20 setText:0];

    if (v9 == self->_selectedReminderAmountIndex) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 0;
    }
    [v8 setAccessoryType:v21];
    if (self->_style != 1) {
      goto LABEL_27;
    }
    BOOL v22 = [v8 textLabel];
    v23 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v24 = [v23 textColor];
    goto LABEL_20;
  }
  if (v11) {
    goto LABEL_28;
  }
  unint64_t v12 = [(PKBalanceDetailsViewController *)self _balanceDetailsRowTypeForRowIndex:v9];
  if (v12 == 1)
  {
    id v18 = [(PKPaymentPassAction *)self->_action title];
    v25 = [v8 textLabel];
    [v25 setText:v18];

    v26 = [v8 detailTextLabel];
    [v26 setText:0];

    int64_t style = self->_style;
    BOOL v22 = [v8 textLabel];
    if (style != 1)
    {
      v23 = [MEMORY[0x1E4FB1618] systemBlueColor];
      id v29 = v22;
LABEL_25:
      [v29 setTextColor:v23];
      goto LABEL_26;
    }
    v23 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v24 = [v23 buttonTextColor];
LABEL_20:
    id v28 = (void *)v24;
    [v22 setTextColor:v24];

LABEL_26:
LABEL_27:

    goto LABEL_28;
  }
  if (!v12)
  {
    v13 = [v8 textLabel];
    uint64_t v14 = [(PKPaymentBalance *)self->_balance localizedTitle];
    if (v14)
    {
      [v13 setText:v14];
    }
    else
    {
      id v30 = PKLocalizedPaymentString(&cfstr_BalanceDetailB.isa);
      [v13 setText:v30];
    }
    objc_super v31 = [v8 detailTextLabel];
    [v31 setText:self->_currentBalance];

    if (self->_style == 1)
    {
      id v18 = [v8 textLabel];
      BOOL v22 = PKBridgeAppearanceGetAppearanceSpecifier();
      v23 = [v22 textColor];
      id v29 = v18;
      goto LABEL_25;
    }
  }
LABEL_28:
  if (self->_style == 1)
  {
    id v32 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v34 = PKBridgeAppearanceGetAppearanceSpecifier();
    v35 = [v34 tableViewCellHighlightColor];
    [v33 setBackgroundColor:v35];

    [v8 setSelectedBackgroundView:v33];
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]);
  if (v6 == 1)
  {
    BOOL v7 = 1;
  }
  else if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = -[PKBalanceDetailsViewController _balanceDetailsRowTypeForRowIndex:](self, "_balanceDetailsRowTypeForRowIndex:", [v5 row]) == 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  [a3 deselectRowAtIndexPath:v7 animated:1];
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v6 == 1)
  {
    [(PKBalanceDetailsViewController *)self _handleReminderAmountChanged:v7];
  }
  else if (!v6 {
         && -[PKBalanceDetailsViewController _balanceDetailsRowTypeForRowIndex:](self, "_balanceDetailsRowTypeForRowIndex:", [v7 row]) == 1)
  }
  {
    [(PKBalanceDetailsViewController *)self _handleActionSelected];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 1)
  {
    BOOL v4 = PKLocalizedPaymentString(&cfstr_BalanceDetailR.isa);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 1)
  {
    id v7 = @"REMINDERS_SECTION_REMINDER_FOOTER_ONLY";
  }
  else
  {
    if (v5 || self->_style != 1 || !self->_action || (PKIsAltAccountPairedOrPairing() & 1) != 0)
    {
      unint64_t v6 = 0;
      goto LABEL_9;
    }
    if ([(PKPaymentPass *)self->_pass isTransitPass]) {
      id v7 = @"BALANCE_WATCH_TRANSIT_TOP_UP_INSTRUCTION";
    }
    else {
      id v7 = @"BALANCE_WATCH_TOP_UP_INSTRUCTION";
    }
  }
  unint64_t v6 = PKLocalizedPaymentString(&v7->isa);
LABEL_9:

  return v6;
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidCompleteAutoReload:(id)a3
{
  [(PKBalanceDetailsViewController *)self performActionViewControllerDidPerformAction:a3];
  id v5 = [(PKBalanceDetailsViewController *)self navigationController];
  id v4 = (id)[v5 popToRootViewControllerAnimated:1];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKPaymentPass *)self->_pass uniqueID];
  int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    id v19 = v7;
    id v20 = v6;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v16 = [(PKPaymentBalance *)self->_balance identifiers];
          id v17 = [v15 identifiers];
          int v18 = PKEqualObjects();

          if (v18)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __90__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
            block[3] = &unk_1E59CA870;
            void block[4] = self;
            block[5] = v15;
            dispatch_async(MEMORY[0x1E4F14428], block);
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v7 = v19;
    id v6 = v20;
  }
}

void __90__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1088) formattedValue];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1136);
  *(void *)(v3 + 1136) = v2;

  id v5 = [*(id *)(a1 + 32) tableView];
  id v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "sectionForIndex:", 0));
  id v8 = [v5 cellForRowAtIndexPath:v6];

  id v7 = [v8 detailTextLabel];
  [v7 setText:*(void *)(*(void *)(a1 + 32) + 1136)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  int v9 = [(PKPaymentPass *)pass uniqueID];
  int v10 = [v9 isEqualToString:v8];

  if (v10 && !self->_balance)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __101__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) balance];
  uint64_t v3 = [*(id *)(a1 + 40) balanceAmount];
  id v4 = [v3 currency];
  id v5 = PKCurrencyAmountCreate(v2, v4);
  uint64_t v6 = [v5 formattedStringValue];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1136);
  *(void *)(v7 + 1136) = v6;

  int v9 = [*(id *)(a1 + 32) tableView];
  int v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "sectionForIndex:", 0));
  id v12 = [v9 cellForRowAtIndexPath:v10];

  uint64_t v11 = [v12 detailTextLabel];
  [v11 setText:*(void *)(*(void *)(a1 + 32) + 1136)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  pass = self->_pass;
  id v11 = a3;
  id v12 = [(PKPaymentPass *)pass uniqueID];
  LOBYTE(pass) = [v12 isEqualToString:v11];

  if (pass)
  {
    uint64_t v13 = [(PKPaymentBalance *)self->_balance identifiers];
    int v14 = [v13 containsObject:v9];

    if (v14)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __116__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
      v15[3] = &unk_1E59CA870;
      v15[4] = self;
      id v16 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
  else
  {
  }
}

void __116__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1152);
  uint64_t v3 = [*(id *)(a1 + 40) threshold];
  uint64_t v4 = [v2 indexOfObject:v3];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4 + 1;
  }
  *(void *)(*(void *)(a1 + 32) + 1160) = v5;
  id v7 = [*(id *)(a1 + 32) tableView];
  uint64_t v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
  [v7 reloadSections:v6 withRowAnimation:5];
}

- (PKBalanceDetailsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKBalanceDetailsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reminderAmounts, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_balance, 0);
}

@end