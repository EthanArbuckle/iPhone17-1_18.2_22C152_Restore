@interface PKCombinedSelectActionGroupViewControllerListSectionController
- (PKCombinedSelectActionGroupViewControllerListSectionController)initWithIdentifier:(id)a3 pass:(id)a4 actionGroups:(id)a5;
- (PKCombinedSelectActionGroupViewControllerListSectionControllerDelegate)delegate;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)defaultListLayout;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKCombinedSelectActionGroupViewControllerListSectionController

- (PKCombinedSelectActionGroupViewControllerListSectionController)initWithIdentifier:(id)a3 pass:(id)a4 actionGroups:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKCombinedSelectActionGroupViewControllerListSectionController;
  v11 = [(PKCombinedSelectActionGroupViewControllerListSectionController *)&v34 init];
  if (v11)
  {
    id v27 = v9;
    v36[0] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [(PKDynamicListSectionController *)v11 setIdentifiers:v12];

    [(PKDynamicListSectionController *)v11 setHeaderText:@" "];
    objc_storeStrong((id *)&v11->_pass, a4);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[PKPaymentPassActionGroupViewModel alloc] initWithActionGroup:*(void *)(*((void *)&v30 + 1) + 8 * v18)];
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [v13 copy];
    actionGroupViewModels = v11->_actionGroupViewModels;
    v11->_actionGroupViewModels = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v23 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __103__PKCombinedSelectActionGroupViewControllerListSectionController_initWithIdentifier_pass_actionGroups___block_invoke;
    v28[3] = &unk_1E59D5948;
    v24 = v11;
    v29 = v24;
    v25 = [v22 registrationWithCellClass:v23 configurationHandler:v28];
    [(PKCombinedSelectActionGroupViewControllerListSectionController *)v24 setCellRegistration:v25];

    id v9 = v27;
  }

  return v11;
}

void __103__PKCombinedSelectActionGroupViewControllerListSectionController_initWithIdentifier_pass_actionGroups___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = (void *)MEMORY[0x1E4FB1948];
  id v7 = a4;
  id v8 = [v6 subtitleCellConfiguration];
  id v9 = [v7 actionGroup];
  id v10 = [v9 title];
  v22 = [v9 actionGroupDescription];
  PKCommutePlanFormatTitleFromLabelAndValue();
  id v11 = v10;

  id v12 = v22;
  [v8 setText:v11];
  [v8 setSecondaryText:v12];
  id v13 = [v8 textProperties];
  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v13 setColor:v14];

  uint64_t v15 = [v8 secondaryTextProperties];
  uint64_t v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v15 setColor:v16];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  [v5 setContentConfiguration:v8];
  uint64_t v17 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  uint64_t v18 = PKProvisioningSecondaryBackgroundColor();
  [v17 setBackgroundColor:v18];

  [v5 setBackgroundConfiguration:v17];
  LODWORD(v18) = [v7 isInPreflight];

  if (v18)
  {
    id v19 = +[PKCellAccessoryLoadingIndicator accessory];
    v24[0] = v19;
    uint64_t v20 = (id *)v24;
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    id v23 = v19;
    uint64_t v20 = &v23;
  }
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v5 setAccessories:v21];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_actionGroupViewModels];

  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  [v4 setIsInPreflight:1];
  id v5 = [(PKCombinedSelectActionGroupViewControllerListSectionController *)self delegate];
  [v5 reloadItem:v4 animated:1];
  v6 = [v4 actionGroup];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKCombinedSelectActionGroupViewControllerListSectionController_didSelectItem___block_invoke;
  v9[3] = &unk_1E59CA870;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v7 didSelectActionGroup:v6 completion:v9];
}

uint64_t __80__PKCombinedSelectActionGroupViewControllerListSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsInPreflight:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 reloadItem:v3 animated:1];
}

- (id)defaultListLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  uint64_t v3 = PKProvisioningBackgroundColor();
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  v6 = [(PKCombinedSelectActionGroupViewControllerListSectionController *)self defaultListLayout];
  [v6 setHeaderMode:1];
  id v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (PKCombinedSelectActionGroupViewControllerListSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCombinedSelectActionGroupViewControllerListSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_actionGroupViewModels, 0);
}

@end