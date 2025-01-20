@interface PKApplyConfirmInfoSectionController
- (Class)footerViewClassForSectionIdentifier:(id)a3;
- (PKApplyConfirmInfoSectionController)initWithController:(id)a3 applyPage:(id)a4 delegate:(id)a5;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureContentSection:(id)a3;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4;
- (void)setPage:(id)a3;
@end

@implementation PKApplyConfirmInfoSectionController

- (PKApplyConfirmInfoSectionController)initWithController:(id)a3 applyPage:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyConfirmInfoSectionController;
  v10 = [(PKApplyCollectionViewSectionController *)&v15 initWithController:a3 applyPage:v8];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    uint64_t v12 = [v8 actionContent];
    actionContent = v11->_actionContent;
    v11->_actionContent = (PKApplyActionContent *)v12;
  }
  return v11;
}

- (void)setPage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKApplyConfirmInfoSectionController;
  id v4 = a3;
  [(PKApplyCollectionViewSectionController *)&v7 setPage:v4];
  objc_msgSend(v4, "actionContent", v7.receiver, v7.super_class);
  v5 = (PKApplyActionContent *)objc_claimAutoreleasedReturnValue();

  actionContent = self->_actionContent;
  self->_actionContent = v5;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyConfirmInfoSectionController;
  [(PKApplyCollectionViewSectionController *)&v9 configureCellForRegistration:v6 item:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    id v8 = +[PKApplyActionContentActionItemCell backgroundColor];
    [v7 setBackgroundColor:v8];

    [v6 setBackgroundConfiguration:v7];
  }
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kContentSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"kContentSection"
    || v4
    && (int v6 = [(__CFString *)v4 isEqualToString:@"kContentSection"], v5, v6))
  {
    objc_super v7 = [(PKApplyActionContent *)self->_actionContent footerContent];

    if (v7)
    {
      objc_super v7 = objc_opt_class();
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return (Class)v7;
}

- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKApplyActionContent *)self->_actionContent footerContent];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (__CFString *)v7;
      if (v9 == @"kContentSection"
        || (v10 = v9) != 0
        && (int v11 = [(__CFString *)v9 isEqualToString:@"kContentSection"],
            v10,
            v11))
      {
        objc_initWeak(&location, self);
        id v12 = v6;
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        v17 = __80__PKApplyConfirmInfoSectionController_configureFooterView_forSectionIdentifier___block_invoke;
        v18 = &unk_1E59CC0E8;
        objc_copyWeak(&v19, &location);
        v13 = +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:v8 linkTapped:&v15];
        v14 = objc_msgSend(v8, "footerText", v15, v16, v17, v18);
        [v12 setText:v14];

        [v12 setTextAlignment:4];
        [v12 setSources:v13];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __80__PKApplyConfirmInfoSectionController_configureFooterView_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 12);
    [v5 didTapFooterLink:v6];
  }
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = (__CFString *)v5;
  id v8 = v7;
  if (v7 == @"kContentSection"
    || v7
    && (int v9 = [(__CFString *)v7 isEqualToString:@"kContentSection"], v8, v9))
  {
    [(PKApplyConfirmInfoSectionController *)self _configureContentSection:v6];
  }

  return v6;
}

- (void)_configureContentSection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PKApplyActionContent *)self->_actionContent actionItems];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * v7);
        objc_initWeak(&location, self);
        int v9 = [PKApplyActionContentActionItemRow alloc];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __64__PKApplyConfirmInfoSectionController__configureContentSection___block_invoke;
        v14[3] = &unk_1E59CB010;
        objc_copyWeak(&v15, &location);
        v14[4] = v8;
        v10 = [(PKApplyActionContentActionItemRow *)v9 initWithApplyActionContentActionItem:v8 selectionHandler:v14];
        [v4 safelyAddObject:v10];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  int v11 = (void *)[v4 copy];
  [v12 appendItems:v11];
}

void __64__PKApplyConfirmInfoSectionController__configureContentSection___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 12);
    [v3 didSelectActionItem:*(void *)(a1 + 32)];

    WeakRetained = v4;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionContent, 0);
}

@end