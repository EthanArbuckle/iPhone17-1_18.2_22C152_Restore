@interface PKPassShareAdvancedEntitlementSelectionSectionController
- (PKPassShareAdvancedEntitlementSelectionSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5;
- (id)decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)footerAttributedStringForIdentifier:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
@end

@implementation PKPassShareAdvancedEntitlementSelectionSectionController

- (PKPassShareAdvancedEntitlementSelectionSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v24[0] = @"AdvancedEntitlementSelection";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareAdvancedEntitlementSelectionSectionController;
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
    v19 = __102__PKPassShareAdvancedEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v20 = &unk_1E59CBB38;
    objc_copyWeak(&v21, &location);
    v15 = [v13 registrationWithCellClass:v14 configurationHandler:&v17];
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v15, v17, v18, v19, v20);

    [(PKPassShareAdvancedEntitlementSelectionSectionController *)v12 reloadItemsAnimated:0];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __102__PKPassShareAdvancedEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = @"AdvancedEntitlementSelection";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(PKPaymentSetupListSectionController *)self setIdentifiers:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"SelectAdvanced"];
  id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gearshape.2.fill" withConfiguration:0];
  [(PKSharePreviewRowItem *)v7 setIcon:v8];

  id v9 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewP_3.isa);
  [(PKSharePreviewRowItem *)v7 setTitle:v9];

  [(PKSharePreviewRowItem *)v7 setDisplayChevron:1];
  [v6 addObject:v7];
  [(PKPaymentSetupListSectionController *)self setItems:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:v3];
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  id v8 = [v6 title];
  [v7 setText:v8];

  id v9 = [v6 subtitle];
  [v7 setSecondaryText:v9];

  id v10 = [v7 secondaryTextProperties];
  v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setColor:v11];

  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  v12 = [v6 icon];

  if (v12)
  {
    v13 = [v6 icon];
    [v7 setImage:v13];

    uint64_t v14 = [v7 imageProperties];
    v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v14 setTintColor:v15];
  }
  [v5 setContentConfiguration:v7];
  [v5 setConfigurationUpdateHandler:&__block_literal_global_221];
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

void __88__PKPassShareAdvancedEntitlementSelectionSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewP_4.isa);
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v10[0] = *MEMORY[0x1E4FB06F8];
  id v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27C0]);
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E4FB0700];
  id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = (void *)[v4 initWithString:v3 attributes:v7];

  return v8;
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didTapAdvancedEntitlementSelectionSectionController:self];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  [v6 deselectCells];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end