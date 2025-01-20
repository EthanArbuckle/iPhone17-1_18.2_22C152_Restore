@interface PKPeerPaymentRecurringPaymentDetailSectionController
- (BOOL)hideAmount;
- (BOOL)isEditable;
- (BOOL)shouldHighlightItem:(id)a3;
- (NSArray)frequencyOptions;
- (NSDate)startDate;
- (PKCurrencyAmount)amount;
- (PKPeerPaymentRecurringPaymentDetailSectionController)initWithRecurringPayment:(id)a3 productTimeZone:(id)a4 mode:(unint64_t)a5 delegate:(id)a6;
- (PKPeerPaymentRecurringPaymentDetailSectionControllerDelegate)delegate;
- (UIColor)titleColor;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (unint64_t)frequency;
- (unint64_t)status;
- (void)_decorateAmountListCell:(id)a3 forItem:(id)a4;
- (void)_decorateDateListCell:(id)a3 forItem:(id)a4;
- (void)_decorateDateSelectorListCell:(id)a3 forItem:(id)a4;
- (void)_handleFrequencyChanged:(unint64_t)a3;
- (void)_toggleShowStartDateSelector;
- (void)amountDidChange:(id)a3;
- (void)dateSelectorCollectionViewCell:(id)a3 didUpdateDate:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
- (void)setFrequencyOptions:(id)a3;
- (void)setHideAmount:(BOOL)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTitleColor:(id)a3;
- (void)updateWithRecurringPayment:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentDetailSectionController

- (PKPeerPaymentRecurringPaymentDetailSectionController)initWithRecurringPayment:(id)a3 productTimeZone:(id)a4 mode:(unint64_t)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentRecurringPaymentDetailSectionController;
  v13 = [(PKPeerPaymentRecurringPaymentDetailSectionController *)&v21 init];
  v14 = v13;
  if (v13)
  {
    v13->_showStartDateSelector = 0;
    id v15 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v16 = [v15 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    productCalendar = v14->_productCalendar;
    v14->_productCalendar = (NSCalendar *)v16;

    [(NSCalendar *)v14->_productCalendar setTimeZone:v11];
    v14->_mode = a5;
    objc_storeWeak((id *)&v14->_delegate, v12);
    uint64_t v18 = [MEMORY[0x1E4FB1618] labelColor];
    titleColor = v14->_titleColor;
    v14->_titleColor = (UIColor *)v18;

    [(PKPeerPaymentRecurringPaymentDetailSectionController *)v14 updateWithRecurringPayment:v10];
  }

  return v14;
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!self->_hideAmount)
  {
    v6 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)[PKPeerPaymentRecurringPaymentAmountDetailRowItem alloc] initWithIdentifier:@"amount" isEditable:self->_isEditable titleColor:self->_titleColor];
    v7 = PKLocalizedPeerPaymentRecurringString(&cfstr_DetailsAmount.isa);
    [(PKPeerPaymentRecurringPaymentAmountDetailRowItem *)v6 setTitle:v7];

    [(PKPeerPaymentRecurringPaymentAmountDetailRowItem *)v6 setCurrencyAmount:self->_amount];
    [v5 addObject:v6];
  }
  unint64_t mode = self->_mode;
  if (mode == 1 || mode == 2 && (self->_status | 2) == 3)
  {
    v9 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)[PKPeerPaymentRecurringPaymentDateDetailRowItem alloc] initWithIdentifier:@"startDate" isEditable:self->_isEditable titleColor:self->_titleColor];
    [(PKPeerPaymentRecurringPaymentDateDetailRowItem *)v9 setTitle:self->_startDateTitle];
    [(PKPeerPaymentRecurringPaymentDateDetailRowItem *)v9 setDate:self->_startDate];
    [(PKPeerPaymentRecurringPaymentDateDetailRowItem *)v9 setIsSelected:self->_showStartDateSelector];
    [v5 addObject:v9];
    if (self->_showStartDateSelector)
    {
      id v10 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)[PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem alloc] initWithIdentifier:@"startDateSelector" isEditable:self->_isEditable titleColor:self->_titleColor];
      [(PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *)v10 setDate:self->_startDate];
      if ((PKPeerPaymentDisableRecurringDateRestrictions() & 1) == 0)
      {
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v13 = [v12 dateByAddingUnit:4 value:1 toDate:v11 options:0];

        if (self->_mode == 2)
        {
          v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          id v15 = [v14 dateByAddingUnit:16 value:1 toDate:v11 options:0];
        }
        else
        {
          id v15 = v11;
        }
        [(PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *)v10 setMinimumDate:v15];
        [(PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *)v10 setMaximumDate:v13];
      }
      [v5 addObject:v10];
    }
  }
  uint64_t v16 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)[PKPeerPaymentRecurringPaymentFrequencyDetailRowItem alloc] initWithIdentifier:@"frequency" isEditable:self->_isEditable titleColor:self->_titleColor];
  [(PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *)v16 setFrequency:self->_frequency];
  [(PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *)v16 setDate:self->_startDate];
  [v5 addObject:v16];
  v17 = (NSArray *)[v5 copy];
  rowItems = self->_rowItems;
  self->_rowItems = v17;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__PKPeerPaymentRecurringPaymentDetailSectionController_reloadItemsAnimated___block_invoke;
  v19[3] = &unk_1E59CDA78;
  v19[4] = self;
  BOOL v20 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

