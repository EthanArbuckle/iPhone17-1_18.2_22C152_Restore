@interface PKPayLaterMakePaymentSectionController
- (BOOL)_isItemAvailableToSelect:(unint64_t)a3;
- (PKPayLaterMakePaymentSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 intentDetails:(id)a5 dynamicContentPage:(id)a6 delegate:(id)a7;
- (id)_amountForItemType:(unint64_t)a3;
- (id)_detailFont;
- (id)_detailTextColor;
- (id)_titleFont;
- (id)currentSelectedAmount;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureNextPaymentSection:(id)a3;
- (void)_configurePastDueAmountSection:(id)a3;
- (void)_configureTotalPaymentSection:(id)a3;
- (void)_updateSelectedItem:(unint64_t)a3;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
@end

@implementation PKPayLaterMakePaymentSectionController

- (PKPayLaterMakePaymentSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 intentDetails:(id)a5 dynamicContentPage:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPayLaterMakePaymentSectionController;
  v16 = [(PKPayLaterSectionController *)&v26 initWithPayLaterAccount:a4 dynamicContentPage:a6 viewControllerDelegate:v15];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_financingPlan, a3);
    objc_storeStrong((id *)&v17->_intentDetails, a5);
    objc_storeWeak((id *)&v17->_delegate, v15);
    uint64_t v18 = 0;
    if ([(PKPayLaterMakePaymentSectionController *)v17 _isItemAvailableToSelect:0]
      || (uint64_t v18 = 1,
          [(PKPayLaterMakePaymentSectionController *)v17 _isItemAvailableToSelect:1])
      || (uint64_t v18 = 2,
          [(PKPayLaterMakePaymentSectionController *)v17 _isItemAvailableToSelect:2]))
    {
      v17->_selectedItem = v18;
    }
    v19 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v17->_numberFormatter;
    v17->_numberFormatter = v19;

    [(NSNumberFormatter *)v17->_numberFormatter setNumberStyle:1];
    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    mediumDateFormatter = v17->_mediumDateFormatter;
    v17->_mediumDateFormatter = v21;

    v23 = v17->_mediumDateFormatter;
    v24 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v23 setCalendar:v24];

    [(NSDateFormatter *)v17->_mediumDateFormatter setDateStyle:2];
    [(NSDateFormatter *)v17->_mediumDateFormatter setTimeStyle:0];
  }

  return v17;
}

- (id)currentSelectedAmount
{
  return [(PKPayLaterMakePaymentSectionController *)self _amountForItemType:self->_selectedItem];
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKPayLaterMakePaymentSectionController *)self _isItemAvailableToSelect:0]) {
    [v3 addObject:@"kNextPaymentSection"];
  }
  if ([(PKPayLaterMakePaymentSectionController *)self _isItemAvailableToSelect:1]) {
    [v3 addObject:@"kPastDueAmountSection"];
  }
  if ([(PKPayLaterMakePaymentSectionController *)self _isItemAvailableToSelect:2]) {
    [v3 addObject:@"kTotalPaymentSection"];
  }
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kNextPaymentSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kNextPaymentSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterMakePaymentSectionController *)self _configureNextPaymentSection:v6];
  }
  else
  {
    v11 = v8;
    if (v11 == @"kPastDueAmountSection"
      || (v12 = v11, int v13 = [@"kPastDueAmountSection" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterMakePaymentSectionController *)self _configurePastDueAmountSection:v6];
    }
    else
    {
      id v14 = v12;
      if (v14 == @"kTotalPaymentSection"
        || (id v15 = v14, v16 = [@"kTotalPaymentSection" isEqualToString:v14],
                       v15,
                       v16))
      {
        [(PKPayLaterMakePaymentSectionController *)self _configureTotalPaymentSection:v6];
      }
    }
  }
LABEL_5:

  return v6;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMakePaymentSectionController;
  id v5 = a3;
  [(PKPayLaterSectionController *)&v6 configureCellForRegistration:v5 item:a4];
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"kTotalPaymentSection"
    || v4 && (int v6 = [@"kTotalPaymentSection" isEqualToString:v4], v5, v6))
  {
    [(PKPayLaterFinancingPlan *)self->_financingPlan productType];
  }

  return 0;
}

