@interface PKApplyPrimaryActionSectionController
- (BOOL)primaryButtonLoading;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureContentSection:(id)a3;
- (void)setPrimaryButtonLoading:(BOOL)a3;
@end

@implementation PKApplyPrimaryActionSectionController

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"primaryAction";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"primaryAction"
    || v7 && (int v9 = [(__CFString *)v7 isEqualToString:@"primaryAction"], v8, v9))
  {
    [(PKApplyPrimaryActionSectionController *)self _configureContentSection:v6];
  }

  return v6;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyPrimaryActionSectionController;
  v4 = [(PKApplyCollectionViewSectionController *)&v6 listLayoutConfigurationWithLayoutEnvironment:a3 sectionIdentifier:a4];
  [v4 setItemSeparatorHandler:&__block_literal_global_149];

  return v4;
}

id __104__PKApplyPrimaryActionSectionController_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (![a2 row]) {
    [v4 setBottomSeparatorVisibility:2];
  }

  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v8 = v7;
  if (v7 == @"primaryAction")
  {
    int v9 = 1;
  }
  else if (v7)
  {
    int v9 = [(__CFString *)v7 isEqualToString:@"primaryAction"];
  }
  else
  {
    int v9 = 0;
  }

  v13.receiver = self;
  v13.super_class = (Class)PKApplyPrimaryActionSectionController;
  v10 = [(PKApplyCollectionViewSectionController *)&v13 layoutWithLayoutEnvironment:v6 sectionIdentifier:v8];
  [v10 contentInsets];
  if (v9) {
    double v11 = 16.0;
  }
  [v10 setContentInsets:v11];

  return v10;
}

- (void)_configureContentSection:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [PKApplyPrimaryActionRow alloc];
  id v6 = [(PKApplyCollectionViewSectionController *)self page];
  v7 = [v6 primaryActionTitle];
  v8 = [(PKApplyPrimaryActionRow *)v5 initWithTitle:v7];

  [(PKApplyPrimaryActionRow *)v8 setLoading:self->_primaryButtonLoading];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __66__PKApplyPrimaryActionSectionController__configureContentSection___block_invoke;
  objc_super v13 = &unk_1E59D89B0;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [(PKApplyPrimaryActionRow *)v8 setAction:&v10];
  v18[0] = v8;
  int v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1, v10, v11, v12, v13);
  [v4 appendItems:v9];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __66__PKApplyPrimaryActionSectionController__configureContentSection___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [WeakRetained dynamicCollectionDelegate];
    if (v3)
    {
      [v2 setLoading:1];
      WeakRetained[88] = 1;
      [v3 primaryButtonTapped];
    }
  }
}

- (BOOL)primaryButtonLoading
{
  return self->_primaryButtonLoading;
}

- (void)setPrimaryButtonLoading:(BOOL)a3
{
  self->_primaryButtonLoading = a3;
}

@end