@interface PKAccountSupportTopicExplanationLinkSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKAccountSupportTopicExplanationLinkSectionController)initWithLink:(id)a3 delegate:(id)a4;
- (id)_decorateListCell:(id)a3 forExplanationLink:(id)a4;
- (id)cellRegistrationForItem:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
@end

@implementation PKAccountSupportTopicExplanationLinkSectionController

- (PKAccountSupportTopicExplanationLinkSectionController)initWithLink:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountSupportTopicExplanationLinkSectionController;
  v9 = [(PKPaymentSetupListSectionController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    if (v7)
    {
      if ([v8 shouldShowSupportLink:v7]) {
        objc_storeStrong((id *)&v10->_link, a3);
      }
    }
  }

  return v10;
}

- (void)didSelectItem:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained deselectCells];

    id v6 = v8;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 openSupportLink:v6];
  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v6 = v5;
  if (self->_link)
  {
    v9[0] = self->_link;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 appendItems:v7];
  }
  else
  {
    [v5 appendItems:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __81__PKAccountSupportTopicExplanationLinkSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59DA8F0;
  objc_copyWeak(&v10, &location);
  id v7 = [v5 registrationWithCellClass:v6 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __81__PKAccountSupportTopicExplanationLinkSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = (id)[WeakRetained _decorateListCell:v9 forExplanationLink:v6];
}

- (id)_decorateListCell:(id)a3 forExplanationLink:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 valueCellConfiguration];
  id v9 = [v6 text];

  [v8 setText:v9];
  id v10 = [v8 textProperties];
  v11 = [MEMORY[0x1E4FB1618] tintColor];
  [v10 setColor:v11];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 12.0, 0.0, 12.0, 0.0);
  [v7 setContentConfiguration:v8];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end