- (void)_configurePastDueAmountSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v6 = [(PKPayLaterMakePaymentSectionController *)self _amountForItemType:1];
  v7 = [v6 formattedStringValue];

  unint64_t selectedItem = self->_selectedItem;
  objc_initWeak(&location, self);
  int v9 = [PKPayLaterTitleDetailValueRow alloc];
  if (selectedItem == 1) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __73__PKPayLaterMakePaymentSectionController__configurePastDueAmountSection___block_invoke;
  uint64_t v18 = &unk_1E59CA7F8;
  objc_copyWeak(&v19, &location);
  v11 = [(PKPayLaterTitleDetailValueRow *)v9 initWithTitle:@"Past Due Amount" detail:@"Pay the total amount past due" value:v7 accessory:v10 selectionHandler:&v15];
  v12 = [(PKPayLaterMakePaymentSectionController *)self _titleFont];
  [(PKPayLaterTitleDetailValueRow *)v11 setTitleFont:v12];

  int v13 = [(PKPayLaterMakePaymentSectionController *)self _detailFont];
  [(PKPayLaterTitleDetailValueRow *)v11 setDetailFont:v13];

  [v5 safelyAddObject:v11];
  id v14 = (void *)[v5 copy];
  [v4 appendItems:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __73__PKPayLaterMakePaymentSectionController__configurePastDueAmountSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateSelectedItem:1];
    id WeakRetained = v2;
  }
}

- (void)_configureNextPaymentSection:(id)a3
{
  id v27 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  int v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  objc_super v26 = v5;
  v7 = [v5 nextDueInstallment];
  v8 = [(PKPayLaterMakePaymentSectionController *)self _amountForItemType:0];
  v28 = [v8 formattedStringValue];

  mediumDateFormatter = self->_mediumDateFormatter;
  v24 = v7;
  uint64_t v10 = [v7 dueDate];
  v11 = [(NSDateFormatter *)mediumDateFormatter stringFromDate:v10];

  v25 = v6;
  if ([v6 isNextInstallmentPastDue]) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v12 = [(PKPayLaterMakePaymentSectionController *)self _detailTextColor];
  }
  int v13 = [(PKPayLaterMakePaymentSectionController *)self _detailFont];
  if (self->_selectedItem) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 2;
  }
  uint64_t v15 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  int v16 = [v15 autoPayment];

  if (v16) {
    v17 = @"INSTALLMENT_DUE_DATE_AUTO_PAY";
  }
  else {
    v17 = @"INSTALLMENT_DUE_DATE";
  }
  uint64_t v18 = PKLocalizedCocoonString(&v17->isa, &stru_1EF1B4C70.isa, v11);
  objc_initWeak(&location, self);
  id v19 = [PKPayLaterTitleDetailValueRow alloc];
  v20 = PKLocalizedCocoonString(&cfstr_MakePaymentNex.isa);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__PKPayLaterMakePaymentSectionController__configureNextPaymentSection___block_invoke;
  v29[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v30, &location);
  v21 = [(PKPayLaterTitleDetailValueRow *)v19 initWithTitle:v20 detail:v18 value:v28 accessory:v14 selectionHandler:v29];

  [(PKPayLaterTitleDetailValueRow *)v21 setDetailIcon:0];
  [(PKPayLaterTitleDetailValueRow *)v21 setDetailColor:v12];
  v22 = [(PKPayLaterMakePaymentSectionController *)self _titleFont];
  [(PKPayLaterTitleDetailValueRow *)v21 setTitleFont:v22];

  [(PKPayLaterTitleDetailValueRow *)v21 setDetailFont:v13];
  [v4 safelyAddObject:v21];
  v23 = (void *)[v4 copy];
  [v27 appendItems:v23];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __71__PKPayLaterMakePaymentSectionController__configureNextPaymentSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateSelectedItem:0];
    id WeakRetained = v2;
  }
}