void __76__PKPeerPaymentRecurringPaymentDetailSectionController_reloadItemsAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  [WeakRetained updateFooterForSectionIdentifier:@"detail"];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  [v3 reloadDataAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"detail";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_rowItems];

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v6 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke;
    v23[3] = &unk_1E59DB248;
    v7 = &v24;
    objc_copyWeak(&v24, &location);
    uint64_t v8 = [v5 registrationWithCellClass:v6 configurationHandler:v23];
LABEL_9:
    id v15 = (void *)v8;
    objc_destroyWeak(v7);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v10 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_2;
    v21[3] = &unk_1E59DB270;
    v7 = &v22;
    objc_copyWeak(&v22, &location);
    uint64_t v8 = [v9 registrationWithCellClass:v10 configurationHandler:v21];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_3;
    v19[3] = &unk_1E59DB298;
    v7 = &v20;
    objc_copyWeak(&v20, &location);
    uint64_t v8 = [v11 registrationWithCellClass:v12 configurationHandler:v19];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v14 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_4;
    v17[3] = &unk_1E59DB2C0;
    v7 = &v18;
    objc_copyWeak(&v18, &location);
    v17[4] = self;
    uint64_t v8 = [v13 registrationWithCellClass:v14 configurationHandler:v17];
    goto LABEL_9;
  }
  id v15 = 0;
LABEL_10:
  objc_destroyWeak(&location);

  return v15;
}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _decorateAmountListCell:v7 forItem:v6];
}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _decorateDateListCell:v7 forItem:v6];
}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _decorateDateSelectorListCell:v7 forItem:v6];
}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = [v9 date];

    if (v11)
    {
      uint64_t v16 = WeakRetained[15];
      uint64_t v12 = [v9 frequency];
      v13 = [v9 date];
      uint64_t v14 = [v9 isEditable];
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 160);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_5;
      v17[3] = &unk_1E59D7080;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      [v7 configureWithOptions:v16 selectedFrequency:v12 selectedDate:v13 isEditable:v14 titleColor:v15 changeHandler:v17];

      objc_destroyWeak(&v18);
    }
  }
}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = PKPeerPaymentRecurringPaymentFrequencyFromString();

  [WeakRetained _handleFrequencyChanged:v4];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  id v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = [(PKDynamicListSectionController *)self headerText];
  if (v8)
  {
  }
  else
  {
    id v9 = [(PKDynamicListSectionController *)self attributedHeaderText];

    if (!v9) {
      goto LABEL_5;
    }
  }
  [v6 setHeaderMode:1];
LABEL_5:
  uint64_t v10 = [(PKDynamicListSectionController *)self footerText];
  if (v10)
  {
  }
  else
  {
    id v11 = [(PKDynamicListSectionController *)self attributedFooterText];

    if (!v11) {
      goto LABEL_9;
    }
  }
  [v6 setFooterMode:1];
