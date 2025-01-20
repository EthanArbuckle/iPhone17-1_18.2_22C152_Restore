@interface PKPassShareSelectDateSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPassShareSelectDateSectionController)initWithDate:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 delegate:(id)a6;
- (PKPassShareSelectDateSectionControllerDelegate)delegate;
- (id)cellRegistrationForItem:(id)a3;
- (id)decorateListCell:(id)a3 forScheduleRowItem:(id)a4;
- (void)_setDate:(id)a3;
- (void)_setSelected:(id)a3;
- (void)dateSelectorCollectionViewCell:(id)a3 didUpdateDate:(id)a4;
- (void)decorateCalendarCell:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPassShareSelectDateSectionController

- (PKPassShareSelectDateSectionController)initWithDate:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPassShareSelectDateSectionController;
  v15 = [(PKPassShareSectionController *)&v19 initWithIdentifiers:&unk_1EF2BA020];
  v16 = v15;
  if (v15)
  {
    p_date = &v15->_date;
    objc_storeStrong((id *)&v15->_date, a3);
    objc_storeStrong((id *)&v16->_minimumDate, a4);
    objc_storeStrong((id *)&v16->_maximumDate, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v16->_selected = *p_date != 0;
    [(PKPassShareSelectDateSectionController *)v16 reloadItemsAnimated:0];
  }

  return v16;
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  date = self->_date;
  v6 = [PKPassShareScheduleRowItem alloc];
  v7 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleD.isa);
  v8 = [(PKPassShareScheduleRowItem *)v6 initWithTitle:v7 icon:0];

  [(PKPassShareScheduleRowItem *)v8 setIdentifier:@"StartDateRow"];
  [(PKPassShareScheduleRowItem *)v8 setIsOn:date == 0];
  [v14 addObject:v8];
  v9 = [PKPassShareScheduleRowItem alloc];
  v10 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleO.isa);
  id v11 = [(PKPassShareScheduleRowItem *)v9 initWithTitle:v10 icon:0];

  [(PKPassShareScheduleRowItem *)v11 setIdentifier:@"EndDateRow"];
  [(PKPassShareScheduleRowItem *)v11 setIsOn:date != 0];
  [v14 addObject:v11];
  if (date)
  {
    id v12 = [[PKPassShareScheduleRowItem alloc] initWithTitle:0 icon:0];
    [(PKPassShareScheduleRowItem *)v12 setIdentifier:@"CalendarRow"];
    [v14 addObject:v12];
  }
  [(PKPaymentSetupListSectionController *)self setItems:v14];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:v3];
}

- (void)_setDate:(id)a3
{
  p_date = &self->_date;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didUpdateDate:*p_date];
  }
}

- (void)_setSelected:(id)a3
{
  v4 = [a3 identifier];
  id v7 = v4;
  if (v4 == @"StartDateRow"
    || v4 && (int v5 = [(__CFString *)v4 isEqualToString:@"StartDateRow"], v7, v5))
  {
    [(PKPassShareSelectDateSectionController *)self _setDate:0];
  }
  else if (PKEqualObjects() && !self->_date)
  {
    v6 = [MEMORY[0x1E4F1C9C8] now];
    [(PKPassShareSelectDateSectionController *)self _setDate:v6];
  }
  [(PKPassShareSelectDateSectionController *)self reloadItemsAnimated:1];
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [v4 identifier];
  if (v5 == @"CalendarRow"
    || (v6 = v5) != 0
    && (int v7 = [(__CFString *)v5 isEqualToString:@"CalendarRow"],
        v6,
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v9 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke;
    v18[3] = &unk_1E59D3F00;
    v10 = &v19;
    objc_copyWeak(&v19, &location);
    uint64_t v11 = [v8 registrationWithCellClass:v9 configurationHandler:v18];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v13 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke_2;
    v16[3] = &unk_1E59CBB38;
    v10 = &v17;
    objc_copyWeak(&v17, &location);
    uint64_t v11 = [v12 registrationWithCellClass:v13 configurationHandler:v16];
  }
  id v14 = (void *)v11;
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v14;
}

void __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v4 setDelegate:WeakRetained];
    [WeakRetained decorateCalendarCell:v4];
  }
}

void __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forScheduleRowItem:v6];
  }
}

- (void)didSelectItem:(id)a3
{
  [(PKPassShareSelectDateSectionController *)self _setSelected:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deselectCells];
}

- (void)decorateCalendarCell:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  int v5 = [v4 secondarySystemBackgroundColor];
  [v6 setBackgroundColor:v5];

  [v6 setDate:self->_date];
  [v6 setMinimumDate:self->_minimumDate];
  [v6 setMaximumDate:self->_maximumDate];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return [a3 isOn] ^ 1;
}

- (id)decorateListCell:(id)a3 forScheduleRowItem:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 subtitleCellConfiguration];
  id v9 = [v6 title];
  [v8 setText:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
  [v10 setReservedLayoutWidth:*MEMORY[0x1E4FB2750]];
  char v11 = [v6 isOn];

  if ((v11 & 1) == 0) {
    [v10 setHidden:1];
  }
  v14[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 setAccessories:v12];

  [v7 setConfigurationUpdateHandler:&__block_literal_global_100];
  [v7 setContentConfiguration:v8];

  return v8;
}

void __78__PKPassShareSelectDateSectionController_decorateListCell_forScheduleRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (void)dateSelectorCollectionViewCell:(id)a3 didUpdateDate:(id)a4
{
}

- (PKPassShareSelectDateSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassShareSelectDateSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end