- (void)_configureTotalPaymentSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v6 = [(PKPayLaterMakePaymentSectionController *)self _amountForItemType:2];
  v7 = [v6 formattedStringValue];

  v8 = PKLocalizedCocoonString(&cfstr_PayRemainingBa.isa);
  if (self->_selectedItem == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  [(PKPayLaterFinancingPlan *)self->_financingPlan productType];
  objc_initWeak(&location, self);
  uint64_t v10 = [PKPayLaterTitleDetailValueRow alloc];
  v11 = PKLocalizedCocoonString(&cfstr_RemainingBalan.isa);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __72__PKPayLaterMakePaymentSectionController__configureTotalPaymentSection___block_invoke;
  v21 = &unk_1E59CA7F8;
  objc_copyWeak(&v22, &location);
  v12 = [(PKPayLaterTitleDetailValueRow *)v10 initWithTitle:v11 detail:v8 value:v7 accessory:v9 selectionHandler:&v18];

  int v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
  -[PKPayLaterTitleDetailValueRow setTitleFont:](v12, "setTitleFont:", v13, v18, v19, v20, v21);

  uint64_t v14 = [(PKPayLaterMakePaymentSectionController *)self _detailTextColor];
  [(PKPayLaterTitleDetailValueRow *)v12 setDetailColor:v14];

  uint64_t v15 = [(PKPayLaterMakePaymentSectionController *)self _titleFont];
  [(PKPayLaterTitleDetailValueRow *)v12 setTitleFont:v15];

  int v16 = [(PKPayLaterMakePaymentSectionController *)self _detailFont];
  [(PKPayLaterTitleDetailValueRow *)v12 setDetailFont:v16];

  [v5 safelyAddObject:v12];
  v17 = (void *)[v5 copy];
  [v4 appendItems:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __72__PKPayLaterMakePaymentSectionController__configureTotalPaymentSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateSelectedItem:2];
    id WeakRetained = v2;
  }
}

- (id)_amountForItemType:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
    v7 = [v4 payoffAmount];
    id v5 = v7;
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      id v6 = [(PKAccountWebServiceFinancingPlanPaymentIntentResponse *)self->_intentDetails payoffAmount];
    }
LABEL_10:
    v8 = v6;

    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_12;
    }
    id v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
    id v5 = [v4 nextDueInstallment];
    id v6 = [v5 currentBalance];
    goto LABEL_10;
  }
  id v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  v8 = [v4 pastDueAmount];
LABEL_11:

LABEL_12:

  return v8;
}

- (void)_updateSelectedItem:(unint64_t)a3
{
  self->_unint64_t selectedItem = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [(PKPayLaterMakePaymentSectionController *)self currentSelectedAmount];
  [WeakRetained sectionController:self didUpdateCurrentSelectedAmount:v5];

  id v6 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v6 reloadDataForSectionIdentifier:@"kNextPaymentSection" animated:1];

  id v7 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v7 reloadDataForSectionIdentifier:@"kTotalPaymentSection" animated:1];
}

- (BOOL)_isItemAvailableToSelect:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      id v5 = -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:");
      uint64_t v6 = 0;
      if ([(PKPayLaterMakePaymentSectionController *)self _isItemAvailableToSelect:0]
        || (uint64_t v6 = 1,
            [(PKPayLaterMakePaymentSectionController *)self _isItemAvailableToSelect:1]))
      {
        id v7 = [(PKPayLaterMakePaymentSectionController *)self _amountForItemType:v6];
        v8 = v7;
        char v3 = v5 != 0;
        if (v7 && v5) {
          char v3 = [v7 currencyAmountEqualToCurrencyAmount:v5] ^ 1;
        }
      }
      else
      {
        v8 = 0;
        char v3 = v5 != 0;
      }

      break;
    case 1uLL:
      char v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan state] == 4;
      break;
    case 0uLL:
      if ([(PKPayLaterFinancingPlan *)self->_financingPlan state] == 4)
      {
        char v3 = 0;
      }
      else
      {
        uint64_t v9 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
        uint64_t v10 = [v9 nextDueInstallment];
        char v3 = v10 != 0;
      }
      break;
  }
  return v3 & 1;
}

- (id)_detailTextColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (id)_titleFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
}

- (id)_detailFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_mediumDateFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end