@interface PKPayLaterSectionController
- (BOOL)_hasFooterContentForIdentifier:(id)a3;
- (BOOL)_hasHeaderContentForIdentifier:(id)a3;
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)footerViewClassForSectionIdentifier:(id)a3;
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSDirectionalEdgeInsets)firstSectionHeaderEdgeInsets;
- (PKAccount)payLaterAccount;
- (PKPayLaterDynamicContentPage)dynamicContentPage;
- (PKPayLaterSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 viewControllerDelegate:(id)a5;
- (PKPayLaterSectionControllerDelegate)dynamicCollectionDelegate;
- (PKPayLaterViewControllerDelegate)viewControllerDelegate;
- (double)headerViewHeight;
- (id)cellRegistrationForItem:(id)a3;
- (id)contextMenuConfigurationForItem:(id)a3;
- (id)contextMenuForPayLaterItem:(id)a3;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)didTapHyperLink:(id)a3;
- (void)setDynamicCollectionDelegate:(id)a3;
- (void)setPayLaterAccount:(id)a3;
@end

@implementation PKPayLaterSectionController

- (PKPayLaterSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 viewControllerDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (PKPayLaterViewControllerDelegate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterSectionController;
  v12 = [(PKPaymentSetupListSectionController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payLaterAccount, a3);
    objc_storeStrong((id *)&v13->_dynamicContentPage, a4);
    v13->_viewControllerDelegate = v11;
  }

  return v13;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(PKPaymentSetupListSectionController *)self identifiers];
    unint64_t v6 = [v5 indexOfObject:v4];

    v7 = [(PKPayLaterSectionController *)self dynamicContentPage];
    v8 = [v7 sections];

    if (v6 > 0x7FFFFFFFFFFFFFFELL || v6 >= [v8 count])
    {
      id v10 = 0;
    }
    else
    {
      id v9 = [v8 objectAtIndexedSubscript:v6];
      id v10 = [v9 footerContent];
      v11 = [v10 footerText];

      if (!v11)
      {

        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  return 0;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  v3 = [(PKPayLaterSectionController *)self footerContentForSectionIdentifier:a3];
  if (v3)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKPayLaterSectionController *)self footerContentForSectionIdentifier:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_initWeak(&location, self);
      id v9 = v6;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __72__PKPayLaterSectionController_configureFooterView_forSectionIdentifier___block_invoke;
      objc_super v15 = &unk_1E59CC0E8;
      objc_copyWeak(&v16, &location);
      id v10 = +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:v8 linkTapped:&v12];
      v11 = objc_msgSend(v8, "footerText", v12, v13, v14, v15);
      [v9 setText:v11];

      [v9 setTextAlignment:4];
      [v9 setSources:v10];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __72__PKPayLaterSectionController_configureFooterView_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didTapHyperLink:v5];
  }
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 backgroundConfiguration];
  if (v6)
  {
    [v8 setBackgroundConfiguration:v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    [v8 setBackgroundConfiguration:v7];
  }
  [v5 configureCell:v8];
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  if ([(PKPayLaterSectionController *)self _hasHeaderContentForIdentifier:v5]) {
    [v6 setHeaderMode:1];
  }
  if ([(PKPayLaterSectionController *)self _hasFooterContentForIdentifier:v5]) {
    [v6 setFooterMode:1];
  }

  return v6;
}

- (void)didTapHyperLink:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v5 didTapHyperLink:v4];
}

- (double)headerViewHeight
{
  return 0.0;
}

