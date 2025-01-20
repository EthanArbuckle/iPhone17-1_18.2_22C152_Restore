@interface PKPassEntitlementTimeSectionController
- (PKPassEntitlementTimeSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5;
- (id)_summaryForTimeConfiguration:(id)a3 isUsingAdvancedSchedules:(BOOL)a4;
- (id)decorateListCell:(id)a3 forRowItem:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
@end

@implementation PKPassEntitlementTimeSectionController

- (PKPassEntitlementTimeSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v24[0] = @"EntitlementTimeSectionController";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v23.receiver = self;
  v23.super_class = (Class)PKPassEntitlementTimeSectionController;
  v12 = [(PKPassShareSectionController *)&v23 initWithIdentifiers:v11];

  if (v12)
  {
    v12->_mode = a3;
    objc_storeStrong((id *)&v12->_entitlementComposer, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_initWeak(&location, v12);
    v13 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v14 = objc_opt_class();
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __84__PKPassEntitlementTimeSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v20 = &unk_1E59CBB38;
    objc_copyWeak(&v21, &location);
    v15 = [v13 registrationWithCellClass:v14 configurationHandler:&v17];
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v15, v17, v18, v19, v20);

    [(PKPassEntitlementTimeSectionController *)v12 reloadItemsAnimated:0];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __84__PKPassEntitlementTimeSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forRowItem:v6];
  }
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
  id v6 = [v5 timeConfiguration];
  uint64_t v7 = [v5 isManagingTimeConfiguration] ^ 1;
  if (v6 && ![v6 isEmpty]) {
    char v8 = 1;
  }
  else {
    char v8 = v7;
  }
  char v9 = [(PKPassEntitlementsComposer *)self->_entitlementComposer editable];
  id v10 = [v5 possibleTimeConfiguration];

  if (v10) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  if (v8 & 1) != 0 || (v11)
  {
    v20[0] = @"EntitlementTimeSectionController";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(PKPaymentSetupListSectionController *)self setIdentifiers:v13];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"CalendarRow"];
    v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar" withConfiguration:0];
    [(PKSharePreviewRowItem *)v15 setIcon:v16];

    uint64_t v17 = PKLocalizedShareableCredentialString(&cfstr_ShareSchedules.isa);
    [(PKSharePreviewRowItem *)v15 setTitle:v17];

    uint64_t v18 = [(PKPassEntitlementTimeSectionController *)self _summaryForTimeConfiguration:v6 isUsingAdvancedSchedules:v7];
    [(PKSharePreviewRowItem *)v15 setSubtitle:v18];
    [(PKSharePreviewRowItem *)v15 setDisplayChevron:1];
    [v14 addObject:v15];
    [(PKPaymentSetupListSectionController *)self setItems:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadDataAnimated:v3];
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    [(PKPaymentSetupListSectionController *)self setItems:MEMORY[0x1E4F1CBF0]];
    [(PKPaymentSetupListSectionController *)self setIdentifiers:v12];
  }
}

- (id)_summaryForTimeConfiguration:(id)a3 isUsingAdvancedSchedules:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    uint64_t v7 = @"SHARE_SCHEDULES_LIMIT_ADVANCED";
  }
  else if (v5 && ![v5 isEmpty])
  {
    uint64_t v7 = @"SHARE_SCHEDULES_LIMIT_RESTRICTED";
  }
  else
  {
    uint64_t v7 = @"SHARE_SCHEDULES_LIMIT_NONE";
  }
  char v8 = PKLocalizedShareableCredentialString(&v7->isa);

  return v8;
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  char v8 = [v6 title];
  [v7 setText:v8];

  char v9 = [v6 subtitle];
  [v7 setSecondaryText:v9];

  id v10 = [v7 secondaryTextProperties];
  char v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setColor:v11];

  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  uint64_t v12 = [v6 icon];

  if (v12)
  {
    v13 = [v6 icon];
    [v7 setImage:v13];

    id v14 = [v7 imageProperties];
    v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v14 setTintColor:v15];
  }
  [v5 setContentConfiguration:v7];
  [v5 setConfigurationUpdateHandler:&__block_literal_global_18];
  if ([v6 displayChevron] && (id v16 = objc_alloc_init(MEMORY[0x1E4FB1518])) != 0)
  {
    uint64_t v17 = v16;
    v20[0] = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v5 setAccessories:v18];
  }
  else
  {
    [v5 setAccessories:MEMORY[0x1E4F1CBF0]];
  }

  return v7;
}

void __70__PKPassEntitlementTimeSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4FB1498];
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
  char v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didTapPassEntitlementTimeSectionController:self];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  [v6 deselectCells];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end