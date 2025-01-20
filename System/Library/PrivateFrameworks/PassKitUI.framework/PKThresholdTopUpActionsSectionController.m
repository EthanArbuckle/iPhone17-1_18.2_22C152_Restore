@interface PKThresholdTopUpActionsSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (NSArray)identifiers;
- (NSString)cancelTitle;
- (PKThresholdTopUpActionsSectionController)initWithExistingThresholdTopUp:(BOOL)a3 delegate:(id)a4;
- (id)cellRegistrationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setCancelTitle:(id)a3;
@end

@implementation PKThresholdTopUpActionsSectionController

- (PKThresholdTopUpActionsSectionController)initWithExistingThresholdTopUp:(BOOL)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PKThresholdTopUpActionsSectionController;
  v7 = [(PKThresholdTopUpActionsSectionController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_existingThresholdTopUp = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (void)setCancelTitle:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTitle, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:1];
}

- (NSArray)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"thresholdActions";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  v4 = [a3 identifier];
  v5 = v4;
  BOOL v7 = v4 != @"cancel"
    && (!v4 || (int v6 = [(__CFString *)v4 isEqualToString:@"cancel"], v5, !v6))
    || !self->_cancelInProgress;

  return v7;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  int v6 = v5;
  if (v5 == @"cancel"
    || v5 && (int v7 = [(__CFString *)v5 isEqualToString:@"cancel"], v6, v7))
  {
    self->_cancelInProgress = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectCells];

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 reloadDataAnimated:1];

    objc_initWeak(&location, self);
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke;
    v11[3] = &unk_1E59CB100;
    objc_copyWeak(&v12, &location);
    [v10 performedCancelWithCompletion:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 24) = 0;
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 2);
    [v2 reloadDataAnimated:1];

    id WeakRetained = v3;
  }
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  int v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"thresholdActions"
    || v7
    && (int v9 = [(__CFString *)v7 isEqualToString:@"thresholdActions"], v8, v9))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (self->_existingThresholdTopUp && [(NSString *)self->_cancelTitle length])
    {
      v11 = [[PKThresholdTopUpActionItem alloc] initWithIdentifier:@"cancel"];
      [v10 addObject:v11];
    }
    id v12 = (void *)[v10 copy];
    [v6 appendItems:v12];
  }

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = objc_opt_class();
  id v6 = (void *)MEMORY[0x1E4FB1578];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKThresholdTopUpActionsSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59DB0E8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  int v7 = [v6 registrationWithCellClass:v5 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __68__PKThresholdTopUpActionsSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v9 = [v7 identifier];
    id v10 = v9;
    if (v9 == @"cancel"
      || v9 && (int v11 = [(__CFString *)v9 isEqualToString:@"cancel"], v10, v11))
    {
      id v12 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
      [v12 setText:*(void *)(*(void *)(a1 + 32) + 32)];
      v13 = [v12 textProperties];
      if (*(unsigned char *)(*(void *)(a1 + 32) + 24)) {
        [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      else {
      v14 = [MEMORY[0x1E4FB1618] systemRedColor];
      }
      [v13 setColor:v14];

      [v6 setContentConfiguration:v12];
      if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
      {
        v15 = +[PKCellAccessoryLoadingIndicator accessory];
        v17[0] = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
        [v6 setAccessories:v16];
      }
      else
      {
        [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
      }
    }
  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1558];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAppearance:2];
  id v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTitle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end