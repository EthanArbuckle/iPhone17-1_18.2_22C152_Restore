@interface PKPassSharePredefinedEntitlementSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPassSharePredefinedEntitlementSectionController)init;
- (PKPassSharePredefinedEntitlementSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5;
- (PKPassSharePredefinedEntitlementSectionControllerDelegate)delegate;
- (id)decorateListCell:(id)a3 forPredefinedSelectionEntry:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_selectionDidChange;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPassSharePredefinedEntitlementSectionController

- (PKPassSharePredefinedEntitlementSectionController)init
{
  return 0;
}

- (PKPassSharePredefinedEntitlementSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPassSharePredefinedEntitlementSectionController;
  v11 = [(PKPassShareSectionController *)&v23 initWithIdentifiers:&unk_1EF2B9FF0];
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_entitlementComposer, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_initWeak(&location, v12);
    v13 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v14 = objc_opt_class();
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __95__PKPassSharePredefinedEntitlementSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v20 = &unk_1E59CBB38;
    objc_copyWeak(&v21, &location);
    v15 = [v13 registrationWithCellClass:v14 configurationHandler:&v17];
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v15, v17, v18, v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __95__PKPassSharePredefinedEntitlementSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forPredefinedSelectionEntry:v6];
  }
}

- (id)decorateListCell:(id)a3 forPredefinedSelectionEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 predefinedSelection];
  id v9 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  id v10 = [v8 localizedTitle];
  [v9 setText:v10];

  if (self->_mode) {
    [v8 localizedPostshareDescription];
  }
  else {
  v11 = [v8 localizedPreshareDescription];
  }
  [v9 setSecondaryText:v11];

  v12 = [v9 secondaryTextProperties];
  v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v12 setColor:v13];

  objc_msgSend(v9, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  uint64_t v14 = [v8 iconName];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = [v8 iconName];
    uint64_t v17 = [v15 systemImageNamed:v16];
    [v9 setImage:v17];
  }
  [v6 setContentConfiguration:v9];
  [v6 setConfigurationUpdateHandler:&__block_literal_global_92];
  if (!self->_mode)
  {
    uint64_t v18 = [(PKPassEntitlementsComposer *)self->_entitlementComposer viewForPredefined:v7];
    int v19 = [v18 enabled];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    [v21 setReservedLayoutWidth:*MEMORY[0x1E4FB2750]];
    [v21 setHidden:v19 ^ 1u];
    [v20 addObject:v21];

    v22 = (void *)[v20 copy];
    [v6 setAccessories:v22];
  }

  return v9;
}

void __98__PKPassSharePredefinedEntitlementSectionController_decorateListCell_forPredefinedSelectionEntry___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)didSelectItem:(id)a3
{
  id v8 = a3;
  if ([(PKPassEntitlementsComposer *)self->_entitlementComposer editable])
  {
    v4 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
    [v4 setEnabled:0];

    id v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
    [v5 setIsManagingEntitlementConfiguration:1];

    id v6 = [(PKPassEntitlementsComposer *)self->_entitlementComposer viewForPredefined:v8];
    objc_msgSend(v6, "setEnabled:", objc_msgSend(v6, "enabled") ^ 1);
    [(PKPassSharePredefinedEntitlementSectionController *)self _selectionDidChange];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectCells];
  }
}

- (void)_selectionDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(PKPassEntitlementsComposer *)self->_entitlementComposer predefinedEntitlementEntries];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained reloadItem:v8 animated:1];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  [v10 entitlementSelectionDidChange];
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewP.isa);
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v10[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v5 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E4FB0700];
  uint64_t v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v8 = (void *)[v4 initWithString:v3 attributes:v7];

  return v8;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return [(PKPassEntitlementsComposer *)self->_entitlementComposer editable];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  entitlementComposer = self->_entitlementComposer;
  if (self->_mode)
  {
    uint64_t v7 = [(PKPassEntitlementsComposer *)entitlementComposer activePredefinedSelectionEntry];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      v11[0] = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v5 appendItems:v9];
    }
  }
  else
  {
    uint64_t v8 = [(PKPassEntitlementsComposer *)entitlementComposer predefinedEntitlementEntries];
    if ([v8 count]) {
      [v5 appendItems:v8];
    }
  }

  return v5;
}

- (PKPassSharePredefinedEntitlementSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassSharePredefinedEntitlementSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end