LABEL_9:
  uint64_t v12 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v12;
}

- (void)didSelectItem:(id)a3
{
  uint64_t v4 = [a3 identifier];
  if (v4 == @"startDate"
    || (id v5 = v4) != 0
    && (int v6 = [(__CFString *)v4 isEqualToString:@"startDate"],
        v5,
        v5,
        v6))
  {
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self _toggleShowStartDateSelector];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deselectCells];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  if (self->_isEditable)
  {
    id v3 = [a3 identifier];
    uint64_t v4 = v3;
    if (v3 == @"frequency")
    {
      LOBYTE(v5) = 0;
    }
    else if (v3)
    {
      int v5 = [(__CFString *)v3 isEqualToString:@"frequency"] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setIsEditable:(BOOL)a3
{
  if (self->_isEditable != a3)
  {
    self->_isEditable = a3;
    if (!a3) {
      self->_showStartDateSelector = 0;
    }
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
  }
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
  }
}

- (void)setHideAmount:(BOOL)a3
{
  if (self->_hideAmount != a3)
  {
    self->_hideAmount = a3;
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
  }
}

- (void)setTitleColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_titleColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
  }
}

- (void)updateWithRecurringPayment:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 amount];
  id v5 = [v15 currency];
  PKCurrencyAmountMake();
  int v6 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  amount = self->_amount;
  self->_amount = v6;

  id v8 = [v15 startDate];
  startDate = self->_startDate;
  self->_startDate = v8;

  self->_frequency = [v15 frequency];
  self->_status = [v15 status];
  if (self->_mode == 2) {
    uint64_t v10 = @"DETAILS_NEXT_PAYMENT";
  }
  else {
    uint64_t v10 = @"DETAILS_START_DATE";
  }
  PKLocalizedPeerPaymentRecurringString(&v10->isa);
  id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  startDateTitle = self->_startDateTitle;
  self->_startDateTitle = v11;

  v13 = [v15 upcomingPaymentDates];
  uint64_t v14 = [v13 firstObject];

  if (v14) {
    objc_storeStrong((id *)&self->_startDate, v14);
  }
  [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
}

- (void)_decorateAmountListCell:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 title];
  [v7 setTitle:v8];

  id v9 = [v6 currencyAmount];
  [v7 setCurrencyAmount:v9];

  objc_msgSend(v7, "setIsEditable:", objc_msgSend(v6, "isEditable"));
  [v7 setDelegate:self];
  id v10 = [v6 titleColor];

  [v7 setTitleColor:v10];
}

- (void)_decorateDateListCell:(id)a3 forItem:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  id v9 = [v7 title];
  [v8 setText:v9];

  id v10 = [v8 textProperties];
  id v11 = [MEMORY[0x1E4FB1618] labelColor];
  [v10 setColor:v11];

  uint64_t v12 = [v7 date];
  if ([v7 isEditable])
  {
    uint64_t v23 = 0x401C000000000000;
    int64x2_t v24 = vdupq_n_s64(1uLL);
    int64x2_t v25 = vdupq_n_s64(2uLL);
    v13 = [[PKContinuousButton alloc] initWithConfiguration:&v23];
    uint64_t v14 = v12;
    if (!v12)
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v15 = PKMediumDateString();
    [(PKContinuousButton *)v13 setTitle:v15 forState:0];

    if (v12)
    {
      if ([(NSCalendar *)self->_productCalendar isDateInToday:v12]) {
        PKLocalizedPeerPaymentRecurringString(&cfstr_DetailsStartDa_0.isa);
      }
      else {
      uint64_t v16 = PKMediumDateString();
      }
      [(PKContinuousButton *)v13 setTitle:v16 forState:0];
    }
    else
    {

      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      v17 = PKMediumDateString();
      [(PKContinuousButton *)v13 setTitle:v17 forState:0];
    }
    if ([v7 isSelected]) {
      [MEMORY[0x1E4FB1618] linkColor];
    }
    else {
    id v18 = [MEMORY[0x1E4FB1618] labelColor];
    }
    [(PKContinuousButton *)v13 updateTitleColorWithColor:v18];

    v19 = objc_msgSend(MEMORY[0x1E4FB14D8], "pkui_createPlainButtonConfiguration");
    objc_msgSend(v19, "setContentInsets:", 6.0, 12.0, 6.0, 12.0);
    [v19 setTitleAlignment:2];
    [(PKContinuousButton *)v13 setConfiguration:v19];
    [(PKContinuousButton *)v13 addTarget:self action:sel__didTapDateButton_ forControlEvents:64];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v13 placement:1];
    v26[0] = v20;
    objc_super v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v6 setAccessories:v21];
  }
  else if (v12)
  {
    if ([(NSCalendar *)self->_productCalendar isDateInToday:v12]) {
      PKLocalizedPeerPaymentRecurringString(&cfstr_DetailsStartDa_0.isa);
    }
    else {
    id v22 = PKMediumDateString();
    }
    [v8 setSecondaryText:v22];
    [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
  }
  [v6 setContentConfiguration:v8];
}

