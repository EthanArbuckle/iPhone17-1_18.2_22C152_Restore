@interface PKCombinedSelectActionViewControllerListSectionController
- (PKCombinedSelectActionViewControllerListSectionController)initWithIdentifier:(id)a3 pass:(id)a4 actions:(id)a5;
- (PKCombinedSelectActionViewControllerListSectionControllerDelegate)delegate;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)defaultListLayout;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKCombinedSelectActionViewControllerListSectionController

- (PKCombinedSelectActionViewControllerListSectionController)initWithIdentifier:(id)a3 pass:(id)a4 actions:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKCombinedSelectActionViewControllerListSectionController;
  v11 = [(PKCombinedSelectActionViewControllerListSectionController *)&v34 init];
  if (v11)
  {
    id v27 = v8;
    v36[0] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    [(PKDynamicListSectionController *)v11 setIdentifiers:v12];

    [(PKDynamicListSectionController *)v11 setHeaderText:@" "];
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
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[PKPaymentPassActionViewModel alloc] initWithAction:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [v13 copy];
    actionViewModels = v11->_actionViewModels;
    v11->_actionViewModels = (NSArray *)v20;

    objc_storeStrong((id *)&v11->_pass, a4);
    v22 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v23 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __93__PKCombinedSelectActionViewControllerListSectionController_initWithIdentifier_pass_actions___block_invoke;
    v28[3] = &unk_1E59DC7E8;
    v24 = v11;
    v29 = v24;
    v25 = [v22 registrationWithCellClass:v23 configurationHandler:v28];
    [(PKCombinedSelectActionViewControllerListSectionController *)v24 setCellRegistration:v25];

    id v8 = v27;
  }

  return v11;
}

void __93__PKCombinedSelectActionViewControllerListSectionController_initWithIdentifier_pass_actions___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  v22 = [v6 action];
  v7 = [v22 associatedPlan];
  id v8 = [v7 title];
  id v9 = [v8 label];
  uint64_t v23 = [v8 value];
  PKCommutePlanFormatTitleFromLabelAndValue();
  id v10 = v9;

  id v11 = v23;
  v12 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  [v12 setText:v10];
  [v12 setSecondaryText:v11];
  id v13 = [v12 textProperties];
  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v13 setColor:v14];

  uint64_t v15 = [v12 secondaryTextProperties];
  uint64_t v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v15 setColor:v16];

  objc_msgSend(v12, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  [v5 setContentConfiguration:v12];
  uint64_t v17 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v18 = PKProvisioningSecondaryBackgroundColor();
  [v17 setBackgroundColor:v18];

  [v5 setBackgroundConfiguration:v17];
  LODWORD(v18) = [v6 isInPreflight];

  if (v18)
  {
    id v19 = +[PKCellAccessoryLoadingIndicator accessory];
    v25[0] = v19;
    uint64_t v20 = (id *)v25;
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    id v24 = v19;
    uint64_t v20 = &v24;
  }
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v5 setAccessories:v21];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_actionViewModels];

  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  [v4 setIsInPreflight:1];
  id v5 = [(PKCombinedSelectActionViewControllerListSectionController *)self delegate];
  [v5 reloadItem:v4 animated:1];
  id v6 = [v4 action];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKCombinedSelectActionViewControllerListSectionController_didSelectItem___block_invoke;
  v9[3] = &unk_1E59CA870;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v7 didSelectAction:v6 completion:v9];
}

uint64_t __75__PKCombinedSelectActionViewControllerListSectionController_didSelectItem___block_invoke(uint64_t a1)
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
  id v6 = [(PKCombinedSelectActionViewControllerListSectionController *)self defaultListLayout];
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

- (PKCombinedSelectActionViewControllerListSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCombinedSelectActionViewControllerListSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_actionViewModels, 0);
}

@end