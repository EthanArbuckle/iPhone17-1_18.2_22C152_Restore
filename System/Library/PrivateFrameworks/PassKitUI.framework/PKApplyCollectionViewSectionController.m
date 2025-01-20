@interface PKApplyCollectionViewSectionController
- (BOOL)_hasFooterContentForIdentifier:(id)a3;
- (BOOL)_hasHeaderContentForIdentifier:(id)a3;
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)footerViewClassForSectionIdentifier:(id)a3;
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (PKApplyCollectionViewSectionController)initWithController:(id)a3 applyPage:(id)a4;
- (PKApplyCollectionViewSectionControllerDelegate)dynamicCollectionDelegate;
- (PKApplyController)controller;
- (PKDynamicProvisioningPageContent)page;
- (id)cellRegistrationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)setDynamicCollectionDelegate:(id)a3;
- (void)setPage:(id)a3;
@end

@implementation PKApplyCollectionViewSectionController

- (PKApplyCollectionViewSectionController)initWithController:(id)a3 applyPage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplyCollectionViewSectionController;
  v9 = [(PKPaymentSetupListSectionController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    objc_storeStrong((id *)&v10->_page, a4);
  }

  return v10;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  return 0;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  return 0;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  if ([(PKApplyCollectionViewSectionController *)self _hasHeaderContentForIdentifier:v5])
  {
    [v6 setHeaderMode:1];
  }
  if ([(PKApplyCollectionViewSectionController *)self _hasFooterContentForIdentifier:v5])
  {
    [v6 setFooterMode:1];
  }

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v6 = [v4 cellClass];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKApplyCollectionViewSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59DE718;
  objc_copyWeak(&v10, &location);
  id v7 = [v5 registrationWithCellClass:v6 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __66__PKApplyCollectionViewSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained configureCellForRegistration:v7 item:v6];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentSetupListSectionController *)self identifiers];
  v9 = [v8 firstObject];
  id v10 = v6;
  id v11 = v9;
  objc_super v12 = v11;
  double v13 = 0.0;
  if (v11 != v10)
  {
    double v13 = 15.0;
    if (v10)
    {
      if (v11)
      {
        if ([v10 isEqualToString:v11]) {
          double v13 = 0.0;
        }
        else {
          double v13 = 15.0;
        }
      }
    }
  }

  [(PKApplyCollectionViewSectionController *)self _hasFooterContentForIdentifier:v10];
  v14 = [(PKApplyCollectionViewSectionController *)self listLayoutConfigurationWithLayoutEnvironment:v7 sectionIdentifier:v10];
  v15 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v14 layoutEnvironment:v7];

  [v15 contentInsets];
  [v15 setContentInsets:v13];

  return v15;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKApplyCollectionViewSectionController *)self headerViewClassForSectionIdentifier:v7];
  v9 = [(PKApplyCollectionViewSectionController *)self footerViewClassForSectionIdentifier:v7];
  if ((id)*MEMORY[0x1E4FB2770] != v6 || v8 == 0)
  {
    if ((id)*MEMORY[0x1E4FB2760] != v6 || v9 == 0) {
      objc_opt_class();
    }
    else {
    uint64_t v12 = [(PKApplyCollectionViewSectionController *)self footerViewClassForSectionIdentifier:v7];
    }
  }
  else
  {
    uint64_t v12 = [(PKApplyCollectionViewSectionController *)self headerViewClassForSectionIdentifier:v7];
  }
  double v13 = (void *)v12;

  return (Class)v13;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((id)*MEMORY[0x1E4FB2770] == v8)
  {
    id v10 = [(PKPaymentSetupListSectionController *)self headerAttributedStringForIdentifier:v9];
    if ([(PKApplyCollectionViewSectionController *)self headerViewClassForSectionIdentifier:v9])
    {
      [(PKApplyCollectionViewSectionController *)self configureHeaderView:v23 forSectionIdentifier:v9];
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    id v11 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
    [v11 setAttributedText:v10];
    uint64_t v12 = [(PKPaymentSetupListSectionController *)self identifiers];
    double v13 = [v12 firstObject];
    id v14 = v9;
    id v15 = v13;
    v16 = v15;
    if (v15 == v14)
    {
      double v18 = 10.0;
      double v17 = 10.0;
    }
    else
    {
      double v17 = 0.0;
      double v18 = 30.0;
      if (v14 && v15)
      {
        int v19 = [v14 isEqualToString:v15];
        if (v19) {
          double v17 = 10.0;
        }
        else {
          double v17 = 0.0;
        }
        if (v19) {
          double v18 = 10.0;
        }
        else {
          double v18 = 30.0;
        }
      }
    }

    v22 = v11;
    double v20 = v18;
    double v21 = v17;
LABEL_21:
    objc_msgSend(v22, "setDirectionalLayoutMargins:", v20, 0.0, v21, 0.0);
    [v23 setContentConfiguration:v11];

    goto LABEL_22;
  }
  if ((id)*MEMORY[0x1E4FB2760] != v8) {
    goto LABEL_23;
  }
  id v10 = [(PKPaymentSetupListSectionController *)self footerAttributedStringForIdentifier:v9];
  if (![(PKApplyCollectionViewSectionController *)self footerViewClassForSectionIdentifier:v9])
  {
    if (!v10) {
      goto LABEL_22;
    }
    id v11 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
    [v11 setAttributedText:v10];
    double v20 = 10.0;
    double v21 = 10.0;
    v22 = v11;
    goto LABEL_21;
  }
  [(PKApplyCollectionViewSectionController *)self configureFooterView:v23 forSectionIdentifier:v9];
LABEL_22:

LABEL_23:
}

- (void)didSelectItem:(id)a3
{
  id v8 = a3;
  int v4 = [v8 conformsToProtocol:&unk_1EF30C200];
  id v5 = v8;
  if (v4)
  {
    id v6 = v8;
    if (objc_opt_respondsToSelector())
    {
      [v6 handleCellSelection];
      id v7 = [(PKApplyCollectionViewSectionController *)self dynamicCollectionDelegate];
      [v7 deselectCells];
    }
    id v5 = v8;
  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1EF30C200])
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector()) {
      char v5 = [v4 shouldHighlightItem];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_hasHeaderContentForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(PKApplyCollectionViewSectionController *)self headerViewClassForSectionIdentifier:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(PKPaymentSetupListSectionController *)self headerAttributedStringForIdentifier:v4];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)_hasFooterContentForIdentifier:(id)a3
{
  id v4 = a3;
  if ([(PKApplyCollectionViewSectionController *)self footerViewClassForSectionIdentifier:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(PKPaymentSetupListSectionController *)self footerAttributedStringForIdentifier:v4];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (PKApplyController)controller
{
  return self->_controller;
}

- (PKDynamicProvisioningPageContent)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
}

- (PKApplyCollectionViewSectionControllerDelegate)dynamicCollectionDelegate
{
  return self->_dynamicCollectionDelegate;
}

- (void)setDynamicCollectionDelegate:(id)a3
{
  self->_dynamicCollectionDelegate = (PKApplyCollectionViewSectionControllerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end