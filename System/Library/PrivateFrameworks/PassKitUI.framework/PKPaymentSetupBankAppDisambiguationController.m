@interface PKPaymentSetupBankAppDisambiguationController
- (PKPaymentSetupBankAppDisambiguationController)initWithPaymentSetupProduct:(id)a3;
- (PKPaymentSetupBankAppDisambiguationControllerDelegate)delegate;
- (id)_listItemWithName:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_updateItemWithIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentSetupBankAppDisambiguationController

- (PKPaymentSetupBankAppDisambiguationController)initWithPaymentSetupProduct:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKPaymentSetupBankAppDisambiguationController;
  v6 = [(PKPaymentSetupListSectionController *)&v43 init];
  v7 = v6;
  if (v6)
  {
    id v34 = v5;
    p_paymentSetupProduct = (id *)&v6->_paymentSetupProduct;
    objc_storeStrong((id *)&v6->_paymentSetupProduct, a3);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inAppItemIdentifierToItemMapping = v7->_inAppItemIdentifierToItemMapping;
    v7->_inAppItemIdentifierToItemMapping = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cameraItemIdentifierToItemMapping = v7->_cameraItemIdentifierToItemMapping;
    v7->_cameraItemIdentifierToItemMapping = v11;

    v13 = [*p_paymentSetupProduct supportedInAppTypes];
    v14 = [*p_paymentSetupProduct supportedCameraCaptureTypes];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [(PKPaymentSetupBankAppDisambiguationController *)v7 _listItemWithName:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          [(NSMutableArray *)v7->_inAppItemIdentifierToItemMapping addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v17);
    }

    v21 = v7->_inAppItemIdentifierToItemMapping;
    v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
    v46 = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [(NSMutableArray *)v21 sortUsingDescriptors:v23];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v14;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [(PKPaymentSetupBankAppDisambiguationController *)v7 _listItemWithName:*(void *)(*((void *)&v35 + 1) + 8 * j)];
          [(NSMutableArray *)v7->_cameraItemIdentifierToItemMapping addObject:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v26);
    }

    v30 = v7->_cameraItemIdentifierToItemMapping;
    v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
    v44 = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [(NSMutableArray *)v30 sortUsingDescriptors:v32];

    id v5 = v34;
  }

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v6 addObjectsFromArray:self->_inAppItemIdentifierToItemMapping];
  [v6 addObjectsFromArray:self->_cameraItemIdentifierToItemMapping];
  [v5 appendItems:v6];

  return v5;
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PKPaymentSetupBankAppDisambiguationControllerSectionIdentifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)didSelectItem:(id)a3
{
  v4 = [a3 identifier];
  [(PKPaymentSetupBankAppDisambiguationController *)self _updateItemWithIdentifier:v4 loadingIndicatorVisibility:1];
  inAppItemIdentifierToItemMapping = self->_inAppItemIdentifierToItemMapping;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke;
  v16[3] = &unk_1E59D6660;
  id v6 = v4;
  id v17 = v6;
  int v7 = [(NSMutableArray *)inAppItemIdentifierToItemMapping pk_containsObjectPassingTest:v16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_2;
    v14[3] = &unk_1E59CA870;
    v9 = &v15;
    v14[4] = self;
    id v15 = v6;
    id v10 = v6;
    [WeakRetained didSelectInAppWithCompletion:v14];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_3;
    v12[3] = &unk_1E59CA870;
    v9 = &v13;
    v12[4] = self;
    id v13 = v6;
    id v11 = v6;
    [WeakRetained didSelectCameraWithCompletion:v12];
  }
}

uint64_t __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateItemWithIdentifier:*(void *)(a1 + 40) loadingIndicatorVisibility:0];
}

uint64_t __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateItemWithIdentifier:*(void *)(a1 + 40) loadingIndicatorVisibility:0];
}

- (id)_listItemWithName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [PKPaymentSetupListItem alloc];
  id v5 = PKUIImageNamed(@"PlaceholderCardArt_Small");
  id v6 = [(PKPaymentSetupListItem *)v4 initWithTitle:v3 subtitle:0 icon:v5];

  [(PKPaymentSetupListItem *)v6 setDisplayChevron:1];

  return v6;
}

- (void)_updateItemWithIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = self->_inAppItemIdentifierToItemMapping;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke;
  v21[3] = &unk_1E59D6688;
  id v8 = v6;
  id v22 = v8;
  uint64_t v9 = [(NSMutableArray *)v7 indexOfObjectPassingTest:v21];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = self->_cameraItemIdentifierToItemMapping;

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke_2;
    v19 = &unk_1E59D6688;
    id v20 = v8;
    uint64_t v11 = [(NSMutableArray *)v10 indexOfObjectPassingTest:&v16];

    int v7 = v10;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = v9;
  }
  v12 = -[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v11, v16, v17, v18, v19);
  id v13 = v12;
  if (v12 && [v12 loadingIndicatorVisible] != v4)
  {
    v14 = (void *)[v13 copy];
    [v14 setLoadingIndicatorVisible:v4];
    [(NSMutableArray *)v7 replaceObjectAtIndex:v11 withObject:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadItem:v14 animated:1];
  }
LABEL_9:
}

uint64_t __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (PKPaymentSetupBankAppDisambiguationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupBankAppDisambiguationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraItemIdentifierToItemMapping, 0);
  objc_storeStrong((id *)&self->_inAppItemIdentifierToItemMapping, 0);

  objc_storeStrong((id *)&self->_paymentSetupProduct, 0);
}

@end