- (id)contextMenuForPayLaterItem:(id)a3
{
  return 0;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v6 = [v4 cellClass];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PKPayLaterSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59CD6A8;
  objc_copyWeak(&v10, &location);
  id v7 = [v5 registrationWithCellClass:v6 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __55__PKPayLaterSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  id v9 = [v8 firstObject];
  id v10 = v6;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v11 == v10)
  {
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
    if (v10 && v11) {
      int v13 = [v10 isEqualToString:v11];
    }
  }

  [(PKPayLaterSectionController *)self _hasFooterContentForIdentifier:v10];
  BOOL v14 = [(PKPayLaterSectionController *)self _hasHeaderContentForIdentifier:v10];
  objc_super v15 = [(PKPayLaterSectionController *)self listLayoutConfigurationWithLayoutEnvironment:v7 sectionIdentifier:v10];
  id v16 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v15 layoutEnvironment:v7];

  [v16 contentInsets];
  double v17 = 15.0;
  if (v14) {
    double v17 = 8.0;
  }
  if (v13) {
    double v17 = 0.0;
  }
  [v16 setContentInsets:v17];

  return v16;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPayLaterSectionController *)self headerViewClassForSectionIdentifier:v7];
  id v9 = [(PKPayLaterSectionController *)self footerViewClassForSectionIdentifier:v7];
  if ((id)*MEMORY[0x1E4FB2770] != v6 || v8 == 0)
  {
    if ((id)*MEMORY[0x1E4FB2760] != v6 || v9 == 0) {
      objc_opt_class();
    }
    else {
    uint64_t v12 = [(PKPayLaterSectionController *)self footerViewClassForSectionIdentifier:v7];
    }
  }
  else
  {
    uint64_t v12 = [(PKPayLaterSectionController *)self headerViewClassForSectionIdentifier:v7];
  }
  int v13 = (void *)v12;

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
    if ([(PKPayLaterSectionController *)self headerViewClassForSectionIdentifier:v9])
    {
      [(PKPayLaterSectionController *)self configureHeaderView:v23 forSectionIdentifier:v9];
      goto LABEL_20;
    }
    if (!v10) {
      goto LABEL_20;
    }
    id v11 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
    [v11 setAttributedText:v10];
    uint64_t v12 = [(PKPaymentSetupListSectionController *)self identifiers];
    int v13 = [v12 firstObject];
    id v14 = v9;
    id v15 = v13;
    if (v15 == v14)
    {
    }
    else
    {
      id v16 = v15;
      if (!v14 || !v15)
      {

LABEL_18:
        double v21 = 0.0;
        double v19 = 36.0;
        double v20 = 0.0;
        double v22 = 0.0;
        goto LABEL_19;
      }
      char v17 = [v14 isEqualToString:v15];

      if ((v17 & 1) == 0) {
        goto LABEL_18;
      }
    }
    [(PKPayLaterSectionController *)self firstSectionHeaderEdgeInsets];
LABEL_19:
    objc_msgSend(v11, "setDirectionalLayoutMargins:", v19, v20, v21, v22);
    [(PKPaymentSetupListSectionController *)self applyHeaderConfigurationProperties:v11 sectionIdentifier:v14];
    [v23 setContentConfiguration:v11];

    goto LABEL_20;
  }
  if ((id)*MEMORY[0x1E4FB2760] != v8) {
    goto LABEL_21;
  }
  id v10 = [(PKPaymentSetupListSectionController *)self footerAttributedStringForIdentifier:v9];
  if ([(PKPayLaterSectionController *)self footerViewClassForSectionIdentifier:v9])
  {
    [(PKPayLaterSectionController *)self configureFooterView:v23 forSectionIdentifier:v9];
  }
  else if (v10)
  {
    v18 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
    [v18 setAttributedText:v10];
    objc_msgSend(v18, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    [v23 setContentConfiguration:v18];
  }
LABEL_20:

LABEL_21:
}

- (NSDirectionalEdgeInsets)firstSectionHeaderEdgeInsets
{
  double v2 = 16.0;
  double v3 = 0.0;
  double v4 = 10.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EF30C920])
  {
    id v5 = v4;
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __45__PKPayLaterSectionController_didSelectItem___block_invoke;
    id v10 = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    id v6 = (void (**)(void))_Block_copy(&v7);
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v5, "handleCellSelectionWithContinueBlock:", v6, v7, v8, v9, v10);
    }
    else if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v5, "handleCellSelection", v7, v8, v9, v10);
      v6[2](v6);
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __45__PKPayLaterSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    double v2 = [WeakRetained dynamicCollectionDelegate];
    [v2 deselectCells];

    id WeakRetained = v3;
  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1EF30C920])
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

- (id)contextMenuConfigurationForItem:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EF30C920])
  {
    char v5 = [(PKPayLaterSectionController *)self contextMenuForPayLaterItem:v4];
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
  if ([(PKPayLaterSectionController *)self headerViewClassForSectionIdentifier:v4])
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
  if ([(PKPayLaterSectionController *)self footerViewClassForSectionIdentifier:v4])
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

- (PKPayLaterSectionControllerDelegate)dynamicCollectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicCollectionDelegate);

  return (PKPayLaterSectionControllerDelegate *)WeakRetained;
}

- (void)setDynamicCollectionDelegate:(id)a3
{
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterAccount:(id)a3
{
}

- (PKPayLaterDynamicContentPage)dynamicContentPage
{
  return self->_dynamicContentPage;
}

- (PKPayLaterViewControllerDelegate)viewControllerDelegate
{
  return self->_viewControllerDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);

  objc_destroyWeak((id *)&self->_dynamicCollectionDelegate);
}

@end