- (void)_decorateDateSelectorListCell:(id)a3 forItem:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 date];
  if (v7)
  {
    [v11 setDate:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v11 setDate:v8];
  }
  id v9 = [v6 minimumDate];
  [v11 setMinimumDate:v9];

  id v10 = [v6 maximumDate];

  [v11 setMaximumDate:v10];
  [v11 setDelegate:self];
  [v11 setContentAlignment:*MEMORY[0x1E4F87150]];
}

- (void)_toggleShowStartDateSelector
{
  if (self->_isEditable)
  {
    self->_showStartDateSelector ^= 1u;
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
    if (self->_showStartDateSelector)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__PKPeerPaymentRecurringPaymentDetailSectionController__toggleShowStartDateSelector__block_invoke;
      block[3] = &unk_1E59CA7D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __84__PKPeerPaymentRecurringPaymentDetailSectionController__toggleShowStartDateSelector__block_invoke(uint64_t a1)
{
  id v3 = [[PKPeerPaymentRecurringPaymentDetailRowItem alloc] initWithIdentifier:@"startDateSelector" isEditable:*(unsigned __int8 *)(*(void *)(a1 + 32) + 104) titleColor:*(void *)(*(void *)(a1 + 32) + 160)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
  [WeakRetained makeCellFirstResponderWithItem:v3];
}

- (void)_handleFrequencyChanged:(unint64_t)a3
{
  if (self->_frequency != a3)
  {
    self->_frequency = a3;
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:1];
  }
}

- (void)amountDidChange:(id)a3
{
  id v4 = a3;
  amount = self->_amount;
  id v9 = v4;
  if (amount)
  {
    id v6 = [(PKCurrencyAmount *)amount amount];
    char v7 = objc_msgSend(v6, "pk_isEqualToDecimalNumber:", v9);

    if (v7) {
      goto LABEL_5;
    }
    amount = self->_amount;
    id v4 = v9;
  }
  [(PKCurrencyAmount *)amount setAmount:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained amountDidChange];

LABEL_5:
}

- (void)dateSelectorCollectionViewCell:(id)a3 didUpdateDate:(id)a4
{
  id v6 = (NSDate *)a4;
  if (self->_startDate != v6)
  {
    char v7 = v6;
    objc_storeStrong((id *)&self->_startDate, a4);
    [(PKPeerPaymentRecurringPaymentDetailSectionController *)self reloadItemsAnimated:0];
    id v6 = v7;
  }
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSArray)frequencyOptions
{
  return self->_frequencyOptions;
}

- (void)setFrequencyOptions:(id)a3
{
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)status
{
  return self->_status;
}

- (PKPeerPaymentRecurringPaymentDetailSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentRecurringPaymentDetailSectionControllerDelegate *)WeakRetained;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (BOOL)hideAmount
{
  return self->_hideAmount;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_frequencyOptions, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_startDateTitle, 0);

  objc_storeStrong((id *)&self->_rowItems, 0);
}

@end